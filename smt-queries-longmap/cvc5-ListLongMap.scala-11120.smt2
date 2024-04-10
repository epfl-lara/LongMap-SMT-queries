; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129884 () Bool)

(assert start!129884)

(declare-fun b!1524438 () Bool)

(declare-fun res!1043100 () Bool)

(declare-fun e!849798 () Bool)

(assert (=> b!1524438 (=> (not res!1043100) (not e!849798))))

(declare-datatypes ((array!101423 0))(
  ( (array!101424 (arr!48941 (Array (_ BitVec 32) (_ BitVec 64))) (size!49491 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101423)

(declare-datatypes ((List!35424 0))(
  ( (Nil!35421) (Cons!35420 (h!36847 (_ BitVec 64)) (t!50118 List!35424)) )
))
(declare-fun arrayNoDuplicates!0 (array!101423 (_ BitVec 32) List!35424) Bool)

(assert (=> b!1524438 (= res!1043100 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35421))))

(declare-fun b!1524439 () Bool)

(declare-fun res!1043098 () Bool)

(assert (=> b!1524439 (=> (not res!1043098) (not e!849798))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1524439 (= res!1043098 (validKeyInArray!0 (select (arr!48941 a!2804) j!70)))))

(declare-fun b!1524440 () Bool)

(declare-fun res!1043097 () Bool)

(assert (=> b!1524440 (=> (not res!1043097) (not e!849798))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1524440 (= res!1043097 (and (= (size!49491 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49491 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49491 a!2804)) (not (= i!961 j!70))))))

(declare-fun e!849802 () Bool)

(declare-fun b!1524441 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13106 0))(
  ( (MissingZero!13106 (index!54819 (_ BitVec 32))) (Found!13106 (index!54820 (_ BitVec 32))) (Intermediate!13106 (undefined!13918 Bool) (index!54821 (_ BitVec 32)) (x!136510 (_ BitVec 32))) (Undefined!13106) (MissingVacant!13106 (index!54822 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101423 (_ BitVec 32)) SeekEntryResult!13106)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101423 (_ BitVec 32)) SeekEntryResult!13106)

(assert (=> b!1524441 (= e!849802 (= (seekEntryOrOpen!0 (select (arr!48941 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48941 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1524442 () Bool)

(declare-fun res!1043090 () Bool)

(declare-fun e!849800 () Bool)

(assert (=> b!1524442 (=> (not res!1043090) (not e!849800))))

(declare-fun lt!660315 () SeekEntryResult!13106)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101423 (_ BitVec 32)) SeekEntryResult!13106)

(assert (=> b!1524442 (= res!1043090 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48941 a!2804) j!70) a!2804 mask!2512) lt!660315))))

(declare-fun b!1524443 () Bool)

(declare-fun res!1043093 () Bool)

(assert (=> b!1524443 (=> (not res!1043093) (not e!849800))))

(declare-fun lt!660314 () SeekEntryResult!13106)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524443 (= res!1043093 (= lt!660314 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48941 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48941 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101424 (store (arr!48941 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49491 a!2804)) mask!2512)))))

(declare-fun b!1524444 () Bool)

(declare-fun res!1043091 () Bool)

(assert (=> b!1524444 (=> (not res!1043091) (not e!849798))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1524444 (= res!1043091 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49491 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49491 a!2804))))))

(declare-fun res!1043096 () Bool)

(assert (=> start!129884 (=> (not res!1043096) (not e!849798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129884 (= res!1043096 (validMask!0 mask!2512))))

(assert (=> start!129884 e!849798))

(assert (=> start!129884 true))

(declare-fun array_inv!37969 (array!101423) Bool)

(assert (=> start!129884 (array_inv!37969 a!2804)))

(declare-fun e!849801 () Bool)

(declare-fun b!1524445 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101423 (_ BitVec 32)) SeekEntryResult!13106)

(assert (=> b!1524445 (= e!849801 (= (seekEntry!0 (select (arr!48941 a!2804) j!70) a!2804 mask!2512) (Found!13106 j!70)))))

(declare-fun b!1524446 () Bool)

(declare-fun res!1043095 () Bool)

(assert (=> b!1524446 (=> (not res!1043095) (not e!849798))))

(assert (=> b!1524446 (= res!1043095 (validKeyInArray!0 (select (arr!48941 a!2804) i!961)))))

(declare-fun b!1524447 () Bool)

(assert (=> b!1524447 (= e!849800 (not e!849802))))

(declare-fun res!1043099 () Bool)

(assert (=> b!1524447 (=> res!1043099 e!849802)))

(assert (=> b!1524447 (= res!1043099 (or (not (= (select (arr!48941 a!2804) j!70) (select (store (arr!48941 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48941 a!2804) index!487) (select (arr!48941 a!2804) j!70)) (not (= (select (arr!48941 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1524447 e!849801))

(declare-fun res!1043092 () Bool)

(assert (=> b!1524447 (=> (not res!1043092) (not e!849801))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101423 (_ BitVec 32)) Bool)

(assert (=> b!1524447 (= res!1043092 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50996 0))(
  ( (Unit!50997) )
))
(declare-fun lt!660316 () Unit!50996)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101423 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50996)

(assert (=> b!1524447 (= lt!660316 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1524448 () Bool)

(declare-fun res!1043094 () Bool)

(assert (=> b!1524448 (=> (not res!1043094) (not e!849798))))

(assert (=> b!1524448 (= res!1043094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1524449 () Bool)

(assert (=> b!1524449 (= e!849798 e!849800)))

(declare-fun res!1043101 () Bool)

(assert (=> b!1524449 (=> (not res!1043101) (not e!849800))))

(assert (=> b!1524449 (= res!1043101 (= lt!660314 lt!660315))))

(assert (=> b!1524449 (= lt!660315 (Intermediate!13106 false resIndex!21 resX!21))))

(assert (=> b!1524449 (= lt!660314 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48941 a!2804) j!70) mask!2512) (select (arr!48941 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129884 res!1043096) b!1524440))

(assert (= (and b!1524440 res!1043097) b!1524446))

(assert (= (and b!1524446 res!1043095) b!1524439))

(assert (= (and b!1524439 res!1043098) b!1524448))

(assert (= (and b!1524448 res!1043094) b!1524438))

(assert (= (and b!1524438 res!1043100) b!1524444))

(assert (= (and b!1524444 res!1043091) b!1524449))

(assert (= (and b!1524449 res!1043101) b!1524442))

(assert (= (and b!1524442 res!1043090) b!1524443))

(assert (= (and b!1524443 res!1043093) b!1524447))

(assert (= (and b!1524447 res!1043092) b!1524445))

(assert (= (and b!1524447 (not res!1043099)) b!1524441))

(declare-fun m!1407483 () Bool)

(assert (=> b!1524438 m!1407483))

(declare-fun m!1407485 () Bool)

(assert (=> b!1524445 m!1407485))

(assert (=> b!1524445 m!1407485))

(declare-fun m!1407487 () Bool)

(assert (=> b!1524445 m!1407487))

(declare-fun m!1407489 () Bool)

(assert (=> b!1524443 m!1407489))

(declare-fun m!1407491 () Bool)

(assert (=> b!1524443 m!1407491))

(assert (=> b!1524443 m!1407491))

(declare-fun m!1407493 () Bool)

(assert (=> b!1524443 m!1407493))

(assert (=> b!1524443 m!1407493))

(assert (=> b!1524443 m!1407491))

(declare-fun m!1407495 () Bool)

(assert (=> b!1524443 m!1407495))

(declare-fun m!1407497 () Bool)

(assert (=> b!1524448 m!1407497))

(assert (=> b!1524439 m!1407485))

(assert (=> b!1524439 m!1407485))

(declare-fun m!1407499 () Bool)

(assert (=> b!1524439 m!1407499))

(declare-fun m!1407501 () Bool)

(assert (=> start!129884 m!1407501))

(declare-fun m!1407503 () Bool)

(assert (=> start!129884 m!1407503))

(assert (=> b!1524442 m!1407485))

(assert (=> b!1524442 m!1407485))

(declare-fun m!1407505 () Bool)

(assert (=> b!1524442 m!1407505))

(declare-fun m!1407507 () Bool)

(assert (=> b!1524446 m!1407507))

(assert (=> b!1524446 m!1407507))

(declare-fun m!1407509 () Bool)

(assert (=> b!1524446 m!1407509))

(assert (=> b!1524447 m!1407485))

(declare-fun m!1407511 () Bool)

(assert (=> b!1524447 m!1407511))

(assert (=> b!1524447 m!1407489))

(declare-fun m!1407513 () Bool)

(assert (=> b!1524447 m!1407513))

(assert (=> b!1524447 m!1407491))

(declare-fun m!1407515 () Bool)

(assert (=> b!1524447 m!1407515))

(assert (=> b!1524449 m!1407485))

(assert (=> b!1524449 m!1407485))

(declare-fun m!1407517 () Bool)

(assert (=> b!1524449 m!1407517))

(assert (=> b!1524449 m!1407517))

(assert (=> b!1524449 m!1407485))

(declare-fun m!1407519 () Bool)

(assert (=> b!1524449 m!1407519))

(assert (=> b!1524441 m!1407485))

(assert (=> b!1524441 m!1407485))

(declare-fun m!1407521 () Bool)

(assert (=> b!1524441 m!1407521))

(assert (=> b!1524441 m!1407485))

(declare-fun m!1407523 () Bool)

(assert (=> b!1524441 m!1407523))

(push 1)

(assert (not b!1524448))

(assert (not b!1524446))

(assert (not b!1524447))

(assert (not b!1524438))

(assert (not b!1524441))

(assert (not b!1524439))

(assert (not b!1524449))

(assert (not b!1524445))

(assert (not b!1524442))

(assert (not b!1524443))

(assert (not start!129884))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!159357 () Bool)

(assert (=> d!159357 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129884 d!159357))

(declare-fun d!159365 () Bool)

(assert (=> d!159365 (= (array_inv!37969 a!2804) (bvsge (size!49491 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129884 d!159365))

(declare-fun b!1524603 () Bool)

(declare-fun e!849884 () SeekEntryResult!13106)

(declare-fun e!849886 () SeekEntryResult!13106)

(assert (=> b!1524603 (= e!849884 e!849886)))

(declare-fun c!140247 () Bool)

(declare-fun lt!660364 () (_ BitVec 64))

(assert (=> b!1524603 (= c!140247 (or (= lt!660364 (select (arr!48941 a!2804) j!70)) (= (bvadd lt!660364 lt!660364) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1524604 () Bool)

(declare-fun e!849888 () Bool)

(declare-fun lt!660365 () SeekEntryResult!13106)

(assert (=> b!1524604 (= e!849888 (bvsge (x!136510 lt!660365) #b01111111111111111111111111111110))))

(declare-fun b!1524605 () Bool)

(assert (=> b!1524605 (and (bvsge (index!54821 lt!660365) #b00000000000000000000000000000000) (bvslt (index!54821 lt!660365) (size!49491 a!2804)))))

(declare-fun res!1043209 () Bool)

(assert (=> b!1524605 (= res!1043209 (= (select (arr!48941 a!2804) (index!54821 lt!660365)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849885 () Bool)

(assert (=> b!1524605 (=> res!1043209 e!849885)))

(declare-fun b!1524606 () Bool)

(declare-fun e!849887 () Bool)

(assert (=> b!1524606 (= e!849888 e!849887)))

(declare-fun res!1043210 () Bool)

(assert (=> b!1524606 (= res!1043210 (and (is-Intermediate!13106 lt!660365) (not (undefined!13918 lt!660365)) (bvslt (x!136510 lt!660365) #b01111111111111111111111111111110) (bvsge (x!136510 lt!660365) #b00000000000000000000000000000000) (bvsge (x!136510 lt!660365) #b00000000000000000000000000000000)))))

(assert (=> b!1524606 (=> (not res!1043210) (not e!849887))))

(declare-fun d!159367 () Bool)

(assert (=> d!159367 e!849888))

(declare-fun c!140248 () Bool)

(assert (=> d!159367 (= c!140248 (and (is-Intermediate!13106 lt!660365) (undefined!13918 lt!660365)))))

(assert (=> d!159367 (= lt!660365 e!849884)))

(declare-fun c!140249 () Bool)

(assert (=> d!159367 (= c!140249 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159367 (= lt!660364 (select (arr!48941 a!2804) (toIndex!0 (select (arr!48941 a!2804) j!70) mask!2512)))))

(assert (=> d!159367 (validMask!0 mask!2512)))

(assert (=> d!159367 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48941 a!2804) j!70) mask!2512) (select (arr!48941 a!2804) j!70) a!2804 mask!2512) lt!660365)))

(declare-fun b!1524607 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524607 (= e!849886 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48941 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48941 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524608 () Bool)

(assert (=> b!1524608 (= e!849884 (Intermediate!13106 true (toIndex!0 (select (arr!48941 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1524609 () Bool)

(assert (=> b!1524609 (= e!849886 (Intermediate!13106 false (toIndex!0 (select (arr!48941 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1524610 () Bool)

(assert (=> b!1524610 (and (bvsge (index!54821 lt!660365) #b00000000000000000000000000000000) (bvslt (index!54821 lt!660365) (size!49491 a!2804)))))

(declare-fun res!1043208 () Bool)

(assert (=> b!1524610 (= res!1043208 (= (select (arr!48941 a!2804) (index!54821 lt!660365)) (select (arr!48941 a!2804) j!70)))))

(assert (=> b!1524610 (=> res!1043208 e!849885)))

(assert (=> b!1524610 (= e!849887 e!849885)))

(declare-fun b!1524611 () Bool)

(assert (=> b!1524611 (and (bvsge (index!54821 lt!660365) #b00000000000000000000000000000000) (bvslt (index!54821 lt!660365) (size!49491 a!2804)))))

(assert (=> b!1524611 (= e!849885 (= (select (arr!48941 a!2804) (index!54821 lt!660365)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!159367 c!140249) b!1524608))

(assert (= (and d!159367 (not c!140249)) b!1524603))

(assert (= (and b!1524603 c!140247) b!1524609))

(assert (= (and b!1524603 (not c!140247)) b!1524607))

(assert (= (and d!159367 c!140248) b!1524604))

(assert (= (and d!159367 (not c!140248)) b!1524606))

(assert (= (and b!1524606 res!1043210) b!1524610))

(assert (= (and b!1524610 (not res!1043208)) b!1524605))

(assert (= (and b!1524605 (not res!1043209)) b!1524611))

(assert (=> d!159367 m!1407517))

(declare-fun m!1407641 () Bool)

(assert (=> d!159367 m!1407641))

(assert (=> d!159367 m!1407501))

(declare-fun m!1407643 () Bool)

(assert (=> b!1524610 m!1407643))

(assert (=> b!1524605 m!1407643))

(assert (=> b!1524611 m!1407643))

(assert (=> b!1524607 m!1407517))

(declare-fun m!1407645 () Bool)

(assert (=> b!1524607 m!1407645))

(assert (=> b!1524607 m!1407645))

(assert (=> b!1524607 m!1407485))

(declare-fun m!1407647 () Bool)

(assert (=> b!1524607 m!1407647))

(assert (=> b!1524449 d!159367))

(declare-fun d!159377 () Bool)

(declare-fun lt!660377 () (_ BitVec 32))

(declare-fun lt!660376 () (_ BitVec 32))

(assert (=> d!159377 (= lt!660377 (bvmul (bvxor lt!660376 (bvlshr lt!660376 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159377 (= lt!660376 ((_ extract 31 0) (bvand (bvxor (select (arr!48941 a!2804) j!70) (bvlshr (select (arr!48941 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159377 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1043211 (let ((h!36851 ((_ extract 31 0) (bvand (bvxor (select (arr!48941 a!2804) j!70) (bvlshr (select (arr!48941 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136516 (bvmul (bvxor h!36851 (bvlshr h!36851 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136516 (bvlshr x!136516 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1043211 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1043211 #b00000000000000000000000000000000))))))

(assert (=> d!159377 (= (toIndex!0 (select (arr!48941 a!2804) j!70) mask!2512) (bvand (bvxor lt!660377 (bvlshr lt!660377 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1524449 d!159377))

(declare-fun d!159379 () Bool)

(assert (=> d!159379 (= (validKeyInArray!0 (select (arr!48941 a!2804) j!70)) (and (not (= (select (arr!48941 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48941 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1524439 d!159379))

(declare-fun b!1524654 () Bool)

(declare-fun c!140271 () Bool)

(declare-fun lt!660400 () (_ BitVec 64))

(assert (=> b!1524654 (= c!140271 (= lt!660400 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849911 () SeekEntryResult!13106)

(declare-fun e!849912 () SeekEntryResult!13106)

(assert (=> b!1524654 (= e!849911 e!849912)))

(declare-fun b!1524655 () Bool)

(declare-fun lt!660398 () SeekEntryResult!13106)

(assert (=> b!1524655 (= e!849912 (MissingZero!13106 (index!54821 lt!660398)))))

(declare-fun d!159381 () Bool)

(declare-fun lt!660397 () SeekEntryResult!13106)

(assert (=> d!159381 (and (or (is-MissingVacant!13106 lt!660397) (not (is-Found!13106 lt!660397)) (and (bvsge (index!54820 lt!660397) #b00000000000000000000000000000000) (bvslt (index!54820 lt!660397) (size!49491 a!2804)))) (not (is-MissingVacant!13106 lt!660397)) (or (not (is-Found!13106 lt!660397)) (= (select (arr!48941 a!2804) (index!54820 lt!660397)) (select (arr!48941 a!2804) j!70))))))

(declare-fun e!849910 () SeekEntryResult!13106)

(assert (=> d!159381 (= lt!660397 e!849910)))

(declare-fun c!140272 () Bool)

(assert (=> d!159381 (= c!140272 (and (is-Intermediate!13106 lt!660398) (undefined!13918 lt!660398)))))

(assert (=> d!159381 (= lt!660398 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48941 a!2804) j!70) mask!2512) (select (arr!48941 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159381 (validMask!0 mask!2512)))

(assert (=> d!159381 (= (seekEntry!0 (select (arr!48941 a!2804) j!70) a!2804 mask!2512) lt!660397)))

(declare-fun b!1524656 () Bool)

(assert (=> b!1524656 (= e!849910 e!849911)))

(assert (=> b!1524656 (= lt!660400 (select (arr!48941 a!2804) (index!54821 lt!660398)))))

(declare-fun c!140273 () Bool)

(assert (=> b!1524656 (= c!140273 (= lt!660400 (select (arr!48941 a!2804) j!70)))))

(declare-fun b!1524657 () Bool)

(assert (=> b!1524657 (= e!849910 Undefined!13106)))

(declare-fun b!1524658 () Bool)

(assert (=> b!1524658 (= e!849911 (Found!13106 (index!54821 lt!660398)))))

(declare-fun b!1524659 () Bool)

(declare-fun lt!660399 () SeekEntryResult!13106)

(assert (=> b!1524659 (= e!849912 (ite (is-MissingVacant!13106 lt!660399) (MissingZero!13106 (index!54822 lt!660399)) lt!660399))))

(assert (=> b!1524659 (= lt!660399 (seekKeyOrZeroReturnVacant!0 (x!136510 lt!660398) (index!54821 lt!660398) (index!54821 lt!660398) (select (arr!48941 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!159381 c!140272) b!1524657))

(assert (= (and d!159381 (not c!140272)) b!1524656))

(assert (= (and b!1524656 c!140273) b!1524658))

(assert (= (and b!1524656 (not c!140273)) b!1524654))

(assert (= (and b!1524654 c!140271) b!1524655))

(assert (= (and b!1524654 (not c!140271)) b!1524659))

(declare-fun m!1407659 () Bool)

(assert (=> d!159381 m!1407659))

(assert (=> d!159381 m!1407485))

(assert (=> d!159381 m!1407517))

(assert (=> d!159381 m!1407517))

(assert (=> d!159381 m!1407485))

(assert (=> d!159381 m!1407519))

(assert (=> d!159381 m!1407501))

(declare-fun m!1407661 () Bool)

(assert (=> b!1524656 m!1407661))

(assert (=> b!1524659 m!1407485))

(declare-fun m!1407663 () Bool)

(assert (=> b!1524659 m!1407663))

(assert (=> b!1524445 d!159381))

(declare-fun d!159385 () Bool)

(assert (=> d!159385 (= (validKeyInArray!0 (select (arr!48941 a!2804) i!961)) (and (not (= (select (arr!48941 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48941 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1524446 d!159385))

(declare-fun d!159387 () Bool)

(declare-fun lt!660418 () SeekEntryResult!13106)

(assert (=> d!159387 (and (or (is-Undefined!13106 lt!660418) (not (is-Found!13106 lt!660418)) (and (bvsge (index!54820 lt!660418) #b00000000000000000000000000000000) (bvslt (index!54820 lt!660418) (size!49491 a!2804)))) (or (is-Undefined!13106 lt!660418) (is-Found!13106 lt!660418) (not (is-MissingZero!13106 lt!660418)) (and (bvsge (index!54819 lt!660418) #b00000000000000000000000000000000) (bvslt (index!54819 lt!660418) (size!49491 a!2804)))) (or (is-Undefined!13106 lt!660418) (is-Found!13106 lt!660418) (is-MissingZero!13106 lt!660418) (not (is-MissingVacant!13106 lt!660418)) (and (bvsge (index!54822 lt!660418) #b00000000000000000000000000000000) (bvslt (index!54822 lt!660418) (size!49491 a!2804)))) (or (is-Undefined!13106 lt!660418) (ite (is-Found!13106 lt!660418) (= (select (arr!48941 a!2804) (index!54820 lt!660418)) (select (arr!48941 a!2804) j!70)) (ite (is-MissingZero!13106 lt!660418) (= (select (arr!48941 a!2804) (index!54819 lt!660418)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!13106 lt!660418) (= (select (arr!48941 a!2804) (index!54822 lt!660418)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!849933 () SeekEntryResult!13106)

(assert (=> d!159387 (= lt!660418 e!849933)))

(declare-fun c!140292 () Bool)

(declare-fun lt!660417 () SeekEntryResult!13106)

(assert (=> d!159387 (= c!140292 (and (is-Intermediate!13106 lt!660417) (undefined!13918 lt!660417)))))

(assert (=> d!159387 (= lt!660417 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48941 a!2804) j!70) mask!2512) (select (arr!48941 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159387 (validMask!0 mask!2512)))

(assert (=> d!159387 (= (seekEntryOrOpen!0 (select (arr!48941 a!2804) j!70) a!2804 mask!2512) lt!660418)))

(declare-fun b!1524696 () Bool)

(declare-fun e!849932 () SeekEntryResult!13106)

(assert (=> b!1524696 (= e!849933 e!849932)))

(declare-fun lt!660419 () (_ BitVec 64))

(assert (=> b!1524696 (= lt!660419 (select (arr!48941 a!2804) (index!54821 lt!660417)))))

(declare-fun c!140294 () Bool)

(assert (=> b!1524696 (= c!140294 (= lt!660419 (select (arr!48941 a!2804) j!70)))))

(declare-fun b!1524697 () Bool)

(assert (=> b!1524697 (= e!849933 Undefined!13106)))

(declare-fun b!1524698 () Bool)

(declare-fun e!849931 () SeekEntryResult!13106)

(assert (=> b!1524698 (= e!849931 (MissingZero!13106 (index!54821 lt!660417)))))

(declare-fun b!1524699 () Bool)

(declare-fun c!140293 () Bool)

(assert (=> b!1524699 (= c!140293 (= lt!660419 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1524699 (= e!849932 e!849931)))

(declare-fun b!1524700 () Bool)

(assert (=> b!1524700 (= e!849932 (Found!13106 (index!54821 lt!660417)))))

(declare-fun b!1524701 () Bool)

(assert (=> b!1524701 (= e!849931 (seekKeyOrZeroReturnVacant!0 (x!136510 lt!660417) (index!54821 lt!660417) (index!54821 lt!660417) (select (arr!48941 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!159387 c!140292) b!1524697))

(assert (= (and d!159387 (not c!140292)) b!1524696))

(assert (= (and b!1524696 c!140294) b!1524700))

(assert (= (and b!1524696 (not c!140294)) b!1524699))

(assert (= (and b!1524699 c!140293) b!1524698))

(assert (= (and b!1524699 (not c!140293)) b!1524701))

(assert (=> d!159387 m!1407485))

(assert (=> d!159387 m!1407517))

(declare-fun m!1407679 () Bool)

(assert (=> d!159387 m!1407679))

(assert (=> d!159387 m!1407501))

(declare-fun m!1407681 () Bool)

(assert (=> d!159387 m!1407681))

(declare-fun m!1407683 () Bool)

(assert (=> d!159387 m!1407683))

(assert (=> d!159387 m!1407517))

(assert (=> d!159387 m!1407485))

(assert (=> d!159387 m!1407519))

(declare-fun m!1407685 () Bool)

(assert (=> b!1524696 m!1407685))

(assert (=> b!1524701 m!1407485))

(declare-fun m!1407687 () Bool)

(assert (=> b!1524701 m!1407687))

(assert (=> b!1524441 d!159387))

(declare-fun b!1524732 () Bool)

(declare-fun e!849950 () SeekEntryResult!13106)

(assert (=> b!1524732 (= e!849950 (Found!13106 index!487))))

(declare-fun d!159393 () Bool)

(declare-fun lt!660434 () SeekEntryResult!13106)

(assert (=> d!159393 (and (or (is-Undefined!13106 lt!660434) (not (is-Found!13106 lt!660434)) (and (bvsge (index!54820 lt!660434) #b00000000000000000000000000000000) (bvslt (index!54820 lt!660434) (size!49491 a!2804)))) (or (is-Undefined!13106 lt!660434) (is-Found!13106 lt!660434) (not (is-MissingVacant!13106 lt!660434)) (not (= (index!54822 lt!660434) index!487)) (and (bvsge (index!54822 lt!660434) #b00000000000000000000000000000000) (bvslt (index!54822 lt!660434) (size!49491 a!2804)))) (or (is-Undefined!13106 lt!660434) (ite (is-Found!13106 lt!660434) (= (select (arr!48941 a!2804) (index!54820 lt!660434)) (select (arr!48941 a!2804) j!70)) (and (is-MissingVacant!13106 lt!660434) (= (index!54822 lt!660434) index!487) (= (select (arr!48941 a!2804) (index!54822 lt!660434)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!849949 () SeekEntryResult!13106)

(assert (=> d!159393 (= lt!660434 e!849949)))

(declare-fun c!140310 () Bool)

(assert (=> d!159393 (= c!140310 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!660433 () (_ BitVec 64))

(assert (=> d!159393 (= lt!660433 (select (arr!48941 a!2804) index!487))))

(assert (=> d!159393 (validMask!0 mask!2512)))

(assert (=> d!159393 (= (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48941 a!2804) j!70) a!2804 mask!2512) lt!660434)))

(declare-fun b!1524733 () Bool)

(declare-fun e!849951 () SeekEntryResult!13106)

(assert (=> b!1524733 (= e!849951 (seekKeyOrZeroReturnVacant!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) index!487 (select (arr!48941 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524734 () Bool)

(declare-fun c!140312 () Bool)

(assert (=> b!1524734 (= c!140312 (= lt!660433 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1524734 (= e!849950 e!849951)))

(declare-fun b!1524735 () Bool)

(assert (=> b!1524735 (= e!849949 Undefined!13106)))

(declare-fun b!1524736 () Bool)

(assert (=> b!1524736 (= e!849951 (MissingVacant!13106 index!487))))

(declare-fun b!1524737 () Bool)

(assert (=> b!1524737 (= e!849949 e!849950)))

(declare-fun c!140311 () Bool)

(assert (=> b!1524737 (= c!140311 (= lt!660433 (select (arr!48941 a!2804) j!70)))))

(assert (= (and d!159393 c!140310) b!1524735))

(assert (= (and d!159393 (not c!140310)) b!1524737))

(assert (= (and b!1524737 c!140311) b!1524732))

(assert (= (and b!1524737 (not c!140311)) b!1524734))

(assert (= (and b!1524734 c!140312) b!1524736))

(assert (= (and b!1524734 (not c!140312)) b!1524733))

(declare-fun m!1407699 () Bool)

(assert (=> d!159393 m!1407699))

(declare-fun m!1407701 () Bool)

(assert (=> d!159393 m!1407701))

(assert (=> d!159393 m!1407513))

(assert (=> d!159393 m!1407501))

(declare-fun m!1407703 () Bool)

(assert (=> b!1524733 m!1407703))

(assert (=> b!1524733 m!1407703))

(assert (=> b!1524733 m!1407485))

(declare-fun m!1407705 () Bool)

(assert (=> b!1524733 m!1407705))

(assert (=> b!1524441 d!159393))

(declare-fun b!1524738 () Bool)

(declare-fun e!849952 () SeekEntryResult!13106)

(declare-fun e!849954 () SeekEntryResult!13106)

(assert (=> b!1524738 (= e!849952 e!849954)))

(declare-fun c!140313 () Bool)

(declare-fun lt!660435 () (_ BitVec 64))

(assert (=> b!1524738 (= c!140313 (or (= lt!660435 (select (arr!48941 a!2804) j!70)) (= (bvadd lt!660435 lt!660435) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1524739 () Bool)

(declare-fun e!849956 () Bool)

(declare-fun lt!660436 () SeekEntryResult!13106)

(assert (=> b!1524739 (= e!849956 (bvsge (x!136510 lt!660436) #b01111111111111111111111111111110))))

(declare-fun b!1524740 () Bool)

(assert (=> b!1524740 (and (bvsge (index!54821 lt!660436) #b00000000000000000000000000000000) (bvslt (index!54821 lt!660436) (size!49491 a!2804)))))

(declare-fun res!1043213 () Bool)

(assert (=> b!1524740 (= res!1043213 (= (select (arr!48941 a!2804) (index!54821 lt!660436)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849953 () Bool)

(assert (=> b!1524740 (=> res!1043213 e!849953)))

(declare-fun b!1524741 () Bool)

(declare-fun e!849955 () Bool)

(assert (=> b!1524741 (= e!849956 e!849955)))

(declare-fun res!1043214 () Bool)

(assert (=> b!1524741 (= res!1043214 (and (is-Intermediate!13106 lt!660436) (not (undefined!13918 lt!660436)) (bvslt (x!136510 lt!660436) #b01111111111111111111111111111110) (bvsge (x!136510 lt!660436) #b00000000000000000000000000000000) (bvsge (x!136510 lt!660436) x!534)))))

(assert (=> b!1524741 (=> (not res!1043214) (not e!849955))))

(declare-fun d!159397 () Bool)

(assert (=> d!159397 e!849956))

(declare-fun c!140314 () Bool)

(assert (=> d!159397 (= c!140314 (and (is-Intermediate!13106 lt!660436) (undefined!13918 lt!660436)))))

(assert (=> d!159397 (= lt!660436 e!849952)))

(declare-fun c!140315 () Bool)

(assert (=> d!159397 (= c!140315 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!159397 (= lt!660435 (select (arr!48941 a!2804) index!487))))

(assert (=> d!159397 (validMask!0 mask!2512)))

(assert (=> d!159397 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48941 a!2804) j!70) a!2804 mask!2512) lt!660436)))

(declare-fun b!1524742 () Bool)

(assert (=> b!1524742 (= e!849954 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48941 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524743 () Bool)

(assert (=> b!1524743 (= e!849952 (Intermediate!13106 true index!487 x!534))))

(declare-fun b!1524744 () Bool)

(assert (=> b!1524744 (= e!849954 (Intermediate!13106 false index!487 x!534))))

(declare-fun b!1524745 () Bool)

(assert (=> b!1524745 (and (bvsge (index!54821 lt!660436) #b00000000000000000000000000000000) (bvslt (index!54821 lt!660436) (size!49491 a!2804)))))

(declare-fun res!1043212 () Bool)

(assert (=> b!1524745 (= res!1043212 (= (select (arr!48941 a!2804) (index!54821 lt!660436)) (select (arr!48941 a!2804) j!70)))))

(assert (=> b!1524745 (=> res!1043212 e!849953)))

(assert (=> b!1524745 (= e!849955 e!849953)))

(declare-fun b!1524746 () Bool)

(assert (=> b!1524746 (and (bvsge (index!54821 lt!660436) #b00000000000000000000000000000000) (bvslt (index!54821 lt!660436) (size!49491 a!2804)))))

(assert (=> b!1524746 (= e!849953 (= (select (arr!48941 a!2804) (index!54821 lt!660436)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!159397 c!140315) b!1524743))

(assert (= (and d!159397 (not c!140315)) b!1524738))

(assert (= (and b!1524738 c!140313) b!1524744))

(assert (= (and b!1524738 (not c!140313)) b!1524742))

(assert (= (and d!159397 c!140314) b!1524739))

(assert (= (and d!159397 (not c!140314)) b!1524741))

(assert (= (and b!1524741 res!1043214) b!1524745))

(assert (= (and b!1524745 (not res!1043212)) b!1524740))

(assert (= (and b!1524740 (not res!1043213)) b!1524746))

(assert (=> d!159397 m!1407513))

(assert (=> d!159397 m!1407501))

(declare-fun m!1407707 () Bool)

(assert (=> b!1524745 m!1407707))

(assert (=> b!1524740 m!1407707))

(assert (=> b!1524746 m!1407707))

(assert (=> b!1524742 m!1407703))

(assert (=> b!1524742 m!1407703))

(assert (=> b!1524742 m!1407485))

(declare-fun m!1407709 () Bool)

(assert (=> b!1524742 m!1407709))

(assert (=> b!1524442 d!159397))

(declare-fun b!1524773 () Bool)

(declare-fun e!849973 () Bool)

(declare-fun call!68436 () Bool)

(assert (=> b!1524773 (= e!849973 call!68436)))

(declare-fun b!1524774 () Bool)

(declare-fun e!849974 () Bool)

(assert (=> b!1524774 (= e!849974 e!849973)))

(declare-fun c!140324 () Bool)

(assert (=> b!1524774 (= c!140324 (validKeyInArray!0 (select (arr!48941 a!2804) j!70)))))

(declare-fun b!1524775 () Bool)

(declare-fun e!849975 () Bool)

(assert (=> b!1524775 (= e!849973 e!849975)))

(declare-fun lt!660448 () (_ BitVec 64))

(assert (=> b!1524775 (= lt!660448 (select (arr!48941 a!2804) j!70))))

(declare-fun lt!660447 () Unit!50996)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101423 (_ BitVec 64) (_ BitVec 32)) Unit!50996)

(assert (=> b!1524775 (= lt!660447 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660448 j!70))))

(declare-fun arrayContainsKey!0 (array!101423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1524775 (arrayContainsKey!0 a!2804 lt!660448 #b00000000000000000000000000000000)))

(declare-fun lt!660449 () Unit!50996)

(assert (=> b!1524775 (= lt!660449 lt!660447)))

(declare-fun res!1043225 () Bool)

(assert (=> b!1524775 (= res!1043225 (= (seekEntryOrOpen!0 (select (arr!48941 a!2804) j!70) a!2804 mask!2512) (Found!13106 j!70)))))

(assert (=> b!1524775 (=> (not res!1043225) (not e!849975))))

(declare-fun d!159399 () Bool)

(declare-fun res!1043226 () Bool)

(assert (=> d!159399 (=> res!1043226 e!849974)))

(assert (=> d!159399 (= res!1043226 (bvsge j!70 (size!49491 a!2804)))))

(assert (=> d!159399 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!849974)))

(declare-fun bm!68433 () Bool)

(assert (=> bm!68433 (= call!68436 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1524776 () Bool)

(assert (=> b!1524776 (= e!849975 call!68436)))

(assert (= (and d!159399 (not res!1043226)) b!1524774))

(assert (= (and b!1524774 c!140324) b!1524775))

(assert (= (and b!1524774 (not c!140324)) b!1524773))

(assert (= (and b!1524775 res!1043225) b!1524776))

(assert (= (or b!1524776 b!1524773) bm!68433))

(assert (=> b!1524774 m!1407485))

(assert (=> b!1524774 m!1407485))

(assert (=> b!1524774 m!1407499))

(assert (=> b!1524775 m!1407485))

(declare-fun m!1407711 () Bool)

(assert (=> b!1524775 m!1407711))

(declare-fun m!1407713 () Bool)

(assert (=> b!1524775 m!1407713))

(assert (=> b!1524775 m!1407485))

(assert (=> b!1524775 m!1407521))

(declare-fun m!1407715 () Bool)

(assert (=> bm!68433 m!1407715))

(assert (=> b!1524447 d!159399))

(declare-fun d!159401 () Bool)

(assert (=> d!159401 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!660454 () Unit!50996)

(declare-fun choose!38 (array!101423 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50996)

(assert (=> d!159401 (= lt!660454 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159401 (validMask!0 mask!2512)))

(assert (=> d!159401 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!660454)))

(declare-fun bs!43756 () Bool)

(assert (= bs!43756 d!159401))

(assert (=> bs!43756 m!1407515))

(declare-fun m!1407717 () Bool)

(assert (=> bs!43756 m!1407717))

(assert (=> bs!43756 m!1407501))

(assert (=> b!1524447 d!159401))

(declare-fun b!1524786 () Bool)

(declare-fun e!849981 () Bool)

(declare-fun call!68437 () Bool)

(assert (=> b!1524786 (= e!849981 call!68437)))

(declare-fun b!1524787 () Bool)

(declare-fun e!849982 () Bool)

(assert (=> b!1524787 (= e!849982 e!849981)))

(declare-fun c!140328 () Bool)

(assert (=> b!1524787 (= c!140328 (validKeyInArray!0 (select (arr!48941 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1524788 () Bool)

(declare-fun e!849983 () Bool)

(assert (=> b!1524788 (= e!849981 e!849983)))

(declare-fun lt!660456 () (_ BitVec 64))

(assert (=> b!1524788 (= lt!660456 (select (arr!48941 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!660455 () Unit!50996)

(assert (=> b!1524788 (= lt!660455 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660456 #b00000000000000000000000000000000))))

(assert (=> b!1524788 (arrayContainsKey!0 a!2804 lt!660456 #b00000000000000000000000000000000)))

(declare-fun lt!660457 () Unit!50996)

(assert (=> b!1524788 (= lt!660457 lt!660455)))

(declare-fun res!1043230 () Bool)

(assert (=> b!1524788 (= res!1043230 (= (seekEntryOrOpen!0 (select (arr!48941 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13106 #b00000000000000000000000000000000)))))

(assert (=> b!1524788 (=> (not res!1043230) (not e!849983))))

(declare-fun d!159403 () Bool)

(declare-fun res!1043231 () Bool)

(assert (=> d!159403 (=> res!1043231 e!849982)))

(assert (=> d!159403 (= res!1043231 (bvsge #b00000000000000000000000000000000 (size!49491 a!2804)))))

(assert (=> d!159403 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!849982)))

(declare-fun bm!68434 () Bool)

(assert (=> bm!68434 (= call!68437 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1524789 () Bool)

(assert (=> b!1524789 (= e!849983 call!68437)))

(assert (= (and d!159403 (not res!1043231)) b!1524787))

(assert (= (and b!1524787 c!140328) b!1524788))

(assert (= (and b!1524787 (not c!140328)) b!1524786))

(assert (= (and b!1524788 res!1043230) b!1524789))

(assert (= (or b!1524789 b!1524786) bm!68434))

(declare-fun m!1407719 () Bool)

(assert (=> b!1524787 m!1407719))

(assert (=> b!1524787 m!1407719))

(declare-fun m!1407721 () Bool)

(assert (=> b!1524787 m!1407721))

(assert (=> b!1524788 m!1407719))

(declare-fun m!1407725 () Bool)

(assert (=> b!1524788 m!1407725))

(declare-fun m!1407727 () Bool)

(assert (=> b!1524788 m!1407727))

(assert (=> b!1524788 m!1407719))

(declare-fun m!1407729 () Bool)

(assert (=> b!1524788 m!1407729))

(declare-fun m!1407733 () Bool)

(assert (=> bm!68434 m!1407733))

(assert (=> b!1524448 d!159403))

(declare-fun d!159405 () Bool)

(declare-fun res!1043241 () Bool)

(declare-fun e!849998 () Bool)

(assert (=> d!159405 (=> res!1043241 e!849998)))

(assert (=> d!159405 (= res!1043241 (bvsge #b00000000000000000000000000000000 (size!49491 a!2804)))))

(assert (=> d!159405 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35421) e!849998)))

(declare-fun b!1524812 () Bool)

(declare-fun e!850000 () Bool)

(declare-fun call!68440 () Bool)

(assert (=> b!1524812 (= e!850000 call!68440)))

(declare-fun b!1524813 () Bool)

(assert (=> b!1524813 (= e!850000 call!68440)))

(declare-fun b!1524814 () Bool)

(declare-fun e!850001 () Bool)

(assert (=> b!1524814 (= e!850001 e!850000)))

(declare-fun c!140337 () Bool)

(assert (=> b!1524814 (= c!140337 (validKeyInArray!0 (select (arr!48941 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1524815 () Bool)

(assert (=> b!1524815 (= e!849998 e!850001)))

(declare-fun res!1043239 () Bool)

(assert (=> b!1524815 (=> (not res!1043239) (not e!850001))))

(declare-fun e!849999 () Bool)

(assert (=> b!1524815 (= res!1043239 (not e!849999))))

(declare-fun res!1043240 () Bool)

(assert (=> b!1524815 (=> (not res!1043240) (not e!849999))))

(assert (=> b!1524815 (= res!1043240 (validKeyInArray!0 (select (arr!48941 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1524816 () Bool)

(declare-fun contains!9991 (List!35424 (_ BitVec 64)) Bool)

(assert (=> b!1524816 (= e!849999 (contains!9991 Nil!35421 (select (arr!48941 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68437 () Bool)

(assert (=> bm!68437 (= call!68440 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140337 (Cons!35420 (select (arr!48941 a!2804) #b00000000000000000000000000000000) Nil!35421) Nil!35421)))))

(assert (= (and d!159405 (not res!1043241)) b!1524815))

(assert (= (and b!1524815 res!1043240) b!1524816))

(assert (= (and b!1524815 res!1043239) b!1524814))

(assert (= (and b!1524814 c!140337) b!1524812))

(assert (= (and b!1524814 (not c!140337)) b!1524813))

(assert (= (or b!1524812 b!1524813) bm!68437))

(assert (=> b!1524814 m!1407719))

(assert (=> b!1524814 m!1407719))

(assert (=> b!1524814 m!1407721))

(assert (=> b!1524815 m!1407719))

(assert (=> b!1524815 m!1407719))

(assert (=> b!1524815 m!1407721))

(assert (=> b!1524816 m!1407719))

(assert (=> b!1524816 m!1407719))

(declare-fun m!1407739 () Bool)

(assert (=> b!1524816 m!1407739))

(assert (=> bm!68437 m!1407719))

(declare-fun m!1407741 () Bool)

(assert (=> bm!68437 m!1407741))

(assert (=> b!1524438 d!159405))

(declare-fun b!1524823 () Bool)

(declare-fun e!850005 () SeekEntryResult!13106)

(declare-fun e!850007 () SeekEntryResult!13106)

(assert (=> b!1524823 (= e!850005 e!850007)))

(declare-fun lt!660468 () (_ BitVec 64))

(declare-fun c!140341 () Bool)

(assert (=> b!1524823 (= c!140341 (or (= lt!660468 (select (store (arr!48941 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!660468 lt!660468) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1524824 () Bool)

(declare-fun e!850009 () Bool)

(declare-fun lt!660469 () SeekEntryResult!13106)

(assert (=> b!1524824 (= e!850009 (bvsge (x!136510 lt!660469) #b01111111111111111111111111111110))))

(declare-fun b!1524825 () Bool)

(assert (=> b!1524825 (and (bvsge (index!54821 lt!660469) #b00000000000000000000000000000000) (bvslt (index!54821 lt!660469) (size!49491 (array!101424 (store (arr!48941 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49491 a!2804)))))))

(declare-fun res!1043243 () Bool)

(assert (=> b!1524825 (= res!1043243 (= (select (arr!48941 (array!101424 (store (arr!48941 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49491 a!2804))) (index!54821 lt!660469)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!850006 () Bool)

(assert (=> b!1524825 (=> res!1043243 e!850006)))

(declare-fun b!1524826 () Bool)

(declare-fun e!850008 () Bool)

(assert (=> b!1524826 (= e!850009 e!850008)))

(declare-fun res!1043244 () Bool)

(assert (=> b!1524826 (= res!1043244 (and (is-Intermediate!13106 lt!660469) (not (undefined!13918 lt!660469)) (bvslt (x!136510 lt!660469) #b01111111111111111111111111111110) (bvsge (x!136510 lt!660469) #b00000000000000000000000000000000) (bvsge (x!136510 lt!660469) #b00000000000000000000000000000000)))))

(assert (=> b!1524826 (=> (not res!1043244) (not e!850008))))

(declare-fun d!159409 () Bool)

(assert (=> d!159409 e!850009))

(declare-fun c!140342 () Bool)

(assert (=> d!159409 (= c!140342 (and (is-Intermediate!13106 lt!660469) (undefined!13918 lt!660469)))))

(assert (=> d!159409 (= lt!660469 e!850005)))

(declare-fun c!140343 () Bool)

(assert (=> d!159409 (= c!140343 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159409 (= lt!660468 (select (arr!48941 (array!101424 (store (arr!48941 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49491 a!2804))) (toIndex!0 (select (store (arr!48941 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!159409 (validMask!0 mask!2512)))

(assert (=> d!159409 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48941 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48941 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101424 (store (arr!48941 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49491 a!2804)) mask!2512) lt!660469)))

(declare-fun b!1524827 () Bool)

(assert (=> b!1524827 (= e!850007 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48941 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!48941 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101424 (store (arr!48941 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49491 a!2804)) mask!2512))))

(declare-fun b!1524828 () Bool)

(assert (=> b!1524828 (= e!850005 (Intermediate!13106 true (toIndex!0 (select (store (arr!48941 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1524829 () Bool)

(assert (=> b!1524829 (= e!850007 (Intermediate!13106 false (toIndex!0 (select (store (arr!48941 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1524830 () Bool)

(assert (=> b!1524830 (and (bvsge (index!54821 lt!660469) #b00000000000000000000000000000000) (bvslt (index!54821 lt!660469) (size!49491 (array!101424 (store (arr!48941 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49491 a!2804)))))))

(declare-fun res!1043242 () Bool)

(assert (=> b!1524830 (= res!1043242 (= (select (arr!48941 (array!101424 (store (arr!48941 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49491 a!2804))) (index!54821 lt!660469)) (select (store (arr!48941 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1524830 (=> res!1043242 e!850006)))

(assert (=> b!1524830 (= e!850008 e!850006)))

(declare-fun b!1524831 () Bool)

(assert (=> b!1524831 (and (bvsge (index!54821 lt!660469) #b00000000000000000000000000000000) (bvslt (index!54821 lt!660469) (size!49491 (array!101424 (store (arr!48941 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49491 a!2804)))))))

(assert (=> b!1524831 (= e!850006 (= (select (arr!48941 (array!101424 (store (arr!48941 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49491 a!2804))) (index!54821 lt!660469)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!159409 c!140343) b!1524828))

(assert (= (and d!159409 (not c!140343)) b!1524823))

(assert (= (and b!1524823 c!140341) b!1524829))

(assert (= (and b!1524823 (not c!140341)) b!1524827))

(assert (= (and d!159409 c!140342) b!1524824))

(assert (= (and d!159409 (not c!140342)) b!1524826))

(assert (= (and b!1524826 res!1043244) b!1524830))

(assert (= (and b!1524830 (not res!1043242)) b!1524825))

(assert (= (and b!1524825 (not res!1043243)) b!1524831))

(assert (=> d!159409 m!1407493))

(declare-fun m!1407751 () Bool)

(assert (=> d!159409 m!1407751))

(assert (=> d!159409 m!1407501))

(declare-fun m!1407753 () Bool)

(assert (=> b!1524830 m!1407753))

(assert (=> b!1524825 m!1407753))

(assert (=> b!1524831 m!1407753))

(assert (=> b!1524827 m!1407493))

(declare-fun m!1407755 () Bool)

(assert (=> b!1524827 m!1407755))

(assert (=> b!1524827 m!1407755))

(assert (=> b!1524827 m!1407491))

(declare-fun m!1407757 () Bool)

(assert (=> b!1524827 m!1407757))

(assert (=> b!1524443 d!159409))

(declare-fun d!159415 () Bool)

(declare-fun lt!660475 () (_ BitVec 32))

(declare-fun lt!660474 () (_ BitVec 32))

(assert (=> d!159415 (= lt!660475 (bvmul (bvxor lt!660474 (bvlshr lt!660474 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159415 (= lt!660474 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48941 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48941 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159415 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1043211 (let ((h!36851 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48941 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48941 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136516 (bvmul (bvxor h!36851 (bvlshr h!36851 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136516 (bvlshr x!136516 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1043211 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1043211 #b00000000000000000000000000000000))))))

(assert (=> d!159415 (= (toIndex!0 (select (store (arr!48941 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!660475 (bvlshr lt!660475 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1524443 d!159415))

(push 1)

(assert (not d!159367))

(assert (not d!159393))

(assert (not b!1524816))

(assert (not d!159381))

(assert (not b!1524775))

(assert (not bm!68433))

(assert (not b!1524742))

(assert (not d!159397))

(assert (not b!1524701))

(assert (not b!1524815))

(assert (not b!1524607))

(assert (not b!1524788))

(assert (not d!159387))

(assert (not d!159409))

(assert (not bm!68437))

(assert (not b!1524814))

(assert (not b!1524827))

(assert (not b!1524787))

(assert (not b!1524659))

(assert (not b!1524733))

(assert (not bm!68434))

(assert (not b!1524774))

(assert (not d!159401))

(check-sat)

(pop 1)

(push 1)

(check-sat)

