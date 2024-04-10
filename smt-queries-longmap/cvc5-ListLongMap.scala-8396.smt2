; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102156 () Bool)

(assert start!102156)

(declare-fun res!818134 () Bool)

(declare-fun e!697874 () Bool)

(assert (=> start!102156 (=> (not res!818134) (not e!697874))))

(declare-datatypes ((array!79331 0))(
  ( (array!79332 (arr!38285 (Array (_ BitVec 32) (_ BitVec 64))) (size!38821 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79331)

(assert (=> start!102156 (= res!818134 (bvslt (size!38821 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102156 e!697874))

(declare-fun array_inv!29133 (array!79331) Bool)

(assert (=> start!102156 (array_inv!29133 a!3806)))

(assert (=> start!102156 true))

(declare-fun b!1229644 () Bool)

(declare-fun e!697873 () Bool)

(assert (=> b!1229644 (= e!697874 (not e!697873))))

(declare-fun res!818133 () Bool)

(assert (=> b!1229644 (=> res!818133 e!697873)))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1229644 (= res!818133 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(declare-datatypes ((List!27058 0))(
  ( (Nil!27055) (Cons!27054 (h!28263 (_ BitVec 64)) (t!40521 List!27058)) )
))
(declare-fun lt!559224 () List!27058)

(assert (=> b!1229644 (= lt!559224 (Cons!27054 (select (arr!38285 a!3806) from!3184) Nil!27055))))

(declare-fun e!697875 () Bool)

(assert (=> b!1229644 e!697875))

(declare-fun res!818142 () Bool)

(assert (=> b!1229644 (=> (not res!818142) (not e!697875))))

(declare-fun arrayNoDuplicates!0 (array!79331 (_ BitVec 32) List!27058) Bool)

(assert (=> b!1229644 (= res!818142 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27055))))

(declare-datatypes ((Unit!40736 0))(
  ( (Unit!40737) )
))
(declare-fun lt!559225 () Unit!40736)

(declare-fun acc!823 () List!27058)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79331 List!27058 List!27058 (_ BitVec 32)) Unit!40736)

(assert (=> b!1229644 (= lt!559225 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27055 from!3184))))

(assert (=> b!1229644 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27054 (select (arr!38285 a!3806) from!3184) acc!823))))

(declare-fun b!1229645 () Bool)

(declare-fun res!818139 () Bool)

(assert (=> b!1229645 (=> (not res!818139) (not e!697874))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229645 (= res!818139 (validKeyInArray!0 k!2913))))

(declare-fun b!1229646 () Bool)

(declare-fun res!818136 () Bool)

(assert (=> b!1229646 (=> (not res!818136) (not e!697874))))

(assert (=> b!1229646 (= res!818136 (validKeyInArray!0 (select (arr!38285 a!3806) from!3184)))))

(declare-fun b!1229647 () Bool)

(declare-fun res!818131 () Bool)

(assert (=> b!1229647 (=> (not res!818131) (not e!697874))))

(declare-fun arrayContainsKey!0 (array!79331 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229647 (= res!818131 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229648 () Bool)

(assert (=> b!1229648 (= e!697873 true)))

(declare-fun lt!559226 () Bool)

(declare-fun contains!7120 (List!27058 (_ BitVec 64)) Bool)

(assert (=> b!1229648 (= lt!559226 (contains!7120 lt!559224 (select (arr!38285 a!3806) from!3184)))))

(declare-fun b!1229649 () Bool)

(declare-fun res!818135 () Bool)

(assert (=> b!1229649 (=> res!818135 e!697873)))

(declare-fun noDuplicate!1717 (List!27058) Bool)

(assert (=> b!1229649 (= res!818135 (not (noDuplicate!1717 lt!559224)))))

(declare-fun b!1229650 () Bool)

(declare-fun res!818140 () Bool)

(assert (=> b!1229650 (=> res!818140 e!697873)))

(assert (=> b!1229650 (= res!818140 (contains!7120 lt!559224 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229651 () Bool)

(declare-fun res!818132 () Bool)

(assert (=> b!1229651 (=> (not res!818132) (not e!697874))))

(assert (=> b!1229651 (= res!818132 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229652 () Bool)

(declare-fun res!818137 () Bool)

(assert (=> b!1229652 (=> res!818137 e!697873)))

(assert (=> b!1229652 (= res!818137 (contains!7120 lt!559224 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229653 () Bool)

(declare-fun res!818130 () Bool)

(assert (=> b!1229653 (=> (not res!818130) (not e!697874))))

(assert (=> b!1229653 (= res!818130 (noDuplicate!1717 acc!823))))

(declare-fun b!1229654 () Bool)

(declare-fun res!818143 () Bool)

(assert (=> b!1229654 (=> (not res!818143) (not e!697874))))

(assert (=> b!1229654 (= res!818143 (not (contains!7120 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229655 () Bool)

(declare-fun res!818138 () Bool)

(assert (=> b!1229655 (=> (not res!818138) (not e!697874))))

(assert (=> b!1229655 (= res!818138 (not (contains!7120 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229656 () Bool)

(declare-fun res!818141 () Bool)

(assert (=> b!1229656 (=> (not res!818141) (not e!697874))))

(assert (=> b!1229656 (= res!818141 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38821 a!3806)) (bvslt from!3184 (size!38821 a!3806))))))

(declare-fun b!1229657 () Bool)

(assert (=> b!1229657 (= e!697875 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27054 (select (arr!38285 a!3806) from!3184) Nil!27055)))))

(assert (= (and start!102156 res!818134) b!1229645))

(assert (= (and b!1229645 res!818139) b!1229656))

(assert (= (and b!1229656 res!818141) b!1229653))

(assert (= (and b!1229653 res!818130) b!1229654))

(assert (= (and b!1229654 res!818143) b!1229655))

(assert (= (and b!1229655 res!818138) b!1229647))

(assert (= (and b!1229647 res!818131) b!1229651))

(assert (= (and b!1229651 res!818132) b!1229646))

(assert (= (and b!1229646 res!818136) b!1229644))

(assert (= (and b!1229644 res!818142) b!1229657))

(assert (= (and b!1229644 (not res!818133)) b!1229649))

(assert (= (and b!1229649 (not res!818135)) b!1229650))

(assert (= (and b!1229650 (not res!818140)) b!1229652))

(assert (= (and b!1229652 (not res!818137)) b!1229648))

(declare-fun m!1134163 () Bool)

(assert (=> b!1229652 m!1134163))

(declare-fun m!1134165 () Bool)

(assert (=> b!1229657 m!1134165))

(declare-fun m!1134167 () Bool)

(assert (=> b!1229657 m!1134167))

(declare-fun m!1134169 () Bool)

(assert (=> b!1229654 m!1134169))

(assert (=> b!1229644 m!1134165))

(declare-fun m!1134171 () Bool)

(assert (=> b!1229644 m!1134171))

(declare-fun m!1134173 () Bool)

(assert (=> b!1229644 m!1134173))

(declare-fun m!1134175 () Bool)

(assert (=> b!1229644 m!1134175))

(declare-fun m!1134177 () Bool)

(assert (=> start!102156 m!1134177))

(declare-fun m!1134179 () Bool)

(assert (=> b!1229649 m!1134179))

(declare-fun m!1134181 () Bool)

(assert (=> b!1229650 m!1134181))

(declare-fun m!1134183 () Bool)

(assert (=> b!1229645 m!1134183))

(assert (=> b!1229648 m!1134165))

(assert (=> b!1229648 m!1134165))

(declare-fun m!1134185 () Bool)

(assert (=> b!1229648 m!1134185))

(declare-fun m!1134187 () Bool)

(assert (=> b!1229651 m!1134187))

(declare-fun m!1134189 () Bool)

(assert (=> b!1229653 m!1134189))

(declare-fun m!1134191 () Bool)

(assert (=> b!1229647 m!1134191))

(declare-fun m!1134193 () Bool)

(assert (=> b!1229655 m!1134193))

(assert (=> b!1229646 m!1134165))

(assert (=> b!1229646 m!1134165))

(declare-fun m!1134195 () Bool)

(assert (=> b!1229646 m!1134195))

(push 1)

(assert (not b!1229646))

(assert (not b!1229648))

(assert (not b!1229651))

(assert (not b!1229649))

(assert (not b!1229644))

(assert (not b!1229657))

(assert (not b!1229645))

(assert (not b!1229652))

(assert (not b!1229650))

(assert (not b!1229655))

(assert (not b!1229654))

(assert (not b!1229653))

(assert (not start!102156))

(assert (not b!1229647))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

