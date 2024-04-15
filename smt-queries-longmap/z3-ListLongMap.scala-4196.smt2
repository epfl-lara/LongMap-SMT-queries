; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57256 () Bool)

(assert start!57256)

(declare-fun b!633642 () Bool)

(declare-fun e!362301 () Bool)

(declare-datatypes ((SeekEntryResult!6754 0))(
  ( (MissingZero!6754 (index!29315 (_ BitVec 32))) (Found!6754 (index!29316 (_ BitVec 32))) (Intermediate!6754 (undefined!7566 Bool) (index!29317 (_ BitVec 32)) (x!58066 (_ BitVec 32))) (Undefined!6754) (MissingVacant!6754 (index!29318 (_ BitVec 32))) )
))
(declare-fun lt!292788 () SeekEntryResult!6754)

(declare-fun lt!292794 () SeekEntryResult!6754)

(assert (=> b!633642 (= e!362301 (= lt!292788 lt!292794))))

(declare-fun b!633643 () Bool)

(declare-fun e!362307 () Bool)

(declare-fun e!362306 () Bool)

(assert (=> b!633643 (= e!362307 e!362306)))

(declare-fun res!409901 () Bool)

(assert (=> b!633643 (=> (not res!409901) (not e!362306))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38175 0))(
  ( (array!38176 (arr!18317 (Array (_ BitVec 32) (_ BitVec 64))) (size!18682 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38175)

(assert (=> b!633643 (= res!409901 (and (= lt!292788 (Found!6754 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18317 a!2986) index!984) (select (arr!18317 a!2986) j!136))) (not (= (select (arr!18317 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38175 (_ BitVec 32)) SeekEntryResult!6754)

(assert (=> b!633643 (= lt!292788 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18317 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!633644 () Bool)

(declare-fun e!362300 () Bool)

(declare-fun e!362302 () Bool)

(assert (=> b!633644 (= e!362300 e!362302)))

(declare-fun res!409892 () Bool)

(assert (=> b!633644 (=> (not res!409892) (not e!362302))))

(declare-fun lt!292787 () array!38175)

(declare-fun arrayContainsKey!0 (array!38175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!633644 (= res!409892 (arrayContainsKey!0 lt!292787 (select (arr!18317 a!2986) j!136) j!136))))

(declare-fun b!633645 () Bool)

(declare-fun res!409903 () Bool)

(declare-fun e!362299 () Bool)

(assert (=> b!633645 (=> (not res!409903) (not e!362299))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!633645 (= res!409903 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!633646 () Bool)

(declare-fun e!362298 () Bool)

(assert (=> b!633646 (= e!362306 (not e!362298))))

(declare-fun res!409900 () Bool)

(assert (=> b!633646 (=> res!409900 e!362298)))

(declare-fun lt!292793 () SeekEntryResult!6754)

(assert (=> b!633646 (= res!409900 (not (= lt!292793 (Found!6754 index!984))))))

(declare-datatypes ((Unit!21344 0))(
  ( (Unit!21345) )
))
(declare-fun lt!292790 () Unit!21344)

(declare-fun e!362304 () Unit!21344)

(assert (=> b!633646 (= lt!292790 e!362304)))

(declare-fun c!72243 () Bool)

(assert (=> b!633646 (= c!72243 (= lt!292793 Undefined!6754))))

(declare-fun lt!292796 () (_ BitVec 64))

(assert (=> b!633646 (= lt!292793 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292796 lt!292787 mask!3053))))

(assert (=> b!633646 e!362301))

(declare-fun res!409905 () Bool)

(assert (=> b!633646 (=> (not res!409905) (not e!362301))))

(declare-fun lt!292791 () (_ BitVec 32))

(assert (=> b!633646 (= res!409905 (= lt!292794 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292791 vacantSpotIndex!68 lt!292796 lt!292787 mask!3053)))))

(assert (=> b!633646 (= lt!292794 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292791 vacantSpotIndex!68 (select (arr!18317 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!633646 (= lt!292796 (select (store (arr!18317 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!292789 () Unit!21344)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38175 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21344)

(assert (=> b!633646 (= lt!292789 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292791 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!633646 (= lt!292791 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!633647 () Bool)

(declare-fun e!362305 () Bool)

(assert (=> b!633647 (= e!362305 e!362307)))

(declare-fun res!409891 () Bool)

(assert (=> b!633647 (=> (not res!409891) (not e!362307))))

(assert (=> b!633647 (= res!409891 (= (select (store (arr!18317 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!633647 (= lt!292787 (array!38176 (store (arr!18317 a!2986) i!1108 k0!1786) (size!18682 a!2986)))))

(declare-fun b!633648 () Bool)

(declare-fun res!409904 () Bool)

(assert (=> b!633648 (=> (not res!409904) (not e!362299))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!633648 (= res!409904 (validKeyInArray!0 k0!1786))))

(declare-fun b!633649 () Bool)

(declare-fun res!409890 () Bool)

(assert (=> b!633649 (=> (not res!409890) (not e!362305))))

(assert (=> b!633649 (= res!409890 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18317 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!633650 () Bool)

(declare-fun e!362308 () Bool)

(assert (=> b!633650 (= e!362308 e!362300)))

(declare-fun res!409894 () Bool)

(assert (=> b!633650 (=> res!409894 e!362300)))

(declare-fun lt!292792 () (_ BitVec 64))

(assert (=> b!633650 (= res!409894 (or (not (= (select (arr!18317 a!2986) j!136) lt!292796)) (not (= (select (arr!18317 a!2986) j!136) lt!292792)) (bvsge j!136 index!984)))))

(declare-fun res!409899 () Bool)

(assert (=> start!57256 (=> (not res!409899) (not e!362299))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57256 (= res!409899 (validMask!0 mask!3053))))

(assert (=> start!57256 e!362299))

(assert (=> start!57256 true))

(declare-fun array_inv!14200 (array!38175) Bool)

(assert (=> start!57256 (array_inv!14200 a!2986)))

(declare-fun b!633651 () Bool)

(declare-fun Unit!21346 () Unit!21344)

(assert (=> b!633651 (= e!362304 Unit!21346)))

(assert (=> b!633651 false))

(declare-fun b!633652 () Bool)

(assert (=> b!633652 (= e!362302 (arrayContainsKey!0 lt!292787 (select (arr!18317 a!2986) j!136) index!984))))

(declare-fun b!633653 () Bool)

(assert (=> b!633653 (= e!362298 true)))

(assert (=> b!633653 e!362308))

(declare-fun res!409895 () Bool)

(assert (=> b!633653 (=> (not res!409895) (not e!362308))))

(assert (=> b!633653 (= res!409895 (= lt!292792 (select (arr!18317 a!2986) j!136)))))

(assert (=> b!633653 (= lt!292792 (select (store (arr!18317 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!633654 () Bool)

(declare-fun res!409896 () Bool)

(assert (=> b!633654 (=> (not res!409896) (not e!362305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38175 (_ BitVec 32)) Bool)

(assert (=> b!633654 (= res!409896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!633655 () Bool)

(declare-fun res!409898 () Bool)

(assert (=> b!633655 (=> (not res!409898) (not e!362299))))

(assert (=> b!633655 (= res!409898 (validKeyInArray!0 (select (arr!18317 a!2986) j!136)))))

(declare-fun b!633656 () Bool)

(declare-fun res!409902 () Bool)

(assert (=> b!633656 (=> (not res!409902) (not e!362305))))

(declare-datatypes ((List!12397 0))(
  ( (Nil!12394) (Cons!12393 (h!13438 (_ BitVec 64)) (t!18616 List!12397)) )
))
(declare-fun arrayNoDuplicates!0 (array!38175 (_ BitVec 32) List!12397) Bool)

(assert (=> b!633656 (= res!409902 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12394))))

(declare-fun b!633657 () Bool)

(declare-fun Unit!21347 () Unit!21344)

(assert (=> b!633657 (= e!362304 Unit!21347)))

(declare-fun b!633658 () Bool)

(assert (=> b!633658 (= e!362299 e!362305)))

(declare-fun res!409893 () Bool)

(assert (=> b!633658 (=> (not res!409893) (not e!362305))))

(declare-fun lt!292795 () SeekEntryResult!6754)

(assert (=> b!633658 (= res!409893 (or (= lt!292795 (MissingZero!6754 i!1108)) (= lt!292795 (MissingVacant!6754 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38175 (_ BitVec 32)) SeekEntryResult!6754)

(assert (=> b!633658 (= lt!292795 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!633659 () Bool)

(declare-fun res!409897 () Bool)

(assert (=> b!633659 (=> (not res!409897) (not e!362299))))

(assert (=> b!633659 (= res!409897 (and (= (size!18682 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18682 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18682 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!57256 res!409899) b!633659))

(assert (= (and b!633659 res!409897) b!633655))

(assert (= (and b!633655 res!409898) b!633648))

(assert (= (and b!633648 res!409904) b!633645))

(assert (= (and b!633645 res!409903) b!633658))

(assert (= (and b!633658 res!409893) b!633654))

(assert (= (and b!633654 res!409896) b!633656))

(assert (= (and b!633656 res!409902) b!633649))

(assert (= (and b!633649 res!409890) b!633647))

(assert (= (and b!633647 res!409891) b!633643))

(assert (= (and b!633643 res!409901) b!633646))

(assert (= (and b!633646 res!409905) b!633642))

(assert (= (and b!633646 c!72243) b!633651))

(assert (= (and b!633646 (not c!72243)) b!633657))

(assert (= (and b!633646 (not res!409900)) b!633653))

(assert (= (and b!633653 res!409895) b!633650))

(assert (= (and b!633650 (not res!409894)) b!633644))

(assert (= (and b!633644 res!409892) b!633652))

(declare-fun m!607745 () Bool)

(assert (=> b!633645 m!607745))

(declare-fun m!607747 () Bool)

(assert (=> b!633643 m!607747))

(declare-fun m!607749 () Bool)

(assert (=> b!633643 m!607749))

(assert (=> b!633643 m!607749))

(declare-fun m!607751 () Bool)

(assert (=> b!633643 m!607751))

(declare-fun m!607753 () Bool)

(assert (=> b!633647 m!607753))

(declare-fun m!607755 () Bool)

(assert (=> b!633647 m!607755))

(assert (=> b!633655 m!607749))

(assert (=> b!633655 m!607749))

(declare-fun m!607757 () Bool)

(assert (=> b!633655 m!607757))

(declare-fun m!607759 () Bool)

(assert (=> b!633656 m!607759))

(assert (=> b!633644 m!607749))

(assert (=> b!633644 m!607749))

(declare-fun m!607761 () Bool)

(assert (=> b!633644 m!607761))

(declare-fun m!607763 () Bool)

(assert (=> start!57256 m!607763))

(declare-fun m!607765 () Bool)

(assert (=> start!57256 m!607765))

(assert (=> b!633653 m!607749))

(assert (=> b!633653 m!607753))

(declare-fun m!607767 () Bool)

(assert (=> b!633653 m!607767))

(assert (=> b!633652 m!607749))

(assert (=> b!633652 m!607749))

(declare-fun m!607769 () Bool)

(assert (=> b!633652 m!607769))

(declare-fun m!607771 () Bool)

(assert (=> b!633649 m!607771))

(declare-fun m!607773 () Bool)

(assert (=> b!633658 m!607773))

(declare-fun m!607775 () Bool)

(assert (=> b!633648 m!607775))

(declare-fun m!607777 () Bool)

(assert (=> b!633646 m!607777))

(assert (=> b!633646 m!607749))

(assert (=> b!633646 m!607753))

(declare-fun m!607779 () Bool)

(assert (=> b!633646 m!607779))

(declare-fun m!607781 () Bool)

(assert (=> b!633646 m!607781))

(declare-fun m!607783 () Bool)

(assert (=> b!633646 m!607783))

(assert (=> b!633646 m!607749))

(declare-fun m!607785 () Bool)

(assert (=> b!633646 m!607785))

(declare-fun m!607787 () Bool)

(assert (=> b!633646 m!607787))

(assert (=> b!633650 m!607749))

(declare-fun m!607789 () Bool)

(assert (=> b!633654 m!607789))

(check-sat (not b!633654) (not b!633646) (not b!633644) (not b!633656) (not b!633643) (not b!633655) (not start!57256) (not b!633645) (not b!633648) (not b!633658) (not b!633652))
(check-sat)
