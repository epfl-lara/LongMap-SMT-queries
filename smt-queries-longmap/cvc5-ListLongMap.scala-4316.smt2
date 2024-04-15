; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59916 () Bool)

(assert start!59916)

(declare-fun b!663652 () Bool)

(declare-fun res!431601 () Bool)

(declare-fun e!380680 () Bool)

(assert (=> b!663652 (=> (not res!431601) (not e!380680))))

(declare-datatypes ((List!12759 0))(
  ( (Nil!12756) (Cons!12755 (h!13800 (_ BitVec 64)) (t!18978 List!12759)) )
))
(declare-fun acc!681 () List!12759)

(declare-fun contains!3281 (List!12759 (_ BitVec 64)) Bool)

(assert (=> b!663652 (= res!431601 (not (contains!3281 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663653 () Bool)

(declare-fun e!380684 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!663653 (= e!380684 (contains!3281 acc!681 k!2843))))

(declare-fun b!663654 () Bool)

(declare-fun res!431602 () Bool)

(assert (=> b!663654 (=> (not res!431602) (not e!380680))))

(declare-datatypes ((array!38974 0))(
  ( (array!38975 (arr!18679 (Array (_ BitVec 32) (_ BitVec 64))) (size!19044 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38974)

(declare-fun arrayNoDuplicates!0 (array!38974 (_ BitVec 32) List!12759) Bool)

(assert (=> b!663654 (= res!431602 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12756))))

(declare-fun b!663655 () Bool)

(declare-datatypes ((Unit!23103 0))(
  ( (Unit!23104) )
))
(declare-fun e!380683 () Unit!23103)

(declare-fun Unit!23105 () Unit!23103)

(assert (=> b!663655 (= e!380683 Unit!23105)))

(declare-fun b!663656 () Bool)

(declare-fun res!431603 () Bool)

(assert (=> b!663656 (=> (not res!431603) (not e!380680))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!663656 (= res!431603 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19044 a!3626))))))

(declare-fun b!663657 () Bool)

(declare-fun Unit!23106 () Unit!23103)

(assert (=> b!663657 (= e!380683 Unit!23106)))

(declare-fun lt!309174 () Unit!23103)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38974 (_ BitVec 64) (_ BitVec 32)) Unit!23103)

(assert (=> b!663657 (= lt!309174 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!663657 false))

(declare-fun b!663658 () Bool)

(declare-fun e!380681 () Bool)

(assert (=> b!663658 (= e!380681 (not (contains!3281 acc!681 k!2843)))))

(declare-fun res!431593 () Bool)

(assert (=> start!59916 (=> (not res!431593) (not e!380680))))

(assert (=> start!59916 (= res!431593 (and (bvslt (size!19044 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19044 a!3626))))))

(assert (=> start!59916 e!380680))

(assert (=> start!59916 true))

(declare-fun array_inv!14562 (array!38974) Bool)

(assert (=> start!59916 (array_inv!14562 a!3626)))

(declare-fun b!663659 () Bool)

(declare-fun e!380679 () Bool)

(assert (=> b!663659 (= e!380679 e!380681)))

(declare-fun res!431596 () Bool)

(assert (=> b!663659 (=> (not res!431596) (not e!380681))))

(assert (=> b!663659 (= res!431596 (bvsle from!3004 i!1382))))

(declare-fun b!663660 () Bool)

(assert (=> b!663660 (= e!380680 (not true))))

(declare-fun lt!309173 () Unit!23103)

(declare-fun e!380678 () Unit!23103)

(assert (=> b!663660 (= lt!309173 e!380678)))

(declare-fun c!76398 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!663660 (= c!76398 (validKeyInArray!0 (select (arr!18679 a!3626) from!3004)))))

(declare-fun lt!309172 () Unit!23103)

(assert (=> b!663660 (= lt!309172 e!380683)))

(declare-fun c!76397 () Bool)

(declare-fun arrayContainsKey!0 (array!38974 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!663660 (= c!76397 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663660 (arrayContainsKey!0 (array!38975 (store (arr!18679 a!3626) i!1382 k!2843) (size!19044 a!3626)) k!2843 from!3004)))

(declare-fun b!663661 () Bool)

(declare-fun res!431594 () Bool)

(assert (=> b!663661 (=> (not res!431594) (not e!380680))))

(assert (=> b!663661 (= res!431594 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!663662 () Bool)

(declare-fun Unit!23107 () Unit!23103)

(assert (=> b!663662 (= e!380678 Unit!23107)))

(declare-fun b!663663 () Bool)

(declare-fun res!431595 () Bool)

(assert (=> b!663663 (=> (not res!431595) (not e!380680))))

(assert (=> b!663663 (= res!431595 e!380679)))

(declare-fun res!431597 () Bool)

(assert (=> b!663663 (=> res!431597 e!380679)))

(assert (=> b!663663 (= res!431597 e!380684)))

(declare-fun res!431600 () Bool)

(assert (=> b!663663 (=> (not res!431600) (not e!380684))))

(assert (=> b!663663 (= res!431600 (bvsgt from!3004 i!1382))))

(declare-fun b!663664 () Bool)

(declare-fun res!431592 () Bool)

(assert (=> b!663664 (=> (not res!431592) (not e!380680))))

(assert (=> b!663664 (= res!431592 (validKeyInArray!0 k!2843))))

(declare-fun b!663665 () Bool)

(declare-fun res!431605 () Bool)

(assert (=> b!663665 (=> (not res!431605) (not e!380680))))

(declare-fun noDuplicate!550 (List!12759) Bool)

(assert (=> b!663665 (= res!431605 (noDuplicate!550 acc!681))))

(declare-fun b!663666 () Bool)

(declare-fun res!431604 () Bool)

(assert (=> b!663666 (=> (not res!431604) (not e!380680))))

(assert (=> b!663666 (= res!431604 (not (contains!3281 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663667 () Bool)

(declare-fun res!431598 () Bool)

(assert (=> b!663667 (=> (not res!431598) (not e!380680))))

(assert (=> b!663667 (= res!431598 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!663668 () Bool)

(declare-fun res!431599 () Bool)

(assert (=> b!663668 (=> (not res!431599) (not e!380680))))

(assert (=> b!663668 (= res!431599 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19044 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!663669 () Bool)

(declare-fun lt!309170 () Unit!23103)

(assert (=> b!663669 (= e!380678 lt!309170)))

(declare-fun lt!309171 () Unit!23103)

(declare-fun lemmaListSubSeqRefl!0 (List!12759) Unit!23103)

(assert (=> b!663669 (= lt!309171 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!37 (List!12759 List!12759) Bool)

(assert (=> b!663669 (subseq!37 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38974 List!12759 List!12759 (_ BitVec 32)) Unit!23103)

(declare-fun $colon$colon!168 (List!12759 (_ BitVec 64)) List!12759)

(assert (=> b!663669 (= lt!309170 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!168 acc!681 (select (arr!18679 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663669 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(assert (= (and start!59916 res!431593) b!663665))

(assert (= (and b!663665 res!431605) b!663652))

(assert (= (and b!663652 res!431601) b!663666))

(assert (= (and b!663666 res!431604) b!663663))

(assert (= (and b!663663 res!431600) b!663653))

(assert (= (and b!663663 (not res!431597)) b!663659))

(assert (= (and b!663659 res!431596) b!663658))

(assert (= (and b!663663 res!431595) b!663654))

(assert (= (and b!663654 res!431602) b!663667))

(assert (= (and b!663667 res!431598) b!663656))

(assert (= (and b!663656 res!431603) b!663664))

(assert (= (and b!663664 res!431592) b!663661))

(assert (= (and b!663661 res!431594) b!663668))

(assert (= (and b!663668 res!431599) b!663660))

(assert (= (and b!663660 c!76397) b!663657))

(assert (= (and b!663660 (not c!76397)) b!663655))

(assert (= (and b!663660 c!76398) b!663669))

(assert (= (and b!663660 (not c!76398)) b!663662))

(declare-fun m!634607 () Bool)

(assert (=> b!663653 m!634607))

(declare-fun m!634609 () Bool)

(assert (=> b!663661 m!634609))

(declare-fun m!634611 () Bool)

(assert (=> b!663654 m!634611))

(declare-fun m!634613 () Bool)

(assert (=> b!663665 m!634613))

(declare-fun m!634615 () Bool)

(assert (=> start!59916 m!634615))

(assert (=> b!663658 m!634607))

(declare-fun m!634617 () Bool)

(assert (=> b!663657 m!634617))

(declare-fun m!634619 () Bool)

(assert (=> b!663664 m!634619))

(declare-fun m!634621 () Bool)

(assert (=> b!663667 m!634621))

(declare-fun m!634623 () Bool)

(assert (=> b!663660 m!634623))

(declare-fun m!634625 () Bool)

(assert (=> b!663660 m!634625))

(declare-fun m!634627 () Bool)

(assert (=> b!663660 m!634627))

(assert (=> b!663660 m!634623))

(declare-fun m!634629 () Bool)

(assert (=> b!663660 m!634629))

(declare-fun m!634631 () Bool)

(assert (=> b!663660 m!634631))

(declare-fun m!634633 () Bool)

(assert (=> b!663669 m!634633))

(assert (=> b!663669 m!634623))

(declare-fun m!634635 () Bool)

(assert (=> b!663669 m!634635))

(declare-fun m!634637 () Bool)

(assert (=> b!663669 m!634637))

(assert (=> b!663669 m!634623))

(assert (=> b!663669 m!634635))

(declare-fun m!634639 () Bool)

(assert (=> b!663669 m!634639))

(declare-fun m!634641 () Bool)

(assert (=> b!663669 m!634641))

(declare-fun m!634643 () Bool)

(assert (=> b!663652 m!634643))

(declare-fun m!634645 () Bool)

(assert (=> b!663666 m!634645))

(push 1)

(assert (not b!663653))

(assert (not b!663658))

(assert (not b!663664))

(assert (not b!663652))

(assert (not b!663657))

(assert (not start!59916))

(assert (not b!663661))

(assert (not b!663667))

(assert (not b!663666))

(assert (not b!663654))

(assert (not b!663669))

(assert (not b!663660))

(assert (not b!663665))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

