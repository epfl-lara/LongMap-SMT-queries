; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119640 () Bool)

(assert start!119640)

(declare-fun b!1393586 () Bool)

(declare-fun res!933051 () Bool)

(declare-fun e!789092 () Bool)

(assert (=> b!1393586 (=> (not res!933051) (not e!789092))))

(declare-datatypes ((array!95275 0))(
  ( (array!95276 (arr!45996 (Array (_ BitVec 32) (_ BitVec 64))) (size!46548 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95275)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393586 (= res!933051 (validKeyInArray!0 (select (arr!45996 a!2901) i!1037)))))

(declare-fun res!933050 () Bool)

(assert (=> start!119640 (=> (not res!933050) (not e!789092))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119640 (= res!933050 (validMask!0 mask!2840))))

(assert (=> start!119640 e!789092))

(assert (=> start!119640 true))

(declare-fun array_inv!35229 (array!95275) Bool)

(assert (=> start!119640 (array_inv!35229 a!2901)))

(declare-fun b!1393587 () Bool)

(declare-fun res!933052 () Bool)

(assert (=> b!1393587 (=> (not res!933052) (not e!789092))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1393587 (= res!933052 (validKeyInArray!0 (select (arr!45996 a!2901) j!112)))))

(declare-fun b!1393588 () Bool)

(declare-fun res!933049 () Bool)

(assert (=> b!1393588 (=> (not res!933049) (not e!789092))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95275 (_ BitVec 32)) Bool)

(assert (=> b!1393588 (= res!933049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393589 () Bool)

(declare-fun res!933047 () Bool)

(assert (=> b!1393589 (=> (not res!933047) (not e!789092))))

(declare-datatypes ((List!32593 0))(
  ( (Nil!32590) (Cons!32589 (h!33822 (_ BitVec 64)) (t!47279 List!32593)) )
))
(declare-fun arrayNoDuplicates!0 (array!95275 (_ BitVec 32) List!32593) Bool)

(assert (=> b!1393589 (= res!933047 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32590))))

(declare-fun e!789095 () Bool)

(declare-fun b!1393590 () Bool)

(declare-datatypes ((SeekEntryResult!10339 0))(
  ( (MissingZero!10339 (index!43727 (_ BitVec 32))) (Found!10339 (index!43728 (_ BitVec 32))) (Intermediate!10339 (undefined!11151 Bool) (index!43729 (_ BitVec 32)) (x!125396 (_ BitVec 32))) (Undefined!10339) (MissingVacant!10339 (index!43730 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95275 (_ BitVec 32)) SeekEntryResult!10339)

(assert (=> b!1393590 (= e!789095 (= (seekEntryOrOpen!0 (select (arr!45996 a!2901) j!112) a!2901 mask!2840) (Found!10339 j!112)))))

(declare-fun b!1393591 () Bool)

(declare-fun e!789094 () Bool)

(assert (=> b!1393591 (= e!789092 (not e!789094))))

(declare-fun res!933048 () Bool)

(assert (=> b!1393591 (=> res!933048 e!789094)))

(declare-fun lt!611886 () SeekEntryResult!10339)

(assert (=> b!1393591 (= res!933048 (or (not (is-Intermediate!10339 lt!611886)) (undefined!11151 lt!611886)))))

(assert (=> b!1393591 e!789095))

(declare-fun res!933046 () Bool)

(assert (=> b!1393591 (=> (not res!933046) (not e!789095))))

(assert (=> b!1393591 (= res!933046 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46525 0))(
  ( (Unit!46526) )
))
(declare-fun lt!611888 () Unit!46525)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95275 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46525)

(assert (=> b!1393591 (= lt!611888 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95275 (_ BitVec 32)) SeekEntryResult!10339)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393591 (= lt!611886 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45996 a!2901) j!112) mask!2840) (select (arr!45996 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393592 () Bool)

(declare-fun res!933045 () Bool)

(assert (=> b!1393592 (=> (not res!933045) (not e!789092))))

(assert (=> b!1393592 (= res!933045 (and (= (size!46548 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46548 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46548 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393593 () Bool)

(assert (=> b!1393593 (= e!789094 true)))

(declare-fun lt!611887 () SeekEntryResult!10339)

(assert (=> b!1393593 (= lt!611887 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45996 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45996 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95276 (store (arr!45996 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46548 a!2901)) mask!2840))))

(assert (= (and start!119640 res!933050) b!1393592))

(assert (= (and b!1393592 res!933045) b!1393586))

(assert (= (and b!1393586 res!933051) b!1393587))

(assert (= (and b!1393587 res!933052) b!1393588))

(assert (= (and b!1393588 res!933049) b!1393589))

(assert (= (and b!1393589 res!933047) b!1393591))

(assert (= (and b!1393591 res!933046) b!1393590))

(assert (= (and b!1393591 (not res!933048)) b!1393593))

(declare-fun m!1279137 () Bool)

(assert (=> b!1393593 m!1279137))

(declare-fun m!1279139 () Bool)

(assert (=> b!1393593 m!1279139))

(assert (=> b!1393593 m!1279139))

(declare-fun m!1279141 () Bool)

(assert (=> b!1393593 m!1279141))

(assert (=> b!1393593 m!1279141))

(assert (=> b!1393593 m!1279139))

(declare-fun m!1279143 () Bool)

(assert (=> b!1393593 m!1279143))

(declare-fun m!1279145 () Bool)

(assert (=> b!1393591 m!1279145))

(declare-fun m!1279147 () Bool)

(assert (=> b!1393591 m!1279147))

(assert (=> b!1393591 m!1279145))

(declare-fun m!1279149 () Bool)

(assert (=> b!1393591 m!1279149))

(assert (=> b!1393591 m!1279147))

(assert (=> b!1393591 m!1279145))

(declare-fun m!1279151 () Bool)

(assert (=> b!1393591 m!1279151))

(declare-fun m!1279153 () Bool)

(assert (=> b!1393591 m!1279153))

(declare-fun m!1279155 () Bool)

(assert (=> b!1393586 m!1279155))

(assert (=> b!1393586 m!1279155))

(declare-fun m!1279157 () Bool)

(assert (=> b!1393586 m!1279157))

(declare-fun m!1279159 () Bool)

(assert (=> start!119640 m!1279159))

(declare-fun m!1279161 () Bool)

(assert (=> start!119640 m!1279161))

(declare-fun m!1279163 () Bool)

(assert (=> b!1393588 m!1279163))

(assert (=> b!1393590 m!1279145))

(assert (=> b!1393590 m!1279145))

(declare-fun m!1279165 () Bool)

(assert (=> b!1393590 m!1279165))

(declare-fun m!1279167 () Bool)

(assert (=> b!1393589 m!1279167))

(assert (=> b!1393587 m!1279145))

(assert (=> b!1393587 m!1279145))

(declare-fun m!1279169 () Bool)

(assert (=> b!1393587 m!1279169))

(push 1)

(assert (not b!1393591))

(assert (not b!1393587))

(assert (not start!119640))

(assert (not b!1393586))

(assert (not b!1393589))

(assert (not b!1393590))

(assert (not b!1393593))

(assert (not b!1393588))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

