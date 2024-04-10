; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118048 () Bool)

(assert start!118048)

(declare-fun b!1382353 () Bool)

(declare-fun res!923944 () Bool)

(declare-fun e!783529 () Bool)

(assert (=> b!1382353 (=> (not res!923944) (not e!783529))))

(declare-datatypes ((array!94412 0))(
  ( (array!94413 (arr!45587 (Array (_ BitVec 32) (_ BitVec 64))) (size!46137 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94412)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382353 (= res!923944 (validKeyInArray!0 (select (arr!45587 a!2971) i!1094)))))

(declare-fun b!1382354 () Bool)

(declare-fun res!923946 () Bool)

(assert (=> b!1382354 (=> (not res!923946) (not e!783529))))

(declare-datatypes ((List!32121 0))(
  ( (Nil!32118) (Cons!32117 (h!33326 (_ BitVec 64)) (t!46815 List!32121)) )
))
(declare-fun arrayNoDuplicates!0 (array!94412 (_ BitVec 32) List!32121) Bool)

(assert (=> b!1382354 (= res!923946 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32118))))

(declare-fun res!923947 () Bool)

(assert (=> start!118048 (=> (not res!923947) (not e!783529))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118048 (= res!923947 (validMask!0 mask!3034))))

(assert (=> start!118048 e!783529))

(assert (=> start!118048 true))

(declare-fun array_inv!34615 (array!94412) Bool)

(assert (=> start!118048 (array_inv!34615 a!2971)))

(declare-fun b!1382352 () Bool)

(declare-fun res!923945 () Bool)

(assert (=> b!1382352 (=> (not res!923945) (not e!783529))))

(assert (=> b!1382352 (= res!923945 (and (= (size!46137 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46137 a!2971))))))

(declare-fun b!1382355 () Bool)

(assert (=> b!1382355 (= e!783529 false)))

(declare-fun lt!608406 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94412 (_ BitVec 32)) Bool)

(assert (=> b!1382355 (= lt!608406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(assert (= (and start!118048 res!923947) b!1382352))

(assert (= (and b!1382352 res!923945) b!1382353))

(assert (= (and b!1382353 res!923944) b!1382354))

(assert (= (and b!1382354 res!923946) b!1382355))

(declare-fun m!1267491 () Bool)

(assert (=> b!1382353 m!1267491))

(assert (=> b!1382353 m!1267491))

(declare-fun m!1267493 () Bool)

(assert (=> b!1382353 m!1267493))

(declare-fun m!1267495 () Bool)

(assert (=> b!1382354 m!1267495))

(declare-fun m!1267497 () Bool)

(assert (=> start!118048 m!1267497))

(declare-fun m!1267499 () Bool)

(assert (=> start!118048 m!1267499))

(declare-fun m!1267501 () Bool)

(assert (=> b!1382355 m!1267501))

(push 1)

(assert (not b!1382355))

(assert (not b!1382353))

(assert (not start!118048))

(assert (not b!1382354))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

