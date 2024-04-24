; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104078 () Bool)

(assert start!104078)

(declare-fun res!829458 () Bool)

(declare-fun e!705646 () Bool)

(assert (=> start!104078 (=> (not res!829458) (not e!705646))))

(declare-datatypes ((array!79990 0))(
  ( (array!79991 (arr!38585 (Array (_ BitVec 32) (_ BitVec 64))) (size!39122 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79990)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104078 (= res!829458 (and (bvslt (size!39122 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39122 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39122 a!3892))))))

(assert (=> start!104078 e!705646))

(declare-fun array_inv!29523 (array!79990) Bool)

(assert (=> start!104078 (array_inv!29523 a!3892)))

(assert (=> start!104078 true))

(declare-fun b!1244472 () Bool)

(declare-datatypes ((List!27401 0))(
  ( (Nil!27398) (Cons!27397 (h!28615 (_ BitVec 64)) (t!40862 List!27401)) )
))
(declare-fun noDuplicate!1993 (List!27401) Bool)

(assert (=> b!1244472 (= e!705646 (not (noDuplicate!1993 Nil!27398)))))

(assert (= (and start!104078 res!829458) b!1244472))

(declare-fun m!1147425 () Bool)

(assert (=> start!104078 m!1147425))

(declare-fun m!1147427 () Bool)

(assert (=> b!1244472 m!1147427))

(check-sat (not b!1244472) (not start!104078))
(check-sat)
(get-model)

(declare-fun d!137519 () Bool)

(declare-fun res!829469 () Bool)

(declare-fun e!705664 () Bool)

(assert (=> d!137519 (=> res!829469 e!705664)))

(get-info :version)

(assert (=> d!137519 (= res!829469 ((_ is Nil!27398) Nil!27398))))

(assert (=> d!137519 (= (noDuplicate!1993 Nil!27398) e!705664)))

(declare-fun b!1244483 () Bool)

(declare-fun e!705665 () Bool)

(assert (=> b!1244483 (= e!705664 e!705665)))

(declare-fun res!829470 () Bool)

(assert (=> b!1244483 (=> (not res!829470) (not e!705665))))

(declare-fun contains!7433 (List!27401 (_ BitVec 64)) Bool)

(assert (=> b!1244483 (= res!829470 (not (contains!7433 (t!40862 Nil!27398) (h!28615 Nil!27398))))))

(declare-fun b!1244484 () Bool)

(assert (=> b!1244484 (= e!705665 (noDuplicate!1993 (t!40862 Nil!27398)))))

(assert (= (and d!137519 (not res!829469)) b!1244483))

(assert (= (and b!1244483 res!829470) b!1244484))

(declare-fun m!1147437 () Bool)

(assert (=> b!1244483 m!1147437))

(declare-fun m!1147439 () Bool)

(assert (=> b!1244484 m!1147439))

(assert (=> b!1244472 d!137519))

(declare-fun d!137521 () Bool)

(assert (=> d!137521 (= (array_inv!29523 a!3892) (bvsge (size!39122 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104078 d!137521))

(check-sat (not b!1244484) (not b!1244483))
(check-sat)
