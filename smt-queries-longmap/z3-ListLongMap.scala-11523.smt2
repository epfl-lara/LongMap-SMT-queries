; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134586 () Bool)

(assert start!134586)

(declare-fun b!1570068 () Bool)

(declare-fun res!1072182 () Bool)

(declare-fun e!875375 () Bool)

(assert (=> b!1570068 (=> (not res!1072182) (not e!875375))))

(declare-datatypes ((List!36700 0))(
  ( (Nil!36697) (Cons!36696 (h!38161 (_ BitVec 64)) (t!51600 List!36700)) )
))
(declare-fun acc!619 () List!36700)

(declare-fun contains!10415 (List!36700 (_ BitVec 64)) Bool)

(assert (=> b!1570068 (= res!1072182 (not (contains!10415 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1570069 () Bool)

(declare-fun res!1072183 () Bool)

(assert (=> b!1570069 (=> (not res!1072183) (not e!875375))))

(assert (=> b!1570069 (= res!1072183 (not (contains!10415 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((array!104828 0))(
  ( (array!104829 (arr!50590 (Array (_ BitVec 32) (_ BitVec 64))) (size!51141 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104828)

(declare-fun e!875373 () Bool)

(declare-fun from!2856 () (_ BitVec 32))

(declare-fun b!1570070 () Bool)

(assert (=> b!1570070 (= e!875373 (not (contains!10415 acc!619 (select (arr!50590 a!3481) from!2856))))))

(declare-fun b!1570071 () Bool)

(declare-fun res!1072179 () Bool)

(assert (=> b!1570071 (=> (not res!1072179) (not e!875375))))

(assert (=> b!1570071 (= res!1072179 (bvslt from!2856 (size!51141 a!3481)))))

(declare-fun b!1570073 () Bool)

(declare-fun e!875374 () Bool)

(assert (=> b!1570073 (= e!875375 e!875374)))

(declare-fun res!1072180 () Bool)

(assert (=> b!1570073 (=> (not res!1072180) (not e!875374))))

(assert (=> b!1570073 (= res!1072180 e!875373)))

(declare-fun res!1072181 () Bool)

(assert (=> b!1570073 (=> res!1072181 e!875373)))

(declare-fun lt!673932 () Bool)

(assert (=> b!1570073 (= res!1072181 lt!673932)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1570073 (= lt!673932 (not (validKeyInArray!0 (select (arr!50590 a!3481) from!2856))))))

(declare-fun b!1570074 () Bool)

(assert (=> b!1570074 (= e!875374 (and (not lt!673932) (bvslt (bvadd #b00000000000000000000000000000001 from!2856) #b00000000000000000000000000000000)))))

(declare-fun res!1072184 () Bool)

(assert (=> start!134586 (=> (not res!1072184) (not e!875375))))

(assert (=> start!134586 (= res!1072184 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51141 a!3481)) (bvslt (size!51141 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134586 e!875375))

(assert (=> start!134586 true))

(declare-fun array_inv!39545 (array!104828) Bool)

(assert (=> start!134586 (array_inv!39545 a!3481)))

(declare-fun b!1570072 () Bool)

(declare-fun res!1072178 () Bool)

(assert (=> b!1570072 (=> (not res!1072178) (not e!875375))))

(declare-fun noDuplicate!2663 (List!36700) Bool)

(assert (=> b!1570072 (= res!1072178 (noDuplicate!2663 acc!619))))

(assert (= (and start!134586 res!1072184) b!1570072))

(assert (= (and b!1570072 res!1072178) b!1570069))

(assert (= (and b!1570069 res!1072183) b!1570068))

(assert (= (and b!1570068 res!1072182) b!1570071))

(assert (= (and b!1570071 res!1072179) b!1570073))

(assert (= (and b!1570073 (not res!1072181)) b!1570070))

(assert (= (and b!1570073 res!1072180) b!1570074))

(declare-fun m!1444695 () Bool)

(assert (=> b!1570073 m!1444695))

(assert (=> b!1570073 m!1444695))

(declare-fun m!1444697 () Bool)

(assert (=> b!1570073 m!1444697))

(declare-fun m!1444699 () Bool)

(assert (=> start!134586 m!1444699))

(declare-fun m!1444701 () Bool)

(assert (=> b!1570068 m!1444701))

(assert (=> b!1570070 m!1444695))

(assert (=> b!1570070 m!1444695))

(declare-fun m!1444703 () Bool)

(assert (=> b!1570070 m!1444703))

(declare-fun m!1444705 () Bool)

(assert (=> b!1570069 m!1444705))

(declare-fun m!1444707 () Bool)

(assert (=> b!1570072 m!1444707))

(check-sat (not b!1570072) (not start!134586) (not b!1570068) (not b!1570070) (not b!1570073) (not b!1570069))
(check-sat)
