; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122280 () Bool)

(assert start!122280)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!802600 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1417922 () Bool)

(declare-datatypes ((array!96837 0))(
  ( (array!96838 (arr!46746 (Array (_ BitVec 32) (_ BitVec 64))) (size!47297 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96837)

(declare-datatypes ((SeekEntryResult!10960 0))(
  ( (MissingZero!10960 (index!46232 (_ BitVec 32))) (Found!10960 (index!46233 (_ BitVec 32))) (Intermediate!10960 (undefined!11772 Bool) (index!46234 (_ BitVec 32)) (x!127984 (_ BitVec 32))) (Undefined!10960) (MissingVacant!10960 (index!46235 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96837 (_ BitVec 32)) SeekEntryResult!10960)

(assert (=> b!1417922 (= e!802600 (= (seekEntryOrOpen!0 (select (arr!46746 a!2901) j!112) a!2901 mask!2840) (Found!10960 j!112)))))

(declare-fun b!1417923 () Bool)

(declare-fun e!802599 () Bool)

(assert (=> b!1417923 (= e!802599 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!625512 () SeekEntryResult!10960)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96837 (_ BitVec 32)) SeekEntryResult!10960)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417923 (= lt!625512 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46746 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46746 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96838 (store (arr!46746 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47297 a!2901)) mask!2840))))

(declare-fun b!1417924 () Bool)

(declare-fun res!953117 () Bool)

(declare-fun e!802598 () Bool)

(assert (=> b!1417924 (=> (not res!953117) (not e!802598))))

(declare-datatypes ((List!33252 0))(
  ( (Nil!33249) (Cons!33248 (h!34546 (_ BitVec 64)) (t!47938 List!33252)) )
))
(declare-fun arrayNoDuplicates!0 (array!96837 (_ BitVec 32) List!33252) Bool)

(assert (=> b!1417924 (= res!953117 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33249))))

(declare-fun res!953116 () Bool)

(assert (=> start!122280 (=> (not res!953116) (not e!802598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122280 (= res!953116 (validMask!0 mask!2840))))

(assert (=> start!122280 e!802598))

(assert (=> start!122280 true))

(declare-fun array_inv!36027 (array!96837) Bool)

(assert (=> start!122280 (array_inv!36027 a!2901)))

(declare-fun b!1417925 () Bool)

(declare-fun res!953115 () Bool)

(assert (=> b!1417925 (=> (not res!953115) (not e!802598))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417925 (= res!953115 (validKeyInArray!0 (select (arr!46746 a!2901) i!1037)))))

(declare-fun b!1417926 () Bool)

(declare-fun res!953120 () Bool)

(assert (=> b!1417926 (=> (not res!953120) (not e!802598))))

(assert (=> b!1417926 (= res!953120 (validKeyInArray!0 (select (arr!46746 a!2901) j!112)))))

(declare-fun b!1417927 () Bool)

(assert (=> b!1417927 (= e!802598 (not e!802599))))

(declare-fun res!953122 () Bool)

(assert (=> b!1417927 (=> res!953122 e!802599)))

(declare-fun lt!625513 () SeekEntryResult!10960)

(assert (=> b!1417927 (= res!953122 (or (not (is-Intermediate!10960 lt!625513)) (undefined!11772 lt!625513)))))

(assert (=> b!1417927 e!802600))

(declare-fun res!953121 () Bool)

(assert (=> b!1417927 (=> (not res!953121) (not e!802600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96837 (_ BitVec 32)) Bool)

(assert (=> b!1417927 (= res!953121 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47921 0))(
  ( (Unit!47922) )
))
(declare-fun lt!625514 () Unit!47921)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96837 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47921)

(assert (=> b!1417927 (= lt!625514 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1417927 (= lt!625513 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46746 a!2901) j!112) mask!2840) (select (arr!46746 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417928 () Bool)

(declare-fun res!953119 () Bool)

(assert (=> b!1417928 (=> (not res!953119) (not e!802598))))

(assert (=> b!1417928 (= res!953119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1417929 () Bool)

(declare-fun res!953118 () Bool)

(assert (=> b!1417929 (=> (not res!953118) (not e!802598))))

(assert (=> b!1417929 (= res!953118 (and (= (size!47297 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47297 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47297 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!122280 res!953116) b!1417929))

(assert (= (and b!1417929 res!953118) b!1417925))

(assert (= (and b!1417925 res!953115) b!1417926))

(assert (= (and b!1417926 res!953120) b!1417928))

(assert (= (and b!1417928 res!953119) b!1417924))

(assert (= (and b!1417924 res!953117) b!1417927))

(assert (= (and b!1417927 res!953121) b!1417922))

(assert (= (and b!1417927 (not res!953122)) b!1417923))

(declare-fun m!1308813 () Bool)

(assert (=> b!1417925 m!1308813))

(assert (=> b!1417925 m!1308813))

(declare-fun m!1308815 () Bool)

(assert (=> b!1417925 m!1308815))

(declare-fun m!1308817 () Bool)

(assert (=> b!1417922 m!1308817))

(assert (=> b!1417922 m!1308817))

(declare-fun m!1308819 () Bool)

(assert (=> b!1417922 m!1308819))

(assert (=> b!1417927 m!1308817))

(declare-fun m!1308821 () Bool)

(assert (=> b!1417927 m!1308821))

(assert (=> b!1417927 m!1308817))

(declare-fun m!1308823 () Bool)

(assert (=> b!1417927 m!1308823))

(assert (=> b!1417927 m!1308821))

(assert (=> b!1417927 m!1308817))

(declare-fun m!1308825 () Bool)

(assert (=> b!1417927 m!1308825))

(declare-fun m!1308827 () Bool)

(assert (=> b!1417927 m!1308827))

(declare-fun m!1308829 () Bool)

(assert (=> b!1417924 m!1308829))

(declare-fun m!1308831 () Bool)

(assert (=> b!1417923 m!1308831))

(declare-fun m!1308833 () Bool)

(assert (=> b!1417923 m!1308833))

(assert (=> b!1417923 m!1308833))

(declare-fun m!1308835 () Bool)

(assert (=> b!1417923 m!1308835))

(assert (=> b!1417923 m!1308835))

(assert (=> b!1417923 m!1308833))

(declare-fun m!1308837 () Bool)

(assert (=> b!1417923 m!1308837))

(declare-fun m!1308839 () Bool)

(assert (=> b!1417928 m!1308839))

(assert (=> b!1417926 m!1308817))

(assert (=> b!1417926 m!1308817))

(declare-fun m!1308841 () Bool)

(assert (=> b!1417926 m!1308841))

(declare-fun m!1308843 () Bool)

(assert (=> start!122280 m!1308843))

(declare-fun m!1308845 () Bool)

(assert (=> start!122280 m!1308845))

(push 1)

(assert (not b!1417925))

(assert (not b!1417924))

(assert (not b!1417922))

(assert (not b!1417927))

(assert (not b!1417928))

(assert (not start!122280))

(assert (not b!1417923))

(assert (not b!1417926))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

