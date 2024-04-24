; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114214 () Bool)

(assert start!114214)

(declare-fun b!1353785 () Bool)

(declare-fun res!898338 () Bool)

(declare-fun e!769666 () Bool)

(assert (=> b!1353785 (=> (not res!898338) (not e!769666))))

(declare-datatypes ((List!31615 0))(
  ( (Nil!31612) (Cons!31611 (h!32829 (_ BitVec 64)) (t!46265 List!31615)) )
))
(declare-fun acc!759 () List!31615)

(declare-fun contains!9327 (List!31615 (_ BitVec 64)) Bool)

(assert (=> b!1353785 (= res!898338 (not (contains!9327 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353786 () Bool)

(declare-fun e!769669 () Bool)

(assert (=> b!1353786 (= e!769666 e!769669)))

(declare-fun res!898333 () Bool)

(assert (=> b!1353786 (=> (not res!898333) (not e!769669))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1353786 (= res!898333 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44282 0))(
  ( (Unit!44283) )
))
(declare-fun lt!598035 () Unit!44282)

(declare-fun e!769668 () Unit!44282)

(assert (=> b!1353786 (= lt!598035 e!769668)))

(declare-fun c!127174 () Bool)

(declare-datatypes ((array!92287 0))(
  ( (array!92288 (arr!44587 (Array (_ BitVec 32) (_ BitVec 64))) (size!45138 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92287)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353786 (= c!127174 (validKeyInArray!0 (select (arr!44587 a!3742) from!3120)))))

(declare-fun b!1353787 () Bool)

(declare-fun res!898335 () Bool)

(assert (=> b!1353787 (=> (not res!898335) (not e!769666))))

(declare-fun noDuplicate!2158 (List!31615) Bool)

(assert (=> b!1353787 (= res!898335 (noDuplicate!2158 acc!759))))

(declare-fun b!1353788 () Bool)

(declare-fun lt!598036 () Unit!44282)

(assert (=> b!1353788 (= e!769668 lt!598036)))

(declare-fun lt!598037 () Unit!44282)

(declare-fun lemmaListSubSeqRefl!0 (List!31615) Unit!44282)

(assert (=> b!1353788 (= lt!598037 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!704 (List!31615 List!31615) Bool)

(assert (=> b!1353788 (subseq!704 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92287 List!31615 List!31615 (_ BitVec 32)) Unit!44282)

(declare-fun $colon$colon!718 (List!31615 (_ BitVec 64)) List!31615)

(assert (=> b!1353788 (= lt!598036 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!718 acc!759 (select (arr!44587 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92287 (_ BitVec 32) List!31615) Bool)

(assert (=> b!1353788 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun res!898340 () Bool)

(assert (=> start!114214 (=> (not res!898340) (not e!769666))))

(assert (=> start!114214 (= res!898340 (and (bvslt (size!45138 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45138 a!3742))))))

(assert (=> start!114214 e!769666))

(assert (=> start!114214 true))

(declare-fun array_inv!33868 (array!92287) Bool)

(assert (=> start!114214 (array_inv!33868 a!3742)))

(declare-fun b!1353789 () Bool)

(declare-fun res!898339 () Bool)

(assert (=> b!1353789 (=> (not res!898339) (not e!769666))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1353789 (= res!898339 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353790 () Bool)

(declare-fun res!898337 () Bool)

(assert (=> b!1353790 (=> (not res!898337) (not e!769666))))

(assert (=> b!1353790 (= res!898337 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31612))))

(declare-fun b!1353791 () Bool)

(declare-fun res!898334 () Bool)

(assert (=> b!1353791 (=> (not res!898334) (not e!769666))))

(assert (=> b!1353791 (= res!898334 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353792 () Bool)

(declare-fun Unit!44284 () Unit!44282)

(assert (=> b!1353792 (= e!769668 Unit!44284)))

(declare-fun b!1353793 () Bool)

(declare-fun res!898332 () Bool)

(assert (=> b!1353793 (=> (not res!898332) (not e!769666))))

(assert (=> b!1353793 (= res!898332 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45138 a!3742)))))

(declare-fun b!1353794 () Bool)

(declare-fun res!898336 () Bool)

(assert (=> b!1353794 (=> (not res!898336) (not e!769666))))

(assert (=> b!1353794 (= res!898336 (not (contains!9327 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353795 () Bool)

(assert (=> b!1353795 (= e!769669 false)))

(declare-fun lt!598038 () Bool)

(assert (=> b!1353795 (= lt!598038 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1353796 () Bool)

(declare-fun res!898341 () Bool)

(assert (=> b!1353796 (=> (not res!898341) (not e!769666))))

(assert (=> b!1353796 (= res!898341 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45138 a!3742))))))

(assert (= (and start!114214 res!898340) b!1353787))

(assert (= (and b!1353787 res!898335) b!1353785))

(assert (= (and b!1353785 res!898338) b!1353794))

(assert (= (and b!1353794 res!898336) b!1353790))

(assert (= (and b!1353790 res!898337) b!1353791))

(assert (= (and b!1353791 res!898334) b!1353796))

(assert (= (and b!1353796 res!898341) b!1353789))

(assert (= (and b!1353789 res!898339) b!1353793))

(assert (= (and b!1353793 res!898332) b!1353786))

(assert (= (and b!1353786 c!127174) b!1353788))

(assert (= (and b!1353786 (not c!127174)) b!1353792))

(assert (= (and b!1353786 res!898333) b!1353795))

(declare-fun m!1240885 () Bool)

(assert (=> b!1353786 m!1240885))

(assert (=> b!1353786 m!1240885))

(declare-fun m!1240887 () Bool)

(assert (=> b!1353786 m!1240887))

(declare-fun m!1240889 () Bool)

(assert (=> b!1353791 m!1240889))

(declare-fun m!1240891 () Bool)

(assert (=> b!1353785 m!1240891))

(declare-fun m!1240893 () Bool)

(assert (=> b!1353788 m!1240893))

(assert (=> b!1353788 m!1240885))

(declare-fun m!1240895 () Bool)

(assert (=> b!1353788 m!1240895))

(declare-fun m!1240897 () Bool)

(assert (=> b!1353788 m!1240897))

(declare-fun m!1240899 () Bool)

(assert (=> b!1353788 m!1240899))

(assert (=> b!1353788 m!1240885))

(assert (=> b!1353788 m!1240895))

(declare-fun m!1240901 () Bool)

(assert (=> b!1353788 m!1240901))

(declare-fun m!1240903 () Bool)

(assert (=> b!1353794 m!1240903))

(declare-fun m!1240905 () Bool)

(assert (=> start!114214 m!1240905))

(declare-fun m!1240907 () Bool)

(assert (=> b!1353790 m!1240907))

(declare-fun m!1240909 () Bool)

(assert (=> b!1353789 m!1240909))

(assert (=> b!1353795 m!1240899))

(declare-fun m!1240911 () Bool)

(assert (=> b!1353787 m!1240911))

(check-sat (not b!1353787) (not b!1353790) (not b!1353794) (not b!1353786) (not b!1353785) (not b!1353791) (not b!1353788) (not b!1353795) (not b!1353789) (not start!114214))
(check-sat)
