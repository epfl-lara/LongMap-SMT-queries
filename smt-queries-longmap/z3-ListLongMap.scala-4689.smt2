; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65322 () Bool)

(assert start!65322)

(declare-datatypes ((SeekEntryResult!7348 0))(
  ( (MissingZero!7348 (index!31760 (_ BitVec 32))) (Found!7348 (index!31761 (_ BitVec 32))) (Intermediate!7348 (undefined!8160 Bool) (index!31762 (_ BitVec 32)) (x!62918 (_ BitVec 32))) (Undefined!7348) (MissingVacant!7348 (index!31763 (_ BitVec 32))) )
))
(declare-fun lt!327694 () SeekEntryResult!7348)

(declare-datatypes ((array!41365 0))(
  ( (array!41366 (arr!19792 (Array (_ BitVec 32) (_ BitVec 64))) (size!20212 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41365)

(declare-fun b!738509 () Bool)

(declare-fun lt!327685 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!413122 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41365 (_ BitVec 32)) SeekEntryResult!7348)

(assert (=> b!738509 (= e!413122 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327685 (select (arr!19792 a!3186) j!159) a!3186 mask!3328) lt!327694)))))

(declare-fun b!738510 () Bool)

(declare-fun res!496238 () Bool)

(declare-fun e!413116 () Bool)

(assert (=> b!738510 (=> (not res!496238) (not e!413116))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!738510 (= res!496238 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20212 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20212 a!3186))))))

(declare-fun b!738511 () Bool)

(declare-fun res!496231 () Bool)

(declare-fun e!413113 () Bool)

(assert (=> b!738511 (=> (not res!496231) (not e!413113))))

(declare-fun e!413123 () Bool)

(assert (=> b!738511 (= res!496231 e!413123)))

(declare-fun c!81527 () Bool)

(assert (=> b!738511 (= c!81527 (bvsle x!1131 resIntermediateX!5))))

(declare-fun e!413115 () Bool)

(declare-fun b!738512 () Bool)

(declare-fun lt!327686 () SeekEntryResult!7348)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41365 (_ BitVec 32)) SeekEntryResult!7348)

(assert (=> b!738512 (= e!413115 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19792 a!3186) j!159) a!3186 mask!3328) lt!327686))))

(declare-fun b!738513 () Bool)

(declare-fun res!496239 () Bool)

(declare-fun e!413121 () Bool)

(assert (=> b!738513 (=> (not res!496239) (not e!413121))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41365 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!738513 (= res!496239 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!738514 () Bool)

(declare-fun e!413124 () Bool)

(assert (=> b!738514 (= e!413124 e!413115)))

(declare-fun res!496227 () Bool)

(assert (=> b!738514 (=> (not res!496227) (not e!413115))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41365 (_ BitVec 32)) SeekEntryResult!7348)

(assert (=> b!738514 (= res!496227 (= (seekEntryOrOpen!0 (select (arr!19792 a!3186) j!159) a!3186 mask!3328) lt!327686))))

(assert (=> b!738514 (= lt!327686 (Found!7348 j!159))))

(declare-fun res!496242 () Bool)

(assert (=> start!65322 (=> (not res!496242) (not e!413121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65322 (= res!496242 (validMask!0 mask!3328))))

(assert (=> start!65322 e!413121))

(assert (=> start!65322 true))

(declare-fun array_inv!15651 (array!41365) Bool)

(assert (=> start!65322 (array_inv!15651 a!3186)))

(declare-fun b!738515 () Bool)

(assert (=> b!738515 (= e!413123 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19792 a!3186) j!159) a!3186 mask!3328) (Found!7348 j!159)))))

(declare-fun b!738516 () Bool)

(declare-fun lt!327693 () SeekEntryResult!7348)

(assert (=> b!738516 (= e!413122 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327685 resIntermediateIndex!5 (select (arr!19792 a!3186) j!159) a!3186 mask!3328) lt!327693)))))

(declare-fun b!738517 () Bool)

(assert (=> b!738517 (= e!413121 e!413116)))

(declare-fun res!496234 () Bool)

(assert (=> b!738517 (=> (not res!496234) (not e!413116))))

(declare-fun lt!327695 () SeekEntryResult!7348)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!738517 (= res!496234 (or (= lt!327695 (MissingZero!7348 i!1173)) (= lt!327695 (MissingVacant!7348 i!1173))))))

(assert (=> b!738517 (= lt!327695 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!738518 () Bool)

(assert (=> b!738518 (= e!413123 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19792 a!3186) j!159) a!3186 mask!3328) lt!327694))))

(declare-fun b!738519 () Bool)

(declare-fun res!496226 () Bool)

(assert (=> b!738519 (=> (not res!496226) (not e!413121))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!738519 (= res!496226 (validKeyInArray!0 (select (arr!19792 a!3186) j!159)))))

(declare-fun b!738520 () Bool)

(declare-fun res!496241 () Bool)

(assert (=> b!738520 (=> (not res!496241) (not e!413113))))

(assert (=> b!738520 (= res!496241 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19792 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!738521 () Bool)

(declare-fun res!496232 () Bool)

(assert (=> b!738521 (=> (not res!496232) (not e!413116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41365 (_ BitVec 32)) Bool)

(assert (=> b!738521 (= res!496232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!738522 () Bool)

(declare-fun res!496236 () Bool)

(declare-fun e!413114 () Bool)

(assert (=> b!738522 (=> res!496236 e!413114)))

(assert (=> b!738522 (= res!496236 e!413122)))

(declare-fun c!81526 () Bool)

(declare-fun lt!327684 () Bool)

(assert (=> b!738522 (= c!81526 lt!327684)))

(declare-fun b!738523 () Bool)

(assert (=> b!738523 (= e!413114 true)))

(declare-fun lt!327692 () (_ BitVec 64))

(declare-fun lt!327688 () SeekEntryResult!7348)

(declare-fun lt!327683 () array!41365)

(assert (=> b!738523 (= lt!327688 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327685 lt!327692 lt!327683 mask!3328))))

(declare-fun b!738524 () Bool)

(declare-datatypes ((Unit!25165 0))(
  ( (Unit!25166) )
))
(declare-fun e!413119 () Unit!25165)

(declare-fun Unit!25167 () Unit!25165)

(assert (=> b!738524 (= e!413119 Unit!25167)))

(assert (=> b!738524 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327685 (select (arr!19792 a!3186) j!159) a!3186 mask!3328) lt!327694)))

(declare-fun b!738525 () Bool)

(declare-fun res!496235 () Bool)

(assert (=> b!738525 (=> (not res!496235) (not e!413121))))

(assert (=> b!738525 (= res!496235 (and (= (size!20212 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20212 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20212 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!738526 () Bool)

(declare-fun e!413118 () Bool)

(assert (=> b!738526 (= e!413113 e!413118)))

(declare-fun res!496240 () Bool)

(assert (=> b!738526 (=> (not res!496240) (not e!413118))))

(declare-fun lt!327690 () SeekEntryResult!7348)

(declare-fun lt!327691 () SeekEntryResult!7348)

(assert (=> b!738526 (= res!496240 (= lt!327690 lt!327691))))

(assert (=> b!738526 (= lt!327691 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327692 lt!327683 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738526 (= lt!327690 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327692 mask!3328) lt!327692 lt!327683 mask!3328))))

(assert (=> b!738526 (= lt!327692 (select (store (arr!19792 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!738526 (= lt!327683 (array!41366 (store (arr!19792 a!3186) i!1173 k0!2102) (size!20212 a!3186)))))

(declare-fun b!738527 () Bool)

(declare-fun e!413117 () Bool)

(assert (=> b!738527 (= e!413117 e!413114)))

(declare-fun res!496230 () Bool)

(assert (=> b!738527 (=> res!496230 e!413114)))

(assert (=> b!738527 (= res!496230 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327685 #b00000000000000000000000000000000) (bvsge lt!327685 (size!20212 a!3186))))))

(declare-fun lt!327696 () Unit!25165)

(assert (=> b!738527 (= lt!327696 e!413119)))

(declare-fun c!81525 () Bool)

(assert (=> b!738527 (= c!81525 lt!327684)))

(assert (=> b!738527 (= lt!327684 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738527 (= lt!327685 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!738528 () Bool)

(declare-fun res!496243 () Bool)

(assert (=> b!738528 (=> (not res!496243) (not e!413116))))

(declare-datatypes ((List!13701 0))(
  ( (Nil!13698) (Cons!13697 (h!14775 (_ BitVec 64)) (t!20008 List!13701)) )
))
(declare-fun arrayNoDuplicates!0 (array!41365 (_ BitVec 32) List!13701) Bool)

(assert (=> b!738528 (= res!496243 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13698))))

(declare-fun b!738529 () Bool)

(assert (=> b!738529 (= e!413116 e!413113)))

(declare-fun res!496228 () Bool)

(assert (=> b!738529 (=> (not res!496228) (not e!413113))))

(assert (=> b!738529 (= res!496228 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19792 a!3186) j!159) mask!3328) (select (arr!19792 a!3186) j!159) a!3186 mask!3328) lt!327694))))

(assert (=> b!738529 (= lt!327694 (Intermediate!7348 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!738530 () Bool)

(declare-fun Unit!25168 () Unit!25165)

(assert (=> b!738530 (= e!413119 Unit!25168)))

(declare-fun lt!327689 () SeekEntryResult!7348)

(assert (=> b!738530 (= lt!327689 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19792 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!738530 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327685 resIntermediateIndex!5 (select (arr!19792 a!3186) j!159) a!3186 mask!3328) lt!327693)))

(declare-fun b!738531 () Bool)

(declare-fun res!496229 () Bool)

(assert (=> b!738531 (=> (not res!496229) (not e!413121))))

(assert (=> b!738531 (= res!496229 (validKeyInArray!0 k0!2102))))

(declare-fun b!738532 () Bool)

(assert (=> b!738532 (= e!413118 (not e!413117))))

(declare-fun res!496237 () Bool)

(assert (=> b!738532 (=> res!496237 e!413117)))

(get-info :version)

(assert (=> b!738532 (= res!496237 (or (not ((_ is Intermediate!7348) lt!327691)) (bvsge x!1131 (x!62918 lt!327691))))))

(assert (=> b!738532 (= lt!327693 (Found!7348 j!159))))

(assert (=> b!738532 e!413124))

(declare-fun res!496233 () Bool)

(assert (=> b!738532 (=> (not res!496233) (not e!413124))))

(assert (=> b!738532 (= res!496233 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!327687 () Unit!25165)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41365 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25165)

(assert (=> b!738532 (= lt!327687 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65322 res!496242) b!738525))

(assert (= (and b!738525 res!496235) b!738519))

(assert (= (and b!738519 res!496226) b!738531))

(assert (= (and b!738531 res!496229) b!738513))

(assert (= (and b!738513 res!496239) b!738517))

(assert (= (and b!738517 res!496234) b!738521))

(assert (= (and b!738521 res!496232) b!738528))

(assert (= (and b!738528 res!496243) b!738510))

(assert (= (and b!738510 res!496238) b!738529))

(assert (= (and b!738529 res!496228) b!738520))

(assert (= (and b!738520 res!496241) b!738511))

(assert (= (and b!738511 c!81527) b!738518))

(assert (= (and b!738511 (not c!81527)) b!738515))

(assert (= (and b!738511 res!496231) b!738526))

(assert (= (and b!738526 res!496240) b!738532))

(assert (= (and b!738532 res!496233) b!738514))

(assert (= (and b!738514 res!496227) b!738512))

(assert (= (and b!738532 (not res!496237)) b!738527))

(assert (= (and b!738527 c!81525) b!738524))

(assert (= (and b!738527 (not c!81525)) b!738530))

(assert (= (and b!738527 (not res!496230)) b!738522))

(assert (= (and b!738522 c!81526) b!738509))

(assert (= (and b!738522 (not c!81526)) b!738516))

(assert (= (and b!738522 (not res!496236)) b!738523))

(declare-fun m!690723 () Bool)

(assert (=> b!738528 m!690723))

(declare-fun m!690725 () Bool)

(assert (=> b!738512 m!690725))

(assert (=> b!738512 m!690725))

(declare-fun m!690727 () Bool)

(assert (=> b!738512 m!690727))

(declare-fun m!690729 () Bool)

(assert (=> b!738521 m!690729))

(declare-fun m!690731 () Bool)

(assert (=> b!738520 m!690731))

(declare-fun m!690733 () Bool)

(assert (=> start!65322 m!690733))

(declare-fun m!690735 () Bool)

(assert (=> start!65322 m!690735))

(declare-fun m!690737 () Bool)

(assert (=> b!738517 m!690737))

(declare-fun m!690739 () Bool)

(assert (=> b!738532 m!690739))

(declare-fun m!690741 () Bool)

(assert (=> b!738532 m!690741))

(assert (=> b!738515 m!690725))

(assert (=> b!738515 m!690725))

(declare-fun m!690743 () Bool)

(assert (=> b!738515 m!690743))

(declare-fun m!690745 () Bool)

(assert (=> b!738513 m!690745))

(assert (=> b!738516 m!690725))

(assert (=> b!738516 m!690725))

(declare-fun m!690747 () Bool)

(assert (=> b!738516 m!690747))

(declare-fun m!690749 () Bool)

(assert (=> b!738531 m!690749))

(assert (=> b!738529 m!690725))

(assert (=> b!738529 m!690725))

(declare-fun m!690751 () Bool)

(assert (=> b!738529 m!690751))

(assert (=> b!738529 m!690751))

(assert (=> b!738529 m!690725))

(declare-fun m!690753 () Bool)

(assert (=> b!738529 m!690753))

(assert (=> b!738524 m!690725))

(assert (=> b!738524 m!690725))

(declare-fun m!690755 () Bool)

(assert (=> b!738524 m!690755))

(assert (=> b!738509 m!690725))

(assert (=> b!738509 m!690725))

(assert (=> b!738509 m!690755))

(assert (=> b!738530 m!690725))

(assert (=> b!738530 m!690725))

(assert (=> b!738530 m!690743))

(assert (=> b!738530 m!690725))

(assert (=> b!738530 m!690747))

(assert (=> b!738519 m!690725))

(assert (=> b!738519 m!690725))

(declare-fun m!690757 () Bool)

(assert (=> b!738519 m!690757))

(assert (=> b!738514 m!690725))

(assert (=> b!738514 m!690725))

(declare-fun m!690759 () Bool)

(assert (=> b!738514 m!690759))

(declare-fun m!690761 () Bool)

(assert (=> b!738527 m!690761))

(declare-fun m!690763 () Bool)

(assert (=> b!738523 m!690763))

(assert (=> b!738518 m!690725))

(assert (=> b!738518 m!690725))

(declare-fun m!690765 () Bool)

(assert (=> b!738518 m!690765))

(declare-fun m!690767 () Bool)

(assert (=> b!738526 m!690767))

(declare-fun m!690769 () Bool)

(assert (=> b!738526 m!690769))

(declare-fun m!690771 () Bool)

(assert (=> b!738526 m!690771))

(assert (=> b!738526 m!690767))

(declare-fun m!690773 () Bool)

(assert (=> b!738526 m!690773))

(declare-fun m!690775 () Bool)

(assert (=> b!738526 m!690775))

(check-sat (not b!738530) (not b!738513) (not b!738514) (not b!738518) (not b!738512) (not b!738523) (not b!738529) (not b!738517) (not b!738521) (not b!738524) (not b!738516) (not b!738519) (not start!65322) (not b!738526) (not b!738531) (not b!738515) (not b!738532) (not b!738509) (not b!738527) (not b!738528))
(check-sat)
