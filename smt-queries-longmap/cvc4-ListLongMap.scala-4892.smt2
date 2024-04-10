; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67468 () Bool)

(assert start!67468)

(declare-fun b!780716 () Bool)

(declare-fun e!434259 () Bool)

(declare-fun e!434266 () Bool)

(assert (=> b!780716 (= e!434259 e!434266)))

(declare-fun res!528261 () Bool)

(assert (=> b!780716 (=> (not res!528261) (not e!434266))))

(declare-datatypes ((SeekEntryResult!8008 0))(
  ( (MissingZero!8008 (index!34400 (_ BitVec 32))) (Found!8008 (index!34401 (_ BitVec 32))) (Intermediate!8008 (undefined!8820 Bool) (index!34402 (_ BitVec 32)) (x!65346 (_ BitVec 32))) (Undefined!8008) (MissingVacant!8008 (index!34403 (_ BitVec 32))) )
))
(declare-fun lt!347917 () SeekEntryResult!8008)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!780716 (= res!528261 (or (= lt!347917 (MissingZero!8008 i!1173)) (= lt!347917 (MissingVacant!8008 i!1173))))))

(declare-datatypes ((array!42634 0))(
  ( (array!42635 (arr!20408 (Array (_ BitVec 32) (_ BitVec 64))) (size!20829 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42634)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42634 (_ BitVec 32)) SeekEntryResult!8008)

(assert (=> b!780716 (= lt!347917 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun lt!347915 () SeekEntryResult!8008)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!434262 () Bool)

(declare-fun b!780717 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42634 (_ BitVec 32)) SeekEntryResult!8008)

(assert (=> b!780717 (= e!434262 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20408 a!3186) j!159) a!3186 mask!3328) lt!347915))))

(declare-fun b!780718 () Bool)

(declare-datatypes ((Unit!26920 0))(
  ( (Unit!26921) )
))
(declare-fun e!434265 () Unit!26920)

(declare-fun Unit!26922 () Unit!26920)

(assert (=> b!780718 (= e!434265 Unit!26922)))

(assert (=> b!780718 false))

(declare-fun b!780719 () Bool)

(declare-fun res!528269 () Bool)

(declare-fun e!434263 () Bool)

(assert (=> b!780719 (=> (not res!528269) (not e!434263))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!780719 (= res!528269 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20408 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!780720 () Bool)

(declare-fun e!434260 () Bool)

(declare-fun e!434261 () Bool)

(assert (=> b!780720 (= e!434260 (not e!434261))))

(declare-fun res!528259 () Bool)

(assert (=> b!780720 (=> res!528259 e!434261)))

(declare-fun lt!347923 () SeekEntryResult!8008)

(assert (=> b!780720 (= res!528259 (or (not (is-Intermediate!8008 lt!347923)) (bvslt x!1131 (x!65346 lt!347923)) (not (= x!1131 (x!65346 lt!347923))) (not (= index!1321 (index!34402 lt!347923)))))))

(declare-fun e!434267 () Bool)

(assert (=> b!780720 e!434267))

(declare-fun res!528268 () Bool)

(assert (=> b!780720 (=> (not res!528268) (not e!434267))))

(declare-fun lt!347919 () SeekEntryResult!8008)

(declare-fun lt!347918 () SeekEntryResult!8008)

(assert (=> b!780720 (= res!528268 (= lt!347919 lt!347918))))

(assert (=> b!780720 (= lt!347918 (Found!8008 j!159))))

(assert (=> b!780720 (= lt!347919 (seekEntryOrOpen!0 (select (arr!20408 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42634 (_ BitVec 32)) Bool)

(assert (=> b!780720 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!347920 () Unit!26920)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42634 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26920)

(assert (=> b!780720 (= lt!347920 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!780721 () Bool)

(declare-fun res!528262 () Bool)

(assert (=> b!780721 (=> (not res!528262) (not e!434259))))

(declare-fun arrayContainsKey!0 (array!42634 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!780721 (= res!528262 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!780722 () Bool)

(declare-fun res!528272 () Bool)

(assert (=> b!780722 (=> (not res!528272) (not e!434259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!780722 (= res!528272 (validKeyInArray!0 (select (arr!20408 a!3186) j!159)))))

(declare-fun b!780723 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42634 (_ BitVec 32)) SeekEntryResult!8008)

(assert (=> b!780723 (= e!434267 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20408 a!3186) j!159) a!3186 mask!3328) lt!347918))))

(declare-fun b!780724 () Bool)

(declare-fun res!528256 () Bool)

(assert (=> b!780724 (=> (not res!528256) (not e!434263))))

(assert (=> b!780724 (= res!528256 e!434262)))

(declare-fun c!86634 () Bool)

(assert (=> b!780724 (= c!86634 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!780725 () Bool)

(assert (=> b!780725 (= e!434263 e!434260)))

(declare-fun res!528267 () Bool)

(assert (=> b!780725 (=> (not res!528267) (not e!434260))))

(declare-fun lt!347922 () SeekEntryResult!8008)

(assert (=> b!780725 (= res!528267 (= lt!347922 lt!347923))))

(declare-fun lt!347916 () (_ BitVec 64))

(declare-fun lt!347924 () array!42634)

(assert (=> b!780725 (= lt!347923 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347916 lt!347924 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!780725 (= lt!347922 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347916 mask!3328) lt!347916 lt!347924 mask!3328))))

(assert (=> b!780725 (= lt!347916 (select (store (arr!20408 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!780725 (= lt!347924 (array!42635 (store (arr!20408 a!3186) i!1173 k!2102) (size!20829 a!3186)))))

(declare-fun b!780726 () Bool)

(declare-fun res!528258 () Bool)

(assert (=> b!780726 (=> res!528258 e!434261)))

(assert (=> b!780726 (= res!528258 (= (select (store (arr!20408 a!3186) i!1173 k!2102) index!1321) lt!347916))))

(declare-fun b!780715 () Bool)

(declare-fun res!528263 () Bool)

(assert (=> b!780715 (=> (not res!528263) (not e!434266))))

(assert (=> b!780715 (= res!528263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!528266 () Bool)

(assert (=> start!67468 (=> (not res!528266) (not e!434259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67468 (= res!528266 (validMask!0 mask!3328))))

(assert (=> start!67468 e!434259))

(assert (=> start!67468 true))

(declare-fun array_inv!16204 (array!42634) Bool)

(assert (=> start!67468 (array_inv!16204 a!3186)))

(declare-fun b!780727 () Bool)

(declare-fun res!528265 () Bool)

(assert (=> b!780727 (=> (not res!528265) (not e!434266))))

(declare-datatypes ((List!14410 0))(
  ( (Nil!14407) (Cons!14406 (h!15523 (_ BitVec 64)) (t!20725 List!14410)) )
))
(declare-fun arrayNoDuplicates!0 (array!42634 (_ BitVec 32) List!14410) Bool)

(assert (=> b!780727 (= res!528265 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14407))))

(declare-fun b!780728 () Bool)

(declare-fun res!528257 () Bool)

(assert (=> b!780728 (=> res!528257 e!434261)))

(assert (=> b!780728 (= res!528257 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20408 a!3186) j!159) a!3186 mask!3328) lt!347918)))))

(declare-fun b!780729 () Bool)

(assert (=> b!780729 (= e!434261 true)))

(declare-fun lt!347921 () Unit!26920)

(assert (=> b!780729 (= lt!347921 e!434265)))

(declare-fun c!86635 () Bool)

(assert (=> b!780729 (= c!86635 (= (select (store (arr!20408 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!780730 () Bool)

(declare-fun res!528260 () Bool)

(assert (=> b!780730 (=> (not res!528260) (not e!434266))))

(assert (=> b!780730 (= res!528260 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20829 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20829 a!3186))))))

(declare-fun b!780731 () Bool)

(assert (=> b!780731 (= e!434262 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20408 a!3186) j!159) a!3186 mask!3328) (Found!8008 j!159)))))

(declare-fun b!780732 () Bool)

(assert (=> b!780732 (= e!434266 e!434263)))

(declare-fun res!528271 () Bool)

(assert (=> b!780732 (=> (not res!528271) (not e!434263))))

(assert (=> b!780732 (= res!528271 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20408 a!3186) j!159) mask!3328) (select (arr!20408 a!3186) j!159) a!3186 mask!3328) lt!347915))))

(assert (=> b!780732 (= lt!347915 (Intermediate!8008 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!780733 () Bool)

(declare-fun res!528270 () Bool)

(assert (=> b!780733 (=> (not res!528270) (not e!434259))))

(assert (=> b!780733 (= res!528270 (and (= (size!20829 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20829 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20829 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!780734 () Bool)

(declare-fun res!528264 () Bool)

(assert (=> b!780734 (=> (not res!528264) (not e!434259))))

(assert (=> b!780734 (= res!528264 (validKeyInArray!0 k!2102))))

(declare-fun b!780735 () Bool)

(declare-fun Unit!26923 () Unit!26920)

(assert (=> b!780735 (= e!434265 Unit!26923)))

(assert (= (and start!67468 res!528266) b!780733))

(assert (= (and b!780733 res!528270) b!780722))

(assert (= (and b!780722 res!528272) b!780734))

(assert (= (and b!780734 res!528264) b!780721))

(assert (= (and b!780721 res!528262) b!780716))

(assert (= (and b!780716 res!528261) b!780715))

(assert (= (and b!780715 res!528263) b!780727))

(assert (= (and b!780727 res!528265) b!780730))

(assert (= (and b!780730 res!528260) b!780732))

(assert (= (and b!780732 res!528271) b!780719))

(assert (= (and b!780719 res!528269) b!780724))

(assert (= (and b!780724 c!86634) b!780717))

(assert (= (and b!780724 (not c!86634)) b!780731))

(assert (= (and b!780724 res!528256) b!780725))

(assert (= (and b!780725 res!528267) b!780720))

(assert (= (and b!780720 res!528268) b!780723))

(assert (= (and b!780720 (not res!528259)) b!780728))

(assert (= (and b!780728 (not res!528257)) b!780726))

(assert (= (and b!780726 (not res!528258)) b!780729))

(assert (= (and b!780729 c!86635) b!780718))

(assert (= (and b!780729 (not c!86635)) b!780735))

(declare-fun m!723953 () Bool)

(assert (=> b!780719 m!723953))

(declare-fun m!723955 () Bool)

(assert (=> b!780716 m!723955))

(declare-fun m!723957 () Bool)

(assert (=> b!780721 m!723957))

(declare-fun m!723959 () Bool)

(assert (=> b!780722 m!723959))

(assert (=> b!780722 m!723959))

(declare-fun m!723961 () Bool)

(assert (=> b!780722 m!723961))

(assert (=> b!780732 m!723959))

(assert (=> b!780732 m!723959))

(declare-fun m!723963 () Bool)

(assert (=> b!780732 m!723963))

(assert (=> b!780732 m!723963))

(assert (=> b!780732 m!723959))

(declare-fun m!723965 () Bool)

(assert (=> b!780732 m!723965))

(declare-fun m!723967 () Bool)

(assert (=> b!780734 m!723967))

(declare-fun m!723969 () Bool)

(assert (=> b!780725 m!723969))

(declare-fun m!723971 () Bool)

(assert (=> b!780725 m!723971))

(assert (=> b!780725 m!723969))

(declare-fun m!723973 () Bool)

(assert (=> b!780725 m!723973))

(declare-fun m!723975 () Bool)

(assert (=> b!780725 m!723975))

(declare-fun m!723977 () Bool)

(assert (=> b!780725 m!723977))

(assert (=> b!780723 m!723959))

(assert (=> b!780723 m!723959))

(declare-fun m!723979 () Bool)

(assert (=> b!780723 m!723979))

(declare-fun m!723981 () Bool)

(assert (=> start!67468 m!723981))

(declare-fun m!723983 () Bool)

(assert (=> start!67468 m!723983))

(declare-fun m!723985 () Bool)

(assert (=> b!780727 m!723985))

(assert (=> b!780717 m!723959))

(assert (=> b!780717 m!723959))

(declare-fun m!723987 () Bool)

(assert (=> b!780717 m!723987))

(assert (=> b!780726 m!723975))

(declare-fun m!723989 () Bool)

(assert (=> b!780726 m!723989))

(assert (=> b!780729 m!723975))

(assert (=> b!780729 m!723989))

(declare-fun m!723991 () Bool)

(assert (=> b!780715 m!723991))

(assert (=> b!780731 m!723959))

(assert (=> b!780731 m!723959))

(declare-fun m!723993 () Bool)

(assert (=> b!780731 m!723993))

(assert (=> b!780720 m!723959))

(assert (=> b!780720 m!723959))

(declare-fun m!723995 () Bool)

(assert (=> b!780720 m!723995))

(declare-fun m!723997 () Bool)

(assert (=> b!780720 m!723997))

(declare-fun m!723999 () Bool)

(assert (=> b!780720 m!723999))

(assert (=> b!780728 m!723959))

(assert (=> b!780728 m!723959))

(assert (=> b!780728 m!723993))

(push 1)

