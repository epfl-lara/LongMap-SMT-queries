; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121080 () Bool)

(assert start!121080)

(declare-fun b!1407788 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96309 0))(
  ( (array!96310 (arr!46500 (Array (_ BitVec 32) (_ BitVec 64))) (size!47051 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96309)

(declare-fun e!796883 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10714 0))(
  ( (MissingZero!10714 (index!45233 (_ BitVec 32))) (Found!10714 (index!45234 (_ BitVec 32))) (Intermediate!10714 (undefined!11526 Bool) (index!45235 (_ BitVec 32)) (x!126980 (_ BitVec 32))) (Undefined!10714) (MissingVacant!10714 (index!45236 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96309 (_ BitVec 32)) SeekEntryResult!10714)

(assert (=> b!1407788 (= e!796883 (= (seekEntryOrOpen!0 (select (arr!46500 a!2901) j!112) a!2901 mask!2840) (Found!10714 j!112)))))

(declare-fun res!945326 () Bool)

(declare-fun e!796884 () Bool)

(assert (=> start!121080 (=> (not res!945326) (not e!796884))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121080 (= res!945326 (validMask!0 mask!2840))))

(assert (=> start!121080 e!796884))

(assert (=> start!121080 true))

(declare-fun array_inv!35781 (array!96309) Bool)

(assert (=> start!121080 (array_inv!35781 a!2901)))

(declare-fun b!1407789 () Bool)

(declare-fun res!945328 () Bool)

(assert (=> b!1407789 (=> (not res!945328) (not e!796884))))

(declare-datatypes ((List!33006 0))(
  ( (Nil!33003) (Cons!33002 (h!34264 (_ BitVec 64)) (t!47692 List!33006)) )
))
(declare-fun arrayNoDuplicates!0 (array!96309 (_ BitVec 32) List!33006) Bool)

(assert (=> b!1407789 (= res!945328 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33003))))

(declare-fun b!1407790 () Bool)

(declare-fun res!945321 () Bool)

(assert (=> b!1407790 (=> (not res!945321) (not e!796884))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96309 (_ BitVec 32)) Bool)

(assert (=> b!1407790 (= res!945321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1407791 () Bool)

(declare-fun res!945327 () Bool)

(assert (=> b!1407791 (=> (not res!945327) (not e!796884))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407791 (= res!945327 (validKeyInArray!0 (select (arr!46500 a!2901) i!1037)))))

(declare-fun b!1407792 () Bool)

(declare-fun res!945322 () Bool)

(assert (=> b!1407792 (=> (not res!945322) (not e!796884))))

(assert (=> b!1407792 (= res!945322 (validKeyInArray!0 (select (arr!46500 a!2901) j!112)))))

(declare-fun b!1407793 () Bool)

(declare-fun e!796886 () Bool)

(assert (=> b!1407793 (= e!796886 true)))

(declare-fun lt!619861 () SeekEntryResult!10714)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96309 (_ BitVec 32)) SeekEntryResult!10714)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407793 (= lt!619861 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46500 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46500 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96310 (store (arr!46500 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47051 a!2901)) mask!2840))))

(declare-fun b!1407794 () Bool)

(declare-fun res!945325 () Bool)

(assert (=> b!1407794 (=> (not res!945325) (not e!796884))))

(assert (=> b!1407794 (= res!945325 (and (= (size!47051 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47051 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47051 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407795 () Bool)

(assert (=> b!1407795 (= e!796884 (not e!796886))))

(declare-fun res!945324 () Bool)

(assert (=> b!1407795 (=> res!945324 e!796886)))

(declare-fun lt!619860 () SeekEntryResult!10714)

(assert (=> b!1407795 (= res!945324 (or (not (is-Intermediate!10714 lt!619860)) (undefined!11526 lt!619860)))))

(assert (=> b!1407795 e!796883))

(declare-fun res!945323 () Bool)

(assert (=> b!1407795 (=> (not res!945323) (not e!796883))))

(assert (=> b!1407795 (= res!945323 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47429 0))(
  ( (Unit!47430) )
))
(declare-fun lt!619862 () Unit!47429)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96309 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47429)

(assert (=> b!1407795 (= lt!619862 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1407795 (= lt!619860 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46500 a!2901) j!112) mask!2840) (select (arr!46500 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!121080 res!945326) b!1407794))

(assert (= (and b!1407794 res!945325) b!1407791))

(assert (= (and b!1407791 res!945327) b!1407792))

(assert (= (and b!1407792 res!945322) b!1407790))

(assert (= (and b!1407790 res!945321) b!1407789))

(assert (= (and b!1407789 res!945328) b!1407795))

(assert (= (and b!1407795 res!945323) b!1407788))

(assert (= (and b!1407795 (not res!945324)) b!1407793))

(declare-fun m!1297251 () Bool)

(assert (=> b!1407793 m!1297251))

(declare-fun m!1297253 () Bool)

(assert (=> b!1407793 m!1297253))

(assert (=> b!1407793 m!1297253))

(declare-fun m!1297255 () Bool)

(assert (=> b!1407793 m!1297255))

(assert (=> b!1407793 m!1297255))

(assert (=> b!1407793 m!1297253))

(declare-fun m!1297257 () Bool)

(assert (=> b!1407793 m!1297257))

(declare-fun m!1297259 () Bool)

(assert (=> b!1407791 m!1297259))

(assert (=> b!1407791 m!1297259))

(declare-fun m!1297261 () Bool)

(assert (=> b!1407791 m!1297261))

(declare-fun m!1297263 () Bool)

(assert (=> b!1407795 m!1297263))

(declare-fun m!1297265 () Bool)

(assert (=> b!1407795 m!1297265))

(assert (=> b!1407795 m!1297263))

(declare-fun m!1297267 () Bool)

(assert (=> b!1407795 m!1297267))

(assert (=> b!1407795 m!1297265))

(assert (=> b!1407795 m!1297263))

(declare-fun m!1297269 () Bool)

(assert (=> b!1407795 m!1297269))

(declare-fun m!1297271 () Bool)

(assert (=> b!1407795 m!1297271))

(declare-fun m!1297273 () Bool)

(assert (=> b!1407789 m!1297273))

(assert (=> b!1407792 m!1297263))

(assert (=> b!1407792 m!1297263))

(declare-fun m!1297275 () Bool)

(assert (=> b!1407792 m!1297275))

(assert (=> b!1407788 m!1297263))

(assert (=> b!1407788 m!1297263))

(declare-fun m!1297277 () Bool)

(assert (=> b!1407788 m!1297277))

(declare-fun m!1297279 () Bool)

(assert (=> b!1407790 m!1297279))

(declare-fun m!1297281 () Bool)

(assert (=> start!121080 m!1297281))

(declare-fun m!1297283 () Bool)

(assert (=> start!121080 m!1297283))

(push 1)

(assert (not b!1407791))

(assert (not b!1407793))

(assert (not b!1407788))

(assert (not b!1407792))

(assert (not b!1407790))

(assert (not b!1407789))

(assert (not b!1407795))

(assert (not start!121080))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

