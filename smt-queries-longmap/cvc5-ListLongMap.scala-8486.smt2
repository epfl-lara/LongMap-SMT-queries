; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103434 () Bool)

(assert start!103434)

(declare-fun res!827541 () Bool)

(declare-fun e!702944 () Bool)

(assert (=> start!103434 (=> (not res!827541) (not e!702944))))

(declare-datatypes ((array!79916 0))(
  ( (array!79917 (arr!38555 (Array (_ BitVec 32) (_ BitVec 64))) (size!39091 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79916)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103434 (= res!827541 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39091 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39091 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103434 e!702944))

(assert (=> start!103434 true))

(declare-fun array_inv!29403 (array!79916) Bool)

(assert (=> start!103434 (array_inv!29403 a!3575)))

(declare-fun b!1240255 () Bool)

(declare-fun res!827542 () Bool)

(assert (=> b!1240255 (=> (not res!827542) (not e!702944))))

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79916 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240255 (= res!827542 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun b!1240256 () Bool)

(assert (=> b!1240256 (= e!702944 (and (bvsgt from!2953 newFrom!281) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!103434 res!827541) b!1240255))

(assert (= (and b!1240255 res!827542) b!1240256))

(declare-fun m!1143601 () Bool)

(assert (=> start!103434 m!1143601))

(declare-fun m!1143603 () Bool)

(assert (=> b!1240255 m!1143603))

(push 1)

(assert (not start!103434))

(assert (not b!1240255))

(check-sat)

(pop 1)

(push 1)

(check-sat)

