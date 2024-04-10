; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7046 () Bool)

(assert start!7046)

(declare-fun res!26586 () Bool)

(declare-fun e!28846 () Bool)

(assert (=> start!7046 (=> (not res!26586) (not e!28846))))

(declare-datatypes ((array!3029 0))(
  ( (array!3030 (arr!1455 (Array (_ BitVec 32) (_ BitVec 64))) (size!1677 (_ BitVec 32))) )
))
(declare-fun a!4401 () array!3029)

(declare-fun i!1488 () (_ BitVec 32))

(declare-fun k!2989 () (_ BitVec 64))

(assert (=> start!7046 (= res!26586 (and (bvslt (size!1677 a!4401) #b01111111111111111111111111111111) (bvsge i!1488 #b00000000000000000000000000000000) (bvslt i!1488 (size!1677 a!4401)) (= (select (arr!1455 a!4401) i!1488) k!2989)))))

(assert (=> start!7046 e!28846))

(declare-fun array_inv!867 (array!3029) Bool)

(assert (=> start!7046 (array_inv!867 a!4401)))

(assert (=> start!7046 true))

(declare-fun b!45386 () Bool)

(declare-fun res!26585 () Bool)

(assert (=> b!45386 (=> (not res!26585) (not e!28846))))

(declare-fun arrayContainsKey!0 (array!3029 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!45386 (= res!26585 (arrayContainsKey!0 a!4401 k!2989 i!1488))))

(declare-fun b!45387 () Bool)

(assert (=> b!45387 (= e!28846 (not true))))

(assert (=> b!45387 (arrayContainsKey!0 a!4401 k!2989 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1273 0))(
  ( (Unit!1274) )
))
(declare-fun lt!20128 () Unit!1273)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3029 (_ BitVec 64) (_ BitVec 32)) Unit!1273)

(assert (=> b!45387 (= lt!20128 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!4401 k!2989 i!1488))))

(assert (= (and start!7046 res!26586) b!45386))

(assert (= (and b!45386 res!26585) b!45387))

(declare-fun m!39899 () Bool)

(assert (=> start!7046 m!39899))

(declare-fun m!39901 () Bool)

(assert (=> start!7046 m!39901))

(declare-fun m!39903 () Bool)

(assert (=> b!45386 m!39903))

(declare-fun m!39905 () Bool)

(assert (=> b!45387 m!39905))

(declare-fun m!39907 () Bool)

(assert (=> b!45387 m!39907))

(push 1)

(assert (not b!45386))

(assert (not b!45387))

(assert (not start!7046))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

