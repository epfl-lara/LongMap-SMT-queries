; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64548 () Bool)

(assert start!64548)

(declare-fun b!727081 () Bool)

(declare-fun e!407040 () Bool)

(declare-fun e!407046 () Bool)

(assert (=> b!727081 (= e!407040 e!407046)))

(declare-fun res!487991 () Bool)

(assert (=> b!727081 (=> (not res!487991) (not e!407046))))

(declare-datatypes ((SeekEntryResult!7254 0))(
  ( (MissingZero!7254 (index!31384 (_ BitVec 32))) (Found!7254 (index!31385 (_ BitVec 32))) (Intermediate!7254 (undefined!8066 Bool) (index!31386 (_ BitVec 32)) (x!62368 (_ BitVec 32))) (Undefined!7254) (MissingVacant!7254 (index!31387 (_ BitVec 32))) )
))
(declare-fun lt!322021 () SeekEntryResult!7254)

(declare-fun lt!322018 () SeekEntryResult!7254)

(assert (=> b!727081 (= res!487991 (= lt!322021 lt!322018))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!41066 0))(
  ( (array!41067 (arr!19654 (Array (_ BitVec 32) (_ BitVec 64))) (size!20075 (_ BitVec 32))) )
))
(declare-fun lt!322023 () array!41066)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!322020 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41066 (_ BitVec 32)) SeekEntryResult!7254)

(assert (=> b!727081 (= lt!322018 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322020 lt!322023 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727081 (= lt!322021 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322020 mask!3328) lt!322020 lt!322023 mask!3328))))

(declare-fun a!3186 () array!41066)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!727081 (= lt!322020 (select (store (arr!19654 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!727081 (= lt!322023 (array!41067 (store (arr!19654 a!3186) i!1173 k0!2102) (size!20075 a!3186)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!322017 () SeekEntryResult!7254)

(declare-fun b!727082 () Bool)

(declare-fun e!407044 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41066 (_ BitVec 32)) SeekEntryResult!7254)

(assert (=> b!727082 (= e!407044 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19654 a!3186) j!159) a!3186 mask!3328) lt!322017))))

(declare-fun b!727083 () Bool)

(declare-fun res!487994 () Bool)

(declare-fun e!407043 () Bool)

(assert (=> b!727083 (=> (not res!487994) (not e!407043))))

(assert (=> b!727083 (= res!487994 (and (= (size!20075 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20075 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20075 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!727084 () Bool)

(declare-fun res!487998 () Bool)

(assert (=> b!727084 (=> (not res!487998) (not e!407043))))

(declare-fun arrayContainsKey!0 (array!41066 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!727084 (= res!487998 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!727086 () Bool)

(declare-fun e!407045 () Bool)

(assert (=> b!727086 (= e!407043 e!407045)))

(declare-fun res!488002 () Bool)

(assert (=> b!727086 (=> (not res!488002) (not e!407045))))

(declare-fun lt!322024 () SeekEntryResult!7254)

(assert (=> b!727086 (= res!488002 (or (= lt!322024 (MissingZero!7254 i!1173)) (= lt!322024 (MissingVacant!7254 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41066 (_ BitVec 32)) SeekEntryResult!7254)

(assert (=> b!727086 (= lt!322024 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!727087 () Bool)

(declare-fun res!488003 () Bool)

(assert (=> b!727087 (=> (not res!488003) (not e!407043))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!727087 (= res!488003 (validKeyInArray!0 k0!2102))))

(declare-fun b!727088 () Bool)

(assert (=> b!727088 (= e!407045 e!407040)))

(declare-fun res!487999 () Bool)

(assert (=> b!727088 (=> (not res!487999) (not e!407040))))

(declare-fun lt!322025 () SeekEntryResult!7254)

(assert (=> b!727088 (= res!487999 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19654 a!3186) j!159) mask!3328) (select (arr!19654 a!3186) j!159) a!3186 mask!3328) lt!322025))))

(assert (=> b!727088 (= lt!322025 (Intermediate!7254 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!727089 () Bool)

(declare-fun e!407042 () Bool)

(assert (=> b!727089 (= e!407042 true)))

(declare-fun lt!322022 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727089 (= lt!322022 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!727090 () Bool)

(declare-fun e!407048 () Bool)

(assert (=> b!727090 (= e!407048 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19654 a!3186) j!159) a!3186 mask!3328) lt!322025))))

(declare-fun b!727091 () Bool)

(declare-fun res!487997 () Bool)

(assert (=> b!727091 (=> (not res!487997) (not e!407040))))

(assert (=> b!727091 (= res!487997 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19654 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!727092 () Bool)

(declare-fun res!488005 () Bool)

(assert (=> b!727092 (=> (not res!488005) (not e!407043))))

(assert (=> b!727092 (= res!488005 (validKeyInArray!0 (select (arr!19654 a!3186) j!159)))))

(declare-fun b!727093 () Bool)

(declare-fun res!488000 () Bool)

(assert (=> b!727093 (=> (not res!488000) (not e!407045))))

(declare-datatypes ((List!13656 0))(
  ( (Nil!13653) (Cons!13652 (h!14709 (_ BitVec 64)) (t!19971 List!13656)) )
))
(declare-fun arrayNoDuplicates!0 (array!41066 (_ BitVec 32) List!13656) Bool)

(assert (=> b!727093 (= res!488000 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13653))))

(declare-fun b!727094 () Bool)

(declare-fun e!407047 () Bool)

(assert (=> b!727094 (= e!407047 e!407044)))

(declare-fun res!487993 () Bool)

(assert (=> b!727094 (=> (not res!487993) (not e!407044))))

(assert (=> b!727094 (= res!487993 (= (seekEntryOrOpen!0 (select (arr!19654 a!3186) j!159) a!3186 mask!3328) lt!322017))))

(assert (=> b!727094 (= lt!322017 (Found!7254 j!159))))

(declare-fun b!727095 () Bool)

(assert (=> b!727095 (= e!407048 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19654 a!3186) j!159) a!3186 mask!3328) (Found!7254 j!159)))))

(declare-fun b!727096 () Bool)

(declare-fun res!488004 () Bool)

(assert (=> b!727096 (=> (not res!488004) (not e!407040))))

(assert (=> b!727096 (= res!488004 e!407048)))

(declare-fun c!79918 () Bool)

(assert (=> b!727096 (= c!79918 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!727085 () Bool)

(declare-fun res!488006 () Bool)

(assert (=> b!727085 (=> (not res!488006) (not e!407045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41066 (_ BitVec 32)) Bool)

(assert (=> b!727085 (= res!488006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!488001 () Bool)

(assert (=> start!64548 (=> (not res!488001) (not e!407043))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64548 (= res!488001 (validMask!0 mask!3328))))

(assert (=> start!64548 e!407043))

(assert (=> start!64548 true))

(declare-fun array_inv!15450 (array!41066) Bool)

(assert (=> start!64548 (array_inv!15450 a!3186)))

(declare-fun b!727097 () Bool)

(declare-fun res!487995 () Bool)

(assert (=> b!727097 (=> (not res!487995) (not e!407045))))

(assert (=> b!727097 (= res!487995 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20075 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20075 a!3186))))))

(declare-fun b!727098 () Bool)

(assert (=> b!727098 (= e!407046 (not e!407042))))

(declare-fun res!487992 () Bool)

(assert (=> b!727098 (=> res!487992 e!407042)))

(get-info :version)

(assert (=> b!727098 (= res!487992 (or (not ((_ is Intermediate!7254) lt!322018)) (bvsge x!1131 (x!62368 lt!322018))))))

(assert (=> b!727098 e!407047))

(declare-fun res!487996 () Bool)

(assert (=> b!727098 (=> (not res!487996) (not e!407047))))

(assert (=> b!727098 (= res!487996 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24826 0))(
  ( (Unit!24827) )
))
(declare-fun lt!322019 () Unit!24826)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41066 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24826)

(assert (=> b!727098 (= lt!322019 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!64548 res!488001) b!727083))

(assert (= (and b!727083 res!487994) b!727092))

(assert (= (and b!727092 res!488005) b!727087))

(assert (= (and b!727087 res!488003) b!727084))

(assert (= (and b!727084 res!487998) b!727086))

(assert (= (and b!727086 res!488002) b!727085))

(assert (= (and b!727085 res!488006) b!727093))

(assert (= (and b!727093 res!488000) b!727097))

(assert (= (and b!727097 res!487995) b!727088))

(assert (= (and b!727088 res!487999) b!727091))

(assert (= (and b!727091 res!487997) b!727096))

(assert (= (and b!727096 c!79918) b!727090))

(assert (= (and b!727096 (not c!79918)) b!727095))

(assert (= (and b!727096 res!488004) b!727081))

(assert (= (and b!727081 res!487991) b!727098))

(assert (= (and b!727098 res!487996) b!727094))

(assert (= (and b!727094 res!487993) b!727082))

(assert (= (and b!727098 (not res!487992)) b!727089))

(declare-fun m!681073 () Bool)

(assert (=> b!727092 m!681073))

(assert (=> b!727092 m!681073))

(declare-fun m!681075 () Bool)

(assert (=> b!727092 m!681075))

(declare-fun m!681077 () Bool)

(assert (=> b!727087 m!681077))

(declare-fun m!681079 () Bool)

(assert (=> b!727085 m!681079))

(declare-fun m!681081 () Bool)

(assert (=> b!727093 m!681081))

(declare-fun m!681083 () Bool)

(assert (=> b!727084 m!681083))

(declare-fun m!681085 () Bool)

(assert (=> b!727086 m!681085))

(declare-fun m!681087 () Bool)

(assert (=> b!727091 m!681087))

(assert (=> b!727088 m!681073))

(assert (=> b!727088 m!681073))

(declare-fun m!681089 () Bool)

(assert (=> b!727088 m!681089))

(assert (=> b!727088 m!681089))

(assert (=> b!727088 m!681073))

(declare-fun m!681091 () Bool)

(assert (=> b!727088 m!681091))

(declare-fun m!681093 () Bool)

(assert (=> b!727089 m!681093))

(declare-fun m!681095 () Bool)

(assert (=> b!727098 m!681095))

(declare-fun m!681097 () Bool)

(assert (=> b!727098 m!681097))

(assert (=> b!727094 m!681073))

(assert (=> b!727094 m!681073))

(declare-fun m!681099 () Bool)

(assert (=> b!727094 m!681099))

(assert (=> b!727095 m!681073))

(assert (=> b!727095 m!681073))

(declare-fun m!681101 () Bool)

(assert (=> b!727095 m!681101))

(assert (=> b!727090 m!681073))

(assert (=> b!727090 m!681073))

(declare-fun m!681103 () Bool)

(assert (=> b!727090 m!681103))

(declare-fun m!681105 () Bool)

(assert (=> start!64548 m!681105))

(declare-fun m!681107 () Bool)

(assert (=> start!64548 m!681107))

(declare-fun m!681109 () Bool)

(assert (=> b!727081 m!681109))

(declare-fun m!681111 () Bool)

(assert (=> b!727081 m!681111))

(declare-fun m!681113 () Bool)

(assert (=> b!727081 m!681113))

(assert (=> b!727081 m!681109))

(declare-fun m!681115 () Bool)

(assert (=> b!727081 m!681115))

(declare-fun m!681117 () Bool)

(assert (=> b!727081 m!681117))

(assert (=> b!727082 m!681073))

(assert (=> b!727082 m!681073))

(declare-fun m!681119 () Bool)

(assert (=> b!727082 m!681119))

(check-sat (not b!727095) (not b!727089) (not b!727084) (not b!727086) (not b!727088) (not b!727094) (not b!727092) (not b!727087) (not b!727098) (not b!727082) (not b!727085) (not start!64548) (not b!727090) (not b!727081) (not b!727093))
(check-sat)
