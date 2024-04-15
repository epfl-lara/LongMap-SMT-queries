; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101968 () Bool)

(assert start!101968)

(declare-fun b!1227567 () Bool)

(declare-fun res!816231 () Bool)

(declare-fun e!696970 () Bool)

(assert (=> b!1227567 (=> res!816231 e!696970)))

(declare-datatypes ((List!27081 0))(
  ( (Nil!27078) (Cons!27077 (h!28286 (_ BitVec 64)) (t!40535 List!27081)) )
))
(declare-fun contains!7053 (List!27081 (_ BitVec 64)) Bool)

(assert (=> b!1227567 (= res!816231 (contains!7053 Nil!27078 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227568 () Bool)

(declare-fun res!816234 () Bool)

(declare-fun e!696971 () Bool)

(assert (=> b!1227568 (=> (not res!816234) (not e!696971))))

(declare-fun acc!823 () List!27081)

(declare-fun noDuplicate!1696 (List!27081) Bool)

(assert (=> b!1227568 (= res!816234 (noDuplicate!1696 acc!823))))

(declare-fun b!1227569 () Bool)

(declare-fun res!816232 () Bool)

(assert (=> b!1227569 (=> (not res!816232) (not e!696971))))

(declare-datatypes ((array!79168 0))(
  ( (array!79169 (arr!38207 (Array (_ BitVec 32) (_ BitVec 64))) (size!38745 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79168)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227569 (= res!816232 (validKeyInArray!0 (select (arr!38207 a!3806) from!3184)))))

(declare-fun b!1227570 () Bool)

(declare-fun res!816227 () Bool)

(assert (=> b!1227570 (=> (not res!816227) (not e!696971))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79168 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227570 (= res!816227 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1227571 () Bool)

(declare-fun res!816228 () Bool)

(assert (=> b!1227571 (=> (not res!816228) (not e!696971))))

(declare-fun arrayNoDuplicates!0 (array!79168 (_ BitVec 32) List!27081) Bool)

(assert (=> b!1227571 (= res!816228 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1227572 () Bool)

(declare-fun res!816235 () Bool)

(assert (=> b!1227572 (=> res!816235 e!696970)))

(declare-fun subseq!485 (List!27081 List!27081) Bool)

(assert (=> b!1227572 (= res!816235 (not (subseq!485 Nil!27078 acc!823)))))

(declare-fun b!1227573 () Bool)

(assert (=> b!1227573 (= e!696970 true)))

(declare-datatypes ((Unit!40505 0))(
  ( (Unit!40506) )
))
(declare-fun lt!558752 () Unit!40505)

(declare-fun noDuplicateSubseq!38 (List!27081 List!27081) Unit!40505)

(assert (=> b!1227573 (= lt!558752 (noDuplicateSubseq!38 Nil!27078 acc!823))))

(declare-fun b!1227574 () Bool)

(declare-fun res!816239 () Bool)

(assert (=> b!1227574 (=> (not res!816239) (not e!696971))))

(assert (=> b!1227574 (= res!816239 (validKeyInArray!0 k0!2913))))

(declare-fun res!816230 () Bool)

(assert (=> start!101968 (=> (not res!816230) (not e!696971))))

(assert (=> start!101968 (= res!816230 (bvslt (size!38745 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101968 e!696971))

(declare-fun array_inv!29190 (array!79168) Bool)

(assert (=> start!101968 (array_inv!29190 a!3806)))

(assert (=> start!101968 true))

(declare-fun b!1227575 () Bool)

(declare-fun res!816236 () Bool)

(assert (=> b!1227575 (=> (not res!816236) (not e!696971))))

(assert (=> b!1227575 (= res!816236 (not (contains!7053 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227576 () Bool)

(declare-fun res!816238 () Bool)

(assert (=> b!1227576 (=> (not res!816238) (not e!696971))))

(assert (=> b!1227576 (= res!816238 (not (contains!7053 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227577 () Bool)

(declare-fun res!816229 () Bool)

(assert (=> b!1227577 (=> res!816229 e!696970)))

(assert (=> b!1227577 (= res!816229 (contains!7053 Nil!27078 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227578 () Bool)

(declare-fun res!816237 () Bool)

(assert (=> b!1227578 (=> (not res!816237) (not e!696971))))

(assert (=> b!1227578 (= res!816237 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38745 a!3806)) (bvslt from!3184 (size!38745 a!3806))))))

(declare-fun b!1227579 () Bool)

(assert (=> b!1227579 (= e!696971 (not e!696970))))

(declare-fun res!816233 () Bool)

(assert (=> b!1227579 (=> res!816233 e!696970)))

(assert (=> b!1227579 (= res!816233 (bvsgt from!3184 (size!38745 a!3806)))))

(assert (=> b!1227579 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27077 (select (arr!38207 a!3806) from!3184) acc!823))))

(assert (= (and start!101968 res!816230) b!1227574))

(assert (= (and b!1227574 res!816239) b!1227578))

(assert (= (and b!1227578 res!816237) b!1227568))

(assert (= (and b!1227568 res!816234) b!1227576))

(assert (= (and b!1227576 res!816238) b!1227575))

(assert (= (and b!1227575 res!816236) b!1227570))

(assert (= (and b!1227570 res!816227) b!1227571))

(assert (= (and b!1227571 res!816228) b!1227569))

(assert (= (and b!1227569 res!816232) b!1227579))

(assert (= (and b!1227579 (not res!816233)) b!1227567))

(assert (= (and b!1227567 (not res!816231)) b!1227577))

(assert (= (and b!1227577 (not res!816229)) b!1227572))

(assert (= (and b!1227572 (not res!816235)) b!1227573))

(declare-fun m!1131831 () Bool)

(assert (=> b!1227573 m!1131831))

(declare-fun m!1131833 () Bool)

(assert (=> b!1227574 m!1131833))

(declare-fun m!1131835 () Bool)

(assert (=> b!1227577 m!1131835))

(declare-fun m!1131837 () Bool)

(assert (=> start!101968 m!1131837))

(declare-fun m!1131839 () Bool)

(assert (=> b!1227568 m!1131839))

(declare-fun m!1131841 () Bool)

(assert (=> b!1227576 m!1131841))

(declare-fun m!1131843 () Bool)

(assert (=> b!1227570 m!1131843))

(declare-fun m!1131845 () Bool)

(assert (=> b!1227572 m!1131845))

(declare-fun m!1131847 () Bool)

(assert (=> b!1227579 m!1131847))

(declare-fun m!1131849 () Bool)

(assert (=> b!1227579 m!1131849))

(declare-fun m!1131851 () Bool)

(assert (=> b!1227575 m!1131851))

(declare-fun m!1131853 () Bool)

(assert (=> b!1227571 m!1131853))

(assert (=> b!1227569 m!1131847))

(assert (=> b!1227569 m!1131847))

(declare-fun m!1131855 () Bool)

(assert (=> b!1227569 m!1131855))

(declare-fun m!1131857 () Bool)

(assert (=> b!1227567 m!1131857))

(check-sat (not start!101968) (not b!1227569) (not b!1227568) (not b!1227576) (not b!1227567) (not b!1227573) (not b!1227575) (not b!1227574) (not b!1227577) (not b!1227570) (not b!1227571) (not b!1227579) (not b!1227572))
(check-sat)
