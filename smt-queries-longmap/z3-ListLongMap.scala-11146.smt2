; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130620 () Bool)

(assert start!130620)

(declare-fun b!1531140 () Bool)

(declare-fun res!1047361 () Bool)

(declare-fun e!853504 () Bool)

(assert (=> b!1531140 (=> (not res!1047361) (not e!853504))))

(declare-datatypes ((array!101707 0))(
  ( (array!101708 (arr!49072 (Array (_ BitVec 32) (_ BitVec 64))) (size!49623 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101707)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101707 (_ BitVec 32)) Bool)

(assert (=> b!1531140 (= res!1047361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531141 () Bool)

(declare-fun e!853506 () Bool)

(assert (=> b!1531141 (= e!853504 e!853506)))

(declare-fun res!1047369 () Bool)

(assert (=> b!1531141 (=> (not res!1047369) (not e!853506))))

(declare-datatypes ((SeekEntryResult!13130 0))(
  ( (MissingZero!13130 (index!54915 (_ BitVec 32))) (Found!13130 (index!54916 (_ BitVec 32))) (Intermediate!13130 (undefined!13942 Bool) (index!54917 (_ BitVec 32)) (x!136816 (_ BitVec 32))) (Undefined!13130) (MissingVacant!13130 (index!54918 (_ BitVec 32))) )
))
(declare-fun lt!663111 () SeekEntryResult!13130)

(declare-fun lt!663114 () SeekEntryResult!13130)

(assert (=> b!1531141 (= res!1047369 (= lt!663111 lt!663114))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1531141 (= lt!663114 (Intermediate!13130 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101707 (_ BitVec 32)) SeekEntryResult!13130)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531141 (= lt!663111 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49072 a!2804) j!70) mask!2512) (select (arr!49072 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531142 () Bool)

(declare-fun res!1047364 () Bool)

(assert (=> b!1531142 (=> (not res!1047364) (not e!853504))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1531142 (= res!1047364 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49623 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49623 a!2804))))))

(declare-fun b!1531143 () Bool)

(declare-fun e!853503 () Bool)

(assert (=> b!1531143 (= e!853506 (not e!853503))))

(declare-fun res!1047371 () Bool)

(assert (=> b!1531143 (=> res!1047371 e!853503)))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1531143 (= res!1047371 (or (not (= (select (arr!49072 a!2804) j!70) (select (store (arr!49072 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!853507 () Bool)

(assert (=> b!1531143 e!853507))

(declare-fun res!1047368 () Bool)

(assert (=> b!1531143 (=> (not res!1047368) (not e!853507))))

(assert (=> b!1531143 (= res!1047368 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51079 0))(
  ( (Unit!51080) )
))
(declare-fun lt!663112 () Unit!51079)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101707 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51079)

(assert (=> b!1531143 (= lt!663112 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531144 () Bool)

(declare-fun res!1047372 () Bool)

(assert (=> b!1531144 (=> (not res!1047372) (not e!853504))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531144 (= res!1047372 (validKeyInArray!0 (select (arr!49072 a!2804) j!70)))))

(declare-fun b!1531145 () Bool)

(declare-fun res!1047365 () Bool)

(assert (=> b!1531145 (=> (not res!1047365) (not e!853504))))

(assert (=> b!1531145 (= res!1047365 (validKeyInArray!0 (select (arr!49072 a!2804) i!961)))))

(declare-fun res!1047367 () Bool)

(assert (=> start!130620 (=> (not res!1047367) (not e!853504))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130620 (= res!1047367 (validMask!0 mask!2512))))

(assert (=> start!130620 e!853504))

(assert (=> start!130620 true))

(declare-fun array_inv!38353 (array!101707) Bool)

(assert (=> start!130620 (array_inv!38353 a!2804)))

(declare-fun b!1531146 () Bool)

(declare-fun res!1047370 () Bool)

(assert (=> b!1531146 (=> (not res!1047370) (not e!853506))))

(assert (=> b!1531146 (= res!1047370 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49072 a!2804) j!70) a!2804 mask!2512) lt!663114))))

(declare-fun b!1531147 () Bool)

(declare-fun res!1047366 () Bool)

(assert (=> b!1531147 (=> (not res!1047366) (not e!853506))))

(assert (=> b!1531147 (= res!1047366 (= lt!663111 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49072 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49072 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101708 (store (arr!49072 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49623 a!2804)) mask!2512)))))

(declare-fun b!1531148 () Bool)

(declare-fun res!1047362 () Bool)

(assert (=> b!1531148 (=> (not res!1047362) (not e!853504))))

(assert (=> b!1531148 (= res!1047362 (and (= (size!49623 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49623 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49623 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531149 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101707 (_ BitVec 32)) SeekEntryResult!13130)

(assert (=> b!1531149 (= e!853507 (= (seekEntry!0 (select (arr!49072 a!2804) j!70) a!2804 mask!2512) (Found!13130 j!70)))))

(declare-fun b!1531150 () Bool)

(assert (=> b!1531150 (= e!853503 true)))

(declare-fun lt!663113 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531150 (= lt!663113 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1531151 () Bool)

(declare-fun res!1047363 () Bool)

(assert (=> b!1531151 (=> (not res!1047363) (not e!853504))))

(declare-datatypes ((List!35542 0))(
  ( (Nil!35539) (Cons!35538 (h!36992 (_ BitVec 64)) (t!50228 List!35542)) )
))
(declare-fun arrayNoDuplicates!0 (array!101707 (_ BitVec 32) List!35542) Bool)

(assert (=> b!1531151 (= res!1047363 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35539))))

(assert (= (and start!130620 res!1047367) b!1531148))

(assert (= (and b!1531148 res!1047362) b!1531145))

(assert (= (and b!1531145 res!1047365) b!1531144))

(assert (= (and b!1531144 res!1047372) b!1531140))

(assert (= (and b!1531140 res!1047361) b!1531151))

(assert (= (and b!1531151 res!1047363) b!1531142))

(assert (= (and b!1531142 res!1047364) b!1531141))

(assert (= (and b!1531141 res!1047369) b!1531146))

(assert (= (and b!1531146 res!1047370) b!1531147))

(assert (= (and b!1531147 res!1047366) b!1531143))

(assert (= (and b!1531143 res!1047368) b!1531149))

(assert (= (and b!1531143 (not res!1047371)) b!1531150))

(declare-fun m!1413901 () Bool)

(assert (=> b!1531150 m!1413901))

(declare-fun m!1413903 () Bool)

(assert (=> b!1531140 m!1413903))

(declare-fun m!1413905 () Bool)

(assert (=> b!1531146 m!1413905))

(assert (=> b!1531146 m!1413905))

(declare-fun m!1413907 () Bool)

(assert (=> b!1531146 m!1413907))

(assert (=> b!1531141 m!1413905))

(assert (=> b!1531141 m!1413905))

(declare-fun m!1413909 () Bool)

(assert (=> b!1531141 m!1413909))

(assert (=> b!1531141 m!1413909))

(assert (=> b!1531141 m!1413905))

(declare-fun m!1413911 () Bool)

(assert (=> b!1531141 m!1413911))

(declare-fun m!1413913 () Bool)

(assert (=> b!1531147 m!1413913))

(declare-fun m!1413915 () Bool)

(assert (=> b!1531147 m!1413915))

(assert (=> b!1531147 m!1413915))

(declare-fun m!1413917 () Bool)

(assert (=> b!1531147 m!1413917))

(assert (=> b!1531147 m!1413917))

(assert (=> b!1531147 m!1413915))

(declare-fun m!1413919 () Bool)

(assert (=> b!1531147 m!1413919))

(assert (=> b!1531144 m!1413905))

(assert (=> b!1531144 m!1413905))

(declare-fun m!1413921 () Bool)

(assert (=> b!1531144 m!1413921))

(declare-fun m!1413923 () Bool)

(assert (=> start!130620 m!1413923))

(declare-fun m!1413925 () Bool)

(assert (=> start!130620 m!1413925))

(declare-fun m!1413927 () Bool)

(assert (=> b!1531151 m!1413927))

(assert (=> b!1531143 m!1413905))

(declare-fun m!1413929 () Bool)

(assert (=> b!1531143 m!1413929))

(assert (=> b!1531143 m!1413913))

(assert (=> b!1531143 m!1413915))

(declare-fun m!1413931 () Bool)

(assert (=> b!1531143 m!1413931))

(assert (=> b!1531149 m!1413905))

(assert (=> b!1531149 m!1413905))

(declare-fun m!1413933 () Bool)

(assert (=> b!1531149 m!1413933))

(declare-fun m!1413935 () Bool)

(assert (=> b!1531145 m!1413935))

(assert (=> b!1531145 m!1413935))

(declare-fun m!1413937 () Bool)

(assert (=> b!1531145 m!1413937))

(check-sat (not b!1531147) (not start!130620) (not b!1531150) (not b!1531145) (not b!1531144) (not b!1531141) (not b!1531151) (not b!1531143) (not b!1531146) (not b!1531140) (not b!1531149))
(check-sat)
