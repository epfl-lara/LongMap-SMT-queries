; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134216 () Bool)

(assert start!134216)

(declare-fun b!1567883 () Bool)

(declare-fun e!874023 () Bool)

(declare-fun e!874024 () Bool)

(assert (=> b!1567883 (= e!874023 e!874024)))

(declare-fun res!1071572 () Bool)

(assert (=> b!1567883 (=> (not res!1071572) (not e!874024))))

(declare-fun e!874021 () Bool)

(assert (=> b!1567883 (= res!1071572 e!874021)))

(declare-fun res!1071575 () Bool)

(assert (=> b!1567883 (=> res!1071575 e!874021)))

(declare-fun lt!673069 () Bool)

(assert (=> b!1567883 (= res!1071575 lt!673069)))

(declare-datatypes ((array!104727 0))(
  ( (array!104728 (arr!50545 (Array (_ BitVec 32) (_ BitVec 64))) (size!51095 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104727)

(declare-fun from!2856 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567883 (= lt!673069 (not (validKeyInArray!0 (select (arr!50545 a!3481) from!2856))))))

(declare-fun b!1567884 () Bool)

(declare-fun res!1071569 () Bool)

(assert (=> b!1567884 (=> (not res!1071569) (not e!874023))))

(assert (=> b!1567884 (= res!1071569 (bvslt from!2856 (size!51095 a!3481)))))

(declare-fun b!1567885 () Bool)

(declare-fun e!874025 () Bool)

(declare-fun e!874022 () Bool)

(assert (=> b!1567885 (= e!874025 e!874022)))

(declare-fun res!1071579 () Bool)

(assert (=> b!1567885 (=> res!1071579 e!874022)))

(declare-datatypes ((List!36677 0))(
  ( (Nil!36674) (Cons!36673 (h!38120 (_ BitVec 64)) (t!51585 List!36677)) )
))
(declare-fun lt!673068 () List!36677)

(declare-fun contains!10379 (List!36677 (_ BitVec 64)) Bool)

(assert (=> b!1567885 (= res!1071579 (contains!10379 lt!673068 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567886 () Bool)

(assert (=> b!1567886 (= e!874022 (contains!10379 lt!673068 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567887 () Bool)

(assert (=> b!1567887 (= e!874024 e!874025)))

(declare-fun res!1071573 () Bool)

(assert (=> b!1567887 (=> (not res!1071573) (not e!874025))))

(assert (=> b!1567887 (= res!1071573 (bvsge (bvadd #b00000000000000000000000000000001 from!2856) #b00000000000000000000000000000000))))

(declare-fun acc!619 () List!36677)

(assert (=> b!1567887 (= lt!673068 (Cons!36673 (select (arr!50545 a!3481) from!2856) acc!619))))

(declare-fun b!1567888 () Bool)

(declare-fun res!1071574 () Bool)

(assert (=> b!1567888 (=> (not res!1071574) (not e!874023))))

(assert (=> b!1567888 (= res!1071574 (not (contains!10379 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567890 () Bool)

(assert (=> b!1567890 (= e!874021 (not (contains!10379 acc!619 (select (arr!50545 a!3481) from!2856))))))

(declare-fun b!1567891 () Bool)

(declare-fun res!1071571 () Bool)

(assert (=> b!1567891 (=> (not res!1071571) (not e!874023))))

(assert (=> b!1567891 (= res!1071571 (not (contains!10379 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567892 () Bool)

(declare-fun res!1071576 () Bool)

(assert (=> b!1567892 (=> (not res!1071576) (not e!874024))))

(assert (=> b!1567892 (= res!1071576 (not lt!673069))))

(declare-fun b!1567893 () Bool)

(declare-fun res!1071577 () Bool)

(assert (=> b!1567893 (=> (not res!1071577) (not e!874025))))

(declare-fun noDuplicate!2651 (List!36677) Bool)

(assert (=> b!1567893 (= res!1071577 (noDuplicate!2651 lt!673068))))

(declare-fun b!1567889 () Bool)

(declare-fun res!1071578 () Bool)

(assert (=> b!1567889 (=> (not res!1071578) (not e!874023))))

(assert (=> b!1567889 (= res!1071578 (noDuplicate!2651 acc!619))))

(declare-fun res!1071570 () Bool)

(assert (=> start!134216 (=> (not res!1071570) (not e!874023))))

(assert (=> start!134216 (= res!1071570 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51095 a!3481)) (bvslt (size!51095 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134216 e!874023))

(assert (=> start!134216 true))

(declare-fun array_inv!39272 (array!104727) Bool)

(assert (=> start!134216 (array_inv!39272 a!3481)))

(assert (= (and start!134216 res!1071570) b!1567889))

(assert (= (and b!1567889 res!1071578) b!1567891))

(assert (= (and b!1567891 res!1071571) b!1567888))

(assert (= (and b!1567888 res!1071574) b!1567884))

(assert (= (and b!1567884 res!1071569) b!1567883))

(assert (= (and b!1567883 (not res!1071575)) b!1567890))

(assert (= (and b!1567883 res!1071572) b!1567892))

(assert (= (and b!1567892 res!1071576) b!1567887))

(assert (= (and b!1567887 res!1071573) b!1567893))

(assert (= (and b!1567893 res!1071577) b!1567885))

(assert (= (and b!1567885 (not res!1071579)) b!1567886))

(declare-fun m!1442635 () Bool)

(assert (=> b!1567888 m!1442635))

(declare-fun m!1442637 () Bool)

(assert (=> b!1567893 m!1442637))

(declare-fun m!1442639 () Bool)

(assert (=> b!1567891 m!1442639))

(declare-fun m!1442641 () Bool)

(assert (=> b!1567889 m!1442641))

(declare-fun m!1442643 () Bool)

(assert (=> b!1567886 m!1442643))

(declare-fun m!1442645 () Bool)

(assert (=> b!1567883 m!1442645))

(assert (=> b!1567883 m!1442645))

(declare-fun m!1442647 () Bool)

(assert (=> b!1567883 m!1442647))

(assert (=> b!1567887 m!1442645))

(assert (=> b!1567890 m!1442645))

(assert (=> b!1567890 m!1442645))

(declare-fun m!1442649 () Bool)

(assert (=> b!1567890 m!1442649))

(declare-fun m!1442651 () Bool)

(assert (=> start!134216 m!1442651))

(declare-fun m!1442653 () Bool)

(assert (=> b!1567885 m!1442653))

(push 1)

(assert (not b!1567885))

(assert (not b!1567891))

(assert (not b!1567893))

(assert (not start!134216))

(assert (not b!1567889))

(assert (not b!1567888))

(assert (not b!1567886))

(assert (not b!1567890))

(assert (not b!1567883))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163683 () Bool)

(declare-fun lt!673091 () Bool)

(declare-fun content!816 (List!36677) (Set (_ BitVec 64)))

(assert (=> d!163683 (= lt!673091 (set.member (select (arr!50545 a!3481) from!2856) (content!816 acc!619)))))

(declare-fun e!874088 () Bool)

(assert (=> d!163683 (= lt!673091 e!874088)))

(declare-fun res!1071673 () Bool)

(assert (=> d!163683 (=> (not res!1071673) (not e!874088))))

(assert (=> d!163683 (= res!1071673 (is-Cons!36673 acc!619))))

(assert (=> d!163683 (= (contains!10379 acc!619 (select (arr!50545 a!3481) from!2856)) lt!673091)))

(declare-fun b!1567986 () Bool)

(declare-fun e!874089 () Bool)

(assert (=> b!1567986 (= e!874088 e!874089)))

(declare-fun res!1071672 () Bool)

(assert (=> b!1567986 (=> res!1071672 e!874089)))

(assert (=> b!1567986 (= res!1071672 (= (h!38120 acc!619) (select (arr!50545 a!3481) from!2856)))))

(declare-fun b!1567987 () Bool)

(assert (=> b!1567987 (= e!874089 (contains!10379 (t!51585 acc!619) (select (arr!50545 a!3481) from!2856)))))

(assert (= (and d!163683 res!1071673) b!1567986))

(assert (= (and b!1567986 (not res!1071672)) b!1567987))

(declare-fun m!1442727 () Bool)

(assert (=> d!163683 m!1442727))

(assert (=> d!163683 m!1442645))

(declare-fun m!1442729 () Bool)

(assert (=> d!163683 m!1442729))

(assert (=> b!1567987 m!1442645))

(declare-fun m!1442731 () Bool)

(assert (=> b!1567987 m!1442731))

(assert (=> b!1567890 d!163683))

(declare-fun d!163695 () Bool)

(declare-fun lt!673092 () Bool)

(assert (=> d!163695 (= lt!673092 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!816 lt!673068)))))

(declare-fun e!874090 () Bool)

(assert (=> d!163695 (= lt!673092 e!874090)))

(declare-fun res!1071675 () Bool)

(assert (=> d!163695 (=> (not res!1071675) (not e!874090))))

(assert (=> d!163695 (= res!1071675 (is-Cons!36673 lt!673068))))

(assert (=> d!163695 (= (contains!10379 lt!673068 #b0000000000000000000000000000000000000000000000000000000000000000) lt!673092)))

(declare-fun b!1567988 () Bool)

(declare-fun e!874091 () Bool)

(assert (=> b!1567988 (= e!874090 e!874091)))

(declare-fun res!1071674 () Bool)

(assert (=> b!1567988 (=> res!1071674 e!874091)))

(assert (=> b!1567988 (= res!1071674 (= (h!38120 lt!673068) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567989 () Bool)

(assert (=> b!1567989 (= e!874091 (contains!10379 (t!51585 lt!673068) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163695 res!1071675) b!1567988))

(assert (= (and b!1567988 (not res!1071674)) b!1567989))

(declare-fun m!1442733 () Bool)

(assert (=> d!163695 m!1442733))

(declare-fun m!1442735 () Bool)

(assert (=> d!163695 m!1442735))

(declare-fun m!1442737 () Bool)

(assert (=> b!1567989 m!1442737))

(assert (=> b!1567885 d!163695))

(declare-fun d!163697 () Bool)

(declare-fun lt!673093 () Bool)

(assert (=> d!163697 (= lt!673093 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!816 acc!619)))))

(declare-fun e!874092 () Bool)

(assert (=> d!163697 (= lt!673093 e!874092)))

(declare-fun res!1071677 () Bool)

(assert (=> d!163697 (=> (not res!1071677) (not e!874092))))

(assert (=> d!163697 (= res!1071677 (is-Cons!36673 acc!619))))

(assert (=> d!163697 (= (contains!10379 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000) lt!673093)))

(declare-fun b!1567990 () Bool)

(declare-fun e!874093 () Bool)

(assert (=> b!1567990 (= e!874092 e!874093)))

(declare-fun res!1071676 () Bool)

(assert (=> b!1567990 (=> res!1071676 e!874093)))

(assert (=> b!1567990 (= res!1071676 (= (h!38120 acc!619) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567991 () Bool)

(assert (=> b!1567991 (= e!874093 (contains!10379 (t!51585 acc!619) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163697 res!1071677) b!1567990))

(assert (= (and b!1567990 (not res!1071676)) b!1567991))

(assert (=> d!163697 m!1442727))

(declare-fun m!1442739 () Bool)

(assert (=> d!163697 m!1442739))

(declare-fun m!1442741 () Bool)

(assert (=> b!1567991 m!1442741))

(assert (=> b!1567891 d!163697))

(declare-fun d!163699 () Bool)

(declare-fun lt!673094 () Bool)

(assert (=> d!163699 (= lt!673094 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!816 lt!673068)))))

(declare-fun e!874094 () Bool)

(assert (=> d!163699 (= lt!673094 e!874094)))

(declare-fun res!1071679 () Bool)

(assert (=> d!163699 (=> (not res!1071679) (not e!874094))))

(assert (=> d!163699 (= res!1071679 (is-Cons!36673 lt!673068))))

(assert (=> d!163699 (= (contains!10379 lt!673068 #b1000000000000000000000000000000000000000000000000000000000000000) lt!673094)))

(declare-fun b!1567992 () Bool)

(declare-fun e!874095 () Bool)

(assert (=> b!1567992 (= e!874094 e!874095)))

(declare-fun res!1071678 () Bool)

(assert (=> b!1567992 (=> res!1071678 e!874095)))

(assert (=> b!1567992 (= res!1071678 (= (h!38120 lt!673068) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567993 () Bool)

(assert (=> b!1567993 (= e!874095 (contains!10379 (t!51585 lt!673068) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163699 res!1071679) b!1567992))

(assert (= (and b!1567992 (not res!1071678)) b!1567993))

(assert (=> d!163699 m!1442733))

(declare-fun m!1442743 () Bool)

(assert (=> d!163699 m!1442743))

(declare-fun m!1442745 () Bool)

(assert (=> b!1567993 m!1442745))

(assert (=> b!1567886 d!163699))

(declare-fun d!163701 () Bool)

(declare-fun res!1071684 () Bool)

(declare-fun e!874100 () Bool)

(assert (=> d!163701 (=> res!1071684 e!874100)))

(assert (=> d!163701 (= res!1071684 (is-Nil!36674 lt!673068))))

(assert (=> d!163701 (= (noDuplicate!2651 lt!673068) e!874100)))

(declare-fun b!1567998 () Bool)

(declare-fun e!874101 () Bool)

(assert (=> b!1567998 (= e!874100 e!874101)))

(declare-fun res!1071685 () Bool)

(assert (=> b!1567998 (=> (not res!1071685) (not e!874101))))

(assert (=> b!1567998 (= res!1071685 (not (contains!10379 (t!51585 lt!673068) (h!38120 lt!673068))))))

(declare-fun b!1567999 () Bool)

(assert (=> b!1567999 (= e!874101 (noDuplicate!2651 (t!51585 lt!673068)))))

(assert (= (and d!163701 (not res!1071684)) b!1567998))

(assert (= (and b!1567998 res!1071685) b!1567999))

(declare-fun m!1442747 () Bool)

(assert (=> b!1567998 m!1442747))

(declare-fun m!1442749 () Bool)

(assert (=> b!1567999 m!1442749))

(assert (=> b!1567893 d!163701))

(declare-fun d!163705 () Bool)

(declare-fun lt!673095 () Bool)

(assert (=> d!163705 (= lt!673095 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!816 acc!619)))))

(declare-fun e!874102 () Bool)

(assert (=> d!163705 (= lt!673095 e!874102)))

(declare-fun res!1071687 () Bool)

(assert (=> d!163705 (=> (not res!1071687) (not e!874102))))

(assert (=> d!163705 (= res!1071687 (is-Cons!36673 acc!619))))

(assert (=> d!163705 (= (contains!10379 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000) lt!673095)))

(declare-fun b!1568000 () Bool)

(declare-fun e!874103 () Bool)

(assert (=> b!1568000 (= e!874102 e!874103)))

(declare-fun res!1071686 () Bool)

(assert (=> b!1568000 (=> res!1071686 e!874103)))

(assert (=> b!1568000 (= res!1071686 (= (h!38120 acc!619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1568001 () Bool)

(assert (=> b!1568001 (= e!874103 (contains!10379 (t!51585 acc!619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163705 res!1071687) b!1568000))

(assert (= (and b!1568000 (not res!1071686)) b!1568001))

(assert (=> d!163705 m!1442727))

(declare-fun m!1442751 () Bool)

(assert (=> d!163705 m!1442751))

(declare-fun m!1442753 () Bool)

(assert (=> b!1568001 m!1442753))

(assert (=> b!1567888 d!163705))

(declare-fun d!163707 () Bool)

(assert (=> d!163707 (= (array_inv!39272 a!3481) (bvsge (size!51095 a!3481) #b00000000000000000000000000000000))))

(assert (=> start!134216 d!163707))

(declare-fun d!163709 () Bool)

(assert (=> d!163709 (= (validKeyInArray!0 (select (arr!50545 a!3481) from!2856)) (and (not (= (select (arr!50545 a!3481) from!2856) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50545 a!3481) from!2856) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1567883 d!163709))

(declare-fun d!163711 () Bool)

(declare-fun res!1071692 () Bool)

(declare-fun e!874108 () Bool)

(assert (=> d!163711 (=> res!1071692 e!874108)))

(assert (=> d!163711 (= res!1071692 (is-Nil!36674 acc!619))))

(assert (=> d!163711 (= (noDuplicate!2651 acc!619) e!874108)))

(declare-fun b!1568006 () Bool)

(declare-fun e!874109 () Bool)

(assert (=> b!1568006 (= e!874108 e!874109)))

(declare-fun res!1071693 () Bool)

(assert (=> b!1568006 (=> (not res!1071693) (not e!874109))))

(assert (=> b!1568006 (= res!1071693 (not (contains!10379 (t!51585 acc!619) (h!38120 acc!619))))))

(declare-fun b!1568007 () Bool)

(assert (=> b!1568007 (= e!874109 (noDuplicate!2651 (t!51585 acc!619)))))

(assert (= (and d!163711 (not res!1071692)) b!1568006))

(assert (= (and b!1568006 res!1071693) b!1568007))

(declare-fun m!1442755 () Bool)

(assert (=> b!1568006 m!1442755))

(declare-fun m!1442757 () Bool)

(assert (=> b!1568007 m!1442757))

(assert (=> b!1567889 d!163711))

(push 1)

