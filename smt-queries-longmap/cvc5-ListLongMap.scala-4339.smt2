; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60062 () Bool)

(assert start!60062)

(declare-fun b!668903 () Bool)

(declare-datatypes ((Unit!23460 0))(
  ( (Unit!23461) )
))
(declare-fun e!382671 () Unit!23460)

(declare-fun Unit!23462 () Unit!23460)

(assert (=> b!668903 (= e!382671 Unit!23462)))

(declare-fun b!668904 () Bool)

(declare-fun res!435881 () Bool)

(declare-fun e!382667 () Bool)

(assert (=> b!668904 (=> (not res!435881) (not e!382667))))

(declare-datatypes ((List!12788 0))(
  ( (Nil!12785) (Cons!12784 (h!13829 (_ BitVec 64)) (t!19016 List!12788)) )
))
(declare-fun acc!681 () List!12788)

(declare-fun noDuplicate!612 (List!12788) Bool)

(assert (=> b!668904 (= res!435881 (noDuplicate!612 acc!681))))

(declare-fun b!668905 () Bool)

(declare-fun e!382661 () Bool)

(declare-fun lt!311411 () List!12788)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3365 (List!12788 (_ BitVec 64)) Bool)

(assert (=> b!668905 (= e!382661 (not (contains!3365 lt!311411 k!2843)))))

(declare-fun b!668906 () Bool)

(declare-fun res!435888 () Bool)

(declare-fun e!382663 () Bool)

(assert (=> b!668906 (=> res!435888 e!382663)))

(assert (=> b!668906 (= res!435888 (contains!3365 lt!311411 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668907 () Bool)

(declare-fun res!435894 () Bool)

(assert (=> b!668907 (=> (not res!435894) (not e!382667))))

(declare-datatypes ((array!39109 0))(
  ( (array!39110 (arr!18747 (Array (_ BitVec 32) (_ BitVec 64))) (size!19111 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39109)

(declare-fun arrayContainsKey!0 (array!39109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!668907 (= res!435894 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!668908 () Bool)

(declare-fun res!435899 () Bool)

(assert (=> b!668908 (=> (not res!435899) (not e!382667))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!668908 (= res!435899 (validKeyInArray!0 k!2843))))

(declare-fun b!668909 () Bool)

(declare-fun e!382664 () Unit!23460)

(declare-fun Unit!23463 () Unit!23460)

(assert (=> b!668909 (= e!382664 Unit!23463)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!311409 () Unit!23460)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39109 (_ BitVec 64) (_ BitVec 32)) Unit!23460)

(assert (=> b!668909 (= lt!311409 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!668909 false))

(declare-fun b!668910 () Bool)

(declare-fun res!435879 () Bool)

(assert (=> b!668910 (=> (not res!435879) (not e!382667))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!668910 (= res!435879 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19111 a!3626))))))

(declare-fun b!668911 () Bool)

(declare-fun res!435896 () Bool)

(assert (=> b!668911 (=> (not res!435896) (not e!382667))))

(assert (=> b!668911 (= res!435896 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19111 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!668912 () Bool)

(declare-fun res!435895 () Bool)

(assert (=> b!668912 (=> (not res!435895) (not e!382667))))

(assert (=> b!668912 (= res!435895 (not (contains!3365 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668913 () Bool)

(declare-fun e!382662 () Bool)

(assert (=> b!668913 (= e!382662 (not (contains!3365 acc!681 k!2843)))))

(declare-fun b!668914 () Bool)

(declare-fun e!382669 () Bool)

(assert (=> b!668914 (= e!382669 (contains!3365 lt!311411 k!2843))))

(declare-fun res!435886 () Bool)

(assert (=> start!60062 (=> (not res!435886) (not e!382667))))

(assert (=> start!60062 (= res!435886 (and (bvslt (size!19111 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19111 a!3626))))))

(assert (=> start!60062 e!382667))

(assert (=> start!60062 true))

(declare-fun array_inv!14543 (array!39109) Bool)

(assert (=> start!60062 (array_inv!14543 a!3626)))

(declare-fun b!668915 () Bool)

(declare-fun e!382670 () Bool)

(assert (=> b!668915 (= e!382670 (contains!3365 acc!681 k!2843))))

(declare-fun b!668916 () Bool)

(assert (=> b!668916 (= e!382667 (not e!382663))))

(declare-fun res!435880 () Bool)

(assert (=> b!668916 (=> res!435880 e!382663)))

(assert (=> b!668916 (= res!435880 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun arrayNoDuplicates!0 (array!39109 (_ BitVec 32) List!12788) Bool)

(assert (=> b!668916 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311411)))

(declare-fun lt!311410 () Unit!23460)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39109 (_ BitVec 64) (_ BitVec 32) List!12788 List!12788) Unit!23460)

(assert (=> b!668916 (= lt!311410 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311411))))

(declare-fun -!102 (List!12788 (_ BitVec 64)) List!12788)

(assert (=> b!668916 (= (-!102 lt!311411 k!2843) acc!681)))

(declare-fun $colon$colon!236 (List!12788 (_ BitVec 64)) List!12788)

(assert (=> b!668916 (= lt!311411 ($colon$colon!236 acc!681 k!2843))))

(declare-fun lt!311404 () Unit!23460)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12788) Unit!23460)

(assert (=> b!668916 (= lt!311404 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!104 (List!12788 List!12788) Bool)

(assert (=> b!668916 (subseq!104 acc!681 acc!681)))

(declare-fun lt!311413 () Unit!23460)

(declare-fun lemmaListSubSeqRefl!0 (List!12788) Unit!23460)

(assert (=> b!668916 (= lt!311413 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668916 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311408 () Unit!23460)

(assert (=> b!668916 (= lt!311408 e!382671)))

(declare-fun c!76880 () Bool)

(assert (=> b!668916 (= c!76880 (validKeyInArray!0 (select (arr!18747 a!3626) from!3004)))))

(declare-fun lt!311406 () Unit!23460)

(assert (=> b!668916 (= lt!311406 e!382664)))

(declare-fun c!76879 () Bool)

(assert (=> b!668916 (= c!76879 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668916 (arrayContainsKey!0 (array!39110 (store (arr!18747 a!3626) i!1382 k!2843) (size!19111 a!3626)) k!2843 from!3004)))

(declare-fun b!668917 () Bool)

(declare-fun e!382666 () Bool)

(assert (=> b!668917 (= e!382666 e!382661)))

(declare-fun res!435885 () Bool)

(assert (=> b!668917 (=> (not res!435885) (not e!382661))))

(assert (=> b!668917 (= res!435885 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668918 () Bool)

(declare-fun res!435884 () Bool)

(assert (=> b!668918 (=> res!435884 e!382663)))

(assert (=> b!668918 (= res!435884 (contains!3365 lt!311411 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668919 () Bool)

(declare-fun res!435890 () Bool)

(assert (=> b!668919 (=> (not res!435890) (not e!382667))))

(assert (=> b!668919 (= res!435890 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!668920 () Bool)

(declare-fun res!435892 () Bool)

(assert (=> b!668920 (=> res!435892 e!382663)))

(assert (=> b!668920 (= res!435892 (not (noDuplicate!612 lt!311411)))))

(declare-fun b!668921 () Bool)

(declare-fun res!435893 () Bool)

(assert (=> b!668921 (=> (not res!435893) (not e!382667))))

(assert (=> b!668921 (= res!435893 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12785))))

(declare-fun b!668922 () Bool)

(declare-fun res!435883 () Bool)

(assert (=> b!668922 (=> (not res!435883) (not e!382667))))

(declare-fun e!382665 () Bool)

(assert (=> b!668922 (= res!435883 e!382665)))

(declare-fun res!435889 () Bool)

(assert (=> b!668922 (=> res!435889 e!382665)))

(assert (=> b!668922 (= res!435889 e!382670)))

(declare-fun res!435897 () Bool)

(assert (=> b!668922 (=> (not res!435897) (not e!382670))))

(assert (=> b!668922 (= res!435897 (bvsgt from!3004 i!1382))))

(declare-fun b!668923 () Bool)

(declare-fun Unit!23464 () Unit!23460)

(assert (=> b!668923 (= e!382664 Unit!23464)))

(declare-fun b!668924 () Bool)

(declare-fun lt!311405 () Unit!23460)

(assert (=> b!668924 (= e!382671 lt!311405)))

(declare-fun lt!311412 () Unit!23460)

(assert (=> b!668924 (= lt!311412 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668924 (subseq!104 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39109 List!12788 List!12788 (_ BitVec 32)) Unit!23460)

(assert (=> b!668924 (= lt!311405 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!236 acc!681 (select (arr!18747 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668924 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!668925 () Bool)

(assert (=> b!668925 (= e!382665 e!382662)))

(declare-fun res!435891 () Bool)

(assert (=> b!668925 (=> (not res!435891) (not e!382662))))

(assert (=> b!668925 (= res!435891 (bvsle from!3004 i!1382))))

(declare-fun b!668926 () Bool)

(declare-fun res!435887 () Bool)

(assert (=> b!668926 (=> (not res!435887) (not e!382667))))

(assert (=> b!668926 (= res!435887 (not (contains!3365 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668927 () Bool)

(assert (=> b!668927 (= e!382663 true)))

(declare-fun lt!311407 () Bool)

(assert (=> b!668927 (= lt!311407 e!382666)))

(declare-fun res!435882 () Bool)

(assert (=> b!668927 (=> res!435882 e!382666)))

(assert (=> b!668927 (= res!435882 e!382669)))

(declare-fun res!435898 () Bool)

(assert (=> b!668927 (=> (not res!435898) (not e!382669))))

(assert (=> b!668927 (= res!435898 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!60062 res!435886) b!668904))

(assert (= (and b!668904 res!435881) b!668912))

(assert (= (and b!668912 res!435895) b!668926))

(assert (= (and b!668926 res!435887) b!668922))

(assert (= (and b!668922 res!435897) b!668915))

(assert (= (and b!668922 (not res!435889)) b!668925))

(assert (= (and b!668925 res!435891) b!668913))

(assert (= (and b!668922 res!435883) b!668921))

(assert (= (and b!668921 res!435893) b!668919))

(assert (= (and b!668919 res!435890) b!668910))

(assert (= (and b!668910 res!435879) b!668908))

(assert (= (and b!668908 res!435899) b!668907))

(assert (= (and b!668907 res!435894) b!668911))

(assert (= (and b!668911 res!435896) b!668916))

(assert (= (and b!668916 c!76879) b!668909))

(assert (= (and b!668916 (not c!76879)) b!668923))

(assert (= (and b!668916 c!76880) b!668924))

(assert (= (and b!668916 (not c!76880)) b!668903))

(assert (= (and b!668916 (not res!435880)) b!668920))

(assert (= (and b!668920 (not res!435892)) b!668918))

(assert (= (and b!668918 (not res!435884)) b!668906))

(assert (= (and b!668906 (not res!435888)) b!668927))

(assert (= (and b!668927 res!435898) b!668914))

(assert (= (and b!668927 (not res!435882)) b!668917))

(assert (= (and b!668917 res!435885) b!668905))

(declare-fun m!639119 () Bool)

(assert (=> b!668926 m!639119))

(declare-fun m!639121 () Bool)

(assert (=> b!668920 m!639121))

(declare-fun m!639123 () Bool)

(assert (=> start!60062 m!639123))

(declare-fun m!639125 () Bool)

(assert (=> b!668907 m!639125))

(declare-fun m!639127 () Bool)

(assert (=> b!668921 m!639127))

(declare-fun m!639129 () Bool)

(assert (=> b!668918 m!639129))

(declare-fun m!639131 () Bool)

(assert (=> b!668906 m!639131))

(declare-fun m!639133 () Bool)

(assert (=> b!668908 m!639133))

(declare-fun m!639135 () Bool)

(assert (=> b!668919 m!639135))

(declare-fun m!639137 () Bool)

(assert (=> b!668905 m!639137))

(declare-fun m!639139 () Bool)

(assert (=> b!668909 m!639139))

(assert (=> b!668914 m!639137))

(declare-fun m!639141 () Bool)

(assert (=> b!668912 m!639141))

(declare-fun m!639143 () Bool)

(assert (=> b!668924 m!639143))

(declare-fun m!639145 () Bool)

(assert (=> b!668924 m!639145))

(declare-fun m!639147 () Bool)

(assert (=> b!668924 m!639147))

(declare-fun m!639149 () Bool)

(assert (=> b!668924 m!639149))

(assert (=> b!668924 m!639145))

(assert (=> b!668924 m!639147))

(declare-fun m!639151 () Bool)

(assert (=> b!668924 m!639151))

(declare-fun m!639153 () Bool)

(assert (=> b!668924 m!639153))

(assert (=> b!668916 m!639143))

(assert (=> b!668916 m!639145))

(declare-fun m!639155 () Bool)

(assert (=> b!668916 m!639155))

(declare-fun m!639157 () Bool)

(assert (=> b!668916 m!639157))

(declare-fun m!639159 () Bool)

(assert (=> b!668916 m!639159))

(declare-fun m!639161 () Bool)

(assert (=> b!668916 m!639161))

(assert (=> b!668916 m!639151))

(declare-fun m!639163 () Bool)

(assert (=> b!668916 m!639163))

(assert (=> b!668916 m!639145))

(declare-fun m!639165 () Bool)

(assert (=> b!668916 m!639165))

(declare-fun m!639167 () Bool)

(assert (=> b!668916 m!639167))

(declare-fun m!639169 () Bool)

(assert (=> b!668916 m!639169))

(declare-fun m!639171 () Bool)

(assert (=> b!668916 m!639171))

(assert (=> b!668916 m!639153))

(declare-fun m!639173 () Bool)

(assert (=> b!668913 m!639173))

(assert (=> b!668915 m!639173))

(declare-fun m!639175 () Bool)

(assert (=> b!668904 m!639175))

(push 1)

(assert (not b!668924))

(assert (not b!668916))

(assert (not b!668912))

(assert (not b!668921))

(assert (not b!668926))

(assert (not b!668914))

(assert (not b!668907))

(assert (not b!668909))

(assert (not b!668920))

(assert (not b!668919))

(assert (not b!668913))

(assert (not b!668906))

(assert (not b!668905))

(assert (not b!668915))

(assert (not b!668918))

(assert (not b!668904))

(assert (not start!60062))

(assert (not b!668908))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

