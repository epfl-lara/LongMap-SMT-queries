; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116562 () Bool)

(assert start!116562)

(declare-fun res!917821 () Bool)

(declare-fun e!778747 () Bool)

(assert (=> start!116562 (=> (not res!917821) (not e!778747))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93262 0))(
  ( (array!93263 (arr!45037 (Array (_ BitVec 32) (_ BitVec 64))) (size!45587 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93262)

(assert (=> start!116562 (= res!917821 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45587 a!4142))))))

(assert (=> start!116562 e!778747))

(assert (=> start!116562 true))

(declare-fun array_inv!34065 (array!93262) Bool)

(assert (=> start!116562 (array_inv!34065 a!4142)))

(declare-fun b!1374635 () Bool)

(declare-fun res!917819 () Bool)

(assert (=> b!1374635 (=> (not res!917819) (not e!778747))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374635 (= res!917819 (validKeyInArray!0 (select (arr!45037 a!4142) i!1457)))))

(declare-fun b!1374636 () Bool)

(declare-fun res!917820 () Bool)

(assert (=> b!1374636 (=> (not res!917820) (not e!778747))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1374636 (= res!917820 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374637 () Bool)

(assert (=> b!1374637 (= e!778747 (and (bvslt (size!45587 a!4142) #b01111111111111111111111111111111) (bvsgt i!1457 (size!45587 a!4142))))))

(assert (= (and start!116562 res!917821) b!1374635))

(assert (= (and b!1374635 res!917819) b!1374636))

(assert (= (and b!1374636 res!917820) b!1374637))

(declare-fun m!1258193 () Bool)

(assert (=> start!116562 m!1258193))

(declare-fun m!1258195 () Bool)

(assert (=> b!1374635 m!1258195))

(assert (=> b!1374635 m!1258195))

(declare-fun m!1258197 () Bool)

(assert (=> b!1374635 m!1258197))

(declare-fun m!1258199 () Bool)

(assert (=> b!1374636 m!1258199))

(push 1)

(assert (not b!1374636))

(assert (not b!1374635))

(assert (not start!116562))

(check-sat)

(pop 1)

(push 1)

(check-sat)

