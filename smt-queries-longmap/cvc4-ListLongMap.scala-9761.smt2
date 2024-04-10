; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115692 () Bool)

(assert start!115692)

(declare-fun b!1367949 () Bool)

(declare-fun res!911459 () Bool)

(declare-fun e!775199 () Bool)

(assert (=> b!1367949 (=> (not res!911459) (not e!775199))))

(declare-datatypes ((List!31934 0))(
  ( (Nil!31931) (Cons!31930 (h!33139 (_ BitVec 64)) (t!46628 List!31934)) )
))
(declare-fun newAcc!98 () List!31934)

(declare-fun acc!866 () List!31934)

(declare-fun subseq!1018 (List!31934 List!31934) Bool)

(assert (=> b!1367949 (= res!911459 (subseq!1018 newAcc!98 acc!866))))

(declare-fun b!1367950 () Bool)

(declare-fun res!911466 () Bool)

(assert (=> b!1367950 (=> (not res!911466) (not e!775199))))

(declare-fun contains!9616 (List!31934 (_ BitVec 64)) Bool)

(assert (=> b!1367950 (= res!911466 (not (contains!9616 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367951 () Bool)

(declare-fun res!911463 () Bool)

(declare-fun e!775200 () Bool)

(assert (=> b!1367951 (=> (not res!911463) (not e!775200))))

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1367951 (= res!911463 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1367952 () Bool)

(declare-fun res!911460 () Bool)

(assert (=> b!1367952 (=> (not res!911460) (not e!775199))))

(assert (=> b!1367952 (= res!911460 (not (contains!9616 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367954 () Bool)

(declare-fun res!911467 () Bool)

(assert (=> b!1367954 (=> (not res!911467) (not e!775200))))

(declare-datatypes ((array!92884 0))(
  ( (array!92885 (arr!44866 (Array (_ BitVec 32) (_ BitVec 64))) (size!45416 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92884)

(assert (=> b!1367954 (= res!911467 (bvslt from!3239 (size!45416 a!3861)))))

(declare-fun b!1367955 () Bool)

(declare-fun res!911458 () Bool)

(assert (=> b!1367955 (=> (not res!911458) (not e!775199))))

(assert (=> b!1367955 (= res!911458 (not (contains!9616 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367956 () Bool)

(declare-fun res!911462 () Bool)

(assert (=> b!1367956 (=> (not res!911462) (not e!775200))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367956 (= res!911462 (not (validKeyInArray!0 (select (arr!44866 a!3861) from!3239))))))

(declare-fun b!1367957 () Bool)

(assert (=> b!1367957 (= e!775200 false)))

(declare-fun lt!601977 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92884 (_ BitVec 32) List!31934) Bool)

(assert (=> b!1367957 (= lt!601977 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1367958 () Bool)

(declare-fun res!911465 () Bool)

(assert (=> b!1367958 (=> (not res!911465) (not e!775199))))

(declare-fun noDuplicate!2473 (List!31934) Bool)

(assert (=> b!1367958 (= res!911465 (noDuplicate!2473 acc!866))))

(declare-fun b!1367959 () Bool)

(assert (=> b!1367959 (= e!775199 e!775200)))

(declare-fun res!911457 () Bool)

(assert (=> b!1367959 (=> (not res!911457) (not e!775200))))

(assert (=> b!1367959 (= res!911457 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45169 0))(
  ( (Unit!45170) )
))
(declare-fun lt!601978 () Unit!45169)

(declare-fun noDuplicateSubseq!205 (List!31934 List!31934) Unit!45169)

(assert (=> b!1367959 (= lt!601978 (noDuplicateSubseq!205 newAcc!98 acc!866))))

(declare-fun res!911461 () Bool)

(assert (=> start!115692 (=> (not res!911461) (not e!775199))))

(assert (=> start!115692 (= res!911461 (and (bvslt (size!45416 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45416 a!3861))))))

(assert (=> start!115692 e!775199))

(declare-fun array_inv!33894 (array!92884) Bool)

(assert (=> start!115692 (array_inv!33894 a!3861)))

(assert (=> start!115692 true))

(declare-fun b!1367953 () Bool)

(declare-fun res!911464 () Bool)

(assert (=> b!1367953 (=> (not res!911464) (not e!775199))))

(assert (=> b!1367953 (= res!911464 (not (contains!9616 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115692 res!911461) b!1367958))

(assert (= (and b!1367958 res!911465) b!1367955))

(assert (= (and b!1367955 res!911458) b!1367950))

(assert (= (and b!1367950 res!911466) b!1367952))

(assert (= (and b!1367952 res!911460) b!1367953))

(assert (= (and b!1367953 res!911464) b!1367949))

(assert (= (and b!1367949 res!911459) b!1367959))

(assert (= (and b!1367959 res!911457) b!1367954))

(assert (= (and b!1367954 res!911467) b!1367956))

(assert (= (and b!1367956 res!911462) b!1367951))

(assert (= (and b!1367951 res!911463) b!1367957))

(declare-fun m!1252051 () Bool)

(assert (=> b!1367953 m!1252051))

(declare-fun m!1252053 () Bool)

(assert (=> b!1367956 m!1252053))

(assert (=> b!1367956 m!1252053))

(declare-fun m!1252055 () Bool)

(assert (=> b!1367956 m!1252055))

(declare-fun m!1252057 () Bool)

(assert (=> b!1367949 m!1252057))

(declare-fun m!1252059 () Bool)

(assert (=> start!115692 m!1252059))

(declare-fun m!1252061 () Bool)

(assert (=> b!1367958 m!1252061))

(declare-fun m!1252063 () Bool)

(assert (=> b!1367952 m!1252063))

(declare-fun m!1252065 () Bool)

(assert (=> b!1367959 m!1252065))

(declare-fun m!1252067 () Bool)

(assert (=> b!1367959 m!1252067))

(declare-fun m!1252069 () Bool)

(assert (=> b!1367955 m!1252069))

(declare-fun m!1252071 () Bool)

(assert (=> b!1367957 m!1252071))

(declare-fun m!1252073 () Bool)

(assert (=> b!1367950 m!1252073))

(push 1)

(assert (not b!1367949))

(assert (not b!1367950))

