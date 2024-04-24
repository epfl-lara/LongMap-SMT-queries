; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130032 () Bool)

(assert start!130032)

(declare-fun res!1042286 () Bool)

(declare-fun e!850166 () Bool)

(assert (=> start!130032 (=> (not res!1042286) (not e!850166))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130032 (= res!1042286 (validMask!0 mask!2512))))

(assert (=> start!130032 e!850166))

(assert (=> start!130032 true))

(declare-datatypes ((array!101456 0))(
  ( (array!101457 (arr!48954 (Array (_ BitVec 32) (_ BitVec 64))) (size!49505 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101456)

(declare-fun array_inv!38235 (array!101456) Bool)

(assert (=> start!130032 (array_inv!38235 a!2804)))

(declare-fun b!1524490 () Bool)

(declare-fun res!1042293 () Bool)

(assert (=> b!1524490 (=> (not res!1042293) (not e!850166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101456 (_ BitVec 32)) Bool)

(assert (=> b!1524490 (= res!1042293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1524491 () Bool)

(declare-fun res!1042290 () Bool)

(assert (=> b!1524491 (=> (not res!1042290) (not e!850166))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1524491 (= res!1042290 (validKeyInArray!0 (select (arr!48954 a!2804) i!961)))))

(declare-fun b!1524492 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun e!850167 () Bool)

(declare-datatypes ((SeekEntryResult!13012 0))(
  ( (MissingZero!13012 (index!54443 (_ BitVec 32))) (Found!13012 (index!54444 (_ BitVec 32))) (Intermediate!13012 (undefined!13824 Bool) (index!54445 (_ BitVec 32)) (x!136333 (_ BitVec 32))) (Undefined!13012) (MissingVacant!13012 (index!54446 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101456 (_ BitVec 32)) SeekEntryResult!13012)

(assert (=> b!1524492 (= e!850167 (not (= (seekEntry!0 (select (arr!48954 a!2804) j!70) a!2804 mask!2512) (Found!13012 j!70))))))

(assert (=> b!1524492 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-datatypes ((Unit!50843 0))(
  ( (Unit!50844) )
))
(declare-fun lt!660388 () Unit!50843)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101456 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50843)

(assert (=> b!1524492 (= lt!660388 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1524493 () Bool)

(declare-fun res!1042288 () Bool)

(assert (=> b!1524493 (=> (not res!1042288) (not e!850166))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1524493 (= res!1042288 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49505 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49505 a!2804))))))

(declare-fun b!1524494 () Bool)

(declare-fun res!1042295 () Bool)

(assert (=> b!1524494 (=> (not res!1042295) (not e!850167))))

(declare-fun lt!660386 () SeekEntryResult!13012)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101456 (_ BitVec 32)) SeekEntryResult!13012)

(assert (=> b!1524494 (= res!1042295 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48954 a!2804) j!70) a!2804 mask!2512) lt!660386))))

(declare-fun b!1524495 () Bool)

(declare-fun res!1042289 () Bool)

(assert (=> b!1524495 (=> (not res!1042289) (not e!850167))))

(declare-fun lt!660387 () SeekEntryResult!13012)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524495 (= res!1042289 (= lt!660387 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101457 (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49505 a!2804)) mask!2512)))))

(declare-fun b!1524496 () Bool)

(declare-fun res!1042292 () Bool)

(assert (=> b!1524496 (=> (not res!1042292) (not e!850166))))

(declare-datatypes ((List!35424 0))(
  ( (Nil!35421) (Cons!35420 (h!36859 (_ BitVec 64)) (t!50110 List!35424)) )
))
(declare-fun arrayNoDuplicates!0 (array!101456 (_ BitVec 32) List!35424) Bool)

(assert (=> b!1524496 (= res!1042292 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35421))))

(declare-fun b!1524497 () Bool)

(declare-fun res!1042294 () Bool)

(assert (=> b!1524497 (=> (not res!1042294) (not e!850166))))

(assert (=> b!1524497 (= res!1042294 (validKeyInArray!0 (select (arr!48954 a!2804) j!70)))))

(declare-fun b!1524498 () Bool)

(assert (=> b!1524498 (= e!850166 e!850167)))

(declare-fun res!1042287 () Bool)

(assert (=> b!1524498 (=> (not res!1042287) (not e!850167))))

(assert (=> b!1524498 (= res!1042287 (= lt!660387 lt!660386))))

(assert (=> b!1524498 (= lt!660386 (Intermediate!13012 false resIndex!21 resX!21))))

(assert (=> b!1524498 (= lt!660387 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48954 a!2804) j!70) mask!2512) (select (arr!48954 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524499 () Bool)

(declare-fun res!1042291 () Bool)

(assert (=> b!1524499 (=> (not res!1042291) (not e!850166))))

(assert (=> b!1524499 (= res!1042291 (and (= (size!49505 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49505 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49505 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!130032 res!1042286) b!1524499))

(assert (= (and b!1524499 res!1042291) b!1524491))

(assert (= (and b!1524491 res!1042290) b!1524497))

(assert (= (and b!1524497 res!1042294) b!1524490))

(assert (= (and b!1524490 res!1042293) b!1524496))

(assert (= (and b!1524496 res!1042292) b!1524493))

(assert (= (and b!1524493 res!1042288) b!1524498))

(assert (= (and b!1524498 res!1042287) b!1524494))

(assert (= (and b!1524494 res!1042295) b!1524495))

(assert (= (and b!1524495 res!1042289) b!1524492))

(declare-fun m!1407501 () Bool)

(assert (=> b!1524490 m!1407501))

(declare-fun m!1407503 () Bool)

(assert (=> b!1524492 m!1407503))

(assert (=> b!1524492 m!1407503))

(declare-fun m!1407505 () Bool)

(assert (=> b!1524492 m!1407505))

(declare-fun m!1407507 () Bool)

(assert (=> b!1524492 m!1407507))

(declare-fun m!1407509 () Bool)

(assert (=> b!1524492 m!1407509))

(declare-fun m!1407511 () Bool)

(assert (=> start!130032 m!1407511))

(declare-fun m!1407513 () Bool)

(assert (=> start!130032 m!1407513))

(assert (=> b!1524497 m!1407503))

(assert (=> b!1524497 m!1407503))

(declare-fun m!1407515 () Bool)

(assert (=> b!1524497 m!1407515))

(assert (=> b!1524498 m!1407503))

(assert (=> b!1524498 m!1407503))

(declare-fun m!1407517 () Bool)

(assert (=> b!1524498 m!1407517))

(assert (=> b!1524498 m!1407517))

(assert (=> b!1524498 m!1407503))

(declare-fun m!1407519 () Bool)

(assert (=> b!1524498 m!1407519))

(declare-fun m!1407521 () Bool)

(assert (=> b!1524495 m!1407521))

(declare-fun m!1407523 () Bool)

(assert (=> b!1524495 m!1407523))

(assert (=> b!1524495 m!1407523))

(declare-fun m!1407525 () Bool)

(assert (=> b!1524495 m!1407525))

(assert (=> b!1524495 m!1407525))

(assert (=> b!1524495 m!1407523))

(declare-fun m!1407527 () Bool)

(assert (=> b!1524495 m!1407527))

(assert (=> b!1524494 m!1407503))

(assert (=> b!1524494 m!1407503))

(declare-fun m!1407529 () Bool)

(assert (=> b!1524494 m!1407529))

(declare-fun m!1407531 () Bool)

(assert (=> b!1524491 m!1407531))

(assert (=> b!1524491 m!1407531))

(declare-fun m!1407533 () Bool)

(assert (=> b!1524491 m!1407533))

(declare-fun m!1407535 () Bool)

(assert (=> b!1524496 m!1407535))

(push 1)

(assert (not b!1524497))

(assert (not b!1524492))

(assert (not b!1524490))

(assert (not b!1524494))

(assert (not b!1524496))

(assert (not start!130032))

(assert (not b!1524495))

(assert (not b!1524498))

(assert (not b!1524491))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1524566 () Bool)

(declare-fun e!850206 () Bool)

(declare-fun e!850209 () Bool)

(assert (=> b!1524566 (= e!850206 e!850209)))

(declare-fun res!1042308 () Bool)

(declare-fun lt!660430 () SeekEntryResult!13012)

(assert (=> b!1524566 (= res!1042308 (and (is-Intermediate!13012 lt!660430) (not (undefined!13824 lt!660430)) (bvslt (x!136333 lt!660430) #b01111111111111111111111111111110) (bvsge (x!136333 lt!660430) #b00000000000000000000000000000000) (bvsge (x!136333 lt!660430) #b00000000000000000000000000000000)))))

(assert (=> b!1524566 (=> (not res!1042308) (not e!850209))))

(declare-fun e!850205 () SeekEntryResult!13012)

(declare-fun b!1524567 () Bool)

(assert (=> b!1524567 (= e!850205 (Intermediate!13012 true (toIndex!0 (select (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1524568 () Bool)

(declare-fun e!850208 () SeekEntryResult!13012)

(assert (=> b!1524568 (= e!850205 e!850208)))

(declare-fun c!140687 () Bool)

(declare-fun lt!660429 () (_ BitVec 64))

(assert (=> b!1524568 (= c!140687 (or (= lt!660429 (select (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!660429 lt!660429) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1524569 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524569 (= e!850208 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101457 (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49505 a!2804)) mask!2512))))

(declare-fun d!159711 () Bool)

(assert (=> d!159711 e!850206))

(declare-fun c!140689 () Bool)

(assert (=> d!159711 (= c!140689 (and (is-Intermediate!13012 lt!660430) (undefined!13824 lt!660430)))))

(assert (=> d!159711 (= lt!660430 e!850205)))

(declare-fun c!140688 () Bool)

(assert (=> d!159711 (= c!140688 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159711 (= lt!660429 (select (arr!48954 (array!101457 (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49505 a!2804))) (toIndex!0 (select (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!159711 (validMask!0 mask!2512)))

(assert (=> d!159711 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101457 (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49505 a!2804)) mask!2512) lt!660430)))

(declare-fun b!1524570 () Bool)

(assert (=> b!1524570 (and (bvsge (index!54445 lt!660430) #b00000000000000000000000000000000) (bvslt (index!54445 lt!660430) (size!49505 (array!101457 (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49505 a!2804)))))))

(declare-fun res!1042309 () Bool)

(assert (=> b!1524570 (= res!1042309 (= (select (arr!48954 (array!101457 (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49505 a!2804))) (index!54445 lt!660430)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!850207 () Bool)

(assert (=> b!1524570 (=> res!1042309 e!850207)))

(declare-fun b!1524571 () Bool)

(assert (=> b!1524571 (and (bvsge (index!54445 lt!660430) #b00000000000000000000000000000000) (bvslt (index!54445 lt!660430) (size!49505 (array!101457 (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49505 a!2804)))))))

(declare-fun res!1042310 () Bool)

(assert (=> b!1524571 (= res!1042310 (= (select (arr!48954 (array!101457 (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49505 a!2804))) (index!54445 lt!660430)) (select (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1524571 (=> res!1042310 e!850207)))

(assert (=> b!1524571 (= e!850209 e!850207)))

(declare-fun b!1524572 () Bool)

(assert (=> b!1524572 (= e!850208 (Intermediate!13012 false (toIndex!0 (select (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1524573 () Bool)

(assert (=> b!1524573 (= e!850206 (bvsge (x!136333 lt!660430) #b01111111111111111111111111111110))))

(declare-fun b!1524574 () Bool)

(assert (=> b!1524574 (and (bvsge (index!54445 lt!660430) #b00000000000000000000000000000000) (bvslt (index!54445 lt!660430) (size!49505 (array!101457 (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49505 a!2804)))))))

(assert (=> b!1524574 (= e!850207 (= (select (arr!48954 (array!101457 (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49505 a!2804))) (index!54445 lt!660430)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!159711 c!140688) b!1524567))

(assert (= (and d!159711 (not c!140688)) b!1524568))

(assert (= (and b!1524568 c!140687) b!1524572))

(assert (= (and b!1524568 (not c!140687)) b!1524569))

(assert (= (and d!159711 c!140689) b!1524573))

(assert (= (and d!159711 (not c!140689)) b!1524566))

(assert (= (and b!1524566 res!1042308) b!1524571))

(assert (= (and b!1524571 (not res!1042310)) b!1524570))

(assert (= (and b!1524570 (not res!1042309)) b!1524574))

(declare-fun m!1407559 () Bool)

(assert (=> b!1524574 m!1407559))

(assert (=> d!159711 m!1407525))

(declare-fun m!1407561 () Bool)

(assert (=> d!159711 m!1407561))

(assert (=> d!159711 m!1407511))

(assert (=> b!1524569 m!1407525))

(declare-fun m!1407563 () Bool)

(assert (=> b!1524569 m!1407563))

(assert (=> b!1524569 m!1407563))

(assert (=> b!1524569 m!1407523))

(declare-fun m!1407565 () Bool)

(assert (=> b!1524569 m!1407565))

(assert (=> b!1524571 m!1407559))

(assert (=> b!1524570 m!1407559))

(assert (=> b!1524495 d!159711))

(declare-fun d!159723 () Bool)

(declare-fun lt!660445 () (_ BitVec 32))

(declare-fun lt!660444 () (_ BitVec 32))

(assert (=> d!159723 (= lt!660445 (bvmul (bvxor lt!660444 (bvlshr lt!660444 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159723 (= lt!660444 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159723 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1042311 (let ((h!36860 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136335 (bvmul (bvxor h!36860 (bvlshr h!36860 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136335 (bvlshr x!136335 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1042311 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1042311 #b00000000000000000000000000000000))))))

(assert (=> d!159723 (= (toIndex!0 (select (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!660445 (bvlshr lt!660445 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1524495 d!159723))

(declare-fun b!1524591 () Bool)

(declare-fun e!850220 () Bool)

(declare-fun e!850224 () Bool)

(assert (=> b!1524591 (= e!850220 e!850224)))

(declare-fun res!1042318 () Bool)

(declare-fun lt!660451 () SeekEntryResult!13012)

(assert (=> b!1524591 (= res!1042318 (and (is-Intermediate!13012 lt!660451) (not (undefined!13824 lt!660451)) (bvslt (x!136333 lt!660451) #b01111111111111111111111111111110) (bvsge (x!136333 lt!660451) #b00000000000000000000000000000000) (bvsge (x!136333 lt!660451) x!534)))))

(assert (=> b!1524591 (=> (not res!1042318) (not e!850224))))

(declare-fun b!1524592 () Bool)

(declare-fun e!850219 () SeekEntryResult!13012)

(assert (=> b!1524592 (= e!850219 (Intermediate!13012 true index!487 x!534))))

(declare-fun b!1524593 () Bool)

(declare-fun e!850223 () SeekEntryResult!13012)

(assert (=> b!1524593 (= e!850219 e!850223)))

(declare-fun lt!660450 () (_ BitVec 64))

(declare-fun c!140693 () Bool)

(assert (=> b!1524593 (= c!140693 (or (= lt!660450 (select (arr!48954 a!2804) j!70)) (= (bvadd lt!660450 lt!660450) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1524594 () Bool)

(assert (=> b!1524594 (= e!850223 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (select (arr!48954 a!2804) j!70) a!2804 mask!2512))))

(declare-fun d!159725 () Bool)

(assert (=> d!159725 e!850220))

(declare-fun c!140696 () Bool)

(assert (=> d!159725 (= c!140696 (and (is-Intermediate!13012 lt!660451) (undefined!13824 lt!660451)))))

(assert (=> d!159725 (= lt!660451 e!850219)))

(declare-fun c!140695 () Bool)

(assert (=> d!159725 (= c!140695 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!159725 (= lt!660450 (select (arr!48954 a!2804) index!487))))

(assert (=> d!159725 (validMask!0 mask!2512)))

(assert (=> d!159725 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48954 a!2804) j!70) a!2804 mask!2512) lt!660451)))

(declare-fun b!1524595 () Bool)

(assert (=> b!1524595 (and (bvsge (index!54445 lt!660451) #b00000000000000000000000000000000) (bvslt (index!54445 lt!660451) (size!49505 a!2804)))))

(declare-fun res!1042319 () Bool)

(assert (=> b!1524595 (= res!1042319 (= (select (arr!48954 a!2804) (index!54445 lt!660451)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!850221 () Bool)

(assert (=> b!1524595 (=> res!1042319 e!850221)))

(declare-fun b!1524596 () Bool)

(assert (=> b!1524596 (and (bvsge (index!54445 lt!660451) #b00000000000000000000000000000000) (bvslt (index!54445 lt!660451) (size!49505 a!2804)))))

(declare-fun res!1042320 () Bool)

(assert (=> b!1524596 (= res!1042320 (= (select (arr!48954 a!2804) (index!54445 lt!660451)) (select (arr!48954 a!2804) j!70)))))

(assert (=> b!1524596 (=> res!1042320 e!850221)))

(assert (=> b!1524596 (= e!850224 e!850221)))

(declare-fun b!1524597 () Bool)

(assert (=> b!1524597 (= e!850223 (Intermediate!13012 false index!487 x!534))))

(declare-fun b!1524598 () Bool)

(assert (=> b!1524598 (= e!850220 (bvsge (x!136333 lt!660451) #b01111111111111111111111111111110))))

(declare-fun b!1524599 () Bool)

(assert (=> b!1524599 (and (bvsge (index!54445 lt!660451) #b00000000000000000000000000000000) (bvslt (index!54445 lt!660451) (size!49505 a!2804)))))

(assert (=> b!1524599 (= e!850221 (= (select (arr!48954 a!2804) (index!54445 lt!660451)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!159725 c!140695) b!1524592))

(assert (= (and d!159725 (not c!140695)) b!1524593))

(assert (= (and b!1524593 c!140693) b!1524597))

(assert (= (and b!1524593 (not c!140693)) b!1524594))

(assert (= (and d!159725 c!140696) b!1524598))

(assert (= (and d!159725 (not c!140696)) b!1524591))

(assert (= (and b!1524591 res!1042318) b!1524596))

(assert (= (and b!1524596 (not res!1042320)) b!1524595))

(assert (= (and b!1524595 (not res!1042319)) b!1524599))

(declare-fun m!1407575 () Bool)

(assert (=> b!1524599 m!1407575))

(declare-fun m!1407577 () Bool)

(assert (=> d!159725 m!1407577))

(assert (=> d!159725 m!1407511))

(declare-fun m!1407579 () Bool)

(assert (=> b!1524594 m!1407579))

(assert (=> b!1524594 m!1407579))

(assert (=> b!1524594 m!1407503))

(declare-fun m!1407581 () Bool)

(assert (=> b!1524594 m!1407581))

(assert (=> b!1524596 m!1407575))

(assert (=> b!1524595 m!1407575))

(assert (=> b!1524494 d!159725))

(declare-fun b!1524637 () Bool)

(declare-fun e!850251 () Bool)

(declare-fun call!68518 () Bool)

(assert (=> b!1524637 (= e!850251 call!68518)))

(declare-fun d!159729 () Bool)

(declare-fun res!1042338 () Bool)

(declare-fun e!850250 () Bool)

(assert (=> d!159729 (=> res!1042338 e!850250)))

(assert (=> d!159729 (= res!1042338 (bvsge #b00000000000000000000000000000000 (size!49505 a!2804)))))

(assert (=> d!159729 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35421) e!850250)))

(declare-fun b!1524638 () Bool)

(declare-fun e!850253 () Bool)

(assert (=> b!1524638 (= e!850250 e!850253)))

(declare-fun res!1042340 () Bool)

(assert (=> b!1524638 (=> (not res!1042340) (not e!850253))))

(declare-fun e!850252 () Bool)

(assert (=> b!1524638 (= res!1042340 (not e!850252))))

(declare-fun res!1042339 () Bool)

(assert (=> b!1524638 (=> (not res!1042339) (not e!850252))))

(assert (=> b!1524638 (= res!1042339 (validKeyInArray!0 (select (arr!48954 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68515 () Bool)

(declare-fun c!140708 () Bool)

(assert (=> bm!68515 (= call!68518 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140708 (Cons!35420 (select (arr!48954 a!2804) #b00000000000000000000000000000000) Nil!35421) Nil!35421)))))

(declare-fun b!1524639 () Bool)

(assert (=> b!1524639 (= e!850251 call!68518)))

(declare-fun b!1524640 () Bool)

(declare-fun contains!10033 (List!35424 (_ BitVec 64)) Bool)

(assert (=> b!1524640 (= e!850252 (contains!10033 Nil!35421 (select (arr!48954 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1524641 () Bool)

(assert (=> b!1524641 (= e!850253 e!850251)))

(assert (=> b!1524641 (= c!140708 (validKeyInArray!0 (select (arr!48954 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!159729 (not res!1042338)) b!1524638))

(assert (= (and b!1524638 res!1042339) b!1524640))

(assert (= (and b!1524638 res!1042340) b!1524641))

(assert (= (and b!1524641 c!140708) b!1524639))

(assert (= (and b!1524641 (not c!140708)) b!1524637))

(assert (= (or b!1524639 b!1524637) bm!68515))

(declare-fun m!1407605 () Bool)

(assert (=> b!1524638 m!1407605))

(assert (=> b!1524638 m!1407605))

(declare-fun m!1407607 () Bool)

(assert (=> b!1524638 m!1407607))

(assert (=> bm!68515 m!1407605))

(declare-fun m!1407609 () Bool)

(assert (=> bm!68515 m!1407609))

(assert (=> b!1524640 m!1407605))

(assert (=> b!1524640 m!1407605))

(declare-fun m!1407611 () Bool)

(assert (=> b!1524640 m!1407611))

(assert (=> b!1524641 m!1407605))

(assert (=> b!1524641 m!1407605))

(assert (=> b!1524641 m!1407607))

(assert (=> b!1524496 d!159729))

(declare-fun d!159737 () Bool)

(assert (=> d!159737 (= (validKeyInArray!0 (select (arr!48954 a!2804) i!961)) (and (not (= (select (arr!48954 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48954 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1524491 d!159737))

(declare-fun bm!68518 () Bool)

(declare-fun call!68521 () Bool)

(assert (=> bm!68518 (= call!68521 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1524668 () Bool)

(declare-fun e!850271 () Bool)

(assert (=> b!1524668 (= e!850271 call!68521)))

(declare-fun b!1524669 () Bool)

(declare-fun e!850272 () Bool)

(assert (=> b!1524669 (= e!850272 e!850271)))

(declare-fun c!140717 () Bool)

(assert (=> b!1524669 (= c!140717 (validKeyInArray!0 (select (arr!48954 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1524670 () Bool)

(declare-fun e!850270 () Bool)

(assert (=> b!1524670 (= e!850270 call!68521)))

(declare-fun d!159741 () Bool)

(declare-fun res!1042353 () Bool)

(assert (=> d!159741 (=> res!1042353 e!850272)))

(assert (=> d!159741 (= res!1042353 (bvsge #b00000000000000000000000000000000 (size!49505 a!2804)))))

(assert (=> d!159741 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!850272)))

(declare-fun b!1524671 () Bool)

(assert (=> b!1524671 (= e!850271 e!850270)))

(declare-fun lt!660479 () (_ BitVec 64))

(assert (=> b!1524671 (= lt!660479 (select (arr!48954 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!660478 () Unit!50843)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101456 (_ BitVec 64) (_ BitVec 32)) Unit!50843)

(assert (=> b!1524671 (= lt!660478 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660479 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101456 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1524671 (arrayContainsKey!0 a!2804 lt!660479 #b00000000000000000000000000000000)))

(declare-fun lt!660480 () Unit!50843)

(assert (=> b!1524671 (= lt!660480 lt!660478)))

(declare-fun res!1042352 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101456 (_ BitVec 32)) SeekEntryResult!13012)

(assert (=> b!1524671 (= res!1042352 (= (seekEntryOrOpen!0 (select (arr!48954 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13012 #b00000000000000000000000000000000)))))

(assert (=> b!1524671 (=> (not res!1042352) (not e!850270))))

(assert (= (and d!159741 (not res!1042353)) b!1524669))

(assert (= (and b!1524669 c!140717) b!1524671))

(assert (= (and b!1524669 (not c!140717)) b!1524668))

(assert (= (and b!1524671 res!1042352) b!1524670))

(assert (= (or b!1524670 b!1524668) bm!68518))

(declare-fun m!1407629 () Bool)

(assert (=> bm!68518 m!1407629))

(assert (=> b!1524669 m!1407605))

(assert (=> b!1524669 m!1407605))

(assert (=> b!1524669 m!1407607))

(assert (=> b!1524671 m!1407605))

(declare-fun m!1407631 () Bool)

(assert (=> b!1524671 m!1407631))

(declare-fun m!1407633 () Bool)

(assert (=> b!1524671 m!1407633))

(assert (=> b!1524671 m!1407605))

(declare-fun m!1407635 () Bool)

(assert (=> b!1524671 m!1407635))

(assert (=> b!1524490 d!159741))

(declare-fun d!159755 () Bool)

(assert (=> d!159755 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!130032 d!159755))

(declare-fun d!159761 () Bool)

(assert (=> d!159761 (= (array_inv!38235 a!2804) (bvsge (size!49505 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!130032 d!159761))

(declare-fun b!1524744 () Bool)

(declare-fun c!140744 () Bool)

(declare-fun lt!660508 () (_ BitVec 64))

(assert (=> b!1524744 (= c!140744 (= lt!660508 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!850318 () SeekEntryResult!13012)

(declare-fun e!850316 () SeekEntryResult!13012)

(assert (=> b!1524744 (= e!850318 e!850316)))

(declare-fun b!1524745 () Bool)

(declare-fun lt!660507 () SeekEntryResult!13012)

(assert (=> b!1524745 (= e!850316 (MissingZero!13012 (index!54445 lt!660507)))))

(declare-fun d!159763 () Bool)

(declare-fun lt!660505 () SeekEntryResult!13012)

(assert (=> d!159763 (and (or (is-MissingVacant!13012 lt!660505) (not (is-Found!13012 lt!660505)) (and (bvsge (index!54444 lt!660505) #b00000000000000000000000000000000) (bvslt (index!54444 lt!660505) (size!49505 a!2804)))) (not (is-MissingVacant!13012 lt!660505)) (or (not (is-Found!13012 lt!660505)) (= (select (arr!48954 a!2804) (index!54444 lt!660505)) (select (arr!48954 a!2804) j!70))))))

(declare-fun e!850317 () SeekEntryResult!13012)

(assert (=> d!159763 (= lt!660505 e!850317)))

(declare-fun c!140743 () Bool)

(assert (=> d!159763 (= c!140743 (and (is-Intermediate!13012 lt!660507) (undefined!13824 lt!660507)))))

(assert (=> d!159763 (= lt!660507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48954 a!2804) j!70) mask!2512) (select (arr!48954 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159763 (validMask!0 mask!2512)))

(assert (=> d!159763 (= (seekEntry!0 (select (arr!48954 a!2804) j!70) a!2804 mask!2512) lt!660505)))

(declare-fun b!1524746 () Bool)

(assert (=> b!1524746 (= e!850318 (Found!13012 (index!54445 lt!660507)))))

(declare-fun b!1524747 () Bool)

(declare-fun lt!660506 () SeekEntryResult!13012)

(assert (=> b!1524747 (= e!850316 (ite (is-MissingVacant!13012 lt!660506) (MissingZero!13012 (index!54446 lt!660506)) lt!660506))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101456 (_ BitVec 32)) SeekEntryResult!13012)

(assert (=> b!1524747 (= lt!660506 (seekKeyOrZeroReturnVacant!0 (x!136333 lt!660507) (index!54445 lt!660507) (index!54445 lt!660507) (select (arr!48954 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524748 () Bool)

(assert (=> b!1524748 (= e!850317 e!850318)))

(assert (=> b!1524748 (= lt!660508 (select (arr!48954 a!2804) (index!54445 lt!660507)))))

(declare-fun c!140742 () Bool)

(assert (=> b!1524748 (= c!140742 (= lt!660508 (select (arr!48954 a!2804) j!70)))))

(declare-fun b!1524749 () Bool)

(assert (=> b!1524749 (= e!850317 Undefined!13012)))

(assert (= (and d!159763 c!140743) b!1524749))

(assert (= (and d!159763 (not c!140743)) b!1524748))

(assert (= (and b!1524748 c!140742) b!1524746))

(assert (= (and b!1524748 (not c!140742)) b!1524744))

(assert (= (and b!1524744 c!140744) b!1524745))

(assert (= (and b!1524744 (not c!140744)) b!1524747))

(declare-fun m!1407663 () Bool)

(assert (=> d!159763 m!1407663))

(assert (=> d!159763 m!1407503))

(assert (=> d!159763 m!1407517))

(assert (=> d!159763 m!1407517))

(assert (=> d!159763 m!1407503))

(assert (=> d!159763 m!1407519))

(assert (=> d!159763 m!1407511))

(assert (=> b!1524747 m!1407503))

(declare-fun m!1407667 () Bool)

(assert (=> b!1524747 m!1407667))

(declare-fun m!1407669 () Bool)

(assert (=> b!1524748 m!1407669))

(assert (=> b!1524492 d!159763))

(declare-fun call!68525 () Bool)

(declare-fun bm!68522 () Bool)

(assert (=> bm!68522 (= call!68525 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1524750 () Bool)

(declare-fun e!850320 () Bool)

(assert (=> b!1524750 (= e!850320 call!68525)))

(declare-fun b!1524751 () Bool)

(declare-fun e!850321 () Bool)

(assert (=> b!1524751 (= e!850321 e!850320)))

(declare-fun c!140745 () Bool)

(assert (=> b!1524751 (= c!140745 (validKeyInArray!0 (select (arr!48954 a!2804) j!70)))))

(declare-fun b!1524752 () Bool)

(declare-fun e!850319 () Bool)

(assert (=> b!1524752 (= e!850319 call!68525)))

(declare-fun d!159773 () Bool)

(declare-fun res!1042380 () Bool)

(assert (=> d!159773 (=> res!1042380 e!850321)))

(assert (=> d!159773 (= res!1042380 (bvsge j!70 (size!49505 a!2804)))))

(assert (=> d!159773 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!850321)))

(declare-fun b!1524753 () Bool)

(assert (=> b!1524753 (= e!850320 e!850319)))

(declare-fun lt!660512 () (_ BitVec 64))

(assert (=> b!1524753 (= lt!660512 (select (arr!48954 a!2804) j!70))))

(declare-fun lt!660511 () Unit!50843)

(assert (=> b!1524753 (= lt!660511 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660512 j!70))))

(assert (=> b!1524753 (arrayContainsKey!0 a!2804 lt!660512 #b00000000000000000000000000000000)))

(declare-fun lt!660513 () Unit!50843)

(assert (=> b!1524753 (= lt!660513 lt!660511)))

(declare-fun res!1042379 () Bool)

(assert (=> b!1524753 (= res!1042379 (= (seekEntryOrOpen!0 (select (arr!48954 a!2804) j!70) a!2804 mask!2512) (Found!13012 j!70)))))

(assert (=> b!1524753 (=> (not res!1042379) (not e!850319))))

(assert (= (and d!159773 (not res!1042380)) b!1524751))

(assert (= (and b!1524751 c!140745) b!1524753))

(assert (= (and b!1524751 (not c!140745)) b!1524750))

(assert (= (and b!1524753 res!1042379) b!1524752))

(assert (= (or b!1524752 b!1524750) bm!68522))

(declare-fun m!1407671 () Bool)

(assert (=> bm!68522 m!1407671))

(assert (=> b!1524751 m!1407503))

(assert (=> b!1524751 m!1407503))

(assert (=> b!1524751 m!1407515))

(assert (=> b!1524753 m!1407503))

(declare-fun m!1407673 () Bool)

(assert (=> b!1524753 m!1407673))

(declare-fun m!1407675 () Bool)

(assert (=> b!1524753 m!1407675))

(assert (=> b!1524753 m!1407503))

(declare-fun m!1407677 () Bool)

(assert (=> b!1524753 m!1407677))

(assert (=> b!1524492 d!159773))

(declare-fun d!159777 () Bool)

(assert (=> d!159777 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!660516 () Unit!50843)

(declare-fun choose!38 (array!101456 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50843)

(assert (=> d!159777 (= lt!660516 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159777 (validMask!0 mask!2512)))

(assert (=> d!159777 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!660516)))

(declare-fun bs!43712 () Bool)

(assert (= bs!43712 d!159777))

(assert (=> bs!43712 m!1407507))

(declare-fun m!1407679 () Bool)

(assert (=> bs!43712 m!1407679))

(assert (=> bs!43712 m!1407511))

(assert (=> b!1524492 d!159777))

(declare-fun d!159779 () Bool)

(assert (=> d!159779 (= (validKeyInArray!0 (select (arr!48954 a!2804) j!70)) (and (not (= (select (arr!48954 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48954 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1524497 d!159779))

(declare-fun b!1524764 () Bool)

(declare-fun e!850331 () Bool)

(declare-fun e!850334 () Bool)

(assert (=> b!1524764 (= e!850331 e!850334)))

(declare-fun res!1042387 () Bool)

(declare-fun lt!660518 () SeekEntryResult!13012)

(assert (=> b!1524764 (= res!1042387 (and (is-Intermediate!13012 lt!660518) (not (undefined!13824 lt!660518)) (bvslt (x!136333 lt!660518) #b01111111111111111111111111111110) (bvsge (x!136333 lt!660518) #b00000000000000000000000000000000) (bvsge (x!136333 lt!660518) #b00000000000000000000000000000000)))))

(assert (=> b!1524764 (=> (not res!1042387) (not e!850334))))

(declare-fun b!1524765 () Bool)

(declare-fun e!850330 () SeekEntryResult!13012)

(assert (=> b!1524765 (= e!850330 (Intermediate!13012 true (toIndex!0 (select (arr!48954 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1524766 () Bool)

(declare-fun e!850333 () SeekEntryResult!13012)

(assert (=> b!1524766 (= e!850330 e!850333)))

(declare-fun c!140748 () Bool)

(declare-fun lt!660517 () (_ BitVec 64))

(assert (=> b!1524766 (= c!140748 (or (= lt!660517 (select (arr!48954 a!2804) j!70)) (= (bvadd lt!660517 lt!660517) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1524767 () Bool)

(assert (=> b!1524767 (= e!850333 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48954 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (arr!48954 a!2804) j!70) a!2804 mask!2512))))

(declare-fun d!159781 () Bool)

(assert (=> d!159781 e!850331))

(declare-fun c!140750 () Bool)

(assert (=> d!159781 (= c!140750 (and (is-Intermediate!13012 lt!660518) (undefined!13824 lt!660518)))))

(assert (=> d!159781 (= lt!660518 e!850330)))

(declare-fun c!140749 () Bool)

(assert (=> d!159781 (= c!140749 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159781 (= lt!660517 (select (arr!48954 a!2804) (toIndex!0 (select (arr!48954 a!2804) j!70) mask!2512)))))

(assert (=> d!159781 (validMask!0 mask!2512)))

(assert (=> d!159781 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48954 a!2804) j!70) mask!2512) (select (arr!48954 a!2804) j!70) a!2804 mask!2512) lt!660518)))

(declare-fun b!1524768 () Bool)

(assert (=> b!1524768 (and (bvsge (index!54445 lt!660518) #b00000000000000000000000000000000) (bvslt (index!54445 lt!660518) (size!49505 a!2804)))))

(declare-fun res!1042388 () Bool)

(assert (=> b!1524768 (= res!1042388 (= (select (arr!48954 a!2804) (index!54445 lt!660518)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!850332 () Bool)

(assert (=> b!1524768 (=> res!1042388 e!850332)))

(declare-fun b!1524769 () Bool)

(assert (=> b!1524769 (and (bvsge (index!54445 lt!660518) #b00000000000000000000000000000000) (bvslt (index!54445 lt!660518) (size!49505 a!2804)))))

(declare-fun res!1042389 () Bool)

(assert (=> b!1524769 (= res!1042389 (= (select (arr!48954 a!2804) (index!54445 lt!660518)) (select (arr!48954 a!2804) j!70)))))

(assert (=> b!1524769 (=> res!1042389 e!850332)))

(assert (=> b!1524769 (= e!850334 e!850332)))

(declare-fun b!1524770 () Bool)

(assert (=> b!1524770 (= e!850333 (Intermediate!13012 false (toIndex!0 (select (arr!48954 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1524771 () Bool)

(assert (=> b!1524771 (= e!850331 (bvsge (x!136333 lt!660518) #b01111111111111111111111111111110))))

(declare-fun b!1524772 () Bool)

(assert (=> b!1524772 (and (bvsge (index!54445 lt!660518) #b00000000000000000000000000000000) (bvslt (index!54445 lt!660518) (size!49505 a!2804)))))

(assert (=> b!1524772 (= e!850332 (= (select (arr!48954 a!2804) (index!54445 lt!660518)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!159781 c!140749) b!1524765))

(assert (= (and d!159781 (not c!140749)) b!1524766))

(assert (= (and b!1524766 c!140748) b!1524770))

(assert (= (and b!1524766 (not c!140748)) b!1524767))

(assert (= (and d!159781 c!140750) b!1524771))

(assert (= (and d!159781 (not c!140750)) b!1524764))

(assert (= (and b!1524764 res!1042387) b!1524769))

(assert (= (and b!1524769 (not res!1042389)) b!1524768))

(assert (= (and b!1524768 (not res!1042388)) b!1524772))

(declare-fun m!1407681 () Bool)

(assert (=> b!1524772 m!1407681))

(assert (=> d!159781 m!1407517))

(declare-fun m!1407683 () Bool)

(assert (=> d!159781 m!1407683))

(assert (=> d!159781 m!1407511))

(assert (=> b!1524767 m!1407517))

(declare-fun m!1407685 () Bool)

(assert (=> b!1524767 m!1407685))

(assert (=> b!1524767 m!1407685))

(assert (=> b!1524767 m!1407503))

(declare-fun m!1407687 () Bool)

(assert (=> b!1524767 m!1407687))

(assert (=> b!1524769 m!1407681))

(assert (=> b!1524768 m!1407681))

(assert (=> b!1524498 d!159781))

(declare-fun d!159783 () Bool)

(declare-fun lt!660520 () (_ BitVec 32))

(declare-fun lt!660519 () (_ BitVec 32))

(assert (=> d!159783 (= lt!660520 (bvmul (bvxor lt!660519 (bvlshr lt!660519 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159783 (= lt!660519 ((_ extract 31 0) (bvand (bvxor (select (arr!48954 a!2804) j!70) (bvlshr (select (arr!48954 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159783 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1042311 (let ((h!36860 ((_ extract 31 0) (bvand (bvxor (select (arr!48954 a!2804) j!70) (bvlshr (select (arr!48954 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136335 (bvmul (bvxor h!36860 (bvlshr h!36860 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136335 (bvlshr x!136335 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1042311 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1042311 #b00000000000000000000000000000000))))))

(assert (=> d!159783 (= (toIndex!0 (select (arr!48954 a!2804) j!70) mask!2512) (bvand (bvxor lt!660520 (bvlshr lt!660520 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1524498 d!159783))

(push 1)

(assert (not b!1524641))

(assert (not b!1524669))

(assert (not d!159763))

(assert (not d!159711))

(assert (not b!1524671))

(assert (not b!1524638))

(assert (not b!1524640))

(assert (not b!1524767))

(assert (not b!1524569))

(assert (not bm!68518))

(assert (not bm!68522))

(assert (not d!159781))

(assert (not d!159725))

(assert (not bm!68515))

(assert (not b!1524747))

(assert (not b!1524751))

(assert (not b!1524594))

(assert (not b!1524753))

(assert (not d!159777))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!159789 () Bool)

(declare-fun lt!660526 () Bool)

(declare-fun content!778 (List!35424) (Set (_ BitVec 64)))

(assert (=> d!159789 (= lt!660526 (set.member (select (arr!48954 a!2804) #b00000000000000000000000000000000) (content!778 Nil!35421)))))

(declare-fun e!850347 () Bool)

(assert (=> d!159789 (= lt!660526 e!850347)))

(declare-fun res!1042400 () Bool)

(assert (=> d!159789 (=> (not res!1042400) (not e!850347))))

(assert (=> d!159789 (= res!1042400 (is-Cons!35420 Nil!35421))))

(assert (=> d!159789 (= (contains!10033 Nil!35421 (select (arr!48954 a!2804) #b00000000000000000000000000000000)) lt!660526)))

(declare-fun b!1524786 () Bool)

(declare-fun e!850346 () Bool)

(assert (=> b!1524786 (= e!850347 e!850346)))

(declare-fun res!1042399 () Bool)

(assert (=> b!1524786 (=> res!1042399 e!850346)))

(assert (=> b!1524786 (= res!1042399 (= (h!36859 Nil!35421) (select (arr!48954 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1524787 () Bool)

(assert (=> b!1524787 (= e!850346 (contains!10033 (t!50110 Nil!35421) (select (arr!48954 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!159789 res!1042400) b!1524786))

(assert (= (and b!1524786 (not res!1042399)) b!1524787))

(declare-fun m!1407705 () Bool)

(assert (=> d!159789 m!1407705))

(assert (=> d!159789 m!1407605))

(declare-fun m!1407707 () Bool)

(assert (=> d!159789 m!1407707))

(assert (=> b!1524787 m!1407605))

(declare-fun m!1407709 () Bool)

(assert (=> b!1524787 m!1407709))

(assert (=> b!1524640 d!159789))

(declare-fun bm!68527 () Bool)

(declare-fun call!68530 () Bool)

(assert (=> bm!68527 (= call!68530 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1524788 () Bool)

(declare-fun e!850349 () Bool)

(assert (=> b!1524788 (= e!850349 call!68530)))

(declare-fun b!1524789 () Bool)

(declare-fun e!850350 () Bool)

(assert (=> b!1524789 (= e!850350 e!850349)))

(declare-fun c!140753 () Bool)

(assert (=> b!1524789 (= c!140753 (validKeyInArray!0 (select (arr!48954 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1524790 () Bool)

(declare-fun e!850348 () Bool)

(assert (=> b!1524790 (= e!850348 call!68530)))

(declare-fun d!159791 () Bool)

(declare-fun res!1042402 () Bool)

(assert (=> d!159791 (=> res!1042402 e!850350)))

(assert (=> d!159791 (= res!1042402 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49505 a!2804)))))

(assert (=> d!159791 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512) e!850350)))

(declare-fun b!1524791 () Bool)

(assert (=> b!1524791 (= e!850349 e!850348)))

(declare-fun lt!660528 () (_ BitVec 64))

(assert (=> b!1524791 (= lt!660528 (select (arr!48954 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!660527 () Unit!50843)

(assert (=> b!1524791 (= lt!660527 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660528 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1524791 (arrayContainsKey!0 a!2804 lt!660528 #b00000000000000000000000000000000)))

(declare-fun lt!660529 () Unit!50843)

(assert (=> b!1524791 (= lt!660529 lt!660527)))

(declare-fun res!1042401 () Bool)

(assert (=> b!1524791 (= res!1042401 (= (seekEntryOrOpen!0 (select (arr!48954 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!2804 mask!2512) (Found!13012 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1524791 (=> (not res!1042401) (not e!850348))))

(assert (= (and d!159791 (not res!1042402)) b!1524789))

(assert (= (and b!1524789 c!140753) b!1524791))

(assert (= (and b!1524789 (not c!140753)) b!1524788))

(assert (= (and b!1524791 res!1042401) b!1524790))

(assert (= (or b!1524790 b!1524788) bm!68527))

(declare-fun m!1407711 () Bool)

(assert (=> bm!68527 m!1407711))

(declare-fun m!1407713 () Bool)

(assert (=> b!1524789 m!1407713))

(assert (=> b!1524789 m!1407713))

(declare-fun m!1407715 () Bool)

(assert (=> b!1524789 m!1407715))

(assert (=> b!1524791 m!1407713))

(declare-fun m!1407717 () Bool)

(assert (=> b!1524791 m!1407717))

(declare-fun m!1407719 () Bool)

(assert (=> b!1524791 m!1407719))

(assert (=> b!1524791 m!1407713))

(declare-fun m!1407721 () Bool)

(assert (=> b!1524791 m!1407721))

(assert (=> bm!68518 d!159791))

(assert (=> d!159777 d!159773))

(declare-fun d!159793 () Bool)

(assert (=> d!159793 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(assert (=> d!159793 true))

(declare-fun _$72!158 () Unit!50843)

(assert (=> d!159793 (= (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) _$72!158)))

(declare-fun bs!43713 () Bool)

(assert (= bs!43713 d!159793))

(assert (=> bs!43713 m!1407507))

(assert (=> d!159777 d!159793))

(assert (=> d!159777 d!159755))

(declare-fun b!1524792 () Bool)

(declare-fun e!850352 () Bool)

(declare-fun call!68531 () Bool)

(assert (=> b!1524792 (= e!850352 call!68531)))

(declare-fun d!159795 () Bool)

(declare-fun res!1042403 () Bool)

(declare-fun e!850351 () Bool)

(assert (=> d!159795 (=> res!1042403 e!850351)))

(assert (=> d!159795 (= res!1042403 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49505 a!2804)))))

(assert (=> d!159795 (= (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140708 (Cons!35420 (select (arr!48954 a!2804) #b00000000000000000000000000000000) Nil!35421) Nil!35421)) e!850351)))

(declare-fun b!1524793 () Bool)

(declare-fun e!850354 () Bool)

(assert (=> b!1524793 (= e!850351 e!850354)))

(declare-fun res!1042405 () Bool)

(assert (=> b!1524793 (=> (not res!1042405) (not e!850354))))

(declare-fun e!850353 () Bool)

(assert (=> b!1524793 (= res!1042405 (not e!850353))))

(declare-fun res!1042404 () Bool)

(assert (=> b!1524793 (=> (not res!1042404) (not e!850353))))

(assert (=> b!1524793 (= res!1042404 (validKeyInArray!0 (select (arr!48954 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun c!140754 () Bool)

(declare-fun bm!68528 () Bool)

(assert (=> bm!68528 (= call!68531 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!140754 (Cons!35420 (select (arr!48954 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!140708 (Cons!35420 (select (arr!48954 a!2804) #b00000000000000000000000000000000) Nil!35421) Nil!35421)) (ite c!140708 (Cons!35420 (select (arr!48954 a!2804) #b00000000000000000000000000000000) Nil!35421) Nil!35421))))))

(declare-fun b!1524794 () Bool)

(assert (=> b!1524794 (= e!850352 call!68531)))

(declare-fun b!1524795 () Bool)

(assert (=> b!1524795 (= e!850353 (contains!10033 (ite c!140708 (Cons!35420 (select (arr!48954 a!2804) #b00000000000000000000000000000000) Nil!35421) Nil!35421) (select (arr!48954 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1524796 () Bool)

(assert (=> b!1524796 (= e!850354 e!850352)))

(assert (=> b!1524796 (= c!140754 (validKeyInArray!0 (select (arr!48954 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!159795 (not res!1042403)) b!1524793))

(assert (= (and b!1524793 res!1042404) b!1524795))

(assert (= (and b!1524793 res!1042405) b!1524796))

(assert (= (and b!1524796 c!140754) b!1524794))

(assert (= (and b!1524796 (not c!140754)) b!1524792))

(assert (= (or b!1524794 b!1524792) bm!68528))

(assert (=> b!1524793 m!1407713))

(assert (=> b!1524793 m!1407713))

(assert (=> b!1524793 m!1407715))

(assert (=> bm!68528 m!1407713))

(declare-fun m!1407723 () Bool)

(assert (=> bm!68528 m!1407723))

(assert (=> b!1524795 m!1407713))

(assert (=> b!1524795 m!1407713))

(declare-fun m!1407725 () Bool)

(assert (=> b!1524795 m!1407725))

(assert (=> b!1524796 m!1407713))

(assert (=> b!1524796 m!1407713))

(assert (=> b!1524796 m!1407715))

(assert (=> bm!68515 d!159795))

(assert (=> b!1524751 d!159779))

(assert (=> d!159711 d!159755))

(assert (=> d!159781 d!159755))

(declare-fun b!1524797 () Bool)

(declare-fun e!850356 () Bool)

(declare-fun e!850359 () Bool)

(assert (=> b!1524797 (= e!850356 e!850359)))

(declare-fun res!1042406 () Bool)

(declare-fun lt!660531 () SeekEntryResult!13012)

(assert (=> b!1524797 (= res!1042406 (and (is-Intermediate!13012 lt!660531) (not (undefined!13824 lt!660531)) (bvslt (x!136333 lt!660531) #b01111111111111111111111111111110) (bvsge (x!136333 lt!660531) #b00000000000000000000000000000000) (bvsge (x!136333 lt!660531) (bvadd x!534 #b00000000000000000000000000000001))))))

(assert (=> b!1524797 (=> (not res!1042406) (not e!850359))))

(declare-fun e!850355 () SeekEntryResult!13012)

(declare-fun b!1524798 () Bool)

(assert (=> b!1524798 (= e!850355 (Intermediate!13012 true (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (bvadd x!534 #b00000000000000000000000000000001)))))

(declare-fun b!1524799 () Bool)

(declare-fun e!850358 () SeekEntryResult!13012)

(assert (=> b!1524799 (= e!850355 e!850358)))

(declare-fun lt!660530 () (_ BitVec 64))

(declare-fun c!140755 () Bool)

(assert (=> b!1524799 (= c!140755 (or (= lt!660530 (select (arr!48954 a!2804) j!70)) (= (bvadd lt!660530 lt!660530) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1524800 () Bool)

(assert (=> b!1524800 (= e!850358 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (bvadd x!534 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!2512) (select (arr!48954 a!2804) j!70) a!2804 mask!2512))))

(declare-fun d!159797 () Bool)

(assert (=> d!159797 e!850356))

(declare-fun c!140757 () Bool)

(assert (=> d!159797 (= c!140757 (and (is-Intermediate!13012 lt!660531) (undefined!13824 lt!660531)))))

(assert (=> d!159797 (= lt!660531 e!850355)))

(declare-fun c!140756 () Bool)

(assert (=> d!159797 (= c!140756 (bvsge (bvadd x!534 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!159797 (= lt!660530 (select (arr!48954 a!2804) (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512)))))

(assert (=> d!159797 (validMask!0 mask!2512)))

(assert (=> d!159797 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (select (arr!48954 a!2804) j!70) a!2804 mask!2512) lt!660531)))

(declare-fun b!1524801 () Bool)

(assert (=> b!1524801 (and (bvsge (index!54445 lt!660531) #b00000000000000000000000000000000) (bvslt (index!54445 lt!660531) (size!49505 a!2804)))))

(declare-fun res!1042407 () Bool)

(assert (=> b!1524801 (= res!1042407 (= (select (arr!48954 a!2804) (index!54445 lt!660531)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!850357 () Bool)

(assert (=> b!1524801 (=> res!1042407 e!850357)))

(declare-fun b!1524802 () Bool)

(assert (=> b!1524802 (and (bvsge (index!54445 lt!660531) #b00000000000000000000000000000000) (bvslt (index!54445 lt!660531) (size!49505 a!2804)))))

(declare-fun res!1042408 () Bool)

(assert (=> b!1524802 (= res!1042408 (= (select (arr!48954 a!2804) (index!54445 lt!660531)) (select (arr!48954 a!2804) j!70)))))

(assert (=> b!1524802 (=> res!1042408 e!850357)))

(assert (=> b!1524802 (= e!850359 e!850357)))

(declare-fun b!1524803 () Bool)

(assert (=> b!1524803 (= e!850358 (Intermediate!13012 false (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (bvadd x!534 #b00000000000000000000000000000001)))))

(declare-fun b!1524804 () Bool)

(assert (=> b!1524804 (= e!850356 (bvsge (x!136333 lt!660531) #b01111111111111111111111111111110))))

(declare-fun b!1524805 () Bool)

(assert (=> b!1524805 (and (bvsge (index!54445 lt!660531) #b00000000000000000000000000000000) (bvslt (index!54445 lt!660531) (size!49505 a!2804)))))

(assert (=> b!1524805 (= e!850357 (= (select (arr!48954 a!2804) (index!54445 lt!660531)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!159797 c!140756) b!1524798))

(assert (= (and d!159797 (not c!140756)) b!1524799))

(assert (= (and b!1524799 c!140755) b!1524803))

(assert (= (and b!1524799 (not c!140755)) b!1524800))

(assert (= (and d!159797 c!140757) b!1524804))

(assert (= (and d!159797 (not c!140757)) b!1524797))

(assert (= (and b!1524797 res!1042406) b!1524802))

(assert (= (and b!1524802 (not res!1042408)) b!1524801))

(assert (= (and b!1524801 (not res!1042407)) b!1524805))

(declare-fun m!1407727 () Bool)

(assert (=> b!1524805 m!1407727))

(assert (=> d!159797 m!1407579))

(declare-fun m!1407729 () Bool)

(assert (=> d!159797 m!1407729))

(assert (=> d!159797 m!1407511))

(assert (=> b!1524800 m!1407579))

(declare-fun m!1407731 () Bool)

(assert (=> b!1524800 m!1407731))

(assert (=> b!1524800 m!1407731))

(assert (=> b!1524800 m!1407503))

(declare-fun m!1407733 () Bool)

(assert (=> b!1524800 m!1407733))

(assert (=> b!1524802 m!1407727))

(assert (=> b!1524801 m!1407727))

(assert (=> b!1524594 d!159797))

(declare-fun d!159799 () Bool)

(declare-fun lt!660534 () (_ BitVec 32))

(assert (=> d!159799 (and (bvsge lt!660534 #b00000000000000000000000000000000) (bvslt lt!660534 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!159799 (= lt!660534 (choose!52 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512))))

(assert (=> d!159799 (validMask!0 mask!2512)))

(assert (=> d!159799 (= (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) lt!660534)))

(declare-fun bs!43714 () Bool)

(assert (= bs!43714 d!159799))

(declare-fun m!1407735 () Bool)

(assert (=> bs!43714 m!1407735))

(assert (=> bs!43714 m!1407511))

(assert (=> b!1524594 d!159799))

(declare-fun d!159801 () Bool)

(assert (=> d!159801 (arrayContainsKey!0 a!2804 lt!660512 #b00000000000000000000000000000000)))

(declare-fun lt!660537 () Unit!50843)

(declare-fun choose!13 (array!101456 (_ BitVec 64) (_ BitVec 32)) Unit!50843)

(assert (=> d!159801 (= lt!660537 (choose!13 a!2804 lt!660512 j!70))))

(assert (=> d!159801 (bvsge j!70 #b00000000000000000000000000000000)))

(assert (=> d!159801 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660512 j!70) lt!660537)))

(declare-fun bs!43715 () Bool)

(assert (= bs!43715 d!159801))

(assert (=> bs!43715 m!1407675))

(declare-fun m!1407737 () Bool)

(assert (=> bs!43715 m!1407737))

(assert (=> b!1524753 d!159801))

(declare-fun d!159803 () Bool)

(declare-fun res!1042413 () Bool)

(declare-fun e!850364 () Bool)

(assert (=> d!159803 (=> res!1042413 e!850364)))

(assert (=> d!159803 (= res!1042413 (= (select (arr!48954 a!2804) #b00000000000000000000000000000000) lt!660512))))

(assert (=> d!159803 (= (arrayContainsKey!0 a!2804 lt!660512 #b00000000000000000000000000000000) e!850364)))

(declare-fun b!1524810 () Bool)

(declare-fun e!850365 () Bool)

(assert (=> b!1524810 (= e!850364 e!850365)))

(declare-fun res!1042414 () Bool)

(assert (=> b!1524810 (=> (not res!1042414) (not e!850365))))

(assert (=> b!1524810 (= res!1042414 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49505 a!2804)))))

(declare-fun b!1524811 () Bool)

(assert (=> b!1524811 (= e!850365 (arrayContainsKey!0 a!2804 lt!660512 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!159803 (not res!1042413)) b!1524810))

(assert (= (and b!1524810 res!1042414) b!1524811))

(assert (=> d!159803 m!1407605))

(declare-fun m!1407739 () Bool)

(assert (=> b!1524811 m!1407739))

(assert (=> b!1524753 d!159803))

(declare-fun b!1524824 () Bool)

(declare-fun e!850372 () SeekEntryResult!13012)

(assert (=> b!1524824 (= e!850372 Undefined!13012)))

(declare-fun d!159805 () Bool)

(declare-fun lt!660546 () SeekEntryResult!13012)

(assert (=> d!159805 (and (or (is-Undefined!13012 lt!660546) (not (is-Found!13012 lt!660546)) (and (bvsge (index!54444 lt!660546) #b00000000000000000000000000000000) (bvslt (index!54444 lt!660546) (size!49505 a!2804)))) (or (is-Undefined!13012 lt!660546) (is-Found!13012 lt!660546) (not (is-MissingZero!13012 lt!660546)) (and (bvsge (index!54443 lt!660546) #b00000000000000000000000000000000) (bvslt (index!54443 lt!660546) (size!49505 a!2804)))) (or (is-Undefined!13012 lt!660546) (is-Found!13012 lt!660546) (is-MissingZero!13012 lt!660546) (not (is-MissingVacant!13012 lt!660546)) (and (bvsge (index!54446 lt!660546) #b00000000000000000000000000000000) (bvslt (index!54446 lt!660546) (size!49505 a!2804)))) (or (is-Undefined!13012 lt!660546) (ite (is-Found!13012 lt!660546) (= (select (arr!48954 a!2804) (index!54444 lt!660546)) (select (arr!48954 a!2804) j!70)) (ite (is-MissingZero!13012 lt!660546) (= (select (arr!48954 a!2804) (index!54443 lt!660546)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!13012 lt!660546) (= (select (arr!48954 a!2804) (index!54446 lt!660546)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!159805 (= lt!660546 e!850372)))

(declare-fun c!140765 () Bool)

(declare-fun lt!660544 () SeekEntryResult!13012)

(assert (=> d!159805 (= c!140765 (and (is-Intermediate!13012 lt!660544) (undefined!13824 lt!660544)))))

(assert (=> d!159805 (= lt!660544 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48954 a!2804) j!70) mask!2512) (select (arr!48954 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159805 (validMask!0 mask!2512)))

(assert (=> d!159805 (= (seekEntryOrOpen!0 (select (arr!48954 a!2804) j!70) a!2804 mask!2512) lt!660546)))

(declare-fun b!1524825 () Bool)

(declare-fun c!140764 () Bool)

(declare-fun lt!660545 () (_ BitVec 64))

(assert (=> b!1524825 (= c!140764 (= lt!660545 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!850373 () SeekEntryResult!13012)

(declare-fun e!850374 () SeekEntryResult!13012)

(assert (=> b!1524825 (= e!850373 e!850374)))

(declare-fun b!1524826 () Bool)

(assert (=> b!1524826 (= e!850374 (seekKeyOrZeroReturnVacant!0 (x!136333 lt!660544) (index!54445 lt!660544) (index!54445 lt!660544) (select (arr!48954 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524827 () Bool)

(assert (=> b!1524827 (= e!850374 (MissingZero!13012 (index!54445 lt!660544)))))

(declare-fun b!1524828 () Bool)

(assert (=> b!1524828 (= e!850373 (Found!13012 (index!54445 lt!660544)))))

(declare-fun b!1524829 () Bool)

(assert (=> b!1524829 (= e!850372 e!850373)))

(assert (=> b!1524829 (= lt!660545 (select (arr!48954 a!2804) (index!54445 lt!660544)))))

(declare-fun c!140766 () Bool)

(assert (=> b!1524829 (= c!140766 (= lt!660545 (select (arr!48954 a!2804) j!70)))))

(assert (= (and d!159805 c!140765) b!1524824))

(assert (= (and d!159805 (not c!140765)) b!1524829))

(assert (= (and b!1524829 c!140766) b!1524828))

(assert (= (and b!1524829 (not c!140766)) b!1524825))

(assert (= (and b!1524825 c!140764) b!1524827))

(assert (= (and b!1524825 (not c!140764)) b!1524826))

(assert (=> d!159805 m!1407517))

(assert (=> d!159805 m!1407503))

(assert (=> d!159805 m!1407519))

(declare-fun m!1407741 () Bool)

(assert (=> d!159805 m!1407741))

(declare-fun m!1407743 () Bool)

(assert (=> d!159805 m!1407743))

(assert (=> d!159805 m!1407503))

(assert (=> d!159805 m!1407517))

(assert (=> d!159805 m!1407511))

(declare-fun m!1407745 () Bool)

(assert (=> d!159805 m!1407745))

(assert (=> b!1524826 m!1407503))

(declare-fun m!1407747 () Bool)

(assert (=> b!1524826 m!1407747))

(declare-fun m!1407749 () Bool)

(assert (=> b!1524829 m!1407749))

(assert (=> b!1524753 d!159805))

(declare-fun b!1524830 () Bool)

(declare-fun e!850376 () Bool)

(declare-fun e!850379 () Bool)

(assert (=> b!1524830 (= e!850376 e!850379)))

(declare-fun res!1042415 () Bool)

(declare-fun lt!660548 () SeekEntryResult!13012)

(assert (=> b!1524830 (= res!1042415 (and (is-Intermediate!13012 lt!660548) (not (undefined!13824 lt!660548)) (bvslt (x!136333 lt!660548) #b01111111111111111111111111111110) (bvsge (x!136333 lt!660548) #b00000000000000000000000000000000) (bvsge (x!136333 lt!660548) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1524830 (=> (not res!1042415) (not e!850379))))

(declare-fun b!1524831 () Bool)

(declare-fun e!850375 () SeekEntryResult!13012)

(assert (=> b!1524831 (= e!850375 (Intermediate!13012 true (nextIndex!0 (toIndex!0 (select (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1524832 () Bool)

(declare-fun e!850378 () SeekEntryResult!13012)

(assert (=> b!1524832 (= e!850375 e!850378)))

(declare-fun lt!660547 () (_ BitVec 64))

(declare-fun c!140767 () Bool)

(assert (=> b!1524832 (= c!140767 (or (= lt!660547 (select (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!660547 lt!660547) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1524833 () Bool)

(assert (=> b!1524833 (= e!850378 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!2512) (select (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101457 (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49505 a!2804)) mask!2512))))

(declare-fun d!159807 () Bool)

(assert (=> d!159807 e!850376))

(declare-fun c!140769 () Bool)

(assert (=> d!159807 (= c!140769 (and (is-Intermediate!13012 lt!660548) (undefined!13824 lt!660548)))))

(assert (=> d!159807 (= lt!660548 e!850375)))

(declare-fun c!140768 () Bool)

(assert (=> d!159807 (= c!140768 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!159807 (= lt!660547 (select (arr!48954 (array!101457 (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49505 a!2804))) (nextIndex!0 (toIndex!0 (select (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512)))))

(assert (=> d!159807 (validMask!0 mask!2512)))

(assert (=> d!159807 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101457 (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49505 a!2804)) mask!2512) lt!660548)))

(declare-fun b!1524834 () Bool)

(assert (=> b!1524834 (and (bvsge (index!54445 lt!660548) #b00000000000000000000000000000000) (bvslt (index!54445 lt!660548) (size!49505 (array!101457 (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49505 a!2804)))))))

(declare-fun res!1042416 () Bool)

(assert (=> b!1524834 (= res!1042416 (= (select (arr!48954 (array!101457 (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49505 a!2804))) (index!54445 lt!660548)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!850377 () Bool)

(assert (=> b!1524834 (=> res!1042416 e!850377)))

(declare-fun b!1524835 () Bool)

(assert (=> b!1524835 (and (bvsge (index!54445 lt!660548) #b00000000000000000000000000000000) (bvslt (index!54445 lt!660548) (size!49505 (array!101457 (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49505 a!2804)))))))

(declare-fun res!1042417 () Bool)

(assert (=> b!1524835 (= res!1042417 (= (select (arr!48954 (array!101457 (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49505 a!2804))) (index!54445 lt!660548)) (select (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1524835 (=> res!1042417 e!850377)))

(assert (=> b!1524835 (= e!850379 e!850377)))

(declare-fun b!1524836 () Bool)

(assert (=> b!1524836 (= e!850378 (Intermediate!13012 false (nextIndex!0 (toIndex!0 (select (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1524837 () Bool)

(assert (=> b!1524837 (= e!850376 (bvsge (x!136333 lt!660548) #b01111111111111111111111111111110))))

(declare-fun b!1524838 () Bool)

(assert (=> b!1524838 (and (bvsge (index!54445 lt!660548) #b00000000000000000000000000000000) (bvslt (index!54445 lt!660548) (size!49505 (array!101457 (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49505 a!2804)))))))

(assert (=> b!1524838 (= e!850377 (= (select (arr!48954 (array!101457 (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49505 a!2804))) (index!54445 lt!660548)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!159807 c!140768) b!1524831))

(assert (= (and d!159807 (not c!140768)) b!1524832))

(assert (= (and b!1524832 c!140767) b!1524836))

(assert (= (and b!1524832 (not c!140767)) b!1524833))

(assert (= (and d!159807 c!140769) b!1524837))

(assert (= (and d!159807 (not c!140769)) b!1524830))

(assert (= (and b!1524830 res!1042415) b!1524835))

(assert (= (and b!1524835 (not res!1042417)) b!1524834))

(assert (= (and b!1524834 (not res!1042416)) b!1524838))

(declare-fun m!1407751 () Bool)

(assert (=> b!1524838 m!1407751))

(assert (=> d!159807 m!1407563))

(declare-fun m!1407753 () Bool)

(assert (=> d!159807 m!1407753))

(assert (=> d!159807 m!1407511))

(assert (=> b!1524833 m!1407563))

(declare-fun m!1407755 () Bool)

(assert (=> b!1524833 m!1407755))

(assert (=> b!1524833 m!1407755))

(assert (=> b!1524833 m!1407523))

(declare-fun m!1407757 () Bool)

(assert (=> b!1524833 m!1407757))

(assert (=> b!1524835 m!1407751))

(assert (=> b!1524834 m!1407751))

(assert (=> b!1524569 d!159807))

(declare-fun d!159809 () Bool)

(declare-fun lt!660549 () (_ BitVec 32))

(assert (=> d!159809 (and (bvsge lt!660549 #b00000000000000000000000000000000) (bvslt lt!660549 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(assert (=> d!159809 (= lt!660549 (choose!52 (toIndex!0 (select (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512))))

(assert (=> d!159809 (validMask!0 mask!2512)))

(assert (=> d!159809 (= (nextIndex!0 (toIndex!0 (select (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) lt!660549)))

(declare-fun bs!43716 () Bool)

(assert (= bs!43716 d!159809))

(assert (=> bs!43716 m!1407525))

(declare-fun m!1407759 () Bool)

(assert (=> bs!43716 m!1407759))

(assert (=> bs!43716 m!1407511))

(assert (=> b!1524569 d!159809))

(declare-fun call!68532 () Bool)

(declare-fun bm!68529 () Bool)

(assert (=> bm!68529 (= call!68532 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1524839 () Bool)

(declare-fun e!850381 () Bool)

(assert (=> b!1524839 (= e!850381 call!68532)))

(declare-fun b!1524840 () Bool)

(declare-fun e!850382 () Bool)

(assert (=> b!1524840 (= e!850382 e!850381)))

(declare-fun c!140770 () Bool)

(assert (=> b!1524840 (= c!140770 (validKeyInArray!0 (select (arr!48954 a!2804) (bvadd j!70 #b00000000000000000000000000000001))))))

(declare-fun b!1524841 () Bool)

(declare-fun e!850380 () Bool)

(assert (=> b!1524841 (= e!850380 call!68532)))

(declare-fun d!159811 () Bool)

(declare-fun res!1042419 () Bool)

(assert (=> d!159811 (=> res!1042419 e!850382)))

(assert (=> d!159811 (= res!1042419 (bvsge (bvadd j!70 #b00000000000000000000000000000001) (size!49505 a!2804)))))

(assert (=> d!159811 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512) e!850382)))

(declare-fun b!1524842 () Bool)

(assert (=> b!1524842 (= e!850381 e!850380)))

(declare-fun lt!660551 () (_ BitVec 64))

(assert (=> b!1524842 (= lt!660551 (select (arr!48954 a!2804) (bvadd j!70 #b00000000000000000000000000000001)))))

(declare-fun lt!660550 () Unit!50843)

(assert (=> b!1524842 (= lt!660550 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660551 (bvadd j!70 #b00000000000000000000000000000001)))))

(assert (=> b!1524842 (arrayContainsKey!0 a!2804 lt!660551 #b00000000000000000000000000000000)))

(declare-fun lt!660552 () Unit!50843)

(assert (=> b!1524842 (= lt!660552 lt!660550)))

(declare-fun res!1042418 () Bool)

(assert (=> b!1524842 (= res!1042418 (= (seekEntryOrOpen!0 (select (arr!48954 a!2804) (bvadd j!70 #b00000000000000000000000000000001)) a!2804 mask!2512) (Found!13012 (bvadd j!70 #b00000000000000000000000000000001))))))

(assert (=> b!1524842 (=> (not res!1042418) (not e!850380))))

(assert (= (and d!159811 (not res!1042419)) b!1524840))

(assert (= (and b!1524840 c!140770) b!1524842))

(assert (= (and b!1524840 (not c!140770)) b!1524839))

(assert (= (and b!1524842 res!1042418) b!1524841))

(assert (= (or b!1524841 b!1524839) bm!68529))

(declare-fun m!1407761 () Bool)

(assert (=> bm!68529 m!1407761))

(declare-fun m!1407763 () Bool)

(assert (=> b!1524840 m!1407763))

(assert (=> b!1524840 m!1407763))

(declare-fun m!1407765 () Bool)

(assert (=> b!1524840 m!1407765))

(assert (=> b!1524842 m!1407763))

(declare-fun m!1407767 () Bool)

(assert (=> b!1524842 m!1407767))

(declare-fun m!1407769 () Bool)

(assert (=> b!1524842 m!1407769))

(assert (=> b!1524842 m!1407763))

(declare-fun m!1407771 () Bool)

(assert (=> b!1524842 m!1407771))

(assert (=> bm!68522 d!159811))

(declare-fun d!159813 () Bool)

(assert (=> d!159813 (= (validKeyInArray!0 (select (arr!48954 a!2804) #b00000000000000000000000000000000)) (and (not (= (select (arr!48954 a!2804) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48954 a!2804) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1524638 d!159813))

(assert (=> d!159763 d!159781))

(assert (=> d!159763 d!159783))

(assert (=> d!159763 d!159755))

(assert (=> d!159725 d!159755))

(assert (=> b!1524641 d!159813))

(assert (=> b!1524669 d!159813))

(declare-fun d!159815 () Bool)

(assert (=> d!159815 (arrayContainsKey!0 a!2804 lt!660479 #b00000000000000000000000000000000)))

(declare-fun lt!660553 () Unit!50843)

(assert (=> d!159815 (= lt!660553 (choose!13 a!2804 lt!660479 #b00000000000000000000000000000000))))

(assert (=> d!159815 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!159815 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660479 #b00000000000000000000000000000000) lt!660553)))

(declare-fun bs!43717 () Bool)

(assert (= bs!43717 d!159815))

(assert (=> bs!43717 m!1407633))

(declare-fun m!1407773 () Bool)

(assert (=> bs!43717 m!1407773))

(assert (=> b!1524671 d!159815))

(declare-fun d!159817 () Bool)

(declare-fun res!1042420 () Bool)

(declare-fun e!850383 () Bool)

(assert (=> d!159817 (=> res!1042420 e!850383)))

(assert (=> d!159817 (= res!1042420 (= (select (arr!48954 a!2804) #b00000000000000000000000000000000) lt!660479))))

(assert (=> d!159817 (= (arrayContainsKey!0 a!2804 lt!660479 #b00000000000000000000000000000000) e!850383)))

(declare-fun b!1524843 () Bool)

(declare-fun e!850384 () Bool)

(assert (=> b!1524843 (= e!850383 e!850384)))

(declare-fun res!1042421 () Bool)

(assert (=> b!1524843 (=> (not res!1042421) (not e!850384))))

(assert (=> b!1524843 (= res!1042421 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49505 a!2804)))))

(declare-fun b!1524844 () Bool)

(assert (=> b!1524844 (= e!850384 (arrayContainsKey!0 a!2804 lt!660479 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!159817 (not res!1042420)) b!1524843))

(assert (= (and b!1524843 res!1042421) b!1524844))

(assert (=> d!159817 m!1407605))

(declare-fun m!1407775 () Bool)

(assert (=> b!1524844 m!1407775))

(assert (=> b!1524671 d!159817))

(declare-fun b!1524845 () Bool)

(declare-fun e!850385 () SeekEntryResult!13012)

(assert (=> b!1524845 (= e!850385 Undefined!13012)))

(declare-fun d!159819 () Bool)

(declare-fun lt!660556 () SeekEntryResult!13012)

(assert (=> d!159819 (and (or (is-Undefined!13012 lt!660556) (not (is-Found!13012 lt!660556)) (and (bvsge (index!54444 lt!660556) #b00000000000000000000000000000000) (bvslt (index!54444 lt!660556) (size!49505 a!2804)))) (or (is-Undefined!13012 lt!660556) (is-Found!13012 lt!660556) (not (is-MissingZero!13012 lt!660556)) (and (bvsge (index!54443 lt!660556) #b00000000000000000000000000000000) (bvslt (index!54443 lt!660556) (size!49505 a!2804)))) (or (is-Undefined!13012 lt!660556) (is-Found!13012 lt!660556) (is-MissingZero!13012 lt!660556) (not (is-MissingVacant!13012 lt!660556)) (and (bvsge (index!54446 lt!660556) #b00000000000000000000000000000000) (bvslt (index!54446 lt!660556) (size!49505 a!2804)))) (or (is-Undefined!13012 lt!660556) (ite (is-Found!13012 lt!660556) (= (select (arr!48954 a!2804) (index!54444 lt!660556)) (select (arr!48954 a!2804) #b00000000000000000000000000000000)) (ite (is-MissingZero!13012 lt!660556) (= (select (arr!48954 a!2804) (index!54443 lt!660556)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!13012 lt!660556) (= (select (arr!48954 a!2804) (index!54446 lt!660556)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!159819 (= lt!660556 e!850385)))

(declare-fun c!140772 () Bool)

(declare-fun lt!660554 () SeekEntryResult!13012)

(assert (=> d!159819 (= c!140772 (and (is-Intermediate!13012 lt!660554) (undefined!13824 lt!660554)))))

(assert (=> d!159819 (= lt!660554 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48954 a!2804) #b00000000000000000000000000000000) mask!2512) (select (arr!48954 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512))))

(assert (=> d!159819 (validMask!0 mask!2512)))

(assert (=> d!159819 (= (seekEntryOrOpen!0 (select (arr!48954 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) lt!660556)))

(declare-fun b!1524846 () Bool)

(declare-fun c!140771 () Bool)

(declare-fun lt!660555 () (_ BitVec 64))

(assert (=> b!1524846 (= c!140771 (= lt!660555 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!850386 () SeekEntryResult!13012)

(declare-fun e!850387 () SeekEntryResult!13012)

(assert (=> b!1524846 (= e!850386 e!850387)))

(declare-fun b!1524847 () Bool)

(assert (=> b!1524847 (= e!850387 (seekKeyOrZeroReturnVacant!0 (x!136333 lt!660554) (index!54445 lt!660554) (index!54445 lt!660554) (select (arr!48954 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512))))

(declare-fun b!1524848 () Bool)

(assert (=> b!1524848 (= e!850387 (MissingZero!13012 (index!54445 lt!660554)))))

(declare-fun b!1524849 () Bool)

(assert (=> b!1524849 (= e!850386 (Found!13012 (index!54445 lt!660554)))))

(declare-fun b!1524850 () Bool)

(assert (=> b!1524850 (= e!850385 e!850386)))

(assert (=> b!1524850 (= lt!660555 (select (arr!48954 a!2804) (index!54445 lt!660554)))))

(declare-fun c!140773 () Bool)

(assert (=> b!1524850 (= c!140773 (= lt!660555 (select (arr!48954 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!159819 c!140772) b!1524845))

(assert (= (and d!159819 (not c!140772)) b!1524850))

(assert (= (and b!1524850 c!140773) b!1524849))

(assert (= (and b!1524850 (not c!140773)) b!1524846))

(assert (= (and b!1524846 c!140771) b!1524848))

(assert (= (and b!1524846 (not c!140771)) b!1524847))

(declare-fun m!1407777 () Bool)

(assert (=> d!159819 m!1407777))

(assert (=> d!159819 m!1407605))

(declare-fun m!1407779 () Bool)

(assert (=> d!159819 m!1407779))

(declare-fun m!1407781 () Bool)

(assert (=> d!159819 m!1407781))

(declare-fun m!1407783 () Bool)

(assert (=> d!159819 m!1407783))

(assert (=> d!159819 m!1407605))

(assert (=> d!159819 m!1407777))

(assert (=> d!159819 m!1407511))

(declare-fun m!1407785 () Bool)

(assert (=> d!159819 m!1407785))

(assert (=> b!1524847 m!1407605))

(declare-fun m!1407787 () Bool)

(assert (=> b!1524847 m!1407787))

(declare-fun m!1407789 () Bool)

(assert (=> b!1524850 m!1407789))

(assert (=> b!1524671 d!159819))

(declare-fun b!1524863 () Bool)

(declare-fun e!850394 () SeekEntryResult!13012)

(assert (=> b!1524863 (= e!850394 Undefined!13012)))

(declare-fun e!850395 () SeekEntryResult!13012)

(declare-fun b!1524864 () Bool)

(assert (=> b!1524864 (= e!850395 (seekKeyOrZeroReturnVacant!0 (bvadd (x!136333 lt!660507) #b00000000000000000000000000000001) (nextIndex!0 (index!54445 lt!660507) (bvadd (x!136333 lt!660507) #b00000000000000000000000000000001) mask!2512) (index!54445 lt!660507) (select (arr!48954 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524865 () Bool)

(declare-fun c!140781 () Bool)

(declare-fun lt!660562 () (_ BitVec 64))

(assert (=> b!1524865 (= c!140781 (= lt!660562 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!850396 () SeekEntryResult!13012)

(assert (=> b!1524865 (= e!850396 e!850395)))

(declare-fun b!1524866 () Bool)

(assert (=> b!1524866 (= e!850396 (Found!13012 (index!54445 lt!660507)))))

(declare-fun lt!660561 () SeekEntryResult!13012)

(declare-fun d!159821 () Bool)

(assert (=> d!159821 (and (or (is-Undefined!13012 lt!660561) (not (is-Found!13012 lt!660561)) (and (bvsge (index!54444 lt!660561) #b00000000000000000000000000000000) (bvslt (index!54444 lt!660561) (size!49505 a!2804)))) (or (is-Undefined!13012 lt!660561) (is-Found!13012 lt!660561) (not (is-MissingVacant!13012 lt!660561)) (not (= (index!54446 lt!660561) (index!54445 lt!660507))) (and (bvsge (index!54446 lt!660561) #b00000000000000000000000000000000) (bvslt (index!54446 lt!660561) (size!49505 a!2804)))) (or (is-Undefined!13012 lt!660561) (ite (is-Found!13012 lt!660561) (= (select (arr!48954 a!2804) (index!54444 lt!660561)) (select (arr!48954 a!2804) j!70)) (and (is-MissingVacant!13012 lt!660561) (= (index!54446 lt!660561) (index!54445 lt!660507)) (= (select (arr!48954 a!2804) (index!54446 lt!660561)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!159821 (= lt!660561 e!850394)))

(declare-fun c!140782 () Bool)

(assert (=> d!159821 (= c!140782 (bvsge (x!136333 lt!660507) #b01111111111111111111111111111110))))

(assert (=> d!159821 (= lt!660562 (select (arr!48954 a!2804) (index!54445 lt!660507)))))

(assert (=> d!159821 (validMask!0 mask!2512)))

(assert (=> d!159821 (= (seekKeyOrZeroReturnVacant!0 (x!136333 lt!660507) (index!54445 lt!660507) (index!54445 lt!660507) (select (arr!48954 a!2804) j!70) a!2804 mask!2512) lt!660561)))

(declare-fun b!1524867 () Bool)

(assert (=> b!1524867 (= e!850395 (MissingVacant!13012 (index!54445 lt!660507)))))

(declare-fun b!1524868 () Bool)

(assert (=> b!1524868 (= e!850394 e!850396)))

(declare-fun c!140780 () Bool)

(assert (=> b!1524868 (= c!140780 (= lt!660562 (select (arr!48954 a!2804) j!70)))))

(assert (= (and d!159821 c!140782) b!1524863))

(assert (= (and d!159821 (not c!140782)) b!1524868))

(assert (= (and b!1524868 c!140780) b!1524866))

(assert (= (and b!1524868 (not c!140780)) b!1524865))

(assert (= (and b!1524865 c!140781) b!1524867))

(assert (= (and b!1524865 (not c!140781)) b!1524864))

(declare-fun m!1407791 () Bool)

(assert (=> b!1524864 m!1407791))

(assert (=> b!1524864 m!1407791))

(assert (=> b!1524864 m!1407503))

(declare-fun m!1407793 () Bool)

(assert (=> b!1524864 m!1407793))

(declare-fun m!1407795 () Bool)

(assert (=> d!159821 m!1407795))

(declare-fun m!1407797 () Bool)

(assert (=> d!159821 m!1407797))

(assert (=> d!159821 m!1407669))

(assert (=> d!159821 m!1407511))

(assert (=> b!1524747 d!159821))

(declare-fun b!1524869 () Bool)

(declare-fun e!850398 () Bool)

(declare-fun e!850401 () Bool)

(assert (=> b!1524869 (= e!850398 e!850401)))

(declare-fun res!1042422 () Bool)

(declare-fun lt!660564 () SeekEntryResult!13012)

(assert (=> b!1524869 (= res!1042422 (and (is-Intermediate!13012 lt!660564) (not (undefined!13824 lt!660564)) (bvslt (x!136333 lt!660564) #b01111111111111111111111111111110) (bvsge (x!136333 lt!660564) #b00000000000000000000000000000000) (bvsge (x!136333 lt!660564) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1524869 (=> (not res!1042422) (not e!850401))))

(declare-fun e!850397 () SeekEntryResult!13012)

(declare-fun b!1524870 () Bool)

(assert (=> b!1524870 (= e!850397 (Intermediate!13012 true (nextIndex!0 (toIndex!0 (select (arr!48954 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1524871 () Bool)

(declare-fun e!850400 () SeekEntryResult!13012)

(assert (=> b!1524871 (= e!850397 e!850400)))

(declare-fun lt!660563 () (_ BitVec 64))

(declare-fun c!140783 () Bool)

(assert (=> b!1524871 (= c!140783 (or (= lt!660563 (select (arr!48954 a!2804) j!70)) (= (bvadd lt!660563 lt!660563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1524872 () Bool)

(assert (=> b!1524872 (= e!850400 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!48954 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!2512) (select (arr!48954 a!2804) j!70) a!2804 mask!2512))))

(declare-fun d!159823 () Bool)

(assert (=> d!159823 e!850398))

(declare-fun c!140785 () Bool)

(assert (=> d!159823 (= c!140785 (and (is-Intermediate!13012 lt!660564) (undefined!13824 lt!660564)))))

(assert (=> d!159823 (= lt!660564 e!850397)))

(declare-fun c!140784 () Bool)

(assert (=> d!159823 (= c!140784 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!159823 (= lt!660563 (select (arr!48954 a!2804) (nextIndex!0 (toIndex!0 (select (arr!48954 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512)))))

(assert (=> d!159823 (validMask!0 mask!2512)))

(assert (=> d!159823 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48954 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (arr!48954 a!2804) j!70) a!2804 mask!2512) lt!660564)))

(declare-fun b!1524873 () Bool)

(assert (=> b!1524873 (and (bvsge (index!54445 lt!660564) #b00000000000000000000000000000000) (bvslt (index!54445 lt!660564) (size!49505 a!2804)))))

(declare-fun res!1042423 () Bool)

(assert (=> b!1524873 (= res!1042423 (= (select (arr!48954 a!2804) (index!54445 lt!660564)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!850399 () Bool)

(assert (=> b!1524873 (=> res!1042423 e!850399)))

(declare-fun b!1524874 () Bool)

(assert (=> b!1524874 (and (bvsge (index!54445 lt!660564) #b00000000000000000000000000000000) (bvslt (index!54445 lt!660564) (size!49505 a!2804)))))

(declare-fun res!1042424 () Bool)

(assert (=> b!1524874 (= res!1042424 (= (select (arr!48954 a!2804) (index!54445 lt!660564)) (select (arr!48954 a!2804) j!70)))))

(assert (=> b!1524874 (=> res!1042424 e!850399)))

(assert (=> b!1524874 (= e!850401 e!850399)))

(declare-fun b!1524875 () Bool)

(assert (=> b!1524875 (= e!850400 (Intermediate!13012 false (nextIndex!0 (toIndex!0 (select (arr!48954 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1524876 () Bool)

(assert (=> b!1524876 (= e!850398 (bvsge (x!136333 lt!660564) #b01111111111111111111111111111110))))

(declare-fun b!1524877 () Bool)

(assert (=> b!1524877 (and (bvsge (index!54445 lt!660564) #b00000000000000000000000000000000) (bvslt (index!54445 lt!660564) (size!49505 a!2804)))))

(assert (=> b!1524877 (= e!850399 (= (select (arr!48954 a!2804) (index!54445 lt!660564)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!159823 c!140784) b!1524870))

(assert (= (and d!159823 (not c!140784)) b!1524871))

(assert (= (and b!1524871 c!140783) b!1524875))

(assert (= (and b!1524871 (not c!140783)) b!1524872))

(assert (= (and d!159823 c!140785) b!1524876))

(assert (= (and d!159823 (not c!140785)) b!1524869))

(assert (= (and b!1524869 res!1042422) b!1524874))

(assert (= (and b!1524874 (not res!1042424)) b!1524873))

(assert (= (and b!1524873 (not res!1042423)) b!1524877))

(declare-fun m!1407799 () Bool)

(assert (=> b!1524877 m!1407799))

(assert (=> d!159823 m!1407685))

(declare-fun m!1407801 () Bool)

(assert (=> d!159823 m!1407801))

(assert (=> d!159823 m!1407511))

(assert (=> b!1524872 m!1407685))

(declare-fun m!1407803 () Bool)

(assert (=> b!1524872 m!1407803))

(assert (=> b!1524872 m!1407803))

(assert (=> b!1524872 m!1407503))

(declare-fun m!1407805 () Bool)

(assert (=> b!1524872 m!1407805))

(assert (=> b!1524874 m!1407799))

(assert (=> b!1524873 m!1407799))

(assert (=> b!1524767 d!159823))

(declare-fun d!159825 () Bool)

(declare-fun lt!660565 () (_ BitVec 32))

(assert (=> d!159825 (and (bvsge lt!660565 #b00000000000000000000000000000000) (bvslt lt!660565 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(assert (=> d!159825 (= lt!660565 (choose!52 (toIndex!0 (select (arr!48954 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512))))

(assert (=> d!159825 (validMask!0 mask!2512)))

(assert (=> d!159825 (= (nextIndex!0 (toIndex!0 (select (arr!48954 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) lt!660565)))

(declare-fun bs!43718 () Bool)

(assert (= bs!43718 d!159825))

(assert (=> bs!43718 m!1407517))

(declare-fun m!1407807 () Bool)

(assert (=> bs!43718 m!1407807))

(assert (=> bs!43718 m!1407511))

(assert (=> b!1524767 d!159825))

(push 1)

(assert (not d!159823))

(assert (not d!159825))

(assert (not d!159819))

(assert (not b!1524796))

(assert (not bm!68529))

(assert (not b!1524847))

(assert (not b!1524864))

(assert (not d!159801))

(assert (not b!1524811))

(assert (not b!1524793))

(assert (not d!159789))

(assert (not b!1524787))

(assert (not b!1524791))

(assert (not d!159807))

(assert (not bm!68528))

(assert (not b!1524842))

(assert (not d!159805))

(assert (not d!159797))

(assert (not b!1524795))

(assert (not d!159799))

(assert (not b!1524800))

(assert (not b!1524844))

(assert (not b!1524833))

(assert (not b!1524872))

(assert (not d!159821))

(assert (not d!159815))

(assert (not b!1524840))

(assert (not b!1524789))

(assert (not b!1524826))

(assert (not bm!68527))

(assert (not d!159793))

(assert (not d!159809))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

