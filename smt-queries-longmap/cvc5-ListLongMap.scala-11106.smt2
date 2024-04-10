; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129658 () Bool)

(assert start!129658)

(declare-fun b!1522220 () Bool)

(declare-fun res!1041447 () Bool)

(declare-fun e!848779 () Bool)

(assert (=> b!1522220 (=> (not res!1041447) (not e!848779))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((array!101333 0))(
  ( (array!101334 (arr!48899 (Array (_ BitVec 32) (_ BitVec 64))) (size!49449 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101333)

(assert (=> b!1522220 (= res!1041447 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49449 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49449 a!2804))))))

(declare-fun res!1041449 () Bool)

(assert (=> start!129658 (=> (not res!1041449) (not e!848779))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129658 (= res!1041449 (validMask!0 mask!2512))))

(assert (=> start!129658 e!848779))

(assert (=> start!129658 true))

(declare-fun array_inv!37927 (array!101333) Bool)

(assert (=> start!129658 (array_inv!37927 a!2804)))

(declare-fun b!1522221 () Bool)

(declare-fun res!1041450 () Bool)

(declare-fun e!848778 () Bool)

(assert (=> b!1522221 (=> (not res!1041450) (not e!848778))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13064 0))(
  ( (MissingZero!13064 (index!54651 (_ BitVec 32))) (Found!13064 (index!54652 (_ BitVec 32))) (Intermediate!13064 (undefined!13876 Bool) (index!54653 (_ BitVec 32)) (x!136340 (_ BitVec 32))) (Undefined!13064) (MissingVacant!13064 (index!54654 (_ BitVec 32))) )
))
(declare-fun lt!659529 () SeekEntryResult!13064)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101333 (_ BitVec 32)) SeekEntryResult!13064)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522221 (= res!1041450 (= lt!659529 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101334 (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804)) mask!2512)))))

(declare-fun b!1522222 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101333 (_ BitVec 32)) SeekEntryResult!13064)

(assert (=> b!1522222 (= e!848778 (not (= (seekEntry!0 (select (arr!48899 a!2804) j!70) a!2804 mask!2512) (Found!13064 j!70))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101333 (_ BitVec 32)) Bool)

(assert (=> b!1522222 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-datatypes ((Unit!50912 0))(
  ( (Unit!50913) )
))
(declare-fun lt!659528 () Unit!50912)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101333 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50912)

(assert (=> b!1522222 (= lt!659528 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1522223 () Bool)

(declare-fun res!1041442 () Bool)

(assert (=> b!1522223 (=> (not res!1041442) (not e!848778))))

(declare-fun lt!659530 () SeekEntryResult!13064)

(assert (=> b!1522223 (= res!1041442 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48899 a!2804) j!70) a!2804 mask!2512) lt!659530))))

(declare-fun b!1522224 () Bool)

(declare-fun res!1041451 () Bool)

(assert (=> b!1522224 (=> (not res!1041451) (not e!848779))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1522224 (= res!1041451 (validKeyInArray!0 (select (arr!48899 a!2804) j!70)))))

(declare-fun b!1522225 () Bool)

(assert (=> b!1522225 (= e!848779 e!848778)))

(declare-fun res!1041445 () Bool)

(assert (=> b!1522225 (=> (not res!1041445) (not e!848778))))

(assert (=> b!1522225 (= res!1041445 (= lt!659529 lt!659530))))

(assert (=> b!1522225 (= lt!659530 (Intermediate!13064 false resIndex!21 resX!21))))

(assert (=> b!1522225 (= lt!659529 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48899 a!2804) j!70) mask!2512) (select (arr!48899 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522226 () Bool)

(declare-fun res!1041444 () Bool)

(assert (=> b!1522226 (=> (not res!1041444) (not e!848779))))

(assert (=> b!1522226 (= res!1041444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1522227 () Bool)

(declare-fun res!1041448 () Bool)

(assert (=> b!1522227 (=> (not res!1041448) (not e!848779))))

(declare-datatypes ((List!35382 0))(
  ( (Nil!35379) (Cons!35378 (h!36799 (_ BitVec 64)) (t!50076 List!35382)) )
))
(declare-fun arrayNoDuplicates!0 (array!101333 (_ BitVec 32) List!35382) Bool)

(assert (=> b!1522227 (= res!1041448 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35379))))

(declare-fun b!1522228 () Bool)

(declare-fun res!1041443 () Bool)

(assert (=> b!1522228 (=> (not res!1041443) (not e!848779))))

(assert (=> b!1522228 (= res!1041443 (validKeyInArray!0 (select (arr!48899 a!2804) i!961)))))

(declare-fun b!1522229 () Bool)

(declare-fun res!1041446 () Bool)

(assert (=> b!1522229 (=> (not res!1041446) (not e!848779))))

(assert (=> b!1522229 (= res!1041446 (and (= (size!49449 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49449 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49449 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129658 res!1041449) b!1522229))

(assert (= (and b!1522229 res!1041446) b!1522228))

(assert (= (and b!1522228 res!1041443) b!1522224))

(assert (= (and b!1522224 res!1041451) b!1522226))

(assert (= (and b!1522226 res!1041444) b!1522227))

(assert (= (and b!1522227 res!1041448) b!1522220))

(assert (= (and b!1522220 res!1041447) b!1522225))

(assert (= (and b!1522225 res!1041445) b!1522223))

(assert (= (and b!1522223 res!1041442) b!1522221))

(assert (= (and b!1522221 res!1041450) b!1522222))

(declare-fun m!1405361 () Bool)

(assert (=> b!1522224 m!1405361))

(assert (=> b!1522224 m!1405361))

(declare-fun m!1405363 () Bool)

(assert (=> b!1522224 m!1405363))

(declare-fun m!1405365 () Bool)

(assert (=> start!129658 m!1405365))

(declare-fun m!1405367 () Bool)

(assert (=> start!129658 m!1405367))

(declare-fun m!1405369 () Bool)

(assert (=> b!1522227 m!1405369))

(declare-fun m!1405371 () Bool)

(assert (=> b!1522228 m!1405371))

(assert (=> b!1522228 m!1405371))

(declare-fun m!1405373 () Bool)

(assert (=> b!1522228 m!1405373))

(assert (=> b!1522225 m!1405361))

(assert (=> b!1522225 m!1405361))

(declare-fun m!1405375 () Bool)

(assert (=> b!1522225 m!1405375))

(assert (=> b!1522225 m!1405375))

(assert (=> b!1522225 m!1405361))

(declare-fun m!1405377 () Bool)

(assert (=> b!1522225 m!1405377))

(assert (=> b!1522222 m!1405361))

(assert (=> b!1522222 m!1405361))

(declare-fun m!1405379 () Bool)

(assert (=> b!1522222 m!1405379))

(declare-fun m!1405381 () Bool)

(assert (=> b!1522222 m!1405381))

(declare-fun m!1405383 () Bool)

(assert (=> b!1522222 m!1405383))

(declare-fun m!1405385 () Bool)

(assert (=> b!1522221 m!1405385))

(declare-fun m!1405387 () Bool)

(assert (=> b!1522221 m!1405387))

(assert (=> b!1522221 m!1405387))

(declare-fun m!1405389 () Bool)

(assert (=> b!1522221 m!1405389))

(assert (=> b!1522221 m!1405389))

(assert (=> b!1522221 m!1405387))

(declare-fun m!1405391 () Bool)

(assert (=> b!1522221 m!1405391))

(declare-fun m!1405393 () Bool)

(assert (=> b!1522226 m!1405393))

(assert (=> b!1522223 m!1405361))

(assert (=> b!1522223 m!1405361))

(declare-fun m!1405395 () Bool)

(assert (=> b!1522223 m!1405395))

(push 1)

(assert (not b!1522228))

(assert (not b!1522227))

(assert (not b!1522222))

(assert (not b!1522223))

(assert (not start!129658))

(assert (not b!1522221))

(assert (not b!1522226))

(assert (not b!1522225))

(assert (not b!1522224))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!159075 () Bool)

(assert (=> d!159075 (= (validKeyInArray!0 (select (arr!48899 a!2804) j!70)) (and (not (= (select (arr!48899 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48899 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1522224 d!159075))

(declare-fun b!1522353 () Bool)

(declare-fun e!848838 () SeekEntryResult!13064)

(assert (=> b!1522353 (= e!848838 (Intermediate!13064 true (toIndex!0 (select (arr!48899 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1522354 () Bool)

(declare-fun e!848840 () SeekEntryResult!13064)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522354 (= e!848840 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48899 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48899 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522355 () Bool)

(declare-fun lt!659577 () SeekEntryResult!13064)

(assert (=> b!1522355 (and (bvsge (index!54653 lt!659577) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659577) (size!49449 a!2804)))))

(declare-fun e!848842 () Bool)

(assert (=> b!1522355 (= e!848842 (= (select (arr!48899 a!2804) (index!54653 lt!659577)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522356 () Bool)

(declare-fun e!848839 () Bool)

(declare-fun e!848841 () Bool)

(assert (=> b!1522356 (= e!848839 e!848841)))

(declare-fun res!1041535 () Bool)

(assert (=> b!1522356 (= res!1041535 (and (is-Intermediate!13064 lt!659577) (not (undefined!13876 lt!659577)) (bvslt (x!136340 lt!659577) #b01111111111111111111111111111110) (bvsge (x!136340 lt!659577) #b00000000000000000000000000000000) (bvsge (x!136340 lt!659577) #b00000000000000000000000000000000)))))

(assert (=> b!1522356 (=> (not res!1041535) (not e!848841))))

(declare-fun b!1522358 () Bool)

(assert (=> b!1522358 (and (bvsge (index!54653 lt!659577) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659577) (size!49449 a!2804)))))

(declare-fun res!1041533 () Bool)

(assert (=> b!1522358 (= res!1041533 (= (select (arr!48899 a!2804) (index!54653 lt!659577)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522358 (=> res!1041533 e!848842)))

(declare-fun b!1522359 () Bool)

(assert (=> b!1522359 (= e!848839 (bvsge (x!136340 lt!659577) #b01111111111111111111111111111110))))

(declare-fun b!1522360 () Bool)

(assert (=> b!1522360 (= e!848840 (Intermediate!13064 false (toIndex!0 (select (arr!48899 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1522361 () Bool)

(assert (=> b!1522361 (and (bvsge (index!54653 lt!659577) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659577) (size!49449 a!2804)))))

(declare-fun res!1041534 () Bool)

(assert (=> b!1522361 (= res!1041534 (= (select (arr!48899 a!2804) (index!54653 lt!659577)) (select (arr!48899 a!2804) j!70)))))

(assert (=> b!1522361 (=> res!1041534 e!848842)))

(assert (=> b!1522361 (= e!848841 e!848842)))

(declare-fun d!159077 () Bool)

(assert (=> d!159077 e!848839))

(declare-fun c!139956 () Bool)

(assert (=> d!159077 (= c!139956 (and (is-Intermediate!13064 lt!659577) (undefined!13876 lt!659577)))))

(assert (=> d!159077 (= lt!659577 e!848838)))

(declare-fun c!139957 () Bool)

(assert (=> d!159077 (= c!139957 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!659578 () (_ BitVec 64))

(assert (=> d!159077 (= lt!659578 (select (arr!48899 a!2804) (toIndex!0 (select (arr!48899 a!2804) j!70) mask!2512)))))

(assert (=> d!159077 (validMask!0 mask!2512)))

(assert (=> d!159077 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48899 a!2804) j!70) mask!2512) (select (arr!48899 a!2804) j!70) a!2804 mask!2512) lt!659577)))

(declare-fun b!1522357 () Bool)

(assert (=> b!1522357 (= e!848838 e!848840)))

(declare-fun c!139958 () Bool)

(assert (=> b!1522357 (= c!139958 (or (= lt!659578 (select (arr!48899 a!2804) j!70)) (= (bvadd lt!659578 lt!659578) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!159077 c!139957) b!1522353))

(assert (= (and d!159077 (not c!139957)) b!1522357))

(assert (= (and b!1522357 c!139958) b!1522360))

(assert (= (and b!1522357 (not c!139958)) b!1522354))

(assert (= (and d!159077 c!139956) b!1522359))

(assert (= (and d!159077 (not c!139956)) b!1522356))

(assert (= (and b!1522356 res!1041535) b!1522361))

(assert (= (and b!1522361 (not res!1041534)) b!1522358))

(assert (= (and b!1522358 (not res!1041533)) b!1522355))

(assert (=> b!1522354 m!1405375))

(declare-fun m!1405493 () Bool)

(assert (=> b!1522354 m!1405493))

(assert (=> b!1522354 m!1405493))

(assert (=> b!1522354 m!1405361))

(declare-fun m!1405495 () Bool)

(assert (=> b!1522354 m!1405495))

(declare-fun m!1405497 () Bool)

(assert (=> b!1522355 m!1405497))

(assert (=> d!159077 m!1405375))

(declare-fun m!1405499 () Bool)

(assert (=> d!159077 m!1405499))

(assert (=> d!159077 m!1405365))

(assert (=> b!1522361 m!1405497))

(assert (=> b!1522358 m!1405497))

(assert (=> b!1522225 d!159077))

(declare-fun d!159097 () Bool)

(declare-fun lt!659592 () (_ BitVec 32))

(declare-fun lt!659591 () (_ BitVec 32))

(assert (=> d!159097 (= lt!659592 (bvmul (bvxor lt!659591 (bvlshr lt!659591 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159097 (= lt!659591 ((_ extract 31 0) (bvand (bvxor (select (arr!48899 a!2804) j!70) (bvlshr (select (arr!48899 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159097 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1041536 (let ((h!36802 ((_ extract 31 0) (bvand (bvxor (select (arr!48899 a!2804) j!70) (bvlshr (select (arr!48899 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136344 (bvmul (bvxor h!36802 (bvlshr h!36802 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136344 (bvlshr x!136344 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1041536 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1041536 #b00000000000000000000000000000000))))))

(assert (=> d!159097 (= (toIndex!0 (select (arr!48899 a!2804) j!70) mask!2512) (bvand (bvxor lt!659592 (bvlshr lt!659592 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1522225 d!159097))

(declare-fun d!159099 () Bool)

(assert (=> d!159099 (= (validKeyInArray!0 (select (arr!48899 a!2804) i!961)) (and (not (= (select (arr!48899 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48899 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1522228 d!159099))

(declare-fun b!1522374 () Bool)

(declare-fun e!848849 () SeekEntryResult!13064)

(assert (=> b!1522374 (= e!848849 (Intermediate!13064 true index!487 x!534))))

(declare-fun b!1522375 () Bool)

(declare-fun e!848851 () SeekEntryResult!13064)

(assert (=> b!1522375 (= e!848851 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48899 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522376 () Bool)

(declare-fun lt!659593 () SeekEntryResult!13064)

(assert (=> b!1522376 (and (bvsge (index!54653 lt!659593) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659593) (size!49449 a!2804)))))

(declare-fun e!848853 () Bool)

(assert (=> b!1522376 (= e!848853 (= (select (arr!48899 a!2804) (index!54653 lt!659593)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522377 () Bool)

(declare-fun e!848850 () Bool)

(declare-fun e!848852 () Bool)

(assert (=> b!1522377 (= e!848850 e!848852)))

(declare-fun res!1041539 () Bool)

(assert (=> b!1522377 (= res!1041539 (and (is-Intermediate!13064 lt!659593) (not (undefined!13876 lt!659593)) (bvslt (x!136340 lt!659593) #b01111111111111111111111111111110) (bvsge (x!136340 lt!659593) #b00000000000000000000000000000000) (bvsge (x!136340 lt!659593) x!534)))))

(assert (=> b!1522377 (=> (not res!1041539) (not e!848852))))

(declare-fun b!1522379 () Bool)

(assert (=> b!1522379 (and (bvsge (index!54653 lt!659593) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659593) (size!49449 a!2804)))))

(declare-fun res!1041537 () Bool)

(assert (=> b!1522379 (= res!1041537 (= (select (arr!48899 a!2804) (index!54653 lt!659593)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522379 (=> res!1041537 e!848853)))

(declare-fun b!1522380 () Bool)

(assert (=> b!1522380 (= e!848850 (bvsge (x!136340 lt!659593) #b01111111111111111111111111111110))))

(declare-fun b!1522381 () Bool)

(assert (=> b!1522381 (= e!848851 (Intermediate!13064 false index!487 x!534))))

(declare-fun b!1522382 () Bool)

(assert (=> b!1522382 (and (bvsge (index!54653 lt!659593) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659593) (size!49449 a!2804)))))

(declare-fun res!1041538 () Bool)

(assert (=> b!1522382 (= res!1041538 (= (select (arr!48899 a!2804) (index!54653 lt!659593)) (select (arr!48899 a!2804) j!70)))))

(assert (=> b!1522382 (=> res!1041538 e!848853)))

(assert (=> b!1522382 (= e!848852 e!848853)))

(declare-fun d!159101 () Bool)

(assert (=> d!159101 e!848850))

(declare-fun c!139965 () Bool)

(assert (=> d!159101 (= c!139965 (and (is-Intermediate!13064 lt!659593) (undefined!13876 lt!659593)))))

(assert (=> d!159101 (= lt!659593 e!848849)))

(declare-fun c!139966 () Bool)

(assert (=> d!159101 (= c!139966 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!659594 () (_ BitVec 64))

(assert (=> d!159101 (= lt!659594 (select (arr!48899 a!2804) index!487))))

(assert (=> d!159101 (validMask!0 mask!2512)))

(assert (=> d!159101 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48899 a!2804) j!70) a!2804 mask!2512) lt!659593)))

(declare-fun b!1522378 () Bool)

(assert (=> b!1522378 (= e!848849 e!848851)))

(declare-fun c!139967 () Bool)

(assert (=> b!1522378 (= c!139967 (or (= lt!659594 (select (arr!48899 a!2804) j!70)) (= (bvadd lt!659594 lt!659594) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!159101 c!139966) b!1522374))

(assert (= (and d!159101 (not c!139966)) b!1522378))

(assert (= (and b!1522378 c!139967) b!1522381))

(assert (= (and b!1522378 (not c!139967)) b!1522375))

(assert (= (and d!159101 c!139965) b!1522380))

(assert (= (and d!159101 (not c!139965)) b!1522377))

(assert (= (and b!1522377 res!1041539) b!1522382))

(assert (= (and b!1522382 (not res!1041538)) b!1522379))

(assert (= (and b!1522379 (not res!1041537)) b!1522376))

(declare-fun m!1405501 () Bool)

(assert (=> b!1522375 m!1405501))

(assert (=> b!1522375 m!1405501))

(assert (=> b!1522375 m!1405361))

(declare-fun m!1405503 () Bool)

(assert (=> b!1522375 m!1405503))

(declare-fun m!1405507 () Bool)

(assert (=> b!1522376 m!1405507))

(declare-fun m!1405511 () Bool)

(assert (=> d!159101 m!1405511))

(assert (=> d!159101 m!1405365))

(assert (=> b!1522382 m!1405507))

(assert (=> b!1522379 m!1405507))

(assert (=> b!1522223 d!159101))

(declare-fun b!1522407 () Bool)

(declare-fun e!848873 () Bool)

(declare-fun call!68388 () Bool)

(assert (=> b!1522407 (= e!848873 call!68388)))

(declare-fun b!1522408 () Bool)

(declare-fun e!848874 () Bool)

(assert (=> b!1522408 (= e!848874 e!848873)))

(declare-fun c!139975 () Bool)

(assert (=> b!1522408 (= c!139975 (validKeyInArray!0 (select (arr!48899 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1522409 () Bool)

(assert (=> b!1522409 (= e!848873 call!68388)))

(declare-fun d!159103 () Bool)

(declare-fun res!1041550 () Bool)

(declare-fun e!848872 () Bool)

(assert (=> d!159103 (=> res!1041550 e!848872)))

(assert (=> d!159103 (= res!1041550 (bvsge #b00000000000000000000000000000000 (size!49449 a!2804)))))

(assert (=> d!159103 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35379) e!848872)))

(declare-fun b!1522410 () Bool)

(assert (=> b!1522410 (= e!848872 e!848874)))

(declare-fun res!1041551 () Bool)

(assert (=> b!1522410 (=> (not res!1041551) (not e!848874))))

(declare-fun e!848871 () Bool)

(assert (=> b!1522410 (= res!1041551 (not e!848871))))

(declare-fun res!1041552 () Bool)

(assert (=> b!1522410 (=> (not res!1041552) (not e!848871))))

(assert (=> b!1522410 (= res!1041552 (validKeyInArray!0 (select (arr!48899 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68385 () Bool)

(assert (=> bm!68385 (= call!68388 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139975 (Cons!35378 (select (arr!48899 a!2804) #b00000000000000000000000000000000) Nil!35379) Nil!35379)))))

(declare-fun b!1522411 () Bool)

(declare-fun contains!9986 (List!35382 (_ BitVec 64)) Bool)

(assert (=> b!1522411 (= e!848871 (contains!9986 Nil!35379 (select (arr!48899 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!159103 (not res!1041550)) b!1522410))

(assert (= (and b!1522410 res!1041552) b!1522411))

(assert (= (and b!1522410 res!1041551) b!1522408))

(assert (= (and b!1522408 c!139975) b!1522409))

(assert (= (and b!1522408 (not c!139975)) b!1522407))

(assert (= (or b!1522409 b!1522407) bm!68385))

(declare-fun m!1405515 () Bool)

(assert (=> b!1522408 m!1405515))

(assert (=> b!1522408 m!1405515))

(declare-fun m!1405517 () Bool)

(assert (=> b!1522408 m!1405517))

(assert (=> b!1522410 m!1405515))

(assert (=> b!1522410 m!1405515))

(assert (=> b!1522410 m!1405517))

(assert (=> bm!68385 m!1405515))

(declare-fun m!1405519 () Bool)

(assert (=> bm!68385 m!1405519))

(assert (=> b!1522411 m!1405515))

(assert (=> b!1522411 m!1405515))

(declare-fun m!1405521 () Bool)

(assert (=> b!1522411 m!1405521))

(assert (=> b!1522227 d!159103))

(declare-fun b!1522470 () Bool)

(declare-fun e!848911 () SeekEntryResult!13064)

(declare-fun lt!659633 () SeekEntryResult!13064)

(assert (=> b!1522470 (= e!848911 (ite (is-MissingVacant!13064 lt!659633) (MissingZero!13064 (index!54654 lt!659633)) lt!659633))))

(declare-fun lt!659632 () SeekEntryResult!13064)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101333 (_ BitVec 32)) SeekEntryResult!13064)

(assert (=> b!1522470 (= lt!659633 (seekKeyOrZeroReturnVacant!0 (x!136340 lt!659632) (index!54653 lt!659632) (index!54653 lt!659632) (select (arr!48899 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522471 () Bool)

(declare-fun e!848913 () SeekEntryResult!13064)

(declare-fun e!848912 () SeekEntryResult!13064)

(assert (=> b!1522471 (= e!848913 e!848912)))

(declare-fun lt!659634 () (_ BitVec 64))

(assert (=> b!1522471 (= lt!659634 (select (arr!48899 a!2804) (index!54653 lt!659632)))))

(declare-fun c!139996 () Bool)

(assert (=> b!1522471 (= c!139996 (= lt!659634 (select (arr!48899 a!2804) j!70)))))

(declare-fun b!1522472 () Bool)

(assert (=> b!1522472 (= e!848912 (Found!13064 (index!54653 lt!659632)))))

(declare-fun b!1522473 () Bool)

(assert (=> b!1522473 (= e!848913 Undefined!13064)))

(declare-fun d!159107 () Bool)

(declare-fun lt!659631 () SeekEntryResult!13064)

(assert (=> d!159107 (and (or (is-MissingVacant!13064 lt!659631) (not (is-Found!13064 lt!659631)) (and (bvsge (index!54652 lt!659631) #b00000000000000000000000000000000) (bvslt (index!54652 lt!659631) (size!49449 a!2804)))) (not (is-MissingVacant!13064 lt!659631)) (or (not (is-Found!13064 lt!659631)) (= (select (arr!48899 a!2804) (index!54652 lt!659631)) (select (arr!48899 a!2804) j!70))))))

(assert (=> d!159107 (= lt!659631 e!848913)))

(declare-fun c!139997 () Bool)

(assert (=> d!159107 (= c!139997 (and (is-Intermediate!13064 lt!659632) (undefined!13876 lt!659632)))))

(assert (=> d!159107 (= lt!659632 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48899 a!2804) j!70) mask!2512) (select (arr!48899 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159107 (validMask!0 mask!2512)))

(assert (=> d!159107 (= (seekEntry!0 (select (arr!48899 a!2804) j!70) a!2804 mask!2512) lt!659631)))

(declare-fun b!1522474 () Bool)

(declare-fun c!139995 () Bool)

(assert (=> b!1522474 (= c!139995 (= lt!659634 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522474 (= e!848912 e!848911)))

(declare-fun b!1522475 () Bool)

(assert (=> b!1522475 (= e!848911 (MissingZero!13064 (index!54653 lt!659632)))))

(assert (= (and d!159107 c!139997) b!1522473))

(assert (= (and d!159107 (not c!139997)) b!1522471))

(assert (= (and b!1522471 c!139996) b!1522472))

(assert (= (and b!1522471 (not c!139996)) b!1522474))

(assert (= (and b!1522474 c!139995) b!1522475))

(assert (= (and b!1522474 (not c!139995)) b!1522470))

(assert (=> b!1522470 m!1405361))

(declare-fun m!1405549 () Bool)

(assert (=> b!1522470 m!1405549))

(declare-fun m!1405551 () Bool)

(assert (=> b!1522471 m!1405551))

(declare-fun m!1405553 () Bool)

(assert (=> d!159107 m!1405553))

(assert (=> d!159107 m!1405361))

(assert (=> d!159107 m!1405375))

(assert (=> d!159107 m!1405375))

(assert (=> d!159107 m!1405361))

(assert (=> d!159107 m!1405377))

(assert (=> d!159107 m!1405365))

(assert (=> b!1522222 d!159107))

(declare-fun b!1522497 () Bool)

(declare-fun e!848929 () Bool)

(declare-fun call!68398 () Bool)

(assert (=> b!1522497 (= e!848929 call!68398)))

(declare-fun b!1522498 () Bool)

(declare-fun e!848931 () Bool)

(assert (=> b!1522498 (= e!848931 e!848929)))

(declare-fun c!140004 () Bool)

(assert (=> b!1522498 (= c!140004 (validKeyInArray!0 (select (arr!48899 a!2804) j!70)))))

(declare-fun b!1522499 () Bool)

(declare-fun e!848932 () Bool)

(assert (=> b!1522499 (= e!848932 call!68398)))

(declare-fun b!1522500 () Bool)

(assert (=> b!1522500 (= e!848929 e!848932)))

(declare-fun lt!659646 () (_ BitVec 64))

(assert (=> b!1522500 (= lt!659646 (select (arr!48899 a!2804) j!70))))

(declare-fun lt!659648 () Unit!50912)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101333 (_ BitVec 64) (_ BitVec 32)) Unit!50912)

(assert (=> b!1522500 (= lt!659648 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659646 j!70))))

(declare-fun arrayContainsKey!0 (array!101333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1522500 (arrayContainsKey!0 a!2804 lt!659646 #b00000000000000000000000000000000)))

(declare-fun lt!659647 () Unit!50912)

(assert (=> b!1522500 (= lt!659647 lt!659648)))

(declare-fun res!1041583 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101333 (_ BitVec 32)) SeekEntryResult!13064)

(assert (=> b!1522500 (= res!1041583 (= (seekEntryOrOpen!0 (select (arr!48899 a!2804) j!70) a!2804 mask!2512) (Found!13064 j!70)))))

(assert (=> b!1522500 (=> (not res!1041583) (not e!848932))))

(declare-fun bm!68395 () Bool)

(assert (=> bm!68395 (= call!68398 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!159119 () Bool)

(declare-fun res!1041584 () Bool)

(assert (=> d!159119 (=> res!1041584 e!848931)))

(assert (=> d!159119 (= res!1041584 (bvsge j!70 (size!49449 a!2804)))))

(assert (=> d!159119 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!848931)))

(assert (= (and d!159119 (not res!1041584)) b!1522498))

(assert (= (and b!1522498 c!140004) b!1522500))

(assert (= (and b!1522498 (not c!140004)) b!1522497))

(assert (= (and b!1522500 res!1041583) b!1522499))

(assert (= (or b!1522499 b!1522497) bm!68395))

(assert (=> b!1522498 m!1405361))

(assert (=> b!1522498 m!1405361))

(assert (=> b!1522498 m!1405363))

(assert (=> b!1522500 m!1405361))

(declare-fun m!1405571 () Bool)

(assert (=> b!1522500 m!1405571))

(declare-fun m!1405573 () Bool)

(assert (=> b!1522500 m!1405573))

(assert (=> b!1522500 m!1405361))

(declare-fun m!1405575 () Bool)

(assert (=> b!1522500 m!1405575))

(declare-fun m!1405577 () Bool)

(assert (=> bm!68395 m!1405577))

(assert (=> b!1522222 d!159119))

(declare-fun d!159129 () Bool)

(assert (=> d!159129 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!659655 () Unit!50912)

(declare-fun choose!38 (array!101333 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50912)

(assert (=> d!159129 (= lt!659655 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159129 (validMask!0 mask!2512)))

(assert (=> d!159129 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!659655)))

(declare-fun bs!43698 () Bool)

(assert (= bs!43698 d!159129))

(assert (=> bs!43698 m!1405381))

(declare-fun m!1405587 () Bool)

(assert (=> bs!43698 m!1405587))

(assert (=> bs!43698 m!1405365))

(assert (=> b!1522222 d!159129))

(declare-fun d!159133 () Bool)

(assert (=> d!159133 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129658 d!159133))

(declare-fun d!159137 () Bool)

(assert (=> d!159137 (= (array_inv!37927 a!2804) (bvsge (size!49449 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129658 d!159137))

(declare-fun b!1522537 () Bool)

(declare-fun e!848951 () Bool)

(declare-fun call!68399 () Bool)

(assert (=> b!1522537 (= e!848951 call!68399)))

(declare-fun b!1522538 () Bool)

(declare-fun e!848952 () Bool)

(assert (=> b!1522538 (= e!848952 e!848951)))

(declare-fun c!140017 () Bool)

(assert (=> b!1522538 (= c!140017 (validKeyInArray!0 (select (arr!48899 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1522539 () Bool)

(declare-fun e!848953 () Bool)

(assert (=> b!1522539 (= e!848953 call!68399)))

(declare-fun b!1522540 () Bool)

(assert (=> b!1522540 (= e!848951 e!848953)))

(declare-fun lt!659662 () (_ BitVec 64))

(assert (=> b!1522540 (= lt!659662 (select (arr!48899 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!659664 () Unit!50912)

(assert (=> b!1522540 (= lt!659664 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659662 #b00000000000000000000000000000000))))

(assert (=> b!1522540 (arrayContainsKey!0 a!2804 lt!659662 #b00000000000000000000000000000000)))

(declare-fun lt!659663 () Unit!50912)

(assert (=> b!1522540 (= lt!659663 lt!659664)))

(declare-fun res!1041598 () Bool)

(assert (=> b!1522540 (= res!1041598 (= (seekEntryOrOpen!0 (select (arr!48899 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13064 #b00000000000000000000000000000000)))))

(assert (=> b!1522540 (=> (not res!1041598) (not e!848953))))

(declare-fun bm!68396 () Bool)

(assert (=> bm!68396 (= call!68399 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!159139 () Bool)

(declare-fun res!1041599 () Bool)

(assert (=> d!159139 (=> res!1041599 e!848952)))

(assert (=> d!159139 (= res!1041599 (bvsge #b00000000000000000000000000000000 (size!49449 a!2804)))))

(assert (=> d!159139 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!848952)))

(assert (= (and d!159139 (not res!1041599)) b!1522538))

(assert (= (and b!1522538 c!140017) b!1522540))

(assert (= (and b!1522538 (not c!140017)) b!1522537))

(assert (= (and b!1522540 res!1041598) b!1522539))

(assert (= (or b!1522539 b!1522537) bm!68396))

(assert (=> b!1522538 m!1405515))

(assert (=> b!1522538 m!1405515))

(assert (=> b!1522538 m!1405517))

(assert (=> b!1522540 m!1405515))

(declare-fun m!1405597 () Bool)

(assert (=> b!1522540 m!1405597))

(declare-fun m!1405599 () Bool)

(assert (=> b!1522540 m!1405599))

(assert (=> b!1522540 m!1405515))

(declare-fun m!1405601 () Bool)

(assert (=> b!1522540 m!1405601))

(declare-fun m!1405603 () Bool)

(assert (=> bm!68396 m!1405603))

(assert (=> b!1522226 d!159139))

(declare-fun b!1522541 () Bool)

(declare-fun e!848954 () SeekEntryResult!13064)

(assert (=> b!1522541 (= e!848954 (Intermediate!13064 true (toIndex!0 (select (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1522542 () Bool)

(declare-fun e!848956 () SeekEntryResult!13064)

(assert (=> b!1522542 (= e!848956 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101334 (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804)) mask!2512))))

(declare-fun b!1522543 () Bool)

(declare-fun lt!659665 () SeekEntryResult!13064)

(assert (=> b!1522543 (and (bvsge (index!54653 lt!659665) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659665) (size!49449 (array!101334 (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804)))))))

(declare-fun e!848958 () Bool)

(assert (=> b!1522543 (= e!848958 (= (select (arr!48899 (array!101334 (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804))) (index!54653 lt!659665)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522544 () Bool)

(declare-fun e!848955 () Bool)

(declare-fun e!848957 () Bool)

(assert (=> b!1522544 (= e!848955 e!848957)))

(declare-fun res!1041602 () Bool)

(assert (=> b!1522544 (= res!1041602 (and (is-Intermediate!13064 lt!659665) (not (undefined!13876 lt!659665)) (bvslt (x!136340 lt!659665) #b01111111111111111111111111111110) (bvsge (x!136340 lt!659665) #b00000000000000000000000000000000) (bvsge (x!136340 lt!659665) #b00000000000000000000000000000000)))))

(assert (=> b!1522544 (=> (not res!1041602) (not e!848957))))

(declare-fun b!1522546 () Bool)

(assert (=> b!1522546 (and (bvsge (index!54653 lt!659665) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659665) (size!49449 (array!101334 (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804)))))))

(declare-fun res!1041600 () Bool)

(assert (=> b!1522546 (= res!1041600 (= (select (arr!48899 (array!101334 (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804))) (index!54653 lt!659665)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522546 (=> res!1041600 e!848958)))

(declare-fun b!1522547 () Bool)

(assert (=> b!1522547 (= e!848955 (bvsge (x!136340 lt!659665) #b01111111111111111111111111111110))))

(declare-fun b!1522548 () Bool)

(assert (=> b!1522548 (= e!848956 (Intermediate!13064 false (toIndex!0 (select (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1522549 () Bool)

(assert (=> b!1522549 (and (bvsge (index!54653 lt!659665) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659665) (size!49449 (array!101334 (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804)))))))

(declare-fun res!1041601 () Bool)

(assert (=> b!1522549 (= res!1041601 (= (select (arr!48899 (array!101334 (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804))) (index!54653 lt!659665)) (select (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1522549 (=> res!1041601 e!848958)))

(assert (=> b!1522549 (= e!848957 e!848958)))

(declare-fun d!159141 () Bool)

(assert (=> d!159141 e!848955))

(declare-fun c!140018 () Bool)

(assert (=> d!159141 (= c!140018 (and (is-Intermediate!13064 lt!659665) (undefined!13876 lt!659665)))))

(assert (=> d!159141 (= lt!659665 e!848954)))

(declare-fun c!140019 () Bool)

(assert (=> d!159141 (= c!140019 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!659666 () (_ BitVec 64))

(assert (=> d!159141 (= lt!659666 (select (arr!48899 (array!101334 (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804))) (toIndex!0 (select (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!159141 (validMask!0 mask!2512)))

(assert (=> d!159141 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101334 (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804)) mask!2512) lt!659665)))

(declare-fun b!1522545 () Bool)

(assert (=> b!1522545 (= e!848954 e!848956)))

(declare-fun c!140020 () Bool)

(assert (=> b!1522545 (= c!140020 (or (= lt!659666 (select (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!659666 lt!659666) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!159141 c!140019) b!1522541))

(assert (= (and d!159141 (not c!140019)) b!1522545))

(assert (= (and b!1522545 c!140020) b!1522548))

(assert (= (and b!1522545 (not c!140020)) b!1522542))

(assert (= (and d!159141 c!140018) b!1522547))

(assert (= (and d!159141 (not c!140018)) b!1522544))

(assert (= (and b!1522544 res!1041602) b!1522549))

(assert (= (and b!1522549 (not res!1041601)) b!1522546))

(assert (= (and b!1522546 (not res!1041600)) b!1522543))

(assert (=> b!1522542 m!1405389))

(declare-fun m!1405605 () Bool)

(assert (=> b!1522542 m!1405605))

(assert (=> b!1522542 m!1405605))

(assert (=> b!1522542 m!1405387))

(declare-fun m!1405607 () Bool)

(assert (=> b!1522542 m!1405607))

(declare-fun m!1405609 () Bool)

(assert (=> b!1522543 m!1405609))

(assert (=> d!159141 m!1405389))

(declare-fun m!1405611 () Bool)

(assert (=> d!159141 m!1405611))

(assert (=> d!159141 m!1405365))

(assert (=> b!1522549 m!1405609))

(assert (=> b!1522546 m!1405609))

(assert (=> b!1522221 d!159141))

(declare-fun d!159143 () Bool)

(declare-fun lt!659668 () (_ BitVec 32))

(declare-fun lt!659667 () (_ BitVec 32))

(assert (=> d!159143 (= lt!659668 (bvmul (bvxor lt!659667 (bvlshr lt!659667 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159143 (= lt!659667 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159143 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1041536 (let ((h!36802 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136344 (bvmul (bvxor h!36802 (bvlshr h!36802 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136344 (bvlshr x!136344 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1041536 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1041536 #b00000000000000000000000000000000))))))

(assert (=> d!159143 (= (toIndex!0 (select (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!659668 (bvlshr lt!659668 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1522221 d!159143))

(push 1)

(assert (not d!159129))

(assert (not bm!68395))

(assert (not b!1522538))

(assert (not b!1522540))

(assert (not b!1522410))

(assert (not b!1522408))

(assert (not bm!68396))

(assert (not b!1522375))

(assert (not d!159101))

(assert (not d!159141))

(assert (not d!159107))

(assert (not b!1522542))

(assert (not b!1522354))

(assert (not d!159077))

(assert (not bm!68385))

(assert (not b!1522411))

(assert (not b!1522498))

(assert (not b!1522470))

(assert (not b!1522500))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> d!159101 d!159133))

(assert (=> b!1522498 d!159075))

(declare-fun d!159153 () Bool)

(assert (=> d!159153 (= (validKeyInArray!0 (select (arr!48899 a!2804) #b00000000000000000000000000000000)) (and (not (= (select (arr!48899 a!2804) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48899 a!2804) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1522538 d!159153))

(assert (=> d!159141 d!159133))

(declare-fun e!848972 () SeekEntryResult!13064)

(declare-fun b!1522572 () Bool)

(assert (=> b!1522572 (= e!848972 (Intermediate!13064 true (nextIndex!0 (toIndex!0 (select (arr!48899 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun e!848974 () SeekEntryResult!13064)

(declare-fun b!1522573 () Bool)

(assert (=> b!1522573 (= e!848974 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!48899 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (arr!48899 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522574 () Bool)

(declare-fun lt!659684 () SeekEntryResult!13064)

(assert (=> b!1522574 (and (bvsge (index!54653 lt!659684) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659684) (size!49449 a!2804)))))

(declare-fun e!848976 () Bool)

(assert (=> b!1522574 (= e!848976 (= (select (arr!48899 a!2804) (index!54653 lt!659684)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522575 () Bool)

(declare-fun e!848973 () Bool)

(declare-fun e!848975 () Bool)

(assert (=> b!1522575 (= e!848973 e!848975)))

(declare-fun res!1041613 () Bool)

(assert (=> b!1522575 (= res!1041613 (and (is-Intermediate!13064 lt!659684) (not (undefined!13876 lt!659684)) (bvslt (x!136340 lt!659684) #b01111111111111111111111111111110) (bvsge (x!136340 lt!659684) #b00000000000000000000000000000000) (bvsge (x!136340 lt!659684) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1522575 (=> (not res!1041613) (not e!848975))))

(declare-fun b!1522577 () Bool)

(assert (=> b!1522577 (and (bvsge (index!54653 lt!659684) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659684) (size!49449 a!2804)))))

(declare-fun res!1041611 () Bool)

(assert (=> b!1522577 (= res!1041611 (= (select (arr!48899 a!2804) (index!54653 lt!659684)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522577 (=> res!1041611 e!848976)))

(declare-fun b!1522578 () Bool)

(assert (=> b!1522578 (= e!848973 (bvsge (x!136340 lt!659684) #b01111111111111111111111111111110))))

(declare-fun b!1522579 () Bool)

(assert (=> b!1522579 (= e!848974 (Intermediate!13064 false (nextIndex!0 (toIndex!0 (select (arr!48899 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1522580 () Bool)

(assert (=> b!1522580 (and (bvsge (index!54653 lt!659684) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659684) (size!49449 a!2804)))))

(declare-fun res!1041612 () Bool)

(assert (=> b!1522580 (= res!1041612 (= (select (arr!48899 a!2804) (index!54653 lt!659684)) (select (arr!48899 a!2804) j!70)))))

(assert (=> b!1522580 (=> res!1041612 e!848976)))

(assert (=> b!1522580 (= e!848975 e!848976)))

(declare-fun d!159155 () Bool)

(assert (=> d!159155 e!848973))

(declare-fun c!140028 () Bool)

(assert (=> d!159155 (= c!140028 (and (is-Intermediate!13064 lt!659684) (undefined!13876 lt!659684)))))

(assert (=> d!159155 (= lt!659684 e!848972)))

(declare-fun c!140029 () Bool)

(assert (=> d!159155 (= c!140029 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!659685 () (_ BitVec 64))

(assert (=> d!159155 (= lt!659685 (select (arr!48899 a!2804) (nextIndex!0 (toIndex!0 (select (arr!48899 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512)))))

(assert (=> d!159155 (validMask!0 mask!2512)))

(assert (=> d!159155 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48899 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48899 a!2804) j!70) a!2804 mask!2512) lt!659684)))

(declare-fun b!1522576 () Bool)

(assert (=> b!1522576 (= e!848972 e!848974)))

(declare-fun c!140030 () Bool)

(assert (=> b!1522576 (= c!140030 (or (= lt!659685 (select (arr!48899 a!2804) j!70)) (= (bvadd lt!659685 lt!659685) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!159155 c!140029) b!1522572))

(assert (= (and d!159155 (not c!140029)) b!1522576))

(assert (= (and b!1522576 c!140030) b!1522579))

(assert (= (and b!1522576 (not c!140030)) b!1522573))

(assert (= (and d!159155 c!140028) b!1522578))

(assert (= (and d!159155 (not c!140028)) b!1522575))

(assert (= (and b!1522575 res!1041613) b!1522580))

(assert (= (and b!1522580 (not res!1041612)) b!1522577))

(assert (= (and b!1522577 (not res!1041611)) b!1522574))

(assert (=> b!1522573 m!1405493))

(declare-fun m!1405637 () Bool)

(assert (=> b!1522573 m!1405637))

(assert (=> b!1522573 m!1405637))

(assert (=> b!1522573 m!1405361))

(declare-fun m!1405639 () Bool)

(assert (=> b!1522573 m!1405639))

(declare-fun m!1405641 () Bool)

(assert (=> b!1522574 m!1405641))

(assert (=> d!159155 m!1405493))

(declare-fun m!1405643 () Bool)

(assert (=> d!159155 m!1405643))

(assert (=> d!159155 m!1405365))

(assert (=> b!1522580 m!1405641))

(assert (=> b!1522577 m!1405641))

(assert (=> b!1522354 d!159155))

(declare-fun d!159157 () Bool)

(declare-fun lt!659688 () (_ BitVec 32))

(assert (=> d!159157 (and (bvsge lt!659688 #b00000000000000000000000000000000) (bvslt lt!659688 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!159157 (= lt!659688 (choose!52 (toIndex!0 (select (arr!48899 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512))))

(assert (=> d!159157 (validMask!0 mask!2512)))

(assert (=> d!159157 (= (nextIndex!0 (toIndex!0 (select (arr!48899 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) lt!659688)))

(declare-fun bs!43699 () Bool)

(assert (= bs!43699 d!159157))

(assert (=> bs!43699 m!1405375))

(declare-fun m!1405645 () Bool)

(assert (=> bs!43699 m!1405645))

(assert (=> bs!43699 m!1405365))

(assert (=> b!1522354 d!159157))

(declare-fun d!159159 () Bool)

(assert (=> d!159159 (arrayContainsKey!0 a!2804 lt!659662 #b00000000000000000000000000000000)))

(declare-fun lt!659691 () Unit!50912)

(declare-fun choose!13 (array!101333 (_ BitVec 64) (_ BitVec 32)) Unit!50912)

(assert (=> d!159159 (= lt!659691 (choose!13 a!2804 lt!659662 #b00000000000000000000000000000000))))

(assert (=> d!159159 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!159159 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659662 #b00000000000000000000000000000000) lt!659691)))

(declare-fun bs!43700 () Bool)

(assert (= bs!43700 d!159159))

(assert (=> bs!43700 m!1405599))

(declare-fun m!1405647 () Bool)

(assert (=> bs!43700 m!1405647))

(assert (=> b!1522540 d!159159))

(declare-fun d!159161 () Bool)

(declare-fun res!1041618 () Bool)

(declare-fun e!848981 () Bool)

(assert (=> d!159161 (=> res!1041618 e!848981)))

(assert (=> d!159161 (= res!1041618 (= (select (arr!48899 a!2804) #b00000000000000000000000000000000) lt!659662))))

(assert (=> d!159161 (= (arrayContainsKey!0 a!2804 lt!659662 #b00000000000000000000000000000000) e!848981)))

(declare-fun b!1522585 () Bool)

(declare-fun e!848982 () Bool)

(assert (=> b!1522585 (= e!848981 e!848982)))

(declare-fun res!1041619 () Bool)

(assert (=> b!1522585 (=> (not res!1041619) (not e!848982))))

(assert (=> b!1522585 (= res!1041619 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49449 a!2804)))))

(declare-fun b!1522586 () Bool)

(assert (=> b!1522586 (= e!848982 (arrayContainsKey!0 a!2804 lt!659662 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!159161 (not res!1041618)) b!1522585))

(assert (= (and b!1522585 res!1041619) b!1522586))

(assert (=> d!159161 m!1405515))

(declare-fun m!1405649 () Bool)

(assert (=> b!1522586 m!1405649))

(assert (=> b!1522540 d!159161))

(declare-fun b!1522599 () Bool)

(declare-fun e!848990 () SeekEntryResult!13064)

(declare-fun e!848989 () SeekEntryResult!13064)

(assert (=> b!1522599 (= e!848990 e!848989)))

(declare-fun lt!659699 () (_ BitVec 64))

(declare-fun lt!659700 () SeekEntryResult!13064)

(assert (=> b!1522599 (= lt!659699 (select (arr!48899 a!2804) (index!54653 lt!659700)))))

(declare-fun c!140038 () Bool)

(assert (=> b!1522599 (= c!140038 (= lt!659699 (select (arr!48899 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1522600 () Bool)

(declare-fun e!848991 () SeekEntryResult!13064)

(assert (=> b!1522600 (= e!848991 (seekKeyOrZeroReturnVacant!0 (x!136340 lt!659700) (index!54653 lt!659700) (index!54653 lt!659700) (select (arr!48899 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512))))

(declare-fun b!1522601 () Bool)

(assert (=> b!1522601 (= e!848991 (MissingZero!13064 (index!54653 lt!659700)))))

(declare-fun b!1522602 () Bool)

(assert (=> b!1522602 (= e!848990 Undefined!13064)))

(declare-fun b!1522603 () Bool)

(declare-fun c!140037 () Bool)

(assert (=> b!1522603 (= c!140037 (= lt!659699 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522603 (= e!848989 e!848991)))

(declare-fun d!159163 () Bool)

(declare-fun lt!659698 () SeekEntryResult!13064)

(assert (=> d!159163 (and (or (is-Undefined!13064 lt!659698) (not (is-Found!13064 lt!659698)) (and (bvsge (index!54652 lt!659698) #b00000000000000000000000000000000) (bvslt (index!54652 lt!659698) (size!49449 a!2804)))) (or (is-Undefined!13064 lt!659698) (is-Found!13064 lt!659698) (not (is-MissingZero!13064 lt!659698)) (and (bvsge (index!54651 lt!659698) #b00000000000000000000000000000000) (bvslt (index!54651 lt!659698) (size!49449 a!2804)))) (or (is-Undefined!13064 lt!659698) (is-Found!13064 lt!659698) (is-MissingZero!13064 lt!659698) (not (is-MissingVacant!13064 lt!659698)) (and (bvsge (index!54654 lt!659698) #b00000000000000000000000000000000) (bvslt (index!54654 lt!659698) (size!49449 a!2804)))) (or (is-Undefined!13064 lt!659698) (ite (is-Found!13064 lt!659698) (= (select (arr!48899 a!2804) (index!54652 lt!659698)) (select (arr!48899 a!2804) #b00000000000000000000000000000000)) (ite (is-MissingZero!13064 lt!659698) (= (select (arr!48899 a!2804) (index!54651 lt!659698)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!13064 lt!659698) (= (select (arr!48899 a!2804) (index!54654 lt!659698)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!159163 (= lt!659698 e!848990)))

(declare-fun c!140039 () Bool)

(assert (=> d!159163 (= c!140039 (and (is-Intermediate!13064 lt!659700) (undefined!13876 lt!659700)))))

(assert (=> d!159163 (= lt!659700 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48899 a!2804) #b00000000000000000000000000000000) mask!2512) (select (arr!48899 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512))))

(assert (=> d!159163 (validMask!0 mask!2512)))

(assert (=> d!159163 (= (seekEntryOrOpen!0 (select (arr!48899 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) lt!659698)))

(declare-fun b!1522604 () Bool)

(assert (=> b!1522604 (= e!848989 (Found!13064 (index!54653 lt!659700)))))

(assert (= (and d!159163 c!140039) b!1522602))

(assert (= (and d!159163 (not c!140039)) b!1522599))

(assert (= (and b!1522599 c!140038) b!1522604))

(assert (= (and b!1522599 (not c!140038)) b!1522603))

(assert (= (and b!1522603 c!140037) b!1522601))

(assert (= (and b!1522603 (not c!140037)) b!1522600))

(declare-fun m!1405651 () Bool)

(assert (=> b!1522599 m!1405651))

(assert (=> b!1522600 m!1405515))

(declare-fun m!1405653 () Bool)

(assert (=> b!1522600 m!1405653))

(assert (=> d!159163 m!1405515))

(declare-fun m!1405655 () Bool)

(assert (=> d!159163 m!1405655))

(assert (=> d!159163 m!1405655))

(assert (=> d!159163 m!1405515))

(declare-fun m!1405657 () Bool)

(assert (=> d!159163 m!1405657))

(declare-fun m!1405659 () Bool)

(assert (=> d!159163 m!1405659))

(declare-fun m!1405661 () Bool)

(assert (=> d!159163 m!1405661))

(declare-fun m!1405663 () Bool)

(assert (=> d!159163 m!1405663))

(assert (=> d!159163 m!1405365))

(assert (=> b!1522540 d!159163))

(declare-fun b!1522617 () Bool)

(declare-fun e!848999 () SeekEntryResult!13064)

(assert (=> b!1522617 (= e!848999 (Found!13064 (index!54653 lt!659632)))))

(declare-fun b!1522618 () Bool)

(declare-fun e!848998 () SeekEntryResult!13064)

(assert (=> b!1522618 (= e!848998 (MissingVacant!13064 (index!54653 lt!659632)))))

(declare-fun lt!659705 () SeekEntryResult!13064)

(declare-fun d!159165 () Bool)

(assert (=> d!159165 (and (or (is-Undefined!13064 lt!659705) (not (is-Found!13064 lt!659705)) (and (bvsge (index!54652 lt!659705) #b00000000000000000000000000000000) (bvslt (index!54652 lt!659705) (size!49449 a!2804)))) (or (is-Undefined!13064 lt!659705) (is-Found!13064 lt!659705) (not (is-MissingVacant!13064 lt!659705)) (not (= (index!54654 lt!659705) (index!54653 lt!659632))) (and (bvsge (index!54654 lt!659705) #b00000000000000000000000000000000) (bvslt (index!54654 lt!659705) (size!49449 a!2804)))) (or (is-Undefined!13064 lt!659705) (ite (is-Found!13064 lt!659705) (= (select (arr!48899 a!2804) (index!54652 lt!659705)) (select (arr!48899 a!2804) j!70)) (and (is-MissingVacant!13064 lt!659705) (= (index!54654 lt!659705) (index!54653 lt!659632)) (= (select (arr!48899 a!2804) (index!54654 lt!659705)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!849000 () SeekEntryResult!13064)

(assert (=> d!159165 (= lt!659705 e!849000)))

(declare-fun c!140048 () Bool)

(assert (=> d!159165 (= c!140048 (bvsge (x!136340 lt!659632) #b01111111111111111111111111111110))))

(declare-fun lt!659706 () (_ BitVec 64))

(assert (=> d!159165 (= lt!659706 (select (arr!48899 a!2804) (index!54653 lt!659632)))))

(assert (=> d!159165 (validMask!0 mask!2512)))

(assert (=> d!159165 (= (seekKeyOrZeroReturnVacant!0 (x!136340 lt!659632) (index!54653 lt!659632) (index!54653 lt!659632) (select (arr!48899 a!2804) j!70) a!2804 mask!2512) lt!659705)))

(declare-fun b!1522619 () Bool)

(assert (=> b!1522619 (= e!848998 (seekKeyOrZeroReturnVacant!0 (bvadd (x!136340 lt!659632) #b00000000000000000000000000000001) (nextIndex!0 (index!54653 lt!659632) (x!136340 lt!659632) mask!2512) (index!54653 lt!659632) (select (arr!48899 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522620 () Bool)

(assert (=> b!1522620 (= e!849000 Undefined!13064)))

(declare-fun b!1522621 () Bool)

(assert (=> b!1522621 (= e!849000 e!848999)))

(declare-fun c!140046 () Bool)

(assert (=> b!1522621 (= c!140046 (= lt!659706 (select (arr!48899 a!2804) j!70)))))

(declare-fun b!1522622 () Bool)

(declare-fun c!140047 () Bool)

(assert (=> b!1522622 (= c!140047 (= lt!659706 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522622 (= e!848999 e!848998)))

(assert (= (and d!159165 c!140048) b!1522620))

(assert (= (and d!159165 (not c!140048)) b!1522621))

(assert (= (and b!1522621 c!140046) b!1522617))

(assert (= (and b!1522621 (not c!140046)) b!1522622))

(assert (= (and b!1522622 c!140047) b!1522618))

(assert (= (and b!1522622 (not c!140047)) b!1522619))

(declare-fun m!1405665 () Bool)

(assert (=> d!159165 m!1405665))

(declare-fun m!1405667 () Bool)

(assert (=> d!159165 m!1405667))

(assert (=> d!159165 m!1405551))

(assert (=> d!159165 m!1405365))

(declare-fun m!1405669 () Bool)

(assert (=> b!1522619 m!1405669))

(assert (=> b!1522619 m!1405669))

(assert (=> b!1522619 m!1405361))

(declare-fun m!1405671 () Bool)

(assert (=> b!1522619 m!1405671))

(assert (=> b!1522470 d!159165))

(declare-fun b!1522623 () Bool)

(declare-fun e!849001 () SeekEntryResult!13064)

(assert (=> b!1522623 (= e!849001 (Intermediate!13064 true (nextIndex!0 index!487 x!534 mask!2512) (bvadd x!534 #b00000000000000000000000000000001)))))

(declare-fun b!1522624 () Bool)

(declare-fun e!849003 () SeekEntryResult!13064)

(assert (=> b!1522624 (= e!849003 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!487 x!534 mask!2512) (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (select (arr!48899 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522625 () Bool)

(declare-fun lt!659707 () SeekEntryResult!13064)

(assert (=> b!1522625 (and (bvsge (index!54653 lt!659707) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659707) (size!49449 a!2804)))))

(declare-fun e!849005 () Bool)

(assert (=> b!1522625 (= e!849005 (= (select (arr!48899 a!2804) (index!54653 lt!659707)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522626 () Bool)

(declare-fun e!849002 () Bool)

(declare-fun e!849004 () Bool)

(assert (=> b!1522626 (= e!849002 e!849004)))

(declare-fun res!1041622 () Bool)

(assert (=> b!1522626 (= res!1041622 (and (is-Intermediate!13064 lt!659707) (not (undefined!13876 lt!659707)) (bvslt (x!136340 lt!659707) #b01111111111111111111111111111110) (bvsge (x!136340 lt!659707) #b00000000000000000000000000000000) (bvsge (x!136340 lt!659707) (bvadd x!534 #b00000000000000000000000000000001))))))

(assert (=> b!1522626 (=> (not res!1041622) (not e!849004))))

(declare-fun b!1522628 () Bool)

(assert (=> b!1522628 (and (bvsge (index!54653 lt!659707) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659707) (size!49449 a!2804)))))

(declare-fun res!1041620 () Bool)

(assert (=> b!1522628 (= res!1041620 (= (select (arr!48899 a!2804) (index!54653 lt!659707)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522628 (=> res!1041620 e!849005)))

(declare-fun b!1522629 () Bool)

(assert (=> b!1522629 (= e!849002 (bvsge (x!136340 lt!659707) #b01111111111111111111111111111110))))

(declare-fun b!1522630 () Bool)

(assert (=> b!1522630 (= e!849003 (Intermediate!13064 false (nextIndex!0 index!487 x!534 mask!2512) (bvadd x!534 #b00000000000000000000000000000001)))))

(declare-fun b!1522631 () Bool)

(assert (=> b!1522631 (and (bvsge (index!54653 lt!659707) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659707) (size!49449 a!2804)))))

(declare-fun res!1041621 () Bool)

(assert (=> b!1522631 (= res!1041621 (= (select (arr!48899 a!2804) (index!54653 lt!659707)) (select (arr!48899 a!2804) j!70)))))

(assert (=> b!1522631 (=> res!1041621 e!849005)))

(assert (=> b!1522631 (= e!849004 e!849005)))

(declare-fun d!159167 () Bool)

(assert (=> d!159167 e!849002))

(declare-fun c!140049 () Bool)

(assert (=> d!159167 (= c!140049 (and (is-Intermediate!13064 lt!659707) (undefined!13876 lt!659707)))))

(assert (=> d!159167 (= lt!659707 e!849001)))

(declare-fun c!140050 () Bool)

(assert (=> d!159167 (= c!140050 (bvsge (bvadd x!534 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!659708 () (_ BitVec 64))

(assert (=> d!159167 (= lt!659708 (select (arr!48899 a!2804) (nextIndex!0 index!487 x!534 mask!2512)))))

(assert (=> d!159167 (validMask!0 mask!2512)))

(assert (=> d!159167 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48899 a!2804) j!70) a!2804 mask!2512) lt!659707)))

(declare-fun b!1522627 () Bool)

(assert (=> b!1522627 (= e!849001 e!849003)))

(declare-fun c!140051 () Bool)

(assert (=> b!1522627 (= c!140051 (or (= lt!659708 (select (arr!48899 a!2804) j!70)) (= (bvadd lt!659708 lt!659708) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!159167 c!140050) b!1522623))

(assert (= (and d!159167 (not c!140050)) b!1522627))

(assert (= (and b!1522627 c!140051) b!1522630))

(assert (= (and b!1522627 (not c!140051)) b!1522624))

(assert (= (and d!159167 c!140049) b!1522629))

(assert (= (and d!159167 (not c!140049)) b!1522626))

(assert (= (and b!1522626 res!1041622) b!1522631))

(assert (= (and b!1522631 (not res!1041621)) b!1522628))

(assert (= (and b!1522628 (not res!1041620)) b!1522625))

(assert (=> b!1522624 m!1405501))

(declare-fun m!1405673 () Bool)

(assert (=> b!1522624 m!1405673))

(assert (=> b!1522624 m!1405673))

(assert (=> b!1522624 m!1405361))

(declare-fun m!1405675 () Bool)

(assert (=> b!1522624 m!1405675))

(declare-fun m!1405677 () Bool)

(assert (=> b!1522625 m!1405677))

(assert (=> d!159167 m!1405501))

(declare-fun m!1405679 () Bool)

(assert (=> d!159167 m!1405679))

(assert (=> d!159167 m!1405365))

(assert (=> b!1522631 m!1405677))

(assert (=> b!1522628 m!1405677))

(assert (=> b!1522375 d!159167))

(declare-fun d!159169 () Bool)

(declare-fun lt!659709 () (_ BitVec 32))

(assert (=> d!159169 (and (bvsge lt!659709 #b00000000000000000000000000000000) (bvslt lt!659709 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(assert (=> d!159169 (= lt!659709 (choose!52 index!487 x!534 mask!2512))))

(assert (=> d!159169 (validMask!0 mask!2512)))

(assert (=> d!159169 (= (nextIndex!0 index!487 x!534 mask!2512) lt!659709)))

(declare-fun bs!43701 () Bool)

(assert (= bs!43701 d!159169))

(declare-fun m!1405681 () Bool)

(assert (=> bs!43701 m!1405681))

(assert (=> bs!43701 m!1405365))

(assert (=> b!1522375 d!159169))

(assert (=> d!159107 d!159077))

(assert (=> d!159107 d!159097))

(assert (=> d!159107 d!159133))

(assert (=> d!159129 d!159119))

(declare-fun d!159171 () Bool)

(assert (=> d!159171 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(assert (=> d!159171 true))

(declare-fun _$72!170 () Unit!50912)

(assert (=> d!159171 (= (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) _$72!170)))

(declare-fun bs!43702 () Bool)

(assert (= bs!43702 d!159171))

(assert (=> bs!43702 m!1405381))

(assert (=> d!159129 d!159171))

(assert (=> d!159129 d!159133))

(declare-fun b!1522632 () Bool)

(declare-fun e!849006 () Bool)

(declare-fun call!68401 () Bool)

(assert (=> b!1522632 (= e!849006 call!68401)))

(declare-fun b!1522633 () Bool)

(declare-fun e!849007 () Bool)

(assert (=> b!1522633 (= e!849007 e!849006)))

(declare-fun c!140052 () Bool)

(assert (=> b!1522633 (= c!140052 (validKeyInArray!0 (select (arr!48899 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1522634 () Bool)

(declare-fun e!849008 () Bool)

(assert (=> b!1522634 (= e!849008 call!68401)))

(declare-fun b!1522635 () Bool)

(assert (=> b!1522635 (= e!849006 e!849008)))

(declare-fun lt!659710 () (_ BitVec 64))

(assert (=> b!1522635 (= lt!659710 (select (arr!48899 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!659712 () Unit!50912)

(assert (=> b!1522635 (= lt!659712 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659710 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1522635 (arrayContainsKey!0 a!2804 lt!659710 #b00000000000000000000000000000000)))

(declare-fun lt!659711 () Unit!50912)

(assert (=> b!1522635 (= lt!659711 lt!659712)))

(declare-fun res!1041623 () Bool)

(assert (=> b!1522635 (= res!1041623 (= (seekEntryOrOpen!0 (select (arr!48899 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!2804 mask!2512) (Found!13064 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1522635 (=> (not res!1041623) (not e!849008))))

(declare-fun bm!68398 () Bool)

(assert (=> bm!68398 (= call!68401 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!159173 () Bool)

(declare-fun res!1041624 () Bool)

(assert (=> d!159173 (=> res!1041624 e!849007)))

(assert (=> d!159173 (= res!1041624 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49449 a!2804)))))

(assert (=> d!159173 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512) e!849007)))

(assert (= (and d!159173 (not res!1041624)) b!1522633))

(assert (= (and b!1522633 c!140052) b!1522635))

(assert (= (and b!1522633 (not c!140052)) b!1522632))

(assert (= (and b!1522635 res!1041623) b!1522634))

(assert (= (or b!1522634 b!1522632) bm!68398))

(declare-fun m!1405683 () Bool)

(assert (=> b!1522633 m!1405683))

(assert (=> b!1522633 m!1405683))

(declare-fun m!1405685 () Bool)

(assert (=> b!1522633 m!1405685))

(assert (=> b!1522635 m!1405683))

(declare-fun m!1405687 () Bool)

(assert (=> b!1522635 m!1405687))

(declare-fun m!1405689 () Bool)

(assert (=> b!1522635 m!1405689))

(assert (=> b!1522635 m!1405683))

(declare-fun m!1405691 () Bool)

(assert (=> b!1522635 m!1405691))

(declare-fun m!1405693 () Bool)

(assert (=> bm!68398 m!1405693))

(assert (=> bm!68396 d!159173))

(assert (=> b!1522408 d!159153))

(declare-fun d!159175 () Bool)

(assert (=> d!159175 (arrayContainsKey!0 a!2804 lt!659646 #b00000000000000000000000000000000)))

(declare-fun lt!659713 () Unit!50912)

(assert (=> d!159175 (= lt!659713 (choose!13 a!2804 lt!659646 j!70))))

(assert (=> d!159175 (bvsge j!70 #b00000000000000000000000000000000)))

(assert (=> d!159175 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659646 j!70) lt!659713)))

(declare-fun bs!43703 () Bool)

(assert (= bs!43703 d!159175))

(assert (=> bs!43703 m!1405573))

(declare-fun m!1405695 () Bool)

(assert (=> bs!43703 m!1405695))

(assert (=> b!1522500 d!159175))

(declare-fun d!159177 () Bool)

(declare-fun res!1041625 () Bool)

(declare-fun e!849009 () Bool)

(assert (=> d!159177 (=> res!1041625 e!849009)))

(assert (=> d!159177 (= res!1041625 (= (select (arr!48899 a!2804) #b00000000000000000000000000000000) lt!659646))))

(assert (=> d!159177 (= (arrayContainsKey!0 a!2804 lt!659646 #b00000000000000000000000000000000) e!849009)))

(declare-fun b!1522636 () Bool)

(declare-fun e!849010 () Bool)

(assert (=> b!1522636 (= e!849009 e!849010)))

(declare-fun res!1041626 () Bool)

(assert (=> b!1522636 (=> (not res!1041626) (not e!849010))))

(assert (=> b!1522636 (= res!1041626 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49449 a!2804)))))

(declare-fun b!1522637 () Bool)

(assert (=> b!1522637 (= e!849010 (arrayContainsKey!0 a!2804 lt!659646 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!159177 (not res!1041625)) b!1522636))

(assert (= (and b!1522636 res!1041626) b!1522637))

(assert (=> d!159177 m!1405515))

(declare-fun m!1405697 () Bool)

(assert (=> b!1522637 m!1405697))

(assert (=> b!1522500 d!159177))

(declare-fun b!1522638 () Bool)

(declare-fun e!849012 () SeekEntryResult!13064)

(declare-fun e!849011 () SeekEntryResult!13064)

(assert (=> b!1522638 (= e!849012 e!849011)))

(declare-fun lt!659715 () (_ BitVec 64))

(declare-fun lt!659716 () SeekEntryResult!13064)

(assert (=> b!1522638 (= lt!659715 (select (arr!48899 a!2804) (index!54653 lt!659716)))))

(declare-fun c!140054 () Bool)

(assert (=> b!1522638 (= c!140054 (= lt!659715 (select (arr!48899 a!2804) j!70)))))

(declare-fun e!849013 () SeekEntryResult!13064)

(declare-fun b!1522639 () Bool)

(assert (=> b!1522639 (= e!849013 (seekKeyOrZeroReturnVacant!0 (x!136340 lt!659716) (index!54653 lt!659716) (index!54653 lt!659716) (select (arr!48899 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522640 () Bool)

(assert (=> b!1522640 (= e!849013 (MissingZero!13064 (index!54653 lt!659716)))))

(declare-fun b!1522641 () Bool)

(assert (=> b!1522641 (= e!849012 Undefined!13064)))

(declare-fun b!1522642 () Bool)

(declare-fun c!140053 () Bool)

(assert (=> b!1522642 (= c!140053 (= lt!659715 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522642 (= e!849011 e!849013)))

(declare-fun d!159179 () Bool)

(declare-fun lt!659714 () SeekEntryResult!13064)

(assert (=> d!159179 (and (or (is-Undefined!13064 lt!659714) (not (is-Found!13064 lt!659714)) (and (bvsge (index!54652 lt!659714) #b00000000000000000000000000000000) (bvslt (index!54652 lt!659714) (size!49449 a!2804)))) (or (is-Undefined!13064 lt!659714) (is-Found!13064 lt!659714) (not (is-MissingZero!13064 lt!659714)) (and (bvsge (index!54651 lt!659714) #b00000000000000000000000000000000) (bvslt (index!54651 lt!659714) (size!49449 a!2804)))) (or (is-Undefined!13064 lt!659714) (is-Found!13064 lt!659714) (is-MissingZero!13064 lt!659714) (not (is-MissingVacant!13064 lt!659714)) (and (bvsge (index!54654 lt!659714) #b00000000000000000000000000000000) (bvslt (index!54654 lt!659714) (size!49449 a!2804)))) (or (is-Undefined!13064 lt!659714) (ite (is-Found!13064 lt!659714) (= (select (arr!48899 a!2804) (index!54652 lt!659714)) (select (arr!48899 a!2804) j!70)) (ite (is-MissingZero!13064 lt!659714) (= (select (arr!48899 a!2804) (index!54651 lt!659714)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!13064 lt!659714) (= (select (arr!48899 a!2804) (index!54654 lt!659714)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!159179 (= lt!659714 e!849012)))

(declare-fun c!140055 () Bool)

(assert (=> d!159179 (= c!140055 (and (is-Intermediate!13064 lt!659716) (undefined!13876 lt!659716)))))

(assert (=> d!159179 (= lt!659716 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48899 a!2804) j!70) mask!2512) (select (arr!48899 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159179 (validMask!0 mask!2512)))

(assert (=> d!159179 (= (seekEntryOrOpen!0 (select (arr!48899 a!2804) j!70) a!2804 mask!2512) lt!659714)))

(declare-fun b!1522643 () Bool)

(assert (=> b!1522643 (= e!849011 (Found!13064 (index!54653 lt!659716)))))

(assert (= (and d!159179 c!140055) b!1522641))

(assert (= (and d!159179 (not c!140055)) b!1522638))

(assert (= (and b!1522638 c!140054) b!1522643))

(assert (= (and b!1522638 (not c!140054)) b!1522642))

(assert (= (and b!1522642 c!140053) b!1522640))

(assert (= (and b!1522642 (not c!140053)) b!1522639))

(declare-fun m!1405699 () Bool)

(assert (=> b!1522638 m!1405699))

(assert (=> b!1522639 m!1405361))

(declare-fun m!1405701 () Bool)

(assert (=> b!1522639 m!1405701))

(assert (=> d!159179 m!1405361))

(assert (=> d!159179 m!1405375))

(assert (=> d!159179 m!1405375))

(assert (=> d!159179 m!1405361))

(assert (=> d!159179 m!1405377))

(declare-fun m!1405703 () Bool)

(assert (=> d!159179 m!1405703))

(declare-fun m!1405705 () Bool)

(assert (=> d!159179 m!1405705))

(declare-fun m!1405707 () Bool)

(assert (=> d!159179 m!1405707))

(assert (=> d!159179 m!1405365))

(assert (=> b!1522500 d!159179))

(assert (=> d!159077 d!159133))

(assert (=> b!1522410 d!159153))

(declare-fun b!1522644 () Bool)

(declare-fun e!849014 () Bool)

(declare-fun call!68402 () Bool)

(assert (=> b!1522644 (= e!849014 call!68402)))

(declare-fun b!1522645 () Bool)

(declare-fun e!849015 () Bool)

(assert (=> b!1522645 (= e!849015 e!849014)))

(declare-fun c!140056 () Bool)

(assert (=> b!1522645 (= c!140056 (validKeyInArray!0 (select (arr!48899 a!2804) (bvadd j!70 #b00000000000000000000000000000001))))))

(declare-fun b!1522646 () Bool)

(declare-fun e!849016 () Bool)

(assert (=> b!1522646 (= e!849016 call!68402)))

(declare-fun b!1522647 () Bool)

(assert (=> b!1522647 (= e!849014 e!849016)))

(declare-fun lt!659717 () (_ BitVec 64))

(assert (=> b!1522647 (= lt!659717 (select (arr!48899 a!2804) (bvadd j!70 #b00000000000000000000000000000001)))))

(declare-fun lt!659719 () Unit!50912)

(assert (=> b!1522647 (= lt!659719 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659717 (bvadd j!70 #b00000000000000000000000000000001)))))

(assert (=> b!1522647 (arrayContainsKey!0 a!2804 lt!659717 #b00000000000000000000000000000000)))

(declare-fun lt!659718 () Unit!50912)

(assert (=> b!1522647 (= lt!659718 lt!659719)))

(declare-fun res!1041627 () Bool)

(assert (=> b!1522647 (= res!1041627 (= (seekEntryOrOpen!0 (select (arr!48899 a!2804) (bvadd j!70 #b00000000000000000000000000000001)) a!2804 mask!2512) (Found!13064 (bvadd j!70 #b00000000000000000000000000000001))))))

(assert (=> b!1522647 (=> (not res!1041627) (not e!849016))))

(declare-fun bm!68399 () Bool)

(assert (=> bm!68399 (= call!68402 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!159181 () Bool)

(declare-fun res!1041628 () Bool)

(assert (=> d!159181 (=> res!1041628 e!849015)))

(assert (=> d!159181 (= res!1041628 (bvsge (bvadd j!70 #b00000000000000000000000000000001) (size!49449 a!2804)))))

(assert (=> d!159181 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512) e!849015)))

(assert (= (and d!159181 (not res!1041628)) b!1522645))

(assert (= (and b!1522645 c!140056) b!1522647))

(assert (= (and b!1522645 (not c!140056)) b!1522644))

(assert (= (and b!1522647 res!1041627) b!1522646))

(assert (= (or b!1522646 b!1522644) bm!68399))

(declare-fun m!1405709 () Bool)

(assert (=> b!1522645 m!1405709))

(assert (=> b!1522645 m!1405709))

(declare-fun m!1405711 () Bool)

(assert (=> b!1522645 m!1405711))

(assert (=> b!1522647 m!1405709))

(declare-fun m!1405713 () Bool)

(assert (=> b!1522647 m!1405713))

(declare-fun m!1405715 () Bool)

(assert (=> b!1522647 m!1405715))

(assert (=> b!1522647 m!1405709))

(declare-fun m!1405717 () Bool)

(assert (=> b!1522647 m!1405717))

(declare-fun m!1405719 () Bool)

(assert (=> bm!68399 m!1405719))

(assert (=> bm!68395 d!159181))

(declare-fun b!1522648 () Bool)

(declare-fun e!849019 () Bool)

(declare-fun call!68403 () Bool)

(assert (=> b!1522648 (= e!849019 call!68403)))

(declare-fun b!1522649 () Bool)

(declare-fun e!849020 () Bool)

(assert (=> b!1522649 (= e!849020 e!849019)))

(declare-fun c!140057 () Bool)

(assert (=> b!1522649 (= c!140057 (validKeyInArray!0 (select (arr!48899 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1522650 () Bool)

(assert (=> b!1522650 (= e!849019 call!68403)))

(declare-fun d!159183 () Bool)

(declare-fun res!1041629 () Bool)

(declare-fun e!849018 () Bool)

(assert (=> d!159183 (=> res!1041629 e!849018)))

(assert (=> d!159183 (= res!1041629 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49449 a!2804)))))

(assert (=> d!159183 (= (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139975 (Cons!35378 (select (arr!48899 a!2804) #b00000000000000000000000000000000) Nil!35379) Nil!35379)) e!849018)))

(declare-fun b!1522651 () Bool)

(assert (=> b!1522651 (= e!849018 e!849020)))

(declare-fun res!1041630 () Bool)

(assert (=> b!1522651 (=> (not res!1041630) (not e!849020))))

(declare-fun e!849017 () Bool)

(assert (=> b!1522651 (= res!1041630 (not e!849017))))

(declare-fun res!1041631 () Bool)

(assert (=> b!1522651 (=> (not res!1041631) (not e!849017))))

(assert (=> b!1522651 (= res!1041631 (validKeyInArray!0 (select (arr!48899 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!68400 () Bool)

(assert (=> bm!68400 (= call!68403 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!140057 (Cons!35378 (select (arr!48899 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!139975 (Cons!35378 (select (arr!48899 a!2804) #b00000000000000000000000000000000) Nil!35379) Nil!35379)) (ite c!139975 (Cons!35378 (select (arr!48899 a!2804) #b00000000000000000000000000000000) Nil!35379) Nil!35379))))))

(declare-fun b!1522652 () Bool)

(assert (=> b!1522652 (= e!849017 (contains!9986 (ite c!139975 (Cons!35378 (select (arr!48899 a!2804) #b00000000000000000000000000000000) Nil!35379) Nil!35379) (select (arr!48899 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!159183 (not res!1041629)) b!1522651))

(assert (= (and b!1522651 res!1041631) b!1522652))

(assert (= (and b!1522651 res!1041630) b!1522649))

(assert (= (and b!1522649 c!140057) b!1522650))

(assert (= (and b!1522649 (not c!140057)) b!1522648))

(assert (= (or b!1522650 b!1522648) bm!68400))

(assert (=> b!1522649 m!1405683))

(assert (=> b!1522649 m!1405683))

(assert (=> b!1522649 m!1405685))

(assert (=> b!1522651 m!1405683))

(assert (=> b!1522651 m!1405683))

(assert (=> b!1522651 m!1405685))

(assert (=> bm!68400 m!1405683))

(declare-fun m!1405721 () Bool)

(assert (=> bm!68400 m!1405721))

(assert (=> b!1522652 m!1405683))

(assert (=> b!1522652 m!1405683))

(declare-fun m!1405723 () Bool)

(assert (=> b!1522652 m!1405723))

(assert (=> bm!68385 d!159183))

(declare-fun e!849021 () SeekEntryResult!13064)

(declare-fun b!1522653 () Bool)

(assert (=> b!1522653 (= e!849021 (Intermediate!13064 true (nextIndex!0 (toIndex!0 (select (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun e!849023 () SeekEntryResult!13064)

(declare-fun b!1522654 () Bool)

(assert (=> b!1522654 (= e!849023 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101334 (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804)) mask!2512))))

(declare-fun b!1522655 () Bool)

(declare-fun lt!659720 () SeekEntryResult!13064)

(assert (=> b!1522655 (and (bvsge (index!54653 lt!659720) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659720) (size!49449 (array!101334 (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804)))))))

(declare-fun e!849025 () Bool)

(assert (=> b!1522655 (= e!849025 (= (select (arr!48899 (array!101334 (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804))) (index!54653 lt!659720)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522656 () Bool)

(declare-fun e!849022 () Bool)

(declare-fun e!849024 () Bool)

(assert (=> b!1522656 (= e!849022 e!849024)))

(declare-fun res!1041634 () Bool)

(assert (=> b!1522656 (= res!1041634 (and (is-Intermediate!13064 lt!659720) (not (undefined!13876 lt!659720)) (bvslt (x!136340 lt!659720) #b01111111111111111111111111111110) (bvsge (x!136340 lt!659720) #b00000000000000000000000000000000) (bvsge (x!136340 lt!659720) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1522656 (=> (not res!1041634) (not e!849024))))

(declare-fun b!1522658 () Bool)

(assert (=> b!1522658 (and (bvsge (index!54653 lt!659720) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659720) (size!49449 (array!101334 (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804)))))))

(declare-fun res!1041632 () Bool)

(assert (=> b!1522658 (= res!1041632 (= (select (arr!48899 (array!101334 (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804))) (index!54653 lt!659720)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522658 (=> res!1041632 e!849025)))

(declare-fun b!1522659 () Bool)

(assert (=> b!1522659 (= e!849022 (bvsge (x!136340 lt!659720) #b01111111111111111111111111111110))))

(declare-fun b!1522660 () Bool)

(assert (=> b!1522660 (= e!849023 (Intermediate!13064 false (nextIndex!0 (toIndex!0 (select (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1522661 () Bool)

(assert (=> b!1522661 (and (bvsge (index!54653 lt!659720) #b00000000000000000000000000000000) (bvslt (index!54653 lt!659720) (size!49449 (array!101334 (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804)))))))

(declare-fun res!1041633 () Bool)

(assert (=> b!1522661 (= res!1041633 (= (select (arr!48899 (array!101334 (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804))) (index!54653 lt!659720)) (select (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1522661 (=> res!1041633 e!849025)))

(assert (=> b!1522661 (= e!849024 e!849025)))

(declare-fun d!159185 () Bool)

(assert (=> d!159185 e!849022))

(declare-fun c!140058 () Bool)

(assert (=> d!159185 (= c!140058 (and (is-Intermediate!13064 lt!659720) (undefined!13876 lt!659720)))))

(assert (=> d!159185 (= lt!659720 e!849021)))

(declare-fun c!140059 () Bool)

(assert (=> d!159185 (= c!140059 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!659721 () (_ BitVec 64))

(assert (=> d!159185 (= lt!659721 (select (arr!48899 (array!101334 (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804))) (nextIndex!0 (toIndex!0 (select (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512)))))

(assert (=> d!159185 (validMask!0 mask!2512)))

(assert (=> d!159185 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101334 (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49449 a!2804)) mask!2512) lt!659720)))

(declare-fun b!1522657 () Bool)

(assert (=> b!1522657 (= e!849021 e!849023)))

(declare-fun c!140060 () Bool)

(assert (=> b!1522657 (= c!140060 (or (= lt!659721 (select (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!659721 lt!659721) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!159185 c!140059) b!1522653))

(assert (= (and d!159185 (not c!140059)) b!1522657))

(assert (= (and b!1522657 c!140060) b!1522660))

(assert (= (and b!1522657 (not c!140060)) b!1522654))

(assert (= (and d!159185 c!140058) b!1522659))

(assert (= (and d!159185 (not c!140058)) b!1522656))

(assert (= (and b!1522656 res!1041634) b!1522661))

(assert (= (and b!1522661 (not res!1041633)) b!1522658))

(assert (= (and b!1522658 (not res!1041632)) b!1522655))

(assert (=> b!1522654 m!1405605))

(declare-fun m!1405725 () Bool)

(assert (=> b!1522654 m!1405725))

(assert (=> b!1522654 m!1405725))

(assert (=> b!1522654 m!1405387))

(declare-fun m!1405727 () Bool)

(assert (=> b!1522654 m!1405727))

(declare-fun m!1405729 () Bool)

(assert (=> b!1522655 m!1405729))

(assert (=> d!159185 m!1405605))

(declare-fun m!1405731 () Bool)

(assert (=> d!159185 m!1405731))

(assert (=> d!159185 m!1405365))

(assert (=> b!1522661 m!1405729))

(assert (=> b!1522658 m!1405729))

(assert (=> b!1522542 d!159185))

(declare-fun d!159187 () Bool)

(declare-fun lt!659722 () (_ BitVec 32))

(assert (=> d!159187 (and (bvsge lt!659722 #b00000000000000000000000000000000) (bvslt lt!659722 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(assert (=> d!159187 (= lt!659722 (choose!52 (toIndex!0 (select (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512))))

(assert (=> d!159187 (validMask!0 mask!2512)))

(assert (=> d!159187 (= (nextIndex!0 (toIndex!0 (select (store (arr!48899 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) lt!659722)))

(declare-fun bs!43704 () Bool)

(assert (= bs!43704 d!159187))

(assert (=> bs!43704 m!1405389))

(declare-fun m!1405733 () Bool)

(assert (=> bs!43704 m!1405733))

(assert (=> bs!43704 m!1405365))

(assert (=> b!1522542 d!159187))

(declare-fun d!159189 () Bool)

(declare-fun lt!659725 () Bool)

(declare-fun content!788 (List!35382) (Set (_ BitVec 64)))

(assert (=> d!159189 (= lt!659725 (set.member (select (arr!48899 a!2804) #b00000000000000000000000000000000) (content!788 Nil!35379)))))

(declare-fun e!849030 () Bool)

(assert (=> d!159189 (= lt!659725 e!849030)))

(declare-fun res!1041640 () Bool)

(assert (=> d!159189 (=> (not res!1041640) (not e!849030))))

(assert (=> d!159189 (= res!1041640 (is-Cons!35378 Nil!35379))))

(assert (=> d!159189 (= (contains!9986 Nil!35379 (select (arr!48899 a!2804) #b00000000000000000000000000000000)) lt!659725)))

(declare-fun b!1522666 () Bool)

(declare-fun e!849031 () Bool)

(assert (=> b!1522666 (= e!849030 e!849031)))

(declare-fun res!1041639 () Bool)

(assert (=> b!1522666 (=> res!1041639 e!849031)))

(assert (=> b!1522666 (= res!1041639 (= (h!36799 Nil!35379) (select (arr!48899 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1522667 () Bool)

(assert (=> b!1522667 (= e!849031 (contains!9986 (t!50076 Nil!35379) (select (arr!48899 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!159189 res!1041640) b!1522666))

(assert (= (and b!1522666 (not res!1041639)) b!1522667))

(declare-fun m!1405735 () Bool)

(assert (=> d!159189 m!1405735))

(assert (=> d!159189 m!1405515))

(declare-fun m!1405737 () Bool)

(assert (=> d!159189 m!1405737))

(assert (=> b!1522667 m!1405515))

(declare-fun m!1405739 () Bool)

(assert (=> b!1522667 m!1405739))

(assert (=> b!1522411 d!159189))

(push 1)

(assert (not b!1522652))

(assert (not bm!68400))

(assert (not b!1522635))

(assert (not b!1522651))

(assert (not d!159165))

(assert (not b!1522639))

(assert (not b!1522586))

(assert (not d!159185))

(assert (not d!159157))

(assert (not d!159187))

(assert (not b!1522600))

(assert (not b!1522667))

(assert (not d!159189))

(assert (not b!1522654))

(assert (not d!159179))

(assert (not d!159155))

(assert (not b!1522645))

(assert (not b!1522619))

(assert (not d!159171))

(assert (not b!1522637))

(assert (not b!1522633))

(assert (not d!159159))

(assert (not b!1522573))

(assert (not b!1522624))

(assert (not bm!68398))

(assert (not bm!68399))

(assert (not d!159167))

(assert (not d!159169))

(assert (not b!1522649))

(assert (not b!1522647))

(assert (not d!159163))

(assert (not d!159175))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

