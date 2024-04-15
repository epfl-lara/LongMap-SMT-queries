; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103408 () Bool)

(assert start!103408)

(declare-fun b!1240072 () Bool)

(declare-fun res!827399 () Bool)

(declare-fun e!702835 () Bool)

(assert (=> b!1240072 (=> (not res!827399) (not e!702835))))

(declare-datatypes ((array!79817 0))(
  ( (array!79818 (arr!38506 (Array (_ BitVec 32) (_ BitVec 64))) (size!39044 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79817)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> b!1240072 (= res!827399 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39044 a!3575))))))

(declare-fun b!1240074 () Bool)

(assert (=> b!1240074 (= e!702835 (not true))))

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240074 (arrayContainsKey!0 a!3575 k!2808 newFrom!281)))

(declare-datatypes ((Unit!41056 0))(
  ( (Unit!41057) )
))
(declare-fun lt!561717 () Unit!41056)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79817 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!41056)

(assert (=> b!1240074 (= lt!561717 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001) newFrom!281))))

(declare-fun b!1240073 () Bool)

(declare-fun res!827400 () Bool)

(assert (=> b!1240073 (=> (not res!827400) (not e!702835))))

(assert (=> b!1240073 (= res!827400 (arrayContainsKey!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001)))))

(declare-fun res!827402 () Bool)

(assert (=> start!103408 (=> (not res!827402) (not e!702835))))

(assert (=> start!103408 (= res!827402 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39044 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39044 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103408 e!702835))

(assert (=> start!103408 true))

(declare-fun array_inv!29489 (array!79817) Bool)

(assert (=> start!103408 (array_inv!29489 a!3575)))

(declare-fun b!1240071 () Bool)

(declare-fun res!827401 () Bool)

(assert (=> b!1240071 (=> (not res!827401) (not e!702835))))

(assert (=> b!1240071 (= res!827401 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(assert (= (and start!103408 res!827402) b!1240071))

(assert (= (and b!1240071 res!827401) b!1240072))

(assert (= (and b!1240072 res!827399) b!1240073))

(assert (= (and b!1240073 res!827400) b!1240074))

(declare-fun m!1142995 () Bool)

(assert (=> b!1240074 m!1142995))

(declare-fun m!1142997 () Bool)

(assert (=> b!1240074 m!1142997))

(declare-fun m!1142999 () Bool)

(assert (=> b!1240073 m!1142999))

(declare-fun m!1143001 () Bool)

(assert (=> start!103408 m!1143001))

(declare-fun m!1143003 () Bool)

(assert (=> b!1240071 m!1143003))

(push 1)

(assert (not b!1240071))

(assert (not start!103408))

(assert (not b!1240073))

(assert (not b!1240074))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

