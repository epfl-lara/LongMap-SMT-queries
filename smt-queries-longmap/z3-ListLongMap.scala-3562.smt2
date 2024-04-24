; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48988 () Bool)

(assert start!48988)

(declare-fun b!539748 () Bool)

(declare-fun res!334858 () Bool)

(declare-fun e!312835 () Bool)

(assert (=> b!539748 (=> (not res!334858) (not e!312835))))

(declare-datatypes ((array!34148 0))(
  ( (array!34149 (arr!16411 (Array (_ BitVec 32) (_ BitVec 64))) (size!16775 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34148)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34148 (_ BitVec 32)) Bool)

(assert (=> b!539748 (= res!334858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539749 () Bool)

(declare-fun e!312837 () Bool)

(assert (=> b!539749 (= e!312837 e!312835)))

(declare-fun res!334852 () Bool)

(assert (=> b!539749 (=> (not res!334852) (not e!312835))))

(declare-datatypes ((SeekEntryResult!4825 0))(
  ( (MissingZero!4825 (index!21524 (_ BitVec 32))) (Found!4825 (index!21525 (_ BitVec 32))) (Intermediate!4825 (undefined!5637 Bool) (index!21526 (_ BitVec 32)) (x!50587 (_ BitVec 32))) (Undefined!4825) (MissingVacant!4825 (index!21527 (_ BitVec 32))) )
))
(declare-fun lt!247266 () SeekEntryResult!4825)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539749 (= res!334852 (or (= lt!247266 (MissingZero!4825 i!1153)) (= lt!247266 (MissingVacant!4825 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34148 (_ BitVec 32)) SeekEntryResult!4825)

(assert (=> b!539749 (= lt!247266 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!539750 () Bool)

(declare-fun e!312836 () Bool)

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!539750 (= e!312836 (= (select (arr!16411 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!539752 () Bool)

(declare-fun res!334851 () Bool)

(assert (=> b!539752 (=> (not res!334851) (not e!312836))))

(declare-fun lt!247267 () SeekEntryResult!4825)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34148 (_ BitVec 32)) SeekEntryResult!4825)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539752 (= res!334851 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16411 a!3154) j!147) mask!3216) (select (arr!16411 a!3154) j!147) a!3154 mask!3216) lt!247267))))

(declare-fun b!539753 () Bool)

(declare-fun res!334853 () Bool)

(assert (=> b!539753 (=> (not res!334853) (not e!312837))))

(declare-fun arrayContainsKey!0 (array!34148 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539753 (= res!334853 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539754 () Bool)

(declare-fun res!334856 () Bool)

(assert (=> b!539754 (=> (not res!334856) (not e!312837))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539754 (= res!334856 (validKeyInArray!0 (select (arr!16411 a!3154) j!147)))))

(declare-fun b!539755 () Bool)

(declare-fun res!334849 () Bool)

(assert (=> b!539755 (=> (not res!334849) (not e!312835))))

(declare-datatypes ((List!10437 0))(
  ( (Nil!10434) (Cons!10433 (h!11379 (_ BitVec 64)) (t!16657 List!10437)) )
))
(declare-fun arrayNoDuplicates!0 (array!34148 (_ BitVec 32) List!10437) Bool)

(assert (=> b!539755 (= res!334849 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10434))))

(declare-fun b!539756 () Bool)

(declare-fun res!334854 () Bool)

(assert (=> b!539756 (=> (not res!334854) (not e!312835))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!539756 (= res!334854 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16775 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16775 a!3154)) (= (select (arr!16411 a!3154) resIndex!32) (select (arr!16411 a!3154) j!147))))))

(declare-fun res!334857 () Bool)

(assert (=> start!48988 (=> (not res!334857) (not e!312837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48988 (= res!334857 (validMask!0 mask!3216))))

(assert (=> start!48988 e!312837))

(assert (=> start!48988 true))

(declare-fun array_inv!12270 (array!34148) Bool)

(assert (=> start!48988 (array_inv!12270 a!3154)))

(declare-fun b!539751 () Bool)

(declare-fun res!334848 () Bool)

(assert (=> b!539751 (=> (not res!334848) (not e!312837))))

(assert (=> b!539751 (= res!334848 (validKeyInArray!0 k0!1998))))

(declare-fun b!539757 () Bool)

(assert (=> b!539757 (= e!312835 e!312836)))

(declare-fun res!334855 () Bool)

(assert (=> b!539757 (=> (not res!334855) (not e!312836))))

(assert (=> b!539757 (= res!334855 (= lt!247267 (Intermediate!4825 false resIndex!32 resX!32)))))

(assert (=> b!539757 (= lt!247267 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16411 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539758 () Bool)

(declare-fun res!334850 () Bool)

(assert (=> b!539758 (=> (not res!334850) (not e!312837))))

(assert (=> b!539758 (= res!334850 (and (= (size!16775 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16775 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16775 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48988 res!334857) b!539758))

(assert (= (and b!539758 res!334850) b!539754))

(assert (= (and b!539754 res!334856) b!539751))

(assert (= (and b!539751 res!334848) b!539753))

(assert (= (and b!539753 res!334853) b!539749))

(assert (= (and b!539749 res!334852) b!539748))

(assert (= (and b!539748 res!334858) b!539755))

(assert (= (and b!539755 res!334849) b!539756))

(assert (= (and b!539756 res!334854) b!539757))

(assert (= (and b!539757 res!334855) b!539752))

(assert (= (and b!539752 res!334851) b!539750))

(declare-fun m!518875 () Bool)

(assert (=> b!539755 m!518875))

(declare-fun m!518877 () Bool)

(assert (=> b!539754 m!518877))

(assert (=> b!539754 m!518877))

(declare-fun m!518879 () Bool)

(assert (=> b!539754 m!518879))

(declare-fun m!518881 () Bool)

(assert (=> start!48988 m!518881))

(declare-fun m!518883 () Bool)

(assert (=> start!48988 m!518883))

(declare-fun m!518885 () Bool)

(assert (=> b!539750 m!518885))

(declare-fun m!518887 () Bool)

(assert (=> b!539749 m!518887))

(assert (=> b!539752 m!518877))

(assert (=> b!539752 m!518877))

(declare-fun m!518889 () Bool)

(assert (=> b!539752 m!518889))

(assert (=> b!539752 m!518889))

(assert (=> b!539752 m!518877))

(declare-fun m!518891 () Bool)

(assert (=> b!539752 m!518891))

(declare-fun m!518893 () Bool)

(assert (=> b!539753 m!518893))

(declare-fun m!518895 () Bool)

(assert (=> b!539748 m!518895))

(declare-fun m!518897 () Bool)

(assert (=> b!539756 m!518897))

(assert (=> b!539756 m!518877))

(declare-fun m!518899 () Bool)

(assert (=> b!539751 m!518899))

(assert (=> b!539757 m!518877))

(assert (=> b!539757 m!518877))

(declare-fun m!518901 () Bool)

(assert (=> b!539757 m!518901))

(check-sat (not b!539757) (not start!48988) (not b!539754) (not b!539753) (not b!539752) (not b!539755) (not b!539748) (not b!539749) (not b!539751))
(check-sat)
(get-model)

(declare-fun d!81691 () Bool)

(assert (=> d!81691 (= (validKeyInArray!0 (select (arr!16411 a!3154) j!147)) (and (not (= (select (arr!16411 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16411 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!539754 d!81691))

(declare-fun d!81693 () Bool)

(assert (=> d!81693 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48988 d!81693))

(declare-fun d!81697 () Bool)

(assert (=> d!81697 (= (array_inv!12270 a!3154) (bvsge (size!16775 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48988 d!81697))

(declare-fun b!539860 () Bool)

(declare-fun e!312881 () SeekEntryResult!4825)

(assert (=> b!539860 (= e!312881 Undefined!4825)))

(declare-fun b!539861 () Bool)

(declare-fun e!312879 () SeekEntryResult!4825)

(declare-fun lt!247301 () SeekEntryResult!4825)

(assert (=> b!539861 (= e!312879 (MissingZero!4825 (index!21526 lt!247301)))))

(declare-fun b!539862 () Bool)

(declare-fun e!312880 () SeekEntryResult!4825)

(assert (=> b!539862 (= e!312881 e!312880)))

(declare-fun lt!247303 () (_ BitVec 64))

(assert (=> b!539862 (= lt!247303 (select (arr!16411 a!3154) (index!21526 lt!247301)))))

(declare-fun c!62780 () Bool)

(assert (=> b!539862 (= c!62780 (= lt!247303 k0!1998))))

(declare-fun b!539863 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34148 (_ BitVec 32)) SeekEntryResult!4825)

(assert (=> b!539863 (= e!312879 (seekKeyOrZeroReturnVacant!0 (x!50587 lt!247301) (index!21526 lt!247301) (index!21526 lt!247301) k0!1998 a!3154 mask!3216))))

(declare-fun b!539864 () Bool)

(assert (=> b!539864 (= e!312880 (Found!4825 (index!21526 lt!247301)))))

(declare-fun b!539859 () Bool)

(declare-fun c!62781 () Bool)

(assert (=> b!539859 (= c!62781 (= lt!247303 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!539859 (= e!312880 e!312879)))

(declare-fun d!81699 () Bool)

(declare-fun lt!247302 () SeekEntryResult!4825)

(get-info :version)

(assert (=> d!81699 (and (or ((_ is Undefined!4825) lt!247302) (not ((_ is Found!4825) lt!247302)) (and (bvsge (index!21525 lt!247302) #b00000000000000000000000000000000) (bvslt (index!21525 lt!247302) (size!16775 a!3154)))) (or ((_ is Undefined!4825) lt!247302) ((_ is Found!4825) lt!247302) (not ((_ is MissingZero!4825) lt!247302)) (and (bvsge (index!21524 lt!247302) #b00000000000000000000000000000000) (bvslt (index!21524 lt!247302) (size!16775 a!3154)))) (or ((_ is Undefined!4825) lt!247302) ((_ is Found!4825) lt!247302) ((_ is MissingZero!4825) lt!247302) (not ((_ is MissingVacant!4825) lt!247302)) (and (bvsge (index!21527 lt!247302) #b00000000000000000000000000000000) (bvslt (index!21527 lt!247302) (size!16775 a!3154)))) (or ((_ is Undefined!4825) lt!247302) (ite ((_ is Found!4825) lt!247302) (= (select (arr!16411 a!3154) (index!21525 lt!247302)) k0!1998) (ite ((_ is MissingZero!4825) lt!247302) (= (select (arr!16411 a!3154) (index!21524 lt!247302)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4825) lt!247302) (= (select (arr!16411 a!3154) (index!21527 lt!247302)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81699 (= lt!247302 e!312881)))

(declare-fun c!62782 () Bool)

(assert (=> d!81699 (= c!62782 (and ((_ is Intermediate!4825) lt!247301) (undefined!5637 lt!247301)))))

(assert (=> d!81699 (= lt!247301 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!81699 (validMask!0 mask!3216)))

(assert (=> d!81699 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!247302)))

(assert (= (and d!81699 c!62782) b!539860))

(assert (= (and d!81699 (not c!62782)) b!539862))

(assert (= (and b!539862 c!62780) b!539864))

(assert (= (and b!539862 (not c!62780)) b!539859))

(assert (= (and b!539859 c!62781) b!539861))

(assert (= (and b!539859 (not c!62781)) b!539863))

(declare-fun m!518973 () Bool)

(assert (=> b!539862 m!518973))

(declare-fun m!518975 () Bool)

(assert (=> b!539863 m!518975))

(declare-fun m!518977 () Bool)

(assert (=> d!81699 m!518977))

(declare-fun m!518979 () Bool)

(assert (=> d!81699 m!518979))

(assert (=> d!81699 m!518977))

(declare-fun m!518981 () Bool)

(assert (=> d!81699 m!518981))

(declare-fun m!518983 () Bool)

(assert (=> d!81699 m!518983))

(declare-fun m!518985 () Bool)

(assert (=> d!81699 m!518985))

(assert (=> d!81699 m!518881))

(assert (=> b!539749 d!81699))

(declare-fun b!539887 () Bool)

(declare-fun e!312896 () Bool)

(declare-fun call!32004 () Bool)

(assert (=> b!539887 (= e!312896 call!32004)))

(declare-fun d!81705 () Bool)

(declare-fun res!334929 () Bool)

(declare-fun e!312897 () Bool)

(assert (=> d!81705 (=> res!334929 e!312897)))

(assert (=> d!81705 (= res!334929 (bvsge #b00000000000000000000000000000000 (size!16775 a!3154)))))

(assert (=> d!81705 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!312897)))

(declare-fun bm!32001 () Bool)

(assert (=> bm!32001 (= call!32004 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!539888 () Bool)

(assert (=> b!539888 (= e!312897 e!312896)))

(declare-fun c!62792 () Bool)

(assert (=> b!539888 (= c!62792 (validKeyInArray!0 (select (arr!16411 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!539889 () Bool)

(declare-fun e!312895 () Bool)

(assert (=> b!539889 (= e!312896 e!312895)))

(declare-fun lt!247314 () (_ BitVec 64))

(assert (=> b!539889 (= lt!247314 (select (arr!16411 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16859 0))(
  ( (Unit!16860) )
))
(declare-fun lt!247315 () Unit!16859)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34148 (_ BitVec 64) (_ BitVec 32)) Unit!16859)

(assert (=> b!539889 (= lt!247315 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!247314 #b00000000000000000000000000000000))))

(assert (=> b!539889 (arrayContainsKey!0 a!3154 lt!247314 #b00000000000000000000000000000000)))

(declare-fun lt!247313 () Unit!16859)

(assert (=> b!539889 (= lt!247313 lt!247315)))

(declare-fun res!334930 () Bool)

(assert (=> b!539889 (= res!334930 (= (seekEntryOrOpen!0 (select (arr!16411 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4825 #b00000000000000000000000000000000)))))

(assert (=> b!539889 (=> (not res!334930) (not e!312895))))

(declare-fun b!539890 () Bool)

(assert (=> b!539890 (= e!312895 call!32004)))

(assert (= (and d!81705 (not res!334929)) b!539888))

(assert (= (and b!539888 c!62792) b!539889))

(assert (= (and b!539888 (not c!62792)) b!539887))

(assert (= (and b!539889 res!334930) b!539890))

(assert (= (or b!539890 b!539887) bm!32001))

(declare-fun m!519001 () Bool)

(assert (=> bm!32001 m!519001))

(declare-fun m!519003 () Bool)

(assert (=> b!539888 m!519003))

(assert (=> b!539888 m!519003))

(declare-fun m!519005 () Bool)

(assert (=> b!539888 m!519005))

(assert (=> b!539889 m!519003))

(declare-fun m!519007 () Bool)

(assert (=> b!539889 m!519007))

(declare-fun m!519009 () Bool)

(assert (=> b!539889 m!519009))

(assert (=> b!539889 m!519003))

(declare-fun m!519011 () Bool)

(assert (=> b!539889 m!519011))

(assert (=> b!539748 d!81705))

(declare-fun d!81709 () Bool)

(declare-fun res!334935 () Bool)

(declare-fun e!312902 () Bool)

(assert (=> d!81709 (=> res!334935 e!312902)))

(assert (=> d!81709 (= res!334935 (= (select (arr!16411 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!81709 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!312902)))

(declare-fun b!539895 () Bool)

(declare-fun e!312903 () Bool)

(assert (=> b!539895 (= e!312902 e!312903)))

(declare-fun res!334936 () Bool)

(assert (=> b!539895 (=> (not res!334936) (not e!312903))))

(assert (=> b!539895 (= res!334936 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16775 a!3154)))))

(declare-fun b!539896 () Bool)

(assert (=> b!539896 (= e!312903 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81709 (not res!334935)) b!539895))

(assert (= (and b!539895 res!334936) b!539896))

(assert (=> d!81709 m!519003))

(declare-fun m!519013 () Bool)

(assert (=> b!539896 m!519013))

(assert (=> b!539753 d!81709))

(declare-fun d!81711 () Bool)

(assert (=> d!81711 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!539751 d!81711))

(declare-fun b!539968 () Bool)

(declare-fun e!312947 () SeekEntryResult!4825)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539968 (= e!312947 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16411 a!3154) j!147) mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3216) (select (arr!16411 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539969 () Bool)

(assert (=> b!539969 (= e!312947 (Intermediate!4825 false (toIndex!0 (select (arr!16411 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!539970 () Bool)

(declare-fun lt!247342 () SeekEntryResult!4825)

(assert (=> b!539970 (and (bvsge (index!21526 lt!247342) #b00000000000000000000000000000000) (bvslt (index!21526 lt!247342) (size!16775 a!3154)))))

(declare-fun e!312945 () Bool)

(assert (=> b!539970 (= e!312945 (= (select (arr!16411 a!3154) (index!21526 lt!247342)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!312948 () SeekEntryResult!4825)

(declare-fun b!539971 () Bool)

(assert (=> b!539971 (= e!312948 (Intermediate!4825 true (toIndex!0 (select (arr!16411 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!539972 () Bool)

(assert (=> b!539972 (= e!312948 e!312947)))

(declare-fun c!62818 () Bool)

(declare-fun lt!247343 () (_ BitVec 64))

(assert (=> b!539972 (= c!62818 (or (= lt!247343 (select (arr!16411 a!3154) j!147)) (= (bvadd lt!247343 lt!247343) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!539973 () Bool)

(assert (=> b!539973 (and (bvsge (index!21526 lt!247342) #b00000000000000000000000000000000) (bvslt (index!21526 lt!247342) (size!16775 a!3154)))))

(declare-fun res!334963 () Bool)

(assert (=> b!539973 (= res!334963 (= (select (arr!16411 a!3154) (index!21526 lt!247342)) (select (arr!16411 a!3154) j!147)))))

(assert (=> b!539973 (=> res!334963 e!312945)))

(declare-fun e!312949 () Bool)

(assert (=> b!539973 (= e!312949 e!312945)))

(declare-fun b!539974 () Bool)

(declare-fun e!312946 () Bool)

(assert (=> b!539974 (= e!312946 e!312949)))

(declare-fun res!334964 () Bool)

(assert (=> b!539974 (= res!334964 (and ((_ is Intermediate!4825) lt!247342) (not (undefined!5637 lt!247342)) (bvslt (x!50587 lt!247342) #b01111111111111111111111111111110) (bvsge (x!50587 lt!247342) #b00000000000000000000000000000000) (bvsge (x!50587 lt!247342) #b00000000000000000000000000000000)))))

(assert (=> b!539974 (=> (not res!334964) (not e!312949))))

(declare-fun d!81713 () Bool)

(assert (=> d!81713 e!312946))

(declare-fun c!62816 () Bool)

(assert (=> d!81713 (= c!62816 (and ((_ is Intermediate!4825) lt!247342) (undefined!5637 lt!247342)))))

(assert (=> d!81713 (= lt!247342 e!312948)))

(declare-fun c!62817 () Bool)

(assert (=> d!81713 (= c!62817 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!81713 (= lt!247343 (select (arr!16411 a!3154) (toIndex!0 (select (arr!16411 a!3154) j!147) mask!3216)))))

(assert (=> d!81713 (validMask!0 mask!3216)))

(assert (=> d!81713 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16411 a!3154) j!147) mask!3216) (select (arr!16411 a!3154) j!147) a!3154 mask!3216) lt!247342)))

(declare-fun b!539975 () Bool)

(assert (=> b!539975 (= e!312946 (bvsge (x!50587 lt!247342) #b01111111111111111111111111111110))))

(declare-fun b!539976 () Bool)

(assert (=> b!539976 (and (bvsge (index!21526 lt!247342) #b00000000000000000000000000000000) (bvslt (index!21526 lt!247342) (size!16775 a!3154)))))

(declare-fun res!334965 () Bool)

(assert (=> b!539976 (= res!334965 (= (select (arr!16411 a!3154) (index!21526 lt!247342)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!539976 (=> res!334965 e!312945)))

(assert (= (and d!81713 c!62817) b!539971))

(assert (= (and d!81713 (not c!62817)) b!539972))

(assert (= (and b!539972 c!62818) b!539969))

(assert (= (and b!539972 (not c!62818)) b!539968))

(assert (= (and d!81713 c!62816) b!539975))

(assert (= (and d!81713 (not c!62816)) b!539974))

(assert (= (and b!539974 res!334964) b!539973))

(assert (= (and b!539973 (not res!334963)) b!539976))

(assert (= (and b!539976 (not res!334965)) b!539970))

(assert (=> b!539968 m!518889))

(declare-fun m!519023 () Bool)

(assert (=> b!539968 m!519023))

(assert (=> b!539968 m!519023))

(assert (=> b!539968 m!518877))

(declare-fun m!519025 () Bool)

(assert (=> b!539968 m!519025))

(assert (=> d!81713 m!518889))

(declare-fun m!519027 () Bool)

(assert (=> d!81713 m!519027))

(assert (=> d!81713 m!518881))

(declare-fun m!519029 () Bool)

(assert (=> b!539976 m!519029))

(assert (=> b!539973 m!519029))

(assert (=> b!539970 m!519029))

(assert (=> b!539752 d!81713))

(declare-fun d!81725 () Bool)

(declare-fun lt!247356 () (_ BitVec 32))

(declare-fun lt!247355 () (_ BitVec 32))

(assert (=> d!81725 (= lt!247356 (bvmul (bvxor lt!247355 (bvlshr lt!247355 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81725 (= lt!247355 ((_ extract 31 0) (bvand (bvxor (select (arr!16411 a!3154) j!147) (bvlshr (select (arr!16411 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81725 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!334968 (let ((h!11383 ((_ extract 31 0) (bvand (bvxor (select (arr!16411 a!3154) j!147) (bvlshr (select (arr!16411 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!50594 (bvmul (bvxor h!11383 (bvlshr h!11383 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!50594 (bvlshr x!50594 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!334968 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!334968 #b00000000000000000000000000000000))))))

(assert (=> d!81725 (= (toIndex!0 (select (arr!16411 a!3154) j!147) mask!3216) (bvand (bvxor lt!247356 (bvlshr lt!247356 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!539752 d!81725))

(declare-fun e!312971 () SeekEntryResult!4825)

(declare-fun b!540005 () Bool)

(assert (=> b!540005 (= e!312971 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 (bvadd x!1030 #b00000000000000000000000000000001) mask!3216) (select (arr!16411 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540006 () Bool)

(assert (=> b!540006 (= e!312971 (Intermediate!4825 false index!1177 x!1030))))

(declare-fun b!540007 () Bool)

(declare-fun lt!247357 () SeekEntryResult!4825)

(assert (=> b!540007 (and (bvsge (index!21526 lt!247357) #b00000000000000000000000000000000) (bvslt (index!21526 lt!247357) (size!16775 a!3154)))))

(declare-fun e!312969 () Bool)

(assert (=> b!540007 (= e!312969 (= (select (arr!16411 a!3154) (index!21526 lt!247357)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!540008 () Bool)

(declare-fun e!312972 () SeekEntryResult!4825)

(assert (=> b!540008 (= e!312972 (Intermediate!4825 true index!1177 x!1030))))

(declare-fun b!540009 () Bool)

(assert (=> b!540009 (= e!312972 e!312971)))

(declare-fun lt!247358 () (_ BitVec 64))

(declare-fun c!62828 () Bool)

(assert (=> b!540009 (= c!62828 (or (= lt!247358 (select (arr!16411 a!3154) j!147)) (= (bvadd lt!247358 lt!247358) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!540010 () Bool)

(assert (=> b!540010 (and (bvsge (index!21526 lt!247357) #b00000000000000000000000000000000) (bvslt (index!21526 lt!247357) (size!16775 a!3154)))))

(declare-fun res!334982 () Bool)

(assert (=> b!540010 (= res!334982 (= (select (arr!16411 a!3154) (index!21526 lt!247357)) (select (arr!16411 a!3154) j!147)))))

(assert (=> b!540010 (=> res!334982 e!312969)))

(declare-fun e!312973 () Bool)

(assert (=> b!540010 (= e!312973 e!312969)))

(declare-fun b!540011 () Bool)

(declare-fun e!312970 () Bool)

(assert (=> b!540011 (= e!312970 e!312973)))

(declare-fun res!334983 () Bool)

(assert (=> b!540011 (= res!334983 (and ((_ is Intermediate!4825) lt!247357) (not (undefined!5637 lt!247357)) (bvslt (x!50587 lt!247357) #b01111111111111111111111111111110) (bvsge (x!50587 lt!247357) #b00000000000000000000000000000000) (bvsge (x!50587 lt!247357) x!1030)))))

(assert (=> b!540011 (=> (not res!334983) (not e!312973))))

(declare-fun d!81735 () Bool)

(assert (=> d!81735 e!312970))

(declare-fun c!62826 () Bool)

(assert (=> d!81735 (= c!62826 (and ((_ is Intermediate!4825) lt!247357) (undefined!5637 lt!247357)))))

(assert (=> d!81735 (= lt!247357 e!312972)))

(declare-fun c!62827 () Bool)

(assert (=> d!81735 (= c!62827 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!81735 (= lt!247358 (select (arr!16411 a!3154) index!1177))))

(assert (=> d!81735 (validMask!0 mask!3216)))

(assert (=> d!81735 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16411 a!3154) j!147) a!3154 mask!3216) lt!247357)))

(declare-fun b!540012 () Bool)

(assert (=> b!540012 (= e!312970 (bvsge (x!50587 lt!247357) #b01111111111111111111111111111110))))

(declare-fun b!540013 () Bool)

(assert (=> b!540013 (and (bvsge (index!21526 lt!247357) #b00000000000000000000000000000000) (bvslt (index!21526 lt!247357) (size!16775 a!3154)))))

(declare-fun res!334984 () Bool)

(assert (=> b!540013 (= res!334984 (= (select (arr!16411 a!3154) (index!21526 lt!247357)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!540013 (=> res!334984 e!312969)))

(assert (= (and d!81735 c!62827) b!540008))

(assert (= (and d!81735 (not c!62827)) b!540009))

(assert (= (and b!540009 c!62828) b!540006))

(assert (= (and b!540009 (not c!62828)) b!540005))

(assert (= (and d!81735 c!62826) b!540012))

(assert (= (and d!81735 (not c!62826)) b!540011))

(assert (= (and b!540011 res!334983) b!540010))

(assert (= (and b!540010 (not res!334982)) b!540013))

(assert (= (and b!540013 (not res!334984)) b!540007))

(declare-fun m!519059 () Bool)

(assert (=> b!540005 m!519059))

(assert (=> b!540005 m!519059))

(assert (=> b!540005 m!518877))

(declare-fun m!519061 () Bool)

(assert (=> b!540005 m!519061))

(assert (=> d!81735 m!518885))

(assert (=> d!81735 m!518881))

(declare-fun m!519063 () Bool)

(assert (=> b!540013 m!519063))

(assert (=> b!540010 m!519063))

(assert (=> b!540007 m!519063))

(assert (=> b!539757 d!81735))

(declare-fun b!540039 () Bool)

(declare-fun e!312995 () Bool)

(declare-fun e!312996 () Bool)

(assert (=> b!540039 (= e!312995 e!312996)))

(declare-fun res!335002 () Bool)

(assert (=> b!540039 (=> (not res!335002) (not e!312996))))

(declare-fun e!312993 () Bool)

(assert (=> b!540039 (= res!335002 (not e!312993))))

(declare-fun res!335000 () Bool)

(assert (=> b!540039 (=> (not res!335000) (not e!312993))))

(assert (=> b!540039 (= res!335000 (validKeyInArray!0 (select (arr!16411 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!540040 () Bool)

(declare-fun e!312994 () Bool)

(declare-fun call!32010 () Bool)

(assert (=> b!540040 (= e!312994 call!32010)))

(declare-fun d!81737 () Bool)

(declare-fun res!335001 () Bool)

(assert (=> d!81737 (=> res!335001 e!312995)))

(assert (=> d!81737 (= res!335001 (bvsge #b00000000000000000000000000000000 (size!16775 a!3154)))))

(assert (=> d!81737 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10434) e!312995)))

(declare-fun b!540041 () Bool)

(assert (=> b!540041 (= e!312996 e!312994)))

(declare-fun c!62834 () Bool)

(assert (=> b!540041 (= c!62834 (validKeyInArray!0 (select (arr!16411 a!3154) #b00000000000000000000000000000000)))))

(declare-fun bm!32007 () Bool)

(assert (=> bm!32007 (= call!32010 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62834 (Cons!10433 (select (arr!16411 a!3154) #b00000000000000000000000000000000) Nil!10434) Nil!10434)))))

(declare-fun b!540042 () Bool)

(assert (=> b!540042 (= e!312994 call!32010)))

(declare-fun b!540043 () Bool)

(declare-fun contains!2772 (List!10437 (_ BitVec 64)) Bool)

(assert (=> b!540043 (= e!312993 (contains!2772 Nil!10434 (select (arr!16411 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!81737 (not res!335001)) b!540039))

(assert (= (and b!540039 res!335000) b!540043))

(assert (= (and b!540039 res!335002) b!540041))

(assert (= (and b!540041 c!62834) b!540040))

(assert (= (and b!540041 (not c!62834)) b!540042))

(assert (= (or b!540040 b!540042) bm!32007))

(assert (=> b!540039 m!519003))

(assert (=> b!540039 m!519003))

(assert (=> b!540039 m!519005))

(assert (=> b!540041 m!519003))

(assert (=> b!540041 m!519003))

(assert (=> b!540041 m!519005))

(assert (=> bm!32007 m!519003))

(declare-fun m!519075 () Bool)

(assert (=> bm!32007 m!519075))

(assert (=> b!540043 m!519003))

(assert (=> b!540043 m!519003))

(declare-fun m!519077 () Bool)

(assert (=> b!540043 m!519077))

(assert (=> b!539755 d!81737))

(check-sat (not b!540041) (not bm!32001) (not b!539889) (not b!540005) (not b!539863) (not d!81699) (not b!540043) (not b!539968) (not b!540039) (not b!539888) (not bm!32007) (not b!539896) (not d!81713) (not d!81735))
(check-sat)
