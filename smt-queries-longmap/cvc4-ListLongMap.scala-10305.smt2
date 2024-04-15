; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121150 () Bool)

(assert start!121150)

(declare-fun b!1408614 () Bool)

(declare-fun res!946390 () Bool)

(declare-fun e!797183 () Bool)

(assert (=> b!1408614 (=> (not res!946390) (not e!797183))))

(declare-datatypes ((array!96257 0))(
  ( (array!96258 (arr!46472 (Array (_ BitVec 32) (_ BitVec 64))) (size!47024 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96257)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408614 (= res!946390 (validKeyInArray!0 (select (arr!46472 a!2901) i!1037)))))

(declare-fun b!1408615 () Bool)

(declare-fun res!946388 () Bool)

(assert (=> b!1408615 (=> (not res!946388) (not e!797183))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1408615 (= res!946388 (validKeyInArray!0 (select (arr!46472 a!2901) j!112)))))

(declare-fun b!1408616 () Bool)

(declare-fun e!797185 () Bool)

(assert (=> b!1408616 (= e!797183 (not e!797185))))

(declare-fun res!946387 () Bool)

(assert (=> b!1408616 (=> res!946387 e!797185)))

(declare-datatypes ((SeekEntryResult!10809 0))(
  ( (MissingZero!10809 (index!45613 (_ BitVec 32))) (Found!10809 (index!45614 (_ BitVec 32))) (Intermediate!10809 (undefined!11621 Bool) (index!45615 (_ BitVec 32)) (x!127207 (_ BitVec 32))) (Undefined!10809) (MissingVacant!10809 (index!45616 (_ BitVec 32))) )
))
(declare-fun lt!620253 () SeekEntryResult!10809)

(assert (=> b!1408616 (= res!946387 (or (not (is-Intermediate!10809 lt!620253)) (undefined!11621 lt!620253)))))

(declare-fun e!797186 () Bool)

(assert (=> b!1408616 e!797186))

(declare-fun res!946392 () Bool)

(assert (=> b!1408616 (=> (not res!946392) (not e!797186))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96257 (_ BitVec 32)) Bool)

(assert (=> b!1408616 (= res!946392 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47435 0))(
  ( (Unit!47436) )
))
(declare-fun lt!620254 () Unit!47435)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96257 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47435)

(assert (=> b!1408616 (= lt!620254 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96257 (_ BitVec 32)) SeekEntryResult!10809)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408616 (= lt!620253 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46472 a!2901) j!112) mask!2840) (select (arr!46472 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408617 () Bool)

(declare-fun res!946391 () Bool)

(assert (=> b!1408617 (=> (not res!946391) (not e!797183))))

(assert (=> b!1408617 (= res!946391 (and (= (size!47024 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47024 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47024 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408618 () Bool)

(declare-fun res!946393 () Bool)

(assert (=> b!1408618 (=> (not res!946393) (not e!797183))))

(assert (=> b!1408618 (= res!946393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408619 () Bool)

(assert (=> b!1408619 (= e!797185 true)))

(declare-fun lt!620255 () SeekEntryResult!10809)

(assert (=> b!1408619 (= lt!620255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46472 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46472 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96258 (store (arr!46472 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47024 a!2901)) mask!2840))))

(declare-fun b!1408620 () Bool)

(declare-fun res!946386 () Bool)

(assert (=> b!1408620 (=> (not res!946386) (not e!797183))))

(declare-datatypes ((List!33069 0))(
  ( (Nil!33066) (Cons!33065 (h!34328 (_ BitVec 64)) (t!47755 List!33069)) )
))
(declare-fun arrayNoDuplicates!0 (array!96257 (_ BitVec 32) List!33069) Bool)

(assert (=> b!1408620 (= res!946386 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33066))))

(declare-fun res!946389 () Bool)

(assert (=> start!121150 (=> (not res!946389) (not e!797183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121150 (= res!946389 (validMask!0 mask!2840))))

(assert (=> start!121150 e!797183))

(assert (=> start!121150 true))

(declare-fun array_inv!35705 (array!96257) Bool)

(assert (=> start!121150 (array_inv!35705 a!2901)))

(declare-fun b!1408613 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96257 (_ BitVec 32)) SeekEntryResult!10809)

(assert (=> b!1408613 (= e!797186 (= (seekEntryOrOpen!0 (select (arr!46472 a!2901) j!112) a!2901 mask!2840) (Found!10809 j!112)))))

(assert (= (and start!121150 res!946389) b!1408617))

(assert (= (and b!1408617 res!946391) b!1408614))

(assert (= (and b!1408614 res!946390) b!1408615))

(assert (= (and b!1408615 res!946388) b!1408618))

(assert (= (and b!1408618 res!946393) b!1408620))

(assert (= (and b!1408620 res!946386) b!1408616))

(assert (= (and b!1408616 res!946392) b!1408613))

(assert (= (and b!1408616 (not res!946387)) b!1408619))

(declare-fun m!1297565 () Bool)

(assert (=> start!121150 m!1297565))

(declare-fun m!1297567 () Bool)

(assert (=> start!121150 m!1297567))

(declare-fun m!1297569 () Bool)

(assert (=> b!1408620 m!1297569))

(declare-fun m!1297571 () Bool)

(assert (=> b!1408618 m!1297571))

(declare-fun m!1297573 () Bool)

(assert (=> b!1408614 m!1297573))

(assert (=> b!1408614 m!1297573))

(declare-fun m!1297575 () Bool)

(assert (=> b!1408614 m!1297575))

(declare-fun m!1297577 () Bool)

(assert (=> b!1408616 m!1297577))

(declare-fun m!1297579 () Bool)

(assert (=> b!1408616 m!1297579))

(assert (=> b!1408616 m!1297577))

(declare-fun m!1297581 () Bool)

(assert (=> b!1408616 m!1297581))

(assert (=> b!1408616 m!1297579))

(assert (=> b!1408616 m!1297577))

(declare-fun m!1297583 () Bool)

(assert (=> b!1408616 m!1297583))

(declare-fun m!1297585 () Bool)

(assert (=> b!1408616 m!1297585))

(declare-fun m!1297587 () Bool)

(assert (=> b!1408619 m!1297587))

(declare-fun m!1297589 () Bool)

(assert (=> b!1408619 m!1297589))

(assert (=> b!1408619 m!1297589))

(declare-fun m!1297591 () Bool)

(assert (=> b!1408619 m!1297591))

(assert (=> b!1408619 m!1297591))

(assert (=> b!1408619 m!1297589))

(declare-fun m!1297593 () Bool)

(assert (=> b!1408619 m!1297593))

(assert (=> b!1408615 m!1297577))

(assert (=> b!1408615 m!1297577))

(declare-fun m!1297595 () Bool)

(assert (=> b!1408615 m!1297595))

(assert (=> b!1408613 m!1297577))

(assert (=> b!1408613 m!1297577))

(declare-fun m!1297597 () Bool)

(assert (=> b!1408613 m!1297597))

(push 1)

(assert (not b!1408619))

(assert (not start!121150))

(assert (not b!1408616))

(assert (not b!1408620))

(assert (not b!1408613))

(assert (not b!1408615))

(assert (not b!1408614))

(assert (not b!1408618))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

