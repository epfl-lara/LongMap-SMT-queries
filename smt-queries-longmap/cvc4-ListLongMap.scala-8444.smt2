; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102802 () Bool)

(assert start!102802)

(declare-fun b!1235501 () Bool)

(declare-fun e!700473 () Bool)

(assert (=> b!1235501 (= e!700473 false)))

(declare-datatypes ((array!79647 0))(
  ( (array!79648 (arr!38431 (Array (_ BitVec 32) (_ BitVec 64))) (size!38967 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79647)

(declare-datatypes ((List!27204 0))(
  ( (Nil!27201) (Cons!27200 (h!28409 (_ BitVec 64)) (t!40667 List!27204)) )
))
(declare-fun acc!846 () List!27204)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun lt!560333 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79647 (_ BitVec 32) List!27204) Bool)

(assert (=> b!1235501 (= lt!560333 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1235502 () Bool)

(declare-fun e!700472 () Bool)

(assert (=> b!1235502 (= e!700472 e!700473)))

(declare-fun res!823630 () Bool)

(assert (=> b!1235502 (=> (not res!823630) (not e!700473))))

(assert (=> b!1235502 (= res!823630 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38967 a!3835))))))

(declare-datatypes ((Unit!40937 0))(
  ( (Unit!40938) )
))
(declare-fun lt!560329 () Unit!40937)

(declare-fun e!700470 () Unit!40937)

(assert (=> b!1235502 (= lt!560329 e!700470)))

(declare-fun c!120796 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235502 (= c!120796 (validKeyInArray!0 (select (arr!38431 a!3835) from!3213)))))

(declare-fun b!1235503 () Bool)

(declare-fun res!823636 () Bool)

(assert (=> b!1235503 (=> (not res!823636) (not e!700472))))

(assert (=> b!1235503 (= res!823636 (not (= from!3213 (bvsub (size!38967 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235504 () Bool)

(declare-fun res!823634 () Bool)

(assert (=> b!1235504 (=> (not res!823634) (not e!700472))))

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7266 (List!27204 (_ BitVec 64)) Bool)

(assert (=> b!1235504 (= res!823634 (contains!7266 acc!846 k!2925))))

(declare-fun b!1235505 () Bool)

(declare-fun Unit!40939 () Unit!40937)

(assert (=> b!1235505 (= e!700470 Unit!40939)))

(declare-fun b!1235506 () Bool)

(declare-fun res!823629 () Bool)

(assert (=> b!1235506 (=> (not res!823629) (not e!700472))))

(assert (=> b!1235506 (= res!823629 (not (contains!7266 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235507 () Bool)

(declare-fun res!823635 () Bool)

(assert (=> b!1235507 (=> (not res!823635) (not e!700472))))

(assert (=> b!1235507 (= res!823635 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235509 () Bool)

(declare-fun res!823631 () Bool)

(assert (=> b!1235509 (=> (not res!823631) (not e!700472))))

(assert (=> b!1235509 (= res!823631 (not (contains!7266 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235510 () Bool)

(declare-fun res!823632 () Bool)

(assert (=> b!1235510 (=> (not res!823632) (not e!700472))))

(declare-fun noDuplicate!1863 (List!27204) Bool)

(assert (=> b!1235510 (= res!823632 (noDuplicate!1863 acc!846))))

(declare-fun b!1235508 () Bool)

(declare-fun lt!560332 () Unit!40937)

(assert (=> b!1235508 (= e!700470 lt!560332)))

(declare-fun lt!560331 () List!27204)

(assert (=> b!1235508 (= lt!560331 (Cons!27200 (select (arr!38431 a!3835) from!3213) acc!846))))

(declare-fun lt!560330 () Unit!40937)

(declare-fun lemmaListSubSeqRefl!0 (List!27204) Unit!40937)

(assert (=> b!1235508 (= lt!560330 (lemmaListSubSeqRefl!0 lt!560331))))

(declare-fun subseq!538 (List!27204 List!27204) Bool)

(assert (=> b!1235508 (subseq!538 lt!560331 lt!560331)))

(declare-fun lt!560328 () Unit!40937)

(declare-fun subseqTail!31 (List!27204 List!27204) Unit!40937)

(assert (=> b!1235508 (= lt!560328 (subseqTail!31 lt!560331 lt!560331))))

(assert (=> b!1235508 (subseq!538 acc!846 lt!560331)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79647 List!27204 List!27204 (_ BitVec 32)) Unit!40937)

(assert (=> b!1235508 (= lt!560332 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560331 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1235508 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun res!823633 () Bool)

(assert (=> start!102802 (=> (not res!823633) (not e!700472))))

(assert (=> start!102802 (= res!823633 (and (bvslt (size!38967 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38967 a!3835))))))

(assert (=> start!102802 e!700472))

(declare-fun array_inv!29279 (array!79647) Bool)

(assert (=> start!102802 (array_inv!29279 a!3835)))

(assert (=> start!102802 true))

(assert (= (and start!102802 res!823633) b!1235510))

(assert (= (and b!1235510 res!823632) b!1235509))

(assert (= (and b!1235509 res!823631) b!1235506))

(assert (= (and b!1235506 res!823629) b!1235507))

(assert (= (and b!1235507 res!823635) b!1235504))

(assert (= (and b!1235504 res!823634) b!1235503))

(assert (= (and b!1235503 res!823636) b!1235502))

(assert (= (and b!1235502 c!120796) b!1235508))

(assert (= (and b!1235502 (not c!120796)) b!1235505))

(assert (= (and b!1235502 res!823630) b!1235501))

(declare-fun m!1139379 () Bool)

(assert (=> b!1235510 m!1139379))

(declare-fun m!1139381 () Bool)

(assert (=> b!1235508 m!1139381))

(declare-fun m!1139383 () Bool)

(assert (=> b!1235508 m!1139383))

(declare-fun m!1139385 () Bool)

(assert (=> b!1235508 m!1139385))

(declare-fun m!1139387 () Bool)

(assert (=> b!1235508 m!1139387))

(declare-fun m!1139389 () Bool)

(assert (=> b!1235508 m!1139389))

(declare-fun m!1139391 () Bool)

(assert (=> b!1235508 m!1139391))

(declare-fun m!1139393 () Bool)

(assert (=> b!1235508 m!1139393))

(assert (=> b!1235501 m!1139389))

(declare-fun m!1139395 () Bool)

(assert (=> start!102802 m!1139395))

(declare-fun m!1139397 () Bool)

(assert (=> b!1235509 m!1139397))

(declare-fun m!1139399 () Bool)

(assert (=> b!1235507 m!1139399))

(assert (=> b!1235502 m!1139393))

(assert (=> b!1235502 m!1139393))

(declare-fun m!1139401 () Bool)

(assert (=> b!1235502 m!1139401))

(declare-fun m!1139403 () Bool)

(assert (=> b!1235504 m!1139403))

(declare-fun m!1139405 () Bool)

(assert (=> b!1235506 m!1139405))

(push 1)

(assert (not b!1235507))

(assert (not b!1235501))

(assert (not b!1235504))

(assert (not start!102802))

(assert (not b!1235502))

(assert (not b!1235508))

(assert (not b!1235510))

