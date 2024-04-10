; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30602 () Bool)

(assert start!30602)

(declare-fun b!306994 () Bool)

(declare-fun res!163749 () Bool)

(declare-fun e!192376 () Bool)

(assert (=> b!306994 (=> (not res!163749) (not e!192376))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((array!15606 0))(
  ( (array!15607 (arr!7388 (Array (_ BitVec 32) (_ BitVec 64))) (size!7740 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15606)

(assert (=> b!306994 (= res!163749 (and (= (size!7740 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7740 a!3293))))))

(declare-fun res!163753 () Bool)

(assert (=> start!30602 (=> (not res!163753) (not e!192376))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30602 (= res!163753 (validMask!0 mask!3709))))

(assert (=> start!30602 e!192376))

(declare-fun array_inv!5351 (array!15606) Bool)

(assert (=> start!30602 (array_inv!5351 a!3293)))

(assert (=> start!30602 true))

(declare-fun b!306995 () Bool)

(declare-fun res!163748 () Bool)

(assert (=> b!306995 (=> (not res!163748) (not e!192376))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!306995 (= res!163748 (and (= (select (arr!7388 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7740 a!3293))))))

(declare-fun b!306996 () Bool)

(declare-fun res!163751 () Bool)

(assert (=> b!306996 (=> (not res!163751) (not e!192376))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2528 0))(
  ( (MissingZero!2528 (index!12288 (_ BitVec 32))) (Found!2528 (index!12289 (_ BitVec 32))) (Intermediate!2528 (undefined!3340 Bool) (index!12290 (_ BitVec 32)) (x!30539 (_ BitVec 32))) (Undefined!2528) (MissingVacant!2528 (index!12291 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15606 (_ BitVec 32)) SeekEntryResult!2528)

(assert (=> b!306996 (= res!163751 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2528 i!1240)))))

(declare-fun b!306997 () Bool)

(assert (=> b!306997 (= e!192376 false)))

(declare-fun lt!151080 () SeekEntryResult!2528)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15606 (_ BitVec 32)) SeekEntryResult!2528)

(assert (=> b!306997 (= lt!151080 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!306998 () Bool)

(declare-fun res!163752 () Bool)

(assert (=> b!306998 (=> (not res!163752) (not e!192376))))

(declare-fun arrayContainsKey!0 (array!15606 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306998 (= res!163752 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306999 () Bool)

(declare-fun res!163755 () Bool)

(assert (=> b!306999 (=> (not res!163755) (not e!192376))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306999 (= res!163755 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2528 false resIndex!52 resX!52)))))

(declare-fun b!307000 () Bool)

(declare-fun res!163750 () Bool)

(assert (=> b!307000 (=> (not res!163750) (not e!192376))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307000 (= res!163750 (validKeyInArray!0 k!2441))))

(declare-fun b!307001 () Bool)

(declare-fun res!163754 () Bool)

(assert (=> b!307001 (=> (not res!163754) (not e!192376))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15606 (_ BitVec 32)) Bool)

(assert (=> b!307001 (= res!163754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30602 res!163753) b!306994))

(assert (= (and b!306994 res!163749) b!307000))

(assert (= (and b!307000 res!163750) b!306998))

(assert (= (and b!306998 res!163752) b!306996))

(assert (= (and b!306996 res!163751) b!307001))

(assert (= (and b!307001 res!163754) b!306999))

(assert (= (and b!306999 res!163755) b!306995))

(assert (= (and b!306995 res!163748) b!306997))

(declare-fun m!317381 () Bool)

(assert (=> b!307001 m!317381))

(declare-fun m!317383 () Bool)

(assert (=> b!306996 m!317383))

(declare-fun m!317385 () Bool)

(assert (=> b!307000 m!317385))

(declare-fun m!317387 () Bool)

(assert (=> b!306999 m!317387))

(assert (=> b!306999 m!317387))

(declare-fun m!317389 () Bool)

(assert (=> b!306999 m!317389))

(declare-fun m!317391 () Bool)

(assert (=> b!306998 m!317391))

(declare-fun m!317393 () Bool)

(assert (=> b!306995 m!317393))

(declare-fun m!317395 () Bool)

(assert (=> b!306997 m!317395))

(declare-fun m!317397 () Bool)

(assert (=> start!30602 m!317397))

(declare-fun m!317399 () Bool)

(assert (=> start!30602 m!317399))

(push 1)

(assert (not b!306999))

(assert (not b!306997))

(assert (not start!30602))

(assert (not b!306998))

(assert (not b!307001))

(assert (not b!307000))

(assert (not b!306996))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

