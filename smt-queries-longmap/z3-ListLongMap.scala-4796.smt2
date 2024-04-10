; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65838 () Bool)

(assert start!65838)

(declare-fun b!758319 () Bool)

(declare-fun res!512999 () Bool)

(declare-fun e!422778 () Bool)

(assert (=> b!758319 (=> (not res!512999) (not e!422778))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42011 0))(
  ( (array!42012 (arr!20119 (Array (_ BitVec 32) (_ BitVec 64))) (size!20540 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42011)

(assert (=> b!758319 (= res!512999 (and (= (size!20540 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20540 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20540 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!758320 () Bool)

(declare-datatypes ((Unit!26256 0))(
  ( (Unit!26257) )
))
(declare-fun e!422787 () Unit!26256)

(declare-fun Unit!26258 () Unit!26256)

(assert (=> b!758320 (= e!422787 Unit!26258)))

(assert (=> b!758320 false))

(declare-fun b!758321 () Bool)

(declare-fun e!422788 () Bool)

(declare-fun e!422781 () Bool)

(assert (=> b!758321 (= e!422788 e!422781)))

(declare-fun res!513005 () Bool)

(assert (=> b!758321 (=> (not res!513005) (not e!422781))))

(declare-datatypes ((SeekEntryResult!7719 0))(
  ( (MissingZero!7719 (index!33244 (_ BitVec 32))) (Found!7719 (index!33245 (_ BitVec 32))) (Intermediate!7719 (undefined!8531 Bool) (index!33246 (_ BitVec 32)) (x!64133 (_ BitVec 32))) (Undefined!7719) (MissingVacant!7719 (index!33247 (_ BitVec 32))) )
))
(declare-fun lt!337789 () SeekEntryResult!7719)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42011 (_ BitVec 32)) SeekEntryResult!7719)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!758321 (= res!513005 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20119 a!3186) j!159) mask!3328) (select (arr!20119 a!3186) j!159) a!3186 mask!3328) lt!337789))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!758321 (= lt!337789 (Intermediate!7719 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!758322 () Bool)

(declare-fun e!422782 () Bool)

(declare-fun e!422779 () Bool)

(assert (=> b!758322 (= e!422782 e!422779)))

(declare-fun res!513000 () Bool)

(assert (=> b!758322 (=> res!513000 e!422779)))

(declare-fun lt!337793 () (_ BitVec 64))

(declare-fun lt!337786 () (_ BitVec 64))

(assert (=> b!758322 (= res!513000 (= lt!337793 lt!337786))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!758322 (= lt!337793 (select (store (arr!20119 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!758323 () Bool)

(declare-fun e!422785 () Bool)

(declare-fun e!422780 () Bool)

(assert (=> b!758323 (= e!422785 (not e!422780))))

(declare-fun res!513007 () Bool)

(assert (=> b!758323 (=> res!513007 e!422780)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!337788 () SeekEntryResult!7719)

(get-info :version)

(assert (=> b!758323 (= res!513007 (or (not ((_ is Intermediate!7719) lt!337788)) (bvslt x!1131 (x!64133 lt!337788)) (not (= x!1131 (x!64133 lt!337788))) (not (= index!1321 (index!33246 lt!337788)))))))

(declare-fun e!422786 () Bool)

(assert (=> b!758323 e!422786))

(declare-fun res!512994 () Bool)

(assert (=> b!758323 (=> (not res!512994) (not e!422786))))

(declare-fun lt!337790 () SeekEntryResult!7719)

(declare-fun lt!337794 () SeekEntryResult!7719)

(assert (=> b!758323 (= res!512994 (= lt!337790 lt!337794))))

(assert (=> b!758323 (= lt!337794 (Found!7719 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42011 (_ BitVec 32)) SeekEntryResult!7719)

(assert (=> b!758323 (= lt!337790 (seekEntryOrOpen!0 (select (arr!20119 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42011 (_ BitVec 32)) Bool)

(assert (=> b!758323 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337792 () Unit!26256)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42011 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26256)

(assert (=> b!758323 (= lt!337792 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!758324 () Bool)

(declare-fun res!513011 () Bool)

(assert (=> b!758324 (=> (not res!513011) (not e!422778))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!758324 (= res!513011 (validKeyInArray!0 (select (arr!20119 a!3186) j!159)))))

(declare-fun b!758325 () Bool)

(assert (=> b!758325 (= e!422780 e!422782)))

(declare-fun res!512997 () Bool)

(assert (=> b!758325 (=> res!512997 e!422782)))

(declare-fun lt!337797 () SeekEntryResult!7719)

(assert (=> b!758325 (= res!512997 (not (= lt!337797 lt!337794)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42011 (_ BitVec 32)) SeekEntryResult!7719)

(assert (=> b!758325 (= lt!337797 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20119 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!758326 () Bool)

(assert (=> b!758326 (= e!422778 e!422788)))

(declare-fun res!513006 () Bool)

(assert (=> b!758326 (=> (not res!513006) (not e!422788))))

(declare-fun lt!337795 () SeekEntryResult!7719)

(assert (=> b!758326 (= res!513006 (or (= lt!337795 (MissingZero!7719 i!1173)) (= lt!337795 (MissingVacant!7719 i!1173))))))

(assert (=> b!758326 (= lt!337795 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!758327 () Bool)

(declare-fun res!513008 () Bool)

(assert (=> b!758327 (=> (not res!513008) (not e!422788))))

(assert (=> b!758327 (= res!513008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!758328 () Bool)

(declare-fun Unit!26259 () Unit!26256)

(assert (=> b!758328 (= e!422787 Unit!26259)))

(declare-fun b!758329 () Bool)

(assert (=> b!758329 (= e!422781 e!422785)))

(declare-fun res!513001 () Bool)

(assert (=> b!758329 (=> (not res!513001) (not e!422785))))

(declare-fun lt!337796 () SeekEntryResult!7719)

(assert (=> b!758329 (= res!513001 (= lt!337796 lt!337788))))

(declare-fun lt!337785 () array!42011)

(assert (=> b!758329 (= lt!337788 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337786 lt!337785 mask!3328))))

(assert (=> b!758329 (= lt!337796 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337786 mask!3328) lt!337786 lt!337785 mask!3328))))

(assert (=> b!758329 (= lt!337786 (select (store (arr!20119 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!758329 (= lt!337785 (array!42012 (store (arr!20119 a!3186) i!1173 k0!2102) (size!20540 a!3186)))))

(declare-fun b!758330 () Bool)

(declare-fun res!513003 () Bool)

(assert (=> b!758330 (=> (not res!513003) (not e!422778))))

(assert (=> b!758330 (= res!513003 (validKeyInArray!0 k0!2102))))

(declare-fun b!758331 () Bool)

(declare-fun res!512995 () Bool)

(assert (=> b!758331 (=> (not res!512995) (not e!422788))))

(assert (=> b!758331 (= res!512995 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20540 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20540 a!3186))))))

(declare-fun b!758332 () Bool)

(assert (=> b!758332 (= e!422786 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20119 a!3186) j!159) a!3186 mask!3328) lt!337794))))

(declare-fun e!422784 () Bool)

(declare-fun b!758333 () Bool)

(assert (=> b!758333 (= e!422784 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20119 a!3186) j!159) a!3186 mask!3328) (Found!7719 j!159)))))

(declare-fun b!758334 () Bool)

(declare-fun e!422789 () Bool)

(assert (=> b!758334 (= e!422779 e!422789)))

(declare-fun res!512998 () Bool)

(assert (=> b!758334 (=> res!512998 e!422789)))

(assert (=> b!758334 (= res!512998 (or (not (= (select (arr!20119 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!337791 () SeekEntryResult!7719)

(declare-fun lt!337787 () SeekEntryResult!7719)

(assert (=> b!758334 (and (= lt!337787 lt!337791) (= lt!337790 lt!337797))))

(assert (=> b!758334 (= lt!337791 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337786 lt!337785 mask!3328))))

(assert (=> b!758334 (= lt!337787 (seekEntryOrOpen!0 lt!337786 lt!337785 mask!3328))))

(assert (=> b!758334 (= lt!337793 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!337798 () Unit!26256)

(assert (=> b!758334 (= lt!337798 e!422787)))

(declare-fun c!83043 () Bool)

(assert (=> b!758334 (= c!83043 (= lt!337793 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!758335 () Bool)

(assert (=> b!758335 (= e!422789 true)))

(assert (=> b!758335 (= lt!337791 lt!337797)))

(declare-fun lt!337799 () Unit!26256)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42011 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26256)

(assert (=> b!758335 (= lt!337799 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k0!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!758336 () Bool)

(declare-fun res!512996 () Bool)

(assert (=> b!758336 (=> (not res!512996) (not e!422781))))

(assert (=> b!758336 (= res!512996 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20119 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!758337 () Bool)

(declare-fun res!513009 () Bool)

(assert (=> b!758337 (=> (not res!513009) (not e!422781))))

(assert (=> b!758337 (= res!513009 e!422784)))

(declare-fun c!83044 () Bool)

(assert (=> b!758337 (= c!83044 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!758338 () Bool)

(declare-fun res!513010 () Bool)

(assert (=> b!758338 (=> (not res!513010) (not e!422788))))

(declare-datatypes ((List!14121 0))(
  ( (Nil!14118) (Cons!14117 (h!15189 (_ BitVec 64)) (t!20436 List!14121)) )
))
(declare-fun arrayNoDuplicates!0 (array!42011 (_ BitVec 32) List!14121) Bool)

(assert (=> b!758338 (= res!513010 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14118))))

(declare-fun res!513002 () Bool)

(assert (=> start!65838 (=> (not res!513002) (not e!422778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65838 (= res!513002 (validMask!0 mask!3328))))

(assert (=> start!65838 e!422778))

(assert (=> start!65838 true))

(declare-fun array_inv!15915 (array!42011) Bool)

(assert (=> start!65838 (array_inv!15915 a!3186)))

(declare-fun b!758339 () Bool)

(declare-fun res!513004 () Bool)

(assert (=> b!758339 (=> (not res!513004) (not e!422778))))

(declare-fun arrayContainsKey!0 (array!42011 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!758339 (= res!513004 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!758340 () Bool)

(assert (=> b!758340 (= e!422784 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20119 a!3186) j!159) a!3186 mask!3328) lt!337789))))

(assert (= (and start!65838 res!513002) b!758319))

(assert (= (and b!758319 res!512999) b!758324))

(assert (= (and b!758324 res!513011) b!758330))

(assert (= (and b!758330 res!513003) b!758339))

(assert (= (and b!758339 res!513004) b!758326))

(assert (= (and b!758326 res!513006) b!758327))

(assert (= (and b!758327 res!513008) b!758338))

(assert (= (and b!758338 res!513010) b!758331))

(assert (= (and b!758331 res!512995) b!758321))

(assert (= (and b!758321 res!513005) b!758336))

(assert (= (and b!758336 res!512996) b!758337))

(assert (= (and b!758337 c!83044) b!758340))

(assert (= (and b!758337 (not c!83044)) b!758333))

(assert (= (and b!758337 res!513009) b!758329))

(assert (= (and b!758329 res!513001) b!758323))

(assert (= (and b!758323 res!512994) b!758332))

(assert (= (and b!758323 (not res!513007)) b!758325))

(assert (= (and b!758325 (not res!512997)) b!758322))

(assert (= (and b!758322 (not res!513000)) b!758334))

(assert (= (and b!758334 c!83043) b!758320))

(assert (= (and b!758334 (not c!83043)) b!758328))

(assert (= (and b!758334 (not res!512998)) b!758335))

(declare-fun m!705819 () Bool)

(assert (=> b!758335 m!705819))

(declare-fun m!705821 () Bool)

(assert (=> b!758338 m!705821))

(declare-fun m!705823 () Bool)

(assert (=> b!758327 m!705823))

(declare-fun m!705825 () Bool)

(assert (=> b!758324 m!705825))

(assert (=> b!758324 m!705825))

(declare-fun m!705827 () Bool)

(assert (=> b!758324 m!705827))

(assert (=> b!758325 m!705825))

(assert (=> b!758325 m!705825))

(declare-fun m!705829 () Bool)

(assert (=> b!758325 m!705829))

(declare-fun m!705831 () Bool)

(assert (=> start!65838 m!705831))

(declare-fun m!705833 () Bool)

(assert (=> start!65838 m!705833))

(declare-fun m!705835 () Bool)

(assert (=> b!758330 m!705835))

(declare-fun m!705837 () Bool)

(assert (=> b!758336 m!705837))

(declare-fun m!705839 () Bool)

(assert (=> b!758339 m!705839))

(declare-fun m!705841 () Bool)

(assert (=> b!758326 m!705841))

(assert (=> b!758321 m!705825))

(assert (=> b!758321 m!705825))

(declare-fun m!705843 () Bool)

(assert (=> b!758321 m!705843))

(assert (=> b!758321 m!705843))

(assert (=> b!758321 m!705825))

(declare-fun m!705845 () Bool)

(assert (=> b!758321 m!705845))

(assert (=> b!758333 m!705825))

(assert (=> b!758333 m!705825))

(assert (=> b!758333 m!705829))

(assert (=> b!758340 m!705825))

(assert (=> b!758340 m!705825))

(declare-fun m!705847 () Bool)

(assert (=> b!758340 m!705847))

(declare-fun m!705849 () Bool)

(assert (=> b!758334 m!705849))

(declare-fun m!705851 () Bool)

(assert (=> b!758334 m!705851))

(declare-fun m!705853 () Bool)

(assert (=> b!758334 m!705853))

(declare-fun m!705855 () Bool)

(assert (=> b!758322 m!705855))

(declare-fun m!705857 () Bool)

(assert (=> b!758322 m!705857))

(assert (=> b!758332 m!705825))

(assert (=> b!758332 m!705825))

(declare-fun m!705859 () Bool)

(assert (=> b!758332 m!705859))

(assert (=> b!758323 m!705825))

(assert (=> b!758323 m!705825))

(declare-fun m!705861 () Bool)

(assert (=> b!758323 m!705861))

(declare-fun m!705863 () Bool)

(assert (=> b!758323 m!705863))

(declare-fun m!705865 () Bool)

(assert (=> b!758323 m!705865))

(assert (=> b!758329 m!705855))

(declare-fun m!705867 () Bool)

(assert (=> b!758329 m!705867))

(declare-fun m!705869 () Bool)

(assert (=> b!758329 m!705869))

(declare-fun m!705871 () Bool)

(assert (=> b!758329 m!705871))

(declare-fun m!705873 () Bool)

(assert (=> b!758329 m!705873))

(assert (=> b!758329 m!705867))

(check-sat (not b!758332) (not b!758335) (not b!758327) (not b!758324) (not b!758323) (not b!758334) (not b!758329) (not b!758338) (not b!758326) (not b!758325) (not start!65838) (not b!758340) (not b!758321) (not b!758339) (not b!758333) (not b!758330))
(check-sat)
