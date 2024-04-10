; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102846 () Bool)

(assert start!102846)

(declare-fun b!1236181 () Bool)

(declare-datatypes ((Unit!41003 0))(
  ( (Unit!41004) )
))
(declare-fun e!700736 () Unit!41003)

(declare-fun Unit!41005 () Unit!41003)

(assert (=> b!1236181 (= e!700736 Unit!41005)))

(declare-fun b!1236182 () Bool)

(declare-fun e!700735 () Bool)

(declare-fun e!700737 () Bool)

(assert (=> b!1236182 (= e!700735 e!700737)))

(declare-fun res!824184 () Bool)

(assert (=> b!1236182 (=> (not res!824184) (not e!700737))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79691 0))(
  ( (array!79692 (arr!38453 (Array (_ BitVec 32) (_ BitVec 64))) (size!38989 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79691)

(assert (=> b!1236182 (= res!824184 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38989 a!3835))))))

(declare-fun lt!560728 () Unit!41003)

(assert (=> b!1236182 (= lt!560728 e!700736)))

(declare-fun c!120862 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236182 (= c!120862 (validKeyInArray!0 (select (arr!38453 a!3835) from!3213)))))

(declare-fun b!1236183 () Bool)

(declare-fun res!824185 () Bool)

(assert (=> b!1236183 (=> (not res!824185) (not e!700735))))

(declare-datatypes ((List!27226 0))(
  ( (Nil!27223) (Cons!27222 (h!28431 (_ BitVec 64)) (t!40689 List!27226)) )
))
(declare-fun acc!846 () List!27226)

(declare-fun contains!7288 (List!27226 (_ BitVec 64)) Bool)

(assert (=> b!1236183 (= res!824185 (not (contains!7288 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!824178 () Bool)

(assert (=> start!102846 (=> (not res!824178) (not e!700735))))

(assert (=> start!102846 (= res!824178 (and (bvslt (size!38989 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38989 a!3835))))))

(assert (=> start!102846 e!700735))

(declare-fun array_inv!29301 (array!79691) Bool)

(assert (=> start!102846 (array_inv!29301 a!3835)))

(assert (=> start!102846 true))

(declare-fun b!1236184 () Bool)

(declare-fun res!824182 () Bool)

(assert (=> b!1236184 (=> (not res!824182) (not e!700735))))

(declare-fun noDuplicate!1885 (List!27226) Bool)

(assert (=> b!1236184 (= res!824182 (noDuplicate!1885 acc!846))))

(declare-fun b!1236185 () Bool)

(declare-fun res!824183 () Bool)

(assert (=> b!1236185 (=> (not res!824183) (not e!700735))))

(assert (=> b!1236185 (= res!824183 (not (= from!3213 (bvsub (size!38989 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236186 () Bool)

(assert (=> b!1236186 (= e!700737 (not true))))

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79691 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1236186 (not (arrayContainsKey!0 a!3835 k!2925 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun lt!560724 () Unit!41003)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79691 (_ BitVec 32) (_ BitVec 64) List!27226) Unit!41003)

(assert (=> b!1236186 (= lt!560724 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k!2925 acc!846))))

(declare-fun b!1236187 () Bool)

(declare-fun res!824177 () Bool)

(assert (=> b!1236187 (=> (not res!824177) (not e!700735))))

(assert (=> b!1236187 (= res!824177 (not (contains!7288 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236188 () Bool)

(declare-fun res!824179 () Bool)

(assert (=> b!1236188 (=> (not res!824179) (not e!700737))))

(declare-fun arrayNoDuplicates!0 (array!79691 (_ BitVec 32) List!27226) Bool)

(assert (=> b!1236188 (= res!824179 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1236189 () Bool)

(declare-fun res!824181 () Bool)

(assert (=> b!1236189 (=> (not res!824181) (not e!700735))))

(assert (=> b!1236189 (= res!824181 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236190 () Bool)

(declare-fun lt!560725 () Unit!41003)

(assert (=> b!1236190 (= e!700736 lt!560725)))

(declare-fun lt!560729 () List!27226)

(assert (=> b!1236190 (= lt!560729 (Cons!27222 (select (arr!38453 a!3835) from!3213) acc!846))))

(declare-fun lt!560727 () Unit!41003)

(declare-fun lemmaListSubSeqRefl!0 (List!27226) Unit!41003)

(assert (=> b!1236190 (= lt!560727 (lemmaListSubSeqRefl!0 lt!560729))))

(declare-fun subseq!560 (List!27226 List!27226) Bool)

(assert (=> b!1236190 (subseq!560 lt!560729 lt!560729)))

(declare-fun lt!560726 () Unit!41003)

(declare-fun subseqTail!53 (List!27226 List!27226) Unit!41003)

(assert (=> b!1236190 (= lt!560726 (subseqTail!53 lt!560729 lt!560729))))

(assert (=> b!1236190 (subseq!560 acc!846 lt!560729)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79691 List!27226 List!27226 (_ BitVec 32)) Unit!41003)

(assert (=> b!1236190 (= lt!560725 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560729 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1236190 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1236191 () Bool)

(declare-fun res!824180 () Bool)

(assert (=> b!1236191 (=> (not res!824180) (not e!700735))))

(assert (=> b!1236191 (= res!824180 (contains!7288 acc!846 k!2925))))

(assert (= (and start!102846 res!824178) b!1236184))

(assert (= (and b!1236184 res!824182) b!1236187))

(assert (= (and b!1236187 res!824177) b!1236183))

(assert (= (and b!1236183 res!824185) b!1236189))

(assert (= (and b!1236189 res!824181) b!1236191))

(assert (= (and b!1236191 res!824180) b!1236185))

(assert (= (and b!1236185 res!824183) b!1236182))

(assert (= (and b!1236182 c!120862) b!1236190))

(assert (= (and b!1236182 (not c!120862)) b!1236181))

(assert (= (and b!1236182 res!824184) b!1236188))

(assert (= (and b!1236188 res!824179) b!1236186))

(declare-fun m!1140019 () Bool)

(assert (=> b!1236187 m!1140019))

(declare-fun m!1140021 () Bool)

(assert (=> b!1236189 m!1140021))

(declare-fun m!1140023 () Bool)

(assert (=> b!1236186 m!1140023))

(declare-fun m!1140025 () Bool)

(assert (=> b!1236186 m!1140025))

(declare-fun m!1140027 () Bool)

(assert (=> start!102846 m!1140027))

(declare-fun m!1140029 () Bool)

(assert (=> b!1236191 m!1140029))

(declare-fun m!1140031 () Bool)

(assert (=> b!1236184 m!1140031))

(declare-fun m!1140033 () Bool)

(assert (=> b!1236190 m!1140033))

(declare-fun m!1140035 () Bool)

(assert (=> b!1236190 m!1140035))

(declare-fun m!1140037 () Bool)

(assert (=> b!1236190 m!1140037))

(declare-fun m!1140039 () Bool)

(assert (=> b!1236190 m!1140039))

(declare-fun m!1140041 () Bool)

(assert (=> b!1236190 m!1140041))

(declare-fun m!1140043 () Bool)

(assert (=> b!1236190 m!1140043))

(declare-fun m!1140045 () Bool)

(assert (=> b!1236190 m!1140045))

(declare-fun m!1140047 () Bool)

(assert (=> b!1236183 m!1140047))

(assert (=> b!1236188 m!1140039))

(assert (=> b!1236182 m!1140041))

(assert (=> b!1236182 m!1140041))

(declare-fun m!1140049 () Bool)

(assert (=> b!1236182 m!1140049))

(push 1)

