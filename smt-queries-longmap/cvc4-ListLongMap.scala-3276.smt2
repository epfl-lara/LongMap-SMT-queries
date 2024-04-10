; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45604 () Bool)

(assert start!45604)

(declare-fun b!502330 () Bool)

(declare-fun e!294241 () Bool)

(assert (=> b!502330 (= e!294241 false)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32360 0))(
  ( (array!32361 (arr!15560 (Array (_ BitVec 32) (_ BitVec 64))) (size!15924 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32360)

(declare-fun e!294242 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!502331 () Bool)

(declare-datatypes ((SeekEntryResult!4027 0))(
  ( (MissingZero!4027 (index!18296 (_ BitVec 32))) (Found!4027 (index!18297 (_ BitVec 32))) (Intermediate!4027 (undefined!4839 Bool) (index!18298 (_ BitVec 32)) (x!47324 (_ BitVec 32))) (Undefined!4027) (MissingVacant!4027 (index!18299 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32360 (_ BitVec 32)) SeekEntryResult!4027)

(assert (=> b!502331 (= e!294242 (= (seekEntryOrOpen!0 (select (arr!15560 a!3235) j!176) a!3235 mask!3524) (Found!4027 j!176)))))

(declare-fun b!502332 () Bool)

(declare-fun e!294240 () Bool)

(declare-fun e!294235 () Bool)

(assert (=> b!502332 (= e!294240 e!294235)))

(declare-fun res!303772 () Bool)

(assert (=> b!502332 (=> res!303772 e!294235)))

(declare-fun lt!228312 () SeekEntryResult!4027)

(declare-fun lt!228307 () (_ BitVec 32))

(assert (=> b!502332 (= res!303772 (or (bvsgt (x!47324 lt!228312) #b01111111111111111111111111111110) (bvslt lt!228307 #b00000000000000000000000000000000) (bvsge lt!228307 (size!15924 a!3235)) (bvslt (index!18298 lt!228312) #b00000000000000000000000000000000) (bvsge (index!18298 lt!228312) (size!15924 a!3235)) (not (= lt!228312 (Intermediate!4027 false (index!18298 lt!228312) (x!47324 lt!228312))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!502332 (= (index!18298 lt!228312) i!1204)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-datatypes ((Unit!15184 0))(
  ( (Unit!15185) )
))
(declare-fun lt!228310 () Unit!15184)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32360 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15184)

(assert (=> b!502332 (= lt!228310 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!228307 #b00000000000000000000000000000000 (index!18298 lt!228312) (x!47324 lt!228312) mask!3524))))

(assert (=> b!502332 (and (or (= (select (arr!15560 a!3235) (index!18298 lt!228312)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15560 a!3235) (index!18298 lt!228312)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15560 a!3235) (index!18298 lt!228312)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15560 a!3235) (index!18298 lt!228312)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228308 () Unit!15184)

(declare-fun e!294236 () Unit!15184)

(assert (=> b!502332 (= lt!228308 e!294236)))

(declare-fun c!59564 () Bool)

(assert (=> b!502332 (= c!59564 (= (select (arr!15560 a!3235) (index!18298 lt!228312)) (select (arr!15560 a!3235) j!176)))))

(assert (=> b!502332 (and (bvslt (x!47324 lt!228312) #b01111111111111111111111111111110) (or (= (select (arr!15560 a!3235) (index!18298 lt!228312)) (select (arr!15560 a!3235) j!176)) (= (select (arr!15560 a!3235) (index!18298 lt!228312)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15560 a!3235) (index!18298 lt!228312)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!502333 () Bool)

(declare-fun res!303764 () Bool)

(assert (=> b!502333 (=> res!303764 e!294235)))

(declare-fun e!294238 () Bool)

(assert (=> b!502333 (= res!303764 e!294238)))

(declare-fun res!303766 () Bool)

(assert (=> b!502333 (=> (not res!303766) (not e!294238))))

(assert (=> b!502333 (= res!303766 (bvsgt #b00000000000000000000000000000000 (x!47324 lt!228312)))))

(declare-fun b!502334 () Bool)

(assert (=> b!502334 (= e!294235 true)))

(declare-fun lt!228309 () (_ BitVec 64))

(declare-fun lt!228315 () array!32360)

(declare-fun lt!228313 () SeekEntryResult!4027)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32360 (_ BitVec 32)) SeekEntryResult!4027)

(assert (=> b!502334 (= lt!228313 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228307 lt!228309 lt!228315 mask!3524))))

(declare-fun b!502335 () Bool)

(declare-fun res!303759 () Bool)

(declare-fun e!294243 () Bool)

(assert (=> b!502335 (=> (not res!303759) (not e!294243))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502335 (= res!303759 (validKeyInArray!0 (select (arr!15560 a!3235) j!176)))))

(declare-fun b!502336 () Bool)

(declare-fun Unit!15186 () Unit!15184)

(assert (=> b!502336 (= e!294236 Unit!15186)))

(declare-fun lt!228306 () Unit!15184)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32360 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15184)

(assert (=> b!502336 (= lt!228306 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!228307 #b00000000000000000000000000000000 (index!18298 lt!228312) (x!47324 lt!228312) mask!3524))))

(declare-fun res!303761 () Bool)

(assert (=> b!502336 (= res!303761 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228307 lt!228309 lt!228315 mask!3524) (Intermediate!4027 false (index!18298 lt!228312) (x!47324 lt!228312))))))

(assert (=> b!502336 (=> (not res!303761) (not e!294241))))

(assert (=> b!502336 e!294241))

(declare-fun b!502337 () Bool)

(declare-fun Unit!15187 () Unit!15184)

(assert (=> b!502337 (= e!294236 Unit!15187)))

(declare-fun b!502338 () Bool)

(declare-fun res!303770 () Bool)

(declare-fun e!294237 () Bool)

(assert (=> b!502338 (=> (not res!303770) (not e!294237))))

(declare-datatypes ((List!9718 0))(
  ( (Nil!9715) (Cons!9714 (h!10591 (_ BitVec 64)) (t!15946 List!9718)) )
))
(declare-fun arrayNoDuplicates!0 (array!32360 (_ BitVec 32) List!9718) Bool)

(assert (=> b!502338 (= res!303770 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9715))))

(declare-fun b!502339 () Bool)

(declare-fun res!303773 () Bool)

(assert (=> b!502339 (=> (not res!303773) (not e!294243))))

(assert (=> b!502339 (= res!303773 (and (= (size!15924 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15924 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15924 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!502340 () Bool)

(declare-fun res!303767 () Bool)

(assert (=> b!502340 (=> res!303767 e!294240)))

(assert (=> b!502340 (= res!303767 (or (undefined!4839 lt!228312) (not (is-Intermediate!4027 lt!228312))))))

(declare-fun b!502342 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32360 (_ BitVec 32)) SeekEntryResult!4027)

(assert (=> b!502342 (= e!294238 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228307 (index!18298 lt!228312) (select (arr!15560 a!3235) j!176) a!3235 mask!3524) (Found!4027 j!176))))))

(declare-fun b!502343 () Bool)

(assert (=> b!502343 (= e!294237 (not e!294240))))

(declare-fun res!303765 () Bool)

(assert (=> b!502343 (=> res!303765 e!294240)))

(declare-fun lt!228316 () (_ BitVec 32))

(assert (=> b!502343 (= res!303765 (= lt!228312 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228316 lt!228309 lt!228315 mask!3524)))))

(assert (=> b!502343 (= lt!228312 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228307 (select (arr!15560 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502343 (= lt!228316 (toIndex!0 lt!228309 mask!3524))))

(assert (=> b!502343 (= lt!228309 (select (store (arr!15560 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!502343 (= lt!228307 (toIndex!0 (select (arr!15560 a!3235) j!176) mask!3524))))

(assert (=> b!502343 (= lt!228315 (array!32361 (store (arr!15560 a!3235) i!1204 k!2280) (size!15924 a!3235)))))

(assert (=> b!502343 e!294242))

(declare-fun res!303763 () Bool)

(assert (=> b!502343 (=> (not res!303763) (not e!294242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32360 (_ BitVec 32)) Bool)

(assert (=> b!502343 (= res!303763 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228314 () Unit!15184)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32360 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15184)

(assert (=> b!502343 (= lt!228314 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!502344 () Bool)

(declare-fun res!303771 () Bool)

(assert (=> b!502344 (=> (not res!303771) (not e!294243))))

(assert (=> b!502344 (= res!303771 (validKeyInArray!0 k!2280))))

(declare-fun b!502341 () Bool)

(assert (=> b!502341 (= e!294243 e!294237)))

(declare-fun res!303768 () Bool)

(assert (=> b!502341 (=> (not res!303768) (not e!294237))))

(declare-fun lt!228311 () SeekEntryResult!4027)

(assert (=> b!502341 (= res!303768 (or (= lt!228311 (MissingZero!4027 i!1204)) (= lt!228311 (MissingVacant!4027 i!1204))))))

(assert (=> b!502341 (= lt!228311 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!303769 () Bool)

(assert (=> start!45604 (=> (not res!303769) (not e!294243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45604 (= res!303769 (validMask!0 mask!3524))))

(assert (=> start!45604 e!294243))

(assert (=> start!45604 true))

(declare-fun array_inv!11356 (array!32360) Bool)

(assert (=> start!45604 (array_inv!11356 a!3235)))

(declare-fun b!502345 () Bool)

(declare-fun res!303760 () Bool)

(assert (=> b!502345 (=> (not res!303760) (not e!294237))))

(assert (=> b!502345 (= res!303760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!502346 () Bool)

(declare-fun res!303762 () Bool)

(assert (=> b!502346 (=> (not res!303762) (not e!294243))))

(declare-fun arrayContainsKey!0 (array!32360 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502346 (= res!303762 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45604 res!303769) b!502339))

(assert (= (and b!502339 res!303773) b!502335))

(assert (= (and b!502335 res!303759) b!502344))

(assert (= (and b!502344 res!303771) b!502346))

(assert (= (and b!502346 res!303762) b!502341))

(assert (= (and b!502341 res!303768) b!502345))

(assert (= (and b!502345 res!303760) b!502338))

(assert (= (and b!502338 res!303770) b!502343))

(assert (= (and b!502343 res!303763) b!502331))

(assert (= (and b!502343 (not res!303765)) b!502340))

(assert (= (and b!502340 (not res!303767)) b!502332))

(assert (= (and b!502332 c!59564) b!502336))

(assert (= (and b!502332 (not c!59564)) b!502337))

(assert (= (and b!502336 res!303761) b!502330))

(assert (= (and b!502332 (not res!303772)) b!502333))

(assert (= (and b!502333 res!303766) b!502342))

(assert (= (and b!502333 (not res!303764)) b!502334))

(declare-fun m!483275 () Bool)

(assert (=> b!502332 m!483275))

(declare-fun m!483277 () Bool)

(assert (=> b!502332 m!483277))

(declare-fun m!483279 () Bool)

(assert (=> b!502332 m!483279))

(declare-fun m!483281 () Bool)

(assert (=> b!502346 m!483281))

(assert (=> b!502335 m!483279))

(assert (=> b!502335 m!483279))

(declare-fun m!483283 () Bool)

(assert (=> b!502335 m!483283))

(declare-fun m!483285 () Bool)

(assert (=> start!45604 m!483285))

(declare-fun m!483287 () Bool)

(assert (=> start!45604 m!483287))

(declare-fun m!483289 () Bool)

(assert (=> b!502338 m!483289))

(declare-fun m!483291 () Bool)

(assert (=> b!502334 m!483291))

(declare-fun m!483293 () Bool)

(assert (=> b!502344 m!483293))

(declare-fun m!483295 () Bool)

(assert (=> b!502345 m!483295))

(declare-fun m!483297 () Bool)

(assert (=> b!502336 m!483297))

(assert (=> b!502336 m!483291))

(assert (=> b!502342 m!483279))

(assert (=> b!502342 m!483279))

(declare-fun m!483299 () Bool)

(assert (=> b!502342 m!483299))

(assert (=> b!502331 m!483279))

(assert (=> b!502331 m!483279))

(declare-fun m!483301 () Bool)

(assert (=> b!502331 m!483301))

(declare-fun m!483303 () Bool)

(assert (=> b!502343 m!483303))

(declare-fun m!483305 () Bool)

(assert (=> b!502343 m!483305))

(declare-fun m!483307 () Bool)

(assert (=> b!502343 m!483307))

(declare-fun m!483309 () Bool)

(assert (=> b!502343 m!483309))

(assert (=> b!502343 m!483279))

(declare-fun m!483311 () Bool)

(assert (=> b!502343 m!483311))

(assert (=> b!502343 m!483279))

(declare-fun m!483313 () Bool)

(assert (=> b!502343 m!483313))

(assert (=> b!502343 m!483279))

(declare-fun m!483315 () Bool)

(assert (=> b!502343 m!483315))

(declare-fun m!483317 () Bool)

(assert (=> b!502343 m!483317))

(declare-fun m!483319 () Bool)

(assert (=> b!502341 m!483319))

(push 1)

