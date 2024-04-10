; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120090 () Bool)

(assert start!120090)

(declare-fun res!937091 () Bool)

(declare-fun e!791539 () Bool)

(assert (=> start!120090 (=> (not res!937091) (not e!791539))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120090 (= res!937091 (validMask!0 mask!2840))))

(assert (=> start!120090 e!791539))

(assert (=> start!120090 true))

(declare-datatypes ((array!95619 0))(
  ( (array!95620 (arr!46163 (Array (_ BitVec 32) (_ BitVec 64))) (size!46713 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95619)

(declare-fun array_inv!35191 (array!95619) Bool)

(assert (=> start!120090 (array_inv!35191 a!2901)))

(declare-fun b!1398175 () Bool)

(declare-fun res!937094 () Bool)

(assert (=> b!1398175 (=> (not res!937094) (not e!791539))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398175 (= res!937094 (validKeyInArray!0 (select (arr!46163 a!2901) i!1037)))))

(declare-fun b!1398176 () Bool)

(declare-fun e!791543 () Bool)

(assert (=> b!1398176 (= e!791539 (not e!791543))))

(declare-fun res!937088 () Bool)

(assert (=> b!1398176 (=> res!937088 e!791543)))

(declare-datatypes ((SeekEntryResult!10480 0))(
  ( (MissingZero!10480 (index!44291 (_ BitVec 32))) (Found!10480 (index!44292 (_ BitVec 32))) (Intermediate!10480 (undefined!11292 Bool) (index!44293 (_ BitVec 32)) (x!125942 (_ BitVec 32))) (Undefined!10480) (MissingVacant!10480 (index!44294 (_ BitVec 32))) )
))
(declare-fun lt!614760 () SeekEntryResult!10480)

(assert (=> b!1398176 (= res!937088 (or (not (is-Intermediate!10480 lt!614760)) (undefined!11292 lt!614760)))))

(declare-fun e!791540 () Bool)

(assert (=> b!1398176 e!791540))

(declare-fun res!937092 () Bool)

(assert (=> b!1398176 (=> (not res!937092) (not e!791540))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95619 (_ BitVec 32)) Bool)

(assert (=> b!1398176 (= res!937092 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46964 0))(
  ( (Unit!46965) )
))
(declare-fun lt!614759 () Unit!46964)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95619 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46964)

(assert (=> b!1398176 (= lt!614759 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614756 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95619 (_ BitVec 32)) SeekEntryResult!10480)

(assert (=> b!1398176 (= lt!614760 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614756 (select (arr!46163 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398176 (= lt!614756 (toIndex!0 (select (arr!46163 a!2901) j!112) mask!2840))))

(declare-fun b!1398177 () Bool)

(declare-fun res!937095 () Bool)

(assert (=> b!1398177 (=> (not res!937095) (not e!791539))))

(assert (=> b!1398177 (= res!937095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398178 () Bool)

(declare-fun res!937090 () Bool)

(assert (=> b!1398178 (=> (not res!937090) (not e!791539))))

(assert (=> b!1398178 (= res!937090 (validKeyInArray!0 (select (arr!46163 a!2901) j!112)))))

(declare-fun b!1398179 () Bool)

(declare-fun res!937089 () Bool)

(assert (=> b!1398179 (=> (not res!937089) (not e!791539))))

(declare-datatypes ((List!32682 0))(
  ( (Nil!32679) (Cons!32678 (h!33920 (_ BitVec 64)) (t!47376 List!32682)) )
))
(declare-fun arrayNoDuplicates!0 (array!95619 (_ BitVec 32) List!32682) Bool)

(assert (=> b!1398179 (= res!937089 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32679))))

(declare-fun b!1398180 () Bool)

(declare-fun e!791542 () Bool)

(assert (=> b!1398180 (= e!791542 true)))

(declare-fun lt!614755 () SeekEntryResult!10480)

(assert (=> b!1398180 (and (not (undefined!11292 lt!614755)) (= (index!44293 lt!614755) i!1037) (bvslt (x!125942 lt!614755) (x!125942 lt!614760)) (= (select (store (arr!46163 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44293 lt!614755)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!614757 () Unit!46964)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95619 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46964)

(assert (=> b!1398180 (= lt!614757 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614756 (x!125942 lt!614760) (index!44293 lt!614760) (x!125942 lt!614755) (index!44293 lt!614755) (undefined!11292 lt!614755) mask!2840))))

(declare-fun b!1398181 () Bool)

(assert (=> b!1398181 (= e!791543 e!791542)))

(declare-fun res!937093 () Bool)

(assert (=> b!1398181 (=> res!937093 e!791542)))

(assert (=> b!1398181 (= res!937093 (or (= lt!614760 lt!614755) (not (is-Intermediate!10480 lt!614755))))))

(declare-fun lt!614758 () (_ BitVec 64))

(assert (=> b!1398181 (= lt!614755 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614758 mask!2840) lt!614758 (array!95620 (store (arr!46163 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46713 a!2901)) mask!2840))))

(assert (=> b!1398181 (= lt!614758 (select (store (arr!46163 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398182 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95619 (_ BitVec 32)) SeekEntryResult!10480)

(assert (=> b!1398182 (= e!791540 (= (seekEntryOrOpen!0 (select (arr!46163 a!2901) j!112) a!2901 mask!2840) (Found!10480 j!112)))))

(declare-fun b!1398183 () Bool)

(declare-fun res!937096 () Bool)

(assert (=> b!1398183 (=> (not res!937096) (not e!791539))))

(assert (=> b!1398183 (= res!937096 (and (= (size!46713 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46713 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46713 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120090 res!937091) b!1398183))

(assert (= (and b!1398183 res!937096) b!1398175))

(assert (= (and b!1398175 res!937094) b!1398178))

(assert (= (and b!1398178 res!937090) b!1398177))

(assert (= (and b!1398177 res!937095) b!1398179))

(assert (= (and b!1398179 res!937089) b!1398176))

(assert (= (and b!1398176 res!937092) b!1398182))

(assert (= (and b!1398176 (not res!937088)) b!1398181))

(assert (= (and b!1398181 (not res!937093)) b!1398180))

(declare-fun m!1285203 () Bool)

(assert (=> b!1398180 m!1285203))

(declare-fun m!1285205 () Bool)

(assert (=> b!1398180 m!1285205))

(declare-fun m!1285207 () Bool)

(assert (=> b!1398180 m!1285207))

(declare-fun m!1285209 () Bool)

(assert (=> b!1398182 m!1285209))

(assert (=> b!1398182 m!1285209))

(declare-fun m!1285211 () Bool)

(assert (=> b!1398182 m!1285211))

(declare-fun m!1285213 () Bool)

(assert (=> start!120090 m!1285213))

(declare-fun m!1285215 () Bool)

(assert (=> start!120090 m!1285215))

(declare-fun m!1285217 () Bool)

(assert (=> b!1398175 m!1285217))

(assert (=> b!1398175 m!1285217))

(declare-fun m!1285219 () Bool)

(assert (=> b!1398175 m!1285219))

(assert (=> b!1398176 m!1285209))

(declare-fun m!1285221 () Bool)

(assert (=> b!1398176 m!1285221))

(assert (=> b!1398176 m!1285209))

(declare-fun m!1285223 () Bool)

(assert (=> b!1398176 m!1285223))

(declare-fun m!1285225 () Bool)

(assert (=> b!1398176 m!1285225))

(assert (=> b!1398176 m!1285209))

(declare-fun m!1285227 () Bool)

(assert (=> b!1398176 m!1285227))

(declare-fun m!1285229 () Bool)

(assert (=> b!1398179 m!1285229))

(declare-fun m!1285231 () Bool)

(assert (=> b!1398181 m!1285231))

(assert (=> b!1398181 m!1285203))

(assert (=> b!1398181 m!1285231))

(declare-fun m!1285233 () Bool)

(assert (=> b!1398181 m!1285233))

(declare-fun m!1285235 () Bool)

(assert (=> b!1398181 m!1285235))

(declare-fun m!1285237 () Bool)

(assert (=> b!1398177 m!1285237))

(assert (=> b!1398178 m!1285209))

(assert (=> b!1398178 m!1285209))

(declare-fun m!1285239 () Bool)

(assert (=> b!1398178 m!1285239))

(push 1)

