; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59850 () Bool)

(assert start!59850)

(declare-fun b!661594 () Bool)

(declare-fun res!429662 () Bool)

(declare-fun e!379999 () Bool)

(assert (=> b!661594 (=> (not res!429662) (not e!379999))))

(declare-datatypes ((List!12682 0))(
  ( (Nil!12679) (Cons!12678 (h!13723 (_ BitVec 64)) (t!18910 List!12682)) )
))
(declare-fun acc!681 () List!12682)

(declare-fun noDuplicate!506 (List!12682) Bool)

(assert (=> b!661594 (= res!429662 (noDuplicate!506 acc!681))))

(declare-fun b!661595 () Bool)

(declare-fun res!429670 () Bool)

(assert (=> b!661595 (=> (not res!429670) (not e!379999))))

(declare-fun e!380001 () Bool)

(assert (=> b!661595 (= res!429670 e!380001)))

(declare-fun res!429660 () Bool)

(assert (=> b!661595 (=> res!429660 e!380001)))

(declare-fun e!379997 () Bool)

(assert (=> b!661595 (= res!429660 e!379997)))

(declare-fun res!429667 () Bool)

(assert (=> b!661595 (=> (not res!429667) (not e!379997))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!661595 (= res!429667 (bvsgt from!3004 i!1382))))

(declare-fun res!429663 () Bool)

(assert (=> start!59850 (=> (not res!429663) (not e!379999))))

(declare-datatypes ((array!38897 0))(
  ( (array!38898 (arr!18641 (Array (_ BitVec 32) (_ BitVec 64))) (size!19005 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38897)

(assert (=> start!59850 (= res!429663 (and (bvslt (size!19005 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19005 a!3626))))))

(assert (=> start!59850 e!379999))

(assert (=> start!59850 true))

(declare-fun array_inv!14437 (array!38897) Bool)

(assert (=> start!59850 (array_inv!14437 a!3626)))

(declare-fun b!661596 () Bool)

(declare-fun res!429666 () Bool)

(assert (=> b!661596 (=> (not res!429666) (not e!379999))))

(declare-fun arrayNoDuplicates!0 (array!38897 (_ BitVec 32) List!12682) Bool)

(assert (=> b!661596 (= res!429666 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12679))))

(declare-fun b!661597 () Bool)

(declare-fun res!429668 () Bool)

(assert (=> b!661597 (=> (not res!429668) (not e!379999))))

(assert (=> b!661597 (= res!429668 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19005 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661598 () Bool)

(assert (=> b!661598 (= e!379999 (not true))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661598 (arrayContainsKey!0 (array!38898 (store (arr!18641 a!3626) i!1382 k!2843) (size!19005 a!3626)) k!2843 from!3004)))

(declare-fun b!661599 () Bool)

(declare-fun e!380000 () Bool)

(assert (=> b!661599 (= e!380001 e!380000)))

(declare-fun res!429665 () Bool)

(assert (=> b!661599 (=> (not res!429665) (not e!380000))))

(assert (=> b!661599 (= res!429665 (bvsle from!3004 i!1382))))

(declare-fun b!661600 () Bool)

(declare-fun res!429664 () Bool)

(assert (=> b!661600 (=> (not res!429664) (not e!379999))))

(declare-fun contains!3259 (List!12682 (_ BitVec 64)) Bool)

(assert (=> b!661600 (= res!429664 (not (contains!3259 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661601 () Bool)

(declare-fun res!429671 () Bool)

(assert (=> b!661601 (=> (not res!429671) (not e!379999))))

(assert (=> b!661601 (= res!429671 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19005 a!3626))))))

(declare-fun b!661602 () Bool)

(assert (=> b!661602 (= e!380000 (not (contains!3259 acc!681 k!2843)))))

(declare-fun b!661603 () Bool)

(declare-fun res!429669 () Bool)

(assert (=> b!661603 (=> (not res!429669) (not e!379999))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661603 (= res!429669 (validKeyInArray!0 k!2843))))

(declare-fun b!661604 () Bool)

(assert (=> b!661604 (= e!379997 (contains!3259 acc!681 k!2843))))

(declare-fun b!661605 () Bool)

(declare-fun res!429658 () Bool)

(assert (=> b!661605 (=> (not res!429658) (not e!379999))))

(assert (=> b!661605 (= res!429658 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!661606 () Bool)

(declare-fun res!429659 () Bool)

(assert (=> b!661606 (=> (not res!429659) (not e!379999))))

(assert (=> b!661606 (= res!429659 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661607 () Bool)

(declare-fun res!429661 () Bool)

(assert (=> b!661607 (=> (not res!429661) (not e!379999))))

(assert (=> b!661607 (= res!429661 (not (contains!3259 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59850 res!429663) b!661594))

(assert (= (and b!661594 res!429662) b!661600))

(assert (= (and b!661600 res!429664) b!661607))

(assert (= (and b!661607 res!429661) b!661595))

(assert (= (and b!661595 res!429667) b!661604))

(assert (= (and b!661595 (not res!429660)) b!661599))

(assert (= (and b!661599 res!429665) b!661602))

(assert (= (and b!661595 res!429670) b!661596))

(assert (= (and b!661596 res!429666) b!661606))

(assert (= (and b!661606 res!429659) b!661601))

(assert (= (and b!661601 res!429671) b!661603))

(assert (= (and b!661603 res!429669) b!661605))

(assert (= (and b!661605 res!429658) b!661597))

(assert (= (and b!661597 res!429668) b!661598))

(declare-fun m!633709 () Bool)

(assert (=> b!661605 m!633709))

(declare-fun m!633711 () Bool)

(assert (=> b!661600 m!633711))

(declare-fun m!633713 () Bool)

(assert (=> start!59850 m!633713))

(declare-fun m!633715 () Bool)

(assert (=> b!661607 m!633715))

(declare-fun m!633717 () Bool)

(assert (=> b!661606 m!633717))

(declare-fun m!633719 () Bool)

(assert (=> b!661604 m!633719))

(declare-fun m!633721 () Bool)

(assert (=> b!661594 m!633721))

(assert (=> b!661602 m!633719))

(declare-fun m!633723 () Bool)

(assert (=> b!661598 m!633723))

(declare-fun m!633725 () Bool)

(assert (=> b!661598 m!633725))

(declare-fun m!633727 () Bool)

(assert (=> b!661596 m!633727))

(declare-fun m!633729 () Bool)

(assert (=> b!661603 m!633729))

(push 1)

(assert (not b!661607))

(assert (not start!59850))

(assert (not b!661600))

(assert (not b!661602))

(assert (not b!661598))

(assert (not b!661604))

(assert (not b!661606))

(assert (not b!661596))

(assert (not b!661594))

(assert (not b!661605))

(assert (not b!661603))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

