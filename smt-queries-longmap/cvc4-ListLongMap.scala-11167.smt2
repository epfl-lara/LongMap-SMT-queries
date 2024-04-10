; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130548 () Bool)

(assert start!130548)

(declare-fun b!1532167 () Bool)

(declare-fun res!1049313 () Bool)

(declare-fun e!853695 () Bool)

(assert (=> b!1532167 (=> (not res!1049313) (not e!853695))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101727 0))(
  ( (array!101728 (arr!49084 (Array (_ BitVec 32) (_ BitVec 64))) (size!49634 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101727)

(assert (=> b!1532167 (= res!1049313 (and (= (size!49634 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49634 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49634 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1532168 () Bool)

(declare-fun res!1049315 () Bool)

(assert (=> b!1532168 (=> (not res!1049315) (not e!853695))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532168 (= res!1049315 (validKeyInArray!0 (select (arr!49084 a!2804) j!70)))))

(declare-fun res!1049307 () Bool)

(assert (=> start!130548 (=> (not res!1049307) (not e!853695))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130548 (= res!1049307 (validMask!0 mask!2512))))

(assert (=> start!130548 e!853695))

(assert (=> start!130548 true))

(declare-fun array_inv!38112 (array!101727) Bool)

(assert (=> start!130548 (array_inv!38112 a!2804)))

(declare-fun b!1532169 () Bool)

(declare-fun e!853694 () Bool)

(declare-fun e!853696 () Bool)

(assert (=> b!1532169 (= e!853694 e!853696)))

(declare-fun res!1049320 () Bool)

(assert (=> b!1532169 (=> res!1049320 e!853696)))

(declare-fun lt!663569 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1532169 (= res!1049320 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663569 #b00000000000000000000000000000000) (bvsge lt!663569 (size!49634 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1532169 (= lt!663569 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1532170 () Bool)

(declare-fun res!1049308 () Bool)

(assert (=> b!1532170 (=> (not res!1049308) (not e!853695))))

(assert (=> b!1532170 (= res!1049308 (validKeyInArray!0 (select (arr!49084 a!2804) i!961)))))

(declare-fun b!1532171 () Bool)

(declare-fun res!1049310 () Bool)

(assert (=> b!1532171 (=> (not res!1049310) (not e!853695))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1532171 (= res!1049310 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49634 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49634 a!2804))))))

(declare-fun b!1532172 () Bool)

(declare-fun res!1049311 () Bool)

(assert (=> b!1532172 (=> res!1049311 e!853696)))

(declare-datatypes ((SeekEntryResult!13249 0))(
  ( (MissingZero!13249 (index!55391 (_ BitVec 32))) (Found!13249 (index!55392 (_ BitVec 32))) (Intermediate!13249 (undefined!14061 Bool) (index!55393 (_ BitVec 32)) (x!137083 (_ BitVec 32))) (Undefined!13249) (MissingVacant!13249 (index!55394 (_ BitVec 32))) )
))
(declare-fun lt!663570 () SeekEntryResult!13249)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101727 (_ BitVec 32)) SeekEntryResult!13249)

(assert (=> b!1532172 (= res!1049311 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663569 (select (arr!49084 a!2804) j!70) a!2804 mask!2512) lt!663570)))))

(declare-fun b!1532173 () Bool)

(declare-fun res!1049312 () Bool)

(assert (=> b!1532173 (=> (not res!1049312) (not e!853695))))

(declare-datatypes ((List!35567 0))(
  ( (Nil!35564) (Cons!35563 (h!37008 (_ BitVec 64)) (t!50261 List!35567)) )
))
(declare-fun arrayNoDuplicates!0 (array!101727 (_ BitVec 32) List!35567) Bool)

(assert (=> b!1532173 (= res!1049312 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35564))))

(declare-fun b!1532174 () Bool)

(declare-fun e!853697 () Bool)

(assert (=> b!1532174 (= e!853697 (not e!853694))))

(declare-fun res!1049318 () Bool)

(assert (=> b!1532174 (=> res!1049318 e!853694)))

(declare-fun lt!663571 () (_ BitVec 64))

(assert (=> b!1532174 (= res!1049318 (or (not (= (select (arr!49084 a!2804) j!70) lt!663571)) (= x!534 resX!21)))))

(declare-fun e!853698 () Bool)

(assert (=> b!1532174 e!853698))

(declare-fun res!1049317 () Bool)

(assert (=> b!1532174 (=> (not res!1049317) (not e!853698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101727 (_ BitVec 32)) Bool)

(assert (=> b!1532174 (= res!1049317 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51282 0))(
  ( (Unit!51283) )
))
(declare-fun lt!663574 () Unit!51282)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101727 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51282)

(assert (=> b!1532174 (= lt!663574 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1532175 () Bool)

(assert (=> b!1532175 (= e!853696 true)))

(declare-fun lt!663573 () array!101727)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101727 (_ BitVec 32)) SeekEntryResult!13249)

(assert (=> b!1532175 (= (seekEntryOrOpen!0 (select (arr!49084 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!663571 lt!663573 mask!2512))))

(declare-fun lt!663572 () Unit!51282)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101727 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51282)

(assert (=> b!1532175 (= lt!663572 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!663569 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1532176 () Bool)

(declare-fun e!853699 () Bool)

(assert (=> b!1532176 (= e!853695 e!853699)))

(declare-fun res!1049314 () Bool)

(assert (=> b!1532176 (=> (not res!1049314) (not e!853699))))

(declare-fun lt!663568 () SeekEntryResult!13249)

(assert (=> b!1532176 (= res!1049314 (= lt!663568 lt!663570))))

(assert (=> b!1532176 (= lt!663570 (Intermediate!13249 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1532176 (= lt!663568 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49084 a!2804) j!70) mask!2512) (select (arr!49084 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1532177 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101727 (_ BitVec 32)) SeekEntryResult!13249)

(assert (=> b!1532177 (= e!853698 (= (seekEntry!0 (select (arr!49084 a!2804) j!70) a!2804 mask!2512) (Found!13249 j!70)))))

(declare-fun b!1532178 () Bool)

(declare-fun res!1049309 () Bool)

(assert (=> b!1532178 (=> (not res!1049309) (not e!853699))))

(assert (=> b!1532178 (= res!1049309 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49084 a!2804) j!70) a!2804 mask!2512) lt!663570))))

(declare-fun b!1532179 () Bool)

(assert (=> b!1532179 (= e!853699 e!853697)))

(declare-fun res!1049316 () Bool)

(assert (=> b!1532179 (=> (not res!1049316) (not e!853697))))

(assert (=> b!1532179 (= res!1049316 (= lt!663568 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!663571 mask!2512) lt!663571 lt!663573 mask!2512)))))

(assert (=> b!1532179 (= lt!663571 (select (store (arr!49084 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1532179 (= lt!663573 (array!101728 (store (arr!49084 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49634 a!2804)))))

(declare-fun b!1532180 () Bool)

(declare-fun res!1049319 () Bool)

(assert (=> b!1532180 (=> (not res!1049319) (not e!853695))))

(assert (=> b!1532180 (= res!1049319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!130548 res!1049307) b!1532167))

(assert (= (and b!1532167 res!1049313) b!1532170))

(assert (= (and b!1532170 res!1049308) b!1532168))

(assert (= (and b!1532168 res!1049315) b!1532180))

(assert (= (and b!1532180 res!1049319) b!1532173))

(assert (= (and b!1532173 res!1049312) b!1532171))

(assert (= (and b!1532171 res!1049310) b!1532176))

(assert (= (and b!1532176 res!1049314) b!1532178))

(assert (= (and b!1532178 res!1049309) b!1532179))

(assert (= (and b!1532179 res!1049316) b!1532174))

(assert (= (and b!1532174 res!1049317) b!1532177))

(assert (= (and b!1532174 (not res!1049318)) b!1532169))

(assert (= (and b!1532169 (not res!1049320)) b!1532172))

(assert (= (and b!1532172 (not res!1049311)) b!1532175))

(declare-fun m!1414865 () Bool)

(assert (=> b!1532174 m!1414865))

(declare-fun m!1414867 () Bool)

(assert (=> b!1532174 m!1414867))

(declare-fun m!1414869 () Bool)

(assert (=> b!1532174 m!1414869))

(declare-fun m!1414871 () Bool)

(assert (=> start!130548 m!1414871))

(declare-fun m!1414873 () Bool)

(assert (=> start!130548 m!1414873))

(declare-fun m!1414875 () Bool)

(assert (=> b!1532170 m!1414875))

(assert (=> b!1532170 m!1414875))

(declare-fun m!1414877 () Bool)

(assert (=> b!1532170 m!1414877))

(declare-fun m!1414879 () Bool)

(assert (=> b!1532179 m!1414879))

(assert (=> b!1532179 m!1414879))

(declare-fun m!1414881 () Bool)

(assert (=> b!1532179 m!1414881))

(declare-fun m!1414883 () Bool)

(assert (=> b!1532179 m!1414883))

(declare-fun m!1414885 () Bool)

(assert (=> b!1532179 m!1414885))

(assert (=> b!1532168 m!1414865))

(assert (=> b!1532168 m!1414865))

(declare-fun m!1414887 () Bool)

(assert (=> b!1532168 m!1414887))

(assert (=> b!1532175 m!1414865))

(assert (=> b!1532175 m!1414865))

(declare-fun m!1414889 () Bool)

(assert (=> b!1532175 m!1414889))

(declare-fun m!1414891 () Bool)

(assert (=> b!1532175 m!1414891))

(declare-fun m!1414893 () Bool)

(assert (=> b!1532175 m!1414893))

(declare-fun m!1414895 () Bool)

(assert (=> b!1532173 m!1414895))

(declare-fun m!1414897 () Bool)

(assert (=> b!1532169 m!1414897))

(assert (=> b!1532177 m!1414865))

(assert (=> b!1532177 m!1414865))

(declare-fun m!1414899 () Bool)

(assert (=> b!1532177 m!1414899))

(assert (=> b!1532172 m!1414865))

(assert (=> b!1532172 m!1414865))

(declare-fun m!1414901 () Bool)

(assert (=> b!1532172 m!1414901))

(assert (=> b!1532178 m!1414865))

(assert (=> b!1532178 m!1414865))

(declare-fun m!1414903 () Bool)

(assert (=> b!1532178 m!1414903))

(declare-fun m!1414905 () Bool)

(assert (=> b!1532180 m!1414905))

(assert (=> b!1532176 m!1414865))

(assert (=> b!1532176 m!1414865))

(declare-fun m!1414907 () Bool)

(assert (=> b!1532176 m!1414907))

(assert (=> b!1532176 m!1414907))

(assert (=> b!1532176 m!1414865))

(declare-fun m!1414909 () Bool)

(assert (=> b!1532176 m!1414909))

(push 1)

