; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29150 () Bool)

(assert start!29150)

(declare-fun b!295750 () Bool)

(declare-fun e!186929 () Bool)

(declare-fun e!186928 () Bool)

(assert (=> b!295750 (= e!186929 e!186928)))

(declare-fun res!155559 () Bool)

(assert (=> b!295750 (=> (not res!155559) (not e!186928))))

(declare-datatypes ((SeekEntryResult!2236 0))(
  ( (MissingZero!2236 (index!11114 (_ BitVec 32))) (Found!2236 (index!11115 (_ BitVec 32))) (Intermediate!2236 (undefined!3048 Bool) (index!11116 (_ BitVec 32)) (x!29328 (_ BitVec 32))) (Undefined!2236) (MissingVacant!2236 (index!11117 (_ BitVec 32))) )
))
(declare-fun lt!146701 () SeekEntryResult!2236)

(declare-fun lt!146702 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!295750 (= res!155559 (or lt!146702 (= lt!146701 (MissingVacant!2236 i!1256))))))

(assert (=> b!295750 (= lt!146702 (= lt!146701 (MissingZero!2236 i!1256)))))

(declare-datatypes ((array!14953 0))(
  ( (array!14954 (arr!7087 (Array (_ BitVec 32) (_ BitVec 64))) (size!7439 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14953)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14953 (_ BitVec 32)) SeekEntryResult!2236)

(assert (=> b!295750 (= lt!146701 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!295751 () Bool)

(declare-fun res!155562 () Bool)

(assert (=> b!295751 (=> (not res!155562) (not e!186929))))

(declare-fun arrayContainsKey!0 (array!14953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295751 (= res!155562 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295752 () Bool)

(declare-fun res!155560 () Bool)

(assert (=> b!295752 (=> (not res!155560) (not e!186928))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14953 (_ BitVec 32)) Bool)

(assert (=> b!295752 (= res!155560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!155563 () Bool)

(assert (=> start!29150 (=> (not res!155563) (not e!186929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29150 (= res!155563 (validMask!0 mask!3809))))

(assert (=> start!29150 e!186929))

(assert (=> start!29150 true))

(declare-fun array_inv!5050 (array!14953) Bool)

(assert (=> start!29150 (array_inv!5050 a!3312)))

(declare-fun b!295753 () Bool)

(declare-fun e!186931 () Bool)

(assert (=> b!295753 (= e!186931 (not true))))

(declare-fun lt!146703 () SeekEntryResult!2236)

(assert (=> b!295753 (and (= (select (arr!7087 a!3312) (index!11116 lt!146703)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11116 lt!146703) i!1256))))

(declare-fun b!295754 () Bool)

(declare-fun res!155558 () Bool)

(assert (=> b!295754 (=> (not res!155558) (not e!186929))))

(assert (=> b!295754 (= res!155558 (and (= (size!7439 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7439 a!3312))))))

(declare-fun b!295755 () Bool)

(declare-fun e!186927 () Bool)

(assert (=> b!295755 (= e!186928 e!186927)))

(declare-fun res!155564 () Bool)

(assert (=> b!295755 (=> (not res!155564) (not e!186927))))

(assert (=> b!295755 (= res!155564 lt!146702)))

(declare-fun lt!146700 () (_ BitVec 32))

(declare-fun lt!146699 () SeekEntryResult!2236)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14953 (_ BitVec 32)) SeekEntryResult!2236)

(assert (=> b!295755 (= lt!146699 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146700 k!2524 (array!14954 (store (arr!7087 a!3312) i!1256 k!2524) (size!7439 a!3312)) mask!3809))))

(assert (=> b!295755 (= lt!146703 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146700 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295755 (= lt!146700 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!295756 () Bool)

(assert (=> b!295756 (= e!186927 e!186931)))

(declare-fun res!155565 () Bool)

(assert (=> b!295756 (=> (not res!155565) (not e!186931))))

(declare-fun lt!146698 () Bool)

(assert (=> b!295756 (= res!155565 (and (or lt!146698 (not (undefined!3048 lt!146703))) (or lt!146698 (not (= (select (arr!7087 a!3312) (index!11116 lt!146703)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146698 (not (= (select (arr!7087 a!3312) (index!11116 lt!146703)) k!2524))) (not lt!146698)))))

(assert (=> b!295756 (= lt!146698 (not (is-Intermediate!2236 lt!146703)))))

(declare-fun b!295757 () Bool)

(declare-fun res!155561 () Bool)

(assert (=> b!295757 (=> (not res!155561) (not e!186929))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295757 (= res!155561 (validKeyInArray!0 k!2524))))

(assert (= (and start!29150 res!155563) b!295754))

(assert (= (and b!295754 res!155558) b!295757))

(assert (= (and b!295757 res!155561) b!295751))

(assert (= (and b!295751 res!155562) b!295750))

(assert (= (and b!295750 res!155559) b!295752))

(assert (= (and b!295752 res!155560) b!295755))

(assert (= (and b!295755 res!155564) b!295756))

(assert (= (and b!295756 res!155565) b!295753))

(declare-fun m!308831 () Bool)

(assert (=> b!295755 m!308831))

(declare-fun m!308833 () Bool)

(assert (=> b!295755 m!308833))

(declare-fun m!308835 () Bool)

(assert (=> b!295755 m!308835))

(declare-fun m!308837 () Bool)

(assert (=> b!295755 m!308837))

(declare-fun m!308839 () Bool)

(assert (=> b!295753 m!308839))

(declare-fun m!308841 () Bool)

(assert (=> start!29150 m!308841))

(declare-fun m!308843 () Bool)

(assert (=> start!29150 m!308843))

(declare-fun m!308845 () Bool)

(assert (=> b!295750 m!308845))

(assert (=> b!295756 m!308839))

(declare-fun m!308847 () Bool)

(assert (=> b!295752 m!308847))

(declare-fun m!308849 () Bool)

(assert (=> b!295757 m!308849))

(declare-fun m!308851 () Bool)

(assert (=> b!295751 m!308851))

(push 1)

