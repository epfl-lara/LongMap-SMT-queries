; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60292 () Bool)

(assert start!60292)

(declare-fun b!676658 () Bool)

(declare-fun res!443252 () Bool)

(declare-fun e!385802 () Bool)

(assert (=> b!676658 (=> (not res!443252) (not e!385802))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39350 0))(
  ( (array!39351 (arr!18867 (Array (_ BitVec 32) (_ BitVec 64))) (size!19232 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39350)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!676658 (= res!443252 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19232 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!676659 () Bool)

(declare-fun res!443258 () Bool)

(assert (=> b!676659 (=> (not res!443258) (not e!385802))))

(declare-fun e!385806 () Bool)

(assert (=> b!676659 (= res!443258 e!385806)))

(declare-fun res!443249 () Bool)

(assert (=> b!676659 (=> res!443249 e!385806)))

(declare-fun e!385804 () Bool)

(assert (=> b!676659 (= res!443249 e!385804)))

(declare-fun res!443262 () Bool)

(assert (=> b!676659 (=> (not res!443262) (not e!385804))))

(assert (=> b!676659 (= res!443262 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676660 () Bool)

(declare-fun res!443259 () Bool)

(assert (=> b!676660 (=> (not res!443259) (not e!385802))))

(declare-datatypes ((List!12947 0))(
  ( (Nil!12944) (Cons!12943 (h!13988 (_ BitVec 64)) (t!19166 List!12947)) )
))
(declare-fun acc!681 () List!12947)

(declare-fun noDuplicate!738 (List!12947) Bool)

(assert (=> b!676660 (= res!443259 (noDuplicate!738 acc!681))))

(declare-fun b!676661 () Bool)

(declare-fun res!443244 () Bool)

(assert (=> b!676661 (=> (not res!443244) (not e!385802))))

(declare-fun arrayNoDuplicates!0 (array!39350 (_ BitVec 32) List!12947) Bool)

(assert (=> b!676661 (= res!443244 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12944))))

(declare-fun b!676662 () Bool)

(declare-fun res!443256 () Bool)

(assert (=> b!676662 (=> (not res!443256) (not e!385802))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39350 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!676662 (= res!443256 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!676663 () Bool)

(declare-fun res!443261 () Bool)

(assert (=> b!676663 (=> (not res!443261) (not e!385802))))

(declare-fun e!385803 () Bool)

(assert (=> b!676663 (= res!443261 e!385803)))

(declare-fun res!443254 () Bool)

(assert (=> b!676663 (=> res!443254 e!385803)))

(declare-fun e!385807 () Bool)

(assert (=> b!676663 (= res!443254 e!385807)))

(declare-fun res!443250 () Bool)

(assert (=> b!676663 (=> (not res!443250) (not e!385807))))

(assert (=> b!676663 (= res!443250 (bvsgt from!3004 i!1382))))

(declare-fun b!676664 () Bool)

(declare-fun res!443257 () Bool)

(assert (=> b!676664 (=> (not res!443257) (not e!385802))))

(declare-fun contains!3469 (List!12947 (_ BitVec 64)) Bool)

(assert (=> b!676664 (= res!443257 (not (contains!3469 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676665 () Bool)

(assert (=> b!676665 (= e!385802 false)))

(declare-fun lt!312546 () Bool)

(assert (=> b!676665 (= lt!312546 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!676666 () Bool)

(declare-fun e!385801 () Bool)

(assert (=> b!676666 (= e!385806 e!385801)))

(declare-fun res!443247 () Bool)

(assert (=> b!676666 (=> (not res!443247) (not e!385801))))

(assert (=> b!676666 (= res!443247 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676667 () Bool)

(declare-fun res!443251 () Bool)

(assert (=> b!676667 (=> (not res!443251) (not e!385802))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!676667 (= res!443251 (validKeyInArray!0 k!2843))))

(declare-fun b!676668 () Bool)

(declare-fun e!385805 () Bool)

(assert (=> b!676668 (= e!385805 (not (contains!3469 acc!681 k!2843)))))

(declare-fun b!676669 () Bool)

(declare-fun res!443263 () Bool)

(assert (=> b!676669 (=> (not res!443263) (not e!385802))))

(assert (=> b!676669 (= res!443263 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19232 a!3626))))))

(declare-fun b!676670 () Bool)

(assert (=> b!676670 (= e!385804 (contains!3469 acc!681 k!2843))))

(declare-fun res!443245 () Bool)

(assert (=> start!60292 (=> (not res!443245) (not e!385802))))

(assert (=> start!60292 (= res!443245 (and (bvslt (size!19232 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19232 a!3626))))))

(assert (=> start!60292 e!385802))

(assert (=> start!60292 true))

(declare-fun array_inv!14750 (array!39350) Bool)

(assert (=> start!60292 (array_inv!14750 a!3626)))

(declare-fun b!676671 () Bool)

(declare-fun res!443248 () Bool)

(assert (=> b!676671 (=> (not res!443248) (not e!385802))))

(assert (=> b!676671 (= res!443248 (not (contains!3469 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676672 () Bool)

(assert (=> b!676672 (= e!385801 (not (contains!3469 acc!681 k!2843)))))

(declare-fun b!676673 () Bool)

(assert (=> b!676673 (= e!385803 e!385805)))

(declare-fun res!443255 () Bool)

(assert (=> b!676673 (=> (not res!443255) (not e!385805))))

(assert (=> b!676673 (= res!443255 (bvsle from!3004 i!1382))))

(declare-fun b!676674 () Bool)

(declare-fun res!443246 () Bool)

(assert (=> b!676674 (=> (not res!443246) (not e!385802))))

(assert (=> b!676674 (= res!443246 (not (validKeyInArray!0 (select (arr!18867 a!3626) from!3004))))))

(declare-fun b!676675 () Bool)

(declare-fun res!443253 () Bool)

(assert (=> b!676675 (=> (not res!443253) (not e!385802))))

(assert (=> b!676675 (= res!443253 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!676676 () Bool)

(assert (=> b!676676 (= e!385807 (contains!3469 acc!681 k!2843))))

(declare-fun b!676677 () Bool)

(declare-fun res!443260 () Bool)

(assert (=> b!676677 (=> (not res!443260) (not e!385802))))

(assert (=> b!676677 (= res!443260 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (= (and start!60292 res!443245) b!676660))

(assert (= (and b!676660 res!443259) b!676671))

(assert (= (and b!676671 res!443248) b!676664))

(assert (= (and b!676664 res!443257) b!676663))

(assert (= (and b!676663 res!443250) b!676676))

(assert (= (and b!676663 (not res!443254)) b!676673))

(assert (= (and b!676673 res!443255) b!676668))

(assert (= (and b!676663 res!443261) b!676661))

(assert (= (and b!676661 res!443244) b!676675))

(assert (= (and b!676675 res!443253) b!676669))

(assert (= (and b!676669 res!443263) b!676667))

(assert (= (and b!676667 res!443251) b!676662))

(assert (= (and b!676662 res!443256) b!676658))

(assert (= (and b!676658 res!443252) b!676674))

(assert (= (and b!676674 res!443246) b!676677))

(assert (= (and b!676677 res!443260) b!676659))

(assert (= (and b!676659 res!443262) b!676670))

(assert (= (and b!676659 (not res!443249)) b!676666))

(assert (= (and b!676666 res!443247) b!676672))

(assert (= (and b!676659 res!443258) b!676665))

(declare-fun m!642717 () Bool)

(assert (=> b!676670 m!642717))

(assert (=> b!676676 m!642717))

(declare-fun m!642719 () Bool)

(assert (=> b!676660 m!642719))

(declare-fun m!642721 () Bool)

(assert (=> b!676661 m!642721))

(declare-fun m!642723 () Bool)

(assert (=> b!676674 m!642723))

(assert (=> b!676674 m!642723))

(declare-fun m!642725 () Bool)

(assert (=> b!676674 m!642725))

(declare-fun m!642727 () Bool)

(assert (=> b!676675 m!642727))

(assert (=> b!676668 m!642717))

(declare-fun m!642729 () Bool)

(assert (=> b!676671 m!642729))

(declare-fun m!642731 () Bool)

(assert (=> b!676662 m!642731))

(declare-fun m!642733 () Bool)

(assert (=> start!60292 m!642733))

(declare-fun m!642735 () Bool)

(assert (=> b!676665 m!642735))

(declare-fun m!642737 () Bool)

(assert (=> b!676667 m!642737))

(declare-fun m!642739 () Bool)

(assert (=> b!676664 m!642739))

(assert (=> b!676672 m!642717))

(push 1)

(assert (not b!676667))

(assert (not b!676670))

(assert (not b!676662))

(assert (not b!676668))

(assert (not b!676672))

(assert (not b!676676))

(assert (not b!676665))

(assert (not b!676661))

(assert (not b!676671))

(assert (not start!60292))

(assert (not b!676664))

(assert (not b!676674))

(assert (not b!676675))

(assert (not b!676660))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

