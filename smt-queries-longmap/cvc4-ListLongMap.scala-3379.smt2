; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46690 () Bool)

(assert start!46690)

(declare-fun b!515248 () Bool)

(declare-fun res!314820 () Bool)

(declare-fun e!300864 () Bool)

(assert (=> b!515248 (=> res!314820 e!300864)))

(declare-datatypes ((SeekEntryResult!4336 0))(
  ( (MissingZero!4336 (index!19532 (_ BitVec 32))) (Found!4336 (index!19533 (_ BitVec 32))) (Intermediate!4336 (undefined!5148 Bool) (index!19534 (_ BitVec 32)) (x!48499 (_ BitVec 32))) (Undefined!4336) (MissingVacant!4336 (index!19535 (_ BitVec 32))) )
))
(declare-fun lt!235876 () SeekEntryResult!4336)

(assert (=> b!515248 (= res!314820 (or (undefined!5148 lt!235876) (not (is-Intermediate!4336 lt!235876))))))

(declare-fun b!515249 () Bool)

(assert (=> b!515249 (= e!300864 true)))

(declare-datatypes ((array!33002 0))(
  ( (array!33003 (arr!15869 (Array (_ BitVec 32) (_ BitVec 64))) (size!16233 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33002)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!515249 (and (bvslt (x!48499 lt!235876) #b01111111111111111111111111111110) (or (= (select (arr!15869 a!3235) (index!19534 lt!235876)) (select (arr!15869 a!3235) j!176)) (= (select (arr!15869 a!3235) (index!19534 lt!235876)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15869 a!3235) (index!19534 lt!235876)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515250 () Bool)

(declare-fun res!314818 () Bool)

(declare-fun e!300862 () Bool)

(assert (=> b!515250 (=> (not res!314818) (not e!300862))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33002 (_ BitVec 32)) Bool)

(assert (=> b!515250 (= res!314818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515251 () Bool)

(declare-fun e!300861 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33002 (_ BitVec 32)) SeekEntryResult!4336)

(assert (=> b!515251 (= e!300861 (= (seekEntryOrOpen!0 (select (arr!15869 a!3235) j!176) a!3235 mask!3524) (Found!4336 j!176)))))

(declare-fun b!515252 () Bool)

(declare-fun res!314822 () Bool)

(assert (=> b!515252 (=> (not res!314822) (not e!300862))))

(declare-datatypes ((List!10027 0))(
  ( (Nil!10024) (Cons!10023 (h!10921 (_ BitVec 64)) (t!16255 List!10027)) )
))
(declare-fun arrayNoDuplicates!0 (array!33002 (_ BitVec 32) List!10027) Bool)

(assert (=> b!515252 (= res!314822 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10024))))

(declare-fun b!515253 () Bool)

(declare-fun res!314812 () Bool)

(declare-fun e!300863 () Bool)

(assert (=> b!515253 (=> (not res!314812) (not e!300863))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515253 (= res!314812 (validKeyInArray!0 k!2280))))

(declare-fun b!515254 () Bool)

(declare-fun res!314817 () Bool)

(assert (=> b!515254 (=> (not res!314817) (not e!300863))))

(declare-fun arrayContainsKey!0 (array!33002 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515254 (= res!314817 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!314819 () Bool)

(assert (=> start!46690 (=> (not res!314819) (not e!300863))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46690 (= res!314819 (validMask!0 mask!3524))))

(assert (=> start!46690 e!300863))

(assert (=> start!46690 true))

(declare-fun array_inv!11665 (array!33002) Bool)

(assert (=> start!46690 (array_inv!11665 a!3235)))

(declare-fun b!515255 () Bool)

(assert (=> b!515255 (= e!300863 e!300862)))

(declare-fun res!314815 () Bool)

(assert (=> b!515255 (=> (not res!314815) (not e!300862))))

(declare-fun lt!235877 () SeekEntryResult!4336)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!515255 (= res!314815 (or (= lt!235877 (MissingZero!4336 i!1204)) (= lt!235877 (MissingVacant!4336 i!1204))))))

(assert (=> b!515255 (= lt!235877 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!515256 () Bool)

(declare-fun res!314813 () Bool)

(assert (=> b!515256 (=> (not res!314813) (not e!300863))))

(assert (=> b!515256 (= res!314813 (validKeyInArray!0 (select (arr!15869 a!3235) j!176)))))

(declare-fun b!515257 () Bool)

(assert (=> b!515257 (= e!300862 (not e!300864))))

(declare-fun res!314816 () Bool)

(assert (=> b!515257 (=> res!314816 e!300864)))

(declare-fun lt!235875 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33002 (_ BitVec 32)) SeekEntryResult!4336)

(assert (=> b!515257 (= res!314816 (= lt!235876 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235875 (select (store (arr!15869 a!3235) i!1204 k!2280) j!176) (array!33003 (store (arr!15869 a!3235) i!1204 k!2280) (size!16233 a!3235)) mask!3524)))))

(declare-fun lt!235878 () (_ BitVec 32))

(assert (=> b!515257 (= lt!235876 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235878 (select (arr!15869 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515257 (= lt!235875 (toIndex!0 (select (store (arr!15869 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!515257 (= lt!235878 (toIndex!0 (select (arr!15869 a!3235) j!176) mask!3524))))

(assert (=> b!515257 e!300861))

(declare-fun res!314814 () Bool)

(assert (=> b!515257 (=> (not res!314814) (not e!300861))))

(assert (=> b!515257 (= res!314814 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15930 0))(
  ( (Unit!15931) )
))
(declare-fun lt!235879 () Unit!15930)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33002 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15930)

(assert (=> b!515257 (= lt!235879 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515258 () Bool)

(declare-fun res!314821 () Bool)

(assert (=> b!515258 (=> (not res!314821) (not e!300863))))

(assert (=> b!515258 (= res!314821 (and (= (size!16233 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16233 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16233 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!46690 res!314819) b!515258))

(assert (= (and b!515258 res!314821) b!515256))

(assert (= (and b!515256 res!314813) b!515253))

(assert (= (and b!515253 res!314812) b!515254))

(assert (= (and b!515254 res!314817) b!515255))

(assert (= (and b!515255 res!314815) b!515250))

(assert (= (and b!515250 res!314818) b!515252))

(assert (= (and b!515252 res!314822) b!515257))

(assert (= (and b!515257 res!314814) b!515251))

(assert (= (and b!515257 (not res!314816)) b!515248))

(assert (= (and b!515248 (not res!314820)) b!515249))

(declare-fun m!496555 () Bool)

(assert (=> start!46690 m!496555))

(declare-fun m!496557 () Bool)

(assert (=> start!46690 m!496557))

(declare-fun m!496559 () Bool)

(assert (=> b!515252 m!496559))

(declare-fun m!496561 () Bool)

(assert (=> b!515256 m!496561))

(assert (=> b!515256 m!496561))

(declare-fun m!496563 () Bool)

(assert (=> b!515256 m!496563))

(assert (=> b!515251 m!496561))

(assert (=> b!515251 m!496561))

(declare-fun m!496565 () Bool)

(assert (=> b!515251 m!496565))

(declare-fun m!496567 () Bool)

(assert (=> b!515250 m!496567))

(declare-fun m!496569 () Bool)

(assert (=> b!515254 m!496569))

(declare-fun m!496571 () Bool)

(assert (=> b!515257 m!496571))

(declare-fun m!496573 () Bool)

(assert (=> b!515257 m!496573))

(declare-fun m!496575 () Bool)

(assert (=> b!515257 m!496575))

(declare-fun m!496577 () Bool)

(assert (=> b!515257 m!496577))

(assert (=> b!515257 m!496571))

(assert (=> b!515257 m!496561))

(declare-fun m!496579 () Bool)

(assert (=> b!515257 m!496579))

(assert (=> b!515257 m!496561))

(declare-fun m!496581 () Bool)

(assert (=> b!515257 m!496581))

(assert (=> b!515257 m!496571))

(declare-fun m!496583 () Bool)

(assert (=> b!515257 m!496583))

(assert (=> b!515257 m!496561))

(declare-fun m!496585 () Bool)

(assert (=> b!515257 m!496585))

(declare-fun m!496587 () Bool)

(assert (=> b!515255 m!496587))

(declare-fun m!496589 () Bool)

(assert (=> b!515249 m!496589))

(assert (=> b!515249 m!496561))

(declare-fun m!496591 () Bool)

(assert (=> b!515253 m!496591))

(push 1)

