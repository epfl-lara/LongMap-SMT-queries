; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122106 () Bool)

(assert start!122106)

(declare-fun b!1416917 () Bool)

(declare-fun res!952848 () Bool)

(declare-fun e!801929 () Bool)

(assert (=> b!1416917 (=> (not res!952848) (not e!801929))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96694 0))(
  ( (array!96695 (arr!46677 (Array (_ BitVec 32) (_ BitVec 64))) (size!47229 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96694)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1416917 (= res!952848 (and (= (size!47229 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47229 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47229 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416918 () Bool)

(declare-fun e!801932 () Bool)

(declare-datatypes ((SeekEntryResult!11014 0))(
  ( (MissingZero!11014 (index!46448 (_ BitVec 32))) (Found!11014 (index!46449 (_ BitVec 32))) (Intermediate!11014 (undefined!11826 Bool) (index!46450 (_ BitVec 32)) (x!128040 (_ BitVec 32))) (Undefined!11014) (MissingVacant!11014 (index!46451 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96694 (_ BitVec 32)) SeekEntryResult!11014)

(assert (=> b!1416918 (= e!801932 (= (seekEntryOrOpen!0 (select (arr!46677 a!2901) j!112) a!2901 mask!2840) (Found!11014 j!112)))))

(declare-fun b!1416919 () Bool)

(declare-fun e!801930 () Bool)

(assert (=> b!1416919 (= e!801929 (not e!801930))))

(declare-fun res!952845 () Bool)

(assert (=> b!1416919 (=> res!952845 e!801930)))

(declare-fun lt!625005 () SeekEntryResult!11014)

(assert (=> b!1416919 (= res!952845 (or (not (is-Intermediate!11014 lt!625005)) (undefined!11826 lt!625005)))))

(assert (=> b!1416919 e!801932))

(declare-fun res!952849 () Bool)

(assert (=> b!1416919 (=> (not res!952849) (not e!801932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96694 (_ BitVec 32)) Bool)

(assert (=> b!1416919 (= res!952849 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47845 0))(
  ( (Unit!47846) )
))
(declare-fun lt!625006 () Unit!47845)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96694 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47845)

(assert (=> b!1416919 (= lt!625006 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96694 (_ BitVec 32)) SeekEntryResult!11014)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416919 (= lt!625005 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46677 a!2901) j!112) mask!2840) (select (arr!46677 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1416920 () Bool)

(declare-fun res!952847 () Bool)

(assert (=> b!1416920 (=> (not res!952847) (not e!801929))))

(declare-datatypes ((List!33274 0))(
  ( (Nil!33271) (Cons!33270 (h!34560 (_ BitVec 64)) (t!47960 List!33274)) )
))
(declare-fun arrayNoDuplicates!0 (array!96694 (_ BitVec 32) List!33274) Bool)

(assert (=> b!1416920 (= res!952847 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33271))))

(declare-fun res!952850 () Bool)

(assert (=> start!122106 (=> (not res!952850) (not e!801929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122106 (= res!952850 (validMask!0 mask!2840))))

(assert (=> start!122106 e!801929))

(assert (=> start!122106 true))

(declare-fun array_inv!35910 (array!96694) Bool)

(assert (=> start!122106 (array_inv!35910 a!2901)))

(declare-fun b!1416921 () Bool)

(declare-fun res!952852 () Bool)

(assert (=> b!1416921 (=> (not res!952852) (not e!801929))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416921 (= res!952852 (validKeyInArray!0 (select (arr!46677 a!2901) j!112)))))

(declare-fun b!1416922 () Bool)

(declare-fun res!952846 () Bool)

(assert (=> b!1416922 (=> (not res!952846) (not e!801929))))

(assert (=> b!1416922 (= res!952846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416923 () Bool)

(declare-fun res!952851 () Bool)

(assert (=> b!1416923 (=> (not res!952851) (not e!801929))))

(assert (=> b!1416923 (= res!952851 (validKeyInArray!0 (select (arr!46677 a!2901) i!1037)))))

(declare-fun b!1416924 () Bool)

(assert (=> b!1416924 (= e!801930 true)))

(declare-fun lt!625007 () SeekEntryResult!11014)

(assert (=> b!1416924 (= lt!625007 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46677 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46677 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96695 (store (arr!46677 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47229 a!2901)) mask!2840))))

(assert (= (and start!122106 res!952850) b!1416917))

(assert (= (and b!1416917 res!952848) b!1416923))

(assert (= (and b!1416923 res!952851) b!1416921))

(assert (= (and b!1416921 res!952852) b!1416922))

(assert (= (and b!1416922 res!952846) b!1416920))

(assert (= (and b!1416920 res!952847) b!1416919))

(assert (= (and b!1416919 res!952849) b!1416918))

(assert (= (and b!1416919 (not res!952845)) b!1416924))

(declare-fun m!1307211 () Bool)

(assert (=> b!1416920 m!1307211))

(declare-fun m!1307213 () Bool)

(assert (=> start!122106 m!1307213))

(declare-fun m!1307215 () Bool)

(assert (=> start!122106 m!1307215))

(declare-fun m!1307217 () Bool)

(assert (=> b!1416918 m!1307217))

(assert (=> b!1416918 m!1307217))

(declare-fun m!1307219 () Bool)

(assert (=> b!1416918 m!1307219))

(assert (=> b!1416919 m!1307217))

(declare-fun m!1307221 () Bool)

(assert (=> b!1416919 m!1307221))

(assert (=> b!1416919 m!1307217))

(declare-fun m!1307223 () Bool)

(assert (=> b!1416919 m!1307223))

(assert (=> b!1416919 m!1307221))

(assert (=> b!1416919 m!1307217))

(declare-fun m!1307225 () Bool)

(assert (=> b!1416919 m!1307225))

(declare-fun m!1307227 () Bool)

(assert (=> b!1416919 m!1307227))

(declare-fun m!1307229 () Bool)

(assert (=> b!1416924 m!1307229))

(declare-fun m!1307231 () Bool)

(assert (=> b!1416924 m!1307231))

(assert (=> b!1416924 m!1307231))

(declare-fun m!1307233 () Bool)

(assert (=> b!1416924 m!1307233))

(assert (=> b!1416924 m!1307233))

(assert (=> b!1416924 m!1307231))

(declare-fun m!1307235 () Bool)

(assert (=> b!1416924 m!1307235))

(declare-fun m!1307237 () Bool)

(assert (=> b!1416923 m!1307237))

(assert (=> b!1416923 m!1307237))

(declare-fun m!1307239 () Bool)

(assert (=> b!1416923 m!1307239))

(assert (=> b!1416921 m!1307217))

(assert (=> b!1416921 m!1307217))

(declare-fun m!1307241 () Bool)

(assert (=> b!1416921 m!1307241))

(declare-fun m!1307243 () Bool)

(assert (=> b!1416922 m!1307243))

(push 1)

(assert (not b!1416921))

(assert (not b!1416920))

(assert (not b!1416924))

(assert (not b!1416918))

(assert (not b!1416922))

(assert (not b!1416919))

(assert (not start!122106))

(assert (not b!1416923))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

