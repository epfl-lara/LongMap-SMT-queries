; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119170 () Bool)

(assert start!119170)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95107 0))(
  ( (array!95108 (arr!45919 (Array (_ BitVec 32) (_ BitVec 64))) (size!46469 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95107)

(declare-fun b!1390161 () Bool)

(declare-fun e!787301 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10236 0))(
  ( (MissingZero!10236 (index!43315 (_ BitVec 32))) (Found!10236 (index!43316 (_ BitVec 32))) (Intermediate!10236 (undefined!11048 Bool) (index!43317 (_ BitVec 32)) (x!124994 (_ BitVec 32))) (Undefined!10236) (MissingVacant!10236 (index!43318 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95107 (_ BitVec 32)) SeekEntryResult!10236)

(assert (=> b!1390161 (= e!787301 (= (seekEntryOrOpen!0 (select (arr!45919 a!2901) j!112) a!2901 mask!2840) (Found!10236 j!112)))))

(declare-fun b!1390162 () Bool)

(declare-fun res!930328 () Bool)

(declare-fun e!787300 () Bool)

(assert (=> b!1390162 (=> (not res!930328) (not e!787300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390162 (= res!930328 (validKeyInArray!0 (select (arr!45919 a!2901) j!112)))))

(declare-fun b!1390163 () Bool)

(declare-fun res!930327 () Bool)

(assert (=> b!1390163 (=> (not res!930327) (not e!787300))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1390163 (= res!930327 (validKeyInArray!0 (select (arr!45919 a!2901) i!1037)))))

(declare-fun b!1390164 () Bool)

(assert (=> b!1390164 (= e!787300 (not true))))

(assert (=> b!1390164 e!787301))

(declare-fun res!930326 () Bool)

(assert (=> b!1390164 (=> (not res!930326) (not e!787301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95107 (_ BitVec 32)) Bool)

(assert (=> b!1390164 (= res!930326 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46476 0))(
  ( (Unit!46477) )
))
(declare-fun lt!610745 () Unit!46476)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95107 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46476)

(assert (=> b!1390164 (= lt!610745 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!610746 () SeekEntryResult!10236)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95107 (_ BitVec 32)) SeekEntryResult!10236)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390164 (= lt!610746 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45919 a!2901) j!112) mask!2840) (select (arr!45919 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390165 () Bool)

(declare-fun res!930323 () Bool)

(assert (=> b!1390165 (=> (not res!930323) (not e!787300))))

(declare-datatypes ((List!32438 0))(
  ( (Nil!32435) (Cons!32434 (h!33652 (_ BitVec 64)) (t!47132 List!32438)) )
))
(declare-fun arrayNoDuplicates!0 (array!95107 (_ BitVec 32) List!32438) Bool)

(assert (=> b!1390165 (= res!930323 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32435))))

(declare-fun b!1390167 () Bool)

(declare-fun res!930322 () Bool)

(assert (=> b!1390167 (=> (not res!930322) (not e!787300))))

(assert (=> b!1390167 (= res!930322 (and (= (size!46469 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46469 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46469 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!930325 () Bool)

(assert (=> start!119170 (=> (not res!930325) (not e!787300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119170 (= res!930325 (validMask!0 mask!2840))))

(assert (=> start!119170 e!787300))

(assert (=> start!119170 true))

(declare-fun array_inv!34947 (array!95107) Bool)

(assert (=> start!119170 (array_inv!34947 a!2901)))

(declare-fun b!1390166 () Bool)

(declare-fun res!930324 () Bool)

(assert (=> b!1390166 (=> (not res!930324) (not e!787300))))

(assert (=> b!1390166 (= res!930324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119170 res!930325) b!1390167))

(assert (= (and b!1390167 res!930322) b!1390163))

(assert (= (and b!1390163 res!930327) b!1390162))

(assert (= (and b!1390162 res!930328) b!1390166))

(assert (= (and b!1390166 res!930324) b!1390165))

(assert (= (and b!1390165 res!930323) b!1390164))

(assert (= (and b!1390164 res!930326) b!1390161))

(declare-fun m!1275943 () Bool)

(assert (=> b!1390162 m!1275943))

(assert (=> b!1390162 m!1275943))

(declare-fun m!1275945 () Bool)

(assert (=> b!1390162 m!1275945))

(assert (=> b!1390164 m!1275943))

(declare-fun m!1275947 () Bool)

(assert (=> b!1390164 m!1275947))

(assert (=> b!1390164 m!1275943))

(declare-fun m!1275949 () Bool)

(assert (=> b!1390164 m!1275949))

(assert (=> b!1390164 m!1275947))

(assert (=> b!1390164 m!1275943))

(declare-fun m!1275951 () Bool)

(assert (=> b!1390164 m!1275951))

(declare-fun m!1275953 () Bool)

(assert (=> b!1390164 m!1275953))

(declare-fun m!1275955 () Bool)

(assert (=> b!1390163 m!1275955))

(assert (=> b!1390163 m!1275955))

(declare-fun m!1275957 () Bool)

(assert (=> b!1390163 m!1275957))

(declare-fun m!1275959 () Bool)

(assert (=> b!1390165 m!1275959))

(declare-fun m!1275961 () Bool)

(assert (=> b!1390166 m!1275961))

(assert (=> b!1390161 m!1275943))

(assert (=> b!1390161 m!1275943))

(declare-fun m!1275963 () Bool)

(assert (=> b!1390161 m!1275963))

(declare-fun m!1275965 () Bool)

(assert (=> start!119170 m!1275965))

(declare-fun m!1275967 () Bool)

(assert (=> start!119170 m!1275967))

(push 1)

(assert (not b!1390165))

(assert (not b!1390161))

(assert (not b!1390163))

(assert (not start!119170))

(assert (not b!1390166))

(assert (not b!1390162))

(assert (not b!1390164))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

