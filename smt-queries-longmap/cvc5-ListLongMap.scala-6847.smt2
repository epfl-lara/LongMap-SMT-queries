; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86228 () Bool)

(assert start!86228)

(declare-fun b!998372 () Bool)

(declare-fun res!668173 () Bool)

(declare-fun e!563004 () Bool)

(assert (=> b!998372 (=> (not res!668173) (not e!563004))))

(declare-datatypes ((array!63131 0))(
  ( (array!63132 (arr!30394 (Array (_ BitVec 32) (_ BitVec 64))) (size!30896 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63131)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998372 (= res!668173 (and (= (size!30896 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30896 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30896 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!998373 () Bool)

(declare-fun res!668170 () Bool)

(assert (=> b!998373 (=> (not res!668170) (not e!563004))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998373 (= res!668170 (validKeyInArray!0 k!2224))))

(declare-fun b!998374 () Bool)

(declare-fun e!563005 () Bool)

(assert (=> b!998374 (= e!563004 e!563005)))

(declare-fun res!668174 () Bool)

(assert (=> b!998374 (=> (not res!668174) (not e!563005))))

(declare-datatypes ((SeekEntryResult!9326 0))(
  ( (MissingZero!9326 (index!39675 (_ BitVec 32))) (Found!9326 (index!39676 (_ BitVec 32))) (Intermediate!9326 (undefined!10138 Bool) (index!39677 (_ BitVec 32)) (x!87110 (_ BitVec 32))) (Undefined!9326) (MissingVacant!9326 (index!39678 (_ BitVec 32))) )
))
(declare-fun lt!441689 () SeekEntryResult!9326)

(assert (=> b!998374 (= res!668174 (or (= lt!441689 (MissingVacant!9326 i!1194)) (= lt!441689 (MissingZero!9326 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63131 (_ BitVec 32)) SeekEntryResult!9326)

(assert (=> b!998374 (= lt!441689 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!998375 () Bool)

(declare-fun res!668178 () Bool)

(assert (=> b!998375 (=> (not res!668178) (not e!563005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63131 (_ BitVec 32)) Bool)

(assert (=> b!998375 (= res!668178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!998377 () Bool)

(declare-fun res!668177 () Bool)

(assert (=> b!998377 (=> (not res!668177) (not e!563004))))

(assert (=> b!998377 (= res!668177 (validKeyInArray!0 (select (arr!30394 a!3219) j!170)))))

(declare-fun b!998378 () Bool)

(declare-fun res!668169 () Bool)

(assert (=> b!998378 (=> (not res!668169) (not e!563005))))

(declare-datatypes ((List!21070 0))(
  ( (Nil!21067) (Cons!21066 (h!22237 (_ BitVec 64)) (t!30071 List!21070)) )
))
(declare-fun arrayNoDuplicates!0 (array!63131 (_ BitVec 32) List!21070) Bool)

(assert (=> b!998378 (= res!668169 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21067))))

(declare-fun b!998379 () Bool)

(declare-fun res!668175 () Bool)

(declare-fun e!563003 () Bool)

(assert (=> b!998379 (=> (not res!668175) (not e!563003))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!441688 () SeekEntryResult!9326)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63131 (_ BitVec 32)) SeekEntryResult!9326)

(assert (=> b!998379 (= res!668175 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30394 a!3219) j!170) a!3219 mask!3464) lt!441688))))

(declare-fun b!998380 () Bool)

(declare-fun res!668176 () Bool)

(assert (=> b!998380 (=> (not res!668176) (not e!563004))))

(declare-fun arrayContainsKey!0 (array!63131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998380 (= res!668176 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998381 () Bool)

(assert (=> b!998381 (= e!563003 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsgt mask!3464 #b00111111111111111111111111111111)))))

(declare-fun b!998382 () Bool)

(assert (=> b!998382 (= e!563005 e!563003)))

(declare-fun res!668172 () Bool)

(assert (=> b!998382 (=> (not res!668172) (not e!563003))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998382 (= res!668172 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30394 a!3219) j!170) mask!3464) (select (arr!30394 a!3219) j!170) a!3219 mask!3464) lt!441688))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998382 (= lt!441688 (Intermediate!9326 false resIndex!38 resX!38))))

(declare-fun res!668171 () Bool)

(assert (=> start!86228 (=> (not res!668171) (not e!563004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86228 (= res!668171 (validMask!0 mask!3464))))

(assert (=> start!86228 e!563004))

(declare-fun array_inv!23518 (array!63131) Bool)

(assert (=> start!86228 (array_inv!23518 a!3219)))

(assert (=> start!86228 true))

(declare-fun b!998376 () Bool)

(declare-fun res!668168 () Bool)

(assert (=> b!998376 (=> (not res!668168) (not e!563005))))

(assert (=> b!998376 (= res!668168 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30896 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30896 a!3219))))))

(assert (= (and start!86228 res!668171) b!998372))

(assert (= (and b!998372 res!668173) b!998377))

(assert (= (and b!998377 res!668177) b!998373))

(assert (= (and b!998373 res!668170) b!998380))

(assert (= (and b!998380 res!668176) b!998374))

(assert (= (and b!998374 res!668174) b!998375))

(assert (= (and b!998375 res!668178) b!998378))

(assert (= (and b!998378 res!668169) b!998376))

(assert (= (and b!998376 res!668168) b!998382))

(assert (= (and b!998382 res!668172) b!998379))

(assert (= (and b!998379 res!668175) b!998381))

(declare-fun m!924917 () Bool)

(assert (=> start!86228 m!924917))

(declare-fun m!924919 () Bool)

(assert (=> start!86228 m!924919))

(declare-fun m!924921 () Bool)

(assert (=> b!998382 m!924921))

(assert (=> b!998382 m!924921))

(declare-fun m!924923 () Bool)

(assert (=> b!998382 m!924923))

(assert (=> b!998382 m!924923))

(assert (=> b!998382 m!924921))

(declare-fun m!924925 () Bool)

(assert (=> b!998382 m!924925))

(declare-fun m!924927 () Bool)

(assert (=> b!998380 m!924927))

(declare-fun m!924929 () Bool)

(assert (=> b!998375 m!924929))

(declare-fun m!924931 () Bool)

(assert (=> b!998378 m!924931))

(declare-fun m!924933 () Bool)

(assert (=> b!998373 m!924933))

(declare-fun m!924935 () Bool)

(assert (=> b!998374 m!924935))

(assert (=> b!998379 m!924921))

(assert (=> b!998379 m!924921))

(declare-fun m!924937 () Bool)

(assert (=> b!998379 m!924937))

(assert (=> b!998377 m!924921))

(assert (=> b!998377 m!924921))

(declare-fun m!924939 () Bool)

(assert (=> b!998377 m!924939))

(push 1)

(assert (not b!998382))

(assert (not b!998375))

(assert (not b!998377))

(assert (not b!998378))

(assert (not b!998379))

(assert (not b!998380))

(assert (not start!86228))

(assert (not b!998373))

(assert (not b!998374))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun e!563063 () SeekEntryResult!9326)

(declare-fun b!998506 () Bool)

(assert (=> b!998506 (= e!563063 (Intermediate!9326 true (toIndex!0 (select (arr!30394 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!998507 () Bool)

(declare-fun e!563062 () SeekEntryResult!9326)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998507 (= e!563062 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30394 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30394 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!998508 () Bool)

(declare-fun lt!441718 () SeekEntryResult!9326)

(assert (=> b!998508 (and (bvsge (index!39677 lt!441718) #b00000000000000000000000000000000) (bvslt (index!39677 lt!441718) (size!30896 a!3219)))))

(declare-fun e!563064 () Bool)

(assert (=> b!998508 (= e!563064 (= (select (arr!30394 a!3219) (index!39677 lt!441718)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!998509 () Bool)

(declare-fun e!563061 () Bool)

(declare-fun e!563065 () Bool)

(assert (=> b!998509 (= e!563061 e!563065)))

(declare-fun res!668260 () Bool)

(assert (=> b!998509 (= res!668260 (and (is-Intermediate!9326 lt!441718) (not (undefined!10138 lt!441718)) (bvslt (x!87110 lt!441718) #b01111111111111111111111111111110) (bvsge (x!87110 lt!441718) #b00000000000000000000000000000000) (bvsge (x!87110 lt!441718) #b00000000000000000000000000000000)))))

(assert (=> b!998509 (=> (not res!668260) (not e!563065))))

(declare-fun b!998510 () Bool)

(assert (=> b!998510 (= e!563061 (bvsge (x!87110 lt!441718) #b01111111111111111111111111111110))))

(declare-fun d!119181 () Bool)

(assert (=> d!119181 e!563061))

(declare-fun c!101268 () Bool)

(assert (=> d!119181 (= c!101268 (and (is-Intermediate!9326 lt!441718) (undefined!10138 lt!441718)))))

(assert (=> d!119181 (= lt!441718 e!563063)))

(declare-fun c!101270 () Bool)

(assert (=> d!119181 (= c!101270 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!441719 () (_ BitVec 64))

(assert (=> d!119181 (= lt!441719 (select (arr!30394 a!3219) (toIndex!0 (select (arr!30394 a!3219) j!170) mask!3464)))))

(assert (=> d!119181 (validMask!0 mask!3464)))

(assert (=> d!119181 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30394 a!3219) j!170) mask!3464) (select (arr!30394 a!3219) j!170) a!3219 mask!3464) lt!441718)))

(declare-fun b!998511 () Bool)

(assert (=> b!998511 (= e!563062 (Intermediate!9326 false (toIndex!0 (select (arr!30394 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!998512 () Bool)

(assert (=> b!998512 (= e!563063 e!563062)))

(declare-fun c!101269 () Bool)

(assert (=> b!998512 (= c!101269 (or (= lt!441719 (select (arr!30394 a!3219) j!170)) (= (bvadd lt!441719 lt!441719) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!998513 () Bool)

(assert (=> b!998513 (and (bvsge (index!39677 lt!441718) #b00000000000000000000000000000000) (bvslt (index!39677 lt!441718) (size!30896 a!3219)))))

(declare-fun res!668262 () Bool)

(assert (=> b!998513 (= res!668262 (= (select (arr!30394 a!3219) (index!39677 lt!441718)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!998513 (=> res!668262 e!563064)))

(declare-fun b!998514 () Bool)

(assert (=> b!998514 (and (bvsge (index!39677 lt!441718) #b00000000000000000000000000000000) (bvslt (index!39677 lt!441718) (size!30896 a!3219)))))

(declare-fun res!668261 () Bool)

(assert (=> b!998514 (= res!668261 (= (select (arr!30394 a!3219) (index!39677 lt!441718)) (select (arr!30394 a!3219) j!170)))))

(assert (=> b!998514 (=> res!668261 e!563064)))

(assert (=> b!998514 (= e!563065 e!563064)))

(assert (= (and d!119181 c!101270) b!998506))

(assert (= (and d!119181 (not c!101270)) b!998512))

(assert (= (and b!998512 c!101269) b!998511))

(assert (= (and b!998512 (not c!101269)) b!998507))

(assert (= (and d!119181 c!101268) b!998510))

(assert (= (and d!119181 (not c!101268)) b!998509))

(assert (= (and b!998509 res!668260) b!998514))

(assert (= (and b!998514 (not res!668261)) b!998513))

(assert (= (and b!998513 (not res!668262)) b!998508))

(assert (=> b!998507 m!924923))

(declare-fun m!924997 () Bool)

(assert (=> b!998507 m!924997))

(assert (=> b!998507 m!924997))

(assert (=> b!998507 m!924921))

(declare-fun m!924999 () Bool)

(assert (=> b!998507 m!924999))

(assert (=> d!119181 m!924923))

(declare-fun m!925001 () Bool)

(assert (=> d!119181 m!925001))

(assert (=> d!119181 m!924917))

(declare-fun m!925003 () Bool)

(assert (=> b!998514 m!925003))

(assert (=> b!998513 m!925003))

(assert (=> b!998508 m!925003))

(assert (=> b!998382 d!119181))

(declare-fun d!119187 () Bool)

(declare-fun lt!441728 () (_ BitVec 32))

(declare-fun lt!441727 () (_ BitVec 32))

(assert (=> d!119187 (= lt!441728 (bvmul (bvxor lt!441727 (bvlshr lt!441727 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119187 (= lt!441727 ((_ extract 31 0) (bvand (bvxor (select (arr!30394 a!3219) j!170) (bvlshr (select (arr!30394 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119187 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!668263 (let ((h!22240 ((_ extract 31 0) (bvand (bvxor (select (arr!30394 a!3219) j!170) (bvlshr (select (arr!30394 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87115 (bvmul (bvxor h!22240 (bvlshr h!22240 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87115 (bvlshr x!87115 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!668263 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!668263 #b00000000000000000000000000000000))))))

(assert (=> d!119187 (= (toIndex!0 (select (arr!30394 a!3219) j!170) mask!3464) (bvand (bvxor lt!441728 (bvlshr lt!441728 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!998382 d!119187))

(declare-fun d!119191 () Bool)

(assert (=> d!119191 (= (validKeyInArray!0 (select (arr!30394 a!3219) j!170)) (and (not (= (select (arr!30394 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30394 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!998377 d!119191))

(declare-fun b!998543 () Bool)

(declare-fun e!563088 () Bool)

(declare-fun call!42281 () Bool)

(assert (=> b!998543 (= e!563088 call!42281)))

(declare-fun b!998544 () Bool)

(declare-fun e!563086 () Bool)

(declare-fun contains!5874 (List!21070 (_ BitVec 64)) Bool)

(assert (=> b!998544 (= e!563086 (contains!5874 Nil!21067 (select (arr!30394 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!998545 () Bool)

(assert (=> b!998545 (= e!563088 call!42281)))

(declare-fun b!998546 () Bool)

(declare-fun e!563089 () Bool)

(declare-fun e!563087 () Bool)

(assert (=> b!998546 (= e!563089 e!563087)))

(declare-fun res!668276 () Bool)

(assert (=> b!998546 (=> (not res!668276) (not e!563087))))

(assert (=> b!998546 (= res!668276 (not e!563086))))

(declare-fun res!668278 () Bool)

(assert (=> b!998546 (=> (not res!668278) (not e!563086))))

(assert (=> b!998546 (= res!668278 (validKeyInArray!0 (select (arr!30394 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119193 () Bool)

(declare-fun res!668277 () Bool)

(assert (=> d!119193 (=> res!668277 e!563089)))

(assert (=> d!119193 (= res!668277 (bvsge #b00000000000000000000000000000000 (size!30896 a!3219)))))

(assert (=> d!119193 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21067) e!563089)))

(declare-fun bm!42278 () Bool)

(declare-fun c!101279 () Bool)

(assert (=> bm!42278 (= call!42281 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101279 (Cons!21066 (select (arr!30394 a!3219) #b00000000000000000000000000000000) Nil!21067) Nil!21067)))))

(declare-fun b!998547 () Bool)

(assert (=> b!998547 (= e!563087 e!563088)))

(assert (=> b!998547 (= c!101279 (validKeyInArray!0 (select (arr!30394 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!119193 (not res!668277)) b!998546))

(assert (= (and b!998546 res!668278) b!998544))

(assert (= (and b!998546 res!668276) b!998547))

(assert (= (and b!998547 c!101279) b!998545))

(assert (= (and b!998547 (not c!101279)) b!998543))

(assert (= (or b!998545 b!998543) bm!42278))

(declare-fun m!925031 () Bool)

(assert (=> b!998544 m!925031))

(assert (=> b!998544 m!925031))

(declare-fun m!925033 () Bool)

(assert (=> b!998544 m!925033))

(assert (=> b!998546 m!925031))

(assert (=> b!998546 m!925031))

(declare-fun m!925035 () Bool)

(assert (=> b!998546 m!925035))

(assert (=> bm!42278 m!925031))

(declare-fun m!925037 () Bool)

(assert (=> bm!42278 m!925037))

(assert (=> b!998547 m!925031))

(assert (=> b!998547 m!925031))

(assert (=> b!998547 m!925035))

(assert (=> b!998378 d!119193))

(declare-fun d!119203 () Bool)

(assert (=> d!119203 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86228 d!119203))

(declare-fun d!119211 () Bool)

(assert (=> d!119211 (= (array_inv!23518 a!3219) (bvsge (size!30896 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86228 d!119211))

(declare-fun d!119213 () Bool)

(assert (=> d!119213 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!998373 d!119213))

(declare-fun b!998563 () Bool)

(declare-fun e!563104 () SeekEntryResult!9326)

(assert (=> b!998563 (= e!563104 (Intermediate!9326 true index!1507 x!1245))))

(declare-fun b!998564 () Bool)

(declare-fun e!563103 () SeekEntryResult!9326)

(assert (=> b!998564 (= e!563103 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30394 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!998565 () Bool)

(declare-fun lt!441738 () SeekEntryResult!9326)

(assert (=> b!998565 (and (bvsge (index!39677 lt!441738) #b00000000000000000000000000000000) (bvslt (index!39677 lt!441738) (size!30896 a!3219)))))

(declare-fun e!563105 () Bool)

(assert (=> b!998565 (= e!563105 (= (select (arr!30394 a!3219) (index!39677 lt!441738)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!998566 () Bool)

(declare-fun e!563102 () Bool)

(declare-fun e!563106 () Bool)

(assert (=> b!998566 (= e!563102 e!563106)))

(declare-fun res!668288 () Bool)

(assert (=> b!998566 (= res!668288 (and (is-Intermediate!9326 lt!441738) (not (undefined!10138 lt!441738)) (bvslt (x!87110 lt!441738) #b01111111111111111111111111111110) (bvsge (x!87110 lt!441738) #b00000000000000000000000000000000) (bvsge (x!87110 lt!441738) x!1245)))))

(assert (=> b!998566 (=> (not res!668288) (not e!563106))))

(declare-fun b!998567 () Bool)

(assert (=> b!998567 (= e!563102 (bvsge (x!87110 lt!441738) #b01111111111111111111111111111110))))

(declare-fun d!119215 () Bool)

(assert (=> d!119215 e!563102))

(declare-fun c!101283 () Bool)

(assert (=> d!119215 (= c!101283 (and (is-Intermediate!9326 lt!441738) (undefined!10138 lt!441738)))))

(assert (=> d!119215 (= lt!441738 e!563104)))

(declare-fun c!101285 () Bool)

(assert (=> d!119215 (= c!101285 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!441739 () (_ BitVec 64))

(assert (=> d!119215 (= lt!441739 (select (arr!30394 a!3219) index!1507))))

(assert (=> d!119215 (validMask!0 mask!3464)))

(assert (=> d!119215 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30394 a!3219) j!170) a!3219 mask!3464) lt!441738)))

(declare-fun b!998568 () Bool)

(assert (=> b!998568 (= e!563103 (Intermediate!9326 false index!1507 x!1245))))

(declare-fun b!998569 () Bool)

(assert (=> b!998569 (= e!563104 e!563103)))

(declare-fun c!101284 () Bool)

(assert (=> b!998569 (= c!101284 (or (= lt!441739 (select (arr!30394 a!3219) j!170)) (= (bvadd lt!441739 lt!441739) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!998570 () Bool)

(assert (=> b!998570 (and (bvsge (index!39677 lt!441738) #b00000000000000000000000000000000) (bvslt (index!39677 lt!441738) (size!30896 a!3219)))))

(declare-fun res!668290 () Bool)

(assert (=> b!998570 (= res!668290 (= (select (arr!30394 a!3219) (index!39677 lt!441738)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!998570 (=> res!668290 e!563105)))

(declare-fun b!998571 () Bool)

(assert (=> b!998571 (and (bvsge (index!39677 lt!441738) #b00000000000000000000000000000000) (bvslt (index!39677 lt!441738) (size!30896 a!3219)))))

(declare-fun res!668289 () Bool)

(assert (=> b!998571 (= res!668289 (= (select (arr!30394 a!3219) (index!39677 lt!441738)) (select (arr!30394 a!3219) j!170)))))

(assert (=> b!998571 (=> res!668289 e!563105)))

(assert (=> b!998571 (= e!563106 e!563105)))

(assert (= (and d!119215 c!101285) b!998563))

(assert (= (and d!119215 (not c!101285)) b!998569))

(assert (= (and b!998569 c!101284) b!998568))

(assert (= (and b!998569 (not c!101284)) b!998564))

(assert (= (and d!119215 c!101283) b!998567))

(assert (= (and d!119215 (not c!101283)) b!998566))

(assert (= (and b!998566 res!668288) b!998571))

(assert (= (and b!998571 (not res!668289)) b!998570))

(assert (= (and b!998570 (not res!668290)) b!998565))

(declare-fun m!925043 () Bool)

(assert (=> b!998564 m!925043))

(assert (=> b!998564 m!925043))

(assert (=> b!998564 m!924921))

(declare-fun m!925045 () Bool)

(assert (=> b!998564 m!925045))

(declare-fun m!925047 () Bool)

(assert (=> d!119215 m!925047))

(assert (=> d!119215 m!924917))

(declare-fun m!925049 () Bool)

(assert (=> b!998571 m!925049))

(assert (=> b!998570 m!925049))

(assert (=> b!998565 m!925049))

(assert (=> b!998379 d!119215))

(declare-fun b!998647 () Bool)

(declare-fun e!563149 () SeekEntryResult!9326)

(assert (=> b!998647 (= e!563149 Undefined!9326)))

(declare-fun e!563148 () SeekEntryResult!9326)

(declare-fun b!998648 () Bool)

(declare-fun lt!441772 () SeekEntryResult!9326)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63131 (_ BitVec 32)) SeekEntryResult!9326)

(assert (=> b!998648 (= e!563148 (seekKeyOrZeroReturnVacant!0 (x!87110 lt!441772) (index!39677 lt!441772) (index!39677 lt!441772) k!2224 a!3219 mask!3464))))

(declare-fun b!998649 () Bool)

(declare-fun c!101318 () Bool)

(declare-fun lt!441773 () (_ BitVec 64))

(assert (=> b!998649 (= c!101318 (= lt!441773 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!563147 () SeekEntryResult!9326)

(assert (=> b!998649 (= e!563147 e!563148)))

(declare-fun d!119217 () Bool)

(declare-fun lt!441771 () SeekEntryResult!9326)

(assert (=> d!119217 (and (or (is-Undefined!9326 lt!441771) (not (is-Found!9326 lt!441771)) (and (bvsge (index!39676 lt!441771) #b00000000000000000000000000000000) (bvslt (index!39676 lt!441771) (size!30896 a!3219)))) (or (is-Undefined!9326 lt!441771) (is-Found!9326 lt!441771) (not (is-MissingZero!9326 lt!441771)) (and (bvsge (index!39675 lt!441771) #b00000000000000000000000000000000) (bvslt (index!39675 lt!441771) (size!30896 a!3219)))) (or (is-Undefined!9326 lt!441771) (is-Found!9326 lt!441771) (is-MissingZero!9326 lt!441771) (not (is-MissingVacant!9326 lt!441771)) (and (bvsge (index!39678 lt!441771) #b00000000000000000000000000000000) (bvslt (index!39678 lt!441771) (size!30896 a!3219)))) (or (is-Undefined!9326 lt!441771) (ite (is-Found!9326 lt!441771) (= (select (arr!30394 a!3219) (index!39676 lt!441771)) k!2224) (ite (is-MissingZero!9326 lt!441771) (= (select (arr!30394 a!3219) (index!39675 lt!441771)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9326 lt!441771) (= (select (arr!30394 a!3219) (index!39678 lt!441771)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119217 (= lt!441771 e!563149)))

(declare-fun c!101317 () Bool)

(assert (=> d!119217 (= c!101317 (and (is-Intermediate!9326 lt!441772) (undefined!10138 lt!441772)))))

(assert (=> d!119217 (= lt!441772 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!119217 (validMask!0 mask!3464)))

(assert (=> d!119217 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!441771)))

(declare-fun b!998650 () Bool)

(assert (=> b!998650 (= e!563149 e!563147)))

(assert (=> b!998650 (= lt!441773 (select (arr!30394 a!3219) (index!39677 lt!441772)))))

(declare-fun c!101316 () Bool)

(assert (=> b!998650 (= c!101316 (= lt!441773 k!2224))))

(declare-fun b!998651 () Bool)

(assert (=> b!998651 (= e!563147 (Found!9326 (index!39677 lt!441772)))))

(declare-fun b!998652 () Bool)

(assert (=> b!998652 (= e!563148 (MissingZero!9326 (index!39677 lt!441772)))))

(assert (= (and d!119217 c!101317) b!998647))

(assert (= (and d!119217 (not c!101317)) b!998650))

(assert (= (and b!998650 c!101316) b!998651))

(assert (= (and b!998650 (not c!101316)) b!998649))

(assert (= (and b!998649 c!101318) b!998652))

(assert (= (and b!998649 (not c!101318)) b!998648))

(declare-fun m!925089 () Bool)

(assert (=> b!998648 m!925089))

(declare-fun m!925091 () Bool)

(assert (=> d!119217 m!925091))

(declare-fun m!925093 () Bool)

(assert (=> d!119217 m!925093))

(declare-fun m!925095 () Bool)

(assert (=> d!119217 m!925095))

(assert (=> d!119217 m!925091))

(declare-fun m!925097 () Bool)

(assert (=> d!119217 m!925097))

(assert (=> d!119217 m!924917))

(declare-fun m!925099 () Bool)

(assert (=> d!119217 m!925099))

(declare-fun m!925101 () Bool)

(assert (=> b!998650 m!925101))

(assert (=> b!998374 d!119217))

(declare-fun d!119229 () Bool)

(declare-fun res!668312 () Bool)

(declare-fun e!563154 () Bool)

(assert (=> d!119229 (=> res!668312 e!563154)))

(assert (=> d!119229 (= res!668312 (= (select (arr!30394 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!119229 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!563154)))

(declare-fun b!998657 () Bool)

(declare-fun e!563155 () Bool)

(assert (=> b!998657 (= e!563154 e!563155)))

(declare-fun res!668313 () Bool)

(assert (=> b!998657 (=> (not res!668313) (not e!563155))))

(assert (=> b!998657 (= res!668313 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30896 a!3219)))))

(declare-fun b!998658 () Bool)

(assert (=> b!998658 (= e!563155 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119229 (not res!668312)) b!998657))

(assert (= (and b!998657 res!668313) b!998658))

(assert (=> d!119229 m!925031))

(declare-fun m!925103 () Bool)

(assert (=> b!998658 m!925103))

(assert (=> b!998380 d!119229))

(declare-fun b!998679 () Bool)

(declare-fun e!563172 () Bool)

(declare-fun e!563173 () Bool)

(assert (=> b!998679 (= e!563172 e!563173)))

(declare-fun c!101324 () Bool)

(assert (=> b!998679 (= c!101324 (validKeyInArray!0 (select (arr!30394 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42287 () Bool)

(declare-fun call!42290 () Bool)

(assert (=> bm!42287 (= call!42290 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun d!119233 () Bool)

(declare-fun res!668324 () Bool)

(assert (=> d!119233 (=> res!668324 e!563172)))

(assert (=> d!119233 (= res!668324 (bvsge #b00000000000000000000000000000000 (size!30896 a!3219)))))

(assert (=> d!119233 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!563172)))

(declare-fun b!998680 () Bool)

(declare-fun e!563171 () Bool)

(assert (=> b!998680 (= e!563173 e!563171)))

(declare-fun lt!441795 () (_ BitVec 64))

(assert (=> b!998680 (= lt!441795 (select (arr!30394 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32988 0))(
  ( (Unit!32989) )
))
(declare-fun lt!441796 () Unit!32988)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63131 (_ BitVec 64) (_ BitVec 32)) Unit!32988)

(assert (=> b!998680 (= lt!441796 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!441795 #b00000000000000000000000000000000))))

(assert (=> b!998680 (arrayContainsKey!0 a!3219 lt!441795 #b00000000000000000000000000000000)))

(declare-fun lt!441797 () Unit!32988)

(assert (=> b!998680 (= lt!441797 lt!441796)))

(declare-fun res!668325 () Bool)

(assert (=> b!998680 (= res!668325 (= (seekEntryOrOpen!0 (select (arr!30394 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9326 #b00000000000000000000000000000000)))))

(assert (=> b!998680 (=> (not res!668325) (not e!563171))))

(declare-fun b!998681 () Bool)

(assert (=> b!998681 (= e!563171 call!42290)))

(declare-fun b!998682 () Bool)

(assert (=> b!998682 (= e!563173 call!42290)))

(assert (= (and d!119233 (not res!668324)) b!998679))

(assert (= (and b!998679 c!101324) b!998680))

(assert (= (and b!998679 (not c!101324)) b!998682))

(assert (= (and b!998680 res!668325) b!998681))

(assert (= (or b!998681 b!998682) bm!42287))

(assert (=> b!998679 m!925031))

(assert (=> b!998679 m!925031))

(assert (=> b!998679 m!925035))

(declare-fun m!925117 () Bool)

(assert (=> bm!42287 m!925117))

(assert (=> b!998680 m!925031))

(declare-fun m!925119 () Bool)

(assert (=> b!998680 m!925119))

(declare-fun m!925121 () Bool)

(assert (=> b!998680 m!925121))

(assert (=> b!998680 m!925031))

(declare-fun m!925123 () Bool)

(assert (=> b!998680 m!925123))

(assert (=> b!998375 d!119233))

(push 1)

(assert (not d!119215))

(assert (not b!998679))

(assert (not b!998658))

(assert (not b!998546))

(assert (not b!998680))

(assert (not b!998507))

(assert (not bm!42287))

(assert (not b!998564))

(assert (not d!119181))

(assert (not b!998547))

(assert (not b!998544))

(assert (not d!119217))

(assert (not b!998648))

(assert (not bm!42278))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

