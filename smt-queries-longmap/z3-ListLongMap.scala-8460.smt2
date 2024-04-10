; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102896 () Bool)

(assert start!102896)

(declare-fun b!1236649 () Bool)

(declare-fun res!824635 () Bool)

(declare-fun e!700899 () Bool)

(assert (=> b!1236649 (=> (not res!824635) (not e!700899))))

(declare-datatypes ((List!27251 0))(
  ( (Nil!27248) (Cons!27247 (h!28456 (_ BitVec 64)) (t!40714 List!27251)) )
))
(declare-fun acc!846 () List!27251)

(declare-fun noDuplicate!1910 (List!27251) Bool)

(assert (=> b!1236649 (= res!824635 (noDuplicate!1910 acc!846))))

(declare-fun b!1236650 () Bool)

(declare-fun res!824638 () Bool)

(assert (=> b!1236650 (=> (not res!824638) (not e!700899))))

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7313 (List!27251 (_ BitVec 64)) Bool)

(assert (=> b!1236650 (= res!824638 (contains!7313 acc!846 k0!2925))))

(declare-fun b!1236651 () Bool)

(declare-fun res!824636 () Bool)

(assert (=> b!1236651 (=> (not res!824636) (not e!700899))))

(assert (=> b!1236651 (= res!824636 (not (contains!7313 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236652 () Bool)

(declare-fun res!824634 () Bool)

(assert (=> b!1236652 (=> (not res!824634) (not e!700899))))

(assert (=> b!1236652 (= res!824634 (not (contains!7313 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236653 () Bool)

(assert (=> b!1236653 (= e!700899 (not true))))

(declare-fun lt!560839 () List!27251)

(declare-fun subseq!567 (List!27251 List!27251) Bool)

(assert (=> b!1236653 (subseq!567 lt!560839 lt!560839)))

(declare-datatypes ((Unit!41020 0))(
  ( (Unit!41021) )
))
(declare-fun lt!560840 () Unit!41020)

(declare-fun lemmaListSubSeqRefl!0 (List!27251) Unit!41020)

(assert (=> b!1236653 (= lt!560840 (lemmaListSubSeqRefl!0 lt!560839))))

(declare-datatypes ((array!79741 0))(
  ( (array!79742 (arr!38478 (Array (_ BitVec 32) (_ BitVec 64))) (size!39014 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79741)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1236653 (= lt!560839 (Cons!27247 (select (arr!38478 a!3835) from!3213) acc!846))))

(declare-fun b!1236654 () Bool)

(declare-fun res!824637 () Bool)

(assert (=> b!1236654 (=> (not res!824637) (not e!700899))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236654 (= res!824637 (validKeyInArray!0 (select (arr!38478 a!3835) from!3213)))))

(declare-fun res!824631 () Bool)

(assert (=> start!102896 (=> (not res!824631) (not e!700899))))

(assert (=> start!102896 (= res!824631 (and (bvslt (size!39014 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39014 a!3835))))))

(assert (=> start!102896 e!700899))

(declare-fun array_inv!29326 (array!79741) Bool)

(assert (=> start!102896 (array_inv!29326 a!3835)))

(assert (=> start!102896 true))

(declare-fun b!1236655 () Bool)

(declare-fun res!824632 () Bool)

(assert (=> b!1236655 (=> (not res!824632) (not e!700899))))

(assert (=> b!1236655 (= res!824632 (not (= from!3213 (bvsub (size!39014 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236656 () Bool)

(declare-fun res!824633 () Bool)

(assert (=> b!1236656 (=> (not res!824633) (not e!700899))))

(declare-fun arrayNoDuplicates!0 (array!79741 (_ BitVec 32) List!27251) Bool)

(assert (=> b!1236656 (= res!824633 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(assert (= (and start!102896 res!824631) b!1236649))

(assert (= (and b!1236649 res!824635) b!1236652))

(assert (= (and b!1236652 res!824634) b!1236651))

(assert (= (and b!1236651 res!824636) b!1236656))

(assert (= (and b!1236656 res!824633) b!1236650))

(assert (= (and b!1236650 res!824638) b!1236655))

(assert (= (and b!1236655 res!824632) b!1236654))

(assert (= (and b!1236654 res!824637) b!1236653))

(declare-fun m!1140411 () Bool)

(assert (=> b!1236651 m!1140411))

(declare-fun m!1140413 () Bool)

(assert (=> start!102896 m!1140413))

(declare-fun m!1140415 () Bool)

(assert (=> b!1236649 m!1140415))

(declare-fun m!1140417 () Bool)

(assert (=> b!1236650 m!1140417))

(declare-fun m!1140419 () Bool)

(assert (=> b!1236652 m!1140419))

(declare-fun m!1140421 () Bool)

(assert (=> b!1236654 m!1140421))

(assert (=> b!1236654 m!1140421))

(declare-fun m!1140423 () Bool)

(assert (=> b!1236654 m!1140423))

(declare-fun m!1140425 () Bool)

(assert (=> b!1236653 m!1140425))

(declare-fun m!1140427 () Bool)

(assert (=> b!1236653 m!1140427))

(assert (=> b!1236653 m!1140421))

(declare-fun m!1140429 () Bool)

(assert (=> b!1236656 m!1140429))

(check-sat (not b!1236653) (not b!1236651) (not b!1236656) (not b!1236650) (not start!102896) (not b!1236649) (not b!1236654) (not b!1236652))
(check-sat)
