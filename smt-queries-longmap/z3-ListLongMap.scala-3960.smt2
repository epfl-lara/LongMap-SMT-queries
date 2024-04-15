; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53754 () Bool)

(assert start!53754)

(declare-fun b!586398 () Bool)

(declare-fun res!374366 () Bool)

(declare-fun e!335152 () Bool)

(assert (=> b!586398 (=> (not res!374366) (not e!335152))))

(declare-datatypes ((array!36669 0))(
  ( (array!36670 (arr!17609 (Array (_ BitVec 32) (_ BitVec 64))) (size!17974 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36669)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586398 (= res!374366 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586399 () Bool)

(declare-fun e!335154 () Bool)

(assert (=> b!586399 (= e!335154 (not true))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!265924 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6046 0))(
  ( (MissingZero!6046 (index!26411 (_ BitVec 32))) (Found!6046 (index!26412 (_ BitVec 32))) (Intermediate!6046 (undefined!6858 Bool) (index!26413 (_ BitVec 32)) (x!55230 (_ BitVec 32))) (Undefined!6046) (MissingVacant!6046 (index!26414 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36669 (_ BitVec 32)) SeekEntryResult!6046)

(assert (=> b!586399 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265924 vacantSpotIndex!68 (select (arr!17609 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265924 vacantSpotIndex!68 (select (store (arr!17609 a!2986) i!1108 k0!1786) j!136) (array!36670 (store (arr!17609 a!2986) i!1108 k0!1786) (size!17974 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18198 0))(
  ( (Unit!18199) )
))
(declare-fun lt!265922 () Unit!18198)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36669 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18198)

(assert (=> b!586399 (= lt!265922 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265924 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586399 (= lt!265924 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586400 () Bool)

(declare-fun res!374362 () Bool)

(assert (=> b!586400 (=> (not res!374362) (not e!335154))))

(declare-datatypes ((List!11689 0))(
  ( (Nil!11686) (Cons!11685 (h!12730 (_ BitVec 64)) (t!17908 List!11689)) )
))
(declare-fun arrayNoDuplicates!0 (array!36669 (_ BitVec 32) List!11689) Bool)

(assert (=> b!586400 (= res!374362 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11686))))

(declare-fun b!586401 () Bool)

(declare-fun res!374357 () Bool)

(assert (=> b!586401 (=> (not res!374357) (not e!335152))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586401 (= res!374357 (validKeyInArray!0 k0!1786))))

(declare-fun res!374360 () Bool)

(assert (=> start!53754 (=> (not res!374360) (not e!335152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53754 (= res!374360 (validMask!0 mask!3053))))

(assert (=> start!53754 e!335152))

(assert (=> start!53754 true))

(declare-fun array_inv!13492 (array!36669) Bool)

(assert (=> start!53754 (array_inv!13492 a!2986)))

(declare-fun b!586402 () Bool)

(declare-fun res!374364 () Bool)

(assert (=> b!586402 (=> (not res!374364) (not e!335154))))

(assert (=> b!586402 (= res!374364 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17609 a!2986) j!136) a!2986 mask!3053) (Found!6046 j!136)))))

(declare-fun b!586403 () Bool)

(declare-fun res!374358 () Bool)

(assert (=> b!586403 (=> (not res!374358) (not e!335154))))

(assert (=> b!586403 (= res!374358 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17609 a!2986) index!984) (select (arr!17609 a!2986) j!136))) (not (= (select (arr!17609 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586404 () Bool)

(declare-fun res!374363 () Bool)

(assert (=> b!586404 (=> (not res!374363) (not e!335152))))

(assert (=> b!586404 (= res!374363 (validKeyInArray!0 (select (arr!17609 a!2986) j!136)))))

(declare-fun b!586405 () Bool)

(assert (=> b!586405 (= e!335152 e!335154)))

(declare-fun res!374361 () Bool)

(assert (=> b!586405 (=> (not res!374361) (not e!335154))))

(declare-fun lt!265923 () SeekEntryResult!6046)

(assert (=> b!586405 (= res!374361 (or (= lt!265923 (MissingZero!6046 i!1108)) (= lt!265923 (MissingVacant!6046 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36669 (_ BitVec 32)) SeekEntryResult!6046)

(assert (=> b!586405 (= lt!265923 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!586406 () Bool)

(declare-fun res!374359 () Bool)

(assert (=> b!586406 (=> (not res!374359) (not e!335154))))

(assert (=> b!586406 (= res!374359 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17609 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17609 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586407 () Bool)

(declare-fun res!374356 () Bool)

(assert (=> b!586407 (=> (not res!374356) (not e!335154))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36669 (_ BitVec 32)) Bool)

(assert (=> b!586407 (= res!374356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586408 () Bool)

(declare-fun res!374365 () Bool)

(assert (=> b!586408 (=> (not res!374365) (not e!335152))))

(assert (=> b!586408 (= res!374365 (and (= (size!17974 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17974 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17974 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53754 res!374360) b!586408))

(assert (= (and b!586408 res!374365) b!586404))

(assert (= (and b!586404 res!374363) b!586401))

(assert (= (and b!586401 res!374357) b!586398))

(assert (= (and b!586398 res!374366) b!586405))

(assert (= (and b!586405 res!374361) b!586407))

(assert (= (and b!586407 res!374356) b!586400))

(assert (= (and b!586400 res!374362) b!586406))

(assert (= (and b!586406 res!374359) b!586402))

(assert (= (and b!586402 res!374364) b!586403))

(assert (= (and b!586403 res!374358) b!586399))

(declare-fun m!564277 () Bool)

(assert (=> start!53754 m!564277))

(declare-fun m!564279 () Bool)

(assert (=> start!53754 m!564279))

(declare-fun m!564281 () Bool)

(assert (=> b!586403 m!564281))

(declare-fun m!564283 () Bool)

(assert (=> b!586403 m!564283))

(declare-fun m!564285 () Bool)

(assert (=> b!586401 m!564285))

(declare-fun m!564287 () Bool)

(assert (=> b!586406 m!564287))

(declare-fun m!564289 () Bool)

(assert (=> b!586406 m!564289))

(declare-fun m!564291 () Bool)

(assert (=> b!586406 m!564291))

(declare-fun m!564293 () Bool)

(assert (=> b!586407 m!564293))

(declare-fun m!564295 () Bool)

(assert (=> b!586399 m!564295))

(declare-fun m!564297 () Bool)

(assert (=> b!586399 m!564297))

(assert (=> b!586399 m!564283))

(declare-fun m!564299 () Bool)

(assert (=> b!586399 m!564299))

(assert (=> b!586399 m!564289))

(assert (=> b!586399 m!564297))

(declare-fun m!564301 () Bool)

(assert (=> b!586399 m!564301))

(assert (=> b!586399 m!564283))

(declare-fun m!564303 () Bool)

(assert (=> b!586399 m!564303))

(declare-fun m!564305 () Bool)

(assert (=> b!586400 m!564305))

(declare-fun m!564307 () Bool)

(assert (=> b!586398 m!564307))

(assert (=> b!586404 m!564283))

(assert (=> b!586404 m!564283))

(declare-fun m!564309 () Bool)

(assert (=> b!586404 m!564309))

(declare-fun m!564311 () Bool)

(assert (=> b!586405 m!564311))

(assert (=> b!586402 m!564283))

(assert (=> b!586402 m!564283))

(declare-fun m!564313 () Bool)

(assert (=> b!586402 m!564313))

(check-sat (not b!586407) (not start!53754) (not b!586405) (not b!586404) (not b!586398) (not b!586401) (not b!586399) (not b!586402) (not b!586400))
(check-sat)
