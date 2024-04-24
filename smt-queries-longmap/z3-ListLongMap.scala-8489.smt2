; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103700 () Bool)

(assert start!103700)

(declare-fun b!1241672 () Bool)

(declare-fun res!828167 () Bool)

(declare-fun e!703886 () Bool)

(assert (=> b!1241672 (=> (not res!828167) (not e!703886))))

(declare-datatypes ((array!79972 0))(
  ( (array!79973 (arr!38576 (Array (_ BitVec 32) (_ BitVec 64))) (size!39113 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79972)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun k0!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79972 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1241672 (= res!828167 (arrayContainsKey!0 a!3575 k0!2808 (bvsub from!2953 #b00000000000000000000000000000001)))))

(declare-fun res!828166 () Bool)

(assert (=> start!103700 (=> (not res!828166) (not e!703886))))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103700 (= res!828166 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39113 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39113 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103700 e!703886))

(assert (=> start!103700 true))

(declare-fun array_inv!29514 (array!79972) Bool)

(assert (=> start!103700 (array_inv!29514 a!3575)))

(declare-fun b!1241673 () Bool)

(assert (=> b!1241673 (= e!703886 (bvsge (bvsub from!2953 #b00000000000000000000000000000001) from!2953))))

(declare-fun b!1241671 () Bool)

(declare-fun res!828168 () Bool)

(assert (=> b!1241671 (=> (not res!828168) (not e!703886))))

(assert (=> b!1241671 (= res!828168 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39113 a!3575))))))

(declare-fun b!1241670 () Bool)

(declare-fun res!828165 () Bool)

(assert (=> b!1241670 (=> (not res!828165) (not e!703886))))

(assert (=> b!1241670 (= res!828165 (arrayContainsKey!0 a!3575 k0!2808 from!2953))))

(assert (= (and start!103700 res!828166) b!1241670))

(assert (= (and b!1241670 res!828165) b!1241671))

(assert (= (and b!1241671 res!828168) b!1241672))

(assert (= (and b!1241672 res!828167) b!1241673))

(declare-fun m!1145311 () Bool)

(assert (=> b!1241672 m!1145311))

(declare-fun m!1145313 () Bool)

(assert (=> start!103700 m!1145313))

(declare-fun m!1145315 () Bool)

(assert (=> b!1241670 m!1145315))

(check-sat (not b!1241672) (not start!103700) (not b!1241670))
(check-sat)
