; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56202 () Bool)

(assert start!56202)

(declare-fun b!623092 () Bool)

(declare-fun e!357379 () Bool)

(declare-fun lt!288924 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!623092 (= e!357379 (validKeyInArray!0 lt!288924))))

(declare-fun b!623093 () Bool)

(declare-fun e!357393 () Bool)

(assert (=> b!623093 (= e!357393 (not e!357379))))

(declare-fun res!401632 () Bool)

(assert (=> b!623093 (=> res!401632 e!357379)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6526 0))(
  ( (MissingZero!6526 (index!28388 (_ BitVec 32))) (Found!6526 (index!28389 (_ BitVec 32))) (Intermediate!6526 (undefined!7338 Bool) (index!28390 (_ BitVec 32)) (x!57161 (_ BitVec 32))) (Undefined!6526) (MissingVacant!6526 (index!28391 (_ BitVec 32))) )
))
(declare-fun lt!288942 () SeekEntryResult!6526)

(assert (=> b!623093 (= res!401632 (or (= lt!288942 (MissingVacant!6526 vacantSpotIndex!68)) (bvslt mask!3053 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!21006 0))(
  ( (Unit!21007) )
))
(declare-fun lt!288938 () Unit!21006)

(declare-fun e!357388 () Unit!21006)

(assert (=> b!623093 (= lt!288938 e!357388)))

(declare-fun c!71105 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!623093 (= c!71105 (= lt!288942 (Found!6526 index!984)))))

(declare-fun lt!288939 () Unit!21006)

(declare-fun e!357384 () Unit!21006)

(assert (=> b!623093 (= lt!288939 e!357384)))

(declare-fun c!71103 () Bool)

(assert (=> b!623093 (= c!71103 (= lt!288942 Undefined!6526))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!37686 0))(
  ( (array!37687 (arr!18089 (Array (_ BitVec 32) (_ BitVec 64))) (size!18454 (_ BitVec 32))) )
))
(declare-fun lt!288928 () array!37686)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37686 (_ BitVec 32)) SeekEntryResult!6526)

(assert (=> b!623093 (= lt!288942 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288924 lt!288928 mask!3053))))

(declare-fun e!357387 () Bool)

(assert (=> b!623093 e!357387))

(declare-fun res!401620 () Bool)

(assert (=> b!623093 (=> (not res!401620) (not e!357387))))

(declare-fun lt!288943 () (_ BitVec 32))

(declare-fun lt!288937 () SeekEntryResult!6526)

(assert (=> b!623093 (= res!401620 (= lt!288937 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288943 vacantSpotIndex!68 lt!288924 lt!288928 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!37686)

(assert (=> b!623093 (= lt!288937 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288943 vacantSpotIndex!68 (select (arr!18089 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!623093 (= lt!288924 (select (store (arr!18089 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!288934 () Unit!21006)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37686 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21006)

(assert (=> b!623093 (= lt!288934 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288943 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!623093 (= lt!288943 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!401635 () Bool)

(declare-fun e!357391 () Bool)

(assert (=> start!56202 (=> (not res!401635) (not e!357391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56202 (= res!401635 (validMask!0 mask!3053))))

(assert (=> start!56202 e!357391))

(assert (=> start!56202 true))

(declare-fun array_inv!13972 (array!37686) Bool)

(assert (=> start!56202 (array_inv!13972 a!2986)))

(declare-fun b!623094 () Bool)

(declare-fun e!357389 () Bool)

(declare-fun e!357382 () Bool)

(assert (=> b!623094 (= e!357389 e!357382)))

(declare-fun res!401631 () Bool)

(assert (=> b!623094 (=> (not res!401631) (not e!357382))))

(assert (=> b!623094 (= res!401631 (= (select (store (arr!18089 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!623094 (= lt!288928 (array!37687 (store (arr!18089 a!2986) i!1108 k0!1786) (size!18454 a!2986)))))

(declare-fun b!623095 () Bool)

(declare-fun e!357383 () Unit!21006)

(declare-fun Unit!21008 () Unit!21006)

(assert (=> b!623095 (= e!357383 Unit!21008)))

(declare-fun b!623096 () Bool)

(declare-fun res!401623 () Bool)

(assert (=> b!623096 (= res!401623 (bvsge j!136 index!984))))

(declare-fun e!357386 () Bool)

(assert (=> b!623096 (=> res!401623 e!357386)))

(declare-fun e!357392 () Bool)

(assert (=> b!623096 (= e!357392 e!357386)))

(declare-fun b!623097 () Bool)

(declare-fun res!401633 () Bool)

(assert (=> b!623097 (=> (not res!401633) (not e!357389))))

(assert (=> b!623097 (= res!401633 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18089 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!623098 () Bool)

(assert (=> b!623098 (= e!357382 e!357393)))

(declare-fun res!401630 () Bool)

(assert (=> b!623098 (=> (not res!401630) (not e!357393))))

(declare-fun lt!288933 () SeekEntryResult!6526)

(assert (=> b!623098 (= res!401630 (and (= lt!288933 (Found!6526 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18089 a!2986) index!984) (select (arr!18089 a!2986) j!136))) (not (= (select (arr!18089 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!623098 (= lt!288933 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18089 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!623099 () Bool)

(declare-fun e!357390 () Bool)

(declare-fun arrayContainsKey!0 (array!37686 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!623099 (= e!357390 (arrayContainsKey!0 lt!288928 (select (arr!18089 a!2986) j!136) index!984))))

(declare-fun b!623100 () Bool)

(declare-fun res!401621 () Bool)

(assert (=> b!623100 (=> (not res!401621) (not e!357391))))

(assert (=> b!623100 (= res!401621 (and (= (size!18454 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18454 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18454 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!623101 () Bool)

(assert (=> b!623101 (= e!357391 e!357389)))

(declare-fun res!401629 () Bool)

(assert (=> b!623101 (=> (not res!401629) (not e!357389))))

(declare-fun lt!288941 () SeekEntryResult!6526)

(assert (=> b!623101 (= res!401629 (or (= lt!288941 (MissingZero!6526 i!1108)) (= lt!288941 (MissingVacant!6526 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37686 (_ BitVec 32)) SeekEntryResult!6526)

(assert (=> b!623101 (= lt!288941 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!623102 () Bool)

(declare-fun res!401628 () Bool)

(assert (=> b!623102 (=> (not res!401628) (not e!357391))))

(assert (=> b!623102 (= res!401628 (validKeyInArray!0 k0!1786))))

(declare-fun b!623103 () Bool)

(assert (=> b!623103 false))

(declare-fun lt!288940 () Unit!21006)

(declare-datatypes ((List!12169 0))(
  ( (Nil!12166) (Cons!12165 (h!13210 (_ BitVec 64)) (t!18388 List!12169)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37686 (_ BitVec 64) (_ BitVec 32) List!12169) Unit!21006)

(assert (=> b!623103 (= lt!288940 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288928 (select (arr!18089 a!2986) j!136) j!136 Nil!12166))))

(declare-fun arrayNoDuplicates!0 (array!37686 (_ BitVec 32) List!12169) Bool)

(assert (=> b!623103 (arrayNoDuplicates!0 lt!288928 j!136 Nil!12166)))

(declare-fun lt!288926 () Unit!21006)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37686 (_ BitVec 32) (_ BitVec 32)) Unit!21006)

(assert (=> b!623103 (= lt!288926 (lemmaNoDuplicateFromThenFromBigger!0 lt!288928 #b00000000000000000000000000000000 j!136))))

(assert (=> b!623103 (arrayNoDuplicates!0 lt!288928 #b00000000000000000000000000000000 Nil!12166)))

(declare-fun lt!288936 () Unit!21006)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37686 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12169) Unit!21006)

(assert (=> b!623103 (= lt!288936 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12166))))

(assert (=> b!623103 (arrayContainsKey!0 lt!288928 (select (arr!18089 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288935 () Unit!21006)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37686 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21006)

(assert (=> b!623103 (= lt!288935 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288928 (select (arr!18089 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!357385 () Unit!21006)

(declare-fun Unit!21009 () Unit!21006)

(assert (=> b!623103 (= e!357385 Unit!21009)))

(declare-fun b!623104 () Bool)

(declare-fun Unit!21010 () Unit!21006)

(assert (=> b!623104 (= e!357384 Unit!21010)))

(assert (=> b!623104 false))

(declare-fun b!623105 () Bool)

(declare-fun res!401624 () Bool)

(assert (=> b!623105 (=> (not res!401624) (not e!357389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37686 (_ BitVec 32)) Bool)

(assert (=> b!623105 (= res!401624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!623106 () Bool)

(assert (=> b!623106 false))

(declare-fun lt!288932 () Unit!21006)

(assert (=> b!623106 (= lt!288932 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288928 (select (arr!18089 a!2986) j!136) index!984 Nil!12166))))

(assert (=> b!623106 (arrayNoDuplicates!0 lt!288928 index!984 Nil!12166)))

(declare-fun lt!288925 () Unit!21006)

(assert (=> b!623106 (= lt!288925 (lemmaNoDuplicateFromThenFromBigger!0 lt!288928 #b00000000000000000000000000000000 index!984))))

(assert (=> b!623106 (arrayNoDuplicates!0 lt!288928 #b00000000000000000000000000000000 Nil!12166)))

(declare-fun lt!288927 () Unit!21006)

(assert (=> b!623106 (= lt!288927 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12166))))

(assert (=> b!623106 (arrayContainsKey!0 lt!288928 (select (arr!18089 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288930 () Unit!21006)

(assert (=> b!623106 (= lt!288930 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288928 (select (arr!18089 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!623106 e!357390))

(declare-fun res!401634 () Bool)

(assert (=> b!623106 (=> (not res!401634) (not e!357390))))

(assert (=> b!623106 (= res!401634 (arrayContainsKey!0 lt!288928 (select (arr!18089 a!2986) j!136) j!136))))

(declare-fun Unit!21011 () Unit!21006)

(assert (=> b!623106 (= e!357383 Unit!21011)))

(declare-fun b!623107 () Bool)

(assert (=> b!623107 (= e!357387 (= lt!288933 lt!288937))))

(declare-fun b!623108 () Bool)

(declare-fun res!401622 () Bool)

(assert (=> b!623108 (=> (not res!401622) (not e!357389))))

(assert (=> b!623108 (= res!401622 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12166))))

(declare-fun b!623109 () Bool)

(declare-fun Unit!21012 () Unit!21006)

(assert (=> b!623109 (= e!357388 Unit!21012)))

(declare-fun res!401625 () Bool)

(assert (=> b!623109 (= res!401625 (= (select (store (arr!18089 a!2986) i!1108 k0!1786) index!984) (select (arr!18089 a!2986) j!136)))))

(assert (=> b!623109 (=> (not res!401625) (not e!357392))))

(assert (=> b!623109 e!357392))

(declare-fun c!71104 () Bool)

(assert (=> b!623109 (= c!71104 (bvslt j!136 index!984))))

(declare-fun lt!288931 () Unit!21006)

(assert (=> b!623109 (= lt!288931 e!357385)))

(declare-fun c!71106 () Bool)

(assert (=> b!623109 (= c!71106 (bvslt index!984 j!136))))

(declare-fun lt!288929 () Unit!21006)

(assert (=> b!623109 (= lt!288929 e!357383)))

(assert (=> b!623109 false))

(declare-fun b!623110 () Bool)

(declare-fun Unit!21013 () Unit!21006)

(assert (=> b!623110 (= e!357384 Unit!21013)))

(declare-fun b!623111 () Bool)

(declare-fun res!401636 () Bool)

(assert (=> b!623111 (= res!401636 (arrayContainsKey!0 lt!288928 (select (arr!18089 a!2986) j!136) j!136))))

(declare-fun e!357380 () Bool)

(assert (=> b!623111 (=> (not res!401636) (not e!357380))))

(assert (=> b!623111 (= e!357386 e!357380)))

(declare-fun b!623112 () Bool)

(assert (=> b!623112 (= e!357380 (arrayContainsKey!0 lt!288928 (select (arr!18089 a!2986) j!136) index!984))))

(declare-fun b!623113 () Bool)

(declare-fun Unit!21014 () Unit!21006)

(assert (=> b!623113 (= e!357388 Unit!21014)))

(declare-fun b!623114 () Bool)

(declare-fun Unit!21015 () Unit!21006)

(assert (=> b!623114 (= e!357385 Unit!21015)))

(declare-fun b!623115 () Bool)

(declare-fun res!401626 () Bool)

(assert (=> b!623115 (=> (not res!401626) (not e!357391))))

(assert (=> b!623115 (= res!401626 (validKeyInArray!0 (select (arr!18089 a!2986) j!136)))))

(declare-fun b!623116 () Bool)

(declare-fun res!401627 () Bool)

(assert (=> b!623116 (=> (not res!401627) (not e!357391))))

(assert (=> b!623116 (= res!401627 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56202 res!401635) b!623100))

(assert (= (and b!623100 res!401621) b!623115))

(assert (= (and b!623115 res!401626) b!623102))

(assert (= (and b!623102 res!401628) b!623116))

(assert (= (and b!623116 res!401627) b!623101))

(assert (= (and b!623101 res!401629) b!623105))

(assert (= (and b!623105 res!401624) b!623108))

(assert (= (and b!623108 res!401622) b!623097))

(assert (= (and b!623097 res!401633) b!623094))

(assert (= (and b!623094 res!401631) b!623098))

(assert (= (and b!623098 res!401630) b!623093))

(assert (= (and b!623093 res!401620) b!623107))

(assert (= (and b!623093 c!71103) b!623104))

(assert (= (and b!623093 (not c!71103)) b!623110))

(assert (= (and b!623093 c!71105) b!623109))

(assert (= (and b!623093 (not c!71105)) b!623113))

(assert (= (and b!623109 res!401625) b!623096))

(assert (= (and b!623096 (not res!401623)) b!623111))

(assert (= (and b!623111 res!401636) b!623112))

(assert (= (and b!623109 c!71104) b!623103))

(assert (= (and b!623109 (not c!71104)) b!623114))

(assert (= (and b!623109 c!71106) b!623106))

(assert (= (and b!623109 (not c!71106)) b!623095))

(assert (= (and b!623106 res!401634) b!623099))

(assert (= (and b!623093 (not res!401632)) b!623092))

(declare-fun m!598429 () Bool)

(assert (=> b!623115 m!598429))

(assert (=> b!623115 m!598429))

(declare-fun m!598431 () Bool)

(assert (=> b!623115 m!598431))

(assert (=> b!623111 m!598429))

(assert (=> b!623111 m!598429))

(declare-fun m!598433 () Bool)

(assert (=> b!623111 m!598433))

(declare-fun m!598435 () Bool)

(assert (=> b!623094 m!598435))

(declare-fun m!598437 () Bool)

(assert (=> b!623094 m!598437))

(declare-fun m!598439 () Bool)

(assert (=> b!623108 m!598439))

(declare-fun m!598441 () Bool)

(assert (=> b!623097 m!598441))

(declare-fun m!598443 () Bool)

(assert (=> b!623093 m!598443))

(declare-fun m!598445 () Bool)

(assert (=> b!623093 m!598445))

(assert (=> b!623093 m!598429))

(assert (=> b!623093 m!598435))

(declare-fun m!598447 () Bool)

(assert (=> b!623093 m!598447))

(assert (=> b!623093 m!598429))

(declare-fun m!598449 () Bool)

(assert (=> b!623093 m!598449))

(declare-fun m!598451 () Bool)

(assert (=> b!623093 m!598451))

(declare-fun m!598453 () Bool)

(assert (=> b!623093 m!598453))

(declare-fun m!598455 () Bool)

(assert (=> b!623092 m!598455))

(declare-fun m!598457 () Bool)

(assert (=> start!56202 m!598457))

(declare-fun m!598459 () Bool)

(assert (=> start!56202 m!598459))

(assert (=> b!623109 m!598435))

(declare-fun m!598461 () Bool)

(assert (=> b!623109 m!598461))

(assert (=> b!623109 m!598429))

(declare-fun m!598463 () Bool)

(assert (=> b!623098 m!598463))

(assert (=> b!623098 m!598429))

(assert (=> b!623098 m!598429))

(declare-fun m!598465 () Bool)

(assert (=> b!623098 m!598465))

(declare-fun m!598467 () Bool)

(assert (=> b!623106 m!598467))

(declare-fun m!598469 () Bool)

(assert (=> b!623106 m!598469))

(assert (=> b!623106 m!598429))

(declare-fun m!598471 () Bool)

(assert (=> b!623106 m!598471))

(assert (=> b!623106 m!598429))

(declare-fun m!598473 () Bool)

(assert (=> b!623106 m!598473))

(assert (=> b!623106 m!598429))

(assert (=> b!623106 m!598433))

(declare-fun m!598475 () Bool)

(assert (=> b!623106 m!598475))

(assert (=> b!623106 m!598429))

(declare-fun m!598477 () Bool)

(assert (=> b!623106 m!598477))

(assert (=> b!623106 m!598429))

(declare-fun m!598479 () Bool)

(assert (=> b!623106 m!598479))

(declare-fun m!598481 () Bool)

(assert (=> b!623105 m!598481))

(assert (=> b!623099 m!598429))

(assert (=> b!623099 m!598429))

(declare-fun m!598483 () Bool)

(assert (=> b!623099 m!598483))

(declare-fun m!598485 () Bool)

(assert (=> b!623101 m!598485))

(declare-fun m!598487 () Bool)

(assert (=> b!623116 m!598487))

(assert (=> b!623103 m!598429))

(assert (=> b!623103 m!598429))

(declare-fun m!598489 () Bool)

(assert (=> b!623103 m!598489))

(assert (=> b!623103 m!598429))

(declare-fun m!598491 () Bool)

(assert (=> b!623103 m!598491))

(assert (=> b!623103 m!598429))

(declare-fun m!598493 () Bool)

(assert (=> b!623103 m!598493))

(declare-fun m!598495 () Bool)

(assert (=> b!623103 m!598495))

(assert (=> b!623103 m!598475))

(declare-fun m!598497 () Bool)

(assert (=> b!623103 m!598497))

(assert (=> b!623103 m!598471))

(assert (=> b!623112 m!598429))

(assert (=> b!623112 m!598429))

(assert (=> b!623112 m!598483))

(declare-fun m!598499 () Bool)

(assert (=> b!623102 m!598499))

(check-sat (not b!623098) (not b!623115) (not start!56202) (not b!623099) (not b!623102) (not b!623106) (not b!623111) (not b!623116) (not b!623112) (not b!623093) (not b!623101) (not b!623105) (not b!623108) (not b!623103) (not b!623092))
(check-sat)
