; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58418 () Bool)

(assert start!58418)

(declare-fun b!644726 () Bool)

(declare-fun e!369431 () Bool)

(declare-fun e!369436 () Bool)

(assert (=> b!644726 (= e!369431 e!369436)))

(declare-fun res!417700 () Bool)

(assert (=> b!644726 (=> res!417700 e!369436)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!644726 (= res!417700 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!21854 0))(
  ( (Unit!21855) )
))
(declare-fun lt!298759 () Unit!21854)

(declare-fun e!369433 () Unit!21854)

(assert (=> b!644726 (= lt!298759 e!369433)))

(declare-fun c!73881 () Bool)

(assert (=> b!644726 (= c!73881 (bvslt j!136 index!984))))

(declare-fun b!644727 () Bool)

(declare-fun e!369435 () Bool)

(declare-fun e!369423 () Bool)

(assert (=> b!644727 (= e!369435 e!369423)))

(declare-fun res!417708 () Bool)

(assert (=> b!644727 (=> (not res!417708) (not e!369423))))

(declare-datatypes ((SeekEntryResult!6871 0))(
  ( (MissingZero!6871 (index!29819 (_ BitVec 32))) (Found!6871 (index!29820 (_ BitVec 32))) (Intermediate!6871 (undefined!7683 Bool) (index!29821 (_ BitVec 32)) (x!58603 (_ BitVec 32))) (Undefined!6871) (MissingVacant!6871 (index!29822 (_ BitVec 32))) )
))
(declare-fun lt!298765 () SeekEntryResult!6871)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!644727 (= res!417708 (or (= lt!298765 (MissingZero!6871 i!1108)) (= lt!298765 (MissingVacant!6871 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!38445 0))(
  ( (array!38446 (arr!18434 (Array (_ BitVec 32) (_ BitVec 64))) (size!18799 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38445)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38445 (_ BitVec 32)) SeekEntryResult!6871)

(assert (=> b!644727 (= lt!298765 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!644728 () Bool)

(declare-fun e!369434 () Bool)

(declare-fun e!369429 () Bool)

(assert (=> b!644728 (= e!369434 (not e!369429))))

(declare-fun res!417703 () Bool)

(assert (=> b!644728 (=> res!417703 e!369429)))

(declare-fun lt!298760 () SeekEntryResult!6871)

(assert (=> b!644728 (= res!417703 (not (= lt!298760 (Found!6871 index!984))))))

(declare-fun lt!298763 () Unit!21854)

(declare-fun e!369425 () Unit!21854)

(assert (=> b!644728 (= lt!298763 e!369425)))

(declare-fun c!73880 () Bool)

(assert (=> b!644728 (= c!73880 (= lt!298760 Undefined!6871))))

(declare-fun lt!298761 () array!38445)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!298762 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38445 (_ BitVec 32)) SeekEntryResult!6871)

(assert (=> b!644728 (= lt!298760 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298762 lt!298761 mask!3053))))

(declare-fun e!369437 () Bool)

(assert (=> b!644728 e!369437))

(declare-fun res!417713 () Bool)

(assert (=> b!644728 (=> (not res!417713) (not e!369437))))

(declare-fun lt!298770 () SeekEntryResult!6871)

(declare-fun lt!298769 () (_ BitVec 32))

(assert (=> b!644728 (= res!417713 (= lt!298770 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298769 vacantSpotIndex!68 lt!298762 lt!298761 mask!3053)))))

(assert (=> b!644728 (= lt!298770 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298769 vacantSpotIndex!68 (select (arr!18434 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!644728 (= lt!298762 (select (store (arr!18434 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!298768 () Unit!21854)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38445 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21854)

(assert (=> b!644728 (= lt!298768 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298769 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!644728 (= lt!298769 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun e!369430 () Bool)

(declare-fun b!644729 () Bool)

(declare-fun arrayContainsKey!0 (array!38445 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!644729 (= e!369430 (arrayContainsKey!0 lt!298761 (select (arr!18434 a!2986) j!136) index!984))))

(declare-fun b!644730 () Bool)

(declare-fun Unit!21856 () Unit!21854)

(assert (=> b!644730 (= e!369433 Unit!21856)))

(declare-fun b!644731 () Bool)

(declare-fun Unit!21857 () Unit!21854)

(assert (=> b!644731 (= e!369433 Unit!21857)))

(declare-fun lt!298757 () Unit!21854)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38445 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21854)

(assert (=> b!644731 (= lt!298757 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298761 (select (arr!18434 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!644731 (arrayContainsKey!0 lt!298761 (select (arr!18434 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298767 () Unit!21854)

(declare-datatypes ((List!12514 0))(
  ( (Nil!12511) (Cons!12510 (h!13555 (_ BitVec 64)) (t!18733 List!12514)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38445 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12514) Unit!21854)

(assert (=> b!644731 (= lt!298767 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12511))))

(declare-fun arrayNoDuplicates!0 (array!38445 (_ BitVec 32) List!12514) Bool)

(assert (=> b!644731 (arrayNoDuplicates!0 lt!298761 #b00000000000000000000000000000000 Nil!12511)))

(declare-fun lt!298758 () Unit!21854)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38445 (_ BitVec 32) (_ BitVec 32)) Unit!21854)

(assert (=> b!644731 (= lt!298758 (lemmaNoDuplicateFromThenFromBigger!0 lt!298761 #b00000000000000000000000000000000 j!136))))

(assert (=> b!644731 (arrayNoDuplicates!0 lt!298761 j!136 Nil!12511)))

(declare-fun lt!298766 () Unit!21854)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38445 (_ BitVec 64) (_ BitVec 32) List!12514) Unit!21854)

(assert (=> b!644731 (= lt!298766 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298761 (select (arr!18434 a!2986) j!136) j!136 Nil!12511))))

(assert (=> b!644731 false))

(declare-fun b!644732 () Bool)

(declare-fun e!369432 () Bool)

(assert (=> b!644732 (= e!369432 e!369434)))

(declare-fun res!417717 () Bool)

(assert (=> b!644732 (=> (not res!417717) (not e!369434))))

(declare-fun lt!298764 () SeekEntryResult!6871)

(assert (=> b!644732 (= res!417717 (and (= lt!298764 (Found!6871 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18434 a!2986) index!984) (select (arr!18434 a!2986) j!136))) (not (= (select (arr!18434 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!644732 (= lt!298764 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18434 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!644733 () Bool)

(assert (=> b!644733 (= e!369423 e!369432)))

(declare-fun res!417710 () Bool)

(assert (=> b!644733 (=> (not res!417710) (not e!369432))))

(assert (=> b!644733 (= res!417710 (= (select (store (arr!18434 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!644733 (= lt!298761 (array!38446 (store (arr!18434 a!2986) i!1108 k0!1786) (size!18799 a!2986)))))

(declare-fun b!644734 () Bool)

(declare-fun e!369424 () Bool)

(assert (=> b!644734 (= e!369424 e!369430)))

(declare-fun res!417718 () Bool)

(assert (=> b!644734 (=> (not res!417718) (not e!369430))))

(assert (=> b!644734 (= res!417718 (arrayContainsKey!0 lt!298761 (select (arr!18434 a!2986) j!136) j!136))))

(declare-fun b!644735 () Bool)

(assert (=> b!644735 (= e!369429 e!369431)))

(declare-fun res!417714 () Bool)

(assert (=> b!644735 (=> res!417714 e!369431)))

(declare-fun lt!298756 () (_ BitVec 64))

(assert (=> b!644735 (= res!417714 (or (not (= (select (arr!18434 a!2986) j!136) lt!298762)) (not (= (select (arr!18434 a!2986) j!136) lt!298756))))))

(declare-fun e!369428 () Bool)

(assert (=> b!644735 e!369428))

(declare-fun res!417715 () Bool)

(assert (=> b!644735 (=> (not res!417715) (not e!369428))))

(assert (=> b!644735 (= res!417715 (= lt!298756 (select (arr!18434 a!2986) j!136)))))

(assert (=> b!644735 (= lt!298756 (select (store (arr!18434 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!644736 () Bool)

(declare-fun Unit!21858 () Unit!21854)

(assert (=> b!644736 (= e!369425 Unit!21858)))

(declare-fun b!644737 () Bool)

(declare-fun e!369426 () Bool)

(assert (=> b!644737 (= e!369426 (arrayContainsKey!0 lt!298761 (select (arr!18434 a!2986) j!136) index!984))))

(declare-fun b!644738 () Bool)

(declare-fun res!417705 () Bool)

(assert (=> b!644738 (=> (not res!417705) (not e!369423))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38445 (_ BitVec 32)) Bool)

(assert (=> b!644738 (= res!417705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!644740 () Bool)

(declare-fun res!417716 () Bool)

(assert (=> b!644740 (=> (not res!417716) (not e!369435))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!644740 (= res!417716 (validKeyInArray!0 (select (arr!18434 a!2986) j!136)))))

(declare-fun b!644741 () Bool)

(declare-fun Unit!21859 () Unit!21854)

(assert (=> b!644741 (= e!369425 Unit!21859)))

(assert (=> b!644741 false))

(declare-fun b!644742 () Bool)

(declare-fun res!417706 () Bool)

(assert (=> b!644742 (=> (not res!417706) (not e!369435))))

(assert (=> b!644742 (= res!417706 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!644743 () Bool)

(assert (=> b!644743 (= e!369428 e!369424)))

(declare-fun res!417711 () Bool)

(assert (=> b!644743 (=> res!417711 e!369424)))

(assert (=> b!644743 (= res!417711 (or (not (= (select (arr!18434 a!2986) j!136) lt!298762)) (not (= (select (arr!18434 a!2986) j!136) lt!298756)) (bvsge j!136 index!984)))))

(declare-fun b!644744 () Bool)

(declare-fun res!417712 () Bool)

(assert (=> b!644744 (=> (not res!417712) (not e!369435))))

(assert (=> b!644744 (= res!417712 (validKeyInArray!0 k0!1786))))

(declare-fun b!644745 () Bool)

(assert (=> b!644745 (= e!369436 true)))

(assert (=> b!644745 e!369426))

(declare-fun res!417704 () Bool)

(assert (=> b!644745 (=> (not res!417704) (not e!369426))))

(assert (=> b!644745 (= res!417704 (arrayContainsKey!0 lt!298761 (select (arr!18434 a!2986) j!136) j!136))))

(declare-fun b!644746 () Bool)

(declare-fun res!417707 () Bool)

(assert (=> b!644746 (=> (not res!417707) (not e!369435))))

(assert (=> b!644746 (= res!417707 (and (= (size!18799 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18799 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18799 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!644747 () Bool)

(declare-fun res!417701 () Bool)

(assert (=> b!644747 (=> (not res!417701) (not e!369423))))

(assert (=> b!644747 (= res!417701 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18434 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!644748 () Bool)

(declare-fun res!417702 () Bool)

(assert (=> b!644748 (=> (not res!417702) (not e!369423))))

(assert (=> b!644748 (= res!417702 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12511))))

(declare-fun res!417709 () Bool)

(assert (=> start!58418 (=> (not res!417709) (not e!369435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58418 (= res!417709 (validMask!0 mask!3053))))

(assert (=> start!58418 e!369435))

(assert (=> start!58418 true))

(declare-fun array_inv!14317 (array!38445) Bool)

(assert (=> start!58418 (array_inv!14317 a!2986)))

(declare-fun b!644739 () Bool)

(assert (=> b!644739 (= e!369437 (= lt!298764 lt!298770))))

(assert (= (and start!58418 res!417709) b!644746))

(assert (= (and b!644746 res!417707) b!644740))

(assert (= (and b!644740 res!417716) b!644744))

(assert (= (and b!644744 res!417712) b!644742))

(assert (= (and b!644742 res!417706) b!644727))

(assert (= (and b!644727 res!417708) b!644738))

(assert (= (and b!644738 res!417705) b!644748))

(assert (= (and b!644748 res!417702) b!644747))

(assert (= (and b!644747 res!417701) b!644733))

(assert (= (and b!644733 res!417710) b!644732))

(assert (= (and b!644732 res!417717) b!644728))

(assert (= (and b!644728 res!417713) b!644739))

(assert (= (and b!644728 c!73880) b!644741))

(assert (= (and b!644728 (not c!73880)) b!644736))

(assert (= (and b!644728 (not res!417703)) b!644735))

(assert (= (and b!644735 res!417715) b!644743))

(assert (= (and b!644743 (not res!417711)) b!644734))

(assert (= (and b!644734 res!417718) b!644729))

(assert (= (and b!644735 (not res!417714)) b!644726))

(assert (= (and b!644726 c!73881) b!644731))

(assert (= (and b!644726 (not c!73881)) b!644730))

(assert (= (and b!644726 (not res!417700)) b!644745))

(assert (= (and b!644745 res!417704) b!644737))

(declare-fun m!617799 () Bool)

(assert (=> b!644744 m!617799))

(declare-fun m!617801 () Bool)

(assert (=> start!58418 m!617801))

(declare-fun m!617803 () Bool)

(assert (=> start!58418 m!617803))

(declare-fun m!617805 () Bool)

(assert (=> b!644745 m!617805))

(assert (=> b!644745 m!617805))

(declare-fun m!617807 () Bool)

(assert (=> b!644745 m!617807))

(declare-fun m!617809 () Bool)

(assert (=> b!644733 m!617809))

(declare-fun m!617811 () Bool)

(assert (=> b!644733 m!617811))

(assert (=> b!644729 m!617805))

(assert (=> b!644729 m!617805))

(declare-fun m!617813 () Bool)

(assert (=> b!644729 m!617813))

(assert (=> b!644737 m!617805))

(assert (=> b!644737 m!617805))

(assert (=> b!644737 m!617813))

(declare-fun m!617815 () Bool)

(assert (=> b!644727 m!617815))

(declare-fun m!617817 () Bool)

(assert (=> b!644748 m!617817))

(assert (=> b!644735 m!617805))

(assert (=> b!644735 m!617809))

(declare-fun m!617819 () Bool)

(assert (=> b!644735 m!617819))

(declare-fun m!617821 () Bool)

(assert (=> b!644742 m!617821))

(declare-fun m!617823 () Bool)

(assert (=> b!644738 m!617823))

(assert (=> b!644731 m!617805))

(declare-fun m!617825 () Bool)

(assert (=> b!644731 m!617825))

(assert (=> b!644731 m!617805))

(declare-fun m!617827 () Bool)

(assert (=> b!644731 m!617827))

(assert (=> b!644731 m!617805))

(declare-fun m!617829 () Bool)

(assert (=> b!644731 m!617829))

(declare-fun m!617831 () Bool)

(assert (=> b!644731 m!617831))

(assert (=> b!644731 m!617805))

(declare-fun m!617833 () Bool)

(assert (=> b!644731 m!617833))

(declare-fun m!617835 () Bool)

(assert (=> b!644731 m!617835))

(declare-fun m!617837 () Bool)

(assert (=> b!644731 m!617837))

(declare-fun m!617839 () Bool)

(assert (=> b!644747 m!617839))

(assert (=> b!644740 m!617805))

(assert (=> b!644740 m!617805))

(declare-fun m!617841 () Bool)

(assert (=> b!644740 m!617841))

(assert (=> b!644728 m!617805))

(declare-fun m!617843 () Bool)

(assert (=> b!644728 m!617843))

(assert (=> b!644728 m!617809))

(declare-fun m!617845 () Bool)

(assert (=> b!644728 m!617845))

(declare-fun m!617847 () Bool)

(assert (=> b!644728 m!617847))

(declare-fun m!617849 () Bool)

(assert (=> b!644728 m!617849))

(declare-fun m!617851 () Bool)

(assert (=> b!644728 m!617851))

(assert (=> b!644728 m!617805))

(declare-fun m!617853 () Bool)

(assert (=> b!644728 m!617853))

(declare-fun m!617855 () Bool)

(assert (=> b!644732 m!617855))

(assert (=> b!644732 m!617805))

(assert (=> b!644732 m!617805))

(declare-fun m!617857 () Bool)

(assert (=> b!644732 m!617857))

(assert (=> b!644734 m!617805))

(assert (=> b!644734 m!617805))

(assert (=> b!644734 m!617807))

(assert (=> b!644743 m!617805))

(check-sat (not b!644748) (not b!644734) (not b!644729) (not b!644731) (not b!644742) (not b!644737) (not start!58418) (not b!644732) (not b!644727) (not b!644740) (not b!644728) (not b!644738) (not b!644745) (not b!644744))
(check-sat)
