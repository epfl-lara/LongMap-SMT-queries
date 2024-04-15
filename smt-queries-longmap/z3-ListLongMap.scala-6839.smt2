; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86064 () Bool)

(assert start!86064)

(declare-fun b!996876 () Bool)

(declare-fun e!562283 () Bool)

(declare-fun e!562285 () Bool)

(assert (=> b!996876 (= e!562283 e!562285)))

(declare-fun res!667114 () Bool)

(assert (=> b!996876 (=> (not res!667114) (not e!562285))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9296 0))(
  ( (MissingZero!9296 (index!39555 (_ BitVec 32))) (Found!9296 (index!39556 (_ BitVec 32))) (Intermediate!9296 (undefined!10108 Bool) (index!39557 (_ BitVec 32)) (x!86999 (_ BitVec 32))) (Undefined!9296) (MissingVacant!9296 (index!39558 (_ BitVec 32))) )
))
(declare-fun lt!441111 () SeekEntryResult!9296)

(declare-datatypes ((array!63016 0))(
  ( (array!63017 (arr!30339 (Array (_ BitVec 32) (_ BitVec 64))) (size!30843 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63016)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63016 (_ BitVec 32)) SeekEntryResult!9296)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996876 (= res!667114 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30339 a!3219) j!170) mask!3464) (select (arr!30339 a!3219) j!170) a!3219 mask!3464) lt!441111))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996876 (= lt!441111 (Intermediate!9296 false resIndex!38 resX!38))))

(declare-fun b!996877 () Bool)

(declare-fun res!667124 () Bool)

(declare-fun e!562284 () Bool)

(assert (=> b!996877 (=> (not res!667124) (not e!562284))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63016 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996877 (= res!667124 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996878 () Bool)

(declare-fun res!667122 () Bool)

(assert (=> b!996878 (=> (not res!667122) (not e!562284))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996878 (= res!667122 (and (= (size!30843 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30843 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30843 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996879 () Bool)

(declare-fun res!667119 () Bool)

(assert (=> b!996879 (=> (not res!667119) (not e!562285))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!996879 (= res!667119 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30339 a!3219) j!170) a!3219 mask!3464) lt!441111))))

(declare-fun b!996880 () Bool)

(declare-fun res!667121 () Bool)

(assert (=> b!996880 (=> (not res!667121) (not e!562283))))

(declare-datatypes ((List!21081 0))(
  ( (Nil!21078) (Cons!21077 (h!22242 (_ BitVec 64)) (t!30073 List!21081)) )
))
(declare-fun arrayNoDuplicates!0 (array!63016 (_ BitVec 32) List!21081) Bool)

(assert (=> b!996880 (= res!667121 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21078))))

(declare-fun res!667116 () Bool)

(assert (=> start!86064 (=> (not res!667116) (not e!562284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86064 (= res!667116 (validMask!0 mask!3464))))

(assert (=> start!86064 e!562284))

(declare-fun array_inv!23482 (array!63016) Bool)

(assert (=> start!86064 (array_inv!23482 a!3219)))

(assert (=> start!86064 true))

(declare-fun b!996881 () Bool)

(declare-fun res!667120 () Bool)

(assert (=> b!996881 (=> (not res!667120) (not e!562283))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63016 (_ BitVec 32)) Bool)

(assert (=> b!996881 (= res!667120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996882 () Bool)

(assert (=> b!996882 (= e!562285 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsgt mask!3464 #b00111111111111111111111111111111)))))

(declare-fun b!996883 () Bool)

(declare-fun res!667123 () Bool)

(assert (=> b!996883 (=> (not res!667123) (not e!562284))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996883 (= res!667123 (validKeyInArray!0 k0!2224))))

(declare-fun b!996884 () Bool)

(assert (=> b!996884 (= e!562284 e!562283)))

(declare-fun res!667115 () Bool)

(assert (=> b!996884 (=> (not res!667115) (not e!562283))))

(declare-fun lt!441112 () SeekEntryResult!9296)

(assert (=> b!996884 (= res!667115 (or (= lt!441112 (MissingVacant!9296 i!1194)) (= lt!441112 (MissingZero!9296 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63016 (_ BitVec 32)) SeekEntryResult!9296)

(assert (=> b!996884 (= lt!441112 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!996885 () Bool)

(declare-fun res!667117 () Bool)

(assert (=> b!996885 (=> (not res!667117) (not e!562283))))

(assert (=> b!996885 (= res!667117 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30843 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30843 a!3219))))))

(declare-fun b!996886 () Bool)

(declare-fun res!667118 () Bool)

(assert (=> b!996886 (=> (not res!667118) (not e!562284))))

(assert (=> b!996886 (= res!667118 (validKeyInArray!0 (select (arr!30339 a!3219) j!170)))))

(assert (= (and start!86064 res!667116) b!996878))

(assert (= (and b!996878 res!667122) b!996886))

(assert (= (and b!996886 res!667118) b!996883))

(assert (= (and b!996883 res!667123) b!996877))

(assert (= (and b!996877 res!667124) b!996884))

(assert (= (and b!996884 res!667115) b!996881))

(assert (= (and b!996881 res!667120) b!996880))

(assert (= (and b!996880 res!667121) b!996885))

(assert (= (and b!996885 res!667117) b!996876))

(assert (= (and b!996876 res!667114) b!996879))

(assert (= (and b!996879 res!667119) b!996882))

(declare-fun m!923323 () Bool)

(assert (=> b!996881 m!923323))

(declare-fun m!923325 () Bool)

(assert (=> b!996884 m!923325))

(declare-fun m!923327 () Bool)

(assert (=> start!86064 m!923327))

(declare-fun m!923329 () Bool)

(assert (=> start!86064 m!923329))

(declare-fun m!923331 () Bool)

(assert (=> b!996876 m!923331))

(assert (=> b!996876 m!923331))

(declare-fun m!923333 () Bool)

(assert (=> b!996876 m!923333))

(assert (=> b!996876 m!923333))

(assert (=> b!996876 m!923331))

(declare-fun m!923335 () Bool)

(assert (=> b!996876 m!923335))

(declare-fun m!923337 () Bool)

(assert (=> b!996877 m!923337))

(assert (=> b!996879 m!923331))

(assert (=> b!996879 m!923331))

(declare-fun m!923339 () Bool)

(assert (=> b!996879 m!923339))

(declare-fun m!923341 () Bool)

(assert (=> b!996880 m!923341))

(declare-fun m!923343 () Bool)

(assert (=> b!996883 m!923343))

(assert (=> b!996886 m!923331))

(assert (=> b!996886 m!923331))

(declare-fun m!923345 () Bool)

(assert (=> b!996886 m!923345))

(check-sat (not b!996880) (not b!996876) (not b!996879) (not start!86064) (not b!996886) (not b!996884) (not b!996881) (not b!996877) (not b!996883))
(check-sat)
(get-model)

(declare-fun bm!42214 () Bool)

(declare-fun call!42217 () Bool)

(declare-fun c!101026 () Bool)

(assert (=> bm!42214 (= call!42217 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101026 (Cons!21077 (select (arr!30339 a!3219) #b00000000000000000000000000000000) Nil!21078) Nil!21078)))))

(declare-fun b!996963 () Bool)

(declare-fun e!562319 () Bool)

(declare-fun e!562320 () Bool)

(assert (=> b!996963 (= e!562319 e!562320)))

(declare-fun res!667198 () Bool)

(assert (=> b!996963 (=> (not res!667198) (not e!562320))))

(declare-fun e!562322 () Bool)

(assert (=> b!996963 (= res!667198 (not e!562322))))

(declare-fun res!667199 () Bool)

(assert (=> b!996963 (=> (not res!667199) (not e!562322))))

(assert (=> b!996963 (= res!667199 (validKeyInArray!0 (select (arr!30339 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!996964 () Bool)

(declare-fun e!562321 () Bool)

(assert (=> b!996964 (= e!562320 e!562321)))

(assert (=> b!996964 (= c!101026 (validKeyInArray!0 (select (arr!30339 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!996966 () Bool)

(assert (=> b!996966 (= e!562321 call!42217)))

(declare-fun b!996967 () Bool)

(assert (=> b!996967 (= e!562321 call!42217)))

(declare-fun b!996965 () Bool)

(declare-fun contains!5841 (List!21081 (_ BitVec 64)) Bool)

(assert (=> b!996965 (= e!562322 (contains!5841 Nil!21078 (select (arr!30339 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!118857 () Bool)

(declare-fun res!667197 () Bool)

(assert (=> d!118857 (=> res!667197 e!562319)))

(assert (=> d!118857 (= res!667197 (bvsge #b00000000000000000000000000000000 (size!30843 a!3219)))))

(assert (=> d!118857 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21078) e!562319)))

(assert (= (and d!118857 (not res!667197)) b!996963))

(assert (= (and b!996963 res!667199) b!996965))

(assert (= (and b!996963 res!667198) b!996964))

(assert (= (and b!996964 c!101026) b!996966))

(assert (= (and b!996964 (not c!101026)) b!996967))

(assert (= (or b!996966 b!996967) bm!42214))

(declare-fun m!923395 () Bool)

(assert (=> bm!42214 m!923395))

(declare-fun m!923397 () Bool)

(assert (=> bm!42214 m!923397))

(assert (=> b!996963 m!923395))

(assert (=> b!996963 m!923395))

(declare-fun m!923399 () Bool)

(assert (=> b!996963 m!923399))

(assert (=> b!996964 m!923395))

(assert (=> b!996964 m!923395))

(assert (=> b!996964 m!923399))

(assert (=> b!996965 m!923395))

(assert (=> b!996965 m!923395))

(declare-fun m!923401 () Bool)

(assert (=> b!996965 m!923401))

(assert (=> b!996880 d!118857))

(declare-fun d!118859 () Bool)

(assert (=> d!118859 (= (validKeyInArray!0 (select (arr!30339 a!3219) j!170)) (and (not (= (select (arr!30339 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30339 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!996886 d!118859))

(declare-fun d!118861 () Bool)

(declare-fun res!667220 () Bool)

(declare-fun e!562347 () Bool)

(assert (=> d!118861 (=> res!667220 e!562347)))

(assert (=> d!118861 (= res!667220 (bvsge #b00000000000000000000000000000000 (size!30843 a!3219)))))

(assert (=> d!118861 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!562347)))

(declare-fun b!996997 () Bool)

(declare-fun e!562348 () Bool)

(declare-fun call!42223 () Bool)

(assert (=> b!996997 (= e!562348 call!42223)))

(declare-fun bm!42220 () Bool)

(assert (=> bm!42220 (= call!42223 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!996998 () Bool)

(declare-fun e!562349 () Bool)

(assert (=> b!996998 (= e!562349 e!562348)))

(declare-fun lt!441133 () (_ BitVec 64))

(assert (=> b!996998 (= lt!441133 (select (arr!30339 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32845 0))(
  ( (Unit!32846) )
))
(declare-fun lt!441131 () Unit!32845)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63016 (_ BitVec 64) (_ BitVec 32)) Unit!32845)

(assert (=> b!996998 (= lt!441131 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!441133 #b00000000000000000000000000000000))))

(assert (=> b!996998 (arrayContainsKey!0 a!3219 lt!441133 #b00000000000000000000000000000000)))

(declare-fun lt!441132 () Unit!32845)

(assert (=> b!996998 (= lt!441132 lt!441131)))

(declare-fun res!667219 () Bool)

(assert (=> b!996998 (= res!667219 (= (seekEntryOrOpen!0 (select (arr!30339 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9296 #b00000000000000000000000000000000)))))

(assert (=> b!996998 (=> (not res!667219) (not e!562348))))

(declare-fun b!996999 () Bool)

(assert (=> b!996999 (= e!562347 e!562349)))

(declare-fun c!101032 () Bool)

(assert (=> b!996999 (= c!101032 (validKeyInArray!0 (select (arr!30339 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!997000 () Bool)

(assert (=> b!997000 (= e!562349 call!42223)))

(assert (= (and d!118861 (not res!667220)) b!996999))

(assert (= (and b!996999 c!101032) b!996998))

(assert (= (and b!996999 (not c!101032)) b!997000))

(assert (= (and b!996998 res!667219) b!996997))

(assert (= (or b!996997 b!997000) bm!42220))

(declare-fun m!923413 () Bool)

(assert (=> bm!42220 m!923413))

(assert (=> b!996998 m!923395))

(declare-fun m!923415 () Bool)

(assert (=> b!996998 m!923415))

(declare-fun m!923419 () Bool)

(assert (=> b!996998 m!923419))

(assert (=> b!996998 m!923395))

(declare-fun m!923421 () Bool)

(assert (=> b!996998 m!923421))

(assert (=> b!996999 m!923395))

(assert (=> b!996999 m!923395))

(assert (=> b!996999 m!923399))

(assert (=> b!996881 d!118861))

(declare-fun b!997058 () Bool)

(declare-fun e!562385 () SeekEntryResult!9296)

(assert (=> b!997058 (= e!562385 (Intermediate!9296 true (toIndex!0 (select (arr!30339 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!997059 () Bool)

(declare-fun e!562384 () Bool)

(declare-fun e!562387 () Bool)

(assert (=> b!997059 (= e!562384 e!562387)))

(declare-fun res!667243 () Bool)

(declare-fun lt!441153 () SeekEntryResult!9296)

(get-info :version)

(assert (=> b!997059 (= res!667243 (and ((_ is Intermediate!9296) lt!441153) (not (undefined!10108 lt!441153)) (bvslt (x!86999 lt!441153) #b01111111111111111111111111111110) (bvsge (x!86999 lt!441153) #b00000000000000000000000000000000) (bvsge (x!86999 lt!441153) #b00000000000000000000000000000000)))))

(assert (=> b!997059 (=> (not res!667243) (not e!562387))))

(declare-fun b!997060 () Bool)

(assert (=> b!997060 (and (bvsge (index!39557 lt!441153) #b00000000000000000000000000000000) (bvslt (index!39557 lt!441153) (size!30843 a!3219)))))

(declare-fun res!667244 () Bool)

(assert (=> b!997060 (= res!667244 (= (select (arr!30339 a!3219) (index!39557 lt!441153)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!562388 () Bool)

(assert (=> b!997060 (=> res!667244 e!562388)))

(declare-fun b!997061 () Bool)

(assert (=> b!997061 (= e!562384 (bvsge (x!86999 lt!441153) #b01111111111111111111111111111110))))

(declare-fun b!997062 () Bool)

(assert (=> b!997062 (and (bvsge (index!39557 lt!441153) #b00000000000000000000000000000000) (bvslt (index!39557 lt!441153) (size!30843 a!3219)))))

(assert (=> b!997062 (= e!562388 (= (select (arr!30339 a!3219) (index!39557 lt!441153)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!997063 () Bool)

(declare-fun e!562386 () SeekEntryResult!9296)

(assert (=> b!997063 (= e!562386 (Intermediate!9296 false (toIndex!0 (select (arr!30339 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!997064 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997064 (= e!562386 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30339 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30339 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!997065 () Bool)

(assert (=> b!997065 (and (bvsge (index!39557 lt!441153) #b00000000000000000000000000000000) (bvslt (index!39557 lt!441153) (size!30843 a!3219)))))

(declare-fun res!667245 () Bool)

(assert (=> b!997065 (= res!667245 (= (select (arr!30339 a!3219) (index!39557 lt!441153)) (select (arr!30339 a!3219) j!170)))))

(assert (=> b!997065 (=> res!667245 e!562388)))

(assert (=> b!997065 (= e!562387 e!562388)))

(declare-fun d!118871 () Bool)

(assert (=> d!118871 e!562384))

(declare-fun c!101052 () Bool)

(assert (=> d!118871 (= c!101052 (and ((_ is Intermediate!9296) lt!441153) (undefined!10108 lt!441153)))))

(assert (=> d!118871 (= lt!441153 e!562385)))

(declare-fun c!101051 () Bool)

(assert (=> d!118871 (= c!101051 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!441154 () (_ BitVec 64))

(assert (=> d!118871 (= lt!441154 (select (arr!30339 a!3219) (toIndex!0 (select (arr!30339 a!3219) j!170) mask!3464)))))

(assert (=> d!118871 (validMask!0 mask!3464)))

(assert (=> d!118871 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30339 a!3219) j!170) mask!3464) (select (arr!30339 a!3219) j!170) a!3219 mask!3464) lt!441153)))

(declare-fun b!997066 () Bool)

(assert (=> b!997066 (= e!562385 e!562386)))

(declare-fun c!101053 () Bool)

(assert (=> b!997066 (= c!101053 (or (= lt!441154 (select (arr!30339 a!3219) j!170)) (= (bvadd lt!441154 lt!441154) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!118871 c!101051) b!997058))

(assert (= (and d!118871 (not c!101051)) b!997066))

(assert (= (and b!997066 c!101053) b!997063))

(assert (= (and b!997066 (not c!101053)) b!997064))

(assert (= (and d!118871 c!101052) b!997061))

(assert (= (and d!118871 (not c!101052)) b!997059))

(assert (= (and b!997059 res!667243) b!997065))

(assert (= (and b!997065 (not res!667245)) b!997060))

(assert (= (and b!997060 (not res!667244)) b!997062))

(assert (=> b!997064 m!923333))

(declare-fun m!923439 () Bool)

(assert (=> b!997064 m!923439))

(assert (=> b!997064 m!923439))

(assert (=> b!997064 m!923331))

(declare-fun m!923441 () Bool)

(assert (=> b!997064 m!923441))

(declare-fun m!923443 () Bool)

(assert (=> b!997060 m!923443))

(assert (=> d!118871 m!923333))

(declare-fun m!923445 () Bool)

(assert (=> d!118871 m!923445))

(assert (=> d!118871 m!923327))

(assert (=> b!997065 m!923443))

(assert (=> b!997062 m!923443))

(assert (=> b!996876 d!118871))

(declare-fun d!118879 () Bool)

(declare-fun lt!441172 () (_ BitVec 32))

(declare-fun lt!441171 () (_ BitVec 32))

(assert (=> d!118879 (= lt!441172 (bvmul (bvxor lt!441171 (bvlshr lt!441171 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!118879 (= lt!441171 ((_ extract 31 0) (bvand (bvxor (select (arr!30339 a!3219) j!170) (bvlshr (select (arr!30339 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!118879 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!667246 (let ((h!22246 ((_ extract 31 0) (bvand (bvxor (select (arr!30339 a!3219) j!170) (bvlshr (select (arr!30339 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87005 (bvmul (bvxor h!22246 (bvlshr h!22246 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87005 (bvlshr x!87005 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!667246 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!667246 #b00000000000000000000000000000000))))))

(assert (=> d!118879 (= (toIndex!0 (select (arr!30339 a!3219) j!170) mask!3464) (bvand (bvxor lt!441172 (bvlshr lt!441172 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!996876 d!118879))

(declare-fun d!118883 () Bool)

(assert (=> d!118883 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86064 d!118883))

(declare-fun d!118893 () Bool)

(assert (=> d!118893 (= (array_inv!23482 a!3219) (bvsge (size!30843 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86064 d!118893))

(declare-fun d!118895 () Bool)

(declare-fun res!667266 () Bool)

(declare-fun e!562424 () Bool)

(assert (=> d!118895 (=> res!667266 e!562424)))

(assert (=> d!118895 (= res!667266 (= (select (arr!30339 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!118895 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!562424)))

(declare-fun b!997120 () Bool)

(declare-fun e!562425 () Bool)

(assert (=> b!997120 (= e!562424 e!562425)))

(declare-fun res!667267 () Bool)

(assert (=> b!997120 (=> (not res!667267) (not e!562425))))

(assert (=> b!997120 (= res!667267 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30843 a!3219)))))

(declare-fun b!997121 () Bool)

(assert (=> b!997121 (= e!562425 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!118895 (not res!667266)) b!997120))

(assert (= (and b!997120 res!667267) b!997121))

(assert (=> d!118895 m!923395))

(declare-fun m!923479 () Bool)

(assert (=> b!997121 m!923479))

(assert (=> b!996877 d!118895))

(declare-fun d!118897 () Bool)

(assert (=> d!118897 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!996883 d!118897))

(declare-fun b!997178 () Bool)

(declare-fun c!101094 () Bool)

(declare-fun lt!441205 () (_ BitVec 64))

(assert (=> b!997178 (= c!101094 (= lt!441205 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!562457 () SeekEntryResult!9296)

(declare-fun e!562459 () SeekEntryResult!9296)

(assert (=> b!997178 (= e!562457 e!562459)))

(declare-fun b!997179 () Bool)

(declare-fun e!562458 () SeekEntryResult!9296)

(assert (=> b!997179 (= e!562458 Undefined!9296)))

(declare-fun d!118899 () Bool)

(declare-fun lt!441206 () SeekEntryResult!9296)

(assert (=> d!118899 (and (or ((_ is Undefined!9296) lt!441206) (not ((_ is Found!9296) lt!441206)) (and (bvsge (index!39556 lt!441206) #b00000000000000000000000000000000) (bvslt (index!39556 lt!441206) (size!30843 a!3219)))) (or ((_ is Undefined!9296) lt!441206) ((_ is Found!9296) lt!441206) (not ((_ is MissingZero!9296) lt!441206)) (and (bvsge (index!39555 lt!441206) #b00000000000000000000000000000000) (bvslt (index!39555 lt!441206) (size!30843 a!3219)))) (or ((_ is Undefined!9296) lt!441206) ((_ is Found!9296) lt!441206) ((_ is MissingZero!9296) lt!441206) (not ((_ is MissingVacant!9296) lt!441206)) (and (bvsge (index!39558 lt!441206) #b00000000000000000000000000000000) (bvslt (index!39558 lt!441206) (size!30843 a!3219)))) (or ((_ is Undefined!9296) lt!441206) (ite ((_ is Found!9296) lt!441206) (= (select (arr!30339 a!3219) (index!39556 lt!441206)) k0!2224) (ite ((_ is MissingZero!9296) lt!441206) (= (select (arr!30339 a!3219) (index!39555 lt!441206)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9296) lt!441206) (= (select (arr!30339 a!3219) (index!39558 lt!441206)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!118899 (= lt!441206 e!562458)))

(declare-fun c!101095 () Bool)

(declare-fun lt!441207 () SeekEntryResult!9296)

(assert (=> d!118899 (= c!101095 (and ((_ is Intermediate!9296) lt!441207) (undefined!10108 lt!441207)))))

(assert (=> d!118899 (= lt!441207 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!118899 (validMask!0 mask!3464)))

(assert (=> d!118899 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!441206)))

(declare-fun b!997180 () Bool)

(assert (=> b!997180 (= e!562459 (MissingZero!9296 (index!39557 lt!441207)))))

(declare-fun b!997181 () Bool)

(assert (=> b!997181 (= e!562458 e!562457)))

(assert (=> b!997181 (= lt!441205 (select (arr!30339 a!3219) (index!39557 lt!441207)))))

(declare-fun c!101093 () Bool)

(assert (=> b!997181 (= c!101093 (= lt!441205 k0!2224))))

(declare-fun b!997182 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63016 (_ BitVec 32)) SeekEntryResult!9296)

(assert (=> b!997182 (= e!562459 (seekKeyOrZeroReturnVacant!0 (x!86999 lt!441207) (index!39557 lt!441207) (index!39557 lt!441207) k0!2224 a!3219 mask!3464))))

(declare-fun b!997183 () Bool)

(assert (=> b!997183 (= e!562457 (Found!9296 (index!39557 lt!441207)))))

(assert (= (and d!118899 c!101095) b!997179))

(assert (= (and d!118899 (not c!101095)) b!997181))

(assert (= (and b!997181 c!101093) b!997183))

(assert (= (and b!997181 (not c!101093)) b!997178))

(assert (= (and b!997178 c!101094) b!997180))

(assert (= (and b!997178 (not c!101094)) b!997182))

(declare-fun m!923493 () Bool)

(assert (=> d!118899 m!923493))

(assert (=> d!118899 m!923327))

(declare-fun m!923495 () Bool)

(assert (=> d!118899 m!923495))

(assert (=> d!118899 m!923495))

(declare-fun m!923497 () Bool)

(assert (=> d!118899 m!923497))

(declare-fun m!923499 () Bool)

(assert (=> d!118899 m!923499))

(declare-fun m!923501 () Bool)

(assert (=> d!118899 m!923501))

(declare-fun m!923503 () Bool)

(assert (=> b!997181 m!923503))

(declare-fun m!923505 () Bool)

(assert (=> b!997182 m!923505))

(assert (=> b!996884 d!118899))

(declare-fun b!997184 () Bool)

(declare-fun e!562461 () SeekEntryResult!9296)

(assert (=> b!997184 (= e!562461 (Intermediate!9296 true index!1507 x!1245))))

(declare-fun b!997185 () Bool)

(declare-fun e!562460 () Bool)

(declare-fun e!562463 () Bool)

(assert (=> b!997185 (= e!562460 e!562463)))

(declare-fun res!667280 () Bool)

(declare-fun lt!441208 () SeekEntryResult!9296)

(assert (=> b!997185 (= res!667280 (and ((_ is Intermediate!9296) lt!441208) (not (undefined!10108 lt!441208)) (bvslt (x!86999 lt!441208) #b01111111111111111111111111111110) (bvsge (x!86999 lt!441208) #b00000000000000000000000000000000) (bvsge (x!86999 lt!441208) x!1245)))))

(assert (=> b!997185 (=> (not res!667280) (not e!562463))))

(declare-fun b!997186 () Bool)

(assert (=> b!997186 (and (bvsge (index!39557 lt!441208) #b00000000000000000000000000000000) (bvslt (index!39557 lt!441208) (size!30843 a!3219)))))

(declare-fun res!667281 () Bool)

(assert (=> b!997186 (= res!667281 (= (select (arr!30339 a!3219) (index!39557 lt!441208)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!562464 () Bool)

(assert (=> b!997186 (=> res!667281 e!562464)))

(declare-fun b!997187 () Bool)

(assert (=> b!997187 (= e!562460 (bvsge (x!86999 lt!441208) #b01111111111111111111111111111110))))

(declare-fun b!997188 () Bool)

(assert (=> b!997188 (and (bvsge (index!39557 lt!441208) #b00000000000000000000000000000000) (bvslt (index!39557 lt!441208) (size!30843 a!3219)))))

(assert (=> b!997188 (= e!562464 (= (select (arr!30339 a!3219) (index!39557 lt!441208)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!997189 () Bool)

(declare-fun e!562462 () SeekEntryResult!9296)

(assert (=> b!997189 (= e!562462 (Intermediate!9296 false index!1507 x!1245))))

(declare-fun b!997190 () Bool)

(assert (=> b!997190 (= e!562462 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30339 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!997191 () Bool)

(assert (=> b!997191 (and (bvsge (index!39557 lt!441208) #b00000000000000000000000000000000) (bvslt (index!39557 lt!441208) (size!30843 a!3219)))))

(declare-fun res!667282 () Bool)

(assert (=> b!997191 (= res!667282 (= (select (arr!30339 a!3219) (index!39557 lt!441208)) (select (arr!30339 a!3219) j!170)))))

(assert (=> b!997191 (=> res!667282 e!562464)))

(assert (=> b!997191 (= e!562463 e!562464)))

(declare-fun d!118909 () Bool)

(assert (=> d!118909 e!562460))

(declare-fun c!101097 () Bool)

(assert (=> d!118909 (= c!101097 (and ((_ is Intermediate!9296) lt!441208) (undefined!10108 lt!441208)))))

(assert (=> d!118909 (= lt!441208 e!562461)))

(declare-fun c!101096 () Bool)

(assert (=> d!118909 (= c!101096 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!441209 () (_ BitVec 64))

(assert (=> d!118909 (= lt!441209 (select (arr!30339 a!3219) index!1507))))

(assert (=> d!118909 (validMask!0 mask!3464)))

(assert (=> d!118909 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30339 a!3219) j!170) a!3219 mask!3464) lt!441208)))

(declare-fun b!997192 () Bool)

(assert (=> b!997192 (= e!562461 e!562462)))

(declare-fun c!101098 () Bool)

(assert (=> b!997192 (= c!101098 (or (= lt!441209 (select (arr!30339 a!3219) j!170)) (= (bvadd lt!441209 lt!441209) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!118909 c!101096) b!997184))

(assert (= (and d!118909 (not c!101096)) b!997192))

(assert (= (and b!997192 c!101098) b!997189))

(assert (= (and b!997192 (not c!101098)) b!997190))

(assert (= (and d!118909 c!101097) b!997187))

(assert (= (and d!118909 (not c!101097)) b!997185))

(assert (= (and b!997185 res!667280) b!997191))

(assert (= (and b!997191 (not res!667282)) b!997186))

(assert (= (and b!997186 (not res!667281)) b!997188))

(declare-fun m!923507 () Bool)

(assert (=> b!997190 m!923507))

(assert (=> b!997190 m!923507))

(assert (=> b!997190 m!923331))

(declare-fun m!923509 () Bool)

(assert (=> b!997190 m!923509))

(declare-fun m!923511 () Bool)

(assert (=> b!997186 m!923511))

(declare-fun m!923513 () Bool)

(assert (=> d!118909 m!923513))

(assert (=> d!118909 m!923327))

(assert (=> b!997191 m!923511))

(assert (=> b!997188 m!923511))

(assert (=> b!996879 d!118909))

(check-sat (not b!996998) (not b!996963) (not d!118899) (not b!997121) (not b!997190) (not d!118871) (not b!996965) (not bm!42220) (not b!997064) (not bm!42214) (not b!997182) (not d!118909) (not b!996964) (not b!996999))
(check-sat)
