; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115458 () Bool)

(assert start!115458)

(declare-fun b!1365539 () Bool)

(declare-fun res!909114 () Bool)

(declare-fun e!774233 () Bool)

(assert (=> b!1365539 (=> (not res!909114) (not e!774233))))

(declare-datatypes ((List!31886 0))(
  ( (Nil!31883) (Cons!31882 (h!33091 (_ BitVec 64)) (t!46580 List!31886)) )
))
(declare-fun lt!601317 () List!31886)

(declare-fun contains!9568 (List!31886 (_ BitVec 64)) Bool)

(assert (=> b!1365539 (= res!909114 (not (contains!9568 lt!601317 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365540 () Bool)

(declare-fun res!909121 () Bool)

(assert (=> b!1365540 (=> (not res!909121) (not e!774233))))

(declare-fun lt!601316 () List!31886)

(declare-fun noDuplicate!2425 (List!31886) Bool)

(assert (=> b!1365540 (= res!909121 (noDuplicate!2425 lt!601316))))

(declare-fun b!1365541 () Bool)

(declare-fun e!774232 () Bool)

(assert (=> b!1365541 (= e!774232 e!774233)))

(declare-fun res!909120 () Bool)

(assert (=> b!1365541 (=> (not res!909120) (not e!774233))))

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1365541 (= res!909120 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-datatypes ((array!92779 0))(
  ( (array!92780 (arr!44818 (Array (_ BitVec 32) (_ BitVec 64))) (size!45368 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92779)

(declare-fun newAcc!98 () List!31886)

(assert (=> b!1365541 (= lt!601317 (Cons!31882 (select (arr!44818 a!3861) from!3239) newAcc!98))))

(declare-fun acc!866 () List!31886)

(assert (=> b!1365541 (= lt!601316 (Cons!31882 (select (arr!44818 a!3861) from!3239) acc!866))))

(declare-fun b!1365542 () Bool)

(declare-fun res!909128 () Bool)

(assert (=> b!1365542 (=> (not res!909128) (not e!774232))))

(assert (=> b!1365542 (= res!909128 (bvslt from!3239 (size!45368 a!3861)))))

(declare-fun b!1365543 () Bool)

(declare-fun res!909113 () Bool)

(declare-fun e!774234 () Bool)

(assert (=> b!1365543 (=> (not res!909113) (not e!774234))))

(assert (=> b!1365543 (= res!909113 (not (contains!9568 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!909118 () Bool)

(assert (=> start!115458 (=> (not res!909118) (not e!774234))))

(assert (=> start!115458 (= res!909118 (and (bvslt (size!45368 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45368 a!3861))))))

(assert (=> start!115458 e!774234))

(declare-fun array_inv!33846 (array!92779) Bool)

(assert (=> start!115458 (array_inv!33846 a!3861)))

(assert (=> start!115458 true))

(declare-fun b!1365544 () Bool)

(declare-fun res!909122 () Bool)

(assert (=> b!1365544 (=> (not res!909122) (not e!774233))))

(assert (=> b!1365544 (= res!909122 (not (contains!9568 lt!601317 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365545 () Bool)

(assert (=> b!1365545 (= e!774234 e!774232)))

(declare-fun res!909116 () Bool)

(assert (=> b!1365545 (=> (not res!909116) (not e!774232))))

(declare-fun arrayNoDuplicates!0 (array!92779 (_ BitVec 32) List!31886) Bool)

(assert (=> b!1365545 (= res!909116 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45073 0))(
  ( (Unit!45074) )
))
(declare-fun lt!601315 () Unit!45073)

(declare-fun noDuplicateSubseq!157 (List!31886 List!31886) Unit!45073)

(assert (=> b!1365545 (= lt!601315 (noDuplicateSubseq!157 newAcc!98 acc!866))))

(declare-fun b!1365546 () Bool)

(declare-fun res!909125 () Bool)

(assert (=> b!1365546 (=> (not res!909125) (not e!774233))))

(declare-fun subseq!970 (List!31886 List!31886) Bool)

(assert (=> b!1365546 (= res!909125 (subseq!970 lt!601317 lt!601316))))

(declare-fun b!1365547 () Bool)

(declare-fun res!909115 () Bool)

(assert (=> b!1365547 (=> (not res!909115) (not e!774234))))

(assert (=> b!1365547 (= res!909115 (not (contains!9568 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365548 () Bool)

(declare-fun res!909119 () Bool)

(assert (=> b!1365548 (=> (not res!909119) (not e!774234))))

(assert (=> b!1365548 (= res!909119 (not (contains!9568 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365549 () Bool)

(declare-fun res!909127 () Bool)

(assert (=> b!1365549 (=> (not res!909127) (not e!774234))))

(assert (=> b!1365549 (= res!909127 (noDuplicate!2425 acc!866))))

(declare-fun b!1365550 () Bool)

(declare-fun res!909126 () Bool)

(assert (=> b!1365550 (=> (not res!909126) (not e!774233))))

(assert (=> b!1365550 (= res!909126 (not (contains!9568 lt!601316 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365551 () Bool)

(assert (=> b!1365551 (= e!774233 false)))

(declare-fun lt!601314 () Bool)

(assert (=> b!1365551 (= lt!601314 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601316))))

(declare-fun lt!601318 () Unit!45073)

(assert (=> b!1365551 (= lt!601318 (noDuplicateSubseq!157 lt!601317 lt!601316))))

(declare-fun b!1365552 () Bool)

(declare-fun res!909123 () Bool)

(assert (=> b!1365552 (=> (not res!909123) (not e!774233))))

(assert (=> b!1365552 (= res!909123 (not (contains!9568 lt!601316 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365553 () Bool)

(declare-fun res!909129 () Bool)

(assert (=> b!1365553 (=> (not res!909129) (not e!774232))))

(assert (=> b!1365553 (= res!909129 (not (contains!9568 acc!866 (select (arr!44818 a!3861) from!3239))))))

(declare-fun b!1365554 () Bool)

(declare-fun res!909117 () Bool)

(assert (=> b!1365554 (=> (not res!909117) (not e!774234))))

(assert (=> b!1365554 (= res!909117 (not (contains!9568 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365555 () Bool)

(declare-fun res!909130 () Bool)

(assert (=> b!1365555 (=> (not res!909130) (not e!774234))))

(assert (=> b!1365555 (= res!909130 (subseq!970 newAcc!98 acc!866))))

(declare-fun b!1365556 () Bool)

(declare-fun res!909124 () Bool)

(assert (=> b!1365556 (=> (not res!909124) (not e!774232))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1365556 (= res!909124 (validKeyInArray!0 (select (arr!44818 a!3861) from!3239)))))

(assert (= (and start!115458 res!909118) b!1365549))

(assert (= (and b!1365549 res!909127) b!1365547))

(assert (= (and b!1365547 res!909115) b!1365554))

(assert (= (and b!1365554 res!909117) b!1365543))

(assert (= (and b!1365543 res!909113) b!1365548))

(assert (= (and b!1365548 res!909119) b!1365555))

(assert (= (and b!1365555 res!909130) b!1365545))

(assert (= (and b!1365545 res!909116) b!1365542))

(assert (= (and b!1365542 res!909128) b!1365556))

(assert (= (and b!1365556 res!909124) b!1365553))

(assert (= (and b!1365553 res!909129) b!1365541))

(assert (= (and b!1365541 res!909120) b!1365540))

(assert (= (and b!1365540 res!909121) b!1365552))

(assert (= (and b!1365552 res!909123) b!1365550))

(assert (= (and b!1365550 res!909126) b!1365544))

(assert (= (and b!1365544 res!909122) b!1365539))

(assert (= (and b!1365539 res!909114) b!1365546))

(assert (= (and b!1365546 res!909125) b!1365551))

(declare-fun m!1250061 () Bool)

(assert (=> b!1365556 m!1250061))

(assert (=> b!1365556 m!1250061))

(declare-fun m!1250063 () Bool)

(assert (=> b!1365556 m!1250063))

(declare-fun m!1250065 () Bool)

(assert (=> b!1365547 m!1250065))

(declare-fun m!1250067 () Bool)

(assert (=> b!1365539 m!1250067))

(declare-fun m!1250069 () Bool)

(assert (=> start!115458 m!1250069))

(declare-fun m!1250071 () Bool)

(assert (=> b!1365549 m!1250071))

(declare-fun m!1250073 () Bool)

(assert (=> b!1365544 m!1250073))

(declare-fun m!1250075 () Bool)

(assert (=> b!1365543 m!1250075))

(declare-fun m!1250077 () Bool)

(assert (=> b!1365552 m!1250077))

(declare-fun m!1250079 () Bool)

(assert (=> b!1365545 m!1250079))

(declare-fun m!1250081 () Bool)

(assert (=> b!1365545 m!1250081))

(assert (=> b!1365541 m!1250061))

(declare-fun m!1250083 () Bool)

(assert (=> b!1365551 m!1250083))

(declare-fun m!1250085 () Bool)

(assert (=> b!1365551 m!1250085))

(assert (=> b!1365553 m!1250061))

(assert (=> b!1365553 m!1250061))

(declare-fun m!1250087 () Bool)

(assert (=> b!1365553 m!1250087))

(declare-fun m!1250089 () Bool)

(assert (=> b!1365548 m!1250089))

(declare-fun m!1250091 () Bool)

(assert (=> b!1365550 m!1250091))

(declare-fun m!1250093 () Bool)

(assert (=> b!1365555 m!1250093))

(declare-fun m!1250095 () Bool)

(assert (=> b!1365540 m!1250095))

(declare-fun m!1250097 () Bool)

(assert (=> b!1365546 m!1250097))

(declare-fun m!1250099 () Bool)

(assert (=> b!1365554 m!1250099))

(push 1)

