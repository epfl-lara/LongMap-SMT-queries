; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121176 () Bool)

(assert start!121176)

(declare-fun res!946686 () Bool)

(declare-fun e!797357 () Bool)

(assert (=> start!121176 (=> (not res!946686) (not e!797357))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121176 (= res!946686 (validMask!0 mask!2840))))

(assert (=> start!121176 e!797357))

(assert (=> start!121176 true))

(declare-datatypes ((array!96330 0))(
  ( (array!96331 (arr!46508 (Array (_ BitVec 32) (_ BitVec 64))) (size!47058 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96330)

(declare-fun array_inv!35536 (array!96330) Bool)

(assert (=> start!121176 (array_inv!35536 a!2901)))

(declare-fun b!1408958 () Bool)

(declare-fun res!946687 () Bool)

(assert (=> b!1408958 (=> (not res!946687) (not e!797357))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1408958 (= res!946687 (and (= (size!47058 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47058 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47058 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408959 () Bool)

(declare-fun res!946685 () Bool)

(assert (=> b!1408959 (=> (not res!946685) (not e!797357))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96330 (_ BitVec 32)) Bool)

(assert (=> b!1408959 (= res!946685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408960 () Bool)

(declare-fun res!946683 () Bool)

(assert (=> b!1408960 (=> (not res!946683) (not e!797357))))

(declare-datatypes ((List!33027 0))(
  ( (Nil!33024) (Cons!33023 (h!34286 (_ BitVec 64)) (t!47721 List!33027)) )
))
(declare-fun arrayNoDuplicates!0 (array!96330 (_ BitVec 32) List!33027) Bool)

(assert (=> b!1408960 (= res!946683 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33024))))

(declare-fun b!1408961 () Bool)

(declare-fun e!797355 () Bool)

(assert (=> b!1408961 (= e!797357 (not e!797355))))

(declare-fun res!946684 () Bool)

(assert (=> b!1408961 (=> res!946684 e!797355)))

(declare-datatypes ((SeekEntryResult!10819 0))(
  ( (MissingZero!10819 (index!45653 (_ BitVec 32))) (Found!10819 (index!45654 (_ BitVec 32))) (Intermediate!10819 (undefined!11631 Bool) (index!45655 (_ BitVec 32)) (x!127252 (_ BitVec 32))) (Undefined!10819) (MissingVacant!10819 (index!45656 (_ BitVec 32))) )
))
(declare-fun lt!620542 () SeekEntryResult!10819)

(assert (=> b!1408961 (= res!946684 (or (not (is-Intermediate!10819 lt!620542)) (undefined!11631 lt!620542)))))

(declare-fun e!797354 () Bool)

(assert (=> b!1408961 e!797354))

(declare-fun res!946680 () Bool)

(assert (=> b!1408961 (=> (not res!946680) (not e!797354))))

(assert (=> b!1408961 (= res!946680 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47612 0))(
  ( (Unit!47613) )
))
(declare-fun lt!620544 () Unit!47612)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96330 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47612)

(assert (=> b!1408961 (= lt!620544 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96330 (_ BitVec 32)) SeekEntryResult!10819)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408961 (= lt!620542 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46508 a!2901) j!112) mask!2840) (select (arr!46508 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408962 () Bool)

(declare-fun res!946682 () Bool)

(assert (=> b!1408962 (=> (not res!946682) (not e!797357))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408962 (= res!946682 (validKeyInArray!0 (select (arr!46508 a!2901) j!112)))))

(declare-fun b!1408963 () Bool)

(assert (=> b!1408963 (= e!797355 true)))

(declare-fun lt!620543 () SeekEntryResult!10819)

(assert (=> b!1408963 (= lt!620543 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46508 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46508 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96331 (store (arr!46508 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47058 a!2901)) mask!2840))))

(declare-fun b!1408964 () Bool)

(declare-fun res!946681 () Bool)

(assert (=> b!1408964 (=> (not res!946681) (not e!797357))))

(assert (=> b!1408964 (= res!946681 (validKeyInArray!0 (select (arr!46508 a!2901) i!1037)))))

(declare-fun b!1408965 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96330 (_ BitVec 32)) SeekEntryResult!10819)

(assert (=> b!1408965 (= e!797354 (= (seekEntryOrOpen!0 (select (arr!46508 a!2901) j!112) a!2901 mask!2840) (Found!10819 j!112)))))

(assert (= (and start!121176 res!946686) b!1408958))

(assert (= (and b!1408958 res!946687) b!1408964))

(assert (= (and b!1408964 res!946681) b!1408962))

(assert (= (and b!1408962 res!946682) b!1408959))

(assert (= (and b!1408959 res!946685) b!1408960))

(assert (= (and b!1408960 res!946683) b!1408961))

(assert (= (and b!1408961 res!946680) b!1408965))

(assert (= (and b!1408961 (not res!946684)) b!1408963))

(declare-fun m!1298475 () Bool)

(assert (=> start!121176 m!1298475))

(declare-fun m!1298477 () Bool)

(assert (=> start!121176 m!1298477))

(declare-fun m!1298479 () Bool)

(assert (=> b!1408965 m!1298479))

(assert (=> b!1408965 m!1298479))

(declare-fun m!1298481 () Bool)

(assert (=> b!1408965 m!1298481))

(declare-fun m!1298483 () Bool)

(assert (=> b!1408960 m!1298483))

(declare-fun m!1298485 () Bool)

(assert (=> b!1408959 m!1298485))

(assert (=> b!1408961 m!1298479))

(declare-fun m!1298487 () Bool)

(assert (=> b!1408961 m!1298487))

(assert (=> b!1408961 m!1298479))

(declare-fun m!1298489 () Bool)

(assert (=> b!1408961 m!1298489))

(assert (=> b!1408961 m!1298487))

(assert (=> b!1408961 m!1298479))

(declare-fun m!1298491 () Bool)

(assert (=> b!1408961 m!1298491))

(declare-fun m!1298493 () Bool)

(assert (=> b!1408961 m!1298493))

(declare-fun m!1298495 () Bool)

(assert (=> b!1408964 m!1298495))

(assert (=> b!1408964 m!1298495))

(declare-fun m!1298497 () Bool)

(assert (=> b!1408964 m!1298497))

(declare-fun m!1298499 () Bool)

(assert (=> b!1408963 m!1298499))

(declare-fun m!1298501 () Bool)

(assert (=> b!1408963 m!1298501))

(assert (=> b!1408963 m!1298501))

(declare-fun m!1298503 () Bool)

(assert (=> b!1408963 m!1298503))

(assert (=> b!1408963 m!1298503))

(assert (=> b!1408963 m!1298501))

(declare-fun m!1298505 () Bool)

(assert (=> b!1408963 m!1298505))

(assert (=> b!1408962 m!1298479))

(assert (=> b!1408962 m!1298479))

(declare-fun m!1298507 () Bool)

(assert (=> b!1408962 m!1298507))

(push 1)

(assert (not b!1408964))

(assert (not b!1408959))

(assert (not b!1408960))

(assert (not start!121176))

(assert (not b!1408962))

(assert (not b!1408965))

(assert (not b!1408963))

(assert (not b!1408961))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

