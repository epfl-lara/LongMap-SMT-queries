; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86220 () Bool)

(assert start!86220)

(declare-fun b!998154 () Bool)

(declare-fun res!668078 () Bool)

(declare-fun e!562872 () Bool)

(assert (=> b!998154 (=> (not res!668078) (not e!562872))))

(declare-datatypes ((array!63070 0))(
  ( (array!63071 (arr!30363 (Array (_ BitVec 32) (_ BitVec 64))) (size!30867 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63070)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998154 (= res!668078 (and (= (size!30867 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30867 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30867 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!998155 () Bool)

(declare-fun res!668074 () Bool)

(assert (=> b!998155 (=> (not res!668074) (not e!562872))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998155 (= res!668074 (validKeyInArray!0 k0!2224))))

(declare-fun b!998156 () Bool)

(declare-fun res!668082 () Bool)

(assert (=> b!998156 (=> (not res!668082) (not e!562872))))

(assert (=> b!998156 (= res!668082 (validKeyInArray!0 (select (arr!30363 a!3219) j!170)))))

(declare-fun res!668084 () Bool)

(assert (=> start!86220 (=> (not res!668084) (not e!562872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86220 (= res!668084 (validMask!0 mask!3464))))

(assert (=> start!86220 e!562872))

(declare-fun array_inv!23506 (array!63070) Bool)

(assert (=> start!86220 (array_inv!23506 a!3219)))

(assert (=> start!86220 true))

(declare-fun b!998157 () Bool)

(declare-fun e!562873 () Bool)

(assert (=> b!998157 (= e!562872 e!562873)))

(declare-fun res!668079 () Bool)

(assert (=> b!998157 (=> (not res!668079) (not e!562873))))

(declare-datatypes ((SeekEntryResult!9320 0))(
  ( (MissingZero!9320 (index!39651 (_ BitVec 32))) (Found!9320 (index!39652 (_ BitVec 32))) (Intermediate!9320 (undefined!10132 Bool) (index!39653 (_ BitVec 32)) (x!87099 (_ BitVec 32))) (Undefined!9320) (MissingVacant!9320 (index!39654 (_ BitVec 32))) )
))
(declare-fun lt!441456 () SeekEntryResult!9320)

(assert (=> b!998157 (= res!668079 (or (= lt!441456 (MissingVacant!9320 i!1194)) (= lt!441456 (MissingZero!9320 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63070 (_ BitVec 32)) SeekEntryResult!9320)

(assert (=> b!998157 (= lt!441456 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!998158 () Bool)

(declare-fun e!562871 () Bool)

(assert (=> b!998158 (= e!562871 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsgt mask!3464 #b00111111111111111111111111111111)))))

(declare-fun b!998159 () Bool)

(declare-fun res!668077 () Bool)

(assert (=> b!998159 (=> (not res!668077) (not e!562873))))

(declare-datatypes ((List!21105 0))(
  ( (Nil!21102) (Cons!21101 (h!22272 (_ BitVec 64)) (t!30097 List!21105)) )
))
(declare-fun arrayNoDuplicates!0 (array!63070 (_ BitVec 32) List!21105) Bool)

(assert (=> b!998159 (= res!668077 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21102))))

(declare-fun b!998160 () Bool)

(declare-fun res!668076 () Bool)

(assert (=> b!998160 (=> (not res!668076) (not e!562873))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998160 (= res!668076 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30867 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30867 a!3219))))))

(declare-fun b!998161 () Bool)

(declare-fun res!668083 () Bool)

(assert (=> b!998161 (=> (not res!668083) (not e!562872))))

(declare-fun arrayContainsKey!0 (array!63070 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998161 (= res!668083 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998162 () Bool)

(declare-fun res!668080 () Bool)

(assert (=> b!998162 (=> (not res!668080) (not e!562873))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63070 (_ BitVec 32)) Bool)

(assert (=> b!998162 (= res!668080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!998163 () Bool)

(assert (=> b!998163 (= e!562873 e!562871)))

(declare-fun res!668075 () Bool)

(assert (=> b!998163 (=> (not res!668075) (not e!562871))))

(declare-fun lt!441457 () SeekEntryResult!9320)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63070 (_ BitVec 32)) SeekEntryResult!9320)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998163 (= res!668075 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30363 a!3219) j!170) mask!3464) (select (arr!30363 a!3219) j!170) a!3219 mask!3464) lt!441457))))

(assert (=> b!998163 (= lt!441457 (Intermediate!9320 false resIndex!38 resX!38))))

(declare-fun b!998164 () Bool)

(declare-fun res!668081 () Bool)

(assert (=> b!998164 (=> (not res!668081) (not e!562871))))

(assert (=> b!998164 (= res!668081 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30363 a!3219) j!170) a!3219 mask!3464) lt!441457))))

(assert (= (and start!86220 res!668084) b!998154))

(assert (= (and b!998154 res!668078) b!998156))

(assert (= (and b!998156 res!668082) b!998155))

(assert (= (and b!998155 res!668074) b!998161))

(assert (= (and b!998161 res!668083) b!998157))

(assert (= (and b!998157 res!668079) b!998162))

(assert (= (and b!998162 res!668080) b!998159))

(assert (= (and b!998159 res!668077) b!998160))

(assert (= (and b!998160 res!668076) b!998163))

(assert (= (and b!998163 res!668075) b!998164))

(assert (= (and b!998164 res!668081) b!998158))

(declare-fun m!924187 () Bool)

(assert (=> b!998161 m!924187))

(declare-fun m!924189 () Bool)

(assert (=> b!998163 m!924189))

(assert (=> b!998163 m!924189))

(declare-fun m!924191 () Bool)

(assert (=> b!998163 m!924191))

(assert (=> b!998163 m!924191))

(assert (=> b!998163 m!924189))

(declare-fun m!924193 () Bool)

(assert (=> b!998163 m!924193))

(declare-fun m!924195 () Bool)

(assert (=> b!998162 m!924195))

(declare-fun m!924197 () Bool)

(assert (=> b!998155 m!924197))

(declare-fun m!924199 () Bool)

(assert (=> b!998157 m!924199))

(declare-fun m!924201 () Bool)

(assert (=> start!86220 m!924201))

(declare-fun m!924203 () Bool)

(assert (=> start!86220 m!924203))

(declare-fun m!924205 () Bool)

(assert (=> b!998159 m!924205))

(assert (=> b!998164 m!924189))

(assert (=> b!998164 m!924189))

(declare-fun m!924207 () Bool)

(assert (=> b!998164 m!924207))

(assert (=> b!998156 m!924189))

(assert (=> b!998156 m!924189))

(declare-fun m!924209 () Bool)

(assert (=> b!998156 m!924209))

(check-sat (not b!998156) (not b!998155) (not b!998164) (not b!998159) (not start!86220) (not b!998163) (not b!998157) (not b!998161) (not b!998162))
(check-sat)
(get-model)

(declare-fun d!119005 () Bool)

(declare-fun e!562913 () Bool)

(assert (=> d!119005 e!562913))

(declare-fun c!101194 () Bool)

(declare-fun lt!441474 () SeekEntryResult!9320)

(get-info :version)

(assert (=> d!119005 (= c!101194 (and ((_ is Intermediate!9320) lt!441474) (undefined!10132 lt!441474)))))

(declare-fun e!562909 () SeekEntryResult!9320)

(assert (=> d!119005 (= lt!441474 e!562909)))

(declare-fun c!101192 () Bool)

(assert (=> d!119005 (= c!101192 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!441475 () (_ BitVec 64))

(assert (=> d!119005 (= lt!441475 (select (arr!30363 a!3219) index!1507))))

(assert (=> d!119005 (validMask!0 mask!3464)))

(assert (=> d!119005 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30363 a!3219) j!170) a!3219 mask!3464) lt!441474)))

(declare-fun b!998249 () Bool)

(declare-fun e!562910 () Bool)

(assert (=> b!998249 (= e!562913 e!562910)))

(declare-fun res!668159 () Bool)

(assert (=> b!998249 (= res!668159 (and ((_ is Intermediate!9320) lt!441474) (not (undefined!10132 lt!441474)) (bvslt (x!87099 lt!441474) #b01111111111111111111111111111110) (bvsge (x!87099 lt!441474) #b00000000000000000000000000000000) (bvsge (x!87099 lt!441474) x!1245)))))

(assert (=> b!998249 (=> (not res!668159) (not e!562910))))

(declare-fun b!998250 () Bool)

(declare-fun e!562912 () SeekEntryResult!9320)

(assert (=> b!998250 (= e!562912 (Intermediate!9320 false index!1507 x!1245))))

(declare-fun b!998251 () Bool)

(assert (=> b!998251 (and (bvsge (index!39653 lt!441474) #b00000000000000000000000000000000) (bvslt (index!39653 lt!441474) (size!30867 a!3219)))))

(declare-fun res!668157 () Bool)

(assert (=> b!998251 (= res!668157 (= (select (arr!30363 a!3219) (index!39653 lt!441474)) (select (arr!30363 a!3219) j!170)))))

(declare-fun e!562911 () Bool)

(assert (=> b!998251 (=> res!668157 e!562911)))

(assert (=> b!998251 (= e!562910 e!562911)))

(declare-fun b!998252 () Bool)

(assert (=> b!998252 (= e!562909 e!562912)))

(declare-fun c!101193 () Bool)

(assert (=> b!998252 (= c!101193 (or (= lt!441475 (select (arr!30363 a!3219) j!170)) (= (bvadd lt!441475 lt!441475) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!998253 () Bool)

(assert (=> b!998253 (= e!562909 (Intermediate!9320 true index!1507 x!1245))))

(declare-fun b!998254 () Bool)

(assert (=> b!998254 (= e!562913 (bvsge (x!87099 lt!441474) #b01111111111111111111111111111110))))

(declare-fun b!998255 () Bool)

(assert (=> b!998255 (and (bvsge (index!39653 lt!441474) #b00000000000000000000000000000000) (bvslt (index!39653 lt!441474) (size!30867 a!3219)))))

(assert (=> b!998255 (= e!562911 (= (select (arr!30363 a!3219) (index!39653 lt!441474)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!998256 () Bool)

(assert (=> b!998256 (and (bvsge (index!39653 lt!441474) #b00000000000000000000000000000000) (bvslt (index!39653 lt!441474) (size!30867 a!3219)))))

(declare-fun res!668158 () Bool)

(assert (=> b!998256 (= res!668158 (= (select (arr!30363 a!3219) (index!39653 lt!441474)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!998256 (=> res!668158 e!562911)))

(declare-fun b!998257 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998257 (= e!562912 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30363 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and d!119005 c!101192) b!998253))

(assert (= (and d!119005 (not c!101192)) b!998252))

(assert (= (and b!998252 c!101193) b!998250))

(assert (= (and b!998252 (not c!101193)) b!998257))

(assert (= (and d!119005 c!101194) b!998254))

(assert (= (and d!119005 (not c!101194)) b!998249))

(assert (= (and b!998249 res!668159) b!998251))

(assert (= (and b!998251 (not res!668157)) b!998256))

(assert (= (and b!998256 (not res!668158)) b!998255))

(declare-fun m!924259 () Bool)

(assert (=> b!998256 m!924259))

(declare-fun m!924261 () Bool)

(assert (=> b!998257 m!924261))

(assert (=> b!998257 m!924261))

(assert (=> b!998257 m!924189))

(declare-fun m!924263 () Bool)

(assert (=> b!998257 m!924263))

(assert (=> b!998255 m!924259))

(assert (=> b!998251 m!924259))

(declare-fun m!924265 () Bool)

(assert (=> d!119005 m!924265))

(assert (=> d!119005 m!924201))

(assert (=> b!998164 d!119005))

(declare-fun b!998268 () Bool)

(declare-fun e!562924 () Bool)

(declare-fun call!42253 () Bool)

(assert (=> b!998268 (= e!562924 call!42253)))

(declare-fun b!998269 () Bool)

(declare-fun e!562922 () Bool)

(assert (=> b!998269 (= e!562922 e!562924)))

(declare-fun c!101197 () Bool)

(assert (=> b!998269 (= c!101197 (validKeyInArray!0 (select (arr!30363 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!998270 () Bool)

(declare-fun e!562925 () Bool)

(assert (=> b!998270 (= e!562925 e!562922)))

(declare-fun res!668167 () Bool)

(assert (=> b!998270 (=> (not res!668167) (not e!562922))))

(declare-fun e!562923 () Bool)

(assert (=> b!998270 (= res!668167 (not e!562923))))

(declare-fun res!668166 () Bool)

(assert (=> b!998270 (=> (not res!668166) (not e!562923))))

(assert (=> b!998270 (= res!668166 (validKeyInArray!0 (select (arr!30363 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!998271 () Bool)

(assert (=> b!998271 (= e!562924 call!42253)))

(declare-fun bm!42250 () Bool)

(assert (=> bm!42250 (= call!42253 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101197 (Cons!21101 (select (arr!30363 a!3219) #b00000000000000000000000000000000) Nil!21102) Nil!21102)))))

(declare-fun b!998272 () Bool)

(declare-fun contains!5847 (List!21105 (_ BitVec 64)) Bool)

(assert (=> b!998272 (= e!562923 (contains!5847 Nil!21102 (select (arr!30363 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119011 () Bool)

(declare-fun res!668168 () Bool)

(assert (=> d!119011 (=> res!668168 e!562925)))

(assert (=> d!119011 (= res!668168 (bvsge #b00000000000000000000000000000000 (size!30867 a!3219)))))

(assert (=> d!119011 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21102) e!562925)))

(assert (= (and d!119011 (not res!668168)) b!998270))

(assert (= (and b!998270 res!668166) b!998272))

(assert (= (and b!998270 res!668167) b!998269))

(assert (= (and b!998269 c!101197) b!998271))

(assert (= (and b!998269 (not c!101197)) b!998268))

(assert (= (or b!998271 b!998268) bm!42250))

(declare-fun m!924267 () Bool)

(assert (=> b!998269 m!924267))

(assert (=> b!998269 m!924267))

(declare-fun m!924269 () Bool)

(assert (=> b!998269 m!924269))

(assert (=> b!998270 m!924267))

(assert (=> b!998270 m!924267))

(assert (=> b!998270 m!924269))

(assert (=> bm!42250 m!924267))

(declare-fun m!924271 () Bool)

(assert (=> bm!42250 m!924271))

(assert (=> b!998272 m!924267))

(assert (=> b!998272 m!924267))

(declare-fun m!924273 () Bool)

(assert (=> b!998272 m!924273))

(assert (=> b!998159 d!119011))

(declare-fun d!119017 () Bool)

(assert (=> d!119017 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86220 d!119017))

(declare-fun d!119019 () Bool)

(assert (=> d!119019 (= (array_inv!23506 a!3219) (bvsge (size!30867 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86220 d!119019))

(declare-fun d!119021 () Bool)

(assert (=> d!119021 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!998155 d!119021))

(declare-fun d!119023 () Bool)

(assert (=> d!119023 (= (validKeyInArray!0 (select (arr!30363 a!3219) j!170)) (and (not (= (select (arr!30363 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30363 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!998156 d!119023))

(declare-fun d!119025 () Bool)

(declare-fun res!668183 () Bool)

(declare-fun e!562949 () Bool)

(assert (=> d!119025 (=> res!668183 e!562949)))

(assert (=> d!119025 (= res!668183 (= (select (arr!30363 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!119025 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!562949)))

(declare-fun b!998312 () Bool)

(declare-fun e!562950 () Bool)

(assert (=> b!998312 (= e!562949 e!562950)))

(declare-fun res!668184 () Bool)

(assert (=> b!998312 (=> (not res!668184) (not e!562950))))

(assert (=> b!998312 (= res!668184 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30867 a!3219)))))

(declare-fun b!998313 () Bool)

(assert (=> b!998313 (= e!562950 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119025 (not res!668183)) b!998312))

(assert (= (and b!998312 res!668184) b!998313))

(assert (=> d!119025 m!924267))

(declare-fun m!924283 () Bool)

(assert (=> b!998313 m!924283))

(assert (=> b!998161 d!119025))

(declare-fun d!119029 () Bool)

(declare-fun e!562957 () Bool)

(assert (=> d!119029 e!562957))

(declare-fun c!101215 () Bool)

(declare-fun lt!441488 () SeekEntryResult!9320)

(assert (=> d!119029 (= c!101215 (and ((_ is Intermediate!9320) lt!441488) (undefined!10132 lt!441488)))))

(declare-fun e!562953 () SeekEntryResult!9320)

(assert (=> d!119029 (= lt!441488 e!562953)))

(declare-fun c!101213 () Bool)

(assert (=> d!119029 (= c!101213 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!441489 () (_ BitVec 64))

(assert (=> d!119029 (= lt!441489 (select (arr!30363 a!3219) (toIndex!0 (select (arr!30363 a!3219) j!170) mask!3464)))))

(assert (=> d!119029 (validMask!0 mask!3464)))

(assert (=> d!119029 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30363 a!3219) j!170) mask!3464) (select (arr!30363 a!3219) j!170) a!3219 mask!3464) lt!441488)))

(declare-fun b!998318 () Bool)

(declare-fun e!562954 () Bool)

(assert (=> b!998318 (= e!562957 e!562954)))

(declare-fun res!668187 () Bool)

(assert (=> b!998318 (= res!668187 (and ((_ is Intermediate!9320) lt!441488) (not (undefined!10132 lt!441488)) (bvslt (x!87099 lt!441488) #b01111111111111111111111111111110) (bvsge (x!87099 lt!441488) #b00000000000000000000000000000000) (bvsge (x!87099 lt!441488) #b00000000000000000000000000000000)))))

(assert (=> b!998318 (=> (not res!668187) (not e!562954))))

(declare-fun e!562956 () SeekEntryResult!9320)

(declare-fun b!998319 () Bool)

(assert (=> b!998319 (= e!562956 (Intermediate!9320 false (toIndex!0 (select (arr!30363 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!998320 () Bool)

(assert (=> b!998320 (and (bvsge (index!39653 lt!441488) #b00000000000000000000000000000000) (bvslt (index!39653 lt!441488) (size!30867 a!3219)))))

(declare-fun res!668185 () Bool)

(assert (=> b!998320 (= res!668185 (= (select (arr!30363 a!3219) (index!39653 lt!441488)) (select (arr!30363 a!3219) j!170)))))

(declare-fun e!562955 () Bool)

(assert (=> b!998320 (=> res!668185 e!562955)))

(assert (=> b!998320 (= e!562954 e!562955)))

(declare-fun b!998321 () Bool)

(assert (=> b!998321 (= e!562953 e!562956)))

(declare-fun c!101214 () Bool)

(assert (=> b!998321 (= c!101214 (or (= lt!441489 (select (arr!30363 a!3219) j!170)) (= (bvadd lt!441489 lt!441489) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!998322 () Bool)

(assert (=> b!998322 (= e!562953 (Intermediate!9320 true (toIndex!0 (select (arr!30363 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!998323 () Bool)

(assert (=> b!998323 (= e!562957 (bvsge (x!87099 lt!441488) #b01111111111111111111111111111110))))

(declare-fun b!998324 () Bool)

(assert (=> b!998324 (and (bvsge (index!39653 lt!441488) #b00000000000000000000000000000000) (bvslt (index!39653 lt!441488) (size!30867 a!3219)))))

(assert (=> b!998324 (= e!562955 (= (select (arr!30363 a!3219) (index!39653 lt!441488)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!998325 () Bool)

(assert (=> b!998325 (and (bvsge (index!39653 lt!441488) #b00000000000000000000000000000000) (bvslt (index!39653 lt!441488) (size!30867 a!3219)))))

(declare-fun res!668186 () Bool)

(assert (=> b!998325 (= res!668186 (= (select (arr!30363 a!3219) (index!39653 lt!441488)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!998325 (=> res!668186 e!562955)))

(declare-fun b!998326 () Bool)

(assert (=> b!998326 (= e!562956 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30363 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30363 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and d!119029 c!101213) b!998322))

(assert (= (and d!119029 (not c!101213)) b!998321))

(assert (= (and b!998321 c!101214) b!998319))

(assert (= (and b!998321 (not c!101214)) b!998326))

(assert (= (and d!119029 c!101215) b!998323))

(assert (= (and d!119029 (not c!101215)) b!998318))

(assert (= (and b!998318 res!668187) b!998320))

(assert (= (and b!998320 (not res!668185)) b!998325))

(assert (= (and b!998325 (not res!668186)) b!998324))

(declare-fun m!924285 () Bool)

(assert (=> b!998325 m!924285))

(assert (=> b!998326 m!924191))

(declare-fun m!924287 () Bool)

(assert (=> b!998326 m!924287))

(assert (=> b!998326 m!924287))

(assert (=> b!998326 m!924189))

(declare-fun m!924289 () Bool)

(assert (=> b!998326 m!924289))

(assert (=> b!998324 m!924285))

(assert (=> b!998320 m!924285))

(assert (=> d!119029 m!924191))

(declare-fun m!924291 () Bool)

(assert (=> d!119029 m!924291))

(assert (=> d!119029 m!924201))

(assert (=> b!998163 d!119029))

(declare-fun d!119031 () Bool)

(declare-fun lt!441504 () (_ BitVec 32))

(declare-fun lt!441503 () (_ BitVec 32))

(assert (=> d!119031 (= lt!441504 (bvmul (bvxor lt!441503 (bvlshr lt!441503 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119031 (= lt!441503 ((_ extract 31 0) (bvand (bvxor (select (arr!30363 a!3219) j!170) (bvlshr (select (arr!30363 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119031 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!668188 (let ((h!22276 ((_ extract 31 0) (bvand (bvxor (select (arr!30363 a!3219) j!170) (bvlshr (select (arr!30363 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87105 (bvmul (bvxor h!22276 (bvlshr h!22276 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87105 (bvlshr x!87105 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!668188 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!668188 #b00000000000000000000000000000000))))))

(assert (=> d!119031 (= (toIndex!0 (select (arr!30363 a!3219) j!170) mask!3464) (bvand (bvxor lt!441504 (bvlshr lt!441504 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!998163 d!119031))

(declare-fun d!119039 () Bool)

(declare-fun res!668193 () Bool)

(declare-fun e!562967 () Bool)

(assert (=> d!119039 (=> res!668193 e!562967)))

(assert (=> d!119039 (= res!668193 (bvsge #b00000000000000000000000000000000 (size!30867 a!3219)))))

(assert (=> d!119039 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!562967)))

(declare-fun bm!42253 () Bool)

(declare-fun call!42256 () Bool)

(assert (=> bm!42253 (= call!42256 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!998341 () Bool)

(declare-fun e!562968 () Bool)

(assert (=> b!998341 (= e!562968 call!42256)))

(declare-fun b!998342 () Bool)

(declare-fun e!562969 () Bool)

(assert (=> b!998342 (= e!562969 e!562968)))

(declare-fun lt!441512 () (_ BitVec 64))

(assert (=> b!998342 (= lt!441512 (select (arr!30363 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32857 0))(
  ( (Unit!32858) )
))
(declare-fun lt!441513 () Unit!32857)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63070 (_ BitVec 64) (_ BitVec 32)) Unit!32857)

(assert (=> b!998342 (= lt!441513 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!441512 #b00000000000000000000000000000000))))

(assert (=> b!998342 (arrayContainsKey!0 a!3219 lt!441512 #b00000000000000000000000000000000)))

(declare-fun lt!441511 () Unit!32857)

(assert (=> b!998342 (= lt!441511 lt!441513)))

(declare-fun res!668194 () Bool)

(assert (=> b!998342 (= res!668194 (= (seekEntryOrOpen!0 (select (arr!30363 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9320 #b00000000000000000000000000000000)))))

(assert (=> b!998342 (=> (not res!668194) (not e!562968))))

(declare-fun b!998343 () Bool)

(assert (=> b!998343 (= e!562967 e!562969)))

(declare-fun c!101221 () Bool)

(assert (=> b!998343 (= c!101221 (validKeyInArray!0 (select (arr!30363 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!998344 () Bool)

(assert (=> b!998344 (= e!562969 call!42256)))

(assert (= (and d!119039 (not res!668193)) b!998343))

(assert (= (and b!998343 c!101221) b!998342))

(assert (= (and b!998343 (not c!101221)) b!998344))

(assert (= (and b!998342 res!668194) b!998341))

(assert (= (or b!998341 b!998344) bm!42253))

(declare-fun m!924307 () Bool)

(assert (=> bm!42253 m!924307))

(assert (=> b!998342 m!924267))

(declare-fun m!924309 () Bool)

(assert (=> b!998342 m!924309))

(declare-fun m!924311 () Bool)

(assert (=> b!998342 m!924311))

(assert (=> b!998342 m!924267))

(declare-fun m!924313 () Bool)

(assert (=> b!998342 m!924313))

(assert (=> b!998343 m!924267))

(assert (=> b!998343 m!924267))

(assert (=> b!998343 m!924269))

(assert (=> b!998162 d!119039))

(declare-fun b!998414 () Bool)

(declare-fun e!563010 () SeekEntryResult!9320)

(assert (=> b!998414 (= e!563010 Undefined!9320)))

(declare-fun b!998415 () Bool)

(declare-fun e!563011 () SeekEntryResult!9320)

(declare-fun lt!441551 () SeekEntryResult!9320)

(assert (=> b!998415 (= e!563011 (MissingZero!9320 (index!39653 lt!441551)))))

(declare-fun b!998416 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63070 (_ BitVec 32)) SeekEntryResult!9320)

(assert (=> b!998416 (= e!563011 (seekKeyOrZeroReturnVacant!0 (x!87099 lt!441551) (index!39653 lt!441551) (index!39653 lt!441551) k0!2224 a!3219 mask!3464))))

(declare-fun d!119041 () Bool)

(declare-fun lt!441552 () SeekEntryResult!9320)

(assert (=> d!119041 (and (or ((_ is Undefined!9320) lt!441552) (not ((_ is Found!9320) lt!441552)) (and (bvsge (index!39652 lt!441552) #b00000000000000000000000000000000) (bvslt (index!39652 lt!441552) (size!30867 a!3219)))) (or ((_ is Undefined!9320) lt!441552) ((_ is Found!9320) lt!441552) (not ((_ is MissingZero!9320) lt!441552)) (and (bvsge (index!39651 lt!441552) #b00000000000000000000000000000000) (bvslt (index!39651 lt!441552) (size!30867 a!3219)))) (or ((_ is Undefined!9320) lt!441552) ((_ is Found!9320) lt!441552) ((_ is MissingZero!9320) lt!441552) (not ((_ is MissingVacant!9320) lt!441552)) (and (bvsge (index!39654 lt!441552) #b00000000000000000000000000000000) (bvslt (index!39654 lt!441552) (size!30867 a!3219)))) (or ((_ is Undefined!9320) lt!441552) (ite ((_ is Found!9320) lt!441552) (= (select (arr!30363 a!3219) (index!39652 lt!441552)) k0!2224) (ite ((_ is MissingZero!9320) lt!441552) (= (select (arr!30363 a!3219) (index!39651 lt!441552)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9320) lt!441552) (= (select (arr!30363 a!3219) (index!39654 lt!441552)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119041 (= lt!441552 e!563010)))

(declare-fun c!101249 () Bool)

(assert (=> d!119041 (= c!101249 (and ((_ is Intermediate!9320) lt!441551) (undefined!10132 lt!441551)))))

(assert (=> d!119041 (= lt!441551 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!119041 (validMask!0 mask!3464)))

(assert (=> d!119041 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!441552)))

(declare-fun b!998417 () Bool)

(declare-fun e!563009 () SeekEntryResult!9320)

(assert (=> b!998417 (= e!563010 e!563009)))

(declare-fun lt!441550 () (_ BitVec 64))

(assert (=> b!998417 (= lt!441550 (select (arr!30363 a!3219) (index!39653 lt!441551)))))

(declare-fun c!101250 () Bool)

(assert (=> b!998417 (= c!101250 (= lt!441550 k0!2224))))

(declare-fun b!998418 () Bool)

(assert (=> b!998418 (= e!563009 (Found!9320 (index!39653 lt!441551)))))

(declare-fun b!998419 () Bool)

(declare-fun c!101251 () Bool)

(assert (=> b!998419 (= c!101251 (= lt!441550 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!998419 (= e!563009 e!563011)))

(assert (= (and d!119041 c!101249) b!998414))

(assert (= (and d!119041 (not c!101249)) b!998417))

(assert (= (and b!998417 c!101250) b!998418))

(assert (= (and b!998417 (not c!101250)) b!998419))

(assert (= (and b!998419 c!101251) b!998415))

(assert (= (and b!998419 (not c!101251)) b!998416))

(declare-fun m!924349 () Bool)

(assert (=> b!998416 m!924349))

(assert (=> d!119041 m!924201))

(declare-fun m!924351 () Bool)

(assert (=> d!119041 m!924351))

(assert (=> d!119041 m!924351))

(declare-fun m!924353 () Bool)

(assert (=> d!119041 m!924353))

(declare-fun m!924355 () Bool)

(assert (=> d!119041 m!924355))

(declare-fun m!924357 () Bool)

(assert (=> d!119041 m!924357))

(declare-fun m!924359 () Bool)

(assert (=> d!119041 m!924359))

(declare-fun m!924361 () Bool)

(assert (=> b!998417 m!924361))

(assert (=> b!998157 d!119041))

(check-sat (not bm!42253) (not b!998343) (not b!998272) (not b!998416) (not b!998342) (not b!998326) (not d!119041) (not b!998270) (not b!998257) (not b!998269) (not b!998313) (not d!119029) (not bm!42250) (not d!119005))
(check-sat)
