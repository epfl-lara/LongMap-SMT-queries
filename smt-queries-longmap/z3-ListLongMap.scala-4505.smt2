; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62486 () Bool)

(assert start!62486)

(declare-fun b!703360 () Bool)

(declare-fun res!467347 () Bool)

(declare-fun e!397450 () Bool)

(assert (=> b!703360 (=> (not res!467347) (not e!397450))))

(declare-datatypes ((List!13324 0))(
  ( (Nil!13321) (Cons!13320 (h!14365 (_ BitVec 64)) (t!19597 List!13324)) )
))
(declare-fun acc!652 () List!13324)

(declare-fun noDuplicate!1115 (List!13324) Bool)

(assert (=> b!703360 (= res!467347 (noDuplicate!1115 acc!652))))

(declare-fun b!703361 () Bool)

(declare-fun res!467332 () Bool)

(assert (=> b!703361 (=> (not res!467332) (not e!397450))))

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!703361 (= res!467332 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun res!467336 () Bool)

(assert (=> start!62486 (=> (not res!467336) (not e!397450))))

(declare-datatypes ((array!40176 0))(
  ( (array!40177 (arr!19244 (Array (_ BitVec 32) (_ BitVec 64))) (size!19626 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40176)

(assert (=> start!62486 (= res!467336 (and (bvslt (size!19626 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19626 a!3591))))))

(assert (=> start!62486 e!397450))

(assert (=> start!62486 true))

(declare-fun array_inv!15127 (array!40176) Bool)

(assert (=> start!62486 (array_inv!15127 a!3591)))

(declare-fun b!703362 () Bool)

(declare-fun res!467344 () Bool)

(assert (=> b!703362 (=> (not res!467344) (not e!397450))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3846 (List!13324 (_ BitVec 64)) Bool)

(assert (=> b!703362 (= res!467344 (not (contains!3846 acc!652 k0!2824)))))

(declare-fun b!703363 () Bool)

(declare-fun res!467334 () Bool)

(assert (=> b!703363 (=> (not res!467334) (not e!397450))))

(declare-fun arrayContainsKey!0 (array!40176 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!703363 (= res!467334 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!703364 () Bool)

(declare-fun res!467337 () Bool)

(assert (=> b!703364 (=> (not res!467337) (not e!397450))))

(assert (=> b!703364 (= res!467337 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19626 a!3591)))))

(declare-fun b!703365 () Bool)

(declare-fun res!467330 () Bool)

(assert (=> b!703365 (=> (not res!467330) (not e!397450))))

(declare-fun newAcc!49 () List!13324)

(assert (=> b!703365 (= res!467330 (noDuplicate!1115 newAcc!49))))

(declare-fun b!703366 () Bool)

(declare-fun res!467346 () Bool)

(assert (=> b!703366 (=> (not res!467346) (not e!397450))))

(assert (=> b!703366 (= res!467346 (not (contains!3846 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703367 () Bool)

(declare-fun res!467342 () Bool)

(assert (=> b!703367 (=> (not res!467342) (not e!397450))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!703367 (= res!467342 (validKeyInArray!0 k0!2824))))

(declare-fun b!703368 () Bool)

(declare-fun res!467338 () Bool)

(assert (=> b!703368 (=> (not res!467338) (not e!397450))))

(declare-fun -!273 (List!13324 (_ BitVec 64)) List!13324)

(assert (=> b!703368 (= res!467338 (= (-!273 newAcc!49 k0!2824) acc!652))))

(declare-fun b!703369 () Bool)

(declare-fun res!467340 () Bool)

(assert (=> b!703369 (=> (not res!467340) (not e!397450))))

(declare-fun arrayNoDuplicates!0 (array!40176 (_ BitVec 32) List!13324) Bool)

(assert (=> b!703369 (= res!467340 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!703370 () Bool)

(declare-fun res!467331 () Bool)

(assert (=> b!703370 (=> (not res!467331) (not e!397450))))

(assert (=> b!703370 (= res!467331 (not (contains!3846 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703371 () Bool)

(declare-fun res!467345 () Bool)

(assert (=> b!703371 (=> (not res!467345) (not e!397450))))

(assert (=> b!703371 (= res!467345 (not (contains!3846 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703372 () Bool)

(declare-fun res!467341 () Bool)

(assert (=> b!703372 (=> (not res!467341) (not e!397450))))

(assert (=> b!703372 (= res!467341 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!703373 () Bool)

(declare-fun res!467333 () Bool)

(assert (=> b!703373 (=> (not res!467333) (not e!397450))))

(assert (=> b!703373 (= res!467333 (not (contains!3846 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703374 () Bool)

(declare-fun res!467335 () Bool)

(assert (=> b!703374 (=> (not res!467335) (not e!397450))))

(assert (=> b!703374 (= res!467335 (not (validKeyInArray!0 (select (arr!19244 a!3591) from!2969))))))

(declare-fun b!703375 () Bool)

(declare-fun res!467339 () Bool)

(assert (=> b!703375 (=> (not res!467339) (not e!397450))))

(declare-fun subseq!308 (List!13324 List!13324) Bool)

(assert (=> b!703375 (= res!467339 (subseq!308 acc!652 newAcc!49))))

(declare-fun b!703376 () Bool)

(assert (=> b!703376 (= e!397450 false)))

(declare-fun lt!317547 () Bool)

(assert (=> b!703376 (= lt!317547 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!703377 () Bool)

(declare-fun res!467343 () Bool)

(assert (=> b!703377 (=> (not res!467343) (not e!397450))))

(assert (=> b!703377 (= res!467343 (contains!3846 newAcc!49 k0!2824))))

(assert (= (and start!62486 res!467336) b!703360))

(assert (= (and b!703360 res!467347) b!703365))

(assert (= (and b!703365 res!467330) b!703373))

(assert (= (and b!703373 res!467333) b!703371))

(assert (= (and b!703371 res!467345) b!703372))

(assert (= (and b!703372 res!467341) b!703362))

(assert (= (and b!703362 res!467344) b!703367))

(assert (= (and b!703367 res!467342) b!703369))

(assert (= (and b!703369 res!467340) b!703375))

(assert (= (and b!703375 res!467339) b!703377))

(assert (= (and b!703377 res!467343) b!703368))

(assert (= (and b!703368 res!467338) b!703366))

(assert (= (and b!703366 res!467346) b!703370))

(assert (= (and b!703370 res!467331) b!703364))

(assert (= (and b!703364 res!467337) b!703374))

(assert (= (and b!703374 res!467335) b!703361))

(assert (= (and b!703361 res!467332) b!703363))

(assert (= (and b!703363 res!467334) b!703376))

(declare-fun m!661647 () Bool)

(assert (=> b!703374 m!661647))

(assert (=> b!703374 m!661647))

(declare-fun m!661649 () Bool)

(assert (=> b!703374 m!661649))

(declare-fun m!661651 () Bool)

(assert (=> b!703369 m!661651))

(declare-fun m!661653 () Bool)

(assert (=> b!703376 m!661653))

(declare-fun m!661655 () Bool)

(assert (=> start!62486 m!661655))

(declare-fun m!661657 () Bool)

(assert (=> b!703370 m!661657))

(declare-fun m!661659 () Bool)

(assert (=> b!703360 m!661659))

(declare-fun m!661661 () Bool)

(assert (=> b!703373 m!661661))

(declare-fun m!661663 () Bool)

(assert (=> b!703362 m!661663))

(declare-fun m!661665 () Bool)

(assert (=> b!703377 m!661665))

(declare-fun m!661667 () Bool)

(assert (=> b!703371 m!661667))

(declare-fun m!661669 () Bool)

(assert (=> b!703375 m!661669))

(declare-fun m!661671 () Bool)

(assert (=> b!703368 m!661671))

(declare-fun m!661673 () Bool)

(assert (=> b!703366 m!661673))

(declare-fun m!661675 () Bool)

(assert (=> b!703365 m!661675))

(declare-fun m!661677 () Bool)

(assert (=> b!703363 m!661677))

(declare-fun m!661679 () Bool)

(assert (=> b!703367 m!661679))

(declare-fun m!661681 () Bool)

(assert (=> b!703372 m!661681))

(check-sat (not b!703371) (not b!703377) (not b!703372) (not b!703373) (not b!703365) (not start!62486) (not b!703368) (not b!703367) (not b!703369) (not b!703363) (not b!703362) (not b!703374) (not b!703360) (not b!703376) (not b!703375) (not b!703370) (not b!703366))
(check-sat)
