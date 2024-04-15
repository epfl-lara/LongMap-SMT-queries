; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7048 () Bool)

(assert start!7048)

(declare-fun res!26572 () Bool)

(declare-fun e!28809 () Bool)

(assert (=> start!7048 (=> (not res!26572) (not e!28809))))

(declare-datatypes ((array!3007 0))(
  ( (array!3008 (arr!1444 (Array (_ BitVec 32) (_ BitVec 64))) (size!1667 (_ BitVec 32))) )
))
(declare-fun a!4401 () array!3007)

(declare-fun i!1488 () (_ BitVec 32))

(declare-fun k!2989 () (_ BitVec 64))

(assert (=> start!7048 (= res!26572 (and (bvslt (size!1667 a!4401) #b01111111111111111111111111111111) (bvsge i!1488 #b00000000000000000000000000000000) (bvslt i!1488 (size!1667 a!4401)) (= (select (arr!1444 a!4401) i!1488) k!2989)))))

(assert (=> start!7048 e!28809))

(declare-fun array_inv!867 (array!3007) Bool)

(assert (=> start!7048 (array_inv!867 a!4401)))

(assert (=> start!7048 true))

(declare-fun b!45326 () Bool)

(declare-fun res!26571 () Bool)

(assert (=> b!45326 (=> (not res!26571) (not e!28809))))

(declare-fun arrayContainsKey!0 (array!3007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!45326 (= res!26571 (arrayContainsKey!0 a!4401 k!2989 i!1488))))

(declare-fun b!45327 () Bool)

(assert (=> b!45327 (= e!28809 (not true))))

(assert (=> b!45327 (arrayContainsKey!0 a!4401 k!2989 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1282 0))(
  ( (Unit!1283) )
))
(declare-fun lt!20118 () Unit!1282)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3007 (_ BitVec 64) (_ BitVec 32)) Unit!1282)

(assert (=> b!45327 (= lt!20118 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!4401 k!2989 i!1488))))

(assert (= (and start!7048 res!26572) b!45326))

(assert (= (and b!45326 res!26571) b!45327))

(declare-fun m!39835 () Bool)

(assert (=> start!7048 m!39835))

(declare-fun m!39837 () Bool)

(assert (=> start!7048 m!39837))

(declare-fun m!39839 () Bool)

(assert (=> b!45326 m!39839))

(declare-fun m!39841 () Bool)

(assert (=> b!45327 m!39841))

(declare-fun m!39843 () Bool)

(assert (=> b!45327 m!39843))

(push 1)

(assert (not b!45326))

(assert (not start!7048))

(assert (not b!45327))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

