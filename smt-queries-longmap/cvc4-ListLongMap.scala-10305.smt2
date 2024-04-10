; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121156 () Bool)

(assert start!121156)

(declare-fun b!1408718 () Bool)

(declare-fun e!797234 () Bool)

(declare-fun e!797236 () Bool)

(assert (=> b!1408718 (= e!797234 (not e!797236))))

(declare-fun res!946444 () Bool)

(assert (=> b!1408718 (=> res!946444 e!797236)))

(declare-datatypes ((SeekEntryResult!10809 0))(
  ( (MissingZero!10809 (index!45613 (_ BitVec 32))) (Found!10809 (index!45614 (_ BitVec 32))) (Intermediate!10809 (undefined!11621 Bool) (index!45615 (_ BitVec 32)) (x!127210 (_ BitVec 32))) (Undefined!10809) (MissingVacant!10809 (index!45616 (_ BitVec 32))) )
))
(declare-fun lt!620452 () SeekEntryResult!10809)

(assert (=> b!1408718 (= res!946444 (or (not (is-Intermediate!10809 lt!620452)) (undefined!11621 lt!620452)))))

(declare-fun e!797237 () Bool)

(assert (=> b!1408718 e!797237))

(declare-fun res!946442 () Bool)

(assert (=> b!1408718 (=> (not res!946442) (not e!797237))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96310 0))(
  ( (array!96311 (arr!46498 (Array (_ BitVec 32) (_ BitVec 64))) (size!47048 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96310)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96310 (_ BitVec 32)) Bool)

(assert (=> b!1408718 (= res!946442 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47592 0))(
  ( (Unit!47593) )
))
(declare-fun lt!620453 () Unit!47592)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96310 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47592)

(assert (=> b!1408718 (= lt!620453 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96310 (_ BitVec 32)) SeekEntryResult!10809)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408718 (= lt!620452 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46498 a!2901) j!112) mask!2840) (select (arr!46498 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408719 () Bool)

(declare-fun res!946440 () Bool)

(assert (=> b!1408719 (=> (not res!946440) (not e!797234))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1408719 (= res!946440 (and (= (size!47048 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47048 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47048 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408720 () Bool)

(declare-fun res!946445 () Bool)

(assert (=> b!1408720 (=> (not res!946445) (not e!797234))))

(assert (=> b!1408720 (= res!946445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408721 () Bool)

(assert (=> b!1408721 (= e!797236 true)))

(declare-fun lt!620454 () SeekEntryResult!10809)

(assert (=> b!1408721 (= lt!620454 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46498 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46498 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96311 (store (arr!46498 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47048 a!2901)) mask!2840))))

(declare-fun b!1408722 () Bool)

(declare-fun res!946443 () Bool)

(assert (=> b!1408722 (=> (not res!946443) (not e!797234))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408722 (= res!946443 (validKeyInArray!0 (select (arr!46498 a!2901) i!1037)))))

(declare-fun res!946447 () Bool)

(assert (=> start!121156 (=> (not res!946447) (not e!797234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121156 (= res!946447 (validMask!0 mask!2840))))

(assert (=> start!121156 e!797234))

(assert (=> start!121156 true))

(declare-fun array_inv!35526 (array!96310) Bool)

(assert (=> start!121156 (array_inv!35526 a!2901)))

(declare-fun b!1408723 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96310 (_ BitVec 32)) SeekEntryResult!10809)

(assert (=> b!1408723 (= e!797237 (= (seekEntryOrOpen!0 (select (arr!46498 a!2901) j!112) a!2901 mask!2840) (Found!10809 j!112)))))

(declare-fun b!1408724 () Bool)

(declare-fun res!946446 () Bool)

(assert (=> b!1408724 (=> (not res!946446) (not e!797234))))

(assert (=> b!1408724 (= res!946446 (validKeyInArray!0 (select (arr!46498 a!2901) j!112)))))

(declare-fun b!1408725 () Bool)

(declare-fun res!946441 () Bool)

(assert (=> b!1408725 (=> (not res!946441) (not e!797234))))

(declare-datatypes ((List!33017 0))(
  ( (Nil!33014) (Cons!33013 (h!34276 (_ BitVec 64)) (t!47711 List!33017)) )
))
(declare-fun arrayNoDuplicates!0 (array!96310 (_ BitVec 32) List!33017) Bool)

(assert (=> b!1408725 (= res!946441 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33014))))

(assert (= (and start!121156 res!946447) b!1408719))

(assert (= (and b!1408719 res!946440) b!1408722))

(assert (= (and b!1408722 res!946443) b!1408724))

(assert (= (and b!1408724 res!946446) b!1408720))

(assert (= (and b!1408720 res!946445) b!1408725))

(assert (= (and b!1408725 res!946441) b!1408718))

(assert (= (and b!1408718 res!946442) b!1408723))

(assert (= (and b!1408718 (not res!946444)) b!1408721))

(declare-fun m!1298135 () Bool)

(assert (=> start!121156 m!1298135))

(declare-fun m!1298137 () Bool)

(assert (=> start!121156 m!1298137))

(declare-fun m!1298139 () Bool)

(assert (=> b!1408725 m!1298139))

(declare-fun m!1298141 () Bool)

(assert (=> b!1408722 m!1298141))

(assert (=> b!1408722 m!1298141))

(declare-fun m!1298143 () Bool)

(assert (=> b!1408722 m!1298143))

(declare-fun m!1298145 () Bool)

(assert (=> b!1408721 m!1298145))

(declare-fun m!1298147 () Bool)

(assert (=> b!1408721 m!1298147))

(assert (=> b!1408721 m!1298147))

(declare-fun m!1298149 () Bool)

(assert (=> b!1408721 m!1298149))

(assert (=> b!1408721 m!1298149))

(assert (=> b!1408721 m!1298147))

(declare-fun m!1298151 () Bool)

(assert (=> b!1408721 m!1298151))

(declare-fun m!1298153 () Bool)

(assert (=> b!1408718 m!1298153))

(declare-fun m!1298155 () Bool)

(assert (=> b!1408718 m!1298155))

(assert (=> b!1408718 m!1298153))

(declare-fun m!1298157 () Bool)

(assert (=> b!1408718 m!1298157))

(assert (=> b!1408718 m!1298155))

(assert (=> b!1408718 m!1298153))

(declare-fun m!1298159 () Bool)

(assert (=> b!1408718 m!1298159))

(declare-fun m!1298161 () Bool)

(assert (=> b!1408718 m!1298161))

(assert (=> b!1408723 m!1298153))

(assert (=> b!1408723 m!1298153))

(declare-fun m!1298163 () Bool)

(assert (=> b!1408723 m!1298163))

(assert (=> b!1408724 m!1298153))

(assert (=> b!1408724 m!1298153))

(declare-fun m!1298165 () Bool)

(assert (=> b!1408724 m!1298165))

(declare-fun m!1298167 () Bool)

(assert (=> b!1408720 m!1298167))

(push 1)

(assert (not start!121156))

(assert (not b!1408721))

(assert (not b!1408722))

(assert (not b!1408724))

(assert (not b!1408720))

(assert (not b!1408725))

(assert (not b!1408723))

(assert (not b!1408718))

(check-sat)

(pop 1)

