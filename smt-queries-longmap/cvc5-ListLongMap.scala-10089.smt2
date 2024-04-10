; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118872 () Bool)

(assert start!118872)

(declare-fun b!1388525 () Bool)

(declare-fun res!928809 () Bool)

(declare-fun e!786572 () Bool)

(assert (=> b!1388525 (=> (not res!928809) (not e!786572))))

(declare-datatypes ((array!94950 0))(
  ( (array!94951 (arr!45848 (Array (_ BitVec 32) (_ BitVec 64))) (size!46398 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94950)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94950 (_ BitVec 32)) Bool)

(assert (=> b!1388525 (= res!928809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1388526 () Bool)

(declare-fun res!928812 () Bool)

(assert (=> b!1388526 (=> (not res!928812) (not e!786572))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1388526 (= res!928812 (and (= (size!46398 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46398 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46398 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1388527 () Bool)

(declare-fun res!928810 () Bool)

(assert (=> b!1388527 (=> (not res!928810) (not e!786572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388527 (= res!928810 (validKeyInArray!0 (select (arr!45848 a!2901) j!112)))))

(declare-fun b!1388528 () Bool)

(declare-fun res!928813 () Bool)

(assert (=> b!1388528 (=> (not res!928813) (not e!786572))))

(assert (=> b!1388528 (= res!928813 (validKeyInArray!0 (select (arr!45848 a!2901) i!1037)))))

(declare-fun res!928811 () Bool)

(assert (=> start!118872 (=> (not res!928811) (not e!786572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118872 (= res!928811 (validMask!0 mask!2840))))

(assert (=> start!118872 e!786572))

(assert (=> start!118872 true))

(declare-fun array_inv!34876 (array!94950) Bool)

(assert (=> start!118872 (array_inv!34876 a!2901)))

(declare-fun b!1388529 () Bool)

(assert (=> b!1388529 (= e!786572 (bvsgt #b00000000000000000000000000000000 (size!46398 a!2901)))))

(assert (= (and start!118872 res!928811) b!1388526))

(assert (= (and b!1388526 res!928812) b!1388528))

(assert (= (and b!1388528 res!928813) b!1388527))

(assert (= (and b!1388527 res!928810) b!1388525))

(assert (= (and b!1388525 res!928809) b!1388529))

(declare-fun m!1274277 () Bool)

(assert (=> b!1388525 m!1274277))

(declare-fun m!1274279 () Bool)

(assert (=> b!1388527 m!1274279))

(assert (=> b!1388527 m!1274279))

(declare-fun m!1274281 () Bool)

(assert (=> b!1388527 m!1274281))

(declare-fun m!1274283 () Bool)

(assert (=> b!1388528 m!1274283))

(assert (=> b!1388528 m!1274283))

(declare-fun m!1274285 () Bool)

(assert (=> b!1388528 m!1274285))

(declare-fun m!1274287 () Bool)

(assert (=> start!118872 m!1274287))

(declare-fun m!1274289 () Bool)

(assert (=> start!118872 m!1274289))

(push 1)

(assert (not start!118872))

