; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117736 () Bool)

(assert start!117736)

(declare-fun res!922785 () Bool)

(declare-fun e!782833 () Bool)

(assert (=> start!117736 (=> (not res!922785) (not e!782833))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-datatypes ((array!94218 0))(
  ( (array!94219 (arr!45499 (Array (_ BitVec 32) (_ BitVec 64))) (size!46049 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94218)

(declare-fun to!94 () (_ BitVec 32))

(assert (=> start!117736 (= res!922785 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46049 a!3464)) (bvslt (size!46049 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117736 e!782833))

(assert (=> start!117736 true))

(declare-fun array_inv!34527 (array!94218) Bool)

(assert (=> start!117736 (array_inv!34527 a!3464)))

(declare-fun b!1381085 () Bool)

(declare-fun res!922786 () Bool)

(assert (=> b!1381085 (=> (not res!922786) (not e!782833))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381085 (= res!922786 (validKeyInArray!0 (select (arr!45499 a!3464) from!2839)))))

(declare-fun b!1381086 () Bool)

(assert (=> b!1381086 (= e!782833 (bvsge (bvsub (size!46049 a!3464) (bvadd #b00000000000000000000000000000001 from!2839)) (bvsub (size!46049 a!3464) from!2839)))))

(assert (= (and start!117736 res!922785) b!1381085))

(assert (= (and b!1381085 res!922786) b!1381086))

(declare-fun m!1266321 () Bool)

(assert (=> start!117736 m!1266321))

(declare-fun m!1266323 () Bool)

(assert (=> b!1381085 m!1266323))

(assert (=> b!1381085 m!1266323))

(declare-fun m!1266325 () Bool)

(assert (=> b!1381085 m!1266325))

(push 1)

(assert (not start!117736))

(assert (not b!1381085))

(check-sat)

(pop 1)

(push 1)

(check-sat)

