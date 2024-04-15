; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60866 () Bool)

(assert start!60866)

(declare-fun b!682597 () Bool)

(declare-fun res!448659 () Bool)

(declare-fun e!388857 () Bool)

(assert (=> b!682597 (=> (not res!448659) (not e!388857))))

(declare-datatypes ((array!39561 0))(
  ( (array!39562 (arr!18962 (Array (_ BitVec 32) (_ BitVec 64))) (size!19327 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39561)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!13042 0))(
  ( (Nil!13039) (Cons!13038 (h!14083 (_ BitVec 64)) (t!19276 List!13042)) )
))
(declare-fun acc!681 () List!13042)

(declare-fun arrayNoDuplicates!0 (array!39561 (_ BitVec 32) List!13042) Bool)

(assert (=> b!682597 (= res!448659 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!682598 () Bool)

(declare-fun res!448666 () Bool)

(assert (=> b!682598 (=> (not res!448666) (not e!388857))))

(declare-fun contains!3564 (List!13042 (_ BitVec 64)) Bool)

(assert (=> b!682598 (= res!448666 (not (contains!3564 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682599 () Bool)

(declare-fun res!448653 () Bool)

(assert (=> b!682599 (=> (not res!448653) (not e!388857))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!682599 (= res!448653 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19327 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!682600 () Bool)

(declare-fun res!448657 () Bool)

(assert (=> b!682600 (=> (not res!448657) (not e!388857))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!682600 (= res!448657 (validKeyInArray!0 k0!2843))))

(declare-fun b!682601 () Bool)

(declare-fun res!448655 () Bool)

(assert (=> b!682601 (=> (not res!448655) (not e!388857))))

(declare-fun noDuplicate!833 (List!13042) Bool)

(assert (=> b!682601 (= res!448655 (noDuplicate!833 acc!681))))

(declare-fun b!682602 () Bool)

(declare-fun res!448654 () Bool)

(assert (=> b!682602 (=> (not res!448654) (not e!388857))))

(assert (=> b!682602 (= res!448654 (not (contains!3564 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682603 () Bool)

(assert (=> b!682603 (= e!388857 (not true))))

(declare-fun -!132 (List!13042 (_ BitVec 64)) List!13042)

(declare-fun $colon$colon!331 (List!13042 (_ BitVec 64)) List!13042)

(assert (=> b!682603 (= (-!132 ($colon$colon!331 acc!681 k0!2843) k0!2843) acc!681)))

(declare-datatypes ((Unit!23960 0))(
  ( (Unit!23961) )
))
(declare-fun lt!313436 () Unit!23960)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13042) Unit!23960)

(assert (=> b!682603 (= lt!313436 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!167 (List!13042 List!13042) Bool)

(assert (=> b!682603 (subseq!167 acc!681 acc!681)))

(declare-fun lt!313437 () Unit!23960)

(declare-fun lemmaListSubSeqRefl!0 (List!13042) Unit!23960)

(assert (=> b!682603 (= lt!313437 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!682603 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313438 () Unit!23960)

(declare-fun e!388858 () Unit!23960)

(assert (=> b!682603 (= lt!313438 e!388858)))

(declare-fun c!77340 () Bool)

(assert (=> b!682603 (= c!77340 (validKeyInArray!0 (select (arr!18962 a!3626) from!3004)))))

(declare-fun lt!313435 () Unit!23960)

(declare-fun e!388853 () Unit!23960)

(assert (=> b!682603 (= lt!313435 e!388853)))

(declare-fun c!77339 () Bool)

(declare-fun arrayContainsKey!0 (array!39561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!682603 (= c!77339 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682603 (arrayContainsKey!0 (array!39562 (store (arr!18962 a!3626) i!1382 k0!2843) (size!19327 a!3626)) k0!2843 from!3004)))

(declare-fun b!682604 () Bool)

(declare-fun Unit!23962 () Unit!23960)

(assert (=> b!682604 (= e!388858 Unit!23962)))

(declare-fun b!682606 () Bool)

(declare-fun e!388854 () Bool)

(declare-fun e!388856 () Bool)

(assert (=> b!682606 (= e!388854 e!388856)))

(declare-fun res!448660 () Bool)

(assert (=> b!682606 (=> (not res!448660) (not e!388856))))

(assert (=> b!682606 (= res!448660 (bvsle from!3004 i!1382))))

(declare-fun b!682607 () Bool)

(declare-fun e!388859 () Bool)

(assert (=> b!682607 (= e!388859 (contains!3564 acc!681 k0!2843))))

(declare-fun b!682608 () Bool)

(declare-fun res!448663 () Bool)

(assert (=> b!682608 (=> (not res!448663) (not e!388857))))

(assert (=> b!682608 (= res!448663 e!388854)))

(declare-fun res!448665 () Bool)

(assert (=> b!682608 (=> res!448665 e!388854)))

(assert (=> b!682608 (= res!448665 e!388859)))

(declare-fun res!448658 () Bool)

(assert (=> b!682608 (=> (not res!448658) (not e!388859))))

(assert (=> b!682608 (= res!448658 (bvsgt from!3004 i!1382))))

(declare-fun b!682609 () Bool)

(declare-fun Unit!23963 () Unit!23960)

(assert (=> b!682609 (= e!388853 Unit!23963)))

(declare-fun b!682610 () Bool)

(declare-fun lt!313439 () Unit!23960)

(assert (=> b!682610 (= e!388858 lt!313439)))

(declare-fun lt!313440 () Unit!23960)

(assert (=> b!682610 (= lt!313440 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!682610 (subseq!167 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39561 List!13042 List!13042 (_ BitVec 32)) Unit!23960)

(assert (=> b!682610 (= lt!313439 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!331 acc!681 (select (arr!18962 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682610 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!682611 () Bool)

(declare-fun res!448664 () Bool)

(assert (=> b!682611 (=> (not res!448664) (not e!388857))))

(assert (=> b!682611 (= res!448664 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!682612 () Bool)

(assert (=> b!682612 (= e!388856 (not (contains!3564 acc!681 k0!2843)))))

(declare-fun b!682613 () Bool)

(declare-fun res!448656 () Bool)

(assert (=> b!682613 (=> (not res!448656) (not e!388857))))

(assert (=> b!682613 (= res!448656 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13039))))

(declare-fun b!682614 () Bool)

(declare-fun Unit!23964 () Unit!23960)

(assert (=> b!682614 (= e!388853 Unit!23964)))

(declare-fun lt!313434 () Unit!23960)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39561 (_ BitVec 64) (_ BitVec 32)) Unit!23960)

(assert (=> b!682614 (= lt!313434 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!682614 false))

(declare-fun res!448661 () Bool)

(assert (=> start!60866 (=> (not res!448661) (not e!388857))))

(assert (=> start!60866 (= res!448661 (and (bvslt (size!19327 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19327 a!3626))))))

(assert (=> start!60866 e!388857))

(assert (=> start!60866 true))

(declare-fun array_inv!14845 (array!39561) Bool)

(assert (=> start!60866 (array_inv!14845 a!3626)))

(declare-fun b!682605 () Bool)

(declare-fun res!448662 () Bool)

(assert (=> b!682605 (=> (not res!448662) (not e!388857))))

(assert (=> b!682605 (= res!448662 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19327 a!3626))))))

(assert (= (and start!60866 res!448661) b!682601))

(assert (= (and b!682601 res!448655) b!682598))

(assert (= (and b!682598 res!448666) b!682602))

(assert (= (and b!682602 res!448654) b!682608))

(assert (= (and b!682608 res!448658) b!682607))

(assert (= (and b!682608 (not res!448665)) b!682606))

(assert (= (and b!682606 res!448660) b!682612))

(assert (= (and b!682608 res!448663) b!682613))

(assert (= (and b!682613 res!448656) b!682597))

(assert (= (and b!682597 res!448659) b!682605))

(assert (= (and b!682605 res!448662) b!682600))

(assert (= (and b!682600 res!448657) b!682611))

(assert (= (and b!682611 res!448664) b!682599))

(assert (= (and b!682599 res!448653) b!682603))

(assert (= (and b!682603 c!77339) b!682614))

(assert (= (and b!682603 (not c!77339)) b!682609))

(assert (= (and b!682603 c!77340) b!682610))

(assert (= (and b!682603 (not c!77340)) b!682604))

(declare-fun m!646731 () Bool)

(assert (=> b!682611 m!646731))

(declare-fun m!646733 () Bool)

(assert (=> b!682600 m!646733))

(declare-fun m!646735 () Bool)

(assert (=> b!682614 m!646735))

(declare-fun m!646737 () Bool)

(assert (=> b!682598 m!646737))

(declare-fun m!646739 () Bool)

(assert (=> b!682613 m!646739))

(declare-fun m!646741 () Bool)

(assert (=> b!682602 m!646741))

(declare-fun m!646743 () Bool)

(assert (=> b!682597 m!646743))

(declare-fun m!646745 () Bool)

(assert (=> b!682610 m!646745))

(declare-fun m!646747 () Bool)

(assert (=> b!682610 m!646747))

(declare-fun m!646749 () Bool)

(assert (=> b!682610 m!646749))

(declare-fun m!646751 () Bool)

(assert (=> b!682610 m!646751))

(assert (=> b!682610 m!646747))

(assert (=> b!682610 m!646749))

(declare-fun m!646753 () Bool)

(assert (=> b!682610 m!646753))

(declare-fun m!646755 () Bool)

(assert (=> b!682610 m!646755))

(declare-fun m!646757 () Bool)

(assert (=> b!682603 m!646757))

(declare-fun m!646759 () Bool)

(assert (=> b!682603 m!646759))

(assert (=> b!682603 m!646745))

(assert (=> b!682603 m!646747))

(declare-fun m!646761 () Bool)

(assert (=> b!682603 m!646761))

(declare-fun m!646763 () Bool)

(assert (=> b!682603 m!646763))

(assert (=> b!682603 m!646753))

(declare-fun m!646765 () Bool)

(assert (=> b!682603 m!646765))

(assert (=> b!682603 m!646757))

(assert (=> b!682603 m!646747))

(declare-fun m!646767 () Bool)

(assert (=> b!682603 m!646767))

(declare-fun m!646769 () Bool)

(assert (=> b!682603 m!646769))

(assert (=> b!682603 m!646755))

(declare-fun m!646771 () Bool)

(assert (=> b!682612 m!646771))

(assert (=> b!682607 m!646771))

(declare-fun m!646773 () Bool)

(assert (=> b!682601 m!646773))

(declare-fun m!646775 () Bool)

(assert (=> start!60866 m!646775))

(check-sat (not b!682601) (not b!682607) (not b!682612) (not b!682600) (not b!682603) (not b!682613) (not start!60866) (not b!682602) (not b!682611) (not b!682610) (not b!682598) (not b!682597) (not b!682614))
(check-sat)
