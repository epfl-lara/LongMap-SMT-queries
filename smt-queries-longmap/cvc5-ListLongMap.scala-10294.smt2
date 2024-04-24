; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121278 () Bool)

(assert start!121278)

(declare-fun b!1409021 () Bool)

(declare-fun res!946061 () Bool)

(declare-fun e!797577 () Bool)

(assert (=> b!1409021 (=> (not res!946061) (not e!797577))))

(declare-datatypes ((array!96354 0))(
  ( (array!96355 (arr!46518 (Array (_ BitVec 32) (_ BitVec 64))) (size!47069 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96354)

(declare-datatypes ((List!33024 0))(
  ( (Nil!33021) (Cons!33020 (h!34291 (_ BitVec 64)) (t!47710 List!33024)) )
))
(declare-fun arrayNoDuplicates!0 (array!96354 (_ BitVec 32) List!33024) Bool)

(assert (=> b!1409021 (= res!946061 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33021))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1409022 () Bool)

(declare-fun e!797579 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10732 0))(
  ( (MissingZero!10732 (index!45305 (_ BitVec 32))) (Found!10732 (index!45306 (_ BitVec 32))) (Intermediate!10732 (undefined!11544 Bool) (index!45307 (_ BitVec 32)) (x!127064 (_ BitVec 32))) (Undefined!10732) (MissingVacant!10732 (index!45308 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96354 (_ BitVec 32)) SeekEntryResult!10732)

(assert (=> b!1409022 (= e!797579 (= (seekEntryOrOpen!0 (select (arr!46518 a!2901) j!112) a!2901 mask!2840) (Found!10732 j!112)))))

(declare-fun res!946065 () Bool)

(assert (=> start!121278 (=> (not res!946065) (not e!797577))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121278 (= res!946065 (validMask!0 mask!2840))))

(assert (=> start!121278 e!797577))

(assert (=> start!121278 true))

(declare-fun array_inv!35799 (array!96354) Bool)

(assert (=> start!121278 (array_inv!35799 a!2901)))

(declare-fun b!1409023 () Bool)

(declare-fun res!946066 () Bool)

(assert (=> b!1409023 (=> (not res!946066) (not e!797577))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96354 (_ BitVec 32)) Bool)

(assert (=> b!1409023 (= res!946066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409024 () Bool)

(declare-fun res!946063 () Bool)

(assert (=> b!1409024 (=> (not res!946063) (not e!797577))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1409024 (= res!946063 (and (= (size!47069 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47069 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47069 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409025 () Bool)

(declare-fun e!797576 () Bool)

(assert (=> b!1409025 (= e!797577 (not e!797576))))

(declare-fun res!946064 () Bool)

(assert (=> b!1409025 (=> res!946064 e!797576)))

(declare-fun lt!620374 () SeekEntryResult!10732)

(assert (=> b!1409025 (= res!946064 (or (not (is-Intermediate!10732 lt!620374)) (undefined!11544 lt!620374)))))

(assert (=> b!1409025 e!797579))

(declare-fun res!946059 () Bool)

(assert (=> b!1409025 (=> (not res!946059) (not e!797579))))

(assert (=> b!1409025 (= res!946059 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47465 0))(
  ( (Unit!47466) )
))
(declare-fun lt!620375 () Unit!47465)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96354 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47465)

(assert (=> b!1409025 (= lt!620375 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96354 (_ BitVec 32)) SeekEntryResult!10732)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409025 (= lt!620374 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46518 a!2901) j!112) mask!2840) (select (arr!46518 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409026 () Bool)

(declare-fun res!946060 () Bool)

(assert (=> b!1409026 (=> (not res!946060) (not e!797577))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409026 (= res!946060 (validKeyInArray!0 (select (arr!46518 a!2901) j!112)))))

(declare-fun b!1409027 () Bool)

(assert (=> b!1409027 (= e!797576 true)))

(declare-fun lt!620373 () SeekEntryResult!10732)

(assert (=> b!1409027 (= lt!620373 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46518 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46518 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96355 (store (arr!46518 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47069 a!2901)) mask!2840))))

(declare-fun b!1409028 () Bool)

(declare-fun res!946062 () Bool)

(assert (=> b!1409028 (=> (not res!946062) (not e!797577))))

(assert (=> b!1409028 (= res!946062 (validKeyInArray!0 (select (arr!46518 a!2901) i!1037)))))

(assert (= (and start!121278 res!946065) b!1409024))

(assert (= (and b!1409024 res!946063) b!1409028))

(assert (= (and b!1409028 res!946062) b!1409026))

(assert (= (and b!1409026 res!946060) b!1409023))

(assert (= (and b!1409023 res!946066) b!1409021))

(assert (= (and b!1409021 res!946061) b!1409025))

(assert (= (and b!1409025 res!946059) b!1409022))

(assert (= (and b!1409025 (not res!946064)) b!1409027))

(declare-fun m!1298325 () Bool)

(assert (=> b!1409025 m!1298325))

(declare-fun m!1298327 () Bool)

(assert (=> b!1409025 m!1298327))

(assert (=> b!1409025 m!1298325))

(declare-fun m!1298329 () Bool)

(assert (=> b!1409025 m!1298329))

(assert (=> b!1409025 m!1298327))

(assert (=> b!1409025 m!1298325))

(declare-fun m!1298331 () Bool)

(assert (=> b!1409025 m!1298331))

(declare-fun m!1298333 () Bool)

(assert (=> b!1409025 m!1298333))

(declare-fun m!1298335 () Bool)

(assert (=> b!1409021 m!1298335))

(declare-fun m!1298337 () Bool)

(assert (=> b!1409023 m!1298337))

(declare-fun m!1298339 () Bool)

(assert (=> b!1409028 m!1298339))

(assert (=> b!1409028 m!1298339))

(declare-fun m!1298341 () Bool)

(assert (=> b!1409028 m!1298341))

(declare-fun m!1298343 () Bool)

(assert (=> start!121278 m!1298343))

(declare-fun m!1298345 () Bool)

(assert (=> start!121278 m!1298345))

(assert (=> b!1409026 m!1298325))

(assert (=> b!1409026 m!1298325))

(declare-fun m!1298347 () Bool)

(assert (=> b!1409026 m!1298347))

(assert (=> b!1409022 m!1298325))

(assert (=> b!1409022 m!1298325))

(declare-fun m!1298349 () Bool)

(assert (=> b!1409022 m!1298349))

(declare-fun m!1298351 () Bool)

(assert (=> b!1409027 m!1298351))

(declare-fun m!1298353 () Bool)

(assert (=> b!1409027 m!1298353))

(assert (=> b!1409027 m!1298353))

(declare-fun m!1298355 () Bool)

(assert (=> b!1409027 m!1298355))

(assert (=> b!1409027 m!1298355))

(assert (=> b!1409027 m!1298353))

(declare-fun m!1298357 () Bool)

(assert (=> b!1409027 m!1298357))

(push 1)

(assert (not b!1409028))

(assert (not b!1409023))

(assert (not b!1409021))

(assert (not b!1409025))

(assert (not b!1409027))

(assert (not b!1409026))

(assert (not b!1409022))

(assert (not start!121278))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

