; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103448 () Bool)

(assert start!103448)

(declare-fun b!1240270 () Bool)

(declare-fun res!827060 () Bool)

(declare-fun e!702991 () Bool)

(assert (=> b!1240270 (=> (not res!827060) (not e!702991))))

(declare-datatypes ((List!27322 0))(
  ( (Nil!27319) (Cons!27318 (h!28536 (_ BitVec 64)) (t!40777 List!27322)) )
))
(declare-fun acc!846 () List!27322)

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7393 (List!27322 (_ BitVec 64)) Bool)

(assert (=> b!1240270 (= res!827060 (contains!7393 acc!846 k!2925))))

(declare-fun b!1240271 () Bool)

(declare-datatypes ((Unit!41122 0))(
  ( (Unit!41123) )
))
(declare-fun e!702992 () Unit!41122)

(declare-fun lt!562007 () Unit!41122)

(assert (=> b!1240271 (= e!702992 lt!562007)))

(declare-datatypes ((array!79881 0))(
  ( (array!79882 (arr!38536 (Array (_ BitVec 32) (_ BitVec 64))) (size!39073 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79881)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun lt!562004 () List!27322)

(assert (=> b!1240271 (= lt!562004 (Cons!27318 (select (arr!38536 a!3835) from!3213) acc!846))))

(declare-fun lt!562003 () Unit!41122)

(declare-fun lemmaListSubSeqRefl!0 (List!27322) Unit!41122)

(assert (=> b!1240271 (= lt!562003 (lemmaListSubSeqRefl!0 lt!562004))))

(declare-fun subseq!613 (List!27322 List!27322) Bool)

(assert (=> b!1240271 (subseq!613 lt!562004 lt!562004)))

(declare-fun lt!562005 () Unit!41122)

(declare-fun subseqTail!100 (List!27322 List!27322) Unit!41122)

(assert (=> b!1240271 (= lt!562005 (subseqTail!100 lt!562004 lt!562004))))

(assert (=> b!1240271 (subseq!613 acc!846 lt!562004)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79881 List!27322 List!27322 (_ BitVec 32)) Unit!41122)

(assert (=> b!1240271 (= lt!562007 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!562004 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79881 (_ BitVec 32) List!27322) Bool)

(assert (=> b!1240271 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1240272 () Bool)

(declare-fun res!827056 () Bool)

(assert (=> b!1240272 (=> (not res!827056) (not e!702991))))

(assert (=> b!1240272 (= res!827056 (not (contains!7393 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1240273 () Bool)

(declare-fun res!827057 () Bool)

(assert (=> b!1240273 (=> (not res!827057) (not e!702991))))

(declare-fun noDuplicate!1974 (List!27322) Bool)

(assert (=> b!1240273 (= res!827057 (noDuplicate!1974 acc!846))))

(declare-fun res!827061 () Bool)

(assert (=> start!103448 (=> (not res!827061) (not e!702991))))

(assert (=> start!103448 (= res!827061 (and (bvslt (size!39073 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39073 a!3835))))))

(assert (=> start!103448 e!702991))

(declare-fun array_inv!29474 (array!79881) Bool)

(assert (=> start!103448 (array_inv!29474 a!3835)))

(assert (=> start!103448 true))

(declare-fun b!1240274 () Bool)

(declare-fun res!827055 () Bool)

(assert (=> b!1240274 (=> (not res!827055) (not e!702991))))

(assert (=> b!1240274 (= res!827055 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1240275 () Bool)

(declare-fun res!827059 () Bool)

(assert (=> b!1240275 (=> (not res!827059) (not e!702991))))

(assert (=> b!1240275 (= res!827059 (not (contains!7393 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1240276 () Bool)

(declare-fun Unit!41124 () Unit!41122)

(assert (=> b!1240276 (= e!702992 Unit!41124)))

(declare-fun b!1240277 () Bool)

(declare-fun res!827058 () Bool)

(assert (=> b!1240277 (=> (not res!827058) (not e!702991))))

(assert (=> b!1240277 (= res!827058 (not (= from!3213 (bvsub (size!39073 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1240278 () Bool)

(assert (=> b!1240278 (= e!702991 false)))

(declare-fun lt!562006 () Unit!41122)

(assert (=> b!1240278 (= lt!562006 e!702992)))

(declare-fun c!121475 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1240278 (= c!121475 (validKeyInArray!0 (select (arr!38536 a!3835) from!3213)))))

(assert (= (and start!103448 res!827061) b!1240273))

(assert (= (and b!1240273 res!827057) b!1240272))

(assert (= (and b!1240272 res!827056) b!1240275))

(assert (= (and b!1240275 res!827059) b!1240274))

(assert (= (and b!1240274 res!827055) b!1240270))

(assert (= (and b!1240270 res!827060) b!1240277))

(assert (= (and b!1240277 res!827058) b!1240278))

(assert (= (and b!1240278 c!121475) b!1240271))

(assert (= (and b!1240278 (not c!121475)) b!1240276))

(declare-fun m!1144111 () Bool)

(assert (=> b!1240271 m!1144111))

(declare-fun m!1144113 () Bool)

(assert (=> b!1240271 m!1144113))

(declare-fun m!1144115 () Bool)

(assert (=> b!1240271 m!1144115))

(declare-fun m!1144117 () Bool)

(assert (=> b!1240271 m!1144117))

(declare-fun m!1144119 () Bool)

(assert (=> b!1240271 m!1144119))

(declare-fun m!1144121 () Bool)

(assert (=> b!1240271 m!1144121))

(declare-fun m!1144123 () Bool)

(assert (=> b!1240271 m!1144123))

(declare-fun m!1144125 () Bool)

(assert (=> b!1240274 m!1144125))

(declare-fun m!1144127 () Bool)

(assert (=> b!1240273 m!1144127))

(declare-fun m!1144129 () Bool)

(assert (=> b!1240272 m!1144129))

(declare-fun m!1144131 () Bool)

(assert (=> start!103448 m!1144131))

(declare-fun m!1144133 () Bool)

(assert (=> b!1240270 m!1144133))

(assert (=> b!1240278 m!1144121))

(assert (=> b!1240278 m!1144121))

(declare-fun m!1144135 () Bool)

(assert (=> b!1240278 m!1144135))

(declare-fun m!1144137 () Bool)

(assert (=> b!1240275 m!1144137))

(push 1)

(assert (not b!1240271))

(assert (not b!1240272))

(assert (not b!1240278))

(assert (not b!1240273))

(assert (not start!103448))

(assert (not b!1240275))

(assert (not b!1240270))

(assert (not b!1240274))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

