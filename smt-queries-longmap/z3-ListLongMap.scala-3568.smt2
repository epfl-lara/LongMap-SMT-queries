; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49020 () Bool)

(assert start!49020)

(declare-fun b!540087 () Bool)

(declare-fun res!335281 () Bool)

(declare-fun e!312870 () Bool)

(assert (=> b!540087 (=> (not res!335281) (not e!312870))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34191 0))(
  ( (array!34192 (arr!16433 (Array (_ BitVec 32) (_ BitVec 64))) (size!16798 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34191)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!540087 (= res!335281 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16798 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16798 a!3154)) (= (select (arr!16433 a!3154) resIndex!32) (select (arr!16433 a!3154) j!147))))))

(declare-fun b!540088 () Bool)

(declare-fun res!335284 () Bool)

(declare-fun e!312873 () Bool)

(assert (=> b!540088 (=> (not res!335284) (not e!312873))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540088 (= res!335284 (validKeyInArray!0 (select (arr!16433 a!3154) j!147)))))

(declare-fun b!540089 () Bool)

(declare-fun e!312872 () Bool)

(assert (=> b!540089 (= e!312870 e!312872)))

(declare-fun res!335280 () Bool)

(assert (=> b!540089 (=> (not res!335280) (not e!312872))))

(declare-datatypes ((SeekEntryResult!4888 0))(
  ( (MissingZero!4888 (index!21776 (_ BitVec 32))) (Found!4888 (index!21777 (_ BitVec 32))) (Intermediate!4888 (undefined!5700 Bool) (index!21778 (_ BitVec 32)) (x!50696 (_ BitVec 32))) (Undefined!4888) (MissingVacant!4888 (index!21779 (_ BitVec 32))) )
))
(declare-fun lt!247128 () SeekEntryResult!4888)

(assert (=> b!540089 (= res!335280 (= lt!247128 (Intermediate!4888 false resIndex!32 resX!32)))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34191 (_ BitVec 32)) SeekEntryResult!4888)

(assert (=> b!540089 (= lt!247128 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16433 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540090 () Bool)

(declare-fun res!335278 () Bool)

(assert (=> b!540090 (=> (not res!335278) (not e!312873))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540090 (= res!335278 (and (= (size!16798 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16798 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16798 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540091 () Bool)

(assert (=> b!540091 (= e!312872 (and (not (= (select (arr!16433 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16433 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!540092 () Bool)

(assert (=> b!540092 (= e!312873 e!312870)))

(declare-fun res!335282 () Bool)

(assert (=> b!540092 (=> (not res!335282) (not e!312870))))

(declare-fun lt!247129 () SeekEntryResult!4888)

(assert (=> b!540092 (= res!335282 (or (= lt!247129 (MissingZero!4888 i!1153)) (= lt!247129 (MissingVacant!4888 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34191 (_ BitVec 32)) SeekEntryResult!4888)

(assert (=> b!540092 (= lt!247129 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!540093 () Bool)

(declare-fun res!335285 () Bool)

(assert (=> b!540093 (=> (not res!335285) (not e!312870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34191 (_ BitVec 32)) Bool)

(assert (=> b!540093 (= res!335285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540094 () Bool)

(declare-fun res!335275 () Bool)

(assert (=> b!540094 (=> (not res!335275) (not e!312873))))

(declare-fun arrayContainsKey!0 (array!34191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540094 (= res!335275 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!335283 () Bool)

(assert (=> start!49020 (=> (not res!335283) (not e!312873))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49020 (= res!335283 (validMask!0 mask!3216))))

(assert (=> start!49020 e!312873))

(assert (=> start!49020 true))

(declare-fun array_inv!12316 (array!34191) Bool)

(assert (=> start!49020 (array_inv!12316 a!3154)))

(declare-fun b!540095 () Bool)

(declare-fun res!335276 () Bool)

(assert (=> b!540095 (=> (not res!335276) (not e!312870))))

(declare-datatypes ((List!10591 0))(
  ( (Nil!10588) (Cons!10587 (h!11533 (_ BitVec 64)) (t!16810 List!10591)) )
))
(declare-fun arrayNoDuplicates!0 (array!34191 (_ BitVec 32) List!10591) Bool)

(assert (=> b!540095 (= res!335276 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10588))))

(declare-fun b!540096 () Bool)

(declare-fun res!335277 () Bool)

(assert (=> b!540096 (=> (not res!335277) (not e!312872))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540096 (= res!335277 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16433 a!3154) j!147) mask!3216) (select (arr!16433 a!3154) j!147) a!3154 mask!3216) lt!247128))))

(declare-fun b!540097 () Bool)

(declare-fun res!335279 () Bool)

(assert (=> b!540097 (=> (not res!335279) (not e!312873))))

(assert (=> b!540097 (= res!335279 (validKeyInArray!0 k0!1998))))

(assert (= (and start!49020 res!335283) b!540090))

(assert (= (and b!540090 res!335278) b!540088))

(assert (= (and b!540088 res!335284) b!540097))

(assert (= (and b!540097 res!335279) b!540094))

(assert (= (and b!540094 res!335275) b!540092))

(assert (= (and b!540092 res!335282) b!540093))

(assert (= (and b!540093 res!335285) b!540095))

(assert (= (and b!540095 res!335276) b!540087))

(assert (= (and b!540087 res!335281) b!540089))

(assert (= (and b!540089 res!335280) b!540096))

(assert (= (and b!540096 res!335277) b!540091))

(declare-fun m!518413 () Bool)

(assert (=> start!49020 m!518413))

(declare-fun m!518415 () Bool)

(assert (=> start!49020 m!518415))

(declare-fun m!518417 () Bool)

(assert (=> b!540093 m!518417))

(declare-fun m!518419 () Bool)

(assert (=> b!540096 m!518419))

(assert (=> b!540096 m!518419))

(declare-fun m!518421 () Bool)

(assert (=> b!540096 m!518421))

(assert (=> b!540096 m!518421))

(assert (=> b!540096 m!518419))

(declare-fun m!518423 () Bool)

(assert (=> b!540096 m!518423))

(declare-fun m!518425 () Bool)

(assert (=> b!540097 m!518425))

(declare-fun m!518427 () Bool)

(assert (=> b!540094 m!518427))

(declare-fun m!518429 () Bool)

(assert (=> b!540092 m!518429))

(assert (=> b!540089 m!518419))

(assert (=> b!540089 m!518419))

(declare-fun m!518431 () Bool)

(assert (=> b!540089 m!518431))

(declare-fun m!518433 () Bool)

(assert (=> b!540095 m!518433))

(assert (=> b!540088 m!518419))

(assert (=> b!540088 m!518419))

(declare-fun m!518435 () Bool)

(assert (=> b!540088 m!518435))

(declare-fun m!518437 () Bool)

(assert (=> b!540091 m!518437))

(declare-fun m!518439 () Bool)

(assert (=> b!540087 m!518439))

(assert (=> b!540087 m!518419))

(check-sat (not b!540093) (not b!540096) (not b!540089) (not b!540097) (not b!540094) (not start!49020) (not b!540095) (not b!540088) (not b!540092))
(check-sat)
(get-model)

(declare-fun d!81461 () Bool)

(declare-fun res!335356 () Bool)

(declare-fun e!312902 () Bool)

(assert (=> d!81461 (=> res!335356 e!312902)))

(assert (=> d!81461 (= res!335356 (= (select (arr!16433 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!81461 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!312902)))

(declare-fun b!540168 () Bool)

(declare-fun e!312903 () Bool)

(assert (=> b!540168 (= e!312902 e!312903)))

(declare-fun res!335357 () Bool)

(assert (=> b!540168 (=> (not res!335357) (not e!312903))))

(assert (=> b!540168 (= res!335357 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16798 a!3154)))))

(declare-fun b!540169 () Bool)

(assert (=> b!540169 (= e!312903 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81461 (not res!335356)) b!540168))

(assert (= (and b!540168 res!335357) b!540169))

(declare-fun m!518497 () Bool)

(assert (=> d!81461 m!518497))

(declare-fun m!518499 () Bool)

(assert (=> b!540169 m!518499))

(assert (=> b!540094 d!81461))

(declare-fun b!540178 () Bool)

(declare-fun e!312910 () Bool)

(declare-fun e!312911 () Bool)

(assert (=> b!540178 (= e!312910 e!312911)))

(declare-fun lt!247149 () (_ BitVec 64))

(assert (=> b!540178 (= lt!247149 (select (arr!16433 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16870 0))(
  ( (Unit!16871) )
))
(declare-fun lt!247150 () Unit!16870)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34191 (_ BitVec 64) (_ BitVec 32)) Unit!16870)

(assert (=> b!540178 (= lt!247150 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!247149 #b00000000000000000000000000000000))))

(assert (=> b!540178 (arrayContainsKey!0 a!3154 lt!247149 #b00000000000000000000000000000000)))

(declare-fun lt!247148 () Unit!16870)

(assert (=> b!540178 (= lt!247148 lt!247150)))

(declare-fun res!335363 () Bool)

(assert (=> b!540178 (= res!335363 (= (seekEntryOrOpen!0 (select (arr!16433 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4888 #b00000000000000000000000000000000)))))

(assert (=> b!540178 (=> (not res!335363) (not e!312911))))

(declare-fun b!540179 () Bool)

(declare-fun call!31993 () Bool)

(assert (=> b!540179 (= e!312910 call!31993)))

(declare-fun d!81463 () Bool)

(declare-fun res!335362 () Bool)

(declare-fun e!312912 () Bool)

(assert (=> d!81463 (=> res!335362 e!312912)))

(assert (=> d!81463 (= res!335362 (bvsge #b00000000000000000000000000000000 (size!16798 a!3154)))))

(assert (=> d!81463 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!312912)))

(declare-fun b!540180 () Bool)

(assert (=> b!540180 (= e!312911 call!31993)))

(declare-fun b!540181 () Bool)

(assert (=> b!540181 (= e!312912 e!312910)))

(declare-fun c!62721 () Bool)

(assert (=> b!540181 (= c!62721 (validKeyInArray!0 (select (arr!16433 a!3154) #b00000000000000000000000000000000)))))

(declare-fun bm!31990 () Bool)

(assert (=> bm!31990 (= call!31993 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(assert (= (and d!81463 (not res!335362)) b!540181))

(assert (= (and b!540181 c!62721) b!540178))

(assert (= (and b!540181 (not c!62721)) b!540179))

(assert (= (and b!540178 res!335363) b!540180))

(assert (= (or b!540180 b!540179) bm!31990))

(assert (=> b!540178 m!518497))

(declare-fun m!518501 () Bool)

(assert (=> b!540178 m!518501))

(declare-fun m!518503 () Bool)

(assert (=> b!540178 m!518503))

(assert (=> b!540178 m!518497))

(declare-fun m!518505 () Bool)

(assert (=> b!540178 m!518505))

(assert (=> b!540181 m!518497))

(assert (=> b!540181 m!518497))

(declare-fun m!518507 () Bool)

(assert (=> b!540181 m!518507))

(declare-fun m!518509 () Bool)

(assert (=> bm!31990 m!518509))

(assert (=> b!540093 d!81463))

(declare-fun d!81465 () Bool)

(assert (=> d!81465 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49020 d!81465))

(declare-fun d!81471 () Bool)

(assert (=> d!81471 (= (array_inv!12316 a!3154) (bvsge (size!16798 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49020 d!81471))

(declare-fun d!81473 () Bool)

(assert (=> d!81473 (= (validKeyInArray!0 (select (arr!16433 a!3154) j!147)) (and (not (= (select (arr!16433 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16433 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!540088 d!81473))

(declare-fun b!540192 () Bool)

(declare-fun e!312922 () Bool)

(declare-fun e!312924 () Bool)

(assert (=> b!540192 (= e!312922 e!312924)))

(declare-fun res!335370 () Bool)

(assert (=> b!540192 (=> (not res!335370) (not e!312924))))

(declare-fun e!312921 () Bool)

(assert (=> b!540192 (= res!335370 (not e!312921))))

(declare-fun res!335371 () Bool)

(assert (=> b!540192 (=> (not res!335371) (not e!312921))))

(assert (=> b!540192 (= res!335371 (validKeyInArray!0 (select (arr!16433 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!540193 () Bool)

(declare-fun e!312923 () Bool)

(declare-fun call!31996 () Bool)

(assert (=> b!540193 (= e!312923 call!31996)))

(declare-fun d!81475 () Bool)

(declare-fun res!335372 () Bool)

(assert (=> d!81475 (=> res!335372 e!312922)))

(assert (=> d!81475 (= res!335372 (bvsge #b00000000000000000000000000000000 (size!16798 a!3154)))))

(assert (=> d!81475 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10588) e!312922)))

(declare-fun b!540194 () Bool)

(assert (=> b!540194 (= e!312923 call!31996)))

(declare-fun b!540195 () Bool)

(declare-fun contains!2776 (List!10591 (_ BitVec 64)) Bool)

(assert (=> b!540195 (= e!312921 (contains!2776 Nil!10588 (select (arr!16433 a!3154) #b00000000000000000000000000000000)))))

(declare-fun bm!31993 () Bool)

(declare-fun c!62724 () Bool)

(assert (=> bm!31993 (= call!31996 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62724 (Cons!10587 (select (arr!16433 a!3154) #b00000000000000000000000000000000) Nil!10588) Nil!10588)))))

(declare-fun b!540196 () Bool)

(assert (=> b!540196 (= e!312924 e!312923)))

(assert (=> b!540196 (= c!62724 (validKeyInArray!0 (select (arr!16433 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!81475 (not res!335372)) b!540192))

(assert (= (and b!540192 res!335371) b!540195))

(assert (= (and b!540192 res!335370) b!540196))

(assert (= (and b!540196 c!62724) b!540194))

(assert (= (and b!540196 (not c!62724)) b!540193))

(assert (= (or b!540194 b!540193) bm!31993))

(assert (=> b!540192 m!518497))

(assert (=> b!540192 m!518497))

(assert (=> b!540192 m!518507))

(assert (=> b!540195 m!518497))

(assert (=> b!540195 m!518497))

(declare-fun m!518511 () Bool)

(assert (=> b!540195 m!518511))

(assert (=> bm!31993 m!518497))

(declare-fun m!518513 () Bool)

(assert (=> bm!31993 m!518513))

(assert (=> b!540196 m!518497))

(assert (=> b!540196 m!518497))

(assert (=> b!540196 m!518507))

(assert (=> b!540095 d!81475))

(declare-fun b!540260 () Bool)

(declare-fun e!312960 () Bool)

(declare-fun e!312962 () Bool)

(assert (=> b!540260 (= e!312960 e!312962)))

(declare-fun res!335391 () Bool)

(declare-fun lt!247177 () SeekEntryResult!4888)

(get-info :version)

(assert (=> b!540260 (= res!335391 (and ((_ is Intermediate!4888) lt!247177) (not (undefined!5700 lt!247177)) (bvslt (x!50696 lt!247177) #b01111111111111111111111111111110) (bvsge (x!50696 lt!247177) #b00000000000000000000000000000000) (bvsge (x!50696 lt!247177) x!1030)))))

(assert (=> b!540260 (=> (not res!335391) (not e!312962))))

(declare-fun e!312959 () SeekEntryResult!4888)

(declare-fun b!540262 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540262 (= e!312959 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16433 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540263 () Bool)

(assert (=> b!540263 (= e!312960 (bvsge (x!50696 lt!247177) #b01111111111111111111111111111110))))

(declare-fun b!540264 () Bool)

(assert (=> b!540264 (and (bvsge (index!21778 lt!247177) #b00000000000000000000000000000000) (bvslt (index!21778 lt!247177) (size!16798 a!3154)))))

(declare-fun res!335390 () Bool)

(assert (=> b!540264 (= res!335390 (= (select (arr!16433 a!3154) (index!21778 lt!247177)) (select (arr!16433 a!3154) j!147)))))

(declare-fun e!312961 () Bool)

(assert (=> b!540264 (=> res!335390 e!312961)))

(assert (=> b!540264 (= e!312962 e!312961)))

(declare-fun b!540265 () Bool)

(assert (=> b!540265 (= e!312959 (Intermediate!4888 false index!1177 x!1030))))

(declare-fun b!540266 () Bool)

(assert (=> b!540266 (and (bvsge (index!21778 lt!247177) #b00000000000000000000000000000000) (bvslt (index!21778 lt!247177) (size!16798 a!3154)))))

(assert (=> b!540266 (= e!312961 (= (select (arr!16433 a!3154) (index!21778 lt!247177)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!540267 () Bool)

(declare-fun e!312963 () SeekEntryResult!4888)

(assert (=> b!540267 (= e!312963 (Intermediate!4888 true index!1177 x!1030))))

(declare-fun b!540268 () Bool)

(assert (=> b!540268 (= e!312963 e!312959)))

(declare-fun lt!247176 () (_ BitVec 64))

(declare-fun c!62749 () Bool)

(assert (=> b!540268 (= c!62749 (or (= lt!247176 (select (arr!16433 a!3154) j!147)) (= (bvadd lt!247176 lt!247176) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!540261 () Bool)

(assert (=> b!540261 (and (bvsge (index!21778 lt!247177) #b00000000000000000000000000000000) (bvslt (index!21778 lt!247177) (size!16798 a!3154)))))

(declare-fun res!335389 () Bool)

(assert (=> b!540261 (= res!335389 (= (select (arr!16433 a!3154) (index!21778 lt!247177)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!540261 (=> res!335389 e!312961)))

(declare-fun d!81477 () Bool)

(assert (=> d!81477 e!312960))

(declare-fun c!62750 () Bool)

(assert (=> d!81477 (= c!62750 (and ((_ is Intermediate!4888) lt!247177) (undefined!5700 lt!247177)))))

(assert (=> d!81477 (= lt!247177 e!312963)))

(declare-fun c!62751 () Bool)

(assert (=> d!81477 (= c!62751 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!81477 (= lt!247176 (select (arr!16433 a!3154) index!1177))))

(assert (=> d!81477 (validMask!0 mask!3216)))

(assert (=> d!81477 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16433 a!3154) j!147) a!3154 mask!3216) lt!247177)))

(assert (= (and d!81477 c!62751) b!540267))

(assert (= (and d!81477 (not c!62751)) b!540268))

(assert (= (and b!540268 c!62749) b!540265))

(assert (= (and b!540268 (not c!62749)) b!540262))

(assert (= (and d!81477 c!62750) b!540263))

(assert (= (and d!81477 (not c!62750)) b!540260))

(assert (= (and b!540260 res!335391) b!540264))

(assert (= (and b!540264 (not res!335390)) b!540261))

(assert (= (and b!540261 (not res!335389)) b!540266))

(declare-fun m!518537 () Bool)

(assert (=> b!540262 m!518537))

(assert (=> b!540262 m!518537))

(assert (=> b!540262 m!518419))

(declare-fun m!518539 () Bool)

(assert (=> b!540262 m!518539))

(declare-fun m!518541 () Bool)

(assert (=> b!540264 m!518541))

(assert (=> b!540261 m!518541))

(assert (=> b!540266 m!518541))

(assert (=> d!81477 m!518437))

(assert (=> d!81477 m!518413))

(assert (=> b!540089 d!81477))

(declare-fun b!540269 () Bool)

(declare-fun e!312965 () Bool)

(declare-fun e!312967 () Bool)

(assert (=> b!540269 (= e!312965 e!312967)))

(declare-fun res!335394 () Bool)

(declare-fun lt!247179 () SeekEntryResult!4888)

(assert (=> b!540269 (= res!335394 (and ((_ is Intermediate!4888) lt!247179) (not (undefined!5700 lt!247179)) (bvslt (x!50696 lt!247179) #b01111111111111111111111111111110) (bvsge (x!50696 lt!247179) #b00000000000000000000000000000000) (bvsge (x!50696 lt!247179) #b00000000000000000000000000000000)))))

(assert (=> b!540269 (=> (not res!335394) (not e!312967))))

(declare-fun b!540271 () Bool)

(declare-fun e!312964 () SeekEntryResult!4888)

(assert (=> b!540271 (= e!312964 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16433 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16433 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540272 () Bool)

(assert (=> b!540272 (= e!312965 (bvsge (x!50696 lt!247179) #b01111111111111111111111111111110))))

(declare-fun b!540273 () Bool)

(assert (=> b!540273 (and (bvsge (index!21778 lt!247179) #b00000000000000000000000000000000) (bvslt (index!21778 lt!247179) (size!16798 a!3154)))))

(declare-fun res!335393 () Bool)

(assert (=> b!540273 (= res!335393 (= (select (arr!16433 a!3154) (index!21778 lt!247179)) (select (arr!16433 a!3154) j!147)))))

(declare-fun e!312966 () Bool)

(assert (=> b!540273 (=> res!335393 e!312966)))

(assert (=> b!540273 (= e!312967 e!312966)))

(declare-fun b!540274 () Bool)

(assert (=> b!540274 (= e!312964 (Intermediate!4888 false (toIndex!0 (select (arr!16433 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!540275 () Bool)

(assert (=> b!540275 (and (bvsge (index!21778 lt!247179) #b00000000000000000000000000000000) (bvslt (index!21778 lt!247179) (size!16798 a!3154)))))

(assert (=> b!540275 (= e!312966 (= (select (arr!16433 a!3154) (index!21778 lt!247179)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!540276 () Bool)

(declare-fun e!312968 () SeekEntryResult!4888)

(assert (=> b!540276 (= e!312968 (Intermediate!4888 true (toIndex!0 (select (arr!16433 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!540277 () Bool)

(assert (=> b!540277 (= e!312968 e!312964)))

(declare-fun c!62752 () Bool)

(declare-fun lt!247178 () (_ BitVec 64))

(assert (=> b!540277 (= c!62752 (or (= lt!247178 (select (arr!16433 a!3154) j!147)) (= (bvadd lt!247178 lt!247178) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!540270 () Bool)

(assert (=> b!540270 (and (bvsge (index!21778 lt!247179) #b00000000000000000000000000000000) (bvslt (index!21778 lt!247179) (size!16798 a!3154)))))

(declare-fun res!335392 () Bool)

(assert (=> b!540270 (= res!335392 (= (select (arr!16433 a!3154) (index!21778 lt!247179)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!540270 (=> res!335392 e!312966)))

(declare-fun d!81491 () Bool)

(assert (=> d!81491 e!312965))

(declare-fun c!62753 () Bool)

(assert (=> d!81491 (= c!62753 (and ((_ is Intermediate!4888) lt!247179) (undefined!5700 lt!247179)))))

(assert (=> d!81491 (= lt!247179 e!312968)))

(declare-fun c!62754 () Bool)

(assert (=> d!81491 (= c!62754 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!81491 (= lt!247178 (select (arr!16433 a!3154) (toIndex!0 (select (arr!16433 a!3154) j!147) mask!3216)))))

(assert (=> d!81491 (validMask!0 mask!3216)))

(assert (=> d!81491 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16433 a!3154) j!147) mask!3216) (select (arr!16433 a!3154) j!147) a!3154 mask!3216) lt!247179)))

(assert (= (and d!81491 c!62754) b!540276))

(assert (= (and d!81491 (not c!62754)) b!540277))

(assert (= (and b!540277 c!62752) b!540274))

(assert (= (and b!540277 (not c!62752)) b!540271))

(assert (= (and d!81491 c!62753) b!540272))

(assert (= (and d!81491 (not c!62753)) b!540269))

(assert (= (and b!540269 res!335394) b!540273))

(assert (= (and b!540273 (not res!335393)) b!540270))

(assert (= (and b!540270 (not res!335392)) b!540275))

(assert (=> b!540271 m!518421))

(declare-fun m!518543 () Bool)

(assert (=> b!540271 m!518543))

(assert (=> b!540271 m!518543))

(assert (=> b!540271 m!518419))

(declare-fun m!518545 () Bool)

(assert (=> b!540271 m!518545))

(declare-fun m!518547 () Bool)

(assert (=> b!540273 m!518547))

(assert (=> b!540270 m!518547))

(assert (=> b!540275 m!518547))

(assert (=> d!81491 m!518421))

(declare-fun m!518549 () Bool)

(assert (=> d!81491 m!518549))

(assert (=> d!81491 m!518413))

(assert (=> b!540096 d!81491))

(declare-fun d!81493 () Bool)

(declare-fun lt!247196 () (_ BitVec 32))

(declare-fun lt!247195 () (_ BitVec 32))

(assert (=> d!81493 (= lt!247196 (bvmul (bvxor lt!247195 (bvlshr lt!247195 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81493 (= lt!247195 ((_ extract 31 0) (bvand (bvxor (select (arr!16433 a!3154) j!147) (bvlshr (select (arr!16433 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81493 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!335399 (let ((h!11537 ((_ extract 31 0) (bvand (bvxor (select (arr!16433 a!3154) j!147) (bvlshr (select (arr!16433 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!50702 (bvmul (bvxor h!11537 (bvlshr h!11537 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!50702 (bvlshr x!50702 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!335399 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!335399 #b00000000000000000000000000000000))))))

(assert (=> d!81493 (= (toIndex!0 (select (arr!16433 a!3154) j!147) mask!3216) (bvand (bvxor lt!247196 (bvlshr lt!247196 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!540096 d!81493))

(declare-fun d!81499 () Bool)

(assert (=> d!81499 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!540097 d!81499))

(declare-fun b!540353 () Bool)

(declare-fun e!313016 () SeekEntryResult!4888)

(declare-fun lt!247215 () SeekEntryResult!4888)

(assert (=> b!540353 (= e!313016 (MissingZero!4888 (index!21778 lt!247215)))))

(declare-fun b!540354 () Bool)

(declare-fun e!313017 () SeekEntryResult!4888)

(assert (=> b!540354 (= e!313017 (Found!4888 (index!21778 lt!247215)))))

(declare-fun b!540355 () Bool)

(declare-fun e!313018 () SeekEntryResult!4888)

(assert (=> b!540355 (= e!313018 Undefined!4888)))

(declare-fun b!540356 () Bool)

(assert (=> b!540356 (= e!313018 e!313017)))

(declare-fun lt!247216 () (_ BitVec 64))

(assert (=> b!540356 (= lt!247216 (select (arr!16433 a!3154) (index!21778 lt!247215)))))

(declare-fun c!62779 () Bool)

(assert (=> b!540356 (= c!62779 (= lt!247216 k0!1998))))

(declare-fun b!540357 () Bool)

(declare-fun c!62781 () Bool)

(assert (=> b!540357 (= c!62781 (= lt!247216 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!540357 (= e!313017 e!313016)))

(declare-fun d!81501 () Bool)

(declare-fun lt!247217 () SeekEntryResult!4888)

(assert (=> d!81501 (and (or ((_ is Undefined!4888) lt!247217) (not ((_ is Found!4888) lt!247217)) (and (bvsge (index!21777 lt!247217) #b00000000000000000000000000000000) (bvslt (index!21777 lt!247217) (size!16798 a!3154)))) (or ((_ is Undefined!4888) lt!247217) ((_ is Found!4888) lt!247217) (not ((_ is MissingZero!4888) lt!247217)) (and (bvsge (index!21776 lt!247217) #b00000000000000000000000000000000) (bvslt (index!21776 lt!247217) (size!16798 a!3154)))) (or ((_ is Undefined!4888) lt!247217) ((_ is Found!4888) lt!247217) ((_ is MissingZero!4888) lt!247217) (not ((_ is MissingVacant!4888) lt!247217)) (and (bvsge (index!21779 lt!247217) #b00000000000000000000000000000000) (bvslt (index!21779 lt!247217) (size!16798 a!3154)))) (or ((_ is Undefined!4888) lt!247217) (ite ((_ is Found!4888) lt!247217) (= (select (arr!16433 a!3154) (index!21777 lt!247217)) k0!1998) (ite ((_ is MissingZero!4888) lt!247217) (= (select (arr!16433 a!3154) (index!21776 lt!247217)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4888) lt!247217) (= (select (arr!16433 a!3154) (index!21779 lt!247217)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81501 (= lt!247217 e!313018)))

(declare-fun c!62780 () Bool)

(assert (=> d!81501 (= c!62780 (and ((_ is Intermediate!4888) lt!247215) (undefined!5700 lt!247215)))))

(assert (=> d!81501 (= lt!247215 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!81501 (validMask!0 mask!3216)))

(assert (=> d!81501 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!247217)))

(declare-fun b!540358 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34191 (_ BitVec 32)) SeekEntryResult!4888)

(assert (=> b!540358 (= e!313016 (seekKeyOrZeroReturnVacant!0 (x!50696 lt!247215) (index!21778 lt!247215) (index!21778 lt!247215) k0!1998 a!3154 mask!3216))))

(assert (= (and d!81501 c!62780) b!540355))

(assert (= (and d!81501 (not c!62780)) b!540356))

(assert (= (and b!540356 c!62779) b!540354))

(assert (= (and b!540356 (not c!62779)) b!540357))

(assert (= (and b!540357 c!62781) b!540353))

(assert (= (and b!540357 (not c!62781)) b!540358))

(declare-fun m!518581 () Bool)

(assert (=> b!540356 m!518581))

(declare-fun m!518583 () Bool)

(assert (=> d!81501 m!518583))

(declare-fun m!518585 () Bool)

(assert (=> d!81501 m!518585))

(declare-fun m!518587 () Bool)

(assert (=> d!81501 m!518587))

(assert (=> d!81501 m!518413))

(declare-fun m!518589 () Bool)

(assert (=> d!81501 m!518589))

(assert (=> d!81501 m!518587))

(declare-fun m!518591 () Bool)

(assert (=> d!81501 m!518591))

(declare-fun m!518593 () Bool)

(assert (=> b!540358 m!518593))

(assert (=> b!540092 d!81501))

(check-sat (not b!540271) (not d!81501) (not b!540192) (not bm!31993) (not b!540195) (not bm!31990) (not b!540169) (not d!81491) (not b!540358) (not b!540196) (not b!540262) (not b!540181) (not d!81477) (not b!540178))
(check-sat)
