; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7082 () Bool)

(assert start!7082)

(declare-fun res!26673 () Bool)

(declare-fun e!28942 () Bool)

(assert (=> start!7082 (=> (not res!26673) (not e!28942))))

(declare-datatypes ((array!3059 0))(
  ( (array!3060 (arr!1469 (Array (_ BitVec 32) (_ BitVec 64))) (size!1691 (_ BitVec 32))) )
))
(declare-fun a!4401 () array!3059)

(declare-fun i!1488 () (_ BitVec 32))

(declare-fun k!2989 () (_ BitVec 64))

(assert (=> start!7082 (= res!26673 (and (bvslt (size!1691 a!4401) #b01111111111111111111111111111111) (bvsge i!1488 #b00000000000000000000000000000000) (bvslt i!1488 (size!1691 a!4401)) (= (select (arr!1469 a!4401) i!1488) k!2989)))))

(assert (=> start!7082 e!28942))

(declare-fun array_inv!881 (array!3059) Bool)

(assert (=> start!7082 (array_inv!881 a!4401)))

(assert (=> start!7082 true))

(declare-fun b!45473 () Bool)

(declare-fun res!26672 () Bool)

(assert (=> b!45473 (=> (not res!26672) (not e!28942))))

(declare-fun arrayContainsKey!0 (array!3059 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!45473 (= res!26672 (arrayContainsKey!0 a!4401 k!2989 i!1488))))

(declare-fun b!45474 () Bool)

(assert (=> b!45474 (= e!28942 (not true))))

(assert (=> b!45474 (arrayContainsKey!0 a!4401 k!2989 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1295 0))(
  ( (Unit!1296) )
))
(declare-fun lt!20161 () Unit!1295)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3059 (_ BitVec 64) (_ BitVec 32)) Unit!1295)

(assert (=> b!45474 (= lt!20161 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!4401 k!2989 i!1488))))

(assert (= (and start!7082 res!26673) b!45473))

(assert (= (and b!45473 res!26672) b!45474))

(declare-fun m!40031 () Bool)

(assert (=> start!7082 m!40031))

(declare-fun m!40033 () Bool)

(assert (=> start!7082 m!40033))

(declare-fun m!40035 () Bool)

(assert (=> b!45473 m!40035))

(declare-fun m!40037 () Bool)

(assert (=> b!45474 m!40037))

(declare-fun m!40039 () Bool)

(assert (=> b!45474 m!40039))

(push 1)

(assert (not b!45473))

(assert (not b!45474))

