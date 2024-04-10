; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58134 () Bool)

(assert start!58134)

(declare-fun b!642545 () Bool)

(declare-fun res!416263 () Bool)

(declare-fun e!367988 () Bool)

(assert (=> b!642545 (=> (not res!416263) (not e!367988))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38393 0))(
  ( (array!38394 (arr!18413 (Array (_ BitVec 32) (_ BitVec 64))) (size!18777 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38393)

(assert (=> b!642545 (= res!416263 (and (= (size!18777 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18777 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18777 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!642546 () Bool)

(declare-fun res!416264 () Bool)

(assert (=> b!642546 (=> (not res!416264) (not e!367988))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!642546 (= res!416264 (validKeyInArray!0 (select (arr!18413 a!2986) j!136)))))

(declare-fun b!642547 () Bool)

(declare-fun e!367987 () Bool)

(declare-fun e!367989 () Bool)

(assert (=> b!642547 (= e!367987 e!367989)))

(declare-fun res!416267 () Bool)

(assert (=> b!642547 (=> res!416267 e!367989)))

(declare-fun lt!297601 () (_ BitVec 64))

(declare-fun lt!297594 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!642547 (= res!416267 (or (not (= (select (arr!18413 a!2986) j!136) lt!297594)) (not (= (select (arr!18413 a!2986) j!136) lt!297601)) (bvsge j!136 index!984)))))

(declare-fun e!367983 () Bool)

(assert (=> b!642547 e!367983))

(declare-fun res!416266 () Bool)

(assert (=> b!642547 (=> (not res!416266) (not e!367983))))

(assert (=> b!642547 (= res!416266 (= lt!297601 (select (arr!18413 a!2986) j!136)))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!642547 (= lt!297601 (select (store (arr!18413 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!642548 () Bool)

(declare-fun e!367985 () Bool)

(declare-fun e!367980 () Bool)

(assert (=> b!642548 (= e!367985 e!367980)))

(declare-fun res!416265 () Bool)

(assert (=> b!642548 (=> (not res!416265) (not e!367980))))

(declare-fun lt!297596 () array!38393)

(declare-fun arrayContainsKey!0 (array!38393 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!642548 (= res!416265 (arrayContainsKey!0 lt!297596 (select (arr!18413 a!2986) j!136) j!136))))

(declare-fun b!642550 () Bool)

(assert (=> b!642550 (= e!367983 e!367985)))

(declare-fun res!416253 () Bool)

(assert (=> b!642550 (=> res!416253 e!367985)))

(assert (=> b!642550 (= res!416253 (or (not (= (select (arr!18413 a!2986) j!136) lt!297594)) (not (= (select (arr!18413 a!2986) j!136) lt!297601)) (bvsge j!136 index!984)))))

(declare-fun b!642551 () Bool)

(declare-fun e!367979 () Bool)

(declare-fun e!367984 () Bool)

(assert (=> b!642551 (= e!367979 e!367984)))

(declare-fun res!416261 () Bool)

(assert (=> b!642551 (=> (not res!416261) (not e!367984))))

(declare-datatypes ((SeekEntryResult!6853 0))(
  ( (MissingZero!6853 (index!29738 (_ BitVec 32))) (Found!6853 (index!29739 (_ BitVec 32))) (Intermediate!6853 (undefined!7665 Bool) (index!29740 (_ BitVec 32)) (x!58499 (_ BitVec 32))) (Undefined!6853) (MissingVacant!6853 (index!29741 (_ BitVec 32))) )
))
(declare-fun lt!297599 () SeekEntryResult!6853)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!642551 (= res!416261 (and (= lt!297599 (Found!6853 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18413 a!2986) index!984) (select (arr!18413 a!2986) j!136))) (not (= (select (arr!18413 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38393 (_ BitVec 32)) SeekEntryResult!6853)

(assert (=> b!642551 (= lt!297599 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18413 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!642552 () Bool)

(declare-fun res!416257 () Bool)

(assert (=> b!642552 (=> (not res!416257) (not e!367988))))

(assert (=> b!642552 (= res!416257 (validKeyInArray!0 k!1786))))

(declare-fun b!642553 () Bool)

(declare-fun res!416260 () Bool)

(declare-fun e!367978 () Bool)

(assert (=> b!642553 (=> (not res!416260) (not e!367978))))

(assert (=> b!642553 (= res!416260 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18413 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!642554 () Bool)

(declare-datatypes ((Unit!21746 0))(
  ( (Unit!21747) )
))
(declare-fun e!367982 () Unit!21746)

(declare-fun Unit!21748 () Unit!21746)

(assert (=> b!642554 (= e!367982 Unit!21748)))

(declare-fun b!642555 () Bool)

(declare-fun Unit!21749 () Unit!21746)

(assert (=> b!642555 (= e!367982 Unit!21749)))

(assert (=> b!642555 false))

(declare-fun b!642556 () Bool)

(assert (=> b!642556 (= e!367978 e!367979)))

(declare-fun res!416258 () Bool)

(assert (=> b!642556 (=> (not res!416258) (not e!367979))))

(assert (=> b!642556 (= res!416258 (= (select (store (arr!18413 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642556 (= lt!297596 (array!38394 (store (arr!18413 a!2986) i!1108 k!1786) (size!18777 a!2986)))))

(declare-fun b!642557 () Bool)

(declare-fun e!367986 () Bool)

(declare-fun lt!297595 () SeekEntryResult!6853)

(assert (=> b!642557 (= e!367986 (= lt!297599 lt!297595))))

(declare-fun b!642558 () Bool)

(declare-fun res!416254 () Bool)

(assert (=> b!642558 (=> (not res!416254) (not e!367978))))

(declare-datatypes ((List!12454 0))(
  ( (Nil!12451) (Cons!12450 (h!13495 (_ BitVec 64)) (t!18682 List!12454)) )
))
(declare-fun arrayNoDuplicates!0 (array!38393 (_ BitVec 32) List!12454) Bool)

(assert (=> b!642558 (= res!416254 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12451))))

(declare-fun b!642559 () Bool)

(assert (=> b!642559 (= e!367980 (arrayContainsKey!0 lt!297596 (select (arr!18413 a!2986) j!136) index!984))))

(declare-fun b!642560 () Bool)

(assert (=> b!642560 (= e!367984 (not e!367987))))

(declare-fun res!416255 () Bool)

(assert (=> b!642560 (=> res!416255 e!367987)))

(declare-fun lt!297591 () SeekEntryResult!6853)

(assert (=> b!642560 (= res!416255 (not (= lt!297591 (Found!6853 index!984))))))

(declare-fun lt!297602 () Unit!21746)

(assert (=> b!642560 (= lt!297602 e!367982)))

(declare-fun c!73514 () Bool)

(assert (=> b!642560 (= c!73514 (= lt!297591 Undefined!6853))))

(assert (=> b!642560 (= lt!297591 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297594 lt!297596 mask!3053))))

(assert (=> b!642560 e!367986))

(declare-fun res!416262 () Bool)

(assert (=> b!642560 (=> (not res!416262) (not e!367986))))

(declare-fun lt!297604 () (_ BitVec 32))

(assert (=> b!642560 (= res!416262 (= lt!297595 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297604 vacantSpotIndex!68 lt!297594 lt!297596 mask!3053)))))

(assert (=> b!642560 (= lt!297595 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297604 vacantSpotIndex!68 (select (arr!18413 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!642560 (= lt!297594 (select (store (arr!18413 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!297600 () Unit!21746)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38393 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21746)

(assert (=> b!642560 (= lt!297600 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297604 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!642560 (= lt!297604 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!642561 () Bool)

(declare-fun res!416251 () Bool)

(assert (=> b!642561 (=> (not res!416251) (not e!367978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38393 (_ BitVec 32)) Bool)

(assert (=> b!642561 (= res!416251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!416259 () Bool)

(assert (=> start!58134 (=> (not res!416259) (not e!367988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58134 (= res!416259 (validMask!0 mask!3053))))

(assert (=> start!58134 e!367988))

(assert (=> start!58134 true))

(declare-fun array_inv!14209 (array!38393) Bool)

(assert (=> start!58134 (array_inv!14209 a!2986)))

(declare-fun b!642549 () Bool)

(assert (=> b!642549 (= e!367989 false)))

(assert (=> b!642549 (not (= lt!297594 (select (arr!18413 a!2986) j!136)))))

(declare-fun lt!297603 () Unit!21746)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38393 (_ BitVec 64) (_ BitVec 32) List!12454) Unit!21746)

(assert (=> b!642549 (= lt!297603 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!297596 (select (arr!18413 a!2986) j!136) j!136 Nil!12451))))

(assert (=> b!642549 (arrayNoDuplicates!0 lt!297596 j!136 Nil!12451)))

(declare-fun lt!297592 () Unit!21746)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38393 (_ BitVec 32) (_ BitVec 32)) Unit!21746)

(assert (=> b!642549 (= lt!297592 (lemmaNoDuplicateFromThenFromBigger!0 lt!297596 #b00000000000000000000000000000000 j!136))))

(assert (=> b!642549 (arrayNoDuplicates!0 lt!297596 #b00000000000000000000000000000000 Nil!12451)))

(declare-fun lt!297597 () Unit!21746)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38393 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12454) Unit!21746)

(assert (=> b!642549 (= lt!297597 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12451))))

(assert (=> b!642549 (arrayContainsKey!0 lt!297596 (select (arr!18413 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297593 () Unit!21746)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38393 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21746)

(assert (=> b!642549 (= lt!297593 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297596 (select (arr!18413 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!642562 () Bool)

(declare-fun res!416252 () Bool)

(assert (=> b!642562 (=> (not res!416252) (not e!367988))))

(assert (=> b!642562 (= res!416252 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!642563 () Bool)

(assert (=> b!642563 (= e!367988 e!367978)))

(declare-fun res!416256 () Bool)

(assert (=> b!642563 (=> (not res!416256) (not e!367978))))

(declare-fun lt!297598 () SeekEntryResult!6853)

(assert (=> b!642563 (= res!416256 (or (= lt!297598 (MissingZero!6853 i!1108)) (= lt!297598 (MissingVacant!6853 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38393 (_ BitVec 32)) SeekEntryResult!6853)

(assert (=> b!642563 (= lt!297598 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!58134 res!416259) b!642545))

(assert (= (and b!642545 res!416263) b!642546))

(assert (= (and b!642546 res!416264) b!642552))

(assert (= (and b!642552 res!416257) b!642562))

(assert (= (and b!642562 res!416252) b!642563))

(assert (= (and b!642563 res!416256) b!642561))

(assert (= (and b!642561 res!416251) b!642558))

(assert (= (and b!642558 res!416254) b!642553))

(assert (= (and b!642553 res!416260) b!642556))

(assert (= (and b!642556 res!416258) b!642551))

(assert (= (and b!642551 res!416261) b!642560))

(assert (= (and b!642560 res!416262) b!642557))

(assert (= (and b!642560 c!73514) b!642555))

(assert (= (and b!642560 (not c!73514)) b!642554))

(assert (= (and b!642560 (not res!416255)) b!642547))

(assert (= (and b!642547 res!416266) b!642550))

(assert (= (and b!642550 (not res!416253)) b!642548))

(assert (= (and b!642548 res!416265) b!642559))

(assert (= (and b!642547 (not res!416267)) b!642549))

(declare-fun m!616325 () Bool)

(assert (=> b!642556 m!616325))

(declare-fun m!616327 () Bool)

(assert (=> b!642556 m!616327))

(declare-fun m!616329 () Bool)

(assert (=> b!642546 m!616329))

(assert (=> b!642546 m!616329))

(declare-fun m!616331 () Bool)

(assert (=> b!642546 m!616331))

(declare-fun m!616333 () Bool)

(assert (=> b!642563 m!616333))

(assert (=> b!642547 m!616329))

(assert (=> b!642547 m!616325))

(declare-fun m!616335 () Bool)

(assert (=> b!642547 m!616335))

(assert (=> b!642548 m!616329))

(assert (=> b!642548 m!616329))

(declare-fun m!616337 () Bool)

(assert (=> b!642548 m!616337))

(declare-fun m!616339 () Bool)

(assert (=> b!642551 m!616339))

(assert (=> b!642551 m!616329))

(assert (=> b!642551 m!616329))

(declare-fun m!616341 () Bool)

(assert (=> b!642551 m!616341))

(declare-fun m!616343 () Bool)

(assert (=> b!642560 m!616343))

(declare-fun m!616345 () Bool)

(assert (=> b!642560 m!616345))

(assert (=> b!642560 m!616329))

(assert (=> b!642560 m!616329))

(declare-fun m!616347 () Bool)

(assert (=> b!642560 m!616347))

(assert (=> b!642560 m!616325))

(declare-fun m!616349 () Bool)

(assert (=> b!642560 m!616349))

(declare-fun m!616351 () Bool)

(assert (=> b!642560 m!616351))

(declare-fun m!616353 () Bool)

(assert (=> b!642560 m!616353))

(declare-fun m!616355 () Bool)

(assert (=> b!642558 m!616355))

(declare-fun m!616357 () Bool)

(assert (=> start!58134 m!616357))

(declare-fun m!616359 () Bool)

(assert (=> start!58134 m!616359))

(declare-fun m!616361 () Bool)

(assert (=> b!642552 m!616361))

(declare-fun m!616363 () Bool)

(assert (=> b!642561 m!616363))

(declare-fun m!616365 () Bool)

(assert (=> b!642549 m!616365))

(declare-fun m!616367 () Bool)

(assert (=> b!642549 m!616367))

(assert (=> b!642549 m!616329))

(declare-fun m!616369 () Bool)

(assert (=> b!642549 m!616369))

(declare-fun m!616371 () Bool)

(assert (=> b!642549 m!616371))

(assert (=> b!642549 m!616329))

(assert (=> b!642549 m!616329))

(declare-fun m!616373 () Bool)

(assert (=> b!642549 m!616373))

(declare-fun m!616375 () Bool)

(assert (=> b!642549 m!616375))

(assert (=> b!642549 m!616329))

(declare-fun m!616377 () Bool)

(assert (=> b!642549 m!616377))

(declare-fun m!616379 () Bool)

(assert (=> b!642553 m!616379))

(assert (=> b!642559 m!616329))

(assert (=> b!642559 m!616329))

(declare-fun m!616381 () Bool)

(assert (=> b!642559 m!616381))

(declare-fun m!616383 () Bool)

(assert (=> b!642562 m!616383))

(assert (=> b!642550 m!616329))

(push 1)

