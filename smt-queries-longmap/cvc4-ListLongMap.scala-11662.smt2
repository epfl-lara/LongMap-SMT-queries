; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136382 () Bool)

(assert start!136382)

(declare-fun res!1077514 () Bool)

(declare-fun e!879745 () Bool)

(assert (=> start!136382 (=> (not res!1077514) (not e!879745))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136382 (= res!1077514 (validMask!0 mask!910))))

(assert (=> start!136382 e!879745))

(assert (=> start!136382 true))

(declare-datatypes ((array!105573 0))(
  ( (array!105574 (arr!50907 (Array (_ BitVec 32) (_ BitVec 64))) (size!51457 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105573)

(declare-fun array_inv!39634 (array!105573) Bool)

(assert (=> start!136382 (array_inv!39634 _keys!610)))

(declare-fun b!1577251 () Bool)

(declare-fun res!1077516 () Bool)

(assert (=> b!1577251 (=> (not res!1077516) (not e!879745))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1577251 (= res!1077516 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51457 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577252 () Bool)

(declare-fun res!1077515 () Bool)

(assert (=> b!1577252 (=> (not res!1077515) (not e!879745))))

(declare-fun k!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577252 (= res!1077515 (validKeyInArray!0 k!768))))

(declare-fun b!1577253 () Bool)

(assert (=> b!1577253 (= e!879745 (bvsge ee!12 (size!51457 _keys!610)))))

(assert (= (and start!136382 res!1077514) b!1577251))

(assert (= (and b!1577251 res!1077516) b!1577252))

(assert (= (and b!1577252 res!1077515) b!1577253))

(declare-fun m!1449553 () Bool)

(assert (=> start!136382 m!1449553))

(declare-fun m!1449555 () Bool)

(assert (=> start!136382 m!1449555))

(declare-fun m!1449557 () Bool)

(assert (=> b!1577252 m!1449557))

(push 1)

(assert (not b!1577252))

(assert (not start!136382))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

