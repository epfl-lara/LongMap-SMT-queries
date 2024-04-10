; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102848 () Bool)

(assert start!102848)

(declare-fun b!1236214 () Bool)

(declare-fun e!700747 () Bool)

(assert (=> b!1236214 (= e!700747 (not true))))

(declare-datatypes ((array!79693 0))(
  ( (array!79694 (arr!38454 (Array (_ BitVec 32) (_ BitVec 64))) (size!38990 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79693)

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1236214 (not (arrayContainsKey!0 a!3835 k0!2925 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-datatypes ((List!27227 0))(
  ( (Nil!27224) (Cons!27223 (h!28432 (_ BitVec 64)) (t!40690 List!27227)) )
))
(declare-fun acc!846 () List!27227)

(declare-datatypes ((Unit!41006 0))(
  ( (Unit!41007) )
))
(declare-fun lt!560745 () Unit!41006)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79693 (_ BitVec 32) (_ BitVec 64) List!27227) Unit!41006)

(assert (=> b!1236214 (= lt!560745 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k0!2925 acc!846))))

(declare-fun b!1236215 () Bool)

(declare-fun e!700749 () Unit!41006)

(declare-fun lt!560742 () Unit!41006)

(assert (=> b!1236215 (= e!700749 lt!560742)))

(declare-fun lt!560746 () List!27227)

(assert (=> b!1236215 (= lt!560746 (Cons!27223 (select (arr!38454 a!3835) from!3213) acc!846))))

(declare-fun lt!560743 () Unit!41006)

(declare-fun lemmaListSubSeqRefl!0 (List!27227) Unit!41006)

(assert (=> b!1236215 (= lt!560743 (lemmaListSubSeqRefl!0 lt!560746))))

(declare-fun subseq!561 (List!27227 List!27227) Bool)

(assert (=> b!1236215 (subseq!561 lt!560746 lt!560746)))

(declare-fun lt!560747 () Unit!41006)

(declare-fun subseqTail!54 (List!27227 List!27227) Unit!41006)

(assert (=> b!1236215 (= lt!560747 (subseqTail!54 lt!560746 lt!560746))))

(assert (=> b!1236215 (subseq!561 acc!846 lt!560746)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79693 List!27227 List!27227 (_ BitVec 32)) Unit!41006)

(assert (=> b!1236215 (= lt!560742 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560746 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79693 (_ BitVec 32) List!27227) Bool)

(assert (=> b!1236215 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1236216 () Bool)

(declare-fun res!824208 () Bool)

(declare-fun e!700746 () Bool)

(assert (=> b!1236216 (=> (not res!824208) (not e!700746))))

(assert (=> b!1236216 (= res!824208 (not (= from!3213 (bvsub (size!38990 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236217 () Bool)

(assert (=> b!1236217 (= e!700746 e!700747)))

(declare-fun res!824205 () Bool)

(assert (=> b!1236217 (=> (not res!824205) (not e!700747))))

(assert (=> b!1236217 (= res!824205 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38990 a!3835))))))

(declare-fun lt!560744 () Unit!41006)

(assert (=> b!1236217 (= lt!560744 e!700749)))

(declare-fun c!120865 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236217 (= c!120865 (validKeyInArray!0 (select (arr!38454 a!3835) from!3213)))))

(declare-fun b!1236218 () Bool)

(declare-fun res!824204 () Bool)

(assert (=> b!1236218 (=> (not res!824204) (not e!700746))))

(assert (=> b!1236218 (= res!824204 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236219 () Bool)

(declare-fun res!824210 () Bool)

(assert (=> b!1236219 (=> (not res!824210) (not e!700746))))

(declare-fun contains!7289 (List!27227 (_ BitVec 64)) Bool)

(assert (=> b!1236219 (= res!824210 (contains!7289 acc!846 k0!2925))))

(declare-fun b!1236220 () Bool)

(declare-fun res!824206 () Bool)

(assert (=> b!1236220 (=> (not res!824206) (not e!700746))))

(assert (=> b!1236220 (= res!824206 (not (contains!7289 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236221 () Bool)

(declare-fun res!824212 () Bool)

(assert (=> b!1236221 (=> (not res!824212) (not e!700746))))

(declare-fun noDuplicate!1886 (List!27227) Bool)

(assert (=> b!1236221 (= res!824212 (noDuplicate!1886 acc!846))))

(declare-fun res!824207 () Bool)

(assert (=> start!102848 (=> (not res!824207) (not e!700746))))

(assert (=> start!102848 (= res!824207 (and (bvslt (size!38990 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38990 a!3835))))))

(assert (=> start!102848 e!700746))

(declare-fun array_inv!29302 (array!79693) Bool)

(assert (=> start!102848 (array_inv!29302 a!3835)))

(assert (=> start!102848 true))

(declare-fun b!1236222 () Bool)

(declare-fun res!824211 () Bool)

(assert (=> b!1236222 (=> (not res!824211) (not e!700747))))

(assert (=> b!1236222 (= res!824211 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1236223 () Bool)

(declare-fun Unit!41008 () Unit!41006)

(assert (=> b!1236223 (= e!700749 Unit!41008)))

(declare-fun b!1236224 () Bool)

(declare-fun res!824209 () Bool)

(assert (=> b!1236224 (=> (not res!824209) (not e!700746))))

(assert (=> b!1236224 (= res!824209 (not (contains!7289 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102848 res!824207) b!1236221))

(assert (= (and b!1236221 res!824212) b!1236224))

(assert (= (and b!1236224 res!824209) b!1236220))

(assert (= (and b!1236220 res!824206) b!1236218))

(assert (= (and b!1236218 res!824204) b!1236219))

(assert (= (and b!1236219 res!824210) b!1236216))

(assert (= (and b!1236216 res!824208) b!1236217))

(assert (= (and b!1236217 c!120865) b!1236215))

(assert (= (and b!1236217 (not c!120865)) b!1236223))

(assert (= (and b!1236217 res!824205) b!1236222))

(assert (= (and b!1236222 res!824211) b!1236214))

(declare-fun m!1140051 () Bool)

(assert (=> start!102848 m!1140051))

(declare-fun m!1140053 () Bool)

(assert (=> b!1236221 m!1140053))

(declare-fun m!1140055 () Bool)

(assert (=> b!1236222 m!1140055))

(declare-fun m!1140057 () Bool)

(assert (=> b!1236214 m!1140057))

(declare-fun m!1140059 () Bool)

(assert (=> b!1236214 m!1140059))

(declare-fun m!1140061 () Bool)

(assert (=> b!1236218 m!1140061))

(declare-fun m!1140063 () Bool)

(assert (=> b!1236217 m!1140063))

(assert (=> b!1236217 m!1140063))

(declare-fun m!1140065 () Bool)

(assert (=> b!1236217 m!1140065))

(declare-fun m!1140067 () Bool)

(assert (=> b!1236224 m!1140067))

(declare-fun m!1140069 () Bool)

(assert (=> b!1236215 m!1140069))

(declare-fun m!1140071 () Bool)

(assert (=> b!1236215 m!1140071))

(declare-fun m!1140073 () Bool)

(assert (=> b!1236215 m!1140073))

(declare-fun m!1140075 () Bool)

(assert (=> b!1236215 m!1140075))

(assert (=> b!1236215 m!1140055))

(declare-fun m!1140077 () Bool)

(assert (=> b!1236215 m!1140077))

(assert (=> b!1236215 m!1140063))

(declare-fun m!1140079 () Bool)

(assert (=> b!1236219 m!1140079))

(declare-fun m!1140081 () Bool)

(assert (=> b!1236220 m!1140081))

(check-sat (not start!102848) (not b!1236217) (not b!1236220) (not b!1236224) (not b!1236214) (not b!1236218) (not b!1236215) (not b!1236222) (not b!1236221) (not b!1236219))
(check-sat)
