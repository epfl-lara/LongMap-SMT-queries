; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102756 () Bool)

(assert start!102756)

(declare-fun b!1234707 () Bool)

(declare-fun res!822869 () Bool)

(declare-fun e!700246 () Bool)

(assert (=> b!1234707 (=> res!822869 e!700246)))

(declare-datatypes ((List!27181 0))(
  ( (Nil!27178) (Cons!27177 (h!28386 (_ BitVec 64)) (t!40644 List!27181)) )
))
(declare-fun lt!559968 () List!27181)

(declare-fun contains!7243 (List!27181 (_ BitVec 64)) Bool)

(assert (=> b!1234707 (= res!822869 (contains!7243 lt!559968 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!822876 () Bool)

(declare-fun e!700247 () Bool)

(assert (=> start!102756 (=> (not res!822876) (not e!700247))))

(declare-datatypes ((array!79601 0))(
  ( (array!79602 (arr!38408 (Array (_ BitVec 32) (_ BitVec 64))) (size!38944 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79601)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102756 (= res!822876 (and (bvslt (size!38944 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38944 a!3835))))))

(assert (=> start!102756 e!700247))

(declare-fun array_inv!29256 (array!79601) Bool)

(assert (=> start!102756 (array_inv!29256 a!3835)))

(assert (=> start!102756 true))

(declare-fun b!1234708 () Bool)

(declare-fun res!822880 () Bool)

(assert (=> b!1234708 (=> (not res!822880) (not e!700247))))

(declare-fun acc!846 () List!27181)

(assert (=> b!1234708 (= res!822880 (not (contains!7243 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234709 () Bool)

(declare-fun res!822875 () Bool)

(assert (=> b!1234709 (=> (not res!822875) (not e!700247))))

(assert (=> b!1234709 (= res!822875 (not (= from!3213 (bvsub (size!38944 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1234710 () Bool)

(assert (=> b!1234710 (= e!700246 true)))

(declare-fun lt!559969 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79601 (_ BitVec 32) List!27181) Bool)

(assert (=> b!1234710 (= lt!559969 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!559968))))

(declare-datatypes ((Unit!40886 0))(
  ( (Unit!40887) )
))
(declare-fun lt!559966 () Unit!40886)

(declare-fun noDuplicateSubseq!62 (List!27181 List!27181) Unit!40886)

(assert (=> b!1234710 (= lt!559966 (noDuplicateSubseq!62 acc!846 lt!559968))))

(declare-fun b!1234711 () Bool)

(declare-fun res!822872 () Bool)

(assert (=> b!1234711 (=> (not res!822872) (not e!700247))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1234711 (= res!822872 (contains!7243 acc!846 k!2925))))

(declare-fun b!1234712 () Bool)

(declare-fun res!822870 () Bool)

(assert (=> b!1234712 (=> (not res!822870) (not e!700247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234712 (= res!822870 (validKeyInArray!0 (select (arr!38408 a!3835) from!3213)))))

(declare-fun b!1234713 () Bool)

(declare-fun res!822877 () Bool)

(assert (=> b!1234713 (=> res!822877 e!700246)))

(assert (=> b!1234713 (= res!822877 (contains!7243 lt!559968 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234714 () Bool)

(assert (=> b!1234714 (= e!700247 (not e!700246))))

(declare-fun res!822879 () Bool)

(assert (=> b!1234714 (=> res!822879 e!700246)))

(assert (=> b!1234714 (= res!822879 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!515 (List!27181 List!27181) Bool)

(assert (=> b!1234714 (subseq!515 acc!846 lt!559968)))

(declare-fun lt!559967 () Unit!40886)

(declare-fun subseqTail!8 (List!27181 List!27181) Unit!40886)

(assert (=> b!1234714 (= lt!559967 (subseqTail!8 lt!559968 lt!559968))))

(assert (=> b!1234714 (subseq!515 lt!559968 lt!559968)))

(declare-fun lt!559970 () Unit!40886)

(declare-fun lemmaListSubSeqRefl!0 (List!27181) Unit!40886)

(assert (=> b!1234714 (= lt!559970 (lemmaListSubSeqRefl!0 lt!559968))))

(assert (=> b!1234714 (= lt!559968 (Cons!27177 (select (arr!38408 a!3835) from!3213) acc!846))))

(declare-fun b!1234715 () Bool)

(declare-fun res!822878 () Bool)

(assert (=> b!1234715 (=> res!822878 e!700246)))

(declare-fun noDuplicate!1840 (List!27181) Bool)

(assert (=> b!1234715 (= res!822878 (not (noDuplicate!1840 lt!559968)))))

(declare-fun b!1234716 () Bool)

(declare-fun res!822873 () Bool)

(assert (=> b!1234716 (=> (not res!822873) (not e!700247))))

(assert (=> b!1234716 (= res!822873 (noDuplicate!1840 acc!846))))

(declare-fun b!1234717 () Bool)

(declare-fun res!822874 () Bool)

(assert (=> b!1234717 (=> (not res!822874) (not e!700247))))

(assert (=> b!1234717 (= res!822874 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1234718 () Bool)

(declare-fun res!822871 () Bool)

(assert (=> b!1234718 (=> (not res!822871) (not e!700247))))

(assert (=> b!1234718 (= res!822871 (not (contains!7243 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102756 res!822876) b!1234716))

(assert (= (and b!1234716 res!822873) b!1234718))

(assert (= (and b!1234718 res!822871) b!1234708))

(assert (= (and b!1234708 res!822880) b!1234717))

(assert (= (and b!1234717 res!822874) b!1234711))

(assert (= (and b!1234711 res!822872) b!1234709))

(assert (= (and b!1234709 res!822875) b!1234712))

(assert (= (and b!1234712 res!822870) b!1234714))

(assert (= (and b!1234714 (not res!822879)) b!1234715))

(assert (= (and b!1234715 (not res!822878)) b!1234713))

(assert (= (and b!1234713 (not res!822877)) b!1234707))

(assert (= (and b!1234707 (not res!822869)) b!1234710))

(declare-fun m!1138627 () Bool)

(assert (=> b!1234714 m!1138627))

(declare-fun m!1138629 () Bool)

(assert (=> b!1234714 m!1138629))

(declare-fun m!1138631 () Bool)

(assert (=> b!1234714 m!1138631))

(declare-fun m!1138633 () Bool)

(assert (=> b!1234714 m!1138633))

(declare-fun m!1138635 () Bool)

(assert (=> b!1234714 m!1138635))

(assert (=> b!1234712 m!1138635))

(assert (=> b!1234712 m!1138635))

(declare-fun m!1138637 () Bool)

(assert (=> b!1234712 m!1138637))

(declare-fun m!1138639 () Bool)

(assert (=> b!1234715 m!1138639))

(declare-fun m!1138641 () Bool)

(assert (=> b!1234711 m!1138641))

(declare-fun m!1138643 () Bool)

(assert (=> b!1234718 m!1138643))

(declare-fun m!1138645 () Bool)

(assert (=> b!1234716 m!1138645))

(declare-fun m!1138647 () Bool)

(assert (=> start!102756 m!1138647))

(declare-fun m!1138649 () Bool)

(assert (=> b!1234710 m!1138649))

(declare-fun m!1138651 () Bool)

(assert (=> b!1234710 m!1138651))

(declare-fun m!1138653 () Bool)

(assert (=> b!1234713 m!1138653))

(declare-fun m!1138655 () Bool)

(assert (=> b!1234708 m!1138655))

(declare-fun m!1138657 () Bool)

(assert (=> b!1234707 m!1138657))

(declare-fun m!1138659 () Bool)

(assert (=> b!1234717 m!1138659))

(push 1)

(assert (not b!1234710))

(assert (not b!1234714))

(assert (not b!1234715))

(assert (not b!1234716))

(assert (not b!1234717))

(assert (not b!1234718))

(assert (not b!1234707))

(assert (not b!1234708))

(assert (not start!102756))

(assert (not b!1234711))

(assert (not b!1234712))

(assert (not b!1234713))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

