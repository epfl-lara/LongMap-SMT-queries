; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116786 () Bool)

(assert start!116786)

(declare-fun res!918337 () Bool)

(declare-fun e!779589 () Bool)

(assert (=> start!116786 (=> (not res!918337) (not e!779589))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93377 0))(
  ( (array!93378 (arr!45090 (Array (_ BitVec 32) (_ BitVec 64))) (size!45641 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93377)

(assert (=> start!116786 (= res!918337 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45641 a!4142))))))

(assert (=> start!116786 e!779589))

(assert (=> start!116786 true))

(declare-fun array_inv!34371 (array!93377) Bool)

(assert (=> start!116786 (array_inv!34371 a!4142)))

(declare-fun b!1375934 () Bool)

(declare-fun res!918339 () Bool)

(assert (=> b!1375934 (=> (not res!918339) (not e!779589))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375934 (= res!918339 (validKeyInArray!0 (select (arr!45090 a!4142) i!1457)))))

(declare-fun b!1375935 () Bool)

(declare-fun res!918338 () Bool)

(assert (=> b!1375935 (=> (not res!918338) (not e!779589))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1375935 (= res!918338 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1375936 () Bool)

(assert (=> b!1375936 (= e!779589 (and (bvslt (size!45641 a!4142) #b01111111111111111111111111111111) (bvsgt i!1457 (size!45641 a!4142))))))

(assert (= (and start!116786 res!918337) b!1375934))

(assert (= (and b!1375934 res!918339) b!1375935))

(assert (= (and b!1375935 res!918338) b!1375936))

(declare-fun m!1259789 () Bool)

(assert (=> start!116786 m!1259789))

(declare-fun m!1259791 () Bool)

(assert (=> b!1375934 m!1259791))

(assert (=> b!1375934 m!1259791))

(declare-fun m!1259793 () Bool)

(assert (=> b!1375934 m!1259793))

(declare-fun m!1259795 () Bool)

(assert (=> b!1375935 m!1259795))

(push 1)

(assert (not start!116786))

(assert (not b!1375934))

(assert (not b!1375935))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

