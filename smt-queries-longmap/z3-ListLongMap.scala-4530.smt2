; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62704 () Bool)

(assert start!62704)

(declare-fun b!707512 () Bool)

(declare-fun res!471228 () Bool)

(declare-fun e!398199 () Bool)

(assert (=> b!707512 (=> (not res!471228) (not e!398199))))

(declare-datatypes ((List!13263 0))(
  ( (Nil!13260) (Cons!13259 (h!14307 (_ BitVec 64)) (t!19537 List!13263)) )
))
(declare-fun newAcc!49 () List!13263)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun acc!652 () List!13263)

(declare-fun -!347 (List!13263 (_ BitVec 64)) List!13263)

(assert (=> b!707512 (= res!471228 (= (-!347 newAcc!49 k0!2824) acc!652))))

(declare-fun b!707513 () Bool)

(assert (=> b!707513 (= e!398199 false)))

(declare-fun lt!318096 () Bool)

(declare-fun contains!3915 (List!13263 (_ BitVec 64)) Bool)

(assert (=> b!707513 (= lt!318096 (contains!3915 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707514 () Bool)

(declare-fun res!471224 () Bool)

(assert (=> b!707514 (=> (not res!471224) (not e!398199))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!707514 (= res!471224 (validKeyInArray!0 k0!2824))))

(declare-fun b!707516 () Bool)

(declare-fun res!471232 () Bool)

(assert (=> b!707516 (=> (not res!471232) (not e!398199))))

(assert (=> b!707516 (= res!471232 (not (contains!3915 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707517 () Bool)

(declare-fun res!471229 () Bool)

(assert (=> b!707517 (=> (not res!471229) (not e!398199))))

(declare-fun noDuplicate!1189 (List!13263) Bool)

(assert (=> b!707517 (= res!471229 (noDuplicate!1189 newAcc!49))))

(declare-fun b!707518 () Bool)

(declare-fun res!471231 () Bool)

(assert (=> b!707518 (=> (not res!471231) (not e!398199))))

(assert (=> b!707518 (= res!471231 (not (contains!3915 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707519 () Bool)

(declare-fun res!471223 () Bool)

(assert (=> b!707519 (=> (not res!471223) (not e!398199))))

(declare-datatypes ((array!40323 0))(
  ( (array!40324 (arr!19315 (Array (_ BitVec 32) (_ BitVec 64))) (size!19698 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40323)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40323 (_ BitVec 32) List!13263) Bool)

(assert (=> b!707519 (= res!471223 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!707520 () Bool)

(declare-fun res!471227 () Bool)

(assert (=> b!707520 (=> (not res!471227) (not e!398199))))

(assert (=> b!707520 (= res!471227 (not (contains!3915 acc!652 k0!2824)))))

(declare-fun b!707521 () Bool)

(declare-fun res!471235 () Bool)

(assert (=> b!707521 (=> (not res!471235) (not e!398199))))

(declare-fun subseq!383 (List!13263 List!13263) Bool)

(assert (=> b!707521 (= res!471235 (subseq!383 acc!652 newAcc!49))))

(declare-fun b!707522 () Bool)

(declare-fun res!471234 () Bool)

(assert (=> b!707522 (=> (not res!471234) (not e!398199))))

(assert (=> b!707522 (= res!471234 (noDuplicate!1189 acc!652))))

(declare-fun b!707515 () Bool)

(declare-fun res!471230 () Bool)

(assert (=> b!707515 (=> (not res!471230) (not e!398199))))

(assert (=> b!707515 (= res!471230 (not (contains!3915 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!471226 () Bool)

(assert (=> start!62704 (=> (not res!471226) (not e!398199))))

(assert (=> start!62704 (= res!471226 (and (bvslt (size!19698 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19698 a!3591))))))

(assert (=> start!62704 e!398199))

(assert (=> start!62704 true))

(declare-fun array_inv!15174 (array!40323) Bool)

(assert (=> start!62704 (array_inv!15174 a!3591)))

(declare-fun b!707523 () Bool)

(declare-fun res!471233 () Bool)

(assert (=> b!707523 (=> (not res!471233) (not e!398199))))

(assert (=> b!707523 (= res!471233 (contains!3915 newAcc!49 k0!2824))))

(declare-fun b!707524 () Bool)

(declare-fun res!471225 () Bool)

(assert (=> b!707524 (=> (not res!471225) (not e!398199))))

(declare-fun arrayContainsKey!0 (array!40323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!707524 (= res!471225 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(assert (= (and start!62704 res!471226) b!707522))

(assert (= (and b!707522 res!471234) b!707517))

(assert (= (and b!707517 res!471229) b!707515))

(assert (= (and b!707515 res!471230) b!707516))

(assert (= (and b!707516 res!471232) b!707524))

(assert (= (and b!707524 res!471225) b!707520))

(assert (= (and b!707520 res!471227) b!707514))

(assert (= (and b!707514 res!471224) b!707519))

(assert (= (and b!707519 res!471223) b!707521))

(assert (= (and b!707521 res!471235) b!707523))

(assert (= (and b!707523 res!471233) b!707512))

(assert (= (and b!707512 res!471228) b!707518))

(assert (= (and b!707518 res!471231) b!707513))

(declare-fun m!665583 () Bool)

(assert (=> b!707512 m!665583))

(declare-fun m!665585 () Bool)

(assert (=> b!707522 m!665585))

(declare-fun m!665587 () Bool)

(assert (=> b!707519 m!665587))

(declare-fun m!665589 () Bool)

(assert (=> b!707517 m!665589))

(declare-fun m!665591 () Bool)

(assert (=> b!707518 m!665591))

(declare-fun m!665593 () Bool)

(assert (=> b!707524 m!665593))

(declare-fun m!665595 () Bool)

(assert (=> b!707516 m!665595))

(declare-fun m!665597 () Bool)

(assert (=> start!62704 m!665597))

(declare-fun m!665599 () Bool)

(assert (=> b!707523 m!665599))

(declare-fun m!665601 () Bool)

(assert (=> b!707520 m!665601))

(declare-fun m!665603 () Bool)

(assert (=> b!707521 m!665603))

(declare-fun m!665605 () Bool)

(assert (=> b!707513 m!665605))

(declare-fun m!665607 () Bool)

(assert (=> b!707514 m!665607))

(declare-fun m!665609 () Bool)

(assert (=> b!707515 m!665609))

(check-sat (not b!707513) (not b!707520) (not b!707518) (not b!707522) (not b!707521) (not b!707512) (not b!707514) (not b!707515) (not b!707517) (not b!707519) (not b!707516) (not b!707524) (not b!707523) (not start!62704))
(check-sat)
