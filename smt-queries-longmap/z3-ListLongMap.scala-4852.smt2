; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66788 () Bool)

(assert start!66788)

(declare-fun b!770446 () Bool)

(declare-fun e!428933 () Bool)

(declare-fun e!428929 () Bool)

(assert (=> b!770446 (= e!428933 e!428929)))

(declare-fun res!521260 () Bool)

(assert (=> b!770446 (=> (not res!521260) (not e!428929))))

(declare-datatypes ((array!42369 0))(
  ( (array!42370 (arr!20285 (Array (_ BitVec 32) (_ BitVec 64))) (size!20706 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42369)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7882 0))(
  ( (MissingZero!7882 (index!33896 (_ BitVec 32))) (Found!7882 (index!33897 (_ BitVec 32))) (Intermediate!7882 (undefined!8694 Bool) (index!33898 (_ BitVec 32)) (x!64832 (_ BitVec 32))) (Undefined!7882) (MissingVacant!7882 (index!33899 (_ BitVec 32))) )
))
(declare-fun lt!342799 () SeekEntryResult!7882)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42369 (_ BitVec 32)) SeekEntryResult!7882)

(assert (=> b!770446 (= res!521260 (= (seekEntryOrOpen!0 (select (arr!20285 a!3186) j!159) a!3186 mask!3328) lt!342799))))

(assert (=> b!770446 (= lt!342799 (Found!7882 j!159))))

(declare-fun res!521255 () Bool)

(declare-fun e!428928 () Bool)

(assert (=> start!66788 (=> (not res!521255) (not e!428928))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66788 (= res!521255 (validMask!0 mask!3328))))

(assert (=> start!66788 e!428928))

(assert (=> start!66788 true))

(declare-fun array_inv!16168 (array!42369) Bool)

(assert (=> start!66788 (array_inv!16168 a!3186)))

(declare-fun b!770447 () Bool)

(declare-fun e!428932 () Bool)

(declare-fun e!428935 () Bool)

(assert (=> b!770447 (= e!428932 e!428935)))

(declare-fun res!521262 () Bool)

(assert (=> b!770447 (=> (not res!521262) (not e!428935))))

(declare-fun lt!342798 () SeekEntryResult!7882)

(declare-fun lt!342801 () SeekEntryResult!7882)

(assert (=> b!770447 (= res!521262 (= lt!342798 lt!342801))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!342800 () array!42369)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!342805 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42369 (_ BitVec 32)) SeekEntryResult!7882)

(assert (=> b!770447 (= lt!342801 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342805 lt!342800 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770447 (= lt!342798 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342805 mask!3328) lt!342805 lt!342800 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!770447 (= lt!342805 (select (store (arr!20285 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!770447 (= lt!342800 (array!42370 (store (arr!20285 a!3186) i!1173 k0!2102) (size!20706 a!3186)))))

(declare-fun b!770448 () Bool)

(declare-fun res!521247 () Bool)

(assert (=> b!770448 (=> (not res!521247) (not e!428928))))

(assert (=> b!770448 (= res!521247 (and (= (size!20706 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20706 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20706 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!770449 () Bool)

(declare-fun e!428926 () Bool)

(assert (=> b!770449 (= e!428926 e!428932)))

(declare-fun res!521253 () Bool)

(assert (=> b!770449 (=> (not res!521253) (not e!428932))))

(declare-fun lt!342803 () SeekEntryResult!7882)

(assert (=> b!770449 (= res!521253 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20285 a!3186) j!159) mask!3328) (select (arr!20285 a!3186) j!159) a!3186 mask!3328) lt!342803))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!770449 (= lt!342803 (Intermediate!7882 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!770450 () Bool)

(declare-fun res!521248 () Bool)

(assert (=> b!770450 (=> (not res!521248) (not e!428926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42369 (_ BitVec 32)) Bool)

(assert (=> b!770450 (= res!521248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!770451 () Bool)

(declare-fun e!428927 () Bool)

(assert (=> b!770451 (= e!428927 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20285 a!3186) j!159) a!3186 mask!3328) lt!342803))))

(declare-fun b!770452 () Bool)

(declare-fun res!521254 () Bool)

(assert (=> b!770452 (=> (not res!521254) (not e!428928))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!770452 (= res!521254 (validKeyInArray!0 (select (arr!20285 a!3186) j!159)))))

(declare-fun b!770453 () Bool)

(declare-fun res!521249 () Bool)

(assert (=> b!770453 (=> (not res!521249) (not e!428932))))

(assert (=> b!770453 (= res!521249 e!428927)))

(declare-fun c!84996 () Bool)

(assert (=> b!770453 (= c!84996 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!770454 () Bool)

(assert (=> b!770454 (= e!428928 e!428926)))

(declare-fun res!521251 () Bool)

(assert (=> b!770454 (=> (not res!521251) (not e!428926))))

(declare-fun lt!342806 () SeekEntryResult!7882)

(assert (=> b!770454 (= res!521251 (or (= lt!342806 (MissingZero!7882 i!1173)) (= lt!342806 (MissingVacant!7882 i!1173))))))

(assert (=> b!770454 (= lt!342806 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!770455 () Bool)

(declare-fun e!428931 () Bool)

(assert (=> b!770455 (= e!428935 (not e!428931))))

(declare-fun res!521261 () Bool)

(assert (=> b!770455 (=> res!521261 e!428931)))

(get-info :version)

(assert (=> b!770455 (= res!521261 (or (not ((_ is Intermediate!7882) lt!342801)) (bvsge x!1131 (x!64832 lt!342801))))))

(assert (=> b!770455 e!428933))

(declare-fun res!521256 () Bool)

(assert (=> b!770455 (=> (not res!521256) (not e!428933))))

(assert (=> b!770455 (= res!521256 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26522 0))(
  ( (Unit!26523) )
))
(declare-fun lt!342802 () Unit!26522)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42369 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26522)

(assert (=> b!770455 (= lt!342802 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!770456 () Bool)

(declare-fun res!521259 () Bool)

(assert (=> b!770456 (=> (not res!521259) (not e!428932))))

(assert (=> b!770456 (= res!521259 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20285 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!770457 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42369 (_ BitVec 32)) SeekEntryResult!7882)

(assert (=> b!770457 (= e!428927 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20285 a!3186) j!159) a!3186 mask!3328) (Found!7882 j!159)))))

(declare-fun b!770458 () Bool)

(declare-fun res!521258 () Bool)

(assert (=> b!770458 (=> (not res!521258) (not e!428926))))

(declare-datatypes ((List!14326 0))(
  ( (Nil!14323) (Cons!14322 (h!15421 (_ BitVec 64)) (t!20632 List!14326)) )
))
(declare-fun arrayNoDuplicates!0 (array!42369 (_ BitVec 32) List!14326) Bool)

(assert (=> b!770458 (= res!521258 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14323))))

(declare-fun b!770459 () Bool)

(assert (=> b!770459 (= e!428929 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20285 a!3186) j!159) a!3186 mask!3328) lt!342799))))

(declare-fun b!770460 () Bool)

(declare-fun res!521252 () Bool)

(assert (=> b!770460 (=> (not res!521252) (not e!428928))))

(declare-fun arrayContainsKey!0 (array!42369 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!770460 (= res!521252 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!770461 () Bool)

(declare-fun e!428930 () Unit!26522)

(declare-fun Unit!26524 () Unit!26522)

(assert (=> b!770461 (= e!428930 Unit!26524)))

(declare-fun lt!342797 () SeekEntryResult!7882)

(assert (=> b!770461 (= lt!342797 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20285 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!342796 () (_ BitVec 32))

(assert (=> b!770461 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342796 resIntermediateIndex!5 (select (arr!20285 a!3186) j!159) a!3186 mask!3328) (Found!7882 j!159))))

(declare-fun b!770462 () Bool)

(declare-fun res!521257 () Bool)

(assert (=> b!770462 (=> (not res!521257) (not e!428928))))

(assert (=> b!770462 (= res!521257 (validKeyInArray!0 k0!2102))))

(declare-fun b!770463 () Bool)

(assert (=> b!770463 (= e!428931 true)))

(declare-fun lt!342804 () Unit!26522)

(assert (=> b!770463 (= lt!342804 e!428930)))

(declare-fun c!84995 () Bool)

(assert (=> b!770463 (= c!84995 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770463 (= lt!342796 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!770464 () Bool)

(declare-fun Unit!26525 () Unit!26522)

(assert (=> b!770464 (= e!428930 Unit!26525)))

(assert (=> b!770464 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342796 (select (arr!20285 a!3186) j!159) a!3186 mask!3328) lt!342803)))

(declare-fun b!770465 () Bool)

(declare-fun res!521250 () Bool)

(assert (=> b!770465 (=> (not res!521250) (not e!428926))))

(assert (=> b!770465 (= res!521250 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20706 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20706 a!3186))))))

(assert (= (and start!66788 res!521255) b!770448))

(assert (= (and b!770448 res!521247) b!770452))

(assert (= (and b!770452 res!521254) b!770462))

(assert (= (and b!770462 res!521257) b!770460))

(assert (= (and b!770460 res!521252) b!770454))

(assert (= (and b!770454 res!521251) b!770450))

(assert (= (and b!770450 res!521248) b!770458))

(assert (= (and b!770458 res!521258) b!770465))

(assert (= (and b!770465 res!521250) b!770449))

(assert (= (and b!770449 res!521253) b!770456))

(assert (= (and b!770456 res!521259) b!770453))

(assert (= (and b!770453 c!84996) b!770451))

(assert (= (and b!770453 (not c!84996)) b!770457))

(assert (= (and b!770453 res!521249) b!770447))

(assert (= (and b!770447 res!521262) b!770455))

(assert (= (and b!770455 res!521256) b!770446))

(assert (= (and b!770446 res!521260) b!770459))

(assert (= (and b!770455 (not res!521261)) b!770463))

(assert (= (and b!770463 c!84995) b!770464))

(assert (= (and b!770463 (not c!84995)) b!770461))

(declare-fun m!715185 () Bool)

(assert (=> b!770449 m!715185))

(assert (=> b!770449 m!715185))

(declare-fun m!715187 () Bool)

(assert (=> b!770449 m!715187))

(assert (=> b!770449 m!715187))

(assert (=> b!770449 m!715185))

(declare-fun m!715189 () Bool)

(assert (=> b!770449 m!715189))

(declare-fun m!715191 () Bool)

(assert (=> b!770463 m!715191))

(declare-fun m!715193 () Bool)

(assert (=> b!770447 m!715193))

(declare-fun m!715195 () Bool)

(assert (=> b!770447 m!715195))

(assert (=> b!770447 m!715193))

(declare-fun m!715197 () Bool)

(assert (=> b!770447 m!715197))

(declare-fun m!715199 () Bool)

(assert (=> b!770447 m!715199))

(declare-fun m!715201 () Bool)

(assert (=> b!770447 m!715201))

(assert (=> b!770461 m!715185))

(assert (=> b!770461 m!715185))

(declare-fun m!715203 () Bool)

(assert (=> b!770461 m!715203))

(assert (=> b!770461 m!715185))

(declare-fun m!715205 () Bool)

(assert (=> b!770461 m!715205))

(assert (=> b!770446 m!715185))

(assert (=> b!770446 m!715185))

(declare-fun m!715207 () Bool)

(assert (=> b!770446 m!715207))

(assert (=> b!770457 m!715185))

(assert (=> b!770457 m!715185))

(assert (=> b!770457 m!715203))

(declare-fun m!715209 () Bool)

(assert (=> start!66788 m!715209))

(declare-fun m!715211 () Bool)

(assert (=> start!66788 m!715211))

(assert (=> b!770452 m!715185))

(assert (=> b!770452 m!715185))

(declare-fun m!715213 () Bool)

(assert (=> b!770452 m!715213))

(declare-fun m!715215 () Bool)

(assert (=> b!770460 m!715215))

(declare-fun m!715217 () Bool)

(assert (=> b!770458 m!715217))

(assert (=> b!770451 m!715185))

(assert (=> b!770451 m!715185))

(declare-fun m!715219 () Bool)

(assert (=> b!770451 m!715219))

(declare-fun m!715221 () Bool)

(assert (=> b!770456 m!715221))

(assert (=> b!770459 m!715185))

(assert (=> b!770459 m!715185))

(declare-fun m!715223 () Bool)

(assert (=> b!770459 m!715223))

(declare-fun m!715225 () Bool)

(assert (=> b!770462 m!715225))

(assert (=> b!770464 m!715185))

(assert (=> b!770464 m!715185))

(declare-fun m!715227 () Bool)

(assert (=> b!770464 m!715227))

(declare-fun m!715229 () Bool)

(assert (=> b!770454 m!715229))

(declare-fun m!715231 () Bool)

(assert (=> b!770455 m!715231))

(declare-fun m!715233 () Bool)

(assert (=> b!770455 m!715233))

(declare-fun m!715235 () Bool)

(assert (=> b!770450 m!715235))

(check-sat (not b!770462) (not b!770464) (not b!770447) (not b!770446) (not b!770460) (not b!770450) (not b!770449) (not b!770459) (not b!770454) (not b!770451) (not start!66788) (not b!770457) (not b!770458) (not b!770463) (not b!770455) (not b!770461) (not b!770452))
(check-sat)
