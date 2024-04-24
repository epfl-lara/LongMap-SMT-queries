; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114040 () Bool)

(assert start!114040)

(declare-fun b!1351503 () Bool)

(declare-fun res!896178 () Bool)

(declare-fun e!768934 () Bool)

(assert (=> b!1351503 (=> (not res!896178) (not e!768934))))

(declare-datatypes ((List!31546 0))(
  ( (Nil!31543) (Cons!31542 (h!32760 (_ BitVec 64)) (t!46196 List!31546)) )
))
(declare-fun acc!759 () List!31546)

(declare-fun contains!9258 (List!31546 (_ BitVec 64)) Bool)

(assert (=> b!1351503 (= res!896178 (not (contains!9258 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!896179 () Bool)

(assert (=> start!114040 (=> (not res!896179) (not e!768934))))

(declare-datatypes ((array!92143 0))(
  ( (array!92144 (arr!44518 (Array (_ BitVec 32) (_ BitVec 64))) (size!45069 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92143)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114040 (= res!896179 (and (bvslt (size!45069 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45069 a!3742))))))

(assert (=> start!114040 e!768934))

(declare-fun array_inv!33799 (array!92143) Bool)

(assert (=> start!114040 (array_inv!33799 a!3742)))

(assert (=> start!114040 true))

(declare-fun b!1351502 () Bool)

(declare-fun res!896180 () Bool)

(assert (=> b!1351502 (=> (not res!896180) (not e!768934))))

(assert (=> b!1351502 (= res!896180 (not (contains!9258 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351501 () Bool)

(declare-fun res!896181 () Bool)

(assert (=> b!1351501 (=> (not res!896181) (not e!768934))))

(declare-fun noDuplicate!2089 (List!31546) Bool)

(assert (=> b!1351501 (= res!896181 (noDuplicate!2089 acc!759))))

(declare-fun b!1351504 () Bool)

(assert (=> b!1351504 (= e!768934 (bvsgt #b00000000000000000000000000000000 (size!45069 a!3742)))))

(assert (= (and start!114040 res!896179) b!1351501))

(assert (= (and b!1351501 res!896181) b!1351502))

(assert (= (and b!1351502 res!896180) b!1351503))

(assert (= (and b!1351503 res!896178) b!1351504))

(declare-fun m!1239055 () Bool)

(assert (=> b!1351503 m!1239055))

(declare-fun m!1239057 () Bool)

(assert (=> start!114040 m!1239057))

(declare-fun m!1239059 () Bool)

(assert (=> b!1351502 m!1239059))

(declare-fun m!1239061 () Bool)

(assert (=> b!1351501 m!1239061))

(check-sat (not b!1351501) (not start!114040) (not b!1351502) (not b!1351503))
(check-sat)
