; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67764 () Bool)

(assert start!67764)

(declare-fun b!787070 () Bool)

(declare-fun e!437506 () Bool)

(declare-fun e!437511 () Bool)

(assert (=> b!787070 (= e!437506 (not e!437511))))

(declare-fun res!533024 () Bool)

(assert (=> b!787070 (=> res!533024 e!437511)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8090 0))(
  ( (MissingZero!8090 (index!34728 (_ BitVec 32))) (Found!8090 (index!34729 (_ BitVec 32))) (Intermediate!8090 (undefined!8902 Bool) (index!34730 (_ BitVec 32)) (x!65670 (_ BitVec 32))) (Undefined!8090) (MissingVacant!8090 (index!34731 (_ BitVec 32))) )
))
(declare-fun lt!351058 () SeekEntryResult!8090)

(assert (=> b!787070 (= res!533024 (or (not (is-Intermediate!8090 lt!351058)) (bvslt x!1131 (x!65670 lt!351058)) (not (= x!1131 (x!65670 lt!351058))) (not (= index!1321 (index!34730 lt!351058)))))))

(declare-fun e!437512 () Bool)

(assert (=> b!787070 e!437512))

(declare-fun res!533009 () Bool)

(assert (=> b!787070 (=> (not res!533009) (not e!437512))))

(declare-fun lt!351067 () SeekEntryResult!8090)

(declare-fun lt!351065 () SeekEntryResult!8090)

(assert (=> b!787070 (= res!533009 (= lt!351067 lt!351065))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!787070 (= lt!351065 (Found!8090 j!159))))

(declare-datatypes ((array!42804 0))(
  ( (array!42805 (arr!20490 (Array (_ BitVec 32) (_ BitVec 64))) (size!20911 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42804)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42804 (_ BitVec 32)) SeekEntryResult!8090)

(assert (=> b!787070 (= lt!351067 (seekEntryOrOpen!0 (select (arr!20490 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42804 (_ BitVec 32)) Bool)

(assert (=> b!787070 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27248 0))(
  ( (Unit!27249) )
))
(declare-fun lt!351068 () Unit!27248)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42804 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27248)

(assert (=> b!787070 (= lt!351068 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!787071 () Bool)

(declare-fun e!437505 () Bool)

(declare-fun e!437513 () Bool)

(assert (=> b!787071 (= e!437505 e!437513)))

(declare-fun res!533023 () Bool)

(assert (=> b!787071 (=> res!533023 e!437513)))

(declare-fun lt!351061 () (_ BitVec 64))

(declare-fun lt!351066 () (_ BitVec 64))

(assert (=> b!787071 (= res!533023 (= lt!351061 lt!351066))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!787071 (= lt!351061 (select (store (arr!20490 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!787072 () Bool)

(assert (=> b!787072 (= e!437513 true)))

(declare-fun e!437508 () Bool)

(assert (=> b!787072 e!437508))

(declare-fun res!533026 () Bool)

(assert (=> b!787072 (=> (not res!533026) (not e!437508))))

(assert (=> b!787072 (= res!533026 (= lt!351061 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351057 () Unit!27248)

(declare-fun e!437507 () Unit!27248)

(assert (=> b!787072 (= lt!351057 e!437507)))

(declare-fun c!87438 () Bool)

(assert (=> b!787072 (= c!87438 (= lt!351061 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!787073 () Bool)

(declare-fun Unit!27250 () Unit!27248)

(assert (=> b!787073 (= e!437507 Unit!27250)))

(assert (=> b!787073 false))

(declare-fun b!787074 () Bool)

(declare-fun res!533022 () Bool)

(declare-fun e!437516 () Bool)

(assert (=> b!787074 (=> (not res!533022) (not e!437516))))

(declare-fun e!437509 () Bool)

(assert (=> b!787074 (= res!533022 e!437509)))

(declare-fun c!87439 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!787074 (= c!87439 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!787075 () Bool)

(declare-fun e!437510 () Bool)

(declare-fun e!437515 () Bool)

(assert (=> b!787075 (= e!437510 e!437515)))

(declare-fun res!533010 () Bool)

(assert (=> b!787075 (=> (not res!533010) (not e!437515))))

(declare-fun lt!351062 () SeekEntryResult!8090)

(assert (=> b!787075 (= res!533010 (or (= lt!351062 (MissingZero!8090 i!1173)) (= lt!351062 (MissingVacant!8090 i!1173))))))

(assert (=> b!787075 (= lt!351062 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!787076 () Bool)

(declare-fun res!533015 () Bool)

(assert (=> b!787076 (=> (not res!533015) (not e!437515))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!787076 (= res!533015 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20911 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20911 a!3186))))))

(declare-fun b!787077 () Bool)

(declare-fun res!533011 () Bool)

(assert (=> b!787077 (=> (not res!533011) (not e!437510))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!787077 (= res!533011 (validKeyInArray!0 (select (arr!20490 a!3186) j!159)))))

(declare-fun b!787078 () Bool)

(declare-fun res!533018 () Bool)

(assert (=> b!787078 (=> (not res!533018) (not e!437510))))

(assert (=> b!787078 (= res!533018 (validKeyInArray!0 k!2102))))

(declare-fun b!787079 () Bool)

(declare-fun res!533019 () Bool)

(assert (=> b!787079 (=> (not res!533019) (not e!437515))))

(declare-datatypes ((List!14492 0))(
  ( (Nil!14489) (Cons!14488 (h!15611 (_ BitVec 64)) (t!20807 List!14492)) )
))
(declare-fun arrayNoDuplicates!0 (array!42804 (_ BitVec 32) List!14492) Bool)

(assert (=> b!787079 (= res!533019 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14489))))

(declare-fun res!533017 () Bool)

(assert (=> start!67764 (=> (not res!533017) (not e!437510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67764 (= res!533017 (validMask!0 mask!3328))))

(assert (=> start!67764 e!437510))

(assert (=> start!67764 true))

(declare-fun array_inv!16286 (array!42804) Bool)

(assert (=> start!67764 (array_inv!16286 a!3186)))

(declare-fun b!787080 () Bool)

(declare-fun res!533016 () Bool)

(assert (=> b!787080 (=> (not res!533016) (not e!437510))))

(declare-fun arrayContainsKey!0 (array!42804 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!787080 (= res!533016 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!787081 () Bool)

(assert (=> b!787081 (= e!437515 e!437516)))

(declare-fun res!533014 () Bool)

(assert (=> b!787081 (=> (not res!533014) (not e!437516))))

(declare-fun lt!351060 () SeekEntryResult!8090)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42804 (_ BitVec 32)) SeekEntryResult!8090)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!787081 (= res!533014 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20490 a!3186) j!159) mask!3328) (select (arr!20490 a!3186) j!159) a!3186 mask!3328) lt!351060))))

(assert (=> b!787081 (= lt!351060 (Intermediate!8090 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!787082 () Bool)

(declare-fun res!533027 () Bool)

(assert (=> b!787082 (=> (not res!533027) (not e!437516))))

(assert (=> b!787082 (= res!533027 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20490 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!787083 () Bool)

(declare-fun res!533013 () Bool)

(assert (=> b!787083 (=> (not res!533013) (not e!437508))))

(declare-fun lt!351059 () array!42804)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42804 (_ BitVec 32)) SeekEntryResult!8090)

(assert (=> b!787083 (= res!533013 (= (seekEntryOrOpen!0 lt!351066 lt!351059 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351066 lt!351059 mask!3328)))))

(declare-fun b!787084 () Bool)

(assert (=> b!787084 (= e!437512 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20490 a!3186) j!159) a!3186 mask!3328) lt!351065))))

(declare-fun b!787085 () Bool)

(declare-fun lt!351064 () SeekEntryResult!8090)

(assert (=> b!787085 (= e!437508 (= lt!351067 lt!351064))))

(declare-fun b!787086 () Bool)

(assert (=> b!787086 (= e!437509 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20490 a!3186) j!159) a!3186 mask!3328) (Found!8090 j!159)))))

(declare-fun b!787087 () Bool)

(declare-fun res!533012 () Bool)

(assert (=> b!787087 (=> (not res!533012) (not e!437510))))

(assert (=> b!787087 (= res!533012 (and (= (size!20911 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20911 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20911 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!787088 () Bool)

(assert (=> b!787088 (= e!437516 e!437506)))

(declare-fun res!533020 () Bool)

(assert (=> b!787088 (=> (not res!533020) (not e!437506))))

(declare-fun lt!351063 () SeekEntryResult!8090)

(assert (=> b!787088 (= res!533020 (= lt!351063 lt!351058))))

(assert (=> b!787088 (= lt!351058 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351066 lt!351059 mask!3328))))

(assert (=> b!787088 (= lt!351063 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351066 mask!3328) lt!351066 lt!351059 mask!3328))))

(assert (=> b!787088 (= lt!351066 (select (store (arr!20490 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!787088 (= lt!351059 (array!42805 (store (arr!20490 a!3186) i!1173 k!2102) (size!20911 a!3186)))))

(declare-fun b!787089 () Bool)

(declare-fun Unit!27251 () Unit!27248)

(assert (=> b!787089 (= e!437507 Unit!27251)))

(declare-fun b!787090 () Bool)

(declare-fun res!533021 () Bool)

(assert (=> b!787090 (=> (not res!533021) (not e!437515))))

(assert (=> b!787090 (= res!533021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!787091 () Bool)

(assert (=> b!787091 (= e!437509 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20490 a!3186) j!159) a!3186 mask!3328) lt!351060))))

(declare-fun b!787092 () Bool)

(assert (=> b!787092 (= e!437511 e!437505)))

(declare-fun res!533025 () Bool)

(assert (=> b!787092 (=> res!533025 e!437505)))

(assert (=> b!787092 (= res!533025 (not (= lt!351064 lt!351065)))))

(assert (=> b!787092 (= lt!351064 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20490 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!67764 res!533017) b!787087))

(assert (= (and b!787087 res!533012) b!787077))

(assert (= (and b!787077 res!533011) b!787078))

(assert (= (and b!787078 res!533018) b!787080))

(assert (= (and b!787080 res!533016) b!787075))

(assert (= (and b!787075 res!533010) b!787090))

(assert (= (and b!787090 res!533021) b!787079))

(assert (= (and b!787079 res!533019) b!787076))

(assert (= (and b!787076 res!533015) b!787081))

(assert (= (and b!787081 res!533014) b!787082))

(assert (= (and b!787082 res!533027) b!787074))

(assert (= (and b!787074 c!87439) b!787091))

(assert (= (and b!787074 (not c!87439)) b!787086))

(assert (= (and b!787074 res!533022) b!787088))

(assert (= (and b!787088 res!533020) b!787070))

(assert (= (and b!787070 res!533009) b!787084))

(assert (= (and b!787070 (not res!533024)) b!787092))

(assert (= (and b!787092 (not res!533025)) b!787071))

(assert (= (and b!787071 (not res!533023)) b!787072))

(assert (= (and b!787072 c!87438) b!787073))

(assert (= (and b!787072 (not c!87438)) b!787089))

(assert (= (and b!787072 res!533026) b!787083))

(assert (= (and b!787083 res!533013) b!787085))

(declare-fun m!728741 () Bool)

(assert (=> b!787077 m!728741))

(assert (=> b!787077 m!728741))

(declare-fun m!728743 () Bool)

(assert (=> b!787077 m!728743))

(declare-fun m!728745 () Bool)

(assert (=> b!787083 m!728745))

(declare-fun m!728747 () Bool)

(assert (=> b!787083 m!728747))

(assert (=> b!787084 m!728741))

(assert (=> b!787084 m!728741))

(declare-fun m!728749 () Bool)

(assert (=> b!787084 m!728749))

(declare-fun m!728751 () Bool)

(assert (=> b!787080 m!728751))

(assert (=> b!787091 m!728741))

(assert (=> b!787091 m!728741))

(declare-fun m!728753 () Bool)

(assert (=> b!787091 m!728753))

(declare-fun m!728755 () Bool)

(assert (=> start!67764 m!728755))

(declare-fun m!728757 () Bool)

(assert (=> start!67764 m!728757))

(assert (=> b!787092 m!728741))

(assert (=> b!787092 m!728741))

(declare-fun m!728759 () Bool)

(assert (=> b!787092 m!728759))

(assert (=> b!787070 m!728741))

(assert (=> b!787070 m!728741))

(declare-fun m!728761 () Bool)

(assert (=> b!787070 m!728761))

(declare-fun m!728763 () Bool)

(assert (=> b!787070 m!728763))

(declare-fun m!728765 () Bool)

(assert (=> b!787070 m!728765))

(declare-fun m!728767 () Bool)

(assert (=> b!787078 m!728767))

(assert (=> b!787081 m!728741))

(assert (=> b!787081 m!728741))

(declare-fun m!728769 () Bool)

(assert (=> b!787081 m!728769))

(assert (=> b!787081 m!728769))

(assert (=> b!787081 m!728741))

(declare-fun m!728771 () Bool)

(assert (=> b!787081 m!728771))

(declare-fun m!728773 () Bool)

(assert (=> b!787071 m!728773))

(declare-fun m!728775 () Bool)

(assert (=> b!787071 m!728775))

(assert (=> b!787088 m!728773))

(declare-fun m!728777 () Bool)

(assert (=> b!787088 m!728777))

(declare-fun m!728779 () Bool)

(assert (=> b!787088 m!728779))

(declare-fun m!728781 () Bool)

(assert (=> b!787088 m!728781))

(assert (=> b!787088 m!728781))

(declare-fun m!728783 () Bool)

(assert (=> b!787088 m!728783))

(declare-fun m!728785 () Bool)

(assert (=> b!787075 m!728785))

(assert (=> b!787086 m!728741))

(assert (=> b!787086 m!728741))

(assert (=> b!787086 m!728759))

(declare-fun m!728787 () Bool)

(assert (=> b!787090 m!728787))

(declare-fun m!728789 () Bool)

(assert (=> b!787082 m!728789))

(declare-fun m!728791 () Bool)

(assert (=> b!787079 m!728791))

(push 1)

