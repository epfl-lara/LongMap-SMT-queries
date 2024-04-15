; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57102 () Bool)

(assert start!57102)

(declare-fun b!632171 () Bool)

(declare-fun e!361399 () Bool)

(declare-fun e!361403 () Bool)

(assert (=> b!632171 (= e!361399 e!361403)))

(declare-fun res!408917 () Bool)

(assert (=> b!632171 (=> (not res!408917) (not e!361403))))

(declare-datatypes ((SeekEntryResult!6736 0))(
  ( (MissingZero!6736 (index!29237 (_ BitVec 32))) (Found!6736 (index!29238 (_ BitVec 32))) (Intermediate!6736 (undefined!7548 Bool) (index!29239 (_ BitVec 32)) (x!57982 (_ BitVec 32))) (Undefined!6736) (MissingVacant!6736 (index!29240 (_ BitVec 32))) )
))
(declare-fun lt!292063 () SeekEntryResult!6736)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!632171 (= res!408917 (or (= lt!292063 (MissingZero!6736 i!1108)) (= lt!292063 (MissingVacant!6736 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!38133 0))(
  ( (array!38134 (arr!18299 (Array (_ BitVec 32) (_ BitVec 64))) (size!18664 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38133)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38133 (_ BitVec 32)) SeekEntryResult!6736)

(assert (=> b!632171 (= lt!292063 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!632172 () Bool)

(declare-fun e!361404 () Bool)

(declare-fun lt!292058 () SeekEntryResult!6736)

(declare-fun lt!292061 () SeekEntryResult!6736)

(assert (=> b!632172 (= e!361404 (= lt!292058 lt!292061))))

(declare-fun b!632173 () Bool)

(declare-fun e!361397 () Bool)

(declare-fun e!361400 () Bool)

(assert (=> b!632173 (= e!361397 (not e!361400))))

(declare-fun res!408912 () Bool)

(assert (=> b!632173 (=> res!408912 e!361400)))

(declare-fun lt!292062 () SeekEntryResult!6736)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!632173 (= res!408912 (not (= lt!292062 (Found!6736 index!984))))))

(declare-datatypes ((Unit!21272 0))(
  ( (Unit!21273) )
))
(declare-fun lt!292059 () Unit!21272)

(declare-fun e!361398 () Unit!21272)

(assert (=> b!632173 (= lt!292059 e!361398)))

(declare-fun c!71997 () Bool)

(assert (=> b!632173 (= c!71997 (= lt!292062 Undefined!6736))))

(declare-fun lt!292065 () array!38133)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!292064 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38133 (_ BitVec 32)) SeekEntryResult!6736)

(assert (=> b!632173 (= lt!292062 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292064 lt!292065 mask!3053))))

(assert (=> b!632173 e!361404))

(declare-fun res!408920 () Bool)

(assert (=> b!632173 (=> (not res!408920) (not e!361404))))

(declare-fun lt!292060 () (_ BitVec 32))

(assert (=> b!632173 (= res!408920 (= lt!292061 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292060 vacantSpotIndex!68 lt!292064 lt!292065 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!632173 (= lt!292061 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292060 vacantSpotIndex!68 (select (arr!18299 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!632173 (= lt!292064 (select (store (arr!18299 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!292066 () Unit!21272)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38133 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21272)

(assert (=> b!632173 (= lt!292066 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292060 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!632173 (= lt!292060 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!632174 () Bool)

(declare-fun res!408922 () Bool)

(assert (=> b!632174 (=> (not res!408922) (not e!361399))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!632174 (= res!408922 (validKeyInArray!0 (select (arr!18299 a!2986) j!136)))))

(declare-fun b!632175 () Bool)

(declare-fun res!408913 () Bool)

(assert (=> b!632175 (=> (not res!408913) (not e!361399))))

(declare-fun arrayContainsKey!0 (array!38133 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!632175 (= res!408913 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!408919 () Bool)

(assert (=> start!57102 (=> (not res!408919) (not e!361399))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57102 (= res!408919 (validMask!0 mask!3053))))

(assert (=> start!57102 e!361399))

(assert (=> start!57102 true))

(declare-fun array_inv!14182 (array!38133) Bool)

(assert (=> start!57102 (array_inv!14182 a!2986)))

(declare-fun b!632176 () Bool)

(declare-fun e!361402 () Bool)

(assert (=> b!632176 (= e!361403 e!361402)))

(declare-fun res!408915 () Bool)

(assert (=> b!632176 (=> (not res!408915) (not e!361402))))

(assert (=> b!632176 (= res!408915 (= (select (store (arr!18299 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!632176 (= lt!292065 (array!38134 (store (arr!18299 a!2986) i!1108 k0!1786) (size!18664 a!2986)))))

(declare-fun b!632177 () Bool)

(declare-fun Unit!21274 () Unit!21272)

(assert (=> b!632177 (= e!361398 Unit!21274)))

(assert (=> b!632177 false))

(declare-fun b!632178 () Bool)

(declare-fun res!408911 () Bool)

(assert (=> b!632178 (=> (not res!408911) (not e!361403))))

(assert (=> b!632178 (= res!408911 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18299 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!632179 () Bool)

(declare-fun res!408914 () Bool)

(assert (=> b!632179 (=> (not res!408914) (not e!361399))))

(assert (=> b!632179 (= res!408914 (validKeyInArray!0 k0!1786))))

(declare-fun b!632180 () Bool)

(declare-fun res!408921 () Bool)

(assert (=> b!632180 (=> (not res!408921) (not e!361399))))

(assert (=> b!632180 (= res!408921 (and (= (size!18664 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18664 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18664 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!632181 () Bool)

(assert (=> b!632181 (= e!361400 (or (not (= (select (arr!18299 a!2986) j!136) lt!292064)) (bvslt index!984 (size!18664 a!2986))))))

(assert (=> b!632181 (= (select (store (arr!18299 a!2986) i!1108 k0!1786) index!984) (select (arr!18299 a!2986) j!136))))

(declare-fun b!632182 () Bool)

(declare-fun Unit!21275 () Unit!21272)

(assert (=> b!632182 (= e!361398 Unit!21275)))

(declare-fun b!632183 () Bool)

(declare-fun res!408923 () Bool)

(assert (=> b!632183 (=> (not res!408923) (not e!361403))))

(declare-datatypes ((List!12379 0))(
  ( (Nil!12376) (Cons!12375 (h!13420 (_ BitVec 64)) (t!18598 List!12379)) )
))
(declare-fun arrayNoDuplicates!0 (array!38133 (_ BitVec 32) List!12379) Bool)

(assert (=> b!632183 (= res!408923 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12376))))

(declare-fun b!632184 () Bool)

(declare-fun res!408916 () Bool)

(assert (=> b!632184 (=> (not res!408916) (not e!361403))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38133 (_ BitVec 32)) Bool)

(assert (=> b!632184 (= res!408916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!632185 () Bool)

(assert (=> b!632185 (= e!361402 e!361397)))

(declare-fun res!408918 () Bool)

(assert (=> b!632185 (=> (not res!408918) (not e!361397))))

(assert (=> b!632185 (= res!408918 (and (= lt!292058 (Found!6736 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18299 a!2986) index!984) (select (arr!18299 a!2986) j!136))) (not (= (select (arr!18299 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!632185 (= lt!292058 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18299 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!57102 res!408919) b!632180))

(assert (= (and b!632180 res!408921) b!632174))

(assert (= (and b!632174 res!408922) b!632179))

(assert (= (and b!632179 res!408914) b!632175))

(assert (= (and b!632175 res!408913) b!632171))

(assert (= (and b!632171 res!408917) b!632184))

(assert (= (and b!632184 res!408916) b!632183))

(assert (= (and b!632183 res!408923) b!632178))

(assert (= (and b!632178 res!408911) b!632176))

(assert (= (and b!632176 res!408915) b!632185))

(assert (= (and b!632185 res!408918) b!632173))

(assert (= (and b!632173 res!408920) b!632172))

(assert (= (and b!632173 c!71997) b!632177))

(assert (= (and b!632173 (not c!71997)) b!632182))

(assert (= (and b!632173 (not res!408912)) b!632181))

(declare-fun m!606505 () Bool)

(assert (=> b!632184 m!606505))

(declare-fun m!606507 () Bool)

(assert (=> b!632176 m!606507))

(declare-fun m!606509 () Bool)

(assert (=> b!632176 m!606509))

(declare-fun m!606511 () Bool)

(assert (=> b!632179 m!606511))

(declare-fun m!606513 () Bool)

(assert (=> b!632171 m!606513))

(declare-fun m!606515 () Bool)

(assert (=> b!632174 m!606515))

(assert (=> b!632174 m!606515))

(declare-fun m!606517 () Bool)

(assert (=> b!632174 m!606517))

(declare-fun m!606519 () Bool)

(assert (=> b!632173 m!606519))

(declare-fun m!606521 () Bool)

(assert (=> b!632173 m!606521))

(assert (=> b!632173 m!606515))

(declare-fun m!606523 () Bool)

(assert (=> b!632173 m!606523))

(declare-fun m!606525 () Bool)

(assert (=> b!632173 m!606525))

(declare-fun m!606527 () Bool)

(assert (=> b!632173 m!606527))

(assert (=> b!632173 m!606515))

(declare-fun m!606529 () Bool)

(assert (=> b!632173 m!606529))

(assert (=> b!632173 m!606507))

(declare-fun m!606531 () Bool)

(assert (=> b!632175 m!606531))

(assert (=> b!632181 m!606515))

(assert (=> b!632181 m!606507))

(declare-fun m!606533 () Bool)

(assert (=> b!632181 m!606533))

(declare-fun m!606535 () Bool)

(assert (=> b!632185 m!606535))

(assert (=> b!632185 m!606515))

(assert (=> b!632185 m!606515))

(declare-fun m!606537 () Bool)

(assert (=> b!632185 m!606537))

(declare-fun m!606539 () Bool)

(assert (=> start!57102 m!606539))

(declare-fun m!606541 () Bool)

(assert (=> start!57102 m!606541))

(declare-fun m!606543 () Bool)

(assert (=> b!632183 m!606543))

(declare-fun m!606545 () Bool)

(assert (=> b!632178 m!606545))

(check-sat (not b!632171) (not b!632179) (not b!632173) (not b!632185) (not b!632183) (not b!632174) (not b!632175) (not start!57102) (not b!632184))
(check-sat)
