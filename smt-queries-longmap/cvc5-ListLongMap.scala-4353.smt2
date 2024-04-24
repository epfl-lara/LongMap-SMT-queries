; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60208 () Bool)

(assert start!60208)

(declare-fun b!671716 () Bool)

(declare-fun res!438309 () Bool)

(declare-fun e!383885 () Bool)

(assert (=> b!671716 (=> (not res!438309) (not e!383885))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39193 0))(
  ( (array!39194 (arr!18786 (Array (_ BitVec 32) (_ BitVec 64))) (size!19150 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39193)

(assert (=> b!671716 (= res!438309 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19150 a!3626))))))

(declare-fun b!671717 () Bool)

(declare-fun res!438302 () Bool)

(assert (=> b!671717 (=> (not res!438302) (not e!383885))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!671717 (= res!438302 (validKeyInArray!0 (select (arr!18786 a!3626) from!3004)))))

(declare-fun b!671718 () Bool)

(declare-fun res!438314 () Bool)

(assert (=> b!671718 (=> (not res!438314) (not e!383885))))

(declare-datatypes ((List!12734 0))(
  ( (Nil!12731) (Cons!12730 (h!13778 (_ BitVec 64)) (t!18954 List!12734)) )
))
(declare-fun acc!681 () List!12734)

(declare-fun contains!3386 (List!12734 (_ BitVec 64)) Bool)

(assert (=> b!671718 (= res!438314 (not (contains!3386 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671719 () Bool)

(declare-fun res!438310 () Bool)

(assert (=> b!671719 (=> (not res!438310) (not e!383885))))

(assert (=> b!671719 (= res!438310 (not (contains!3386 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671720 () Bool)

(declare-fun e!383884 () Bool)

(declare-fun e!383882 () Bool)

(assert (=> b!671720 (= e!383884 e!383882)))

(declare-fun res!438306 () Bool)

(assert (=> b!671720 (=> (not res!438306) (not e!383882))))

(assert (=> b!671720 (= res!438306 (bvsle from!3004 i!1382))))

(declare-fun b!671721 () Bool)

(declare-fun res!438304 () Bool)

(assert (=> b!671721 (=> (not res!438304) (not e!383885))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!671721 (= res!438304 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!671722 () Bool)

(declare-fun e!383883 () Bool)

(assert (=> b!671722 (= e!383883 (contains!3386 acc!681 k!2843))))

(declare-fun b!671723 () Bool)

(declare-fun res!438316 () Bool)

(assert (=> b!671723 (=> (not res!438316) (not e!383885))))

(assert (=> b!671723 (= res!438316 (= (select (arr!18786 a!3626) from!3004) k!2843))))

(declare-fun b!671724 () Bool)

(declare-fun res!438311 () Bool)

(assert (=> b!671724 (=> (not res!438311) (not e!383885))))

(declare-fun noDuplicate!660 (List!12734) Bool)

(assert (=> b!671724 (= res!438311 (noDuplicate!660 acc!681))))

(declare-fun b!671725 () Bool)

(declare-fun res!438313 () Bool)

(assert (=> b!671725 (=> (not res!438313) (not e!383885))))

(assert (=> b!671725 (= res!438313 e!383884)))

(declare-fun res!438303 () Bool)

(assert (=> b!671725 (=> res!438303 e!383884)))

(assert (=> b!671725 (= res!438303 e!383883)))

(declare-fun res!438305 () Bool)

(assert (=> b!671725 (=> (not res!438305) (not e!383883))))

(assert (=> b!671725 (= res!438305 (bvsgt from!3004 i!1382))))

(declare-fun b!671726 () Bool)

(declare-fun res!438315 () Bool)

(assert (=> b!671726 (=> (not res!438315) (not e!383885))))

(declare-fun arrayNoDuplicates!0 (array!39193 (_ BitVec 32) List!12734) Bool)

(assert (=> b!671726 (= res!438315 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12731))))

(declare-fun b!671727 () Bool)

(declare-fun res!438308 () Bool)

(assert (=> b!671727 (=> (not res!438308) (not e!383885))))

(assert (=> b!671727 (= res!438308 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19150 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun res!438312 () Bool)

(assert (=> start!60208 (=> (not res!438312) (not e!383885))))

(assert (=> start!60208 (= res!438312 (and (bvslt (size!19150 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19150 a!3626))))))

(assert (=> start!60208 e!383885))

(assert (=> start!60208 true))

(declare-fun array_inv!14645 (array!39193) Bool)

(assert (=> start!60208 (array_inv!14645 a!3626)))

(declare-fun b!671728 () Bool)

(assert (=> b!671728 (= e!383885 (not true))))

(assert (=> b!671728 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun b!671729 () Bool)

(declare-fun res!438301 () Bool)

(assert (=> b!671729 (=> (not res!438301) (not e!383885))))

(assert (=> b!671729 (= res!438301 (validKeyInArray!0 k!2843))))

(declare-fun b!671730 () Bool)

(assert (=> b!671730 (= e!383882 (not (contains!3386 acc!681 k!2843)))))

(declare-fun b!671731 () Bool)

(declare-fun res!438307 () Bool)

(assert (=> b!671731 (=> (not res!438307) (not e!383885))))

(assert (=> b!671731 (= res!438307 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!60208 res!438312) b!671724))

(assert (= (and b!671724 res!438311) b!671719))

(assert (= (and b!671719 res!438310) b!671718))

(assert (= (and b!671718 res!438314) b!671725))

(assert (= (and b!671725 res!438305) b!671722))

(assert (= (and b!671725 (not res!438303)) b!671720))

(assert (= (and b!671720 res!438306) b!671730))

(assert (= (and b!671725 res!438313) b!671726))

(assert (= (and b!671726 res!438315) b!671731))

(assert (= (and b!671731 res!438307) b!671716))

(assert (= (and b!671716 res!438309) b!671729))

(assert (= (and b!671729 res!438301) b!671721))

(assert (= (and b!671721 res!438304) b!671727))

(assert (= (and b!671727 res!438308) b!671717))

(assert (= (and b!671717 res!438302) b!671723))

(assert (= (and b!671723 res!438316) b!671728))

(declare-fun m!641647 () Bool)

(assert (=> b!671718 m!641647))

(declare-fun m!641649 () Bool)

(assert (=> b!671717 m!641649))

(assert (=> b!671717 m!641649))

(declare-fun m!641651 () Bool)

(assert (=> b!671717 m!641651))

(declare-fun m!641653 () Bool)

(assert (=> b!671724 m!641653))

(declare-fun m!641655 () Bool)

(assert (=> b!671722 m!641655))

(declare-fun m!641657 () Bool)

(assert (=> start!60208 m!641657))

(assert (=> b!671730 m!641655))

(declare-fun m!641659 () Bool)

(assert (=> b!671719 m!641659))

(assert (=> b!671723 m!641649))

(declare-fun m!641661 () Bool)

(assert (=> b!671729 m!641661))

(declare-fun m!641663 () Bool)

(assert (=> b!671728 m!641663))

(declare-fun m!641665 () Bool)

(assert (=> b!671726 m!641665))

(declare-fun m!641667 () Bool)

(assert (=> b!671721 m!641667))

(declare-fun m!641669 () Bool)

(assert (=> b!671731 m!641669))

(push 1)

(assert (not b!671721))

(assert (not start!60208))

(assert (not b!671724))

(assert (not b!671718))

(assert (not b!671719))

(assert (not b!671729))

(assert (not b!671730))

(assert (not b!671717))

(assert (not b!671722))

(assert (not b!671728))

(assert (not b!671726))

(assert (not b!671731))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

