; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54504 () Bool)

(assert start!54504)

(declare-fun b!594757 () Bool)

(declare-fun e!339825 () Bool)

(declare-fun e!339823 () Bool)

(assert (=> b!594757 (= e!339825 e!339823)))

(declare-fun res!380708 () Bool)

(assert (=> b!594757 (=> (not res!380708) (not e!339823))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6186 0))(
  ( (MissingZero!6186 (index!26992 (_ BitVec 32))) (Found!6186 (index!26993 (_ BitVec 32))) (Intermediate!6186 (undefined!6998 Bool) (index!26994 (_ BitVec 32)) (x!55798 (_ BitVec 32))) (Undefined!6186) (MissingVacant!6186 (index!26995 (_ BitVec 32))) )
))
(declare-fun lt!270017 () SeekEntryResult!6186)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36964 0))(
  ( (array!36965 (arr!17746 (Array (_ BitVec 32) (_ BitVec 64))) (size!18110 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36964)

(assert (=> b!594757 (= res!380708 (and (= lt!270017 (Found!6186 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17746 a!2986) index!984) (select (arr!17746 a!2986) j!136))) (not (= (select (arr!17746 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36964 (_ BitVec 32)) SeekEntryResult!6186)

(assert (=> b!594757 (= lt!270017 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17746 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!594758 () Bool)

(declare-fun res!380711 () Bool)

(declare-fun e!339824 () Bool)

(assert (=> b!594758 (=> res!380711 e!339824)))

(declare-datatypes ((List!11787 0))(
  ( (Nil!11784) (Cons!11783 (h!12828 (_ BitVec 64)) (t!18015 List!11787)) )
))
(declare-fun contains!2922 (List!11787 (_ BitVec 64)) Bool)

(assert (=> b!594758 (= res!380711 (contains!2922 Nil!11784 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594759 () Bool)

(declare-fun e!339817 () Bool)

(declare-fun e!339818 () Bool)

(assert (=> b!594759 (= e!339817 e!339818)))

(declare-fun res!380698 () Bool)

(assert (=> b!594759 (=> (not res!380698) (not e!339818))))

(declare-fun lt!270014 () SeekEntryResult!6186)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!594759 (= res!380698 (or (= lt!270014 (MissingZero!6186 i!1108)) (= lt!270014 (MissingVacant!6186 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36964 (_ BitVec 32)) SeekEntryResult!6186)

(assert (=> b!594759 (= lt!270014 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!594760 () Bool)

(declare-fun e!339828 () Bool)

(assert (=> b!594760 (= e!339828 e!339824)))

(declare-fun res!380696 () Bool)

(assert (=> b!594760 (=> res!380696 e!339824)))

(assert (=> b!594760 (= res!380696 (or (bvsge (size!18110 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18110 a!2986))))))

(declare-fun lt!270018 () array!36964)

(declare-fun arrayContainsKey!0 (array!36964 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!594760 (arrayContainsKey!0 lt!270018 (select (arr!17746 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-datatypes ((Unit!18662 0))(
  ( (Unit!18663) )
))
(declare-fun lt!270019 () Unit!18662)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36964 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18662)

(assert (=> b!594760 (= lt!270019 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270018 (select (arr!17746 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!594761 () Bool)

(assert (=> b!594761 (= e!339818 e!339825)))

(declare-fun res!380703 () Bool)

(assert (=> b!594761 (=> (not res!380703) (not e!339825))))

(assert (=> b!594761 (= res!380703 (= (select (store (arr!17746 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!594761 (= lt!270018 (array!36965 (store (arr!17746 a!2986) i!1108 k0!1786) (size!18110 a!2986)))))

(declare-fun b!594762 () Bool)

(declare-fun res!380693 () Bool)

(assert (=> b!594762 (=> (not res!380693) (not e!339817))))

(assert (=> b!594762 (= res!380693 (and (= (size!18110 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18110 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18110 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!594764 () Bool)

(assert (=> b!594764 (= e!339824 true)))

(declare-fun lt!270022 () Bool)

(assert (=> b!594764 (= lt!270022 (contains!2922 Nil!11784 k0!1786))))

(declare-fun b!594765 () Bool)

(declare-fun res!380692 () Bool)

(assert (=> b!594765 (=> res!380692 e!339824)))

(assert (=> b!594765 (= res!380692 (contains!2922 Nil!11784 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594766 () Bool)

(declare-fun res!380710 () Bool)

(assert (=> b!594766 (=> (not res!380710) (not e!339818))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36964 (_ BitVec 32)) Bool)

(assert (=> b!594766 (= res!380710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!594767 () Bool)

(declare-fun res!380704 () Bool)

(assert (=> b!594767 (=> (not res!380704) (not e!339817))))

(assert (=> b!594767 (= res!380704 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!594768 () Bool)

(declare-fun e!339826 () Bool)

(declare-fun e!339816 () Bool)

(assert (=> b!594768 (= e!339826 e!339816)))

(declare-fun res!380699 () Bool)

(assert (=> b!594768 (=> res!380699 e!339816)))

(declare-fun lt!270015 () (_ BitVec 64))

(declare-fun lt!270024 () (_ BitVec 64))

(assert (=> b!594768 (= res!380699 (or (not (= (select (arr!17746 a!2986) j!136) lt!270024)) (not (= (select (arr!17746 a!2986) j!136) lt!270015)) (bvsge j!136 index!984)))))

(declare-fun b!594769 () Bool)

(declare-fun res!380700 () Bool)

(assert (=> b!594769 (=> (not res!380700) (not e!339817))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!594769 (= res!380700 (validKeyInArray!0 (select (arr!17746 a!2986) j!136)))))

(declare-fun b!594770 () Bool)

(declare-fun e!339827 () Unit!18662)

(declare-fun Unit!18664 () Unit!18662)

(assert (=> b!594770 (= e!339827 Unit!18664)))

(assert (=> b!594770 false))

(declare-fun b!594771 () Bool)

(declare-fun res!380701 () Bool)

(assert (=> b!594771 (=> (not res!380701) (not e!339817))))

(assert (=> b!594771 (= res!380701 (validKeyInArray!0 k0!1786))))

(declare-fun b!594772 () Bool)

(declare-fun e!339822 () Bool)

(assert (=> b!594772 (= e!339822 (arrayContainsKey!0 lt!270018 (select (arr!17746 a!2986) j!136) index!984))))

(declare-fun res!380707 () Bool)

(assert (=> start!54504 (=> (not res!380707) (not e!339817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54504 (= res!380707 (validMask!0 mask!3053))))

(assert (=> start!54504 e!339817))

(assert (=> start!54504 true))

(declare-fun array_inv!13542 (array!36964) Bool)

(assert (=> start!54504 (array_inv!13542 a!2986)))

(declare-fun b!594763 () Bool)

(declare-fun res!380706 () Bool)

(assert (=> b!594763 (=> res!380706 e!339824)))

(declare-fun noDuplicate!241 (List!11787) Bool)

(assert (=> b!594763 (= res!380706 (not (noDuplicate!241 Nil!11784)))))

(declare-fun b!594773 () Bool)

(assert (=> b!594773 (= e!339816 e!339822)))

(declare-fun res!380697 () Bool)

(assert (=> b!594773 (=> (not res!380697) (not e!339822))))

(assert (=> b!594773 (= res!380697 (arrayContainsKey!0 lt!270018 (select (arr!17746 a!2986) j!136) j!136))))

(declare-fun b!594774 () Bool)

(declare-fun Unit!18665 () Unit!18662)

(assert (=> b!594774 (= e!339827 Unit!18665)))

(declare-fun b!594775 () Bool)

(declare-fun res!380694 () Bool)

(assert (=> b!594775 (=> (not res!380694) (not e!339818))))

(assert (=> b!594775 (= res!380694 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17746 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!594776 () Bool)

(declare-fun e!339819 () Bool)

(declare-fun lt!270020 () SeekEntryResult!6186)

(assert (=> b!594776 (= e!339819 (= lt!270017 lt!270020))))

(declare-fun b!594777 () Bool)

(declare-fun res!380709 () Bool)

(assert (=> b!594777 (=> (not res!380709) (not e!339818))))

(declare-fun arrayNoDuplicates!0 (array!36964 (_ BitVec 32) List!11787) Bool)

(assert (=> b!594777 (= res!380709 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11784))))

(declare-fun b!594778 () Bool)

(declare-fun e!339821 () Bool)

(assert (=> b!594778 (= e!339821 e!339828)))

(declare-fun res!380702 () Bool)

(assert (=> b!594778 (=> res!380702 e!339828)))

(assert (=> b!594778 (= res!380702 (or (not (= (select (arr!17746 a!2986) j!136) lt!270024)) (not (= (select (arr!17746 a!2986) j!136) lt!270015)) (bvsge j!136 index!984)))))

(assert (=> b!594778 e!339826))

(declare-fun res!380691 () Bool)

(assert (=> b!594778 (=> (not res!380691) (not e!339826))))

(assert (=> b!594778 (= res!380691 (= lt!270015 (select (arr!17746 a!2986) j!136)))))

(assert (=> b!594778 (= lt!270015 (select (store (arr!17746 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!594779 () Bool)

(assert (=> b!594779 (= e!339823 (not e!339821))))

(declare-fun res!380695 () Bool)

(assert (=> b!594779 (=> res!380695 e!339821)))

(declare-fun lt!270016 () SeekEntryResult!6186)

(assert (=> b!594779 (= res!380695 (not (= lt!270016 (Found!6186 index!984))))))

(declare-fun lt!270023 () Unit!18662)

(assert (=> b!594779 (= lt!270023 e!339827)))

(declare-fun c!67400 () Bool)

(assert (=> b!594779 (= c!67400 (= lt!270016 Undefined!6186))))

(assert (=> b!594779 (= lt!270016 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270024 lt!270018 mask!3053))))

(assert (=> b!594779 e!339819))

(declare-fun res!380705 () Bool)

(assert (=> b!594779 (=> (not res!380705) (not e!339819))))

(declare-fun lt!270025 () (_ BitVec 32))

(assert (=> b!594779 (= res!380705 (= lt!270020 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270025 vacantSpotIndex!68 lt!270024 lt!270018 mask!3053)))))

(assert (=> b!594779 (= lt!270020 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270025 vacantSpotIndex!68 (select (arr!17746 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!594779 (= lt!270024 (select (store (arr!17746 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!270021 () Unit!18662)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36964 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18662)

(assert (=> b!594779 (= lt!270021 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270025 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!594779 (= lt!270025 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!54504 res!380707) b!594762))

(assert (= (and b!594762 res!380693) b!594769))

(assert (= (and b!594769 res!380700) b!594771))

(assert (= (and b!594771 res!380701) b!594767))

(assert (= (and b!594767 res!380704) b!594759))

(assert (= (and b!594759 res!380698) b!594766))

(assert (= (and b!594766 res!380710) b!594777))

(assert (= (and b!594777 res!380709) b!594775))

(assert (= (and b!594775 res!380694) b!594761))

(assert (= (and b!594761 res!380703) b!594757))

(assert (= (and b!594757 res!380708) b!594779))

(assert (= (and b!594779 res!380705) b!594776))

(assert (= (and b!594779 c!67400) b!594770))

(assert (= (and b!594779 (not c!67400)) b!594774))

(assert (= (and b!594779 (not res!380695)) b!594778))

(assert (= (and b!594778 res!380691) b!594768))

(assert (= (and b!594768 (not res!380699)) b!594773))

(assert (= (and b!594773 res!380697) b!594772))

(assert (= (and b!594778 (not res!380702)) b!594760))

(assert (= (and b!594760 (not res!380696)) b!594763))

(assert (= (and b!594763 (not res!380706)) b!594758))

(assert (= (and b!594758 (not res!380711)) b!594765))

(assert (= (and b!594765 (not res!380692)) b!594764))

(declare-fun m!572517 () Bool)

(assert (=> b!594766 m!572517))

(declare-fun m!572519 () Bool)

(assert (=> start!54504 m!572519))

(declare-fun m!572521 () Bool)

(assert (=> start!54504 m!572521))

(declare-fun m!572523 () Bool)

(assert (=> b!594763 m!572523))

(declare-fun m!572525 () Bool)

(assert (=> b!594768 m!572525))

(declare-fun m!572527 () Bool)

(assert (=> b!594775 m!572527))

(declare-fun m!572529 () Bool)

(assert (=> b!594777 m!572529))

(declare-fun m!572531 () Bool)

(assert (=> b!594767 m!572531))

(declare-fun m!572533 () Bool)

(assert (=> b!594759 m!572533))

(declare-fun m!572535 () Bool)

(assert (=> b!594761 m!572535))

(declare-fun m!572537 () Bool)

(assert (=> b!594761 m!572537))

(declare-fun m!572539 () Bool)

(assert (=> b!594765 m!572539))

(assert (=> b!594773 m!572525))

(assert (=> b!594773 m!572525))

(declare-fun m!572541 () Bool)

(assert (=> b!594773 m!572541))

(assert (=> b!594760 m!572525))

(assert (=> b!594760 m!572525))

(declare-fun m!572543 () Bool)

(assert (=> b!594760 m!572543))

(assert (=> b!594760 m!572525))

(declare-fun m!572545 () Bool)

(assert (=> b!594760 m!572545))

(declare-fun m!572547 () Bool)

(assert (=> b!594771 m!572547))

(declare-fun m!572549 () Bool)

(assert (=> b!594758 m!572549))

(assert (=> b!594772 m!572525))

(assert (=> b!594772 m!572525))

(declare-fun m!572551 () Bool)

(assert (=> b!594772 m!572551))

(declare-fun m!572553 () Bool)

(assert (=> b!594764 m!572553))

(assert (=> b!594778 m!572525))

(assert (=> b!594778 m!572535))

(declare-fun m!572555 () Bool)

(assert (=> b!594778 m!572555))

(declare-fun m!572557 () Bool)

(assert (=> b!594757 m!572557))

(assert (=> b!594757 m!572525))

(assert (=> b!594757 m!572525))

(declare-fun m!572559 () Bool)

(assert (=> b!594757 m!572559))

(declare-fun m!572561 () Bool)

(assert (=> b!594779 m!572561))

(declare-fun m!572563 () Bool)

(assert (=> b!594779 m!572563))

(assert (=> b!594779 m!572525))

(assert (=> b!594779 m!572535))

(declare-fun m!572565 () Bool)

(assert (=> b!594779 m!572565))

(declare-fun m!572567 () Bool)

(assert (=> b!594779 m!572567))

(declare-fun m!572569 () Bool)

(assert (=> b!594779 m!572569))

(assert (=> b!594779 m!572525))

(declare-fun m!572571 () Bool)

(assert (=> b!594779 m!572571))

(assert (=> b!594769 m!572525))

(assert (=> b!594769 m!572525))

(declare-fun m!572573 () Bool)

(assert (=> b!594769 m!572573))

(check-sat (not b!594773) (not b!594757) (not b!594771) (not b!594763) (not b!594759) (not start!54504) (not b!594764) (not b!594760) (not b!594779) (not b!594765) (not b!594772) (not b!594769) (not b!594766) (not b!594767) (not b!594777) (not b!594758))
(check-sat)
