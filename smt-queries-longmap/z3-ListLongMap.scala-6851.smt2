; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86298 () Bool)

(assert start!86298)

(declare-fun b!998811 () Bool)

(declare-fun res!668582 () Bool)

(declare-fun e!563186 () Bool)

(assert (=> b!998811 (=> (not res!668582) (not e!563186))))

(declare-datatypes ((array!63097 0))(
  ( (array!63098 (arr!30375 (Array (_ BitVec 32) (_ BitVec 64))) (size!30879 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63097)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998811 (= res!668582 (and (= (size!30879 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30879 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30879 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!998812 () Bool)

(declare-fun res!668580 () Bool)

(assert (=> b!998812 (=> (not res!668580) (not e!563186))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998812 (= res!668580 (validKeyInArray!0 k0!2224))))

(declare-fun b!998813 () Bool)

(declare-fun e!563183 () Bool)

(assert (=> b!998813 (= e!563186 e!563183)))

(declare-fun res!668578 () Bool)

(assert (=> b!998813 (=> (not res!668578) (not e!563183))))

(declare-datatypes ((SeekEntryResult!9332 0))(
  ( (MissingZero!9332 (index!39699 (_ BitVec 32))) (Found!9332 (index!39700 (_ BitVec 32))) (Intermediate!9332 (undefined!10144 Bool) (index!39701 (_ BitVec 32)) (x!87149 (_ BitVec 32))) (Undefined!9332) (MissingVacant!9332 (index!39702 (_ BitVec 32))) )
))
(declare-fun lt!441655 () SeekEntryResult!9332)

(assert (=> b!998813 (= res!668578 (or (= lt!441655 (MissingVacant!9332 i!1194)) (= lt!441655 (MissingZero!9332 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63097 (_ BitVec 32)) SeekEntryResult!9332)

(assert (=> b!998813 (= lt!441655 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!998814 () Bool)

(declare-fun res!668579 () Bool)

(assert (=> b!998814 (=> (not res!668579) (not e!563186))))

(assert (=> b!998814 (= res!668579 (validKeyInArray!0 (select (arr!30375 a!3219) j!170)))))

(declare-fun b!998815 () Bool)

(declare-fun res!668577 () Bool)

(assert (=> b!998815 (=> (not res!668577) (not e!563183))))

(declare-datatypes ((List!21117 0))(
  ( (Nil!21114) (Cons!21113 (h!22287 (_ BitVec 64)) (t!30109 List!21117)) )
))
(declare-fun arrayNoDuplicates!0 (array!63097 (_ BitVec 32) List!21117) Bool)

(assert (=> b!998815 (= res!668577 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21114))))

(declare-fun b!998816 () Bool)

(declare-fun res!668574 () Bool)

(assert (=> b!998816 (=> (not res!668574) (not e!563186))))

(declare-fun arrayContainsKey!0 (array!63097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998816 (= res!668574 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun res!668576 () Bool)

(assert (=> start!86298 (=> (not res!668576) (not e!563186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86298 (= res!668576 (validMask!0 mask!3464))))

(assert (=> start!86298 e!563186))

(declare-fun array_inv!23518 (array!63097) Bool)

(assert (=> start!86298 (array_inv!23518 a!3219)))

(assert (=> start!86298 true))

(declare-fun b!998817 () Bool)

(declare-fun e!563185 () Bool)

(declare-fun lt!441653 () (_ BitVec 32))

(assert (=> b!998817 (= e!563185 (and (bvsge mask!3464 #b00000000000000000000000000000000) (or (bvslt lt!441653 #b00000000000000000000000000000000) (bvsge lt!441653 (bvadd #b00000000000000000000000000000001 mask!3464)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998817 (= lt!441653 (toIndex!0 (select (store (arr!30375 a!3219) i!1194 k0!2224) j!170) mask!3464))))

(declare-fun b!998818 () Bool)

(declare-fun res!668581 () Bool)

(assert (=> b!998818 (=> (not res!668581) (not e!563183))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63097 (_ BitVec 32)) Bool)

(assert (=> b!998818 (= res!668581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!998819 () Bool)

(declare-fun res!668573 () Bool)

(assert (=> b!998819 (=> (not res!668573) (not e!563185))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!441654 () SeekEntryResult!9332)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63097 (_ BitVec 32)) SeekEntryResult!9332)

(assert (=> b!998819 (= res!668573 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30375 a!3219) j!170) a!3219 mask!3464) lt!441654))))

(declare-fun b!998820 () Bool)

(assert (=> b!998820 (= e!563183 e!563185)))

(declare-fun res!668572 () Bool)

(assert (=> b!998820 (=> (not res!668572) (not e!563185))))

(assert (=> b!998820 (= res!668572 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30375 a!3219) j!170) mask!3464) (select (arr!30375 a!3219) j!170) a!3219 mask!3464) lt!441654))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998820 (= lt!441654 (Intermediate!9332 false resIndex!38 resX!38))))

(declare-fun b!998821 () Bool)

(declare-fun res!668575 () Bool)

(assert (=> b!998821 (=> (not res!668575) (not e!563183))))

(assert (=> b!998821 (= res!668575 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30879 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30879 a!3219))))))

(assert (= (and start!86298 res!668576) b!998811))

(assert (= (and b!998811 res!668582) b!998814))

(assert (= (and b!998814 res!668579) b!998812))

(assert (= (and b!998812 res!668580) b!998816))

(assert (= (and b!998816 res!668574) b!998813))

(assert (= (and b!998813 res!668578) b!998818))

(assert (= (and b!998818 res!668581) b!998815))

(assert (= (and b!998815 res!668577) b!998821))

(assert (= (and b!998821 res!668575) b!998820))

(assert (= (and b!998820 res!668572) b!998819))

(assert (= (and b!998819 res!668573) b!998817))

(declare-fun m!924673 () Bool)

(assert (=> b!998812 m!924673))

(declare-fun m!924675 () Bool)

(assert (=> b!998816 m!924675))

(declare-fun m!924677 () Bool)

(assert (=> b!998814 m!924677))

(assert (=> b!998814 m!924677))

(declare-fun m!924679 () Bool)

(assert (=> b!998814 m!924679))

(declare-fun m!924681 () Bool)

(assert (=> start!86298 m!924681))

(declare-fun m!924683 () Bool)

(assert (=> start!86298 m!924683))

(declare-fun m!924685 () Bool)

(assert (=> b!998817 m!924685))

(declare-fun m!924687 () Bool)

(assert (=> b!998817 m!924687))

(assert (=> b!998817 m!924687))

(declare-fun m!924689 () Bool)

(assert (=> b!998817 m!924689))

(assert (=> b!998820 m!924677))

(assert (=> b!998820 m!924677))

(declare-fun m!924691 () Bool)

(assert (=> b!998820 m!924691))

(assert (=> b!998820 m!924691))

(assert (=> b!998820 m!924677))

(declare-fun m!924693 () Bool)

(assert (=> b!998820 m!924693))

(declare-fun m!924695 () Bool)

(assert (=> b!998818 m!924695))

(assert (=> b!998819 m!924677))

(assert (=> b!998819 m!924677))

(declare-fun m!924697 () Bool)

(assert (=> b!998819 m!924697))

(declare-fun m!924699 () Bool)

(assert (=> b!998813 m!924699))

(declare-fun m!924701 () Bool)

(assert (=> b!998815 m!924701))

(check-sat (not b!998819) (not b!998813) (not b!998814) (not b!998815) (not b!998818) (not start!86298) (not b!998817) (not b!998812) (not b!998820) (not b!998816))
(check-sat)
(get-model)

(declare-fun b!998906 () Bool)

(declare-fun e!563223 () SeekEntryResult!9332)

(assert (=> b!998906 (= e!563223 (Intermediate!9332 false index!1507 x!1245))))

(declare-fun b!998907 () Bool)

(declare-fun e!563224 () SeekEntryResult!9332)

(assert (=> b!998907 (= e!563224 (Intermediate!9332 true index!1507 x!1245))))

(declare-fun b!998908 () Bool)

(assert (=> b!998908 (= e!563224 e!563223)))

(declare-fun lt!441678 () (_ BitVec 64))

(declare-fun c!101275 () Bool)

(assert (=> b!998908 (= c!101275 (or (= lt!441678 (select (arr!30375 a!3219) j!170)) (= (bvadd lt!441678 lt!441678) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!998909 () Bool)

(declare-fun e!563221 () Bool)

(declare-fun e!563225 () Bool)

(assert (=> b!998909 (= e!563221 e!563225)))

(declare-fun res!668657 () Bool)

(declare-fun lt!441679 () SeekEntryResult!9332)

(get-info :version)

(assert (=> b!998909 (= res!668657 (and ((_ is Intermediate!9332) lt!441679) (not (undefined!10144 lt!441679)) (bvslt (x!87149 lt!441679) #b01111111111111111111111111111110) (bvsge (x!87149 lt!441679) #b00000000000000000000000000000000) (bvsge (x!87149 lt!441679) x!1245)))))

(assert (=> b!998909 (=> (not res!668657) (not e!563225))))

(declare-fun b!998910 () Bool)

(assert (=> b!998910 (and (bvsge (index!39701 lt!441679) #b00000000000000000000000000000000) (bvslt (index!39701 lt!441679) (size!30879 a!3219)))))

(declare-fun res!668656 () Bool)

(assert (=> b!998910 (= res!668656 (= (select (arr!30375 a!3219) (index!39701 lt!441679)) (select (arr!30375 a!3219) j!170)))))

(declare-fun e!563222 () Bool)

(assert (=> b!998910 (=> res!668656 e!563222)))

(assert (=> b!998910 (= e!563225 e!563222)))

(declare-fun b!998911 () Bool)

(assert (=> b!998911 (and (bvsge (index!39701 lt!441679) #b00000000000000000000000000000000) (bvslt (index!39701 lt!441679) (size!30879 a!3219)))))

(assert (=> b!998911 (= e!563222 (= (select (arr!30375 a!3219) (index!39701 lt!441679)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!998913 () Bool)

(assert (=> b!998913 (= e!563221 (bvsge (x!87149 lt!441679) #b01111111111111111111111111111110))))

(declare-fun b!998914 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998914 (= e!563223 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30375 a!3219) j!170) a!3219 mask!3464))))

(declare-fun d!119079 () Bool)

(assert (=> d!119079 e!563221))

(declare-fun c!101273 () Bool)

(assert (=> d!119079 (= c!101273 (and ((_ is Intermediate!9332) lt!441679) (undefined!10144 lt!441679)))))

(assert (=> d!119079 (= lt!441679 e!563224)))

(declare-fun c!101274 () Bool)

(assert (=> d!119079 (= c!101274 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119079 (= lt!441678 (select (arr!30375 a!3219) index!1507))))

(assert (=> d!119079 (validMask!0 mask!3464)))

(assert (=> d!119079 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30375 a!3219) j!170) a!3219 mask!3464) lt!441679)))

(declare-fun b!998912 () Bool)

(assert (=> b!998912 (and (bvsge (index!39701 lt!441679) #b00000000000000000000000000000000) (bvslt (index!39701 lt!441679) (size!30879 a!3219)))))

(declare-fun res!668655 () Bool)

(assert (=> b!998912 (= res!668655 (= (select (arr!30375 a!3219) (index!39701 lt!441679)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!998912 (=> res!668655 e!563222)))

(assert (= (and d!119079 c!101274) b!998907))

(assert (= (and d!119079 (not c!101274)) b!998908))

(assert (= (and b!998908 c!101275) b!998906))

(assert (= (and b!998908 (not c!101275)) b!998914))

(assert (= (and d!119079 c!101273) b!998913))

(assert (= (and d!119079 (not c!101273)) b!998909))

(assert (= (and b!998909 res!668657) b!998910))

(assert (= (and b!998910 (not res!668656)) b!998912))

(assert (= (and b!998912 (not res!668655)) b!998911))

(declare-fun m!924763 () Bool)

(assert (=> d!119079 m!924763))

(assert (=> d!119079 m!924681))

(declare-fun m!924765 () Bool)

(assert (=> b!998912 m!924765))

(assert (=> b!998911 m!924765))

(declare-fun m!924767 () Bool)

(assert (=> b!998914 m!924767))

(assert (=> b!998914 m!924767))

(assert (=> b!998914 m!924677))

(declare-fun m!924769 () Bool)

(assert (=> b!998914 m!924769))

(assert (=> b!998910 m!924765))

(assert (=> b!998819 d!119079))

(declare-fun b!998935 () Bool)

(declare-fun e!563243 () Bool)

(declare-fun call!42274 () Bool)

(assert (=> b!998935 (= e!563243 call!42274)))

(declare-fun b!998937 () Bool)

(declare-fun e!563241 () Bool)

(assert (=> b!998937 (= e!563241 call!42274)))

(declare-fun bm!42271 () Bool)

(assert (=> bm!42271 (= call!42274 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!998938 () Bool)

(assert (=> b!998938 (= e!563243 e!563241)))

(declare-fun lt!441696 () (_ BitVec 64))

(assert (=> b!998938 (= lt!441696 (select (arr!30375 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32863 0))(
  ( (Unit!32864) )
))
(declare-fun lt!441697 () Unit!32863)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63097 (_ BitVec 64) (_ BitVec 32)) Unit!32863)

(assert (=> b!998938 (= lt!441697 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!441696 #b00000000000000000000000000000000))))

(assert (=> b!998938 (arrayContainsKey!0 a!3219 lt!441696 #b00000000000000000000000000000000)))

(declare-fun lt!441695 () Unit!32863)

(assert (=> b!998938 (= lt!441695 lt!441697)))

(declare-fun res!668669 () Bool)

(assert (=> b!998938 (= res!668669 (= (seekEntryOrOpen!0 (select (arr!30375 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9332 #b00000000000000000000000000000000)))))

(assert (=> b!998938 (=> (not res!668669) (not e!563241))))

(declare-fun b!998936 () Bool)

(declare-fun e!563242 () Bool)

(assert (=> b!998936 (= e!563242 e!563243)))

(declare-fun c!101281 () Bool)

(assert (=> b!998936 (= c!101281 (validKeyInArray!0 (select (arr!30375 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119085 () Bool)

(declare-fun res!668668 () Bool)

(assert (=> d!119085 (=> res!668668 e!563242)))

(assert (=> d!119085 (= res!668668 (bvsge #b00000000000000000000000000000000 (size!30879 a!3219)))))

(assert (=> d!119085 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!563242)))

(assert (= (and d!119085 (not res!668668)) b!998936))

(assert (= (and b!998936 c!101281) b!998938))

(assert (= (and b!998936 (not c!101281)) b!998935))

(assert (= (and b!998938 res!668669) b!998937))

(assert (= (or b!998937 b!998935) bm!42271))

(declare-fun m!924783 () Bool)

(assert (=> bm!42271 m!924783))

(declare-fun m!924785 () Bool)

(assert (=> b!998938 m!924785))

(declare-fun m!924787 () Bool)

(assert (=> b!998938 m!924787))

(declare-fun m!924789 () Bool)

(assert (=> b!998938 m!924789))

(assert (=> b!998938 m!924785))

(declare-fun m!924791 () Bool)

(assert (=> b!998938 m!924791))

(assert (=> b!998936 m!924785))

(assert (=> b!998936 m!924785))

(declare-fun m!924793 () Bool)

(assert (=> b!998936 m!924793))

(assert (=> b!998818 d!119085))

(declare-fun d!119089 () Bool)

(declare-fun lt!441713 () SeekEntryResult!9332)

(assert (=> d!119089 (and (or ((_ is Undefined!9332) lt!441713) (not ((_ is Found!9332) lt!441713)) (and (bvsge (index!39700 lt!441713) #b00000000000000000000000000000000) (bvslt (index!39700 lt!441713) (size!30879 a!3219)))) (or ((_ is Undefined!9332) lt!441713) ((_ is Found!9332) lt!441713) (not ((_ is MissingZero!9332) lt!441713)) (and (bvsge (index!39699 lt!441713) #b00000000000000000000000000000000) (bvslt (index!39699 lt!441713) (size!30879 a!3219)))) (or ((_ is Undefined!9332) lt!441713) ((_ is Found!9332) lt!441713) ((_ is MissingZero!9332) lt!441713) (not ((_ is MissingVacant!9332) lt!441713)) (and (bvsge (index!39702 lt!441713) #b00000000000000000000000000000000) (bvslt (index!39702 lt!441713) (size!30879 a!3219)))) (or ((_ is Undefined!9332) lt!441713) (ite ((_ is Found!9332) lt!441713) (= (select (arr!30375 a!3219) (index!39700 lt!441713)) k0!2224) (ite ((_ is MissingZero!9332) lt!441713) (= (select (arr!30375 a!3219) (index!39699 lt!441713)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9332) lt!441713) (= (select (arr!30375 a!3219) (index!39702 lt!441713)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!563260 () SeekEntryResult!9332)

(assert (=> d!119089 (= lt!441713 e!563260)))

(declare-fun c!101299 () Bool)

(declare-fun lt!441715 () SeekEntryResult!9332)

(assert (=> d!119089 (= c!101299 (and ((_ is Intermediate!9332) lt!441715) (undefined!10144 lt!441715)))))

(assert (=> d!119089 (= lt!441715 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!119089 (validMask!0 mask!3464)))

(assert (=> d!119089 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!441713)))

(declare-fun b!998969 () Bool)

(declare-fun c!101298 () Bool)

(declare-fun lt!441714 () (_ BitVec 64))

(assert (=> b!998969 (= c!101298 (= lt!441714 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!563261 () SeekEntryResult!9332)

(declare-fun e!563259 () SeekEntryResult!9332)

(assert (=> b!998969 (= e!563261 e!563259)))

(declare-fun b!998970 () Bool)

(assert (=> b!998970 (= e!563259 (MissingZero!9332 (index!39701 lt!441715)))))

(declare-fun b!998971 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63097 (_ BitVec 32)) SeekEntryResult!9332)

(assert (=> b!998971 (= e!563259 (seekKeyOrZeroReturnVacant!0 (x!87149 lt!441715) (index!39701 lt!441715) (index!39701 lt!441715) k0!2224 a!3219 mask!3464))))

(declare-fun b!998972 () Bool)

(assert (=> b!998972 (= e!563260 Undefined!9332)))

(declare-fun b!998973 () Bool)

(assert (=> b!998973 (= e!563261 (Found!9332 (index!39701 lt!441715)))))

(declare-fun b!998974 () Bool)

(assert (=> b!998974 (= e!563260 e!563261)))

(assert (=> b!998974 (= lt!441714 (select (arr!30375 a!3219) (index!39701 lt!441715)))))

(declare-fun c!101297 () Bool)

(assert (=> b!998974 (= c!101297 (= lt!441714 k0!2224))))

(assert (= (and d!119089 c!101299) b!998972))

(assert (= (and d!119089 (not c!101299)) b!998974))

(assert (= (and b!998974 c!101297) b!998973))

(assert (= (and b!998974 (not c!101297)) b!998969))

(assert (= (and b!998969 c!101298) b!998970))

(assert (= (and b!998969 (not c!101298)) b!998971))

(declare-fun m!924809 () Bool)

(assert (=> d!119089 m!924809))

(assert (=> d!119089 m!924681))

(declare-fun m!924811 () Bool)

(assert (=> d!119089 m!924811))

(declare-fun m!924813 () Bool)

(assert (=> d!119089 m!924813))

(declare-fun m!924815 () Bool)

(assert (=> d!119089 m!924815))

(assert (=> d!119089 m!924813))

(declare-fun m!924817 () Bool)

(assert (=> d!119089 m!924817))

(declare-fun m!924819 () Bool)

(assert (=> b!998971 m!924819))

(declare-fun m!924821 () Bool)

(assert (=> b!998974 m!924821))

(assert (=> b!998813 d!119089))

(declare-fun d!119099 () Bool)

(assert (=> d!119099 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!998812 d!119099))

(declare-fun d!119101 () Bool)

(declare-fun lt!441730 () (_ BitVec 32))

(declare-fun lt!441729 () (_ BitVec 32))

(assert (=> d!119101 (= lt!441730 (bvmul (bvxor lt!441729 (bvlshr lt!441729 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119101 (= lt!441729 ((_ extract 31 0) (bvand (bvxor (select (store (arr!30375 a!3219) i!1194 k0!2224) j!170) (bvlshr (select (store (arr!30375 a!3219) i!1194 k0!2224) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119101 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!668670 (let ((h!22290 ((_ extract 31 0) (bvand (bvxor (select (store (arr!30375 a!3219) i!1194 k0!2224) j!170) (bvlshr (select (store (arr!30375 a!3219) i!1194 k0!2224) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87153 (bvmul (bvxor h!22290 (bvlshr h!22290 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87153 (bvlshr x!87153 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!668670 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!668670 #b00000000000000000000000000000000))))))

(assert (=> d!119101 (= (toIndex!0 (select (store (arr!30375 a!3219) i!1194 k0!2224) j!170) mask!3464) (bvand (bvxor lt!441730 (bvlshr lt!441730 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!998817 d!119101))

(declare-fun d!119105 () Bool)

(declare-fun res!668675 () Bool)

(declare-fun e!563275 () Bool)

(assert (=> d!119105 (=> res!668675 e!563275)))

(assert (=> d!119105 (= res!668675 (= (select (arr!30375 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!119105 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!563275)))

(declare-fun b!998997 () Bool)

(declare-fun e!563276 () Bool)

(assert (=> b!998997 (= e!563275 e!563276)))

(declare-fun res!668676 () Bool)

(assert (=> b!998997 (=> (not res!668676) (not e!563276))))

(assert (=> b!998997 (= res!668676 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30879 a!3219)))))

(declare-fun b!998998 () Bool)

(assert (=> b!998998 (= e!563276 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119105 (not res!668675)) b!998997))

(assert (= (and b!998997 res!668676) b!998998))

(assert (=> d!119105 m!924785))

(declare-fun m!924837 () Bool)

(assert (=> b!998998 m!924837))

(assert (=> b!998816 d!119105))

(declare-fun b!999005 () Bool)

(declare-fun e!563285 () SeekEntryResult!9332)

(assert (=> b!999005 (= e!563285 (Intermediate!9332 false (toIndex!0 (select (arr!30375 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun e!563286 () SeekEntryResult!9332)

(declare-fun b!999006 () Bool)

(assert (=> b!999006 (= e!563286 (Intermediate!9332 true (toIndex!0 (select (arr!30375 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!999007 () Bool)

(assert (=> b!999007 (= e!563286 e!563285)))

(declare-fun c!101311 () Bool)

(declare-fun lt!441731 () (_ BitVec 64))

(assert (=> b!999007 (= c!101311 (or (= lt!441731 (select (arr!30375 a!3219) j!170)) (= (bvadd lt!441731 lt!441731) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!999008 () Bool)

(declare-fun e!563283 () Bool)

(declare-fun e!563287 () Bool)

(assert (=> b!999008 (= e!563283 e!563287)))

(declare-fun res!668685 () Bool)

(declare-fun lt!441732 () SeekEntryResult!9332)

(assert (=> b!999008 (= res!668685 (and ((_ is Intermediate!9332) lt!441732) (not (undefined!10144 lt!441732)) (bvslt (x!87149 lt!441732) #b01111111111111111111111111111110) (bvsge (x!87149 lt!441732) #b00000000000000000000000000000000) (bvsge (x!87149 lt!441732) #b00000000000000000000000000000000)))))

(assert (=> b!999008 (=> (not res!668685) (not e!563287))))

(declare-fun b!999009 () Bool)

(assert (=> b!999009 (and (bvsge (index!39701 lt!441732) #b00000000000000000000000000000000) (bvslt (index!39701 lt!441732) (size!30879 a!3219)))))

(declare-fun res!668684 () Bool)

(assert (=> b!999009 (= res!668684 (= (select (arr!30375 a!3219) (index!39701 lt!441732)) (select (arr!30375 a!3219) j!170)))))

(declare-fun e!563284 () Bool)

(assert (=> b!999009 (=> res!668684 e!563284)))

(assert (=> b!999009 (= e!563287 e!563284)))

(declare-fun b!999010 () Bool)

(assert (=> b!999010 (and (bvsge (index!39701 lt!441732) #b00000000000000000000000000000000) (bvslt (index!39701 lt!441732) (size!30879 a!3219)))))

(assert (=> b!999010 (= e!563284 (= (select (arr!30375 a!3219) (index!39701 lt!441732)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!999012 () Bool)

(assert (=> b!999012 (= e!563283 (bvsge (x!87149 lt!441732) #b01111111111111111111111111111110))))

(declare-fun b!999013 () Bool)

(assert (=> b!999013 (= e!563285 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30375 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30375 a!3219) j!170) a!3219 mask!3464))))

(declare-fun d!119107 () Bool)

(assert (=> d!119107 e!563283))

(declare-fun c!101309 () Bool)

(assert (=> d!119107 (= c!101309 (and ((_ is Intermediate!9332) lt!441732) (undefined!10144 lt!441732)))))

(assert (=> d!119107 (= lt!441732 e!563286)))

(declare-fun c!101310 () Bool)

(assert (=> d!119107 (= c!101310 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119107 (= lt!441731 (select (arr!30375 a!3219) (toIndex!0 (select (arr!30375 a!3219) j!170) mask!3464)))))

(assert (=> d!119107 (validMask!0 mask!3464)))

(assert (=> d!119107 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30375 a!3219) j!170) mask!3464) (select (arr!30375 a!3219) j!170) a!3219 mask!3464) lt!441732)))

(declare-fun b!999011 () Bool)

(assert (=> b!999011 (and (bvsge (index!39701 lt!441732) #b00000000000000000000000000000000) (bvslt (index!39701 lt!441732) (size!30879 a!3219)))))

(declare-fun res!668683 () Bool)

(assert (=> b!999011 (= res!668683 (= (select (arr!30375 a!3219) (index!39701 lt!441732)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!999011 (=> res!668683 e!563284)))

(assert (= (and d!119107 c!101310) b!999006))

(assert (= (and d!119107 (not c!101310)) b!999007))

(assert (= (and b!999007 c!101311) b!999005))

(assert (= (and b!999007 (not c!101311)) b!999013))

(assert (= (and d!119107 c!101309) b!999012))

(assert (= (and d!119107 (not c!101309)) b!999008))

(assert (= (and b!999008 res!668685) b!999009))

(assert (= (and b!999009 (not res!668684)) b!999011))

(assert (= (and b!999011 (not res!668683)) b!999010))

(assert (=> d!119107 m!924691))

(declare-fun m!924839 () Bool)

(assert (=> d!119107 m!924839))

(assert (=> d!119107 m!924681))

(declare-fun m!924841 () Bool)

(assert (=> b!999011 m!924841))

(assert (=> b!999010 m!924841))

(assert (=> b!999013 m!924691))

(declare-fun m!924843 () Bool)

(assert (=> b!999013 m!924843))

(assert (=> b!999013 m!924843))

(assert (=> b!999013 m!924677))

(declare-fun m!924845 () Bool)

(assert (=> b!999013 m!924845))

(assert (=> b!999009 m!924841))

(assert (=> b!998820 d!119107))

(declare-fun d!119109 () Bool)

(declare-fun lt!441734 () (_ BitVec 32))

(declare-fun lt!441733 () (_ BitVec 32))

(assert (=> d!119109 (= lt!441734 (bvmul (bvxor lt!441733 (bvlshr lt!441733 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119109 (= lt!441733 ((_ extract 31 0) (bvand (bvxor (select (arr!30375 a!3219) j!170) (bvlshr (select (arr!30375 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119109 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!668670 (let ((h!22290 ((_ extract 31 0) (bvand (bvxor (select (arr!30375 a!3219) j!170) (bvlshr (select (arr!30375 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87153 (bvmul (bvxor h!22290 (bvlshr h!22290 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87153 (bvlshr x!87153 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!668670 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!668670 #b00000000000000000000000000000000))))))

(assert (=> d!119109 (= (toIndex!0 (select (arr!30375 a!3219) j!170) mask!3464) (bvand (bvxor lt!441734 (bvlshr lt!441734 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!998820 d!119109))

(declare-fun b!999049 () Bool)

(declare-fun e!563312 () Bool)

(declare-fun contains!5849 (List!21117 (_ BitVec 64)) Bool)

(assert (=> b!999049 (= e!563312 (contains!5849 Nil!21114 (select (arr!30375 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!999050 () Bool)

(declare-fun e!563315 () Bool)

(declare-fun call!42280 () Bool)

(assert (=> b!999050 (= e!563315 call!42280)))

(declare-fun b!999051 () Bool)

(assert (=> b!999051 (= e!563315 call!42280)))

(declare-fun b!999052 () Bool)

(declare-fun e!563314 () Bool)

(declare-fun e!563313 () Bool)

(assert (=> b!999052 (= e!563314 e!563313)))

(declare-fun res!668703 () Bool)

(assert (=> b!999052 (=> (not res!668703) (not e!563313))))

(assert (=> b!999052 (= res!668703 (not e!563312))))

(declare-fun res!668702 () Bool)

(assert (=> b!999052 (=> (not res!668702) (not e!563312))))

(assert (=> b!999052 (= res!668702 (validKeyInArray!0 (select (arr!30375 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!999053 () Bool)

(assert (=> b!999053 (= e!563313 e!563315)))

(declare-fun c!101321 () Bool)

(assert (=> b!999053 (= c!101321 (validKeyInArray!0 (select (arr!30375 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119111 () Bool)

(declare-fun res!668701 () Bool)

(assert (=> d!119111 (=> res!668701 e!563314)))

(assert (=> d!119111 (= res!668701 (bvsge #b00000000000000000000000000000000 (size!30879 a!3219)))))

(assert (=> d!119111 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21114) e!563314)))

(declare-fun bm!42277 () Bool)

(assert (=> bm!42277 (= call!42280 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101321 (Cons!21113 (select (arr!30375 a!3219) #b00000000000000000000000000000000) Nil!21114) Nil!21114)))))

(assert (= (and d!119111 (not res!668701)) b!999052))

(assert (= (and b!999052 res!668702) b!999049))

(assert (= (and b!999052 res!668703) b!999053))

(assert (= (and b!999053 c!101321) b!999051))

(assert (= (and b!999053 (not c!101321)) b!999050))

(assert (= (or b!999051 b!999050) bm!42277))

(assert (=> b!999049 m!924785))

(assert (=> b!999049 m!924785))

(declare-fun m!924853 () Bool)

(assert (=> b!999049 m!924853))

(assert (=> b!999052 m!924785))

(assert (=> b!999052 m!924785))

(assert (=> b!999052 m!924793))

(assert (=> b!999053 m!924785))

(assert (=> b!999053 m!924785))

(assert (=> b!999053 m!924793))

(assert (=> bm!42277 m!924785))

(declare-fun m!924855 () Bool)

(assert (=> bm!42277 m!924855))

(assert (=> b!998815 d!119111))

(declare-fun d!119119 () Bool)

(assert (=> d!119119 (= (validKeyInArray!0 (select (arr!30375 a!3219) j!170)) (and (not (= (select (arr!30375 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30375 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!998814 d!119119))

(declare-fun d!119121 () Bool)

(assert (=> d!119121 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86298 d!119121))

(declare-fun d!119125 () Bool)

(assert (=> d!119125 (= (array_inv!23518 a!3219) (bvsge (size!30879 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86298 d!119125))

(check-sat (not b!998936) (not b!999049) (not bm!42271) (not b!998914) (not b!999053) (not b!999052) (not b!998938) (not d!119079) (not bm!42277) (not d!119107) (not d!119089) (not b!999013) (not b!998998) (not b!998971))
(check-sat)
