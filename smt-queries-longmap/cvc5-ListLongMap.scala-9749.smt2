; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115478 () Bool)

(assert start!115478)

(declare-fun b!1366079 () Bool)

(declare-fun res!909655 () Bool)

(declare-fun e!774354 () Bool)

(assert (=> b!1366079 (=> (not res!909655) (not e!774354))))

(declare-datatypes ((List!31896 0))(
  ( (Nil!31893) (Cons!31892 (h!33101 (_ BitVec 64)) (t!46590 List!31896)) )
))
(declare-fun newAcc!98 () List!31896)

(declare-fun contains!9578 (List!31896 (_ BitVec 64)) Bool)

(assert (=> b!1366079 (= res!909655 (not (contains!9578 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!909662 () Bool)

(assert (=> start!115478 (=> (not res!909662) (not e!774354))))

(declare-datatypes ((array!92799 0))(
  ( (array!92800 (arr!44828 (Array (_ BitVec 32) (_ BitVec 64))) (size!45378 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92799)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115478 (= res!909662 (and (bvslt (size!45378 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45378 a!3861))))))

(assert (=> start!115478 e!774354))

(declare-fun array_inv!33856 (array!92799) Bool)

(assert (=> start!115478 (array_inv!33856 a!3861)))

(assert (=> start!115478 true))

(declare-fun b!1366080 () Bool)

(declare-fun res!909664 () Bool)

(declare-fun e!774353 () Bool)

(assert (=> b!1366080 (=> (not res!909664) (not e!774353))))

(declare-fun lt!601466 () List!31896)

(assert (=> b!1366080 (= res!909664 (not (contains!9578 lt!601466 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366081 () Bool)

(declare-fun res!909654 () Bool)

(assert (=> b!1366081 (=> (not res!909654) (not e!774353))))

(declare-fun lt!601465 () List!31896)

(assert (=> b!1366081 (= res!909654 (not (contains!9578 lt!601465 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366082 () Bool)

(declare-fun res!909653 () Bool)

(assert (=> b!1366082 (=> (not res!909653) (not e!774354))))

(declare-fun acc!866 () List!31896)

(declare-fun subseq!980 (List!31896 List!31896) Bool)

(assert (=> b!1366082 (= res!909653 (subseq!980 newAcc!98 acc!866))))

(declare-fun b!1366083 () Bool)

(declare-fun res!909667 () Bool)

(assert (=> b!1366083 (=> (not res!909667) (not e!774353))))

(assert (=> b!1366083 (= res!909667 (not (contains!9578 lt!601466 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366084 () Bool)

(declare-fun res!909669 () Bool)

(assert (=> b!1366084 (=> (not res!909669) (not e!774354))))

(assert (=> b!1366084 (= res!909669 (not (contains!9578 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366085 () Bool)

(declare-fun res!909670 () Bool)

(declare-fun e!774352 () Bool)

(assert (=> b!1366085 (=> (not res!909670) (not e!774352))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366085 (= res!909670 (validKeyInArray!0 (select (arr!44828 a!3861) from!3239)))))

(declare-fun b!1366086 () Bool)

(declare-fun res!909668 () Bool)

(assert (=> b!1366086 (=> (not res!909668) (not e!774353))))

(assert (=> b!1366086 (= res!909668 (not (contains!9578 lt!601465 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366087 () Bool)

(declare-fun res!909658 () Bool)

(assert (=> b!1366087 (=> (not res!909658) (not e!774354))))

(assert (=> b!1366087 (= res!909658 (not (contains!9578 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366088 () Bool)

(declare-fun res!909661 () Bool)

(assert (=> b!1366088 (=> (not res!909661) (not e!774353))))

(assert (=> b!1366088 (= res!909661 (subseq!980 lt!601465 lt!601466))))

(declare-fun b!1366089 () Bool)

(assert (=> b!1366089 (= e!774352 e!774353)))

(declare-fun res!909659 () Bool)

(assert (=> b!1366089 (=> (not res!909659) (not e!774353))))

(assert (=> b!1366089 (= res!909659 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1366089 (= lt!601465 (Cons!31892 (select (arr!44828 a!3861) from!3239) newAcc!98))))

(assert (=> b!1366089 (= lt!601466 (Cons!31892 (select (arr!44828 a!3861) from!3239) acc!866))))

(declare-fun b!1366090 () Bool)

(declare-fun res!909656 () Bool)

(assert (=> b!1366090 (=> (not res!909656) (not e!774352))))

(assert (=> b!1366090 (= res!909656 (not (contains!9578 acc!866 (select (arr!44828 a!3861) from!3239))))))

(declare-fun b!1366091 () Bool)

(assert (=> b!1366091 (= e!774353 false)))

(declare-fun lt!601467 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92799 (_ BitVec 32) List!31896) Bool)

(assert (=> b!1366091 (= lt!601467 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601466))))

(declare-datatypes ((Unit!45093 0))(
  ( (Unit!45094) )
))
(declare-fun lt!601464 () Unit!45093)

(declare-fun noDuplicateSubseq!167 (List!31896 List!31896) Unit!45093)

(assert (=> b!1366091 (= lt!601464 (noDuplicateSubseq!167 lt!601465 lt!601466))))

(declare-fun b!1366092 () Bool)

(declare-fun res!909660 () Bool)

(assert (=> b!1366092 (=> (not res!909660) (not e!774352))))

(assert (=> b!1366092 (= res!909660 (bvslt from!3239 (size!45378 a!3861)))))

(declare-fun b!1366093 () Bool)

(declare-fun res!909665 () Bool)

(assert (=> b!1366093 (=> (not res!909665) (not e!774354))))

(assert (=> b!1366093 (= res!909665 (not (contains!9578 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366094 () Bool)

(assert (=> b!1366094 (= e!774354 e!774352)))

(declare-fun res!909663 () Bool)

(assert (=> b!1366094 (=> (not res!909663) (not e!774352))))

(assert (=> b!1366094 (= res!909663 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!601468 () Unit!45093)

(assert (=> b!1366094 (= lt!601468 (noDuplicateSubseq!167 newAcc!98 acc!866))))

(declare-fun b!1366095 () Bool)

(declare-fun res!909657 () Bool)

(assert (=> b!1366095 (=> (not res!909657) (not e!774353))))

(declare-fun noDuplicate!2435 (List!31896) Bool)

(assert (=> b!1366095 (= res!909657 (noDuplicate!2435 lt!601466))))

(declare-fun b!1366096 () Bool)

(declare-fun res!909666 () Bool)

(assert (=> b!1366096 (=> (not res!909666) (not e!774354))))

(assert (=> b!1366096 (= res!909666 (noDuplicate!2435 acc!866))))

(assert (= (and start!115478 res!909662) b!1366096))

(assert (= (and b!1366096 res!909666) b!1366093))

(assert (= (and b!1366093 res!909665) b!1366084))

(assert (= (and b!1366084 res!909669) b!1366087))

(assert (= (and b!1366087 res!909658) b!1366079))

(assert (= (and b!1366079 res!909655) b!1366082))

(assert (= (and b!1366082 res!909653) b!1366094))

(assert (= (and b!1366094 res!909663) b!1366092))

(assert (= (and b!1366092 res!909660) b!1366085))

(assert (= (and b!1366085 res!909670) b!1366090))

(assert (= (and b!1366090 res!909656) b!1366089))

(assert (= (and b!1366089 res!909659) b!1366095))

(assert (= (and b!1366095 res!909657) b!1366080))

(assert (= (and b!1366080 res!909664) b!1366083))

(assert (= (and b!1366083 res!909667) b!1366086))

(assert (= (and b!1366086 res!909668) b!1366081))

(assert (= (and b!1366081 res!909654) b!1366088))

(assert (= (and b!1366088 res!909661) b!1366091))

(declare-fun m!1250461 () Bool)

(assert (=> b!1366088 m!1250461))

(declare-fun m!1250463 () Bool)

(assert (=> b!1366086 m!1250463))

(declare-fun m!1250465 () Bool)

(assert (=> start!115478 m!1250465))

(declare-fun m!1250467 () Bool)

(assert (=> b!1366090 m!1250467))

(assert (=> b!1366090 m!1250467))

(declare-fun m!1250469 () Bool)

(assert (=> b!1366090 m!1250469))

(assert (=> b!1366085 m!1250467))

(assert (=> b!1366085 m!1250467))

(declare-fun m!1250471 () Bool)

(assert (=> b!1366085 m!1250471))

(declare-fun m!1250473 () Bool)

(assert (=> b!1366091 m!1250473))

(declare-fun m!1250475 () Bool)

(assert (=> b!1366091 m!1250475))

(declare-fun m!1250477 () Bool)

(assert (=> b!1366081 m!1250477))

(declare-fun m!1250479 () Bool)

(assert (=> b!1366096 m!1250479))

(declare-fun m!1250481 () Bool)

(assert (=> b!1366087 m!1250481))

(assert (=> b!1366089 m!1250467))

(declare-fun m!1250483 () Bool)

(assert (=> b!1366079 m!1250483))

(declare-fun m!1250485 () Bool)

(assert (=> b!1366094 m!1250485))

(declare-fun m!1250487 () Bool)

(assert (=> b!1366094 m!1250487))

(declare-fun m!1250489 () Bool)

(assert (=> b!1366083 m!1250489))

(declare-fun m!1250491 () Bool)

(assert (=> b!1366095 m!1250491))

(declare-fun m!1250493 () Bool)

(assert (=> b!1366082 m!1250493))

(declare-fun m!1250495 () Bool)

(assert (=> b!1366093 m!1250495))

(declare-fun m!1250497 () Bool)

(assert (=> b!1366080 m!1250497))

(declare-fun m!1250499 () Bool)

(assert (=> b!1366084 m!1250499))

(push 1)

