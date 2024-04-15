; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59818 () Bool)

(assert start!59818)

(declare-fun b!660878 () Bool)

(declare-fun res!429110 () Bool)

(declare-fun e!379659 () Bool)

(assert (=> b!660878 (=> (not res!429110) (not e!379659))))

(declare-datatypes ((array!38876 0))(
  ( (array!38877 (arr!18630 (Array (_ BitVec 32) (_ BitVec 64))) (size!18995 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38876)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38876 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!660878 (= res!429110 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!660879 () Bool)

(declare-fun res!429107 () Bool)

(assert (=> b!660879 (=> (not res!429107) (not e!379659))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660879 (= res!429107 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!18995 a!3626))))))

(declare-fun b!660880 () Bool)

(declare-fun res!429103 () Bool)

(assert (=> b!660880 (=> (not res!429103) (not e!379659))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12710 0))(
  ( (Nil!12707) (Cons!12706 (h!13751 (_ BitVec 64)) (t!18929 List!12710)) )
))
(declare-fun acc!681 () List!12710)

(declare-fun arrayNoDuplicates!0 (array!38876 (_ BitVec 32) List!12710) Bool)

(assert (=> b!660880 (= res!429103 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660881 () Bool)

(declare-fun res!429109 () Bool)

(assert (=> b!660881 (=> (not res!429109) (not e!379659))))

(declare-fun contains!3232 (List!12710 (_ BitVec 64)) Bool)

(assert (=> b!660881 (= res!429109 (not (contains!3232 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660882 () Bool)

(declare-fun res!429106 () Bool)

(assert (=> b!660882 (=> (not res!429106) (not e!379659))))

(declare-fun e!379661 () Bool)

(assert (=> b!660882 (= res!429106 e!379661)))

(declare-fun res!429102 () Bool)

(assert (=> b!660882 (=> res!429102 e!379661)))

(declare-fun e!379657 () Bool)

(assert (=> b!660882 (= res!429102 e!379657)))

(declare-fun res!429113 () Bool)

(assert (=> b!660882 (=> (not res!429113) (not e!379657))))

(assert (=> b!660882 (= res!429113 (bvsgt from!3004 i!1382))))

(declare-fun b!660883 () Bool)

(declare-fun res!429104 () Bool)

(assert (=> b!660883 (=> (not res!429104) (not e!379659))))

(assert (=> b!660883 (= res!429104 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12707))))

(declare-fun b!660884 () Bool)

(declare-fun res!429111 () Bool)

(assert (=> b!660884 (=> (not res!429111) (not e!379659))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!660884 (= res!429111 (validKeyInArray!0 k!2843))))

(declare-fun b!660885 () Bool)

(declare-fun e!379660 () Bool)

(assert (=> b!660885 (= e!379660 (not (contains!3232 acc!681 k!2843)))))

(declare-fun b!660886 () Bool)

(assert (=> b!660886 (= e!379659 (not true))))

(assert (=> b!660886 (arrayContainsKey!0 (array!38877 (store (arr!18630 a!3626) i!1382 k!2843) (size!18995 a!3626)) k!2843 from!3004)))

(declare-fun b!660887 () Bool)

(declare-fun res!429105 () Bool)

(assert (=> b!660887 (=> (not res!429105) (not e!379659))))

(assert (=> b!660887 (= res!429105 (not (contains!3232 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660888 () Bool)

(assert (=> b!660888 (= e!379661 e!379660)))

(declare-fun res!429112 () Bool)

(assert (=> b!660888 (=> (not res!429112) (not e!379660))))

(assert (=> b!660888 (= res!429112 (bvsle from!3004 i!1382))))

(declare-fun b!660889 () Bool)

(declare-fun res!429115 () Bool)

(assert (=> b!660889 (=> (not res!429115) (not e!379659))))

(assert (=> b!660889 (= res!429115 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!18995 a!3626)) (= from!3004 i!1382)))))

(declare-fun res!429108 () Bool)

(assert (=> start!59818 (=> (not res!429108) (not e!379659))))

(assert (=> start!59818 (= res!429108 (and (bvslt (size!18995 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18995 a!3626))))))

(assert (=> start!59818 e!379659))

(assert (=> start!59818 true))

(declare-fun array_inv!14513 (array!38876) Bool)

(assert (=> start!59818 (array_inv!14513 a!3626)))

(declare-fun b!660890 () Bool)

(assert (=> b!660890 (= e!379657 (contains!3232 acc!681 k!2843))))

(declare-fun b!660891 () Bool)

(declare-fun res!429114 () Bool)

(assert (=> b!660891 (=> (not res!429114) (not e!379659))))

(declare-fun noDuplicate!501 (List!12710) Bool)

(assert (=> b!660891 (= res!429114 (noDuplicate!501 acc!681))))

(assert (= (and start!59818 res!429108) b!660891))

(assert (= (and b!660891 res!429114) b!660881))

(assert (= (and b!660881 res!429109) b!660887))

(assert (= (and b!660887 res!429105) b!660882))

(assert (= (and b!660882 res!429113) b!660890))

(assert (= (and b!660882 (not res!429102)) b!660888))

(assert (= (and b!660888 res!429112) b!660885))

(assert (= (and b!660882 res!429106) b!660883))

(assert (= (and b!660883 res!429104) b!660880))

(assert (= (and b!660880 res!429103) b!660879))

(assert (= (and b!660879 res!429107) b!660884))

(assert (= (and b!660884 res!429111) b!660878))

(assert (= (and b!660878 res!429110) b!660889))

(assert (= (and b!660889 res!429115) b!660886))

(declare-fun m!632707 () Bool)

(assert (=> b!660891 m!632707))

(declare-fun m!632709 () Bool)

(assert (=> b!660890 m!632709))

(declare-fun m!632711 () Bool)

(assert (=> b!660883 m!632711))

(declare-fun m!632713 () Bool)

(assert (=> b!660886 m!632713))

(declare-fun m!632715 () Bool)

(assert (=> b!660886 m!632715))

(declare-fun m!632717 () Bool)

(assert (=> b!660878 m!632717))

(declare-fun m!632719 () Bool)

(assert (=> b!660884 m!632719))

(declare-fun m!632721 () Bool)

(assert (=> start!59818 m!632721))

(declare-fun m!632723 () Bool)

(assert (=> b!660880 m!632723))

(declare-fun m!632725 () Bool)

(assert (=> b!660887 m!632725))

(assert (=> b!660885 m!632709))

(declare-fun m!632727 () Bool)

(assert (=> b!660881 m!632727))

(push 1)

(assert (not start!59818))

(assert (not b!660878))

(assert (not b!660887))

(assert (not b!660880))

(assert (not b!660883))

(assert (not b!660886))

(assert (not b!660890))

(assert (not b!660884))

(assert (not b!660881))

(assert (not b!660891))

(assert (not b!660885))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

