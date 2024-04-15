; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67544 () Bool)

(assert start!67544)

(declare-fun b!781890 () Bool)

(declare-fun res!529092 () Bool)

(declare-fun e!434792 () Bool)

(assert (=> b!781890 (=> (not res!529092) (not e!434792))))

(declare-datatypes ((array!42666 0))(
  ( (array!42667 (arr!20423 (Array (_ BitVec 32) (_ BitVec 64))) (size!20844 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42666)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42666 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!781890 (= res!529092 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!781891 () Bool)

(declare-fun res!529103 () Bool)

(declare-fun e!434794 () Bool)

(assert (=> b!781891 (=> (not res!529103) (not e!434794))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!781891 (= res!529103 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20423 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781892 () Bool)

(declare-fun res!529089 () Bool)

(declare-fun e!434795 () Bool)

(assert (=> b!781892 (=> (not res!529089) (not e!434795))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42666 (_ BitVec 32)) Bool)

(assert (=> b!781892 (= res!529089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!781893 () Bool)

(declare-datatypes ((Unit!26948 0))(
  ( (Unit!26949) )
))
(declare-fun e!434789 () Unit!26948)

(declare-fun Unit!26950 () Unit!26948)

(assert (=> b!781893 (= e!434789 Unit!26950)))

(declare-fun res!529094 () Bool)

(assert (=> start!67544 (=> (not res!529094) (not e!434792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67544 (= res!529094 (validMask!0 mask!3328))))

(assert (=> start!67544 e!434792))

(assert (=> start!67544 true))

(declare-fun array_inv!16306 (array!42666) Bool)

(assert (=> start!67544 (array_inv!16306 a!3186)))

(declare-fun b!781894 () Bool)

(assert (=> b!781894 (= e!434795 e!434794)))

(declare-fun res!529095 () Bool)

(assert (=> b!781894 (=> (not res!529095) (not e!434794))))

(declare-datatypes ((SeekEntryResult!8020 0))(
  ( (MissingZero!8020 (index!34448 (_ BitVec 32))) (Found!8020 (index!34449 (_ BitVec 32))) (Intermediate!8020 (undefined!8832 Bool) (index!34450 (_ BitVec 32)) (x!65410 (_ BitVec 32))) (Undefined!8020) (MissingVacant!8020 (index!34451 (_ BitVec 32))) )
))
(declare-fun lt!348325 () SeekEntryResult!8020)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42666 (_ BitVec 32)) SeekEntryResult!8020)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!781894 (= res!529095 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20423 a!3186) j!159) mask!3328) (select (arr!20423 a!3186) j!159) a!3186 mask!3328) lt!348325))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!781894 (= lt!348325 (Intermediate!8020 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!781895 () Bool)

(declare-fun res!529100 () Bool)

(declare-fun e!434797 () Bool)

(assert (=> b!781895 (=> res!529100 e!434797)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!348320 () SeekEntryResult!8020)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42666 (_ BitVec 32)) SeekEntryResult!8020)

(assert (=> b!781895 (= res!529100 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20423 a!3186) j!159) a!3186 mask!3328) lt!348320)))))

(declare-fun b!781896 () Bool)

(declare-fun e!434791 () Bool)

(assert (=> b!781896 (= e!434791 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20423 a!3186) j!159) a!3186 mask!3328) (Found!8020 j!159)))))

(declare-fun b!781897 () Bool)

(declare-fun res!529090 () Bool)

(assert (=> b!781897 (=> (not res!529090) (not e!434792))))

(assert (=> b!781897 (= res!529090 (and (= (size!20844 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20844 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20844 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!781898 () Bool)

(declare-fun res!529099 () Bool)

(assert (=> b!781898 (=> (not res!529099) (not e!434792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!781898 (= res!529099 (validKeyInArray!0 (select (arr!20423 a!3186) j!159)))))

(declare-fun b!781899 () Bool)

(assert (=> b!781899 (= e!434797 true)))

(assert (=> b!781899 (= (select (store (arr!20423 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348329 () Unit!26948)

(assert (=> b!781899 (= lt!348329 e!434789)))

(declare-fun c!86808 () Bool)

(assert (=> b!781899 (= c!86808 (= (select (store (arr!20423 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!781900 () Bool)

(declare-fun res!529101 () Bool)

(assert (=> b!781900 (=> res!529101 e!434797)))

(declare-fun lt!348322 () (_ BitVec 64))

(assert (=> b!781900 (= res!529101 (= (select (store (arr!20423 a!3186) i!1173 k0!2102) index!1321) lt!348322))))

(declare-fun e!434796 () Bool)

(declare-fun b!781901 () Bool)

(assert (=> b!781901 (= e!434796 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20423 a!3186) j!159) a!3186 mask!3328) lt!348320))))

(declare-fun b!781902 () Bool)

(assert (=> b!781902 (= e!434792 e!434795)))

(declare-fun res!529093 () Bool)

(assert (=> b!781902 (=> (not res!529093) (not e!434795))))

(declare-fun lt!348327 () SeekEntryResult!8020)

(assert (=> b!781902 (= res!529093 (or (= lt!348327 (MissingZero!8020 i!1173)) (= lt!348327 (MissingVacant!8020 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42666 (_ BitVec 32)) SeekEntryResult!8020)

(assert (=> b!781902 (= lt!348327 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!781903 () Bool)

(declare-fun Unit!26951 () Unit!26948)

(assert (=> b!781903 (= e!434789 Unit!26951)))

(assert (=> b!781903 false))

(declare-fun b!781904 () Bool)

(assert (=> b!781904 (= e!434791 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20423 a!3186) j!159) a!3186 mask!3328) lt!348325))))

(declare-fun b!781905 () Bool)

(declare-fun res!529097 () Bool)

(assert (=> b!781905 (=> (not res!529097) (not e!434795))))

(assert (=> b!781905 (= res!529097 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20844 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20844 a!3186))))))

(declare-fun b!781906 () Bool)

(declare-fun e!434793 () Bool)

(assert (=> b!781906 (= e!434793 (not e!434797))))

(declare-fun res!529104 () Bool)

(assert (=> b!781906 (=> res!529104 e!434797)))

(declare-fun lt!348328 () SeekEntryResult!8020)

(get-info :version)

(assert (=> b!781906 (= res!529104 (or (not ((_ is Intermediate!8020) lt!348328)) (bvslt x!1131 (x!65410 lt!348328)) (not (= x!1131 (x!65410 lt!348328))) (not (= index!1321 (index!34450 lt!348328)))))))

(assert (=> b!781906 e!434796))

(declare-fun res!529098 () Bool)

(assert (=> b!781906 (=> (not res!529098) (not e!434796))))

(declare-fun lt!348324 () SeekEntryResult!8020)

(assert (=> b!781906 (= res!529098 (= lt!348324 lt!348320))))

(assert (=> b!781906 (= lt!348320 (Found!8020 j!159))))

(assert (=> b!781906 (= lt!348324 (seekEntryOrOpen!0 (select (arr!20423 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!781906 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348323 () Unit!26948)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42666 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26948)

(assert (=> b!781906 (= lt!348323 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!781907 () Bool)

(declare-fun res!529088 () Bool)

(assert (=> b!781907 (=> (not res!529088) (not e!434792))))

(assert (=> b!781907 (= res!529088 (validKeyInArray!0 k0!2102))))

(declare-fun b!781908 () Bool)

(assert (=> b!781908 (= e!434794 e!434793)))

(declare-fun res!529091 () Bool)

(assert (=> b!781908 (=> (not res!529091) (not e!434793))))

(declare-fun lt!348321 () SeekEntryResult!8020)

(assert (=> b!781908 (= res!529091 (= lt!348321 lt!348328))))

(declare-fun lt!348326 () array!42666)

(assert (=> b!781908 (= lt!348328 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348322 lt!348326 mask!3328))))

(assert (=> b!781908 (= lt!348321 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348322 mask!3328) lt!348322 lt!348326 mask!3328))))

(assert (=> b!781908 (= lt!348322 (select (store (arr!20423 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!781908 (= lt!348326 (array!42667 (store (arr!20423 a!3186) i!1173 k0!2102) (size!20844 a!3186)))))

(declare-fun b!781909 () Bool)

(declare-fun res!529102 () Bool)

(assert (=> b!781909 (=> (not res!529102) (not e!434795))))

(declare-datatypes ((List!14464 0))(
  ( (Nil!14461) (Cons!14460 (h!15580 (_ BitVec 64)) (t!20770 List!14464)) )
))
(declare-fun arrayNoDuplicates!0 (array!42666 (_ BitVec 32) List!14464) Bool)

(assert (=> b!781909 (= res!529102 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14461))))

(declare-fun b!781910 () Bool)

(declare-fun res!529096 () Bool)

(assert (=> b!781910 (=> (not res!529096) (not e!434794))))

(assert (=> b!781910 (= res!529096 e!434791)))

(declare-fun c!86807 () Bool)

(assert (=> b!781910 (= c!86807 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!67544 res!529094) b!781897))

(assert (= (and b!781897 res!529090) b!781898))

(assert (= (and b!781898 res!529099) b!781907))

(assert (= (and b!781907 res!529088) b!781890))

(assert (= (and b!781890 res!529092) b!781902))

(assert (= (and b!781902 res!529093) b!781892))

(assert (= (and b!781892 res!529089) b!781909))

(assert (= (and b!781909 res!529102) b!781905))

(assert (= (and b!781905 res!529097) b!781894))

(assert (= (and b!781894 res!529095) b!781891))

(assert (= (and b!781891 res!529103) b!781910))

(assert (= (and b!781910 c!86807) b!781904))

(assert (= (and b!781910 (not c!86807)) b!781896))

(assert (= (and b!781910 res!529096) b!781908))

(assert (= (and b!781908 res!529091) b!781906))

(assert (= (and b!781906 res!529098) b!781901))

(assert (= (and b!781906 (not res!529104)) b!781895))

(assert (= (and b!781895 (not res!529100)) b!781900))

(assert (= (and b!781900 (not res!529101)) b!781899))

(assert (= (and b!781899 c!86808) b!781903))

(assert (= (and b!781899 (not c!86808)) b!781893))

(declare-fun m!724245 () Bool)

(assert (=> b!781906 m!724245))

(assert (=> b!781906 m!724245))

(declare-fun m!724247 () Bool)

(assert (=> b!781906 m!724247))

(declare-fun m!724249 () Bool)

(assert (=> b!781906 m!724249))

(declare-fun m!724251 () Bool)

(assert (=> b!781906 m!724251))

(assert (=> b!781894 m!724245))

(assert (=> b!781894 m!724245))

(declare-fun m!724253 () Bool)

(assert (=> b!781894 m!724253))

(assert (=> b!781894 m!724253))

(assert (=> b!781894 m!724245))

(declare-fun m!724255 () Bool)

(assert (=> b!781894 m!724255))

(declare-fun m!724257 () Bool)

(assert (=> b!781909 m!724257))

(assert (=> b!781904 m!724245))

(assert (=> b!781904 m!724245))

(declare-fun m!724259 () Bool)

(assert (=> b!781904 m!724259))

(declare-fun m!724261 () Bool)

(assert (=> start!67544 m!724261))

(declare-fun m!724263 () Bool)

(assert (=> start!67544 m!724263))

(assert (=> b!781895 m!724245))

(assert (=> b!781895 m!724245))

(declare-fun m!724265 () Bool)

(assert (=> b!781895 m!724265))

(assert (=> b!781896 m!724245))

(assert (=> b!781896 m!724245))

(assert (=> b!781896 m!724265))

(declare-fun m!724267 () Bool)

(assert (=> b!781900 m!724267))

(declare-fun m!724269 () Bool)

(assert (=> b!781900 m!724269))

(declare-fun m!724271 () Bool)

(assert (=> b!781892 m!724271))

(declare-fun m!724273 () Bool)

(assert (=> b!781902 m!724273))

(assert (=> b!781898 m!724245))

(assert (=> b!781898 m!724245))

(declare-fun m!724275 () Bool)

(assert (=> b!781898 m!724275))

(declare-fun m!724277 () Bool)

(assert (=> b!781908 m!724277))

(declare-fun m!724279 () Bool)

(assert (=> b!781908 m!724279))

(declare-fun m!724281 () Bool)

(assert (=> b!781908 m!724281))

(assert (=> b!781908 m!724267))

(assert (=> b!781908 m!724279))

(declare-fun m!724283 () Bool)

(assert (=> b!781908 m!724283))

(assert (=> b!781901 m!724245))

(assert (=> b!781901 m!724245))

(declare-fun m!724285 () Bool)

(assert (=> b!781901 m!724285))

(assert (=> b!781899 m!724267))

(assert (=> b!781899 m!724269))

(declare-fun m!724287 () Bool)

(assert (=> b!781890 m!724287))

(declare-fun m!724289 () Bool)

(assert (=> b!781907 m!724289))

(declare-fun m!724291 () Bool)

(assert (=> b!781891 m!724291))

(check-sat (not b!781907) (not b!781901) (not b!781890) (not b!781906) (not b!781909) (not b!781896) (not b!781898) (not b!781902) (not b!781895) (not start!67544) (not b!781894) (not b!781908) (not b!781892) (not b!781904))
(check-sat)
