; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53560 () Bool)

(assert start!53560)

(declare-fun b!583110 () Bool)

(declare-fun e!334210 () Bool)

(declare-fun e!334211 () Bool)

(assert (=> b!583110 (= e!334210 e!334211)))

(declare-fun res!370928 () Bool)

(assert (=> b!583110 (=> (not res!370928) (not e!334211))))

(declare-datatypes ((SeekEntryResult!5945 0))(
  ( (MissingZero!5945 (index!26007 (_ BitVec 32))) (Found!5945 (index!26008 (_ BitVec 32))) (Intermediate!5945 (undefined!6757 Bool) (index!26009 (_ BitVec 32)) (x!54854 (_ BitVec 32))) (Undefined!5945) (MissingVacant!5945 (index!26010 (_ BitVec 32))) )
))
(declare-fun lt!265263 () SeekEntryResult!5945)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!583110 (= res!370928 (or (= lt!265263 (MissingZero!5945 i!1108)) (= lt!265263 (MissingVacant!5945 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36461 0))(
  ( (array!36462 (arr!17505 (Array (_ BitVec 32) (_ BitVec 64))) (size!17869 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36461)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36461 (_ BitVec 32)) SeekEntryResult!5945)

(assert (=> b!583110 (= lt!265263 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!583112 () Bool)

(declare-fun res!370934 () Bool)

(assert (=> b!583112 (=> (not res!370934) (not e!334210))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583112 (= res!370934 (validKeyInArray!0 (select (arr!17505 a!2986) j!136)))))

(declare-fun b!583113 () Bool)

(declare-fun res!370931 () Bool)

(assert (=> b!583113 (=> (not res!370931) (not e!334210))))

(assert (=> b!583113 (= res!370931 (validKeyInArray!0 k!1786))))

(declare-fun b!583114 () Bool)

(declare-fun res!370926 () Bool)

(assert (=> b!583114 (=> (not res!370926) (not e!334211))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36461 (_ BitVec 32)) Bool)

(assert (=> b!583114 (= res!370926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583115 () Bool)

(declare-fun res!370932 () Bool)

(assert (=> b!583115 (=> (not res!370932) (not e!334211))))

(declare-datatypes ((List!11546 0))(
  ( (Nil!11543) (Cons!11542 (h!12587 (_ BitVec 64)) (t!17774 List!11546)) )
))
(declare-fun arrayNoDuplicates!0 (array!36461 (_ BitVec 32) List!11546) Bool)

(assert (=> b!583115 (= res!370932 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11543))))

(declare-fun b!583116 () Bool)

(declare-fun res!370927 () Bool)

(assert (=> b!583116 (=> (not res!370927) (not e!334210))))

(declare-fun arrayContainsKey!0 (array!36461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583116 (= res!370927 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583111 () Bool)

(declare-fun res!370930 () Bool)

(assert (=> b!583111 (=> (not res!370930) (not e!334211))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!583111 (= res!370930 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17505 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17505 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!370933 () Bool)

(assert (=> start!53560 (=> (not res!370933) (not e!334210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53560 (= res!370933 (validMask!0 mask!3053))))

(assert (=> start!53560 e!334210))

(assert (=> start!53560 true))

(declare-fun array_inv!13301 (array!36461) Bool)

(assert (=> start!53560 (array_inv!13301 a!2986)))

(declare-fun b!583117 () Bool)

(assert (=> b!583117 (= e!334211 false)))

(declare-fun lt!265264 () SeekEntryResult!5945)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36461 (_ BitVec 32)) SeekEntryResult!5945)

(assert (=> b!583117 (= lt!265264 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17505 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583118 () Bool)

(declare-fun res!370929 () Bool)

(assert (=> b!583118 (=> (not res!370929) (not e!334210))))

(assert (=> b!583118 (= res!370929 (and (= (size!17869 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17869 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17869 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53560 res!370933) b!583118))

(assert (= (and b!583118 res!370929) b!583112))

(assert (= (and b!583112 res!370934) b!583113))

(assert (= (and b!583113 res!370931) b!583116))

(assert (= (and b!583116 res!370927) b!583110))

(assert (= (and b!583110 res!370928) b!583114))

(assert (= (and b!583114 res!370926) b!583115))

(assert (= (and b!583115 res!370932) b!583111))

(assert (= (and b!583111 res!370930) b!583117))

(declare-fun m!561589 () Bool)

(assert (=> b!583110 m!561589))

(declare-fun m!561591 () Bool)

(assert (=> b!583113 m!561591))

(declare-fun m!561593 () Bool)

(assert (=> start!53560 m!561593))

(declare-fun m!561595 () Bool)

(assert (=> start!53560 m!561595))

(declare-fun m!561597 () Bool)

(assert (=> b!583112 m!561597))

(assert (=> b!583112 m!561597))

(declare-fun m!561599 () Bool)

(assert (=> b!583112 m!561599))

(declare-fun m!561601 () Bool)

(assert (=> b!583114 m!561601))

(declare-fun m!561603 () Bool)

(assert (=> b!583115 m!561603))

(declare-fun m!561605 () Bool)

(assert (=> b!583116 m!561605))

(assert (=> b!583117 m!561597))

(assert (=> b!583117 m!561597))

(declare-fun m!561607 () Bool)

(assert (=> b!583117 m!561607))

(declare-fun m!561609 () Bool)

(assert (=> b!583111 m!561609))

(declare-fun m!561611 () Bool)

(assert (=> b!583111 m!561611))

(declare-fun m!561613 () Bool)

(assert (=> b!583111 m!561613))

(push 1)

