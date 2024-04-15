; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62124 () Bool)

(assert start!62124)

(declare-fun b!695419 () Bool)

(declare-fun res!459528 () Bool)

(declare-fun e!395494 () Bool)

(assert (=> b!695419 (=> (not res!459528) (not e!395494))))

(declare-datatypes ((List!13203 0))(
  ( (Nil!13200) (Cons!13199 (h!14244 (_ BitVec 64)) (t!19476 List!13203)) )
))
(declare-fun acc!681 () List!13203)

(declare-fun contains!3725 (List!13203 (_ BitVec 64)) Bool)

(assert (=> b!695419 (= res!459528 (not (contains!3725 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695420 () Bool)

(declare-fun res!459530 () Bool)

(assert (=> b!695420 (=> (not res!459530) (not e!395494))))

(assert (=> b!695420 (= res!459530 (not (contains!3725 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695421 () Bool)

(declare-fun e!395495 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!695421 (= e!395495 (not (contains!3725 acc!681 k!2843)))))

(declare-fun b!695422 () Bool)

(declare-fun e!395493 () Bool)

(assert (=> b!695422 (= e!395493 e!395495)))

(declare-fun res!459531 () Bool)

(assert (=> b!695422 (=> (not res!459531) (not e!395495))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!695422 (= res!459531 (bvsle from!3004 i!1382))))

(declare-fun b!695423 () Bool)

(declare-fun e!395491 () Bool)

(assert (=> b!695423 (= e!395491 (contains!3725 acc!681 k!2843))))

(declare-fun b!695424 () Bool)

(assert (=> b!695424 (= e!395494 false)))

(declare-fun lt!316821 () Bool)

(declare-datatypes ((array!39925 0))(
  ( (array!39926 (arr!19123 (Array (_ BitVec 32) (_ BitVec 64))) (size!19505 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39925)

(declare-fun arrayNoDuplicates!0 (array!39925 (_ BitVec 32) List!13203) Bool)

(assert (=> b!695424 (= lt!316821 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!459534 () Bool)

(assert (=> start!62124 (=> (not res!459534) (not e!395494))))

(assert (=> start!62124 (= res!459534 (and (bvslt (size!19505 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19505 a!3626))))))

(assert (=> start!62124 e!395494))

(assert (=> start!62124 true))

(declare-fun array_inv!15006 (array!39925) Bool)

(assert (=> start!62124 (array_inv!15006 a!3626)))

(declare-fun b!695425 () Bool)

(declare-fun res!459533 () Bool)

(assert (=> b!695425 (=> (not res!459533) (not e!395494))))

(declare-fun noDuplicate!994 (List!13203) Bool)

(assert (=> b!695425 (= res!459533 (noDuplicate!994 acc!681))))

(declare-fun b!695426 () Bool)

(declare-fun res!459529 () Bool)

(assert (=> b!695426 (=> (not res!459529) (not e!395494))))

(assert (=> b!695426 (= res!459529 e!395493)))

(declare-fun res!459535 () Bool)

(assert (=> b!695426 (=> res!459535 e!395493)))

(assert (=> b!695426 (= res!459535 e!395491)))

(declare-fun res!459532 () Bool)

(assert (=> b!695426 (=> (not res!459532) (not e!395491))))

(assert (=> b!695426 (= res!459532 (bvsgt from!3004 i!1382))))

(declare-fun b!695427 () Bool)

(declare-fun res!459527 () Bool)

(assert (=> b!695427 (=> (not res!459527) (not e!395494))))

(assert (=> b!695427 (= res!459527 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13200))))

(assert (= (and start!62124 res!459534) b!695425))

(assert (= (and b!695425 res!459533) b!695419))

(assert (= (and b!695419 res!459528) b!695420))

(assert (= (and b!695420 res!459530) b!695426))

(assert (= (and b!695426 res!459532) b!695423))

(assert (= (and b!695426 (not res!459535)) b!695422))

(assert (= (and b!695422 res!459531) b!695421))

(assert (= (and b!695426 res!459529) b!695427))

(assert (= (and b!695427 res!459527) b!695424))

(declare-fun m!656305 () Bool)

(assert (=> b!695421 m!656305))

(declare-fun m!656307 () Bool)

(assert (=> start!62124 m!656307))

(declare-fun m!656309 () Bool)

(assert (=> b!695424 m!656309))

(declare-fun m!656311 () Bool)

(assert (=> b!695425 m!656311))

(declare-fun m!656313 () Bool)

(assert (=> b!695427 m!656313))

(declare-fun m!656315 () Bool)

(assert (=> b!695419 m!656315))

(assert (=> b!695423 m!656305))

(declare-fun m!656317 () Bool)

(assert (=> b!695420 m!656317))

(push 1)

(assert (not b!695425))

(assert (not b!695421))

(assert (not start!62124))

(assert (not b!695419))

(assert (not b!695420))

(assert (not b!695423))

(assert (not b!695424))

(assert (not b!695427))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

