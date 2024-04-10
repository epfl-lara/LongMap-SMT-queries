; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53398 () Bool)

(assert start!53398)

(declare-fun b!580896 () Bool)

(declare-fun res!368713 () Bool)

(declare-fun e!333482 () Bool)

(assert (=> b!580896 (=> (not res!368713) (not e!333482))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36299 0))(
  ( (array!36300 (arr!17424 (Array (_ BitVec 32) (_ BitVec 64))) (size!17788 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36299)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!580896 (= res!368713 (and (= (size!17788 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17788 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17788 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580897 () Bool)

(declare-fun res!368719 () Bool)

(assert (=> b!580897 (=> (not res!368719) (not e!333482))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580897 (= res!368719 (validKeyInArray!0 (select (arr!17424 a!2986) j!136)))))

(declare-fun b!580898 () Bool)

(declare-fun res!368712 () Bool)

(assert (=> b!580898 (=> (not res!368712) (not e!333482))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!580898 (= res!368712 (validKeyInArray!0 k!1786))))

(declare-fun res!368718 () Bool)

(assert (=> start!53398 (=> (not res!368718) (not e!333482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53398 (= res!368718 (validMask!0 mask!3053))))

(assert (=> start!53398 e!333482))

(assert (=> start!53398 true))

(declare-fun array_inv!13220 (array!36299) Bool)

(assert (=> start!53398 (array_inv!13220 a!2986)))

(declare-fun b!580899 () Bool)

(declare-fun res!368714 () Bool)

(declare-fun e!333483 () Bool)

(assert (=> b!580899 (=> (not res!368714) (not e!333483))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!580899 (= res!368714 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17424 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17424 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580900 () Bool)

(assert (=> b!580900 (= e!333483 false)))

(declare-datatypes ((SeekEntryResult!5864 0))(
  ( (MissingZero!5864 (index!25683 (_ BitVec 32))) (Found!5864 (index!25684 (_ BitVec 32))) (Intermediate!5864 (undefined!6676 Bool) (index!25685 (_ BitVec 32)) (x!54557 (_ BitVec 32))) (Undefined!5864) (MissingVacant!5864 (index!25686 (_ BitVec 32))) )
))
(declare-fun lt!264796 () SeekEntryResult!5864)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36299 (_ BitVec 32)) SeekEntryResult!5864)

(assert (=> b!580900 (= lt!264796 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17424 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580901 () Bool)

(assert (=> b!580901 (= e!333482 e!333483)))

(declare-fun res!368716 () Bool)

(assert (=> b!580901 (=> (not res!368716) (not e!333483))))

(declare-fun lt!264795 () SeekEntryResult!5864)

(assert (=> b!580901 (= res!368716 (or (= lt!264795 (MissingZero!5864 i!1108)) (= lt!264795 (MissingVacant!5864 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36299 (_ BitVec 32)) SeekEntryResult!5864)

(assert (=> b!580901 (= lt!264795 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!580902 () Bool)

(declare-fun res!368717 () Bool)

(assert (=> b!580902 (=> (not res!368717) (not e!333482))))

(declare-fun arrayContainsKey!0 (array!36299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580902 (= res!368717 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580903 () Bool)

(declare-fun res!368720 () Bool)

(assert (=> b!580903 (=> (not res!368720) (not e!333483))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36299 (_ BitVec 32)) Bool)

(assert (=> b!580903 (= res!368720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580904 () Bool)

(declare-fun res!368715 () Bool)

(assert (=> b!580904 (=> (not res!368715) (not e!333483))))

(declare-datatypes ((List!11465 0))(
  ( (Nil!11462) (Cons!11461 (h!12506 (_ BitVec 64)) (t!17693 List!11465)) )
))
(declare-fun arrayNoDuplicates!0 (array!36299 (_ BitVec 32) List!11465) Bool)

(assert (=> b!580904 (= res!368715 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11462))))

(assert (= (and start!53398 res!368718) b!580896))

(assert (= (and b!580896 res!368713) b!580897))

(assert (= (and b!580897 res!368719) b!580898))

(assert (= (and b!580898 res!368712) b!580902))

(assert (= (and b!580902 res!368717) b!580901))

(assert (= (and b!580901 res!368716) b!580903))

(assert (= (and b!580903 res!368720) b!580904))

(assert (= (and b!580904 res!368715) b!580899))

(assert (= (and b!580899 res!368714) b!580900))

(declare-fun m!559459 () Bool)

(assert (=> start!53398 m!559459))

(declare-fun m!559461 () Bool)

(assert (=> start!53398 m!559461))

(declare-fun m!559463 () Bool)

(assert (=> b!580903 m!559463))

(declare-fun m!559465 () Bool)

(assert (=> b!580897 m!559465))

(assert (=> b!580897 m!559465))

(declare-fun m!559467 () Bool)

(assert (=> b!580897 m!559467))

(declare-fun m!559469 () Bool)

(assert (=> b!580898 m!559469))

(declare-fun m!559471 () Bool)

(assert (=> b!580904 m!559471))

(declare-fun m!559473 () Bool)

(assert (=> b!580899 m!559473))

(declare-fun m!559475 () Bool)

(assert (=> b!580899 m!559475))

(declare-fun m!559477 () Bool)

(assert (=> b!580899 m!559477))

(declare-fun m!559479 () Bool)

(assert (=> b!580901 m!559479))

(declare-fun m!559481 () Bool)

(assert (=> b!580902 m!559481))

(assert (=> b!580900 m!559465))

(assert (=> b!580900 m!559465))

(declare-fun m!559483 () Bool)

(assert (=> b!580900 m!559483))

(push 1)

(assert (not start!53398))

(assert (not b!580898))

(assert (not b!580902))

(assert (not b!580901))

(assert (not b!580904))

(assert (not b!580900))

(assert (not b!580897))

(assert (not b!580903))

(check-sat)

(pop 1)

(push 1)

(check-sat)

