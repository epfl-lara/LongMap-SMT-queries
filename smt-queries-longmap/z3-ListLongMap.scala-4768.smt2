; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65670 () Bool)

(assert start!65670)

(declare-fun b!752528 () Bool)

(declare-fun e!419761 () Bool)

(assert (=> b!752528 (= e!419761 true)))

(declare-fun e!419759 () Bool)

(assert (=> b!752528 e!419759))

(declare-fun res!508219 () Bool)

(assert (=> b!752528 (=> (not res!508219) (not e!419759))))

(declare-fun lt!334756 () (_ BitVec 64))

(assert (=> b!752528 (= res!508219 (= lt!334756 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25920 0))(
  ( (Unit!25921) )
))
(declare-fun lt!334752 () Unit!25920)

(declare-fun e!419756 () Unit!25920)

(assert (=> b!752528 (= lt!334752 e!419756)))

(declare-fun c!82540 () Bool)

(assert (=> b!752528 (= c!82540 (= lt!334756 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!752529 () Bool)

(declare-fun res!508223 () Bool)

(declare-fun e!419754 () Bool)

(assert (=> b!752529 (=> (not res!508223) (not e!419754))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41843 0))(
  ( (array!41844 (arr!20035 (Array (_ BitVec 32) (_ BitVec 64))) (size!20456 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41843)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!752529 (= res!508223 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20456 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20456 a!3186))))))

(declare-fun b!752530 () Bool)

(declare-fun res!508226 () Bool)

(declare-fun e!419765 () Bool)

(assert (=> b!752530 (=> (not res!508226) (not e!419765))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!752530 (= res!508226 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!752531 () Bool)

(declare-fun res!508216 () Bool)

(declare-fun e!419755 () Bool)

(assert (=> b!752531 (=> (not res!508216) (not e!419755))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!752531 (= res!508216 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20035 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!752532 () Bool)

(declare-fun res!508211 () Bool)

(assert (=> b!752532 (=> (not res!508211) (not e!419765))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!752532 (= res!508211 (validKeyInArray!0 k0!2102))))

(declare-fun b!752533 () Bool)

(declare-fun e!419757 () Bool)

(assert (=> b!752533 (= e!419755 e!419757)))

(declare-fun res!508225 () Bool)

(assert (=> b!752533 (=> (not res!508225) (not e!419757))))

(declare-datatypes ((SeekEntryResult!7635 0))(
  ( (MissingZero!7635 (index!32908 (_ BitVec 32))) (Found!7635 (index!32909 (_ BitVec 32))) (Intermediate!7635 (undefined!8447 Bool) (index!32910 (_ BitVec 32)) (x!63825 (_ BitVec 32))) (Undefined!7635) (MissingVacant!7635 (index!32911 (_ BitVec 32))) )
))
(declare-fun lt!334746 () SeekEntryResult!7635)

(declare-fun lt!334753 () SeekEntryResult!7635)

(assert (=> b!752533 (= res!508225 (= lt!334746 lt!334753))))

(declare-fun lt!334749 () array!41843)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!334750 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41843 (_ BitVec 32)) SeekEntryResult!7635)

(assert (=> b!752533 (= lt!334753 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334750 lt!334749 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!752533 (= lt!334746 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334750 mask!3328) lt!334750 lt!334749 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!752533 (= lt!334750 (select (store (arr!20035 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!752533 (= lt!334749 (array!41844 (store (arr!20035 a!3186) i!1173 k0!2102) (size!20456 a!3186)))))

(declare-fun b!752534 () Bool)

(declare-fun res!508222 () Bool)

(assert (=> b!752534 (=> (not res!508222) (not e!419765))))

(assert (=> b!752534 (= res!508222 (and (= (size!20456 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20456 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20456 a!3186)) (not (= i!1173 j!159))))))

(declare-fun lt!334757 () SeekEntryResult!7635)

(declare-fun e!419764 () Bool)

(declare-fun b!752535 () Bool)

(assert (=> b!752535 (= e!419764 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20035 a!3186) j!159) a!3186 mask!3328) lt!334757))))

(declare-fun b!752536 () Bool)

(declare-fun e!419762 () Bool)

(assert (=> b!752536 (= e!419762 e!419761)))

(declare-fun res!508224 () Bool)

(assert (=> b!752536 (=> res!508224 e!419761)))

(assert (=> b!752536 (= res!508224 (= lt!334756 lt!334750))))

(assert (=> b!752536 (= lt!334756 (select (store (arr!20035 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!752537 () Bool)

(declare-fun Unit!25922 () Unit!25920)

(assert (=> b!752537 (= e!419756 Unit!25922)))

(assert (=> b!752537 false))

(declare-fun b!752538 () Bool)

(declare-fun e!419760 () Bool)

(assert (=> b!752538 (= e!419760 e!419762)))

(declare-fun res!508214 () Bool)

(assert (=> b!752538 (=> res!508214 e!419762)))

(declare-fun lt!334748 () SeekEntryResult!7635)

(declare-fun lt!334754 () SeekEntryResult!7635)

(assert (=> b!752538 (= res!508214 (not (= lt!334748 lt!334754)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41843 (_ BitVec 32)) SeekEntryResult!7635)

(assert (=> b!752538 (= lt!334748 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20035 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!508227 () Bool)

(assert (=> start!65670 (=> (not res!508227) (not e!419765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65670 (= res!508227 (validMask!0 mask!3328))))

(assert (=> start!65670 e!419765))

(assert (=> start!65670 true))

(declare-fun array_inv!15831 (array!41843) Bool)

(assert (=> start!65670 (array_inv!15831 a!3186)))

(declare-fun b!752539 () Bool)

(declare-fun e!419763 () Bool)

(assert (=> b!752539 (= e!419763 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20035 a!3186) j!159) a!3186 mask!3328) lt!334754))))

(declare-fun b!752540 () Bool)

(declare-fun res!508212 () Bool)

(assert (=> b!752540 (=> (not res!508212) (not e!419765))))

(assert (=> b!752540 (= res!508212 (validKeyInArray!0 (select (arr!20035 a!3186) j!159)))))

(declare-fun b!752541 () Bool)

(declare-fun res!508215 () Bool)

(assert (=> b!752541 (=> (not res!508215) (not e!419755))))

(assert (=> b!752541 (= res!508215 e!419764)))

(declare-fun c!82539 () Bool)

(assert (=> b!752541 (= c!82539 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!752542 () Bool)

(declare-fun res!508217 () Bool)

(assert (=> b!752542 (=> (not res!508217) (not e!419754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41843 (_ BitVec 32)) Bool)

(assert (=> b!752542 (= res!508217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!752543 () Bool)

(assert (=> b!752543 (= e!419765 e!419754)))

(declare-fun res!508213 () Bool)

(assert (=> b!752543 (=> (not res!508213) (not e!419754))))

(declare-fun lt!334747 () SeekEntryResult!7635)

(assert (=> b!752543 (= res!508213 (or (= lt!334747 (MissingZero!7635 i!1173)) (= lt!334747 (MissingVacant!7635 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41843 (_ BitVec 32)) SeekEntryResult!7635)

(assert (=> b!752543 (= lt!334747 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!752544 () Bool)

(assert (=> b!752544 (= e!419764 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20035 a!3186) j!159) a!3186 mask!3328) (Found!7635 j!159)))))

(declare-fun b!752545 () Bool)

(declare-fun lt!334751 () SeekEntryResult!7635)

(assert (=> b!752545 (= e!419759 (= lt!334751 lt!334748))))

(declare-fun b!752546 () Bool)

(assert (=> b!752546 (= e!419757 (not e!419760))))

(declare-fun res!508221 () Bool)

(assert (=> b!752546 (=> res!508221 e!419760)))

(get-info :version)

(assert (=> b!752546 (= res!508221 (or (not ((_ is Intermediate!7635) lt!334753)) (bvslt x!1131 (x!63825 lt!334753)) (not (= x!1131 (x!63825 lt!334753))) (not (= index!1321 (index!32910 lt!334753)))))))

(assert (=> b!752546 e!419763))

(declare-fun res!508229 () Bool)

(assert (=> b!752546 (=> (not res!508229) (not e!419763))))

(assert (=> b!752546 (= res!508229 (= lt!334751 lt!334754))))

(assert (=> b!752546 (= lt!334754 (Found!7635 j!159))))

(assert (=> b!752546 (= lt!334751 (seekEntryOrOpen!0 (select (arr!20035 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!752546 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334755 () Unit!25920)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41843 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25920)

(assert (=> b!752546 (= lt!334755 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!752547 () Bool)

(declare-fun res!508220 () Bool)

(assert (=> b!752547 (=> (not res!508220) (not e!419759))))

(assert (=> b!752547 (= res!508220 (= (seekEntryOrOpen!0 lt!334750 lt!334749 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334750 lt!334749 mask!3328)))))

(declare-fun b!752548 () Bool)

(declare-fun res!508228 () Bool)

(assert (=> b!752548 (=> (not res!508228) (not e!419754))))

(declare-datatypes ((List!14037 0))(
  ( (Nil!14034) (Cons!14033 (h!15105 (_ BitVec 64)) (t!20352 List!14037)) )
))
(declare-fun arrayNoDuplicates!0 (array!41843 (_ BitVec 32) List!14037) Bool)

(assert (=> b!752548 (= res!508228 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14034))))

(declare-fun b!752549 () Bool)

(assert (=> b!752549 (= e!419754 e!419755)))

(declare-fun res!508218 () Bool)

(assert (=> b!752549 (=> (not res!508218) (not e!419755))))

(assert (=> b!752549 (= res!508218 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20035 a!3186) j!159) mask!3328) (select (arr!20035 a!3186) j!159) a!3186 mask!3328) lt!334757))))

(assert (=> b!752549 (= lt!334757 (Intermediate!7635 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!752550 () Bool)

(declare-fun Unit!25923 () Unit!25920)

(assert (=> b!752550 (= e!419756 Unit!25923)))

(assert (= (and start!65670 res!508227) b!752534))

(assert (= (and b!752534 res!508222) b!752540))

(assert (= (and b!752540 res!508212) b!752532))

(assert (= (and b!752532 res!508211) b!752530))

(assert (= (and b!752530 res!508226) b!752543))

(assert (= (and b!752543 res!508213) b!752542))

(assert (= (and b!752542 res!508217) b!752548))

(assert (= (and b!752548 res!508228) b!752529))

(assert (= (and b!752529 res!508223) b!752549))

(assert (= (and b!752549 res!508218) b!752531))

(assert (= (and b!752531 res!508216) b!752541))

(assert (= (and b!752541 c!82539) b!752535))

(assert (= (and b!752541 (not c!82539)) b!752544))

(assert (= (and b!752541 res!508215) b!752533))

(assert (= (and b!752533 res!508225) b!752546))

(assert (= (and b!752546 res!508229) b!752539))

(assert (= (and b!752546 (not res!508221)) b!752538))

(assert (= (and b!752538 (not res!508214)) b!752536))

(assert (= (and b!752536 (not res!508224)) b!752528))

(assert (= (and b!752528 c!82540) b!752537))

(assert (= (and b!752528 (not c!82540)) b!752550))

(assert (= (and b!752528 res!508219) b!752547))

(assert (= (and b!752547 res!508220) b!752545))

(declare-fun m!701447 () Bool)

(assert (=> b!752533 m!701447))

(assert (=> b!752533 m!701447))

(declare-fun m!701449 () Bool)

(assert (=> b!752533 m!701449))

(declare-fun m!701451 () Bool)

(assert (=> b!752533 m!701451))

(declare-fun m!701453 () Bool)

(assert (=> b!752533 m!701453))

(declare-fun m!701455 () Bool)

(assert (=> b!752533 m!701455))

(declare-fun m!701457 () Bool)

(assert (=> b!752547 m!701457))

(declare-fun m!701459 () Bool)

(assert (=> b!752547 m!701459))

(assert (=> b!752536 m!701451))

(declare-fun m!701461 () Bool)

(assert (=> b!752536 m!701461))

(declare-fun m!701463 () Bool)

(assert (=> b!752542 m!701463))

(declare-fun m!701465 () Bool)

(assert (=> b!752530 m!701465))

(declare-fun m!701467 () Bool)

(assert (=> b!752543 m!701467))

(declare-fun m!701469 () Bool)

(assert (=> b!752540 m!701469))

(assert (=> b!752540 m!701469))

(declare-fun m!701471 () Bool)

(assert (=> b!752540 m!701471))

(assert (=> b!752539 m!701469))

(assert (=> b!752539 m!701469))

(declare-fun m!701473 () Bool)

(assert (=> b!752539 m!701473))

(assert (=> b!752538 m!701469))

(assert (=> b!752538 m!701469))

(declare-fun m!701475 () Bool)

(assert (=> b!752538 m!701475))

(assert (=> b!752535 m!701469))

(assert (=> b!752535 m!701469))

(declare-fun m!701477 () Bool)

(assert (=> b!752535 m!701477))

(assert (=> b!752549 m!701469))

(assert (=> b!752549 m!701469))

(declare-fun m!701479 () Bool)

(assert (=> b!752549 m!701479))

(assert (=> b!752549 m!701479))

(assert (=> b!752549 m!701469))

(declare-fun m!701481 () Bool)

(assert (=> b!752549 m!701481))

(assert (=> b!752544 m!701469))

(assert (=> b!752544 m!701469))

(assert (=> b!752544 m!701475))

(declare-fun m!701483 () Bool)

(assert (=> b!752531 m!701483))

(declare-fun m!701485 () Bool)

(assert (=> b!752532 m!701485))

(assert (=> b!752546 m!701469))

(assert (=> b!752546 m!701469))

(declare-fun m!701487 () Bool)

(assert (=> b!752546 m!701487))

(declare-fun m!701489 () Bool)

(assert (=> b!752546 m!701489))

(declare-fun m!701491 () Bool)

(assert (=> b!752546 m!701491))

(declare-fun m!701493 () Bool)

(assert (=> start!65670 m!701493))

(declare-fun m!701495 () Bool)

(assert (=> start!65670 m!701495))

(declare-fun m!701497 () Bool)

(assert (=> b!752548 m!701497))

(check-sat (not b!752535) (not b!752540) (not b!752543) (not b!752547) (not b!752532) (not b!752538) (not b!752544) (not b!752539) (not b!752542) (not b!752548) (not b!752546) (not b!752533) (not start!65670) (not b!752549) (not b!752530))
(check-sat)
