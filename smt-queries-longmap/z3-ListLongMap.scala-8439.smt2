; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103006 () Bool)

(assert start!103006)

(declare-fun b!1236247 () Bool)

(declare-fun res!823623 () Bool)

(declare-fun e!701163 () Bool)

(assert (=> b!1236247 (=> (not res!823623) (not e!701163))))

(declare-datatypes ((List!27212 0))(
  ( (Nil!27209) (Cons!27208 (h!28426 (_ BitVec 64)) (t!40667 List!27212)) )
))
(declare-fun acc!846 () List!27212)

(declare-fun noDuplicate!1864 (List!27212) Bool)

(assert (=> b!1236247 (= res!823623 (noDuplicate!1864 acc!846))))

(declare-fun b!1236248 () Bool)

(declare-fun res!823621 () Bool)

(declare-fun e!701165 () Bool)

(assert (=> b!1236248 (=> res!823621 e!701165)))

(declare-fun lt!560542 () List!27212)

(assert (=> b!1236248 (= res!823621 (not (noDuplicate!1864 lt!560542)))))

(declare-fun b!1236249 () Bool)

(declare-fun res!823620 () Bool)

(assert (=> b!1236249 (=> (not res!823620) (not e!701163))))

(declare-fun contains!7283 (List!27212 (_ BitVec 64)) Bool)

(assert (=> b!1236249 (= res!823620 (not (contains!7283 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!823624 () Bool)

(assert (=> start!103006 (=> (not res!823624) (not e!701163))))

(declare-datatypes ((array!79649 0))(
  ( (array!79650 (arr!38426 (Array (_ BitVec 32) (_ BitVec 64))) (size!38963 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79649)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!103006 (= res!823624 (and (bvslt (size!38963 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38963 a!3835))))))

(assert (=> start!103006 e!701163))

(declare-fun array_inv!29364 (array!79649) Bool)

(assert (=> start!103006 (array_inv!29364 a!3835)))

(assert (=> start!103006 true))

(declare-fun b!1236250 () Bool)

(declare-fun res!823629 () Bool)

(assert (=> b!1236250 (=> (not res!823629) (not e!701163))))

(assert (=> b!1236250 (= res!823629 (not (contains!7283 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236251 () Bool)

(assert (=> b!1236251 (= e!701165 true)))

(declare-fun lt!560543 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79649 (_ BitVec 32) List!27212) Bool)

(assert (=> b!1236251 (= lt!560543 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!560542))))

(declare-datatypes ((Unit!40871 0))(
  ( (Unit!40872) )
))
(declare-fun lt!560544 () Unit!40871)

(declare-fun noDuplicateSubseq!68 (List!27212 List!27212) Unit!40871)

(assert (=> b!1236251 (= lt!560544 (noDuplicateSubseq!68 acc!846 lt!560542))))

(declare-fun b!1236252 () Bool)

(assert (=> b!1236252 (= e!701163 (not e!701165))))

(declare-fun res!823625 () Bool)

(assert (=> b!1236252 (=> res!823625 e!701165)))

(assert (=> b!1236252 (= res!823625 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!521 (List!27212 List!27212) Bool)

(assert (=> b!1236252 (subseq!521 acc!846 lt!560542)))

(declare-fun lt!560546 () Unit!40871)

(declare-fun subseqTail!14 (List!27212 List!27212) Unit!40871)

(assert (=> b!1236252 (= lt!560546 (subseqTail!14 lt!560542 lt!560542))))

(assert (=> b!1236252 (subseq!521 lt!560542 lt!560542)))

(declare-fun lt!560545 () Unit!40871)

(declare-fun lemmaListSubSeqRefl!0 (List!27212) Unit!40871)

(assert (=> b!1236252 (= lt!560545 (lemmaListSubSeqRefl!0 lt!560542))))

(assert (=> b!1236252 (= lt!560542 (Cons!27208 (select (arr!38426 a!3835) from!3213) acc!846))))

(declare-fun b!1236253 () Bool)

(declare-fun res!823618 () Bool)

(assert (=> b!1236253 (=> (not res!823618) (not e!701163))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236253 (= res!823618 (validKeyInArray!0 (select (arr!38426 a!3835) from!3213)))))

(declare-fun b!1236254 () Bool)

(declare-fun res!823622 () Bool)

(assert (=> b!1236254 (=> (not res!823622) (not e!701163))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1236254 (= res!823622 (contains!7283 acc!846 k0!2925))))

(declare-fun b!1236255 () Bool)

(declare-fun res!823626 () Bool)

(assert (=> b!1236255 (=> res!823626 e!701165)))

(assert (=> b!1236255 (= res!823626 (contains!7283 lt!560542 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1236256 () Bool)

(declare-fun res!823627 () Bool)

(assert (=> b!1236256 (=> (not res!823627) (not e!701163))))

(assert (=> b!1236256 (= res!823627 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236257 () Bool)

(declare-fun res!823628 () Bool)

(assert (=> b!1236257 (=> (not res!823628) (not e!701163))))

(assert (=> b!1236257 (= res!823628 (not (= from!3213 (bvsub (size!38963 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236258 () Bool)

(declare-fun res!823619 () Bool)

(assert (=> b!1236258 (=> res!823619 e!701165)))

(assert (=> b!1236258 (= res!823619 (contains!7283 lt!560542 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!103006 res!823624) b!1236247))

(assert (= (and b!1236247 res!823623) b!1236249))

(assert (= (and b!1236249 res!823620) b!1236250))

(assert (= (and b!1236250 res!823629) b!1236256))

(assert (= (and b!1236256 res!823627) b!1236254))

(assert (= (and b!1236254 res!823622) b!1236257))

(assert (= (and b!1236257 res!823628) b!1236253))

(assert (= (and b!1236253 res!823618) b!1236252))

(assert (= (and b!1236252 (not res!823625)) b!1236248))

(assert (= (and b!1236248 (not res!823621)) b!1236255))

(assert (= (and b!1236255 (not res!823626)) b!1236258))

(assert (= (and b!1236258 (not res!823619)) b!1236251))

(declare-fun m!1140479 () Bool)

(assert (=> b!1236252 m!1140479))

(declare-fun m!1140481 () Bool)

(assert (=> b!1236252 m!1140481))

(declare-fun m!1140483 () Bool)

(assert (=> b!1236252 m!1140483))

(declare-fun m!1140485 () Bool)

(assert (=> b!1236252 m!1140485))

(declare-fun m!1140487 () Bool)

(assert (=> b!1236252 m!1140487))

(declare-fun m!1140489 () Bool)

(assert (=> b!1236251 m!1140489))

(declare-fun m!1140491 () Bool)

(assert (=> b!1236251 m!1140491))

(assert (=> b!1236253 m!1140481))

(assert (=> b!1236253 m!1140481))

(declare-fun m!1140493 () Bool)

(assert (=> b!1236253 m!1140493))

(declare-fun m!1140495 () Bool)

(assert (=> b!1236250 m!1140495))

(declare-fun m!1140497 () Bool)

(assert (=> b!1236258 m!1140497))

(declare-fun m!1140499 () Bool)

(assert (=> b!1236248 m!1140499))

(declare-fun m!1140501 () Bool)

(assert (=> start!103006 m!1140501))

(declare-fun m!1140503 () Bool)

(assert (=> b!1236254 m!1140503))

(declare-fun m!1140505 () Bool)

(assert (=> b!1236255 m!1140505))

(declare-fun m!1140507 () Bool)

(assert (=> b!1236256 m!1140507))

(declare-fun m!1140509 () Bool)

(assert (=> b!1236249 m!1140509))

(declare-fun m!1140511 () Bool)

(assert (=> b!1236247 m!1140511))

(check-sat (not b!1236258) (not b!1236253) (not b!1236250) (not b!1236248) (not b!1236251) (not b!1236247) (not b!1236255) (not b!1236252) (not b!1236254) (not b!1236249) (not start!103006) (not b!1236256))
(check-sat)
