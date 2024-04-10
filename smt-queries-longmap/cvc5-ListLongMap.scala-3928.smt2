; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53578 () Bool)

(assert start!53578)

(declare-fun b!583362 () Bool)

(declare-fun res!371186 () Bool)

(declare-fun e!334293 () Bool)

(assert (=> b!583362 (=> (not res!371186) (not e!334293))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583362 (= res!371186 (validKeyInArray!0 k!1786))))

(declare-fun b!583364 () Bool)

(declare-fun e!334292 () Bool)

(assert (=> b!583364 (= e!334292 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5954 0))(
  ( (MissingZero!5954 (index!26043 (_ BitVec 32))) (Found!5954 (index!26044 (_ BitVec 32))) (Intermediate!5954 (undefined!6766 Bool) (index!26045 (_ BitVec 32)) (x!54887 (_ BitVec 32))) (Undefined!5954) (MissingVacant!5954 (index!26046 (_ BitVec 32))) )
))
(declare-fun lt!265308 () SeekEntryResult!5954)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36479 0))(
  ( (array!36480 (arr!17514 (Array (_ BitVec 32) (_ BitVec 64))) (size!17878 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36479)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36479 (_ BitVec 32)) SeekEntryResult!5954)

(assert (=> b!583364 (= lt!265308 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17514 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583365 () Bool)

(declare-fun res!371185 () Bool)

(assert (=> b!583365 (=> (not res!371185) (not e!334293))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!583365 (= res!371185 (and (= (size!17878 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17878 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17878 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583366 () Bool)

(declare-fun res!371181 () Bool)

(assert (=> b!583366 (=> (not res!371181) (not e!334293))))

(assert (=> b!583366 (= res!371181 (validKeyInArray!0 (select (arr!17514 a!2986) j!136)))))

(declare-fun b!583367 () Bool)

(declare-fun res!371180 () Bool)

(assert (=> b!583367 (=> (not res!371180) (not e!334292))))

(assert (=> b!583367 (= res!371180 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17514 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17514 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583368 () Bool)

(declare-fun res!371182 () Bool)

(assert (=> b!583368 (=> (not res!371182) (not e!334292))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36479 (_ BitVec 32)) Bool)

(assert (=> b!583368 (= res!371182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583369 () Bool)

(declare-fun res!371183 () Bool)

(assert (=> b!583369 (=> (not res!371183) (not e!334293))))

(declare-fun arrayContainsKey!0 (array!36479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583369 (= res!371183 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583370 () Bool)

(assert (=> b!583370 (= e!334293 e!334292)))

(declare-fun res!371179 () Bool)

(assert (=> b!583370 (=> (not res!371179) (not e!334292))))

(declare-fun lt!265309 () SeekEntryResult!5954)

(assert (=> b!583370 (= res!371179 (or (= lt!265309 (MissingZero!5954 i!1108)) (= lt!265309 (MissingVacant!5954 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36479 (_ BitVec 32)) SeekEntryResult!5954)

(assert (=> b!583370 (= lt!265309 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!371178 () Bool)

(assert (=> start!53578 (=> (not res!371178) (not e!334293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53578 (= res!371178 (validMask!0 mask!3053))))

(assert (=> start!53578 e!334293))

(assert (=> start!53578 true))

(declare-fun array_inv!13310 (array!36479) Bool)

(assert (=> start!53578 (array_inv!13310 a!2986)))

(declare-fun b!583363 () Bool)

(declare-fun res!371184 () Bool)

(assert (=> b!583363 (=> (not res!371184) (not e!334292))))

(declare-datatypes ((List!11555 0))(
  ( (Nil!11552) (Cons!11551 (h!12596 (_ BitVec 64)) (t!17783 List!11555)) )
))
(declare-fun arrayNoDuplicates!0 (array!36479 (_ BitVec 32) List!11555) Bool)

(assert (=> b!583363 (= res!371184 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11552))))

(assert (= (and start!53578 res!371178) b!583365))

(assert (= (and b!583365 res!371185) b!583366))

(assert (= (and b!583366 res!371181) b!583362))

(assert (= (and b!583362 res!371186) b!583369))

(assert (= (and b!583369 res!371183) b!583370))

(assert (= (and b!583370 res!371179) b!583368))

(assert (= (and b!583368 res!371182) b!583363))

(assert (= (and b!583363 res!371184) b!583367))

(assert (= (and b!583367 res!371180) b!583364))

(declare-fun m!561829 () Bool)

(assert (=> b!583370 m!561829))

(declare-fun m!561831 () Bool)

(assert (=> start!53578 m!561831))

(declare-fun m!561833 () Bool)

(assert (=> start!53578 m!561833))

(declare-fun m!561835 () Bool)

(assert (=> b!583368 m!561835))

(declare-fun m!561837 () Bool)

(assert (=> b!583364 m!561837))

(assert (=> b!583364 m!561837))

(declare-fun m!561839 () Bool)

(assert (=> b!583364 m!561839))

(declare-fun m!561841 () Bool)

(assert (=> b!583363 m!561841))

(declare-fun m!561843 () Bool)

(assert (=> b!583367 m!561843))

(declare-fun m!561845 () Bool)

(assert (=> b!583367 m!561845))

(declare-fun m!561847 () Bool)

(assert (=> b!583367 m!561847))

(declare-fun m!561849 () Bool)

(assert (=> b!583362 m!561849))

(declare-fun m!561851 () Bool)

(assert (=> b!583369 m!561851))

(assert (=> b!583366 m!561837))

(assert (=> b!583366 m!561837))

(declare-fun m!561853 () Bool)

(assert (=> b!583366 m!561853))

(push 1)

