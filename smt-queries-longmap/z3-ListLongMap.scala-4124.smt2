; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56340 () Bool)

(assert start!56340)

(declare-fun b!624299 () Bool)

(declare-fun res!402367 () Bool)

(declare-fun e!358071 () Bool)

(assert (=> b!624299 (=> (not res!402367) (not e!358071))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624299 (= res!402367 (validKeyInArray!0 k0!1786))))

(declare-fun res!402364 () Bool)

(assert (=> start!56340 (=> (not res!402364) (not e!358071))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56340 (= res!402364 (validMask!0 mask!3053))))

(assert (=> start!56340 e!358071))

(assert (=> start!56340 true))

(declare-datatypes ((array!37710 0))(
  ( (array!37711 (arr!18097 (Array (_ BitVec 32) (_ BitVec 64))) (size!18461 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37710)

(declare-fun array_inv!13956 (array!37710) Bool)

(assert (=> start!56340 (array_inv!13956 a!2986)))

(declare-fun b!624300 () Bool)

(declare-fun res!402365 () Bool)

(declare-fun e!358069 () Bool)

(assert (=> b!624300 (=> (not res!402365) (not e!358069))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!624300 (= res!402365 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18097 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!624301 () Bool)

(declare-fun e!358068 () Bool)

(declare-datatypes ((SeekEntryResult!6493 0))(
  ( (MissingZero!6493 (index!28256 (_ BitVec 32))) (Found!6493 (index!28257 (_ BitVec 32))) (Intermediate!6493 (undefined!7305 Bool) (index!28258 (_ BitVec 32)) (x!57171 (_ BitVec 32))) (Undefined!6493) (MissingVacant!6493 (index!28259 (_ BitVec 32))) )
))
(declare-fun lt!289593 () SeekEntryResult!6493)

(declare-fun lt!289595 () SeekEntryResult!6493)

(assert (=> b!624301 (= e!358068 (= lt!289593 lt!289595))))

(declare-fun b!624302 () Bool)

(declare-fun res!402362 () Bool)

(assert (=> b!624302 (=> (not res!402362) (not e!358071))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!624302 (= res!402362 (validKeyInArray!0 (select (arr!18097 a!2986) j!136)))))

(declare-fun b!624303 () Bool)

(declare-fun res!402369 () Bool)

(assert (=> b!624303 (=> (not res!402369) (not e!358071))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624303 (= res!402369 (and (= (size!18461 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18461 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18461 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624304 () Bool)

(declare-fun res!402363 () Bool)

(assert (=> b!624304 (=> (not res!402363) (not e!358071))))

(declare-fun arrayContainsKey!0 (array!37710 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624304 (= res!402363 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624305 () Bool)

(declare-fun res!402366 () Bool)

(assert (=> b!624305 (=> (not res!402366) (not e!358069))))

(declare-datatypes ((List!12045 0))(
  ( (Nil!12042) (Cons!12041 (h!13089 (_ BitVec 64)) (t!18265 List!12045)) )
))
(declare-fun arrayNoDuplicates!0 (array!37710 (_ BitVec 32) List!12045) Bool)

(assert (=> b!624305 (= res!402366 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12042))))

(declare-fun b!624306 () Bool)

(declare-fun e!358065 () Bool)

(declare-fun e!358070 () Bool)

(assert (=> b!624306 (= e!358065 e!358070)))

(declare-fun res!402358 () Bool)

(assert (=> b!624306 (=> (not res!402358) (not e!358070))))

(assert (=> b!624306 (= res!402358 (and (= lt!289593 (Found!6493 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18097 a!2986) index!984) (select (arr!18097 a!2986) j!136))) (not (= (select (arr!18097 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37710 (_ BitVec 32)) SeekEntryResult!6493)

(assert (=> b!624306 (= lt!289593 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18097 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!624307 () Bool)

(assert (=> b!624307 (= e!358071 e!358069)))

(declare-fun res!402368 () Bool)

(assert (=> b!624307 (=> (not res!402368) (not e!358069))))

(declare-fun lt!289592 () SeekEntryResult!6493)

(assert (=> b!624307 (= res!402368 (or (= lt!289592 (MissingZero!6493 i!1108)) (= lt!289592 (MissingVacant!6493 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37710 (_ BitVec 32)) SeekEntryResult!6493)

(assert (=> b!624307 (= lt!289592 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!624308 () Bool)

(declare-fun lt!289594 () (_ BitVec 64))

(declare-fun e!358067 () Bool)

(assert (=> b!624308 (= e!358067 (or (not (= (select (arr!18097 a!2986) j!136) lt!289594)) (= (select (arr!18097 a!2986) j!136) (select (store (arr!18097 a!2986) i!1108 k0!1786) index!984))))))

(assert (=> b!624308 (= (select (store (arr!18097 a!2986) i!1108 k0!1786) index!984) (select (arr!18097 a!2986) j!136))))

(declare-fun b!624309 () Bool)

(declare-datatypes ((Unit!21051 0))(
  ( (Unit!21052) )
))
(declare-fun e!358064 () Unit!21051)

(declare-fun Unit!21053 () Unit!21051)

(assert (=> b!624309 (= e!358064 Unit!21053)))

(assert (=> b!624309 false))

(declare-fun b!624310 () Bool)

(assert (=> b!624310 (= e!358070 (not e!358067))))

(declare-fun res!402361 () Bool)

(assert (=> b!624310 (=> res!402361 e!358067)))

(declare-fun lt!289597 () SeekEntryResult!6493)

(assert (=> b!624310 (= res!402361 (not (= lt!289597 (Found!6493 index!984))))))

(declare-fun lt!289590 () Unit!21051)

(assert (=> b!624310 (= lt!289590 e!358064)))

(declare-fun c!71339 () Bool)

(assert (=> b!624310 (= c!71339 (= lt!289597 Undefined!6493))))

(declare-fun lt!289589 () array!37710)

(assert (=> b!624310 (= lt!289597 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!289594 lt!289589 mask!3053))))

(assert (=> b!624310 e!358068))

(declare-fun res!402360 () Bool)

(assert (=> b!624310 (=> (not res!402360) (not e!358068))))

(declare-fun lt!289591 () (_ BitVec 32))

(assert (=> b!624310 (= res!402360 (= lt!289595 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289591 vacantSpotIndex!68 lt!289594 lt!289589 mask!3053)))))

(assert (=> b!624310 (= lt!289595 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289591 vacantSpotIndex!68 (select (arr!18097 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!624310 (= lt!289594 (select (store (arr!18097 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!289596 () Unit!21051)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37710 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21051)

(assert (=> b!624310 (= lt!289596 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!289591 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!624310 (= lt!289591 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!624311 () Bool)

(declare-fun res!402370 () Bool)

(assert (=> b!624311 (=> (not res!402370) (not e!358069))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37710 (_ BitVec 32)) Bool)

(assert (=> b!624311 (= res!402370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624312 () Bool)

(declare-fun Unit!21054 () Unit!21051)

(assert (=> b!624312 (= e!358064 Unit!21054)))

(declare-fun b!624313 () Bool)

(assert (=> b!624313 (= e!358069 e!358065)))

(declare-fun res!402359 () Bool)

(assert (=> b!624313 (=> (not res!402359) (not e!358065))))

(assert (=> b!624313 (= res!402359 (= (select (store (arr!18097 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!624313 (= lt!289589 (array!37711 (store (arr!18097 a!2986) i!1108 k0!1786) (size!18461 a!2986)))))

(assert (= (and start!56340 res!402364) b!624303))

(assert (= (and b!624303 res!402369) b!624302))

(assert (= (and b!624302 res!402362) b!624299))

(assert (= (and b!624299 res!402367) b!624304))

(assert (= (and b!624304 res!402363) b!624307))

(assert (= (and b!624307 res!402368) b!624311))

(assert (= (and b!624311 res!402370) b!624305))

(assert (= (and b!624305 res!402366) b!624300))

(assert (= (and b!624300 res!402365) b!624313))

(assert (= (and b!624313 res!402359) b!624306))

(assert (= (and b!624306 res!402358) b!624310))

(assert (= (and b!624310 res!402360) b!624301))

(assert (= (and b!624310 c!71339) b!624309))

(assert (= (and b!624310 (not c!71339)) b!624312))

(assert (= (and b!624310 (not res!402361)) b!624308))

(declare-fun m!600313 () Bool)

(assert (=> b!624311 m!600313))

(declare-fun m!600315 () Bool)

(assert (=> b!624308 m!600315))

(declare-fun m!600317 () Bool)

(assert (=> b!624308 m!600317))

(declare-fun m!600319 () Bool)

(assert (=> b!624308 m!600319))

(assert (=> b!624310 m!600315))

(declare-fun m!600321 () Bool)

(assert (=> b!624310 m!600321))

(declare-fun m!600323 () Bool)

(assert (=> b!624310 m!600323))

(assert (=> b!624310 m!600315))

(declare-fun m!600325 () Bool)

(assert (=> b!624310 m!600325))

(declare-fun m!600327 () Bool)

(assert (=> b!624310 m!600327))

(declare-fun m!600329 () Bool)

(assert (=> b!624310 m!600329))

(declare-fun m!600331 () Bool)

(assert (=> b!624310 m!600331))

(assert (=> b!624310 m!600317))

(declare-fun m!600333 () Bool)

(assert (=> b!624306 m!600333))

(assert (=> b!624306 m!600315))

(assert (=> b!624306 m!600315))

(declare-fun m!600335 () Bool)

(assert (=> b!624306 m!600335))

(assert (=> b!624302 m!600315))

(assert (=> b!624302 m!600315))

(declare-fun m!600337 () Bool)

(assert (=> b!624302 m!600337))

(declare-fun m!600339 () Bool)

(assert (=> b!624304 m!600339))

(declare-fun m!600341 () Bool)

(assert (=> b!624300 m!600341))

(declare-fun m!600343 () Bool)

(assert (=> b!624305 m!600343))

(assert (=> b!624313 m!600317))

(declare-fun m!600345 () Bool)

(assert (=> b!624313 m!600345))

(declare-fun m!600347 () Bool)

(assert (=> b!624307 m!600347))

(declare-fun m!600349 () Bool)

(assert (=> b!624299 m!600349))

(declare-fun m!600351 () Bool)

(assert (=> start!56340 m!600351))

(declare-fun m!600353 () Bool)

(assert (=> start!56340 m!600353))

(check-sat (not b!624307) (not b!624304) (not b!624305) (not start!56340) (not b!624302) (not b!624311) (not b!624306) (not b!624310) (not b!624299))
(check-sat)
