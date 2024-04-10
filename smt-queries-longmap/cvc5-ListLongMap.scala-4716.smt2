; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65356 () Bool)

(assert start!65356)

(declare-datatypes ((array!41529 0))(
  ( (array!41530 (arr!19878 (Array (_ BitVec 32) (_ BitVec 64))) (size!20299 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41529)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!742940 () Bool)

(declare-fun e!415165 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7478 0))(
  ( (MissingZero!7478 (index!32280 (_ BitVec 32))) (Found!7478 (index!32281 (_ BitVec 32))) (Intermediate!7478 (undefined!8290 Bool) (index!32282 (_ BitVec 32)) (x!63252 (_ BitVec 32))) (Undefined!7478) (MissingVacant!7478 (index!32283 (_ BitVec 32))) )
))
(declare-fun lt!330047 () SeekEntryResult!7478)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41529 (_ BitVec 32)) SeekEntryResult!7478)

(assert (=> b!742940 (= e!415165 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19878 a!3186) j!159) a!3186 mask!3328) lt!330047))))

(declare-fun b!742941 () Bool)

(declare-fun res!500092 () Bool)

(declare-fun e!415162 () Bool)

(assert (=> b!742941 (=> res!500092 e!415162)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!742941 (= res!500092 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19878 a!3186) j!159) a!3186 mask!3328) (Found!7478 j!159))))))

(declare-fun res!500096 () Bool)

(declare-fun e!415161 () Bool)

(assert (=> start!65356 (=> (not res!500096) (not e!415161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65356 (= res!500096 (validMask!0 mask!3328))))

(assert (=> start!65356 e!415161))

(assert (=> start!65356 true))

(declare-fun array_inv!15674 (array!41529) Bool)

(assert (=> start!65356 (array_inv!15674 a!3186)))

(declare-fun b!742942 () Bool)

(declare-fun e!415159 () Bool)

(assert (=> b!742942 (= e!415159 (not e!415162))))

(declare-fun res!500081 () Bool)

(assert (=> b!742942 (=> res!500081 e!415162)))

(declare-fun lt!330046 () SeekEntryResult!7478)

(assert (=> b!742942 (= res!500081 (or (not (is-Intermediate!7478 lt!330046)) (bvslt x!1131 (x!63252 lt!330046)) (not (= x!1131 (x!63252 lt!330046))) (not (= index!1321 (index!32282 lt!330046)))))))

(declare-fun e!415160 () Bool)

(assert (=> b!742942 e!415160))

(declare-fun res!500093 () Bool)

(assert (=> b!742942 (=> (not res!500093) (not e!415160))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41529 (_ BitVec 32)) Bool)

(assert (=> b!742942 (= res!500093 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25436 0))(
  ( (Unit!25437) )
))
(declare-fun lt!330048 () Unit!25436)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41529 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25436)

(assert (=> b!742942 (= lt!330048 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!742943 () Bool)

(declare-fun res!500088 () Bool)

(assert (=> b!742943 (=> (not res!500088) (not e!415161))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!742943 (= res!500088 (and (= (size!20299 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20299 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20299 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!742944 () Bool)

(declare-fun res!500091 () Bool)

(declare-fun e!415164 () Bool)

(assert (=> b!742944 (=> (not res!500091) (not e!415164))))

(assert (=> b!742944 (= res!500091 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19878 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!742945 () Bool)

(declare-fun e!415163 () Bool)

(assert (=> b!742945 (= e!415161 e!415163)))

(declare-fun res!500086 () Bool)

(assert (=> b!742945 (=> (not res!500086) (not e!415163))))

(declare-fun lt!330049 () SeekEntryResult!7478)

(assert (=> b!742945 (= res!500086 (or (= lt!330049 (MissingZero!7478 i!1173)) (= lt!330049 (MissingVacant!7478 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41529 (_ BitVec 32)) SeekEntryResult!7478)

(assert (=> b!742945 (= lt!330049 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!742946 () Bool)

(declare-fun res!500079 () Bool)

(assert (=> b!742946 (=> (not res!500079) (not e!415161))))

(declare-fun arrayContainsKey!0 (array!41529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742946 (= res!500079 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun e!415166 () Bool)

(declare-fun b!742947 () Bool)

(assert (=> b!742947 (= e!415166 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19878 a!3186) j!159) a!3186 mask!3328) (Found!7478 j!159)))))

(declare-fun b!742948 () Bool)

(declare-fun res!500085 () Bool)

(assert (=> b!742948 (=> (not res!500085) (not e!415164))))

(assert (=> b!742948 (= res!500085 e!415166)))

(declare-fun c!81811 () Bool)

(assert (=> b!742948 (= c!81811 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!742949 () Bool)

(declare-fun res!500082 () Bool)

(assert (=> b!742949 (=> (not res!500082) (not e!415163))))

(assert (=> b!742949 (= res!500082 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20299 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20299 a!3186))))))

(declare-fun b!742950 () Bool)

(assert (=> b!742950 (= e!415162 true)))

(declare-fun lt!330044 () SeekEntryResult!7478)

(declare-fun lt!330043 () array!41529)

(declare-fun lt!330050 () (_ BitVec 64))

(assert (=> b!742950 (= lt!330044 (seekEntryOrOpen!0 lt!330050 lt!330043 mask!3328))))

(declare-fun b!742951 () Bool)

(declare-fun res!500087 () Bool)

(assert (=> b!742951 (=> (not res!500087) (not e!415163))))

(assert (=> b!742951 (= res!500087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!742952 () Bool)

(declare-fun res!500094 () Bool)

(assert (=> b!742952 (=> (not res!500094) (not e!415163))))

(declare-datatypes ((List!13880 0))(
  ( (Nil!13877) (Cons!13876 (h!14948 (_ BitVec 64)) (t!20195 List!13880)) )
))
(declare-fun arrayNoDuplicates!0 (array!41529 (_ BitVec 32) List!13880) Bool)

(assert (=> b!742952 (= res!500094 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13877))))

(declare-fun b!742953 () Bool)

(declare-fun res!500080 () Bool)

(assert (=> b!742953 (=> res!500080 e!415162)))

(assert (=> b!742953 (= res!500080 (or (not (= (select (store (arr!19878 a!3186) i!1173 k!2102) index!1321) lt!330050)) (undefined!8290 lt!330046)))))

(declare-fun b!742954 () Bool)

(assert (=> b!742954 (= e!415163 e!415164)))

(declare-fun res!500084 () Bool)

(assert (=> b!742954 (=> (not res!500084) (not e!415164))))

(declare-fun lt!330045 () SeekEntryResult!7478)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41529 (_ BitVec 32)) SeekEntryResult!7478)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742954 (= res!500084 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19878 a!3186) j!159) mask!3328) (select (arr!19878 a!3186) j!159) a!3186 mask!3328) lt!330045))))

(assert (=> b!742954 (= lt!330045 (Intermediate!7478 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!742955 () Bool)

(declare-fun res!500095 () Bool)

(assert (=> b!742955 (=> (not res!500095) (not e!415161))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742955 (= res!500095 (validKeyInArray!0 (select (arr!19878 a!3186) j!159)))))

(declare-fun b!742956 () Bool)

(declare-fun res!500090 () Bool)

(assert (=> b!742956 (=> (not res!500090) (not e!415161))))

(assert (=> b!742956 (= res!500090 (validKeyInArray!0 k!2102))))

(declare-fun b!742957 () Bool)

(assert (=> b!742957 (= e!415166 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19878 a!3186) j!159) a!3186 mask!3328) lt!330045))))

(declare-fun b!742958 () Bool)

(assert (=> b!742958 (= e!415160 e!415165)))

(declare-fun res!500089 () Bool)

(assert (=> b!742958 (=> (not res!500089) (not e!415165))))

(assert (=> b!742958 (= res!500089 (= (seekEntryOrOpen!0 (select (arr!19878 a!3186) j!159) a!3186 mask!3328) lt!330047))))

(assert (=> b!742958 (= lt!330047 (Found!7478 j!159))))

(declare-fun b!742959 () Bool)

(assert (=> b!742959 (= e!415164 e!415159)))

(declare-fun res!500083 () Bool)

(assert (=> b!742959 (=> (not res!500083) (not e!415159))))

(declare-fun lt!330042 () SeekEntryResult!7478)

(assert (=> b!742959 (= res!500083 (= lt!330042 lt!330046))))

(assert (=> b!742959 (= lt!330046 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330050 lt!330043 mask!3328))))

(assert (=> b!742959 (= lt!330042 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330050 mask!3328) lt!330050 lt!330043 mask!3328))))

(assert (=> b!742959 (= lt!330050 (select (store (arr!19878 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!742959 (= lt!330043 (array!41530 (store (arr!19878 a!3186) i!1173 k!2102) (size!20299 a!3186)))))

(assert (= (and start!65356 res!500096) b!742943))

(assert (= (and b!742943 res!500088) b!742955))

(assert (= (and b!742955 res!500095) b!742956))

(assert (= (and b!742956 res!500090) b!742946))

(assert (= (and b!742946 res!500079) b!742945))

(assert (= (and b!742945 res!500086) b!742951))

(assert (= (and b!742951 res!500087) b!742952))

(assert (= (and b!742952 res!500094) b!742949))

(assert (= (and b!742949 res!500082) b!742954))

(assert (= (and b!742954 res!500084) b!742944))

(assert (= (and b!742944 res!500091) b!742948))

(assert (= (and b!742948 c!81811) b!742957))

(assert (= (and b!742948 (not c!81811)) b!742947))

(assert (= (and b!742948 res!500085) b!742959))

(assert (= (and b!742959 res!500083) b!742942))

(assert (= (and b!742942 res!500093) b!742958))

(assert (= (and b!742958 res!500089) b!742940))

(assert (= (and b!742942 (not res!500081)) b!742941))

(assert (= (and b!742941 (not res!500092)) b!742953))

(assert (= (and b!742953 (not res!500080)) b!742950))

(declare-fun m!693721 () Bool)

(assert (=> b!742945 m!693721))

(declare-fun m!693723 () Bool)

(assert (=> b!742953 m!693723))

(declare-fun m!693725 () Bool)

(assert (=> b!742953 m!693725))

(declare-fun m!693727 () Bool)

(assert (=> b!742946 m!693727))

(declare-fun m!693729 () Bool)

(assert (=> b!742954 m!693729))

(assert (=> b!742954 m!693729))

(declare-fun m!693731 () Bool)

(assert (=> b!742954 m!693731))

(assert (=> b!742954 m!693731))

(assert (=> b!742954 m!693729))

(declare-fun m!693733 () Bool)

(assert (=> b!742954 m!693733))

(assert (=> b!742940 m!693729))

(assert (=> b!742940 m!693729))

(declare-fun m!693735 () Bool)

(assert (=> b!742940 m!693735))

(declare-fun m!693737 () Bool)

(assert (=> b!742951 m!693737))

(declare-fun m!693739 () Bool)

(assert (=> b!742950 m!693739))

(declare-fun m!693741 () Bool)

(assert (=> b!742959 m!693741))

(declare-fun m!693743 () Bool)

(assert (=> b!742959 m!693743))

(declare-fun m!693745 () Bool)

(assert (=> b!742959 m!693745))

(assert (=> b!742959 m!693743))

(assert (=> b!742959 m!693723))

(declare-fun m!693747 () Bool)

(assert (=> b!742959 m!693747))

(assert (=> b!742958 m!693729))

(assert (=> b!742958 m!693729))

(declare-fun m!693749 () Bool)

(assert (=> b!742958 m!693749))

(assert (=> b!742941 m!693729))

(assert (=> b!742941 m!693729))

(declare-fun m!693751 () Bool)

(assert (=> b!742941 m!693751))

(declare-fun m!693753 () Bool)

(assert (=> b!742952 m!693753))

(assert (=> b!742947 m!693729))

(assert (=> b!742947 m!693729))

(assert (=> b!742947 m!693751))

(assert (=> b!742955 m!693729))

(assert (=> b!742955 m!693729))

(declare-fun m!693755 () Bool)

(assert (=> b!742955 m!693755))

(declare-fun m!693757 () Bool)

(assert (=> b!742956 m!693757))

(declare-fun m!693759 () Bool)

(assert (=> b!742944 m!693759))

(declare-fun m!693761 () Bool)

(assert (=> b!742942 m!693761))

(declare-fun m!693763 () Bool)

(assert (=> b!742942 m!693763))

(declare-fun m!693765 () Bool)

(assert (=> start!65356 m!693765))

(declare-fun m!693767 () Bool)

(assert (=> start!65356 m!693767))

(assert (=> b!742957 m!693729))

(assert (=> b!742957 m!693729))

(declare-fun m!693769 () Bool)

(assert (=> b!742957 m!693769))

(push 1)

