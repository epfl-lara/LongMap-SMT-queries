; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118866 () Bool)

(assert start!118866)

(declare-fun b!1388489 () Bool)

(declare-fun res!928771 () Bool)

(declare-fun e!786553 () Bool)

(assert (=> b!1388489 (=> (not res!928771) (not e!786553))))

(declare-datatypes ((array!94944 0))(
  ( (array!94945 (arr!45845 (Array (_ BitVec 32) (_ BitVec 64))) (size!46395 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94944)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388489 (= res!928771 (validKeyInArray!0 (select (arr!45845 a!2901) j!112)))))

(declare-fun res!928773 () Bool)

(assert (=> start!118866 (=> (not res!928773) (not e!786553))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118866 (= res!928773 (validMask!0 mask!2840))))

(assert (=> start!118866 e!786553))

(assert (=> start!118866 true))

(declare-fun array_inv!34873 (array!94944) Bool)

(assert (=> start!118866 (array_inv!34873 a!2901)))

(declare-fun b!1388488 () Bool)

(declare-fun res!928772 () Bool)

(assert (=> b!1388488 (=> (not res!928772) (not e!786553))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1388488 (= res!928772 (validKeyInArray!0 (select (arr!45845 a!2901) i!1037)))))

(declare-fun b!1388487 () Bool)

(declare-fun res!928774 () Bool)

(assert (=> b!1388487 (=> (not res!928774) (not e!786553))))

(assert (=> b!1388487 (= res!928774 (and (= (size!46395 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46395 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46395 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1388490 () Bool)

(assert (=> b!1388490 (= e!786553 (bvsgt #b00000000000000000000000000000000 (size!46395 a!2901)))))

(assert (= (and start!118866 res!928773) b!1388487))

(assert (= (and b!1388487 res!928774) b!1388488))

(assert (= (and b!1388488 res!928772) b!1388489))

(assert (= (and b!1388489 res!928771) b!1388490))

(declare-fun m!1274241 () Bool)

(assert (=> b!1388489 m!1274241))

(assert (=> b!1388489 m!1274241))

(declare-fun m!1274243 () Bool)

(assert (=> b!1388489 m!1274243))

(declare-fun m!1274245 () Bool)

(assert (=> start!118866 m!1274245))

(declare-fun m!1274247 () Bool)

(assert (=> start!118866 m!1274247))

(declare-fun m!1274249 () Bool)

(assert (=> b!1388488 m!1274249))

(assert (=> b!1388488 m!1274249))

(declare-fun m!1274251 () Bool)

(assert (=> b!1388488 m!1274251))

(push 1)

(assert (not b!1388489))

