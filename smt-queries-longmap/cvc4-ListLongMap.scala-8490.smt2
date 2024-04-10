; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103474 () Bool)

(assert start!103474)

(declare-fun b!1240407 () Bool)

(declare-fun res!827693 () Bool)

(declare-fun e!703052 () Bool)

(assert (=> b!1240407 (=> (not res!827693) (not e!703052))))

(declare-datatypes ((array!79947 0))(
  ( (array!79948 (arr!38569 (Array (_ BitVec 32) (_ BitVec 64))) (size!39105 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79947)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> b!1240407 (= res!827693 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39105 a!3575))))))

(declare-fun b!1240406 () Bool)

(declare-fun res!827692 () Bool)

(assert (=> b!1240406 (=> (not res!827692) (not e!703052))))

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240406 (= res!827692 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun b!1240408 () Bool)

(declare-fun res!827695 () Bool)

(assert (=> b!1240408 (=> (not res!827695) (not e!703052))))

(assert (=> b!1240408 (= res!827695 (arrayContainsKey!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001)))))

(declare-fun res!827694 () Bool)

(assert (=> start!103474 (=> (not res!827694) (not e!703052))))

(assert (=> start!103474 (= res!827694 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39105 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39105 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103474 e!703052))

(assert (=> start!103474 true))

(declare-fun array_inv!29417 (array!79947) Bool)

(assert (=> start!103474 (array_inv!29417 a!3575)))

(declare-fun b!1240409 () Bool)

(assert (=> b!1240409 (= e!703052 (not true))))

(assert (=> b!1240409 (arrayContainsKey!0 a!3575 k!2808 newFrom!281)))

(declare-datatypes ((Unit!41229 0))(
  ( (Unit!41230) )
))
(declare-fun lt!561923 () Unit!41229)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79947 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!41229)

(assert (=> b!1240409 (= lt!561923 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001) newFrom!281))))

(assert (= (and start!103474 res!827694) b!1240406))

(assert (= (and b!1240406 res!827692) b!1240407))

(assert (= (and b!1240407 res!827693) b!1240408))

(assert (= (and b!1240408 res!827695) b!1240409))

(declare-fun m!1143705 () Bool)

(assert (=> b!1240406 m!1143705))

(declare-fun m!1143707 () Bool)

(assert (=> b!1240408 m!1143707))

(declare-fun m!1143709 () Bool)

(assert (=> start!103474 m!1143709))

(declare-fun m!1143711 () Bool)

(assert (=> b!1240409 m!1143711))

(declare-fun m!1143713 () Bool)

(assert (=> b!1240409 m!1143713))

(push 1)

(assert (not b!1240409))

(assert (not start!103474))

(assert (not b!1240408))

(assert (not b!1240406))

