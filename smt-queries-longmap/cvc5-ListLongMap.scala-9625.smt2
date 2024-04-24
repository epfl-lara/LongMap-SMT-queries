; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114116 () Bool)

(assert start!114116)

(declare-fun b!1351888 () Bool)

(declare-fun e!769170 () Bool)

(assert (=> b!1351888 (= e!769170 false)))

(declare-fun lt!597477 () Bool)

(declare-datatypes ((array!92189 0))(
  ( (array!92190 (arr!44538 (Array (_ BitVec 32) (_ BitVec 64))) (size!45089 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92189)

(declare-datatypes ((List!31566 0))(
  ( (Nil!31563) (Cons!31562 (h!32780 (_ BitVec 64)) (t!46216 List!31566)) )
))
(declare-fun arrayNoDuplicates!0 (array!92189 (_ BitVec 32) List!31566) Bool)

(assert (=> b!1351888 (= lt!597477 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31563))))

(declare-fun b!1351886 () Bool)

(declare-fun res!896563 () Bool)

(assert (=> b!1351886 (=> (not res!896563) (not e!769170))))

(declare-fun acc!759 () List!31566)

(declare-fun contains!9278 (List!31566 (_ BitVec 64)) Bool)

(assert (=> b!1351886 (= res!896563 (not (contains!9278 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!896564 () Bool)

(assert (=> start!114116 (=> (not res!896564) (not e!769170))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114116 (= res!896564 (and (bvslt (size!45089 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45089 a!3742))))))

(assert (=> start!114116 e!769170))

(declare-fun array_inv!33819 (array!92189) Bool)

(assert (=> start!114116 (array_inv!33819 a!3742)))

(assert (=> start!114116 true))

(declare-fun b!1351887 () Bool)

(declare-fun res!896565 () Bool)

(assert (=> b!1351887 (=> (not res!896565) (not e!769170))))

(assert (=> b!1351887 (= res!896565 (not (contains!9278 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351885 () Bool)

(declare-fun res!896562 () Bool)

(assert (=> b!1351885 (=> (not res!896562) (not e!769170))))

(declare-fun noDuplicate!2109 (List!31566) Bool)

(assert (=> b!1351885 (= res!896562 (noDuplicate!2109 acc!759))))

(assert (= (and start!114116 res!896564) b!1351885))

(assert (= (and b!1351885 res!896562) b!1351886))

(assert (= (and b!1351886 res!896563) b!1351887))

(assert (= (and b!1351887 res!896565) b!1351888))

(declare-fun m!1239393 () Bool)

(assert (=> b!1351887 m!1239393))

(declare-fun m!1239395 () Bool)

(assert (=> b!1351886 m!1239395))

(declare-fun m!1239397 () Bool)

(assert (=> b!1351885 m!1239397))

(declare-fun m!1239399 () Bool)

(assert (=> b!1351888 m!1239399))

(declare-fun m!1239401 () Bool)

(assert (=> start!114116 m!1239401))

(push 1)

(assert (not b!1351887))

(assert (not b!1351886))

(assert (not start!114116))

(assert (not b!1351888))

(assert (not b!1351885))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

