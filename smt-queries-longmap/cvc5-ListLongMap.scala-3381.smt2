; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46698 () Bool)

(assert start!46698)

(declare-fun b!515380 () Bool)

(declare-fun e!300921 () Bool)

(assert (=> b!515380 (= e!300921 true)))

(declare-datatypes ((SeekEntryResult!4340 0))(
  ( (MissingZero!4340 (index!19548 (_ BitVec 32))) (Found!4340 (index!19549 (_ BitVec 32))) (Intermediate!4340 (undefined!5152 Bool) (index!19550 (_ BitVec 32)) (x!48519 (_ BitVec 32))) (Undefined!4340) (MissingVacant!4340 (index!19551 (_ BitVec 32))) )
))
(declare-fun lt!235938 () SeekEntryResult!4340)

(declare-datatypes ((array!33010 0))(
  ( (array!33011 (arr!15873 (Array (_ BitVec 32) (_ BitVec 64))) (size!16237 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33010)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!515380 (and (bvslt (x!48519 lt!235938) #b01111111111111111111111111111110) (or (= (select (arr!15873 a!3235) (index!19550 lt!235938)) (select (arr!15873 a!3235) j!176)) (= (select (arr!15873 a!3235) (index!19550 lt!235938)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15873 a!3235) (index!19550 lt!235938)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515381 () Bool)

(declare-fun res!314954 () Bool)

(declare-fun e!300922 () Bool)

(assert (=> b!515381 (=> (not res!314954) (not e!300922))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33010 (_ BitVec 32)) Bool)

(assert (=> b!515381 (= res!314954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515382 () Bool)

(declare-fun res!314946 () Bool)

(declare-fun e!300923 () Bool)

(assert (=> b!515382 (=> (not res!314946) (not e!300923))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515382 (= res!314946 (validKeyInArray!0 k!2280))))

(declare-fun b!515383 () Bool)

(declare-fun e!300924 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33010 (_ BitVec 32)) SeekEntryResult!4340)

(assert (=> b!515383 (= e!300924 (= (seekEntryOrOpen!0 (select (arr!15873 a!3235) j!176) a!3235 mask!3524) (Found!4340 j!176)))))

(declare-fun b!515384 () Bool)

(assert (=> b!515384 (= e!300922 (not e!300921))))

(declare-fun res!314949 () Bool)

(assert (=> b!515384 (=> res!314949 e!300921)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!235936 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33010 (_ BitVec 32)) SeekEntryResult!4340)

(assert (=> b!515384 (= res!314949 (= lt!235938 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235936 (select (store (arr!15873 a!3235) i!1204 k!2280) j!176) (array!33011 (store (arr!15873 a!3235) i!1204 k!2280) (size!16237 a!3235)) mask!3524)))))

(declare-fun lt!235937 () (_ BitVec 32))

(assert (=> b!515384 (= lt!235938 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235937 (select (arr!15873 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515384 (= lt!235936 (toIndex!0 (select (store (arr!15873 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!515384 (= lt!235937 (toIndex!0 (select (arr!15873 a!3235) j!176) mask!3524))))

(assert (=> b!515384 e!300924))

(declare-fun res!314948 () Bool)

(assert (=> b!515384 (=> (not res!314948) (not e!300924))))

(assert (=> b!515384 (= res!314948 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15938 0))(
  ( (Unit!15939) )
))
(declare-fun lt!235935 () Unit!15938)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33010 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15938)

(assert (=> b!515384 (= lt!235935 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515386 () Bool)

(assert (=> b!515386 (= e!300923 e!300922)))

(declare-fun res!314952 () Bool)

(assert (=> b!515386 (=> (not res!314952) (not e!300922))))

(declare-fun lt!235939 () SeekEntryResult!4340)

(assert (=> b!515386 (= res!314952 (or (= lt!235939 (MissingZero!4340 i!1204)) (= lt!235939 (MissingVacant!4340 i!1204))))))

(assert (=> b!515386 (= lt!235939 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!515387 () Bool)

(declare-fun res!314945 () Bool)

(assert (=> b!515387 (=> (not res!314945) (not e!300922))))

(declare-datatypes ((List!10031 0))(
  ( (Nil!10028) (Cons!10027 (h!10925 (_ BitVec 64)) (t!16259 List!10031)) )
))
(declare-fun arrayNoDuplicates!0 (array!33010 (_ BitVec 32) List!10031) Bool)

(assert (=> b!515387 (= res!314945 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10028))))

(declare-fun b!515388 () Bool)

(declare-fun res!314950 () Bool)

(assert (=> b!515388 (=> (not res!314950) (not e!300923))))

(assert (=> b!515388 (= res!314950 (and (= (size!16237 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16237 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16237 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515385 () Bool)

(declare-fun res!314947 () Bool)

(assert (=> b!515385 (=> res!314947 e!300921)))

(assert (=> b!515385 (= res!314947 (or (undefined!5152 lt!235938) (not (is-Intermediate!4340 lt!235938))))))

(declare-fun res!314953 () Bool)

(assert (=> start!46698 (=> (not res!314953) (not e!300923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46698 (= res!314953 (validMask!0 mask!3524))))

(assert (=> start!46698 e!300923))

(assert (=> start!46698 true))

(declare-fun array_inv!11669 (array!33010) Bool)

(assert (=> start!46698 (array_inv!11669 a!3235)))

(declare-fun b!515389 () Bool)

(declare-fun res!314951 () Bool)

(assert (=> b!515389 (=> (not res!314951) (not e!300923))))

(assert (=> b!515389 (= res!314951 (validKeyInArray!0 (select (arr!15873 a!3235) j!176)))))

(declare-fun b!515390 () Bool)

(declare-fun res!314944 () Bool)

(assert (=> b!515390 (=> (not res!314944) (not e!300923))))

(declare-fun arrayContainsKey!0 (array!33010 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515390 (= res!314944 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!46698 res!314953) b!515388))

(assert (= (and b!515388 res!314950) b!515389))

(assert (= (and b!515389 res!314951) b!515382))

(assert (= (and b!515382 res!314946) b!515390))

(assert (= (and b!515390 res!314944) b!515386))

(assert (= (and b!515386 res!314952) b!515381))

(assert (= (and b!515381 res!314954) b!515387))

(assert (= (and b!515387 res!314945) b!515384))

(assert (= (and b!515384 res!314948) b!515383))

(assert (= (and b!515384 (not res!314949)) b!515385))

(assert (= (and b!515385 (not res!314947)) b!515380))

(declare-fun m!496707 () Bool)

(assert (=> b!515390 m!496707))

(declare-fun m!496709 () Bool)

(assert (=> b!515387 m!496709))

(declare-fun m!496711 () Bool)

(assert (=> b!515382 m!496711))

(declare-fun m!496713 () Bool)

(assert (=> start!46698 m!496713))

(declare-fun m!496715 () Bool)

(assert (=> start!46698 m!496715))

(declare-fun m!496717 () Bool)

(assert (=> b!515380 m!496717))

(declare-fun m!496719 () Bool)

(assert (=> b!515380 m!496719))

(assert (=> b!515389 m!496719))

(assert (=> b!515389 m!496719))

(declare-fun m!496721 () Bool)

(assert (=> b!515389 m!496721))

(declare-fun m!496723 () Bool)

(assert (=> b!515386 m!496723))

(assert (=> b!515383 m!496719))

(assert (=> b!515383 m!496719))

(declare-fun m!496725 () Bool)

(assert (=> b!515383 m!496725))

(assert (=> b!515384 m!496719))

(declare-fun m!496727 () Bool)

(assert (=> b!515384 m!496727))

(declare-fun m!496729 () Bool)

(assert (=> b!515384 m!496729))

(declare-fun m!496731 () Bool)

(assert (=> b!515384 m!496731))

(declare-fun m!496733 () Bool)

(assert (=> b!515384 m!496733))

(assert (=> b!515384 m!496733))

(declare-fun m!496735 () Bool)

(assert (=> b!515384 m!496735))

(assert (=> b!515384 m!496719))

(declare-fun m!496737 () Bool)

(assert (=> b!515384 m!496737))

(assert (=> b!515384 m!496719))

(declare-fun m!496739 () Bool)

(assert (=> b!515384 m!496739))

(assert (=> b!515384 m!496733))

(declare-fun m!496741 () Bool)

(assert (=> b!515384 m!496741))

(declare-fun m!496743 () Bool)

(assert (=> b!515381 m!496743))

(push 1)

