; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114222 () Bool)

(assert start!114222)

(declare-fun b!1356898 () Bool)

(declare-fun res!901660 () Bool)

(declare-fun e!770209 () Bool)

(assert (=> b!1356898 (=> (not res!901660) (not e!770209))))

(declare-datatypes ((array!92404 0))(
  ( (array!92405 (arr!44650 (Array (_ BitVec 32) (_ BitVec 64))) (size!45200 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92404)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356898 (= res!901660 (validKeyInArray!0 (select (arr!44650 a!3742) from!3120)))))

(declare-fun b!1356899 () Bool)

(declare-fun res!901657 () Bool)

(assert (=> b!1356899 (=> (not res!901657) (not e!770209))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1356899 (= res!901657 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45200 a!3742))))))

(declare-fun b!1356900 () Bool)

(declare-fun res!901662 () Bool)

(assert (=> b!1356900 (=> (not res!901662) (not e!770209))))

(declare-datatypes ((List!31691 0))(
  ( (Nil!31688) (Cons!31687 (h!32896 (_ BitVec 64)) (t!46349 List!31691)) )
))
(declare-fun acc!759 () List!31691)

(declare-fun noDuplicate!2257 (List!31691) Bool)

(assert (=> b!1356900 (= res!901662 (noDuplicate!2257 acc!759))))

(declare-fun res!901661 () Bool)

(assert (=> start!114222 (=> (not res!901661) (not e!770209))))

(assert (=> start!114222 (= res!901661 (and (bvslt (size!45200 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45200 a!3742))))))

(assert (=> start!114222 e!770209))

(assert (=> start!114222 true))

(declare-fun array_inv!33678 (array!92404) Bool)

(assert (=> start!114222 (array_inv!33678 a!3742)))

(declare-fun b!1356901 () Bool)

(declare-fun res!901659 () Bool)

(assert (=> b!1356901 (=> (not res!901659) (not e!770209))))

(declare-fun arrayNoDuplicates!0 (array!92404 (_ BitVec 32) List!31691) Bool)

(assert (=> b!1356901 (= res!901659 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356902 () Bool)

(assert (=> b!1356902 (= e!770209 (not true))))

(declare-fun subseq!802 (List!31691 List!31691) Bool)

(assert (=> b!1356902 (subseq!802 acc!759 acc!759)))

(declare-datatypes ((Unit!44635 0))(
  ( (Unit!44636) )
))
(declare-fun lt!599098 () Unit!44635)

(declare-fun lemmaListSubSeqRefl!0 (List!31691) Unit!44635)

(assert (=> b!1356902 (= lt!599098 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1356903 () Bool)

(declare-fun res!901654 () Bool)

(assert (=> b!1356903 (=> (not res!901654) (not e!770209))))

(assert (=> b!1356903 (= res!901654 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45200 a!3742)))))

(declare-fun b!1356904 () Bool)

(declare-fun res!901658 () Bool)

(assert (=> b!1356904 (=> (not res!901658) (not e!770209))))

(declare-fun contains!9400 (List!31691 (_ BitVec 64)) Bool)

(assert (=> b!1356904 (= res!901658 (not (contains!9400 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356905 () Bool)

(declare-fun res!901663 () Bool)

(assert (=> b!1356905 (=> (not res!901663) (not e!770209))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1356905 (= res!901663 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356906 () Bool)

(declare-fun res!901655 () Bool)

(assert (=> b!1356906 (=> (not res!901655) (not e!770209))))

(assert (=> b!1356906 (= res!901655 (not (contains!9400 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356907 () Bool)

(declare-fun res!901656 () Bool)

(assert (=> b!1356907 (=> (not res!901656) (not e!770209))))

(assert (=> b!1356907 (= res!901656 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31688))))

(assert (= (and start!114222 res!901661) b!1356900))

(assert (= (and b!1356900 res!901662) b!1356906))

(assert (= (and b!1356906 res!901655) b!1356904))

(assert (= (and b!1356904 res!901658) b!1356907))

(assert (= (and b!1356907 res!901656) b!1356901))

(assert (= (and b!1356901 res!901659) b!1356899))

(assert (= (and b!1356899 res!901657) b!1356905))

(assert (= (and b!1356905 res!901663) b!1356903))

(assert (= (and b!1356903 res!901654) b!1356898))

(assert (= (and b!1356898 res!901660) b!1356902))

(declare-fun m!1242777 () Bool)

(assert (=> b!1356898 m!1242777))

(assert (=> b!1356898 m!1242777))

(declare-fun m!1242779 () Bool)

(assert (=> b!1356898 m!1242779))

(declare-fun m!1242781 () Bool)

(assert (=> b!1356905 m!1242781))

(declare-fun m!1242783 () Bool)

(assert (=> b!1356907 m!1242783))

(declare-fun m!1242785 () Bool)

(assert (=> start!114222 m!1242785))

(declare-fun m!1242787 () Bool)

(assert (=> b!1356902 m!1242787))

(declare-fun m!1242789 () Bool)

(assert (=> b!1356902 m!1242789))

(declare-fun m!1242791 () Bool)

(assert (=> b!1356904 m!1242791))

(declare-fun m!1242793 () Bool)

(assert (=> b!1356901 m!1242793))

(declare-fun m!1242795 () Bool)

(assert (=> b!1356900 m!1242795))

(declare-fun m!1242797 () Bool)

(assert (=> b!1356906 m!1242797))

(push 1)

(assert (not b!1356906))

(assert (not b!1356907))

(assert (not b!1356905))

(assert (not b!1356898))

(assert (not b!1356901))

(assert (not b!1356904))

(assert (not start!114222))

(assert (not b!1356902))

(assert (not b!1356900))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

