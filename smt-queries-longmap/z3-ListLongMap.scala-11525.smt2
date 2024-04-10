; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134188 () Bool)

(assert start!134188)

(declare-datatypes ((array!104720 0))(
  ( (array!104721 (arr!50543 (Array (_ BitVec 32) (_ BitVec 64))) (size!51093 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104720)

(declare-fun e!873938 () Bool)

(declare-fun from!2856 () (_ BitVec 32))

(declare-fun b!1567775 () Bool)

(declare-datatypes ((List!36675 0))(
  ( (Nil!36672) (Cons!36671 (h!38118 (_ BitVec 64)) (t!51583 List!36675)) )
))
(declare-fun acc!619 () List!36675)

(declare-fun contains!10377 (List!36675 (_ BitVec 64)) Bool)

(assert (=> b!1567775 (= e!873938 (not (contains!10377 acc!619 (select (arr!50543 a!3481) from!2856))))))

(declare-fun b!1567776 () Bool)

(declare-fun res!1071465 () Bool)

(declare-fun e!873940 () Bool)

(assert (=> b!1567776 (=> (not res!1071465) (not e!873940))))

(declare-fun lt!673045 () Bool)

(assert (=> b!1567776 (= res!1071465 (and (not lt!673045) (bvsge (bvadd #b00000000000000000000000000000001 from!2856) #b00000000000000000000000000000000)))))

(declare-fun b!1567777 () Bool)

(declare-fun res!1071468 () Bool)

(declare-fun e!873939 () Bool)

(assert (=> b!1567777 (=> (not res!1071468) (not e!873939))))

(assert (=> b!1567777 (= res!1071468 (not (contains!10377 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567778 () Bool)

(declare-fun res!1071467 () Bool)

(assert (=> b!1567778 (=> (not res!1071467) (not e!873939))))

(assert (=> b!1567778 (= res!1071467 (bvslt from!2856 (size!51093 a!3481)))))

(declare-fun res!1071461 () Bool)

(assert (=> start!134188 (=> (not res!1071461) (not e!873939))))

(assert (=> start!134188 (= res!1071461 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51093 a!3481)) (bvslt (size!51093 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134188 e!873939))

(assert (=> start!134188 true))

(declare-fun array_inv!39270 (array!104720) Bool)

(assert (=> start!134188 (array_inv!39270 a!3481)))

(declare-fun b!1567779 () Bool)

(declare-fun noDuplicate!2649 (List!36675) Bool)

(assert (=> b!1567779 (= e!873940 (not (noDuplicate!2649 (Cons!36671 (select (arr!50543 a!3481) from!2856) acc!619))))))

(declare-fun b!1567780 () Bool)

(declare-fun res!1071462 () Bool)

(assert (=> b!1567780 (=> (not res!1071462) (not e!873939))))

(assert (=> b!1567780 (= res!1071462 (not (contains!10377 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567781 () Bool)

(declare-fun res!1071464 () Bool)

(assert (=> b!1567781 (=> (not res!1071464) (not e!873939))))

(assert (=> b!1567781 (= res!1071464 (noDuplicate!2649 acc!619))))

(declare-fun b!1567782 () Bool)

(assert (=> b!1567782 (= e!873939 e!873940)))

(declare-fun res!1071463 () Bool)

(assert (=> b!1567782 (=> (not res!1071463) (not e!873940))))

(assert (=> b!1567782 (= res!1071463 e!873938)))

(declare-fun res!1071466 () Bool)

(assert (=> b!1567782 (=> res!1071466 e!873938)))

(assert (=> b!1567782 (= res!1071466 lt!673045)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567782 (= lt!673045 (not (validKeyInArray!0 (select (arr!50543 a!3481) from!2856))))))

(assert (= (and start!134188 res!1071461) b!1567781))

(assert (= (and b!1567781 res!1071464) b!1567780))

(assert (= (and b!1567780 res!1071462) b!1567777))

(assert (= (and b!1567777 res!1071468) b!1567778))

(assert (= (and b!1567778 res!1071467) b!1567782))

(assert (= (and b!1567782 (not res!1071466)) b!1567775))

(assert (= (and b!1567782 res!1071463) b!1567776))

(assert (= (and b!1567776 res!1071465) b!1567779))

(declare-fun m!1442537 () Bool)

(assert (=> b!1567780 m!1442537))

(declare-fun m!1442539 () Bool)

(assert (=> b!1567775 m!1442539))

(assert (=> b!1567775 m!1442539))

(declare-fun m!1442541 () Bool)

(assert (=> b!1567775 m!1442541))

(declare-fun m!1442543 () Bool)

(assert (=> b!1567777 m!1442543))

(assert (=> b!1567782 m!1442539))

(assert (=> b!1567782 m!1442539))

(declare-fun m!1442545 () Bool)

(assert (=> b!1567782 m!1442545))

(assert (=> b!1567779 m!1442539))

(declare-fun m!1442547 () Bool)

(assert (=> b!1567779 m!1442547))

(declare-fun m!1442549 () Bool)

(assert (=> start!134188 m!1442549))

(declare-fun m!1442551 () Bool)

(assert (=> b!1567781 m!1442551))

(check-sat (not b!1567782) (not b!1567777) (not b!1567780) (not b!1567775) (not start!134188) (not b!1567781) (not b!1567779))
(check-sat)
(get-model)

(declare-fun d!163631 () Bool)

(assert (=> d!163631 (= (validKeyInArray!0 (select (arr!50543 a!3481) from!2856)) (and (not (= (select (arr!50543 a!3481) from!2856) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50543 a!3481) from!2856) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1567782 d!163631))

(declare-fun d!163633 () Bool)

(declare-fun lt!673051 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!812 (List!36675) (InoxSet (_ BitVec 64)))

(assert (=> d!163633 (= lt!673051 (select (content!812 acc!619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!873959 () Bool)

(assert (=> d!163633 (= lt!673051 e!873959)))

(declare-fun res!1071498 () Bool)

(assert (=> d!163633 (=> (not res!1071498) (not e!873959))))

(get-info :version)

(assert (=> d!163633 (= res!1071498 ((_ is Cons!36671) acc!619))))

(assert (=> d!163633 (= (contains!10377 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000) lt!673051)))

(declare-fun b!1567811 () Bool)

(declare-fun e!873958 () Bool)

(assert (=> b!1567811 (= e!873959 e!873958)))

(declare-fun res!1071497 () Bool)

(assert (=> b!1567811 (=> res!1071497 e!873958)))

(assert (=> b!1567811 (= res!1071497 (= (h!38118 acc!619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567812 () Bool)

(assert (=> b!1567812 (= e!873958 (contains!10377 (t!51583 acc!619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163633 res!1071498) b!1567811))

(assert (= (and b!1567811 (not res!1071497)) b!1567812))

(declare-fun m!1442569 () Bool)

(assert (=> d!163633 m!1442569))

(declare-fun m!1442571 () Bool)

(assert (=> d!163633 m!1442571))

(declare-fun m!1442573 () Bool)

(assert (=> b!1567812 m!1442573))

(assert (=> b!1567777 d!163633))

(declare-fun d!163637 () Bool)

(assert (=> d!163637 (= (array_inv!39270 a!3481) (bvsge (size!51093 a!3481) #b00000000000000000000000000000000))))

(assert (=> start!134188 d!163637))

(declare-fun d!163639 () Bool)

(declare-fun res!1071511 () Bool)

(declare-fun e!873972 () Bool)

(assert (=> d!163639 (=> res!1071511 e!873972)))

(assert (=> d!163639 (= res!1071511 ((_ is Nil!36672) (Cons!36671 (select (arr!50543 a!3481) from!2856) acc!619)))))

(assert (=> d!163639 (= (noDuplicate!2649 (Cons!36671 (select (arr!50543 a!3481) from!2856) acc!619)) e!873972)))

(declare-fun b!1567825 () Bool)

(declare-fun e!873973 () Bool)

(assert (=> b!1567825 (= e!873972 e!873973)))

(declare-fun res!1071512 () Bool)

(assert (=> b!1567825 (=> (not res!1071512) (not e!873973))))

(assert (=> b!1567825 (= res!1071512 (not (contains!10377 (t!51583 (Cons!36671 (select (arr!50543 a!3481) from!2856) acc!619)) (h!38118 (Cons!36671 (select (arr!50543 a!3481) from!2856) acc!619)))))))

(declare-fun b!1567826 () Bool)

(assert (=> b!1567826 (= e!873973 (noDuplicate!2649 (t!51583 (Cons!36671 (select (arr!50543 a!3481) from!2856) acc!619))))))

(assert (= (and d!163639 (not res!1071511)) b!1567825))

(assert (= (and b!1567825 res!1071512) b!1567826))

(declare-fun m!1442579 () Bool)

(assert (=> b!1567825 m!1442579))

(declare-fun m!1442581 () Bool)

(assert (=> b!1567826 m!1442581))

(assert (=> b!1567779 d!163639))

(declare-fun d!163643 () Bool)

(declare-fun lt!673052 () Bool)

(assert (=> d!163643 (= lt!673052 (select (content!812 acc!619) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!873975 () Bool)

(assert (=> d!163643 (= lt!673052 e!873975)))

(declare-fun res!1071514 () Bool)

(assert (=> d!163643 (=> (not res!1071514) (not e!873975))))

(assert (=> d!163643 (= res!1071514 ((_ is Cons!36671) acc!619))))

(assert (=> d!163643 (= (contains!10377 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000) lt!673052)))

(declare-fun b!1567827 () Bool)

(declare-fun e!873974 () Bool)

(assert (=> b!1567827 (= e!873975 e!873974)))

(declare-fun res!1071513 () Bool)

(assert (=> b!1567827 (=> res!1071513 e!873974)))

(assert (=> b!1567827 (= res!1071513 (= (h!38118 acc!619) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567828 () Bool)

(assert (=> b!1567828 (= e!873974 (contains!10377 (t!51583 acc!619) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163643 res!1071514) b!1567827))

(assert (= (and b!1567827 (not res!1071513)) b!1567828))

(assert (=> d!163643 m!1442569))

(declare-fun m!1442587 () Bool)

(assert (=> d!163643 m!1442587))

(declare-fun m!1442589 () Bool)

(assert (=> b!1567828 m!1442589))

(assert (=> b!1567780 d!163643))

(declare-fun d!163647 () Bool)

(declare-fun lt!673053 () Bool)

(assert (=> d!163647 (= lt!673053 (select (content!812 acc!619) (select (arr!50543 a!3481) from!2856)))))

(declare-fun e!873977 () Bool)

(assert (=> d!163647 (= lt!673053 e!873977)))

(declare-fun res!1071516 () Bool)

(assert (=> d!163647 (=> (not res!1071516) (not e!873977))))

(assert (=> d!163647 (= res!1071516 ((_ is Cons!36671) acc!619))))

(assert (=> d!163647 (= (contains!10377 acc!619 (select (arr!50543 a!3481) from!2856)) lt!673053)))

(declare-fun b!1567829 () Bool)

(declare-fun e!873976 () Bool)

(assert (=> b!1567829 (= e!873977 e!873976)))

(declare-fun res!1071515 () Bool)

(assert (=> b!1567829 (=> res!1071515 e!873976)))

(assert (=> b!1567829 (= res!1071515 (= (h!38118 acc!619) (select (arr!50543 a!3481) from!2856)))))

(declare-fun b!1567830 () Bool)

(assert (=> b!1567830 (= e!873976 (contains!10377 (t!51583 acc!619) (select (arr!50543 a!3481) from!2856)))))

(assert (= (and d!163647 res!1071516) b!1567829))

(assert (= (and b!1567829 (not res!1071515)) b!1567830))

(assert (=> d!163647 m!1442569))

(assert (=> d!163647 m!1442539))

(declare-fun m!1442591 () Bool)

(assert (=> d!163647 m!1442591))

(assert (=> b!1567830 m!1442539))

(declare-fun m!1442593 () Bool)

(assert (=> b!1567830 m!1442593))

(assert (=> b!1567775 d!163647))

(declare-fun d!163649 () Bool)

(declare-fun res!1071517 () Bool)

(declare-fun e!873978 () Bool)

(assert (=> d!163649 (=> res!1071517 e!873978)))

(assert (=> d!163649 (= res!1071517 ((_ is Nil!36672) acc!619))))

(assert (=> d!163649 (= (noDuplicate!2649 acc!619) e!873978)))

(declare-fun b!1567831 () Bool)

(declare-fun e!873979 () Bool)

(assert (=> b!1567831 (= e!873978 e!873979)))

(declare-fun res!1071518 () Bool)

(assert (=> b!1567831 (=> (not res!1071518) (not e!873979))))

(assert (=> b!1567831 (= res!1071518 (not (contains!10377 (t!51583 acc!619) (h!38118 acc!619))))))

(declare-fun b!1567832 () Bool)

(assert (=> b!1567832 (= e!873979 (noDuplicate!2649 (t!51583 acc!619)))))

(assert (= (and d!163649 (not res!1071517)) b!1567831))

(assert (= (and b!1567831 res!1071518) b!1567832))

(declare-fun m!1442595 () Bool)

(assert (=> b!1567831 m!1442595))

(declare-fun m!1442597 () Bool)

(assert (=> b!1567832 m!1442597))

(assert (=> b!1567781 d!163649))

(check-sat (not b!1567831) (not b!1567832) (not b!1567826) (not d!163643) (not b!1567828) (not b!1567825) (not d!163647) (not b!1567812) (not d!163633) (not b!1567830))
(check-sat)
