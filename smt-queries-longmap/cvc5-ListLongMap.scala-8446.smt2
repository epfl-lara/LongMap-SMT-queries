; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102810 () Bool)

(assert start!102810)

(declare-fun b!1235621 () Bool)

(declare-fun res!823732 () Bool)

(declare-fun e!700521 () Bool)

(assert (=> b!1235621 (=> (not res!823732) (not e!700521))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79655 0))(
  ( (array!79656 (arr!38435 (Array (_ BitVec 32) (_ BitVec 64))) (size!38971 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79655)

(assert (=> b!1235621 (= res!823732 (not (= from!3213 (bvsub (size!38971 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235622 () Bool)

(declare-datatypes ((Unit!40949 0))(
  ( (Unit!40950) )
))
(declare-fun e!700519 () Unit!40949)

(declare-fun lt!560405 () Unit!40949)

(assert (=> b!1235622 (= e!700519 lt!560405)))

(declare-datatypes ((List!27208 0))(
  ( (Nil!27205) (Cons!27204 (h!28413 (_ BitVec 64)) (t!40671 List!27208)) )
))
(declare-fun lt!560403 () List!27208)

(declare-fun acc!846 () List!27208)

(assert (=> b!1235622 (= lt!560403 (Cons!27204 (select (arr!38435 a!3835) from!3213) acc!846))))

(declare-fun lt!560404 () Unit!40949)

(declare-fun lemmaListSubSeqRefl!0 (List!27208) Unit!40949)

(assert (=> b!1235622 (= lt!560404 (lemmaListSubSeqRefl!0 lt!560403))))

(declare-fun subseq!542 (List!27208 List!27208) Bool)

(assert (=> b!1235622 (subseq!542 lt!560403 lt!560403)))

(declare-fun lt!560401 () Unit!40949)

(declare-fun subseqTail!35 (List!27208 List!27208) Unit!40949)

(assert (=> b!1235622 (= lt!560401 (subseqTail!35 lt!560403 lt!560403))))

(assert (=> b!1235622 (subseq!542 acc!846 lt!560403)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79655 List!27208 List!27208 (_ BitVec 32)) Unit!40949)

(assert (=> b!1235622 (= lt!560405 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560403 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79655 (_ BitVec 32) List!27208) Bool)

(assert (=> b!1235622 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1235623 () Bool)

(declare-fun res!823726 () Bool)

(assert (=> b!1235623 (=> (not res!823726) (not e!700521))))

(declare-fun contains!7270 (List!27208 (_ BitVec 64)) Bool)

(assert (=> b!1235623 (= res!823726 (not (contains!7270 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235624 () Bool)

(declare-fun e!700520 () Bool)

(assert (=> b!1235624 (= e!700520 false)))

(declare-fun lt!560402 () Bool)

(assert (=> b!1235624 (= lt!560402 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1235625 () Bool)

(assert (=> b!1235625 (= e!700521 e!700520)))

(declare-fun res!823729 () Bool)

(assert (=> b!1235625 (=> (not res!823729) (not e!700520))))

(assert (=> b!1235625 (= res!823729 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38971 a!3835))))))

(declare-fun lt!560400 () Unit!40949)

(assert (=> b!1235625 (= lt!560400 e!700519)))

(declare-fun c!120808 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235625 (= c!120808 (validKeyInArray!0 (select (arr!38435 a!3835) from!3213)))))

(declare-fun b!1235626 () Bool)

(declare-fun res!823731 () Bool)

(assert (=> b!1235626 (=> (not res!823731) (not e!700521))))

(assert (=> b!1235626 (= res!823731 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235627 () Bool)

(declare-fun res!823730 () Bool)

(assert (=> b!1235627 (=> (not res!823730) (not e!700521))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1235627 (= res!823730 (contains!7270 acc!846 k!2925))))

(declare-fun b!1235628 () Bool)

(declare-fun res!823725 () Bool)

(assert (=> b!1235628 (=> (not res!823725) (not e!700521))))

(declare-fun noDuplicate!1867 (List!27208) Bool)

(assert (=> b!1235628 (= res!823725 (noDuplicate!1867 acc!846))))

(declare-fun res!823728 () Bool)

(assert (=> start!102810 (=> (not res!823728) (not e!700521))))

(assert (=> start!102810 (= res!823728 (and (bvslt (size!38971 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38971 a!3835))))))

(assert (=> start!102810 e!700521))

(declare-fun array_inv!29283 (array!79655) Bool)

(assert (=> start!102810 (array_inv!29283 a!3835)))

(assert (=> start!102810 true))

(declare-fun b!1235629 () Bool)

(declare-fun Unit!40951 () Unit!40949)

(assert (=> b!1235629 (= e!700519 Unit!40951)))

(declare-fun b!1235630 () Bool)

(declare-fun res!823727 () Bool)

(assert (=> b!1235630 (=> (not res!823727) (not e!700521))))

(assert (=> b!1235630 (= res!823727 (not (contains!7270 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102810 res!823728) b!1235628))

(assert (= (and b!1235628 res!823725) b!1235623))

(assert (= (and b!1235623 res!823726) b!1235630))

(assert (= (and b!1235630 res!823727) b!1235626))

(assert (= (and b!1235626 res!823731) b!1235627))

(assert (= (and b!1235627 res!823730) b!1235621))

(assert (= (and b!1235621 res!823732) b!1235625))

(assert (= (and b!1235625 c!120808) b!1235622))

(assert (= (and b!1235625 (not c!120808)) b!1235629))

(assert (= (and b!1235625 res!823729) b!1235624))

(declare-fun m!1139491 () Bool)

(assert (=> b!1235625 m!1139491))

(assert (=> b!1235625 m!1139491))

(declare-fun m!1139493 () Bool)

(assert (=> b!1235625 m!1139493))

(declare-fun m!1139495 () Bool)

(assert (=> b!1235627 m!1139495))

(declare-fun m!1139497 () Bool)

(assert (=> b!1235626 m!1139497))

(declare-fun m!1139499 () Bool)

(assert (=> b!1235622 m!1139499))

(declare-fun m!1139501 () Bool)

(assert (=> b!1235622 m!1139501))

(declare-fun m!1139503 () Bool)

(assert (=> b!1235622 m!1139503))

(declare-fun m!1139505 () Bool)

(assert (=> b!1235622 m!1139505))

(assert (=> b!1235622 m!1139491))

(declare-fun m!1139507 () Bool)

(assert (=> b!1235622 m!1139507))

(declare-fun m!1139509 () Bool)

(assert (=> b!1235622 m!1139509))

(declare-fun m!1139511 () Bool)

(assert (=> b!1235623 m!1139511))

(declare-fun m!1139513 () Bool)

(assert (=> start!102810 m!1139513))

(declare-fun m!1139515 () Bool)

(assert (=> b!1235630 m!1139515))

(assert (=> b!1235624 m!1139505))

(declare-fun m!1139517 () Bool)

(assert (=> b!1235628 m!1139517))

(push 1)

