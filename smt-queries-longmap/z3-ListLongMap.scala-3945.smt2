; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53664 () Bool)

(assert start!53664)

(declare-fun b!584879 () Bool)

(declare-fun res!372846 () Bool)

(declare-fun e!334714 () Bool)

(assert (=> b!584879 (=> (not res!372846) (not e!334714))))

(declare-datatypes ((array!36579 0))(
  ( (array!36580 (arr!17564 (Array (_ BitVec 32) (_ BitVec 64))) (size!17929 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36579)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36579 (_ BitVec 32)) Bool)

(assert (=> b!584879 (= res!372846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584880 () Bool)

(declare-fun e!334716 () Bool)

(assert (=> b!584880 (= e!334716 e!334714)))

(declare-fun res!372847 () Bool)

(assert (=> b!584880 (=> (not res!372847) (not e!334714))))

(declare-datatypes ((SeekEntryResult!6001 0))(
  ( (MissingZero!6001 (index!26231 (_ BitVec 32))) (Found!6001 (index!26232 (_ BitVec 32))) (Intermediate!6001 (undefined!6813 Bool) (index!26233 (_ BitVec 32)) (x!55065 (_ BitVec 32))) (Undefined!6001) (MissingVacant!6001 (index!26234 (_ BitVec 32))) )
))
(declare-fun lt!265519 () SeekEntryResult!6001)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584880 (= res!372847 (or (= lt!265519 (MissingZero!6001 i!1108)) (= lt!265519 (MissingVacant!6001 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36579 (_ BitVec 32)) SeekEntryResult!6001)

(assert (=> b!584880 (= lt!265519 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!584881 () Bool)

(declare-fun e!334713 () Bool)

(assert (=> b!584881 (= e!334714 e!334713)))

(declare-fun res!372840 () Bool)

(assert (=> b!584881 (=> (not res!372840) (not e!334713))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!265518 () (_ BitVec 32))

(assert (=> b!584881 (= res!372840 (and (bvsge lt!265518 #b00000000000000000000000000000000) (bvslt lt!265518 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584881 (= lt!265518 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584882 () Bool)

(declare-fun res!372837 () Bool)

(assert (=> b!584882 (=> (not res!372837) (not e!334716))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584882 (= res!372837 (validKeyInArray!0 k0!1786))))

(declare-fun res!372845 () Bool)

(assert (=> start!53664 (=> (not res!372845) (not e!334716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53664 (= res!372845 (validMask!0 mask!3053))))

(assert (=> start!53664 e!334716))

(assert (=> start!53664 true))

(declare-fun array_inv!13447 (array!36579) Bool)

(assert (=> start!53664 (array_inv!13447 a!2986)))

(declare-fun b!584883 () Bool)

(declare-fun res!372848 () Bool)

(assert (=> b!584883 (=> (not res!372848) (not e!334714))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36579 (_ BitVec 32)) SeekEntryResult!6001)

(assert (=> b!584883 (= res!372848 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17564 a!2986) j!136) a!2986 mask!3053) (Found!6001 j!136)))))

(declare-fun b!584884 () Bool)

(declare-fun res!372842 () Bool)

(assert (=> b!584884 (=> (not res!372842) (not e!334716))))

(assert (=> b!584884 (= res!372842 (validKeyInArray!0 (select (arr!17564 a!2986) j!136)))))

(declare-fun b!584885 () Bool)

(declare-fun res!372839 () Bool)

(assert (=> b!584885 (=> (not res!372839) (not e!334716))))

(assert (=> b!584885 (= res!372839 (and (= (size!17929 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17929 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17929 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584886 () Bool)

(declare-fun res!372838 () Bool)

(assert (=> b!584886 (=> (not res!372838) (not e!334716))))

(declare-fun arrayContainsKey!0 (array!36579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584886 (= res!372838 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584887 () Bool)

(declare-fun res!372841 () Bool)

(assert (=> b!584887 (=> (not res!372841) (not e!334714))))

(assert (=> b!584887 (= res!372841 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17564 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17564 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584888 () Bool)

(declare-fun res!372843 () Bool)

(assert (=> b!584888 (=> (not res!372843) (not e!334714))))

(declare-datatypes ((List!11644 0))(
  ( (Nil!11641) (Cons!11640 (h!12685 (_ BitVec 64)) (t!17863 List!11644)) )
))
(declare-fun arrayNoDuplicates!0 (array!36579 (_ BitVec 32) List!11644) Bool)

(assert (=> b!584888 (= res!372843 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11641))))

(declare-fun b!584889 () Bool)

(assert (=> b!584889 (= e!334713 false)))

(declare-fun lt!265517 () SeekEntryResult!6001)

(assert (=> b!584889 (= lt!265517 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265518 vacantSpotIndex!68 (select (arr!17564 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584890 () Bool)

(declare-fun res!372844 () Bool)

(assert (=> b!584890 (=> (not res!372844) (not e!334714))))

(assert (=> b!584890 (= res!372844 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17564 a!2986) index!984) (select (arr!17564 a!2986) j!136))) (not (= (select (arr!17564 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!53664 res!372845) b!584885))

(assert (= (and b!584885 res!372839) b!584884))

(assert (= (and b!584884 res!372842) b!584882))

(assert (= (and b!584882 res!372837) b!584886))

(assert (= (and b!584886 res!372838) b!584880))

(assert (= (and b!584880 res!372847) b!584879))

(assert (= (and b!584879 res!372846) b!584888))

(assert (= (and b!584888 res!372843) b!584887))

(assert (= (and b!584887 res!372841) b!584883))

(assert (= (and b!584883 res!372848) b!584890))

(assert (= (and b!584890 res!372844) b!584881))

(assert (= (and b!584881 res!372840) b!584889))

(declare-fun m!562639 () Bool)

(assert (=> b!584890 m!562639))

(declare-fun m!562641 () Bool)

(assert (=> b!584890 m!562641))

(declare-fun m!562643 () Bool)

(assert (=> b!584879 m!562643))

(assert (=> b!584883 m!562641))

(assert (=> b!584883 m!562641))

(declare-fun m!562645 () Bool)

(assert (=> b!584883 m!562645))

(declare-fun m!562647 () Bool)

(assert (=> b!584882 m!562647))

(declare-fun m!562649 () Bool)

(assert (=> b!584880 m!562649))

(assert (=> b!584889 m!562641))

(assert (=> b!584889 m!562641))

(declare-fun m!562651 () Bool)

(assert (=> b!584889 m!562651))

(declare-fun m!562653 () Bool)

(assert (=> start!53664 m!562653))

(declare-fun m!562655 () Bool)

(assert (=> start!53664 m!562655))

(declare-fun m!562657 () Bool)

(assert (=> b!584888 m!562657))

(declare-fun m!562659 () Bool)

(assert (=> b!584881 m!562659))

(declare-fun m!562661 () Bool)

(assert (=> b!584887 m!562661))

(declare-fun m!562663 () Bool)

(assert (=> b!584887 m!562663))

(declare-fun m!562665 () Bool)

(assert (=> b!584887 m!562665))

(assert (=> b!584884 m!562641))

(assert (=> b!584884 m!562641))

(declare-fun m!562667 () Bool)

(assert (=> b!584884 m!562667))

(declare-fun m!562669 () Bool)

(assert (=> b!584886 m!562669))

(check-sat (not b!584879) (not b!584882) (not b!584886) (not start!53664) (not b!584889) (not b!584881) (not b!584884) (not b!584888) (not b!584883) (not b!584880))
(check-sat)
