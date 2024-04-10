; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59824 () Bool)

(assert start!59824)

(declare-fun b!661048 () Bool)

(declare-fun e!379803 () Bool)

(declare-datatypes ((List!12669 0))(
  ( (Nil!12666) (Cons!12665 (h!13710 (_ BitVec 64)) (t!18897 List!12669)) )
))
(declare-fun acc!681 () List!12669)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3246 (List!12669 (_ BitVec 64)) Bool)

(assert (=> b!661048 (= e!379803 (contains!3246 acc!681 k0!2843))))

(declare-fun b!661049 () Bool)

(declare-fun res!429113 () Bool)

(declare-fun e!379805 () Bool)

(assert (=> b!661049 (=> (not res!429113) (not e!379805))))

(declare-datatypes ((array!38871 0))(
  ( (array!38872 (arr!18628 (Array (_ BitVec 32) (_ BitVec 64))) (size!18992 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38871)

(declare-fun arrayContainsKey!0 (array!38871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661049 (= res!429113 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!661050 () Bool)

(assert (=> b!661050 (= e!379805 (not true))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!661050 (arrayContainsKey!0 (array!38872 (store (arr!18628 a!3626) i!1382 k0!2843) (size!18992 a!3626)) k0!2843 from!3004)))

(declare-fun b!661051 () Bool)

(declare-fun res!429122 () Bool)

(assert (=> b!661051 (=> (not res!429122) (not e!379805))))

(declare-fun noDuplicate!493 (List!12669) Bool)

(assert (=> b!661051 (= res!429122 (noDuplicate!493 acc!681))))

(declare-fun b!661053 () Bool)

(declare-fun e!379806 () Bool)

(assert (=> b!661053 (= e!379806 (not (contains!3246 acc!681 k0!2843)))))

(declare-fun b!661054 () Bool)

(declare-fun res!429125 () Bool)

(assert (=> b!661054 (=> (not res!429125) (not e!379805))))

(assert (=> b!661054 (= res!429125 (not (contains!3246 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661055 () Bool)

(declare-fun e!379804 () Bool)

(assert (=> b!661055 (= e!379804 e!379806)))

(declare-fun res!429124 () Bool)

(assert (=> b!661055 (=> (not res!429124) (not e!379806))))

(assert (=> b!661055 (= res!429124 (bvsle from!3004 i!1382))))

(declare-fun b!661056 () Bool)

(declare-fun res!429119 () Bool)

(assert (=> b!661056 (=> (not res!429119) (not e!379805))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661056 (= res!429119 (validKeyInArray!0 k0!2843))))

(declare-fun b!661057 () Bool)

(declare-fun res!429121 () Bool)

(assert (=> b!661057 (=> (not res!429121) (not e!379805))))

(assert (=> b!661057 (= res!429121 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!18992 a!3626))))))

(declare-fun b!661058 () Bool)

(declare-fun res!429117 () Bool)

(assert (=> b!661058 (=> (not res!429117) (not e!379805))))

(assert (=> b!661058 (= res!429117 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!18992 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661052 () Bool)

(declare-fun res!429115 () Bool)

(assert (=> b!661052 (=> (not res!429115) (not e!379805))))

(assert (=> b!661052 (= res!429115 e!379804)))

(declare-fun res!429118 () Bool)

(assert (=> b!661052 (=> res!429118 e!379804)))

(assert (=> b!661052 (= res!429118 e!379803)))

(declare-fun res!429112 () Bool)

(assert (=> b!661052 (=> (not res!429112) (not e!379803))))

(assert (=> b!661052 (= res!429112 (bvsgt from!3004 i!1382))))

(declare-fun res!429114 () Bool)

(assert (=> start!59824 (=> (not res!429114) (not e!379805))))

(assert (=> start!59824 (= res!429114 (and (bvslt (size!18992 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18992 a!3626))))))

(assert (=> start!59824 e!379805))

(assert (=> start!59824 true))

(declare-fun array_inv!14424 (array!38871) Bool)

(assert (=> start!59824 (array_inv!14424 a!3626)))

(declare-fun b!661059 () Bool)

(declare-fun res!429120 () Bool)

(assert (=> b!661059 (=> (not res!429120) (not e!379805))))

(declare-fun arrayNoDuplicates!0 (array!38871 (_ BitVec 32) List!12669) Bool)

(assert (=> b!661059 (= res!429120 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12666))))

(declare-fun b!661060 () Bool)

(declare-fun res!429116 () Bool)

(assert (=> b!661060 (=> (not res!429116) (not e!379805))))

(assert (=> b!661060 (= res!429116 (not (contains!3246 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661061 () Bool)

(declare-fun res!429123 () Bool)

(assert (=> b!661061 (=> (not res!429123) (not e!379805))))

(assert (=> b!661061 (= res!429123 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!59824 res!429114) b!661051))

(assert (= (and b!661051 res!429122) b!661060))

(assert (= (and b!661060 res!429116) b!661054))

(assert (= (and b!661054 res!429125) b!661052))

(assert (= (and b!661052 res!429112) b!661048))

(assert (= (and b!661052 (not res!429118)) b!661055))

(assert (= (and b!661055 res!429124) b!661053))

(assert (= (and b!661052 res!429115) b!661059))

(assert (= (and b!661059 res!429120) b!661061))

(assert (= (and b!661061 res!429123) b!661057))

(assert (= (and b!661057 res!429121) b!661056))

(assert (= (and b!661056 res!429119) b!661049))

(assert (= (and b!661049 res!429113) b!661058))

(assert (= (and b!661058 res!429117) b!661050))

(declare-fun m!633423 () Bool)

(assert (=> start!59824 m!633423))

(declare-fun m!633425 () Bool)

(assert (=> b!661054 m!633425))

(declare-fun m!633427 () Bool)

(assert (=> b!661059 m!633427))

(declare-fun m!633429 () Bool)

(assert (=> b!661048 m!633429))

(declare-fun m!633431 () Bool)

(assert (=> b!661051 m!633431))

(declare-fun m!633433 () Bool)

(assert (=> b!661060 m!633433))

(declare-fun m!633435 () Bool)

(assert (=> b!661050 m!633435))

(declare-fun m!633437 () Bool)

(assert (=> b!661050 m!633437))

(assert (=> b!661053 m!633429))

(declare-fun m!633439 () Bool)

(assert (=> b!661049 m!633439))

(declare-fun m!633441 () Bool)

(assert (=> b!661056 m!633441))

(declare-fun m!633443 () Bool)

(assert (=> b!661061 m!633443))

(check-sat (not start!59824) (not b!661054) (not b!661049) (not b!661056) (not b!661059) (not b!661060) (not b!661061) (not b!661051) (not b!661053) (not b!661048) (not b!661050))
(check-sat)
