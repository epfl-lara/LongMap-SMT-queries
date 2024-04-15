; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102904 () Bool)

(assert start!102904)

(declare-fun b!1236701 () Bool)

(declare-fun e!700894 () Bool)

(declare-datatypes ((List!27318 0))(
  ( (Nil!27315) (Cons!27314 (h!28523 (_ BitVec 64)) (t!40772 List!27318)) )
))
(declare-fun acc!846 () List!27318)

(declare-fun lt!560707 () List!27318)

(declare-fun subseq!572 (List!27318 List!27318) Bool)

(assert (=> b!1236701 (= e!700894 (not (subseq!572 acc!846 lt!560707)))))

(declare-datatypes ((Unit!40877 0))(
  ( (Unit!40878) )
))
(declare-fun lt!560708 () Unit!40877)

(declare-fun subseqTail!59 (List!27318 List!27318) Unit!40877)

(assert (=> b!1236701 (= lt!560708 (subseqTail!59 lt!560707 lt!560707))))

(assert (=> b!1236701 (subseq!572 lt!560707 lt!560707)))

(declare-fun lt!560706 () Unit!40877)

(declare-fun lemmaListSubSeqRefl!0 (List!27318) Unit!40877)

(assert (=> b!1236701 (= lt!560706 (lemmaListSubSeqRefl!0 lt!560707))))

(declare-datatypes ((array!79672 0))(
  ( (array!79673 (arr!38444 (Array (_ BitVec 32) (_ BitVec 64))) (size!38982 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79672)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1236701 (= lt!560707 (Cons!27314 (select (arr!38444 a!3835) from!3213) acc!846))))

(declare-fun b!1236703 () Bool)

(declare-fun res!824724 () Bool)

(assert (=> b!1236703 (=> (not res!824724) (not e!700894))))

(assert (=> b!1236703 (= res!824724 (not (= from!3213 (bvsub (size!38982 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236704 () Bool)

(declare-fun res!824723 () Bool)

(assert (=> b!1236704 (=> (not res!824723) (not e!700894))))

(declare-fun arrayNoDuplicates!0 (array!79672 (_ BitVec 32) List!27318) Bool)

(assert (=> b!1236704 (= res!824723 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236705 () Bool)

(declare-fun res!824720 () Bool)

(assert (=> b!1236705 (=> (not res!824720) (not e!700894))))

(declare-fun contains!7290 (List!27318 (_ BitVec 64)) Bool)

(assert (=> b!1236705 (= res!824720 (not (contains!7290 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236706 () Bool)

(declare-fun res!824721 () Bool)

(assert (=> b!1236706 (=> (not res!824721) (not e!700894))))

(declare-fun noDuplicate!1933 (List!27318) Bool)

(assert (=> b!1236706 (= res!824721 (noDuplicate!1933 acc!846))))

(declare-fun b!1236707 () Bool)

(declare-fun res!824726 () Bool)

(assert (=> b!1236707 (=> (not res!824726) (not e!700894))))

(assert (=> b!1236707 (= res!824726 (not (contains!7290 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236708 () Bool)

(declare-fun res!824722 () Bool)

(assert (=> b!1236708 (=> (not res!824722) (not e!700894))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236708 (= res!824722 (validKeyInArray!0 (select (arr!38444 a!3835) from!3213)))))

(declare-fun b!1236702 () Bool)

(declare-fun res!824725 () Bool)

(assert (=> b!1236702 (=> (not res!824725) (not e!700894))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1236702 (= res!824725 (contains!7290 acc!846 k0!2925))))

(declare-fun res!824719 () Bool)

(assert (=> start!102904 (=> (not res!824719) (not e!700894))))

(assert (=> start!102904 (= res!824719 (and (bvslt (size!38982 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38982 a!3835))))))

(assert (=> start!102904 e!700894))

(declare-fun array_inv!29427 (array!79672) Bool)

(assert (=> start!102904 (array_inv!29427 a!3835)))

(assert (=> start!102904 true))

(assert (= (and start!102904 res!824719) b!1236706))

(assert (= (and b!1236706 res!824721) b!1236705))

(assert (= (and b!1236705 res!824720) b!1236707))

(assert (= (and b!1236707 res!824726) b!1236704))

(assert (= (and b!1236704 res!824723) b!1236702))

(assert (= (and b!1236702 res!824725) b!1236703))

(assert (= (and b!1236703 res!824724) b!1236708))

(assert (= (and b!1236708 res!824722) b!1236701))

(declare-fun m!1140021 () Bool)

(assert (=> b!1236704 m!1140021))

(declare-fun m!1140023 () Bool)

(assert (=> b!1236706 m!1140023))

(declare-fun m!1140025 () Bool)

(assert (=> b!1236707 m!1140025))

(declare-fun m!1140027 () Bool)

(assert (=> start!102904 m!1140027))

(declare-fun m!1140029 () Bool)

(assert (=> b!1236705 m!1140029))

(declare-fun m!1140031 () Bool)

(assert (=> b!1236701 m!1140031))

(declare-fun m!1140033 () Bool)

(assert (=> b!1236701 m!1140033))

(declare-fun m!1140035 () Bool)

(assert (=> b!1236701 m!1140035))

(declare-fun m!1140037 () Bool)

(assert (=> b!1236701 m!1140037))

(declare-fun m!1140039 () Bool)

(assert (=> b!1236701 m!1140039))

(declare-fun m!1140041 () Bool)

(assert (=> b!1236702 m!1140041))

(assert (=> b!1236708 m!1140039))

(assert (=> b!1236708 m!1140039))

(declare-fun m!1140043 () Bool)

(assert (=> b!1236708 m!1140043))

(check-sat (not b!1236702) (not b!1236706) (not b!1236708) (not b!1236704) (not b!1236707) (not start!102904) (not b!1236701) (not b!1236705))
(check-sat)
(get-model)

(declare-fun d!135387 () Bool)

(declare-fun res!824779 () Bool)

(declare-fun e!700912 () Bool)

(assert (=> d!135387 (=> res!824779 e!700912)))

(get-info :version)

(assert (=> d!135387 (= res!824779 ((_ is Nil!27315) acc!846))))

(assert (=> d!135387 (= (noDuplicate!1933 acc!846) e!700912)))

(declare-fun b!1236761 () Bool)

(declare-fun e!700913 () Bool)

(assert (=> b!1236761 (= e!700912 e!700913)))

(declare-fun res!824780 () Bool)

(assert (=> b!1236761 (=> (not res!824780) (not e!700913))))

(assert (=> b!1236761 (= res!824780 (not (contains!7290 (t!40772 acc!846) (h!28523 acc!846))))))

(declare-fun b!1236762 () Bool)

(assert (=> b!1236762 (= e!700913 (noDuplicate!1933 (t!40772 acc!846)))))

(assert (= (and d!135387 (not res!824779)) b!1236761))

(assert (= (and b!1236761 res!824780) b!1236762))

(declare-fun m!1140093 () Bool)

(assert (=> b!1236761 m!1140093))

(declare-fun m!1140095 () Bool)

(assert (=> b!1236762 m!1140095))

(assert (=> b!1236706 d!135387))

(declare-fun b!1236777 () Bool)

(declare-fun e!700928 () Bool)

(assert (=> b!1236777 (= e!700928 (subseq!572 (t!40772 acc!846) (t!40772 lt!560707)))))

(declare-fun b!1236776 () Bool)

(declare-fun e!700927 () Bool)

(declare-fun e!700929 () Bool)

(assert (=> b!1236776 (= e!700927 e!700929)))

(declare-fun res!824793 () Bool)

(assert (=> b!1236776 (=> res!824793 e!700929)))

(assert (=> b!1236776 (= res!824793 e!700928)))

(declare-fun res!824796 () Bool)

(assert (=> b!1236776 (=> (not res!824796) (not e!700928))))

(assert (=> b!1236776 (= res!824796 (= (h!28523 acc!846) (h!28523 lt!560707)))))

(declare-fun b!1236778 () Bool)

(assert (=> b!1236778 (= e!700929 (subseq!572 acc!846 (t!40772 lt!560707)))))

(declare-fun d!135389 () Bool)

(declare-fun res!824794 () Bool)

(declare-fun e!700926 () Bool)

(assert (=> d!135389 (=> res!824794 e!700926)))

(assert (=> d!135389 (= res!824794 ((_ is Nil!27315) acc!846))))

(assert (=> d!135389 (= (subseq!572 acc!846 lt!560707) e!700926)))

(declare-fun b!1236775 () Bool)

(assert (=> b!1236775 (= e!700926 e!700927)))

(declare-fun res!824795 () Bool)

(assert (=> b!1236775 (=> (not res!824795) (not e!700927))))

(assert (=> b!1236775 (= res!824795 ((_ is Cons!27314) lt!560707))))

(assert (= (and d!135389 (not res!824794)) b!1236775))

(assert (= (and b!1236775 res!824795) b!1236776))

(assert (= (and b!1236776 res!824796) b!1236777))

(assert (= (and b!1236776 (not res!824793)) b!1236778))

(declare-fun m!1140097 () Bool)

(assert (=> b!1236777 m!1140097))

(declare-fun m!1140099 () Bool)

(assert (=> b!1236778 m!1140099))

(assert (=> b!1236701 d!135389))

(declare-fun b!1236825 () Bool)

(declare-fun e!700970 () Unit!40877)

(declare-fun Unit!40883 () Unit!40877)

(assert (=> b!1236825 (= e!700970 Unit!40883)))

(declare-fun bm!60975 () Bool)

(declare-fun call!60978 () Unit!40877)

(declare-fun c!120862 () Bool)

(assert (=> bm!60975 (= call!60978 (subseqTail!59 (ite c!120862 lt!560707 (t!40772 lt!560707)) (t!40772 lt!560707)))))

(declare-fun b!1236826 () Bool)

(declare-fun e!700969 () Unit!40877)

(declare-fun e!700968 () Unit!40877)

(assert (=> b!1236826 (= e!700969 e!700968)))

(assert (=> b!1236826 (= c!120862 (subseq!572 lt!560707 (t!40772 lt!560707)))))

(declare-fun d!135395 () Bool)

(declare-fun tail!158 (List!27318) List!27318)

(assert (=> d!135395 (subseq!572 (tail!158 lt!560707) lt!560707)))

(declare-fun lt!560738 () Unit!40877)

(assert (=> d!135395 (= lt!560738 e!700969)))

(declare-fun c!120863 () Bool)

(assert (=> d!135395 (= c!120863 (and ((_ is Cons!27314) lt!560707) ((_ is Cons!27314) lt!560707)))))

(declare-fun e!700971 () Bool)

(assert (=> d!135395 e!700971))

(declare-fun res!824827 () Bool)

(assert (=> d!135395 (=> (not res!824827) (not e!700971))))

(declare-fun isEmpty!1011 (List!27318) Bool)

(assert (=> d!135395 (= res!824827 (not (isEmpty!1011 lt!560707)))))

(assert (=> d!135395 (= (subseqTail!59 lt!560707 lt!560707) lt!560738)))

(declare-fun b!1236827 () Bool)

(assert (=> b!1236827 (= e!700970 call!60978)))

(declare-fun b!1236828 () Bool)

(assert (=> b!1236828 (= e!700971 (subseq!572 lt!560707 lt!560707))))

(declare-fun b!1236829 () Bool)

(declare-fun c!120864 () Bool)

(assert (=> b!1236829 (= c!120864 (not (isEmpty!1011 (t!40772 lt!560707))))))

(assert (=> b!1236829 (= e!700968 e!700970)))

(declare-fun b!1236830 () Bool)

(declare-fun Unit!40884 () Unit!40877)

(assert (=> b!1236830 (= e!700969 Unit!40884)))

(declare-fun b!1236831 () Bool)

(assert (=> b!1236831 (= e!700968 call!60978)))

(assert (= (and d!135395 res!824827) b!1236828))

(assert (= (and d!135395 c!120863) b!1236826))

(assert (= (and d!135395 (not c!120863)) b!1236830))

(assert (= (and b!1236826 c!120862) b!1236831))

(assert (= (and b!1236826 (not c!120862)) b!1236829))

(assert (= (and b!1236829 c!120864) b!1236827))

(assert (= (and b!1236829 (not c!120864)) b!1236825))

(assert (= (or b!1236831 b!1236827) bm!60975))

(assert (=> b!1236828 m!1140035))

(declare-fun m!1140129 () Bool)

(assert (=> d!135395 m!1140129))

(assert (=> d!135395 m!1140129))

(declare-fun m!1140131 () Bool)

(assert (=> d!135395 m!1140131))

(declare-fun m!1140133 () Bool)

(assert (=> d!135395 m!1140133))

(declare-fun m!1140135 () Bool)

(assert (=> bm!60975 m!1140135))

(declare-fun m!1140137 () Bool)

(assert (=> b!1236829 m!1140137))

(declare-fun m!1140139 () Bool)

(assert (=> b!1236826 m!1140139))

(assert (=> b!1236701 d!135395))

(declare-fun b!1236842 () Bool)

(declare-fun e!700980 () Bool)

(assert (=> b!1236842 (= e!700980 (subseq!572 (t!40772 lt!560707) (t!40772 lt!560707)))))

(declare-fun b!1236841 () Bool)

(declare-fun e!700979 () Bool)

(declare-fun e!700981 () Bool)

(assert (=> b!1236841 (= e!700979 e!700981)))

(declare-fun res!824832 () Bool)

(assert (=> b!1236841 (=> res!824832 e!700981)))

(assert (=> b!1236841 (= res!824832 e!700980)))

(declare-fun res!824835 () Bool)

(assert (=> b!1236841 (=> (not res!824835) (not e!700980))))

(assert (=> b!1236841 (= res!824835 (= (h!28523 lt!560707) (h!28523 lt!560707)))))

(declare-fun b!1236843 () Bool)

(assert (=> b!1236843 (= e!700981 (subseq!572 lt!560707 (t!40772 lt!560707)))))

(declare-fun d!135413 () Bool)

(declare-fun res!824833 () Bool)

(declare-fun e!700978 () Bool)

(assert (=> d!135413 (=> res!824833 e!700978)))

(assert (=> d!135413 (= res!824833 ((_ is Nil!27315) lt!560707))))

(assert (=> d!135413 (= (subseq!572 lt!560707 lt!560707) e!700978)))

(declare-fun b!1236840 () Bool)

(assert (=> b!1236840 (= e!700978 e!700979)))

(declare-fun res!824834 () Bool)

(assert (=> b!1236840 (=> (not res!824834) (not e!700979))))

(assert (=> b!1236840 (= res!824834 ((_ is Cons!27314) lt!560707))))

(assert (= (and d!135413 (not res!824833)) b!1236840))

(assert (= (and b!1236840 res!824834) b!1236841))

(assert (= (and b!1236841 res!824835) b!1236842))

(assert (= (and b!1236841 (not res!824832)) b!1236843))

(declare-fun m!1140141 () Bool)

(assert (=> b!1236842 m!1140141))

(assert (=> b!1236843 m!1140139))

(assert (=> b!1236701 d!135413))

(declare-fun d!135415 () Bool)

(assert (=> d!135415 (subseq!572 lt!560707 lt!560707)))

(declare-fun lt!560741 () Unit!40877)

(declare-fun choose!36 (List!27318) Unit!40877)

(assert (=> d!135415 (= lt!560741 (choose!36 lt!560707))))

(assert (=> d!135415 (= (lemmaListSubSeqRefl!0 lt!560707) lt!560741)))

(declare-fun bs!34753 () Bool)

(assert (= bs!34753 d!135415))

(assert (=> bs!34753 m!1140035))

(declare-fun m!1140143 () Bool)

(assert (=> bs!34753 m!1140143))

(assert (=> b!1236701 d!135415))

(declare-fun d!135417 () Bool)

(declare-fun lt!560744 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!583 (List!27318) (InoxSet (_ BitVec 64)))

(assert (=> d!135417 (= lt!560744 (select (content!583 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!700999 () Bool)

(assert (=> d!135417 (= lt!560744 e!700999)))

(declare-fun res!824850 () Bool)

(assert (=> d!135417 (=> (not res!824850) (not e!700999))))

(assert (=> d!135417 (= res!824850 ((_ is Cons!27314) acc!846))))

(assert (=> d!135417 (= (contains!7290 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!560744)))

(declare-fun b!1236862 () Bool)

(declare-fun e!700998 () Bool)

(assert (=> b!1236862 (= e!700999 e!700998)))

(declare-fun res!824851 () Bool)

(assert (=> b!1236862 (=> res!824851 e!700998)))

(assert (=> b!1236862 (= res!824851 (= (h!28523 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1236863 () Bool)

(assert (=> b!1236863 (= e!700998 (contains!7290 (t!40772 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135417 res!824850) b!1236862))

(assert (= (and b!1236862 (not res!824851)) b!1236863))

(declare-fun m!1140153 () Bool)

(assert (=> d!135417 m!1140153))

(declare-fun m!1140155 () Bool)

(assert (=> d!135417 m!1140155))

(declare-fun m!1140157 () Bool)

(assert (=> b!1236863 m!1140157))

(assert (=> b!1236705 d!135417))

(declare-fun b!1236900 () Bool)

(declare-fun e!701034 () Bool)

(declare-fun call!60987 () Bool)

(assert (=> b!1236900 (= e!701034 call!60987)))

(declare-fun b!1236901 () Bool)

(declare-fun e!701037 () Bool)

(assert (=> b!1236901 (= e!701037 e!701034)))

(declare-fun c!120871 () Bool)

(assert (=> b!1236901 (= c!120871 (validKeyInArray!0 (select (arr!38444 a!3835) from!3213)))))

(declare-fun d!135423 () Bool)

(declare-fun res!824884 () Bool)

(declare-fun e!701036 () Bool)

(assert (=> d!135423 (=> res!824884 e!701036)))

(assert (=> d!135423 (= res!824884 (bvsge from!3213 (size!38982 a!3835)))))

(assert (=> d!135423 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!701036)))

(declare-fun b!1236902 () Bool)

(assert (=> b!1236902 (= e!701034 call!60987)))

(declare-fun bm!60984 () Bool)

(assert (=> bm!60984 (= call!60987 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!120871 (Cons!27314 (select (arr!38444 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun b!1236903 () Bool)

(assert (=> b!1236903 (= e!701036 e!701037)))

(declare-fun res!824885 () Bool)

(assert (=> b!1236903 (=> (not res!824885) (not e!701037))))

(declare-fun e!701035 () Bool)

(assert (=> b!1236903 (= res!824885 (not e!701035))))

(declare-fun res!824886 () Bool)

(assert (=> b!1236903 (=> (not res!824886) (not e!701035))))

(assert (=> b!1236903 (= res!824886 (validKeyInArray!0 (select (arr!38444 a!3835) from!3213)))))

(declare-fun b!1236904 () Bool)

(assert (=> b!1236904 (= e!701035 (contains!7290 acc!846 (select (arr!38444 a!3835) from!3213)))))

(assert (= (and d!135423 (not res!824884)) b!1236903))

(assert (= (and b!1236903 res!824886) b!1236904))

(assert (= (and b!1236903 res!824885) b!1236901))

(assert (= (and b!1236901 c!120871) b!1236902))

(assert (= (and b!1236901 (not c!120871)) b!1236900))

(assert (= (or b!1236902 b!1236900) bm!60984))

(assert (=> b!1236901 m!1140039))

(assert (=> b!1236901 m!1140039))

(assert (=> b!1236901 m!1140043))

(assert (=> bm!60984 m!1140039))

(declare-fun m!1140171 () Bool)

(assert (=> bm!60984 m!1140171))

(assert (=> b!1236903 m!1140039))

(assert (=> b!1236903 m!1140039))

(assert (=> b!1236903 m!1140043))

(assert (=> b!1236904 m!1140039))

(assert (=> b!1236904 m!1140039))

(declare-fun m!1140173 () Bool)

(assert (=> b!1236904 m!1140173))

(assert (=> b!1236704 d!135423))

(declare-fun d!135433 () Bool)

(assert (=> d!135433 (= (array_inv!29427 a!3835) (bvsge (size!38982 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!102904 d!135433))

(declare-fun d!135435 () Bool)

(declare-fun lt!560747 () Bool)

(assert (=> d!135435 (= lt!560747 (select (content!583 acc!846) k0!2925))))

(declare-fun e!701047 () Bool)

(assert (=> d!135435 (= lt!560747 e!701047)))

(declare-fun res!824889 () Bool)

(assert (=> d!135435 (=> (not res!824889) (not e!701047))))

(assert (=> d!135435 (= res!824889 ((_ is Cons!27314) acc!846))))

(assert (=> d!135435 (= (contains!7290 acc!846 k0!2925) lt!560747)))

(declare-fun b!1236919 () Bool)

(declare-fun e!701046 () Bool)

(assert (=> b!1236919 (= e!701047 e!701046)))

(declare-fun res!824890 () Bool)

(assert (=> b!1236919 (=> res!824890 e!701046)))

(assert (=> b!1236919 (= res!824890 (= (h!28523 acc!846) k0!2925))))

(declare-fun b!1236920 () Bool)

(assert (=> b!1236920 (= e!701046 (contains!7290 (t!40772 acc!846) k0!2925))))

(assert (= (and d!135435 res!824889) b!1236919))

(assert (= (and b!1236919 (not res!824890)) b!1236920))

(assert (=> d!135435 m!1140153))

(declare-fun m!1140175 () Bool)

(assert (=> d!135435 m!1140175))

(declare-fun m!1140177 () Bool)

(assert (=> b!1236920 m!1140177))

(assert (=> b!1236702 d!135435))

(declare-fun d!135437 () Bool)

(declare-fun lt!560748 () Bool)

(assert (=> d!135437 (= lt!560748 (select (content!583 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701049 () Bool)

(assert (=> d!135437 (= lt!560748 e!701049)))

(declare-fun res!824891 () Bool)

(assert (=> d!135437 (=> (not res!824891) (not e!701049))))

(assert (=> d!135437 (= res!824891 ((_ is Cons!27314) acc!846))))

(assert (=> d!135437 (= (contains!7290 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!560748)))

(declare-fun b!1236921 () Bool)

(declare-fun e!701048 () Bool)

(assert (=> b!1236921 (= e!701049 e!701048)))

(declare-fun res!824892 () Bool)

(assert (=> b!1236921 (=> res!824892 e!701048)))

(assert (=> b!1236921 (= res!824892 (= (h!28523 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1236922 () Bool)

(assert (=> b!1236922 (= e!701048 (contains!7290 (t!40772 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135437 res!824891) b!1236921))

(assert (= (and b!1236921 (not res!824892)) b!1236922))

(assert (=> d!135437 m!1140153))

(declare-fun m!1140179 () Bool)

(assert (=> d!135437 m!1140179))

(declare-fun m!1140181 () Bool)

(assert (=> b!1236922 m!1140181))

(assert (=> b!1236707 d!135437))

(declare-fun d!135439 () Bool)

(assert (=> d!135439 (= (validKeyInArray!0 (select (arr!38444 a!3835) from!3213)) (and (not (= (select (arr!38444 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38444 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1236708 d!135439))

(check-sat (not bm!60984) (not b!1236922) (not bm!60975) (not b!1236828) (not d!135395) (not b!1236843) (not b!1236777) (not b!1236778) (not b!1236904) (not b!1236829) (not d!135415) (not b!1236901) (not b!1236903) (not b!1236762) (not b!1236761) (not b!1236842) (not d!135437) (not d!135417) (not b!1236863) (not b!1236920) (not b!1236826) (not d!135435))
(check-sat)
(get-model)

(declare-fun d!135453 () Bool)

(declare-fun lt!560760 () Bool)

(assert (=> d!135453 (= lt!560760 (select (content!583 (t!40772 acc!846)) k0!2925))))

(declare-fun e!701077 () Bool)

(assert (=> d!135453 (= lt!560760 e!701077)))

(declare-fun res!824907 () Bool)

(assert (=> d!135453 (=> (not res!824907) (not e!701077))))

(assert (=> d!135453 (= res!824907 ((_ is Cons!27314) (t!40772 acc!846)))))

(assert (=> d!135453 (= (contains!7290 (t!40772 acc!846) k0!2925) lt!560760)))

(declare-fun b!1236961 () Bool)

(declare-fun e!701076 () Bool)

(assert (=> b!1236961 (= e!701077 e!701076)))

(declare-fun res!824908 () Bool)

(assert (=> b!1236961 (=> res!824908 e!701076)))

(assert (=> b!1236961 (= res!824908 (= (h!28523 (t!40772 acc!846)) k0!2925))))

(declare-fun b!1236962 () Bool)

(assert (=> b!1236962 (= e!701076 (contains!7290 (t!40772 (t!40772 acc!846)) k0!2925))))

(assert (= (and d!135453 res!824907) b!1236961))

(assert (= (and b!1236961 (not res!824908)) b!1236962))

(declare-fun m!1140219 () Bool)

(assert (=> d!135453 m!1140219))

(declare-fun m!1140221 () Bool)

(assert (=> d!135453 m!1140221))

(declare-fun m!1140223 () Bool)

(assert (=> b!1236962 m!1140223))

(assert (=> b!1236920 d!135453))

(declare-fun b!1236965 () Bool)

(declare-fun e!701080 () Bool)

(assert (=> b!1236965 (= e!701080 (subseq!572 (t!40772 acc!846) (t!40772 (t!40772 lt!560707))))))

(declare-fun b!1236964 () Bool)

(declare-fun e!701079 () Bool)

(declare-fun e!701081 () Bool)

(assert (=> b!1236964 (= e!701079 e!701081)))

(declare-fun res!824909 () Bool)

(assert (=> b!1236964 (=> res!824909 e!701081)))

(assert (=> b!1236964 (= res!824909 e!701080)))

(declare-fun res!824912 () Bool)

(assert (=> b!1236964 (=> (not res!824912) (not e!701080))))

(assert (=> b!1236964 (= res!824912 (= (h!28523 acc!846) (h!28523 (t!40772 lt!560707))))))

(declare-fun b!1236966 () Bool)

(assert (=> b!1236966 (= e!701081 (subseq!572 acc!846 (t!40772 (t!40772 lt!560707))))))

(declare-fun d!135455 () Bool)

(declare-fun res!824910 () Bool)

(declare-fun e!701078 () Bool)

(assert (=> d!135455 (=> res!824910 e!701078)))

(assert (=> d!135455 (= res!824910 ((_ is Nil!27315) acc!846))))

(assert (=> d!135455 (= (subseq!572 acc!846 (t!40772 lt!560707)) e!701078)))

(declare-fun b!1236963 () Bool)

(assert (=> b!1236963 (= e!701078 e!701079)))

(declare-fun res!824911 () Bool)

(assert (=> b!1236963 (=> (not res!824911) (not e!701079))))

(assert (=> b!1236963 (= res!824911 ((_ is Cons!27314) (t!40772 lt!560707)))))

(assert (= (and d!135455 (not res!824910)) b!1236963))

(assert (= (and b!1236963 res!824911) b!1236964))

(assert (= (and b!1236964 res!824912) b!1236965))

(assert (= (and b!1236964 (not res!824909)) b!1236966))

(declare-fun m!1140225 () Bool)

(assert (=> b!1236965 m!1140225))

(declare-fun m!1140227 () Bool)

(assert (=> b!1236966 m!1140227))

(assert (=> b!1236778 d!135455))

(declare-fun d!135457 () Bool)

(declare-fun lt!560761 () Bool)

(assert (=> d!135457 (= lt!560761 (select (content!583 (t!40772 acc!846)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701083 () Bool)

(assert (=> d!135457 (= lt!560761 e!701083)))

(declare-fun res!824913 () Bool)

(assert (=> d!135457 (=> (not res!824913) (not e!701083))))

(assert (=> d!135457 (= res!824913 ((_ is Cons!27314) (t!40772 acc!846)))))

(assert (=> d!135457 (= (contains!7290 (t!40772 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000) lt!560761)))

(declare-fun b!1236967 () Bool)

(declare-fun e!701082 () Bool)

(assert (=> b!1236967 (= e!701083 e!701082)))

(declare-fun res!824914 () Bool)

(assert (=> b!1236967 (=> res!824914 e!701082)))

(assert (=> b!1236967 (= res!824914 (= (h!28523 (t!40772 acc!846)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1236968 () Bool)

(assert (=> b!1236968 (= e!701082 (contains!7290 (t!40772 (t!40772 acc!846)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135457 res!824913) b!1236967))

(assert (= (and b!1236967 (not res!824914)) b!1236968))

(assert (=> d!135457 m!1140219))

(declare-fun m!1140229 () Bool)

(assert (=> d!135457 m!1140229))

(declare-fun m!1140231 () Bool)

(assert (=> b!1236968 m!1140231))

(assert (=> b!1236863 d!135457))

(declare-fun d!135459 () Bool)

(declare-fun res!824915 () Bool)

(declare-fun e!701084 () Bool)

(assert (=> d!135459 (=> res!824915 e!701084)))

(assert (=> d!135459 (= res!824915 ((_ is Nil!27315) (t!40772 acc!846)))))

(assert (=> d!135459 (= (noDuplicate!1933 (t!40772 acc!846)) e!701084)))

(declare-fun b!1236969 () Bool)

(declare-fun e!701085 () Bool)

(assert (=> b!1236969 (= e!701084 e!701085)))

(declare-fun res!824916 () Bool)

(assert (=> b!1236969 (=> (not res!824916) (not e!701085))))

(assert (=> b!1236969 (= res!824916 (not (contains!7290 (t!40772 (t!40772 acc!846)) (h!28523 (t!40772 acc!846)))))))

(declare-fun b!1236970 () Bool)

(assert (=> b!1236970 (= e!701085 (noDuplicate!1933 (t!40772 (t!40772 acc!846))))))

(assert (= (and d!135459 (not res!824915)) b!1236969))

(assert (= (and b!1236969 res!824916) b!1236970))

(declare-fun m!1140233 () Bool)

(assert (=> b!1236969 m!1140233))

(declare-fun m!1140235 () Bool)

(assert (=> b!1236970 m!1140235))

(assert (=> b!1236762 d!135459))

(declare-fun b!1236973 () Bool)

(declare-fun e!701088 () Bool)

(assert (=> b!1236973 (= e!701088 (subseq!572 (t!40772 (t!40772 acc!846)) (t!40772 (t!40772 lt!560707))))))

(declare-fun b!1236972 () Bool)

(declare-fun e!701087 () Bool)

(declare-fun e!701089 () Bool)

(assert (=> b!1236972 (= e!701087 e!701089)))

(declare-fun res!824917 () Bool)

(assert (=> b!1236972 (=> res!824917 e!701089)))

(assert (=> b!1236972 (= res!824917 e!701088)))

(declare-fun res!824920 () Bool)

(assert (=> b!1236972 (=> (not res!824920) (not e!701088))))

(assert (=> b!1236972 (= res!824920 (= (h!28523 (t!40772 acc!846)) (h!28523 (t!40772 lt!560707))))))

(declare-fun b!1236974 () Bool)

(assert (=> b!1236974 (= e!701089 (subseq!572 (t!40772 acc!846) (t!40772 (t!40772 lt!560707))))))

(declare-fun d!135461 () Bool)

(declare-fun res!824918 () Bool)

(declare-fun e!701086 () Bool)

(assert (=> d!135461 (=> res!824918 e!701086)))

(assert (=> d!135461 (= res!824918 ((_ is Nil!27315) (t!40772 acc!846)))))

(assert (=> d!135461 (= (subseq!572 (t!40772 acc!846) (t!40772 lt!560707)) e!701086)))

(declare-fun b!1236971 () Bool)

(assert (=> b!1236971 (= e!701086 e!701087)))

(declare-fun res!824919 () Bool)

(assert (=> b!1236971 (=> (not res!824919) (not e!701087))))

(assert (=> b!1236971 (= res!824919 ((_ is Cons!27314) (t!40772 lt!560707)))))

(assert (= (and d!135461 (not res!824918)) b!1236971))

(assert (= (and b!1236971 res!824919) b!1236972))

(assert (= (and b!1236972 res!824920) b!1236973))

(assert (= (and b!1236972 (not res!824917)) b!1236974))

(declare-fun m!1140237 () Bool)

(assert (=> b!1236973 m!1140237))

(assert (=> b!1236974 m!1140225))

(assert (=> b!1236777 d!135461))

(declare-fun b!1236977 () Bool)

(declare-fun e!701092 () Bool)

(assert (=> b!1236977 (= e!701092 (subseq!572 (t!40772 lt!560707) (t!40772 (t!40772 lt!560707))))))

(declare-fun b!1236976 () Bool)

(declare-fun e!701091 () Bool)

(declare-fun e!701093 () Bool)

(assert (=> b!1236976 (= e!701091 e!701093)))

(declare-fun res!824921 () Bool)

(assert (=> b!1236976 (=> res!824921 e!701093)))

(assert (=> b!1236976 (= res!824921 e!701092)))

(declare-fun res!824924 () Bool)

(assert (=> b!1236976 (=> (not res!824924) (not e!701092))))

(assert (=> b!1236976 (= res!824924 (= (h!28523 lt!560707) (h!28523 (t!40772 lt!560707))))))

(declare-fun b!1236978 () Bool)

(assert (=> b!1236978 (= e!701093 (subseq!572 lt!560707 (t!40772 (t!40772 lt!560707))))))

(declare-fun d!135463 () Bool)

(declare-fun res!824922 () Bool)

(declare-fun e!701090 () Bool)

(assert (=> d!135463 (=> res!824922 e!701090)))

(assert (=> d!135463 (= res!824922 ((_ is Nil!27315) lt!560707))))

(assert (=> d!135463 (= (subseq!572 lt!560707 (t!40772 lt!560707)) e!701090)))

(declare-fun b!1236975 () Bool)

(assert (=> b!1236975 (= e!701090 e!701091)))

(declare-fun res!824923 () Bool)

(assert (=> b!1236975 (=> (not res!824923) (not e!701091))))

(assert (=> b!1236975 (= res!824923 ((_ is Cons!27314) (t!40772 lt!560707)))))

(assert (= (and d!135463 (not res!824922)) b!1236975))

(assert (= (and b!1236975 res!824923) b!1236976))

(assert (= (and b!1236976 res!824924) b!1236977))

(assert (= (and b!1236976 (not res!824921)) b!1236978))

(declare-fun m!1140239 () Bool)

(assert (=> b!1236977 m!1140239))

(declare-fun m!1140241 () Bool)

(assert (=> b!1236978 m!1140241))

(assert (=> b!1236843 d!135463))

(declare-fun d!135465 () Bool)

(declare-fun lt!560762 () Bool)

(assert (=> d!135465 (= lt!560762 (select (content!583 (t!40772 acc!846)) (h!28523 acc!846)))))

(declare-fun e!701095 () Bool)

(assert (=> d!135465 (= lt!560762 e!701095)))

(declare-fun res!824925 () Bool)

(assert (=> d!135465 (=> (not res!824925) (not e!701095))))

(assert (=> d!135465 (= res!824925 ((_ is Cons!27314) (t!40772 acc!846)))))

(assert (=> d!135465 (= (contains!7290 (t!40772 acc!846) (h!28523 acc!846)) lt!560762)))

(declare-fun b!1236979 () Bool)

(declare-fun e!701094 () Bool)

(assert (=> b!1236979 (= e!701095 e!701094)))

(declare-fun res!824926 () Bool)

(assert (=> b!1236979 (=> res!824926 e!701094)))

(assert (=> b!1236979 (= res!824926 (= (h!28523 (t!40772 acc!846)) (h!28523 acc!846)))))

(declare-fun b!1236980 () Bool)

(assert (=> b!1236980 (= e!701094 (contains!7290 (t!40772 (t!40772 acc!846)) (h!28523 acc!846)))))

(assert (= (and d!135465 res!824925) b!1236979))

(assert (= (and b!1236979 (not res!824926)) b!1236980))

(assert (=> d!135465 m!1140219))

(declare-fun m!1140243 () Bool)

(assert (=> d!135465 m!1140243))

(declare-fun m!1140245 () Bool)

(assert (=> b!1236980 m!1140245))

(assert (=> b!1236761 d!135465))

(declare-fun b!1236983 () Bool)

(declare-fun e!701098 () Bool)

(assert (=> b!1236983 (= e!701098 (subseq!572 (t!40772 (t!40772 lt!560707)) (t!40772 (t!40772 lt!560707))))))

(declare-fun b!1236982 () Bool)

(declare-fun e!701097 () Bool)

(declare-fun e!701099 () Bool)

(assert (=> b!1236982 (= e!701097 e!701099)))

(declare-fun res!824927 () Bool)

(assert (=> b!1236982 (=> res!824927 e!701099)))

(assert (=> b!1236982 (= res!824927 e!701098)))

(declare-fun res!824930 () Bool)

(assert (=> b!1236982 (=> (not res!824930) (not e!701098))))

(assert (=> b!1236982 (= res!824930 (= (h!28523 (t!40772 lt!560707)) (h!28523 (t!40772 lt!560707))))))

(declare-fun b!1236984 () Bool)

(assert (=> b!1236984 (= e!701099 (subseq!572 (t!40772 lt!560707) (t!40772 (t!40772 lt!560707))))))

(declare-fun d!135467 () Bool)

(declare-fun res!824928 () Bool)

(declare-fun e!701096 () Bool)

(assert (=> d!135467 (=> res!824928 e!701096)))

(assert (=> d!135467 (= res!824928 ((_ is Nil!27315) (t!40772 lt!560707)))))

(assert (=> d!135467 (= (subseq!572 (t!40772 lt!560707) (t!40772 lt!560707)) e!701096)))

(declare-fun b!1236981 () Bool)

(assert (=> b!1236981 (= e!701096 e!701097)))

(declare-fun res!824929 () Bool)

(assert (=> b!1236981 (=> (not res!824929) (not e!701097))))

(assert (=> b!1236981 (= res!824929 ((_ is Cons!27314) (t!40772 lt!560707)))))

(assert (= (and d!135467 (not res!824928)) b!1236981))

(assert (= (and b!1236981 res!824929) b!1236982))

(assert (= (and b!1236982 res!824930) b!1236983))

(assert (= (and b!1236982 (not res!824927)) b!1236984))

(declare-fun m!1140247 () Bool)

(assert (=> b!1236983 m!1140247))

(assert (=> b!1236984 m!1140239))

(assert (=> b!1236842 d!135467))

(declare-fun d!135469 () Bool)

(assert (=> d!135469 (= (isEmpty!1011 (t!40772 lt!560707)) ((_ is Nil!27315) (t!40772 lt!560707)))))

(assert (=> b!1236829 d!135469))

(declare-fun d!135471 () Bool)

(declare-fun lt!560763 () Bool)

(assert (=> d!135471 (= lt!560763 (select (content!583 acc!846) (select (arr!38444 a!3835) from!3213)))))

(declare-fun e!701101 () Bool)

(assert (=> d!135471 (= lt!560763 e!701101)))

(declare-fun res!824931 () Bool)

(assert (=> d!135471 (=> (not res!824931) (not e!701101))))

(assert (=> d!135471 (= res!824931 ((_ is Cons!27314) acc!846))))

(assert (=> d!135471 (= (contains!7290 acc!846 (select (arr!38444 a!3835) from!3213)) lt!560763)))

(declare-fun b!1236985 () Bool)

(declare-fun e!701100 () Bool)

(assert (=> b!1236985 (= e!701101 e!701100)))

(declare-fun res!824932 () Bool)

(assert (=> b!1236985 (=> res!824932 e!701100)))

(assert (=> b!1236985 (= res!824932 (= (h!28523 acc!846) (select (arr!38444 a!3835) from!3213)))))

(declare-fun b!1236986 () Bool)

(assert (=> b!1236986 (= e!701100 (contains!7290 (t!40772 acc!846) (select (arr!38444 a!3835) from!3213)))))

(assert (= (and d!135471 res!824931) b!1236985))

(assert (= (and b!1236985 (not res!824932)) b!1236986))

(assert (=> d!135471 m!1140153))

(assert (=> d!135471 m!1140039))

(declare-fun m!1140249 () Bool)

(assert (=> d!135471 m!1140249))

(assert (=> b!1236986 m!1140039))

(declare-fun m!1140251 () Bool)

(assert (=> b!1236986 m!1140251))

(assert (=> b!1236904 d!135471))

(declare-fun d!135473 () Bool)

(declare-fun c!120892 () Bool)

(assert (=> d!135473 (= c!120892 ((_ is Nil!27315) acc!846))))

(declare-fun e!701104 () (InoxSet (_ BitVec 64)))

(assert (=> d!135473 (= (content!583 acc!846) e!701104)))

(declare-fun b!1236991 () Bool)

(assert (=> b!1236991 (= e!701104 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!1236992 () Bool)

(assert (=> b!1236992 (= e!701104 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!28523 acc!846) true) (content!583 (t!40772 acc!846))))))

(assert (= (and d!135473 c!120892) b!1236991))

(assert (= (and d!135473 (not c!120892)) b!1236992))

(declare-fun m!1140253 () Bool)

(assert (=> b!1236992 m!1140253))

(assert (=> b!1236992 m!1140219))

(assert (=> d!135437 d!135473))

(declare-fun b!1236993 () Bool)

(declare-fun e!701105 () Bool)

(declare-fun call!60994 () Bool)

(assert (=> b!1236993 (= e!701105 call!60994)))

(declare-fun b!1236994 () Bool)

(declare-fun e!701108 () Bool)

(assert (=> b!1236994 (= e!701108 e!701105)))

(declare-fun c!120893 () Bool)

(assert (=> b!1236994 (= c!120893 (validKeyInArray!0 (select (arr!38444 a!3835) (bvadd from!3213 #b00000000000000000000000000000001))))))

(declare-fun d!135475 () Bool)

(declare-fun res!824933 () Bool)

(declare-fun e!701107 () Bool)

(assert (=> d!135475 (=> res!824933 e!701107)))

(assert (=> d!135475 (= res!824933 (bvsge (bvadd from!3213 #b00000000000000000000000000000001) (size!38982 a!3835)))))

(assert (=> d!135475 (= (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!120871 (Cons!27314 (select (arr!38444 a!3835) from!3213) acc!846) acc!846)) e!701107)))

(declare-fun b!1236995 () Bool)

(assert (=> b!1236995 (= e!701105 call!60994)))

(declare-fun bm!60991 () Bool)

(assert (=> bm!60991 (= call!60994 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120893 (Cons!27314 (select (arr!38444 a!3835) (bvadd from!3213 #b00000000000000000000000000000001)) (ite c!120871 (Cons!27314 (select (arr!38444 a!3835) from!3213) acc!846) acc!846)) (ite c!120871 (Cons!27314 (select (arr!38444 a!3835) from!3213) acc!846) acc!846))))))

(declare-fun b!1236996 () Bool)

(assert (=> b!1236996 (= e!701107 e!701108)))

(declare-fun res!824934 () Bool)

(assert (=> b!1236996 (=> (not res!824934) (not e!701108))))

(declare-fun e!701106 () Bool)

(assert (=> b!1236996 (= res!824934 (not e!701106))))

(declare-fun res!824935 () Bool)

(assert (=> b!1236996 (=> (not res!824935) (not e!701106))))

(assert (=> b!1236996 (= res!824935 (validKeyInArray!0 (select (arr!38444 a!3835) (bvadd from!3213 #b00000000000000000000000000000001))))))

(declare-fun b!1236997 () Bool)

(assert (=> b!1236997 (= e!701106 (contains!7290 (ite c!120871 (Cons!27314 (select (arr!38444 a!3835) from!3213) acc!846) acc!846) (select (arr!38444 a!3835) (bvadd from!3213 #b00000000000000000000000000000001))))))

(assert (= (and d!135475 (not res!824933)) b!1236996))

(assert (= (and b!1236996 res!824935) b!1236997))

(assert (= (and b!1236996 res!824934) b!1236994))

(assert (= (and b!1236994 c!120893) b!1236995))

(assert (= (and b!1236994 (not c!120893)) b!1236993))

(assert (= (or b!1236995 b!1236993) bm!60991))

(declare-fun m!1140255 () Bool)

(assert (=> b!1236994 m!1140255))

(assert (=> b!1236994 m!1140255))

(declare-fun m!1140257 () Bool)

(assert (=> b!1236994 m!1140257))

(assert (=> bm!60991 m!1140255))

(declare-fun m!1140259 () Bool)

(assert (=> bm!60991 m!1140259))

(assert (=> b!1236996 m!1140255))

(assert (=> b!1236996 m!1140255))

(assert (=> b!1236996 m!1140257))

(assert (=> b!1236997 m!1140255))

(assert (=> b!1236997 m!1140255))

(declare-fun m!1140261 () Bool)

(assert (=> b!1236997 m!1140261))

(assert (=> bm!60984 d!135475))

(declare-fun b!1237000 () Bool)

(declare-fun e!701111 () Bool)

(assert (=> b!1237000 (= e!701111 (subseq!572 (t!40772 (tail!158 lt!560707)) (t!40772 lt!560707)))))

(declare-fun b!1236999 () Bool)

(declare-fun e!701110 () Bool)

(declare-fun e!701112 () Bool)

(assert (=> b!1236999 (= e!701110 e!701112)))

(declare-fun res!824936 () Bool)

(assert (=> b!1236999 (=> res!824936 e!701112)))

(assert (=> b!1236999 (= res!824936 e!701111)))

(declare-fun res!824939 () Bool)

(assert (=> b!1236999 (=> (not res!824939) (not e!701111))))

(assert (=> b!1236999 (= res!824939 (= (h!28523 (tail!158 lt!560707)) (h!28523 lt!560707)))))

(declare-fun b!1237001 () Bool)

(assert (=> b!1237001 (= e!701112 (subseq!572 (tail!158 lt!560707) (t!40772 lt!560707)))))

(declare-fun d!135477 () Bool)

(declare-fun res!824937 () Bool)

(declare-fun e!701109 () Bool)

(assert (=> d!135477 (=> res!824937 e!701109)))

(assert (=> d!135477 (= res!824937 ((_ is Nil!27315) (tail!158 lt!560707)))))

(assert (=> d!135477 (= (subseq!572 (tail!158 lt!560707) lt!560707) e!701109)))

(declare-fun b!1236998 () Bool)

(assert (=> b!1236998 (= e!701109 e!701110)))

(declare-fun res!824938 () Bool)

(assert (=> b!1236998 (=> (not res!824938) (not e!701110))))

(assert (=> b!1236998 (= res!824938 ((_ is Cons!27314) lt!560707))))

(assert (= (and d!135477 (not res!824937)) b!1236998))

(assert (= (and b!1236998 res!824938) b!1236999))

(assert (= (and b!1236999 res!824939) b!1237000))

(assert (= (and b!1236999 (not res!824936)) b!1237001))

(declare-fun m!1140263 () Bool)

(assert (=> b!1237000 m!1140263))

(assert (=> b!1237001 m!1140129))

(declare-fun m!1140265 () Bool)

(assert (=> b!1237001 m!1140265))

(assert (=> d!135395 d!135477))

(declare-fun d!135479 () Bool)

(assert (=> d!135479 (= (tail!158 lt!560707) (t!40772 lt!560707))))

(assert (=> d!135395 d!135479))

(declare-fun d!135481 () Bool)

(assert (=> d!135481 (= (isEmpty!1011 lt!560707) ((_ is Nil!27315) lt!560707))))

(assert (=> d!135395 d!135481))

(assert (=> b!1236828 d!135413))

(assert (=> b!1236903 d!135439))

(assert (=> b!1236826 d!135463))

(assert (=> d!135435 d!135473))

(assert (=> d!135417 d!135473))

(declare-fun d!135483 () Bool)

(declare-fun lt!560764 () Bool)

(assert (=> d!135483 (= lt!560764 (select (content!583 (t!40772 acc!846)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701114 () Bool)

(assert (=> d!135483 (= lt!560764 e!701114)))

(declare-fun res!824940 () Bool)

(assert (=> d!135483 (=> (not res!824940) (not e!701114))))

(assert (=> d!135483 (= res!824940 ((_ is Cons!27314) (t!40772 acc!846)))))

(assert (=> d!135483 (= (contains!7290 (t!40772 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000) lt!560764)))

(declare-fun b!1237002 () Bool)

(declare-fun e!701113 () Bool)

(assert (=> b!1237002 (= e!701114 e!701113)))

(declare-fun res!824941 () Bool)

(assert (=> b!1237002 (=> res!824941 e!701113)))

(assert (=> b!1237002 (= res!824941 (= (h!28523 (t!40772 acc!846)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1237003 () Bool)

(assert (=> b!1237003 (= e!701113 (contains!7290 (t!40772 (t!40772 acc!846)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135483 res!824940) b!1237002))

(assert (= (and b!1237002 (not res!824941)) b!1237003))

(assert (=> d!135483 m!1140219))

(declare-fun m!1140267 () Bool)

(assert (=> d!135483 m!1140267))

(declare-fun m!1140269 () Bool)

(assert (=> b!1237003 m!1140269))

(assert (=> b!1236922 d!135483))

(declare-fun b!1237004 () Bool)

(declare-fun e!701117 () Unit!40877)

(declare-fun Unit!40889 () Unit!40877)

(assert (=> b!1237004 (= e!701117 Unit!40889)))

(declare-fun c!120894 () Bool)

(declare-fun call!60995 () Unit!40877)

(declare-fun bm!60992 () Bool)

(assert (=> bm!60992 (= call!60995 (subseqTail!59 (ite c!120894 (ite c!120862 lt!560707 (t!40772 lt!560707)) (t!40772 (ite c!120862 lt!560707 (t!40772 lt!560707)))) (t!40772 (t!40772 lt!560707))))))

(declare-fun b!1237005 () Bool)

(declare-fun e!701116 () Unit!40877)

(declare-fun e!701115 () Unit!40877)

(assert (=> b!1237005 (= e!701116 e!701115)))

(assert (=> b!1237005 (= c!120894 (subseq!572 (ite c!120862 lt!560707 (t!40772 lt!560707)) (t!40772 (t!40772 lt!560707))))))

(declare-fun d!135485 () Bool)

(assert (=> d!135485 (subseq!572 (tail!158 (ite c!120862 lt!560707 (t!40772 lt!560707))) (t!40772 lt!560707))))

(declare-fun lt!560765 () Unit!40877)

(assert (=> d!135485 (= lt!560765 e!701116)))

(declare-fun c!120895 () Bool)

(assert (=> d!135485 (= c!120895 (and ((_ is Cons!27314) (ite c!120862 lt!560707 (t!40772 lt!560707))) ((_ is Cons!27314) (t!40772 lt!560707))))))

(declare-fun e!701118 () Bool)

(assert (=> d!135485 e!701118))

(declare-fun res!824942 () Bool)

(assert (=> d!135485 (=> (not res!824942) (not e!701118))))

(assert (=> d!135485 (= res!824942 (not (isEmpty!1011 (ite c!120862 lt!560707 (t!40772 lt!560707)))))))

(assert (=> d!135485 (= (subseqTail!59 (ite c!120862 lt!560707 (t!40772 lt!560707)) (t!40772 lt!560707)) lt!560765)))

(declare-fun b!1237006 () Bool)

(assert (=> b!1237006 (= e!701117 call!60995)))

(declare-fun b!1237007 () Bool)

(assert (=> b!1237007 (= e!701118 (subseq!572 (ite c!120862 lt!560707 (t!40772 lt!560707)) (t!40772 lt!560707)))))

(declare-fun b!1237008 () Bool)

(declare-fun c!120896 () Bool)

(assert (=> b!1237008 (= c!120896 (not (isEmpty!1011 (t!40772 (ite c!120862 lt!560707 (t!40772 lt!560707))))))))

(assert (=> b!1237008 (= e!701115 e!701117)))

(declare-fun b!1237009 () Bool)

(declare-fun Unit!40890 () Unit!40877)

(assert (=> b!1237009 (= e!701116 Unit!40890)))

(declare-fun b!1237010 () Bool)

(assert (=> b!1237010 (= e!701115 call!60995)))

(assert (= (and d!135485 res!824942) b!1237007))

(assert (= (and d!135485 c!120895) b!1237005))

(assert (= (and d!135485 (not c!120895)) b!1237009))

(assert (= (and b!1237005 c!120894) b!1237010))

(assert (= (and b!1237005 (not c!120894)) b!1237008))

(assert (= (and b!1237008 c!120896) b!1237006))

(assert (= (and b!1237008 (not c!120896)) b!1237004))

(assert (= (or b!1237010 b!1237006) bm!60992))

(declare-fun m!1140271 () Bool)

(assert (=> b!1237007 m!1140271))

(declare-fun m!1140273 () Bool)

(assert (=> d!135485 m!1140273))

(assert (=> d!135485 m!1140273))

(declare-fun m!1140275 () Bool)

(assert (=> d!135485 m!1140275))

(declare-fun m!1140277 () Bool)

(assert (=> d!135485 m!1140277))

(declare-fun m!1140279 () Bool)

(assert (=> bm!60992 m!1140279))

(declare-fun m!1140281 () Bool)

(assert (=> b!1237008 m!1140281))

(declare-fun m!1140283 () Bool)

(assert (=> b!1237005 m!1140283))

(assert (=> bm!60975 d!135485))

(assert (=> d!135415 d!135413))

(declare-fun d!135487 () Bool)

(assert (=> d!135487 (subseq!572 lt!560707 lt!560707)))

(assert (=> d!135487 true))

(declare-fun _$69!47 () Unit!40877)

(assert (=> d!135487 (= (choose!36 lt!560707) _$69!47)))

(declare-fun bs!34756 () Bool)

(assert (= bs!34756 d!135487))

(assert (=> bs!34756 m!1140035))

(assert (=> d!135415 d!135487))

(assert (=> b!1236901 d!135439))

(check-sat (not d!135485) (not d!135487) (not b!1237001) (not b!1236973) (not d!135465) (not b!1237007) (not b!1237008) (not b!1236997) (not b!1236968) (not b!1237000) (not b!1236983) (not b!1236986) (not b!1236992) (not d!135483) (not b!1236970) (not d!135457) (not bm!60992) (not b!1236996) (not b!1236977) (not b!1236978) (not b!1237005) (not b!1236966) (not b!1236969) (not b!1236962) (not b!1236980) (not b!1236974) (not b!1236984) (not d!135453) (not b!1236965) (not b!1237003) (not b!1236994) (not d!135471) (not bm!60991))
(check-sat)
