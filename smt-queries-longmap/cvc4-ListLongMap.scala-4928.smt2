; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67882 () Bool)

(assert start!67882)

(declare-fun b!789317 () Bool)

(declare-fun e!438714 () Bool)

(declare-datatypes ((SeekEntryResult!8116 0))(
  ( (MissingZero!8116 (index!34832 (_ BitVec 32))) (Found!8116 (index!34833 (_ BitVec 32))) (Intermediate!8116 (undefined!8928 Bool) (index!34834 (_ BitVec 32)) (x!65769 (_ BitVec 32))) (Undefined!8116) (MissingVacant!8116 (index!34835 (_ BitVec 32))) )
))
(declare-fun lt!352177 () SeekEntryResult!8116)

(declare-fun lt!352175 () SeekEntryResult!8116)

(assert (=> b!789317 (= e!438714 (= lt!352177 lt!352175))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42859 0))(
  ( (array!42860 (arr!20516 (Array (_ BitVec 32) (_ BitVec 64))) (size!20937 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42859)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!789318 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!438722 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42859 (_ BitVec 32)) SeekEntryResult!8116)

(assert (=> b!789318 (= e!438722 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20516 a!3186) j!159) a!3186 mask!3328) (Found!8116 j!159)))))

(declare-fun lt!352176 () SeekEntryResult!8116)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!789319 () Bool)

(declare-fun e!438713 () Bool)

(assert (=> b!789319 (= e!438713 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20516 a!3186) j!159) a!3186 mask!3328) lt!352176))))

(declare-fun b!789320 () Bool)

(declare-fun res!534620 () Bool)

(declare-fun e!438719 () Bool)

(assert (=> b!789320 (=> (not res!534620) (not e!438719))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!789320 (= res!534620 (validKeyInArray!0 k!2102))))

(declare-fun b!789321 () Bool)

(declare-fun res!534617 () Bool)

(declare-fun e!438718 () Bool)

(assert (=> b!789321 (=> (not res!534617) (not e!438718))))

(declare-datatypes ((List!14518 0))(
  ( (Nil!14515) (Cons!14514 (h!15640 (_ BitVec 64)) (t!20833 List!14518)) )
))
(declare-fun arrayNoDuplicates!0 (array!42859 (_ BitVec 32) List!14518) Bool)

(assert (=> b!789321 (= res!534617 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14515))))

(declare-fun b!789322 () Bool)

(declare-fun res!534628 () Bool)

(assert (=> b!789322 (=> (not res!534628) (not e!438719))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!789322 (= res!534628 (and (= (size!20937 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20937 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20937 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!789323 () Bool)

(declare-fun e!438717 () Bool)

(declare-fun e!438721 () Bool)

(assert (=> b!789323 (= e!438717 e!438721)))

(declare-fun res!534632 () Bool)

(assert (=> b!789323 (=> res!534632 e!438721)))

(assert (=> b!789323 (= res!534632 (not (= lt!352175 lt!352176)))))

(assert (=> b!789323 (= lt!352175 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20516 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!789324 () Bool)

(declare-fun res!534626 () Bool)

(assert (=> b!789324 (=> (not res!534626) (not e!438719))))

(assert (=> b!789324 (= res!534626 (validKeyInArray!0 (select (arr!20516 a!3186) j!159)))))

(declare-fun b!789325 () Bool)

(declare-fun res!534633 () Bool)

(declare-fun e!438711 () Bool)

(assert (=> b!789325 (=> (not res!534633) (not e!438711))))

(assert (=> b!789325 (= res!534633 e!438722)))

(declare-fun c!87759 () Bool)

(assert (=> b!789325 (= c!87759 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!789326 () Bool)

(declare-fun res!534621 () Bool)

(assert (=> b!789326 (=> (not res!534621) (not e!438711))))

(assert (=> b!789326 (= res!534621 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20516 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!789328 () Bool)

(declare-fun e!438720 () Bool)

(assert (=> b!789328 (= e!438721 e!438720)))

(declare-fun res!534631 () Bool)

(assert (=> b!789328 (=> res!534631 e!438720)))

(declare-fun lt!352173 () (_ BitVec 64))

(declare-fun lt!352180 () (_ BitVec 64))

(assert (=> b!789328 (= res!534631 (= lt!352173 lt!352180))))

(assert (=> b!789328 (= lt!352173 (select (store (arr!20516 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!789329 () Bool)

(declare-fun e!438716 () Bool)

(assert (=> b!789329 (= e!438711 e!438716)))

(declare-fun res!534622 () Bool)

(assert (=> b!789329 (=> (not res!534622) (not e!438716))))

(declare-fun lt!352184 () SeekEntryResult!8116)

(declare-fun lt!352174 () SeekEntryResult!8116)

(assert (=> b!789329 (= res!534622 (= lt!352184 lt!352174))))

(declare-fun lt!352182 () array!42859)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42859 (_ BitVec 32)) SeekEntryResult!8116)

(assert (=> b!789329 (= lt!352174 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352180 lt!352182 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!789329 (= lt!352184 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352180 mask!3328) lt!352180 lt!352182 mask!3328))))

(assert (=> b!789329 (= lt!352180 (select (store (arr!20516 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!789329 (= lt!352182 (array!42860 (store (arr!20516 a!3186) i!1173 k!2102) (size!20937 a!3186)))))

(declare-fun b!789330 () Bool)

(assert (=> b!789330 (= e!438719 e!438718)))

(declare-fun res!534629 () Bool)

(assert (=> b!789330 (=> (not res!534629) (not e!438718))))

(declare-fun lt!352183 () SeekEntryResult!8116)

(assert (=> b!789330 (= res!534629 (or (= lt!352183 (MissingZero!8116 i!1173)) (= lt!352183 (MissingVacant!8116 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42859 (_ BitVec 32)) SeekEntryResult!8116)

(assert (=> b!789330 (= lt!352183 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!789331 () Bool)

(declare-fun res!534618 () Bool)

(assert (=> b!789331 (=> (not res!534618) (not e!438718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42859 (_ BitVec 32)) Bool)

(assert (=> b!789331 (= res!534618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun lt!352178 () SeekEntryResult!8116)

(declare-fun b!789332 () Bool)

(assert (=> b!789332 (= e!438722 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20516 a!3186) j!159) a!3186 mask!3328) lt!352178))))

(declare-fun b!789333 () Bool)

(declare-fun res!534634 () Bool)

(assert (=> b!789333 (=> (not res!534634) (not e!438714))))

(assert (=> b!789333 (= res!534634 (= (seekEntryOrOpen!0 lt!352180 lt!352182 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352180 lt!352182 mask!3328)))))

(declare-fun b!789334 () Bool)

(assert (=> b!789334 (= e!438718 e!438711)))

(declare-fun res!534635 () Bool)

(assert (=> b!789334 (=> (not res!534635) (not e!438711))))

(assert (=> b!789334 (= res!534635 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20516 a!3186) j!159) mask!3328) (select (arr!20516 a!3186) j!159) a!3186 mask!3328) lt!352178))))

(assert (=> b!789334 (= lt!352178 (Intermediate!8116 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!789335 () Bool)

(declare-datatypes ((Unit!27352 0))(
  ( (Unit!27353) )
))
(declare-fun e!438715 () Unit!27352)

(declare-fun Unit!27354 () Unit!27352)

(assert (=> b!789335 (= e!438715 Unit!27354)))

(declare-fun b!789336 () Bool)

(declare-fun res!534627 () Bool)

(assert (=> b!789336 (=> (not res!534627) (not e!438719))))

(declare-fun arrayContainsKey!0 (array!42859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!789336 (= res!534627 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!789337 () Bool)

(declare-fun res!534623 () Bool)

(assert (=> b!789337 (=> (not res!534623) (not e!438718))))

(assert (=> b!789337 (= res!534623 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20937 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20937 a!3186))))))

(declare-fun b!789327 () Bool)

(assert (=> b!789327 (= e!438716 (not e!438717))))

(declare-fun res!534630 () Bool)

(assert (=> b!789327 (=> res!534630 e!438717)))

(assert (=> b!789327 (= res!534630 (or (not (is-Intermediate!8116 lt!352174)) (bvslt x!1131 (x!65769 lt!352174)) (not (= x!1131 (x!65769 lt!352174))) (not (= index!1321 (index!34834 lt!352174)))))))

(assert (=> b!789327 e!438713))

(declare-fun res!534625 () Bool)

(assert (=> b!789327 (=> (not res!534625) (not e!438713))))

(assert (=> b!789327 (= res!534625 (= lt!352177 lt!352176))))

(assert (=> b!789327 (= lt!352176 (Found!8116 j!159))))

(assert (=> b!789327 (= lt!352177 (seekEntryOrOpen!0 (select (arr!20516 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!789327 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352179 () Unit!27352)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42859 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27352)

(assert (=> b!789327 (= lt!352179 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!534624 () Bool)

(assert (=> start!67882 (=> (not res!534624) (not e!438719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67882 (= res!534624 (validMask!0 mask!3328))))

(assert (=> start!67882 e!438719))

(assert (=> start!67882 true))

(declare-fun array_inv!16312 (array!42859) Bool)

(assert (=> start!67882 (array_inv!16312 a!3186)))

(declare-fun b!789338 () Bool)

(assert (=> b!789338 (= e!438720 true)))

(assert (=> b!789338 e!438714))

(declare-fun res!534619 () Bool)

(assert (=> b!789338 (=> (not res!534619) (not e!438714))))

(assert (=> b!789338 (= res!534619 (= lt!352173 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!352181 () Unit!27352)

(assert (=> b!789338 (= lt!352181 e!438715)))

(declare-fun c!87760 () Bool)

(assert (=> b!789338 (= c!87760 (= lt!352173 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!789339 () Bool)

(declare-fun Unit!27355 () Unit!27352)

(assert (=> b!789339 (= e!438715 Unit!27355)))

(assert (=> b!789339 false))

(assert (= (and start!67882 res!534624) b!789322))

(assert (= (and b!789322 res!534628) b!789324))

(assert (= (and b!789324 res!534626) b!789320))

(assert (= (and b!789320 res!534620) b!789336))

(assert (= (and b!789336 res!534627) b!789330))

(assert (= (and b!789330 res!534629) b!789331))

(assert (= (and b!789331 res!534618) b!789321))

(assert (= (and b!789321 res!534617) b!789337))

(assert (= (and b!789337 res!534623) b!789334))

(assert (= (and b!789334 res!534635) b!789326))

(assert (= (and b!789326 res!534621) b!789325))

(assert (= (and b!789325 c!87759) b!789332))

(assert (= (and b!789325 (not c!87759)) b!789318))

(assert (= (and b!789325 res!534633) b!789329))

(assert (= (and b!789329 res!534622) b!789327))

(assert (= (and b!789327 res!534625) b!789319))

(assert (= (and b!789327 (not res!534630)) b!789323))

(assert (= (and b!789323 (not res!534632)) b!789328))

(assert (= (and b!789328 (not res!534631)) b!789338))

(assert (= (and b!789338 c!87760) b!789339))

(assert (= (and b!789338 (not c!87760)) b!789335))

(assert (= (and b!789338 res!534619) b!789333))

(assert (= (and b!789333 res!534634) b!789317))

(declare-fun m!730429 () Bool)

(assert (=> b!789327 m!730429))

(assert (=> b!789327 m!730429))

(declare-fun m!730431 () Bool)

(assert (=> b!789327 m!730431))

(declare-fun m!730433 () Bool)

(assert (=> b!789327 m!730433))

(declare-fun m!730435 () Bool)

(assert (=> b!789327 m!730435))

(assert (=> b!789319 m!730429))

(assert (=> b!789319 m!730429))

(declare-fun m!730437 () Bool)

(assert (=> b!789319 m!730437))

(declare-fun m!730439 () Bool)

(assert (=> b!789321 m!730439))

(declare-fun m!730441 () Bool)

(assert (=> b!789326 m!730441))

(declare-fun m!730443 () Bool)

(assert (=> b!789330 m!730443))

(assert (=> b!789318 m!730429))

(assert (=> b!789318 m!730429))

(declare-fun m!730445 () Bool)

(assert (=> b!789318 m!730445))

(assert (=> b!789323 m!730429))

(assert (=> b!789323 m!730429))

(assert (=> b!789323 m!730445))

(assert (=> b!789332 m!730429))

(assert (=> b!789332 m!730429))

(declare-fun m!730447 () Bool)

(assert (=> b!789332 m!730447))

(declare-fun m!730449 () Bool)

(assert (=> start!67882 m!730449))

(declare-fun m!730451 () Bool)

(assert (=> start!67882 m!730451))

(declare-fun m!730453 () Bool)

(assert (=> b!789331 m!730453))

(assert (=> b!789324 m!730429))

(assert (=> b!789324 m!730429))

(declare-fun m!730455 () Bool)

(assert (=> b!789324 m!730455))

(declare-fun m!730457 () Bool)

(assert (=> b!789336 m!730457))

(assert (=> b!789334 m!730429))

(assert (=> b!789334 m!730429))

(declare-fun m!730459 () Bool)

(assert (=> b!789334 m!730459))

(assert (=> b!789334 m!730459))

(assert (=> b!789334 m!730429))

(declare-fun m!730461 () Bool)

(assert (=> b!789334 m!730461))

(declare-fun m!730463 () Bool)

(assert (=> b!789320 m!730463))

(declare-fun m!730465 () Bool)

(assert (=> b!789328 m!730465))

(declare-fun m!730467 () Bool)

(assert (=> b!789328 m!730467))

(declare-fun m!730469 () Bool)

(assert (=> b!789329 m!730469))

(declare-fun m!730471 () Bool)

(assert (=> b!789329 m!730471))

(assert (=> b!789329 m!730469))

(assert (=> b!789329 m!730465))

(declare-fun m!730473 () Bool)

(assert (=> b!789329 m!730473))

(declare-fun m!730475 () Bool)

(assert (=> b!789329 m!730475))

(declare-fun m!730477 () Bool)

(assert (=> b!789333 m!730477))

(declare-fun m!730479 () Bool)

(assert (=> b!789333 m!730479))

(push 1)

