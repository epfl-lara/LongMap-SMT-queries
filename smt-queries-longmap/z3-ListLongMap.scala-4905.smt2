; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67792 () Bool)

(assert start!67792)

(declare-fun res!530733 () Bool)

(declare-fun e!436302 () Bool)

(assert (=> start!67792 (=> (not res!530733) (not e!436302))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67792 (= res!530733 (validMask!0 mask!3328))))

(assert (=> start!67792 e!436302))

(assert (=> start!67792 true))

(declare-datatypes ((array!42712 0))(
  ( (array!42713 (arr!20440 (Array (_ BitVec 32) (_ BitVec 64))) (size!20860 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42712)

(declare-fun array_inv!16299 (array!42712) Bool)

(assert (=> start!67792 (array_inv!16299 a!3186)))

(declare-fun b!784610 () Bool)

(declare-fun e!436307 () Bool)

(assert (=> b!784610 (= e!436307 true)))

(declare-fun e!436310 () Bool)

(assert (=> b!784610 e!436310))

(declare-fun res!530719 () Bool)

(assert (=> b!784610 (=> (not res!530719) (not e!436310))))

(declare-fun lt!349718 () (_ BitVec 64))

(assert (=> b!784610 (= res!530719 (= lt!349718 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27049 0))(
  ( (Unit!27050) )
))
(declare-fun lt!349714 () Unit!27049)

(declare-fun e!436308 () Unit!27049)

(assert (=> b!784610 (= lt!349714 e!436308)))

(declare-fun c!87358 () Bool)

(assert (=> b!784610 (= c!87358 (= lt!349718 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!784611 () Bool)

(declare-fun res!530728 () Bool)

(assert (=> b!784611 (=> (not res!530728) (not e!436302))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42712 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!784611 (= res!530728 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!784612 () Bool)

(declare-fun e!436311 () Bool)

(declare-fun e!436306 () Bool)

(assert (=> b!784612 (= e!436311 e!436306)))

(declare-fun res!530725 () Bool)

(assert (=> b!784612 (=> (not res!530725) (not e!436306))))

(declare-datatypes ((SeekEntryResult!7996 0))(
  ( (MissingZero!7996 (index!34352 (_ BitVec 32))) (Found!7996 (index!34353 (_ BitVec 32))) (Intermediate!7996 (undefined!8808 Bool) (index!34354 (_ BitVec 32)) (x!65467 (_ BitVec 32))) (Undefined!7996) (MissingVacant!7996 (index!34355 (_ BitVec 32))) )
))
(declare-fun lt!349713 () SeekEntryResult!7996)

(declare-fun lt!349719 () SeekEntryResult!7996)

(assert (=> b!784612 (= res!530725 (= lt!349713 lt!349719))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!349712 () array!42712)

(declare-fun lt!349715 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42712 (_ BitVec 32)) SeekEntryResult!7996)

(assert (=> b!784612 (= lt!349719 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349715 lt!349712 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!784612 (= lt!349713 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349715 mask!3328) lt!349715 lt!349712 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!784612 (= lt!349715 (select (store (arr!20440 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!784612 (= lt!349712 (array!42713 (store (arr!20440 a!3186) i!1173 k0!2102) (size!20860 a!3186)))))

(declare-fun b!784613 () Bool)

(declare-fun lt!349717 () SeekEntryResult!7996)

(declare-fun e!436301 () Bool)

(assert (=> b!784613 (= e!436301 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20440 a!3186) j!159) a!3186 mask!3328) lt!349717))))

(declare-fun b!784614 () Bool)

(declare-fun e!436303 () Bool)

(declare-fun e!436304 () Bool)

(assert (=> b!784614 (= e!436303 e!436304)))

(declare-fun res!530724 () Bool)

(assert (=> b!784614 (=> res!530724 e!436304)))

(declare-fun lt!349720 () SeekEntryResult!7996)

(declare-fun lt!349716 () SeekEntryResult!7996)

(assert (=> b!784614 (= res!530724 (not (= lt!349720 lt!349716)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42712 (_ BitVec 32)) SeekEntryResult!7996)

(assert (=> b!784614 (= lt!349720 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20440 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!784615 () Bool)

(declare-fun res!530730 () Bool)

(declare-fun e!436312 () Bool)

(assert (=> b!784615 (=> (not res!530730) (not e!436312))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!784615 (= res!530730 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20860 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20860 a!3186))))))

(declare-fun b!784616 () Bool)

(assert (=> b!784616 (= e!436301 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20440 a!3186) j!159) a!3186 mask!3328) (Found!7996 j!159)))))

(declare-fun b!784617 () Bool)

(declare-fun res!530726 () Bool)

(assert (=> b!784617 (=> (not res!530726) (not e!436302))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!784617 (= res!530726 (validKeyInArray!0 k0!2102))))

(declare-fun b!784618 () Bool)

(declare-fun res!530727 () Bool)

(assert (=> b!784618 (=> (not res!530727) (not e!436302))))

(assert (=> b!784618 (= res!530727 (and (= (size!20860 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20860 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20860 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!784619 () Bool)

(declare-fun Unit!27051 () Unit!27049)

(assert (=> b!784619 (= e!436308 Unit!27051)))

(assert (=> b!784619 false))

(declare-fun b!784620 () Bool)

(declare-fun lt!349711 () SeekEntryResult!7996)

(assert (=> b!784620 (= e!436310 (= lt!349711 lt!349720))))

(declare-fun b!784621 () Bool)

(declare-fun Unit!27052 () Unit!27049)

(assert (=> b!784621 (= e!436308 Unit!27052)))

(declare-fun b!784622 () Bool)

(declare-fun res!530729 () Bool)

(assert (=> b!784622 (=> (not res!530729) (not e!436311))))

(assert (=> b!784622 (= res!530729 e!436301)))

(declare-fun c!87359 () Bool)

(assert (=> b!784622 (= c!87359 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!784623 () Bool)

(declare-fun res!530721 () Bool)

(assert (=> b!784623 (=> (not res!530721) (not e!436312))))

(declare-datatypes ((List!14349 0))(
  ( (Nil!14346) (Cons!14345 (h!15474 (_ BitVec 64)) (t!20656 List!14349)) )
))
(declare-fun arrayNoDuplicates!0 (array!42712 (_ BitVec 32) List!14349) Bool)

(assert (=> b!784623 (= res!530721 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14346))))

(declare-fun b!784624 () Bool)

(declare-fun res!530732 () Bool)

(assert (=> b!784624 (=> (not res!530732) (not e!436311))))

(assert (=> b!784624 (= res!530732 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20440 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!784625 () Bool)

(assert (=> b!784625 (= e!436312 e!436311)))

(declare-fun res!530720 () Bool)

(assert (=> b!784625 (=> (not res!530720) (not e!436311))))

(assert (=> b!784625 (= res!530720 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20440 a!3186) j!159) mask!3328) (select (arr!20440 a!3186) j!159) a!3186 mask!3328) lt!349717))))

(assert (=> b!784625 (= lt!349717 (Intermediate!7996 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!784626 () Bool)

(declare-fun res!530717 () Bool)

(assert (=> b!784626 (=> (not res!530717) (not e!436302))))

(assert (=> b!784626 (= res!530717 (validKeyInArray!0 (select (arr!20440 a!3186) j!159)))))

(declare-fun b!784627 () Bool)

(declare-fun res!530715 () Bool)

(assert (=> b!784627 (=> (not res!530715) (not e!436310))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42712 (_ BitVec 32)) SeekEntryResult!7996)

(assert (=> b!784627 (= res!530715 (= (seekEntryOrOpen!0 lt!349715 lt!349712 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349715 lt!349712 mask!3328)))))

(declare-fun b!784628 () Bool)

(assert (=> b!784628 (= e!436306 (not e!436303))))

(declare-fun res!530716 () Bool)

(assert (=> b!784628 (=> res!530716 e!436303)))

(get-info :version)

(assert (=> b!784628 (= res!530716 (or (not ((_ is Intermediate!7996) lt!349719)) (bvslt x!1131 (x!65467 lt!349719)) (not (= x!1131 (x!65467 lt!349719))) (not (= index!1321 (index!34354 lt!349719)))))))

(declare-fun e!436309 () Bool)

(assert (=> b!784628 e!436309))

(declare-fun res!530731 () Bool)

(assert (=> b!784628 (=> (not res!530731) (not e!436309))))

(assert (=> b!784628 (= res!530731 (= lt!349711 lt!349716))))

(assert (=> b!784628 (= lt!349716 (Found!7996 j!159))))

(assert (=> b!784628 (= lt!349711 (seekEntryOrOpen!0 (select (arr!20440 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42712 (_ BitVec 32)) Bool)

(assert (=> b!784628 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349709 () Unit!27049)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42712 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27049)

(assert (=> b!784628 (= lt!349709 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!784629 () Bool)

(assert (=> b!784629 (= e!436302 e!436312)))

(declare-fun res!530718 () Bool)

(assert (=> b!784629 (=> (not res!530718) (not e!436312))))

(declare-fun lt!349710 () SeekEntryResult!7996)

(assert (=> b!784629 (= res!530718 (or (= lt!349710 (MissingZero!7996 i!1173)) (= lt!349710 (MissingVacant!7996 i!1173))))))

(assert (=> b!784629 (= lt!349710 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!784630 () Bool)

(assert (=> b!784630 (= e!436304 e!436307)))

(declare-fun res!530723 () Bool)

(assert (=> b!784630 (=> res!530723 e!436307)))

(assert (=> b!784630 (= res!530723 (= lt!349718 lt!349715))))

(assert (=> b!784630 (= lt!349718 (select (store (arr!20440 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!784631 () Bool)

(declare-fun res!530722 () Bool)

(assert (=> b!784631 (=> (not res!530722) (not e!436312))))

(assert (=> b!784631 (= res!530722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!784632 () Bool)

(assert (=> b!784632 (= e!436309 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20440 a!3186) j!159) a!3186 mask!3328) lt!349716))))

(assert (= (and start!67792 res!530733) b!784618))

(assert (= (and b!784618 res!530727) b!784626))

(assert (= (and b!784626 res!530717) b!784617))

(assert (= (and b!784617 res!530726) b!784611))

(assert (= (and b!784611 res!530728) b!784629))

(assert (= (and b!784629 res!530718) b!784631))

(assert (= (and b!784631 res!530722) b!784623))

(assert (= (and b!784623 res!530721) b!784615))

(assert (= (and b!784615 res!530730) b!784625))

(assert (= (and b!784625 res!530720) b!784624))

(assert (= (and b!784624 res!530732) b!784622))

(assert (= (and b!784622 c!87359) b!784613))

(assert (= (and b!784622 (not c!87359)) b!784616))

(assert (= (and b!784622 res!530729) b!784612))

(assert (= (and b!784612 res!530725) b!784628))

(assert (= (and b!784628 res!530731) b!784632))

(assert (= (and b!784628 (not res!530716)) b!784614))

(assert (= (and b!784614 (not res!530724)) b!784630))

(assert (= (and b!784630 (not res!530723)) b!784610))

(assert (= (and b!784610 c!87358) b!784619))

(assert (= (and b!784610 (not c!87358)) b!784621))

(assert (= (and b!784610 res!530719) b!784627))

(assert (= (and b!784627 res!530715) b!784620))

(declare-fun m!727463 () Bool)

(assert (=> b!784629 m!727463))

(declare-fun m!727465 () Bool)

(assert (=> start!67792 m!727465))

(declare-fun m!727467 () Bool)

(assert (=> start!67792 m!727467))

(declare-fun m!727469 () Bool)

(assert (=> b!784630 m!727469))

(declare-fun m!727471 () Bool)

(assert (=> b!784630 m!727471))

(declare-fun m!727473 () Bool)

(assert (=> b!784614 m!727473))

(assert (=> b!784614 m!727473))

(declare-fun m!727475 () Bool)

(assert (=> b!784614 m!727475))

(assert (=> b!784626 m!727473))

(assert (=> b!784626 m!727473))

(declare-fun m!727477 () Bool)

(assert (=> b!784626 m!727477))

(declare-fun m!727479 () Bool)

(assert (=> b!784631 m!727479))

(assert (=> b!784628 m!727473))

(assert (=> b!784628 m!727473))

(declare-fun m!727481 () Bool)

(assert (=> b!784628 m!727481))

(declare-fun m!727483 () Bool)

(assert (=> b!784628 m!727483))

(declare-fun m!727485 () Bool)

(assert (=> b!784628 m!727485))

(declare-fun m!727487 () Bool)

(assert (=> b!784612 m!727487))

(declare-fun m!727489 () Bool)

(assert (=> b!784612 m!727489))

(assert (=> b!784612 m!727487))

(assert (=> b!784612 m!727469))

(declare-fun m!727491 () Bool)

(assert (=> b!784612 m!727491))

(declare-fun m!727493 () Bool)

(assert (=> b!784612 m!727493))

(assert (=> b!784616 m!727473))

(assert (=> b!784616 m!727473))

(assert (=> b!784616 m!727475))

(declare-fun m!727495 () Bool)

(assert (=> b!784617 m!727495))

(declare-fun m!727497 () Bool)

(assert (=> b!784623 m!727497))

(declare-fun m!727499 () Bool)

(assert (=> b!784627 m!727499))

(declare-fun m!727501 () Bool)

(assert (=> b!784627 m!727501))

(declare-fun m!727503 () Bool)

(assert (=> b!784611 m!727503))

(assert (=> b!784632 m!727473))

(assert (=> b!784632 m!727473))

(declare-fun m!727505 () Bool)

(assert (=> b!784632 m!727505))

(assert (=> b!784613 m!727473))

(assert (=> b!784613 m!727473))

(declare-fun m!727507 () Bool)

(assert (=> b!784613 m!727507))

(assert (=> b!784625 m!727473))

(assert (=> b!784625 m!727473))

(declare-fun m!727509 () Bool)

(assert (=> b!784625 m!727509))

(assert (=> b!784625 m!727509))

(assert (=> b!784625 m!727473))

(declare-fun m!727511 () Bool)

(assert (=> b!784625 m!727511))

(declare-fun m!727513 () Bool)

(assert (=> b!784624 m!727513))

(check-sat (not b!784613) (not b!784625) (not b!784626) (not b!784614) (not b!784632) (not b!784617) (not b!784627) (not b!784611) (not start!67792) (not b!784623) (not b!784631) (not b!784629) (not b!784628) (not b!784612) (not b!784616))
(check-sat)
