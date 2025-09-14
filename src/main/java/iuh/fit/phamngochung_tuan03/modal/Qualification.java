package iuh.fit.phamngochung_tuan03.modal;

public class Qualification {
    private String examination;
    private String board;
    private String percentage;
    private String yearOfPassing;

    public Qualification(){
    }

    public Qualification(String examination, String board, String percentage, String yearOfPassing) {
        this.examination = examination;
        this.board = board;
        this.percentage = percentage;
        this.yearOfPassing = yearOfPassing;
    }

    public String getExamination() {
        return examination;
    }

    public void setExamination(String examination) {
        this.examination = examination;
    }

    public String getBoard() {
        return board;
    }

    public void setBoard(String board) {
        this.board = board;
    }

    public String getPercentage() {
        return percentage;
    }

    public void setPercentage(String percentage) {
        this.percentage = percentage;
    }

    public String getYearOfPassing() {
        return yearOfPassing;
    }

    public void setYearOfPassing(String yearOfPassing) {
        this.yearOfPassing = yearOfPassing;
    }

    @Override
    public String toString() {
        return "Qualification{" +
                "examiination='" + examination + '\'' +
                ", board='" + board + '\'' +
                ", percentage='" + percentage + '\'' +
                ", yearOfPassing='" + yearOfPassing + '\'' +
                '}';
    }
}
