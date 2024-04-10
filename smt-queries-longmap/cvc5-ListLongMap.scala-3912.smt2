; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53482 () Bool)

(assert start!53482)

(declare-fun b!582058 () Bool)

(declare-fun e!333860 () Bool)

(declare-fun e!333861 () Bool)

(assert (=> b!582058 (= e!333860 e!333861)))

(declare-fun res!369879 () Bool)

(assert (=> b!582058 (=> (not res!369879) (not e!333861))))

(declare-datatypes ((SeekEntryResult!5906 0))(
  ( (MissingZero!5906 (index!25851 (_ BitVec 32))) (Found!5906 (index!25852 (_ BitVec 32))) (Intermediate!5906 (undefined!6718 Bool) (index!25853 (_ BitVec 32)) (x!54711 (_ BitVec 32))) (Undefined!5906) (MissingVacant!5906 (index!25854 (_ BitVec 32))) )
))
(declare-fun lt!265030 () SeekEntryResult!5906)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582058 (= res!369879 (or (= lt!265030 (MissingZero!5906 i!1108)) (= lt!265030 (MissingVacant!5906 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36383 0))(
  ( (array!36384 (arr!17466 (Array (_ BitVec 32) (_ BitVec 64))) (size!17830 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36383)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36383 (_ BitVec 32)) SeekEntryResult!5906)

(assert (=> b!582058 (= lt!265030 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!582059 () Bool)

(declare-fun res!369874 () Bool)

(assert (=> b!582059 (=> (not res!369874) (not e!333860))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!582059 (= res!369874 (and (= (size!17830 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17830 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17830 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582060 () Bool)

(declare-fun res!369877 () Bool)

(assert (=> b!582060 (=> (not res!369877) (not e!333860))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582060 (= res!369877 (validKeyInArray!0 k!1786))))

(declare-fun b!582061 () Bool)

(declare-fun res!369875 () Bool)

(assert (=> b!582061 (=> (not res!369875) (not e!333860))))

(assert (=> b!582061 (= res!369875 (validKeyInArray!0 (select (arr!17466 a!2986) j!136)))))

(declare-fun b!582057 () Bool)

(declare-fun res!369881 () Bool)

(assert (=> b!582057 (=> (not res!369881) (not e!333861))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36383 (_ BitVec 32)) Bool)

(assert (=> b!582057 (= res!369881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!369873 () Bool)

(assert (=> start!53482 (=> (not res!369873) (not e!333860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53482 (= res!369873 (validMask!0 mask!3053))))

(assert (=> start!53482 e!333860))

(assert (=> start!53482 true))

(declare-fun array_inv!13262 (array!36383) Bool)

(assert (=> start!53482 (array_inv!13262 a!2986)))

(declare-fun b!582062 () Bool)

(declare-fun res!369880 () Bool)

(assert (=> b!582062 (=> (not res!369880) (not e!333860))))

(declare-fun arrayContainsKey!0 (array!36383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582062 (= res!369880 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582063 () Bool)

(declare-fun res!369876 () Bool)

(assert (=> b!582063 (=> (not res!369876) (not e!333861))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!582063 (= res!369876 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17466 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17466 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582064 () Bool)

(declare-fun res!369878 () Bool)

(assert (=> b!582064 (=> (not res!369878) (not e!333861))))

(declare-datatypes ((List!11507 0))(
  ( (Nil!11504) (Cons!11503 (h!12548 (_ BitVec 64)) (t!17735 List!11507)) )
))
(declare-fun arrayNoDuplicates!0 (array!36383 (_ BitVec 32) List!11507) Bool)

(assert (=> b!582064 (= res!369878 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11504))))

(declare-fun b!582065 () Bool)

(assert (=> b!582065 (= e!333861 false)))

(declare-fun lt!265029 () SeekEntryResult!5906)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36383 (_ BitVec 32)) SeekEntryResult!5906)

(assert (=> b!582065 (= lt!265029 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17466 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53482 res!369873) b!582059))

(assert (= (and b!582059 res!369874) b!582061))

(assert (= (and b!582061 res!369875) b!582060))

(assert (= (and b!582060 res!369877) b!582062))

(assert (= (and b!582062 res!369880) b!582058))

(assert (= (and b!582058 res!369879) b!582057))

(assert (= (and b!582057 res!369881) b!582064))

(assert (= (and b!582064 res!369878) b!582063))

(assert (= (and b!582063 res!369876) b!582065))

(declare-fun m!560575 () Bool)

(assert (=> b!582065 m!560575))

(assert (=> b!582065 m!560575))

(declare-fun m!560577 () Bool)

(assert (=> b!582065 m!560577))

(declare-fun m!560579 () Bool)

(assert (=> b!582060 m!560579))

(declare-fun m!560581 () Bool)

(assert (=> b!582064 m!560581))

(declare-fun m!560583 () Bool)

(assert (=> b!582058 m!560583))

(declare-fun m!560585 () Bool)

(assert (=> b!582057 m!560585))

(declare-fun m!560587 () Bool)

(assert (=> start!53482 m!560587))

(declare-fun m!560589 () Bool)

(assert (=> start!53482 m!560589))

(declare-fun m!560591 () Bool)

(assert (=> b!582062 m!560591))

(assert (=> b!582061 m!560575))

(assert (=> b!582061 m!560575))

(declare-fun m!560593 () Bool)

(assert (=> b!582061 m!560593))

(declare-fun m!560595 () Bool)

(assert (=> b!582063 m!560595))

(declare-fun m!560597 () Bool)

(assert (=> b!582063 m!560597))

(declare-fun m!560599 () Bool)

(assert (=> b!582063 m!560599))

(push 1)

