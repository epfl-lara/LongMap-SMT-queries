; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68072 () Bool)

(assert start!68072)

(declare-fun b!791834 () Bool)

(declare-fun res!536712 () Bool)

(declare-fun e!439952 () Bool)

(assert (=> b!791834 (=> (not res!536712) (not e!439952))))

(declare-datatypes ((array!42994 0))(
  ( (array!42995 (arr!20582 (Array (_ BitVec 32) (_ BitVec 64))) (size!21003 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42994)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791834 (= res!536712 (validKeyInArray!0 (select (arr!20582 a!3170) j!153)))))

(declare-fun b!791835 () Bool)

(declare-fun res!536714 () Bool)

(assert (=> b!791835 (=> (not res!536714) (not e!439952))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!791835 (= res!536714 (and (= (size!21003 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21003 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21003 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!536715 () Bool)

(assert (=> start!68072 (=> (not res!536715) (not e!439952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68072 (= res!536715 (validMask!0 mask!3266))))

(assert (=> start!68072 e!439952))

(assert (=> start!68072 true))

(declare-fun array_inv!16465 (array!42994) Bool)

(assert (=> start!68072 (array_inv!16465 a!3170)))

(declare-fun b!791836 () Bool)

(declare-fun e!439954 () Bool)

(assert (=> b!791836 (= e!439954 (and (bvsle #b00000000000000000000000000000000 (size!21003 a!3170)) (bvsge (size!21003 a!3170) #b01111111111111111111111111111111)))))

(declare-fun b!791837 () Bool)

(assert (=> b!791837 (= e!439952 e!439954)))

(declare-fun res!536710 () Bool)

(assert (=> b!791837 (=> (not res!536710) (not e!439954))))

(declare-datatypes ((SeekEntryResult!8170 0))(
  ( (MissingZero!8170 (index!35048 (_ BitVec 32))) (Found!8170 (index!35049 (_ BitVec 32))) (Intermediate!8170 (undefined!8982 Bool) (index!35050 (_ BitVec 32)) (x!66011 (_ BitVec 32))) (Undefined!8170) (MissingVacant!8170 (index!35051 (_ BitVec 32))) )
))
(declare-fun lt!353120 () SeekEntryResult!8170)

(assert (=> b!791837 (= res!536710 (or (= lt!353120 (MissingZero!8170 i!1163)) (= lt!353120 (MissingVacant!8170 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42994 (_ BitVec 32)) SeekEntryResult!8170)

(assert (=> b!791837 (= lt!353120 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!791838 () Bool)

(declare-fun res!536711 () Bool)

(assert (=> b!791838 (=> (not res!536711) (not e!439952))))

(declare-fun arrayContainsKey!0 (array!42994 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791838 (= res!536711 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!791839 () Bool)

(declare-fun res!536709 () Bool)

(assert (=> b!791839 (=> (not res!536709) (not e!439952))))

(assert (=> b!791839 (= res!536709 (validKeyInArray!0 k0!2044))))

(declare-fun b!791840 () Bool)

(declare-fun res!536713 () Bool)

(assert (=> b!791840 (=> (not res!536713) (not e!439954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42994 (_ BitVec 32)) Bool)

(assert (=> b!791840 (= res!536713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68072 res!536715) b!791835))

(assert (= (and b!791835 res!536714) b!791834))

(assert (= (and b!791834 res!536712) b!791839))

(assert (= (and b!791839 res!536709) b!791838))

(assert (= (and b!791838 res!536711) b!791837))

(assert (= (and b!791837 res!536710) b!791840))

(assert (= (and b!791840 res!536713) b!791836))

(declare-fun m!732003 () Bool)

(assert (=> start!68072 m!732003))

(declare-fun m!732005 () Bool)

(assert (=> start!68072 m!732005))

(declare-fun m!732007 () Bool)

(assert (=> b!791834 m!732007))

(assert (=> b!791834 m!732007))

(declare-fun m!732009 () Bool)

(assert (=> b!791834 m!732009))

(declare-fun m!732011 () Bool)

(assert (=> b!791840 m!732011))

(declare-fun m!732013 () Bool)

(assert (=> b!791837 m!732013))

(declare-fun m!732015 () Bool)

(assert (=> b!791839 m!732015))

(declare-fun m!732017 () Bool)

(assert (=> b!791838 m!732017))

(check-sat (not start!68072) (not b!791838) (not b!791834) (not b!791837) (not b!791839) (not b!791840))
(check-sat)
(get-model)

(declare-fun d!102939 () Bool)

(assert (=> d!102939 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!791839 d!102939))

(declare-fun d!102941 () Bool)

(declare-fun res!536762 () Bool)

(declare-fun e!439977 () Bool)

(assert (=> d!102941 (=> res!536762 e!439977)))

(assert (=> d!102941 (= res!536762 (= (select (arr!20582 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!102941 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!439977)))

(declare-fun b!791887 () Bool)

(declare-fun e!439978 () Bool)

(assert (=> b!791887 (= e!439977 e!439978)))

(declare-fun res!536763 () Bool)

(assert (=> b!791887 (=> (not res!536763) (not e!439978))))

(assert (=> b!791887 (= res!536763 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21003 a!3170)))))

(declare-fun b!791888 () Bool)

(assert (=> b!791888 (= e!439978 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102941 (not res!536762)) b!791887))

(assert (= (and b!791887 res!536763) b!791888))

(declare-fun m!732051 () Bool)

(assert (=> d!102941 m!732051))

(declare-fun m!732053 () Bool)

(assert (=> b!791888 m!732053))

(assert (=> b!791838 d!102941))

(declare-fun b!791913 () Bool)

(declare-fun e!439995 () SeekEntryResult!8170)

(declare-fun e!439996 () SeekEntryResult!8170)

(assert (=> b!791913 (= e!439995 e!439996)))

(declare-fun lt!353142 () (_ BitVec 64))

(declare-fun lt!353144 () SeekEntryResult!8170)

(assert (=> b!791913 (= lt!353142 (select (arr!20582 a!3170) (index!35050 lt!353144)))))

(declare-fun c!87984 () Bool)

(assert (=> b!791913 (= c!87984 (= lt!353142 k0!2044))))

(declare-fun b!791914 () Bool)

(declare-fun c!87982 () Bool)

(assert (=> b!791914 (= c!87982 (= lt!353142 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!439994 () SeekEntryResult!8170)

(assert (=> b!791914 (= e!439996 e!439994)))

(declare-fun b!791915 () Bool)

(assert (=> b!791915 (= e!439994 (MissingZero!8170 (index!35050 lt!353144)))))

(declare-fun b!791916 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42994 (_ BitVec 32)) SeekEntryResult!8170)

(assert (=> b!791916 (= e!439994 (seekKeyOrZeroReturnVacant!0 (x!66011 lt!353144) (index!35050 lt!353144) (index!35050 lt!353144) k0!2044 a!3170 mask!3266))))

(declare-fun b!791917 () Bool)

(assert (=> b!791917 (= e!439995 Undefined!8170)))

(declare-fun d!102943 () Bool)

(declare-fun lt!353143 () SeekEntryResult!8170)

(get-info :version)

(assert (=> d!102943 (and (or ((_ is Undefined!8170) lt!353143) (not ((_ is Found!8170) lt!353143)) (and (bvsge (index!35049 lt!353143) #b00000000000000000000000000000000) (bvslt (index!35049 lt!353143) (size!21003 a!3170)))) (or ((_ is Undefined!8170) lt!353143) ((_ is Found!8170) lt!353143) (not ((_ is MissingZero!8170) lt!353143)) (and (bvsge (index!35048 lt!353143) #b00000000000000000000000000000000) (bvslt (index!35048 lt!353143) (size!21003 a!3170)))) (or ((_ is Undefined!8170) lt!353143) ((_ is Found!8170) lt!353143) ((_ is MissingZero!8170) lt!353143) (not ((_ is MissingVacant!8170) lt!353143)) (and (bvsge (index!35051 lt!353143) #b00000000000000000000000000000000) (bvslt (index!35051 lt!353143) (size!21003 a!3170)))) (or ((_ is Undefined!8170) lt!353143) (ite ((_ is Found!8170) lt!353143) (= (select (arr!20582 a!3170) (index!35049 lt!353143)) k0!2044) (ite ((_ is MissingZero!8170) lt!353143) (= (select (arr!20582 a!3170) (index!35048 lt!353143)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8170) lt!353143) (= (select (arr!20582 a!3170) (index!35051 lt!353143)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102943 (= lt!353143 e!439995)))

(declare-fun c!87983 () Bool)

(assert (=> d!102943 (= c!87983 (and ((_ is Intermediate!8170) lt!353144) (undefined!8982 lt!353144)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42994 (_ BitVec 32)) SeekEntryResult!8170)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!102943 (= lt!353144 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!102943 (validMask!0 mask!3266)))

(assert (=> d!102943 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!353143)))

(declare-fun b!791918 () Bool)

(assert (=> b!791918 (= e!439996 (Found!8170 (index!35050 lt!353144)))))

(assert (= (and d!102943 c!87983) b!791917))

(assert (= (and d!102943 (not c!87983)) b!791913))

(assert (= (and b!791913 c!87984) b!791918))

(assert (= (and b!791913 (not c!87984)) b!791914))

(assert (= (and b!791914 c!87982) b!791915))

(assert (= (and b!791914 (not c!87982)) b!791916))

(declare-fun m!732067 () Bool)

(assert (=> b!791913 m!732067))

(declare-fun m!732069 () Bool)

(assert (=> b!791916 m!732069))

(declare-fun m!732071 () Bool)

(assert (=> d!102943 m!732071))

(declare-fun m!732073 () Bool)

(assert (=> d!102943 m!732073))

(declare-fun m!732075 () Bool)

(assert (=> d!102943 m!732075))

(assert (=> d!102943 m!732071))

(declare-fun m!732077 () Bool)

(assert (=> d!102943 m!732077))

(declare-fun m!732079 () Bool)

(assert (=> d!102943 m!732079))

(assert (=> d!102943 m!732003))

(assert (=> b!791837 d!102943))

(declare-fun b!791937 () Bool)

(declare-fun e!440010 () Bool)

(declare-fun e!440011 () Bool)

(assert (=> b!791937 (= e!440010 e!440011)))

(declare-fun c!87989 () Bool)

(assert (=> b!791937 (= c!87989 (validKeyInArray!0 (select (arr!20582 a!3170) #b00000000000000000000000000000000)))))

(declare-fun d!102953 () Bool)

(declare-fun res!536778 () Bool)

(assert (=> d!102953 (=> res!536778 e!440010)))

(assert (=> d!102953 (= res!536778 (bvsge #b00000000000000000000000000000000 (size!21003 a!3170)))))

(assert (=> d!102953 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!440010)))

(declare-fun b!791938 () Bool)

(declare-fun e!440009 () Bool)

(declare-fun call!35301 () Bool)

(assert (=> b!791938 (= e!440009 call!35301)))

(declare-fun b!791939 () Bool)

(assert (=> b!791939 (= e!440011 call!35301)))

(declare-fun bm!35298 () Bool)

(assert (=> bm!35298 (= call!35301 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!791940 () Bool)

(assert (=> b!791940 (= e!440011 e!440009)))

(declare-fun lt!353161 () (_ BitVec 64))

(assert (=> b!791940 (= lt!353161 (select (arr!20582 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27412 0))(
  ( (Unit!27413) )
))
(declare-fun lt!353162 () Unit!27412)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42994 (_ BitVec 64) (_ BitVec 32)) Unit!27412)

(assert (=> b!791940 (= lt!353162 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!353161 #b00000000000000000000000000000000))))

(assert (=> b!791940 (arrayContainsKey!0 a!3170 lt!353161 #b00000000000000000000000000000000)))

(declare-fun lt!353163 () Unit!27412)

(assert (=> b!791940 (= lt!353163 lt!353162)))

(declare-fun res!536779 () Bool)

(assert (=> b!791940 (= res!536779 (= (seekEntryOrOpen!0 (select (arr!20582 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8170 #b00000000000000000000000000000000)))))

(assert (=> b!791940 (=> (not res!536779) (not e!440009))))

(assert (= (and d!102953 (not res!536778)) b!791937))

(assert (= (and b!791937 c!87989) b!791940))

(assert (= (and b!791937 (not c!87989)) b!791939))

(assert (= (and b!791940 res!536779) b!791938))

(assert (= (or b!791938 b!791939) bm!35298))

(assert (=> b!791937 m!732051))

(assert (=> b!791937 m!732051))

(declare-fun m!732081 () Bool)

(assert (=> b!791937 m!732081))

(declare-fun m!732083 () Bool)

(assert (=> bm!35298 m!732083))

(assert (=> b!791940 m!732051))

(declare-fun m!732085 () Bool)

(assert (=> b!791940 m!732085))

(declare-fun m!732087 () Bool)

(assert (=> b!791940 m!732087))

(assert (=> b!791940 m!732051))

(declare-fun m!732089 () Bool)

(assert (=> b!791940 m!732089))

(assert (=> b!791840 d!102953))

(declare-fun d!102955 () Bool)

(assert (=> d!102955 (= (validKeyInArray!0 (select (arr!20582 a!3170) j!153)) (and (not (= (select (arr!20582 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20582 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!791834 d!102955))

(declare-fun d!102957 () Bool)

(assert (=> d!102957 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!68072 d!102957))

(declare-fun d!102963 () Bool)

(assert (=> d!102963 (= (array_inv!16465 a!3170) (bvsge (size!21003 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!68072 d!102963))

(check-sat (not b!791916) (not bm!35298) (not d!102943) (not b!791940) (not b!791937) (not b!791888))
(check-sat)
