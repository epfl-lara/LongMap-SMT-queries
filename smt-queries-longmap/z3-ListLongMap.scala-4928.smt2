; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67880 () Bool)

(assert start!67880)

(declare-fun b!789248 () Bool)

(declare-datatypes ((Unit!27348 0))(
  ( (Unit!27349) )
))
(declare-fun e!438681 () Unit!27348)

(declare-fun Unit!27350 () Unit!27348)

(assert (=> b!789248 (= e!438681 Unit!27350)))

(declare-fun e!438682 () Bool)

(declare-datatypes ((array!42857 0))(
  ( (array!42858 (arr!20515 (Array (_ BitVec 32) (_ BitVec 64))) (size!20936 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42857)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!789249 () Bool)

(declare-datatypes ((SeekEntryResult!8115 0))(
  ( (MissingZero!8115 (index!34828 (_ BitVec 32))) (Found!8115 (index!34829 (_ BitVec 32))) (Intermediate!8115 (undefined!8927 Bool) (index!34830 (_ BitVec 32)) (x!65768 (_ BitVec 32))) (Undefined!8115) (MissingVacant!8115 (index!34831 (_ BitVec 32))) )
))
(declare-fun lt!352142 () SeekEntryResult!8115)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42857 (_ BitVec 32)) SeekEntryResult!8115)

(assert (=> b!789249 (= e!438682 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20515 a!3186) j!159) a!3186 mask!3328) lt!352142))))

(declare-fun b!789250 () Bool)

(declare-fun e!438680 () Bool)

(declare-fun e!438678 () Bool)

(assert (=> b!789250 (= e!438680 e!438678)))

(declare-fun res!534577 () Bool)

(assert (=> b!789250 (=> res!534577 e!438678)))

(declare-fun lt!352143 () SeekEntryResult!8115)

(declare-fun lt!352140 () SeekEntryResult!8115)

(assert (=> b!789250 (= res!534577 (not (= lt!352143 lt!352140)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42857 (_ BitVec 32)) SeekEntryResult!8115)

(assert (=> b!789250 (= lt!352143 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20515 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!789251 () Bool)

(declare-fun res!534578 () Bool)

(declare-fun e!438683 () Bool)

(assert (=> b!789251 (=> (not res!534578) (not e!438683))))

(assert (=> b!789251 (= res!534578 e!438682)))

(declare-fun c!87753 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!789251 (= c!87753 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!534570 () Bool)

(declare-fun e!438684 () Bool)

(assert (=> start!67880 (=> (not res!534570) (not e!438684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67880 (= res!534570 (validMask!0 mask!3328))))

(assert (=> start!67880 e!438684))

(assert (=> start!67880 true))

(declare-fun array_inv!16311 (array!42857) Bool)

(assert (=> start!67880 (array_inv!16311 a!3186)))

(declare-fun b!789252 () Bool)

(declare-fun e!438686 () Bool)

(assert (=> b!789252 (= e!438683 e!438686)))

(declare-fun res!534566 () Bool)

(assert (=> b!789252 (=> (not res!534566) (not e!438686))))

(declare-fun lt!352137 () SeekEntryResult!8115)

(declare-fun lt!352146 () SeekEntryResult!8115)

(assert (=> b!789252 (= res!534566 (= lt!352137 lt!352146))))

(declare-fun lt!352139 () array!42857)

(declare-fun lt!352141 () (_ BitVec 64))

(assert (=> b!789252 (= lt!352146 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352141 lt!352139 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!789252 (= lt!352137 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352141 mask!3328) lt!352141 lt!352139 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!789252 (= lt!352141 (select (store (arr!20515 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!789252 (= lt!352139 (array!42858 (store (arr!20515 a!3186) i!1173 k0!2102) (size!20936 a!3186)))))

(declare-fun b!789253 () Bool)

(declare-fun res!534573 () Bool)

(assert (=> b!789253 (=> (not res!534573) (not e!438684))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!789253 (= res!534573 (validKeyInArray!0 (select (arr!20515 a!3186) j!159)))))

(declare-fun b!789254 () Bool)

(declare-fun res!534560 () Bool)

(declare-fun e!438679 () Bool)

(assert (=> b!789254 (=> (not res!534560) (not e!438679))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42857 (_ BitVec 32)) SeekEntryResult!8115)

(assert (=> b!789254 (= res!534560 (= (seekEntryOrOpen!0 lt!352141 lt!352139 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352141 lt!352139 mask!3328)))))

(declare-fun b!789255 () Bool)

(declare-fun res!534576 () Bool)

(assert (=> b!789255 (=> (not res!534576) (not e!438684))))

(declare-fun arrayContainsKey!0 (array!42857 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!789255 (= res!534576 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!789256 () Bool)

(declare-fun res!534567 () Bool)

(assert (=> b!789256 (=> (not res!534567) (not e!438684))))

(assert (=> b!789256 (= res!534567 (and (= (size!20936 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20936 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20936 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!789257 () Bool)

(declare-fun res!534572 () Bool)

(declare-fun e!438675 () Bool)

(assert (=> b!789257 (=> (not res!534572) (not e!438675))))

(declare-datatypes ((List!14517 0))(
  ( (Nil!14514) (Cons!14513 (h!15639 (_ BitVec 64)) (t!20832 List!14517)) )
))
(declare-fun arrayNoDuplicates!0 (array!42857 (_ BitVec 32) List!14517) Bool)

(assert (=> b!789257 (= res!534572 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14514))))

(declare-fun e!438676 () Bool)

(declare-fun b!789258 () Bool)

(assert (=> b!789258 (= e!438676 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20515 a!3186) j!159) a!3186 mask!3328) lt!352140))))

(declare-fun b!789259 () Bool)

(declare-fun res!534564 () Bool)

(assert (=> b!789259 (=> (not res!534564) (not e!438675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42857 (_ BitVec 32)) Bool)

(assert (=> b!789259 (= res!534564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!789260 () Bool)

(declare-fun res!534574 () Bool)

(assert (=> b!789260 (=> (not res!534574) (not e!438684))))

(assert (=> b!789260 (= res!534574 (validKeyInArray!0 k0!2102))))

(declare-fun b!789261 () Bool)

(declare-fun res!534563 () Bool)

(assert (=> b!789261 (=> (not res!534563) (not e!438675))))

(assert (=> b!789261 (= res!534563 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20936 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20936 a!3186))))))

(declare-fun b!789262 () Bool)

(assert (=> b!789262 (= e!438675 e!438683)))

(declare-fun res!534569 () Bool)

(assert (=> b!789262 (=> (not res!534569) (not e!438683))))

(assert (=> b!789262 (= res!534569 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20515 a!3186) j!159) mask!3328) (select (arr!20515 a!3186) j!159) a!3186 mask!3328) lt!352142))))

(assert (=> b!789262 (= lt!352142 (Intermediate!8115 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!789263 () Bool)

(declare-fun e!438677 () Bool)

(assert (=> b!789263 (= e!438677 true)))

(assert (=> b!789263 e!438679))

(declare-fun res!534568 () Bool)

(assert (=> b!789263 (=> (not res!534568) (not e!438679))))

(declare-fun lt!352138 () (_ BitVec 64))

(assert (=> b!789263 (= res!534568 (= lt!352138 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!352144 () Unit!27348)

(assert (=> b!789263 (= lt!352144 e!438681)))

(declare-fun c!87754 () Bool)

(assert (=> b!789263 (= c!87754 (= lt!352138 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!789264 () Bool)

(declare-fun lt!352145 () SeekEntryResult!8115)

(assert (=> b!789264 (= e!438679 (= lt!352145 lt!352143))))

(declare-fun b!789265 () Bool)

(assert (=> b!789265 (= e!438678 e!438677)))

(declare-fun res!534565 () Bool)

(assert (=> b!789265 (=> res!534565 e!438677)))

(assert (=> b!789265 (= res!534565 (= lt!352138 lt!352141))))

(assert (=> b!789265 (= lt!352138 (select (store (arr!20515 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!789266 () Bool)

(declare-fun Unit!27351 () Unit!27348)

(assert (=> b!789266 (= e!438681 Unit!27351)))

(assert (=> b!789266 false))

(declare-fun b!789267 () Bool)

(assert (=> b!789267 (= e!438684 e!438675)))

(declare-fun res!534562 () Bool)

(assert (=> b!789267 (=> (not res!534562) (not e!438675))))

(declare-fun lt!352147 () SeekEntryResult!8115)

(assert (=> b!789267 (= res!534562 (or (= lt!352147 (MissingZero!8115 i!1173)) (= lt!352147 (MissingVacant!8115 i!1173))))))

(assert (=> b!789267 (= lt!352147 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!789268 () Bool)

(assert (=> b!789268 (= e!438686 (not e!438680))))

(declare-fun res!534571 () Bool)

(assert (=> b!789268 (=> res!534571 e!438680)))

(get-info :version)

(assert (=> b!789268 (= res!534571 (or (not ((_ is Intermediate!8115) lt!352146)) (bvslt x!1131 (x!65768 lt!352146)) (not (= x!1131 (x!65768 lt!352146))) (not (= index!1321 (index!34830 lt!352146)))))))

(assert (=> b!789268 e!438676))

(declare-fun res!534561 () Bool)

(assert (=> b!789268 (=> (not res!534561) (not e!438676))))

(assert (=> b!789268 (= res!534561 (= lt!352145 lt!352140))))

(assert (=> b!789268 (= lt!352140 (Found!8115 j!159))))

(assert (=> b!789268 (= lt!352145 (seekEntryOrOpen!0 (select (arr!20515 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!789268 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352148 () Unit!27348)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42857 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27348)

(assert (=> b!789268 (= lt!352148 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!789269 () Bool)

(assert (=> b!789269 (= e!438682 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20515 a!3186) j!159) a!3186 mask!3328) (Found!8115 j!159)))))

(declare-fun b!789270 () Bool)

(declare-fun res!534575 () Bool)

(assert (=> b!789270 (=> (not res!534575) (not e!438683))))

(assert (=> b!789270 (= res!534575 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20515 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!67880 res!534570) b!789256))

(assert (= (and b!789256 res!534567) b!789253))

(assert (= (and b!789253 res!534573) b!789260))

(assert (= (and b!789260 res!534574) b!789255))

(assert (= (and b!789255 res!534576) b!789267))

(assert (= (and b!789267 res!534562) b!789259))

(assert (= (and b!789259 res!534564) b!789257))

(assert (= (and b!789257 res!534572) b!789261))

(assert (= (and b!789261 res!534563) b!789262))

(assert (= (and b!789262 res!534569) b!789270))

(assert (= (and b!789270 res!534575) b!789251))

(assert (= (and b!789251 c!87753) b!789249))

(assert (= (and b!789251 (not c!87753)) b!789269))

(assert (= (and b!789251 res!534578) b!789252))

(assert (= (and b!789252 res!534566) b!789268))

(assert (= (and b!789268 res!534561) b!789258))

(assert (= (and b!789268 (not res!534571)) b!789250))

(assert (= (and b!789250 (not res!534577)) b!789265))

(assert (= (and b!789265 (not res!534565)) b!789263))

(assert (= (and b!789263 c!87754) b!789266))

(assert (= (and b!789263 (not c!87754)) b!789248))

(assert (= (and b!789263 res!534568) b!789254))

(assert (= (and b!789254 res!534560) b!789264))

(declare-fun m!730377 () Bool)

(assert (=> b!789255 m!730377))

(declare-fun m!730379 () Bool)

(assert (=> b!789253 m!730379))

(assert (=> b!789253 m!730379))

(declare-fun m!730381 () Bool)

(assert (=> b!789253 m!730381))

(declare-fun m!730383 () Bool)

(assert (=> b!789254 m!730383))

(declare-fun m!730385 () Bool)

(assert (=> b!789254 m!730385))

(declare-fun m!730387 () Bool)

(assert (=> b!789267 m!730387))

(assert (=> b!789250 m!730379))

(assert (=> b!789250 m!730379))

(declare-fun m!730389 () Bool)

(assert (=> b!789250 m!730389))

(declare-fun m!730391 () Bool)

(assert (=> b!789260 m!730391))

(declare-fun m!730393 () Bool)

(assert (=> b!789259 m!730393))

(assert (=> b!789258 m!730379))

(assert (=> b!789258 m!730379))

(declare-fun m!730395 () Bool)

(assert (=> b!789258 m!730395))

(assert (=> b!789268 m!730379))

(assert (=> b!789268 m!730379))

(declare-fun m!730397 () Bool)

(assert (=> b!789268 m!730397))

(declare-fun m!730399 () Bool)

(assert (=> b!789268 m!730399))

(declare-fun m!730401 () Bool)

(assert (=> b!789268 m!730401))

(declare-fun m!730403 () Bool)

(assert (=> b!789257 m!730403))

(declare-fun m!730405 () Bool)

(assert (=> b!789252 m!730405))

(declare-fun m!730407 () Bool)

(assert (=> b!789252 m!730407))

(declare-fun m!730409 () Bool)

(assert (=> b!789252 m!730409))

(declare-fun m!730411 () Bool)

(assert (=> b!789252 m!730411))

(assert (=> b!789252 m!730409))

(declare-fun m!730413 () Bool)

(assert (=> b!789252 m!730413))

(declare-fun m!730415 () Bool)

(assert (=> b!789270 m!730415))

(declare-fun m!730417 () Bool)

(assert (=> start!67880 m!730417))

(declare-fun m!730419 () Bool)

(assert (=> start!67880 m!730419))

(assert (=> b!789269 m!730379))

(assert (=> b!789269 m!730379))

(assert (=> b!789269 m!730389))

(assert (=> b!789249 m!730379))

(assert (=> b!789249 m!730379))

(declare-fun m!730421 () Bool)

(assert (=> b!789249 m!730421))

(assert (=> b!789265 m!730407))

(declare-fun m!730423 () Bool)

(assert (=> b!789265 m!730423))

(assert (=> b!789262 m!730379))

(assert (=> b!789262 m!730379))

(declare-fun m!730425 () Bool)

(assert (=> b!789262 m!730425))

(assert (=> b!789262 m!730425))

(assert (=> b!789262 m!730379))

(declare-fun m!730427 () Bool)

(assert (=> b!789262 m!730427))

(check-sat (not b!789262) (not b!789258) (not b!789250) (not b!789259) (not b!789260) (not b!789254) (not b!789257) (not b!789267) (not b!789249) (not b!789269) (not b!789253) (not b!789252) (not start!67880) (not b!789268) (not b!789255))
(check-sat)
