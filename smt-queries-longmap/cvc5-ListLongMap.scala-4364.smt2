; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60212 () Bool)

(assert start!60212)

(declare-fun b!673900 () Bool)

(declare-fun e!384764 () Bool)

(declare-fun e!384767 () Bool)

(assert (=> b!673900 (= e!384764 e!384767)))

(declare-fun res!440425 () Bool)

(assert (=> b!673900 (=> (not res!440425) (not e!384767))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!673900 (= res!440425 (bvsle from!3004 i!1382))))

(declare-fun b!673901 () Bool)

(declare-fun res!440417 () Bool)

(declare-fun e!384759 () Bool)

(assert (=> b!673901 (=> (not res!440417) (not e!384759))))

(declare-datatypes ((array!39259 0))(
  ( (array!39260 (arr!18822 (Array (_ BitVec 32) (_ BitVec 64))) (size!19186 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39259)

(declare-datatypes ((List!12863 0))(
  ( (Nil!12860) (Cons!12859 (h!13904 (_ BitVec 64)) (t!19091 List!12863)) )
))
(declare-fun arrayNoDuplicates!0 (array!39259 (_ BitVec 32) List!12863) Bool)

(assert (=> b!673901 (= res!440417 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12860))))

(declare-fun b!673902 () Bool)

(declare-fun res!440435 () Bool)

(assert (=> b!673902 (=> (not res!440435) (not e!384759))))

(declare-fun acc!681 () List!12863)

(declare-fun contains!3440 (List!12863 (_ BitVec 64)) Bool)

(assert (=> b!673902 (= res!440435 (not (contains!3440 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673903 () Bool)

(declare-fun res!440434 () Bool)

(assert (=> b!673903 (=> (not res!440434) (not e!384759))))

(assert (=> b!673903 (= res!440434 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!673904 () Bool)

(declare-fun res!440421 () Bool)

(assert (=> b!673904 (=> (not res!440421) (not e!384759))))

(assert (=> b!673904 (= res!440421 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19186 a!3626))))))

(declare-fun b!673905 () Bool)

(declare-datatypes ((Unit!23700 0))(
  ( (Unit!23701) )
))
(declare-fun e!384760 () Unit!23700)

(declare-fun Unit!23702 () Unit!23700)

(assert (=> b!673905 (= e!384760 Unit!23702)))

(declare-fun b!673906 () Bool)

(declare-fun res!440422 () Bool)

(assert (=> b!673906 (=> (not res!440422) (not e!384759))))

(assert (=> b!673906 (= res!440422 e!384764)))

(declare-fun res!440432 () Bool)

(assert (=> b!673906 (=> res!440432 e!384764)))

(declare-fun e!384763 () Bool)

(assert (=> b!673906 (= res!440432 e!384763)))

(declare-fun res!440413 () Bool)

(assert (=> b!673906 (=> (not res!440413) (not e!384763))))

(assert (=> b!673906 (= res!440413 (bvsgt from!3004 i!1382))))

(declare-fun b!673907 () Bool)

(declare-fun res!440416 () Bool)

(assert (=> b!673907 (=> (not res!440416) (not e!384759))))

(assert (=> b!673907 (= res!440416 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19186 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!673908 () Bool)

(declare-fun e!384762 () Bool)

(declare-fun lt!312536 () List!12863)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!673908 (= e!384762 (contains!3440 lt!312536 k!2843))))

(declare-fun b!673909 () Bool)

(declare-fun res!440429 () Bool)

(declare-fun e!384758 () Bool)

(assert (=> b!673909 (=> (not res!440429) (not e!384758))))

(assert (=> b!673909 (= res!440429 (not (contains!3440 lt!312536 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673910 () Bool)

(declare-fun e!384766 () Bool)

(assert (=> b!673910 (= e!384766 (not (contains!3440 lt!312536 k!2843)))))

(declare-fun b!673911 () Bool)

(declare-fun res!440428 () Bool)

(assert (=> b!673911 (=> (not res!440428) (not e!384758))))

(assert (=> b!673911 (= res!440428 (not (contains!3440 lt!312536 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673912 () Bool)

(declare-fun res!440419 () Bool)

(assert (=> b!673912 (=> (not res!440419) (not e!384759))))

(declare-fun arrayContainsKey!0 (array!39259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!673912 (= res!440419 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!673913 () Bool)

(declare-fun res!440418 () Bool)

(assert (=> b!673913 (=> (not res!440418) (not e!384759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!673913 (= res!440418 (validKeyInArray!0 (select (arr!18822 a!3626) from!3004)))))

(declare-fun b!673914 () Bool)

(declare-fun Unit!23703 () Unit!23700)

(assert (=> b!673914 (= e!384760 Unit!23703)))

(assert (=> b!673914 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312538 () Unit!23700)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39259 (_ BitVec 64) (_ BitVec 32)) Unit!23700)

(assert (=> b!673914 (= lt!312538 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!673914 false))

(declare-fun b!673915 () Bool)

(declare-fun e!384765 () Bool)

(assert (=> b!673915 (= e!384759 e!384765)))

(declare-fun res!440424 () Bool)

(assert (=> b!673915 (=> (not res!440424) (not e!384765))))

(assert (=> b!673915 (= res!440424 (not (= (select (arr!18822 a!3626) from!3004) k!2843)))))

(declare-fun lt!312535 () Unit!23700)

(assert (=> b!673915 (= lt!312535 e!384760)))

(declare-fun c!77111 () Bool)

(assert (=> b!673915 (= c!77111 (= (select (arr!18822 a!3626) from!3004) k!2843))))

(declare-fun b!673916 () Bool)

(assert (=> b!673916 (= e!384758 false)))

(declare-fun lt!312537 () Bool)

(assert (=> b!673916 (= lt!312537 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312536))))

(declare-fun b!673917 () Bool)

(declare-fun res!440415 () Bool)

(assert (=> b!673917 (=> (not res!440415) (not e!384759))))

(assert (=> b!673917 (= res!440415 (validKeyInArray!0 k!2843))))

(declare-fun res!440423 () Bool)

(assert (=> start!60212 (=> (not res!440423) (not e!384759))))

(assert (=> start!60212 (= res!440423 (and (bvslt (size!19186 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19186 a!3626))))))

(assert (=> start!60212 e!384759))

(assert (=> start!60212 true))

(declare-fun array_inv!14618 (array!39259) Bool)

(assert (=> start!60212 (array_inv!14618 a!3626)))

(declare-fun b!673918 () Bool)

(declare-fun res!440427 () Bool)

(assert (=> b!673918 (=> (not res!440427) (not e!384759))))

(assert (=> b!673918 (= res!440427 (not (contains!3440 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673919 () Bool)

(declare-fun res!440430 () Bool)

(assert (=> b!673919 (=> (not res!440430) (not e!384758))))

(declare-fun e!384768 () Bool)

(assert (=> b!673919 (= res!440430 e!384768)))

(declare-fun res!440412 () Bool)

(assert (=> b!673919 (=> res!440412 e!384768)))

(assert (=> b!673919 (= res!440412 e!384762)))

(declare-fun res!440414 () Bool)

(assert (=> b!673919 (=> (not res!440414) (not e!384762))))

(assert (=> b!673919 (= res!440414 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673920 () Bool)

(declare-fun res!440420 () Bool)

(assert (=> b!673920 (=> (not res!440420) (not e!384758))))

(declare-fun noDuplicate!687 (List!12863) Bool)

(assert (=> b!673920 (= res!440420 (noDuplicate!687 lt!312536))))

(declare-fun b!673921 () Bool)

(declare-fun res!440433 () Bool)

(assert (=> b!673921 (=> (not res!440433) (not e!384759))))

(assert (=> b!673921 (= res!440433 (noDuplicate!687 acc!681))))

(declare-fun b!673922 () Bool)

(assert (=> b!673922 (= e!384767 (not (contains!3440 acc!681 k!2843)))))

(declare-fun b!673923 () Bool)

(assert (=> b!673923 (= e!384768 e!384766)))

(declare-fun res!440431 () Bool)

(assert (=> b!673923 (=> (not res!440431) (not e!384766))))

(assert (=> b!673923 (= res!440431 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673924 () Bool)

(assert (=> b!673924 (= e!384763 (contains!3440 acc!681 k!2843))))

(declare-fun b!673925 () Bool)

(assert (=> b!673925 (= e!384765 e!384758)))

(declare-fun res!440426 () Bool)

(assert (=> b!673925 (=> (not res!440426) (not e!384758))))

(assert (=> b!673925 (= res!440426 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!290 (List!12863 (_ BitVec 64)) List!12863)

(assert (=> b!673925 (= lt!312536 ($colon$colon!290 acc!681 (select (arr!18822 a!3626) from!3004)))))

(assert (= (and start!60212 res!440423) b!673921))

(assert (= (and b!673921 res!440433) b!673902))

(assert (= (and b!673902 res!440435) b!673918))

(assert (= (and b!673918 res!440427) b!673906))

(assert (= (and b!673906 res!440413) b!673924))

(assert (= (and b!673906 (not res!440432)) b!673900))

(assert (= (and b!673900 res!440425) b!673922))

(assert (= (and b!673906 res!440422) b!673901))

(assert (= (and b!673901 res!440417) b!673903))

(assert (= (and b!673903 res!440434) b!673904))

(assert (= (and b!673904 res!440421) b!673917))

(assert (= (and b!673917 res!440415) b!673912))

(assert (= (and b!673912 res!440419) b!673907))

(assert (= (and b!673907 res!440416) b!673913))

(assert (= (and b!673913 res!440418) b!673915))

(assert (= (and b!673915 c!77111) b!673914))

(assert (= (and b!673915 (not c!77111)) b!673905))

(assert (= (and b!673915 res!440424) b!673925))

(assert (= (and b!673925 res!440426) b!673920))

(assert (= (and b!673920 res!440420) b!673909))

(assert (= (and b!673909 res!440429) b!673911))

(assert (= (and b!673911 res!440428) b!673919))

(assert (= (and b!673919 res!440414) b!673908))

(assert (= (and b!673919 (not res!440412)) b!673923))

(assert (= (and b!673923 res!440431) b!673910))

(assert (= (and b!673919 res!440430) b!673916))

(declare-fun m!642113 () Bool)

(assert (=> b!673908 m!642113))

(declare-fun m!642115 () Bool)

(assert (=> b!673909 m!642115))

(declare-fun m!642117 () Bool)

(assert (=> b!673911 m!642117))

(declare-fun m!642119 () Bool)

(assert (=> b!673916 m!642119))

(declare-fun m!642121 () Bool)

(assert (=> b!673922 m!642121))

(assert (=> b!673910 m!642113))

(declare-fun m!642123 () Bool)

(assert (=> b!673903 m!642123))

(declare-fun m!642125 () Bool)

(assert (=> b!673925 m!642125))

(assert (=> b!673925 m!642125))

(declare-fun m!642127 () Bool)

(assert (=> b!673925 m!642127))

(declare-fun m!642129 () Bool)

(assert (=> b!673914 m!642129))

(declare-fun m!642131 () Bool)

(assert (=> b!673914 m!642131))

(declare-fun m!642133 () Bool)

(assert (=> start!60212 m!642133))

(declare-fun m!642135 () Bool)

(assert (=> b!673918 m!642135))

(assert (=> b!673924 m!642121))

(declare-fun m!642137 () Bool)

(assert (=> b!673902 m!642137))

(assert (=> b!673913 m!642125))

(assert (=> b!673913 m!642125))

(declare-fun m!642139 () Bool)

(assert (=> b!673913 m!642139))

(assert (=> b!673915 m!642125))

(declare-fun m!642141 () Bool)

(assert (=> b!673901 m!642141))

(declare-fun m!642143 () Bool)

(assert (=> b!673920 m!642143))

(declare-fun m!642145 () Bool)

(assert (=> b!673921 m!642145))

(declare-fun m!642147 () Bool)

(assert (=> b!673912 m!642147))

(declare-fun m!642149 () Bool)

(assert (=> b!673917 m!642149))

(push 1)

