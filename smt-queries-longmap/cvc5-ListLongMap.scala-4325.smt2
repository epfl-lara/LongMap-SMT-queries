; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59978 () Bool)

(assert start!59978)

(declare-fun b!665753 () Bool)

(declare-fun e!381465 () Bool)

(declare-datatypes ((List!12746 0))(
  ( (Nil!12743) (Cons!12742 (h!13787 (_ BitVec 64)) (t!18974 List!12746)) )
))
(declare-fun acc!681 () List!12746)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3323 (List!12746 (_ BitVec 64)) Bool)

(assert (=> b!665753 (= e!381465 (contains!3323 acc!681 k!2843))))

(declare-fun b!665755 () Bool)

(declare-fun e!381463 () Bool)

(declare-fun e!381462 () Bool)

(assert (=> b!665755 (= e!381463 (not e!381462))))

(declare-fun res!433239 () Bool)

(assert (=> b!665755 (=> res!433239 e!381462)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!665755 (= res!433239 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!310152 () List!12746)

(declare-fun -!60 (List!12746 (_ BitVec 64)) List!12746)

(assert (=> b!665755 (= (-!60 lt!310152 k!2843) acc!681)))

(declare-fun $colon$colon!194 (List!12746 (_ BitVec 64)) List!12746)

(assert (=> b!665755 (= lt!310152 ($colon$colon!194 acc!681 k!2843))))

(declare-datatypes ((Unit!23250 0))(
  ( (Unit!23251) )
))
(declare-fun lt!310145 () Unit!23250)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12746) Unit!23250)

(assert (=> b!665755 (= lt!310145 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!62 (List!12746 List!12746) Bool)

(assert (=> b!665755 (subseq!62 acc!681 acc!681)))

(declare-fun lt!310150 () Unit!23250)

(declare-fun lemmaListSubSeqRefl!0 (List!12746) Unit!23250)

(assert (=> b!665755 (= lt!310150 (lemmaListSubSeqRefl!0 acc!681))))

(declare-datatypes ((array!39025 0))(
  ( (array!39026 (arr!18705 (Array (_ BitVec 32) (_ BitVec 64))) (size!19069 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39025)

(declare-fun arrayNoDuplicates!0 (array!39025 (_ BitVec 32) List!12746) Bool)

(assert (=> b!665755 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310147 () Unit!23250)

(declare-fun e!381458 () Unit!23250)

(assert (=> b!665755 (= lt!310147 e!381458)))

(declare-fun c!76628 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!665755 (= c!76628 (validKeyInArray!0 (select (arr!18705 a!3626) from!3004)))))

(declare-fun lt!310153 () Unit!23250)

(declare-fun e!381461 () Unit!23250)

(assert (=> b!665755 (= lt!310153 e!381461)))

(declare-fun c!76627 () Bool)

(declare-fun lt!310148 () Bool)

(assert (=> b!665755 (= c!76627 lt!310148)))

(declare-fun arrayContainsKey!0 (array!39025 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!665755 (= lt!310148 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!665755 (arrayContainsKey!0 (array!39026 (store (arr!18705 a!3626) i!1382 k!2843) (size!19069 a!3626)) k!2843 from!3004)))

(declare-fun b!665756 () Bool)

(declare-fun res!433234 () Bool)

(assert (=> b!665756 (=> (not res!433234) (not e!381463))))

(declare-fun noDuplicate!570 (List!12746) Bool)

(assert (=> b!665756 (= res!433234 (noDuplicate!570 acc!681))))

(declare-fun b!665757 () Bool)

(declare-fun Unit!23252 () Unit!23250)

(assert (=> b!665757 (= e!381458 Unit!23252)))

(declare-fun b!665758 () Bool)

(declare-fun res!433235 () Bool)

(assert (=> b!665758 (=> (not res!433235) (not e!381463))))

(assert (=> b!665758 (= res!433235 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12743))))

(declare-fun b!665759 () Bool)

(declare-fun res!433250 () Bool)

(assert (=> b!665759 (=> res!433250 e!381462)))

(assert (=> b!665759 (= res!433250 (not (subseq!62 acc!681 lt!310152)))))

(declare-fun b!665760 () Bool)

(declare-fun Unit!23253 () Unit!23250)

(assert (=> b!665760 (= e!381461 Unit!23253)))

(declare-fun lt!310146 () Unit!23250)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39025 (_ BitVec 64) (_ BitVec 32)) Unit!23250)

(assert (=> b!665760 (= lt!310146 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!665760 false))

(declare-fun b!665761 () Bool)

(declare-fun res!433246 () Bool)

(assert (=> b!665761 (=> (not res!433246) (not e!381463))))

(assert (=> b!665761 (= res!433246 (validKeyInArray!0 k!2843))))

(declare-fun b!665762 () Bool)

(declare-fun res!433241 () Bool)

(assert (=> b!665762 (=> res!433241 e!381462)))

(assert (=> b!665762 (= res!433241 (not (contains!3323 lt!310152 k!2843)))))

(declare-fun b!665763 () Bool)

(declare-fun e!381460 () Bool)

(assert (=> b!665763 (= e!381460 (not (contains!3323 acc!681 k!2843)))))

(declare-fun b!665764 () Bool)

(declare-fun res!433251 () Bool)

(assert (=> b!665764 (=> (not res!433251) (not e!381463))))

(assert (=> b!665764 (= res!433251 (not (contains!3323 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665765 () Bool)

(assert (=> b!665765 (= e!381462 true)))

(declare-fun lt!310151 () Bool)

(assert (=> b!665765 (= lt!310151 (contains!3323 lt!310152 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665754 () Bool)

(declare-fun res!433237 () Bool)

(assert (=> b!665754 (=> (not res!433237) (not e!381463))))

(assert (=> b!665754 (= res!433237 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!433248 () Bool)

(assert (=> start!59978 (=> (not res!433248) (not e!381463))))

(assert (=> start!59978 (= res!433248 (and (bvslt (size!19069 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19069 a!3626))))))

(assert (=> start!59978 e!381463))

(assert (=> start!59978 true))

(declare-fun array_inv!14501 (array!39025) Bool)

(assert (=> start!59978 (array_inv!14501 a!3626)))

(declare-fun b!665766 () Bool)

(declare-fun res!433233 () Bool)

(assert (=> b!665766 (=> (not res!433233) (not e!381463))))

(assert (=> b!665766 (= res!433233 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!665767 () Bool)

(declare-fun lt!310144 () Unit!23250)

(assert (=> b!665767 (= e!381458 lt!310144)))

(declare-fun lt!310149 () Unit!23250)

(assert (=> b!665767 (= lt!310149 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665767 (subseq!62 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39025 List!12746 List!12746 (_ BitVec 32)) Unit!23250)

(assert (=> b!665767 (= lt!310144 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!194 acc!681 (select (arr!18705 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665767 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!665768 () Bool)

(declare-fun res!433244 () Bool)

(assert (=> b!665768 (=> res!433244 e!381462)))

(assert (=> b!665768 (= res!433244 (not (noDuplicate!570 lt!310152)))))

(declare-fun b!665769 () Bool)

(declare-fun e!381464 () Bool)

(assert (=> b!665769 (= e!381464 e!381460)))

(declare-fun res!433252 () Bool)

(assert (=> b!665769 (=> (not res!433252) (not e!381460))))

(assert (=> b!665769 (= res!433252 (bvsle from!3004 i!1382))))

(declare-fun b!665770 () Bool)

(declare-fun res!433238 () Bool)

(assert (=> b!665770 (=> (not res!433238) (not e!381463))))

(assert (=> b!665770 (= res!433238 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19069 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!665771 () Bool)

(declare-fun Unit!23254 () Unit!23250)

(assert (=> b!665771 (= e!381461 Unit!23254)))

(declare-fun b!665772 () Bool)

(declare-fun res!433253 () Bool)

(assert (=> b!665772 (=> res!433253 e!381462)))

(assert (=> b!665772 (= res!433253 (contains!3323 lt!310152 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665773 () Bool)

(declare-fun res!433240 () Bool)

(assert (=> b!665773 (=> (not res!433240) (not e!381463))))

(assert (=> b!665773 (= res!433240 e!381464)))

(declare-fun res!433243 () Bool)

(assert (=> b!665773 (=> res!433243 e!381464)))

(assert (=> b!665773 (= res!433243 e!381465)))

(declare-fun res!433245 () Bool)

(assert (=> b!665773 (=> (not res!433245) (not e!381465))))

(assert (=> b!665773 (= res!433245 (bvsgt from!3004 i!1382))))

(declare-fun b!665774 () Bool)

(declare-fun res!433249 () Bool)

(assert (=> b!665774 (=> res!433249 e!381462)))

(assert (=> b!665774 (= res!433249 lt!310148)))

(declare-fun b!665775 () Bool)

(declare-fun res!433247 () Bool)

(assert (=> b!665775 (=> (not res!433247) (not e!381463))))

(assert (=> b!665775 (= res!433247 (not (contains!3323 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665776 () Bool)

(declare-fun res!433236 () Bool)

(assert (=> b!665776 (=> (not res!433236) (not e!381463))))

(assert (=> b!665776 (= res!433236 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19069 a!3626))))))

(declare-fun b!665777 () Bool)

(declare-fun res!433242 () Bool)

(assert (=> b!665777 (=> res!433242 e!381462)))

(assert (=> b!665777 (= res!433242 (contains!3323 acc!681 k!2843))))

(assert (= (and start!59978 res!433248) b!665756))

(assert (= (and b!665756 res!433234) b!665775))

(assert (= (and b!665775 res!433247) b!665764))

(assert (= (and b!665764 res!433251) b!665773))

(assert (= (and b!665773 res!433245) b!665753))

(assert (= (and b!665773 (not res!433243)) b!665769))

(assert (= (and b!665769 res!433252) b!665763))

(assert (= (and b!665773 res!433240) b!665758))

(assert (= (and b!665758 res!433235) b!665766))

(assert (= (and b!665766 res!433233) b!665776))

(assert (= (and b!665776 res!433236) b!665761))

(assert (= (and b!665761 res!433246) b!665754))

(assert (= (and b!665754 res!433237) b!665770))

(assert (= (and b!665770 res!433238) b!665755))

(assert (= (and b!665755 c!76627) b!665760))

(assert (= (and b!665755 (not c!76627)) b!665771))

(assert (= (and b!665755 c!76628) b!665767))

(assert (= (and b!665755 (not c!76628)) b!665757))

(assert (= (and b!665755 (not res!433239)) b!665768))

(assert (= (and b!665768 (not res!433244)) b!665774))

(assert (= (and b!665774 (not res!433249)) b!665777))

(assert (= (and b!665777 (not res!433242)) b!665759))

(assert (= (and b!665759 (not res!433250)) b!665762))

(assert (= (and b!665762 (not res!433241)) b!665772))

(assert (= (and b!665772 (not res!433253)) b!665765))

(declare-fun m!636725 () Bool)

(assert (=> b!665763 m!636725))

(declare-fun m!636727 () Bool)

(assert (=> b!665761 m!636727))

(declare-fun m!636729 () Bool)

(assert (=> b!665772 m!636729))

(declare-fun m!636731 () Bool)

(assert (=> b!665764 m!636731))

(declare-fun m!636733 () Bool)

(assert (=> start!59978 m!636733))

(assert (=> b!665753 m!636725))

(declare-fun m!636735 () Bool)

(assert (=> b!665754 m!636735))

(declare-fun m!636737 () Bool)

(assert (=> b!665759 m!636737))

(declare-fun m!636739 () Bool)

(assert (=> b!665762 m!636739))

(assert (=> b!665777 m!636725))

(declare-fun m!636741 () Bool)

(assert (=> b!665767 m!636741))

(declare-fun m!636743 () Bool)

(assert (=> b!665767 m!636743))

(declare-fun m!636745 () Bool)

(assert (=> b!665767 m!636745))

(declare-fun m!636747 () Bool)

(assert (=> b!665767 m!636747))

(assert (=> b!665767 m!636743))

(assert (=> b!665767 m!636745))

(declare-fun m!636749 () Bool)

(assert (=> b!665767 m!636749))

(declare-fun m!636751 () Bool)

(assert (=> b!665767 m!636751))

(declare-fun m!636753 () Bool)

(assert (=> b!665766 m!636753))

(declare-fun m!636755 () Bool)

(assert (=> b!665758 m!636755))

(declare-fun m!636757 () Bool)

(assert (=> b!665755 m!636757))

(assert (=> b!665755 m!636741))

(assert (=> b!665755 m!636743))

(declare-fun m!636759 () Bool)

(assert (=> b!665755 m!636759))

(declare-fun m!636761 () Bool)

(assert (=> b!665755 m!636761))

(assert (=> b!665755 m!636749))

(declare-fun m!636763 () Bool)

(assert (=> b!665755 m!636763))

(declare-fun m!636765 () Bool)

(assert (=> b!665755 m!636765))

(assert (=> b!665755 m!636743))

(declare-fun m!636767 () Bool)

(assert (=> b!665755 m!636767))

(declare-fun m!636769 () Bool)

(assert (=> b!665755 m!636769))

(assert (=> b!665755 m!636751))

(declare-fun m!636771 () Bool)

(assert (=> b!665760 m!636771))

(declare-fun m!636773 () Bool)

(assert (=> b!665775 m!636773))

(declare-fun m!636775 () Bool)

(assert (=> b!665768 m!636775))

(declare-fun m!636777 () Bool)

(assert (=> b!665756 m!636777))

(declare-fun m!636779 () Bool)

(assert (=> b!665765 m!636779))

(push 1)

(assert (not b!665761))

(assert (not b!665753))

(assert (not b!665767))

(assert (not b!665765))

(assert (not b!665758))

(assert (not b!665766))

(assert (not b!665755))

(assert (not b!665756))

(assert (not b!665768))

(assert (not b!665775))

(assert (not b!665763))

(assert (not b!665759))

(assert (not b!665762))

(assert (not b!665772))

(assert (not start!59978))

(assert (not b!665764))

(assert (not b!665754))

(assert (not b!665777))

(assert (not b!665760))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

