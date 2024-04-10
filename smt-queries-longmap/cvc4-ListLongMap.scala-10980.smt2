; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128590 () Bool)

(assert start!128590)

(declare-fun b!1507537 () Bool)

(declare-fun res!1027759 () Bool)

(declare-fun e!842295 () Bool)

(assert (=> b!1507537 (=> (not res!1027759) (not e!842295))))

(declare-datatypes ((array!100563 0))(
  ( (array!100564 (arr!48523 (Array (_ BitVec 32) (_ BitVec 64))) (size!49073 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100563)

(declare-datatypes ((List!35006 0))(
  ( (Nil!35003) (Cons!35002 (h!36405 (_ BitVec 64)) (t!49700 List!35006)) )
))
(declare-fun arrayNoDuplicates!0 (array!100563 (_ BitVec 32) List!35006) Bool)

(assert (=> b!1507537 (= res!1027759 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35003))))

(declare-fun b!1507538 () Bool)

(declare-fun res!1027754 () Bool)

(assert (=> b!1507538 (=> (not res!1027754) (not e!842295))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1507538 (= res!1027754 (and (= (size!49073 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49073 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49073 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507539 () Bool)

(declare-fun res!1027756 () Bool)

(assert (=> b!1507539 (=> (not res!1027756) (not e!842295))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1507539 (= res!1027756 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49073 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49073 a!2804))))))

(declare-fun res!1027761 () Bool)

(assert (=> start!128590 (=> (not res!1027761) (not e!842295))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128590 (= res!1027761 (validMask!0 mask!2512))))

(assert (=> start!128590 e!842295))

(assert (=> start!128590 true))

(declare-fun array_inv!37551 (array!100563) Bool)

(assert (=> start!128590 (array_inv!37551 a!2804)))

(declare-fun b!1507536 () Bool)

(declare-fun e!842294 () Bool)

(assert (=> b!1507536 (= e!842295 e!842294)))

(declare-fun res!1027757 () Bool)

(assert (=> b!1507536 (=> (not res!1027757) (not e!842294))))

(declare-fun lt!654408 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12694 0))(
  ( (MissingZero!12694 (index!53171 (_ BitVec 32))) (Found!12694 (index!53172 (_ BitVec 32))) (Intermediate!12694 (undefined!13506 Bool) (index!53173 (_ BitVec 32)) (x!134922 (_ BitVec 32))) (Undefined!12694) (MissingVacant!12694 (index!53174 (_ BitVec 32))) )
))
(declare-fun lt!654409 () SeekEntryResult!12694)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100563 (_ BitVec 32)) SeekEntryResult!12694)

(assert (=> b!1507536 (= res!1027757 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!654408 (select (arr!48523 a!2804) j!70) a!2804 mask!2512) lt!654409))))

(assert (=> b!1507536 (= lt!654409 (Intermediate!12694 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507536 (= lt!654408 (toIndex!0 (select (arr!48523 a!2804) j!70) mask!2512))))

(declare-fun b!1507540 () Bool)

(declare-fun res!1027760 () Bool)

(assert (=> b!1507540 (=> (not res!1027760) (not e!842295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100563 (_ BitVec 32)) Bool)

(assert (=> b!1507540 (= res!1027760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507541 () Bool)

(assert (=> b!1507541 (= e!842294 (and (bvsge mask!2512 #b00000000000000000000000000000000) (or (bvslt lt!654408 #b00000000000000000000000000000000) (bvsge lt!654408 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(declare-fun b!1507542 () Bool)

(declare-fun res!1027762 () Bool)

(assert (=> b!1507542 (=> (not res!1027762) (not e!842294))))

(assert (=> b!1507542 (= res!1027762 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48523 a!2804) j!70) a!2804 mask!2512) lt!654409))))

(declare-fun b!1507543 () Bool)

(declare-fun res!1027755 () Bool)

(assert (=> b!1507543 (=> (not res!1027755) (not e!842295))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507543 (= res!1027755 (validKeyInArray!0 (select (arr!48523 a!2804) i!961)))))

(declare-fun b!1507544 () Bool)

(declare-fun res!1027758 () Bool)

(assert (=> b!1507544 (=> (not res!1027758) (not e!842295))))

(assert (=> b!1507544 (= res!1027758 (validKeyInArray!0 (select (arr!48523 a!2804) j!70)))))

(assert (= (and start!128590 res!1027761) b!1507538))

(assert (= (and b!1507538 res!1027754) b!1507543))

(assert (= (and b!1507543 res!1027755) b!1507544))

(assert (= (and b!1507544 res!1027758) b!1507540))

(assert (= (and b!1507540 res!1027760) b!1507537))

(assert (= (and b!1507537 res!1027759) b!1507539))

(assert (= (and b!1507539 res!1027756) b!1507536))

(assert (= (and b!1507536 res!1027757) b!1507542))

(assert (= (and b!1507542 res!1027762) b!1507541))

(declare-fun m!1390269 () Bool)

(assert (=> b!1507540 m!1390269))

(declare-fun m!1390271 () Bool)

(assert (=> b!1507537 m!1390271))

(declare-fun m!1390273 () Bool)

(assert (=> b!1507544 m!1390273))

(assert (=> b!1507544 m!1390273))

(declare-fun m!1390275 () Bool)

(assert (=> b!1507544 m!1390275))

(assert (=> b!1507542 m!1390273))

(assert (=> b!1507542 m!1390273))

(declare-fun m!1390277 () Bool)

(assert (=> b!1507542 m!1390277))

(assert (=> b!1507536 m!1390273))

(assert (=> b!1507536 m!1390273))

(declare-fun m!1390279 () Bool)

(assert (=> b!1507536 m!1390279))

(assert (=> b!1507536 m!1390273))

(declare-fun m!1390281 () Bool)

(assert (=> b!1507536 m!1390281))

(declare-fun m!1390283 () Bool)

(assert (=> b!1507543 m!1390283))

(assert (=> b!1507543 m!1390283))

(declare-fun m!1390285 () Bool)

(assert (=> b!1507543 m!1390285))

(declare-fun m!1390287 () Bool)

(assert (=> start!128590 m!1390287))

(declare-fun m!1390289 () Bool)

(assert (=> start!128590 m!1390289))

(push 1)

(assert (not b!1507542))

(assert (not b!1507536))

(assert (not b!1507544))

(assert (not b!1507543))

(assert (not b!1507540))

(assert (not start!128590))

(assert (not b!1507537))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!158327 () Bool)

(assert (=> d!158327 (= (validKeyInArray!0 (select (arr!48523 a!2804) j!70)) (and (not (= (select (arr!48523 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48523 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1507544 d!158327))

(declare-fun d!158333 () Bool)

(assert (=> d!158333 (= (validKeyInArray!0 (select (arr!48523 a!2804) i!961)) (and (not (= (select (arr!48523 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48523 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1507543 d!158333))

(declare-fun b!1507624 () Bool)

(declare-fun e!842349 () Bool)

(declare-fun e!842350 () Bool)

(assert (=> b!1507624 (= e!842349 e!842350)))

(declare-fun lt!654437 () (_ BitVec 64))

(assert (=> b!1507624 (= lt!654437 (select (arr!48523 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50332 0))(
  ( (Unit!50333) )
))
(declare-fun lt!654439 () Unit!50332)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100563 (_ BitVec 64) (_ BitVec 32)) Unit!50332)

(assert (=> b!1507624 (= lt!654439 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654437 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1507624 (arrayContainsKey!0 a!2804 lt!654437 #b00000000000000000000000000000000)))

(declare-fun lt!654438 () Unit!50332)

(assert (=> b!1507624 (= lt!654438 lt!654439)))

(declare-fun res!1027794 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100563 (_ BitVec 32)) SeekEntryResult!12694)

(assert (=> b!1507624 (= res!1027794 (= (seekEntryOrOpen!0 (select (arr!48523 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12694 #b00000000000000000000000000000000)))))

(assert (=> b!1507624 (=> (not res!1027794) (not e!842350))))

(declare-fun b!1507625 () Bool)

(declare-fun call!68265 () Bool)

(assert (=> b!1507625 (= e!842349 call!68265)))

(declare-fun d!158335 () Bool)

(declare-fun res!1027795 () Bool)

(declare-fun e!842348 () Bool)

(assert (=> d!158335 (=> res!1027795 e!842348)))

(assert (=> d!158335 (= res!1027795 (bvsge #b00000000000000000000000000000000 (size!49073 a!2804)))))

(assert (=> d!158335 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!842348)))

(declare-fun b!1507626 () Bool)

(assert (=> b!1507626 (= e!842350 call!68265)))

(declare-fun b!1507627 () Bool)

(assert (=> b!1507627 (= e!842348 e!842349)))

(declare-fun c!139452 () Bool)

(assert (=> b!1507627 (= c!139452 (validKeyInArray!0 (select (arr!48523 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68262 () Bool)

(assert (=> bm!68262 (= call!68265 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!158335 (not res!1027795)) b!1507627))

(assert (= (and b!1507627 c!139452) b!1507624))

(assert (= (and b!1507627 (not c!139452)) b!1507625))

(assert (= (and b!1507624 res!1027794) b!1507626))

(assert (= (or b!1507626 b!1507625) bm!68262))

(declare-fun m!1390323 () Bool)

(assert (=> b!1507624 m!1390323))

(declare-fun m!1390325 () Bool)

(assert (=> b!1507624 m!1390325))

(declare-fun m!1390327 () Bool)

(assert (=> b!1507624 m!1390327))

(assert (=> b!1507624 m!1390323))

(declare-fun m!1390329 () Bool)

(assert (=> b!1507624 m!1390329))

(assert (=> b!1507627 m!1390323))

(assert (=> b!1507627 m!1390323))

(declare-fun m!1390331 () Bool)

(assert (=> b!1507627 m!1390331))

(declare-fun m!1390333 () Bool)

(assert (=> bm!68262 m!1390333))

(assert (=> b!1507540 d!158335))

(declare-fun d!158343 () Bool)

(assert (=> d!158343 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128590 d!158343))

(declare-fun d!158359 () Bool)

(assert (=> d!158359 (= (array_inv!37551 a!2804) (bvsge (size!49073 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128590 d!158359))

(declare-fun b!1507701 () Bool)

(declare-fun e!842400 () Bool)

(declare-fun e!842399 () Bool)

(assert (=> b!1507701 (= e!842400 e!842399)))

(declare-fun res!1027833 () Bool)

(declare-fun lt!654470 () SeekEntryResult!12694)

(assert (=> b!1507701 (= res!1027833 (and (is-Intermediate!12694 lt!654470) (not (undefined!13506 lt!654470)) (bvslt (x!134922 lt!654470) #b01111111111111111111111111111110) (bvsge (x!134922 lt!654470) #b00000000000000000000000000000000) (bvsge (x!134922 lt!654470) #b00000000000000000000000000000000)))))

(assert (=> b!1507701 (=> (not res!1027833) (not e!842399))))

(declare-fun b!1507702 () Bool)

(declare-fun e!842398 () SeekEntryResult!12694)

(assert (=> b!1507702 (= e!842398 (Intermediate!12694 false lt!654408 #b00000000000000000000000000000000))))

(declare-fun b!1507703 () Bool)

(assert (=> b!1507703 (and (bvsge (index!53173 lt!654470) #b00000000000000000000000000000000) (bvslt (index!53173 lt!654470) (size!49073 a!2804)))))

(declare-fun res!1027831 () Bool)

(assert (=> b!1507703 (= res!1027831 (= (select (arr!48523 a!2804) (index!53173 lt!654470)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!842401 () Bool)

(assert (=> b!1507703 (=> res!1027831 e!842401)))

(declare-fun d!158361 () Bool)

(assert (=> d!158361 e!842400))

(declare-fun c!139474 () Bool)

(assert (=> d!158361 (= c!139474 (and (is-Intermediate!12694 lt!654470) (undefined!13506 lt!654470)))))

(declare-fun e!842402 () SeekEntryResult!12694)

(assert (=> d!158361 (= lt!654470 e!842402)))

(declare-fun c!139475 () Bool)

(assert (=> d!158361 (= c!139475 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!654469 () (_ BitVec 64))

(assert (=> d!158361 (= lt!654469 (select (arr!48523 a!2804) lt!654408))))

(assert (=> d!158361 (validMask!0 mask!2512)))

(assert (=> d!158361 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!654408 (select (arr!48523 a!2804) j!70) a!2804 mask!2512) lt!654470)))

(declare-fun b!1507704 () Bool)

(assert (=> b!1507704 (and (bvsge (index!53173 lt!654470) #b00000000000000000000000000000000) (bvslt (index!53173 lt!654470) (size!49073 a!2804)))))

(assert (=> b!1507704 (= e!842401 (= (select (arr!48523 a!2804) (index!53173 lt!654470)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1507705 () Bool)

(assert (=> b!1507705 (= e!842402 e!842398)))

(declare-fun c!139473 () Bool)

(assert (=> b!1507705 (= c!139473 (or (= lt!654469 (select (arr!48523 a!2804) j!70)) (= (bvadd lt!654469 lt!654469) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1507706 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507706 (= e!842398 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!654408 #b00000000000000000000000000000000 mask!2512) (select (arr!48523 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1507707 () Bool)

(assert (=> b!1507707 (= e!842400 (bvsge (x!134922 lt!654470) #b01111111111111111111111111111110))))

(declare-fun b!1507708 () Bool)

(assert (=> b!1507708 (and (bvsge (index!53173 lt!654470) #b00000000000000000000000000000000) (bvslt (index!53173 lt!654470) (size!49073 a!2804)))))

(declare-fun res!1027832 () Bool)

(assert (=> b!1507708 (= res!1027832 (= (select (arr!48523 a!2804) (index!53173 lt!654470)) (select (arr!48523 a!2804) j!70)))))

(assert (=> b!1507708 (=> res!1027832 e!842401)))

(assert (=> b!1507708 (= e!842399 e!842401)))

(declare-fun b!1507709 () Bool)

(assert (=> b!1507709 (= e!842402 (Intermediate!12694 true lt!654408 #b00000000000000000000000000000000))))

(assert (= (and d!158361 c!139475) b!1507709))

(assert (= (and d!158361 (not c!139475)) b!1507705))

(assert (= (and b!1507705 c!139473) b!1507702))

(assert (= (and b!1507705 (not c!139473)) b!1507706))

(assert (= (and d!158361 c!139474) b!1507707))

(assert (= (and d!158361 (not c!139474)) b!1507701))

(assert (= (and b!1507701 res!1027833) b!1507708))

(assert (= (and b!1507708 (not res!1027832)) b!1507703))

(assert (= (and b!1507703 (not res!1027831)) b!1507704))

(declare-fun m!1390367 () Bool)

(assert (=> b!1507703 m!1390367))

(declare-fun m!1390369 () Bool)

(assert (=> b!1507706 m!1390369))

(assert (=> b!1507706 m!1390369))

(assert (=> b!1507706 m!1390273))

(declare-fun m!1390371 () Bool)

(assert (=> b!1507706 m!1390371))

(declare-fun m!1390373 () Bool)

(assert (=> d!158361 m!1390373))

(assert (=> d!158361 m!1390287))

(assert (=> b!1507704 m!1390367))

(assert (=> b!1507708 m!1390367))

(assert (=> b!1507536 d!158361))

(declare-fun d!158369 () Bool)

(declare-fun lt!654476 () (_ BitVec 32))

(declare-fun lt!654475 () (_ BitVec 32))

(assert (=> d!158369 (= lt!654476 (bvmul (bvxor lt!654475 (bvlshr lt!654475 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158369 (= lt!654475 ((_ extract 31 0) (bvand (bvxor (select (arr!48523 a!2804) j!70) (bvlshr (select (arr!48523 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158369 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1027834 (let ((h!36408 ((_ extract 31 0) (bvand (bvxor (select (arr!48523 a!2804) j!70) (bvlshr (select (arr!48523 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!134928 (bvmul (bvxor h!36408 (bvlshr h!36408 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!134928 (bvlshr x!134928 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1027834 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1027834 #b00000000000000000000000000000000))))))

(assert (=> d!158369 (= (toIndex!0 (select (arr!48523 a!2804) j!70) mask!2512) (bvand (bvxor lt!654476 (bvlshr lt!654476 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1507536 d!158369))

(declare-fun b!1507720 () Bool)

