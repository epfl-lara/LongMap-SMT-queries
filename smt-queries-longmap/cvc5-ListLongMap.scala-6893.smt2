; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86666 () Bool)

(assert start!86666)

(declare-fun b!1004919 () Bool)

(declare-fun e!565884 () Bool)

(declare-fun e!565883 () Bool)

(assert (=> b!1004919 (= e!565884 e!565883)))

(declare-fun res!674202 () Bool)

(assert (=> b!1004919 (=> (not res!674202) (not e!565883))))

(declare-datatypes ((SeekEntryResult!9464 0))(
  ( (MissingZero!9464 (index!40227 (_ BitVec 32))) (Found!9464 (index!40228 (_ BitVec 32))) (Intermediate!9464 (undefined!10276 Bool) (index!40229 (_ BitVec 32)) (x!87634 (_ BitVec 32))) (Undefined!9464) (MissingVacant!9464 (index!40230 (_ BitVec 32))) )
))
(declare-fun lt!444371 () SeekEntryResult!9464)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1004919 (= res!674202 (or (= lt!444371 (MissingVacant!9464 i!1194)) (= lt!444371 (MissingZero!9464 i!1194))))))

(declare-datatypes ((array!63416 0))(
  ( (array!63417 (arr!30532 (Array (_ BitVec 32) (_ BitVec 64))) (size!31034 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63416)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63416 (_ BitVec 32)) SeekEntryResult!9464)

(assert (=> b!1004919 (= lt!444371 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1004920 () Bool)

(declare-fun e!565881 () Bool)

(assert (=> b!1004920 (= e!565883 e!565881)))

(declare-fun res!674208 () Bool)

(assert (=> b!1004920 (=> (not res!674208) (not e!565881))))

(declare-fun lt!444369 () SeekEntryResult!9464)

(declare-fun lt!444367 () SeekEntryResult!9464)

(assert (=> b!1004920 (= res!674208 (= lt!444369 lt!444367))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1004920 (= lt!444367 (Intermediate!9464 false resIndex!38 resX!38))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63416 (_ BitVec 32)) SeekEntryResult!9464)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004920 (= lt!444369 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30532 a!3219) j!170) mask!3464) (select (arr!30532 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004921 () Bool)

(declare-fun res!674210 () Bool)

(assert (=> b!1004921 (=> (not res!674210) (not e!565884))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1004921 (= res!674210 (validKeyInArray!0 k!2224))))

(declare-fun b!1004922 () Bool)

(declare-fun res!674211 () Bool)

(assert (=> b!1004922 (=> (not res!674211) (not e!565884))))

(declare-fun arrayContainsKey!0 (array!63416 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1004922 (= res!674211 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1004923 () Bool)

(declare-fun res!674207 () Bool)

(assert (=> b!1004923 (=> (not res!674207) (not e!565884))))

(assert (=> b!1004923 (= res!674207 (validKeyInArray!0 (select (arr!30532 a!3219) j!170)))))

(declare-fun b!1004924 () Bool)

(declare-fun e!565880 () Bool)

(assert (=> b!1004924 (= e!565881 e!565880)))

(declare-fun res!674206 () Bool)

(assert (=> b!1004924 (=> (not res!674206) (not e!565880))))

(declare-fun lt!444370 () SeekEntryResult!9464)

(assert (=> b!1004924 (= res!674206 (= lt!444370 lt!444367))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1004924 (= lt!444370 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30532 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004925 () Bool)

(declare-fun e!565885 () Bool)

(assert (=> b!1004925 (= e!565880 e!565885)))

(declare-fun res!674212 () Bool)

(assert (=> b!1004925 (=> (not res!674212) (not e!565885))))

(declare-fun lt!444366 () array!63416)

(declare-fun lt!444368 () (_ BitVec 64))

(assert (=> b!1004925 (= res!674212 (not (= lt!444369 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444368 mask!3464) lt!444368 lt!444366 mask!3464))))))

(assert (=> b!1004925 (= lt!444368 (select (store (arr!30532 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1004925 (= lt!444366 (array!63417 (store (arr!30532 a!3219) i!1194 k!2224) (size!31034 a!3219)))))

(declare-fun b!1004926 () Bool)

(declare-fun res!674213 () Bool)

(assert (=> b!1004926 (=> (not res!674213) (not e!565883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63416 (_ BitVec 32)) Bool)

(assert (=> b!1004926 (= res!674213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!674209 () Bool)

(assert (=> start!86666 (=> (not res!674209) (not e!565884))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86666 (= res!674209 (validMask!0 mask!3464))))

(assert (=> start!86666 e!565884))

(declare-fun array_inv!23656 (array!63416) Bool)

(assert (=> start!86666 (array_inv!23656 a!3219)))

(assert (=> start!86666 true))

(declare-fun b!1004927 () Bool)

(declare-fun res!674204 () Bool)

(assert (=> b!1004927 (=> (not res!674204) (not e!565883))))

(declare-datatypes ((List!21208 0))(
  ( (Nil!21205) (Cons!21204 (h!22384 (_ BitVec 64)) (t!30209 List!21208)) )
))
(declare-fun arrayNoDuplicates!0 (array!63416 (_ BitVec 32) List!21208) Bool)

(assert (=> b!1004927 (= res!674204 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21205))))

(declare-fun b!1004928 () Bool)

(assert (=> b!1004928 (= e!565885 (and (not (= index!1507 resIndex!38)) (= index!1507 i!1194)))))

(declare-fun b!1004929 () Bool)

(declare-fun res!674205 () Bool)

(assert (=> b!1004929 (=> (not res!674205) (not e!565885))))

(assert (=> b!1004929 (= res!674205 (not (= lt!444370 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444368 lt!444366 mask!3464))))))

(declare-fun b!1004930 () Bool)

(declare-fun res!674214 () Bool)

(assert (=> b!1004930 (=> (not res!674214) (not e!565883))))

(assert (=> b!1004930 (= res!674214 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31034 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31034 a!3219))))))

(declare-fun b!1004931 () Bool)

(declare-fun res!674203 () Bool)

(assert (=> b!1004931 (=> (not res!674203) (not e!565884))))

(assert (=> b!1004931 (= res!674203 (and (= (size!31034 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31034 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31034 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86666 res!674209) b!1004931))

(assert (= (and b!1004931 res!674203) b!1004923))

(assert (= (and b!1004923 res!674207) b!1004921))

(assert (= (and b!1004921 res!674210) b!1004922))

(assert (= (and b!1004922 res!674211) b!1004919))

(assert (= (and b!1004919 res!674202) b!1004926))

(assert (= (and b!1004926 res!674213) b!1004927))

(assert (= (and b!1004927 res!674204) b!1004930))

(assert (= (and b!1004930 res!674214) b!1004920))

(assert (= (and b!1004920 res!674208) b!1004924))

(assert (= (and b!1004924 res!674206) b!1004925))

(assert (= (and b!1004925 res!674212) b!1004929))

(assert (= (and b!1004929 res!674205) b!1004928))

(declare-fun m!930317 () Bool)

(assert (=> start!86666 m!930317))

(declare-fun m!930319 () Bool)

(assert (=> start!86666 m!930319))

(declare-fun m!930321 () Bool)

(assert (=> b!1004920 m!930321))

(assert (=> b!1004920 m!930321))

(declare-fun m!930323 () Bool)

(assert (=> b!1004920 m!930323))

(assert (=> b!1004920 m!930323))

(assert (=> b!1004920 m!930321))

(declare-fun m!930325 () Bool)

(assert (=> b!1004920 m!930325))

(declare-fun m!930327 () Bool)

(assert (=> b!1004929 m!930327))

(declare-fun m!930329 () Bool)

(assert (=> b!1004921 m!930329))

(assert (=> b!1004923 m!930321))

(assert (=> b!1004923 m!930321))

(declare-fun m!930331 () Bool)

(assert (=> b!1004923 m!930331))

(declare-fun m!930333 () Bool)

(assert (=> b!1004926 m!930333))

(declare-fun m!930335 () Bool)

(assert (=> b!1004922 m!930335))

(declare-fun m!930337 () Bool)

(assert (=> b!1004919 m!930337))

(declare-fun m!930339 () Bool)

(assert (=> b!1004927 m!930339))

(assert (=> b!1004924 m!930321))

(assert (=> b!1004924 m!930321))

(declare-fun m!930341 () Bool)

(assert (=> b!1004924 m!930341))

(declare-fun m!930343 () Bool)

(assert (=> b!1004925 m!930343))

(assert (=> b!1004925 m!930343))

(declare-fun m!930345 () Bool)

(assert (=> b!1004925 m!930345))

(declare-fun m!930347 () Bool)

(assert (=> b!1004925 m!930347))

(declare-fun m!930349 () Bool)

(assert (=> b!1004925 m!930349))

(push 1)

(assert (not b!1004929))

(assert (not b!1004920))

(assert (not b!1004923))

(assert (not b!1004922))

(assert (not b!1004925))

(assert (not b!1004926))

(assert (not start!86666))

(assert (not b!1004927))

(assert (not b!1004919))

(assert (not b!1004921))

(assert (not b!1004924))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1005139 () Bool)

(declare-fun lt!444435 () SeekEntryResult!9464)

(assert (=> b!1005139 (and (bvsge (index!40229 lt!444435) #b00000000000000000000000000000000) (bvslt (index!40229 lt!444435) (size!31034 lt!444366)))))

(declare-fun res!674341 () Bool)

(assert (=> b!1005139 (= res!674341 (= (select (arr!30532 lt!444366) (index!40229 lt!444435)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!566003 () Bool)

(assert (=> b!1005139 (=> res!674341 e!566003)))

(declare-fun b!1005141 () Bool)

(assert (=> b!1005141 (and (bvsge (index!40229 lt!444435) #b00000000000000000000000000000000) (bvslt (index!40229 lt!444435) (size!31034 lt!444366)))))

(assert (=> b!1005141 (= e!566003 (= (select (arr!30532 lt!444366) (index!40229 lt!444435)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1005142 () Bool)

(declare-fun e!566001 () Bool)

(assert (=> b!1005142 (= e!566001 (bvsge (x!87634 lt!444435) #b01111111111111111111111111111110))))

(declare-fun b!1005143 () Bool)

(declare-fun e!566000 () SeekEntryResult!9464)

(assert (=> b!1005143 (= e!566000 (Intermediate!9464 true index!1507 x!1245))))

(declare-fun b!1005144 () Bool)

(assert (=> b!1005144 (and (bvsge (index!40229 lt!444435) #b00000000000000000000000000000000) (bvslt (index!40229 lt!444435) (size!31034 lt!444366)))))

(declare-fun res!674340 () Bool)

(assert (=> b!1005144 (= res!674340 (= (select (arr!30532 lt!444366) (index!40229 lt!444435)) lt!444368))))

(assert (=> b!1005144 (=> res!674340 e!566003)))

(declare-fun e!566004 () Bool)

(assert (=> b!1005144 (= e!566004 e!566003)))

(declare-fun e!566002 () SeekEntryResult!9464)

(declare-fun b!1005145 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005145 (= e!566002 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!444368 lt!444366 mask!3464))))

(declare-fun d!119513 () Bool)

(assert (=> d!119513 e!566001))

(declare-fun c!101550 () Bool)

(assert (=> d!119513 (= c!101550 (and (is-Intermediate!9464 lt!444435) (undefined!10276 lt!444435)))))

(assert (=> d!119513 (= lt!444435 e!566000)))

(declare-fun c!101551 () Bool)

(assert (=> d!119513 (= c!101551 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!444436 () (_ BitVec 64))

(assert (=> d!119513 (= lt!444436 (select (arr!30532 lt!444366) index!1507))))

(assert (=> d!119513 (validMask!0 mask!3464)))

(assert (=> d!119513 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444368 lt!444366 mask!3464) lt!444435)))

(declare-fun b!1005140 () Bool)

(assert (=> b!1005140 (= e!566001 e!566004)))

(declare-fun res!674339 () Bool)

(assert (=> b!1005140 (= res!674339 (and (is-Intermediate!9464 lt!444435) (not (undefined!10276 lt!444435)) (bvslt (x!87634 lt!444435) #b01111111111111111111111111111110) (bvsge (x!87634 lt!444435) #b00000000000000000000000000000000) (bvsge (x!87634 lt!444435) x!1245)))))

(assert (=> b!1005140 (=> (not res!674339) (not e!566004))))

(declare-fun b!1005146 () Bool)

(assert (=> b!1005146 (= e!566000 e!566002)))

(declare-fun c!101552 () Bool)

(assert (=> b!1005146 (= c!101552 (or (= lt!444436 lt!444368) (= (bvadd lt!444436 lt!444436) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1005147 () Bool)

(assert (=> b!1005147 (= e!566002 (Intermediate!9464 false index!1507 x!1245))))

(assert (= (and d!119513 c!101551) b!1005143))

(assert (= (and d!119513 (not c!101551)) b!1005146))

(assert (= (and b!1005146 c!101552) b!1005147))

(assert (= (and b!1005146 (not c!101552)) b!1005145))

(assert (= (and d!119513 c!101550) b!1005142))

(assert (= (and d!119513 (not c!101550)) b!1005140))

(assert (= (and b!1005140 res!674339) b!1005144))

(assert (= (and b!1005144 (not res!674340)) b!1005139))

(assert (= (and b!1005139 (not res!674341)) b!1005141))

(declare-fun m!930473 () Bool)

(assert (=> b!1005141 m!930473))

(declare-fun m!930475 () Bool)

(assert (=> d!119513 m!930475))

(assert (=> d!119513 m!930317))

(assert (=> b!1005139 m!930473))

(assert (=> b!1005144 m!930473))

(declare-fun m!930477 () Bool)

(assert (=> b!1005145 m!930477))

(assert (=> b!1005145 m!930477))

(declare-fun m!930479 () Bool)

(assert (=> b!1005145 m!930479))

(assert (=> b!1004929 d!119513))

(declare-fun d!119521 () Bool)

(assert (=> d!119521 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86666 d!119521))

(declare-fun d!119531 () Bool)

(assert (=> d!119531 (= (array_inv!23656 a!3219) (bvsge (size!31034 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86666 d!119531))

(declare-fun b!1005174 () Bool)

(declare-fun lt!444459 () SeekEntryResult!9464)

(assert (=> b!1005174 (and (bvsge (index!40229 lt!444459) #b00000000000000000000000000000000) (bvslt (index!40229 lt!444459) (size!31034 a!3219)))))

(declare-fun res!674355 () Bool)

(assert (=> b!1005174 (= res!674355 (= (select (arr!30532 a!3219) (index!40229 lt!444459)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!566024 () Bool)

(assert (=> b!1005174 (=> res!674355 e!566024)))

(declare-fun b!1005176 () Bool)

(assert (=> b!1005176 (and (bvsge (index!40229 lt!444459) #b00000000000000000000000000000000) (bvslt (index!40229 lt!444459) (size!31034 a!3219)))))

(assert (=> b!1005176 (= e!566024 (= (select (arr!30532 a!3219) (index!40229 lt!444459)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1005177 () Bool)

(declare-fun e!566022 () Bool)

(assert (=> b!1005177 (= e!566022 (bvsge (x!87634 lt!444459) #b01111111111111111111111111111110))))

(declare-fun b!1005178 () Bool)

(declare-fun e!566021 () SeekEntryResult!9464)

(assert (=> b!1005178 (= e!566021 (Intermediate!9464 true index!1507 x!1245))))

(declare-fun b!1005179 () Bool)

(assert (=> b!1005179 (and (bvsge (index!40229 lt!444459) #b00000000000000000000000000000000) (bvslt (index!40229 lt!444459) (size!31034 a!3219)))))

(declare-fun res!674354 () Bool)

(assert (=> b!1005179 (= res!674354 (= (select (arr!30532 a!3219) (index!40229 lt!444459)) (select (arr!30532 a!3219) j!170)))))

(assert (=> b!1005179 (=> res!674354 e!566024)))

(declare-fun e!566025 () Bool)

(assert (=> b!1005179 (= e!566025 e!566024)))

(declare-fun e!566023 () SeekEntryResult!9464)

(declare-fun b!1005180 () Bool)

(assert (=> b!1005180 (= e!566023 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30532 a!3219) j!170) a!3219 mask!3464))))

(declare-fun d!119533 () Bool)

(assert (=> d!119533 e!566022))

(declare-fun c!101561 () Bool)

(assert (=> d!119533 (= c!101561 (and (is-Intermediate!9464 lt!444459) (undefined!10276 lt!444459)))))

(assert (=> d!119533 (= lt!444459 e!566021)))

(declare-fun c!101562 () Bool)

(assert (=> d!119533 (= c!101562 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!444460 () (_ BitVec 64))

(assert (=> d!119533 (= lt!444460 (select (arr!30532 a!3219) index!1507))))

(assert (=> d!119533 (validMask!0 mask!3464)))

(assert (=> d!119533 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30532 a!3219) j!170) a!3219 mask!3464) lt!444459)))

(declare-fun b!1005175 () Bool)

(assert (=> b!1005175 (= e!566022 e!566025)))

(declare-fun res!674353 () Bool)

(assert (=> b!1005175 (= res!674353 (and (is-Intermediate!9464 lt!444459) (not (undefined!10276 lt!444459)) (bvslt (x!87634 lt!444459) #b01111111111111111111111111111110) (bvsge (x!87634 lt!444459) #b00000000000000000000000000000000) (bvsge (x!87634 lt!444459) x!1245)))))

(assert (=> b!1005175 (=> (not res!674353) (not e!566025))))

(declare-fun b!1005181 () Bool)

(assert (=> b!1005181 (= e!566021 e!566023)))

(declare-fun c!101563 () Bool)

(assert (=> b!1005181 (= c!101563 (or (= lt!444460 (select (arr!30532 a!3219) j!170)) (= (bvadd lt!444460 lt!444460) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1005182 () Bool)

(assert (=> b!1005182 (= e!566023 (Intermediate!9464 false index!1507 x!1245))))

(assert (= (and d!119533 c!101562) b!1005178))

(assert (= (and d!119533 (not c!101562)) b!1005181))

(assert (= (and b!1005181 c!101563) b!1005182))

(assert (= (and b!1005181 (not c!101563)) b!1005180))

(assert (= (and d!119533 c!101561) b!1005177))

(assert (= (and d!119533 (not c!101561)) b!1005175))

(assert (= (and b!1005175 res!674353) b!1005179))

(assert (= (and b!1005179 (not res!674354)) b!1005174))

(assert (= (and b!1005174 (not res!674355)) b!1005176))

(declare-fun m!930495 () Bool)

(assert (=> b!1005176 m!930495))

(declare-fun m!930497 () Bool)

(assert (=> d!119533 m!930497))

(assert (=> d!119533 m!930317))

(assert (=> b!1005174 m!930495))

(assert (=> b!1005179 m!930495))

(assert (=> b!1005180 m!930477))

(assert (=> b!1005180 m!930477))

(assert (=> b!1005180 m!930321))

(declare-fun m!930499 () Bool)

(assert (=> b!1005180 m!930499))

(assert (=> b!1004924 d!119533))

(declare-fun b!1005248 () Bool)

(declare-fun e!566066 () SeekEntryResult!9464)

(declare-fun lt!444486 () SeekEntryResult!9464)

(assert (=> b!1005248 (= e!566066 (Found!9464 (index!40229 lt!444486)))))

(declare-fun b!1005249 () Bool)

(declare-fun e!566068 () SeekEntryResult!9464)

(assert (=> b!1005249 (= e!566068 e!566066)))

(declare-fun lt!444485 () (_ BitVec 64))

(assert (=> b!1005249 (= lt!444485 (select (arr!30532 a!3219) (index!40229 lt!444486)))))

(declare-fun c!101586 () Bool)

(assert (=> b!1005249 (= c!101586 (= lt!444485 k!2224))))

(declare-fun b!1005250 () Bool)

(assert (=> b!1005250 (= e!566068 Undefined!9464)))

(declare-fun b!1005247 () Bool)

(declare-fun c!101588 () Bool)

(assert (=> b!1005247 (= c!101588 (= lt!444485 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!566067 () SeekEntryResult!9464)

(assert (=> b!1005247 (= e!566066 e!566067)))

(declare-fun d!119535 () Bool)

(declare-fun lt!444487 () SeekEntryResult!9464)

(assert (=> d!119535 (and (or (is-Undefined!9464 lt!444487) (not (is-Found!9464 lt!444487)) (and (bvsge (index!40228 lt!444487) #b00000000000000000000000000000000) (bvslt (index!40228 lt!444487) (size!31034 a!3219)))) (or (is-Undefined!9464 lt!444487) (is-Found!9464 lt!444487) (not (is-MissingZero!9464 lt!444487)) (and (bvsge (index!40227 lt!444487) #b00000000000000000000000000000000) (bvslt (index!40227 lt!444487) (size!31034 a!3219)))) (or (is-Undefined!9464 lt!444487) (is-Found!9464 lt!444487) (is-MissingZero!9464 lt!444487) (not (is-MissingVacant!9464 lt!444487)) (and (bvsge (index!40230 lt!444487) #b00000000000000000000000000000000) (bvslt (index!40230 lt!444487) (size!31034 a!3219)))) (or (is-Undefined!9464 lt!444487) (ite (is-Found!9464 lt!444487) (= (select (arr!30532 a!3219) (index!40228 lt!444487)) k!2224) (ite (is-MissingZero!9464 lt!444487) (= (select (arr!30532 a!3219) (index!40227 lt!444487)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9464 lt!444487) (= (select (arr!30532 a!3219) (index!40230 lt!444487)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119535 (= lt!444487 e!566068)))

(declare-fun c!101587 () Bool)

(assert (=> d!119535 (= c!101587 (and (is-Intermediate!9464 lt!444486) (undefined!10276 lt!444486)))))

(assert (=> d!119535 (= lt!444486 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!119535 (validMask!0 mask!3464)))

(assert (=> d!119535 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!444487)))

(declare-fun b!1005251 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63416 (_ BitVec 32)) SeekEntryResult!9464)

(assert (=> b!1005251 (= e!566067 (seekKeyOrZeroReturnVacant!0 (x!87634 lt!444486) (index!40229 lt!444486) (index!40229 lt!444486) k!2224 a!3219 mask!3464))))

(declare-fun b!1005252 () Bool)

(assert (=> b!1005252 (= e!566067 (MissingZero!9464 (index!40229 lt!444486)))))

(assert (= (and d!119535 c!101587) b!1005250))

(assert (= (and d!119535 (not c!101587)) b!1005249))

(assert (= (and b!1005249 c!101586) b!1005248))

(assert (= (and b!1005249 (not c!101586)) b!1005247))

(assert (= (and b!1005247 c!101588) b!1005252))

(assert (= (and b!1005247 (not c!101588)) b!1005251))

(declare-fun m!930541 () Bool)

(assert (=> b!1005249 m!930541))

(assert (=> d!119535 m!930317))

(declare-fun m!930543 () Bool)

(assert (=> d!119535 m!930543))

(declare-fun m!930545 () Bool)

(assert (=> d!119535 m!930545))

(declare-fun m!930547 () Bool)

(assert (=> d!119535 m!930547))

(assert (=> d!119535 m!930545))

(declare-fun m!930549 () Bool)

(assert (=> d!119535 m!930549))

(declare-fun m!930551 () Bool)

(assert (=> d!119535 m!930551))

(declare-fun m!930553 () Bool)

(assert (=> b!1005251 m!930553))

(assert (=> b!1004919 d!119535))

(declare-fun b!1005253 () Bool)

(declare-fun lt!444488 () SeekEntryResult!9464)

(assert (=> b!1005253 (and (bvsge (index!40229 lt!444488) #b00000000000000000000000000000000) (bvslt (index!40229 lt!444488) (size!31034 lt!444366)))))

(declare-fun res!674378 () Bool)

(assert (=> b!1005253 (= res!674378 (= (select (arr!30532 lt!444366) (index!40229 lt!444488)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!566072 () Bool)

(assert (=> b!1005253 (=> res!674378 e!566072)))

(declare-fun b!1005255 () Bool)

(assert (=> b!1005255 (and (bvsge (index!40229 lt!444488) #b00000000000000000000000000000000) (bvslt (index!40229 lt!444488) (size!31034 lt!444366)))))

(assert (=> b!1005255 (= e!566072 (= (select (arr!30532 lt!444366) (index!40229 lt!444488)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1005256 () Bool)

(declare-fun e!566070 () Bool)

(assert (=> b!1005256 (= e!566070 (bvsge (x!87634 lt!444488) #b01111111111111111111111111111110))))

(declare-fun b!1005257 () Bool)

(declare-fun e!566069 () SeekEntryResult!9464)

(assert (=> b!1005257 (= e!566069 (Intermediate!9464 true (toIndex!0 lt!444368 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1005258 () Bool)

(assert (=> b!1005258 (and (bvsge (index!40229 lt!444488) #b00000000000000000000000000000000) (bvslt (index!40229 lt!444488) (size!31034 lt!444366)))))

(declare-fun res!674377 () Bool)

(assert (=> b!1005258 (= res!674377 (= (select (arr!30532 lt!444366) (index!40229 lt!444488)) lt!444368))))

(assert (=> b!1005258 (=> res!674377 e!566072)))

(declare-fun e!566073 () Bool)

(assert (=> b!1005258 (= e!566073 e!566072)))

(declare-fun b!1005259 () Bool)

(declare-fun e!566071 () SeekEntryResult!9464)

(assert (=> b!1005259 (= e!566071 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!444368 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!444368 lt!444366 mask!3464))))

(declare-fun d!119549 () Bool)

(assert (=> d!119549 e!566070))

(declare-fun c!101589 () Bool)

(assert (=> d!119549 (= c!101589 (and (is-Intermediate!9464 lt!444488) (undefined!10276 lt!444488)))))

(assert (=> d!119549 (= lt!444488 e!566069)))

(declare-fun c!101590 () Bool)

(assert (=> d!119549 (= c!101590 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!444489 () (_ BitVec 64))

(assert (=> d!119549 (= lt!444489 (select (arr!30532 lt!444366) (toIndex!0 lt!444368 mask!3464)))))

(assert (=> d!119549 (validMask!0 mask!3464)))

(assert (=> d!119549 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444368 mask!3464) lt!444368 lt!444366 mask!3464) lt!444488)))

(declare-fun b!1005254 () Bool)

(assert (=> b!1005254 (= e!566070 e!566073)))

(declare-fun res!674376 () Bool)

(assert (=> b!1005254 (= res!674376 (and (is-Intermediate!9464 lt!444488) (not (undefined!10276 lt!444488)) (bvslt (x!87634 lt!444488) #b01111111111111111111111111111110) (bvsge (x!87634 lt!444488) #b00000000000000000000000000000000) (bvsge (x!87634 lt!444488) #b00000000000000000000000000000000)))))

(assert (=> b!1005254 (=> (not res!674376) (not e!566073))))

(declare-fun b!1005260 () Bool)

(assert (=> b!1005260 (= e!566069 e!566071)))

(declare-fun c!101591 () Bool)

(assert (=> b!1005260 (= c!101591 (or (= lt!444489 lt!444368) (= (bvadd lt!444489 lt!444489) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1005261 () Bool)

(assert (=> b!1005261 (= e!566071 (Intermediate!9464 false (toIndex!0 lt!444368 mask!3464) #b00000000000000000000000000000000))))

(assert (= (and d!119549 c!101590) b!1005257))

(assert (= (and d!119549 (not c!101590)) b!1005260))

(assert (= (and b!1005260 c!101591) b!1005261))

(assert (= (and b!1005260 (not c!101591)) b!1005259))

(assert (= (and d!119549 c!101589) b!1005256))

(assert (= (and d!119549 (not c!101589)) b!1005254))

(assert (= (and b!1005254 res!674376) b!1005258))

(assert (= (and b!1005258 (not res!674377)) b!1005253))

(assert (= (and b!1005253 (not res!674378)) b!1005255))

(declare-fun m!930555 () Bool)

(assert (=> b!1005255 m!930555))

(assert (=> d!119549 m!930343))

(declare-fun m!930557 () Bool)

(assert (=> d!119549 m!930557))

(assert (=> d!119549 m!930317))

(assert (=> b!1005253 m!930555))

(assert (=> b!1005258 m!930555))

(assert (=> b!1005259 m!930343))

(declare-fun m!930559 () Bool)

(assert (=> b!1005259 m!930559))

(assert (=> b!1005259 m!930559))

(declare-fun m!930561 () Bool)

(assert (=> b!1005259 m!930561))

(assert (=> b!1004925 d!119549))

(declare-fun d!119551 () Bool)

(declare-fun lt!444495 () (_ BitVec 32))

(declare-fun lt!444494 () (_ BitVec 32))

(assert (=> d!119551 (= lt!444495 (bvmul (bvxor lt!444494 (bvlshr lt!444494 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119551 (= lt!444494 ((_ extract 31 0) (bvand (bvxor lt!444368 (bvlshr lt!444368 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119551 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!674379 (let ((h!22389 ((_ extract 31 0) (bvand (bvxor lt!444368 (bvlshr lt!444368 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87642 (bvmul (bvxor h!22389 (bvlshr h!22389 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87642 (bvlshr x!87642 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!674379 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!674379 #b00000000000000000000000000000000))))))

(assert (=> d!119551 (= (toIndex!0 lt!444368 mask!3464) (bvand (bvxor lt!444495 (bvlshr lt!444495 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1004925 d!119551))

(declare-fun b!1005262 () Bool)

(declare-fun lt!444496 () SeekEntryResult!9464)

(assert (=> b!1005262 (and (bvsge (index!40229 lt!444496) #b00000000000000000000000000000000) (bvslt (index!40229 lt!444496) (size!31034 a!3219)))))

(declare-fun res!674382 () Bool)

(assert (=> b!1005262 (= res!674382 (= (select (arr!30532 a!3219) (index!40229 lt!444496)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!566077 () Bool)

(assert (=> b!1005262 (=> res!674382 e!566077)))

(declare-fun b!1005264 () Bool)

(assert (=> b!1005264 (and (bvsge (index!40229 lt!444496) #b00000000000000000000000000000000) (bvslt (index!40229 lt!444496) (size!31034 a!3219)))))

(assert (=> b!1005264 (= e!566077 (= (select (arr!30532 a!3219) (index!40229 lt!444496)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1005265 () Bool)

(declare-fun e!566075 () Bool)

(assert (=> b!1005265 (= e!566075 (bvsge (x!87634 lt!444496) #b01111111111111111111111111111110))))

(declare-fun b!1005266 () Bool)

(declare-fun e!566074 () SeekEntryResult!9464)

(assert (=> b!1005266 (= e!566074 (Intermediate!9464 true (toIndex!0 (select (arr!30532 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1005267 () Bool)

(assert (=> b!1005267 (and (bvsge (index!40229 lt!444496) #b00000000000000000000000000000000) (bvslt (index!40229 lt!444496) (size!31034 a!3219)))))

(declare-fun res!674381 () Bool)

(assert (=> b!1005267 (= res!674381 (= (select (arr!30532 a!3219) (index!40229 lt!444496)) (select (arr!30532 a!3219) j!170)))))

(assert (=> b!1005267 (=> res!674381 e!566077)))

(declare-fun e!566078 () Bool)

(assert (=> b!1005267 (= e!566078 e!566077)))

(declare-fun e!566076 () SeekEntryResult!9464)

(declare-fun b!1005268 () Bool)

(assert (=> b!1005268 (= e!566076 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30532 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30532 a!3219) j!170) a!3219 mask!3464))))

(declare-fun d!119553 () Bool)

(assert (=> d!119553 e!566075))

(declare-fun c!101592 () Bool)

(assert (=> d!119553 (= c!101592 (and (is-Intermediate!9464 lt!444496) (undefined!10276 lt!444496)))))

(assert (=> d!119553 (= lt!444496 e!566074)))

(declare-fun c!101593 () Bool)

(assert (=> d!119553 (= c!101593 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!444497 () (_ BitVec 64))

(assert (=> d!119553 (= lt!444497 (select (arr!30532 a!3219) (toIndex!0 (select (arr!30532 a!3219) j!170) mask!3464)))))

(assert (=> d!119553 (validMask!0 mask!3464)))

(assert (=> d!119553 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30532 a!3219) j!170) mask!3464) (select (arr!30532 a!3219) j!170) a!3219 mask!3464) lt!444496)))

(declare-fun b!1005263 () Bool)

(assert (=> b!1005263 (= e!566075 e!566078)))

(declare-fun res!674380 () Bool)

(assert (=> b!1005263 (= res!674380 (and (is-Intermediate!9464 lt!444496) (not (undefined!10276 lt!444496)) (bvslt (x!87634 lt!444496) #b01111111111111111111111111111110) (bvsge (x!87634 lt!444496) #b00000000000000000000000000000000) (bvsge (x!87634 lt!444496) #b00000000000000000000000000000000)))))

(assert (=> b!1005263 (=> (not res!674380) (not e!566078))))

(declare-fun b!1005269 () Bool)

(assert (=> b!1005269 (= e!566074 e!566076)))

(declare-fun c!101594 () Bool)

(assert (=> b!1005269 (= c!101594 (or (= lt!444497 (select (arr!30532 a!3219) j!170)) (= (bvadd lt!444497 lt!444497) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1005270 () Bool)

(assert (=> b!1005270 (= e!566076 (Intermediate!9464 false (toIndex!0 (select (arr!30532 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(assert (= (and d!119553 c!101593) b!1005266))

(assert (= (and d!119553 (not c!101593)) b!1005269))

(assert (= (and b!1005269 c!101594) b!1005270))

(assert (= (and b!1005269 (not c!101594)) b!1005268))

(assert (= (and d!119553 c!101592) b!1005265))

(assert (= (and d!119553 (not c!101592)) b!1005263))

(assert (= (and b!1005263 res!674380) b!1005267))

(assert (= (and b!1005267 (not res!674381)) b!1005262))

(assert (= (and b!1005262 (not res!674382)) b!1005264))

(declare-fun m!930563 () Bool)

(assert (=> b!1005264 m!930563))

(assert (=> d!119553 m!930323))

(declare-fun m!930565 () Bool)

(assert (=> d!119553 m!930565))

(assert (=> d!119553 m!930317))

(assert (=> b!1005262 m!930563))

(assert (=> b!1005267 m!930563))

(assert (=> b!1005268 m!930323))

(declare-fun m!930567 () Bool)

(assert (=> b!1005268 m!930567))

(assert (=> b!1005268 m!930567))

(assert (=> b!1005268 m!930321))

(declare-fun m!930569 () Bool)

(assert (=> b!1005268 m!930569))

(assert (=> b!1004920 d!119553))

(declare-fun d!119559 () Bool)

(declare-fun lt!444499 () (_ BitVec 32))

(declare-fun lt!444498 () (_ BitVec 32))

(assert (=> d!119559 (= lt!444499 (bvmul (bvxor lt!444498 (bvlshr lt!444498 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119559 (= lt!444498 ((_ extract 31 0) (bvand (bvxor (select (arr!30532 a!3219) j!170) (bvlshr (select (arr!30532 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119559 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!674379 (let ((h!22389 ((_ extract 31 0) (bvand (bvxor (select (arr!30532 a!3219) j!170) (bvlshr (select (arr!30532 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87642 (bvmul (bvxor h!22389 (bvlshr h!22389 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87642 (bvlshr x!87642 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!674379 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!674379 #b00000000000000000000000000000000))))))

(assert (=> d!119559 (= (toIndex!0 (select (arr!30532 a!3219) j!170) mask!3464) (bvand (bvxor lt!444499 (bvlshr lt!444499 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1004920 d!119559))

(declare-fun b!1005291 () Bool)

(declare-fun e!566096 () Bool)

(declare-fun call!42344 () Bool)

(assert (=> b!1005291 (= e!566096 call!42344)))

(declare-fun d!119561 () Bool)

(declare-fun res!674393 () Bool)

(declare-fun e!566094 () Bool)

(assert (=> d!119561 (=> res!674393 e!566094)))

(assert (=> d!119561 (= res!674393 (bvsge #b00000000000000000000000000000000 (size!31034 a!3219)))))

(assert (=> d!119561 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!566094)))

(declare-fun bm!42341 () Bool)

(assert (=> bm!42341 (= call!42344 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!1005292 () Bool)

(declare-fun e!566095 () Bool)

(assert (=> b!1005292 (= e!566095 e!566096)))

(declare-fun lt!444515 () (_ BitVec 64))

(assert (=> b!1005292 (= lt!444515 (select (arr!30532 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33006 0))(
  ( (Unit!33007) )
))
(declare-fun lt!444516 () Unit!33006)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63416 (_ BitVec 64) (_ BitVec 32)) Unit!33006)

(assert (=> b!1005292 (= lt!444516 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!444515 #b00000000000000000000000000000000))))

(assert (=> b!1005292 (arrayContainsKey!0 a!3219 lt!444515 #b00000000000000000000000000000000)))

(declare-fun lt!444517 () Unit!33006)

(assert (=> b!1005292 (= lt!444517 lt!444516)))

(declare-fun res!674394 () Bool)

(assert (=> b!1005292 (= res!674394 (= (seekEntryOrOpen!0 (select (arr!30532 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9464 #b00000000000000000000000000000000)))))

(assert (=> b!1005292 (=> (not res!674394) (not e!566096))))

(declare-fun b!1005293 () Bool)

(assert (=> b!1005293 (= e!566094 e!566095)))

(declare-fun c!101600 () Bool)

(assert (=> b!1005293 (= c!101600 (validKeyInArray!0 (select (arr!30532 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1005294 () Bool)

(assert (=> b!1005294 (= e!566095 call!42344)))

(assert (= (and d!119561 (not res!674393)) b!1005293))

(assert (= (and b!1005293 c!101600) b!1005292))

(assert (= (and b!1005293 (not c!101600)) b!1005294))

(assert (= (and b!1005292 res!674394) b!1005291))

(assert (= (or b!1005291 b!1005294) bm!42341))

(declare-fun m!930579 () Bool)

(assert (=> bm!42341 m!930579))

(declare-fun m!930581 () Bool)

(assert (=> b!1005292 m!930581))

(declare-fun m!930583 () Bool)

(assert (=> b!1005292 m!930583))

(declare-fun m!930585 () Bool)

(assert (=> b!1005292 m!930585))

(assert (=> b!1005292 m!930581))

(declare-fun m!930587 () Bool)

(assert (=> b!1005292 m!930587))

(assert (=> b!1005293 m!930581))

(assert (=> b!1005293 m!930581))

(declare-fun m!930589 () Bool)

(assert (=> b!1005293 m!930589))

(assert (=> b!1004926 d!119561))

(declare-fun d!119567 () Bool)

(assert (=> d!119567 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1004921 d!119567))

(declare-fun b!1005314 () Bool)

(declare-fun e!566111 () Bool)

(declare-fun call!42347 () Bool)

(assert (=> b!1005314 (= e!566111 call!42347)))

(declare-fun b!1005315 () Bool)

(assert (=> b!1005315 (= e!566111 call!42347)))

(declare-fun b!1005316 () Bool)

(declare-fun e!566113 () Bool)

(declare-fun contains!5885 (List!21208 (_ BitVec 64)) Bool)

(assert (=> b!1005316 (= e!566113 (contains!5885 Nil!21205 (select (arr!30532 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1005317 () Bool)

(declare-fun e!566112 () Bool)

(assert (=> b!1005317 (= e!566112 e!566111)))

(declare-fun c!101606 () Bool)

(assert (=> b!1005317 (= c!101606 (validKeyInArray!0 (select (arr!30532 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119571 () Bool)

(declare-fun res!674405 () Bool)

(declare-fun e!566110 () Bool)

(assert (=> d!119571 (=> res!674405 e!566110)))

(assert (=> d!119571 (= res!674405 (bvsge #b00000000000000000000000000000000 (size!31034 a!3219)))))

(assert (=> d!119571 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21205) e!566110)))

(declare-fun bm!42344 () Bool)

(assert (=> bm!42344 (= call!42347 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101606 (Cons!21204 (select (arr!30532 a!3219) #b00000000000000000000000000000000) Nil!21205) Nil!21205)))))

(declare-fun b!1005318 () Bool)

(assert (=> b!1005318 (= e!566110 e!566112)))

(declare-fun res!674406 () Bool)

(assert (=> b!1005318 (=> (not res!674406) (not e!566112))))

(assert (=> b!1005318 (= res!674406 (not e!566113))))

(declare-fun res!674404 () Bool)

(assert (=> b!1005318 (=> (not res!674404) (not e!566113))))

(assert (=> b!1005318 (= res!674404 (validKeyInArray!0 (select (arr!30532 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!119571 (not res!674405)) b!1005318))

(assert (= (and b!1005318 res!674404) b!1005316))

(assert (= (and b!1005318 res!674406) b!1005317))

(assert (= (and b!1005317 c!101606) b!1005315))

(assert (= (and b!1005317 (not c!101606)) b!1005314))

(assert (= (or b!1005315 b!1005314) bm!42344))

(assert (=> b!1005316 m!930581))

(assert (=> b!1005316 m!930581))

(declare-fun m!930599 () Bool)

(assert (=> b!1005316 m!930599))

(assert (=> b!1005317 m!930581))

(assert (=> b!1005317 m!930581))

(assert (=> b!1005317 m!930589))

(assert (=> bm!42344 m!930581))

(declare-fun m!930601 () Bool)

(assert (=> bm!42344 m!930601))

(assert (=> b!1005318 m!930581))

(assert (=> b!1005318 m!930581))

(assert (=> b!1005318 m!930589))

(assert (=> b!1004927 d!119571))

(declare-fun d!119573 () Bool)

(declare-fun res!674411 () Bool)

(declare-fun e!566118 () Bool)

(assert (=> d!119573 (=> res!674411 e!566118)))

(assert (=> d!119573 (= res!674411 (= (select (arr!30532 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!119573 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!566118)))

(declare-fun b!1005323 () Bool)

(declare-fun e!566119 () Bool)

(assert (=> b!1005323 (= e!566118 e!566119)))

(declare-fun res!674412 () Bool)

(assert (=> b!1005323 (=> (not res!674412) (not e!566119))))

(assert (=> b!1005323 (= res!674412 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31034 a!3219)))))

(declare-fun b!1005324 () Bool)

(assert (=> b!1005324 (= e!566119 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119573 (not res!674411)) b!1005323))

(assert (= (and b!1005323 res!674412) b!1005324))

(assert (=> d!119573 m!930581))

(declare-fun m!930603 () Bool)

(assert (=> b!1005324 m!930603))

(assert (=> b!1004922 d!119573))

(declare-fun d!119575 () Bool)

(assert (=> d!119575 (= (validKeyInArray!0 (select (arr!30532 a!3219) j!170)) (and (not (= (select (arr!30532 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30532 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1004923 d!119575))

(push 1)

(assert (not b!1005318))

(assert (not d!119533))

(assert (not b!1005292))

(assert (not b!1005145))

(assert (not bm!42344))

(assert (not b!1005259))

(assert (not b!1005180))

(assert (not b!1005268))

(assert (not b!1005293))

(assert (not d!119553))

(assert (not d!119549))

(assert (not b!1005324))

(assert (not b!1005316))

(assert (not d!119535))

(assert (not b!1005251))

(assert (not b!1005317))

(assert (not d!119513))

(assert (not bm!42341))

(check-sat)

