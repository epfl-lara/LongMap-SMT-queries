; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103468 () Bool)

(assert start!103468)

(declare-fun b!1240370 () Bool)

(declare-fun res!827659 () Bool)

(declare-fun e!703035 () Bool)

(assert (=> b!1240370 (=> (not res!827659) (not e!703035))))

(declare-datatypes ((array!79941 0))(
  ( (array!79942 (arr!38566 (Array (_ BitVec 32) (_ BitVec 64))) (size!39102 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79941)

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240370 (= res!827659 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun b!1240371 () Bool)

(declare-fun res!827656 () Bool)

(assert (=> b!1240371 (=> (not res!827656) (not e!703035))))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> b!1240371 (= res!827656 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39102 a!3575))))))

(declare-fun b!1240372 () Bool)

(declare-fun res!827658 () Bool)

(assert (=> b!1240372 (=> (not res!827658) (not e!703035))))

(assert (=> b!1240372 (= res!827658 (arrayContainsKey!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001)))))

(declare-fun b!1240373 () Bool)

(assert (=> b!1240373 (= e!703035 (bvsge (bvsub from!2953 #b00000000000000000000000000000001) from!2953))))

(declare-fun res!827657 () Bool)

(assert (=> start!103468 (=> (not res!827657) (not e!703035))))

(assert (=> start!103468 (= res!827657 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39102 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39102 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103468 e!703035))

(assert (=> start!103468 true))

(declare-fun array_inv!29414 (array!79941) Bool)

(assert (=> start!103468 (array_inv!29414 a!3575)))

(assert (= (and start!103468 res!827657) b!1240370))

(assert (= (and b!1240370 res!827659) b!1240371))

(assert (= (and b!1240371 res!827656) b!1240372))

(assert (= (and b!1240372 res!827658) b!1240373))

(declare-fun m!1143679 () Bool)

(assert (=> b!1240370 m!1143679))

(declare-fun m!1143681 () Bool)

(assert (=> b!1240372 m!1143681))

(declare-fun m!1143683 () Bool)

(assert (=> start!103468 m!1143683))

(push 1)

(assert (not start!103468))

(assert (not b!1240370))

(assert (not b!1240372))

(check-sat)

(pop 1)

(push 1)

(check-sat)

