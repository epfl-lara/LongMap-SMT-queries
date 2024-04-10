; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115546 () Bool)

(assert start!115546)

(declare-fun b!1366713 () Bool)

(declare-fun res!910272 () Bool)

(declare-fun e!774639 () Bool)

(assert (=> b!1366713 (=> (not res!910272) (not e!774639))))

(declare-datatypes ((List!31906 0))(
  ( (Nil!31903) (Cons!31902 (h!33111 (_ BitVec 64)) (t!46600 List!31906)) )
))
(declare-fun newAcc!98 () List!31906)

(declare-fun contains!9588 (List!31906 (_ BitVec 64)) Bool)

(assert (=> b!1366713 (= res!910272 (not (contains!9588 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366714 () Bool)

(declare-fun res!910269 () Bool)

(declare-fun e!774640 () Bool)

(assert (=> b!1366714 (=> (not res!910269) (not e!774640))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!92822 0))(
  ( (array!92823 (arr!44838 (Array (_ BitVec 32) (_ BitVec 64))) (size!45388 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92822)

(assert (=> b!1366714 (= res!910269 (bvslt from!3239 (size!45388 a!3861)))))

(declare-fun b!1366715 () Bool)

(declare-fun res!910273 () Bool)

(assert (=> b!1366715 (=> (not res!910273) (not e!774639))))

(declare-fun acc!866 () List!31906)

(assert (=> b!1366715 (= res!910273 (not (contains!9588 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!910270 () Bool)

(assert (=> start!115546 (=> (not res!910270) (not e!774639))))

(assert (=> start!115546 (= res!910270 (and (bvslt (size!45388 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45388 a!3861))))))

(assert (=> start!115546 e!774639))

(declare-fun array_inv!33866 (array!92822) Bool)

(assert (=> start!115546 (array_inv!33866 a!3861)))

(assert (=> start!115546 true))

(declare-fun b!1366716 () Bool)

(declare-fun res!910265 () Bool)

(assert (=> b!1366716 (=> (not res!910265) (not e!774640))))

(assert (=> b!1366716 (= res!910265 (not (contains!9588 acc!866 (select (arr!44838 a!3861) from!3239))))))

(declare-fun b!1366717 () Bool)

(declare-fun res!910264 () Bool)

(assert (=> b!1366717 (=> (not res!910264) (not e!774639))))

(assert (=> b!1366717 (= res!910264 (not (contains!9588 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366718 () Bool)

(declare-fun res!910271 () Bool)

(assert (=> b!1366718 (=> (not res!910271) (not e!774640))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366718 (= res!910271 (validKeyInArray!0 (select (arr!44838 a!3861) from!3239)))))

(declare-fun b!1366719 () Bool)

(assert (=> b!1366719 (= e!774639 e!774640)))

(declare-fun res!910268 () Bool)

(assert (=> b!1366719 (=> (not res!910268) (not e!774640))))

(declare-fun arrayNoDuplicates!0 (array!92822 (_ BitVec 32) List!31906) Bool)

(assert (=> b!1366719 (= res!910268 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45113 0))(
  ( (Unit!45114) )
))
(declare-fun lt!601646 () Unit!45113)

(declare-fun noDuplicateSubseq!177 (List!31906 List!31906) Unit!45113)

(assert (=> b!1366719 (= lt!601646 (noDuplicateSubseq!177 newAcc!98 acc!866))))

(declare-fun b!1366720 () Bool)

(assert (=> b!1366720 (= e!774640 (not true))))

(declare-fun lt!601647 () Unit!45113)

(declare-fun lt!601645 () List!31906)

(declare-fun lt!601648 () List!31906)

(assert (=> b!1366720 (= lt!601647 (noDuplicateSubseq!177 lt!601645 lt!601648))))

(assert (=> b!1366720 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601645)))

(declare-fun lt!601644 () Unit!45113)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92822 List!31906 List!31906 (_ BitVec 32)) Unit!45113)

(assert (=> b!1366720 (= lt!601644 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!601648 lt!601645 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> b!1366720 (= lt!601645 (Cons!31902 (select (arr!44838 a!3861) from!3239) newAcc!98))))

(assert (=> b!1366720 (= lt!601648 (Cons!31902 (select (arr!44838 a!3861) from!3239) acc!866))))

(declare-fun b!1366721 () Bool)

(declare-fun res!910263 () Bool)

(assert (=> b!1366721 (=> (not res!910263) (not e!774639))))

(declare-fun noDuplicate!2445 (List!31906) Bool)

(assert (=> b!1366721 (= res!910263 (noDuplicate!2445 acc!866))))

(declare-fun b!1366722 () Bool)

(declare-fun res!910266 () Bool)

(assert (=> b!1366722 (=> (not res!910266) (not e!774639))))

(declare-fun subseq!990 (List!31906 List!31906) Bool)

(assert (=> b!1366722 (= res!910266 (subseq!990 newAcc!98 acc!866))))

(declare-fun b!1366723 () Bool)

(declare-fun res!910267 () Bool)

(assert (=> b!1366723 (=> (not res!910267) (not e!774639))))

(assert (=> b!1366723 (= res!910267 (not (contains!9588 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115546 res!910270) b!1366721))

(assert (= (and b!1366721 res!910263) b!1366715))

(assert (= (and b!1366715 res!910273) b!1366723))

(assert (= (and b!1366723 res!910267) b!1366713))

(assert (= (and b!1366713 res!910272) b!1366717))

(assert (= (and b!1366717 res!910264) b!1366722))

(assert (= (and b!1366722 res!910266) b!1366719))

(assert (= (and b!1366719 res!910268) b!1366714))

(assert (= (and b!1366714 res!910269) b!1366718))

(assert (= (and b!1366718 res!910271) b!1366716))

(assert (= (and b!1366716 res!910265) b!1366720))

(declare-fun m!1250995 () Bool)

(assert (=> b!1366718 m!1250995))

(assert (=> b!1366718 m!1250995))

(declare-fun m!1250997 () Bool)

(assert (=> b!1366718 m!1250997))

(assert (=> b!1366716 m!1250995))

(assert (=> b!1366716 m!1250995))

(declare-fun m!1250999 () Bool)

(assert (=> b!1366716 m!1250999))

(declare-fun m!1251001 () Bool)

(assert (=> b!1366720 m!1251001))

(declare-fun m!1251003 () Bool)

(assert (=> b!1366720 m!1251003))

(declare-fun m!1251005 () Bool)

(assert (=> b!1366720 m!1251005))

(assert (=> b!1366720 m!1250995))

(declare-fun m!1251007 () Bool)

(assert (=> b!1366715 m!1251007))

(declare-fun m!1251009 () Bool)

(assert (=> b!1366713 m!1251009))

(declare-fun m!1251011 () Bool)

(assert (=> b!1366722 m!1251011))

(declare-fun m!1251013 () Bool)

(assert (=> b!1366723 m!1251013))

(declare-fun m!1251015 () Bool)

(assert (=> b!1366721 m!1251015))

(declare-fun m!1251017 () Bool)

(assert (=> start!115546 m!1251017))

(declare-fun m!1251019 () Bool)

(assert (=> b!1366719 m!1251019))

(declare-fun m!1251021 () Bool)

(assert (=> b!1366719 m!1251021))

(declare-fun m!1251023 () Bool)

(assert (=> b!1366717 m!1251023))

(check-sat (not b!1366716) (not b!1366719) (not b!1366721) (not b!1366715) (not start!115546) (not b!1366718) (not b!1366713) (not b!1366722) (not b!1366723) (not b!1366717) (not b!1366720))
(check-sat)
