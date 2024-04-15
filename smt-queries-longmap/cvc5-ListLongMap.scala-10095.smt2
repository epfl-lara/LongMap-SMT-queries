; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119028 () Bool)

(assert start!119028)

(declare-fun b!1389055 () Bool)

(declare-fun res!929305 () Bool)

(declare-fun e!786866 () Bool)

(assert (=> b!1389055 (=> (not res!929305) (not e!786866))))

(declare-datatypes ((array!94951 0))(
  ( (array!94952 (arr!45843 (Array (_ BitVec 32) (_ BitVec 64))) (size!46395 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94951)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389055 (= res!929305 (validKeyInArray!0 (select (arr!45843 a!2901) i!1037)))))

(declare-fun b!1389056 () Bool)

(assert (=> b!1389056 (= e!786866 false)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!610295 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389056 (= lt!610295 (toIndex!0 (select (arr!45843 a!2901) j!112) mask!2840))))

(declare-fun res!929304 () Bool)

(assert (=> start!119028 (=> (not res!929304) (not e!786866))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119028 (= res!929304 (validMask!0 mask!2840))))

(assert (=> start!119028 e!786866))

(assert (=> start!119028 true))

(declare-fun array_inv!35076 (array!94951) Bool)

(assert (=> start!119028 (array_inv!35076 a!2901)))

(declare-fun b!1389057 () Bool)

(declare-fun res!929302 () Bool)

(assert (=> b!1389057 (=> (not res!929302) (not e!786866))))

(declare-datatypes ((List!32440 0))(
  ( (Nil!32437) (Cons!32436 (h!33651 (_ BitVec 64)) (t!47126 List!32440)) )
))
(declare-fun arrayNoDuplicates!0 (array!94951 (_ BitVec 32) List!32440) Bool)

(assert (=> b!1389057 (= res!929302 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32437))))

(declare-fun b!1389058 () Bool)

(declare-fun res!929300 () Bool)

(assert (=> b!1389058 (=> (not res!929300) (not e!786866))))

(assert (=> b!1389058 (= res!929300 (validKeyInArray!0 (select (arr!45843 a!2901) j!112)))))

(declare-fun b!1389059 () Bool)

(declare-fun res!929303 () Bool)

(assert (=> b!1389059 (=> (not res!929303) (not e!786866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94951 (_ BitVec 32)) Bool)

(assert (=> b!1389059 (= res!929303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389060 () Bool)

(declare-fun res!929301 () Bool)

(assert (=> b!1389060 (=> (not res!929301) (not e!786866))))

(assert (=> b!1389060 (= res!929301 (and (= (size!46395 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46395 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46395 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119028 res!929304) b!1389060))

(assert (= (and b!1389060 res!929301) b!1389055))

(assert (= (and b!1389055 res!929305) b!1389058))

(assert (= (and b!1389058 res!929300) b!1389059))

(assert (= (and b!1389059 res!929303) b!1389057))

(assert (= (and b!1389057 res!929302) b!1389056))

(declare-fun m!1274275 () Bool)

(assert (=> b!1389055 m!1274275))

(assert (=> b!1389055 m!1274275))

(declare-fun m!1274277 () Bool)

(assert (=> b!1389055 m!1274277))

(declare-fun m!1274279 () Bool)

(assert (=> b!1389058 m!1274279))

(assert (=> b!1389058 m!1274279))

(declare-fun m!1274281 () Bool)

(assert (=> b!1389058 m!1274281))

(declare-fun m!1274283 () Bool)

(assert (=> b!1389059 m!1274283))

(assert (=> b!1389056 m!1274279))

(assert (=> b!1389056 m!1274279))

(declare-fun m!1274285 () Bool)

(assert (=> b!1389056 m!1274285))

(declare-fun m!1274287 () Bool)

(assert (=> start!119028 m!1274287))

(declare-fun m!1274289 () Bool)

(assert (=> start!119028 m!1274289))

(declare-fun m!1274291 () Bool)

(assert (=> b!1389057 m!1274291))

(push 1)

(assert (not b!1389055))

(assert (not b!1389058))

(assert (not start!119028))

(assert (not b!1389057))

(assert (not b!1389059))

(assert (not b!1389056))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

