; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58322 () Bool)

(assert start!58322)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!643985 () Bool)

(declare-datatypes ((array!38430 0))(
  ( (array!38431 (arr!18428 (Array (_ BitVec 32) (_ BitVec 64))) (size!18793 (_ BitVec 32))) )
))
(declare-fun lt!298352 () array!38430)

(declare-fun e!368944 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38430)

(declare-fun arrayContainsKey!0 (array!38430 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!643985 (= e!368944 (arrayContainsKey!0 lt!298352 (select (arr!18428 a!2986) j!136) index!984))))

(declare-fun b!643986 () Bool)

(declare-fun e!368945 () Bool)

(assert (=> b!643986 (= e!368945 e!368944)))

(declare-fun res!417249 () Bool)

(assert (=> b!643986 (=> (not res!417249) (not e!368944))))

(assert (=> b!643986 (= res!417249 (arrayContainsKey!0 lt!298352 (select (arr!18428 a!2986) j!136) j!136))))

(declare-fun b!643987 () Bool)

(declare-datatypes ((Unit!21818 0))(
  ( (Unit!21819) )
))
(declare-fun e!368931 () Unit!21818)

(declare-fun Unit!21820 () Unit!21818)

(assert (=> b!643987 (= e!368931 Unit!21820)))

(declare-fun lt!298347 () Unit!21818)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38430 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21818)

(assert (=> b!643987 (= lt!298347 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298352 (select (arr!18428 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!643987 (arrayContainsKey!0 lt!298352 (select (arr!18428 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!298348 () Unit!21818)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((List!12508 0))(
  ( (Nil!12505) (Cons!12504 (h!13549 (_ BitVec 64)) (t!18727 List!12508)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38430 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12508) Unit!21818)

(assert (=> b!643987 (= lt!298348 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12505))))

(declare-fun arrayNoDuplicates!0 (array!38430 (_ BitVec 32) List!12508) Bool)

(assert (=> b!643987 (arrayNoDuplicates!0 lt!298352 #b00000000000000000000000000000000 Nil!12505)))

(declare-fun lt!298351 () Unit!21818)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38430 (_ BitVec 32) (_ BitVec 32)) Unit!21818)

(assert (=> b!643987 (= lt!298351 (lemmaNoDuplicateFromThenFromBigger!0 lt!298352 #b00000000000000000000000000000000 j!136))))

(assert (=> b!643987 (arrayNoDuplicates!0 lt!298352 j!136 Nil!12505)))

(declare-fun lt!298343 () Unit!21818)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38430 (_ BitVec 64) (_ BitVec 32) List!12508) Unit!21818)

(assert (=> b!643987 (= lt!298343 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298352 (select (arr!18428 a!2986) j!136) j!136 Nil!12505))))

(assert (=> b!643987 false))

(declare-fun b!643988 () Bool)

(declare-fun e!368934 () Bool)

(declare-datatypes ((SeekEntryResult!6865 0))(
  ( (MissingZero!6865 (index!29792 (_ BitVec 32))) (Found!6865 (index!29793 (_ BitVec 32))) (Intermediate!6865 (undefined!7677 Bool) (index!29794 (_ BitVec 32)) (x!58572 (_ BitVec 32))) (Undefined!6865) (MissingVacant!6865 (index!29795 (_ BitVec 32))) )
))
(declare-fun lt!298355 () SeekEntryResult!6865)

(declare-fun lt!298354 () SeekEntryResult!6865)

(assert (=> b!643988 (= e!368934 (= lt!298355 lt!298354))))

(declare-fun b!643989 () Bool)

(declare-fun e!368933 () Bool)

(declare-fun e!368943 () Bool)

(assert (=> b!643989 (= e!368933 e!368943)))

(declare-fun res!417251 () Bool)

(assert (=> b!643989 (=> res!417251 e!368943)))

(assert (=> b!643989 (= res!417251 (bvsge index!984 j!136))))

(declare-fun lt!298345 () Unit!21818)

(assert (=> b!643989 (= lt!298345 e!368931)))

(declare-fun c!73739 () Bool)

(assert (=> b!643989 (= c!73739 (bvslt j!136 index!984))))

(declare-fun b!643990 () Bool)

(declare-fun res!417258 () Bool)

(declare-fun e!368940 () Bool)

(assert (=> b!643990 (=> (not res!417258) (not e!368940))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38430 (_ BitVec 32)) Bool)

(assert (=> b!643990 (= res!417258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!643991 () Bool)

(declare-fun res!417247 () Bool)

(assert (=> b!643991 (=> (not res!417247) (not e!368940))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!643991 (= res!417247 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18428 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!643992 () Bool)

(declare-fun res!417242 () Bool)

(declare-fun e!368936 () Bool)

(assert (=> b!643992 (=> (not res!417242) (not e!368936))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!643992 (= res!417242 (validKeyInArray!0 k0!1786))))

(declare-fun b!643993 () Bool)

(declare-fun e!368935 () Bool)

(assert (=> b!643993 (= e!368935 (arrayContainsKey!0 lt!298352 (select (arr!18428 a!2986) j!136) index!984))))

(declare-fun b!643994 () Bool)

(declare-fun e!368938 () Unit!21818)

(declare-fun Unit!21821 () Unit!21818)

(assert (=> b!643994 (= e!368938 Unit!21821)))

(assert (=> b!643994 false))

(declare-fun b!643995 () Bool)

(declare-fun e!368937 () Bool)

(assert (=> b!643995 (= e!368940 e!368937)))

(declare-fun res!417248 () Bool)

(assert (=> b!643995 (=> (not res!417248) (not e!368937))))

(assert (=> b!643995 (= res!417248 (= (select (store (arr!18428 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643995 (= lt!298352 (array!38431 (store (arr!18428 a!2986) i!1108 k0!1786) (size!18793 a!2986)))))

(declare-fun b!643996 () Bool)

(declare-fun e!368942 () Bool)

(declare-fun e!368941 () Bool)

(assert (=> b!643996 (= e!368942 (not e!368941))))

(declare-fun res!417245 () Bool)

(assert (=> b!643996 (=> res!417245 e!368941)))

(declare-fun lt!298356 () SeekEntryResult!6865)

(assert (=> b!643996 (= res!417245 (not (= lt!298356 (Found!6865 index!984))))))

(declare-fun lt!298344 () Unit!21818)

(assert (=> b!643996 (= lt!298344 e!368938)))

(declare-fun c!73740 () Bool)

(assert (=> b!643996 (= c!73740 (= lt!298356 Undefined!6865))))

(declare-fun lt!298350 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38430 (_ BitVec 32)) SeekEntryResult!6865)

(assert (=> b!643996 (= lt!298356 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298350 lt!298352 mask!3053))))

(assert (=> b!643996 e!368934))

(declare-fun res!417252 () Bool)

(assert (=> b!643996 (=> (not res!417252) (not e!368934))))

(declare-fun lt!298346 () (_ BitVec 32))

(assert (=> b!643996 (= res!417252 (= lt!298354 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298346 vacantSpotIndex!68 lt!298350 lt!298352 mask!3053)))))

(assert (=> b!643996 (= lt!298354 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298346 vacantSpotIndex!68 (select (arr!18428 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!643996 (= lt!298350 (select (store (arr!18428 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!298342 () Unit!21818)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38430 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21818)

(assert (=> b!643996 (= lt!298342 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298346 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!643996 (= lt!298346 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!417241 () Bool)

(assert (=> start!58322 (=> (not res!417241) (not e!368936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58322 (= res!417241 (validMask!0 mask!3053))))

(assert (=> start!58322 e!368936))

(assert (=> start!58322 true))

(declare-fun array_inv!14311 (array!38430) Bool)

(assert (=> start!58322 (array_inv!14311 a!2986)))

(declare-fun b!643997 () Bool)

(assert (=> b!643997 (= e!368941 e!368933)))

(declare-fun res!417259 () Bool)

(assert (=> b!643997 (=> res!417259 e!368933)))

(declare-fun lt!298349 () (_ BitVec 64))

(assert (=> b!643997 (= res!417259 (or (not (= (select (arr!18428 a!2986) j!136) lt!298350)) (not (= (select (arr!18428 a!2986) j!136) lt!298349))))))

(declare-fun e!368932 () Bool)

(assert (=> b!643997 e!368932))

(declare-fun res!417244 () Bool)

(assert (=> b!643997 (=> (not res!417244) (not e!368932))))

(assert (=> b!643997 (= res!417244 (= lt!298349 (select (arr!18428 a!2986) j!136)))))

(assert (=> b!643997 (= lt!298349 (select (store (arr!18428 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!643998 () Bool)

(assert (=> b!643998 (= e!368932 e!368945)))

(declare-fun res!417256 () Bool)

(assert (=> b!643998 (=> res!417256 e!368945)))

(assert (=> b!643998 (= res!417256 (or (not (= (select (arr!18428 a!2986) j!136) lt!298350)) (not (= (select (arr!18428 a!2986) j!136) lt!298349)) (bvsge j!136 index!984)))))

(declare-fun b!643999 () Bool)

(declare-fun Unit!21822 () Unit!21818)

(assert (=> b!643999 (= e!368931 Unit!21822)))

(declare-fun b!644000 () Bool)

(declare-fun res!417254 () Bool)

(assert (=> b!644000 (=> (not res!417254) (not e!368936))))

(assert (=> b!644000 (= res!417254 (and (= (size!18793 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18793 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18793 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!644001 () Bool)

(declare-fun Unit!21823 () Unit!21818)

(assert (=> b!644001 (= e!368938 Unit!21823)))

(declare-fun b!644002 () Bool)

(declare-fun res!417243 () Bool)

(assert (=> b!644002 (=> (not res!417243) (not e!368936))))

(assert (=> b!644002 (= res!417243 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!644003 () Bool)

(assert (=> b!644003 (= e!368937 e!368942)))

(declare-fun res!417255 () Bool)

(assert (=> b!644003 (=> (not res!417255) (not e!368942))))

(assert (=> b!644003 (= res!417255 (and (= lt!298355 (Found!6865 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18428 a!2986) index!984) (select (arr!18428 a!2986) j!136))) (not (= (select (arr!18428 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!644003 (= lt!298355 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18428 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!644004 () Bool)

(assert (=> b!644004 (= e!368943 true)))

(assert (=> b!644004 e!368935))

(declare-fun res!417257 () Bool)

(assert (=> b!644004 (=> (not res!417257) (not e!368935))))

(assert (=> b!644004 (= res!417257 (arrayContainsKey!0 lt!298352 (select (arr!18428 a!2986) j!136) j!136))))

(declare-fun b!644005 () Bool)

(declare-fun res!417250 () Bool)

(assert (=> b!644005 (=> (not res!417250) (not e!368936))))

(assert (=> b!644005 (= res!417250 (validKeyInArray!0 (select (arr!18428 a!2986) j!136)))))

(declare-fun b!644006 () Bool)

(declare-fun res!417253 () Bool)

(assert (=> b!644006 (=> (not res!417253) (not e!368940))))

(assert (=> b!644006 (= res!417253 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12505))))

(declare-fun b!644007 () Bool)

(assert (=> b!644007 (= e!368936 e!368940)))

(declare-fun res!417246 () Bool)

(assert (=> b!644007 (=> (not res!417246) (not e!368940))))

(declare-fun lt!298353 () SeekEntryResult!6865)

(assert (=> b!644007 (= res!417246 (or (= lt!298353 (MissingZero!6865 i!1108)) (= lt!298353 (MissingVacant!6865 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38430 (_ BitVec 32)) SeekEntryResult!6865)

(assert (=> b!644007 (= lt!298353 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!58322 res!417241) b!644000))

(assert (= (and b!644000 res!417254) b!644005))

(assert (= (and b!644005 res!417250) b!643992))

(assert (= (and b!643992 res!417242) b!644002))

(assert (= (and b!644002 res!417243) b!644007))

(assert (= (and b!644007 res!417246) b!643990))

(assert (= (and b!643990 res!417258) b!644006))

(assert (= (and b!644006 res!417253) b!643991))

(assert (= (and b!643991 res!417247) b!643995))

(assert (= (and b!643995 res!417248) b!644003))

(assert (= (and b!644003 res!417255) b!643996))

(assert (= (and b!643996 res!417252) b!643988))

(assert (= (and b!643996 c!73740) b!643994))

(assert (= (and b!643996 (not c!73740)) b!644001))

(assert (= (and b!643996 (not res!417245)) b!643997))

(assert (= (and b!643997 res!417244) b!643998))

(assert (= (and b!643998 (not res!417256)) b!643986))

(assert (= (and b!643986 res!417249) b!643985))

(assert (= (and b!643997 (not res!417259)) b!643989))

(assert (= (and b!643989 c!73739) b!643987))

(assert (= (and b!643989 (not c!73739)) b!643999))

(assert (= (and b!643989 (not res!417251)) b!644004))

(assert (= (and b!644004 res!417257) b!643993))

(declare-fun m!617127 () Bool)

(assert (=> b!643996 m!617127))

(declare-fun m!617129 () Bool)

(assert (=> b!643996 m!617129))

(declare-fun m!617131 () Bool)

(assert (=> b!643996 m!617131))

(assert (=> b!643996 m!617129))

(declare-fun m!617133 () Bool)

(assert (=> b!643996 m!617133))

(declare-fun m!617135 () Bool)

(assert (=> b!643996 m!617135))

(declare-fun m!617137 () Bool)

(assert (=> b!643996 m!617137))

(declare-fun m!617139 () Bool)

(assert (=> b!643996 m!617139))

(declare-fun m!617141 () Bool)

(assert (=> b!643996 m!617141))

(assert (=> b!644004 m!617129))

(assert (=> b!644004 m!617129))

(declare-fun m!617143 () Bool)

(assert (=> b!644004 m!617143))

(declare-fun m!617145 () Bool)

(assert (=> start!58322 m!617145))

(declare-fun m!617147 () Bool)

(assert (=> start!58322 m!617147))

(assert (=> b!644005 m!617129))

(assert (=> b!644005 m!617129))

(declare-fun m!617149 () Bool)

(assert (=> b!644005 m!617149))

(declare-fun m!617151 () Bool)

(assert (=> b!643992 m!617151))

(declare-fun m!617153 () Bool)

(assert (=> b!644002 m!617153))

(assert (=> b!643993 m!617129))

(assert (=> b!643993 m!617129))

(declare-fun m!617155 () Bool)

(assert (=> b!643993 m!617155))

(declare-fun m!617157 () Bool)

(assert (=> b!644007 m!617157))

(declare-fun m!617159 () Bool)

(assert (=> b!643991 m!617159))

(declare-fun m!617161 () Bool)

(assert (=> b!643987 m!617161))

(assert (=> b!643987 m!617129))

(declare-fun m!617163 () Bool)

(assert (=> b!643987 m!617163))

(assert (=> b!643987 m!617129))

(declare-fun m!617165 () Bool)

(assert (=> b!643987 m!617165))

(declare-fun m!617167 () Bool)

(assert (=> b!643987 m!617167))

(declare-fun m!617169 () Bool)

(assert (=> b!643987 m!617169))

(assert (=> b!643987 m!617129))

(declare-fun m!617171 () Bool)

(assert (=> b!643987 m!617171))

(assert (=> b!643987 m!617129))

(declare-fun m!617173 () Bool)

(assert (=> b!643987 m!617173))

(assert (=> b!643986 m!617129))

(assert (=> b!643986 m!617129))

(assert (=> b!643986 m!617143))

(assert (=> b!643985 m!617129))

(assert (=> b!643985 m!617129))

(assert (=> b!643985 m!617155))

(assert (=> b!643997 m!617129))

(assert (=> b!643997 m!617131))

(declare-fun m!617175 () Bool)

(assert (=> b!643997 m!617175))

(assert (=> b!643995 m!617131))

(declare-fun m!617177 () Bool)

(assert (=> b!643995 m!617177))

(assert (=> b!643998 m!617129))

(declare-fun m!617179 () Bool)

(assert (=> b!644003 m!617179))

(assert (=> b!644003 m!617129))

(assert (=> b!644003 m!617129))

(declare-fun m!617181 () Bool)

(assert (=> b!644003 m!617181))

(declare-fun m!617183 () Bool)

(assert (=> b!643990 m!617183))

(declare-fun m!617185 () Bool)

(assert (=> b!644006 m!617185))

(check-sat (not b!643990) (not b!644003) (not b!644002) (not b!644006) (not b!643992) (not b!644005) (not b!643986) (not start!58322) (not b!644007) (not b!643993) (not b!643996) (not b!643987) (not b!643985) (not b!644004))
(check-sat)
