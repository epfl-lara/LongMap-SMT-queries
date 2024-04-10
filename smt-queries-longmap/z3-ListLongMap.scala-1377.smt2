; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27116 () Bool)

(assert start!27116)

(declare-fun b!280376 () Bool)

(declare-fun res!143455 () Bool)

(declare-fun e!178524 () Bool)

(assert (=> b!280376 (=> (not res!143455) (not e!178524))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280376 (= res!143455 (not (= startIndex!26 i!1267)))))

(declare-fun b!280377 () Bool)

(declare-fun res!143452 () Bool)

(declare-fun e!178526 () Bool)

(assert (=> b!280377 (=> (not res!143452) (not e!178526))))

(declare-datatypes ((array!13934 0))(
  ( (array!13935 (arr!6609 (Array (_ BitVec 32) (_ BitVec 64))) (size!6961 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13934)

(declare-datatypes ((List!4417 0))(
  ( (Nil!4414) (Cons!4413 (h!5083 (_ BitVec 64)) (t!9499 List!4417)) )
))
(declare-fun arrayNoDuplicates!0 (array!13934 (_ BitVec 32) List!4417) Bool)

(assert (=> b!280377 (= res!143452 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4414))))

(declare-fun b!280378 () Bool)

(declare-fun res!143457 () Bool)

(assert (=> b!280378 (=> (not res!143457) (not e!178524))))

(declare-fun noDuplicate!171 (List!4417) Bool)

(assert (=> b!280378 (= res!143457 (noDuplicate!171 Nil!4414))))

(declare-fun b!280379 () Bool)

(declare-fun res!143456 () Bool)

(assert (=> b!280379 (=> (not res!143456) (not e!178526))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13934 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280379 (= res!143456 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!143448 () Bool)

(assert (=> start!27116 (=> (not res!143448) (not e!178526))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27116 (= res!143448 (validMask!0 mask!3868))))

(assert (=> start!27116 e!178526))

(declare-fun array_inv!4572 (array!13934) Bool)

(assert (=> start!27116 (array_inv!4572 a!3325)))

(assert (=> start!27116 true))

(declare-fun b!280380 () Bool)

(declare-fun res!143450 () Bool)

(assert (=> b!280380 (=> (not res!143450) (not e!178526))))

(assert (=> b!280380 (= res!143450 (and (= (size!6961 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6961 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6961 a!3325))))))

(declare-fun b!280381 () Bool)

(declare-fun res!143447 () Bool)

(assert (=> b!280381 (=> (not res!143447) (not e!178524))))

(declare-fun contains!1989 (List!4417 (_ BitVec 64)) Bool)

(assert (=> b!280381 (= res!143447 (not (contains!1989 Nil!4414 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!280382 () Bool)

(declare-fun res!143451 () Bool)

(assert (=> b!280382 (=> (not res!143451) (not e!178524))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280382 (= res!143451 (validKeyInArray!0 (select (arr!6609 a!3325) startIndex!26)))))

(declare-fun b!280383 () Bool)

(declare-fun res!143446 () Bool)

(assert (=> b!280383 (=> (not res!143446) (not e!178524))))

(assert (=> b!280383 (= res!143446 (and (bvslt (size!6961 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6961 a!3325))))))

(declare-fun b!280384 () Bool)

(declare-fun res!143445 () Bool)

(assert (=> b!280384 (=> (not res!143445) (not e!178524))))

(assert (=> b!280384 (= res!143445 (not (contains!1989 Nil!4414 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!280385 () Bool)

(assert (=> b!280385 (= e!178524 false)))

(declare-fun lt!138816 () Bool)

(assert (=> b!280385 (= lt!138816 (contains!1989 Nil!4414 k0!2581))))

(declare-fun b!280386 () Bool)

(declare-fun res!143453 () Bool)

(assert (=> b!280386 (=> (not res!143453) (not e!178524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13934 (_ BitVec 32)) Bool)

(assert (=> b!280386 (= res!143453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280387 () Bool)

(assert (=> b!280387 (= e!178526 e!178524)))

(declare-fun res!143449 () Bool)

(assert (=> b!280387 (=> (not res!143449) (not e!178524))))

(declare-datatypes ((SeekEntryResult!1767 0))(
  ( (MissingZero!1767 (index!9238 (_ BitVec 32))) (Found!1767 (index!9239 (_ BitVec 32))) (Intermediate!1767 (undefined!2579 Bool) (index!9240 (_ BitVec 32)) (x!27477 (_ BitVec 32))) (Undefined!1767) (MissingVacant!1767 (index!9241 (_ BitVec 32))) )
))
(declare-fun lt!138817 () SeekEntryResult!1767)

(assert (=> b!280387 (= res!143449 (or (= lt!138817 (MissingZero!1767 i!1267)) (= lt!138817 (MissingVacant!1767 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13934 (_ BitVec 32)) SeekEntryResult!1767)

(assert (=> b!280387 (= lt!138817 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!280388 () Bool)

(declare-fun res!143454 () Bool)

(assert (=> b!280388 (=> (not res!143454) (not e!178526))))

(assert (=> b!280388 (= res!143454 (validKeyInArray!0 k0!2581))))

(assert (= (and start!27116 res!143448) b!280380))

(assert (= (and b!280380 res!143450) b!280388))

(assert (= (and b!280388 res!143454) b!280377))

(assert (= (and b!280377 res!143452) b!280379))

(assert (= (and b!280379 res!143456) b!280387))

(assert (= (and b!280387 res!143449) b!280386))

(assert (= (and b!280386 res!143453) b!280376))

(assert (= (and b!280376 res!143455) b!280382))

(assert (= (and b!280382 res!143451) b!280383))

(assert (= (and b!280383 res!143446) b!280378))

(assert (= (and b!280378 res!143457) b!280381))

(assert (= (and b!280381 res!143447) b!280384))

(assert (= (and b!280384 res!143445) b!280385))

(declare-fun m!294827 () Bool)

(assert (=> start!27116 m!294827))

(declare-fun m!294829 () Bool)

(assert (=> start!27116 m!294829))

(declare-fun m!294831 () Bool)

(assert (=> b!280377 m!294831))

(declare-fun m!294833 () Bool)

(assert (=> b!280387 m!294833))

(declare-fun m!294835 () Bool)

(assert (=> b!280379 m!294835))

(declare-fun m!294837 () Bool)

(assert (=> b!280388 m!294837))

(declare-fun m!294839 () Bool)

(assert (=> b!280378 m!294839))

(declare-fun m!294841 () Bool)

(assert (=> b!280384 m!294841))

(declare-fun m!294843 () Bool)

(assert (=> b!280386 m!294843))

(declare-fun m!294845 () Bool)

(assert (=> b!280381 m!294845))

(declare-fun m!294847 () Bool)

(assert (=> b!280385 m!294847))

(declare-fun m!294849 () Bool)

(assert (=> b!280382 m!294849))

(assert (=> b!280382 m!294849))

(declare-fun m!294851 () Bool)

(assert (=> b!280382 m!294851))

(check-sat (not b!280379) (not b!280377) (not b!280382) (not b!280385) (not b!280378) (not start!27116) (not b!280386) (not b!280388) (not b!280381) (not b!280387) (not b!280384))
(check-sat)
