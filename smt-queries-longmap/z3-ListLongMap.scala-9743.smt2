; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115432 () Bool)

(assert start!115432)

(declare-fun b!1365035 () Bool)

(declare-fun res!908656 () Bool)

(declare-fun e!774105 () Bool)

(assert (=> b!1365035 (=> (not res!908656) (not e!774105))))

(declare-datatypes ((List!31931 0))(
  ( (Nil!31928) (Cons!31927 (h!33136 (_ BitVec 64)) (t!46617 List!31931)) )
))
(declare-fun lt!601011 () List!31931)

(declare-fun noDuplicate!2439 (List!31931) Bool)

(assert (=> b!1365035 (= res!908656 (noDuplicate!2439 lt!601011))))

(declare-fun b!1365036 () Bool)

(declare-fun res!908660 () Bool)

(declare-fun e!774102 () Bool)

(assert (=> b!1365036 (=> (not res!908660) (not e!774102))))

(declare-fun newAcc!98 () List!31931)

(declare-fun acc!866 () List!31931)

(declare-fun subseq!962 (List!31931 List!31931) Bool)

(assert (=> b!1365036 (= res!908660 (subseq!962 newAcc!98 acc!866))))

(declare-fun b!1365037 () Bool)

(assert (=> b!1365037 (= e!774105 false)))

(declare-datatypes ((array!92712 0))(
  ( (array!92713 (arr!44785 (Array (_ BitVec 32) (_ BitVec 64))) (size!45337 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92712)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun lt!601007 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92712 (_ BitVec 32) List!31931) Bool)

(assert (=> b!1365037 (= lt!601007 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601011))))

(declare-datatypes ((Unit!44898 0))(
  ( (Unit!44899) )
))
(declare-fun lt!601009 () Unit!44898)

(declare-fun lt!601008 () List!31931)

(declare-fun noDuplicateSubseq!149 (List!31931 List!31931) Unit!44898)

(assert (=> b!1365037 (= lt!601009 (noDuplicateSubseq!149 lt!601008 lt!601011))))

(declare-fun b!1365038 () Bool)

(declare-fun res!908664 () Bool)

(assert (=> b!1365038 (=> (not res!908664) (not e!774102))))

(declare-fun contains!9524 (List!31931 (_ BitVec 64)) Bool)

(assert (=> b!1365038 (= res!908664 (not (contains!9524 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365039 () Bool)

(declare-fun res!908665 () Bool)

(declare-fun e!774103 () Bool)

(assert (=> b!1365039 (=> (not res!908665) (not e!774103))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1365039 (= res!908665 (validKeyInArray!0 (select (arr!44785 a!3861) from!3239)))))

(declare-fun b!1365040 () Bool)

(declare-fun res!908658 () Bool)

(assert (=> b!1365040 (=> (not res!908658) (not e!774105))))

(assert (=> b!1365040 (= res!908658 (subseq!962 lt!601008 lt!601011))))

(declare-fun b!1365041 () Bool)

(declare-fun res!908662 () Bool)

(assert (=> b!1365041 (=> (not res!908662) (not e!774102))))

(assert (=> b!1365041 (= res!908662 (noDuplicate!2439 acc!866))))

(declare-fun b!1365042 () Bool)

(declare-fun res!908653 () Bool)

(assert (=> b!1365042 (=> (not res!908653) (not e!774105))))

(assert (=> b!1365042 (= res!908653 (not (contains!9524 lt!601008 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365044 () Bool)

(declare-fun res!908657 () Bool)

(assert (=> b!1365044 (=> (not res!908657) (not e!774105))))

(assert (=> b!1365044 (= res!908657 (not (contains!9524 lt!601011 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365045 () Bool)

(declare-fun res!908655 () Bool)

(assert (=> b!1365045 (=> (not res!908655) (not e!774103))))

(assert (=> b!1365045 (= res!908655 (not (contains!9524 acc!866 (select (arr!44785 a!3861) from!3239))))))

(declare-fun b!1365046 () Bool)

(declare-fun res!908669 () Bool)

(assert (=> b!1365046 (=> (not res!908669) (not e!774103))))

(assert (=> b!1365046 (= res!908669 (bvslt from!3239 (size!45337 a!3861)))))

(declare-fun b!1365047 () Bool)

(assert (=> b!1365047 (= e!774103 e!774105)))

(declare-fun res!908659 () Bool)

(assert (=> b!1365047 (=> (not res!908659) (not e!774105))))

(assert (=> b!1365047 (= res!908659 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1365047 (= lt!601008 (Cons!31927 (select (arr!44785 a!3861) from!3239) newAcc!98))))

(assert (=> b!1365047 (= lt!601011 (Cons!31927 (select (arr!44785 a!3861) from!3239) acc!866))))

(declare-fun b!1365048 () Bool)

(declare-fun res!908668 () Bool)

(assert (=> b!1365048 (=> (not res!908668) (not e!774102))))

(assert (=> b!1365048 (= res!908668 (not (contains!9524 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365043 () Bool)

(declare-fun res!908667 () Bool)

(assert (=> b!1365043 (=> (not res!908667) (not e!774105))))

(assert (=> b!1365043 (= res!908667 (not (contains!9524 lt!601008 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!908654 () Bool)

(assert (=> start!115432 (=> (not res!908654) (not e!774102))))

(assert (=> start!115432 (= res!908654 (and (bvslt (size!45337 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45337 a!3861))))))

(assert (=> start!115432 e!774102))

(declare-fun array_inv!34018 (array!92712) Bool)

(assert (=> start!115432 (array_inv!34018 a!3861)))

(assert (=> start!115432 true))

(declare-fun b!1365049 () Bool)

(declare-fun res!908661 () Bool)

(assert (=> b!1365049 (=> (not res!908661) (not e!774105))))

(assert (=> b!1365049 (= res!908661 (not (contains!9524 lt!601011 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365050 () Bool)

(assert (=> b!1365050 (= e!774102 e!774103)))

(declare-fun res!908666 () Bool)

(assert (=> b!1365050 (=> (not res!908666) (not e!774103))))

(assert (=> b!1365050 (= res!908666 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!601010 () Unit!44898)

(assert (=> b!1365050 (= lt!601010 (noDuplicateSubseq!149 newAcc!98 acc!866))))

(declare-fun b!1365051 () Bool)

(declare-fun res!908663 () Bool)

(assert (=> b!1365051 (=> (not res!908663) (not e!774102))))

(assert (=> b!1365051 (= res!908663 (not (contains!9524 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365052 () Bool)

(declare-fun res!908652 () Bool)

(assert (=> b!1365052 (=> (not res!908652) (not e!774102))))

(assert (=> b!1365052 (= res!908652 (not (contains!9524 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115432 res!908654) b!1365041))

(assert (= (and b!1365041 res!908662) b!1365051))

(assert (= (and b!1365051 res!908663) b!1365052))

(assert (= (and b!1365052 res!908652) b!1365038))

(assert (= (and b!1365038 res!908664) b!1365048))

(assert (= (and b!1365048 res!908668) b!1365036))

(assert (= (and b!1365036 res!908660) b!1365050))

(assert (= (and b!1365050 res!908666) b!1365046))

(assert (= (and b!1365046 res!908669) b!1365039))

(assert (= (and b!1365039 res!908665) b!1365045))

(assert (= (and b!1365045 res!908655) b!1365047))

(assert (= (and b!1365047 res!908659) b!1365035))

(assert (= (and b!1365035 res!908656) b!1365049))

(assert (= (and b!1365049 res!908661) b!1365044))

(assert (= (and b!1365044 res!908657) b!1365042))

(assert (= (and b!1365042 res!908653) b!1365043))

(assert (= (and b!1365043 res!908667) b!1365040))

(assert (= (and b!1365040 res!908658) b!1365037))

(declare-fun m!1249215 () Bool)

(assert (=> b!1365036 m!1249215))

(declare-fun m!1249217 () Bool)

(assert (=> b!1365038 m!1249217))

(declare-fun m!1249219 () Bool)

(assert (=> start!115432 m!1249219))

(declare-fun m!1249221 () Bool)

(assert (=> b!1365052 m!1249221))

(declare-fun m!1249223 () Bool)

(assert (=> b!1365050 m!1249223))

(declare-fun m!1249225 () Bool)

(assert (=> b!1365050 m!1249225))

(declare-fun m!1249227 () Bool)

(assert (=> b!1365040 m!1249227))

(declare-fun m!1249229 () Bool)

(assert (=> b!1365049 m!1249229))

(declare-fun m!1249231 () Bool)

(assert (=> b!1365044 m!1249231))

(declare-fun m!1249233 () Bool)

(assert (=> b!1365047 m!1249233))

(declare-fun m!1249235 () Bool)

(assert (=> b!1365041 m!1249235))

(declare-fun m!1249237 () Bool)

(assert (=> b!1365051 m!1249237))

(declare-fun m!1249239 () Bool)

(assert (=> b!1365042 m!1249239))

(declare-fun m!1249241 () Bool)

(assert (=> b!1365037 m!1249241))

(declare-fun m!1249243 () Bool)

(assert (=> b!1365037 m!1249243))

(assert (=> b!1365039 m!1249233))

(assert (=> b!1365039 m!1249233))

(declare-fun m!1249245 () Bool)

(assert (=> b!1365039 m!1249245))

(declare-fun m!1249247 () Bool)

(assert (=> b!1365048 m!1249247))

(declare-fun m!1249249 () Bool)

(assert (=> b!1365035 m!1249249))

(declare-fun m!1249251 () Bool)

(assert (=> b!1365043 m!1249251))

(assert (=> b!1365045 m!1249233))

(assert (=> b!1365045 m!1249233))

(declare-fun m!1249253 () Bool)

(assert (=> b!1365045 m!1249253))

(check-sat (not b!1365040) (not b!1365035) (not b!1365043) (not b!1365039) (not b!1365048) (not b!1365049) (not b!1365038) (not start!115432) (not b!1365052) (not b!1365037) (not b!1365051) (not b!1365045) (not b!1365044) (not b!1365036) (not b!1365050) (not b!1365042) (not b!1365041))
(check-sat)
