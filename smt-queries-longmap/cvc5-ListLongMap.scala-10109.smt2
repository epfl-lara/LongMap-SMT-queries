; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119340 () Bool)

(assert start!119340)

(declare-fun b!1391113 () Bool)

(declare-fun res!930590 () Bool)

(declare-fun e!787958 () Bool)

(assert (=> b!1391113 (=> (not res!930590) (not e!787958))))

(declare-datatypes ((array!95199 0))(
  ( (array!95200 (arr!45963 (Array (_ BitVec 32) (_ BitVec 64))) (size!46514 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95199)

(declare-datatypes ((List!32469 0))(
  ( (Nil!32466) (Cons!32465 (h!33691 (_ BitVec 64)) (t!47155 List!32469)) )
))
(declare-fun arrayNoDuplicates!0 (array!95199 (_ BitVec 32) List!32469) Bool)

(assert (=> b!1391113 (= res!930590 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32466))))

(declare-fun b!1391114 () Bool)

(declare-fun res!930595 () Bool)

(assert (=> b!1391114 (=> (not res!930595) (not e!787958))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95199 (_ BitVec 32)) Bool)

(assert (=> b!1391114 (= res!930595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!930593 () Bool)

(assert (=> start!119340 (=> (not res!930593) (not e!787958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119340 (= res!930593 (validMask!0 mask!2840))))

(assert (=> start!119340 e!787958))

(assert (=> start!119340 true))

(declare-fun array_inv!35244 (array!95199) Bool)

(assert (=> start!119340 (array_inv!35244 a!2901)))

(declare-fun b!1391115 () Bool)

(assert (=> b!1391115 (= e!787958 (not true))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1391115 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46397 0))(
  ( (Unit!46398) )
))
(declare-fun lt!611089 () Unit!46397)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95199 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46397)

(assert (=> b!1391115 (= lt!611089 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10183 0))(
  ( (MissingZero!10183 (index!43103 (_ BitVec 32))) (Found!10183 (index!43104 (_ BitVec 32))) (Intermediate!10183 (undefined!10995 Bool) (index!43105 (_ BitVec 32)) (x!124936 (_ BitVec 32))) (Undefined!10183) (MissingVacant!10183 (index!43106 (_ BitVec 32))) )
))
(declare-fun lt!611090 () SeekEntryResult!10183)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95199 (_ BitVec 32)) SeekEntryResult!10183)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391115 (= lt!611090 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45963 a!2901) j!112) mask!2840) (select (arr!45963 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391116 () Bool)

(declare-fun res!930591 () Bool)

(assert (=> b!1391116 (=> (not res!930591) (not e!787958))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1391116 (= res!930591 (and (= (size!46514 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46514 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46514 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391117 () Bool)

(declare-fun res!930592 () Bool)

(assert (=> b!1391117 (=> (not res!930592) (not e!787958))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391117 (= res!930592 (validKeyInArray!0 (select (arr!45963 a!2901) j!112)))))

(declare-fun b!1391118 () Bool)

(declare-fun res!930594 () Bool)

(assert (=> b!1391118 (=> (not res!930594) (not e!787958))))

(assert (=> b!1391118 (= res!930594 (validKeyInArray!0 (select (arr!45963 a!2901) i!1037)))))

(assert (= (and start!119340 res!930593) b!1391116))

(assert (= (and b!1391116 res!930591) b!1391118))

(assert (= (and b!1391118 res!930594) b!1391117))

(assert (= (and b!1391117 res!930592) b!1391114))

(assert (= (and b!1391114 res!930595) b!1391113))

(assert (= (and b!1391113 res!930590) b!1391115))

(declare-fun m!1277083 () Bool)

(assert (=> b!1391117 m!1277083))

(assert (=> b!1391117 m!1277083))

(declare-fun m!1277085 () Bool)

(assert (=> b!1391117 m!1277085))

(assert (=> b!1391115 m!1277083))

(declare-fun m!1277087 () Bool)

(assert (=> b!1391115 m!1277087))

(assert (=> b!1391115 m!1277083))

(declare-fun m!1277089 () Bool)

(assert (=> b!1391115 m!1277089))

(assert (=> b!1391115 m!1277087))

(assert (=> b!1391115 m!1277083))

(declare-fun m!1277091 () Bool)

(assert (=> b!1391115 m!1277091))

(declare-fun m!1277093 () Bool)

(assert (=> b!1391115 m!1277093))

(declare-fun m!1277095 () Bool)

(assert (=> b!1391113 m!1277095))

(declare-fun m!1277097 () Bool)

(assert (=> b!1391118 m!1277097))

(assert (=> b!1391118 m!1277097))

(declare-fun m!1277099 () Bool)

(assert (=> b!1391118 m!1277099))

(declare-fun m!1277101 () Bool)

(assert (=> start!119340 m!1277101))

(declare-fun m!1277103 () Bool)

(assert (=> start!119340 m!1277103))

(declare-fun m!1277105 () Bool)

(assert (=> b!1391114 m!1277105))

(push 1)

(assert (not b!1391117))

(assert (not start!119340))

(assert (not b!1391113))

(assert (not b!1391115))

(assert (not b!1391118))

(assert (not b!1391114))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

