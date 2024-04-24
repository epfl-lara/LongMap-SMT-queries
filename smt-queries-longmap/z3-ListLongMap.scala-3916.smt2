; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53556 () Bool)

(assert start!53556)

(declare-fun b!582581 () Bool)

(declare-fun e!334096 () Bool)

(assert (=> b!582581 (= e!334096 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5869 0))(
  ( (MissingZero!5869 (index!25703 (_ BitVec 32))) (Found!5869 (index!25704 (_ BitVec 32))) (Intermediate!5869 (undefined!6681 Bool) (index!25705 (_ BitVec 32)) (x!54709 (_ BitVec 32))) (Undefined!5869) (MissingVacant!5869 (index!25706 (_ BitVec 32))) )
))
(declare-fun lt!265212 () SeekEntryResult!5869)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36402 0))(
  ( (array!36403 (arr!17473 (Array (_ BitVec 32) (_ BitVec 64))) (size!17837 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36402)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36402 (_ BitVec 32)) SeekEntryResult!5869)

(assert (=> b!582581 (= lt!265212 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17473 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582582 () Bool)

(declare-fun res!370293 () Bool)

(declare-fun e!334097 () Bool)

(assert (=> b!582582 (=> (not res!370293) (not e!334097))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582582 (= res!370293 (validKeyInArray!0 (select (arr!17473 a!2986) j!136)))))

(declare-fun b!582583 () Bool)

(assert (=> b!582583 (= e!334097 e!334096)))

(declare-fun res!370295 () Bool)

(assert (=> b!582583 (=> (not res!370295) (not e!334096))))

(declare-fun lt!265213 () SeekEntryResult!5869)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582583 (= res!370295 (or (= lt!265213 (MissingZero!5869 i!1108)) (= lt!265213 (MissingVacant!5869 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36402 (_ BitVec 32)) SeekEntryResult!5869)

(assert (=> b!582583 (= lt!265213 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582584 () Bool)

(declare-fun res!370298 () Bool)

(assert (=> b!582584 (=> (not res!370298) (not e!334097))))

(assert (=> b!582584 (= res!370298 (and (= (size!17837 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17837 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17837 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582585 () Bool)

(declare-fun res!370296 () Bool)

(assert (=> b!582585 (=> (not res!370296) (not e!334096))))

(assert (=> b!582585 (= res!370296 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17473 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17473 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!370299 () Bool)

(assert (=> start!53556 (=> (not res!370299) (not e!334097))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53556 (= res!370299 (validMask!0 mask!3053))))

(assert (=> start!53556 e!334097))

(assert (=> start!53556 true))

(declare-fun array_inv!13332 (array!36402) Bool)

(assert (=> start!53556 (array_inv!13332 a!2986)))

(declare-fun b!582586 () Bool)

(declare-fun res!370297 () Bool)

(assert (=> b!582586 (=> (not res!370297) (not e!334097))))

(declare-fun arrayContainsKey!0 (array!36402 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582586 (= res!370297 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582587 () Bool)

(declare-fun res!370292 () Bool)

(assert (=> b!582587 (=> (not res!370292) (not e!334097))))

(assert (=> b!582587 (= res!370292 (validKeyInArray!0 k0!1786))))

(declare-fun b!582588 () Bool)

(declare-fun res!370294 () Bool)

(assert (=> b!582588 (=> (not res!370294) (not e!334096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36402 (_ BitVec 32)) Bool)

(assert (=> b!582588 (= res!370294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582589 () Bool)

(declare-fun res!370300 () Bool)

(assert (=> b!582589 (=> (not res!370300) (not e!334096))))

(declare-datatypes ((List!11421 0))(
  ( (Nil!11418) (Cons!11417 (h!12465 (_ BitVec 64)) (t!17641 List!11421)) )
))
(declare-fun arrayNoDuplicates!0 (array!36402 (_ BitVec 32) List!11421) Bool)

(assert (=> b!582589 (= res!370300 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11418))))

(assert (= (and start!53556 res!370299) b!582584))

(assert (= (and b!582584 res!370298) b!582582))

(assert (= (and b!582582 res!370293) b!582587))

(assert (= (and b!582587 res!370292) b!582586))

(assert (= (and b!582586 res!370297) b!582583))

(assert (= (and b!582583 res!370295) b!582588))

(assert (= (and b!582588 res!370294) b!582589))

(assert (= (and b!582589 res!370300) b!582585))

(assert (= (and b!582585 res!370296) b!582581))

(declare-fun m!561239 () Bool)

(assert (=> b!582581 m!561239))

(assert (=> b!582581 m!561239))

(declare-fun m!561241 () Bool)

(assert (=> b!582581 m!561241))

(declare-fun m!561243 () Bool)

(assert (=> b!582585 m!561243))

(declare-fun m!561245 () Bool)

(assert (=> b!582585 m!561245))

(declare-fun m!561247 () Bool)

(assert (=> b!582585 m!561247))

(declare-fun m!561249 () Bool)

(assert (=> b!582587 m!561249))

(assert (=> b!582582 m!561239))

(assert (=> b!582582 m!561239))

(declare-fun m!561251 () Bool)

(assert (=> b!582582 m!561251))

(declare-fun m!561253 () Bool)

(assert (=> b!582583 m!561253))

(declare-fun m!561255 () Bool)

(assert (=> b!582589 m!561255))

(declare-fun m!561257 () Bool)

(assert (=> b!582588 m!561257))

(declare-fun m!561259 () Bool)

(assert (=> b!582586 m!561259))

(declare-fun m!561261 () Bool)

(assert (=> start!53556 m!561261))

(declare-fun m!561263 () Bool)

(assert (=> start!53556 m!561263))

(check-sat (not b!582587) (not b!582586) (not b!582583) (not b!582581) (not b!582589) (not b!582582) (not start!53556) (not b!582588))
(check-sat)
