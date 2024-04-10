; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67266 () Bool)

(assert start!67266)

(declare-fun b!777899 () Bool)

(declare-fun e!432813 () Bool)

(declare-fun e!432811 () Bool)

(assert (=> b!777899 (= e!432813 e!432811)))

(declare-fun res!526301 () Bool)

(assert (=> b!777899 (=> (not res!526301) (not e!432811))))

(declare-datatypes ((SeekEntryResult!7973 0))(
  ( (MissingZero!7973 (index!34260 (_ BitVec 32))) (Found!7973 (index!34261 (_ BitVec 32))) (Intermediate!7973 (undefined!8785 Bool) (index!34262 (_ BitVec 32)) (x!65205 (_ BitVec 32))) (Undefined!7973) (MissingVacant!7973 (index!34263 (_ BitVec 32))) )
))
(declare-fun lt!346571 () SeekEntryResult!7973)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!777899 (= res!526301 (or (= lt!346571 (MissingZero!7973 i!1173)) (= lt!346571 (MissingVacant!7973 i!1173))))))

(declare-datatypes ((array!42558 0))(
  ( (array!42559 (arr!20373 (Array (_ BitVec 32) (_ BitVec 64))) (size!20794 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42558)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42558 (_ BitVec 32)) SeekEntryResult!7973)

(assert (=> b!777899 (= lt!346571 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!777900 () Bool)

(declare-fun res!526300 () Bool)

(assert (=> b!777900 (=> (not res!526300) (not e!432813))))

(declare-fun arrayContainsKey!0 (array!42558 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!777900 (= res!526300 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!777901 () Bool)

(declare-fun res!526297 () Bool)

(assert (=> b!777901 (=> (not res!526297) (not e!432813))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!777901 (= res!526297 (validKeyInArray!0 (select (arr!20373 a!3186) j!159)))))

(declare-fun b!777902 () Bool)

(declare-fun res!526287 () Bool)

(assert (=> b!777902 (=> (not res!526287) (not e!432811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42558 (_ BitVec 32)) Bool)

(assert (=> b!777902 (= res!526287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!777903 () Bool)

(declare-fun e!432814 () Bool)

(declare-fun e!432817 () Bool)

(assert (=> b!777903 (= e!432814 (not e!432817))))

(declare-fun res!526289 () Bool)

(assert (=> b!777903 (=> res!526289 e!432817)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!346577 () SeekEntryResult!7973)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!777903 (= res!526289 (or (not (is-Intermediate!7973 lt!346577)) (bvslt x!1131 (x!65205 lt!346577)) (not (= x!1131 (x!65205 lt!346577))) (not (= index!1321 (index!34262 lt!346577)))))))

(declare-fun e!432816 () Bool)

(assert (=> b!777903 e!432816))

(declare-fun res!526286 () Bool)

(assert (=> b!777903 (=> (not res!526286) (not e!432816))))

(assert (=> b!777903 (= res!526286 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26840 0))(
  ( (Unit!26841) )
))
(declare-fun lt!346569 () Unit!26840)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42558 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26840)

(assert (=> b!777903 (= lt!346569 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!777904 () Bool)

(declare-fun res!526298 () Bool)

(assert (=> b!777904 (=> (not res!526298) (not e!432811))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!777904 (= res!526298 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20794 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20794 a!3186))))))

(declare-fun b!777905 () Bool)

(declare-fun res!526293 () Bool)

(declare-fun e!432818 () Bool)

(assert (=> b!777905 (=> (not res!526293) (not e!432818))))

(declare-fun e!432812 () Bool)

(assert (=> b!777905 (= res!526293 e!432812)))

(declare-fun c!86209 () Bool)

(assert (=> b!777905 (= c!86209 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!777906 () Bool)

(assert (=> b!777906 (= e!432817 true)))

(declare-fun lt!346574 () SeekEntryResult!7973)

(declare-fun lt!346570 () array!42558)

(declare-fun lt!346575 () (_ BitVec 64))

(assert (=> b!777906 (= lt!346574 (seekEntryOrOpen!0 lt!346575 lt!346570 mask!3328))))

(declare-fun b!777907 () Bool)

(declare-fun res!526292 () Bool)

(assert (=> b!777907 (=> (not res!526292) (not e!432818))))

(assert (=> b!777907 (= res!526292 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20373 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!346576 () SeekEntryResult!7973)

(declare-fun b!777908 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42558 (_ BitVec 32)) SeekEntryResult!7973)

(assert (=> b!777908 (= e!432812 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20373 a!3186) j!159) a!3186 mask!3328) lt!346576))))

(declare-fun res!526290 () Bool)

(assert (=> start!67266 (=> (not res!526290) (not e!432813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67266 (= res!526290 (validMask!0 mask!3328))))

(assert (=> start!67266 e!432813))

(assert (=> start!67266 true))

(declare-fun array_inv!16169 (array!42558) Bool)

(assert (=> start!67266 (array_inv!16169 a!3186)))

(declare-fun b!777909 () Bool)

(declare-fun res!526299 () Bool)

(assert (=> b!777909 (=> (not res!526299) (not e!432813))))

(assert (=> b!777909 (= res!526299 (and (= (size!20794 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20794 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20794 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!777910 () Bool)

(declare-fun res!526284 () Bool)

(assert (=> b!777910 (=> res!526284 e!432817)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42558 (_ BitVec 32)) SeekEntryResult!7973)

(assert (=> b!777910 (= res!526284 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20373 a!3186) j!159) a!3186 mask!3328) (Found!7973 j!159))))))

(declare-fun b!777911 () Bool)

(declare-fun res!526295 () Bool)

(assert (=> b!777911 (=> (not res!526295) (not e!432811))))

(declare-datatypes ((List!14375 0))(
  ( (Nil!14372) (Cons!14371 (h!15482 (_ BitVec 64)) (t!20690 List!14375)) )
))
(declare-fun arrayNoDuplicates!0 (array!42558 (_ BitVec 32) List!14375) Bool)

(assert (=> b!777911 (= res!526295 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14372))))

(declare-fun b!777912 () Bool)

(assert (=> b!777912 (= e!432812 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20373 a!3186) j!159) a!3186 mask!3328) (Found!7973 j!159)))))

(declare-fun b!777913 () Bool)

(declare-fun res!526296 () Bool)

(assert (=> b!777913 (=> (not res!526296) (not e!432813))))

(assert (=> b!777913 (= res!526296 (validKeyInArray!0 k!2102))))

(declare-fun b!777914 () Bool)

(declare-fun e!432815 () Bool)

(assert (=> b!777914 (= e!432816 e!432815)))

(declare-fun res!526291 () Bool)

(assert (=> b!777914 (=> (not res!526291) (not e!432815))))

(declare-fun lt!346572 () SeekEntryResult!7973)

(assert (=> b!777914 (= res!526291 (= (seekEntryOrOpen!0 (select (arr!20373 a!3186) j!159) a!3186 mask!3328) lt!346572))))

(assert (=> b!777914 (= lt!346572 (Found!7973 j!159))))

(declare-fun b!777915 () Bool)

(assert (=> b!777915 (= e!432818 e!432814)))

(declare-fun res!526288 () Bool)

(assert (=> b!777915 (=> (not res!526288) (not e!432814))))

(declare-fun lt!346573 () SeekEntryResult!7973)

(assert (=> b!777915 (= res!526288 (= lt!346573 lt!346577))))

(assert (=> b!777915 (= lt!346577 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346575 lt!346570 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!777915 (= lt!346573 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346575 mask!3328) lt!346575 lt!346570 mask!3328))))

(assert (=> b!777915 (= lt!346575 (select (store (arr!20373 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!777915 (= lt!346570 (array!42559 (store (arr!20373 a!3186) i!1173 k!2102) (size!20794 a!3186)))))

(declare-fun b!777916 () Bool)

(assert (=> b!777916 (= e!432815 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20373 a!3186) j!159) a!3186 mask!3328) lt!346572))))

(declare-fun b!777917 () Bool)

(declare-fun res!526294 () Bool)

(assert (=> b!777917 (=> res!526294 e!432817)))

(assert (=> b!777917 (= res!526294 (or (not (= (select (store (arr!20373 a!3186) i!1173 k!2102) index!1321) lt!346575)) (undefined!8785 lt!346577)))))

(declare-fun b!777918 () Bool)

(assert (=> b!777918 (= e!432811 e!432818)))

(declare-fun res!526285 () Bool)

(assert (=> b!777918 (=> (not res!526285) (not e!432818))))

(assert (=> b!777918 (= res!526285 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20373 a!3186) j!159) mask!3328) (select (arr!20373 a!3186) j!159) a!3186 mask!3328) lt!346576))))

(assert (=> b!777918 (= lt!346576 (Intermediate!7973 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!67266 res!526290) b!777909))

(assert (= (and b!777909 res!526299) b!777901))

(assert (= (and b!777901 res!526297) b!777913))

(assert (= (and b!777913 res!526296) b!777900))

(assert (= (and b!777900 res!526300) b!777899))

(assert (= (and b!777899 res!526301) b!777902))

(assert (= (and b!777902 res!526287) b!777911))

(assert (= (and b!777911 res!526295) b!777904))

(assert (= (and b!777904 res!526298) b!777918))

(assert (= (and b!777918 res!526285) b!777907))

(assert (= (and b!777907 res!526292) b!777905))

(assert (= (and b!777905 c!86209) b!777908))

(assert (= (and b!777905 (not c!86209)) b!777912))

(assert (= (and b!777905 res!526293) b!777915))

(assert (= (and b!777915 res!526288) b!777903))

(assert (= (and b!777903 res!526286) b!777914))

(assert (= (and b!777914 res!526291) b!777916))

(assert (= (and b!777903 (not res!526289)) b!777910))

(assert (= (and b!777910 (not res!526284)) b!777917))

(assert (= (and b!777917 (not res!526294)) b!777906))

(declare-fun m!721691 () Bool)

(assert (=> b!777902 m!721691))

(declare-fun m!721693 () Bool)

(assert (=> b!777900 m!721693))

(declare-fun m!721695 () Bool)

(assert (=> b!777899 m!721695))

(declare-fun m!721697 () Bool)

(assert (=> b!777916 m!721697))

(assert (=> b!777916 m!721697))

(declare-fun m!721699 () Bool)

(assert (=> b!777916 m!721699))

(assert (=> b!777908 m!721697))

(assert (=> b!777908 m!721697))

(declare-fun m!721701 () Bool)

(assert (=> b!777908 m!721701))

(assert (=> b!777901 m!721697))

(assert (=> b!777901 m!721697))

(declare-fun m!721703 () Bool)

(assert (=> b!777901 m!721703))

(declare-fun m!721705 () Bool)

(assert (=> b!777907 m!721705))

(declare-fun m!721707 () Bool)

(assert (=> b!777915 m!721707))

(declare-fun m!721709 () Bool)

(assert (=> b!777915 m!721709))

(declare-fun m!721711 () Bool)

(assert (=> b!777915 m!721711))

(declare-fun m!721713 () Bool)

(assert (=> b!777915 m!721713))

(assert (=> b!777915 m!721707))

(declare-fun m!721715 () Bool)

(assert (=> b!777915 m!721715))

(assert (=> b!777912 m!721697))

(assert (=> b!777912 m!721697))

(declare-fun m!721717 () Bool)

(assert (=> b!777912 m!721717))

(declare-fun m!721719 () Bool)

(assert (=> start!67266 m!721719))

(declare-fun m!721721 () Bool)

(assert (=> start!67266 m!721721))

(declare-fun m!721723 () Bool)

(assert (=> b!777911 m!721723))

(assert (=> b!777914 m!721697))

(assert (=> b!777914 m!721697))

(declare-fun m!721725 () Bool)

(assert (=> b!777914 m!721725))

(declare-fun m!721727 () Bool)

(assert (=> b!777913 m!721727))

(declare-fun m!721729 () Bool)

(assert (=> b!777903 m!721729))

(declare-fun m!721731 () Bool)

(assert (=> b!777903 m!721731))

(assert (=> b!777910 m!721697))

(assert (=> b!777910 m!721697))

(assert (=> b!777910 m!721717))

(assert (=> b!777918 m!721697))

(assert (=> b!777918 m!721697))

(declare-fun m!721733 () Bool)

(assert (=> b!777918 m!721733))

(assert (=> b!777918 m!721733))

(assert (=> b!777918 m!721697))

(declare-fun m!721735 () Bool)

(assert (=> b!777918 m!721735))

(assert (=> b!777917 m!721711))

(declare-fun m!721737 () Bool)

(assert (=> b!777917 m!721737))

(declare-fun m!721739 () Bool)

(assert (=> b!777906 m!721739))

(push 1)

