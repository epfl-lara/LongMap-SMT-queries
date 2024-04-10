; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53326 () Bool)

(assert start!53326)

(declare-fun b!579915 () Bool)

(declare-fun e!333159 () Bool)

(declare-fun e!333158 () Bool)

(assert (=> b!579915 (= e!333159 e!333158)))

(declare-fun res!367734 () Bool)

(assert (=> b!579915 (=> (not res!367734) (not e!333158))))

(declare-datatypes ((SeekEntryResult!5828 0))(
  ( (MissingZero!5828 (index!25539 (_ BitVec 32))) (Found!5828 (index!25540 (_ BitVec 32))) (Intermediate!5828 (undefined!6640 Bool) (index!25541 (_ BitVec 32)) (x!54425 (_ BitVec 32))) (Undefined!5828) (MissingVacant!5828 (index!25542 (_ BitVec 32))) )
))
(declare-fun lt!264589 () SeekEntryResult!5828)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579915 (= res!367734 (or (= lt!264589 (MissingZero!5828 i!1108)) (= lt!264589 (MissingVacant!5828 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36227 0))(
  ( (array!36228 (arr!17388 (Array (_ BitVec 32) (_ BitVec 64))) (size!17752 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36227)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36227 (_ BitVec 32)) SeekEntryResult!5828)

(assert (=> b!579915 (= lt!264589 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!579916 () Bool)

(declare-fun res!367732 () Bool)

(assert (=> b!579916 (=> (not res!367732) (not e!333159))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579916 (= res!367732 (validKeyInArray!0 (select (arr!17388 a!2986) j!136)))))

(declare-fun b!579917 () Bool)

(declare-fun res!367735 () Bool)

(assert (=> b!579917 (=> (not res!367735) (not e!333158))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!579917 (= res!367735 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17388 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17388 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579918 () Bool)

(declare-fun res!367736 () Bool)

(assert (=> b!579918 (=> (not res!367736) (not e!333159))))

(assert (=> b!579918 (= res!367736 (validKeyInArray!0 k!1786))))

(declare-fun b!579919 () Bool)

(declare-fun res!367738 () Bool)

(assert (=> b!579919 (=> (not res!367738) (not e!333159))))

(assert (=> b!579919 (= res!367738 (and (= (size!17752 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17752 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17752 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579920 () Bool)

(assert (=> b!579920 (= e!333158 false)))

(declare-fun lt!264588 () SeekEntryResult!5828)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36227 (_ BitVec 32)) SeekEntryResult!5828)

(assert (=> b!579920 (= lt!264588 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17388 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579921 () Bool)

(declare-fun res!367737 () Bool)

(assert (=> b!579921 (=> (not res!367737) (not e!333158))))

(declare-datatypes ((List!11429 0))(
  ( (Nil!11426) (Cons!11425 (h!12470 (_ BitVec 64)) (t!17657 List!11429)) )
))
(declare-fun arrayNoDuplicates!0 (array!36227 (_ BitVec 32) List!11429) Bool)

(assert (=> b!579921 (= res!367737 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11426))))

(declare-fun res!367739 () Bool)

(assert (=> start!53326 (=> (not res!367739) (not e!333159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53326 (= res!367739 (validMask!0 mask!3053))))

(assert (=> start!53326 e!333159))

(assert (=> start!53326 true))

(declare-fun array_inv!13184 (array!36227) Bool)

(assert (=> start!53326 (array_inv!13184 a!2986)))

(declare-fun b!579922 () Bool)

(declare-fun res!367733 () Bool)

(assert (=> b!579922 (=> (not res!367733) (not e!333158))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36227 (_ BitVec 32)) Bool)

(assert (=> b!579922 (= res!367733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579923 () Bool)

(declare-fun res!367731 () Bool)

(assert (=> b!579923 (=> (not res!367731) (not e!333159))))

(declare-fun arrayContainsKey!0 (array!36227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579923 (= res!367731 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53326 res!367739) b!579919))

(assert (= (and b!579919 res!367738) b!579916))

(assert (= (and b!579916 res!367732) b!579918))

(assert (= (and b!579918 res!367736) b!579923))

(assert (= (and b!579923 res!367731) b!579915))

(assert (= (and b!579915 res!367734) b!579922))

(assert (= (and b!579922 res!367733) b!579921))

(assert (= (and b!579921 res!367737) b!579917))

(assert (= (and b!579917 res!367735) b!579920))

(declare-fun m!558517 () Bool)

(assert (=> b!579921 m!558517))

(declare-fun m!558519 () Bool)

(assert (=> b!579920 m!558519))

(assert (=> b!579920 m!558519))

(declare-fun m!558521 () Bool)

(assert (=> b!579920 m!558521))

(declare-fun m!558523 () Bool)

(assert (=> b!579918 m!558523))

(declare-fun m!558525 () Bool)

(assert (=> b!579922 m!558525))

(declare-fun m!558527 () Bool)

(assert (=> b!579915 m!558527))

(declare-fun m!558529 () Bool)

(assert (=> b!579923 m!558529))

(assert (=> b!579916 m!558519))

(assert (=> b!579916 m!558519))

(declare-fun m!558531 () Bool)

(assert (=> b!579916 m!558531))

(declare-fun m!558533 () Bool)

(assert (=> b!579917 m!558533))

(declare-fun m!558535 () Bool)

(assert (=> b!579917 m!558535))

(declare-fun m!558537 () Bool)

(assert (=> b!579917 m!558537))

(declare-fun m!558539 () Bool)

(assert (=> start!53326 m!558539))

(declare-fun m!558541 () Bool)

(assert (=> start!53326 m!558541))

(push 1)

