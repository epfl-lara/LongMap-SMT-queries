; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48942 () Bool)

(assert start!48942)

(declare-fun b!539548 () Bool)

(declare-fun res!334762 () Bool)

(declare-fun e!312708 () Bool)

(assert (=> b!539548 (=> (not res!334762) (not e!312708))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34154 0))(
  ( (array!34155 (arr!16416 (Array (_ BitVec 32) (_ BitVec 64))) (size!16780 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34154)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539548 (= res!334762 (and (= (size!16780 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16780 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16780 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539549 () Bool)

(declare-fun res!334758 () Bool)

(declare-fun e!312707 () Bool)

(assert (=> b!539549 (=> (not res!334758) (not e!312707))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!539549 (= res!334758 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16780 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16780 a!3154)) (= (select (arr!16416 a!3154) resIndex!32) (select (arr!16416 a!3154) j!147))))))

(declare-fun b!539550 () Bool)

(declare-fun res!334754 () Bool)

(assert (=> b!539550 (=> (not res!334754) (not e!312708))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539550 (= res!334754 (validKeyInArray!0 k!1998))))

(declare-fun b!539551 () Bool)

(declare-fun res!334761 () Bool)

(declare-fun e!312705 () Bool)

(assert (=> b!539551 (=> (not res!334761) (not e!312705))))

(declare-datatypes ((SeekEntryResult!4874 0))(
  ( (MissingZero!4874 (index!21720 (_ BitVec 32))) (Found!4874 (index!21721 (_ BitVec 32))) (Intermediate!4874 (undefined!5686 Bool) (index!21722 (_ BitVec 32)) (x!50633 (_ BitVec 32))) (Undefined!4874) (MissingVacant!4874 (index!21723 (_ BitVec 32))) )
))
(declare-fun lt!247159 () SeekEntryResult!4874)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34154 (_ BitVec 32)) SeekEntryResult!4874)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539551 (= res!334761 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16416 a!3154) j!147) mask!3216) (select (arr!16416 a!3154) j!147) a!3154 mask!3216) lt!247159))))

(declare-fun b!539552 () Bool)

(declare-fun res!334756 () Bool)

(assert (=> b!539552 (=> (not res!334756) (not e!312707))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34154 (_ BitVec 32)) Bool)

(assert (=> b!539552 (= res!334756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!334753 () Bool)

(assert (=> start!48942 (=> (not res!334753) (not e!312708))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48942 (= res!334753 (validMask!0 mask!3216))))

(assert (=> start!48942 e!312708))

(assert (=> start!48942 true))

(declare-fun array_inv!12212 (array!34154) Bool)

(assert (=> start!48942 (array_inv!12212 a!3154)))

(declare-fun b!539553 () Bool)

(declare-fun res!334755 () Bool)

(assert (=> b!539553 (=> (not res!334755) (not e!312707))))

(declare-datatypes ((List!10535 0))(
  ( (Nil!10532) (Cons!10531 (h!11474 (_ BitVec 64)) (t!16763 List!10535)) )
))
(declare-fun arrayNoDuplicates!0 (array!34154 (_ BitVec 32) List!10535) Bool)

(assert (=> b!539553 (= res!334755 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10532))))

(declare-fun b!539554 () Bool)

(assert (=> b!539554 (= e!312708 e!312707)))

(declare-fun res!334757 () Bool)

(assert (=> b!539554 (=> (not res!334757) (not e!312707))))

(declare-fun lt!247158 () SeekEntryResult!4874)

(assert (=> b!539554 (= res!334757 (or (= lt!247158 (MissingZero!4874 i!1153)) (= lt!247158 (MissingVacant!4874 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34154 (_ BitVec 32)) SeekEntryResult!4874)

(assert (=> b!539554 (= lt!247158 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!539555 () Bool)

(declare-fun res!334763 () Bool)

(assert (=> b!539555 (=> (not res!334763) (not e!312708))))

(assert (=> b!539555 (= res!334763 (validKeyInArray!0 (select (arr!16416 a!3154) j!147)))))

(declare-fun b!539556 () Bool)

(declare-fun res!334760 () Bool)

(assert (=> b!539556 (=> (not res!334760) (not e!312708))))

(declare-fun arrayContainsKey!0 (array!34154 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539556 (= res!334760 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539557 () Bool)

(assert (=> b!539557 (= e!312707 e!312705)))

(declare-fun res!334759 () Bool)

(assert (=> b!539557 (=> (not res!334759) (not e!312705))))

(assert (=> b!539557 (= res!334759 (= lt!247159 (Intermediate!4874 false resIndex!32 resX!32)))))

(assert (=> b!539557 (= lt!247159 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16416 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539558 () Bool)

(assert (=> b!539558 (= e!312705 (= (select (arr!16416 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!48942 res!334753) b!539548))

(assert (= (and b!539548 res!334762) b!539555))

(assert (= (and b!539555 res!334763) b!539550))

(assert (= (and b!539550 res!334754) b!539556))

(assert (= (and b!539556 res!334760) b!539554))

(assert (= (and b!539554 res!334757) b!539552))

(assert (= (and b!539552 res!334756) b!539553))

(assert (= (and b!539553 res!334755) b!539549))

(assert (= (and b!539549 res!334758) b!539557))

(assert (= (and b!539557 res!334759) b!539551))

(assert (= (and b!539551 res!334761) b!539558))

(declare-fun m!518553 () Bool)

(assert (=> b!539550 m!518553))

(declare-fun m!518555 () Bool)

(assert (=> b!539553 m!518555))

(declare-fun m!518557 () Bool)

(assert (=> b!539554 m!518557))

(declare-fun m!518559 () Bool)

(assert (=> b!539551 m!518559))

(assert (=> b!539551 m!518559))

(declare-fun m!518561 () Bool)

(assert (=> b!539551 m!518561))

(assert (=> b!539551 m!518561))

(assert (=> b!539551 m!518559))

(declare-fun m!518563 () Bool)

(assert (=> b!539551 m!518563))

(declare-fun m!518565 () Bool)

(assert (=> start!48942 m!518565))

(declare-fun m!518567 () Bool)

(assert (=> start!48942 m!518567))

(declare-fun m!518569 () Bool)

(assert (=> b!539552 m!518569))

(declare-fun m!518571 () Bool)

(assert (=> b!539558 m!518571))

(declare-fun m!518573 () Bool)

(assert (=> b!539556 m!518573))

(assert (=> b!539555 m!518559))

(assert (=> b!539555 m!518559))

(declare-fun m!518575 () Bool)

(assert (=> b!539555 m!518575))

(declare-fun m!518577 () Bool)

(assert (=> b!539549 m!518577))

(assert (=> b!539549 m!518559))

(assert (=> b!539557 m!518559))

(assert (=> b!539557 m!518559))

(declare-fun m!518579 () Bool)

(assert (=> b!539557 m!518579))

(push 1)

(assert (not b!539551))

(assert (not b!539554))

(assert (not b!539555))

(assert (not b!539556))

(assert (not b!539553))

(assert (not start!48942))

(assert (not b!539550))

(assert (not b!539557))

(assert (not b!539552))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81591 () Bool)

(declare-fun e!312774 () Bool)

(assert (=> d!81591 e!312774))

(declare-fun c!62729 () Bool)

(declare-fun lt!247189 () SeekEntryResult!4874)

(assert (=> d!81591 (= c!62729 (and (is-Intermediate!4874 lt!247189) (undefined!5686 lt!247189)))))

(declare-fun e!312772 () SeekEntryResult!4874)

(assert (=> d!81591 (= lt!247189 e!312772)))

(declare-fun c!62727 () Bool)

(assert (=> d!81591 (= c!62727 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!247188 () (_ BitVec 64))

(assert (=> d!81591 (= lt!247188 (select (arr!16416 a!3154) index!1177))))

(assert (=> d!81591 (validMask!0 mask!3216)))

(assert (=> d!81591 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16416 a!3154) j!147) a!3154 mask!3216) lt!247189)))

(declare-fun b!539685 () Bool)

(declare-fun e!312773 () SeekEntryResult!4874)

(assert (=> b!539685 (= e!312773 (Intermediate!4874 false index!1177 x!1030))))

(declare-fun b!539686 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539686 (= e!312773 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16416 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539687 () Bool)

(declare-fun e!312771 () Bool)

(assert (=> b!539687 (= e!312774 e!312771)))

(declare-fun res!334855 () Bool)

(assert (=> b!539687 (= res!334855 (and (is-Intermediate!4874 lt!247189) (not (undefined!5686 lt!247189)) (bvslt (x!50633 lt!247189) #b01111111111111111111111111111110) (bvsge (x!50633 lt!247189) #b00000000000000000000000000000000) (bvsge (x!50633 lt!247189) x!1030)))))

(assert (=> b!539687 (=> (not res!334855) (not e!312771))))

(declare-fun b!539688 () Bool)

(assert (=> b!539688 (= e!312772 e!312773)))

(declare-fun c!62728 () Bool)

(assert (=> b!539688 (= c!62728 (or (= lt!247188 (select (arr!16416 a!3154) j!147)) (= (bvadd lt!247188 lt!247188) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!539689 () Bool)

(assert (=> b!539689 (= e!312772 (Intermediate!4874 true index!1177 x!1030))))

(declare-fun b!539690 () Bool)

(assert (=> b!539690 (and (bvsge (index!21722 lt!247189) #b00000000000000000000000000000000) (bvslt (index!21722 lt!247189) (size!16780 a!3154)))))

(declare-fun e!312770 () Bool)

(assert (=> b!539690 (= e!312770 (= (select (arr!16416 a!3154) (index!21722 lt!247189)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!539691 () Bool)

(assert (=> b!539691 (and (bvsge (index!21722 lt!247189) #b00000000000000000000000000000000) (bvslt (index!21722 lt!247189) (size!16780 a!3154)))))

(declare-fun res!334857 () Bool)

(assert (=> b!539691 (= res!334857 (= (select (arr!16416 a!3154) (index!21722 lt!247189)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!539691 (=> res!334857 e!312770)))

(declare-fun b!539692 () Bool)

(assert (=> b!539692 (and (bvsge (index!21722 lt!247189) #b00000000000000000000000000000000) (bvslt (index!21722 lt!247189) (size!16780 a!3154)))))

(declare-fun res!334856 () Bool)

(assert (=> b!539692 (= res!334856 (= (select (arr!16416 a!3154) (index!21722 lt!247189)) (select (arr!16416 a!3154) j!147)))))

(assert (=> b!539692 (=> res!334856 e!312770)))

(assert (=> b!539692 (= e!312771 e!312770)))

(declare-fun b!539693 () Bool)

(assert (=> b!539693 (= e!312774 (bvsge (x!50633 lt!247189) #b01111111111111111111111111111110))))

(assert (= (and d!81591 c!62727) b!539689))

(assert (= (and d!81591 (not c!62727)) b!539688))

(assert (= (and b!539688 c!62728) b!539685))

(assert (= (and b!539688 (not c!62728)) b!539686))

(assert (= (and d!81591 c!62729) b!539693))

(assert (= (and d!81591 (not c!62729)) b!539687))

(assert (= (and b!539687 res!334855) b!539692))

(assert (= (and b!539692 (not res!334856)) b!539691))

(assert (= (and b!539691 (not res!334857)) b!539690))

(assert (=> d!81591 m!518571))

(assert (=> d!81591 m!518565))

(declare-fun m!518653 () Bool)

(assert (=> b!539686 m!518653))

(assert (=> b!539686 m!518653))

(assert (=> b!539686 m!518559))

(declare-fun m!518655 () Bool)

(assert (=> b!539686 m!518655))

(declare-fun m!518657 () Bool)

(assert (=> b!539692 m!518657))

(assert (=> b!539690 m!518657))

(assert (=> b!539691 m!518657))

(assert (=> b!539557 d!81591))

(declare-fun b!539715 () Bool)

(declare-fun e!312788 () Bool)

(declare-fun call!32003 () Bool)

(assert (=> b!539715 (= e!312788 call!32003)))

(declare-fun bm!32000 () Bool)

(assert (=> bm!32000 (= call!32003 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!539716 () Bool)

(declare-fun e!312787 () Bool)

(assert (=> b!539716 (= e!312787 e!312788)))

(declare-fun lt!247204 () (_ BitVec 64))

(assert (=> b!539716 (= lt!247204 (select (arr!16416 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16884 0))(
  ( (Unit!16885) )
))
(declare-fun lt!247203 () Unit!16884)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34154 (_ BitVec 64) (_ BitVec 32)) Unit!16884)

(assert (=> b!539716 (= lt!247203 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!247204 #b00000000000000000000000000000000))))

(assert (=> b!539716 (arrayContainsKey!0 a!3154 lt!247204 #b00000000000000000000000000000000)))

(declare-fun lt!247202 () Unit!16884)

(assert (=> b!539716 (= lt!247202 lt!247203)))

(declare-fun res!334862 () Bool)

(assert (=> b!539716 (= res!334862 (= (seekEntryOrOpen!0 (select (arr!16416 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4874 #b00000000000000000000000000000000)))))

(assert (=> b!539716 (=> (not res!334862) (not e!312788))))

(declare-fun b!539717 () Bool)

(assert (=> b!539717 (= e!312787 call!32003)))

(declare-fun b!539714 () Bool)

(declare-fun e!312789 () Bool)

(assert (=> b!539714 (= e!312789 e!312787)))

(declare-fun c!62738 () Bool)

(assert (=> b!539714 (= c!62738 (validKeyInArray!0 (select (arr!16416 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!81607 () Bool)

(declare-fun res!334863 () Bool)

(assert (=> d!81607 (=> res!334863 e!312789)))

(assert (=> d!81607 (= res!334863 (bvsge #b00000000000000000000000000000000 (size!16780 a!3154)))))

(assert (=> d!81607 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!312789)))

(assert (= (and d!81607 (not res!334863)) b!539714))

(assert (= (and b!539714 c!62738) b!539716))

(assert (= (and b!539714 (not c!62738)) b!539717))

(assert (= (and b!539716 res!334862) b!539715))

(assert (= (or b!539715 b!539717) bm!32000))

(declare-fun m!518659 () Bool)

(assert (=> bm!32000 m!518659))

(declare-fun m!518661 () Bool)

(assert (=> b!539716 m!518661))

(declare-fun m!518663 () Bool)

(assert (=> b!539716 m!518663))

(declare-fun m!518665 () Bool)

(assert (=> b!539716 m!518665))

(assert (=> b!539716 m!518661))

(declare-fun m!518667 () Bool)

(assert (=> b!539716 m!518667))

(assert (=> b!539714 m!518661))

(assert (=> b!539714 m!518661))

(declare-fun m!518669 () Bool)

(assert (=> b!539714 m!518669))

(assert (=> b!539552 d!81607))

(declare-fun d!81609 () Bool)

(assert (=> d!81609 (= (validKeyInArray!0 k!1998) (and (not (= k!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!539550 d!81609))

(declare-fun d!81613 () Bool)

(declare-fun res!334868 () Bool)

(declare-fun e!312797 () Bool)

(assert (=> d!81613 (=> res!334868 e!312797)))

(assert (=> d!81613 (= res!334868 (= (select (arr!16416 a!3154) #b00000000000000000000000000000000) k!1998))))

(assert (=> d!81613 (= (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000) e!312797)))

(declare-fun b!539728 () Bool)

(declare-fun e!312798 () Bool)

(assert (=> b!539728 (= e!312797 e!312798)))

(declare-fun res!334869 () Bool)

(assert (=> b!539728 (=> (not res!334869) (not e!312798))))

(assert (=> b!539728 (= res!334869 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16780 a!3154)))))

(declare-fun b!539729 () Bool)

(assert (=> b!539729 (= e!312798 (arrayContainsKey!0 a!3154 k!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81613 (not res!334868)) b!539728))

(assert (= (and b!539728 res!334869) b!539729))

(assert (=> d!81613 m!518661))

(declare-fun m!518685 () Bool)

(assert (=> b!539729 m!518685))

(assert (=> b!539556 d!81613))

(declare-fun d!81615 () Bool)

(declare-fun e!312803 () Bool)

(assert (=> d!81615 e!312803))

(declare-fun c!62744 () Bool)

(declare-fun lt!247209 () SeekEntryResult!4874)

(assert (=> d!81615 (= c!62744 (and (is-Intermediate!4874 lt!247209) (undefined!5686 lt!247209)))))

(declare-fun e!312801 () SeekEntryResult!4874)

(assert (=> d!81615 (= lt!247209 e!312801)))

(declare-fun c!62742 () Bool)

(assert (=> d!81615 (= c!62742 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!247208 () (_ BitVec 64))

(assert (=> d!81615 (= lt!247208 (select (arr!16416 a!3154) (toIndex!0 (select (arr!16416 a!3154) j!147) mask!3216)))))

(assert (=> d!81615 (validMask!0 mask!3216)))

(assert (=> d!81615 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16416 a!3154) j!147) mask!3216) (select (arr!16416 a!3154) j!147) a!3154 mask!3216) lt!247209)))

(declare-fun b!539730 () Bool)

(declare-fun e!312802 () SeekEntryResult!4874)

(assert (=> b!539730 (= e!312802 (Intermediate!4874 false (toIndex!0 (select (arr!16416 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!539731 () Bool)

(assert (=> b!539731 (= e!312802 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16416 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16416 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539732 () Bool)

(declare-fun e!312800 () Bool)

(assert (=> b!539732 (= e!312803 e!312800)))

(declare-fun res!334870 () Bool)

(assert (=> b!539732 (= res!334870 (and (is-Intermediate!4874 lt!247209) (not (undefined!5686 lt!247209)) (bvslt (x!50633 lt!247209) #b01111111111111111111111111111110) (bvsge (x!50633 lt!247209) #b00000000000000000000000000000000) (bvsge (x!50633 lt!247209) #b00000000000000000000000000000000)))))

(assert (=> b!539732 (=> (not res!334870) (not e!312800))))

(declare-fun b!539733 () Bool)

(assert (=> b!539733 (= e!312801 e!312802)))

(declare-fun c!62743 () Bool)

(assert (=> b!539733 (= c!62743 (or (= lt!247208 (select (arr!16416 a!3154) j!147)) (= (bvadd lt!247208 lt!247208) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!539734 () Bool)

(assert (=> b!539734 (= e!312801 (Intermediate!4874 true (toIndex!0 (select (arr!16416 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!539735 () Bool)

(assert (=> b!539735 (and (bvsge (index!21722 lt!247209) #b00000000000000000000000000000000) (bvslt (index!21722 lt!247209) (size!16780 a!3154)))))

(declare-fun e!312799 () Bool)

(assert (=> b!539735 (= e!312799 (= (select (arr!16416 a!3154) (index!21722 lt!247209)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!539736 () Bool)

(assert (=> b!539736 (and (bvsge (index!21722 lt!247209) #b00000000000000000000000000000000) (bvslt (index!21722 lt!247209) (size!16780 a!3154)))))

(declare-fun res!334872 () Bool)

(assert (=> b!539736 (= res!334872 (= (select (arr!16416 a!3154) (index!21722 lt!247209)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!539736 (=> res!334872 e!312799)))

(declare-fun b!539737 () Bool)

(assert (=> b!539737 (and (bvsge (index!21722 lt!247209) #b00000000000000000000000000000000) (bvslt (index!21722 lt!247209) (size!16780 a!3154)))))

(declare-fun res!334871 () Bool)

(assert (=> b!539737 (= res!334871 (= (select (arr!16416 a!3154) (index!21722 lt!247209)) (select (arr!16416 a!3154) j!147)))))

(assert (=> b!539737 (=> res!334871 e!312799)))

(assert (=> b!539737 (= e!312800 e!312799)))

(declare-fun b!539738 () Bool)

(assert (=> b!539738 (= e!312803 (bvsge (x!50633 lt!247209) #b01111111111111111111111111111110))))

(assert (= (and d!81615 c!62742) b!539734))

(assert (= (and d!81615 (not c!62742)) b!539733))

(assert (= (and b!539733 c!62743) b!539730))

(assert (= (and b!539733 (not c!62743)) b!539731))

(assert (= (and d!81615 c!62744) b!539738))

(assert (= (and d!81615 (not c!62744)) b!539732))

(assert (= (and b!539732 res!334870) b!539737))

(assert (= (and b!539737 (not res!334871)) b!539736))

(assert (= (and b!539736 (not res!334872)) b!539735))

(assert (=> d!81615 m!518561))

(declare-fun m!518687 () Bool)

(assert (=> d!81615 m!518687))

(assert (=> d!81615 m!518565))

(assert (=> b!539731 m!518561))

(declare-fun m!518689 () Bool)

(assert (=> b!539731 m!518689))

(assert (=> b!539731 m!518689))

(assert (=> b!539731 m!518559))

(declare-fun m!518691 () Bool)

(assert (=> b!539731 m!518691))

(declare-fun m!518693 () Bool)

(assert (=> b!539737 m!518693))

(assert (=> b!539735 m!518693))

(assert (=> b!539736 m!518693))

(assert (=> b!539551 d!81615))

(declare-fun d!81617 () Bool)

(declare-fun lt!247233 () (_ BitVec 32))

(declare-fun lt!247232 () (_ BitVec 32))

(assert (=> d!81617 (= lt!247233 (bvmul (bvxor lt!247232 (bvlshr lt!247232 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81617 (= lt!247232 ((_ extract 31 0) (bvand (bvxor (select (arr!16416 a!3154) j!147) (bvlshr (select (arr!16416 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81617 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!334873 (let ((h!11478 ((_ extract 31 0) (bvand (bvxor (select (arr!16416 a!3154) j!147) (bvlshr (select (arr!16416 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!50639 (bvmul (bvxor h!11478 (bvlshr h!11478 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!50639 (bvlshr x!50639 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!334873 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!334873 #b00000000000000000000000000000000))))))

(assert (=> d!81617 (= (toIndex!0 (select (arr!16416 a!3154) j!147) mask!3216) (bvand (bvxor lt!247233 (bvlshr lt!247233 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!539551 d!81617))

(declare-fun b!539825 () Bool)

(declare-fun e!312865 () SeekEntryResult!4874)

(declare-fun lt!247250 () SeekEntryResult!4874)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34154 (_ BitVec 32)) SeekEntryResult!4874)

(assert (=> b!539825 (= e!312865 (seekKeyOrZeroReturnVacant!0 (x!50633 lt!247250) (index!21722 lt!247250) (index!21722 lt!247250) k!1998 a!3154 mask!3216))))

(declare-fun d!81619 () Bool)

(declare-fun lt!247248 () SeekEntryResult!4874)

(assert (=> d!81619 (and (or (is-Undefined!4874 lt!247248) (not (is-Found!4874 lt!247248)) (and (bvsge (index!21721 lt!247248) #b00000000000000000000000000000000) (bvslt (index!21721 lt!247248) (size!16780 a!3154)))) (or (is-Undefined!4874 lt!247248) (is-Found!4874 lt!247248) (not (is-MissingZero!4874 lt!247248)) (and (bvsge (index!21720 lt!247248) #b00000000000000000000000000000000) (bvslt (index!21720 lt!247248) (size!16780 a!3154)))) (or (is-Undefined!4874 lt!247248) (is-Found!4874 lt!247248) (is-MissingZero!4874 lt!247248) (not (is-MissingVacant!4874 lt!247248)) (and (bvsge (index!21723 lt!247248) #b00000000000000000000000000000000) (bvslt (index!21723 lt!247248) (size!16780 a!3154)))) (or (is-Undefined!4874 lt!247248) (ite (is-Found!4874 lt!247248) (= (select (arr!16416 a!3154) (index!21721 lt!247248)) k!1998) (ite (is-MissingZero!4874 lt!247248) (= (select (arr!16416 a!3154) (index!21720 lt!247248)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4874 lt!247248) (= (select (arr!16416 a!3154) (index!21723 lt!247248)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!312864 () SeekEntryResult!4874)

(assert (=> d!81619 (= lt!247248 e!312864)))

(declare-fun c!62773 () Bool)

(assert (=> d!81619 (= c!62773 (and (is-Intermediate!4874 lt!247250) (undefined!5686 lt!247250)))))

(assert (=> d!81619 (= lt!247250 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1998 mask!3216) k!1998 a!3154 mask!3216))))

(assert (=> d!81619 (validMask!0 mask!3216)))

(assert (=> d!81619 (= (seekEntryOrOpen!0 k!1998 a!3154 mask!3216) lt!247248)))

(declare-fun b!539826 () Bool)

(declare-fun e!312863 () SeekEntryResult!4874)

(assert (=> b!539826 (= e!312864 e!312863)))

(declare-fun lt!247249 () (_ BitVec 64))

(assert (=> b!539826 (= lt!247249 (select (arr!16416 a!3154) (index!21722 lt!247250)))))

(declare-fun c!62772 () Bool)

(assert (=> b!539826 (= c!62772 (= lt!247249 k!1998))))

(declare-fun b!539827 () Bool)

(assert (=> b!539827 (= e!312864 Undefined!4874)))

(declare-fun b!539828 () Bool)

(declare-fun c!62771 () Bool)

(assert (=> b!539828 (= c!62771 (= lt!247249 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!539828 (= e!312863 e!312865)))

(declare-fun b!539829 () Bool)

(assert (=> b!539829 (= e!312863 (Found!4874 (index!21722 lt!247250)))))

(declare-fun b!539830 () Bool)

(assert (=> b!539830 (= e!312865 (MissingZero!4874 (index!21722 lt!247250)))))

(assert (= (and d!81619 c!62773) b!539827))

(assert (= (and d!81619 (not c!62773)) b!539826))

(assert (= (and b!539826 c!62772) b!539829))

(assert (= (and b!539826 (not c!62772)) b!539828))

(assert (= (and b!539828 c!62771) b!539830))

(assert (= (and b!539828 (not c!62771)) b!539825))

(declare-fun m!518735 () Bool)

(assert (=> b!539825 m!518735))

(declare-fun m!518737 () Bool)

(assert (=> d!81619 m!518737))

(declare-fun m!518739 () Bool)

(assert (=> d!81619 m!518739))

(assert (=> d!81619 m!518739))

(declare-fun m!518741 () Bool)

(assert (=> d!81619 m!518741))

(assert (=> d!81619 m!518565))

(declare-fun m!518743 () Bool)

(assert (=> d!81619 m!518743))

(declare-fun m!518745 () Bool)

(assert (=> d!81619 m!518745))

(declare-fun m!518747 () Bool)

(assert (=> b!539826 m!518747))

(assert (=> b!539554 d!81619))

(declare-fun d!81641 () Bool)

(assert (=> d!81641 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48942 d!81641))

(declare-fun d!81645 () Bool)

(assert (=> d!81645 (= (array_inv!12212 a!3154) (bvsge (size!16780 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48942 d!81645))

(declare-fun d!81647 () Bool)

(assert (=> d!81647 (= (validKeyInArray!0 (select (arr!16416 a!3154) j!147)) (and (not (= (select (arr!16416 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16416 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!539555 d!81647))

(declare-fun d!81649 () Bool)

(declare-fun res!334926 () Bool)

(declare-fun e!312893 () Bool)

(assert (=> d!81649 (=> res!334926 e!312893)))

(assert (=> d!81649 (= res!334926 (bvsge #b00000000000000000000000000000000 (size!16780 a!3154)))))

(assert (=> d!81649 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10532) e!312893)))

(declare-fun b!539872 () Bool)

(declare-fun e!312895 () Bool)

(declare-fun contains!2795 (List!10535 (_ BitVec 64)) Bool)

(assert (=> b!539872 (= e!312895 (contains!2795 Nil!10532 (select (arr!16416 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!539873 () Bool)

(declare-fun e!312894 () Bool)

(declare-fun e!312892 () Bool)

(assert (=> b!539873 (= e!312894 e!312892)))

(declare-fun c!62786 () Bool)

(assert (=> b!539873 (= c!62786 (validKeyInArray!0 (select (arr!16416 a!3154) #b00000000000000000000000000000000)))))

(declare-fun bm!32012 () Bool)

(declare-fun call!32015 () Bool)

(assert (=> bm!32012 (= call!32015 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62786 (Cons!10531 (select (arr!16416 a!3154) #b00000000000000000000000000000000) Nil!10532) Nil!10532)))))

(declare-fun b!539874 () Bool)

(assert (=> b!539874 (= e!312893 e!312894)))

(declare-fun res!334927 () Bool)

(assert (=> b!539874 (=> (not res!334927) (not e!312894))))

(assert (=> b!539874 (= res!334927 (not e!312895))))

(declare-fun res!334928 () Bool)

(assert (=> b!539874 (=> (not res!334928) (not e!312895))))

(assert (=> b!539874 (= res!334928 (validKeyInArray!0 (select (arr!16416 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!539875 () Bool)

(assert (=> b!539875 (= e!312892 call!32015)))

(declare-fun b!539876 () Bool)

(assert (=> b!539876 (= e!312892 call!32015)))

(assert (= (and d!81649 (not res!334926)) b!539874))

(assert (= (and b!539874 res!334928) b!539872))

(assert (= (and b!539874 res!334927) b!539873))

(assert (= (and b!539873 c!62786) b!539875))

(assert (= (and b!539873 (not c!62786)) b!539876))

(assert (= (or b!539875 b!539876) bm!32012))

(assert (=> b!539872 m!518661))

(assert (=> b!539872 m!518661))

(declare-fun m!518765 () Bool)

(assert (=> b!539872 m!518765))

(assert (=> b!539873 m!518661))

(assert (=> b!539873 m!518661))

(assert (=> b!539873 m!518669))

(assert (=> bm!32012 m!518661))

(declare-fun m!518767 () Bool)

(assert (=> bm!32012 m!518767))

(assert (=> b!539874 m!518661))

(assert (=> b!539874 m!518661))

(assert (=> b!539874 m!518669))

(assert (=> b!539553 d!81649))

(push 1)

(assert (not b!539714))

(assert (not b!539686))

(assert (not b!539716))

(assert (not b!539731))

(assert (not d!81619))

(assert (not b!539873))

(assert (not b!539825))

(assert (not d!81615))

(assert (not b!539874))

(assert (not b!539872))

(assert (not b!539729))

(assert (not bm!32000))

(assert (not bm!32012))

(assert (not d!81591))

(check-sat)

