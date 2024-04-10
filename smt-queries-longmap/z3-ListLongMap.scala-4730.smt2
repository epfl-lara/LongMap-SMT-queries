; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65442 () Bool)

(assert start!65442)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41615 0))(
  ( (array!41616 (arr!19921 (Array (_ BitVec 32) (_ BitVec 64))) (size!20342 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41615)

(declare-fun e!416327 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!745393 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7521 0))(
  ( (MissingZero!7521 (index!32452 (_ BitVec 32))) (Found!7521 (index!32453 (_ BitVec 32))) (Intermediate!7521 (undefined!8333 Bool) (index!32454 (_ BitVec 32)) (x!63407 (_ BitVec 32))) (Undefined!7521) (MissingVacant!7521 (index!32455 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41615 (_ BitVec 32)) SeekEntryResult!7521)

(assert (=> b!745393 (= e!416327 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19921 a!3186) j!159) a!3186 mask!3328) (Found!7521 j!159)))))

(declare-fun b!745395 () Bool)

(declare-fun res!502283 () Bool)

(declare-fun e!416320 () Bool)

(assert (=> b!745395 (=> (not res!502283) (not e!416320))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745395 (= res!502283 (validKeyInArray!0 k0!2102))))

(declare-fun b!745396 () Bool)

(declare-fun e!416323 () Bool)

(assert (=> b!745396 (= e!416320 e!416323)))

(declare-fun res!502286 () Bool)

(assert (=> b!745396 (=> (not res!502286) (not e!416323))))

(declare-fun lt!331154 () SeekEntryResult!7521)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!745396 (= res!502286 (or (= lt!331154 (MissingZero!7521 i!1173)) (= lt!331154 (MissingVacant!7521 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41615 (_ BitVec 32)) SeekEntryResult!7521)

(assert (=> b!745396 (= lt!331154 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!745397 () Bool)

(declare-fun res!502287 () Bool)

(declare-fun e!416324 () Bool)

(assert (=> b!745397 (=> (not res!502287) (not e!416324))))

(assert (=> b!745397 (= res!502287 e!416327)))

(declare-fun c!81940 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!745397 (= c!81940 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!745398 () Bool)

(assert (=> b!745398 (= e!416323 e!416324)))

(declare-fun res!502274 () Bool)

(assert (=> b!745398 (=> (not res!502274) (not e!416324))))

(declare-fun lt!331153 () SeekEntryResult!7521)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41615 (_ BitVec 32)) SeekEntryResult!7521)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745398 (= res!502274 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19921 a!3186) j!159) mask!3328) (select (arr!19921 a!3186) j!159) a!3186 mask!3328) lt!331153))))

(assert (=> b!745398 (= lt!331153 (Intermediate!7521 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!745399 () Bool)

(assert (=> b!745399 (= e!416327 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19921 a!3186) j!159) a!3186 mask!3328) lt!331153))))

(declare-fun b!745400 () Bool)

(declare-fun res!502289 () Bool)

(assert (=> b!745400 (=> (not res!502289) (not e!416323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41615 (_ BitVec 32)) Bool)

(assert (=> b!745400 (= res!502289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745401 () Bool)

(declare-fun res!502275 () Bool)

(assert (=> b!745401 (=> (not res!502275) (not e!416320))))

(declare-fun arrayContainsKey!0 (array!41615 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745401 (= res!502275 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun e!416326 () Bool)

(declare-fun lt!331149 () SeekEntryResult!7521)

(declare-fun b!745402 () Bool)

(assert (=> b!745402 (= e!416326 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19921 a!3186) j!159) a!3186 mask!3328) lt!331149))))

(declare-fun b!745403 () Bool)

(declare-fun res!502276 () Bool)

(assert (=> b!745403 (=> (not res!502276) (not e!416324))))

(assert (=> b!745403 (= res!502276 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19921 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!745404 () Bool)

(declare-fun res!502285 () Bool)

(assert (=> b!745404 (=> (not res!502285) (not e!416320))))

(assert (=> b!745404 (= res!502285 (and (= (size!20342 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20342 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20342 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745405 () Bool)

(declare-fun e!416321 () Bool)

(declare-fun e!416319 () Bool)

(assert (=> b!745405 (= e!416321 (not e!416319))))

(declare-fun res!502282 () Bool)

(assert (=> b!745405 (=> res!502282 e!416319)))

(declare-fun lt!331152 () SeekEntryResult!7521)

(get-info :version)

(assert (=> b!745405 (= res!502282 (or (not ((_ is Intermediate!7521) lt!331152)) (bvslt x!1131 (x!63407 lt!331152)) (not (= x!1131 (x!63407 lt!331152))) (not (= index!1321 (index!32454 lt!331152)))))))

(declare-fun e!416325 () Bool)

(assert (=> b!745405 e!416325))

(declare-fun res!502279 () Bool)

(assert (=> b!745405 (=> (not res!502279) (not e!416325))))

(assert (=> b!745405 (= res!502279 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25522 0))(
  ( (Unit!25523) )
))
(declare-fun lt!331151 () Unit!25522)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41615 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25522)

(assert (=> b!745405 (= lt!331151 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!745406 () Bool)

(assert (=> b!745406 (= e!416319 true)))

(declare-fun lt!331150 () SeekEntryResult!7521)

(assert (=> b!745406 (= lt!331150 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19921 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!745394 () Bool)

(declare-fun res!502288 () Bool)

(assert (=> b!745394 (=> (not res!502288) (not e!416323))))

(assert (=> b!745394 (= res!502288 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20342 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20342 a!3186))))))

(declare-fun res!502284 () Bool)

(assert (=> start!65442 (=> (not res!502284) (not e!416320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65442 (= res!502284 (validMask!0 mask!3328))))

(assert (=> start!65442 e!416320))

(assert (=> start!65442 true))

(declare-fun array_inv!15717 (array!41615) Bool)

(assert (=> start!65442 (array_inv!15717 a!3186)))

(declare-fun b!745407 () Bool)

(assert (=> b!745407 (= e!416325 e!416326)))

(declare-fun res!502280 () Bool)

(assert (=> b!745407 (=> (not res!502280) (not e!416326))))

(assert (=> b!745407 (= res!502280 (= (seekEntryOrOpen!0 (select (arr!19921 a!3186) j!159) a!3186 mask!3328) lt!331149))))

(assert (=> b!745407 (= lt!331149 (Found!7521 j!159))))

(declare-fun b!745408 () Bool)

(assert (=> b!745408 (= e!416324 e!416321)))

(declare-fun res!502278 () Bool)

(assert (=> b!745408 (=> (not res!502278) (not e!416321))))

(declare-fun lt!331156 () SeekEntryResult!7521)

(assert (=> b!745408 (= res!502278 (= lt!331156 lt!331152))))

(declare-fun lt!331155 () array!41615)

(declare-fun lt!331157 () (_ BitVec 64))

(assert (=> b!745408 (= lt!331152 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331157 lt!331155 mask!3328))))

(assert (=> b!745408 (= lt!331156 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331157 mask!3328) lt!331157 lt!331155 mask!3328))))

(assert (=> b!745408 (= lt!331157 (select (store (arr!19921 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!745408 (= lt!331155 (array!41616 (store (arr!19921 a!3186) i!1173 k0!2102) (size!20342 a!3186)))))

(declare-fun b!745409 () Bool)

(declare-fun res!502277 () Bool)

(assert (=> b!745409 (=> (not res!502277) (not e!416320))))

(assert (=> b!745409 (= res!502277 (validKeyInArray!0 (select (arr!19921 a!3186) j!159)))))

(declare-fun b!745410 () Bool)

(declare-fun res!502281 () Bool)

(assert (=> b!745410 (=> (not res!502281) (not e!416323))))

(declare-datatypes ((List!13923 0))(
  ( (Nil!13920) (Cons!13919 (h!14991 (_ BitVec 64)) (t!20238 List!13923)) )
))
(declare-fun arrayNoDuplicates!0 (array!41615 (_ BitVec 32) List!13923) Bool)

(assert (=> b!745410 (= res!502281 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13920))))

(assert (= (and start!65442 res!502284) b!745404))

(assert (= (and b!745404 res!502285) b!745409))

(assert (= (and b!745409 res!502277) b!745395))

(assert (= (and b!745395 res!502283) b!745401))

(assert (= (and b!745401 res!502275) b!745396))

(assert (= (and b!745396 res!502286) b!745400))

(assert (= (and b!745400 res!502289) b!745410))

(assert (= (and b!745410 res!502281) b!745394))

(assert (= (and b!745394 res!502288) b!745398))

(assert (= (and b!745398 res!502274) b!745403))

(assert (= (and b!745403 res!502276) b!745397))

(assert (= (and b!745397 c!81940) b!745399))

(assert (= (and b!745397 (not c!81940)) b!745393))

(assert (= (and b!745397 res!502287) b!745408))

(assert (= (and b!745408 res!502278) b!745405))

(assert (= (and b!745405 res!502279) b!745407))

(assert (= (and b!745407 res!502280) b!745402))

(assert (= (and b!745405 (not res!502282)) b!745406))

(declare-fun m!695777 () Bool)

(assert (=> b!745405 m!695777))

(declare-fun m!695779 () Bool)

(assert (=> b!745405 m!695779))

(declare-fun m!695781 () Bool)

(assert (=> b!745407 m!695781))

(assert (=> b!745407 m!695781))

(declare-fun m!695783 () Bool)

(assert (=> b!745407 m!695783))

(declare-fun m!695785 () Bool)

(assert (=> start!65442 m!695785))

(declare-fun m!695787 () Bool)

(assert (=> start!65442 m!695787))

(assert (=> b!745393 m!695781))

(assert (=> b!745393 m!695781))

(declare-fun m!695789 () Bool)

(assert (=> b!745393 m!695789))

(assert (=> b!745402 m!695781))

(assert (=> b!745402 m!695781))

(declare-fun m!695791 () Bool)

(assert (=> b!745402 m!695791))

(declare-fun m!695793 () Bool)

(assert (=> b!745408 m!695793))

(declare-fun m!695795 () Bool)

(assert (=> b!745408 m!695795))

(declare-fun m!695797 () Bool)

(assert (=> b!745408 m!695797))

(assert (=> b!745408 m!695793))

(declare-fun m!695799 () Bool)

(assert (=> b!745408 m!695799))

(declare-fun m!695801 () Bool)

(assert (=> b!745408 m!695801))

(declare-fun m!695803 () Bool)

(assert (=> b!745396 m!695803))

(assert (=> b!745399 m!695781))

(assert (=> b!745399 m!695781))

(declare-fun m!695805 () Bool)

(assert (=> b!745399 m!695805))

(declare-fun m!695807 () Bool)

(assert (=> b!745403 m!695807))

(assert (=> b!745409 m!695781))

(assert (=> b!745409 m!695781))

(declare-fun m!695809 () Bool)

(assert (=> b!745409 m!695809))

(assert (=> b!745406 m!695781))

(assert (=> b!745406 m!695781))

(assert (=> b!745406 m!695789))

(declare-fun m!695811 () Bool)

(assert (=> b!745400 m!695811))

(declare-fun m!695813 () Bool)

(assert (=> b!745410 m!695813))

(assert (=> b!745398 m!695781))

(assert (=> b!745398 m!695781))

(declare-fun m!695815 () Bool)

(assert (=> b!745398 m!695815))

(assert (=> b!745398 m!695815))

(assert (=> b!745398 m!695781))

(declare-fun m!695817 () Bool)

(assert (=> b!745398 m!695817))

(declare-fun m!695819 () Bool)

(assert (=> b!745401 m!695819))

(declare-fun m!695821 () Bool)

(assert (=> b!745395 m!695821))

(check-sat (not b!745401) (not b!745398) (not b!745395) (not b!745408) (not b!745409) (not b!745393) (not b!745407) (not b!745396) (not b!745410) (not start!65442) (not b!745399) (not b!745402) (not b!745405) (not b!745406) (not b!745400))
(check-sat)
