; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56650 () Bool)

(assert start!56650)

(declare-fun b!627877 () Bool)

(declare-fun res!405585 () Bool)

(declare-fun e!359376 () Bool)

(assert (=> b!627877 (=> (not res!405585) (not e!359376))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37942 0))(
  ( (array!37943 (arr!18211 (Array (_ BitVec 32) (_ BitVec 64))) (size!18575 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37942)

(assert (=> b!627877 (= res!405585 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18211 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18211 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627878 () Bool)

(declare-fun res!405584 () Bool)

(declare-fun e!359374 () Bool)

(assert (=> b!627878 (=> (not res!405584) (not e!359374))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!627878 (= res!405584 (and (= (size!18575 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18575 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18575 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627879 () Bool)

(declare-fun res!405579 () Bool)

(assert (=> b!627879 (=> (not res!405579) (not e!359374))))

(declare-fun arrayContainsKey!0 (array!37942 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627879 (= res!405579 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627880 () Bool)

(assert (=> b!627880 (= e!359376 false)))

(declare-fun lt!290358 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627880 (= lt!290358 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627881 () Bool)

(declare-fun res!405583 () Bool)

(assert (=> b!627881 (=> (not res!405583) (not e!359374))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627881 (= res!405583 (validKeyInArray!0 (select (arr!18211 a!2986) j!136)))))

(declare-fun b!627882 () Bool)

(assert (=> b!627882 (= e!359374 e!359376)))

(declare-fun res!405580 () Bool)

(assert (=> b!627882 (=> (not res!405580) (not e!359376))))

(declare-datatypes ((SeekEntryResult!6651 0))(
  ( (MissingZero!6651 (index!28888 (_ BitVec 32))) (Found!6651 (index!28889 (_ BitVec 32))) (Intermediate!6651 (undefined!7463 Bool) (index!28890 (_ BitVec 32)) (x!57623 (_ BitVec 32))) (Undefined!6651) (MissingVacant!6651 (index!28891 (_ BitVec 32))) )
))
(declare-fun lt!290359 () SeekEntryResult!6651)

(assert (=> b!627882 (= res!405580 (or (= lt!290359 (MissingZero!6651 i!1108)) (= lt!290359 (MissingVacant!6651 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37942 (_ BitVec 32)) SeekEntryResult!6651)

(assert (=> b!627882 (= lt!290359 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!627883 () Bool)

(declare-fun res!405587 () Bool)

(assert (=> b!627883 (=> (not res!405587) (not e!359376))))

(declare-datatypes ((List!12252 0))(
  ( (Nil!12249) (Cons!12248 (h!13293 (_ BitVec 64)) (t!18480 List!12252)) )
))
(declare-fun arrayNoDuplicates!0 (array!37942 (_ BitVec 32) List!12252) Bool)

(assert (=> b!627883 (= res!405587 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12249))))

(declare-fun res!405586 () Bool)

(assert (=> start!56650 (=> (not res!405586) (not e!359374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56650 (= res!405586 (validMask!0 mask!3053))))

(assert (=> start!56650 e!359374))

(assert (=> start!56650 true))

(declare-fun array_inv!14007 (array!37942) Bool)

(assert (=> start!56650 (array_inv!14007 a!2986)))

(declare-fun b!627884 () Bool)

(declare-fun res!405581 () Bool)

(assert (=> b!627884 (=> (not res!405581) (not e!359376))))

(assert (=> b!627884 (= res!405581 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18211 a!2986) index!984) (select (arr!18211 a!2986) j!136))) (not (= (select (arr!18211 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627885 () Bool)

(declare-fun res!405578 () Bool)

(assert (=> b!627885 (=> (not res!405578) (not e!359374))))

(assert (=> b!627885 (= res!405578 (validKeyInArray!0 k0!1786))))

(declare-fun b!627886 () Bool)

(declare-fun res!405582 () Bool)

(assert (=> b!627886 (=> (not res!405582) (not e!359376))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37942 (_ BitVec 32)) Bool)

(assert (=> b!627886 (= res!405582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627887 () Bool)

(declare-fun res!405577 () Bool)

(assert (=> b!627887 (=> (not res!405577) (not e!359376))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37942 (_ BitVec 32)) SeekEntryResult!6651)

(assert (=> b!627887 (= res!405577 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18211 a!2986) j!136) a!2986 mask!3053) (Found!6651 j!136)))))

(assert (= (and start!56650 res!405586) b!627878))

(assert (= (and b!627878 res!405584) b!627881))

(assert (= (and b!627881 res!405583) b!627885))

(assert (= (and b!627885 res!405578) b!627879))

(assert (= (and b!627879 res!405579) b!627882))

(assert (= (and b!627882 res!405580) b!627886))

(assert (= (and b!627886 res!405582) b!627883))

(assert (= (and b!627883 res!405587) b!627877))

(assert (= (and b!627877 res!405585) b!627887))

(assert (= (and b!627887 res!405577) b!627884))

(assert (= (and b!627884 res!405581) b!627880))

(declare-fun m!603147 () Bool)

(assert (=> start!56650 m!603147))

(declare-fun m!603149 () Bool)

(assert (=> start!56650 m!603149))

(declare-fun m!603151 () Bool)

(assert (=> b!627884 m!603151))

(declare-fun m!603153 () Bool)

(assert (=> b!627884 m!603153))

(assert (=> b!627881 m!603153))

(assert (=> b!627881 m!603153))

(declare-fun m!603155 () Bool)

(assert (=> b!627881 m!603155))

(declare-fun m!603157 () Bool)

(assert (=> b!627882 m!603157))

(declare-fun m!603159 () Bool)

(assert (=> b!627879 m!603159))

(declare-fun m!603161 () Bool)

(assert (=> b!627885 m!603161))

(assert (=> b!627887 m!603153))

(assert (=> b!627887 m!603153))

(declare-fun m!603163 () Bool)

(assert (=> b!627887 m!603163))

(declare-fun m!603165 () Bool)

(assert (=> b!627886 m!603165))

(declare-fun m!603167 () Bool)

(assert (=> b!627883 m!603167))

(declare-fun m!603169 () Bool)

(assert (=> b!627877 m!603169))

(declare-fun m!603171 () Bool)

(assert (=> b!627877 m!603171))

(declare-fun m!603173 () Bool)

(assert (=> b!627877 m!603173))

(declare-fun m!603175 () Bool)

(assert (=> b!627880 m!603175))

(check-sat (not b!627879) (not b!627887) (not b!627882) (not start!56650) (not b!627885) (not b!627883) (not b!627881) (not b!627886) (not b!627880))
(check-sat)
