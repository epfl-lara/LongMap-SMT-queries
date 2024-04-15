; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60110 () Bool)

(assert start!60110)

(declare-fun b!670573 () Bool)

(declare-fun res!437431 () Bool)

(declare-fun e!383344 () Bool)

(assert (=> b!670573 (=> (not res!437431) (not e!383344))))

(declare-datatypes ((array!39168 0))(
  ( (array!39169 (arr!18776 (Array (_ BitVec 32) (_ BitVec 64))) (size!19141 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39168)

(declare-datatypes ((List!12856 0))(
  ( (Nil!12853) (Cons!12852 (h!13897 (_ BitVec 64)) (t!19075 List!12856)) )
))
(declare-fun arrayNoDuplicates!0 (array!39168 (_ BitVec 32) List!12856) Bool)

(assert (=> b!670573 (= res!437431 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12853))))

(declare-fun b!670574 () Bool)

(declare-fun e!383343 () Bool)

(declare-fun e!383341 () Bool)

(assert (=> b!670574 (= e!383343 e!383341)))

(declare-fun res!437435 () Bool)

(assert (=> b!670574 (=> (not res!437435) (not e!383341))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!670574 (= res!437435 (bvsle from!3004 i!1382))))

(declare-fun b!670575 () Bool)

(declare-fun res!437437 () Bool)

(assert (=> b!670575 (=> (not res!437437) (not e!383344))))

(declare-fun acc!681 () List!12856)

(declare-fun contains!3378 (List!12856 (_ BitVec 64)) Bool)

(assert (=> b!670575 (= res!437437 (not (contains!3378 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!437434 () Bool)

(assert (=> start!60110 (=> (not res!437434) (not e!383344))))

(assert (=> start!60110 (= res!437434 (and (bvslt (size!19141 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19141 a!3626))))))

(assert (=> start!60110 e!383344))

(assert (=> start!60110 true))

(declare-fun array_inv!14659 (array!39168) Bool)

(assert (=> start!60110 (array_inv!14659 a!3626)))

(declare-fun b!670576 () Bool)

(assert (=> b!670576 (= e!383344 false)))

(declare-fun lt!311904 () Bool)

(assert (=> b!670576 (= lt!311904 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!670577 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!670577 (= e!383341 (not (contains!3378 acc!681 k0!2843)))))

(declare-fun b!670578 () Bool)

(declare-fun res!437429 () Bool)

(assert (=> b!670578 (=> (not res!437429) (not e!383344))))

(declare-fun noDuplicate!647 (List!12856) Bool)

(assert (=> b!670578 (= res!437429 (noDuplicate!647 acc!681))))

(declare-fun b!670579 () Bool)

(declare-fun res!437432 () Bool)

(assert (=> b!670579 (=> (not res!437432) (not e!383344))))

(assert (=> b!670579 (= res!437432 (not (contains!3378 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670580 () Bool)

(declare-fun e!383342 () Bool)

(assert (=> b!670580 (= e!383342 (contains!3378 acc!681 k0!2843))))

(declare-fun b!670581 () Bool)

(declare-fun res!437433 () Bool)

(assert (=> b!670581 (=> (not res!437433) (not e!383344))))

(assert (=> b!670581 (= res!437433 e!383343)))

(declare-fun res!437430 () Bool)

(assert (=> b!670581 (=> res!437430 e!383343)))

(assert (=> b!670581 (= res!437430 e!383342)))

(declare-fun res!437436 () Bool)

(assert (=> b!670581 (=> (not res!437436) (not e!383342))))

(assert (=> b!670581 (= res!437436 (bvsgt from!3004 i!1382))))

(assert (= (and start!60110 res!437434) b!670578))

(assert (= (and b!670578 res!437429) b!670579))

(assert (= (and b!670579 res!437432) b!670575))

(assert (= (and b!670575 res!437437) b!670581))

(assert (= (and b!670581 res!437436) b!670580))

(assert (= (and b!670581 (not res!437430)) b!670574))

(assert (= (and b!670574 res!437435) b!670577))

(assert (= (and b!670581 res!437433) b!670573))

(assert (= (and b!670573 res!437431) b!670576))

(declare-fun m!639861 () Bool)

(assert (=> b!670579 m!639861))

(declare-fun m!639863 () Bool)

(assert (=> b!670577 m!639863))

(declare-fun m!639865 () Bool)

(assert (=> b!670575 m!639865))

(declare-fun m!639867 () Bool)

(assert (=> start!60110 m!639867))

(declare-fun m!639869 () Bool)

(assert (=> b!670578 m!639869))

(declare-fun m!639871 () Bool)

(assert (=> b!670573 m!639871))

(assert (=> b!670580 m!639863))

(declare-fun m!639873 () Bool)

(assert (=> b!670576 m!639873))

(check-sat (not b!670573) (not b!670580) (not b!670577) (not start!60110) (not b!670578) (not b!670576) (not b!670579) (not b!670575))
(check-sat)
