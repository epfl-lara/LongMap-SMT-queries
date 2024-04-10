; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48944 () Bool)

(assert start!48944)

(declare-fun b!539582 () Bool)

(declare-fun e!312717 () Bool)

(declare-fun e!312719 () Bool)

(assert (=> b!539582 (= e!312717 e!312719)))

(declare-fun res!334788 () Bool)

(assert (=> b!539582 (=> (not res!334788) (not e!312719))))

(declare-datatypes ((SeekEntryResult!4875 0))(
  ( (MissingZero!4875 (index!21724 (_ BitVec 32))) (Found!4875 (index!21725 (_ BitVec 32))) (Intermediate!4875 (undefined!5687 Bool) (index!21726 (_ BitVec 32)) (x!50634 (_ BitVec 32))) (Undefined!4875) (MissingVacant!4875 (index!21727 (_ BitVec 32))) )
))
(declare-fun lt!247165 () SeekEntryResult!4875)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539582 (= res!334788 (or (= lt!247165 (MissingZero!4875 i!1153)) (= lt!247165 (MissingVacant!4875 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!34156 0))(
  ( (array!34157 (arr!16417 (Array (_ BitVec 32) (_ BitVec 64))) (size!16781 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34156)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34156 (_ BitVec 32)) SeekEntryResult!4875)

(assert (=> b!539582 (= lt!247165 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!539583 () Bool)

(declare-fun res!334791 () Bool)

(assert (=> b!539583 (=> (not res!334791) (not e!312717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539583 (= res!334791 (validKeyInArray!0 k0!1998))))

(declare-fun b!539584 () Bool)

(declare-fun res!334786 () Bool)

(assert (=> b!539584 (=> (not res!334786) (not e!312717))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!539584 (= res!334786 (and (= (size!16781 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16781 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16781 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539585 () Bool)

(declare-fun res!334794 () Bool)

(assert (=> b!539585 (=> (not res!334794) (not e!312719))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34156 (_ BitVec 32)) Bool)

(assert (=> b!539585 (= res!334794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539586 () Bool)

(declare-fun res!334789 () Bool)

(assert (=> b!539586 (=> (not res!334789) (not e!312717))))

(declare-fun arrayContainsKey!0 (array!34156 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539586 (= res!334789 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539587 () Bool)

(declare-fun res!334793 () Bool)

(declare-fun e!312718 () Bool)

(assert (=> b!539587 (=> (not res!334793) (not e!312718))))

(declare-fun lt!247164 () SeekEntryResult!4875)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34156 (_ BitVec 32)) SeekEntryResult!4875)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539587 (= res!334793 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16417 a!3154) j!147) mask!3216) (select (arr!16417 a!3154) j!147) a!3154 mask!3216) lt!247164))))

(declare-fun b!539581 () Bool)

(declare-fun res!334795 () Bool)

(assert (=> b!539581 (=> (not res!334795) (not e!312717))))

(assert (=> b!539581 (= res!334795 (validKeyInArray!0 (select (arr!16417 a!3154) j!147)))))

(declare-fun res!334787 () Bool)

(assert (=> start!48944 (=> (not res!334787) (not e!312717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48944 (= res!334787 (validMask!0 mask!3216))))

(assert (=> start!48944 e!312717))

(assert (=> start!48944 true))

(declare-fun array_inv!12213 (array!34156) Bool)

(assert (=> start!48944 (array_inv!12213 a!3154)))

(declare-fun b!539588 () Bool)

(assert (=> b!539588 (= e!312719 e!312718)))

(declare-fun res!334796 () Bool)

(assert (=> b!539588 (=> (not res!334796) (not e!312718))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!539588 (= res!334796 (= lt!247164 (Intermediate!4875 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!539588 (= lt!247164 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16417 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539589 () Bool)

(declare-fun res!334790 () Bool)

(assert (=> b!539589 (=> (not res!334790) (not e!312719))))

(assert (=> b!539589 (= res!334790 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16781 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16781 a!3154)) (= (select (arr!16417 a!3154) resIndex!32) (select (arr!16417 a!3154) j!147))))))

(declare-fun b!539590 () Bool)

(assert (=> b!539590 (= e!312718 (= (select (arr!16417 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!539591 () Bool)

(declare-fun res!334792 () Bool)

(assert (=> b!539591 (=> (not res!334792) (not e!312719))))

(declare-datatypes ((List!10536 0))(
  ( (Nil!10533) (Cons!10532 (h!11475 (_ BitVec 64)) (t!16764 List!10536)) )
))
(declare-fun arrayNoDuplicates!0 (array!34156 (_ BitVec 32) List!10536) Bool)

(assert (=> b!539591 (= res!334792 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10533))))

(assert (= (and start!48944 res!334787) b!539584))

(assert (= (and b!539584 res!334786) b!539581))

(assert (= (and b!539581 res!334795) b!539583))

(assert (= (and b!539583 res!334791) b!539586))

(assert (= (and b!539586 res!334789) b!539582))

(assert (= (and b!539582 res!334788) b!539585))

(assert (= (and b!539585 res!334794) b!539591))

(assert (= (and b!539591 res!334792) b!539589))

(assert (= (and b!539589 res!334790) b!539588))

(assert (= (and b!539588 res!334796) b!539587))

(assert (= (and b!539587 res!334793) b!539590))

(declare-fun m!518581 () Bool)

(assert (=> b!539582 m!518581))

(declare-fun m!518583 () Bool)

(assert (=> b!539586 m!518583))

(declare-fun m!518585 () Bool)

(assert (=> start!48944 m!518585))

(declare-fun m!518587 () Bool)

(assert (=> start!48944 m!518587))

(declare-fun m!518589 () Bool)

(assert (=> b!539588 m!518589))

(assert (=> b!539588 m!518589))

(declare-fun m!518591 () Bool)

(assert (=> b!539588 m!518591))

(declare-fun m!518593 () Bool)

(assert (=> b!539583 m!518593))

(declare-fun m!518595 () Bool)

(assert (=> b!539591 m!518595))

(assert (=> b!539581 m!518589))

(assert (=> b!539581 m!518589))

(declare-fun m!518597 () Bool)

(assert (=> b!539581 m!518597))

(declare-fun m!518599 () Bool)

(assert (=> b!539590 m!518599))

(assert (=> b!539587 m!518589))

(assert (=> b!539587 m!518589))

(declare-fun m!518601 () Bool)

(assert (=> b!539587 m!518601))

(assert (=> b!539587 m!518601))

(assert (=> b!539587 m!518589))

(declare-fun m!518603 () Bool)

(assert (=> b!539587 m!518603))

(declare-fun m!518605 () Bool)

(assert (=> b!539589 m!518605))

(assert (=> b!539589 m!518589))

(declare-fun m!518607 () Bool)

(assert (=> b!539585 m!518607))

(check-sat (not b!539588) (not b!539586) (not b!539591) (not b!539582) (not b!539583) (not start!48944) (not b!539585) (not b!539581) (not b!539587))
(check-sat)
(get-model)

(declare-fun b!539643 () Bool)

(declare-fun e!312747 () Bool)

(declare-fun lt!247177 () SeekEntryResult!4875)

(assert (=> b!539643 (= e!312747 (bvsge (x!50634 lt!247177) #b01111111111111111111111111111110))))

(declare-fun b!539644 () Bool)

(assert (=> b!539644 (and (bvsge (index!21726 lt!247177) #b00000000000000000000000000000000) (bvslt (index!21726 lt!247177) (size!16781 a!3154)))))

(declare-fun e!312743 () Bool)

(assert (=> b!539644 (= e!312743 (= (select (arr!16417 a!3154) (index!21726 lt!247177)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!539645 () Bool)

(assert (=> b!539645 (and (bvsge (index!21726 lt!247177) #b00000000000000000000000000000000) (bvslt (index!21726 lt!247177) (size!16781 a!3154)))))

(declare-fun res!334838 () Bool)

(assert (=> b!539645 (= res!334838 (= (select (arr!16417 a!3154) (index!21726 lt!247177)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!539645 (=> res!334838 e!312743)))

(declare-fun b!539646 () Bool)

(declare-fun e!312746 () SeekEntryResult!4875)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539646 (= e!312746 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16417 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16417 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539647 () Bool)

(declare-fun e!312745 () Bool)

(assert (=> b!539647 (= e!312747 e!312745)))

(declare-fun res!334836 () Bool)

(get-info :version)

(assert (=> b!539647 (= res!334836 (and ((_ is Intermediate!4875) lt!247177) (not (undefined!5687 lt!247177)) (bvslt (x!50634 lt!247177) #b01111111111111111111111111111110) (bvsge (x!50634 lt!247177) #b00000000000000000000000000000000) (bvsge (x!50634 lt!247177) #b00000000000000000000000000000000)))))

(assert (=> b!539647 (=> (not res!334836) (not e!312745))))

(declare-fun b!539648 () Bool)

(declare-fun e!312744 () SeekEntryResult!4875)

(assert (=> b!539648 (= e!312744 (Intermediate!4875 true (toIndex!0 (select (arr!16417 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!539649 () Bool)

(assert (=> b!539649 (= e!312744 e!312746)))

(declare-fun c!62715 () Bool)

(declare-fun lt!247176 () (_ BitVec 64))

(assert (=> b!539649 (= c!62715 (or (= lt!247176 (select (arr!16417 a!3154) j!147)) (= (bvadd lt!247176 lt!247176) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!81589 () Bool)

(assert (=> d!81589 e!312747))

(declare-fun c!62716 () Bool)

(assert (=> d!81589 (= c!62716 (and ((_ is Intermediate!4875) lt!247177) (undefined!5687 lt!247177)))))

(assert (=> d!81589 (= lt!247177 e!312744)))

(declare-fun c!62717 () Bool)

(assert (=> d!81589 (= c!62717 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!81589 (= lt!247176 (select (arr!16417 a!3154) (toIndex!0 (select (arr!16417 a!3154) j!147) mask!3216)))))

(assert (=> d!81589 (validMask!0 mask!3216)))

(assert (=> d!81589 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16417 a!3154) j!147) mask!3216) (select (arr!16417 a!3154) j!147) a!3154 mask!3216) lt!247177)))

(declare-fun b!539650 () Bool)

(assert (=> b!539650 (= e!312746 (Intermediate!4875 false (toIndex!0 (select (arr!16417 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!539651 () Bool)

(assert (=> b!539651 (and (bvsge (index!21726 lt!247177) #b00000000000000000000000000000000) (bvslt (index!21726 lt!247177) (size!16781 a!3154)))))

(declare-fun res!334837 () Bool)

(assert (=> b!539651 (= res!334837 (= (select (arr!16417 a!3154) (index!21726 lt!247177)) (select (arr!16417 a!3154) j!147)))))

(assert (=> b!539651 (=> res!334837 e!312743)))

(assert (=> b!539651 (= e!312745 e!312743)))

(assert (= (and d!81589 c!62717) b!539648))

(assert (= (and d!81589 (not c!62717)) b!539649))

(assert (= (and b!539649 c!62715) b!539650))

(assert (= (and b!539649 (not c!62715)) b!539646))

(assert (= (and d!81589 c!62716) b!539643))

(assert (= (and d!81589 (not c!62716)) b!539647))

(assert (= (and b!539647 res!334836) b!539651))

(assert (= (and b!539651 (not res!334837)) b!539645))

(assert (= (and b!539645 (not res!334838)) b!539644))

(assert (=> d!81589 m!518601))

(declare-fun m!518637 () Bool)

(assert (=> d!81589 m!518637))

(assert (=> d!81589 m!518585))

(declare-fun m!518639 () Bool)

(assert (=> b!539651 m!518639))

(assert (=> b!539644 m!518639))

(assert (=> b!539645 m!518639))

(assert (=> b!539646 m!518601))

(declare-fun m!518641 () Bool)

(assert (=> b!539646 m!518641))

(assert (=> b!539646 m!518641))

(assert (=> b!539646 m!518589))

(declare-fun m!518643 () Bool)

(assert (=> b!539646 m!518643))

(assert (=> b!539587 d!81589))

(declare-fun d!81595 () Bool)

(declare-fun lt!247183 () (_ BitVec 32))

(declare-fun lt!247182 () (_ BitVec 32))

(assert (=> d!81595 (= lt!247183 (bvmul (bvxor lt!247182 (bvlshr lt!247182 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81595 (= lt!247182 ((_ extract 31 0) (bvand (bvxor (select (arr!16417 a!3154) j!147) (bvlshr (select (arr!16417 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81595 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!334839 (let ((h!11477 ((_ extract 31 0) (bvand (bvxor (select (arr!16417 a!3154) j!147) (bvlshr (select (arr!16417 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!50637 (bvmul (bvxor h!11477 (bvlshr h!11477 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!50637 (bvlshr x!50637 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!334839 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!334839 #b00000000000000000000000000000000))))))

(assert (=> d!81595 (= (toIndex!0 (select (arr!16417 a!3154) j!147) mask!3216) (bvand (bvxor lt!247183 (bvlshr lt!247183 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!539587 d!81595))

(declare-fun d!81597 () Bool)

(assert (=> d!81597 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48944 d!81597))

(declare-fun d!81603 () Bool)

(assert (=> d!81603 (= (array_inv!12213 a!3154) (bvsge (size!16781 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48944 d!81603))

(declare-fun b!539760 () Bool)

(declare-fun e!312818 () SeekEntryResult!4875)

(declare-fun lt!247231 () SeekEntryResult!4875)

(assert (=> b!539760 (= e!312818 (Found!4875 (index!21726 lt!247231)))))

(declare-fun b!539762 () Bool)

(declare-fun e!312817 () SeekEntryResult!4875)

(assert (=> b!539762 (= e!312817 Undefined!4875)))

(declare-fun b!539763 () Bool)

(declare-fun e!312819 () SeekEntryResult!4875)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34156 (_ BitVec 32)) SeekEntryResult!4875)

(assert (=> b!539763 (= e!312819 (seekKeyOrZeroReturnVacant!0 (x!50634 lt!247231) (index!21726 lt!247231) (index!21726 lt!247231) k0!1998 a!3154 mask!3216))))

(declare-fun b!539767 () Bool)

(assert (=> b!539767 (= e!312817 e!312818)))

(declare-fun lt!247228 () (_ BitVec 64))

(assert (=> b!539767 (= lt!247228 (select (arr!16417 a!3154) (index!21726 lt!247231)))))

(declare-fun c!62754 () Bool)

(assert (=> b!539767 (= c!62754 (= lt!247228 k0!1998))))

(declare-fun b!539768 () Bool)

(assert (=> b!539768 (= e!312819 (MissingZero!4875 (index!21726 lt!247231)))))

(declare-fun b!539765 () Bool)

(declare-fun c!62756 () Bool)

(assert (=> b!539765 (= c!62756 (= lt!247228 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!539765 (= e!312818 e!312819)))

(declare-fun d!81605 () Bool)

(declare-fun lt!247227 () SeekEntryResult!4875)

(assert (=> d!81605 (and (or ((_ is Undefined!4875) lt!247227) (not ((_ is Found!4875) lt!247227)) (and (bvsge (index!21725 lt!247227) #b00000000000000000000000000000000) (bvslt (index!21725 lt!247227) (size!16781 a!3154)))) (or ((_ is Undefined!4875) lt!247227) ((_ is Found!4875) lt!247227) (not ((_ is MissingZero!4875) lt!247227)) (and (bvsge (index!21724 lt!247227) #b00000000000000000000000000000000) (bvslt (index!21724 lt!247227) (size!16781 a!3154)))) (or ((_ is Undefined!4875) lt!247227) ((_ is Found!4875) lt!247227) ((_ is MissingZero!4875) lt!247227) (not ((_ is MissingVacant!4875) lt!247227)) (and (bvsge (index!21727 lt!247227) #b00000000000000000000000000000000) (bvslt (index!21727 lt!247227) (size!16781 a!3154)))) (or ((_ is Undefined!4875) lt!247227) (ite ((_ is Found!4875) lt!247227) (= (select (arr!16417 a!3154) (index!21725 lt!247227)) k0!1998) (ite ((_ is MissingZero!4875) lt!247227) (= (select (arr!16417 a!3154) (index!21724 lt!247227)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4875) lt!247227) (= (select (arr!16417 a!3154) (index!21727 lt!247227)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81605 (= lt!247227 e!312817)))

(declare-fun c!62755 () Bool)

(assert (=> d!81605 (= c!62755 (and ((_ is Intermediate!4875) lt!247231) (undefined!5687 lt!247231)))))

(assert (=> d!81605 (= lt!247231 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!81605 (validMask!0 mask!3216)))

(assert (=> d!81605 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!247227)))

(assert (= (and d!81605 c!62755) b!539762))

(assert (= (and d!81605 (not c!62755)) b!539767))

(assert (= (and b!539767 c!62754) b!539760))

(assert (= (and b!539767 (not c!62754)) b!539765))

(assert (= (and b!539765 c!62756) b!539768))

(assert (= (and b!539765 (not c!62756)) b!539763))

(declare-fun m!518699 () Bool)

(assert (=> b!539763 m!518699))

(declare-fun m!518703 () Bool)

(assert (=> b!539767 m!518703))

(assert (=> d!81605 m!518585))

(declare-fun m!518707 () Bool)

(assert (=> d!81605 m!518707))

(declare-fun m!518709 () Bool)

(assert (=> d!81605 m!518709))

(assert (=> d!81605 m!518709))

(declare-fun m!518711 () Bool)

(assert (=> d!81605 m!518711))

(declare-fun m!518713 () Bool)

(assert (=> d!81605 m!518713))

(declare-fun m!518715 () Bool)

(assert (=> d!81605 m!518715))

(assert (=> b!539582 d!81605))

(declare-fun b!539769 () Bool)

(declare-fun e!312826 () Bool)

(declare-fun lt!247235 () SeekEntryResult!4875)

(assert (=> b!539769 (= e!312826 (bvsge (x!50634 lt!247235) #b01111111111111111111111111111110))))

(declare-fun b!539770 () Bool)

(assert (=> b!539770 (and (bvsge (index!21726 lt!247235) #b00000000000000000000000000000000) (bvslt (index!21726 lt!247235) (size!16781 a!3154)))))

(declare-fun e!312822 () Bool)

(assert (=> b!539770 (= e!312822 (= (select (arr!16417 a!3154) (index!21726 lt!247235)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!539771 () Bool)

(assert (=> b!539771 (and (bvsge (index!21726 lt!247235) #b00000000000000000000000000000000) (bvslt (index!21726 lt!247235) (size!16781 a!3154)))))

(declare-fun res!334882 () Bool)

(assert (=> b!539771 (= res!334882 (= (select (arr!16417 a!3154) (index!21726 lt!247235)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!539771 (=> res!334882 e!312822)))

(declare-fun b!539772 () Bool)

(declare-fun e!312825 () SeekEntryResult!4875)

(assert (=> b!539772 (= e!312825 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16417 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539773 () Bool)

(declare-fun e!312824 () Bool)

(assert (=> b!539773 (= e!312826 e!312824)))

(declare-fun res!334880 () Bool)

(assert (=> b!539773 (= res!334880 (and ((_ is Intermediate!4875) lt!247235) (not (undefined!5687 lt!247235)) (bvslt (x!50634 lt!247235) #b01111111111111111111111111111110) (bvsge (x!50634 lt!247235) #b00000000000000000000000000000000) (bvsge (x!50634 lt!247235) x!1030)))))

(assert (=> b!539773 (=> (not res!334880) (not e!312824))))

(declare-fun b!539774 () Bool)

(declare-fun e!312823 () SeekEntryResult!4875)

(assert (=> b!539774 (= e!312823 (Intermediate!4875 true index!1177 x!1030))))

(declare-fun b!539775 () Bool)

(assert (=> b!539775 (= e!312823 e!312825)))

(declare-fun c!62757 () Bool)

(declare-fun lt!247234 () (_ BitVec 64))

(assert (=> b!539775 (= c!62757 (or (= lt!247234 (select (arr!16417 a!3154) j!147)) (= (bvadd lt!247234 lt!247234) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!81623 () Bool)

(assert (=> d!81623 e!312826))

(declare-fun c!62758 () Bool)

(assert (=> d!81623 (= c!62758 (and ((_ is Intermediate!4875) lt!247235) (undefined!5687 lt!247235)))))

(assert (=> d!81623 (= lt!247235 e!312823)))

(declare-fun c!62759 () Bool)

(assert (=> d!81623 (= c!62759 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!81623 (= lt!247234 (select (arr!16417 a!3154) index!1177))))

(assert (=> d!81623 (validMask!0 mask!3216)))

(assert (=> d!81623 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16417 a!3154) j!147) a!3154 mask!3216) lt!247235)))

(declare-fun b!539776 () Bool)

(assert (=> b!539776 (= e!312825 (Intermediate!4875 false index!1177 x!1030))))

(declare-fun b!539777 () Bool)

(assert (=> b!539777 (and (bvsge (index!21726 lt!247235) #b00000000000000000000000000000000) (bvslt (index!21726 lt!247235) (size!16781 a!3154)))))

(declare-fun res!334881 () Bool)

(assert (=> b!539777 (= res!334881 (= (select (arr!16417 a!3154) (index!21726 lt!247235)) (select (arr!16417 a!3154) j!147)))))

(assert (=> b!539777 (=> res!334881 e!312822)))

(assert (=> b!539777 (= e!312824 e!312822)))

(assert (= (and d!81623 c!62759) b!539774))

(assert (= (and d!81623 (not c!62759)) b!539775))

(assert (= (and b!539775 c!62757) b!539776))

(assert (= (and b!539775 (not c!62757)) b!539772))

(assert (= (and d!81623 c!62758) b!539769))

(assert (= (and d!81623 (not c!62758)) b!539773))

(assert (= (and b!539773 res!334880) b!539777))

(assert (= (and b!539777 (not res!334881)) b!539771))

(assert (= (and b!539771 (not res!334882)) b!539770))

(assert (=> d!81623 m!518599))

(assert (=> d!81623 m!518585))

(declare-fun m!518717 () Bool)

(assert (=> b!539777 m!518717))

(assert (=> b!539770 m!518717))

(assert (=> b!539771 m!518717))

(declare-fun m!518719 () Bool)

(assert (=> b!539772 m!518719))

(assert (=> b!539772 m!518719))

(assert (=> b!539772 m!518589))

(declare-fun m!518721 () Bool)

(assert (=> b!539772 m!518721))

(assert (=> b!539588 d!81623))

(declare-fun bm!32006 () Bool)

(declare-fun call!32009 () Bool)

(declare-fun c!62762 () Bool)

(assert (=> bm!32006 (= call!32009 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62762 (Cons!10532 (select (arr!16417 a!3154) #b00000000000000000000000000000000) Nil!10533) Nil!10533)))))

(declare-fun b!539788 () Bool)

(declare-fun e!312837 () Bool)

(declare-fun contains!2794 (List!10536 (_ BitVec 64)) Bool)

(assert (=> b!539788 (= e!312837 (contains!2794 Nil!10533 (select (arr!16417 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!539789 () Bool)

(declare-fun e!312836 () Bool)

(declare-fun e!312835 () Bool)

(assert (=> b!539789 (= e!312836 e!312835)))

(assert (=> b!539789 (= c!62762 (validKeyInArray!0 (select (arr!16417 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!81625 () Bool)

(declare-fun res!334890 () Bool)

(declare-fun e!312838 () Bool)

(assert (=> d!81625 (=> res!334890 e!312838)))

(assert (=> d!81625 (= res!334890 (bvsge #b00000000000000000000000000000000 (size!16781 a!3154)))))

(assert (=> d!81625 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10533) e!312838)))

(declare-fun b!539790 () Bool)

(assert (=> b!539790 (= e!312838 e!312836)))

(declare-fun res!334889 () Bool)

(assert (=> b!539790 (=> (not res!334889) (not e!312836))))

(assert (=> b!539790 (= res!334889 (not e!312837))))

(declare-fun res!334891 () Bool)

(assert (=> b!539790 (=> (not res!334891) (not e!312837))))

(assert (=> b!539790 (= res!334891 (validKeyInArray!0 (select (arr!16417 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!539791 () Bool)

(assert (=> b!539791 (= e!312835 call!32009)))

(declare-fun b!539792 () Bool)

(assert (=> b!539792 (= e!312835 call!32009)))

(assert (= (and d!81625 (not res!334890)) b!539790))

(assert (= (and b!539790 res!334891) b!539788))

(assert (= (and b!539790 res!334889) b!539789))

(assert (= (and b!539789 c!62762) b!539792))

(assert (= (and b!539789 (not c!62762)) b!539791))

(assert (= (or b!539792 b!539791) bm!32006))

(declare-fun m!518723 () Bool)

(assert (=> bm!32006 m!518723))

(declare-fun m!518725 () Bool)

(assert (=> bm!32006 m!518725))

(assert (=> b!539788 m!518723))

(assert (=> b!539788 m!518723))

(declare-fun m!518727 () Bool)

(assert (=> b!539788 m!518727))

(assert (=> b!539789 m!518723))

(assert (=> b!539789 m!518723))

(declare-fun m!518729 () Bool)

(assert (=> b!539789 m!518729))

(assert (=> b!539790 m!518723))

(assert (=> b!539790 m!518723))

(assert (=> b!539790 m!518729))

(assert (=> b!539591 d!81625))

(declare-fun d!81627 () Bool)

(declare-fun res!334896 () Bool)

(declare-fun e!312843 () Bool)

(assert (=> d!81627 (=> res!334896 e!312843)))

(assert (=> d!81627 (= res!334896 (= (select (arr!16417 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!81627 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!312843)))

(declare-fun b!539797 () Bool)

(declare-fun e!312844 () Bool)

(assert (=> b!539797 (= e!312843 e!312844)))

(declare-fun res!334897 () Bool)

(assert (=> b!539797 (=> (not res!334897) (not e!312844))))

(assert (=> b!539797 (= res!334897 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16781 a!3154)))))

(declare-fun b!539798 () Bool)

(assert (=> b!539798 (= e!312844 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81627 (not res!334896)) b!539797))

(assert (= (and b!539797 res!334897) b!539798))

(assert (=> d!81627 m!518723))

(declare-fun m!518731 () Bool)

(assert (=> b!539798 m!518731))

(assert (=> b!539586 d!81627))

(declare-fun d!81635 () Bool)

(assert (=> d!81635 (= (validKeyInArray!0 (select (arr!16417 a!3154) j!147)) (and (not (= (select (arr!16417 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16417 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!539581 d!81635))

(declare-fun b!539831 () Bool)

(declare-fun e!312868 () Bool)

(declare-fun e!312867 () Bool)

(assert (=> b!539831 (= e!312868 e!312867)))

(declare-fun lt!247253 () (_ BitVec 64))

(assert (=> b!539831 (= lt!247253 (select (arr!16417 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16888 0))(
  ( (Unit!16889) )
))
(declare-fun lt!247251 () Unit!16888)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34156 (_ BitVec 64) (_ BitVec 32)) Unit!16888)

(assert (=> b!539831 (= lt!247251 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!247253 #b00000000000000000000000000000000))))

(assert (=> b!539831 (arrayContainsKey!0 a!3154 lt!247253 #b00000000000000000000000000000000)))

(declare-fun lt!247252 () Unit!16888)

(assert (=> b!539831 (= lt!247252 lt!247251)))

(declare-fun res!334909 () Bool)

(assert (=> b!539831 (= res!334909 (= (seekEntryOrOpen!0 (select (arr!16417 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4875 #b00000000000000000000000000000000)))))

(assert (=> b!539831 (=> (not res!334909) (not e!312867))))

(declare-fun bm!32009 () Bool)

(declare-fun call!32012 () Bool)

(assert (=> bm!32009 (= call!32012 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!539833 () Bool)

(assert (=> b!539833 (= e!312867 call!32012)))

(declare-fun b!539834 () Bool)

(declare-fun e!312866 () Bool)

(assert (=> b!539834 (= e!312866 e!312868)))

(declare-fun c!62774 () Bool)

(assert (=> b!539834 (= c!62774 (validKeyInArray!0 (select (arr!16417 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!81637 () Bool)

(declare-fun res!334908 () Bool)

(assert (=> d!81637 (=> res!334908 e!312866)))

(assert (=> d!81637 (= res!334908 (bvsge #b00000000000000000000000000000000 (size!16781 a!3154)))))

(assert (=> d!81637 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!312866)))

(declare-fun b!539832 () Bool)

(assert (=> b!539832 (= e!312868 call!32012)))

(assert (= (and d!81637 (not res!334908)) b!539834))

(assert (= (and b!539834 c!62774) b!539831))

(assert (= (and b!539834 (not c!62774)) b!539832))

(assert (= (and b!539831 res!334909) b!539833))

(assert (= (or b!539833 b!539832) bm!32009))

(assert (=> b!539831 m!518723))

(declare-fun m!518749 () Bool)

(assert (=> b!539831 m!518749))

(declare-fun m!518751 () Bool)

(assert (=> b!539831 m!518751))

(assert (=> b!539831 m!518723))

(declare-fun m!518753 () Bool)

(assert (=> b!539831 m!518753))

(declare-fun m!518755 () Bool)

(assert (=> bm!32009 m!518755))

(assert (=> b!539834 m!518723))

(assert (=> b!539834 m!518723))

(assert (=> b!539834 m!518729))

(assert (=> b!539585 d!81637))

(declare-fun d!81643 () Bool)

(assert (=> d!81643 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!539583 d!81643))

(check-sat (not b!539789) (not d!81605) (not b!539831) (not bm!32006) (not b!539788) (not b!539646) (not bm!32009) (not b!539772) (not b!539763) (not d!81589) (not d!81623) (not b!539790) (not b!539834) (not b!539798))
(check-sat)
