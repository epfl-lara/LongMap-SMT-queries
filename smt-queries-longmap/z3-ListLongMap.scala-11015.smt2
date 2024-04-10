; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128924 () Bool)

(assert start!128924)

(declare-fun b!1511236 () Bool)

(declare-fun res!1031149 () Bool)

(declare-fun e!843749 () Bool)

(assert (=> b!1511236 (=> (not res!1031149) (not e!843749))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100780 0))(
  ( (array!100781 (arr!48627 (Array (_ BitVec 32) (_ BitVec 64))) (size!49177 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100780)

(declare-datatypes ((SeekEntryResult!12798 0))(
  ( (MissingZero!12798 (index!53587 (_ BitVec 32))) (Found!12798 (index!53588 (_ BitVec 32))) (Intermediate!12798 (undefined!13610 Bool) (index!53589 (_ BitVec 32)) (x!135324 (_ BitVec 32))) (Undefined!12798) (MissingVacant!12798 (index!53590 (_ BitVec 32))) )
))
(declare-fun lt!655386 () SeekEntryResult!12798)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100780 (_ BitVec 32)) SeekEntryResult!12798)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511236 (= res!1031149 (= lt!655386 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48627 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48627 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100781 (store (arr!48627 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49177 a!2804)) mask!2512)))))

(declare-fun b!1511237 () Bool)

(declare-fun res!1031141 () Bool)

(declare-fun e!843751 () Bool)

(assert (=> b!1511237 (=> (not res!1031141) (not e!843751))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511237 (= res!1031141 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49177 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49177 a!2804))))))

(declare-fun res!1031142 () Bool)

(assert (=> start!128924 (=> (not res!1031142) (not e!843751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128924 (= res!1031142 (validMask!0 mask!2512))))

(assert (=> start!128924 e!843751))

(assert (=> start!128924 true))

(declare-fun array_inv!37655 (array!100780) Bool)

(assert (=> start!128924 (array_inv!37655 a!2804)))

(declare-fun b!1511238 () Bool)

(assert (=> b!1511238 (= e!843749 (not true))))

(declare-fun e!843750 () Bool)

(assert (=> b!1511238 e!843750))

(declare-fun res!1031146 () Bool)

(assert (=> b!1511238 (=> (not res!1031146) (not e!843750))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100780 (_ BitVec 32)) Bool)

(assert (=> b!1511238 (= res!1031146 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50464 0))(
  ( (Unit!50465) )
))
(declare-fun lt!655387 () Unit!50464)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100780 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50464)

(assert (=> b!1511238 (= lt!655387 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511239 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100780 (_ BitVec 32)) SeekEntryResult!12798)

(assert (=> b!1511239 (= e!843750 (= (seekEntry!0 (select (arr!48627 a!2804) j!70) a!2804 mask!2512) (Found!12798 j!70)))))

(declare-fun b!1511240 () Bool)

(declare-fun res!1031145 () Bool)

(assert (=> b!1511240 (=> (not res!1031145) (not e!843751))))

(declare-datatypes ((List!35110 0))(
  ( (Nil!35107) (Cons!35106 (h!36518 (_ BitVec 64)) (t!49804 List!35110)) )
))
(declare-fun arrayNoDuplicates!0 (array!100780 (_ BitVec 32) List!35110) Bool)

(assert (=> b!1511240 (= res!1031145 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35107))))

(declare-fun b!1511241 () Bool)

(assert (=> b!1511241 (= e!843751 e!843749)))

(declare-fun res!1031148 () Bool)

(assert (=> b!1511241 (=> (not res!1031148) (not e!843749))))

(declare-fun lt!655385 () SeekEntryResult!12798)

(assert (=> b!1511241 (= res!1031148 (= lt!655386 lt!655385))))

(assert (=> b!1511241 (= lt!655385 (Intermediate!12798 false resIndex!21 resX!21))))

(assert (=> b!1511241 (= lt!655386 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48627 a!2804) j!70) mask!2512) (select (arr!48627 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511242 () Bool)

(declare-fun res!1031147 () Bool)

(assert (=> b!1511242 (=> (not res!1031147) (not e!843751))))

(assert (=> b!1511242 (= res!1031147 (and (= (size!49177 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49177 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49177 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511243 () Bool)

(declare-fun res!1031143 () Bool)

(assert (=> b!1511243 (=> (not res!1031143) (not e!843749))))

(assert (=> b!1511243 (= res!1031143 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48627 a!2804) j!70) a!2804 mask!2512) lt!655385))))

(declare-fun b!1511244 () Bool)

(declare-fun res!1031144 () Bool)

(assert (=> b!1511244 (=> (not res!1031144) (not e!843751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511244 (= res!1031144 (validKeyInArray!0 (select (arr!48627 a!2804) j!70)))))

(declare-fun b!1511245 () Bool)

(declare-fun res!1031139 () Bool)

(assert (=> b!1511245 (=> (not res!1031139) (not e!843751))))

(assert (=> b!1511245 (= res!1031139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511246 () Bool)

(declare-fun res!1031140 () Bool)

(assert (=> b!1511246 (=> (not res!1031140) (not e!843751))))

(assert (=> b!1511246 (= res!1031140 (validKeyInArray!0 (select (arr!48627 a!2804) i!961)))))

(assert (= (and start!128924 res!1031142) b!1511242))

(assert (= (and b!1511242 res!1031147) b!1511246))

(assert (= (and b!1511246 res!1031140) b!1511244))

(assert (= (and b!1511244 res!1031144) b!1511245))

(assert (= (and b!1511245 res!1031139) b!1511240))

(assert (= (and b!1511240 res!1031145) b!1511237))

(assert (= (and b!1511237 res!1031141) b!1511241))

(assert (= (and b!1511241 res!1031148) b!1511243))

(assert (= (and b!1511243 res!1031143) b!1511236))

(assert (= (and b!1511236 res!1031149) b!1511238))

(assert (= (and b!1511238 res!1031146) b!1511239))

(declare-fun m!1393915 () Bool)

(assert (=> b!1511243 m!1393915))

(assert (=> b!1511243 m!1393915))

(declare-fun m!1393917 () Bool)

(assert (=> b!1511243 m!1393917))

(assert (=> b!1511244 m!1393915))

(assert (=> b!1511244 m!1393915))

(declare-fun m!1393919 () Bool)

(assert (=> b!1511244 m!1393919))

(declare-fun m!1393921 () Bool)

(assert (=> b!1511238 m!1393921))

(declare-fun m!1393923 () Bool)

(assert (=> b!1511238 m!1393923))

(declare-fun m!1393925 () Bool)

(assert (=> start!128924 m!1393925))

(declare-fun m!1393927 () Bool)

(assert (=> start!128924 m!1393927))

(declare-fun m!1393929 () Bool)

(assert (=> b!1511245 m!1393929))

(declare-fun m!1393931 () Bool)

(assert (=> b!1511246 m!1393931))

(assert (=> b!1511246 m!1393931))

(declare-fun m!1393933 () Bool)

(assert (=> b!1511246 m!1393933))

(assert (=> b!1511241 m!1393915))

(assert (=> b!1511241 m!1393915))

(declare-fun m!1393935 () Bool)

(assert (=> b!1511241 m!1393935))

(assert (=> b!1511241 m!1393935))

(assert (=> b!1511241 m!1393915))

(declare-fun m!1393937 () Bool)

(assert (=> b!1511241 m!1393937))

(declare-fun m!1393939 () Bool)

(assert (=> b!1511236 m!1393939))

(declare-fun m!1393941 () Bool)

(assert (=> b!1511236 m!1393941))

(assert (=> b!1511236 m!1393941))

(declare-fun m!1393943 () Bool)

(assert (=> b!1511236 m!1393943))

(assert (=> b!1511236 m!1393943))

(assert (=> b!1511236 m!1393941))

(declare-fun m!1393945 () Bool)

(assert (=> b!1511236 m!1393945))

(declare-fun m!1393947 () Bool)

(assert (=> b!1511240 m!1393947))

(assert (=> b!1511239 m!1393915))

(assert (=> b!1511239 m!1393915))

(declare-fun m!1393949 () Bool)

(assert (=> b!1511239 m!1393949))

(check-sat (not b!1511240) (not b!1511236) (not b!1511243) (not b!1511238) (not b!1511245) (not start!128924) (not b!1511239) (not b!1511246) (not b!1511241) (not b!1511244))
(check-sat)
