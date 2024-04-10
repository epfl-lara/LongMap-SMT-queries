; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53486 () Bool)

(assert start!53486)

(declare-fun b!582111 () Bool)

(declare-fun res!369931 () Bool)

(declare-fun e!333877 () Bool)

(assert (=> b!582111 (=> (not res!369931) (not e!333877))))

(declare-datatypes ((array!36387 0))(
  ( (array!36388 (arr!17468 (Array (_ BitVec 32) (_ BitVec 64))) (size!17832 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36387)

(declare-datatypes ((List!11509 0))(
  ( (Nil!11506) (Cons!11505 (h!12550 (_ BitVec 64)) (t!17737 List!11509)) )
))
(declare-fun arrayNoDuplicates!0 (array!36387 (_ BitVec 32) List!11509) Bool)

(assert (=> b!582111 (= res!369931 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11506))))

(declare-fun b!582112 () Bool)

(declare-fun e!333878 () Bool)

(assert (=> b!582112 (= e!333878 e!333877)))

(declare-fun res!369934 () Bool)

(assert (=> b!582112 (=> (not res!369934) (not e!333877))))

(declare-datatypes ((SeekEntryResult!5908 0))(
  ( (MissingZero!5908 (index!25859 (_ BitVec 32))) (Found!5908 (index!25860 (_ BitVec 32))) (Intermediate!5908 (undefined!6720 Bool) (index!25861 (_ BitVec 32)) (x!54713 (_ BitVec 32))) (Undefined!5908) (MissingVacant!5908 (index!25862 (_ BitVec 32))) )
))
(declare-fun lt!265041 () SeekEntryResult!5908)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582112 (= res!369934 (or (= lt!265041 (MissingZero!5908 i!1108)) (= lt!265041 (MissingVacant!5908 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36387 (_ BitVec 32)) SeekEntryResult!5908)

(assert (=> b!582112 (= lt!265041 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!582113 () Bool)

(declare-fun res!369933 () Bool)

(assert (=> b!582113 (=> (not res!369933) (not e!333878))))

(declare-fun arrayContainsKey!0 (array!36387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582113 (= res!369933 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582114 () Bool)

(declare-fun res!369930 () Bool)

(assert (=> b!582114 (=> (not res!369930) (not e!333878))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582114 (= res!369930 (validKeyInArray!0 k!1786))))

(declare-fun b!582115 () Bool)

(declare-fun res!369932 () Bool)

(assert (=> b!582115 (=> (not res!369932) (not e!333877))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36387 (_ BitVec 32)) Bool)

(assert (=> b!582115 (= res!369932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!369928 () Bool)

(assert (=> start!53486 (=> (not res!369928) (not e!333878))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53486 (= res!369928 (validMask!0 mask!3053))))

(assert (=> start!53486 e!333878))

(assert (=> start!53486 true))

(declare-fun array_inv!13264 (array!36387) Bool)

(assert (=> start!53486 (array_inv!13264 a!2986)))

(declare-fun b!582116 () Bool)

(assert (=> b!582116 (= e!333877 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!265042 () SeekEntryResult!5908)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36387 (_ BitVec 32)) SeekEntryResult!5908)

(assert (=> b!582116 (= lt!265042 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17468 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582117 () Bool)

(declare-fun res!369927 () Bool)

(assert (=> b!582117 (=> (not res!369927) (not e!333878))))

(assert (=> b!582117 (= res!369927 (and (= (size!17832 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17832 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17832 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582118 () Bool)

(declare-fun res!369929 () Bool)

(assert (=> b!582118 (=> (not res!369929) (not e!333877))))

(assert (=> b!582118 (= res!369929 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17468 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17468 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582119 () Bool)

(declare-fun res!369935 () Bool)

(assert (=> b!582119 (=> (not res!369935) (not e!333878))))

(assert (=> b!582119 (= res!369935 (validKeyInArray!0 (select (arr!17468 a!2986) j!136)))))

(assert (= (and start!53486 res!369928) b!582117))

(assert (= (and b!582117 res!369927) b!582119))

(assert (= (and b!582119 res!369935) b!582114))

(assert (= (and b!582114 res!369930) b!582113))

(assert (= (and b!582113 res!369933) b!582112))

(assert (= (and b!582112 res!369934) b!582115))

(assert (= (and b!582115 res!369932) b!582111))

(assert (= (and b!582111 res!369931) b!582118))

(assert (= (and b!582118 res!369929) b!582116))

(declare-fun m!560627 () Bool)

(assert (=> start!53486 m!560627))

(declare-fun m!560629 () Bool)

(assert (=> start!53486 m!560629))

(declare-fun m!560631 () Bool)

(assert (=> b!582112 m!560631))

(declare-fun m!560633 () Bool)

(assert (=> b!582116 m!560633))

(assert (=> b!582116 m!560633))

(declare-fun m!560635 () Bool)

(assert (=> b!582116 m!560635))

(declare-fun m!560637 () Bool)

(assert (=> b!582113 m!560637))

(assert (=> b!582119 m!560633))

(assert (=> b!582119 m!560633))

(declare-fun m!560639 () Bool)

(assert (=> b!582119 m!560639))

(declare-fun m!560641 () Bool)

(assert (=> b!582114 m!560641))

(declare-fun m!560643 () Bool)

(assert (=> b!582111 m!560643))

(declare-fun m!560645 () Bool)

(assert (=> b!582118 m!560645))

(declare-fun m!560647 () Bool)

(assert (=> b!582118 m!560647))

(declare-fun m!560649 () Bool)

(assert (=> b!582118 m!560649))

(declare-fun m!560651 () Bool)

(assert (=> b!582115 m!560651))

(push 1)

(assert (not b!582116))

(assert (not b!582113))

(assert (not b!582115))

(assert (not b!582114))

