; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65664 () Bool)

(assert start!65664)

(declare-fun b!748853 () Bool)

(declare-fun res!504905 () Bool)

(declare-fun e!418080 () Bool)

(assert (=> b!748853 (=> (not res!504905) (not e!418080))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!748853 (= res!504905 (validKeyInArray!0 k0!2102))))

(declare-fun b!748854 () Bool)

(declare-datatypes ((Unit!25633 0))(
  ( (Unit!25634) )
))
(declare-fun e!418081 () Unit!25633)

(declare-fun Unit!25635 () Unit!25633)

(assert (=> b!748854 (= e!418081 Unit!25635)))

(declare-fun b!748855 () Bool)

(declare-fun res!504910 () Bool)

(declare-fun e!418083 () Bool)

(assert (=> b!748855 (=> (not res!504910) (not e!418083))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41707 0))(
  ( (array!41708 (arr!19963 (Array (_ BitVec 32) (_ BitVec 64))) (size!20383 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41707)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!748855 (= res!504910 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19963 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!418077 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!748856 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7519 0))(
  ( (MissingZero!7519 (index!32444 (_ BitVec 32))) (Found!7519 (index!32445 (_ BitVec 32))) (Intermediate!7519 (undefined!8331 Bool) (index!32446 (_ BitVec 32)) (x!63545 (_ BitVec 32))) (Undefined!7519) (MissingVacant!7519 (index!32447 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41707 (_ BitVec 32)) SeekEntryResult!7519)

(assert (=> b!748856 (= e!418077 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19963 a!3186) j!159) a!3186 mask!3328) (Found!7519 j!159)))))

(declare-fun b!748858 () Bool)

(declare-fun e!418078 () Bool)

(assert (=> b!748858 (= e!418078 true)))

(assert (=> b!748858 (= (select (store (arr!19963 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332860 () Unit!25633)

(assert (=> b!748858 (= lt!332860 e!418081)))

(declare-fun c!82361 () Bool)

(assert (=> b!748858 (= c!82361 (= (select (store (arr!19963 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!748859 () Bool)

(declare-fun e!418082 () Bool)

(assert (=> b!748859 (= e!418083 e!418082)))

(declare-fun res!504915 () Bool)

(assert (=> b!748859 (=> (not res!504915) (not e!418082))))

(declare-fun lt!332867 () SeekEntryResult!7519)

(declare-fun lt!332859 () SeekEntryResult!7519)

(assert (=> b!748859 (= res!504915 (= lt!332867 lt!332859))))

(declare-fun lt!332861 () (_ BitVec 64))

(declare-fun lt!332866 () array!41707)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41707 (_ BitVec 32)) SeekEntryResult!7519)

(assert (=> b!748859 (= lt!332859 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332861 lt!332866 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!748859 (= lt!332867 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332861 mask!3328) lt!332861 lt!332866 mask!3328))))

(assert (=> b!748859 (= lt!332861 (select (store (arr!19963 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!748859 (= lt!332866 (array!41708 (store (arr!19963 a!3186) i!1173 k0!2102) (size!20383 a!3186)))))

(declare-fun b!748860 () Bool)

(declare-fun res!504902 () Bool)

(declare-fun e!418076 () Bool)

(assert (=> b!748860 (=> (not res!504902) (not e!418076))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!748860 (= res!504902 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20383 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20383 a!3186))))))

(declare-fun lt!332863 () SeekEntryResult!7519)

(declare-fun b!748861 () Bool)

(assert (=> b!748861 (= e!418077 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19963 a!3186) j!159) a!3186 mask!3328) lt!332863))))

(declare-fun b!748862 () Bool)

(declare-fun res!504912 () Bool)

(assert (=> b!748862 (=> (not res!504912) (not e!418076))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41707 (_ BitVec 32)) Bool)

(assert (=> b!748862 (= res!504912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!748863 () Bool)

(declare-fun res!504900 () Bool)

(assert (=> b!748863 (=> (not res!504900) (not e!418080))))

(assert (=> b!748863 (= res!504900 (validKeyInArray!0 (select (arr!19963 a!3186) j!159)))))

(declare-fun b!748864 () Bool)

(declare-fun res!504904 () Bool)

(assert (=> b!748864 (=> (not res!504904) (not e!418080))))

(declare-fun arrayContainsKey!0 (array!41707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!748864 (= res!504904 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!748865 () Bool)

(declare-fun Unit!25636 () Unit!25633)

(assert (=> b!748865 (= e!418081 Unit!25636)))

(assert (=> b!748865 false))

(declare-fun lt!332864 () SeekEntryResult!7519)

(declare-fun e!418079 () Bool)

(declare-fun b!748857 () Bool)

(assert (=> b!748857 (= e!418079 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19963 a!3186) j!159) a!3186 mask!3328) lt!332864))))

(declare-fun res!504908 () Bool)

(assert (=> start!65664 (=> (not res!504908) (not e!418080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65664 (= res!504908 (validMask!0 mask!3328))))

(assert (=> start!65664 e!418080))

(assert (=> start!65664 true))

(declare-fun array_inv!15822 (array!41707) Bool)

(assert (=> start!65664 (array_inv!15822 a!3186)))

(declare-fun b!748866 () Bool)

(declare-fun res!504914 () Bool)

(assert (=> b!748866 (=> (not res!504914) (not e!418076))))

(declare-datatypes ((List!13872 0))(
  ( (Nil!13869) (Cons!13868 (h!14946 (_ BitVec 64)) (t!20179 List!13872)) )
))
(declare-fun arrayNoDuplicates!0 (array!41707 (_ BitVec 32) List!13872) Bool)

(assert (=> b!748866 (= res!504914 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13869))))

(declare-fun b!748867 () Bool)

(assert (=> b!748867 (= e!418076 e!418083)))

(declare-fun res!504901 () Bool)

(assert (=> b!748867 (=> (not res!504901) (not e!418083))))

(assert (=> b!748867 (= res!504901 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19963 a!3186) j!159) mask!3328) (select (arr!19963 a!3186) j!159) a!3186 mask!3328) lt!332863))))

(assert (=> b!748867 (= lt!332863 (Intermediate!7519 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!748868 () Bool)

(declare-fun res!504916 () Bool)

(assert (=> b!748868 (=> res!504916 e!418078)))

(assert (=> b!748868 (= res!504916 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19963 a!3186) j!159) a!3186 mask!3328) lt!332864)))))

(declare-fun b!748869 () Bool)

(declare-fun res!504906 () Bool)

(assert (=> b!748869 (=> (not res!504906) (not e!418083))))

(assert (=> b!748869 (= res!504906 e!418077)))

(declare-fun c!82360 () Bool)

(assert (=> b!748869 (= c!82360 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!748870 () Bool)

(assert (=> b!748870 (= e!418082 (not e!418078))))

(declare-fun res!504909 () Bool)

(assert (=> b!748870 (=> res!504909 e!418078)))

(get-info :version)

(assert (=> b!748870 (= res!504909 (or (not ((_ is Intermediate!7519) lt!332859)) (bvslt x!1131 (x!63545 lt!332859)) (not (= x!1131 (x!63545 lt!332859))) (not (= index!1321 (index!32446 lt!332859)))))))

(assert (=> b!748870 e!418079))

(declare-fun res!504911 () Bool)

(assert (=> b!748870 (=> (not res!504911) (not e!418079))))

(declare-fun lt!332862 () SeekEntryResult!7519)

(assert (=> b!748870 (= res!504911 (= lt!332862 lt!332864))))

(assert (=> b!748870 (= lt!332864 (Found!7519 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41707 (_ BitVec 32)) SeekEntryResult!7519)

(assert (=> b!748870 (= lt!332862 (seekEntryOrOpen!0 (select (arr!19963 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!748870 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332868 () Unit!25633)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41707 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25633)

(assert (=> b!748870 (= lt!332868 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!748871 () Bool)

(declare-fun res!504913 () Bool)

(assert (=> b!748871 (=> res!504913 e!418078)))

(assert (=> b!748871 (= res!504913 (= (select (store (arr!19963 a!3186) i!1173 k0!2102) index!1321) lt!332861))))

(declare-fun b!748872 () Bool)

(declare-fun res!504903 () Bool)

(assert (=> b!748872 (=> (not res!504903) (not e!418080))))

(assert (=> b!748872 (= res!504903 (and (= (size!20383 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20383 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20383 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!748873 () Bool)

(assert (=> b!748873 (= e!418080 e!418076)))

(declare-fun res!504907 () Bool)

(assert (=> b!748873 (=> (not res!504907) (not e!418076))))

(declare-fun lt!332865 () SeekEntryResult!7519)

(assert (=> b!748873 (= res!504907 (or (= lt!332865 (MissingZero!7519 i!1173)) (= lt!332865 (MissingVacant!7519 i!1173))))))

(assert (=> b!748873 (= lt!332865 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!65664 res!504908) b!748872))

(assert (= (and b!748872 res!504903) b!748863))

(assert (= (and b!748863 res!504900) b!748853))

(assert (= (and b!748853 res!504905) b!748864))

(assert (= (and b!748864 res!504904) b!748873))

(assert (= (and b!748873 res!504907) b!748862))

(assert (= (and b!748862 res!504912) b!748866))

(assert (= (and b!748866 res!504914) b!748860))

(assert (= (and b!748860 res!504902) b!748867))

(assert (= (and b!748867 res!504901) b!748855))

(assert (= (and b!748855 res!504910) b!748869))

(assert (= (and b!748869 c!82360) b!748861))

(assert (= (and b!748869 (not c!82360)) b!748856))

(assert (= (and b!748869 res!504906) b!748859))

(assert (= (and b!748859 res!504915) b!748870))

(assert (= (and b!748870 res!504911) b!748857))

(assert (= (and b!748870 (not res!504909)) b!748868))

(assert (= (and b!748868 (not res!504916)) b!748871))

(assert (= (and b!748871 (not res!504913)) b!748858))

(assert (= (and b!748858 c!82361) b!748865))

(assert (= (and b!748858 (not c!82361)) b!748854))

(declare-fun m!699189 () Bool)

(assert (=> b!748867 m!699189))

(assert (=> b!748867 m!699189))

(declare-fun m!699191 () Bool)

(assert (=> b!748867 m!699191))

(assert (=> b!748867 m!699191))

(assert (=> b!748867 m!699189))

(declare-fun m!699193 () Bool)

(assert (=> b!748867 m!699193))

(assert (=> b!748857 m!699189))

(assert (=> b!748857 m!699189))

(declare-fun m!699195 () Bool)

(assert (=> b!748857 m!699195))

(declare-fun m!699197 () Bool)

(assert (=> b!748866 m!699197))

(assert (=> b!748856 m!699189))

(assert (=> b!748856 m!699189))

(declare-fun m!699199 () Bool)

(assert (=> b!748856 m!699199))

(declare-fun m!699201 () Bool)

(assert (=> b!748858 m!699201))

(declare-fun m!699203 () Bool)

(assert (=> b!748858 m!699203))

(assert (=> b!748871 m!699201))

(assert (=> b!748871 m!699203))

(declare-fun m!699205 () Bool)

(assert (=> b!748864 m!699205))

(declare-fun m!699207 () Bool)

(assert (=> b!748859 m!699207))

(assert (=> b!748859 m!699201))

(declare-fun m!699209 () Bool)

(assert (=> b!748859 m!699209))

(declare-fun m!699211 () Bool)

(assert (=> b!748859 m!699211))

(assert (=> b!748859 m!699211))

(declare-fun m!699213 () Bool)

(assert (=> b!748859 m!699213))

(declare-fun m!699215 () Bool)

(assert (=> b!748862 m!699215))

(assert (=> b!748870 m!699189))

(assert (=> b!748870 m!699189))

(declare-fun m!699217 () Bool)

(assert (=> b!748870 m!699217))

(declare-fun m!699219 () Bool)

(assert (=> b!748870 m!699219))

(declare-fun m!699221 () Bool)

(assert (=> b!748870 m!699221))

(declare-fun m!699223 () Bool)

(assert (=> b!748855 m!699223))

(declare-fun m!699225 () Bool)

(assert (=> start!65664 m!699225))

(declare-fun m!699227 () Bool)

(assert (=> start!65664 m!699227))

(declare-fun m!699229 () Bool)

(assert (=> b!748853 m!699229))

(declare-fun m!699231 () Bool)

(assert (=> b!748873 m!699231))

(assert (=> b!748861 m!699189))

(assert (=> b!748861 m!699189))

(declare-fun m!699233 () Bool)

(assert (=> b!748861 m!699233))

(assert (=> b!748868 m!699189))

(assert (=> b!748868 m!699189))

(assert (=> b!748868 m!699199))

(assert (=> b!748863 m!699189))

(assert (=> b!748863 m!699189))

(declare-fun m!699235 () Bool)

(assert (=> b!748863 m!699235))

(check-sat (not b!748857) (not b!748867) (not b!748870) (not b!748856) (not b!748864) (not b!748868) (not b!748866) (not b!748861) (not b!748862) (not b!748859) (not b!748873) (not b!748863) (not b!748853) (not start!65664))
(check-sat)
