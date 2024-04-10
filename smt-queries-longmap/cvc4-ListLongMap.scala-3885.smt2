; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53324 () Bool)

(assert start!53324)

(declare-fun b!579888 () Bool)

(declare-fun res!367705 () Bool)

(declare-fun e!333150 () Bool)

(assert (=> b!579888 (=> (not res!367705) (not e!333150))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36225 0))(
  ( (array!36226 (arr!17387 (Array (_ BitVec 32) (_ BitVec 64))) (size!17751 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36225)

(assert (=> b!579888 (= res!367705 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17387 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17387 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!367709 () Bool)

(declare-fun e!333148 () Bool)

(assert (=> start!53324 (=> (not res!367709) (not e!333148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53324 (= res!367709 (validMask!0 mask!3053))))

(assert (=> start!53324 e!333148))

(assert (=> start!53324 true))

(declare-fun array_inv!13183 (array!36225) Bool)

(assert (=> start!53324 (array_inv!13183 a!2986)))

(declare-fun b!579889 () Bool)

(declare-fun res!367706 () Bool)

(assert (=> b!579889 (=> (not res!367706) (not e!333150))))

(declare-datatypes ((List!11428 0))(
  ( (Nil!11425) (Cons!11424 (h!12469 (_ BitVec 64)) (t!17656 List!11428)) )
))
(declare-fun arrayNoDuplicates!0 (array!36225 (_ BitVec 32) List!11428) Bool)

(assert (=> b!579889 (= res!367706 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11425))))

(declare-fun b!579890 () Bool)

(declare-fun res!367708 () Bool)

(assert (=> b!579890 (=> (not res!367708) (not e!333148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579890 (= res!367708 (validKeyInArray!0 k!1786))))

(declare-fun b!579891 () Bool)

(declare-fun res!367711 () Bool)

(assert (=> b!579891 (=> (not res!367711) (not e!333148))))

(declare-fun arrayContainsKey!0 (array!36225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579891 (= res!367711 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579892 () Bool)

(assert (=> b!579892 (= e!333150 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5827 0))(
  ( (MissingZero!5827 (index!25535 (_ BitVec 32))) (Found!5827 (index!25536 (_ BitVec 32))) (Intermediate!5827 (undefined!6639 Bool) (index!25537 (_ BitVec 32)) (x!54416 (_ BitVec 32))) (Undefined!5827) (MissingVacant!5827 (index!25538 (_ BitVec 32))) )
))
(declare-fun lt!264582 () SeekEntryResult!5827)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36225 (_ BitVec 32)) SeekEntryResult!5827)

(assert (=> b!579892 (= lt!264582 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17387 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579893 () Bool)

(declare-fun res!367704 () Bool)

(assert (=> b!579893 (=> (not res!367704) (not e!333148))))

(assert (=> b!579893 (= res!367704 (validKeyInArray!0 (select (arr!17387 a!2986) j!136)))))

(declare-fun b!579894 () Bool)

(assert (=> b!579894 (= e!333148 e!333150)))

(declare-fun res!367710 () Bool)

(assert (=> b!579894 (=> (not res!367710) (not e!333150))))

(declare-fun lt!264583 () SeekEntryResult!5827)

(assert (=> b!579894 (= res!367710 (or (= lt!264583 (MissingZero!5827 i!1108)) (= lt!264583 (MissingVacant!5827 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36225 (_ BitVec 32)) SeekEntryResult!5827)

(assert (=> b!579894 (= lt!264583 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!579895 () Bool)

(declare-fun res!367707 () Bool)

(assert (=> b!579895 (=> (not res!367707) (not e!333148))))

(assert (=> b!579895 (= res!367707 (and (= (size!17751 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17751 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17751 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579896 () Bool)

(declare-fun res!367712 () Bool)

(assert (=> b!579896 (=> (not res!367712) (not e!333150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36225 (_ BitVec 32)) Bool)

(assert (=> b!579896 (= res!367712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53324 res!367709) b!579895))

(assert (= (and b!579895 res!367707) b!579893))

(assert (= (and b!579893 res!367704) b!579890))

(assert (= (and b!579890 res!367708) b!579891))

(assert (= (and b!579891 res!367711) b!579894))

(assert (= (and b!579894 res!367710) b!579896))

(assert (= (and b!579896 res!367712) b!579889))

(assert (= (and b!579889 res!367706) b!579888))

(assert (= (and b!579888 res!367705) b!579892))

(declare-fun m!558491 () Bool)

(assert (=> b!579894 m!558491))

(declare-fun m!558493 () Bool)

(assert (=> start!53324 m!558493))

(declare-fun m!558495 () Bool)

(assert (=> start!53324 m!558495))

(declare-fun m!558497 () Bool)

(assert (=> b!579892 m!558497))

(assert (=> b!579892 m!558497))

(declare-fun m!558499 () Bool)

(assert (=> b!579892 m!558499))

(declare-fun m!558501 () Bool)

(assert (=> b!579888 m!558501))

(declare-fun m!558503 () Bool)

(assert (=> b!579888 m!558503))

(declare-fun m!558505 () Bool)

(assert (=> b!579888 m!558505))

(declare-fun m!558507 () Bool)

(assert (=> b!579889 m!558507))

(declare-fun m!558509 () Bool)

(assert (=> b!579896 m!558509))

(declare-fun m!558511 () Bool)

(assert (=> b!579891 m!558511))

(declare-fun m!558513 () Bool)

(assert (=> b!579890 m!558513))

(assert (=> b!579893 m!558497))

(assert (=> b!579893 m!558497))

(declare-fun m!558515 () Bool)

(assert (=> b!579893 m!558515))

(push 1)

(assert (not b!579893))

(assert (not b!579894))

(assert (not b!579891))

(assert (not start!53324))

(assert (not b!579890))

(assert (not b!579889))

