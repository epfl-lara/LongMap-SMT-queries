; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113886 () Bool)

(assert start!113886)

(declare-fun res!896011 () Bool)

(declare-fun e!768310 () Bool)

(assert (=> start!113886 (=> (not res!896011) (not e!768310))))

(declare-datatypes ((array!92068 0))(
  ( (array!92069 (arr!44482 (Array (_ BitVec 32) (_ BitVec 64))) (size!45032 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92068)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113886 (= res!896011 (and (bvslt (size!45032 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45032 a!3742))))))

(assert (=> start!113886 e!768310))

(declare-fun array_inv!33510 (array!92068) Bool)

(assert (=> start!113886 (array_inv!33510 a!3742)))

(assert (=> start!113886 true))

(declare-fun b!1350553 () Bool)

(assert (=> b!1350553 (= e!768310 false)))

(declare-fun lt!596992 () Bool)

(declare-datatypes ((List!31523 0))(
  ( (Nil!31520) (Cons!31519 (h!32728 (_ BitVec 64)) (t!46181 List!31523)) )
))
(declare-fun arrayNoDuplicates!0 (array!92068 (_ BitVec 32) List!31523) Bool)

(assert (=> b!1350553 (= lt!596992 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31520))))

(declare-fun b!1350552 () Bool)

(declare-fun res!896010 () Bool)

(assert (=> b!1350552 (=> (not res!896010) (not e!768310))))

(declare-fun acc!759 () List!31523)

(declare-fun contains!9232 (List!31523 (_ BitVec 64)) Bool)

(assert (=> b!1350552 (= res!896010 (not (contains!9232 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350550 () Bool)

(declare-fun res!896008 () Bool)

(assert (=> b!1350550 (=> (not res!896008) (not e!768310))))

(declare-fun noDuplicate!2089 (List!31523) Bool)

(assert (=> b!1350550 (= res!896008 (noDuplicate!2089 acc!759))))

(declare-fun b!1350551 () Bool)

(declare-fun res!896009 () Bool)

(assert (=> b!1350551 (=> (not res!896009) (not e!768310))))

(assert (=> b!1350551 (= res!896009 (not (contains!9232 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!113886 res!896011) b!1350550))

(assert (= (and b!1350550 res!896008) b!1350551))

(assert (= (and b!1350551 res!896009) b!1350552))

(assert (= (and b!1350552 res!896010) b!1350553))

(declare-fun m!1237767 () Bool)

(assert (=> b!1350551 m!1237767))

(declare-fun m!1237769 () Bool)

(assert (=> b!1350550 m!1237769))

(declare-fun m!1237771 () Bool)

(assert (=> b!1350553 m!1237771))

(declare-fun m!1237773 () Bool)

(assert (=> b!1350552 m!1237773))

(declare-fun m!1237775 () Bool)

(assert (=> start!113886 m!1237775))

(push 1)

(assert (not b!1350552))

(assert (not b!1350553))

(assert (not b!1350551))

(assert (not b!1350550))

(assert (not start!113886))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

