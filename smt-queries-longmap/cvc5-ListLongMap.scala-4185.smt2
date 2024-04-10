; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57086 () Bool)

(assert start!57086)

(declare-fun b!631767 () Bool)

(declare-fun res!408464 () Bool)

(declare-fun e!361215 () Bool)

(assert (=> b!631767 (=> (not res!408464) (not e!361215))))

(declare-datatypes ((array!38105 0))(
  ( (array!38106 (arr!18285 (Array (_ BitVec 32) (_ BitVec 64))) (size!18649 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38105)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!631767 (= res!408464 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!631768 () Bool)

(declare-fun res!408455 () Bool)

(declare-fun e!361217 () Bool)

(assert (=> b!631768 (=> (not res!408455) (not e!361217))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!631768 (= res!408455 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18285 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!631769 () Bool)

(declare-fun e!361212 () Bool)

(declare-datatypes ((SeekEntryResult!6725 0))(
  ( (MissingZero!6725 (index!29193 (_ BitVec 32))) (Found!6725 (index!29194 (_ BitVec 32))) (Intermediate!6725 (undefined!7537 Bool) (index!29195 (_ BitVec 32)) (x!57936 (_ BitVec 32))) (Undefined!6725) (MissingVacant!6725 (index!29196 (_ BitVec 32))) )
))
(declare-fun lt!291890 () SeekEntryResult!6725)

(declare-fun lt!291891 () SeekEntryResult!6725)

(assert (=> b!631769 (= e!361212 (= lt!291890 lt!291891))))

(declare-fun b!631771 () Bool)

(declare-datatypes ((Unit!21234 0))(
  ( (Unit!21235) )
))
(declare-fun e!361214 () Unit!21234)

(declare-fun Unit!21236 () Unit!21234)

(assert (=> b!631771 (= e!361214 Unit!21236)))

(assert (=> b!631771 false))

(declare-fun b!631772 () Bool)

(declare-fun e!361216 () Bool)

(declare-fun e!361218 () Bool)

(assert (=> b!631772 (= e!361216 e!361218)))

(declare-fun res!408463 () Bool)

(assert (=> b!631772 (=> (not res!408463) (not e!361218))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!631772 (= res!408463 (and (= lt!291890 (Found!6725 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18285 a!2986) index!984) (select (arr!18285 a!2986) j!136))) (not (= (select (arr!18285 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38105 (_ BitVec 32)) SeekEntryResult!6725)

(assert (=> b!631772 (= lt!291890 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18285 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!631773 () Bool)

(declare-fun e!361211 () Bool)

(assert (=> b!631773 (= e!361211 true)))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!631773 (= (select (store (arr!18285 a!2986) i!1108 k!1786) index!984) (select (arr!18285 a!2986) j!136))))

(declare-fun b!631774 () Bool)

(declare-fun res!408458 () Bool)

(assert (=> b!631774 (=> (not res!408458) (not e!361215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!631774 (= res!408458 (validKeyInArray!0 k!1786))))

(declare-fun b!631775 () Bool)

(assert (=> b!631775 (= e!361217 e!361216)))

(declare-fun res!408466 () Bool)

(assert (=> b!631775 (=> (not res!408466) (not e!361216))))

(assert (=> b!631775 (= res!408466 (= (select (store (arr!18285 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!291889 () array!38105)

(assert (=> b!631775 (= lt!291889 (array!38106 (store (arr!18285 a!2986) i!1108 k!1786) (size!18649 a!2986)))))

(declare-fun b!631776 () Bool)

(assert (=> b!631776 (= e!361215 e!361217)))

(declare-fun res!408457 () Bool)

(assert (=> b!631776 (=> (not res!408457) (not e!361217))))

(declare-fun lt!291887 () SeekEntryResult!6725)

(assert (=> b!631776 (= res!408457 (or (= lt!291887 (MissingZero!6725 i!1108)) (= lt!291887 (MissingVacant!6725 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38105 (_ BitVec 32)) SeekEntryResult!6725)

(assert (=> b!631776 (= lt!291887 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!631777 () Bool)

(declare-fun Unit!21237 () Unit!21234)

(assert (=> b!631777 (= e!361214 Unit!21237)))

(declare-fun b!631770 () Bool)

(declare-fun res!408456 () Bool)

(assert (=> b!631770 (=> (not res!408456) (not e!361217))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38105 (_ BitVec 32)) Bool)

(assert (=> b!631770 (= res!408456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!408460 () Bool)

(assert (=> start!57086 (=> (not res!408460) (not e!361215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57086 (= res!408460 (validMask!0 mask!3053))))

(assert (=> start!57086 e!361215))

(assert (=> start!57086 true))

(declare-fun array_inv!14081 (array!38105) Bool)

(assert (=> start!57086 (array_inv!14081 a!2986)))

(declare-fun b!631778 () Bool)

(declare-fun res!408462 () Bool)

(assert (=> b!631778 (=> (not res!408462) (not e!361217))))

(declare-datatypes ((List!12326 0))(
  ( (Nil!12323) (Cons!12322 (h!13367 (_ BitVec 64)) (t!18554 List!12326)) )
))
(declare-fun arrayNoDuplicates!0 (array!38105 (_ BitVec 32) List!12326) Bool)

(assert (=> b!631778 (= res!408462 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12323))))

(declare-fun b!631779 () Bool)

(declare-fun res!408467 () Bool)

(assert (=> b!631779 (=> (not res!408467) (not e!361215))))

(assert (=> b!631779 (= res!408467 (and (= (size!18649 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18649 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18649 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!631780 () Bool)

(declare-fun res!408459 () Bool)

(assert (=> b!631780 (=> (not res!408459) (not e!361215))))

(assert (=> b!631780 (= res!408459 (validKeyInArray!0 (select (arr!18285 a!2986) j!136)))))

(declare-fun b!631781 () Bool)

(assert (=> b!631781 (= e!361218 (not e!361211))))

(declare-fun res!408465 () Bool)

(assert (=> b!631781 (=> res!408465 e!361211)))

(declare-fun lt!291893 () SeekEntryResult!6725)

(assert (=> b!631781 (= res!408465 (not (= lt!291893 (Found!6725 index!984))))))

(declare-fun lt!291892 () Unit!21234)

(assert (=> b!631781 (= lt!291892 e!361214)))

(declare-fun c!72023 () Bool)

(assert (=> b!631781 (= c!72023 (= lt!291893 Undefined!6725))))

(declare-fun lt!291895 () (_ BitVec 64))

(assert (=> b!631781 (= lt!291893 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291895 lt!291889 mask!3053))))

(assert (=> b!631781 e!361212))

(declare-fun res!408461 () Bool)

(assert (=> b!631781 (=> (not res!408461) (not e!361212))))

(declare-fun lt!291888 () (_ BitVec 32))

(assert (=> b!631781 (= res!408461 (= lt!291891 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291888 vacantSpotIndex!68 lt!291895 lt!291889 mask!3053)))))

(assert (=> b!631781 (= lt!291891 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291888 vacantSpotIndex!68 (select (arr!18285 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!631781 (= lt!291895 (select (store (arr!18285 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!291894 () Unit!21234)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38105 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21234)

(assert (=> b!631781 (= lt!291894 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291888 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!631781 (= lt!291888 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!57086 res!408460) b!631779))

(assert (= (and b!631779 res!408467) b!631780))

(assert (= (and b!631780 res!408459) b!631774))

(assert (= (and b!631774 res!408458) b!631767))

(assert (= (and b!631767 res!408464) b!631776))

(assert (= (and b!631776 res!408457) b!631770))

(assert (= (and b!631770 res!408456) b!631778))

(assert (= (and b!631778 res!408462) b!631768))

(assert (= (and b!631768 res!408455) b!631775))

(assert (= (and b!631775 res!408466) b!631772))

(assert (= (and b!631772 res!408463) b!631781))

(assert (= (and b!631781 res!408461) b!631769))

(assert (= (and b!631781 c!72023) b!631771))

(assert (= (and b!631781 (not c!72023)) b!631777))

(assert (= (and b!631781 (not res!408465)) b!631773))

(declare-fun m!606639 () Bool)

(assert (=> b!631774 m!606639))

(declare-fun m!606641 () Bool)

(assert (=> start!57086 m!606641))

(declare-fun m!606643 () Bool)

(assert (=> start!57086 m!606643))

(declare-fun m!606645 () Bool)

(assert (=> b!631776 m!606645))

(declare-fun m!606647 () Bool)

(assert (=> b!631780 m!606647))

(assert (=> b!631780 m!606647))

(declare-fun m!606649 () Bool)

(assert (=> b!631780 m!606649))

(declare-fun m!606651 () Bool)

(assert (=> b!631768 m!606651))

(assert (=> b!631781 m!606647))

(declare-fun m!606653 () Bool)

(assert (=> b!631781 m!606653))

(declare-fun m!606655 () Bool)

(assert (=> b!631781 m!606655))

(assert (=> b!631781 m!606647))

(declare-fun m!606657 () Bool)

(assert (=> b!631781 m!606657))

(declare-fun m!606659 () Bool)

(assert (=> b!631781 m!606659))

(declare-fun m!606661 () Bool)

(assert (=> b!631781 m!606661))

(declare-fun m!606663 () Bool)

(assert (=> b!631781 m!606663))

(declare-fun m!606665 () Bool)

(assert (=> b!631781 m!606665))

(assert (=> b!631773 m!606657))

(declare-fun m!606667 () Bool)

(assert (=> b!631773 m!606667))

(assert (=> b!631773 m!606647))

(declare-fun m!606669 () Bool)

(assert (=> b!631772 m!606669))

(assert (=> b!631772 m!606647))

(assert (=> b!631772 m!606647))

(declare-fun m!606671 () Bool)

(assert (=> b!631772 m!606671))

(declare-fun m!606673 () Bool)

(assert (=> b!631767 m!606673))

(assert (=> b!631775 m!606657))

(declare-fun m!606675 () Bool)

(assert (=> b!631775 m!606675))

(declare-fun m!606677 () Bool)

(assert (=> b!631770 m!606677))

(declare-fun m!606679 () Bool)

(assert (=> b!631778 m!606679))

(push 1)

