; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68002 () Bool)

(assert start!68002)

(declare-fun b!791351 () Bool)

(declare-fun e!439797 () Bool)

(declare-fun e!439795 () Bool)

(assert (=> b!791351 (= e!439797 e!439795)))

(declare-fun res!536113 () Bool)

(assert (=> b!791351 (=> (not res!536113) (not e!439795))))

(declare-datatypes ((SeekEntryResult!8143 0))(
  ( (MissingZero!8143 (index!34940 (_ BitVec 32))) (Found!8143 (index!34941 (_ BitVec 32))) (Intermediate!8143 (undefined!8955 Bool) (index!34942 (_ BitVec 32)) (x!65877 (_ BitVec 32))) (Undefined!8143) (MissingVacant!8143 (index!34943 (_ BitVec 32))) )
))
(declare-fun lt!353227 () SeekEntryResult!8143)

(declare-datatypes ((array!42916 0))(
  ( (array!42917 (arr!20543 (Array (_ BitVec 32) (_ BitVec 64))) (size!20964 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42916)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42916 (_ BitVec 32)) SeekEntryResult!8143)

(assert (=> b!791351 (= res!536113 (= (seekEntryOrOpen!0 (select (arr!20543 a!3186) j!159) a!3186 mask!3328) lt!353227))))

(assert (=> b!791351 (= lt!353227 (Found!8143 j!159))))

(declare-fun b!791352 () Bool)

(declare-fun res!536115 () Bool)

(declare-fun e!439802 () Bool)

(assert (=> b!791352 (=> (not res!536115) (not e!439802))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!791352 (= res!536115 (and (= (size!20964 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20964 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20964 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!791353 () Bool)

(declare-fun e!439799 () Bool)

(declare-fun e!439800 () Bool)

(assert (=> b!791353 (= e!439799 e!439800)))

(declare-fun res!536118 () Bool)

(assert (=> b!791353 (=> (not res!536118) (not e!439800))))

(declare-fun lt!353230 () SeekEntryResult!8143)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42916 (_ BitVec 32)) SeekEntryResult!8143)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!791353 (= res!536118 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20543 a!3186) j!159) mask!3328) (select (arr!20543 a!3186) j!159) a!3186 mask!3328) lt!353230))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!791353 (= lt!353230 (Intermediate!8143 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!791354 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!439801 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!791354 (= e!439801 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20543 a!3186) j!159) a!3186 mask!3328) lt!353230))))

(declare-fun res!536110 () Bool)

(assert (=> start!68002 (=> (not res!536110) (not e!439802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68002 (= res!536110 (validMask!0 mask!3328))))

(assert (=> start!68002 e!439802))

(assert (=> start!68002 true))

(declare-fun array_inv!16339 (array!42916) Bool)

(assert (=> start!68002 (array_inv!16339 a!3186)))

(declare-fun b!791355 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42916 (_ BitVec 32)) SeekEntryResult!8143)

(assert (=> b!791355 (= e!439795 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20543 a!3186) j!159) a!3186 mask!3328) lt!353227))))

(declare-fun b!791356 () Bool)

(declare-fun e!439798 () Bool)

(assert (=> b!791356 (= e!439800 e!439798)))

(declare-fun res!536107 () Bool)

(assert (=> b!791356 (=> (not res!536107) (not e!439798))))

(declare-fun lt!353228 () (_ BitVec 64))

(declare-fun lt!353231 () array!42916)

(assert (=> b!791356 (= res!536107 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!353228 mask!3328) lt!353228 lt!353231 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!353228 lt!353231 mask!3328)))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!791356 (= lt!353228 (select (store (arr!20543 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!791356 (= lt!353231 (array!42917 (store (arr!20543 a!3186) i!1173 k!2102) (size!20964 a!3186)))))

(declare-fun b!791357 () Bool)

(assert (=> b!791357 (= e!439801 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20543 a!3186) j!159) a!3186 mask!3328) (Found!8143 j!159)))))

(declare-fun b!791358 () Bool)

(declare-fun res!536111 () Bool)

(assert (=> b!791358 (=> (not res!536111) (not e!439799))))

(declare-datatypes ((List!14545 0))(
  ( (Nil!14542) (Cons!14541 (h!15670 (_ BitVec 64)) (t!20860 List!14545)) )
))
(declare-fun arrayNoDuplicates!0 (array!42916 (_ BitVec 32) List!14545) Bool)

(assert (=> b!791358 (= res!536111 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14542))))

(declare-fun b!791359 () Bool)

(declare-fun res!536109 () Bool)

(assert (=> b!791359 (=> (not res!536109) (not e!439802))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791359 (= res!536109 (validKeyInArray!0 k!2102))))

(declare-fun b!791360 () Bool)

(declare-fun res!536117 () Bool)

(assert (=> b!791360 (=> (not res!536117) (not e!439802))))

(assert (=> b!791360 (= res!536117 (validKeyInArray!0 (select (arr!20543 a!3186) j!159)))))

(declare-fun b!791361 () Bool)

(declare-fun res!536112 () Bool)

(assert (=> b!791361 (=> (not res!536112) (not e!439800))))

(assert (=> b!791361 (= res!536112 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20543 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!791362 () Bool)

(assert (=> b!791362 (= e!439802 e!439799)))

(declare-fun res!536116 () Bool)

(assert (=> b!791362 (=> (not res!536116) (not e!439799))))

(declare-fun lt!353226 () SeekEntryResult!8143)

(assert (=> b!791362 (= res!536116 (or (= lt!353226 (MissingZero!8143 i!1173)) (= lt!353226 (MissingVacant!8143 i!1173))))))

(assert (=> b!791362 (= lt!353226 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!791363 () Bool)

(declare-fun res!536119 () Bool)

(assert (=> b!791363 (=> (not res!536119) (not e!439799))))

(assert (=> b!791363 (= res!536119 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20964 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20964 a!3186))))))

(declare-fun b!791364 () Bool)

(declare-fun res!536120 () Bool)

(assert (=> b!791364 (=> (not res!536120) (not e!439799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42916 (_ BitVec 32)) Bool)

(assert (=> b!791364 (= res!536120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!791365 () Bool)

(declare-fun res!536108 () Bool)

(assert (=> b!791365 (=> (not res!536108) (not e!439800))))

(assert (=> b!791365 (= res!536108 e!439801)))

(declare-fun c!88033 () Bool)

(assert (=> b!791365 (= c!88033 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!791366 () Bool)

(assert (=> b!791366 (= e!439798 (not true))))

(assert (=> b!791366 e!439797))

(declare-fun res!536114 () Bool)

(assert (=> b!791366 (=> (not res!536114) (not e!439797))))

(assert (=> b!791366 (= res!536114 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!27438 0))(
  ( (Unit!27439) )
))
(declare-fun lt!353229 () Unit!27438)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42916 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27438)

(assert (=> b!791366 (= lt!353229 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!791367 () Bool)

(declare-fun res!536106 () Bool)

(assert (=> b!791367 (=> (not res!536106) (not e!439802))))

(declare-fun arrayContainsKey!0 (array!42916 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791367 (= res!536106 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!68002 res!536110) b!791352))

(assert (= (and b!791352 res!536115) b!791360))

(assert (= (and b!791360 res!536117) b!791359))

(assert (= (and b!791359 res!536109) b!791367))

(assert (= (and b!791367 res!536106) b!791362))

(assert (= (and b!791362 res!536116) b!791364))

(assert (= (and b!791364 res!536120) b!791358))

(assert (= (and b!791358 res!536111) b!791363))

(assert (= (and b!791363 res!536119) b!791353))

(assert (= (and b!791353 res!536118) b!791361))

(assert (= (and b!791361 res!536112) b!791365))

(assert (= (and b!791365 c!88033) b!791354))

(assert (= (and b!791365 (not c!88033)) b!791357))

(assert (= (and b!791365 res!536108) b!791356))

(assert (= (and b!791356 res!536107) b!791366))

(assert (= (and b!791366 res!536114) b!791351))

(assert (= (and b!791351 res!536113) b!791355))

(declare-fun m!732097 () Bool)

(assert (=> b!791355 m!732097))

(assert (=> b!791355 m!732097))

(declare-fun m!732099 () Bool)

(assert (=> b!791355 m!732099))

(declare-fun m!732101 () Bool)

(assert (=> b!791358 m!732101))

(declare-fun m!732103 () Bool)

(assert (=> b!791359 m!732103))

(declare-fun m!732105 () Bool)

(assert (=> b!791361 m!732105))

(assert (=> b!791353 m!732097))

(assert (=> b!791353 m!732097))

(declare-fun m!732107 () Bool)

(assert (=> b!791353 m!732107))

(assert (=> b!791353 m!732107))

(assert (=> b!791353 m!732097))

(declare-fun m!732109 () Bool)

(assert (=> b!791353 m!732109))

(assert (=> b!791351 m!732097))

(assert (=> b!791351 m!732097))

(declare-fun m!732111 () Bool)

(assert (=> b!791351 m!732111))

(assert (=> b!791357 m!732097))

(assert (=> b!791357 m!732097))

(declare-fun m!732113 () Bool)

(assert (=> b!791357 m!732113))

(assert (=> b!791354 m!732097))

(assert (=> b!791354 m!732097))

(declare-fun m!732115 () Bool)

(assert (=> b!791354 m!732115))

(declare-fun m!732117 () Bool)

(assert (=> b!791366 m!732117))

(declare-fun m!732119 () Bool)

(assert (=> b!791366 m!732119))

(assert (=> b!791360 m!732097))

(assert (=> b!791360 m!732097))

(declare-fun m!732121 () Bool)

(assert (=> b!791360 m!732121))

(declare-fun m!732123 () Bool)

(assert (=> b!791356 m!732123))

(declare-fun m!732125 () Bool)

(assert (=> b!791356 m!732125))

(declare-fun m!732127 () Bool)

(assert (=> b!791356 m!732127))

(declare-fun m!732129 () Bool)

(assert (=> b!791356 m!732129))

(assert (=> b!791356 m!732123))

(declare-fun m!732131 () Bool)

(assert (=> b!791356 m!732131))

(declare-fun m!732133 () Bool)

(assert (=> b!791367 m!732133))

(declare-fun m!732135 () Bool)

(assert (=> b!791364 m!732135))

(declare-fun m!732137 () Bool)

(assert (=> start!68002 m!732137))

(declare-fun m!732139 () Bool)

(assert (=> start!68002 m!732139))

(declare-fun m!732141 () Bool)

(assert (=> b!791362 m!732141))

(push 1)

