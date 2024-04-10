; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128424 () Bool)

(assert start!128424)

(declare-fun b!1506236 () Bool)

(declare-fun res!1026592 () Bool)

(declare-fun e!841810 () Bool)

(assert (=> b!1506236 (=> (not res!1026592) (not e!841810))))

(declare-datatypes ((array!100469 0))(
  ( (array!100470 (arr!48479 (Array (_ BitVec 32) (_ BitVec 64))) (size!49029 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100469)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506236 (= res!1026592 (validKeyInArray!0 (select (arr!48479 a!2804) j!70)))))

(declare-fun res!1026596 () Bool)

(assert (=> start!128424 (=> (not res!1026596) (not e!841810))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128424 (= res!1026596 (validMask!0 mask!2512))))

(assert (=> start!128424 e!841810))

(assert (=> start!128424 true))

(declare-fun array_inv!37507 (array!100469) Bool)

(assert (=> start!128424 (array_inv!37507 a!2804)))

(declare-fun b!1506237 () Bool)

(declare-fun res!1026594 () Bool)

(assert (=> b!1506237 (=> (not res!1026594) (not e!841810))))

(declare-datatypes ((List!34962 0))(
  ( (Nil!34959) (Cons!34958 (h!36355 (_ BitVec 64)) (t!49656 List!34962)) )
))
(declare-fun arrayNoDuplicates!0 (array!100469 (_ BitVec 32) List!34962) Bool)

(assert (=> b!1506237 (= res!1026594 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34959))))

(declare-fun b!1506238 () Bool)

(declare-fun res!1026598 () Bool)

(assert (=> b!1506238 (=> (not res!1026598) (not e!841810))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506238 (= res!1026598 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49029 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49029 a!2804))))))

(declare-fun b!1506239 () Bool)

(declare-fun res!1026593 () Bool)

(assert (=> b!1506239 (=> (not res!1026593) (not e!841810))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1506239 (= res!1026593 (validKeyInArray!0 (select (arr!48479 a!2804) i!961)))))

(declare-fun b!1506240 () Bool)

(declare-fun res!1026597 () Bool)

(assert (=> b!1506240 (=> (not res!1026597) (not e!841810))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100469 (_ BitVec 32)) Bool)

(assert (=> b!1506240 (= res!1026597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506241 () Bool)

(declare-fun res!1026595 () Bool)

(assert (=> b!1506241 (=> (not res!1026595) (not e!841810))))

(assert (=> b!1506241 (= res!1026595 (and (= (size!49029 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49029 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49029 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506242 () Bool)

(declare-fun lt!654172 () (_ BitVec 32))

(assert (=> b!1506242 (= e!841810 (and (bvsge mask!2512 #b00000000000000000000000000000000) (or (bvslt lt!654172 #b00000000000000000000000000000000) (bvsge lt!654172 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506242 (= lt!654172 (toIndex!0 (select (arr!48479 a!2804) j!70) mask!2512))))

(assert (= (and start!128424 res!1026596) b!1506241))

(assert (= (and b!1506241 res!1026595) b!1506239))

(assert (= (and b!1506239 res!1026593) b!1506236))

(assert (= (and b!1506236 res!1026592) b!1506240))

(assert (= (and b!1506240 res!1026597) b!1506237))

(assert (= (and b!1506237 res!1026594) b!1506238))

(assert (= (and b!1506238 res!1026598) b!1506242))

(declare-fun m!1389229 () Bool)

(assert (=> b!1506242 m!1389229))

(assert (=> b!1506242 m!1389229))

(declare-fun m!1389231 () Bool)

(assert (=> b!1506242 m!1389231))

(declare-fun m!1389233 () Bool)

(assert (=> b!1506240 m!1389233))

(declare-fun m!1389235 () Bool)

(assert (=> start!128424 m!1389235))

(declare-fun m!1389237 () Bool)

(assert (=> start!128424 m!1389237))

(declare-fun m!1389239 () Bool)

(assert (=> b!1506237 m!1389239))

(assert (=> b!1506236 m!1389229))

(assert (=> b!1506236 m!1389229))

(declare-fun m!1389241 () Bool)

(assert (=> b!1506236 m!1389241))

(declare-fun m!1389243 () Bool)

(assert (=> b!1506239 m!1389243))

(assert (=> b!1506239 m!1389243))

(declare-fun m!1389245 () Bool)

(assert (=> b!1506239 m!1389245))

(push 1)

(assert (not b!1506240))

(assert (not b!1506237))

(assert (not b!1506239))

(assert (not start!128424))

(assert (not b!1506236))

(assert (not b!1506242))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!158201 () Bool)

(assert (=> d!158201 (= (validKeyInArray!0 (select (arr!48479 a!2804) j!70)) (and (not (= (select (arr!48479 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48479 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1506236 d!158201))

(declare-fun bm!68225 () Bool)

(declare-fun call!68228 () Bool)

(declare-fun c!139363 () Bool)

(assert (=> bm!68225 (= call!68228 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139363 (Cons!34958 (select (arr!48479 a!2804) #b00000000000000000000000000000000) Nil!34959) Nil!34959)))))

(declare-fun b!1506318 () Bool)

(declare-fun e!841851 () Bool)

(declare-fun contains!9964 (List!34962 (_ BitVec 64)) Bool)

(assert (=> b!1506318 (= e!841851 (contains!9964 Nil!34959 (select (arr!48479 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1506319 () Bool)

(declare-fun e!841852 () Bool)

(assert (=> b!1506319 (= e!841852 call!68228)))

(declare-fun b!1506320 () Bool)

(declare-fun e!841849 () Bool)

(assert (=> b!1506320 (= e!841849 e!841852)))

(assert (=> b!1506320 (= c!139363 (validKeyInArray!0 (select (arr!48479 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1506321 () Bool)

(declare-fun e!841850 () Bool)

(assert (=> b!1506321 (= e!841850 e!841849)))

(declare-fun res!1026660 () Bool)

(assert (=> b!1506321 (=> (not res!1026660) (not e!841849))))

(assert (=> b!1506321 (= res!1026660 (not e!841851))))

(declare-fun res!1026662 () Bool)

(assert (=> b!1506321 (=> (not res!1026662) (not e!841851))))

(assert (=> b!1506321 (= res!1026662 (validKeyInArray!0 (select (arr!48479 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!158203 () Bool)

(declare-fun res!1026661 () Bool)

(assert (=> d!158203 (=> res!1026661 e!841850)))

(assert (=> d!158203 (= res!1026661 (bvsge #b00000000000000000000000000000000 (size!49029 a!2804)))))

(assert (=> d!158203 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34959) e!841850)))

(declare-fun b!1506322 () Bool)

(assert (=> b!1506322 (= e!841852 call!68228)))

(assert (= (and d!158203 (not res!1026661)) b!1506321))

(assert (= (and b!1506321 res!1026662) b!1506318))

(assert (= (and b!1506321 res!1026660) b!1506320))

(assert (= (and b!1506320 c!139363) b!1506322))

(assert (= (and b!1506320 (not c!139363)) b!1506319))

(assert (= (or b!1506322 b!1506319) bm!68225))

(declare-fun m!1389291 () Bool)

(assert (=> bm!68225 m!1389291))

(declare-fun m!1389293 () Bool)

(assert (=> bm!68225 m!1389293))

(assert (=> b!1506318 m!1389291))

(assert (=> b!1506318 m!1389291))

(declare-fun m!1389295 () Bool)

(assert (=> b!1506318 m!1389295))

(assert (=> b!1506320 m!1389291))

(assert (=> b!1506320 m!1389291))

(declare-fun m!1389297 () Bool)

(assert (=> b!1506320 m!1389297))

(assert (=> b!1506321 m!1389291))

(assert (=> b!1506321 m!1389291))

(assert (=> b!1506321 m!1389297))

(assert (=> b!1506237 d!158203))

(declare-fun d!158209 () Bool)

(declare-fun lt!654193 () (_ BitVec 32))

(declare-fun lt!654192 () (_ BitVec 32))

(assert (=> d!158209 (= lt!654193 (bvmul (bvxor lt!654192 (bvlshr lt!654192 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158209 (= lt!654192 ((_ extract 31 0) (bvand (bvxor (select (arr!48479 a!2804) j!70) (bvlshr (select (arr!48479 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158209 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1026665 (let ((h!36358 ((_ extract 31 0) (bvand (bvxor (select (arr!48479 a!2804) j!70) (bvlshr (select (arr!48479 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!134763 (bvmul (bvxor h!36358 (bvlshr h!36358 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!134763 (bvlshr x!134763 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1026665 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1026665 #b00000000000000000000000000000000))))))

(assert (=> d!158209 (= (toIndex!0 (select (arr!48479 a!2804) j!70) mask!2512) (bvand (bvxor lt!654193 (bvlshr lt!654193 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1506242 d!158209))

(declare-fun b!1506341 () Bool)

(declare-fun e!841868 () Bool)

(declare-fun call!68232 () Bool)

(assert (=> b!1506341 (= e!841868 call!68232)))

(declare-fun b!1506342 () Bool)

(declare-fun e!841869 () Bool)

(declare-fun e!841870 () Bool)

(assert (=> b!1506342 (= e!841869 e!841870)))

(declare-fun c!139369 () Bool)

(assert (=> b!1506342 (= c!139369 (validKeyInArray!0 (select (arr!48479 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68229 () Bool)

(assert (=> bm!68229 (= call!68232 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!158213 () Bool)

(declare-fun res!1026675 () Bool)

(assert (=> d!158213 (=> res!1026675 e!841869)))

(assert (=> d!158213 (= res!1026675 (bvsge #b00000000000000000000000000000000 (size!49029 a!2804)))))

(assert (=> d!158213 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!841869)))

(declare-fun b!1506343 () Bool)

(assert (=> b!1506343 (= e!841870 call!68232)))

(declare-fun b!1506344 () Bool)

(assert (=> b!1506344 (= e!841870 e!841868)))

(declare-fun lt!654210 () (_ BitVec 64))

(assert (=> b!1506344 (= lt!654210 (select (arr!48479 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50322 0))(
  ( (Unit!50323) )
))
(declare-fun lt!654211 () Unit!50322)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100469 (_ BitVec 64) (_ BitVec 32)) Unit!50322)

(assert (=> b!1506344 (= lt!654211 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654210 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1506344 (arrayContainsKey!0 a!2804 lt!654210 #b00000000000000000000000000000000)))

(declare-fun lt!654212 () Unit!50322)

(assert (=> b!1506344 (= lt!654212 lt!654211)))

(declare-fun res!1026676 () Bool)

(declare-datatypes ((SeekEntryResult!12658 0))(
  ( (MissingZero!12658 (index!53027 (_ BitVec 32))) (Found!12658 (index!53028 (_ BitVec 32))) (Intermediate!12658 (undefined!13470 Bool) (index!53029 (_ BitVec 32)) (x!134768 (_ BitVec 32))) (Undefined!12658) (MissingVacant!12658 (index!53030 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100469 (_ BitVec 32)) SeekEntryResult!12658)

(assert (=> b!1506344 (= res!1026676 (= (seekEntryOrOpen!0 (select (arr!48479 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12658 #b00000000000000000000000000000000)))))

(assert (=> b!1506344 (=> (not res!1026676) (not e!841868))))

(assert (= (and d!158213 (not res!1026675)) b!1506342))

(assert (= (and b!1506342 c!139369) b!1506344))

(assert (= (and b!1506342 (not c!139369)) b!1506343))

(assert (= (and b!1506344 res!1026676) b!1506341))

(assert (= (or b!1506341 b!1506343) bm!68229))

(assert (=> b!1506342 m!1389291))

(assert (=> b!1506342 m!1389291))

(assert (=> b!1506342 m!1389297))

(declare-fun m!1389307 () Bool)

(assert (=> bm!68229 m!1389307))

(assert (=> b!1506344 m!1389291))

(declare-fun m!1389309 () Bool)

(assert (=> b!1506344 m!1389309))

(declare-fun m!1389311 () Bool)

(assert (=> b!1506344 m!1389311))

(assert (=> b!1506344 m!1389291))

(declare-fun m!1389313 () Bool)

(assert (=> b!1506344 m!1389313))

(assert (=> b!1506240 d!158213))

(declare-fun d!158225 () Bool)

(assert (=> d!158225 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128424 d!158225))

(declare-fun d!158231 () Bool)

(assert (=> d!158231 (= (array_inv!37507 a!2804) (bvsge (size!49029 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128424 d!158231))

(declare-fun d!158233 () Bool)

(assert (=> d!158233 (= (validKeyInArray!0 (select (arr!48479 a!2804) i!961)) (and (not (= (select (arr!48479 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48479 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1506239 d!158233))

(push 1)

(assert (not b!1506321))

(assert (not b!1506318))

(assert (not b!1506344))

(assert (not b!1506342))

(assert (not bm!68225))

(assert (not bm!68229))

(assert (not b!1506320))

(check-sat)

