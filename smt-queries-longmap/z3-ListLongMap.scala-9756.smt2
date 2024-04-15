; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115606 () Bool)

(assert start!115606)

(declare-fun b!1367176 () Bool)

(declare-fun res!910748 () Bool)

(declare-fun e!774866 () Bool)

(assert (=> b!1367176 (=> (not res!910748) (not e!774866))))

(declare-datatypes ((List!31970 0))(
  ( (Nil!31967) (Cons!31966 (h!33175 (_ BitVec 64)) (t!46656 List!31970)) )
))
(declare-fun newAcc!98 () List!31970)

(declare-fun contains!9563 (List!31970 (_ BitVec 64)) Bool)

(assert (=> b!1367176 (= res!910748 (not (contains!9563 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367177 () Bool)

(declare-fun e!774865 () Bool)

(assert (=> b!1367177 (= e!774865 false)))

(declare-datatypes ((array!92796 0))(
  ( (array!92797 (arr!44824 (Array (_ BitVec 32) (_ BitVec 64))) (size!45376 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92796)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun lt!601668 () Bool)

(declare-fun acc!866 () List!31970)

(assert (=> b!1367177 (= lt!601668 (contains!9563 acc!866 (select (arr!44824 a!3861) from!3239)))))

(declare-fun b!1367178 () Bool)

(declare-fun res!910750 () Bool)

(assert (=> b!1367178 (=> (not res!910750) (not e!774866))))

(assert (=> b!1367178 (= res!910750 (not (contains!9563 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367179 () Bool)

(declare-fun res!910753 () Bool)

(assert (=> b!1367179 (=> (not res!910753) (not e!774866))))

(declare-fun subseq!1001 (List!31970 List!31970) Bool)

(assert (=> b!1367179 (= res!910753 (subseq!1001 newAcc!98 acc!866))))

(declare-fun b!1367180 () Bool)

(declare-fun res!910749 () Bool)

(assert (=> b!1367180 (=> (not res!910749) (not e!774865))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367180 (= res!910749 (validKeyInArray!0 (select (arr!44824 a!3861) from!3239)))))

(declare-fun b!1367181 () Bool)

(declare-fun res!910747 () Bool)

(assert (=> b!1367181 (=> (not res!910747) (not e!774866))))

(declare-fun noDuplicate!2478 (List!31970) Bool)

(assert (=> b!1367181 (= res!910747 (noDuplicate!2478 acc!866))))

(declare-fun b!1367182 () Bool)

(declare-fun res!910751 () Bool)

(assert (=> b!1367182 (=> (not res!910751) (not e!774866))))

(assert (=> b!1367182 (= res!910751 (not (contains!9563 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367183 () Bool)

(declare-fun res!910752 () Bool)

(assert (=> b!1367183 (=> (not res!910752) (not e!774866))))

(assert (=> b!1367183 (= res!910752 (not (contains!9563 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!910746 () Bool)

(assert (=> start!115606 (=> (not res!910746) (not e!774866))))

(assert (=> start!115606 (= res!910746 (and (bvslt (size!45376 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45376 a!3861))))))

(assert (=> start!115606 e!774866))

(declare-fun array_inv!34057 (array!92796) Bool)

(assert (=> start!115606 (array_inv!34057 a!3861)))

(assert (=> start!115606 true))

(declare-fun b!1367184 () Bool)

(declare-fun res!910754 () Bool)

(assert (=> b!1367184 (=> (not res!910754) (not e!774865))))

(assert (=> b!1367184 (= res!910754 (bvslt from!3239 (size!45376 a!3861)))))

(declare-fun b!1367185 () Bool)

(assert (=> b!1367185 (= e!774866 e!774865)))

(declare-fun res!910745 () Bool)

(assert (=> b!1367185 (=> (not res!910745) (not e!774865))))

(declare-fun arrayNoDuplicates!0 (array!92796 (_ BitVec 32) List!31970) Bool)

(assert (=> b!1367185 (= res!910745 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!44976 0))(
  ( (Unit!44977) )
))
(declare-fun lt!601667 () Unit!44976)

(declare-fun noDuplicateSubseq!188 (List!31970 List!31970) Unit!44976)

(assert (=> b!1367185 (= lt!601667 (noDuplicateSubseq!188 newAcc!98 acc!866))))

(assert (= (and start!115606 res!910746) b!1367181))

(assert (= (and b!1367181 res!910747) b!1367182))

(assert (= (and b!1367182 res!910751) b!1367178))

(assert (= (and b!1367178 res!910750) b!1367183))

(assert (= (and b!1367183 res!910752) b!1367176))

(assert (= (and b!1367176 res!910748) b!1367179))

(assert (= (and b!1367179 res!910753) b!1367185))

(assert (= (and b!1367185 res!910745) b!1367184))

(assert (= (and b!1367184 res!910754) b!1367180))

(assert (= (and b!1367180 res!910749) b!1367177))

(declare-fun m!1250985 () Bool)

(assert (=> b!1367183 m!1250985))

(declare-fun m!1250987 () Bool)

(assert (=> b!1367176 m!1250987))

(declare-fun m!1250989 () Bool)

(assert (=> start!115606 m!1250989))

(declare-fun m!1250991 () Bool)

(assert (=> b!1367182 m!1250991))

(declare-fun m!1250993 () Bool)

(assert (=> b!1367180 m!1250993))

(assert (=> b!1367180 m!1250993))

(declare-fun m!1250995 () Bool)

(assert (=> b!1367180 m!1250995))

(declare-fun m!1250997 () Bool)

(assert (=> b!1367185 m!1250997))

(declare-fun m!1250999 () Bool)

(assert (=> b!1367185 m!1250999))

(declare-fun m!1251001 () Bool)

(assert (=> b!1367179 m!1251001))

(declare-fun m!1251003 () Bool)

(assert (=> b!1367178 m!1251003))

(assert (=> b!1367177 m!1250993))

(assert (=> b!1367177 m!1250993))

(declare-fun m!1251005 () Bool)

(assert (=> b!1367177 m!1251005))

(declare-fun m!1251007 () Bool)

(assert (=> b!1367181 m!1251007))

(check-sat (not b!1367179) (not b!1367177) (not b!1367176) (not start!115606) (not b!1367182) (not b!1367178) (not b!1367181) (not b!1367183) (not b!1367180) (not b!1367185))
(check-sat)
