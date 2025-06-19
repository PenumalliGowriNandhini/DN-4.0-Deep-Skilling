using System;

namespace FactoryMethodPatternExample
{
    // Step 1 & 2: Document Interface
    public interface IDocument
    {
        void Open();
    }

    // Step 3: Concrete Document Classes
    public class WordDocument : IDocument
    {
        public void Open()
        {
            Console.WriteLine("Opening Word Document.");
        }
    }

    public class PdfDocument : IDocument
    {
        public void Open()
        {
            Console.WriteLine("Opening PDF Document.");
        }
    }

    public class ExcelDocument : IDocument
    {
        public void Open()
        {
            Console.WriteLine("Opening Excel Document.");
        }
    }

    // Step 4: Abstract Factory
    public abstract class DocumentFactory
    {
        public abstract IDocument CreateDocument();
    }

    // Step 4: Concrete Factory Classes
    public class WordDocumentFactory : DocumentFactory
    {
        public override IDocument CreateDocument()
        {
            return new WordDocument();
        }
    }

    public class PdfDocumentFactory : DocumentFactory
    {
        public override IDocument CreateDocument()
        {
            return new PdfDocument();
        }
    }

    public class ExcelDocumentFactory : DocumentFactory
    {
        public override IDocument CreateDocument()
        {
            return new ExcelDocument();
        }
    }

    // Step 5: Test the Factory Method Implementation
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter document type to open (word/pdf/excel): ");
            string docType = Console.ReadLine()?.Trim().ToLower();

            DocumentFactory factory = docType switch
            {
                "word" => new WordDocumentFactory(),
                "pdf" => new PdfDocumentFactory(),
                "excel" => new ExcelDocumentFactory(),
                _ => null
            };

            if (factory != null)
            {
                IDocument document = factory.CreateDocument();
                document.Open();
            }
            else
            {
                Console.WriteLine("Invalid input. Please enter 'word', 'pdf', or 'excel'.");
            }
        }
    }
}
