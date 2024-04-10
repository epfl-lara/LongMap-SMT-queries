; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53498 () Bool)

(assert start!53498)

(declare-fun b!582273 () Bool)

(declare-fun e!333931 () Bool)

(declare-fun e!333932 () Bool)

(assert (=> b!582273 (= e!333931 e!333932)))

(declare-fun res!370090 () Bool)

(assert (=> b!582273 (=> (not res!370090) (not e!333932))))

(declare-datatypes ((SeekEntryResult!5914 0))(
  ( (MissingZero!5914 (index!25883 (_ BitVec 32))) (Found!5914 (index!25884 (_ BitVec 32))) (Intermediate!5914 (undefined!6726 Bool) (index!25885 (_ BitVec 32)) (x!54735 (_ BitVec 32))) (Undefined!5914) (MissingVacant!5914 (index!25886 (_ BitVec 32))) )
))
(declare-fun lt!265077 () SeekEntryResult!5914)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582273 (= res!370090 (or (= lt!265077 (MissingZero!5914 i!1108)) (= lt!265077 (MissingVacant!5914 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36399 0))(
  ( (array!36400 (arr!17474 (Array (_ BitVec 32) (_ BitVec 64))) (size!17838 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36399)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36399 (_ BitVec 32)) SeekEntryResult!5914)

(assert (=> b!582273 (= lt!265077 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!582274 () Bool)

(declare-fun res!370092 () Bool)

(assert (=> b!582274 (=> (not res!370092) (not e!333931))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!582274 (= res!370092 (and (= (size!17838 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17838 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17838 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582275 () Bool)

(declare-fun res!370089 () Bool)

(assert (=> b!582275 (=> (not res!370089) (not e!333932))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!582275 (= res!370089 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17474 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17474 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582277 () Bool)

(declare-fun res!370096 () Bool)

(assert (=> b!582277 (=> (not res!370096) (not e!333931))))

(declare-fun arrayContainsKey!0 (array!36399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582277 (= res!370096 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582278 () Bool)

(declare-fun res!370095 () Bool)

(assert (=> b!582278 (=> (not res!370095) (not e!333932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36399 (_ BitVec 32)) Bool)

(assert (=> b!582278 (= res!370095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582279 () Bool)

(declare-fun res!370093 () Bool)

(assert (=> b!582279 (=> (not res!370093) (not e!333931))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582279 (= res!370093 (validKeyInArray!0 k!1786))))

(declare-fun b!582276 () Bool)

(assert (=> b!582276 (= e!333932 false)))

(declare-fun lt!265078 () SeekEntryResult!5914)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36399 (_ BitVec 32)) SeekEntryResult!5914)

(assert (=> b!582276 (= lt!265078 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17474 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!370097 () Bool)

(assert (=> start!53498 (=> (not res!370097) (not e!333931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53498 (= res!370097 (validMask!0 mask!3053))))

(assert (=> start!53498 e!333931))

(assert (=> start!53498 true))

(declare-fun array_inv!13270 (array!36399) Bool)

(assert (=> start!53498 (array_inv!13270 a!2986)))

(declare-fun b!582280 () Bool)

(declare-fun res!370091 () Bool)

(assert (=> b!582280 (=> (not res!370091) (not e!333932))))

(declare-datatypes ((List!11515 0))(
  ( (Nil!11512) (Cons!11511 (h!12556 (_ BitVec 64)) (t!17743 List!11515)) )
))
(declare-fun arrayNoDuplicates!0 (array!36399 (_ BitVec 32) List!11515) Bool)

(assert (=> b!582280 (= res!370091 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11512))))

(declare-fun b!582281 () Bool)

(declare-fun res!370094 () Bool)

(assert (=> b!582281 (=> (not res!370094) (not e!333931))))

(assert (=> b!582281 (= res!370094 (validKeyInArray!0 (select (arr!17474 a!2986) j!136)))))

(assert (= (and start!53498 res!370097) b!582274))

(assert (= (and b!582274 res!370092) b!582281))

(assert (= (and b!582281 res!370094) b!582279))

(assert (= (and b!582279 res!370093) b!582277))

(assert (= (and b!582277 res!370096) b!582273))

(assert (= (and b!582273 res!370090) b!582278))

(assert (= (and b!582278 res!370095) b!582280))

(assert (= (and b!582280 res!370091) b!582275))

(assert (= (and b!582275 res!370089) b!582276))

(declare-fun m!560783 () Bool)

(assert (=> b!582277 m!560783))

(declare-fun m!560785 () Bool)

(assert (=> b!582280 m!560785))

(declare-fun m!560787 () Bool)

(assert (=> b!582279 m!560787))

(declare-fun m!560789 () Bool)

(assert (=> b!582278 m!560789))

(declare-fun m!560791 () Bool)

(assert (=> b!582273 m!560791))

(declare-fun m!560793 () Bool)

(assert (=> b!582275 m!560793))

(declare-fun m!560795 () Bool)

(assert (=> b!582275 m!560795))

(declare-fun m!560797 () Bool)

(assert (=> b!582275 m!560797))

(declare-fun m!560799 () Bool)

(assert (=> start!53498 m!560799))

(declare-fun m!560801 () Bool)

(assert (=> start!53498 m!560801))

(declare-fun m!560803 () Bool)

(assert (=> b!582281 m!560803))

(assert (=> b!582281 m!560803))

(declare-fun m!560805 () Bool)

(assert (=> b!582281 m!560805))

(assert (=> b!582276 m!560803))

(assert (=> b!582276 m!560803))

(declare-fun m!560807 () Bool)

(assert (=> b!582276 m!560807))

(push 1)

(assert (not b!582280))

(assert (not b!582276))

(assert (not b!582278))

(assert (not b!582273))

(assert (not b!582277))

(assert (not b!582279))

(assert (not start!53498))

(assert (not b!582281))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

