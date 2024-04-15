; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116456 () Bool)

(assert start!116456)

(declare-fun b!1373906 () Bool)

(declare-fun res!917134 () Bool)

(declare-fun e!778335 () Bool)

(assert (=> b!1373906 (=> (not res!917134) (not e!778335))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373906 (= res!917134 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1373905 () Bool)

(declare-fun res!917133 () Bool)

(assert (=> b!1373905 (=> (not res!917133) (not e!778335))))

(declare-datatypes ((array!93115 0))(
  ( (array!93116 (arr!44964 (Array (_ BitVec 32) (_ BitVec 64))) (size!45516 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93115)

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1373905 (= res!917133 (validKeyInArray!0 (select (arr!44964 a!4142) i!1457)))))

(declare-fun res!917135 () Bool)

(assert (=> start!116456 (=> (not res!917135) (not e!778335))))

(assert (=> start!116456 (= res!917135 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45516 a!4142))))))

(assert (=> start!116456 e!778335))

(assert (=> start!116456 true))

(declare-fun array_inv!34197 (array!93115) Bool)

(assert (=> start!116456 (array_inv!34197 a!4142)))

(declare-fun b!1373908 () Bool)

(assert (=> b!1373908 (= e!778335 false)))

(declare-fun lt!602991 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93115 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1373908 (= lt!602991 (arrayCountValidKeys!0 (array!93116 (store (arr!44964 a!4142) i!1457 k!2959) (size!45516 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!602990 () (_ BitVec 32))

(assert (=> b!1373908 (= lt!602990 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1373907 () Bool)

(declare-fun res!917132 () Bool)

(assert (=> b!1373907 (=> (not res!917132) (not e!778335))))

(assert (=> b!1373907 (= res!917132 (and (bvslt (size!45516 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45516 a!4142))))))

(assert (= (and start!116456 res!917135) b!1373905))

(assert (= (and b!1373905 res!917133) b!1373906))

(assert (= (and b!1373906 res!917134) b!1373907))

(assert (= (and b!1373907 res!917132) b!1373908))

(declare-fun m!1256647 () Bool)

(assert (=> b!1373906 m!1256647))

(declare-fun m!1256649 () Bool)

(assert (=> b!1373905 m!1256649))

(assert (=> b!1373905 m!1256649))

(declare-fun m!1256651 () Bool)

(assert (=> b!1373905 m!1256651))

(declare-fun m!1256653 () Bool)

(assert (=> start!116456 m!1256653))

(declare-fun m!1256655 () Bool)

(assert (=> b!1373908 m!1256655))

(declare-fun m!1256657 () Bool)

(assert (=> b!1373908 m!1256657))

(declare-fun m!1256659 () Bool)

(assert (=> b!1373908 m!1256659))

(push 1)

(assert (not b!1373906))

(assert (not start!116456))

(assert (not b!1373905))

(assert (not b!1373908))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

