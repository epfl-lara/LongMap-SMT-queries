; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62202 () Bool)

(assert start!62202)

(declare-fun b!696692 () Bool)

(declare-fun e!396086 () Bool)

(declare-fun e!396082 () Bool)

(assert (=> b!696692 (= e!396086 e!396082)))

(declare-fun res!460774 () Bool)

(assert (=> b!696692 (=> (not res!460774) (not e!396082))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!696692 (= res!460774 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!696693 () Bool)

(declare-fun res!460781 () Bool)

(declare-fun e!396088 () Bool)

(assert (=> b!696693 (=> (not res!460781) (not e!396088))))

(declare-datatypes ((array!39970 0))(
  ( (array!39971 (arr!19144 (Array (_ BitVec 32) (_ BitVec 64))) (size!19526 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39970)

(declare-datatypes ((List!13224 0))(
  ( (Nil!13221) (Cons!13220 (h!14265 (_ BitVec 64)) (t!19497 List!13224)) )
))
(declare-fun arrayNoDuplicates!0 (array!39970 (_ BitVec 32) List!13224) Bool)

(assert (=> b!696693 (= res!460781 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13221))))

(declare-fun b!696694 () Bool)

(declare-fun res!460770 () Bool)

(assert (=> b!696694 (=> (not res!460770) (not e!396088))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!696694 (= res!460770 (validKeyInArray!0 k!2843))))

(declare-fun b!696695 () Bool)

(declare-fun res!460784 () Bool)

(assert (=> b!696695 (=> (not res!460784) (not e!396088))))

(declare-fun acc!681 () List!13224)

(declare-fun contains!3746 (List!13224 (_ BitVec 64)) Bool)

(assert (=> b!696695 (= res!460784 (not (contains!3746 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696696 () Bool)

(declare-fun res!460782 () Bool)

(assert (=> b!696696 (=> (not res!460782) (not e!396088))))

(assert (=> b!696696 (= res!460782 e!396086)))

(declare-fun res!460780 () Bool)

(assert (=> b!696696 (=> res!460780 e!396086)))

(declare-fun e!396085 () Bool)

(assert (=> b!696696 (= res!460780 e!396085)))

(declare-fun res!460777 () Bool)

(assert (=> b!696696 (=> (not res!460777) (not e!396085))))

(assert (=> b!696696 (= res!460777 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!696697 () Bool)

(assert (=> b!696697 (= e!396082 (not (contains!3746 acc!681 k!2843)))))

(declare-fun b!696698 () Bool)

(declare-fun res!460789 () Bool)

(assert (=> b!696698 (=> (not res!460789) (not e!396088))))

(declare-fun arrayContainsKey!0 (array!39970 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!696698 (= res!460789 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!696699 () Bool)

(declare-fun res!460788 () Bool)

(assert (=> b!696699 (=> (not res!460788) (not e!396088))))

(assert (=> b!696699 (= res!460788 (not (validKeyInArray!0 (select (arr!19144 a!3626) from!3004))))))

(declare-fun b!696700 () Bool)

(declare-fun res!460778 () Bool)

(assert (=> b!696700 (=> (not res!460778) (not e!396088))))

(declare-fun e!396087 () Bool)

(assert (=> b!696700 (= res!460778 e!396087)))

(declare-fun res!460775 () Bool)

(assert (=> b!696700 (=> res!460775 e!396087)))

(declare-fun e!396084 () Bool)

(assert (=> b!696700 (= res!460775 e!396084)))

(declare-fun res!460787 () Bool)

(assert (=> b!696700 (=> (not res!460787) (not e!396084))))

(assert (=> b!696700 (= res!460787 (bvsgt from!3004 i!1382))))

(declare-fun res!460772 () Bool)

(assert (=> start!62202 (=> (not res!460772) (not e!396088))))

(assert (=> start!62202 (= res!460772 (and (bvslt (size!19526 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19526 a!3626))))))

(assert (=> start!62202 e!396088))

(assert (=> start!62202 true))

(declare-fun array_inv!15027 (array!39970) Bool)

(assert (=> start!62202 (array_inv!15027 a!3626)))

(declare-fun b!696701 () Bool)

(assert (=> b!696701 (= e!396088 false)))

(declare-fun lt!316881 () Bool)

(assert (=> b!696701 (= lt!316881 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!696702 () Bool)

(declare-fun res!460779 () Bool)

(assert (=> b!696702 (=> (not res!460779) (not e!396088))))

(assert (=> b!696702 (= res!460779 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19526 a!3626))))))

(declare-fun b!696703 () Bool)

(assert (=> b!696703 (= e!396085 (contains!3746 acc!681 k!2843))))

(declare-fun b!696704 () Bool)

(declare-fun e!396089 () Bool)

(assert (=> b!696704 (= e!396089 (not (contains!3746 acc!681 k!2843)))))

(declare-fun b!696705 () Bool)

(assert (=> b!696705 (= e!396084 (contains!3746 acc!681 k!2843))))

(declare-fun b!696706 () Bool)

(declare-fun res!460771 () Bool)

(assert (=> b!696706 (=> (not res!460771) (not e!396088))))

(assert (=> b!696706 (= res!460771 (not (contains!3746 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696707 () Bool)

(declare-fun res!460773 () Bool)

(assert (=> b!696707 (=> (not res!460773) (not e!396088))))

(declare-fun noDuplicate!1015 (List!13224) Bool)

(assert (=> b!696707 (= res!460773 (noDuplicate!1015 acc!681))))

(declare-fun b!696708 () Bool)

(declare-fun res!460785 () Bool)

(assert (=> b!696708 (=> (not res!460785) (not e!396088))))

(assert (=> b!696708 (= res!460785 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!696709 () Bool)

(declare-fun res!460783 () Bool)

(assert (=> b!696709 (=> (not res!460783) (not e!396088))))

(assert (=> b!696709 (= res!460783 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19526 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!696710 () Bool)

(assert (=> b!696710 (= e!396087 e!396089)))

(declare-fun res!460776 () Bool)

(assert (=> b!696710 (=> (not res!460776) (not e!396089))))

(assert (=> b!696710 (= res!460776 (bvsle from!3004 i!1382))))

(declare-fun b!696711 () Bool)

(declare-fun res!460786 () Bool)

(assert (=> b!696711 (=> (not res!460786) (not e!396088))))

(assert (=> b!696711 (= res!460786 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!62202 res!460772) b!696707))

(assert (= (and b!696707 res!460773) b!696695))

(assert (= (and b!696695 res!460784) b!696706))

(assert (= (and b!696706 res!460771) b!696700))

(assert (= (and b!696700 res!460787) b!696705))

(assert (= (and b!696700 (not res!460775)) b!696710))

(assert (= (and b!696710 res!460776) b!696704))

(assert (= (and b!696700 res!460778) b!696693))

(assert (= (and b!696693 res!460781) b!696711))

(assert (= (and b!696711 res!460786) b!696702))

(assert (= (and b!696702 res!460779) b!696694))

(assert (= (and b!696694 res!460770) b!696698))

(assert (= (and b!696698 res!460789) b!696709))

(assert (= (and b!696709 res!460783) b!696699))

(assert (= (and b!696699 res!460788) b!696708))

(assert (= (and b!696708 res!460785) b!696696))

(assert (= (and b!696696 res!460777) b!696703))

(assert (= (and b!696696 (not res!460780)) b!696692))

(assert (= (and b!696692 res!460774) b!696697))

(assert (= (and b!696696 res!460782) b!696701))

(declare-fun m!656877 () Bool)

(assert (=> b!696706 m!656877))

(declare-fun m!656879 () Bool)

(assert (=> b!696693 m!656879))

(declare-fun m!656881 () Bool)

(assert (=> b!696705 m!656881))

(declare-fun m!656883 () Bool)

(assert (=> b!696694 m!656883))

(assert (=> b!696697 m!656881))

(assert (=> b!696703 m!656881))

(declare-fun m!656885 () Bool)

(assert (=> b!696701 m!656885))

(declare-fun m!656887 () Bool)

(assert (=> b!696695 m!656887))

(declare-fun m!656889 () Bool)

(assert (=> start!62202 m!656889))

(declare-fun m!656891 () Bool)

(assert (=> b!696698 m!656891))

(declare-fun m!656893 () Bool)

(assert (=> b!696711 m!656893))

(declare-fun m!656895 () Bool)

(assert (=> b!696707 m!656895))

(assert (=> b!696704 m!656881))

(declare-fun m!656897 () Bool)

(assert (=> b!696699 m!656897))

(assert (=> b!696699 m!656897))

(declare-fun m!656899 () Bool)

(assert (=> b!696699 m!656899))

(push 1)

(assert (not b!696705))

(assert (not b!696706))

(assert (not start!62202))

(assert (not b!696695))

(assert (not b!696704))

(assert (not b!696698))

(assert (not b!696693))

(assert (not b!696697))

(assert (not b!696699))

(assert (not b!696711))

(assert (not b!696701))

(assert (not b!696707))

(assert (not b!696703))

(assert (not b!696694))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

