; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115880 () Bool)

(assert start!115880)

(declare-fun b!1369842 () Bool)

(declare-fun res!913304 () Bool)

(declare-fun e!775939 () Bool)

(assert (=> b!1369842 (=> (not res!913304) (not e!775939))))

(declare-datatypes ((List!31986 0))(
  ( (Nil!31983) (Cons!31982 (h!33191 (_ BitVec 64)) (t!46680 List!31986)) )
))
(declare-fun acc!866 () List!31986)

(declare-fun noDuplicate!2525 (List!31986) Bool)

(assert (=> b!1369842 (= res!913304 (noDuplicate!2525 acc!866))))

(declare-fun res!913309 () Bool)

(assert (=> start!115880 (=> (not res!913309) (not e!775939))))

(declare-datatypes ((array!92994 0))(
  ( (array!92995 (arr!44918 (Array (_ BitVec 32) (_ BitVec 64))) (size!45468 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92994)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115880 (= res!913309 (and (bvslt (size!45468 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45468 a!3861))))))

(assert (=> start!115880 e!775939))

(declare-fun array_inv!33946 (array!92994) Bool)

(assert (=> start!115880 (array_inv!33946 a!3861)))

(assert (=> start!115880 true))

(declare-fun b!1369843 () Bool)

(declare-fun res!913312 () Bool)

(assert (=> b!1369843 (=> (not res!913312) (not e!775939))))

(declare-fun newAcc!98 () List!31986)

(declare-fun subseq!1070 (List!31986 List!31986) Bool)

(assert (=> b!1369843 (= res!913312 (subseq!1070 newAcc!98 acc!866))))

(declare-fun b!1369844 () Bool)

(declare-fun e!775937 () Bool)

(assert (=> b!1369844 (= e!775939 e!775937)))

(declare-fun res!913310 () Bool)

(assert (=> b!1369844 (=> (not res!913310) (not e!775937))))

(declare-fun arrayNoDuplicates!0 (array!92994 (_ BitVec 32) List!31986) Bool)

(assert (=> b!1369844 (= res!913310 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45273 0))(
  ( (Unit!45274) )
))
(declare-fun lt!602350 () Unit!45273)

(declare-fun noDuplicateSubseq!257 (List!31986 List!31986) Unit!45273)

(assert (=> b!1369844 (= lt!602350 (noDuplicateSubseq!257 newAcc!98 acc!866))))

(declare-fun b!1369845 () Bool)

(assert (=> b!1369845 (= e!775937 (bvslt (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1369846 () Bool)

(declare-fun res!913302 () Bool)

(assert (=> b!1369846 (=> (not res!913302) (not e!775937))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1369846 (= res!913302 (validKeyInArray!0 (select (arr!44918 a!3861) from!3239)))))

(declare-fun b!1369847 () Bool)

(declare-fun res!913303 () Bool)

(assert (=> b!1369847 (=> (not res!913303) (not e!775939))))

(declare-fun contains!9668 (List!31986 (_ BitVec 64)) Bool)

(assert (=> b!1369847 (= res!913303 (not (contains!9668 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369848 () Bool)

(declare-fun res!913306 () Bool)

(assert (=> b!1369848 (=> (not res!913306) (not e!775939))))

(assert (=> b!1369848 (= res!913306 (not (contains!9668 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369849 () Bool)

(declare-fun res!913305 () Bool)

(assert (=> b!1369849 (=> (not res!913305) (not e!775939))))

(assert (=> b!1369849 (= res!913305 (not (contains!9668 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369850 () Bool)

(declare-fun res!913308 () Bool)

(assert (=> b!1369850 (=> (not res!913308) (not e!775937))))

(assert (=> b!1369850 (= res!913308 (not (contains!9668 acc!866 (select (arr!44918 a!3861) from!3239))))))

(declare-fun b!1369851 () Bool)

(declare-fun res!913311 () Bool)

(assert (=> b!1369851 (=> (not res!913311) (not e!775939))))

(assert (=> b!1369851 (= res!913311 (not (contains!9668 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369852 () Bool)

(declare-fun res!913307 () Bool)

(assert (=> b!1369852 (=> (not res!913307) (not e!775937))))

(assert (=> b!1369852 (= res!913307 (bvslt from!3239 (size!45468 a!3861)))))

(assert (= (and start!115880 res!913309) b!1369842))

(assert (= (and b!1369842 res!913304) b!1369849))

(assert (= (and b!1369849 res!913305) b!1369847))

(assert (= (and b!1369847 res!913303) b!1369848))

(assert (= (and b!1369848 res!913306) b!1369851))

(assert (= (and b!1369851 res!913311) b!1369843))

(assert (= (and b!1369843 res!913312) b!1369844))

(assert (= (and b!1369844 res!913310) b!1369852))

(assert (= (and b!1369852 res!913307) b!1369846))

(assert (= (and b!1369846 res!913302) b!1369850))

(assert (= (and b!1369850 res!913308) b!1369845))

(declare-fun m!1253545 () Bool)

(assert (=> b!1369850 m!1253545))

(assert (=> b!1369850 m!1253545))

(declare-fun m!1253547 () Bool)

(assert (=> b!1369850 m!1253547))

(declare-fun m!1253549 () Bool)

(assert (=> b!1369848 m!1253549))

(declare-fun m!1253551 () Bool)

(assert (=> b!1369843 m!1253551))

(declare-fun m!1253553 () Bool)

(assert (=> b!1369847 m!1253553))

(declare-fun m!1253555 () Bool)

(assert (=> b!1369844 m!1253555))

(declare-fun m!1253557 () Bool)

(assert (=> b!1369844 m!1253557))

(assert (=> b!1369846 m!1253545))

(assert (=> b!1369846 m!1253545))

(declare-fun m!1253559 () Bool)

(assert (=> b!1369846 m!1253559))

(declare-fun m!1253561 () Bool)

(assert (=> start!115880 m!1253561))

(declare-fun m!1253563 () Bool)

(assert (=> b!1369849 m!1253563))

(declare-fun m!1253565 () Bool)

(assert (=> b!1369842 m!1253565))

(declare-fun m!1253567 () Bool)

(assert (=> b!1369851 m!1253567))

(push 1)

