; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65272 () Bool)

(assert start!65272)

(declare-fun res!498049 () Bool)

(declare-fun e!414040 () Bool)

(assert (=> start!65272 (=> (not res!498049) (not e!414040))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65272 (= res!498049 (validMask!0 mask!3328))))

(assert (=> start!65272 e!414040))

(assert (=> start!65272 true))

(declare-datatypes ((array!41445 0))(
  ( (array!41446 (arr!19836 (Array (_ BitVec 32) (_ BitVec 64))) (size!20257 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41445)

(declare-fun array_inv!15632 (array!41445) Bool)

(assert (=> start!65272 (array_inv!15632 a!3186)))

(declare-datatypes ((SeekEntryResult!7436 0))(
  ( (MissingZero!7436 (index!32112 (_ BitVec 32))) (Found!7436 (index!32113 (_ BitVec 32))) (Intermediate!7436 (undefined!8248 Bool) (index!32114 (_ BitVec 32)) (x!63098 (_ BitVec 32))) (Undefined!7436) (MissingVacant!7436 (index!32115 (_ BitVec 32))) )
))
(declare-fun lt!329019 () SeekEntryResult!7436)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!414049 () Bool)

(declare-fun b!740592 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41445 (_ BitVec 32)) SeekEntryResult!7436)

(assert (=> b!740592 (= e!414049 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19836 a!3186) j!159) a!3186 mask!3328) lt!329019))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!740593 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41445 (_ BitVec 32)) SeekEntryResult!7436)

(assert (=> b!740593 (= e!414049 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19836 a!3186) j!159) a!3186 mask!3328) (Found!7436 j!159)))))

(declare-fun b!740594 () Bool)

(declare-fun res!498058 () Bool)

(declare-fun e!414045 () Bool)

(assert (=> b!740594 (=> (not res!498058) (not e!414045))))

(declare-datatypes ((List!13838 0))(
  ( (Nil!13835) (Cons!13834 (h!14906 (_ BitVec 64)) (t!20153 List!13838)) )
))
(declare-fun arrayNoDuplicates!0 (array!41445 (_ BitVec 32) List!13838) Bool)

(assert (=> b!740594 (= res!498058 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13835))))

(declare-fun b!740595 () Bool)

(assert (=> b!740595 (= e!414040 e!414045)))

(declare-fun res!498062 () Bool)

(assert (=> b!740595 (=> (not res!498062) (not e!414045))))

(declare-fun lt!329012 () SeekEntryResult!7436)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!740595 (= res!498062 (or (= lt!329012 (MissingZero!7436 i!1173)) (= lt!329012 (MissingVacant!7436 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41445 (_ BitVec 32)) SeekEntryResult!7436)

(assert (=> b!740595 (= lt!329012 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!740596 () Bool)

(declare-fun res!498051 () Bool)

(assert (=> b!740596 (=> (not res!498051) (not e!414040))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!740596 (= res!498051 (validKeyInArray!0 k!2102))))

(declare-fun b!740597 () Bool)

(declare-fun res!498064 () Bool)

(assert (=> b!740597 (=> (not res!498064) (not e!414040))))

(assert (=> b!740597 (= res!498064 (validKeyInArray!0 (select (arr!19836 a!3186) j!159)))))

(declare-fun b!740598 () Bool)

(declare-fun res!498054 () Bool)

(assert (=> b!740598 (=> (not res!498054) (not e!414045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41445 (_ BitVec 32)) Bool)

(assert (=> b!740598 (= res!498054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!740599 () Bool)

(declare-fun res!498052 () Bool)

(declare-fun e!414039 () Bool)

(assert (=> b!740599 (=> res!498052 e!414039)))

(declare-fun lt!329011 () (_ BitVec 32))

(declare-fun lt!329018 () array!41445)

(declare-fun lt!329013 () SeekEntryResult!7436)

(declare-fun lt!329020 () (_ BitVec 64))

(assert (=> b!740599 (= res!498052 (not (= lt!329013 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329011 lt!329020 lt!329018 mask!3328))))))

(declare-fun b!740600 () Bool)

(declare-fun e!414044 () Bool)

(assert (=> b!740600 (= e!414045 e!414044)))

(declare-fun res!498060 () Bool)

(assert (=> b!740600 (=> (not res!498060) (not e!414044))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740600 (= res!498060 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19836 a!3186) j!159) mask!3328) (select (arr!19836 a!3186) j!159) a!3186 mask!3328) lt!329019))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!740600 (= lt!329019 (Intermediate!7436 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!414050 () Bool)

(declare-fun b!740601 () Bool)

(assert (=> b!740601 (= e!414050 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329011 (select (arr!19836 a!3186) j!159) a!3186 mask!3328) lt!329019)))))

(declare-fun b!740602 () Bool)

(declare-fun res!498065 () Bool)

(assert (=> b!740602 (=> (not res!498065) (not e!414045))))

(assert (=> b!740602 (= res!498065 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20257 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20257 a!3186))))))

(declare-fun lt!329021 () SeekEntryResult!7436)

(declare-fun b!740603 () Bool)

(assert (=> b!740603 (= e!414050 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329011 resIntermediateIndex!5 (select (arr!19836 a!3186) j!159) a!3186 mask!3328) lt!329021)))))

(declare-fun b!740604 () Bool)

(declare-fun res!498050 () Bool)

(assert (=> b!740604 (=> (not res!498050) (not e!414044))))

(assert (=> b!740604 (= res!498050 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19836 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!740605 () Bool)

(declare-datatypes ((Unit!25340 0))(
  ( (Unit!25341) )
))
(declare-fun e!414042 () Unit!25340)

(declare-fun Unit!25342 () Unit!25340)

(assert (=> b!740605 (= e!414042 Unit!25342)))

(assert (=> b!740605 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329011 (select (arr!19836 a!3186) j!159) a!3186 mask!3328) lt!329019)))

(declare-fun b!740606 () Bool)

(assert (=> b!740606 (= e!414039 true)))

(assert (=> b!740606 (= (seekEntryOrOpen!0 lt!329020 lt!329018 mask!3328) lt!329021)))

(declare-fun lt!329009 () Unit!25340)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!41445 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25340)

(assert (=> b!740606 (= lt!329009 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k!2102 j!159 lt!329011 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!740607 () Bool)

(declare-fun e!414041 () Bool)

(declare-fun e!414047 () Bool)

(assert (=> b!740607 (= e!414041 (not e!414047))))

(declare-fun res!498055 () Bool)

(assert (=> b!740607 (=> res!498055 e!414047)))

(declare-fun lt!329014 () SeekEntryResult!7436)

(assert (=> b!740607 (= res!498055 (or (not (is-Intermediate!7436 lt!329014)) (bvsge x!1131 (x!63098 lt!329014))))))

(assert (=> b!740607 (= lt!329021 (Found!7436 j!159))))

(declare-fun e!414048 () Bool)

(assert (=> b!740607 e!414048))

(declare-fun res!498053 () Bool)

(assert (=> b!740607 (=> (not res!498053) (not e!414048))))

(assert (=> b!740607 (= res!498053 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!329016 () Unit!25340)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41445 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25340)

(assert (=> b!740607 (= lt!329016 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!740608 () Bool)

(declare-fun res!498048 () Bool)

(assert (=> b!740608 (=> (not res!498048) (not e!414040))))

(assert (=> b!740608 (= res!498048 (and (= (size!20257 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20257 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20257 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!740609 () Bool)

(assert (=> b!740609 (= e!414044 e!414041)))

(declare-fun res!498063 () Bool)

(assert (=> b!740609 (=> (not res!498063) (not e!414041))))

(assert (=> b!740609 (= res!498063 (= lt!329013 lt!329014))))

(assert (=> b!740609 (= lt!329014 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329020 lt!329018 mask!3328))))

(assert (=> b!740609 (= lt!329013 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329020 mask!3328) lt!329020 lt!329018 mask!3328))))

(assert (=> b!740609 (= lt!329020 (select (store (arr!19836 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!740609 (= lt!329018 (array!41446 (store (arr!19836 a!3186) i!1173 k!2102) (size!20257 a!3186)))))

(declare-fun b!740610 () Bool)

(declare-fun e!414046 () Bool)

(assert (=> b!740610 (= e!414048 e!414046)))

(declare-fun res!498059 () Bool)

(assert (=> b!740610 (=> (not res!498059) (not e!414046))))

(declare-fun lt!329008 () SeekEntryResult!7436)

(assert (=> b!740610 (= res!498059 (= (seekEntryOrOpen!0 (select (arr!19836 a!3186) j!159) a!3186 mask!3328) lt!329008))))

(assert (=> b!740610 (= lt!329008 (Found!7436 j!159))))

(declare-fun b!740611 () Bool)

(declare-fun res!498047 () Bool)

(assert (=> b!740611 (=> (not res!498047) (not e!414040))))

(declare-fun arrayContainsKey!0 (array!41445 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!740611 (= res!498047 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!740612 () Bool)

(assert (=> b!740612 (= e!414046 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19836 a!3186) j!159) a!3186 mask!3328) lt!329008))))

(declare-fun b!740613 () Bool)

(declare-fun res!498061 () Bool)

(assert (=> b!740613 (=> (not res!498061) (not e!414044))))

(assert (=> b!740613 (= res!498061 e!414049)))

(declare-fun c!81653 () Bool)

(assert (=> b!740613 (= c!81653 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!740614 () Bool)

(assert (=> b!740614 (= e!414047 e!414039)))

(declare-fun res!498057 () Bool)

(assert (=> b!740614 (=> res!498057 e!414039)))

(assert (=> b!740614 (= res!498057 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!329011 #b00000000000000000000000000000000) (bvsge lt!329011 (size!20257 a!3186))))))

(declare-fun lt!329010 () Unit!25340)

(assert (=> b!740614 (= lt!329010 e!414042)))

(declare-fun c!81654 () Bool)

(declare-fun lt!329015 () Bool)

(assert (=> b!740614 (= c!81654 lt!329015)))

(assert (=> b!740614 (= lt!329015 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740614 (= lt!329011 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!740615 () Bool)

(declare-fun res!498056 () Bool)

(assert (=> b!740615 (=> res!498056 e!414039)))

(assert (=> b!740615 (= res!498056 e!414050)))

(declare-fun c!81655 () Bool)

(assert (=> b!740615 (= c!81655 lt!329015)))

(declare-fun b!740616 () Bool)

(declare-fun Unit!25343 () Unit!25340)

(assert (=> b!740616 (= e!414042 Unit!25343)))

(declare-fun lt!329017 () SeekEntryResult!7436)

(assert (=> b!740616 (= lt!329017 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19836 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!740616 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329011 resIntermediateIndex!5 (select (arr!19836 a!3186) j!159) a!3186 mask!3328) lt!329021)))

(assert (= (and start!65272 res!498049) b!740608))

(assert (= (and b!740608 res!498048) b!740597))

(assert (= (and b!740597 res!498064) b!740596))

(assert (= (and b!740596 res!498051) b!740611))

(assert (= (and b!740611 res!498047) b!740595))

(assert (= (and b!740595 res!498062) b!740598))

(assert (= (and b!740598 res!498054) b!740594))

(assert (= (and b!740594 res!498058) b!740602))

(assert (= (and b!740602 res!498065) b!740600))

(assert (= (and b!740600 res!498060) b!740604))

(assert (= (and b!740604 res!498050) b!740613))

(assert (= (and b!740613 c!81653) b!740592))

(assert (= (and b!740613 (not c!81653)) b!740593))

(assert (= (and b!740613 res!498061) b!740609))

(assert (= (and b!740609 res!498063) b!740607))

(assert (= (and b!740607 res!498053) b!740610))

(assert (= (and b!740610 res!498059) b!740612))

(assert (= (and b!740607 (not res!498055)) b!740614))

(assert (= (and b!740614 c!81654) b!740605))

(assert (= (and b!740614 (not c!81654)) b!740616))

(assert (= (and b!740614 (not res!498057)) b!740615))

(assert (= (and b!740615 c!81655) b!740601))

(assert (= (and b!740615 (not c!81655)) b!740603))

(assert (= (and b!740615 (not res!498056)) b!740599))

(assert (= (and b!740599 (not res!498052)) b!740606))

(declare-fun m!691693 () Bool)

(assert (=> b!740594 m!691693))

(declare-fun m!691695 () Bool)

(assert (=> b!740603 m!691695))

(assert (=> b!740603 m!691695))

(declare-fun m!691697 () Bool)

(assert (=> b!740603 m!691697))

(declare-fun m!691699 () Bool)

(assert (=> b!740614 m!691699))

(assert (=> b!740610 m!691695))

(assert (=> b!740610 m!691695))

(declare-fun m!691701 () Bool)

(assert (=> b!740610 m!691701))

(declare-fun m!691703 () Bool)

(assert (=> b!740607 m!691703))

(declare-fun m!691705 () Bool)

(assert (=> b!740607 m!691705))

(declare-fun m!691707 () Bool)

(assert (=> b!740609 m!691707))

(declare-fun m!691709 () Bool)

(assert (=> b!740609 m!691709))

(declare-fun m!691711 () Bool)

(assert (=> b!740609 m!691711))

(assert (=> b!740609 m!691707))

(declare-fun m!691713 () Bool)

(assert (=> b!740609 m!691713))

(declare-fun m!691715 () Bool)

(assert (=> b!740609 m!691715))

(declare-fun m!691717 () Bool)

(assert (=> b!740599 m!691717))

(declare-fun m!691719 () Bool)

(assert (=> b!740606 m!691719))

(declare-fun m!691721 () Bool)

(assert (=> b!740606 m!691721))

(assert (=> b!740616 m!691695))

(assert (=> b!740616 m!691695))

(declare-fun m!691723 () Bool)

(assert (=> b!740616 m!691723))

(assert (=> b!740616 m!691695))

(assert (=> b!740616 m!691697))

(declare-fun m!691725 () Bool)

(assert (=> b!740596 m!691725))

(declare-fun m!691727 () Bool)

(assert (=> b!740598 m!691727))

(assert (=> b!740612 m!691695))

(assert (=> b!740612 m!691695))

(declare-fun m!691729 () Bool)

(assert (=> b!740612 m!691729))

(assert (=> b!740593 m!691695))

(assert (=> b!740593 m!691695))

(assert (=> b!740593 m!691723))

(assert (=> b!740592 m!691695))

(assert (=> b!740592 m!691695))

(declare-fun m!691731 () Bool)

(assert (=> b!740592 m!691731))

(assert (=> b!740605 m!691695))

(assert (=> b!740605 m!691695))

(declare-fun m!691733 () Bool)

(assert (=> b!740605 m!691733))

(declare-fun m!691735 () Bool)

(assert (=> b!740611 m!691735))

(declare-fun m!691737 () Bool)

(assert (=> b!740604 m!691737))

(assert (=> b!740597 m!691695))

(assert (=> b!740597 m!691695))

(declare-fun m!691739 () Bool)

(assert (=> b!740597 m!691739))

(assert (=> b!740601 m!691695))

(assert (=> b!740601 m!691695))

(assert (=> b!740601 m!691733))

(declare-fun m!691741 () Bool)

(assert (=> b!740595 m!691741))

(assert (=> b!740600 m!691695))

(assert (=> b!740600 m!691695))

(declare-fun m!691743 () Bool)

(assert (=> b!740600 m!691743))

(assert (=> b!740600 m!691743))

(assert (=> b!740600 m!691695))

(declare-fun m!691745 () Bool)

(assert (=> b!740600 m!691745))

(declare-fun m!691747 () Bool)

(assert (=> start!65272 m!691747))

(declare-fun m!691749 () Bool)

(assert (=> start!65272 m!691749))

(push 1)

