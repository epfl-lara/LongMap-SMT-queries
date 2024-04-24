; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114418 () Bool)

(assert start!114418)

(declare-fun b!1357920 () Bool)

(declare-fun res!901895 () Bool)

(declare-fun e!770967 () Bool)

(assert (=> b!1357920 (=> (not res!901895) (not e!770967))))

(declare-datatypes ((array!92491 0))(
  ( (array!92492 (arr!44689 (Array (_ BitVec 32) (_ BitVec 64))) (size!45240 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92491)

(declare-datatypes ((List!31717 0))(
  ( (Nil!31714) (Cons!31713 (h!32931 (_ BitVec 64)) (t!46367 List!31717)) )
))
(declare-fun arrayNoDuplicates!0 (array!92491 (_ BitVec 32) List!31717) Bool)

(assert (=> b!1357920 (= res!901895 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31714))))

(declare-fun b!1357921 () Bool)

(declare-fun res!901899 () Bool)

(assert (=> b!1357921 (=> (not res!901899) (not e!770967))))

(declare-fun acc!759 () List!31717)

(declare-fun noDuplicate!2260 (List!31717) Bool)

(assert (=> b!1357921 (= res!901899 (noDuplicate!2260 acc!759))))

(declare-fun b!1357922 () Bool)

(declare-fun res!901897 () Bool)

(assert (=> b!1357922 (=> (not res!901897) (not e!770967))))

(declare-fun contains!9429 (List!31717 (_ BitVec 64)) Bool)

(assert (=> b!1357922 (= res!901897 (not (contains!9429 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357923 () Bool)

(assert (=> b!1357923 (= e!770967 false)))

(declare-fun lt!599541 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1357923 (= lt!599541 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1357924 () Bool)

(declare-fun res!901896 () Bool)

(assert (=> b!1357924 (=> (not res!901896) (not e!770967))))

(assert (=> b!1357924 (= res!901896 (not (contains!9429 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!901898 () Bool)

(assert (=> start!114418 (=> (not res!901898) (not e!770967))))

(assert (=> start!114418 (= res!901898 (and (bvslt (size!45240 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45240 a!3742))))))

(assert (=> start!114418 e!770967))

(declare-fun array_inv!33970 (array!92491) Bool)

(assert (=> start!114418 (array_inv!33970 a!3742)))

(assert (=> start!114418 true))

(assert (= (and start!114418 res!901898) b!1357921))

(assert (= (and b!1357921 res!901899) b!1357924))

(assert (= (and b!1357924 res!901896) b!1357922))

(assert (= (and b!1357922 res!901897) b!1357920))

(assert (= (and b!1357920 res!901895) b!1357923))

(declare-fun m!1244179 () Bool)

(assert (=> b!1357924 m!1244179))

(declare-fun m!1244181 () Bool)

(assert (=> b!1357921 m!1244181))

(declare-fun m!1244183 () Bool)

(assert (=> b!1357920 m!1244183))

(declare-fun m!1244185 () Bool)

(assert (=> b!1357922 m!1244185))

(declare-fun m!1244187 () Bool)

(assert (=> start!114418 m!1244187))

(declare-fun m!1244189 () Bool)

(assert (=> b!1357923 m!1244189))

(check-sat (not start!114418) (not b!1357923) (not b!1357920) (not b!1357921) (not b!1357922) (not b!1357924))
(check-sat)
