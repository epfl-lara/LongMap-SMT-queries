; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134302 () Bool)

(assert start!134302)

(declare-fun res!1072161 () Bool)

(declare-fun e!874375 () Bool)

(assert (=> start!134302 (=> (not res!1072161) (not e!874375))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104792 0))(
  ( (array!104793 (arr!50576 (Array (_ BitVec 32) (_ BitVec 64))) (size!51126 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104792)

(assert (=> start!134302 (= res!1072161 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51126 a!3481)) (bvslt (size!51126 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134302 e!874375))

(assert (=> start!134302 true))

(declare-fun array_inv!39303 (array!104792) Bool)

(assert (=> start!134302 (array_inv!39303 a!3481)))

(declare-fun b!1568475 () Bool)

(declare-fun res!1072164 () Bool)

(assert (=> b!1568475 (=> (not res!1072164) (not e!874375))))

(assert (=> b!1568475 (= res!1072164 (bvslt from!2856 (size!51126 a!3481)))))

(declare-fun b!1568476 () Bool)

(declare-fun res!1072162 () Bool)

(assert (=> b!1568476 (=> (not res!1072162) (not e!874375))))

(declare-datatypes ((List!36708 0))(
  ( (Nil!36705) (Cons!36704 (h!38151 (_ BitVec 64)) (t!51616 List!36708)) )
))
(declare-fun acc!619 () List!36708)

(declare-fun contains!10410 (List!36708 (_ BitVec 64)) Bool)

(assert (=> b!1568476 (= res!1072162 (not (contains!10410 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568477 () Bool)

(declare-fun res!1072167 () Bool)

(assert (=> b!1568477 (=> (not res!1072167) (not e!874375))))

(assert (=> b!1568477 (= res!1072167 (not (contains!10410 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!874373 () Bool)

(declare-fun b!1568478 () Bool)

(assert (=> b!1568478 (= e!874373 (not (contains!10410 acc!619 (select (arr!50576 a!3481) from!2856))))))

(declare-fun b!1568479 () Bool)

(declare-fun res!1072165 () Bool)

(assert (=> b!1568479 (=> (not res!1072165) (not e!874375))))

(declare-fun noDuplicate!2682 (List!36708) Bool)

(assert (=> b!1568479 (= res!1072165 (noDuplicate!2682 acc!619))))

(declare-fun b!1568480 () Bool)

(declare-fun e!874374 () Bool)

(assert (=> b!1568480 (= e!874375 e!874374)))

(declare-fun res!1072166 () Bool)

(assert (=> b!1568480 (=> (not res!1072166) (not e!874374))))

(assert (=> b!1568480 (= res!1072166 e!874373)))

(declare-fun res!1072163 () Bool)

(assert (=> b!1568480 (=> res!1072163 e!874373)))

(declare-fun lt!673189 () Bool)

(assert (=> b!1568480 (= res!1072163 lt!673189)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568480 (= lt!673189 (not (validKeyInArray!0 (select (arr!50576 a!3481) from!2856))))))

(declare-fun b!1568481 () Bool)

(assert (=> b!1568481 (= e!874374 (and (not lt!673189) (bvsge (bvsub (size!51126 a!3481) (bvadd #b00000000000000000000000000000001 from!2856)) (bvsub (size!51126 a!3481) from!2856))))))

(assert (= (and start!134302 res!1072161) b!1568479))

(assert (= (and b!1568479 res!1072165) b!1568476))

(assert (= (and b!1568476 res!1072162) b!1568477))

(assert (= (and b!1568477 res!1072167) b!1568475))

(assert (= (and b!1568475 res!1072164) b!1568480))

(assert (= (and b!1568480 (not res!1072163)) b!1568478))

(assert (= (and b!1568480 res!1072166) b!1568481))

(declare-fun m!1443129 () Bool)

(assert (=> start!134302 m!1443129))

(declare-fun m!1443131 () Bool)

(assert (=> b!1568479 m!1443131))

(declare-fun m!1443133 () Bool)

(assert (=> b!1568480 m!1443133))

(assert (=> b!1568480 m!1443133))

(declare-fun m!1443135 () Bool)

(assert (=> b!1568480 m!1443135))

(declare-fun m!1443137 () Bool)

(assert (=> b!1568477 m!1443137))

(declare-fun m!1443139 () Bool)

(assert (=> b!1568476 m!1443139))

(assert (=> b!1568478 m!1443133))

(assert (=> b!1568478 m!1443133))

(declare-fun m!1443141 () Bool)

(assert (=> b!1568478 m!1443141))

(check-sat (not start!134302) (not b!1568476) (not b!1568480) (not b!1568479) (not b!1568477) (not b!1568478))
(check-sat)
