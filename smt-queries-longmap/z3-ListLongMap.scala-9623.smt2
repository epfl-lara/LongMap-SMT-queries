; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114100 () Bool)

(assert start!114100)

(declare-fun b!1351782 () Bool)

(declare-fun e!769122 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92173 0))(
  ( (array!92174 (arr!44530 (Array (_ BitVec 32) (_ BitVec 64))) (size!45081 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92173)

(assert (=> b!1351782 (= e!769122 (bvsgt from!3120 (size!45081 a!3742)))))

(declare-fun b!1351783 () Bool)

(declare-fun res!896460 () Bool)

(assert (=> b!1351783 (=> (not res!896460) (not e!769122))))

(declare-datatypes ((List!31558 0))(
  ( (Nil!31555) (Cons!31554 (h!32772 (_ BitVec 64)) (t!46208 List!31558)) )
))
(declare-fun arrayNoDuplicates!0 (array!92173 (_ BitVec 32) List!31558) Bool)

(assert (=> b!1351783 (= res!896460 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31555))))

(declare-fun b!1351784 () Bool)

(declare-fun res!896463 () Bool)

(assert (=> b!1351784 (=> (not res!896463) (not e!769122))))

(declare-fun acc!759 () List!31558)

(declare-fun contains!9270 (List!31558 (_ BitVec 64)) Bool)

(assert (=> b!1351784 (= res!896463 (not (contains!9270 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!896462 () Bool)

(assert (=> start!114100 (=> (not res!896462) (not e!769122))))

(assert (=> start!114100 (= res!896462 (and (bvslt (size!45081 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45081 a!3742))))))

(assert (=> start!114100 e!769122))

(declare-fun array_inv!33811 (array!92173) Bool)

(assert (=> start!114100 (array_inv!33811 a!3742)))

(assert (=> start!114100 true))

(declare-fun b!1351785 () Bool)

(declare-fun res!896459 () Bool)

(assert (=> b!1351785 (=> (not res!896459) (not e!769122))))

(assert (=> b!1351785 (= res!896459 (not (contains!9270 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351786 () Bool)

(declare-fun res!896461 () Bool)

(assert (=> b!1351786 (=> (not res!896461) (not e!769122))))

(declare-fun noDuplicate!2101 (List!31558) Bool)

(assert (=> b!1351786 (= res!896461 (noDuplicate!2101 acc!759))))

(assert (= (and start!114100 res!896462) b!1351786))

(assert (= (and b!1351786 res!896461) b!1351784))

(assert (= (and b!1351784 res!896463) b!1351785))

(assert (= (and b!1351785 res!896459) b!1351783))

(assert (= (and b!1351783 res!896460) b!1351782))

(declare-fun m!1239313 () Bool)

(assert (=> start!114100 m!1239313))

(declare-fun m!1239315 () Bool)

(assert (=> b!1351783 m!1239315))

(declare-fun m!1239317 () Bool)

(assert (=> b!1351784 m!1239317))

(declare-fun m!1239319 () Bool)

(assert (=> b!1351786 m!1239319))

(declare-fun m!1239321 () Bool)

(assert (=> b!1351785 m!1239321))

(check-sat (not b!1351783) (not start!114100) (not b!1351784) (not b!1351785) (not b!1351786))
(check-sat)
