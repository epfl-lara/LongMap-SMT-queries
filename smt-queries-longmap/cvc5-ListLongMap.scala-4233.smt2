; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58334 () Bool)

(assert start!58334)

(declare-fun b!644281 () Bool)

(declare-fun e!369127 () Bool)

(declare-fun e!369121 () Bool)

(assert (=> b!644281 (= e!369127 e!369121)))

(declare-fun res!417392 () Bool)

(assert (=> b!644281 (=> (not res!417392) (not e!369121))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!38431 0))(
  ( (array!38432 (arr!18429 (Array (_ BitVec 32) (_ BitVec 64))) (size!18793 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38431)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!644281 (= res!417392 (= (select (store (arr!18429 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!298598 () array!38431)

(assert (=> b!644281 (= lt!298598 (array!38432 (store (arr!18429 a!2986) i!1108 k!1786) (size!18793 a!2986)))))

(declare-fun b!644282 () Bool)

(declare-fun e!369132 () Bool)

(declare-fun e!369133 () Bool)

(assert (=> b!644282 (= e!369132 e!369133)))

(declare-fun res!417378 () Bool)

(assert (=> b!644282 (=> res!417378 e!369133)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!298607 () (_ BitVec 64))

(declare-fun lt!298611 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!644282 (= res!417378 (or (not (= (select (arr!18429 a!2986) j!136) lt!298607)) (not (= (select (arr!18429 a!2986) j!136) lt!298611)) (bvsge j!136 index!984)))))

(declare-fun b!644283 () Bool)

(declare-datatypes ((Unit!21840 0))(
  ( (Unit!21841) )
))
(declare-fun e!369129 () Unit!21840)

(declare-fun Unit!21842 () Unit!21840)

(assert (=> b!644283 (= e!369129 Unit!21842)))

(declare-fun b!644284 () Bool)

(declare-fun res!417385 () Bool)

(assert (=> b!644284 (=> (not res!417385) (not e!369127))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38431 (_ BitVec 32)) Bool)

(assert (=> b!644284 (= res!417385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!644285 () Bool)

(declare-fun e!369123 () Bool)

(assert (=> b!644285 (= e!369133 e!369123)))

(declare-fun res!417386 () Bool)

(assert (=> b!644285 (=> (not res!417386) (not e!369123))))

(declare-fun arrayContainsKey!0 (array!38431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!644285 (= res!417386 (arrayContainsKey!0 lt!298598 (select (arr!18429 a!2986) j!136) j!136))))

(declare-fun b!644286 () Bool)

(declare-fun e!369125 () Bool)

(assert (=> b!644286 (= e!369125 e!369127)))

(declare-fun res!417391 () Bool)

(assert (=> b!644286 (=> (not res!417391) (not e!369127))))

(declare-datatypes ((SeekEntryResult!6869 0))(
  ( (MissingZero!6869 (index!29808 (_ BitVec 32))) (Found!6869 (index!29809 (_ BitVec 32))) (Intermediate!6869 (undefined!7681 Bool) (index!29810 (_ BitVec 32)) (x!58581 (_ BitVec 32))) (Undefined!6869) (MissingVacant!6869 (index!29811 (_ BitVec 32))) )
))
(declare-fun lt!298604 () SeekEntryResult!6869)

(assert (=> b!644286 (= res!417391 (or (= lt!298604 (MissingZero!6869 i!1108)) (= lt!298604 (MissingVacant!6869 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38431 (_ BitVec 32)) SeekEntryResult!6869)

(assert (=> b!644286 (= lt!298604 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!644288 () Bool)

(declare-fun e!369128 () Bool)

(declare-fun e!369124 () Bool)

(assert (=> b!644288 (= e!369128 e!369124)))

(declare-fun res!417394 () Bool)

(assert (=> b!644288 (=> res!417394 e!369124)))

(assert (=> b!644288 (= res!417394 (bvsge index!984 j!136))))

(declare-fun lt!298603 () Unit!21840)

(assert (=> b!644288 (= lt!298603 e!369129)))

(declare-fun c!73820 () Bool)

(assert (=> b!644288 (= c!73820 (bvslt j!136 index!984))))

(declare-fun b!644289 () Bool)

(declare-fun res!417380 () Bool)

(assert (=> b!644289 (=> (not res!417380) (not e!369125))))

(assert (=> b!644289 (= res!417380 (and (= (size!18793 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18793 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18793 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!644290 () Bool)

(declare-fun e!369122 () Bool)

(assert (=> b!644290 (= e!369122 e!369128)))

(declare-fun res!417384 () Bool)

(assert (=> b!644290 (=> res!417384 e!369128)))

(assert (=> b!644290 (= res!417384 (or (not (= (select (arr!18429 a!2986) j!136) lt!298607)) (not (= (select (arr!18429 a!2986) j!136) lt!298611))))))

(assert (=> b!644290 e!369132))

(declare-fun res!417381 () Bool)

(assert (=> b!644290 (=> (not res!417381) (not e!369132))))

(assert (=> b!644290 (= res!417381 (= lt!298611 (select (arr!18429 a!2986) j!136)))))

(assert (=> b!644290 (= lt!298611 (select (store (arr!18429 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!644291 () Bool)

(declare-fun res!417393 () Bool)

(assert (=> b!644291 (=> (not res!417393) (not e!369125))))

(assert (=> b!644291 (= res!417393 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!644292 () Bool)

(declare-fun e!369130 () Bool)

(declare-fun lt!298599 () SeekEntryResult!6869)

(declare-fun lt!298610 () SeekEntryResult!6869)

(assert (=> b!644292 (= e!369130 (= lt!298599 lt!298610))))

(declare-fun b!644293 () Bool)

(declare-fun res!417387 () Bool)

(assert (=> b!644293 (=> (not res!417387) (not e!369127))))

(declare-datatypes ((List!12470 0))(
  ( (Nil!12467) (Cons!12466 (h!13511 (_ BitVec 64)) (t!18698 List!12470)) )
))
(declare-fun arrayNoDuplicates!0 (array!38431 (_ BitVec 32) List!12470) Bool)

(assert (=> b!644293 (= res!417387 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12467))))

(declare-fun b!644294 () Bool)

(declare-fun res!417383 () Bool)

(assert (=> b!644294 (=> (not res!417383) (not e!369125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!644294 (= res!417383 (validKeyInArray!0 k!1786))))

(declare-fun b!644295 () Bool)

(assert (=> b!644295 (= e!369124 true)))

(declare-fun e!369135 () Bool)

(assert (=> b!644295 e!369135))

(declare-fun res!417379 () Bool)

(assert (=> b!644295 (=> (not res!417379) (not e!369135))))

(assert (=> b!644295 (= res!417379 (arrayContainsKey!0 lt!298598 (select (arr!18429 a!2986) j!136) j!136))))

(declare-fun b!644287 () Bool)

(declare-fun res!417377 () Bool)

(assert (=> b!644287 (=> (not res!417377) (not e!369127))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!644287 (= res!417377 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18429 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!417390 () Bool)

(assert (=> start!58334 (=> (not res!417390) (not e!369125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58334 (= res!417390 (validMask!0 mask!3053))))

(assert (=> start!58334 e!369125))

(assert (=> start!58334 true))

(declare-fun array_inv!14225 (array!38431) Bool)

(assert (=> start!58334 (array_inv!14225 a!2986)))

(declare-fun b!644296 () Bool)

(declare-fun res!417389 () Bool)

(assert (=> b!644296 (=> (not res!417389) (not e!369125))))

(assert (=> b!644296 (= res!417389 (validKeyInArray!0 (select (arr!18429 a!2986) j!136)))))

(declare-fun b!644297 () Bool)

(declare-fun e!369131 () Unit!21840)

(declare-fun Unit!21843 () Unit!21840)

(assert (=> b!644297 (= e!369131 Unit!21843)))

(declare-fun b!644298 () Bool)

(declare-fun e!369134 () Bool)

(assert (=> b!644298 (= e!369121 e!369134)))

(declare-fun res!417395 () Bool)

(assert (=> b!644298 (=> (not res!417395) (not e!369134))))

(assert (=> b!644298 (= res!417395 (and (= lt!298599 (Found!6869 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18429 a!2986) index!984) (select (arr!18429 a!2986) j!136))) (not (= (select (arr!18429 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38431 (_ BitVec 32)) SeekEntryResult!6869)

(assert (=> b!644298 (= lt!298599 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18429 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!644299 () Bool)

(assert (=> b!644299 (= e!369134 (not e!369122))))

(declare-fun res!417382 () Bool)

(assert (=> b!644299 (=> res!417382 e!369122)))

(declare-fun lt!298601 () SeekEntryResult!6869)

(assert (=> b!644299 (= res!417382 (not (= lt!298601 (Found!6869 index!984))))))

(declare-fun lt!298605 () Unit!21840)

(assert (=> b!644299 (= lt!298605 e!369131)))

(declare-fun c!73819 () Bool)

(assert (=> b!644299 (= c!73819 (= lt!298601 Undefined!6869))))

(assert (=> b!644299 (= lt!298601 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298607 lt!298598 mask!3053))))

(assert (=> b!644299 e!369130))

(declare-fun res!417388 () Bool)

(assert (=> b!644299 (=> (not res!417388) (not e!369130))))

(declare-fun lt!298602 () (_ BitVec 32))

(assert (=> b!644299 (= res!417388 (= lt!298610 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298602 vacantSpotIndex!68 lt!298607 lt!298598 mask!3053)))))

(assert (=> b!644299 (= lt!298610 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298602 vacantSpotIndex!68 (select (arr!18429 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!644299 (= lt!298607 (select (store (arr!18429 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!298612 () Unit!21840)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38431 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21840)

(assert (=> b!644299 (= lt!298612 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298602 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!644299 (= lt!298602 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!644300 () Bool)

(assert (=> b!644300 (= e!369123 (arrayContainsKey!0 lt!298598 (select (arr!18429 a!2986) j!136) index!984))))

(declare-fun b!644301 () Bool)

(declare-fun Unit!21844 () Unit!21840)

(assert (=> b!644301 (= e!369131 Unit!21844)))

(assert (=> b!644301 false))

(declare-fun b!644302 () Bool)

(declare-fun Unit!21845 () Unit!21840)

(assert (=> b!644302 (= e!369129 Unit!21845)))

(declare-fun lt!298606 () Unit!21840)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38431 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21840)

(assert (=> b!644302 (= lt!298606 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298598 (select (arr!18429 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!644302 (arrayContainsKey!0 lt!298598 (select (arr!18429 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298600 () Unit!21840)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38431 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12470) Unit!21840)

(assert (=> b!644302 (= lt!298600 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12467))))

(assert (=> b!644302 (arrayNoDuplicates!0 lt!298598 #b00000000000000000000000000000000 Nil!12467)))

(declare-fun lt!298608 () Unit!21840)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38431 (_ BitVec 32) (_ BitVec 32)) Unit!21840)

(assert (=> b!644302 (= lt!298608 (lemmaNoDuplicateFromThenFromBigger!0 lt!298598 #b00000000000000000000000000000000 j!136))))

(assert (=> b!644302 (arrayNoDuplicates!0 lt!298598 j!136 Nil!12467)))

(declare-fun lt!298609 () Unit!21840)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38431 (_ BitVec 64) (_ BitVec 32) List!12470) Unit!21840)

(assert (=> b!644302 (= lt!298609 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298598 (select (arr!18429 a!2986) j!136) j!136 Nil!12467))))

(assert (=> b!644302 false))

(declare-fun b!644303 () Bool)

(assert (=> b!644303 (= e!369135 (arrayContainsKey!0 lt!298598 (select (arr!18429 a!2986) j!136) index!984))))

(assert (= (and start!58334 res!417390) b!644289))

(assert (= (and b!644289 res!417380) b!644296))

(assert (= (and b!644296 res!417389) b!644294))

(assert (= (and b!644294 res!417383) b!644291))

(assert (= (and b!644291 res!417393) b!644286))

(assert (= (and b!644286 res!417391) b!644284))

(assert (= (and b!644284 res!417385) b!644293))

(assert (= (and b!644293 res!417387) b!644287))

(assert (= (and b!644287 res!417377) b!644281))

(assert (= (and b!644281 res!417392) b!644298))

(assert (= (and b!644298 res!417395) b!644299))

(assert (= (and b!644299 res!417388) b!644292))

(assert (= (and b!644299 c!73819) b!644301))

(assert (= (and b!644299 (not c!73819)) b!644297))

(assert (= (and b!644299 (not res!417382)) b!644290))

(assert (= (and b!644290 res!417381) b!644282))

(assert (= (and b!644282 (not res!417378)) b!644285))

(assert (= (and b!644285 res!417386) b!644300))

(assert (= (and b!644290 (not res!417384)) b!644288))

(assert (= (and b!644288 c!73820) b!644302))

(assert (= (and b!644288 (not c!73820)) b!644283))

(assert (= (and b!644288 (not res!417394)) b!644295))

(assert (= (and b!644295 res!417379) b!644303))

(declare-fun m!617909 () Bool)

(assert (=> b!644286 m!617909))

(declare-fun m!617911 () Bool)

(assert (=> b!644284 m!617911))

(declare-fun m!617913 () Bool)

(assert (=> b!644285 m!617913))

(assert (=> b!644285 m!617913))

(declare-fun m!617915 () Bool)

(assert (=> b!644285 m!617915))

(assert (=> b!644302 m!617913))

(declare-fun m!617917 () Bool)

(assert (=> b!644302 m!617917))

(assert (=> b!644302 m!617913))

(declare-fun m!617919 () Bool)

(assert (=> b!644302 m!617919))

(declare-fun m!617921 () Bool)

(assert (=> b!644302 m!617921))

(declare-fun m!617923 () Bool)

(assert (=> b!644302 m!617923))

(assert (=> b!644302 m!617913))

(declare-fun m!617925 () Bool)

(assert (=> b!644302 m!617925))

(assert (=> b!644302 m!617913))

(declare-fun m!617927 () Bool)

(assert (=> b!644302 m!617927))

(declare-fun m!617929 () Bool)

(assert (=> b!644302 m!617929))

(declare-fun m!617931 () Bool)

(assert (=> b!644299 m!617931))

(declare-fun m!617933 () Bool)

(assert (=> b!644299 m!617933))

(assert (=> b!644299 m!617913))

(declare-fun m!617935 () Bool)

(assert (=> b!644299 m!617935))

(declare-fun m!617937 () Bool)

(assert (=> b!644299 m!617937))

(declare-fun m!617939 () Bool)

(assert (=> b!644299 m!617939))

(assert (=> b!644299 m!617913))

(declare-fun m!617941 () Bool)

(assert (=> b!644299 m!617941))

(declare-fun m!617943 () Bool)

(assert (=> b!644299 m!617943))

(assert (=> b!644300 m!617913))

(assert (=> b!644300 m!617913))

(declare-fun m!617945 () Bool)

(assert (=> b!644300 m!617945))

(assert (=> b!644290 m!617913))

(assert (=> b!644290 m!617935))

(declare-fun m!617947 () Bool)

(assert (=> b!644290 m!617947))

(declare-fun m!617949 () Bool)

(assert (=> b!644287 m!617949))

(assert (=> b!644281 m!617935))

(declare-fun m!617951 () Bool)

(assert (=> b!644281 m!617951))

(declare-fun m!617953 () Bool)

(assert (=> b!644293 m!617953))

(assert (=> b!644296 m!617913))

(assert (=> b!644296 m!617913))

(declare-fun m!617955 () Bool)

(assert (=> b!644296 m!617955))

(declare-fun m!617957 () Bool)

(assert (=> start!58334 m!617957))

(declare-fun m!617959 () Bool)

(assert (=> start!58334 m!617959))

(declare-fun m!617961 () Bool)

(assert (=> b!644291 m!617961))

(assert (=> b!644303 m!617913))

(assert (=> b!644303 m!617913))

(assert (=> b!644303 m!617945))

(assert (=> b!644282 m!617913))

(assert (=> b!644295 m!617913))

(assert (=> b!644295 m!617913))

(assert (=> b!644295 m!617915))

(declare-fun m!617963 () Bool)

(assert (=> b!644298 m!617963))

(assert (=> b!644298 m!617913))

(assert (=> b!644298 m!617913))

(declare-fun m!617965 () Bool)

(assert (=> b!644298 m!617965))

(declare-fun m!617967 () Bool)

(assert (=> b!644294 m!617967))

(push 1)

