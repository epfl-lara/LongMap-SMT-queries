; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102146 () Bool)

(assert start!102146)

(declare-fun b!1229408 () Bool)

(declare-fun e!697791 () Bool)

(assert (=> b!1229408 (= e!697791 true)))

(declare-datatypes ((array!79244 0))(
  ( (array!79245 (arr!38242 (Array (_ BitVec 32) (_ BitVec 64))) (size!38780 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79244)

(declare-datatypes ((List!27116 0))(
  ( (Nil!27113) (Cons!27112 (h!28321 (_ BitVec 64)) (t!40570 List!27116)) )
))
(declare-fun lt!559014 () List!27116)

(declare-fun lt!559015 () Bool)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun contains!7088 (List!27116 (_ BitVec 64)) Bool)

(assert (=> b!1229408 (= lt!559015 (contains!7088 lt!559014 (select (arr!38242 a!3806) from!3184)))))

(declare-fun res!817930 () Bool)

(declare-fun e!697792 () Bool)

(assert (=> start!102146 (=> (not res!817930) (not e!697792))))

(assert (=> start!102146 (= res!817930 (bvslt (size!38780 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102146 e!697792))

(declare-fun array_inv!29225 (array!79244) Bool)

(assert (=> start!102146 (array_inv!29225 a!3806)))

(assert (=> start!102146 true))

(declare-fun b!1229409 () Bool)

(assert (=> b!1229409 (= e!697792 (not e!697791))))

(declare-fun res!817933 () Bool)

(assert (=> b!1229409 (=> res!817933 e!697791)))

(assert (=> b!1229409 (= res!817933 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1229409 (= lt!559014 (Cons!27112 (select (arr!38242 a!3806) from!3184) Nil!27113))))

(declare-fun e!697793 () Bool)

(assert (=> b!1229409 e!697793))

(declare-fun res!817939 () Bool)

(assert (=> b!1229409 (=> (not res!817939) (not e!697793))))

(declare-fun arrayNoDuplicates!0 (array!79244 (_ BitVec 32) List!27116) Bool)

(assert (=> b!1229409 (= res!817939 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27113))))

(declare-datatypes ((Unit!40575 0))(
  ( (Unit!40576) )
))
(declare-fun lt!559016 () Unit!40575)

(declare-fun acc!823 () List!27116)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79244 List!27116 List!27116 (_ BitVec 32)) Unit!40575)

(assert (=> b!1229409 (= lt!559016 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27113 from!3184))))

(assert (=> b!1229409 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27112 (select (arr!38242 a!3806) from!3184) acc!823))))

(declare-fun b!1229410 () Bool)

(declare-fun res!817931 () Bool)

(assert (=> b!1229410 (=> (not res!817931) (not e!697792))))

(assert (=> b!1229410 (= res!817931 (not (contains!7088 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229411 () Bool)

(declare-fun res!817935 () Bool)

(assert (=> b!1229411 (=> res!817935 e!697791)))

(assert (=> b!1229411 (= res!817935 (contains!7088 lt!559014 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229412 () Bool)

(declare-fun res!817937 () Bool)

(assert (=> b!1229412 (=> (not res!817937) (not e!697792))))

(declare-fun noDuplicate!1731 (List!27116) Bool)

(assert (=> b!1229412 (= res!817937 (noDuplicate!1731 acc!823))))

(declare-fun b!1229413 () Bool)

(assert (=> b!1229413 (= e!697793 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27112 (select (arr!38242 a!3806) from!3184) Nil!27113)))))

(declare-fun b!1229414 () Bool)

(declare-fun res!817942 () Bool)

(assert (=> b!1229414 (=> (not res!817942) (not e!697792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229414 (= res!817942 (validKeyInArray!0 (select (arr!38242 a!3806) from!3184)))))

(declare-fun b!1229415 () Bool)

(declare-fun res!817934 () Bool)

(assert (=> b!1229415 (=> (not res!817934) (not e!697792))))

(assert (=> b!1229415 (= res!817934 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38780 a!3806)) (bvslt from!3184 (size!38780 a!3806))))))

(declare-fun b!1229416 () Bool)

(declare-fun res!817938 () Bool)

(assert (=> b!1229416 (=> res!817938 e!697791)))

(assert (=> b!1229416 (= res!817938 (not (noDuplicate!1731 lt!559014)))))

(declare-fun b!1229417 () Bool)

(declare-fun res!817936 () Bool)

(assert (=> b!1229417 (=> res!817936 e!697791)))

(assert (=> b!1229417 (= res!817936 (contains!7088 lt!559014 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229418 () Bool)

(declare-fun res!817932 () Bool)

(assert (=> b!1229418 (=> (not res!817932) (not e!697792))))

(assert (=> b!1229418 (= res!817932 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229419 () Bool)

(declare-fun res!817943 () Bool)

(assert (=> b!1229419 (=> (not res!817943) (not e!697792))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79244 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229419 (= res!817943 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229420 () Bool)

(declare-fun res!817941 () Bool)

(assert (=> b!1229420 (=> (not res!817941) (not e!697792))))

(assert (=> b!1229420 (= res!817941 (validKeyInArray!0 k!2913))))

(declare-fun b!1229421 () Bool)

(declare-fun res!817940 () Bool)

(assert (=> b!1229421 (=> (not res!817940) (not e!697792))))

(assert (=> b!1229421 (= res!817940 (not (contains!7088 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102146 res!817930) b!1229420))

(assert (= (and b!1229420 res!817941) b!1229415))

(assert (= (and b!1229415 res!817934) b!1229412))

(assert (= (and b!1229412 res!817937) b!1229421))

(assert (= (and b!1229421 res!817940) b!1229410))

(assert (= (and b!1229410 res!817931) b!1229419))

(assert (= (and b!1229419 res!817943) b!1229418))

(assert (= (and b!1229418 res!817932) b!1229414))

(assert (= (and b!1229414 res!817942) b!1229409))

(assert (= (and b!1229409 res!817939) b!1229413))

(assert (= (and b!1229409 (not res!817933)) b!1229416))

(assert (= (and b!1229416 (not res!817938)) b!1229417))

(assert (= (and b!1229417 (not res!817936)) b!1229411))

(assert (= (and b!1229411 (not res!817935)) b!1229408))

(declare-fun m!1133531 () Bool)

(assert (=> b!1229412 m!1133531))

(declare-fun m!1133533 () Bool)

(assert (=> b!1229416 m!1133533))

(declare-fun m!1133535 () Bool)

(assert (=> b!1229414 m!1133535))

(assert (=> b!1229414 m!1133535))

(declare-fun m!1133537 () Bool)

(assert (=> b!1229414 m!1133537))

(declare-fun m!1133539 () Bool)

(assert (=> b!1229410 m!1133539))

(assert (=> b!1229409 m!1133535))

(declare-fun m!1133541 () Bool)

(assert (=> b!1229409 m!1133541))

(declare-fun m!1133543 () Bool)

(assert (=> b!1229409 m!1133543))

(declare-fun m!1133545 () Bool)

(assert (=> b!1229409 m!1133545))

(declare-fun m!1133547 () Bool)

(assert (=> b!1229421 m!1133547))

(declare-fun m!1133549 () Bool)

(assert (=> b!1229419 m!1133549))

(declare-fun m!1133551 () Bool)

(assert (=> b!1229417 m!1133551))

(declare-fun m!1133553 () Bool)

(assert (=> b!1229411 m!1133553))

(assert (=> b!1229413 m!1133535))

(declare-fun m!1133555 () Bool)

(assert (=> b!1229413 m!1133555))

(declare-fun m!1133557 () Bool)

(assert (=> b!1229420 m!1133557))

(assert (=> b!1229408 m!1133535))

(assert (=> b!1229408 m!1133535))

(declare-fun m!1133559 () Bool)

(assert (=> b!1229408 m!1133559))

(declare-fun m!1133561 () Bool)

(assert (=> start!102146 m!1133561))

(declare-fun m!1133563 () Bool)

(assert (=> b!1229418 m!1133563))

(push 1)

(assert (not b!1229413))

(assert (not b!1229411))

(assert (not start!102146))

(assert (not b!1229410))

(assert (not b!1229416))

(assert (not b!1229408))

(assert (not b!1229414))

(assert (not b!1229409))

(assert (not b!1229412))

(assert (not b!1229417))

(assert (not b!1229420))

(assert (not b!1229419))

(assert (not b!1229418))

(assert (not b!1229421))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

