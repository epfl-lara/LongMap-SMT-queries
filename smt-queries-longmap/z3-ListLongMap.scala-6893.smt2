; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86668 () Bool)

(assert start!86668)

(declare-fun b!1004958 () Bool)

(declare-fun e!565901 () Bool)

(declare-fun e!565900 () Bool)

(assert (=> b!1004958 (= e!565901 e!565900)))

(declare-fun res!674253 () Bool)

(assert (=> b!1004958 (=> (not res!674253) (not e!565900))))

(declare-datatypes ((SeekEntryResult!9465 0))(
  ( (MissingZero!9465 (index!40231 (_ BitVec 32))) (Found!9465 (index!40232 (_ BitVec 32))) (Intermediate!9465 (undefined!10277 Bool) (index!40233 (_ BitVec 32)) (x!87635 (_ BitVec 32))) (Undefined!9465) (MissingVacant!9465 (index!40234 (_ BitVec 32))) )
))
(declare-fun lt!444387 () SeekEntryResult!9465)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1004958 (= res!674253 (or (= lt!444387 (MissingVacant!9465 i!1194)) (= lt!444387 (MissingZero!9465 i!1194))))))

(declare-datatypes ((array!63418 0))(
  ( (array!63419 (arr!30533 (Array (_ BitVec 32) (_ BitVec 64))) (size!31035 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63418)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63418 (_ BitVec 32)) SeekEntryResult!9465)

(assert (=> b!1004958 (= lt!444387 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1004959 () Bool)

(declare-fun res!674244 () Bool)

(assert (=> b!1004959 (=> (not res!674244) (not e!565900))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1004959 (= res!674244 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31035 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31035 a!3219))))))

(declare-fun b!1004960 () Bool)

(declare-fun res!674248 () Bool)

(assert (=> b!1004960 (=> (not res!674248) (not e!565901))))

(declare-fun arrayContainsKey!0 (array!63418 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1004960 (= res!674248 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1004961 () Bool)

(declare-fun res!674251 () Bool)

(assert (=> b!1004961 (=> (not res!674251) (not e!565901))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1004961 (= res!674251 (validKeyInArray!0 (select (arr!30533 a!3219) j!170)))))

(declare-fun b!1004962 () Bool)

(declare-fun res!674247 () Bool)

(assert (=> b!1004962 (=> (not res!674247) (not e!565901))))

(assert (=> b!1004962 (= res!674247 (validKeyInArray!0 k0!2224))))

(declare-fun b!1004963 () Bool)

(declare-fun res!674243 () Bool)

(assert (=> b!1004963 (=> (not res!674243) (not e!565901))))

(assert (=> b!1004963 (= res!674243 (and (= (size!31035 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31035 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31035 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1004964 () Bool)

(declare-fun res!674245 () Bool)

(declare-fun e!565899 () Bool)

(assert (=> b!1004964 (=> (not res!674245) (not e!565899))))

(declare-fun lt!444388 () (_ BitVec 64))

(declare-fun lt!444389 () SeekEntryResult!9465)

(declare-fun lt!444384 () array!63418)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63418 (_ BitVec 32)) SeekEntryResult!9465)

(assert (=> b!1004964 (= res!674245 (not (= lt!444389 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444388 lt!444384 mask!3464))))))

(declare-fun b!1004965 () Bool)

(declare-fun res!674246 () Bool)

(assert (=> b!1004965 (=> (not res!674246) (not e!565900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63418 (_ BitVec 32)) Bool)

(assert (=> b!1004965 (= res!674246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1004966 () Bool)

(declare-fun e!565903 () Bool)

(assert (=> b!1004966 (= e!565900 e!565903)))

(declare-fun res!674242 () Bool)

(assert (=> b!1004966 (=> (not res!674242) (not e!565903))))

(declare-fun lt!444385 () SeekEntryResult!9465)

(declare-fun lt!444386 () SeekEntryResult!9465)

(assert (=> b!1004966 (= res!674242 (= lt!444385 lt!444386))))

(assert (=> b!1004966 (= lt!444386 (Intermediate!9465 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004966 (= lt!444385 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30533 a!3219) j!170) mask!3464) (select (arr!30533 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004968 () Bool)

(assert (=> b!1004968 (= e!565899 (and (not (= index!1507 resIndex!38)) (= index!1507 i!1194)))))

(declare-fun b!1004969 () Bool)

(declare-fun e!565898 () Bool)

(assert (=> b!1004969 (= e!565898 e!565899)))

(declare-fun res!674252 () Bool)

(assert (=> b!1004969 (=> (not res!674252) (not e!565899))))

(assert (=> b!1004969 (= res!674252 (not (= lt!444385 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444388 mask!3464) lt!444388 lt!444384 mask!3464))))))

(assert (=> b!1004969 (= lt!444388 (select (store (arr!30533 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1004969 (= lt!444384 (array!63419 (store (arr!30533 a!3219) i!1194 k0!2224) (size!31035 a!3219)))))

(declare-fun b!1004970 () Bool)

(assert (=> b!1004970 (= e!565903 e!565898)))

(declare-fun res!674250 () Bool)

(assert (=> b!1004970 (=> (not res!674250) (not e!565898))))

(assert (=> b!1004970 (= res!674250 (= lt!444389 lt!444386))))

(assert (=> b!1004970 (= lt!444389 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30533 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004967 () Bool)

(declare-fun res!674241 () Bool)

(assert (=> b!1004967 (=> (not res!674241) (not e!565900))))

(declare-datatypes ((List!21209 0))(
  ( (Nil!21206) (Cons!21205 (h!22385 (_ BitVec 64)) (t!30210 List!21209)) )
))
(declare-fun arrayNoDuplicates!0 (array!63418 (_ BitVec 32) List!21209) Bool)

(assert (=> b!1004967 (= res!674241 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21206))))

(declare-fun res!674249 () Bool)

(assert (=> start!86668 (=> (not res!674249) (not e!565901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86668 (= res!674249 (validMask!0 mask!3464))))

(assert (=> start!86668 e!565901))

(declare-fun array_inv!23657 (array!63418) Bool)

(assert (=> start!86668 (array_inv!23657 a!3219)))

(assert (=> start!86668 true))

(assert (= (and start!86668 res!674249) b!1004963))

(assert (= (and b!1004963 res!674243) b!1004961))

(assert (= (and b!1004961 res!674251) b!1004962))

(assert (= (and b!1004962 res!674247) b!1004960))

(assert (= (and b!1004960 res!674248) b!1004958))

(assert (= (and b!1004958 res!674253) b!1004965))

(assert (= (and b!1004965 res!674246) b!1004967))

(assert (= (and b!1004967 res!674241) b!1004959))

(assert (= (and b!1004959 res!674244) b!1004966))

(assert (= (and b!1004966 res!674242) b!1004970))

(assert (= (and b!1004970 res!674250) b!1004969))

(assert (= (and b!1004969 res!674252) b!1004964))

(assert (= (and b!1004964 res!674245) b!1004968))

(declare-fun m!930351 () Bool)

(assert (=> b!1004960 m!930351))

(declare-fun m!930353 () Bool)

(assert (=> b!1004966 m!930353))

(assert (=> b!1004966 m!930353))

(declare-fun m!930355 () Bool)

(assert (=> b!1004966 m!930355))

(assert (=> b!1004966 m!930355))

(assert (=> b!1004966 m!930353))

(declare-fun m!930357 () Bool)

(assert (=> b!1004966 m!930357))

(assert (=> b!1004970 m!930353))

(assert (=> b!1004970 m!930353))

(declare-fun m!930359 () Bool)

(assert (=> b!1004970 m!930359))

(declare-fun m!930361 () Bool)

(assert (=> b!1004962 m!930361))

(declare-fun m!930363 () Bool)

(assert (=> b!1004967 m!930363))

(declare-fun m!930365 () Bool)

(assert (=> b!1004969 m!930365))

(assert (=> b!1004969 m!930365))

(declare-fun m!930367 () Bool)

(assert (=> b!1004969 m!930367))

(declare-fun m!930369 () Bool)

(assert (=> b!1004969 m!930369))

(declare-fun m!930371 () Bool)

(assert (=> b!1004969 m!930371))

(declare-fun m!930373 () Bool)

(assert (=> b!1004965 m!930373))

(declare-fun m!930375 () Bool)

(assert (=> b!1004964 m!930375))

(declare-fun m!930377 () Bool)

(assert (=> b!1004958 m!930377))

(declare-fun m!930379 () Bool)

(assert (=> start!86668 m!930379))

(declare-fun m!930381 () Bool)

(assert (=> start!86668 m!930381))

(assert (=> b!1004961 m!930353))

(assert (=> b!1004961 m!930353))

(declare-fun m!930383 () Bool)

(assert (=> b!1004961 m!930383))

(check-sat (not b!1004969) (not b!1004964) (not b!1004967) (not b!1004958) (not b!1004960) (not start!86668) (not b!1004965) (not b!1004970) (not b!1004961) (not b!1004962) (not b!1004966))
(check-sat)
(get-model)

(declare-fun d!119493 () Bool)

(assert (=> d!119493 (= (validKeyInArray!0 (select (arr!30533 a!3219) j!170)) (and (not (= (select (arr!30533 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30533 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1004961 d!119493))

(declare-fun b!1005020 () Bool)

(declare-fun e!565933 () Bool)

(declare-fun e!565932 () Bool)

(assert (=> b!1005020 (= e!565933 e!565932)))

(declare-fun c!101510 () Bool)

(assert (=> b!1005020 (= c!101510 (validKeyInArray!0 (select (arr!30533 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42329 () Bool)

(declare-fun call!42332 () Bool)

(assert (=> bm!42329 (= call!42332 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101510 (Cons!21205 (select (arr!30533 a!3219) #b00000000000000000000000000000000) Nil!21206) Nil!21206)))))

(declare-fun d!119495 () Bool)

(declare-fun res!674300 () Bool)

(declare-fun e!565930 () Bool)

(assert (=> d!119495 (=> res!674300 e!565930)))

(assert (=> d!119495 (= res!674300 (bvsge #b00000000000000000000000000000000 (size!31035 a!3219)))))

(assert (=> d!119495 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21206) e!565930)))

(declare-fun b!1005021 () Bool)

(assert (=> b!1005021 (= e!565932 call!42332)))

(declare-fun b!1005022 () Bool)

(declare-fun e!565931 () Bool)

(declare-fun contains!5883 (List!21209 (_ BitVec 64)) Bool)

(assert (=> b!1005022 (= e!565931 (contains!5883 Nil!21206 (select (arr!30533 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1005023 () Bool)

(assert (=> b!1005023 (= e!565932 call!42332)))

(declare-fun b!1005024 () Bool)

(assert (=> b!1005024 (= e!565930 e!565933)))

(declare-fun res!674301 () Bool)

(assert (=> b!1005024 (=> (not res!674301) (not e!565933))))

(assert (=> b!1005024 (= res!674301 (not e!565931))))

(declare-fun res!674299 () Bool)

(assert (=> b!1005024 (=> (not res!674299) (not e!565931))))

(assert (=> b!1005024 (= res!674299 (validKeyInArray!0 (select (arr!30533 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!119495 (not res!674300)) b!1005024))

(assert (= (and b!1005024 res!674299) b!1005022))

(assert (= (and b!1005024 res!674301) b!1005020))

(assert (= (and b!1005020 c!101510) b!1005023))

(assert (= (and b!1005020 (not c!101510)) b!1005021))

(assert (= (or b!1005023 b!1005021) bm!42329))

(declare-fun m!930419 () Bool)

(assert (=> b!1005020 m!930419))

(assert (=> b!1005020 m!930419))

(declare-fun m!930421 () Bool)

(assert (=> b!1005020 m!930421))

(assert (=> bm!42329 m!930419))

(declare-fun m!930423 () Bool)

(assert (=> bm!42329 m!930423))

(assert (=> b!1005022 m!930419))

(assert (=> b!1005022 m!930419))

(declare-fun m!930425 () Bool)

(assert (=> b!1005022 m!930425))

(assert (=> b!1005024 m!930419))

(assert (=> b!1005024 m!930419))

(assert (=> b!1005024 m!930421))

(assert (=> b!1004967 d!119495))

(declare-fun d!119497 () Bool)

(assert (=> d!119497 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1004962 d!119497))

(declare-fun d!119499 () Bool)

(assert (=> d!119499 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86668 d!119499))

(declare-fun d!119501 () Bool)

(assert (=> d!119501 (= (array_inv!23657 a!3219) (bvsge (size!31035 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86668 d!119501))

(declare-fun e!565950 () SeekEntryResult!9465)

(declare-fun lt!444414 () SeekEntryResult!9465)

(declare-fun b!1005047 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63418 (_ BitVec 32)) SeekEntryResult!9465)

(assert (=> b!1005047 (= e!565950 (seekKeyOrZeroReturnVacant!0 (x!87635 lt!444414) (index!40233 lt!444414) (index!40233 lt!444414) k0!2224 a!3219 mask!3464))))

(declare-fun b!1005048 () Bool)

(declare-fun e!565948 () SeekEntryResult!9465)

(assert (=> b!1005048 (= e!565948 Undefined!9465)))

(declare-fun d!119503 () Bool)

(declare-fun lt!444416 () SeekEntryResult!9465)

(get-info :version)

(assert (=> d!119503 (and (or ((_ is Undefined!9465) lt!444416) (not ((_ is Found!9465) lt!444416)) (and (bvsge (index!40232 lt!444416) #b00000000000000000000000000000000) (bvslt (index!40232 lt!444416) (size!31035 a!3219)))) (or ((_ is Undefined!9465) lt!444416) ((_ is Found!9465) lt!444416) (not ((_ is MissingZero!9465) lt!444416)) (and (bvsge (index!40231 lt!444416) #b00000000000000000000000000000000) (bvslt (index!40231 lt!444416) (size!31035 a!3219)))) (or ((_ is Undefined!9465) lt!444416) ((_ is Found!9465) lt!444416) ((_ is MissingZero!9465) lt!444416) (not ((_ is MissingVacant!9465) lt!444416)) (and (bvsge (index!40234 lt!444416) #b00000000000000000000000000000000) (bvslt (index!40234 lt!444416) (size!31035 a!3219)))) (or ((_ is Undefined!9465) lt!444416) (ite ((_ is Found!9465) lt!444416) (= (select (arr!30533 a!3219) (index!40232 lt!444416)) k0!2224) (ite ((_ is MissingZero!9465) lt!444416) (= (select (arr!30533 a!3219) (index!40231 lt!444416)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9465) lt!444416) (= (select (arr!30533 a!3219) (index!40234 lt!444416)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119503 (= lt!444416 e!565948)))

(declare-fun c!101519 () Bool)

(assert (=> d!119503 (= c!101519 (and ((_ is Intermediate!9465) lt!444414) (undefined!10277 lt!444414)))))

(assert (=> d!119503 (= lt!444414 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!119503 (validMask!0 mask!3464)))

(assert (=> d!119503 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!444416)))

(declare-fun b!1005049 () Bool)

(declare-fun e!565949 () SeekEntryResult!9465)

(assert (=> b!1005049 (= e!565948 e!565949)))

(declare-fun lt!444415 () (_ BitVec 64))

(assert (=> b!1005049 (= lt!444415 (select (arr!30533 a!3219) (index!40233 lt!444414)))))

(declare-fun c!101520 () Bool)

(assert (=> b!1005049 (= c!101520 (= lt!444415 k0!2224))))

(declare-fun b!1005050 () Bool)

(assert (=> b!1005050 (= e!565949 (Found!9465 (index!40233 lt!444414)))))

(declare-fun b!1005051 () Bool)

(assert (=> b!1005051 (= e!565950 (MissingZero!9465 (index!40233 lt!444414)))))

(declare-fun b!1005052 () Bool)

(declare-fun c!101521 () Bool)

(assert (=> b!1005052 (= c!101521 (= lt!444415 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1005052 (= e!565949 e!565950)))

(assert (= (and d!119503 c!101519) b!1005048))

(assert (= (and d!119503 (not c!101519)) b!1005049))

(assert (= (and b!1005049 c!101520) b!1005050))

(assert (= (and b!1005049 (not c!101520)) b!1005052))

(assert (= (and b!1005052 c!101521) b!1005051))

(assert (= (and b!1005052 (not c!101521)) b!1005047))

(declare-fun m!930427 () Bool)

(assert (=> b!1005047 m!930427))

(declare-fun m!930429 () Bool)

(assert (=> d!119503 m!930429))

(declare-fun m!930431 () Bool)

(assert (=> d!119503 m!930431))

(declare-fun m!930433 () Bool)

(assert (=> d!119503 m!930433))

(assert (=> d!119503 m!930431))

(declare-fun m!930435 () Bool)

(assert (=> d!119503 m!930435))

(assert (=> d!119503 m!930379))

(declare-fun m!930437 () Bool)

(assert (=> d!119503 m!930437))

(declare-fun m!930441 () Bool)

(assert (=> b!1005049 m!930441))

(assert (=> b!1004958 d!119503))

(declare-fun b!1005112 () Bool)

(declare-fun e!565985 () SeekEntryResult!9465)

(assert (=> b!1005112 (= e!565985 (Intermediate!9465 false (toIndex!0 lt!444388 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1005113 () Bool)

(declare-fun e!565988 () SeekEntryResult!9465)

(assert (=> b!1005113 (= e!565988 e!565985)))

(declare-fun c!101541 () Bool)

(declare-fun lt!444430 () (_ BitVec 64))

(assert (=> b!1005113 (= c!101541 (or (= lt!444430 lt!444388) (= (bvadd lt!444430 lt!444430) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1005114 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005114 (= e!565985 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!444388 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!444388 lt!444384 mask!3464))))

(declare-fun d!119507 () Bool)

(declare-fun e!565987 () Bool)

(assert (=> d!119507 e!565987))

(declare-fun c!101542 () Bool)

(declare-fun lt!444429 () SeekEntryResult!9465)

(assert (=> d!119507 (= c!101542 (and ((_ is Intermediate!9465) lt!444429) (undefined!10277 lt!444429)))))

(assert (=> d!119507 (= lt!444429 e!565988)))

(declare-fun c!101543 () Bool)

(assert (=> d!119507 (= c!101543 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119507 (= lt!444430 (select (arr!30533 lt!444384) (toIndex!0 lt!444388 mask!3464)))))

(assert (=> d!119507 (validMask!0 mask!3464)))

(assert (=> d!119507 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444388 mask!3464) lt!444388 lt!444384 mask!3464) lt!444429)))

(declare-fun b!1005115 () Bool)

(assert (=> b!1005115 (= e!565988 (Intermediate!9465 true (toIndex!0 lt!444388 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1005116 () Bool)

(assert (=> b!1005116 (and (bvsge (index!40233 lt!444429) #b00000000000000000000000000000000) (bvslt (index!40233 lt!444429) (size!31035 lt!444384)))))

(declare-fun e!565986 () Bool)

(assert (=> b!1005116 (= e!565986 (= (select (arr!30533 lt!444384) (index!40233 lt!444429)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1005117 () Bool)

(assert (=> b!1005117 (= e!565987 (bvsge (x!87635 lt!444429) #b01111111111111111111111111111110))))

(declare-fun b!1005118 () Bool)

(assert (=> b!1005118 (and (bvsge (index!40233 lt!444429) #b00000000000000000000000000000000) (bvslt (index!40233 lt!444429) (size!31035 lt!444384)))))

(declare-fun res!674329 () Bool)

(assert (=> b!1005118 (= res!674329 (= (select (arr!30533 lt!444384) (index!40233 lt!444429)) lt!444388))))

(assert (=> b!1005118 (=> res!674329 e!565986)))

(declare-fun e!565989 () Bool)

(assert (=> b!1005118 (= e!565989 e!565986)))

(declare-fun b!1005119 () Bool)

(assert (=> b!1005119 (and (bvsge (index!40233 lt!444429) #b00000000000000000000000000000000) (bvslt (index!40233 lt!444429) (size!31035 lt!444384)))))

(declare-fun res!674330 () Bool)

(assert (=> b!1005119 (= res!674330 (= (select (arr!30533 lt!444384) (index!40233 lt!444429)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1005119 (=> res!674330 e!565986)))

(declare-fun b!1005120 () Bool)

(assert (=> b!1005120 (= e!565987 e!565989)))

(declare-fun res!674331 () Bool)

(assert (=> b!1005120 (= res!674331 (and ((_ is Intermediate!9465) lt!444429) (not (undefined!10277 lt!444429)) (bvslt (x!87635 lt!444429) #b01111111111111111111111111111110) (bvsge (x!87635 lt!444429) #b00000000000000000000000000000000) (bvsge (x!87635 lt!444429) #b00000000000000000000000000000000)))))

(assert (=> b!1005120 (=> (not res!674331) (not e!565989))))

(assert (= (and d!119507 c!101543) b!1005115))

(assert (= (and d!119507 (not c!101543)) b!1005113))

(assert (= (and b!1005113 c!101541) b!1005112))

(assert (= (and b!1005113 (not c!101541)) b!1005114))

(assert (= (and d!119507 c!101542) b!1005117))

(assert (= (and d!119507 (not c!101542)) b!1005120))

(assert (= (and b!1005120 res!674331) b!1005118))

(assert (= (and b!1005118 (not res!674329)) b!1005119))

(assert (= (and b!1005119 (not res!674330)) b!1005116))

(declare-fun m!930449 () Bool)

(assert (=> b!1005118 m!930449))

(assert (=> b!1005116 m!930449))

(assert (=> b!1005114 m!930365))

(declare-fun m!930451 () Bool)

(assert (=> b!1005114 m!930451))

(assert (=> b!1005114 m!930451))

(declare-fun m!930453 () Bool)

(assert (=> b!1005114 m!930453))

(assert (=> d!119507 m!930365))

(declare-fun m!930455 () Bool)

(assert (=> d!119507 m!930455))

(assert (=> d!119507 m!930379))

(assert (=> b!1005119 m!930449))

(assert (=> b!1004969 d!119507))

(declare-fun d!119515 () Bool)

(declare-fun lt!444442 () (_ BitVec 32))

(declare-fun lt!444441 () (_ BitVec 32))

(assert (=> d!119515 (= lt!444442 (bvmul (bvxor lt!444441 (bvlshr lt!444441 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119515 (= lt!444441 ((_ extract 31 0) (bvand (bvxor lt!444388 (bvlshr lt!444388 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119515 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!674335 (let ((h!22387 ((_ extract 31 0) (bvand (bvxor lt!444388 (bvlshr lt!444388 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87640 (bvmul (bvxor h!22387 (bvlshr h!22387 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87640 (bvlshr x!87640 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!674335 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!674335 #b00000000000000000000000000000000))))))

(assert (=> d!119515 (= (toIndex!0 lt!444388 mask!3464) (bvand (bvxor lt!444442 (bvlshr lt!444442 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1004969 d!119515))

(declare-fun b!1005148 () Bool)

(declare-fun e!566005 () SeekEntryResult!9465)

(assert (=> b!1005148 (= e!566005 (Intermediate!9465 false index!1507 x!1245))))

(declare-fun b!1005149 () Bool)

(declare-fun e!566008 () SeekEntryResult!9465)

(assert (=> b!1005149 (= e!566008 e!566005)))

(declare-fun c!101553 () Bool)

(declare-fun lt!444444 () (_ BitVec 64))

(assert (=> b!1005149 (= c!101553 (or (= lt!444444 lt!444388) (= (bvadd lt!444444 lt!444444) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1005150 () Bool)

(assert (=> b!1005150 (= e!566005 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!444388 lt!444384 mask!3464))))

(declare-fun d!119523 () Bool)

(declare-fun e!566007 () Bool)

(assert (=> d!119523 e!566007))

(declare-fun c!101554 () Bool)

(declare-fun lt!444443 () SeekEntryResult!9465)

(assert (=> d!119523 (= c!101554 (and ((_ is Intermediate!9465) lt!444443) (undefined!10277 lt!444443)))))

(assert (=> d!119523 (= lt!444443 e!566008)))

(declare-fun c!101555 () Bool)

(assert (=> d!119523 (= c!101555 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119523 (= lt!444444 (select (arr!30533 lt!444384) index!1507))))

(assert (=> d!119523 (validMask!0 mask!3464)))

(assert (=> d!119523 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444388 lt!444384 mask!3464) lt!444443)))

(declare-fun b!1005151 () Bool)

(assert (=> b!1005151 (= e!566008 (Intermediate!9465 true index!1507 x!1245))))

(declare-fun b!1005152 () Bool)

(assert (=> b!1005152 (and (bvsge (index!40233 lt!444443) #b00000000000000000000000000000000) (bvslt (index!40233 lt!444443) (size!31035 lt!444384)))))

(declare-fun e!566006 () Bool)

(assert (=> b!1005152 (= e!566006 (= (select (arr!30533 lt!444384) (index!40233 lt!444443)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1005153 () Bool)

(assert (=> b!1005153 (= e!566007 (bvsge (x!87635 lt!444443) #b01111111111111111111111111111110))))

(declare-fun b!1005154 () Bool)

(assert (=> b!1005154 (and (bvsge (index!40233 lt!444443) #b00000000000000000000000000000000) (bvslt (index!40233 lt!444443) (size!31035 lt!444384)))))

(declare-fun res!674343 () Bool)

(assert (=> b!1005154 (= res!674343 (= (select (arr!30533 lt!444384) (index!40233 lt!444443)) lt!444388))))

(assert (=> b!1005154 (=> res!674343 e!566006)))

(declare-fun e!566009 () Bool)

(assert (=> b!1005154 (= e!566009 e!566006)))

(declare-fun b!1005155 () Bool)

(assert (=> b!1005155 (and (bvsge (index!40233 lt!444443) #b00000000000000000000000000000000) (bvslt (index!40233 lt!444443) (size!31035 lt!444384)))))

(declare-fun res!674344 () Bool)

(assert (=> b!1005155 (= res!674344 (= (select (arr!30533 lt!444384) (index!40233 lt!444443)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1005155 (=> res!674344 e!566006)))

(declare-fun b!1005156 () Bool)

(assert (=> b!1005156 (= e!566007 e!566009)))

(declare-fun res!674345 () Bool)

(assert (=> b!1005156 (= res!674345 (and ((_ is Intermediate!9465) lt!444443) (not (undefined!10277 lt!444443)) (bvslt (x!87635 lt!444443) #b01111111111111111111111111111110) (bvsge (x!87635 lt!444443) #b00000000000000000000000000000000) (bvsge (x!87635 lt!444443) x!1245)))))

(assert (=> b!1005156 (=> (not res!674345) (not e!566009))))

(assert (= (and d!119523 c!101555) b!1005151))

(assert (= (and d!119523 (not c!101555)) b!1005149))

(assert (= (and b!1005149 c!101553) b!1005148))

(assert (= (and b!1005149 (not c!101553)) b!1005150))

(assert (= (and d!119523 c!101554) b!1005153))

(assert (= (and d!119523 (not c!101554)) b!1005156))

(assert (= (and b!1005156 res!674345) b!1005154))

(assert (= (and b!1005154 (not res!674343)) b!1005155))

(assert (= (and b!1005155 (not res!674344)) b!1005152))

(declare-fun m!930481 () Bool)

(assert (=> b!1005154 m!930481))

(assert (=> b!1005152 m!930481))

(declare-fun m!930483 () Bool)

(assert (=> b!1005150 m!930483))

(assert (=> b!1005150 m!930483))

(declare-fun m!930485 () Bool)

(assert (=> b!1005150 m!930485))

(declare-fun m!930487 () Bool)

(assert (=> d!119523 m!930487))

(assert (=> d!119523 m!930379))

(assert (=> b!1005155 m!930481))

(assert (=> b!1004964 d!119523))

(declare-fun b!1005157 () Bool)

(declare-fun e!566010 () SeekEntryResult!9465)

(assert (=> b!1005157 (= e!566010 (Intermediate!9465 false index!1507 x!1245))))

(declare-fun b!1005158 () Bool)

(declare-fun e!566013 () SeekEntryResult!9465)

(assert (=> b!1005158 (= e!566013 e!566010)))

(declare-fun c!101556 () Bool)

(declare-fun lt!444448 () (_ BitVec 64))

(assert (=> b!1005158 (= c!101556 (or (= lt!444448 (select (arr!30533 a!3219) j!170)) (= (bvadd lt!444448 lt!444448) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1005159 () Bool)

(assert (=> b!1005159 (= e!566010 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30533 a!3219) j!170) a!3219 mask!3464))))

(declare-fun d!119525 () Bool)

(declare-fun e!566012 () Bool)

(assert (=> d!119525 e!566012))

(declare-fun c!101557 () Bool)

(declare-fun lt!444447 () SeekEntryResult!9465)

(assert (=> d!119525 (= c!101557 (and ((_ is Intermediate!9465) lt!444447) (undefined!10277 lt!444447)))))

(assert (=> d!119525 (= lt!444447 e!566013)))

(declare-fun c!101558 () Bool)

(assert (=> d!119525 (= c!101558 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119525 (= lt!444448 (select (arr!30533 a!3219) index!1507))))

(assert (=> d!119525 (validMask!0 mask!3464)))

(assert (=> d!119525 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30533 a!3219) j!170) a!3219 mask!3464) lt!444447)))

(declare-fun b!1005160 () Bool)

(assert (=> b!1005160 (= e!566013 (Intermediate!9465 true index!1507 x!1245))))

(declare-fun b!1005161 () Bool)

(assert (=> b!1005161 (and (bvsge (index!40233 lt!444447) #b00000000000000000000000000000000) (bvslt (index!40233 lt!444447) (size!31035 a!3219)))))

(declare-fun e!566011 () Bool)

(assert (=> b!1005161 (= e!566011 (= (select (arr!30533 a!3219) (index!40233 lt!444447)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1005162 () Bool)

(assert (=> b!1005162 (= e!566012 (bvsge (x!87635 lt!444447) #b01111111111111111111111111111110))))

(declare-fun b!1005163 () Bool)

(assert (=> b!1005163 (and (bvsge (index!40233 lt!444447) #b00000000000000000000000000000000) (bvslt (index!40233 lt!444447) (size!31035 a!3219)))))

(declare-fun res!674346 () Bool)

(assert (=> b!1005163 (= res!674346 (= (select (arr!30533 a!3219) (index!40233 lt!444447)) (select (arr!30533 a!3219) j!170)))))

(assert (=> b!1005163 (=> res!674346 e!566011)))

(declare-fun e!566014 () Bool)

(assert (=> b!1005163 (= e!566014 e!566011)))

(declare-fun b!1005164 () Bool)

(assert (=> b!1005164 (and (bvsge (index!40233 lt!444447) #b00000000000000000000000000000000) (bvslt (index!40233 lt!444447) (size!31035 a!3219)))))

(declare-fun res!674347 () Bool)

(assert (=> b!1005164 (= res!674347 (= (select (arr!30533 a!3219) (index!40233 lt!444447)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1005164 (=> res!674347 e!566011)))

(declare-fun b!1005165 () Bool)

(assert (=> b!1005165 (= e!566012 e!566014)))

(declare-fun res!674348 () Bool)

(assert (=> b!1005165 (= res!674348 (and ((_ is Intermediate!9465) lt!444447) (not (undefined!10277 lt!444447)) (bvslt (x!87635 lt!444447) #b01111111111111111111111111111110) (bvsge (x!87635 lt!444447) #b00000000000000000000000000000000) (bvsge (x!87635 lt!444447) x!1245)))))

(assert (=> b!1005165 (=> (not res!674348) (not e!566014))))

(assert (= (and d!119525 c!101558) b!1005160))

(assert (= (and d!119525 (not c!101558)) b!1005158))

(assert (= (and b!1005158 c!101556) b!1005157))

(assert (= (and b!1005158 (not c!101556)) b!1005159))

(assert (= (and d!119525 c!101557) b!1005162))

(assert (= (and d!119525 (not c!101557)) b!1005165))

(assert (= (and b!1005165 res!674348) b!1005163))

(assert (= (and b!1005163 (not res!674346)) b!1005164))

(assert (= (and b!1005164 (not res!674347)) b!1005161))

(declare-fun m!930489 () Bool)

(assert (=> b!1005163 m!930489))

(assert (=> b!1005161 m!930489))

(assert (=> b!1005159 m!930483))

(assert (=> b!1005159 m!930483))

(assert (=> b!1005159 m!930353))

(declare-fun m!930491 () Bool)

(assert (=> b!1005159 m!930491))

(declare-fun m!930493 () Bool)

(assert (=> d!119525 m!930493))

(assert (=> d!119525 m!930379))

(assert (=> b!1005164 m!930489))

(assert (=> b!1004970 d!119525))

(declare-fun b!1005183 () Bool)

(declare-fun e!566028 () Bool)

(declare-fun e!566026 () Bool)

(assert (=> b!1005183 (= e!566028 e!566026)))

(declare-fun lt!444463 () (_ BitVec 64))

(assert (=> b!1005183 (= lt!444463 (select (arr!30533 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33004 0))(
  ( (Unit!33005) )
))
(declare-fun lt!444461 () Unit!33004)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63418 (_ BitVec 64) (_ BitVec 32)) Unit!33004)

(assert (=> b!1005183 (= lt!444461 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!444463 #b00000000000000000000000000000000))))

(assert (=> b!1005183 (arrayContainsKey!0 a!3219 lt!444463 #b00000000000000000000000000000000)))

(declare-fun lt!444462 () Unit!33004)

(assert (=> b!1005183 (= lt!444462 lt!444461)))

(declare-fun res!674357 () Bool)

(assert (=> b!1005183 (= res!674357 (= (seekEntryOrOpen!0 (select (arr!30533 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9465 #b00000000000000000000000000000000)))))

(assert (=> b!1005183 (=> (not res!674357) (not e!566026))))

(declare-fun b!1005184 () Bool)

(declare-fun call!42338 () Bool)

(assert (=> b!1005184 (= e!566026 call!42338)))

(declare-fun b!1005185 () Bool)

(declare-fun e!566027 () Bool)

(assert (=> b!1005185 (= e!566027 e!566028)))

(declare-fun c!101564 () Bool)

(assert (=> b!1005185 (= c!101564 (validKeyInArray!0 (select (arr!30533 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1005186 () Bool)

(assert (=> b!1005186 (= e!566028 call!42338)))

(declare-fun d!119527 () Bool)

(declare-fun res!674356 () Bool)

(assert (=> d!119527 (=> res!674356 e!566027)))

(assert (=> d!119527 (= res!674356 (bvsge #b00000000000000000000000000000000 (size!31035 a!3219)))))

(assert (=> d!119527 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!566027)))

(declare-fun bm!42335 () Bool)

(assert (=> bm!42335 (= call!42338 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(assert (= (and d!119527 (not res!674356)) b!1005185))

(assert (= (and b!1005185 c!101564) b!1005183))

(assert (= (and b!1005185 (not c!101564)) b!1005186))

(assert (= (and b!1005183 res!674357) b!1005184))

(assert (= (or b!1005184 b!1005186) bm!42335))

(assert (=> b!1005183 m!930419))

(declare-fun m!930501 () Bool)

(assert (=> b!1005183 m!930501))

(declare-fun m!930503 () Bool)

(assert (=> b!1005183 m!930503))

(assert (=> b!1005183 m!930419))

(declare-fun m!930505 () Bool)

(assert (=> b!1005183 m!930505))

(assert (=> b!1005185 m!930419))

(assert (=> b!1005185 m!930419))

(assert (=> b!1005185 m!930421))

(declare-fun m!930507 () Bool)

(assert (=> bm!42335 m!930507))

(assert (=> b!1004965 d!119527))

(declare-fun d!119537 () Bool)

(declare-fun res!674362 () Bool)

(declare-fun e!566033 () Bool)

(assert (=> d!119537 (=> res!674362 e!566033)))

(assert (=> d!119537 (= res!674362 (= (select (arr!30533 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!119537 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!566033)))

(declare-fun b!1005191 () Bool)

(declare-fun e!566034 () Bool)

(assert (=> b!1005191 (= e!566033 e!566034)))

(declare-fun res!674363 () Bool)

(assert (=> b!1005191 (=> (not res!674363) (not e!566034))))

(assert (=> b!1005191 (= res!674363 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31035 a!3219)))))

(declare-fun b!1005192 () Bool)

(assert (=> b!1005192 (= e!566034 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119537 (not res!674362)) b!1005191))

(assert (= (and b!1005191 res!674363) b!1005192))

(assert (=> d!119537 m!930419))

(declare-fun m!930509 () Bool)

(assert (=> b!1005192 m!930509))

(assert (=> b!1004960 d!119537))

(declare-fun e!566035 () SeekEntryResult!9465)

(declare-fun b!1005193 () Bool)

(assert (=> b!1005193 (= e!566035 (Intermediate!9465 false (toIndex!0 (select (arr!30533 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1005194 () Bool)

(declare-fun e!566038 () SeekEntryResult!9465)

(assert (=> b!1005194 (= e!566038 e!566035)))

(declare-fun c!101565 () Bool)

(declare-fun lt!444465 () (_ BitVec 64))

(assert (=> b!1005194 (= c!101565 (or (= lt!444465 (select (arr!30533 a!3219) j!170)) (= (bvadd lt!444465 lt!444465) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1005195 () Bool)

(assert (=> b!1005195 (= e!566035 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30533 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30533 a!3219) j!170) a!3219 mask!3464))))

(declare-fun d!119539 () Bool)

(declare-fun e!566037 () Bool)

(assert (=> d!119539 e!566037))

(declare-fun c!101566 () Bool)

(declare-fun lt!444464 () SeekEntryResult!9465)

(assert (=> d!119539 (= c!101566 (and ((_ is Intermediate!9465) lt!444464) (undefined!10277 lt!444464)))))

(assert (=> d!119539 (= lt!444464 e!566038)))

(declare-fun c!101567 () Bool)

(assert (=> d!119539 (= c!101567 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119539 (= lt!444465 (select (arr!30533 a!3219) (toIndex!0 (select (arr!30533 a!3219) j!170) mask!3464)))))

(assert (=> d!119539 (validMask!0 mask!3464)))

(assert (=> d!119539 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30533 a!3219) j!170) mask!3464) (select (arr!30533 a!3219) j!170) a!3219 mask!3464) lt!444464)))

(declare-fun b!1005196 () Bool)

(assert (=> b!1005196 (= e!566038 (Intermediate!9465 true (toIndex!0 (select (arr!30533 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1005197 () Bool)

(assert (=> b!1005197 (and (bvsge (index!40233 lt!444464) #b00000000000000000000000000000000) (bvslt (index!40233 lt!444464) (size!31035 a!3219)))))

(declare-fun e!566036 () Bool)

(assert (=> b!1005197 (= e!566036 (= (select (arr!30533 a!3219) (index!40233 lt!444464)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1005198 () Bool)

(assert (=> b!1005198 (= e!566037 (bvsge (x!87635 lt!444464) #b01111111111111111111111111111110))))

(declare-fun b!1005199 () Bool)

(assert (=> b!1005199 (and (bvsge (index!40233 lt!444464) #b00000000000000000000000000000000) (bvslt (index!40233 lt!444464) (size!31035 a!3219)))))

(declare-fun res!674364 () Bool)

(assert (=> b!1005199 (= res!674364 (= (select (arr!30533 a!3219) (index!40233 lt!444464)) (select (arr!30533 a!3219) j!170)))))

(assert (=> b!1005199 (=> res!674364 e!566036)))

(declare-fun e!566039 () Bool)

(assert (=> b!1005199 (= e!566039 e!566036)))

(declare-fun b!1005200 () Bool)

(assert (=> b!1005200 (and (bvsge (index!40233 lt!444464) #b00000000000000000000000000000000) (bvslt (index!40233 lt!444464) (size!31035 a!3219)))))

(declare-fun res!674365 () Bool)

(assert (=> b!1005200 (= res!674365 (= (select (arr!30533 a!3219) (index!40233 lt!444464)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1005200 (=> res!674365 e!566036)))

(declare-fun b!1005201 () Bool)

(assert (=> b!1005201 (= e!566037 e!566039)))

(declare-fun res!674366 () Bool)

(assert (=> b!1005201 (= res!674366 (and ((_ is Intermediate!9465) lt!444464) (not (undefined!10277 lt!444464)) (bvslt (x!87635 lt!444464) #b01111111111111111111111111111110) (bvsge (x!87635 lt!444464) #b00000000000000000000000000000000) (bvsge (x!87635 lt!444464) #b00000000000000000000000000000000)))))

(assert (=> b!1005201 (=> (not res!674366) (not e!566039))))

(assert (= (and d!119539 c!101567) b!1005196))

(assert (= (and d!119539 (not c!101567)) b!1005194))

(assert (= (and b!1005194 c!101565) b!1005193))

(assert (= (and b!1005194 (not c!101565)) b!1005195))

(assert (= (and d!119539 c!101566) b!1005198))

(assert (= (and d!119539 (not c!101566)) b!1005201))

(assert (= (and b!1005201 res!674366) b!1005199))

(assert (= (and b!1005199 (not res!674364)) b!1005200))

(assert (= (and b!1005200 (not res!674365)) b!1005197))

(declare-fun m!930511 () Bool)

(assert (=> b!1005199 m!930511))

(assert (=> b!1005197 m!930511))

(assert (=> b!1005195 m!930355))

(declare-fun m!930513 () Bool)

(assert (=> b!1005195 m!930513))

(assert (=> b!1005195 m!930513))

(assert (=> b!1005195 m!930353))

(declare-fun m!930515 () Bool)

(assert (=> b!1005195 m!930515))

(assert (=> d!119539 m!930355))

(declare-fun m!930517 () Bool)

(assert (=> d!119539 m!930517))

(assert (=> d!119539 m!930379))

(assert (=> b!1005200 m!930511))

(assert (=> b!1004966 d!119539))

(declare-fun d!119541 () Bool)

(declare-fun lt!444467 () (_ BitVec 32))

(declare-fun lt!444466 () (_ BitVec 32))

(assert (=> d!119541 (= lt!444467 (bvmul (bvxor lt!444466 (bvlshr lt!444466 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119541 (= lt!444466 ((_ extract 31 0) (bvand (bvxor (select (arr!30533 a!3219) j!170) (bvlshr (select (arr!30533 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119541 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!674335 (let ((h!22387 ((_ extract 31 0) (bvand (bvxor (select (arr!30533 a!3219) j!170) (bvlshr (select (arr!30533 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87640 (bvmul (bvxor h!22387 (bvlshr h!22387 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87640 (bvlshr x!87640 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!674335 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!674335 #b00000000000000000000000000000000))))))

(assert (=> d!119541 (= (toIndex!0 (select (arr!30533 a!3219) j!170) mask!3464) (bvand (bvxor lt!444467 (bvlshr lt!444467 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1004966 d!119541))

(check-sat (not d!119539) (not b!1005114) (not b!1005047) (not bm!42329) (not b!1005150) (not bm!42335) (not b!1005183) (not d!119507) (not d!119523) (not d!119525) (not b!1005195) (not b!1005159) (not b!1005020) (not d!119503) (not b!1005024) (not b!1005192) (not b!1005185) (not b!1005022))
(check-sat)
