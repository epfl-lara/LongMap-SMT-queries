; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115544 () Bool)

(assert start!115544)

(declare-fun b!1366680 () Bool)

(declare-fun res!910233 () Bool)

(declare-fun e!774631 () Bool)

(assert (=> b!1366680 (=> (not res!910233) (not e!774631))))

(declare-datatypes ((List!31905 0))(
  ( (Nil!31902) (Cons!31901 (h!33110 (_ BitVec 64)) (t!46599 List!31905)) )
))
(declare-fun acc!866 () List!31905)

(declare-fun contains!9587 (List!31905 (_ BitVec 64)) Bool)

(assert (=> b!1366680 (= res!910233 (not (contains!9587 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366681 () Bool)

(declare-fun res!910238 () Bool)

(declare-fun e!774629 () Bool)

(assert (=> b!1366681 (=> (not res!910238) (not e!774629))))

(declare-datatypes ((array!92820 0))(
  ( (array!92821 (arr!44837 (Array (_ BitVec 32) (_ BitVec 64))) (size!45387 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92820)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366681 (= res!910238 (validKeyInArray!0 (select (arr!44837 a!3861) from!3239)))))

(declare-fun b!1366682 () Bool)

(declare-fun res!910237 () Bool)

(assert (=> b!1366682 (=> (not res!910237) (not e!774629))))

(assert (=> b!1366682 (= res!910237 (not (contains!9587 acc!866 (select (arr!44837 a!3861) from!3239))))))

(declare-fun res!910235 () Bool)

(assert (=> start!115544 (=> (not res!910235) (not e!774631))))

(assert (=> start!115544 (= res!910235 (and (bvslt (size!45387 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45387 a!3861))))))

(assert (=> start!115544 e!774631))

(declare-fun array_inv!33865 (array!92820) Bool)

(assert (=> start!115544 (array_inv!33865 a!3861)))

(assert (=> start!115544 true))

(declare-fun b!1366683 () Bool)

(assert (=> b!1366683 (= e!774629 (not true))))

(declare-datatypes ((Unit!45111 0))(
  ( (Unit!45112) )
))
(declare-fun lt!601629 () Unit!45111)

(declare-fun lt!601631 () List!31905)

(declare-fun lt!601633 () List!31905)

(declare-fun noDuplicateSubseq!176 (List!31905 List!31905) Unit!45111)

(assert (=> b!1366683 (= lt!601629 (noDuplicateSubseq!176 lt!601631 lt!601633))))

(declare-fun arrayNoDuplicates!0 (array!92820 (_ BitVec 32) List!31905) Bool)

(assert (=> b!1366683 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601631)))

(declare-fun lt!601630 () Unit!45111)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92820 List!31905 List!31905 (_ BitVec 32)) Unit!45111)

(assert (=> b!1366683 (= lt!601630 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!601633 lt!601631 (bvadd #b00000000000000000000000000000001 from!3239)))))

(declare-fun newAcc!98 () List!31905)

(assert (=> b!1366683 (= lt!601631 (Cons!31901 (select (arr!44837 a!3861) from!3239) newAcc!98))))

(assert (=> b!1366683 (= lt!601633 (Cons!31901 (select (arr!44837 a!3861) from!3239) acc!866))))

(declare-fun b!1366684 () Bool)

(assert (=> b!1366684 (= e!774631 e!774629)))

(declare-fun res!910231 () Bool)

(assert (=> b!1366684 (=> (not res!910231) (not e!774629))))

(assert (=> b!1366684 (= res!910231 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!601632 () Unit!45111)

(assert (=> b!1366684 (= lt!601632 (noDuplicateSubseq!176 newAcc!98 acc!866))))

(declare-fun b!1366685 () Bool)

(declare-fun res!910236 () Bool)

(assert (=> b!1366685 (=> (not res!910236) (not e!774631))))

(declare-fun subseq!989 (List!31905 List!31905) Bool)

(assert (=> b!1366685 (= res!910236 (subseq!989 newAcc!98 acc!866))))

(declare-fun b!1366686 () Bool)

(declare-fun res!910240 () Bool)

(assert (=> b!1366686 (=> (not res!910240) (not e!774631))))

(declare-fun noDuplicate!2444 (List!31905) Bool)

(assert (=> b!1366686 (= res!910240 (noDuplicate!2444 acc!866))))

(declare-fun b!1366687 () Bool)

(declare-fun res!910234 () Bool)

(assert (=> b!1366687 (=> (not res!910234) (not e!774631))))

(assert (=> b!1366687 (= res!910234 (not (contains!9587 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366688 () Bool)

(declare-fun res!910232 () Bool)

(assert (=> b!1366688 (=> (not res!910232) (not e!774631))))

(assert (=> b!1366688 (= res!910232 (not (contains!9587 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366689 () Bool)

(declare-fun res!910230 () Bool)

(assert (=> b!1366689 (=> (not res!910230) (not e!774631))))

(assert (=> b!1366689 (= res!910230 (not (contains!9587 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366690 () Bool)

(declare-fun res!910239 () Bool)

(assert (=> b!1366690 (=> (not res!910239) (not e!774629))))

(assert (=> b!1366690 (= res!910239 (bvslt from!3239 (size!45387 a!3861)))))

(assert (= (and start!115544 res!910235) b!1366686))

(assert (= (and b!1366686 res!910240) b!1366688))

(assert (= (and b!1366688 res!910232) b!1366680))

(assert (= (and b!1366680 res!910233) b!1366689))

(assert (= (and b!1366689 res!910230) b!1366687))

(assert (= (and b!1366687 res!910234) b!1366685))

(assert (= (and b!1366685 res!910236) b!1366684))

(assert (= (and b!1366684 res!910231) b!1366690))

(assert (= (and b!1366690 res!910239) b!1366681))

(assert (= (and b!1366681 res!910238) b!1366682))

(assert (= (and b!1366682 res!910237) b!1366683))

(declare-fun m!1250965 () Bool)

(assert (=> b!1366687 m!1250965))

(declare-fun m!1250967 () Bool)

(assert (=> b!1366688 m!1250967))

(declare-fun m!1250969 () Bool)

(assert (=> b!1366681 m!1250969))

(assert (=> b!1366681 m!1250969))

(declare-fun m!1250971 () Bool)

(assert (=> b!1366681 m!1250971))

(declare-fun m!1250973 () Bool)

(assert (=> b!1366680 m!1250973))

(declare-fun m!1250975 () Bool)

(assert (=> b!1366683 m!1250975))

(declare-fun m!1250977 () Bool)

(assert (=> b!1366683 m!1250977))

(declare-fun m!1250979 () Bool)

(assert (=> b!1366683 m!1250979))

(assert (=> b!1366683 m!1250969))

(declare-fun m!1250981 () Bool)

(assert (=> b!1366686 m!1250981))

(declare-fun m!1250983 () Bool)

(assert (=> b!1366689 m!1250983))

(declare-fun m!1250985 () Bool)

(assert (=> b!1366685 m!1250985))

(assert (=> b!1366682 m!1250969))

(assert (=> b!1366682 m!1250969))

(declare-fun m!1250987 () Bool)

(assert (=> b!1366682 m!1250987))

(declare-fun m!1250989 () Bool)

(assert (=> b!1366684 m!1250989))

(declare-fun m!1250991 () Bool)

(assert (=> b!1366684 m!1250991))

(declare-fun m!1250993 () Bool)

(assert (=> start!115544 m!1250993))

(push 1)

