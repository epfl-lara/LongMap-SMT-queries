; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67998 () Bool)

(assert start!67998)

(declare-datatypes ((array!42912 0))(
  ( (array!42913 (arr!20541 (Array (_ BitVec 32) (_ BitVec 64))) (size!20962 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42912)

(declare-fun b!791249 () Bool)

(declare-datatypes ((SeekEntryResult!8141 0))(
  ( (MissingZero!8141 (index!34932 (_ BitVec 32))) (Found!8141 (index!34933 (_ BitVec 32))) (Intermediate!8141 (undefined!8953 Bool) (index!34934 (_ BitVec 32)) (x!65875 (_ BitVec 32))) (Undefined!8141) (MissingVacant!8141 (index!34935 (_ BitVec 32))) )
))
(declare-fun lt!353193 () SeekEntryResult!8141)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!439754 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42912 (_ BitVec 32)) SeekEntryResult!8141)

(assert (=> b!791249 (= e!439754 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20541 a!3186) j!159) a!3186 mask!3328) lt!353193))))

(declare-fun b!791250 () Bool)

(declare-fun res!536020 () Bool)

(declare-fun e!439753 () Bool)

(assert (=> b!791250 (=> (not res!536020) (not e!439753))))

(assert (=> b!791250 (= res!536020 e!439754)))

(declare-fun c!88027 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!791250 (= c!88027 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!791251 () Bool)

(declare-fun res!536016 () Bool)

(declare-fun e!439752 () Bool)

(assert (=> b!791251 (=> (not res!536016) (not e!439752))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42912 (_ BitVec 32)) Bool)

(assert (=> b!791251 (= res!536016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!791252 () Bool)

(declare-fun res!536018 () Bool)

(declare-fun e!439747 () Bool)

(assert (=> b!791252 (=> (not res!536018) (not e!439747))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!791252 (= res!536018 (and (= (size!20962 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20962 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20962 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!791253 () Bool)

(declare-fun e!439750 () Bool)

(declare-fun e!439748 () Bool)

(assert (=> b!791253 (= e!439750 e!439748)))

(declare-fun res!536021 () Bool)

(assert (=> b!791253 (=> (not res!536021) (not e!439748))))

(declare-fun lt!353195 () SeekEntryResult!8141)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42912 (_ BitVec 32)) SeekEntryResult!8141)

(assert (=> b!791253 (= res!536021 (= (seekEntryOrOpen!0 (select (arr!20541 a!3186) j!159) a!3186 mask!3328) lt!353195))))

(assert (=> b!791253 (= lt!353195 (Found!8141 j!159))))

(declare-fun b!791254 () Bool)

(assert (=> b!791254 (= e!439747 e!439752)))

(declare-fun res!536027 () Bool)

(assert (=> b!791254 (=> (not res!536027) (not e!439752))))

(declare-fun lt!353192 () SeekEntryResult!8141)

(assert (=> b!791254 (= res!536027 (or (= lt!353192 (MissingZero!8141 i!1173)) (= lt!353192 (MissingVacant!8141 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!791254 (= lt!353192 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!791255 () Bool)

(declare-fun e!439749 () Bool)

(assert (=> b!791255 (= e!439753 e!439749)))

(declare-fun res!536019 () Bool)

(assert (=> b!791255 (=> (not res!536019) (not e!439749))))

(declare-fun lt!353194 () (_ BitVec 64))

(declare-fun lt!353190 () array!42912)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!791255 (= res!536019 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!353194 mask!3328) lt!353194 lt!353190 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!353194 lt!353190 mask!3328)))))

(assert (=> b!791255 (= lt!353194 (select (store (arr!20541 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!791255 (= lt!353190 (array!42913 (store (arr!20541 a!3186) i!1173 k!2102) (size!20962 a!3186)))))

(declare-fun b!791257 () Bool)

(declare-fun res!536025 () Bool)

(assert (=> b!791257 (=> (not res!536025) (not e!439747))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791257 (= res!536025 (validKeyInArray!0 (select (arr!20541 a!3186) j!159)))))

(declare-fun b!791258 () Bool)

(declare-fun res!536026 () Bool)

(assert (=> b!791258 (=> (not res!536026) (not e!439752))))

(declare-datatypes ((List!14543 0))(
  ( (Nil!14540) (Cons!14539 (h!15668 (_ BitVec 64)) (t!20858 List!14543)) )
))
(declare-fun arrayNoDuplicates!0 (array!42912 (_ BitVec 32) List!14543) Bool)

(assert (=> b!791258 (= res!536026 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14540))))

(declare-fun b!791259 () Bool)

(declare-fun res!536022 () Bool)

(assert (=> b!791259 (=> (not res!536022) (not e!439747))))

(assert (=> b!791259 (= res!536022 (validKeyInArray!0 k!2102))))

(declare-fun b!791260 () Bool)

(declare-fun res!536017 () Bool)

(assert (=> b!791260 (=> (not res!536017) (not e!439747))))

(declare-fun arrayContainsKey!0 (array!42912 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791260 (= res!536017 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!791261 () Bool)

(assert (=> b!791261 (= e!439752 e!439753)))

(declare-fun res!536024 () Bool)

(assert (=> b!791261 (=> (not res!536024) (not e!439753))))

(assert (=> b!791261 (= res!536024 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20541 a!3186) j!159) mask!3328) (select (arr!20541 a!3186) j!159) a!3186 mask!3328) lt!353193))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!791261 (= lt!353193 (Intermediate!8141 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!791262 () Bool)

(assert (=> b!791262 (= e!439749 (not true))))

(assert (=> b!791262 e!439750))

(declare-fun res!536028 () Bool)

(assert (=> b!791262 (=> (not res!536028) (not e!439750))))

(assert (=> b!791262 (= res!536028 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!27434 0))(
  ( (Unit!27435) )
))
(declare-fun lt!353191 () Unit!27434)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42912 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27434)

(assert (=> b!791262 (= lt!353191 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!791263 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42912 (_ BitVec 32)) SeekEntryResult!8141)

(assert (=> b!791263 (= e!439748 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20541 a!3186) j!159) a!3186 mask!3328) lt!353195))))

(declare-fun b!791256 () Bool)

(declare-fun res!536030 () Bool)

(assert (=> b!791256 (=> (not res!536030) (not e!439753))))

(assert (=> b!791256 (= res!536030 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20541 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!536029 () Bool)

(assert (=> start!67998 (=> (not res!536029) (not e!439747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67998 (= res!536029 (validMask!0 mask!3328))))

(assert (=> start!67998 e!439747))

(assert (=> start!67998 true))

(declare-fun array_inv!16337 (array!42912) Bool)

(assert (=> start!67998 (array_inv!16337 a!3186)))

(declare-fun b!791264 () Bool)

(declare-fun res!536023 () Bool)

(assert (=> b!791264 (=> (not res!536023) (not e!439752))))

(assert (=> b!791264 (= res!536023 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20962 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20962 a!3186))))))

(declare-fun b!791265 () Bool)

(assert (=> b!791265 (= e!439754 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20541 a!3186) j!159) a!3186 mask!3328) (Found!8141 j!159)))))

(assert (= (and start!67998 res!536029) b!791252))

(assert (= (and b!791252 res!536018) b!791257))

(assert (= (and b!791257 res!536025) b!791259))

(assert (= (and b!791259 res!536022) b!791260))

(assert (= (and b!791260 res!536017) b!791254))

(assert (= (and b!791254 res!536027) b!791251))

(assert (= (and b!791251 res!536016) b!791258))

(assert (= (and b!791258 res!536026) b!791264))

(assert (= (and b!791264 res!536023) b!791261))

(assert (= (and b!791261 res!536024) b!791256))

(assert (= (and b!791256 res!536030) b!791250))

(assert (= (and b!791250 c!88027) b!791249))

(assert (= (and b!791250 (not c!88027)) b!791265))

(assert (= (and b!791250 res!536020) b!791255))

(assert (= (and b!791255 res!536019) b!791262))

(assert (= (and b!791262 res!536028) b!791253))

(assert (= (and b!791253 res!536021) b!791263))

(declare-fun m!732005 () Bool)

(assert (=> b!791263 m!732005))

(assert (=> b!791263 m!732005))

(declare-fun m!732007 () Bool)

(assert (=> b!791263 m!732007))

(declare-fun m!732009 () Bool)

(assert (=> b!791259 m!732009))

(assert (=> b!791261 m!732005))

(assert (=> b!791261 m!732005))

(declare-fun m!732011 () Bool)

(assert (=> b!791261 m!732011))

(assert (=> b!791261 m!732011))

(assert (=> b!791261 m!732005))

(declare-fun m!732013 () Bool)

(assert (=> b!791261 m!732013))

(declare-fun m!732015 () Bool)

(assert (=> b!791254 m!732015))

(declare-fun m!732017 () Bool)

(assert (=> b!791262 m!732017))

(declare-fun m!732019 () Bool)

(assert (=> b!791262 m!732019))

(assert (=> b!791249 m!732005))

(assert (=> b!791249 m!732005))

(declare-fun m!732021 () Bool)

(assert (=> b!791249 m!732021))

(declare-fun m!732023 () Bool)

(assert (=> b!791255 m!732023))

(declare-fun m!732025 () Bool)

(assert (=> b!791255 m!732025))

(declare-fun m!732027 () Bool)

(assert (=> b!791255 m!732027))

(declare-fun m!732029 () Bool)

(assert (=> b!791255 m!732029))

(declare-fun m!732031 () Bool)

(assert (=> b!791255 m!732031))

(assert (=> b!791255 m!732025))

(declare-fun m!732033 () Bool)

(assert (=> b!791258 m!732033))

(assert (=> b!791265 m!732005))

(assert (=> b!791265 m!732005))

(declare-fun m!732035 () Bool)

(assert (=> b!791265 m!732035))

(assert (=> b!791257 m!732005))

(assert (=> b!791257 m!732005))

(declare-fun m!732037 () Bool)

(assert (=> b!791257 m!732037))

(declare-fun m!732039 () Bool)

(assert (=> b!791251 m!732039))

(assert (=> b!791253 m!732005))

(assert (=> b!791253 m!732005))

(declare-fun m!732041 () Bool)

(assert (=> b!791253 m!732041))

(declare-fun m!732043 () Bool)

(assert (=> start!67998 m!732043))

(declare-fun m!732045 () Bool)

(assert (=> start!67998 m!732045))

(declare-fun m!732047 () Bool)

(assert (=> b!791260 m!732047))

(declare-fun m!732049 () Bool)

(assert (=> b!791256 m!732049))

(push 1)

