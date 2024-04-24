; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61828 () Bool)

(assert start!61828)

(declare-fun b!691498 () Bool)

(declare-fun res!455768 () Bool)

(declare-fun e!393595 () Bool)

(assert (=> b!691498 (=> (not res!455768) (not e!393595))))

(declare-datatypes ((List!13007 0))(
  ( (Nil!13004) (Cons!13003 (h!14051 (_ BitVec 64)) (t!19266 List!13007)) )
))
(declare-fun acc!681 () List!13007)

(declare-fun contains!3659 (List!13007 (_ BitVec 64)) Bool)

(assert (=> b!691498 (= res!455768 (not (contains!3659 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691499 () Bool)

(declare-fun e!393593 () Bool)

(declare-fun e!393596 () Bool)

(assert (=> b!691499 (= e!393593 e!393596)))

(declare-fun res!455775 () Bool)

(assert (=> b!691499 (=> (not res!455775) (not e!393596))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691499 (= res!455775 (bvsle from!3004 i!1382))))

(declare-fun b!691500 () Bool)

(declare-fun res!455770 () Bool)

(assert (=> b!691500 (=> (not res!455770) (not e!393595))))

(declare-datatypes ((array!39787 0))(
  ( (array!39788 (arr!19059 (Array (_ BitVec 32) (_ BitVec 64))) (size!19442 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39787)

(assert (=> b!691500 (= res!455770 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19442 a!3626))))))

(declare-fun b!691501 () Bool)

(declare-fun res!455778 () Bool)

(assert (=> b!691501 (=> (not res!455778) (not e!393595))))

(declare-fun arrayNoDuplicates!0 (array!39787 (_ BitVec 32) List!13007) Bool)

(assert (=> b!691501 (= res!455778 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691502 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!691502 (= e!393596 (not (contains!3659 acc!681 k!2843)))))

(declare-fun b!691503 () Bool)

(declare-fun res!455776 () Bool)

(assert (=> b!691503 (=> (not res!455776) (not e!393595))))

(declare-fun noDuplicate!933 (List!13007) Bool)

(assert (=> b!691503 (= res!455776 (noDuplicate!933 acc!681))))

(declare-fun b!691504 () Bool)

(declare-fun res!455780 () Bool)

(assert (=> b!691504 (=> (not res!455780) (not e!393595))))

(assert (=> b!691504 (= res!455780 (not (contains!3659 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691505 () Bool)

(declare-fun res!455769 () Bool)

(assert (=> b!691505 (=> (not res!455769) (not e!393595))))

(assert (=> b!691505 (= res!455769 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19442 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691507 () Bool)

(declare-fun res!455772 () Bool)

(assert (=> b!691507 (=> (not res!455772) (not e!393595))))

(assert (=> b!691507 (= res!455772 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13004))))

(declare-fun b!691508 () Bool)

(declare-fun res!455767 () Bool)

(assert (=> b!691508 (=> (not res!455767) (not e!393595))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691508 (= res!455767 (validKeyInArray!0 (select (arr!19059 a!3626) from!3004)))))

(declare-fun b!691509 () Bool)

(declare-fun res!455782 () Bool)

(assert (=> b!691509 (=> (not res!455782) (not e!393595))))

(assert (=> b!691509 (= res!455782 e!393593)))

(declare-fun res!455777 () Bool)

(assert (=> b!691509 (=> res!455777 e!393593)))

(declare-fun e!393594 () Bool)

(assert (=> b!691509 (= res!455777 e!393594)))

(declare-fun res!455779 () Bool)

(assert (=> b!691509 (=> (not res!455779) (not e!393594))))

(assert (=> b!691509 (= res!455779 (bvsgt from!3004 i!1382))))

(declare-fun b!691510 () Bool)

(declare-fun res!455773 () Bool)

(assert (=> b!691510 (=> (not res!455773) (not e!393595))))

(assert (=> b!691510 (= res!455773 (= (select (arr!19059 a!3626) from!3004) k!2843))))

(declare-fun b!691511 () Bool)

(declare-fun res!455781 () Bool)

(assert (=> b!691511 (=> (not res!455781) (not e!393595))))

(assert (=> b!691511 (= res!455781 (validKeyInArray!0 k!2843))))

(declare-fun b!691512 () Bool)

(declare-fun res!455774 () Bool)

(assert (=> b!691512 (=> (not res!455774) (not e!393595))))

(declare-fun arrayContainsKey!0 (array!39787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691512 (= res!455774 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!691513 () Bool)

(assert (=> b!691513 (= e!393595 (not true))))

(assert (=> b!691513 false))

(declare-datatypes ((Unit!24355 0))(
  ( (Unit!24356) )
))
(declare-fun lt!316549 () Unit!24355)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39787 (_ BitVec 64) (_ BitVec 32)) Unit!24355)

(assert (=> b!691513 (= lt!316549 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!691513 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun b!691506 () Bool)

(assert (=> b!691506 (= e!393594 (contains!3659 acc!681 k!2843))))

(declare-fun res!455771 () Bool)

(assert (=> start!61828 (=> (not res!455771) (not e!393595))))

(assert (=> start!61828 (= res!455771 (and (bvslt (size!19442 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19442 a!3626))))))

(assert (=> start!61828 e!393595))

(assert (=> start!61828 true))

(declare-fun array_inv!14918 (array!39787) Bool)

(assert (=> start!61828 (array_inv!14918 a!3626)))

(assert (= (and start!61828 res!455771) b!691503))

(assert (= (and b!691503 res!455776) b!691504))

(assert (= (and b!691504 res!455780) b!691498))

(assert (= (and b!691498 res!455768) b!691509))

(assert (= (and b!691509 res!455779) b!691506))

(assert (= (and b!691509 (not res!455777)) b!691499))

(assert (= (and b!691499 res!455775) b!691502))

(assert (= (and b!691509 res!455782) b!691507))

(assert (= (and b!691507 res!455772) b!691501))

(assert (= (and b!691501 res!455778) b!691500))

(assert (= (and b!691500 res!455770) b!691511))

(assert (= (and b!691511 res!455781) b!691512))

(assert (= (and b!691512 res!455774) b!691505))

(assert (= (and b!691505 res!455769) b!691508))

(assert (= (and b!691508 res!455767) b!691510))

(assert (= (and b!691510 res!455773) b!691513))

(declare-fun m!655079 () Bool)

(assert (=> b!691506 m!655079))

(declare-fun m!655081 () Bool)

(assert (=> b!691504 m!655081))

(declare-fun m!655083 () Bool)

(assert (=> b!691511 m!655083))

(declare-fun m!655085 () Bool)

(assert (=> b!691498 m!655085))

(declare-fun m!655087 () Bool)

(assert (=> b!691510 m!655087))

(declare-fun m!655089 () Bool)

(assert (=> b!691501 m!655089))

(declare-fun m!655091 () Bool)

(assert (=> b!691512 m!655091))

(declare-fun m!655093 () Bool)

(assert (=> b!691513 m!655093))

(declare-fun m!655095 () Bool)

(assert (=> b!691513 m!655095))

(declare-fun m!655097 () Bool)

(assert (=> b!691503 m!655097))

(assert (=> b!691502 m!655079))

(declare-fun m!655099 () Bool)

(assert (=> b!691507 m!655099))

(declare-fun m!655101 () Bool)

(assert (=> start!61828 m!655101))

(assert (=> b!691508 m!655087))

(assert (=> b!691508 m!655087))

(declare-fun m!655103 () Bool)

(assert (=> b!691508 m!655103))

(push 1)

(assert (not b!691498))

(assert (not b!691511))

(assert (not b!691508))

(assert (not b!691506))

(assert (not b!691507))

(assert (not b!691504))

(assert (not b!691501))

(assert (not b!691512))

(assert (not b!691503))

(assert (not b!691502))

(assert (not start!61828))

(assert (not b!691513))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

