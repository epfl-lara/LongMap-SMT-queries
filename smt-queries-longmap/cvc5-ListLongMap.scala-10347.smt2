; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121632 () Bool)

(assert start!121632)

(declare-fun b!1413096 () Bool)

(declare-fun res!950089 () Bool)

(declare-fun e!799698 () Bool)

(assert (=> b!1413096 (=> (not res!950089) (not e!799698))))

(declare-datatypes ((array!96570 0))(
  ( (array!96571 (arr!46622 (Array (_ BitVec 32) (_ BitVec 64))) (size!47172 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96570)

(declare-datatypes ((List!33141 0))(
  ( (Nil!33138) (Cons!33137 (h!34412 (_ BitVec 64)) (t!47835 List!33141)) )
))
(declare-fun arrayNoDuplicates!0 (array!96570 (_ BitVec 32) List!33141) Bool)

(assert (=> b!1413096 (= res!950089 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33138))))

(declare-fun b!1413097 () Bool)

(declare-fun res!950093 () Bool)

(assert (=> b!1413097 (=> (not res!950093) (not e!799698))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1413097 (= res!950093 (and (= (size!47172 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47172 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47172 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1413098 () Bool)

(declare-fun e!799699 () Bool)

(assert (=> b!1413098 (= e!799698 (not e!799699))))

(declare-fun res!950094 () Bool)

(assert (=> b!1413098 (=> res!950094 e!799699)))

(declare-datatypes ((SeekEntryResult!10933 0))(
  ( (MissingZero!10933 (index!46112 (_ BitVec 32))) (Found!10933 (index!46113 (_ BitVec 32))) (Intermediate!10933 (undefined!11745 Bool) (index!46114 (_ BitVec 32)) (x!127700 (_ BitVec 32))) (Undefined!10933) (MissingVacant!10933 (index!46115 (_ BitVec 32))) )
))
(declare-fun lt!622798 () SeekEntryResult!10933)

(assert (=> b!1413098 (= res!950094 (or (not (is-Intermediate!10933 lt!622798)) (undefined!11745 lt!622798)))))

(declare-fun e!799695 () Bool)

(assert (=> b!1413098 e!799695))

(declare-fun res!950091 () Bool)

(assert (=> b!1413098 (=> (not res!950091) (not e!799695))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96570 (_ BitVec 32)) Bool)

(assert (=> b!1413098 (= res!950091 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47840 0))(
  ( (Unit!47841) )
))
(declare-fun lt!622796 () Unit!47840)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96570 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47840)

(assert (=> b!1413098 (= lt!622796 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622794 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96570 (_ BitVec 32)) SeekEntryResult!10933)

(assert (=> b!1413098 (= lt!622798 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622794 (select (arr!46622 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413098 (= lt!622794 (toIndex!0 (select (arr!46622 a!2901) j!112) mask!2840))))

(declare-fun b!1413099 () Bool)

(declare-fun e!799696 () Bool)

(assert (=> b!1413099 (= e!799699 e!799696)))

(declare-fun res!950086 () Bool)

(assert (=> b!1413099 (=> res!950086 e!799696)))

(declare-fun lt!622799 () SeekEntryResult!10933)

(assert (=> b!1413099 (= res!950086 (or (= lt!622798 lt!622799) (not (is-Intermediate!10933 lt!622799))))))

(declare-fun lt!622795 () (_ BitVec 64))

(declare-fun lt!622797 () array!96570)

(assert (=> b!1413099 (= lt!622799 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622795 mask!2840) lt!622795 lt!622797 mask!2840))))

(assert (=> b!1413099 (= lt!622795 (select (store (arr!46622 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413099 (= lt!622797 (array!96571 (store (arr!46622 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47172 a!2901)))))

(declare-fun b!1413100 () Bool)

(declare-fun res!950090 () Bool)

(assert (=> b!1413100 (=> (not res!950090) (not e!799698))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413100 (= res!950090 (validKeyInArray!0 (select (arr!46622 a!2901) j!112)))))

(declare-fun res!950087 () Bool)

(assert (=> start!121632 (=> (not res!950087) (not e!799698))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121632 (= res!950087 (validMask!0 mask!2840))))

(assert (=> start!121632 e!799698))

(assert (=> start!121632 true))

(declare-fun array_inv!35650 (array!96570) Bool)

(assert (=> start!121632 (array_inv!35650 a!2901)))

(declare-fun e!799697 () Bool)

(declare-fun b!1413101 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96570 (_ BitVec 32)) SeekEntryResult!10933)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96570 (_ BitVec 32)) SeekEntryResult!10933)

(assert (=> b!1413101 (= e!799697 (= (seekEntryOrOpen!0 lt!622795 lt!622797 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127700 lt!622799) (index!46114 lt!622799) (index!46114 lt!622799) (select (arr!46622 a!2901) j!112) lt!622797 mask!2840)))))

(declare-fun b!1413102 () Bool)

(assert (=> b!1413102 (= e!799695 (= (seekEntryOrOpen!0 (select (arr!46622 a!2901) j!112) a!2901 mask!2840) (Found!10933 j!112)))))

(declare-fun b!1413103 () Bool)

(declare-fun res!950088 () Bool)

(assert (=> b!1413103 (=> (not res!950088) (not e!799698))))

(assert (=> b!1413103 (= res!950088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413104 () Bool)

(declare-fun res!950092 () Bool)

(assert (=> b!1413104 (=> (not res!950092) (not e!799698))))

(assert (=> b!1413104 (= res!950092 (validKeyInArray!0 (select (arr!46622 a!2901) i!1037)))))

(declare-fun b!1413105 () Bool)

(assert (=> b!1413105 (= e!799696 true)))

(assert (=> b!1413105 e!799697))

(declare-fun res!950095 () Bool)

(assert (=> b!1413105 (=> (not res!950095) (not e!799697))))

(assert (=> b!1413105 (= res!950095 (and (not (undefined!11745 lt!622799)) (= (index!46114 lt!622799) i!1037) (bvslt (x!127700 lt!622799) (x!127700 lt!622798)) (= (select (store (arr!46622 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46114 lt!622799)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622800 () Unit!47840)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96570 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47840)

(assert (=> b!1413105 (= lt!622800 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622794 (x!127700 lt!622798) (index!46114 lt!622798) (x!127700 lt!622799) (index!46114 lt!622799) (undefined!11745 lt!622799) mask!2840))))

(assert (= (and start!121632 res!950087) b!1413097))

(assert (= (and b!1413097 res!950093) b!1413104))

(assert (= (and b!1413104 res!950092) b!1413100))

(assert (= (and b!1413100 res!950090) b!1413103))

(assert (= (and b!1413103 res!950088) b!1413096))

(assert (= (and b!1413096 res!950089) b!1413098))

(assert (= (and b!1413098 res!950091) b!1413102))

(assert (= (and b!1413098 (not res!950094)) b!1413099))

(assert (= (and b!1413099 (not res!950086)) b!1413105))

(assert (= (and b!1413105 res!950095) b!1413101))

(declare-fun m!1303383 () Bool)

(assert (=> b!1413101 m!1303383))

(declare-fun m!1303385 () Bool)

(assert (=> b!1413101 m!1303385))

(assert (=> b!1413101 m!1303385))

(declare-fun m!1303387 () Bool)

(assert (=> b!1413101 m!1303387))

(declare-fun m!1303389 () Bool)

(assert (=> b!1413096 m!1303389))

(assert (=> b!1413100 m!1303385))

(assert (=> b!1413100 m!1303385))

(declare-fun m!1303391 () Bool)

(assert (=> b!1413100 m!1303391))

(declare-fun m!1303393 () Bool)

(assert (=> start!121632 m!1303393))

(declare-fun m!1303395 () Bool)

(assert (=> start!121632 m!1303395))

(assert (=> b!1413102 m!1303385))

(assert (=> b!1413102 m!1303385))

(declare-fun m!1303397 () Bool)

(assert (=> b!1413102 m!1303397))

(declare-fun m!1303399 () Bool)

(assert (=> b!1413105 m!1303399))

(declare-fun m!1303401 () Bool)

(assert (=> b!1413105 m!1303401))

(declare-fun m!1303403 () Bool)

(assert (=> b!1413105 m!1303403))

(assert (=> b!1413098 m!1303385))

(declare-fun m!1303405 () Bool)

(assert (=> b!1413098 m!1303405))

(assert (=> b!1413098 m!1303385))

(declare-fun m!1303407 () Bool)

(assert (=> b!1413098 m!1303407))

(declare-fun m!1303409 () Bool)

(assert (=> b!1413098 m!1303409))

(assert (=> b!1413098 m!1303385))

(declare-fun m!1303411 () Bool)

(assert (=> b!1413098 m!1303411))

(declare-fun m!1303413 () Bool)

(assert (=> b!1413103 m!1303413))

(declare-fun m!1303415 () Bool)

(assert (=> b!1413104 m!1303415))

(assert (=> b!1413104 m!1303415))

(declare-fun m!1303417 () Bool)

(assert (=> b!1413104 m!1303417))

(declare-fun m!1303419 () Bool)

(assert (=> b!1413099 m!1303419))

(assert (=> b!1413099 m!1303419))

(declare-fun m!1303421 () Bool)

(assert (=> b!1413099 m!1303421))

(assert (=> b!1413099 m!1303399))

(declare-fun m!1303423 () Bool)

(assert (=> b!1413099 m!1303423))

(push 1)

(assert (not b!1413101))

(assert (not b!1413104))

(assert (not start!121632))

(assert (not b!1413100))

(assert (not b!1413098))

(assert (not b!1413096))

