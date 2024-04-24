; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102378 () Bool)

(assert start!102378)

(declare-fun b!1230594 () Bool)

(declare-fun res!818300 () Bool)

(declare-fun e!698630 () Bool)

(assert (=> b!1230594 (=> res!818300 e!698630)))

(declare-datatypes ((List!27074 0))(
  ( (Nil!27071) (Cons!27070 (h!28288 (_ BitVec 64)) (t!40529 List!27074)) )
))
(declare-fun lt!559632 () List!27074)

(declare-fun noDuplicate!1726 (List!27074) Bool)

(assert (=> b!1230594 (= res!818300 (not (noDuplicate!1726 lt!559632)))))

(declare-fun b!1230595 () Bool)

(declare-fun res!818291 () Bool)

(declare-fun e!698633 () Bool)

(assert (=> b!1230595 (=> (not res!818291) (not e!698633))))

(declare-datatypes ((array!79349 0))(
  ( (array!79350 (arr!38288 (Array (_ BitVec 32) (_ BitVec 64))) (size!38825 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79349)

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230595 (= res!818291 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230596 () Bool)

(assert (=> b!1230596 (= e!698633 (not e!698630))))

(declare-fun res!818287 () Bool)

(assert (=> b!1230596 (=> res!818287 e!698630)))

(assert (=> b!1230596 (= res!818287 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1230596 (= lt!559632 (Cons!27070 (select (arr!38288 a!3806) from!3184) Nil!27071))))

(declare-fun e!698631 () Bool)

(assert (=> b!1230596 e!698631))

(declare-fun res!818294 () Bool)

(assert (=> b!1230596 (=> (not res!818294) (not e!698631))))

(declare-fun arrayNoDuplicates!0 (array!79349 (_ BitVec 32) List!27074) Bool)

(assert (=> b!1230596 (= res!818294 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27071))))

(declare-fun acc!823 () List!27074)

(declare-datatypes ((Unit!40691 0))(
  ( (Unit!40692) )
))
(declare-fun lt!559630 () Unit!40691)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79349 List!27074 List!27074 (_ BitVec 32)) Unit!40691)

(assert (=> b!1230596 (= lt!559630 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27071 from!3184))))

(assert (=> b!1230596 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27070 (select (arr!38288 a!3806) from!3184) acc!823))))

(declare-fun b!1230597 () Bool)

(declare-fun res!818293 () Bool)

(assert (=> b!1230597 (=> (not res!818293) (not e!698633))))

(assert (=> b!1230597 (= res!818293 (noDuplicate!1726 acc!823))))

(declare-fun b!1230598 () Bool)

(assert (=> b!1230598 (= e!698631 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27070 (select (arr!38288 a!3806) from!3184) Nil!27071)))))

(declare-fun b!1230599 () Bool)

(declare-fun res!818296 () Bool)

(assert (=> b!1230599 (=> (not res!818296) (not e!698633))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230599 (= res!818296 (validKeyInArray!0 (select (arr!38288 a!3806) from!3184)))))

(declare-fun res!818289 () Bool)

(assert (=> start!102378 (=> (not res!818289) (not e!698633))))

(assert (=> start!102378 (= res!818289 (bvslt (size!38825 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102378 e!698633))

(declare-fun array_inv!29226 (array!79349) Bool)

(assert (=> start!102378 (array_inv!29226 a!3806)))

(assert (=> start!102378 true))

(declare-fun b!1230600 () Bool)

(declare-fun res!818299 () Bool)

(assert (=> b!1230600 (=> (not res!818299) (not e!698633))))

(assert (=> b!1230600 (= res!818299 (validKeyInArray!0 k0!2913))))

(declare-fun b!1230601 () Bool)

(declare-fun res!818288 () Bool)

(assert (=> b!1230601 (=> res!818288 e!698630)))

(declare-fun contains!7145 (List!27074 (_ BitVec 64)) Bool)

(assert (=> b!1230601 (= res!818288 (contains!7145 lt!559632 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1230602 () Bool)

(declare-fun res!818292 () Bool)

(assert (=> b!1230602 (=> (not res!818292) (not e!698633))))

(assert (=> b!1230602 (= res!818292 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230603 () Bool)

(declare-fun res!818295 () Bool)

(assert (=> b!1230603 (=> (not res!818295) (not e!698633))))

(assert (=> b!1230603 (= res!818295 (not (contains!7145 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230604 () Bool)

(declare-fun res!818290 () Bool)

(assert (=> b!1230604 (=> res!818290 e!698630)))

(assert (=> b!1230604 (= res!818290 (contains!7145 lt!559632 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1230605 () Bool)

(declare-fun res!818298 () Bool)

(assert (=> b!1230605 (=> (not res!818298) (not e!698633))))

(assert (=> b!1230605 (= res!818298 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38825 a!3806)) (bvslt from!3184 (size!38825 a!3806))))))

(declare-fun b!1230606 () Bool)

(assert (=> b!1230606 (= e!698630 true)))

(declare-fun lt!559631 () Bool)

(assert (=> b!1230606 (= lt!559631 (contains!7145 lt!559632 (select (arr!38288 a!3806) from!3184)))))

(declare-fun b!1230607 () Bool)

(declare-fun res!818297 () Bool)

(assert (=> b!1230607 (=> (not res!818297) (not e!698633))))

(assert (=> b!1230607 (= res!818297 (not (contains!7145 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102378 res!818289) b!1230600))

(assert (= (and b!1230600 res!818299) b!1230605))

(assert (= (and b!1230605 res!818298) b!1230597))

(assert (= (and b!1230597 res!818293) b!1230603))

(assert (= (and b!1230603 res!818295) b!1230607))

(assert (= (and b!1230607 res!818297) b!1230595))

(assert (= (and b!1230595 res!818291) b!1230602))

(assert (= (and b!1230602 res!818292) b!1230599))

(assert (= (and b!1230599 res!818296) b!1230596))

(assert (= (and b!1230596 res!818294) b!1230598))

(assert (= (and b!1230596 (not res!818287)) b!1230594))

(assert (= (and b!1230594 (not res!818300)) b!1230601))

(assert (= (and b!1230601 (not res!818288)) b!1230604))

(assert (= (and b!1230604 (not res!818290)) b!1230606))

(declare-fun m!1135515 () Bool)

(assert (=> b!1230598 m!1135515))

(declare-fun m!1135517 () Bool)

(assert (=> b!1230598 m!1135517))

(declare-fun m!1135519 () Bool)

(assert (=> b!1230601 m!1135519))

(declare-fun m!1135521 () Bool)

(assert (=> b!1230597 m!1135521))

(declare-fun m!1135523 () Bool)

(assert (=> b!1230603 m!1135523))

(declare-fun m!1135525 () Bool)

(assert (=> b!1230600 m!1135525))

(assert (=> b!1230599 m!1135515))

(assert (=> b!1230599 m!1135515))

(declare-fun m!1135527 () Bool)

(assert (=> b!1230599 m!1135527))

(declare-fun m!1135529 () Bool)

(assert (=> b!1230602 m!1135529))

(declare-fun m!1135531 () Bool)

(assert (=> b!1230604 m!1135531))

(declare-fun m!1135533 () Bool)

(assert (=> start!102378 m!1135533))

(declare-fun m!1135535 () Bool)

(assert (=> b!1230594 m!1135535))

(assert (=> b!1230596 m!1135515))

(declare-fun m!1135537 () Bool)

(assert (=> b!1230596 m!1135537))

(declare-fun m!1135539 () Bool)

(assert (=> b!1230596 m!1135539))

(declare-fun m!1135541 () Bool)

(assert (=> b!1230596 m!1135541))

(declare-fun m!1135543 () Bool)

(assert (=> b!1230595 m!1135543))

(declare-fun m!1135545 () Bool)

(assert (=> b!1230607 m!1135545))

(assert (=> b!1230606 m!1135515))

(assert (=> b!1230606 m!1135515))

(declare-fun m!1135547 () Bool)

(assert (=> b!1230606 m!1135547))

(check-sat (not b!1230603) (not b!1230594) (not b!1230600) (not b!1230599) (not b!1230601) (not b!1230606) (not b!1230595) (not b!1230602) (not b!1230604) (not b!1230597) (not b!1230596) (not start!102378) (not b!1230598) (not b!1230607))
(check-sat)
