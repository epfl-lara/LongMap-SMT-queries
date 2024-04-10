; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55140 () Bool)

(assert start!55140)

(declare-fun b!604030 () Bool)

(declare-fun res!388029 () Bool)

(declare-fun e!345590 () Bool)

(assert (=> b!604030 (=> (not res!388029) (not e!345590))))

(declare-datatypes ((array!37213 0))(
  ( (array!37214 (arr!17863 (Array (_ BitVec 32) (_ BitVec 64))) (size!18227 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37213)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!604030 (= res!388029 (validKeyInArray!0 (select (arr!17863 a!2986) j!136)))))

(declare-fun b!604031 () Bool)

(declare-datatypes ((Unit!19198 0))(
  ( (Unit!19199) )
))
(declare-fun e!345596 () Unit!19198)

(declare-fun Unit!19200 () Unit!19198)

(assert (=> b!604031 (= e!345596 Unit!19200)))

(declare-fun b!604032 () Bool)

(declare-fun e!345595 () Bool)

(declare-fun e!345598 () Bool)

(assert (=> b!604032 (= e!345595 e!345598)))

(declare-fun res!388039 () Bool)

(assert (=> b!604032 (=> (not res!388039) (not e!345598))))

(declare-datatypes ((SeekEntryResult!6303 0))(
  ( (MissingZero!6303 (index!27475 (_ BitVec 32))) (Found!6303 (index!27476 (_ BitVec 32))) (Intermediate!6303 (undefined!7115 Bool) (index!27477 (_ BitVec 32)) (x!56272 (_ BitVec 32))) (Undefined!6303) (MissingVacant!6303 (index!27478 (_ BitVec 32))) )
))
(declare-fun lt!275392 () SeekEntryResult!6303)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!604032 (= res!388039 (and (= lt!275392 (Found!6303 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17863 a!2986) index!984) (select (arr!17863 a!2986) j!136))) (not (= (select (arr!17863 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37213 (_ BitVec 32)) SeekEntryResult!6303)

(assert (=> b!604032 (= lt!275392 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17863 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!604033 () Bool)

(declare-fun e!345597 () Bool)

(assert (=> b!604033 (= e!345597 true)))

(declare-fun e!345589 () Bool)

(assert (=> b!604033 e!345589))

(declare-fun res!388031 () Bool)

(assert (=> b!604033 (=> (not res!388031) (not e!345589))))

(declare-fun lt!275380 () array!37213)

(declare-fun arrayContainsKey!0 (array!37213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!604033 (= res!388031 (arrayContainsKey!0 lt!275380 (select (arr!17863 a!2986) j!136) j!136))))

(declare-fun b!604034 () Bool)

(declare-fun res!388027 () Bool)

(declare-fun e!345588 () Bool)

(assert (=> b!604034 (=> (not res!388027) (not e!345588))))

(assert (=> b!604034 (= res!388027 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17863 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!604035 () Bool)

(assert (=> b!604035 (= e!345590 e!345588)))

(declare-fun res!388037 () Bool)

(assert (=> b!604035 (=> (not res!388037) (not e!345588))))

(declare-fun lt!275385 () SeekEntryResult!6303)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!604035 (= res!388037 (or (= lt!275385 (MissingZero!6303 i!1108)) (= lt!275385 (MissingVacant!6303 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37213 (_ BitVec 32)) SeekEntryResult!6303)

(assert (=> b!604035 (= lt!275385 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!604037 () Bool)

(declare-fun e!345591 () Bool)

(assert (=> b!604037 (= e!345591 e!345597)))

(declare-fun res!388036 () Bool)

(assert (=> b!604037 (=> res!388036 e!345597)))

(assert (=> b!604037 (= res!388036 (bvsge index!984 j!136))))

(declare-fun lt!275381 () Unit!19198)

(declare-fun e!345600 () Unit!19198)

(assert (=> b!604037 (= lt!275381 e!345600)))

(declare-fun c!68371 () Bool)

(assert (=> b!604037 (= c!68371 (bvslt j!136 index!984))))

(declare-fun b!604038 () Bool)

(declare-fun e!345593 () Bool)

(assert (=> b!604038 (= e!345593 e!345591)))

(declare-fun res!388025 () Bool)

(assert (=> b!604038 (=> res!388025 e!345591)))

(declare-fun lt!275382 () (_ BitVec 64))

(declare-fun lt!275378 () (_ BitVec 64))

(assert (=> b!604038 (= res!388025 (or (not (= (select (arr!17863 a!2986) j!136) lt!275382)) (not (= (select (arr!17863 a!2986) j!136) lt!275378))))))

(declare-fun e!345586 () Bool)

(assert (=> b!604038 e!345586))

(declare-fun res!388028 () Bool)

(assert (=> b!604038 (=> (not res!388028) (not e!345586))))

(assert (=> b!604038 (= res!388028 (= lt!275378 (select (arr!17863 a!2986) j!136)))))

(assert (=> b!604038 (= lt!275378 (select (store (arr!17863 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!604039 () Bool)

(declare-fun e!345594 () Bool)

(assert (=> b!604039 (= e!345586 e!345594)))

(declare-fun res!388033 () Bool)

(assert (=> b!604039 (=> res!388033 e!345594)))

(assert (=> b!604039 (= res!388033 (or (not (= (select (arr!17863 a!2986) j!136) lt!275382)) (not (= (select (arr!17863 a!2986) j!136) lt!275378)) (bvsge j!136 index!984)))))

(declare-fun b!604040 () Bool)

(assert (=> b!604040 (= e!345598 (not e!345593))))

(declare-fun res!388023 () Bool)

(assert (=> b!604040 (=> res!388023 e!345593)))

(declare-fun lt!275389 () SeekEntryResult!6303)

(assert (=> b!604040 (= res!388023 (not (= lt!275389 (Found!6303 index!984))))))

(declare-fun lt!275391 () Unit!19198)

(assert (=> b!604040 (= lt!275391 e!345596)))

(declare-fun c!68372 () Bool)

(assert (=> b!604040 (= c!68372 (= lt!275389 Undefined!6303))))

(assert (=> b!604040 (= lt!275389 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275382 lt!275380 mask!3053))))

(declare-fun e!345592 () Bool)

(assert (=> b!604040 e!345592))

(declare-fun res!388035 () Bool)

(assert (=> b!604040 (=> (not res!388035) (not e!345592))))

(declare-fun lt!275383 () (_ BitVec 32))

(declare-fun lt!275384 () SeekEntryResult!6303)

(assert (=> b!604040 (= res!388035 (= lt!275384 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275383 vacantSpotIndex!68 lt!275382 lt!275380 mask!3053)))))

(assert (=> b!604040 (= lt!275384 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275383 vacantSpotIndex!68 (select (arr!17863 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!604040 (= lt!275382 (select (store (arr!17863 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!275388 () Unit!19198)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37213 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19198)

(assert (=> b!604040 (= lt!275388 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275383 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!604040 (= lt!275383 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!604041 () Bool)

(declare-fun Unit!19201 () Unit!19198)

(assert (=> b!604041 (= e!345600 Unit!19201)))

(declare-fun lt!275390 () Unit!19198)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37213 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19198)

(assert (=> b!604041 (= lt!275390 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275380 (select (arr!17863 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!604041 (arrayContainsKey!0 lt!275380 (select (arr!17863 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275386 () Unit!19198)

(declare-datatypes ((List!11904 0))(
  ( (Nil!11901) (Cons!11900 (h!12945 (_ BitVec 64)) (t!18132 List!11904)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37213 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11904) Unit!19198)

(assert (=> b!604041 (= lt!275386 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11901))))

(declare-fun arrayNoDuplicates!0 (array!37213 (_ BitVec 32) List!11904) Bool)

(assert (=> b!604041 (arrayNoDuplicates!0 lt!275380 #b00000000000000000000000000000000 Nil!11901)))

(declare-fun lt!275387 () Unit!19198)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37213 (_ BitVec 32) (_ BitVec 32)) Unit!19198)

(assert (=> b!604041 (= lt!275387 (lemmaNoDuplicateFromThenFromBigger!0 lt!275380 #b00000000000000000000000000000000 j!136))))

(assert (=> b!604041 (arrayNoDuplicates!0 lt!275380 j!136 Nil!11901)))

(declare-fun lt!275379 () Unit!19198)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37213 (_ BitVec 64) (_ BitVec 32) List!11904) Unit!19198)

(assert (=> b!604041 (= lt!275379 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275380 (select (arr!17863 a!2986) j!136) j!136 Nil!11901))))

(assert (=> b!604041 false))

(declare-fun b!604042 () Bool)

(declare-fun res!388032 () Bool)

(assert (=> b!604042 (=> (not res!388032) (not e!345588))))

(assert (=> b!604042 (= res!388032 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11901))))

(declare-fun b!604043 () Bool)

(declare-fun res!388030 () Bool)

(assert (=> b!604043 (=> (not res!388030) (not e!345590))))

(assert (=> b!604043 (= res!388030 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!604044 () Bool)

(declare-fun res!388024 () Bool)

(assert (=> b!604044 (=> (not res!388024) (not e!345588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37213 (_ BitVec 32)) Bool)

(assert (=> b!604044 (= res!388024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!604045 () Bool)

(declare-fun res!388026 () Bool)

(assert (=> b!604045 (=> (not res!388026) (not e!345590))))

(assert (=> b!604045 (= res!388026 (and (= (size!18227 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18227 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18227 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!604046 () Bool)

(declare-fun e!345587 () Bool)

(assert (=> b!604046 (= e!345587 (arrayContainsKey!0 lt!275380 (select (arr!17863 a!2986) j!136) index!984))))

(declare-fun b!604047 () Bool)

(assert (=> b!604047 (= e!345594 e!345587)))

(declare-fun res!388022 () Bool)

(assert (=> b!604047 (=> (not res!388022) (not e!345587))))

(assert (=> b!604047 (= res!388022 (arrayContainsKey!0 lt!275380 (select (arr!17863 a!2986) j!136) j!136))))

(declare-fun b!604048 () Bool)

(declare-fun Unit!19202 () Unit!19198)

(assert (=> b!604048 (= e!345600 Unit!19202)))

(declare-fun res!388034 () Bool)

(assert (=> start!55140 (=> (not res!388034) (not e!345590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55140 (= res!388034 (validMask!0 mask!3053))))

(assert (=> start!55140 e!345590))

(assert (=> start!55140 true))

(declare-fun array_inv!13659 (array!37213) Bool)

(assert (=> start!55140 (array_inv!13659 a!2986)))

(declare-fun b!604036 () Bool)

(assert (=> b!604036 (= e!345592 (= lt!275392 lt!275384))))

(declare-fun b!604049 () Bool)

(assert (=> b!604049 (= e!345588 e!345595)))

(declare-fun res!388040 () Bool)

(assert (=> b!604049 (=> (not res!388040) (not e!345595))))

(assert (=> b!604049 (= res!388040 (= (select (store (arr!17863 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!604049 (= lt!275380 (array!37214 (store (arr!17863 a!2986) i!1108 k0!1786) (size!18227 a!2986)))))

(declare-fun b!604050 () Bool)

(assert (=> b!604050 (= e!345589 (arrayContainsKey!0 lt!275380 (select (arr!17863 a!2986) j!136) index!984))))

(declare-fun b!604051 () Bool)

(declare-fun Unit!19203 () Unit!19198)

(assert (=> b!604051 (= e!345596 Unit!19203)))

(assert (=> b!604051 false))

(declare-fun b!604052 () Bool)

(declare-fun res!388038 () Bool)

(assert (=> b!604052 (=> (not res!388038) (not e!345590))))

(assert (=> b!604052 (= res!388038 (validKeyInArray!0 k0!1786))))

(assert (= (and start!55140 res!388034) b!604045))

(assert (= (and b!604045 res!388026) b!604030))

(assert (= (and b!604030 res!388029) b!604052))

(assert (= (and b!604052 res!388038) b!604043))

(assert (= (and b!604043 res!388030) b!604035))

(assert (= (and b!604035 res!388037) b!604044))

(assert (= (and b!604044 res!388024) b!604042))

(assert (= (and b!604042 res!388032) b!604034))

(assert (= (and b!604034 res!388027) b!604049))

(assert (= (and b!604049 res!388040) b!604032))

(assert (= (and b!604032 res!388039) b!604040))

(assert (= (and b!604040 res!388035) b!604036))

(assert (= (and b!604040 c!68372) b!604051))

(assert (= (and b!604040 (not c!68372)) b!604031))

(assert (= (and b!604040 (not res!388023)) b!604038))

(assert (= (and b!604038 res!388028) b!604039))

(assert (= (and b!604039 (not res!388033)) b!604047))

(assert (= (and b!604047 res!388022) b!604046))

(assert (= (and b!604038 (not res!388025)) b!604037))

(assert (= (and b!604037 c!68371) b!604041))

(assert (= (and b!604037 (not c!68371)) b!604048))

(assert (= (and b!604037 (not res!388036)) b!604033))

(assert (= (and b!604033 res!388031) b!604050))

(declare-fun m!580973 () Bool)

(assert (=> b!604046 m!580973))

(assert (=> b!604046 m!580973))

(declare-fun m!580975 () Bool)

(assert (=> b!604046 m!580975))

(declare-fun m!580977 () Bool)

(assert (=> b!604043 m!580977))

(declare-fun m!580979 () Bool)

(assert (=> b!604049 m!580979))

(declare-fun m!580981 () Bool)

(assert (=> b!604049 m!580981))

(declare-fun m!580983 () Bool)

(assert (=> b!604035 m!580983))

(assert (=> b!604038 m!580973))

(assert (=> b!604038 m!580979))

(declare-fun m!580985 () Bool)

(assert (=> b!604038 m!580985))

(assert (=> b!604041 m!580973))

(declare-fun m!580987 () Bool)

(assert (=> b!604041 m!580987))

(assert (=> b!604041 m!580973))

(declare-fun m!580989 () Bool)

(assert (=> b!604041 m!580989))

(assert (=> b!604041 m!580973))

(declare-fun m!580991 () Bool)

(assert (=> b!604041 m!580991))

(assert (=> b!604041 m!580973))

(declare-fun m!580993 () Bool)

(assert (=> b!604041 m!580993))

(declare-fun m!580995 () Bool)

(assert (=> b!604041 m!580995))

(declare-fun m!580997 () Bool)

(assert (=> b!604041 m!580997))

(declare-fun m!580999 () Bool)

(assert (=> b!604041 m!580999))

(assert (=> b!604030 m!580973))

(assert (=> b!604030 m!580973))

(declare-fun m!581001 () Bool)

(assert (=> b!604030 m!581001))

(declare-fun m!581003 () Bool)

(assert (=> b!604032 m!581003))

(assert (=> b!604032 m!580973))

(assert (=> b!604032 m!580973))

(declare-fun m!581005 () Bool)

(assert (=> b!604032 m!581005))

(assert (=> b!604047 m!580973))

(assert (=> b!604047 m!580973))

(declare-fun m!581007 () Bool)

(assert (=> b!604047 m!581007))

(declare-fun m!581009 () Bool)

(assert (=> start!55140 m!581009))

(declare-fun m!581011 () Bool)

(assert (=> start!55140 m!581011))

(assert (=> b!604033 m!580973))

(assert (=> b!604033 m!580973))

(assert (=> b!604033 m!581007))

(declare-fun m!581013 () Bool)

(assert (=> b!604052 m!581013))

(declare-fun m!581015 () Bool)

(assert (=> b!604034 m!581015))

(declare-fun m!581017 () Bool)

(assert (=> b!604044 m!581017))

(assert (=> b!604050 m!580973))

(assert (=> b!604050 m!580973))

(assert (=> b!604050 m!580975))

(assert (=> b!604039 m!580973))

(declare-fun m!581019 () Bool)

(assert (=> b!604040 m!581019))

(declare-fun m!581021 () Bool)

(assert (=> b!604040 m!581021))

(assert (=> b!604040 m!580973))

(declare-fun m!581023 () Bool)

(assert (=> b!604040 m!581023))

(assert (=> b!604040 m!580979))

(assert (=> b!604040 m!580973))

(declare-fun m!581025 () Bool)

(assert (=> b!604040 m!581025))

(declare-fun m!581027 () Bool)

(assert (=> b!604040 m!581027))

(declare-fun m!581029 () Bool)

(assert (=> b!604040 m!581029))

(declare-fun m!581031 () Bool)

(assert (=> b!604042 m!581031))

(check-sat (not b!604035) (not b!604032) (not b!604047) (not b!604044) (not b!604042) (not b!604046) (not b!604040) (not b!604030) (not b!604050) (not b!604052) (not b!604041) (not b!604033) (not b!604043) (not start!55140))
(check-sat)
