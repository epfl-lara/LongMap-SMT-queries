; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101974 () Bool)

(assert start!101974)

(declare-fun b!1227676 () Bool)

(declare-fun res!816297 () Bool)

(declare-fun e!697040 () Bool)

(assert (=> b!1227676 (=> res!816297 e!697040)))

(declare-datatypes ((List!27019 0))(
  ( (Nil!27016) (Cons!27015 (h!28224 (_ BitVec 64)) (t!40482 List!27019)) )
))
(declare-fun acc!823 () List!27019)

(declare-fun subseq!485 (List!27019 List!27019) Bool)

(assert (=> b!1227676 (= res!816297 (not (subseq!485 Nil!27016 acc!823)))))

(declare-fun b!1227678 () Bool)

(declare-fun res!816289 () Bool)

(declare-fun e!697039 () Bool)

(assert (=> b!1227678 (=> (not res!816289) (not e!697039))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227678 (= res!816289 (validKeyInArray!0 k!2913))))

(declare-fun b!1227679 () Bool)

(declare-fun res!816300 () Bool)

(assert (=> b!1227679 (=> (not res!816300) (not e!697039))))

(declare-fun noDuplicate!1678 (List!27019) Bool)

(assert (=> b!1227679 (= res!816300 (noDuplicate!1678 acc!823))))

(declare-fun b!1227680 () Bool)

(declare-fun res!816288 () Bool)

(assert (=> b!1227680 (=> (not res!816288) (not e!697039))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79247 0))(
  ( (array!79248 (arr!38246 (Array (_ BitVec 32) (_ BitVec 64))) (size!38782 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79247)

(assert (=> b!1227680 (= res!816288 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38782 a!3806)) (bvslt from!3184 (size!38782 a!3806))))))

(declare-fun b!1227681 () Bool)

(declare-fun res!816293 () Bool)

(assert (=> b!1227681 (=> (not res!816293) (not e!697039))))

(declare-fun contains!7081 (List!27019 (_ BitVec 64)) Bool)

(assert (=> b!1227681 (= res!816293 (not (contains!7081 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227682 () Bool)

(declare-fun res!816292 () Bool)

(assert (=> b!1227682 (=> res!816292 e!697040)))

(assert (=> b!1227682 (= res!816292 (contains!7081 Nil!27016 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227683 () Bool)

(declare-fun res!816296 () Bool)

(assert (=> b!1227683 (=> res!816296 e!697040)))

(assert (=> b!1227683 (= res!816296 (contains!7081 Nil!27016 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227684 () Bool)

(declare-fun res!816299 () Bool)

(assert (=> b!1227684 (=> (not res!816299) (not e!697039))))

(assert (=> b!1227684 (= res!816299 (validKeyInArray!0 (select (arr!38246 a!3806) from!3184)))))

(declare-fun b!1227685 () Bool)

(declare-fun res!816290 () Bool)

(assert (=> b!1227685 (=> (not res!816290) (not e!697039))))

(declare-fun arrayNoDuplicates!0 (array!79247 (_ BitVec 32) List!27019) Bool)

(assert (=> b!1227685 (= res!816290 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1227686 () Bool)

(assert (=> b!1227686 (= e!697039 (not e!697040))))

(declare-fun res!816291 () Bool)

(assert (=> b!1227686 (=> res!816291 e!697040)))

(assert (=> b!1227686 (= res!816291 (bvsgt from!3184 (size!38782 a!3806)))))

(assert (=> b!1227686 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27015 (select (arr!38246 a!3806) from!3184) acc!823))))

(declare-fun b!1227677 () Bool)

(assert (=> b!1227677 (= e!697040 true)))

(declare-datatypes ((Unit!40658 0))(
  ( (Unit!40659) )
))
(declare-fun lt!558933 () Unit!40658)

(declare-fun noDuplicateSubseq!38 (List!27019 List!27019) Unit!40658)

(assert (=> b!1227677 (= lt!558933 (noDuplicateSubseq!38 Nil!27016 acc!823))))

(declare-fun res!816298 () Bool)

(assert (=> start!101974 (=> (not res!816298) (not e!697039))))

(assert (=> start!101974 (= res!816298 (bvslt (size!38782 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101974 e!697039))

(declare-fun array_inv!29094 (array!79247) Bool)

(assert (=> start!101974 (array_inv!29094 a!3806)))

(assert (=> start!101974 true))

(declare-fun b!1227687 () Bool)

(declare-fun res!816295 () Bool)

(assert (=> b!1227687 (=> (not res!816295) (not e!697039))))

(declare-fun arrayContainsKey!0 (array!79247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227687 (= res!816295 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1227688 () Bool)

(declare-fun res!816294 () Bool)

(assert (=> b!1227688 (=> (not res!816294) (not e!697039))))

(assert (=> b!1227688 (= res!816294 (not (contains!7081 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!101974 res!816298) b!1227678))

(assert (= (and b!1227678 res!816289) b!1227680))

(assert (= (and b!1227680 res!816288) b!1227679))

(assert (= (and b!1227679 res!816300) b!1227688))

(assert (= (and b!1227688 res!816294) b!1227681))

(assert (= (and b!1227681 res!816293) b!1227687))

(assert (= (and b!1227687 res!816295) b!1227685))

(assert (= (and b!1227685 res!816290) b!1227684))

(assert (= (and b!1227684 res!816299) b!1227686))

(assert (= (and b!1227686 (not res!816291)) b!1227683))

(assert (= (and b!1227683 (not res!816296)) b!1227682))

(assert (= (and b!1227682 (not res!816292)) b!1227676))

(assert (= (and b!1227676 (not res!816297)) b!1227677))

(declare-fun m!1132395 () Bool)

(assert (=> b!1227682 m!1132395))

(declare-fun m!1132397 () Bool)

(assert (=> b!1227685 m!1132397))

(declare-fun m!1132399 () Bool)

(assert (=> b!1227681 m!1132399))

(declare-fun m!1132401 () Bool)

(assert (=> b!1227684 m!1132401))

(assert (=> b!1227684 m!1132401))

(declare-fun m!1132403 () Bool)

(assert (=> b!1227684 m!1132403))

(declare-fun m!1132405 () Bool)

(assert (=> b!1227676 m!1132405))

(declare-fun m!1132407 () Bool)

(assert (=> b!1227687 m!1132407))

(declare-fun m!1132409 () Bool)

(assert (=> b!1227683 m!1132409))

(assert (=> b!1227686 m!1132401))

(declare-fun m!1132411 () Bool)

(assert (=> b!1227686 m!1132411))

(declare-fun m!1132413 () Bool)

(assert (=> b!1227677 m!1132413))

(declare-fun m!1132415 () Bool)

(assert (=> b!1227688 m!1132415))

(declare-fun m!1132417 () Bool)

(assert (=> start!101974 m!1132417))

(declare-fun m!1132419 () Bool)

(assert (=> b!1227679 m!1132419))

(declare-fun m!1132421 () Bool)

(assert (=> b!1227678 m!1132421))

(push 1)

(assert (not b!1227684))

(assert (not b!1227686))

(assert (not b!1227688))

(assert (not b!1227676))

(assert (not b!1227683))

(assert (not start!101974))

(assert (not b!1227681))

(assert (not b!1227679))

(assert (not b!1227677))

(assert (not b!1227685))

(assert (not b!1227682))

(assert (not b!1227687))

(assert (not b!1227678))

(check-sat)

