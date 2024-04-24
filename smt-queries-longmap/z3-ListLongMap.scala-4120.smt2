; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56268 () Bool)

(assert start!56268)

(declare-fun e!357691 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!623572 () Bool)

(declare-datatypes ((array!37683 0))(
  ( (array!37684 (arr!18085 (Array (_ BitVec 32) (_ BitVec 64))) (size!18449 (_ BitVec 32))) )
))
(declare-fun lt!289263 () array!37683)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37683)

(declare-fun arrayContainsKey!0 (array!37683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!623572 (= e!357691 (arrayContainsKey!0 lt!289263 (select (arr!18085 a!2986) j!136) index!984))))

(declare-fun b!623573 () Bool)

(declare-datatypes ((Unit!21007 0))(
  ( (Unit!21008) )
))
(declare-fun e!357686 () Unit!21007)

(declare-fun Unit!21009 () Unit!21007)

(assert (=> b!623573 (= e!357686 Unit!21009)))

(declare-fun b!623574 () Bool)

(declare-fun e!357687 () Bool)

(declare-fun e!357692 () Bool)

(assert (=> b!623574 (= e!357687 e!357692)))

(declare-fun res!401861 () Bool)

(assert (=> b!623574 (=> (not res!401861) (not e!357692))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!623574 (= res!401861 (= (select (store (arr!18085 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!623574 (= lt!289263 (array!37684 (store (arr!18085 a!2986) i!1108 k0!1786) (size!18449 a!2986)))))

(declare-fun e!357685 () Bool)

(declare-fun b!623575 () Bool)

(assert (=> b!623575 (= e!357685 (arrayContainsKey!0 lt!289263 (select (arr!18085 a!2986) j!136) index!984))))

(declare-fun res!401859 () Bool)

(declare-fun e!357695 () Bool)

(assert (=> start!56268 (=> (not res!401859) (not e!357695))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56268 (= res!401859 (validMask!0 mask!3053))))

(assert (=> start!56268 e!357695))

(assert (=> start!56268 true))

(declare-fun array_inv!13944 (array!37683) Bool)

(assert (=> start!56268 (array_inv!13944 a!2986)))

(declare-fun b!623576 () Bool)

(declare-fun e!357682 () Unit!21007)

(declare-fun Unit!21010 () Unit!21007)

(assert (=> b!623576 (= e!357682 Unit!21010)))

(declare-fun b!623577 () Bool)

(declare-fun res!401857 () Bool)

(assert (=> b!623577 (=> (not res!401857) (not e!357695))))

(assert (=> b!623577 (= res!401857 (and (= (size!18449 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18449 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18449 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!623578 () Bool)

(declare-fun e!357684 () Unit!21007)

(declare-fun Unit!21011 () Unit!21007)

(assert (=> b!623578 (= e!357684 Unit!21011)))

(declare-fun b!623579 () Bool)

(declare-fun e!357683 () Bool)

(assert (=> b!623579 (= e!357692 e!357683)))

(declare-fun res!401864 () Bool)

(assert (=> b!623579 (=> (not res!401864) (not e!357683))))

(declare-datatypes ((SeekEntryResult!6481 0))(
  ( (MissingZero!6481 (index!28208 (_ BitVec 32))) (Found!6481 (index!28209 (_ BitVec 32))) (Intermediate!6481 (undefined!7293 Bool) (index!28210 (_ BitVec 32)) (x!57124 (_ BitVec 32))) (Undefined!6481) (MissingVacant!6481 (index!28211 (_ BitVec 32))) )
))
(declare-fun lt!289270 () SeekEntryResult!6481)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!623579 (= res!401864 (and (= lt!289270 (Found!6481 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18085 a!2986) index!984) (select (arr!18085 a!2986) j!136))) (not (= (select (arr!18085 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37683 (_ BitVec 32)) SeekEntryResult!6481)

(assert (=> b!623579 (= lt!289270 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18085 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!623580 () Bool)

(declare-fun res!401855 () Bool)

(assert (=> b!623580 (=> (not res!401855) (not e!357687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37683 (_ BitVec 32)) Bool)

(assert (=> b!623580 (= res!401855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!623581 () Bool)

(declare-fun res!401854 () Bool)

(assert (=> b!623581 (= res!401854 (bvsge j!136 index!984))))

(declare-fun e!357689 () Bool)

(assert (=> b!623581 (=> res!401854 e!357689)))

(declare-fun e!357690 () Bool)

(assert (=> b!623581 (= e!357690 e!357689)))

(declare-fun b!623582 () Bool)

(declare-fun res!401865 () Bool)

(assert (=> b!623582 (=> (not res!401865) (not e!357687))))

(declare-datatypes ((List!12033 0))(
  ( (Nil!12030) (Cons!12029 (h!13077 (_ BitVec 64)) (t!18253 List!12033)) )
))
(declare-fun arrayNoDuplicates!0 (array!37683 (_ BitVec 32) List!12033) Bool)

(assert (=> b!623582 (= res!401865 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12030))))

(declare-fun b!623583 () Bool)

(declare-fun res!401856 () Bool)

(assert (=> b!623583 (=> (not res!401856) (not e!357687))))

(assert (=> b!623583 (= res!401856 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18085 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!623584 () Bool)

(assert (=> b!623584 false))

(declare-fun lt!289279 () Unit!21007)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37683 (_ BitVec 64) (_ BitVec 32) List!12033) Unit!21007)

(assert (=> b!623584 (= lt!289279 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!289263 (select (arr!18085 a!2986) j!136) j!136 Nil!12030))))

(assert (=> b!623584 (arrayNoDuplicates!0 lt!289263 j!136 Nil!12030)))

(declare-fun lt!289273 () Unit!21007)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37683 (_ BitVec 32) (_ BitVec 32)) Unit!21007)

(assert (=> b!623584 (= lt!289273 (lemmaNoDuplicateFromThenFromBigger!0 lt!289263 #b00000000000000000000000000000000 j!136))))

(assert (=> b!623584 (arrayNoDuplicates!0 lt!289263 #b00000000000000000000000000000000 Nil!12030)))

(declare-fun lt!289262 () Unit!21007)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37683 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12033) Unit!21007)

(assert (=> b!623584 (= lt!289262 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12030))))

(assert (=> b!623584 (arrayContainsKey!0 lt!289263 (select (arr!18085 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!289278 () Unit!21007)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37683 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21007)

(assert (=> b!623584 (= lt!289278 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!289263 (select (arr!18085 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!21012 () Unit!21007)

(assert (=> b!623584 (= e!357686 Unit!21012)))

(declare-fun b!623585 () Bool)

(declare-fun res!401869 () Bool)

(assert (=> b!623585 (=> (not res!401869) (not e!357695))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!623585 (= res!401869 (validKeyInArray!0 k0!1786))))

(declare-fun b!623586 () Bool)

(assert (=> b!623586 (= e!357695 e!357687)))

(declare-fun res!401853 () Bool)

(assert (=> b!623586 (=> (not res!401853) (not e!357687))))

(declare-fun lt!289272 () SeekEntryResult!6481)

(assert (=> b!623586 (= res!401853 (or (= lt!289272 (MissingZero!6481 i!1108)) (= lt!289272 (MissingVacant!6481 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37683 (_ BitVec 32)) SeekEntryResult!6481)

(assert (=> b!623586 (= lt!289272 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!623587 () Bool)

(declare-fun e!357688 () Unit!21007)

(declare-fun Unit!21013 () Unit!21007)

(assert (=> b!623587 (= e!357688 Unit!21013)))

(declare-fun res!401863 () Bool)

(assert (=> b!623587 (= res!401863 (= (select (store (arr!18085 a!2986) i!1108 k0!1786) index!984) (select (arr!18085 a!2986) j!136)))))

(assert (=> b!623587 (=> (not res!401863) (not e!357690))))

(assert (=> b!623587 e!357690))

(declare-fun c!71231 () Bool)

(assert (=> b!623587 (= c!71231 (bvslt j!136 index!984))))

(declare-fun lt!289267 () Unit!21007)

(assert (=> b!623587 (= lt!289267 e!357686)))

(declare-fun c!71229 () Bool)

(assert (=> b!623587 (= c!71229 (bvslt index!984 j!136))))

(declare-fun lt!289264 () Unit!21007)

(assert (=> b!623587 (= lt!289264 e!357684)))

(assert (=> b!623587 false))

(declare-fun b!623588 () Bool)

(declare-fun res!401868 () Bool)

(assert (=> b!623588 (=> (not res!401868) (not e!357695))))

(assert (=> b!623588 (= res!401868 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!623589 () Bool)

(declare-fun Unit!21014 () Unit!21007)

(assert (=> b!623589 (= e!357688 Unit!21014)))

(declare-fun b!623590 () Bool)

(declare-fun res!401866 () Bool)

(assert (=> b!623590 (=> (not res!401866) (not e!357695))))

(assert (=> b!623590 (= res!401866 (validKeyInArray!0 (select (arr!18085 a!2986) j!136)))))

(declare-fun b!623591 () Bool)

(assert (=> b!623591 false))

(declare-fun lt!289276 () Unit!21007)

(assert (=> b!623591 (= lt!289276 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!289263 (select (arr!18085 a!2986) j!136) index!984 Nil!12030))))

(assert (=> b!623591 (arrayNoDuplicates!0 lt!289263 index!984 Nil!12030)))

(declare-fun lt!289271 () Unit!21007)

(assert (=> b!623591 (= lt!289271 (lemmaNoDuplicateFromThenFromBigger!0 lt!289263 #b00000000000000000000000000000000 index!984))))

(assert (=> b!623591 (arrayNoDuplicates!0 lt!289263 #b00000000000000000000000000000000 Nil!12030)))

(declare-fun lt!289274 () Unit!21007)

(assert (=> b!623591 (= lt!289274 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12030))))

(assert (=> b!623591 (arrayContainsKey!0 lt!289263 (select (arr!18085 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!289275 () Unit!21007)

(assert (=> b!623591 (= lt!289275 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!289263 (select (arr!18085 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!623591 e!357691))

(declare-fun res!401858 () Bool)

(assert (=> b!623591 (=> (not res!401858) (not e!357691))))

(assert (=> b!623591 (= res!401858 (arrayContainsKey!0 lt!289263 (select (arr!18085 a!2986) j!136) j!136))))

(declare-fun Unit!21015 () Unit!21007)

(assert (=> b!623591 (= e!357684 Unit!21015)))

(declare-fun b!623592 () Bool)

(declare-fun Unit!21016 () Unit!21007)

(assert (=> b!623592 (= e!357682 Unit!21016)))

(assert (=> b!623592 false))

(declare-fun b!623593 () Bool)

(declare-fun e!357696 () Bool)

(declare-fun lt!289268 () (_ BitVec 64))

(assert (=> b!623593 (= e!357696 (validKeyInArray!0 lt!289268))))

(declare-fun res!401860 () Bool)

(declare-fun b!623594 () Bool)

(assert (=> b!623594 (= res!401860 (arrayContainsKey!0 lt!289263 (select (arr!18085 a!2986) j!136) j!136))))

(assert (=> b!623594 (=> (not res!401860) (not e!357685))))

(assert (=> b!623594 (= e!357689 e!357685)))

(declare-fun b!623595 () Bool)

(assert (=> b!623595 (= e!357683 (not e!357696))))

(declare-fun res!401867 () Bool)

(assert (=> b!623595 (=> res!401867 e!357696)))

(declare-fun lt!289265 () SeekEntryResult!6481)

(assert (=> b!623595 (= res!401867 (or (= lt!289265 (MissingVacant!6481 vacantSpotIndex!68)) (bvslt mask!3053 #b00000000000000000000000000000000)))))

(declare-fun lt!289266 () Unit!21007)

(assert (=> b!623595 (= lt!289266 e!357688)))

(declare-fun c!71228 () Bool)

(assert (=> b!623595 (= c!71228 (= lt!289265 (Found!6481 index!984)))))

(declare-fun lt!289269 () Unit!21007)

(assert (=> b!623595 (= lt!289269 e!357682)))

(declare-fun c!71230 () Bool)

(assert (=> b!623595 (= c!71230 (= lt!289265 Undefined!6481))))

(assert (=> b!623595 (= lt!289265 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!289268 lt!289263 mask!3053))))

(declare-fun e!357693 () Bool)

(assert (=> b!623595 e!357693))

(declare-fun res!401862 () Bool)

(assert (=> b!623595 (=> (not res!401862) (not e!357693))))

(declare-fun lt!289260 () (_ BitVec 32))

(declare-fun lt!289277 () SeekEntryResult!6481)

(assert (=> b!623595 (= res!401862 (= lt!289277 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289260 vacantSpotIndex!68 lt!289268 lt!289263 mask!3053)))))

(assert (=> b!623595 (= lt!289277 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289260 vacantSpotIndex!68 (select (arr!18085 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!623595 (= lt!289268 (select (store (arr!18085 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!289261 () Unit!21007)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37683 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21007)

(assert (=> b!623595 (= lt!289261 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!289260 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!623595 (= lt!289260 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!623596 () Bool)

(assert (=> b!623596 (= e!357693 (= lt!289270 lt!289277))))

(assert (= (and start!56268 res!401859) b!623577))

(assert (= (and b!623577 res!401857) b!623590))

(assert (= (and b!623590 res!401866) b!623585))

(assert (= (and b!623585 res!401869) b!623588))

(assert (= (and b!623588 res!401868) b!623586))

(assert (= (and b!623586 res!401853) b!623580))

(assert (= (and b!623580 res!401855) b!623582))

(assert (= (and b!623582 res!401865) b!623583))

(assert (= (and b!623583 res!401856) b!623574))

(assert (= (and b!623574 res!401861) b!623579))

(assert (= (and b!623579 res!401864) b!623595))

(assert (= (and b!623595 res!401862) b!623596))

(assert (= (and b!623595 c!71230) b!623592))

(assert (= (and b!623595 (not c!71230)) b!623576))

(assert (= (and b!623595 c!71228) b!623587))

(assert (= (and b!623595 (not c!71228)) b!623589))

(assert (= (and b!623587 res!401863) b!623581))

(assert (= (and b!623581 (not res!401854)) b!623594))

(assert (= (and b!623594 res!401860) b!623575))

(assert (= (and b!623587 c!71231) b!623584))

(assert (= (and b!623587 (not c!71231)) b!623573))

(assert (= (and b!623587 c!71229) b!623591))

(assert (= (and b!623587 (not c!71229)) b!623578))

(assert (= (and b!623591 res!401858) b!623572))

(assert (= (and b!623595 (not res!401867)) b!623593))

(declare-fun m!599687 () Bool)

(assert (=> b!623595 m!599687))

(declare-fun m!599689 () Bool)

(assert (=> b!623595 m!599689))

(declare-fun m!599691 () Bool)

(assert (=> b!623595 m!599691))

(declare-fun m!599693 () Bool)

(assert (=> b!623595 m!599693))

(declare-fun m!599695 () Bool)

(assert (=> b!623595 m!599695))

(assert (=> b!623595 m!599691))

(declare-fun m!599697 () Bool)

(assert (=> b!623595 m!599697))

(declare-fun m!599699 () Bool)

(assert (=> b!623595 m!599699))

(declare-fun m!599701 () Bool)

(assert (=> b!623595 m!599701))

(declare-fun m!599703 () Bool)

(assert (=> b!623593 m!599703))

(declare-fun m!599705 () Bool)

(assert (=> b!623585 m!599705))

(assert (=> b!623591 m!599691))

(assert (=> b!623591 m!599691))

(declare-fun m!599707 () Bool)

(assert (=> b!623591 m!599707))

(declare-fun m!599709 () Bool)

(assert (=> b!623591 m!599709))

(assert (=> b!623591 m!599691))

(declare-fun m!599711 () Bool)

(assert (=> b!623591 m!599711))

(declare-fun m!599713 () Bool)

(assert (=> b!623591 m!599713))

(assert (=> b!623591 m!599691))

(declare-fun m!599715 () Bool)

(assert (=> b!623591 m!599715))

(assert (=> b!623591 m!599691))

(declare-fun m!599717 () Bool)

(assert (=> b!623591 m!599717))

(declare-fun m!599719 () Bool)

(assert (=> b!623591 m!599719))

(declare-fun m!599721 () Bool)

(assert (=> b!623591 m!599721))

(assert (=> b!623587 m!599701))

(declare-fun m!599723 () Bool)

(assert (=> b!623587 m!599723))

(assert (=> b!623587 m!599691))

(declare-fun m!599725 () Bool)

(assert (=> b!623582 m!599725))

(assert (=> b!623575 m!599691))

(assert (=> b!623575 m!599691))

(declare-fun m!599727 () Bool)

(assert (=> b!623575 m!599727))

(assert (=> b!623574 m!599701))

(declare-fun m!599729 () Bool)

(assert (=> b!623574 m!599729))

(declare-fun m!599731 () Bool)

(assert (=> b!623588 m!599731))

(assert (=> b!623594 m!599691))

(assert (=> b!623594 m!599691))

(assert (=> b!623594 m!599711))

(assert (=> b!623572 m!599691))

(assert (=> b!623572 m!599691))

(assert (=> b!623572 m!599727))

(assert (=> b!623584 m!599691))

(assert (=> b!623584 m!599691))

(declare-fun m!599733 () Bool)

(assert (=> b!623584 m!599733))

(assert (=> b!623584 m!599691))

(declare-fun m!599735 () Bool)

(assert (=> b!623584 m!599735))

(assert (=> b!623584 m!599691))

(declare-fun m!599737 () Bool)

(assert (=> b!623584 m!599737))

(assert (=> b!623584 m!599719))

(assert (=> b!623584 m!599713))

(declare-fun m!599739 () Bool)

(assert (=> b!623584 m!599739))

(declare-fun m!599741 () Bool)

(assert (=> b!623584 m!599741))

(declare-fun m!599743 () Bool)

(assert (=> b!623586 m!599743))

(declare-fun m!599745 () Bool)

(assert (=> b!623580 m!599745))

(declare-fun m!599747 () Bool)

(assert (=> b!623579 m!599747))

(assert (=> b!623579 m!599691))

(assert (=> b!623579 m!599691))

(declare-fun m!599749 () Bool)

(assert (=> b!623579 m!599749))

(declare-fun m!599751 () Bool)

(assert (=> start!56268 m!599751))

(declare-fun m!599753 () Bool)

(assert (=> start!56268 m!599753))

(declare-fun m!599755 () Bool)

(assert (=> b!623583 m!599755))

(assert (=> b!623590 m!599691))

(assert (=> b!623590 m!599691))

(declare-fun m!599757 () Bool)

(assert (=> b!623590 m!599757))

(check-sat (not b!623579) (not b!623588) (not b!623591) (not b!623594) (not start!56268) (not b!623572) (not b!623590) (not b!623586) (not b!623584) (not b!623593) (not b!623595) (not b!623585) (not b!623575) (not b!623582) (not b!623580))
(check-sat)
