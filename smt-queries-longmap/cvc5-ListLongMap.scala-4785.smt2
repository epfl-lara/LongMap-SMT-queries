; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65770 () Bool)

(assert start!65770)

(declare-fun b!755978 () Bool)

(declare-fun res!511076 () Bool)

(declare-fun e!421557 () Bool)

(assert (=> b!755978 (=> (not res!511076) (not e!421557))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!755978 (= res!511076 (validKeyInArray!0 k!2102))))

(declare-fun b!755979 () Bool)

(declare-fun e!421560 () Bool)

(declare-fun e!421559 () Bool)

(assert (=> b!755979 (= e!421560 e!421559)))

(declare-fun res!511070 () Bool)

(assert (=> b!755979 (=> res!511070 e!421559)))

(declare-datatypes ((SeekEntryResult!7685 0))(
  ( (MissingZero!7685 (index!33108 (_ BitVec 32))) (Found!7685 (index!33109 (_ BitVec 32))) (Intermediate!7685 (undefined!8497 Bool) (index!33110 (_ BitVec 32)) (x!64011 (_ BitVec 32))) (Undefined!7685) (MissingVacant!7685 (index!33111 (_ BitVec 32))) )
))
(declare-fun lt!336548 () SeekEntryResult!7685)

(declare-fun lt!336551 () SeekEntryResult!7685)

(assert (=> b!755979 (= res!511070 (not (= lt!336548 lt!336551)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41943 0))(
  ( (array!41944 (arr!20085 (Array (_ BitVec 32) (_ BitVec 64))) (size!20506 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41943)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41943 (_ BitVec 32)) SeekEntryResult!7685)

(assert (=> b!755979 (= lt!336548 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20085 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!755980 () Bool)

(declare-datatypes ((Unit!26120 0))(
  ( (Unit!26121) )
))
(declare-fun e!421561 () Unit!26120)

(declare-fun Unit!26122 () Unit!26120)

(assert (=> b!755980 (= e!421561 Unit!26122)))

(declare-fun b!755981 () Bool)

(declare-fun e!421556 () Bool)

(assert (=> b!755981 (= e!421556 true)))

(declare-fun e!421563 () Bool)

(assert (=> b!755981 e!421563))

(declare-fun res!511069 () Bool)

(assert (=> b!755981 (=> (not res!511069) (not e!421563))))

(declare-fun lt!336549 () (_ BitVec 64))

(assert (=> b!755981 (= res!511069 (= lt!336549 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336550 () Unit!26120)

(assert (=> b!755981 (= lt!336550 e!421561)))

(declare-fun c!82840 () Bool)

(assert (=> b!755981 (= c!82840 (= lt!336549 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!755982 () Bool)

(declare-fun res!511064 () Bool)

(declare-fun e!421564 () Bool)

(assert (=> b!755982 (=> (not res!511064) (not e!421564))))

(declare-fun e!421565 () Bool)

(assert (=> b!755982 (= res!511064 e!421565)))

(declare-fun c!82839 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!755982 (= c!82839 (bvsle x!1131 resIntermediateX!5))))

(declare-fun lt!336556 () SeekEntryResult!7685)

(declare-fun b!755983 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41943 (_ BitVec 32)) SeekEntryResult!7685)

(assert (=> b!755983 (= e!421565 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20085 a!3186) j!159) a!3186 mask!3328) lt!336556))))

(declare-fun b!755985 () Bool)

(declare-fun res!511073 () Bool)

(assert (=> b!755985 (=> (not res!511073) (not e!421563))))

(declare-fun lt!336555 () array!41943)

(declare-fun lt!336554 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41943 (_ BitVec 32)) SeekEntryResult!7685)

(assert (=> b!755985 (= res!511073 (= (seekEntryOrOpen!0 lt!336554 lt!336555 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336554 lt!336555 mask!3328)))))

(declare-fun b!755986 () Bool)

(declare-fun res!511078 () Bool)

(assert (=> b!755986 (=> (not res!511078) (not e!421557))))

(assert (=> b!755986 (= res!511078 (validKeyInArray!0 (select (arr!20085 a!3186) j!159)))))

(declare-fun b!755987 () Bool)

(declare-fun res!511061 () Bool)

(declare-fun e!421558 () Bool)

(assert (=> b!755987 (=> (not res!511061) (not e!421558))))

(assert (=> b!755987 (= res!511061 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20506 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20506 a!3186))))))

(declare-fun b!755988 () Bool)

(declare-fun res!511071 () Bool)

(assert (=> b!755988 (=> (not res!511071) (not e!421557))))

(declare-fun arrayContainsKey!0 (array!41943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!755988 (= res!511071 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!755989 () Bool)

(assert (=> b!755989 (= e!421559 e!421556)))

(declare-fun res!511067 () Bool)

(assert (=> b!755989 (=> res!511067 e!421556)))

(assert (=> b!755989 (= res!511067 (= lt!336549 lt!336554))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!755989 (= lt!336549 (select (store (arr!20085 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!755990 () Bool)

(declare-fun res!511065 () Bool)

(assert (=> b!755990 (=> (not res!511065) (not e!421564))))

(assert (=> b!755990 (= res!511065 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20085 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!755991 () Bool)

(assert (=> b!755991 (= e!421558 e!421564)))

(declare-fun res!511077 () Bool)

(assert (=> b!755991 (=> (not res!511077) (not e!421564))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!755991 (= res!511077 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20085 a!3186) j!159) mask!3328) (select (arr!20085 a!3186) j!159) a!3186 mask!3328) lt!336556))))

(assert (=> b!755991 (= lt!336556 (Intermediate!7685 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!755992 () Bool)

(assert (=> b!755992 (= e!421565 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20085 a!3186) j!159) a!3186 mask!3328) (Found!7685 j!159)))))

(declare-fun b!755993 () Bool)

(declare-fun Unit!26123 () Unit!26120)

(assert (=> b!755993 (= e!421561 Unit!26123)))

(assert (=> b!755993 false))

(declare-fun b!755994 () Bool)

(assert (=> b!755994 (= e!421557 e!421558)))

(declare-fun res!511062 () Bool)

(assert (=> b!755994 (=> (not res!511062) (not e!421558))))

(declare-fun lt!336557 () SeekEntryResult!7685)

(assert (=> b!755994 (= res!511062 (or (= lt!336557 (MissingZero!7685 i!1173)) (= lt!336557 (MissingVacant!7685 i!1173))))))

(assert (=> b!755994 (= lt!336557 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!755995 () Bool)

(declare-fun lt!336553 () SeekEntryResult!7685)

(assert (=> b!755995 (= e!421563 (= lt!336553 lt!336548))))

(declare-fun b!755996 () Bool)

(declare-fun e!421554 () Bool)

(assert (=> b!755996 (= e!421564 e!421554)))

(declare-fun res!511066 () Bool)

(assert (=> b!755996 (=> (not res!511066) (not e!421554))))

(declare-fun lt!336547 () SeekEntryResult!7685)

(declare-fun lt!336546 () SeekEntryResult!7685)

(assert (=> b!755996 (= res!511066 (= lt!336547 lt!336546))))

(assert (=> b!755996 (= lt!336546 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336554 lt!336555 mask!3328))))

(assert (=> b!755996 (= lt!336547 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336554 mask!3328) lt!336554 lt!336555 mask!3328))))

(assert (=> b!755996 (= lt!336554 (select (store (arr!20085 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!755996 (= lt!336555 (array!41944 (store (arr!20085 a!3186) i!1173 k!2102) (size!20506 a!3186)))))

(declare-fun b!755997 () Bool)

(assert (=> b!755997 (= e!421554 (not e!421560))))

(declare-fun res!511074 () Bool)

(assert (=> b!755997 (=> res!511074 e!421560)))

(assert (=> b!755997 (= res!511074 (or (not (is-Intermediate!7685 lt!336546)) (bvslt x!1131 (x!64011 lt!336546)) (not (= x!1131 (x!64011 lt!336546))) (not (= index!1321 (index!33110 lt!336546)))))))

(declare-fun e!421555 () Bool)

(assert (=> b!755997 e!421555))

(declare-fun res!511072 () Bool)

(assert (=> b!755997 (=> (not res!511072) (not e!421555))))

(assert (=> b!755997 (= res!511072 (= lt!336553 lt!336551))))

(assert (=> b!755997 (= lt!336551 (Found!7685 j!159))))

(assert (=> b!755997 (= lt!336553 (seekEntryOrOpen!0 (select (arr!20085 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41943 (_ BitVec 32)) Bool)

(assert (=> b!755997 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336552 () Unit!26120)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41943 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26120)

(assert (=> b!755997 (= lt!336552 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!755998 () Bool)

(declare-fun res!511068 () Bool)

(assert (=> b!755998 (=> (not res!511068) (not e!421558))))

(declare-datatypes ((List!14087 0))(
  ( (Nil!14084) (Cons!14083 (h!15155 (_ BitVec 64)) (t!20402 List!14087)) )
))
(declare-fun arrayNoDuplicates!0 (array!41943 (_ BitVec 32) List!14087) Bool)

(assert (=> b!755998 (= res!511068 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14084))))

(declare-fun res!511075 () Bool)

(assert (=> start!65770 (=> (not res!511075) (not e!421557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65770 (= res!511075 (validMask!0 mask!3328))))

(assert (=> start!65770 e!421557))

(assert (=> start!65770 true))

(declare-fun array_inv!15881 (array!41943) Bool)

(assert (=> start!65770 (array_inv!15881 a!3186)))

(declare-fun b!755984 () Bool)

(declare-fun res!511079 () Bool)

(assert (=> b!755984 (=> (not res!511079) (not e!421557))))

(assert (=> b!755984 (= res!511079 (and (= (size!20506 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20506 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20506 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!755999 () Bool)

(declare-fun res!511063 () Bool)

(assert (=> b!755999 (=> (not res!511063) (not e!421558))))

(assert (=> b!755999 (= res!511063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!756000 () Bool)

(assert (=> b!756000 (= e!421555 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20085 a!3186) j!159) a!3186 mask!3328) lt!336551))))

(assert (= (and start!65770 res!511075) b!755984))

(assert (= (and b!755984 res!511079) b!755986))

(assert (= (and b!755986 res!511078) b!755978))

(assert (= (and b!755978 res!511076) b!755988))

(assert (= (and b!755988 res!511071) b!755994))

(assert (= (and b!755994 res!511062) b!755999))

(assert (= (and b!755999 res!511063) b!755998))

(assert (= (and b!755998 res!511068) b!755987))

(assert (= (and b!755987 res!511061) b!755991))

(assert (= (and b!755991 res!511077) b!755990))

(assert (= (and b!755990 res!511065) b!755982))

(assert (= (and b!755982 c!82839) b!755983))

(assert (= (and b!755982 (not c!82839)) b!755992))

(assert (= (and b!755982 res!511064) b!755996))

(assert (= (and b!755996 res!511066) b!755997))

(assert (= (and b!755997 res!511072) b!756000))

(assert (= (and b!755997 (not res!511074)) b!755979))

(assert (= (and b!755979 (not res!511070)) b!755989))

(assert (= (and b!755989 (not res!511067)) b!755981))

(assert (= (and b!755981 c!82840) b!755993))

(assert (= (and b!755981 (not c!82840)) b!755980))

(assert (= (and b!755981 res!511069) b!755985))

(assert (= (and b!755985 res!511073) b!755995))

(declare-fun m!704047 () Bool)

(assert (=> b!755996 m!704047))

(declare-fun m!704049 () Bool)

(assert (=> b!755996 m!704049))

(declare-fun m!704051 () Bool)

(assert (=> b!755996 m!704051))

(declare-fun m!704053 () Bool)

(assert (=> b!755996 m!704053))

(declare-fun m!704055 () Bool)

(assert (=> b!755996 m!704055))

(assert (=> b!755996 m!704051))

(declare-fun m!704057 () Bool)

(assert (=> start!65770 m!704057))

(declare-fun m!704059 () Bool)

(assert (=> start!65770 m!704059))

(declare-fun m!704061 () Bool)

(assert (=> b!755999 m!704061))

(declare-fun m!704063 () Bool)

(assert (=> b!755979 m!704063))

(assert (=> b!755979 m!704063))

(declare-fun m!704065 () Bool)

(assert (=> b!755979 m!704065))

(assert (=> b!755997 m!704063))

(assert (=> b!755997 m!704063))

(declare-fun m!704067 () Bool)

(assert (=> b!755997 m!704067))

(declare-fun m!704069 () Bool)

(assert (=> b!755997 m!704069))

(declare-fun m!704071 () Bool)

(assert (=> b!755997 m!704071))

(declare-fun m!704073 () Bool)

(assert (=> b!755990 m!704073))

(assert (=> b!756000 m!704063))

(assert (=> b!756000 m!704063))

(declare-fun m!704075 () Bool)

(assert (=> b!756000 m!704075))

(declare-fun m!704077 () Bool)

(assert (=> b!755994 m!704077))

(declare-fun m!704079 () Bool)

(assert (=> b!755988 m!704079))

(assert (=> b!755989 m!704047))

(declare-fun m!704081 () Bool)

(assert (=> b!755989 m!704081))

(assert (=> b!755992 m!704063))

(assert (=> b!755992 m!704063))

(assert (=> b!755992 m!704065))

(assert (=> b!755983 m!704063))

(assert (=> b!755983 m!704063))

(declare-fun m!704083 () Bool)

(assert (=> b!755983 m!704083))

(declare-fun m!704085 () Bool)

(assert (=> b!755978 m!704085))

(assert (=> b!755991 m!704063))

(assert (=> b!755991 m!704063))

(declare-fun m!704087 () Bool)

(assert (=> b!755991 m!704087))

(assert (=> b!755991 m!704087))

(assert (=> b!755991 m!704063))

(declare-fun m!704089 () Bool)

(assert (=> b!755991 m!704089))

(declare-fun m!704091 () Bool)

(assert (=> b!755985 m!704091))

(declare-fun m!704093 () Bool)

(assert (=> b!755985 m!704093))

(assert (=> b!755986 m!704063))

(assert (=> b!755986 m!704063))

(declare-fun m!704095 () Bool)

(assert (=> b!755986 m!704095))

(declare-fun m!704097 () Bool)

(assert (=> b!755998 m!704097))

(push 1)

