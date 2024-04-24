; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114134 () Bool)

(assert start!114134)

(declare-fun b!1352180 () Bool)

(declare-fun res!896863 () Bool)

(declare-fun e!769242 () Bool)

(assert (=> b!1352180 (=> (not res!896863) (not e!769242))))

(declare-datatypes ((array!92207 0))(
  ( (array!92208 (arr!44547 (Array (_ BitVec 32) (_ BitVec 64))) (size!45098 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92207)

(declare-datatypes ((List!31575 0))(
  ( (Nil!31572) (Cons!31571 (h!32789 (_ BitVec 64)) (t!46225 List!31575)) )
))
(declare-fun arrayNoDuplicates!0 (array!92207 (_ BitVec 32) List!31575) Bool)

(assert (=> b!1352180 (= res!896863 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31572))))

(declare-fun b!1352181 () Bool)

(declare-fun res!896868 () Bool)

(assert (=> b!1352181 (=> (not res!896868) (not e!769242))))

(declare-fun acc!759 () List!31575)

(declare-fun noDuplicate!2118 (List!31575) Bool)

(assert (=> b!1352181 (= res!896868 (noDuplicate!2118 acc!759))))

(declare-fun b!1352182 () Bool)

(declare-fun res!896859 () Bool)

(declare-fun e!769243 () Bool)

(assert (=> b!1352182 (=> res!896859 e!769243)))

(declare-fun lt!597558 () List!31575)

(declare-fun contains!9287 (List!31575 (_ BitVec 64)) Bool)

(assert (=> b!1352182 (= res!896859 (contains!9287 lt!597558 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1352183 () Bool)

(declare-fun res!896866 () Bool)

(assert (=> b!1352183 (=> res!896866 e!769243)))

(assert (=> b!1352183 (= res!896866 (contains!9287 lt!597558 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1352184 () Bool)

(declare-fun res!896860 () Bool)

(assert (=> b!1352184 (=> (not res!896860) (not e!769242))))

(assert (=> b!1352184 (= res!896860 (not (contains!9287 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352185 () Bool)

(declare-fun res!896871 () Bool)

(assert (=> b!1352185 (=> (not res!896871) (not e!769242))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352185 (= res!896871 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45098 a!3742))))))

(declare-fun res!896862 () Bool)

(assert (=> start!114134 (=> (not res!896862) (not e!769242))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114134 (= res!896862 (and (bvslt (size!45098 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45098 a!3742))))))

(assert (=> start!114134 e!769242))

(assert (=> start!114134 true))

(declare-fun array_inv!33828 (array!92207) Bool)

(assert (=> start!114134 (array_inv!33828 a!3742)))

(declare-fun b!1352186 () Bool)

(declare-fun res!896858 () Bool)

(assert (=> b!1352186 (=> (not res!896858) (not e!769242))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352186 (= res!896858 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352187 () Bool)

(declare-fun res!896864 () Bool)

(assert (=> b!1352187 (=> res!896864 e!769243)))

(declare-fun subseq!664 (List!31575 List!31575) Bool)

(assert (=> b!1352187 (= res!896864 (not (subseq!664 acc!759 lt!597558)))))

(declare-fun b!1352188 () Bool)

(declare-fun res!896865 () Bool)

(assert (=> b!1352188 (=> (not res!896865) (not e!769242))))

(assert (=> b!1352188 (= res!896865 (not (contains!9287 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352189 () Bool)

(declare-fun res!896861 () Bool)

(assert (=> b!1352189 (=> res!896861 e!769243)))

(assert (=> b!1352189 (= res!896861 (not (noDuplicate!2118 lt!597558)))))

(declare-fun b!1352190 () Bool)

(declare-fun res!896867 () Bool)

(assert (=> b!1352190 (=> (not res!896867) (not e!769242))))

(assert (=> b!1352190 (= res!896867 (validKeyInArray!0 (select (arr!44547 a!3742) from!3120)))))

(declare-fun b!1352191 () Bool)

(declare-fun res!896870 () Bool)

(assert (=> b!1352191 (=> (not res!896870) (not e!769242))))

(assert (=> b!1352191 (= res!896870 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45098 a!3742)))))

(declare-fun b!1352192 () Bool)

(declare-fun res!896869 () Bool)

(assert (=> b!1352192 (=> (not res!896869) (not e!769242))))

(assert (=> b!1352192 (= res!896869 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352193 () Bool)

(assert (=> b!1352193 (= e!769242 (not e!769243))))

(declare-fun res!896857 () Bool)

(assert (=> b!1352193 (=> res!896857 e!769243)))

(assert (=> b!1352193 (= res!896857 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!678 (List!31575 (_ BitVec 64)) List!31575)

(assert (=> b!1352193 (= lt!597558 ($colon$colon!678 acc!759 (select (arr!44547 a!3742) from!3120)))))

(assert (=> b!1352193 (subseq!664 acc!759 acc!759)))

(declare-datatypes ((Unit!44181 0))(
  ( (Unit!44182) )
))
(declare-fun lt!597557 () Unit!44181)

(declare-fun lemmaListSubSeqRefl!0 (List!31575) Unit!44181)

(assert (=> b!1352193 (= lt!597557 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1352194 () Bool)

(assert (=> b!1352194 (= e!769243 true)))

(declare-fun lt!597555 () Bool)

(assert (=> b!1352194 (= lt!597555 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597558))))

(declare-fun lt!597556 () Unit!44181)

(declare-fun noDuplicateSubseq!115 (List!31575 List!31575) Unit!44181)

(assert (=> b!1352194 (= lt!597556 (noDuplicateSubseq!115 acc!759 lt!597558))))

(assert (= (and start!114134 res!896862) b!1352181))

(assert (= (and b!1352181 res!896868) b!1352184))

(assert (= (and b!1352184 res!896860) b!1352188))

(assert (= (and b!1352188 res!896865) b!1352180))

(assert (= (and b!1352180 res!896863) b!1352192))

(assert (= (and b!1352192 res!896869) b!1352185))

(assert (= (and b!1352185 res!896871) b!1352186))

(assert (= (and b!1352186 res!896858) b!1352191))

(assert (= (and b!1352191 res!896870) b!1352190))

(assert (= (and b!1352190 res!896867) b!1352193))

(assert (= (and b!1352193 (not res!896857)) b!1352189))

(assert (= (and b!1352189 (not res!896861)) b!1352182))

(assert (= (and b!1352182 (not res!896859)) b!1352183))

(assert (= (and b!1352183 (not res!896866)) b!1352187))

(assert (= (and b!1352187 (not res!896864)) b!1352194))

(declare-fun m!1239613 () Bool)

(assert (=> b!1352193 m!1239613))

(assert (=> b!1352193 m!1239613))

(declare-fun m!1239615 () Bool)

(assert (=> b!1352193 m!1239615))

(declare-fun m!1239617 () Bool)

(assert (=> b!1352193 m!1239617))

(declare-fun m!1239619 () Bool)

(assert (=> b!1352193 m!1239619))

(declare-fun m!1239621 () Bool)

(assert (=> start!114134 m!1239621))

(declare-fun m!1239623 () Bool)

(assert (=> b!1352184 m!1239623))

(declare-fun m!1239625 () Bool)

(assert (=> b!1352180 m!1239625))

(assert (=> b!1352190 m!1239613))

(assert (=> b!1352190 m!1239613))

(declare-fun m!1239627 () Bool)

(assert (=> b!1352190 m!1239627))

(declare-fun m!1239629 () Bool)

(assert (=> b!1352183 m!1239629))

(declare-fun m!1239631 () Bool)

(assert (=> b!1352188 m!1239631))

(declare-fun m!1239633 () Bool)

(assert (=> b!1352186 m!1239633))

(declare-fun m!1239635 () Bool)

(assert (=> b!1352194 m!1239635))

(declare-fun m!1239637 () Bool)

(assert (=> b!1352194 m!1239637))

(declare-fun m!1239639 () Bool)

(assert (=> b!1352192 m!1239639))

(declare-fun m!1239641 () Bool)

(assert (=> b!1352182 m!1239641))

(declare-fun m!1239643 () Bool)

(assert (=> b!1352189 m!1239643))

(declare-fun m!1239645 () Bool)

(assert (=> b!1352187 m!1239645))

(declare-fun m!1239647 () Bool)

(assert (=> b!1352181 m!1239647))

(push 1)

(assert (not b!1352187))

(assert (not b!1352181))

(assert (not b!1352190))

(assert (not b!1352182))

(assert (not b!1352183))

(assert (not b!1352189))

(assert (not b!1352194))

(assert (not b!1352193))

(assert (not start!114134))

(assert (not b!1352180))

(assert (not b!1352192))

(assert (not b!1352188))

(assert (not b!1352186))

(assert (not b!1352184))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

