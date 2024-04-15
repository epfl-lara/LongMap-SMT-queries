; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59948 () Bool)

(assert start!59948)

(declare-fun b!664782 () Bool)

(declare-fun res!432532 () Bool)

(declare-fun e!381057 () Bool)

(assert (=> b!664782 (=> res!432532 e!381057)))

(declare-fun lt!309627 () Bool)

(assert (=> b!664782 (= res!432532 lt!309627)))

(declare-fun b!664783 () Bool)

(declare-fun e!381059 () Bool)

(assert (=> b!664783 (= e!381059 (not e!381057))))

(declare-fun res!432534 () Bool)

(assert (=> b!664783 (=> res!432534 e!381057)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!664783 (= res!432534 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((List!12775 0))(
  ( (Nil!12772) (Cons!12771 (h!13816 (_ BitVec 64)) (t!18994 List!12775)) )
))
(declare-fun lt!309624 () List!12775)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun acc!681 () List!12775)

(declare-fun -!51 (List!12775 (_ BitVec 64)) List!12775)

(assert (=> b!664783 (= (-!51 lt!309624 k0!2843) acc!681)))

(declare-fun $colon$colon!184 (List!12775 (_ BitVec 64)) List!12775)

(assert (=> b!664783 (= lt!309624 ($colon$colon!184 acc!681 k0!2843))))

(declare-datatypes ((Unit!23183 0))(
  ( (Unit!23184) )
))
(declare-fun lt!309625 () Unit!23183)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12775) Unit!23183)

(assert (=> b!664783 (= lt!309625 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!53 (List!12775 List!12775) Bool)

(assert (=> b!664783 (subseq!53 acc!681 acc!681)))

(declare-fun lt!309620 () Unit!23183)

(declare-fun lemmaListSubSeqRefl!0 (List!12775) Unit!23183)

(assert (=> b!664783 (= lt!309620 (lemmaListSubSeqRefl!0 acc!681))))

(declare-datatypes ((array!39006 0))(
  ( (array!39007 (arr!18695 (Array (_ BitVec 32) (_ BitVec 64))) (size!19060 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39006)

(declare-fun arrayNoDuplicates!0 (array!39006 (_ BitVec 32) List!12775) Bool)

(assert (=> b!664783 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309618 () Unit!23183)

(declare-fun e!381055 () Unit!23183)

(assert (=> b!664783 (= lt!309618 e!381055)))

(declare-fun c!76494 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!664783 (= c!76494 (validKeyInArray!0 (select (arr!18695 a!3626) from!3004)))))

(declare-fun lt!309626 () Unit!23183)

(declare-fun e!381058 () Unit!23183)

(assert (=> b!664783 (= lt!309626 e!381058)))

(declare-fun c!76493 () Bool)

(assert (=> b!664783 (= c!76493 lt!309627)))

(declare-fun arrayContainsKey!0 (array!39006 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!664783 (= lt!309627 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!664783 (arrayContainsKey!0 (array!39007 (store (arr!18695 a!3626) i!1382 k0!2843) (size!19060 a!3626)) k0!2843 from!3004)))

(declare-fun b!664784 () Bool)

(declare-fun res!432543 () Bool)

(assert (=> b!664784 (=> (not res!432543) (not e!381059))))

(assert (=> b!664784 (= res!432543 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19060 a!3626))))))

(declare-fun b!664785 () Bool)

(declare-fun res!432536 () Bool)

(assert (=> b!664785 (=> (not res!432536) (not e!381059))))

(assert (=> b!664785 (= res!432536 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12772))))

(declare-fun b!664787 () Bool)

(declare-fun lt!309622 () Unit!23183)

(assert (=> b!664787 (= e!381055 lt!309622)))

(declare-fun lt!309621 () Unit!23183)

(assert (=> b!664787 (= lt!309621 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!664787 (subseq!53 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39006 List!12775 List!12775 (_ BitVec 32)) Unit!23183)

(assert (=> b!664787 (= lt!309622 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!184 acc!681 (select (arr!18695 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664787 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!664788 () Bool)

(declare-fun res!432549 () Bool)

(assert (=> b!664788 (=> (not res!432549) (not e!381059))))

(assert (=> b!664788 (= res!432549 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!664789 () Bool)

(declare-fun res!432533 () Bool)

(assert (=> b!664789 (=> res!432533 e!381057)))

(declare-fun contains!3297 (List!12775 (_ BitVec 64)) Bool)

(assert (=> b!664789 (= res!432533 (not (contains!3297 lt!309624 k0!2843)))))

(declare-fun b!664790 () Bool)

(declare-fun res!432545 () Bool)

(assert (=> b!664790 (=> (not res!432545) (not e!381059))))

(declare-fun e!381053 () Bool)

(assert (=> b!664790 (= res!432545 e!381053)))

(declare-fun res!432546 () Bool)

(assert (=> b!664790 (=> res!432546 e!381053)))

(declare-fun e!381056 () Bool)

(assert (=> b!664790 (= res!432546 e!381056)))

(declare-fun res!432539 () Bool)

(assert (=> b!664790 (=> (not res!432539) (not e!381056))))

(assert (=> b!664790 (= res!432539 (bvsgt from!3004 i!1382))))

(declare-fun b!664791 () Bool)

(declare-fun Unit!23185 () Unit!23183)

(assert (=> b!664791 (= e!381058 Unit!23185)))

(declare-fun lt!309623 () Unit!23183)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39006 (_ BitVec 64) (_ BitVec 32)) Unit!23183)

(assert (=> b!664791 (= lt!309623 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!664791 false))

(declare-fun b!664792 () Bool)

(declare-fun res!432548 () Bool)

(assert (=> b!664792 (=> res!432548 e!381057)))

(declare-fun noDuplicate!566 (List!12775) Bool)

(assert (=> b!664792 (= res!432548 (not (noDuplicate!566 lt!309624)))))

(declare-fun b!664793 () Bool)

(declare-fun res!432544 () Bool)

(assert (=> b!664793 (=> res!432544 e!381057)))

(assert (=> b!664793 (= res!432544 (contains!3297 acc!681 k0!2843))))

(declare-fun b!664794 () Bool)

(declare-fun e!381054 () Bool)

(assert (=> b!664794 (= e!381054 (not (contains!3297 acc!681 k0!2843)))))

(declare-fun b!664795 () Bool)

(declare-fun res!432542 () Bool)

(assert (=> b!664795 (=> (not res!432542) (not e!381059))))

(assert (=> b!664795 (= res!432542 (noDuplicate!566 acc!681))))

(declare-fun b!664796 () Bool)

(declare-fun Unit!23186 () Unit!23183)

(assert (=> b!664796 (= e!381058 Unit!23186)))

(declare-fun b!664797 () Bool)

(assert (=> b!664797 (= e!381053 e!381054)))

(declare-fun res!432537 () Bool)

(assert (=> b!664797 (=> (not res!432537) (not e!381054))))

(assert (=> b!664797 (= res!432537 (bvsle from!3004 i!1382))))

(declare-fun b!664798 () Bool)

(declare-fun res!432530 () Bool)

(assert (=> b!664798 (=> (not res!432530) (not e!381059))))

(assert (=> b!664798 (= res!432530 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19060 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!664799 () Bool)

(declare-fun res!432535 () Bool)

(assert (=> b!664799 (=> (not res!432535) (not e!381059))))

(assert (=> b!664799 (= res!432535 (not (contains!3297 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664800 () Bool)

(assert (=> b!664800 (= e!381057 true)))

(declare-fun lt!309619 () Bool)

(assert (=> b!664800 (= lt!309619 (contains!3297 lt!309624 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664801 () Bool)

(declare-fun res!432531 () Bool)

(assert (=> b!664801 (=> res!432531 e!381057)))

(assert (=> b!664801 (= res!432531 (not (subseq!53 acc!681 lt!309624)))))

(declare-fun b!664802 () Bool)

(declare-fun res!432538 () Bool)

(assert (=> b!664802 (=> (not res!432538) (not e!381059))))

(assert (=> b!664802 (= res!432538 (validKeyInArray!0 k0!2843))))

(declare-fun b!664803 () Bool)

(declare-fun res!432550 () Bool)

(assert (=> b!664803 (=> (not res!432550) (not e!381059))))

(assert (=> b!664803 (= res!432550 (not (contains!3297 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664804 () Bool)

(assert (=> b!664804 (= e!381056 (contains!3297 acc!681 k0!2843))))

(declare-fun b!664786 () Bool)

(declare-fun res!432541 () Bool)

(assert (=> b!664786 (=> res!432541 e!381057)))

(assert (=> b!664786 (= res!432541 (contains!3297 lt!309624 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!432540 () Bool)

(assert (=> start!59948 (=> (not res!432540) (not e!381059))))

(assert (=> start!59948 (= res!432540 (and (bvslt (size!19060 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19060 a!3626))))))

(assert (=> start!59948 e!381059))

(assert (=> start!59948 true))

(declare-fun array_inv!14578 (array!39006) Bool)

(assert (=> start!59948 (array_inv!14578 a!3626)))

(declare-fun b!664805 () Bool)

(declare-fun Unit!23187 () Unit!23183)

(assert (=> b!664805 (= e!381055 Unit!23187)))

(declare-fun b!664806 () Bool)

(declare-fun res!432547 () Bool)

(assert (=> b!664806 (=> (not res!432547) (not e!381059))))

(assert (=> b!664806 (= res!432547 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!59948 res!432540) b!664795))

(assert (= (and b!664795 res!432542) b!664799))

(assert (= (and b!664799 res!432535) b!664803))

(assert (= (and b!664803 res!432550) b!664790))

(assert (= (and b!664790 res!432539) b!664804))

(assert (= (and b!664790 (not res!432546)) b!664797))

(assert (= (and b!664797 res!432537) b!664794))

(assert (= (and b!664790 res!432545) b!664785))

(assert (= (and b!664785 res!432536) b!664806))

(assert (= (and b!664806 res!432547) b!664784))

(assert (= (and b!664784 res!432543) b!664802))

(assert (= (and b!664802 res!432538) b!664788))

(assert (= (and b!664788 res!432549) b!664798))

(assert (= (and b!664798 res!432530) b!664783))

(assert (= (and b!664783 c!76493) b!664791))

(assert (= (and b!664783 (not c!76493)) b!664796))

(assert (= (and b!664783 c!76494) b!664787))

(assert (= (and b!664783 (not c!76494)) b!664805))

(assert (= (and b!664783 (not res!432534)) b!664792))

(assert (= (and b!664792 (not res!432548)) b!664782))

(assert (= (and b!664782 (not res!432532)) b!664793))

(assert (= (and b!664793 (not res!432544)) b!664801))

(assert (= (and b!664801 (not res!432531)) b!664789))

(assert (= (and b!664789 (not res!432533)) b!664786))

(assert (= (and b!664786 (not res!432541)) b!664800))

(declare-fun m!635439 () Bool)

(assert (=> b!664792 m!635439))

(declare-fun m!635441 () Bool)

(assert (=> b!664804 m!635441))

(declare-fun m!635443 () Bool)

(assert (=> b!664803 m!635443))

(assert (=> b!664794 m!635441))

(declare-fun m!635445 () Bool)

(assert (=> b!664800 m!635445))

(declare-fun m!635447 () Bool)

(assert (=> b!664799 m!635447))

(declare-fun m!635449 () Bool)

(assert (=> start!59948 m!635449))

(declare-fun m!635451 () Bool)

(assert (=> b!664791 m!635451))

(declare-fun m!635453 () Bool)

(assert (=> b!664802 m!635453))

(declare-fun m!635455 () Bool)

(assert (=> b!664801 m!635455))

(assert (=> b!664793 m!635441))

(declare-fun m!635457 () Bool)

(assert (=> b!664787 m!635457))

(declare-fun m!635459 () Bool)

(assert (=> b!664787 m!635459))

(declare-fun m!635461 () Bool)

(assert (=> b!664787 m!635461))

(declare-fun m!635463 () Bool)

(assert (=> b!664787 m!635463))

(assert (=> b!664787 m!635459))

(assert (=> b!664787 m!635461))

(declare-fun m!635465 () Bool)

(assert (=> b!664787 m!635465))

(declare-fun m!635467 () Bool)

(assert (=> b!664787 m!635467))

(declare-fun m!635469 () Bool)

(assert (=> b!664785 m!635469))

(declare-fun m!635471 () Bool)

(assert (=> b!664786 m!635471))

(declare-fun m!635473 () Bool)

(assert (=> b!664795 m!635473))

(declare-fun m!635475 () Bool)

(assert (=> b!664789 m!635475))

(declare-fun m!635477 () Bool)

(assert (=> b!664806 m!635477))

(declare-fun m!635479 () Bool)

(assert (=> b!664783 m!635479))

(assert (=> b!664783 m!635457))

(assert (=> b!664783 m!635459))

(declare-fun m!635481 () Bool)

(assert (=> b!664783 m!635481))

(declare-fun m!635483 () Bool)

(assert (=> b!664783 m!635483))

(assert (=> b!664783 m!635465))

(declare-fun m!635485 () Bool)

(assert (=> b!664783 m!635485))

(declare-fun m!635487 () Bool)

(assert (=> b!664783 m!635487))

(assert (=> b!664783 m!635459))

(declare-fun m!635489 () Bool)

(assert (=> b!664783 m!635489))

(declare-fun m!635491 () Bool)

(assert (=> b!664783 m!635491))

(assert (=> b!664783 m!635467))

(declare-fun m!635493 () Bool)

(assert (=> b!664788 m!635493))

(check-sat (not b!664803) (not b!664785) (not b!664791) (not b!664801) (not b!664792) (not b!664800) (not b!664783) (not b!664788) (not b!664787) (not b!664804) (not b!664789) (not start!59948) (not b!664794) (not b!664795) (not b!664802) (not b!664799) (not b!664806) (not b!664786) (not b!664793))
(check-sat)
