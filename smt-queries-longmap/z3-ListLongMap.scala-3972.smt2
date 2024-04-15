; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53886 () Bool)

(assert start!53886)

(declare-fun b!587838 () Bool)

(declare-fun res!375617 () Bool)

(declare-fun e!335699 () Bool)

(assert (=> b!587838 (=> (not res!375617) (not e!335699))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36744 0))(
  ( (array!36745 (arr!17645 (Array (_ BitVec 32) (_ BitVec 64))) (size!18010 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36744)

(assert (=> b!587838 (= res!375617 (and (= (size!18010 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18010 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18010 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587839 () Bool)

(declare-fun res!375621 () Bool)

(assert (=> b!587839 (=> (not res!375621) (not e!335699))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36744 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587839 (= res!375621 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587840 () Bool)

(declare-fun e!335700 () Bool)

(assert (=> b!587840 (= e!335700 (not true))))

(declare-fun e!335698 () Bool)

(assert (=> b!587840 e!335698))

(declare-fun res!375626 () Bool)

(assert (=> b!587840 (=> (not res!375626) (not e!335698))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!266406 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6082 0))(
  ( (MissingZero!6082 (index!26558 (_ BitVec 32))) (Found!6082 (index!26559 (_ BitVec 32))) (Intermediate!6082 (undefined!6894 Bool) (index!26560 (_ BitVec 32)) (x!55371 (_ BitVec 32))) (Undefined!6082) (MissingVacant!6082 (index!26561 (_ BitVec 32))) )
))
(declare-fun lt!266408 () SeekEntryResult!6082)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36744 (_ BitVec 32)) SeekEntryResult!6082)

(assert (=> b!587840 (= res!375626 (= lt!266408 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266406 vacantSpotIndex!68 (select (store (arr!17645 a!2986) i!1108 k0!1786) j!136) (array!36745 (store (arr!17645 a!2986) i!1108 k0!1786) (size!18010 a!2986)) mask!3053)))))

(assert (=> b!587840 (= lt!266408 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266406 vacantSpotIndex!68 (select (arr!17645 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18270 0))(
  ( (Unit!18271) )
))
(declare-fun lt!266409 () Unit!18270)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36744 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18270)

(assert (=> b!587840 (= lt!266409 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266406 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587840 (= lt!266406 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!375616 () Bool)

(assert (=> start!53886 (=> (not res!375616) (not e!335699))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53886 (= res!375616 (validMask!0 mask!3053))))

(assert (=> start!53886 e!335699))

(assert (=> start!53886 true))

(declare-fun array_inv!13528 (array!36744) Bool)

(assert (=> start!53886 (array_inv!13528 a!2986)))

(declare-fun b!587841 () Bool)

(declare-fun res!375623 () Bool)

(declare-fun e!335696 () Bool)

(assert (=> b!587841 (=> (not res!375623) (not e!335696))))

(assert (=> b!587841 (= res!375623 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17645 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17645 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587842 () Bool)

(declare-fun res!375620 () Bool)

(assert (=> b!587842 (=> (not res!375620) (not e!335696))))

(declare-datatypes ((List!11725 0))(
  ( (Nil!11722) (Cons!11721 (h!12766 (_ BitVec 64)) (t!17944 List!11725)) )
))
(declare-fun arrayNoDuplicates!0 (array!36744 (_ BitVec 32) List!11725) Bool)

(assert (=> b!587842 (= res!375620 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11722))))

(declare-fun b!587843 () Bool)

(declare-fun lt!266407 () SeekEntryResult!6082)

(assert (=> b!587843 (= e!335698 (= lt!266407 lt!266408))))

(declare-fun b!587844 () Bool)

(declare-fun res!375618 () Bool)

(assert (=> b!587844 (=> (not res!375618) (not e!335699))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587844 (= res!375618 (validKeyInArray!0 k0!1786))))

(declare-fun b!587845 () Bool)

(declare-fun res!375619 () Bool)

(assert (=> b!587845 (=> (not res!375619) (not e!335699))))

(assert (=> b!587845 (= res!375619 (validKeyInArray!0 (select (arr!17645 a!2986) j!136)))))

(declare-fun b!587846 () Bool)

(assert (=> b!587846 (= e!335699 e!335696)))

(declare-fun res!375622 () Bool)

(assert (=> b!587846 (=> (not res!375622) (not e!335696))))

(declare-fun lt!266410 () SeekEntryResult!6082)

(assert (=> b!587846 (= res!375622 (or (= lt!266410 (MissingZero!6082 i!1108)) (= lt!266410 (MissingVacant!6082 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36744 (_ BitVec 32)) SeekEntryResult!6082)

(assert (=> b!587846 (= lt!266410 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!587847 () Bool)

(assert (=> b!587847 (= e!335696 e!335700)))

(declare-fun res!375624 () Bool)

(assert (=> b!587847 (=> (not res!375624) (not e!335700))))

(assert (=> b!587847 (= res!375624 (and (= lt!266407 (Found!6082 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17645 a!2986) index!984) (select (arr!17645 a!2986) j!136))) (not (= (select (arr!17645 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!587847 (= lt!266407 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17645 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!587848 () Bool)

(declare-fun res!375625 () Bool)

(assert (=> b!587848 (=> (not res!375625) (not e!335696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36744 (_ BitVec 32)) Bool)

(assert (=> b!587848 (= res!375625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53886 res!375616) b!587838))

(assert (= (and b!587838 res!375617) b!587845))

(assert (= (and b!587845 res!375619) b!587844))

(assert (= (and b!587844 res!375618) b!587839))

(assert (= (and b!587839 res!375621) b!587846))

(assert (= (and b!587846 res!375622) b!587848))

(assert (= (and b!587848 res!375625) b!587842))

(assert (= (and b!587842 res!375620) b!587841))

(assert (= (and b!587841 res!375623) b!587847))

(assert (= (and b!587847 res!375624) b!587840))

(assert (= (and b!587840 res!375626) b!587843))

(declare-fun m!565825 () Bool)

(assert (=> b!587844 m!565825))

(declare-fun m!565827 () Bool)

(assert (=> b!587840 m!565827))

(declare-fun m!565829 () Bool)

(assert (=> b!587840 m!565829))

(declare-fun m!565831 () Bool)

(assert (=> b!587840 m!565831))

(declare-fun m!565833 () Bool)

(assert (=> b!587840 m!565833))

(assert (=> b!587840 m!565827))

(declare-fun m!565835 () Bool)

(assert (=> b!587840 m!565835))

(assert (=> b!587840 m!565833))

(declare-fun m!565837 () Bool)

(assert (=> b!587840 m!565837))

(declare-fun m!565839 () Bool)

(assert (=> b!587840 m!565839))

(declare-fun m!565841 () Bool)

(assert (=> b!587848 m!565841))

(declare-fun m!565843 () Bool)

(assert (=> b!587841 m!565843))

(assert (=> b!587841 m!565835))

(declare-fun m!565845 () Bool)

(assert (=> b!587841 m!565845))

(declare-fun m!565847 () Bool)

(assert (=> b!587847 m!565847))

(assert (=> b!587847 m!565827))

(assert (=> b!587847 m!565827))

(declare-fun m!565849 () Bool)

(assert (=> b!587847 m!565849))

(declare-fun m!565851 () Bool)

(assert (=> b!587842 m!565851))

(declare-fun m!565853 () Bool)

(assert (=> b!587846 m!565853))

(assert (=> b!587845 m!565827))

(assert (=> b!587845 m!565827))

(declare-fun m!565855 () Bool)

(assert (=> b!587845 m!565855))

(declare-fun m!565857 () Bool)

(assert (=> b!587839 m!565857))

(declare-fun m!565859 () Bool)

(assert (=> start!53886 m!565859))

(declare-fun m!565861 () Bool)

(assert (=> start!53886 m!565861))

(check-sat (not b!587847) (not b!587839) (not b!587848) (not b!587845) (not b!587840) (not b!587842) (not b!587844) (not b!587846) (not start!53886))
(check-sat)
