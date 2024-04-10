; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121162 () Bool)

(assert start!121162)

(declare-fun b!1408790 () Bool)

(declare-fun res!946514 () Bool)

(declare-fun e!797273 () Bool)

(assert (=> b!1408790 (=> (not res!946514) (not e!797273))))

(declare-datatypes ((array!96316 0))(
  ( (array!96317 (arr!46501 (Array (_ BitVec 32) (_ BitVec 64))) (size!47051 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96316)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96316 (_ BitVec 32)) Bool)

(assert (=> b!1408790 (= res!946514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408791 () Bool)

(declare-fun res!946518 () Bool)

(assert (=> b!1408791 (=> (not res!946518) (not e!797273))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408791 (= res!946518 (validKeyInArray!0 (select (arr!46501 a!2901) j!112)))))

(declare-fun b!1408792 () Bool)

(declare-fun e!797270 () Bool)

(declare-datatypes ((SeekEntryResult!10812 0))(
  ( (MissingZero!10812 (index!45625 (_ BitVec 32))) (Found!10812 (index!45626 (_ BitVec 32))) (Intermediate!10812 (undefined!11624 Bool) (index!45627 (_ BitVec 32)) (x!127221 (_ BitVec 32))) (Undefined!10812) (MissingVacant!10812 (index!45628 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96316 (_ BitVec 32)) SeekEntryResult!10812)

(assert (=> b!1408792 (= e!797270 (= (seekEntryOrOpen!0 (select (arr!46501 a!2901) j!112) a!2901 mask!2840) (Found!10812 j!112)))))

(declare-fun b!1408793 () Bool)

(declare-fun res!946513 () Bool)

(assert (=> b!1408793 (=> (not res!946513) (not e!797273))))

(declare-datatypes ((List!33020 0))(
  ( (Nil!33017) (Cons!33016 (h!34279 (_ BitVec 64)) (t!47714 List!33020)) )
))
(declare-fun arrayNoDuplicates!0 (array!96316 (_ BitVec 32) List!33020) Bool)

(assert (=> b!1408793 (= res!946513 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33017))))

(declare-fun b!1408794 () Bool)

(declare-fun res!946517 () Bool)

(assert (=> b!1408794 (=> (not res!946517) (not e!797273))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1408794 (= res!946517 (validKeyInArray!0 (select (arr!46501 a!2901) i!1037)))))

(declare-fun b!1408795 () Bool)

(declare-fun e!797272 () Bool)

(assert (=> b!1408795 (= e!797273 (not e!797272))))

(declare-fun res!946512 () Bool)

(assert (=> b!1408795 (=> res!946512 e!797272)))

(declare-fun lt!620481 () SeekEntryResult!10812)

(assert (=> b!1408795 (= res!946512 (or (not (is-Intermediate!10812 lt!620481)) (undefined!11624 lt!620481)))))

(assert (=> b!1408795 e!797270))

(declare-fun res!946519 () Bool)

(assert (=> b!1408795 (=> (not res!946519) (not e!797270))))

(assert (=> b!1408795 (= res!946519 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47598 0))(
  ( (Unit!47599) )
))
(declare-fun lt!620479 () Unit!47598)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96316 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47598)

(assert (=> b!1408795 (= lt!620479 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96316 (_ BitVec 32)) SeekEntryResult!10812)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408795 (= lt!620481 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46501 a!2901) j!112) mask!2840) (select (arr!46501 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408796 () Bool)

(declare-fun res!946516 () Bool)

(assert (=> b!1408796 (=> (not res!946516) (not e!797273))))

(assert (=> b!1408796 (= res!946516 (and (= (size!47051 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47051 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47051 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408797 () Bool)

(assert (=> b!1408797 (= e!797272 true)))

(declare-fun lt!620480 () SeekEntryResult!10812)

(assert (=> b!1408797 (= lt!620480 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46501 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46501 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96317 (store (arr!46501 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47051 a!2901)) mask!2840))))

(declare-fun res!946515 () Bool)

(assert (=> start!121162 (=> (not res!946515) (not e!797273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121162 (= res!946515 (validMask!0 mask!2840))))

(assert (=> start!121162 e!797273))

(assert (=> start!121162 true))

(declare-fun array_inv!35529 (array!96316) Bool)

(assert (=> start!121162 (array_inv!35529 a!2901)))

(assert (= (and start!121162 res!946515) b!1408796))

(assert (= (and b!1408796 res!946516) b!1408794))

(assert (= (and b!1408794 res!946517) b!1408791))

(assert (= (and b!1408791 res!946518) b!1408790))

(assert (= (and b!1408790 res!946514) b!1408793))

(assert (= (and b!1408793 res!946513) b!1408795))

(assert (= (and b!1408795 res!946519) b!1408792))

(assert (= (and b!1408795 (not res!946512)) b!1408797))

(declare-fun m!1298237 () Bool)

(assert (=> b!1408793 m!1298237))

(declare-fun m!1298239 () Bool)

(assert (=> b!1408792 m!1298239))

(assert (=> b!1408792 m!1298239))

(declare-fun m!1298241 () Bool)

(assert (=> b!1408792 m!1298241))

(declare-fun m!1298243 () Bool)

(assert (=> b!1408794 m!1298243))

(assert (=> b!1408794 m!1298243))

(declare-fun m!1298245 () Bool)

(assert (=> b!1408794 m!1298245))

(declare-fun m!1298247 () Bool)

(assert (=> b!1408797 m!1298247))

(declare-fun m!1298249 () Bool)

(assert (=> b!1408797 m!1298249))

(assert (=> b!1408797 m!1298249))

(declare-fun m!1298251 () Bool)

(assert (=> b!1408797 m!1298251))

(assert (=> b!1408797 m!1298251))

(assert (=> b!1408797 m!1298249))

(declare-fun m!1298253 () Bool)

(assert (=> b!1408797 m!1298253))

(assert (=> b!1408795 m!1298239))

(declare-fun m!1298255 () Bool)

(assert (=> b!1408795 m!1298255))

(assert (=> b!1408795 m!1298239))

(declare-fun m!1298257 () Bool)

(assert (=> b!1408795 m!1298257))

(assert (=> b!1408795 m!1298255))

(assert (=> b!1408795 m!1298239))

(declare-fun m!1298259 () Bool)

(assert (=> b!1408795 m!1298259))

(declare-fun m!1298261 () Bool)

(assert (=> b!1408795 m!1298261))

(declare-fun m!1298263 () Bool)

(assert (=> b!1408790 m!1298263))

(declare-fun m!1298265 () Bool)

(assert (=> start!121162 m!1298265))

(declare-fun m!1298267 () Bool)

(assert (=> start!121162 m!1298267))

(assert (=> b!1408791 m!1298239))

(assert (=> b!1408791 m!1298239))

(declare-fun m!1298269 () Bool)

(assert (=> b!1408791 m!1298269))

(push 1)

(assert (not b!1408797))

(assert (not b!1408794))

(assert (not b!1408790))

(assert (not b!1408792))

(assert (not start!121162))

(assert (not b!1408793))

(assert (not b!1408795))

(assert (not b!1408791))

(check-sat)

(pop 1)

