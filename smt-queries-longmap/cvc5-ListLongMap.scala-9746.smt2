; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115460 () Bool)

(assert start!115460)

(declare-fun b!1365593 () Bool)

(declare-fun res!909173 () Bool)

(declare-fun e!774247 () Bool)

(assert (=> b!1365593 (=> (not res!909173) (not e!774247))))

(declare-datatypes ((List!31887 0))(
  ( (Nil!31884) (Cons!31883 (h!33092 (_ BitVec 64)) (t!46581 List!31887)) )
))
(declare-fun newAcc!98 () List!31887)

(declare-fun contains!9569 (List!31887 (_ BitVec 64)) Bool)

(assert (=> b!1365593 (= res!909173 (not (contains!9569 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365594 () Bool)

(declare-fun e!774244 () Bool)

(declare-fun e!774246 () Bool)

(assert (=> b!1365594 (= e!774244 e!774246)))

(declare-fun res!909182 () Bool)

(assert (=> b!1365594 (=> (not res!909182) (not e!774246))))

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1365594 (= res!909182 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-datatypes ((array!92781 0))(
  ( (array!92782 (arr!44819 (Array (_ BitVec 32) (_ BitVec 64))) (size!45369 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92781)

(declare-fun lt!601333 () List!31887)

(assert (=> b!1365594 (= lt!601333 (Cons!31883 (select (arr!44819 a!3861) from!3239) newAcc!98))))

(declare-fun lt!601331 () List!31887)

(declare-fun acc!866 () List!31887)

(assert (=> b!1365594 (= lt!601331 (Cons!31883 (select (arr!44819 a!3861) from!3239) acc!866))))

(declare-fun res!909179 () Bool)

(assert (=> start!115460 (=> (not res!909179) (not e!774247))))

(assert (=> start!115460 (= res!909179 (and (bvslt (size!45369 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45369 a!3861))))))

(assert (=> start!115460 e!774247))

(declare-fun array_inv!33847 (array!92781) Bool)

(assert (=> start!115460 (array_inv!33847 a!3861)))

(assert (=> start!115460 true))

(declare-fun b!1365595 () Bool)

(declare-fun res!909171 () Bool)

(assert (=> b!1365595 (=> (not res!909171) (not e!774247))))

(assert (=> b!1365595 (= res!909171 (not (contains!9569 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365596 () Bool)

(declare-fun res!909169 () Bool)

(assert (=> b!1365596 (=> (not res!909169) (not e!774246))))

(assert (=> b!1365596 (= res!909169 (not (contains!9569 lt!601333 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365597 () Bool)

(declare-fun res!909172 () Bool)

(assert (=> b!1365597 (=> (not res!909172) (not e!774244))))

(assert (=> b!1365597 (= res!909172 (not (contains!9569 acc!866 (select (arr!44819 a!3861) from!3239))))))

(declare-fun b!1365598 () Bool)

(declare-fun res!909177 () Bool)

(assert (=> b!1365598 (=> (not res!909177) (not e!774247))))

(assert (=> b!1365598 (= res!909177 (not (contains!9569 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365599 () Bool)

(declare-fun res!909184 () Bool)

(assert (=> b!1365599 (=> (not res!909184) (not e!774247))))

(assert (=> b!1365599 (= res!909184 (not (contains!9569 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365600 () Bool)

(declare-fun res!909174 () Bool)

(assert (=> b!1365600 (=> (not res!909174) (not e!774244))))

(assert (=> b!1365600 (= res!909174 (bvslt from!3239 (size!45369 a!3861)))))

(declare-fun b!1365601 () Bool)

(declare-fun res!909180 () Bool)

(assert (=> b!1365601 (=> (not res!909180) (not e!774246))))

(declare-fun subseq!971 (List!31887 List!31887) Bool)

(assert (=> b!1365601 (= res!909180 (subseq!971 lt!601333 lt!601331))))

(declare-fun b!1365602 () Bool)

(declare-fun res!909176 () Bool)

(assert (=> b!1365602 (=> (not res!909176) (not e!774247))))

(assert (=> b!1365602 (= res!909176 (subseq!971 newAcc!98 acc!866))))

(declare-fun b!1365603 () Bool)

(assert (=> b!1365603 (= e!774246 false)))

(declare-fun lt!601329 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92781 (_ BitVec 32) List!31887) Bool)

(assert (=> b!1365603 (= lt!601329 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601331))))

(declare-datatypes ((Unit!45075 0))(
  ( (Unit!45076) )
))
(declare-fun lt!601330 () Unit!45075)

(declare-fun noDuplicateSubseq!158 (List!31887 List!31887) Unit!45075)

(assert (=> b!1365603 (= lt!601330 (noDuplicateSubseq!158 lt!601333 lt!601331))))

(declare-fun b!1365604 () Bool)

(assert (=> b!1365604 (= e!774247 e!774244)))

(declare-fun res!909168 () Bool)

(assert (=> b!1365604 (=> (not res!909168) (not e!774244))))

(assert (=> b!1365604 (= res!909168 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!601332 () Unit!45075)

(assert (=> b!1365604 (= lt!601332 (noDuplicateSubseq!158 newAcc!98 acc!866))))

(declare-fun b!1365605 () Bool)

(declare-fun res!909181 () Bool)

(assert (=> b!1365605 (=> (not res!909181) (not e!774244))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1365605 (= res!909181 (validKeyInArray!0 (select (arr!44819 a!3861) from!3239)))))

(declare-fun b!1365606 () Bool)

(declare-fun res!909175 () Bool)

(assert (=> b!1365606 (=> (not res!909175) (not e!774246))))

(assert (=> b!1365606 (= res!909175 (not (contains!9569 lt!601331 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365607 () Bool)

(declare-fun res!909178 () Bool)

(assert (=> b!1365607 (=> (not res!909178) (not e!774246))))

(assert (=> b!1365607 (= res!909178 (not (contains!9569 lt!601333 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365608 () Bool)

(declare-fun res!909170 () Bool)

(assert (=> b!1365608 (=> (not res!909170) (not e!774247))))

(declare-fun noDuplicate!2426 (List!31887) Bool)

(assert (=> b!1365608 (= res!909170 (noDuplicate!2426 acc!866))))

(declare-fun b!1365609 () Bool)

(declare-fun res!909183 () Bool)

(assert (=> b!1365609 (=> (not res!909183) (not e!774246))))

(assert (=> b!1365609 (= res!909183 (not (contains!9569 lt!601331 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365610 () Bool)

(declare-fun res!909167 () Bool)

(assert (=> b!1365610 (=> (not res!909167) (not e!774246))))

(assert (=> b!1365610 (= res!909167 (noDuplicate!2426 lt!601331))))

(assert (= (and start!115460 res!909179) b!1365608))

(assert (= (and b!1365608 res!909170) b!1365598))

(assert (= (and b!1365598 res!909177) b!1365595))

(assert (= (and b!1365595 res!909171) b!1365593))

(assert (= (and b!1365593 res!909173) b!1365599))

(assert (= (and b!1365599 res!909184) b!1365602))

(assert (= (and b!1365602 res!909176) b!1365604))

(assert (= (and b!1365604 res!909168) b!1365600))

(assert (= (and b!1365600 res!909174) b!1365605))

(assert (= (and b!1365605 res!909181) b!1365597))

(assert (= (and b!1365597 res!909172) b!1365594))

(assert (= (and b!1365594 res!909182) b!1365610))

(assert (= (and b!1365610 res!909167) b!1365606))

(assert (= (and b!1365606 res!909175) b!1365609))

(assert (= (and b!1365609 res!909183) b!1365596))

(assert (= (and b!1365596 res!909169) b!1365607))

(assert (= (and b!1365607 res!909178) b!1365601))

(assert (= (and b!1365601 res!909180) b!1365603))

(declare-fun m!1250101 () Bool)

(assert (=> b!1365606 m!1250101))

(declare-fun m!1250103 () Bool)

(assert (=> b!1365610 m!1250103))

(declare-fun m!1250105 () Bool)

(assert (=> b!1365605 m!1250105))

(assert (=> b!1365605 m!1250105))

(declare-fun m!1250107 () Bool)

(assert (=> b!1365605 m!1250107))

(declare-fun m!1250109 () Bool)

(assert (=> b!1365596 m!1250109))

(declare-fun m!1250111 () Bool)

(assert (=> b!1365608 m!1250111))

(declare-fun m!1250113 () Bool)

(assert (=> b!1365599 m!1250113))

(declare-fun m!1250115 () Bool)

(assert (=> b!1365593 m!1250115))

(assert (=> b!1365594 m!1250105))

(declare-fun m!1250117 () Bool)

(assert (=> b!1365602 m!1250117))

(declare-fun m!1250119 () Bool)

(assert (=> b!1365601 m!1250119))

(declare-fun m!1250121 () Bool)

(assert (=> start!115460 m!1250121))

(declare-fun m!1250123 () Bool)

(assert (=> b!1365603 m!1250123))

(declare-fun m!1250125 () Bool)

(assert (=> b!1365603 m!1250125))

(declare-fun m!1250127 () Bool)

(assert (=> b!1365604 m!1250127))

(declare-fun m!1250129 () Bool)

(assert (=> b!1365604 m!1250129))

(declare-fun m!1250131 () Bool)

(assert (=> b!1365595 m!1250131))

(declare-fun m!1250133 () Bool)

(assert (=> b!1365609 m!1250133))

(declare-fun m!1250135 () Bool)

(assert (=> b!1365607 m!1250135))

(assert (=> b!1365597 m!1250105))

(assert (=> b!1365597 m!1250105))

(declare-fun m!1250137 () Bool)

(assert (=> b!1365597 m!1250137))

(declare-fun m!1250139 () Bool)

(assert (=> b!1365598 m!1250139))

(push 1)

