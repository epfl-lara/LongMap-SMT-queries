; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117698 () Bool)

(assert start!117698)

(declare-fun res!922711 () Bool)

(declare-fun e!782727 () Bool)

(assert (=> start!117698 (=> (not res!922711) (not e!782727))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-datatypes ((array!94134 0))(
  ( (array!94135 (arr!45457 (Array (_ BitVec 32) (_ BitVec 64))) (size!46009 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94134)

(declare-fun to!94 () (_ BitVec 32))

(assert (=> start!117698 (= res!922711 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46009 a!3464)) (bvslt (size!46009 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117698 e!782727))

(assert (=> start!117698 true))

(declare-fun array_inv!34690 (array!94134) Bool)

(assert (=> start!117698 (array_inv!34690 a!3464)))

(declare-fun b!1380968 () Bool)

(declare-fun res!922712 () Bool)

(assert (=> b!1380968 (=> (not res!922712) (not e!782727))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380968 (= res!922712 (validKeyInArray!0 (select (arr!45457 a!3464) from!2839)))))

(declare-fun b!1380969 () Bool)

(assert (=> b!1380969 (= e!782727 (bvslt (bvadd #b00000000000000000000000000000001 from!2839) #b00000000000000000000000000000000))))

(assert (= (and start!117698 res!922711) b!1380968))

(assert (= (and b!1380968 res!922712) b!1380969))

(declare-fun m!1265751 () Bool)

(assert (=> start!117698 m!1265751))

(declare-fun m!1265753 () Bool)

(assert (=> b!1380968 m!1265753))

(assert (=> b!1380968 m!1265753))

(declare-fun m!1265755 () Bool)

(assert (=> b!1380968 m!1265755))

(check-sat (not start!117698) (not b!1380968))
(check-sat)
