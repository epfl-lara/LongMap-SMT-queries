; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49766 () Bool)

(assert start!49766)

(declare-fun b!546778 () Bool)

(declare-fun res!340640 () Bool)

(declare-fun e!315925 () Bool)

(assert (=> b!546778 (=> (not res!340640) (not e!315925))))

(declare-datatypes ((array!34513 0))(
  ( (array!34514 (arr!16583 (Array (_ BitVec 32) (_ BitVec 64))) (size!16948 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34513)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546778 (= res!340640 (validKeyInArray!0 (select (arr!16583 a!3118) j!142)))))

(declare-fun res!340636 () Bool)

(assert (=> start!49766 (=> (not res!340636) (not e!315925))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49766 (= res!340636 (validMask!0 mask!3119))))

(assert (=> start!49766 e!315925))

(assert (=> start!49766 true))

(declare-fun array_inv!12466 (array!34513) Bool)

(assert (=> start!49766 (array_inv!12466 a!3118)))

(declare-fun b!546779 () Bool)

(declare-fun e!315927 () Bool)

(assert (=> b!546779 (= e!315927 (and (bvsle #b00000000000000000000000000000000 (size!16948 a!3118)) (bvsge (size!16948 a!3118) #b01111111111111111111111111111111)))))

(declare-fun b!546780 () Bool)

(assert (=> b!546780 (= e!315925 e!315927)))

(declare-fun res!340634 () Bool)

(assert (=> b!546780 (=> (not res!340634) (not e!315927))))

(declare-datatypes ((SeekEntryResult!5029 0))(
  ( (MissingZero!5029 (index!22343 (_ BitVec 32))) (Found!5029 (index!22344 (_ BitVec 32))) (Intermediate!5029 (undefined!5841 Bool) (index!22345 (_ BitVec 32)) (x!51300 (_ BitVec 32))) (Undefined!5029) (MissingVacant!5029 (index!22346 (_ BitVec 32))) )
))
(declare-fun lt!249178 () SeekEntryResult!5029)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546780 (= res!340634 (or (= lt!249178 (MissingZero!5029 i!1132)) (= lt!249178 (MissingVacant!5029 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34513 (_ BitVec 32)) SeekEntryResult!5029)

(assert (=> b!546780 (= lt!249178 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!546781 () Bool)

(declare-fun res!340637 () Bool)

(assert (=> b!546781 (=> (not res!340637) (not e!315925))))

(assert (=> b!546781 (= res!340637 (and (= (size!16948 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16948 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16948 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546782 () Bool)

(declare-fun res!340639 () Bool)

(assert (=> b!546782 (=> (not res!340639) (not e!315927))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34513 (_ BitVec 32)) Bool)

(assert (=> b!546782 (= res!340639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!546783 () Bool)

(declare-fun res!340635 () Bool)

(assert (=> b!546783 (=> (not res!340635) (not e!315925))))

(assert (=> b!546783 (= res!340635 (validKeyInArray!0 k0!1914))))

(declare-fun b!546784 () Bool)

(declare-fun res!340638 () Bool)

(assert (=> b!546784 (=> (not res!340638) (not e!315925))))

(declare-fun arrayContainsKey!0 (array!34513 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546784 (= res!340638 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!49766 res!340636) b!546781))

(assert (= (and b!546781 res!340637) b!546778))

(assert (= (and b!546778 res!340640) b!546783))

(assert (= (and b!546783 res!340635) b!546784))

(assert (= (and b!546784 res!340638) b!546780))

(assert (= (and b!546780 res!340634) b!546782))

(assert (= (and b!546782 res!340639) b!546779))

(declare-fun m!523657 () Bool)

(assert (=> b!546783 m!523657))

(declare-fun m!523659 () Bool)

(assert (=> b!546778 m!523659))

(assert (=> b!546778 m!523659))

(declare-fun m!523661 () Bool)

(assert (=> b!546778 m!523661))

(declare-fun m!523663 () Bool)

(assert (=> b!546780 m!523663))

(declare-fun m!523665 () Bool)

(assert (=> start!49766 m!523665))

(declare-fun m!523667 () Bool)

(assert (=> start!49766 m!523667))

(declare-fun m!523669 () Bool)

(assert (=> b!546782 m!523669))

(declare-fun m!523671 () Bool)

(assert (=> b!546784 m!523671))

(check-sat (not start!49766) (not b!546780) (not b!546783) (not b!546784) (not b!546782) (not b!546778))
(check-sat)
(get-model)

(declare-fun d!82191 () Bool)

(assert (=> d!82191 (= (validKeyInArray!0 (select (arr!16583 a!3118) j!142)) (and (not (= (select (arr!16583 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16583 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!546778 d!82191))

(declare-fun d!82193 () Bool)

(assert (=> d!82193 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!49766 d!82193))

(declare-fun d!82201 () Bool)

(assert (=> d!82201 (= (array_inv!12466 a!3118) (bvsge (size!16948 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!49766 d!82201))

(declare-fun d!82203 () Bool)

(declare-fun res!340687 () Bool)

(declare-fun e!315950 () Bool)

(assert (=> d!82203 (=> res!340687 e!315950)))

(assert (=> d!82203 (= res!340687 (= (select (arr!16583 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!82203 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!315950)))

(declare-fun b!546831 () Bool)

(declare-fun e!315951 () Bool)

(assert (=> b!546831 (= e!315950 e!315951)))

(declare-fun res!340688 () Bool)

(assert (=> b!546831 (=> (not res!340688) (not e!315951))))

(assert (=> b!546831 (= res!340688 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16948 a!3118)))))

(declare-fun b!546832 () Bool)

(assert (=> b!546832 (= e!315951 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82203 (not res!340687)) b!546831))

(assert (= (and b!546831 res!340688) b!546832))

(declare-fun m!523705 () Bool)

(assert (=> d!82203 m!523705))

(declare-fun m!523707 () Bool)

(assert (=> b!546832 m!523707))

(assert (=> b!546784 d!82203))

(declare-fun b!546885 () Bool)

(declare-fun e!315987 () SeekEntryResult!5029)

(declare-fun lt!249211 () SeekEntryResult!5029)

(assert (=> b!546885 (= e!315987 (Found!5029 (index!22345 lt!249211)))))

(declare-fun b!546886 () Bool)

(declare-fun e!315988 () SeekEntryResult!5029)

(assert (=> b!546886 (= e!315988 (MissingZero!5029 (index!22345 lt!249211)))))

(declare-fun b!546887 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34513 (_ BitVec 32)) SeekEntryResult!5029)

(assert (=> b!546887 (= e!315988 (seekKeyOrZeroReturnVacant!0 (x!51300 lt!249211) (index!22345 lt!249211) (index!22345 lt!249211) k0!1914 a!3118 mask!3119))))

(declare-fun b!546888 () Bool)

(declare-fun c!63418 () Bool)

(declare-fun lt!249210 () (_ BitVec 64))

(assert (=> b!546888 (= c!63418 (= lt!249210 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!546888 (= e!315987 e!315988)))

(declare-fun d!82205 () Bool)

(declare-fun lt!249209 () SeekEntryResult!5029)

(get-info :version)

(assert (=> d!82205 (and (or ((_ is Undefined!5029) lt!249209) (not ((_ is Found!5029) lt!249209)) (and (bvsge (index!22344 lt!249209) #b00000000000000000000000000000000) (bvslt (index!22344 lt!249209) (size!16948 a!3118)))) (or ((_ is Undefined!5029) lt!249209) ((_ is Found!5029) lt!249209) (not ((_ is MissingZero!5029) lt!249209)) (and (bvsge (index!22343 lt!249209) #b00000000000000000000000000000000) (bvslt (index!22343 lt!249209) (size!16948 a!3118)))) (or ((_ is Undefined!5029) lt!249209) ((_ is Found!5029) lt!249209) ((_ is MissingZero!5029) lt!249209) (not ((_ is MissingVacant!5029) lt!249209)) (and (bvsge (index!22346 lt!249209) #b00000000000000000000000000000000) (bvslt (index!22346 lt!249209) (size!16948 a!3118)))) (or ((_ is Undefined!5029) lt!249209) (ite ((_ is Found!5029) lt!249209) (= (select (arr!16583 a!3118) (index!22344 lt!249209)) k0!1914) (ite ((_ is MissingZero!5029) lt!249209) (= (select (arr!16583 a!3118) (index!22343 lt!249209)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5029) lt!249209) (= (select (arr!16583 a!3118) (index!22346 lt!249209)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!315986 () SeekEntryResult!5029)

(assert (=> d!82205 (= lt!249209 e!315986)))

(declare-fun c!63419 () Bool)

(assert (=> d!82205 (= c!63419 (and ((_ is Intermediate!5029) lt!249211) (undefined!5841 lt!249211)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34513 (_ BitVec 32)) SeekEntryResult!5029)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82205 (= lt!249211 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!82205 (validMask!0 mask!3119)))

(assert (=> d!82205 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!249209)))

(declare-fun b!546889 () Bool)

(assert (=> b!546889 (= e!315986 e!315987)))

(assert (=> b!546889 (= lt!249210 (select (arr!16583 a!3118) (index!22345 lt!249211)))))

(declare-fun c!63420 () Bool)

(assert (=> b!546889 (= c!63420 (= lt!249210 k0!1914))))

(declare-fun b!546890 () Bool)

(assert (=> b!546890 (= e!315986 Undefined!5029)))

(assert (= (and d!82205 c!63419) b!546890))

(assert (= (and d!82205 (not c!63419)) b!546889))

(assert (= (and b!546889 c!63420) b!546885))

(assert (= (and b!546889 (not c!63420)) b!546888))

(assert (= (and b!546888 c!63418) b!546886))

(assert (= (and b!546888 (not c!63418)) b!546887))

(declare-fun m!523741 () Bool)

(assert (=> b!546887 m!523741))

(assert (=> d!82205 m!523665))

(declare-fun m!523743 () Bool)

(assert (=> d!82205 m!523743))

(assert (=> d!82205 m!523743))

(declare-fun m!523745 () Bool)

(assert (=> d!82205 m!523745))

(declare-fun m!523747 () Bool)

(assert (=> d!82205 m!523747))

(declare-fun m!523749 () Bool)

(assert (=> d!82205 m!523749))

(declare-fun m!523751 () Bool)

(assert (=> d!82205 m!523751))

(declare-fun m!523753 () Bool)

(assert (=> b!546889 m!523753))

(assert (=> b!546780 d!82205))

(declare-fun d!82223 () Bool)

(declare-fun res!340712 () Bool)

(declare-fun e!315999 () Bool)

(assert (=> d!82223 (=> res!340712 e!315999)))

(assert (=> d!82223 (= res!340712 (bvsge #b00000000000000000000000000000000 (size!16948 a!3118)))))

(assert (=> d!82223 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!315999)))

(declare-fun b!546901 () Bool)

(declare-fun e!315997 () Bool)

(declare-fun call!32128 () Bool)

(assert (=> b!546901 (= e!315997 call!32128)))

(declare-fun b!546902 () Bool)

(declare-fun e!315998 () Bool)

(assert (=> b!546902 (= e!315997 e!315998)))

(declare-fun lt!249219 () (_ BitVec 64))

(assert (=> b!546902 (= lt!249219 (select (arr!16583 a!3118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16932 0))(
  ( (Unit!16933) )
))
(declare-fun lt!249220 () Unit!16932)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34513 (_ BitVec 64) (_ BitVec 32)) Unit!16932)

(assert (=> b!546902 (= lt!249220 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!249219 #b00000000000000000000000000000000))))

(assert (=> b!546902 (arrayContainsKey!0 a!3118 lt!249219 #b00000000000000000000000000000000)))

(declare-fun lt!249218 () Unit!16932)

(assert (=> b!546902 (= lt!249218 lt!249220)))

(declare-fun res!340711 () Bool)

(assert (=> b!546902 (= res!340711 (= (seekEntryOrOpen!0 (select (arr!16583 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5029 #b00000000000000000000000000000000)))))

(assert (=> b!546902 (=> (not res!340711) (not e!315998))))

(declare-fun bm!32125 () Bool)

(assert (=> bm!32125 (= call!32128 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!546903 () Bool)

(assert (=> b!546903 (= e!315999 e!315997)))

(declare-fun c!63423 () Bool)

(assert (=> b!546903 (= c!63423 (validKeyInArray!0 (select (arr!16583 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!546904 () Bool)

(assert (=> b!546904 (= e!315998 call!32128)))

(assert (= (and d!82223 (not res!340712)) b!546903))

(assert (= (and b!546903 c!63423) b!546902))

(assert (= (and b!546903 (not c!63423)) b!546901))

(assert (= (and b!546902 res!340711) b!546904))

(assert (= (or b!546904 b!546901) bm!32125))

(assert (=> b!546902 m!523705))

(declare-fun m!523755 () Bool)

(assert (=> b!546902 m!523755))

(declare-fun m!523757 () Bool)

(assert (=> b!546902 m!523757))

(assert (=> b!546902 m!523705))

(declare-fun m!523759 () Bool)

(assert (=> b!546902 m!523759))

(declare-fun m!523761 () Bool)

(assert (=> bm!32125 m!523761))

(assert (=> b!546903 m!523705))

(assert (=> b!546903 m!523705))

(declare-fun m!523763 () Bool)

(assert (=> b!546903 m!523763))

(assert (=> b!546782 d!82223))

(declare-fun d!82227 () Bool)

(assert (=> d!82227 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!546783 d!82227))

(check-sat (not b!546887) (not b!546902) (not bm!32125) (not b!546903) (not d!82205) (not b!546832))
(check-sat)
