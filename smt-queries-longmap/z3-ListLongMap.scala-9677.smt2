; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114424 () Bool)

(assert start!114424)

(declare-fun b!1357965 () Bool)

(declare-fun e!770985 () Bool)

(assert (=> b!1357965 (= e!770985 false)))

(declare-fun lt!599550 () Bool)

(declare-datatypes ((List!31720 0))(
  ( (Nil!31717) (Cons!31716 (h!32934 (_ BitVec 64)) (t!46370 List!31720)) )
))
(declare-fun acc!759 () List!31720)

(declare-datatypes ((array!92497 0))(
  ( (array!92498 (arr!44692 (Array (_ BitVec 32) (_ BitVec 64))) (size!45243 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92497)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92497 (_ BitVec 32) List!31720) Bool)

(assert (=> b!1357965 (= lt!599550 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!901942 () Bool)

(assert (=> start!114424 (=> (not res!901942) (not e!770985))))

(assert (=> start!114424 (= res!901942 (and (bvslt (size!45243 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45243 a!3742))))))

(assert (=> start!114424 e!770985))

(declare-fun array_inv!33973 (array!92497) Bool)

(assert (=> start!114424 (array_inv!33973 a!3742)))

(assert (=> start!114424 true))

(declare-fun b!1357966 () Bool)

(declare-fun res!901943 () Bool)

(assert (=> b!1357966 (=> (not res!901943) (not e!770985))))

(assert (=> b!1357966 (= res!901943 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31717))))

(declare-fun b!1357967 () Bool)

(declare-fun res!901944 () Bool)

(assert (=> b!1357967 (=> (not res!901944) (not e!770985))))

(declare-fun contains!9432 (List!31720 (_ BitVec 64)) Bool)

(assert (=> b!1357967 (= res!901944 (not (contains!9432 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357968 () Bool)

(declare-fun res!901940 () Bool)

(assert (=> b!1357968 (=> (not res!901940) (not e!770985))))

(assert (=> b!1357968 (= res!901940 (not (contains!9432 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357969 () Bool)

(declare-fun res!901941 () Bool)

(assert (=> b!1357969 (=> (not res!901941) (not e!770985))))

(declare-fun noDuplicate!2263 (List!31720) Bool)

(assert (=> b!1357969 (= res!901941 (noDuplicate!2263 acc!759))))

(assert (= (and start!114424 res!901942) b!1357969))

(assert (= (and b!1357969 res!901941) b!1357968))

(assert (= (and b!1357968 res!901940) b!1357967))

(assert (= (and b!1357967 res!901944) b!1357966))

(assert (= (and b!1357966 res!901943) b!1357965))

(declare-fun m!1244215 () Bool)

(assert (=> b!1357968 m!1244215))

(declare-fun m!1244217 () Bool)

(assert (=> b!1357965 m!1244217))

(declare-fun m!1244219 () Bool)

(assert (=> b!1357969 m!1244219))

(declare-fun m!1244221 () Bool)

(assert (=> b!1357966 m!1244221))

(declare-fun m!1244223 () Bool)

(assert (=> b!1357967 m!1244223))

(declare-fun m!1244225 () Bool)

(assert (=> start!114424 m!1244225))

(check-sat (not b!1357968) (not b!1357967) (not b!1357966) (not start!114424) (not b!1357969) (not b!1357965))
(check-sat)
