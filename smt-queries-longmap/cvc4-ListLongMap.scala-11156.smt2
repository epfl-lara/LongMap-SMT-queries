; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130302 () Bool)

(assert start!130302)

(declare-fun b!1530000 () Bool)

(declare-fun e!852568 () Bool)

(declare-fun e!852566 () Bool)

(assert (=> b!1530000 (= e!852568 e!852566)))

(declare-fun res!1047716 () Bool)

(assert (=> b!1530000 (=> (not res!1047716) (not e!852566))))

(declare-datatypes ((SeekEntryResult!13216 0))(
  ( (MissingZero!13216 (index!55259 (_ BitVec 32))) (Found!13216 (index!55260 (_ BitVec 32))) (Intermediate!13216 (undefined!14028 Bool) (index!55261 (_ BitVec 32)) (x!136935 (_ BitVec 32))) (Undefined!13216) (MissingVacant!13216 (index!55262 (_ BitVec 32))) )
))
(declare-fun lt!662623 () SeekEntryResult!13216)

(declare-fun lt!662622 () SeekEntryResult!13216)

(assert (=> b!1530000 (= res!1047716 (= lt!662623 lt!662622))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1530000 (= lt!662622 (Intermediate!13216 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101652 0))(
  ( (array!101653 (arr!49051 (Array (_ BitVec 32) (_ BitVec 64))) (size!49601 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101652)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101652 (_ BitVec 32)) SeekEntryResult!13216)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530000 (= lt!662623 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49051 a!2804) j!70) mask!2512) (select (arr!49051 a!2804) j!70) a!2804 mask!2512))))

(declare-fun e!852565 () Bool)

(declare-fun b!1530001 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101652 (_ BitVec 32)) SeekEntryResult!13216)

(assert (=> b!1530001 (= e!852565 (= (seekEntry!0 (select (arr!49051 a!2804) j!70) a!2804 mask!2512) (Found!13216 j!70)))))

(declare-fun res!1047710 () Bool)

(assert (=> start!130302 (=> (not res!1047710) (not e!852568))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130302 (= res!1047710 (validMask!0 mask!2512))))

(assert (=> start!130302 e!852568))

(assert (=> start!130302 true))

(declare-fun array_inv!38079 (array!101652) Bool)

(assert (=> start!130302 (array_inv!38079 a!2804)))

(declare-fun b!1530002 () Bool)

(declare-fun res!1047715 () Bool)

(assert (=> b!1530002 (=> (not res!1047715) (not e!852568))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1530002 (= res!1047715 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49601 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49601 a!2804))))))

(declare-fun b!1530003 () Bool)

(declare-fun res!1047712 () Bool)

(assert (=> b!1530003 (=> (not res!1047712) (not e!852568))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1530003 (= res!1047712 (and (= (size!49601 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49601 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49601 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1530004 () Bool)

(declare-fun res!1047714 () Bool)

(assert (=> b!1530004 (=> (not res!1047714) (not e!852566))))

(assert (=> b!1530004 (= res!1047714 (= lt!662623 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101653 (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49601 a!2804)) mask!2512)))))

(declare-fun b!1530005 () Bool)

(declare-fun res!1047707 () Bool)

(assert (=> b!1530005 (=> (not res!1047707) (not e!852568))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1530005 (= res!1047707 (validKeyInArray!0 (select (arr!49051 a!2804) i!961)))))

(declare-fun b!1530006 () Bool)

(declare-fun res!1047709 () Bool)

(assert (=> b!1530006 (=> (not res!1047709) (not e!852568))))

(declare-datatypes ((List!35534 0))(
  ( (Nil!35531) (Cons!35530 (h!36966 (_ BitVec 64)) (t!50228 List!35534)) )
))
(declare-fun arrayNoDuplicates!0 (array!101652 (_ BitVec 32) List!35534) Bool)

(assert (=> b!1530006 (= res!1047709 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35531))))

(declare-fun b!1530007 () Bool)

(declare-fun e!852564 () Bool)

(assert (=> b!1530007 (= e!852564 (and (bvsge (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110)))))

(declare-fun lt!662621 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530007 (= lt!662621 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1530008 () Bool)

(declare-fun res!1047718 () Bool)

(assert (=> b!1530008 (=> (not res!1047718) (not e!852568))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101652 (_ BitVec 32)) Bool)

(assert (=> b!1530008 (= res!1047718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1530009 () Bool)

(declare-fun res!1047713 () Bool)

(assert (=> b!1530009 (=> (not res!1047713) (not e!852566))))

(assert (=> b!1530009 (= res!1047713 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49051 a!2804) j!70) a!2804 mask!2512) lt!662622))))

(declare-fun b!1530010 () Bool)

(assert (=> b!1530010 (= e!852566 (not e!852564))))

(declare-fun res!1047717 () Bool)

(assert (=> b!1530010 (=> res!1047717 e!852564)))

(assert (=> b!1530010 (= res!1047717 (or (not (= (select (arr!49051 a!2804) j!70) (select (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1530010 e!852565))

(declare-fun res!1047708 () Bool)

(assert (=> b!1530010 (=> (not res!1047708) (not e!852565))))

(assert (=> b!1530010 (= res!1047708 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51216 0))(
  ( (Unit!51217) )
))
(declare-fun lt!662620 () Unit!51216)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101652 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51216)

(assert (=> b!1530010 (= lt!662620 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1530011 () Bool)

(declare-fun res!1047711 () Bool)

(assert (=> b!1530011 (=> (not res!1047711) (not e!852568))))

(assert (=> b!1530011 (= res!1047711 (validKeyInArray!0 (select (arr!49051 a!2804) j!70)))))

(assert (= (and start!130302 res!1047710) b!1530003))

(assert (= (and b!1530003 res!1047712) b!1530005))

(assert (= (and b!1530005 res!1047707) b!1530011))

(assert (= (and b!1530011 res!1047711) b!1530008))

(assert (= (and b!1530008 res!1047718) b!1530006))

(assert (= (and b!1530006 res!1047709) b!1530002))

(assert (= (and b!1530002 res!1047715) b!1530000))

(assert (= (and b!1530000 res!1047716) b!1530009))

(assert (= (and b!1530009 res!1047713) b!1530004))

(assert (= (and b!1530004 res!1047714) b!1530010))

(assert (= (and b!1530010 res!1047708) b!1530001))

(assert (= (and b!1530010 (not res!1047717)) b!1530007))

(declare-fun m!1412977 () Bool)

(assert (=> b!1530004 m!1412977))

(declare-fun m!1412979 () Bool)

(assert (=> b!1530004 m!1412979))

(assert (=> b!1530004 m!1412979))

(declare-fun m!1412981 () Bool)

(assert (=> b!1530004 m!1412981))

(assert (=> b!1530004 m!1412981))

(assert (=> b!1530004 m!1412979))

(declare-fun m!1412983 () Bool)

(assert (=> b!1530004 m!1412983))

(declare-fun m!1412985 () Bool)

(assert (=> b!1530005 m!1412985))

(assert (=> b!1530005 m!1412985))

(declare-fun m!1412987 () Bool)

(assert (=> b!1530005 m!1412987))

(declare-fun m!1412989 () Bool)

(assert (=> b!1530007 m!1412989))

(declare-fun m!1412991 () Bool)

(assert (=> b!1530008 m!1412991))

(declare-fun m!1412993 () Bool)

(assert (=> start!130302 m!1412993))

(declare-fun m!1412995 () Bool)

(assert (=> start!130302 m!1412995))

(declare-fun m!1412997 () Bool)

(assert (=> b!1530000 m!1412997))

(assert (=> b!1530000 m!1412997))

(declare-fun m!1412999 () Bool)

(assert (=> b!1530000 m!1412999))

(assert (=> b!1530000 m!1412999))

(assert (=> b!1530000 m!1412997))

(declare-fun m!1413001 () Bool)

(assert (=> b!1530000 m!1413001))

(assert (=> b!1530001 m!1412997))

(assert (=> b!1530001 m!1412997))

(declare-fun m!1413003 () Bool)

(assert (=> b!1530001 m!1413003))

(assert (=> b!1530011 m!1412997))

(assert (=> b!1530011 m!1412997))

(declare-fun m!1413005 () Bool)

(assert (=> b!1530011 m!1413005))

(declare-fun m!1413007 () Bool)

(assert (=> b!1530006 m!1413007))

(assert (=> b!1530010 m!1412997))

(declare-fun m!1413009 () Bool)

(assert (=> b!1530010 m!1413009))

(assert (=> b!1530010 m!1412977))

(assert (=> b!1530010 m!1412979))

(declare-fun m!1413011 () Bool)

(assert (=> b!1530010 m!1413011))

(assert (=> b!1530009 m!1412997))

(assert (=> b!1530009 m!1412997))

(declare-fun m!1413013 () Bool)

(assert (=> b!1530009 m!1413013))

(push 1)

(assert (not b!1530010))

(assert (not b!1530007))

(assert (not b!1530001))

(assert (not b!1530009))

(assert (not b!1530000))

(assert (not b!1530004))

(assert (not b!1530006))

(assert (not b!1530011))

(assert (not b!1530008))

(assert (not b!1530005))

(assert (not start!130302))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1530098 () Bool)

(declare-fun e!852625 () Bool)

(declare-fun e!852622 () Bool)

(assert (=> b!1530098 (= e!852625 e!852622)))

(declare-fun res!1047752 () Bool)

(declare-fun lt!662667 () SeekEntryResult!13216)

(assert (=> b!1530098 (= res!1047752 (and (is-Intermediate!13216 lt!662667) (not (undefined!14028 lt!662667)) (bvslt (x!136935 lt!662667) #b01111111111111111111111111111110) (bvsge (x!136935 lt!662667) #b00000000000000000000000000000000) (bvsge (x!136935 lt!662667) #b00000000000000000000000000000000)))))

(assert (=> b!1530098 (=> (not res!1047752) (not e!852622))))

(declare-fun d!159745 () Bool)

(assert (=> d!159745 e!852625))

(declare-fun c!140729 () Bool)

(assert (=> d!159745 (= c!140729 (and (is-Intermediate!13216 lt!662667) (undefined!14028 lt!662667)))))

(declare-fun e!852621 () SeekEntryResult!13216)

(assert (=> d!159745 (= lt!662667 e!852621)))

(declare-fun c!140728 () Bool)

(assert (=> d!159745 (= c!140728 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!662668 () (_ BitVec 64))

(assert (=> d!159745 (= lt!662668 (select (arr!49051 (array!101653 (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49601 a!2804))) (toIndex!0 (select (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!159745 (validMask!0 mask!2512)))

(assert (=> d!159745 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101653 (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49601 a!2804)) mask!2512) lt!662667)))

(declare-fun b!1530099 () Bool)

(assert (=> b!1530099 (and (bvsge (index!55261 lt!662667) #b00000000000000000000000000000000) (bvslt (index!55261 lt!662667) (size!49601 (array!101653 (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49601 a!2804)))))))

(declare-fun e!852623 () Bool)

(assert (=> b!1530099 (= e!852623 (= (select (arr!49051 (array!101653 (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49601 a!2804))) (index!55261 lt!662667)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1530100 () Bool)

(assert (=> b!1530100 (= e!852621 (Intermediate!13216 true (toIndex!0 (select (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1530101 () Bool)

(declare-fun e!852624 () SeekEntryResult!13216)

(assert (=> b!1530101 (= e!852621 e!852624)))

(declare-fun c!140730 () Bool)

(assert (=> b!1530101 (= c!140730 (or (= lt!662668 (select (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!662668 lt!662668) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1530102 () Bool)

(assert (=> b!1530102 (= e!852624 (Intermediate!13216 false (toIndex!0 (select (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1530103 () Bool)

(assert (=> b!1530103 (= e!852624 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101653 (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49601 a!2804)) mask!2512))))

(declare-fun b!1530104 () Bool)

(assert (=> b!1530104 (and (bvsge (index!55261 lt!662667) #b00000000000000000000000000000000) (bvslt (index!55261 lt!662667) (size!49601 (array!101653 (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49601 a!2804)))))))

(declare-fun res!1047750 () Bool)

(assert (=> b!1530104 (= res!1047750 (= (select (arr!49051 (array!101653 (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49601 a!2804))) (index!55261 lt!662667)) (select (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1530104 (=> res!1047750 e!852623)))

(assert (=> b!1530104 (= e!852622 e!852623)))

(declare-fun b!1530105 () Bool)

(assert (=> b!1530105 (and (bvsge (index!55261 lt!662667) #b00000000000000000000000000000000) (bvslt (index!55261 lt!662667) (size!49601 (array!101653 (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49601 a!2804)))))))

(declare-fun res!1047751 () Bool)

(assert (=> b!1530105 (= res!1047751 (= (select (arr!49051 (array!101653 (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49601 a!2804))) (index!55261 lt!662667)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1530105 (=> res!1047751 e!852623)))

(declare-fun b!1530106 () Bool)

(assert (=> b!1530106 (= e!852625 (bvsge (x!136935 lt!662667) #b01111111111111111111111111111110))))

(assert (= (and d!159745 c!140728) b!1530100))

(assert (= (and d!159745 (not c!140728)) b!1530101))

(assert (= (and b!1530101 c!140730) b!1530102))

(assert (= (and b!1530101 (not c!140730)) b!1530103))

(assert (= (and d!159745 c!140729) b!1530106))

(assert (= (and d!159745 (not c!140729)) b!1530098))

(assert (= (and b!1530098 res!1047752) b!1530104))

(assert (= (and b!1530104 (not res!1047750)) b!1530105))

(assert (= (and b!1530105 (not res!1047751)) b!1530099))

(declare-fun m!1413055 () Bool)

(assert (=> b!1530099 m!1413055))

(assert (=> d!159745 m!1412981))

(declare-fun m!1413057 () Bool)

(assert (=> d!159745 m!1413057))

(assert (=> d!159745 m!1412993))

(assert (=> b!1530104 m!1413055))

(assert (=> b!1530105 m!1413055))

(assert (=> b!1530103 m!1412981))

(declare-fun m!1413059 () Bool)

(assert (=> b!1530103 m!1413059))

(assert (=> b!1530103 m!1413059))

(assert (=> b!1530103 m!1412979))

(declare-fun m!1413061 () Bool)

(assert (=> b!1530103 m!1413061))

(assert (=> b!1530004 d!159745))

(declare-fun d!159757 () Bool)

(declare-fun lt!662676 () (_ BitVec 32))

(declare-fun lt!662675 () (_ BitVec 32))

(assert (=> d!159757 (= lt!662676 (bvmul (bvxor lt!662675 (bvlshr lt!662675 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159757 (= lt!662675 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159757 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1047765 (let ((h!36968 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136941 (bvmul (bvxor h!36968 (bvlshr h!36968 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136941 (bvlshr x!136941 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1047765 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1047765 #b00000000000000000000000000000000))))))

(assert (=> d!159757 (= (toIndex!0 (select (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!662676 (bvlshr lt!662676 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1530004 d!159757))

(declare-fun d!159765 () Bool)

(assert (=> d!159765 (= (validKeyInArray!0 (select (arr!49051 a!2804) j!70)) (and (not (= (select (arr!49051 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49051 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1530011 d!159765))

(declare-fun d!159767 () Bool)

(declare-fun lt!662710 () SeekEntryResult!13216)

(assert (=> d!159767 (and (or (is-MissingVacant!13216 lt!662710) (not (is-Found!13216 lt!662710)) (and (bvsge (index!55260 lt!662710) #b00000000000000000000000000000000) (bvslt (index!55260 lt!662710) (size!49601 a!2804)))) (not (is-MissingVacant!13216 lt!662710)) (or (not (is-Found!13216 lt!662710)) (= (select (arr!49051 a!2804) (index!55260 lt!662710)) (select (arr!49051 a!2804) j!70))))))

(declare-fun e!852672 () SeekEntryResult!13216)

(assert (=> d!159767 (= lt!662710 e!852672)))

(declare-fun c!140760 () Bool)

(declare-fun lt!662708 () SeekEntryResult!13216)

(assert (=> d!159767 (= c!140760 (and (is-Intermediate!13216 lt!662708) (undefined!14028 lt!662708)))))

(assert (=> d!159767 (= lt!662708 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49051 a!2804) j!70) mask!2512) (select (arr!49051 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159767 (validMask!0 mask!2512)))

(assert (=> d!159767 (= (seekEntry!0 (select (arr!49051 a!2804) j!70) a!2804 mask!2512) lt!662710)))

(declare-fun b!1530184 () Bool)

(declare-fun e!852674 () SeekEntryResult!13216)

(declare-fun lt!662711 () SeekEntryResult!13216)

(assert (=> b!1530184 (= e!852674 (ite (is-MissingVacant!13216 lt!662711) (MissingZero!13216 (index!55262 lt!662711)) lt!662711))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101652 (_ BitVec 32)) SeekEntryResult!13216)

(assert (=> b!1530184 (= lt!662711 (seekKeyOrZeroReturnVacant!0 (x!136935 lt!662708) (index!55261 lt!662708) (index!55261 lt!662708) (select (arr!49051 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530185 () Bool)

(declare-fun e!852673 () SeekEntryResult!13216)

(assert (=> b!1530185 (= e!852673 (Found!13216 (index!55261 lt!662708)))))

(declare-fun b!1530186 () Bool)

(declare-fun c!140758 () Bool)

(declare-fun lt!662709 () (_ BitVec 64))

(assert (=> b!1530186 (= c!140758 (= lt!662709 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1530186 (= e!852673 e!852674)))

(declare-fun b!1530187 () Bool)

(assert (=> b!1530187 (= e!852672 Undefined!13216)))

(declare-fun b!1530188 () Bool)

(assert (=> b!1530188 (= e!852672 e!852673)))

(assert (=> b!1530188 (= lt!662709 (select (arr!49051 a!2804) (index!55261 lt!662708)))))

(declare-fun c!140759 () Bool)

(assert (=> b!1530188 (= c!140759 (= lt!662709 (select (arr!49051 a!2804) j!70)))))

(declare-fun b!1530189 () Bool)

(assert (=> b!1530189 (= e!852674 (MissingZero!13216 (index!55261 lt!662708)))))

(assert (= (and d!159767 c!140760) b!1530187))

(assert (= (and d!159767 (not c!140760)) b!1530188))

(assert (= (and b!1530188 c!140759) b!1530185))

(assert (= (and b!1530188 (not c!140759)) b!1530186))

(assert (= (and b!1530186 c!140758) b!1530189))

(assert (= (and b!1530186 (not c!140758)) b!1530184))

(declare-fun m!1413095 () Bool)

(assert (=> d!159767 m!1413095))

(assert (=> d!159767 m!1412997))

(assert (=> d!159767 m!1412999))

(assert (=> d!159767 m!1412999))

(assert (=> d!159767 m!1412997))

(assert (=> d!159767 m!1413001))

(assert (=> d!159767 m!1412993))

(assert (=> b!1530184 m!1412997))

(declare-fun m!1413097 () Bool)

(assert (=> b!1530184 m!1413097))

(declare-fun m!1413099 () Bool)

(assert (=> b!1530188 m!1413099))

(assert (=> b!1530001 d!159767))

(declare-fun bm!68503 () Bool)

(declare-fun call!68506 () Bool)

(assert (=> bm!68503 (= call!68506 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1530222 () Bool)

(declare-fun e!852700 () Bool)

(assert (=> b!1530222 (= e!852700 call!68506)))

(declare-fun b!1530223 () Bool)

(declare-fun e!852699 () Bool)

(declare-fun e!852698 () Bool)

(assert (=> b!1530223 (= e!852699 e!852698)))

(declare-fun c!140769 () Bool)

(assert (=> b!1530223 (= c!140769 (validKeyInArray!0 (select (arr!49051 a!2804) j!70)))))

(declare-fun b!1530224 () Bool)

(assert (=> b!1530224 (= e!852698 e!852700)))

(declare-fun lt!662723 () (_ BitVec 64))

(assert (=> b!1530224 (= lt!662723 (select (arr!49051 a!2804) j!70))))

(declare-fun lt!662724 () Unit!51216)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101652 (_ BitVec 64) (_ BitVec 32)) Unit!51216)

(assert (=> b!1530224 (= lt!662724 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!662723 j!70))))

(declare-fun arrayContainsKey!0 (array!101652 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1530224 (arrayContainsKey!0 a!2804 lt!662723 #b00000000000000000000000000000000)))

(declare-fun lt!662725 () Unit!51216)

(assert (=> b!1530224 (= lt!662725 lt!662724)))

(declare-fun res!1047795 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101652 (_ BitVec 32)) SeekEntryResult!13216)

(assert (=> b!1530224 (= res!1047795 (= (seekEntryOrOpen!0 (select (arr!49051 a!2804) j!70) a!2804 mask!2512) (Found!13216 j!70)))))

(assert (=> b!1530224 (=> (not res!1047795) (not e!852700))))

(declare-fun b!1530225 () Bool)

(assert (=> b!1530225 (= e!852698 call!68506)))

(declare-fun d!159779 () Bool)

(declare-fun res!1047794 () Bool)

(assert (=> d!159779 (=> res!1047794 e!852699)))

(assert (=> d!159779 (= res!1047794 (bvsge j!70 (size!49601 a!2804)))))

(assert (=> d!159779 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!852699)))

(assert (= (and d!159779 (not res!1047794)) b!1530223))

(assert (= (and b!1530223 c!140769) b!1530224))

(assert (= (and b!1530223 (not c!140769)) b!1530225))

(assert (= (and b!1530224 res!1047795) b!1530222))

(assert (= (or b!1530222 b!1530225) bm!68503))

(declare-fun m!1413111 () Bool)

(assert (=> bm!68503 m!1413111))

(assert (=> b!1530223 m!1412997))

(assert (=> b!1530223 m!1412997))

(assert (=> b!1530223 m!1413005))

(assert (=> b!1530224 m!1412997))

(declare-fun m!1413117 () Bool)

(assert (=> b!1530224 m!1413117))

(declare-fun m!1413119 () Bool)

(assert (=> b!1530224 m!1413119))

(assert (=> b!1530224 m!1412997))

(declare-fun m!1413121 () Bool)

(assert (=> b!1530224 m!1413121))

(assert (=> b!1530010 d!159779))

(declare-fun d!159791 () Bool)

(assert (=> d!159791 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!662735 () Unit!51216)

(declare-fun choose!38 (array!101652 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51216)

(assert (=> d!159791 (= lt!662735 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159791 (validMask!0 mask!2512)))

(assert (=> d!159791 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!662735)))

(declare-fun bs!43875 () Bool)

(assert (= bs!43875 d!159791))

(assert (=> bs!43875 m!1413011))

(declare-fun m!1413131 () Bool)

(assert (=> bs!43875 m!1413131))

(assert (=> bs!43875 m!1412993))

(assert (=> b!1530010 d!159791))

(declare-fun b!1530239 () Bool)

(declare-fun e!852713 () Bool)

(declare-fun e!852710 () Bool)

(assert (=> b!1530239 (= e!852713 e!852710)))

(declare-fun res!1047803 () Bool)

(declare-fun lt!662736 () SeekEntryResult!13216)

(assert (=> b!1530239 (= res!1047803 (and (is-Intermediate!13216 lt!662736) (not (undefined!14028 lt!662736)) (bvslt (x!136935 lt!662736) #b01111111111111111111111111111110) (bvsge (x!136935 lt!662736) #b00000000000000000000000000000000) (bvsge (x!136935 lt!662736) #b00000000000000000000000000000000)))))

(assert (=> b!1530239 (=> (not res!1047803) (not e!852710))))

(declare-fun d!159801 () Bool)

(assert (=> d!159801 e!852713))

(declare-fun c!140775 () Bool)

(assert (=> d!159801 (= c!140775 (and (is-Intermediate!13216 lt!662736) (undefined!14028 lt!662736)))))

(declare-fun e!852709 () SeekEntryResult!13216)

(assert (=> d!159801 (= lt!662736 e!852709)))

(declare-fun c!140774 () Bool)

(assert (=> d!159801 (= c!140774 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!662737 () (_ BitVec 64))

(assert (=> d!159801 (= lt!662737 (select (arr!49051 a!2804) (toIndex!0 (select (arr!49051 a!2804) j!70) mask!2512)))))

(assert (=> d!159801 (validMask!0 mask!2512)))

(assert (=> d!159801 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49051 a!2804) j!70) mask!2512) (select (arr!49051 a!2804) j!70) a!2804 mask!2512) lt!662736)))

(declare-fun b!1530240 () Bool)

(assert (=> b!1530240 (and (bvsge (index!55261 lt!662736) #b00000000000000000000000000000000) (bvslt (index!55261 lt!662736) (size!49601 a!2804)))))

(declare-fun e!852711 () Bool)

(assert (=> b!1530240 (= e!852711 (= (select (arr!49051 a!2804) (index!55261 lt!662736)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1530241 () Bool)

(assert (=> b!1530241 (= e!852709 (Intermediate!13216 true (toIndex!0 (select (arr!49051 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1530242 () Bool)

(declare-fun e!852712 () SeekEntryResult!13216)

(assert (=> b!1530242 (= e!852709 e!852712)))

(declare-fun c!140776 () Bool)

(assert (=> b!1530242 (= c!140776 (or (= lt!662737 (select (arr!49051 a!2804) j!70)) (= (bvadd lt!662737 lt!662737) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1530243 () Bool)

(assert (=> b!1530243 (= e!852712 (Intermediate!13216 false (toIndex!0 (select (arr!49051 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1530244 () Bool)

(assert (=> b!1530244 (= e!852712 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!49051 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!49051 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530245 () Bool)

(assert (=> b!1530245 (and (bvsge (index!55261 lt!662736) #b00000000000000000000000000000000) (bvslt (index!55261 lt!662736) (size!49601 a!2804)))))

(declare-fun res!1047801 () Bool)

(assert (=> b!1530245 (= res!1047801 (= (select (arr!49051 a!2804) (index!55261 lt!662736)) (select (arr!49051 a!2804) j!70)))))

(assert (=> b!1530245 (=> res!1047801 e!852711)))

(assert (=> b!1530245 (= e!852710 e!852711)))

(declare-fun b!1530246 () Bool)

(assert (=> b!1530246 (and (bvsge (index!55261 lt!662736) #b00000000000000000000000000000000) (bvslt (index!55261 lt!662736) (size!49601 a!2804)))))

(declare-fun res!1047802 () Bool)

(assert (=> b!1530246 (= res!1047802 (= (select (arr!49051 a!2804) (index!55261 lt!662736)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1530246 (=> res!1047802 e!852711)))

(declare-fun b!1530247 () Bool)

(assert (=> b!1530247 (= e!852713 (bvsge (x!136935 lt!662736) #b01111111111111111111111111111110))))

(assert (= (and d!159801 c!140774) b!1530241))

(assert (= (and d!159801 (not c!140774)) b!1530242))

(assert (= (and b!1530242 c!140776) b!1530243))

(assert (= (and b!1530242 (not c!140776)) b!1530244))

(assert (= (and d!159801 c!140775) b!1530247))

(assert (= (and d!159801 (not c!140775)) b!1530239))

(assert (= (and b!1530239 res!1047803) b!1530245))

(assert (= (and b!1530245 (not res!1047801)) b!1530246))

(assert (= (and b!1530246 (not res!1047802)) b!1530240))

(declare-fun m!1413141 () Bool)

(assert (=> b!1530240 m!1413141))

(assert (=> d!159801 m!1412999))

(declare-fun m!1413143 () Bool)

(assert (=> d!159801 m!1413143))

(assert (=> d!159801 m!1412993))

(assert (=> b!1530245 m!1413141))

(assert (=> b!1530246 m!1413141))

(assert (=> b!1530244 m!1412999))

(declare-fun m!1413147 () Bool)

(assert (=> b!1530244 m!1413147))

(assert (=> b!1530244 m!1413147))

(assert (=> b!1530244 m!1412997))

(declare-fun m!1413149 () Bool)

(assert (=> b!1530244 m!1413149))

(assert (=> b!1530000 d!159801))

(declare-fun d!159807 () Bool)

(declare-fun lt!662744 () (_ BitVec 32))

(declare-fun lt!662743 () (_ BitVec 32))

(assert (=> d!159807 (= lt!662744 (bvmul (bvxor lt!662743 (bvlshr lt!662743 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159807 (= lt!662743 ((_ extract 31 0) (bvand (bvxor (select (arr!49051 a!2804) j!70) (bvlshr (select (arr!49051 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159807 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1047765 (let ((h!36968 ((_ extract 31 0) (bvand (bvxor (select (arr!49051 a!2804) j!70) (bvlshr (select (arr!49051 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136941 (bvmul (bvxor h!36968 (bvlshr h!36968 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136941 (bvlshr x!136941 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1047765 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1047765 #b00000000000000000000000000000000))))))

(assert (=> d!159807 (= (toIndex!0 (select (arr!49051 a!2804) j!70) mask!2512) (bvand (bvxor lt!662744 (bvlshr lt!662744 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1530000 d!159807))

(declare-fun b!1530248 () Bool)

(declare-fun e!852718 () Bool)

(declare-fun e!852715 () Bool)

(assert (=> b!1530248 (= e!852718 e!852715)))

(declare-fun res!1047806 () Bool)

(declare-fun lt!662745 () SeekEntryResult!13216)

(assert (=> b!1530248 (= res!1047806 (and (is-Intermediate!13216 lt!662745) (not (undefined!14028 lt!662745)) (bvslt (x!136935 lt!662745) #b01111111111111111111111111111110) (bvsge (x!136935 lt!662745) #b00000000000000000000000000000000) (bvsge (x!136935 lt!662745) x!534)))))

(assert (=> b!1530248 (=> (not res!1047806) (not e!852715))))

(declare-fun d!159811 () Bool)

(assert (=> d!159811 e!852718))

(declare-fun c!140778 () Bool)

(assert (=> d!159811 (= c!140778 (and (is-Intermediate!13216 lt!662745) (undefined!14028 lt!662745)))))

(declare-fun e!852714 () SeekEntryResult!13216)

(assert (=> d!159811 (= lt!662745 e!852714)))

(declare-fun c!140777 () Bool)

(assert (=> d!159811 (= c!140777 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!662746 () (_ BitVec 64))

(assert (=> d!159811 (= lt!662746 (select (arr!49051 a!2804) index!487))))

(assert (=> d!159811 (validMask!0 mask!2512)))

(assert (=> d!159811 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49051 a!2804) j!70) a!2804 mask!2512) lt!662745)))

(declare-fun b!1530249 () Bool)

(assert (=> b!1530249 (and (bvsge (index!55261 lt!662745) #b00000000000000000000000000000000) (bvslt (index!55261 lt!662745) (size!49601 a!2804)))))

(declare-fun e!852716 () Bool)

(assert (=> b!1530249 (= e!852716 (= (select (arr!49051 a!2804) (index!55261 lt!662745)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1530250 () Bool)

(assert (=> b!1530250 (= e!852714 (Intermediate!13216 true index!487 x!534))))

(declare-fun b!1530251 () Bool)

(declare-fun e!852717 () SeekEntryResult!13216)

(assert (=> b!1530251 (= e!852714 e!852717)))

(declare-fun c!140779 () Bool)

(assert (=> b!1530251 (= c!140779 (or (= lt!662746 (select (arr!49051 a!2804) j!70)) (= (bvadd lt!662746 lt!662746) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1530252 () Bool)

(assert (=> b!1530252 (= e!852717 (Intermediate!13216 false index!487 x!534))))

