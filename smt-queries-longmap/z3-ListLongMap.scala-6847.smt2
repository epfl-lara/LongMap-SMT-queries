; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86230 () Bool)

(assert start!86230)

(declare-fun b!998405 () Bool)

(declare-fun res!668205 () Bool)

(declare-fun e!563014 () Bool)

(assert (=> b!998405 (=> (not res!668205) (not e!563014))))

(declare-datatypes ((array!63133 0))(
  ( (array!63134 (arr!30395 (Array (_ BitVec 32) (_ BitVec 64))) (size!30897 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63133)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63133 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998405 (= res!668205 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998406 () Bool)

(declare-fun res!668202 () Bool)

(declare-fun e!563016 () Bool)

(assert (=> b!998406 (=> (not res!668202) (not e!563016))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998406 (= res!668202 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30897 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30897 a!3219))))))

(declare-fun b!998407 () Bool)

(assert (=> b!998407 (= e!563014 e!563016)))

(declare-fun res!668204 () Bool)

(assert (=> b!998407 (=> (not res!668204) (not e!563016))))

(declare-datatypes ((SeekEntryResult!9327 0))(
  ( (MissingZero!9327 (index!39679 (_ BitVec 32))) (Found!9327 (index!39680 (_ BitVec 32))) (Intermediate!9327 (undefined!10139 Bool) (index!39681 (_ BitVec 32)) (x!87111 (_ BitVec 32))) (Undefined!9327) (MissingVacant!9327 (index!39682 (_ BitVec 32))) )
))
(declare-fun lt!441694 () SeekEntryResult!9327)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998407 (= res!668204 (or (= lt!441694 (MissingVacant!9327 i!1194)) (= lt!441694 (MissingZero!9327 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63133 (_ BitVec 32)) SeekEntryResult!9327)

(assert (=> b!998407 (= lt!441694 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!998408 () Bool)

(declare-fun res!668211 () Bool)

(assert (=> b!998408 (=> (not res!668211) (not e!563016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63133 (_ BitVec 32)) Bool)

(assert (=> b!998408 (= res!668211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!998409 () Bool)

(declare-fun e!563015 () Bool)

(assert (=> b!998409 (= e!563015 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsgt mask!3464 #b00111111111111111111111111111111)))))

(declare-fun b!998410 () Bool)

(declare-fun res!668210 () Bool)

(assert (=> b!998410 (=> (not res!668210) (not e!563016))))

(declare-datatypes ((List!21071 0))(
  ( (Nil!21068) (Cons!21067 (h!22238 (_ BitVec 64)) (t!30072 List!21071)) )
))
(declare-fun arrayNoDuplicates!0 (array!63133 (_ BitVec 32) List!21071) Bool)

(assert (=> b!998410 (= res!668210 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21068))))

(declare-fun b!998411 () Bool)

(declare-fun res!668201 () Bool)

(assert (=> b!998411 (=> (not res!668201) (not e!563015))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!441695 () SeekEntryResult!9327)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63133 (_ BitVec 32)) SeekEntryResult!9327)

(assert (=> b!998411 (= res!668201 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30395 a!3219) j!170) a!3219 mask!3464) lt!441695))))

(declare-fun res!668209 () Bool)

(assert (=> start!86230 (=> (not res!668209) (not e!563014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86230 (= res!668209 (validMask!0 mask!3464))))

(assert (=> start!86230 e!563014))

(declare-fun array_inv!23519 (array!63133) Bool)

(assert (=> start!86230 (array_inv!23519 a!3219)))

(assert (=> start!86230 true))

(declare-fun b!998412 () Bool)

(declare-fun res!668207 () Bool)

(assert (=> b!998412 (=> (not res!668207) (not e!563014))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998412 (= res!668207 (validKeyInArray!0 (select (arr!30395 a!3219) j!170)))))

(declare-fun b!998413 () Bool)

(assert (=> b!998413 (= e!563016 e!563015)))

(declare-fun res!668203 () Bool)

(assert (=> b!998413 (=> (not res!668203) (not e!563015))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998413 (= res!668203 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30395 a!3219) j!170) mask!3464) (select (arr!30395 a!3219) j!170) a!3219 mask!3464) lt!441695))))

(assert (=> b!998413 (= lt!441695 (Intermediate!9327 false resIndex!38 resX!38))))

(declare-fun b!998414 () Bool)

(declare-fun res!668206 () Bool)

(assert (=> b!998414 (=> (not res!668206) (not e!563014))))

(assert (=> b!998414 (= res!668206 (validKeyInArray!0 k0!2224))))

(declare-fun b!998415 () Bool)

(declare-fun res!668208 () Bool)

(assert (=> b!998415 (=> (not res!668208) (not e!563014))))

(assert (=> b!998415 (= res!668208 (and (= (size!30897 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30897 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30897 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86230 res!668209) b!998415))

(assert (= (and b!998415 res!668208) b!998412))

(assert (= (and b!998412 res!668207) b!998414))

(assert (= (and b!998414 res!668206) b!998405))

(assert (= (and b!998405 res!668205) b!998407))

(assert (= (and b!998407 res!668204) b!998408))

(assert (= (and b!998408 res!668211) b!998410))

(assert (= (and b!998410 res!668210) b!998406))

(assert (= (and b!998406 res!668202) b!998413))

(assert (= (and b!998413 res!668203) b!998411))

(assert (= (and b!998411 res!668201) b!998409))

(declare-fun m!924941 () Bool)

(assert (=> b!998408 m!924941))

(declare-fun m!924943 () Bool)

(assert (=> b!998411 m!924943))

(assert (=> b!998411 m!924943))

(declare-fun m!924945 () Bool)

(assert (=> b!998411 m!924945))

(declare-fun m!924947 () Bool)

(assert (=> b!998410 m!924947))

(declare-fun m!924949 () Bool)

(assert (=> b!998414 m!924949))

(declare-fun m!924951 () Bool)

(assert (=> start!86230 m!924951))

(declare-fun m!924953 () Bool)

(assert (=> start!86230 m!924953))

(assert (=> b!998413 m!924943))

(assert (=> b!998413 m!924943))

(declare-fun m!924955 () Bool)

(assert (=> b!998413 m!924955))

(assert (=> b!998413 m!924955))

(assert (=> b!998413 m!924943))

(declare-fun m!924957 () Bool)

(assert (=> b!998413 m!924957))

(declare-fun m!924959 () Bool)

(assert (=> b!998405 m!924959))

(assert (=> b!998412 m!924943))

(assert (=> b!998412 m!924943))

(declare-fun m!924961 () Bool)

(assert (=> b!998412 m!924961))

(declare-fun m!924963 () Bool)

(assert (=> b!998407 m!924963))

(check-sat (not start!86230) (not b!998407) (not b!998405) (not b!998410) (not b!998412) (not b!998413) (not b!998414) (not b!998408) (not b!998411))
(check-sat)
(get-model)

(declare-fun b!998497 () Bool)

(declare-fun lt!441716 () SeekEntryResult!9327)

(assert (=> b!998497 (and (bvsge (index!39681 lt!441716) #b00000000000000000000000000000000) (bvslt (index!39681 lt!441716) (size!30897 a!3219)))))

(declare-fun e!563056 () Bool)

(assert (=> b!998497 (= e!563056 (= (select (arr!30395 a!3219) (index!39681 lt!441716)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!998498 () Bool)

(declare-fun e!563057 () Bool)

(assert (=> b!998498 (= e!563057 (bvsge (x!87111 lt!441716) #b01111111111111111111111111111110))))

(declare-fun b!998499 () Bool)

(assert (=> b!998499 (and (bvsge (index!39681 lt!441716) #b00000000000000000000000000000000) (bvslt (index!39681 lt!441716) (size!30897 a!3219)))))

(declare-fun res!668257 () Bool)

(assert (=> b!998499 (= res!668257 (= (select (arr!30395 a!3219) (index!39681 lt!441716)) (select (arr!30395 a!3219) j!170)))))

(assert (=> b!998499 (=> res!668257 e!563056)))

(declare-fun e!563058 () Bool)

(assert (=> b!998499 (= e!563058 e!563056)))

(declare-fun b!998500 () Bool)

(assert (=> b!998500 (and (bvsge (index!39681 lt!441716) #b00000000000000000000000000000000) (bvslt (index!39681 lt!441716) (size!30897 a!3219)))))

(declare-fun res!668258 () Bool)

(assert (=> b!998500 (= res!668258 (= (select (arr!30395 a!3219) (index!39681 lt!441716)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!998500 (=> res!668258 e!563056)))

(declare-fun d!119179 () Bool)

(assert (=> d!119179 e!563057))

(declare-fun c!101266 () Bool)

(get-info :version)

(assert (=> d!119179 (= c!101266 (and ((_ is Intermediate!9327) lt!441716) (undefined!10139 lt!441716)))))

(declare-fun e!563059 () SeekEntryResult!9327)

(assert (=> d!119179 (= lt!441716 e!563059)))

(declare-fun c!101265 () Bool)

(assert (=> d!119179 (= c!101265 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!441717 () (_ BitVec 64))

(assert (=> d!119179 (= lt!441717 (select (arr!30395 a!3219) index!1507))))

(assert (=> d!119179 (validMask!0 mask!3464)))

(assert (=> d!119179 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30395 a!3219) j!170) a!3219 mask!3464) lt!441716)))

(declare-fun b!998501 () Bool)

(assert (=> b!998501 (= e!563059 (Intermediate!9327 true index!1507 x!1245))))

(declare-fun b!998502 () Bool)

(declare-fun e!563060 () SeekEntryResult!9327)

(assert (=> b!998502 (= e!563060 (Intermediate!9327 false index!1507 x!1245))))

(declare-fun b!998503 () Bool)

(assert (=> b!998503 (= e!563059 e!563060)))

(declare-fun c!101267 () Bool)

(assert (=> b!998503 (= c!101267 (or (= lt!441717 (select (arr!30395 a!3219) j!170)) (= (bvadd lt!441717 lt!441717) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!998504 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998504 (= e!563060 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30395 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!998505 () Bool)

(assert (=> b!998505 (= e!563057 e!563058)))

(declare-fun res!668259 () Bool)

(assert (=> b!998505 (= res!668259 (and ((_ is Intermediate!9327) lt!441716) (not (undefined!10139 lt!441716)) (bvslt (x!87111 lt!441716) #b01111111111111111111111111111110) (bvsge (x!87111 lt!441716) #b00000000000000000000000000000000) (bvsge (x!87111 lt!441716) x!1245)))))

(assert (=> b!998505 (=> (not res!668259) (not e!563058))))

(assert (= (and d!119179 c!101265) b!998501))

(assert (= (and d!119179 (not c!101265)) b!998503))

(assert (= (and b!998503 c!101267) b!998502))

(assert (= (and b!998503 (not c!101267)) b!998504))

(assert (= (and d!119179 c!101266) b!998498))

(assert (= (and d!119179 (not c!101266)) b!998505))

(assert (= (and b!998505 res!668259) b!998499))

(assert (= (and b!998499 (not res!668257)) b!998500))

(assert (= (and b!998500 (not res!668258)) b!998497))

(declare-fun m!924989 () Bool)

(assert (=> b!998504 m!924989))

(assert (=> b!998504 m!924989))

(assert (=> b!998504 m!924943))

(declare-fun m!924991 () Bool)

(assert (=> b!998504 m!924991))

(declare-fun m!924993 () Bool)

(assert (=> b!998499 m!924993))

(assert (=> b!998497 m!924993))

(declare-fun m!924995 () Bool)

(assert (=> d!119179 m!924995))

(assert (=> d!119179 m!924951))

(assert (=> b!998500 m!924993))

(assert (=> b!998411 d!119179))

(declare-fun d!119185 () Bool)

(assert (=> d!119185 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86230 d!119185))

(declare-fun d!119195 () Bool)

(assert (=> d!119195 (= (array_inv!23519 a!3219) (bvsge (size!30897 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86230 d!119195))

(declare-fun d!119199 () Bool)

(assert (=> d!119199 (= (validKeyInArray!0 (select (arr!30395 a!3219) j!170)) (and (not (= (select (arr!30395 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30395 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!998412 d!119199))

(declare-fun b!998602 () Bool)

(declare-fun c!101299 () Bool)

(declare-fun lt!441750 () (_ BitVec 64))

(assert (=> b!998602 (= c!101299 (= lt!441750 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!563125 () SeekEntryResult!9327)

(declare-fun e!563123 () SeekEntryResult!9327)

(assert (=> b!998602 (= e!563125 e!563123)))

(declare-fun b!998603 () Bool)

(declare-fun e!563124 () SeekEntryResult!9327)

(assert (=> b!998603 (= e!563124 Undefined!9327)))

(declare-fun b!998604 () Bool)

(declare-fun lt!441752 () SeekEntryResult!9327)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63133 (_ BitVec 32)) SeekEntryResult!9327)

(assert (=> b!998604 (= e!563123 (seekKeyOrZeroReturnVacant!0 (x!87111 lt!441752) (index!39681 lt!441752) (index!39681 lt!441752) k0!2224 a!3219 mask!3464))))

(declare-fun d!119201 () Bool)

(declare-fun lt!441751 () SeekEntryResult!9327)

(assert (=> d!119201 (and (or ((_ is Undefined!9327) lt!441751) (not ((_ is Found!9327) lt!441751)) (and (bvsge (index!39680 lt!441751) #b00000000000000000000000000000000) (bvslt (index!39680 lt!441751) (size!30897 a!3219)))) (or ((_ is Undefined!9327) lt!441751) ((_ is Found!9327) lt!441751) (not ((_ is MissingZero!9327) lt!441751)) (and (bvsge (index!39679 lt!441751) #b00000000000000000000000000000000) (bvslt (index!39679 lt!441751) (size!30897 a!3219)))) (or ((_ is Undefined!9327) lt!441751) ((_ is Found!9327) lt!441751) ((_ is MissingZero!9327) lt!441751) (not ((_ is MissingVacant!9327) lt!441751)) (and (bvsge (index!39682 lt!441751) #b00000000000000000000000000000000) (bvslt (index!39682 lt!441751) (size!30897 a!3219)))) (or ((_ is Undefined!9327) lt!441751) (ite ((_ is Found!9327) lt!441751) (= (select (arr!30395 a!3219) (index!39680 lt!441751)) k0!2224) (ite ((_ is MissingZero!9327) lt!441751) (= (select (arr!30395 a!3219) (index!39679 lt!441751)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9327) lt!441751) (= (select (arr!30395 a!3219) (index!39682 lt!441751)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119201 (= lt!441751 e!563124)))

(declare-fun c!101298 () Bool)

(assert (=> d!119201 (= c!101298 (and ((_ is Intermediate!9327) lt!441752) (undefined!10139 lt!441752)))))

(assert (=> d!119201 (= lt!441752 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!119201 (validMask!0 mask!3464)))

(assert (=> d!119201 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!441751)))

(declare-fun b!998605 () Bool)

(assert (=> b!998605 (= e!563125 (Found!9327 (index!39681 lt!441752)))))

(declare-fun b!998606 () Bool)

(assert (=> b!998606 (= e!563123 (MissingZero!9327 (index!39681 lt!441752)))))

(declare-fun b!998607 () Bool)

(assert (=> b!998607 (= e!563124 e!563125)))

(assert (=> b!998607 (= lt!441750 (select (arr!30395 a!3219) (index!39681 lt!441752)))))

(declare-fun c!101300 () Bool)

(assert (=> b!998607 (= c!101300 (= lt!441750 k0!2224))))

(assert (= (and d!119201 c!101298) b!998603))

(assert (= (and d!119201 (not c!101298)) b!998607))

(assert (= (and b!998607 c!101300) b!998605))

(assert (= (and b!998607 (not c!101300)) b!998602))

(assert (= (and b!998602 c!101299) b!998606))

(assert (= (and b!998602 (not c!101299)) b!998604))

(declare-fun m!925051 () Bool)

(assert (=> b!998604 m!925051))

(assert (=> d!119201 m!924951))

(declare-fun m!925053 () Bool)

(assert (=> d!119201 m!925053))

(declare-fun m!925055 () Bool)

(assert (=> d!119201 m!925055))

(declare-fun m!925057 () Bool)

(assert (=> d!119201 m!925057))

(declare-fun m!925059 () Bool)

(assert (=> d!119201 m!925059))

(assert (=> d!119201 m!925053))

(declare-fun m!925061 () Bool)

(assert (=> d!119201 m!925061))

(declare-fun m!925063 () Bool)

(assert (=> b!998607 m!925063))

(assert (=> b!998407 d!119201))

(declare-fun b!998608 () Bool)

(declare-fun lt!441753 () SeekEntryResult!9327)

(assert (=> b!998608 (and (bvsge (index!39681 lt!441753) #b00000000000000000000000000000000) (bvslt (index!39681 lt!441753) (size!30897 a!3219)))))

(declare-fun e!563126 () Bool)

(assert (=> b!998608 (= e!563126 (= (select (arr!30395 a!3219) (index!39681 lt!441753)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!998609 () Bool)

(declare-fun e!563127 () Bool)

(assert (=> b!998609 (= e!563127 (bvsge (x!87111 lt!441753) #b01111111111111111111111111111110))))

(declare-fun b!998610 () Bool)

(assert (=> b!998610 (and (bvsge (index!39681 lt!441753) #b00000000000000000000000000000000) (bvslt (index!39681 lt!441753) (size!30897 a!3219)))))

(declare-fun res!668297 () Bool)

(assert (=> b!998610 (= res!668297 (= (select (arr!30395 a!3219) (index!39681 lt!441753)) (select (arr!30395 a!3219) j!170)))))

(assert (=> b!998610 (=> res!668297 e!563126)))

(declare-fun e!563128 () Bool)

(assert (=> b!998610 (= e!563128 e!563126)))

(declare-fun b!998611 () Bool)

(assert (=> b!998611 (and (bvsge (index!39681 lt!441753) #b00000000000000000000000000000000) (bvslt (index!39681 lt!441753) (size!30897 a!3219)))))

(declare-fun res!668298 () Bool)

(assert (=> b!998611 (= res!668298 (= (select (arr!30395 a!3219) (index!39681 lt!441753)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!998611 (=> res!668298 e!563126)))

(declare-fun d!119219 () Bool)

(assert (=> d!119219 e!563127))

(declare-fun c!101302 () Bool)

(assert (=> d!119219 (= c!101302 (and ((_ is Intermediate!9327) lt!441753) (undefined!10139 lt!441753)))))

(declare-fun e!563129 () SeekEntryResult!9327)

(assert (=> d!119219 (= lt!441753 e!563129)))

(declare-fun c!101301 () Bool)

(assert (=> d!119219 (= c!101301 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!441754 () (_ BitVec 64))

(assert (=> d!119219 (= lt!441754 (select (arr!30395 a!3219) (toIndex!0 (select (arr!30395 a!3219) j!170) mask!3464)))))

(assert (=> d!119219 (validMask!0 mask!3464)))

(assert (=> d!119219 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30395 a!3219) j!170) mask!3464) (select (arr!30395 a!3219) j!170) a!3219 mask!3464) lt!441753)))

(declare-fun b!998612 () Bool)

(assert (=> b!998612 (= e!563129 (Intermediate!9327 true (toIndex!0 (select (arr!30395 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun e!563130 () SeekEntryResult!9327)

(declare-fun b!998613 () Bool)

(assert (=> b!998613 (= e!563130 (Intermediate!9327 false (toIndex!0 (select (arr!30395 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!998614 () Bool)

(assert (=> b!998614 (= e!563129 e!563130)))

(declare-fun c!101303 () Bool)

(assert (=> b!998614 (= c!101303 (or (= lt!441754 (select (arr!30395 a!3219) j!170)) (= (bvadd lt!441754 lt!441754) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!998615 () Bool)

(assert (=> b!998615 (= e!563130 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30395 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30395 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!998616 () Bool)

(assert (=> b!998616 (= e!563127 e!563128)))

(declare-fun res!668299 () Bool)

(assert (=> b!998616 (= res!668299 (and ((_ is Intermediate!9327) lt!441753) (not (undefined!10139 lt!441753)) (bvslt (x!87111 lt!441753) #b01111111111111111111111111111110) (bvsge (x!87111 lt!441753) #b00000000000000000000000000000000) (bvsge (x!87111 lt!441753) #b00000000000000000000000000000000)))))

(assert (=> b!998616 (=> (not res!668299) (not e!563128))))

(assert (= (and d!119219 c!101301) b!998612))

(assert (= (and d!119219 (not c!101301)) b!998614))

(assert (= (and b!998614 c!101303) b!998613))

(assert (= (and b!998614 (not c!101303)) b!998615))

(assert (= (and d!119219 c!101302) b!998609))

(assert (= (and d!119219 (not c!101302)) b!998616))

(assert (= (and b!998616 res!668299) b!998610))

(assert (= (and b!998610 (not res!668297)) b!998611))

(assert (= (and b!998611 (not res!668298)) b!998608))

(assert (=> b!998615 m!924955))

(declare-fun m!925065 () Bool)

(assert (=> b!998615 m!925065))

(assert (=> b!998615 m!925065))

(assert (=> b!998615 m!924943))

(declare-fun m!925067 () Bool)

(assert (=> b!998615 m!925067))

(declare-fun m!925069 () Bool)

(assert (=> b!998610 m!925069))

(assert (=> b!998608 m!925069))

(assert (=> d!119219 m!924955))

(declare-fun m!925071 () Bool)

(assert (=> d!119219 m!925071))

(assert (=> d!119219 m!924951))

(assert (=> b!998611 m!925069))

(assert (=> b!998413 d!119219))

(declare-fun d!119221 () Bool)

(declare-fun lt!441777 () (_ BitVec 32))

(declare-fun lt!441776 () (_ BitVec 32))

(assert (=> d!119221 (= lt!441777 (bvmul (bvxor lt!441776 (bvlshr lt!441776 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119221 (= lt!441776 ((_ extract 31 0) (bvand (bvxor (select (arr!30395 a!3219) j!170) (bvlshr (select (arr!30395 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119221 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!668306 (let ((h!22241 ((_ extract 31 0) (bvand (bvxor (select (arr!30395 a!3219) j!170) (bvlshr (select (arr!30395 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87117 (bvmul (bvxor h!22241 (bvlshr h!22241 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87117 (bvlshr x!87117 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!668306 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!668306 #b00000000000000000000000000000000))))))

(assert (=> d!119221 (= (toIndex!0 (select (arr!30395 a!3219) j!170) mask!3464) (bvand (bvxor lt!441777 (bvlshr lt!441777 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!998413 d!119221))

(declare-fun d!119227 () Bool)

(declare-fun res!668323 () Bool)

(declare-fun e!563169 () Bool)

(assert (=> d!119227 (=> res!668323 e!563169)))

(assert (=> d!119227 (= res!668323 (bvsge #b00000000000000000000000000000000 (size!30897 a!3219)))))

(assert (=> d!119227 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!563169)))

(declare-fun b!998675 () Bool)

(declare-fun e!563170 () Bool)

(declare-fun call!42289 () Bool)

(assert (=> b!998675 (= e!563170 call!42289)))

(declare-fun b!998676 () Bool)

(assert (=> b!998676 (= e!563169 e!563170)))

(declare-fun c!101323 () Bool)

(assert (=> b!998676 (= c!101323 (validKeyInArray!0 (select (arr!30395 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!998677 () Bool)

(declare-fun e!563168 () Bool)

(assert (=> b!998677 (= e!563168 call!42289)))

(declare-fun b!998678 () Bool)

(assert (=> b!998678 (= e!563170 e!563168)))

(declare-fun lt!441793 () (_ BitVec 64))

(assert (=> b!998678 (= lt!441793 (select (arr!30395 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32990 0))(
  ( (Unit!32991) )
))
(declare-fun lt!441792 () Unit!32990)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63133 (_ BitVec 64) (_ BitVec 32)) Unit!32990)

(assert (=> b!998678 (= lt!441792 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!441793 #b00000000000000000000000000000000))))

(assert (=> b!998678 (arrayContainsKey!0 a!3219 lt!441793 #b00000000000000000000000000000000)))

(declare-fun lt!441794 () Unit!32990)

(assert (=> b!998678 (= lt!441794 lt!441792)))

(declare-fun res!668322 () Bool)

(assert (=> b!998678 (= res!668322 (= (seekEntryOrOpen!0 (select (arr!30395 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9327 #b00000000000000000000000000000000)))))

(assert (=> b!998678 (=> (not res!668322) (not e!563168))))

(declare-fun bm!42286 () Bool)

(assert (=> bm!42286 (= call!42289 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(assert (= (and d!119227 (not res!668323)) b!998676))

(assert (= (and b!998676 c!101323) b!998678))

(assert (= (and b!998676 (not c!101323)) b!998675))

(assert (= (and b!998678 res!668322) b!998677))

(assert (= (or b!998677 b!998675) bm!42286))

(declare-fun m!925105 () Bool)

(assert (=> b!998676 m!925105))

(assert (=> b!998676 m!925105))

(declare-fun m!925107 () Bool)

(assert (=> b!998676 m!925107))

(assert (=> b!998678 m!925105))

(declare-fun m!925109 () Bool)

(assert (=> b!998678 m!925109))

(declare-fun m!925111 () Bool)

(assert (=> b!998678 m!925111))

(assert (=> b!998678 m!925105))

(declare-fun m!925113 () Bool)

(assert (=> b!998678 m!925113))

(declare-fun m!925115 () Bool)

(assert (=> bm!42286 m!925115))

(assert (=> b!998408 d!119227))

(declare-fun d!119239 () Bool)

(assert (=> d!119239 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!998414 d!119239))

(declare-fun b!998699 () Bool)

(declare-fun e!563188 () Bool)

(declare-fun e!563189 () Bool)

(assert (=> b!998699 (= e!563188 e!563189)))

(declare-fun c!101327 () Bool)

(assert (=> b!998699 (= c!101327 (validKeyInArray!0 (select (arr!30395 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!998700 () Bool)

(declare-fun e!563190 () Bool)

(assert (=> b!998700 (= e!563190 e!563188)))

(declare-fun res!668339 () Bool)

(assert (=> b!998700 (=> (not res!668339) (not e!563188))))

(declare-fun e!563191 () Bool)

(assert (=> b!998700 (= res!668339 (not e!563191))))

(declare-fun res!668338 () Bool)

(assert (=> b!998700 (=> (not res!668338) (not e!563191))))

(assert (=> b!998700 (= res!668338 (validKeyInArray!0 (select (arr!30395 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!998701 () Bool)

(declare-fun contains!5876 (List!21071 (_ BitVec 64)) Bool)

(assert (=> b!998701 (= e!563191 (contains!5876 Nil!21068 (select (arr!30395 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42290 () Bool)

(declare-fun call!42293 () Bool)

(assert (=> bm!42290 (= call!42293 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101327 (Cons!21067 (select (arr!30395 a!3219) #b00000000000000000000000000000000) Nil!21068) Nil!21068)))))

(declare-fun b!998702 () Bool)

(assert (=> b!998702 (= e!563189 call!42293)))

(declare-fun b!998703 () Bool)

(assert (=> b!998703 (= e!563189 call!42293)))

(declare-fun d!119241 () Bool)

(declare-fun res!668340 () Bool)

(assert (=> d!119241 (=> res!668340 e!563190)))

(assert (=> d!119241 (= res!668340 (bvsge #b00000000000000000000000000000000 (size!30897 a!3219)))))

(assert (=> d!119241 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21068) e!563190)))

(assert (= (and d!119241 (not res!668340)) b!998700))

(assert (= (and b!998700 res!668338) b!998701))

(assert (= (and b!998700 res!668339) b!998699))

(assert (= (and b!998699 c!101327) b!998703))

(assert (= (and b!998699 (not c!101327)) b!998702))

(assert (= (or b!998703 b!998702) bm!42290))

(assert (=> b!998699 m!925105))

(assert (=> b!998699 m!925105))

(assert (=> b!998699 m!925107))

(assert (=> b!998700 m!925105))

(assert (=> b!998700 m!925105))

(assert (=> b!998700 m!925107))

(assert (=> b!998701 m!925105))

(assert (=> b!998701 m!925105))

(declare-fun m!925127 () Bool)

(assert (=> b!998701 m!925127))

(assert (=> bm!42290 m!925105))

(declare-fun m!925129 () Bool)

(assert (=> bm!42290 m!925129))

(assert (=> b!998410 d!119241))

(declare-fun d!119243 () Bool)

(declare-fun res!668345 () Bool)

(declare-fun e!563196 () Bool)

(assert (=> d!119243 (=> res!668345 e!563196)))

(assert (=> d!119243 (= res!668345 (= (select (arr!30395 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!119243 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!563196)))

(declare-fun b!998708 () Bool)

(declare-fun e!563197 () Bool)

(assert (=> b!998708 (= e!563196 e!563197)))

(declare-fun res!668346 () Bool)

(assert (=> b!998708 (=> (not res!668346) (not e!563197))))

(assert (=> b!998708 (= res!668346 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30897 a!3219)))))

(declare-fun b!998709 () Bool)

(assert (=> b!998709 (= e!563197 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119243 (not res!668345)) b!998708))

(assert (= (and b!998708 res!668346) b!998709))

(assert (=> d!119243 m!925105))

(declare-fun m!925131 () Bool)

(assert (=> b!998709 m!925131))

(assert (=> b!998405 d!119243))

(check-sat (not b!998504) (not d!119219) (not b!998709) (not b!998701) (not b!998615) (not bm!42286) (not b!998678) (not b!998700) (not b!998699) (not bm!42290) (not d!119179) (not d!119201) (not b!998604) (not b!998676))
