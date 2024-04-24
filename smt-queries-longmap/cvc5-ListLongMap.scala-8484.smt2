; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103664 () Bool)

(assert start!103664)

(declare-fun b!1241553 () Bool)

(declare-fun res!828049 () Bool)

(declare-fun e!703783 () Bool)

(assert (=> b!1241553 (=> (not res!828049) (not e!703783))))

(declare-datatypes ((array!79944 0))(
  ( (array!79945 (arr!38563 (Array (_ BitVec 32) (_ BitVec 64))) (size!39100 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79944)

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79944 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1241553 (= res!828049 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun b!1241554 () Bool)

(declare-fun res!828051 () Bool)

(assert (=> b!1241554 (=> (not res!828051) (not e!703783))))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> b!1241554 (= res!828051 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39100 a!3575))))))

(declare-fun b!1241556 () Bool)

(assert (=> b!1241556 (= e!703783 (not true))))

(assert (=> b!1241556 (arrayContainsKey!0 a!3575 k!2808 newFrom!281)))

(declare-datatypes ((Unit!41196 0))(
  ( (Unit!41197) )
))
(declare-fun lt!562400 () Unit!41196)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79944 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!41196)

(assert (=> b!1241556 (= lt!562400 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001) newFrom!281))))

(declare-fun b!1241555 () Bool)

(declare-fun res!828048 () Bool)

(assert (=> b!1241555 (=> (not res!828048) (not e!703783))))

(assert (=> b!1241555 (= res!828048 (arrayContainsKey!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001)))))

(declare-fun res!828050 () Bool)

(assert (=> start!103664 (=> (not res!828050) (not e!703783))))

(assert (=> start!103664 (= res!828050 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39100 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39100 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103664 e!703783))

(assert (=> start!103664 true))

(declare-fun array_inv!29501 (array!79944) Bool)

(assert (=> start!103664 (array_inv!29501 a!3575)))

(assert (= (and start!103664 res!828050) b!1241553))

(assert (= (and b!1241553 res!828049) b!1241554))

(assert (= (and b!1241554 res!828051) b!1241555))

(assert (= (and b!1241555 res!828048) b!1241556))

(declare-fun m!1145227 () Bool)

(assert (=> b!1241553 m!1145227))

(declare-fun m!1145229 () Bool)

(assert (=> b!1241556 m!1145229))

(declare-fun m!1145231 () Bool)

(assert (=> b!1241556 m!1145231))

(declare-fun m!1145233 () Bool)

(assert (=> b!1241555 m!1145233))

(declare-fun m!1145235 () Bool)

(assert (=> start!103664 m!1145235))

(push 1)

(assert (not b!1241553))

(assert (not b!1241556))

(assert (not start!103664))

(assert (not b!1241555))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

