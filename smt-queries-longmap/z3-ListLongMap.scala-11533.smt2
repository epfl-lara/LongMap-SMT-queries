; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134232 () Bool)

(assert start!134232)

(declare-fun res!1071868 () Bool)

(declare-fun e!874087 () Bool)

(assert (=> start!134232 (=> (not res!1071868) (not e!874087))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104700 0))(
  ( (array!104701 (arr!50531 (Array (_ BitVec 32) (_ BitVec 64))) (size!51083 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104700)

(assert (=> start!134232 (= res!1071868 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51083 a!3481)) (bvslt (size!51083 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134232 e!874087))

(assert (=> start!134232 true))

(declare-fun array_inv!39467 (array!104700) Bool)

(assert (=> start!134232 (array_inv!39467 a!3481)))

(declare-fun b!1567998 () Bool)

(declare-fun res!1071869 () Bool)

(assert (=> b!1567998 (=> (not res!1071869) (not e!874087))))

(declare-datatypes ((List!36739 0))(
  ( (Nil!36736) (Cons!36735 (h!38183 (_ BitVec 64)) (t!51639 List!36739)) )
))
(declare-fun acc!619 () List!36739)

(declare-fun noDuplicate!2696 (List!36739) Bool)

(assert (=> b!1567998 (= res!1071869 (noDuplicate!2696 acc!619))))

(declare-fun b!1567999 () Bool)

(declare-fun res!1071870 () Bool)

(assert (=> b!1567999 (=> (not res!1071870) (not e!874087))))

(declare-fun contains!10355 (List!36739 (_ BitVec 64)) Bool)

(assert (=> b!1567999 (= res!1071870 (not (contains!10355 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568000 () Bool)

(assert (=> b!1568000 (= e!874087 false)))

(declare-fun lt!672873 () Bool)

(assert (=> b!1568000 (= lt!672873 (contains!10355 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!134232 res!1071868) b!1567998))

(assert (= (and b!1567998 res!1071869) b!1567999))

(assert (= (and b!1567999 res!1071870) b!1568000))

(declare-fun m!1442115 () Bool)

(assert (=> start!134232 m!1442115))

(declare-fun m!1442117 () Bool)

(assert (=> b!1567998 m!1442117))

(declare-fun m!1442119 () Bool)

(assert (=> b!1567999 m!1442119))

(declare-fun m!1442121 () Bool)

(assert (=> b!1568000 m!1442121))

(check-sat (not b!1567999) (not start!134232) (not b!1568000) (not b!1567998))
(check-sat)
