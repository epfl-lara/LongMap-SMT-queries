; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65200 () Bool)

(assert start!65200)

(declare-fun lt!327503 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7400 0))(
  ( (MissingZero!7400 (index!31968 (_ BitVec 32))) (Found!7400 (index!31969 (_ BitVec 32))) (Intermediate!7400 (undefined!8212 Bool) (index!31970 (_ BitVec 32)) (x!62966 (_ BitVec 32))) (Undefined!7400) (MissingVacant!7400 (index!31971 (_ BitVec 32))) )
))
(declare-fun lt!327507 () SeekEntryResult!7400)

(declare-datatypes ((array!41373 0))(
  ( (array!41374 (arr!19800 (Array (_ BitVec 32) (_ BitVec 64))) (size!20221 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41373)

(declare-fun e!412749 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!737980 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41373 (_ BitVec 32)) SeekEntryResult!7400)

(assert (=> b!737980 (= e!412749 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327503 (select (arr!19800 a!3186) j!159) a!3186 mask!3328) lt!327507)))))

(declare-fun b!737981 () Bool)

(declare-fun res!496096 () Bool)

(declare-fun e!412752 () Bool)

(assert (=> b!737981 (=> (not res!496096) (not e!412752))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!737981 (= res!496096 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19800 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!737982 () Bool)

(declare-fun res!496086 () Bool)

(declare-fun e!412744 () Bool)

(assert (=> b!737982 (=> (not res!496086) (not e!412744))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41373 (_ BitVec 32)) Bool)

(assert (=> b!737982 (= res!496086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!737983 () Bool)

(declare-fun e!412746 () Bool)

(assert (=> b!737983 (= e!412746 e!412744)))

(declare-fun res!496088 () Bool)

(assert (=> b!737983 (=> (not res!496088) (not e!412744))))

(declare-fun lt!327502 () SeekEntryResult!7400)

(assert (=> b!737983 (= res!496088 (or (= lt!327502 (MissingZero!7400 i!1173)) (= lt!327502 (MissingVacant!7400 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41373 (_ BitVec 32)) SeekEntryResult!7400)

(assert (=> b!737983 (= lt!327502 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!737984 () Bool)

(declare-fun e!412751 () Bool)

(declare-fun e!412748 () Bool)

(assert (=> b!737984 (= e!412751 (not e!412748))))

(declare-fun res!496099 () Bool)

(assert (=> b!737984 (=> res!496099 e!412748)))

(declare-fun lt!327509 () SeekEntryResult!7400)

(assert (=> b!737984 (= res!496099 (or (not (is-Intermediate!7400 lt!327509)) (bvsge x!1131 (x!62966 lt!327509))))))

(declare-fun lt!327497 () SeekEntryResult!7400)

(assert (=> b!737984 (= lt!327497 (Found!7400 j!159))))

(declare-fun e!412743 () Bool)

(assert (=> b!737984 e!412743))

(declare-fun res!496085 () Bool)

(assert (=> b!737984 (=> (not res!496085) (not e!412743))))

(assert (=> b!737984 (= res!496085 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25196 0))(
  ( (Unit!25197) )
))
(declare-fun lt!327496 () Unit!25196)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41373 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25196)

(assert (=> b!737984 (= lt!327496 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!737985 () Bool)

(declare-fun e!412750 () Unit!25196)

(declare-fun Unit!25198 () Unit!25196)

(assert (=> b!737985 (= e!412750 Unit!25198)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!327506 () SeekEntryResult!7400)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41373 (_ BitVec 32)) SeekEntryResult!7400)

(assert (=> b!737985 (= lt!327506 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19800 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!737985 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327503 resIntermediateIndex!5 (select (arr!19800 a!3186) j!159) a!3186 mask!3328) lt!327497)))

(declare-fun b!737986 () Bool)

(declare-fun res!496087 () Bool)

(assert (=> b!737986 (=> (not res!496087) (not e!412752))))

(declare-fun e!412754 () Bool)

(assert (=> b!737986 (= res!496087 e!412754)))

(declare-fun c!81330 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!737986 (= c!81330 (bvsle x!1131 resIntermediateX!5))))

(declare-fun e!412753 () Bool)

(declare-fun b!737987 () Bool)

(declare-fun lt!327508 () SeekEntryResult!7400)

(assert (=> b!737987 (= e!412753 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19800 a!3186) j!159) a!3186 mask!3328) lt!327508))))

(declare-fun b!737988 () Bool)

(declare-fun e!412747 () Bool)

(assert (=> b!737988 (= e!412748 e!412747)))

(declare-fun res!496095 () Bool)

(assert (=> b!737988 (=> res!496095 e!412747)))

(assert (=> b!737988 (= res!496095 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327503 #b00000000000000000000000000000000) (bvsge lt!327503 (size!20221 a!3186))))))

(declare-fun lt!327499 () Unit!25196)

(assert (=> b!737988 (= lt!327499 e!412750)))

(declare-fun c!81331 () Bool)

(declare-fun lt!327504 () Bool)

(assert (=> b!737988 (= c!81331 lt!327504)))

(assert (=> b!737988 (= lt!327504 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737988 (= lt!327503 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!737989 () Bool)

(assert (=> b!737989 (= e!412754 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19800 a!3186) j!159) a!3186 mask!3328) (Found!7400 j!159)))))

(declare-fun b!737990 () Bool)

(assert (=> b!737990 (= e!412752 e!412751)))

(declare-fun res!496093 () Bool)

(assert (=> b!737990 (=> (not res!496093) (not e!412751))))

(declare-fun lt!327498 () SeekEntryResult!7400)

(assert (=> b!737990 (= res!496093 (= lt!327498 lt!327509))))

(declare-fun lt!327505 () array!41373)

(declare-fun lt!327500 () (_ BitVec 64))

(assert (=> b!737990 (= lt!327509 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327500 lt!327505 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737990 (= lt!327498 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327500 mask!3328) lt!327500 lt!327505 mask!3328))))

(assert (=> b!737990 (= lt!327500 (select (store (arr!19800 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!737990 (= lt!327505 (array!41374 (store (arr!19800 a!3186) i!1173 k!2102) (size!20221 a!3186)))))

(declare-fun res!496084 () Bool)

(assert (=> start!65200 (=> (not res!496084) (not e!412746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65200 (= res!496084 (validMask!0 mask!3328))))

(assert (=> start!65200 e!412746))

(assert (=> start!65200 true))

(declare-fun array_inv!15596 (array!41373) Bool)

(assert (=> start!65200 (array_inv!15596 a!3186)))

(declare-fun b!737991 () Bool)

(declare-fun res!496097 () Bool)

(assert (=> b!737991 (=> (not res!496097) (not e!412744))))

(assert (=> b!737991 (= res!496097 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20221 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20221 a!3186))))))

(declare-fun b!737992 () Bool)

(declare-fun res!496090 () Bool)

(assert (=> b!737992 (=> (not res!496090) (not e!412746))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!737992 (= res!496090 (validKeyInArray!0 k!2102))))

(declare-fun b!737993 () Bool)

(declare-fun res!496098 () Bool)

(assert (=> b!737993 (=> (not res!496098) (not e!412746))))

(declare-fun arrayContainsKey!0 (array!41373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!737993 (= res!496098 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!737994 () Bool)

(assert (=> b!737994 (= e!412743 e!412753)))

(declare-fun res!496091 () Bool)

(assert (=> b!737994 (=> (not res!496091) (not e!412753))))

(assert (=> b!737994 (= res!496091 (= (seekEntryOrOpen!0 (select (arr!19800 a!3186) j!159) a!3186 mask!3328) lt!327508))))

(assert (=> b!737994 (= lt!327508 (Found!7400 j!159))))

(declare-fun b!737995 () Bool)

(assert (=> b!737995 (= e!412744 e!412752)))

(declare-fun res!496083 () Bool)

(assert (=> b!737995 (=> (not res!496083) (not e!412752))))

(assert (=> b!737995 (= res!496083 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19800 a!3186) j!159) mask!3328) (select (arr!19800 a!3186) j!159) a!3186 mask!3328) lt!327507))))

(assert (=> b!737995 (= lt!327507 (Intermediate!7400 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!737996 () Bool)

(assert (=> b!737996 (= e!412747 true)))

(declare-fun lt!327501 () SeekEntryResult!7400)

(assert (=> b!737996 (= lt!327501 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327503 lt!327500 lt!327505 mask!3328))))

(declare-fun b!737997 () Bool)

(assert (=> b!737997 (= e!412749 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327503 resIntermediateIndex!5 (select (arr!19800 a!3186) j!159) a!3186 mask!3328) lt!327497)))))

(declare-fun b!737998 () Bool)

(declare-fun res!496092 () Bool)

(assert (=> b!737998 (=> res!496092 e!412747)))

(assert (=> b!737998 (= res!496092 e!412749)))

(declare-fun c!81329 () Bool)

(assert (=> b!737998 (= c!81329 lt!327504)))

(declare-fun b!737999 () Bool)

(assert (=> b!737999 (= e!412754 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19800 a!3186) j!159) a!3186 mask!3328) lt!327507))))

(declare-fun b!738000 () Bool)

(declare-fun Unit!25199 () Unit!25196)

(assert (=> b!738000 (= e!412750 Unit!25199)))

(assert (=> b!738000 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327503 (select (arr!19800 a!3186) j!159) a!3186 mask!3328) lt!327507)))

(declare-fun b!738001 () Bool)

(declare-fun res!496089 () Bool)

(assert (=> b!738001 (=> (not res!496089) (not e!412746))))

(assert (=> b!738001 (= res!496089 (validKeyInArray!0 (select (arr!19800 a!3186) j!159)))))

(declare-fun b!738002 () Bool)

(declare-fun res!496100 () Bool)

(assert (=> b!738002 (=> (not res!496100) (not e!412746))))

(assert (=> b!738002 (= res!496100 (and (= (size!20221 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20221 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20221 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!738003 () Bool)

(declare-fun res!496094 () Bool)

(assert (=> b!738003 (=> (not res!496094) (not e!412744))))

(declare-datatypes ((List!13802 0))(
  ( (Nil!13799) (Cons!13798 (h!14870 (_ BitVec 64)) (t!20117 List!13802)) )
))
(declare-fun arrayNoDuplicates!0 (array!41373 (_ BitVec 32) List!13802) Bool)

(assert (=> b!738003 (= res!496094 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13799))))

(assert (= (and start!65200 res!496084) b!738002))

(assert (= (and b!738002 res!496100) b!738001))

(assert (= (and b!738001 res!496089) b!737992))

(assert (= (and b!737992 res!496090) b!737993))

(assert (= (and b!737993 res!496098) b!737983))

(assert (= (and b!737983 res!496088) b!737982))

(assert (= (and b!737982 res!496086) b!738003))

(assert (= (and b!738003 res!496094) b!737991))

(assert (= (and b!737991 res!496097) b!737995))

(assert (= (and b!737995 res!496083) b!737981))

(assert (= (and b!737981 res!496096) b!737986))

(assert (= (and b!737986 c!81330) b!737999))

(assert (= (and b!737986 (not c!81330)) b!737989))

(assert (= (and b!737986 res!496087) b!737990))

(assert (= (and b!737990 res!496093) b!737984))

(assert (= (and b!737984 res!496085) b!737994))

(assert (= (and b!737994 res!496091) b!737987))

(assert (= (and b!737984 (not res!496099)) b!737988))

(assert (= (and b!737988 c!81331) b!738000))

(assert (= (and b!737988 (not c!81331)) b!737985))

(assert (= (and b!737988 (not res!496095)) b!737998))

(assert (= (and b!737998 c!81329) b!737980))

(assert (= (and b!737998 (not c!81329)) b!737997))

(assert (= (and b!737998 (not res!496092)) b!737996))

(declare-fun m!689725 () Bool)

(assert (=> b!737992 m!689725))

(declare-fun m!689727 () Bool)

(assert (=> b!737990 m!689727))

(declare-fun m!689729 () Bool)

(assert (=> b!737990 m!689729))

(declare-fun m!689731 () Bool)

(assert (=> b!737990 m!689731))

(declare-fun m!689733 () Bool)

(assert (=> b!737990 m!689733))

(assert (=> b!737990 m!689727))

(declare-fun m!689735 () Bool)

(assert (=> b!737990 m!689735))

(declare-fun m!689737 () Bool)

(assert (=> b!737982 m!689737))

(declare-fun m!689739 () Bool)

(assert (=> b!738003 m!689739))

(declare-fun m!689741 () Bool)

(assert (=> b!737983 m!689741))

(declare-fun m!689743 () Bool)

(assert (=> b!737995 m!689743))

(assert (=> b!737995 m!689743))

(declare-fun m!689745 () Bool)

(assert (=> b!737995 m!689745))

(assert (=> b!737995 m!689745))

(assert (=> b!737995 m!689743))

(declare-fun m!689747 () Bool)

(assert (=> b!737995 m!689747))

(declare-fun m!689749 () Bool)

(assert (=> b!737993 m!689749))

(declare-fun m!689751 () Bool)

(assert (=> b!737984 m!689751))

(declare-fun m!689753 () Bool)

(assert (=> b!737984 m!689753))

(assert (=> b!737987 m!689743))

(assert (=> b!737987 m!689743))

(declare-fun m!689755 () Bool)

(assert (=> b!737987 m!689755))

(assert (=> b!737985 m!689743))

(assert (=> b!737985 m!689743))

(declare-fun m!689757 () Bool)

(assert (=> b!737985 m!689757))

(assert (=> b!737985 m!689743))

(declare-fun m!689759 () Bool)

(assert (=> b!737985 m!689759))

(declare-fun m!689761 () Bool)

(assert (=> b!737996 m!689761))

(assert (=> b!737980 m!689743))

(assert (=> b!737980 m!689743))

(declare-fun m!689763 () Bool)

(assert (=> b!737980 m!689763))

(declare-fun m!689765 () Bool)

(assert (=> b!737988 m!689765))

(assert (=> b!737989 m!689743))

(assert (=> b!737989 m!689743))

(assert (=> b!737989 m!689757))

(assert (=> b!737994 m!689743))

(assert (=> b!737994 m!689743))

(declare-fun m!689767 () Bool)

(assert (=> b!737994 m!689767))

(declare-fun m!689769 () Bool)

(assert (=> start!65200 m!689769))

(declare-fun m!689771 () Bool)

(assert (=> start!65200 m!689771))

(assert (=> b!737999 m!689743))

(assert (=> b!737999 m!689743))

(declare-fun m!689773 () Bool)

(assert (=> b!737999 m!689773))

(assert (=> b!737997 m!689743))

(assert (=> b!737997 m!689743))

(assert (=> b!737997 m!689759))

(assert (=> b!738000 m!689743))

(assert (=> b!738000 m!689743))

(assert (=> b!738000 m!689763))

(assert (=> b!738001 m!689743))

(assert (=> b!738001 m!689743))

(declare-fun m!689775 () Bool)

(assert (=> b!738001 m!689775))

(declare-fun m!689777 () Bool)

(assert (=> b!737981 m!689777))

(push 1)

