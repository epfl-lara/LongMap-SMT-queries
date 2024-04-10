; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115688 () Bool)

(assert start!115688)

(declare-fun b!1367883 () Bool)

(declare-fun res!911398 () Bool)

(declare-fun e!775181 () Bool)

(assert (=> b!1367883 (=> (not res!911398) (not e!775181))))

(declare-datatypes ((List!31932 0))(
  ( (Nil!31929) (Cons!31928 (h!33137 (_ BitVec 64)) (t!46626 List!31932)) )
))
(declare-fun newAcc!98 () List!31932)

(declare-fun contains!9614 (List!31932 (_ BitVec 64)) Bool)

(assert (=> b!1367883 (= res!911398 (not (contains!9614 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367884 () Bool)

(declare-fun res!911400 () Bool)

(declare-fun e!775182 () Bool)

(assert (=> b!1367884 (=> (not res!911400) (not e!775182))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!92880 0))(
  ( (array!92881 (arr!44864 (Array (_ BitVec 32) (_ BitVec 64))) (size!45414 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92880)

(assert (=> b!1367884 (= res!911400 (bvslt from!3239 (size!45414 a!3861)))))

(declare-fun b!1367885 () Bool)

(assert (=> b!1367885 (= e!775182 false)))

(declare-fun acc!866 () List!31932)

(declare-fun lt!601966 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92880 (_ BitVec 32) List!31932) Bool)

(assert (=> b!1367885 (= lt!601966 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1367886 () Bool)

(declare-fun res!911391 () Bool)

(assert (=> b!1367886 (=> (not res!911391) (not e!775182))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367886 (= res!911391 (not (validKeyInArray!0 (select (arr!44864 a!3861) from!3239))))))

(declare-fun b!1367887 () Bool)

(declare-fun res!911397 () Bool)

(assert (=> b!1367887 (=> (not res!911397) (not e!775181))))

(declare-fun noDuplicate!2471 (List!31932) Bool)

(assert (=> b!1367887 (= res!911397 (noDuplicate!2471 acc!866))))

(declare-fun b!1367889 () Bool)

(declare-fun res!911392 () Bool)

(assert (=> b!1367889 (=> (not res!911392) (not e!775181))))

(declare-fun subseq!1016 (List!31932 List!31932) Bool)

(assert (=> b!1367889 (= res!911392 (subseq!1016 newAcc!98 acc!866))))

(declare-fun b!1367890 () Bool)

(assert (=> b!1367890 (= e!775181 e!775182)))

(declare-fun res!911395 () Bool)

(assert (=> b!1367890 (=> (not res!911395) (not e!775182))))

(assert (=> b!1367890 (= res!911395 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45165 0))(
  ( (Unit!45166) )
))
(declare-fun lt!601965 () Unit!45165)

(declare-fun noDuplicateSubseq!203 (List!31932 List!31932) Unit!45165)

(assert (=> b!1367890 (= lt!601965 (noDuplicateSubseq!203 newAcc!98 acc!866))))

(declare-fun b!1367891 () Bool)

(declare-fun res!911401 () Bool)

(assert (=> b!1367891 (=> (not res!911401) (not e!775181))))

(assert (=> b!1367891 (= res!911401 (not (contains!9614 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367892 () Bool)

(declare-fun res!911393 () Bool)

(assert (=> b!1367892 (=> (not res!911393) (not e!775182))))

(assert (=> b!1367892 (= res!911393 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1367893 () Bool)

(declare-fun res!911399 () Bool)

(assert (=> b!1367893 (=> (not res!911399) (not e!775181))))

(assert (=> b!1367893 (= res!911399 (not (contains!9614 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367888 () Bool)

(declare-fun res!911396 () Bool)

(assert (=> b!1367888 (=> (not res!911396) (not e!775181))))

(assert (=> b!1367888 (= res!911396 (not (contains!9614 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!911394 () Bool)

(assert (=> start!115688 (=> (not res!911394) (not e!775181))))

(assert (=> start!115688 (= res!911394 (and (bvslt (size!45414 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45414 a!3861))))))

(assert (=> start!115688 e!775181))

(declare-fun array_inv!33892 (array!92880) Bool)

(assert (=> start!115688 (array_inv!33892 a!3861)))

(assert (=> start!115688 true))

(assert (= (and start!115688 res!911394) b!1367887))

(assert (= (and b!1367887 res!911397) b!1367893))

(assert (= (and b!1367893 res!911399) b!1367891))

(assert (= (and b!1367891 res!911401) b!1367883))

(assert (= (and b!1367883 res!911398) b!1367888))

(assert (= (and b!1367888 res!911396) b!1367889))

(assert (= (and b!1367889 res!911392) b!1367890))

(assert (= (and b!1367890 res!911395) b!1367884))

(assert (= (and b!1367884 res!911400) b!1367886))

(assert (= (and b!1367886 res!911391) b!1367892))

(assert (= (and b!1367892 res!911393) b!1367885))

(declare-fun m!1252003 () Bool)

(assert (=> start!115688 m!1252003))

(declare-fun m!1252005 () Bool)

(assert (=> b!1367890 m!1252005))

(declare-fun m!1252007 () Bool)

(assert (=> b!1367890 m!1252007))

(declare-fun m!1252009 () Bool)

(assert (=> b!1367888 m!1252009))

(declare-fun m!1252011 () Bool)

(assert (=> b!1367887 m!1252011))

(declare-fun m!1252013 () Bool)

(assert (=> b!1367893 m!1252013))

(declare-fun m!1252015 () Bool)

(assert (=> b!1367891 m!1252015))

(declare-fun m!1252017 () Bool)

(assert (=> b!1367886 m!1252017))

(assert (=> b!1367886 m!1252017))

(declare-fun m!1252019 () Bool)

(assert (=> b!1367886 m!1252019))

(declare-fun m!1252021 () Bool)

(assert (=> b!1367889 m!1252021))

(declare-fun m!1252023 () Bool)

(assert (=> b!1367885 m!1252023))

(declare-fun m!1252025 () Bool)

(assert (=> b!1367883 m!1252025))

(push 1)

