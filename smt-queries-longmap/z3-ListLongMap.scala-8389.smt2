; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102012 () Bool)

(assert start!102012)

(declare-fun b!1228361 () Bool)

(declare-fun res!816973 () Bool)

(declare-fun e!697195 () Bool)

(assert (=> b!1228361 (=> (not res!816973) (not e!697195))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228361 (= res!816973 (validKeyInArray!0 k0!2913))))

(declare-fun b!1228362 () Bool)

(declare-fun res!816976 () Bool)

(assert (=> b!1228362 (=> (not res!816976) (not e!697195))))

(declare-datatypes ((array!79285 0))(
  ( (array!79286 (arr!38265 (Array (_ BitVec 32) (_ BitVec 64))) (size!38801 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79285)

(declare-datatypes ((List!27038 0))(
  ( (Nil!27035) (Cons!27034 (h!28243 (_ BitVec 64)) (t!40501 List!27038)) )
))
(declare-fun acc!823 () List!27038)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79285 (_ BitVec 32) List!27038) Bool)

(assert (=> b!1228362 (= res!816976 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1228363 () Bool)

(declare-fun res!816977 () Bool)

(assert (=> b!1228363 (=> (not res!816977) (not e!697195))))

(declare-fun contains!7100 (List!27038 (_ BitVec 64)) Bool)

(assert (=> b!1228363 (= res!816977 (not (contains!7100 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!816979 () Bool)

(assert (=> start!102012 (=> (not res!816979) (not e!697195))))

(assert (=> start!102012 (= res!816979 (bvslt (size!38801 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102012 e!697195))

(declare-fun array_inv!29113 (array!79285) Bool)

(assert (=> start!102012 (array_inv!29113 a!3806)))

(assert (=> start!102012 true))

(declare-fun b!1228364 () Bool)

(declare-fun res!816974 () Bool)

(assert (=> b!1228364 (=> (not res!816974) (not e!697195))))

(assert (=> b!1228364 (= res!816974 (validKeyInArray!0 (select (arr!38265 a!3806) from!3184)))))

(declare-fun b!1228365 () Bool)

(declare-fun res!816981 () Bool)

(assert (=> b!1228365 (=> (not res!816981) (not e!697195))))

(declare-fun arrayContainsKey!0 (array!79285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1228365 (= res!816981 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1228366 () Bool)

(declare-fun res!816978 () Bool)

(assert (=> b!1228366 (=> (not res!816978) (not e!697195))))

(assert (=> b!1228366 (= res!816978 (not (contains!7100 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228367 () Bool)

(declare-fun res!816980 () Bool)

(assert (=> b!1228367 (=> (not res!816980) (not e!697195))))

(declare-fun noDuplicate!1697 (List!27038) Bool)

(assert (=> b!1228367 (= res!816980 (noDuplicate!1697 acc!823))))

(declare-fun b!1228368 () Bool)

(declare-fun res!816975 () Bool)

(assert (=> b!1228368 (=> (not res!816975) (not e!697195))))

(assert (=> b!1228368 (= res!816975 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38801 a!3806)) (bvslt from!3184 (size!38801 a!3806))))))

(declare-fun b!1228369 () Bool)

(assert (=> b!1228369 (= e!697195 (not true))))

(assert (=> b!1228369 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27035)))

(declare-datatypes ((Unit!40696 0))(
  ( (Unit!40697) )
))
(declare-fun lt!558990 () Unit!40696)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79285 List!27038 List!27038 (_ BitVec 32)) Unit!40696)

(assert (=> b!1228369 (= lt!558990 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27035 from!3184))))

(assert (=> b!1228369 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27034 (select (arr!38265 a!3806) from!3184) acc!823))))

(assert (= (and start!102012 res!816979) b!1228361))

(assert (= (and b!1228361 res!816973) b!1228368))

(assert (= (and b!1228368 res!816975) b!1228367))

(assert (= (and b!1228367 res!816980) b!1228363))

(assert (= (and b!1228363 res!816977) b!1228366))

(assert (= (and b!1228366 res!816978) b!1228365))

(assert (= (and b!1228365 res!816981) b!1228362))

(assert (= (and b!1228362 res!816976) b!1228364))

(assert (= (and b!1228364 res!816974) b!1228369))

(declare-fun m!1132911 () Bool)

(assert (=> b!1228366 m!1132911))

(declare-fun m!1132913 () Bool)

(assert (=> start!102012 m!1132913))

(declare-fun m!1132915 () Bool)

(assert (=> b!1228362 m!1132915))

(declare-fun m!1132917 () Bool)

(assert (=> b!1228361 m!1132917))

(declare-fun m!1132919 () Bool)

(assert (=> b!1228365 m!1132919))

(declare-fun m!1132921 () Bool)

(assert (=> b!1228363 m!1132921))

(declare-fun m!1132923 () Bool)

(assert (=> b!1228369 m!1132923))

(declare-fun m!1132925 () Bool)

(assert (=> b!1228369 m!1132925))

(declare-fun m!1132927 () Bool)

(assert (=> b!1228369 m!1132927))

(declare-fun m!1132929 () Bool)

(assert (=> b!1228369 m!1132929))

(assert (=> b!1228364 m!1132927))

(assert (=> b!1228364 m!1132927))

(declare-fun m!1132931 () Bool)

(assert (=> b!1228364 m!1132931))

(declare-fun m!1132933 () Bool)

(assert (=> b!1228367 m!1132933))

(check-sat (not b!1228369) (not b!1228365) (not start!102012) (not b!1228366) (not b!1228362) (not b!1228361) (not b!1228363) (not b!1228364) (not b!1228367))
(check-sat)
