; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60538 () Bool)

(assert start!60538)

(declare-fun b!679760 () Bool)

(declare-fun res!446016 () Bool)

(declare-fun e!387314 () Bool)

(assert (=> b!679760 (=> (not res!446016) (not e!387314))))

(declare-datatypes ((array!39457 0))(
  ( (array!39458 (arr!18915 (Array (_ BitVec 32) (_ BitVec 64))) (size!19279 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39457)

(declare-datatypes ((List!12863 0))(
  ( (Nil!12860) (Cons!12859 (h!13907 (_ BitVec 64)) (t!19083 List!12863)) )
))
(declare-fun arrayNoDuplicates!0 (array!39457 (_ BitVec 32) List!12863) Bool)

(assert (=> b!679760 (= res!446016 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12860))))

(declare-fun b!679761 () Bool)

(declare-fun e!387310 () Bool)

(declare-fun acc!681 () List!12863)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3515 (List!12863 (_ BitVec 64)) Bool)

(assert (=> b!679761 (= e!387310 (not (contains!3515 acc!681 k!2843)))))

(declare-fun b!679762 () Bool)

(declare-fun res!446013 () Bool)

(assert (=> b!679762 (=> (not res!446013) (not e!387314))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!679762 (= res!446013 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!679763 () Bool)

(declare-fun res!446020 () Bool)

(assert (=> b!679763 (=> (not res!446020) (not e!387314))))

(declare-fun e!387312 () Bool)

(assert (=> b!679763 (= res!446020 e!387312)))

(declare-fun res!446010 () Bool)

(assert (=> b!679763 (=> res!446010 e!387312)))

(declare-fun e!387313 () Bool)

(assert (=> b!679763 (= res!446010 e!387313)))

(declare-fun res!446014 () Bool)

(assert (=> b!679763 (=> (not res!446014) (not e!387313))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!679763 (= res!446014 (bvsgt from!3004 i!1382))))

(declare-fun b!679764 () Bool)

(declare-fun res!446019 () Bool)

(assert (=> b!679764 (=> (not res!446019) (not e!387314))))

(assert (=> b!679764 (= res!446019 (not (contains!3515 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679765 () Bool)

(declare-fun res!446012 () Bool)

(assert (=> b!679765 (=> (not res!446012) (not e!387314))))

(declare-fun arrayContainsKey!0 (array!39457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679765 (= res!446012 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!679766 () Bool)

(assert (=> b!679766 (= e!387313 (contains!3515 acc!681 k!2843))))

(declare-fun b!679767 () Bool)

(assert (=> b!679767 (= e!387312 e!387310)))

(declare-fun res!446017 () Bool)

(assert (=> b!679767 (=> (not res!446017) (not e!387310))))

(assert (=> b!679767 (= res!446017 (bvsle from!3004 i!1382))))

(declare-fun b!679768 () Bool)

(declare-fun res!446015 () Bool)

(assert (=> b!679768 (=> (not res!446015) (not e!387314))))

(assert (=> b!679768 (= res!446015 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19279 a!3626))))))

(declare-fun b!679769 () Bool)

(declare-fun res!446022 () Bool)

(assert (=> b!679769 (=> (not res!446022) (not e!387314))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679769 (= res!446022 (validKeyInArray!0 k!2843))))

(declare-fun b!679770 () Bool)

(declare-fun res!446023 () Bool)

(assert (=> b!679770 (=> (not res!446023) (not e!387314))))

(assert (=> b!679770 (= res!446023 (not (contains!3515 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679771 () Bool)

(declare-fun e!387311 () Bool)

(assert (=> b!679771 (= e!387314 (not e!387311))))

(declare-fun res!446018 () Bool)

(assert (=> b!679771 (=> res!446018 e!387311)))

(assert (=> b!679771 (= res!446018 (not (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (=> b!679771 (arrayContainsKey!0 (array!39458 (store (arr!18915 a!3626) i!1382 k!2843) (size!19279 a!3626)) k!2843 from!3004)))

(declare-fun b!679772 () Bool)

(assert (=> b!679772 (= e!387311 true)))

(assert (=> b!679772 false))

(declare-datatypes ((Unit!23779 0))(
  ( (Unit!23780) )
))
(declare-fun lt!313036 () Unit!23779)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39457 (_ BitVec 64) (_ BitVec 32)) Unit!23779)

(assert (=> b!679772 (= lt!313036 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(declare-fun res!446009 () Bool)

(assert (=> start!60538 (=> (not res!446009) (not e!387314))))

(assert (=> start!60538 (= res!446009 (and (bvslt (size!19279 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19279 a!3626))))))

(assert (=> start!60538 e!387314))

(assert (=> start!60538 true))

(declare-fun array_inv!14774 (array!39457) Bool)

(assert (=> start!60538 (array_inv!14774 a!3626)))

(declare-fun b!679773 () Bool)

(declare-fun res!446011 () Bool)

(assert (=> b!679773 (=> (not res!446011) (not e!387314))))

(declare-fun noDuplicate!789 (List!12863) Bool)

(assert (=> b!679773 (= res!446011 (noDuplicate!789 acc!681))))

(declare-fun b!679774 () Bool)

(declare-fun res!446021 () Bool)

(assert (=> b!679774 (=> (not res!446021) (not e!387314))))

(assert (=> b!679774 (= res!446021 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19279 a!3626)) (= from!3004 i!1382)))))

(assert (= (and start!60538 res!446009) b!679773))

(assert (= (and b!679773 res!446011) b!679770))

(assert (= (and b!679770 res!446023) b!679764))

(assert (= (and b!679764 res!446019) b!679763))

(assert (= (and b!679763 res!446014) b!679766))

(assert (= (and b!679763 (not res!446010)) b!679767))

(assert (= (and b!679767 res!446017) b!679761))

(assert (= (and b!679763 res!446020) b!679760))

(assert (= (and b!679760 res!446016) b!679762))

(assert (= (and b!679762 res!446013) b!679768))

(assert (= (and b!679768 res!446015) b!679769))

(assert (= (and b!679769 res!446022) b!679765))

(assert (= (and b!679765 res!446012) b!679774))

(assert (= (and b!679774 res!446021) b!679771))

(assert (= (and b!679771 (not res!446018)) b!679772))

(declare-fun m!645611 () Bool)

(assert (=> b!679766 m!645611))

(declare-fun m!645613 () Bool)

(assert (=> start!60538 m!645613))

(declare-fun m!645615 () Bool)

(assert (=> b!679771 m!645615))

(declare-fun m!645617 () Bool)

(assert (=> b!679771 m!645617))

(declare-fun m!645619 () Bool)

(assert (=> b!679771 m!645619))

(declare-fun m!645621 () Bool)

(assert (=> b!679770 m!645621))

(declare-fun m!645623 () Bool)

(assert (=> b!679769 m!645623))

(declare-fun m!645625 () Bool)

(assert (=> b!679762 m!645625))

(declare-fun m!645627 () Bool)

(assert (=> b!679765 m!645627))

(declare-fun m!645629 () Bool)

(assert (=> b!679764 m!645629))

(declare-fun m!645631 () Bool)

(assert (=> b!679773 m!645631))

(declare-fun m!645633 () Bool)

(assert (=> b!679772 m!645633))

(assert (=> b!679761 m!645611))

(declare-fun m!645635 () Bool)

(assert (=> b!679760 m!645635))

(push 1)

(assert (not b!679769))

(assert (not b!679772))

(assert (not start!60538))

(assert (not b!679765))

(assert (not b!679761))

(assert (not b!679766))

(assert (not b!679762))

(assert (not b!679764))

(assert (not b!679771))

(assert (not b!679760))

(assert (not b!679773))

(assert (not b!679770))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

