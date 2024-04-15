; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65450 () Bool)

(assert start!65450)

(declare-fun b!745899 () Bool)

(declare-fun res!502846 () Bool)

(declare-fun e!416546 () Bool)

(assert (=> b!745899 (=> (not res!502846) (not e!416546))))

(declare-fun e!416543 () Bool)

(assert (=> b!745899 (= res!502846 e!416543)))

(declare-fun c!81912 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!745899 (= c!81912 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!745900 () Bool)

(declare-fun e!416547 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!745900 (= e!416547 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-datatypes ((SeekEntryResult!7531 0))(
  ( (MissingZero!7531 (index!32492 (_ BitVec 32))) (Found!7531 (index!32493 (_ BitVec 32))) (Intermediate!7531 (undefined!8343 Bool) (index!32494 (_ BitVec 32)) (x!63452 (_ BitVec 32))) (Undefined!7531) (MissingVacant!7531 (index!32495 (_ BitVec 32))) )
))
(declare-fun lt!331324 () SeekEntryResult!7531)

(declare-fun lt!331316 () SeekEntryResult!7531)

(assert (=> b!745900 (= lt!331324 lt!331316)))

(declare-fun b!745901 () Bool)

(declare-fun res!502839 () Bool)

(declare-fun e!416548 () Bool)

(assert (=> b!745901 (=> (not res!502839) (not e!416548))))

(declare-datatypes ((array!41640 0))(
  ( (array!41641 (arr!19934 (Array (_ BitVec 32) (_ BitVec 64))) (size!20355 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41640)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41640 (_ BitVec 32)) Bool)

(assert (=> b!745901 (= res!502839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!745902 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41640 (_ BitVec 32)) SeekEntryResult!7531)

(assert (=> b!745902 (= e!416543 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19934 a!3186) j!159) a!3186 mask!3328) (Found!7531 j!159)))))

(declare-fun lt!331320 () SeekEntryResult!7531)

(declare-fun b!745903 () Bool)

(declare-fun e!416545 () Bool)

(assert (=> b!745903 (= e!416545 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19934 a!3186) j!159) a!3186 mask!3328) lt!331320))))

(declare-fun b!745904 () Bool)

(declare-fun e!416544 () Bool)

(assert (=> b!745904 (= e!416544 e!416547)))

(declare-fun res!502838 () Bool)

(assert (=> b!745904 (=> res!502838 e!416547)))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun lt!331323 () (_ BitVec 64))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!745904 (= res!502838 (or (not (= lt!331316 lt!331320)) (= (select (store (arr!19934 a!3186) i!1173 k0!2102) index!1321) lt!331323) (not (= (select (store (arr!19934 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!745904 (= lt!331316 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19934 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!745905 () Bool)

(declare-fun e!416551 () Bool)

(assert (=> b!745905 (= e!416551 (not e!416544))))

(declare-fun res!502844 () Bool)

(assert (=> b!745905 (=> res!502844 e!416544)))

(declare-fun lt!331318 () SeekEntryResult!7531)

(get-info :version)

(assert (=> b!745905 (= res!502844 (or (not ((_ is Intermediate!7531) lt!331318)) (bvslt x!1131 (x!63452 lt!331318)) (not (= x!1131 (x!63452 lt!331318))) (not (= index!1321 (index!32494 lt!331318)))))))

(assert (=> b!745905 e!416545))

(declare-fun res!502842 () Bool)

(assert (=> b!745905 (=> (not res!502842) (not e!416545))))

(assert (=> b!745905 (= res!502842 (= lt!331324 lt!331320))))

(assert (=> b!745905 (= lt!331320 (Found!7531 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41640 (_ BitVec 32)) SeekEntryResult!7531)

(assert (=> b!745905 (= lt!331324 (seekEntryOrOpen!0 (select (arr!19934 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!745905 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25514 0))(
  ( (Unit!25515) )
))
(declare-fun lt!331317 () Unit!25514)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41640 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25514)

(assert (=> b!745905 (= lt!331317 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!745906 () Bool)

(declare-fun res!502851 () Bool)

(declare-fun e!416549 () Bool)

(assert (=> b!745906 (=> (not res!502851) (not e!416549))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745906 (= res!502851 (validKeyInArray!0 (select (arr!19934 a!3186) j!159)))))

(declare-fun b!745907 () Bool)

(declare-fun res!502841 () Bool)

(assert (=> b!745907 (=> (not res!502841) (not e!416549))))

(declare-fun arrayContainsKey!0 (array!41640 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745907 (= res!502841 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!745908 () Bool)

(declare-fun res!502845 () Bool)

(assert (=> b!745908 (=> (not res!502845) (not e!416548))))

(declare-datatypes ((List!13975 0))(
  ( (Nil!13972) (Cons!13971 (h!15043 (_ BitVec 64)) (t!20281 List!13975)) )
))
(declare-fun arrayNoDuplicates!0 (array!41640 (_ BitVec 32) List!13975) Bool)

(assert (=> b!745908 (= res!502845 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13972))))

(declare-fun b!745909 () Bool)

(declare-fun lt!331319 () SeekEntryResult!7531)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41640 (_ BitVec 32)) SeekEntryResult!7531)

(assert (=> b!745909 (= e!416543 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19934 a!3186) j!159) a!3186 mask!3328) lt!331319))))

(declare-fun res!502843 () Bool)

(assert (=> start!65450 (=> (not res!502843) (not e!416549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65450 (= res!502843 (validMask!0 mask!3328))))

(assert (=> start!65450 e!416549))

(assert (=> start!65450 true))

(declare-fun array_inv!15817 (array!41640) Bool)

(assert (=> start!65450 (array_inv!15817 a!3186)))

(declare-fun b!745910 () Bool)

(declare-fun res!502850 () Bool)

(assert (=> b!745910 (=> (not res!502850) (not e!416549))))

(assert (=> b!745910 (= res!502850 (validKeyInArray!0 k0!2102))))

(declare-fun b!745911 () Bool)

(assert (=> b!745911 (= e!416546 e!416551)))

(declare-fun res!502836 () Bool)

(assert (=> b!745911 (=> (not res!502836) (not e!416551))))

(declare-fun lt!331322 () SeekEntryResult!7531)

(assert (=> b!745911 (= res!502836 (= lt!331322 lt!331318))))

(declare-fun lt!331321 () array!41640)

(assert (=> b!745911 (= lt!331318 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331323 lt!331321 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745911 (= lt!331322 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331323 mask!3328) lt!331323 lt!331321 mask!3328))))

(assert (=> b!745911 (= lt!331323 (select (store (arr!19934 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!745911 (= lt!331321 (array!41641 (store (arr!19934 a!3186) i!1173 k0!2102) (size!20355 a!3186)))))

(declare-fun b!745912 () Bool)

(assert (=> b!745912 (= e!416548 e!416546)))

(declare-fun res!502847 () Bool)

(assert (=> b!745912 (=> (not res!502847) (not e!416546))))

(assert (=> b!745912 (= res!502847 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19934 a!3186) j!159) mask!3328) (select (arr!19934 a!3186) j!159) a!3186 mask!3328) lt!331319))))

(assert (=> b!745912 (= lt!331319 (Intermediate!7531 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!745913 () Bool)

(assert (=> b!745913 (= e!416549 e!416548)))

(declare-fun res!502848 () Bool)

(assert (=> b!745913 (=> (not res!502848) (not e!416548))))

(declare-fun lt!331325 () SeekEntryResult!7531)

(assert (=> b!745913 (= res!502848 (or (= lt!331325 (MissingZero!7531 i!1173)) (= lt!331325 (MissingVacant!7531 i!1173))))))

(assert (=> b!745913 (= lt!331325 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!745914 () Bool)

(declare-fun res!502837 () Bool)

(assert (=> b!745914 (=> (not res!502837) (not e!416546))))

(assert (=> b!745914 (= res!502837 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19934 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!745915 () Bool)

(declare-fun res!502840 () Bool)

(assert (=> b!745915 (=> (not res!502840) (not e!416549))))

(assert (=> b!745915 (= res!502840 (and (= (size!20355 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20355 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20355 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745916 () Bool)

(declare-fun res!502849 () Bool)

(assert (=> b!745916 (=> (not res!502849) (not e!416548))))

(assert (=> b!745916 (= res!502849 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20355 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20355 a!3186))))))

(assert (= (and start!65450 res!502843) b!745915))

(assert (= (and b!745915 res!502840) b!745906))

(assert (= (and b!745906 res!502851) b!745910))

(assert (= (and b!745910 res!502850) b!745907))

(assert (= (and b!745907 res!502841) b!745913))

(assert (= (and b!745913 res!502848) b!745901))

(assert (= (and b!745901 res!502839) b!745908))

(assert (= (and b!745908 res!502845) b!745916))

(assert (= (and b!745916 res!502849) b!745912))

(assert (= (and b!745912 res!502847) b!745914))

(assert (= (and b!745914 res!502837) b!745899))

(assert (= (and b!745899 c!81912) b!745909))

(assert (= (and b!745899 (not c!81912)) b!745902))

(assert (= (and b!745899 res!502846) b!745911))

(assert (= (and b!745911 res!502836) b!745905))

(assert (= (and b!745905 res!502842) b!745903))

(assert (= (and b!745905 (not res!502844)) b!745904))

(assert (= (and b!745904 (not res!502838)) b!745900))

(declare-fun m!695681 () Bool)

(assert (=> b!745902 m!695681))

(assert (=> b!745902 m!695681))

(declare-fun m!695683 () Bool)

(assert (=> b!745902 m!695683))

(declare-fun m!695685 () Bool)

(assert (=> b!745914 m!695685))

(assert (=> b!745905 m!695681))

(assert (=> b!745905 m!695681))

(declare-fun m!695687 () Bool)

(assert (=> b!745905 m!695687))

(declare-fun m!695689 () Bool)

(assert (=> b!745905 m!695689))

(declare-fun m!695691 () Bool)

(assert (=> b!745905 m!695691))

(declare-fun m!695693 () Bool)

(assert (=> b!745910 m!695693))

(assert (=> b!745903 m!695681))

(assert (=> b!745903 m!695681))

(declare-fun m!695695 () Bool)

(assert (=> b!745903 m!695695))

(declare-fun m!695697 () Bool)

(assert (=> b!745907 m!695697))

(declare-fun m!695699 () Bool)

(assert (=> start!65450 m!695699))

(declare-fun m!695701 () Bool)

(assert (=> start!65450 m!695701))

(assert (=> b!745906 m!695681))

(assert (=> b!745906 m!695681))

(declare-fun m!695703 () Bool)

(assert (=> b!745906 m!695703))

(declare-fun m!695705 () Bool)

(assert (=> b!745913 m!695705))

(assert (=> b!745912 m!695681))

(assert (=> b!745912 m!695681))

(declare-fun m!695707 () Bool)

(assert (=> b!745912 m!695707))

(assert (=> b!745912 m!695707))

(assert (=> b!745912 m!695681))

(declare-fun m!695709 () Bool)

(assert (=> b!745912 m!695709))

(declare-fun m!695711 () Bool)

(assert (=> b!745904 m!695711))

(declare-fun m!695713 () Bool)

(assert (=> b!745904 m!695713))

(assert (=> b!745904 m!695681))

(assert (=> b!745904 m!695681))

(assert (=> b!745904 m!695683))

(declare-fun m!695715 () Bool)

(assert (=> b!745908 m!695715))

(declare-fun m!695717 () Bool)

(assert (=> b!745901 m!695717))

(declare-fun m!695719 () Bool)

(assert (=> b!745911 m!695719))

(assert (=> b!745911 m!695711))

(declare-fun m!695721 () Bool)

(assert (=> b!745911 m!695721))

(declare-fun m!695723 () Bool)

(assert (=> b!745911 m!695723))

(declare-fun m!695725 () Bool)

(assert (=> b!745911 m!695725))

(assert (=> b!745911 m!695721))

(assert (=> b!745909 m!695681))

(assert (=> b!745909 m!695681))

(declare-fun m!695727 () Bool)

(assert (=> b!745909 m!695727))

(check-sat (not b!745913) (not start!65450) (not b!745909) (not b!745911) (not b!745907) (not b!745902) (not b!745910) (not b!745904) (not b!745905) (not b!745903) (not b!745908) (not b!745912) (not b!745906) (not b!745901))
(check-sat)
