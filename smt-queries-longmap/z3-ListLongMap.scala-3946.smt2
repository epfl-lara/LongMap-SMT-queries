; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53670 () Bool)

(assert start!53670)

(declare-fun b!584987 () Bool)

(declare-fun res!372952 () Bool)

(declare-fun e!334751 () Bool)

(assert (=> b!584987 (=> (not res!372952) (not e!334751))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36585 0))(
  ( (array!36586 (arr!17567 (Array (_ BitVec 32) (_ BitVec 64))) (size!17932 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36585)

(declare-datatypes ((SeekEntryResult!6004 0))(
  ( (MissingZero!6004 (index!26243 (_ BitVec 32))) (Found!6004 (index!26244 (_ BitVec 32))) (Intermediate!6004 (undefined!6816 Bool) (index!26245 (_ BitVec 32)) (x!55076 (_ BitVec 32))) (Undefined!6004) (MissingVacant!6004 (index!26246 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36585 (_ BitVec 32)) SeekEntryResult!6004)

(assert (=> b!584987 (= res!372952 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17567 a!2986) j!136) a!2986 mask!3053) (Found!6004 j!136)))))

(declare-fun b!584988 () Bool)

(declare-fun res!372956 () Bool)

(assert (=> b!584988 (=> (not res!372956) (not e!334751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36585 (_ BitVec 32)) Bool)

(assert (=> b!584988 (= res!372956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!372948 () Bool)

(declare-fun e!334750 () Bool)

(assert (=> start!53670 (=> (not res!372948) (not e!334750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53670 (= res!372948 (validMask!0 mask!3053))))

(assert (=> start!53670 e!334750))

(assert (=> start!53670 true))

(declare-fun array_inv!13450 (array!36585) Bool)

(assert (=> start!53670 (array_inv!13450 a!2986)))

(declare-fun b!584989 () Bool)

(declare-fun res!372955 () Bool)

(assert (=> b!584989 (=> (not res!372955) (not e!334751))))

(assert (=> b!584989 (= res!372955 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17567 a!2986) index!984) (select (arr!17567 a!2986) j!136))) (not (= (select (arr!17567 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584990 () Bool)

(declare-fun res!372946 () Bool)

(assert (=> b!584990 (=> (not res!372946) (not e!334750))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584990 (= res!372946 (and (= (size!17932 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17932 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17932 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584991 () Bool)

(declare-fun res!372954 () Bool)

(assert (=> b!584991 (=> (not res!372954) (not e!334751))))

(declare-datatypes ((List!11647 0))(
  ( (Nil!11644) (Cons!11643 (h!12688 (_ BitVec 64)) (t!17866 List!11647)) )
))
(declare-fun arrayNoDuplicates!0 (array!36585 (_ BitVec 32) List!11647) Bool)

(assert (=> b!584991 (= res!372954 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11644))))

(declare-fun b!584992 () Bool)

(assert (=> b!584992 (= e!334750 e!334751)))

(declare-fun res!372950 () Bool)

(assert (=> b!584992 (=> (not res!372950) (not e!334751))))

(declare-fun lt!265545 () SeekEntryResult!6004)

(assert (=> b!584992 (= res!372950 (or (= lt!265545 (MissingZero!6004 i!1108)) (= lt!265545 (MissingVacant!6004 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36585 (_ BitVec 32)) SeekEntryResult!6004)

(assert (=> b!584992 (= lt!265545 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!584993 () Bool)

(declare-fun e!334749 () Bool)

(assert (=> b!584993 (= e!334749 false)))

(declare-fun lt!265544 () (_ BitVec 32))

(declare-fun lt!265546 () SeekEntryResult!6004)

(assert (=> b!584993 (= lt!265546 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265544 vacantSpotIndex!68 (select (arr!17567 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584994 () Bool)

(declare-fun res!372945 () Bool)

(assert (=> b!584994 (=> (not res!372945) (not e!334750))))

(declare-fun arrayContainsKey!0 (array!36585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584994 (= res!372945 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584995 () Bool)

(declare-fun res!372949 () Bool)

(assert (=> b!584995 (=> (not res!372949) (not e!334751))))

(assert (=> b!584995 (= res!372949 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17567 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17567 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584996 () Bool)

(declare-fun res!372951 () Bool)

(assert (=> b!584996 (=> (not res!372951) (not e!334750))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584996 (= res!372951 (validKeyInArray!0 (select (arr!17567 a!2986) j!136)))))

(declare-fun b!584997 () Bool)

(declare-fun res!372953 () Bool)

(assert (=> b!584997 (=> (not res!372953) (not e!334750))))

(assert (=> b!584997 (= res!372953 (validKeyInArray!0 k0!1786))))

(declare-fun b!584998 () Bool)

(assert (=> b!584998 (= e!334751 e!334749)))

(declare-fun res!372947 () Bool)

(assert (=> b!584998 (=> (not res!372947) (not e!334749))))

(assert (=> b!584998 (= res!372947 (and (bvsge lt!265544 #b00000000000000000000000000000000) (bvslt lt!265544 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584998 (= lt!265544 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!53670 res!372948) b!584990))

(assert (= (and b!584990 res!372946) b!584996))

(assert (= (and b!584996 res!372951) b!584997))

(assert (= (and b!584997 res!372953) b!584994))

(assert (= (and b!584994 res!372945) b!584992))

(assert (= (and b!584992 res!372950) b!584988))

(assert (= (and b!584988 res!372956) b!584991))

(assert (= (and b!584991 res!372954) b!584995))

(assert (= (and b!584995 res!372949) b!584987))

(assert (= (and b!584987 res!372952) b!584989))

(assert (= (and b!584989 res!372955) b!584998))

(assert (= (and b!584998 res!372947) b!584993))

(declare-fun m!562735 () Bool)

(assert (=> b!584995 m!562735))

(declare-fun m!562737 () Bool)

(assert (=> b!584995 m!562737))

(declare-fun m!562739 () Bool)

(assert (=> b!584995 m!562739))

(declare-fun m!562741 () Bool)

(assert (=> b!584991 m!562741))

(declare-fun m!562743 () Bool)

(assert (=> b!584993 m!562743))

(assert (=> b!584993 m!562743))

(declare-fun m!562745 () Bool)

(assert (=> b!584993 m!562745))

(declare-fun m!562747 () Bool)

(assert (=> b!584994 m!562747))

(declare-fun m!562749 () Bool)

(assert (=> b!584988 m!562749))

(declare-fun m!562751 () Bool)

(assert (=> b!584997 m!562751))

(declare-fun m!562753 () Bool)

(assert (=> b!584989 m!562753))

(assert (=> b!584989 m!562743))

(assert (=> b!584996 m!562743))

(assert (=> b!584996 m!562743))

(declare-fun m!562755 () Bool)

(assert (=> b!584996 m!562755))

(declare-fun m!562757 () Bool)

(assert (=> b!584992 m!562757))

(declare-fun m!562759 () Bool)

(assert (=> b!584998 m!562759))

(declare-fun m!562761 () Bool)

(assert (=> start!53670 m!562761))

(declare-fun m!562763 () Bool)

(assert (=> start!53670 m!562763))

(assert (=> b!584987 m!562743))

(assert (=> b!584987 m!562743))

(declare-fun m!562765 () Bool)

(assert (=> b!584987 m!562765))

(check-sat (not b!584997) (not b!584998) (not b!584994) (not start!53670) (not b!584996) (not b!584992) (not b!584991) (not b!584988) (not b!584993) (not b!584987))
(check-sat)
