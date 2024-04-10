; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115800 () Bool)

(assert start!115800)

(declare-fun b!1369154 () Bool)

(declare-fun res!912634 () Bool)

(declare-fun e!775636 () Bool)

(assert (=> b!1369154 (=> (not res!912634) (not e!775636))))

(declare-datatypes ((List!31964 0))(
  ( (Nil!31961) (Cons!31960 (h!33169 (_ BitVec 64)) (t!46658 List!31964)) )
))
(declare-fun newAcc!98 () List!31964)

(declare-fun acc!866 () List!31964)

(declare-fun subseq!1048 (List!31964 List!31964) Bool)

(assert (=> b!1369154 (= res!912634 (subseq!1048 newAcc!98 acc!866))))

(declare-fun b!1369155 () Bool)

(declare-fun res!912643 () Bool)

(assert (=> b!1369155 (=> (not res!912643) (not e!775636))))

(declare-fun contains!9646 (List!31964 (_ BitVec 64)) Bool)

(assert (=> b!1369155 (= res!912643 (not (contains!9646 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369156 () Bool)

(declare-fun res!912632 () Bool)

(assert (=> b!1369156 (=> (not res!912632) (not e!775636))))

(assert (=> b!1369156 (= res!912632 (not (contains!9646 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!912637 () Bool)

(assert (=> start!115800 (=> (not res!912637) (not e!775636))))

(declare-datatypes ((array!92947 0))(
  ( (array!92948 (arr!44896 (Array (_ BitVec 32) (_ BitVec 64))) (size!45446 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92947)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115800 (= res!912637 (and (bvslt (size!45446 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45446 a!3861))))))

(assert (=> start!115800 e!775636))

(declare-fun array_inv!33924 (array!92947) Bool)

(assert (=> start!115800 (array_inv!33924 a!3861)))

(assert (=> start!115800 true))

(declare-fun b!1369157 () Bool)

(declare-fun res!912638 () Bool)

(assert (=> b!1369157 (=> (not res!912638) (not e!775636))))

(assert (=> b!1369157 (= res!912638 (not (contains!9646 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369158 () Bool)

(declare-fun res!912635 () Bool)

(declare-fun e!775635 () Bool)

(assert (=> b!1369158 (=> (not res!912635) (not e!775635))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1369158 (= res!912635 (not (validKeyInArray!0 (select (arr!44896 a!3861) from!3239))))))

(declare-fun b!1369159 () Bool)

(declare-fun res!912640 () Bool)

(assert (=> b!1369159 (=> (not res!912640) (not e!775636))))

(declare-fun noDuplicate!2503 (List!31964) Bool)

(assert (=> b!1369159 (= res!912640 (noDuplicate!2503 acc!866))))

(declare-fun b!1369160 () Bool)

(declare-fun res!912642 () Bool)

(assert (=> b!1369160 (=> (not res!912642) (not e!775635))))

(assert (=> b!1369160 (= res!912642 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1369161 () Bool)

(assert (=> b!1369161 (= e!775636 e!775635)))

(declare-fun res!912641 () Bool)

(assert (=> b!1369161 (=> (not res!912641) (not e!775635))))

(declare-fun arrayNoDuplicates!0 (array!92947 (_ BitVec 32) List!31964) Bool)

(assert (=> b!1369161 (= res!912641 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45229 0))(
  ( (Unit!45230) )
))
(declare-fun lt!602201 () Unit!45229)

(declare-fun noDuplicateSubseq!235 (List!31964 List!31964) Unit!45229)

(assert (=> b!1369161 (= lt!602201 (noDuplicateSubseq!235 newAcc!98 acc!866))))

(declare-fun b!1369162 () Bool)

(declare-fun res!912633 () Bool)

(assert (=> b!1369162 (=> (not res!912633) (not e!775635))))

(assert (=> b!1369162 (= res!912633 (bvslt from!3239 (size!45446 a!3861)))))

(declare-fun b!1369163 () Bool)

(declare-fun res!912636 () Bool)

(assert (=> b!1369163 (=> (not res!912636) (not e!775635))))

(assert (=> b!1369163 (= res!912636 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1369164 () Bool)

(declare-fun res!912639 () Bool)

(assert (=> b!1369164 (=> (not res!912639) (not e!775636))))

(assert (=> b!1369164 (= res!912639 (not (contains!9646 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369165 () Bool)

(assert (=> b!1369165 (= e!775635 (not true))))

(declare-fun lt!602202 () Bool)

(assert (=> b!1369165 (= lt!602202 (noDuplicate!2503 newAcc!98))))

(assert (=> b!1369165 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-fun lt!602203 () Unit!45229)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92947 List!31964 List!31964 (_ BitVec 32)) Unit!45229)

(assert (=> b!1369165 (= lt!602203 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (= (and start!115800 res!912637) b!1369159))

(assert (= (and b!1369159 res!912640) b!1369164))

(assert (= (and b!1369164 res!912639) b!1369157))

(assert (= (and b!1369157 res!912638) b!1369155))

(assert (= (and b!1369155 res!912643) b!1369156))

(assert (= (and b!1369156 res!912632) b!1369154))

(assert (= (and b!1369154 res!912634) b!1369161))

(assert (= (and b!1369161 res!912641) b!1369162))

(assert (= (and b!1369162 res!912633) b!1369158))

(assert (= (and b!1369158 res!912635) b!1369160))

(assert (= (and b!1369160 res!912642) b!1369163))

(assert (= (and b!1369163 res!912636) b!1369165))

(declare-fun m!1252981 () Bool)

(assert (=> b!1369157 m!1252981))

(declare-fun m!1252983 () Bool)

(assert (=> b!1369161 m!1252983))

(declare-fun m!1252985 () Bool)

(assert (=> b!1369161 m!1252985))

(declare-fun m!1252987 () Bool)

(assert (=> b!1369158 m!1252987))

(assert (=> b!1369158 m!1252987))

(declare-fun m!1252989 () Bool)

(assert (=> b!1369158 m!1252989))

(declare-fun m!1252991 () Bool)

(assert (=> b!1369163 m!1252991))

(declare-fun m!1252993 () Bool)

(assert (=> b!1369154 m!1252993))

(declare-fun m!1252995 () Bool)

(assert (=> b!1369165 m!1252995))

(declare-fun m!1252997 () Bool)

(assert (=> b!1369165 m!1252997))

(declare-fun m!1252999 () Bool)

(assert (=> b!1369165 m!1252999))

(declare-fun m!1253001 () Bool)

(assert (=> b!1369156 m!1253001))

(declare-fun m!1253003 () Bool)

(assert (=> b!1369159 m!1253003))

(declare-fun m!1253005 () Bool)

(assert (=> start!115800 m!1253005))

(declare-fun m!1253007 () Bool)

(assert (=> b!1369164 m!1253007))

(declare-fun m!1253009 () Bool)

(assert (=> b!1369155 m!1253009))

(push 1)

(assert (not b!1369158))

(assert (not b!1369161))

