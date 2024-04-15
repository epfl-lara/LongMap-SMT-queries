; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119130 () Bool)

(assert start!119130)

(declare-fun b!1389730 () Bool)

(declare-fun e!787127 () Bool)

(assert (=> b!1389730 (= e!787127 (not true))))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((array!95020 0))(
  ( (array!95021 (arr!45876 (Array (_ BitVec 32) (_ BitVec 64))) (size!46428 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95020)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95020 (_ BitVec 32)) Bool)

(assert (=> b!1389730 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46285 0))(
  ( (Unit!46286) )
))
(declare-fun lt!610447 () Unit!46285)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95020 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46285)

(assert (=> b!1389730 (= lt!610447 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10219 0))(
  ( (MissingZero!10219 (index!43247 (_ BitVec 32))) (Found!10219 (index!43248 (_ BitVec 32))) (Intermediate!10219 (undefined!11031 Bool) (index!43249 (_ BitVec 32)) (x!124926 (_ BitVec 32))) (Undefined!10219) (MissingVacant!10219 (index!43250 (_ BitVec 32))) )
))
(declare-fun lt!610448 () SeekEntryResult!10219)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95020 (_ BitVec 32)) SeekEntryResult!10219)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389730 (= lt!610448 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45876 a!2901) j!112) mask!2840) (select (arr!45876 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1389731 () Bool)

(declare-fun res!929945 () Bool)

(assert (=> b!1389731 (=> (not res!929945) (not e!787127))))

(assert (=> b!1389731 (= res!929945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389732 () Bool)

(declare-fun res!929942 () Bool)

(assert (=> b!1389732 (=> (not res!929942) (not e!787127))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1389732 (= res!929942 (and (= (size!46428 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46428 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46428 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389733 () Bool)

(declare-fun res!929946 () Bool)

(assert (=> b!1389733 (=> (not res!929946) (not e!787127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389733 (= res!929946 (validKeyInArray!0 (select (arr!45876 a!2901) j!112)))))

(declare-fun res!929943 () Bool)

(assert (=> start!119130 (=> (not res!929943) (not e!787127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119130 (= res!929943 (validMask!0 mask!2840))))

(assert (=> start!119130 e!787127))

(assert (=> start!119130 true))

(declare-fun array_inv!35109 (array!95020) Bool)

(assert (=> start!119130 (array_inv!35109 a!2901)))

(declare-fun b!1389734 () Bool)

(declare-fun res!929944 () Bool)

(assert (=> b!1389734 (=> (not res!929944) (not e!787127))))

(assert (=> b!1389734 (= res!929944 (validKeyInArray!0 (select (arr!45876 a!2901) i!1037)))))

(declare-fun b!1389735 () Bool)

(declare-fun res!929947 () Bool)

(assert (=> b!1389735 (=> (not res!929947) (not e!787127))))

(declare-datatypes ((List!32473 0))(
  ( (Nil!32470) (Cons!32469 (h!33687 (_ BitVec 64)) (t!47159 List!32473)) )
))
(declare-fun arrayNoDuplicates!0 (array!95020 (_ BitVec 32) List!32473) Bool)

(assert (=> b!1389735 (= res!929947 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32470))))

(assert (= (and start!119130 res!929943) b!1389732))

(assert (= (and b!1389732 res!929942) b!1389734))

(assert (= (and b!1389734 res!929944) b!1389733))

(assert (= (and b!1389733 res!929946) b!1389731))

(assert (= (and b!1389731 res!929945) b!1389735))

(assert (= (and b!1389735 res!929947) b!1389730))

(declare-fun m!1274959 () Bool)

(assert (=> b!1389735 m!1274959))

(declare-fun m!1274961 () Bool)

(assert (=> b!1389734 m!1274961))

(assert (=> b!1389734 m!1274961))

(declare-fun m!1274963 () Bool)

(assert (=> b!1389734 m!1274963))

(declare-fun m!1274965 () Bool)

(assert (=> b!1389731 m!1274965))

(declare-fun m!1274967 () Bool)

(assert (=> start!119130 m!1274967))

(declare-fun m!1274969 () Bool)

(assert (=> start!119130 m!1274969))

(declare-fun m!1274971 () Bool)

(assert (=> b!1389733 m!1274971))

(assert (=> b!1389733 m!1274971))

(declare-fun m!1274973 () Bool)

(assert (=> b!1389733 m!1274973))

(assert (=> b!1389730 m!1274971))

(declare-fun m!1274975 () Bool)

(assert (=> b!1389730 m!1274975))

(assert (=> b!1389730 m!1274971))

(declare-fun m!1274977 () Bool)

(assert (=> b!1389730 m!1274977))

(assert (=> b!1389730 m!1274975))

(assert (=> b!1389730 m!1274971))

(declare-fun m!1274979 () Bool)

(assert (=> b!1389730 m!1274979))

(declare-fun m!1274981 () Bool)

(assert (=> b!1389730 m!1274981))

(push 1)

(assert (not b!1389733))

(assert (not start!119130))

(assert (not b!1389731))

(assert (not b!1389730))

(assert (not b!1389734))

(assert (not b!1389735))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

