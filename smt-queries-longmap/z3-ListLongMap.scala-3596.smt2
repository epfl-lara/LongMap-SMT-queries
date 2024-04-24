; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49492 () Bool)

(assert start!49492)

(declare-fun b!544685 () Bool)

(declare-fun e!314922 () Bool)

(declare-fun e!314920 () Bool)

(assert (=> b!544685 (= e!314922 e!314920)))

(declare-fun res!338850 () Bool)

(assert (=> b!544685 (=> (not res!338850) (not e!314920))))

(declare-datatypes ((SeekEntryResult!4927 0))(
  ( (MissingZero!4927 (index!21932 (_ BitVec 32))) (Found!4927 (index!21933 (_ BitVec 32))) (Intermediate!4927 (undefined!5739 Bool) (index!21934 (_ BitVec 32)) (x!51000 (_ BitVec 32))) (Undefined!4927) (MissingVacant!4927 (index!21935 (_ BitVec 32))) )
))
(declare-fun lt!248612 () SeekEntryResult!4927)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!544685 (= res!338850 (or (= lt!248612 (MissingZero!4927 i!1153)) (= lt!248612 (MissingVacant!4927 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!34367 0))(
  ( (array!34368 (arr!16513 (Array (_ BitVec 32) (_ BitVec 64))) (size!16877 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34367)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34367 (_ BitVec 32)) SeekEntryResult!4927)

(assert (=> b!544685 (= lt!248612 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun e!314921 () Bool)

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!248613 () (_ BitVec 32))

(declare-fun b!544686 () Bool)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!544686 (= e!314921 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (or (bvslt lt!248613 #b00000000000000000000000000000000) (bvsge lt!248613 (size!16877 a!3154)))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544686 (= lt!248613 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!544687 () Bool)

(declare-fun res!338854 () Bool)

(assert (=> b!544687 (=> (not res!338854) (not e!314922))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!544687 (= res!338854 (validKeyInArray!0 k0!1998))))

(declare-fun b!544688 () Bool)

(assert (=> b!544688 (= e!314920 e!314921)))

(declare-fun res!338845 () Bool)

(assert (=> b!544688 (=> (not res!338845) (not e!314921))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun lt!248614 () SeekEntryResult!4927)

(assert (=> b!544688 (= res!338845 (= lt!248614 (Intermediate!4927 false resIndex!32 resX!32)))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34367 (_ BitVec 32)) SeekEntryResult!4927)

(assert (=> b!544688 (= lt!248614 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16513 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544689 () Bool)

(declare-fun res!338851 () Bool)

(assert (=> b!544689 (=> (not res!338851) (not e!314922))))

(assert (=> b!544689 (= res!338851 (validKeyInArray!0 (select (arr!16513 a!3154) j!147)))))

(declare-fun b!544690 () Bool)

(declare-fun res!338852 () Bool)

(assert (=> b!544690 (=> (not res!338852) (not e!314922))))

(assert (=> b!544690 (= res!338852 (and (= (size!16877 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16877 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16877 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!338848 () Bool)

(assert (=> start!49492 (=> (not res!338848) (not e!314922))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49492 (= res!338848 (validMask!0 mask!3216))))

(assert (=> start!49492 e!314922))

(assert (=> start!49492 true))

(declare-fun array_inv!12372 (array!34367) Bool)

(assert (=> start!49492 (array_inv!12372 a!3154)))

(declare-fun b!544691 () Bool)

(declare-fun res!338849 () Bool)

(assert (=> b!544691 (=> (not res!338849) (not e!314920))))

(declare-datatypes ((List!10539 0))(
  ( (Nil!10536) (Cons!10535 (h!11496 (_ BitVec 64)) (t!16759 List!10539)) )
))
(declare-fun arrayNoDuplicates!0 (array!34367 (_ BitVec 32) List!10539) Bool)

(assert (=> b!544691 (= res!338849 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10536))))

(declare-fun b!544692 () Bool)

(declare-fun res!338843 () Bool)

(assert (=> b!544692 (=> (not res!338843) (not e!314921))))

(assert (=> b!544692 (= res!338843 (and (not (= (select (arr!16513 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16513 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16513 a!3154) index!1177) (select (arr!16513 a!3154) j!147)))))))

(declare-fun b!544693 () Bool)

(declare-fun res!338847 () Bool)

(assert (=> b!544693 (=> (not res!338847) (not e!314920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34367 (_ BitVec 32)) Bool)

(assert (=> b!544693 (= res!338847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!544694 () Bool)

(declare-fun res!338846 () Bool)

(assert (=> b!544694 (=> (not res!338846) (not e!314922))))

(declare-fun arrayContainsKey!0 (array!34367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!544694 (= res!338846 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!544695 () Bool)

(declare-fun res!338853 () Bool)

(assert (=> b!544695 (=> (not res!338853) (not e!314921))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544695 (= res!338853 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16513 a!3154) j!147) mask!3216) (select (arr!16513 a!3154) j!147) a!3154 mask!3216) lt!248614))))

(declare-fun b!544696 () Bool)

(declare-fun res!338844 () Bool)

(assert (=> b!544696 (=> (not res!338844) (not e!314920))))

(assert (=> b!544696 (= res!338844 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16877 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16877 a!3154)) (= (select (arr!16513 a!3154) resIndex!32) (select (arr!16513 a!3154) j!147))))))

(assert (= (and start!49492 res!338848) b!544690))

(assert (= (and b!544690 res!338852) b!544689))

(assert (= (and b!544689 res!338851) b!544687))

(assert (= (and b!544687 res!338854) b!544694))

(assert (= (and b!544694 res!338846) b!544685))

(assert (= (and b!544685 res!338850) b!544693))

(assert (= (and b!544693 res!338847) b!544691))

(assert (= (and b!544691 res!338849) b!544696))

(assert (= (and b!544696 res!338844) b!544688))

(assert (= (and b!544688 res!338845) b!544695))

(assert (= (and b!544695 res!338853) b!544692))

(assert (= (and b!544692 res!338843) b!544686))

(declare-fun m!522709 () Bool)

(assert (=> b!544694 m!522709))

(declare-fun m!522711 () Bool)

(assert (=> b!544688 m!522711))

(assert (=> b!544688 m!522711))

(declare-fun m!522713 () Bool)

(assert (=> b!544688 m!522713))

(assert (=> b!544695 m!522711))

(assert (=> b!544695 m!522711))

(declare-fun m!522715 () Bool)

(assert (=> b!544695 m!522715))

(assert (=> b!544695 m!522715))

(assert (=> b!544695 m!522711))

(declare-fun m!522717 () Bool)

(assert (=> b!544695 m!522717))

(declare-fun m!522719 () Bool)

(assert (=> b!544696 m!522719))

(assert (=> b!544696 m!522711))

(declare-fun m!522721 () Bool)

(assert (=> b!544686 m!522721))

(assert (=> b!544689 m!522711))

(assert (=> b!544689 m!522711))

(declare-fun m!522723 () Bool)

(assert (=> b!544689 m!522723))

(declare-fun m!522725 () Bool)

(assert (=> start!49492 m!522725))

(declare-fun m!522727 () Bool)

(assert (=> start!49492 m!522727))

(declare-fun m!522729 () Bool)

(assert (=> b!544687 m!522729))

(declare-fun m!522731 () Bool)

(assert (=> b!544692 m!522731))

(assert (=> b!544692 m!522711))

(declare-fun m!522733 () Bool)

(assert (=> b!544693 m!522733))

(declare-fun m!522735 () Bool)

(assert (=> b!544691 m!522735))

(declare-fun m!522737 () Bool)

(assert (=> b!544685 m!522737))

(check-sat (not b!544686) (not b!544691) (not b!544695) (not start!49492) (not b!544688) (not b!544685) (not b!544689) (not b!544687) (not b!544694) (not b!544693))
(check-sat)
(get-model)

(declare-fun b!544781 () Bool)

(declare-fun e!314955 () SeekEntryResult!4927)

(declare-fun e!314954 () SeekEntryResult!4927)

(assert (=> b!544781 (= e!314955 e!314954)))

(declare-fun lt!248641 () (_ BitVec 64))

(declare-fun lt!248639 () SeekEntryResult!4927)

(assert (=> b!544781 (= lt!248641 (select (arr!16513 a!3154) (index!21934 lt!248639)))))

(declare-fun c!63254 () Bool)

(assert (=> b!544781 (= c!63254 (= lt!248641 k0!1998))))

(declare-fun b!544782 () Bool)

(assert (=> b!544782 (= e!314954 (Found!4927 (index!21934 lt!248639)))))

(declare-fun b!544783 () Bool)

(declare-fun e!314953 () SeekEntryResult!4927)

(assert (=> b!544783 (= e!314953 (MissingZero!4927 (index!21934 lt!248639)))))

(declare-fun b!544784 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34367 (_ BitVec 32)) SeekEntryResult!4927)

(assert (=> b!544784 (= e!314953 (seekKeyOrZeroReturnVacant!0 (x!51000 lt!248639) (index!21934 lt!248639) (index!21934 lt!248639) k0!1998 a!3154 mask!3216))))

(declare-fun d!82197 () Bool)

(declare-fun lt!248640 () SeekEntryResult!4927)

(get-info :version)

(assert (=> d!82197 (and (or ((_ is Undefined!4927) lt!248640) (not ((_ is Found!4927) lt!248640)) (and (bvsge (index!21933 lt!248640) #b00000000000000000000000000000000) (bvslt (index!21933 lt!248640) (size!16877 a!3154)))) (or ((_ is Undefined!4927) lt!248640) ((_ is Found!4927) lt!248640) (not ((_ is MissingZero!4927) lt!248640)) (and (bvsge (index!21932 lt!248640) #b00000000000000000000000000000000) (bvslt (index!21932 lt!248640) (size!16877 a!3154)))) (or ((_ is Undefined!4927) lt!248640) ((_ is Found!4927) lt!248640) ((_ is MissingZero!4927) lt!248640) (not ((_ is MissingVacant!4927) lt!248640)) (and (bvsge (index!21935 lt!248640) #b00000000000000000000000000000000) (bvslt (index!21935 lt!248640) (size!16877 a!3154)))) (or ((_ is Undefined!4927) lt!248640) (ite ((_ is Found!4927) lt!248640) (= (select (arr!16513 a!3154) (index!21933 lt!248640)) k0!1998) (ite ((_ is MissingZero!4927) lt!248640) (= (select (arr!16513 a!3154) (index!21932 lt!248640)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4927) lt!248640) (= (select (arr!16513 a!3154) (index!21935 lt!248640)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82197 (= lt!248640 e!314955)))

(declare-fun c!63252 () Bool)

(assert (=> d!82197 (= c!63252 (and ((_ is Intermediate!4927) lt!248639) (undefined!5739 lt!248639)))))

(assert (=> d!82197 (= lt!248639 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!82197 (validMask!0 mask!3216)))

(assert (=> d!82197 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!248640)))

(declare-fun b!544785 () Bool)

(assert (=> b!544785 (= e!314955 Undefined!4927)))

(declare-fun b!544786 () Bool)

(declare-fun c!63253 () Bool)

(assert (=> b!544786 (= c!63253 (= lt!248641 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!544786 (= e!314954 e!314953)))

(assert (= (and d!82197 c!63252) b!544785))

(assert (= (and d!82197 (not c!63252)) b!544781))

(assert (= (and b!544781 c!63254) b!544782))

(assert (= (and b!544781 (not c!63254)) b!544786))

(assert (= (and b!544786 c!63253) b!544783))

(assert (= (and b!544786 (not c!63253)) b!544784))

(declare-fun m!522799 () Bool)

(assert (=> b!544781 m!522799))

(declare-fun m!522801 () Bool)

(assert (=> b!544784 m!522801))

(declare-fun m!522803 () Bool)

(assert (=> d!82197 m!522803))

(declare-fun m!522805 () Bool)

(assert (=> d!82197 m!522805))

(declare-fun m!522807 () Bool)

(assert (=> d!82197 m!522807))

(declare-fun m!522809 () Bool)

(assert (=> d!82197 m!522809))

(assert (=> d!82197 m!522803))

(declare-fun m!522811 () Bool)

(assert (=> d!82197 m!522811))

(assert (=> d!82197 m!522725))

(assert (=> b!544685 d!82197))

(declare-fun b!544797 () Bool)

(declare-fun e!314967 () Bool)

(declare-fun contains!2786 (List!10539 (_ BitVec 64)) Bool)

(assert (=> b!544797 (= e!314967 (contains!2786 Nil!10536 (select (arr!16513 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!544798 () Bool)

(declare-fun e!314966 () Bool)

(declare-fun e!314964 () Bool)

(assert (=> b!544798 (= e!314966 e!314964)))

(declare-fun res!338935 () Bool)

(assert (=> b!544798 (=> (not res!338935) (not e!314964))))

(assert (=> b!544798 (= res!338935 (not e!314967))))

(declare-fun res!338934 () Bool)

(assert (=> b!544798 (=> (not res!338934) (not e!314967))))

(assert (=> b!544798 (= res!338934 (validKeyInArray!0 (select (arr!16513 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!82201 () Bool)

(declare-fun res!338933 () Bool)

(assert (=> d!82201 (=> res!338933 e!314966)))

(assert (=> d!82201 (= res!338933 (bvsge #b00000000000000000000000000000000 (size!16877 a!3154)))))

(assert (=> d!82201 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10536) e!314966)))

(declare-fun bm!32097 () Bool)

(declare-fun call!32100 () Bool)

(declare-fun c!63257 () Bool)

(assert (=> bm!32097 (= call!32100 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63257 (Cons!10535 (select (arr!16513 a!3154) #b00000000000000000000000000000000) Nil!10536) Nil!10536)))))

(declare-fun b!544799 () Bool)

(declare-fun e!314965 () Bool)

(assert (=> b!544799 (= e!314965 call!32100)))

(declare-fun b!544800 () Bool)

(assert (=> b!544800 (= e!314964 e!314965)))

(assert (=> b!544800 (= c!63257 (validKeyInArray!0 (select (arr!16513 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!544801 () Bool)

(assert (=> b!544801 (= e!314965 call!32100)))

(assert (= (and d!82201 (not res!338933)) b!544798))

(assert (= (and b!544798 res!338934) b!544797))

(assert (= (and b!544798 res!338935) b!544800))

(assert (= (and b!544800 c!63257) b!544801))

(assert (= (and b!544800 (not c!63257)) b!544799))

(assert (= (or b!544801 b!544799) bm!32097))

(declare-fun m!522813 () Bool)

(assert (=> b!544797 m!522813))

(assert (=> b!544797 m!522813))

(declare-fun m!522815 () Bool)

(assert (=> b!544797 m!522815))

(assert (=> b!544798 m!522813))

(assert (=> b!544798 m!522813))

(declare-fun m!522817 () Bool)

(assert (=> b!544798 m!522817))

(assert (=> bm!32097 m!522813))

(declare-fun m!522819 () Bool)

(assert (=> bm!32097 m!522819))

(assert (=> b!544800 m!522813))

(assert (=> b!544800 m!522813))

(assert (=> b!544800 m!522817))

(assert (=> b!544691 d!82201))

(declare-fun d!82207 () Bool)

(assert (=> d!82207 (= (validKeyInArray!0 (select (arr!16513 a!3154) j!147)) (and (not (= (select (arr!16513 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16513 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!544689 d!82207))

(declare-fun d!82209 () Bool)

(declare-fun res!338940 () Bool)

(declare-fun e!314972 () Bool)

(assert (=> d!82209 (=> res!338940 e!314972)))

(assert (=> d!82209 (= res!338940 (= (select (arr!16513 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!82209 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!314972)))

(declare-fun b!544806 () Bool)

(declare-fun e!314973 () Bool)

(assert (=> b!544806 (= e!314972 e!314973)))

(declare-fun res!338941 () Bool)

(assert (=> b!544806 (=> (not res!338941) (not e!314973))))

(assert (=> b!544806 (= res!338941 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16877 a!3154)))))

(declare-fun b!544807 () Bool)

(assert (=> b!544807 (= e!314973 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82209 (not res!338940)) b!544806))

(assert (= (and b!544806 res!338941) b!544807))

(assert (=> d!82209 m!522813))

(declare-fun m!522823 () Bool)

(assert (=> b!544807 m!522823))

(assert (=> b!544694 d!82209))

(declare-fun b!544880 () Bool)

(declare-fun e!315014 () Bool)

(declare-fun lt!248662 () SeekEntryResult!4927)

(assert (=> b!544880 (= e!315014 (bvsge (x!51000 lt!248662) #b01111111111111111111111111111110))))

(declare-fun d!82213 () Bool)

(assert (=> d!82213 e!315014))

(declare-fun c!63284 () Bool)

(assert (=> d!82213 (= c!63284 (and ((_ is Intermediate!4927) lt!248662) (undefined!5739 lt!248662)))))

(declare-fun e!315018 () SeekEntryResult!4927)

(assert (=> d!82213 (= lt!248662 e!315018)))

(declare-fun c!63283 () Bool)

(assert (=> d!82213 (= c!63283 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!248661 () (_ BitVec 64))

(assert (=> d!82213 (= lt!248661 (select (arr!16513 a!3154) (toIndex!0 (select (arr!16513 a!3154) j!147) mask!3216)))))

(assert (=> d!82213 (validMask!0 mask!3216)))

(assert (=> d!82213 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16513 a!3154) j!147) mask!3216) (select (arr!16513 a!3154) j!147) a!3154 mask!3216) lt!248662)))

(declare-fun b!544881 () Bool)

(assert (=> b!544881 (and (bvsge (index!21934 lt!248662) #b00000000000000000000000000000000) (bvslt (index!21934 lt!248662) (size!16877 a!3154)))))

(declare-fun res!338967 () Bool)

(assert (=> b!544881 (= res!338967 (= (select (arr!16513 a!3154) (index!21934 lt!248662)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!315015 () Bool)

(assert (=> b!544881 (=> res!338967 e!315015)))

(declare-fun b!544882 () Bool)

(declare-fun e!315016 () SeekEntryResult!4927)

(assert (=> b!544882 (= e!315016 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16513 a!3154) j!147) mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3216) (select (arr!16513 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544883 () Bool)

(assert (=> b!544883 (= e!315018 e!315016)))

(declare-fun c!63282 () Bool)

(assert (=> b!544883 (= c!63282 (or (= lt!248661 (select (arr!16513 a!3154) j!147)) (= (bvadd lt!248661 lt!248661) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544884 () Bool)

(assert (=> b!544884 (= e!315018 (Intermediate!4927 true (toIndex!0 (select (arr!16513 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!544885 () Bool)

(assert (=> b!544885 (and (bvsge (index!21934 lt!248662) #b00000000000000000000000000000000) (bvslt (index!21934 lt!248662) (size!16877 a!3154)))))

(declare-fun res!338966 () Bool)

(assert (=> b!544885 (= res!338966 (= (select (arr!16513 a!3154) (index!21934 lt!248662)) (select (arr!16513 a!3154) j!147)))))

(assert (=> b!544885 (=> res!338966 e!315015)))

(declare-fun e!315017 () Bool)

(assert (=> b!544885 (= e!315017 e!315015)))

(declare-fun b!544886 () Bool)

(assert (=> b!544886 (= e!315014 e!315017)))

(declare-fun res!338968 () Bool)

(assert (=> b!544886 (= res!338968 (and ((_ is Intermediate!4927) lt!248662) (not (undefined!5739 lt!248662)) (bvslt (x!51000 lt!248662) #b01111111111111111111111111111110) (bvsge (x!51000 lt!248662) #b00000000000000000000000000000000) (bvsge (x!51000 lt!248662) #b00000000000000000000000000000000)))))

(assert (=> b!544886 (=> (not res!338968) (not e!315017))))

(declare-fun b!544887 () Bool)

(assert (=> b!544887 (and (bvsge (index!21934 lt!248662) #b00000000000000000000000000000000) (bvslt (index!21934 lt!248662) (size!16877 a!3154)))))

(assert (=> b!544887 (= e!315015 (= (select (arr!16513 a!3154) (index!21934 lt!248662)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!544888 () Bool)

(assert (=> b!544888 (= e!315016 (Intermediate!4927 false (toIndex!0 (select (arr!16513 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(assert (= (and d!82213 c!63283) b!544884))

(assert (= (and d!82213 (not c!63283)) b!544883))

(assert (= (and b!544883 c!63282) b!544888))

(assert (= (and b!544883 (not c!63282)) b!544882))

(assert (= (and d!82213 c!63284) b!544880))

(assert (= (and d!82213 (not c!63284)) b!544886))

(assert (= (and b!544886 res!338968) b!544885))

(assert (= (and b!544885 (not res!338966)) b!544881))

(assert (= (and b!544881 (not res!338967)) b!544887))

(declare-fun m!522837 () Bool)

(assert (=> b!544881 m!522837))

(assert (=> b!544882 m!522715))

(declare-fun m!522839 () Bool)

(assert (=> b!544882 m!522839))

(assert (=> b!544882 m!522839))

(assert (=> b!544882 m!522711))

(declare-fun m!522841 () Bool)

(assert (=> b!544882 m!522841))

(assert (=> d!82213 m!522715))

(declare-fun m!522843 () Bool)

(assert (=> d!82213 m!522843))

(assert (=> d!82213 m!522725))

(assert (=> b!544887 m!522837))

(assert (=> b!544885 m!522837))

(assert (=> b!544695 d!82213))

(declare-fun d!82221 () Bool)

(declare-fun lt!248672 () (_ BitVec 32))

(declare-fun lt!248671 () (_ BitVec 32))

(assert (=> d!82221 (= lt!248672 (bvmul (bvxor lt!248671 (bvlshr lt!248671 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82221 (= lt!248671 ((_ extract 31 0) (bvand (bvxor (select (arr!16513 a!3154) j!147) (bvlshr (select (arr!16513 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82221 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!338973 (let ((h!11499 ((_ extract 31 0) (bvand (bvxor (select (arr!16513 a!3154) j!147) (bvlshr (select (arr!16513 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51007 (bvmul (bvxor h!11499 (bvlshr h!11499 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51007 (bvlshr x!51007 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!338973 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!338973 #b00000000000000000000000000000000))))))

(assert (=> d!82221 (= (toIndex!0 (select (arr!16513 a!3154) j!147) mask!3216) (bvand (bvxor lt!248672 (bvlshr lt!248672 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!544695 d!82221))

(declare-fun d!82225 () Bool)

(declare-fun res!338980 () Bool)

(declare-fun e!315040 () Bool)

(assert (=> d!82225 (=> res!338980 e!315040)))

(assert (=> d!82225 (= res!338980 (bvsge #b00000000000000000000000000000000 (size!16877 a!3154)))))

(assert (=> d!82225 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!315040)))

(declare-fun bm!32100 () Bool)

(declare-fun call!32103 () Bool)

(assert (=> bm!32100 (= call!32103 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!544921 () Bool)

(declare-fun e!315042 () Bool)

(assert (=> b!544921 (= e!315040 e!315042)))

(declare-fun c!63296 () Bool)

(assert (=> b!544921 (= c!63296 (validKeyInArray!0 (select (arr!16513 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!544922 () Bool)

(assert (=> b!544922 (= e!315042 call!32103)))

(declare-fun b!544923 () Bool)

(declare-fun e!315041 () Bool)

(assert (=> b!544923 (= e!315041 call!32103)))

(declare-fun b!544924 () Bool)

(assert (=> b!544924 (= e!315042 e!315041)))

(declare-fun lt!248686 () (_ BitVec 64))

(assert (=> b!544924 (= lt!248686 (select (arr!16513 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16887 0))(
  ( (Unit!16888) )
))
(declare-fun lt!248684 () Unit!16887)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34367 (_ BitVec 64) (_ BitVec 32)) Unit!16887)

(assert (=> b!544924 (= lt!248684 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!248686 #b00000000000000000000000000000000))))

(assert (=> b!544924 (arrayContainsKey!0 a!3154 lt!248686 #b00000000000000000000000000000000)))

(declare-fun lt!248685 () Unit!16887)

(assert (=> b!544924 (= lt!248685 lt!248684)))

(declare-fun res!338981 () Bool)

(assert (=> b!544924 (= res!338981 (= (seekEntryOrOpen!0 (select (arr!16513 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4927 #b00000000000000000000000000000000)))))

(assert (=> b!544924 (=> (not res!338981) (not e!315041))))

(assert (= (and d!82225 (not res!338980)) b!544921))

(assert (= (and b!544921 c!63296) b!544924))

(assert (= (and b!544921 (not c!63296)) b!544922))

(assert (= (and b!544924 res!338981) b!544923))

(assert (= (or b!544923 b!544922) bm!32100))

(declare-fun m!522863 () Bool)

(assert (=> bm!32100 m!522863))

(assert (=> b!544921 m!522813))

(assert (=> b!544921 m!522813))

(assert (=> b!544921 m!522817))

(assert (=> b!544924 m!522813))

(declare-fun m!522865 () Bool)

(assert (=> b!544924 m!522865))

(declare-fun m!522867 () Bool)

(assert (=> b!544924 m!522867))

(assert (=> b!544924 m!522813))

(declare-fun m!522869 () Bool)

(assert (=> b!544924 m!522869))

(assert (=> b!544693 d!82225))

(declare-fun d!82229 () Bool)

(assert (=> d!82229 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49492 d!82229))

(declare-fun d!82237 () Bool)

(assert (=> d!82237 (= (array_inv!12372 a!3154) (bvsge (size!16877 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49492 d!82237))

(declare-fun b!544953 () Bool)

(declare-fun e!315060 () Bool)

(declare-fun lt!248697 () SeekEntryResult!4927)

(assert (=> b!544953 (= e!315060 (bvsge (x!51000 lt!248697) #b01111111111111111111111111111110))))

(declare-fun d!82239 () Bool)

(assert (=> d!82239 e!315060))

(declare-fun c!63310 () Bool)

(assert (=> d!82239 (= c!63310 (and ((_ is Intermediate!4927) lt!248697) (undefined!5739 lt!248697)))))

(declare-fun e!315064 () SeekEntryResult!4927)

(assert (=> d!82239 (= lt!248697 e!315064)))

(declare-fun c!63309 () Bool)

(assert (=> d!82239 (= c!63309 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!248696 () (_ BitVec 64))

(assert (=> d!82239 (= lt!248696 (select (arr!16513 a!3154) index!1177))))

(assert (=> d!82239 (validMask!0 mask!3216)))

(assert (=> d!82239 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16513 a!3154) j!147) a!3154 mask!3216) lt!248697)))

(declare-fun b!544954 () Bool)

(assert (=> b!544954 (and (bvsge (index!21934 lt!248697) #b00000000000000000000000000000000) (bvslt (index!21934 lt!248697) (size!16877 a!3154)))))

(declare-fun res!338989 () Bool)

(assert (=> b!544954 (= res!338989 (= (select (arr!16513 a!3154) (index!21934 lt!248697)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!315061 () Bool)

(assert (=> b!544954 (=> res!338989 e!315061)))

(declare-fun b!544955 () Bool)

(declare-fun e!315062 () SeekEntryResult!4927)

(assert (=> b!544955 (= e!315062 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 (bvadd x!1030 #b00000000000000000000000000000001) mask!3216) (select (arr!16513 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544956 () Bool)

(assert (=> b!544956 (= e!315064 e!315062)))

(declare-fun c!63308 () Bool)

(assert (=> b!544956 (= c!63308 (or (= lt!248696 (select (arr!16513 a!3154) j!147)) (= (bvadd lt!248696 lt!248696) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544957 () Bool)

(assert (=> b!544957 (= e!315064 (Intermediate!4927 true index!1177 x!1030))))

(declare-fun b!544958 () Bool)

(assert (=> b!544958 (and (bvsge (index!21934 lt!248697) #b00000000000000000000000000000000) (bvslt (index!21934 lt!248697) (size!16877 a!3154)))))

(declare-fun res!338988 () Bool)

(assert (=> b!544958 (= res!338988 (= (select (arr!16513 a!3154) (index!21934 lt!248697)) (select (arr!16513 a!3154) j!147)))))

(assert (=> b!544958 (=> res!338988 e!315061)))

(declare-fun e!315063 () Bool)

(assert (=> b!544958 (= e!315063 e!315061)))

(declare-fun b!544959 () Bool)

(assert (=> b!544959 (= e!315060 e!315063)))

(declare-fun res!338990 () Bool)

(assert (=> b!544959 (= res!338990 (and ((_ is Intermediate!4927) lt!248697) (not (undefined!5739 lt!248697)) (bvslt (x!51000 lt!248697) #b01111111111111111111111111111110) (bvsge (x!51000 lt!248697) #b00000000000000000000000000000000) (bvsge (x!51000 lt!248697) x!1030)))))

(assert (=> b!544959 (=> (not res!338990) (not e!315063))))

(declare-fun b!544960 () Bool)

(assert (=> b!544960 (and (bvsge (index!21934 lt!248697) #b00000000000000000000000000000000) (bvslt (index!21934 lt!248697) (size!16877 a!3154)))))

(assert (=> b!544960 (= e!315061 (= (select (arr!16513 a!3154) (index!21934 lt!248697)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!544961 () Bool)

(assert (=> b!544961 (= e!315062 (Intermediate!4927 false index!1177 x!1030))))

(assert (= (and d!82239 c!63309) b!544957))

(assert (= (and d!82239 (not c!63309)) b!544956))

(assert (= (and b!544956 c!63308) b!544961))

(assert (= (and b!544956 (not c!63308)) b!544955))

(assert (= (and d!82239 c!63310) b!544953))

(assert (= (and d!82239 (not c!63310)) b!544959))

(assert (= (and b!544959 res!338990) b!544958))

(assert (= (and b!544958 (not res!338988)) b!544954))

(assert (= (and b!544954 (not res!338989)) b!544960))

(declare-fun m!522885 () Bool)

(assert (=> b!544954 m!522885))

(declare-fun m!522887 () Bool)

(assert (=> b!544955 m!522887))

(assert (=> b!544955 m!522887))

(assert (=> b!544955 m!522711))

(declare-fun m!522889 () Bool)

(assert (=> b!544955 m!522889))

(assert (=> d!82239 m!522731))

(assert (=> d!82239 m!522725))

(assert (=> b!544960 m!522885))

(assert (=> b!544958 m!522885))

(assert (=> b!544688 d!82239))

(declare-fun d!82241 () Bool)

(declare-fun lt!248700 () (_ BitVec 32))

(assert (=> d!82241 (and (bvsge lt!248700 #b00000000000000000000000000000000) (bvslt lt!248700 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82241 (= lt!248700 (choose!52 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(assert (=> d!82241 (validMask!0 mask!3216)))

(assert (=> d!82241 (= (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216) lt!248700)))

(declare-fun bs!17010 () Bool)

(assert (= bs!17010 d!82241))

(declare-fun m!522899 () Bool)

(assert (=> bs!17010 m!522899))

(assert (=> bs!17010 m!522725))

(assert (=> b!544686 d!82241))

(declare-fun d!82245 () Bool)

(assert (=> d!82245 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!544687 d!82245))

(check-sat (not b!544798) (not d!82239) (not b!544924) (not b!544921) (not b!544882) (not bm!32100) (not b!544800) (not b!544784) (not d!82213) (not d!82197) (not d!82241) (not b!544797) (not bm!32097) (not b!544955) (not b!544807))
(check-sat)
