; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67142 () Bool)

(assert start!67142)

(declare-fun b!775840 () Bool)

(declare-fun res!524723 () Bool)

(declare-fun e!431772 () Bool)

(assert (=> b!775840 (=> (not res!524723) (not e!431772))))

(declare-datatypes ((array!42497 0))(
  ( (array!42498 (arr!20344 (Array (_ BitVec 32) (_ BitVec 64))) (size!20765 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42497)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42497 (_ BitVec 32)) Bool)

(assert (=> b!775840 (= res!524723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!524719 () Bool)

(declare-fun e!431768 () Bool)

(assert (=> start!67142 (=> (not res!524719) (not e!431768))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67142 (= res!524719 (validMask!0 mask!3328))))

(assert (=> start!67142 e!431768))

(assert (=> start!67142 true))

(declare-fun array_inv!16140 (array!42497) Bool)

(assert (=> start!67142 (array_inv!16140 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!431771 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!775841 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7944 0))(
  ( (MissingZero!7944 (index!34144 (_ BitVec 32))) (Found!7944 (index!34145 (_ BitVec 32))) (Intermediate!7944 (undefined!8756 Bool) (index!34146 (_ BitVec 32)) (x!65087 (_ BitVec 32))) (Undefined!7944) (MissingVacant!7944 (index!34147 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42497 (_ BitVec 32)) SeekEntryResult!7944)

(assert (=> b!775841 (= e!431771 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20344 a!3186) j!159) a!3186 mask!3328) (Found!7944 j!159)))))

(declare-fun b!775842 () Bool)

(declare-fun res!524712 () Bool)

(assert (=> b!775842 (=> (not res!524712) (not e!431772))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!775842 (= res!524712 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20765 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20765 a!3186))))))

(declare-fun b!775843 () Bool)

(declare-fun e!431769 () Bool)

(declare-fun e!431766 () Bool)

(assert (=> b!775843 (= e!431769 e!431766)))

(declare-fun res!524720 () Bool)

(assert (=> b!775843 (=> (not res!524720) (not e!431766))))

(declare-fun lt!345623 () SeekEntryResult!7944)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42497 (_ BitVec 32)) SeekEntryResult!7944)

(assert (=> b!775843 (= res!524720 (= (seekEntryOrOpen!0 (select (arr!20344 a!3186) j!159) a!3186 mask!3328) lt!345623))))

(assert (=> b!775843 (= lt!345623 (Found!7944 j!159))))

(declare-fun b!775844 () Bool)

(declare-fun res!524709 () Bool)

(declare-fun e!431773 () Bool)

(assert (=> b!775844 (=> (not res!524709) (not e!431773))))

(assert (=> b!775844 (= res!524709 e!431771)))

(declare-fun c!85966 () Bool)

(assert (=> b!775844 (= c!85966 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!775845 () Bool)

(assert (=> b!775845 (= e!431772 e!431773)))

(declare-fun res!524710 () Bool)

(assert (=> b!775845 (=> (not res!524710) (not e!431773))))

(declare-fun lt!345628 () SeekEntryResult!7944)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42497 (_ BitVec 32)) SeekEntryResult!7944)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775845 (= res!524710 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20344 a!3186) j!159) mask!3328) (select (arr!20344 a!3186) j!159) a!3186 mask!3328) lt!345628))))

(assert (=> b!775845 (= lt!345628 (Intermediate!7944 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!775846 () Bool)

(declare-fun e!431774 () Bool)

(declare-fun e!431767 () Bool)

(assert (=> b!775846 (= e!431774 (not e!431767))))

(declare-fun res!524708 () Bool)

(assert (=> b!775846 (=> res!524708 e!431767)))

(declare-fun lt!345626 () SeekEntryResult!7944)

(get-info :version)

(assert (=> b!775846 (= res!524708 (or (not ((_ is Intermediate!7944) lt!345626)) (bvslt x!1131 (x!65087 lt!345626)) (not (= x!1131 (x!65087 lt!345626))) (not (= index!1321 (index!34146 lt!345626)))))))

(assert (=> b!775846 e!431769))

(declare-fun res!524714 () Bool)

(assert (=> b!775846 (=> (not res!524714) (not e!431769))))

(assert (=> b!775846 (= res!524714 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26782 0))(
  ( (Unit!26783) )
))
(declare-fun lt!345621 () Unit!26782)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26782)

(assert (=> b!775846 (= lt!345621 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!775847 () Bool)

(assert (=> b!775847 (= e!431771 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20344 a!3186) j!159) a!3186 mask!3328) lt!345628))))

(declare-fun b!775848 () Bool)

(declare-fun res!524721 () Bool)

(assert (=> b!775848 (=> (not res!524721) (not e!431768))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!775848 (= res!524721 (validKeyInArray!0 k0!2102))))

(declare-fun b!775849 () Bool)

(declare-fun res!524716 () Bool)

(assert (=> b!775849 (=> (not res!524716) (not e!431768))))

(assert (=> b!775849 (= res!524716 (validKeyInArray!0 (select (arr!20344 a!3186) j!159)))))

(declare-fun b!775850 () Bool)

(assert (=> b!775850 (= e!431773 e!431774)))

(declare-fun res!524715 () Bool)

(assert (=> b!775850 (=> (not res!524715) (not e!431774))))

(declare-fun lt!345624 () SeekEntryResult!7944)

(assert (=> b!775850 (= res!524715 (= lt!345624 lt!345626))))

(declare-fun lt!345627 () array!42497)

(declare-fun lt!345622 () (_ BitVec 64))

(assert (=> b!775850 (= lt!345626 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345622 lt!345627 mask!3328))))

(assert (=> b!775850 (= lt!345624 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345622 mask!3328) lt!345622 lt!345627 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!775850 (= lt!345622 (select (store (arr!20344 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!775850 (= lt!345627 (array!42498 (store (arr!20344 a!3186) i!1173 k0!2102) (size!20765 a!3186)))))

(declare-fun b!775851 () Bool)

(assert (=> b!775851 (= e!431767 true)))

(declare-fun lt!345625 () SeekEntryResult!7944)

(assert (=> b!775851 (= lt!345625 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20344 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!775852 () Bool)

(declare-fun res!524717 () Bool)

(assert (=> b!775852 (=> (not res!524717) (not e!431772))))

(declare-datatypes ((List!14346 0))(
  ( (Nil!14343) (Cons!14342 (h!15450 (_ BitVec 64)) (t!20661 List!14346)) )
))
(declare-fun arrayNoDuplicates!0 (array!42497 (_ BitVec 32) List!14346) Bool)

(assert (=> b!775852 (= res!524717 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14343))))

(declare-fun b!775853 () Bool)

(assert (=> b!775853 (= e!431768 e!431772)))

(declare-fun res!524718 () Bool)

(assert (=> b!775853 (=> (not res!524718) (not e!431772))))

(declare-fun lt!345629 () SeekEntryResult!7944)

(assert (=> b!775853 (= res!524718 (or (= lt!345629 (MissingZero!7944 i!1173)) (= lt!345629 (MissingVacant!7944 i!1173))))))

(assert (=> b!775853 (= lt!345629 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!775854 () Bool)

(declare-fun res!524711 () Bool)

(assert (=> b!775854 (=> (not res!524711) (not e!431773))))

(assert (=> b!775854 (= res!524711 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20344 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!775855 () Bool)

(declare-fun res!524713 () Bool)

(assert (=> b!775855 (=> (not res!524713) (not e!431768))))

(assert (=> b!775855 (= res!524713 (and (= (size!20765 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20765 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20765 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!775856 () Bool)

(declare-fun res!524722 () Bool)

(assert (=> b!775856 (=> (not res!524722) (not e!431768))))

(declare-fun arrayContainsKey!0 (array!42497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!775856 (= res!524722 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!775857 () Bool)

(assert (=> b!775857 (= e!431766 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20344 a!3186) j!159) a!3186 mask!3328) lt!345623))))

(assert (= (and start!67142 res!524719) b!775855))

(assert (= (and b!775855 res!524713) b!775849))

(assert (= (and b!775849 res!524716) b!775848))

(assert (= (and b!775848 res!524721) b!775856))

(assert (= (and b!775856 res!524722) b!775853))

(assert (= (and b!775853 res!524718) b!775840))

(assert (= (and b!775840 res!524723) b!775852))

(assert (= (and b!775852 res!524717) b!775842))

(assert (= (and b!775842 res!524712) b!775845))

(assert (= (and b!775845 res!524710) b!775854))

(assert (= (and b!775854 res!524711) b!775844))

(assert (= (and b!775844 c!85966) b!775847))

(assert (= (and b!775844 (not c!85966)) b!775841))

(assert (= (and b!775844 res!524709) b!775850))

(assert (= (and b!775850 res!524715) b!775846))

(assert (= (and b!775846 res!524714) b!775843))

(assert (= (and b!775843 res!524720) b!775857))

(assert (= (and b!775846 (not res!524708)) b!775851))

(declare-fun m!720009 () Bool)

(assert (=> b!775846 m!720009))

(declare-fun m!720011 () Bool)

(assert (=> b!775846 m!720011))

(declare-fun m!720013 () Bool)

(assert (=> b!775847 m!720013))

(assert (=> b!775847 m!720013))

(declare-fun m!720015 () Bool)

(assert (=> b!775847 m!720015))

(declare-fun m!720017 () Bool)

(assert (=> b!775853 m!720017))

(assert (=> b!775841 m!720013))

(assert (=> b!775841 m!720013))

(declare-fun m!720019 () Bool)

(assert (=> b!775841 m!720019))

(declare-fun m!720021 () Bool)

(assert (=> start!67142 m!720021))

(declare-fun m!720023 () Bool)

(assert (=> start!67142 m!720023))

(declare-fun m!720025 () Bool)

(assert (=> b!775850 m!720025))

(declare-fun m!720027 () Bool)

(assert (=> b!775850 m!720027))

(assert (=> b!775850 m!720025))

(declare-fun m!720029 () Bool)

(assert (=> b!775850 m!720029))

(declare-fun m!720031 () Bool)

(assert (=> b!775850 m!720031))

(declare-fun m!720033 () Bool)

(assert (=> b!775850 m!720033))

(assert (=> b!775849 m!720013))

(assert (=> b!775849 m!720013))

(declare-fun m!720035 () Bool)

(assert (=> b!775849 m!720035))

(assert (=> b!775857 m!720013))

(assert (=> b!775857 m!720013))

(declare-fun m!720037 () Bool)

(assert (=> b!775857 m!720037))

(declare-fun m!720039 () Bool)

(assert (=> b!775856 m!720039))

(assert (=> b!775845 m!720013))

(assert (=> b!775845 m!720013))

(declare-fun m!720041 () Bool)

(assert (=> b!775845 m!720041))

(assert (=> b!775845 m!720041))

(assert (=> b!775845 m!720013))

(declare-fun m!720043 () Bool)

(assert (=> b!775845 m!720043))

(declare-fun m!720045 () Bool)

(assert (=> b!775840 m!720045))

(declare-fun m!720047 () Bool)

(assert (=> b!775848 m!720047))

(assert (=> b!775843 m!720013))

(assert (=> b!775843 m!720013))

(declare-fun m!720049 () Bool)

(assert (=> b!775843 m!720049))

(declare-fun m!720051 () Bool)

(assert (=> b!775854 m!720051))

(declare-fun m!720053 () Bool)

(assert (=> b!775852 m!720053))

(assert (=> b!775851 m!720013))

(assert (=> b!775851 m!720013))

(assert (=> b!775851 m!720019))

(check-sat (not b!775840) (not b!775845) (not b!775848) (not b!775843) (not b!775847) (not b!775851) (not b!775856) (not b!775852) (not start!67142) (not b!775841) (not b!775853) (not b!775857) (not b!775849) (not b!775850) (not b!775846))
(check-sat)
