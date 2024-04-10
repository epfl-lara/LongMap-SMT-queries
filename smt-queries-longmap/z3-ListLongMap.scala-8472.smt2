; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103190 () Bool)

(assert start!103190)

(declare-fun b!1238676 () Bool)

(declare-datatypes ((Unit!41119 0))(
  ( (Unit!41120) )
))
(declare-fun e!702039 () Unit!41119)

(declare-fun Unit!41121 () Unit!41119)

(assert (=> b!1238676 (= e!702039 Unit!41121)))

(declare-fun b!1238677 () Bool)

(declare-fun lt!561370 () Unit!41119)

(assert (=> b!1238677 (= e!702039 lt!561370)))

(declare-datatypes ((array!79825 0))(
  ( (array!79826 (arr!38514 (Array (_ BitVec 32) (_ BitVec 64))) (size!39050 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79825)

(declare-datatypes ((List!27287 0))(
  ( (Nil!27284) (Cons!27283 (h!28492 (_ BitVec 64)) (t!40750 List!27287)) )
))
(declare-fun acc!846 () List!27287)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun lt!561367 () List!27287)

(assert (=> b!1238677 (= lt!561367 (Cons!27283 (select (arr!38514 a!3835) from!3213) acc!846))))

(declare-fun lt!561368 () Unit!41119)

(declare-fun lemmaListSubSeqRefl!0 (List!27287) Unit!41119)

(assert (=> b!1238677 (= lt!561368 (lemmaListSubSeqRefl!0 lt!561367))))

(declare-fun subseq!603 (List!27287 List!27287) Bool)

(assert (=> b!1238677 (subseq!603 lt!561367 lt!561367)))

(declare-fun lt!561371 () Unit!41119)

(declare-fun subseqTail!90 (List!27287 List!27287) Unit!41119)

(assert (=> b!1238677 (= lt!561371 (subseqTail!90 lt!561367 lt!561367))))

(assert (=> b!1238677 (subseq!603 acc!846 lt!561367)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79825 List!27287 List!27287 (_ BitVec 32)) Unit!41119)

(assert (=> b!1238677 (= lt!561370 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561367 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79825 (_ BitVec 32) List!27287) Bool)

(assert (=> b!1238677 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1238678 () Bool)

(declare-fun res!826315 () Bool)

(declare-fun e!702037 () Bool)

(assert (=> b!1238678 (=> (not res!826315) (not e!702037))))

(assert (=> b!1238678 (= res!826315 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238679 () Bool)

(declare-fun res!826318 () Bool)

(assert (=> b!1238679 (=> (not res!826318) (not e!702037))))

(declare-fun noDuplicate!1946 (List!27287) Bool)

(assert (=> b!1238679 (= res!826318 (noDuplicate!1946 acc!846))))

(declare-fun b!1238680 () Bool)

(declare-fun res!826314 () Bool)

(assert (=> b!1238680 (=> (not res!826314) (not e!702037))))

(assert (=> b!1238680 (= res!826314 (not (= from!3213 (bvsub (size!39050 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238682 () Bool)

(assert (=> b!1238682 (= e!702037 false)))

(declare-fun lt!561369 () Unit!41119)

(assert (=> b!1238682 (= lt!561369 e!702039)))

(declare-fun c!121042 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238682 (= c!121042 (validKeyInArray!0 (select (arr!38514 a!3835) from!3213)))))

(declare-fun b!1238681 () Bool)

(declare-fun res!826313 () Bool)

(assert (=> b!1238681 (=> (not res!826313) (not e!702037))))

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7349 (List!27287 (_ BitVec 64)) Bool)

(assert (=> b!1238681 (= res!826313 (contains!7349 acc!846 k0!2925))))

(declare-fun res!826312 () Bool)

(assert (=> start!103190 (=> (not res!826312) (not e!702037))))

(assert (=> start!103190 (= res!826312 (and (bvslt (size!39050 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39050 a!3835))))))

(assert (=> start!103190 e!702037))

(declare-fun array_inv!29362 (array!79825) Bool)

(assert (=> start!103190 (array_inv!29362 a!3835)))

(assert (=> start!103190 true))

(declare-fun b!1238683 () Bool)

(declare-fun res!826316 () Bool)

(assert (=> b!1238683 (=> (not res!826316) (not e!702037))))

(assert (=> b!1238683 (= res!826316 (not (contains!7349 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238684 () Bool)

(declare-fun res!826317 () Bool)

(assert (=> b!1238684 (=> (not res!826317) (not e!702037))))

(assert (=> b!1238684 (= res!826317 (not (contains!7349 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103190 res!826312) b!1238679))

(assert (= (and b!1238679 res!826318) b!1238684))

(assert (= (and b!1238684 res!826317) b!1238683))

(assert (= (and b!1238683 res!826316) b!1238678))

(assert (= (and b!1238678 res!826315) b!1238681))

(assert (= (and b!1238681 res!826313) b!1238680))

(assert (= (and b!1238680 res!826314) b!1238682))

(assert (= (and b!1238682 c!121042) b!1238677))

(assert (= (and b!1238682 (not c!121042)) b!1238676))

(declare-fun m!1142183 () Bool)

(assert (=> b!1238683 m!1142183))

(declare-fun m!1142185 () Bool)

(assert (=> b!1238678 m!1142185))

(declare-fun m!1142187 () Bool)

(assert (=> start!103190 m!1142187))

(declare-fun m!1142189 () Bool)

(assert (=> b!1238684 m!1142189))

(declare-fun m!1142191 () Bool)

(assert (=> b!1238681 m!1142191))

(declare-fun m!1142193 () Bool)

(assert (=> b!1238679 m!1142193))

(declare-fun m!1142195 () Bool)

(assert (=> b!1238677 m!1142195))

(declare-fun m!1142197 () Bool)

(assert (=> b!1238677 m!1142197))

(declare-fun m!1142199 () Bool)

(assert (=> b!1238677 m!1142199))

(declare-fun m!1142201 () Bool)

(assert (=> b!1238677 m!1142201))

(declare-fun m!1142203 () Bool)

(assert (=> b!1238677 m!1142203))

(declare-fun m!1142205 () Bool)

(assert (=> b!1238677 m!1142205))

(declare-fun m!1142207 () Bool)

(assert (=> b!1238677 m!1142207))

(assert (=> b!1238682 m!1142201))

(assert (=> b!1238682 m!1142201))

(declare-fun m!1142209 () Bool)

(assert (=> b!1238682 m!1142209))

(check-sat (not b!1238683) (not start!103190) (not b!1238677) (not b!1238682) (not b!1238681) (not b!1238679) (not b!1238684) (not b!1238678))
