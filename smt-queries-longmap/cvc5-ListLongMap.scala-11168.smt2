; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130550 () Bool)

(assert start!130550)

(declare-fun b!1532209 () Bool)

(declare-fun e!853720 () Bool)

(assert (=> b!1532209 (= e!853720 true)))

(declare-fun lt!663593 () (_ BitVec 64))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101729 0))(
  ( (array!101730 (arr!49085 (Array (_ BitVec 32) (_ BitVec 64))) (size!49635 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101729)

(declare-fun lt!663591 () array!101729)

(declare-datatypes ((SeekEntryResult!13250 0))(
  ( (MissingZero!13250 (index!55395 (_ BitVec 32))) (Found!13250 (index!55396 (_ BitVec 32))) (Intermediate!13250 (undefined!14062 Bool) (index!55397 (_ BitVec 32)) (x!137092 (_ BitVec 32))) (Undefined!13250) (MissingVacant!13250 (index!55398 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101729 (_ BitVec 32)) SeekEntryResult!13250)

(assert (=> b!1532209 (= (seekEntryOrOpen!0 (select (arr!49085 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!663593 lt!663591 mask!2512))))

(declare-fun lt!663589 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(declare-datatypes ((Unit!51284 0))(
  ( (Unit!51285) )
))
(declare-fun lt!663592 () Unit!51284)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101729 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51284)

(assert (=> b!1532209 (= lt!663592 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!663589 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1532210 () Bool)

(declare-fun e!853718 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101729 (_ BitVec 32)) SeekEntryResult!13250)

(assert (=> b!1532210 (= e!853718 (= (seekEntry!0 (select (arr!49085 a!2804) j!70) a!2804 mask!2512) (Found!13250 j!70)))))

(declare-fun b!1532211 () Bool)

(declare-fun e!853717 () Bool)

(declare-fun e!853719 () Bool)

(assert (=> b!1532211 (= e!853717 e!853719)))

(declare-fun res!1049359 () Bool)

(assert (=> b!1532211 (=> (not res!1049359) (not e!853719))))

(declare-fun lt!663594 () SeekEntryResult!13250)

(declare-fun lt!663595 () SeekEntryResult!13250)

(assert (=> b!1532211 (= res!1049359 (= lt!663594 lt!663595))))

(assert (=> b!1532211 (= lt!663595 (Intermediate!13250 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101729 (_ BitVec 32)) SeekEntryResult!13250)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1532211 (= lt!663594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49085 a!2804) j!70) mask!2512) (select (arr!49085 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1532212 () Bool)

(declare-fun res!1049356 () Bool)

(assert (=> b!1532212 (=> (not res!1049356) (not e!853717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532212 (= res!1049356 (validKeyInArray!0 (select (arr!49085 a!2804) j!70)))))

(declare-fun b!1532213 () Bool)

(declare-fun res!1049349 () Bool)

(assert (=> b!1532213 (=> (not res!1049349) (not e!853717))))

(declare-datatypes ((List!35568 0))(
  ( (Nil!35565) (Cons!35564 (h!37009 (_ BitVec 64)) (t!50262 List!35568)) )
))
(declare-fun arrayNoDuplicates!0 (array!101729 (_ BitVec 32) List!35568) Bool)

(assert (=> b!1532213 (= res!1049349 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35565))))

(declare-fun b!1532214 () Bool)

(declare-fun res!1049354 () Bool)

(assert (=> b!1532214 (=> (not res!1049354) (not e!853717))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1532214 (= res!1049354 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49635 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49635 a!2804))))))

(declare-fun b!1532215 () Bool)

(declare-fun res!1049358 () Bool)

(assert (=> b!1532215 (=> (not res!1049358) (not e!853717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101729 (_ BitVec 32)) Bool)

(assert (=> b!1532215 (= res!1049358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1532216 () Bool)

(declare-fun e!853714 () Bool)

(assert (=> b!1532216 (= e!853714 e!853720)))

(declare-fun res!1049353 () Bool)

(assert (=> b!1532216 (=> res!1049353 e!853720)))

(assert (=> b!1532216 (= res!1049353 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663589 #b00000000000000000000000000000000) (bvsge lt!663589 (size!49635 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1532216 (= lt!663589 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun res!1049361 () Bool)

(assert (=> start!130550 (=> (not res!1049361) (not e!853717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130550 (= res!1049361 (validMask!0 mask!2512))))

(assert (=> start!130550 e!853717))

(assert (=> start!130550 true))

(declare-fun array_inv!38113 (array!101729) Bool)

(assert (=> start!130550 (array_inv!38113 a!2804)))

(declare-fun b!1532217 () Bool)

(declare-fun e!853716 () Bool)

(assert (=> b!1532217 (= e!853719 e!853716)))

(declare-fun res!1049360 () Bool)

(assert (=> b!1532217 (=> (not res!1049360) (not e!853716))))

(assert (=> b!1532217 (= res!1049360 (= lt!663594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!663593 mask!2512) lt!663593 lt!663591 mask!2512)))))

(assert (=> b!1532217 (= lt!663593 (select (store (arr!49085 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1532217 (= lt!663591 (array!101730 (store (arr!49085 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49635 a!2804)))))

(declare-fun b!1532218 () Bool)

(assert (=> b!1532218 (= e!853716 (not e!853714))))

(declare-fun res!1049357 () Bool)

(assert (=> b!1532218 (=> res!1049357 e!853714)))

(assert (=> b!1532218 (= res!1049357 (or (not (= (select (arr!49085 a!2804) j!70) lt!663593)) (= x!534 resX!21)))))

(assert (=> b!1532218 e!853718))

(declare-fun res!1049355 () Bool)

(assert (=> b!1532218 (=> (not res!1049355) (not e!853718))))

(assert (=> b!1532218 (= res!1049355 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!663590 () Unit!51284)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101729 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51284)

(assert (=> b!1532218 (= lt!663590 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1532219 () Bool)

(declare-fun res!1049351 () Bool)

(assert (=> b!1532219 (=> (not res!1049351) (not e!853717))))

(assert (=> b!1532219 (= res!1049351 (and (= (size!49635 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49635 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49635 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1532220 () Bool)

(declare-fun res!1049362 () Bool)

(assert (=> b!1532220 (=> res!1049362 e!853720)))

(assert (=> b!1532220 (= res!1049362 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663589 (select (arr!49085 a!2804) j!70) a!2804 mask!2512) lt!663595)))))

(declare-fun b!1532221 () Bool)

(declare-fun res!1049350 () Bool)

(assert (=> b!1532221 (=> (not res!1049350) (not e!853717))))

(assert (=> b!1532221 (= res!1049350 (validKeyInArray!0 (select (arr!49085 a!2804) i!961)))))

(declare-fun b!1532222 () Bool)

(declare-fun res!1049352 () Bool)

(assert (=> b!1532222 (=> (not res!1049352) (not e!853719))))

(assert (=> b!1532222 (= res!1049352 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49085 a!2804) j!70) a!2804 mask!2512) lt!663595))))

(assert (= (and start!130550 res!1049361) b!1532219))

(assert (= (and b!1532219 res!1049351) b!1532221))

(assert (= (and b!1532221 res!1049350) b!1532212))

(assert (= (and b!1532212 res!1049356) b!1532215))

(assert (= (and b!1532215 res!1049358) b!1532213))

(assert (= (and b!1532213 res!1049349) b!1532214))

(assert (= (and b!1532214 res!1049354) b!1532211))

(assert (= (and b!1532211 res!1049359) b!1532222))

(assert (= (and b!1532222 res!1049352) b!1532217))

(assert (= (and b!1532217 res!1049360) b!1532218))

(assert (= (and b!1532218 res!1049355) b!1532210))

(assert (= (and b!1532218 (not res!1049357)) b!1532216))

(assert (= (and b!1532216 (not res!1049353)) b!1532220))

(assert (= (and b!1532220 (not res!1049362)) b!1532209))

(declare-fun m!1414911 () Bool)

(assert (=> b!1532222 m!1414911))

(assert (=> b!1532222 m!1414911))

(declare-fun m!1414913 () Bool)

(assert (=> b!1532222 m!1414913))

(assert (=> b!1532218 m!1414911))

(declare-fun m!1414915 () Bool)

(assert (=> b!1532218 m!1414915))

(declare-fun m!1414917 () Bool)

(assert (=> b!1532218 m!1414917))

(assert (=> b!1532212 m!1414911))

(assert (=> b!1532212 m!1414911))

(declare-fun m!1414919 () Bool)

(assert (=> b!1532212 m!1414919))

(declare-fun m!1414921 () Bool)

(assert (=> b!1532217 m!1414921))

(assert (=> b!1532217 m!1414921))

(declare-fun m!1414923 () Bool)

(assert (=> b!1532217 m!1414923))

(declare-fun m!1414925 () Bool)

(assert (=> b!1532217 m!1414925))

(declare-fun m!1414927 () Bool)

(assert (=> b!1532217 m!1414927))

(assert (=> b!1532211 m!1414911))

(assert (=> b!1532211 m!1414911))

(declare-fun m!1414929 () Bool)

(assert (=> b!1532211 m!1414929))

(assert (=> b!1532211 m!1414929))

(assert (=> b!1532211 m!1414911))

(declare-fun m!1414931 () Bool)

(assert (=> b!1532211 m!1414931))

(declare-fun m!1414933 () Bool)

(assert (=> b!1532216 m!1414933))

(assert (=> b!1532209 m!1414911))

(assert (=> b!1532209 m!1414911))

(declare-fun m!1414935 () Bool)

(assert (=> b!1532209 m!1414935))

(declare-fun m!1414937 () Bool)

(assert (=> b!1532209 m!1414937))

(declare-fun m!1414939 () Bool)

(assert (=> b!1532209 m!1414939))

(declare-fun m!1414941 () Bool)

(assert (=> b!1532213 m!1414941))

(declare-fun m!1414943 () Bool)

(assert (=> b!1532221 m!1414943))

(assert (=> b!1532221 m!1414943))

(declare-fun m!1414945 () Bool)

(assert (=> b!1532221 m!1414945))

(assert (=> b!1532220 m!1414911))

(assert (=> b!1532220 m!1414911))

(declare-fun m!1414947 () Bool)

(assert (=> b!1532220 m!1414947))

(assert (=> b!1532210 m!1414911))

(assert (=> b!1532210 m!1414911))

(declare-fun m!1414949 () Bool)

(assert (=> b!1532210 m!1414949))

(declare-fun m!1414951 () Bool)

(assert (=> b!1532215 m!1414951))

(declare-fun m!1414953 () Bool)

(assert (=> start!130550 m!1414953))

(declare-fun m!1414955 () Bool)

(assert (=> start!130550 m!1414955))

(push 1)

