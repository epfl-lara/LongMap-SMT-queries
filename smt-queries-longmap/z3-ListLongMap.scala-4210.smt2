; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57692 () Bool)

(assert start!57692)

(declare-fun b!637721 () Bool)

(declare-fun e!364885 () Bool)

(declare-fun e!364893 () Bool)

(assert (=> b!637721 (= e!364885 e!364893)))

(declare-fun res!412753 () Bool)

(assert (=> b!637721 (=> res!412753 e!364893)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38274 0))(
  ( (array!38275 (arr!18359 (Array (_ BitVec 32) (_ BitVec 64))) (size!18724 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38274)

(declare-fun lt!294769 () (_ BitVec 64))

(declare-fun lt!294777 () (_ BitVec 64))

(assert (=> b!637721 (= res!412753 (or (not (= (select (arr!18359 a!2986) j!136) lt!294777)) (not (= (select (arr!18359 a!2986) j!136) lt!294769)) (bvsge j!136 index!984)))))

(declare-fun e!364883 () Bool)

(assert (=> b!637721 e!364883))

(declare-fun res!412757 () Bool)

(assert (=> b!637721 (=> (not res!412757) (not e!364883))))

(assert (=> b!637721 (= res!412757 (= lt!294769 (select (arr!18359 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!637721 (= lt!294769 (select (store (arr!18359 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!637722 () Bool)

(declare-fun e!364886 () Bool)

(assert (=> b!637722 (= e!364886 true)))

(declare-fun lt!294774 () Bool)

(declare-datatypes ((List!12439 0))(
  ( (Nil!12436) (Cons!12435 (h!13480 (_ BitVec 64)) (t!18658 List!12439)) )
))
(declare-fun contains!3099 (List!12439 (_ BitVec 64)) Bool)

(assert (=> b!637722 (= lt!294774 (contains!3099 Nil!12436 k0!1786))))

(declare-fun b!637723 () Bool)

(declare-fun e!364890 () Bool)

(declare-fun e!364894 () Bool)

(assert (=> b!637723 (= e!364890 e!364894)))

(declare-fun res!412755 () Bool)

(assert (=> b!637723 (=> (not res!412755) (not e!364894))))

(declare-datatypes ((SeekEntryResult!6796 0))(
  ( (MissingZero!6796 (index!29498 (_ BitVec 32))) (Found!6796 (index!29499 (_ BitVec 32))) (Intermediate!6796 (undefined!7608 Bool) (index!29500 (_ BitVec 32)) (x!58265 (_ BitVec 32))) (Undefined!6796) (MissingVacant!6796 (index!29501 (_ BitVec 32))) )
))
(declare-fun lt!294776 () SeekEntryResult!6796)

(assert (=> b!637723 (= res!412755 (or (= lt!294776 (MissingZero!6796 i!1108)) (= lt!294776 (MissingVacant!6796 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38274 (_ BitVec 32)) SeekEntryResult!6796)

(assert (=> b!637723 (= lt!294776 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!637724 () Bool)

(declare-fun res!412743 () Bool)

(assert (=> b!637724 (=> (not res!412743) (not e!364894))))

(declare-fun arrayNoDuplicates!0 (array!38274 (_ BitVec 32) List!12439) Bool)

(assert (=> b!637724 (= res!412743 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12436))))

(declare-fun b!637725 () Bool)

(declare-datatypes ((Unit!21512 0))(
  ( (Unit!21513) )
))
(declare-fun e!364884 () Unit!21512)

(declare-fun Unit!21514 () Unit!21512)

(assert (=> b!637725 (= e!364884 Unit!21514)))

(declare-fun b!637726 () Bool)

(declare-fun res!412739 () Bool)

(assert (=> b!637726 (=> (not res!412739) (not e!364890))))

(declare-fun arrayContainsKey!0 (array!38274 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!637726 (= res!412739 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!637727 () Bool)

(assert (=> b!637727 (= e!364893 e!364886)))

(declare-fun res!412756 () Bool)

(assert (=> b!637727 (=> res!412756 e!364886)))

(assert (=> b!637727 (= res!412756 (or (bvsge (size!18724 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18724 a!2986))))))

(declare-fun lt!294772 () array!38274)

(assert (=> b!637727 (arrayContainsKey!0 lt!294772 (select (arr!18359 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294771 () Unit!21512)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38274 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21512)

(assert (=> b!637727 (= lt!294771 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294772 (select (arr!18359 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!637728 () Bool)

(declare-fun e!364887 () Bool)

(assert (=> b!637728 (= e!364887 (arrayContainsKey!0 lt!294772 (select (arr!18359 a!2986) j!136) index!984))))

(declare-fun b!637729 () Bool)

(declare-fun res!412745 () Bool)

(assert (=> b!637729 (=> (not res!412745) (not e!364894))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!637729 (= res!412745 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18359 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!637730 () Bool)

(declare-fun res!412751 () Bool)

(assert (=> b!637730 (=> res!412751 e!364886)))

(assert (=> b!637730 (= res!412751 (contains!3099 Nil!12436 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!412749 () Bool)

(assert (=> start!57692 (=> (not res!412749) (not e!364890))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57692 (= res!412749 (validMask!0 mask!3053))))

(assert (=> start!57692 e!364890))

(assert (=> start!57692 true))

(declare-fun array_inv!14242 (array!38274) Bool)

(assert (=> start!57692 (array_inv!14242 a!2986)))

(declare-fun b!637731 () Bool)

(declare-fun e!364891 () Bool)

(assert (=> b!637731 (= e!364891 e!364887)))

(declare-fun res!412740 () Bool)

(assert (=> b!637731 (=> (not res!412740) (not e!364887))))

(assert (=> b!637731 (= res!412740 (arrayContainsKey!0 lt!294772 (select (arr!18359 a!2986) j!136) j!136))))

(declare-fun b!637732 () Bool)

(declare-fun e!364889 () Bool)

(assert (=> b!637732 (= e!364894 e!364889)))

(declare-fun res!412754 () Bool)

(assert (=> b!637732 (=> (not res!412754) (not e!364889))))

(assert (=> b!637732 (= res!412754 (= (select (store (arr!18359 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!637732 (= lt!294772 (array!38275 (store (arr!18359 a!2986) i!1108 k0!1786) (size!18724 a!2986)))))

(declare-fun b!637733 () Bool)

(declare-fun res!412744 () Bool)

(assert (=> b!637733 (=> (not res!412744) (not e!364890))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!637733 (= res!412744 (validKeyInArray!0 (select (arr!18359 a!2986) j!136)))))

(declare-fun b!637734 () Bool)

(declare-fun res!412752 () Bool)

(assert (=> b!637734 (=> (not res!412752) (not e!364894))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38274 (_ BitVec 32)) Bool)

(assert (=> b!637734 (= res!412752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!637735 () Bool)

(assert (=> b!637735 (= e!364883 e!364891)))

(declare-fun res!412759 () Bool)

(assert (=> b!637735 (=> res!412759 e!364891)))

(assert (=> b!637735 (= res!412759 (or (not (= (select (arr!18359 a!2986) j!136) lt!294777)) (not (= (select (arr!18359 a!2986) j!136) lt!294769)) (bvsge j!136 index!984)))))

(declare-fun b!637736 () Bool)

(declare-fun e!364895 () Bool)

(assert (=> b!637736 (= e!364895 (not e!364885))))

(declare-fun res!412748 () Bool)

(assert (=> b!637736 (=> res!412748 e!364885)))

(declare-fun lt!294770 () SeekEntryResult!6796)

(assert (=> b!637736 (= res!412748 (not (= lt!294770 (Found!6796 index!984))))))

(declare-fun lt!294775 () Unit!21512)

(assert (=> b!637736 (= lt!294775 e!364884)))

(declare-fun c!72858 () Bool)

(assert (=> b!637736 (= c!72858 (= lt!294770 Undefined!6796))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38274 (_ BitVec 32)) SeekEntryResult!6796)

(assert (=> b!637736 (= lt!294770 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294777 lt!294772 mask!3053))))

(declare-fun e!364888 () Bool)

(assert (=> b!637736 e!364888))

(declare-fun res!412750 () Bool)

(assert (=> b!637736 (=> (not res!412750) (not e!364888))))

(declare-fun lt!294778 () (_ BitVec 32))

(declare-fun lt!294773 () SeekEntryResult!6796)

(assert (=> b!637736 (= res!412750 (= lt!294773 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294778 vacantSpotIndex!68 lt!294777 lt!294772 mask!3053)))))

(assert (=> b!637736 (= lt!294773 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294778 vacantSpotIndex!68 (select (arr!18359 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!637736 (= lt!294777 (select (store (arr!18359 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!294779 () Unit!21512)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38274 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21512)

(assert (=> b!637736 (= lt!294779 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294778 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!637736 (= lt!294778 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!637737 () Bool)

(declare-fun res!412741 () Bool)

(assert (=> b!637737 (=> (not res!412741) (not e!364890))))

(assert (=> b!637737 (= res!412741 (and (= (size!18724 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18724 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18724 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!637738 () Bool)

(declare-fun res!412742 () Bool)

(assert (=> b!637738 (=> res!412742 e!364886)))

(declare-fun noDuplicate!398 (List!12439) Bool)

(assert (=> b!637738 (= res!412742 (not (noDuplicate!398 Nil!12436)))))

(declare-fun b!637739 () Bool)

(assert (=> b!637739 (= e!364889 e!364895)))

(declare-fun res!412747 () Bool)

(assert (=> b!637739 (=> (not res!412747) (not e!364895))))

(declare-fun lt!294780 () SeekEntryResult!6796)

(assert (=> b!637739 (= res!412747 (and (= lt!294780 (Found!6796 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18359 a!2986) index!984) (select (arr!18359 a!2986) j!136))) (not (= (select (arr!18359 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!637739 (= lt!294780 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18359 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!637740 () Bool)

(declare-fun res!412758 () Bool)

(assert (=> b!637740 (=> (not res!412758) (not e!364890))))

(assert (=> b!637740 (= res!412758 (validKeyInArray!0 k0!1786))))

(declare-fun b!637741 () Bool)

(declare-fun res!412746 () Bool)

(assert (=> b!637741 (=> res!412746 e!364886)))

(assert (=> b!637741 (= res!412746 (contains!3099 Nil!12436 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637742 () Bool)

(declare-fun Unit!21515 () Unit!21512)

(assert (=> b!637742 (= e!364884 Unit!21515)))

(assert (=> b!637742 false))

(declare-fun b!637743 () Bool)

(assert (=> b!637743 (= e!364888 (= lt!294780 lt!294773))))

(assert (= (and start!57692 res!412749) b!637737))

(assert (= (and b!637737 res!412741) b!637733))

(assert (= (and b!637733 res!412744) b!637740))

(assert (= (and b!637740 res!412758) b!637726))

(assert (= (and b!637726 res!412739) b!637723))

(assert (= (and b!637723 res!412755) b!637734))

(assert (= (and b!637734 res!412752) b!637724))

(assert (= (and b!637724 res!412743) b!637729))

(assert (= (and b!637729 res!412745) b!637732))

(assert (= (and b!637732 res!412754) b!637739))

(assert (= (and b!637739 res!412747) b!637736))

(assert (= (and b!637736 res!412750) b!637743))

(assert (= (and b!637736 c!72858) b!637742))

(assert (= (and b!637736 (not c!72858)) b!637725))

(assert (= (and b!637736 (not res!412748)) b!637721))

(assert (= (and b!637721 res!412757) b!637735))

(assert (= (and b!637735 (not res!412759)) b!637731))

(assert (= (and b!637731 res!412740) b!637728))

(assert (= (and b!637721 (not res!412753)) b!637727))

(assert (= (and b!637727 (not res!412756)) b!637738))

(assert (= (and b!637738 (not res!412742)) b!637741))

(assert (= (and b!637741 (not res!412746)) b!637730))

(assert (= (and b!637730 (not res!412751)) b!637722))

(declare-fun m!611223 () Bool)

(assert (=> start!57692 m!611223))

(declare-fun m!611225 () Bool)

(assert (=> start!57692 m!611225))

(declare-fun m!611227 () Bool)

(assert (=> b!637735 m!611227))

(assert (=> b!637727 m!611227))

(assert (=> b!637727 m!611227))

(declare-fun m!611229 () Bool)

(assert (=> b!637727 m!611229))

(assert (=> b!637727 m!611227))

(declare-fun m!611231 () Bool)

(assert (=> b!637727 m!611231))

(assert (=> b!637721 m!611227))

(declare-fun m!611233 () Bool)

(assert (=> b!637721 m!611233))

(declare-fun m!611235 () Bool)

(assert (=> b!637721 m!611235))

(assert (=> b!637736 m!611233))

(declare-fun m!611237 () Bool)

(assert (=> b!637736 m!611237))

(declare-fun m!611239 () Bool)

(assert (=> b!637736 m!611239))

(declare-fun m!611241 () Bool)

(assert (=> b!637736 m!611241))

(assert (=> b!637736 m!611227))

(declare-fun m!611243 () Bool)

(assert (=> b!637736 m!611243))

(declare-fun m!611245 () Bool)

(assert (=> b!637736 m!611245))

(assert (=> b!637736 m!611227))

(declare-fun m!611247 () Bool)

(assert (=> b!637736 m!611247))

(declare-fun m!611249 () Bool)

(assert (=> b!637741 m!611249))

(assert (=> b!637733 m!611227))

(assert (=> b!637733 m!611227))

(declare-fun m!611251 () Bool)

(assert (=> b!637733 m!611251))

(declare-fun m!611253 () Bool)

(assert (=> b!637738 m!611253))

(declare-fun m!611255 () Bool)

(assert (=> b!637730 m!611255))

(assert (=> b!637728 m!611227))

(assert (=> b!637728 m!611227))

(declare-fun m!611257 () Bool)

(assert (=> b!637728 m!611257))

(declare-fun m!611259 () Bool)

(assert (=> b!637726 m!611259))

(declare-fun m!611261 () Bool)

(assert (=> b!637724 m!611261))

(declare-fun m!611263 () Bool)

(assert (=> b!637734 m!611263))

(declare-fun m!611265 () Bool)

(assert (=> b!637723 m!611265))

(declare-fun m!611267 () Bool)

(assert (=> b!637740 m!611267))

(assert (=> b!637731 m!611227))

(assert (=> b!637731 m!611227))

(declare-fun m!611269 () Bool)

(assert (=> b!637731 m!611269))

(declare-fun m!611271 () Bool)

(assert (=> b!637722 m!611271))

(declare-fun m!611273 () Bool)

(assert (=> b!637739 m!611273))

(assert (=> b!637739 m!611227))

(assert (=> b!637739 m!611227))

(declare-fun m!611275 () Bool)

(assert (=> b!637739 m!611275))

(declare-fun m!611277 () Bool)

(assert (=> b!637729 m!611277))

(assert (=> b!637732 m!611233))

(declare-fun m!611279 () Bool)

(assert (=> b!637732 m!611279))

(check-sat (not b!637740) (not b!637739) (not b!637724) (not b!637726) (not b!637722) (not b!637730) (not b!637734) (not b!637731) (not b!637736) (not b!637728) (not b!637723) (not b!637733) (not b!637741) (not b!637727) (not start!57692) (not b!637738))
(check-sat)
