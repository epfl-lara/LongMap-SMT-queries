; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102894 () Bool)

(assert start!102894)

(declare-fun b!1236625 () Bool)

(declare-fun res!824613 () Bool)

(declare-fun e!700892 () Bool)

(assert (=> b!1236625 (=> (not res!824613) (not e!700892))))

(declare-datatypes ((List!27250 0))(
  ( (Nil!27247) (Cons!27246 (h!28455 (_ BitVec 64)) (t!40713 List!27250)) )
))
(declare-fun acc!846 () List!27250)

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7312 (List!27250 (_ BitVec 64)) Bool)

(assert (=> b!1236625 (= res!824613 (contains!7312 acc!846 k!2925))))

(declare-fun b!1236626 () Bool)

(declare-fun res!824614 () Bool)

(assert (=> b!1236626 (=> (not res!824614) (not e!700892))))

(declare-fun noDuplicate!1909 (List!27250) Bool)

(assert (=> b!1236626 (= res!824614 (noDuplicate!1909 acc!846))))

(declare-fun b!1236628 () Bool)

(declare-fun res!824608 () Bool)

(assert (=> b!1236628 (=> (not res!824608) (not e!700892))))

(assert (=> b!1236628 (= res!824608 (not (contains!7312 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236629 () Bool)

(declare-fun res!824611 () Bool)

(assert (=> b!1236629 (=> (not res!824611) (not e!700892))))

(declare-datatypes ((array!79739 0))(
  ( (array!79740 (arr!38477 (Array (_ BitVec 32) (_ BitVec 64))) (size!39013 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79739)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236629 (= res!824611 (validKeyInArray!0 (select (arr!38477 a!3835) from!3213)))))

(declare-fun b!1236630 () Bool)

(declare-fun res!824610 () Bool)

(assert (=> b!1236630 (=> (not res!824610) (not e!700892))))

(assert (=> b!1236630 (= res!824610 (not (= from!3213 (bvsub (size!39013 a!3835) #b00000000000000000000000000000001))))))

(declare-fun res!824612 () Bool)

(assert (=> start!102894 (=> (not res!824612) (not e!700892))))

(assert (=> start!102894 (= res!824612 (and (bvslt (size!39013 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39013 a!3835))))))

(assert (=> start!102894 e!700892))

(declare-fun array_inv!29325 (array!79739) Bool)

(assert (=> start!102894 (array_inv!29325 a!3835)))

(assert (=> start!102894 true))

(declare-fun b!1236627 () Bool)

(assert (=> b!1236627 (= e!700892 (not true))))

(declare-fun lt!560834 () List!27250)

(declare-fun subseq!566 (List!27250 List!27250) Bool)

(assert (=> b!1236627 (subseq!566 lt!560834 lt!560834)))

(declare-datatypes ((Unit!41018 0))(
  ( (Unit!41019) )
))
(declare-fun lt!560833 () Unit!41018)

(declare-fun lemmaListSubSeqRefl!0 (List!27250) Unit!41018)

(assert (=> b!1236627 (= lt!560833 (lemmaListSubSeqRefl!0 lt!560834))))

(assert (=> b!1236627 (= lt!560834 (Cons!27246 (select (arr!38477 a!3835) from!3213) acc!846))))

(declare-fun b!1236631 () Bool)

(declare-fun res!824607 () Bool)

(assert (=> b!1236631 (=> (not res!824607) (not e!700892))))

(assert (=> b!1236631 (= res!824607 (not (contains!7312 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236632 () Bool)

(declare-fun res!824609 () Bool)

(assert (=> b!1236632 (=> (not res!824609) (not e!700892))))

(declare-fun arrayNoDuplicates!0 (array!79739 (_ BitVec 32) List!27250) Bool)

(assert (=> b!1236632 (= res!824609 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(assert (= (and start!102894 res!824612) b!1236626))

(assert (= (and b!1236626 res!824614) b!1236628))

(assert (= (and b!1236628 res!824608) b!1236631))

(assert (= (and b!1236631 res!824607) b!1236632))

(assert (= (and b!1236632 res!824609) b!1236625))

(assert (= (and b!1236625 res!824613) b!1236630))

(assert (= (and b!1236630 res!824610) b!1236629))

(assert (= (and b!1236629 res!824611) b!1236627))

(declare-fun m!1140391 () Bool)

(assert (=> b!1236626 m!1140391))

(declare-fun m!1140393 () Bool)

(assert (=> b!1236627 m!1140393))

(declare-fun m!1140395 () Bool)

(assert (=> b!1236627 m!1140395))

(declare-fun m!1140397 () Bool)

(assert (=> b!1236627 m!1140397))

(declare-fun m!1140399 () Bool)

(assert (=> b!1236631 m!1140399))

(assert (=> b!1236629 m!1140397))

(assert (=> b!1236629 m!1140397))

(declare-fun m!1140401 () Bool)

(assert (=> b!1236629 m!1140401))

(declare-fun m!1140403 () Bool)

(assert (=> b!1236628 m!1140403))

(declare-fun m!1140405 () Bool)

(assert (=> start!102894 m!1140405))

(declare-fun m!1140407 () Bool)

(assert (=> b!1236632 m!1140407))

(declare-fun m!1140409 () Bool)

(assert (=> b!1236625 m!1140409))

(push 1)

(assert (not b!1236632))

(assert (not b!1236629))

(assert (not b!1236628))

(assert (not b!1236625))

(assert (not start!102894))

(assert (not b!1236626))

(assert (not b!1236631))

(assert (not b!1236627))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

