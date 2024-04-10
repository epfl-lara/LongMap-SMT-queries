; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65214 () Bool)

(assert start!65214)

(declare-datatypes ((SeekEntryResult!7407 0))(
  ( (MissingZero!7407 (index!31996 (_ BitVec 32))) (Found!7407 (index!31997 (_ BitVec 32))) (Intermediate!7407 (undefined!8219 Bool) (index!31998 (_ BitVec 32)) (x!62989 (_ BitVec 32))) (Undefined!7407) (MissingVacant!7407 (index!31999 (_ BitVec 32))) )
))
(declare-fun lt!327801 () SeekEntryResult!7407)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41387 0))(
  ( (array!41388 (arr!19807 (Array (_ BitVec 32) (_ BitVec 64))) (size!20228 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41387)

(declare-fun lt!327790 () (_ BitVec 32))

(declare-fun b!738484 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!413004 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41387 (_ BitVec 32)) SeekEntryResult!7407)

(assert (=> b!738484 (= e!413004 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327790 resIntermediateIndex!5 (select (arr!19807 a!3186) j!159) a!3186 mask!3328) lt!327801)))))

(declare-fun b!738485 () Bool)

(declare-fun e!413006 () Bool)

(declare-fun e!412999 () Bool)

(assert (=> b!738485 (= e!413006 (not e!412999))))

(declare-fun res!496472 () Bool)

(assert (=> b!738485 (=> res!496472 e!412999)))

(declare-fun lt!327799 () SeekEntryResult!7407)

(get-info :version)

(assert (=> b!738485 (= res!496472 (or (not ((_ is Intermediate!7407) lt!327799)) (bvsge x!1131 (x!62989 lt!327799))))))

(assert (=> b!738485 (= lt!327801 (Found!7407 j!159))))

(declare-fun e!413003 () Bool)

(assert (=> b!738485 e!413003))

(declare-fun res!496469 () Bool)

(assert (=> b!738485 (=> (not res!496469) (not e!413003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41387 (_ BitVec 32)) Bool)

(assert (=> b!738485 (= res!496469 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25224 0))(
  ( (Unit!25225) )
))
(declare-fun lt!327796 () Unit!25224)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41387 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25224)

(assert (=> b!738485 (= lt!327796 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!738486 () Bool)

(declare-fun res!496463 () Bool)

(declare-fun e!413005 () Bool)

(assert (=> b!738486 (=> (not res!496463) (not e!413005))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!738486 (= res!496463 (and (= (size!20228 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20228 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20228 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!738487 () Bool)

(declare-fun res!496477 () Bool)

(declare-fun e!412996 () Bool)

(assert (=> b!738487 (=> (not res!496477) (not e!412996))))

(declare-fun e!412995 () Bool)

(assert (=> b!738487 (= res!496477 e!412995)))

(declare-fun c!81393 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!738487 (= c!81393 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!738488 () Bool)

(declare-fun res!496474 () Bool)

(assert (=> b!738488 (=> (not res!496474) (not e!413005))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!738488 (= res!496474 (validKeyInArray!0 k0!2102))))

(declare-fun b!738489 () Bool)

(declare-fun e!412998 () Bool)

(assert (=> b!738489 (= e!413003 e!412998)))

(declare-fun res!496461 () Bool)

(assert (=> b!738489 (=> (not res!496461) (not e!412998))))

(declare-fun lt!327791 () SeekEntryResult!7407)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41387 (_ BitVec 32)) SeekEntryResult!7407)

(assert (=> b!738489 (= res!496461 (= (seekEntryOrOpen!0 (select (arr!19807 a!3186) j!159) a!3186 mask!3328) lt!327791))))

(assert (=> b!738489 (= lt!327791 (Found!7407 j!159))))

(declare-fun b!738490 () Bool)

(declare-fun res!496467 () Bool)

(assert (=> b!738490 (=> (not res!496467) (not e!412996))))

(assert (=> b!738490 (= res!496467 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19807 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!738491 () Bool)

(declare-fun e!412997 () Unit!25224)

(declare-fun Unit!25226 () Unit!25224)

(assert (=> b!738491 (= e!412997 Unit!25226)))

(declare-fun lt!327800 () SeekEntryResult!7407)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41387 (_ BitVec 32)) SeekEntryResult!7407)

(assert (=> b!738491 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327790 (select (arr!19807 a!3186) j!159) a!3186 mask!3328) lt!327800)))

(declare-fun b!738492 () Bool)

(declare-fun res!496478 () Bool)

(declare-fun e!413002 () Bool)

(assert (=> b!738492 (=> (not res!496478) (not e!413002))))

(assert (=> b!738492 (= res!496478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!738493 () Bool)

(declare-fun res!496473 () Bool)

(assert (=> b!738493 (=> (not res!496473) (not e!413005))))

(declare-fun arrayContainsKey!0 (array!41387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!738493 (= res!496473 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!738494 () Bool)

(declare-fun res!496471 () Bool)

(assert (=> b!738494 (=> (not res!496471) (not e!413002))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!738494 (= res!496471 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20228 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20228 a!3186))))))

(declare-fun b!738496 () Bool)

(assert (=> b!738496 (= e!412995 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19807 a!3186) j!159) a!3186 mask!3328) (Found!7407 j!159)))))

(declare-fun b!738497 () Bool)

(declare-fun e!413000 () Bool)

(assert (=> b!738497 (= e!413000 true)))

(declare-fun lt!327793 () SeekEntryResult!7407)

(declare-fun lt!327797 () (_ BitVec 64))

(declare-fun lt!327795 () array!41387)

(assert (=> b!738497 (= lt!327793 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327790 lt!327797 lt!327795 mask!3328))))

(declare-fun b!738498 () Bool)

(assert (=> b!738498 (= e!413005 e!413002)))

(declare-fun res!496466 () Bool)

(assert (=> b!738498 (=> (not res!496466) (not e!413002))))

(declare-fun lt!327803 () SeekEntryResult!7407)

(assert (=> b!738498 (= res!496466 (or (= lt!327803 (MissingZero!7407 i!1173)) (= lt!327803 (MissingVacant!7407 i!1173))))))

(assert (=> b!738498 (= lt!327803 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!738499 () Bool)

(declare-fun res!496468 () Bool)

(assert (=> b!738499 (=> (not res!496468) (not e!413005))))

(assert (=> b!738499 (= res!496468 (validKeyInArray!0 (select (arr!19807 a!3186) j!159)))))

(declare-fun b!738500 () Bool)

(assert (=> b!738500 (= e!412995 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19807 a!3186) j!159) a!3186 mask!3328) lt!327800))))

(declare-fun b!738501 () Bool)

(declare-fun res!496465 () Bool)

(assert (=> b!738501 (=> (not res!496465) (not e!413002))))

(declare-datatypes ((List!13809 0))(
  ( (Nil!13806) (Cons!13805 (h!14877 (_ BitVec 64)) (t!20124 List!13809)) )
))
(declare-fun arrayNoDuplicates!0 (array!41387 (_ BitVec 32) List!13809) Bool)

(assert (=> b!738501 (= res!496465 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13806))))

(declare-fun b!738502 () Bool)

(assert (=> b!738502 (= e!413002 e!412996)))

(declare-fun res!496470 () Bool)

(assert (=> b!738502 (=> (not res!496470) (not e!412996))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738502 (= res!496470 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19807 a!3186) j!159) mask!3328) (select (arr!19807 a!3186) j!159) a!3186 mask!3328) lt!327800))))

(assert (=> b!738502 (= lt!327800 (Intermediate!7407 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!738503 () Bool)

(declare-fun res!496462 () Bool)

(assert (=> b!738503 (=> res!496462 e!413000)))

(assert (=> b!738503 (= res!496462 e!413004)))

(declare-fun c!81394 () Bool)

(declare-fun lt!327794 () Bool)

(assert (=> b!738503 (= c!81394 lt!327794)))

(declare-fun b!738504 () Bool)

(assert (=> b!738504 (= e!412996 e!413006)))

(declare-fun res!496476 () Bool)

(assert (=> b!738504 (=> (not res!496476) (not e!413006))))

(declare-fun lt!327802 () SeekEntryResult!7407)

(assert (=> b!738504 (= res!496476 (= lt!327802 lt!327799))))

(assert (=> b!738504 (= lt!327799 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327797 lt!327795 mask!3328))))

(assert (=> b!738504 (= lt!327802 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327797 mask!3328) lt!327797 lt!327795 mask!3328))))

(assert (=> b!738504 (= lt!327797 (select (store (arr!19807 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!738504 (= lt!327795 (array!41388 (store (arr!19807 a!3186) i!1173 k0!2102) (size!20228 a!3186)))))

(declare-fun b!738505 () Bool)

(assert (=> b!738505 (= e!413004 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327790 (select (arr!19807 a!3186) j!159) a!3186 mask!3328) lt!327800)))))

(declare-fun b!738506 () Bool)

(declare-fun Unit!25227 () Unit!25224)

(assert (=> b!738506 (= e!412997 Unit!25227)))

(declare-fun lt!327792 () SeekEntryResult!7407)

(assert (=> b!738506 (= lt!327792 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19807 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!738506 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327790 resIntermediateIndex!5 (select (arr!19807 a!3186) j!159) a!3186 mask!3328) lt!327801)))

(declare-fun b!738507 () Bool)

(assert (=> b!738507 (= e!412999 e!413000)))

(declare-fun res!496475 () Bool)

(assert (=> b!738507 (=> res!496475 e!413000)))

(assert (=> b!738507 (= res!496475 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327790 #b00000000000000000000000000000000) (bvsge lt!327790 (size!20228 a!3186))))))

(declare-fun lt!327798 () Unit!25224)

(assert (=> b!738507 (= lt!327798 e!412997)))

(declare-fun c!81392 () Bool)

(assert (=> b!738507 (= c!81392 lt!327794)))

(assert (=> b!738507 (= lt!327794 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738507 (= lt!327790 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun res!496464 () Bool)

(assert (=> start!65214 (=> (not res!496464) (not e!413005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65214 (= res!496464 (validMask!0 mask!3328))))

(assert (=> start!65214 e!413005))

(assert (=> start!65214 true))

(declare-fun array_inv!15603 (array!41387) Bool)

(assert (=> start!65214 (array_inv!15603 a!3186)))

(declare-fun b!738495 () Bool)

(assert (=> b!738495 (= e!412998 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19807 a!3186) j!159) a!3186 mask!3328) lt!327791))))

(assert (= (and start!65214 res!496464) b!738486))

(assert (= (and b!738486 res!496463) b!738499))

(assert (= (and b!738499 res!496468) b!738488))

(assert (= (and b!738488 res!496474) b!738493))

(assert (= (and b!738493 res!496473) b!738498))

(assert (= (and b!738498 res!496466) b!738492))

(assert (= (and b!738492 res!496478) b!738501))

(assert (= (and b!738501 res!496465) b!738494))

(assert (= (and b!738494 res!496471) b!738502))

(assert (= (and b!738502 res!496470) b!738490))

(assert (= (and b!738490 res!496467) b!738487))

(assert (= (and b!738487 c!81393) b!738500))

(assert (= (and b!738487 (not c!81393)) b!738496))

(assert (= (and b!738487 res!496477) b!738504))

(assert (= (and b!738504 res!496476) b!738485))

(assert (= (and b!738485 res!496469) b!738489))

(assert (= (and b!738489 res!496461) b!738495))

(assert (= (and b!738485 (not res!496472)) b!738507))

(assert (= (and b!738507 c!81392) b!738491))

(assert (= (and b!738507 (not c!81392)) b!738506))

(assert (= (and b!738507 (not res!496475)) b!738503))

(assert (= (and b!738503 c!81394) b!738505))

(assert (= (and b!738503 (not c!81394)) b!738484))

(assert (= (and b!738503 (not res!496462)) b!738497))

(declare-fun m!690103 () Bool)

(assert (=> b!738485 m!690103))

(declare-fun m!690105 () Bool)

(assert (=> b!738485 m!690105))

(declare-fun m!690107 () Bool)

(assert (=> b!738490 m!690107))

(declare-fun m!690109 () Bool)

(assert (=> start!65214 m!690109))

(declare-fun m!690111 () Bool)

(assert (=> start!65214 m!690111))

(declare-fun m!690113 () Bool)

(assert (=> b!738501 m!690113))

(declare-fun m!690115 () Bool)

(assert (=> b!738492 m!690115))

(declare-fun m!690117 () Bool)

(assert (=> b!738491 m!690117))

(assert (=> b!738491 m!690117))

(declare-fun m!690119 () Bool)

(assert (=> b!738491 m!690119))

(declare-fun m!690121 () Bool)

(assert (=> b!738497 m!690121))

(declare-fun m!690123 () Bool)

(assert (=> b!738493 m!690123))

(assert (=> b!738484 m!690117))

(assert (=> b!738484 m!690117))

(declare-fun m!690125 () Bool)

(assert (=> b!738484 m!690125))

(declare-fun m!690127 () Bool)

(assert (=> b!738498 m!690127))

(assert (=> b!738502 m!690117))

(assert (=> b!738502 m!690117))

(declare-fun m!690129 () Bool)

(assert (=> b!738502 m!690129))

(assert (=> b!738502 m!690129))

(assert (=> b!738502 m!690117))

(declare-fun m!690131 () Bool)

(assert (=> b!738502 m!690131))

(assert (=> b!738495 m!690117))

(assert (=> b!738495 m!690117))

(declare-fun m!690133 () Bool)

(assert (=> b!738495 m!690133))

(declare-fun m!690135 () Bool)

(assert (=> b!738488 m!690135))

(assert (=> b!738500 m!690117))

(assert (=> b!738500 m!690117))

(declare-fun m!690137 () Bool)

(assert (=> b!738500 m!690137))

(declare-fun m!690139 () Bool)

(assert (=> b!738504 m!690139))

(assert (=> b!738504 m!690139))

(declare-fun m!690141 () Bool)

(assert (=> b!738504 m!690141))

(declare-fun m!690143 () Bool)

(assert (=> b!738504 m!690143))

(declare-fun m!690145 () Bool)

(assert (=> b!738504 m!690145))

(declare-fun m!690147 () Bool)

(assert (=> b!738504 m!690147))

(assert (=> b!738506 m!690117))

(assert (=> b!738506 m!690117))

(declare-fun m!690149 () Bool)

(assert (=> b!738506 m!690149))

(assert (=> b!738506 m!690117))

(assert (=> b!738506 m!690125))

(assert (=> b!738496 m!690117))

(assert (=> b!738496 m!690117))

(assert (=> b!738496 m!690149))

(assert (=> b!738489 m!690117))

(assert (=> b!738489 m!690117))

(declare-fun m!690151 () Bool)

(assert (=> b!738489 m!690151))

(assert (=> b!738505 m!690117))

(assert (=> b!738505 m!690117))

(assert (=> b!738505 m!690119))

(assert (=> b!738499 m!690117))

(assert (=> b!738499 m!690117))

(declare-fun m!690153 () Bool)

(assert (=> b!738499 m!690153))

(declare-fun m!690155 () Bool)

(assert (=> b!738507 m!690155))

(check-sat (not b!738496) (not b!738495) (not b!738485) (not b!738491) (not b!738484) (not b!738506) (not b!738488) (not b!738501) (not b!738504) (not b!738497) (not b!738502) (not b!738505) (not b!738492) (not b!738498) (not b!738500) (not b!738507) (not b!738493) (not b!738499) (not start!65214) (not b!738489))
(check-sat)
