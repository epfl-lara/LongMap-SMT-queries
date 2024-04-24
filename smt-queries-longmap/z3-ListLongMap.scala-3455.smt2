; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47990 () Bool)

(assert start!47990)

(declare-fun b!528310 () Bool)

(declare-fun res!324367 () Bool)

(declare-fun e!307888 () Bool)

(assert (=> b!528310 (=> (not res!324367) (not e!307888))))

(declare-datatypes ((array!33484 0))(
  ( (array!33485 (arr!16090 (Array (_ BitVec 32) (_ BitVec 64))) (size!16454 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33484)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!528310 (= res!324367 (validKeyInArray!0 (select (arr!16090 a!3235) j!176)))))

(declare-datatypes ((SeekEntryResult!4513 0))(
  ( (MissingZero!4513 (index!20276 (_ BitVec 32))) (Found!4513 (index!20277 (_ BitVec 32))) (Intermediate!4513 (undefined!5325 Bool) (index!20278 (_ BitVec 32)) (x!49398 (_ BitVec 32))) (Undefined!4513) (MissingVacant!4513 (index!20279 (_ BitVec 32))) )
))
(declare-fun lt!243312 () SeekEntryResult!4513)

(declare-fun lt!243322 () (_ BitVec 64))

(declare-fun lt!243319 () array!33484)

(declare-fun b!528311 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!307889 () Bool)

(declare-fun lt!243321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33484 (_ BitVec 32)) SeekEntryResult!4513)

(assert (=> b!528311 (= e!307889 (= lt!243312 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243321 lt!243322 lt!243319 mask!3524)))))

(declare-fun e!307886 () Bool)

(declare-fun b!528312 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33484 (_ BitVec 32)) SeekEntryResult!4513)

(assert (=> b!528312 (= e!307886 (= (seekEntryOrOpen!0 (select (arr!16090 a!3235) j!176) a!3235 mask!3524) (Found!4513 j!176)))))

(declare-fun b!528313 () Bool)

(declare-datatypes ((Unit!16663 0))(
  ( (Unit!16664) )
))
(declare-fun e!307887 () Unit!16663)

(declare-fun Unit!16665 () Unit!16663)

(assert (=> b!528313 (= e!307887 Unit!16665)))

(declare-fun lt!243318 () SeekEntryResult!4513)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!243320 () Unit!16663)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33484 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16663)

(assert (=> b!528313 (= lt!243320 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!243321 #b00000000000000000000000000000000 (index!20278 lt!243318) (x!49398 lt!243318) mask!3524))))

(declare-fun res!324362 () Bool)

(assert (=> b!528313 (= res!324362 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243321 lt!243322 lt!243319 mask!3524) (Intermediate!4513 false (index!20278 lt!243318) (x!49398 lt!243318))))))

(declare-fun e!307885 () Bool)

(assert (=> b!528313 (=> (not res!324362) (not e!307885))))

(assert (=> b!528313 e!307885))

(declare-fun b!528314 () Bool)

(assert (=> b!528314 (= e!307885 false)))

(declare-fun b!528315 () Bool)

(declare-fun res!324358 () Bool)

(assert (=> b!528315 (=> (not res!324358) (not e!307888))))

(declare-fun arrayContainsKey!0 (array!33484 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!528315 (= res!324358 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!528316 () Bool)

(declare-fun res!324364 () Bool)

(assert (=> b!528316 (=> res!324364 e!307889)))

(declare-fun e!307892 () Bool)

(assert (=> b!528316 (= res!324364 e!307892)))

(declare-fun res!324370 () Bool)

(assert (=> b!528316 (=> (not res!324370) (not e!307892))))

(assert (=> b!528316 (= res!324370 (bvsgt #b00000000000000000000000000000000 (x!49398 lt!243318)))))

(declare-fun b!528317 () Bool)

(declare-fun res!324366 () Bool)

(assert (=> b!528317 (=> (not res!324366) (not e!307888))))

(assert (=> b!528317 (= res!324366 (and (= (size!16454 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16454 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16454 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!528318 () Bool)

(declare-fun res!324359 () Bool)

(declare-fun e!307891 () Bool)

(assert (=> b!528318 (=> (not res!324359) (not e!307891))))

(declare-datatypes ((List!10155 0))(
  ( (Nil!10152) (Cons!10151 (h!11088 (_ BitVec 64)) (t!16375 List!10155)) )
))
(declare-fun arrayNoDuplicates!0 (array!33484 (_ BitVec 32) List!10155) Bool)

(assert (=> b!528318 (= res!324359 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10152))))

(declare-fun b!528320 () Bool)

(declare-fun res!324363 () Bool)

(assert (=> b!528320 (=> (not res!324363) (not e!307891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33484 (_ BitVec 32)) Bool)

(assert (=> b!528320 (= res!324363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!528321 () Bool)

(declare-fun Unit!16666 () Unit!16663)

(assert (=> b!528321 (= e!307887 Unit!16666)))

(declare-fun b!528322 () Bool)

(declare-fun e!307890 () Bool)

(assert (=> b!528322 (= e!307891 (not e!307890))))

(declare-fun res!324368 () Bool)

(assert (=> b!528322 (=> res!324368 e!307890)))

(get-info :version)

(assert (=> b!528322 (= res!324368 (or (= lt!243318 lt!243312) (undefined!5325 lt!243318) (not ((_ is Intermediate!4513) lt!243318))))))

(declare-fun lt!243315 () (_ BitVec 32))

(assert (=> b!528322 (= lt!243312 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243315 lt!243322 lt!243319 mask!3524))))

(assert (=> b!528322 (= lt!243318 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243321 (select (arr!16090 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!528322 (= lt!243315 (toIndex!0 lt!243322 mask!3524))))

(assert (=> b!528322 (= lt!243322 (select (store (arr!16090 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!528322 (= lt!243321 (toIndex!0 (select (arr!16090 a!3235) j!176) mask!3524))))

(assert (=> b!528322 (= lt!243319 (array!33485 (store (arr!16090 a!3235) i!1204 k0!2280) (size!16454 a!3235)))))

(assert (=> b!528322 e!307886))

(declare-fun res!324360 () Bool)

(assert (=> b!528322 (=> (not res!324360) (not e!307886))))

(assert (=> b!528322 (= res!324360 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!243313 () Unit!16663)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33484 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16663)

(assert (=> b!528322 (= lt!243313 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!528323 () Bool)

(assert (=> b!528323 (= e!307890 e!307889)))

(declare-fun res!324369 () Bool)

(assert (=> b!528323 (=> res!324369 e!307889)))

(assert (=> b!528323 (= res!324369 (or (bvsgt (x!49398 lt!243318) #b01111111111111111111111111111110) (bvslt lt!243321 #b00000000000000000000000000000000) (bvsge lt!243321 (size!16454 a!3235)) (bvslt (index!20278 lt!243318) #b00000000000000000000000000000000) (bvsge (index!20278 lt!243318) (size!16454 a!3235)) (not (= lt!243318 (Intermediate!4513 false (index!20278 lt!243318) (x!49398 lt!243318))))))))

(assert (=> b!528323 (= (index!20278 lt!243318) i!1204)))

(declare-fun lt!243314 () Unit!16663)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33484 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16663)

(assert (=> b!528323 (= lt!243314 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!243321 #b00000000000000000000000000000000 (index!20278 lt!243318) (x!49398 lt!243318) mask!3524))))

(assert (=> b!528323 (and (or (= (select (arr!16090 a!3235) (index!20278 lt!243318)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16090 a!3235) (index!20278 lt!243318)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16090 a!3235) (index!20278 lt!243318)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16090 a!3235) (index!20278 lt!243318)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243317 () Unit!16663)

(assert (=> b!528323 (= lt!243317 e!307887)))

(declare-fun c!62285 () Bool)

(assert (=> b!528323 (= c!62285 (= (select (arr!16090 a!3235) (index!20278 lt!243318)) (select (arr!16090 a!3235) j!176)))))

(assert (=> b!528323 (and (bvslt (x!49398 lt!243318) #b01111111111111111111111111111110) (or (= (select (arr!16090 a!3235) (index!20278 lt!243318)) (select (arr!16090 a!3235) j!176)) (= (select (arr!16090 a!3235) (index!20278 lt!243318)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16090 a!3235) (index!20278 lt!243318)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!528324 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33484 (_ BitVec 32)) SeekEntryResult!4513)

(assert (=> b!528324 (= e!307892 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243321 (index!20278 lt!243318) (select (arr!16090 a!3235) j!176) a!3235 mask!3524) (Found!4513 j!176))))))

(declare-fun b!528325 () Bool)

(assert (=> b!528325 (= e!307888 e!307891)))

(declare-fun res!324361 () Bool)

(assert (=> b!528325 (=> (not res!324361) (not e!307891))))

(declare-fun lt!243316 () SeekEntryResult!4513)

(assert (=> b!528325 (= res!324361 (or (= lt!243316 (MissingZero!4513 i!1204)) (= lt!243316 (MissingVacant!4513 i!1204))))))

(assert (=> b!528325 (= lt!243316 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!528319 () Bool)

(declare-fun res!324357 () Bool)

(assert (=> b!528319 (=> (not res!324357) (not e!307888))))

(assert (=> b!528319 (= res!324357 (validKeyInArray!0 k0!2280))))

(declare-fun res!324365 () Bool)

(assert (=> start!47990 (=> (not res!324365) (not e!307888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47990 (= res!324365 (validMask!0 mask!3524))))

(assert (=> start!47990 e!307888))

(assert (=> start!47990 true))

(declare-fun array_inv!11949 (array!33484) Bool)

(assert (=> start!47990 (array_inv!11949 a!3235)))

(assert (= (and start!47990 res!324365) b!528317))

(assert (= (and b!528317 res!324366) b!528310))

(assert (= (and b!528310 res!324367) b!528319))

(assert (= (and b!528319 res!324357) b!528315))

(assert (= (and b!528315 res!324358) b!528325))

(assert (= (and b!528325 res!324361) b!528320))

(assert (= (and b!528320 res!324363) b!528318))

(assert (= (and b!528318 res!324359) b!528322))

(assert (= (and b!528322 res!324360) b!528312))

(assert (= (and b!528322 (not res!324368)) b!528323))

(assert (= (and b!528323 c!62285) b!528313))

(assert (= (and b!528323 (not c!62285)) b!528321))

(assert (= (and b!528313 res!324362) b!528314))

(assert (= (and b!528323 (not res!324369)) b!528316))

(assert (= (and b!528316 res!324370) b!528324))

(assert (= (and b!528316 (not res!324364)) b!528311))

(declare-fun m!509101 () Bool)

(assert (=> b!528315 m!509101))

(declare-fun m!509103 () Bool)

(assert (=> b!528322 m!509103))

(declare-fun m!509105 () Bool)

(assert (=> b!528322 m!509105))

(declare-fun m!509107 () Bool)

(assert (=> b!528322 m!509107))

(declare-fun m!509109 () Bool)

(assert (=> b!528322 m!509109))

(declare-fun m!509111 () Bool)

(assert (=> b!528322 m!509111))

(declare-fun m!509113 () Bool)

(assert (=> b!528322 m!509113))

(assert (=> b!528322 m!509111))

(declare-fun m!509115 () Bool)

(assert (=> b!528322 m!509115))

(declare-fun m!509117 () Bool)

(assert (=> b!528322 m!509117))

(assert (=> b!528322 m!509111))

(declare-fun m!509119 () Bool)

(assert (=> b!528322 m!509119))

(declare-fun m!509121 () Bool)

(assert (=> b!528319 m!509121))

(assert (=> b!528310 m!509111))

(assert (=> b!528310 m!509111))

(declare-fun m!509123 () Bool)

(assert (=> b!528310 m!509123))

(declare-fun m!509125 () Bool)

(assert (=> b!528311 m!509125))

(declare-fun m!509127 () Bool)

(assert (=> b!528318 m!509127))

(declare-fun m!509129 () Bool)

(assert (=> start!47990 m!509129))

(declare-fun m!509131 () Bool)

(assert (=> start!47990 m!509131))

(declare-fun m!509133 () Bool)

(assert (=> b!528323 m!509133))

(declare-fun m!509135 () Bool)

(assert (=> b!528323 m!509135))

(assert (=> b!528323 m!509111))

(declare-fun m!509137 () Bool)

(assert (=> b!528313 m!509137))

(assert (=> b!528313 m!509125))

(declare-fun m!509139 () Bool)

(assert (=> b!528325 m!509139))

(assert (=> b!528324 m!509111))

(assert (=> b!528324 m!509111))

(declare-fun m!509141 () Bool)

(assert (=> b!528324 m!509141))

(assert (=> b!528312 m!509111))

(assert (=> b!528312 m!509111))

(declare-fun m!509143 () Bool)

(assert (=> b!528312 m!509143))

(declare-fun m!509145 () Bool)

(assert (=> b!528320 m!509145))

(check-sat (not b!528319) (not b!528310) (not b!528322) (not b!528311) (not b!528320) (not b!528323) (not b!528318) (not b!528312) (not b!528324) (not start!47990) (not b!528313) (not b!528325) (not b!528315))
(check-sat)
