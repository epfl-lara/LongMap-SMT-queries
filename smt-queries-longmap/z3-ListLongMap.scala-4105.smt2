; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56112 () Bool)

(assert start!56112)

(declare-fun b!619850 () Bool)

(declare-fun e!355491 () Bool)

(assert (=> b!619850 (= e!355491 (not true))))

(declare-datatypes ((Unit!20556 0))(
  ( (Unit!20557) )
))
(declare-fun lt!286235 () Unit!20556)

(declare-fun e!355500 () Unit!20556)

(assert (=> b!619850 (= lt!286235 e!355500)))

(declare-fun c!70563 () Bool)

(declare-datatypes ((SeekEntryResult!6481 0))(
  ( (MissingZero!6481 (index!28208 (_ BitVec 32))) (Found!6481 (index!28209 (_ BitVec 32))) (Intermediate!6481 (undefined!7293 Bool) (index!28210 (_ BitVec 32)) (x!56996 (_ BitVec 32))) (Undefined!6481) (MissingVacant!6481 (index!28211 (_ BitVec 32))) )
))
(declare-fun lt!286229 () SeekEntryResult!6481)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!619850 (= c!70563 (= lt!286229 (Found!6481 index!984)))))

(declare-fun lt!286239 () Unit!20556)

(declare-fun e!355494 () Unit!20556)

(assert (=> b!619850 (= lt!286239 e!355494)))

(declare-fun c!70565 () Bool)

(assert (=> b!619850 (= c!70565 (= lt!286229 Undefined!6481))))

(declare-datatypes ((array!37596 0))(
  ( (array!37597 (arr!18044 (Array (_ BitVec 32) (_ BitVec 64))) (size!18409 (_ BitVec 32))) )
))
(declare-fun lt!286238 () array!37596)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!286242 () (_ BitVec 64))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37596 (_ BitVec 32)) SeekEntryResult!6481)

(assert (=> b!619850 (= lt!286229 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!286242 lt!286238 mask!3053))))

(declare-fun e!355498 () Bool)

(assert (=> b!619850 e!355498))

(declare-fun res!399460 () Bool)

(assert (=> b!619850 (=> (not res!399460) (not e!355498))))

(declare-fun lt!286240 () SeekEntryResult!6481)

(declare-fun lt!286236 () (_ BitVec 32))

(assert (=> b!619850 (= res!399460 (= lt!286240 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286236 vacantSpotIndex!68 lt!286242 lt!286238 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!37596)

(assert (=> b!619850 (= lt!286240 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286236 vacantSpotIndex!68 (select (arr!18044 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!619850 (= lt!286242 (select (store (arr!18044 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!286226 () Unit!20556)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37596 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20556)

(assert (=> b!619850 (= lt!286226 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!286236 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!619850 (= lt!286236 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun e!355495 () Bool)

(declare-fun b!619851 () Bool)

(declare-fun arrayContainsKey!0 (array!37596 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!619851 (= e!355495 (arrayContainsKey!0 lt!286238 (select (arr!18044 a!2986) j!136) index!984))))

(declare-fun b!619852 () Bool)

(declare-fun res!399472 () Bool)

(declare-fun e!355492 () Bool)

(assert (=> b!619852 (=> (not res!399472) (not e!355492))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!619852 (= res!399472 (validKeyInArray!0 k0!1786))))

(declare-fun b!619853 () Bool)

(declare-fun e!355497 () Unit!20556)

(declare-fun Unit!20558 () Unit!20556)

(assert (=> b!619853 (= e!355497 Unit!20558)))

(declare-fun res!399466 () Bool)

(assert (=> start!56112 (=> (not res!399466) (not e!355492))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56112 (= res!399466 (validMask!0 mask!3053))))

(assert (=> start!56112 e!355492))

(assert (=> start!56112 true))

(declare-fun array_inv!13927 (array!37596) Bool)

(assert (=> start!56112 (array_inv!13927 a!2986)))

(declare-fun b!619854 () Bool)

(declare-fun Unit!20559 () Unit!20556)

(assert (=> b!619854 (= e!355500 Unit!20559)))

(declare-fun b!619855 () Bool)

(declare-fun e!355487 () Bool)

(assert (=> b!619855 (= e!355487 (arrayContainsKey!0 lt!286238 (select (arr!18044 a!2986) j!136) index!984))))

(declare-fun b!619856 () Bool)

(declare-fun e!355496 () Bool)

(declare-fun e!355488 () Bool)

(assert (=> b!619856 (= e!355496 e!355488)))

(declare-fun res!399468 () Bool)

(assert (=> b!619856 (=> (not res!399468) (not e!355488))))

(assert (=> b!619856 (= res!399468 (= (select (store (arr!18044 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!619856 (= lt!286238 (array!37597 (store (arr!18044 a!2986) i!1108 k0!1786) (size!18409 a!2986)))))

(declare-fun b!619857 () Bool)

(declare-fun Unit!20560 () Unit!20556)

(assert (=> b!619857 (= e!355494 Unit!20560)))

(assert (=> b!619857 false))

(declare-fun b!619858 () Bool)

(assert (=> b!619858 (= e!355488 e!355491)))

(declare-fun res!399471 () Bool)

(assert (=> b!619858 (=> (not res!399471) (not e!355491))))

(declare-fun lt!286230 () SeekEntryResult!6481)

(assert (=> b!619858 (= res!399471 (and (= lt!286230 (Found!6481 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18044 a!2986) index!984) (select (arr!18044 a!2986) j!136))) (not (= (select (arr!18044 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!619858 (= lt!286230 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18044 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!619859 () Bool)

(assert (=> b!619859 (= e!355492 e!355496)))

(declare-fun res!399467 () Bool)

(assert (=> b!619859 (=> (not res!399467) (not e!355496))))

(declare-fun lt!286232 () SeekEntryResult!6481)

(assert (=> b!619859 (= res!399467 (or (= lt!286232 (MissingZero!6481 i!1108)) (= lt!286232 (MissingVacant!6481 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37596 (_ BitVec 32)) SeekEntryResult!6481)

(assert (=> b!619859 (= lt!286232 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!619860 () Bool)

(declare-fun res!399470 () Bool)

(assert (=> b!619860 (=> (not res!399470) (not e!355492))))

(assert (=> b!619860 (= res!399470 (validKeyInArray!0 (select (arr!18044 a!2986) j!136)))))

(declare-fun b!619861 () Bool)

(assert (=> b!619861 false))

(declare-fun lt!286241 () Unit!20556)

(declare-datatypes ((List!12124 0))(
  ( (Nil!12121) (Cons!12120 (h!13165 (_ BitVec 64)) (t!18343 List!12124)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37596 (_ BitVec 64) (_ BitVec 32) List!12124) Unit!20556)

(assert (=> b!619861 (= lt!286241 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286238 (select (arr!18044 a!2986) j!136) index!984 Nil!12121))))

(declare-fun arrayNoDuplicates!0 (array!37596 (_ BitVec 32) List!12124) Bool)

(assert (=> b!619861 (arrayNoDuplicates!0 lt!286238 index!984 Nil!12121)))

(declare-fun lt!286227 () Unit!20556)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37596 (_ BitVec 32) (_ BitVec 32)) Unit!20556)

(assert (=> b!619861 (= lt!286227 (lemmaNoDuplicateFromThenFromBigger!0 lt!286238 #b00000000000000000000000000000000 index!984))))

(assert (=> b!619861 (arrayNoDuplicates!0 lt!286238 #b00000000000000000000000000000000 Nil!12121)))

(declare-fun lt!286231 () Unit!20556)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37596 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12124) Unit!20556)

(assert (=> b!619861 (= lt!286231 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12121))))

(assert (=> b!619861 (arrayContainsKey!0 lt!286238 (select (arr!18044 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!286228 () Unit!20556)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37596 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20556)

(assert (=> b!619861 (= lt!286228 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286238 (select (arr!18044 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!619861 e!355495))

(declare-fun res!399458 () Bool)

(assert (=> b!619861 (=> (not res!399458) (not e!355495))))

(assert (=> b!619861 (= res!399458 (arrayContainsKey!0 lt!286238 (select (arr!18044 a!2986) j!136) j!136))))

(declare-fun e!355490 () Unit!20556)

(declare-fun Unit!20561 () Unit!20556)

(assert (=> b!619861 (= e!355490 Unit!20561)))

(declare-fun b!619862 () Bool)

(declare-fun Unit!20562 () Unit!20556)

(assert (=> b!619862 (= e!355490 Unit!20562)))

(declare-fun b!619863 () Bool)

(declare-fun res!399463 () Bool)

(assert (=> b!619863 (=> (not res!399463) (not e!355496))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37596 (_ BitVec 32)) Bool)

(assert (=> b!619863 (= res!399463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!619864 () Bool)

(declare-fun res!399462 () Bool)

(assert (=> b!619864 (=> (not res!399462) (not e!355496))))

(assert (=> b!619864 (= res!399462 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18044 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!619865 () Bool)

(assert (=> b!619865 false))

(declare-fun lt!286243 () Unit!20556)

(assert (=> b!619865 (= lt!286243 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286238 (select (arr!18044 a!2986) j!136) j!136 Nil!12121))))

(assert (=> b!619865 (arrayNoDuplicates!0 lt!286238 j!136 Nil!12121)))

(declare-fun lt!286233 () Unit!20556)

(assert (=> b!619865 (= lt!286233 (lemmaNoDuplicateFromThenFromBigger!0 lt!286238 #b00000000000000000000000000000000 j!136))))

(assert (=> b!619865 (arrayNoDuplicates!0 lt!286238 #b00000000000000000000000000000000 Nil!12121)))

(declare-fun lt!286225 () Unit!20556)

(assert (=> b!619865 (= lt!286225 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12121))))

(assert (=> b!619865 (arrayContainsKey!0 lt!286238 (select (arr!18044 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!286237 () Unit!20556)

(assert (=> b!619865 (= lt!286237 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286238 (select (arr!18044 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20563 () Unit!20556)

(assert (=> b!619865 (= e!355497 Unit!20563)))

(declare-fun b!619866 () Bool)

(declare-fun res!399461 () Bool)

(assert (=> b!619866 (= res!399461 (bvsge j!136 index!984))))

(declare-fun e!355493 () Bool)

(assert (=> b!619866 (=> res!399461 e!355493)))

(declare-fun e!355499 () Bool)

(assert (=> b!619866 (= e!355499 e!355493)))

(declare-fun b!619867 () Bool)

(declare-fun Unit!20564 () Unit!20556)

(assert (=> b!619867 (= e!355494 Unit!20564)))

(declare-fun b!619868 () Bool)

(assert (=> b!619868 (= e!355498 (= lt!286230 lt!286240))))

(declare-fun res!399459 () Bool)

(declare-fun b!619869 () Bool)

(assert (=> b!619869 (= res!399459 (arrayContainsKey!0 lt!286238 (select (arr!18044 a!2986) j!136) j!136))))

(assert (=> b!619869 (=> (not res!399459) (not e!355487))))

(assert (=> b!619869 (= e!355493 e!355487)))

(declare-fun b!619870 () Bool)

(declare-fun Unit!20565 () Unit!20556)

(assert (=> b!619870 (= e!355500 Unit!20565)))

(declare-fun res!399473 () Bool)

(assert (=> b!619870 (= res!399473 (= (select (store (arr!18044 a!2986) i!1108 k0!1786) index!984) (select (arr!18044 a!2986) j!136)))))

(assert (=> b!619870 (=> (not res!399473) (not e!355499))))

(assert (=> b!619870 e!355499))

(declare-fun c!70566 () Bool)

(assert (=> b!619870 (= c!70566 (bvslt j!136 index!984))))

(declare-fun lt!286234 () Unit!20556)

(assert (=> b!619870 (= lt!286234 e!355497)))

(declare-fun c!70564 () Bool)

(assert (=> b!619870 (= c!70564 (bvslt index!984 j!136))))

(declare-fun lt!286224 () Unit!20556)

(assert (=> b!619870 (= lt!286224 e!355490)))

(assert (=> b!619870 false))

(declare-fun b!619871 () Bool)

(declare-fun res!399464 () Bool)

(assert (=> b!619871 (=> (not res!399464) (not e!355496))))

(assert (=> b!619871 (= res!399464 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12121))))

(declare-fun b!619872 () Bool)

(declare-fun res!399465 () Bool)

(assert (=> b!619872 (=> (not res!399465) (not e!355492))))

(assert (=> b!619872 (= res!399465 (and (= (size!18409 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18409 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18409 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!619873 () Bool)

(declare-fun res!399469 () Bool)

(assert (=> b!619873 (=> (not res!399469) (not e!355492))))

(assert (=> b!619873 (= res!399469 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56112 res!399466) b!619872))

(assert (= (and b!619872 res!399465) b!619860))

(assert (= (and b!619860 res!399470) b!619852))

(assert (= (and b!619852 res!399472) b!619873))

(assert (= (and b!619873 res!399469) b!619859))

(assert (= (and b!619859 res!399467) b!619863))

(assert (= (and b!619863 res!399463) b!619871))

(assert (= (and b!619871 res!399464) b!619864))

(assert (= (and b!619864 res!399462) b!619856))

(assert (= (and b!619856 res!399468) b!619858))

(assert (= (and b!619858 res!399471) b!619850))

(assert (= (and b!619850 res!399460) b!619868))

(assert (= (and b!619850 c!70565) b!619857))

(assert (= (and b!619850 (not c!70565)) b!619867))

(assert (= (and b!619850 c!70563) b!619870))

(assert (= (and b!619850 (not c!70563)) b!619854))

(assert (= (and b!619870 res!399473) b!619866))

(assert (= (and b!619866 (not res!399461)) b!619869))

(assert (= (and b!619869 res!399459) b!619855))

(assert (= (and b!619870 c!70566) b!619865))

(assert (= (and b!619870 (not c!70566)) b!619853))

(assert (= (and b!619870 c!70564) b!619861))

(assert (= (and b!619870 (not c!70564)) b!619862))

(assert (= (and b!619861 res!399458) b!619851))

(declare-fun m!595279 () Bool)

(assert (=> b!619865 m!595279))

(declare-fun m!595281 () Bool)

(assert (=> b!619865 m!595281))

(declare-fun m!595283 () Bool)

(assert (=> b!619865 m!595283))

(assert (=> b!619865 m!595283))

(declare-fun m!595285 () Bool)

(assert (=> b!619865 m!595285))

(assert (=> b!619865 m!595283))

(declare-fun m!595287 () Bool)

(assert (=> b!619865 m!595287))

(declare-fun m!595289 () Bool)

(assert (=> b!619865 m!595289))

(assert (=> b!619865 m!595283))

(declare-fun m!595291 () Bool)

(assert (=> b!619865 m!595291))

(declare-fun m!595293 () Bool)

(assert (=> b!619865 m!595293))

(declare-fun m!595295 () Bool)

(assert (=> b!619859 m!595295))

(declare-fun m!595297 () Bool)

(assert (=> b!619873 m!595297))

(declare-fun m!595299 () Bool)

(assert (=> start!56112 m!595299))

(declare-fun m!595301 () Bool)

(assert (=> start!56112 m!595301))

(declare-fun m!595303 () Bool)

(assert (=> b!619863 m!595303))

(declare-fun m!595305 () Bool)

(assert (=> b!619852 m!595305))

(assert (=> b!619851 m!595283))

(assert (=> b!619851 m!595283))

(declare-fun m!595307 () Bool)

(assert (=> b!619851 m!595307))

(declare-fun m!595309 () Bool)

(assert (=> b!619864 m!595309))

(assert (=> b!619869 m!595283))

(assert (=> b!619869 m!595283))

(declare-fun m!595311 () Bool)

(assert (=> b!619869 m!595311))

(assert (=> b!619855 m!595283))

(assert (=> b!619855 m!595283))

(assert (=> b!619855 m!595307))

(declare-fun m!595313 () Bool)

(assert (=> b!619871 m!595313))

(declare-fun m!595315 () Bool)

(assert (=> b!619850 m!595315))

(declare-fun m!595317 () Bool)

(assert (=> b!619850 m!595317))

(assert (=> b!619850 m!595283))

(assert (=> b!619850 m!595283))

(declare-fun m!595319 () Bool)

(assert (=> b!619850 m!595319))

(declare-fun m!595321 () Bool)

(assert (=> b!619850 m!595321))

(declare-fun m!595323 () Bool)

(assert (=> b!619850 m!595323))

(declare-fun m!595325 () Bool)

(assert (=> b!619850 m!595325))

(declare-fun m!595327 () Bool)

(assert (=> b!619850 m!595327))

(assert (=> b!619860 m!595283))

(assert (=> b!619860 m!595283))

(declare-fun m!595329 () Bool)

(assert (=> b!619860 m!595329))

(assert (=> b!619870 m!595321))

(declare-fun m!595331 () Bool)

(assert (=> b!619870 m!595331))

(assert (=> b!619870 m!595283))

(declare-fun m!595333 () Bool)

(assert (=> b!619858 m!595333))

(assert (=> b!619858 m!595283))

(assert (=> b!619858 m!595283))

(declare-fun m!595335 () Bool)

(assert (=> b!619858 m!595335))

(assert (=> b!619856 m!595321))

(declare-fun m!595337 () Bool)

(assert (=> b!619856 m!595337))

(assert (=> b!619861 m!595281))

(assert (=> b!619861 m!595283))

(assert (=> b!619861 m!595283))

(assert (=> b!619861 m!595311))

(declare-fun m!595339 () Bool)

(assert (=> b!619861 m!595339))

(assert (=> b!619861 m!595283))

(declare-fun m!595341 () Bool)

(assert (=> b!619861 m!595341))

(assert (=> b!619861 m!595283))

(declare-fun m!595343 () Bool)

(assert (=> b!619861 m!595343))

(declare-fun m!595345 () Bool)

(assert (=> b!619861 m!595345))

(assert (=> b!619861 m!595283))

(declare-fun m!595347 () Bool)

(assert (=> b!619861 m!595347))

(assert (=> b!619861 m!595293))

(check-sat (not b!619852) (not b!619851) (not b!619859) (not b!619860) (not start!56112) (not b!619873) (not b!619865) (not b!619863) (not b!619871) (not b!619850) (not b!619869) (not b!619861) (not b!619855) (not b!619858))
(check-sat)
