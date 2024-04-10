; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62502 () Bool)

(assert start!62502)

(declare-fun res!467569 () Bool)

(declare-fun e!397644 () Bool)

(assert (=> start!62502 (=> (not res!467569) (not e!397644))))

(declare-datatypes ((array!40181 0))(
  ( (array!40182 (arr!19247 (Array (_ BitVec 32) (_ BitVec 64))) (size!19632 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40181)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62502 (= res!467569 (and (bvslt (size!19632 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19632 a!3591))))))

(assert (=> start!62502 e!397644))

(assert (=> start!62502 true))

(declare-fun array_inv!15043 (array!40181) Bool)

(assert (=> start!62502 (array_inv!15043 a!3591)))

(declare-fun b!703756 () Bool)

(declare-fun res!467583 () Bool)

(assert (=> b!703756 (=> (not res!467583) (not e!397644))))

(declare-datatypes ((List!13288 0))(
  ( (Nil!13285) (Cons!13284 (h!14329 (_ BitVec 64)) (t!19570 List!13288)) )
))
(declare-fun newAcc!49 () List!13288)

(declare-fun contains!3865 (List!13288 (_ BitVec 64)) Bool)

(assert (=> b!703756 (= res!467583 (not (contains!3865 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703757 () Bool)

(declare-fun res!467572 () Bool)

(assert (=> b!703757 (=> (not res!467572) (not e!397644))))

(declare-fun acc!652 () List!13288)

(declare-fun k!2824 () (_ BitVec 64))

(assert (=> b!703757 (= res!467572 (not (contains!3865 acc!652 k!2824)))))

(declare-fun b!703758 () Bool)

(declare-fun res!467570 () Bool)

(assert (=> b!703758 (=> (not res!467570) (not e!397644))))

(assert (=> b!703758 (= res!467570 (contains!3865 newAcc!49 k!2824))))

(declare-fun b!703759 () Bool)

(declare-fun res!467573 () Bool)

(assert (=> b!703759 (=> (not res!467573) (not e!397644))))

(assert (=> b!703759 (= res!467573 (not (contains!3865 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703760 () Bool)

(declare-fun res!467580 () Bool)

(assert (=> b!703760 (=> (not res!467580) (not e!397644))))

(declare-fun arrayNoDuplicates!0 (array!40181 (_ BitVec 32) List!13288) Bool)

(assert (=> b!703760 (= res!467580 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!703761 () Bool)

(declare-fun res!467567 () Bool)

(assert (=> b!703761 (=> (not res!467567) (not e!397644))))

(declare-fun noDuplicate!1112 (List!13288) Bool)

(assert (=> b!703761 (= res!467567 (noDuplicate!1112 newAcc!49))))

(declare-fun b!703762 () Bool)

(declare-fun res!467579 () Bool)

(assert (=> b!703762 (=> (not res!467579) (not e!397644))))

(declare-fun subseq!310 (List!13288 List!13288) Bool)

(assert (=> b!703762 (= res!467579 (subseq!310 acc!652 newAcc!49))))

(declare-fun b!703763 () Bool)

(declare-fun res!467582 () Bool)

(assert (=> b!703763 (=> (not res!467582) (not e!397644))))

(declare-fun arrayContainsKey!0 (array!40181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!703763 (= res!467582 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!703764 () Bool)

(declare-fun res!467568 () Bool)

(assert (=> b!703764 (=> (not res!467568) (not e!397644))))

(assert (=> b!703764 (= res!467568 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!703765 () Bool)

(declare-fun res!467581 () Bool)

(assert (=> b!703765 (=> (not res!467581) (not e!397644))))

(assert (=> b!703765 (= res!467581 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!703766 () Bool)

(declare-fun res!467576 () Bool)

(assert (=> b!703766 (=> (not res!467576) (not e!397644))))

(assert (=> b!703766 (= res!467576 (noDuplicate!1112 acc!652))))

(declare-fun b!703767 () Bool)

(declare-fun res!467566 () Bool)

(assert (=> b!703767 (=> (not res!467566) (not e!397644))))

(assert (=> b!703767 (= res!467566 (not (contains!3865 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703768 () Bool)

(declare-fun res!467577 () Bool)

(assert (=> b!703768 (=> (not res!467577) (not e!397644))))

(assert (=> b!703768 (= res!467577 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19632 a!3591)))))

(declare-fun b!703769 () Bool)

(declare-fun res!467571 () Bool)

(assert (=> b!703769 (=> (not res!467571) (not e!397644))))

(assert (=> b!703769 (= res!467571 (not (contains!3865 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703770 () Bool)

(declare-fun res!467578 () Bool)

(assert (=> b!703770 (=> (not res!467578) (not e!397644))))

(declare-fun -!275 (List!13288 (_ BitVec 64)) List!13288)

(assert (=> b!703770 (= res!467578 (= (-!275 newAcc!49 k!2824) acc!652))))

(declare-fun b!703771 () Bool)

(declare-fun res!467574 () Bool)

(assert (=> b!703771 (=> (not res!467574) (not e!397644))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!703771 (= res!467574 (not (validKeyInArray!0 (select (arr!19247 a!3591) from!2969))))))

(declare-fun b!703772 () Bool)

(declare-fun res!467575 () Bool)

(assert (=> b!703772 (=> (not res!467575) (not e!397644))))

(assert (=> b!703772 (= res!467575 (validKeyInArray!0 k!2824))))

(declare-fun b!703773 () Bool)

(assert (=> b!703773 (= e!397644 false)))

(declare-fun lt!317805 () Bool)

(assert (=> b!703773 (= lt!317805 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(assert (= (and start!62502 res!467569) b!703766))

(assert (= (and b!703766 res!467576) b!703761))

(assert (= (and b!703761 res!467567) b!703767))

(assert (= (and b!703767 res!467566) b!703769))

(assert (= (and b!703769 res!467571) b!703763))

(assert (= (and b!703763 res!467582) b!703757))

(assert (= (and b!703757 res!467572) b!703772))

(assert (= (and b!703772 res!467575) b!703760))

(assert (= (and b!703760 res!467580) b!703762))

(assert (= (and b!703762 res!467579) b!703758))

(assert (= (and b!703758 res!467570) b!703770))

(assert (= (and b!703770 res!467578) b!703759))

(assert (= (and b!703759 res!467573) b!703756))

(assert (= (and b!703756 res!467583) b!703768))

(assert (= (and b!703768 res!467577) b!703771))

(assert (= (and b!703771 res!467574) b!703764))

(assert (= (and b!703764 res!467568) b!703765))

(assert (= (and b!703765 res!467581) b!703773))

(declare-fun m!662479 () Bool)

(assert (=> b!703760 m!662479))

(declare-fun m!662481 () Bool)

(assert (=> b!703770 m!662481))

(declare-fun m!662483 () Bool)

(assert (=> b!703763 m!662483))

(declare-fun m!662485 () Bool)

(assert (=> b!703759 m!662485))

(declare-fun m!662487 () Bool)

(assert (=> b!703769 m!662487))

(declare-fun m!662489 () Bool)

(assert (=> b!703767 m!662489))

(declare-fun m!662491 () Bool)

(assert (=> b!703758 m!662491))

(declare-fun m!662493 () Bool)

(assert (=> b!703771 m!662493))

(assert (=> b!703771 m!662493))

(declare-fun m!662495 () Bool)

(assert (=> b!703771 m!662495))

(declare-fun m!662497 () Bool)

(assert (=> b!703757 m!662497))

(declare-fun m!662499 () Bool)

(assert (=> b!703761 m!662499))

(declare-fun m!662501 () Bool)

(assert (=> b!703772 m!662501))

(declare-fun m!662503 () Bool)

(assert (=> b!703756 m!662503))

(declare-fun m!662505 () Bool)

(assert (=> b!703766 m!662505))

(declare-fun m!662507 () Bool)

(assert (=> b!703773 m!662507))

(declare-fun m!662509 () Bool)

(assert (=> b!703765 m!662509))

(declare-fun m!662511 () Bool)

(assert (=> start!62502 m!662511))

(declare-fun m!662513 () Bool)

(assert (=> b!703762 m!662513))

(push 1)

(assert (not b!703759))

(assert (not b!703771))

(assert (not b!703757))

(assert (not b!703767))

(assert (not b!703758))

(assert (not b!703772))

(assert (not b!703766))

(assert (not b!703770))

(assert (not b!703769))

(assert (not b!703773))

(assert (not start!62502))

(assert (not b!703765))

(assert (not b!703756))

(assert (not b!703762))

(assert (not b!703760))

(assert (not b!703761))

(assert (not b!703763))

(check-sat)

