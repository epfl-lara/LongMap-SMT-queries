; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119040 () Bool)

(assert start!119040)

(declare-fun b!1389163 () Bool)

(declare-fun e!786901 () Bool)

(assert (=> b!1389163 (= e!786901 false)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!94963 0))(
  ( (array!94964 (arr!45849 (Array (_ BitVec 32) (_ BitVec 64))) (size!46401 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94963)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lt!610313 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389163 (= lt!610313 (toIndex!0 (select (arr!45849 a!2901) j!112) mask!2840))))

(declare-fun b!1389164 () Bool)

(declare-fun res!929413 () Bool)

(assert (=> b!1389164 (=> (not res!929413) (not e!786901))))

(declare-datatypes ((List!32446 0))(
  ( (Nil!32443) (Cons!32442 (h!33657 (_ BitVec 64)) (t!47132 List!32446)) )
))
(declare-fun arrayNoDuplicates!0 (array!94963 (_ BitVec 32) List!32446) Bool)

(assert (=> b!1389164 (= res!929413 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32443))))

(declare-fun b!1389165 () Bool)

(declare-fun res!929408 () Bool)

(assert (=> b!1389165 (=> (not res!929408) (not e!786901))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389165 (= res!929408 (validKeyInArray!0 (select (arr!45849 a!2901) j!112)))))

(declare-fun res!929410 () Bool)

(assert (=> start!119040 (=> (not res!929410) (not e!786901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119040 (= res!929410 (validMask!0 mask!2840))))

(assert (=> start!119040 e!786901))

(assert (=> start!119040 true))

(declare-fun array_inv!35082 (array!94963) Bool)

(assert (=> start!119040 (array_inv!35082 a!2901)))

(declare-fun b!1389166 () Bool)

(declare-fun res!929411 () Bool)

(assert (=> b!1389166 (=> (not res!929411) (not e!786901))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1389166 (= res!929411 (validKeyInArray!0 (select (arr!45849 a!2901) i!1037)))))

(declare-fun b!1389167 () Bool)

(declare-fun res!929409 () Bool)

(assert (=> b!1389167 (=> (not res!929409) (not e!786901))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94963 (_ BitVec 32)) Bool)

(assert (=> b!1389167 (= res!929409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389168 () Bool)

(declare-fun res!929412 () Bool)

(assert (=> b!1389168 (=> (not res!929412) (not e!786901))))

(assert (=> b!1389168 (= res!929412 (and (= (size!46401 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46401 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46401 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119040 res!929410) b!1389168))

(assert (= (and b!1389168 res!929412) b!1389166))

(assert (= (and b!1389166 res!929411) b!1389165))

(assert (= (and b!1389165 res!929408) b!1389167))

(assert (= (and b!1389167 res!929409) b!1389164))

(assert (= (and b!1389164 res!929413) b!1389163))

(declare-fun m!1274383 () Bool)

(assert (=> start!119040 m!1274383))

(declare-fun m!1274385 () Bool)

(assert (=> start!119040 m!1274385))

(declare-fun m!1274387 () Bool)

(assert (=> b!1389167 m!1274387))

(declare-fun m!1274389 () Bool)

(assert (=> b!1389163 m!1274389))

(assert (=> b!1389163 m!1274389))

(declare-fun m!1274391 () Bool)

(assert (=> b!1389163 m!1274391))

(declare-fun m!1274393 () Bool)

(assert (=> b!1389166 m!1274393))

(assert (=> b!1389166 m!1274393))

(declare-fun m!1274395 () Bool)

(assert (=> b!1389166 m!1274395))

(assert (=> b!1389165 m!1274389))

(assert (=> b!1389165 m!1274389))

(declare-fun m!1274397 () Bool)

(assert (=> b!1389165 m!1274397))

(declare-fun m!1274399 () Bool)

(assert (=> b!1389164 m!1274399))

(push 1)

(assert (not b!1389164))

(assert (not b!1389167))

(assert (not b!1389166))

(assert (not start!119040))

(assert (not b!1389165))

(assert (not b!1389163))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

