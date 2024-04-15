; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121224 () Bool)

(assert start!121224)

(declare-fun b!1409501 () Bool)

(declare-fun res!947276 () Bool)

(declare-fun e!797629 () Bool)

(assert (=> b!1409501 (=> (not res!947276) (not e!797629))))

(declare-datatypes ((array!96331 0))(
  ( (array!96332 (arr!46509 (Array (_ BitVec 32) (_ BitVec 64))) (size!47061 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96331)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409501 (= res!947276 (validKeyInArray!0 (select (arr!46509 a!2901) i!1037)))))

(declare-fun b!1409502 () Bool)

(declare-fun e!797630 () Bool)

(assert (=> b!1409502 (= e!797630 true)))

(declare-datatypes ((SeekEntryResult!10846 0))(
  ( (MissingZero!10846 (index!45761 (_ BitVec 32))) (Found!10846 (index!45762 (_ BitVec 32))) (Intermediate!10846 (undefined!11658 Bool) (index!45763 (_ BitVec 32)) (x!127340 (_ BitVec 32))) (Undefined!10846) (MissingVacant!10846 (index!45764 (_ BitVec 32))) )
))
(declare-fun lt!620588 () SeekEntryResult!10846)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96331 (_ BitVec 32)) SeekEntryResult!10846)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409502 (= lt!620588 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46509 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46509 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96332 (store (arr!46509 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47061 a!2901)) mask!2840))))

(declare-fun res!947280 () Bool)

(assert (=> start!121224 (=> (not res!947280) (not e!797629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121224 (= res!947280 (validMask!0 mask!2840))))

(assert (=> start!121224 e!797629))

(assert (=> start!121224 true))

(declare-fun array_inv!35742 (array!96331) Bool)

(assert (=> start!121224 (array_inv!35742 a!2901)))

(declare-fun b!1409503 () Bool)

(assert (=> b!1409503 (= e!797629 (not e!797630))))

(declare-fun res!947275 () Bool)

(assert (=> b!1409503 (=> res!947275 e!797630)))

(declare-fun lt!620587 () SeekEntryResult!10846)

(assert (=> b!1409503 (= res!947275 (or (not (is-Intermediate!10846 lt!620587)) (undefined!11658 lt!620587)))))

(declare-fun e!797627 () Bool)

(assert (=> b!1409503 e!797627))

(declare-fun res!947279 () Bool)

(assert (=> b!1409503 (=> (not res!947279) (not e!797627))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96331 (_ BitVec 32)) Bool)

(assert (=> b!1409503 (= res!947279 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47509 0))(
  ( (Unit!47510) )
))
(declare-fun lt!620586 () Unit!47509)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96331 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47509)

(assert (=> b!1409503 (= lt!620586 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1409503 (= lt!620587 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46509 a!2901) j!112) mask!2840) (select (arr!46509 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409504 () Bool)

(declare-fun res!947274 () Bool)

(assert (=> b!1409504 (=> (not res!947274) (not e!797629))))

(declare-datatypes ((List!33106 0))(
  ( (Nil!33103) (Cons!33102 (h!34365 (_ BitVec 64)) (t!47792 List!33106)) )
))
(declare-fun arrayNoDuplicates!0 (array!96331 (_ BitVec 32) List!33106) Bool)

(assert (=> b!1409504 (= res!947274 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33103))))

(declare-fun b!1409505 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96331 (_ BitVec 32)) SeekEntryResult!10846)

(assert (=> b!1409505 (= e!797627 (= (seekEntryOrOpen!0 (select (arr!46509 a!2901) j!112) a!2901 mask!2840) (Found!10846 j!112)))))

(declare-fun b!1409506 () Bool)

(declare-fun res!947281 () Bool)

(assert (=> b!1409506 (=> (not res!947281) (not e!797629))))

(assert (=> b!1409506 (= res!947281 (and (= (size!47061 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47061 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47061 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409507 () Bool)

(declare-fun res!947278 () Bool)

(assert (=> b!1409507 (=> (not res!947278) (not e!797629))))

(assert (=> b!1409507 (= res!947278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409508 () Bool)

(declare-fun res!947277 () Bool)

(assert (=> b!1409508 (=> (not res!947277) (not e!797629))))

(assert (=> b!1409508 (= res!947277 (validKeyInArray!0 (select (arr!46509 a!2901) j!112)))))

(assert (= (and start!121224 res!947280) b!1409506))

(assert (= (and b!1409506 res!947281) b!1409501))

(assert (= (and b!1409501 res!947276) b!1409508))

(assert (= (and b!1409508 res!947277) b!1409507))

(assert (= (and b!1409507 res!947278) b!1409504))

(assert (= (and b!1409504 res!947274) b!1409503))

(assert (= (and b!1409503 res!947279) b!1409505))

(assert (= (and b!1409503 (not res!947275)) b!1409502))

(declare-fun m!1298823 () Bool)

(assert (=> start!121224 m!1298823))

(declare-fun m!1298825 () Bool)

(assert (=> start!121224 m!1298825))

(declare-fun m!1298827 () Bool)

(assert (=> b!1409502 m!1298827))

(declare-fun m!1298829 () Bool)

(assert (=> b!1409502 m!1298829))

(assert (=> b!1409502 m!1298829))

(declare-fun m!1298831 () Bool)

(assert (=> b!1409502 m!1298831))

(assert (=> b!1409502 m!1298831))

(assert (=> b!1409502 m!1298829))

(declare-fun m!1298833 () Bool)

(assert (=> b!1409502 m!1298833))

(declare-fun m!1298835 () Bool)

(assert (=> b!1409508 m!1298835))

(assert (=> b!1409508 m!1298835))

(declare-fun m!1298837 () Bool)

(assert (=> b!1409508 m!1298837))

(assert (=> b!1409505 m!1298835))

(assert (=> b!1409505 m!1298835))

(declare-fun m!1298839 () Bool)

(assert (=> b!1409505 m!1298839))

(declare-fun m!1298841 () Bool)

(assert (=> b!1409507 m!1298841))

(declare-fun m!1298843 () Bool)

(assert (=> b!1409504 m!1298843))

(assert (=> b!1409503 m!1298835))

(declare-fun m!1298845 () Bool)

(assert (=> b!1409503 m!1298845))

(assert (=> b!1409503 m!1298835))

(declare-fun m!1298847 () Bool)

(assert (=> b!1409503 m!1298847))

(assert (=> b!1409503 m!1298845))

(assert (=> b!1409503 m!1298835))

(declare-fun m!1298849 () Bool)

(assert (=> b!1409503 m!1298849))

(declare-fun m!1298851 () Bool)

(assert (=> b!1409503 m!1298851))

(declare-fun m!1298853 () Bool)

(assert (=> b!1409501 m!1298853))

(assert (=> b!1409501 m!1298853))

(declare-fun m!1298855 () Bool)

(assert (=> b!1409501 m!1298855))

(push 1)

(assert (not b!1409504))

(assert (not b!1409508))

(assert (not b!1409503))

(assert (not b!1409502))

(assert (not b!1409505))

(assert (not start!121224))

(assert (not b!1409507))

(assert (not b!1409501))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

