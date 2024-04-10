; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59884 () Bool)

(assert start!59884)

(declare-fun b!662636 () Bool)

(declare-fun res!430621 () Bool)

(declare-fun e!380379 () Bool)

(assert (=> b!662636 (=> (not res!430621) (not e!380379))))

(declare-datatypes ((List!12699 0))(
  ( (Nil!12696) (Cons!12695 (h!13740 (_ BitVec 64)) (t!18927 List!12699)) )
))
(declare-fun acc!681 () List!12699)

(declare-fun noDuplicate!523 (List!12699) Bool)

(assert (=> b!662636 (= res!430621 (noDuplicate!523 acc!681))))

(declare-fun res!430633 () Bool)

(assert (=> start!59884 (=> (not res!430633) (not e!380379))))

(declare-datatypes ((array!38931 0))(
  ( (array!38932 (arr!18658 (Array (_ BitVec 32) (_ BitVec 64))) (size!19022 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38931)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59884 (= res!430633 (and (bvslt (size!19022 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19022 a!3626))))))

(assert (=> start!59884 e!380379))

(assert (=> start!59884 true))

(declare-fun array_inv!14454 (array!38931) Bool)

(assert (=> start!59884 (array_inv!14454 a!3626)))

(declare-fun b!662637 () Bool)

(declare-datatypes ((Unit!23026 0))(
  ( (Unit!23027) )
))
(declare-fun e!380382 () Unit!23026)

(declare-fun Unit!23028 () Unit!23026)

(assert (=> b!662637 (= e!380382 Unit!23028)))

(declare-fun lt!309068 () Unit!23026)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38931 (_ BitVec 64) (_ BitVec 32)) Unit!23026)

(assert (=> b!662637 (= lt!309068 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!662637 false))

(declare-fun b!662638 () Bool)

(declare-fun res!430637 () Bool)

(assert (=> b!662638 (=> (not res!430637) (not e!380379))))

(declare-fun contains!3276 (List!12699 (_ BitVec 64)) Bool)

(assert (=> b!662638 (= res!430637 (not (contains!3276 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662639 () Bool)

(declare-fun e!380381 () Bool)

(assert (=> b!662639 (= e!380381 true)))

(declare-fun lt!309069 () Bool)

(declare-fun lt!309070 () List!12699)

(declare-fun arrayNoDuplicates!0 (array!38931 (_ BitVec 32) List!12699) Bool)

(assert (=> b!662639 (= lt!309069 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!309070))))

(declare-fun lt!309067 () Unit!23026)

(declare-fun noDuplicateSubseq!15 (List!12699 List!12699) Unit!23026)

(assert (=> b!662639 (= lt!309067 (noDuplicateSubseq!15 acc!681 lt!309070))))

(declare-fun b!662640 () Bool)

(declare-fun res!430630 () Bool)

(assert (=> b!662640 (=> (not res!430630) (not e!380379))))

(declare-fun arrayContainsKey!0 (array!38931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!662640 (= res!430630 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!662641 () Bool)

(declare-fun res!430635 () Bool)

(assert (=> b!662641 (=> (not res!430635) (not e!380379))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!662641 (= res!430635 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19022 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!662642 () Bool)

(declare-fun e!380377 () Bool)

(assert (=> b!662642 (= e!380377 e!380381)))

(declare-fun res!430622 () Bool)

(assert (=> b!662642 (=> res!430622 e!380381)))

(assert (=> b!662642 (= res!430622 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!147 (List!12699 (_ BitVec 64)) List!12699)

(assert (=> b!662642 (= lt!309070 ($colon$colon!147 acc!681 (select (arr!18658 a!3626) from!3004)))))

(declare-fun subseq!15 (List!12699 List!12699) Bool)

(assert (=> b!662642 (subseq!15 acc!681 acc!681)))

(declare-fun lt!309065 () Unit!23026)

(declare-fun lemmaListSubSeqRefl!0 (List!12699) Unit!23026)

(assert (=> b!662642 (= lt!309065 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!662643 () Bool)

(declare-fun e!380380 () Bool)

(assert (=> b!662643 (= e!380380 (contains!3276 acc!681 k0!2843))))

(declare-fun b!662644 () Bool)

(declare-fun res!430624 () Bool)

(assert (=> b!662644 (=> (not res!430624) (not e!380379))))

(assert (=> b!662644 (= res!430624 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19022 a!3626))))))

(declare-fun b!662645 () Bool)

(declare-fun Unit!23029 () Unit!23026)

(assert (=> b!662645 (= e!380382 Unit!23029)))

(declare-fun b!662646 () Bool)

(declare-fun res!430636 () Bool)

(assert (=> b!662646 (=> (not res!430636) (not e!380379))))

(assert (=> b!662646 (= res!430636 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12696))))

(declare-fun b!662647 () Bool)

(declare-fun res!430629 () Bool)

(assert (=> b!662647 (=> (not res!430629) (not e!380379))))

(assert (=> b!662647 (= res!430629 (not (contains!3276 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662648 () Bool)

(declare-fun res!430634 () Bool)

(assert (=> b!662648 (=> res!430634 e!380381)))

(assert (=> b!662648 (= res!430634 (not (subseq!15 acc!681 lt!309070)))))

(declare-fun b!662649 () Bool)

(declare-fun res!430626 () Bool)

(assert (=> b!662649 (=> res!430626 e!380381)))

(assert (=> b!662649 (= res!430626 (not (noDuplicate!523 lt!309070)))))

(declare-fun b!662650 () Bool)

(declare-fun e!380375 () Bool)

(assert (=> b!662650 (= e!380375 (not (contains!3276 acc!681 k0!2843)))))

(declare-fun b!662651 () Bool)

(declare-fun res!430627 () Bool)

(assert (=> b!662651 (=> res!430627 e!380381)))

(assert (=> b!662651 (= res!430627 (contains!3276 lt!309070 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662652 () Bool)

(declare-fun res!430623 () Bool)

(assert (=> b!662652 (=> (not res!430623) (not e!380379))))

(assert (=> b!662652 (= res!430623 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!662653 () Bool)

(assert (=> b!662653 (= e!380379 (not e!380377))))

(declare-fun res!430632 () Bool)

(assert (=> b!662653 (=> res!430632 e!380377)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!662653 (= res!430632 (not (validKeyInArray!0 (select (arr!18658 a!3626) from!3004))))))

(declare-fun lt!309066 () Unit!23026)

(assert (=> b!662653 (= lt!309066 e!380382)))

(declare-fun c!76376 () Bool)

(assert (=> b!662653 (= c!76376 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!662653 (arrayContainsKey!0 (array!38932 (store (arr!18658 a!3626) i!1382 k0!2843) (size!19022 a!3626)) k0!2843 from!3004)))

(declare-fun b!662654 () Bool)

(declare-fun e!380378 () Bool)

(assert (=> b!662654 (= e!380378 e!380375)))

(declare-fun res!430625 () Bool)

(assert (=> b!662654 (=> (not res!430625) (not e!380375))))

(assert (=> b!662654 (= res!430625 (bvsle from!3004 i!1382))))

(declare-fun b!662655 () Bool)

(declare-fun res!430628 () Bool)

(assert (=> b!662655 (=> res!430628 e!380381)))

(assert (=> b!662655 (= res!430628 (contains!3276 lt!309070 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662656 () Bool)

(declare-fun res!430618 () Bool)

(assert (=> b!662656 (=> (not res!430618) (not e!380379))))

(assert (=> b!662656 (= res!430618 (validKeyInArray!0 k0!2843))))

(declare-fun b!662657 () Bool)

(declare-fun res!430620 () Bool)

(assert (=> b!662657 (=> (not res!430620) (not e!380379))))

(assert (=> b!662657 (= res!430620 e!380378)))

(declare-fun res!430631 () Bool)

(assert (=> b!662657 (=> res!430631 e!380378)))

(assert (=> b!662657 (= res!430631 e!380380)))

(declare-fun res!430619 () Bool)

(assert (=> b!662657 (=> (not res!430619) (not e!380380))))

(assert (=> b!662657 (= res!430619 (bvsgt from!3004 i!1382))))

(assert (= (and start!59884 res!430633) b!662636))

(assert (= (and b!662636 res!430621) b!662647))

(assert (= (and b!662647 res!430629) b!662638))

(assert (= (and b!662638 res!430637) b!662657))

(assert (= (and b!662657 res!430619) b!662643))

(assert (= (and b!662657 (not res!430631)) b!662654))

(assert (= (and b!662654 res!430625) b!662650))

(assert (= (and b!662657 res!430620) b!662646))

(assert (= (and b!662646 res!430636) b!662652))

(assert (= (and b!662652 res!430623) b!662644))

(assert (= (and b!662644 res!430624) b!662656))

(assert (= (and b!662656 res!430618) b!662640))

(assert (= (and b!662640 res!430630) b!662641))

(assert (= (and b!662641 res!430635) b!662653))

(assert (= (and b!662653 c!76376) b!662637))

(assert (= (and b!662653 (not c!76376)) b!662645))

(assert (= (and b!662653 (not res!430632)) b!662642))

(assert (= (and b!662642 (not res!430622)) b!662649))

(assert (= (and b!662649 (not res!430626)) b!662651))

(assert (= (and b!662651 (not res!430627)) b!662655))

(assert (= (and b!662655 (not res!430628)) b!662648))

(assert (= (and b!662648 (not res!430634)) b!662639))

(declare-fun m!634421 () Bool)

(assert (=> b!662649 m!634421))

(declare-fun m!634423 () Bool)

(assert (=> b!662643 m!634423))

(declare-fun m!634425 () Bool)

(assert (=> start!59884 m!634425))

(declare-fun m!634427 () Bool)

(assert (=> b!662639 m!634427))

(declare-fun m!634429 () Bool)

(assert (=> b!662639 m!634429))

(declare-fun m!634431 () Bool)

(assert (=> b!662655 m!634431))

(declare-fun m!634433 () Bool)

(assert (=> b!662651 m!634433))

(assert (=> b!662650 m!634423))

(declare-fun m!634435 () Bool)

(assert (=> b!662642 m!634435))

(assert (=> b!662642 m!634435))

(declare-fun m!634437 () Bool)

(assert (=> b!662642 m!634437))

(declare-fun m!634439 () Bool)

(assert (=> b!662642 m!634439))

(declare-fun m!634441 () Bool)

(assert (=> b!662642 m!634441))

(declare-fun m!634443 () Bool)

(assert (=> b!662648 m!634443))

(declare-fun m!634445 () Bool)

(assert (=> b!662637 m!634445))

(declare-fun m!634447 () Bool)

(assert (=> b!662640 m!634447))

(declare-fun m!634449 () Bool)

(assert (=> b!662656 m!634449))

(declare-fun m!634451 () Bool)

(assert (=> b!662636 m!634451))

(assert (=> b!662653 m!634435))

(declare-fun m!634453 () Bool)

(assert (=> b!662653 m!634453))

(declare-fun m!634455 () Bool)

(assert (=> b!662653 m!634455))

(assert (=> b!662653 m!634435))

(declare-fun m!634457 () Bool)

(assert (=> b!662653 m!634457))

(declare-fun m!634459 () Bool)

(assert (=> b!662653 m!634459))

(declare-fun m!634461 () Bool)

(assert (=> b!662652 m!634461))

(declare-fun m!634463 () Bool)

(assert (=> b!662647 m!634463))

(declare-fun m!634465 () Bool)

(assert (=> b!662638 m!634465))

(declare-fun m!634467 () Bool)

(assert (=> b!662646 m!634467))

(check-sat (not b!662656) (not b!662637) (not b!662648) (not b!662643) (not b!662642) (not b!662639) (not b!662653) (not b!662640) (not start!59884) (not b!662638) (not b!662646) (not b!662650) (not b!662636) (not b!662655) (not b!662647) (not b!662651) (not b!662652) (not b!662649))
(check-sat)
