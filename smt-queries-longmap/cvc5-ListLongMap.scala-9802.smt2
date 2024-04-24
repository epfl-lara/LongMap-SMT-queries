; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116690 () Bool)

(assert start!116690)

(declare-fun res!917682 () Bool)

(declare-fun e!779211 () Bool)

(assert (=> start!116690 (=> (not res!917682) (not e!779211))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93281 0))(
  ( (array!93282 (arr!45042 (Array (_ BitVec 32) (_ BitVec 64))) (size!45593 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93281)

(assert (=> start!116690 (= res!917682 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45593 a!4142))))))

(assert (=> start!116690 e!779211))

(assert (=> start!116690 true))

(declare-fun array_inv!34323 (array!93281) Bool)

(assert (=> start!116690 (array_inv!34323 a!4142)))

(declare-fun b!1375278 () Bool)

(declare-fun res!917681 () Bool)

(assert (=> b!1375278 (=> (not res!917681) (not e!779211))))

(assert (=> b!1375278 (= res!917681 (and (bvslt (size!45593 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45593 a!4142))))))

(declare-fun b!1375279 () Bool)

(assert (=> b!1375279 (= e!779211 false)))

(declare-fun lt!603653 () (_ BitVec 32))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93281 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375279 (= lt!603653 (arrayCountValidKeys!0 (array!93282 (store (arr!45042 a!4142) i!1457 k!2959) (size!45593 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603654 () (_ BitVec 32))

(assert (=> b!1375279 (= lt!603654 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1375276 () Bool)

(declare-fun res!917679 () Bool)

(assert (=> b!1375276 (=> (not res!917679) (not e!779211))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375276 (= res!917679 (validKeyInArray!0 (select (arr!45042 a!4142) i!1457)))))

(declare-fun b!1375277 () Bool)

(declare-fun res!917680 () Bool)

(assert (=> b!1375277 (=> (not res!917680) (not e!779211))))

(assert (=> b!1375277 (= res!917680 (not (validKeyInArray!0 k!2959)))))

(assert (= (and start!116690 res!917682) b!1375276))

(assert (= (and b!1375276 res!917679) b!1375277))

(assert (= (and b!1375277 res!917680) b!1375278))

(assert (= (and b!1375278 res!917681) b!1375279))

(declare-fun m!1258769 () Bool)

(assert (=> start!116690 m!1258769))

(declare-fun m!1258771 () Bool)

(assert (=> b!1375279 m!1258771))

(declare-fun m!1258773 () Bool)

(assert (=> b!1375279 m!1258773))

(declare-fun m!1258775 () Bool)

(assert (=> b!1375279 m!1258775))

(declare-fun m!1258777 () Bool)

(assert (=> b!1375276 m!1258777))

(assert (=> b!1375276 m!1258777))

(declare-fun m!1258779 () Bool)

(assert (=> b!1375276 m!1258779))

(declare-fun m!1258781 () Bool)

(assert (=> b!1375277 m!1258781))

(push 1)

(assert (not b!1375276))

(assert (not start!116690))

(assert (not b!1375279))

(assert (not b!1375277))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

