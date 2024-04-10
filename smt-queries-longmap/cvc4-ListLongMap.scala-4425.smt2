; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61278 () Bool)

(assert start!61278)

(declare-fun b!686595 () Bool)

(declare-fun res!451699 () Bool)

(declare-fun e!390966 () Bool)

(assert (=> b!686595 (=> (not res!451699) (not e!390966))))

(declare-datatypes ((array!39662 0))(
  ( (array!39663 (arr!19007 (Array (_ BitVec 32) (_ BitVec 64))) (size!19381 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39662)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!13048 0))(
  ( (Nil!13045) (Cons!13044 (h!14089 (_ BitVec 64)) (t!19303 List!13048)) )
))
(declare-fun acc!681 () List!13048)

(declare-fun arrayNoDuplicates!0 (array!39662 (_ BitVec 32) List!13048) Bool)

(assert (=> b!686595 (= res!451699 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!686596 () Bool)

(declare-datatypes ((Unit!24202 0))(
  ( (Unit!24203) )
))
(declare-fun e!390971 () Unit!24202)

(declare-fun Unit!24204 () Unit!24202)

(assert (=> b!686596 (= e!390971 Unit!24204)))

(declare-fun b!686597 () Bool)

(declare-fun e!390967 () Unit!24202)

(declare-fun Unit!24205 () Unit!24202)

(assert (=> b!686597 (= e!390967 Unit!24205)))

(declare-fun b!686598 () Bool)

(declare-fun res!451702 () Bool)

(assert (=> b!686598 (=> (not res!451702) (not e!390966))))

(declare-fun contains!3625 (List!13048 (_ BitVec 64)) Bool)

(assert (=> b!686598 (= res!451702 (not (contains!3625 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686600 () Bool)

(declare-fun e!390970 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!686600 (= e!390970 (contains!3625 acc!681 k!2843))))

(declare-fun b!686601 () Bool)

(declare-fun Unit!24206 () Unit!24202)

(assert (=> b!686601 (= e!390971 Unit!24206)))

(declare-fun lt!315119 () Unit!24202)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39662 (_ BitVec 64) (_ BitVec 32)) Unit!24202)

(assert (=> b!686601 (= lt!315119 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!686601 false))

(declare-fun b!686602 () Bool)

(declare-fun res!451707 () Bool)

(assert (=> b!686602 (=> (not res!451707) (not e!390966))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!686602 (= res!451707 (validKeyInArray!0 k!2843))))

(declare-fun b!686603 () Bool)

(declare-fun res!451708 () Bool)

(assert (=> b!686603 (=> (not res!451708) (not e!390966))))

(declare-fun e!390968 () Bool)

(assert (=> b!686603 (= res!451708 e!390968)))

(declare-fun res!451704 () Bool)

(assert (=> b!686603 (=> res!451704 e!390968)))

(assert (=> b!686603 (= res!451704 e!390970)))

(declare-fun res!451700 () Bool)

(assert (=> b!686603 (=> (not res!451700) (not e!390970))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!686603 (= res!451700 (bvsgt from!3004 i!1382))))

(declare-fun res!451703 () Bool)

(assert (=> start!61278 (=> (not res!451703) (not e!390966))))

(assert (=> start!61278 (= res!451703 (and (bvslt (size!19381 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19381 a!3626))))))

(assert (=> start!61278 e!390966))

(assert (=> start!61278 true))

(declare-fun array_inv!14803 (array!39662) Bool)

(assert (=> start!61278 (array_inv!14803 a!3626)))

(declare-fun b!686599 () Bool)

(assert (=> b!686599 (= e!390966 (not true))))

(declare-fun lt!315124 () List!13048)

(assert (=> b!686599 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315124)))

(declare-fun lt!315122 () Unit!24202)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39662 (_ BitVec 64) (_ BitVec 32) List!13048 List!13048) Unit!24202)

(assert (=> b!686599 (= lt!315122 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315124))))

(declare-fun -!176 (List!13048 (_ BitVec 64)) List!13048)

(assert (=> b!686599 (= (-!176 lt!315124 k!2843) acc!681)))

(declare-fun $colon$colon!376 (List!13048 (_ BitVec 64)) List!13048)

(assert (=> b!686599 (= lt!315124 ($colon$colon!376 acc!681 k!2843))))

(declare-fun lt!315121 () Unit!24202)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13048) Unit!24202)

(assert (=> b!686599 (= lt!315121 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!211 (List!13048 List!13048) Bool)

(assert (=> b!686599 (subseq!211 acc!681 acc!681)))

(declare-fun lt!315118 () Unit!24202)

(declare-fun lemmaListSubSeqRefl!0 (List!13048) Unit!24202)

(assert (=> b!686599 (= lt!315118 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686599 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315120 () Unit!24202)

(assert (=> b!686599 (= lt!315120 e!390967)))

(declare-fun c!77816 () Bool)

(assert (=> b!686599 (= c!77816 (validKeyInArray!0 (select (arr!19007 a!3626) from!3004)))))

(declare-fun lt!315123 () Unit!24202)

(assert (=> b!686599 (= lt!315123 e!390971)))

(declare-fun c!77815 () Bool)

(declare-fun arrayContainsKey!0 (array!39662 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!686599 (= c!77815 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686599 (arrayContainsKey!0 (array!39663 (store (arr!19007 a!3626) i!1382 k!2843) (size!19381 a!3626)) k!2843 from!3004)))

(declare-fun b!686604 () Bool)

(declare-fun e!390969 () Bool)

(assert (=> b!686604 (= e!390968 e!390969)))

(declare-fun res!451710 () Bool)

(assert (=> b!686604 (=> (not res!451710) (not e!390969))))

(assert (=> b!686604 (= res!451710 (bvsle from!3004 i!1382))))

(declare-fun b!686605 () Bool)

(declare-fun res!451711 () Bool)

(assert (=> b!686605 (=> (not res!451711) (not e!390966))))

(assert (=> b!686605 (= res!451711 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19381 a!3626))))))

(declare-fun b!686606 () Bool)

(declare-fun res!451701 () Bool)

(assert (=> b!686606 (=> (not res!451701) (not e!390966))))

(assert (=> b!686606 (= res!451701 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!686607 () Bool)

(declare-fun lt!315117 () Unit!24202)

(assert (=> b!686607 (= e!390967 lt!315117)))

(declare-fun lt!315116 () Unit!24202)

(assert (=> b!686607 (= lt!315116 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686607 (subseq!211 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39662 List!13048 List!13048 (_ BitVec 32)) Unit!24202)

(assert (=> b!686607 (= lt!315117 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!376 acc!681 (select (arr!19007 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686607 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!686608 () Bool)

(declare-fun res!451709 () Bool)

(assert (=> b!686608 (=> (not res!451709) (not e!390966))))

(assert (=> b!686608 (= res!451709 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13045))))

(declare-fun b!686609 () Bool)

(declare-fun res!451712 () Bool)

(assert (=> b!686609 (=> (not res!451712) (not e!390966))))

(assert (=> b!686609 (= res!451712 (not (contains!3625 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686610 () Bool)

(declare-fun res!451705 () Bool)

(assert (=> b!686610 (=> (not res!451705) (not e!390966))))

(assert (=> b!686610 (= res!451705 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19381 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!686611 () Bool)

(assert (=> b!686611 (= e!390969 (not (contains!3625 acc!681 k!2843)))))

(declare-fun b!686612 () Bool)

(declare-fun res!451706 () Bool)

(assert (=> b!686612 (=> (not res!451706) (not e!390966))))

(declare-fun noDuplicate!872 (List!13048) Bool)

(assert (=> b!686612 (= res!451706 (noDuplicate!872 acc!681))))

(assert (= (and start!61278 res!451703) b!686612))

(assert (= (and b!686612 res!451706) b!686609))

(assert (= (and b!686609 res!451712) b!686598))

(assert (= (and b!686598 res!451702) b!686603))

(assert (= (and b!686603 res!451700) b!686600))

(assert (= (and b!686603 (not res!451704)) b!686604))

(assert (= (and b!686604 res!451710) b!686611))

(assert (= (and b!686603 res!451708) b!686608))

(assert (= (and b!686608 res!451709) b!686595))

(assert (= (and b!686595 res!451699) b!686605))

(assert (= (and b!686605 res!451711) b!686602))

(assert (= (and b!686602 res!451707) b!686606))

(assert (= (and b!686606 res!451701) b!686610))

(assert (= (and b!686610 res!451705) b!686599))

(assert (= (and b!686599 c!77815) b!686601))

(assert (= (and b!686599 (not c!77815)) b!686596))

(assert (= (and b!686599 c!77816) b!686607))

(assert (= (and b!686599 (not c!77816)) b!686597))

(declare-fun m!650679 () Bool)

(assert (=> b!686599 m!650679))

(declare-fun m!650681 () Bool)

(assert (=> b!686599 m!650681))

(declare-fun m!650683 () Bool)

(assert (=> b!686599 m!650683))

(declare-fun m!650685 () Bool)

(assert (=> b!686599 m!650685))

(declare-fun m!650687 () Bool)

(assert (=> b!686599 m!650687))

(declare-fun m!650689 () Bool)

(assert (=> b!686599 m!650689))

(declare-fun m!650691 () Bool)

(assert (=> b!686599 m!650691))

(declare-fun m!650693 () Bool)

(assert (=> b!686599 m!650693))

(assert (=> b!686599 m!650681))

(declare-fun m!650695 () Bool)

(assert (=> b!686599 m!650695))

(declare-fun m!650697 () Bool)

(assert (=> b!686599 m!650697))

(declare-fun m!650699 () Bool)

(assert (=> b!686599 m!650699))

(declare-fun m!650701 () Bool)

(assert (=> b!686599 m!650701))

(declare-fun m!650703 () Bool)

(assert (=> b!686599 m!650703))

(declare-fun m!650705 () Bool)

(assert (=> b!686611 m!650705))

(declare-fun m!650707 () Bool)

(assert (=> b!686606 m!650707))

(declare-fun m!650709 () Bool)

(assert (=> b!686602 m!650709))

(declare-fun m!650711 () Bool)

(assert (=> b!686612 m!650711))

(assert (=> b!686600 m!650705))

(declare-fun m!650713 () Bool)

(assert (=> b!686609 m!650713))

(declare-fun m!650715 () Bool)

(assert (=> b!686595 m!650715))

(declare-fun m!650717 () Bool)

(assert (=> b!686601 m!650717))

(declare-fun m!650719 () Bool)

(assert (=> start!61278 m!650719))

(declare-fun m!650721 () Bool)

(assert (=> b!686608 m!650721))

(declare-fun m!650723 () Bool)

(assert (=> b!686598 m!650723))

(assert (=> b!686607 m!650679))

(assert (=> b!686607 m!650681))

(declare-fun m!650725 () Bool)

(assert (=> b!686607 m!650725))

(declare-fun m!650727 () Bool)

(assert (=> b!686607 m!650727))

(assert (=> b!686607 m!650681))

(assert (=> b!686607 m!650725))

(assert (=> b!686607 m!650687))

(assert (=> b!686607 m!650703))

(push 1)

(assert (not b!686601))

(assert (not b!686606))

(assert (not start!61278))

(assert (not b!686607))

(assert (not b!686609))

(assert (not b!686595))

(assert (not b!686611))

(assert (not b!686602))

(assert (not b!686599))

(assert (not b!686612))

(assert (not b!686598))

(assert (not b!686608))

(assert (not b!686600))

(check-sat)

