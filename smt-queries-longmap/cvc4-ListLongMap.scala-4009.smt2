; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54530 () Bool)

(assert start!54530)

(declare-fun b!595654 () Bool)

(declare-fun res!381512 () Bool)

(declare-fun e!340326 () Bool)

(assert (=> b!595654 (=> (not res!381512) (not e!340326))))

(declare-datatypes ((array!36990 0))(
  ( (array!36991 (arr!17759 (Array (_ BitVec 32) (_ BitVec 64))) (size!18123 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36990)

(declare-datatypes ((List!11800 0))(
  ( (Nil!11797) (Cons!11796 (h!12841 (_ BitVec 64)) (t!18028 List!11800)) )
))
(declare-fun arrayNoDuplicates!0 (array!36990 (_ BitVec 32) List!11800) Bool)

(assert (=> b!595654 (= res!381512 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11797))))

(declare-fun b!595655 () Bool)

(declare-fun res!381530 () Bool)

(declare-fun e!340331 () Bool)

(assert (=> b!595655 (=> res!381530 e!340331)))

(declare-fun contains!2935 (List!11800 (_ BitVec 64)) Bool)

(assert (=> b!595655 (= res!381530 (contains!2935 Nil!11797 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595656 () Bool)

(declare-fun res!381526 () Bool)

(declare-fun e!340330 () Bool)

(assert (=> b!595656 (=> (not res!381526) (not e!340330))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36990 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!595656 (= res!381526 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!595657 () Bool)

(declare-fun e!340328 () Bool)

(assert (=> b!595657 (= e!340328 e!340331)))

(declare-fun res!381525 () Bool)

(assert (=> b!595657 (=> res!381525 e!340331)))

(assert (=> b!595657 (= res!381525 (or (bvsge (size!18123 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18123 a!2986))))))

(declare-fun lt!270492 () array!36990)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!595657 (arrayContainsKey!0 lt!270492 (select (arr!17759 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-datatypes ((Unit!18714 0))(
  ( (Unit!18715) )
))
(declare-fun lt!270485 () Unit!18714)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36990 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18714)

(assert (=> b!595657 (= lt!270485 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270492 (select (arr!17759 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!595658 () Bool)

(declare-fun e!340325 () Bool)

(declare-fun e!340329 () Bool)

(assert (=> b!595658 (= e!340325 e!340329)))

(declare-fun res!381510 () Bool)

(assert (=> b!595658 (=> res!381510 e!340329)))

(declare-fun lt!270488 () (_ BitVec 64))

(declare-fun lt!270487 () (_ BitVec 64))

(assert (=> b!595658 (= res!381510 (or (not (= (select (arr!17759 a!2986) j!136) lt!270488)) (not (= (select (arr!17759 a!2986) j!136) lt!270487)) (bvsge j!136 index!984)))))

(declare-fun b!595659 () Bool)

(declare-fun e!340327 () Bool)

(declare-datatypes ((SeekEntryResult!6199 0))(
  ( (MissingZero!6199 (index!27044 (_ BitVec 32))) (Found!6199 (index!27045 (_ BitVec 32))) (Intermediate!6199 (undefined!7011 Bool) (index!27046 (_ BitVec 32)) (x!55843 (_ BitVec 32))) (Undefined!6199) (MissingVacant!6199 (index!27047 (_ BitVec 32))) )
))
(declare-fun lt!270489 () SeekEntryResult!6199)

(declare-fun lt!270493 () SeekEntryResult!6199)

(assert (=> b!595659 (= e!340327 (= lt!270489 lt!270493))))

(declare-fun res!381517 () Bool)

(assert (=> start!54530 (=> (not res!381517) (not e!340330))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54530 (= res!381517 (validMask!0 mask!3053))))

(assert (=> start!54530 e!340330))

(assert (=> start!54530 true))

(declare-fun array_inv!13555 (array!36990) Bool)

(assert (=> start!54530 (array_inv!13555 a!2986)))

(declare-fun b!595660 () Bool)

(declare-fun e!340335 () Bool)

(declare-fun e!340332 () Bool)

(assert (=> b!595660 (= e!340335 (not e!340332))))

(declare-fun res!381524 () Bool)

(assert (=> b!595660 (=> res!381524 e!340332)))

(declare-fun lt!270482 () SeekEntryResult!6199)

(assert (=> b!595660 (= res!381524 (not (= lt!270482 (Found!6199 index!984))))))

(declare-fun lt!270491 () Unit!18714)

(declare-fun e!340324 () Unit!18714)

(assert (=> b!595660 (= lt!270491 e!340324)))

(declare-fun c!67439 () Bool)

(assert (=> b!595660 (= c!67439 (= lt!270482 Undefined!6199))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36990 (_ BitVec 32)) SeekEntryResult!6199)

(assert (=> b!595660 (= lt!270482 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270488 lt!270492 mask!3053))))

(assert (=> b!595660 e!340327))

(declare-fun res!381515 () Bool)

(assert (=> b!595660 (=> (not res!381515) (not e!340327))))

(declare-fun lt!270484 () (_ BitVec 32))

(assert (=> b!595660 (= res!381515 (= lt!270493 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270484 vacantSpotIndex!68 lt!270488 lt!270492 mask!3053)))))

(assert (=> b!595660 (= lt!270493 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270484 vacantSpotIndex!68 (select (arr!17759 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!595660 (= lt!270488 (select (store (arr!17759 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!270490 () Unit!18714)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36990 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18714)

(assert (=> b!595660 (= lt!270490 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270484 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!595660 (= lt!270484 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!595661 () Bool)

(assert (=> b!595661 (= e!340332 e!340328)))

(declare-fun res!381528 () Bool)

(assert (=> b!595661 (=> res!381528 e!340328)))

(assert (=> b!595661 (= res!381528 (or (not (= (select (arr!17759 a!2986) j!136) lt!270488)) (not (= (select (arr!17759 a!2986) j!136) lt!270487)) (bvsge j!136 index!984)))))

(assert (=> b!595661 e!340325))

(declare-fun res!381516 () Bool)

(assert (=> b!595661 (=> (not res!381516) (not e!340325))))

(assert (=> b!595661 (= res!381516 (= lt!270487 (select (arr!17759 a!2986) j!136)))))

(assert (=> b!595661 (= lt!270487 (select (store (arr!17759 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!595662 () Bool)

(declare-fun e!340323 () Bool)

(assert (=> b!595662 (= e!340326 e!340323)))

(declare-fun res!381519 () Bool)

(assert (=> b!595662 (=> (not res!381519) (not e!340323))))

(assert (=> b!595662 (= res!381519 (= (select (store (arr!17759 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!595662 (= lt!270492 (array!36991 (store (arr!17759 a!2986) i!1108 k!1786) (size!18123 a!2986)))))

(declare-fun b!595663 () Bool)

(declare-fun e!340333 () Bool)

(assert (=> b!595663 (= e!340333 (arrayContainsKey!0 lt!270492 (select (arr!17759 a!2986) j!136) index!984))))

(declare-fun b!595664 () Bool)

(declare-fun res!381521 () Bool)

(assert (=> b!595664 (=> (not res!381521) (not e!340330))))

(assert (=> b!595664 (= res!381521 (and (= (size!18123 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18123 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18123 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!595665 () Bool)

(assert (=> b!595665 (= e!340330 e!340326)))

(declare-fun res!381518 () Bool)

(assert (=> b!595665 (=> (not res!381518) (not e!340326))))

(declare-fun lt!270486 () SeekEntryResult!6199)

(assert (=> b!595665 (= res!381518 (or (= lt!270486 (MissingZero!6199 i!1108)) (= lt!270486 (MissingVacant!6199 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36990 (_ BitVec 32)) SeekEntryResult!6199)

(assert (=> b!595665 (= lt!270486 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!595666 () Bool)

(declare-fun res!381513 () Bool)

(assert (=> b!595666 (=> res!381513 e!340331)))

(assert (=> b!595666 (= res!381513 (contains!2935 Nil!11797 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595667 () Bool)

(declare-fun res!381527 () Bool)

(assert (=> b!595667 (=> (not res!381527) (not e!340326))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36990 (_ BitVec 32)) Bool)

(assert (=> b!595667 (= res!381527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!595668 () Bool)

(declare-fun res!381511 () Bool)

(assert (=> b!595668 (=> res!381511 e!340331)))

(declare-fun noDuplicate!254 (List!11800) Bool)

(assert (=> b!595668 (= res!381511 (not (noDuplicate!254 Nil!11797)))))

(declare-fun b!595669 () Bool)

(declare-fun Unit!18716 () Unit!18714)

(assert (=> b!595669 (= e!340324 Unit!18716)))

(declare-fun b!595670 () Bool)

(declare-fun res!381529 () Bool)

(assert (=> b!595670 (=> (not res!381529) (not e!340330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!595670 (= res!381529 (validKeyInArray!0 (select (arr!17759 a!2986) j!136)))))

(declare-fun b!595671 () Bool)

(assert (=> b!595671 (= e!340329 e!340333)))

(declare-fun res!381514 () Bool)

(assert (=> b!595671 (=> (not res!381514) (not e!340333))))

(assert (=> b!595671 (= res!381514 (arrayContainsKey!0 lt!270492 (select (arr!17759 a!2986) j!136) j!136))))

(declare-fun b!595672 () Bool)

(declare-fun Unit!18717 () Unit!18714)

(assert (=> b!595672 (= e!340324 Unit!18717)))

(assert (=> b!595672 false))

(declare-fun b!595673 () Bool)

(declare-fun res!381520 () Bool)

(assert (=> b!595673 (=> (not res!381520) (not e!340330))))

(assert (=> b!595673 (= res!381520 (validKeyInArray!0 k!1786))))

(declare-fun b!595674 () Bool)

(assert (=> b!595674 (= e!340331 true)))

(declare-fun lt!270483 () Bool)

(assert (=> b!595674 (= lt!270483 (contains!2935 Nil!11797 k!1786))))

(declare-fun b!595675 () Bool)

(assert (=> b!595675 (= e!340323 e!340335)))

(declare-fun res!381523 () Bool)

(assert (=> b!595675 (=> (not res!381523) (not e!340335))))

(assert (=> b!595675 (= res!381523 (and (= lt!270489 (Found!6199 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17759 a!2986) index!984) (select (arr!17759 a!2986) j!136))) (not (= (select (arr!17759 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!595675 (= lt!270489 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17759 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!595676 () Bool)

(declare-fun res!381522 () Bool)

(assert (=> b!595676 (=> (not res!381522) (not e!340326))))

(assert (=> b!595676 (= res!381522 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17759 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!54530 res!381517) b!595664))

(assert (= (and b!595664 res!381521) b!595670))

(assert (= (and b!595670 res!381529) b!595673))

(assert (= (and b!595673 res!381520) b!595656))

(assert (= (and b!595656 res!381526) b!595665))

(assert (= (and b!595665 res!381518) b!595667))

(assert (= (and b!595667 res!381527) b!595654))

(assert (= (and b!595654 res!381512) b!595676))

(assert (= (and b!595676 res!381522) b!595662))

(assert (= (and b!595662 res!381519) b!595675))

(assert (= (and b!595675 res!381523) b!595660))

(assert (= (and b!595660 res!381515) b!595659))

(assert (= (and b!595660 c!67439) b!595672))

(assert (= (and b!595660 (not c!67439)) b!595669))

(assert (= (and b!595660 (not res!381524)) b!595661))

(assert (= (and b!595661 res!381516) b!595658))

(assert (= (and b!595658 (not res!381510)) b!595671))

(assert (= (and b!595671 res!381514) b!595663))

(assert (= (and b!595661 (not res!381528)) b!595657))

(assert (= (and b!595657 (not res!381525)) b!595668))

(assert (= (and b!595668 (not res!381511)) b!595666))

(assert (= (and b!595666 (not res!381513)) b!595655))

(assert (= (and b!595655 (not res!381530)) b!595674))

(declare-fun m!573271 () Bool)

(assert (=> b!595676 m!573271))

(declare-fun m!573273 () Bool)

(assert (=> b!595657 m!573273))

(assert (=> b!595657 m!573273))

(declare-fun m!573275 () Bool)

(assert (=> b!595657 m!573275))

(assert (=> b!595657 m!573273))

(declare-fun m!573277 () Bool)

(assert (=> b!595657 m!573277))

(declare-fun m!573279 () Bool)

(assert (=> b!595665 m!573279))

(declare-fun m!573281 () Bool)

(assert (=> b!595674 m!573281))

(assert (=> b!595658 m!573273))

(assert (=> b!595670 m!573273))

(assert (=> b!595670 m!573273))

(declare-fun m!573283 () Bool)

(assert (=> b!595670 m!573283))

(declare-fun m!573285 () Bool)

(assert (=> b!595666 m!573285))

(declare-fun m!573287 () Bool)

(assert (=> b!595654 m!573287))

(assert (=> b!595671 m!573273))

(assert (=> b!595671 m!573273))

(declare-fun m!573289 () Bool)

(assert (=> b!595671 m!573289))

(declare-fun m!573291 () Bool)

(assert (=> b!595656 m!573291))

(declare-fun m!573293 () Bool)

(assert (=> b!595660 m!573293))

(declare-fun m!573295 () Bool)

(assert (=> b!595660 m!573295))

(declare-fun m!573297 () Bool)

(assert (=> b!595660 m!573297))

(assert (=> b!595660 m!573273))

(declare-fun m!573299 () Bool)

(assert (=> b!595660 m!573299))

(declare-fun m!573301 () Bool)

(assert (=> b!595660 m!573301))

(assert (=> b!595660 m!573273))

(declare-fun m!573303 () Bool)

(assert (=> b!595660 m!573303))

(declare-fun m!573305 () Bool)

(assert (=> b!595660 m!573305))

(declare-fun m!573307 () Bool)

(assert (=> b!595667 m!573307))

(assert (=> b!595661 m!573273))

(assert (=> b!595661 m!573299))

(declare-fun m!573309 () Bool)

(assert (=> b!595661 m!573309))

(declare-fun m!573311 () Bool)

(assert (=> b!595655 m!573311))

(assert (=> b!595662 m!573299))

(declare-fun m!573313 () Bool)

(assert (=> b!595662 m!573313))

(declare-fun m!573315 () Bool)

(assert (=> start!54530 m!573315))

(declare-fun m!573317 () Bool)

(assert (=> start!54530 m!573317))

(declare-fun m!573319 () Bool)

(assert (=> b!595675 m!573319))

(assert (=> b!595675 m!573273))

(assert (=> b!595675 m!573273))

(declare-fun m!573321 () Bool)

(assert (=> b!595675 m!573321))

(assert (=> b!595663 m!573273))

(assert (=> b!595663 m!573273))

(declare-fun m!573323 () Bool)

(assert (=> b!595663 m!573323))

(declare-fun m!573325 () Bool)

(assert (=> b!595673 m!573325))

(declare-fun m!573327 () Bool)

(assert (=> b!595668 m!573327))

(push 1)

