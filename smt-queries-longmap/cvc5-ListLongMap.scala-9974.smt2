; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117762 () Bool)

(assert start!117762)

(declare-fun res!922809 () Bool)

(declare-fun e!782875 () Bool)

(assert (=> start!117762 (=> (not res!922809) (not e!782875))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94229 0))(
  ( (array!94230 (arr!45503 (Array (_ BitVec 32) (_ BitVec 64))) (size!46053 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94229)

(assert (=> start!117762 (= res!922809 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46053 a!3464)) (bvslt (size!46053 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117762 e!782875))

(assert (=> start!117762 true))

(declare-fun array_inv!34531 (array!94229) Bool)

(assert (=> start!117762 (array_inv!34531 a!3464)))

(declare-fun b!1381145 () Bool)

(declare-fun res!922810 () Bool)

(assert (=> b!1381145 (=> (not res!922810) (not e!782875))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381145 (= res!922810 (not (validKeyInArray!0 (select (arr!45503 a!3464) from!2839))))))

(declare-fun b!1381146 () Bool)

(assert (=> b!1381146 (= e!782875 (bvsge (bvsub (size!46053 a!3464) (bvadd #b00000000000000000000000000000001 from!2839)) (bvsub (size!46053 a!3464) from!2839)))))

(assert (= (and start!117762 res!922809) b!1381145))

(assert (= (and b!1381145 res!922810) b!1381146))

(declare-fun m!1266369 () Bool)

(assert (=> start!117762 m!1266369))

(declare-fun m!1266371 () Bool)

(assert (=> b!1381145 m!1266371))

(assert (=> b!1381145 m!1266371))

(declare-fun m!1266373 () Bool)

(assert (=> b!1381145 m!1266373))

(push 1)

(assert (not start!117762))

(assert (not b!1381145))

(check-sat)

(pop 1)

(push 1)

(check-sat)

