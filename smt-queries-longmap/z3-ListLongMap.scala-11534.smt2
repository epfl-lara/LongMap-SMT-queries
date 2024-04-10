; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134290 () Bool)

(assert start!134290)

(declare-fun res!1072051 () Bool)

(declare-fun e!874316 () Bool)

(assert (=> start!134290 (=> (not res!1072051) (not e!874316))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104780 0))(
  ( (array!104781 (arr!50570 (Array (_ BitVec 32) (_ BitVec 64))) (size!51120 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104780)

(assert (=> start!134290 (= res!1072051 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51120 a!3481)) (bvslt (size!51120 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134290 e!874316))

(assert (=> start!134290 true))

(declare-fun array_inv!39297 (array!104780) Bool)

(assert (=> start!134290 (array_inv!39297 a!3481)))

(declare-fun b!1568362 () Bool)

(declare-fun res!1072052 () Bool)

(assert (=> b!1568362 (=> (not res!1072052) (not e!874316))))

(assert (=> b!1568362 (= res!1072052 (bvslt from!2856 (size!51120 a!3481)))))

(declare-fun b!1568363 () Bool)

(declare-fun res!1072049 () Bool)

(assert (=> b!1568363 (=> (not res!1072049) (not e!874316))))

(declare-datatypes ((List!36702 0))(
  ( (Nil!36699) (Cons!36698 (h!38145 (_ BitVec 64)) (t!51610 List!36702)) )
))
(declare-fun acc!619 () List!36702)

(declare-fun contains!10404 (List!36702 (_ BitVec 64)) Bool)

(assert (=> b!1568363 (= res!1072049 (not (contains!10404 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568364 () Bool)

(declare-fun res!1072053 () Bool)

(assert (=> b!1568364 (=> (not res!1072053) (not e!874316))))

(declare-fun noDuplicate!2676 (List!36702) Bool)

(assert (=> b!1568364 (= res!1072053 (noDuplicate!2676 acc!619))))

(declare-fun b!1568365 () Bool)

(declare-fun e!874315 () Bool)

(assert (=> b!1568365 (= e!874315 (not (contains!10404 acc!619 (select (arr!50570 a!3481) from!2856))))))

(declare-fun b!1568366 () Bool)

(assert (=> b!1568366 (= e!874316 false)))

(declare-fun lt!673171 () Bool)

(assert (=> b!1568366 (= lt!673171 e!874315)))

(declare-fun res!1072048 () Bool)

(assert (=> b!1568366 (=> res!1072048 e!874315)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568366 (= res!1072048 (not (validKeyInArray!0 (select (arr!50570 a!3481) from!2856))))))

(declare-fun b!1568367 () Bool)

(declare-fun res!1072050 () Bool)

(assert (=> b!1568367 (=> (not res!1072050) (not e!874316))))

(assert (=> b!1568367 (= res!1072050 (not (contains!10404 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!134290 res!1072051) b!1568364))

(assert (= (and b!1568364 res!1072053) b!1568367))

(assert (= (and b!1568367 res!1072050) b!1568363))

(assert (= (and b!1568363 res!1072049) b!1568362))

(assert (= (and b!1568362 res!1072052) b!1568366))

(assert (= (and b!1568366 (not res!1072048)) b!1568365))

(declare-fun m!1443045 () Bool)

(assert (=> b!1568367 m!1443045))

(declare-fun m!1443047 () Bool)

(assert (=> b!1568363 m!1443047))

(declare-fun m!1443049 () Bool)

(assert (=> b!1568365 m!1443049))

(assert (=> b!1568365 m!1443049))

(declare-fun m!1443051 () Bool)

(assert (=> b!1568365 m!1443051))

(declare-fun m!1443053 () Bool)

(assert (=> b!1568364 m!1443053))

(declare-fun m!1443055 () Bool)

(assert (=> start!134290 m!1443055))

(assert (=> b!1568366 m!1443049))

(assert (=> b!1568366 m!1443049))

(declare-fun m!1443057 () Bool)

(assert (=> b!1568366 m!1443057))

(check-sat (not b!1568364) (not b!1568366) (not b!1568363) (not b!1568367) (not start!134290) (not b!1568365))
(check-sat)
