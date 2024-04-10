; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102744 () Bool)

(assert start!102744)

(declare-fun b!1234491 () Bool)

(declare-fun res!822656 () Bool)

(declare-fun e!700193 () Bool)

(assert (=> b!1234491 (=> res!822656 e!700193)))

(declare-datatypes ((List!27175 0))(
  ( (Nil!27172) (Cons!27171 (h!28380 (_ BitVec 64)) (t!40638 List!27175)) )
))
(declare-fun lt!559877 () List!27175)

(declare-fun contains!7237 (List!27175 (_ BitVec 64)) Bool)

(assert (=> b!1234491 (= res!822656 (contains!7237 lt!559877 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234492 () Bool)

(declare-fun res!822659 () Bool)

(declare-fun e!700192 () Bool)

(assert (=> b!1234492 (=> (not res!822659) (not e!700192))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79589 0))(
  ( (array!79590 (arr!38402 (Array (_ BitVec 32) (_ BitVec 64))) (size!38938 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79589)

(assert (=> b!1234492 (= res!822659 (not (= from!3213 (bvsub (size!38938 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1234493 () Bool)

(assert (=> b!1234493 (= e!700192 (not e!700193))))

(declare-fun res!822657 () Bool)

(assert (=> b!1234493 (=> res!822657 e!700193)))

(assert (=> b!1234493 (= res!822657 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun acc!846 () List!27175)

(declare-fun subseq!509 (List!27175 List!27175) Bool)

(assert (=> b!1234493 (subseq!509 acc!846 lt!559877)))

(declare-datatypes ((Unit!40874 0))(
  ( (Unit!40875) )
))
(declare-fun lt!559880 () Unit!40874)

(declare-fun subseqTail!2 (List!27175 List!27175) Unit!40874)

(assert (=> b!1234493 (= lt!559880 (subseqTail!2 lt!559877 lt!559877))))

(assert (=> b!1234493 (subseq!509 lt!559877 lt!559877)))

(declare-fun lt!559878 () Unit!40874)

(declare-fun lemmaListSubSeqRefl!0 (List!27175) Unit!40874)

(assert (=> b!1234493 (= lt!559878 (lemmaListSubSeqRefl!0 lt!559877))))

(assert (=> b!1234493 (= lt!559877 (Cons!27171 (select (arr!38402 a!3835) from!3213) acc!846))))

(declare-fun b!1234494 () Bool)

(declare-fun res!822660 () Bool)

(assert (=> b!1234494 (=> res!822660 e!700193)))

(assert (=> b!1234494 (= res!822660 (contains!7237 lt!559877 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234495 () Bool)

(declare-fun res!822658 () Bool)

(assert (=> b!1234495 (=> (not res!822658) (not e!700192))))

(assert (=> b!1234495 (= res!822658 (not (contains!7237 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234496 () Bool)

(declare-fun res!822661 () Bool)

(assert (=> b!1234496 (=> (not res!822661) (not e!700192))))

(declare-fun noDuplicate!1834 (List!27175) Bool)

(assert (=> b!1234496 (= res!822661 (noDuplicate!1834 acc!846))))

(declare-fun b!1234497 () Bool)

(declare-fun res!822663 () Bool)

(assert (=> b!1234497 (=> (not res!822663) (not e!700192))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1234497 (= res!822663 (contains!7237 acc!846 k!2925))))

(declare-fun res!822662 () Bool)

(assert (=> start!102744 (=> (not res!822662) (not e!700192))))

(assert (=> start!102744 (= res!822662 (and (bvslt (size!38938 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38938 a!3835))))))

(assert (=> start!102744 e!700192))

(declare-fun array_inv!29250 (array!79589) Bool)

(assert (=> start!102744 (array_inv!29250 a!3835)))

(assert (=> start!102744 true))

(declare-fun b!1234498 () Bool)

(declare-fun res!822664 () Bool)

(assert (=> b!1234498 (=> (not res!822664) (not e!700192))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234498 (= res!822664 (validKeyInArray!0 (select (arr!38402 a!3835) from!3213)))))

(declare-fun b!1234499 () Bool)

(assert (=> b!1234499 (= e!700193 true)))

(declare-fun lt!559879 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79589 (_ BitVec 32) List!27175) Bool)

(assert (=> b!1234499 (= lt!559879 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!559877))))

(declare-fun lt!559876 () Unit!40874)

(declare-fun noDuplicateSubseq!56 (List!27175 List!27175) Unit!40874)

(assert (=> b!1234499 (= lt!559876 (noDuplicateSubseq!56 acc!846 lt!559877))))

(declare-fun b!1234500 () Bool)

(declare-fun res!822653 () Bool)

(assert (=> b!1234500 (=> (not res!822653) (not e!700192))))

(assert (=> b!1234500 (= res!822653 (not (contains!7237 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234501 () Bool)

(declare-fun res!822655 () Bool)

(assert (=> b!1234501 (=> (not res!822655) (not e!700192))))

(assert (=> b!1234501 (= res!822655 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1234502 () Bool)

(declare-fun res!822654 () Bool)

(assert (=> b!1234502 (=> res!822654 e!700193)))

(assert (=> b!1234502 (= res!822654 (not (noDuplicate!1834 lt!559877)))))

(assert (= (and start!102744 res!822662) b!1234496))

(assert (= (and b!1234496 res!822661) b!1234495))

(assert (= (and b!1234495 res!822658) b!1234500))

(assert (= (and b!1234500 res!822653) b!1234501))

(assert (= (and b!1234501 res!822655) b!1234497))

(assert (= (and b!1234497 res!822663) b!1234492))

(assert (= (and b!1234492 res!822659) b!1234498))

(assert (= (and b!1234498 res!822664) b!1234493))

(assert (= (and b!1234493 (not res!822657)) b!1234502))

(assert (= (and b!1234502 (not res!822654)) b!1234491))

(assert (= (and b!1234491 (not res!822656)) b!1234494))

(assert (= (and b!1234494 (not res!822660)) b!1234499))

(declare-fun m!1138423 () Bool)

(assert (=> start!102744 m!1138423))

(declare-fun m!1138425 () Bool)

(assert (=> b!1234499 m!1138425))

(declare-fun m!1138427 () Bool)

(assert (=> b!1234499 m!1138427))

(declare-fun m!1138429 () Bool)

(assert (=> b!1234493 m!1138429))

(declare-fun m!1138431 () Bool)

(assert (=> b!1234493 m!1138431))

(declare-fun m!1138433 () Bool)

(assert (=> b!1234493 m!1138433))

(declare-fun m!1138435 () Bool)

(assert (=> b!1234493 m!1138435))

(declare-fun m!1138437 () Bool)

(assert (=> b!1234493 m!1138437))

(declare-fun m!1138439 () Bool)

(assert (=> b!1234491 m!1138439))

(assert (=> b!1234498 m!1138437))

(assert (=> b!1234498 m!1138437))

(declare-fun m!1138441 () Bool)

(assert (=> b!1234498 m!1138441))

(declare-fun m!1138443 () Bool)

(assert (=> b!1234496 m!1138443))

(declare-fun m!1138445 () Bool)

(assert (=> b!1234500 m!1138445))

(declare-fun m!1138447 () Bool)

(assert (=> b!1234495 m!1138447))

(declare-fun m!1138449 () Bool)

(assert (=> b!1234502 m!1138449))

(declare-fun m!1138451 () Bool)

(assert (=> b!1234497 m!1138451))

(declare-fun m!1138453 () Bool)

(assert (=> b!1234501 m!1138453))

(declare-fun m!1138455 () Bool)

(assert (=> b!1234494 m!1138455))

(push 1)

(assert (not b!1234491))

(assert (not b!1234493))

(assert (not b!1234499))

(assert (not b!1234497))

(assert (not start!102744))

(assert (not b!1234502))

(assert (not b!1234495))

(assert (not b!1234494))

(assert (not b!1234501))

(assert (not b!1234498))

(assert (not b!1234496))

(assert (not b!1234500))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

