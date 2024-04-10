; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102898 () Bool)

(assert start!102898)

(declare-fun b!1236673 () Bool)

(declare-fun res!824656 () Bool)

(declare-fun e!700905 () Bool)

(assert (=> b!1236673 (=> (not res!824656) (not e!700905))))

(declare-datatypes ((array!79743 0))(
  ( (array!79744 (arr!38479 (Array (_ BitVec 32) (_ BitVec 64))) (size!39015 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79743)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236673 (= res!824656 (validKeyInArray!0 (select (arr!38479 a!3835) from!3213)))))

(declare-fun b!1236674 () Bool)

(declare-fun res!824659 () Bool)

(assert (=> b!1236674 (=> (not res!824659) (not e!700905))))

(declare-datatypes ((List!27252 0))(
  ( (Nil!27249) (Cons!27248 (h!28457 (_ BitVec 64)) (t!40715 List!27252)) )
))
(declare-fun acc!846 () List!27252)

(declare-fun noDuplicate!1911 (List!27252) Bool)

(assert (=> b!1236674 (= res!824659 (noDuplicate!1911 acc!846))))

(declare-fun b!1236675 () Bool)

(declare-fun res!824662 () Bool)

(assert (=> b!1236675 (=> (not res!824662) (not e!700905))))

(declare-fun arrayNoDuplicates!0 (array!79743 (_ BitVec 32) List!27252) Bool)

(assert (=> b!1236675 (= res!824662 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236676 () Bool)

(declare-fun res!824657 () Bool)

(assert (=> b!1236676 (=> (not res!824657) (not e!700905))))

(declare-fun contains!7314 (List!27252 (_ BitVec 64)) Bool)

(assert (=> b!1236676 (= res!824657 (not (contains!7314 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236677 () Bool)

(declare-fun res!824661 () Bool)

(assert (=> b!1236677 (=> (not res!824661) (not e!700905))))

(assert (=> b!1236677 (= res!824661 (not (contains!7314 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!824660 () Bool)

(assert (=> start!102898 (=> (not res!824660) (not e!700905))))

(assert (=> start!102898 (= res!824660 (and (bvslt (size!39015 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39015 a!3835))))))

(assert (=> start!102898 e!700905))

(declare-fun array_inv!29327 (array!79743) Bool)

(assert (=> start!102898 (array_inv!29327 a!3835)))

(assert (=> start!102898 true))

(declare-fun b!1236678 () Bool)

(declare-fun res!824655 () Bool)

(assert (=> b!1236678 (=> (not res!824655) (not e!700905))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1236678 (= res!824655 (contains!7314 acc!846 k!2925))))

(declare-fun b!1236679 () Bool)

(assert (=> b!1236679 (= e!700905 (not true))))

(declare-fun lt!560846 () List!27252)

(declare-fun subseq!568 (List!27252 List!27252) Bool)

(assert (=> b!1236679 (subseq!568 lt!560846 lt!560846)))

(declare-datatypes ((Unit!41022 0))(
  ( (Unit!41023) )
))
(declare-fun lt!560845 () Unit!41022)

(declare-fun lemmaListSubSeqRefl!0 (List!27252) Unit!41022)

(assert (=> b!1236679 (= lt!560845 (lemmaListSubSeqRefl!0 lt!560846))))

(assert (=> b!1236679 (= lt!560846 (Cons!27248 (select (arr!38479 a!3835) from!3213) acc!846))))

(declare-fun b!1236680 () Bool)

(declare-fun res!824658 () Bool)

(assert (=> b!1236680 (=> (not res!824658) (not e!700905))))

(assert (=> b!1236680 (= res!824658 (not (= from!3213 (bvsub (size!39015 a!3835) #b00000000000000000000000000000001))))))

(assert (= (and start!102898 res!824660) b!1236674))

(assert (= (and b!1236674 res!824659) b!1236677))

(assert (= (and b!1236677 res!824661) b!1236676))

(assert (= (and b!1236676 res!824657) b!1236675))

(assert (= (and b!1236675 res!824662) b!1236678))

(assert (= (and b!1236678 res!824655) b!1236680))

(assert (= (and b!1236680 res!824658) b!1236673))

(assert (= (and b!1236673 res!824656) b!1236679))

(declare-fun m!1140431 () Bool)

(assert (=> b!1236675 m!1140431))

(declare-fun m!1140433 () Bool)

(assert (=> b!1236673 m!1140433))

(assert (=> b!1236673 m!1140433))

(declare-fun m!1140435 () Bool)

(assert (=> b!1236673 m!1140435))

(declare-fun m!1140437 () Bool)

(assert (=> b!1236677 m!1140437))

(declare-fun m!1140439 () Bool)

(assert (=> b!1236679 m!1140439))

(declare-fun m!1140441 () Bool)

(assert (=> b!1236679 m!1140441))

(assert (=> b!1236679 m!1140433))

(declare-fun m!1140443 () Bool)

(assert (=> start!102898 m!1140443))

(declare-fun m!1140445 () Bool)

(assert (=> b!1236676 m!1140445))

(declare-fun m!1140447 () Bool)

(assert (=> b!1236678 m!1140447))

(declare-fun m!1140449 () Bool)

(assert (=> b!1236674 m!1140449))

(push 1)

(assert (not start!102898))

(assert (not b!1236673))

(assert (not b!1236678))

(assert (not b!1236679))

(assert (not b!1236676))

(assert (not b!1236675))

(assert (not b!1236677))

(assert (not b!1236674))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

