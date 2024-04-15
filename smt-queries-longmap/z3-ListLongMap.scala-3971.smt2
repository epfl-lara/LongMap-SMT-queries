; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53880 () Bool)

(assert start!53880)

(declare-fun b!587739 () Bool)

(declare-fun e!335655 () Bool)

(declare-datatypes ((SeekEntryResult!6079 0))(
  ( (MissingZero!6079 (index!26546 (_ BitVec 32))) (Found!6079 (index!26547 (_ BitVec 32))) (Intermediate!6079 (undefined!6891 Bool) (index!26548 (_ BitVec 32)) (x!55360 (_ BitVec 32))) (Undefined!6079) (MissingVacant!6079 (index!26549 (_ BitVec 32))) )
))
(declare-fun lt!266361 () SeekEntryResult!6079)

(declare-fun lt!266363 () SeekEntryResult!6079)

(assert (=> b!587739 (= e!335655 (= lt!266361 lt!266363))))

(declare-fun b!587740 () Bool)

(declare-fun res!375527 () Bool)

(declare-fun e!335652 () Bool)

(assert (=> b!587740 (=> (not res!375527) (not e!335652))))

(declare-datatypes ((array!36738 0))(
  ( (array!36739 (arr!17642 (Array (_ BitVec 32) (_ BitVec 64))) (size!18007 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36738)

(declare-datatypes ((List!11722 0))(
  ( (Nil!11719) (Cons!11718 (h!12763 (_ BitVec 64)) (t!17941 List!11722)) )
))
(declare-fun arrayNoDuplicates!0 (array!36738 (_ BitVec 32) List!11722) Bool)

(assert (=> b!587740 (= res!375527 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11719))))

(declare-fun b!587741 () Bool)

(declare-fun res!375523 () Bool)

(declare-fun e!335651 () Bool)

(assert (=> b!587741 (=> (not res!375523) (not e!335651))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!587741 (= res!375523 (and (= (size!18007 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18007 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18007 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587742 () Bool)

(assert (=> b!587742 (= e!335651 e!335652)))

(declare-fun res!375519 () Bool)

(assert (=> b!587742 (=> (not res!375519) (not e!335652))))

(declare-fun lt!266362 () SeekEntryResult!6079)

(assert (=> b!587742 (= res!375519 (or (= lt!266362 (MissingZero!6079 i!1108)) (= lt!266362 (MissingVacant!6079 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36738 (_ BitVec 32)) SeekEntryResult!6079)

(assert (=> b!587742 (= lt!266362 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!375525 () Bool)

(assert (=> start!53880 (=> (not res!375525) (not e!335651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53880 (= res!375525 (validMask!0 mask!3053))))

(assert (=> start!53880 e!335651))

(assert (=> start!53880 true))

(declare-fun array_inv!13525 (array!36738) Bool)

(assert (=> start!53880 (array_inv!13525 a!2986)))

(declare-fun b!587743 () Bool)

(declare-fun res!375526 () Bool)

(assert (=> b!587743 (=> (not res!375526) (not e!335651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587743 (= res!375526 (validKeyInArray!0 k0!1786))))

(declare-fun b!587744 () Bool)

(declare-fun e!335654 () Bool)

(assert (=> b!587744 (= e!335652 e!335654)))

(declare-fun res!375521 () Bool)

(assert (=> b!587744 (=> (not res!375521) (not e!335654))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!587744 (= res!375521 (and (= lt!266361 (Found!6079 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17642 a!2986) index!984) (select (arr!17642 a!2986) j!136))) (not (= (select (arr!17642 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36738 (_ BitVec 32)) SeekEntryResult!6079)

(assert (=> b!587744 (= lt!266361 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17642 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!587745 () Bool)

(declare-fun res!375524 () Bool)

(assert (=> b!587745 (=> (not res!375524) (not e!335651))))

(assert (=> b!587745 (= res!375524 (validKeyInArray!0 (select (arr!17642 a!2986) j!136)))))

(declare-fun b!587746 () Bool)

(declare-fun res!375522 () Bool)

(assert (=> b!587746 (=> (not res!375522) (not e!335652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36738 (_ BitVec 32)) Bool)

(assert (=> b!587746 (= res!375522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587747 () Bool)

(declare-fun res!375520 () Bool)

(assert (=> b!587747 (=> (not res!375520) (not e!335651))))

(declare-fun arrayContainsKey!0 (array!36738 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587747 (= res!375520 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587748 () Bool)

(assert (=> b!587748 (= e!335654 (not true))))

(assert (=> b!587748 e!335655))

(declare-fun res!375517 () Bool)

(assert (=> b!587748 (=> (not res!375517) (not e!335655))))

(declare-fun lt!266365 () (_ BitVec 32))

(assert (=> b!587748 (= res!375517 (= lt!266363 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266365 vacantSpotIndex!68 (select (store (arr!17642 a!2986) i!1108 k0!1786) j!136) (array!36739 (store (arr!17642 a!2986) i!1108 k0!1786) (size!18007 a!2986)) mask!3053)))))

(assert (=> b!587748 (= lt!266363 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266365 vacantSpotIndex!68 (select (arr!17642 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18264 0))(
  ( (Unit!18265) )
))
(declare-fun lt!266364 () Unit!18264)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36738 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18264)

(assert (=> b!587748 (= lt!266364 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266365 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587748 (= lt!266365 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!587749 () Bool)

(declare-fun res!375518 () Bool)

(assert (=> b!587749 (=> (not res!375518) (not e!335652))))

(assert (=> b!587749 (= res!375518 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17642 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17642 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53880 res!375525) b!587741))

(assert (= (and b!587741 res!375523) b!587745))

(assert (= (and b!587745 res!375524) b!587743))

(assert (= (and b!587743 res!375526) b!587747))

(assert (= (and b!587747 res!375520) b!587742))

(assert (= (and b!587742 res!375519) b!587746))

(assert (= (and b!587746 res!375522) b!587740))

(assert (= (and b!587740 res!375527) b!587749))

(assert (= (and b!587749 res!375518) b!587744))

(assert (= (and b!587744 res!375521) b!587748))

(assert (= (and b!587748 res!375517) b!587739))

(declare-fun m!565711 () Bool)

(assert (=> b!587745 m!565711))

(assert (=> b!587745 m!565711))

(declare-fun m!565713 () Bool)

(assert (=> b!587745 m!565713))

(declare-fun m!565715 () Bool)

(assert (=> b!587744 m!565715))

(assert (=> b!587744 m!565711))

(assert (=> b!587744 m!565711))

(declare-fun m!565717 () Bool)

(assert (=> b!587744 m!565717))

(declare-fun m!565719 () Bool)

(assert (=> b!587743 m!565719))

(declare-fun m!565721 () Bool)

(assert (=> b!587740 m!565721))

(declare-fun m!565723 () Bool)

(assert (=> b!587746 m!565723))

(declare-fun m!565725 () Bool)

(assert (=> b!587742 m!565725))

(declare-fun m!565727 () Bool)

(assert (=> b!587749 m!565727))

(declare-fun m!565729 () Bool)

(assert (=> b!587749 m!565729))

(declare-fun m!565731 () Bool)

(assert (=> b!587749 m!565731))

(declare-fun m!565733 () Bool)

(assert (=> b!587747 m!565733))

(declare-fun m!565735 () Bool)

(assert (=> start!53880 m!565735))

(declare-fun m!565737 () Bool)

(assert (=> start!53880 m!565737))

(declare-fun m!565739 () Bool)

(assert (=> b!587748 m!565739))

(assert (=> b!587748 m!565711))

(assert (=> b!587748 m!565711))

(declare-fun m!565741 () Bool)

(assert (=> b!587748 m!565741))

(assert (=> b!587748 m!565729))

(declare-fun m!565743 () Bool)

(assert (=> b!587748 m!565743))

(declare-fun m!565745 () Bool)

(assert (=> b!587748 m!565745))

(declare-fun m!565747 () Bool)

(assert (=> b!587748 m!565747))

(assert (=> b!587748 m!565743))

(check-sat (not b!587747) (not b!587744) (not b!587740) (not start!53880) (not b!587745) (not b!587743) (not b!587748) (not b!587742) (not b!587746))
(check-sat)
