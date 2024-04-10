; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128920 () Bool)

(assert start!128920)

(declare-fun b!1511170 () Bool)

(declare-fun e!843727 () Bool)

(declare-fun e!843726 () Bool)

(assert (=> b!1511170 (= e!843727 e!843726)))

(declare-fun res!1031083 () Bool)

(assert (=> b!1511170 (=> (not res!1031083) (not e!843726))))

(declare-datatypes ((SeekEntryResult!12796 0))(
  ( (MissingZero!12796 (index!53579 (_ BitVec 32))) (Found!12796 (index!53580 (_ BitVec 32))) (Intermediate!12796 (undefined!13608 Bool) (index!53581 (_ BitVec 32)) (x!135314 (_ BitVec 32))) (Undefined!12796) (MissingVacant!12796 (index!53582 (_ BitVec 32))) )
))
(declare-fun lt!655369 () SeekEntryResult!12796)

(declare-fun lt!655367 () SeekEntryResult!12796)

(assert (=> b!1511170 (= res!1031083 (= lt!655369 lt!655367))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1511170 (= lt!655367 (Intermediate!12796 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100776 0))(
  ( (array!100777 (arr!48625 (Array (_ BitVec 32) (_ BitVec 64))) (size!49175 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100776)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100776 (_ BitVec 32)) SeekEntryResult!12796)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511170 (= lt!655369 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48625 a!2804) j!70) mask!2512) (select (arr!48625 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511171 () Bool)

(declare-fun res!1031078 () Bool)

(assert (=> b!1511171 (=> (not res!1031078) (not e!843726))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1511171 (= res!1031078 (= lt!655369 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48625 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48625 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100777 (store (arr!48625 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49175 a!2804)) mask!2512)))))

(declare-fun b!1511172 () Bool)

(declare-fun res!1031079 () Bool)

(assert (=> b!1511172 (=> (not res!1031079) (not e!843727))))

(declare-datatypes ((List!35108 0))(
  ( (Nil!35105) (Cons!35104 (h!36516 (_ BitVec 64)) (t!49802 List!35108)) )
))
(declare-fun arrayNoDuplicates!0 (array!100776 (_ BitVec 32) List!35108) Bool)

(assert (=> b!1511172 (= res!1031079 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35105))))

(declare-fun b!1511173 () Bool)

(declare-fun res!1031082 () Bool)

(assert (=> b!1511173 (=> (not res!1031082) (not e!843726))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1511173 (= res!1031082 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48625 a!2804) j!70) a!2804 mask!2512) lt!655367))))

(declare-fun b!1511174 () Bool)

(declare-fun res!1031081 () Bool)

(assert (=> b!1511174 (=> (not res!1031081) (not e!843727))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100776 (_ BitVec 32)) Bool)

(assert (=> b!1511174 (= res!1031081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511175 () Bool)

(declare-fun res!1031080 () Bool)

(assert (=> b!1511175 (=> (not res!1031080) (not e!843727))))

(assert (=> b!1511175 (= res!1031080 (and (= (size!49175 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49175 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49175 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1031077 () Bool)

(assert (=> start!128920 (=> (not res!1031077) (not e!843727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128920 (= res!1031077 (validMask!0 mask!2512))))

(assert (=> start!128920 e!843727))

(assert (=> start!128920 true))

(declare-fun array_inv!37653 (array!100776) Bool)

(assert (=> start!128920 (array_inv!37653 a!2804)))

(declare-fun b!1511176 () Bool)

(declare-fun res!1031076 () Bool)

(assert (=> b!1511176 (=> (not res!1031076) (not e!843727))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511176 (= res!1031076 (validKeyInArray!0 (select (arr!48625 a!2804) j!70)))))

(declare-fun b!1511177 () Bool)

(assert (=> b!1511177 (= e!843726 (not (or (not (= (select (arr!48625 a!2804) j!70) (select (store (arr!48625 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48625 a!2804) index!487) (select (arr!48625 a!2804) j!70)) (not (= (select (arr!48625 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2512 #b00000000000000000000000000000000) (bvslt index!487 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(declare-fun e!843725 () Bool)

(assert (=> b!1511177 e!843725))

(declare-fun res!1031073 () Bool)

(assert (=> b!1511177 (=> (not res!1031073) (not e!843725))))

(assert (=> b!1511177 (= res!1031073 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50460 0))(
  ( (Unit!50461) )
))
(declare-fun lt!655368 () Unit!50460)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100776 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50460)

(assert (=> b!1511177 (= lt!655368 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511178 () Bool)

(declare-fun res!1031075 () Bool)

(assert (=> b!1511178 (=> (not res!1031075) (not e!843727))))

(assert (=> b!1511178 (= res!1031075 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49175 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49175 a!2804))))))

(declare-fun b!1511179 () Bool)

(declare-fun res!1031074 () Bool)

(assert (=> b!1511179 (=> (not res!1031074) (not e!843727))))

(assert (=> b!1511179 (= res!1031074 (validKeyInArray!0 (select (arr!48625 a!2804) i!961)))))

(declare-fun b!1511180 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100776 (_ BitVec 32)) SeekEntryResult!12796)

(assert (=> b!1511180 (= e!843725 (= (seekEntry!0 (select (arr!48625 a!2804) j!70) a!2804 mask!2512) (Found!12796 j!70)))))

(assert (= (and start!128920 res!1031077) b!1511175))

(assert (= (and b!1511175 res!1031080) b!1511179))

(assert (= (and b!1511179 res!1031074) b!1511176))

(assert (= (and b!1511176 res!1031076) b!1511174))

(assert (= (and b!1511174 res!1031081) b!1511172))

(assert (= (and b!1511172 res!1031079) b!1511178))

(assert (= (and b!1511178 res!1031075) b!1511170))

(assert (= (and b!1511170 res!1031083) b!1511173))

(assert (= (and b!1511173 res!1031082) b!1511171))

(assert (= (and b!1511171 res!1031078) b!1511177))

(assert (= (and b!1511177 res!1031073) b!1511180))

(declare-fun m!1393841 () Bool)

(assert (=> b!1511173 m!1393841))

(assert (=> b!1511173 m!1393841))

(declare-fun m!1393843 () Bool)

(assert (=> b!1511173 m!1393843))

(declare-fun m!1393845 () Bool)

(assert (=> b!1511174 m!1393845))

(assert (=> b!1511176 m!1393841))

(assert (=> b!1511176 m!1393841))

(declare-fun m!1393847 () Bool)

(assert (=> b!1511176 m!1393847))

(declare-fun m!1393849 () Bool)

(assert (=> b!1511172 m!1393849))

(assert (=> b!1511170 m!1393841))

(assert (=> b!1511170 m!1393841))

(declare-fun m!1393851 () Bool)

(assert (=> b!1511170 m!1393851))

(assert (=> b!1511170 m!1393851))

(assert (=> b!1511170 m!1393841))

(declare-fun m!1393853 () Bool)

(assert (=> b!1511170 m!1393853))

(assert (=> b!1511180 m!1393841))

(assert (=> b!1511180 m!1393841))

(declare-fun m!1393855 () Bool)

(assert (=> b!1511180 m!1393855))

(assert (=> b!1511177 m!1393841))

(declare-fun m!1393857 () Bool)

(assert (=> b!1511177 m!1393857))

(declare-fun m!1393859 () Bool)

(assert (=> b!1511177 m!1393859))

(declare-fun m!1393861 () Bool)

(assert (=> b!1511177 m!1393861))

(declare-fun m!1393863 () Bool)

(assert (=> b!1511177 m!1393863))

(declare-fun m!1393865 () Bool)

(assert (=> b!1511177 m!1393865))

(declare-fun m!1393867 () Bool)

(assert (=> start!128920 m!1393867))

(declare-fun m!1393869 () Bool)

(assert (=> start!128920 m!1393869))

(declare-fun m!1393871 () Bool)

(assert (=> b!1511179 m!1393871))

(assert (=> b!1511179 m!1393871))

(declare-fun m!1393873 () Bool)

(assert (=> b!1511179 m!1393873))

(assert (=> b!1511171 m!1393859))

(assert (=> b!1511171 m!1393863))

(assert (=> b!1511171 m!1393863))

(declare-fun m!1393875 () Bool)

(assert (=> b!1511171 m!1393875))

(assert (=> b!1511171 m!1393875))

(assert (=> b!1511171 m!1393863))

(declare-fun m!1393877 () Bool)

(assert (=> b!1511171 m!1393877))

(push 1)

(assert (not b!1511172))

(assert (not b!1511177))

(assert (not b!1511174))

(assert (not b!1511173))

(assert (not b!1511170))

(assert (not b!1511176))

(assert (not start!128920))

(assert (not b!1511179))

(assert (not b!1511180))

(assert (not b!1511171))

(check-sat)

(pop 1)

(push 1)

(check-sat)

