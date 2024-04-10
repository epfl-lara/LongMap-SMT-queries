; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61580 () Bool)

(assert start!61580)

(declare-fun b!689170 () Bool)

(declare-fun res!453773 () Bool)

(declare-fun e!392439 () Bool)

(assert (=> b!689170 (=> (not res!453773) (not e!392439))))

(declare-datatypes ((List!13073 0))(
  ( (Nil!13070) (Cons!13069 (h!14114 (_ BitVec 64)) (t!19337 List!13073)) )
))
(declare-fun acc!681 () List!13073)

(declare-fun contains!3650 (List!13073 (_ BitVec 64)) Bool)

(assert (=> b!689170 (= res!453773 (not (contains!3650 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689171 () Bool)

(declare-datatypes ((Unit!24327 0))(
  ( (Unit!24328) )
))
(declare-fun e!392435 () Unit!24327)

(declare-fun Unit!24329 () Unit!24327)

(assert (=> b!689171 (= e!392435 Unit!24329)))

(declare-fun b!689172 () Bool)

(declare-fun res!453762 () Bool)

(assert (=> b!689172 (=> (not res!453762) (not e!392439))))

(declare-fun noDuplicate!897 (List!13073) Bool)

(assert (=> b!689172 (= res!453762 (noDuplicate!897 acc!681))))

(declare-fun b!689173 () Bool)

(declare-fun e!392432 () Bool)

(declare-datatypes ((array!39721 0))(
  ( (array!39722 (arr!19032 (Array (_ BitVec 32) (_ BitVec 64))) (size!19414 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39721)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!689173 (= e!392432 (bvslt (bvsub (size!19414 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) (bvsub (size!19414 a!3626) from!3004)))))

(declare-fun b!689174 () Bool)

(declare-fun res!453767 () Bool)

(assert (=> b!689174 (=> res!453767 e!392432)))

(declare-fun lt!316060 () List!13073)

(assert (=> b!689174 (= res!453767 (contains!3650 lt!316060 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689175 () Bool)

(declare-fun res!453769 () Bool)

(assert (=> b!689175 (=> (not res!453769) (not e!392439))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!689175 (= res!453769 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19414 a!3626))))))

(declare-fun b!689176 () Bool)

(declare-fun res!453760 () Bool)

(assert (=> b!689176 (=> (not res!453760) (not e!392439))))

(declare-fun arrayNoDuplicates!0 (array!39721 (_ BitVec 32) List!13073) Bool)

(assert (=> b!689176 (= res!453760 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13070))))

(declare-fun b!689177 () Bool)

(declare-fun e!392438 () Bool)

(declare-fun e!392429 () Bool)

(assert (=> b!689177 (= e!392438 e!392429)))

(declare-fun res!453777 () Bool)

(assert (=> b!689177 (=> (not res!453777) (not e!392429))))

(assert (=> b!689177 (= res!453777 (bvsle from!3004 i!1382))))

(declare-fun b!689178 () Bool)

(declare-fun e!392430 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!689178 (= e!392430 (not (contains!3650 lt!316060 k!2843)))))

(declare-fun b!689179 () Bool)

(declare-fun e!392436 () Bool)

(declare-fun e!392431 () Bool)

(assert (=> b!689179 (= e!392436 e!392431)))

(declare-fun res!453761 () Bool)

(assert (=> b!689179 (=> res!453761 e!392431)))

(assert (=> b!689179 (= res!453761 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689180 () Bool)

(declare-fun res!453771 () Bool)

(assert (=> b!689180 (=> (not res!453771) (not e!392439))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!689180 (= res!453771 (validKeyInArray!0 k!2843))))

(declare-fun b!689181 () Bool)

(declare-fun res!453770 () Bool)

(assert (=> b!689181 (=> (not res!453770) (not e!392439))))

(assert (=> b!689181 (= res!453770 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!689182 () Bool)

(assert (=> b!689182 (= e!392429 (not (contains!3650 acc!681 k!2843)))))

(declare-fun b!689183 () Bool)

(declare-fun e!392434 () Unit!24327)

(declare-fun Unit!24330 () Unit!24327)

(assert (=> b!689183 (= e!392434 Unit!24330)))

(declare-fun b!689184 () Bool)

(declare-fun res!453778 () Bool)

(assert (=> b!689184 (=> res!453778 e!392432)))

(assert (=> b!689184 (= res!453778 (contains!3650 lt!316060 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689185 () Bool)

(declare-fun res!453776 () Bool)

(assert (=> b!689185 (=> (not res!453776) (not e!392439))))

(assert (=> b!689185 (= res!453776 e!392438)))

(declare-fun res!453775 () Bool)

(assert (=> b!689185 (=> res!453775 e!392438)))

(declare-fun e!392433 () Bool)

(assert (=> b!689185 (= res!453775 e!392433)))

(declare-fun res!453774 () Bool)

(assert (=> b!689185 (=> (not res!453774) (not e!392433))))

(assert (=> b!689185 (= res!453774 (bvsgt from!3004 i!1382))))

(declare-fun b!689186 () Bool)

(declare-fun lt!316062 () Unit!24327)

(assert (=> b!689186 (= e!392435 lt!316062)))

(declare-fun lt!316063 () Unit!24327)

(declare-fun lemmaListSubSeqRefl!0 (List!13073) Unit!24327)

(assert (=> b!689186 (= lt!316063 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!236 (List!13073 List!13073) Bool)

(assert (=> b!689186 (subseq!236 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39721 List!13073 List!13073 (_ BitVec 32)) Unit!24327)

(declare-fun $colon$colon!401 (List!13073 (_ BitVec 64)) List!13073)

(assert (=> b!689186 (= lt!316062 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!401 acc!681 (select (arr!19032 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!689186 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!689187 () Bool)

(assert (=> b!689187 (= e!392431 (contains!3650 lt!316060 k!2843))))

(declare-fun b!689188 () Bool)

(declare-fun res!453779 () Bool)

(assert (=> b!689188 (=> (not res!453779) (not e!392439))))

(assert (=> b!689188 (= res!453779 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19414 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!689189 () Bool)

(declare-fun res!453763 () Bool)

(assert (=> b!689189 (=> res!453763 e!392432)))

(assert (=> b!689189 (= res!453763 e!392436)))

(declare-fun res!453766 () Bool)

(assert (=> b!689189 (=> (not res!453766) (not e!392436))))

(assert (=> b!689189 (= res!453766 e!392430)))

(declare-fun res!453765 () Bool)

(assert (=> b!689189 (=> res!453765 e!392430)))

(assert (=> b!689189 (= res!453765 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun res!453758 () Bool)

(assert (=> start!61580 (=> (not res!453758) (not e!392439))))

(assert (=> start!61580 (= res!453758 (and (bvslt (size!19414 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19414 a!3626))))))

(assert (=> start!61580 e!392439))

(assert (=> start!61580 true))

(declare-fun array_inv!14828 (array!39721) Bool)

(assert (=> start!61580 (array_inv!14828 a!3626)))

(declare-fun b!689190 () Bool)

(declare-fun res!453764 () Bool)

(assert (=> b!689190 (=> (not res!453764) (not e!392439))))

(declare-fun arrayContainsKey!0 (array!39721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!689190 (= res!453764 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!689191 () Bool)

(declare-fun res!453759 () Bool)

(assert (=> b!689191 (=> res!453759 e!392432)))

(assert (=> b!689191 (= res!453759 (not (noDuplicate!897 lt!316060)))))

(declare-fun b!689192 () Bool)

(assert (=> b!689192 (= e!392433 (contains!3650 acc!681 k!2843))))

(declare-fun b!689193 () Bool)

(declare-fun Unit!24331 () Unit!24327)

(assert (=> b!689193 (= e!392434 Unit!24331)))

(declare-fun lt!316059 () Unit!24327)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39721 (_ BitVec 64) (_ BitVec 32)) Unit!24327)

(assert (=> b!689193 (= lt!316059 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!689193 false))

(declare-fun b!689194 () Bool)

(declare-fun res!453768 () Bool)

(assert (=> b!689194 (=> (not res!453768) (not e!392439))))

(assert (=> b!689194 (= res!453768 (not (contains!3650 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689195 () Bool)

(assert (=> b!689195 (= e!392439 (not e!392432))))

(declare-fun res!453772 () Bool)

(assert (=> b!689195 (=> res!453772 e!392432)))

(assert (=> b!689195 (= res!453772 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!689195 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316060)))

(declare-fun lt!316065 () Unit!24327)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39721 (_ BitVec 64) (_ BitVec 32) List!13073 List!13073) Unit!24327)

(assert (=> b!689195 (= lt!316065 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!316060))))

(declare-fun -!201 (List!13073 (_ BitVec 64)) List!13073)

(assert (=> b!689195 (= (-!201 lt!316060 k!2843) acc!681)))

(assert (=> b!689195 (= lt!316060 ($colon$colon!401 acc!681 k!2843))))

(declare-fun lt!316064 () Unit!24327)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13073) Unit!24327)

(assert (=> b!689195 (= lt!316064 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!689195 (subseq!236 acc!681 acc!681)))

(declare-fun lt!316058 () Unit!24327)

(assert (=> b!689195 (= lt!316058 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689195 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!316061 () Unit!24327)

(assert (=> b!689195 (= lt!316061 e!392435)))

(declare-fun c!78073 () Bool)

(assert (=> b!689195 (= c!78073 (validKeyInArray!0 (select (arr!19032 a!3626) from!3004)))))

(declare-fun lt!316066 () Unit!24327)

(assert (=> b!689195 (= lt!316066 e!392434)))

(declare-fun c!78074 () Bool)

(assert (=> b!689195 (= c!78074 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!689195 (arrayContainsKey!0 (array!39722 (store (arr!19032 a!3626) i!1382 k!2843) (size!19414 a!3626)) k!2843 from!3004)))

(assert (= (and start!61580 res!453758) b!689172))

(assert (= (and b!689172 res!453762) b!689194))

(assert (= (and b!689194 res!453768) b!689170))

(assert (= (and b!689170 res!453773) b!689185))

(assert (= (and b!689185 res!453774) b!689192))

(assert (= (and b!689185 (not res!453775)) b!689177))

(assert (= (and b!689177 res!453777) b!689182))

(assert (= (and b!689185 res!453776) b!689176))

(assert (= (and b!689176 res!453760) b!689181))

(assert (= (and b!689181 res!453770) b!689175))

(assert (= (and b!689175 res!453769) b!689180))

(assert (= (and b!689180 res!453771) b!689190))

(assert (= (and b!689190 res!453764) b!689188))

(assert (= (and b!689188 res!453779) b!689195))

(assert (= (and b!689195 c!78074) b!689193))

(assert (= (and b!689195 (not c!78074)) b!689183))

(assert (= (and b!689195 c!78073) b!689186))

(assert (= (and b!689195 (not c!78073)) b!689171))

(assert (= (and b!689195 (not res!453772)) b!689191))

(assert (= (and b!689191 (not res!453759)) b!689184))

(assert (= (and b!689184 (not res!453778)) b!689174))

(assert (= (and b!689174 (not res!453767)) b!689189))

(assert (= (and b!689189 (not res!453765)) b!689178))

(assert (= (and b!689189 res!453766) b!689179))

(assert (= (and b!689179 (not res!453761)) b!689187))

(assert (= (and b!689189 (not res!453763)) b!689173))

(declare-fun m!652895 () Bool)

(assert (=> b!689193 m!652895))

(declare-fun m!652897 () Bool)

(assert (=> b!689182 m!652897))

(declare-fun m!652899 () Bool)

(assert (=> b!689187 m!652899))

(declare-fun m!652901 () Bool)

(assert (=> b!689194 m!652901))

(assert (=> b!689178 m!652899))

(declare-fun m!652903 () Bool)

(assert (=> b!689172 m!652903))

(declare-fun m!652905 () Bool)

(assert (=> start!61580 m!652905))

(declare-fun m!652907 () Bool)

(assert (=> b!689181 m!652907))

(declare-fun m!652909 () Bool)

(assert (=> b!689170 m!652909))

(declare-fun m!652911 () Bool)

(assert (=> b!689190 m!652911))

(assert (=> b!689192 m!652897))

(declare-fun m!652913 () Bool)

(assert (=> b!689184 m!652913))

(declare-fun m!652915 () Bool)

(assert (=> b!689186 m!652915))

(declare-fun m!652917 () Bool)

(assert (=> b!689186 m!652917))

(declare-fun m!652919 () Bool)

(assert (=> b!689186 m!652919))

(declare-fun m!652921 () Bool)

(assert (=> b!689186 m!652921))

(assert (=> b!689186 m!652917))

(assert (=> b!689186 m!652919))

(declare-fun m!652923 () Bool)

(assert (=> b!689186 m!652923))

(declare-fun m!652925 () Bool)

(assert (=> b!689186 m!652925))

(declare-fun m!652927 () Bool)

(assert (=> b!689174 m!652927))

(declare-fun m!652929 () Bool)

(assert (=> b!689191 m!652929))

(declare-fun m!652931 () Bool)

(assert (=> b!689180 m!652931))

(declare-fun m!652933 () Bool)

(assert (=> b!689195 m!652933))

(assert (=> b!689195 m!652917))

(declare-fun m!652935 () Bool)

(assert (=> b!689195 m!652935))

(declare-fun m!652937 () Bool)

(assert (=> b!689195 m!652937))

(assert (=> b!689195 m!652923))

(declare-fun m!652939 () Bool)

(assert (=> b!689195 m!652939))

(declare-fun m!652941 () Bool)

(assert (=> b!689195 m!652941))

(declare-fun m!652943 () Bool)

(assert (=> b!689195 m!652943))

(assert (=> b!689195 m!652917))

(declare-fun m!652945 () Bool)

(assert (=> b!689195 m!652945))

(assert (=> b!689195 m!652915))

(declare-fun m!652947 () Bool)

(assert (=> b!689195 m!652947))

(declare-fun m!652949 () Bool)

(assert (=> b!689195 m!652949))

(assert (=> b!689195 m!652925))

(declare-fun m!652951 () Bool)

(assert (=> b!689176 m!652951))

(push 1)

(assert (not b!689174))

(assert (not b!689193))

(assert (not b!689194))

(assert (not b!689181))

(assert (not b!689176))

(assert (not b!689184))

(assert (not b!689195))

(assert (not b!689180))

(assert (not b!689192))

(assert (not b!689178))

(assert (not b!689172))

(assert (not b!689190))

(assert (not b!689186))

(assert (not b!689170))

(assert (not b!689191))

(assert (not start!61580))

(assert (not b!689187))

(assert (not b!689182))

(check-sat)

(pop 1)

(push 1)

(check-sat)

