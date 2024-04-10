; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102748 () Bool)

(assert start!102748)

(declare-fun b!1234563 () Bool)

(declare-fun res!822729 () Bool)

(declare-fun e!700212 () Bool)

(assert (=> b!1234563 (=> res!822729 e!700212)))

(declare-datatypes ((List!27177 0))(
  ( (Nil!27174) (Cons!27173 (h!28382 (_ BitVec 64)) (t!40640 List!27177)) )
))
(declare-fun lt!559907 () List!27177)

(declare-fun contains!7239 (List!27177 (_ BitVec 64)) Bool)

(assert (=> b!1234563 (= res!822729 (contains!7239 lt!559907 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234564 () Bool)

(declare-fun res!822735 () Bool)

(declare-fun e!700210 () Bool)

(assert (=> b!1234564 (=> (not res!822735) (not e!700210))))

(declare-fun acc!846 () List!27177)

(declare-fun noDuplicate!1836 (List!27177) Bool)

(assert (=> b!1234564 (= res!822735 (noDuplicate!1836 acc!846))))

(declare-fun b!1234565 () Bool)

(declare-fun res!822726 () Bool)

(assert (=> b!1234565 (=> (not res!822726) (not e!700210))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79593 0))(
  ( (array!79594 (arr!38404 (Array (_ BitVec 32) (_ BitVec 64))) (size!38940 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79593)

(assert (=> b!1234565 (= res!822726 (not (= from!3213 (bvsub (size!38940 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1234566 () Bool)

(declare-fun res!822730 () Bool)

(assert (=> b!1234566 (=> (not res!822730) (not e!700210))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1234566 (= res!822730 (contains!7239 acc!846 k!2925))))

(declare-fun b!1234567 () Bool)

(declare-fun res!822734 () Bool)

(assert (=> b!1234567 (=> res!822734 e!700212)))

(assert (=> b!1234567 (= res!822734 (not (noDuplicate!1836 lt!559907)))))

(declare-fun b!1234568 () Bool)

(declare-fun res!822731 () Bool)

(assert (=> b!1234568 (=> (not res!822731) (not e!700210))))

(assert (=> b!1234568 (= res!822731 (not (contains!7239 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234569 () Bool)

(declare-fun res!822732 () Bool)

(assert (=> b!1234569 (=> (not res!822732) (not e!700210))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234569 (= res!822732 (validKeyInArray!0 (select (arr!38404 a!3835) from!3213)))))

(declare-fun b!1234570 () Bool)

(declare-fun res!822728 () Bool)

(assert (=> b!1234570 (=> (not res!822728) (not e!700210))))

(declare-fun arrayNoDuplicates!0 (array!79593 (_ BitVec 32) List!27177) Bool)

(assert (=> b!1234570 (= res!822728 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1234571 () Bool)

(declare-fun res!822736 () Bool)

(assert (=> b!1234571 (=> res!822736 e!700212)))

(assert (=> b!1234571 (= res!822736 (contains!7239 lt!559907 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234572 () Bool)

(declare-fun res!822727 () Bool)

(assert (=> b!1234572 (=> (not res!822727) (not e!700210))))

(assert (=> b!1234572 (= res!822727 (not (contains!7239 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!822725 () Bool)

(assert (=> start!102748 (=> (not res!822725) (not e!700210))))

(assert (=> start!102748 (= res!822725 (and (bvslt (size!38940 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38940 a!3835))))))

(assert (=> start!102748 e!700210))

(declare-fun array_inv!29252 (array!79593) Bool)

(assert (=> start!102748 (array_inv!29252 a!3835)))

(assert (=> start!102748 true))

(declare-fun b!1234573 () Bool)

(assert (=> b!1234573 (= e!700210 (not e!700212))))

(declare-fun res!822733 () Bool)

(assert (=> b!1234573 (=> res!822733 e!700212)))

(assert (=> b!1234573 (= res!822733 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!511 (List!27177 List!27177) Bool)

(assert (=> b!1234573 (subseq!511 acc!846 lt!559907)))

(declare-datatypes ((Unit!40878 0))(
  ( (Unit!40879) )
))
(declare-fun lt!559906 () Unit!40878)

(declare-fun subseqTail!4 (List!27177 List!27177) Unit!40878)

(assert (=> b!1234573 (= lt!559906 (subseqTail!4 lt!559907 lt!559907))))

(assert (=> b!1234573 (subseq!511 lt!559907 lt!559907)))

(declare-fun lt!559908 () Unit!40878)

(declare-fun lemmaListSubSeqRefl!0 (List!27177) Unit!40878)

(assert (=> b!1234573 (= lt!559908 (lemmaListSubSeqRefl!0 lt!559907))))

(assert (=> b!1234573 (= lt!559907 (Cons!27173 (select (arr!38404 a!3835) from!3213) acc!846))))

(declare-fun b!1234574 () Bool)

(assert (=> b!1234574 (= e!700212 true)))

(declare-fun lt!559910 () Bool)

(assert (=> b!1234574 (= lt!559910 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!559907))))

(declare-fun lt!559909 () Unit!40878)

(declare-fun noDuplicateSubseq!58 (List!27177 List!27177) Unit!40878)

(assert (=> b!1234574 (= lt!559909 (noDuplicateSubseq!58 acc!846 lt!559907))))

(assert (= (and start!102748 res!822725) b!1234564))

(assert (= (and b!1234564 res!822735) b!1234568))

(assert (= (and b!1234568 res!822731) b!1234572))

(assert (= (and b!1234572 res!822727) b!1234570))

(assert (= (and b!1234570 res!822728) b!1234566))

(assert (= (and b!1234566 res!822730) b!1234565))

(assert (= (and b!1234565 res!822726) b!1234569))

(assert (= (and b!1234569 res!822732) b!1234573))

(assert (= (and b!1234573 (not res!822733)) b!1234567))

(assert (= (and b!1234567 (not res!822734)) b!1234563))

(assert (= (and b!1234563 (not res!822729)) b!1234571))

(assert (= (and b!1234571 (not res!822736)) b!1234574))

(declare-fun m!1138491 () Bool)

(assert (=> b!1234569 m!1138491))

(assert (=> b!1234569 m!1138491))

(declare-fun m!1138493 () Bool)

(assert (=> b!1234569 m!1138493))

(declare-fun m!1138495 () Bool)

(assert (=> b!1234563 m!1138495))

(declare-fun m!1138497 () Bool)

(assert (=> start!102748 m!1138497))

(declare-fun m!1138499 () Bool)

(assert (=> b!1234564 m!1138499))

(declare-fun m!1138501 () Bool)

(assert (=> b!1234567 m!1138501))

(declare-fun m!1138503 () Bool)

(assert (=> b!1234574 m!1138503))

(declare-fun m!1138505 () Bool)

(assert (=> b!1234574 m!1138505))

(declare-fun m!1138507 () Bool)

(assert (=> b!1234570 m!1138507))

(declare-fun m!1138509 () Bool)

(assert (=> b!1234571 m!1138509))

(declare-fun m!1138511 () Bool)

(assert (=> b!1234566 m!1138511))

(declare-fun m!1138513 () Bool)

(assert (=> b!1234568 m!1138513))

(declare-fun m!1138515 () Bool)

(assert (=> b!1234573 m!1138515))

(declare-fun m!1138517 () Bool)

(assert (=> b!1234573 m!1138517))

(declare-fun m!1138519 () Bool)

(assert (=> b!1234573 m!1138519))

(declare-fun m!1138521 () Bool)

(assert (=> b!1234573 m!1138521))

(assert (=> b!1234573 m!1138491))

(declare-fun m!1138523 () Bool)

(assert (=> b!1234572 m!1138523))

(push 1)

(assert (not b!1234573))

(assert (not b!1234566))

(assert (not b!1234570))

(assert (not b!1234574))

(assert (not b!1234563))

(assert (not b!1234569))

(assert (not b!1234571))

(assert (not b!1234572))

(assert (not b!1234567))

(assert (not start!102748))

(assert (not b!1234564))

(assert (not b!1234568))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

