; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119268 () Bool)

(assert start!119268)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95107 0))(
  ( (array!95108 (arr!45918 (Array (_ BitVec 32) (_ BitVec 64))) (size!46470 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95107)

(declare-fun b!1390812 () Bool)

(declare-fun e!787620 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10261 0))(
  ( (MissingZero!10261 (index!43415 (_ BitVec 32))) (Found!10261 (index!43416 (_ BitVec 32))) (Intermediate!10261 (undefined!11073 Bool) (index!43417 (_ BitVec 32)) (x!125086 (_ BitVec 32))) (Undefined!10261) (MissingVacant!10261 (index!43418 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95107 (_ BitVec 32)) SeekEntryResult!10261)

(assert (=> b!1390812 (= e!787620 (= (seekEntryOrOpen!0 (select (arr!45918 a!2901) j!112) a!2901 mask!2840) (Found!10261 j!112)))))

(declare-fun b!1390813 () Bool)

(declare-fun res!930881 () Bool)

(declare-fun e!787622 () Bool)

(assert (=> b!1390813 (=> (not res!930881) (not e!787622))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390813 (= res!930881 (validKeyInArray!0 (select (arr!45918 a!2901) i!1037)))))

(declare-fun b!1390814 () Bool)

(declare-fun res!930880 () Bool)

(assert (=> b!1390814 (=> (not res!930880) (not e!787622))))

(declare-datatypes ((List!32515 0))(
  ( (Nil!32512) (Cons!32511 (h!33732 (_ BitVec 64)) (t!47201 List!32515)) )
))
(declare-fun arrayNoDuplicates!0 (array!95107 (_ BitVec 32) List!32515) Bool)

(assert (=> b!1390814 (= res!930880 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32512))))

(declare-fun b!1390815 () Bool)

(declare-fun res!930879 () Bool)

(assert (=> b!1390815 (=> (not res!930879) (not e!787622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95107 (_ BitVec 32)) Bool)

(assert (=> b!1390815 (= res!930879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390816 () Bool)

(declare-fun res!930883 () Bool)

(assert (=> b!1390816 (=> (not res!930883) (not e!787622))))

(assert (=> b!1390816 (= res!930883 (validKeyInArray!0 (select (arr!45918 a!2901) j!112)))))

(declare-fun b!1390817 () Bool)

(assert (=> b!1390817 (= e!787622 (not true))))

(assert (=> b!1390817 e!787620))

(declare-fun res!930882 () Bool)

(assert (=> b!1390817 (=> (not res!930882) (not e!787620))))

(assert (=> b!1390817 (= res!930882 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46369 0))(
  ( (Unit!46370) )
))
(declare-fun lt!610808 () Unit!46369)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95107 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46369)

(assert (=> b!1390817 (= lt!610808 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!610807 () SeekEntryResult!10261)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95107 (_ BitVec 32)) SeekEntryResult!10261)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390817 (= lt!610807 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45918 a!2901) j!112) mask!2840) (select (arr!45918 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390818 () Bool)

(declare-fun res!930877 () Bool)

(assert (=> b!1390818 (=> (not res!930877) (not e!787622))))

(assert (=> b!1390818 (= res!930877 (and (= (size!46470 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46470 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46470 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!930878 () Bool)

(assert (=> start!119268 (=> (not res!930878) (not e!787622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119268 (= res!930878 (validMask!0 mask!2840))))

(assert (=> start!119268 e!787622))

(assert (=> start!119268 true))

(declare-fun array_inv!35151 (array!95107) Bool)

(assert (=> start!119268 (array_inv!35151 a!2901)))

(assert (= (and start!119268 res!930878) b!1390818))

(assert (= (and b!1390818 res!930877) b!1390813))

(assert (= (and b!1390813 res!930881) b!1390816))

(assert (= (and b!1390816 res!930883) b!1390815))

(assert (= (and b!1390815 res!930879) b!1390814))

(assert (= (and b!1390814 res!930880) b!1390817))

(assert (= (and b!1390817 res!930882) b!1390812))

(declare-fun m!1276157 () Bool)

(assert (=> b!1390816 m!1276157))

(assert (=> b!1390816 m!1276157))

(declare-fun m!1276159 () Bool)

(assert (=> b!1390816 m!1276159))

(assert (=> b!1390817 m!1276157))

(declare-fun m!1276161 () Bool)

(assert (=> b!1390817 m!1276161))

(assert (=> b!1390817 m!1276157))

(declare-fun m!1276163 () Bool)

(assert (=> b!1390817 m!1276163))

(assert (=> b!1390817 m!1276161))

(assert (=> b!1390817 m!1276157))

(declare-fun m!1276165 () Bool)

(assert (=> b!1390817 m!1276165))

(declare-fun m!1276167 () Bool)

(assert (=> b!1390817 m!1276167))

(declare-fun m!1276169 () Bool)

(assert (=> start!119268 m!1276169))

(declare-fun m!1276171 () Bool)

(assert (=> start!119268 m!1276171))

(declare-fun m!1276173 () Bool)

(assert (=> b!1390814 m!1276173))

(declare-fun m!1276175 () Bool)

(assert (=> b!1390815 m!1276175))

(declare-fun m!1276177 () Bool)

(assert (=> b!1390813 m!1276177))

(assert (=> b!1390813 m!1276177))

(declare-fun m!1276179 () Bool)

(assert (=> b!1390813 m!1276179))

(assert (=> b!1390812 m!1276157))

(assert (=> b!1390812 m!1276157))

(declare-fun m!1276181 () Bool)

(assert (=> b!1390812 m!1276181))

(push 1)

(assert (not b!1390816))

(assert (not b!1390813))

(assert (not b!1390812))

(assert (not b!1390815))

(assert (not b!1390817))

(assert (not start!119268))

(assert (not b!1390814))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

