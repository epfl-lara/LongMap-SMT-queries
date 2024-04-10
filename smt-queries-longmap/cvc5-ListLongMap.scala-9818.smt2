; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116558 () Bool)

(assert start!116558)

(declare-fun res!917802 () Bool)

(declare-fun e!778735 () Bool)

(assert (=> start!116558 (=> (not res!917802) (not e!778735))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93258 0))(
  ( (array!93259 (arr!45035 (Array (_ BitVec 32) (_ BitVec 64))) (size!45585 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93258)

(assert (=> start!116558 (= res!917802 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45585 a!4142))))))

(assert (=> start!116558 e!778735))

(assert (=> start!116558 true))

(declare-fun array_inv!34063 (array!93258) Bool)

(assert (=> start!116558 (array_inv!34063 a!4142)))

(declare-fun b!1374617 () Bool)

(declare-fun res!917803 () Bool)

(assert (=> b!1374617 (=> (not res!917803) (not e!778735))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374617 (= res!917803 (validKeyInArray!0 (select (arr!45035 a!4142) i!1457)))))

(declare-fun b!1374618 () Bool)

(declare-fun res!917801 () Bool)

(assert (=> b!1374618 (=> (not res!917801) (not e!778735))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1374618 (= res!917801 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374619 () Bool)

(assert (=> b!1374619 (= e!778735 (and (bvslt (size!45585 a!4142) #b01111111111111111111111111111111) (bvsgt i!1457 (size!45585 a!4142))))))

(assert (= (and start!116558 res!917802) b!1374617))

(assert (= (and b!1374617 res!917803) b!1374618))

(assert (= (and b!1374618 res!917801) b!1374619))

(declare-fun m!1258177 () Bool)

(assert (=> start!116558 m!1258177))

(declare-fun m!1258179 () Bool)

(assert (=> b!1374617 m!1258179))

(assert (=> b!1374617 m!1258179))

(declare-fun m!1258181 () Bool)

(assert (=> b!1374617 m!1258181))

(declare-fun m!1258183 () Bool)

(assert (=> b!1374618 m!1258183))

(push 1)

(assert (not b!1374617))

(assert (not start!116558))

(assert (not b!1374618))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

