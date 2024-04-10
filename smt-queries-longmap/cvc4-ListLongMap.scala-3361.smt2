; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46222 () Bool)

(assert start!46222)

(declare-fun b!511820 () Bool)

(declare-fun e!299016 () Bool)

(declare-fun e!299017 () Bool)

(assert (=> b!511820 (= e!299016 (not e!299017))))

(declare-fun res!312487 () Bool)

(assert (=> b!511820 (=> res!312487 e!299017)))

(declare-datatypes ((SeekEntryResult!4282 0))(
  ( (MissingZero!4282 (index!19316 (_ BitVec 32))) (Found!4282 (index!19317 (_ BitVec 32))) (Intermediate!4282 (undefined!5094 Bool) (index!19318 (_ BitVec 32)) (x!48265 (_ BitVec 32))) (Undefined!4282) (MissingVacant!4282 (index!19319 (_ BitVec 32))) )
))
(declare-fun lt!234209 () SeekEntryResult!4282)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32876 0))(
  ( (array!32877 (arr!15815 (Array (_ BitVec 32) (_ BitVec 64))) (size!16179 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32876)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!234214 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32876 (_ BitVec 32)) SeekEntryResult!4282)

(assert (=> b!511820 (= res!312487 (= lt!234209 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234214 (select (store (arr!15815 a!3235) i!1204 k!2280) j!176) (array!32877 (store (arr!15815 a!3235) i!1204 k!2280) (size!16179 a!3235)) mask!3524)))))

(declare-fun lt!234213 () (_ BitVec 32))

(assert (=> b!511820 (= lt!234209 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234213 (select (arr!15815 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511820 (= lt!234214 (toIndex!0 (select (store (arr!15815 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!511820 (= lt!234213 (toIndex!0 (select (arr!15815 a!3235) j!176) mask!3524))))

(declare-fun lt!234212 () SeekEntryResult!4282)

(assert (=> b!511820 (= lt!234212 (Found!4282 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32876 (_ BitVec 32)) SeekEntryResult!4282)

(assert (=> b!511820 (= lt!234212 (seekEntryOrOpen!0 (select (arr!15815 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32876 (_ BitVec 32)) Bool)

(assert (=> b!511820 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15822 0))(
  ( (Unit!15823) )
))
(declare-fun lt!234210 () Unit!15822)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32876 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15822)

(assert (=> b!511820 (= lt!234210 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511821 () Bool)

(declare-fun res!312486 () Bool)

(assert (=> b!511821 (=> (not res!312486) (not e!299016))))

(assert (=> b!511821 (= res!312486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511822 () Bool)

(declare-fun res!312485 () Bool)

(declare-fun e!299018 () Bool)

(assert (=> b!511822 (=> (not res!312485) (not e!299018))))

(assert (=> b!511822 (= res!312485 (and (= (size!16179 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16179 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16179 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!312491 () Bool)

(assert (=> start!46222 (=> (not res!312491) (not e!299018))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46222 (= res!312491 (validMask!0 mask!3524))))

(assert (=> start!46222 e!299018))

(assert (=> start!46222 true))

(declare-fun array_inv!11611 (array!32876) Bool)

(assert (=> start!46222 (array_inv!11611 a!3235)))

(declare-fun b!511823 () Bool)

(declare-fun res!312490 () Bool)

(assert (=> b!511823 (=> (not res!312490) (not e!299018))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511823 (= res!312490 (validKeyInArray!0 (select (arr!15815 a!3235) j!176)))))

(declare-fun b!511824 () Bool)

(declare-fun res!312488 () Bool)

(assert (=> b!511824 (=> (not res!312488) (not e!299018))))

(assert (=> b!511824 (= res!312488 (validKeyInArray!0 k!2280))))

(declare-fun b!511825 () Bool)

(declare-fun res!312489 () Bool)

(assert (=> b!511825 (=> (not res!312489) (not e!299018))))

(declare-fun arrayContainsKey!0 (array!32876 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511825 (= res!312489 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511826 () Bool)

(assert (=> b!511826 (= e!299018 e!299016)))

(declare-fun res!312484 () Bool)

(assert (=> b!511826 (=> (not res!312484) (not e!299016))))

(declare-fun lt!234211 () SeekEntryResult!4282)

(assert (=> b!511826 (= res!312484 (or (= lt!234211 (MissingZero!4282 i!1204)) (= lt!234211 (MissingVacant!4282 i!1204))))))

(assert (=> b!511826 (= lt!234211 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!511827 () Bool)

(declare-fun res!312482 () Bool)

(assert (=> b!511827 (=> res!312482 e!299017)))

(assert (=> b!511827 (= res!312482 (or (not (is-Intermediate!4282 lt!234209)) (not (undefined!5094 lt!234209))))))

(declare-fun b!511828 () Bool)

(assert (=> b!511828 (= e!299017 true)))

(assert (=> b!511828 (= lt!234212 Undefined!4282)))

(declare-fun b!511829 () Bool)

(declare-fun res!312483 () Bool)

(assert (=> b!511829 (=> (not res!312483) (not e!299016))))

(declare-datatypes ((List!9973 0))(
  ( (Nil!9970) (Cons!9969 (h!10849 (_ BitVec 64)) (t!16201 List!9973)) )
))
(declare-fun arrayNoDuplicates!0 (array!32876 (_ BitVec 32) List!9973) Bool)

(assert (=> b!511829 (= res!312483 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9970))))

(assert (= (and start!46222 res!312491) b!511822))

(assert (= (and b!511822 res!312485) b!511823))

(assert (= (and b!511823 res!312490) b!511824))

(assert (= (and b!511824 res!312488) b!511825))

(assert (= (and b!511825 res!312489) b!511826))

(assert (= (and b!511826 res!312484) b!511821))

(assert (= (and b!511821 res!312486) b!511829))

(assert (= (and b!511829 res!312483) b!511820))

(assert (= (and b!511820 (not res!312487)) b!511827))

(assert (= (and b!511827 (not res!312482)) b!511828))

(declare-fun m!493353 () Bool)

(assert (=> b!511820 m!493353))

(declare-fun m!493355 () Bool)

(assert (=> b!511820 m!493355))

(declare-fun m!493357 () Bool)

(assert (=> b!511820 m!493357))

(declare-fun m!493359 () Bool)

(assert (=> b!511820 m!493359))

(declare-fun m!493361 () Bool)

(assert (=> b!511820 m!493361))

(assert (=> b!511820 m!493353))

(declare-fun m!493363 () Bool)

(assert (=> b!511820 m!493363))

(assert (=> b!511820 m!493353))

(declare-fun m!493365 () Bool)

(assert (=> b!511820 m!493365))

(assert (=> b!511820 m!493353))

(declare-fun m!493367 () Bool)

(assert (=> b!511820 m!493367))

(assert (=> b!511820 m!493361))

(declare-fun m!493369 () Bool)

(assert (=> b!511820 m!493369))

(assert (=> b!511820 m!493361))

(declare-fun m!493371 () Bool)

(assert (=> b!511820 m!493371))

(assert (=> b!511823 m!493353))

(assert (=> b!511823 m!493353))

(declare-fun m!493373 () Bool)

(assert (=> b!511823 m!493373))

(declare-fun m!493375 () Bool)

(assert (=> b!511829 m!493375))

(declare-fun m!493377 () Bool)

(assert (=> b!511825 m!493377))

(declare-fun m!493379 () Bool)

(assert (=> b!511821 m!493379))

(declare-fun m!493381 () Bool)

(assert (=> b!511826 m!493381))

(declare-fun m!493383 () Bool)

(assert (=> start!46222 m!493383))

(declare-fun m!493385 () Bool)

(assert (=> start!46222 m!493385))

(declare-fun m!493387 () Bool)

(assert (=> b!511824 m!493387))

(push 1)

