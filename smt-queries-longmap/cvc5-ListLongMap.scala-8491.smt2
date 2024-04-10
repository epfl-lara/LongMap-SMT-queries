; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103476 () Bool)

(assert start!103476)

(declare-fun res!827702 () Bool)

(declare-fun e!703058 () Bool)

(assert (=> start!103476 (=> (not res!827702) (not e!703058))))

(declare-datatypes ((array!79949 0))(
  ( (array!79950 (arr!38570 (Array (_ BitVec 32) (_ BitVec 64))) (size!39106 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79949)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103476 (= res!827702 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39106 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39106 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103476 e!703058))

(assert (=> start!103476 true))

(declare-fun array_inv!29418 (array!79949) Bool)

(assert (=> start!103476 (array_inv!29418 a!3575)))

(declare-fun b!1240416 () Bool)

(declare-fun res!827703 () Bool)

(assert (=> b!1240416 (=> (not res!827703) (not e!703058))))

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79949 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240416 (= res!827703 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun b!1240417 () Bool)

(declare-fun res!827704 () Bool)

(assert (=> b!1240417 (=> (not res!827704) (not e!703058))))

(assert (=> b!1240417 (= res!827704 (bvsle from!2953 newFrom!281))))

(declare-fun b!1240418 () Bool)

(assert (=> b!1240418 (= e!703058 (not (arrayContainsKey!0 a!3575 k!2808 newFrom!281)))))

(assert (= (and start!103476 res!827702) b!1240416))

(assert (= (and b!1240416 res!827703) b!1240417))

(assert (= (and b!1240417 res!827704) b!1240418))

(declare-fun m!1143715 () Bool)

(assert (=> start!103476 m!1143715))

(declare-fun m!1143717 () Bool)

(assert (=> b!1240416 m!1143717))

(declare-fun m!1143719 () Bool)

(assert (=> b!1240418 m!1143719))

(push 1)

(assert (not b!1240418))

(assert (not start!103476))

(assert (not b!1240416))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

