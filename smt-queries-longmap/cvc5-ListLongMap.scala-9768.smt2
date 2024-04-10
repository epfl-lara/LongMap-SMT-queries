; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115730 () Bool)

(assert start!115730)

(declare-fun b!1368578 () Bool)

(declare-fun res!912086 () Bool)

(declare-fun e!775371 () Bool)

(assert (=> b!1368578 (=> (not res!912086) (not e!775371))))

(declare-datatypes ((List!31953 0))(
  ( (Nil!31950) (Cons!31949 (h!33158 (_ BitVec 64)) (t!46647 List!31953)) )
))
(declare-fun acc!866 () List!31953)

(declare-fun contains!9635 (List!31953 (_ BitVec 64)) Bool)

(assert (=> b!1368578 (= res!912086 (not (contains!9635 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368579 () Bool)

(declare-fun e!775372 () Bool)

(assert (=> b!1368579 (= e!775371 e!775372)))

(declare-fun res!912092 () Bool)

(assert (=> b!1368579 (=> (not res!912092) (not e!775372))))

(declare-datatypes ((array!92922 0))(
  ( (array!92923 (arr!44885 (Array (_ BitVec 32) (_ BitVec 64))) (size!45435 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92922)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92922 (_ BitVec 32) List!31953) Bool)

(assert (=> b!1368579 (= res!912092 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45207 0))(
  ( (Unit!45208) )
))
(declare-fun lt!602092 () Unit!45207)

(declare-fun newAcc!98 () List!31953)

(declare-fun noDuplicateSubseq!224 (List!31953 List!31953) Unit!45207)

(assert (=> b!1368579 (= lt!602092 (noDuplicateSubseq!224 newAcc!98 acc!866))))

(declare-fun b!1368580 () Bool)

(declare-fun res!912091 () Bool)

(assert (=> b!1368580 (=> (not res!912091) (not e!775371))))

(declare-fun subseq!1037 (List!31953 List!31953) Bool)

(assert (=> b!1368580 (= res!912091 (subseq!1037 newAcc!98 acc!866))))

(declare-fun b!1368581 () Bool)

(assert (=> b!1368581 (= e!775372 (not true))))

(assert (=> b!1368581 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-fun lt!602091 () Unit!45207)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92922 List!31953 List!31953 (_ BitVec 32)) Unit!45207)

(assert (=> b!1368581 (= lt!602091 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(declare-fun b!1368582 () Bool)

(declare-fun res!912087 () Bool)

(assert (=> b!1368582 (=> (not res!912087) (not e!775372))))

(assert (=> b!1368582 (= res!912087 (bvslt from!3239 (size!45435 a!3861)))))

(declare-fun b!1368583 () Bool)

(declare-fun res!912096 () Bool)

(assert (=> b!1368583 (=> (not res!912096) (not e!775372))))

(assert (=> b!1368583 (= res!912096 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun res!912090 () Bool)

(assert (=> start!115730 (=> (not res!912090) (not e!775371))))

(assert (=> start!115730 (= res!912090 (and (bvslt (size!45435 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45435 a!3861))))))

(assert (=> start!115730 e!775371))

(declare-fun array_inv!33913 (array!92922) Bool)

(assert (=> start!115730 (array_inv!33913 a!3861)))

(assert (=> start!115730 true))

(declare-fun b!1368584 () Bool)

(declare-fun res!912089 () Bool)

(assert (=> b!1368584 (=> (not res!912089) (not e!775371))))

(assert (=> b!1368584 (= res!912089 (not (contains!9635 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368585 () Bool)

(declare-fun res!912094 () Bool)

(assert (=> b!1368585 (=> (not res!912094) (not e!775371))))

(declare-fun noDuplicate!2492 (List!31953) Bool)

(assert (=> b!1368585 (= res!912094 (noDuplicate!2492 acc!866))))

(declare-fun b!1368586 () Bool)

(declare-fun res!912095 () Bool)

(assert (=> b!1368586 (=> (not res!912095) (not e!775372))))

(assert (=> b!1368586 (= res!912095 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368587 () Bool)

(declare-fun res!912088 () Bool)

(assert (=> b!1368587 (=> (not res!912088) (not e!775371))))

(assert (=> b!1368587 (= res!912088 (not (contains!9635 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368588 () Bool)

(declare-fun res!912093 () Bool)

(assert (=> b!1368588 (=> (not res!912093) (not e!775372))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368588 (= res!912093 (not (validKeyInArray!0 (select (arr!44885 a!3861) from!3239))))))

(declare-fun b!1368589 () Bool)

(declare-fun res!912097 () Bool)

(assert (=> b!1368589 (=> (not res!912097) (not e!775371))))

(assert (=> b!1368589 (= res!912097 (not (contains!9635 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115730 res!912090) b!1368585))

(assert (= (and b!1368585 res!912094) b!1368578))

(assert (= (and b!1368578 res!912086) b!1368589))

(assert (= (and b!1368589 res!912097) b!1368584))

(assert (= (and b!1368584 res!912089) b!1368587))

(assert (= (and b!1368587 res!912088) b!1368580))

(assert (= (and b!1368580 res!912091) b!1368579))

(assert (= (and b!1368579 res!912092) b!1368582))

(assert (= (and b!1368582 res!912087) b!1368588))

(assert (= (and b!1368588 res!912093) b!1368586))

(assert (= (and b!1368586 res!912095) b!1368583))

(assert (= (and b!1368583 res!912096) b!1368581))

(declare-fun m!1252507 () Bool)

(assert (=> b!1368581 m!1252507))

(declare-fun m!1252509 () Bool)

(assert (=> b!1368581 m!1252509))

(declare-fun m!1252511 () Bool)

(assert (=> b!1368584 m!1252511))

(declare-fun m!1252513 () Bool)

(assert (=> b!1368579 m!1252513))

(declare-fun m!1252515 () Bool)

(assert (=> b!1368579 m!1252515))

(declare-fun m!1252517 () Bool)

(assert (=> b!1368583 m!1252517))

(declare-fun m!1252519 () Bool)

(assert (=> b!1368580 m!1252519))

(declare-fun m!1252521 () Bool)

(assert (=> b!1368585 m!1252521))

(declare-fun m!1252523 () Bool)

(assert (=> start!115730 m!1252523))

(declare-fun m!1252525 () Bool)

(assert (=> b!1368578 m!1252525))

(declare-fun m!1252527 () Bool)

(assert (=> b!1368587 m!1252527))

(declare-fun m!1252529 () Bool)

(assert (=> b!1368589 m!1252529))

(declare-fun m!1252531 () Bool)

(assert (=> b!1368588 m!1252531))

(assert (=> b!1368588 m!1252531))

(declare-fun m!1252533 () Bool)

(assert (=> b!1368588 m!1252533))

(push 1)

