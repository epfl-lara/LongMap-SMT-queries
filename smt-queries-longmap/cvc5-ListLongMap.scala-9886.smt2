; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117296 () Bool)

(assert start!117296)

(declare-fun b!1379437 () Bool)

(declare-fun res!921182 () Bool)

(declare-fun e!781539 () Bool)

(assert (=> b!1379437 (=> (not res!921182) (not e!781539))))

(declare-datatypes ((array!93797 0))(
  ( (array!93798 (arr!45294 (Array (_ BitVec 32) (_ BitVec 64))) (size!45845 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93797)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1379437 (= res!921182 (and (bvslt (size!45845 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45845 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379438 () Bool)

(assert (=> b!1379438 (= e!781539 false)))

(declare-fun lt!606793 () (_ BitVec 32))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93797 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379438 (= lt!606793 (arrayCountValidKeys!0 (array!93798 (store (arr!45294 a!4094) i!1451 k!2953) (size!45845 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606792 () (_ BitVec 32))

(assert (=> b!1379438 (= lt!606792 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1379436 () Bool)

(declare-fun res!921181 () Bool)

(assert (=> b!1379436 (=> (not res!921181) (not e!781539))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379436 (= res!921181 (not (validKeyInArray!0 k!2953)))))

(declare-fun res!921180 () Bool)

(assert (=> start!117296 (=> (not res!921180) (not e!781539))))

(assert (=> start!117296 (= res!921180 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45845 a!4094))))))

(assert (=> start!117296 e!781539))

(assert (=> start!117296 true))

(declare-fun array_inv!34575 (array!93797) Bool)

(assert (=> start!117296 (array_inv!34575 a!4094)))

(declare-fun b!1379435 () Bool)

(declare-fun res!921183 () Bool)

(assert (=> b!1379435 (=> (not res!921183) (not e!781539))))

(assert (=> b!1379435 (= res!921183 (validKeyInArray!0 (select (arr!45294 a!4094) i!1451)))))

(assert (= (and start!117296 res!921180) b!1379435))

(assert (= (and b!1379435 res!921183) b!1379436))

(assert (= (and b!1379436 res!921181) b!1379437))

(assert (= (and b!1379437 res!921182) b!1379438))

(declare-fun m!1264205 () Bool)

(assert (=> b!1379438 m!1264205))

(declare-fun m!1264207 () Bool)

(assert (=> b!1379438 m!1264207))

(declare-fun m!1264209 () Bool)

(assert (=> b!1379438 m!1264209))

(declare-fun m!1264211 () Bool)

(assert (=> b!1379436 m!1264211))

(declare-fun m!1264213 () Bool)

(assert (=> start!117296 m!1264213))

(declare-fun m!1264215 () Bool)

(assert (=> b!1379435 m!1264215))

(assert (=> b!1379435 m!1264215))

(declare-fun m!1264217 () Bool)

(assert (=> b!1379435 m!1264217))

(push 1)

(assert (not b!1379436))

(assert (not b!1379435))

(assert (not start!117296))

(assert (not b!1379438))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

