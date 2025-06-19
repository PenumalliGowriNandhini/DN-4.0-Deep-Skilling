using System;

// Step 1: Document Interface
public interface IDocument
{
    void Open();
}

// Step 2: Concrete Document Classes
public class WordDocument : IDocument
{
    public void Open()
    {
        Console.WriteLine("Opening a Word Document.");
    }
}

public class PdfDocument : IDocument
{
    public void Open()
    {
        Console.WriteLine("Opening a PDF Document.");
    }
}

public class ExcelDocument : IDocument
{
    public void Open()
    {
        Console.WriteLine("Opening an Excel Document.");
    }
}

// Step 3: Abstract Factory
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

// Step 5: Test the Factory Method
class Program
{
    static void Main(string[] args)
    {
        DocumentFactory wordFactory = new WordDocumentFactory();
        IDocument word = wordFactory.CreateDocument();
        word.Open();

        DocumentFactory pdfFactory = new PdfDocumentFactory();
        IDocument pdf = pdfFactory.CreateDocument();
        pdf.Open();

        DocumentFactory excelFactory = new ExcelDocumentFactory();
        IDocument excel = excelFactory.CreateDocument();
        excel.Open();
    }
}
