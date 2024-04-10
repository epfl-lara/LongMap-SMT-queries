; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102580 () Bool)

(assert start!102580)

(declare-fun b!1233332 () Bool)

(declare-fun res!821556 () Bool)

(declare-fun e!699638 () Bool)

(assert (=> b!1233332 (=> (not res!821556) (not e!699638))))

(declare-datatypes ((List!27138 0))(
  ( (Nil!27135) (Cons!27134 (h!28343 (_ BitVec 64)) (t!40601 List!27138)) )
))
(declare-fun acc!823 () List!27138)

(declare-fun noDuplicate!1797 (List!27138) Bool)

(assert (=> b!1233332 (= res!821556 (noDuplicate!1797 acc!823))))

(declare-fun b!1233333 () Bool)

(declare-fun res!821551 () Bool)

(declare-fun e!699639 () Bool)

(assert (=> b!1233333 (=> res!821551 e!699639)))

(declare-fun lt!559665 () List!27138)

(declare-fun contains!7200 (List!27138 (_ BitVec 64)) Bool)

(assert (=> b!1233333 (= res!821551 (contains!7200 lt!559665 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233334 () Bool)

(assert (=> b!1233334 (= e!699639 true)))

(declare-fun lt!559667 () Bool)

(assert (=> b!1233334 (= lt!559667 (contains!7200 lt!559665 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233335 () Bool)

(assert (=> b!1233335 (= e!699638 (not e!699639))))

(declare-fun res!821558 () Bool)

(assert (=> b!1233335 (=> res!821558 e!699639)))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1233335 (= res!821558 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(declare-datatypes ((array!79509 0))(
  ( (array!79510 (arr!38365 (Array (_ BitVec 32) (_ BitVec 64))) (size!38901 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79509)

(assert (=> b!1233335 (= lt!559665 (Cons!27134 (select (arr!38365 a!3806) from!3184) Nil!27135))))

(declare-fun e!699637 () Bool)

(assert (=> b!1233335 e!699637))

(declare-fun res!821549 () Bool)

(assert (=> b!1233335 (=> (not res!821549) (not e!699637))))

(declare-fun arrayNoDuplicates!0 (array!79509 (_ BitVec 32) List!27138) Bool)

(assert (=> b!1233335 (= res!821549 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27135))))

(declare-datatypes ((Unit!40836 0))(
  ( (Unit!40837) )
))
(declare-fun lt!559666 () Unit!40836)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79509 List!27138 List!27138 (_ BitVec 32)) Unit!40836)

(assert (=> b!1233335 (= lt!559666 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27135 from!3184))))

(assert (=> b!1233335 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27134 (select (arr!38365 a!3806) from!3184) acc!823))))

(declare-fun b!1233336 () Bool)

(declare-fun res!821560 () Bool)

(assert (=> b!1233336 (=> (not res!821560) (not e!699638))))

(assert (=> b!1233336 (= res!821560 (not (contains!7200 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!821550 () Bool)

(assert (=> start!102580 (=> (not res!821550) (not e!699638))))

(assert (=> start!102580 (= res!821550 (bvslt (size!38901 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102580 e!699638))

(declare-fun array_inv!29213 (array!79509) Bool)

(assert (=> start!102580 (array_inv!29213 a!3806)))

(assert (=> start!102580 true))

(declare-fun b!1233337 () Bool)

(assert (=> b!1233337 (= e!699637 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27134 (select (arr!38365 a!3806) from!3184) Nil!27135)))))

(declare-fun b!1233338 () Bool)

(declare-fun res!821555 () Bool)

(assert (=> b!1233338 (=> (not res!821555) (not e!699638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233338 (= res!821555 (validKeyInArray!0 (select (arr!38365 a!3806) from!3184)))))

(declare-fun b!1233339 () Bool)

(declare-fun res!821559 () Bool)

(assert (=> b!1233339 (=> (not res!821559) (not e!699638))))

(assert (=> b!1233339 (= res!821559 (not (contains!7200 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233340 () Bool)

(declare-fun res!821552 () Bool)

(assert (=> b!1233340 (=> (not res!821552) (not e!699638))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1233340 (= res!821552 (validKeyInArray!0 k!2913))))

(declare-fun b!1233341 () Bool)

(declare-fun res!821557 () Bool)

(assert (=> b!1233341 (=> (not res!821557) (not e!699638))))

(assert (=> b!1233341 (= res!821557 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1233342 () Bool)

(declare-fun res!821553 () Bool)

(assert (=> b!1233342 (=> (not res!821553) (not e!699638))))

(declare-fun arrayContainsKey!0 (array!79509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233342 (= res!821553 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1233343 () Bool)

(declare-fun res!821548 () Bool)

(assert (=> b!1233343 (=> res!821548 e!699639)))

(assert (=> b!1233343 (= res!821548 (not (noDuplicate!1797 lt!559665)))))

(declare-fun b!1233344 () Bool)

(declare-fun res!821554 () Bool)

(assert (=> b!1233344 (=> (not res!821554) (not e!699638))))

(assert (=> b!1233344 (= res!821554 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38901 a!3806)) (bvslt from!3184 (size!38901 a!3806))))))

(assert (= (and start!102580 res!821550) b!1233340))

(assert (= (and b!1233340 res!821552) b!1233344))

(assert (= (and b!1233344 res!821554) b!1233332))

(assert (= (and b!1233332 res!821556) b!1233339))

(assert (= (and b!1233339 res!821559) b!1233336))

(assert (= (and b!1233336 res!821560) b!1233342))

(assert (= (and b!1233342 res!821553) b!1233341))

(assert (= (and b!1233341 res!821557) b!1233338))

(assert (= (and b!1233338 res!821555) b!1233335))

(assert (= (and b!1233335 res!821549) b!1233337))

(assert (= (and b!1233335 (not res!821558)) b!1233343))

(assert (= (and b!1233343 (not res!821548)) b!1233333))

(assert (= (and b!1233333 (not res!821551)) b!1233334))

(declare-fun m!1137419 () Bool)

(assert (=> b!1233333 m!1137419))

(declare-fun m!1137421 () Bool)

(assert (=> b!1233336 m!1137421))

(declare-fun m!1137423 () Bool)

(assert (=> b!1233334 m!1137423))

(declare-fun m!1137425 () Bool)

(assert (=> b!1233337 m!1137425))

(declare-fun m!1137427 () Bool)

(assert (=> b!1233337 m!1137427))

(declare-fun m!1137429 () Bool)

(assert (=> b!1233341 m!1137429))

(declare-fun m!1137431 () Bool)

(assert (=> b!1233342 m!1137431))

(declare-fun m!1137433 () Bool)

(assert (=> b!1233339 m!1137433))

(assert (=> b!1233335 m!1137425))

(declare-fun m!1137435 () Bool)

(assert (=> b!1233335 m!1137435))

(declare-fun m!1137437 () Bool)

(assert (=> b!1233335 m!1137437))

(declare-fun m!1137439 () Bool)

(assert (=> b!1233335 m!1137439))

(declare-fun m!1137441 () Bool)

(assert (=> start!102580 m!1137441))

(declare-fun m!1137443 () Bool)

(assert (=> b!1233332 m!1137443))

(declare-fun m!1137445 () Bool)

(assert (=> b!1233340 m!1137445))

(declare-fun m!1137447 () Bool)

(assert (=> b!1233343 m!1137447))

(assert (=> b!1233338 m!1137425))

(assert (=> b!1233338 m!1137425))

(declare-fun m!1137449 () Bool)

(assert (=> b!1233338 m!1137449))

(push 1)

(assert (not b!1233336))

(assert (not b!1233341))

(assert (not b!1233343))

(assert (not b!1233333))

(assert (not b!1233342))

(assert (not b!1233337))

(assert (not start!102580))

(assert (not b!1233335))

(assert (not b!1233339))

(assert (not b!1233340))

(assert (not b!1233338))

(assert (not b!1233334))

(assert (not b!1233332))

(check-sat)

