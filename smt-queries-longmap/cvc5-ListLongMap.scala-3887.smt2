; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53332 () Bool)

(assert start!53332)

(declare-fun b!579996 () Bool)

(declare-fun res!367818 () Bool)

(declare-fun e!333184 () Bool)

(assert (=> b!579996 (=> (not res!367818) (not e!333184))))

(declare-datatypes ((array!36233 0))(
  ( (array!36234 (arr!17391 (Array (_ BitVec 32) (_ BitVec 64))) (size!17755 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36233)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36233 (_ BitVec 32)) Bool)

(assert (=> b!579996 (= res!367818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579997 () Bool)

(declare-fun res!367815 () Bool)

(declare-fun e!333186 () Bool)

(assert (=> b!579997 (=> (not res!367815) (not e!333186))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579997 (= res!367815 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579998 () Bool)

(declare-fun res!367814 () Bool)

(assert (=> b!579998 (=> (not res!367814) (not e!333186))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579998 (= res!367814 (validKeyInArray!0 (select (arr!17391 a!2986) j!136)))))

(declare-fun res!367816 () Bool)

(assert (=> start!53332 (=> (not res!367816) (not e!333186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53332 (= res!367816 (validMask!0 mask!3053))))

(assert (=> start!53332 e!333186))

(assert (=> start!53332 true))

(declare-fun array_inv!13187 (array!36233) Bool)

(assert (=> start!53332 (array_inv!13187 a!2986)))

(declare-fun b!579999 () Bool)

(declare-fun res!367819 () Bool)

(assert (=> b!579999 (=> (not res!367819) (not e!333186))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579999 (= res!367819 (and (= (size!17755 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17755 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17755 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580000 () Bool)

(assert (=> b!580000 (= e!333184 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5831 0))(
  ( (MissingZero!5831 (index!25551 (_ BitVec 32))) (Found!5831 (index!25552 (_ BitVec 32))) (Intermediate!5831 (undefined!6643 Bool) (index!25553 (_ BitVec 32)) (x!54436 (_ BitVec 32))) (Undefined!5831) (MissingVacant!5831 (index!25554 (_ BitVec 32))) )
))
(declare-fun lt!264606 () SeekEntryResult!5831)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36233 (_ BitVec 32)) SeekEntryResult!5831)

(assert (=> b!580000 (= lt!264606 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17391 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580001 () Bool)

(declare-fun res!367812 () Bool)

(assert (=> b!580001 (=> (not res!367812) (not e!333184))))

(assert (=> b!580001 (= res!367812 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17391 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17391 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580002 () Bool)

(assert (=> b!580002 (= e!333186 e!333184)))

(declare-fun res!367817 () Bool)

(assert (=> b!580002 (=> (not res!367817) (not e!333184))))

(declare-fun lt!264607 () SeekEntryResult!5831)

(assert (=> b!580002 (= res!367817 (or (= lt!264607 (MissingZero!5831 i!1108)) (= lt!264607 (MissingVacant!5831 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36233 (_ BitVec 32)) SeekEntryResult!5831)

(assert (=> b!580002 (= lt!264607 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!580003 () Bool)

(declare-fun res!367820 () Bool)

(assert (=> b!580003 (=> (not res!367820) (not e!333186))))

(assert (=> b!580003 (= res!367820 (validKeyInArray!0 k!1786))))

(declare-fun b!580004 () Bool)

(declare-fun res!367813 () Bool)

(assert (=> b!580004 (=> (not res!367813) (not e!333184))))

(declare-datatypes ((List!11432 0))(
  ( (Nil!11429) (Cons!11428 (h!12473 (_ BitVec 64)) (t!17660 List!11432)) )
))
(declare-fun arrayNoDuplicates!0 (array!36233 (_ BitVec 32) List!11432) Bool)

(assert (=> b!580004 (= res!367813 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11429))))

(assert (= (and start!53332 res!367816) b!579999))

(assert (= (and b!579999 res!367819) b!579998))

(assert (= (and b!579998 res!367814) b!580003))

(assert (= (and b!580003 res!367820) b!579997))

(assert (= (and b!579997 res!367815) b!580002))

(assert (= (and b!580002 res!367817) b!579996))

(assert (= (and b!579996 res!367818) b!580004))

(assert (= (and b!580004 res!367813) b!580001))

(assert (= (and b!580001 res!367812) b!580000))

(declare-fun m!558595 () Bool)

(assert (=> b!580001 m!558595))

(declare-fun m!558597 () Bool)

(assert (=> b!580001 m!558597))

(declare-fun m!558599 () Bool)

(assert (=> b!580001 m!558599))

(declare-fun m!558601 () Bool)

(assert (=> b!580003 m!558601))

(declare-fun m!558603 () Bool)

(assert (=> b!580000 m!558603))

(assert (=> b!580000 m!558603))

(declare-fun m!558605 () Bool)

(assert (=> b!580000 m!558605))

(declare-fun m!558607 () Bool)

(assert (=> b!579997 m!558607))

(assert (=> b!579998 m!558603))

(assert (=> b!579998 m!558603))

(declare-fun m!558609 () Bool)

(assert (=> b!579998 m!558609))

(declare-fun m!558611 () Bool)

(assert (=> start!53332 m!558611))

(declare-fun m!558613 () Bool)

(assert (=> start!53332 m!558613))

(declare-fun m!558615 () Bool)

(assert (=> b!580002 m!558615))

(declare-fun m!558617 () Bool)

(assert (=> b!579996 m!558617))

(declare-fun m!558619 () Bool)

(assert (=> b!580004 m!558619))

(push 1)

