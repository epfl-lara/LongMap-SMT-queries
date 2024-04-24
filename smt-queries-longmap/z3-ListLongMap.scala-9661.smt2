; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114328 () Bool)

(assert start!114328)

(declare-fun b!1356377 () Bool)

(declare-datatypes ((Unit!44453 0))(
  ( (Unit!44454) )
))
(declare-fun e!770467 () Unit!44453)

(declare-fun Unit!44455 () Unit!44453)

(assert (=> b!1356377 (= e!770467 Unit!44455)))

(declare-fun b!1356378 () Bool)

(declare-fun res!900586 () Bool)

(declare-fun e!770469 () Bool)

(assert (=> b!1356378 (=> (not res!900586) (not e!770469))))

(declare-datatypes ((array!92401 0))(
  ( (array!92402 (arr!44644 (Array (_ BitVec 32) (_ BitVec 64))) (size!45195 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92401)

(declare-datatypes ((List!31672 0))(
  ( (Nil!31669) (Cons!31668 (h!32886 (_ BitVec 64)) (t!46322 List!31672)) )
))
(declare-fun arrayNoDuplicates!0 (array!92401 (_ BitVec 32) List!31672) Bool)

(assert (=> b!1356378 (= res!900586 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31669))))

(declare-fun b!1356379 () Bool)

(declare-fun e!770470 () Bool)

(assert (=> b!1356379 (= e!770469 e!770470)))

(declare-fun res!900585 () Bool)

(assert (=> b!1356379 (=> (not res!900585) (not e!770470))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun lt!598955 () Bool)

(assert (=> b!1356379 (= res!900585 (and (not (= from!3120 i!1404)) (not lt!598955) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598957 () Unit!44453)

(assert (=> b!1356379 (= lt!598957 e!770467)))

(declare-fun c!127345 () Bool)

(assert (=> b!1356379 (= c!127345 lt!598955)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356379 (= lt!598955 (validKeyInArray!0 (select (arr!44644 a!3742) from!3120)))))

(declare-fun b!1356380 () Bool)

(declare-fun res!900584 () Bool)

(assert (=> b!1356380 (=> (not res!900584) (not e!770469))))

(assert (=> b!1356380 (= res!900584 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45195 a!3742))))))

(declare-fun res!900590 () Bool)

(assert (=> start!114328 (=> (not res!900590) (not e!770469))))

(assert (=> start!114328 (= res!900590 (and (bvslt (size!45195 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45195 a!3742))))))

(assert (=> start!114328 e!770469))

(assert (=> start!114328 true))

(declare-fun array_inv!33925 (array!92401) Bool)

(assert (=> start!114328 (array_inv!33925 a!3742)))

(declare-fun b!1356381 () Bool)

(declare-fun res!900588 () Bool)

(assert (=> b!1356381 (=> (not res!900588) (not e!770469))))

(declare-fun acc!759 () List!31672)

(assert (=> b!1356381 (= res!900588 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356382 () Bool)

(declare-fun res!900583 () Bool)

(assert (=> b!1356382 (=> (not res!900583) (not e!770469))))

(declare-fun contains!9384 (List!31672 (_ BitVec 64)) Bool)

(assert (=> b!1356382 (= res!900583 (not (contains!9384 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356383 () Bool)

(declare-fun res!900591 () Bool)

(assert (=> b!1356383 (=> (not res!900591) (not e!770469))))

(assert (=> b!1356383 (= res!900591 (not (contains!9384 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356384 () Bool)

(declare-fun res!900582 () Bool)

(assert (=> b!1356384 (=> (not res!900582) (not e!770469))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1356384 (= res!900582 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356385 () Bool)

(declare-fun res!900589 () Bool)

(assert (=> b!1356385 (=> (not res!900589) (not e!770469))))

(declare-fun noDuplicate!2215 (List!31672) Bool)

(assert (=> b!1356385 (= res!900589 (noDuplicate!2215 acc!759))))

(declare-fun b!1356386 () Bool)

(assert (=> b!1356386 (= e!770470 false)))

(declare-fun lt!598959 () Bool)

(assert (=> b!1356386 (= lt!598959 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356387 () Bool)

(declare-fun res!900587 () Bool)

(assert (=> b!1356387 (=> (not res!900587) (not e!770469))))

(assert (=> b!1356387 (= res!900587 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45195 a!3742)))))

(declare-fun b!1356388 () Bool)

(declare-fun lt!598958 () Unit!44453)

(assert (=> b!1356388 (= e!770467 lt!598958)))

(declare-fun lt!598956 () Unit!44453)

(declare-fun lemmaListSubSeqRefl!0 (List!31672) Unit!44453)

(assert (=> b!1356388 (= lt!598956 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!761 (List!31672 List!31672) Bool)

(assert (=> b!1356388 (subseq!761 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92401 List!31672 List!31672 (_ BitVec 32)) Unit!44453)

(declare-fun $colon$colon!775 (List!31672 (_ BitVec 64)) List!31672)

(assert (=> b!1356388 (= lt!598958 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!775 acc!759 (select (arr!44644 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1356388 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!114328 res!900590) b!1356385))

(assert (= (and b!1356385 res!900589) b!1356383))

(assert (= (and b!1356383 res!900591) b!1356382))

(assert (= (and b!1356382 res!900583) b!1356378))

(assert (= (and b!1356378 res!900586) b!1356381))

(assert (= (and b!1356381 res!900588) b!1356380))

(assert (= (and b!1356380 res!900584) b!1356384))

(assert (= (and b!1356384 res!900582) b!1356387))

(assert (= (and b!1356387 res!900587) b!1356379))

(assert (= (and b!1356379 c!127345) b!1356388))

(assert (= (and b!1356379 (not c!127345)) b!1356377))

(assert (= (and b!1356379 res!900585) b!1356386))

(declare-fun m!1242937 () Bool)

(assert (=> b!1356385 m!1242937))

(declare-fun m!1242939 () Bool)

(assert (=> b!1356383 m!1242939))

(declare-fun m!1242941 () Bool)

(assert (=> b!1356388 m!1242941))

(declare-fun m!1242943 () Bool)

(assert (=> b!1356388 m!1242943))

(declare-fun m!1242945 () Bool)

(assert (=> b!1356388 m!1242945))

(declare-fun m!1242947 () Bool)

(assert (=> b!1356388 m!1242947))

(declare-fun m!1242949 () Bool)

(assert (=> b!1356388 m!1242949))

(assert (=> b!1356388 m!1242943))

(assert (=> b!1356388 m!1242945))

(declare-fun m!1242951 () Bool)

(assert (=> b!1356388 m!1242951))

(assert (=> b!1356379 m!1242943))

(assert (=> b!1356379 m!1242943))

(declare-fun m!1242953 () Bool)

(assert (=> b!1356379 m!1242953))

(declare-fun m!1242955 () Bool)

(assert (=> b!1356378 m!1242955))

(declare-fun m!1242957 () Bool)

(assert (=> b!1356381 m!1242957))

(declare-fun m!1242959 () Bool)

(assert (=> b!1356382 m!1242959))

(assert (=> b!1356386 m!1242949))

(declare-fun m!1242961 () Bool)

(assert (=> b!1356384 m!1242961))

(declare-fun m!1242963 () Bool)

(assert (=> start!114328 m!1242963))

(check-sat (not b!1356383) (not b!1356382) (not b!1356381) (not b!1356378) (not b!1356388) (not b!1356385) (not start!114328) (not b!1356379) (not b!1356386) (not b!1356384))
(check-sat)
