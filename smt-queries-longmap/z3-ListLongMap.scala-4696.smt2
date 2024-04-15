; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65216 () Bool)

(assert start!65216)

(declare-fun b!739026 () Bool)

(declare-fun e!413245 () Bool)

(declare-fun e!413247 () Bool)

(assert (=> b!739026 (= e!413245 e!413247)))

(declare-fun res!496946 () Bool)

(assert (=> b!739026 (=> res!496946 e!413247)))

(declare-datatypes ((array!41406 0))(
  ( (array!41407 (arr!19817 (Array (_ BitVec 32) (_ BitVec 64))) (size!20238 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41406)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!328025 () (_ BitVec 32))

(assert (=> b!739026 (= res!496946 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328025 #b00000000000000000000000000000000) (bvsge lt!328025 (size!20238 a!3186))))))

(declare-datatypes ((Unit!25232 0))(
  ( (Unit!25233) )
))
(declare-fun lt!328022 () Unit!25232)

(declare-fun e!413244 () Unit!25232)

(assert (=> b!739026 (= lt!328022 e!413244)))

(declare-fun c!81422 () Bool)

(declare-fun lt!328013 () Bool)

(assert (=> b!739026 (= c!81422 lt!328013)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!739026 (= lt!328013 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739026 (= lt!328025 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!739027 () Bool)

(declare-fun res!496961 () Bool)

(declare-fun e!413237 () Bool)

(assert (=> b!739027 (=> (not res!496961) (not e!413237))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!739027 (= res!496961 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20238 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20238 a!3186))))))

(declare-fun res!496958 () Bool)

(declare-fun e!413243 () Bool)

(assert (=> start!65216 (=> (not res!496958) (not e!413243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65216 (= res!496958 (validMask!0 mask!3328))))

(assert (=> start!65216 e!413243))

(assert (=> start!65216 true))

(declare-fun array_inv!15700 (array!41406) Bool)

(assert (=> start!65216 (array_inv!15700 a!3186)))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7414 0))(
  ( (MissingZero!7414 (index!32024 (_ BitVec 32))) (Found!7414 (index!32025 (_ BitVec 32))) (Intermediate!7414 (undefined!8226 Bool) (index!32026 (_ BitVec 32)) (x!63023 (_ BitVec 32))) (Undefined!7414) (MissingVacant!7414 (index!32027 (_ BitVec 32))) )
))
(declare-fun lt!328020 () SeekEntryResult!7414)

(declare-fun b!739028 () Bool)

(declare-fun e!413239 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41406 (_ BitVec 32)) SeekEntryResult!7414)

(assert (=> b!739028 (= e!413239 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328025 (select (arr!19817 a!3186) j!159) a!3186 mask!3328) lt!328020)))))

(declare-fun b!739029 () Bool)

(declare-fun Unit!25234 () Unit!25232)

(assert (=> b!739029 (= e!413244 Unit!25234)))

(assert (=> b!739029 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328025 (select (arr!19817 a!3186) j!159) a!3186 mask!3328) lt!328020)))

(declare-fun b!739030 () Bool)

(declare-fun res!496950 () Bool)

(declare-fun e!413246 () Bool)

(assert (=> b!739030 (=> (not res!496950) (not e!413246))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!739030 (= res!496950 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19817 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!328017 () SeekEntryResult!7414)

(declare-fun b!739031 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41406 (_ BitVec 32)) SeekEntryResult!7414)

(assert (=> b!739031 (= e!413239 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328025 resIntermediateIndex!5 (select (arr!19817 a!3186) j!159) a!3186 mask!3328) lt!328017)))))

(declare-fun b!739032 () Bool)

(declare-fun res!496955 () Bool)

(assert (=> b!739032 (=> (not res!496955) (not e!413237))))

(declare-datatypes ((List!13858 0))(
  ( (Nil!13855) (Cons!13854 (h!14926 (_ BitVec 64)) (t!20164 List!13858)) )
))
(declare-fun arrayNoDuplicates!0 (array!41406 (_ BitVec 32) List!13858) Bool)

(assert (=> b!739032 (= res!496955 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13855))))

(declare-fun b!739033 () Bool)

(declare-fun res!496945 () Bool)

(assert (=> b!739033 (=> (not res!496945) (not e!413243))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41406 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!739033 (= res!496945 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!739034 () Bool)

(declare-fun res!496954 () Bool)

(assert (=> b!739034 (=> (not res!496954) (not e!413243))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!739034 (= res!496954 (validKeyInArray!0 (select (arr!19817 a!3186) j!159)))))

(declare-fun b!739035 () Bool)

(declare-fun e!413240 () Bool)

(assert (=> b!739035 (= e!413240 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19817 a!3186) j!159) a!3186 mask!3328) lt!328020))))

(declare-fun b!739036 () Bool)

(assert (=> b!739036 (= e!413243 e!413237)))

(declare-fun res!496951 () Bool)

(assert (=> b!739036 (=> (not res!496951) (not e!413237))))

(declare-fun lt!328021 () SeekEntryResult!7414)

(assert (=> b!739036 (= res!496951 (or (= lt!328021 (MissingZero!7414 i!1173)) (= lt!328021 (MissingVacant!7414 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41406 (_ BitVec 32)) SeekEntryResult!7414)

(assert (=> b!739036 (= lt!328021 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!739037 () Bool)

(declare-fun Unit!25235 () Unit!25232)

(assert (=> b!739037 (= e!413244 Unit!25235)))

(declare-fun lt!328018 () SeekEntryResult!7414)

(assert (=> b!739037 (= lt!328018 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19817 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!739037 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328025 resIntermediateIndex!5 (select (arr!19817 a!3186) j!159) a!3186 mask!3328) lt!328017)))

(declare-fun b!739038 () Bool)

(declare-fun e!413241 () Bool)

(assert (=> b!739038 (= e!413241 (not e!413245))))

(declare-fun res!496952 () Bool)

(assert (=> b!739038 (=> res!496952 e!413245)))

(declare-fun lt!328024 () SeekEntryResult!7414)

(get-info :version)

(assert (=> b!739038 (= res!496952 (or (not ((_ is Intermediate!7414) lt!328024)) (bvsge x!1131 (x!63023 lt!328024))))))

(assert (=> b!739038 (= lt!328017 (Found!7414 j!159))))

(declare-fun e!413242 () Bool)

(assert (=> b!739038 e!413242))

(declare-fun res!496949 () Bool)

(assert (=> b!739038 (=> (not res!496949) (not e!413242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41406 (_ BitVec 32)) Bool)

(assert (=> b!739038 (= res!496949 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328015 () Unit!25232)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41406 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25232)

(assert (=> b!739038 (= lt!328015 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!739039 () Bool)

(assert (=> b!739039 (= e!413247 true)))

(declare-fun lt!328014 () (_ BitVec 64))

(declare-fun lt!328019 () array!41406)

(declare-fun lt!328023 () SeekEntryResult!7414)

(assert (=> b!739039 (= lt!328023 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328025 lt!328014 lt!328019 mask!3328))))

(declare-fun b!739040 () Bool)

(assert (=> b!739040 (= e!413237 e!413246)))

(declare-fun res!496956 () Bool)

(assert (=> b!739040 (=> (not res!496956) (not e!413246))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739040 (= res!496956 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19817 a!3186) j!159) mask!3328) (select (arr!19817 a!3186) j!159) a!3186 mask!3328) lt!328020))))

(assert (=> b!739040 (= lt!328020 (Intermediate!7414 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!739041 () Bool)

(declare-fun res!496953 () Bool)

(assert (=> b!739041 (=> (not res!496953) (not e!413243))))

(assert (=> b!739041 (= res!496953 (and (= (size!20238 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20238 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20238 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!739042 () Bool)

(declare-fun res!496960 () Bool)

(assert (=> b!739042 (=> (not res!496960) (not e!413246))))

(assert (=> b!739042 (= res!496960 e!413240)))

(declare-fun c!81421 () Bool)

(assert (=> b!739042 (= c!81421 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!739043 () Bool)

(declare-fun lt!328016 () SeekEntryResult!7414)

(declare-fun e!413238 () Bool)

(assert (=> b!739043 (= e!413238 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19817 a!3186) j!159) a!3186 mask!3328) lt!328016))))

(declare-fun b!739044 () Bool)

(assert (=> b!739044 (= e!413242 e!413238)))

(declare-fun res!496948 () Bool)

(assert (=> b!739044 (=> (not res!496948) (not e!413238))))

(assert (=> b!739044 (= res!496948 (= (seekEntryOrOpen!0 (select (arr!19817 a!3186) j!159) a!3186 mask!3328) lt!328016))))

(assert (=> b!739044 (= lt!328016 (Found!7414 j!159))))

(declare-fun b!739045 () Bool)

(declare-fun res!496947 () Bool)

(assert (=> b!739045 (=> res!496947 e!413247)))

(assert (=> b!739045 (= res!496947 e!413239)))

(declare-fun c!81423 () Bool)

(assert (=> b!739045 (= c!81423 lt!328013)))

(declare-fun b!739046 () Bool)

(assert (=> b!739046 (= e!413240 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19817 a!3186) j!159) a!3186 mask!3328) (Found!7414 j!159)))))

(declare-fun b!739047 () Bool)

(declare-fun res!496959 () Bool)

(assert (=> b!739047 (=> (not res!496959) (not e!413237))))

(assert (=> b!739047 (= res!496959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!739048 () Bool)

(declare-fun res!496957 () Bool)

(assert (=> b!739048 (=> (not res!496957) (not e!413243))))

(assert (=> b!739048 (= res!496957 (validKeyInArray!0 k0!2102))))

(declare-fun b!739049 () Bool)

(assert (=> b!739049 (= e!413246 e!413241)))

(declare-fun res!496962 () Bool)

(assert (=> b!739049 (=> (not res!496962) (not e!413241))))

(declare-fun lt!328012 () SeekEntryResult!7414)

(assert (=> b!739049 (= res!496962 (= lt!328012 lt!328024))))

(assert (=> b!739049 (= lt!328024 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328014 lt!328019 mask!3328))))

(assert (=> b!739049 (= lt!328012 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328014 mask!3328) lt!328014 lt!328019 mask!3328))))

(assert (=> b!739049 (= lt!328014 (select (store (arr!19817 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!739049 (= lt!328019 (array!41407 (store (arr!19817 a!3186) i!1173 k0!2102) (size!20238 a!3186)))))

(assert (= (and start!65216 res!496958) b!739041))

(assert (= (and b!739041 res!496953) b!739034))

(assert (= (and b!739034 res!496954) b!739048))

(assert (= (and b!739048 res!496957) b!739033))

(assert (= (and b!739033 res!496945) b!739036))

(assert (= (and b!739036 res!496951) b!739047))

(assert (= (and b!739047 res!496959) b!739032))

(assert (= (and b!739032 res!496955) b!739027))

(assert (= (and b!739027 res!496961) b!739040))

(assert (= (and b!739040 res!496956) b!739030))

(assert (= (and b!739030 res!496950) b!739042))

(assert (= (and b!739042 c!81421) b!739035))

(assert (= (and b!739042 (not c!81421)) b!739046))

(assert (= (and b!739042 res!496960) b!739049))

(assert (= (and b!739049 res!496962) b!739038))

(assert (= (and b!739038 res!496949) b!739044))

(assert (= (and b!739044 res!496948) b!739043))

(assert (= (and b!739038 (not res!496952)) b!739026))

(assert (= (and b!739026 c!81422) b!739029))

(assert (= (and b!739026 (not c!81422)) b!739037))

(assert (= (and b!739026 (not res!496946)) b!739045))

(assert (= (and b!739045 c!81423) b!739028))

(assert (= (and b!739045 (not c!81423)) b!739031))

(assert (= (and b!739045 (not res!496947)) b!739039))

(declare-fun m!689939 () Bool)

(assert (=> b!739039 m!689939))

(declare-fun m!689941 () Bool)

(assert (=> b!739033 m!689941))

(declare-fun m!689943 () Bool)

(assert (=> b!739040 m!689943))

(assert (=> b!739040 m!689943))

(declare-fun m!689945 () Bool)

(assert (=> b!739040 m!689945))

(assert (=> b!739040 m!689945))

(assert (=> b!739040 m!689943))

(declare-fun m!689947 () Bool)

(assert (=> b!739040 m!689947))

(assert (=> b!739029 m!689943))

(assert (=> b!739029 m!689943))

(declare-fun m!689949 () Bool)

(assert (=> b!739029 m!689949))

(declare-fun m!689951 () Bool)

(assert (=> start!65216 m!689951))

(declare-fun m!689953 () Bool)

(assert (=> start!65216 m!689953))

(declare-fun m!689955 () Bool)

(assert (=> b!739049 m!689955))

(declare-fun m!689957 () Bool)

(assert (=> b!739049 m!689957))

(declare-fun m!689959 () Bool)

(assert (=> b!739049 m!689959))

(assert (=> b!739049 m!689955))

(declare-fun m!689961 () Bool)

(assert (=> b!739049 m!689961))

(declare-fun m!689963 () Bool)

(assert (=> b!739049 m!689963))

(assert (=> b!739037 m!689943))

(assert (=> b!739037 m!689943))

(declare-fun m!689965 () Bool)

(assert (=> b!739037 m!689965))

(assert (=> b!739037 m!689943))

(declare-fun m!689967 () Bool)

(assert (=> b!739037 m!689967))

(assert (=> b!739028 m!689943))

(assert (=> b!739028 m!689943))

(assert (=> b!739028 m!689949))

(assert (=> b!739031 m!689943))

(assert (=> b!739031 m!689943))

(assert (=> b!739031 m!689967))

(declare-fun m!689969 () Bool)

(assert (=> b!739030 m!689969))

(assert (=> b!739034 m!689943))

(assert (=> b!739034 m!689943))

(declare-fun m!689971 () Bool)

(assert (=> b!739034 m!689971))

(declare-fun m!689973 () Bool)

(assert (=> b!739038 m!689973))

(declare-fun m!689975 () Bool)

(assert (=> b!739038 m!689975))

(assert (=> b!739043 m!689943))

(assert (=> b!739043 m!689943))

(declare-fun m!689977 () Bool)

(assert (=> b!739043 m!689977))

(assert (=> b!739046 m!689943))

(assert (=> b!739046 m!689943))

(assert (=> b!739046 m!689965))

(declare-fun m!689979 () Bool)

(assert (=> b!739048 m!689979))

(assert (=> b!739044 m!689943))

(assert (=> b!739044 m!689943))

(declare-fun m!689981 () Bool)

(assert (=> b!739044 m!689981))

(declare-fun m!689983 () Bool)

(assert (=> b!739036 m!689983))

(declare-fun m!689985 () Bool)

(assert (=> b!739047 m!689985))

(declare-fun m!689987 () Bool)

(assert (=> b!739032 m!689987))

(assert (=> b!739035 m!689943))

(assert (=> b!739035 m!689943))

(declare-fun m!689989 () Bool)

(assert (=> b!739035 m!689989))

(declare-fun m!689991 () Bool)

(assert (=> b!739026 m!689991))

(check-sat (not b!739046) (not b!739043) (not b!739035) (not b!739031) (not b!739047) (not b!739039) (not b!739048) (not b!739029) (not b!739049) (not b!739044) (not b!739033) (not b!739026) (not b!739038) (not b!739028) (not b!739037) (not b!739036) (not start!65216) (not b!739034) (not b!739032) (not b!739040))
(check-sat)
