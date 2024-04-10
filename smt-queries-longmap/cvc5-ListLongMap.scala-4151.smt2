; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56594 () Bool)

(assert start!56594)

(declare-fun b!626953 () Bool)

(declare-fun e!359122 () Bool)

(assert (=> b!626953 (= e!359122 false)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lt!290190 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!626953 (= lt!290190 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!626954 () Bool)

(declare-fun res!404655 () Bool)

(assert (=> b!626954 (=> (not res!404655) (not e!359122))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37886 0))(
  ( (array!37887 (arr!18183 (Array (_ BitVec 32) (_ BitVec 64))) (size!18547 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37886)

(assert (=> b!626954 (= res!404655 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18183 a!2986) index!984) (select (arr!18183 a!2986) j!136))) (not (= (select (arr!18183 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!626955 () Bool)

(declare-fun res!404659 () Bool)

(declare-fun e!359123 () Bool)

(assert (=> b!626955 (=> (not res!404659) (not e!359123))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626955 (= res!404659 (validKeyInArray!0 k!1786))))

(declare-fun b!626956 () Bool)

(assert (=> b!626956 (= e!359123 e!359122)))

(declare-fun res!404657 () Bool)

(assert (=> b!626956 (=> (not res!404657) (not e!359122))))

(declare-datatypes ((SeekEntryResult!6623 0))(
  ( (MissingZero!6623 (index!28776 (_ BitVec 32))) (Found!6623 (index!28777 (_ BitVec 32))) (Intermediate!6623 (undefined!7435 Bool) (index!28778 (_ BitVec 32)) (x!57523 (_ BitVec 32))) (Undefined!6623) (MissingVacant!6623 (index!28779 (_ BitVec 32))) )
))
(declare-fun lt!290191 () SeekEntryResult!6623)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!626956 (= res!404657 (or (= lt!290191 (MissingZero!6623 i!1108)) (= lt!290191 (MissingVacant!6623 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37886 (_ BitVec 32)) SeekEntryResult!6623)

(assert (=> b!626956 (= lt!290191 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!404662 () Bool)

(assert (=> start!56594 (=> (not res!404662) (not e!359123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56594 (= res!404662 (validMask!0 mask!3053))))

(assert (=> start!56594 e!359123))

(assert (=> start!56594 true))

(declare-fun array_inv!13979 (array!37886) Bool)

(assert (=> start!56594 (array_inv!13979 a!2986)))

(declare-fun b!626957 () Bool)

(declare-fun res!404658 () Bool)

(assert (=> b!626957 (=> (not res!404658) (not e!359123))))

(assert (=> b!626957 (= res!404658 (validKeyInArray!0 (select (arr!18183 a!2986) j!136)))))

(declare-fun b!626958 () Bool)

(declare-fun res!404660 () Bool)

(assert (=> b!626958 (=> (not res!404660) (not e!359122))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37886 (_ BitVec 32)) Bool)

(assert (=> b!626958 (= res!404660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626959 () Bool)

(declare-fun res!404663 () Bool)

(assert (=> b!626959 (=> (not res!404663) (not e!359122))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37886 (_ BitVec 32)) SeekEntryResult!6623)

(assert (=> b!626959 (= res!404663 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18183 a!2986) j!136) a!2986 mask!3053) (Found!6623 j!136)))))

(declare-fun b!626960 () Bool)

(declare-fun res!404656 () Bool)

(assert (=> b!626960 (=> (not res!404656) (not e!359122))))

(declare-datatypes ((List!12224 0))(
  ( (Nil!12221) (Cons!12220 (h!13265 (_ BitVec 64)) (t!18452 List!12224)) )
))
(declare-fun arrayNoDuplicates!0 (array!37886 (_ BitVec 32) List!12224) Bool)

(assert (=> b!626960 (= res!404656 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12221))))

(declare-fun b!626961 () Bool)

(declare-fun res!404654 () Bool)

(assert (=> b!626961 (=> (not res!404654) (not e!359123))))

(assert (=> b!626961 (= res!404654 (and (= (size!18547 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18547 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18547 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626962 () Bool)

(declare-fun res!404661 () Bool)

(assert (=> b!626962 (=> (not res!404661) (not e!359122))))

(assert (=> b!626962 (= res!404661 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18183 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18183 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626963 () Bool)

(declare-fun res!404653 () Bool)

(assert (=> b!626963 (=> (not res!404653) (not e!359123))))

(declare-fun arrayContainsKey!0 (array!37886 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626963 (= res!404653 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56594 res!404662) b!626961))

(assert (= (and b!626961 res!404654) b!626957))

(assert (= (and b!626957 res!404658) b!626955))

(assert (= (and b!626955 res!404659) b!626963))

(assert (= (and b!626963 res!404653) b!626956))

(assert (= (and b!626956 res!404657) b!626958))

(assert (= (and b!626958 res!404660) b!626960))

(assert (= (and b!626960 res!404656) b!626962))

(assert (= (and b!626962 res!404661) b!626959))

(assert (= (and b!626959 res!404663) b!626954))

(assert (= (and b!626954 res!404655) b!626953))

(declare-fun m!602307 () Bool)

(assert (=> b!626957 m!602307))

(assert (=> b!626957 m!602307))

(declare-fun m!602309 () Bool)

(assert (=> b!626957 m!602309))

(declare-fun m!602311 () Bool)

(assert (=> start!56594 m!602311))

(declare-fun m!602313 () Bool)

(assert (=> start!56594 m!602313))

(declare-fun m!602315 () Bool)

(assert (=> b!626953 m!602315))

(assert (=> b!626959 m!602307))

(assert (=> b!626959 m!602307))

(declare-fun m!602317 () Bool)

(assert (=> b!626959 m!602317))

(declare-fun m!602319 () Bool)

(assert (=> b!626963 m!602319))

(declare-fun m!602321 () Bool)

(assert (=> b!626960 m!602321))

(declare-fun m!602323 () Bool)

(assert (=> b!626956 m!602323))

(declare-fun m!602325 () Bool)

(assert (=> b!626954 m!602325))

(assert (=> b!626954 m!602307))

(declare-fun m!602327 () Bool)

(assert (=> b!626955 m!602327))

(declare-fun m!602329 () Bool)

(assert (=> b!626958 m!602329))

(declare-fun m!602331 () Bool)

(assert (=> b!626962 m!602331))

(declare-fun m!602333 () Bool)

(assert (=> b!626962 m!602333))

(declare-fun m!602335 () Bool)

(assert (=> b!626962 m!602335))

(push 1)

