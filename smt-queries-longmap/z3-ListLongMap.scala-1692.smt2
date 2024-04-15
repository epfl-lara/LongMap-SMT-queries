; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31026 () Bool)

(assert start!31026)

(declare-fun b!311862 () Bool)

(declare-fun res!168464 () Bool)

(declare-fun e!194495 () Bool)

(assert (=> b!311862 (=> (not res!168464) (not e!194495))))

(declare-datatypes ((array!15932 0))(
  ( (array!15933 (arr!7548 (Array (_ BitVec 32) (_ BitVec 64))) (size!7901 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15932)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15932 (_ BitVec 32)) Bool)

(assert (=> b!311862 (= res!168464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311863 () Bool)

(declare-fun e!194492 () Bool)

(declare-fun e!194493 () Bool)

(assert (=> b!311863 (= e!194492 (not e!194493))))

(declare-fun res!168471 () Bool)

(assert (=> b!311863 (=> res!168471 e!194493)))

(declare-datatypes ((SeekEntryResult!2687 0))(
  ( (MissingZero!2687 (index!12924 (_ BitVec 32))) (Found!2687 (index!12925 (_ BitVec 32))) (Intermediate!2687 (undefined!3499 Bool) (index!12926 (_ BitVec 32)) (x!31151 (_ BitVec 32))) (Undefined!2687) (MissingVacant!2687 (index!12927 (_ BitVec 32))) )
))
(declare-fun lt!152557 () SeekEntryResult!2687)

(declare-fun lt!152553 () SeekEntryResult!2687)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!152554 () (_ BitVec 32))

(assert (=> b!311863 (= res!168471 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152554 #b00000000000000000000000000000000) (bvsge lt!152554 (size!7901 a!3293)) (not (= lt!152557 lt!152553))))))

(declare-fun lt!152558 () SeekEntryResult!2687)

(declare-fun lt!152552 () SeekEntryResult!2687)

(assert (=> b!311863 (= lt!152558 lt!152552)))

(declare-fun lt!152555 () array!15932)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15932 (_ BitVec 32)) SeekEntryResult!2687)

(assert (=> b!311863 (= lt!152552 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152554 k0!2441 lt!152555 mask!3709))))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311863 (= lt!152558 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152555 mask!3709))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311863 (= lt!152555 (array!15933 (store (arr!7548 a!3293) i!1240 k0!2441) (size!7901 a!3293)))))

(declare-fun lt!152556 () SeekEntryResult!2687)

(assert (=> b!311863 (= lt!152556 lt!152557)))

(assert (=> b!311863 (= lt!152557 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152554 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311863 (= lt!152554 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun res!168465 () Bool)

(assert (=> start!31026 (=> (not res!168465) (not e!194495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31026 (= res!168465 (validMask!0 mask!3709))))

(assert (=> start!31026 e!194495))

(declare-fun array_inv!5520 (array!15932) Bool)

(assert (=> start!31026 (array_inv!5520 a!3293)))

(assert (=> start!31026 true))

(declare-fun b!311864 () Bool)

(assert (=> b!311864 (= e!194493 (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110)))))

(assert (=> b!311864 (= lt!152552 lt!152557)))

(declare-datatypes ((Unit!9577 0))(
  ( (Unit!9578) )
))
(declare-fun lt!152551 () Unit!9577)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15932 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9577)

(assert (=> b!311864 (= lt!152551 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152554 resIndex!52 resX!52 mask!3709))))

(declare-fun b!311865 () Bool)

(declare-fun res!168467 () Bool)

(assert (=> b!311865 (=> (not res!168467) (not e!194495))))

(assert (=> b!311865 (= res!168467 (and (= (size!7901 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7901 a!3293))))))

(declare-fun b!311866 () Bool)

(declare-fun e!194491 () Bool)

(assert (=> b!311866 (= e!194491 e!194492)))

(declare-fun res!168469 () Bool)

(assert (=> b!311866 (=> (not res!168469) (not e!194492))))

(assert (=> b!311866 (= res!168469 (and (= lt!152556 lt!152553) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7548 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311866 (= lt!152556 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311867 () Bool)

(declare-fun res!168463 () Bool)

(assert (=> b!311867 (=> (not res!168463) (not e!194495))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311867 (= res!168463 (validKeyInArray!0 k0!2441))))

(declare-fun b!311868 () Bool)

(declare-fun res!168462 () Bool)

(assert (=> b!311868 (=> (not res!168462) (not e!194495))))

(declare-fun arrayContainsKey!0 (array!15932 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311868 (= res!168462 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311869 () Bool)

(declare-fun res!168466 () Bool)

(assert (=> b!311869 (=> (not res!168466) (not e!194491))))

(assert (=> b!311869 (= res!168466 (and (= (select (arr!7548 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7901 a!3293))))))

(declare-fun b!311870 () Bool)

(assert (=> b!311870 (= e!194495 e!194491)))

(declare-fun res!168468 () Bool)

(assert (=> b!311870 (=> (not res!168468) (not e!194491))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311870 (= res!168468 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152553))))

(assert (=> b!311870 (= lt!152553 (Intermediate!2687 false resIndex!52 resX!52))))

(declare-fun b!311871 () Bool)

(declare-fun res!168470 () Bool)

(assert (=> b!311871 (=> (not res!168470) (not e!194495))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15932 (_ BitVec 32)) SeekEntryResult!2687)

(assert (=> b!311871 (= res!168470 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2687 i!1240)))))

(assert (= (and start!31026 res!168465) b!311865))

(assert (= (and b!311865 res!168467) b!311867))

(assert (= (and b!311867 res!168463) b!311868))

(assert (= (and b!311868 res!168462) b!311871))

(assert (= (and b!311871 res!168470) b!311862))

(assert (= (and b!311862 res!168464) b!311870))

(assert (= (and b!311870 res!168468) b!311869))

(assert (= (and b!311869 res!168466) b!311866))

(assert (= (and b!311866 res!168469) b!311863))

(assert (= (and b!311863 (not res!168471)) b!311864))

(declare-fun m!321451 () Bool)

(assert (=> b!311864 m!321451))

(declare-fun m!321453 () Bool)

(assert (=> b!311866 m!321453))

(declare-fun m!321455 () Bool)

(assert (=> b!311866 m!321455))

(declare-fun m!321457 () Bool)

(assert (=> b!311869 m!321457))

(declare-fun m!321459 () Bool)

(assert (=> b!311870 m!321459))

(assert (=> b!311870 m!321459))

(declare-fun m!321461 () Bool)

(assert (=> b!311870 m!321461))

(declare-fun m!321463 () Bool)

(assert (=> b!311863 m!321463))

(declare-fun m!321465 () Bool)

(assert (=> b!311863 m!321465))

(declare-fun m!321467 () Bool)

(assert (=> b!311863 m!321467))

(declare-fun m!321469 () Bool)

(assert (=> b!311863 m!321469))

(declare-fun m!321471 () Bool)

(assert (=> b!311863 m!321471))

(declare-fun m!321473 () Bool)

(assert (=> b!311868 m!321473))

(declare-fun m!321475 () Bool)

(assert (=> b!311867 m!321475))

(declare-fun m!321477 () Bool)

(assert (=> b!311871 m!321477))

(declare-fun m!321479 () Bool)

(assert (=> start!31026 m!321479))

(declare-fun m!321481 () Bool)

(assert (=> start!31026 m!321481))

(declare-fun m!321483 () Bool)

(assert (=> b!311862 m!321483))

(check-sat (not b!311864) (not b!311862) (not b!311867) (not b!311866) (not start!31026) (not b!311863) (not b!311871) (not b!311870) (not b!311868))
(check-sat)
