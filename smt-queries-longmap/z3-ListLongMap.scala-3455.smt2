; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47988 () Bool)

(assert start!47988)

(declare-fun res!324247 () Bool)

(declare-fun e!307756 () Bool)

(assert (=> start!47988 (=> (not res!324247) (not e!307756))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47988 (= res!324247 (validMask!0 mask!3524))))

(assert (=> start!47988 e!307756))

(assert (=> start!47988 true))

(declare-datatypes ((array!33491 0))(
  ( (array!33492 (arr!16094 (Array (_ BitVec 32) (_ BitVec 64))) (size!16459 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33491)

(declare-fun array_inv!11977 (array!33491) Bool)

(assert (=> start!47988 (array_inv!11977 a!3235)))

(declare-fun b!528100 () Bool)

(declare-fun e!307753 () Bool)

(declare-fun e!307754 () Bool)

(assert (=> b!528100 (= e!307753 (not e!307754))))

(declare-fun res!324238 () Bool)

(assert (=> b!528100 (=> res!324238 e!307754)))

(declare-datatypes ((SeekEntryResult!4558 0))(
  ( (MissingZero!4558 (index!20456 (_ BitVec 32))) (Found!4558 (index!20457 (_ BitVec 32))) (Intermediate!4558 (undefined!5370 Bool) (index!20458 (_ BitVec 32)) (x!49441 (_ BitVec 32))) (Undefined!4558) (MissingVacant!4558 (index!20459 (_ BitVec 32))) )
))
(declare-fun lt!243074 () SeekEntryResult!4558)

(declare-fun lt!243068 () SeekEntryResult!4558)

(get-info :version)

(assert (=> b!528100 (= res!324238 (or (= lt!243074 lt!243068) (undefined!5370 lt!243074) (not ((_ is Intermediate!4558) lt!243074))))))

(declare-fun lt!243076 () (_ BitVec 64))

(declare-fun lt!243069 () array!33491)

(declare-fun lt!243073 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33491 (_ BitVec 32)) SeekEntryResult!4558)

(assert (=> b!528100 (= lt!243068 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243073 lt!243076 lt!243069 mask!3524))))

(declare-fun lt!243067 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!528100 (= lt!243074 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243067 (select (arr!16094 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!528100 (= lt!243073 (toIndex!0 lt!243076 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!528100 (= lt!243076 (select (store (arr!16094 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!528100 (= lt!243067 (toIndex!0 (select (arr!16094 a!3235) j!176) mask!3524))))

(assert (=> b!528100 (= lt!243069 (array!33492 (store (arr!16094 a!3235) i!1204 k0!2280) (size!16459 a!3235)))))

(declare-fun e!307757 () Bool)

(assert (=> b!528100 e!307757))

(declare-fun res!324245 () Bool)

(assert (=> b!528100 (=> (not res!324245) (not e!307757))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33491 (_ BitVec 32)) Bool)

(assert (=> b!528100 (= res!324245 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16678 0))(
  ( (Unit!16679) )
))
(declare-fun lt!243066 () Unit!16678)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33491 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16678)

(assert (=> b!528100 (= lt!243066 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!528101 () Bool)

(declare-fun e!307750 () Unit!16678)

(declare-fun Unit!16680 () Unit!16678)

(assert (=> b!528101 (= e!307750 Unit!16680)))

(declare-fun lt!243070 () Unit!16678)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33491 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16678)

(assert (=> b!528101 (= lt!243070 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!243067 #b00000000000000000000000000000000 (index!20458 lt!243074) (x!49441 lt!243074) mask!3524))))

(declare-fun res!324248 () Bool)

(assert (=> b!528101 (= res!324248 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243067 lt!243076 lt!243069 mask!3524) (Intermediate!4558 false (index!20458 lt!243074) (x!49441 lt!243074))))))

(declare-fun e!307755 () Bool)

(assert (=> b!528101 (=> (not res!324248) (not e!307755))))

(assert (=> b!528101 e!307755))

(declare-fun b!528102 () Bool)

(declare-fun res!324236 () Bool)

(assert (=> b!528102 (=> (not res!324236) (not e!307753))))

(declare-datatypes ((List!10291 0))(
  ( (Nil!10288) (Cons!10287 (h!11224 (_ BitVec 64)) (t!16510 List!10291)) )
))
(declare-fun arrayNoDuplicates!0 (array!33491 (_ BitVec 32) List!10291) Bool)

(assert (=> b!528102 (= res!324236 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10288))))

(declare-fun b!528103 () Bool)

(declare-fun res!324237 () Bool)

(assert (=> b!528103 (=> (not res!324237) (not e!307756))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!528103 (= res!324237 (validKeyInArray!0 (select (arr!16094 a!3235) j!176)))))

(declare-fun b!528104 () Bool)

(declare-fun res!324241 () Bool)

(assert (=> b!528104 (=> (not res!324241) (not e!307756))))

(assert (=> b!528104 (= res!324241 (and (= (size!16459 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16459 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16459 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!528105 () Bool)

(declare-fun res!324243 () Bool)

(assert (=> b!528105 (=> (not res!324243) (not e!307756))))

(declare-fun arrayContainsKey!0 (array!33491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!528105 (= res!324243 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!528106 () Bool)

(declare-fun e!307752 () Bool)

(assert (=> b!528106 (= e!307752 (= lt!243068 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243067 lt!243076 lt!243069 mask!3524)))))

(declare-fun b!528107 () Bool)

(assert (=> b!528107 (= e!307756 e!307753)))

(declare-fun res!324240 () Bool)

(assert (=> b!528107 (=> (not res!324240) (not e!307753))))

(declare-fun lt!243075 () SeekEntryResult!4558)

(assert (=> b!528107 (= res!324240 (or (= lt!243075 (MissingZero!4558 i!1204)) (= lt!243075 (MissingVacant!4558 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33491 (_ BitVec 32)) SeekEntryResult!4558)

(assert (=> b!528107 (= lt!243075 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!528108 () Bool)

(assert (=> b!528108 (= e!307757 (= (seekEntryOrOpen!0 (select (arr!16094 a!3235) j!176) a!3235 mask!3524) (Found!4558 j!176)))))

(declare-fun b!528109 () Bool)

(declare-fun res!324239 () Bool)

(assert (=> b!528109 (=> (not res!324239) (not e!307753))))

(assert (=> b!528109 (= res!324239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!528110 () Bool)

(declare-fun res!324246 () Bool)

(assert (=> b!528110 (=> (not res!324246) (not e!307756))))

(assert (=> b!528110 (= res!324246 (validKeyInArray!0 k0!2280))))

(declare-fun b!528111 () Bool)

(declare-fun Unit!16681 () Unit!16678)

(assert (=> b!528111 (= e!307750 Unit!16681)))

(declare-fun b!528112 () Bool)

(declare-fun res!324242 () Bool)

(assert (=> b!528112 (=> res!324242 e!307752)))

(declare-fun e!307758 () Bool)

(assert (=> b!528112 (= res!324242 e!307758)))

(declare-fun res!324235 () Bool)

(assert (=> b!528112 (=> (not res!324235) (not e!307758))))

(assert (=> b!528112 (= res!324235 (bvsgt #b00000000000000000000000000000000 (x!49441 lt!243074)))))

(declare-fun b!528113 () Bool)

(assert (=> b!528113 (= e!307755 false)))

(declare-fun b!528114 () Bool)

(assert (=> b!528114 (= e!307754 e!307752)))

(declare-fun res!324244 () Bool)

(assert (=> b!528114 (=> res!324244 e!307752)))

(assert (=> b!528114 (= res!324244 (or (bvsgt (x!49441 lt!243074) #b01111111111111111111111111111110) (bvslt lt!243067 #b00000000000000000000000000000000) (bvsge lt!243067 (size!16459 a!3235)) (bvslt (index!20458 lt!243074) #b00000000000000000000000000000000) (bvsge (index!20458 lt!243074) (size!16459 a!3235)) (not (= lt!243074 (Intermediate!4558 false (index!20458 lt!243074) (x!49441 lt!243074))))))))

(assert (=> b!528114 (= (index!20458 lt!243074) i!1204)))

(declare-fun lt!243072 () Unit!16678)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33491 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16678)

(assert (=> b!528114 (= lt!243072 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!243067 #b00000000000000000000000000000000 (index!20458 lt!243074) (x!49441 lt!243074) mask!3524))))

(assert (=> b!528114 (and (or (= (select (arr!16094 a!3235) (index!20458 lt!243074)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16094 a!3235) (index!20458 lt!243074)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16094 a!3235) (index!20458 lt!243074)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16094 a!3235) (index!20458 lt!243074)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243071 () Unit!16678)

(assert (=> b!528114 (= lt!243071 e!307750)))

(declare-fun c!62241 () Bool)

(assert (=> b!528114 (= c!62241 (= (select (arr!16094 a!3235) (index!20458 lt!243074)) (select (arr!16094 a!3235) j!176)))))

(assert (=> b!528114 (and (bvslt (x!49441 lt!243074) #b01111111111111111111111111111110) (or (= (select (arr!16094 a!3235) (index!20458 lt!243074)) (select (arr!16094 a!3235) j!176)) (= (select (arr!16094 a!3235) (index!20458 lt!243074)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16094 a!3235) (index!20458 lt!243074)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!528115 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33491 (_ BitVec 32)) SeekEntryResult!4558)

(assert (=> b!528115 (= e!307758 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243067 (index!20458 lt!243074) (select (arr!16094 a!3235) j!176) a!3235 mask!3524) (Found!4558 j!176))))))

(assert (= (and start!47988 res!324247) b!528104))

(assert (= (and b!528104 res!324241) b!528103))

(assert (= (and b!528103 res!324237) b!528110))

(assert (= (and b!528110 res!324246) b!528105))

(assert (= (and b!528105 res!324243) b!528107))

(assert (= (and b!528107 res!324240) b!528109))

(assert (= (and b!528109 res!324239) b!528102))

(assert (= (and b!528102 res!324236) b!528100))

(assert (= (and b!528100 res!324245) b!528108))

(assert (= (and b!528100 (not res!324238)) b!528114))

(assert (= (and b!528114 c!62241) b!528101))

(assert (= (and b!528114 (not c!62241)) b!528111))

(assert (= (and b!528101 res!324248) b!528113))

(assert (= (and b!528114 (not res!324244)) b!528112))

(assert (= (and b!528112 res!324235) b!528115))

(assert (= (and b!528112 (not res!324242)) b!528106))

(declare-fun m!508165 () Bool)

(assert (=> b!528102 m!508165))

(declare-fun m!508167 () Bool)

(assert (=> b!528109 m!508167))

(declare-fun m!508169 () Bool)

(assert (=> b!528100 m!508169))

(declare-fun m!508171 () Bool)

(assert (=> b!528100 m!508171))

(declare-fun m!508173 () Bool)

(assert (=> b!528100 m!508173))

(declare-fun m!508175 () Bool)

(assert (=> b!528100 m!508175))

(declare-fun m!508177 () Bool)

(assert (=> b!528100 m!508177))

(assert (=> b!528100 m!508171))

(declare-fun m!508179 () Bool)

(assert (=> b!528100 m!508179))

(assert (=> b!528100 m!508171))

(declare-fun m!508181 () Bool)

(assert (=> b!528100 m!508181))

(declare-fun m!508183 () Bool)

(assert (=> b!528100 m!508183))

(declare-fun m!508185 () Bool)

(assert (=> b!528100 m!508185))

(declare-fun m!508187 () Bool)

(assert (=> b!528114 m!508187))

(declare-fun m!508189 () Bool)

(assert (=> b!528114 m!508189))

(assert (=> b!528114 m!508171))

(declare-fun m!508191 () Bool)

(assert (=> b!528106 m!508191))

(declare-fun m!508193 () Bool)

(assert (=> start!47988 m!508193))

(declare-fun m!508195 () Bool)

(assert (=> start!47988 m!508195))

(declare-fun m!508197 () Bool)

(assert (=> b!528101 m!508197))

(assert (=> b!528101 m!508191))

(declare-fun m!508199 () Bool)

(assert (=> b!528110 m!508199))

(assert (=> b!528103 m!508171))

(assert (=> b!528103 m!508171))

(declare-fun m!508201 () Bool)

(assert (=> b!528103 m!508201))

(declare-fun m!508203 () Bool)

(assert (=> b!528105 m!508203))

(declare-fun m!508205 () Bool)

(assert (=> b!528107 m!508205))

(assert (=> b!528115 m!508171))

(assert (=> b!528115 m!508171))

(declare-fun m!508207 () Bool)

(assert (=> b!528115 m!508207))

(assert (=> b!528108 m!508171))

(assert (=> b!528108 m!508171))

(declare-fun m!508209 () Bool)

(assert (=> b!528108 m!508209))

(check-sat (not b!528109) (not b!528107) (not b!528106) (not b!528101) (not b!528100) (not b!528108) (not b!528105) (not b!528103) (not start!47988) (not b!528115) (not b!528114) (not b!528102) (not b!528110))
(check-sat)
