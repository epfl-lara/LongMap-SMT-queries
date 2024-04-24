; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115936 () Bool)

(assert start!115936)

(declare-fun b!1369578 () Bool)

(declare-fun res!912306 () Bool)

(declare-fun e!776134 () Bool)

(assert (=> b!1369578 (=> (not res!912306) (not e!776134))))

(declare-datatypes ((List!31984 0))(
  ( (Nil!31981) (Cons!31980 (h!33198 (_ BitVec 64)) (t!46670 List!31984)) )
))
(declare-fun newAcc!98 () List!31984)

(declare-fun acc!866 () List!31984)

(declare-fun subseq!1028 (List!31984 List!31984) Bool)

(assert (=> b!1369578 (= res!912306 (subseq!1028 newAcc!98 acc!866))))

(declare-fun b!1369579 () Bool)

(declare-fun res!912307 () Bool)

(assert (=> b!1369579 (=> (not res!912307) (not e!776134))))

(declare-fun contains!9669 (List!31984 (_ BitVec 64)) Bool)

(assert (=> b!1369579 (= res!912307 (not (contains!9669 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!912313 () Bool)

(assert (=> start!115936 (=> (not res!912313) (not e!776134))))

(declare-datatypes ((array!93019 0))(
  ( (array!93020 (arr!44929 (Array (_ BitVec 32) (_ BitVec 64))) (size!45480 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93019)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115936 (= res!912313 (and (bvslt (size!45480 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45480 a!3861))))))

(assert (=> start!115936 e!776134))

(declare-fun array_inv!34210 (array!93019) Bool)

(assert (=> start!115936 (array_inv!34210 a!3861)))

(assert (=> start!115936 true))

(declare-fun b!1369580 () Bool)

(declare-fun res!912314 () Bool)

(declare-fun e!776132 () Bool)

(assert (=> b!1369580 (=> (not res!912314) (not e!776132))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1369580 (= res!912314 (not (validKeyInArray!0 (select (arr!44929 a!3861) from!3239))))))

(declare-fun b!1369581 () Bool)

(declare-fun res!912309 () Bool)

(assert (=> b!1369581 (=> (not res!912309) (not e!776134))))

(assert (=> b!1369581 (= res!912309 (not (contains!9669 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369582 () Bool)

(declare-fun res!912312 () Bool)

(assert (=> b!1369582 (=> (not res!912312) (not e!776134))))

(declare-fun noDuplicate!2500 (List!31984) Bool)

(assert (=> b!1369582 (= res!912312 (noDuplicate!2500 acc!866))))

(declare-fun b!1369583 () Bool)

(declare-fun res!912308 () Bool)

(assert (=> b!1369583 (=> (not res!912308) (not e!776132))))

(assert (=> b!1369583 (= res!912308 (bvslt from!3239 (size!45480 a!3861)))))

(declare-fun b!1369584 () Bool)

(assert (=> b!1369584 (= e!776134 e!776132)))

(declare-fun res!912315 () Bool)

(assert (=> b!1369584 (=> (not res!912315) (not e!776132))))

(declare-fun arrayNoDuplicates!0 (array!93019 (_ BitVec 32) List!31984) Bool)

(assert (=> b!1369584 (= res!912315 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45128 0))(
  ( (Unit!45129) )
))
(declare-fun lt!602513 () Unit!45128)

(declare-fun noDuplicateSubseq!215 (List!31984 List!31984) Unit!45128)

(assert (=> b!1369584 (= lt!602513 (noDuplicateSubseq!215 newAcc!98 acc!866))))

(declare-fun b!1369585 () Bool)

(declare-fun res!912311 () Bool)

(assert (=> b!1369585 (=> (not res!912311) (not e!776132))))

(assert (=> b!1369585 (= res!912311 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1369586 () Bool)

(declare-fun res!912305 () Bool)

(assert (=> b!1369586 (=> (not res!912305) (not e!776134))))

(assert (=> b!1369586 (= res!912305 (not (contains!9669 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369587 () Bool)

(assert (=> b!1369587 (= e!776132 false)))

(declare-fun lt!602514 () Bool)

(assert (=> b!1369587 (= lt!602514 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1369588 () Bool)

(declare-fun res!912310 () Bool)

(assert (=> b!1369588 (=> (not res!912310) (not e!776134))))

(assert (=> b!1369588 (= res!912310 (not (contains!9669 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115936 res!912313) b!1369582))

(assert (= (and b!1369582 res!912312) b!1369579))

(assert (= (and b!1369579 res!912307) b!1369581))

(assert (= (and b!1369581 res!912309) b!1369588))

(assert (= (and b!1369588 res!912310) b!1369586))

(assert (= (and b!1369586 res!912305) b!1369578))

(assert (= (and b!1369578 res!912306) b!1369584))

(assert (= (and b!1369584 res!912315) b!1369583))

(assert (= (and b!1369583 res!912308) b!1369580))

(assert (= (and b!1369580 res!912314) b!1369585))

(assert (= (and b!1369585 res!912311) b!1369587))

(declare-fun m!1253887 () Bool)

(assert (=> b!1369581 m!1253887))

(declare-fun m!1253889 () Bool)

(assert (=> b!1369584 m!1253889))

(declare-fun m!1253891 () Bool)

(assert (=> b!1369584 m!1253891))

(declare-fun m!1253893 () Bool)

(assert (=> b!1369579 m!1253893))

(declare-fun m!1253895 () Bool)

(assert (=> b!1369582 m!1253895))

(declare-fun m!1253897 () Bool)

(assert (=> b!1369588 m!1253897))

(declare-fun m!1253899 () Bool)

(assert (=> start!115936 m!1253899))

(declare-fun m!1253901 () Bool)

(assert (=> b!1369587 m!1253901))

(declare-fun m!1253903 () Bool)

(assert (=> b!1369578 m!1253903))

(declare-fun m!1253905 () Bool)

(assert (=> b!1369580 m!1253905))

(assert (=> b!1369580 m!1253905))

(declare-fun m!1253907 () Bool)

(assert (=> b!1369580 m!1253907))

(declare-fun m!1253909 () Bool)

(assert (=> b!1369586 m!1253909))

(check-sat (not b!1369584) (not b!1369581) (not b!1369588) (not b!1369578) (not b!1369582) (not b!1369587) (not b!1369579) (not b!1369586) (not start!115936) (not b!1369580))
(check-sat)
