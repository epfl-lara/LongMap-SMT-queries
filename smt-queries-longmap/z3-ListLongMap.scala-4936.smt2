; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67970 () Bool)

(assert start!67970)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!439527 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42903 0))(
  ( (array!42904 (arr!20537 (Array (_ BitVec 32) (_ BitVec 64))) (size!20958 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42903)

(declare-fun b!790847 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8134 0))(
  ( (MissingZero!8134 (index!34904 (_ BitVec 32))) (Found!8134 (index!34905 (_ BitVec 32))) (Intermediate!8134 (undefined!8946 Bool) (index!34906 (_ BitVec 32)) (x!65855 (_ BitVec 32))) (Undefined!8134) (MissingVacant!8134 (index!34907 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42903 (_ BitVec 32)) SeekEntryResult!8134)

(assert (=> b!790847 (= e!439527 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20537 a!3186) j!159) a!3186 mask!3328) (Found!8134 j!159)))))

(declare-fun b!790848 () Bool)

(declare-fun e!439526 () Bool)

(declare-fun e!439523 () Bool)

(assert (=> b!790848 (= e!439526 e!439523)))

(declare-fun res!535771 () Bool)

(assert (=> b!790848 (=> (not res!535771) (not e!439523))))

(declare-fun lt!352900 () array!42903)

(declare-fun lt!352898 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42903 (_ BitVec 32)) SeekEntryResult!8134)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!790848 (= res!535771 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352898 mask!3328) lt!352898 lt!352900 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352898 lt!352900 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!790848 (= lt!352898 (select (store (arr!20537 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!790848 (= lt!352900 (array!42904 (store (arr!20537 a!3186) i!1173 k0!2102) (size!20958 a!3186)))))

(declare-fun b!790849 () Bool)

(assert (=> b!790849 (= e!439523 (not true))))

(declare-fun e!439524 () Bool)

(assert (=> b!790849 e!439524))

(declare-fun res!535783 () Bool)

(assert (=> b!790849 (=> (not res!535783) (not e!439524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42903 (_ BitVec 32)) Bool)

(assert (=> b!790849 (= res!535783 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!27392 0))(
  ( (Unit!27393) )
))
(declare-fun lt!352896 () Unit!27392)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42903 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27392)

(assert (=> b!790849 (= lt!352896 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!790850 () Bool)

(declare-fun res!535785 () Bool)

(declare-fun e!439525 () Bool)

(assert (=> b!790850 (=> (not res!535785) (not e!439525))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!790850 (= res!535785 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20958 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20958 a!3186))))))

(declare-fun b!790851 () Bool)

(declare-fun e!439528 () Bool)

(assert (=> b!790851 (= e!439524 e!439528)))

(declare-fun res!535780 () Bool)

(assert (=> b!790851 (=> (not res!535780) (not e!439528))))

(declare-fun lt!352899 () SeekEntryResult!8134)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42903 (_ BitVec 32)) SeekEntryResult!8134)

(assert (=> b!790851 (= res!535780 (= (seekEntryOrOpen!0 (select (arr!20537 a!3186) j!159) a!3186 mask!3328) lt!352899))))

(assert (=> b!790851 (= lt!352899 (Found!8134 j!159))))

(declare-fun b!790852 () Bool)

(declare-fun res!535773 () Bool)

(declare-fun e!439522 () Bool)

(assert (=> b!790852 (=> (not res!535773) (not e!439522))))

(assert (=> b!790852 (= res!535773 (and (= (size!20958 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20958 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20958 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!790853 () Bool)

(declare-fun res!535778 () Bool)

(assert (=> b!790853 (=> (not res!535778) (not e!439526))))

(assert (=> b!790853 (= res!535778 e!439527)))

(declare-fun c!87948 () Bool)

(assert (=> b!790853 (= c!87948 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!790854 () Bool)

(declare-fun res!535772 () Bool)

(assert (=> b!790854 (=> (not res!535772) (not e!439525))))

(declare-datatypes ((List!14578 0))(
  ( (Nil!14575) (Cons!14574 (h!15703 (_ BitVec 64)) (t!20884 List!14578)) )
))
(declare-fun arrayNoDuplicates!0 (array!42903 (_ BitVec 32) List!14578) Bool)

(assert (=> b!790854 (= res!535772 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14575))))

(declare-fun b!790846 () Bool)

(declare-fun res!535784 () Bool)

(assert (=> b!790846 (=> (not res!535784) (not e!439525))))

(assert (=> b!790846 (= res!535784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!535776 () Bool)

(assert (=> start!67970 (=> (not res!535776) (not e!439522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67970 (= res!535776 (validMask!0 mask!3328))))

(assert (=> start!67970 e!439522))

(assert (=> start!67970 true))

(declare-fun array_inv!16420 (array!42903) Bool)

(assert (=> start!67970 (array_inv!16420 a!3186)))

(declare-fun b!790855 () Bool)

(assert (=> b!790855 (= e!439522 e!439525)))

(declare-fun res!535775 () Bool)

(assert (=> b!790855 (=> (not res!535775) (not e!439525))))

(declare-fun lt!352901 () SeekEntryResult!8134)

(assert (=> b!790855 (= res!535775 (or (= lt!352901 (MissingZero!8134 i!1173)) (= lt!352901 (MissingVacant!8134 i!1173))))))

(assert (=> b!790855 (= lt!352901 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!790856 () Bool)

(declare-fun res!535779 () Bool)

(assert (=> b!790856 (=> (not res!535779) (not e!439526))))

(assert (=> b!790856 (= res!535779 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20537 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!790857 () Bool)

(declare-fun res!535781 () Bool)

(assert (=> b!790857 (=> (not res!535781) (not e!439522))))

(declare-fun arrayContainsKey!0 (array!42903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!790857 (= res!535781 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!790858 () Bool)

(assert (=> b!790858 (= e!439525 e!439526)))

(declare-fun res!535777 () Bool)

(assert (=> b!790858 (=> (not res!535777) (not e!439526))))

(declare-fun lt!352897 () SeekEntryResult!8134)

(assert (=> b!790858 (= res!535777 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20537 a!3186) j!159) mask!3328) (select (arr!20537 a!3186) j!159) a!3186 mask!3328) lt!352897))))

(assert (=> b!790858 (= lt!352897 (Intermediate!8134 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!790859 () Bool)

(declare-fun res!535774 () Bool)

(assert (=> b!790859 (=> (not res!535774) (not e!439522))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!790859 (= res!535774 (validKeyInArray!0 k0!2102))))

(declare-fun b!790860 () Bool)

(assert (=> b!790860 (= e!439527 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20537 a!3186) j!159) a!3186 mask!3328) lt!352897))))

(declare-fun b!790861 () Bool)

(declare-fun res!535782 () Bool)

(assert (=> b!790861 (=> (not res!535782) (not e!439522))))

(assert (=> b!790861 (= res!535782 (validKeyInArray!0 (select (arr!20537 a!3186) j!159)))))

(declare-fun b!790862 () Bool)

(assert (=> b!790862 (= e!439528 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20537 a!3186) j!159) a!3186 mask!3328) lt!352899))))

(assert (= (and start!67970 res!535776) b!790852))

(assert (= (and b!790852 res!535773) b!790861))

(assert (= (and b!790861 res!535782) b!790859))

(assert (= (and b!790859 res!535774) b!790857))

(assert (= (and b!790857 res!535781) b!790855))

(assert (= (and b!790855 res!535775) b!790846))

(assert (= (and b!790846 res!535784) b!790854))

(assert (= (and b!790854 res!535772) b!790850))

(assert (= (and b!790850 res!535785) b!790858))

(assert (= (and b!790858 res!535777) b!790856))

(assert (= (and b!790856 res!535779) b!790853))

(assert (= (and b!790853 c!87948) b!790860))

(assert (= (and b!790853 (not c!87948)) b!790847))

(assert (= (and b!790853 res!535778) b!790848))

(assert (= (and b!790848 res!535771) b!790849))

(assert (= (and b!790849 res!535783) b!790851))

(assert (= (and b!790851 res!535780) b!790862))

(declare-fun m!731109 () Bool)

(assert (=> b!790858 m!731109))

(assert (=> b!790858 m!731109))

(declare-fun m!731111 () Bool)

(assert (=> b!790858 m!731111))

(assert (=> b!790858 m!731111))

(assert (=> b!790858 m!731109))

(declare-fun m!731113 () Bool)

(assert (=> b!790858 m!731113))

(assert (=> b!790851 m!731109))

(assert (=> b!790851 m!731109))

(declare-fun m!731115 () Bool)

(assert (=> b!790851 m!731115))

(assert (=> b!790861 m!731109))

(assert (=> b!790861 m!731109))

(declare-fun m!731117 () Bool)

(assert (=> b!790861 m!731117))

(declare-fun m!731119 () Bool)

(assert (=> b!790857 m!731119))

(assert (=> b!790847 m!731109))

(assert (=> b!790847 m!731109))

(declare-fun m!731121 () Bool)

(assert (=> b!790847 m!731121))

(assert (=> b!790862 m!731109))

(assert (=> b!790862 m!731109))

(declare-fun m!731123 () Bool)

(assert (=> b!790862 m!731123))

(declare-fun m!731125 () Bool)

(assert (=> b!790856 m!731125))

(declare-fun m!731127 () Bool)

(assert (=> b!790848 m!731127))

(declare-fun m!731129 () Bool)

(assert (=> b!790848 m!731129))

(declare-fun m!731131 () Bool)

(assert (=> b!790848 m!731131))

(declare-fun m!731133 () Bool)

(assert (=> b!790848 m!731133))

(declare-fun m!731135 () Bool)

(assert (=> b!790848 m!731135))

(assert (=> b!790848 m!731129))

(declare-fun m!731137 () Bool)

(assert (=> b!790846 m!731137))

(assert (=> b!790860 m!731109))

(assert (=> b!790860 m!731109))

(declare-fun m!731139 () Bool)

(assert (=> b!790860 m!731139))

(declare-fun m!731141 () Bool)

(assert (=> b!790854 m!731141))

(declare-fun m!731143 () Bool)

(assert (=> b!790855 m!731143))

(declare-fun m!731145 () Bool)

(assert (=> start!67970 m!731145))

(declare-fun m!731147 () Bool)

(assert (=> start!67970 m!731147))

(declare-fun m!731149 () Bool)

(assert (=> b!790859 m!731149))

(declare-fun m!731151 () Bool)

(assert (=> b!790849 m!731151))

(declare-fun m!731153 () Bool)

(assert (=> b!790849 m!731153))

(check-sat (not b!790848) (not b!790855) (not start!67970) (not b!790857) (not b!790860) (not b!790849) (not b!790846) (not b!790847) (not b!790862) (not b!790854) (not b!790858) (not b!790851) (not b!790861) (not b!790859))
(check-sat)
