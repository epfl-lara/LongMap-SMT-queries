; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7058 () Bool)

(assert start!7058)

(declare-fun res!26622 () Bool)

(declare-fun e!28882 () Bool)

(assert (=> start!7058 (=> (not res!26622) (not e!28882))))

(declare-datatypes ((array!3041 0))(
  ( (array!3042 (arr!1461 (Array (_ BitVec 32) (_ BitVec 64))) (size!1683 (_ BitVec 32))) )
))
(declare-fun a!4401 () array!3041)

(declare-fun i!1488 () (_ BitVec 32))

(declare-fun k!2989 () (_ BitVec 64))

(assert (=> start!7058 (= res!26622 (and (bvslt (size!1683 a!4401) #b01111111111111111111111111111111) (bvsge i!1488 #b00000000000000000000000000000000) (bvslt i!1488 (size!1683 a!4401)) (= (select (arr!1461 a!4401) i!1488) k!2989)))))

(assert (=> start!7058 e!28882))

(declare-fun array_inv!873 (array!3041) Bool)

(assert (=> start!7058 (array_inv!873 a!4401)))

(assert (=> start!7058 true))

(declare-fun b!45422 () Bool)

(declare-fun res!26621 () Bool)

(assert (=> b!45422 (=> (not res!26621) (not e!28882))))

(declare-fun arrayContainsKey!0 (array!3041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!45422 (= res!26621 (arrayContainsKey!0 a!4401 k!2989 i!1488))))

(declare-fun b!45423 () Bool)

(assert (=> b!45423 (= e!28882 (not true))))

(assert (=> b!45423 (arrayContainsKey!0 a!4401 k!2989 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1285 0))(
  ( (Unit!1286) )
))
(declare-fun lt!20146 () Unit!1285)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3041 (_ BitVec 64) (_ BitVec 32)) Unit!1285)

(assert (=> b!45423 (= lt!20146 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!4401 k!2989 i!1488))))

(assert (= (and start!7058 res!26622) b!45422))

(assert (= (and b!45422 res!26621) b!45423))

(declare-fun m!39959 () Bool)

(assert (=> start!7058 m!39959))

(declare-fun m!39961 () Bool)

(assert (=> start!7058 m!39961))

(declare-fun m!39963 () Bool)

(assert (=> b!45422 m!39963))

(declare-fun m!39965 () Bool)

(assert (=> b!45423 m!39965))

(declare-fun m!39967 () Bool)

(assert (=> b!45423 m!39967))

(push 1)

(assert (not b!45422))

(assert (not b!45423))

(assert (not start!7058))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

