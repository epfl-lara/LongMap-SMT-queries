; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102890 () Bool)

(assert start!102890)

(declare-fun b!1236533 () Bool)

(declare-fun res!824554 () Bool)

(declare-fun e!700853 () Bool)

(assert (=> b!1236533 (=> (not res!824554) (not e!700853))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79658 0))(
  ( (array!79659 (arr!38437 (Array (_ BitVec 32) (_ BitVec 64))) (size!38975 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79658)

(assert (=> b!1236533 (= res!824554 (not (= from!3213 (bvsub (size!38975 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236534 () Bool)

(declare-fun res!824553 () Bool)

(assert (=> b!1236534 (=> (not res!824553) (not e!700853))))

(declare-datatypes ((List!27311 0))(
  ( (Nil!27308) (Cons!27307 (h!28516 (_ BitVec 64)) (t!40765 List!27311)) )
))
(declare-fun acc!846 () List!27311)

(declare-fun contains!7283 (List!27311 (_ BitVec 64)) Bool)

(assert (=> b!1236534 (= res!824553 (not (contains!7283 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236535 () Bool)

(declare-fun res!824552 () Bool)

(assert (=> b!1236535 (=> (not res!824552) (not e!700853))))

(declare-fun noDuplicate!1926 (List!27311) Bool)

(assert (=> b!1236535 (= res!824552 (noDuplicate!1926 acc!846))))

(declare-fun b!1236536 () Bool)

(declare-fun res!824558 () Bool)

(assert (=> b!1236536 (=> (not res!824558) (not e!700853))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236536 (= res!824558 (validKeyInArray!0 (select (arr!38437 a!3835) from!3213)))))

(declare-fun b!1236537 () Bool)

(declare-fun res!824551 () Bool)

(assert (=> b!1236537 (=> (not res!824551) (not e!700853))))

(assert (=> b!1236537 (= res!824551 (not (contains!7283 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236538 () Bool)

(declare-fun res!824556 () Bool)

(assert (=> b!1236538 (=> (not res!824556) (not e!700853))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1236538 (= res!824556 (contains!7283 acc!846 k!2925))))

(declare-fun b!1236539 () Bool)

(assert (=> b!1236539 (= e!700853 (not true))))

(declare-fun lt!560653 () List!27311)

(declare-fun subseq!565 (List!27311 List!27311) Bool)

(assert (=> b!1236539 (subseq!565 lt!560653 lt!560653)))

(declare-datatypes ((Unit!40863 0))(
  ( (Unit!40864) )
))
(declare-fun lt!560654 () Unit!40863)

(declare-fun lemmaListSubSeqRefl!0 (List!27311) Unit!40863)

(assert (=> b!1236539 (= lt!560654 (lemmaListSubSeqRefl!0 lt!560653))))

(assert (=> b!1236539 (= lt!560653 (Cons!27307 (select (arr!38437 a!3835) from!3213) acc!846))))

(declare-fun res!824555 () Bool)

(assert (=> start!102890 (=> (not res!824555) (not e!700853))))

(assert (=> start!102890 (= res!824555 (and (bvslt (size!38975 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38975 a!3835))))))

(assert (=> start!102890 e!700853))

(declare-fun array_inv!29420 (array!79658) Bool)

(assert (=> start!102890 (array_inv!29420 a!3835)))

(assert (=> start!102890 true))

(declare-fun b!1236540 () Bool)

(declare-fun res!824557 () Bool)

(assert (=> b!1236540 (=> (not res!824557) (not e!700853))))

(declare-fun arrayNoDuplicates!0 (array!79658 (_ BitVec 32) List!27311) Bool)

(assert (=> b!1236540 (= res!824557 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(assert (= (and start!102890 res!824555) b!1236535))

(assert (= (and b!1236535 res!824552) b!1236534))

(assert (= (and b!1236534 res!824553) b!1236537))

(assert (= (and b!1236537 res!824551) b!1236540))

(assert (= (and b!1236540 res!824557) b!1236538))

(assert (= (and b!1236538 res!824556) b!1236533))

(assert (= (and b!1236533 res!824554) b!1236536))

(assert (= (and b!1236536 res!824558) b!1236539))

(declare-fun m!1139875 () Bool)

(assert (=> b!1236535 m!1139875))

(declare-fun m!1139877 () Bool)

(assert (=> b!1236539 m!1139877))

(declare-fun m!1139879 () Bool)

(assert (=> b!1236539 m!1139879))

(declare-fun m!1139881 () Bool)

(assert (=> b!1236539 m!1139881))

(declare-fun m!1139883 () Bool)

(assert (=> b!1236538 m!1139883))

(declare-fun m!1139885 () Bool)

(assert (=> b!1236537 m!1139885))

(declare-fun m!1139887 () Bool)

(assert (=> b!1236540 m!1139887))

(assert (=> b!1236536 m!1139881))

(assert (=> b!1236536 m!1139881))

(declare-fun m!1139889 () Bool)

(assert (=> b!1236536 m!1139889))

(declare-fun m!1139891 () Bool)

(assert (=> start!102890 m!1139891))

(declare-fun m!1139893 () Bool)

(assert (=> b!1236534 m!1139893))

(push 1)

(assert (not b!1236536))

(assert (not b!1236540))

(assert (not b!1236535))

(assert (not b!1236538))

(assert (not b!1236534))

(assert (not b!1236537))

(assert (not b!1236539))

(assert (not start!102890))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

