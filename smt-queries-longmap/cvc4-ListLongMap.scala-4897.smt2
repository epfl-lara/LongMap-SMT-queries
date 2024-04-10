; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67564 () Bool)

(assert start!67564)

(declare-fun b!782077 () Bool)

(declare-fun res!529154 () Bool)

(declare-fun e!434918 () Bool)

(assert (=> b!782077 (=> (not res!529154) (not e!434918))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!782077 (= res!529154 (validKeyInArray!0 k!2102))))

(declare-fun b!782078 () Bool)

(declare-fun res!529155 () Bool)

(assert (=> b!782078 (=> (not res!529155) (not e!434918))))

(declare-datatypes ((array!42667 0))(
  ( (array!42668 (arr!20423 (Array (_ BitVec 32) (_ BitVec 64))) (size!20844 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42667)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!782078 (= res!529155 (validKeyInArray!0 (select (arr!20423 a!3186) j!159)))))

(declare-fun b!782079 () Bool)

(declare-datatypes ((Unit!26980 0))(
  ( (Unit!26981) )
))
(declare-fun e!434924 () Unit!26980)

(declare-fun Unit!26982 () Unit!26980)

(assert (=> b!782079 (= e!434924 Unit!26982)))

(assert (=> b!782079 false))

(declare-fun b!782080 () Bool)

(declare-fun res!529163 () Bool)

(assert (=> b!782080 (=> (not res!529163) (not e!434918))))

(declare-fun arrayContainsKey!0 (array!42667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!782080 (= res!529163 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!782081 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!434921 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8023 0))(
  ( (MissingZero!8023 (index!34460 (_ BitVec 32))) (Found!8023 (index!34461 (_ BitVec 32))) (Intermediate!8023 (undefined!8835 Bool) (index!34462 (_ BitVec 32)) (x!65410 (_ BitVec 32))) (Undefined!8023) (MissingVacant!8023 (index!34463 (_ BitVec 32))) )
))
(declare-fun lt!348530 () SeekEntryResult!8023)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42667 (_ BitVec 32)) SeekEntryResult!8023)

(assert (=> b!782081 (= e!434921 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20423 a!3186) j!159) a!3186 mask!3328) lt!348530))))

(declare-fun b!782082 () Bool)

(declare-fun e!434919 () Bool)

(declare-fun e!434916 () Bool)

(assert (=> b!782082 (= e!434919 e!434916)))

(declare-fun res!529147 () Bool)

(assert (=> b!782082 (=> (not res!529147) (not e!434916))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!782082 (= res!529147 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20423 a!3186) j!159) mask!3328) (select (arr!20423 a!3186) j!159) a!3186 mask!3328) lt!348530))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!782082 (= lt!348530 (Intermediate!8023 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!782083 () Bool)

(declare-fun e!434920 () Bool)

(declare-fun e!434923 () Bool)

(assert (=> b!782083 (= e!434920 (not e!434923))))

(declare-fun res!529161 () Bool)

(assert (=> b!782083 (=> res!529161 e!434923)))

(declare-fun lt!348535 () SeekEntryResult!8023)

(assert (=> b!782083 (= res!529161 (or (not (is-Intermediate!8023 lt!348535)) (bvslt x!1131 (x!65410 lt!348535)) (not (= x!1131 (x!65410 lt!348535))) (not (= index!1321 (index!34462 lt!348535)))))))

(declare-fun e!434917 () Bool)

(assert (=> b!782083 e!434917))

(declare-fun res!529149 () Bool)

(assert (=> b!782083 (=> (not res!529149) (not e!434917))))

(declare-fun lt!348532 () SeekEntryResult!8023)

(declare-fun lt!348533 () SeekEntryResult!8023)

(assert (=> b!782083 (= res!529149 (= lt!348532 lt!348533))))

(assert (=> b!782083 (= lt!348533 (Found!8023 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42667 (_ BitVec 32)) SeekEntryResult!8023)

(assert (=> b!782083 (= lt!348532 (seekEntryOrOpen!0 (select (arr!20423 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42667 (_ BitVec 32)) Bool)

(assert (=> b!782083 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348534 () Unit!26980)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42667 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26980)

(assert (=> b!782083 (= lt!348534 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!782084 () Bool)

(declare-fun Unit!26983 () Unit!26980)

(assert (=> b!782084 (= e!434924 Unit!26983)))

(declare-fun b!782085 () Bool)

(declare-fun res!529157 () Bool)

(assert (=> b!782085 (=> res!529157 e!434923)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun lt!348538 () (_ BitVec 64))

(assert (=> b!782085 (= res!529157 (= (select (store (arr!20423 a!3186) i!1173 k!2102) index!1321) lt!348538))))

(declare-fun b!782086 () Bool)

(declare-fun res!529158 () Bool)

(assert (=> b!782086 (=> (not res!529158) (not e!434919))))

(assert (=> b!782086 (= res!529158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!529162 () Bool)

(assert (=> start!67564 (=> (not res!529162) (not e!434918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67564 (= res!529162 (validMask!0 mask!3328))))

(assert (=> start!67564 e!434918))

(assert (=> start!67564 true))

(declare-fun array_inv!16219 (array!42667) Bool)

(assert (=> start!67564 (array_inv!16219 a!3186)))

(declare-fun b!782087 () Bool)

(declare-fun res!529159 () Bool)

(assert (=> b!782087 (=> (not res!529159) (not e!434919))))

(declare-datatypes ((List!14425 0))(
  ( (Nil!14422) (Cons!14421 (h!15541 (_ BitVec 64)) (t!20740 List!14425)) )
))
(declare-fun arrayNoDuplicates!0 (array!42667 (_ BitVec 32) List!14425) Bool)

(assert (=> b!782087 (= res!529159 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14422))))

(declare-fun b!782088 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42667 (_ BitVec 32)) SeekEntryResult!8023)

(assert (=> b!782088 (= e!434917 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20423 a!3186) j!159) a!3186 mask!3328) lt!348533))))

(declare-fun b!782089 () Bool)

(declare-fun res!529148 () Bool)

(assert (=> b!782089 (=> (not res!529148) (not e!434919))))

(assert (=> b!782089 (= res!529148 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20844 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20844 a!3186))))))

(declare-fun b!782090 () Bool)

(declare-fun res!529152 () Bool)

(assert (=> b!782090 (=> (not res!529152) (not e!434918))))

(assert (=> b!782090 (= res!529152 (and (= (size!20844 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20844 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20844 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!782091 () Bool)

(assert (=> b!782091 (= e!434916 e!434920)))

(declare-fun res!529153 () Bool)

(assert (=> b!782091 (=> (not res!529153) (not e!434920))))

(declare-fun lt!348539 () SeekEntryResult!8023)

(assert (=> b!782091 (= res!529153 (= lt!348539 lt!348535))))

(declare-fun lt!348537 () array!42667)

(assert (=> b!782091 (= lt!348535 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348538 lt!348537 mask!3328))))

(assert (=> b!782091 (= lt!348539 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348538 mask!3328) lt!348538 lt!348537 mask!3328))))

(assert (=> b!782091 (= lt!348538 (select (store (arr!20423 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!782091 (= lt!348537 (array!42668 (store (arr!20423 a!3186) i!1173 k!2102) (size!20844 a!3186)))))

(declare-fun b!782092 () Bool)

(declare-fun res!529151 () Bool)

(assert (=> b!782092 (=> (not res!529151) (not e!434916))))

(assert (=> b!782092 (= res!529151 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20423 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!782093 () Bool)

(declare-fun res!529160 () Bool)

(assert (=> b!782093 (=> res!529160 e!434923)))

(assert (=> b!782093 (= res!529160 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20423 a!3186) j!159) a!3186 mask!3328) lt!348533)))))

(declare-fun b!782094 () Bool)

(assert (=> b!782094 (= e!434923 true)))

(assert (=> b!782094 (= (select (store (arr!20423 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348531 () Unit!26980)

(assert (=> b!782094 (= lt!348531 e!434924)))

(declare-fun c!86871 () Bool)

(assert (=> b!782094 (= c!86871 (= (select (store (arr!20423 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!782095 () Bool)

(declare-fun res!529156 () Bool)

(assert (=> b!782095 (=> (not res!529156) (not e!434916))))

(assert (=> b!782095 (= res!529156 e!434921)))

(declare-fun c!86872 () Bool)

(assert (=> b!782095 (= c!86872 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!782096 () Bool)

(assert (=> b!782096 (= e!434918 e!434919)))

(declare-fun res!529150 () Bool)

(assert (=> b!782096 (=> (not res!529150) (not e!434919))))

(declare-fun lt!348536 () SeekEntryResult!8023)

(assert (=> b!782096 (= res!529150 (or (= lt!348536 (MissingZero!8023 i!1173)) (= lt!348536 (MissingVacant!8023 i!1173))))))

(assert (=> b!782096 (= lt!348536 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!782097 () Bool)

(assert (=> b!782097 (= e!434921 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20423 a!3186) j!159) a!3186 mask!3328) (Found!8023 j!159)))))

(assert (= (and start!67564 res!529162) b!782090))

(assert (= (and b!782090 res!529152) b!782078))

(assert (= (and b!782078 res!529155) b!782077))

(assert (= (and b!782077 res!529154) b!782080))

(assert (= (and b!782080 res!529163) b!782096))

(assert (= (and b!782096 res!529150) b!782086))

(assert (= (and b!782086 res!529158) b!782087))

(assert (= (and b!782087 res!529159) b!782089))

(assert (= (and b!782089 res!529148) b!782082))

(assert (= (and b!782082 res!529147) b!782092))

(assert (= (and b!782092 res!529151) b!782095))

(assert (= (and b!782095 c!86872) b!782081))

(assert (= (and b!782095 (not c!86872)) b!782097))

(assert (= (and b!782095 res!529156) b!782091))

(assert (= (and b!782091 res!529153) b!782083))

(assert (= (and b!782083 res!529149) b!782088))

(assert (= (and b!782083 (not res!529161)) b!782093))

(assert (= (and b!782093 (not res!529160)) b!782085))

(assert (= (and b!782085 (not res!529157)) b!782094))

(assert (= (and b!782094 c!86871) b!782079))

(assert (= (and b!782094 (not c!86871)) b!782084))

(declare-fun m!724955 () Bool)

(assert (=> b!782087 m!724955))

(declare-fun m!724957 () Bool)

(assert (=> b!782078 m!724957))

(assert (=> b!782078 m!724957))

(declare-fun m!724959 () Bool)

(assert (=> b!782078 m!724959))

(declare-fun m!724961 () Bool)

(assert (=> start!67564 m!724961))

(declare-fun m!724963 () Bool)

(assert (=> start!67564 m!724963))

(assert (=> b!782083 m!724957))

(assert (=> b!782083 m!724957))

(declare-fun m!724965 () Bool)

(assert (=> b!782083 m!724965))

(declare-fun m!724967 () Bool)

(assert (=> b!782083 m!724967))

(declare-fun m!724969 () Bool)

(assert (=> b!782083 m!724969))

(assert (=> b!782093 m!724957))

(assert (=> b!782093 m!724957))

(declare-fun m!724971 () Bool)

(assert (=> b!782093 m!724971))

(declare-fun m!724973 () Bool)

(assert (=> b!782091 m!724973))

(declare-fun m!724975 () Bool)

(assert (=> b!782091 m!724975))

(declare-fun m!724977 () Bool)

(assert (=> b!782091 m!724977))

(assert (=> b!782091 m!724975))

(declare-fun m!724979 () Bool)

(assert (=> b!782091 m!724979))

(declare-fun m!724981 () Bool)

(assert (=> b!782091 m!724981))

(declare-fun m!724983 () Bool)

(assert (=> b!782077 m!724983))

(assert (=> b!782094 m!724973))

(declare-fun m!724985 () Bool)

(assert (=> b!782094 m!724985))

(declare-fun m!724987 () Bool)

(assert (=> b!782096 m!724987))

(declare-fun m!724989 () Bool)

(assert (=> b!782086 m!724989))

(assert (=> b!782081 m!724957))

(assert (=> b!782081 m!724957))

(declare-fun m!724991 () Bool)

(assert (=> b!782081 m!724991))

(assert (=> b!782088 m!724957))

(assert (=> b!782088 m!724957))

(declare-fun m!724993 () Bool)

(assert (=> b!782088 m!724993))

(declare-fun m!724995 () Bool)

(assert (=> b!782092 m!724995))

(assert (=> b!782082 m!724957))

(assert (=> b!782082 m!724957))

(declare-fun m!724997 () Bool)

(assert (=> b!782082 m!724997))

(assert (=> b!782082 m!724997))

(assert (=> b!782082 m!724957))

(declare-fun m!724999 () Bool)

(assert (=> b!782082 m!724999))

(assert (=> b!782097 m!724957))

(assert (=> b!782097 m!724957))

(assert (=> b!782097 m!724971))

(declare-fun m!725001 () Bool)

(assert (=> b!782080 m!725001))

(assert (=> b!782085 m!724973))

(assert (=> b!782085 m!724985))

(push 1)

