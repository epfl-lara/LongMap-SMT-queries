; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49570 () Bool)

(assert start!49570)

(declare-fun b!545272 () Bool)

(declare-fun res!339279 () Bool)

(declare-fun e!315201 () Bool)

(assert (=> b!545272 (=> (not res!339279) (not e!315201))))

(declare-datatypes ((array!34388 0))(
  ( (array!34389 (arr!16522 (Array (_ BitVec 32) (_ BitVec 64))) (size!16886 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34388)

(declare-datatypes ((List!10548 0))(
  ( (Nil!10545) (Cons!10544 (h!11508 (_ BitVec 64)) (t!16768 List!10548)) )
))
(declare-fun arrayNoDuplicates!0 (array!34388 (_ BitVec 32) List!10548) Bool)

(assert (=> b!545272 (= res!339279 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10545))))

(declare-fun b!545273 () Bool)

(declare-fun res!339276 () Bool)

(declare-fun e!315197 () Bool)

(assert (=> b!545273 (=> (not res!339276) (not e!315197))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!545273 (= res!339276 (and (not (= (select (arr!16522 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16522 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16522 a!3154) index!1177) (select (arr!16522 a!3154) j!147)))))))

(declare-fun res!339281 () Bool)

(declare-fun e!315199 () Bool)

(assert (=> start!49570 (=> (not res!339281) (not e!315199))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49570 (= res!339281 (validMask!0 mask!3216))))

(assert (=> start!49570 e!315199))

(assert (=> start!49570 true))

(declare-fun array_inv!12381 (array!34388) Bool)

(assert (=> start!49570 (array_inv!12381 a!3154)))

(declare-fun b!545274 () Bool)

(declare-fun e!315198 () Bool)

(assert (=> b!545274 (= e!315197 e!315198)))

(declare-fun res!339282 () Bool)

(assert (=> b!545274 (=> (not res!339282) (not e!315198))))

(declare-fun lt!248803 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!545274 (= res!339282 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!248803 #b00000000000000000000000000000000) (bvslt lt!248803 (size!16886 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545274 (= lt!248803 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!545275 () Bool)

(declare-fun res!339280 () Bool)

(assert (=> b!545275 (=> (not res!339280) (not e!315199))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34388 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545275 (= res!339280 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!545276 () Bool)

(declare-fun res!339283 () Bool)

(assert (=> b!545276 (=> (not res!339283) (not e!315201))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!545276 (= res!339283 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16886 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16886 a!3154)) (= (select (arr!16522 a!3154) resIndex!32) (select (arr!16522 a!3154) j!147))))))

(declare-fun b!545277 () Bool)

(declare-fun res!339278 () Bool)

(assert (=> b!545277 (=> (not res!339278) (not e!315199))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545277 (= res!339278 (validKeyInArray!0 (select (arr!16522 a!3154) j!147)))))

(declare-fun b!545278 () Bool)

(declare-fun res!339271 () Bool)

(assert (=> b!545278 (=> (not res!339271) (not e!315199))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!545278 (= res!339271 (and (= (size!16886 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16886 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16886 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!545279 () Bool)

(assert (=> b!545279 (= e!315201 e!315197)))

(declare-fun res!339273 () Bool)

(assert (=> b!545279 (=> (not res!339273) (not e!315197))))

(declare-datatypes ((SeekEntryResult!4936 0))(
  ( (MissingZero!4936 (index!21968 (_ BitVec 32))) (Found!4936 (index!21969 (_ BitVec 32))) (Intermediate!4936 (undefined!5748 Bool) (index!21970 (_ BitVec 32)) (x!51042 (_ BitVec 32))) (Undefined!4936) (MissingVacant!4936 (index!21971 (_ BitVec 32))) )
))
(declare-fun lt!248802 () SeekEntryResult!4936)

(declare-fun lt!248801 () SeekEntryResult!4936)

(assert (=> b!545279 (= res!339273 (= lt!248802 lt!248801))))

(assert (=> b!545279 (= lt!248801 (Intermediate!4936 false resIndex!32 resX!32))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34388 (_ BitVec 32)) SeekEntryResult!4936)

(assert (=> b!545279 (= lt!248802 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16522 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545280 () Bool)

(declare-fun res!339275 () Bool)

(assert (=> b!545280 (=> (not res!339275) (not e!315197))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545280 (= res!339275 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16522 a!3154) j!147) mask!3216) (select (arr!16522 a!3154) j!147) a!3154 mask!3216) lt!248802))))

(declare-fun b!545281 () Bool)

(assert (=> b!545281 (= e!315199 e!315201)))

(declare-fun res!339272 () Bool)

(assert (=> b!545281 (=> (not res!339272) (not e!315201))))

(declare-fun lt!248800 () SeekEntryResult!4936)

(assert (=> b!545281 (= res!339272 (or (= lt!248800 (MissingZero!4936 i!1153)) (= lt!248800 (MissingVacant!4936 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34388 (_ BitVec 32)) SeekEntryResult!4936)

(assert (=> b!545281 (= lt!248800 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!545282 () Bool)

(declare-fun res!339274 () Bool)

(assert (=> b!545282 (=> (not res!339274) (not e!315201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34388 (_ BitVec 32)) Bool)

(assert (=> b!545282 (= res!339274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!545283 () Bool)

(declare-fun res!339277 () Bool)

(assert (=> b!545283 (=> (not res!339277) (not e!315199))))

(assert (=> b!545283 (= res!339277 (validKeyInArray!0 k0!1998))))

(declare-fun b!545284 () Bool)

(assert (=> b!545284 (= e!315198 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248803 (select (arr!16522 a!3154) j!147) a!3154 mask!3216) lt!248801)))))

(assert (= (and start!49570 res!339281) b!545278))

(assert (= (and b!545278 res!339271) b!545277))

(assert (= (and b!545277 res!339278) b!545283))

(assert (= (and b!545283 res!339277) b!545275))

(assert (= (and b!545275 res!339280) b!545281))

(assert (= (and b!545281 res!339272) b!545282))

(assert (= (and b!545282 res!339274) b!545272))

(assert (= (and b!545272 res!339279) b!545276))

(assert (= (and b!545276 res!339283) b!545279))

(assert (= (and b!545279 res!339273) b!545280))

(assert (= (and b!545280 res!339275) b!545273))

(assert (= (and b!545273 res!339276) b!545274))

(assert (= (and b!545274 res!339282) b!545284))

(declare-fun m!523123 () Bool)

(assert (=> b!545281 m!523123))

(declare-fun m!523125 () Bool)

(assert (=> b!545284 m!523125))

(assert (=> b!545284 m!523125))

(declare-fun m!523127 () Bool)

(assert (=> b!545284 m!523127))

(declare-fun m!523129 () Bool)

(assert (=> b!545273 m!523129))

(assert (=> b!545273 m!523125))

(declare-fun m!523131 () Bool)

(assert (=> b!545275 m!523131))

(assert (=> b!545277 m!523125))

(assert (=> b!545277 m!523125))

(declare-fun m!523133 () Bool)

(assert (=> b!545277 m!523133))

(declare-fun m!523135 () Bool)

(assert (=> b!545283 m!523135))

(assert (=> b!545279 m!523125))

(assert (=> b!545279 m!523125))

(declare-fun m!523137 () Bool)

(assert (=> b!545279 m!523137))

(declare-fun m!523139 () Bool)

(assert (=> b!545272 m!523139))

(declare-fun m!523141 () Bool)

(assert (=> start!49570 m!523141))

(declare-fun m!523143 () Bool)

(assert (=> start!49570 m!523143))

(declare-fun m!523145 () Bool)

(assert (=> b!545276 m!523145))

(assert (=> b!545276 m!523125))

(declare-fun m!523147 () Bool)

(assert (=> b!545274 m!523147))

(declare-fun m!523149 () Bool)

(assert (=> b!545282 m!523149))

(assert (=> b!545280 m!523125))

(assert (=> b!545280 m!523125))

(declare-fun m!523151 () Bool)

(assert (=> b!545280 m!523151))

(assert (=> b!545280 m!523151))

(assert (=> b!545280 m!523125))

(declare-fun m!523153 () Bool)

(assert (=> b!545280 m!523153))

(check-sat (not b!545274) (not b!545281) (not b!545284) (not b!545275) (not b!545282) (not b!545283) (not b!545280) (not b!545279) (not b!545277) (not b!545272) (not start!49570))
(check-sat)
(get-model)

(declare-fun d!82275 () Bool)

(declare-fun res!339369 () Bool)

(declare-fun e!315243 () Bool)

(assert (=> d!82275 (=> res!339369 e!315243)))

(assert (=> d!82275 (= res!339369 (bvsge #b00000000000000000000000000000000 (size!16886 a!3154)))))

(assert (=> d!82275 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10545) e!315243)))

(declare-fun b!545373 () Bool)

(declare-fun e!315241 () Bool)

(assert (=> b!545373 (= e!315243 e!315241)))

(declare-fun res!339370 () Bool)

(assert (=> b!545373 (=> (not res!339370) (not e!315241))))

(declare-fun e!315242 () Bool)

(assert (=> b!545373 (= res!339370 (not e!315242))))

(declare-fun res!339368 () Bool)

(assert (=> b!545373 (=> (not res!339368) (not e!315242))))

(assert (=> b!545373 (= res!339368 (validKeyInArray!0 (select (arr!16522 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!545374 () Bool)

(declare-fun contains!2789 (List!10548 (_ BitVec 64)) Bool)

(assert (=> b!545374 (= e!315242 (contains!2789 Nil!10545 (select (arr!16522 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!545375 () Bool)

(declare-fun e!315240 () Bool)

(assert (=> b!545375 (= e!315241 e!315240)))

(declare-fun c!63329 () Bool)

(assert (=> b!545375 (= c!63329 (validKeyInArray!0 (select (arr!16522 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!545376 () Bool)

(declare-fun call!32118 () Bool)

(assert (=> b!545376 (= e!315240 call!32118)))

(declare-fun bm!32115 () Bool)

(assert (=> bm!32115 (= call!32118 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63329 (Cons!10544 (select (arr!16522 a!3154) #b00000000000000000000000000000000) Nil!10545) Nil!10545)))))

(declare-fun b!545377 () Bool)

(assert (=> b!545377 (= e!315240 call!32118)))

(assert (= (and d!82275 (not res!339369)) b!545373))

(assert (= (and b!545373 res!339368) b!545374))

(assert (= (and b!545373 res!339370) b!545375))

(assert (= (and b!545375 c!63329) b!545376))

(assert (= (and b!545375 (not c!63329)) b!545377))

(assert (= (or b!545376 b!545377) bm!32115))

(declare-fun m!523219 () Bool)

(assert (=> b!545373 m!523219))

(assert (=> b!545373 m!523219))

(declare-fun m!523221 () Bool)

(assert (=> b!545373 m!523221))

(assert (=> b!545374 m!523219))

(assert (=> b!545374 m!523219))

(declare-fun m!523223 () Bool)

(assert (=> b!545374 m!523223))

(assert (=> b!545375 m!523219))

(assert (=> b!545375 m!523219))

(assert (=> b!545375 m!523221))

(assert (=> bm!32115 m!523219))

(declare-fun m!523225 () Bool)

(assert (=> bm!32115 m!523225))

(assert (=> b!545272 d!82275))

(declare-fun d!82277 () Bool)

(assert (=> d!82277 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!545283 d!82277))

(declare-fun d!82279 () Bool)

(declare-fun lt!248830 () (_ BitVec 32))

(assert (=> d!82279 (and (bvsge lt!248830 #b00000000000000000000000000000000) (bvslt lt!248830 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82279 (= lt!248830 (choose!52 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(assert (=> d!82279 (validMask!0 mask!3216)))

(assert (=> d!82279 (= (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216) lt!248830)))

(declare-fun bs!17021 () Bool)

(assert (= bs!17021 d!82279))

(declare-fun m!523227 () Bool)

(assert (=> bs!17021 m!523227))

(assert (=> bs!17021 m!523141))

(assert (=> b!545274 d!82279))

(declare-fun d!82281 () Bool)

(declare-fun e!315263 () Bool)

(assert (=> d!82281 e!315263))

(declare-fun c!63337 () Bool)

(declare-fun lt!248835 () SeekEntryResult!4936)

(get-info :version)

(assert (=> d!82281 (= c!63337 (and ((_ is Intermediate!4936) lt!248835) (undefined!5748 lt!248835)))))

(declare-fun e!315264 () SeekEntryResult!4936)

(assert (=> d!82281 (= lt!248835 e!315264)))

(declare-fun c!63338 () Bool)

(assert (=> d!82281 (= c!63338 (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b01111111111111111111111111111110))))

(declare-fun lt!248836 () (_ BitVec 64))

(assert (=> d!82281 (= lt!248836 (select (arr!16522 a!3154) lt!248803))))

(assert (=> d!82281 (validMask!0 mask!3216)))

(assert (=> d!82281 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248803 (select (arr!16522 a!3154) j!147) a!3154 mask!3216) lt!248835)))

(declare-fun b!545402 () Bool)

(declare-fun e!315261 () Bool)

(assert (=> b!545402 (= e!315263 e!315261)))

(declare-fun res!339385 () Bool)

(assert (=> b!545402 (= res!339385 (and ((_ is Intermediate!4936) lt!248835) (not (undefined!5748 lt!248835)) (bvslt (x!51042 lt!248835) #b01111111111111111111111111111110) (bvsge (x!51042 lt!248835) #b00000000000000000000000000000000) (bvsge (x!51042 lt!248835) (bvadd #b00000000000000000000000000000001 x!1030))))))

(assert (=> b!545402 (=> (not res!339385) (not e!315261))))

(declare-fun b!545403 () Bool)

(assert (=> b!545403 (and (bvsge (index!21970 lt!248835) #b00000000000000000000000000000000) (bvslt (index!21970 lt!248835) (size!16886 a!3154)))))

(declare-fun res!339384 () Bool)

(assert (=> b!545403 (= res!339384 (= (select (arr!16522 a!3154) (index!21970 lt!248835)) (select (arr!16522 a!3154) j!147)))))

(declare-fun e!315260 () Bool)

(assert (=> b!545403 (=> res!339384 e!315260)))

(assert (=> b!545403 (= e!315261 e!315260)))

(declare-fun b!545404 () Bool)

(assert (=> b!545404 (= e!315263 (bvsge (x!51042 lt!248835) #b01111111111111111111111111111110))))

(declare-fun b!545405 () Bool)

(assert (=> b!545405 (and (bvsge (index!21970 lt!248835) #b00000000000000000000000000000000) (bvslt (index!21970 lt!248835) (size!16886 a!3154)))))

(assert (=> b!545405 (= e!315260 (= (select (arr!16522 a!3154) (index!21970 lt!248835)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!545406 () Bool)

(assert (=> b!545406 (and (bvsge (index!21970 lt!248835) #b00000000000000000000000000000000) (bvslt (index!21970 lt!248835) (size!16886 a!3154)))))

(declare-fun res!339383 () Bool)

(assert (=> b!545406 (= res!339383 (= (select (arr!16522 a!3154) (index!21970 lt!248835)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!545406 (=> res!339383 e!315260)))

(declare-fun b!545407 () Bool)

(assert (=> b!545407 (= e!315264 (Intermediate!4936 true lt!248803 (bvadd #b00000000000000000000000000000001 x!1030)))))

(declare-fun e!315262 () SeekEntryResult!4936)

(declare-fun b!545408 () Bool)

(assert (=> b!545408 (= e!315262 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030 #b00000000000000000000000000000001) (nextIndex!0 lt!248803 (bvadd #b00000000000000000000000000000001 x!1030 #b00000000000000000000000000000001) mask!3216) (select (arr!16522 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545409 () Bool)

(assert (=> b!545409 (= e!315262 (Intermediate!4936 false lt!248803 (bvadd #b00000000000000000000000000000001 x!1030)))))

(declare-fun b!545410 () Bool)

(assert (=> b!545410 (= e!315264 e!315262)))

(declare-fun c!63336 () Bool)

(assert (=> b!545410 (= c!63336 (or (= lt!248836 (select (arr!16522 a!3154) j!147)) (= (bvadd lt!248836 lt!248836) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!82281 c!63338) b!545407))

(assert (= (and d!82281 (not c!63338)) b!545410))

(assert (= (and b!545410 c!63336) b!545409))

(assert (= (and b!545410 (not c!63336)) b!545408))

(assert (= (and d!82281 c!63337) b!545404))

(assert (= (and d!82281 (not c!63337)) b!545402))

(assert (= (and b!545402 res!339385) b!545403))

(assert (= (and b!545403 (not res!339384)) b!545406))

(assert (= (and b!545406 (not res!339383)) b!545405))

(declare-fun m!523233 () Bool)

(assert (=> b!545408 m!523233))

(assert (=> b!545408 m!523233))

(assert (=> b!545408 m!523125))

(declare-fun m!523235 () Bool)

(assert (=> b!545408 m!523235))

(declare-fun m!523237 () Bool)

(assert (=> b!545403 m!523237))

(declare-fun m!523239 () Bool)

(assert (=> d!82281 m!523239))

(assert (=> d!82281 m!523141))

(assert (=> b!545405 m!523237))

(assert (=> b!545406 m!523237))

(assert (=> b!545284 d!82281))

(declare-fun d!82287 () Bool)

(declare-fun e!315268 () Bool)

(assert (=> d!82287 e!315268))

(declare-fun c!63340 () Bool)

(declare-fun lt!248837 () SeekEntryResult!4936)

(assert (=> d!82287 (= c!63340 (and ((_ is Intermediate!4936) lt!248837) (undefined!5748 lt!248837)))))

(declare-fun e!315269 () SeekEntryResult!4936)

(assert (=> d!82287 (= lt!248837 e!315269)))

(declare-fun c!63341 () Bool)

(assert (=> d!82287 (= c!63341 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!248838 () (_ BitVec 64))

(assert (=> d!82287 (= lt!248838 (select (arr!16522 a!3154) index!1177))))

(assert (=> d!82287 (validMask!0 mask!3216)))

(assert (=> d!82287 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16522 a!3154) j!147) a!3154 mask!3216) lt!248837)))

(declare-fun b!545411 () Bool)

(declare-fun e!315266 () Bool)

(assert (=> b!545411 (= e!315268 e!315266)))

(declare-fun res!339388 () Bool)

(assert (=> b!545411 (= res!339388 (and ((_ is Intermediate!4936) lt!248837) (not (undefined!5748 lt!248837)) (bvslt (x!51042 lt!248837) #b01111111111111111111111111111110) (bvsge (x!51042 lt!248837) #b00000000000000000000000000000000) (bvsge (x!51042 lt!248837) x!1030)))))

(assert (=> b!545411 (=> (not res!339388) (not e!315266))))

(declare-fun b!545412 () Bool)

(assert (=> b!545412 (and (bvsge (index!21970 lt!248837) #b00000000000000000000000000000000) (bvslt (index!21970 lt!248837) (size!16886 a!3154)))))

(declare-fun res!339387 () Bool)

(assert (=> b!545412 (= res!339387 (= (select (arr!16522 a!3154) (index!21970 lt!248837)) (select (arr!16522 a!3154) j!147)))))

(declare-fun e!315265 () Bool)

(assert (=> b!545412 (=> res!339387 e!315265)))

(assert (=> b!545412 (= e!315266 e!315265)))

(declare-fun b!545413 () Bool)

(assert (=> b!545413 (= e!315268 (bvsge (x!51042 lt!248837) #b01111111111111111111111111111110))))

(declare-fun b!545414 () Bool)

(assert (=> b!545414 (and (bvsge (index!21970 lt!248837) #b00000000000000000000000000000000) (bvslt (index!21970 lt!248837) (size!16886 a!3154)))))

(assert (=> b!545414 (= e!315265 (= (select (arr!16522 a!3154) (index!21970 lt!248837)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!545415 () Bool)

(assert (=> b!545415 (and (bvsge (index!21970 lt!248837) #b00000000000000000000000000000000) (bvslt (index!21970 lt!248837) (size!16886 a!3154)))))

(declare-fun res!339386 () Bool)

(assert (=> b!545415 (= res!339386 (= (select (arr!16522 a!3154) (index!21970 lt!248837)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!545415 (=> res!339386 e!315265)))

(declare-fun b!545416 () Bool)

(assert (=> b!545416 (= e!315269 (Intermediate!4936 true index!1177 x!1030))))

(declare-fun e!315267 () SeekEntryResult!4936)

(declare-fun b!545417 () Bool)

(assert (=> b!545417 (= e!315267 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 (bvadd x!1030 #b00000000000000000000000000000001) mask!3216) (select (arr!16522 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545418 () Bool)

(assert (=> b!545418 (= e!315267 (Intermediate!4936 false index!1177 x!1030))))

(declare-fun b!545419 () Bool)

(assert (=> b!545419 (= e!315269 e!315267)))

(declare-fun c!63339 () Bool)

(assert (=> b!545419 (= c!63339 (or (= lt!248838 (select (arr!16522 a!3154) j!147)) (= (bvadd lt!248838 lt!248838) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!82287 c!63341) b!545416))

(assert (= (and d!82287 (not c!63341)) b!545419))

(assert (= (and b!545419 c!63339) b!545418))

(assert (= (and b!545419 (not c!63339)) b!545417))

(assert (= (and d!82287 c!63340) b!545413))

(assert (= (and d!82287 (not c!63340)) b!545411))

(assert (= (and b!545411 res!339388) b!545412))

(assert (= (and b!545412 (not res!339387)) b!545415))

(assert (= (and b!545415 (not res!339386)) b!545414))

(declare-fun m!523241 () Bool)

(assert (=> b!545417 m!523241))

(assert (=> b!545417 m!523241))

(assert (=> b!545417 m!523125))

(declare-fun m!523243 () Bool)

(assert (=> b!545417 m!523243))

(declare-fun m!523245 () Bool)

(assert (=> b!545412 m!523245))

(assert (=> d!82287 m!523129))

(assert (=> d!82287 m!523141))

(assert (=> b!545414 m!523245))

(assert (=> b!545415 m!523245))

(assert (=> b!545279 d!82287))

(declare-fun b!545487 () Bool)

(declare-fun e!315311 () SeekEntryResult!4936)

(declare-fun lt!248855 () SeekEntryResult!4936)

(assert (=> b!545487 (= e!315311 (Found!4936 (index!21970 lt!248855)))))

(declare-fun d!82291 () Bool)

(declare-fun lt!248857 () SeekEntryResult!4936)

(assert (=> d!82291 (and (or ((_ is Undefined!4936) lt!248857) (not ((_ is Found!4936) lt!248857)) (and (bvsge (index!21969 lt!248857) #b00000000000000000000000000000000) (bvslt (index!21969 lt!248857) (size!16886 a!3154)))) (or ((_ is Undefined!4936) lt!248857) ((_ is Found!4936) lt!248857) (not ((_ is MissingZero!4936) lt!248857)) (and (bvsge (index!21968 lt!248857) #b00000000000000000000000000000000) (bvslt (index!21968 lt!248857) (size!16886 a!3154)))) (or ((_ is Undefined!4936) lt!248857) ((_ is Found!4936) lt!248857) ((_ is MissingZero!4936) lt!248857) (not ((_ is MissingVacant!4936) lt!248857)) (and (bvsge (index!21971 lt!248857) #b00000000000000000000000000000000) (bvslt (index!21971 lt!248857) (size!16886 a!3154)))) (or ((_ is Undefined!4936) lt!248857) (ite ((_ is Found!4936) lt!248857) (= (select (arr!16522 a!3154) (index!21969 lt!248857)) k0!1998) (ite ((_ is MissingZero!4936) lt!248857) (= (select (arr!16522 a!3154) (index!21968 lt!248857)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4936) lt!248857) (= (select (arr!16522 a!3154) (index!21971 lt!248857)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!315309 () SeekEntryResult!4936)

(assert (=> d!82291 (= lt!248857 e!315309)))

(declare-fun c!63365 () Bool)

(assert (=> d!82291 (= c!63365 (and ((_ is Intermediate!4936) lt!248855) (undefined!5748 lt!248855)))))

(assert (=> d!82291 (= lt!248855 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!82291 (validMask!0 mask!3216)))

(assert (=> d!82291 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!248857)))

(declare-fun b!545488 () Bool)

(assert (=> b!545488 (= e!315309 e!315311)))

(declare-fun lt!248856 () (_ BitVec 64))

(assert (=> b!545488 (= lt!248856 (select (arr!16522 a!3154) (index!21970 lt!248855)))))

(declare-fun c!63366 () Bool)

(assert (=> b!545488 (= c!63366 (= lt!248856 k0!1998))))

(declare-fun b!545489 () Bool)

(declare-fun e!315310 () SeekEntryResult!4936)

(assert (=> b!545489 (= e!315310 (MissingZero!4936 (index!21970 lt!248855)))))

(declare-fun b!545490 () Bool)

(declare-fun c!63367 () Bool)

(assert (=> b!545490 (= c!63367 (= lt!248856 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!545490 (= e!315311 e!315310)))

(declare-fun b!545491 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34388 (_ BitVec 32)) SeekEntryResult!4936)

(assert (=> b!545491 (= e!315310 (seekKeyOrZeroReturnVacant!0 (x!51042 lt!248855) (index!21970 lt!248855) (index!21970 lt!248855) k0!1998 a!3154 mask!3216))))

(declare-fun b!545492 () Bool)

(assert (=> b!545492 (= e!315309 Undefined!4936)))

(assert (= (and d!82291 c!63365) b!545492))

(assert (= (and d!82291 (not c!63365)) b!545488))

(assert (= (and b!545488 c!63366) b!545487))

(assert (= (and b!545488 (not c!63366)) b!545490))

(assert (= (and b!545490 c!63367) b!545489))

(assert (= (and b!545490 (not c!63367)) b!545491))

(declare-fun m!523253 () Bool)

(assert (=> d!82291 m!523253))

(declare-fun m!523255 () Bool)

(assert (=> d!82291 m!523255))

(declare-fun m!523257 () Bool)

(assert (=> d!82291 m!523257))

(declare-fun m!523259 () Bool)

(assert (=> d!82291 m!523259))

(assert (=> d!82291 m!523141))

(assert (=> d!82291 m!523257))

(declare-fun m!523261 () Bool)

(assert (=> d!82291 m!523261))

(declare-fun m!523263 () Bool)

(assert (=> b!545488 m!523263))

(declare-fun m!523265 () Bool)

(assert (=> b!545491 m!523265))

(assert (=> b!545281 d!82291))

(declare-fun d!82297 () Bool)

(declare-fun e!315320 () Bool)

(assert (=> d!82297 e!315320))

(declare-fun c!63372 () Bool)

(declare-fun lt!248860 () SeekEntryResult!4936)

(assert (=> d!82297 (= c!63372 (and ((_ is Intermediate!4936) lt!248860) (undefined!5748 lt!248860)))))

(declare-fun e!315321 () SeekEntryResult!4936)

(assert (=> d!82297 (= lt!248860 e!315321)))

(declare-fun c!63373 () Bool)

(assert (=> d!82297 (= c!63373 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!248861 () (_ BitVec 64))

(assert (=> d!82297 (= lt!248861 (select (arr!16522 a!3154) (toIndex!0 (select (arr!16522 a!3154) j!147) mask!3216)))))

(assert (=> d!82297 (validMask!0 mask!3216)))

(assert (=> d!82297 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16522 a!3154) j!147) mask!3216) (select (arr!16522 a!3154) j!147) a!3154 mask!3216) lt!248860)))

(declare-fun b!545502 () Bool)

(declare-fun e!315318 () Bool)

(assert (=> b!545502 (= e!315320 e!315318)))

(declare-fun res!339415 () Bool)

(assert (=> b!545502 (= res!339415 (and ((_ is Intermediate!4936) lt!248860) (not (undefined!5748 lt!248860)) (bvslt (x!51042 lt!248860) #b01111111111111111111111111111110) (bvsge (x!51042 lt!248860) #b00000000000000000000000000000000) (bvsge (x!51042 lt!248860) #b00000000000000000000000000000000)))))

(assert (=> b!545502 (=> (not res!339415) (not e!315318))))

(declare-fun b!545503 () Bool)

(assert (=> b!545503 (and (bvsge (index!21970 lt!248860) #b00000000000000000000000000000000) (bvslt (index!21970 lt!248860) (size!16886 a!3154)))))

(declare-fun res!339414 () Bool)

(assert (=> b!545503 (= res!339414 (= (select (arr!16522 a!3154) (index!21970 lt!248860)) (select (arr!16522 a!3154) j!147)))))

(declare-fun e!315317 () Bool)

(assert (=> b!545503 (=> res!339414 e!315317)))

(assert (=> b!545503 (= e!315318 e!315317)))

(declare-fun b!545504 () Bool)

(assert (=> b!545504 (= e!315320 (bvsge (x!51042 lt!248860) #b01111111111111111111111111111110))))

(declare-fun b!545505 () Bool)

(assert (=> b!545505 (and (bvsge (index!21970 lt!248860) #b00000000000000000000000000000000) (bvslt (index!21970 lt!248860) (size!16886 a!3154)))))

(assert (=> b!545505 (= e!315317 (= (select (arr!16522 a!3154) (index!21970 lt!248860)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!545506 () Bool)

(assert (=> b!545506 (and (bvsge (index!21970 lt!248860) #b00000000000000000000000000000000) (bvslt (index!21970 lt!248860) (size!16886 a!3154)))))

(declare-fun res!339413 () Bool)

(assert (=> b!545506 (= res!339413 (= (select (arr!16522 a!3154) (index!21970 lt!248860)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!545506 (=> res!339413 e!315317)))

(declare-fun b!545507 () Bool)

(assert (=> b!545507 (= e!315321 (Intermediate!4936 true (toIndex!0 (select (arr!16522 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun e!315319 () SeekEntryResult!4936)

(declare-fun b!545508 () Bool)

(assert (=> b!545508 (= e!315319 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16522 a!3154) j!147) mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3216) (select (arr!16522 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545509 () Bool)

(assert (=> b!545509 (= e!315319 (Intermediate!4936 false (toIndex!0 (select (arr!16522 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!545510 () Bool)

(assert (=> b!545510 (= e!315321 e!315319)))

(declare-fun c!63371 () Bool)

(assert (=> b!545510 (= c!63371 (or (= lt!248861 (select (arr!16522 a!3154) j!147)) (= (bvadd lt!248861 lt!248861) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!82297 c!63373) b!545507))

(assert (= (and d!82297 (not c!63373)) b!545510))

(assert (= (and b!545510 c!63371) b!545509))

(assert (= (and b!545510 (not c!63371)) b!545508))

(assert (= (and d!82297 c!63372) b!545504))

(assert (= (and d!82297 (not c!63372)) b!545502))

(assert (= (and b!545502 res!339415) b!545503))

(assert (= (and b!545503 (not res!339414)) b!545506))

(assert (= (and b!545506 (not res!339413)) b!545505))

(assert (=> b!545508 m!523151))

(declare-fun m!523273 () Bool)

(assert (=> b!545508 m!523273))

(assert (=> b!545508 m!523273))

(assert (=> b!545508 m!523125))

(declare-fun m!523275 () Bool)

(assert (=> b!545508 m!523275))

(declare-fun m!523277 () Bool)

(assert (=> b!545503 m!523277))

(assert (=> d!82297 m!523151))

(declare-fun m!523279 () Bool)

(assert (=> d!82297 m!523279))

(assert (=> d!82297 m!523141))

(assert (=> b!545505 m!523277))

(assert (=> b!545506 m!523277))

(assert (=> b!545280 d!82297))

(declare-fun d!82301 () Bool)

(declare-fun lt!248872 () (_ BitVec 32))

(declare-fun lt!248871 () (_ BitVec 32))

(assert (=> d!82301 (= lt!248872 (bvmul (bvxor lt!248871 (bvlshr lt!248871 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82301 (= lt!248871 ((_ extract 31 0) (bvand (bvxor (select (arr!16522 a!3154) j!147) (bvlshr (select (arr!16522 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82301 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!339419 (let ((h!11511 ((_ extract 31 0) (bvand (bvxor (select (arr!16522 a!3154) j!147) (bvlshr (select (arr!16522 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51049 (bvmul (bvxor h!11511 (bvlshr h!11511 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51049 (bvlshr x!51049 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!339419 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!339419 #b00000000000000000000000000000000))))))

(assert (=> d!82301 (= (toIndex!0 (select (arr!16522 a!3154) j!147) mask!3216) (bvand (bvxor lt!248872 (bvlshr lt!248872 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!545280 d!82301))

(declare-fun d!82311 () Bool)

(declare-fun res!339428 () Bool)

(declare-fun e!315335 () Bool)

(assert (=> d!82311 (=> res!339428 e!315335)))

(assert (=> d!82311 (= res!339428 (= (select (arr!16522 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!82311 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!315335)))

(declare-fun b!545529 () Bool)

(declare-fun e!315336 () Bool)

(assert (=> b!545529 (= e!315335 e!315336)))

(declare-fun res!339429 () Bool)

(assert (=> b!545529 (=> (not res!339429) (not e!315336))))

(assert (=> b!545529 (= res!339429 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16886 a!3154)))))

(declare-fun b!545530 () Bool)

(assert (=> b!545530 (= e!315336 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82311 (not res!339428)) b!545529))

(assert (= (and b!545529 res!339429) b!545530))

(assert (=> d!82311 m!523219))

(declare-fun m!523297 () Bool)

(assert (=> b!545530 m!523297))

(assert (=> b!545275 d!82311))

(declare-fun d!82313 () Bool)

(assert (=> d!82313 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49570 d!82313))

(declare-fun d!82317 () Bool)

(assert (=> d!82317 (= (array_inv!12381 a!3154) (bvsge (size!16886 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49570 d!82317))

(declare-fun b!545569 () Bool)

(declare-fun e!315358 () Bool)

(declare-fun e!315360 () Bool)

(assert (=> b!545569 (= e!315358 e!315360)))

(declare-fun lt!248901 () (_ BitVec 64))

(assert (=> b!545569 (= lt!248901 (select (arr!16522 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16893 0))(
  ( (Unit!16894) )
))
(declare-fun lt!248900 () Unit!16893)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34388 (_ BitVec 64) (_ BitVec 32)) Unit!16893)

(assert (=> b!545569 (= lt!248900 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!248901 #b00000000000000000000000000000000))))

(assert (=> b!545569 (arrayContainsKey!0 a!3154 lt!248901 #b00000000000000000000000000000000)))

(declare-fun lt!248902 () Unit!16893)

(assert (=> b!545569 (= lt!248902 lt!248900)))

(declare-fun res!339434 () Bool)

(assert (=> b!545569 (= res!339434 (= (seekEntryOrOpen!0 (select (arr!16522 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4936 #b00000000000000000000000000000000)))))

(assert (=> b!545569 (=> (not res!339434) (not e!315360))))

(declare-fun b!545570 () Bool)

(declare-fun e!315359 () Bool)

(assert (=> b!545570 (= e!315359 e!315358)))

(declare-fun c!63395 () Bool)

(assert (=> b!545570 (= c!63395 (validKeyInArray!0 (select (arr!16522 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!82319 () Bool)

(declare-fun res!339435 () Bool)

(assert (=> d!82319 (=> res!339435 e!315359)))

(assert (=> d!82319 (= res!339435 (bvsge #b00000000000000000000000000000000 (size!16886 a!3154)))))

(assert (=> d!82319 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!315359)))

(declare-fun b!545571 () Bool)

(declare-fun call!32124 () Bool)

(assert (=> b!545571 (= e!315358 call!32124)))

(declare-fun b!545572 () Bool)

(assert (=> b!545572 (= e!315360 call!32124)))

(declare-fun bm!32121 () Bool)

(assert (=> bm!32121 (= call!32124 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(assert (= (and d!82319 (not res!339435)) b!545570))

(assert (= (and b!545570 c!63395) b!545569))

(assert (= (and b!545570 (not c!63395)) b!545571))

(assert (= (and b!545569 res!339434) b!545572))

(assert (= (or b!545572 b!545571) bm!32121))

(assert (=> b!545569 m!523219))

(declare-fun m!523313 () Bool)

(assert (=> b!545569 m!523313))

(declare-fun m!523315 () Bool)

(assert (=> b!545569 m!523315))

(assert (=> b!545569 m!523219))

(declare-fun m!523317 () Bool)

(assert (=> b!545569 m!523317))

(assert (=> b!545570 m!523219))

(assert (=> b!545570 m!523219))

(assert (=> b!545570 m!523221))

(declare-fun m!523319 () Bool)

(assert (=> bm!32121 m!523319))

(assert (=> b!545282 d!82319))

(declare-fun d!82323 () Bool)

(assert (=> d!82323 (= (validKeyInArray!0 (select (arr!16522 a!3154) j!147)) (and (not (= (select (arr!16522 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16522 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!545277 d!82323))

(check-sat (not b!545417) (not bm!32121) (not b!545530) (not d!82281) (not b!545374) (not b!545570) (not d!82279) (not d!82297) (not b!545373) (not b!545508) (not b!545375) (not b!545491) (not bm!32115) (not d!82287) (not b!545408) (not b!545569) (not d!82291))
(check-sat)
