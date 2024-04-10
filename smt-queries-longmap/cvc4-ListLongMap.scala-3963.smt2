; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53792 () Bool)

(assert start!53792)

(declare-fun res!374848 () Bool)

(declare-fun e!335426 () Bool)

(assert (=> start!53792 (=> (not res!374848) (not e!335426))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53792 (= res!374848 (validMask!0 mask!3053))))

(assert (=> start!53792 e!335426))

(assert (=> start!53792 true))

(declare-datatypes ((array!36693 0))(
  ( (array!36694 (arr!17621 (Array (_ BitVec 32) (_ BitVec 64))) (size!17985 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36693)

(declare-fun array_inv!13417 (array!36693) Bool)

(assert (=> start!53792 (array_inv!13417 a!2986)))

(declare-fun b!587032 () Bool)

(declare-fun e!335425 () Bool)

(assert (=> b!587032 (= e!335425 (not true))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!266255 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6061 0))(
  ( (MissingZero!6061 (index!26471 (_ BitVec 32))) (Found!6061 (index!26472 (_ BitVec 32))) (Intermediate!6061 (undefined!6873 Bool) (index!26473 (_ BitVec 32)) (x!55274 (_ BitVec 32))) (Undefined!6061) (MissingVacant!6061 (index!26474 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36693 (_ BitVec 32)) SeekEntryResult!6061)

(assert (=> b!587032 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266255 vacantSpotIndex!68 (select (arr!17621 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266255 vacantSpotIndex!68 (select (store (arr!17621 a!2986) i!1108 k!1786) j!136) (array!36694 (store (arr!17621 a!2986) i!1108 k!1786) (size!17985 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18242 0))(
  ( (Unit!18243) )
))
(declare-fun lt!266256 () Unit!18242)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36693 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18242)

(assert (=> b!587032 (= lt!266256 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266255 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587032 (= lt!266255 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!587033 () Bool)

(declare-fun res!374858 () Bool)

(assert (=> b!587033 (=> (not res!374858) (not e!335426))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587033 (= res!374858 (validKeyInArray!0 (select (arr!17621 a!2986) j!136)))))

(declare-fun b!587034 () Bool)

(declare-fun res!374850 () Bool)

(assert (=> b!587034 (=> (not res!374850) (not e!335425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36693 (_ BitVec 32)) Bool)

(assert (=> b!587034 (= res!374850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587035 () Bool)

(declare-fun res!374851 () Bool)

(assert (=> b!587035 (=> (not res!374851) (not e!335426))))

(assert (=> b!587035 (= res!374851 (and (= (size!17985 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17985 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17985 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587036 () Bool)

(declare-fun res!374852 () Bool)

(assert (=> b!587036 (=> (not res!374852) (not e!335426))))

(assert (=> b!587036 (= res!374852 (validKeyInArray!0 k!1786))))

(declare-fun b!587037 () Bool)

(declare-fun res!374849 () Bool)

(assert (=> b!587037 (=> (not res!374849) (not e!335425))))

(assert (=> b!587037 (= res!374849 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17621 a!2986) index!984) (select (arr!17621 a!2986) j!136))) (not (= (select (arr!17621 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!587038 () Bool)

(declare-fun res!374856 () Bool)

(assert (=> b!587038 (=> (not res!374856) (not e!335425))))

(assert (=> b!587038 (= res!374856 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17621 a!2986) j!136) a!2986 mask!3053) (Found!6061 j!136)))))

(declare-fun b!587039 () Bool)

(declare-fun res!374854 () Bool)

(assert (=> b!587039 (=> (not res!374854) (not e!335425))))

(declare-datatypes ((List!11662 0))(
  ( (Nil!11659) (Cons!11658 (h!12703 (_ BitVec 64)) (t!17890 List!11662)) )
))
(declare-fun arrayNoDuplicates!0 (array!36693 (_ BitVec 32) List!11662) Bool)

(assert (=> b!587039 (= res!374854 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11659))))

(declare-fun b!587040 () Bool)

(assert (=> b!587040 (= e!335426 e!335425)))

(declare-fun res!374853 () Bool)

(assert (=> b!587040 (=> (not res!374853) (not e!335425))))

(declare-fun lt!266257 () SeekEntryResult!6061)

(assert (=> b!587040 (= res!374853 (or (= lt!266257 (MissingZero!6061 i!1108)) (= lt!266257 (MissingVacant!6061 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36693 (_ BitVec 32)) SeekEntryResult!6061)

(assert (=> b!587040 (= lt!266257 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!587041 () Bool)

(declare-fun res!374855 () Bool)

(assert (=> b!587041 (=> (not res!374855) (not e!335425))))

(assert (=> b!587041 (= res!374855 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17621 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17621 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587042 () Bool)

(declare-fun res!374857 () Bool)

(assert (=> b!587042 (=> (not res!374857) (not e!335426))))

(declare-fun arrayContainsKey!0 (array!36693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587042 (= res!374857 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53792 res!374848) b!587035))

(assert (= (and b!587035 res!374851) b!587033))

(assert (= (and b!587033 res!374858) b!587036))

(assert (= (and b!587036 res!374852) b!587042))

(assert (= (and b!587042 res!374857) b!587040))

(assert (= (and b!587040 res!374853) b!587034))

(assert (= (and b!587034 res!374850) b!587039))

(assert (= (and b!587039 res!374854) b!587041))

(assert (= (and b!587041 res!374855) b!587038))

(assert (= (and b!587038 res!374856) b!587037))

(assert (= (and b!587037 res!374849) b!587032))

(declare-fun m!565481 () Bool)

(assert (=> b!587038 m!565481))

(assert (=> b!587038 m!565481))

(declare-fun m!565483 () Bool)

(assert (=> b!587038 m!565483))

(declare-fun m!565485 () Bool)

(assert (=> b!587042 m!565485))

(declare-fun m!565487 () Bool)

(assert (=> start!53792 m!565487))

(declare-fun m!565489 () Bool)

(assert (=> start!53792 m!565489))

(declare-fun m!565491 () Bool)

(assert (=> b!587040 m!565491))

(declare-fun m!565493 () Bool)

(assert (=> b!587036 m!565493))

(declare-fun m!565495 () Bool)

(assert (=> b!587032 m!565495))

(declare-fun m!565497 () Bool)

(assert (=> b!587032 m!565497))

(assert (=> b!587032 m!565481))

(declare-fun m!565499 () Bool)

(assert (=> b!587032 m!565499))

(assert (=> b!587032 m!565481))

(declare-fun m!565501 () Bool)

(assert (=> b!587032 m!565501))

(declare-fun m!565503 () Bool)

(assert (=> b!587032 m!565503))

(assert (=> b!587032 m!565497))

(declare-fun m!565505 () Bool)

(assert (=> b!587032 m!565505))

(declare-fun m!565507 () Bool)

(assert (=> b!587041 m!565507))

(assert (=> b!587041 m!565503))

(declare-fun m!565509 () Bool)

(assert (=> b!587041 m!565509))

(declare-fun m!565511 () Bool)

(assert (=> b!587037 m!565511))

(assert (=> b!587037 m!565481))

(declare-fun m!565513 () Bool)

(assert (=> b!587039 m!565513))

(declare-fun m!565515 () Bool)

(assert (=> b!587034 m!565515))

(assert (=> b!587033 m!565481))

(assert (=> b!587033 m!565481))

(declare-fun m!565517 () Bool)

(assert (=> b!587033 m!565517))

(push 1)

