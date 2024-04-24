; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130668 () Bool)

(assert start!130668)

(declare-fun b!1532004 () Bool)

(declare-fun res!1048225 () Bool)

(declare-fun e!853863 () Bool)

(assert (=> b!1532004 (=> (not res!1048225) (not e!853863))))

(declare-datatypes ((array!101755 0))(
  ( (array!101756 (arr!49096 (Array (_ BitVec 32) (_ BitVec 64))) (size!49647 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101755)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101755 (_ BitVec 32)) Bool)

(assert (=> b!1532004 (= res!1048225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1532005 () Bool)

(declare-fun res!1048228 () Bool)

(declare-fun e!853864 () Bool)

(assert (=> b!1532005 (=> (not res!1048228) (not e!853864))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13154 0))(
  ( (MissingZero!13154 (index!55011 (_ BitVec 32))) (Found!13154 (index!55012 (_ BitVec 32))) (Intermediate!13154 (undefined!13966 Bool) (index!55013 (_ BitVec 32)) (x!136904 (_ BitVec 32))) (Undefined!13154) (MissingVacant!13154 (index!55014 (_ BitVec 32))) )
))
(declare-fun lt!663401 () SeekEntryResult!13154)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101755 (_ BitVec 32)) SeekEntryResult!13154)

(assert (=> b!1532005 (= res!1048228 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49096 a!2804) j!70) a!2804 mask!2512) lt!663401))))

(declare-fun b!1532006 () Bool)

(declare-fun res!1048229 () Bool)

(assert (=> b!1532006 (=> (not res!1048229) (not e!853863))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1532006 (= res!1048229 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49647 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49647 a!2804))))))

(declare-fun b!1532007 () Bool)

(declare-fun e!853866 () Bool)

(assert (=> b!1532007 (= e!853864 (not e!853866))))

(declare-fun res!1048233 () Bool)

(assert (=> b!1532007 (=> res!1048233 e!853866)))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1532007 (= res!1048233 (or (not (= (select (arr!49096 a!2804) j!70) (select (store (arr!49096 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!853865 () Bool)

(assert (=> b!1532007 e!853865))

(declare-fun res!1048235 () Bool)

(assert (=> b!1532007 (=> (not res!1048235) (not e!853865))))

(assert (=> b!1532007 (= res!1048235 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51127 0))(
  ( (Unit!51128) )
))
(declare-fun lt!663400 () Unit!51127)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101755 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51127)

(assert (=> b!1532007 (= lt!663400 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1532008 () Bool)

(assert (=> b!1532008 (= e!853866 true)))

(declare-fun lt!663399 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1532008 (= lt!663399 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1532009 () Bool)

(declare-fun res!1048234 () Bool)

(assert (=> b!1532009 (=> (not res!1048234) (not e!853864))))

(declare-fun lt!663402 () SeekEntryResult!13154)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1532009 (= res!1048234 (= lt!663402 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49096 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49096 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101756 (store (arr!49096 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49647 a!2804)) mask!2512)))))

(declare-fun b!1532010 () Bool)

(declare-fun res!1048226 () Bool)

(assert (=> b!1532010 (=> (not res!1048226) (not e!853863))))

(declare-datatypes ((List!35566 0))(
  ( (Nil!35563) (Cons!35562 (h!37016 (_ BitVec 64)) (t!50252 List!35566)) )
))
(declare-fun arrayNoDuplicates!0 (array!101755 (_ BitVec 32) List!35566) Bool)

(assert (=> b!1532010 (= res!1048226 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35563))))

(declare-fun b!1532012 () Bool)

(assert (=> b!1532012 (= e!853863 e!853864)))

(declare-fun res!1048232 () Bool)

(assert (=> b!1532012 (=> (not res!1048232) (not e!853864))))

(assert (=> b!1532012 (= res!1048232 (= lt!663402 lt!663401))))

(assert (=> b!1532012 (= lt!663401 (Intermediate!13154 false resIndex!21 resX!21))))

(assert (=> b!1532012 (= lt!663402 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49096 a!2804) j!70) mask!2512) (select (arr!49096 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1532013 () Bool)

(declare-fun res!1048230 () Bool)

(assert (=> b!1532013 (=> (not res!1048230) (not e!853863))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532013 (= res!1048230 (validKeyInArray!0 (select (arr!49096 a!2804) i!961)))))

(declare-fun b!1532011 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101755 (_ BitVec 32)) SeekEntryResult!13154)

(assert (=> b!1532011 (= e!853865 (= (seekEntry!0 (select (arr!49096 a!2804) j!70) a!2804 mask!2512) (Found!13154 j!70)))))

(declare-fun res!1048236 () Bool)

(assert (=> start!130668 (=> (not res!1048236) (not e!853863))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130668 (= res!1048236 (validMask!0 mask!2512))))

(assert (=> start!130668 e!853863))

(assert (=> start!130668 true))

(declare-fun array_inv!38377 (array!101755) Bool)

(assert (=> start!130668 (array_inv!38377 a!2804)))

(declare-fun b!1532014 () Bool)

(declare-fun res!1048231 () Bool)

(assert (=> b!1532014 (=> (not res!1048231) (not e!853863))))

(assert (=> b!1532014 (= res!1048231 (validKeyInArray!0 (select (arr!49096 a!2804) j!70)))))

(declare-fun b!1532015 () Bool)

(declare-fun res!1048227 () Bool)

(assert (=> b!1532015 (=> (not res!1048227) (not e!853863))))

(assert (=> b!1532015 (= res!1048227 (and (= (size!49647 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49647 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49647 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!130668 res!1048236) b!1532015))

(assert (= (and b!1532015 res!1048227) b!1532013))

(assert (= (and b!1532013 res!1048230) b!1532014))

(assert (= (and b!1532014 res!1048231) b!1532004))

(assert (= (and b!1532004 res!1048225) b!1532010))

(assert (= (and b!1532010 res!1048226) b!1532006))

(assert (= (and b!1532006 res!1048229) b!1532012))

(assert (= (and b!1532012 res!1048232) b!1532005))

(assert (= (and b!1532005 res!1048228) b!1532009))

(assert (= (and b!1532009 res!1048234) b!1532007))

(assert (= (and b!1532007 res!1048235) b!1532011))

(assert (= (and b!1532007 (not res!1048233)) b!1532008))

(declare-fun m!1414813 () Bool)

(assert (=> b!1532011 m!1414813))

(assert (=> b!1532011 m!1414813))

(declare-fun m!1414815 () Bool)

(assert (=> b!1532011 m!1414815))

(declare-fun m!1414817 () Bool)

(assert (=> b!1532010 m!1414817))

(assert (=> b!1532005 m!1414813))

(assert (=> b!1532005 m!1414813))

(declare-fun m!1414819 () Bool)

(assert (=> b!1532005 m!1414819))

(declare-fun m!1414821 () Bool)

(assert (=> start!130668 m!1414821))

(declare-fun m!1414823 () Bool)

(assert (=> start!130668 m!1414823))

(declare-fun m!1414825 () Bool)

(assert (=> b!1532013 m!1414825))

(assert (=> b!1532013 m!1414825))

(declare-fun m!1414827 () Bool)

(assert (=> b!1532013 m!1414827))

(assert (=> b!1532012 m!1414813))

(assert (=> b!1532012 m!1414813))

(declare-fun m!1414829 () Bool)

(assert (=> b!1532012 m!1414829))

(assert (=> b!1532012 m!1414829))

(assert (=> b!1532012 m!1414813))

(declare-fun m!1414831 () Bool)

(assert (=> b!1532012 m!1414831))

(assert (=> b!1532014 m!1414813))

(assert (=> b!1532014 m!1414813))

(declare-fun m!1414833 () Bool)

(assert (=> b!1532014 m!1414833))

(declare-fun m!1414835 () Bool)

(assert (=> b!1532009 m!1414835))

(declare-fun m!1414837 () Bool)

(assert (=> b!1532009 m!1414837))

(assert (=> b!1532009 m!1414837))

(declare-fun m!1414839 () Bool)

(assert (=> b!1532009 m!1414839))

(assert (=> b!1532009 m!1414839))

(assert (=> b!1532009 m!1414837))

(declare-fun m!1414841 () Bool)

(assert (=> b!1532009 m!1414841))

(declare-fun m!1414843 () Bool)

(assert (=> b!1532008 m!1414843))

(assert (=> b!1532007 m!1414813))

(declare-fun m!1414845 () Bool)

(assert (=> b!1532007 m!1414845))

(assert (=> b!1532007 m!1414835))

(assert (=> b!1532007 m!1414837))

(declare-fun m!1414847 () Bool)

(assert (=> b!1532007 m!1414847))

(declare-fun m!1414849 () Bool)

(assert (=> b!1532004 m!1414849))

(check-sat (not b!1532004) (not b!1532013) (not b!1532009) (not start!130668) (not b!1532014) (not b!1532008) (not b!1532012) (not b!1532005) (not b!1532010) (not b!1532011) (not b!1532007))
(check-sat)
