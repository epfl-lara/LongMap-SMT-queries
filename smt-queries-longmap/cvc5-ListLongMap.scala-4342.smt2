; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60080 () Bool)

(assert start!60080)

(declare-fun b!669578 () Bool)

(declare-fun res!436456 () Bool)

(declare-fun e!382958 () Bool)

(assert (=> b!669578 (=> (not res!436456) (not e!382958))))

(declare-datatypes ((array!39127 0))(
  ( (array!39128 (arr!18756 (Array (_ BitVec 32) (_ BitVec 64))) (size!19120 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39127)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!669578 (= res!436456 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!669580 () Bool)

(declare-fun e!382966 () Bool)

(declare-fun e!382967 () Bool)

(assert (=> b!669580 (= e!382966 e!382967)))

(declare-fun res!436453 () Bool)

(assert (=> b!669580 (=> (not res!436453) (not e!382967))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!669580 (= res!436453 (bvsle from!3004 i!1382))))

(declare-fun b!669581 () Bool)

(declare-fun res!436450 () Bool)

(assert (=> b!669581 (=> (not res!436450) (not e!382958))))

(declare-datatypes ((List!12797 0))(
  ( (Nil!12794) (Cons!12793 (h!13838 (_ BitVec 64)) (t!19025 List!12797)) )
))
(declare-fun acc!681 () List!12797)

(declare-fun arrayNoDuplicates!0 (array!39127 (_ BitVec 32) List!12797) Bool)

(assert (=> b!669581 (= res!436450 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!669582 () Bool)

(declare-datatypes ((Unit!23505 0))(
  ( (Unit!23506) )
))
(declare-fun e!382964 () Unit!23505)

(declare-fun Unit!23507 () Unit!23505)

(assert (=> b!669582 (= e!382964 Unit!23507)))

(declare-fun b!669583 () Bool)

(declare-fun e!382963 () Bool)

(declare-fun e!382960 () Bool)

(assert (=> b!669583 (= e!382963 e!382960)))

(declare-fun res!436455 () Bool)

(assert (=> b!669583 (=> (not res!436455) (not e!382960))))

(assert (=> b!669583 (= res!436455 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669584 () Bool)

(declare-fun e!382968 () Bool)

(declare-fun contains!3374 (List!12797 (_ BitVec 64)) Bool)

(assert (=> b!669584 (= e!382968 (contains!3374 acc!681 k!2843))))

(declare-fun b!669585 () Bool)

(declare-fun e!382959 () Bool)

(assert (=> b!669585 (= e!382959 true)))

(declare-fun lt!311682 () Bool)

(assert (=> b!669585 (= lt!311682 e!382963)))

(declare-fun res!436466 () Bool)

(assert (=> b!669585 (=> res!436466 e!382963)))

(declare-fun e!382962 () Bool)

(assert (=> b!669585 (= res!436466 e!382962)))

(declare-fun res!436459 () Bool)

(assert (=> b!669585 (=> (not res!436459) (not e!382962))))

(assert (=> b!669585 (= res!436459 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669586 () Bool)

(declare-fun lt!311680 () List!12797)

(assert (=> b!669586 (= e!382962 (contains!3374 lt!311680 k!2843))))

(declare-fun b!669587 () Bool)

(declare-fun res!436452 () Bool)

(assert (=> b!669587 (=> res!436452 e!382959)))

(assert (=> b!669587 (= res!436452 (contains!3374 lt!311680 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669588 () Bool)

(declare-fun res!436457 () Bool)

(assert (=> b!669588 (=> (not res!436457) (not e!382958))))

(assert (=> b!669588 (= res!436457 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19120 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!669589 () Bool)

(declare-fun Unit!23508 () Unit!23505)

(assert (=> b!669589 (= e!382964 Unit!23508)))

(declare-fun lt!311675 () Unit!23505)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39127 (_ BitVec 64) (_ BitVec 32)) Unit!23505)

(assert (=> b!669589 (= lt!311675 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!669589 false))

(declare-fun b!669590 () Bool)

(declare-fun res!436462 () Bool)

(assert (=> b!669590 (=> res!436462 e!382959)))

(assert (=> b!669590 (= res!436462 (contains!3374 lt!311680 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669591 () Bool)

(assert (=> b!669591 (= e!382958 (not e!382959))))

(declare-fun res!436454 () Bool)

(assert (=> b!669591 (=> res!436454 e!382959)))

(assert (=> b!669591 (= res!436454 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!669591 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311680)))

(declare-fun lt!311679 () Unit!23505)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39127 (_ BitVec 64) (_ BitVec 32) List!12797 List!12797) Unit!23505)

(assert (=> b!669591 (= lt!311679 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311680))))

(declare-fun -!111 (List!12797 (_ BitVec 64)) List!12797)

(assert (=> b!669591 (= (-!111 lt!311680 k!2843) acc!681)))

(declare-fun $colon$colon!245 (List!12797 (_ BitVec 64)) List!12797)

(assert (=> b!669591 (= lt!311680 ($colon$colon!245 acc!681 k!2843))))

(declare-fun lt!311683 () Unit!23505)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12797) Unit!23505)

(assert (=> b!669591 (= lt!311683 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!113 (List!12797 List!12797) Bool)

(assert (=> b!669591 (subseq!113 acc!681 acc!681)))

(declare-fun lt!311678 () Unit!23505)

(declare-fun lemmaListSubSeqRefl!0 (List!12797) Unit!23505)

(assert (=> b!669591 (= lt!311678 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669591 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311676 () Unit!23505)

(declare-fun e!382965 () Unit!23505)

(assert (=> b!669591 (= lt!311676 e!382965)))

(declare-fun c!76933 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!669591 (= c!76933 (validKeyInArray!0 (select (arr!18756 a!3626) from!3004)))))

(declare-fun lt!311677 () Unit!23505)

(assert (=> b!669591 (= lt!311677 e!382964)))

(declare-fun c!76934 () Bool)

(assert (=> b!669591 (= c!76934 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669591 (arrayContainsKey!0 (array!39128 (store (arr!18756 a!3626) i!1382 k!2843) (size!19120 a!3626)) k!2843 from!3004)))

(declare-fun b!669592 () Bool)

(assert (=> b!669592 (= e!382967 (not (contains!3374 acc!681 k!2843)))))

(declare-fun b!669593 () Bool)

(declare-fun res!436448 () Bool)

(assert (=> b!669593 (=> (not res!436448) (not e!382958))))

(assert (=> b!669593 (= res!436448 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12794))))

(declare-fun b!669594 () Bool)

(declare-fun res!436449 () Bool)

(assert (=> b!669594 (=> res!436449 e!382959)))

(declare-fun noDuplicate!621 (List!12797) Bool)

(assert (=> b!669594 (= res!436449 (not (noDuplicate!621 lt!311680)))))

(declare-fun b!669579 () Bool)

(declare-fun Unit!23509 () Unit!23505)

(assert (=> b!669579 (= e!382965 Unit!23509)))

(declare-fun res!436447 () Bool)

(assert (=> start!60080 (=> (not res!436447) (not e!382958))))

(assert (=> start!60080 (= res!436447 (and (bvslt (size!19120 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19120 a!3626))))))

(assert (=> start!60080 e!382958))

(assert (=> start!60080 true))

(declare-fun array_inv!14552 (array!39127) Bool)

(assert (=> start!60080 (array_inv!14552 a!3626)))

(declare-fun b!669595 () Bool)

(declare-fun res!436461 () Bool)

(assert (=> b!669595 (=> (not res!436461) (not e!382958))))

(assert (=> b!669595 (= res!436461 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19120 a!3626))))))

(declare-fun b!669596 () Bool)

(assert (=> b!669596 (= e!382960 (not (contains!3374 lt!311680 k!2843)))))

(declare-fun b!669597 () Bool)

(declare-fun res!436464 () Bool)

(assert (=> b!669597 (=> (not res!436464) (not e!382958))))

(assert (=> b!669597 (= res!436464 e!382966)))

(declare-fun res!436458 () Bool)

(assert (=> b!669597 (=> res!436458 e!382966)))

(assert (=> b!669597 (= res!436458 e!382968)))

(declare-fun res!436446 () Bool)

(assert (=> b!669597 (=> (not res!436446) (not e!382968))))

(assert (=> b!669597 (= res!436446 (bvsgt from!3004 i!1382))))

(declare-fun b!669598 () Bool)

(declare-fun res!436463 () Bool)

(assert (=> b!669598 (=> (not res!436463) (not e!382958))))

(assert (=> b!669598 (= res!436463 (validKeyInArray!0 k!2843))))

(declare-fun b!669599 () Bool)

(declare-fun res!436465 () Bool)

(assert (=> b!669599 (=> (not res!436465) (not e!382958))))

(assert (=> b!669599 (= res!436465 (noDuplicate!621 acc!681))))

(declare-fun b!669600 () Bool)

(declare-fun lt!311674 () Unit!23505)

(assert (=> b!669600 (= e!382965 lt!311674)))

(declare-fun lt!311681 () Unit!23505)

(assert (=> b!669600 (= lt!311681 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669600 (subseq!113 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39127 List!12797 List!12797 (_ BitVec 32)) Unit!23505)

(assert (=> b!669600 (= lt!311674 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!245 acc!681 (select (arr!18756 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669600 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!669601 () Bool)

(declare-fun res!436451 () Bool)

(assert (=> b!669601 (=> (not res!436451) (not e!382958))))

(assert (=> b!669601 (= res!436451 (not (contains!3374 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669602 () Bool)

(declare-fun res!436460 () Bool)

(assert (=> b!669602 (=> (not res!436460) (not e!382958))))

(assert (=> b!669602 (= res!436460 (not (contains!3374 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60080 res!436447) b!669599))

(assert (= (and b!669599 res!436465) b!669601))

(assert (= (and b!669601 res!436451) b!669602))

(assert (= (and b!669602 res!436460) b!669597))

(assert (= (and b!669597 res!436446) b!669584))

(assert (= (and b!669597 (not res!436458)) b!669580))

(assert (= (and b!669580 res!436453) b!669592))

(assert (= (and b!669597 res!436464) b!669593))

(assert (= (and b!669593 res!436448) b!669581))

(assert (= (and b!669581 res!436450) b!669595))

(assert (= (and b!669595 res!436461) b!669598))

(assert (= (and b!669598 res!436463) b!669578))

(assert (= (and b!669578 res!436456) b!669588))

(assert (= (and b!669588 res!436457) b!669591))

(assert (= (and b!669591 c!76934) b!669589))

(assert (= (and b!669591 (not c!76934)) b!669582))

(assert (= (and b!669591 c!76933) b!669600))

(assert (= (and b!669591 (not c!76933)) b!669579))

(assert (= (and b!669591 (not res!436454)) b!669594))

(assert (= (and b!669594 (not res!436449)) b!669590))

(assert (= (and b!669590 (not res!436462)) b!669587))

(assert (= (and b!669587 (not res!436452)) b!669585))

(assert (= (and b!669585 res!436459) b!669586))

(assert (= (and b!669585 (not res!436466)) b!669583))

(assert (= (and b!669583 res!436455) b!669596))

(declare-fun m!639641 () Bool)

(assert (=> b!669602 m!639641))

(declare-fun m!639643 () Bool)

(assert (=> b!669581 m!639643))

(declare-fun m!639645 () Bool)

(assert (=> b!669601 m!639645))

(declare-fun m!639647 () Bool)

(assert (=> b!669599 m!639647))

(declare-fun m!639649 () Bool)

(assert (=> b!669591 m!639649))

(declare-fun m!639651 () Bool)

(assert (=> b!669591 m!639651))

(declare-fun m!639653 () Bool)

(assert (=> b!669591 m!639653))

(declare-fun m!639655 () Bool)

(assert (=> b!669591 m!639655))

(declare-fun m!639657 () Bool)

(assert (=> b!669591 m!639657))

(declare-fun m!639659 () Bool)

(assert (=> b!669591 m!639659))

(declare-fun m!639661 () Bool)

(assert (=> b!669591 m!639661))

(declare-fun m!639663 () Bool)

(assert (=> b!669591 m!639663))

(declare-fun m!639665 () Bool)

(assert (=> b!669591 m!639665))

(assert (=> b!669591 m!639651))

(declare-fun m!639667 () Bool)

(assert (=> b!669591 m!639667))

(declare-fun m!639669 () Bool)

(assert (=> b!669591 m!639669))

(declare-fun m!639671 () Bool)

(assert (=> b!669591 m!639671))

(declare-fun m!639673 () Bool)

(assert (=> b!669591 m!639673))

(declare-fun m!639675 () Bool)

(assert (=> b!669594 m!639675))

(assert (=> b!669600 m!639649))

(assert (=> b!669600 m!639651))

(declare-fun m!639677 () Bool)

(assert (=> b!669600 m!639677))

(declare-fun m!639679 () Bool)

(assert (=> b!669600 m!639679))

(assert (=> b!669600 m!639651))

(assert (=> b!669600 m!639677))

(assert (=> b!669600 m!639659))

(assert (=> b!669600 m!639673))

(declare-fun m!639681 () Bool)

(assert (=> b!669578 m!639681))

(declare-fun m!639683 () Bool)

(assert (=> b!669587 m!639683))

(declare-fun m!639685 () Bool)

(assert (=> b!669592 m!639685))

(declare-fun m!639687 () Bool)

(assert (=> b!669593 m!639687))

(declare-fun m!639689 () Bool)

(assert (=> start!60080 m!639689))

(declare-fun m!639691 () Bool)

(assert (=> b!669598 m!639691))

(declare-fun m!639693 () Bool)

(assert (=> b!669596 m!639693))

(declare-fun m!639695 () Bool)

(assert (=> b!669590 m!639695))

(declare-fun m!639697 () Bool)

(assert (=> b!669589 m!639697))

(assert (=> b!669586 m!639693))

(assert (=> b!669584 m!639685))

(push 1)

(assert (not b!669593))

(assert (not b!669596))

(assert (not b!669587))

(assert (not b!669594))

(assert (not b!669592))

(assert (not b!669589))

(assert (not b!669586))

(assert (not b!669601))

(assert (not b!669600))

(assert (not b!669590))

(assert (not b!669581))

(assert (not b!669598))

(assert (not b!669578))

(assert (not b!669602))

(assert (not b!669599))

(assert (not b!669591))

(assert (not b!669584))

(assert (not start!60080))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

