; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120822 () Bool)

(assert start!120822)

(declare-fun b!1405775 () Bool)

(declare-fun res!944050 () Bool)

(declare-fun e!795712 () Bool)

(assert (=> b!1405775 (=> (not res!944050) (not e!795712))))

(declare-datatypes ((array!96082 0))(
  ( (array!96083 (arr!46389 (Array (_ BitVec 32) (_ BitVec 64))) (size!46941 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96082)

(declare-datatypes ((List!32986 0))(
  ( (Nil!32983) (Cons!32982 (h!34236 (_ BitVec 64)) (t!47672 List!32986)) )
))
(declare-fun arrayNoDuplicates!0 (array!96082 (_ BitVec 32) List!32986) Bool)

(assert (=> b!1405775 (= res!944050 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32983))))

(declare-fun b!1405776 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!795713 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10726 0))(
  ( (MissingZero!10726 (index!45281 (_ BitVec 32))) (Found!10726 (index!45282 (_ BitVec 32))) (Intermediate!10726 (undefined!11538 Bool) (index!45283 (_ BitVec 32)) (x!126882 (_ BitVec 32))) (Undefined!10726) (MissingVacant!10726 (index!45284 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96082 (_ BitVec 32)) SeekEntryResult!10726)

(assert (=> b!1405776 (= e!795713 (= (seekEntryOrOpen!0 (select (arr!46389 a!2901) j!112) a!2901 mask!2840) (Found!10726 j!112)))))

(declare-fun res!944046 () Bool)

(assert (=> start!120822 (=> (not res!944046) (not e!795712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120822 (= res!944046 (validMask!0 mask!2840))))

(assert (=> start!120822 e!795712))

(assert (=> start!120822 true))

(declare-fun array_inv!35622 (array!96082) Bool)

(assert (=> start!120822 (array_inv!35622 a!2901)))

(declare-fun b!1405777 () Bool)

(declare-fun res!944048 () Bool)

(assert (=> b!1405777 (=> (not res!944048) (not e!795712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405777 (= res!944048 (validKeyInArray!0 (select (arr!46389 a!2901) j!112)))))

(declare-fun b!1405778 () Bool)

(declare-fun res!944047 () Bool)

(assert (=> b!1405778 (=> (not res!944047) (not e!795712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96082 (_ BitVec 32)) Bool)

(assert (=> b!1405778 (= res!944047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405779 () Bool)

(declare-fun e!795711 () Bool)

(assert (=> b!1405779 (= e!795711 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!618975 () SeekEntryResult!10726)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96082 (_ BitVec 32)) SeekEntryResult!10726)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405779 (= lt!618975 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46389 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46389 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96083 (store (arr!46389 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46941 a!2901)) mask!2840))))

(declare-fun b!1405780 () Bool)

(declare-fun res!944045 () Bool)

(assert (=> b!1405780 (=> (not res!944045) (not e!795712))))

(assert (=> b!1405780 (= res!944045 (validKeyInArray!0 (select (arr!46389 a!2901) i!1037)))))

(declare-fun b!1405781 () Bool)

(assert (=> b!1405781 (= e!795712 (not e!795711))))

(declare-fun res!944049 () Bool)

(assert (=> b!1405781 (=> res!944049 e!795711)))

(declare-fun lt!618977 () SeekEntryResult!10726)

(assert (=> b!1405781 (= res!944049 (or (not (is-Intermediate!10726 lt!618977)) (undefined!11538 lt!618977)))))

(assert (=> b!1405781 e!795713))

(declare-fun res!944043 () Bool)

(assert (=> b!1405781 (=> (not res!944043) (not e!795713))))

(assert (=> b!1405781 (= res!944043 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47269 0))(
  ( (Unit!47270) )
))
(declare-fun lt!618976 () Unit!47269)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96082 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47269)

(assert (=> b!1405781 (= lt!618976 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1405781 (= lt!618977 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46389 a!2901) j!112) mask!2840) (select (arr!46389 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405782 () Bool)

(declare-fun res!944044 () Bool)

(assert (=> b!1405782 (=> (not res!944044) (not e!795712))))

(assert (=> b!1405782 (= res!944044 (and (= (size!46941 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46941 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46941 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120822 res!944046) b!1405782))

(assert (= (and b!1405782 res!944044) b!1405780))

(assert (= (and b!1405780 res!944045) b!1405777))

(assert (= (and b!1405777 res!944048) b!1405778))

(assert (= (and b!1405778 res!944047) b!1405775))

(assert (= (and b!1405775 res!944050) b!1405781))

(assert (= (and b!1405781 res!944043) b!1405776))

(assert (= (and b!1405781 (not res!944049)) b!1405779))

(declare-fun m!1294221 () Bool)

(assert (=> b!1405781 m!1294221))

(declare-fun m!1294223 () Bool)

(assert (=> b!1405781 m!1294223))

(assert (=> b!1405781 m!1294221))

(declare-fun m!1294225 () Bool)

(assert (=> b!1405781 m!1294225))

(assert (=> b!1405781 m!1294223))

(assert (=> b!1405781 m!1294221))

(declare-fun m!1294227 () Bool)

(assert (=> b!1405781 m!1294227))

(declare-fun m!1294229 () Bool)

(assert (=> b!1405781 m!1294229))

(declare-fun m!1294231 () Bool)

(assert (=> b!1405778 m!1294231))

(declare-fun m!1294233 () Bool)

(assert (=> b!1405779 m!1294233))

(declare-fun m!1294235 () Bool)

(assert (=> b!1405779 m!1294235))

(assert (=> b!1405779 m!1294235))

(declare-fun m!1294237 () Bool)

(assert (=> b!1405779 m!1294237))

(assert (=> b!1405779 m!1294237))

(assert (=> b!1405779 m!1294235))

(declare-fun m!1294239 () Bool)

(assert (=> b!1405779 m!1294239))

(declare-fun m!1294241 () Bool)

(assert (=> start!120822 m!1294241))

(declare-fun m!1294243 () Bool)

(assert (=> start!120822 m!1294243))

(assert (=> b!1405776 m!1294221))

(assert (=> b!1405776 m!1294221))

(declare-fun m!1294245 () Bool)

(assert (=> b!1405776 m!1294245))

(assert (=> b!1405777 m!1294221))

(assert (=> b!1405777 m!1294221))

(declare-fun m!1294247 () Bool)

(assert (=> b!1405777 m!1294247))

(declare-fun m!1294249 () Bool)

(assert (=> b!1405775 m!1294249))

(declare-fun m!1294251 () Bool)

(assert (=> b!1405780 m!1294251))

(assert (=> b!1405780 m!1294251))

(declare-fun m!1294253 () Bool)

(assert (=> b!1405780 m!1294253))

(push 1)

(assert (not b!1405781))

(assert (not b!1405777))

(assert (not b!1405779))

(assert (not b!1405776))

(assert (not b!1405775))

(assert (not b!1405780))

(assert (not b!1405778))

(assert (not start!120822))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

