; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59886 () Bool)

(assert start!59886)

(declare-fun b!662702 () Bool)

(declare-fun res!430683 () Bool)

(declare-fun e!380400 () Bool)

(assert (=> b!662702 (=> (not res!430683) (not e!380400))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!662702 (= res!430683 (validKeyInArray!0 k!2843))))

(declare-fun b!662703 () Bool)

(declare-fun res!430678 () Bool)

(assert (=> b!662703 (=> (not res!430678) (not e!380400))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38933 0))(
  ( (array!38934 (arr!18659 (Array (_ BitVec 32) (_ BitVec 64))) (size!19023 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38933)

(assert (=> b!662703 (= res!430678 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19023 a!3626))))))

(declare-fun b!662704 () Bool)

(declare-fun res!430686 () Bool)

(declare-fun e!380402 () Bool)

(assert (=> b!662704 (=> res!430686 e!380402)))

(declare-datatypes ((List!12700 0))(
  ( (Nil!12697) (Cons!12696 (h!13741 (_ BitVec 64)) (t!18928 List!12700)) )
))
(declare-fun acc!681 () List!12700)

(declare-fun lt!309083 () List!12700)

(declare-fun subseq!16 (List!12700 List!12700) Bool)

(assert (=> b!662704 (= res!430686 (not (subseq!16 acc!681 lt!309083)))))

(declare-fun b!662705 () Bool)

(declare-fun res!430692 () Bool)

(assert (=> b!662705 (=> res!430692 e!380402)))

(declare-fun contains!3277 (List!12700 (_ BitVec 64)) Bool)

(assert (=> b!662705 (= res!430692 (contains!3277 lt!309083 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662706 () Bool)

(declare-fun res!430679 () Bool)

(assert (=> b!662706 (=> (not res!430679) (not e!380400))))

(declare-fun arrayNoDuplicates!0 (array!38933 (_ BitVec 32) List!12700) Bool)

(assert (=> b!662706 (= res!430679 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12697))))

(declare-fun b!662707 () Bool)

(declare-fun res!430697 () Bool)

(assert (=> b!662707 (=> res!430697 e!380402)))

(assert (=> b!662707 (= res!430697 (contains!3277 lt!309083 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662708 () Bool)

(declare-fun res!430680 () Bool)

(assert (=> b!662708 (=> (not res!430680) (not e!380400))))

(declare-fun e!380405 () Bool)

(assert (=> b!662708 (= res!430680 e!380405)))

(declare-fun res!430691 () Bool)

(assert (=> b!662708 (=> res!430691 e!380405)))

(declare-fun e!380403 () Bool)

(assert (=> b!662708 (= res!430691 e!380403)))

(declare-fun res!430694 () Bool)

(assert (=> b!662708 (=> (not res!430694) (not e!380403))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!662708 (= res!430694 (bvsgt from!3004 i!1382))))

(declare-fun b!662709 () Bool)

(declare-fun res!430695 () Bool)

(assert (=> b!662709 (=> (not res!430695) (not e!380400))))

(declare-fun noDuplicate!524 (List!12700) Bool)

(assert (=> b!662709 (= res!430695 (noDuplicate!524 acc!681))))

(declare-fun b!662710 () Bool)

(declare-fun res!430685 () Bool)

(assert (=> b!662710 (=> (not res!430685) (not e!380400))))

(assert (=> b!662710 (= res!430685 (not (contains!3277 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662711 () Bool)

(assert (=> b!662711 (= e!380403 (contains!3277 acc!681 k!2843))))

(declare-fun b!662712 () Bool)

(declare-fun res!430682 () Bool)

(assert (=> b!662712 (=> (not res!430682) (not e!380400))))

(assert (=> b!662712 (= res!430682 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19023 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!662713 () Bool)

(declare-datatypes ((Unit!23030 0))(
  ( (Unit!23031) )
))
(declare-fun e!380401 () Unit!23030)

(declare-fun Unit!23032 () Unit!23030)

(assert (=> b!662713 (= e!380401 Unit!23032)))

(declare-fun lt!309088 () Unit!23030)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38933 (_ BitVec 64) (_ BitVec 32)) Unit!23030)

(assert (=> b!662713 (= lt!309088 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!662713 false))

(declare-fun b!662714 () Bool)

(declare-fun res!430693 () Bool)

(assert (=> b!662714 (=> (not res!430693) (not e!380400))))

(declare-fun arrayContainsKey!0 (array!38933 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!662714 (= res!430693 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!662715 () Bool)

(declare-fun res!430696 () Bool)

(assert (=> b!662715 (=> res!430696 e!380402)))

(assert (=> b!662715 (= res!430696 (not (noDuplicate!524 lt!309083)))))

(declare-fun b!662716 () Bool)

(declare-fun res!430689 () Bool)

(assert (=> b!662716 (=> (not res!430689) (not e!380400))))

(assert (=> b!662716 (= res!430689 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!430688 () Bool)

(assert (=> start!59886 (=> (not res!430688) (not e!380400))))

(assert (=> start!59886 (= res!430688 (and (bvslt (size!19023 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19023 a!3626))))))

(assert (=> start!59886 e!380400))

(assert (=> start!59886 true))

(declare-fun array_inv!14455 (array!38933) Bool)

(assert (=> start!59886 (array_inv!14455 a!3626)))

(declare-fun b!662717 () Bool)

(declare-fun e!380399 () Bool)

(assert (=> b!662717 (= e!380399 (not (contains!3277 acc!681 k!2843)))))

(declare-fun b!662718 () Bool)

(declare-fun res!430690 () Bool)

(assert (=> b!662718 (=> (not res!430690) (not e!380400))))

(assert (=> b!662718 (= res!430690 (not (contains!3277 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662719 () Bool)

(declare-fun Unit!23033 () Unit!23030)

(assert (=> b!662719 (= e!380401 Unit!23033)))

(declare-fun b!662720 () Bool)

(assert (=> b!662720 (= e!380402 true)))

(declare-fun lt!309085 () Bool)

(assert (=> b!662720 (= lt!309085 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!309083))))

(declare-fun lt!309087 () Unit!23030)

(declare-fun noDuplicateSubseq!16 (List!12700 List!12700) Unit!23030)

(assert (=> b!662720 (= lt!309087 (noDuplicateSubseq!16 acc!681 lt!309083))))

(declare-fun b!662721 () Bool)

(assert (=> b!662721 (= e!380405 e!380399)))

(declare-fun res!430684 () Bool)

(assert (=> b!662721 (=> (not res!430684) (not e!380399))))

(assert (=> b!662721 (= res!430684 (bvsle from!3004 i!1382))))

(declare-fun b!662722 () Bool)

(declare-fun e!380404 () Bool)

(assert (=> b!662722 (= e!380404 e!380402)))

(declare-fun res!430681 () Bool)

(assert (=> b!662722 (=> res!430681 e!380402)))

(assert (=> b!662722 (= res!430681 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!148 (List!12700 (_ BitVec 64)) List!12700)

(assert (=> b!662722 (= lt!309083 ($colon$colon!148 acc!681 (select (arr!18659 a!3626) from!3004)))))

(assert (=> b!662722 (subseq!16 acc!681 acc!681)))

(declare-fun lt!309086 () Unit!23030)

(declare-fun lemmaListSubSeqRefl!0 (List!12700) Unit!23030)

(assert (=> b!662722 (= lt!309086 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!662723 () Bool)

(assert (=> b!662723 (= e!380400 (not e!380404))))

(declare-fun res!430687 () Bool)

(assert (=> b!662723 (=> res!430687 e!380404)))

(assert (=> b!662723 (= res!430687 (not (validKeyInArray!0 (select (arr!18659 a!3626) from!3004))))))

(declare-fun lt!309084 () Unit!23030)

(assert (=> b!662723 (= lt!309084 e!380401)))

(declare-fun c!76379 () Bool)

(assert (=> b!662723 (= c!76379 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!662723 (arrayContainsKey!0 (array!38934 (store (arr!18659 a!3626) i!1382 k!2843) (size!19023 a!3626)) k!2843 from!3004)))

(assert (= (and start!59886 res!430688) b!662709))

(assert (= (and b!662709 res!430695) b!662710))

(assert (= (and b!662710 res!430685) b!662718))

(assert (= (and b!662718 res!430690) b!662708))

(assert (= (and b!662708 res!430694) b!662711))

(assert (= (and b!662708 (not res!430691)) b!662721))

(assert (= (and b!662721 res!430684) b!662717))

(assert (= (and b!662708 res!430680) b!662706))

(assert (= (and b!662706 res!430679) b!662716))

(assert (= (and b!662716 res!430689) b!662703))

(assert (= (and b!662703 res!430678) b!662702))

(assert (= (and b!662702 res!430683) b!662714))

(assert (= (and b!662714 res!430693) b!662712))

(assert (= (and b!662712 res!430682) b!662723))

(assert (= (and b!662723 c!76379) b!662713))

(assert (= (and b!662723 (not c!76379)) b!662719))

(assert (= (and b!662723 (not res!430687)) b!662722))

(assert (= (and b!662722 (not res!430681)) b!662715))

(assert (= (and b!662715 (not res!430696)) b!662705))

(assert (= (and b!662705 (not res!430692)) b!662707))

(assert (= (and b!662707 (not res!430697)) b!662704))

(assert (= (and b!662704 (not res!430686)) b!662720))

(declare-fun m!634469 () Bool)

(assert (=> b!662711 m!634469))

(declare-fun m!634471 () Bool)

(assert (=> b!662707 m!634471))

(declare-fun m!634473 () Bool)

(assert (=> b!662714 m!634473))

(declare-fun m!634475 () Bool)

(assert (=> b!662715 m!634475))

(declare-fun m!634477 () Bool)

(assert (=> b!662709 m!634477))

(assert (=> b!662717 m!634469))

(declare-fun m!634479 () Bool)

(assert (=> b!662702 m!634479))

(declare-fun m!634481 () Bool)

(assert (=> b!662705 m!634481))

(declare-fun m!634483 () Bool)

(assert (=> b!662722 m!634483))

(assert (=> b!662722 m!634483))

(declare-fun m!634485 () Bool)

(assert (=> b!662722 m!634485))

(declare-fun m!634487 () Bool)

(assert (=> b!662722 m!634487))

(declare-fun m!634489 () Bool)

(assert (=> b!662722 m!634489))

(declare-fun m!634491 () Bool)

(assert (=> b!662713 m!634491))

(declare-fun m!634493 () Bool)

(assert (=> b!662704 m!634493))

(declare-fun m!634495 () Bool)

(assert (=> b!662720 m!634495))

(declare-fun m!634497 () Bool)

(assert (=> b!662720 m!634497))

(assert (=> b!662723 m!634483))

(declare-fun m!634499 () Bool)

(assert (=> b!662723 m!634499))

(declare-fun m!634501 () Bool)

(assert (=> b!662723 m!634501))

(assert (=> b!662723 m!634483))

(declare-fun m!634503 () Bool)

(assert (=> b!662723 m!634503))

(declare-fun m!634505 () Bool)

(assert (=> b!662723 m!634505))

(declare-fun m!634507 () Bool)

(assert (=> b!662716 m!634507))

(declare-fun m!634509 () Bool)

(assert (=> start!59886 m!634509))

(declare-fun m!634511 () Bool)

(assert (=> b!662718 m!634511))

(declare-fun m!634513 () Bool)

(assert (=> b!662710 m!634513))

(declare-fun m!634515 () Bool)

(assert (=> b!662706 m!634515))

(push 1)

