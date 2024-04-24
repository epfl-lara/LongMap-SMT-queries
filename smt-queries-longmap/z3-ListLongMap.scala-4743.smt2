; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65646 () Bool)

(assert start!65646)

(declare-fun b!748279 () Bool)

(declare-fun e!417830 () Bool)

(declare-fun e!417826 () Bool)

(assert (=> b!748279 (= e!417830 e!417826)))

(declare-fun res!504444 () Bool)

(assert (=> b!748279 (=> (not res!504444) (not e!417826))))

(declare-datatypes ((array!41689 0))(
  ( (array!41690 (arr!19954 (Array (_ BitVec 32) (_ BitVec 64))) (size!20374 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41689)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7510 0))(
  ( (MissingZero!7510 (index!32408 (_ BitVec 32))) (Found!7510 (index!32409 (_ BitVec 32))) (Intermediate!7510 (undefined!8322 Bool) (index!32410 (_ BitVec 32)) (x!63512 (_ BitVec 32))) (Undefined!7510) (MissingVacant!7510 (index!32411 (_ BitVec 32))) )
))
(declare-fun lt!332597 () SeekEntryResult!7510)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41689 (_ BitVec 32)) SeekEntryResult!7510)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!748279 (= res!504444 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19954 a!3186) j!159) mask!3328) (select (arr!19954 a!3186) j!159) a!3186 mask!3328) lt!332597))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!748279 (= lt!332597 (Intermediate!7510 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!748280 () Bool)

(declare-fun res!504435 () Bool)

(declare-fun e!417832 () Bool)

(assert (=> b!748280 (=> (not res!504435) (not e!417832))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!748280 (= res!504435 (validKeyInArray!0 k0!2102))))

(declare-fun res!504449 () Bool)

(assert (=> start!65646 (=> (not res!504449) (not e!417832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65646 (= res!504449 (validMask!0 mask!3328))))

(assert (=> start!65646 e!417832))

(assert (=> start!65646 true))

(declare-fun array_inv!15813 (array!41689) Bool)

(assert (=> start!65646 (array_inv!15813 a!3186)))

(declare-fun b!748281 () Bool)

(declare-fun res!504436 () Bool)

(assert (=> b!748281 (=> (not res!504436) (not e!417826))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!748281 (= res!504436 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19954 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!748282 () Bool)

(declare-fun e!417829 () Bool)

(declare-fun e!417834 () Bool)

(assert (=> b!748282 (= e!417829 (not e!417834))))

(declare-fun res!504448 () Bool)

(assert (=> b!748282 (=> res!504448 e!417834)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!332593 () SeekEntryResult!7510)

(declare-fun index!1321 () (_ BitVec 32))

(get-info :version)

(assert (=> b!748282 (= res!504448 (or (not ((_ is Intermediate!7510) lt!332593)) (bvslt x!1131 (x!63512 lt!332593)) (not (= x!1131 (x!63512 lt!332593))) (not (= index!1321 (index!32410 lt!332593)))))))

(declare-fun e!417833 () Bool)

(assert (=> b!748282 e!417833))

(declare-fun res!504447 () Bool)

(assert (=> b!748282 (=> (not res!504447) (not e!417833))))

(declare-fun lt!332590 () SeekEntryResult!7510)

(declare-fun lt!332589 () SeekEntryResult!7510)

(assert (=> b!748282 (= res!504447 (= lt!332590 lt!332589))))

(assert (=> b!748282 (= lt!332589 (Found!7510 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41689 (_ BitVec 32)) SeekEntryResult!7510)

(assert (=> b!748282 (= lt!332590 (seekEntryOrOpen!0 (select (arr!19954 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41689 (_ BitVec 32)) Bool)

(assert (=> b!748282 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25597 0))(
  ( (Unit!25598) )
))
(declare-fun lt!332595 () Unit!25597)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41689 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25597)

(assert (=> b!748282 (= lt!332595 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!748283 () Bool)

(declare-fun e!417827 () Unit!25597)

(declare-fun Unit!25599 () Unit!25597)

(assert (=> b!748283 (= e!417827 Unit!25599)))

(declare-fun b!748284 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41689 (_ BitVec 32)) SeekEntryResult!7510)

(assert (=> b!748284 (= e!417833 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19954 a!3186) j!159) a!3186 mask!3328) lt!332589))))

(declare-fun b!748285 () Bool)

(declare-fun res!504442 () Bool)

(assert (=> b!748285 (=> (not res!504442) (not e!417830))))

(assert (=> b!748285 (= res!504442 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20374 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20374 a!3186))))))

(declare-fun b!748286 () Bool)

(declare-fun res!504446 () Bool)

(assert (=> b!748286 (=> res!504446 e!417834)))

(assert (=> b!748286 (= res!504446 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19954 a!3186) j!159) a!3186 mask!3328) lt!332589)))))

(declare-fun b!748287 () Bool)

(declare-fun Unit!25600 () Unit!25597)

(assert (=> b!748287 (= e!417827 Unit!25600)))

(assert (=> b!748287 false))

(declare-fun b!748288 () Bool)

(declare-fun e!417825 () Bool)

(assert (=> b!748288 (= e!417825 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19954 a!3186) j!159) a!3186 mask!3328) lt!332597))))

(declare-fun b!748289 () Bool)

(declare-fun res!504450 () Bool)

(assert (=> b!748289 (=> (not res!504450) (not e!417832))))

(declare-fun arrayContainsKey!0 (array!41689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!748289 (= res!504450 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!748290 () Bool)

(assert (=> b!748290 (= e!417826 e!417829)))

(declare-fun res!504438 () Bool)

(assert (=> b!748290 (=> (not res!504438) (not e!417829))))

(declare-fun lt!332594 () SeekEntryResult!7510)

(assert (=> b!748290 (= res!504438 (= lt!332594 lt!332593))))

(declare-fun lt!332592 () (_ BitVec 64))

(declare-fun lt!332598 () array!41689)

(assert (=> b!748290 (= lt!332593 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332592 lt!332598 mask!3328))))

(assert (=> b!748290 (= lt!332594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332592 mask!3328) lt!332592 lt!332598 mask!3328))))

(assert (=> b!748290 (= lt!332592 (select (store (arr!19954 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!748290 (= lt!332598 (array!41690 (store (arr!19954 a!3186) i!1173 k0!2102) (size!20374 a!3186)))))

(declare-fun b!748291 () Bool)

(declare-fun res!504441 () Bool)

(assert (=> b!748291 (=> (not res!504441) (not e!417830))))

(assert (=> b!748291 (= res!504441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!748292 () Bool)

(declare-fun res!504434 () Bool)

(assert (=> b!748292 (=> (not res!504434) (not e!417832))))

(assert (=> b!748292 (= res!504434 (and (= (size!20374 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20374 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20374 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!748293 () Bool)

(declare-fun res!504451 () Bool)

(assert (=> b!748293 (=> (not res!504451) (not e!417830))))

(declare-datatypes ((List!13863 0))(
  ( (Nil!13860) (Cons!13859 (h!14937 (_ BitVec 64)) (t!20170 List!13863)) )
))
(declare-fun arrayNoDuplicates!0 (array!41689 (_ BitVec 32) List!13863) Bool)

(assert (=> b!748293 (= res!504451 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13860))))

(declare-fun b!748294 () Bool)

(assert (=> b!748294 (= e!417825 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19954 a!3186) j!159) a!3186 mask!3328) (Found!7510 j!159)))))

(declare-fun b!748295 () Bool)

(assert (=> b!748295 (= e!417832 e!417830)))

(declare-fun res!504443 () Bool)

(assert (=> b!748295 (=> (not res!504443) (not e!417830))))

(declare-fun lt!332591 () SeekEntryResult!7510)

(assert (=> b!748295 (= res!504443 (or (= lt!332591 (MissingZero!7510 i!1173)) (= lt!332591 (MissingVacant!7510 i!1173))))))

(assert (=> b!748295 (= lt!332591 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!748296 () Bool)

(declare-fun res!504440 () Bool)

(assert (=> b!748296 (=> res!504440 e!417834)))

(assert (=> b!748296 (= res!504440 (= (select (store (arr!19954 a!3186) i!1173 k0!2102) index!1321) lt!332592))))

(declare-fun b!748297 () Bool)

(declare-fun e!417831 () Bool)

(assert (=> b!748297 (= e!417831 (validKeyInArray!0 lt!332592))))

(declare-fun b!748298 () Bool)

(assert (=> b!748298 (= e!417834 e!417831)))

(declare-fun res!504445 () Bool)

(assert (=> b!748298 (=> res!504445 e!417831)))

(assert (=> b!748298 (= res!504445 (bvslt mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!748298 (= (select (store (arr!19954 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332596 () Unit!25597)

(assert (=> b!748298 (= lt!332596 e!417827)))

(declare-fun c!82307 () Bool)

(assert (=> b!748298 (= c!82307 (= (select (store (arr!19954 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!748299 () Bool)

(declare-fun res!504439 () Bool)

(assert (=> b!748299 (=> (not res!504439) (not e!417826))))

(assert (=> b!748299 (= res!504439 e!417825)))

(declare-fun c!82306 () Bool)

(assert (=> b!748299 (= c!82306 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!748300 () Bool)

(declare-fun res!504437 () Bool)

(assert (=> b!748300 (=> (not res!504437) (not e!417832))))

(assert (=> b!748300 (= res!504437 (validKeyInArray!0 (select (arr!19954 a!3186) j!159)))))

(assert (= (and start!65646 res!504449) b!748292))

(assert (= (and b!748292 res!504434) b!748300))

(assert (= (and b!748300 res!504437) b!748280))

(assert (= (and b!748280 res!504435) b!748289))

(assert (= (and b!748289 res!504450) b!748295))

(assert (= (and b!748295 res!504443) b!748291))

(assert (= (and b!748291 res!504441) b!748293))

(assert (= (and b!748293 res!504451) b!748285))

(assert (= (and b!748285 res!504442) b!748279))

(assert (= (and b!748279 res!504444) b!748281))

(assert (= (and b!748281 res!504436) b!748299))

(assert (= (and b!748299 c!82306) b!748288))

(assert (= (and b!748299 (not c!82306)) b!748294))

(assert (= (and b!748299 res!504439) b!748290))

(assert (= (and b!748290 res!504438) b!748282))

(assert (= (and b!748282 res!504447) b!748284))

(assert (= (and b!748282 (not res!504448)) b!748286))

(assert (= (and b!748286 (not res!504446)) b!748296))

(assert (= (and b!748296 (not res!504440)) b!748298))

(assert (= (and b!748298 c!82307) b!748287))

(assert (= (and b!748298 (not c!82307)) b!748283))

(assert (= (and b!748298 (not res!504445)) b!748297))

(declare-fun m!698751 () Bool)

(assert (=> start!65646 m!698751))

(declare-fun m!698753 () Bool)

(assert (=> start!65646 m!698753))

(declare-fun m!698755 () Bool)

(assert (=> b!748293 m!698755))

(declare-fun m!698757 () Bool)

(assert (=> b!748289 m!698757))

(declare-fun m!698759 () Bool)

(assert (=> b!748282 m!698759))

(assert (=> b!748282 m!698759))

(declare-fun m!698761 () Bool)

(assert (=> b!748282 m!698761))

(declare-fun m!698763 () Bool)

(assert (=> b!748282 m!698763))

(declare-fun m!698765 () Bool)

(assert (=> b!748282 m!698765))

(declare-fun m!698767 () Bool)

(assert (=> b!748291 m!698767))

(declare-fun m!698769 () Bool)

(assert (=> b!748297 m!698769))

(declare-fun m!698771 () Bool)

(assert (=> b!748290 m!698771))

(declare-fun m!698773 () Bool)

(assert (=> b!748290 m!698773))

(declare-fun m!698775 () Bool)

(assert (=> b!748290 m!698775))

(declare-fun m!698777 () Bool)

(assert (=> b!748290 m!698777))

(declare-fun m!698779 () Bool)

(assert (=> b!748290 m!698779))

(assert (=> b!748290 m!698773))

(declare-fun m!698781 () Bool)

(assert (=> b!748281 m!698781))

(assert (=> b!748284 m!698759))

(assert (=> b!748284 m!698759))

(declare-fun m!698783 () Bool)

(assert (=> b!748284 m!698783))

(assert (=> b!748286 m!698759))

(assert (=> b!748286 m!698759))

(declare-fun m!698785 () Bool)

(assert (=> b!748286 m!698785))

(assert (=> b!748288 m!698759))

(assert (=> b!748288 m!698759))

(declare-fun m!698787 () Bool)

(assert (=> b!748288 m!698787))

(assert (=> b!748298 m!698777))

(declare-fun m!698789 () Bool)

(assert (=> b!748298 m!698789))

(declare-fun m!698791 () Bool)

(assert (=> b!748295 m!698791))

(assert (=> b!748296 m!698777))

(assert (=> b!748296 m!698789))

(declare-fun m!698793 () Bool)

(assert (=> b!748280 m!698793))

(assert (=> b!748300 m!698759))

(assert (=> b!748300 m!698759))

(declare-fun m!698795 () Bool)

(assert (=> b!748300 m!698795))

(assert (=> b!748279 m!698759))

(assert (=> b!748279 m!698759))

(declare-fun m!698797 () Bool)

(assert (=> b!748279 m!698797))

(assert (=> b!748279 m!698797))

(assert (=> b!748279 m!698759))

(declare-fun m!698799 () Bool)

(assert (=> b!748279 m!698799))

(assert (=> b!748294 m!698759))

(assert (=> b!748294 m!698759))

(assert (=> b!748294 m!698785))

(check-sat (not start!65646) (not b!748280) (not b!748297) (not b!748300) (not b!748288) (not b!748286) (not b!748295) (not b!748289) (not b!748290) (not b!748279) (not b!748293) (not b!748282) (not b!748291) (not b!748294) (not b!748284))
(check-sat)
