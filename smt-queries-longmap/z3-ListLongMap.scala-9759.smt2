; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115666 () Bool)

(assert start!115666)

(declare-fun b!1367613 () Bool)

(declare-fun res!911169 () Bool)

(declare-fun e!775093 () Bool)

(assert (=> b!1367613 (=> (not res!911169) (not e!775093))))

(declare-datatypes ((List!31979 0))(
  ( (Nil!31976) (Cons!31975 (h!33184 (_ BitVec 64)) (t!46665 List!31979)) )
))
(declare-fun acc!866 () List!31979)

(declare-fun contains!9572 (List!31979 (_ BitVec 64)) Bool)

(assert (=> b!1367613 (= res!911169 (not (contains!9572 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!911171 () Bool)

(assert (=> start!115666 (=> (not res!911171) (not e!775093))))

(declare-datatypes ((array!92817 0))(
  ( (array!92818 (arr!44833 (Array (_ BitVec 32) (_ BitVec 64))) (size!45385 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92817)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115666 (= res!911171 (and (bvslt (size!45385 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45385 a!3861))))))

(assert (=> start!115666 e!775093))

(declare-fun array_inv!34066 (array!92817) Bool)

(assert (=> start!115666 (array_inv!34066 a!3861)))

(assert (=> start!115666 true))

(declare-fun b!1367614 () Bool)

(declare-fun res!911168 () Bool)

(assert (=> b!1367614 (=> (not res!911168) (not e!775093))))

(declare-fun noDuplicate!2487 (List!31979) Bool)

(assert (=> b!1367614 (= res!911168 (noDuplicate!2487 acc!866))))

(declare-fun b!1367615 () Bool)

(declare-fun e!775094 () Bool)

(assert (=> b!1367615 (= e!775093 e!775094)))

(declare-fun res!911165 () Bool)

(assert (=> b!1367615 (=> (not res!911165) (not e!775094))))

(declare-fun arrayNoDuplicates!0 (array!92817 (_ BitVec 32) List!31979) Bool)

(assert (=> b!1367615 (= res!911165 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!44994 0))(
  ( (Unit!44995) )
))
(declare-fun lt!601743 () Unit!44994)

(declare-fun newAcc!98 () List!31979)

(declare-fun noDuplicateSubseq!197 (List!31979 List!31979) Unit!44994)

(assert (=> b!1367615 (= lt!601743 (noDuplicateSubseq!197 newAcc!98 acc!866))))

(declare-fun b!1367616 () Bool)

(declare-fun res!911173 () Bool)

(assert (=> b!1367616 (=> (not res!911173) (not e!775094))))

(assert (=> b!1367616 (= res!911173 (bvslt from!3239 (size!45385 a!3861)))))

(declare-fun b!1367617 () Bool)

(declare-fun res!911166 () Bool)

(assert (=> b!1367617 (=> (not res!911166) (not e!775093))))

(declare-fun subseq!1010 (List!31979 List!31979) Bool)

(assert (=> b!1367617 (= res!911166 (subseq!1010 newAcc!98 acc!866))))

(declare-fun b!1367618 () Bool)

(declare-fun res!911167 () Bool)

(assert (=> b!1367618 (=> (not res!911167) (not e!775094))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367618 (= res!911167 (validKeyInArray!0 (select (arr!44833 a!3861) from!3239)))))

(declare-fun b!1367619 () Bool)

(declare-fun res!911170 () Bool)

(assert (=> b!1367619 (=> (not res!911170) (not e!775093))))

(assert (=> b!1367619 (= res!911170 (not (contains!9572 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367620 () Bool)

(declare-fun res!911174 () Bool)

(assert (=> b!1367620 (=> (not res!911174) (not e!775093))))

(assert (=> b!1367620 (= res!911174 (not (contains!9572 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367621 () Bool)

(assert (=> b!1367621 (= e!775094 false)))

(declare-fun lt!601742 () Bool)

(assert (=> b!1367621 (= lt!601742 (noDuplicate!2487 newAcc!98))))

(declare-fun b!1367622 () Bool)

(declare-fun res!911172 () Bool)

(assert (=> b!1367622 (=> (not res!911172) (not e!775094))))

(assert (=> b!1367622 (= res!911172 (contains!9572 acc!866 (select (arr!44833 a!3861) from!3239)))))

(declare-fun b!1367623 () Bool)

(declare-fun res!911164 () Bool)

(assert (=> b!1367623 (=> (not res!911164) (not e!775093))))

(assert (=> b!1367623 (= res!911164 (not (contains!9572 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115666 res!911171) b!1367614))

(assert (= (and b!1367614 res!911168) b!1367623))

(assert (= (and b!1367623 res!911164) b!1367613))

(assert (= (and b!1367613 res!911169) b!1367620))

(assert (= (and b!1367620 res!911174) b!1367619))

(assert (= (and b!1367619 res!911170) b!1367617))

(assert (= (and b!1367617 res!911166) b!1367615))

(assert (= (and b!1367615 res!911165) b!1367616))

(assert (= (and b!1367616 res!911173) b!1367618))

(assert (= (and b!1367618 res!911167) b!1367622))

(assert (= (and b!1367622 res!911172) b!1367621))

(declare-fun m!1251327 () Bool)

(assert (=> b!1367618 m!1251327))

(assert (=> b!1367618 m!1251327))

(declare-fun m!1251329 () Bool)

(assert (=> b!1367618 m!1251329))

(declare-fun m!1251331 () Bool)

(assert (=> b!1367615 m!1251331))

(declare-fun m!1251333 () Bool)

(assert (=> b!1367615 m!1251333))

(declare-fun m!1251335 () Bool)

(assert (=> b!1367613 m!1251335))

(declare-fun m!1251337 () Bool)

(assert (=> b!1367614 m!1251337))

(assert (=> b!1367622 m!1251327))

(assert (=> b!1367622 m!1251327))

(declare-fun m!1251339 () Bool)

(assert (=> b!1367622 m!1251339))

(declare-fun m!1251341 () Bool)

(assert (=> start!115666 m!1251341))

(declare-fun m!1251343 () Bool)

(assert (=> b!1367617 m!1251343))

(declare-fun m!1251345 () Bool)

(assert (=> b!1367623 m!1251345))

(declare-fun m!1251347 () Bool)

(assert (=> b!1367621 m!1251347))

(declare-fun m!1251349 () Bool)

(assert (=> b!1367619 m!1251349))

(declare-fun m!1251351 () Bool)

(assert (=> b!1367620 m!1251351))

(check-sat (not b!1367619) (not b!1367614) (not b!1367617) (not b!1367621) (not b!1367622) (not b!1367618) (not b!1367620) (not b!1367623) (not b!1367615) (not b!1367613) (not start!115666))
(check-sat)
