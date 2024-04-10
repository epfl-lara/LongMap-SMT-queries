; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54540 () Bool)

(assert start!54540)

(declare-fun b!595999 () Bool)

(declare-fun res!381837 () Bool)

(declare-fun e!340524 () Bool)

(assert (=> b!595999 (=> (not res!381837) (not e!340524))))

(declare-datatypes ((array!37000 0))(
  ( (array!37001 (arr!17764 (Array (_ BitVec 32) (_ BitVec 64))) (size!18128 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37000)

(declare-datatypes ((List!11805 0))(
  ( (Nil!11802) (Cons!11801 (h!12846 (_ BitVec 64)) (t!18033 List!11805)) )
))
(declare-fun arrayNoDuplicates!0 (array!37000 (_ BitVec 32) List!11805) Bool)

(assert (=> b!595999 (= res!381837 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11802))))

(declare-fun b!596000 () Bool)

(declare-datatypes ((Unit!18734 0))(
  ( (Unit!18735) )
))
(declare-fun e!340527 () Unit!18734)

(declare-fun Unit!18736 () Unit!18734)

(assert (=> b!596000 (= e!340527 Unit!18736)))

(declare-fun b!596001 () Bool)

(declare-fun res!381836 () Bool)

(declare-fun e!340526 () Bool)

(assert (=> b!596001 (=> res!381836 e!340526)))

(declare-fun contains!2940 (List!11805 (_ BitVec 64)) Bool)

(assert (=> b!596001 (= res!381836 (contains!2940 Nil!11802 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!381826 () Bool)

(declare-fun e!340520 () Bool)

(assert (=> start!54540 (=> (not res!381826) (not e!340520))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54540 (= res!381826 (validMask!0 mask!3053))))

(assert (=> start!54540 e!340520))

(assert (=> start!54540 true))

(declare-fun array_inv!13560 (array!37000) Bool)

(assert (=> start!54540 (array_inv!13560 a!2986)))

(declare-fun b!596002 () Bool)

(assert (=> b!596002 (= e!340520 e!340524)))

(declare-fun res!381825 () Bool)

(assert (=> b!596002 (=> (not res!381825) (not e!340524))))

(declare-datatypes ((SeekEntryResult!6204 0))(
  ( (MissingZero!6204 (index!27064 (_ BitVec 32))) (Found!6204 (index!27065 (_ BitVec 32))) (Intermediate!6204 (undefined!7016 Bool) (index!27066 (_ BitVec 32)) (x!55864 (_ BitVec 32))) (Undefined!6204) (MissingVacant!6204 (index!27067 (_ BitVec 32))) )
))
(declare-fun lt!270666 () SeekEntryResult!6204)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!596002 (= res!381825 (or (= lt!270666 (MissingZero!6204 i!1108)) (= lt!270666 (MissingVacant!6204 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37000 (_ BitVec 32)) SeekEntryResult!6204)

(assert (=> b!596002 (= lt!270666 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!596003 () Bool)

(declare-fun e!340529 () Bool)

(declare-fun e!340518 () Bool)

(assert (=> b!596003 (= e!340529 e!340518)))

(declare-fun res!381839 () Bool)

(assert (=> b!596003 (=> res!381839 e!340518)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!270667 () (_ BitVec 64))

(declare-fun lt!270662 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!596003 (= res!381839 (or (not (= (select (arr!17764 a!2986) j!136) lt!270667)) (not (= (select (arr!17764 a!2986) j!136) lt!270662)) (bvsge j!136 index!984)))))

(declare-fun b!596004 () Bool)

(declare-fun res!381834 () Bool)

(assert (=> b!596004 (=> (not res!381834) (not e!340520))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!596004 (= res!381834 (validKeyInArray!0 (select (arr!17764 a!2986) j!136)))))

(declare-fun b!596005 () Bool)

(declare-fun e!340521 () Bool)

(declare-fun lt!270665 () SeekEntryResult!6204)

(declare-fun lt!270668 () SeekEntryResult!6204)

(assert (=> b!596005 (= e!340521 (= lt!270665 lt!270668))))

(declare-fun b!596006 () Bool)

(declare-fun res!381842 () Bool)

(assert (=> b!596006 (=> (not res!381842) (not e!340520))))

(assert (=> b!596006 (= res!381842 (validKeyInArray!0 k0!1786))))

(declare-fun b!596007 () Bool)

(declare-fun res!381832 () Bool)

(assert (=> b!596007 (=> res!381832 e!340526)))

(assert (=> b!596007 (= res!381832 (contains!2940 Nil!11802 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596008 () Bool)

(declare-fun Unit!18737 () Unit!18734)

(assert (=> b!596008 (= e!340527 Unit!18737)))

(assert (=> b!596008 false))

(declare-fun b!596009 () Bool)

(declare-fun res!381827 () Bool)

(assert (=> b!596009 (=> (not res!381827) (not e!340524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37000 (_ BitVec 32)) Bool)

(assert (=> b!596009 (= res!381827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!596010 () Bool)

(declare-fun res!381843 () Bool)

(assert (=> b!596010 (=> (not res!381843) (not e!340520))))

(assert (=> b!596010 (= res!381843 (and (= (size!18128 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18128 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18128 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!596011 () Bool)

(declare-fun e!340530 () Bool)

(declare-fun e!340525 () Bool)

(assert (=> b!596011 (= e!340530 e!340525)))

(declare-fun res!381830 () Bool)

(assert (=> b!596011 (=> (not res!381830) (not e!340525))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!596011 (= res!381830 (and (= lt!270665 (Found!6204 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17764 a!2986) index!984) (select (arr!17764 a!2986) j!136))) (not (= (select (arr!17764 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37000 (_ BitVec 32)) SeekEntryResult!6204)

(assert (=> b!596011 (= lt!270665 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17764 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!596012 () Bool)

(declare-fun res!381840 () Bool)

(assert (=> b!596012 (=> res!381840 e!340526)))

(declare-fun noDuplicate!259 (List!11805) Bool)

(assert (=> b!596012 (= res!381840 (not (noDuplicate!259 Nil!11802)))))

(declare-fun b!596013 () Bool)

(assert (=> b!596013 (= e!340524 e!340530)))

(declare-fun res!381838 () Bool)

(assert (=> b!596013 (=> (not res!381838) (not e!340530))))

(assert (=> b!596013 (= res!381838 (= (select (store (arr!17764 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!270663 () array!37000)

(assert (=> b!596013 (= lt!270663 (array!37001 (store (arr!17764 a!2986) i!1108 k0!1786) (size!18128 a!2986)))))

(declare-fun b!596014 () Bool)

(declare-fun e!340523 () Bool)

(declare-fun e!340519 () Bool)

(assert (=> b!596014 (= e!340523 e!340519)))

(declare-fun res!381831 () Bool)

(assert (=> b!596014 (=> res!381831 e!340519)))

(assert (=> b!596014 (= res!381831 (or (not (= (select (arr!17764 a!2986) j!136) lt!270667)) (not (= (select (arr!17764 a!2986) j!136) lt!270662)) (bvsge j!136 index!984)))))

(assert (=> b!596014 e!340529))

(declare-fun res!381828 () Bool)

(assert (=> b!596014 (=> (not res!381828) (not e!340529))))

(assert (=> b!596014 (= res!381828 (= lt!270662 (select (arr!17764 a!2986) j!136)))))

(assert (=> b!596014 (= lt!270662 (select (store (arr!17764 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!596015 () Bool)

(declare-fun res!381829 () Bool)

(assert (=> b!596015 (=> (not res!381829) (not e!340520))))

(declare-fun arrayContainsKey!0 (array!37000 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!596015 (= res!381829 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!596016 () Bool)

(declare-fun e!340522 () Bool)

(assert (=> b!596016 (= e!340522 (arrayContainsKey!0 lt!270663 (select (arr!17764 a!2986) j!136) index!984))))

(declare-fun b!596017 () Bool)

(declare-fun res!381845 () Bool)

(assert (=> b!596017 (=> (not res!381845) (not e!340524))))

(assert (=> b!596017 (= res!381845 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17764 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!596018 () Bool)

(assert (=> b!596018 (= e!340526 true)))

(declare-fun lt!270672 () Bool)

(assert (=> b!596018 (= lt!270672 (contains!2940 Nil!11802 k0!1786))))

(declare-fun b!596019 () Bool)

(assert (=> b!596019 (= e!340518 e!340522)))

(declare-fun res!381844 () Bool)

(assert (=> b!596019 (=> (not res!381844) (not e!340522))))

(assert (=> b!596019 (= res!381844 (arrayContainsKey!0 lt!270663 (select (arr!17764 a!2986) j!136) j!136))))

(declare-fun b!596020 () Bool)

(assert (=> b!596020 (= e!340519 e!340526)))

(declare-fun res!381833 () Bool)

(assert (=> b!596020 (=> res!381833 e!340526)))

(assert (=> b!596020 (= res!381833 (or (bvsge (size!18128 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18128 a!2986))))))

(assert (=> b!596020 (arrayContainsKey!0 lt!270663 (select (arr!17764 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270669 () Unit!18734)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37000 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18734)

(assert (=> b!596020 (= lt!270669 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270663 (select (arr!17764 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!596021 () Bool)

(assert (=> b!596021 (= e!340525 (not e!340523))))

(declare-fun res!381841 () Bool)

(assert (=> b!596021 (=> res!381841 e!340523)))

(declare-fun lt!270671 () SeekEntryResult!6204)

(assert (=> b!596021 (= res!381841 (not (= lt!270671 (Found!6204 index!984))))))

(declare-fun lt!270664 () Unit!18734)

(assert (=> b!596021 (= lt!270664 e!340527)))

(declare-fun c!67454 () Bool)

(assert (=> b!596021 (= c!67454 (= lt!270671 Undefined!6204))))

(assert (=> b!596021 (= lt!270671 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270667 lt!270663 mask!3053))))

(assert (=> b!596021 e!340521))

(declare-fun res!381835 () Bool)

(assert (=> b!596021 (=> (not res!381835) (not e!340521))))

(declare-fun lt!270670 () (_ BitVec 32))

(assert (=> b!596021 (= res!381835 (= lt!270668 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270670 vacantSpotIndex!68 lt!270667 lt!270663 mask!3053)))))

(assert (=> b!596021 (= lt!270668 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270670 vacantSpotIndex!68 (select (arr!17764 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!596021 (= lt!270667 (select (store (arr!17764 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!270673 () Unit!18734)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37000 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18734)

(assert (=> b!596021 (= lt!270673 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270670 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!596021 (= lt!270670 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!54540 res!381826) b!596010))

(assert (= (and b!596010 res!381843) b!596004))

(assert (= (and b!596004 res!381834) b!596006))

(assert (= (and b!596006 res!381842) b!596015))

(assert (= (and b!596015 res!381829) b!596002))

(assert (= (and b!596002 res!381825) b!596009))

(assert (= (and b!596009 res!381827) b!595999))

(assert (= (and b!595999 res!381837) b!596017))

(assert (= (and b!596017 res!381845) b!596013))

(assert (= (and b!596013 res!381838) b!596011))

(assert (= (and b!596011 res!381830) b!596021))

(assert (= (and b!596021 res!381835) b!596005))

(assert (= (and b!596021 c!67454) b!596008))

(assert (= (and b!596021 (not c!67454)) b!596000))

(assert (= (and b!596021 (not res!381841)) b!596014))

(assert (= (and b!596014 res!381828) b!596003))

(assert (= (and b!596003 (not res!381839)) b!596019))

(assert (= (and b!596019 res!381844) b!596016))

(assert (= (and b!596014 (not res!381831)) b!596020))

(assert (= (and b!596020 (not res!381833)) b!596012))

(assert (= (and b!596012 (not res!381840)) b!596001))

(assert (= (and b!596001 (not res!381836)) b!596007))

(assert (= (and b!596007 (not res!381832)) b!596018))

(declare-fun m!573561 () Bool)

(assert (=> b!596004 m!573561))

(assert (=> b!596004 m!573561))

(declare-fun m!573563 () Bool)

(assert (=> b!596004 m!573563))

(assert (=> b!596014 m!573561))

(declare-fun m!573565 () Bool)

(assert (=> b!596014 m!573565))

(declare-fun m!573567 () Bool)

(assert (=> b!596014 m!573567))

(assert (=> b!596013 m!573565))

(declare-fun m!573569 () Bool)

(assert (=> b!596013 m!573569))

(declare-fun m!573571 () Bool)

(assert (=> b!596017 m!573571))

(declare-fun m!573573 () Bool)

(assert (=> b!596015 m!573573))

(declare-fun m!573575 () Bool)

(assert (=> start!54540 m!573575))

(declare-fun m!573577 () Bool)

(assert (=> start!54540 m!573577))

(declare-fun m!573579 () Bool)

(assert (=> b!596002 m!573579))

(declare-fun m!573581 () Bool)

(assert (=> b!596018 m!573581))

(declare-fun m!573583 () Bool)

(assert (=> b!596012 m!573583))

(assert (=> b!596019 m!573561))

(assert (=> b!596019 m!573561))

(declare-fun m!573585 () Bool)

(assert (=> b!596019 m!573585))

(declare-fun m!573587 () Bool)

(assert (=> b!596021 m!573587))

(declare-fun m!573589 () Bool)

(assert (=> b!596021 m!573589))

(declare-fun m!573591 () Bool)

(assert (=> b!596021 m!573591))

(assert (=> b!596021 m!573561))

(assert (=> b!596021 m!573561))

(declare-fun m!573593 () Bool)

(assert (=> b!596021 m!573593))

(declare-fun m!573595 () Bool)

(assert (=> b!596021 m!573595))

(declare-fun m!573597 () Bool)

(assert (=> b!596021 m!573597))

(assert (=> b!596021 m!573565))

(assert (=> b!596020 m!573561))

(assert (=> b!596020 m!573561))

(declare-fun m!573599 () Bool)

(assert (=> b!596020 m!573599))

(assert (=> b!596020 m!573561))

(declare-fun m!573601 () Bool)

(assert (=> b!596020 m!573601))

(assert (=> b!596016 m!573561))

(assert (=> b!596016 m!573561))

(declare-fun m!573603 () Bool)

(assert (=> b!596016 m!573603))

(declare-fun m!573605 () Bool)

(assert (=> b!595999 m!573605))

(declare-fun m!573607 () Bool)

(assert (=> b!596006 m!573607))

(declare-fun m!573609 () Bool)

(assert (=> b!596007 m!573609))

(declare-fun m!573611 () Bool)

(assert (=> b!596011 m!573611))

(assert (=> b!596011 m!573561))

(assert (=> b!596011 m!573561))

(declare-fun m!573613 () Bool)

(assert (=> b!596011 m!573613))

(assert (=> b!596003 m!573561))

(declare-fun m!573615 () Bool)

(assert (=> b!596009 m!573615))

(declare-fun m!573617 () Bool)

(assert (=> b!596001 m!573617))

(check-sat (not b!596016) (not b!596012) (not b!595999) (not b!596018) (not start!54540) (not b!596004) (not b!596007) (not b!596002) (not b!596009) (not b!596001) (not b!596006) (not b!596019) (not b!596015) (not b!596020) (not b!596021) (not b!596011))
(check-sat)
