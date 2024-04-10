; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103432 () Bool)

(assert start!103432)

(declare-fun res!827535 () Bool)

(declare-fun e!702938 () Bool)

(assert (=> start!103432 (=> (not res!827535) (not e!702938))))

(declare-datatypes ((array!79914 0))(
  ( (array!79915 (arr!38554 (Array (_ BitVec 32) (_ BitVec 64))) (size!39090 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79914)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103432 (= res!827535 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39090 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39090 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103432 e!702938))

(assert (=> start!103432 true))

(declare-fun array_inv!29402 (array!79914) Bool)

(assert (=> start!103432 (array_inv!29402 a!3575)))

(declare-fun b!1240249 () Bool)

(declare-fun res!827536 () Bool)

(assert (=> b!1240249 (=> (not res!827536) (not e!702938))))

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79914 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240249 (= res!827536 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun b!1240250 () Bool)

(assert (=> b!1240250 (= e!702938 (and (bvsle from!2953 newFrom!281) (bvsge newFrom!281 (size!39090 a!3575))))))

(assert (= (and start!103432 res!827535) b!1240249))

(assert (= (and b!1240249 res!827536) b!1240250))

(declare-fun m!1143597 () Bool)

(assert (=> start!103432 m!1143597))

(declare-fun m!1143599 () Bool)

(assert (=> b!1240249 m!1143599))

(push 1)

(assert (not b!1240249))

(assert (not start!103432))

(check-sat)

(pop 1)

(push 1)

(check-sat)

