; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102822 () Bool)

(assert start!102822)

(declare-fun b!1235801 () Bool)

(declare-fun res!823873 () Bool)

(declare-fun e!700592 () Bool)

(assert (=> b!1235801 (=> (not res!823873) (not e!700592))))

(declare-datatypes ((List!27214 0))(
  ( (Nil!27211) (Cons!27210 (h!28419 (_ BitVec 64)) (t!40677 List!27214)) )
))
(declare-fun acc!846 () List!27214)

(declare-fun contains!7276 (List!27214 (_ BitVec 64)) Bool)

(assert (=> b!1235801 (= res!823873 (not (contains!7276 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235802 () Bool)

(declare-fun res!823872 () Bool)

(assert (=> b!1235802 (=> (not res!823872) (not e!700592))))

(declare-datatypes ((array!79667 0))(
  ( (array!79668 (arr!38441 (Array (_ BitVec 32) (_ BitVec 64))) (size!38977 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79667)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79667 (_ BitVec 32) List!27214) Bool)

(assert (=> b!1235802 (= res!823872 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235803 () Bool)

(declare-fun res!823870 () Bool)

(assert (=> b!1235803 (=> (not res!823870) (not e!700592))))

(assert (=> b!1235803 (= res!823870 (not (= from!3213 (bvsub (size!38977 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235804 () Bool)

(declare-datatypes ((Unit!40967 0))(
  ( (Unit!40968) )
))
(declare-fun e!700593 () Unit!40967)

(declare-fun Unit!40969 () Unit!40967)

(assert (=> b!1235804 (= e!700593 Unit!40969)))

(declare-fun b!1235805 () Bool)

(declare-fun res!823869 () Bool)

(assert (=> b!1235805 (=> (not res!823869) (not e!700592))))

(declare-fun noDuplicate!1873 (List!27214) Bool)

(assert (=> b!1235805 (= res!823869 (noDuplicate!1873 acc!846))))

(declare-fun b!1235806 () Bool)

(declare-fun lt!560508 () Unit!40967)

(assert (=> b!1235806 (= e!700593 lt!560508)))

(declare-fun lt!560512 () List!27214)

(assert (=> b!1235806 (= lt!560512 (Cons!27210 (select (arr!38441 a!3835) from!3213) acc!846))))

(declare-fun lt!560510 () Unit!40967)

(declare-fun lemmaListSubSeqRefl!0 (List!27214) Unit!40967)

(assert (=> b!1235806 (= lt!560510 (lemmaListSubSeqRefl!0 lt!560512))))

(declare-fun subseq!548 (List!27214 List!27214) Bool)

(assert (=> b!1235806 (subseq!548 lt!560512 lt!560512)))

(declare-fun lt!560509 () Unit!40967)

(declare-fun subseqTail!41 (List!27214 List!27214) Unit!40967)

(assert (=> b!1235806 (= lt!560509 (subseqTail!41 lt!560512 lt!560512))))

(assert (=> b!1235806 (subseq!548 acc!846 lt!560512)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79667 List!27214 List!27214 (_ BitVec 32)) Unit!40967)

(assert (=> b!1235806 (= lt!560508 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560512 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1235806 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1235807 () Bool)

(declare-fun res!823874 () Bool)

(assert (=> b!1235807 (=> (not res!823874) (not e!700592))))

(assert (=> b!1235807 (= res!823874 (not (contains!7276 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235808 () Bool)

(declare-fun e!700590 () Bool)

(assert (=> b!1235808 (= e!700590 false)))

(declare-fun lt!560511 () Bool)

(assert (=> b!1235808 (= lt!560511 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1235809 () Bool)

(assert (=> b!1235809 (= e!700592 e!700590)))

(declare-fun res!823871 () Bool)

(assert (=> b!1235809 (=> (not res!823871) (not e!700590))))

(assert (=> b!1235809 (= res!823871 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38977 a!3835))))))

(declare-fun lt!560513 () Unit!40967)

(assert (=> b!1235809 (= lt!560513 e!700593)))

(declare-fun c!120826 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235809 (= c!120826 (validKeyInArray!0 (select (arr!38441 a!3835) from!3213)))))

(declare-fun b!1235810 () Bool)

(declare-fun res!823875 () Bool)

(assert (=> b!1235810 (=> (not res!823875) (not e!700592))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1235810 (= res!823875 (contains!7276 acc!846 k!2925))))

(declare-fun res!823876 () Bool)

(assert (=> start!102822 (=> (not res!823876) (not e!700592))))

(assert (=> start!102822 (= res!823876 (and (bvslt (size!38977 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38977 a!3835))))))

(assert (=> start!102822 e!700592))

(declare-fun array_inv!29289 (array!79667) Bool)

(assert (=> start!102822 (array_inv!29289 a!3835)))

(assert (=> start!102822 true))

(assert (= (and start!102822 res!823876) b!1235805))

(assert (= (and b!1235805 res!823869) b!1235807))

(assert (= (and b!1235807 res!823874) b!1235801))

(assert (= (and b!1235801 res!823873) b!1235802))

(assert (= (and b!1235802 res!823872) b!1235810))

(assert (= (and b!1235810 res!823875) b!1235803))

(assert (= (and b!1235803 res!823870) b!1235809))

(assert (= (and b!1235809 c!120826) b!1235806))

(assert (= (and b!1235809 (not c!120826)) b!1235804))

(assert (= (and b!1235809 res!823871) b!1235808))

(declare-fun m!1139659 () Bool)

(assert (=> b!1235807 m!1139659))

(declare-fun m!1139661 () Bool)

(assert (=> b!1235810 m!1139661))

(declare-fun m!1139663 () Bool)

(assert (=> b!1235802 m!1139663))

(declare-fun m!1139665 () Bool)

(assert (=> b!1235808 m!1139665))

(declare-fun m!1139667 () Bool)

(assert (=> b!1235805 m!1139667))

(declare-fun m!1139669 () Bool)

(assert (=> b!1235809 m!1139669))

(assert (=> b!1235809 m!1139669))

(declare-fun m!1139671 () Bool)

(assert (=> b!1235809 m!1139671))

(declare-fun m!1139673 () Bool)

(assert (=> start!102822 m!1139673))

(declare-fun m!1139675 () Bool)

(assert (=> b!1235806 m!1139675))

(declare-fun m!1139677 () Bool)

(assert (=> b!1235806 m!1139677))

(declare-fun m!1139679 () Bool)

(assert (=> b!1235806 m!1139679))

(assert (=> b!1235806 m!1139665))

(assert (=> b!1235806 m!1139669))

(declare-fun m!1139681 () Bool)

(assert (=> b!1235806 m!1139681))

(declare-fun m!1139683 () Bool)

(assert (=> b!1235806 m!1139683))

(declare-fun m!1139685 () Bool)

(assert (=> b!1235801 m!1139685))

(push 1)

