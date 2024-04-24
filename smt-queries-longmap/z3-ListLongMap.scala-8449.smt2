; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103066 () Bool)

(assert start!103066)

(declare-fun b!1237215 () Bool)

(declare-fun res!824480 () Bool)

(declare-fun e!701492 () Bool)

(assert (=> b!1237215 (=> (not res!824480) (not e!701492))))

(declare-datatypes ((List!27242 0))(
  ( (Nil!27239) (Cons!27238 (h!28456 (_ BitVec 64)) (t!40697 List!27242)) )
))
(declare-fun acc!846 () List!27242)

(declare-fun contains!7313 (List!27242 (_ BitVec 64)) Bool)

(assert (=> b!1237215 (= res!824480 (not (contains!7313 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237216 () Bool)

(declare-datatypes ((Unit!40949 0))(
  ( (Unit!40950) )
))
(declare-fun e!701491 () Unit!40949)

(declare-fun lt!561053 () Unit!40949)

(assert (=> b!1237216 (= e!701491 lt!561053)))

(declare-fun lt!561048 () List!27242)

(declare-datatypes ((array!79709 0))(
  ( (array!79710 (arr!38456 (Array (_ BitVec 32) (_ BitVec 64))) (size!38993 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79709)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1237216 (= lt!561048 (Cons!27238 (select (arr!38456 a!3835) from!3213) acc!846))))

(declare-fun lt!561050 () Unit!40949)

(declare-fun lemmaListSubSeqRefl!0 (List!27242) Unit!40949)

(assert (=> b!1237216 (= lt!561050 (lemmaListSubSeqRefl!0 lt!561048))))

(declare-fun subseq!551 (List!27242 List!27242) Bool)

(assert (=> b!1237216 (subseq!551 lt!561048 lt!561048)))

(declare-fun lt!561049 () Unit!40949)

(declare-fun subseqTail!44 (List!27242 List!27242) Unit!40949)

(assert (=> b!1237216 (= lt!561049 (subseqTail!44 lt!561048 lt!561048))))

(assert (=> b!1237216 (subseq!551 acc!846 lt!561048)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79709 List!27242 List!27242 (_ BitVec 32)) Unit!40949)

(assert (=> b!1237216 (= lt!561053 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561048 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79709 (_ BitVec 32) List!27242) Bool)

(assert (=> b!1237216 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1237217 () Bool)

(declare-fun res!824481 () Bool)

(assert (=> b!1237217 (=> (not res!824481) (not e!701492))))

(assert (=> b!1237217 (= res!824481 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!824478 () Bool)

(assert (=> start!103066 (=> (not res!824478) (not e!701492))))

(assert (=> start!103066 (= res!824478 (and (bvslt (size!38993 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38993 a!3835))))))

(assert (=> start!103066 e!701492))

(declare-fun array_inv!29394 (array!79709) Bool)

(assert (=> start!103066 (array_inv!29394 a!3835)))

(assert (=> start!103066 true))

(declare-fun b!1237218 () Bool)

(declare-fun res!824474 () Bool)

(assert (=> b!1237218 (=> (not res!824474) (not e!701492))))

(assert (=> b!1237218 (= res!824474 (not (= from!3213 (bvsub (size!38993 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237219 () Bool)

(declare-fun e!701489 () Bool)

(assert (=> b!1237219 (= e!701489 false)))

(declare-fun lt!561051 () Bool)

(assert (=> b!1237219 (= lt!561051 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1237220 () Bool)

(declare-fun res!824477 () Bool)

(assert (=> b!1237220 (=> (not res!824477) (not e!701492))))

(declare-fun noDuplicate!1894 (List!27242) Bool)

(assert (=> b!1237220 (= res!824477 (noDuplicate!1894 acc!846))))

(declare-fun b!1237221 () Bool)

(declare-fun res!824479 () Bool)

(assert (=> b!1237221 (=> (not res!824479) (not e!701492))))

(assert (=> b!1237221 (= res!824479 (not (contains!7313 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237222 () Bool)

(assert (=> b!1237222 (= e!701492 e!701489)))

(declare-fun res!824476 () Bool)

(assert (=> b!1237222 (=> (not res!824476) (not e!701489))))

(assert (=> b!1237222 (= res!824476 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38993 a!3835))))))

(declare-fun lt!561052 () Unit!40949)

(assert (=> b!1237222 (= lt!561052 e!701491)))

(declare-fun c!121238 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237222 (= c!121238 (validKeyInArray!0 (select (arr!38456 a!3835) from!3213)))))

(declare-fun b!1237223 () Bool)

(declare-fun res!824475 () Bool)

(assert (=> b!1237223 (=> (not res!824475) (not e!701492))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1237223 (= res!824475 (contains!7313 acc!846 k0!2925))))

(declare-fun b!1237224 () Bool)

(declare-fun Unit!40951 () Unit!40949)

(assert (=> b!1237224 (= e!701491 Unit!40951)))

(assert (= (and start!103066 res!824478) b!1237220))

(assert (= (and b!1237220 res!824477) b!1237215))

(assert (= (and b!1237215 res!824480) b!1237221))

(assert (= (and b!1237221 res!824479) b!1237217))

(assert (= (and b!1237217 res!824481) b!1237223))

(assert (= (and b!1237223 res!824475) b!1237218))

(assert (= (and b!1237218 res!824474) b!1237222))

(assert (= (and b!1237222 c!121238) b!1237216))

(assert (= (and b!1237222 (not c!121238)) b!1237224))

(assert (= (and b!1237222 res!824476) b!1237219))

(declare-fun m!1141391 () Bool)

(assert (=> b!1237221 m!1141391))

(declare-fun m!1141393 () Bool)

(assert (=> start!103066 m!1141393))

(declare-fun m!1141395 () Bool)

(assert (=> b!1237219 m!1141395))

(declare-fun m!1141397 () Bool)

(assert (=> b!1237215 m!1141397))

(declare-fun m!1141399 () Bool)

(assert (=> b!1237217 m!1141399))

(declare-fun m!1141401 () Bool)

(assert (=> b!1237223 m!1141401))

(declare-fun m!1141403 () Bool)

(assert (=> b!1237222 m!1141403))

(assert (=> b!1237222 m!1141403))

(declare-fun m!1141405 () Bool)

(assert (=> b!1237222 m!1141405))

(declare-fun m!1141407 () Bool)

(assert (=> b!1237220 m!1141407))

(declare-fun m!1141409 () Bool)

(assert (=> b!1237216 m!1141409))

(declare-fun m!1141411 () Bool)

(assert (=> b!1237216 m!1141411))

(declare-fun m!1141413 () Bool)

(assert (=> b!1237216 m!1141413))

(declare-fun m!1141415 () Bool)

(assert (=> b!1237216 m!1141415))

(declare-fun m!1141417 () Bool)

(assert (=> b!1237216 m!1141417))

(assert (=> b!1237216 m!1141395))

(assert (=> b!1237216 m!1141403))

(check-sat (not start!103066) (not b!1237222) (not b!1237215) (not b!1237217) (not b!1237221) (not b!1237219) (not b!1237220) (not b!1237223) (not b!1237216))
(check-sat)
