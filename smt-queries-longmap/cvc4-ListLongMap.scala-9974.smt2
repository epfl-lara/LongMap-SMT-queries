; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117766 () Bool)

(assert start!117766)

(declare-fun res!922821 () Bool)

(declare-fun e!782887 () Bool)

(assert (=> start!117766 (=> (not res!922821) (not e!782887))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94233 0))(
  ( (array!94234 (arr!45505 (Array (_ BitVec 32) (_ BitVec 64))) (size!46055 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94233)

(assert (=> start!117766 (= res!922821 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46055 a!3464)) (bvslt (size!46055 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117766 e!782887))

(assert (=> start!117766 true))

(declare-fun array_inv!34533 (array!94233) Bool)

(assert (=> start!117766 (array_inv!34533 a!3464)))

(declare-fun b!1381157 () Bool)

(declare-fun res!922822 () Bool)

(assert (=> b!1381157 (=> (not res!922822) (not e!782887))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381157 (= res!922822 (not (validKeyInArray!0 (select (arr!45505 a!3464) from!2839))))))

(declare-fun b!1381158 () Bool)

(assert (=> b!1381158 (= e!782887 (bvsge (bvsub (size!46055 a!3464) (bvadd #b00000000000000000000000000000001 from!2839)) (bvsub (size!46055 a!3464) from!2839)))))

(assert (= (and start!117766 res!922821) b!1381157))

(assert (= (and b!1381157 res!922822) b!1381158))

(declare-fun m!1266381 () Bool)

(assert (=> start!117766 m!1266381))

(declare-fun m!1266383 () Bool)

(assert (=> b!1381157 m!1266383))

(assert (=> b!1381157 m!1266383))

(declare-fun m!1266385 () Bool)

(assert (=> b!1381157 m!1266385))

(push 1)

(assert (not start!117766))

(assert (not b!1381157))

(check-sat)

(pop 1)

(push 1)

(check-sat)

