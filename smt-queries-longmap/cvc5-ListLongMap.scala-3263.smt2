; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45450 () Bool)

(assert start!45450)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32275 0))(
  ( (array!32276 (arr!15519 (Array (_ BitVec 32) (_ BitVec 64))) (size!15883 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32275)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!293021 () Bool)

(declare-fun b!500088 () Bool)

(declare-datatypes ((SeekEntryResult!3986 0))(
  ( (MissingZero!3986 (index!18126 (_ BitVec 32))) (Found!3986 (index!18127 (_ BitVec 32))) (Intermediate!3986 (undefined!4798 Bool) (index!18128 (_ BitVec 32)) (x!47167 (_ BitVec 32))) (Undefined!3986) (MissingVacant!3986 (index!18129 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32275 (_ BitVec 32)) SeekEntryResult!3986)

(assert (=> b!500088 (= e!293021 (= (seekEntryOrOpen!0 (select (arr!15519 a!3235) j!176) a!3235 mask!3524) (Found!3986 j!176)))))

(declare-fun b!500089 () Bool)

(declare-fun e!293019 () Bool)

(declare-fun e!293020 () Bool)

(assert (=> b!500089 (= e!293019 (not e!293020))))

(declare-fun res!301975 () Bool)

(assert (=> b!500089 (=> res!301975 e!293020)))

(declare-fun lt!226884 () (_ BitVec 32))

(declare-fun lt!226883 () SeekEntryResult!3986)

(declare-fun lt!226887 () array!32275)

(declare-fun lt!226888 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32275 (_ BitVec 32)) SeekEntryResult!3986)

(assert (=> b!500089 (= res!301975 (= lt!226883 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226884 lt!226888 lt!226887 mask!3524)))))

(declare-fun lt!226886 () (_ BitVec 32))

(assert (=> b!500089 (= lt!226883 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226886 (select (arr!15519 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500089 (= lt!226884 (toIndex!0 lt!226888 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500089 (= lt!226888 (select (store (arr!15519 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!500089 (= lt!226886 (toIndex!0 (select (arr!15519 a!3235) j!176) mask!3524))))

(assert (=> b!500089 (= lt!226887 (array!32276 (store (arr!15519 a!3235) i!1204 k!2280) (size!15883 a!3235)))))

(assert (=> b!500089 e!293021))

(declare-fun res!301973 () Bool)

(assert (=> b!500089 (=> (not res!301973) (not e!293021))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32275 (_ BitVec 32)) Bool)

(assert (=> b!500089 (= res!301973 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15020 0))(
  ( (Unit!15021) )
))
(declare-fun lt!226879 () Unit!15020)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32275 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15020)

(assert (=> b!500089 (= lt!226879 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500090 () Bool)

(declare-fun res!301971 () Bool)

(declare-fun e!293022 () Bool)

(assert (=> b!500090 (=> (not res!301971) (not e!293022))))

(declare-fun arrayContainsKey!0 (array!32275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500090 (= res!301971 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500091 () Bool)

(declare-fun res!301968 () Bool)

(assert (=> b!500091 (=> (not res!301968) (not e!293019))))

(declare-datatypes ((List!9677 0))(
  ( (Nil!9674) (Cons!9673 (h!10547 (_ BitVec 64)) (t!15905 List!9677)) )
))
(declare-fun arrayNoDuplicates!0 (array!32275 (_ BitVec 32) List!9677) Bool)

(assert (=> b!500091 (= res!301968 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9674))))

(declare-fun b!500092 () Bool)

(declare-fun e!293016 () Unit!15020)

(declare-fun Unit!15022 () Unit!15020)

(assert (=> b!500092 (= e!293016 Unit!15022)))

(declare-fun b!500094 () Bool)

(declare-fun e!293018 () Bool)

(assert (=> b!500094 (= e!293020 e!293018)))

(declare-fun res!301976 () Bool)

(assert (=> b!500094 (=> res!301976 e!293018)))

(assert (=> b!500094 (= res!301976 (or (bvsgt #b00000000000000000000000000000000 (x!47167 lt!226883)) (bvsgt (x!47167 lt!226883) #b01111111111111111111111111111110) (bvslt lt!226886 #b00000000000000000000000000000000) (bvsge lt!226886 (size!15883 a!3235)) (bvslt (index!18128 lt!226883) #b00000000000000000000000000000000) (bvsge (index!18128 lt!226883) (size!15883 a!3235)) (not (= lt!226883 (Intermediate!3986 false (index!18128 lt!226883) (x!47167 lt!226883))))))))

(assert (=> b!500094 (and (or (= (select (arr!15519 a!3235) (index!18128 lt!226883)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15519 a!3235) (index!18128 lt!226883)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15519 a!3235) (index!18128 lt!226883)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15519 a!3235) (index!18128 lt!226883)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226885 () Unit!15020)

(assert (=> b!500094 (= lt!226885 e!293016)))

(declare-fun c!59339 () Bool)

(assert (=> b!500094 (= c!59339 (= (select (arr!15519 a!3235) (index!18128 lt!226883)) (select (arr!15519 a!3235) j!176)))))

(assert (=> b!500094 (and (bvslt (x!47167 lt!226883) #b01111111111111111111111111111110) (or (= (select (arr!15519 a!3235) (index!18128 lt!226883)) (select (arr!15519 a!3235) j!176)) (= (select (arr!15519 a!3235) (index!18128 lt!226883)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15519 a!3235) (index!18128 lt!226883)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500095 () Bool)

(assert (=> b!500095 (= e!293022 e!293019)))

(declare-fun res!301964 () Bool)

(assert (=> b!500095 (=> (not res!301964) (not e!293019))))

(declare-fun lt!226882 () SeekEntryResult!3986)

(assert (=> b!500095 (= res!301964 (or (= lt!226882 (MissingZero!3986 i!1204)) (= lt!226882 (MissingVacant!3986 i!1204))))))

(assert (=> b!500095 (= lt!226882 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!500096 () Bool)

(declare-fun res!301974 () Bool)

(assert (=> b!500096 (=> (not res!301974) (not e!293019))))

(assert (=> b!500096 (= res!301974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500097 () Bool)

(assert (=> b!500097 (= e!293018 true)))

(declare-fun lt!226881 () SeekEntryResult!3986)

(assert (=> b!500097 (= lt!226881 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226886 lt!226888 lt!226887 mask!3524))))

(declare-fun b!500098 () Bool)

(declare-fun res!301972 () Bool)

(assert (=> b!500098 (=> (not res!301972) (not e!293022))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500098 (= res!301972 (validKeyInArray!0 (select (arr!15519 a!3235) j!176)))))

(declare-fun b!500099 () Bool)

(declare-fun e!293017 () Bool)

(assert (=> b!500099 (= e!293017 false)))

(declare-fun b!500100 () Bool)

(declare-fun res!301966 () Bool)

(assert (=> b!500100 (=> res!301966 e!293020)))

(assert (=> b!500100 (= res!301966 (or (undefined!4798 lt!226883) (not (is-Intermediate!3986 lt!226883))))))

(declare-fun b!500093 () Bool)

(declare-fun res!301970 () Bool)

(assert (=> b!500093 (=> (not res!301970) (not e!293022))))

(assert (=> b!500093 (= res!301970 (validKeyInArray!0 k!2280))))

(declare-fun res!301969 () Bool)

(assert (=> start!45450 (=> (not res!301969) (not e!293022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45450 (= res!301969 (validMask!0 mask!3524))))

(assert (=> start!45450 e!293022))

(assert (=> start!45450 true))

(declare-fun array_inv!11315 (array!32275) Bool)

(assert (=> start!45450 (array_inv!11315 a!3235)))

(declare-fun b!500101 () Bool)

(declare-fun Unit!15023 () Unit!15020)

(assert (=> b!500101 (= e!293016 Unit!15023)))

(declare-fun lt!226880 () Unit!15020)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32275 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15020)

(assert (=> b!500101 (= lt!226880 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!226886 #b00000000000000000000000000000000 (index!18128 lt!226883) (x!47167 lt!226883) mask!3524))))

(declare-fun res!301967 () Bool)

(assert (=> b!500101 (= res!301967 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226886 lt!226888 lt!226887 mask!3524) (Intermediate!3986 false (index!18128 lt!226883) (x!47167 lt!226883))))))

(assert (=> b!500101 (=> (not res!301967) (not e!293017))))

(assert (=> b!500101 e!293017))

(declare-fun b!500102 () Bool)

(declare-fun res!301965 () Bool)

(assert (=> b!500102 (=> (not res!301965) (not e!293022))))

(assert (=> b!500102 (= res!301965 (and (= (size!15883 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15883 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15883 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45450 res!301969) b!500102))

(assert (= (and b!500102 res!301965) b!500098))

(assert (= (and b!500098 res!301972) b!500093))

(assert (= (and b!500093 res!301970) b!500090))

(assert (= (and b!500090 res!301971) b!500095))

(assert (= (and b!500095 res!301964) b!500096))

(assert (= (and b!500096 res!301974) b!500091))

(assert (= (and b!500091 res!301968) b!500089))

(assert (= (and b!500089 res!301973) b!500088))

(assert (= (and b!500089 (not res!301975)) b!500100))

(assert (= (and b!500100 (not res!301966)) b!500094))

(assert (= (and b!500094 c!59339) b!500101))

(assert (= (and b!500094 (not c!59339)) b!500092))

(assert (= (and b!500101 res!301967) b!500099))

(assert (= (and b!500094 (not res!301976)) b!500097))

(declare-fun m!481245 () Bool)

(assert (=> b!500095 m!481245))

(declare-fun m!481247 () Bool)

(assert (=> b!500097 m!481247))

(declare-fun m!481249 () Bool)

(assert (=> b!500088 m!481249))

(assert (=> b!500088 m!481249))

(declare-fun m!481251 () Bool)

(assert (=> b!500088 m!481251))

(declare-fun m!481253 () Bool)

(assert (=> b!500091 m!481253))

(declare-fun m!481255 () Bool)

(assert (=> b!500093 m!481255))

(declare-fun m!481257 () Bool)

(assert (=> b!500090 m!481257))

(declare-fun m!481259 () Bool)

(assert (=> b!500096 m!481259))

(declare-fun m!481261 () Bool)

(assert (=> b!500089 m!481261))

(declare-fun m!481263 () Bool)

(assert (=> b!500089 m!481263))

(declare-fun m!481265 () Bool)

(assert (=> b!500089 m!481265))

(assert (=> b!500089 m!481249))

(declare-fun m!481267 () Bool)

(assert (=> b!500089 m!481267))

(assert (=> b!500089 m!481249))

(declare-fun m!481269 () Bool)

(assert (=> b!500089 m!481269))

(assert (=> b!500089 m!481249))

(declare-fun m!481271 () Bool)

(assert (=> b!500089 m!481271))

(declare-fun m!481273 () Bool)

(assert (=> b!500089 m!481273))

(declare-fun m!481275 () Bool)

(assert (=> b!500089 m!481275))

(declare-fun m!481277 () Bool)

(assert (=> b!500094 m!481277))

(assert (=> b!500094 m!481249))

(assert (=> b!500098 m!481249))

(assert (=> b!500098 m!481249))

(declare-fun m!481279 () Bool)

(assert (=> b!500098 m!481279))

(declare-fun m!481281 () Bool)

(assert (=> start!45450 m!481281))

(declare-fun m!481283 () Bool)

(assert (=> start!45450 m!481283))

(declare-fun m!481285 () Bool)

(assert (=> b!500101 m!481285))

(assert (=> b!500101 m!481247))

(push 1)

