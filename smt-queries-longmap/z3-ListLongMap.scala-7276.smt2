; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92876 () Bool)

(assert start!92876)

(declare-fun e!599330 () Bool)

(declare-fun b!1054797 () Bool)

(declare-datatypes ((array!66536 0))(
  ( (array!66537 (arr!32000 (Array (_ BitVec 32) (_ BitVec 64))) (size!32536 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66536)

(declare-fun lt!465562 () (_ BitVec 32))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66536 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054797 (= e!599330 (arrayContainsKey!0 a!3488 k0!2747 lt!465562))))

(declare-fun b!1054798 () Bool)

(declare-fun e!599332 () Bool)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054798 (= e!599332 (bvslt (bvadd #b00000000000000000000000000000001 i!1381) (size!32536 a!3488)))))

(assert (=> b!1054798 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34558 0))(
  ( (Unit!34559) )
))
(declare-fun lt!465564 () Unit!34558)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66536 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34558)

(assert (=> b!1054798 (= lt!465564 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465562 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-datatypes ((List!22312 0))(
  ( (Nil!22309) (Cons!22308 (h!23517 (_ BitVec 64)) (t!31619 List!22312)) )
))
(declare-fun arrayNoDuplicates!0 (array!66536 (_ BitVec 32) List!22312) Bool)

(assert (=> b!1054798 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22309)))

(declare-fun lt!465563 () Unit!34558)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66536 (_ BitVec 32) (_ BitVec 32)) Unit!34558)

(assert (=> b!1054798 (= lt!465563 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054799 () Bool)

(declare-fun res!703738 () Bool)

(declare-fun e!599335 () Bool)

(assert (=> b!1054799 (=> (not res!703738) (not e!599335))))

(assert (=> b!1054799 (= res!703738 (= (select (arr!32000 a!3488) i!1381) k0!2747))))

(declare-fun b!1054800 () Bool)

(declare-fun res!703741 () Bool)

(assert (=> b!1054800 (=> (not res!703741) (not e!599335))))

(assert (=> b!1054800 (= res!703741 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22309))))

(declare-fun b!1054801 () Bool)

(declare-fun e!599334 () Bool)

(assert (=> b!1054801 (= e!599334 (not e!599332))))

(declare-fun res!703737 () Bool)

(assert (=> b!1054801 (=> res!703737 e!599332)))

(assert (=> b!1054801 (= res!703737 (bvsle lt!465562 i!1381))))

(declare-fun e!599331 () Bool)

(assert (=> b!1054801 e!599331))

(declare-fun res!703744 () Bool)

(assert (=> b!1054801 (=> (not res!703744) (not e!599331))))

(assert (=> b!1054801 (= res!703744 (= (select (store (arr!32000 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465562) k0!2747))))

(declare-fun b!1054802 () Bool)

(declare-fun res!703743 () Bool)

(assert (=> b!1054802 (=> (not res!703743) (not e!599335))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054802 (= res!703743 (validKeyInArray!0 k0!2747))))

(declare-fun b!1054803 () Bool)

(declare-fun e!599329 () Bool)

(assert (=> b!1054803 (= e!599335 e!599329)))

(declare-fun res!703745 () Bool)

(assert (=> b!1054803 (=> (not res!703745) (not e!599329))))

(declare-fun lt!465561 () array!66536)

(assert (=> b!1054803 (= res!703745 (arrayContainsKey!0 lt!465561 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054803 (= lt!465561 (array!66537 (store (arr!32000 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32536 a!3488)))))

(declare-fun b!1054804 () Bool)

(assert (=> b!1054804 (= e!599329 e!599334)))

(declare-fun res!703740 () Bool)

(assert (=> b!1054804 (=> (not res!703740) (not e!599334))))

(assert (=> b!1054804 (= res!703740 (not (= lt!465562 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66536 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054804 (= lt!465562 (arrayScanForKey!0 lt!465561 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!703739 () Bool)

(assert (=> start!92876 (=> (not res!703739) (not e!599335))))

(assert (=> start!92876 (= res!703739 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32536 a!3488)) (bvslt (size!32536 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92876 e!599335))

(assert (=> start!92876 true))

(declare-fun array_inv!24780 (array!66536) Bool)

(assert (=> start!92876 (array_inv!24780 a!3488)))

(declare-fun b!1054805 () Bool)

(assert (=> b!1054805 (= e!599331 e!599330)))

(declare-fun res!703742 () Bool)

(assert (=> b!1054805 (=> res!703742 e!599330)))

(assert (=> b!1054805 (= res!703742 (bvsle lt!465562 i!1381))))

(assert (= (and start!92876 res!703739) b!1054800))

(assert (= (and b!1054800 res!703741) b!1054802))

(assert (= (and b!1054802 res!703743) b!1054799))

(assert (= (and b!1054799 res!703738) b!1054803))

(assert (= (and b!1054803 res!703745) b!1054804))

(assert (= (and b!1054804 res!703740) b!1054801))

(assert (= (and b!1054801 res!703744) b!1054805))

(assert (= (and b!1054805 (not res!703742)) b!1054797))

(assert (= (and b!1054801 (not res!703737)) b!1054798))

(declare-fun m!974839 () Bool)

(assert (=> b!1054799 m!974839))

(declare-fun m!974841 () Bool)

(assert (=> b!1054797 m!974841))

(declare-fun m!974843 () Bool)

(assert (=> b!1054802 m!974843))

(declare-fun m!974845 () Bool)

(assert (=> b!1054803 m!974845))

(declare-fun m!974847 () Bool)

(assert (=> b!1054803 m!974847))

(declare-fun m!974849 () Bool)

(assert (=> start!92876 m!974849))

(declare-fun m!974851 () Bool)

(assert (=> b!1054804 m!974851))

(declare-fun m!974853 () Bool)

(assert (=> b!1054798 m!974853))

(declare-fun m!974855 () Bool)

(assert (=> b!1054798 m!974855))

(declare-fun m!974857 () Bool)

(assert (=> b!1054798 m!974857))

(declare-fun m!974859 () Bool)

(assert (=> b!1054798 m!974859))

(declare-fun m!974861 () Bool)

(assert (=> b!1054800 m!974861))

(assert (=> b!1054801 m!974847))

(declare-fun m!974863 () Bool)

(assert (=> b!1054801 m!974863))

(check-sat (not b!1054803) (not b!1054804) (not start!92876) (not b!1054802) (not b!1054800) (not b!1054797) (not b!1054798))
(check-sat)
(get-model)

(declare-fun b!1054843 () Bool)

(declare-fun e!599366 () Bool)

(declare-fun e!599367 () Bool)

(assert (=> b!1054843 (= e!599366 e!599367)))

(declare-fun res!703780 () Bool)

(assert (=> b!1054843 (=> (not res!703780) (not e!599367))))

(declare-fun e!599368 () Bool)

(assert (=> b!1054843 (= res!703780 (not e!599368))))

(declare-fun res!703781 () Bool)

(assert (=> b!1054843 (=> (not res!703781) (not e!599368))))

(assert (=> b!1054843 (= res!703781 (validKeyInArray!0 (select (arr!32000 a!3488) #b00000000000000000000000000000000)))))

(declare-fun d!128017 () Bool)

(declare-fun res!703779 () Bool)

(assert (=> d!128017 (=> res!703779 e!599366)))

(assert (=> d!128017 (= res!703779 (bvsge #b00000000000000000000000000000000 (size!32536 a!3488)))))

(assert (=> d!128017 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22309) e!599366)))

(declare-fun bm!44770 () Bool)

(declare-fun call!44773 () Bool)

(declare-fun c!106992 () Bool)

(assert (=> bm!44770 (= call!44773 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106992 (Cons!22308 (select (arr!32000 a!3488) #b00000000000000000000000000000000) Nil!22309) Nil!22309)))))

(declare-fun b!1054844 () Bool)

(declare-fun e!599365 () Bool)

(assert (=> b!1054844 (= e!599365 call!44773)))

(declare-fun b!1054845 () Bool)

(declare-fun contains!6174 (List!22312 (_ BitVec 64)) Bool)

(assert (=> b!1054845 (= e!599368 (contains!6174 Nil!22309 (select (arr!32000 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1054846 () Bool)

(assert (=> b!1054846 (= e!599367 e!599365)))

(assert (=> b!1054846 (= c!106992 (validKeyInArray!0 (select (arr!32000 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1054847 () Bool)

(assert (=> b!1054847 (= e!599365 call!44773)))

(assert (= (and d!128017 (not res!703779)) b!1054843))

(assert (= (and b!1054843 res!703781) b!1054845))

(assert (= (and b!1054843 res!703780) b!1054846))

(assert (= (and b!1054846 c!106992) b!1054844))

(assert (= (and b!1054846 (not c!106992)) b!1054847))

(assert (= (or b!1054844 b!1054847) bm!44770))

(declare-fun m!974891 () Bool)

(assert (=> b!1054843 m!974891))

(assert (=> b!1054843 m!974891))

(declare-fun m!974893 () Bool)

(assert (=> b!1054843 m!974893))

(assert (=> bm!44770 m!974891))

(declare-fun m!974895 () Bool)

(assert (=> bm!44770 m!974895))

(assert (=> b!1054845 m!974891))

(assert (=> b!1054845 m!974891))

(declare-fun m!974897 () Bool)

(assert (=> b!1054845 m!974897))

(assert (=> b!1054846 m!974891))

(assert (=> b!1054846 m!974891))

(assert (=> b!1054846 m!974893))

(assert (=> b!1054800 d!128017))

(declare-fun d!128019 () Bool)

(assert (=> d!128019 (= (array_inv!24780 a!3488) (bvsge (size!32536 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92876 d!128019))

(declare-fun d!128021 () Bool)

(declare-fun res!703786 () Bool)

(declare-fun e!599373 () Bool)

(assert (=> d!128021 (=> res!703786 e!599373)))

(assert (=> d!128021 (= res!703786 (= (select (arr!32000 a!3488) (bvadd #b00000000000000000000000000000001 i!1381)) k0!2747))))

(assert (=> d!128021 (= (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381)) e!599373)))

(declare-fun b!1054852 () Bool)

(declare-fun e!599374 () Bool)

(assert (=> b!1054852 (= e!599373 e!599374)))

(declare-fun res!703787 () Bool)

(assert (=> b!1054852 (=> (not res!703787) (not e!599374))))

(assert (=> b!1054852 (= res!703787 (bvslt (bvadd #b00000000000000000000000000000001 i!1381 #b00000000000000000000000000000001) (size!32536 a!3488)))))

(declare-fun b!1054853 () Bool)

(assert (=> b!1054853 (= e!599374 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128021 (not res!703786)) b!1054852))

(assert (= (and b!1054852 res!703787) b!1054853))

(declare-fun m!974899 () Bool)

(assert (=> d!128021 m!974899))

(declare-fun m!974901 () Bool)

(assert (=> b!1054853 m!974901))

(assert (=> b!1054798 d!128021))

(declare-fun d!128023 () Bool)

(assert (=> d!128023 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!465579 () Unit!34558)

(declare-fun choose!114 (array!66536 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34558)

(assert (=> d!128023 (= lt!465579 (choose!114 a!3488 k0!2747 lt!465562 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> d!128023 (bvsge lt!465562 #b00000000000000000000000000000000)))

(assert (=> d!128023 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465562 (bvadd #b00000000000000000000000000000001 i!1381)) lt!465579)))

(declare-fun bs!30913 () Bool)

(assert (= bs!30913 d!128023))

(assert (=> bs!30913 m!974853))

(declare-fun m!974903 () Bool)

(assert (=> bs!30913 m!974903))

(assert (=> b!1054798 d!128023))

(declare-fun b!1054856 () Bool)

(declare-fun e!599380 () Bool)

(declare-fun e!599381 () Bool)

(assert (=> b!1054856 (= e!599380 e!599381)))

(declare-fun res!703793 () Bool)

(assert (=> b!1054856 (=> (not res!703793) (not e!599381))))

(declare-fun e!599382 () Bool)

(assert (=> b!1054856 (= res!703793 (not e!599382))))

(declare-fun res!703794 () Bool)

(assert (=> b!1054856 (=> (not res!703794) (not e!599382))))

(assert (=> b!1054856 (= res!703794 (validKeyInArray!0 (select (arr!32000 a!3488) i!1381)))))

(declare-fun d!128027 () Bool)

(declare-fun res!703792 () Bool)

(assert (=> d!128027 (=> res!703792 e!599380)))

(assert (=> d!128027 (= res!703792 (bvsge i!1381 (size!32536 a!3488)))))

(assert (=> d!128027 (= (arrayNoDuplicates!0 a!3488 i!1381 Nil!22309) e!599380)))

(declare-fun call!44774 () Bool)

(declare-fun c!106993 () Bool)

(declare-fun bm!44771 () Bool)

(assert (=> bm!44771 (= call!44774 (arrayNoDuplicates!0 a!3488 (bvadd i!1381 #b00000000000000000000000000000001) (ite c!106993 (Cons!22308 (select (arr!32000 a!3488) i!1381) Nil!22309) Nil!22309)))))

(declare-fun b!1054857 () Bool)

(declare-fun e!599379 () Bool)

(assert (=> b!1054857 (= e!599379 call!44774)))

(declare-fun b!1054858 () Bool)

(assert (=> b!1054858 (= e!599382 (contains!6174 Nil!22309 (select (arr!32000 a!3488) i!1381)))))

(declare-fun b!1054859 () Bool)

(assert (=> b!1054859 (= e!599381 e!599379)))

(assert (=> b!1054859 (= c!106993 (validKeyInArray!0 (select (arr!32000 a!3488) i!1381)))))

(declare-fun b!1054860 () Bool)

(assert (=> b!1054860 (= e!599379 call!44774)))

(assert (= (and d!128027 (not res!703792)) b!1054856))

(assert (= (and b!1054856 res!703794) b!1054858))

(assert (= (and b!1054856 res!703793) b!1054859))

(assert (= (and b!1054859 c!106993) b!1054857))

(assert (= (and b!1054859 (not c!106993)) b!1054860))

(assert (= (or b!1054857 b!1054860) bm!44771))

(assert (=> b!1054856 m!974839))

(assert (=> b!1054856 m!974839))

(declare-fun m!974905 () Bool)

(assert (=> b!1054856 m!974905))

(assert (=> bm!44771 m!974839))

(declare-fun m!974907 () Bool)

(assert (=> bm!44771 m!974907))

(assert (=> b!1054858 m!974839))

(assert (=> b!1054858 m!974839))

(declare-fun m!974909 () Bool)

(assert (=> b!1054858 m!974909))

(assert (=> b!1054859 m!974839))

(assert (=> b!1054859 m!974839))

(assert (=> b!1054859 m!974905))

(assert (=> b!1054798 d!128027))

(declare-fun d!128029 () Bool)

(assert (=> d!128029 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22309)))

(declare-fun lt!465584 () Unit!34558)

(declare-fun choose!39 (array!66536 (_ BitVec 32) (_ BitVec 32)) Unit!34558)

(assert (=> d!128029 (= lt!465584 (choose!39 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (=> d!128029 (bvslt (size!32536 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!128029 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381) lt!465584)))

(declare-fun bs!30914 () Bool)

(assert (= bs!30914 d!128029))

(assert (=> bs!30914 m!974857))

(declare-fun m!974919 () Bool)

(assert (=> bs!30914 m!974919))

(assert (=> b!1054798 d!128029))

(declare-fun d!128039 () Bool)

(declare-fun lt!465588 () (_ BitVec 32))

(assert (=> d!128039 (and (or (bvslt lt!465588 #b00000000000000000000000000000000) (bvsge lt!465588 (size!32536 lt!465561)) (and (bvsge lt!465588 #b00000000000000000000000000000000) (bvslt lt!465588 (size!32536 lt!465561)))) (bvsge lt!465588 #b00000000000000000000000000000000) (bvslt lt!465588 (size!32536 lt!465561)) (= (select (arr!32000 lt!465561) lt!465588) k0!2747))))

(declare-fun e!599409 () (_ BitVec 32))

(assert (=> d!128039 (= lt!465588 e!599409)))

(declare-fun c!107001 () Bool)

(assert (=> d!128039 (= c!107001 (= (select (arr!32000 lt!465561) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128039 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32536 lt!465561)) (bvslt (size!32536 lt!465561) #b01111111111111111111111111111111))))

(assert (=> d!128039 (= (arrayScanForKey!0 lt!465561 k0!2747 #b00000000000000000000000000000000) lt!465588)))

(declare-fun b!1054896 () Bool)

(assert (=> b!1054896 (= e!599409 #b00000000000000000000000000000000)))

(declare-fun b!1054897 () Bool)

(assert (=> b!1054897 (= e!599409 (arrayScanForKey!0 lt!465561 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128039 c!107001) b!1054896))

(assert (= (and d!128039 (not c!107001)) b!1054897))

(declare-fun m!974929 () Bool)

(assert (=> d!128039 m!974929))

(declare-fun m!974931 () Bool)

(assert (=> d!128039 m!974931))

(declare-fun m!974935 () Bool)

(assert (=> b!1054897 m!974935))

(assert (=> b!1054804 d!128039))

(declare-fun d!128043 () Bool)

(assert (=> d!128043 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1054802 d!128043))

(declare-fun d!128049 () Bool)

(declare-fun res!703817 () Bool)

(declare-fun e!599414 () Bool)

(assert (=> d!128049 (=> res!703817 e!599414)))

(assert (=> d!128049 (= res!703817 (= (select (arr!32000 a!3488) lt!465562) k0!2747))))

(assert (=> d!128049 (= (arrayContainsKey!0 a!3488 k0!2747 lt!465562) e!599414)))

(declare-fun b!1054903 () Bool)

(declare-fun e!599415 () Bool)

(assert (=> b!1054903 (= e!599414 e!599415)))

(declare-fun res!703818 () Bool)

(assert (=> b!1054903 (=> (not res!703818) (not e!599415))))

(assert (=> b!1054903 (= res!703818 (bvslt (bvadd lt!465562 #b00000000000000000000000000000001) (size!32536 a!3488)))))

(declare-fun b!1054904 () Bool)

(assert (=> b!1054904 (= e!599415 (arrayContainsKey!0 a!3488 k0!2747 (bvadd lt!465562 #b00000000000000000000000000000001)))))

(assert (= (and d!128049 (not res!703817)) b!1054903))

(assert (= (and b!1054903 res!703818) b!1054904))

(declare-fun m!974943 () Bool)

(assert (=> d!128049 m!974943))

(declare-fun m!974945 () Bool)

(assert (=> b!1054904 m!974945))

(assert (=> b!1054797 d!128049))

(declare-fun d!128051 () Bool)

(declare-fun res!703819 () Bool)

(declare-fun e!599416 () Bool)

(assert (=> d!128051 (=> res!703819 e!599416)))

(assert (=> d!128051 (= res!703819 (= (select (arr!32000 lt!465561) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128051 (= (arrayContainsKey!0 lt!465561 k0!2747 #b00000000000000000000000000000000) e!599416)))

(declare-fun b!1054905 () Bool)

(declare-fun e!599417 () Bool)

(assert (=> b!1054905 (= e!599416 e!599417)))

(declare-fun res!703820 () Bool)

(assert (=> b!1054905 (=> (not res!703820) (not e!599417))))

(assert (=> b!1054905 (= res!703820 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32536 lt!465561)))))

(declare-fun b!1054906 () Bool)

(assert (=> b!1054906 (= e!599417 (arrayContainsKey!0 lt!465561 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128051 (not res!703819)) b!1054905))

(assert (= (and b!1054905 res!703820) b!1054906))

(assert (=> d!128051 m!974931))

(declare-fun m!974947 () Bool)

(assert (=> b!1054906 m!974947))

(assert (=> b!1054803 d!128051))

(check-sat (not b!1054906) (not d!128023) (not b!1054904) (not b!1054845) (not b!1054856) (not b!1054858) (not bm!44770) (not b!1054846) (not b!1054859) (not d!128029) (not b!1054897) (not b!1054843) (not b!1054853) (not bm!44771))
(check-sat)
