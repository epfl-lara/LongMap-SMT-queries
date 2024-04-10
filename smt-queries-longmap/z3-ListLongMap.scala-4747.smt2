; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65544 () Bool)

(assert start!65544)

(declare-fun b!748360 () Bool)

(declare-fun res!504808 () Bool)

(declare-fun e!417709 () Bool)

(assert (=> b!748360 (=> (not res!504808) (not e!417709))))

(declare-datatypes ((array!41717 0))(
  ( (array!41718 (arr!19972 (Array (_ BitVec 32) (_ BitVec 64))) (size!20393 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41717)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!748360 (= res!504808 (validKeyInArray!0 (select (arr!19972 a!3186) j!159)))))

(declare-fun b!748361 () Bool)

(declare-fun res!504800 () Bool)

(declare-fun e!417712 () Bool)

(assert (=> b!748361 (=> (not res!504800) (not e!417712))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!748361 (= res!504800 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20393 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20393 a!3186))))))

(declare-fun b!748362 () Bool)

(declare-fun res!504805 () Bool)

(assert (=> b!748362 (=> (not res!504805) (not e!417709))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!748362 (= res!504805 (and (= (size!20393 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20393 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20393 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!748363 () Bool)

(declare-fun e!417707 () Bool)

(assert (=> b!748363 (= e!417712 e!417707)))

(declare-fun res!504811 () Bool)

(assert (=> b!748363 (=> (not res!504811) (not e!417707))))

(declare-datatypes ((SeekEntryResult!7572 0))(
  ( (MissingZero!7572 (index!32656 (_ BitVec 32))) (Found!7572 (index!32657 (_ BitVec 32))) (Intermediate!7572 (undefined!8384 Bool) (index!32658 (_ BitVec 32)) (x!63594 (_ BitVec 32))) (Undefined!7572) (MissingVacant!7572 (index!32659 (_ BitVec 32))) )
))
(declare-fun lt!332666 () SeekEntryResult!7572)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41717 (_ BitVec 32)) SeekEntryResult!7572)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!748363 (= res!504811 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19972 a!3186) j!159) mask!3328) (select (arr!19972 a!3186) j!159) a!3186 mask!3328) lt!332666))))

(assert (=> b!748363 (= lt!332666 (Intermediate!7572 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!748364 () Bool)

(declare-fun res!504815 () Bool)

(assert (=> b!748364 (=> (not res!504815) (not e!417707))))

(assert (=> b!748364 (= res!504815 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19972 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!748365 () Bool)

(declare-fun res!504814 () Bool)

(assert (=> b!748365 (=> (not res!504814) (not e!417712))))

(declare-datatypes ((List!13974 0))(
  ( (Nil!13971) (Cons!13970 (h!15042 (_ BitVec 64)) (t!20289 List!13974)) )
))
(declare-fun arrayNoDuplicates!0 (array!41717 (_ BitVec 32) List!13974) Bool)

(assert (=> b!748365 (= res!504814 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13971))))

(declare-fun b!748366 () Bool)

(declare-datatypes ((Unit!25668 0))(
  ( (Unit!25669) )
))
(declare-fun e!417705 () Unit!25668)

(declare-fun Unit!25670 () Unit!25668)

(assert (=> b!748366 (= e!417705 Unit!25670)))

(declare-fun b!748367 () Bool)

(declare-fun e!417710 () Bool)

(assert (=> b!748367 (= e!417710 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19972 a!3186) j!159) a!3186 mask!3328) lt!332666))))

(declare-fun b!748368 () Bool)

(declare-fun lt!332668 () SeekEntryResult!7572)

(declare-fun e!417708 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41717 (_ BitVec 32)) SeekEntryResult!7572)

(assert (=> b!748368 (= e!417708 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19972 a!3186) j!159) a!3186 mask!3328) lt!332668))))

(declare-fun b!748369 () Bool)

(declare-fun e!417711 () Bool)

(assert (=> b!748369 (= e!417707 e!417711)))

(declare-fun res!504801 () Bool)

(assert (=> b!748369 (=> (not res!504801) (not e!417711))))

(declare-fun lt!332673 () SeekEntryResult!7572)

(declare-fun lt!332670 () SeekEntryResult!7572)

(assert (=> b!748369 (= res!504801 (= lt!332673 lt!332670))))

(declare-fun lt!332672 () (_ BitVec 64))

(declare-fun lt!332671 () array!41717)

(assert (=> b!748369 (= lt!332670 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332672 lt!332671 mask!3328))))

(assert (=> b!748369 (= lt!332673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332672 mask!3328) lt!332672 lt!332671 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!748369 (= lt!332672 (select (store (arr!19972 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!748369 (= lt!332671 (array!41718 (store (arr!19972 a!3186) i!1173 k0!2102) (size!20393 a!3186)))))

(declare-fun b!748370 () Bool)

(declare-fun res!504802 () Bool)

(assert (=> b!748370 (=> (not res!504802) (not e!417712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41717 (_ BitVec 32)) Bool)

(assert (=> b!748370 (= res!504802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!748371 () Bool)

(declare-fun e!417706 () Bool)

(assert (=> b!748371 (= e!417706 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(assert (=> b!748371 (= (select (store (arr!19972 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332675 () Unit!25668)

(assert (=> b!748371 (= lt!332675 e!417705)))

(declare-fun c!82161 () Bool)

(assert (=> b!748371 (= c!82161 (= (select (store (arr!19972 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!748373 () Bool)

(declare-fun Unit!25671 () Unit!25668)

(assert (=> b!748373 (= e!417705 Unit!25671)))

(assert (=> b!748373 false))

(declare-fun b!748374 () Bool)

(assert (=> b!748374 (= e!417709 e!417712)))

(declare-fun res!504803 () Bool)

(assert (=> b!748374 (=> (not res!504803) (not e!417712))))

(declare-fun lt!332669 () SeekEntryResult!7572)

(assert (=> b!748374 (= res!504803 (or (= lt!332669 (MissingZero!7572 i!1173)) (= lt!332669 (MissingVacant!7572 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41717 (_ BitVec 32)) SeekEntryResult!7572)

(assert (=> b!748374 (= lt!332669 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!504810 () Bool)

(assert (=> start!65544 (=> (not res!504810) (not e!417709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65544 (= res!504810 (validMask!0 mask!3328))))

(assert (=> start!65544 e!417709))

(assert (=> start!65544 true))

(declare-fun array_inv!15768 (array!41717) Bool)

(assert (=> start!65544 (array_inv!15768 a!3186)))

(declare-fun b!748372 () Bool)

(declare-fun res!504813 () Bool)

(assert (=> b!748372 (=> res!504813 e!417706)))

(assert (=> b!748372 (= res!504813 (= (select (store (arr!19972 a!3186) i!1173 k0!2102) index!1321) lt!332672))))

(declare-fun b!748375 () Bool)

(assert (=> b!748375 (= e!417711 (not e!417706))))

(declare-fun res!504804 () Bool)

(assert (=> b!748375 (=> res!504804 e!417706)))

(get-info :version)

(assert (=> b!748375 (= res!504804 (or (not ((_ is Intermediate!7572) lt!332670)) (bvslt x!1131 (x!63594 lt!332670)) (not (= x!1131 (x!63594 lt!332670))) (not (= index!1321 (index!32658 lt!332670)))))))

(assert (=> b!748375 e!417708))

(declare-fun res!504809 () Bool)

(assert (=> b!748375 (=> (not res!504809) (not e!417708))))

(declare-fun lt!332667 () SeekEntryResult!7572)

(assert (=> b!748375 (= res!504809 (= lt!332667 lt!332668))))

(assert (=> b!748375 (= lt!332668 (Found!7572 j!159))))

(assert (=> b!748375 (= lt!332667 (seekEntryOrOpen!0 (select (arr!19972 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!748375 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332674 () Unit!25668)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41717 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25668)

(assert (=> b!748375 (= lt!332674 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!748376 () Bool)

(declare-fun res!504807 () Bool)

(assert (=> b!748376 (=> res!504807 e!417706)))

(assert (=> b!748376 (= res!504807 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19972 a!3186) j!159) a!3186 mask!3328) lt!332668)))))

(declare-fun b!748377 () Bool)

(declare-fun res!504799 () Bool)

(assert (=> b!748377 (=> (not res!504799) (not e!417707))))

(assert (=> b!748377 (= res!504799 e!417710)))

(declare-fun c!82162 () Bool)

(assert (=> b!748377 (= c!82162 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!748378 () Bool)

(assert (=> b!748378 (= e!417710 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19972 a!3186) j!159) a!3186 mask!3328) (Found!7572 j!159)))))

(declare-fun b!748379 () Bool)

(declare-fun res!504806 () Bool)

(assert (=> b!748379 (=> (not res!504806) (not e!417709))))

(declare-fun arrayContainsKey!0 (array!41717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!748379 (= res!504806 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!748380 () Bool)

(declare-fun res!504812 () Bool)

(assert (=> b!748380 (=> (not res!504812) (not e!417709))))

(assert (=> b!748380 (= res!504812 (validKeyInArray!0 k0!2102))))

(assert (= (and start!65544 res!504810) b!748362))

(assert (= (and b!748362 res!504805) b!748360))

(assert (= (and b!748360 res!504808) b!748380))

(assert (= (and b!748380 res!504812) b!748379))

(assert (= (and b!748379 res!504806) b!748374))

(assert (= (and b!748374 res!504803) b!748370))

(assert (= (and b!748370 res!504802) b!748365))

(assert (= (and b!748365 res!504814) b!748361))

(assert (= (and b!748361 res!504800) b!748363))

(assert (= (and b!748363 res!504811) b!748364))

(assert (= (and b!748364 res!504815) b!748377))

(assert (= (and b!748377 c!82162) b!748367))

(assert (= (and b!748377 (not c!82162)) b!748378))

(assert (= (and b!748377 res!504799) b!748369))

(assert (= (and b!748369 res!504801) b!748375))

(assert (= (and b!748375 res!504809) b!748368))

(assert (= (and b!748375 (not res!504804)) b!748376))

(assert (= (and b!748376 (not res!504807)) b!748372))

(assert (= (and b!748372 (not res!504813)) b!748371))

(assert (= (and b!748371 c!82161) b!748373))

(assert (= (and b!748371 (not c!82161)) b!748366))

(declare-fun m!698221 () Bool)

(assert (=> b!748380 m!698221))

(declare-fun m!698223 () Bool)

(assert (=> b!748367 m!698223))

(assert (=> b!748367 m!698223))

(declare-fun m!698225 () Bool)

(assert (=> b!748367 m!698225))

(declare-fun m!698227 () Bool)

(assert (=> b!748379 m!698227))

(assert (=> b!748375 m!698223))

(assert (=> b!748375 m!698223))

(declare-fun m!698229 () Bool)

(assert (=> b!748375 m!698229))

(declare-fun m!698231 () Bool)

(assert (=> b!748375 m!698231))

(declare-fun m!698233 () Bool)

(assert (=> b!748375 m!698233))

(declare-fun m!698235 () Bool)

(assert (=> b!748372 m!698235))

(declare-fun m!698237 () Bool)

(assert (=> b!748372 m!698237))

(declare-fun m!698239 () Bool)

(assert (=> b!748374 m!698239))

(declare-fun m!698241 () Bool)

(assert (=> b!748370 m!698241))

(declare-fun m!698243 () Bool)

(assert (=> b!748369 m!698243))

(declare-fun m!698245 () Bool)

(assert (=> b!748369 m!698245))

(declare-fun m!698247 () Bool)

(assert (=> b!748369 m!698247))

(assert (=> b!748369 m!698243))

(assert (=> b!748369 m!698235))

(declare-fun m!698249 () Bool)

(assert (=> b!748369 m!698249))

(declare-fun m!698251 () Bool)

(assert (=> b!748364 m!698251))

(assert (=> b!748378 m!698223))

(assert (=> b!748378 m!698223))

(declare-fun m!698253 () Bool)

(assert (=> b!748378 m!698253))

(assert (=> b!748376 m!698223))

(assert (=> b!748376 m!698223))

(assert (=> b!748376 m!698253))

(declare-fun m!698255 () Bool)

(assert (=> b!748365 m!698255))

(declare-fun m!698257 () Bool)

(assert (=> start!65544 m!698257))

(declare-fun m!698259 () Bool)

(assert (=> start!65544 m!698259))

(assert (=> b!748371 m!698235))

(assert (=> b!748371 m!698237))

(assert (=> b!748363 m!698223))

(assert (=> b!748363 m!698223))

(declare-fun m!698261 () Bool)

(assert (=> b!748363 m!698261))

(assert (=> b!748363 m!698261))

(assert (=> b!748363 m!698223))

(declare-fun m!698263 () Bool)

(assert (=> b!748363 m!698263))

(assert (=> b!748360 m!698223))

(assert (=> b!748360 m!698223))

(declare-fun m!698265 () Bool)

(assert (=> b!748360 m!698265))

(assert (=> b!748368 m!698223))

(assert (=> b!748368 m!698223))

(declare-fun m!698267 () Bool)

(assert (=> b!748368 m!698267))

(check-sat (not b!748360) (not b!748367) (not b!748378) (not b!748380) (not b!748375) (not b!748368) (not b!748363) (not b!748379) (not start!65544) (not b!748365) (not b!748374) (not b!748369) (not b!748370) (not b!748376))
(check-sat)
