; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129886 () Bool)

(assert start!129886)

(declare-fun b!1524474 () Bool)

(declare-fun res!1043133 () Bool)

(declare-fun e!849817 () Bool)

(assert (=> b!1524474 (=> (not res!1043133) (not e!849817))))

(declare-datatypes ((SeekEntryResult!13107 0))(
  ( (MissingZero!13107 (index!54823 (_ BitVec 32))) (Found!13107 (index!54824 (_ BitVec 32))) (Intermediate!13107 (undefined!13919 Bool) (index!54825 (_ BitVec 32)) (x!136511 (_ BitVec 32))) (Undefined!13107) (MissingVacant!13107 (index!54826 (_ BitVec 32))) )
))
(declare-fun lt!660324 () SeekEntryResult!13107)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101425 0))(
  ( (array!101426 (arr!48942 (Array (_ BitVec 32) (_ BitVec 64))) (size!49492 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101425)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101425 (_ BitVec 32)) SeekEntryResult!13107)

(assert (=> b!1524474 (= res!1043133 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48942 a!2804) j!70) a!2804 mask!2512) lt!660324))))

(declare-fun b!1524475 () Bool)

(declare-fun res!1043132 () Bool)

(declare-fun e!849816 () Bool)

(assert (=> b!1524475 (=> (not res!1043132) (not e!849816))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1524475 (= res!1043132 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49492 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49492 a!2804))))))

(declare-fun b!1524476 () Bool)

(assert (=> b!1524476 (= e!849816 e!849817)))

(declare-fun res!1043137 () Bool)

(assert (=> b!1524476 (=> (not res!1043137) (not e!849817))))

(declare-fun lt!660323 () SeekEntryResult!13107)

(assert (=> b!1524476 (= res!1043137 (= lt!660323 lt!660324))))

(assert (=> b!1524476 (= lt!660324 (Intermediate!13107 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524476 (= lt!660323 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48942 a!2804) j!70) mask!2512) (select (arr!48942 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524477 () Bool)

(declare-fun res!1043126 () Bool)

(assert (=> b!1524477 (=> (not res!1043126) (not e!849816))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1524477 (= res!1043126 (validKeyInArray!0 (select (arr!48942 a!2804) i!961)))))

(declare-fun res!1043130 () Bool)

(assert (=> start!129886 (=> (not res!1043130) (not e!849816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129886 (= res!1043130 (validMask!0 mask!2512))))

(assert (=> start!129886 e!849816))

(assert (=> start!129886 true))

(declare-fun array_inv!37970 (array!101425) Bool)

(assert (=> start!129886 (array_inv!37970 a!2804)))

(declare-fun b!1524478 () Bool)

(declare-fun res!1043136 () Bool)

(assert (=> b!1524478 (=> (not res!1043136) (not e!849816))))

(declare-datatypes ((List!35425 0))(
  ( (Nil!35422) (Cons!35421 (h!36848 (_ BitVec 64)) (t!50119 List!35425)) )
))
(declare-fun arrayNoDuplicates!0 (array!101425 (_ BitVec 32) List!35425) Bool)

(assert (=> b!1524478 (= res!1043136 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35422))))

(declare-fun b!1524479 () Bool)

(declare-fun res!1043131 () Bool)

(assert (=> b!1524479 (=> (not res!1043131) (not e!849816))))

(assert (=> b!1524479 (= res!1043131 (validKeyInArray!0 (select (arr!48942 a!2804) j!70)))))

(declare-fun b!1524480 () Bool)

(declare-fun e!849814 () Bool)

(assert (=> b!1524480 (= e!849817 (not e!849814))))

(declare-fun res!1043134 () Bool)

(assert (=> b!1524480 (=> res!1043134 e!849814)))

(assert (=> b!1524480 (= res!1043134 (or (not (= (select (arr!48942 a!2804) j!70) (select (store (arr!48942 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48942 a!2804) index!487) (select (arr!48942 a!2804) j!70)) (not (= (select (arr!48942 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!849813 () Bool)

(assert (=> b!1524480 e!849813))

(declare-fun res!1043128 () Bool)

(assert (=> b!1524480 (=> (not res!1043128) (not e!849813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101425 (_ BitVec 32)) Bool)

(assert (=> b!1524480 (= res!1043128 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50998 0))(
  ( (Unit!50999) )
))
(declare-fun lt!660325 () Unit!50998)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101425 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50998)

(assert (=> b!1524480 (= lt!660325 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1524481 () Bool)

(declare-fun res!1043129 () Bool)

(assert (=> b!1524481 (=> (not res!1043129) (not e!849817))))

(assert (=> b!1524481 (= res!1043129 (= lt!660323 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48942 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48942 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101426 (store (arr!48942 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49492 a!2804)) mask!2512)))))

(declare-fun b!1524482 () Bool)

(declare-fun res!1043127 () Bool)

(assert (=> b!1524482 (=> (not res!1043127) (not e!849816))))

(assert (=> b!1524482 (= res!1043127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1524483 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101425 (_ BitVec 32)) SeekEntryResult!13107)

(assert (=> b!1524483 (= e!849813 (= (seekEntry!0 (select (arr!48942 a!2804) j!70) a!2804 mask!2512) (Found!13107 j!70)))))

(declare-fun b!1524484 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101425 (_ BitVec 32)) SeekEntryResult!13107)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101425 (_ BitVec 32)) SeekEntryResult!13107)

(assert (=> b!1524484 (= e!849814 (= (seekEntryOrOpen!0 (select (arr!48942 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48942 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1524485 () Bool)

(declare-fun res!1043135 () Bool)

(assert (=> b!1524485 (=> (not res!1043135) (not e!849816))))

(assert (=> b!1524485 (= res!1043135 (and (= (size!49492 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49492 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49492 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129886 res!1043130) b!1524485))

(assert (= (and b!1524485 res!1043135) b!1524477))

(assert (= (and b!1524477 res!1043126) b!1524479))

(assert (= (and b!1524479 res!1043131) b!1524482))

(assert (= (and b!1524482 res!1043127) b!1524478))

(assert (= (and b!1524478 res!1043136) b!1524475))

(assert (= (and b!1524475 res!1043132) b!1524476))

(assert (= (and b!1524476 res!1043137) b!1524474))

(assert (= (and b!1524474 res!1043133) b!1524481))

(assert (= (and b!1524481 res!1043129) b!1524480))

(assert (= (and b!1524480 res!1043128) b!1524483))

(assert (= (and b!1524480 (not res!1043134)) b!1524484))

(declare-fun m!1407525 () Bool)

(assert (=> b!1524482 m!1407525))

(declare-fun m!1407527 () Bool)

(assert (=> b!1524474 m!1407527))

(assert (=> b!1524474 m!1407527))

(declare-fun m!1407529 () Bool)

(assert (=> b!1524474 m!1407529))

(declare-fun m!1407531 () Bool)

(assert (=> start!129886 m!1407531))

(declare-fun m!1407533 () Bool)

(assert (=> start!129886 m!1407533))

(assert (=> b!1524480 m!1407527))

(declare-fun m!1407535 () Bool)

(assert (=> b!1524480 m!1407535))

(declare-fun m!1407537 () Bool)

(assert (=> b!1524480 m!1407537))

(declare-fun m!1407539 () Bool)

(assert (=> b!1524480 m!1407539))

(declare-fun m!1407541 () Bool)

(assert (=> b!1524480 m!1407541))

(declare-fun m!1407543 () Bool)

(assert (=> b!1524480 m!1407543))

(assert (=> b!1524479 m!1407527))

(assert (=> b!1524479 m!1407527))

(declare-fun m!1407545 () Bool)

(assert (=> b!1524479 m!1407545))

(declare-fun m!1407547 () Bool)

(assert (=> b!1524477 m!1407547))

(assert (=> b!1524477 m!1407547))

(declare-fun m!1407549 () Bool)

(assert (=> b!1524477 m!1407549))

(assert (=> b!1524476 m!1407527))

(assert (=> b!1524476 m!1407527))

(declare-fun m!1407551 () Bool)

(assert (=> b!1524476 m!1407551))

(assert (=> b!1524476 m!1407551))

(assert (=> b!1524476 m!1407527))

(declare-fun m!1407553 () Bool)

(assert (=> b!1524476 m!1407553))

(assert (=> b!1524483 m!1407527))

(assert (=> b!1524483 m!1407527))

(declare-fun m!1407555 () Bool)

(assert (=> b!1524483 m!1407555))

(declare-fun m!1407557 () Bool)

(assert (=> b!1524478 m!1407557))

(assert (=> b!1524484 m!1407527))

(assert (=> b!1524484 m!1407527))

(declare-fun m!1407559 () Bool)

(assert (=> b!1524484 m!1407559))

(assert (=> b!1524484 m!1407527))

(declare-fun m!1407561 () Bool)

(assert (=> b!1524484 m!1407561))

(assert (=> b!1524481 m!1407537))

(assert (=> b!1524481 m!1407541))

(assert (=> b!1524481 m!1407541))

(declare-fun m!1407563 () Bool)

(assert (=> b!1524481 m!1407563))

(assert (=> b!1524481 m!1407563))

(assert (=> b!1524481 m!1407541))

(declare-fun m!1407565 () Bool)

(assert (=> b!1524481 m!1407565))

(check-sat (not start!129886) (not b!1524474) (not b!1524476) (not b!1524483) (not b!1524482) (not b!1524478) (not b!1524480) (not b!1524477) (not b!1524484) (not b!1524481) (not b!1524479))
(check-sat)
(get-model)

(declare-fun e!849845 () SeekEntryResult!13107)

(declare-fun b!1524540 () Bool)

(assert (=> b!1524540 (= e!849845 (Intermediate!13107 false (toIndex!0 (select (arr!48942 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1524541 () Bool)

(declare-fun lt!660339 () SeekEntryResult!13107)

(assert (=> b!1524541 (and (bvsge (index!54825 lt!660339) #b00000000000000000000000000000000) (bvslt (index!54825 lt!660339) (size!49492 a!2804)))))

(declare-fun res!1043181 () Bool)

(assert (=> b!1524541 (= res!1043181 (= (select (arr!48942 a!2804) (index!54825 lt!660339)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849843 () Bool)

(assert (=> b!1524541 (=> res!1043181 e!849843)))

(declare-fun b!1524542 () Bool)

(assert (=> b!1524542 (and (bvsge (index!54825 lt!660339) #b00000000000000000000000000000000) (bvslt (index!54825 lt!660339) (size!49492 a!2804)))))

(declare-fun res!1043180 () Bool)

(assert (=> b!1524542 (= res!1043180 (= (select (arr!48942 a!2804) (index!54825 lt!660339)) (select (arr!48942 a!2804) j!70)))))

(assert (=> b!1524542 (=> res!1043180 e!849843)))

(declare-fun e!849846 () Bool)

(assert (=> b!1524542 (= e!849846 e!849843)))

(declare-fun d!159353 () Bool)

(declare-fun e!849844 () Bool)

(assert (=> d!159353 e!849844))

(declare-fun c!140229 () Bool)

(get-info :version)

(assert (=> d!159353 (= c!140229 (and ((_ is Intermediate!13107) lt!660339) (undefined!13919 lt!660339)))))

(declare-fun e!849847 () SeekEntryResult!13107)

(assert (=> d!159353 (= lt!660339 e!849847)))

(declare-fun c!140231 () Bool)

(assert (=> d!159353 (= c!140231 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!660340 () (_ BitVec 64))

(assert (=> d!159353 (= lt!660340 (select (arr!48942 a!2804) (toIndex!0 (select (arr!48942 a!2804) j!70) mask!2512)))))

(assert (=> d!159353 (validMask!0 mask!2512)))

(assert (=> d!159353 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48942 a!2804) j!70) mask!2512) (select (arr!48942 a!2804) j!70) a!2804 mask!2512) lt!660339)))

(declare-fun b!1524543 () Bool)

(assert (=> b!1524543 (= e!849844 e!849846)))

(declare-fun res!1043182 () Bool)

(assert (=> b!1524543 (= res!1043182 (and ((_ is Intermediate!13107) lt!660339) (not (undefined!13919 lt!660339)) (bvslt (x!136511 lt!660339) #b01111111111111111111111111111110) (bvsge (x!136511 lt!660339) #b00000000000000000000000000000000) (bvsge (x!136511 lt!660339) #b00000000000000000000000000000000)))))

(assert (=> b!1524543 (=> (not res!1043182) (not e!849846))))

(declare-fun b!1524544 () Bool)

(assert (=> b!1524544 (and (bvsge (index!54825 lt!660339) #b00000000000000000000000000000000) (bvslt (index!54825 lt!660339) (size!49492 a!2804)))))

(assert (=> b!1524544 (= e!849843 (= (select (arr!48942 a!2804) (index!54825 lt!660339)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1524545 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524545 (= e!849845 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48942 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48942 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524546 () Bool)

(assert (=> b!1524546 (= e!849847 e!849845)))

(declare-fun c!140230 () Bool)

(assert (=> b!1524546 (= c!140230 (or (= lt!660340 (select (arr!48942 a!2804) j!70)) (= (bvadd lt!660340 lt!660340) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1524547 () Bool)

(assert (=> b!1524547 (= e!849844 (bvsge (x!136511 lt!660339) #b01111111111111111111111111111110))))

(declare-fun b!1524548 () Bool)

(assert (=> b!1524548 (= e!849847 (Intermediate!13107 true (toIndex!0 (select (arr!48942 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(assert (= (and d!159353 c!140231) b!1524548))

(assert (= (and d!159353 (not c!140231)) b!1524546))

(assert (= (and b!1524546 c!140230) b!1524540))

(assert (= (and b!1524546 (not c!140230)) b!1524545))

(assert (= (and d!159353 c!140229) b!1524547))

(assert (= (and d!159353 (not c!140229)) b!1524543))

(assert (= (and b!1524543 res!1043182) b!1524542))

(assert (= (and b!1524542 (not res!1043180)) b!1524541))

(assert (= (and b!1524541 (not res!1043181)) b!1524544))

(declare-fun m!1407609 () Bool)

(assert (=> b!1524542 m!1407609))

(assert (=> d!159353 m!1407551))

(declare-fun m!1407611 () Bool)

(assert (=> d!159353 m!1407611))

(assert (=> d!159353 m!1407531))

(assert (=> b!1524544 m!1407609))

(assert (=> b!1524541 m!1407609))

(assert (=> b!1524545 m!1407551))

(declare-fun m!1407613 () Bool)

(assert (=> b!1524545 m!1407613))

(assert (=> b!1524545 m!1407613))

(assert (=> b!1524545 m!1407527))

(declare-fun m!1407615 () Bool)

(assert (=> b!1524545 m!1407615))

(assert (=> b!1524476 d!159353))

(declare-fun d!159355 () Bool)

(declare-fun lt!660346 () (_ BitVec 32))

(declare-fun lt!660345 () (_ BitVec 32))

(assert (=> d!159355 (= lt!660346 (bvmul (bvxor lt!660345 (bvlshr lt!660345 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159355 (= lt!660345 ((_ extract 31 0) (bvand (bvxor (select (arr!48942 a!2804) j!70) (bvlshr (select (arr!48942 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159355 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1043183 (let ((h!36850 ((_ extract 31 0) (bvand (bvxor (select (arr!48942 a!2804) j!70) (bvlshr (select (arr!48942 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136514 (bvmul (bvxor h!36850 (bvlshr h!36850 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136514 (bvlshr x!136514 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1043183 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1043183 #b00000000000000000000000000000000))))))

(assert (=> d!159355 (= (toIndex!0 (select (arr!48942 a!2804) j!70) mask!2512) (bvand (bvxor lt!660346 (bvlshr lt!660346 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1524476 d!159355))

(declare-fun b!1524549 () Bool)

(declare-fun e!849850 () SeekEntryResult!13107)

(assert (=> b!1524549 (= e!849850 (Intermediate!13107 false (toIndex!0 (select (store (arr!48942 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1524550 () Bool)

(declare-fun lt!660347 () SeekEntryResult!13107)

(assert (=> b!1524550 (and (bvsge (index!54825 lt!660347) #b00000000000000000000000000000000) (bvslt (index!54825 lt!660347) (size!49492 (array!101426 (store (arr!48942 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49492 a!2804)))))))

(declare-fun res!1043185 () Bool)

(assert (=> b!1524550 (= res!1043185 (= (select (arr!48942 (array!101426 (store (arr!48942 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49492 a!2804))) (index!54825 lt!660347)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849848 () Bool)

(assert (=> b!1524550 (=> res!1043185 e!849848)))

(declare-fun b!1524551 () Bool)

(assert (=> b!1524551 (and (bvsge (index!54825 lt!660347) #b00000000000000000000000000000000) (bvslt (index!54825 lt!660347) (size!49492 (array!101426 (store (arr!48942 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49492 a!2804)))))))

(declare-fun res!1043184 () Bool)

(assert (=> b!1524551 (= res!1043184 (= (select (arr!48942 (array!101426 (store (arr!48942 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49492 a!2804))) (index!54825 lt!660347)) (select (store (arr!48942 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1524551 (=> res!1043184 e!849848)))

(declare-fun e!849851 () Bool)

(assert (=> b!1524551 (= e!849851 e!849848)))

(declare-fun d!159359 () Bool)

(declare-fun e!849849 () Bool)

(assert (=> d!159359 e!849849))

(declare-fun c!140232 () Bool)

(assert (=> d!159359 (= c!140232 (and ((_ is Intermediate!13107) lt!660347) (undefined!13919 lt!660347)))))

(declare-fun e!849852 () SeekEntryResult!13107)

(assert (=> d!159359 (= lt!660347 e!849852)))

(declare-fun c!140234 () Bool)

(assert (=> d!159359 (= c!140234 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!660348 () (_ BitVec 64))

(assert (=> d!159359 (= lt!660348 (select (arr!48942 (array!101426 (store (arr!48942 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49492 a!2804))) (toIndex!0 (select (store (arr!48942 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!159359 (validMask!0 mask!2512)))

(assert (=> d!159359 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48942 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48942 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101426 (store (arr!48942 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49492 a!2804)) mask!2512) lt!660347)))

(declare-fun b!1524552 () Bool)

(assert (=> b!1524552 (= e!849849 e!849851)))

(declare-fun res!1043186 () Bool)

(assert (=> b!1524552 (= res!1043186 (and ((_ is Intermediate!13107) lt!660347) (not (undefined!13919 lt!660347)) (bvslt (x!136511 lt!660347) #b01111111111111111111111111111110) (bvsge (x!136511 lt!660347) #b00000000000000000000000000000000) (bvsge (x!136511 lt!660347) #b00000000000000000000000000000000)))))

(assert (=> b!1524552 (=> (not res!1043186) (not e!849851))))

(declare-fun b!1524553 () Bool)

(assert (=> b!1524553 (and (bvsge (index!54825 lt!660347) #b00000000000000000000000000000000) (bvslt (index!54825 lt!660347) (size!49492 (array!101426 (store (arr!48942 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49492 a!2804)))))))

(assert (=> b!1524553 (= e!849848 (= (select (arr!48942 (array!101426 (store (arr!48942 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49492 a!2804))) (index!54825 lt!660347)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1524554 () Bool)

(assert (=> b!1524554 (= e!849850 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48942 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!48942 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101426 (store (arr!48942 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49492 a!2804)) mask!2512))))

(declare-fun b!1524555 () Bool)

(assert (=> b!1524555 (= e!849852 e!849850)))

(declare-fun c!140233 () Bool)

(assert (=> b!1524555 (= c!140233 (or (= lt!660348 (select (store (arr!48942 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!660348 lt!660348) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1524556 () Bool)

(assert (=> b!1524556 (= e!849849 (bvsge (x!136511 lt!660347) #b01111111111111111111111111111110))))

(declare-fun b!1524557 () Bool)

(assert (=> b!1524557 (= e!849852 (Intermediate!13107 true (toIndex!0 (select (store (arr!48942 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(assert (= (and d!159359 c!140234) b!1524557))

(assert (= (and d!159359 (not c!140234)) b!1524555))

(assert (= (and b!1524555 c!140233) b!1524549))

(assert (= (and b!1524555 (not c!140233)) b!1524554))

(assert (= (and d!159359 c!140232) b!1524556))

(assert (= (and d!159359 (not c!140232)) b!1524552))

(assert (= (and b!1524552 res!1043186) b!1524551))

(assert (= (and b!1524551 (not res!1043184)) b!1524550))

(assert (= (and b!1524550 (not res!1043185)) b!1524553))

(declare-fun m!1407617 () Bool)

(assert (=> b!1524551 m!1407617))

(assert (=> d!159359 m!1407563))

(declare-fun m!1407619 () Bool)

(assert (=> d!159359 m!1407619))

(assert (=> d!159359 m!1407531))

(assert (=> b!1524553 m!1407617))

(assert (=> b!1524550 m!1407617))

(assert (=> b!1524554 m!1407563))

(declare-fun m!1407621 () Bool)

(assert (=> b!1524554 m!1407621))

(assert (=> b!1524554 m!1407621))

(assert (=> b!1524554 m!1407541))

(declare-fun m!1407623 () Bool)

(assert (=> b!1524554 m!1407623))

(assert (=> b!1524481 d!159359))

(declare-fun d!159361 () Bool)

(declare-fun lt!660350 () (_ BitVec 32))

(declare-fun lt!660349 () (_ BitVec 32))

(assert (=> d!159361 (= lt!660350 (bvmul (bvxor lt!660349 (bvlshr lt!660349 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159361 (= lt!660349 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48942 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48942 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159361 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1043183 (let ((h!36850 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48942 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48942 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136514 (bvmul (bvxor h!36850 (bvlshr h!36850 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136514 (bvlshr x!136514 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1043183 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1043183 #b00000000000000000000000000000000))))))

(assert (=> d!159361 (= (toIndex!0 (select (store (arr!48942 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!660350 (bvlshr lt!660350 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1524481 d!159361))

(declare-fun d!159363 () Bool)

(declare-fun res!1043191 () Bool)

(declare-fun e!849859 () Bool)

(assert (=> d!159363 (=> res!1043191 e!849859)))

(assert (=> d!159363 (= res!1043191 (bvsge #b00000000000000000000000000000000 (size!49492 a!2804)))))

(assert (=> d!159363 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!849859)))

(declare-fun b!1524566 () Bool)

(declare-fun e!849861 () Bool)

(assert (=> b!1524566 (= e!849859 e!849861)))

(declare-fun c!140237 () Bool)

(assert (=> b!1524566 (= c!140237 (validKeyInArray!0 (select (arr!48942 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68427 () Bool)

(declare-fun call!68430 () Bool)

(assert (=> bm!68427 (= call!68430 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1524567 () Bool)

(declare-fun e!849860 () Bool)

(assert (=> b!1524567 (= e!849860 call!68430)))

(declare-fun b!1524568 () Bool)

(assert (=> b!1524568 (= e!849861 e!849860)))

(declare-fun lt!660358 () (_ BitVec 64))

(assert (=> b!1524568 (= lt!660358 (select (arr!48942 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!660359 () Unit!50998)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101425 (_ BitVec 64) (_ BitVec 32)) Unit!50998)

(assert (=> b!1524568 (= lt!660359 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660358 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1524568 (arrayContainsKey!0 a!2804 lt!660358 #b00000000000000000000000000000000)))

(declare-fun lt!660357 () Unit!50998)

(assert (=> b!1524568 (= lt!660357 lt!660359)))

(declare-fun res!1043192 () Bool)

(assert (=> b!1524568 (= res!1043192 (= (seekEntryOrOpen!0 (select (arr!48942 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13107 #b00000000000000000000000000000000)))))

(assert (=> b!1524568 (=> (not res!1043192) (not e!849860))))

(declare-fun b!1524569 () Bool)

(assert (=> b!1524569 (= e!849861 call!68430)))

(assert (= (and d!159363 (not res!1043191)) b!1524566))

(assert (= (and b!1524566 c!140237) b!1524568))

(assert (= (and b!1524566 (not c!140237)) b!1524569))

(assert (= (and b!1524568 res!1043192) b!1524567))

(assert (= (or b!1524567 b!1524569) bm!68427))

(declare-fun m!1407625 () Bool)

(assert (=> b!1524566 m!1407625))

(assert (=> b!1524566 m!1407625))

(declare-fun m!1407627 () Bool)

(assert (=> b!1524566 m!1407627))

(declare-fun m!1407629 () Bool)

(assert (=> bm!68427 m!1407629))

(assert (=> b!1524568 m!1407625))

(declare-fun m!1407631 () Bool)

(assert (=> b!1524568 m!1407631))

(declare-fun m!1407633 () Bool)

(assert (=> b!1524568 m!1407633))

(assert (=> b!1524568 m!1407625))

(declare-fun m!1407635 () Bool)

(assert (=> b!1524568 m!1407635))

(assert (=> b!1524482 d!159363))

(declare-fun d!159371 () Bool)

(assert (=> d!159371 (= (validKeyInArray!0 (select (arr!48942 a!2804) i!961)) (and (not (= (select (arr!48942 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48942 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1524477 d!159371))

(declare-fun d!159373 () Bool)

(declare-fun res!1043205 () Bool)

(declare-fun e!849882 () Bool)

(assert (=> d!159373 (=> res!1043205 e!849882)))

(assert (=> d!159373 (= res!1043205 (bvsge #b00000000000000000000000000000000 (size!49492 a!2804)))))

(assert (=> d!159373 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35422) e!849882)))

(declare-fun b!1524598 () Bool)

(declare-fun e!849883 () Bool)

(declare-fun contains!9990 (List!35425 (_ BitVec 64)) Bool)

(assert (=> b!1524598 (= e!849883 (contains!9990 Nil!35422 (select (arr!48942 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1524599 () Bool)

(declare-fun e!849881 () Bool)

(declare-fun call!68433 () Bool)

(assert (=> b!1524599 (= e!849881 call!68433)))

(declare-fun b!1524600 () Bool)

(declare-fun e!849880 () Bool)

(assert (=> b!1524600 (= e!849880 e!849881)))

(declare-fun c!140246 () Bool)

(assert (=> b!1524600 (= c!140246 (validKeyInArray!0 (select (arr!48942 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68430 () Bool)

(assert (=> bm!68430 (= call!68433 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140246 (Cons!35421 (select (arr!48942 a!2804) #b00000000000000000000000000000000) Nil!35422) Nil!35422)))))

(declare-fun b!1524601 () Bool)

(assert (=> b!1524601 (= e!849882 e!849880)))

(declare-fun res!1043206 () Bool)

(assert (=> b!1524601 (=> (not res!1043206) (not e!849880))))

(assert (=> b!1524601 (= res!1043206 (not e!849883))))

(declare-fun res!1043207 () Bool)

(assert (=> b!1524601 (=> (not res!1043207) (not e!849883))))

(assert (=> b!1524601 (= res!1043207 (validKeyInArray!0 (select (arr!48942 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1524602 () Bool)

(assert (=> b!1524602 (= e!849881 call!68433)))

(assert (= (and d!159373 (not res!1043205)) b!1524601))

(assert (= (and b!1524601 res!1043207) b!1524598))

(assert (= (and b!1524601 res!1043206) b!1524600))

(assert (= (and b!1524600 c!140246) b!1524602))

(assert (= (and b!1524600 (not c!140246)) b!1524599))

(assert (= (or b!1524602 b!1524599) bm!68430))

(assert (=> b!1524598 m!1407625))

(assert (=> b!1524598 m!1407625))

(declare-fun m!1407637 () Bool)

(assert (=> b!1524598 m!1407637))

(assert (=> b!1524600 m!1407625))

(assert (=> b!1524600 m!1407625))

(assert (=> b!1524600 m!1407627))

(assert (=> bm!68430 m!1407625))

(declare-fun m!1407639 () Bool)

(assert (=> bm!68430 m!1407639))

(assert (=> b!1524601 m!1407625))

(assert (=> b!1524601 m!1407625))

(assert (=> b!1524601 m!1407627))

(assert (=> b!1524478 d!159373))

(declare-fun b!1524660 () Bool)

(declare-fun e!849913 () SeekEntryResult!13107)

(assert (=> b!1524660 (= e!849913 Undefined!13107)))

(declare-fun d!159375 () Bool)

(declare-fun lt!660401 () SeekEntryResult!13107)

(assert (=> d!159375 (and (or ((_ is MissingVacant!13107) lt!660401) (not ((_ is Found!13107) lt!660401)) (and (bvsge (index!54824 lt!660401) #b00000000000000000000000000000000) (bvslt (index!54824 lt!660401) (size!49492 a!2804)))) (not ((_ is MissingVacant!13107) lt!660401)) (or (not ((_ is Found!13107) lt!660401)) (= (select (arr!48942 a!2804) (index!54824 lt!660401)) (select (arr!48942 a!2804) j!70))))))

(assert (=> d!159375 (= lt!660401 e!849913)))

(declare-fun c!140276 () Bool)

(declare-fun lt!660403 () SeekEntryResult!13107)

(assert (=> d!159375 (= c!140276 (and ((_ is Intermediate!13107) lt!660403) (undefined!13919 lt!660403)))))

(assert (=> d!159375 (= lt!660403 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48942 a!2804) j!70) mask!2512) (select (arr!48942 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159375 (validMask!0 mask!2512)))

(assert (=> d!159375 (= (seekEntry!0 (select (arr!48942 a!2804) j!70) a!2804 mask!2512) lt!660401)))

(declare-fun b!1524661 () Bool)

(declare-fun c!140275 () Bool)

(declare-fun lt!660404 () (_ BitVec 64))

(assert (=> b!1524661 (= c!140275 (= lt!660404 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849915 () SeekEntryResult!13107)

(declare-fun e!849914 () SeekEntryResult!13107)

(assert (=> b!1524661 (= e!849915 e!849914)))

(declare-fun b!1524662 () Bool)

(assert (=> b!1524662 (= e!849913 e!849915)))

(assert (=> b!1524662 (= lt!660404 (select (arr!48942 a!2804) (index!54825 lt!660403)))))

(declare-fun c!140274 () Bool)

(assert (=> b!1524662 (= c!140274 (= lt!660404 (select (arr!48942 a!2804) j!70)))))

(declare-fun b!1524663 () Bool)

(assert (=> b!1524663 (= e!849914 (MissingZero!13107 (index!54825 lt!660403)))))

(declare-fun b!1524664 () Bool)

(declare-fun lt!660402 () SeekEntryResult!13107)

(assert (=> b!1524664 (= e!849914 (ite ((_ is MissingVacant!13107) lt!660402) (MissingZero!13107 (index!54826 lt!660402)) lt!660402))))

(assert (=> b!1524664 (= lt!660402 (seekKeyOrZeroReturnVacant!0 (x!136511 lt!660403) (index!54825 lt!660403) (index!54825 lt!660403) (select (arr!48942 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524665 () Bool)

(assert (=> b!1524665 (= e!849915 (Found!13107 (index!54825 lt!660403)))))

(assert (= (and d!159375 c!140276) b!1524660))

(assert (= (and d!159375 (not c!140276)) b!1524662))

(assert (= (and b!1524662 c!140274) b!1524665))

(assert (= (and b!1524662 (not c!140274)) b!1524661))

(assert (= (and b!1524661 c!140275) b!1524663))

(assert (= (and b!1524661 (not c!140275)) b!1524664))

(declare-fun m!1407665 () Bool)

(assert (=> d!159375 m!1407665))

(assert (=> d!159375 m!1407527))

(assert (=> d!159375 m!1407551))

(assert (=> d!159375 m!1407551))

(assert (=> d!159375 m!1407527))

(assert (=> d!159375 m!1407553))

(assert (=> d!159375 m!1407531))

(declare-fun m!1407667 () Bool)

(assert (=> b!1524662 m!1407667))

(assert (=> b!1524664 m!1407527))

(declare-fun m!1407669 () Bool)

(assert (=> b!1524664 m!1407669))

(assert (=> b!1524483 d!159375))

(declare-fun b!1524726 () Bool)

(declare-fun e!849948 () SeekEntryResult!13107)

(declare-fun lt!660432 () SeekEntryResult!13107)

(assert (=> b!1524726 (= e!849948 (MissingZero!13107 (index!54825 lt!660432)))))

(declare-fun b!1524727 () Bool)

(declare-fun c!140308 () Bool)

(declare-fun lt!660430 () (_ BitVec 64))

(assert (=> b!1524727 (= c!140308 (= lt!660430 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849947 () SeekEntryResult!13107)

(assert (=> b!1524727 (= e!849947 e!849948)))

(declare-fun b!1524728 () Bool)

(declare-fun e!849946 () SeekEntryResult!13107)

(assert (=> b!1524728 (= e!849946 e!849947)))

(assert (=> b!1524728 (= lt!660430 (select (arr!48942 a!2804) (index!54825 lt!660432)))))

(declare-fun c!140307 () Bool)

(assert (=> b!1524728 (= c!140307 (= lt!660430 (select (arr!48942 a!2804) j!70)))))

(declare-fun d!159389 () Bool)

(declare-fun lt!660431 () SeekEntryResult!13107)

(assert (=> d!159389 (and (or ((_ is Undefined!13107) lt!660431) (not ((_ is Found!13107) lt!660431)) (and (bvsge (index!54824 lt!660431) #b00000000000000000000000000000000) (bvslt (index!54824 lt!660431) (size!49492 a!2804)))) (or ((_ is Undefined!13107) lt!660431) ((_ is Found!13107) lt!660431) (not ((_ is MissingZero!13107) lt!660431)) (and (bvsge (index!54823 lt!660431) #b00000000000000000000000000000000) (bvslt (index!54823 lt!660431) (size!49492 a!2804)))) (or ((_ is Undefined!13107) lt!660431) ((_ is Found!13107) lt!660431) ((_ is MissingZero!13107) lt!660431) (not ((_ is MissingVacant!13107) lt!660431)) (and (bvsge (index!54826 lt!660431) #b00000000000000000000000000000000) (bvslt (index!54826 lt!660431) (size!49492 a!2804)))) (or ((_ is Undefined!13107) lt!660431) (ite ((_ is Found!13107) lt!660431) (= (select (arr!48942 a!2804) (index!54824 lt!660431)) (select (arr!48942 a!2804) j!70)) (ite ((_ is MissingZero!13107) lt!660431) (= (select (arr!48942 a!2804) (index!54823 lt!660431)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13107) lt!660431) (= (select (arr!48942 a!2804) (index!54826 lt!660431)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!159389 (= lt!660431 e!849946)))

(declare-fun c!140309 () Bool)

(assert (=> d!159389 (= c!140309 (and ((_ is Intermediate!13107) lt!660432) (undefined!13919 lt!660432)))))

(assert (=> d!159389 (= lt!660432 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48942 a!2804) j!70) mask!2512) (select (arr!48942 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159389 (validMask!0 mask!2512)))

(assert (=> d!159389 (= (seekEntryOrOpen!0 (select (arr!48942 a!2804) j!70) a!2804 mask!2512) lt!660431)))

(declare-fun b!1524729 () Bool)

(assert (=> b!1524729 (= e!849946 Undefined!13107)))

(declare-fun b!1524730 () Bool)

(assert (=> b!1524730 (= e!849947 (Found!13107 (index!54825 lt!660432)))))

(declare-fun b!1524731 () Bool)

(assert (=> b!1524731 (= e!849948 (seekKeyOrZeroReturnVacant!0 (x!136511 lt!660432) (index!54825 lt!660432) (index!54825 lt!660432) (select (arr!48942 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!159389 c!140309) b!1524729))

(assert (= (and d!159389 (not c!140309)) b!1524728))

(assert (= (and b!1524728 c!140307) b!1524730))

(assert (= (and b!1524728 (not c!140307)) b!1524727))

(assert (= (and b!1524727 c!140308) b!1524726))

(assert (= (and b!1524727 (not c!140308)) b!1524731))

(declare-fun m!1407689 () Bool)

(assert (=> b!1524728 m!1407689))

(assert (=> d!159389 m!1407527))

(assert (=> d!159389 m!1407551))

(declare-fun m!1407691 () Bool)

(assert (=> d!159389 m!1407691))

(declare-fun m!1407693 () Bool)

(assert (=> d!159389 m!1407693))

(assert (=> d!159389 m!1407531))

(assert (=> d!159389 m!1407551))

(assert (=> d!159389 m!1407527))

(assert (=> d!159389 m!1407553))

(declare-fun m!1407695 () Bool)

(assert (=> d!159389 m!1407695))

(assert (=> b!1524731 m!1407527))

(declare-fun m!1407697 () Bool)

(assert (=> b!1524731 m!1407697))

(assert (=> b!1524484 d!159389))

(declare-fun lt!660465 () SeekEntryResult!13107)

(declare-fun d!159395 () Bool)

(assert (=> d!159395 (and (or ((_ is Undefined!13107) lt!660465) (not ((_ is Found!13107) lt!660465)) (and (bvsge (index!54824 lt!660465) #b00000000000000000000000000000000) (bvslt (index!54824 lt!660465) (size!49492 a!2804)))) (or ((_ is Undefined!13107) lt!660465) ((_ is Found!13107) lt!660465) (not ((_ is MissingVacant!13107) lt!660465)) (not (= (index!54826 lt!660465) index!487)) (and (bvsge (index!54826 lt!660465) #b00000000000000000000000000000000) (bvslt (index!54826 lt!660465) (size!49492 a!2804)))) (or ((_ is Undefined!13107) lt!660465) (ite ((_ is Found!13107) lt!660465) (= (select (arr!48942 a!2804) (index!54824 lt!660465)) (select (arr!48942 a!2804) j!70)) (and ((_ is MissingVacant!13107) lt!660465) (= (index!54826 lt!660465) index!487) (= (select (arr!48942 a!2804) (index!54826 lt!660465)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!850002 () SeekEntryResult!13107)

(assert (=> d!159395 (= lt!660465 e!850002)))

(declare-fun c!140340 () Bool)

(assert (=> d!159395 (= c!140340 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!660464 () (_ BitVec 64))

(assert (=> d!159395 (= lt!660464 (select (arr!48942 a!2804) index!487))))

(assert (=> d!159395 (validMask!0 mask!2512)))

(assert (=> d!159395 (= (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48942 a!2804) j!70) a!2804 mask!2512) lt!660465)))

(declare-fun b!1524817 () Bool)

(declare-fun e!850004 () SeekEntryResult!13107)

(assert (=> b!1524817 (= e!850002 e!850004)))

(declare-fun c!140339 () Bool)

(assert (=> b!1524817 (= c!140339 (= lt!660464 (select (arr!48942 a!2804) j!70)))))

(declare-fun b!1524818 () Bool)

(declare-fun c!140338 () Bool)

(assert (=> b!1524818 (= c!140338 (= lt!660464 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!850003 () SeekEntryResult!13107)

(assert (=> b!1524818 (= e!850004 e!850003)))

(declare-fun b!1524819 () Bool)

(assert (=> b!1524819 (= e!850003 (seekKeyOrZeroReturnVacant!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) index!487 (select (arr!48942 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524820 () Bool)

(assert (=> b!1524820 (= e!850004 (Found!13107 index!487))))

(declare-fun b!1524821 () Bool)

(assert (=> b!1524821 (= e!850002 Undefined!13107)))

(declare-fun b!1524822 () Bool)

(assert (=> b!1524822 (= e!850003 (MissingVacant!13107 index!487))))

(assert (= (and d!159395 c!140340) b!1524821))

(assert (= (and d!159395 (not c!140340)) b!1524817))

(assert (= (and b!1524817 c!140339) b!1524820))

(assert (= (and b!1524817 (not c!140339)) b!1524818))

(assert (= (and b!1524818 c!140338) b!1524822))

(assert (= (and b!1524818 (not c!140338)) b!1524819))

(declare-fun m!1407743 () Bool)

(assert (=> d!159395 m!1407743))

(declare-fun m!1407745 () Bool)

(assert (=> d!159395 m!1407745))

(assert (=> d!159395 m!1407539))

(assert (=> d!159395 m!1407531))

(declare-fun m!1407747 () Bool)

(assert (=> b!1524819 m!1407747))

(assert (=> b!1524819 m!1407747))

(assert (=> b!1524819 m!1407527))

(declare-fun m!1407749 () Bool)

(assert (=> b!1524819 m!1407749))

(assert (=> b!1524484 d!159395))

(declare-fun b!1524832 () Bool)

(declare-fun e!850012 () SeekEntryResult!13107)

(assert (=> b!1524832 (= e!850012 (Intermediate!13107 false index!487 x!534))))

(declare-fun b!1524833 () Bool)

(declare-fun lt!660472 () SeekEntryResult!13107)

(assert (=> b!1524833 (and (bvsge (index!54825 lt!660472) #b00000000000000000000000000000000) (bvslt (index!54825 lt!660472) (size!49492 a!2804)))))

(declare-fun res!1043246 () Bool)

(assert (=> b!1524833 (= res!1043246 (= (select (arr!48942 a!2804) (index!54825 lt!660472)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!850010 () Bool)

(assert (=> b!1524833 (=> res!1043246 e!850010)))

(declare-fun b!1524834 () Bool)

(assert (=> b!1524834 (and (bvsge (index!54825 lt!660472) #b00000000000000000000000000000000) (bvslt (index!54825 lt!660472) (size!49492 a!2804)))))

(declare-fun res!1043245 () Bool)

(assert (=> b!1524834 (= res!1043245 (= (select (arr!48942 a!2804) (index!54825 lt!660472)) (select (arr!48942 a!2804) j!70)))))

(assert (=> b!1524834 (=> res!1043245 e!850010)))

(declare-fun e!850013 () Bool)

(assert (=> b!1524834 (= e!850013 e!850010)))

(declare-fun d!159411 () Bool)

(declare-fun e!850011 () Bool)

(assert (=> d!159411 e!850011))

(declare-fun c!140344 () Bool)

(assert (=> d!159411 (= c!140344 (and ((_ is Intermediate!13107) lt!660472) (undefined!13919 lt!660472)))))

(declare-fun e!850014 () SeekEntryResult!13107)

(assert (=> d!159411 (= lt!660472 e!850014)))

(declare-fun c!140346 () Bool)

(assert (=> d!159411 (= c!140346 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!660473 () (_ BitVec 64))

(assert (=> d!159411 (= lt!660473 (select (arr!48942 a!2804) index!487))))

(assert (=> d!159411 (validMask!0 mask!2512)))

(assert (=> d!159411 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48942 a!2804) j!70) a!2804 mask!2512) lt!660472)))

(declare-fun b!1524835 () Bool)

(assert (=> b!1524835 (= e!850011 e!850013)))

(declare-fun res!1043247 () Bool)

(assert (=> b!1524835 (= res!1043247 (and ((_ is Intermediate!13107) lt!660472) (not (undefined!13919 lt!660472)) (bvslt (x!136511 lt!660472) #b01111111111111111111111111111110) (bvsge (x!136511 lt!660472) #b00000000000000000000000000000000) (bvsge (x!136511 lt!660472) x!534)))))

(assert (=> b!1524835 (=> (not res!1043247) (not e!850013))))

(declare-fun b!1524836 () Bool)

(assert (=> b!1524836 (and (bvsge (index!54825 lt!660472) #b00000000000000000000000000000000) (bvslt (index!54825 lt!660472) (size!49492 a!2804)))))

(assert (=> b!1524836 (= e!850010 (= (select (arr!48942 a!2804) (index!54825 lt!660472)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1524837 () Bool)

(assert (=> b!1524837 (= e!850012 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48942 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524838 () Bool)

(assert (=> b!1524838 (= e!850014 e!850012)))

(declare-fun c!140345 () Bool)

(assert (=> b!1524838 (= c!140345 (or (= lt!660473 (select (arr!48942 a!2804) j!70)) (= (bvadd lt!660473 lt!660473) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1524839 () Bool)

(assert (=> b!1524839 (= e!850011 (bvsge (x!136511 lt!660472) #b01111111111111111111111111111110))))

(declare-fun b!1524840 () Bool)

(assert (=> b!1524840 (= e!850014 (Intermediate!13107 true index!487 x!534))))

(assert (= (and d!159411 c!140346) b!1524840))

(assert (= (and d!159411 (not c!140346)) b!1524838))

(assert (= (and b!1524838 c!140345) b!1524832))

(assert (= (and b!1524838 (not c!140345)) b!1524837))

(assert (= (and d!159411 c!140344) b!1524839))

(assert (= (and d!159411 (not c!140344)) b!1524835))

(assert (= (and b!1524835 res!1043247) b!1524834))

(assert (= (and b!1524834 (not res!1043245)) b!1524833))

(assert (= (and b!1524833 (not res!1043246)) b!1524836))

(declare-fun m!1407759 () Bool)

(assert (=> b!1524834 m!1407759))

(assert (=> d!159411 m!1407539))

(assert (=> d!159411 m!1407531))

(assert (=> b!1524836 m!1407759))

(assert (=> b!1524833 m!1407759))

(assert (=> b!1524837 m!1407747))

(assert (=> b!1524837 m!1407747))

(assert (=> b!1524837 m!1407527))

(declare-fun m!1407761 () Bool)

(assert (=> b!1524837 m!1407761))

(assert (=> b!1524474 d!159411))

(declare-fun d!159419 () Bool)

(assert (=> d!159419 (= (validKeyInArray!0 (select (arr!48942 a!2804) j!70)) (and (not (= (select (arr!48942 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48942 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1524479 d!159419))

(declare-fun d!159421 () Bool)

(declare-fun res!1043251 () Bool)

(declare-fun e!850020 () Bool)

(assert (=> d!159421 (=> res!1043251 e!850020)))

(assert (=> d!159421 (= res!1043251 (bvsge j!70 (size!49492 a!2804)))))

(assert (=> d!159421 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!850020)))

(declare-fun b!1524850 () Bool)

(declare-fun e!850022 () Bool)

(assert (=> b!1524850 (= e!850020 e!850022)))

(declare-fun c!140350 () Bool)

(assert (=> b!1524850 (= c!140350 (validKeyInArray!0 (select (arr!48942 a!2804) j!70)))))

(declare-fun call!68441 () Bool)

(declare-fun bm!68438 () Bool)

(assert (=> bm!68438 (= call!68441 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1524851 () Bool)

(declare-fun e!850021 () Bool)

(assert (=> b!1524851 (= e!850021 call!68441)))

(declare-fun b!1524852 () Bool)

(assert (=> b!1524852 (= e!850022 e!850021)))

(declare-fun lt!660479 () (_ BitVec 64))

(assert (=> b!1524852 (= lt!660479 (select (arr!48942 a!2804) j!70))))

(declare-fun lt!660480 () Unit!50998)

(assert (=> b!1524852 (= lt!660480 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660479 j!70))))

(assert (=> b!1524852 (arrayContainsKey!0 a!2804 lt!660479 #b00000000000000000000000000000000)))

(declare-fun lt!660478 () Unit!50998)

(assert (=> b!1524852 (= lt!660478 lt!660480)))

(declare-fun res!1043252 () Bool)

(assert (=> b!1524852 (= res!1043252 (= (seekEntryOrOpen!0 (select (arr!48942 a!2804) j!70) a!2804 mask!2512) (Found!13107 j!70)))))

(assert (=> b!1524852 (=> (not res!1043252) (not e!850021))))

(declare-fun b!1524853 () Bool)

(assert (=> b!1524853 (= e!850022 call!68441)))

(assert (= (and d!159421 (not res!1043251)) b!1524850))

(assert (= (and b!1524850 c!140350) b!1524852))

(assert (= (and b!1524850 (not c!140350)) b!1524853))

(assert (= (and b!1524852 res!1043252) b!1524851))

(assert (= (or b!1524851 b!1524853) bm!68438))

(assert (=> b!1524850 m!1407527))

(assert (=> b!1524850 m!1407527))

(assert (=> b!1524850 m!1407545))

(declare-fun m!1407766 () Bool)

(assert (=> bm!68438 m!1407766))

(assert (=> b!1524852 m!1407527))

(declare-fun m!1407769 () Bool)

(assert (=> b!1524852 m!1407769))

(declare-fun m!1407771 () Bool)

(assert (=> b!1524852 m!1407771))

(assert (=> b!1524852 m!1407527))

(assert (=> b!1524852 m!1407559))

(assert (=> b!1524480 d!159421))

(declare-fun d!159423 () Bool)

(assert (=> d!159423 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!660485 () Unit!50998)

(declare-fun choose!38 (array!101425 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50998)

(assert (=> d!159423 (= lt!660485 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159423 (validMask!0 mask!2512)))

(assert (=> d!159423 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!660485)))

(declare-fun bs!43757 () Bool)

(assert (= bs!43757 d!159423))

(assert (=> bs!43757 m!1407543))

(declare-fun m!1407777 () Bool)

(assert (=> bs!43757 m!1407777))

(assert (=> bs!43757 m!1407531))

(assert (=> b!1524480 d!159423))

(declare-fun d!159429 () Bool)

(assert (=> d!159429 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129886 d!159429))

(declare-fun d!159431 () Bool)

(assert (=> d!159431 (= (array_inv!37970 a!2804) (bvsge (size!49492 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129886 d!159431))

(check-sat (not b!1524554) (not d!159411) (not b!1524598) (not bm!68427) (not b!1524600) (not b!1524850) (not d!159395) (not b!1524731) (not bm!68430) (not b!1524601) (not d!159353) (not d!159423) (not b!1524545) (not d!159375) (not b!1524852) (not b!1524664) (not b!1524566) (not d!159359) (not b!1524568) (not d!159389) (not b!1524837) (not bm!68438) (not b!1524819))
(check-sat)
