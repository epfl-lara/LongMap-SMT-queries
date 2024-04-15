; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67850 () Bool)

(assert start!67850)

(declare-fun b!788722 () Bool)

(declare-fun res!534232 () Bool)

(declare-fun e!438385 () Bool)

(assert (=> b!788722 (=> (not res!534232) (not e!438385))))

(declare-fun lt!351758 () (_ BitVec 64))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!42846 0))(
  ( (array!42847 (arr!20510 (Array (_ BitVec 32) (_ BitVec 64))) (size!20931 (_ BitVec 32))) )
))
(declare-fun lt!351759 () array!42846)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8107 0))(
  ( (MissingZero!8107 (index!34796 (_ BitVec 32))) (Found!8107 (index!34797 (_ BitVec 32))) (Intermediate!8107 (undefined!8919 Bool) (index!34798 (_ BitVec 32)) (x!65747 (_ BitVec 32))) (Undefined!8107) (MissingVacant!8107 (index!34799 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42846 (_ BitVec 32)) SeekEntryResult!8107)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42846 (_ BitVec 32)) SeekEntryResult!8107)

(assert (=> b!788722 (= res!534232 (= (seekEntryOrOpen!0 lt!351758 lt!351759 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351758 lt!351759 mask!3328)))))

(declare-fun res!534223 () Bool)

(declare-fun e!438383 () Bool)

(assert (=> start!67850 (=> (not res!534223) (not e!438383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67850 (= res!534223 (validMask!0 mask!3328))))

(assert (=> start!67850 e!438383))

(assert (=> start!67850 true))

(declare-fun a!3186 () array!42846)

(declare-fun array_inv!16393 (array!42846) Bool)

(assert (=> start!67850 (array_inv!16393 a!3186)))

(declare-fun b!788723 () Bool)

(declare-fun res!534240 () Bool)

(assert (=> b!788723 (=> (not res!534240) (not e!438383))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!788723 (= res!534240 (validKeyInArray!0 k0!2102))))

(declare-fun b!788724 () Bool)

(declare-fun e!438379 () Bool)

(declare-fun e!438386 () Bool)

(assert (=> b!788724 (= e!438379 e!438386)))

(declare-fun res!534227 () Bool)

(assert (=> b!788724 (=> res!534227 e!438386)))

(declare-fun lt!351761 () (_ BitVec 64))

(assert (=> b!788724 (= res!534227 (= lt!351761 lt!351758))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!788724 (= lt!351761 (select (store (arr!20510 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!788725 () Bool)

(declare-datatypes ((Unit!27296 0))(
  ( (Unit!27297) )
))
(declare-fun e!438377 () Unit!27296)

(declare-fun Unit!27298 () Unit!27296)

(assert (=> b!788725 (= e!438377 Unit!27298)))

(assert (=> b!788725 false))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!788726 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!351753 () SeekEntryResult!8107)

(declare-fun e!438388 () Bool)

(assert (=> b!788726 (= e!438388 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20510 a!3186) j!159) a!3186 mask!3328) lt!351753))))

(declare-fun b!788727 () Bool)

(declare-fun res!534237 () Bool)

(declare-fun e!438380 () Bool)

(assert (=> b!788727 (=> (not res!534237) (not e!438380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42846 (_ BitVec 32)) Bool)

(assert (=> b!788727 (= res!534237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!788728 () Bool)

(declare-fun res!534229 () Bool)

(assert (=> b!788728 (=> (not res!534229) (not e!438380))))

(declare-datatypes ((List!14551 0))(
  ( (Nil!14548) (Cons!14547 (h!15673 (_ BitVec 64)) (t!20857 List!14551)) )
))
(declare-fun arrayNoDuplicates!0 (array!42846 (_ BitVec 32) List!14551) Bool)

(assert (=> b!788728 (= res!534229 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14548))))

(declare-fun b!788729 () Bool)

(declare-fun Unit!27299 () Unit!27296)

(assert (=> b!788729 (= e!438377 Unit!27299)))

(declare-fun b!788730 () Bool)

(declare-fun res!534238 () Bool)

(assert (=> b!788730 (=> (not res!534238) (not e!438383))))

(assert (=> b!788730 (= res!534238 (and (= (size!20931 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20931 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20931 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!788731 () Bool)

(declare-fun res!534225 () Bool)

(declare-fun e!438382 () Bool)

(assert (=> b!788731 (=> (not res!534225) (not e!438382))))

(assert (=> b!788731 (= res!534225 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20510 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788732 () Bool)

(declare-fun e!438378 () Bool)

(assert (=> b!788732 (= e!438382 e!438378)))

(declare-fun res!534236 () Bool)

(assert (=> b!788732 (=> (not res!534236) (not e!438378))))

(declare-fun lt!351760 () SeekEntryResult!8107)

(declare-fun lt!351762 () SeekEntryResult!8107)

(assert (=> b!788732 (= res!534236 (= lt!351760 lt!351762))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42846 (_ BitVec 32)) SeekEntryResult!8107)

(assert (=> b!788732 (= lt!351762 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351758 lt!351759 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!788732 (= lt!351760 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351758 mask!3328) lt!351758 lt!351759 mask!3328))))

(assert (=> b!788732 (= lt!351758 (select (store (arr!20510 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!788732 (= lt!351759 (array!42847 (store (arr!20510 a!3186) i!1173 k0!2102) (size!20931 a!3186)))))

(declare-fun b!788733 () Bool)

(declare-fun e!438381 () Bool)

(assert (=> b!788733 (= e!438381 e!438379)))

(declare-fun res!534234 () Bool)

(assert (=> b!788733 (=> res!534234 e!438379)))

(declare-fun lt!351756 () SeekEntryResult!8107)

(assert (=> b!788733 (= res!534234 (not (= lt!351756 lt!351753)))))

(assert (=> b!788733 (= lt!351756 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20510 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788734 () Bool)

(declare-fun res!534228 () Bool)

(assert (=> b!788734 (=> (not res!534228) (not e!438382))))

(declare-fun e!438384 () Bool)

(assert (=> b!788734 (= res!534228 e!438384)))

(declare-fun c!87659 () Bool)

(assert (=> b!788734 (= c!87659 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!788735 () Bool)

(assert (=> b!788735 (= e!438378 (not e!438381))))

(declare-fun res!534226 () Bool)

(assert (=> b!788735 (=> res!534226 e!438381)))

(get-info :version)

(assert (=> b!788735 (= res!534226 (or (not ((_ is Intermediate!8107) lt!351762)) (bvslt x!1131 (x!65747 lt!351762)) (not (= x!1131 (x!65747 lt!351762))) (not (= index!1321 (index!34798 lt!351762)))))))

(assert (=> b!788735 e!438388))

(declare-fun res!534233 () Bool)

(assert (=> b!788735 (=> (not res!534233) (not e!438388))))

(declare-fun lt!351764 () SeekEntryResult!8107)

(assert (=> b!788735 (= res!534233 (= lt!351764 lt!351753))))

(assert (=> b!788735 (= lt!351753 (Found!8107 j!159))))

(assert (=> b!788735 (= lt!351764 (seekEntryOrOpen!0 (select (arr!20510 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!788735 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351763 () Unit!27296)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42846 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27296)

(assert (=> b!788735 (= lt!351763 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!788736 () Bool)

(assert (=> b!788736 (= e!438384 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20510 a!3186) j!159) a!3186 mask!3328) (Found!8107 j!159)))))

(declare-fun b!788737 () Bool)

(declare-fun res!534224 () Bool)

(assert (=> b!788737 (=> (not res!534224) (not e!438383))))

(declare-fun arrayContainsKey!0 (array!42846 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!788737 (= res!534224 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!788738 () Bool)

(declare-fun res!534222 () Bool)

(assert (=> b!788738 (=> (not res!534222) (not e!438380))))

(assert (=> b!788738 (= res!534222 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20931 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20931 a!3186))))))

(declare-fun b!788739 () Bool)

(assert (=> b!788739 (= e!438380 e!438382)))

(declare-fun res!534231 () Bool)

(assert (=> b!788739 (=> (not res!534231) (not e!438382))))

(declare-fun lt!351757 () SeekEntryResult!8107)

(assert (=> b!788739 (= res!534231 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20510 a!3186) j!159) mask!3328) (select (arr!20510 a!3186) j!159) a!3186 mask!3328) lt!351757))))

(assert (=> b!788739 (= lt!351757 (Intermediate!8107 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!788740 () Bool)

(assert (=> b!788740 (= e!438384 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20510 a!3186) j!159) a!3186 mask!3328) lt!351757))))

(declare-fun b!788741 () Bool)

(assert (=> b!788741 (= e!438383 e!438380)))

(declare-fun res!534230 () Bool)

(assert (=> b!788741 (=> (not res!534230) (not e!438380))))

(declare-fun lt!351754 () SeekEntryResult!8107)

(assert (=> b!788741 (= res!534230 (or (= lt!351754 (MissingZero!8107 i!1173)) (= lt!351754 (MissingVacant!8107 i!1173))))))

(assert (=> b!788741 (= lt!351754 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!788742 () Bool)

(assert (=> b!788742 (= e!438386 true)))

(assert (=> b!788742 e!438385))

(declare-fun res!534235 () Bool)

(assert (=> b!788742 (=> (not res!534235) (not e!438385))))

(assert (=> b!788742 (= res!534235 (= lt!351761 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351755 () Unit!27296)

(assert (=> b!788742 (= lt!351755 e!438377)))

(declare-fun c!87660 () Bool)

(assert (=> b!788742 (= c!87660 (= lt!351761 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!788743 () Bool)

(declare-fun res!534239 () Bool)

(assert (=> b!788743 (=> (not res!534239) (not e!438383))))

(assert (=> b!788743 (= res!534239 (validKeyInArray!0 (select (arr!20510 a!3186) j!159)))))

(declare-fun b!788744 () Bool)

(assert (=> b!788744 (= e!438385 (= lt!351764 lt!351756))))

(assert (= (and start!67850 res!534223) b!788730))

(assert (= (and b!788730 res!534238) b!788743))

(assert (= (and b!788743 res!534239) b!788723))

(assert (= (and b!788723 res!534240) b!788737))

(assert (= (and b!788737 res!534224) b!788741))

(assert (= (and b!788741 res!534230) b!788727))

(assert (= (and b!788727 res!534237) b!788728))

(assert (= (and b!788728 res!534229) b!788738))

(assert (= (and b!788738 res!534222) b!788739))

(assert (= (and b!788739 res!534231) b!788731))

(assert (= (and b!788731 res!534225) b!788734))

(assert (= (and b!788734 c!87659) b!788740))

(assert (= (and b!788734 (not c!87659)) b!788736))

(assert (= (and b!788734 res!534228) b!788732))

(assert (= (and b!788732 res!534236) b!788735))

(assert (= (and b!788735 res!534233) b!788726))

(assert (= (and b!788735 (not res!534226)) b!788733))

(assert (= (and b!788733 (not res!534234)) b!788724))

(assert (= (and b!788724 (not res!534227)) b!788742))

(assert (= (and b!788742 c!87660) b!788725))

(assert (= (and b!788742 (not c!87660)) b!788729))

(assert (= (and b!788742 res!534235) b!788722))

(assert (= (and b!788722 res!534232) b!788744))

(declare-fun m!729411 () Bool)

(assert (=> b!788728 m!729411))

(declare-fun m!729413 () Bool)

(assert (=> b!788723 m!729413))

(declare-fun m!729415 () Bool)

(assert (=> b!788726 m!729415))

(assert (=> b!788726 m!729415))

(declare-fun m!729417 () Bool)

(assert (=> b!788726 m!729417))

(declare-fun m!729419 () Bool)

(assert (=> b!788741 m!729419))

(assert (=> b!788740 m!729415))

(assert (=> b!788740 m!729415))

(declare-fun m!729421 () Bool)

(assert (=> b!788740 m!729421))

(assert (=> b!788736 m!729415))

(assert (=> b!788736 m!729415))

(declare-fun m!729423 () Bool)

(assert (=> b!788736 m!729423))

(declare-fun m!729425 () Bool)

(assert (=> b!788727 m!729425))

(declare-fun m!729427 () Bool)

(assert (=> b!788731 m!729427))

(assert (=> b!788735 m!729415))

(assert (=> b!788735 m!729415))

(declare-fun m!729429 () Bool)

(assert (=> b!788735 m!729429))

(declare-fun m!729431 () Bool)

(assert (=> b!788735 m!729431))

(declare-fun m!729433 () Bool)

(assert (=> b!788735 m!729433))

(declare-fun m!729435 () Bool)

(assert (=> b!788732 m!729435))

(declare-fun m!729437 () Bool)

(assert (=> b!788732 m!729437))

(declare-fun m!729439 () Bool)

(assert (=> b!788732 m!729439))

(declare-fun m!729441 () Bool)

(assert (=> b!788732 m!729441))

(assert (=> b!788732 m!729441))

(declare-fun m!729443 () Bool)

(assert (=> b!788732 m!729443))

(declare-fun m!729445 () Bool)

(assert (=> b!788722 m!729445))

(declare-fun m!729447 () Bool)

(assert (=> b!788722 m!729447))

(assert (=> b!788724 m!729435))

(declare-fun m!729449 () Bool)

(assert (=> b!788724 m!729449))

(assert (=> b!788743 m!729415))

(assert (=> b!788743 m!729415))

(declare-fun m!729451 () Bool)

(assert (=> b!788743 m!729451))

(assert (=> b!788739 m!729415))

(assert (=> b!788739 m!729415))

(declare-fun m!729453 () Bool)

(assert (=> b!788739 m!729453))

(assert (=> b!788739 m!729453))

(assert (=> b!788739 m!729415))

(declare-fun m!729455 () Bool)

(assert (=> b!788739 m!729455))

(declare-fun m!729457 () Bool)

(assert (=> b!788737 m!729457))

(assert (=> b!788733 m!729415))

(assert (=> b!788733 m!729415))

(assert (=> b!788733 m!729423))

(declare-fun m!729459 () Bool)

(assert (=> start!67850 m!729459))

(declare-fun m!729461 () Bool)

(assert (=> start!67850 m!729461))

(check-sat (not b!788723) (not b!788743) (not b!788735) (not b!788732) (not start!67850) (not b!788722) (not b!788733) (not b!788740) (not b!788739) (not b!788737) (not b!788726) (not b!788736) (not b!788741) (not b!788728) (not b!788727))
(check-sat)
