; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114164 () Bool)

(assert start!114164)

(declare-fun b!1352855 () Bool)

(declare-fun res!897545 () Bool)

(declare-fun e!769378 () Bool)

(assert (=> b!1352855 (=> (not res!897545) (not e!769378))))

(declare-datatypes ((List!31590 0))(
  ( (Nil!31587) (Cons!31586 (h!32804 (_ BitVec 64)) (t!46240 List!31590)) )
))
(declare-fun acc!759 () List!31590)

(declare-fun noDuplicate!2133 (List!31590) Bool)

(assert (=> b!1352855 (= res!897545 (noDuplicate!2133 acc!759))))

(declare-fun b!1352856 () Bool)

(declare-fun res!897544 () Bool)

(declare-fun e!769377 () Bool)

(assert (=> b!1352856 (=> res!897544 e!769377)))

(declare-fun lt!597738 () List!31590)

(declare-fun contains!9302 (List!31590 (_ BitVec 64)) Bool)

(assert (=> b!1352856 (= res!897544 (contains!9302 lt!597738 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1352857 () Bool)

(declare-fun res!897538 () Bool)

(assert (=> b!1352857 (=> res!897538 e!769377)))

(assert (=> b!1352857 (= res!897538 (not (noDuplicate!2133 lt!597738)))))

(declare-fun b!1352858 () Bool)

(declare-fun res!897539 () Bool)

(assert (=> b!1352858 (=> (not res!897539) (not e!769378))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92237 0))(
  ( (array!92238 (arr!44562 (Array (_ BitVec 32) (_ BitVec 64))) (size!45113 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92237)

(assert (=> b!1352858 (= res!897539 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45113 a!3742))))))

(declare-fun b!1352859 () Bool)

(declare-fun res!897540 () Bool)

(assert (=> b!1352859 (=> (not res!897540) (not e!769378))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92237 (_ BitVec 32) List!31590) Bool)

(assert (=> b!1352859 (= res!897540 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352860 () Bool)

(declare-fun res!897542 () Bool)

(assert (=> b!1352860 (=> res!897542 e!769377)))

(assert (=> b!1352860 (= res!897542 (contains!9302 lt!597738 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1352861 () Bool)

(assert (=> b!1352861 (= e!769378 (not e!769377))))

(declare-fun res!897537 () Bool)

(assert (=> b!1352861 (=> res!897537 e!769377)))

(assert (=> b!1352861 (= res!897537 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!693 (List!31590 (_ BitVec 64)) List!31590)

(assert (=> b!1352861 (= lt!597738 ($colon$colon!693 acc!759 (select (arr!44562 a!3742) from!3120)))))

(declare-fun subseq!679 (List!31590 List!31590) Bool)

(assert (=> b!1352861 (subseq!679 acc!759 acc!759)))

(declare-datatypes ((Unit!44211 0))(
  ( (Unit!44212) )
))
(declare-fun lt!597737 () Unit!44211)

(declare-fun lemmaListSubSeqRefl!0 (List!31590) Unit!44211)

(assert (=> b!1352861 (= lt!597737 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun res!897534 () Bool)

(assert (=> start!114164 (=> (not res!897534) (not e!769378))))

(assert (=> start!114164 (= res!897534 (and (bvslt (size!45113 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45113 a!3742))))))

(assert (=> start!114164 e!769378))

(assert (=> start!114164 true))

(declare-fun array_inv!33843 (array!92237) Bool)

(assert (=> start!114164 (array_inv!33843 a!3742)))

(declare-fun b!1352862 () Bool)

(declare-fun res!897532 () Bool)

(assert (=> b!1352862 (=> (not res!897532) (not e!769378))))

(assert (=> b!1352862 (= res!897532 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45113 a!3742)))))

(declare-fun b!1352863 () Bool)

(declare-fun res!897533 () Bool)

(assert (=> b!1352863 (=> (not res!897533) (not e!769378))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352863 (= res!897533 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352864 () Bool)

(assert (=> b!1352864 (= e!769377 true)))

(declare-fun lt!597736 () Bool)

(assert (=> b!1352864 (= lt!597736 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597738))))

(declare-fun lt!597735 () Unit!44211)

(declare-fun noDuplicateSubseq!130 (List!31590 List!31590) Unit!44211)

(assert (=> b!1352864 (= lt!597735 (noDuplicateSubseq!130 acc!759 lt!597738))))

(declare-fun b!1352865 () Bool)

(declare-fun res!897535 () Bool)

(assert (=> b!1352865 (=> res!897535 e!769377)))

(assert (=> b!1352865 (= res!897535 (not (subseq!679 acc!759 lt!597738)))))

(declare-fun b!1352866 () Bool)

(declare-fun res!897536 () Bool)

(assert (=> b!1352866 (=> (not res!897536) (not e!769378))))

(assert (=> b!1352866 (= res!897536 (validKeyInArray!0 (select (arr!44562 a!3742) from!3120)))))

(declare-fun b!1352867 () Bool)

(declare-fun res!897541 () Bool)

(assert (=> b!1352867 (=> (not res!897541) (not e!769378))))

(assert (=> b!1352867 (= res!897541 (not (contains!9302 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352868 () Bool)

(declare-fun res!897543 () Bool)

(assert (=> b!1352868 (=> (not res!897543) (not e!769378))))

(assert (=> b!1352868 (= res!897543 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31587))))

(declare-fun b!1352869 () Bool)

(declare-fun res!897546 () Bool)

(assert (=> b!1352869 (=> (not res!897546) (not e!769378))))

(assert (=> b!1352869 (= res!897546 (not (contains!9302 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114164 res!897534) b!1352855))

(assert (= (and b!1352855 res!897545) b!1352869))

(assert (= (and b!1352869 res!897546) b!1352867))

(assert (= (and b!1352867 res!897541) b!1352868))

(assert (= (and b!1352868 res!897543) b!1352859))

(assert (= (and b!1352859 res!897540) b!1352858))

(assert (= (and b!1352858 res!897539) b!1352863))

(assert (= (and b!1352863 res!897533) b!1352862))

(assert (= (and b!1352862 res!897532) b!1352866))

(assert (= (and b!1352866 res!897536) b!1352861))

(assert (= (and b!1352861 (not res!897537)) b!1352857))

(assert (= (and b!1352857 (not res!897538)) b!1352860))

(assert (= (and b!1352860 (not res!897542)) b!1352856))

(assert (= (and b!1352856 (not res!897544)) b!1352865))

(assert (= (and b!1352865 (not res!897535)) b!1352864))

(declare-fun m!1240153 () Bool)

(assert (=> b!1352863 m!1240153))

(declare-fun m!1240155 () Bool)

(assert (=> b!1352857 m!1240155))

(declare-fun m!1240157 () Bool)

(assert (=> b!1352865 m!1240157))

(declare-fun m!1240159 () Bool)

(assert (=> b!1352868 m!1240159))

(declare-fun m!1240161 () Bool)

(assert (=> b!1352859 m!1240161))

(declare-fun m!1240163 () Bool)

(assert (=> b!1352861 m!1240163))

(assert (=> b!1352861 m!1240163))

(declare-fun m!1240165 () Bool)

(assert (=> b!1352861 m!1240165))

(declare-fun m!1240167 () Bool)

(assert (=> b!1352861 m!1240167))

(declare-fun m!1240169 () Bool)

(assert (=> b!1352861 m!1240169))

(declare-fun m!1240171 () Bool)

(assert (=> b!1352856 m!1240171))

(assert (=> b!1352866 m!1240163))

(assert (=> b!1352866 m!1240163))

(declare-fun m!1240173 () Bool)

(assert (=> b!1352866 m!1240173))

(declare-fun m!1240175 () Bool)

(assert (=> b!1352867 m!1240175))

(declare-fun m!1240177 () Bool)

(assert (=> b!1352860 m!1240177))

(declare-fun m!1240179 () Bool)

(assert (=> b!1352869 m!1240179))

(declare-fun m!1240181 () Bool)

(assert (=> start!114164 m!1240181))

(declare-fun m!1240183 () Bool)

(assert (=> b!1352864 m!1240183))

(declare-fun m!1240185 () Bool)

(assert (=> b!1352864 m!1240185))

(declare-fun m!1240187 () Bool)

(assert (=> b!1352855 m!1240187))

(push 1)

(assert (not b!1352857))

(assert (not b!1352861))

(assert (not b!1352860))

(assert (not b!1352869))

(assert (not b!1352855))

(assert (not b!1352868))

(assert (not b!1352865))

(assert (not b!1352867))

(assert (not b!1352859))

(assert (not start!114164))

(assert (not b!1352863))

(assert (not b!1352866))

(assert (not b!1352864))

(assert (not b!1352856))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

