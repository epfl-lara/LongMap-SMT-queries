; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114204 () Bool)

(assert start!114204)

(declare-fun b!1356696 () Bool)

(declare-fun res!901456 () Bool)

(declare-fun e!770155 () Bool)

(assert (=> b!1356696 (=> (not res!901456) (not e!770155))))

(declare-datatypes ((List!31682 0))(
  ( (Nil!31679) (Cons!31678 (h!32887 (_ BitVec 64)) (t!46340 List!31682)) )
))
(declare-fun acc!759 () List!31682)

(declare-fun noDuplicate!2248 (List!31682) Bool)

(assert (=> b!1356696 (= res!901456 (noDuplicate!2248 acc!759))))

(declare-fun b!1356697 () Bool)

(declare-fun res!901455 () Bool)

(assert (=> b!1356697 (=> (not res!901455) (not e!770155))))

(declare-datatypes ((array!92386 0))(
  ( (array!92387 (arr!44641 (Array (_ BitVec 32) (_ BitVec 64))) (size!45191 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92386)

(declare-fun arrayNoDuplicates!0 (array!92386 (_ BitVec 32) List!31682) Bool)

(assert (=> b!1356697 (= res!901455 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31679))))

(declare-fun b!1356698 () Bool)

(declare-fun res!901454 () Bool)

(assert (=> b!1356698 (=> (not res!901454) (not e!770155))))

(declare-fun contains!9391 (List!31682 (_ BitVec 64)) Bool)

(assert (=> b!1356698 (= res!901454 (not (contains!9391 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356699 () Bool)

(assert (=> b!1356699 (= e!770155 false)))

(declare-fun lt!599080 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1356699 (= lt!599080 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356700 () Bool)

(declare-fun res!901452 () Bool)

(assert (=> b!1356700 (=> (not res!901452) (not e!770155))))

(assert (=> b!1356700 (= res!901452 (not (contains!9391 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!901453 () Bool)

(assert (=> start!114204 (=> (not res!901453) (not e!770155))))

(assert (=> start!114204 (= res!901453 (and (bvslt (size!45191 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45191 a!3742))))))

(assert (=> start!114204 e!770155))

(declare-fun array_inv!33669 (array!92386) Bool)

(assert (=> start!114204 (array_inv!33669 a!3742)))

(assert (=> start!114204 true))

(assert (= (and start!114204 res!901453) b!1356696))

(assert (= (and b!1356696 res!901456) b!1356700))

(assert (= (and b!1356700 res!901452) b!1356698))

(assert (= (and b!1356698 res!901454) b!1356697))

(assert (= (and b!1356697 res!901455) b!1356699))

(declare-fun m!1242643 () Bool)

(assert (=> b!1356696 m!1242643))

(declare-fun m!1242645 () Bool)

(assert (=> b!1356698 m!1242645))

(declare-fun m!1242647 () Bool)

(assert (=> b!1356699 m!1242647))

(declare-fun m!1242649 () Bool)

(assert (=> start!114204 m!1242649))

(declare-fun m!1242651 () Bool)

(assert (=> b!1356700 m!1242651))

(declare-fun m!1242653 () Bool)

(assert (=> b!1356697 m!1242653))

(push 1)

(assert (not b!1356696))

(assert (not b!1356697))

(assert (not b!1356700))

(assert (not b!1356698))

(assert (not start!114204))

(assert (not b!1356699))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

