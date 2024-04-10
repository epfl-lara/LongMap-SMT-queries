; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103004 () Bool)

(assert start!103004)

(declare-fun b!1237435 () Bool)

(declare-fun res!825309 () Bool)

(declare-fun e!701304 () Bool)

(assert (=> b!1237435 (=> (not res!825309) (not e!701304))))

(declare-datatypes ((List!27269 0))(
  ( (Nil!27266) (Cons!27265 (h!28474 (_ BitVec 64)) (t!40732 List!27269)) )
))
(declare-fun acc!846 () List!27269)

(declare-fun contains!7331 (List!27269 (_ BitVec 64)) Bool)

(assert (=> b!1237435 (= res!825309 (not (contains!7331 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237436 () Bool)

(declare-fun res!825308 () Bool)

(assert (=> b!1237436 (=> (not res!825308) (not e!701304))))

(declare-datatypes ((array!79780 0))(
  ( (array!79781 (arr!38496 (Array (_ BitVec 32) (_ BitVec 64))) (size!39032 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79780)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79780 (_ BitVec 32) List!27269) Bool)

(assert (=> b!1237436 (= res!825308 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!825305 () Bool)

(assert (=> start!103004 (=> (not res!825305) (not e!701304))))

(assert (=> start!103004 (= res!825305 (and (bvslt (size!39032 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39032 a!3835))))))

(assert (=> start!103004 e!701304))

(declare-fun array_inv!29344 (array!79780) Bool)

(assert (=> start!103004 (array_inv!29344 a!3835)))

(assert (=> start!103004 true))

(declare-fun b!1237437 () Bool)

(declare-fun res!825310 () Bool)

(assert (=> b!1237437 (=> (not res!825310) (not e!701304))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1237437 (= res!825310 (contains!7331 acc!846 k0!2925))))

(declare-fun b!1237438 () Bool)

(declare-fun res!825303 () Bool)

(assert (=> b!1237438 (=> (not res!825303) (not e!701304))))

(assert (=> b!1237438 (= res!825303 (not (= from!3213 (bvsub (size!39032 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237439 () Bool)

(assert (=> b!1237439 (= e!701304 (not true))))

(declare-fun lt!561049 () List!27269)

(declare-fun subseq!585 (List!27269 List!27269) Bool)

(assert (=> b!1237439 (subseq!585 acc!846 lt!561049)))

(declare-datatypes ((Unit!41068 0))(
  ( (Unit!41069) )
))
(declare-fun lt!561050 () Unit!41068)

(declare-fun subseqTail!72 (List!27269 List!27269) Unit!41068)

(assert (=> b!1237439 (= lt!561050 (subseqTail!72 lt!561049 lt!561049))))

(assert (=> b!1237439 (subseq!585 lt!561049 lt!561049)))

(declare-fun lt!561048 () Unit!41068)

(declare-fun lemmaListSubSeqRefl!0 (List!27269) Unit!41068)

(assert (=> b!1237439 (= lt!561048 (lemmaListSubSeqRefl!0 lt!561049))))

(assert (=> b!1237439 (= lt!561049 (Cons!27265 (select (arr!38496 a!3835) from!3213) acc!846))))

(declare-fun b!1237440 () Bool)

(declare-fun res!825306 () Bool)

(assert (=> b!1237440 (=> (not res!825306) (not e!701304))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237440 (= res!825306 (validKeyInArray!0 (select (arr!38496 a!3835) from!3213)))))

(declare-fun b!1237441 () Bool)

(declare-fun res!825307 () Bool)

(assert (=> b!1237441 (=> (not res!825307) (not e!701304))))

(declare-fun noDuplicate!1928 (List!27269) Bool)

(assert (=> b!1237441 (= res!825307 (noDuplicate!1928 acc!846))))

(declare-fun b!1237442 () Bool)

(declare-fun res!825304 () Bool)

(assert (=> b!1237442 (=> (not res!825304) (not e!701304))))

(assert (=> b!1237442 (= res!825304 (not (contains!7331 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103004 res!825305) b!1237441))

(assert (= (and b!1237441 res!825307) b!1237435))

(assert (= (and b!1237435 res!825309) b!1237442))

(assert (= (and b!1237442 res!825304) b!1237436))

(assert (= (and b!1237436 res!825308) b!1237437))

(assert (= (and b!1237437 res!825310) b!1237438))

(assert (= (and b!1237438 res!825303) b!1237440))

(assert (= (and b!1237440 res!825306) b!1237439))

(declare-fun m!1141153 () Bool)

(assert (=> b!1237439 m!1141153))

(declare-fun m!1141155 () Bool)

(assert (=> b!1237439 m!1141155))

(declare-fun m!1141157 () Bool)

(assert (=> b!1237439 m!1141157))

(declare-fun m!1141159 () Bool)

(assert (=> b!1237439 m!1141159))

(declare-fun m!1141161 () Bool)

(assert (=> b!1237439 m!1141161))

(declare-fun m!1141163 () Bool)

(assert (=> b!1237441 m!1141163))

(declare-fun m!1141165 () Bool)

(assert (=> b!1237435 m!1141165))

(declare-fun m!1141167 () Bool)

(assert (=> b!1237437 m!1141167))

(declare-fun m!1141169 () Bool)

(assert (=> b!1237442 m!1141169))

(declare-fun m!1141171 () Bool)

(assert (=> b!1237436 m!1141171))

(assert (=> b!1237440 m!1141161))

(assert (=> b!1237440 m!1141161))

(declare-fun m!1141173 () Bool)

(assert (=> b!1237440 m!1141173))

(declare-fun m!1141175 () Bool)

(assert (=> start!103004 m!1141175))

(check-sat (not b!1237436) (not b!1237435) (not b!1237442) (not b!1237439) (not b!1237441) (not b!1237440) (not b!1237437) (not start!103004))
