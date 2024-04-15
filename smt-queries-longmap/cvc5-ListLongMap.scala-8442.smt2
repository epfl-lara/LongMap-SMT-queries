; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102788 () Bool)

(assert start!102788)

(declare-fun b!1235251 () Bool)

(declare-fun res!823450 () Bool)

(declare-fun e!700367 () Bool)

(assert (=> b!1235251 (=> (not res!823450) (not e!700367))))

(declare-datatypes ((List!27260 0))(
  ( (Nil!27257) (Cons!27256 (h!28465 (_ BitVec 64)) (t!40714 List!27260)) )
))
(declare-fun acc!846 () List!27260)

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7232 (List!27260 (_ BitVec 64)) Bool)

(assert (=> b!1235251 (= res!823450 (contains!7232 acc!846 k!2925))))

(declare-fun b!1235252 () Bool)

(declare-fun res!823460 () Bool)

(assert (=> b!1235252 (=> (not res!823460) (not e!700367))))

(declare-datatypes ((array!79556 0))(
  ( (array!79557 (arr!38386 (Array (_ BitVec 32) (_ BitVec 64))) (size!38924 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79556)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79556 (_ BitVec 32) List!27260) Bool)

(assert (=> b!1235252 (= res!823460 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235253 () Bool)

(declare-fun e!700365 () Bool)

(assert (=> b!1235253 (= e!700367 (not e!700365))))

(declare-fun res!823459 () Bool)

(assert (=> b!1235253 (=> res!823459 e!700365)))

(assert (=> b!1235253 (= res!823459 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun lt!560049 () List!27260)

(declare-fun subseq!532 (List!27260 List!27260) Bool)

(assert (=> b!1235253 (subseq!532 acc!846 lt!560049)))

(declare-datatypes ((Unit!40767 0))(
  ( (Unit!40768) )
))
(declare-fun lt!560047 () Unit!40767)

(declare-fun subseqTail!25 (List!27260 List!27260) Unit!40767)

(assert (=> b!1235253 (= lt!560047 (subseqTail!25 lt!560049 lt!560049))))

(assert (=> b!1235253 (subseq!532 lt!560049 lt!560049)))

(declare-fun lt!560050 () Unit!40767)

(declare-fun lemmaListSubSeqRefl!0 (List!27260) Unit!40767)

(assert (=> b!1235253 (= lt!560050 (lemmaListSubSeqRefl!0 lt!560049))))

(assert (=> b!1235253 (= lt!560049 (Cons!27256 (select (arr!38386 a!3835) from!3213) acc!846))))

(declare-fun b!1235254 () Bool)

(declare-fun res!823449 () Bool)

(assert (=> b!1235254 (=> (not res!823449) (not e!700367))))

(declare-fun noDuplicate!1875 (List!27260) Bool)

(assert (=> b!1235254 (= res!823449 (noDuplicate!1875 acc!846))))

(declare-fun b!1235255 () Bool)

(declare-fun res!823453 () Bool)

(assert (=> b!1235255 (=> res!823453 e!700365)))

(assert (=> b!1235255 (= res!823453 (contains!7232 lt!560049 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1235256 () Bool)

(declare-fun res!823457 () Bool)

(assert (=> b!1235256 (=> (not res!823457) (not e!700367))))

(assert (=> b!1235256 (= res!823457 (not (contains!7232 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235257 () Bool)

(declare-fun res!823454 () Bool)

(assert (=> b!1235257 (=> res!823454 e!700365)))

(assert (=> b!1235257 (= res!823454 (contains!7232 lt!560049 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!823451 () Bool)

(assert (=> start!102788 (=> (not res!823451) (not e!700367))))

(assert (=> start!102788 (= res!823451 (and (bvslt (size!38924 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38924 a!3835))))))

(assert (=> start!102788 e!700367))

(declare-fun array_inv!29369 (array!79556) Bool)

(assert (=> start!102788 (array_inv!29369 a!3835)))

(assert (=> start!102788 true))

(declare-fun b!1235258 () Bool)

(declare-fun res!823452 () Bool)

(assert (=> b!1235258 (=> (not res!823452) (not e!700367))))

(assert (=> b!1235258 (= res!823452 (not (= from!3213 (bvsub (size!38924 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235259 () Bool)

(declare-fun res!823456 () Bool)

(assert (=> b!1235259 (=> res!823456 e!700365)))

(assert (=> b!1235259 (= res!823456 (not (noDuplicate!1875 lt!560049)))))

(declare-fun b!1235260 () Bool)

(declare-fun res!823455 () Bool)

(assert (=> b!1235260 (=> (not res!823455) (not e!700367))))

(assert (=> b!1235260 (= res!823455 (not (contains!7232 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235261 () Bool)

(declare-fun res!823458 () Bool)

(assert (=> b!1235261 (=> (not res!823458) (not e!700367))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235261 (= res!823458 (validKeyInArray!0 (select (arr!38386 a!3835) from!3213)))))

(declare-fun b!1235262 () Bool)

(assert (=> b!1235262 (= e!700365 true)))

(declare-fun lt!560048 () Bool)

(assert (=> b!1235262 (= lt!560048 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!560049))))

(declare-fun lt!560051 () Unit!40767)

(declare-fun noDuplicateSubseq!79 (List!27260 List!27260) Unit!40767)

(assert (=> b!1235262 (= lt!560051 (noDuplicateSubseq!79 acc!846 lt!560049))))

(assert (= (and start!102788 res!823451) b!1235254))

(assert (= (and b!1235254 res!823449) b!1235256))

(assert (= (and b!1235256 res!823457) b!1235260))

(assert (= (and b!1235260 res!823455) b!1235252))

(assert (= (and b!1235252 res!823460) b!1235251))

(assert (= (and b!1235251 res!823450) b!1235258))

(assert (= (and b!1235258 res!823452) b!1235261))

(assert (= (and b!1235261 res!823458) b!1235253))

(assert (= (and b!1235253 (not res!823459)) b!1235259))

(assert (= (and b!1235259 (not res!823456)) b!1235255))

(assert (= (and b!1235255 (not res!823453)) b!1235257))

(assert (= (and b!1235257 (not res!823454)) b!1235262))

(declare-fun m!1138709 () Bool)

(assert (=> b!1235257 m!1138709))

(declare-fun m!1138711 () Bool)

(assert (=> b!1235252 m!1138711))

(declare-fun m!1138713 () Bool)

(assert (=> start!102788 m!1138713))

(declare-fun m!1138715 () Bool)

(assert (=> b!1235255 m!1138715))

(declare-fun m!1138717 () Bool)

(assert (=> b!1235256 m!1138717))

(declare-fun m!1138719 () Bool)

(assert (=> b!1235259 m!1138719))

(declare-fun m!1138721 () Bool)

(assert (=> b!1235261 m!1138721))

(assert (=> b!1235261 m!1138721))

(declare-fun m!1138723 () Bool)

(assert (=> b!1235261 m!1138723))

(declare-fun m!1138725 () Bool)

(assert (=> b!1235251 m!1138725))

(declare-fun m!1138727 () Bool)

(assert (=> b!1235253 m!1138727))

(declare-fun m!1138729 () Bool)

(assert (=> b!1235253 m!1138729))

(declare-fun m!1138731 () Bool)

(assert (=> b!1235253 m!1138731))

(assert (=> b!1235253 m!1138721))

(declare-fun m!1138733 () Bool)

(assert (=> b!1235253 m!1138733))

(declare-fun m!1138735 () Bool)

(assert (=> b!1235262 m!1138735))

(declare-fun m!1138737 () Bool)

(assert (=> b!1235262 m!1138737))

(declare-fun m!1138739 () Bool)

(assert (=> b!1235254 m!1138739))

(declare-fun m!1138741 () Bool)

(assert (=> b!1235260 m!1138741))

(push 1)

(assert (not b!1235256))

(assert (not b!1235259))

(assert (not start!102788))

(assert (not b!1235260))

(assert (not b!1235261))

(assert (not b!1235257))

(assert (not b!1235252))

(assert (not b!1235254))

(assert (not b!1235255))

(assert (not b!1235262))

(assert (not b!1235251))

(assert (not b!1235253))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

