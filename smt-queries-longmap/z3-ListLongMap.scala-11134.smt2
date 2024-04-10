; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130102 () Bool)

(assert start!130102)

(declare-fun b!1527028 () Bool)

(declare-fun e!851131 () Bool)

(declare-fun e!851125 () Bool)

(assert (=> b!1527028 (= e!851131 e!851125)))

(declare-fun res!1045070 () Bool)

(assert (=> b!1527028 (=> (not res!1045070) (not e!851125))))

(declare-datatypes ((SeekEntryResult!13149 0))(
  ( (MissingZero!13149 (index!54991 (_ BitVec 32))) (Found!13149 (index!54992 (_ BitVec 32))) (Intermediate!13149 (undefined!13961 Bool) (index!54993 (_ BitVec 32)) (x!136683 (_ BitVec 32))) (Undefined!13149) (MissingVacant!13149 (index!54994 (_ BitVec 32))) )
))
(declare-fun lt!661288 () SeekEntryResult!13149)

(declare-fun lt!661284 () SeekEntryResult!13149)

(assert (=> b!1527028 (= res!1045070 (= lt!661288 lt!661284))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1527028 (= lt!661284 (Intermediate!13149 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101515 0))(
  ( (array!101516 (arr!48984 (Array (_ BitVec 32) (_ BitVec 64))) (size!49534 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101515)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101515 (_ BitVec 32)) SeekEntryResult!13149)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527028 (= lt!661288 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48984 a!2804) j!70) mask!2512) (select (arr!48984 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527029 () Bool)

(declare-fun res!1045072 () Bool)

(assert (=> b!1527029 (=> (not res!1045072) (not e!851131))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1527029 (= res!1045072 (validKeyInArray!0 (select (arr!48984 a!2804) i!961)))))

(declare-fun b!1527030 () Bool)

(declare-fun e!851130 () Bool)

(declare-fun e!851127 () Bool)

(assert (=> b!1527030 (= e!851130 e!851127)))

(declare-fun res!1045074 () Bool)

(assert (=> b!1527030 (=> res!1045074 e!851127)))

(declare-fun lt!661285 () (_ BitVec 64))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1527030 (= res!1045074 (or (not (= (select (arr!48984 a!2804) j!70) lt!661285)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48984 a!2804) index!487) (select (arr!48984 a!2804) j!70)) (not (= (select (arr!48984 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1527031 () Bool)

(declare-fun e!851128 () Bool)

(assert (=> b!1527031 (= e!851127 e!851128)))

(declare-fun res!1045075 () Bool)

(assert (=> b!1527031 (=> (not res!1045075) (not e!851128))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101515 (_ BitVec 32)) SeekEntryResult!13149)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101515 (_ BitVec 32)) SeekEntryResult!13149)

(assert (=> b!1527031 (= res!1045075 (= (seekEntryOrOpen!0 (select (arr!48984 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48984 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1527032 () Bool)

(declare-fun res!1045063 () Bool)

(assert (=> b!1527032 (=> (not res!1045063) (not e!851131))))

(assert (=> b!1527032 (= res!1045063 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49534 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49534 a!2804))))))

(declare-fun res!1045069 () Bool)

(assert (=> start!130102 (=> (not res!1045069) (not e!851131))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130102 (= res!1045069 (validMask!0 mask!2512))))

(assert (=> start!130102 e!851131))

(assert (=> start!130102 true))

(declare-fun array_inv!38012 (array!101515) Bool)

(assert (=> start!130102 (array_inv!38012 a!2804)))

(declare-fun b!1527033 () Bool)

(declare-fun e!851129 () Bool)

(assert (=> b!1527033 (= e!851129 (not true))))

(assert (=> b!1527033 e!851130))

(declare-fun res!1045071 () Bool)

(assert (=> b!1527033 (=> (not res!1045071) (not e!851130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101515 (_ BitVec 32)) Bool)

(assert (=> b!1527033 (= res!1045071 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51082 0))(
  ( (Unit!51083) )
))
(declare-fun lt!661286 () Unit!51082)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101515 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51082)

(assert (=> b!1527033 (= lt!661286 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1527034 () Bool)

(declare-fun res!1045064 () Bool)

(assert (=> b!1527034 (=> (not res!1045064) (not e!851131))))

(assert (=> b!1527034 (= res!1045064 (validKeyInArray!0 (select (arr!48984 a!2804) j!70)))))

(declare-fun b!1527035 () Bool)

(declare-fun res!1045065 () Bool)

(assert (=> b!1527035 (=> (not res!1045065) (not e!851130))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101515 (_ BitVec 32)) SeekEntryResult!13149)

(assert (=> b!1527035 (= res!1045065 (= (seekEntry!0 (select (arr!48984 a!2804) j!70) a!2804 mask!2512) (Found!13149 j!70)))))

(declare-fun b!1527036 () Bool)

(declare-fun res!1045066 () Bool)

(assert (=> b!1527036 (=> (not res!1045066) (not e!851131))))

(assert (=> b!1527036 (= res!1045066 (and (= (size!49534 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49534 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49534 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1527037 () Bool)

(declare-fun res!1045067 () Bool)

(assert (=> b!1527037 (=> (not res!1045067) (not e!851131))))

(assert (=> b!1527037 (= res!1045067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1527038 () Bool)

(assert (=> b!1527038 (= e!851125 e!851129)))

(declare-fun res!1045062 () Bool)

(assert (=> b!1527038 (=> (not res!1045062) (not e!851129))))

(declare-fun lt!661287 () array!101515)

(assert (=> b!1527038 (= res!1045062 (= lt!661288 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661285 mask!2512) lt!661285 lt!661287 mask!2512)))))

(assert (=> b!1527038 (= lt!661285 (select (store (arr!48984 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1527038 (= lt!661287 (array!101516 (store (arr!48984 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49534 a!2804)))))

(declare-fun b!1527039 () Bool)

(declare-fun res!1045068 () Bool)

(assert (=> b!1527039 (=> (not res!1045068) (not e!851125))))

(assert (=> b!1527039 (= res!1045068 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48984 a!2804) j!70) a!2804 mask!2512) lt!661284))))

(declare-fun b!1527040 () Bool)

(declare-fun res!1045073 () Bool)

(assert (=> b!1527040 (=> (not res!1045073) (not e!851131))))

(declare-datatypes ((List!35467 0))(
  ( (Nil!35464) (Cons!35463 (h!36896 (_ BitVec 64)) (t!50161 List!35467)) )
))
(declare-fun arrayNoDuplicates!0 (array!101515 (_ BitVec 32) List!35467) Bool)

(assert (=> b!1527040 (= res!1045073 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35464))))

(declare-fun b!1527041 () Bool)

(assert (=> b!1527041 (= e!851128 (= (seekEntryOrOpen!0 lt!661285 lt!661287 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661285 lt!661287 mask!2512)))))

(assert (= (and start!130102 res!1045069) b!1527036))

(assert (= (and b!1527036 res!1045066) b!1527029))

(assert (= (and b!1527029 res!1045072) b!1527034))

(assert (= (and b!1527034 res!1045064) b!1527037))

(assert (= (and b!1527037 res!1045067) b!1527040))

(assert (= (and b!1527040 res!1045073) b!1527032))

(assert (= (and b!1527032 res!1045063) b!1527028))

(assert (= (and b!1527028 res!1045070) b!1527039))

(assert (= (and b!1527039 res!1045068) b!1527038))

(assert (= (and b!1527038 res!1045062) b!1527033))

(assert (= (and b!1527033 res!1045071) b!1527035))

(assert (= (and b!1527035 res!1045065) b!1527030))

(assert (= (and b!1527030 (not res!1045074)) b!1527031))

(assert (= (and b!1527031 res!1045075) b!1527041))

(declare-fun m!1409887 () Bool)

(assert (=> b!1527041 m!1409887))

(declare-fun m!1409889 () Bool)

(assert (=> b!1527041 m!1409889))

(declare-fun m!1409891 () Bool)

(assert (=> b!1527031 m!1409891))

(assert (=> b!1527031 m!1409891))

(declare-fun m!1409893 () Bool)

(assert (=> b!1527031 m!1409893))

(assert (=> b!1527031 m!1409891))

(declare-fun m!1409895 () Bool)

(assert (=> b!1527031 m!1409895))

(assert (=> b!1527039 m!1409891))

(assert (=> b!1527039 m!1409891))

(declare-fun m!1409897 () Bool)

(assert (=> b!1527039 m!1409897))

(assert (=> b!1527034 m!1409891))

(assert (=> b!1527034 m!1409891))

(declare-fun m!1409899 () Bool)

(assert (=> b!1527034 m!1409899))

(declare-fun m!1409901 () Bool)

(assert (=> b!1527040 m!1409901))

(assert (=> b!1527028 m!1409891))

(assert (=> b!1527028 m!1409891))

(declare-fun m!1409903 () Bool)

(assert (=> b!1527028 m!1409903))

(assert (=> b!1527028 m!1409903))

(assert (=> b!1527028 m!1409891))

(declare-fun m!1409905 () Bool)

(assert (=> b!1527028 m!1409905))

(declare-fun m!1409907 () Bool)

(assert (=> b!1527033 m!1409907))

(declare-fun m!1409909 () Bool)

(assert (=> b!1527033 m!1409909))

(assert (=> b!1527030 m!1409891))

(declare-fun m!1409911 () Bool)

(assert (=> b!1527030 m!1409911))

(declare-fun m!1409913 () Bool)

(assert (=> b!1527029 m!1409913))

(assert (=> b!1527029 m!1409913))

(declare-fun m!1409915 () Bool)

(assert (=> b!1527029 m!1409915))

(declare-fun m!1409917 () Bool)

(assert (=> b!1527038 m!1409917))

(assert (=> b!1527038 m!1409917))

(declare-fun m!1409919 () Bool)

(assert (=> b!1527038 m!1409919))

(declare-fun m!1409921 () Bool)

(assert (=> b!1527038 m!1409921))

(declare-fun m!1409923 () Bool)

(assert (=> b!1527038 m!1409923))

(assert (=> b!1527035 m!1409891))

(assert (=> b!1527035 m!1409891))

(declare-fun m!1409925 () Bool)

(assert (=> b!1527035 m!1409925))

(declare-fun m!1409927 () Bool)

(assert (=> start!130102 m!1409927))

(declare-fun m!1409929 () Bool)

(assert (=> start!130102 m!1409929))

(declare-fun m!1409931 () Bool)

(assert (=> b!1527037 m!1409931))

(check-sat (not b!1527033) (not b!1527031) (not b!1527035) (not start!130102) (not b!1527037) (not b!1527039) (not b!1527029) (not b!1527041) (not b!1527038) (not b!1527028) (not b!1527040) (not b!1527034))
(check-sat)
