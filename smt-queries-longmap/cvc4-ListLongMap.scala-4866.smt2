; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67114 () Bool)

(assert start!67114)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42469 0))(
  ( (array!42470 (arr!20330 (Array (_ BitVec 32) (_ BitVec 64))) (size!20751 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42469)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!431320 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!774898 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7930 0))(
  ( (MissingZero!7930 (index!34088 (_ BitVec 32))) (Found!7930 (index!34089 (_ BitVec 32))) (Intermediate!7930 (undefined!8742 Bool) (index!34090 (_ BitVec 32)) (x!65033 (_ BitVec 32))) (Undefined!7930) (MissingVacant!7930 (index!34091 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42469 (_ BitVec 32)) SeekEntryResult!7930)

(assert (=> b!774898 (= e!431320 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20330 a!3186) j!159) a!3186 mask!3328) (Found!7930 j!159)))))

(declare-fun b!774899 () Bool)

(declare-fun res!523963 () Bool)

(declare-fun e!431315 () Bool)

(assert (=> b!774899 (=> res!523963 e!431315)))

(declare-fun e!431322 () Bool)

(assert (=> b!774899 (= res!523963 e!431322)))

(declare-fun c!85868 () Bool)

(declare-fun lt!345142 () Bool)

(assert (=> b!774899 (= c!85868 lt!345142)))

(declare-fun b!774900 () Bool)

(declare-fun lt!345130 () SeekEntryResult!7930)

(declare-fun e!431316 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!774900 (= e!431316 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20330 a!3186) j!159) a!3186 mask!3328) lt!345130))))

(declare-fun b!774901 () Bool)

(declare-fun res!523978 () Bool)

(declare-fun e!431324 () Bool)

(assert (=> b!774901 (=> (not res!523978) (not e!431324))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!774901 (= res!523978 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20330 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!774902 () Bool)

(declare-fun lt!345133 () (_ BitVec 32))

(declare-fun lt!345143 () SeekEntryResult!7930)

(assert (=> b!774902 (= e!431322 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345133 resIntermediateIndex!5 (select (arr!20330 a!3186) j!159) a!3186 mask!3328) lt!345143)))))

(declare-fun b!774903 () Bool)

(declare-fun e!431319 () Bool)

(assert (=> b!774903 (= e!431319 e!431324)))

(declare-fun res!523972 () Bool)

(assert (=> b!774903 (=> (not res!523972) (not e!431324))))

(declare-fun lt!345138 () SeekEntryResult!7930)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42469 (_ BitVec 32)) SeekEntryResult!7930)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!774903 (= res!523972 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20330 a!3186) j!159) mask!3328) (select (arr!20330 a!3186) j!159) a!3186 mask!3328) lt!345138))))

(assert (=> b!774903 (= lt!345138 (Intermediate!7930 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!774904 () Bool)

(declare-datatypes ((Unit!26734 0))(
  ( (Unit!26735) )
))
(declare-fun e!431323 () Unit!26734)

(declare-fun Unit!26736 () Unit!26734)

(assert (=> b!774904 (= e!431323 Unit!26736)))

(assert (=> b!774904 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345133 (select (arr!20330 a!3186) j!159) a!3186 mask!3328) lt!345138)))

(declare-fun b!774905 () Bool)

(declare-fun res!523975 () Bool)

(assert (=> b!774905 (=> (not res!523975) (not e!431319))))

(declare-datatypes ((List!14332 0))(
  ( (Nil!14329) (Cons!14328 (h!15436 (_ BitVec 64)) (t!20647 List!14332)) )
))
(declare-fun arrayNoDuplicates!0 (array!42469 (_ BitVec 32) List!14332) Bool)

(assert (=> b!774905 (= res!523975 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14329))))

(declare-fun b!774906 () Bool)

(declare-fun res!523965 () Bool)

(declare-fun e!431321 () Bool)

(assert (=> b!774906 (=> (not res!523965) (not e!431321))))

(assert (=> b!774906 (= res!523965 (and (= (size!20751 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20751 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20751 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!774907 () Bool)

(assert (=> b!774907 (= e!431315 true)))

(declare-fun lt!345141 () array!42469)

(declare-fun lt!345131 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42469 (_ BitVec 32)) SeekEntryResult!7930)

(assert (=> b!774907 (= (seekEntryOrOpen!0 lt!345131 lt!345141 mask!3328) lt!345143)))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun lt!345135 () Unit!26734)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!42469 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26734)

(assert (=> b!774907 (= lt!345135 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k!2102 j!159 lt!345133 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!774908 () Bool)

(declare-fun e!431313 () Bool)

(assert (=> b!774908 (= e!431313 e!431316)))

(declare-fun res!523962 () Bool)

(assert (=> b!774908 (=> (not res!523962) (not e!431316))))

(assert (=> b!774908 (= res!523962 (= (seekEntryOrOpen!0 (select (arr!20330 a!3186) j!159) a!3186 mask!3328) lt!345130))))

(assert (=> b!774908 (= lt!345130 (Found!7930 j!159))))

(declare-fun res!523966 () Bool)

(assert (=> start!67114 (=> (not res!523966) (not e!431321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67114 (= res!523966 (validMask!0 mask!3328))))

(assert (=> start!67114 e!431321))

(assert (=> start!67114 true))

(declare-fun array_inv!16126 (array!42469) Bool)

(assert (=> start!67114 (array_inv!16126 a!3186)))

(declare-fun b!774897 () Bool)

(assert (=> b!774897 (= e!431321 e!431319)))

(declare-fun res!523973 () Bool)

(assert (=> b!774897 (=> (not res!523973) (not e!431319))))

(declare-fun lt!345132 () SeekEntryResult!7930)

(assert (=> b!774897 (= res!523973 (or (= lt!345132 (MissingZero!7930 i!1173)) (= lt!345132 (MissingVacant!7930 i!1173))))))

(assert (=> b!774897 (= lt!345132 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!774909 () Bool)

(declare-fun res!523969 () Bool)

(assert (=> b!774909 (=> res!523969 e!431315)))

(declare-fun lt!345136 () SeekEntryResult!7930)

(assert (=> b!774909 (= res!523969 (not (= lt!345136 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345133 lt!345131 lt!345141 mask!3328))))))

(declare-fun b!774910 () Bool)

(declare-fun res!523967 () Bool)

(assert (=> b!774910 (=> (not res!523967) (not e!431321))))

(declare-fun arrayContainsKey!0 (array!42469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!774910 (= res!523967 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!774911 () Bool)

(declare-fun Unit!26737 () Unit!26734)

(assert (=> b!774911 (= e!431323 Unit!26737)))

(declare-fun lt!345137 () SeekEntryResult!7930)

(assert (=> b!774911 (= lt!345137 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20330 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!774911 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345133 resIntermediateIndex!5 (select (arr!20330 a!3186) j!159) a!3186 mask!3328) lt!345143)))

(declare-fun b!774912 () Bool)

(assert (=> b!774912 (= e!431322 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345133 (select (arr!20330 a!3186) j!159) a!3186 mask!3328) lt!345138)))))

(declare-fun b!774913 () Bool)

(declare-fun e!431318 () Bool)

(declare-fun e!431314 () Bool)

(assert (=> b!774913 (= e!431318 (not e!431314))))

(declare-fun res!523970 () Bool)

(assert (=> b!774913 (=> res!523970 e!431314)))

(declare-fun lt!345140 () SeekEntryResult!7930)

(assert (=> b!774913 (= res!523970 (or (not (is-Intermediate!7930 lt!345140)) (bvsge x!1131 (x!65033 lt!345140))))))

(assert (=> b!774913 (= lt!345143 (Found!7930 j!159))))

(assert (=> b!774913 e!431313))

(declare-fun res!523974 () Bool)

(assert (=> b!774913 (=> (not res!523974) (not e!431313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42469 (_ BitVec 32)) Bool)

(assert (=> b!774913 (= res!523974 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!345134 () Unit!26734)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42469 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26734)

(assert (=> b!774913 (= lt!345134 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!774914 () Bool)

(declare-fun res!523964 () Bool)

(assert (=> b!774914 (=> (not res!523964) (not e!431324))))

(assert (=> b!774914 (= res!523964 e!431320)))

(declare-fun c!85870 () Bool)

(assert (=> b!774914 (= c!85870 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!774915 () Bool)

(declare-fun res!523977 () Bool)

(assert (=> b!774915 (=> (not res!523977) (not e!431319))))

(assert (=> b!774915 (= res!523977 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20751 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20751 a!3186))))))

(declare-fun b!774916 () Bool)

(assert (=> b!774916 (= e!431314 e!431315)))

(declare-fun res!523971 () Bool)

(assert (=> b!774916 (=> res!523971 e!431315)))

(assert (=> b!774916 (= res!523971 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!345133 #b00000000000000000000000000000000) (bvsge lt!345133 (size!20751 a!3186))))))

(declare-fun lt!345139 () Unit!26734)

(assert (=> b!774916 (= lt!345139 e!431323)))

(declare-fun c!85869 () Bool)

(assert (=> b!774916 (= c!85869 lt!345142)))

(assert (=> b!774916 (= lt!345142 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!774916 (= lt!345133 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!774917 () Bool)

(declare-fun res!523968 () Bool)

(assert (=> b!774917 (=> (not res!523968) (not e!431319))))

(assert (=> b!774917 (= res!523968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!774918 () Bool)

(declare-fun res!523961 () Bool)

(assert (=> b!774918 (=> (not res!523961) (not e!431321))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!774918 (= res!523961 (validKeyInArray!0 k!2102))))

(declare-fun b!774919 () Bool)

(assert (=> b!774919 (= e!431320 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20330 a!3186) j!159) a!3186 mask!3328) lt!345138))))

(declare-fun b!774920 () Bool)

(assert (=> b!774920 (= e!431324 e!431318)))

(declare-fun res!523976 () Bool)

(assert (=> b!774920 (=> (not res!523976) (not e!431318))))

(assert (=> b!774920 (= res!523976 (= lt!345136 lt!345140))))

(assert (=> b!774920 (= lt!345140 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345131 lt!345141 mask!3328))))

(assert (=> b!774920 (= lt!345136 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345131 mask!3328) lt!345131 lt!345141 mask!3328))))

(assert (=> b!774920 (= lt!345131 (select (store (arr!20330 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!774920 (= lt!345141 (array!42470 (store (arr!20330 a!3186) i!1173 k!2102) (size!20751 a!3186)))))

(declare-fun b!774921 () Bool)

(declare-fun res!523979 () Bool)

(assert (=> b!774921 (=> (not res!523979) (not e!431321))))

(assert (=> b!774921 (= res!523979 (validKeyInArray!0 (select (arr!20330 a!3186) j!159)))))

(assert (= (and start!67114 res!523966) b!774906))

(assert (= (and b!774906 res!523965) b!774921))

(assert (= (and b!774921 res!523979) b!774918))

(assert (= (and b!774918 res!523961) b!774910))

(assert (= (and b!774910 res!523967) b!774897))

(assert (= (and b!774897 res!523973) b!774917))

(assert (= (and b!774917 res!523968) b!774905))

(assert (= (and b!774905 res!523975) b!774915))

(assert (= (and b!774915 res!523977) b!774903))

(assert (= (and b!774903 res!523972) b!774901))

(assert (= (and b!774901 res!523978) b!774914))

(assert (= (and b!774914 c!85870) b!774919))

(assert (= (and b!774914 (not c!85870)) b!774898))

(assert (= (and b!774914 res!523964) b!774920))

(assert (= (and b!774920 res!523976) b!774913))

(assert (= (and b!774913 res!523974) b!774908))

(assert (= (and b!774908 res!523962) b!774900))

(assert (= (and b!774913 (not res!523970)) b!774916))

(assert (= (and b!774916 c!85869) b!774904))

(assert (= (and b!774916 (not c!85869)) b!774911))

(assert (= (and b!774916 (not res!523971)) b!774899))

(assert (= (and b!774899 c!85868) b!774912))

(assert (= (and b!774899 (not c!85868)) b!774902))

(assert (= (and b!774899 (not res!523963)) b!774909))

(assert (= (and b!774909 (not res!523969)) b!774907))

(declare-fun m!719245 () Bool)

(assert (=> b!774900 m!719245))

(assert (=> b!774900 m!719245))

(declare-fun m!719247 () Bool)

(assert (=> b!774900 m!719247))

(assert (=> b!774903 m!719245))

(assert (=> b!774903 m!719245))

(declare-fun m!719249 () Bool)

(assert (=> b!774903 m!719249))

(assert (=> b!774903 m!719249))

(assert (=> b!774903 m!719245))

(declare-fun m!719251 () Bool)

(assert (=> b!774903 m!719251))

(assert (=> b!774898 m!719245))

(assert (=> b!774898 m!719245))

(declare-fun m!719253 () Bool)

(assert (=> b!774898 m!719253))

(declare-fun m!719255 () Bool)

(assert (=> b!774901 m!719255))

(assert (=> b!774911 m!719245))

(assert (=> b!774911 m!719245))

(assert (=> b!774911 m!719253))

(assert (=> b!774911 m!719245))

(declare-fun m!719257 () Bool)

(assert (=> b!774911 m!719257))

(declare-fun m!719259 () Bool)

(assert (=> b!774910 m!719259))

(declare-fun m!719261 () Bool)

(assert (=> b!774917 m!719261))

(declare-fun m!719263 () Bool)

(assert (=> b!774909 m!719263))

(assert (=> b!774908 m!719245))

(assert (=> b!774908 m!719245))

(declare-fun m!719265 () Bool)

(assert (=> b!774908 m!719265))

(declare-fun m!719267 () Bool)

(assert (=> b!774913 m!719267))

(declare-fun m!719269 () Bool)

(assert (=> b!774913 m!719269))

(assert (=> b!774902 m!719245))

(assert (=> b!774902 m!719245))

(assert (=> b!774902 m!719257))

(declare-fun m!719271 () Bool)

(assert (=> b!774907 m!719271))

(declare-fun m!719273 () Bool)

(assert (=> b!774907 m!719273))

(declare-fun m!719275 () Bool)

(assert (=> b!774897 m!719275))

(declare-fun m!719277 () Bool)

(assert (=> b!774920 m!719277))

(declare-fun m!719279 () Bool)

(assert (=> b!774920 m!719279))

(declare-fun m!719281 () Bool)

(assert (=> b!774920 m!719281))

(declare-fun m!719283 () Bool)

(assert (=> b!774920 m!719283))

(assert (=> b!774920 m!719277))

(declare-fun m!719285 () Bool)

(assert (=> b!774920 m!719285))

(assert (=> b!774921 m!719245))

(assert (=> b!774921 m!719245))

(declare-fun m!719287 () Bool)

(assert (=> b!774921 m!719287))

(assert (=> b!774912 m!719245))

(assert (=> b!774912 m!719245))

(declare-fun m!719289 () Bool)

(assert (=> b!774912 m!719289))

(assert (=> b!774919 m!719245))

(assert (=> b!774919 m!719245))

(declare-fun m!719291 () Bool)

(assert (=> b!774919 m!719291))

(declare-fun m!719293 () Bool)

(assert (=> start!67114 m!719293))

(declare-fun m!719295 () Bool)

(assert (=> start!67114 m!719295))

(assert (=> b!774904 m!719245))

(assert (=> b!774904 m!719245))

(assert (=> b!774904 m!719289))

(declare-fun m!719297 () Bool)

(assert (=> b!774918 m!719297))

(declare-fun m!719299 () Bool)

(assert (=> b!774916 m!719299))

(declare-fun m!719301 () Bool)

(assert (=> b!774905 m!719301))

(push 1)

