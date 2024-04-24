; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61326 () Bool)

(assert start!61326)

(declare-fun b!686549 () Bool)

(declare-fun res!451604 () Bool)

(declare-fun e!391005 () Bool)

(assert (=> b!686549 (=> (not res!451604) (not e!391005))))

(declare-datatypes ((array!39648 0))(
  ( (array!39649 (arr!18997 (Array (_ BitVec 32) (_ BitVec 64))) (size!19372 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39648)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12945 0))(
  ( (Nil!12942) (Cons!12941 (h!13989 (_ BitVec 64)) (t!19192 List!12945)) )
))
(declare-fun acc!681 () List!12945)

(declare-fun arrayNoDuplicates!0 (array!39648 (_ BitVec 32) List!12945) Bool)

(assert (=> b!686549 (= res!451604 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!686550 () Bool)

(declare-fun res!451613 () Bool)

(assert (=> b!686550 (=> (not res!451613) (not e!391005))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!686550 (= res!451613 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19372 a!3626))))))

(declare-fun b!686551 () Bool)

(declare-fun res!451605 () Bool)

(assert (=> b!686551 (=> (not res!451605) (not e!391005))))

(declare-fun noDuplicate!871 (List!12945) Bool)

(assert (=> b!686551 (= res!451605 (noDuplicate!871 acc!681))))

(declare-fun res!451610 () Bool)

(assert (=> start!61326 (=> (not res!451610) (not e!391005))))

(assert (=> start!61326 (= res!451610 (and (bvslt (size!19372 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19372 a!3626))))))

(assert (=> start!61326 e!391005))

(assert (=> start!61326 true))

(declare-fun array_inv!14856 (array!39648) Bool)

(assert (=> start!61326 (array_inv!14856 a!3626)))

(declare-fun b!686552 () Bool)

(declare-fun res!451614 () Bool)

(assert (=> b!686552 (=> (not res!451614) (not e!391005))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!686552 (= res!451614 (validKeyInArray!0 k0!2843))))

(declare-fun b!686553 () Bool)

(declare-fun e!391004 () Bool)

(declare-fun contains!3597 (List!12945 (_ BitVec 64)) Bool)

(assert (=> b!686553 (= e!391004 (contains!3597 acc!681 k0!2843))))

(declare-fun b!686554 () Bool)

(declare-fun res!451611 () Bool)

(assert (=> b!686554 (=> (not res!451611) (not e!391005))))

(assert (=> b!686554 (= res!451611 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19372 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!686555 () Bool)

(declare-datatypes ((Unit!24156 0))(
  ( (Unit!24157) )
))
(declare-fun e!391008 () Unit!24156)

(declare-fun lt!315085 () Unit!24156)

(assert (=> b!686555 (= e!391008 lt!315085)))

(declare-fun lt!315086 () Unit!24156)

(declare-fun lemmaListSubSeqRefl!0 (List!12945) Unit!24156)

(assert (=> b!686555 (= lt!315086 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!206 (List!12945 List!12945) Bool)

(assert (=> b!686555 (subseq!206 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39648 List!12945 List!12945 (_ BitVec 32)) Unit!24156)

(declare-fun $colon$colon!368 (List!12945 (_ BitVec 64)) List!12945)

(assert (=> b!686555 (= lt!315085 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!368 acc!681 (select (arr!18997 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686555 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!686556 () Bool)

(assert (=> b!686556 (= e!391005 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000)))))

(declare-fun lt!315087 () List!12945)

(assert (=> b!686556 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315087)))

(declare-fun lt!315083 () Unit!24156)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39648 (_ BitVec 64) (_ BitVec 32) List!12945 List!12945) Unit!24156)

(assert (=> b!686556 (= lt!315083 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315087))))

(declare-fun -!170 (List!12945 (_ BitVec 64)) List!12945)

(assert (=> b!686556 (= (-!170 lt!315087 k0!2843) acc!681)))

(assert (=> b!686556 (= lt!315087 ($colon$colon!368 acc!681 k0!2843))))

(declare-fun lt!315084 () Unit!24156)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12945) Unit!24156)

(assert (=> b!686556 (= lt!315084 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!686556 (subseq!206 acc!681 acc!681)))

(declare-fun lt!315090 () Unit!24156)

(assert (=> b!686556 (= lt!315090 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686556 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315091 () Unit!24156)

(assert (=> b!686556 (= lt!315091 e!391008)))

(declare-fun c!77842 () Bool)

(assert (=> b!686556 (= c!77842 (validKeyInArray!0 (select (arr!18997 a!3626) from!3004)))))

(declare-fun lt!315089 () Unit!24156)

(declare-fun e!391007 () Unit!24156)

(assert (=> b!686556 (= lt!315089 e!391007)))

(declare-fun c!77843 () Bool)

(declare-fun arrayContainsKey!0 (array!39648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!686556 (= c!77843 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686556 (arrayContainsKey!0 (array!39649 (store (arr!18997 a!3626) i!1382 k0!2843) (size!19372 a!3626)) k0!2843 from!3004)))

(declare-fun b!686557 () Bool)

(declare-fun res!451606 () Bool)

(assert (=> b!686557 (=> (not res!451606) (not e!391005))))

(assert (=> b!686557 (= res!451606 (not (contains!3597 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686558 () Bool)

(declare-fun res!451608 () Bool)

(assert (=> b!686558 (=> (not res!451608) (not e!391005))))

(assert (=> b!686558 (= res!451608 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!686559 () Bool)

(declare-fun res!451607 () Bool)

(assert (=> b!686559 (=> (not res!451607) (not e!391005))))

(declare-fun e!391002 () Bool)

(assert (=> b!686559 (= res!451607 e!391002)))

(declare-fun res!451612 () Bool)

(assert (=> b!686559 (=> res!451612 e!391002)))

(assert (=> b!686559 (= res!451612 e!391004)))

(declare-fun res!451609 () Bool)

(assert (=> b!686559 (=> (not res!451609) (not e!391004))))

(assert (=> b!686559 (= res!451609 (bvsgt from!3004 i!1382))))

(declare-fun b!686560 () Bool)

(declare-fun e!391006 () Bool)

(assert (=> b!686560 (= e!391006 (not (contains!3597 acc!681 k0!2843)))))

(declare-fun b!686561 () Bool)

(declare-fun res!451615 () Bool)

(assert (=> b!686561 (=> (not res!451615) (not e!391005))))

(assert (=> b!686561 (= res!451615 (not (contains!3597 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686562 () Bool)

(declare-fun Unit!24158 () Unit!24156)

(assert (=> b!686562 (= e!391007 Unit!24158)))

(declare-fun b!686563 () Bool)

(assert (=> b!686563 (= e!391002 e!391006)))

(declare-fun res!451603 () Bool)

(assert (=> b!686563 (=> (not res!451603) (not e!391006))))

(assert (=> b!686563 (= res!451603 (bvsle from!3004 i!1382))))

(declare-fun b!686564 () Bool)

(declare-fun Unit!24159 () Unit!24156)

(assert (=> b!686564 (= e!391008 Unit!24159)))

(declare-fun b!686565 () Bool)

(declare-fun Unit!24160 () Unit!24156)

(assert (=> b!686565 (= e!391007 Unit!24160)))

(declare-fun lt!315088 () Unit!24156)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39648 (_ BitVec 64) (_ BitVec 32)) Unit!24156)

(assert (=> b!686565 (= lt!315088 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!686565 false))

(declare-fun b!686566 () Bool)

(declare-fun res!451602 () Bool)

(assert (=> b!686566 (=> (not res!451602) (not e!391005))))

(assert (=> b!686566 (= res!451602 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12942))))

(assert (= (and start!61326 res!451610) b!686551))

(assert (= (and b!686551 res!451605) b!686557))

(assert (= (and b!686557 res!451606) b!686561))

(assert (= (and b!686561 res!451615) b!686559))

(assert (= (and b!686559 res!451609) b!686553))

(assert (= (and b!686559 (not res!451612)) b!686563))

(assert (= (and b!686563 res!451603) b!686560))

(assert (= (and b!686559 res!451607) b!686566))

(assert (= (and b!686566 res!451602) b!686549))

(assert (= (and b!686549 res!451604) b!686550))

(assert (= (and b!686550 res!451613) b!686552))

(assert (= (and b!686552 res!451614) b!686558))

(assert (= (and b!686558 res!451608) b!686554))

(assert (= (and b!686554 res!451611) b!686556))

(assert (= (and b!686556 c!77843) b!686565))

(assert (= (and b!686556 (not c!77843)) b!686562))

(assert (= (and b!686556 c!77842) b!686555))

(assert (= (and b!686556 (not c!77842)) b!686564))

(declare-fun m!651127 () Bool)

(assert (=> b!686555 m!651127))

(declare-fun m!651129 () Bool)

(assert (=> b!686555 m!651129))

(declare-fun m!651131 () Bool)

(assert (=> b!686555 m!651131))

(declare-fun m!651133 () Bool)

(assert (=> b!686555 m!651133))

(assert (=> b!686555 m!651129))

(assert (=> b!686555 m!651131))

(declare-fun m!651135 () Bool)

(assert (=> b!686555 m!651135))

(declare-fun m!651137 () Bool)

(assert (=> b!686555 m!651137))

(declare-fun m!651139 () Bool)

(assert (=> b!686549 m!651139))

(declare-fun m!651141 () Bool)

(assert (=> b!686556 m!651141))

(assert (=> b!686556 m!651127))

(assert (=> b!686556 m!651129))

(declare-fun m!651143 () Bool)

(assert (=> b!686556 m!651143))

(declare-fun m!651145 () Bool)

(assert (=> b!686556 m!651145))

(declare-fun m!651147 () Bool)

(assert (=> b!686556 m!651147))

(assert (=> b!686556 m!651135))

(declare-fun m!651149 () Bool)

(assert (=> b!686556 m!651149))

(declare-fun m!651151 () Bool)

(assert (=> b!686556 m!651151))

(declare-fun m!651153 () Bool)

(assert (=> b!686556 m!651153))

(assert (=> b!686556 m!651129))

(declare-fun m!651155 () Bool)

(assert (=> b!686556 m!651155))

(declare-fun m!651157 () Bool)

(assert (=> b!686556 m!651157))

(assert (=> b!686556 m!651137))

(declare-fun m!651159 () Bool)

(assert (=> start!61326 m!651159))

(declare-fun m!651161 () Bool)

(assert (=> b!686566 m!651161))

(declare-fun m!651163 () Bool)

(assert (=> b!686558 m!651163))

(declare-fun m!651165 () Bool)

(assert (=> b!686551 m!651165))

(declare-fun m!651167 () Bool)

(assert (=> b!686560 m!651167))

(declare-fun m!651169 () Bool)

(assert (=> b!686561 m!651169))

(assert (=> b!686553 m!651167))

(declare-fun m!651171 () Bool)

(assert (=> b!686557 m!651171))

(declare-fun m!651173 () Bool)

(assert (=> b!686552 m!651173))

(declare-fun m!651175 () Bool)

(assert (=> b!686565 m!651175))

(check-sat (not b!686553) (not b!686552) (not b!686561) (not b!686549) (not b!686558) (not b!686555) (not b!686560) (not b!686566) (not b!686557) (not b!686556) (not b!686551) (not b!686565) (not start!61326))
(check-sat)
