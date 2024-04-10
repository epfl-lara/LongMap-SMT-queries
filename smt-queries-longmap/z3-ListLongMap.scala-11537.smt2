; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134308 () Bool)

(assert start!134308)

(declare-fun res!1072226 () Bool)

(declare-fun e!874410 () Bool)

(assert (=> start!134308 (=> (not res!1072226) (not e!874410))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104798 0))(
  ( (array!104799 (arr!50579 (Array (_ BitVec 32) (_ BitVec 64))) (size!51129 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104798)

(assert (=> start!134308 (= res!1072226 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51129 a!3481)) (bvslt (size!51129 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134308 e!874410))

(assert (=> start!134308 true))

(declare-fun array_inv!39306 (array!104798) Bool)

(assert (=> start!134308 (array_inv!39306 a!3481)))

(declare-fun b!1568538 () Bool)

(declare-fun e!874409 () Bool)

(assert (=> b!1568538 (= e!874410 e!874409)))

(declare-fun res!1072228 () Bool)

(assert (=> b!1568538 (=> (not res!1072228) (not e!874409))))

(declare-fun e!874412 () Bool)

(assert (=> b!1568538 (= res!1072228 e!874412)))

(declare-fun res!1072229 () Bool)

(assert (=> b!1568538 (=> res!1072229 e!874412)))

(declare-fun lt!673198 () Bool)

(assert (=> b!1568538 (= res!1072229 (not lt!673198))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568538 (= lt!673198 (validKeyInArray!0 (select (arr!50579 a!3481) from!2856)))))

(declare-fun b!1568539 () Bool)

(assert (=> b!1568539 (= e!874409 (and (not lt!673198) (bvsge (bvsub (size!51129 a!3481) (bvadd #b00000000000000000000000000000001 from!2856)) (bvsub (size!51129 a!3481) from!2856))))))

(declare-fun b!1568540 () Bool)

(declare-fun res!1072224 () Bool)

(assert (=> b!1568540 (=> (not res!1072224) (not e!874410))))

(declare-datatypes ((List!36711 0))(
  ( (Nil!36708) (Cons!36707 (h!38154 (_ BitVec 64)) (t!51619 List!36711)) )
))
(declare-fun acc!619 () List!36711)

(declare-fun noDuplicate!2685 (List!36711) Bool)

(assert (=> b!1568540 (= res!1072224 (noDuplicate!2685 acc!619))))

(declare-fun b!1568541 () Bool)

(declare-fun contains!10413 (List!36711 (_ BitVec 64)) Bool)

(assert (=> b!1568541 (= e!874412 (not (contains!10413 acc!619 (select (arr!50579 a!3481) from!2856))))))

(declare-fun b!1568542 () Bool)

(declare-fun res!1072227 () Bool)

(assert (=> b!1568542 (=> (not res!1072227) (not e!874410))))

(assert (=> b!1568542 (= res!1072227 (bvslt from!2856 (size!51129 a!3481)))))

(declare-fun b!1568543 () Bool)

(declare-fun res!1072230 () Bool)

(assert (=> b!1568543 (=> (not res!1072230) (not e!874410))))

(assert (=> b!1568543 (= res!1072230 (not (contains!10413 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568544 () Bool)

(declare-fun res!1072225 () Bool)

(assert (=> b!1568544 (=> (not res!1072225) (not e!874410))))

(assert (=> b!1568544 (= res!1072225 (not (contains!10413 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!134308 res!1072226) b!1568540))

(assert (= (and b!1568540 res!1072224) b!1568544))

(assert (= (and b!1568544 res!1072225) b!1568543))

(assert (= (and b!1568543 res!1072230) b!1568542))

(assert (= (and b!1568542 res!1072227) b!1568538))

(assert (= (and b!1568538 (not res!1072229)) b!1568541))

(assert (= (and b!1568538 res!1072228) b!1568539))

(declare-fun m!1443171 () Bool)

(assert (=> start!134308 m!1443171))

(declare-fun m!1443173 () Bool)

(assert (=> b!1568541 m!1443173))

(assert (=> b!1568541 m!1443173))

(declare-fun m!1443175 () Bool)

(assert (=> b!1568541 m!1443175))

(declare-fun m!1443177 () Bool)

(assert (=> b!1568540 m!1443177))

(declare-fun m!1443179 () Bool)

(assert (=> b!1568543 m!1443179))

(assert (=> b!1568538 m!1443173))

(assert (=> b!1568538 m!1443173))

(declare-fun m!1443181 () Bool)

(assert (=> b!1568538 m!1443181))

(declare-fun m!1443183 () Bool)

(assert (=> b!1568544 m!1443183))

(check-sat (not start!134308) (not b!1568538) (not b!1568543) (not b!1568540) (not b!1568544) (not b!1568541))
(check-sat)
