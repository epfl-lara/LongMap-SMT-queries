; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60060 () Bool)

(assert start!60060)

(declare-fun b!668982 () Bool)

(declare-fun e!382640 () Bool)

(declare-datatypes ((List!12831 0))(
  ( (Nil!12828) (Cons!12827 (h!13872 (_ BitVec 64)) (t!19050 List!12831)) )
))
(declare-fun lt!311301 () List!12831)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3353 (List!12831 (_ BitVec 64)) Bool)

(assert (=> b!668982 (= e!382640 (contains!3353 lt!311301 k!2843))))

(declare-fun b!668983 () Bool)

(declare-fun e!382642 () Bool)

(assert (=> b!668983 (= e!382642 true)))

(declare-fun lt!311306 () Bool)

(declare-fun e!382644 () Bool)

(assert (=> b!668983 (= lt!311306 e!382644)))

(declare-fun res!436078 () Bool)

(assert (=> b!668983 (=> res!436078 e!382644)))

(assert (=> b!668983 (= res!436078 e!382640)))

(declare-fun res!436058 () Bool)

(assert (=> b!668983 (=> (not res!436058) (not e!382640))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!668983 (= res!436058 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668984 () Bool)

(declare-fun e!382645 () Bool)

(assert (=> b!668984 (= e!382644 e!382645)))

(declare-fun res!436060 () Bool)

(assert (=> b!668984 (=> (not res!436060) (not e!382645))))

(assert (=> b!668984 (= res!436060 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668985 () Bool)

(declare-fun res!436064 () Bool)

(declare-fun e!382638 () Bool)

(assert (=> b!668985 (=> (not res!436064) (not e!382638))))

(declare-fun acc!681 () List!12831)

(declare-fun noDuplicate!622 (List!12831) Bool)

(assert (=> b!668985 (= res!436064 (noDuplicate!622 acc!681))))

(declare-fun b!668986 () Bool)

(declare-fun res!436076 () Bool)

(assert (=> b!668986 (=> (not res!436076) (not e!382638))))

(assert (=> b!668986 (= res!436076 (not (contains!3353 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668987 () Bool)

(declare-fun res!436065 () Bool)

(assert (=> b!668987 (=> (not res!436065) (not e!382638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!668987 (= res!436065 (validKeyInArray!0 k!2843))))

(declare-fun b!668988 () Bool)

(declare-fun res!436063 () Bool)

(assert (=> b!668988 (=> res!436063 e!382642)))

(assert (=> b!668988 (= res!436063 (contains!3353 lt!311301 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668989 () Bool)

(declare-fun res!436068 () Bool)

(assert (=> b!668989 (=> (not res!436068) (not e!382638))))

(declare-datatypes ((array!39118 0))(
  ( (array!39119 (arr!18751 (Array (_ BitVec 32) (_ BitVec 64))) (size!19116 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39118)

(declare-fun arrayNoDuplicates!0 (array!39118 (_ BitVec 32) List!12831) Bool)

(assert (=> b!668989 (= res!436068 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!668990 () Bool)

(declare-datatypes ((Unit!23463 0))(
  ( (Unit!23464) )
))
(declare-fun e!382641 () Unit!23463)

(declare-fun Unit!23465 () Unit!23463)

(assert (=> b!668990 (= e!382641 Unit!23465)))

(declare-fun lt!311305 () Unit!23463)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39118 (_ BitVec 64) (_ BitVec 32)) Unit!23463)

(assert (=> b!668990 (= lt!311305 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!668990 false))

(declare-fun b!668991 () Bool)

(declare-fun res!436062 () Bool)

(assert (=> b!668991 (=> res!436062 e!382642)))

(assert (=> b!668991 (= res!436062 (contains!3353 lt!311301 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668992 () Bool)

(declare-fun res!436066 () Bool)

(assert (=> b!668992 (=> (not res!436066) (not e!382638))))

(declare-fun e!382643 () Bool)

(assert (=> b!668992 (= res!436066 e!382643)))

(declare-fun res!436073 () Bool)

(assert (=> b!668992 (=> res!436073 e!382643)))

(declare-fun e!382646 () Bool)

(assert (=> b!668992 (= res!436073 e!382646)))

(declare-fun res!436075 () Bool)

(assert (=> b!668992 (=> (not res!436075) (not e!382646))))

(assert (=> b!668992 (= res!436075 (bvsgt from!3004 i!1382))))

(declare-fun b!668993 () Bool)

(declare-fun res!436059 () Bool)

(assert (=> b!668993 (=> (not res!436059) (not e!382638))))

(assert (=> b!668993 (= res!436059 (not (contains!3353 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668994 () Bool)

(declare-fun res!436067 () Bool)

(assert (=> b!668994 (=> (not res!436067) (not e!382638))))

(assert (=> b!668994 (= res!436067 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19116 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!668996 () Bool)

(assert (=> b!668996 (= e!382638 (not e!382642))))

(declare-fun res!436072 () Bool)

(assert (=> b!668996 (=> res!436072 e!382642)))

(assert (=> b!668996 (= res!436072 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!668996 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311301)))

(declare-fun lt!311299 () Unit!23463)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39118 (_ BitVec 64) (_ BitVec 32) List!12831 List!12831) Unit!23463)

(assert (=> b!668996 (= lt!311299 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311301))))

(declare-fun -!107 (List!12831 (_ BitVec 64)) List!12831)

(assert (=> b!668996 (= (-!107 lt!311301 k!2843) acc!681)))

(declare-fun $colon$colon!240 (List!12831 (_ BitVec 64)) List!12831)

(assert (=> b!668996 (= lt!311301 ($colon$colon!240 acc!681 k!2843))))

(declare-fun lt!311302 () Unit!23463)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12831) Unit!23463)

(assert (=> b!668996 (= lt!311302 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!109 (List!12831 List!12831) Bool)

(assert (=> b!668996 (subseq!109 acc!681 acc!681)))

(declare-fun lt!311307 () Unit!23463)

(declare-fun lemmaListSubSeqRefl!0 (List!12831) Unit!23463)

(assert (=> b!668996 (= lt!311307 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668996 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311304 () Unit!23463)

(declare-fun e!382637 () Unit!23463)

(assert (=> b!668996 (= lt!311304 e!382637)))

(declare-fun c!76829 () Bool)

(assert (=> b!668996 (= c!76829 (validKeyInArray!0 (select (arr!18751 a!3626) from!3004)))))

(declare-fun lt!311300 () Unit!23463)

(assert (=> b!668996 (= lt!311300 e!382641)))

(declare-fun c!76830 () Bool)

(declare-fun arrayContainsKey!0 (array!39118 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!668996 (= c!76830 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668996 (arrayContainsKey!0 (array!39119 (store (arr!18751 a!3626) i!1382 k!2843) (size!19116 a!3626)) k!2843 from!3004)))

(declare-fun b!668997 () Bool)

(declare-fun res!436077 () Bool)

(assert (=> b!668997 (=> (not res!436077) (not e!382638))))

(assert (=> b!668997 (= res!436077 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!668998 () Bool)

(declare-fun lt!311298 () Unit!23463)

(assert (=> b!668998 (= e!382637 lt!311298)))

(declare-fun lt!311303 () Unit!23463)

(assert (=> b!668998 (= lt!311303 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668998 (subseq!109 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39118 List!12831 List!12831 (_ BitVec 32)) Unit!23463)

(assert (=> b!668998 (= lt!311298 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!240 acc!681 (select (arr!18751 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668998 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!668999 () Bool)

(assert (=> b!668999 (= e!382645 (not (contains!3353 lt!311301 k!2843)))))

(declare-fun b!669000 () Bool)

(declare-fun Unit!23466 () Unit!23463)

(assert (=> b!669000 (= e!382637 Unit!23466)))

(declare-fun b!669001 () Bool)

(declare-fun e!382639 () Bool)

(assert (=> b!669001 (= e!382639 (not (contains!3353 acc!681 k!2843)))))

(declare-fun b!669002 () Bool)

(declare-fun res!436074 () Bool)

(assert (=> b!669002 (=> res!436074 e!382642)))

(assert (=> b!669002 (= res!436074 (not (noDuplicate!622 lt!311301)))))

(declare-fun b!669003 () Bool)

(declare-fun res!436069 () Bool)

(assert (=> b!669003 (=> (not res!436069) (not e!382638))))

(assert (=> b!669003 (= res!436069 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19116 a!3626))))))

(declare-fun b!669004 () Bool)

(declare-fun res!436070 () Bool)

(assert (=> b!669004 (=> (not res!436070) (not e!382638))))

(assert (=> b!669004 (= res!436070 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12828))))

(declare-fun b!668995 () Bool)

(assert (=> b!668995 (= e!382643 e!382639)))

(declare-fun res!436071 () Bool)

(assert (=> b!668995 (=> (not res!436071) (not e!382639))))

(assert (=> b!668995 (= res!436071 (bvsle from!3004 i!1382))))

(declare-fun res!436061 () Bool)

(assert (=> start!60060 (=> (not res!436061) (not e!382638))))

(assert (=> start!60060 (= res!436061 (and (bvslt (size!19116 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19116 a!3626))))))

(assert (=> start!60060 e!382638))

(assert (=> start!60060 true))

(declare-fun array_inv!14634 (array!39118) Bool)

(assert (=> start!60060 (array_inv!14634 a!3626)))

(declare-fun b!669005 () Bool)

(declare-fun Unit!23467 () Unit!23463)

(assert (=> b!669005 (= e!382641 Unit!23467)))

(declare-fun b!669006 () Bool)

(assert (=> b!669006 (= e!382646 (contains!3353 acc!681 k!2843))))

(assert (= (and start!60060 res!436061) b!668985))

(assert (= (and b!668985 res!436064) b!668993))

(assert (= (and b!668993 res!436059) b!668986))

(assert (= (and b!668986 res!436076) b!668992))

(assert (= (and b!668992 res!436075) b!669006))

(assert (= (and b!668992 (not res!436073)) b!668995))

(assert (= (and b!668995 res!436071) b!669001))

(assert (= (and b!668992 res!436066) b!669004))

(assert (= (and b!669004 res!436070) b!668989))

(assert (= (and b!668989 res!436068) b!669003))

(assert (= (and b!669003 res!436069) b!668987))

(assert (= (and b!668987 res!436065) b!668997))

(assert (= (and b!668997 res!436077) b!668994))

(assert (= (and b!668994 res!436067) b!668996))

(assert (= (and b!668996 c!76830) b!668990))

(assert (= (and b!668996 (not c!76830)) b!669005))

(assert (= (and b!668996 c!76829) b!668998))

(assert (= (and b!668996 (not c!76829)) b!669000))

(assert (= (and b!668996 (not res!436072)) b!669002))

(assert (= (and b!669002 (not res!436074)) b!668988))

(assert (= (and b!668988 (not res!436063)) b!668991))

(assert (= (and b!668991 (not res!436062)) b!668983))

(assert (= (and b!668983 res!436058) b!668982))

(assert (= (and b!668983 (not res!436078)) b!668984))

(assert (= (and b!668984 res!436060) b!668999))

(declare-fun m!638627 () Bool)

(assert (=> b!669006 m!638627))

(declare-fun m!638629 () Bool)

(assert (=> start!60060 m!638629))

(declare-fun m!638631 () Bool)

(assert (=> b!668993 m!638631))

(declare-fun m!638633 () Bool)

(assert (=> b!669004 m!638633))

(declare-fun m!638635 () Bool)

(assert (=> b!668990 m!638635))

(declare-fun m!638637 () Bool)

(assert (=> b!669002 m!638637))

(declare-fun m!638639 () Bool)

(assert (=> b!668985 m!638639))

(declare-fun m!638641 () Bool)

(assert (=> b!668997 m!638641))

(declare-fun m!638643 () Bool)

(assert (=> b!668991 m!638643))

(assert (=> b!669001 m!638627))

(declare-fun m!638645 () Bool)

(assert (=> b!668999 m!638645))

(declare-fun m!638647 () Bool)

(assert (=> b!668986 m!638647))

(declare-fun m!638649 () Bool)

(assert (=> b!668988 m!638649))

(declare-fun m!638651 () Bool)

(assert (=> b!668989 m!638651))

(declare-fun m!638653 () Bool)

(assert (=> b!668996 m!638653))

(declare-fun m!638655 () Bool)

(assert (=> b!668996 m!638655))

(declare-fun m!638657 () Bool)

(assert (=> b!668996 m!638657))

(declare-fun m!638659 () Bool)

(assert (=> b!668996 m!638659))

(declare-fun m!638661 () Bool)

(assert (=> b!668996 m!638661))

(declare-fun m!638663 () Bool)

(assert (=> b!668996 m!638663))

(declare-fun m!638665 () Bool)

(assert (=> b!668996 m!638665))

(declare-fun m!638667 () Bool)

(assert (=> b!668996 m!638667))

(declare-fun m!638669 () Bool)

(assert (=> b!668996 m!638669))

(declare-fun m!638671 () Bool)

(assert (=> b!668996 m!638671))

(assert (=> b!668996 m!638663))

(declare-fun m!638673 () Bool)

(assert (=> b!668996 m!638673))

(declare-fun m!638675 () Bool)

(assert (=> b!668996 m!638675))

(declare-fun m!638677 () Bool)

(assert (=> b!668996 m!638677))

(assert (=> b!668982 m!638645))

(declare-fun m!638679 () Bool)

(assert (=> b!668987 m!638679))

(assert (=> b!668998 m!638653))

(assert (=> b!668998 m!638663))

(declare-fun m!638681 () Bool)

(assert (=> b!668998 m!638681))

(declare-fun m!638683 () Bool)

(assert (=> b!668998 m!638683))

(assert (=> b!668998 m!638663))

(assert (=> b!668998 m!638681))

(assert (=> b!668998 m!638659))

(assert (=> b!668998 m!638677))

(push 1)

(assert (not b!668990))

(assert (not b!668989))

(assert (not b!668993))

(assert (not b!669006))

(assert (not b!668982))

(assert (not b!668985))

(assert (not b!668996))

(assert (not b!669002))

(assert (not b!668998))

(assert (not b!668987))

(assert (not b!668986))

(assert (not b!669001))

(assert (not b!669004))

(assert (not b!668988))

(assert (not b!668997))

(assert (not b!668999))

(assert (not start!60060))

(assert (not b!668991))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

