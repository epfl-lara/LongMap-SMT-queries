; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65934 () Bool)

(assert start!65934)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41977 0))(
  ( (array!41978 (arr!20098 (Array (_ BitVec 32) (_ BitVec 64))) (size!20518 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41977)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7654 0))(
  ( (MissingZero!7654 (index!32984 (_ BitVec 32))) (Found!7654 (index!32985 (_ BitVec 32))) (Intermediate!7654 (undefined!8466 Bool) (index!32986 (_ BitVec 32)) (x!64040 (_ BitVec 32))) (Undefined!7654) (MissingVacant!7654 (index!32987 (_ BitVec 32))) )
))
(declare-fun lt!337508 () SeekEntryResult!7654)

(declare-fun e!422684 () Bool)

(declare-fun b!757965 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41977 (_ BitVec 32)) SeekEntryResult!7654)

(assert (=> b!757965 (= e!422684 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20098 a!3186) j!159) a!3186 mask!3328) lt!337508))))

(declare-fun b!757966 () Bool)

(declare-fun res!512392 () Bool)

(declare-fun e!422683 () Bool)

(assert (=> b!757966 (=> (not res!512392) (not e!422683))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!757966 (= res!512392 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!757967 () Bool)

(declare-fun e!422687 () Bool)

(assert (=> b!757967 (= e!422683 e!422687)))

(declare-fun res!512395 () Bool)

(assert (=> b!757967 (=> (not res!512395) (not e!422687))))

(declare-fun lt!337510 () SeekEntryResult!7654)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!757967 (= res!512395 (or (= lt!337510 (MissingZero!7654 i!1173)) (= lt!337510 (MissingVacant!7654 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41977 (_ BitVec 32)) SeekEntryResult!7654)

(assert (=> b!757967 (= lt!337510 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!757968 () Bool)

(declare-fun res!512404 () Bool)

(assert (=> b!757968 (=> (not res!512404) (not e!422687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41977 (_ BitVec 32)) Bool)

(assert (=> b!757968 (= res!512404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!512394 () Bool)

(assert (=> start!65934 (=> (not res!512394) (not e!422683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65934 (= res!512394 (validMask!0 mask!3328))))

(assert (=> start!65934 e!422683))

(assert (=> start!65934 true))

(declare-fun array_inv!15957 (array!41977) Bool)

(assert (=> start!65934 (array_inv!15957 a!3186)))

(declare-fun b!757969 () Bool)

(declare-fun e!422681 () Bool)

(assert (=> b!757969 (= e!422687 e!422681)))

(declare-fun res!512399 () Bool)

(assert (=> b!757969 (=> (not res!512399) (not e!422681))))

(declare-fun lt!337511 () SeekEntryResult!7654)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41977 (_ BitVec 32)) SeekEntryResult!7654)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!757969 (= res!512399 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20098 a!3186) j!159) mask!3328) (select (arr!20098 a!3186) j!159) a!3186 mask!3328) lt!337511))))

(assert (=> b!757969 (= lt!337511 (Intermediate!7654 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!757970 () Bool)

(declare-fun e!422690 () Bool)

(declare-fun e!422688 () Bool)

(assert (=> b!757970 (= e!422690 (not e!422688))))

(declare-fun res!512402 () Bool)

(assert (=> b!757970 (=> res!512402 e!422688)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!337518 () SeekEntryResult!7654)

(get-info :version)

(assert (=> b!757970 (= res!512402 (or (not ((_ is Intermediate!7654) lt!337518)) (bvslt x!1131 (x!64040 lt!337518)) (not (= x!1131 (x!64040 lt!337518))) (not (= index!1321 (index!32986 lt!337518)))))))

(assert (=> b!757970 e!422684))

(declare-fun res!512405 () Bool)

(assert (=> b!757970 (=> (not res!512405) (not e!422684))))

(declare-fun lt!337517 () SeekEntryResult!7654)

(assert (=> b!757970 (= res!512405 (= lt!337517 lt!337508))))

(assert (=> b!757970 (= lt!337508 (Found!7654 j!159))))

(assert (=> b!757970 (= lt!337517 (seekEntryOrOpen!0 (select (arr!20098 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!757970 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26173 0))(
  ( (Unit!26174) )
))
(declare-fun lt!337512 () Unit!26173)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41977 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26173)

(assert (=> b!757970 (= lt!337512 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!757971 () Bool)

(declare-fun res!512401 () Bool)

(assert (=> b!757971 (=> (not res!512401) (not e!422681))))

(declare-fun e!422680 () Bool)

(assert (=> b!757971 (= res!512401 e!422680)))

(declare-fun c!83170 () Bool)

(assert (=> b!757971 (= c!83170 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!757972 () Bool)

(assert (=> b!757972 (= e!422680 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20098 a!3186) j!159) a!3186 mask!3328) lt!337511))))

(declare-fun b!757973 () Bool)

(declare-fun res!512397 () Bool)

(assert (=> b!757973 (=> (not res!512397) (not e!422681))))

(assert (=> b!757973 (= res!512397 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20098 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!757974 () Bool)

(assert (=> b!757974 (= e!422681 e!422690)))

(declare-fun res!512403 () Bool)

(assert (=> b!757974 (=> (not res!512403) (not e!422690))))

(declare-fun lt!337514 () SeekEntryResult!7654)

(assert (=> b!757974 (= res!512403 (= lt!337514 lt!337518))))

(declare-fun lt!337513 () array!41977)

(declare-fun lt!337516 () (_ BitVec 64))

(assert (=> b!757974 (= lt!337518 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337516 lt!337513 mask!3328))))

(assert (=> b!757974 (= lt!337514 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337516 mask!3328) lt!337516 lt!337513 mask!3328))))

(assert (=> b!757974 (= lt!337516 (select (store (arr!20098 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!757974 (= lt!337513 (array!41978 (store (arr!20098 a!3186) i!1173 k0!2102) (size!20518 a!3186)))))

(declare-fun b!757975 () Bool)

(declare-fun e!422685 () Bool)

(assert (=> b!757975 (= e!422688 e!422685)))

(declare-fun res!512406 () Bool)

(assert (=> b!757975 (=> res!512406 e!422685)))

(declare-fun lt!337509 () SeekEntryResult!7654)

(assert (=> b!757975 (= res!512406 (not (= lt!337509 lt!337508)))))

(assert (=> b!757975 (= lt!337509 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20098 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!757976 () Bool)

(declare-fun res!512400 () Bool)

(assert (=> b!757976 (=> (not res!512400) (not e!422687))))

(assert (=> b!757976 (= res!512400 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20518 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20518 a!3186))))))

(declare-fun b!757977 () Bool)

(declare-fun e!422682 () Bool)

(assert (=> b!757977 (= e!422682 true)))

(declare-fun e!422691 () Bool)

(assert (=> b!757977 e!422691))

(declare-fun res!512408 () Bool)

(assert (=> b!757977 (=> (not res!512408) (not e!422691))))

(declare-fun lt!337515 () (_ BitVec 64))

(assert (=> b!757977 (= res!512408 (= lt!337515 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!337507 () Unit!26173)

(declare-fun e!422686 () Unit!26173)

(assert (=> b!757977 (= lt!337507 e!422686)))

(declare-fun c!83171 () Bool)

(assert (=> b!757977 (= c!83171 (= lt!337515 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!757978 () Bool)

(declare-fun res!512396 () Bool)

(assert (=> b!757978 (=> (not res!512396) (not e!422683))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!757978 (= res!512396 (validKeyInArray!0 (select (arr!20098 a!3186) j!159)))))

(declare-fun b!757979 () Bool)

(assert (=> b!757979 (= e!422685 e!422682)))

(declare-fun res!512393 () Bool)

(assert (=> b!757979 (=> res!512393 e!422682)))

(assert (=> b!757979 (= res!512393 (= lt!337515 lt!337516))))

(assert (=> b!757979 (= lt!337515 (select (store (arr!20098 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!757980 () Bool)

(declare-fun Unit!26175 () Unit!26173)

(assert (=> b!757980 (= e!422686 Unit!26175)))

(assert (=> b!757980 false))

(declare-fun b!757981 () Bool)

(declare-fun res!512409 () Bool)

(assert (=> b!757981 (=> (not res!512409) (not e!422683))))

(assert (=> b!757981 (= res!512409 (and (= (size!20518 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20518 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20518 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!757982 () Bool)

(declare-fun res!512398 () Bool)

(assert (=> b!757982 (=> (not res!512398) (not e!422683))))

(assert (=> b!757982 (= res!512398 (validKeyInArray!0 k0!2102))))

(declare-fun b!757983 () Bool)

(declare-fun res!512407 () Bool)

(assert (=> b!757983 (=> (not res!512407) (not e!422691))))

(assert (=> b!757983 (= res!512407 (= (seekEntryOrOpen!0 lt!337516 lt!337513 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337516 lt!337513 mask!3328)))))

(declare-fun b!757984 () Bool)

(assert (=> b!757984 (= e!422691 (= lt!337517 lt!337509))))

(declare-fun b!757985 () Bool)

(declare-fun Unit!26176 () Unit!26173)

(assert (=> b!757985 (= e!422686 Unit!26176)))

(declare-fun b!757986 () Bool)

(declare-fun res!512410 () Bool)

(assert (=> b!757986 (=> (not res!512410) (not e!422687))))

(declare-datatypes ((List!14007 0))(
  ( (Nil!14004) (Cons!14003 (h!15081 (_ BitVec 64)) (t!20314 List!14007)) )
))
(declare-fun arrayNoDuplicates!0 (array!41977 (_ BitVec 32) List!14007) Bool)

(assert (=> b!757986 (= res!512410 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14004))))

(declare-fun b!757987 () Bool)

(assert (=> b!757987 (= e!422680 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20098 a!3186) j!159) a!3186 mask!3328) (Found!7654 j!159)))))

(assert (= (and start!65934 res!512394) b!757981))

(assert (= (and b!757981 res!512409) b!757978))

(assert (= (and b!757978 res!512396) b!757982))

(assert (= (and b!757982 res!512398) b!757966))

(assert (= (and b!757966 res!512392) b!757967))

(assert (= (and b!757967 res!512395) b!757968))

(assert (= (and b!757968 res!512404) b!757986))

(assert (= (and b!757986 res!512410) b!757976))

(assert (= (and b!757976 res!512400) b!757969))

(assert (= (and b!757969 res!512399) b!757973))

(assert (= (and b!757973 res!512397) b!757971))

(assert (= (and b!757971 c!83170) b!757972))

(assert (= (and b!757971 (not c!83170)) b!757987))

(assert (= (and b!757971 res!512401) b!757974))

(assert (= (and b!757974 res!512403) b!757970))

(assert (= (and b!757970 res!512405) b!757965))

(assert (= (and b!757970 (not res!512402)) b!757975))

(assert (= (and b!757975 (not res!512406)) b!757979))

(assert (= (and b!757979 (not res!512393)) b!757977))

(assert (= (and b!757977 c!83171) b!757980))

(assert (= (and b!757977 (not c!83171)) b!757985))

(assert (= (and b!757977 res!512408) b!757983))

(assert (= (and b!757983 res!512407) b!757984))

(declare-fun m!706143 () Bool)

(assert (=> b!757978 m!706143))

(assert (=> b!757978 m!706143))

(declare-fun m!706145 () Bool)

(assert (=> b!757978 m!706145))

(assert (=> b!757975 m!706143))

(assert (=> b!757975 m!706143))

(declare-fun m!706147 () Bool)

(assert (=> b!757975 m!706147))

(declare-fun m!706149 () Bool)

(assert (=> start!65934 m!706149))

(declare-fun m!706151 () Bool)

(assert (=> start!65934 m!706151))

(declare-fun m!706153 () Bool)

(assert (=> b!757966 m!706153))

(declare-fun m!706155 () Bool)

(assert (=> b!757967 m!706155))

(declare-fun m!706157 () Bool)

(assert (=> b!757968 m!706157))

(declare-fun m!706159 () Bool)

(assert (=> b!757986 m!706159))

(declare-fun m!706161 () Bool)

(assert (=> b!757983 m!706161))

(declare-fun m!706163 () Bool)

(assert (=> b!757983 m!706163))

(assert (=> b!757972 m!706143))

(assert (=> b!757972 m!706143))

(declare-fun m!706165 () Bool)

(assert (=> b!757972 m!706165))

(assert (=> b!757969 m!706143))

(assert (=> b!757969 m!706143))

(declare-fun m!706167 () Bool)

(assert (=> b!757969 m!706167))

(assert (=> b!757969 m!706167))

(assert (=> b!757969 m!706143))

(declare-fun m!706169 () Bool)

(assert (=> b!757969 m!706169))

(declare-fun m!706171 () Bool)

(assert (=> b!757979 m!706171))

(declare-fun m!706173 () Bool)

(assert (=> b!757979 m!706173))

(declare-fun m!706175 () Bool)

(assert (=> b!757974 m!706175))

(assert (=> b!757974 m!706171))

(declare-fun m!706177 () Bool)

(assert (=> b!757974 m!706177))

(assert (=> b!757974 m!706175))

(declare-fun m!706179 () Bool)

(assert (=> b!757974 m!706179))

(declare-fun m!706181 () Bool)

(assert (=> b!757974 m!706181))

(assert (=> b!757987 m!706143))

(assert (=> b!757987 m!706143))

(assert (=> b!757987 m!706147))

(declare-fun m!706183 () Bool)

(assert (=> b!757982 m!706183))

(assert (=> b!757965 m!706143))

(assert (=> b!757965 m!706143))

(declare-fun m!706185 () Bool)

(assert (=> b!757965 m!706185))

(assert (=> b!757970 m!706143))

(assert (=> b!757970 m!706143))

(declare-fun m!706187 () Bool)

(assert (=> b!757970 m!706187))

(declare-fun m!706189 () Bool)

(assert (=> b!757970 m!706189))

(declare-fun m!706191 () Bool)

(assert (=> b!757970 m!706191))

(declare-fun m!706193 () Bool)

(assert (=> b!757973 m!706193))

(check-sat (not b!757975) (not b!757965) (not b!757978) (not b!757974) (not b!757969) (not b!757970) (not b!757987) (not b!757982) (not b!757968) (not b!757966) (not start!65934) (not b!757983) (not b!757986) (not b!757972) (not b!757967))
(check-sat)
