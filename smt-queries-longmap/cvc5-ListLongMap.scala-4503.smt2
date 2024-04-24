; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62546 () Bool)

(assert start!62546)

(declare-fun b!703625 () Bool)

(declare-fun res!467340 () Bool)

(declare-fun e!397725 () Bool)

(assert (=> b!703625 (=> (not res!467340) (not e!397725))))

(declare-datatypes ((array!40165 0))(
  ( (array!40166 (arr!19236 (Array (_ BitVec 32) (_ BitVec 64))) (size!19619 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40165)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!703625 (= res!467340 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!703626 () Bool)

(declare-fun res!467353 () Bool)

(assert (=> b!703626 (=> (not res!467353) (not e!397725))))

(declare-datatypes ((List!13184 0))(
  ( (Nil!13181) (Cons!13180 (h!14228 (_ BitVec 64)) (t!19458 List!13184)) )
))
(declare-fun acc!652 () List!13184)

(declare-fun contains!3836 (List!13184 (_ BitVec 64)) Bool)

(assert (=> b!703626 (= res!467353 (not (contains!3836 acc!652 k!2824)))))

(declare-fun res!467343 () Bool)

(assert (=> start!62546 (=> (not res!467343) (not e!397725))))

(assert (=> start!62546 (= res!467343 (and (bvslt (size!19619 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19619 a!3591))))))

(assert (=> start!62546 e!397725))

(assert (=> start!62546 true))

(declare-fun array_inv!15095 (array!40165) Bool)

(assert (=> start!62546 (array_inv!15095 a!3591)))

(declare-fun b!703627 () Bool)

(declare-fun res!467347 () Bool)

(assert (=> b!703627 (=> (not res!467347) (not e!397725))))

(declare-fun newAcc!49 () List!13184)

(assert (=> b!703627 (= res!467347 (contains!3836 newAcc!49 k!2824))))

(declare-fun b!703628 () Bool)

(declare-fun res!467352 () Bool)

(assert (=> b!703628 (=> (not res!467352) (not e!397725))))

(declare-fun noDuplicate!1110 (List!13184) Bool)

(assert (=> b!703628 (= res!467352 (noDuplicate!1110 newAcc!49))))

(declare-fun b!703629 () Bool)

(declare-fun res!467341 () Bool)

(assert (=> b!703629 (=> (not res!467341) (not e!397725))))

(assert (=> b!703629 (= res!467341 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!703630 () Bool)

(declare-fun res!467350 () Bool)

(assert (=> b!703630 (=> (not res!467350) (not e!397725))))

(declare-fun -!268 (List!13184 (_ BitVec 64)) List!13184)

(assert (=> b!703630 (= res!467350 (= (-!268 newAcc!49 k!2824) acc!652))))

(declare-fun b!703631 () Bool)

(declare-fun res!467351 () Bool)

(assert (=> b!703631 (=> (not res!467351) (not e!397725))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!703631 (= res!467351 (validKeyInArray!0 k!2824))))

(declare-fun b!703632 () Bool)

(declare-fun res!467349 () Bool)

(assert (=> b!703632 (=> (not res!467349) (not e!397725))))

(assert (=> b!703632 (= res!467349 (not (contains!3836 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703633 () Bool)

(declare-fun res!467346 () Bool)

(assert (=> b!703633 (=> (not res!467346) (not e!397725))))

(declare-fun arrayNoDuplicates!0 (array!40165 (_ BitVec 32) List!13184) Bool)

(assert (=> b!703633 (= res!467346 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!703634 () Bool)

(declare-fun res!467348 () Bool)

(assert (=> b!703634 (=> (not res!467348) (not e!397725))))

(assert (=> b!703634 (= res!467348 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!703635 () Bool)

(assert (=> b!703635 (= e!397725 false)))

(declare-fun lt!317886 () Bool)

(assert (=> b!703635 (= lt!317886 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!703636 () Bool)

(declare-fun res!467337 () Bool)

(assert (=> b!703636 (=> (not res!467337) (not e!397725))))

(assert (=> b!703636 (= res!467337 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19619 a!3591)))))

(declare-fun b!703637 () Bool)

(declare-fun res!467339 () Bool)

(assert (=> b!703637 (=> (not res!467339) (not e!397725))))

(declare-fun subseq!304 (List!13184 List!13184) Bool)

(assert (=> b!703637 (= res!467339 (subseq!304 acc!652 newAcc!49))))

(declare-fun b!703638 () Bool)

(declare-fun res!467344 () Bool)

(assert (=> b!703638 (=> (not res!467344) (not e!397725))))

(assert (=> b!703638 (= res!467344 (not (validKeyInArray!0 (select (arr!19236 a!3591) from!2969))))))

(declare-fun b!703639 () Bool)

(declare-fun res!467345 () Bool)

(assert (=> b!703639 (=> (not res!467345) (not e!397725))))

(assert (=> b!703639 (= res!467345 (noDuplicate!1110 acc!652))))

(declare-fun b!703640 () Bool)

(declare-fun res!467342 () Bool)

(assert (=> b!703640 (=> (not res!467342) (not e!397725))))

(assert (=> b!703640 (= res!467342 (not (contains!3836 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703641 () Bool)

(declare-fun res!467336 () Bool)

(assert (=> b!703641 (=> (not res!467336) (not e!397725))))

(assert (=> b!703641 (= res!467336 (not (contains!3836 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703642 () Bool)

(declare-fun res!467338 () Bool)

(assert (=> b!703642 (=> (not res!467338) (not e!397725))))

(assert (=> b!703642 (= res!467338 (not (contains!3836 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62546 res!467343) b!703639))

(assert (= (and b!703639 res!467345) b!703628))

(assert (= (and b!703628 res!467352) b!703641))

(assert (= (and b!703641 res!467336) b!703632))

(assert (= (and b!703632 res!467349) b!703625))

(assert (= (and b!703625 res!467340) b!703626))

(assert (= (and b!703626 res!467353) b!703631))

(assert (= (and b!703631 res!467351) b!703633))

(assert (= (and b!703633 res!467346) b!703637))

(assert (= (and b!703637 res!467339) b!703627))

(assert (= (and b!703627 res!467347) b!703630))

(assert (= (and b!703630 res!467350) b!703642))

(assert (= (and b!703642 res!467338) b!703640))

(assert (= (and b!703640 res!467342) b!703636))

(assert (= (and b!703636 res!467337) b!703638))

(assert (= (and b!703638 res!467344) b!703634))

(assert (= (and b!703634 res!467348) b!703629))

(assert (= (and b!703629 res!467341) b!703635))

(declare-fun m!662919 () Bool)

(assert (=> b!703629 m!662919))

(declare-fun m!662921 () Bool)

(assert (=> b!703642 m!662921))

(declare-fun m!662923 () Bool)

(assert (=> b!703639 m!662923))

(declare-fun m!662925 () Bool)

(assert (=> b!703640 m!662925))

(declare-fun m!662927 () Bool)

(assert (=> b!703627 m!662927))

(declare-fun m!662929 () Bool)

(assert (=> b!703638 m!662929))

(assert (=> b!703638 m!662929))

(declare-fun m!662931 () Bool)

(assert (=> b!703638 m!662931))

(declare-fun m!662933 () Bool)

(assert (=> b!703630 m!662933))

(declare-fun m!662935 () Bool)

(assert (=> b!703637 m!662935))

(declare-fun m!662937 () Bool)

(assert (=> start!62546 m!662937))

(declare-fun m!662939 () Bool)

(assert (=> b!703632 m!662939))

(declare-fun m!662941 () Bool)

(assert (=> b!703635 m!662941))

(declare-fun m!662943 () Bool)

(assert (=> b!703641 m!662943))

(declare-fun m!662945 () Bool)

(assert (=> b!703625 m!662945))

(declare-fun m!662947 () Bool)

(assert (=> b!703626 m!662947))

(declare-fun m!662949 () Bool)

(assert (=> b!703631 m!662949))

(declare-fun m!662951 () Bool)

(assert (=> b!703633 m!662951))

(declare-fun m!662953 () Bool)

(assert (=> b!703628 m!662953))

(push 1)

(assert (not b!703635))

(assert (not b!703628))

(assert (not b!703630))

(assert (not b!703629))

(assert (not b!703639))

(assert (not b!703627))

(assert (not b!703638))

(assert (not b!703640))

(assert (not b!703641))

(assert (not b!703631))

(assert (not b!703632))

(assert (not start!62546))

(assert (not b!703642))

(assert (not b!703626))

(assert (not b!703633))

(assert (not b!703625))

(assert (not b!703637))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

