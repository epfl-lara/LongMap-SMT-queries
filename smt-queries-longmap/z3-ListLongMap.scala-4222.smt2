; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57928 () Bool)

(assert start!57928)

(declare-fun b!640829 () Bool)

(declare-datatypes ((Unit!21682 0))(
  ( (Unit!21683) )
))
(declare-fun e!366858 () Unit!21682)

(declare-fun Unit!21684 () Unit!21682)

(assert (=> b!640829 (= e!366858 Unit!21684)))

(declare-fun b!640830 () Bool)

(declare-fun e!366857 () Bool)

(declare-fun e!366862 () Bool)

(assert (=> b!640830 (= e!366857 (not e!366862))))

(declare-fun res!415055 () Bool)

(assert (=> b!640830 (=> res!415055 e!366862)))

(declare-datatypes ((SeekEntryResult!6837 0))(
  ( (MissingZero!6837 (index!29668 (_ BitVec 32))) (Found!6837 (index!29669 (_ BitVec 32))) (Intermediate!6837 (undefined!7649 Bool) (index!29670 (_ BitVec 32)) (x!58425 (_ BitVec 32))) (Undefined!6837) (MissingVacant!6837 (index!29671 (_ BitVec 32))) )
))
(declare-fun lt!296664 () SeekEntryResult!6837)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!640830 (= res!415055 (not (= lt!296664 (Found!6837 index!984))))))

(declare-fun lt!296660 () Unit!21682)

(assert (=> b!640830 (= lt!296660 e!366858)))

(declare-fun c!73256 () Bool)

(assert (=> b!640830 (= c!73256 (= lt!296664 Undefined!6837))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!296668 () (_ BitVec 64))

(declare-datatypes ((array!38355 0))(
  ( (array!38356 (arr!18397 (Array (_ BitVec 32) (_ BitVec 64))) (size!18761 (_ BitVec 32))) )
))
(declare-fun lt!296671 () array!38355)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38355 (_ BitVec 32)) SeekEntryResult!6837)

(assert (=> b!640830 (= lt!296664 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296668 lt!296671 mask!3053))))

(declare-fun e!366864 () Bool)

(assert (=> b!640830 e!366864))

(declare-fun res!415065 () Bool)

(assert (=> b!640830 (=> (not res!415065) (not e!366864))))

(declare-fun lt!296662 () SeekEntryResult!6837)

(declare-fun lt!296665 () (_ BitVec 32))

(assert (=> b!640830 (= res!415065 (= lt!296662 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296665 vacantSpotIndex!68 lt!296668 lt!296671 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38355)

(assert (=> b!640830 (= lt!296662 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296665 vacantSpotIndex!68 (select (arr!18397 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!640830 (= lt!296668 (select (store (arr!18397 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!296663 () Unit!21682)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38355 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21682)

(assert (=> b!640830 (= lt!296663 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296665 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!640830 (= lt!296665 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!640831 () Bool)

(declare-fun e!366855 () Bool)

(declare-fun e!366854 () Bool)

(assert (=> b!640831 (= e!366855 e!366854)))

(declare-fun res!415058 () Bool)

(assert (=> b!640831 (=> res!415058 e!366854)))

(declare-fun lt!296670 () (_ BitVec 64))

(assert (=> b!640831 (= res!415058 (or (not (= (select (arr!18397 a!2986) j!136) lt!296668)) (not (= (select (arr!18397 a!2986) j!136) lt!296670)) (bvsge j!136 index!984)))))

(declare-fun b!640832 () Bool)

(declare-fun res!415052 () Bool)

(declare-fun e!366863 () Bool)

(assert (=> b!640832 (=> (not res!415052) (not e!366863))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!640832 (= res!415052 (validKeyInArray!0 (select (arr!18397 a!2986) j!136)))))

(declare-fun b!640833 () Bool)

(declare-fun res!415063 () Bool)

(assert (=> b!640833 (=> (not res!415063) (not e!366863))))

(assert (=> b!640833 (= res!415063 (validKeyInArray!0 k0!1786))))

(declare-fun res!415057 () Bool)

(assert (=> start!57928 (=> (not res!415057) (not e!366863))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57928 (= res!415057 (validMask!0 mask!3053))))

(assert (=> start!57928 e!366863))

(assert (=> start!57928 true))

(declare-fun array_inv!14193 (array!38355) Bool)

(assert (=> start!57928 (array_inv!14193 a!2986)))

(declare-fun b!640834 () Bool)

(declare-fun e!366856 () Bool)

(assert (=> b!640834 (= e!366862 e!366856)))

(declare-fun res!415060 () Bool)

(assert (=> b!640834 (=> res!415060 e!366856)))

(assert (=> b!640834 (= res!415060 (or (not (= (select (arr!18397 a!2986) j!136) lt!296668)) (not (= (select (arr!18397 a!2986) j!136) lt!296670)) (bvsge j!136 index!984)))))

(assert (=> b!640834 e!366855))

(declare-fun res!415051 () Bool)

(assert (=> b!640834 (=> (not res!415051) (not e!366855))))

(assert (=> b!640834 (= res!415051 (= lt!296670 (select (arr!18397 a!2986) j!136)))))

(assert (=> b!640834 (= lt!296670 (select (store (arr!18397 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!640835 () Bool)

(assert (=> b!640835 (= e!366856 true)))

(declare-datatypes ((List!12438 0))(
  ( (Nil!12435) (Cons!12434 (h!13479 (_ BitVec 64)) (t!18666 List!12438)) )
))
(declare-fun arrayNoDuplicates!0 (array!38355 (_ BitVec 32) List!12438) Bool)

(assert (=> b!640835 (arrayNoDuplicates!0 lt!296671 j!136 Nil!12435)))

(declare-fun lt!296667 () Unit!21682)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38355 (_ BitVec 32) (_ BitVec 32)) Unit!21682)

(assert (=> b!640835 (= lt!296667 (lemmaNoDuplicateFromThenFromBigger!0 lt!296671 #b00000000000000000000000000000000 j!136))))

(assert (=> b!640835 (arrayNoDuplicates!0 lt!296671 #b00000000000000000000000000000000 Nil!12435)))

(declare-fun lt!296666 () Unit!21682)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38355 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12438) Unit!21682)

(assert (=> b!640835 (= lt!296666 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12435))))

(declare-fun arrayContainsKey!0 (array!38355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!640835 (arrayContainsKey!0 lt!296671 (select (arr!18397 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296661 () Unit!21682)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38355 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21682)

(assert (=> b!640835 (= lt!296661 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296671 (select (arr!18397 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!640836 () Bool)

(declare-fun res!415067 () Bool)

(declare-fun e!366860 () Bool)

(assert (=> b!640836 (=> (not res!415067) (not e!366860))))

(assert (=> b!640836 (= res!415067 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12435))))

(declare-fun b!640837 () Bool)

(declare-fun e!366853 () Bool)

(assert (=> b!640837 (= e!366854 e!366853)))

(declare-fun res!415054 () Bool)

(assert (=> b!640837 (=> (not res!415054) (not e!366853))))

(assert (=> b!640837 (= res!415054 (arrayContainsKey!0 lt!296671 (select (arr!18397 a!2986) j!136) j!136))))

(declare-fun b!640838 () Bool)

(declare-fun Unit!21685 () Unit!21682)

(assert (=> b!640838 (= e!366858 Unit!21685)))

(assert (=> b!640838 false))

(declare-fun b!640839 () Bool)

(declare-fun res!415064 () Bool)

(assert (=> b!640839 (=> (not res!415064) (not e!366863))))

(assert (=> b!640839 (= res!415064 (and (= (size!18761 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18761 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18761 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!640840 () Bool)

(declare-fun res!415066 () Bool)

(assert (=> b!640840 (=> (not res!415066) (not e!366860))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38355 (_ BitVec 32)) Bool)

(assert (=> b!640840 (= res!415066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!640841 () Bool)

(declare-fun lt!296659 () SeekEntryResult!6837)

(assert (=> b!640841 (= e!366864 (= lt!296659 lt!296662))))

(declare-fun b!640842 () Bool)

(assert (=> b!640842 (= e!366863 e!366860)))

(declare-fun res!415062 () Bool)

(assert (=> b!640842 (=> (not res!415062) (not e!366860))))

(declare-fun lt!296669 () SeekEntryResult!6837)

(assert (=> b!640842 (= res!415062 (or (= lt!296669 (MissingZero!6837 i!1108)) (= lt!296669 (MissingVacant!6837 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38355 (_ BitVec 32)) SeekEntryResult!6837)

(assert (=> b!640842 (= lt!296669 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!640843 () Bool)

(declare-fun res!415061 () Bool)

(assert (=> b!640843 (=> (not res!415061) (not e!366863))))

(assert (=> b!640843 (= res!415061 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!640844 () Bool)

(declare-fun e!366861 () Bool)

(assert (=> b!640844 (= e!366860 e!366861)))

(declare-fun res!415059 () Bool)

(assert (=> b!640844 (=> (not res!415059) (not e!366861))))

(assert (=> b!640844 (= res!415059 (= (select (store (arr!18397 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!640844 (= lt!296671 (array!38356 (store (arr!18397 a!2986) i!1108 k0!1786) (size!18761 a!2986)))))

(declare-fun b!640845 () Bool)

(assert (=> b!640845 (= e!366853 (arrayContainsKey!0 lt!296671 (select (arr!18397 a!2986) j!136) index!984))))

(declare-fun b!640846 () Bool)

(assert (=> b!640846 (= e!366861 e!366857)))

(declare-fun res!415053 () Bool)

(assert (=> b!640846 (=> (not res!415053) (not e!366857))))

(assert (=> b!640846 (= res!415053 (and (= lt!296659 (Found!6837 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18397 a!2986) index!984) (select (arr!18397 a!2986) j!136))) (not (= (select (arr!18397 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!640846 (= lt!296659 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18397 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!640847 () Bool)

(declare-fun res!415056 () Bool)

(assert (=> b!640847 (=> (not res!415056) (not e!366860))))

(assert (=> b!640847 (= res!415056 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18397 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!57928 res!415057) b!640839))

(assert (= (and b!640839 res!415064) b!640832))

(assert (= (and b!640832 res!415052) b!640833))

(assert (= (and b!640833 res!415063) b!640843))

(assert (= (and b!640843 res!415061) b!640842))

(assert (= (and b!640842 res!415062) b!640840))

(assert (= (and b!640840 res!415066) b!640836))

(assert (= (and b!640836 res!415067) b!640847))

(assert (= (and b!640847 res!415056) b!640844))

(assert (= (and b!640844 res!415059) b!640846))

(assert (= (and b!640846 res!415053) b!640830))

(assert (= (and b!640830 res!415065) b!640841))

(assert (= (and b!640830 c!73256) b!640838))

(assert (= (and b!640830 (not c!73256)) b!640829))

(assert (= (and b!640830 (not res!415055)) b!640834))

(assert (= (and b!640834 res!415051) b!640831))

(assert (= (and b!640831 (not res!415058)) b!640837))

(assert (= (and b!640837 res!415054) b!640845))

(assert (= (and b!640834 (not res!415060)) b!640835))

(declare-fun m!614667 () Bool)

(assert (=> b!640831 m!614667))

(declare-fun m!614669 () Bool)

(assert (=> start!57928 m!614669))

(declare-fun m!614671 () Bool)

(assert (=> start!57928 m!614671))

(assert (=> b!640834 m!614667))

(declare-fun m!614673 () Bool)

(assert (=> b!640834 m!614673))

(declare-fun m!614675 () Bool)

(assert (=> b!640834 m!614675))

(declare-fun m!614677 () Bool)

(assert (=> b!640842 m!614677))

(declare-fun m!614679 () Bool)

(assert (=> b!640833 m!614679))

(declare-fun m!614681 () Bool)

(assert (=> b!640830 m!614681))

(declare-fun m!614683 () Bool)

(assert (=> b!640830 m!614683))

(assert (=> b!640830 m!614667))

(declare-fun m!614685 () Bool)

(assert (=> b!640830 m!614685))

(assert (=> b!640830 m!614673))

(declare-fun m!614687 () Bool)

(assert (=> b!640830 m!614687))

(assert (=> b!640830 m!614667))

(declare-fun m!614689 () Bool)

(assert (=> b!640830 m!614689))

(declare-fun m!614691 () Bool)

(assert (=> b!640830 m!614691))

(assert (=> b!640845 m!614667))

(assert (=> b!640845 m!614667))

(declare-fun m!614693 () Bool)

(assert (=> b!640845 m!614693))

(declare-fun m!614695 () Bool)

(assert (=> b!640836 m!614695))

(assert (=> b!640844 m!614673))

(declare-fun m!614697 () Bool)

(assert (=> b!640844 m!614697))

(declare-fun m!614699 () Bool)

(assert (=> b!640847 m!614699))

(declare-fun m!614701 () Bool)

(assert (=> b!640840 m!614701))

(assert (=> b!640837 m!614667))

(assert (=> b!640837 m!614667))

(declare-fun m!614703 () Bool)

(assert (=> b!640837 m!614703))

(declare-fun m!614705 () Bool)

(assert (=> b!640846 m!614705))

(assert (=> b!640846 m!614667))

(assert (=> b!640846 m!614667))

(declare-fun m!614707 () Bool)

(assert (=> b!640846 m!614707))

(assert (=> b!640832 m!614667))

(assert (=> b!640832 m!614667))

(declare-fun m!614709 () Bool)

(assert (=> b!640832 m!614709))

(declare-fun m!614711 () Bool)

(assert (=> b!640843 m!614711))

(assert (=> b!640835 m!614667))

(declare-fun m!614713 () Bool)

(assert (=> b!640835 m!614713))

(declare-fun m!614715 () Bool)

(assert (=> b!640835 m!614715))

(declare-fun m!614717 () Bool)

(assert (=> b!640835 m!614717))

(assert (=> b!640835 m!614667))

(declare-fun m!614719 () Bool)

(assert (=> b!640835 m!614719))

(assert (=> b!640835 m!614667))

(declare-fun m!614721 () Bool)

(assert (=> b!640835 m!614721))

(declare-fun m!614723 () Bool)

(assert (=> b!640835 m!614723))

(check-sat (not b!640842) (not b!640845) (not b!640830) (not b!640837) (not b!640843) (not b!640833) (not start!57928) (not b!640836) (not b!640846) (not b!640835) (not b!640832) (not b!640840))
(check-sat)
