; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7050 () Bool)

(assert start!7050)

(declare-fun res!26598 () Bool)

(declare-fun e!28858 () Bool)

(assert (=> start!7050 (=> (not res!26598) (not e!28858))))

(declare-datatypes ((array!3033 0))(
  ( (array!3034 (arr!1457 (Array (_ BitVec 32) (_ BitVec 64))) (size!1679 (_ BitVec 32))) )
))
(declare-fun a!4401 () array!3033)

(declare-fun i!1488 () (_ BitVec 32))

(declare-fun k!2989 () (_ BitVec 64))

(assert (=> start!7050 (= res!26598 (and (bvslt (size!1679 a!4401) #b01111111111111111111111111111111) (bvsge i!1488 #b00000000000000000000000000000000) (bvslt i!1488 (size!1679 a!4401)) (= (select (arr!1457 a!4401) i!1488) k!2989)))))

(assert (=> start!7050 e!28858))

(declare-fun array_inv!869 (array!3033) Bool)

(assert (=> start!7050 (array_inv!869 a!4401)))

(assert (=> start!7050 true))

(declare-fun b!45398 () Bool)

(declare-fun res!26597 () Bool)

(assert (=> b!45398 (=> (not res!26597) (not e!28858))))

(declare-fun arrayContainsKey!0 (array!3033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!45398 (= res!26597 (arrayContainsKey!0 a!4401 k!2989 i!1488))))

(declare-fun b!45399 () Bool)

(assert (=> b!45399 (= e!28858 (not true))))

(assert (=> b!45399 (arrayContainsKey!0 a!4401 k!2989 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1277 0))(
  ( (Unit!1278) )
))
(declare-fun lt!20134 () Unit!1277)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3033 (_ BitVec 64) (_ BitVec 32)) Unit!1277)

(assert (=> b!45399 (= lt!20134 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!4401 k!2989 i!1488))))

(assert (= (and start!7050 res!26598) b!45398))

(assert (= (and b!45398 res!26597) b!45399))

(declare-fun m!39919 () Bool)

(assert (=> start!7050 m!39919))

(declare-fun m!39921 () Bool)

(assert (=> start!7050 m!39921))

(declare-fun m!39923 () Bool)

(assert (=> b!45398 m!39923))

(declare-fun m!39925 () Bool)

(assert (=> b!45399 m!39925))

(declare-fun m!39927 () Bool)

(assert (=> b!45399 m!39927))

(push 1)

(assert (not b!45398))

(assert (not b!45399))

(assert (not start!7050))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

