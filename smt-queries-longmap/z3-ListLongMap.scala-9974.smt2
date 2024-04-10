; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117764 () Bool)

(assert start!117764)

(declare-fun res!922815 () Bool)

(declare-fun e!782881 () Bool)

(assert (=> start!117764 (=> (not res!922815) (not e!782881))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-datatypes ((array!94231 0))(
  ( (array!94232 (arr!45504 (Array (_ BitVec 32) (_ BitVec 64))) (size!46054 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94231)

(declare-fun to!94 () (_ BitVec 32))

(assert (=> start!117764 (= res!922815 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46054 a!3464)) (bvslt (size!46054 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117764 e!782881))

(assert (=> start!117764 true))

(declare-fun array_inv!34532 (array!94231) Bool)

(assert (=> start!117764 (array_inv!34532 a!3464)))

(declare-fun b!1381151 () Bool)

(declare-fun res!922816 () Bool)

(assert (=> b!1381151 (=> (not res!922816) (not e!782881))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381151 (= res!922816 (not (validKeyInArray!0 (select (arr!45504 a!3464) from!2839))))))

(declare-fun b!1381152 () Bool)

(assert (=> b!1381152 (= e!782881 (bvsge (bvsub (size!46054 a!3464) (bvadd #b00000000000000000000000000000001 from!2839)) (bvsub (size!46054 a!3464) from!2839)))))

(assert (= (and start!117764 res!922815) b!1381151))

(assert (= (and b!1381151 res!922816) b!1381152))

(declare-fun m!1266375 () Bool)

(assert (=> start!117764 m!1266375))

(declare-fun m!1266377 () Bool)

(assert (=> b!1381151 m!1266377))

(assert (=> b!1381151 m!1266377))

(declare-fun m!1266379 () Bool)

(assert (=> b!1381151 m!1266379))

(check-sat (not start!117764) (not b!1381151))
(check-sat)
