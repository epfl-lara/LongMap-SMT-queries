; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53542 () Bool)

(assert start!53542)

(declare-fun b!582868 () Bool)

(declare-fun res!370685 () Bool)

(declare-fun e!334129 () Bool)

(assert (=> b!582868 (=> (not res!370685) (not e!334129))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36443 0))(
  ( (array!36444 (arr!17496 (Array (_ BitVec 32) (_ BitVec 64))) (size!17860 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36443)

(assert (=> b!582868 (= res!370685 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17496 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17496 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582869 () Bool)

(declare-fun res!370686 () Bool)

(declare-fun e!334130 () Bool)

(assert (=> b!582869 (=> (not res!370686) (not e!334130))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!582869 (= res!370686 (and (= (size!17860 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17860 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17860 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582870 () Bool)

(declare-fun res!370689 () Bool)

(assert (=> b!582870 (=> (not res!370689) (not e!334130))))

(declare-fun arrayContainsKey!0 (array!36443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582870 (= res!370689 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582871 () Bool)

(declare-fun res!370683 () Bool)

(assert (=> b!582871 (=> (not res!370683) (not e!334130))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582871 (= res!370683 (validKeyInArray!0 (select (arr!17496 a!2986) j!136)))))

(declare-fun b!582872 () Bool)

(declare-fun res!370684 () Bool)

(assert (=> b!582872 (=> (not res!370684) (not e!334129))))

(declare-datatypes ((List!11537 0))(
  ( (Nil!11534) (Cons!11533 (h!12578 (_ BitVec 64)) (t!17765 List!11537)) )
))
(declare-fun arrayNoDuplicates!0 (array!36443 (_ BitVec 32) List!11537) Bool)

(assert (=> b!582872 (= res!370684 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11534))))

(declare-fun b!582873 () Bool)

(assert (=> b!582873 (= e!334129 false)))

(declare-datatypes ((SeekEntryResult!5936 0))(
  ( (MissingZero!5936 (index!25971 (_ BitVec 32))) (Found!5936 (index!25972 (_ BitVec 32))) (Intermediate!5936 (undefined!6748 Bool) (index!25973 (_ BitVec 32)) (x!54821 (_ BitVec 32))) (Undefined!5936) (MissingVacant!5936 (index!25974 (_ BitVec 32))) )
))
(declare-fun lt!265209 () SeekEntryResult!5936)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36443 (_ BitVec 32)) SeekEntryResult!5936)

(assert (=> b!582873 (= lt!265209 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17496 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582874 () Bool)

(declare-fun res!370691 () Bool)

(assert (=> b!582874 (=> (not res!370691) (not e!334130))))

(assert (=> b!582874 (= res!370691 (validKeyInArray!0 k!1786))))

(declare-fun b!582875 () Bool)

(declare-fun res!370690 () Bool)

(assert (=> b!582875 (=> (not res!370690) (not e!334129))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36443 (_ BitVec 32)) Bool)

(assert (=> b!582875 (= res!370690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582867 () Bool)

(assert (=> b!582867 (= e!334130 e!334129)))

(declare-fun res!370688 () Bool)

(assert (=> b!582867 (=> (not res!370688) (not e!334129))))

(declare-fun lt!265210 () SeekEntryResult!5936)

(assert (=> b!582867 (= res!370688 (or (= lt!265210 (MissingZero!5936 i!1108)) (= lt!265210 (MissingVacant!5936 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36443 (_ BitVec 32)) SeekEntryResult!5936)

(assert (=> b!582867 (= lt!265210 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!370687 () Bool)

(assert (=> start!53542 (=> (not res!370687) (not e!334130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53542 (= res!370687 (validMask!0 mask!3053))))

(assert (=> start!53542 e!334130))

(assert (=> start!53542 true))

(declare-fun array_inv!13292 (array!36443) Bool)

(assert (=> start!53542 (array_inv!13292 a!2986)))

(assert (= (and start!53542 res!370687) b!582869))

(assert (= (and b!582869 res!370686) b!582871))

(assert (= (and b!582871 res!370683) b!582874))

(assert (= (and b!582874 res!370691) b!582870))

(assert (= (and b!582870 res!370689) b!582867))

(assert (= (and b!582867 res!370688) b!582875))

(assert (= (and b!582875 res!370690) b!582872))

(assert (= (and b!582872 res!370684) b!582868))

(assert (= (and b!582868 res!370685) b!582873))

(declare-fun m!561355 () Bool)

(assert (=> b!582874 m!561355))

(declare-fun m!561357 () Bool)

(assert (=> b!582873 m!561357))

(assert (=> b!582873 m!561357))

(declare-fun m!561359 () Bool)

(assert (=> b!582873 m!561359))

(declare-fun m!561361 () Bool)

(assert (=> b!582867 m!561361))

(assert (=> b!582871 m!561357))

(assert (=> b!582871 m!561357))

(declare-fun m!561363 () Bool)

(assert (=> b!582871 m!561363))

(declare-fun m!561365 () Bool)

(assert (=> b!582870 m!561365))

(declare-fun m!561367 () Bool)

(assert (=> b!582868 m!561367))

(declare-fun m!561369 () Bool)

(assert (=> b!582868 m!561369))

(declare-fun m!561371 () Bool)

(assert (=> b!582868 m!561371))

(declare-fun m!561373 () Bool)

(assert (=> b!582875 m!561373))

(declare-fun m!561375 () Bool)

(assert (=> b!582872 m!561375))

(declare-fun m!561377 () Bool)

(assert (=> start!53542 m!561377))

(declare-fun m!561379 () Bool)

(assert (=> start!53542 m!561379))

(push 1)

(assert (not b!582867))

(assert (not b!582870))

(assert (not b!582875))

(assert (not start!53542))

(assert (not b!582873))

(assert (not b!582874))

(assert (not b!582871))

(assert (not b!582872))

(check-sat)

