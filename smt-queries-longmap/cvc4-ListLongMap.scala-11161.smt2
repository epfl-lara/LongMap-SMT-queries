; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130452 () Bool)

(assert start!130452)

(declare-fun b!1531112 () Bool)

(declare-fun res!1048459 () Bool)

(declare-fun e!853148 () Bool)

(assert (=> b!1531112 (=> (not res!1048459) (not e!853148))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((array!101688 0))(
  ( (array!101689 (arr!49066 (Array (_ BitVec 32) (_ BitVec 64))) (size!49616 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101688)

(assert (=> b!1531112 (= res!1048459 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49616 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49616 a!2804))))))

(declare-fun b!1531113 () Bool)

(declare-fun res!1048458 () Bool)

(assert (=> b!1531113 (=> (not res!1048458) (not e!853148))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531113 (= res!1048458 (validKeyInArray!0 (select (arr!49066 a!2804) j!70)))))

(declare-fun b!1531114 () Bool)

(declare-fun res!1048462 () Bool)

(declare-fun e!853149 () Bool)

(assert (=> b!1531114 (=> (not res!1048462) (not e!853149))))

(declare-datatypes ((SeekEntryResult!13231 0))(
  ( (MissingZero!13231 (index!55319 (_ BitVec 32))) (Found!13231 (index!55320 (_ BitVec 32))) (Intermediate!13231 (undefined!14043 Bool) (index!55321 (_ BitVec 32)) (x!137008 (_ BitVec 32))) (Undefined!13231) (MissingVacant!13231 (index!55322 (_ BitVec 32))) )
))
(declare-fun lt!663090 () SeekEntryResult!13231)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101688 (_ BitVec 32)) SeekEntryResult!13231)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531114 (= res!1048462 (= lt!663090 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101689 (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49616 a!2804)) mask!2512)))))

(declare-fun b!1531115 () Bool)

(declare-fun res!1048460 () Bool)

(assert (=> b!1531115 (=> (not res!1048460) (not e!853148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101688 (_ BitVec 32)) Bool)

(assert (=> b!1531115 (= res!1048460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun e!853146 () Bool)

(declare-fun lt!663091 () SeekEntryResult!13231)

(declare-fun lt!663088 () (_ BitVec 32))

(declare-fun b!1531116 () Bool)

(assert (=> b!1531116 (= e!853146 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663088 (select (arr!49066 a!2804) j!70) a!2804 mask!2512) lt!663091))))

(declare-fun e!853150 () Bool)

(declare-fun b!1531117 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101688 (_ BitVec 32)) SeekEntryResult!13231)

(assert (=> b!1531117 (= e!853150 (= (seekEntry!0 (select (arr!49066 a!2804) j!70) a!2804 mask!2512) (Found!13231 j!70)))))

(declare-fun b!1531118 () Bool)

(declare-fun res!1048454 () Bool)

(assert (=> b!1531118 (=> (not res!1048454) (not e!853149))))

(assert (=> b!1531118 (= res!1048454 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49066 a!2804) j!70) a!2804 mask!2512) lt!663091))))

(declare-fun b!1531119 () Bool)

(declare-fun e!853145 () Bool)

(assert (=> b!1531119 (= e!853145 e!853146)))

(declare-fun res!1048457 () Bool)

(assert (=> b!1531119 (=> res!1048457 e!853146)))

(assert (=> b!1531119 (= res!1048457 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663088 #b00000000000000000000000000000000) (bvsge lt!663088 (size!49616 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531119 (= lt!663088 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1531120 () Bool)

(declare-fun res!1048465 () Bool)

(assert (=> b!1531120 (=> (not res!1048465) (not e!853148))))

(declare-datatypes ((List!35549 0))(
  ( (Nil!35546) (Cons!35545 (h!36987 (_ BitVec 64)) (t!50243 List!35549)) )
))
(declare-fun arrayNoDuplicates!0 (array!101688 (_ BitVec 32) List!35549) Bool)

(assert (=> b!1531120 (= res!1048465 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35546))))

(declare-fun b!1531121 () Bool)

(assert (=> b!1531121 (= e!853148 e!853149)))

(declare-fun res!1048455 () Bool)

(assert (=> b!1531121 (=> (not res!1048455) (not e!853149))))

(assert (=> b!1531121 (= res!1048455 (= lt!663090 lt!663091))))

(assert (=> b!1531121 (= lt!663091 (Intermediate!13231 false resIndex!21 resX!21))))

(assert (=> b!1531121 (= lt!663090 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49066 a!2804) j!70) mask!2512) (select (arr!49066 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531122 () Bool)

(declare-fun res!1048464 () Bool)

(assert (=> b!1531122 (=> (not res!1048464) (not e!853148))))

(assert (=> b!1531122 (= res!1048464 (and (= (size!49616 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49616 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49616 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1048463 () Bool)

(assert (=> start!130452 (=> (not res!1048463) (not e!853148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130452 (= res!1048463 (validMask!0 mask!2512))))

(assert (=> start!130452 e!853148))

(assert (=> start!130452 true))

(declare-fun array_inv!38094 (array!101688) Bool)

(assert (=> start!130452 (array_inv!38094 a!2804)))

(declare-fun b!1531123 () Bool)

(assert (=> b!1531123 (= e!853149 (not e!853145))))

(declare-fun res!1048453 () Bool)

(assert (=> b!1531123 (=> res!1048453 e!853145)))

(assert (=> b!1531123 (= res!1048453 (or (not (= (select (arr!49066 a!2804) j!70) (select (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1531123 e!853150))

(declare-fun res!1048456 () Bool)

(assert (=> b!1531123 (=> (not res!1048456) (not e!853150))))

(assert (=> b!1531123 (= res!1048456 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51246 0))(
  ( (Unit!51247) )
))
(declare-fun lt!663089 () Unit!51246)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101688 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51246)

(assert (=> b!1531123 (= lt!663089 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531124 () Bool)

(declare-fun res!1048461 () Bool)

(assert (=> b!1531124 (=> (not res!1048461) (not e!853148))))

(assert (=> b!1531124 (= res!1048461 (validKeyInArray!0 (select (arr!49066 a!2804) i!961)))))

(assert (= (and start!130452 res!1048463) b!1531122))

(assert (= (and b!1531122 res!1048464) b!1531124))

(assert (= (and b!1531124 res!1048461) b!1531113))

(assert (= (and b!1531113 res!1048458) b!1531115))

(assert (= (and b!1531115 res!1048460) b!1531120))

(assert (= (and b!1531120 res!1048465) b!1531112))

(assert (= (and b!1531112 res!1048459) b!1531121))

(assert (= (and b!1531121 res!1048455) b!1531118))

(assert (= (and b!1531118 res!1048454) b!1531114))

(assert (= (and b!1531114 res!1048462) b!1531123))

(assert (= (and b!1531123 res!1048456) b!1531117))

(assert (= (and b!1531123 (not res!1048453)) b!1531119))

(assert (= (and b!1531119 (not res!1048457)) b!1531116))

(declare-fun m!1413887 () Bool)

(assert (=> b!1531117 m!1413887))

(assert (=> b!1531117 m!1413887))

(declare-fun m!1413889 () Bool)

(assert (=> b!1531117 m!1413889))

(declare-fun m!1413891 () Bool)

(assert (=> b!1531119 m!1413891))

(declare-fun m!1413893 () Bool)

(assert (=> b!1531124 m!1413893))

(assert (=> b!1531124 m!1413893))

(declare-fun m!1413895 () Bool)

(assert (=> b!1531124 m!1413895))

(assert (=> b!1531118 m!1413887))

(assert (=> b!1531118 m!1413887))

(declare-fun m!1413897 () Bool)

(assert (=> b!1531118 m!1413897))

(assert (=> b!1531121 m!1413887))

(assert (=> b!1531121 m!1413887))

(declare-fun m!1413899 () Bool)

(assert (=> b!1531121 m!1413899))

(assert (=> b!1531121 m!1413899))

(assert (=> b!1531121 m!1413887))

(declare-fun m!1413901 () Bool)

(assert (=> b!1531121 m!1413901))

(assert (=> b!1531113 m!1413887))

(assert (=> b!1531113 m!1413887))

(declare-fun m!1413903 () Bool)

(assert (=> b!1531113 m!1413903))

(assert (=> b!1531116 m!1413887))

(assert (=> b!1531116 m!1413887))

(declare-fun m!1413905 () Bool)

(assert (=> b!1531116 m!1413905))

(declare-fun m!1413907 () Bool)

(assert (=> b!1531115 m!1413907))

(assert (=> b!1531123 m!1413887))

(declare-fun m!1413909 () Bool)

(assert (=> b!1531123 m!1413909))

(declare-fun m!1413911 () Bool)

(assert (=> b!1531123 m!1413911))

(declare-fun m!1413913 () Bool)

(assert (=> b!1531123 m!1413913))

(declare-fun m!1413915 () Bool)

(assert (=> b!1531123 m!1413915))

(assert (=> b!1531114 m!1413911))

(assert (=> b!1531114 m!1413913))

(assert (=> b!1531114 m!1413913))

(declare-fun m!1413917 () Bool)

(assert (=> b!1531114 m!1413917))

(assert (=> b!1531114 m!1413917))

(assert (=> b!1531114 m!1413913))

(declare-fun m!1413919 () Bool)

(assert (=> b!1531114 m!1413919))

(declare-fun m!1413921 () Bool)

(assert (=> start!130452 m!1413921))

(declare-fun m!1413923 () Bool)

(assert (=> start!130452 m!1413923))

(declare-fun m!1413925 () Bool)

(assert (=> b!1531120 m!1413925))

(push 1)

(assert (not b!1531124))

(assert (not b!1531123))

(assert (not b!1531115))

(assert (not b!1531121))

(assert (not b!1531114))

(assert (not b!1531116))

(assert (not start!130452))

(assert (not b!1531120))

(assert (not b!1531113))

(assert (not b!1531117))

(assert (not b!1531119))

(assert (not b!1531118))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!159935 () Bool)

(declare-fun e!853221 () Bool)

(assert (=> d!159935 e!853221))

(declare-fun c!140924 () Bool)

(declare-fun lt!663138 () SeekEntryResult!13231)

(assert (=> d!159935 (= c!140924 (and (is-Intermediate!13231 lt!663138) (undefined!14043 lt!663138)))))

(declare-fun e!853222 () SeekEntryResult!13231)

(assert (=> d!159935 (= lt!663138 e!853222)))

(declare-fun c!140925 () Bool)

(assert (=> d!159935 (= c!140925 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!663137 () (_ BitVec 64))

(assert (=> d!159935 (= lt!663137 (select (arr!49066 (array!101689 (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49616 a!2804))) (toIndex!0 (select (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!159935 (validMask!0 mask!2512)))

(assert (=> d!159935 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101689 (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49616 a!2804)) mask!2512) lt!663138)))

(declare-fun b!1531240 () Bool)

(declare-fun e!853218 () Bool)

(assert (=> b!1531240 (= e!853221 e!853218)))

(declare-fun res!1048511 () Bool)

(assert (=> b!1531240 (= res!1048511 (and (is-Intermediate!13231 lt!663138) (not (undefined!14043 lt!663138)) (bvslt (x!137008 lt!663138) #b01111111111111111111111111111110) (bvsge (x!137008 lt!663138) #b00000000000000000000000000000000) (bvsge (x!137008 lt!663138) #b00000000000000000000000000000000)))))

(assert (=> b!1531240 (=> (not res!1048511) (not e!853218))))

(declare-fun b!1531241 () Bool)

(declare-fun e!853220 () SeekEntryResult!13231)

(assert (=> b!1531241 (= e!853222 e!853220)))

(declare-fun c!140923 () Bool)

(assert (=> b!1531241 (= c!140923 (or (= lt!663137 (select (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!663137 lt!663137) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1531242 () Bool)

(assert (=> b!1531242 (= e!853221 (bvsge (x!137008 lt!663138) #b01111111111111111111111111111110))))

(declare-fun b!1531243 () Bool)

(assert (=> b!1531243 (and (bvsge (index!55321 lt!663138) #b00000000000000000000000000000000) (bvslt (index!55321 lt!663138) (size!49616 (array!101689 (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49616 a!2804)))))))

(declare-fun res!1048510 () Bool)

(assert (=> b!1531243 (= res!1048510 (= (select (arr!49066 (array!101689 (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49616 a!2804))) (index!55321 lt!663138)) (select (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(declare-fun e!853219 () Bool)

(assert (=> b!1531243 (=> res!1048510 e!853219)))

(assert (=> b!1531243 (= e!853218 e!853219)))

(declare-fun b!1531244 () Bool)

(assert (=> b!1531244 (and (bvsge (index!55321 lt!663138) #b00000000000000000000000000000000) (bvslt (index!55321 lt!663138) (size!49616 (array!101689 (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49616 a!2804)))))))

(declare-fun res!1048509 () Bool)

(assert (=> b!1531244 (= res!1048509 (= (select (arr!49066 (array!101689 (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49616 a!2804))) (index!55321 lt!663138)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1531244 (=> res!1048509 e!853219)))

(declare-fun b!1531245 () Bool)

(assert (=> b!1531245 (and (bvsge (index!55321 lt!663138) #b00000000000000000000000000000000) (bvslt (index!55321 lt!663138) (size!49616 (array!101689 (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49616 a!2804)))))))

(assert (=> b!1531245 (= e!853219 (= (select (arr!49066 (array!101689 (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49616 a!2804))) (index!55321 lt!663138)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1531246 () Bool)

(assert (=> b!1531246 (= e!853220 (Intermediate!13231 false (toIndex!0 (select (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1531247 () Bool)

(assert (=> b!1531247 (= e!853220 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101689 (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49616 a!2804)) mask!2512))))

(declare-fun b!1531248 () Bool)

(assert (=> b!1531248 (= e!853222 (Intermediate!13231 true (toIndex!0 (select (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(assert (= (and d!159935 c!140925) b!1531248))

(assert (= (and d!159935 (not c!140925)) b!1531241))

(assert (= (and b!1531241 c!140923) b!1531246))

(assert (= (and b!1531241 (not c!140923)) b!1531247))

(assert (= (and d!159935 c!140924) b!1531242))

(assert (= (and d!159935 (not c!140924)) b!1531240))

(assert (= (and b!1531240 res!1048511) b!1531243))

(assert (= (and b!1531243 (not res!1048510)) b!1531244))

(assert (= (and b!1531244 (not res!1048509)) b!1531245))

(declare-fun m!1413987 () Bool)

(assert (=> b!1531245 m!1413987))

(assert (=> d!159935 m!1413917))

(declare-fun m!1413989 () Bool)

(assert (=> d!159935 m!1413989))

(assert (=> d!159935 m!1413921))

(assert (=> b!1531244 m!1413987))

(assert (=> b!1531247 m!1413917))

(declare-fun m!1413991 () Bool)

(assert (=> b!1531247 m!1413991))

(assert (=> b!1531247 m!1413991))

(assert (=> b!1531247 m!1413913))

(declare-fun m!1413993 () Bool)

(assert (=> b!1531247 m!1413993))

(assert (=> b!1531243 m!1413987))

(assert (=> b!1531114 d!159935))

(declare-fun d!159961 () Bool)

(declare-fun lt!663158 () (_ BitVec 32))

(declare-fun lt!663157 () (_ BitVec 32))

(assert (=> d!159961 (= lt!663158 (bvmul (bvxor lt!663157 (bvlshr lt!663157 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159961 (= lt!663157 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159961 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1048512 (let ((h!36990 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!137014 (bvmul (bvxor h!36990 (bvlshr h!36990 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!137014 (bvlshr x!137014 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1048512 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1048512 #b00000000000000000000000000000000))))))

(assert (=> d!159961 (= (toIndex!0 (select (store (arr!49066 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!663158 (bvlshr lt!663158 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1531114 d!159961))

(declare-fun b!1531305 () Bool)

(declare-fun e!853264 () Bool)

(declare-fun call!68545 () Bool)

(assert (=> b!1531305 (= e!853264 call!68545)))

(declare-fun b!1531306 () Bool)

(declare-fun e!853262 () Bool)

(assert (=> b!1531306 (= e!853262 call!68545)))

(declare-fun bm!68542 () Bool)

(assert (=> bm!68542 (= call!68545 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1531307 () Bool)

(declare-fun e!853263 () Bool)

(assert (=> b!1531307 (= e!853263 e!853264)))

(declare-fun c!140943 () Bool)

(assert (=> b!1531307 (= c!140943 (validKeyInArray!0 (select (arr!49066 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!159965 () Bool)

(declare-fun res!1048535 () Bool)

(assert (=> d!159965 (=> res!1048535 e!853263)))

(assert (=> d!159965 (= res!1048535 (bvsge #b00000000000000000000000000000000 (size!49616 a!2804)))))

(assert (=> d!159965 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!853263)))

(declare-fun b!1531308 () Bool)

(assert (=> b!1531308 (= e!853264 e!853262)))

(declare-fun lt!663173 () (_ BitVec 64))

(assert (=> b!1531308 (= lt!663173 (select (arr!49066 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!663172 () Unit!51246)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101688 (_ BitVec 64) (_ BitVec 32)) Unit!51246)

(assert (=> b!1531308 (= lt!663172 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!663173 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101688 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1531308 (arrayContainsKey!0 a!2804 lt!663173 #b00000000000000000000000000000000)))

(declare-fun lt!663174 () Unit!51246)

(assert (=> b!1531308 (= lt!663174 lt!663172)))

(declare-fun res!1048536 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101688 (_ BitVec 32)) SeekEntryResult!13231)

(assert (=> b!1531308 (= res!1048536 (= (seekEntryOrOpen!0 (select (arr!49066 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13231 #b00000000000000000000000000000000)))))

(assert (=> b!1531308 (=> (not res!1048536) (not e!853262))))

(assert (= (and d!159965 (not res!1048535)) b!1531307))

(assert (= (and b!1531307 c!140943) b!1531308))

(assert (= (and b!1531307 (not c!140943)) b!1531305))

(assert (= (and b!1531308 res!1048536) b!1531306))

(assert (= (or b!1531306 b!1531305) bm!68542))

(declare-fun m!1414015 () Bool)

(assert (=> bm!68542 m!1414015))

(declare-fun m!1414017 () Bool)

(assert (=> b!1531307 m!1414017))

(assert (=> b!1531307 m!1414017))

(declare-fun m!1414019 () Bool)

(assert (=> b!1531307 m!1414019))

(assert (=> b!1531308 m!1414017))

(declare-fun m!1414021 () Bool)

(assert (=> b!1531308 m!1414021))

(declare-fun m!1414023 () Bool)

(assert (=> b!1531308 m!1414023))

(assert (=> b!1531308 m!1414017))

(declare-fun m!1414025 () Bool)

(assert (=> b!1531308 m!1414025))

(assert (=> b!1531115 d!159965))

(declare-fun d!159973 () Bool)

(declare-fun e!853268 () Bool)

(assert (=> d!159973 e!853268))

(declare-fun c!140945 () Bool)

(declare-fun lt!663176 () SeekEntryResult!13231)

(assert (=> d!159973 (= c!140945 (and (is-Intermediate!13231 lt!663176) (undefined!14043 lt!663176)))))

(declare-fun e!853269 () SeekEntryResult!13231)

(assert (=> d!159973 (= lt!663176 e!853269)))

(declare-fun c!140946 () Bool)

(assert (=> d!159973 (= c!140946 (bvsge (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110))))

(declare-fun lt!663175 () (_ BitVec 64))

(assert (=> d!159973 (= lt!663175 (select (arr!49066 a!2804) lt!663088))))

(assert (=> d!159973 (validMask!0 mask!2512)))

(assert (=> d!159973 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663088 (select (arr!49066 a!2804) j!70) a!2804 mask!2512) lt!663176)))

(declare-fun b!1531309 () Bool)

(declare-fun e!853265 () Bool)

(assert (=> b!1531309 (= e!853268 e!853265)))

(declare-fun res!1048539 () Bool)

(assert (=> b!1531309 (= res!1048539 (and (is-Intermediate!13231 lt!663176) (not (undefined!14043 lt!663176)) (bvslt (x!137008 lt!663176) #b01111111111111111111111111111110) (bvsge (x!137008 lt!663176) #b00000000000000000000000000000000) (bvsge (x!137008 lt!663176) (bvadd #b00000000000000000000000000000001 x!534))))))

(assert (=> b!1531309 (=> (not res!1048539) (not e!853265))))

(declare-fun b!1531310 () Bool)

(declare-fun e!853267 () SeekEntryResult!13231)

(assert (=> b!1531310 (= e!853269 e!853267)))

(declare-fun c!140944 () Bool)

(assert (=> b!1531310 (= c!140944 (or (= lt!663175 (select (arr!49066 a!2804) j!70)) (= (bvadd lt!663175 lt!663175) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1531311 () Bool)

(assert (=> b!1531311 (= e!853268 (bvsge (x!137008 lt!663176) #b01111111111111111111111111111110))))

(declare-fun b!1531312 () Bool)

(assert (=> b!1531312 (and (bvsge (index!55321 lt!663176) #b00000000000000000000000000000000) (bvslt (index!55321 lt!663176) (size!49616 a!2804)))))

(declare-fun res!1048538 () Bool)

(assert (=> b!1531312 (= res!1048538 (= (select (arr!49066 a!2804) (index!55321 lt!663176)) (select (arr!49066 a!2804) j!70)))))

(declare-fun e!853266 () Bool)

(assert (=> b!1531312 (=> res!1048538 e!853266)))

(assert (=> b!1531312 (= e!853265 e!853266)))

(declare-fun b!1531313 () Bool)

(assert (=> b!1531313 (and (bvsge (index!55321 lt!663176) #b00000000000000000000000000000000) (bvslt (index!55321 lt!663176) (size!49616 a!2804)))))

(declare-fun res!1048537 () Bool)

(assert (=> b!1531313 (= res!1048537 (= (select (arr!49066 a!2804) (index!55321 lt!663176)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1531313 (=> res!1048537 e!853266)))

(declare-fun b!1531314 () Bool)

(assert (=> b!1531314 (and (bvsge (index!55321 lt!663176) #b00000000000000000000000000000000) (bvslt (index!55321 lt!663176) (size!49616 a!2804)))))

(assert (=> b!1531314 (= e!853266 (= (select (arr!49066 a!2804) (index!55321 lt!663176)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1531315 () Bool)

(assert (=> b!1531315 (= e!853267 (Intermediate!13231 false lt!663088 (bvadd #b00000000000000000000000000000001 x!534)))))

(declare-fun b!1531316 () Bool)

(assert (=> b!1531316 (= e!853267 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534 #b00000000000000000000000000000001) (nextIndex!0 lt!663088 (bvadd #b00000000000000000000000000000001 x!534) mask!2512) (select (arr!49066 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531317 () Bool)

(assert (=> b!1531317 (= e!853269 (Intermediate!13231 true lt!663088 (bvadd #b00000000000000000000000000000001 x!534)))))

(assert (= (and d!159973 c!140946) b!1531317))

(assert (= (and d!159973 (not c!140946)) b!1531310))

(assert (= (and b!1531310 c!140944) b!1531315))

(assert (= (and b!1531310 (not c!140944)) b!1531316))

(assert (= (and d!159973 c!140945) b!1531311))

(assert (= (and d!159973 (not c!140945)) b!1531309))

(assert (= (and b!1531309 res!1048539) b!1531312))

(assert (= (and b!1531312 (not res!1048538)) b!1531313))

(assert (= (and b!1531313 (not res!1048537)) b!1531314))

(declare-fun m!1414027 () Bool)

(assert (=> b!1531314 m!1414027))

(declare-fun m!1414029 () Bool)

(assert (=> d!159973 m!1414029))

(assert (=> d!159973 m!1413921))

(assert (=> b!1531313 m!1414027))

(declare-fun m!1414031 () Bool)

(assert (=> b!1531316 m!1414031))

(assert (=> b!1531316 m!1414031))

(assert (=> b!1531316 m!1413887))

(declare-fun m!1414033 () Bool)

(assert (=> b!1531316 m!1414033))

(assert (=> b!1531312 m!1414027))

(assert (=> b!1531116 d!159973))

(declare-fun d!159975 () Bool)

(assert (=> d!159975 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!130452 d!159975))

(declare-fun d!159981 () Bool)

(assert (=> d!159981 (= (array_inv!38094 a!2804) (bvsge (size!49616 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!130452 d!159981))

(declare-fun b!1531326 () Bool)

(declare-fun e!853278 () Bool)

(declare-fun call!68548 () Bool)

(assert (=> b!1531326 (= e!853278 call!68548)))

(declare-fun b!1531327 () Bool)

(declare-fun e!853276 () Bool)

(assert (=> b!1531327 (= e!853276 call!68548)))

(declare-fun bm!68545 () Bool)

(assert (=> bm!68545 (= call!68548 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1531328 () Bool)

(declare-fun e!853277 () Bool)

(assert (=> b!1531328 (= e!853277 e!853278)))

(declare-fun c!140949 () Bool)

(assert (=> b!1531328 (= c!140949 (validKeyInArray!0 (select (arr!49066 a!2804) j!70)))))

(declare-fun d!159983 () Bool)

(declare-fun res!1048544 () Bool)

(assert (=> d!159983 (=> res!1048544 e!853277)))

(assert (=> d!159983 (= res!1048544 (bvsge j!70 (size!49616 a!2804)))))

(assert (=> d!159983 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!853277)))

