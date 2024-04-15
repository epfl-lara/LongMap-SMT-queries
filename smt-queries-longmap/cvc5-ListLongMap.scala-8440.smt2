; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102776 () Bool)

(assert start!102776)

(declare-fun b!1235035 () Bool)

(declare-fun res!823240 () Bool)

(declare-fun e!700312 () Bool)

(assert (=> b!1235035 (=> (not res!823240) (not e!700312))))

(declare-datatypes ((List!27254 0))(
  ( (Nil!27251) (Cons!27250 (h!28459 (_ BitVec 64)) (t!40708 List!27254)) )
))
(declare-fun acc!846 () List!27254)

(declare-fun contains!7226 (List!27254 (_ BitVec 64)) Bool)

(assert (=> b!1235035 (= res!823240 (not (contains!7226 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235036 () Bool)

(declare-fun e!700313 () Bool)

(assert (=> b!1235036 (= e!700312 (not e!700313))))

(declare-fun res!823239 () Bool)

(assert (=> b!1235036 (=> res!823239 e!700313)))

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1235036 (= res!823239 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun lt!559960 () List!27254)

(declare-fun subseq!526 (List!27254 List!27254) Bool)

(assert (=> b!1235036 (subseq!526 acc!846 lt!559960)))

(declare-datatypes ((Unit!40755 0))(
  ( (Unit!40756) )
))
(declare-fun lt!559959 () Unit!40755)

(declare-fun subseqTail!19 (List!27254 List!27254) Unit!40755)

(assert (=> b!1235036 (= lt!559959 (subseqTail!19 lt!559960 lt!559960))))

(assert (=> b!1235036 (subseq!526 lt!559960 lt!559960)))

(declare-fun lt!559961 () Unit!40755)

(declare-fun lemmaListSubSeqRefl!0 (List!27254) Unit!40755)

(assert (=> b!1235036 (= lt!559961 (lemmaListSubSeqRefl!0 lt!559960))))

(declare-datatypes ((array!79544 0))(
  ( (array!79545 (arr!38380 (Array (_ BitVec 32) (_ BitVec 64))) (size!38918 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79544)

(assert (=> b!1235036 (= lt!559960 (Cons!27250 (select (arr!38380 a!3835) from!3213) acc!846))))

(declare-fun b!1235037 () Bool)

(declare-fun res!823242 () Bool)

(assert (=> b!1235037 (=> (not res!823242) (not e!700312))))

(declare-fun noDuplicate!1869 (List!27254) Bool)

(assert (=> b!1235037 (= res!823242 (noDuplicate!1869 acc!846))))

(declare-fun b!1235038 () Bool)

(declare-fun res!823236 () Bool)

(assert (=> b!1235038 (=> (not res!823236) (not e!700312))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1235038 (= res!823236 (contains!7226 acc!846 k!2925))))

(declare-fun b!1235039 () Bool)

(declare-fun res!823244 () Bool)

(assert (=> b!1235039 (=> (not res!823244) (not e!700312))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235039 (= res!823244 (validKeyInArray!0 (select (arr!38380 a!3835) from!3213)))))

(declare-fun b!1235040 () Bool)

(declare-fun res!823234 () Bool)

(assert (=> b!1235040 (=> res!823234 e!700313)))

(assert (=> b!1235040 (= res!823234 (contains!7226 lt!559960 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1235041 () Bool)

(assert (=> b!1235041 (= e!700313 true)))

(declare-fun lt!559958 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79544 (_ BitVec 32) List!27254) Bool)

(assert (=> b!1235041 (= lt!559958 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!559960))))

(declare-fun lt!559957 () Unit!40755)

(declare-fun noDuplicateSubseq!73 (List!27254 List!27254) Unit!40755)

(assert (=> b!1235041 (= lt!559957 (noDuplicateSubseq!73 acc!846 lt!559960))))

(declare-fun b!1235042 () Bool)

(declare-fun res!823238 () Bool)

(assert (=> b!1235042 (=> res!823238 e!700313)))

(assert (=> b!1235042 (= res!823238 (not (noDuplicate!1869 lt!559960)))))

(declare-fun b!1235043 () Bool)

(declare-fun res!823243 () Bool)

(assert (=> b!1235043 (=> (not res!823243) (not e!700312))))

(assert (=> b!1235043 (= res!823243 (not (= from!3213 (bvsub (size!38918 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235045 () Bool)

(declare-fun res!823235 () Bool)

(assert (=> b!1235045 (=> res!823235 e!700313)))

(assert (=> b!1235045 (= res!823235 (contains!7226 lt!559960 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1235046 () Bool)

(declare-fun res!823237 () Bool)

(assert (=> b!1235046 (=> (not res!823237) (not e!700312))))

(assert (=> b!1235046 (= res!823237 (not (contains!7226 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!823241 () Bool)

(assert (=> start!102776 (=> (not res!823241) (not e!700312))))

(assert (=> start!102776 (= res!823241 (and (bvslt (size!38918 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38918 a!3835))))))

(assert (=> start!102776 e!700312))

(declare-fun array_inv!29363 (array!79544) Bool)

(assert (=> start!102776 (array_inv!29363 a!3835)))

(assert (=> start!102776 true))

(declare-fun b!1235044 () Bool)

(declare-fun res!823233 () Bool)

(assert (=> b!1235044 (=> (not res!823233) (not e!700312))))

(assert (=> b!1235044 (= res!823233 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(assert (= (and start!102776 res!823241) b!1235037))

(assert (= (and b!1235037 res!823242) b!1235046))

(assert (= (and b!1235046 res!823237) b!1235035))

(assert (= (and b!1235035 res!823240) b!1235044))

(assert (= (and b!1235044 res!823233) b!1235038))

(assert (= (and b!1235038 res!823236) b!1235043))

(assert (= (and b!1235043 res!823243) b!1235039))

(assert (= (and b!1235039 res!823244) b!1235036))

(assert (= (and b!1235036 (not res!823239)) b!1235042))

(assert (= (and b!1235042 (not res!823238)) b!1235045))

(assert (= (and b!1235045 (not res!823235)) b!1235040))

(assert (= (and b!1235040 (not res!823234)) b!1235041))

(declare-fun m!1138505 () Bool)

(assert (=> b!1235040 m!1138505))

(declare-fun m!1138507 () Bool)

(assert (=> b!1235039 m!1138507))

(assert (=> b!1235039 m!1138507))

(declare-fun m!1138509 () Bool)

(assert (=> b!1235039 m!1138509))

(declare-fun m!1138511 () Bool)

(assert (=> b!1235045 m!1138511))

(declare-fun m!1138513 () Bool)

(assert (=> b!1235044 m!1138513))

(declare-fun m!1138515 () Bool)

(assert (=> b!1235041 m!1138515))

(declare-fun m!1138517 () Bool)

(assert (=> b!1235041 m!1138517))

(declare-fun m!1138519 () Bool)

(assert (=> b!1235035 m!1138519))

(declare-fun m!1138521 () Bool)

(assert (=> b!1235042 m!1138521))

(declare-fun m!1138523 () Bool)

(assert (=> b!1235038 m!1138523))

(declare-fun m!1138525 () Bool)

(assert (=> b!1235036 m!1138525))

(declare-fun m!1138527 () Bool)

(assert (=> b!1235036 m!1138527))

(assert (=> b!1235036 m!1138507))

(declare-fun m!1138529 () Bool)

(assert (=> b!1235036 m!1138529))

(declare-fun m!1138531 () Bool)

(assert (=> b!1235036 m!1138531))

(declare-fun m!1138533 () Bool)

(assert (=> start!102776 m!1138533))

(declare-fun m!1138535 () Bool)

(assert (=> b!1235046 m!1138535))

(declare-fun m!1138537 () Bool)

(assert (=> b!1235037 m!1138537))

(push 1)

(assert (not b!1235046))

(assert (not b!1235041))

(assert (not b!1235044))

(assert (not b!1235036))

(assert (not b!1235037))

(assert (not b!1235038))

(assert (not start!102776))

(assert (not b!1235042))

(assert (not b!1235045))

(assert (not b!1235035))

(assert (not b!1235040))

(assert (not b!1235039))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

