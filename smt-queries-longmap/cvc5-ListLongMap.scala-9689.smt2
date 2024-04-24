; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114698 () Bool)

(assert start!114698)

(declare-fun b!1359819 () Bool)

(declare-fun res!903676 () Bool)

(declare-fun e!771886 () Bool)

(assert (=> b!1359819 (=> (not res!903676) (not e!771886))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92585 0))(
  ( (array!92586 (arr!44730 (Array (_ BitVec 32) (_ BitVec 64))) (size!45281 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92585)

(assert (=> b!1359819 (= res!903676 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45281 a!3742))))))

(declare-fun b!1359820 () Bool)

(declare-fun res!903678 () Bool)

(assert (=> b!1359820 (=> (not res!903678) (not e!771886))))

(declare-datatypes ((List!31758 0))(
  ( (Nil!31755) (Cons!31754 (h!32972 (_ BitVec 64)) (t!46420 List!31758)) )
))
(declare-fun acc!759 () List!31758)

(declare-fun contains!9470 (List!31758 (_ BitVec 64)) Bool)

(assert (=> b!1359820 (= res!903678 (not (contains!9470 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359821 () Bool)

(declare-fun res!903677 () Bool)

(assert (=> b!1359821 (=> (not res!903677) (not e!771886))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1359821 (= res!903677 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45281 a!3742)))))

(declare-fun b!1359822 () Bool)

(declare-datatypes ((Unit!44630 0))(
  ( (Unit!44631) )
))
(declare-fun e!771884 () Unit!44630)

(declare-fun lt!599838 () Unit!44630)

(assert (=> b!1359822 (= e!771884 lt!599838)))

(declare-fun lt!599837 () Unit!44630)

(declare-fun lemmaListSubSeqRefl!0 (List!31758) Unit!44630)

(assert (=> b!1359822 (= lt!599837 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!829 (List!31758 List!31758) Bool)

(assert (=> b!1359822 (subseq!829 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92585 List!31758 List!31758 (_ BitVec 32)) Unit!44630)

(declare-fun $colon$colon!831 (List!31758 (_ BitVec 64)) List!31758)

(assert (=> b!1359822 (= lt!599838 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!831 acc!759 (select (arr!44730 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92585 (_ BitVec 32) List!31758) Bool)

(assert (=> b!1359822 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1359823 () Bool)

(declare-fun res!903679 () Bool)

(assert (=> b!1359823 (=> (not res!903679) (not e!771886))))

(assert (=> b!1359823 (= res!903679 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1359824 () Bool)

(assert (=> b!1359824 (= e!771886 false)))

(declare-fun lt!599836 () Unit!44630)

(assert (=> b!1359824 (= lt!599836 e!771884)))

(declare-fun c!127519 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1359824 (= c!127519 (validKeyInArray!0 (select (arr!44730 a!3742) from!3120)))))

(declare-fun res!903682 () Bool)

(assert (=> start!114698 (=> (not res!903682) (not e!771886))))

(assert (=> start!114698 (= res!903682 (and (bvslt (size!45281 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45281 a!3742))))))

(assert (=> start!114698 e!771886))

(assert (=> start!114698 true))

(declare-fun array_inv!34011 (array!92585) Bool)

(assert (=> start!114698 (array_inv!34011 a!3742)))

(declare-fun b!1359825 () Bool)

(declare-fun res!903680 () Bool)

(assert (=> b!1359825 (=> (not res!903680) (not e!771886))))

(declare-fun noDuplicate!2301 (List!31758) Bool)

(assert (=> b!1359825 (= res!903680 (noDuplicate!2301 acc!759))))

(declare-fun b!1359826 () Bool)

(declare-fun res!903684 () Bool)

(assert (=> b!1359826 (=> (not res!903684) (not e!771886))))

(assert (=> b!1359826 (= res!903684 (not (contains!9470 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359827 () Bool)

(declare-fun res!903683 () Bool)

(assert (=> b!1359827 (=> (not res!903683) (not e!771886))))

(assert (=> b!1359827 (= res!903683 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31755))))

(declare-fun b!1359828 () Bool)

(declare-fun Unit!44632 () Unit!44630)

(assert (=> b!1359828 (= e!771884 Unit!44632)))

(declare-fun b!1359829 () Bool)

(declare-fun res!903681 () Bool)

(assert (=> b!1359829 (=> (not res!903681) (not e!771886))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1359829 (= res!903681 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!114698 res!903682) b!1359825))

(assert (= (and b!1359825 res!903680) b!1359826))

(assert (= (and b!1359826 res!903684) b!1359820))

(assert (= (and b!1359820 res!903678) b!1359827))

(assert (= (and b!1359827 res!903683) b!1359823))

(assert (= (and b!1359823 res!903679) b!1359819))

(assert (= (and b!1359819 res!903676) b!1359829))

(assert (= (and b!1359829 res!903681) b!1359821))

(assert (= (and b!1359821 res!903677) b!1359824))

(assert (= (and b!1359824 c!127519) b!1359822))

(assert (= (and b!1359824 (not c!127519)) b!1359828))

(declare-fun m!1245687 () Bool)

(assert (=> b!1359822 m!1245687))

(declare-fun m!1245689 () Bool)

(assert (=> b!1359822 m!1245689))

(declare-fun m!1245691 () Bool)

(assert (=> b!1359822 m!1245691))

(declare-fun m!1245693 () Bool)

(assert (=> b!1359822 m!1245693))

(declare-fun m!1245695 () Bool)

(assert (=> b!1359822 m!1245695))

(assert (=> b!1359822 m!1245689))

(assert (=> b!1359822 m!1245691))

(declare-fun m!1245697 () Bool)

(assert (=> b!1359822 m!1245697))

(declare-fun m!1245699 () Bool)

(assert (=> b!1359820 m!1245699))

(declare-fun m!1245701 () Bool)

(assert (=> b!1359826 m!1245701))

(declare-fun m!1245703 () Bool)

(assert (=> start!114698 m!1245703))

(declare-fun m!1245705 () Bool)

(assert (=> b!1359823 m!1245705))

(declare-fun m!1245707 () Bool)

(assert (=> b!1359827 m!1245707))

(declare-fun m!1245709 () Bool)

(assert (=> b!1359829 m!1245709))

(declare-fun m!1245711 () Bool)

(assert (=> b!1359825 m!1245711))

(assert (=> b!1359824 m!1245689))

(assert (=> b!1359824 m!1245689))

(declare-fun m!1245713 () Bool)

(assert (=> b!1359824 m!1245713))

(push 1)

(assert (not b!1359824))

(assert (not b!1359826))

(assert (not start!114698))

(assert (not b!1359829))

(assert (not b!1359820))

(assert (not b!1359827))

(assert (not b!1359825))

(assert (not b!1359823))

(assert (not b!1359822))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

