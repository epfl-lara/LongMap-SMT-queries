; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52836 () Bool)

(assert start!52836)

(declare-fun b!575897 () Bool)

(declare-fun res!364208 () Bool)

(declare-fun e!331383 () Bool)

(assert (=> b!575897 (=> (not res!364208) (not e!331383))))

(declare-datatypes ((array!35928 0))(
  ( (array!35929 (arr!17245 (Array (_ BitVec 32) (_ BitVec 64))) (size!17609 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35928)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35928 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575897 (= res!364208 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575898 () Bool)

(declare-fun res!364218 () Bool)

(assert (=> b!575898 (=> (not res!364218) (not e!331383))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575898 (= res!364218 (validKeyInArray!0 k0!1914))))

(declare-fun b!575899 () Bool)

(declare-fun res!364215 () Bool)

(declare-fun e!331380 () Bool)

(assert (=> b!575899 (=> (not res!364215) (not e!331380))))

(declare-datatypes ((List!11232 0))(
  ( (Nil!11229) (Cons!11228 (h!12270 (_ BitVec 64)) (t!17452 List!11232)) )
))
(declare-fun arrayNoDuplicates!0 (array!35928 (_ BitVec 32) List!11232) Bool)

(assert (=> b!575899 (= res!364215 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11229))))

(declare-fun b!575900 () Bool)

(declare-fun e!331382 () Bool)

(declare-fun e!331381 () Bool)

(assert (=> b!575900 (= e!331382 e!331381)))

(declare-fun res!364212 () Bool)

(assert (=> b!575900 (=> res!364212 e!331381)))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5650 0))(
  ( (MissingZero!5650 (index!24827 (_ BitVec 32))) (Found!5650 (index!24828 (_ BitVec 32))) (Intermediate!5650 (undefined!6462 Bool) (index!24829 (_ BitVec 32)) (x!53870 (_ BitVec 32))) (Undefined!5650) (MissingVacant!5650 (index!24830 (_ BitVec 32))) )
))
(declare-fun lt!263441 () SeekEntryResult!5650)

(declare-fun lt!263446 () SeekEntryResult!5650)

(declare-fun lt!263437 () (_ BitVec 64))

(declare-fun lt!263449 () SeekEntryResult!5650)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!575900 (= res!364212 (or (bvslt (index!24829 lt!263446) #b00000000000000000000000000000000) (bvsge (index!24829 lt!263446) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53870 lt!263446) #b01111111111111111111111111111110) (bvslt (x!53870 lt!263446) #b00000000000000000000000000000000) (not (= lt!263437 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17245 a!3118) i!1132 k0!1914) (index!24829 lt!263446)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!263441 lt!263449))))))

(declare-fun lt!263439 () SeekEntryResult!5650)

(declare-fun lt!263447 () SeekEntryResult!5650)

(assert (=> b!575900 (= lt!263439 lt!263447)))

(declare-fun lt!263442 () array!35928)

(declare-fun lt!263445 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35928 (_ BitVec 32)) SeekEntryResult!5650)

(assert (=> b!575900 (= lt!263447 (seekKeyOrZeroReturnVacant!0 (x!53870 lt!263446) (index!24829 lt!263446) (index!24829 lt!263446) lt!263445 lt!263442 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35928 (_ BitVec 32)) SeekEntryResult!5650)

(assert (=> b!575900 (= lt!263439 (seekEntryOrOpen!0 lt!263445 lt!263442 mask!3119))))

(declare-fun lt!263436 () SeekEntryResult!5650)

(assert (=> b!575900 (= lt!263436 lt!263441)))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!575900 (= lt!263441 (seekKeyOrZeroReturnVacant!0 (x!53870 lt!263446) (index!24829 lt!263446) (index!24829 lt!263446) (select (arr!17245 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!575901 () Bool)

(declare-fun e!331377 () Bool)

(declare-fun e!331379 () Bool)

(assert (=> b!575901 (= e!331377 (not e!331379))))

(declare-fun res!364210 () Bool)

(assert (=> b!575901 (=> res!364210 e!331379)))

(get-info :version)

(assert (=> b!575901 (= res!364210 (or (undefined!6462 lt!263446) (not ((_ is Intermediate!5650) lt!263446))))))

(assert (=> b!575901 (= lt!263436 lt!263449)))

(assert (=> b!575901 (= lt!263449 (Found!5650 j!142))))

(assert (=> b!575901 (= lt!263436 (seekEntryOrOpen!0 (select (arr!17245 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35928 (_ BitVec 32)) Bool)

(assert (=> b!575901 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18073 0))(
  ( (Unit!18074) )
))
(declare-fun lt!263440 () Unit!18073)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35928 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18073)

(assert (=> b!575901 (= lt!263440 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!575902 () Bool)

(assert (=> b!575902 (= e!331379 e!331382)))

(declare-fun res!364216 () Bool)

(assert (=> b!575902 (=> res!364216 e!331382)))

(assert (=> b!575902 (= res!364216 (or (= lt!263437 (select (arr!17245 a!3118) j!142)) (= lt!263437 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!575902 (= lt!263437 (select (arr!17245 a!3118) (index!24829 lt!263446)))))

(declare-fun res!364209 () Bool)

(assert (=> start!52836 (=> (not res!364209) (not e!331383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52836 (= res!364209 (validMask!0 mask!3119))))

(assert (=> start!52836 e!331383))

(assert (=> start!52836 true))

(declare-fun array_inv!13104 (array!35928) Bool)

(assert (=> start!52836 (array_inv!13104 a!3118)))

(declare-fun b!575903 () Bool)

(assert (=> b!575903 (= e!331380 e!331377)))

(declare-fun res!364213 () Bool)

(assert (=> b!575903 (=> (not res!364213) (not e!331377))))

(declare-fun lt!263448 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35928 (_ BitVec 32)) SeekEntryResult!5650)

(assert (=> b!575903 (= res!364213 (= lt!263446 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263448 lt!263445 lt!263442 mask!3119)))))

(declare-fun lt!263438 () (_ BitVec 32))

(assert (=> b!575903 (= lt!263446 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263438 (select (arr!17245 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575903 (= lt!263448 (toIndex!0 lt!263445 mask!3119))))

(assert (=> b!575903 (= lt!263445 (select (store (arr!17245 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!575903 (= lt!263438 (toIndex!0 (select (arr!17245 a!3118) j!142) mask!3119))))

(assert (=> b!575903 (= lt!263442 (array!35929 (store (arr!17245 a!3118) i!1132 k0!1914) (size!17609 a!3118)))))

(declare-fun b!575904 () Bool)

(declare-fun res!364219 () Bool)

(assert (=> b!575904 (=> (not res!364219) (not e!331383))))

(assert (=> b!575904 (= res!364219 (validKeyInArray!0 (select (arr!17245 a!3118) j!142)))))

(declare-fun b!575905 () Bool)

(declare-fun res!364214 () Bool)

(assert (=> b!575905 (=> (not res!364214) (not e!331380))))

(assert (=> b!575905 (= res!364214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575906 () Bool)

(declare-fun res!364211 () Bool)

(assert (=> b!575906 (=> (not res!364211) (not e!331383))))

(assert (=> b!575906 (= res!364211 (and (= (size!17609 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17609 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17609 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!575907 () Bool)

(assert (=> b!575907 (= e!331383 e!331380)))

(declare-fun res!364217 () Bool)

(assert (=> b!575907 (=> (not res!364217) (not e!331380))))

(declare-fun lt!263443 () SeekEntryResult!5650)

(assert (=> b!575907 (= res!364217 (or (= lt!263443 (MissingZero!5650 i!1132)) (= lt!263443 (MissingVacant!5650 i!1132))))))

(assert (=> b!575907 (= lt!263443 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!575908 () Bool)

(assert (=> b!575908 (= e!331381 (= lt!263436 lt!263439))))

(assert (=> b!575908 (= lt!263441 lt!263447)))

(declare-fun lt!263444 () Unit!18073)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35928 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18073)

(assert (=> b!575908 (= lt!263444 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!53870 lt!263446) (index!24829 lt!263446) (index!24829 lt!263446) mask!3119))))

(assert (= (and start!52836 res!364209) b!575906))

(assert (= (and b!575906 res!364211) b!575904))

(assert (= (and b!575904 res!364219) b!575898))

(assert (= (and b!575898 res!364218) b!575897))

(assert (= (and b!575897 res!364208) b!575907))

(assert (= (and b!575907 res!364217) b!575905))

(assert (= (and b!575905 res!364214) b!575899))

(assert (= (and b!575899 res!364215) b!575903))

(assert (= (and b!575903 res!364213) b!575901))

(assert (= (and b!575901 (not res!364210)) b!575902))

(assert (= (and b!575902 (not res!364216)) b!575900))

(assert (= (and b!575900 (not res!364212)) b!575908))

(declare-fun m!554975 () Bool)

(assert (=> b!575897 m!554975))

(declare-fun m!554977 () Bool)

(assert (=> b!575903 m!554977))

(declare-fun m!554979 () Bool)

(assert (=> b!575903 m!554979))

(assert (=> b!575903 m!554977))

(declare-fun m!554981 () Bool)

(assert (=> b!575903 m!554981))

(declare-fun m!554983 () Bool)

(assert (=> b!575903 m!554983))

(declare-fun m!554985 () Bool)

(assert (=> b!575903 m!554985))

(declare-fun m!554987 () Bool)

(assert (=> b!575903 m!554987))

(assert (=> b!575903 m!554977))

(declare-fun m!554989 () Bool)

(assert (=> b!575903 m!554989))

(declare-fun m!554991 () Bool)

(assert (=> b!575900 m!554991))

(declare-fun m!554993 () Bool)

(assert (=> b!575900 m!554993))

(assert (=> b!575900 m!554987))

(declare-fun m!554995 () Bool)

(assert (=> b!575900 m!554995))

(assert (=> b!575900 m!554977))

(declare-fun m!554997 () Bool)

(assert (=> b!575900 m!554997))

(assert (=> b!575900 m!554977))

(declare-fun m!554999 () Bool)

(assert (=> b!575908 m!554999))

(assert (=> b!575904 m!554977))

(assert (=> b!575904 m!554977))

(declare-fun m!555001 () Bool)

(assert (=> b!575904 m!555001))

(assert (=> b!575901 m!554977))

(assert (=> b!575901 m!554977))

(declare-fun m!555003 () Bool)

(assert (=> b!575901 m!555003))

(declare-fun m!555005 () Bool)

(assert (=> b!575901 m!555005))

(declare-fun m!555007 () Bool)

(assert (=> b!575901 m!555007))

(declare-fun m!555009 () Bool)

(assert (=> b!575898 m!555009))

(declare-fun m!555011 () Bool)

(assert (=> start!52836 m!555011))

(declare-fun m!555013 () Bool)

(assert (=> start!52836 m!555013))

(declare-fun m!555015 () Bool)

(assert (=> b!575899 m!555015))

(assert (=> b!575902 m!554977))

(declare-fun m!555017 () Bool)

(assert (=> b!575902 m!555017))

(declare-fun m!555019 () Bool)

(assert (=> b!575905 m!555019))

(declare-fun m!555021 () Bool)

(assert (=> b!575907 m!555021))

(check-sat (not b!575905) (not b!575900) (not b!575901) (not b!575907) (not b!575908) (not b!575898) (not b!575904) (not b!575899) (not b!575903) (not start!52836) (not b!575897))
(check-sat)
