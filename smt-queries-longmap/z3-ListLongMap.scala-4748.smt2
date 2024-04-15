; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65528 () Bool)

(assert start!65528)

(declare-fun b!748236 () Bool)

(declare-fun res!504795 () Bool)

(declare-fun e!417610 () Bool)

(assert (=> b!748236 (=> (not res!504795) (not e!417610))))

(declare-datatypes ((array!41718 0))(
  ( (array!41719 (arr!19973 (Array (_ BitVec 32) (_ BitVec 64))) (size!20394 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41718)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41718 (_ BitVec 32)) Bool)

(assert (=> b!748236 (= res!504795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!748237 () Bool)

(declare-fun res!504793 () Bool)

(assert (=> b!748237 (=> (not res!504793) (not e!417610))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!748237 (= res!504793 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20394 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20394 a!3186))))))

(declare-fun b!748238 () Bool)

(declare-fun res!504792 () Bool)

(assert (=> b!748238 (=> (not res!504792) (not e!417610))))

(declare-datatypes ((List!14014 0))(
  ( (Nil!14011) (Cons!14010 (h!15082 (_ BitVec 64)) (t!20320 List!14014)) )
))
(declare-fun arrayNoDuplicates!0 (array!41718 (_ BitVec 32) List!14014) Bool)

(assert (=> b!748238 (= res!504792 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14011))))

(declare-fun b!748239 () Bool)

(declare-fun e!417607 () Bool)

(declare-fun e!417611 () Bool)

(assert (=> b!748239 (= e!417607 (not e!417611))))

(declare-fun res!504791 () Bool)

(assert (=> b!748239 (=> res!504791 e!417611)))

(declare-datatypes ((SeekEntryResult!7570 0))(
  ( (MissingZero!7570 (index!32648 (_ BitVec 32))) (Found!7570 (index!32649 (_ BitVec 32))) (Intermediate!7570 (undefined!8382 Bool) (index!32650 (_ BitVec 32)) (x!63595 (_ BitVec 32))) (Undefined!7570) (MissingVacant!7570 (index!32651 (_ BitVec 32))) )
))
(declare-fun lt!332493 () SeekEntryResult!7570)

(get-info :version)

(assert (=> b!748239 (= res!504791 (or (not ((_ is Intermediate!7570) lt!332493)) (bvslt x!1131 (x!63595 lt!332493)) (not (= x!1131 (x!63595 lt!332493))) (not (= index!1321 (index!32650 lt!332493)))))))

(declare-fun e!417608 () Bool)

(assert (=> b!748239 e!417608))

(declare-fun res!504800 () Bool)

(assert (=> b!748239 (=> (not res!504800) (not e!417608))))

(declare-fun lt!332494 () SeekEntryResult!7570)

(declare-fun lt!332492 () SeekEntryResult!7570)

(assert (=> b!748239 (= res!504800 (= lt!332494 lt!332492))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!748239 (= lt!332492 (Found!7570 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41718 (_ BitVec 32)) SeekEntryResult!7570)

(assert (=> b!748239 (= lt!332494 (seekEntryOrOpen!0 (select (arr!19973 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!748239 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25640 0))(
  ( (Unit!25641) )
))
(declare-fun lt!332488 () Unit!25640)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41718 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25640)

(assert (=> b!748239 (= lt!332488 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!748240 () Bool)

(declare-fun res!504797 () Bool)

(declare-fun e!417612 () Bool)

(assert (=> b!748240 (=> (not res!504797) (not e!417612))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!748240 (= res!504797 (validKeyInArray!0 k0!2102))))

(declare-fun b!748241 () Bool)

(assert (=> b!748241 (= e!417612 e!417610)))

(declare-fun res!504805 () Bool)

(assert (=> b!748241 (=> (not res!504805) (not e!417610))))

(declare-fun lt!332486 () SeekEntryResult!7570)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!748241 (= res!504805 (or (= lt!332486 (MissingZero!7570 i!1173)) (= lt!332486 (MissingVacant!7570 i!1173))))))

(assert (=> b!748241 (= lt!332486 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!504801 () Bool)

(assert (=> start!65528 (=> (not res!504801) (not e!417612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65528 (= res!504801 (validMask!0 mask!3328))))

(assert (=> start!65528 e!417612))

(assert (=> start!65528 true))

(declare-fun array_inv!15856 (array!41718) Bool)

(assert (=> start!65528 (array_inv!15856 a!3186)))

(declare-fun b!748242 () Bool)

(declare-fun res!504798 () Bool)

(assert (=> b!748242 (=> (not res!504798) (not e!417612))))

(declare-fun arrayContainsKey!0 (array!41718 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!748242 (= res!504798 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!748243 () Bool)

(declare-fun e!417609 () Bool)

(assert (=> b!748243 (= e!417610 e!417609)))

(declare-fun res!504794 () Bool)

(assert (=> b!748243 (=> (not res!504794) (not e!417609))))

(declare-fun lt!332487 () SeekEntryResult!7570)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41718 (_ BitVec 32)) SeekEntryResult!7570)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!748243 (= res!504794 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19973 a!3186) j!159) mask!3328) (select (arr!19973 a!3186) j!159) a!3186 mask!3328) lt!332487))))

(assert (=> b!748243 (= lt!332487 (Intermediate!7570 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!748244 () Bool)

(declare-fun e!417605 () Unit!25640)

(declare-fun Unit!25642 () Unit!25640)

(assert (=> b!748244 (= e!417605 Unit!25642)))

(declare-fun b!748245 () Bool)

(declare-fun Unit!25643 () Unit!25640)

(assert (=> b!748245 (= e!417605 Unit!25643)))

(assert (=> b!748245 false))

(declare-fun b!748246 () Bool)

(assert (=> b!748246 (= e!417609 e!417607)))

(declare-fun res!504804 () Bool)

(assert (=> b!748246 (=> (not res!504804) (not e!417607))))

(declare-fun lt!332491 () SeekEntryResult!7570)

(assert (=> b!748246 (= res!504804 (= lt!332491 lt!332493))))

(declare-fun lt!332490 () (_ BitVec 64))

(declare-fun lt!332495 () array!41718)

(assert (=> b!748246 (= lt!332493 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332490 lt!332495 mask!3328))))

(assert (=> b!748246 (= lt!332491 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332490 mask!3328) lt!332490 lt!332495 mask!3328))))

(assert (=> b!748246 (= lt!332490 (select (store (arr!19973 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!748246 (= lt!332495 (array!41719 (store (arr!19973 a!3186) i!1173 k0!2102) (size!20394 a!3186)))))

(declare-fun b!748247 () Bool)

(declare-fun res!504803 () Bool)

(assert (=> b!748247 (=> (not res!504803) (not e!417612))))

(assert (=> b!748247 (= res!504803 (and (= (size!20394 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20394 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20394 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!748248 () Bool)

(assert (=> b!748248 (= e!417611 true)))

(assert (=> b!748248 (= (select (store (arr!19973 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332489 () Unit!25640)

(assert (=> b!748248 (= lt!332489 e!417605)))

(declare-fun c!82103 () Bool)

(assert (=> b!748248 (= c!82103 (= (select (store (arr!19973 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!748249 () Bool)

(declare-fun res!504802 () Bool)

(assert (=> b!748249 (=> res!504802 e!417611)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41718 (_ BitVec 32)) SeekEntryResult!7570)

(assert (=> b!748249 (= res!504802 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19973 a!3186) j!159) a!3186 mask!3328) lt!332492)))))

(declare-fun b!748250 () Bool)

(declare-fun res!504799 () Bool)

(assert (=> b!748250 (=> (not res!504799) (not e!417609))))

(assert (=> b!748250 (= res!504799 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19973 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!748251 () Bool)

(assert (=> b!748251 (= e!417608 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19973 a!3186) j!159) a!3186 mask!3328) lt!332492))))

(declare-fun e!417613 () Bool)

(declare-fun b!748252 () Bool)

(assert (=> b!748252 (= e!417613 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19973 a!3186) j!159) a!3186 mask!3328) lt!332487))))

(declare-fun b!748253 () Bool)

(assert (=> b!748253 (= e!417613 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19973 a!3186) j!159) a!3186 mask!3328) (Found!7570 j!159)))))

(declare-fun b!748254 () Bool)

(declare-fun res!504796 () Bool)

(assert (=> b!748254 (=> (not res!504796) (not e!417609))))

(assert (=> b!748254 (= res!504796 e!417613)))

(declare-fun c!82104 () Bool)

(assert (=> b!748254 (= c!82104 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!748255 () Bool)

(declare-fun res!504807 () Bool)

(assert (=> b!748255 (=> (not res!504807) (not e!417612))))

(assert (=> b!748255 (= res!504807 (validKeyInArray!0 (select (arr!19973 a!3186) j!159)))))

(declare-fun b!748256 () Bool)

(declare-fun res!504806 () Bool)

(assert (=> b!748256 (=> res!504806 e!417611)))

(assert (=> b!748256 (= res!504806 (= (select (store (arr!19973 a!3186) i!1173 k0!2102) index!1321) lt!332490))))

(assert (= (and start!65528 res!504801) b!748247))

(assert (= (and b!748247 res!504803) b!748255))

(assert (= (and b!748255 res!504807) b!748240))

(assert (= (and b!748240 res!504797) b!748242))

(assert (= (and b!748242 res!504798) b!748241))

(assert (= (and b!748241 res!504805) b!748236))

(assert (= (and b!748236 res!504795) b!748238))

(assert (= (and b!748238 res!504792) b!748237))

(assert (= (and b!748237 res!504793) b!748243))

(assert (= (and b!748243 res!504794) b!748250))

(assert (= (and b!748250 res!504799) b!748254))

(assert (= (and b!748254 c!82104) b!748252))

(assert (= (and b!748254 (not c!82104)) b!748253))

(assert (= (and b!748254 res!504796) b!748246))

(assert (= (and b!748246 res!504804) b!748239))

(assert (= (and b!748239 res!504800) b!748251))

(assert (= (and b!748239 (not res!504791)) b!748249))

(assert (= (and b!748249 (not res!504802)) b!748256))

(assert (= (and b!748256 (not res!504806)) b!748248))

(assert (= (and b!748248 c!82103) b!748245))

(assert (= (and b!748248 (not c!82103)) b!748244))

(declare-fun m!697559 () Bool)

(assert (=> b!748236 m!697559))

(declare-fun m!697561 () Bool)

(assert (=> b!748253 m!697561))

(assert (=> b!748253 m!697561))

(declare-fun m!697563 () Bool)

(assert (=> b!748253 m!697563))

(assert (=> b!748243 m!697561))

(assert (=> b!748243 m!697561))

(declare-fun m!697565 () Bool)

(assert (=> b!748243 m!697565))

(assert (=> b!748243 m!697565))

(assert (=> b!748243 m!697561))

(declare-fun m!697567 () Bool)

(assert (=> b!748243 m!697567))

(declare-fun m!697569 () Bool)

(assert (=> b!748240 m!697569))

(assert (=> b!748249 m!697561))

(assert (=> b!748249 m!697561))

(assert (=> b!748249 m!697563))

(declare-fun m!697571 () Bool)

(assert (=> b!748238 m!697571))

(assert (=> b!748239 m!697561))

(assert (=> b!748239 m!697561))

(declare-fun m!697573 () Bool)

(assert (=> b!748239 m!697573))

(declare-fun m!697575 () Bool)

(assert (=> b!748239 m!697575))

(declare-fun m!697577 () Bool)

(assert (=> b!748239 m!697577))

(assert (=> b!748252 m!697561))

(assert (=> b!748252 m!697561))

(declare-fun m!697579 () Bool)

(assert (=> b!748252 m!697579))

(declare-fun m!697581 () Bool)

(assert (=> b!748242 m!697581))

(declare-fun m!697583 () Bool)

(assert (=> b!748250 m!697583))

(declare-fun m!697585 () Bool)

(assert (=> start!65528 m!697585))

(declare-fun m!697587 () Bool)

(assert (=> start!65528 m!697587))

(declare-fun m!697589 () Bool)

(assert (=> b!748246 m!697589))

(declare-fun m!697591 () Bool)

(assert (=> b!748246 m!697591))

(declare-fun m!697593 () Bool)

(assert (=> b!748246 m!697593))

(declare-fun m!697595 () Bool)

(assert (=> b!748246 m!697595))

(declare-fun m!697597 () Bool)

(assert (=> b!748246 m!697597))

(assert (=> b!748246 m!697595))

(assert (=> b!748248 m!697589))

(declare-fun m!697599 () Bool)

(assert (=> b!748248 m!697599))

(assert (=> b!748251 m!697561))

(assert (=> b!748251 m!697561))

(declare-fun m!697601 () Bool)

(assert (=> b!748251 m!697601))

(declare-fun m!697603 () Bool)

(assert (=> b!748241 m!697603))

(assert (=> b!748256 m!697589))

(assert (=> b!748256 m!697599))

(assert (=> b!748255 m!697561))

(assert (=> b!748255 m!697561))

(declare-fun m!697605 () Bool)

(assert (=> b!748255 m!697605))

(check-sat (not b!748240) (not b!748243) (not b!748249) (not b!748236) (not b!748251) (not b!748255) (not b!748242) (not b!748239) (not b!748252) (not b!748241) (not b!748246) (not start!65528) (not b!748238) (not b!748253))
(check-sat)
