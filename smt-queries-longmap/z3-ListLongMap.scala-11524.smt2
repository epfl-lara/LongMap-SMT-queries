; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134182 () Bool)

(assert start!134182)

(declare-fun b!1567711 () Bool)

(declare-fun res!1071400 () Bool)

(declare-fun e!873906 () Bool)

(assert (=> b!1567711 (=> (not res!1071400) (not e!873906))))

(declare-datatypes ((List!36672 0))(
  ( (Nil!36669) (Cons!36668 (h!38115 (_ BitVec 64)) (t!51580 List!36672)) )
))
(declare-fun acc!619 () List!36672)

(declare-fun contains!10374 (List!36672 (_ BitVec 64)) Bool)

(assert (=> b!1567711 (= res!1071400 (not (contains!10374 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567712 () Bool)

(assert (=> b!1567712 (= e!873906 false)))

(declare-fun lt!673036 () Bool)

(declare-fun e!873908 () Bool)

(assert (=> b!1567712 (= lt!673036 e!873908)))

(declare-fun res!1071397 () Bool)

(assert (=> b!1567712 (=> res!1071397 e!873908)))

(declare-datatypes ((array!104714 0))(
  ( (array!104715 (arr!50540 (Array (_ BitVec 32) (_ BitVec 64))) (size!51090 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104714)

(declare-fun from!2856 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567712 (= res!1071397 (not (validKeyInArray!0 (select (arr!50540 a!3481) from!2856))))))

(declare-fun res!1071402 () Bool)

(assert (=> start!134182 (=> (not res!1071402) (not e!873906))))

(assert (=> start!134182 (= res!1071402 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51090 a!3481)) (bvslt (size!51090 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134182 e!873906))

(assert (=> start!134182 true))

(declare-fun array_inv!39267 (array!104714) Bool)

(assert (=> start!134182 (array_inv!39267 a!3481)))

(declare-fun b!1567713 () Bool)

(declare-fun res!1071401 () Bool)

(assert (=> b!1567713 (=> (not res!1071401) (not e!873906))))

(assert (=> b!1567713 (= res!1071401 (bvslt from!2856 (size!51090 a!3481)))))

(declare-fun b!1567714 () Bool)

(assert (=> b!1567714 (= e!873908 (not (contains!10374 acc!619 (select (arr!50540 a!3481) from!2856))))))

(declare-fun b!1567715 () Bool)

(declare-fun res!1071399 () Bool)

(assert (=> b!1567715 (=> (not res!1071399) (not e!873906))))

(declare-fun noDuplicate!2646 (List!36672) Bool)

(assert (=> b!1567715 (= res!1071399 (noDuplicate!2646 acc!619))))

(declare-fun b!1567716 () Bool)

(declare-fun res!1071398 () Bool)

(assert (=> b!1567716 (=> (not res!1071398) (not e!873906))))

(assert (=> b!1567716 (= res!1071398 (not (contains!10374 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!134182 res!1071402) b!1567715))

(assert (= (and b!1567715 res!1071399) b!1567711))

(assert (= (and b!1567711 res!1071400) b!1567716))

(assert (= (and b!1567716 res!1071398) b!1567713))

(assert (= (and b!1567713 res!1071401) b!1567712))

(assert (= (and b!1567712 (not res!1071397)) b!1567714))

(declare-fun m!1442493 () Bool)

(assert (=> b!1567715 m!1442493))

(declare-fun m!1442495 () Bool)

(assert (=> start!134182 m!1442495))

(declare-fun m!1442497 () Bool)

(assert (=> b!1567714 m!1442497))

(assert (=> b!1567714 m!1442497))

(declare-fun m!1442499 () Bool)

(assert (=> b!1567714 m!1442499))

(assert (=> b!1567712 m!1442497))

(assert (=> b!1567712 m!1442497))

(declare-fun m!1442501 () Bool)

(assert (=> b!1567712 m!1442501))

(declare-fun m!1442503 () Bool)

(assert (=> b!1567716 m!1442503))

(declare-fun m!1442505 () Bool)

(assert (=> b!1567711 m!1442505))

(check-sat (not b!1567711) (not start!134182) (not b!1567715) (not b!1567712) (not b!1567716) (not b!1567714))
