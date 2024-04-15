; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54552 () Bool)

(assert start!54552)

(declare-fun b!596650 () Bool)

(declare-fun e!340879 () Bool)

(declare-datatypes ((SeekEntryResult!6214 0))(
  ( (MissingZero!6214 (index!27104 (_ BitVec 32))) (Found!6214 (index!27105 (_ BitVec 32))) (Intermediate!6214 (undefined!7026 Bool) (index!27106 (_ BitVec 32)) (x!55909 (_ BitVec 32))) (Undefined!6214) (MissingVacant!6214 (index!27107 (_ BitVec 32))) )
))
(declare-fun lt!270934 () SeekEntryResult!6214)

(declare-fun lt!270941 () SeekEntryResult!6214)

(assert (=> b!596650 (= e!340879 (= lt!270934 lt!270941))))

(declare-fun b!596651 () Bool)

(declare-fun e!340883 () Bool)

(declare-fun e!340889 () Bool)

(assert (=> b!596651 (= e!340883 e!340889)))

(declare-fun res!382550 () Bool)

(assert (=> b!596651 (=> (not res!382550) (not e!340889))))

(declare-fun lt!270932 () SeekEntryResult!6214)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!596651 (= res!382550 (or (= lt!270932 (MissingZero!6214 i!1108)) (= lt!270932 (MissingVacant!6214 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37026 0))(
  ( (array!37027 (arr!17777 (Array (_ BitVec 32) (_ BitVec 64))) (size!18142 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37026)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37026 (_ BitVec 32)) SeekEntryResult!6214)

(assert (=> b!596651 (= lt!270932 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!596652 () Bool)

(declare-fun e!340884 () Bool)

(assert (=> b!596652 (= e!340889 e!340884)))

(declare-fun res!382547 () Bool)

(assert (=> b!596652 (=> (not res!382547) (not e!340884))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!596652 (= res!382547 (= (select (store (arr!17777 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!270943 () array!37026)

(assert (=> b!596652 (= lt!270943 (array!37027 (store (arr!17777 a!2986) i!1108 k0!1786) (size!18142 a!2986)))))

(declare-fun b!596653 () Bool)

(declare-fun res!382543 () Bool)

(assert (=> b!596653 (=> (not res!382543) (not e!340889))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37026 (_ BitVec 32)) Bool)

(assert (=> b!596653 (= res!382543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!596654 () Bool)

(declare-fun e!340880 () Bool)

(declare-fun e!340882 () Bool)

(assert (=> b!596654 (= e!340880 e!340882)))

(declare-fun res!382536 () Bool)

(assert (=> b!596654 (=> res!382536 e!340882)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!270939 () (_ BitVec 64))

(declare-fun lt!270938 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!596654 (= res!382536 (or (not (= (select (arr!17777 a!2986) j!136) lt!270938)) (not (= (select (arr!17777 a!2986) j!136) lt!270939)) (bvsge j!136 index!984)))))

(declare-fun e!340885 () Bool)

(assert (=> b!596654 e!340885))

(declare-fun res!382537 () Bool)

(assert (=> b!596654 (=> (not res!382537) (not e!340885))))

(assert (=> b!596654 (= res!382537 (= lt!270939 (select (arr!17777 a!2986) j!136)))))

(assert (=> b!596654 (= lt!270939 (select (store (arr!17777 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!596655 () Bool)

(declare-fun res!382542 () Bool)

(assert (=> b!596655 (=> (not res!382542) (not e!340883))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!596655 (= res!382542 (validKeyInArray!0 k0!1786))))

(declare-fun b!596656 () Bool)

(declare-fun res!382535 () Bool)

(assert (=> b!596656 (=> (not res!382535) (not e!340883))))

(assert (=> b!596656 (= res!382535 (and (= (size!18142 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18142 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18142 a!2986)) (not (= i!1108 j!136))))))

(declare-fun e!340881 () Bool)

(declare-fun b!596657 () Bool)

(declare-fun arrayContainsKey!0 (array!37026 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!596657 (= e!340881 (arrayContainsKey!0 lt!270943 (select (arr!17777 a!2986) j!136) index!984))))

(declare-fun b!596658 () Bool)

(declare-fun e!340888 () Bool)

(assert (=> b!596658 (= e!340885 e!340888)))

(declare-fun res!382534 () Bool)

(assert (=> b!596658 (=> res!382534 e!340888)))

(assert (=> b!596658 (= res!382534 (or (not (= (select (arr!17777 a!2986) j!136) lt!270938)) (not (= (select (arr!17777 a!2986) j!136) lt!270939)) (bvsge j!136 index!984)))))

(declare-fun b!596659 () Bool)

(declare-fun res!382546 () Bool)

(assert (=> b!596659 (=> (not res!382546) (not e!340889))))

(declare-datatypes ((List!11857 0))(
  ( (Nil!11854) (Cons!11853 (h!12898 (_ BitVec 64)) (t!18076 List!11857)) )
))
(declare-fun arrayNoDuplicates!0 (array!37026 (_ BitVec 32) List!11857) Bool)

(assert (=> b!596659 (= res!382546 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11854))))

(declare-fun b!596660 () Bool)

(declare-fun res!382539 () Bool)

(assert (=> b!596660 (=> (not res!382539) (not e!340889))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!596660 (= res!382539 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17777 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!596661 () Bool)

(assert (=> b!596661 (= e!340882 (or (bvsgt #b00000000000000000000000000000000 (size!18142 a!2986)) (bvslt (size!18142 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!596661 (arrayNoDuplicates!0 lt!270943 #b00000000000000000000000000000000 Nil!11854)))

(declare-datatypes ((Unit!18768 0))(
  ( (Unit!18769) )
))
(declare-fun lt!270935 () Unit!18768)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37026 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11857) Unit!18768)

(assert (=> b!596661 (= lt!270935 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11854))))

(assert (=> b!596661 (arrayContainsKey!0 lt!270943 (select (arr!17777 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270940 () Unit!18768)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37026 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18768)

(assert (=> b!596661 (= lt!270940 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270943 (select (arr!17777 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!596662 () Bool)

(declare-fun e!340886 () Bool)

(assert (=> b!596662 (= e!340884 e!340886)))

(declare-fun res!382549 () Bool)

(assert (=> b!596662 (=> (not res!382549) (not e!340886))))

(assert (=> b!596662 (= res!382549 (and (= lt!270934 (Found!6214 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17777 a!2986) index!984) (select (arr!17777 a!2986) j!136))) (not (= (select (arr!17777 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37026 (_ BitVec 32)) SeekEntryResult!6214)

(assert (=> b!596662 (= lt!270934 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17777 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!596663 () Bool)

(assert (=> b!596663 (= e!340886 (not e!340880))))

(declare-fun res!382538 () Bool)

(assert (=> b!596663 (=> res!382538 e!340880)))

(declare-fun lt!270933 () SeekEntryResult!6214)

(assert (=> b!596663 (= res!382538 (not (= lt!270933 (Found!6214 index!984))))))

(declare-fun lt!270942 () Unit!18768)

(declare-fun e!340890 () Unit!18768)

(assert (=> b!596663 (= lt!270942 e!340890)))

(declare-fun c!67425 () Bool)

(assert (=> b!596663 (= c!67425 (= lt!270933 Undefined!6214))))

(assert (=> b!596663 (= lt!270933 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270938 lt!270943 mask!3053))))

(assert (=> b!596663 e!340879))

(declare-fun res!382544 () Bool)

(assert (=> b!596663 (=> (not res!382544) (not e!340879))))

(declare-fun lt!270937 () (_ BitVec 32))

(assert (=> b!596663 (= res!382544 (= lt!270941 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270937 vacantSpotIndex!68 lt!270938 lt!270943 mask!3053)))))

(assert (=> b!596663 (= lt!270941 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270937 vacantSpotIndex!68 (select (arr!17777 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!596663 (= lt!270938 (select (store (arr!17777 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!270936 () Unit!18768)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37026 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18768)

(assert (=> b!596663 (= lt!270936 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270937 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!596663 (= lt!270937 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!596664 () Bool)

(declare-fun res!382548 () Bool)

(assert (=> b!596664 (=> (not res!382548) (not e!340883))))

(assert (=> b!596664 (= res!382548 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!596665 () Bool)

(assert (=> b!596665 (= e!340888 e!340881)))

(declare-fun res!382541 () Bool)

(assert (=> b!596665 (=> (not res!382541) (not e!340881))))

(assert (=> b!596665 (= res!382541 (arrayContainsKey!0 lt!270943 (select (arr!17777 a!2986) j!136) j!136))))

(declare-fun b!596666 () Bool)

(declare-fun Unit!18770 () Unit!18768)

(assert (=> b!596666 (= e!340890 Unit!18770)))

(declare-fun res!382545 () Bool)

(assert (=> start!54552 (=> (not res!382545) (not e!340883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54552 (= res!382545 (validMask!0 mask!3053))))

(assert (=> start!54552 e!340883))

(assert (=> start!54552 true))

(declare-fun array_inv!13660 (array!37026) Bool)

(assert (=> start!54552 (array_inv!13660 a!2986)))

(declare-fun b!596667 () Bool)

(declare-fun Unit!18771 () Unit!18768)

(assert (=> b!596667 (= e!340890 Unit!18771)))

(assert (=> b!596667 false))

(declare-fun b!596668 () Bool)

(declare-fun res!382540 () Bool)

(assert (=> b!596668 (=> (not res!382540) (not e!340883))))

(assert (=> b!596668 (= res!382540 (validKeyInArray!0 (select (arr!17777 a!2986) j!136)))))

(assert (= (and start!54552 res!382545) b!596656))

(assert (= (and b!596656 res!382535) b!596668))

(assert (= (and b!596668 res!382540) b!596655))

(assert (= (and b!596655 res!382542) b!596664))

(assert (= (and b!596664 res!382548) b!596651))

(assert (= (and b!596651 res!382550) b!596653))

(assert (= (and b!596653 res!382543) b!596659))

(assert (= (and b!596659 res!382546) b!596660))

(assert (= (and b!596660 res!382539) b!596652))

(assert (= (and b!596652 res!382547) b!596662))

(assert (= (and b!596662 res!382549) b!596663))

(assert (= (and b!596663 res!382544) b!596650))

(assert (= (and b!596663 c!67425) b!596667))

(assert (= (and b!596663 (not c!67425)) b!596666))

(assert (= (and b!596663 (not res!382538)) b!596654))

(assert (= (and b!596654 res!382537) b!596658))

(assert (= (and b!596658 (not res!382534)) b!596665))

(assert (= (and b!596665 res!382541) b!596657))

(assert (= (and b!596654 (not res!382536)) b!596661))

(declare-fun m!573589 () Bool)

(assert (=> b!596653 m!573589))

(declare-fun m!573591 () Bool)

(assert (=> b!596663 m!573591))

(declare-fun m!573593 () Bool)

(assert (=> b!596663 m!573593))

(declare-fun m!573595 () Bool)

(assert (=> b!596663 m!573595))

(declare-fun m!573597 () Bool)

(assert (=> b!596663 m!573597))

(declare-fun m!573599 () Bool)

(assert (=> b!596663 m!573599))

(declare-fun m!573601 () Bool)

(assert (=> b!596663 m!573601))

(declare-fun m!573603 () Bool)

(assert (=> b!596663 m!573603))

(assert (=> b!596663 m!573597))

(declare-fun m!573605 () Bool)

(assert (=> b!596663 m!573605))

(assert (=> b!596665 m!573597))

(assert (=> b!596665 m!573597))

(declare-fun m!573607 () Bool)

(assert (=> b!596665 m!573607))

(declare-fun m!573609 () Bool)

(assert (=> b!596662 m!573609))

(assert (=> b!596662 m!573597))

(assert (=> b!596662 m!573597))

(declare-fun m!573611 () Bool)

(assert (=> b!596662 m!573611))

(assert (=> b!596658 m!573597))

(declare-fun m!573613 () Bool)

(assert (=> b!596651 m!573613))

(declare-fun m!573615 () Bool)

(assert (=> b!596655 m!573615))

(declare-fun m!573617 () Bool)

(assert (=> b!596664 m!573617))

(declare-fun m!573619 () Bool)

(assert (=> b!596660 m!573619))

(assert (=> b!596652 m!573599))

(declare-fun m!573621 () Bool)

(assert (=> b!596652 m!573621))

(declare-fun m!573623 () Bool)

(assert (=> b!596661 m!573623))

(assert (=> b!596661 m!573597))

(assert (=> b!596661 m!573597))

(declare-fun m!573625 () Bool)

(assert (=> b!596661 m!573625))

(assert (=> b!596661 m!573597))

(declare-fun m!573627 () Bool)

(assert (=> b!596661 m!573627))

(declare-fun m!573629 () Bool)

(assert (=> b!596661 m!573629))

(assert (=> b!596657 m!573597))

(assert (=> b!596657 m!573597))

(declare-fun m!573631 () Bool)

(assert (=> b!596657 m!573631))

(assert (=> b!596668 m!573597))

(assert (=> b!596668 m!573597))

(declare-fun m!573633 () Bool)

(assert (=> b!596668 m!573633))

(assert (=> b!596654 m!573597))

(assert (=> b!596654 m!573599))

(declare-fun m!573635 () Bool)

(assert (=> b!596654 m!573635))

(declare-fun m!573637 () Bool)

(assert (=> start!54552 m!573637))

(declare-fun m!573639 () Bool)

(assert (=> start!54552 m!573639))

(declare-fun m!573641 () Bool)

(assert (=> b!596659 m!573641))

(check-sat (not b!596659) (not start!54552) (not b!596655) (not b!596663) (not b!596661) (not b!596651) (not b!596662) (not b!596657) (not b!596665) (not b!596653) (not b!596664) (not b!596668))
(check-sat)
(get-model)

(declare-fun d!86501 () Bool)

(assert (=> d!86501 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54552 d!86501))

(declare-fun d!86503 () Bool)

(assert (=> d!86503 (= (array_inv!13660 a!2986) (bvsge (size!18142 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54552 d!86503))

(declare-fun d!86505 () Bool)

(declare-fun res!382657 () Bool)

(declare-fun e!340967 () Bool)

(assert (=> d!86505 (=> res!382657 e!340967)))

(assert (=> d!86505 (= res!382657 (= (select (arr!17777 lt!270943) index!984) (select (arr!17777 a!2986) j!136)))))

(assert (=> d!86505 (= (arrayContainsKey!0 lt!270943 (select (arr!17777 a!2986) j!136) index!984) e!340967)))

(declare-fun b!596787 () Bool)

(declare-fun e!340968 () Bool)

(assert (=> b!596787 (= e!340967 e!340968)))

(declare-fun res!382658 () Bool)

(assert (=> b!596787 (=> (not res!382658) (not e!340968))))

(assert (=> b!596787 (= res!382658 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18142 lt!270943)))))

(declare-fun b!596788 () Bool)

(assert (=> b!596788 (= e!340968 (arrayContainsKey!0 lt!270943 (select (arr!17777 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!86505 (not res!382657)) b!596787))

(assert (= (and b!596787 res!382658) b!596788))

(declare-fun m!573751 () Bool)

(assert (=> d!86505 m!573751))

(assert (=> b!596788 m!573597))

(declare-fun m!573753 () Bool)

(assert (=> b!596788 m!573753))

(assert (=> b!596657 d!86505))

(declare-fun d!86507 () Bool)

(assert (=> d!86507 (= (validKeyInArray!0 (select (arr!17777 a!2986) j!136)) (and (not (= (select (arr!17777 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17777 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!596668 d!86507))

(declare-fun b!596799 () Bool)

(declare-fun e!340979 () Bool)

(declare-fun contains!2938 (List!11857 (_ BitVec 64)) Bool)

(assert (=> b!596799 (= e!340979 (contains!2938 Nil!11854 (select (arr!17777 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!86509 () Bool)

(declare-fun res!382667 () Bool)

(declare-fun e!340977 () Bool)

(assert (=> d!86509 (=> res!382667 e!340977)))

(assert (=> d!86509 (= res!382667 (bvsge #b00000000000000000000000000000000 (size!18142 a!2986)))))

(assert (=> d!86509 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11854) e!340977)))

(declare-fun bm!32878 () Bool)

(declare-fun call!32881 () Bool)

(declare-fun c!67434 () Bool)

(assert (=> bm!32878 (= call!32881 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67434 (Cons!11853 (select (arr!17777 a!2986) #b00000000000000000000000000000000) Nil!11854) Nil!11854)))))

(declare-fun b!596800 () Bool)

(declare-fun e!340980 () Bool)

(declare-fun e!340978 () Bool)

(assert (=> b!596800 (= e!340980 e!340978)))

(assert (=> b!596800 (= c!67434 (validKeyInArray!0 (select (arr!17777 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!596801 () Bool)

(assert (=> b!596801 (= e!340978 call!32881)))

(declare-fun b!596802 () Bool)

(assert (=> b!596802 (= e!340977 e!340980)))

(declare-fun res!382665 () Bool)

(assert (=> b!596802 (=> (not res!382665) (not e!340980))))

(assert (=> b!596802 (= res!382665 (not e!340979))))

(declare-fun res!382666 () Bool)

(assert (=> b!596802 (=> (not res!382666) (not e!340979))))

(assert (=> b!596802 (= res!382666 (validKeyInArray!0 (select (arr!17777 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!596803 () Bool)

(assert (=> b!596803 (= e!340978 call!32881)))

(assert (= (and d!86509 (not res!382667)) b!596802))

(assert (= (and b!596802 res!382666) b!596799))

(assert (= (and b!596802 res!382665) b!596800))

(assert (= (and b!596800 c!67434) b!596801))

(assert (= (and b!596800 (not c!67434)) b!596803))

(assert (= (or b!596801 b!596803) bm!32878))

(declare-fun m!573755 () Bool)

(assert (=> b!596799 m!573755))

(assert (=> b!596799 m!573755))

(declare-fun m!573757 () Bool)

(assert (=> b!596799 m!573757))

(assert (=> bm!32878 m!573755))

(declare-fun m!573759 () Bool)

(assert (=> bm!32878 m!573759))

(assert (=> b!596800 m!573755))

(assert (=> b!596800 m!573755))

(declare-fun m!573761 () Bool)

(assert (=> b!596800 m!573761))

(assert (=> b!596802 m!573755))

(assert (=> b!596802 m!573755))

(assert (=> b!596802 m!573761))

(assert (=> b!596659 d!86509))

(declare-fun b!596824 () Bool)

(declare-fun e!340997 () SeekEntryResult!6214)

(declare-fun lt!271024 () SeekEntryResult!6214)

(assert (=> b!596824 (= e!340997 (seekKeyOrZeroReturnVacant!0 (x!55909 lt!271024) (index!27106 lt!271024) (index!27106 lt!271024) k0!1786 a!2986 mask!3053))))

(declare-fun b!596825 () Bool)

(declare-fun e!340996 () SeekEntryResult!6214)

(assert (=> b!596825 (= e!340996 Undefined!6214)))

(declare-fun b!596826 () Bool)

(declare-fun e!340995 () SeekEntryResult!6214)

(assert (=> b!596826 (= e!340996 e!340995)))

(declare-fun lt!271023 () (_ BitVec 64))

(assert (=> b!596826 (= lt!271023 (select (arr!17777 a!2986) (index!27106 lt!271024)))))

(declare-fun c!67442 () Bool)

(assert (=> b!596826 (= c!67442 (= lt!271023 k0!1786))))

(declare-fun b!596827 () Bool)

(assert (=> b!596827 (= e!340995 (Found!6214 (index!27106 lt!271024)))))

(declare-fun b!596828 () Bool)

(assert (=> b!596828 (= e!340997 (MissingZero!6214 (index!27106 lt!271024)))))

(declare-fun b!596829 () Bool)

(declare-fun c!67443 () Bool)

(assert (=> b!596829 (= c!67443 (= lt!271023 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!596829 (= e!340995 e!340997)))

(declare-fun d!86511 () Bool)

(declare-fun lt!271022 () SeekEntryResult!6214)

(get-info :version)

(assert (=> d!86511 (and (or ((_ is Undefined!6214) lt!271022) (not ((_ is Found!6214) lt!271022)) (and (bvsge (index!27105 lt!271022) #b00000000000000000000000000000000) (bvslt (index!27105 lt!271022) (size!18142 a!2986)))) (or ((_ is Undefined!6214) lt!271022) ((_ is Found!6214) lt!271022) (not ((_ is MissingZero!6214) lt!271022)) (and (bvsge (index!27104 lt!271022) #b00000000000000000000000000000000) (bvslt (index!27104 lt!271022) (size!18142 a!2986)))) (or ((_ is Undefined!6214) lt!271022) ((_ is Found!6214) lt!271022) ((_ is MissingZero!6214) lt!271022) (not ((_ is MissingVacant!6214) lt!271022)) (and (bvsge (index!27107 lt!271022) #b00000000000000000000000000000000) (bvslt (index!27107 lt!271022) (size!18142 a!2986)))) (or ((_ is Undefined!6214) lt!271022) (ite ((_ is Found!6214) lt!271022) (= (select (arr!17777 a!2986) (index!27105 lt!271022)) k0!1786) (ite ((_ is MissingZero!6214) lt!271022) (= (select (arr!17777 a!2986) (index!27104 lt!271022)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6214) lt!271022) (= (select (arr!17777 a!2986) (index!27107 lt!271022)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!86511 (= lt!271022 e!340996)))

(declare-fun c!67441 () Bool)

(assert (=> d!86511 (= c!67441 (and ((_ is Intermediate!6214) lt!271024) (undefined!7026 lt!271024)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37026 (_ BitVec 32)) SeekEntryResult!6214)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86511 (= lt!271024 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!86511 (validMask!0 mask!3053)))

(assert (=> d!86511 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!271022)))

(assert (= (and d!86511 c!67441) b!596825))

(assert (= (and d!86511 (not c!67441)) b!596826))

(assert (= (and b!596826 c!67442) b!596827))

(assert (= (and b!596826 (not c!67442)) b!596829))

(assert (= (and b!596829 c!67443) b!596828))

(assert (= (and b!596829 (not c!67443)) b!596824))

(declare-fun m!573771 () Bool)

(assert (=> b!596824 m!573771))

(declare-fun m!573773 () Bool)

(assert (=> b!596826 m!573773))

(declare-fun m!573775 () Bool)

(assert (=> d!86511 m!573775))

(declare-fun m!573777 () Bool)

(assert (=> d!86511 m!573777))

(declare-fun m!573779 () Bool)

(assert (=> d!86511 m!573779))

(declare-fun m!573781 () Bool)

(assert (=> d!86511 m!573781))

(assert (=> d!86511 m!573637))

(assert (=> d!86511 m!573779))

(declare-fun m!573783 () Bool)

(assert (=> d!86511 m!573783))

(assert (=> b!596651 d!86511))

(declare-fun b!596905 () Bool)

(declare-fun c!67478 () Bool)

(declare-fun lt!271048 () (_ BitVec 64))

(assert (=> b!596905 (= c!67478 (= lt!271048 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341042 () SeekEntryResult!6214)

(declare-fun e!341040 () SeekEntryResult!6214)

(assert (=> b!596905 (= e!341042 e!341040)))

(declare-fun b!596906 () Bool)

(declare-fun e!341041 () SeekEntryResult!6214)

(assert (=> b!596906 (= e!341041 Undefined!6214)))

(declare-fun lt!271049 () SeekEntryResult!6214)

(declare-fun d!86523 () Bool)

(assert (=> d!86523 (and (or ((_ is Undefined!6214) lt!271049) (not ((_ is Found!6214) lt!271049)) (and (bvsge (index!27105 lt!271049) #b00000000000000000000000000000000) (bvslt (index!27105 lt!271049) (size!18142 a!2986)))) (or ((_ is Undefined!6214) lt!271049) ((_ is Found!6214) lt!271049) (not ((_ is MissingVacant!6214) lt!271049)) (not (= (index!27107 lt!271049) vacantSpotIndex!68)) (and (bvsge (index!27107 lt!271049) #b00000000000000000000000000000000) (bvslt (index!27107 lt!271049) (size!18142 a!2986)))) (or ((_ is Undefined!6214) lt!271049) (ite ((_ is Found!6214) lt!271049) (= (select (arr!17777 a!2986) (index!27105 lt!271049)) (select (arr!17777 a!2986) j!136)) (and ((_ is MissingVacant!6214) lt!271049) (= (index!27107 lt!271049) vacantSpotIndex!68) (= (select (arr!17777 a!2986) (index!27107 lt!271049)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86523 (= lt!271049 e!341041)))

(declare-fun c!67477 () Bool)

(assert (=> d!86523 (= c!67477 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86523 (= lt!271048 (select (arr!17777 a!2986) index!984))))

(assert (=> d!86523 (validMask!0 mask!3053)))

(assert (=> d!86523 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17777 a!2986) j!136) a!2986 mask!3053) lt!271049)))

(declare-fun b!596907 () Bool)

(assert (=> b!596907 (= e!341041 e!341042)))

(declare-fun c!67479 () Bool)

(assert (=> b!596907 (= c!67479 (= lt!271048 (select (arr!17777 a!2986) j!136)))))

(declare-fun b!596908 () Bool)

(assert (=> b!596908 (= e!341040 (MissingVacant!6214 vacantSpotIndex!68))))

(declare-fun b!596909 () Bool)

(assert (=> b!596909 (= e!341040 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17777 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!596910 () Bool)

(assert (=> b!596910 (= e!341042 (Found!6214 index!984))))

(assert (= (and d!86523 c!67477) b!596906))

(assert (= (and d!86523 (not c!67477)) b!596907))

(assert (= (and b!596907 c!67479) b!596910))

(assert (= (and b!596907 (not c!67479)) b!596905))

(assert (= (and b!596905 c!67478) b!596908))

(assert (= (and b!596905 (not c!67478)) b!596909))

(declare-fun m!573825 () Bool)

(assert (=> d!86523 m!573825))

(declare-fun m!573827 () Bool)

(assert (=> d!86523 m!573827))

(assert (=> d!86523 m!573609))

(assert (=> d!86523 m!573637))

(assert (=> b!596909 m!573593))

(assert (=> b!596909 m!573593))

(assert (=> b!596909 m!573597))

(declare-fun m!573829 () Bool)

(assert (=> b!596909 m!573829))

(assert (=> b!596662 d!86523))

(declare-fun b!596911 () Bool)

(declare-fun e!341045 () Bool)

(assert (=> b!596911 (= e!341045 (contains!2938 Nil!11854 (select (arr!17777 lt!270943) #b00000000000000000000000000000000)))))

(declare-fun d!86539 () Bool)

(declare-fun res!382687 () Bool)

(declare-fun e!341043 () Bool)

(assert (=> d!86539 (=> res!382687 e!341043)))

(assert (=> d!86539 (= res!382687 (bvsge #b00000000000000000000000000000000 (size!18142 lt!270943)))))

(assert (=> d!86539 (= (arrayNoDuplicates!0 lt!270943 #b00000000000000000000000000000000 Nil!11854) e!341043)))

(declare-fun bm!32882 () Bool)

(declare-fun call!32885 () Bool)

(declare-fun c!67480 () Bool)

(assert (=> bm!32882 (= call!32885 (arrayNoDuplicates!0 lt!270943 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67480 (Cons!11853 (select (arr!17777 lt!270943) #b00000000000000000000000000000000) Nil!11854) Nil!11854)))))

(declare-fun b!596912 () Bool)

(declare-fun e!341046 () Bool)

(declare-fun e!341044 () Bool)

(assert (=> b!596912 (= e!341046 e!341044)))

(assert (=> b!596912 (= c!67480 (validKeyInArray!0 (select (arr!17777 lt!270943) #b00000000000000000000000000000000)))))

(declare-fun b!596913 () Bool)

(assert (=> b!596913 (= e!341044 call!32885)))

(declare-fun b!596914 () Bool)

(assert (=> b!596914 (= e!341043 e!341046)))

(declare-fun res!382685 () Bool)

(assert (=> b!596914 (=> (not res!382685) (not e!341046))))

(assert (=> b!596914 (= res!382685 (not e!341045))))

(declare-fun res!382686 () Bool)

(assert (=> b!596914 (=> (not res!382686) (not e!341045))))

(assert (=> b!596914 (= res!382686 (validKeyInArray!0 (select (arr!17777 lt!270943) #b00000000000000000000000000000000)))))

(declare-fun b!596915 () Bool)

(assert (=> b!596915 (= e!341044 call!32885)))

(assert (= (and d!86539 (not res!382687)) b!596914))

(assert (= (and b!596914 res!382686) b!596911))

(assert (= (and b!596914 res!382685) b!596912))

(assert (= (and b!596912 c!67480) b!596913))

(assert (= (and b!596912 (not c!67480)) b!596915))

(assert (= (or b!596913 b!596915) bm!32882))

(declare-fun m!573831 () Bool)

(assert (=> b!596911 m!573831))

(assert (=> b!596911 m!573831))

(declare-fun m!573833 () Bool)

(assert (=> b!596911 m!573833))

(assert (=> bm!32882 m!573831))

(declare-fun m!573835 () Bool)

(assert (=> bm!32882 m!573835))

(assert (=> b!596912 m!573831))

(assert (=> b!596912 m!573831))

(declare-fun m!573837 () Bool)

(assert (=> b!596912 m!573837))

(assert (=> b!596914 m!573831))

(assert (=> b!596914 m!573831))

(assert (=> b!596914 m!573837))

(assert (=> b!596661 d!86539))

(declare-fun d!86541 () Bool)

(declare-fun e!341059 () Bool)

(assert (=> d!86541 e!341059))

(declare-fun res!382699 () Bool)

(assert (=> d!86541 (=> (not res!382699) (not e!341059))))

(assert (=> d!86541 (= res!382699 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18142 a!2986))))))

(declare-fun lt!271054 () Unit!18768)

(declare-fun choose!41 (array!37026 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11857) Unit!18768)

(assert (=> d!86541 (= lt!271054 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11854))))

(assert (=> d!86541 (bvslt (size!18142 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!86541 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11854) lt!271054)))

(declare-fun b!596929 () Bool)

(assert (=> b!596929 (= e!341059 (arrayNoDuplicates!0 (array!37027 (store (arr!17777 a!2986) i!1108 k0!1786) (size!18142 a!2986)) #b00000000000000000000000000000000 Nil!11854))))

(assert (= (and d!86541 res!382699) b!596929))

(declare-fun m!573851 () Bool)

(assert (=> d!86541 m!573851))

(assert (=> b!596929 m!573599))

(declare-fun m!573853 () Bool)

(assert (=> b!596929 m!573853))

(assert (=> b!596661 d!86541))

(declare-fun d!86547 () Bool)

(declare-fun res!382702 () Bool)

(declare-fun e!341062 () Bool)

(assert (=> d!86547 (=> res!382702 e!341062)))

(assert (=> d!86547 (= res!382702 (= (select (arr!17777 lt!270943) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17777 a!2986) j!136)))))

(assert (=> d!86547 (= (arrayContainsKey!0 lt!270943 (select (arr!17777 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!341062)))

(declare-fun b!596932 () Bool)

(declare-fun e!341063 () Bool)

(assert (=> b!596932 (= e!341062 e!341063)))

(declare-fun res!382703 () Bool)

(assert (=> b!596932 (=> (not res!382703) (not e!341063))))

(assert (=> b!596932 (= res!382703 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18142 lt!270943)))))

(declare-fun b!596933 () Bool)

(assert (=> b!596933 (= e!341063 (arrayContainsKey!0 lt!270943 (select (arr!17777 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86547 (not res!382702)) b!596932))

(assert (= (and b!596932 res!382703) b!596933))

(declare-fun m!573855 () Bool)

(assert (=> d!86547 m!573855))

(assert (=> b!596933 m!573597))

(declare-fun m!573857 () Bool)

(assert (=> b!596933 m!573857))

(assert (=> b!596661 d!86547))

(declare-fun d!86549 () Bool)

(assert (=> d!86549 (arrayContainsKey!0 lt!270943 (select (arr!17777 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271058 () Unit!18768)

(declare-fun choose!114 (array!37026 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18768)

(assert (=> d!86549 (= lt!271058 (choose!114 lt!270943 (select (arr!17777 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86549 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86549 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270943 (select (arr!17777 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!271058)))

(declare-fun bs!18335 () Bool)

(assert (= bs!18335 d!86549))

(assert (=> bs!18335 m!573597))

(assert (=> bs!18335 m!573627))

(assert (=> bs!18335 m!573597))

(declare-fun m!573867 () Bool)

(assert (=> bs!18335 m!573867))

(assert (=> b!596661 d!86549))

(declare-fun b!596937 () Bool)

(declare-fun c!67483 () Bool)

(declare-fun lt!271063 () (_ BitVec 64))

(assert (=> b!596937 (= c!67483 (= lt!271063 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341071 () SeekEntryResult!6214)

(declare-fun e!341069 () SeekEntryResult!6214)

(assert (=> b!596937 (= e!341071 e!341069)))

(declare-fun b!596938 () Bool)

(declare-fun e!341070 () SeekEntryResult!6214)

(assert (=> b!596938 (= e!341070 Undefined!6214)))

(declare-fun lt!271064 () SeekEntryResult!6214)

(declare-fun d!86555 () Bool)

(assert (=> d!86555 (and (or ((_ is Undefined!6214) lt!271064) (not ((_ is Found!6214) lt!271064)) (and (bvsge (index!27105 lt!271064) #b00000000000000000000000000000000) (bvslt (index!27105 lt!271064) (size!18142 lt!270943)))) (or ((_ is Undefined!6214) lt!271064) ((_ is Found!6214) lt!271064) (not ((_ is MissingVacant!6214) lt!271064)) (not (= (index!27107 lt!271064) vacantSpotIndex!68)) (and (bvsge (index!27107 lt!271064) #b00000000000000000000000000000000) (bvslt (index!27107 lt!271064) (size!18142 lt!270943)))) (or ((_ is Undefined!6214) lt!271064) (ite ((_ is Found!6214) lt!271064) (= (select (arr!17777 lt!270943) (index!27105 lt!271064)) lt!270938) (and ((_ is MissingVacant!6214) lt!271064) (= (index!27107 lt!271064) vacantSpotIndex!68) (= (select (arr!17777 lt!270943) (index!27107 lt!271064)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86555 (= lt!271064 e!341070)))

(declare-fun c!67482 () Bool)

(assert (=> d!86555 (= c!67482 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86555 (= lt!271063 (select (arr!17777 lt!270943) lt!270937))))

(assert (=> d!86555 (validMask!0 mask!3053)))

(assert (=> d!86555 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270937 vacantSpotIndex!68 lt!270938 lt!270943 mask!3053) lt!271064)))

(declare-fun b!596939 () Bool)

(assert (=> b!596939 (= e!341070 e!341071)))

(declare-fun c!67484 () Bool)

(assert (=> b!596939 (= c!67484 (= lt!271063 lt!270938))))

(declare-fun b!596940 () Bool)

(assert (=> b!596940 (= e!341069 (MissingVacant!6214 vacantSpotIndex!68))))

(declare-fun b!596941 () Bool)

(assert (=> b!596941 (= e!341069 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!270937 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!270938 lt!270943 mask!3053))))

(declare-fun b!596942 () Bool)

(assert (=> b!596942 (= e!341071 (Found!6214 lt!270937))))

(assert (= (and d!86555 c!67482) b!596938))

(assert (= (and d!86555 (not c!67482)) b!596939))

(assert (= (and b!596939 c!67484) b!596942))

(assert (= (and b!596939 (not c!67484)) b!596937))

(assert (= (and b!596937 c!67483) b!596940))

(assert (= (and b!596937 (not c!67483)) b!596941))

(declare-fun m!573871 () Bool)

(assert (=> d!86555 m!573871))

(declare-fun m!573873 () Bool)

(assert (=> d!86555 m!573873))

(declare-fun m!573875 () Bool)

(assert (=> d!86555 m!573875))

(assert (=> d!86555 m!573637))

(declare-fun m!573877 () Bool)

(assert (=> b!596941 m!573877))

(assert (=> b!596941 m!573877))

(declare-fun m!573879 () Bool)

(assert (=> b!596941 m!573879))

(assert (=> b!596663 d!86555))

(declare-fun b!596945 () Bool)

(declare-fun c!67486 () Bool)

(declare-fun lt!271066 () (_ BitVec 64))

(assert (=> b!596945 (= c!67486 (= lt!271066 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341074 () SeekEntryResult!6214)

(declare-fun e!341072 () SeekEntryResult!6214)

(assert (=> b!596945 (= e!341074 e!341072)))

(declare-fun b!596946 () Bool)

(declare-fun e!341073 () SeekEntryResult!6214)

(assert (=> b!596946 (= e!341073 Undefined!6214)))

(declare-fun d!86559 () Bool)

(declare-fun lt!271067 () SeekEntryResult!6214)

(assert (=> d!86559 (and (or ((_ is Undefined!6214) lt!271067) (not ((_ is Found!6214) lt!271067)) (and (bvsge (index!27105 lt!271067) #b00000000000000000000000000000000) (bvslt (index!27105 lt!271067) (size!18142 lt!270943)))) (or ((_ is Undefined!6214) lt!271067) ((_ is Found!6214) lt!271067) (not ((_ is MissingVacant!6214) lt!271067)) (not (= (index!27107 lt!271067) vacantSpotIndex!68)) (and (bvsge (index!27107 lt!271067) #b00000000000000000000000000000000) (bvslt (index!27107 lt!271067) (size!18142 lt!270943)))) (or ((_ is Undefined!6214) lt!271067) (ite ((_ is Found!6214) lt!271067) (= (select (arr!17777 lt!270943) (index!27105 lt!271067)) lt!270938) (and ((_ is MissingVacant!6214) lt!271067) (= (index!27107 lt!271067) vacantSpotIndex!68) (= (select (arr!17777 lt!270943) (index!27107 lt!271067)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86559 (= lt!271067 e!341073)))

(declare-fun c!67485 () Bool)

(assert (=> d!86559 (= c!67485 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86559 (= lt!271066 (select (arr!17777 lt!270943) index!984))))

(assert (=> d!86559 (validMask!0 mask!3053)))

(assert (=> d!86559 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270938 lt!270943 mask!3053) lt!271067)))

(declare-fun b!596947 () Bool)

(assert (=> b!596947 (= e!341073 e!341074)))

(declare-fun c!67487 () Bool)

(assert (=> b!596947 (= c!67487 (= lt!271066 lt!270938))))

(declare-fun b!596948 () Bool)

(assert (=> b!596948 (= e!341072 (MissingVacant!6214 vacantSpotIndex!68))))

(declare-fun b!596949 () Bool)

(assert (=> b!596949 (= e!341072 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!270938 lt!270943 mask!3053))))

(declare-fun b!596950 () Bool)

(assert (=> b!596950 (= e!341074 (Found!6214 index!984))))

(assert (= (and d!86559 c!67485) b!596946))

(assert (= (and d!86559 (not c!67485)) b!596947))

(assert (= (and b!596947 c!67487) b!596950))

(assert (= (and b!596947 (not c!67487)) b!596945))

(assert (= (and b!596945 c!67486) b!596948))

(assert (= (and b!596945 (not c!67486)) b!596949))

(declare-fun m!573881 () Bool)

(assert (=> d!86559 m!573881))

(declare-fun m!573883 () Bool)

(assert (=> d!86559 m!573883))

(assert (=> d!86559 m!573751))

(assert (=> d!86559 m!573637))

(assert (=> b!596949 m!573593))

(assert (=> b!596949 m!573593))

(declare-fun m!573885 () Bool)

(assert (=> b!596949 m!573885))

(assert (=> b!596663 d!86559))

(declare-fun d!86561 () Bool)

(declare-fun lt!271071 () (_ BitVec 32))

(assert (=> d!86561 (and (bvsge lt!271071 #b00000000000000000000000000000000) (bvslt lt!271071 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86561 (= lt!271071 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!86561 (validMask!0 mask!3053)))

(assert (=> d!86561 (= (nextIndex!0 index!984 x!910 mask!3053) lt!271071)))

(declare-fun bs!18337 () Bool)

(assert (= bs!18337 d!86561))

(declare-fun m!573891 () Bool)

(assert (=> bs!18337 m!573891))

(assert (=> bs!18337 m!573637))

(assert (=> b!596663 d!86561))

(declare-fun d!86565 () Bool)

(declare-fun e!341096 () Bool)

(assert (=> d!86565 e!341096))

(declare-fun res!382718 () Bool)

(assert (=> d!86565 (=> (not res!382718) (not e!341096))))

(assert (=> d!86565 (= res!382718 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18142 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18142 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18142 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18142 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18142 a!2986))))))

(declare-fun lt!271094 () Unit!18768)

(declare-fun choose!9 (array!37026 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18768)

(assert (=> d!86565 (= lt!271094 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270937 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86565 (validMask!0 mask!3053)))

(assert (=> d!86565 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270937 vacantSpotIndex!68 mask!3053) lt!271094)))

(declare-fun b!596984 () Bool)

(assert (=> b!596984 (= e!341096 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270937 vacantSpotIndex!68 (select (arr!17777 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270937 vacantSpotIndex!68 (select (store (arr!17777 a!2986) i!1108 k0!1786) j!136) (array!37027 (store (arr!17777 a!2986) i!1108 k0!1786) (size!18142 a!2986)) mask!3053)))))

(assert (= (and d!86565 res!382718) b!596984))

(declare-fun m!573913 () Bool)

(assert (=> d!86565 m!573913))

(assert (=> d!86565 m!573637))

(assert (=> b!596984 m!573597))

(assert (=> b!596984 m!573605))

(assert (=> b!596984 m!573599))

(assert (=> b!596984 m!573595))

(assert (=> b!596984 m!573595))

(declare-fun m!573915 () Bool)

(assert (=> b!596984 m!573915))

(assert (=> b!596984 m!573597))

(assert (=> b!596663 d!86565))

(declare-fun b!596985 () Bool)

(declare-fun c!67501 () Bool)

(declare-fun lt!271095 () (_ BitVec 64))

(assert (=> b!596985 (= c!67501 (= lt!271095 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341099 () SeekEntryResult!6214)

(declare-fun e!341097 () SeekEntryResult!6214)

(assert (=> b!596985 (= e!341099 e!341097)))

(declare-fun b!596986 () Bool)

(declare-fun e!341098 () SeekEntryResult!6214)

(assert (=> b!596986 (= e!341098 Undefined!6214)))

(declare-fun d!86573 () Bool)

(declare-fun lt!271096 () SeekEntryResult!6214)

(assert (=> d!86573 (and (or ((_ is Undefined!6214) lt!271096) (not ((_ is Found!6214) lt!271096)) (and (bvsge (index!27105 lt!271096) #b00000000000000000000000000000000) (bvslt (index!27105 lt!271096) (size!18142 a!2986)))) (or ((_ is Undefined!6214) lt!271096) ((_ is Found!6214) lt!271096) (not ((_ is MissingVacant!6214) lt!271096)) (not (= (index!27107 lt!271096) vacantSpotIndex!68)) (and (bvsge (index!27107 lt!271096) #b00000000000000000000000000000000) (bvslt (index!27107 lt!271096) (size!18142 a!2986)))) (or ((_ is Undefined!6214) lt!271096) (ite ((_ is Found!6214) lt!271096) (= (select (arr!17777 a!2986) (index!27105 lt!271096)) (select (arr!17777 a!2986) j!136)) (and ((_ is MissingVacant!6214) lt!271096) (= (index!27107 lt!271096) vacantSpotIndex!68) (= (select (arr!17777 a!2986) (index!27107 lt!271096)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86573 (= lt!271096 e!341098)))

(declare-fun c!67500 () Bool)

(assert (=> d!86573 (= c!67500 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86573 (= lt!271095 (select (arr!17777 a!2986) lt!270937))))

(assert (=> d!86573 (validMask!0 mask!3053)))

(assert (=> d!86573 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270937 vacantSpotIndex!68 (select (arr!17777 a!2986) j!136) a!2986 mask!3053) lt!271096)))

(declare-fun b!596987 () Bool)

(assert (=> b!596987 (= e!341098 e!341099)))

(declare-fun c!67502 () Bool)

(assert (=> b!596987 (= c!67502 (= lt!271095 (select (arr!17777 a!2986) j!136)))))

(declare-fun b!596988 () Bool)

(assert (=> b!596988 (= e!341097 (MissingVacant!6214 vacantSpotIndex!68))))

(declare-fun b!596989 () Bool)

(assert (=> b!596989 (= e!341097 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!270937 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17777 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!596990 () Bool)

(assert (=> b!596990 (= e!341099 (Found!6214 lt!270937))))

(assert (= (and d!86573 c!67500) b!596986))

(assert (= (and d!86573 (not c!67500)) b!596987))

(assert (= (and b!596987 c!67502) b!596990))

(assert (= (and b!596987 (not c!67502)) b!596985))

(assert (= (and b!596985 c!67501) b!596988))

(assert (= (and b!596985 (not c!67501)) b!596989))

(declare-fun m!573917 () Bool)

(assert (=> d!86573 m!573917))

(declare-fun m!573919 () Bool)

(assert (=> d!86573 m!573919))

(declare-fun m!573921 () Bool)

(assert (=> d!86573 m!573921))

(assert (=> d!86573 m!573637))

(assert (=> b!596989 m!573877))

(assert (=> b!596989 m!573877))

(assert (=> b!596989 m!573597))

(declare-fun m!573923 () Bool)

(assert (=> b!596989 m!573923))

(assert (=> b!596663 d!86573))

(declare-fun d!86575 () Bool)

(declare-fun res!382728 () Bool)

(declare-fun e!341125 () Bool)

(assert (=> d!86575 (=> res!382728 e!341125)))

(assert (=> d!86575 (= res!382728 (bvsge #b00000000000000000000000000000000 (size!18142 a!2986)))))

(assert (=> d!86575 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!341125)))

(declare-fun b!597028 () Bool)

(declare-fun e!341124 () Bool)

(declare-fun call!32892 () Bool)

(assert (=> b!597028 (= e!341124 call!32892)))

(declare-fun bm!32889 () Bool)

(assert (=> bm!32889 (= call!32892 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!597029 () Bool)

(declare-fun e!341123 () Bool)

(assert (=> b!597029 (= e!341123 call!32892)))

(declare-fun b!597030 () Bool)

(assert (=> b!597030 (= e!341123 e!341124)))

(declare-fun lt!271117 () (_ BitVec 64))

(assert (=> b!597030 (= lt!271117 (select (arr!17777 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!271116 () Unit!18768)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37026 (_ BitVec 64) (_ BitVec 32)) Unit!18768)

(assert (=> b!597030 (= lt!271116 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!271117 #b00000000000000000000000000000000))))

(assert (=> b!597030 (arrayContainsKey!0 a!2986 lt!271117 #b00000000000000000000000000000000)))

(declare-fun lt!271115 () Unit!18768)

(assert (=> b!597030 (= lt!271115 lt!271116)))

(declare-fun res!382729 () Bool)

(assert (=> b!597030 (= res!382729 (= (seekEntryOrOpen!0 (select (arr!17777 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6214 #b00000000000000000000000000000000)))))

(assert (=> b!597030 (=> (not res!382729) (not e!341124))))

(declare-fun b!597031 () Bool)

(assert (=> b!597031 (= e!341125 e!341123)))

(declare-fun c!67517 () Bool)

(assert (=> b!597031 (= c!67517 (validKeyInArray!0 (select (arr!17777 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!86575 (not res!382728)) b!597031))

(assert (= (and b!597031 c!67517) b!597030))

(assert (= (and b!597031 (not c!67517)) b!597029))

(assert (= (and b!597030 res!382729) b!597028))

(assert (= (or b!597028 b!597029) bm!32889))

(declare-fun m!573967 () Bool)

(assert (=> bm!32889 m!573967))

(assert (=> b!597030 m!573755))

(declare-fun m!573969 () Bool)

(assert (=> b!597030 m!573969))

(declare-fun m!573971 () Bool)

(assert (=> b!597030 m!573971))

(assert (=> b!597030 m!573755))

(declare-fun m!573973 () Bool)

(assert (=> b!597030 m!573973))

(assert (=> b!597031 m!573755))

(assert (=> b!597031 m!573755))

(assert (=> b!597031 m!573761))

(assert (=> b!596653 d!86575))

(declare-fun d!86591 () Bool)

(declare-fun res!382730 () Bool)

(declare-fun e!341126 () Bool)

(assert (=> d!86591 (=> res!382730 e!341126)))

(assert (=> d!86591 (= res!382730 (= (select (arr!17777 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!86591 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!341126)))

(declare-fun b!597032 () Bool)

(declare-fun e!341127 () Bool)

(assert (=> b!597032 (= e!341126 e!341127)))

(declare-fun res!382731 () Bool)

(assert (=> b!597032 (=> (not res!382731) (not e!341127))))

(assert (=> b!597032 (= res!382731 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18142 a!2986)))))

(declare-fun b!597033 () Bool)

(assert (=> b!597033 (= e!341127 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86591 (not res!382730)) b!597032))

(assert (= (and b!597032 res!382731) b!597033))

(assert (=> d!86591 m!573755))

(declare-fun m!573975 () Bool)

(assert (=> b!597033 m!573975))

(assert (=> b!596664 d!86591))

(declare-fun d!86593 () Bool)

(assert (=> d!86593 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!596655 d!86593))

(declare-fun d!86595 () Bool)

(declare-fun res!382732 () Bool)

(declare-fun e!341128 () Bool)

(assert (=> d!86595 (=> res!382732 e!341128)))

(assert (=> d!86595 (= res!382732 (= (select (arr!17777 lt!270943) j!136) (select (arr!17777 a!2986) j!136)))))

(assert (=> d!86595 (= (arrayContainsKey!0 lt!270943 (select (arr!17777 a!2986) j!136) j!136) e!341128)))

(declare-fun b!597034 () Bool)

(declare-fun e!341129 () Bool)

(assert (=> b!597034 (= e!341128 e!341129)))

(declare-fun res!382733 () Bool)

(assert (=> b!597034 (=> (not res!382733) (not e!341129))))

(assert (=> b!597034 (= res!382733 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18142 lt!270943)))))

(declare-fun b!597035 () Bool)

(assert (=> b!597035 (= e!341129 (arrayContainsKey!0 lt!270943 (select (arr!17777 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86595 (not res!382732)) b!597034))

(assert (= (and b!597034 res!382733) b!597035))

(declare-fun m!573977 () Bool)

(assert (=> d!86595 m!573977))

(assert (=> b!597035 m!573597))

(declare-fun m!573979 () Bool)

(assert (=> b!597035 m!573979))

(assert (=> b!596665 d!86595))

(check-sat (not d!86561) (not d!86523) (not b!596824) (not b!596802) (not b!596909) (not bm!32889) (not b!596800) (not b!596949) (not d!86541) (not b!596984) (not b!596941) (not b!596989) (not b!596914) (not bm!32882) (not b!597035) (not b!597033) (not b!596933) (not d!86565) (not b!597031) (not d!86559) (not b!596912) (not d!86573) (not d!86549) (not b!597030) (not b!596799) (not b!596929) (not d!86511) (not d!86555) (not bm!32878) (not b!596911) (not b!596788))
(check-sat)
