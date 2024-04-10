; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60256 () Bool)

(assert start!60256)

(declare-fun b!675514 () Bool)

(declare-fun res!441955 () Bool)

(declare-fun e!385415 () Bool)

(assert (=> b!675514 (=> (not res!441955) (not e!385415))))

(declare-datatypes ((List!12885 0))(
  ( (Nil!12882) (Cons!12881 (h!13926 (_ BitVec 64)) (t!19113 List!12885)) )
))
(declare-fun acc!681 () List!12885)

(declare-fun noDuplicate!709 (List!12885) Bool)

(assert (=> b!675514 (= res!441955 (noDuplicate!709 acc!681))))

(declare-fun b!675516 () Bool)

(declare-fun res!441957 () Bool)

(assert (=> b!675516 (=> (not res!441957) (not e!385415))))

(declare-fun e!385421 () Bool)

(assert (=> b!675516 (= res!441957 e!385421)))

(declare-fun res!441941 () Bool)

(assert (=> b!675516 (=> res!441941 e!385421)))

(declare-fun e!385417 () Bool)

(assert (=> b!675516 (= res!441941 e!385417)))

(declare-fun res!441940 () Bool)

(assert (=> b!675516 (=> (not res!441940) (not e!385417))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!675516 (= res!441940 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675517 () Bool)

(assert (=> b!675517 (= e!385415 false)))

(declare-datatypes ((array!39303 0))(
  ( (array!39304 (arr!18844 (Array (_ BitVec 32) (_ BitVec 64))) (size!19208 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39303)

(declare-fun lt!312730 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39303 (_ BitVec 32) List!12885) Bool)

(assert (=> b!675517 (= lt!312730 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!675518 () Bool)

(declare-fun res!441958 () Bool)

(assert (=> b!675518 (=> (not res!441958) (not e!385415))))

(declare-fun contains!3462 (List!12885 (_ BitVec 64)) Bool)

(assert (=> b!675518 (= res!441958 (not (contains!3462 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675519 () Bool)

(declare-fun res!441948 () Bool)

(assert (=> b!675519 (=> (not res!441948) (not e!385415))))

(assert (=> b!675519 (= res!441948 (not (contains!3462 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675520 () Bool)

(declare-fun e!385420 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!675520 (= e!385420 (not (contains!3462 acc!681 k0!2843)))))

(declare-fun b!675521 () Bool)

(assert (=> b!675521 (= e!385417 (contains!3462 acc!681 k0!2843))))

(declare-fun b!675522 () Bool)

(declare-fun res!441954 () Bool)

(assert (=> b!675522 (=> (not res!441954) (not e!385415))))

(assert (=> b!675522 (= res!441954 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19208 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!675523 () Bool)

(declare-fun res!441950 () Bool)

(assert (=> b!675523 (=> (not res!441950) (not e!385415))))

(assert (=> b!675523 (= res!441950 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!675524 () Bool)

(declare-fun e!385416 () Bool)

(assert (=> b!675524 (= e!385416 (contains!3462 acc!681 k0!2843))))

(declare-fun b!675525 () Bool)

(declare-fun res!441952 () Bool)

(assert (=> b!675525 (=> (not res!441952) (not e!385415))))

(declare-fun arrayContainsKey!0 (array!39303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!675525 (= res!441952 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!675526 () Bool)

(declare-fun res!441943 () Bool)

(assert (=> b!675526 (=> (not res!441943) (not e!385415))))

(assert (=> b!675526 (= res!441943 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12882))))

(declare-fun b!675527 () Bool)

(declare-fun res!441949 () Bool)

(assert (=> b!675527 (=> (not res!441949) (not e!385415))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!675527 (= res!441949 (not (validKeyInArray!0 (select (arr!18844 a!3626) from!3004))))))

(declare-fun res!441945 () Bool)

(assert (=> start!60256 (=> (not res!441945) (not e!385415))))

(assert (=> start!60256 (= res!441945 (and (bvslt (size!19208 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19208 a!3626))))))

(assert (=> start!60256 e!385415))

(assert (=> start!60256 true))

(declare-fun array_inv!14640 (array!39303) Bool)

(assert (=> start!60256 (array_inv!14640 a!3626)))

(declare-fun b!675515 () Bool)

(declare-fun e!385422 () Bool)

(assert (=> b!675515 (= e!385422 (not (contains!3462 acc!681 k0!2843)))))

(declare-fun b!675528 () Bool)

(declare-fun res!441942 () Bool)

(assert (=> b!675528 (=> (not res!441942) (not e!385415))))

(assert (=> b!675528 (= res!441942 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19208 a!3626))))))

(declare-fun b!675529 () Bool)

(declare-fun res!441953 () Bool)

(assert (=> b!675529 (=> (not res!441953) (not e!385415))))

(assert (=> b!675529 (= res!441953 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!675530 () Bool)

(declare-fun res!441956 () Bool)

(assert (=> b!675530 (=> (not res!441956) (not e!385415))))

(declare-fun e!385419 () Bool)

(assert (=> b!675530 (= res!441956 e!385419)))

(declare-fun res!441946 () Bool)

(assert (=> b!675530 (=> res!441946 e!385419)))

(assert (=> b!675530 (= res!441946 e!385416)))

(declare-fun res!441951 () Bool)

(assert (=> b!675530 (=> (not res!441951) (not e!385416))))

(assert (=> b!675530 (= res!441951 (bvsgt from!3004 i!1382))))

(declare-fun b!675531 () Bool)

(assert (=> b!675531 (= e!385419 e!385422)))

(declare-fun res!441947 () Bool)

(assert (=> b!675531 (=> (not res!441947) (not e!385422))))

(assert (=> b!675531 (= res!441947 (bvsle from!3004 i!1382))))

(declare-fun b!675532 () Bool)

(declare-fun res!441959 () Bool)

(assert (=> b!675532 (=> (not res!441959) (not e!385415))))

(assert (=> b!675532 (= res!441959 (validKeyInArray!0 k0!2843))))

(declare-fun b!675533 () Bool)

(assert (=> b!675533 (= e!385421 e!385420)))

(declare-fun res!441944 () Bool)

(assert (=> b!675533 (=> (not res!441944) (not e!385420))))

(assert (=> b!675533 (= res!441944 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!60256 res!441945) b!675514))

(assert (= (and b!675514 res!441955) b!675519))

(assert (= (and b!675519 res!441948) b!675518))

(assert (= (and b!675518 res!441958) b!675530))

(assert (= (and b!675530 res!441951) b!675524))

(assert (= (and b!675530 (not res!441946)) b!675531))

(assert (= (and b!675531 res!441947) b!675515))

(assert (= (and b!675530 res!441956) b!675526))

(assert (= (and b!675526 res!441943) b!675529))

(assert (= (and b!675529 res!441953) b!675528))

(assert (= (and b!675528 res!441942) b!675532))

(assert (= (and b!675532 res!441959) b!675525))

(assert (= (and b!675525 res!441952) b!675522))

(assert (= (and b!675522 res!441954) b!675527))

(assert (= (and b!675527 res!441949) b!675523))

(assert (= (and b!675523 res!441950) b!675516))

(assert (= (and b!675516 res!441940) b!675521))

(assert (= (and b!675516 (not res!441941)) b!675533))

(assert (= (and b!675533 res!441944) b!675520))

(assert (= (and b!675516 res!441957) b!675517))

(declare-fun m!642923 () Bool)

(assert (=> b!675521 m!642923))

(declare-fun m!642925 () Bool)

(assert (=> b!675517 m!642925))

(declare-fun m!642927 () Bool)

(assert (=> b!675518 m!642927))

(declare-fun m!642929 () Bool)

(assert (=> start!60256 m!642929))

(declare-fun m!642931 () Bool)

(assert (=> b!675514 m!642931))

(declare-fun m!642933 () Bool)

(assert (=> b!675525 m!642933))

(declare-fun m!642935 () Bool)

(assert (=> b!675532 m!642935))

(assert (=> b!675515 m!642923))

(declare-fun m!642937 () Bool)

(assert (=> b!675526 m!642937))

(declare-fun m!642939 () Bool)

(assert (=> b!675519 m!642939))

(declare-fun m!642941 () Bool)

(assert (=> b!675527 m!642941))

(assert (=> b!675527 m!642941))

(declare-fun m!642943 () Bool)

(assert (=> b!675527 m!642943))

(declare-fun m!642945 () Bool)

(assert (=> b!675529 m!642945))

(assert (=> b!675520 m!642923))

(assert (=> b!675524 m!642923))

(check-sat (not b!675517) (not b!675520) (not b!675524) (not b!675529) (not b!675525) (not b!675526) (not b!675527) (not b!675514) (not b!675515) (not b!675519) (not b!675521) (not b!675518) (not b!675532) (not start!60256))
