; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120838 () Bool)

(assert start!120838)

(declare-fun res!944218 () Bool)

(declare-fun e!795824 () Bool)

(assert (=> start!120838 (=> (not res!944218) (not e!795824))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120838 (= res!944218 (validMask!0 mask!2840))))

(assert (=> start!120838 e!795824))

(assert (=> start!120838 true))

(declare-datatypes ((array!96145 0))(
  ( (array!96146 (arr!46420 (Array (_ BitVec 32) (_ BitVec 64))) (size!46970 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96145)

(declare-fun array_inv!35448 (array!96145) Bool)

(assert (=> start!120838 (array_inv!35448 a!2901)))

(declare-fun b!1406000 () Bool)

(declare-fun res!944220 () Bool)

(assert (=> b!1406000 (=> (not res!944220) (not e!795824))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406000 (= res!944220 (validKeyInArray!0 (select (arr!46420 a!2901) i!1037)))))

(declare-fun b!1406001 () Bool)

(declare-fun res!944223 () Bool)

(assert (=> b!1406001 (=> (not res!944223) (not e!795824))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1406001 (= res!944223 (validKeyInArray!0 (select (arr!46420 a!2901) j!112)))))

(declare-fun b!1406002 () Bool)

(declare-fun e!795821 () Bool)

(declare-datatypes ((SeekEntryResult!10731 0))(
  ( (MissingZero!10731 (index!45301 (_ BitVec 32))) (Found!10731 (index!45302 (_ BitVec 32))) (Intermediate!10731 (undefined!11543 Bool) (index!45303 (_ BitVec 32)) (x!126906 (_ BitVec 32))) (Undefined!10731) (MissingVacant!10731 (index!45304 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96145 (_ BitVec 32)) SeekEntryResult!10731)

(assert (=> b!1406002 (= e!795821 (= (seekEntryOrOpen!0 (select (arr!46420 a!2901) j!112) a!2901 mask!2840) (Found!10731 j!112)))))

(declare-fun b!1406003 () Bool)

(declare-fun e!795823 () Bool)

(assert (=> b!1406003 (= e!795823 true)))

(declare-fun lt!619220 () SeekEntryResult!10731)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96145 (_ BitVec 32)) SeekEntryResult!10731)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406003 (= lt!619220 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46420 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46420 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96146 (store (arr!46420 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46970 a!2901)) mask!2840))))

(declare-fun b!1406004 () Bool)

(declare-fun res!944219 () Bool)

(assert (=> b!1406004 (=> (not res!944219) (not e!795824))))

(assert (=> b!1406004 (= res!944219 (and (= (size!46970 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46970 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46970 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406005 () Bool)

(assert (=> b!1406005 (= e!795824 (not e!795823))))

(declare-fun res!944221 () Bool)

(assert (=> b!1406005 (=> res!944221 e!795823)))

(declare-fun lt!619221 () SeekEntryResult!10731)

(assert (=> b!1406005 (= res!944221 (or (not (is-Intermediate!10731 lt!619221)) (undefined!11543 lt!619221)))))

(assert (=> b!1406005 e!795821))

(declare-fun res!944224 () Bool)

(assert (=> b!1406005 (=> (not res!944224) (not e!795821))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96145 (_ BitVec 32)) Bool)

(assert (=> b!1406005 (= res!944224 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47436 0))(
  ( (Unit!47437) )
))
(declare-fun lt!619219 () Unit!47436)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96145 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47436)

(assert (=> b!1406005 (= lt!619219 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1406005 (= lt!619221 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46420 a!2901) j!112) mask!2840) (select (arr!46420 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406006 () Bool)

(declare-fun res!944217 () Bool)

(assert (=> b!1406006 (=> (not res!944217) (not e!795824))))

(assert (=> b!1406006 (= res!944217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406007 () Bool)

(declare-fun res!944222 () Bool)

(assert (=> b!1406007 (=> (not res!944222) (not e!795824))))

(declare-datatypes ((List!32939 0))(
  ( (Nil!32936) (Cons!32935 (h!34189 (_ BitVec 64)) (t!47633 List!32939)) )
))
(declare-fun arrayNoDuplicates!0 (array!96145 (_ BitVec 32) List!32939) Bool)

(assert (=> b!1406007 (= res!944222 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32936))))

(assert (= (and start!120838 res!944218) b!1406004))

(assert (= (and b!1406004 res!944219) b!1406000))

(assert (= (and b!1406000 res!944220) b!1406001))

(assert (= (and b!1406001 res!944223) b!1406006))

(assert (= (and b!1406006 res!944217) b!1406007))

(assert (= (and b!1406007 res!944222) b!1406005))

(assert (= (and b!1406005 res!944224) b!1406002))

(assert (= (and b!1406005 (not res!944221)) b!1406003))

(declare-fun m!1294961 () Bool)

(assert (=> b!1406002 m!1294961))

(assert (=> b!1406002 m!1294961))

(declare-fun m!1294963 () Bool)

(assert (=> b!1406002 m!1294963))

(declare-fun m!1294965 () Bool)

(assert (=> b!1406006 m!1294965))

(assert (=> b!1406005 m!1294961))

(declare-fun m!1294967 () Bool)

(assert (=> b!1406005 m!1294967))

(assert (=> b!1406005 m!1294961))

(declare-fun m!1294969 () Bool)

(assert (=> b!1406005 m!1294969))

(assert (=> b!1406005 m!1294967))

(assert (=> b!1406005 m!1294961))

(declare-fun m!1294971 () Bool)

(assert (=> b!1406005 m!1294971))

(declare-fun m!1294973 () Bool)

(assert (=> b!1406005 m!1294973))

(declare-fun m!1294975 () Bool)

(assert (=> b!1406007 m!1294975))

(declare-fun m!1294977 () Bool)

(assert (=> b!1406000 m!1294977))

(assert (=> b!1406000 m!1294977))

(declare-fun m!1294979 () Bool)

(assert (=> b!1406000 m!1294979))

(declare-fun m!1294981 () Bool)

(assert (=> start!120838 m!1294981))

(declare-fun m!1294983 () Bool)

(assert (=> start!120838 m!1294983))

(declare-fun m!1294985 () Bool)

(assert (=> b!1406003 m!1294985))

(declare-fun m!1294987 () Bool)

(assert (=> b!1406003 m!1294987))

(assert (=> b!1406003 m!1294987))

(declare-fun m!1294989 () Bool)

(assert (=> b!1406003 m!1294989))

(assert (=> b!1406003 m!1294989))

(assert (=> b!1406003 m!1294987))

(declare-fun m!1294991 () Bool)

(assert (=> b!1406003 m!1294991))

(assert (=> b!1406001 m!1294961))

(assert (=> b!1406001 m!1294961))

(declare-fun m!1294993 () Bool)

(assert (=> b!1406001 m!1294993))

(push 1)

(assert (not b!1406005))

(assert (not b!1406002))

(assert (not b!1406000))

(assert (not b!1406001))

(assert (not start!120838))

(assert (not b!1406006))

(assert (not b!1406007))

(assert (not b!1406003))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

