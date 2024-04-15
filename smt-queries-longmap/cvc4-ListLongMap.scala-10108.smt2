; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119140 () Bool)

(assert start!119140)

(declare-fun b!1389820 () Bool)

(declare-fun res!930036 () Bool)

(declare-fun e!787157 () Bool)

(assert (=> b!1389820 (=> (not res!930036) (not e!787157))))

(declare-datatypes ((array!95030 0))(
  ( (array!95031 (arr!45881 (Array (_ BitVec 32) (_ BitVec 64))) (size!46433 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95030)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389820 (= res!930036 (validKeyInArray!0 (select (arr!45881 a!2901) j!112)))))

(declare-fun b!1389821 () Bool)

(declare-fun res!930032 () Bool)

(assert (=> b!1389821 (=> (not res!930032) (not e!787157))))

(declare-datatypes ((List!32478 0))(
  ( (Nil!32475) (Cons!32474 (h!33692 (_ BitVec 64)) (t!47164 List!32478)) )
))
(declare-fun arrayNoDuplicates!0 (array!95030 (_ BitVec 32) List!32478) Bool)

(assert (=> b!1389821 (= res!930032 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32475))))

(declare-fun b!1389822 () Bool)

(declare-fun res!930034 () Bool)

(assert (=> b!1389822 (=> (not res!930034) (not e!787157))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95030 (_ BitVec 32)) Bool)

(assert (=> b!1389822 (= res!930034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389823 () Bool)

(declare-fun res!930035 () Bool)

(assert (=> b!1389823 (=> (not res!930035) (not e!787157))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1389823 (= res!930035 (validKeyInArray!0 (select (arr!45881 a!2901) i!1037)))))

(declare-fun b!1389824 () Bool)

(assert (=> b!1389824 (= e!787157 (not true))))

(assert (=> b!1389824 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46295 0))(
  ( (Unit!46296) )
))
(declare-fun lt!610478 () Unit!46295)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95030 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46295)

(assert (=> b!1389824 (= lt!610478 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10224 0))(
  ( (MissingZero!10224 (index!43267 (_ BitVec 32))) (Found!10224 (index!43268 (_ BitVec 32))) (Intermediate!10224 (undefined!11036 Bool) (index!43269 (_ BitVec 32)) (x!124947 (_ BitVec 32))) (Undefined!10224) (MissingVacant!10224 (index!43270 (_ BitVec 32))) )
))
(declare-fun lt!610477 () SeekEntryResult!10224)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95030 (_ BitVec 32)) SeekEntryResult!10224)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389824 (= lt!610477 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45881 a!2901) j!112) mask!2840) (select (arr!45881 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!930033 () Bool)

(assert (=> start!119140 (=> (not res!930033) (not e!787157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119140 (= res!930033 (validMask!0 mask!2840))))

(assert (=> start!119140 e!787157))

(assert (=> start!119140 true))

(declare-fun array_inv!35114 (array!95030) Bool)

(assert (=> start!119140 (array_inv!35114 a!2901)))

(declare-fun b!1389825 () Bool)

(declare-fun res!930037 () Bool)

(assert (=> b!1389825 (=> (not res!930037) (not e!787157))))

(assert (=> b!1389825 (= res!930037 (and (= (size!46433 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46433 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46433 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119140 res!930033) b!1389825))

(assert (= (and b!1389825 res!930037) b!1389823))

(assert (= (and b!1389823 res!930035) b!1389820))

(assert (= (and b!1389820 res!930036) b!1389822))

(assert (= (and b!1389822 res!930034) b!1389821))

(assert (= (and b!1389821 res!930032) b!1389824))

(declare-fun m!1275079 () Bool)

(assert (=> b!1389820 m!1275079))

(assert (=> b!1389820 m!1275079))

(declare-fun m!1275081 () Bool)

(assert (=> b!1389820 m!1275081))

(declare-fun m!1275083 () Bool)

(assert (=> b!1389823 m!1275083))

(assert (=> b!1389823 m!1275083))

(declare-fun m!1275085 () Bool)

(assert (=> b!1389823 m!1275085))

(assert (=> b!1389824 m!1275079))

(declare-fun m!1275087 () Bool)

(assert (=> b!1389824 m!1275087))

(assert (=> b!1389824 m!1275079))

(declare-fun m!1275089 () Bool)

(assert (=> b!1389824 m!1275089))

(assert (=> b!1389824 m!1275087))

(assert (=> b!1389824 m!1275079))

(declare-fun m!1275091 () Bool)

(assert (=> b!1389824 m!1275091))

(declare-fun m!1275093 () Bool)

(assert (=> b!1389824 m!1275093))

(declare-fun m!1275095 () Bool)

(assert (=> b!1389822 m!1275095))

(declare-fun m!1275097 () Bool)

(assert (=> b!1389821 m!1275097))

(declare-fun m!1275099 () Bool)

(assert (=> start!119140 m!1275099))

(declare-fun m!1275101 () Bool)

(assert (=> start!119140 m!1275101))

(push 1)

(assert (not start!119140))

(assert (not b!1389823))

(assert (not b!1389824))

(assert (not b!1389822))

(assert (not b!1389820))

(assert (not b!1389821))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

