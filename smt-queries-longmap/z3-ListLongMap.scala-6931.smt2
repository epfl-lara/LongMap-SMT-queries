; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87200 () Bool)

(assert start!87200)

(declare-fun b!1011035 () Bool)

(declare-fun res!679218 () Bool)

(declare-fun e!568770 () Bool)

(assert (=> b!1011035 (=> (not res!679218) (not e!568770))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1011035 (= res!679218 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1011036 () Bool)

(declare-fun res!679220 () Bool)

(declare-fun e!568774 () Bool)

(assert (=> b!1011036 (=> (not res!679220) (not e!568774))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1011036 (= res!679220 (validKeyInArray!0 k0!2224))))

(declare-fun b!1011037 () Bool)

(declare-fun e!568768 () Bool)

(assert (=> b!1011037 (= e!568774 e!568768)))

(declare-fun res!679224 () Bool)

(assert (=> b!1011037 (=> (not res!679224) (not e!568768))))

(declare-datatypes ((SeekEntryResult!9579 0))(
  ( (MissingZero!9579 (index!40687 (_ BitVec 32))) (Found!9579 (index!40688 (_ BitVec 32))) (Intermediate!9579 (undefined!10391 Bool) (index!40689 (_ BitVec 32)) (x!88096 (_ BitVec 32))) (Undefined!9579) (MissingVacant!9579 (index!40690 (_ BitVec 32))) )
))
(declare-fun lt!446863 () SeekEntryResult!9579)

(assert (=> b!1011037 (= res!679224 (or (= lt!446863 (MissingVacant!9579 i!1194)) (= lt!446863 (MissingZero!9579 i!1194))))))

(declare-datatypes ((array!63661 0))(
  ( (array!63662 (arr!30647 (Array (_ BitVec 32) (_ BitVec 64))) (size!31149 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63661)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63661 (_ BitVec 32)) SeekEntryResult!9579)

(assert (=> b!1011037 (= lt!446863 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1011038 () Bool)

(declare-fun e!568772 () Bool)

(declare-fun e!568771 () Bool)

(assert (=> b!1011038 (= e!568772 e!568771)))

(declare-fun res!679217 () Bool)

(assert (=> b!1011038 (=> (not res!679217) (not e!568771))))

(declare-fun lt!446866 () SeekEntryResult!9579)

(declare-fun lt!446861 () SeekEntryResult!9579)

(assert (=> b!1011038 (= res!679217 (= lt!446866 lt!446861))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!446867 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63661 (_ BitVec 32)) SeekEntryResult!9579)

(assert (=> b!1011038 (= lt!446866 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446867 (select (arr!30647 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011039 () Bool)

(declare-fun res!679219 () Bool)

(assert (=> b!1011039 (=> (not res!679219) (not e!568774))))

(assert (=> b!1011039 (= res!679219 (validKeyInArray!0 (select (arr!30647 a!3219) j!170)))))

(declare-fun b!1011040 () Bool)

(declare-fun res!679227 () Bool)

(assert (=> b!1011040 (=> (not res!679227) (not e!568774))))

(assert (=> b!1011040 (= res!679227 (and (= (size!31149 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31149 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31149 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1011041 () Bool)

(declare-fun res!679216 () Bool)

(assert (=> b!1011041 (=> (not res!679216) (not e!568774))))

(declare-fun arrayContainsKey!0 (array!63661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1011041 (= res!679216 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1011042 () Bool)

(declare-fun res!679228 () Bool)

(assert (=> b!1011042 (=> (not res!679228) (not e!568770))))

(declare-fun lt!446862 () array!63661)

(declare-fun lt!446865 () SeekEntryResult!9579)

(declare-fun lt!446868 () (_ BitVec 64))

(assert (=> b!1011042 (= res!679228 (not (= lt!446865 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446868 lt!446862 mask!3464))))))

(declare-fun b!1011044 () Bool)

(declare-fun res!679226 () Bool)

(assert (=> b!1011044 (=> (not res!679226) (not e!568768))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63661 (_ BitVec 32)) Bool)

(assert (=> b!1011044 (= res!679226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1011045 () Bool)

(declare-fun e!568767 () Bool)

(assert (=> b!1011045 (= e!568767 e!568770)))

(declare-fun res!679221 () Bool)

(assert (=> b!1011045 (=> (not res!679221) (not e!568770))))

(declare-fun lt!446864 () SeekEntryResult!9579)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011045 (= res!679221 (not (= lt!446864 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446868 mask!3464) lt!446868 lt!446862 mask!3464))))))

(assert (=> b!1011045 (= lt!446868 (select (store (arr!30647 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1011045 (= lt!446862 (array!63662 (store (arr!30647 a!3219) i!1194 k0!2224) (size!31149 a!3219)))))

(declare-fun b!1011046 () Bool)

(declare-fun res!679223 () Bool)

(assert (=> b!1011046 (=> (not res!679223) (not e!568768))))

(declare-datatypes ((List!21323 0))(
  ( (Nil!21320) (Cons!21319 (h!22514 (_ BitVec 64)) (t!30324 List!21323)) )
))
(declare-fun arrayNoDuplicates!0 (array!63661 (_ BitVec 32) List!21323) Bool)

(assert (=> b!1011046 (= res!679223 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21320))))

(declare-fun b!1011047 () Bool)

(declare-fun res!679229 () Bool)

(assert (=> b!1011047 (=> (not res!679229) (not e!568768))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1011047 (= res!679229 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31149 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31149 a!3219))))))

(declare-fun b!1011048 () Bool)

(declare-fun e!568769 () Bool)

(assert (=> b!1011048 (= e!568769 e!568767)))

(declare-fun res!679222 () Bool)

(assert (=> b!1011048 (=> (not res!679222) (not e!568767))))

(assert (=> b!1011048 (= res!679222 (= lt!446865 lt!446861))))

(assert (=> b!1011048 (= lt!446865 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30647 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011049 () Bool)

(assert (=> b!1011049 (= e!568771 (= lt!446866 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446867 lt!446868 lt!446862 mask!3464)))))

(declare-fun b!1011050 () Bool)

(assert (=> b!1011050 (= e!568770 e!568772)))

(declare-fun res!679215 () Bool)

(assert (=> b!1011050 (=> (not res!679215) (not e!568772))))

(assert (=> b!1011050 (= res!679215 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!446867 #b00000000000000000000000000000000) (bvslt lt!446867 (size!31149 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011050 (= lt!446867 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1011043 () Bool)

(assert (=> b!1011043 (= e!568768 e!568769)))

(declare-fun res!679230 () Bool)

(assert (=> b!1011043 (=> (not res!679230) (not e!568769))))

(assert (=> b!1011043 (= res!679230 (= lt!446864 lt!446861))))

(assert (=> b!1011043 (= lt!446861 (Intermediate!9579 false resIndex!38 resX!38))))

(assert (=> b!1011043 (= lt!446864 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30647 a!3219) j!170) mask!3464) (select (arr!30647 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!679225 () Bool)

(assert (=> start!87200 (=> (not res!679225) (not e!568774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87200 (= res!679225 (validMask!0 mask!3464))))

(assert (=> start!87200 e!568774))

(declare-fun array_inv!23771 (array!63661) Bool)

(assert (=> start!87200 (array_inv!23771 a!3219)))

(assert (=> start!87200 true))

(assert (= (and start!87200 res!679225) b!1011040))

(assert (= (and b!1011040 res!679227) b!1011039))

(assert (= (and b!1011039 res!679219) b!1011036))

(assert (= (and b!1011036 res!679220) b!1011041))

(assert (= (and b!1011041 res!679216) b!1011037))

(assert (= (and b!1011037 res!679224) b!1011044))

(assert (= (and b!1011044 res!679226) b!1011046))

(assert (= (and b!1011046 res!679223) b!1011047))

(assert (= (and b!1011047 res!679229) b!1011043))

(assert (= (and b!1011043 res!679230) b!1011048))

(assert (= (and b!1011048 res!679222) b!1011045))

(assert (= (and b!1011045 res!679221) b!1011042))

(assert (= (and b!1011042 res!679228) b!1011035))

(assert (= (and b!1011035 res!679218) b!1011050))

(assert (= (and b!1011050 res!679215) b!1011038))

(assert (= (and b!1011038 res!679217) b!1011049))

(declare-fun m!935185 () Bool)

(assert (=> start!87200 m!935185))

(declare-fun m!935187 () Bool)

(assert (=> start!87200 m!935187))

(declare-fun m!935189 () Bool)

(assert (=> b!1011044 m!935189))

(declare-fun m!935191 () Bool)

(assert (=> b!1011048 m!935191))

(assert (=> b!1011048 m!935191))

(declare-fun m!935193 () Bool)

(assert (=> b!1011048 m!935193))

(declare-fun m!935195 () Bool)

(assert (=> b!1011041 m!935195))

(declare-fun m!935197 () Bool)

(assert (=> b!1011046 m!935197))

(assert (=> b!1011038 m!935191))

(assert (=> b!1011038 m!935191))

(declare-fun m!935199 () Bool)

(assert (=> b!1011038 m!935199))

(declare-fun m!935201 () Bool)

(assert (=> b!1011036 m!935201))

(declare-fun m!935203 () Bool)

(assert (=> b!1011042 m!935203))

(declare-fun m!935205 () Bool)

(assert (=> b!1011049 m!935205))

(declare-fun m!935207 () Bool)

(assert (=> b!1011050 m!935207))

(assert (=> b!1011043 m!935191))

(assert (=> b!1011043 m!935191))

(declare-fun m!935209 () Bool)

(assert (=> b!1011043 m!935209))

(assert (=> b!1011043 m!935209))

(assert (=> b!1011043 m!935191))

(declare-fun m!935211 () Bool)

(assert (=> b!1011043 m!935211))

(declare-fun m!935213 () Bool)

(assert (=> b!1011037 m!935213))

(assert (=> b!1011039 m!935191))

(assert (=> b!1011039 m!935191))

(declare-fun m!935215 () Bool)

(assert (=> b!1011039 m!935215))

(declare-fun m!935217 () Bool)

(assert (=> b!1011045 m!935217))

(assert (=> b!1011045 m!935217))

(declare-fun m!935219 () Bool)

(assert (=> b!1011045 m!935219))

(declare-fun m!935221 () Bool)

(assert (=> b!1011045 m!935221))

(declare-fun m!935223 () Bool)

(assert (=> b!1011045 m!935223))

(check-sat (not b!1011044) (not b!1011046) (not b!1011050) (not b!1011048) (not b!1011041) (not b!1011038) (not start!87200) (not b!1011037) (not b!1011049) (not b!1011039) (not b!1011036) (not b!1011043) (not b!1011042) (not b!1011045))
(check-sat)
(get-model)

(declare-fun d!120085 () Bool)

(assert (=> d!120085 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1011036 d!120085))

(declare-fun bm!42423 () Bool)

(declare-fun call!42426 () Bool)

(declare-fun c!102072 () Bool)

(assert (=> bm!42423 (= call!42426 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!102072 (Cons!21319 (select (arr!30647 a!3219) #b00000000000000000000000000000000) Nil!21320) Nil!21320)))))

(declare-fun b!1011110 () Bool)

(declare-fun e!568809 () Bool)

(declare-fun e!568807 () Bool)

(assert (=> b!1011110 (= e!568809 e!568807)))

(assert (=> b!1011110 (= c!102072 (validKeyInArray!0 (select (arr!30647 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1011111 () Bool)

(declare-fun e!568808 () Bool)

(assert (=> b!1011111 (= e!568808 e!568809)))

(declare-fun res!679285 () Bool)

(assert (=> b!1011111 (=> (not res!679285) (not e!568809))))

(declare-fun e!568810 () Bool)

(assert (=> b!1011111 (= res!679285 (not e!568810))))

(declare-fun res!679286 () Bool)

(assert (=> b!1011111 (=> (not res!679286) (not e!568810))))

(assert (=> b!1011111 (= res!679286 (validKeyInArray!0 (select (arr!30647 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1011112 () Bool)

(assert (=> b!1011112 (= e!568807 call!42426)))

(declare-fun b!1011113 () Bool)

(declare-fun contains!5897 (List!21323 (_ BitVec 64)) Bool)

(assert (=> b!1011113 (= e!568810 (contains!5897 Nil!21320 (select (arr!30647 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!120087 () Bool)

(declare-fun res!679287 () Bool)

(assert (=> d!120087 (=> res!679287 e!568808)))

(assert (=> d!120087 (= res!679287 (bvsge #b00000000000000000000000000000000 (size!31149 a!3219)))))

(assert (=> d!120087 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21320) e!568808)))

(declare-fun b!1011109 () Bool)

(assert (=> b!1011109 (= e!568807 call!42426)))

(assert (= (and d!120087 (not res!679287)) b!1011111))

(assert (= (and b!1011111 res!679286) b!1011113))

(assert (= (and b!1011111 res!679285) b!1011110))

(assert (= (and b!1011110 c!102072) b!1011112))

(assert (= (and b!1011110 (not c!102072)) b!1011109))

(assert (= (or b!1011112 b!1011109) bm!42423))

(declare-fun m!935265 () Bool)

(assert (=> bm!42423 m!935265))

(declare-fun m!935267 () Bool)

(assert (=> bm!42423 m!935267))

(assert (=> b!1011110 m!935265))

(assert (=> b!1011110 m!935265))

(declare-fun m!935269 () Bool)

(assert (=> b!1011110 m!935269))

(assert (=> b!1011111 m!935265))

(assert (=> b!1011111 m!935265))

(assert (=> b!1011111 m!935269))

(assert (=> b!1011113 m!935265))

(assert (=> b!1011113 m!935265))

(declare-fun m!935271 () Bool)

(assert (=> b!1011113 m!935271))

(assert (=> b!1011046 d!120087))

(declare-fun b!1011132 () Bool)

(declare-fun e!568822 () SeekEntryResult!9579)

(assert (=> b!1011132 (= e!568822 (Intermediate!9579 true index!1507 x!1245))))

(declare-fun b!1011133 () Bool)

(declare-fun e!568824 () Bool)

(declare-fun lt!446898 () SeekEntryResult!9579)

(assert (=> b!1011133 (= e!568824 (bvsge (x!88096 lt!446898) #b01111111111111111111111111111110))))

(declare-fun b!1011134 () Bool)

(declare-fun e!568821 () SeekEntryResult!9579)

(assert (=> b!1011134 (= e!568821 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30647 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011135 () Bool)

(assert (=> b!1011135 (and (bvsge (index!40689 lt!446898) #b00000000000000000000000000000000) (bvslt (index!40689 lt!446898) (size!31149 a!3219)))))

(declare-fun res!679296 () Bool)

(assert (=> b!1011135 (= res!679296 (= (select (arr!30647 a!3219) (index!40689 lt!446898)) (select (arr!30647 a!3219) j!170)))))

(declare-fun e!568823 () Bool)

(assert (=> b!1011135 (=> res!679296 e!568823)))

(declare-fun e!568825 () Bool)

(assert (=> b!1011135 (= e!568825 e!568823)))

(declare-fun b!1011136 () Bool)

(assert (=> b!1011136 (and (bvsge (index!40689 lt!446898) #b00000000000000000000000000000000) (bvslt (index!40689 lt!446898) (size!31149 a!3219)))))

(declare-fun res!679294 () Bool)

(assert (=> b!1011136 (= res!679294 (= (select (arr!30647 a!3219) (index!40689 lt!446898)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011136 (=> res!679294 e!568823)))

(declare-fun b!1011138 () Bool)

(assert (=> b!1011138 (= e!568822 e!568821)))

(declare-fun lt!446897 () (_ BitVec 64))

(declare-fun c!102080 () Bool)

(assert (=> b!1011138 (= c!102080 (or (= lt!446897 (select (arr!30647 a!3219) j!170)) (= (bvadd lt!446897 lt!446897) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011139 () Bool)

(assert (=> b!1011139 (= e!568821 (Intermediate!9579 false index!1507 x!1245))))

(declare-fun b!1011140 () Bool)

(assert (=> b!1011140 (and (bvsge (index!40689 lt!446898) #b00000000000000000000000000000000) (bvslt (index!40689 lt!446898) (size!31149 a!3219)))))

(assert (=> b!1011140 (= e!568823 (= (select (arr!30647 a!3219) (index!40689 lt!446898)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1011137 () Bool)

(assert (=> b!1011137 (= e!568824 e!568825)))

(declare-fun res!679295 () Bool)

(get-info :version)

(assert (=> b!1011137 (= res!679295 (and ((_ is Intermediate!9579) lt!446898) (not (undefined!10391 lt!446898)) (bvslt (x!88096 lt!446898) #b01111111111111111111111111111110) (bvsge (x!88096 lt!446898) #b00000000000000000000000000000000) (bvsge (x!88096 lt!446898) x!1245)))))

(assert (=> b!1011137 (=> (not res!679295) (not e!568825))))

(declare-fun d!120089 () Bool)

(assert (=> d!120089 e!568824))

(declare-fun c!102079 () Bool)

(assert (=> d!120089 (= c!102079 (and ((_ is Intermediate!9579) lt!446898) (undefined!10391 lt!446898)))))

(assert (=> d!120089 (= lt!446898 e!568822)))

(declare-fun c!102081 () Bool)

(assert (=> d!120089 (= c!102081 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!120089 (= lt!446897 (select (arr!30647 a!3219) index!1507))))

(assert (=> d!120089 (validMask!0 mask!3464)))

(assert (=> d!120089 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30647 a!3219) j!170) a!3219 mask!3464) lt!446898)))

(assert (= (and d!120089 c!102081) b!1011132))

(assert (= (and d!120089 (not c!102081)) b!1011138))

(assert (= (and b!1011138 c!102080) b!1011139))

(assert (= (and b!1011138 (not c!102080)) b!1011134))

(assert (= (and d!120089 c!102079) b!1011133))

(assert (= (and d!120089 (not c!102079)) b!1011137))

(assert (= (and b!1011137 res!679295) b!1011135))

(assert (= (and b!1011135 (not res!679296)) b!1011136))

(assert (= (and b!1011136 (not res!679294)) b!1011140))

(declare-fun m!935273 () Bool)

(assert (=> b!1011135 m!935273))

(assert (=> b!1011140 m!935273))

(declare-fun m!935275 () Bool)

(assert (=> d!120089 m!935275))

(assert (=> d!120089 m!935185))

(assert (=> b!1011134 m!935207))

(assert (=> b!1011134 m!935207))

(assert (=> b!1011134 m!935191))

(declare-fun m!935277 () Bool)

(assert (=> b!1011134 m!935277))

(assert (=> b!1011136 m!935273))

(assert (=> b!1011048 d!120089))

(declare-fun lt!446907 () SeekEntryResult!9579)

(declare-fun b!1011153 () Bool)

(declare-fun e!568834 () SeekEntryResult!9579)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63661 (_ BitVec 32)) SeekEntryResult!9579)

(assert (=> b!1011153 (= e!568834 (seekKeyOrZeroReturnVacant!0 (x!88096 lt!446907) (index!40689 lt!446907) (index!40689 lt!446907) k0!2224 a!3219 mask!3464))))

(declare-fun b!1011154 () Bool)

(declare-fun e!568833 () SeekEntryResult!9579)

(assert (=> b!1011154 (= e!568833 (Found!9579 (index!40689 lt!446907)))))

(declare-fun b!1011155 () Bool)

(declare-fun e!568832 () SeekEntryResult!9579)

(assert (=> b!1011155 (= e!568832 e!568833)))

(declare-fun lt!446906 () (_ BitVec 64))

(assert (=> b!1011155 (= lt!446906 (select (arr!30647 a!3219) (index!40689 lt!446907)))))

(declare-fun c!102090 () Bool)

(assert (=> b!1011155 (= c!102090 (= lt!446906 k0!2224))))

(declare-fun d!120091 () Bool)

(declare-fun lt!446905 () SeekEntryResult!9579)

(assert (=> d!120091 (and (or ((_ is Undefined!9579) lt!446905) (not ((_ is Found!9579) lt!446905)) (and (bvsge (index!40688 lt!446905) #b00000000000000000000000000000000) (bvslt (index!40688 lt!446905) (size!31149 a!3219)))) (or ((_ is Undefined!9579) lt!446905) ((_ is Found!9579) lt!446905) (not ((_ is MissingZero!9579) lt!446905)) (and (bvsge (index!40687 lt!446905) #b00000000000000000000000000000000) (bvslt (index!40687 lt!446905) (size!31149 a!3219)))) (or ((_ is Undefined!9579) lt!446905) ((_ is Found!9579) lt!446905) ((_ is MissingZero!9579) lt!446905) (not ((_ is MissingVacant!9579) lt!446905)) (and (bvsge (index!40690 lt!446905) #b00000000000000000000000000000000) (bvslt (index!40690 lt!446905) (size!31149 a!3219)))) (or ((_ is Undefined!9579) lt!446905) (ite ((_ is Found!9579) lt!446905) (= (select (arr!30647 a!3219) (index!40688 lt!446905)) k0!2224) (ite ((_ is MissingZero!9579) lt!446905) (= (select (arr!30647 a!3219) (index!40687 lt!446905)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9579) lt!446905) (= (select (arr!30647 a!3219) (index!40690 lt!446905)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!120091 (= lt!446905 e!568832)))

(declare-fun c!102088 () Bool)

(assert (=> d!120091 (= c!102088 (and ((_ is Intermediate!9579) lt!446907) (undefined!10391 lt!446907)))))

(assert (=> d!120091 (= lt!446907 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!120091 (validMask!0 mask!3464)))

(assert (=> d!120091 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!446905)))

(declare-fun b!1011156 () Bool)

(assert (=> b!1011156 (= e!568832 Undefined!9579)))

(declare-fun b!1011157 () Bool)

(declare-fun c!102089 () Bool)

(assert (=> b!1011157 (= c!102089 (= lt!446906 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011157 (= e!568833 e!568834)))

(declare-fun b!1011158 () Bool)

(assert (=> b!1011158 (= e!568834 (MissingZero!9579 (index!40689 lt!446907)))))

(assert (= (and d!120091 c!102088) b!1011156))

(assert (= (and d!120091 (not c!102088)) b!1011155))

(assert (= (and b!1011155 c!102090) b!1011154))

(assert (= (and b!1011155 (not c!102090)) b!1011157))

(assert (= (and b!1011157 c!102089) b!1011158))

(assert (= (and b!1011157 (not c!102089)) b!1011153))

(declare-fun m!935279 () Bool)

(assert (=> b!1011153 m!935279))

(declare-fun m!935281 () Bool)

(assert (=> b!1011155 m!935281))

(declare-fun m!935283 () Bool)

(assert (=> d!120091 m!935283))

(declare-fun m!935285 () Bool)

(assert (=> d!120091 m!935285))

(declare-fun m!935287 () Bool)

(assert (=> d!120091 m!935287))

(assert (=> d!120091 m!935185))

(declare-fun m!935289 () Bool)

(assert (=> d!120091 m!935289))

(declare-fun m!935291 () Bool)

(assert (=> d!120091 m!935291))

(assert (=> d!120091 m!935283))

(assert (=> b!1011037 d!120091))

(declare-fun d!120103 () Bool)

(assert (=> d!120103 (= (validKeyInArray!0 (select (arr!30647 a!3219) j!170)) (and (not (= (select (arr!30647 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30647 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1011039 d!120103))

(declare-fun b!1011159 () Bool)

(declare-fun e!568836 () SeekEntryResult!9579)

(assert (=> b!1011159 (= e!568836 (Intermediate!9579 true lt!446867 (bvadd #b00000000000000000000000000000001 x!1245)))))

(declare-fun b!1011160 () Bool)

(declare-fun e!568838 () Bool)

(declare-fun lt!446909 () SeekEntryResult!9579)

(assert (=> b!1011160 (= e!568838 (bvsge (x!88096 lt!446909) #b01111111111111111111111111111110))))

(declare-fun b!1011161 () Bool)

(declare-fun e!568835 () SeekEntryResult!9579)

(assert (=> b!1011161 (= e!568835 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245 #b00000000000000000000000000000001) (nextIndex!0 lt!446867 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464) (select (arr!30647 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011162 () Bool)

(assert (=> b!1011162 (and (bvsge (index!40689 lt!446909) #b00000000000000000000000000000000) (bvslt (index!40689 lt!446909) (size!31149 a!3219)))))

(declare-fun res!679299 () Bool)

(assert (=> b!1011162 (= res!679299 (= (select (arr!30647 a!3219) (index!40689 lt!446909)) (select (arr!30647 a!3219) j!170)))))

(declare-fun e!568837 () Bool)

(assert (=> b!1011162 (=> res!679299 e!568837)))

(declare-fun e!568839 () Bool)

(assert (=> b!1011162 (= e!568839 e!568837)))

(declare-fun b!1011163 () Bool)

(assert (=> b!1011163 (and (bvsge (index!40689 lt!446909) #b00000000000000000000000000000000) (bvslt (index!40689 lt!446909) (size!31149 a!3219)))))

(declare-fun res!679297 () Bool)

(assert (=> b!1011163 (= res!679297 (= (select (arr!30647 a!3219) (index!40689 lt!446909)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011163 (=> res!679297 e!568837)))

(declare-fun b!1011165 () Bool)

(assert (=> b!1011165 (= e!568836 e!568835)))

(declare-fun c!102092 () Bool)

(declare-fun lt!446908 () (_ BitVec 64))

(assert (=> b!1011165 (= c!102092 (or (= lt!446908 (select (arr!30647 a!3219) j!170)) (= (bvadd lt!446908 lt!446908) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011166 () Bool)

(assert (=> b!1011166 (= e!568835 (Intermediate!9579 false lt!446867 (bvadd #b00000000000000000000000000000001 x!1245)))))

(declare-fun b!1011167 () Bool)

(assert (=> b!1011167 (and (bvsge (index!40689 lt!446909) #b00000000000000000000000000000000) (bvslt (index!40689 lt!446909) (size!31149 a!3219)))))

(assert (=> b!1011167 (= e!568837 (= (select (arr!30647 a!3219) (index!40689 lt!446909)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1011164 () Bool)

(assert (=> b!1011164 (= e!568838 e!568839)))

(declare-fun res!679298 () Bool)

(assert (=> b!1011164 (= res!679298 (and ((_ is Intermediate!9579) lt!446909) (not (undefined!10391 lt!446909)) (bvslt (x!88096 lt!446909) #b01111111111111111111111111111110) (bvsge (x!88096 lt!446909) #b00000000000000000000000000000000) (bvsge (x!88096 lt!446909) (bvadd #b00000000000000000000000000000001 x!1245))))))

(assert (=> b!1011164 (=> (not res!679298) (not e!568839))))

(declare-fun d!120105 () Bool)

(assert (=> d!120105 e!568838))

(declare-fun c!102091 () Bool)

(assert (=> d!120105 (= c!102091 (and ((_ is Intermediate!9579) lt!446909) (undefined!10391 lt!446909)))))

(assert (=> d!120105 (= lt!446909 e!568836)))

(declare-fun c!102093 () Bool)

(assert (=> d!120105 (= c!102093 (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b01111111111111111111111111111110))))

(assert (=> d!120105 (= lt!446908 (select (arr!30647 a!3219) lt!446867))))

(assert (=> d!120105 (validMask!0 mask!3464)))

(assert (=> d!120105 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446867 (select (arr!30647 a!3219) j!170) a!3219 mask!3464) lt!446909)))

(assert (= (and d!120105 c!102093) b!1011159))

(assert (= (and d!120105 (not c!102093)) b!1011165))

(assert (= (and b!1011165 c!102092) b!1011166))

(assert (= (and b!1011165 (not c!102092)) b!1011161))

(assert (= (and d!120105 c!102091) b!1011160))

(assert (= (and d!120105 (not c!102091)) b!1011164))

(assert (= (and b!1011164 res!679298) b!1011162))

(assert (= (and b!1011162 (not res!679299)) b!1011163))

(assert (= (and b!1011163 (not res!679297)) b!1011167))

(declare-fun m!935293 () Bool)

(assert (=> b!1011162 m!935293))

(assert (=> b!1011167 m!935293))

(declare-fun m!935295 () Bool)

(assert (=> d!120105 m!935295))

(assert (=> d!120105 m!935185))

(declare-fun m!935297 () Bool)

(assert (=> b!1011161 m!935297))

(assert (=> b!1011161 m!935297))

(assert (=> b!1011161 m!935191))

(declare-fun m!935299 () Bool)

(assert (=> b!1011161 m!935299))

(assert (=> b!1011163 m!935293))

(assert (=> b!1011038 d!120105))

(declare-fun b!1011168 () Bool)

(declare-fun e!568841 () SeekEntryResult!9579)

(assert (=> b!1011168 (= e!568841 (Intermediate!9579 true lt!446867 (bvadd #b00000000000000000000000000000001 x!1245)))))

(declare-fun b!1011169 () Bool)

(declare-fun e!568843 () Bool)

(declare-fun lt!446911 () SeekEntryResult!9579)

(assert (=> b!1011169 (= e!568843 (bvsge (x!88096 lt!446911) #b01111111111111111111111111111110))))

(declare-fun b!1011170 () Bool)

(declare-fun e!568840 () SeekEntryResult!9579)

(assert (=> b!1011170 (= e!568840 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245 #b00000000000000000000000000000001) (nextIndex!0 lt!446867 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464) lt!446868 lt!446862 mask!3464))))

(declare-fun b!1011171 () Bool)

(assert (=> b!1011171 (and (bvsge (index!40689 lt!446911) #b00000000000000000000000000000000) (bvslt (index!40689 lt!446911) (size!31149 lt!446862)))))

(declare-fun res!679302 () Bool)

(assert (=> b!1011171 (= res!679302 (= (select (arr!30647 lt!446862) (index!40689 lt!446911)) lt!446868))))

(declare-fun e!568842 () Bool)

(assert (=> b!1011171 (=> res!679302 e!568842)))

(declare-fun e!568844 () Bool)

(assert (=> b!1011171 (= e!568844 e!568842)))

(declare-fun b!1011172 () Bool)

(assert (=> b!1011172 (and (bvsge (index!40689 lt!446911) #b00000000000000000000000000000000) (bvslt (index!40689 lt!446911) (size!31149 lt!446862)))))

(declare-fun res!679300 () Bool)

(assert (=> b!1011172 (= res!679300 (= (select (arr!30647 lt!446862) (index!40689 lt!446911)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011172 (=> res!679300 e!568842)))

(declare-fun b!1011174 () Bool)

(assert (=> b!1011174 (= e!568841 e!568840)))

(declare-fun c!102095 () Bool)

(declare-fun lt!446910 () (_ BitVec 64))

(assert (=> b!1011174 (= c!102095 (or (= lt!446910 lt!446868) (= (bvadd lt!446910 lt!446910) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011175 () Bool)

(assert (=> b!1011175 (= e!568840 (Intermediate!9579 false lt!446867 (bvadd #b00000000000000000000000000000001 x!1245)))))

(declare-fun b!1011176 () Bool)

(assert (=> b!1011176 (and (bvsge (index!40689 lt!446911) #b00000000000000000000000000000000) (bvslt (index!40689 lt!446911) (size!31149 lt!446862)))))

(assert (=> b!1011176 (= e!568842 (= (select (arr!30647 lt!446862) (index!40689 lt!446911)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1011173 () Bool)

(assert (=> b!1011173 (= e!568843 e!568844)))

(declare-fun res!679301 () Bool)

(assert (=> b!1011173 (= res!679301 (and ((_ is Intermediate!9579) lt!446911) (not (undefined!10391 lt!446911)) (bvslt (x!88096 lt!446911) #b01111111111111111111111111111110) (bvsge (x!88096 lt!446911) #b00000000000000000000000000000000) (bvsge (x!88096 lt!446911) (bvadd #b00000000000000000000000000000001 x!1245))))))

(assert (=> b!1011173 (=> (not res!679301) (not e!568844))))

(declare-fun d!120107 () Bool)

(assert (=> d!120107 e!568843))

(declare-fun c!102094 () Bool)

(assert (=> d!120107 (= c!102094 (and ((_ is Intermediate!9579) lt!446911) (undefined!10391 lt!446911)))))

(assert (=> d!120107 (= lt!446911 e!568841)))

(declare-fun c!102096 () Bool)

(assert (=> d!120107 (= c!102096 (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b01111111111111111111111111111110))))

(assert (=> d!120107 (= lt!446910 (select (arr!30647 lt!446862) lt!446867))))

(assert (=> d!120107 (validMask!0 mask!3464)))

(assert (=> d!120107 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446867 lt!446868 lt!446862 mask!3464) lt!446911)))

(assert (= (and d!120107 c!102096) b!1011168))

(assert (= (and d!120107 (not c!102096)) b!1011174))

(assert (= (and b!1011174 c!102095) b!1011175))

(assert (= (and b!1011174 (not c!102095)) b!1011170))

(assert (= (and d!120107 c!102094) b!1011169))

(assert (= (and d!120107 (not c!102094)) b!1011173))

(assert (= (and b!1011173 res!679301) b!1011171))

(assert (= (and b!1011171 (not res!679302)) b!1011172))

(assert (= (and b!1011172 (not res!679300)) b!1011176))

(declare-fun m!935301 () Bool)

(assert (=> b!1011171 m!935301))

(assert (=> b!1011176 m!935301))

(declare-fun m!935303 () Bool)

(assert (=> d!120107 m!935303))

(assert (=> d!120107 m!935185))

(assert (=> b!1011170 m!935297))

(assert (=> b!1011170 m!935297))

(declare-fun m!935305 () Bool)

(assert (=> b!1011170 m!935305))

(assert (=> b!1011172 m!935301))

(assert (=> b!1011049 d!120107))

(declare-fun d!120109 () Bool)

(declare-fun lt!446922 () (_ BitVec 32))

(assert (=> d!120109 (and (bvsge lt!446922 #b00000000000000000000000000000000) (bvslt lt!446922 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!120109 (= lt!446922 (choose!52 index!1507 x!1245 mask!3464))))

(assert (=> d!120109 (validMask!0 mask!3464)))

(assert (=> d!120109 (= (nextIndex!0 index!1507 x!1245 mask!3464) lt!446922)))

(declare-fun bs!28734 () Bool)

(assert (= bs!28734 d!120109))

(declare-fun m!935307 () Bool)

(assert (=> bs!28734 m!935307))

(assert (=> bs!28734 m!935185))

(assert (=> b!1011050 d!120109))

(declare-fun d!120111 () Bool)

(declare-fun res!679319 () Bool)

(declare-fun e!568869 () Bool)

(assert (=> d!120111 (=> res!679319 e!568869)))

(assert (=> d!120111 (= res!679319 (= (select (arr!30647 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!120111 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!568869)))

(declare-fun b!1011217 () Bool)

(declare-fun e!568870 () Bool)

(assert (=> b!1011217 (= e!568869 e!568870)))

(declare-fun res!679320 () Bool)

(assert (=> b!1011217 (=> (not res!679320) (not e!568870))))

(assert (=> b!1011217 (= res!679320 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31149 a!3219)))))

(declare-fun b!1011218 () Bool)

(assert (=> b!1011218 (= e!568870 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!120111 (not res!679319)) b!1011217))

(assert (= (and b!1011217 res!679320) b!1011218))

(assert (=> d!120111 m!935265))

(declare-fun m!935309 () Bool)

(assert (=> b!1011218 m!935309))

(assert (=> b!1011041 d!120111))

(declare-fun e!568872 () SeekEntryResult!9579)

(declare-fun b!1011219 () Bool)

(assert (=> b!1011219 (= e!568872 (Intermediate!9579 true (toIndex!0 (select (arr!30647 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1011220 () Bool)

(declare-fun e!568874 () Bool)

(declare-fun lt!446924 () SeekEntryResult!9579)

(assert (=> b!1011220 (= e!568874 (bvsge (x!88096 lt!446924) #b01111111111111111111111111111110))))

(declare-fun b!1011221 () Bool)

(declare-fun e!568871 () SeekEntryResult!9579)

(assert (=> b!1011221 (= e!568871 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30647 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30647 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011222 () Bool)

(assert (=> b!1011222 (and (bvsge (index!40689 lt!446924) #b00000000000000000000000000000000) (bvslt (index!40689 lt!446924) (size!31149 a!3219)))))

(declare-fun res!679323 () Bool)

(assert (=> b!1011222 (= res!679323 (= (select (arr!30647 a!3219) (index!40689 lt!446924)) (select (arr!30647 a!3219) j!170)))))

(declare-fun e!568873 () Bool)

(assert (=> b!1011222 (=> res!679323 e!568873)))

(declare-fun e!568875 () Bool)

(assert (=> b!1011222 (= e!568875 e!568873)))

(declare-fun b!1011223 () Bool)

(assert (=> b!1011223 (and (bvsge (index!40689 lt!446924) #b00000000000000000000000000000000) (bvslt (index!40689 lt!446924) (size!31149 a!3219)))))

(declare-fun res!679321 () Bool)

(assert (=> b!1011223 (= res!679321 (= (select (arr!30647 a!3219) (index!40689 lt!446924)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011223 (=> res!679321 e!568873)))

(declare-fun b!1011225 () Bool)

(assert (=> b!1011225 (= e!568872 e!568871)))

(declare-fun lt!446923 () (_ BitVec 64))

(declare-fun c!102110 () Bool)

(assert (=> b!1011225 (= c!102110 (or (= lt!446923 (select (arr!30647 a!3219) j!170)) (= (bvadd lt!446923 lt!446923) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011226 () Bool)

(assert (=> b!1011226 (= e!568871 (Intermediate!9579 false (toIndex!0 (select (arr!30647 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1011227 () Bool)

(assert (=> b!1011227 (and (bvsge (index!40689 lt!446924) #b00000000000000000000000000000000) (bvslt (index!40689 lt!446924) (size!31149 a!3219)))))

(assert (=> b!1011227 (= e!568873 (= (select (arr!30647 a!3219) (index!40689 lt!446924)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1011224 () Bool)

(assert (=> b!1011224 (= e!568874 e!568875)))

(declare-fun res!679322 () Bool)

(assert (=> b!1011224 (= res!679322 (and ((_ is Intermediate!9579) lt!446924) (not (undefined!10391 lt!446924)) (bvslt (x!88096 lt!446924) #b01111111111111111111111111111110) (bvsge (x!88096 lt!446924) #b00000000000000000000000000000000) (bvsge (x!88096 lt!446924) #b00000000000000000000000000000000)))))

(assert (=> b!1011224 (=> (not res!679322) (not e!568875))))

(declare-fun d!120113 () Bool)

(assert (=> d!120113 e!568874))

(declare-fun c!102109 () Bool)

(assert (=> d!120113 (= c!102109 (and ((_ is Intermediate!9579) lt!446924) (undefined!10391 lt!446924)))))

(assert (=> d!120113 (= lt!446924 e!568872)))

(declare-fun c!102111 () Bool)

(assert (=> d!120113 (= c!102111 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!120113 (= lt!446923 (select (arr!30647 a!3219) (toIndex!0 (select (arr!30647 a!3219) j!170) mask!3464)))))

(assert (=> d!120113 (validMask!0 mask!3464)))

(assert (=> d!120113 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30647 a!3219) j!170) mask!3464) (select (arr!30647 a!3219) j!170) a!3219 mask!3464) lt!446924)))

(assert (= (and d!120113 c!102111) b!1011219))

(assert (= (and d!120113 (not c!102111)) b!1011225))

(assert (= (and b!1011225 c!102110) b!1011226))

(assert (= (and b!1011225 (not c!102110)) b!1011221))

(assert (= (and d!120113 c!102109) b!1011220))

(assert (= (and d!120113 (not c!102109)) b!1011224))

(assert (= (and b!1011224 res!679322) b!1011222))

(assert (= (and b!1011222 (not res!679323)) b!1011223))

(assert (= (and b!1011223 (not res!679321)) b!1011227))

(declare-fun m!935311 () Bool)

(assert (=> b!1011222 m!935311))

(assert (=> b!1011227 m!935311))

(assert (=> d!120113 m!935209))

(declare-fun m!935313 () Bool)

(assert (=> d!120113 m!935313))

(assert (=> d!120113 m!935185))

(assert (=> b!1011221 m!935209))

(declare-fun m!935315 () Bool)

(assert (=> b!1011221 m!935315))

(assert (=> b!1011221 m!935315))

(assert (=> b!1011221 m!935191))

(declare-fun m!935317 () Bool)

(assert (=> b!1011221 m!935317))

(assert (=> b!1011223 m!935311))

(assert (=> b!1011043 d!120113))

(declare-fun d!120115 () Bool)

(declare-fun lt!446942 () (_ BitVec 32))

(declare-fun lt!446941 () (_ BitVec 32))

(assert (=> d!120115 (= lt!446942 (bvmul (bvxor lt!446941 (bvlshr lt!446941 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!120115 (= lt!446941 ((_ extract 31 0) (bvand (bvxor (select (arr!30647 a!3219) j!170) (bvlshr (select (arr!30647 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!120115 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!679330 (let ((h!22516 ((_ extract 31 0) (bvand (bvxor (select (arr!30647 a!3219) j!170) (bvlshr (select (arr!30647 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!88102 (bvmul (bvxor h!22516 (bvlshr h!22516 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!88102 (bvlshr x!88102 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!679330 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!679330 #b00000000000000000000000000000000))))))

(assert (=> d!120115 (= (toIndex!0 (select (arr!30647 a!3219) j!170) mask!3464) (bvand (bvxor lt!446942 (bvlshr lt!446942 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1011043 d!120115))

(declare-fun b!1011246 () Bool)

(declare-fun e!568887 () SeekEntryResult!9579)

(assert (=> b!1011246 (= e!568887 (Intermediate!9579 true index!1507 x!1245))))

(declare-fun b!1011247 () Bool)

(declare-fun e!568889 () Bool)

(declare-fun lt!446944 () SeekEntryResult!9579)

(assert (=> b!1011247 (= e!568889 (bvsge (x!88096 lt!446944) #b01111111111111111111111111111110))))

(declare-fun b!1011248 () Bool)

(declare-fun e!568886 () SeekEntryResult!9579)

(assert (=> b!1011248 (= e!568886 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!446868 lt!446862 mask!3464))))

(declare-fun b!1011249 () Bool)

(assert (=> b!1011249 (and (bvsge (index!40689 lt!446944) #b00000000000000000000000000000000) (bvslt (index!40689 lt!446944) (size!31149 lt!446862)))))

(declare-fun res!679335 () Bool)

(assert (=> b!1011249 (= res!679335 (= (select (arr!30647 lt!446862) (index!40689 lt!446944)) lt!446868))))

(declare-fun e!568888 () Bool)

(assert (=> b!1011249 (=> res!679335 e!568888)))

(declare-fun e!568890 () Bool)

(assert (=> b!1011249 (= e!568890 e!568888)))

(declare-fun b!1011250 () Bool)

(assert (=> b!1011250 (and (bvsge (index!40689 lt!446944) #b00000000000000000000000000000000) (bvslt (index!40689 lt!446944) (size!31149 lt!446862)))))

(declare-fun res!679333 () Bool)

(assert (=> b!1011250 (= res!679333 (= (select (arr!30647 lt!446862) (index!40689 lt!446944)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011250 (=> res!679333 e!568888)))

(declare-fun b!1011252 () Bool)

(assert (=> b!1011252 (= e!568887 e!568886)))

(declare-fun c!102119 () Bool)

(declare-fun lt!446943 () (_ BitVec 64))

(assert (=> b!1011252 (= c!102119 (or (= lt!446943 lt!446868) (= (bvadd lt!446943 lt!446943) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011253 () Bool)

(assert (=> b!1011253 (= e!568886 (Intermediate!9579 false index!1507 x!1245))))

(declare-fun b!1011254 () Bool)

(assert (=> b!1011254 (and (bvsge (index!40689 lt!446944) #b00000000000000000000000000000000) (bvslt (index!40689 lt!446944) (size!31149 lt!446862)))))

(assert (=> b!1011254 (= e!568888 (= (select (arr!30647 lt!446862) (index!40689 lt!446944)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1011251 () Bool)

(assert (=> b!1011251 (= e!568889 e!568890)))

(declare-fun res!679334 () Bool)

(assert (=> b!1011251 (= res!679334 (and ((_ is Intermediate!9579) lt!446944) (not (undefined!10391 lt!446944)) (bvslt (x!88096 lt!446944) #b01111111111111111111111111111110) (bvsge (x!88096 lt!446944) #b00000000000000000000000000000000) (bvsge (x!88096 lt!446944) x!1245)))))

(assert (=> b!1011251 (=> (not res!679334) (not e!568890))))

(declare-fun d!120121 () Bool)

(assert (=> d!120121 e!568889))

(declare-fun c!102118 () Bool)

(assert (=> d!120121 (= c!102118 (and ((_ is Intermediate!9579) lt!446944) (undefined!10391 lt!446944)))))

(assert (=> d!120121 (= lt!446944 e!568887)))

(declare-fun c!102120 () Bool)

(assert (=> d!120121 (= c!102120 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!120121 (= lt!446943 (select (arr!30647 lt!446862) index!1507))))

(assert (=> d!120121 (validMask!0 mask!3464)))

(assert (=> d!120121 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446868 lt!446862 mask!3464) lt!446944)))

(assert (= (and d!120121 c!102120) b!1011246))

(assert (= (and d!120121 (not c!102120)) b!1011252))

(assert (= (and b!1011252 c!102119) b!1011253))

(assert (= (and b!1011252 (not c!102119)) b!1011248))

(assert (= (and d!120121 c!102118) b!1011247))

(assert (= (and d!120121 (not c!102118)) b!1011251))

(assert (= (and b!1011251 res!679334) b!1011249))

(assert (= (and b!1011249 (not res!679335)) b!1011250))

(assert (= (and b!1011250 (not res!679333)) b!1011254))

(declare-fun m!935335 () Bool)

(assert (=> b!1011249 m!935335))

(assert (=> b!1011254 m!935335))

(declare-fun m!935337 () Bool)

(assert (=> d!120121 m!935337))

(assert (=> d!120121 m!935185))

(assert (=> b!1011248 m!935207))

(assert (=> b!1011248 m!935207))

(declare-fun m!935339 () Bool)

(assert (=> b!1011248 m!935339))

(assert (=> b!1011250 m!935335))

(assert (=> b!1011042 d!120121))

(declare-fun b!1011290 () Bool)

(declare-fun e!568914 () Bool)

(declare-fun call!42429 () Bool)

(assert (=> b!1011290 (= e!568914 call!42429)))

(declare-fun d!120127 () Bool)

(declare-fun res!679349 () Bool)

(declare-fun e!568912 () Bool)

(assert (=> d!120127 (=> res!679349 e!568912)))

(assert (=> d!120127 (= res!679349 (bvsge #b00000000000000000000000000000000 (size!31149 a!3219)))))

(assert (=> d!120127 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!568912)))

(declare-fun b!1011291 () Bool)

(declare-fun e!568913 () Bool)

(assert (=> b!1011291 (= e!568914 e!568913)))

(declare-fun lt!446963 () (_ BitVec 64))

(assert (=> b!1011291 (= lt!446963 (select (arr!30647 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33028 0))(
  ( (Unit!33029) )
))
(declare-fun lt!446961 () Unit!33028)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63661 (_ BitVec 64) (_ BitVec 32)) Unit!33028)

(assert (=> b!1011291 (= lt!446961 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!446963 #b00000000000000000000000000000000))))

(assert (=> b!1011291 (arrayContainsKey!0 a!3219 lt!446963 #b00000000000000000000000000000000)))

(declare-fun lt!446962 () Unit!33028)

(assert (=> b!1011291 (= lt!446962 lt!446961)))

(declare-fun res!679350 () Bool)

(assert (=> b!1011291 (= res!679350 (= (seekEntryOrOpen!0 (select (arr!30647 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9579 #b00000000000000000000000000000000)))))

(assert (=> b!1011291 (=> (not res!679350) (not e!568913))))

(declare-fun b!1011292 () Bool)

(assert (=> b!1011292 (= e!568913 call!42429)))

(declare-fun b!1011293 () Bool)

(assert (=> b!1011293 (= e!568912 e!568914)))

(declare-fun c!102132 () Bool)

(assert (=> b!1011293 (= c!102132 (validKeyInArray!0 (select (arr!30647 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42426 () Bool)

(assert (=> bm!42426 (= call!42429 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(assert (= (and d!120127 (not res!679349)) b!1011293))

(assert (= (and b!1011293 c!102132) b!1011291))

(assert (= (and b!1011293 (not c!102132)) b!1011290))

(assert (= (and b!1011291 res!679350) b!1011292))

(assert (= (or b!1011292 b!1011290) bm!42426))

(assert (=> b!1011291 m!935265))

(declare-fun m!935359 () Bool)

(assert (=> b!1011291 m!935359))

(declare-fun m!935361 () Bool)

(assert (=> b!1011291 m!935361))

(assert (=> b!1011291 m!935265))

(declare-fun m!935363 () Bool)

(assert (=> b!1011291 m!935363))

(assert (=> b!1011293 m!935265))

(assert (=> b!1011293 m!935265))

(assert (=> b!1011293 m!935269))

(declare-fun m!935365 () Bool)

(assert (=> bm!42426 m!935365))

(assert (=> b!1011044 d!120127))

(declare-fun d!120135 () Bool)

(assert (=> d!120135 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!87200 d!120135))

(declare-fun d!120141 () Bool)

(assert (=> d!120141 (= (array_inv!23771 a!3219) (bvsge (size!31149 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!87200 d!120141))

(declare-fun b!1011318 () Bool)

(declare-fun e!568931 () SeekEntryResult!9579)

(assert (=> b!1011318 (= e!568931 (Intermediate!9579 true (toIndex!0 lt!446868 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1011319 () Bool)

(declare-fun e!568933 () Bool)

(declare-fun lt!446980 () SeekEntryResult!9579)

(assert (=> b!1011319 (= e!568933 (bvsge (x!88096 lt!446980) #b01111111111111111111111111111110))))

(declare-fun e!568930 () SeekEntryResult!9579)

(declare-fun b!1011320 () Bool)

(assert (=> b!1011320 (= e!568930 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!446868 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!446868 lt!446862 mask!3464))))

(declare-fun b!1011321 () Bool)

(assert (=> b!1011321 (and (bvsge (index!40689 lt!446980) #b00000000000000000000000000000000) (bvslt (index!40689 lt!446980) (size!31149 lt!446862)))))

(declare-fun res!679359 () Bool)

(assert (=> b!1011321 (= res!679359 (= (select (arr!30647 lt!446862) (index!40689 lt!446980)) lt!446868))))

(declare-fun e!568932 () Bool)

(assert (=> b!1011321 (=> res!679359 e!568932)))

(declare-fun e!568934 () Bool)

(assert (=> b!1011321 (= e!568934 e!568932)))

(declare-fun b!1011322 () Bool)

(assert (=> b!1011322 (and (bvsge (index!40689 lt!446980) #b00000000000000000000000000000000) (bvslt (index!40689 lt!446980) (size!31149 lt!446862)))))

(declare-fun res!679357 () Bool)

(assert (=> b!1011322 (= res!679357 (= (select (arr!30647 lt!446862) (index!40689 lt!446980)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1011322 (=> res!679357 e!568932)))

(declare-fun b!1011324 () Bool)

(assert (=> b!1011324 (= e!568931 e!568930)))

(declare-fun c!102143 () Bool)

(declare-fun lt!446979 () (_ BitVec 64))

(assert (=> b!1011324 (= c!102143 (or (= lt!446979 lt!446868) (= (bvadd lt!446979 lt!446979) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1011325 () Bool)

(assert (=> b!1011325 (= e!568930 (Intermediate!9579 false (toIndex!0 lt!446868 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1011326 () Bool)

(assert (=> b!1011326 (and (bvsge (index!40689 lt!446980) #b00000000000000000000000000000000) (bvslt (index!40689 lt!446980) (size!31149 lt!446862)))))

(assert (=> b!1011326 (= e!568932 (= (select (arr!30647 lt!446862) (index!40689 lt!446980)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1011323 () Bool)

(assert (=> b!1011323 (= e!568933 e!568934)))

(declare-fun res!679358 () Bool)

(assert (=> b!1011323 (= res!679358 (and ((_ is Intermediate!9579) lt!446980) (not (undefined!10391 lt!446980)) (bvslt (x!88096 lt!446980) #b01111111111111111111111111111110) (bvsge (x!88096 lt!446980) #b00000000000000000000000000000000) (bvsge (x!88096 lt!446980) #b00000000000000000000000000000000)))))

(assert (=> b!1011323 (=> (not res!679358) (not e!568934))))

(declare-fun d!120143 () Bool)

(assert (=> d!120143 e!568933))

(declare-fun c!102142 () Bool)

(assert (=> d!120143 (= c!102142 (and ((_ is Intermediate!9579) lt!446980) (undefined!10391 lt!446980)))))

(assert (=> d!120143 (= lt!446980 e!568931)))

(declare-fun c!102144 () Bool)

(assert (=> d!120143 (= c!102144 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!120143 (= lt!446979 (select (arr!30647 lt!446862) (toIndex!0 lt!446868 mask!3464)))))

(assert (=> d!120143 (validMask!0 mask!3464)))

(assert (=> d!120143 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446868 mask!3464) lt!446868 lt!446862 mask!3464) lt!446980)))

(assert (= (and d!120143 c!102144) b!1011318))

(assert (= (and d!120143 (not c!102144)) b!1011324))

(assert (= (and b!1011324 c!102143) b!1011325))

(assert (= (and b!1011324 (not c!102143)) b!1011320))

(assert (= (and d!120143 c!102142) b!1011319))

(assert (= (and d!120143 (not c!102142)) b!1011323))

(assert (= (and b!1011323 res!679358) b!1011321))

(assert (= (and b!1011321 (not res!679359)) b!1011322))

(assert (= (and b!1011322 (not res!679357)) b!1011326))

(declare-fun m!935379 () Bool)

(assert (=> b!1011321 m!935379))

(assert (=> b!1011326 m!935379))

(assert (=> d!120143 m!935217))

(declare-fun m!935381 () Bool)

(assert (=> d!120143 m!935381))

(assert (=> d!120143 m!935185))

(assert (=> b!1011320 m!935217))

(declare-fun m!935383 () Bool)

(assert (=> b!1011320 m!935383))

(assert (=> b!1011320 m!935383))

(declare-fun m!935385 () Bool)

(assert (=> b!1011320 m!935385))

(assert (=> b!1011322 m!935379))

(assert (=> b!1011045 d!120143))

(declare-fun d!120147 () Bool)

(declare-fun lt!446987 () (_ BitVec 32))

(declare-fun lt!446986 () (_ BitVec 32))

(assert (=> d!120147 (= lt!446987 (bvmul (bvxor lt!446986 (bvlshr lt!446986 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!120147 (= lt!446986 ((_ extract 31 0) (bvand (bvxor lt!446868 (bvlshr lt!446868 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!120147 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!679330 (let ((h!22516 ((_ extract 31 0) (bvand (bvxor lt!446868 (bvlshr lt!446868 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!88102 (bvmul (bvxor h!22516 (bvlshr h!22516 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!88102 (bvlshr x!88102 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!679330 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!679330 #b00000000000000000000000000000000))))))

(assert (=> d!120147 (= (toIndex!0 lt!446868 mask!3464) (bvand (bvxor lt!446987 (bvlshr lt!446987 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1011045 d!120147))

(check-sat (not b!1011153) (not b!1011161) (not b!1011320) (not b!1011221) (not d!120143) (not b!1011291) (not b!1011111) (not b!1011218) (not bm!42426) (not b!1011110) (not d!120121) (not b!1011113) (not d!120107) (not d!120091) (not b!1011134) (not bm!42423) (not b!1011248) (not b!1011170) (not d!120089) (not d!120109) (not b!1011293) (not d!120113) (not d!120105))
(check-sat)
