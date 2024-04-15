; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60104 () Bool)

(assert start!60104)

(declare-fun b!670492 () Bool)

(declare-fun res!437349 () Bool)

(declare-fun e!383299 () Bool)

(assert (=> b!670492 (=> (not res!437349) (not e!383299))))

(declare-datatypes ((List!12853 0))(
  ( (Nil!12850) (Cons!12849 (h!13894 (_ BitVec 64)) (t!19072 List!12853)) )
))
(declare-fun acc!681 () List!12853)

(declare-fun contains!3375 (List!12853 (_ BitVec 64)) Bool)

(assert (=> b!670492 (= res!437349 (not (contains!3375 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670493 () Bool)

(assert (=> b!670493 (= e!383299 false)))

(declare-datatypes ((array!39162 0))(
  ( (array!39163 (arr!18773 (Array (_ BitVec 32) (_ BitVec 64))) (size!19138 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39162)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!311895 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39162 (_ BitVec 32) List!12853) Bool)

(assert (=> b!670493 (= lt!311895 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!437356 () Bool)

(assert (=> start!60104 (=> (not res!437356) (not e!383299))))

(assert (=> start!60104 (= res!437356 (and (bvslt (size!19138 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19138 a!3626))))))

(assert (=> start!60104 e!383299))

(assert (=> start!60104 true))

(declare-fun array_inv!14656 (array!39162) Bool)

(assert (=> start!60104 (array_inv!14656 a!3626)))

(declare-fun b!670494 () Bool)

(declare-fun res!437354 () Bool)

(assert (=> b!670494 (=> (not res!437354) (not e!383299))))

(assert (=> b!670494 (= res!437354 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12850))))

(declare-fun b!670495 () Bool)

(declare-fun res!437353 () Bool)

(assert (=> b!670495 (=> (not res!437353) (not e!383299))))

(declare-fun noDuplicate!644 (List!12853) Bool)

(assert (=> b!670495 (= res!437353 (noDuplicate!644 acc!681))))

(declare-fun b!670496 () Bool)

(declare-fun e!383297 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!670496 (= e!383297 (not (contains!3375 acc!681 k0!2843)))))

(declare-fun b!670497 () Bool)

(declare-fun e!383296 () Bool)

(assert (=> b!670497 (= e!383296 e!383297)))

(declare-fun res!437350 () Bool)

(assert (=> b!670497 (=> (not res!437350) (not e!383297))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!670497 (= res!437350 (bvsle from!3004 i!1382))))

(declare-fun b!670498 () Bool)

(declare-fun e!383300 () Bool)

(assert (=> b!670498 (= e!383300 (contains!3375 acc!681 k0!2843))))

(declare-fun b!670499 () Bool)

(declare-fun res!437351 () Bool)

(assert (=> b!670499 (=> (not res!437351) (not e!383299))))

(assert (=> b!670499 (= res!437351 e!383296)))

(declare-fun res!437355 () Bool)

(assert (=> b!670499 (=> res!437355 e!383296)))

(assert (=> b!670499 (= res!437355 e!383300)))

(declare-fun res!437352 () Bool)

(assert (=> b!670499 (=> (not res!437352) (not e!383300))))

(assert (=> b!670499 (= res!437352 (bvsgt from!3004 i!1382))))

(declare-fun b!670500 () Bool)

(declare-fun res!437348 () Bool)

(assert (=> b!670500 (=> (not res!437348) (not e!383299))))

(assert (=> b!670500 (= res!437348 (not (contains!3375 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60104 res!437356) b!670495))

(assert (= (and b!670495 res!437353) b!670492))

(assert (= (and b!670492 res!437349) b!670500))

(assert (= (and b!670500 res!437348) b!670499))

(assert (= (and b!670499 res!437352) b!670498))

(assert (= (and b!670499 (not res!437355)) b!670497))

(assert (= (and b!670497 res!437350) b!670496))

(assert (= (and b!670499 res!437351) b!670494))

(assert (= (and b!670494 res!437354) b!670493))

(declare-fun m!639819 () Bool)

(assert (=> b!670492 m!639819))

(declare-fun m!639821 () Bool)

(assert (=> b!670494 m!639821))

(declare-fun m!639823 () Bool)

(assert (=> start!60104 m!639823))

(declare-fun m!639825 () Bool)

(assert (=> b!670500 m!639825))

(declare-fun m!639827 () Bool)

(assert (=> b!670493 m!639827))

(declare-fun m!639829 () Bool)

(assert (=> b!670498 m!639829))

(assert (=> b!670496 m!639829))

(declare-fun m!639831 () Bool)

(assert (=> b!670495 m!639831))

(check-sat (not b!670500) (not b!670493) (not b!670496) (not start!60104) (not b!670494) (not b!670495) (not b!670492) (not b!670498))
(check-sat)
