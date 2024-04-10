; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7052 () Bool)

(assert start!7052)

(declare-fun res!26604 () Bool)

(declare-fun e!28865 () Bool)

(assert (=> start!7052 (=> (not res!26604) (not e!28865))))

(declare-datatypes ((array!3035 0))(
  ( (array!3036 (arr!1458 (Array (_ BitVec 32) (_ BitVec 64))) (size!1680 (_ BitVec 32))) )
))
(declare-fun a!4401 () array!3035)

(declare-fun i!1488 () (_ BitVec 32))

(declare-fun k!2989 () (_ BitVec 64))

(assert (=> start!7052 (= res!26604 (and (bvslt (size!1680 a!4401) #b01111111111111111111111111111111) (bvsge i!1488 #b00000000000000000000000000000000) (bvslt i!1488 (size!1680 a!4401)) (= (select (arr!1458 a!4401) i!1488) k!2989)))))

(assert (=> start!7052 e!28865))

(declare-fun array_inv!870 (array!3035) Bool)

(assert (=> start!7052 (array_inv!870 a!4401)))

(assert (=> start!7052 true))

(declare-fun b!45404 () Bool)

(declare-fun res!26603 () Bool)

(assert (=> b!45404 (=> (not res!26603) (not e!28865))))

(declare-fun arrayContainsKey!0 (array!3035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!45404 (= res!26603 (arrayContainsKey!0 a!4401 k!2989 i!1488))))

(declare-fun b!45405 () Bool)

(assert (=> b!45405 (= e!28865 (not (bvslt #b00000000000000000000000000000000 (size!1680 a!4401))))))

(assert (=> b!45405 (arrayContainsKey!0 a!4401 k!2989 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1279 0))(
  ( (Unit!1280) )
))
(declare-fun lt!20137 () Unit!1279)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3035 (_ BitVec 64) (_ BitVec 32)) Unit!1279)

(assert (=> b!45405 (= lt!20137 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!4401 k!2989 i!1488))))

(assert (= (and start!7052 res!26604) b!45404))

(assert (= (and b!45404 res!26603) b!45405))

(declare-fun m!39929 () Bool)

(assert (=> start!7052 m!39929))

(declare-fun m!39931 () Bool)

(assert (=> start!7052 m!39931))

(declare-fun m!39933 () Bool)

(assert (=> b!45404 m!39933))

(declare-fun m!39935 () Bool)

(assert (=> b!45405 m!39935))

(declare-fun m!39937 () Bool)

(assert (=> b!45405 m!39937))

(push 1)

(assert (not b!45404))

(assert (not b!45405))

(assert (not start!7052))

(check-sat)

(pop 1)

(push 1)

(check-sat)

