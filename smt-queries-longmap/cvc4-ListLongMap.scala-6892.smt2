; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86610 () Bool)

(assert start!86610)

(declare-fun b!1004565 () Bool)

(declare-fun res!674047 () Bool)

(declare-fun e!565666 () Bool)

(assert (=> b!1004565 (=> (not res!674047) (not e!565666))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1004565 (= res!674047 (validKeyInArray!0 k!2224))))

(declare-fun b!1004566 () Bool)

(declare-fun e!565664 () Bool)

(declare-fun e!565667 () Bool)

(assert (=> b!1004566 (= e!565664 e!565667)))

(declare-fun res!674043 () Bool)

(assert (=> b!1004566 (=> (not res!674043) (not e!565667))))

(declare-datatypes ((SeekEntryResult!9463 0))(
  ( (MissingZero!9463 (index!40223 (_ BitVec 32))) (Found!9463 (index!40224 (_ BitVec 32))) (Intermediate!9463 (undefined!10275 Bool) (index!40225 (_ BitVec 32)) (x!87619 (_ BitVec 32))) (Undefined!9463) (MissingVacant!9463 (index!40226 (_ BitVec 32))) )
))
(declare-fun lt!444239 () SeekEntryResult!9463)

(declare-fun lt!444234 () SeekEntryResult!9463)

(assert (=> b!1004566 (= res!674043 (= lt!444239 lt!444234))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1004566 (= lt!444234 (Intermediate!9463 false resIndex!38 resX!38))))

(declare-datatypes ((array!63411 0))(
  ( (array!63412 (arr!30531 (Array (_ BitVec 32) (_ BitVec 64))) (size!31033 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63411)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63411 (_ BitVec 32)) SeekEntryResult!9463)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004566 (= lt!444239 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30531 a!3219) j!170) mask!3464) (select (arr!30531 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004567 () Bool)

(assert (=> b!1004567 (= e!565666 e!565664)))

(declare-fun res!674054 () Bool)

(assert (=> b!1004567 (=> (not res!674054) (not e!565664))))

(declare-fun lt!444237 () SeekEntryResult!9463)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1004567 (= res!674054 (or (= lt!444237 (MissingVacant!9463 i!1194)) (= lt!444237 (MissingZero!9463 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63411 (_ BitVec 32)) SeekEntryResult!9463)

(assert (=> b!1004567 (= lt!444237 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun res!674046 () Bool)

(assert (=> start!86610 (=> (not res!674046) (not e!565666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86610 (= res!674046 (validMask!0 mask!3464))))

(assert (=> start!86610 e!565666))

(declare-fun array_inv!23655 (array!63411) Bool)

(assert (=> start!86610 (array_inv!23655 a!3219)))

(assert (=> start!86610 true))

(declare-fun b!1004568 () Bool)

(declare-fun res!674055 () Bool)

(declare-fun e!565668 () Bool)

(assert (=> b!1004568 (=> (not res!674055) (not e!565668))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!444236 () array!63411)

(declare-fun lt!444238 () (_ BitVec 64))

(declare-fun lt!444235 () SeekEntryResult!9463)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1004568 (= res!674055 (not (= lt!444235 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444238 lt!444236 mask!3464))))))

(declare-fun b!1004569 () Bool)

(declare-fun e!565669 () Bool)

(assert (=> b!1004569 (= e!565667 e!565669)))

(declare-fun res!674052 () Bool)

(assert (=> b!1004569 (=> (not res!674052) (not e!565669))))

(assert (=> b!1004569 (= res!674052 (= lt!444235 lt!444234))))

(assert (=> b!1004569 (= lt!444235 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30531 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004570 () Bool)

(assert (=> b!1004570 (= e!565669 e!565668)))

(declare-fun res!674049 () Bool)

(assert (=> b!1004570 (=> (not res!674049) (not e!565668))))

(assert (=> b!1004570 (= res!674049 (not (= lt!444239 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444238 mask!3464) lt!444238 lt!444236 mask!3464))))))

(assert (=> b!1004570 (= lt!444238 (select (store (arr!30531 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1004570 (= lt!444236 (array!63412 (store (arr!30531 a!3219) i!1194 k!2224) (size!31033 a!3219)))))

(declare-fun b!1004571 () Bool)

(declare-fun res!674048 () Bool)

(assert (=> b!1004571 (=> (not res!674048) (not e!565664))))

(assert (=> b!1004571 (= res!674048 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31033 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31033 a!3219))))))

(declare-fun b!1004572 () Bool)

(declare-fun res!674053 () Bool)

(assert (=> b!1004572 (=> (not res!674053) (not e!565664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63411 (_ BitVec 32)) Bool)

(assert (=> b!1004572 (= res!674053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1004573 () Bool)

(declare-fun res!674044 () Bool)

(assert (=> b!1004573 (=> (not res!674044) (not e!565664))))

(declare-datatypes ((List!21207 0))(
  ( (Nil!21204) (Cons!21203 (h!22380 (_ BitVec 64)) (t!30208 List!21207)) )
))
(declare-fun arrayNoDuplicates!0 (array!63411 (_ BitVec 32) List!21207) Bool)

(assert (=> b!1004573 (= res!674044 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21204))))

(declare-fun b!1004574 () Bool)

(declare-fun res!674051 () Bool)

(assert (=> b!1004574 (=> (not res!674051) (not e!565666))))

(declare-fun arrayContainsKey!0 (array!63411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1004574 (= res!674051 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1004575 () Bool)

(declare-fun res!674045 () Bool)

(assert (=> b!1004575 (=> (not res!674045) (not e!565666))))

(assert (=> b!1004575 (= res!674045 (and (= (size!31033 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31033 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31033 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1004576 () Bool)

(assert (=> b!1004576 (= e!565668 (and (= index!1507 resIndex!38) (not (= x!1245 resX!38))))))

(declare-fun b!1004577 () Bool)

(declare-fun res!674050 () Bool)

(assert (=> b!1004577 (=> (not res!674050) (not e!565666))))

(assert (=> b!1004577 (= res!674050 (validKeyInArray!0 (select (arr!30531 a!3219) j!170)))))

(assert (= (and start!86610 res!674046) b!1004575))

(assert (= (and b!1004575 res!674045) b!1004577))

(assert (= (and b!1004577 res!674050) b!1004565))

(assert (= (and b!1004565 res!674047) b!1004574))

(assert (= (and b!1004574 res!674051) b!1004567))

(assert (= (and b!1004567 res!674054) b!1004572))

(assert (= (and b!1004572 res!674053) b!1004573))

(assert (= (and b!1004573 res!674044) b!1004571))

(assert (= (and b!1004571 res!674048) b!1004566))

(assert (= (and b!1004566 res!674043) b!1004569))

(assert (= (and b!1004569 res!674052) b!1004570))

(assert (= (and b!1004570 res!674049) b!1004568))

(assert (= (and b!1004568 res!674055) b!1004576))

(declare-fun m!930097 () Bool)

(assert (=> b!1004577 m!930097))

(assert (=> b!1004577 m!930097))

(declare-fun m!930099 () Bool)

(assert (=> b!1004577 m!930099))

(declare-fun m!930101 () Bool)

(assert (=> b!1004573 m!930101))

(declare-fun m!930103 () Bool)

(assert (=> start!86610 m!930103))

(declare-fun m!930105 () Bool)

(assert (=> start!86610 m!930105))

(declare-fun m!930107 () Bool)

(assert (=> b!1004574 m!930107))

(declare-fun m!930109 () Bool)

(assert (=> b!1004567 m!930109))

(declare-fun m!930111 () Bool)

(assert (=> b!1004570 m!930111))

(assert (=> b!1004570 m!930111))

(declare-fun m!930113 () Bool)

(assert (=> b!1004570 m!930113))

(declare-fun m!930115 () Bool)

(assert (=> b!1004570 m!930115))

(declare-fun m!930117 () Bool)

(assert (=> b!1004570 m!930117))

(declare-fun m!930119 () Bool)

(assert (=> b!1004572 m!930119))

(declare-fun m!930121 () Bool)

(assert (=> b!1004565 m!930121))

(assert (=> b!1004566 m!930097))

(assert (=> b!1004566 m!930097))

(declare-fun m!930123 () Bool)

(assert (=> b!1004566 m!930123))

(assert (=> b!1004566 m!930123))

(assert (=> b!1004566 m!930097))

(declare-fun m!930125 () Bool)

(assert (=> b!1004566 m!930125))

(declare-fun m!930127 () Bool)

(assert (=> b!1004568 m!930127))

(assert (=> b!1004569 m!930097))

(assert (=> b!1004569 m!930097))

(declare-fun m!930129 () Bool)

(assert (=> b!1004569 m!930129))

(push 1)

(assert (not b!1004573))

(assert (not b!1004574))

(assert (not b!1004568))

(assert (not b!1004566))

(assert (not start!86610))

(assert (not b!1004569))

(assert (not b!1004567))

(assert (not b!1004570))

(assert (not b!1004565))

(assert (not b!1004577))

(assert (not b!1004572))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!119413 () Bool)

(assert (=> d!119413 (= (validKeyInArray!0 (select (arr!30531 a!3219) j!170)) (and (not (= (select (arr!30531 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30531 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1004577 d!119413))

(declare-fun e!565727 () SeekEntryResult!9463)

(declare-fun b!1004675 () Bool)

(assert (=> b!1004675 (= e!565727 (Intermediate!9463 true (toIndex!0 (select (arr!30531 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1004676 () Bool)

(declare-fun e!565729 () Bool)

(declare-fun e!565726 () Bool)

(assert (=> b!1004676 (= e!565729 e!565726)))

(declare-fun res!674085 () Bool)

(declare-fun lt!444276 () SeekEntryResult!9463)

(assert (=> b!1004676 (= res!674085 (and (is-Intermediate!9463 lt!444276) (not (undefined!10275 lt!444276)) (bvslt (x!87619 lt!444276) #b01111111111111111111111111111110) (bvsge (x!87619 lt!444276) #b00000000000000000000000000000000) (bvsge (x!87619 lt!444276) #b00000000000000000000000000000000)))))

(assert (=> b!1004676 (=> (not res!674085) (not e!565726))))

(declare-fun b!1004677 () Bool)

(declare-fun e!565725 () SeekEntryResult!9463)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004677 (= e!565725 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30531 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30531 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004678 () Bool)

(assert (=> b!1004678 (and (bvsge (index!40225 lt!444276) #b00000000000000000000000000000000) (bvslt (index!40225 lt!444276) (size!31033 a!3219)))))

(declare-fun res!674084 () Bool)

(assert (=> b!1004678 (= res!674084 (= (select (arr!30531 a!3219) (index!40225 lt!444276)) (select (arr!30531 a!3219) j!170)))))

(declare-fun e!565728 () Bool)

(assert (=> b!1004678 (=> res!674084 e!565728)))

(assert (=> b!1004678 (= e!565726 e!565728)))

(declare-fun d!119417 () Bool)

(assert (=> d!119417 e!565729))

(declare-fun c!101445 () Bool)

(assert (=> d!119417 (= c!101445 (and (is-Intermediate!9463 lt!444276) (undefined!10275 lt!444276)))))

(assert (=> d!119417 (= lt!444276 e!565727)))

(declare-fun c!101444 () Bool)

(assert (=> d!119417 (= c!101444 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!444279 () (_ BitVec 64))

(assert (=> d!119417 (= lt!444279 (select (arr!30531 a!3219) (toIndex!0 (select (arr!30531 a!3219) j!170) mask!3464)))))

(assert (=> d!119417 (validMask!0 mask!3464)))

(assert (=> d!119417 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30531 a!3219) j!170) mask!3464) (select (arr!30531 a!3219) j!170) a!3219 mask!3464) lt!444276)))

(declare-fun b!1004679 () Bool)

(assert (=> b!1004679 (= e!565727 e!565725)))

(declare-fun c!101446 () Bool)

(assert (=> b!1004679 (= c!101446 (or (= lt!444279 (select (arr!30531 a!3219) j!170)) (= (bvadd lt!444279 lt!444279) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1004680 () Bool)

(assert (=> b!1004680 (and (bvsge (index!40225 lt!444276) #b00000000000000000000000000000000) (bvslt (index!40225 lt!444276) (size!31033 a!3219)))))

(declare-fun res!674083 () Bool)

(assert (=> b!1004680 (= res!674083 (= (select (arr!30531 a!3219) (index!40225 lt!444276)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1004680 (=> res!674083 e!565728)))

(declare-fun b!1004681 () Bool)

(assert (=> b!1004681 (and (bvsge (index!40225 lt!444276) #b00000000000000000000000000000000) (bvslt (index!40225 lt!444276) (size!31033 a!3219)))))

(assert (=> b!1004681 (= e!565728 (= (select (arr!30531 a!3219) (index!40225 lt!444276)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1004682 () Bool)

(assert (=> b!1004682 (= e!565729 (bvsge (x!87619 lt!444276) #b01111111111111111111111111111110))))

(declare-fun b!1004683 () Bool)

(assert (=> b!1004683 (= e!565725 (Intermediate!9463 false (toIndex!0 (select (arr!30531 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(assert (= (and d!119417 c!101444) b!1004675))

(assert (= (and d!119417 (not c!101444)) b!1004679))

(assert (= (and b!1004679 c!101446) b!1004683))

(assert (= (and b!1004679 (not c!101446)) b!1004677))

(assert (= (and d!119417 c!101445) b!1004682))

(assert (= (and d!119417 (not c!101445)) b!1004676))

(assert (= (and b!1004676 res!674085) b!1004678))

(assert (= (and b!1004678 (not res!674084)) b!1004680))

(assert (= (and b!1004680 (not res!674083)) b!1004681))

(assert (=> d!119417 m!930123))

(declare-fun m!930179 () Bool)

(assert (=> d!119417 m!930179))

(assert (=> d!119417 m!930103))

(declare-fun m!930181 () Bool)

(assert (=> b!1004678 m!930181))

(assert (=> b!1004681 m!930181))

(assert (=> b!1004677 m!930123))

(declare-fun m!930183 () Bool)

(assert (=> b!1004677 m!930183))

(assert (=> b!1004677 m!930183))

(assert (=> b!1004677 m!930097))

(declare-fun m!930185 () Bool)

(assert (=> b!1004677 m!930185))

(assert (=> b!1004680 m!930181))

(assert (=> b!1004566 d!119417))

(declare-fun d!119429 () Bool)

(declare-fun lt!444294 () (_ BitVec 32))

(declare-fun lt!444293 () (_ BitVec 32))

(assert (=> d!119429 (= lt!444294 (bvmul (bvxor lt!444293 (bvlshr lt!444293 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119429 (= lt!444293 ((_ extract 31 0) (bvand (bvxor (select (arr!30531 a!3219) j!170) (bvlshr (select (arr!30531 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119429 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!674087 (let ((h!22382 ((_ extract 31 0) (bvand (bvxor (select (arr!30531 a!3219) j!170) (bvlshr (select (arr!30531 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87623 (bvmul (bvxor h!22382 (bvlshr h!22382 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87623 (bvlshr x!87623 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!674087 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!674087 #b00000000000000000000000000000000))))))

(assert (=> d!119429 (= (toIndex!0 (select (arr!30531 a!3219) j!170) mask!3464) (bvand (bvxor lt!444294 (bvlshr lt!444294 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1004566 d!119429))

(declare-fun b!1004761 () Bool)

(declare-fun e!565784 () SeekEntryResult!9463)

(declare-fun e!565785 () SeekEntryResult!9463)

(assert (=> b!1004761 (= e!565784 e!565785)))

(declare-fun lt!444303 () (_ BitVec 64))

(declare-fun lt!444304 () SeekEntryResult!9463)

(assert (=> b!1004761 (= lt!444303 (select (arr!30531 a!3219) (index!40225 lt!444304)))))

(declare-fun c!101470 () Bool)

(assert (=> b!1004761 (= c!101470 (= lt!444303 k!2224))))

(declare-fun b!1004762 () Bool)

(declare-fun c!101471 () Bool)

(assert (=> b!1004762 (= c!101471 (= lt!444303 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!565786 () SeekEntryResult!9463)

(assert (=> b!1004762 (= e!565785 e!565786)))

(declare-fun b!1004763 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63411 (_ BitVec 32)) SeekEntryResult!9463)

(assert (=> b!1004763 (= e!565786 (seekKeyOrZeroReturnVacant!0 (x!87619 lt!444304) (index!40225 lt!444304) (index!40225 lt!444304) k!2224 a!3219 mask!3464))))

(declare-fun b!1004764 () Bool)

(assert (=> b!1004764 (= e!565786 (MissingZero!9463 (index!40225 lt!444304)))))

(declare-fun b!1004765 () Bool)

(assert (=> b!1004765 (= e!565784 Undefined!9463)))

(declare-fun b!1004766 () Bool)

(assert (=> b!1004766 (= e!565785 (Found!9463 (index!40225 lt!444304)))))

(declare-fun d!119435 () Bool)

(declare-fun lt!444305 () SeekEntryResult!9463)

(assert (=> d!119435 (and (or (is-Undefined!9463 lt!444305) (not (is-Found!9463 lt!444305)) (and (bvsge (index!40224 lt!444305) #b00000000000000000000000000000000) (bvslt (index!40224 lt!444305) (size!31033 a!3219)))) (or (is-Undefined!9463 lt!444305) (is-Found!9463 lt!444305) (not (is-MissingZero!9463 lt!444305)) (and (bvsge (index!40223 lt!444305) #b00000000000000000000000000000000) (bvslt (index!40223 lt!444305) (size!31033 a!3219)))) (or (is-Undefined!9463 lt!444305) (is-Found!9463 lt!444305) (is-MissingZero!9463 lt!444305) (not (is-MissingVacant!9463 lt!444305)) (and (bvsge (index!40226 lt!444305) #b00000000000000000000000000000000) (bvslt (index!40226 lt!444305) (size!31033 a!3219)))) (or (is-Undefined!9463 lt!444305) (ite (is-Found!9463 lt!444305) (= (select (arr!30531 a!3219) (index!40224 lt!444305)) k!2224) (ite (is-MissingZero!9463 lt!444305) (= (select (arr!30531 a!3219) (index!40223 lt!444305)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9463 lt!444305) (= (select (arr!30531 a!3219) (index!40226 lt!444305)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119435 (= lt!444305 e!565784)))

(declare-fun c!101469 () Bool)

(assert (=> d!119435 (= c!101469 (and (is-Intermediate!9463 lt!444304) (undefined!10275 lt!444304)))))

(assert (=> d!119435 (= lt!444304 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!119435 (validMask!0 mask!3464)))

(assert (=> d!119435 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!444305)))

(assert (= (and d!119435 c!101469) b!1004765))

(assert (= (and d!119435 (not c!101469)) b!1004761))

(assert (= (and b!1004761 c!101470) b!1004766))

(assert (= (and b!1004761 (not c!101470)) b!1004762))

(assert (= (and b!1004762 c!101471) b!1004764))

(assert (= (and b!1004762 (not c!101471)) b!1004763))

(declare-fun m!930217 () Bool)

(assert (=> b!1004761 m!930217))

(declare-fun m!930221 () Bool)

(assert (=> b!1004763 m!930221))

(declare-fun m!930225 () Bool)

(assert (=> d!119435 m!930225))

(declare-fun m!930227 () Bool)

(assert (=> d!119435 m!930227))

(assert (=> d!119435 m!930103))

(assert (=> d!119435 m!930225))

(declare-fun m!930231 () Bool)

(assert (=> d!119435 m!930231))

(declare-fun m!930233 () Bool)

(assert (=> d!119435 m!930233))

(declare-fun m!930235 () Bool)

(assert (=> d!119435 m!930235))

(assert (=> b!1004567 d!119435))

(declare-fun d!119457 () Bool)

(declare-fun res!674125 () Bool)

(declare-fun e!565795 () Bool)

(assert (=> d!119457 (=> res!674125 e!565795)))

(assert (=> d!119457 (= res!674125 (bvsge #b00000000000000000000000000000000 (size!31033 a!3219)))))

(assert (=> d!119457 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!565795)))

(declare-fun b!1004775 () Bool)

(declare-fun e!565794 () Bool)

(assert (=> b!1004775 (= e!565795 e!565794)))

(declare-fun c!101474 () Bool)

(assert (=> b!1004775 (= c!101474 (validKeyInArray!0 (select (arr!30531 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1004776 () Bool)

(declare-fun call!42323 () Bool)

(assert (=> b!1004776 (= e!565794 call!42323)))

(declare-fun bm!42320 () Bool)

(assert (=> bm!42320 (= call!42323 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!1004777 () Bool)

(declare-fun e!565793 () Bool)

(assert (=> b!1004777 (= e!565793 call!42323)))

(declare-fun b!1004778 () Bool)

(assert (=> b!1004778 (= e!565794 e!565793)))

(declare-fun lt!444316 () (_ BitVec 64))

(assert (=> b!1004778 (= lt!444316 (select (arr!30531 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33000 0))(
  ( (Unit!33001) )
))
(declare-fun lt!444315 () Unit!33000)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63411 (_ BitVec 64) (_ BitVec 32)) Unit!33000)

(assert (=> b!1004778 (= lt!444315 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!444316 #b00000000000000000000000000000000))))

(assert (=> b!1004778 (arrayContainsKey!0 a!3219 lt!444316 #b00000000000000000000000000000000)))

(declare-fun lt!444314 () Unit!33000)

(assert (=> b!1004778 (= lt!444314 lt!444315)))

(declare-fun res!674126 () Bool)

(assert (=> b!1004778 (= res!674126 (= (seekEntryOrOpen!0 (select (arr!30531 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9463 #b00000000000000000000000000000000)))))

(assert (=> b!1004778 (=> (not res!674126) (not e!565793))))

(assert (= (and d!119457 (not res!674125)) b!1004775))

(assert (= (and b!1004775 c!101474) b!1004778))

(assert (= (and b!1004775 (not c!101474)) b!1004776))

(assert (= (and b!1004778 res!674126) b!1004777))

(assert (= (or b!1004777 b!1004776) bm!42320))

(declare-fun m!930239 () Bool)

(assert (=> b!1004775 m!930239))

(assert (=> b!1004775 m!930239))

(declare-fun m!930241 () Bool)

(assert (=> b!1004775 m!930241))

(declare-fun m!930243 () Bool)

(assert (=> bm!42320 m!930243))

(assert (=> b!1004778 m!930239))

(declare-fun m!930245 () Bool)

(assert (=> b!1004778 m!930245))

(declare-fun m!930247 () Bool)

(assert (=> b!1004778 m!930247))

(assert (=> b!1004778 m!930239))

(declare-fun m!930249 () Bool)

(assert (=> b!1004778 m!930249))

(assert (=> b!1004572 d!119457))

(declare-fun b!1004799 () Bool)

(declare-fun e!565808 () Bool)

(declare-fun contains!5882 (List!21207 (_ BitVec 64)) Bool)

(assert (=> b!1004799 (= e!565808 (contains!5882 Nil!21204 (select (arr!30531 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119461 () Bool)

(declare-fun res!674135 () Bool)

(declare-fun e!565810 () Bool)

(assert (=> d!119461 (=> res!674135 e!565810)))

(assert (=> d!119461 (= res!674135 (bvsge #b00000000000000000000000000000000 (size!31033 a!3219)))))

(assert (=> d!119461 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21204) e!565810)))

(declare-fun b!1004800 () Bool)

(declare-fun e!565809 () Bool)

(declare-fun call!42326 () Bool)

(assert (=> b!1004800 (= e!565809 call!42326)))

(declare-fun bm!42323 () Bool)

(declare-fun c!101481 () Bool)

(assert (=> bm!42323 (= call!42326 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101481 (Cons!21203 (select (arr!30531 a!3219) #b00000000000000000000000000000000) Nil!21204) Nil!21204)))))

(declare-fun b!1004801 () Bool)

(declare-fun e!565811 () Bool)

(assert (=> b!1004801 (= e!565811 e!565809)))

(assert (=> b!1004801 (= c!101481 (validKeyInArray!0 (select (arr!30531 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1004802 () Bool)

(assert (=> b!1004802 (= e!565810 e!565811)))

(declare-fun res!674134 () Bool)

(assert (=> b!1004802 (=> (not res!674134) (not e!565811))))

(assert (=> b!1004802 (= res!674134 (not e!565808))))

(declare-fun res!674133 () Bool)

(assert (=> b!1004802 (=> (not res!674133) (not e!565808))))

(assert (=> b!1004802 (= res!674133 (validKeyInArray!0 (select (arr!30531 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1004803 () Bool)

(assert (=> b!1004803 (= e!565809 call!42326)))

(assert (= (and d!119461 (not res!674135)) b!1004802))

(assert (= (and b!1004802 res!674133) b!1004799))

(assert (= (and b!1004802 res!674134) b!1004801))

(assert (= (and b!1004801 c!101481) b!1004800))

(assert (= (and b!1004801 (not c!101481)) b!1004803))

(assert (= (or b!1004800 b!1004803) bm!42323))

(assert (=> b!1004799 m!930239))

(assert (=> b!1004799 m!930239))

(declare-fun m!930251 () Bool)

(assert (=> b!1004799 m!930251))

(assert (=> bm!42323 m!930239))

(declare-fun m!930253 () Bool)

(assert (=> bm!42323 m!930253))

(assert (=> b!1004801 m!930239))

(assert (=> b!1004801 m!930239))

(assert (=> b!1004801 m!930241))

(assert (=> b!1004802 m!930239))

(assert (=> b!1004802 m!930239))

(assert (=> b!1004802 m!930241))

(assert (=> b!1004573 d!119461))

(declare-fun b!1004812 () Bool)

(declare-fun e!565820 () SeekEntryResult!9463)

(assert (=> b!1004812 (= e!565820 (Intermediate!9463 true index!1507 x!1245))))

(declare-fun b!1004813 () Bool)

(declare-fun e!565822 () Bool)

(declare-fun e!565819 () Bool)

(assert (=> b!1004813 (= e!565822 e!565819)))

(declare-fun res!674144 () Bool)

(declare-fun lt!444321 () SeekEntryResult!9463)

(assert (=> b!1004813 (= res!674144 (and (is-Intermediate!9463 lt!444321) (not (undefined!10275 lt!444321)) (bvslt (x!87619 lt!444321) #b01111111111111111111111111111110) (bvsge (x!87619 lt!444321) #b00000000000000000000000000000000) (bvsge (x!87619 lt!444321) x!1245)))))

(assert (=> b!1004813 (=> (not res!674144) (not e!565819))))

(declare-fun b!1004814 () Bool)

(declare-fun e!565818 () SeekEntryResult!9463)

(assert (=> b!1004814 (= e!565818 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!444238 lt!444236 mask!3464))))

(declare-fun b!1004815 () Bool)

(assert (=> b!1004815 (and (bvsge (index!40225 lt!444321) #b00000000000000000000000000000000) (bvslt (index!40225 lt!444321) (size!31033 lt!444236)))))

(declare-fun res!674143 () Bool)

(assert (=> b!1004815 (= res!674143 (= (select (arr!30531 lt!444236) (index!40225 lt!444321)) lt!444238))))

(declare-fun e!565821 () Bool)

(assert (=> b!1004815 (=> res!674143 e!565821)))

(assert (=> b!1004815 (= e!565819 e!565821)))

(declare-fun d!119463 () Bool)

(assert (=> d!119463 e!565822))

(declare-fun c!101485 () Bool)

(assert (=> d!119463 (= c!101485 (and (is-Intermediate!9463 lt!444321) (undefined!10275 lt!444321)))))

(assert (=> d!119463 (= lt!444321 e!565820)))

(declare-fun c!101484 () Bool)

(assert (=> d!119463 (= c!101484 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!444322 () (_ BitVec 64))

(assert (=> d!119463 (= lt!444322 (select (arr!30531 lt!444236) index!1507))))

(assert (=> d!119463 (validMask!0 mask!3464)))

(assert (=> d!119463 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444238 lt!444236 mask!3464) lt!444321)))

(declare-fun b!1004816 () Bool)

(assert (=> b!1004816 (= e!565820 e!565818)))

(declare-fun c!101486 () Bool)

(assert (=> b!1004816 (= c!101486 (or (= lt!444322 lt!444238) (= (bvadd lt!444322 lt!444322) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1004817 () Bool)

(assert (=> b!1004817 (and (bvsge (index!40225 lt!444321) #b00000000000000000000000000000000) (bvslt (index!40225 lt!444321) (size!31033 lt!444236)))))

(declare-fun res!674142 () Bool)

(assert (=> b!1004817 (= res!674142 (= (select (arr!30531 lt!444236) (index!40225 lt!444321)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1004817 (=> res!674142 e!565821)))

(declare-fun b!1004818 () Bool)

(assert (=> b!1004818 (and (bvsge (index!40225 lt!444321) #b00000000000000000000000000000000) (bvslt (index!40225 lt!444321) (size!31033 lt!444236)))))

(assert (=> b!1004818 (= e!565821 (= (select (arr!30531 lt!444236) (index!40225 lt!444321)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1004819 () Bool)

(assert (=> b!1004819 (= e!565822 (bvsge (x!87619 lt!444321) #b01111111111111111111111111111110))))

(declare-fun b!1004820 () Bool)

(assert (=> b!1004820 (= e!565818 (Intermediate!9463 false index!1507 x!1245))))

(assert (= (and d!119463 c!101484) b!1004812))

(assert (= (and d!119463 (not c!101484)) b!1004816))

(assert (= (and b!1004816 c!101486) b!1004820))

(assert (= (and b!1004816 (not c!101486)) b!1004814))

(assert (= (and d!119463 c!101485) b!1004819))

(assert (= (and d!119463 (not c!101485)) b!1004813))

(assert (= (and b!1004813 res!674144) b!1004815))

(assert (= (and b!1004815 (not res!674143)) b!1004817))

(assert (= (and b!1004817 (not res!674142)) b!1004818))

(declare-fun m!930255 () Bool)

(assert (=> d!119463 m!930255))

(assert (=> d!119463 m!930103))

(declare-fun m!930257 () Bool)

(assert (=> b!1004815 m!930257))

(assert (=> b!1004818 m!930257))

(declare-fun m!930259 () Bool)

(assert (=> b!1004814 m!930259))

(assert (=> b!1004814 m!930259))

(declare-fun m!930261 () Bool)

(assert (=> b!1004814 m!930261))

(assert (=> b!1004817 m!930257))

(assert (=> b!1004568 d!119463))

(declare-fun b!1004821 () Bool)

(declare-fun e!565825 () SeekEntryResult!9463)

(assert (=> b!1004821 (= e!565825 (Intermediate!9463 true index!1507 x!1245))))

(declare-fun b!1004822 () Bool)

(declare-fun e!565827 () Bool)

(declare-fun e!565824 () Bool)

(assert (=> b!1004822 (= e!565827 e!565824)))

(declare-fun res!674147 () Bool)

(declare-fun lt!444323 () SeekEntryResult!9463)

(assert (=> b!1004822 (= res!674147 (and (is-Intermediate!9463 lt!444323) (not (undefined!10275 lt!444323)) (bvslt (x!87619 lt!444323) #b01111111111111111111111111111110) (bvsge (x!87619 lt!444323) #b00000000000000000000000000000000) (bvsge (x!87619 lt!444323) x!1245)))))

(assert (=> b!1004822 (=> (not res!674147) (not e!565824))))

(declare-fun b!1004823 () Bool)

(declare-fun e!565823 () SeekEntryResult!9463)

(assert (=> b!1004823 (= e!565823 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30531 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004824 () Bool)

(assert (=> b!1004824 (and (bvsge (index!40225 lt!444323) #b00000000000000000000000000000000) (bvslt (index!40225 lt!444323) (size!31033 a!3219)))))

(declare-fun res!674146 () Bool)

(assert (=> b!1004824 (= res!674146 (= (select (arr!30531 a!3219) (index!40225 lt!444323)) (select (arr!30531 a!3219) j!170)))))

(declare-fun e!565826 () Bool)

(assert (=> b!1004824 (=> res!674146 e!565826)))

(assert (=> b!1004824 (= e!565824 e!565826)))

(declare-fun d!119465 () Bool)

(assert (=> d!119465 e!565827))

(declare-fun c!101488 () Bool)

(assert (=> d!119465 (= c!101488 (and (is-Intermediate!9463 lt!444323) (undefined!10275 lt!444323)))))

(assert (=> d!119465 (= lt!444323 e!565825)))

(declare-fun c!101487 () Bool)

(assert (=> d!119465 (= c!101487 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!444324 () (_ BitVec 64))

(assert (=> d!119465 (= lt!444324 (select (arr!30531 a!3219) index!1507))))

(assert (=> d!119465 (validMask!0 mask!3464)))

(assert (=> d!119465 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30531 a!3219) j!170) a!3219 mask!3464) lt!444323)))

(declare-fun b!1004825 () Bool)

(assert (=> b!1004825 (= e!565825 e!565823)))

(declare-fun c!101489 () Bool)

(assert (=> b!1004825 (= c!101489 (or (= lt!444324 (select (arr!30531 a!3219) j!170)) (= (bvadd lt!444324 lt!444324) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1004826 () Bool)

(assert (=> b!1004826 (and (bvsge (index!40225 lt!444323) #b00000000000000000000000000000000) (bvslt (index!40225 lt!444323) (size!31033 a!3219)))))

(declare-fun res!674145 () Bool)

(assert (=> b!1004826 (= res!674145 (= (select (arr!30531 a!3219) (index!40225 lt!444323)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1004826 (=> res!674145 e!565826)))

(declare-fun b!1004827 () Bool)

(assert (=> b!1004827 (and (bvsge (index!40225 lt!444323) #b00000000000000000000000000000000) (bvslt (index!40225 lt!444323) (size!31033 a!3219)))))

(assert (=> b!1004827 (= e!565826 (= (select (arr!30531 a!3219) (index!40225 lt!444323)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1004828 () Bool)

(assert (=> b!1004828 (= e!565827 (bvsge (x!87619 lt!444323) #b01111111111111111111111111111110))))

(declare-fun b!1004829 () Bool)

(assert (=> b!1004829 (= e!565823 (Intermediate!9463 false index!1507 x!1245))))

(assert (= (and d!119465 c!101487) b!1004821))

(assert (= (and d!119465 (not c!101487)) b!1004825))

(assert (= (and b!1004825 c!101489) b!1004829))

(assert (= (and b!1004825 (not c!101489)) b!1004823))

(assert (= (and d!119465 c!101488) b!1004828))

(assert (= (and d!119465 (not c!101488)) b!1004822))

(assert (= (and b!1004822 res!674147) b!1004824))

(assert (= (and b!1004824 (not res!674146)) b!1004826))

(assert (= (and b!1004826 (not res!674145)) b!1004827))

(declare-fun m!930263 () Bool)

(assert (=> d!119465 m!930263))

(assert (=> d!119465 m!930103))

(declare-fun m!930265 () Bool)

(assert (=> b!1004824 m!930265))

(assert (=> b!1004827 m!930265))

(assert (=> b!1004823 m!930259))

(assert (=> b!1004823 m!930259))

(assert (=> b!1004823 m!930097))

(declare-fun m!930267 () Bool)

(assert (=> b!1004823 m!930267))

(assert (=> b!1004826 m!930265))

(assert (=> b!1004569 d!119465))

(declare-fun d!119467 () Bool)

(declare-fun res!674155 () Bool)

(declare-fun e!565837 () Bool)

(assert (=> d!119467 (=> res!674155 e!565837)))

(assert (=> d!119467 (= res!674155 (= (select (arr!30531 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!119467 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!565837)))

(declare-fun b!1004843 () Bool)

(declare-fun e!565838 () Bool)

(assert (=> b!1004843 (= e!565837 e!565838)))

(declare-fun res!674156 () Bool)

(assert (=> b!1004843 (=> (not res!674156) (not e!565838))))

(assert (=> b!1004843 (= res!674156 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31033 a!3219)))))

(declare-fun b!1004844 () Bool)

(assert (=> b!1004844 (= e!565838 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119467 (not res!674155)) b!1004843))

(assert (= (and b!1004843 res!674156) b!1004844))

(assert (=> d!119467 m!930239))

(declare-fun m!930277 () Bool)

(assert (=> b!1004844 m!930277))

(assert (=> b!1004574 d!119467))

(declare-fun d!119471 () Bool)

(assert (=> d!119471 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86610 d!119471))

(declare-fun d!119483 () Bool)

(assert (=> d!119483 (= (array_inv!23655 a!3219) (bvsge (size!31033 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86610 d!119483))

(declare-fun d!119485 () Bool)

(assert (=> d!119485 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1004565 d!119485))

(declare-fun b!1004872 () Bool)

(declare-fun e!565856 () SeekEntryResult!9463)

(assert (=> b!1004872 (= e!565856 (Intermediate!9463 true (toIndex!0 lt!444238 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1004873 () Bool)

(declare-fun e!565858 () Bool)

(declare-fun e!565855 () Bool)

(assert (=> b!1004873 (= e!565858 e!565855)))

(declare-fun res!674169 () Bool)

(declare-fun lt!444341 () SeekEntryResult!9463)

(assert (=> b!1004873 (= res!674169 (and (is-Intermediate!9463 lt!444341) (not (undefined!10275 lt!444341)) (bvslt (x!87619 lt!444341) #b01111111111111111111111111111110) (bvsge (x!87619 lt!444341) #b00000000000000000000000000000000) (bvsge (x!87619 lt!444341) #b00000000000000000000000000000000)))))

(assert (=> b!1004873 (=> (not res!674169) (not e!565855))))

(declare-fun e!565854 () SeekEntryResult!9463)

(declare-fun b!1004874 () Bool)

(assert (=> b!1004874 (= e!565854 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!444238 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!444238 lt!444236 mask!3464))))

(declare-fun b!1004875 () Bool)

(assert (=> b!1004875 (and (bvsge (index!40225 lt!444341) #b00000000000000000000000000000000) (bvslt (index!40225 lt!444341) (size!31033 lt!444236)))))

(declare-fun res!674168 () Bool)

(assert (=> b!1004875 (= res!674168 (= (select (arr!30531 lt!444236) (index!40225 lt!444341)) lt!444238))))

(declare-fun e!565857 () Bool)

(assert (=> b!1004875 (=> res!674168 e!565857)))

(assert (=> b!1004875 (= e!565855 e!565857)))

(declare-fun d!119487 () Bool)

(assert (=> d!119487 e!565858))

(declare-fun c!101503 () Bool)

(assert (=> d!119487 (= c!101503 (and (is-Intermediate!9463 lt!444341) (undefined!10275 lt!444341)))))

(assert (=> d!119487 (= lt!444341 e!565856)))

(declare-fun c!101502 () Bool)

(assert (=> d!119487 (= c!101502 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!444342 () (_ BitVec 64))

(assert (=> d!119487 (= lt!444342 (select (arr!30531 lt!444236) (toIndex!0 lt!444238 mask!3464)))))

(assert (=> d!119487 (validMask!0 mask!3464)))

(assert (=> d!119487 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444238 mask!3464) lt!444238 lt!444236 mask!3464) lt!444341)))

(declare-fun b!1004876 () Bool)

(assert (=> b!1004876 (= e!565856 e!565854)))

(declare-fun c!101504 () Bool)

(assert (=> b!1004876 (= c!101504 (or (= lt!444342 lt!444238) (= (bvadd lt!444342 lt!444342) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1004877 () Bool)

(assert (=> b!1004877 (and (bvsge (index!40225 lt!444341) #b00000000000000000000000000000000) (bvslt (index!40225 lt!444341) (size!31033 lt!444236)))))

(declare-fun res!674167 () Bool)

(assert (=> b!1004877 (= res!674167 (= (select (arr!30531 lt!444236) (index!40225 lt!444341)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1004877 (=> res!674167 e!565857)))

(declare-fun b!1004878 () Bool)

(assert (=> b!1004878 (and (bvsge (index!40225 lt!444341) #b00000000000000000000000000000000) (bvslt (index!40225 lt!444341) (size!31033 lt!444236)))))

(assert (=> b!1004878 (= e!565857 (= (select (arr!30531 lt!444236) (index!40225 lt!444341)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1004879 () Bool)

(assert (=> b!1004879 (= e!565858 (bvsge (x!87619 lt!444341) #b01111111111111111111111111111110))))

(declare-fun b!1004880 () Bool)

(assert (=> b!1004880 (= e!565854 (Intermediate!9463 false (toIndex!0 lt!444238 mask!3464) #b00000000000000000000000000000000))))

(assert (= (and d!119487 c!101502) b!1004872))

(assert (= (and d!119487 (not c!101502)) b!1004876))

(assert (= (and b!1004876 c!101504) b!1004880))

(assert (= (and b!1004876 (not c!101504)) b!1004874))

(assert (= (and d!119487 c!101503) b!1004879))

(assert (= (and d!119487 (not c!101503)) b!1004873))

(assert (= (and b!1004873 res!674169) b!1004875))

(assert (= (and b!1004875 (not res!674168)) b!1004877))

(assert (= (and b!1004877 (not res!674167)) b!1004878))

(assert (=> d!119487 m!930111))

(declare-fun m!930301 () Bool)

(assert (=> d!119487 m!930301))

(assert (=> d!119487 m!930103))

(declare-fun m!930303 () Bool)

