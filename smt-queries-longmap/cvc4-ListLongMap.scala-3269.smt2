; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45490 () Bool)

(assert start!45490)

(declare-fun b!500988 () Bool)

(declare-fun e!293501 () Bool)

(declare-fun e!293495 () Bool)

(assert (=> b!500988 (= e!293501 e!293495)))

(declare-fun res!302753 () Bool)

(assert (=> b!500988 (=> (not res!302753) (not e!293495))))

(declare-datatypes ((SeekEntryResult!4006 0))(
  ( (MissingZero!4006 (index!18206 (_ BitVec 32))) (Found!4006 (index!18207 (_ BitVec 32))) (Intermediate!4006 (undefined!4818 Bool) (index!18208 (_ BitVec 32)) (x!47235 (_ BitVec 32))) (Undefined!4006) (MissingVacant!4006 (index!18209 (_ BitVec 32))) )
))
(declare-fun lt!227481 () SeekEntryResult!4006)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500988 (= res!302753 (or (= lt!227481 (MissingZero!4006 i!1204)) (= lt!227481 (MissingVacant!4006 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32315 0))(
  ( (array!32316 (arr!15539 (Array (_ BitVec 32) (_ BitVec 64))) (size!15903 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32315)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32315 (_ BitVec 32)) SeekEntryResult!4006)

(assert (=> b!500988 (= lt!227481 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!500989 () Bool)

(declare-datatypes ((Unit!15100 0))(
  ( (Unit!15101) )
))
(declare-fun e!293496 () Unit!15100)

(declare-fun Unit!15102 () Unit!15100)

(assert (=> b!500989 (= e!293496 Unit!15102)))

(declare-fun lt!227484 () SeekEntryResult!4006)

(declare-fun lt!227485 () (_ BitVec 32))

(declare-fun lt!227483 () Unit!15100)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32315 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15100)

(assert (=> b!500989 (= lt!227483 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!227485 #b00000000000000000000000000000000 (index!18208 lt!227484) (x!47235 lt!227484) mask!3524))))

(declare-fun lt!227487 () array!32315)

(declare-fun res!302747 () Bool)

(declare-fun lt!227480 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32315 (_ BitVec 32)) SeekEntryResult!4006)

(assert (=> b!500989 (= res!302747 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227485 lt!227480 lt!227487 mask!3524) (Intermediate!4006 false (index!18208 lt!227484) (x!47235 lt!227484))))))

(declare-fun e!293499 () Bool)

(assert (=> b!500989 (=> (not res!302747) (not e!293499))))

(assert (=> b!500989 e!293499))

(declare-fun b!500990 () Bool)

(declare-fun res!302750 () Bool)

(assert (=> b!500990 (=> (not res!302750) (not e!293501))))

(assert (=> b!500990 (= res!302750 (and (= (size!15903 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15903 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15903 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!302754 () Bool)

(assert (=> start!45490 (=> (not res!302754) (not e!293501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45490 (= res!302754 (validMask!0 mask!3524))))

(assert (=> start!45490 e!293501))

(assert (=> start!45490 true))

(declare-fun array_inv!11335 (array!32315) Bool)

(assert (=> start!45490 (array_inv!11335 a!3235)))

(declare-fun b!500991 () Bool)

(declare-fun e!293502 () Bool)

(declare-fun e!293500 () Bool)

(assert (=> b!500991 (= e!293502 e!293500)))

(declare-fun res!302744 () Bool)

(assert (=> b!500991 (=> res!302744 e!293500)))

(assert (=> b!500991 (= res!302744 (or (bvsgt #b00000000000000000000000000000000 (x!47235 lt!227484)) (bvsgt (x!47235 lt!227484) #b01111111111111111111111111111110) (bvslt lt!227485 #b00000000000000000000000000000000) (bvsge lt!227485 (size!15903 a!3235)) (bvslt (index!18208 lt!227484) #b00000000000000000000000000000000) (bvsge (index!18208 lt!227484) (size!15903 a!3235)) (not (= lt!227484 (Intermediate!4006 false (index!18208 lt!227484) (x!47235 lt!227484))))))))

(assert (=> b!500991 (and (or (= (select (arr!15539 a!3235) (index!18208 lt!227484)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15539 a!3235) (index!18208 lt!227484)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15539 a!3235) (index!18208 lt!227484)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15539 a!3235) (index!18208 lt!227484)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227486 () Unit!15100)

(assert (=> b!500991 (= lt!227486 e!293496)))

(declare-fun c!59399 () Bool)

(assert (=> b!500991 (= c!59399 (= (select (arr!15539 a!3235) (index!18208 lt!227484)) (select (arr!15539 a!3235) j!176)))))

(assert (=> b!500991 (and (bvslt (x!47235 lt!227484) #b01111111111111111111111111111110) (or (= (select (arr!15539 a!3235) (index!18208 lt!227484)) (select (arr!15539 a!3235) j!176)) (= (select (arr!15539 a!3235) (index!18208 lt!227484)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15539 a!3235) (index!18208 lt!227484)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500992 () Bool)

(declare-fun res!302756 () Bool)

(assert (=> b!500992 (=> res!302756 e!293502)))

(assert (=> b!500992 (= res!302756 (or (undefined!4818 lt!227484) (not (is-Intermediate!4006 lt!227484))))))

(declare-fun b!500993 () Bool)

(declare-fun res!302746 () Bool)

(assert (=> b!500993 (=> (not res!302746) (not e!293495))))

(declare-datatypes ((List!9697 0))(
  ( (Nil!9694) (Cons!9693 (h!10567 (_ BitVec 64)) (t!15925 List!9697)) )
))
(declare-fun arrayNoDuplicates!0 (array!32315 (_ BitVec 32) List!9697) Bool)

(assert (=> b!500993 (= res!302746 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9694))))

(declare-fun b!500994 () Bool)

(declare-fun Unit!15103 () Unit!15100)

(assert (=> b!500994 (= e!293496 Unit!15103)))

(declare-fun b!500995 () Bool)

(assert (=> b!500995 (= e!293500 true)))

(declare-fun lt!227488 () SeekEntryResult!4006)

(assert (=> b!500995 (= lt!227488 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227485 lt!227480 lt!227487 mask!3524))))

(declare-fun b!500996 () Bool)

(declare-fun res!302749 () Bool)

(assert (=> b!500996 (=> (not res!302749) (not e!293495))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32315 (_ BitVec 32)) Bool)

(assert (=> b!500996 (= res!302749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500997 () Bool)

(assert (=> b!500997 (= e!293495 (not e!293502))))

(declare-fun res!302751 () Bool)

(assert (=> b!500997 (=> res!302751 e!293502)))

(declare-fun lt!227482 () (_ BitVec 32))

(assert (=> b!500997 (= res!302751 (= lt!227484 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227482 lt!227480 lt!227487 mask!3524)))))

(assert (=> b!500997 (= lt!227484 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227485 (select (arr!15539 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500997 (= lt!227482 (toIndex!0 lt!227480 mask!3524))))

(assert (=> b!500997 (= lt!227480 (select (store (arr!15539 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!500997 (= lt!227485 (toIndex!0 (select (arr!15539 a!3235) j!176) mask!3524))))

(assert (=> b!500997 (= lt!227487 (array!32316 (store (arr!15539 a!3235) i!1204 k!2280) (size!15903 a!3235)))))

(declare-fun e!293497 () Bool)

(assert (=> b!500997 e!293497))

(declare-fun res!302752 () Bool)

(assert (=> b!500997 (=> (not res!302752) (not e!293497))))

(assert (=> b!500997 (= res!302752 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227479 () Unit!15100)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32315 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15100)

(assert (=> b!500997 (= lt!227479 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500998 () Bool)

(declare-fun res!302755 () Bool)

(assert (=> b!500998 (=> (not res!302755) (not e!293501))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500998 (= res!302755 (validKeyInArray!0 (select (arr!15539 a!3235) j!176)))))

(declare-fun b!500999 () Bool)

(assert (=> b!500999 (= e!293497 (= (seekEntryOrOpen!0 (select (arr!15539 a!3235) j!176) a!3235 mask!3524) (Found!4006 j!176)))))

(declare-fun b!501000 () Bool)

(declare-fun res!302748 () Bool)

(assert (=> b!501000 (=> (not res!302748) (not e!293501))))

(declare-fun arrayContainsKey!0 (array!32315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!501000 (= res!302748 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!501001 () Bool)

(assert (=> b!501001 (= e!293499 false)))

(declare-fun b!501002 () Bool)

(declare-fun res!302745 () Bool)

(assert (=> b!501002 (=> (not res!302745) (not e!293501))))

(assert (=> b!501002 (= res!302745 (validKeyInArray!0 k!2280))))

(assert (= (and start!45490 res!302754) b!500990))

(assert (= (and b!500990 res!302750) b!500998))

(assert (= (and b!500998 res!302755) b!501002))

(assert (= (and b!501002 res!302745) b!501000))

(assert (= (and b!501000 res!302748) b!500988))

(assert (= (and b!500988 res!302753) b!500996))

(assert (= (and b!500996 res!302749) b!500993))

(assert (= (and b!500993 res!302746) b!500997))

(assert (= (and b!500997 res!302752) b!500999))

(assert (= (and b!500997 (not res!302751)) b!500992))

(assert (= (and b!500992 (not res!302756)) b!500991))

(assert (= (and b!500991 c!59399) b!500989))

(assert (= (and b!500991 (not c!59399)) b!500994))

(assert (= (and b!500989 res!302747) b!501001))

(assert (= (and b!500991 (not res!302744)) b!500995))

(declare-fun m!482085 () Bool)

(assert (=> start!45490 m!482085))

(declare-fun m!482087 () Bool)

(assert (=> start!45490 m!482087))

(declare-fun m!482089 () Bool)

(assert (=> b!500997 m!482089))

(declare-fun m!482091 () Bool)

(assert (=> b!500997 m!482091))

(declare-fun m!482093 () Bool)

(assert (=> b!500997 m!482093))

(declare-fun m!482095 () Bool)

(assert (=> b!500997 m!482095))

(assert (=> b!500997 m!482089))

(declare-fun m!482097 () Bool)

(assert (=> b!500997 m!482097))

(declare-fun m!482099 () Bool)

(assert (=> b!500997 m!482099))

(declare-fun m!482101 () Bool)

(assert (=> b!500997 m!482101))

(declare-fun m!482103 () Bool)

(assert (=> b!500997 m!482103))

(declare-fun m!482105 () Bool)

(assert (=> b!500997 m!482105))

(assert (=> b!500997 m!482089))

(assert (=> b!500998 m!482089))

(assert (=> b!500998 m!482089))

(declare-fun m!482107 () Bool)

(assert (=> b!500998 m!482107))

(declare-fun m!482109 () Bool)

(assert (=> b!500989 m!482109))

(declare-fun m!482111 () Bool)

(assert (=> b!500989 m!482111))

(assert (=> b!500999 m!482089))

(assert (=> b!500999 m!482089))

(declare-fun m!482113 () Bool)

(assert (=> b!500999 m!482113))

(declare-fun m!482115 () Bool)

(assert (=> b!500996 m!482115))

(declare-fun m!482117 () Bool)

(assert (=> b!501000 m!482117))

(declare-fun m!482119 () Bool)

(assert (=> b!500993 m!482119))

(assert (=> b!500995 m!482111))

(declare-fun m!482121 () Bool)

(assert (=> b!501002 m!482121))

(declare-fun m!482123 () Bool)

(assert (=> b!500988 m!482123))

(declare-fun m!482125 () Bool)

(assert (=> b!500991 m!482125))

(assert (=> b!500991 m!482089))

(push 1)

