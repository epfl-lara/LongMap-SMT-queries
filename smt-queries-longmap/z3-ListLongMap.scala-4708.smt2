; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65436 () Bool)

(assert start!65436)

(declare-fun b!742392 () Bool)

(declare-fun res!499245 () Bool)

(declare-fun e!415022 () Bool)

(assert (=> b!742392 (=> (not res!499245) (not e!415022))))

(declare-datatypes ((array!41479 0))(
  ( (array!41480 (arr!19849 (Array (_ BitVec 32) (_ BitVec 64))) (size!20269 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41479)

(declare-datatypes ((List!13758 0))(
  ( (Nil!13755) (Cons!13754 (h!14832 (_ BitVec 64)) (t!20065 List!13758)) )
))
(declare-fun arrayNoDuplicates!0 (array!41479 (_ BitVec 32) List!13758) Bool)

(assert (=> b!742392 (= res!499245 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13755))))

(declare-fun b!742393 () Bool)

(declare-fun res!499242 () Bool)

(assert (=> b!742393 (=> (not res!499242) (not e!415022))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41479 (_ BitVec 32)) Bool)

(assert (=> b!742393 (= res!499242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!742394 () Bool)

(declare-fun res!499239 () Bool)

(declare-fun e!415026 () Bool)

(assert (=> b!742394 (=> (not res!499239) (not e!415026))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742394 (= res!499239 (validKeyInArray!0 (select (arr!19849 a!3186) j!159)))))

(declare-fun b!742395 () Bool)

(declare-fun e!415027 () Bool)

(assert (=> b!742395 (= e!415022 e!415027)))

(declare-fun res!499247 () Bool)

(assert (=> b!742395 (=> (not res!499247) (not e!415027))))

(declare-datatypes ((SeekEntryResult!7405 0))(
  ( (MissingZero!7405 (index!31988 (_ BitVec 32))) (Found!7405 (index!31989 (_ BitVec 32))) (Intermediate!7405 (undefined!8217 Bool) (index!31990 (_ BitVec 32)) (x!63127 (_ BitVec 32))) (Undefined!7405) (MissingVacant!7405 (index!31991 (_ BitVec 32))) )
))
(declare-fun lt!329813 () SeekEntryResult!7405)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41479 (_ BitVec 32)) SeekEntryResult!7405)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742395 (= res!499247 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19849 a!3186) j!159) mask!3328) (select (arr!19849 a!3186) j!159) a!3186 mask!3328) lt!329813))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!742395 (= lt!329813 (Intermediate!7405 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!742396 () Bool)

(declare-fun e!415024 () Bool)

(assert (=> b!742396 (= e!415024 (not true))))

(declare-fun e!415023 () Bool)

(assert (=> b!742396 e!415023))

(declare-fun res!499249 () Bool)

(assert (=> b!742396 (=> (not res!499249) (not e!415023))))

(assert (=> b!742396 (= res!499249 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25369 0))(
  ( (Unit!25370) )
))
(declare-fun lt!329809 () Unit!25369)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41479 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25369)

(assert (=> b!742396 (= lt!329809 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!742397 () Bool)

(declare-fun res!499238 () Bool)

(assert (=> b!742397 (=> (not res!499238) (not e!415026))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!742397 (= res!499238 (and (= (size!20269 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20269 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20269 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!742398 () Bool)

(declare-fun e!415025 () Bool)

(assert (=> b!742398 (= e!415023 e!415025)))

(declare-fun res!499241 () Bool)

(assert (=> b!742398 (=> (not res!499241) (not e!415025))))

(declare-fun lt!329810 () SeekEntryResult!7405)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41479 (_ BitVec 32)) SeekEntryResult!7405)

(assert (=> b!742398 (= res!499241 (= (seekEntryOrOpen!0 (select (arr!19849 a!3186) j!159) a!3186 mask!3328) lt!329810))))

(assert (=> b!742398 (= lt!329810 (Found!7405 j!159))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!415028 () Bool)

(declare-fun b!742399 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41479 (_ BitVec 32)) SeekEntryResult!7405)

(assert (=> b!742399 (= e!415028 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19849 a!3186) j!159) a!3186 mask!3328) (Found!7405 j!159)))))

(declare-fun b!742400 () Bool)

(declare-fun res!499236 () Bool)

(assert (=> b!742400 (=> (not res!499236) (not e!415022))))

(assert (=> b!742400 (= res!499236 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20269 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20269 a!3186))))))

(declare-fun b!742401 () Bool)

(declare-fun res!499244 () Bool)

(assert (=> b!742401 (=> (not res!499244) (not e!415027))))

(assert (=> b!742401 (= res!499244 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19849 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!499248 () Bool)

(assert (=> start!65436 (=> (not res!499248) (not e!415026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65436 (= res!499248 (validMask!0 mask!3328))))

(assert (=> start!65436 e!415026))

(assert (=> start!65436 true))

(declare-fun array_inv!15708 (array!41479) Bool)

(assert (=> start!65436 (array_inv!15708 a!3186)))

(declare-fun b!742402 () Bool)

(declare-fun res!499235 () Bool)

(assert (=> b!742402 (=> (not res!499235) (not e!415027))))

(assert (=> b!742402 (= res!499235 e!415028)))

(declare-fun c!81962 () Bool)

(assert (=> b!742402 (= c!81962 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!742403 () Bool)

(assert (=> b!742403 (= e!415028 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19849 a!3186) j!159) a!3186 mask!3328) lt!329813))))

(declare-fun b!742404 () Bool)

(declare-fun res!499237 () Bool)

(assert (=> b!742404 (=> (not res!499237) (not e!415026))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742404 (= res!499237 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!742405 () Bool)

(assert (=> b!742405 (= e!415027 e!415024)))

(declare-fun res!499243 () Bool)

(assert (=> b!742405 (=> (not res!499243) (not e!415024))))

(declare-fun lt!329812 () (_ BitVec 64))

(declare-fun lt!329811 () array!41479)

(assert (=> b!742405 (= res!499243 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329812 mask!3328) lt!329812 lt!329811 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329812 lt!329811 mask!3328)))))

(assert (=> b!742405 (= lt!329812 (select (store (arr!19849 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!742405 (= lt!329811 (array!41480 (store (arr!19849 a!3186) i!1173 k0!2102) (size!20269 a!3186)))))

(declare-fun b!742406 () Bool)

(declare-fun res!499246 () Bool)

(assert (=> b!742406 (=> (not res!499246) (not e!415026))))

(assert (=> b!742406 (= res!499246 (validKeyInArray!0 k0!2102))))

(declare-fun b!742407 () Bool)

(assert (=> b!742407 (= e!415025 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19849 a!3186) j!159) a!3186 mask!3328) lt!329810))))

(declare-fun b!742408 () Bool)

(assert (=> b!742408 (= e!415026 e!415022)))

(declare-fun res!499240 () Bool)

(assert (=> b!742408 (=> (not res!499240) (not e!415022))))

(declare-fun lt!329814 () SeekEntryResult!7405)

(assert (=> b!742408 (= res!499240 (or (= lt!329814 (MissingZero!7405 i!1173)) (= lt!329814 (MissingVacant!7405 i!1173))))))

(assert (=> b!742408 (= lt!329814 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!65436 res!499248) b!742397))

(assert (= (and b!742397 res!499238) b!742394))

(assert (= (and b!742394 res!499239) b!742406))

(assert (= (and b!742406 res!499246) b!742404))

(assert (= (and b!742404 res!499237) b!742408))

(assert (= (and b!742408 res!499240) b!742393))

(assert (= (and b!742393 res!499242) b!742392))

(assert (= (and b!742392 res!499245) b!742400))

(assert (= (and b!742400 res!499236) b!742395))

(assert (= (and b!742395 res!499247) b!742401))

(assert (= (and b!742401 res!499244) b!742402))

(assert (= (and b!742402 c!81962) b!742403))

(assert (= (and b!742402 (not c!81962)) b!742399))

(assert (= (and b!742402 res!499235) b!742405))

(assert (= (and b!742405 res!499243) b!742396))

(assert (= (and b!742396 res!499249) b!742398))

(assert (= (and b!742398 res!499241) b!742407))

(declare-fun m!693759 () Bool)

(assert (=> b!742401 m!693759))

(declare-fun m!693761 () Bool)

(assert (=> b!742399 m!693761))

(assert (=> b!742399 m!693761))

(declare-fun m!693763 () Bool)

(assert (=> b!742399 m!693763))

(assert (=> b!742395 m!693761))

(assert (=> b!742395 m!693761))

(declare-fun m!693765 () Bool)

(assert (=> b!742395 m!693765))

(assert (=> b!742395 m!693765))

(assert (=> b!742395 m!693761))

(declare-fun m!693767 () Bool)

(assert (=> b!742395 m!693767))

(declare-fun m!693769 () Bool)

(assert (=> b!742393 m!693769))

(declare-fun m!693771 () Bool)

(assert (=> b!742406 m!693771))

(declare-fun m!693773 () Bool)

(assert (=> b!742404 m!693773))

(assert (=> b!742403 m!693761))

(assert (=> b!742403 m!693761))

(declare-fun m!693775 () Bool)

(assert (=> b!742403 m!693775))

(assert (=> b!742394 m!693761))

(assert (=> b!742394 m!693761))

(declare-fun m!693777 () Bool)

(assert (=> b!742394 m!693777))

(declare-fun m!693779 () Bool)

(assert (=> start!65436 m!693779))

(declare-fun m!693781 () Bool)

(assert (=> start!65436 m!693781))

(assert (=> b!742398 m!693761))

(assert (=> b!742398 m!693761))

(declare-fun m!693783 () Bool)

(assert (=> b!742398 m!693783))

(declare-fun m!693785 () Bool)

(assert (=> b!742405 m!693785))

(declare-fun m!693787 () Bool)

(assert (=> b!742405 m!693787))

(declare-fun m!693789 () Bool)

(assert (=> b!742405 m!693789))

(assert (=> b!742405 m!693785))

(declare-fun m!693791 () Bool)

(assert (=> b!742405 m!693791))

(declare-fun m!693793 () Bool)

(assert (=> b!742405 m!693793))

(declare-fun m!693795 () Bool)

(assert (=> b!742408 m!693795))

(assert (=> b!742407 m!693761))

(assert (=> b!742407 m!693761))

(declare-fun m!693797 () Bool)

(assert (=> b!742407 m!693797))

(declare-fun m!693799 () Bool)

(assert (=> b!742392 m!693799))

(declare-fun m!693801 () Bool)

(assert (=> b!742396 m!693801))

(declare-fun m!693803 () Bool)

(assert (=> b!742396 m!693803))

(check-sat (not b!742395) (not b!742392) (not b!742406) (not b!742398) (not start!65436) (not b!742399) (not b!742405) (not b!742408) (not b!742393) (not b!742403) (not b!742407) (not b!742394) (not b!742404) (not b!742396))
(check-sat)
