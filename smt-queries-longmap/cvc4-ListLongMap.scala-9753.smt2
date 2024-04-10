; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115554 () Bool)

(assert start!115554)

(declare-fun b!1366845 () Bool)

(declare-fun res!910400 () Bool)

(declare-fun e!774674 () Bool)

(assert (=> b!1366845 (=> (not res!910400) (not e!774674))))

(declare-datatypes ((List!31910 0))(
  ( (Nil!31907) (Cons!31906 (h!33115 (_ BitVec 64)) (t!46604 List!31910)) )
))
(declare-fun acc!866 () List!31910)

(declare-fun contains!9592 (List!31910 (_ BitVec 64)) Bool)

(assert (=> b!1366845 (= res!910400 (not (contains!9592 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366846 () Bool)

(declare-fun res!910397 () Bool)

(assert (=> b!1366846 (=> (not res!910397) (not e!774674))))

(assert (=> b!1366846 (= res!910397 (not (contains!9592 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366847 () Bool)

(declare-fun e!774676 () Bool)

(assert (=> b!1366847 (= e!774676 (not true))))

(declare-datatypes ((Unit!45121 0))(
  ( (Unit!45122) )
))
(declare-fun lt!601708 () Unit!45121)

(declare-fun lt!601705 () List!31910)

(declare-fun lt!601706 () List!31910)

(declare-fun noDuplicateSubseq!181 (List!31910 List!31910) Unit!45121)

(assert (=> b!1366847 (= lt!601708 (noDuplicateSubseq!181 lt!601705 lt!601706))))

(declare-datatypes ((array!92830 0))(
  ( (array!92831 (arr!44842 (Array (_ BitVec 32) (_ BitVec 64))) (size!45392 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92830)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92830 (_ BitVec 32) List!31910) Bool)

(assert (=> b!1366847 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601705)))

(declare-fun lt!601704 () Unit!45121)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92830 List!31910 List!31910 (_ BitVec 32)) Unit!45121)

(assert (=> b!1366847 (= lt!601704 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!601706 lt!601705 (bvadd #b00000000000000000000000000000001 from!3239)))))

(declare-fun newAcc!98 () List!31910)

(assert (=> b!1366847 (= lt!601705 (Cons!31906 (select (arr!44842 a!3861) from!3239) newAcc!98))))

(assert (=> b!1366847 (= lt!601706 (Cons!31906 (select (arr!44842 a!3861) from!3239) acc!866))))

(declare-fun res!910395 () Bool)

(assert (=> start!115554 (=> (not res!910395) (not e!774674))))

(assert (=> start!115554 (= res!910395 (and (bvslt (size!45392 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45392 a!3861))))))

(assert (=> start!115554 e!774674))

(declare-fun array_inv!33870 (array!92830) Bool)

(assert (=> start!115554 (array_inv!33870 a!3861)))

(assert (=> start!115554 true))

(declare-fun b!1366848 () Bool)

(declare-fun res!910404 () Bool)

(assert (=> b!1366848 (=> (not res!910404) (not e!774676))))

(assert (=> b!1366848 (= res!910404 (not (contains!9592 acc!866 (select (arr!44842 a!3861) from!3239))))))

(declare-fun b!1366849 () Bool)

(declare-fun res!910402 () Bool)

(assert (=> b!1366849 (=> (not res!910402) (not e!774674))))

(assert (=> b!1366849 (= res!910402 (not (contains!9592 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366850 () Bool)

(declare-fun res!910398 () Bool)

(assert (=> b!1366850 (=> (not res!910398) (not e!774676))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366850 (= res!910398 (validKeyInArray!0 (select (arr!44842 a!3861) from!3239)))))

(declare-fun b!1366851 () Bool)

(declare-fun res!910401 () Bool)

(assert (=> b!1366851 (=> (not res!910401) (not e!774674))))

(declare-fun subseq!994 (List!31910 List!31910) Bool)

(assert (=> b!1366851 (= res!910401 (subseq!994 newAcc!98 acc!866))))

(declare-fun b!1366852 () Bool)

(assert (=> b!1366852 (= e!774674 e!774676)))

(declare-fun res!910399 () Bool)

(assert (=> b!1366852 (=> (not res!910399) (not e!774676))))

(assert (=> b!1366852 (= res!910399 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!601707 () Unit!45121)

(assert (=> b!1366852 (= lt!601707 (noDuplicateSubseq!181 newAcc!98 acc!866))))

(declare-fun b!1366853 () Bool)

(declare-fun res!910396 () Bool)

(assert (=> b!1366853 (=> (not res!910396) (not e!774674))))

(assert (=> b!1366853 (= res!910396 (not (contains!9592 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366854 () Bool)

(declare-fun res!910403 () Bool)

(assert (=> b!1366854 (=> (not res!910403) (not e!774674))))

(declare-fun noDuplicate!2449 (List!31910) Bool)

(assert (=> b!1366854 (= res!910403 (noDuplicate!2449 acc!866))))

(declare-fun b!1366855 () Bool)

(declare-fun res!910405 () Bool)

(assert (=> b!1366855 (=> (not res!910405) (not e!774676))))

(assert (=> b!1366855 (= res!910405 (bvslt from!3239 (size!45392 a!3861)))))

(assert (= (and start!115554 res!910395) b!1366854))

(assert (= (and b!1366854 res!910403) b!1366846))

(assert (= (and b!1366846 res!910397) b!1366845))

(assert (= (and b!1366845 res!910400) b!1366849))

(assert (= (and b!1366849 res!910402) b!1366853))

(assert (= (and b!1366853 res!910396) b!1366851))

(assert (= (and b!1366851 res!910401) b!1366852))

(assert (= (and b!1366852 res!910399) b!1366855))

(assert (= (and b!1366855 res!910405) b!1366850))

(assert (= (and b!1366850 res!910398) b!1366848))

(assert (= (and b!1366848 res!910404) b!1366847))

(declare-fun m!1251115 () Bool)

(assert (=> b!1366849 m!1251115))

(declare-fun m!1251117 () Bool)

(assert (=> b!1366850 m!1251117))

(assert (=> b!1366850 m!1251117))

(declare-fun m!1251119 () Bool)

(assert (=> b!1366850 m!1251119))

(declare-fun m!1251121 () Bool)

(assert (=> b!1366853 m!1251121))

(declare-fun m!1251123 () Bool)

(assert (=> b!1366852 m!1251123))

(declare-fun m!1251125 () Bool)

(assert (=> b!1366852 m!1251125))

(declare-fun m!1251127 () Bool)

(assert (=> b!1366854 m!1251127))

(declare-fun m!1251129 () Bool)

(assert (=> b!1366847 m!1251129))

(declare-fun m!1251131 () Bool)

(assert (=> b!1366847 m!1251131))

(declare-fun m!1251133 () Bool)

(assert (=> b!1366847 m!1251133))

(assert (=> b!1366847 m!1251117))

(declare-fun m!1251135 () Bool)

(assert (=> b!1366851 m!1251135))

(declare-fun m!1251137 () Bool)

(assert (=> b!1366845 m!1251137))

(declare-fun m!1251139 () Bool)

(assert (=> b!1366846 m!1251139))

(declare-fun m!1251141 () Bool)

(assert (=> start!115554 m!1251141))

(assert (=> b!1366848 m!1251117))

(assert (=> b!1366848 m!1251117))

(declare-fun m!1251143 () Bool)

(assert (=> b!1366848 m!1251143))

(push 1)

(assert (not b!1366852))

