; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58982 () Bool)

(assert start!58982)

(declare-fun b!650684 () Bool)

(declare-fun e!373327 () Bool)

(declare-fun e!373329 () Bool)

(assert (=> b!650684 (= e!373327 (not e!373329))))

(declare-fun res!421925 () Bool)

(assert (=> b!650684 (=> res!421925 e!373329)))

(declare-datatypes ((SeekEntryResult!6928 0))(
  ( (MissingZero!6928 (index!30062 (_ BitVec 32))) (Found!6928 (index!30063 (_ BitVec 32))) (Intermediate!6928 (undefined!7740 Bool) (index!30064 (_ BitVec 32)) (x!58857 (_ BitVec 32))) (Undefined!6928) (MissingVacant!6928 (index!30065 (_ BitVec 32))) )
))
(declare-fun lt!302351 () SeekEntryResult!6928)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!650684 (= res!421925 (not (= lt!302351 (Found!6928 index!984))))))

(declare-datatypes ((Unit!22196 0))(
  ( (Unit!22197) )
))
(declare-fun lt!302343 () Unit!22196)

(declare-fun e!373323 () Unit!22196)

(assert (=> b!650684 (= lt!302343 e!373323)))

(declare-fun c!74748 () Bool)

(assert (=> b!650684 (= c!74748 (= lt!302351 Undefined!6928))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!302350 () (_ BitVec 64))

(declare-datatypes ((array!38574 0))(
  ( (array!38575 (arr!18491 (Array (_ BitVec 32) (_ BitVec 64))) (size!18856 (_ BitVec 32))) )
))
(declare-fun lt!302354 () array!38574)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38574 (_ BitVec 32)) SeekEntryResult!6928)

(assert (=> b!650684 (= lt!302351 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302350 lt!302354 mask!3053))))

(declare-fun e!373322 () Bool)

(assert (=> b!650684 e!373322))

(declare-fun res!421926 () Bool)

(assert (=> b!650684 (=> (not res!421926) (not e!373322))))

(declare-fun lt!302344 () SeekEntryResult!6928)

(declare-fun lt!302352 () (_ BitVec 32))

(assert (=> b!650684 (= res!421926 (= lt!302344 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302352 vacantSpotIndex!68 lt!302350 lt!302354 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38574)

(assert (=> b!650684 (= lt!302344 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302352 vacantSpotIndex!68 (select (arr!18491 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!650684 (= lt!302350 (select (store (arr!18491 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!302347 () Unit!22196)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38574 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22196)

(assert (=> b!650684 (= lt!302347 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302352 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!650684 (= lt!302352 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!650685 () Bool)

(declare-fun e!373325 () Bool)

(declare-fun arrayContainsKey!0 (array!38574 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!650685 (= e!373325 (arrayContainsKey!0 lt!302354 (select (arr!18491 a!2986) j!136) index!984))))

(declare-fun res!421938 () Bool)

(declare-fun e!373324 () Bool)

(assert (=> start!58982 (=> (not res!421938) (not e!373324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58982 (= res!421938 (validMask!0 mask!3053))))

(assert (=> start!58982 e!373324))

(assert (=> start!58982 true))

(declare-fun array_inv!14374 (array!38574) Bool)

(assert (=> start!58982 (array_inv!14374 a!2986)))

(declare-fun b!650686 () Bool)

(declare-fun e!373318 () Bool)

(declare-fun e!373317 () Bool)

(assert (=> b!650686 (= e!373318 e!373317)))

(declare-fun res!421924 () Bool)

(assert (=> b!650686 (=> (not res!421924) (not e!373317))))

(assert (=> b!650686 (= res!421924 (arrayContainsKey!0 lt!302354 (select (arr!18491 a!2986) j!136) j!136))))

(declare-fun b!650687 () Bool)

(declare-fun e!373330 () Bool)

(assert (=> b!650687 (= e!373324 e!373330)))

(declare-fun res!421940 () Bool)

(assert (=> b!650687 (=> (not res!421940) (not e!373330))))

(declare-fun lt!302342 () SeekEntryResult!6928)

(assert (=> b!650687 (= res!421940 (or (= lt!302342 (MissingZero!6928 i!1108)) (= lt!302342 (MissingVacant!6928 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38574 (_ BitVec 32)) SeekEntryResult!6928)

(assert (=> b!650687 (= lt!302342 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!650688 () Bool)

(declare-fun res!421942 () Bool)

(assert (=> b!650688 (=> (not res!421942) (not e!373324))))

(assert (=> b!650688 (= res!421942 (and (= (size!18856 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18856 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18856 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!650689 () Bool)

(declare-fun lt!302349 () SeekEntryResult!6928)

(assert (=> b!650689 (= e!373322 (= lt!302349 lt!302344))))

(declare-fun b!650690 () Bool)

(declare-fun e!373321 () Bool)

(assert (=> b!650690 (= e!373330 e!373321)))

(declare-fun res!421941 () Bool)

(assert (=> b!650690 (=> (not res!421941) (not e!373321))))

(assert (=> b!650690 (= res!421941 (= (select (store (arr!18491 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650690 (= lt!302354 (array!38575 (store (arr!18491 a!2986) i!1108 k0!1786) (size!18856 a!2986)))))

(declare-fun b!650691 () Bool)

(declare-fun res!421933 () Bool)

(assert (=> b!650691 (=> (not res!421933) (not e!373330))))

(assert (=> b!650691 (= res!421933 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18491 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!650692 () Bool)

(declare-fun Unit!22198 () Unit!22196)

(assert (=> b!650692 (= e!373323 Unit!22198)))

(assert (=> b!650692 false))

(declare-fun b!650693 () Bool)

(declare-fun res!421935 () Bool)

(assert (=> b!650693 (=> (not res!421935) (not e!373324))))

(assert (=> b!650693 (= res!421935 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!650694 () Bool)

(declare-fun res!421932 () Bool)

(assert (=> b!650694 (=> (not res!421932) (not e!373330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38574 (_ BitVec 32)) Bool)

(assert (=> b!650694 (= res!421932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!650695 () Bool)

(declare-fun Unit!22199 () Unit!22196)

(assert (=> b!650695 (= e!373323 Unit!22199)))

(declare-fun b!650696 () Bool)

(assert (=> b!650696 (= e!373317 (arrayContainsKey!0 lt!302354 (select (arr!18491 a!2986) j!136) index!984))))

(declare-fun b!650697 () Bool)

(declare-fun e!373319 () Bool)

(declare-fun e!373320 () Bool)

(assert (=> b!650697 (= e!373319 e!373320)))

(declare-fun res!421929 () Bool)

(assert (=> b!650697 (=> res!421929 e!373320)))

(assert (=> b!650697 (= res!421929 (bvsge index!984 j!136))))

(declare-fun lt!302355 () Unit!22196)

(declare-fun e!373331 () Unit!22196)

(assert (=> b!650697 (= lt!302355 e!373331)))

(declare-fun c!74747 () Bool)

(assert (=> b!650697 (= c!74747 (bvslt j!136 index!984))))

(declare-fun b!650698 () Bool)

(declare-fun res!421930 () Bool)

(assert (=> b!650698 (=> (not res!421930) (not e!373330))))

(declare-datatypes ((List!12571 0))(
  ( (Nil!12568) (Cons!12567 (h!13612 (_ BitVec 64)) (t!18790 List!12571)) )
))
(declare-fun arrayNoDuplicates!0 (array!38574 (_ BitVec 32) List!12571) Bool)

(assert (=> b!650698 (= res!421930 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12568))))

(declare-fun b!650699 () Bool)

(declare-fun res!421939 () Bool)

(assert (=> b!650699 (=> (not res!421939) (not e!373324))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!650699 (= res!421939 (validKeyInArray!0 k0!1786))))

(declare-fun b!650700 () Bool)

(assert (=> b!650700 (= e!373329 e!373319)))

(declare-fun res!421937 () Bool)

(assert (=> b!650700 (=> res!421937 e!373319)))

(declare-fun lt!302346 () (_ BitVec 64))

(assert (=> b!650700 (= res!421937 (or (not (= (select (arr!18491 a!2986) j!136) lt!302350)) (not (= (select (arr!18491 a!2986) j!136) lt!302346))))))

(declare-fun e!373326 () Bool)

(assert (=> b!650700 e!373326))

(declare-fun res!421931 () Bool)

(assert (=> b!650700 (=> (not res!421931) (not e!373326))))

(assert (=> b!650700 (= res!421931 (= lt!302346 (select (arr!18491 a!2986) j!136)))))

(assert (=> b!650700 (= lt!302346 (select (store (arr!18491 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!650701 () Bool)

(declare-fun Unit!22200 () Unit!22196)

(assert (=> b!650701 (= e!373331 Unit!22200)))

(declare-fun b!650702 () Bool)

(assert (=> b!650702 (= e!373321 e!373327)))

(declare-fun res!421928 () Bool)

(assert (=> b!650702 (=> (not res!421928) (not e!373327))))

(assert (=> b!650702 (= res!421928 (and (= lt!302349 (Found!6928 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18491 a!2986) index!984) (select (arr!18491 a!2986) j!136))) (not (= (select (arr!18491 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!650702 (= lt!302349 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18491 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!650703 () Bool)

(declare-fun Unit!22201 () Unit!22196)

(assert (=> b!650703 (= e!373331 Unit!22201)))

(declare-fun lt!302353 () Unit!22196)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38574 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22196)

(assert (=> b!650703 (= lt!302353 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302354 (select (arr!18491 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!650703 (arrayContainsKey!0 lt!302354 (select (arr!18491 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!302341 () Unit!22196)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38574 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12571) Unit!22196)

(assert (=> b!650703 (= lt!302341 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12568))))

(assert (=> b!650703 (arrayNoDuplicates!0 lt!302354 #b00000000000000000000000000000000 Nil!12568)))

(declare-fun lt!302345 () Unit!22196)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38574 (_ BitVec 32) (_ BitVec 32)) Unit!22196)

(assert (=> b!650703 (= lt!302345 (lemmaNoDuplicateFromThenFromBigger!0 lt!302354 #b00000000000000000000000000000000 j!136))))

(assert (=> b!650703 (arrayNoDuplicates!0 lt!302354 j!136 Nil!12568)))

(declare-fun lt!302340 () Unit!22196)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38574 (_ BitVec 64) (_ BitVec 32) List!12571) Unit!22196)

(assert (=> b!650703 (= lt!302340 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302354 (select (arr!18491 a!2986) j!136) j!136 Nil!12568))))

(assert (=> b!650703 false))

(declare-fun b!650704 () Bool)

(assert (=> b!650704 (= e!373320 true)))

(assert (=> b!650704 (arrayNoDuplicates!0 lt!302354 #b00000000000000000000000000000000 Nil!12568)))

(declare-fun lt!302348 () Unit!22196)

(assert (=> b!650704 (= lt!302348 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12568))))

(assert (=> b!650704 (arrayContainsKey!0 lt!302354 (select (arr!18491 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302339 () Unit!22196)

(assert (=> b!650704 (= lt!302339 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302354 (select (arr!18491 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!650704 e!373325))

(declare-fun res!421927 () Bool)

(assert (=> b!650704 (=> (not res!421927) (not e!373325))))

(assert (=> b!650704 (= res!421927 (arrayContainsKey!0 lt!302354 (select (arr!18491 a!2986) j!136) j!136))))

(declare-fun b!650705 () Bool)

(assert (=> b!650705 (= e!373326 e!373318)))

(declare-fun res!421934 () Bool)

(assert (=> b!650705 (=> res!421934 e!373318)))

(assert (=> b!650705 (= res!421934 (or (not (= (select (arr!18491 a!2986) j!136) lt!302350)) (not (= (select (arr!18491 a!2986) j!136) lt!302346)) (bvsge j!136 index!984)))))

(declare-fun b!650706 () Bool)

(declare-fun res!421936 () Bool)

(assert (=> b!650706 (=> (not res!421936) (not e!373324))))

(assert (=> b!650706 (= res!421936 (validKeyInArray!0 (select (arr!18491 a!2986) j!136)))))

(assert (= (and start!58982 res!421938) b!650688))

(assert (= (and b!650688 res!421942) b!650706))

(assert (= (and b!650706 res!421936) b!650699))

(assert (= (and b!650699 res!421939) b!650693))

(assert (= (and b!650693 res!421935) b!650687))

(assert (= (and b!650687 res!421940) b!650694))

(assert (= (and b!650694 res!421932) b!650698))

(assert (= (and b!650698 res!421930) b!650691))

(assert (= (and b!650691 res!421933) b!650690))

(assert (= (and b!650690 res!421941) b!650702))

(assert (= (and b!650702 res!421928) b!650684))

(assert (= (and b!650684 res!421926) b!650689))

(assert (= (and b!650684 c!74748) b!650692))

(assert (= (and b!650684 (not c!74748)) b!650695))

(assert (= (and b!650684 (not res!421925)) b!650700))

(assert (= (and b!650700 res!421931) b!650705))

(assert (= (and b!650705 (not res!421934)) b!650686))

(assert (= (and b!650686 res!421924) b!650696))

(assert (= (and b!650700 (not res!421937)) b!650697))

(assert (= (and b!650697 c!74747) b!650703))

(assert (= (and b!650697 (not c!74747)) b!650701))

(assert (= (and b!650697 (not res!421929)) b!650704))

(assert (= (and b!650704 res!421927) b!650685))

(declare-fun m!623361 () Bool)

(assert (=> b!650700 m!623361))

(declare-fun m!623363 () Bool)

(assert (=> b!650700 m!623363))

(declare-fun m!623365 () Bool)

(assert (=> b!650700 m!623365))

(declare-fun m!623367 () Bool)

(assert (=> start!58982 m!623367))

(declare-fun m!623369 () Bool)

(assert (=> start!58982 m!623369))

(assert (=> b!650690 m!623363))

(declare-fun m!623371 () Bool)

(assert (=> b!650690 m!623371))

(assert (=> b!650685 m!623361))

(assert (=> b!650685 m!623361))

(declare-fun m!623373 () Bool)

(assert (=> b!650685 m!623373))

(declare-fun m!623375 () Bool)

(assert (=> b!650694 m!623375))

(declare-fun m!623377 () Bool)

(assert (=> b!650691 m!623377))

(assert (=> b!650705 m!623361))

(assert (=> b!650696 m!623361))

(assert (=> b!650696 m!623361))

(assert (=> b!650696 m!623373))

(declare-fun m!623379 () Bool)

(assert (=> b!650699 m!623379))

(declare-fun m!623381 () Bool)

(assert (=> b!650698 m!623381))

(assert (=> b!650704 m!623361))

(declare-fun m!623383 () Bool)

(assert (=> b!650704 m!623383))

(assert (=> b!650704 m!623361))

(assert (=> b!650704 m!623361))

(declare-fun m!623385 () Bool)

(assert (=> b!650704 m!623385))

(assert (=> b!650704 m!623361))

(declare-fun m!623387 () Bool)

(assert (=> b!650704 m!623387))

(declare-fun m!623389 () Bool)

(assert (=> b!650704 m!623389))

(declare-fun m!623391 () Bool)

(assert (=> b!650704 m!623391))

(declare-fun m!623393 () Bool)

(assert (=> b!650687 m!623393))

(declare-fun m!623395 () Bool)

(assert (=> b!650702 m!623395))

(assert (=> b!650702 m!623361))

(assert (=> b!650702 m!623361))

(declare-fun m!623397 () Bool)

(assert (=> b!650702 m!623397))

(declare-fun m!623399 () Bool)

(assert (=> b!650693 m!623399))

(assert (=> b!650706 m!623361))

(assert (=> b!650706 m!623361))

(declare-fun m!623401 () Bool)

(assert (=> b!650706 m!623401))

(declare-fun m!623403 () Bool)

(assert (=> b!650684 m!623403))

(declare-fun m!623405 () Bool)

(assert (=> b!650684 m!623405))

(declare-fun m!623407 () Bool)

(assert (=> b!650684 m!623407))

(assert (=> b!650684 m!623361))

(assert (=> b!650684 m!623363))

(declare-fun m!623409 () Bool)

(assert (=> b!650684 m!623409))

(assert (=> b!650684 m!623361))

(declare-fun m!623411 () Bool)

(assert (=> b!650684 m!623411))

(declare-fun m!623413 () Bool)

(assert (=> b!650684 m!623413))

(declare-fun m!623415 () Bool)

(assert (=> b!650703 m!623415))

(assert (=> b!650703 m!623361))

(declare-fun m!623417 () Bool)

(assert (=> b!650703 m!623417))

(assert (=> b!650703 m!623361))

(declare-fun m!623419 () Bool)

(assert (=> b!650703 m!623419))

(assert (=> b!650703 m!623361))

(declare-fun m!623421 () Bool)

(assert (=> b!650703 m!623421))

(assert (=> b!650703 m!623361))

(declare-fun m!623423 () Bool)

(assert (=> b!650703 m!623423))

(assert (=> b!650703 m!623389))

(assert (=> b!650703 m!623391))

(assert (=> b!650686 m!623361))

(assert (=> b!650686 m!623361))

(assert (=> b!650686 m!623385))

(check-sat (not b!650706) (not b!650704) (not b!650685) (not b!650694) (not b!650684) (not b!650702) (not b!650696) (not b!650687) (not b!650698) (not b!650699) (not b!650703) (not b!650693) (not start!58982) (not b!650686))
(check-sat)
