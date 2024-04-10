; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67558 () Bool)

(assert start!67558)

(declare-fun b!781888 () Bool)

(declare-fun res!529004 () Bool)

(declare-fun e!434836 () Bool)

(assert (=> b!781888 (=> (not res!529004) (not e!434836))))

(declare-datatypes ((array!42661 0))(
  ( (array!42662 (arr!20420 (Array (_ BitVec 32) (_ BitVec 64))) (size!20841 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42661)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!781888 (= res!529004 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!781889 () Bool)

(declare-fun res!528998 () Bool)

(assert (=> b!781889 (=> (not res!528998) (not e!434836))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!781889 (= res!528998 (validKeyInArray!0 (select (arr!20420 a!3186) j!159)))))

(declare-fun b!781890 () Bool)

(declare-fun res!529008 () Bool)

(assert (=> b!781890 (=> (not res!529008) (not e!434836))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!781890 (= res!529008 (and (= (size!20841 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20841 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20841 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!781891 () Bool)

(declare-fun e!434843 () Bool)

(declare-fun e!434839 () Bool)

(assert (=> b!781891 (= e!434843 (not e!434839))))

(declare-fun res!529000 () Bool)

(assert (=> b!781891 (=> res!529000 e!434839)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8020 0))(
  ( (MissingZero!8020 (index!34448 (_ BitVec 32))) (Found!8020 (index!34449 (_ BitVec 32))) (Intermediate!8020 (undefined!8832 Bool) (index!34450 (_ BitVec 32)) (x!65399 (_ BitVec 32))) (Undefined!8020) (MissingVacant!8020 (index!34451 (_ BitVec 32))) )
))
(declare-fun lt!348449 () SeekEntryResult!8020)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!781891 (= res!529000 (or (not (is-Intermediate!8020 lt!348449)) (bvslt x!1131 (x!65399 lt!348449)) (not (= x!1131 (x!65399 lt!348449))) (not (= index!1321 (index!34450 lt!348449)))))))

(declare-fun e!434838 () Bool)

(assert (=> b!781891 e!434838))

(declare-fun res!529010 () Bool)

(assert (=> b!781891 (=> (not res!529010) (not e!434838))))

(declare-fun lt!348443 () SeekEntryResult!8020)

(declare-fun lt!348446 () SeekEntryResult!8020)

(assert (=> b!781891 (= res!529010 (= lt!348443 lt!348446))))

(assert (=> b!781891 (= lt!348446 (Found!8020 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42661 (_ BitVec 32)) SeekEntryResult!8020)

(assert (=> b!781891 (= lt!348443 (seekEntryOrOpen!0 (select (arr!20420 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42661 (_ BitVec 32)) Bool)

(assert (=> b!781891 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26968 0))(
  ( (Unit!26969) )
))
(declare-fun lt!348442 () Unit!26968)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42661 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26968)

(assert (=> b!781891 (= lt!348442 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!781892 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42661 (_ BitVec 32)) SeekEntryResult!8020)

(assert (=> b!781892 (= e!434838 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20420 a!3186) j!159) a!3186 mask!3328) lt!348446))))

(declare-fun b!781893 () Bool)

(declare-fun res!529002 () Bool)

(declare-fun e!434835 () Bool)

(assert (=> b!781893 (=> (not res!529002) (not e!434835))))

(assert (=> b!781893 (= res!529002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!781894 () Bool)

(declare-fun res!528995 () Bool)

(assert (=> b!781894 (=> (not res!528995) (not e!434835))))

(declare-datatypes ((List!14422 0))(
  ( (Nil!14419) (Cons!14418 (h!15538 (_ BitVec 64)) (t!20737 List!14422)) )
))
(declare-fun arrayNoDuplicates!0 (array!42661 (_ BitVec 32) List!14422) Bool)

(assert (=> b!781894 (= res!528995 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14419))))

(declare-fun b!781895 () Bool)

(declare-fun res!529006 () Bool)

(declare-fun e!434842 () Bool)

(assert (=> b!781895 (=> (not res!529006) (not e!434842))))

(declare-fun e!434841 () Bool)

(assert (=> b!781895 (= res!529006 e!434841)))

(declare-fun c!86854 () Bool)

(assert (=> b!781895 (= c!86854 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!781896 () Bool)

(declare-fun e!434840 () Unit!26968)

(declare-fun Unit!26970 () Unit!26968)

(assert (=> b!781896 (= e!434840 Unit!26970)))

(declare-fun b!781897 () Bool)

(declare-fun res!528997 () Bool)

(assert (=> b!781897 (=> (not res!528997) (not e!434842))))

(assert (=> b!781897 (= res!528997 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20420 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781898 () Bool)

(declare-fun res!529003 () Bool)

(assert (=> b!781898 (=> (not res!529003) (not e!434835))))

(assert (=> b!781898 (= res!529003 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20841 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20841 a!3186))))))

(declare-fun b!781899 () Bool)

(declare-fun res!529007 () Bool)

(assert (=> b!781899 (=> res!529007 e!434839)))

(assert (=> b!781899 (= res!529007 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20420 a!3186) j!159) a!3186 mask!3328) lt!348446)))))

(declare-fun b!781900 () Bool)

(assert (=> b!781900 (= e!434842 e!434843)))

(declare-fun res!529009 () Bool)

(assert (=> b!781900 (=> (not res!529009) (not e!434843))))

(declare-fun lt!348447 () SeekEntryResult!8020)

(assert (=> b!781900 (= res!529009 (= lt!348447 lt!348449))))

(declare-fun lt!348441 () array!42661)

(declare-fun lt!348448 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42661 (_ BitVec 32)) SeekEntryResult!8020)

(assert (=> b!781900 (= lt!348449 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348448 lt!348441 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!781900 (= lt!348447 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348448 mask!3328) lt!348448 lt!348441 mask!3328))))

(assert (=> b!781900 (= lt!348448 (select (store (arr!20420 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!781900 (= lt!348441 (array!42662 (store (arr!20420 a!3186) i!1173 k!2102) (size!20841 a!3186)))))

(declare-fun b!781901 () Bool)

(assert (=> b!781901 (= e!434835 e!434842)))

(declare-fun res!528999 () Bool)

(assert (=> b!781901 (=> (not res!528999) (not e!434842))))

(declare-fun lt!348445 () SeekEntryResult!8020)

(assert (=> b!781901 (= res!528999 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20420 a!3186) j!159) mask!3328) (select (arr!20420 a!3186) j!159) a!3186 mask!3328) lt!348445))))

(assert (=> b!781901 (= lt!348445 (Intermediate!8020 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!528994 () Bool)

(assert (=> start!67558 (=> (not res!528994) (not e!434836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67558 (= res!528994 (validMask!0 mask!3328))))

(assert (=> start!67558 e!434836))

(assert (=> start!67558 true))

(declare-fun array_inv!16216 (array!42661) Bool)

(assert (=> start!67558 (array_inv!16216 a!3186)))

(declare-fun b!781902 () Bool)

(assert (=> b!781902 (= e!434841 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20420 a!3186) j!159) a!3186 mask!3328) (Found!8020 j!159)))))

(declare-fun b!781903 () Bool)

(assert (=> b!781903 (= e!434836 e!434835)))

(declare-fun res!529001 () Bool)

(assert (=> b!781903 (=> (not res!529001) (not e!434835))))

(declare-fun lt!348440 () SeekEntryResult!8020)

(assert (=> b!781903 (= res!529001 (or (= lt!348440 (MissingZero!8020 i!1173)) (= lt!348440 (MissingVacant!8020 i!1173))))))

(assert (=> b!781903 (= lt!348440 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!781904 () Bool)

(declare-fun res!528996 () Bool)

(assert (=> b!781904 (=> res!528996 e!434839)))

(assert (=> b!781904 (= res!528996 (= (select (store (arr!20420 a!3186) i!1173 k!2102) index!1321) lt!348448))))

(declare-fun b!781905 () Bool)

(declare-fun Unit!26971 () Unit!26968)

(assert (=> b!781905 (= e!434840 Unit!26971)))

(assert (=> b!781905 false))

(declare-fun b!781906 () Bool)

(assert (=> b!781906 (= e!434841 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20420 a!3186) j!159) a!3186 mask!3328) lt!348445))))

(declare-fun b!781907 () Bool)

(assert (=> b!781907 (= e!434839 true)))

(assert (=> b!781907 (= (select (store (arr!20420 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348444 () Unit!26968)

(assert (=> b!781907 (= lt!348444 e!434840)))

(declare-fun c!86853 () Bool)

(assert (=> b!781907 (= c!86853 (= (select (store (arr!20420 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!781908 () Bool)

(declare-fun res!529005 () Bool)

(assert (=> b!781908 (=> (not res!529005) (not e!434836))))

(assert (=> b!781908 (= res!529005 (validKeyInArray!0 k!2102))))

(assert (= (and start!67558 res!528994) b!781890))

(assert (= (and b!781890 res!529008) b!781889))

(assert (= (and b!781889 res!528998) b!781908))

(assert (= (and b!781908 res!529005) b!781888))

(assert (= (and b!781888 res!529004) b!781903))

(assert (= (and b!781903 res!529001) b!781893))

(assert (= (and b!781893 res!529002) b!781894))

(assert (= (and b!781894 res!528995) b!781898))

(assert (= (and b!781898 res!529003) b!781901))

(assert (= (and b!781901 res!528999) b!781897))

(assert (= (and b!781897 res!528997) b!781895))

(assert (= (and b!781895 c!86854) b!781906))

(assert (= (and b!781895 (not c!86854)) b!781902))

(assert (= (and b!781895 res!529006) b!781900))

(assert (= (and b!781900 res!529009) b!781891))

(assert (= (and b!781891 res!529010) b!781892))

(assert (= (and b!781891 (not res!529000)) b!781899))

(assert (= (and b!781899 (not res!529007)) b!781904))

(assert (= (and b!781904 (not res!528996)) b!781907))

(assert (= (and b!781907 c!86853) b!781905))

(assert (= (and b!781907 (not c!86853)) b!781896))

(declare-fun m!724811 () Bool)

(assert (=> b!781907 m!724811))

(declare-fun m!724813 () Bool)

(assert (=> b!781907 m!724813))

(declare-fun m!724815 () Bool)

(assert (=> b!781891 m!724815))

(assert (=> b!781891 m!724815))

(declare-fun m!724817 () Bool)

(assert (=> b!781891 m!724817))

(declare-fun m!724819 () Bool)

(assert (=> b!781891 m!724819))

(declare-fun m!724821 () Bool)

(assert (=> b!781891 m!724821))

(declare-fun m!724823 () Bool)

(assert (=> b!781894 m!724823))

(assert (=> b!781902 m!724815))

(assert (=> b!781902 m!724815))

(declare-fun m!724825 () Bool)

(assert (=> b!781902 m!724825))

(assert (=> b!781904 m!724811))

(assert (=> b!781904 m!724813))

(declare-fun m!724827 () Bool)

(assert (=> b!781900 m!724827))

(declare-fun m!724829 () Bool)

(assert (=> b!781900 m!724829))

(assert (=> b!781900 m!724811))

(declare-fun m!724831 () Bool)

(assert (=> b!781900 m!724831))

(declare-fun m!724833 () Bool)

(assert (=> b!781900 m!724833))

(assert (=> b!781900 m!724827))

(assert (=> b!781901 m!724815))

(assert (=> b!781901 m!724815))

(declare-fun m!724835 () Bool)

(assert (=> b!781901 m!724835))

(assert (=> b!781901 m!724835))

(assert (=> b!781901 m!724815))

(declare-fun m!724837 () Bool)

(assert (=> b!781901 m!724837))

(declare-fun m!724839 () Bool)

(assert (=> b!781903 m!724839))

(declare-fun m!724841 () Bool)

(assert (=> b!781888 m!724841))

(assert (=> b!781899 m!724815))

(assert (=> b!781899 m!724815))

(assert (=> b!781899 m!724825))

(assert (=> b!781889 m!724815))

(assert (=> b!781889 m!724815))

(declare-fun m!724843 () Bool)

(assert (=> b!781889 m!724843))

(declare-fun m!724845 () Bool)

(assert (=> b!781893 m!724845))

(declare-fun m!724847 () Bool)

(assert (=> b!781897 m!724847))

(declare-fun m!724849 () Bool)

(assert (=> start!67558 m!724849))

(declare-fun m!724851 () Bool)

(assert (=> start!67558 m!724851))

(assert (=> b!781892 m!724815))

(assert (=> b!781892 m!724815))

(declare-fun m!724853 () Bool)

(assert (=> b!781892 m!724853))

(declare-fun m!724855 () Bool)

(assert (=> b!781908 m!724855))

(assert (=> b!781906 m!724815))

(assert (=> b!781906 m!724815))

(declare-fun m!724857 () Bool)

(assert (=> b!781906 m!724857))

(push 1)

