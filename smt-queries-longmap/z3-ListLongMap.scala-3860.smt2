; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53130 () Bool)

(assert start!53130)

(declare-fun b!577857 () Bool)

(declare-fun res!365718 () Bool)

(declare-fun e!332372 () Bool)

(assert (=> b!577857 (=> (not res!365718) (not e!332372))))

(declare-datatypes ((array!36060 0))(
  ( (array!36061 (arr!17305 (Array (_ BitVec 32) (_ BitVec 64))) (size!17669 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36060)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577857 (= res!365718 (validKeyInArray!0 (select (arr!17305 a!2986) j!136)))))

(declare-fun b!577858 () Bool)

(declare-fun res!365719 () Bool)

(assert (=> b!577858 (=> (not res!365719) (not e!332372))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577858 (= res!365719 (and (= (size!17669 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17669 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17669 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577859 () Bool)

(declare-fun res!365712 () Bool)

(declare-fun e!332373 () Bool)

(assert (=> b!577859 (=> (not res!365712) (not e!332373))))

(assert (=> b!577859 (= res!365712 (and (bvsle #b00000000000000000000000000000000 (size!17669 a!2986)) (bvslt (size!17669 a!2986) #b01111111111111111111111111111111)))))

(declare-fun b!577860 () Bool)

(declare-fun res!365713 () Bool)

(assert (=> b!577860 (=> (not res!365713) (not e!332373))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36060 (_ BitVec 32)) Bool)

(assert (=> b!577860 (= res!365713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!577861 () Bool)

(declare-fun res!365717 () Bool)

(assert (=> b!577861 (=> (not res!365717) (not e!332372))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36060 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577861 (= res!365717 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577862 () Bool)

(declare-datatypes ((List!11253 0))(
  ( (Nil!11250) (Cons!11249 (h!12297 (_ BitVec 64)) (t!17473 List!11253)) )
))
(declare-fun noDuplicate!229 (List!11253) Bool)

(assert (=> b!577862 (= e!332373 (not (noDuplicate!229 Nil!11250)))))

(declare-fun b!577863 () Bool)

(declare-fun res!365716 () Bool)

(assert (=> b!577863 (=> (not res!365716) (not e!332372))))

(assert (=> b!577863 (= res!365716 (validKeyInArray!0 k0!1786))))

(declare-fun b!577864 () Bool)

(assert (=> b!577864 (= e!332372 e!332373)))

(declare-fun res!365715 () Bool)

(assert (=> b!577864 (=> (not res!365715) (not e!332373))))

(declare-datatypes ((SeekEntryResult!5701 0))(
  ( (MissingZero!5701 (index!25031 (_ BitVec 32))) (Found!5701 (index!25032 (_ BitVec 32))) (Intermediate!5701 (undefined!6513 Bool) (index!25033 (_ BitVec 32)) (x!54093 (_ BitVec 32))) (Undefined!5701) (MissingVacant!5701 (index!25034 (_ BitVec 32))) )
))
(declare-fun lt!264145 () SeekEntryResult!5701)

(assert (=> b!577864 (= res!365715 (or (= lt!264145 (MissingZero!5701 i!1108)) (= lt!264145 (MissingVacant!5701 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36060 (_ BitVec 32)) SeekEntryResult!5701)

(assert (=> b!577864 (= lt!264145 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!365714 () Bool)

(assert (=> start!53130 (=> (not res!365714) (not e!332372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53130 (= res!365714 (validMask!0 mask!3053))))

(assert (=> start!53130 e!332372))

(assert (=> start!53130 true))

(declare-fun array_inv!13164 (array!36060) Bool)

(assert (=> start!53130 (array_inv!13164 a!2986)))

(assert (= (and start!53130 res!365714) b!577858))

(assert (= (and b!577858 res!365719) b!577857))

(assert (= (and b!577857 res!365718) b!577863))

(assert (= (and b!577863 res!365716) b!577861))

(assert (= (and b!577861 res!365717) b!577864))

(assert (= (and b!577864 res!365715) b!577860))

(assert (= (and b!577860 res!365713) b!577859))

(assert (= (and b!577859 res!365712) b!577862))

(declare-fun m!556829 () Bool)

(assert (=> b!577864 m!556829))

(declare-fun m!556831 () Bool)

(assert (=> b!577861 m!556831))

(declare-fun m!556833 () Bool)

(assert (=> b!577857 m!556833))

(assert (=> b!577857 m!556833))

(declare-fun m!556835 () Bool)

(assert (=> b!577857 m!556835))

(declare-fun m!556837 () Bool)

(assert (=> start!53130 m!556837))

(declare-fun m!556839 () Bool)

(assert (=> start!53130 m!556839))

(declare-fun m!556841 () Bool)

(assert (=> b!577860 m!556841))

(declare-fun m!556843 () Bool)

(assert (=> b!577863 m!556843))

(declare-fun m!556845 () Bool)

(assert (=> b!577862 m!556845))

(check-sat (not start!53130) (not b!577857) (not b!577862) (not b!577861) (not b!577860) (not b!577864) (not b!577863))
(check-sat)
(get-model)

(declare-fun b!577937 () Bool)

(declare-fun e!332412 () SeekEntryResult!5701)

(declare-fun e!332410 () SeekEntryResult!5701)

(assert (=> b!577937 (= e!332412 e!332410)))

(declare-fun lt!264159 () (_ BitVec 64))

(declare-fun lt!264160 () SeekEntryResult!5701)

(assert (=> b!577937 (= lt!264159 (select (arr!17305 a!2986) (index!25033 lt!264160)))))

(declare-fun c!66449 () Bool)

(assert (=> b!577937 (= c!66449 (= lt!264159 k0!1786))))

(declare-fun b!577938 () Bool)

(assert (=> b!577938 (= e!332410 (Found!5701 (index!25033 lt!264160)))))

(declare-fun d!85699 () Bool)

(declare-fun lt!264158 () SeekEntryResult!5701)

(get-info :version)

(assert (=> d!85699 (and (or ((_ is Undefined!5701) lt!264158) (not ((_ is Found!5701) lt!264158)) (and (bvsge (index!25032 lt!264158) #b00000000000000000000000000000000) (bvslt (index!25032 lt!264158) (size!17669 a!2986)))) (or ((_ is Undefined!5701) lt!264158) ((_ is Found!5701) lt!264158) (not ((_ is MissingZero!5701) lt!264158)) (and (bvsge (index!25031 lt!264158) #b00000000000000000000000000000000) (bvslt (index!25031 lt!264158) (size!17669 a!2986)))) (or ((_ is Undefined!5701) lt!264158) ((_ is Found!5701) lt!264158) ((_ is MissingZero!5701) lt!264158) (not ((_ is MissingVacant!5701) lt!264158)) (and (bvsge (index!25034 lt!264158) #b00000000000000000000000000000000) (bvslt (index!25034 lt!264158) (size!17669 a!2986)))) (or ((_ is Undefined!5701) lt!264158) (ite ((_ is Found!5701) lt!264158) (= (select (arr!17305 a!2986) (index!25032 lt!264158)) k0!1786) (ite ((_ is MissingZero!5701) lt!264158) (= (select (arr!17305 a!2986) (index!25031 lt!264158)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5701) lt!264158) (= (select (arr!17305 a!2986) (index!25034 lt!264158)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85699 (= lt!264158 e!332412)))

(declare-fun c!66448 () Bool)

(assert (=> d!85699 (= c!66448 (and ((_ is Intermediate!5701) lt!264160) (undefined!6513 lt!264160)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36060 (_ BitVec 32)) SeekEntryResult!5701)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!85699 (= lt!264160 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!85699 (validMask!0 mask!3053)))

(assert (=> d!85699 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!264158)))

(declare-fun b!577939 () Bool)

(declare-fun e!332411 () SeekEntryResult!5701)

(assert (=> b!577939 (= e!332411 (MissingZero!5701 (index!25033 lt!264160)))))

(declare-fun b!577940 () Bool)

(assert (=> b!577940 (= e!332412 Undefined!5701)))

(declare-fun b!577941 () Bool)

(declare-fun c!66447 () Bool)

(assert (=> b!577941 (= c!66447 (= lt!264159 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!577941 (= e!332410 e!332411)))

(declare-fun b!577942 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36060 (_ BitVec 32)) SeekEntryResult!5701)

(assert (=> b!577942 (= e!332411 (seekKeyOrZeroReturnVacant!0 (x!54093 lt!264160) (index!25033 lt!264160) (index!25033 lt!264160) k0!1786 a!2986 mask!3053))))

(assert (= (and d!85699 c!66448) b!577940))

(assert (= (and d!85699 (not c!66448)) b!577937))

(assert (= (and b!577937 c!66449) b!577938))

(assert (= (and b!577937 (not c!66449)) b!577941))

(assert (= (and b!577941 c!66447) b!577939))

(assert (= (and b!577941 (not c!66447)) b!577942))

(declare-fun m!556891 () Bool)

(assert (=> b!577937 m!556891))

(declare-fun m!556893 () Bool)

(assert (=> d!85699 m!556893))

(declare-fun m!556895 () Bool)

(assert (=> d!85699 m!556895))

(assert (=> d!85699 m!556837))

(declare-fun m!556897 () Bool)

(assert (=> d!85699 m!556897))

(assert (=> d!85699 m!556893))

(declare-fun m!556899 () Bool)

(assert (=> d!85699 m!556899))

(declare-fun m!556901 () Bool)

(assert (=> d!85699 m!556901))

(declare-fun m!556903 () Bool)

(assert (=> b!577942 m!556903))

(assert (=> b!577864 d!85699))

(declare-fun d!85715 () Bool)

(assert (=> d!85715 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!577863 d!85715))

(declare-fun d!85717 () Bool)

(assert (=> d!85717 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!53130 d!85717))

(declare-fun d!85719 () Bool)

(assert (=> d!85719 (= (array_inv!13164 a!2986) (bvsge (size!17669 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!53130 d!85719))

(declare-fun d!85721 () Bool)

(assert (=> d!85721 (= (validKeyInArray!0 (select (arr!17305 a!2986) j!136)) (and (not (= (select (arr!17305 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17305 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!577857 d!85721))

(declare-fun d!85723 () Bool)

(declare-fun res!365784 () Bool)

(declare-fun e!332432 () Bool)

(assert (=> d!85723 (=> res!365784 e!332432)))

(assert (=> d!85723 (= res!365784 ((_ is Nil!11250) Nil!11250))))

(assert (=> d!85723 (= (noDuplicate!229 Nil!11250) e!332432)))

(declare-fun b!577977 () Bool)

(declare-fun e!332433 () Bool)

(assert (=> b!577977 (= e!332432 e!332433)))

(declare-fun res!365785 () Bool)

(assert (=> b!577977 (=> (not res!365785) (not e!332433))))

(declare-fun contains!2873 (List!11253 (_ BitVec 64)) Bool)

(assert (=> b!577977 (= res!365785 (not (contains!2873 (t!17473 Nil!11250) (h!12297 Nil!11250))))))

(declare-fun b!577978 () Bool)

(assert (=> b!577978 (= e!332433 (noDuplicate!229 (t!17473 Nil!11250)))))

(assert (= (and d!85723 (not res!365784)) b!577977))

(assert (= (and b!577977 res!365785) b!577978))

(declare-fun m!556919 () Bool)

(assert (=> b!577977 m!556919))

(declare-fun m!556921 () Bool)

(assert (=> b!577978 m!556921))

(assert (=> b!577862 d!85723))

(declare-fun b!578011 () Bool)

(declare-fun e!332458 () Bool)

(declare-fun call!32769 () Bool)

(assert (=> b!578011 (= e!332458 call!32769)))

(declare-fun b!578012 () Bool)

(declare-fun e!332459 () Bool)

(assert (=> b!578012 (= e!332458 e!332459)))

(declare-fun lt!264194 () (_ BitVec 64))

(assert (=> b!578012 (= lt!264194 (select (arr!17305 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!18121 0))(
  ( (Unit!18122) )
))
(declare-fun lt!264196 () Unit!18121)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36060 (_ BitVec 64) (_ BitVec 32)) Unit!18121)

(assert (=> b!578012 (= lt!264196 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!264194 #b00000000000000000000000000000000))))

(assert (=> b!578012 (arrayContainsKey!0 a!2986 lt!264194 #b00000000000000000000000000000000)))

(declare-fun lt!264195 () Unit!18121)

(assert (=> b!578012 (= lt!264195 lt!264196)))

(declare-fun res!365803 () Bool)

(assert (=> b!578012 (= res!365803 (= (seekEntryOrOpen!0 (select (arr!17305 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!5701 #b00000000000000000000000000000000)))))

(assert (=> b!578012 (=> (not res!365803) (not e!332459))))

(declare-fun b!578013 () Bool)

(assert (=> b!578013 (= e!332459 call!32769)))

(declare-fun d!85727 () Bool)

(declare-fun res!365802 () Bool)

(declare-fun e!332460 () Bool)

(assert (=> d!85727 (=> res!365802 e!332460)))

(assert (=> d!85727 (= res!365802 (bvsge #b00000000000000000000000000000000 (size!17669 a!2986)))))

(assert (=> d!85727 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!332460)))

(declare-fun bm!32766 () Bool)

(assert (=> bm!32766 (= call!32769 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!578014 () Bool)

(assert (=> b!578014 (= e!332460 e!332458)))

(declare-fun c!66473 () Bool)

(assert (=> b!578014 (= c!66473 (validKeyInArray!0 (select (arr!17305 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!85727 (not res!365802)) b!578014))

(assert (= (and b!578014 c!66473) b!578012))

(assert (= (and b!578014 (not c!66473)) b!578011))

(assert (= (and b!578012 res!365803) b!578013))

(assert (= (or b!578013 b!578011) bm!32766))

(declare-fun m!556951 () Bool)

(assert (=> b!578012 m!556951))

(declare-fun m!556953 () Bool)

(assert (=> b!578012 m!556953))

(declare-fun m!556955 () Bool)

(assert (=> b!578012 m!556955))

(assert (=> b!578012 m!556951))

(declare-fun m!556957 () Bool)

(assert (=> b!578012 m!556957))

(declare-fun m!556959 () Bool)

(assert (=> bm!32766 m!556959))

(assert (=> b!578014 m!556951))

(assert (=> b!578014 m!556951))

(declare-fun m!556961 () Bool)

(assert (=> b!578014 m!556961))

(assert (=> b!577860 d!85727))

(declare-fun d!85741 () Bool)

(declare-fun res!365812 () Bool)

(declare-fun e!332471 () Bool)

(assert (=> d!85741 (=> res!365812 e!332471)))

(assert (=> d!85741 (= res!365812 (= (select (arr!17305 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!85741 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!332471)))

(declare-fun b!578027 () Bool)

(declare-fun e!332472 () Bool)

(assert (=> b!578027 (= e!332471 e!332472)))

(declare-fun res!365813 () Bool)

(assert (=> b!578027 (=> (not res!365813) (not e!332472))))

(assert (=> b!578027 (= res!365813 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17669 a!2986)))))

(declare-fun b!578028 () Bool)

(assert (=> b!578028 (= e!332472 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85741 (not res!365812)) b!578027))

(assert (= (and b!578027 res!365813) b!578028))

(assert (=> d!85741 m!556951))

(declare-fun m!556963 () Bool)

(assert (=> b!578028 m!556963))

(assert (=> b!577861 d!85741))

(check-sat (not b!578014) (not d!85699) (not bm!32766) (not b!578028) (not b!577977) (not b!577978) (not b!578012) (not b!577942))
(check-sat)
