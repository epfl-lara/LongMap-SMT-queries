; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57238 () Bool)

(assert start!57238)

(declare-fun b!633156 () Bool)

(declare-fun res!409464 () Bool)

(declare-fun e!362002 () Bool)

(assert (=> b!633156 (=> (not res!409464) (not e!362002))))

(declare-datatypes ((array!38157 0))(
  ( (array!38158 (arr!18308 (Array (_ BitVec 32) (_ BitVec 64))) (size!18673 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38157)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!633156 (= res!409464 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!633157 () Bool)

(declare-datatypes ((Unit!21308 0))(
  ( (Unit!21309) )
))
(declare-fun e!362008 () Unit!21308)

(declare-fun Unit!21310 () Unit!21308)

(assert (=> b!633157 (= e!362008 Unit!21310)))

(assert (=> b!633157 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!292524 () array!38157)

(declare-fun e!362005 () Bool)

(declare-fun b!633158 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!633158 (= e!362005 (arrayContainsKey!0 lt!292524 (select (arr!18308 a!2986) j!136) index!984))))

(declare-fun b!633159 () Bool)

(declare-fun res!409472 () Bool)

(assert (=> b!633159 (=> (not res!409472) (not e!362002))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!633159 (= res!409472 (validKeyInArray!0 k0!1786))))

(declare-fun b!633160 () Bool)

(declare-fun e!362010 () Bool)

(assert (=> b!633160 (= e!362010 true)))

(declare-fun e!362004 () Bool)

(assert (=> b!633160 e!362004))

(declare-fun res!409469 () Bool)

(assert (=> b!633160 (=> (not res!409469) (not e!362004))))

(declare-fun lt!292521 () (_ BitVec 64))

(assert (=> b!633160 (= res!409469 (= lt!292521 (select (arr!18308 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!633160 (= lt!292521 (select (store (arr!18308 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!633161 () Bool)

(declare-fun e!362006 () Bool)

(declare-datatypes ((SeekEntryResult!6745 0))(
  ( (MissingZero!6745 (index!29279 (_ BitVec 32))) (Found!6745 (index!29280 (_ BitVec 32))) (Intermediate!6745 (undefined!7557 Bool) (index!29281 (_ BitVec 32)) (x!58033 (_ BitVec 32))) (Undefined!6745) (MissingVacant!6745 (index!29282 (_ BitVec 32))) )
))
(declare-fun lt!292519 () SeekEntryResult!6745)

(declare-fun lt!292518 () SeekEntryResult!6745)

(assert (=> b!633161 (= e!362006 (= lt!292519 lt!292518))))

(declare-fun b!633163 () Bool)

(declare-fun e!362001 () Bool)

(assert (=> b!633163 (= e!362001 e!362005)))

(declare-fun res!409470 () Bool)

(assert (=> b!633163 (=> (not res!409470) (not e!362005))))

(assert (=> b!633163 (= res!409470 (arrayContainsKey!0 lt!292524 (select (arr!18308 a!2986) j!136) j!136))))

(declare-fun b!633164 () Bool)

(declare-fun e!362003 () Bool)

(assert (=> b!633164 (= e!362002 e!362003)))

(declare-fun res!409463 () Bool)

(assert (=> b!633164 (=> (not res!409463) (not e!362003))))

(declare-fun lt!292525 () SeekEntryResult!6745)

(assert (=> b!633164 (= res!409463 (or (= lt!292525 (MissingZero!6745 i!1108)) (= lt!292525 (MissingVacant!6745 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38157 (_ BitVec 32)) SeekEntryResult!6745)

(assert (=> b!633164 (= lt!292525 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!633165 () Bool)

(assert (=> b!633165 (= e!362004 e!362001)))

(declare-fun res!409467 () Bool)

(assert (=> b!633165 (=> res!409467 e!362001)))

(declare-fun lt!292526 () (_ BitVec 64))

(assert (=> b!633165 (= res!409467 (or (not (= (select (arr!18308 a!2986) j!136) lt!292526)) (not (= (select (arr!18308 a!2986) j!136) lt!292521)) (bvsge j!136 index!984)))))

(declare-fun b!633166 () Bool)

(declare-fun res!409459 () Bool)

(assert (=> b!633166 (=> (not res!409459) (not e!362003))))

(declare-datatypes ((List!12388 0))(
  ( (Nil!12385) (Cons!12384 (h!13429 (_ BitVec 64)) (t!18607 List!12388)) )
))
(declare-fun arrayNoDuplicates!0 (array!38157 (_ BitVec 32) List!12388) Bool)

(assert (=> b!633166 (= res!409459 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12385))))

(declare-fun b!633167 () Bool)

(declare-fun res!409465 () Bool)

(assert (=> b!633167 (=> (not res!409465) (not e!362003))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!633167 (= res!409465 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18308 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!633168 () Bool)

(declare-fun e!362007 () Bool)

(declare-fun e!362009 () Bool)

(assert (=> b!633168 (= e!362007 e!362009)))

(declare-fun res!409458 () Bool)

(assert (=> b!633168 (=> (not res!409458) (not e!362009))))

(assert (=> b!633168 (= res!409458 (and (= lt!292519 (Found!6745 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18308 a!2986) index!984) (select (arr!18308 a!2986) j!136))) (not (= (select (arr!18308 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38157 (_ BitVec 32)) SeekEntryResult!6745)

(assert (=> b!633168 (= lt!292519 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18308 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!633169 () Bool)

(declare-fun Unit!21311 () Unit!21308)

(assert (=> b!633169 (= e!362008 Unit!21311)))

(declare-fun b!633170 () Bool)

(declare-fun res!409466 () Bool)

(assert (=> b!633170 (=> (not res!409466) (not e!362002))))

(assert (=> b!633170 (= res!409466 (and (= (size!18673 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18673 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18673 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!633171 () Bool)

(declare-fun res!409468 () Bool)

(assert (=> b!633171 (=> (not res!409468) (not e!362003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38157 (_ BitVec 32)) Bool)

(assert (=> b!633171 (= res!409468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!633162 () Bool)

(assert (=> b!633162 (= e!362009 (not e!362010))))

(declare-fun res!409471 () Bool)

(assert (=> b!633162 (=> res!409471 e!362010)))

(declare-fun lt!292520 () SeekEntryResult!6745)

(assert (=> b!633162 (= res!409471 (not (= lt!292520 (Found!6745 index!984))))))

(declare-fun lt!292523 () Unit!21308)

(assert (=> b!633162 (= lt!292523 e!362008)))

(declare-fun c!72216 () Bool)

(assert (=> b!633162 (= c!72216 (= lt!292520 Undefined!6745))))

(assert (=> b!633162 (= lt!292520 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292526 lt!292524 mask!3053))))

(assert (=> b!633162 e!362006))

(declare-fun res!409462 () Bool)

(assert (=> b!633162 (=> (not res!409462) (not e!362006))))

(declare-fun lt!292517 () (_ BitVec 32))

(assert (=> b!633162 (= res!409462 (= lt!292518 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292517 vacantSpotIndex!68 lt!292526 lt!292524 mask!3053)))))

(assert (=> b!633162 (= lt!292518 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292517 vacantSpotIndex!68 (select (arr!18308 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!633162 (= lt!292526 (select (store (arr!18308 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!292522 () Unit!21308)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38157 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21308)

(assert (=> b!633162 (= lt!292522 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292517 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!633162 (= lt!292517 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!409460 () Bool)

(assert (=> start!57238 (=> (not res!409460) (not e!362002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57238 (= res!409460 (validMask!0 mask!3053))))

(assert (=> start!57238 e!362002))

(assert (=> start!57238 true))

(declare-fun array_inv!14191 (array!38157) Bool)

(assert (=> start!57238 (array_inv!14191 a!2986)))

(declare-fun b!633172 () Bool)

(assert (=> b!633172 (= e!362003 e!362007)))

(declare-fun res!409461 () Bool)

(assert (=> b!633172 (=> (not res!409461) (not e!362007))))

(assert (=> b!633172 (= res!409461 (= (select (store (arr!18308 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!633172 (= lt!292524 (array!38158 (store (arr!18308 a!2986) i!1108 k0!1786) (size!18673 a!2986)))))

(declare-fun b!633173 () Bool)

(declare-fun res!409473 () Bool)

(assert (=> b!633173 (=> (not res!409473) (not e!362002))))

(assert (=> b!633173 (= res!409473 (validKeyInArray!0 (select (arr!18308 a!2986) j!136)))))

(assert (= (and start!57238 res!409460) b!633170))

(assert (= (and b!633170 res!409466) b!633173))

(assert (= (and b!633173 res!409473) b!633159))

(assert (= (and b!633159 res!409472) b!633156))

(assert (= (and b!633156 res!409464) b!633164))

(assert (= (and b!633164 res!409463) b!633171))

(assert (= (and b!633171 res!409468) b!633166))

(assert (= (and b!633166 res!409459) b!633167))

(assert (= (and b!633167 res!409465) b!633172))

(assert (= (and b!633172 res!409461) b!633168))

(assert (= (and b!633168 res!409458) b!633162))

(assert (= (and b!633162 res!409462) b!633161))

(assert (= (and b!633162 c!72216) b!633157))

(assert (= (and b!633162 (not c!72216)) b!633169))

(assert (= (and b!633162 (not res!409471)) b!633160))

(assert (= (and b!633160 res!409469) b!633165))

(assert (= (and b!633165 (not res!409467)) b!633163))

(assert (= (and b!633163 res!409470) b!633158))

(declare-fun m!607331 () Bool)

(assert (=> b!633159 m!607331))

(declare-fun m!607333 () Bool)

(assert (=> b!633173 m!607333))

(assert (=> b!633173 m!607333))

(declare-fun m!607335 () Bool)

(assert (=> b!633173 m!607335))

(declare-fun m!607337 () Bool)

(assert (=> b!633171 m!607337))

(declare-fun m!607339 () Bool)

(assert (=> b!633166 m!607339))

(declare-fun m!607341 () Bool)

(assert (=> b!633172 m!607341))

(declare-fun m!607343 () Bool)

(assert (=> b!633172 m!607343))

(declare-fun m!607345 () Bool)

(assert (=> start!57238 m!607345))

(declare-fun m!607347 () Bool)

(assert (=> start!57238 m!607347))

(declare-fun m!607349 () Bool)

(assert (=> b!633162 m!607349))

(declare-fun m!607351 () Bool)

(assert (=> b!633162 m!607351))

(assert (=> b!633162 m!607333))

(declare-fun m!607353 () Bool)

(assert (=> b!633162 m!607353))

(assert (=> b!633162 m!607333))

(assert (=> b!633162 m!607341))

(declare-fun m!607355 () Bool)

(assert (=> b!633162 m!607355))

(declare-fun m!607357 () Bool)

(assert (=> b!633162 m!607357))

(declare-fun m!607359 () Bool)

(assert (=> b!633162 m!607359))

(assert (=> b!633160 m!607333))

(assert (=> b!633160 m!607341))

(declare-fun m!607361 () Bool)

(assert (=> b!633160 m!607361))

(assert (=> b!633158 m!607333))

(assert (=> b!633158 m!607333))

(declare-fun m!607363 () Bool)

(assert (=> b!633158 m!607363))

(declare-fun m!607365 () Bool)

(assert (=> b!633156 m!607365))

(declare-fun m!607367 () Bool)

(assert (=> b!633167 m!607367))

(assert (=> b!633163 m!607333))

(assert (=> b!633163 m!607333))

(declare-fun m!607369 () Bool)

(assert (=> b!633163 m!607369))

(assert (=> b!633165 m!607333))

(declare-fun m!607371 () Bool)

(assert (=> b!633168 m!607371))

(assert (=> b!633168 m!607333))

(assert (=> b!633168 m!607333))

(declare-fun m!607373 () Bool)

(assert (=> b!633168 m!607373))

(declare-fun m!607375 () Bool)

(assert (=> b!633164 m!607375))

(check-sat (not b!633168) (not b!633158) (not b!633173) (not b!633164) (not b!633163) (not b!633171) (not b!633166) (not start!57238) (not b!633162) (not b!633156) (not b!633159))
(check-sat)
