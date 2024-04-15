; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115462 () Bool)

(assert start!115462)

(declare-fun b!1365845 () Bool)

(declare-fun res!909465 () Bool)

(declare-fun e!774284 () Bool)

(assert (=> b!1365845 (=> (not res!909465) (not e!774284))))

(declare-datatypes ((List!31946 0))(
  ( (Nil!31943) (Cons!31942 (h!33151 (_ BitVec 64)) (t!46632 List!31946)) )
))
(declare-fun newAcc!98 () List!31946)

(declare-fun contains!9539 (List!31946 (_ BitVec 64)) Bool)

(assert (=> b!1365845 (= res!909465 (not (contains!9539 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365846 () Bool)

(declare-fun e!774285 () Bool)

(assert (=> b!1365846 (= e!774284 e!774285)))

(declare-fun res!909469 () Bool)

(assert (=> b!1365846 (=> (not res!909469) (not e!774285))))

(declare-datatypes ((array!92742 0))(
  ( (array!92743 (arr!44800 (Array (_ BitVec 32) (_ BitVec 64))) (size!45352 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92742)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun acc!866 () List!31946)

(declare-fun arrayNoDuplicates!0 (array!92742 (_ BitVec 32) List!31946) Bool)

(assert (=> b!1365846 (= res!909469 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!44928 0))(
  ( (Unit!44929) )
))
(declare-fun lt!601236 () Unit!44928)

(declare-fun noDuplicateSubseq!164 (List!31946 List!31946) Unit!44928)

(assert (=> b!1365846 (= lt!601236 (noDuplicateSubseq!164 newAcc!98 acc!866))))

(declare-fun b!1365847 () Bool)

(declare-fun res!909463 () Bool)

(declare-fun e!774282 () Bool)

(assert (=> b!1365847 (=> (not res!909463) (not e!774282))))

(declare-fun lt!601235 () List!31946)

(assert (=> b!1365847 (= res!909463 (not (contains!9539 lt!601235 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365848 () Bool)

(assert (=> b!1365848 (= e!774285 e!774282)))

(declare-fun res!909475 () Bool)

(assert (=> b!1365848 (=> (not res!909475) (not e!774282))))

(assert (=> b!1365848 (= res!909475 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun lt!601232 () List!31946)

(assert (=> b!1365848 (= lt!601232 (Cons!31942 (select (arr!44800 a!3861) from!3239) newAcc!98))))

(assert (=> b!1365848 (= lt!601235 (Cons!31942 (select (arr!44800 a!3861) from!3239) acc!866))))

(declare-fun b!1365850 () Bool)

(declare-fun res!909474 () Bool)

(assert (=> b!1365850 (=> (not res!909474) (not e!774284))))

(declare-fun subseq!977 (List!31946 List!31946) Bool)

(assert (=> b!1365850 (= res!909474 (subseq!977 newAcc!98 acc!866))))

(declare-fun b!1365851 () Bool)

(declare-fun res!909478 () Bool)

(assert (=> b!1365851 (=> (not res!909478) (not e!774284))))

(assert (=> b!1365851 (= res!909478 (not (contains!9539 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365852 () Bool)

(declare-fun res!909479 () Bool)

(assert (=> b!1365852 (=> (not res!909479) (not e!774282))))

(assert (=> b!1365852 (= res!909479 (subseq!977 lt!601232 lt!601235))))

(declare-fun b!1365853 () Bool)

(declare-fun res!909467 () Bool)

(assert (=> b!1365853 (=> (not res!909467) (not e!774285))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1365853 (= res!909467 (validKeyInArray!0 (select (arr!44800 a!3861) from!3239)))))

(declare-fun b!1365854 () Bool)

(declare-fun res!909466 () Bool)

(assert (=> b!1365854 (=> (not res!909466) (not e!774285))))

(assert (=> b!1365854 (= res!909466 (bvslt from!3239 (size!45352 a!3861)))))

(declare-fun b!1365855 () Bool)

(declare-fun res!909471 () Bool)

(assert (=> b!1365855 (=> (not res!909471) (not e!774284))))

(declare-fun noDuplicate!2454 (List!31946) Bool)

(assert (=> b!1365855 (= res!909471 (noDuplicate!2454 acc!866))))

(declare-fun b!1365856 () Bool)

(declare-fun res!909477 () Bool)

(assert (=> b!1365856 (=> (not res!909477) (not e!774285))))

(assert (=> b!1365856 (= res!909477 (not (contains!9539 acc!866 (select (arr!44800 a!3861) from!3239))))))

(declare-fun b!1365857 () Bool)

(declare-fun res!909462 () Bool)

(assert (=> b!1365857 (=> (not res!909462) (not e!774282))))

(assert (=> b!1365857 (= res!909462 (noDuplicate!2454 lt!601235))))

(declare-fun b!1365858 () Bool)

(declare-fun res!909476 () Bool)

(assert (=> b!1365858 (=> (not res!909476) (not e!774284))))

(assert (=> b!1365858 (= res!909476 (not (contains!9539 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365859 () Bool)

(declare-fun res!909470 () Bool)

(assert (=> b!1365859 (=> (not res!909470) (not e!774284))))

(assert (=> b!1365859 (= res!909470 (not (contains!9539 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365860 () Bool)

(declare-fun res!909464 () Bool)

(assert (=> b!1365860 (=> (not res!909464) (not e!774282))))

(assert (=> b!1365860 (= res!909464 (not (contains!9539 lt!601232 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365849 () Bool)

(declare-fun res!909473 () Bool)

(assert (=> b!1365849 (=> (not res!909473) (not e!774282))))

(assert (=> b!1365849 (= res!909473 (not (contains!9539 lt!601232 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!909468 () Bool)

(assert (=> start!115462 (=> (not res!909468) (not e!774284))))

(assert (=> start!115462 (= res!909468 (and (bvslt (size!45352 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45352 a!3861))))))

(assert (=> start!115462 e!774284))

(declare-fun array_inv!34033 (array!92742) Bool)

(assert (=> start!115462 (array_inv!34033 a!3861)))

(assert (=> start!115462 true))

(declare-fun b!1365861 () Bool)

(assert (=> b!1365861 (= e!774282 false)))

(declare-fun lt!601234 () Bool)

(assert (=> b!1365861 (= lt!601234 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601235))))

(declare-fun lt!601233 () Unit!44928)

(assert (=> b!1365861 (= lt!601233 (noDuplicateSubseq!164 lt!601232 lt!601235))))

(declare-fun b!1365862 () Bool)

(declare-fun res!909472 () Bool)

(assert (=> b!1365862 (=> (not res!909472) (not e!774282))))

(assert (=> b!1365862 (= res!909472 (not (contains!9539 lt!601235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115462 res!909468) b!1365855))

(assert (= (and b!1365855 res!909471) b!1365851))

(assert (= (and b!1365851 res!909478) b!1365859))

(assert (= (and b!1365859 res!909470) b!1365858))

(assert (= (and b!1365858 res!909476) b!1365845))

(assert (= (and b!1365845 res!909465) b!1365850))

(assert (= (and b!1365850 res!909474) b!1365846))

(assert (= (and b!1365846 res!909469) b!1365854))

(assert (= (and b!1365854 res!909466) b!1365853))

(assert (= (and b!1365853 res!909467) b!1365856))

(assert (= (and b!1365856 res!909477) b!1365848))

(assert (= (and b!1365848 res!909475) b!1365857))

(assert (= (and b!1365857 res!909462) b!1365862))

(assert (= (and b!1365862 res!909472) b!1365847))

(assert (= (and b!1365847 res!909463) b!1365849))

(assert (= (and b!1365849 res!909473) b!1365860))

(assert (= (and b!1365860 res!909464) b!1365852))

(assert (= (and b!1365852 res!909479) b!1365861))

(declare-fun m!1249815 () Bool)

(assert (=> b!1365851 m!1249815))

(declare-fun m!1249817 () Bool)

(assert (=> b!1365847 m!1249817))

(declare-fun m!1249819 () Bool)

(assert (=> b!1365859 m!1249819))

(declare-fun m!1249821 () Bool)

(assert (=> b!1365862 m!1249821))

(declare-fun m!1249823 () Bool)

(assert (=> b!1365846 m!1249823))

(declare-fun m!1249825 () Bool)

(assert (=> b!1365846 m!1249825))

(declare-fun m!1249827 () Bool)

(assert (=> b!1365855 m!1249827))

(declare-fun m!1249829 () Bool)

(assert (=> b!1365858 m!1249829))

(declare-fun m!1249831 () Bool)

(assert (=> b!1365857 m!1249831))

(declare-fun m!1249833 () Bool)

(assert (=> b!1365845 m!1249833))

(declare-fun m!1249835 () Bool)

(assert (=> b!1365853 m!1249835))

(assert (=> b!1365853 m!1249835))

(declare-fun m!1249837 () Bool)

(assert (=> b!1365853 m!1249837))

(assert (=> b!1365856 m!1249835))

(assert (=> b!1365856 m!1249835))

(declare-fun m!1249839 () Bool)

(assert (=> b!1365856 m!1249839))

(declare-fun m!1249841 () Bool)

(assert (=> b!1365850 m!1249841))

(declare-fun m!1249843 () Bool)

(assert (=> b!1365861 m!1249843))

(declare-fun m!1249845 () Bool)

(assert (=> b!1365861 m!1249845))

(declare-fun m!1249847 () Bool)

(assert (=> b!1365849 m!1249847))

(declare-fun m!1249849 () Bool)

(assert (=> b!1365852 m!1249849))

(assert (=> b!1365848 m!1249835))

(declare-fun m!1249851 () Bool)

(assert (=> b!1365860 m!1249851))

(declare-fun m!1249853 () Bool)

(assert (=> start!115462 m!1249853))

(check-sat (not b!1365845) (not b!1365853) (not b!1365855) (not b!1365846) (not b!1365849) (not b!1365856) (not b!1365850) (not start!115462) (not b!1365862) (not b!1365857) (not b!1365859) (not b!1365847) (not b!1365852) (not b!1365858) (not b!1365861) (not b!1365851) (not b!1365860))
(check-sat)
