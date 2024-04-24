; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114050 () Bool)

(assert start!114050)

(declare-fun res!896232 () Bool)

(declare-fun e!768964 () Bool)

(assert (=> start!114050 (=> (not res!896232) (not e!768964))))

(declare-datatypes ((array!92153 0))(
  ( (array!92154 (arr!44523 (Array (_ BitVec 32) (_ BitVec 64))) (size!45074 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92153)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114050 (= res!896232 (and (bvslt (size!45074 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45074 a!3742))))))

(assert (=> start!114050 e!768964))

(declare-fun array_inv!33804 (array!92153) Bool)

(assert (=> start!114050 (array_inv!33804 a!3742)))

(assert (=> start!114050 true))

(declare-fun b!1351553 () Bool)

(declare-fun res!896231 () Bool)

(assert (=> b!1351553 (=> (not res!896231) (not e!768964))))

(declare-datatypes ((List!31551 0))(
  ( (Nil!31548) (Cons!31547 (h!32765 (_ BitVec 64)) (t!46201 List!31551)) )
))
(declare-fun acc!759 () List!31551)

(declare-fun noDuplicate!2094 (List!31551) Bool)

(assert (=> b!1351553 (= res!896231 (noDuplicate!2094 acc!759))))

(declare-fun b!1351554 () Bool)

(declare-fun res!896230 () Bool)

(assert (=> b!1351554 (=> (not res!896230) (not e!768964))))

(declare-fun contains!9263 (List!31551 (_ BitVec 64)) Bool)

(assert (=> b!1351554 (= res!896230 (not (contains!9263 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351555 () Bool)

(assert (=> b!1351555 (= e!768964 false)))

(declare-fun lt!597429 () Bool)

(assert (=> b!1351555 (= lt!597429 (contains!9263 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!114050 res!896232) b!1351553))

(assert (= (and b!1351553 res!896231) b!1351554))

(assert (= (and b!1351554 res!896230) b!1351555))

(declare-fun m!1239095 () Bool)

(assert (=> start!114050 m!1239095))

(declare-fun m!1239097 () Bool)

(assert (=> b!1351553 m!1239097))

(declare-fun m!1239099 () Bool)

(assert (=> b!1351554 m!1239099))

(declare-fun m!1239101 () Bool)

(assert (=> b!1351555 m!1239101))

(push 1)

(assert (not start!114050))

(assert (not b!1351555))

(assert (not b!1351553))

(assert (not b!1351554))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

