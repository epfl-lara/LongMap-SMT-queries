; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53768 () Bool)

(assert start!53768)

(declare-fun res!374459 () Bool)

(declare-fun e!335319 () Bool)

(assert (=> start!53768 (=> (not res!374459) (not e!335319))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53768 (= res!374459 (validMask!0 mask!3053))))

(assert (=> start!53768 e!335319))

(assert (=> start!53768 true))

(declare-datatypes ((array!36669 0))(
  ( (array!36670 (arr!17609 (Array (_ BitVec 32) (_ BitVec 64))) (size!17973 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36669)

(declare-fun array_inv!13405 (array!36669) Bool)

(assert (=> start!53768 (array_inv!13405 a!2986)))

(declare-fun b!586636 () Bool)

(declare-fun res!374456 () Bool)

(declare-fun e!335318 () Bool)

(assert (=> b!586636 (=> (not res!374456) (not e!335318))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!586636 (= res!374456 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17609 a!2986) index!984) (select (arr!17609 a!2986) j!136))) (not (= (select (arr!17609 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586637 () Bool)

(assert (=> b!586637 (= e!335318 (not true))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!266147 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6049 0))(
  ( (MissingZero!6049 (index!26423 (_ BitVec 32))) (Found!6049 (index!26424 (_ BitVec 32))) (Intermediate!6049 (undefined!6861 Bool) (index!26425 (_ BitVec 32)) (x!55230 (_ BitVec 32))) (Undefined!6049) (MissingVacant!6049 (index!26426 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36669 (_ BitVec 32)) SeekEntryResult!6049)

(assert (=> b!586637 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266147 vacantSpotIndex!68 (select (arr!17609 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266147 vacantSpotIndex!68 (select (store (arr!17609 a!2986) i!1108 k!1786) j!136) (array!36670 (store (arr!17609 a!2986) i!1108 k!1786) (size!17973 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18218 0))(
  ( (Unit!18219) )
))
(declare-fun lt!266149 () Unit!18218)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36669 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18218)

(assert (=> b!586637 (= lt!266149 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266147 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586637 (= lt!266147 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586638 () Bool)

(declare-fun res!374453 () Bool)

(assert (=> b!586638 (=> (not res!374453) (not e!335318))))

(declare-datatypes ((List!11650 0))(
  ( (Nil!11647) (Cons!11646 (h!12691 (_ BitVec 64)) (t!17878 List!11650)) )
))
(declare-fun arrayNoDuplicates!0 (array!36669 (_ BitVec 32) List!11650) Bool)

(assert (=> b!586638 (= res!374453 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11647))))

(declare-fun b!586639 () Bool)

(declare-fun res!374460 () Bool)

(assert (=> b!586639 (=> (not res!374460) (not e!335319))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586639 (= res!374460 (validKeyInArray!0 k!1786))))

(declare-fun b!586640 () Bool)

(declare-fun res!374462 () Bool)

(assert (=> b!586640 (=> (not res!374462) (not e!335318))))

(assert (=> b!586640 (= res!374462 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17609 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17609 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586641 () Bool)

(declare-fun res!374458 () Bool)

(assert (=> b!586641 (=> (not res!374458) (not e!335318))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36669 (_ BitVec 32)) Bool)

(assert (=> b!586641 (= res!374458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586642 () Bool)

(declare-fun res!374457 () Bool)

(assert (=> b!586642 (=> (not res!374457) (not e!335319))))

(assert (=> b!586642 (= res!374457 (validKeyInArray!0 (select (arr!17609 a!2986) j!136)))))

(declare-fun b!586643 () Bool)

(declare-fun res!374461 () Bool)

(assert (=> b!586643 (=> (not res!374461) (not e!335318))))

(assert (=> b!586643 (= res!374461 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17609 a!2986) j!136) a!2986 mask!3053) (Found!6049 j!136)))))

(declare-fun b!586644 () Bool)

(assert (=> b!586644 (= e!335319 e!335318)))

(declare-fun res!374455 () Bool)

(assert (=> b!586644 (=> (not res!374455) (not e!335318))))

(declare-fun lt!266148 () SeekEntryResult!6049)

(assert (=> b!586644 (= res!374455 (or (= lt!266148 (MissingZero!6049 i!1108)) (= lt!266148 (MissingVacant!6049 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36669 (_ BitVec 32)) SeekEntryResult!6049)

(assert (=> b!586644 (= lt!266148 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!586645 () Bool)

(declare-fun res!374454 () Bool)

(assert (=> b!586645 (=> (not res!374454) (not e!335319))))

(assert (=> b!586645 (= res!374454 (and (= (size!17973 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17973 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17973 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586646 () Bool)

(declare-fun res!374452 () Bool)

(assert (=> b!586646 (=> (not res!374452) (not e!335319))))

(declare-fun arrayContainsKey!0 (array!36669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586646 (= res!374452 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53768 res!374459) b!586645))

(assert (= (and b!586645 res!374454) b!586642))

(assert (= (and b!586642 res!374457) b!586639))

(assert (= (and b!586639 res!374460) b!586646))

(assert (= (and b!586646 res!374452) b!586644))

(assert (= (and b!586644 res!374455) b!586641))

(assert (= (and b!586641 res!374458) b!586638))

(assert (= (and b!586638 res!374453) b!586640))

(assert (= (and b!586640 res!374462) b!586643))

(assert (= (and b!586643 res!374461) b!586636))

(assert (= (and b!586636 res!374456) b!586637))

(declare-fun m!565025 () Bool)

(assert (=> b!586636 m!565025))

(declare-fun m!565027 () Bool)

(assert (=> b!586636 m!565027))

(declare-fun m!565029 () Bool)

(assert (=> b!586639 m!565029))

(declare-fun m!565031 () Bool)

(assert (=> b!586646 m!565031))

(declare-fun m!565033 () Bool)

(assert (=> b!586640 m!565033))

(declare-fun m!565035 () Bool)

(assert (=> b!586640 m!565035))

(declare-fun m!565037 () Bool)

(assert (=> b!586640 m!565037))

(declare-fun m!565039 () Bool)

(assert (=> b!586641 m!565039))

(assert (=> b!586642 m!565027))

(assert (=> b!586642 m!565027))

(declare-fun m!565041 () Bool)

(assert (=> b!586642 m!565041))

(declare-fun m!565043 () Bool)

(assert (=> b!586637 m!565043))

(declare-fun m!565045 () Bool)

(assert (=> b!586637 m!565045))

(assert (=> b!586637 m!565027))

(assert (=> b!586637 m!565035))

(assert (=> b!586637 m!565045))

(declare-fun m!565047 () Bool)

(assert (=> b!586637 m!565047))

(declare-fun m!565049 () Bool)

(assert (=> b!586637 m!565049))

(assert (=> b!586637 m!565027))

(declare-fun m!565051 () Bool)

(assert (=> b!586637 m!565051))

(declare-fun m!565053 () Bool)

(assert (=> b!586638 m!565053))

(assert (=> b!586643 m!565027))

(assert (=> b!586643 m!565027))

(declare-fun m!565055 () Bool)

(assert (=> b!586643 m!565055))

(declare-fun m!565057 () Bool)

(assert (=> b!586644 m!565057))

(declare-fun m!565059 () Bool)

(assert (=> start!53768 m!565059))

(declare-fun m!565061 () Bool)

(assert (=> start!53768 m!565061))

(push 1)

