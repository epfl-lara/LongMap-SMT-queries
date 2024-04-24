; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115906 () Bool)

(assert start!115906)

(declare-fun b!1369083 () Bool)

(declare-fun res!911816 () Bool)

(declare-fun e!775999 () Bool)

(assert (=> b!1369083 (=> (not res!911816) (not e!775999))))

(declare-datatypes ((List!31969 0))(
  ( (Nil!31966) (Cons!31965 (h!33183 (_ BitVec 64)) (t!46655 List!31969)) )
))
(declare-fun acc!866 () List!31969)

(declare-fun contains!9654 (List!31969 (_ BitVec 64)) Bool)

(assert (=> b!1369083 (= res!911816 (not (contains!9654 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369084 () Bool)

(declare-fun res!911815 () Bool)

(assert (=> b!1369084 (=> (not res!911815) (not e!775999))))

(declare-fun newAcc!98 () List!31969)

(assert (=> b!1369084 (= res!911815 (not (contains!9654 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369085 () Bool)

(declare-fun e!775998 () Bool)

(assert (=> b!1369085 (= e!775998 false)))

(declare-fun lt!602423 () Bool)

(declare-datatypes ((array!92989 0))(
  ( (array!92990 (arr!44914 (Array (_ BitVec 32) (_ BitVec 64))) (size!45465 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92989)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92989 (_ BitVec 32) List!31969) Bool)

(assert (=> b!1369085 (= lt!602423 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1369086 () Bool)

(assert (=> b!1369086 (= e!775999 e!775998)))

(declare-fun res!911811 () Bool)

(assert (=> b!1369086 (=> (not res!911811) (not e!775998))))

(assert (=> b!1369086 (= res!911811 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45098 0))(
  ( (Unit!45099) )
))
(declare-fun lt!602424 () Unit!45098)

(declare-fun noDuplicateSubseq!200 (List!31969 List!31969) Unit!45098)

(assert (=> b!1369086 (= lt!602424 (noDuplicateSubseq!200 newAcc!98 acc!866))))

(declare-fun b!1369087 () Bool)

(declare-fun res!911820 () Bool)

(assert (=> b!1369087 (=> (not res!911820) (not e!775998))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1369087 (= res!911820 (not (validKeyInArray!0 (select (arr!44914 a!3861) from!3239))))))

(declare-fun b!1369088 () Bool)

(declare-fun res!911812 () Bool)

(assert (=> b!1369088 (=> (not res!911812) (not e!775999))))

(assert (=> b!1369088 (= res!911812 (not (contains!9654 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369090 () Bool)

(declare-fun res!911819 () Bool)

(assert (=> b!1369090 (=> (not res!911819) (not e!775998))))

(assert (=> b!1369090 (= res!911819 (bvslt from!3239 (size!45465 a!3861)))))

(declare-fun b!1369091 () Bool)

(declare-fun res!911814 () Bool)

(assert (=> b!1369091 (=> (not res!911814) (not e!775999))))

(declare-fun noDuplicate!2485 (List!31969) Bool)

(assert (=> b!1369091 (= res!911814 (noDuplicate!2485 acc!866))))

(declare-fun b!1369092 () Bool)

(declare-fun res!911818 () Bool)

(assert (=> b!1369092 (=> (not res!911818) (not e!775999))))

(assert (=> b!1369092 (= res!911818 (not (contains!9654 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369093 () Bool)

(declare-fun res!911810 () Bool)

(assert (=> b!1369093 (=> (not res!911810) (not e!775999))))

(declare-fun subseq!1013 (List!31969 List!31969) Bool)

(assert (=> b!1369093 (= res!911810 (subseq!1013 newAcc!98 acc!866))))

(declare-fun b!1369089 () Bool)

(declare-fun res!911817 () Bool)

(assert (=> b!1369089 (=> (not res!911817) (not e!775998))))

(assert (=> b!1369089 (= res!911817 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun res!911813 () Bool)

(assert (=> start!115906 (=> (not res!911813) (not e!775999))))

(assert (=> start!115906 (= res!911813 (and (bvslt (size!45465 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45465 a!3861))))))

(assert (=> start!115906 e!775999))

(declare-fun array_inv!34195 (array!92989) Bool)

(assert (=> start!115906 (array_inv!34195 a!3861)))

(assert (=> start!115906 true))

(assert (= (and start!115906 res!911813) b!1369091))

(assert (= (and b!1369091 res!911814) b!1369083))

(assert (= (and b!1369083 res!911816) b!1369092))

(assert (= (and b!1369092 res!911818) b!1369084))

(assert (= (and b!1369084 res!911815) b!1369088))

(assert (= (and b!1369088 res!911812) b!1369093))

(assert (= (and b!1369093 res!911810) b!1369086))

(assert (= (and b!1369086 res!911811) b!1369090))

(assert (= (and b!1369090 res!911819) b!1369087))

(assert (= (and b!1369087 res!911820) b!1369089))

(assert (= (and b!1369089 res!911817) b!1369085))

(declare-fun m!1253527 () Bool)

(assert (=> b!1369091 m!1253527))

(declare-fun m!1253529 () Bool)

(assert (=> b!1369086 m!1253529))

(declare-fun m!1253531 () Bool)

(assert (=> b!1369086 m!1253531))

(declare-fun m!1253533 () Bool)

(assert (=> b!1369088 m!1253533))

(declare-fun m!1253535 () Bool)

(assert (=> b!1369083 m!1253535))

(declare-fun m!1253537 () Bool)

(assert (=> b!1369092 m!1253537))

(declare-fun m!1253539 () Bool)

(assert (=> b!1369084 m!1253539))

(declare-fun m!1253541 () Bool)

(assert (=> start!115906 m!1253541))

(declare-fun m!1253543 () Bool)

(assert (=> b!1369087 m!1253543))

(assert (=> b!1369087 m!1253543))

(declare-fun m!1253545 () Bool)

(assert (=> b!1369087 m!1253545))

(declare-fun m!1253547 () Bool)

(assert (=> b!1369093 m!1253547))

(declare-fun m!1253549 () Bool)

(assert (=> b!1369085 m!1253549))

(check-sat (not b!1369091) (not b!1369085) (not b!1369083) (not b!1369088) (not b!1369086) (not start!115906) (not b!1369093) (not b!1369084) (not b!1369087) (not b!1369092))
(check-sat)
