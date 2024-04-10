; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46414 () Bool)

(assert start!46414)

(declare-fun res!313794 () Bool)

(declare-fun e!299848 () Bool)

(assert (=> start!46414 (=> (not res!313794) (not e!299848))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46414 (= res!313794 (validMask!0 mask!3524))))

(assert (=> start!46414 e!299848))

(assert (=> start!46414 true))

(declare-datatypes ((array!32954 0))(
  ( (array!32955 (arr!15851 (Array (_ BitVec 32) (_ BitVec 64))) (size!16215 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32954)

(declare-fun array_inv!11647 (array!32954) Bool)

(assert (=> start!46414 (array_inv!11647 a!3235)))

(declare-fun b!513490 () Bool)

(declare-fun e!299850 () Bool)

(assert (=> b!513490 (= e!299850 true)))

(declare-datatypes ((SeekEntryResult!4318 0))(
  ( (MissingZero!4318 (index!19460 (_ BitVec 32))) (Found!4318 (index!19461 (_ BitVec 32))) (Intermediate!4318 (undefined!5130 Bool) (index!19462 (_ BitVec 32)) (x!48409 (_ BitVec 32))) (Undefined!4318) (MissingVacant!4318 (index!19463 (_ BitVec 32))) )
))
(declare-fun lt!235093 () SeekEntryResult!4318)

(assert (=> b!513490 (bvslt (x!48409 lt!235093) #b01111111111111111111111111111110)))

(declare-fun b!513491 () Bool)

(declare-fun res!313788 () Bool)

(assert (=> b!513491 (=> res!313788 e!299850)))

(assert (=> b!513491 (= res!313788 (or (undefined!5130 lt!235093) (not (is-Intermediate!4318 lt!235093))))))

(declare-fun b!513492 () Bool)

(declare-fun res!313791 () Bool)

(assert (=> b!513492 (=> (not res!313791) (not e!299848))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!513492 (= res!313791 (validKeyInArray!0 k!2280))))

(declare-fun b!513493 () Bool)

(declare-fun res!313796 () Bool)

(assert (=> b!513493 (=> (not res!313796) (not e!299848))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!513493 (= res!313796 (validKeyInArray!0 (select (arr!15851 a!3235) j!176)))))

(declare-fun b!513494 () Bool)

(declare-fun res!313792 () Bool)

(assert (=> b!513494 (=> (not res!313792) (not e!299848))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!513494 (= res!313792 (and (= (size!16215 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16215 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16215 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!513495 () Bool)

(declare-fun res!313789 () Bool)

(declare-fun e!299847 () Bool)

(assert (=> b!513495 (=> (not res!313789) (not e!299847))))

(declare-datatypes ((List!10009 0))(
  ( (Nil!10006) (Cons!10005 (h!10891 (_ BitVec 64)) (t!16237 List!10009)) )
))
(declare-fun arrayNoDuplicates!0 (array!32954 (_ BitVec 32) List!10009) Bool)

(assert (=> b!513495 (= res!313789 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10006))))

(declare-fun b!513496 () Bool)

(assert (=> b!513496 (= e!299847 (not e!299850))))

(declare-fun res!313787 () Bool)

(assert (=> b!513496 (=> res!313787 e!299850)))

(declare-fun lt!235089 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32954 (_ BitVec 32)) SeekEntryResult!4318)

(assert (=> b!513496 (= res!313787 (= lt!235093 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235089 (select (store (arr!15851 a!3235) i!1204 k!2280) j!176) (array!32955 (store (arr!15851 a!3235) i!1204 k!2280) (size!16215 a!3235)) mask!3524)))))

(declare-fun lt!235092 () (_ BitVec 32))

(assert (=> b!513496 (= lt!235093 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235092 (select (arr!15851 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!513496 (= lt!235089 (toIndex!0 (select (store (arr!15851 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!513496 (= lt!235092 (toIndex!0 (select (arr!15851 a!3235) j!176) mask!3524))))

(declare-fun e!299846 () Bool)

(assert (=> b!513496 e!299846))

(declare-fun res!313795 () Bool)

(assert (=> b!513496 (=> (not res!313795) (not e!299846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32954 (_ BitVec 32)) Bool)

(assert (=> b!513496 (= res!313795 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15894 0))(
  ( (Unit!15895) )
))
(declare-fun lt!235091 () Unit!15894)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32954 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15894)

(assert (=> b!513496 (= lt!235091 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!513497 () Bool)

(assert (=> b!513497 (= e!299848 e!299847)))

(declare-fun res!313790 () Bool)

(assert (=> b!513497 (=> (not res!313790) (not e!299847))))

(declare-fun lt!235090 () SeekEntryResult!4318)

(assert (=> b!513497 (= res!313790 (or (= lt!235090 (MissingZero!4318 i!1204)) (= lt!235090 (MissingVacant!4318 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32954 (_ BitVec 32)) SeekEntryResult!4318)

(assert (=> b!513497 (= lt!235090 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!513498 () Bool)

(assert (=> b!513498 (= e!299846 (= (seekEntryOrOpen!0 (select (arr!15851 a!3235) j!176) a!3235 mask!3524) (Found!4318 j!176)))))

(declare-fun b!513499 () Bool)

(declare-fun res!313793 () Bool)

(assert (=> b!513499 (=> (not res!313793) (not e!299847))))

(assert (=> b!513499 (= res!313793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!513500 () Bool)

(declare-fun res!313786 () Bool)

(assert (=> b!513500 (=> (not res!313786) (not e!299848))))

(declare-fun arrayContainsKey!0 (array!32954 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!513500 (= res!313786 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!46414 res!313794) b!513494))

(assert (= (and b!513494 res!313792) b!513493))

(assert (= (and b!513493 res!313796) b!513492))

(assert (= (and b!513492 res!313791) b!513500))

(assert (= (and b!513500 res!313786) b!513497))

(assert (= (and b!513497 res!313790) b!513499))

(assert (= (and b!513499 res!313793) b!513495))

(assert (= (and b!513495 res!313789) b!513496))

(assert (= (and b!513496 res!313795) b!513498))

(assert (= (and b!513496 (not res!313787)) b!513491))

(assert (= (and b!513491 (not res!313788)) b!513490))

(declare-fun m!495057 () Bool)

(assert (=> start!46414 m!495057))

(declare-fun m!495059 () Bool)

(assert (=> start!46414 m!495059))

(declare-fun m!495061 () Bool)

(assert (=> b!513495 m!495061))

(declare-fun m!495063 () Bool)

(assert (=> b!513496 m!495063))

(declare-fun m!495065 () Bool)

(assert (=> b!513496 m!495065))

(declare-fun m!495067 () Bool)

(assert (=> b!513496 m!495067))

(declare-fun m!495069 () Bool)

(assert (=> b!513496 m!495069))

(declare-fun m!495071 () Bool)

(assert (=> b!513496 m!495071))

(assert (=> b!513496 m!495069))

(declare-fun m!495073 () Bool)

(assert (=> b!513496 m!495073))

(assert (=> b!513496 m!495067))

(declare-fun m!495075 () Bool)

(assert (=> b!513496 m!495075))

(assert (=> b!513496 m!495069))

(declare-fun m!495077 () Bool)

(assert (=> b!513496 m!495077))

(assert (=> b!513496 m!495067))

(declare-fun m!495079 () Bool)

(assert (=> b!513496 m!495079))

(assert (=> b!513498 m!495069))

(assert (=> b!513498 m!495069))

(declare-fun m!495081 () Bool)

(assert (=> b!513498 m!495081))

(declare-fun m!495083 () Bool)

(assert (=> b!513497 m!495083))

(declare-fun m!495085 () Bool)

(assert (=> b!513499 m!495085))

(assert (=> b!513493 m!495069))

(assert (=> b!513493 m!495069))

(declare-fun m!495087 () Bool)

(assert (=> b!513493 m!495087))

(declare-fun m!495089 () Bool)

(assert (=> b!513492 m!495089))

(declare-fun m!495091 () Bool)

(assert (=> b!513500 m!495091))

(push 1)

