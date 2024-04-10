; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46988 () Bool)

(assert start!46988)

(declare-fun b!518068 () Bool)

(declare-fun res!317090 () Bool)

(declare-fun e!302304 () Bool)

(assert (=> b!518068 (=> (not res!317090) (not e!302304))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((array!33129 0))(
  ( (array!33130 (arr!15928 (Array (_ BitVec 32) (_ BitVec 64))) (size!16292 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33129)

(assert (=> b!518068 (= res!317090 (and (= (size!16292 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16292 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16292 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!518069 () Bool)

(declare-fun res!317088 () Bool)

(assert (=> b!518069 (=> (not res!317088) (not e!302304))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!518069 (= res!317088 (validKeyInArray!0 k0!2280))))

(declare-fun e!302303 () Bool)

(declare-fun b!518070 () Bool)

(declare-datatypes ((SeekEntryResult!4395 0))(
  ( (MissingZero!4395 (index!19768 (_ BitVec 32))) (Found!4395 (index!19769 (_ BitVec 32))) (Intermediate!4395 (undefined!5207 Bool) (index!19770 (_ BitVec 32)) (x!48736 (_ BitVec 32))) (Undefined!4395) (MissingVacant!4395 (index!19771 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33129 (_ BitVec 32)) SeekEntryResult!4395)

(assert (=> b!518070 (= e!302303 (= (seekEntryOrOpen!0 (select (arr!15928 a!3235) j!176) a!3235 mask!3524) (Found!4395 j!176)))))

(declare-fun b!518071 () Bool)

(declare-fun e!302306 () Bool)

(assert (=> b!518071 (= e!302304 e!302306)))

(declare-fun res!317089 () Bool)

(assert (=> b!518071 (=> (not res!317089) (not e!302306))))

(declare-fun lt!237150 () SeekEntryResult!4395)

(assert (=> b!518071 (= res!317089 (or (= lt!237150 (MissingZero!4395 i!1204)) (= lt!237150 (MissingVacant!4395 i!1204))))))

(assert (=> b!518071 (= lt!237150 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!518072 () Bool)

(declare-fun res!317083 () Bool)

(assert (=> b!518072 (=> (not res!317083) (not e!302304))))

(assert (=> b!518072 (= res!317083 (validKeyInArray!0 (select (arr!15928 a!3235) j!176)))))

(declare-fun b!518073 () Bool)

(declare-fun res!317085 () Bool)

(assert (=> b!518073 (=> (not res!317085) (not e!302306))))

(declare-datatypes ((List!10086 0))(
  ( (Nil!10083) (Cons!10082 (h!10989 (_ BitVec 64)) (t!16314 List!10086)) )
))
(declare-fun arrayNoDuplicates!0 (array!33129 (_ BitVec 32) List!10086) Bool)

(assert (=> b!518073 (= res!317085 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10083))))

(declare-fun b!518075 () Bool)

(declare-fun e!302307 () Bool)

(assert (=> b!518075 (= e!302306 (not e!302307))))

(declare-fun res!317091 () Bool)

(assert (=> b!518075 (=> res!317091 e!302307)))

(declare-fun lt!237151 () SeekEntryResult!4395)

(declare-fun lt!237147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33129 (_ BitVec 32)) SeekEntryResult!4395)

(assert (=> b!518075 (= res!317091 (= lt!237151 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237147 (select (store (arr!15928 a!3235) i!1204 k0!2280) j!176) (array!33130 (store (arr!15928 a!3235) i!1204 k0!2280) (size!16292 a!3235)) mask!3524)))))

(declare-fun lt!237148 () (_ BitVec 32))

(assert (=> b!518075 (= lt!237151 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237148 (select (arr!15928 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518075 (= lt!237147 (toIndex!0 (select (store (arr!15928 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!518075 (= lt!237148 (toIndex!0 (select (arr!15928 a!3235) j!176) mask!3524))))

(assert (=> b!518075 e!302303))

(declare-fun res!317093 () Bool)

(assert (=> b!518075 (=> (not res!317093) (not e!302303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33129 (_ BitVec 32)) Bool)

(assert (=> b!518075 (= res!317093 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16048 0))(
  ( (Unit!16049) )
))
(declare-fun lt!237149 () Unit!16048)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33129 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16048)

(assert (=> b!518075 (= lt!237149 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!518076 () Bool)

(declare-fun res!317092 () Bool)

(assert (=> b!518076 (=> (not res!317092) (not e!302304))))

(declare-fun arrayContainsKey!0 (array!33129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!518076 (= res!317092 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!518074 () Bool)

(declare-fun res!317087 () Bool)

(assert (=> b!518074 (=> (not res!317087) (not e!302306))))

(assert (=> b!518074 (= res!317087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!317086 () Bool)

(assert (=> start!46988 (=> (not res!317086) (not e!302304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46988 (= res!317086 (validMask!0 mask!3524))))

(assert (=> start!46988 e!302304))

(assert (=> start!46988 true))

(declare-fun array_inv!11724 (array!33129) Bool)

(assert (=> start!46988 (array_inv!11724 a!3235)))

(declare-fun b!518077 () Bool)

(declare-fun res!317084 () Bool)

(assert (=> b!518077 (=> res!317084 e!302307)))

(get-info :version)

(assert (=> b!518077 (= res!317084 (or (undefined!5207 lt!237151) (not ((_ is Intermediate!4395) lt!237151))))))

(declare-fun b!518078 () Bool)

(assert (=> b!518078 (= e!302307 (or (not (= (select (arr!15928 a!3235) (index!19770 lt!237151)) (select (arr!15928 a!3235) j!176))) (bvsgt (x!48736 lt!237151) #b01111111111111111111111111111110) (bvsgt #b00000000000000000000000000000000 (x!48736 lt!237151)) (bvslt lt!237148 #b00000000000000000000000000000000) (bvsge lt!237148 (size!16292 a!3235)) (bvslt (index!19770 lt!237151) #b00000000000000000000000000000000) (bvsge (index!19770 lt!237151) (size!16292 a!3235)) (= lt!237151 (Intermediate!4395 false (index!19770 lt!237151) (x!48736 lt!237151)))))))

(assert (=> b!518078 (and (bvslt (x!48736 lt!237151) #b01111111111111111111111111111110) (or (= (select (arr!15928 a!3235) (index!19770 lt!237151)) (select (arr!15928 a!3235) j!176)) (= (select (arr!15928 a!3235) (index!19770 lt!237151)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15928 a!3235) (index!19770 lt!237151)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!46988 res!317086) b!518068))

(assert (= (and b!518068 res!317090) b!518072))

(assert (= (and b!518072 res!317083) b!518069))

(assert (= (and b!518069 res!317088) b!518076))

(assert (= (and b!518076 res!317092) b!518071))

(assert (= (and b!518071 res!317089) b!518074))

(assert (= (and b!518074 res!317087) b!518073))

(assert (= (and b!518073 res!317085) b!518075))

(assert (= (and b!518075 res!317093) b!518070))

(assert (= (and b!518075 (not res!317091)) b!518077))

(assert (= (and b!518077 (not res!317084)) b!518078))

(declare-fun m!499409 () Bool)

(assert (=> b!518071 m!499409))

(declare-fun m!499411 () Bool)

(assert (=> b!518074 m!499411))

(declare-fun m!499413 () Bool)

(assert (=> b!518070 m!499413))

(assert (=> b!518070 m!499413))

(declare-fun m!499415 () Bool)

(assert (=> b!518070 m!499415))

(declare-fun m!499417 () Bool)

(assert (=> b!518078 m!499417))

(assert (=> b!518078 m!499413))

(declare-fun m!499419 () Bool)

(assert (=> b!518069 m!499419))

(declare-fun m!499421 () Bool)

(assert (=> b!518073 m!499421))

(declare-fun m!499423 () Bool)

(assert (=> b!518075 m!499423))

(declare-fun m!499425 () Bool)

(assert (=> b!518075 m!499425))

(declare-fun m!499427 () Bool)

(assert (=> b!518075 m!499427))

(assert (=> b!518075 m!499413))

(declare-fun m!499429 () Bool)

(assert (=> b!518075 m!499429))

(assert (=> b!518075 m!499413))

(declare-fun m!499431 () Bool)

(assert (=> b!518075 m!499431))

(assert (=> b!518075 m!499413))

(declare-fun m!499433 () Bool)

(assert (=> b!518075 m!499433))

(assert (=> b!518075 m!499427))

(declare-fun m!499435 () Bool)

(assert (=> b!518075 m!499435))

(assert (=> b!518075 m!499427))

(declare-fun m!499437 () Bool)

(assert (=> b!518075 m!499437))

(declare-fun m!499439 () Bool)

(assert (=> b!518076 m!499439))

(assert (=> b!518072 m!499413))

(assert (=> b!518072 m!499413))

(declare-fun m!499441 () Bool)

(assert (=> b!518072 m!499441))

(declare-fun m!499443 () Bool)

(assert (=> start!46988 m!499443))

(declare-fun m!499445 () Bool)

(assert (=> start!46988 m!499445))

(check-sat (not b!518074) (not start!46988) (not b!518073) (not b!518076) (not b!518071) (not b!518072) (not b!518075) (not b!518069) (not b!518070))
(check-sat)
