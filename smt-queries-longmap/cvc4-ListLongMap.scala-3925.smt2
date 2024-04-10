; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53564 () Bool)

(assert start!53564)

(declare-fun b!583164 () Bool)

(declare-fun res!370985 () Bool)

(declare-fun e!334230 () Bool)

(assert (=> b!583164 (=> (not res!370985) (not e!334230))))

(declare-datatypes ((array!36465 0))(
  ( (array!36466 (arr!17507 (Array (_ BitVec 32) (_ BitVec 64))) (size!17871 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36465)

(declare-datatypes ((List!11548 0))(
  ( (Nil!11545) (Cons!11544 (h!12589 (_ BitVec 64)) (t!17776 List!11548)) )
))
(declare-fun arrayNoDuplicates!0 (array!36465 (_ BitVec 32) List!11548) Bool)

(assert (=> b!583164 (= res!370985 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11545))))

(declare-fun b!583165 () Bool)

(declare-fun res!370987 () Bool)

(declare-fun e!334229 () Bool)

(assert (=> b!583165 (=> (not res!370987) (not e!334229))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583165 (= res!370987 (validKeyInArray!0 k!1786))))

(declare-fun b!583166 () Bool)

(assert (=> b!583166 (= e!334229 e!334230)))

(declare-fun res!370981 () Bool)

(assert (=> b!583166 (=> (not res!370981) (not e!334230))))

(declare-datatypes ((SeekEntryResult!5947 0))(
  ( (MissingZero!5947 (index!26015 (_ BitVec 32))) (Found!5947 (index!26016 (_ BitVec 32))) (Intermediate!5947 (undefined!6759 Bool) (index!26017 (_ BitVec 32)) (x!54856 (_ BitVec 32))) (Undefined!5947) (MissingVacant!5947 (index!26018 (_ BitVec 32))) )
))
(declare-fun lt!265276 () SeekEntryResult!5947)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!583166 (= res!370981 (or (= lt!265276 (MissingZero!5947 i!1108)) (= lt!265276 (MissingVacant!5947 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36465 (_ BitVec 32)) SeekEntryResult!5947)

(assert (=> b!583166 (= lt!265276 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!583167 () Bool)

(declare-fun res!370983 () Bool)

(assert (=> b!583167 (=> (not res!370983) (not e!334229))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!583167 (= res!370983 (and (= (size!17871 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17871 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17871 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583168 () Bool)

(declare-fun res!370988 () Bool)

(assert (=> b!583168 (=> (not res!370988) (not e!334230))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!583168 (= res!370988 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17507 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17507 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583169 () Bool)

(declare-fun res!370980 () Bool)

(assert (=> b!583169 (=> (not res!370980) (not e!334229))))

(assert (=> b!583169 (= res!370980 (validKeyInArray!0 (select (arr!17507 a!2986) j!136)))))

(declare-fun b!583170 () Bool)

(assert (=> b!583170 (= e!334230 false)))

(declare-fun lt!265275 () SeekEntryResult!5947)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36465 (_ BitVec 32)) SeekEntryResult!5947)

(assert (=> b!583170 (= lt!265275 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17507 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583171 () Bool)

(declare-fun res!370982 () Bool)

(assert (=> b!583171 (=> (not res!370982) (not e!334230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36465 (_ BitVec 32)) Bool)

(assert (=> b!583171 (= res!370982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583172 () Bool)

(declare-fun res!370984 () Bool)

(assert (=> b!583172 (=> (not res!370984) (not e!334229))))

(declare-fun arrayContainsKey!0 (array!36465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583172 (= res!370984 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!370986 () Bool)

(assert (=> start!53564 (=> (not res!370986) (not e!334229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53564 (= res!370986 (validMask!0 mask!3053))))

(assert (=> start!53564 e!334229))

(assert (=> start!53564 true))

(declare-fun array_inv!13303 (array!36465) Bool)

(assert (=> start!53564 (array_inv!13303 a!2986)))

(assert (= (and start!53564 res!370986) b!583167))

(assert (= (and b!583167 res!370983) b!583169))

(assert (= (and b!583169 res!370980) b!583165))

(assert (= (and b!583165 res!370987) b!583172))

(assert (= (and b!583172 res!370984) b!583166))

(assert (= (and b!583166 res!370981) b!583171))

(assert (= (and b!583171 res!370982) b!583164))

(assert (= (and b!583164 res!370985) b!583168))

(assert (= (and b!583168 res!370988) b!583170))

(declare-fun m!561641 () Bool)

(assert (=> b!583164 m!561641))

(declare-fun m!561643 () Bool)

(assert (=> b!583166 m!561643))

(declare-fun m!561645 () Bool)

(assert (=> b!583170 m!561645))

(assert (=> b!583170 m!561645))

(declare-fun m!561647 () Bool)

(assert (=> b!583170 m!561647))

(declare-fun m!561649 () Bool)

(assert (=> b!583172 m!561649))

(declare-fun m!561651 () Bool)

(assert (=> b!583165 m!561651))

(declare-fun m!561653 () Bool)

(assert (=> b!583171 m!561653))

(assert (=> b!583169 m!561645))

(assert (=> b!583169 m!561645))

(declare-fun m!561655 () Bool)

(assert (=> b!583169 m!561655))

(declare-fun m!561657 () Bool)

(assert (=> start!53564 m!561657))

(declare-fun m!561659 () Bool)

(assert (=> start!53564 m!561659))

(declare-fun m!561661 () Bool)

(assert (=> b!583168 m!561661))

(declare-fun m!561663 () Bool)

(assert (=> b!583168 m!561663))

(declare-fun m!561665 () Bool)

(assert (=> b!583168 m!561665))

(push 1)

(assert (not b!583171))

(assert (not start!53564))

(assert (not b!583170))

(assert (not b!583172))

(assert (not b!583166))

(assert (not b!583169))

(assert (not b!583164))

(assert (not b!583165))

(check-sat)

