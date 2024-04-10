; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71956 () Bool)

(assert start!71956)

(declare-fun b!836134 () Bool)

(declare-fun res!568862 () Bool)

(declare-fun e!466445 () Bool)

(assert (=> b!836134 (=> (not res!568862) (not e!466445))))

(declare-datatypes ((array!46866 0))(
  ( (array!46867 (arr!22467 (Array (_ BitVec 32) (_ BitVec 64))) (size!22888 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46866)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!836134 (= res!568862 (and (bvslt (size!22888 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22888 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!836132 () Bool)

(declare-fun res!568861 () Bool)

(assert (=> b!836132 (=> (not res!568861) (not e!466445))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836132 (= res!568861 (not (validKeyInArray!0 (select (arr!22467 a!4227) i!1466))))))

(declare-fun b!836133 () Bool)

(declare-fun res!568860 () Bool)

(assert (=> b!836133 (=> (not res!568860) (not e!466445))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!836133 (= res!568860 (validKeyInArray!0 k!2968))))

(declare-fun b!836135 () Bool)

(assert (=> b!836135 (= e!466445 false)))

(declare-fun lt!380367 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46866 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!836135 (= lt!380367 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!380368 () (_ BitVec 32))

(assert (=> b!836135 (= lt!380368 (arrayCountValidKeys!0 (array!46867 (store (arr!22467 a!4227) i!1466 k!2968) (size!22888 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun res!568859 () Bool)

(assert (=> start!71956 (=> (not res!568859) (not e!466445))))

(assert (=> start!71956 (= res!568859 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22888 a!4227))))))

(assert (=> start!71956 e!466445))

(assert (=> start!71956 true))

(declare-fun array_inv!17914 (array!46866) Bool)

(assert (=> start!71956 (array_inv!17914 a!4227)))

(assert (= (and start!71956 res!568859) b!836132))

(assert (= (and b!836132 res!568861) b!836133))

(assert (= (and b!836133 res!568860) b!836134))

(assert (= (and b!836134 res!568862) b!836135))

(declare-fun m!781525 () Bool)

(assert (=> b!836132 m!781525))

(assert (=> b!836132 m!781525))

(declare-fun m!781527 () Bool)

(assert (=> b!836132 m!781527))

(declare-fun m!781529 () Bool)

(assert (=> b!836133 m!781529))

(declare-fun m!781531 () Bool)

(assert (=> b!836135 m!781531))

(declare-fun m!781533 () Bool)

(assert (=> b!836135 m!781533))

(declare-fun m!781535 () Bool)

(assert (=> b!836135 m!781535))

(declare-fun m!781537 () Bool)

(assert (=> start!71956 m!781537))

(push 1)

(assert (not b!836135))

(assert (not b!836133))

(assert (not b!836132))

(assert (not start!71956))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

