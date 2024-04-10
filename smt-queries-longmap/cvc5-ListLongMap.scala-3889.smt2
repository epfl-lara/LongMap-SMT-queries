; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53344 () Bool)

(assert start!53344)

(declare-fun b!580158 () Bool)

(declare-fun e!333239 () Bool)

(assert (=> b!580158 (= e!333239 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5837 0))(
  ( (MissingZero!5837 (index!25575 (_ BitVec 32))) (Found!5837 (index!25576 (_ BitVec 32))) (Intermediate!5837 (undefined!6649 Bool) (index!25577 (_ BitVec 32)) (x!54458 (_ BitVec 32))) (Undefined!5837) (MissingVacant!5837 (index!25578 (_ BitVec 32))) )
))
(declare-fun lt!264642 () SeekEntryResult!5837)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36245 0))(
  ( (array!36246 (arr!17397 (Array (_ BitVec 32) (_ BitVec 64))) (size!17761 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36245)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36245 (_ BitVec 32)) SeekEntryResult!5837)

(assert (=> b!580158 (= lt!264642 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17397 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580159 () Bool)

(declare-fun res!367974 () Bool)

(assert (=> b!580159 (=> (not res!367974) (not e!333239))))

(declare-datatypes ((List!11438 0))(
  ( (Nil!11435) (Cons!11434 (h!12479 (_ BitVec 64)) (t!17666 List!11438)) )
))
(declare-fun arrayNoDuplicates!0 (array!36245 (_ BitVec 32) List!11438) Bool)

(assert (=> b!580159 (= res!367974 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11435))))

(declare-fun b!580160 () Bool)

(declare-fun res!367981 () Bool)

(assert (=> b!580160 (=> (not res!367981) (not e!333239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36245 (_ BitVec 32)) Bool)

(assert (=> b!580160 (= res!367981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580161 () Bool)

(declare-fun res!367979 () Bool)

(declare-fun e!333238 () Bool)

(assert (=> b!580161 (=> (not res!367979) (not e!333238))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580161 (= res!367979 (validKeyInArray!0 k!1786))))

(declare-fun res!367982 () Bool)

(assert (=> start!53344 (=> (not res!367982) (not e!333238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53344 (= res!367982 (validMask!0 mask!3053))))

(assert (=> start!53344 e!333238))

(assert (=> start!53344 true))

(declare-fun array_inv!13193 (array!36245) Bool)

(assert (=> start!53344 (array_inv!13193 a!2986)))

(declare-fun b!580162 () Bool)

(declare-fun res!367977 () Bool)

(assert (=> b!580162 (=> (not res!367977) (not e!333239))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580162 (= res!367977 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17397 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17397 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580163 () Bool)

(declare-fun res!367976 () Bool)

(assert (=> b!580163 (=> (not res!367976) (not e!333238))))

(assert (=> b!580163 (= res!367976 (validKeyInArray!0 (select (arr!17397 a!2986) j!136)))))

(declare-fun b!580164 () Bool)

(declare-fun res!367975 () Bool)

(assert (=> b!580164 (=> (not res!367975) (not e!333238))))

(assert (=> b!580164 (= res!367975 (and (= (size!17761 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17761 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17761 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580165 () Bool)

(assert (=> b!580165 (= e!333238 e!333239)))

(declare-fun res!367978 () Bool)

(assert (=> b!580165 (=> (not res!367978) (not e!333239))))

(declare-fun lt!264643 () SeekEntryResult!5837)

(assert (=> b!580165 (= res!367978 (or (= lt!264643 (MissingZero!5837 i!1108)) (= lt!264643 (MissingVacant!5837 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36245 (_ BitVec 32)) SeekEntryResult!5837)

(assert (=> b!580165 (= lt!264643 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!580166 () Bool)

(declare-fun res!367980 () Bool)

(assert (=> b!580166 (=> (not res!367980) (not e!333238))))

(declare-fun arrayContainsKey!0 (array!36245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580166 (= res!367980 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53344 res!367982) b!580164))

(assert (= (and b!580164 res!367975) b!580163))

(assert (= (and b!580163 res!367976) b!580161))

(assert (= (and b!580161 res!367979) b!580166))

(assert (= (and b!580166 res!367980) b!580165))

(assert (= (and b!580165 res!367978) b!580160))

(assert (= (and b!580160 res!367981) b!580159))

(assert (= (and b!580159 res!367974) b!580162))

(assert (= (and b!580162 res!367977) b!580158))

(declare-fun m!558751 () Bool)

(assert (=> start!53344 m!558751))

(declare-fun m!558753 () Bool)

(assert (=> start!53344 m!558753))

(declare-fun m!558755 () Bool)

(assert (=> b!580165 m!558755))

(declare-fun m!558757 () Bool)

(assert (=> b!580161 m!558757))

(declare-fun m!558759 () Bool)

(assert (=> b!580163 m!558759))

(assert (=> b!580163 m!558759))

(declare-fun m!558761 () Bool)

(assert (=> b!580163 m!558761))

(declare-fun m!558763 () Bool)

(assert (=> b!580160 m!558763))

(assert (=> b!580158 m!558759))

(assert (=> b!580158 m!558759))

(declare-fun m!558765 () Bool)

(assert (=> b!580158 m!558765))

(declare-fun m!558767 () Bool)

(assert (=> b!580159 m!558767))

(declare-fun m!558769 () Bool)

(assert (=> b!580166 m!558769))

(declare-fun m!558771 () Bool)

(assert (=> b!580162 m!558771))

(declare-fun m!558773 () Bool)

(assert (=> b!580162 m!558773))

(declare-fun m!558775 () Bool)

(assert (=> b!580162 m!558775))

(push 1)

(assert (not b!580163))

(assert (not b!580161))

(assert (not start!53344))

(assert (not b!580160))

(assert (not b!580166))

(assert (not b!580159))

(assert (not b!580158))

(assert (not b!580165))

(check-sat)

(pop 1)

