; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54150 () Bool)

(assert start!54150)

(declare-fun b!591432 () Bool)

(declare-fun e!337697 () Bool)

(declare-datatypes ((SeekEntryResult!6150 0))(
  ( (MissingZero!6150 (index!26836 (_ BitVec 32))) (Found!6150 (index!26837 (_ BitVec 32))) (Intermediate!6150 (undefined!6962 Bool) (index!26838 (_ BitVec 32)) (x!55630 (_ BitVec 32))) (Undefined!6150) (MissingVacant!6150 (index!26839 (_ BitVec 32))) )
))
(declare-fun lt!268363 () SeekEntryResult!6150)

(declare-fun lt!268368 () SeekEntryResult!6150)

(assert (=> b!591432 (= e!337697 (= lt!268363 lt!268368))))

(declare-fun b!591433 () Bool)

(declare-datatypes ((Unit!18518 0))(
  ( (Unit!18519) )
))
(declare-fun e!337699 () Unit!18518)

(declare-fun Unit!18520 () Unit!18518)

(assert (=> b!591433 (= e!337699 Unit!18520)))

(declare-fun b!591434 () Bool)

(declare-fun e!337698 () Bool)

(declare-fun e!337704 () Bool)

(assert (=> b!591434 (= e!337698 e!337704)))

(declare-fun res!378377 () Bool)

(assert (=> b!591434 (=> (not res!378377) (not e!337704))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!36880 0))(
  ( (array!36881 (arr!17710 (Array (_ BitVec 32) (_ BitVec 64))) (size!18074 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36880)

(assert (=> b!591434 (= res!378377 (= (select (store (arr!17710 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!268367 () array!36880)

(assert (=> b!591434 (= lt!268367 (array!36881 (store (arr!17710 a!2986) i!1108 k0!1786) (size!18074 a!2986)))))

(declare-fun b!591435 () Bool)

(declare-fun res!378378 () Bool)

(declare-fun e!337694 () Bool)

(assert (=> b!591435 (=> (not res!378378) (not e!337694))))

(declare-fun arrayContainsKey!0 (array!36880 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591435 (= res!378378 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!591436 () Bool)

(declare-fun e!337696 () Bool)

(declare-fun e!337701 () Bool)

(assert (=> b!591436 (= e!337696 e!337701)))

(declare-fun res!378379 () Bool)

(assert (=> b!591436 (=> (not res!378379) (not e!337701))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!591436 (= res!378379 (arrayContainsKey!0 lt!268367 (select (arr!17710 a!2986) j!136) j!136))))

(declare-fun b!591437 () Bool)

(declare-fun res!378375 () Bool)

(assert (=> b!591437 (=> (not res!378375) (not e!337694))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!591437 (= res!378375 (and (= (size!18074 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18074 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18074 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!591438 () Bool)

(declare-fun e!337703 () Bool)

(assert (=> b!591438 (= e!337703 true)))

(declare-fun e!337702 () Bool)

(assert (=> b!591438 e!337702))

(declare-fun res!378387 () Bool)

(assert (=> b!591438 (=> (not res!378387) (not e!337702))))

(declare-fun lt!268366 () (_ BitVec 64))

(assert (=> b!591438 (= res!378387 (= lt!268366 (select (arr!17710 a!2986) j!136)))))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!591438 (= lt!268366 (select (store (arr!17710 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!591439 () Bool)

(declare-fun res!378382 () Bool)

(assert (=> b!591439 (=> (not res!378382) (not e!337698))))

(declare-datatypes ((List!11751 0))(
  ( (Nil!11748) (Cons!11747 (h!12792 (_ BitVec 64)) (t!17979 List!11751)) )
))
(declare-fun arrayNoDuplicates!0 (array!36880 (_ BitVec 32) List!11751) Bool)

(assert (=> b!591439 (= res!378382 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11748))))

(declare-fun b!591440 () Bool)

(assert (=> b!591440 (= e!337702 e!337696)))

(declare-fun res!378385 () Bool)

(assert (=> b!591440 (=> res!378385 e!337696)))

(declare-fun lt!268371 () (_ BitVec 64))

(assert (=> b!591440 (= res!378385 (or (not (= (select (arr!17710 a!2986) j!136) lt!268371)) (not (= (select (arr!17710 a!2986) j!136) lt!268366)) (bvsge j!136 index!984)))))

(declare-fun b!591441 () Bool)

(declare-fun res!378389 () Bool)

(assert (=> b!591441 (=> (not res!378389) (not e!337698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36880 (_ BitVec 32)) Bool)

(assert (=> b!591441 (= res!378389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!591442 () Bool)

(assert (=> b!591442 (= e!337694 e!337698)))

(declare-fun res!378376 () Bool)

(assert (=> b!591442 (=> (not res!378376) (not e!337698))))

(declare-fun lt!268370 () SeekEntryResult!6150)

(assert (=> b!591442 (= res!378376 (or (= lt!268370 (MissingZero!6150 i!1108)) (= lt!268370 (MissingVacant!6150 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36880 (_ BitVec 32)) SeekEntryResult!6150)

(assert (=> b!591442 (= lt!268370 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!591443 () Bool)

(declare-fun res!378380 () Bool)

(assert (=> b!591443 (=> (not res!378380) (not e!337698))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!591443 (= res!378380 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17710 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!591444 () Bool)

(declare-fun e!337700 () Bool)

(assert (=> b!591444 (= e!337700 (not e!337703))))

(declare-fun res!378381 () Bool)

(assert (=> b!591444 (=> res!378381 e!337703)))

(declare-fun lt!268372 () SeekEntryResult!6150)

(assert (=> b!591444 (= res!378381 (not (= lt!268372 (Found!6150 index!984))))))

(declare-fun lt!268369 () Unit!18518)

(assert (=> b!591444 (= lt!268369 e!337699)))

(declare-fun c!66896 () Bool)

(assert (=> b!591444 (= c!66896 (= lt!268372 Undefined!6150))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36880 (_ BitVec 32)) SeekEntryResult!6150)

(assert (=> b!591444 (= lt!268372 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268371 lt!268367 mask!3053))))

(assert (=> b!591444 e!337697))

(declare-fun res!378374 () Bool)

(assert (=> b!591444 (=> (not res!378374) (not e!337697))))

(declare-fun lt!268365 () (_ BitVec 32))

(assert (=> b!591444 (= res!378374 (= lt!268368 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268365 vacantSpotIndex!68 lt!268371 lt!268367 mask!3053)))))

(assert (=> b!591444 (= lt!268368 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268365 vacantSpotIndex!68 (select (arr!17710 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!591444 (= lt!268371 (select (store (arr!17710 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!268364 () Unit!18518)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36880 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18518)

(assert (=> b!591444 (= lt!268364 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268365 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!591444 (= lt!268365 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!591445 () Bool)

(assert (=> b!591445 (= e!337704 e!337700)))

(declare-fun res!378386 () Bool)

(assert (=> b!591445 (=> (not res!378386) (not e!337700))))

(assert (=> b!591445 (= res!378386 (and (= lt!268363 (Found!6150 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17710 a!2986) index!984) (select (arr!17710 a!2986) j!136))) (not (= (select (arr!17710 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!591445 (= lt!268363 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17710 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!378383 () Bool)

(assert (=> start!54150 (=> (not res!378383) (not e!337694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54150 (= res!378383 (validMask!0 mask!3053))))

(assert (=> start!54150 e!337694))

(assert (=> start!54150 true))

(declare-fun array_inv!13506 (array!36880) Bool)

(assert (=> start!54150 (array_inv!13506 a!2986)))

(declare-fun b!591446 () Bool)

(assert (=> b!591446 (= e!337701 (arrayContainsKey!0 lt!268367 (select (arr!17710 a!2986) j!136) index!984))))

(declare-fun b!591447 () Bool)

(declare-fun res!378384 () Bool)

(assert (=> b!591447 (=> (not res!378384) (not e!337694))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591447 (= res!378384 (validKeyInArray!0 (select (arr!17710 a!2986) j!136)))))

(declare-fun b!591448 () Bool)

(declare-fun Unit!18521 () Unit!18518)

(assert (=> b!591448 (= e!337699 Unit!18521)))

(assert (=> b!591448 false))

(declare-fun b!591449 () Bool)

(declare-fun res!378388 () Bool)

(assert (=> b!591449 (=> (not res!378388) (not e!337694))))

(assert (=> b!591449 (= res!378388 (validKeyInArray!0 k0!1786))))

(assert (= (and start!54150 res!378383) b!591437))

(assert (= (and b!591437 res!378375) b!591447))

(assert (= (and b!591447 res!378384) b!591449))

(assert (= (and b!591449 res!378388) b!591435))

(assert (= (and b!591435 res!378378) b!591442))

(assert (= (and b!591442 res!378376) b!591441))

(assert (= (and b!591441 res!378389) b!591439))

(assert (= (and b!591439 res!378382) b!591443))

(assert (= (and b!591443 res!378380) b!591434))

(assert (= (and b!591434 res!378377) b!591445))

(assert (= (and b!591445 res!378386) b!591444))

(assert (= (and b!591444 res!378374) b!591432))

(assert (= (and b!591444 c!66896) b!591448))

(assert (= (and b!591444 (not c!66896)) b!591433))

(assert (= (and b!591444 (not res!378381)) b!591438))

(assert (= (and b!591438 res!378387) b!591440))

(assert (= (and b!591440 (not res!378385)) b!591436))

(assert (= (and b!591436 res!378379) b!591446))

(declare-fun m!569681 () Bool)

(assert (=> b!591441 m!569681))

(declare-fun m!569683 () Bool)

(assert (=> b!591439 m!569683))

(declare-fun m!569685 () Bool)

(assert (=> b!591438 m!569685))

(declare-fun m!569687 () Bool)

(assert (=> b!591438 m!569687))

(declare-fun m!569689 () Bool)

(assert (=> b!591438 m!569689))

(declare-fun m!569691 () Bool)

(assert (=> b!591435 m!569691))

(assert (=> b!591447 m!569685))

(assert (=> b!591447 m!569685))

(declare-fun m!569693 () Bool)

(assert (=> b!591447 m!569693))

(declare-fun m!569695 () Bool)

(assert (=> b!591442 m!569695))

(declare-fun m!569697 () Bool)

(assert (=> b!591449 m!569697))

(declare-fun m!569699 () Bool)

(assert (=> start!54150 m!569699))

(declare-fun m!569701 () Bool)

(assert (=> start!54150 m!569701))

(assert (=> b!591440 m!569685))

(assert (=> b!591434 m!569687))

(declare-fun m!569703 () Bool)

(assert (=> b!591434 m!569703))

(declare-fun m!569705 () Bool)

(assert (=> b!591445 m!569705))

(assert (=> b!591445 m!569685))

(assert (=> b!591445 m!569685))

(declare-fun m!569707 () Bool)

(assert (=> b!591445 m!569707))

(declare-fun m!569709 () Bool)

(assert (=> b!591444 m!569709))

(declare-fun m!569711 () Bool)

(assert (=> b!591444 m!569711))

(assert (=> b!591444 m!569685))

(declare-fun m!569713 () Bool)

(assert (=> b!591444 m!569713))

(assert (=> b!591444 m!569687))

(declare-fun m!569715 () Bool)

(assert (=> b!591444 m!569715))

(assert (=> b!591444 m!569685))

(declare-fun m!569717 () Bool)

(assert (=> b!591444 m!569717))

(declare-fun m!569719 () Bool)

(assert (=> b!591444 m!569719))

(assert (=> b!591446 m!569685))

(assert (=> b!591446 m!569685))

(declare-fun m!569721 () Bool)

(assert (=> b!591446 m!569721))

(assert (=> b!591436 m!569685))

(assert (=> b!591436 m!569685))

(declare-fun m!569723 () Bool)

(assert (=> b!591436 m!569723))

(declare-fun m!569725 () Bool)

(assert (=> b!591443 m!569725))

(check-sat (not b!591449) (not b!591444) (not start!54150) (not b!591439) (not b!591441) (not b!591445) (not b!591442) (not b!591435) (not b!591436) (not b!591447) (not b!591446))
(check-sat)
