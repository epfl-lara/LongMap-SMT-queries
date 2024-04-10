; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65684 () Bool)

(assert start!65684)

(declare-fun b!753011 () Bool)

(declare-fun res!508621 () Bool)

(declare-fun e!420013 () Bool)

(assert (=> b!753011 (=> (not res!508621) (not e!420013))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41857 0))(
  ( (array!41858 (arr!20042 (Array (_ BitVec 32) (_ BitVec 64))) (size!20463 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41857)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!753011 (= res!508621 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20042 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!508616 () Bool)

(declare-fun e!420010 () Bool)

(assert (=> start!65684 (=> (not res!508616) (not e!420010))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65684 (= res!508616 (validMask!0 mask!3328))))

(assert (=> start!65684 e!420010))

(assert (=> start!65684 true))

(declare-fun array_inv!15838 (array!41857) Bool)

(assert (=> start!65684 (array_inv!15838 a!3186)))

(declare-fun b!753012 () Bool)

(declare-fun res!508613 () Bool)

(assert (=> b!753012 (=> (not res!508613) (not e!420010))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!753012 (= res!508613 (validKeyInArray!0 (select (arr!20042 a!3186) j!159)))))

(declare-fun b!753013 () Bool)

(declare-fun e!420012 () Bool)

(assert (=> b!753013 (= e!420012 true)))

(declare-fun e!420015 () Bool)

(assert (=> b!753013 e!420015))

(declare-fun res!508628 () Bool)

(assert (=> b!753013 (=> (not res!508628) (not e!420015))))

(declare-fun lt!335000 () (_ BitVec 64))

(assert (=> b!753013 (= res!508628 (= lt!335000 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25948 0))(
  ( (Unit!25949) )
))
(declare-fun lt!335003 () Unit!25948)

(declare-fun e!420006 () Unit!25948)

(assert (=> b!753013 (= lt!335003 e!420006)))

(declare-fun c!82582 () Bool)

(assert (=> b!753013 (= c!82582 (= lt!335000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!753014 () Bool)

(declare-fun e!420017 () Bool)

(assert (=> b!753014 (= e!420017 e!420013)))

(declare-fun res!508620 () Bool)

(assert (=> b!753014 (=> (not res!508620) (not e!420013))))

(declare-datatypes ((SeekEntryResult!7642 0))(
  ( (MissingZero!7642 (index!32936 (_ BitVec 32))) (Found!7642 (index!32937 (_ BitVec 32))) (Intermediate!7642 (undefined!8454 Bool) (index!32938 (_ BitVec 32)) (x!63848 (_ BitVec 32))) (Undefined!7642) (MissingVacant!7642 (index!32939 (_ BitVec 32))) )
))
(declare-fun lt!335008 () SeekEntryResult!7642)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41857 (_ BitVec 32)) SeekEntryResult!7642)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!753014 (= res!508620 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20042 a!3186) j!159) mask!3328) (select (arr!20042 a!3186) j!159) a!3186 mask!3328) lt!335008))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!753014 (= lt!335008 (Intermediate!7642 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!753015 () Bool)

(declare-fun res!508626 () Bool)

(assert (=> b!753015 (=> (not res!508626) (not e!420010))))

(assert (=> b!753015 (= res!508626 (and (= (size!20463 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20463 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20463 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!753016 () Bool)

(declare-fun lt!335007 () SeekEntryResult!7642)

(declare-fun lt!335005 () SeekEntryResult!7642)

(assert (=> b!753016 (= e!420015 (= lt!335007 lt!335005))))

(declare-fun b!753017 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!420011 () Bool)

(assert (=> b!753017 (= e!420011 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20042 a!3186) j!159) a!3186 mask!3328) lt!335008))))

(declare-fun b!753018 () Bool)

(declare-fun e!420014 () Bool)

(assert (=> b!753018 (= e!420014 e!420012)))

(declare-fun res!508625 () Bool)

(assert (=> b!753018 (=> res!508625 e!420012)))

(declare-fun lt!335006 () (_ BitVec 64))

(assert (=> b!753018 (= res!508625 (= lt!335000 lt!335006))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!753018 (= lt!335000 (select (store (arr!20042 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!753019 () Bool)

(declare-fun res!508611 () Bool)

(assert (=> b!753019 (=> (not res!508611) (not e!420010))))

(assert (=> b!753019 (= res!508611 (validKeyInArray!0 k!2102))))

(declare-fun b!753020 () Bool)

(declare-fun res!508618 () Bool)

(assert (=> b!753020 (=> (not res!508618) (not e!420010))))

(declare-fun arrayContainsKey!0 (array!41857 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!753020 (= res!508618 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!753021 () Bool)

(declare-fun res!508612 () Bool)

(assert (=> b!753021 (=> (not res!508612) (not e!420017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41857 (_ BitVec 32)) Bool)

(assert (=> b!753021 (= res!508612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!753022 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41857 (_ BitVec 32)) SeekEntryResult!7642)

(assert (=> b!753022 (= e!420011 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20042 a!3186) j!159) a!3186 mask!3328) (Found!7642 j!159)))))

(declare-fun b!753023 () Bool)

(declare-fun res!508619 () Bool)

(assert (=> b!753023 (=> (not res!508619) (not e!420015))))

(declare-fun lt!335009 () array!41857)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41857 (_ BitVec 32)) SeekEntryResult!7642)

(assert (=> b!753023 (= res!508619 (= (seekEntryOrOpen!0 lt!335006 lt!335009 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335006 lt!335009 mask!3328)))))

(declare-fun b!753024 () Bool)

(declare-fun res!508627 () Bool)

(assert (=> b!753024 (=> (not res!508627) (not e!420017))))

(declare-datatypes ((List!14044 0))(
  ( (Nil!14041) (Cons!14040 (h!15112 (_ BitVec 64)) (t!20359 List!14044)) )
))
(declare-fun arrayNoDuplicates!0 (array!41857 (_ BitVec 32) List!14044) Bool)

(assert (=> b!753024 (= res!508627 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14041))))

(declare-fun b!753025 () Bool)

(declare-fun res!508615 () Bool)

(assert (=> b!753025 (=> (not res!508615) (not e!420017))))

(assert (=> b!753025 (= res!508615 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20463 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20463 a!3186))))))

(declare-fun b!753026 () Bool)

(declare-fun e!420016 () Bool)

(assert (=> b!753026 (= e!420016 e!420014)))

(declare-fun res!508623 () Bool)

(assert (=> b!753026 (=> res!508623 e!420014)))

(declare-fun lt!335004 () SeekEntryResult!7642)

(assert (=> b!753026 (= res!508623 (not (= lt!335005 lt!335004)))))

(assert (=> b!753026 (= lt!335005 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20042 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!753027 () Bool)

(assert (=> b!753027 (= e!420010 e!420017)))

(declare-fun res!508624 () Bool)

(assert (=> b!753027 (=> (not res!508624) (not e!420017))))

(declare-fun lt!334998 () SeekEntryResult!7642)

(assert (=> b!753027 (= res!508624 (or (= lt!334998 (MissingZero!7642 i!1173)) (= lt!334998 (MissingVacant!7642 i!1173))))))

(assert (=> b!753027 (= lt!334998 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!753028 () Bool)

(declare-fun e!420007 () Bool)

(assert (=> b!753028 (= e!420007 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20042 a!3186) j!159) a!3186 mask!3328) lt!335004))))

(declare-fun b!753029 () Bool)

(declare-fun e!420009 () Bool)

(assert (=> b!753029 (= e!420009 (not e!420016))))

(declare-fun res!508617 () Bool)

(assert (=> b!753029 (=> res!508617 e!420016)))

(declare-fun lt!334999 () SeekEntryResult!7642)

(assert (=> b!753029 (= res!508617 (or (not (is-Intermediate!7642 lt!334999)) (bvslt x!1131 (x!63848 lt!334999)) (not (= x!1131 (x!63848 lt!334999))) (not (= index!1321 (index!32938 lt!334999)))))))

(assert (=> b!753029 e!420007))

(declare-fun res!508610 () Bool)

(assert (=> b!753029 (=> (not res!508610) (not e!420007))))

(assert (=> b!753029 (= res!508610 (= lt!335007 lt!335004))))

(assert (=> b!753029 (= lt!335004 (Found!7642 j!159))))

(assert (=> b!753029 (= lt!335007 (seekEntryOrOpen!0 (select (arr!20042 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!753029 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335002 () Unit!25948)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41857 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25948)

(assert (=> b!753029 (= lt!335002 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!753030 () Bool)

(declare-fun Unit!25950 () Unit!25948)

(assert (=> b!753030 (= e!420006 Unit!25950)))

(assert (=> b!753030 false))

(declare-fun b!753031 () Bool)

(declare-fun Unit!25951 () Unit!25948)

(assert (=> b!753031 (= e!420006 Unit!25951)))

(declare-fun b!753032 () Bool)

(assert (=> b!753032 (= e!420013 e!420009)))

(declare-fun res!508614 () Bool)

(assert (=> b!753032 (=> (not res!508614) (not e!420009))))

(declare-fun lt!335001 () SeekEntryResult!7642)

(assert (=> b!753032 (= res!508614 (= lt!335001 lt!334999))))

(assert (=> b!753032 (= lt!334999 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335006 lt!335009 mask!3328))))

(assert (=> b!753032 (= lt!335001 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335006 mask!3328) lt!335006 lt!335009 mask!3328))))

(assert (=> b!753032 (= lt!335006 (select (store (arr!20042 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!753032 (= lt!335009 (array!41858 (store (arr!20042 a!3186) i!1173 k!2102) (size!20463 a!3186)))))

(declare-fun b!753033 () Bool)

(declare-fun res!508622 () Bool)

(assert (=> b!753033 (=> (not res!508622) (not e!420013))))

(assert (=> b!753033 (= res!508622 e!420011)))

(declare-fun c!82581 () Bool)

(assert (=> b!753033 (= c!82581 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65684 res!508616) b!753015))

(assert (= (and b!753015 res!508626) b!753012))

(assert (= (and b!753012 res!508613) b!753019))

(assert (= (and b!753019 res!508611) b!753020))

(assert (= (and b!753020 res!508618) b!753027))

(assert (= (and b!753027 res!508624) b!753021))

(assert (= (and b!753021 res!508612) b!753024))

(assert (= (and b!753024 res!508627) b!753025))

(assert (= (and b!753025 res!508615) b!753014))

(assert (= (and b!753014 res!508620) b!753011))

(assert (= (and b!753011 res!508621) b!753033))

(assert (= (and b!753033 c!82581) b!753017))

(assert (= (and b!753033 (not c!82581)) b!753022))

(assert (= (and b!753033 res!508622) b!753032))

(assert (= (and b!753032 res!508614) b!753029))

(assert (= (and b!753029 res!508610) b!753028))

(assert (= (and b!753029 (not res!508617)) b!753026))

(assert (= (and b!753026 (not res!508623)) b!753018))

(assert (= (and b!753018 (not res!508625)) b!753013))

(assert (= (and b!753013 c!82582) b!753030))

(assert (= (and b!753013 (not c!82582)) b!753031))

(assert (= (and b!753013 res!508628) b!753023))

(assert (= (and b!753023 res!508619) b!753016))

(declare-fun m!701811 () Bool)

(assert (=> start!65684 m!701811))

(declare-fun m!701813 () Bool)

(assert (=> start!65684 m!701813))

(declare-fun m!701815 () Bool)

(assert (=> b!753023 m!701815))

(declare-fun m!701817 () Bool)

(assert (=> b!753023 m!701817))

(declare-fun m!701819 () Bool)

(assert (=> b!753018 m!701819))

(declare-fun m!701821 () Bool)

(assert (=> b!753018 m!701821))

(declare-fun m!701823 () Bool)

(assert (=> b!753027 m!701823))

(declare-fun m!701825 () Bool)

(assert (=> b!753014 m!701825))

(assert (=> b!753014 m!701825))

(declare-fun m!701827 () Bool)

(assert (=> b!753014 m!701827))

(assert (=> b!753014 m!701827))

(assert (=> b!753014 m!701825))

(declare-fun m!701829 () Bool)

(assert (=> b!753014 m!701829))

(assert (=> b!753022 m!701825))

(assert (=> b!753022 m!701825))

(declare-fun m!701831 () Bool)

(assert (=> b!753022 m!701831))

(assert (=> b!753012 m!701825))

(assert (=> b!753012 m!701825))

(declare-fun m!701833 () Bool)

(assert (=> b!753012 m!701833))

(declare-fun m!701835 () Bool)

(assert (=> b!753020 m!701835))

(declare-fun m!701837 () Bool)

(assert (=> b!753019 m!701837))

(declare-fun m!701839 () Bool)

(assert (=> b!753021 m!701839))

(declare-fun m!701841 () Bool)

(assert (=> b!753032 m!701841))

(declare-fun m!701843 () Bool)

(assert (=> b!753032 m!701843))

(assert (=> b!753032 m!701841))

(assert (=> b!753032 m!701819))

(declare-fun m!701845 () Bool)

(assert (=> b!753032 m!701845))

(declare-fun m!701847 () Bool)

(assert (=> b!753032 m!701847))

(assert (=> b!753026 m!701825))

(assert (=> b!753026 m!701825))

(assert (=> b!753026 m!701831))

(assert (=> b!753028 m!701825))

(assert (=> b!753028 m!701825))

(declare-fun m!701849 () Bool)

(assert (=> b!753028 m!701849))

(assert (=> b!753017 m!701825))

(assert (=> b!753017 m!701825))

(declare-fun m!701851 () Bool)

(assert (=> b!753017 m!701851))

(declare-fun m!701853 () Bool)

(assert (=> b!753011 m!701853))

(declare-fun m!701855 () Bool)

(assert (=> b!753024 m!701855))

(assert (=> b!753029 m!701825))

(assert (=> b!753029 m!701825))

(declare-fun m!701857 () Bool)

(assert (=> b!753029 m!701857))

(declare-fun m!701859 () Bool)

(assert (=> b!753029 m!701859))

(declare-fun m!701861 () Bool)

(assert (=> b!753029 m!701861))

(push 1)

