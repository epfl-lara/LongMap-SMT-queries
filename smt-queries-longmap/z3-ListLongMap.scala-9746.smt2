; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115462 () Bool)

(assert start!115462)

(declare-fun b!1365647 () Bool)

(declare-fun res!909229 () Bool)

(declare-fun e!774257 () Bool)

(assert (=> b!1365647 (=> (not res!909229) (not e!774257))))

(declare-datatypes ((List!31888 0))(
  ( (Nil!31885) (Cons!31884 (h!33093 (_ BitVec 64)) (t!46582 List!31888)) )
))
(declare-fun lt!601346 () List!31888)

(declare-fun contains!9570 (List!31888 (_ BitVec 64)) Bool)

(assert (=> b!1365647 (= res!909229 (not (contains!9570 lt!601346 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365648 () Bool)

(declare-fun res!909236 () Bool)

(declare-fun e!774258 () Bool)

(assert (=> b!1365648 (=> (not res!909236) (not e!774258))))

(declare-fun newAcc!98 () List!31888)

(declare-fun acc!866 () List!31888)

(declare-fun subseq!972 (List!31888 List!31888) Bool)

(assert (=> b!1365648 (= res!909236 (subseq!972 newAcc!98 acc!866))))

(declare-fun b!1365649 () Bool)

(declare-fun res!909221 () Bool)

(assert (=> b!1365649 (=> (not res!909221) (not e!774258))))

(assert (=> b!1365649 (= res!909221 (not (contains!9570 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365650 () Bool)

(assert (=> b!1365650 (= e!774257 false)))

(declare-datatypes ((array!92783 0))(
  ( (array!92784 (arr!44820 (Array (_ BitVec 32) (_ BitVec 64))) (size!45370 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92783)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun lt!601345 () List!31888)

(declare-fun lt!601344 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92783 (_ BitVec 32) List!31888) Bool)

(assert (=> b!1365650 (= lt!601344 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601345))))

(declare-datatypes ((Unit!45077 0))(
  ( (Unit!45078) )
))
(declare-fun lt!601348 () Unit!45077)

(declare-fun noDuplicateSubseq!159 (List!31888 List!31888) Unit!45077)

(assert (=> b!1365650 (= lt!601348 (noDuplicateSubseq!159 lt!601346 lt!601345))))

(declare-fun b!1365651 () Bool)

(declare-fun res!909230 () Bool)

(assert (=> b!1365651 (=> (not res!909230) (not e!774257))))

(assert (=> b!1365651 (= res!909230 (not (contains!9570 lt!601346 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365652 () Bool)

(declare-fun res!909228 () Bool)

(declare-fun e!774259 () Bool)

(assert (=> b!1365652 (=> (not res!909228) (not e!774259))))

(assert (=> b!1365652 (= res!909228 (not (contains!9570 acc!866 (select (arr!44820 a!3861) from!3239))))))

(declare-fun b!1365653 () Bool)

(declare-fun res!909223 () Bool)

(assert (=> b!1365653 (=> (not res!909223) (not e!774257))))

(assert (=> b!1365653 (= res!909223 (not (contains!9570 lt!601345 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365654 () Bool)

(declare-fun res!909232 () Bool)

(assert (=> b!1365654 (=> (not res!909232) (not e!774257))))

(declare-fun noDuplicate!2427 (List!31888) Bool)

(assert (=> b!1365654 (= res!909232 (noDuplicate!2427 lt!601345))))

(declare-fun b!1365655 () Bool)

(declare-fun res!909225 () Bool)

(assert (=> b!1365655 (=> (not res!909225) (not e!774258))))

(assert (=> b!1365655 (= res!909225 (not (contains!9570 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365656 () Bool)

(declare-fun res!909231 () Bool)

(assert (=> b!1365656 (=> (not res!909231) (not e!774257))))

(assert (=> b!1365656 (= res!909231 (subseq!972 lt!601346 lt!601345))))

(declare-fun res!909226 () Bool)

(assert (=> start!115462 (=> (not res!909226) (not e!774258))))

(assert (=> start!115462 (= res!909226 (and (bvslt (size!45370 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45370 a!3861))))))

(assert (=> start!115462 e!774258))

(declare-fun array_inv!33848 (array!92783) Bool)

(assert (=> start!115462 (array_inv!33848 a!3861)))

(assert (=> start!115462 true))

(declare-fun b!1365657 () Bool)

(declare-fun res!909237 () Bool)

(assert (=> b!1365657 (=> (not res!909237) (not e!774259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1365657 (= res!909237 (validKeyInArray!0 (select (arr!44820 a!3861) from!3239)))))

(declare-fun b!1365658 () Bool)

(declare-fun res!909224 () Bool)

(assert (=> b!1365658 (=> (not res!909224) (not e!774258))))

(assert (=> b!1365658 (= res!909224 (not (contains!9570 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365659 () Bool)

(declare-fun res!909238 () Bool)

(assert (=> b!1365659 (=> (not res!909238) (not e!774257))))

(assert (=> b!1365659 (= res!909238 (not (contains!9570 lt!601345 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365660 () Bool)

(declare-fun res!909227 () Bool)

(assert (=> b!1365660 (=> (not res!909227) (not e!774258))))

(assert (=> b!1365660 (= res!909227 (not (contains!9570 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365661 () Bool)

(declare-fun res!909222 () Bool)

(assert (=> b!1365661 (=> (not res!909222) (not e!774259))))

(assert (=> b!1365661 (= res!909222 (bvslt from!3239 (size!45370 a!3861)))))

(declare-fun b!1365662 () Bool)

(assert (=> b!1365662 (= e!774259 e!774257)))

(declare-fun res!909235 () Bool)

(assert (=> b!1365662 (=> (not res!909235) (not e!774257))))

(assert (=> b!1365662 (= res!909235 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1365662 (= lt!601346 (Cons!31884 (select (arr!44820 a!3861) from!3239) newAcc!98))))

(assert (=> b!1365662 (= lt!601345 (Cons!31884 (select (arr!44820 a!3861) from!3239) acc!866))))

(declare-fun b!1365663 () Bool)

(assert (=> b!1365663 (= e!774258 e!774259)))

(declare-fun res!909234 () Bool)

(assert (=> b!1365663 (=> (not res!909234) (not e!774259))))

(assert (=> b!1365663 (= res!909234 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!601347 () Unit!45077)

(assert (=> b!1365663 (= lt!601347 (noDuplicateSubseq!159 newAcc!98 acc!866))))

(declare-fun b!1365664 () Bool)

(declare-fun res!909233 () Bool)

(assert (=> b!1365664 (=> (not res!909233) (not e!774258))))

(assert (=> b!1365664 (= res!909233 (noDuplicate!2427 acc!866))))

(assert (= (and start!115462 res!909226) b!1365664))

(assert (= (and b!1365664 res!909233) b!1365658))

(assert (= (and b!1365658 res!909224) b!1365649))

(assert (= (and b!1365649 res!909221) b!1365660))

(assert (= (and b!1365660 res!909227) b!1365655))

(assert (= (and b!1365655 res!909225) b!1365648))

(assert (= (and b!1365648 res!909236) b!1365663))

(assert (= (and b!1365663 res!909234) b!1365661))

(assert (= (and b!1365661 res!909222) b!1365657))

(assert (= (and b!1365657 res!909237) b!1365652))

(assert (= (and b!1365652 res!909228) b!1365662))

(assert (= (and b!1365662 res!909235) b!1365654))

(assert (= (and b!1365654 res!909232) b!1365653))

(assert (= (and b!1365653 res!909223) b!1365659))

(assert (= (and b!1365659 res!909238) b!1365647))

(assert (= (and b!1365647 res!909229) b!1365651))

(assert (= (and b!1365651 res!909230) b!1365656))

(assert (= (and b!1365656 res!909231) b!1365650))

(declare-fun m!1250141 () Bool)

(assert (=> b!1365647 m!1250141))

(declare-fun m!1250143 () Bool)

(assert (=> b!1365656 m!1250143))

(declare-fun m!1250145 () Bool)

(assert (=> b!1365650 m!1250145))

(declare-fun m!1250147 () Bool)

(assert (=> b!1365650 m!1250147))

(declare-fun m!1250149 () Bool)

(assert (=> b!1365658 m!1250149))

(declare-fun m!1250151 () Bool)

(assert (=> b!1365648 m!1250151))

(declare-fun m!1250153 () Bool)

(assert (=> b!1365662 m!1250153))

(declare-fun m!1250155 () Bool)

(assert (=> b!1365654 m!1250155))

(declare-fun m!1250157 () Bool)

(assert (=> b!1365655 m!1250157))

(declare-fun m!1250159 () Bool)

(assert (=> b!1365653 m!1250159))

(assert (=> b!1365652 m!1250153))

(assert (=> b!1365652 m!1250153))

(declare-fun m!1250161 () Bool)

(assert (=> b!1365652 m!1250161))

(declare-fun m!1250163 () Bool)

(assert (=> b!1365649 m!1250163))

(declare-fun m!1250165 () Bool)

(assert (=> b!1365659 m!1250165))

(declare-fun m!1250167 () Bool)

(assert (=> start!115462 m!1250167))

(assert (=> b!1365657 m!1250153))

(assert (=> b!1365657 m!1250153))

(declare-fun m!1250169 () Bool)

(assert (=> b!1365657 m!1250169))

(declare-fun m!1250171 () Bool)

(assert (=> b!1365664 m!1250171))

(declare-fun m!1250173 () Bool)

(assert (=> b!1365651 m!1250173))

(declare-fun m!1250175 () Bool)

(assert (=> b!1365660 m!1250175))

(declare-fun m!1250177 () Bool)

(assert (=> b!1365663 m!1250177))

(declare-fun m!1250179 () Bool)

(assert (=> b!1365663 m!1250179))

(check-sat (not b!1365652) (not start!115462) (not b!1365654) (not b!1365658) (not b!1365647) (not b!1365660) (not b!1365651) (not b!1365664) (not b!1365649) (not b!1365663) (not b!1365650) (not b!1365648) (not b!1365653) (not b!1365655) (not b!1365657) (not b!1365656) (not b!1365659))
(check-sat)
