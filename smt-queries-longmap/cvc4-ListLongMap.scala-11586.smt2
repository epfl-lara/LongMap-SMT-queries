; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135072 () Bool)

(assert start!135072)

(declare-fun res!1074487 () Bool)

(declare-fun e!876919 () Bool)

(assert (=> start!135072 (=> (not res!1074487) (not e!876919))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135072 (= res!1074487 (validMask!0 mask!889))))

(assert (=> start!135072 e!876919))

(assert (=> start!135072 true))

(declare-datatypes ((array!105034 0))(
  ( (array!105035 (arr!50679 (Array (_ BitVec 32) (_ BitVec 64))) (size!51229 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105034)

(declare-fun array_inv!39406 (array!105034) Bool)

(assert (=> start!135072 (array_inv!39406 _keys!600)))

(declare-fun b!1572625 () Bool)

(declare-fun res!1074488 () Bool)

(assert (=> b!1572625 (=> (not res!1074488) (not e!876919))))

(assert (=> b!1572625 (= res!1074488 (= (size!51229 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572626 () Bool)

(declare-fun res!1074489 () Bool)

(assert (=> b!1572626 (=> (not res!1074489) (not e!876919))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572626 (= res!1074489 (validKeyInArray!0 k!754))))

(declare-fun b!1572627 () Bool)

(assert (=> b!1572627 (= e!876919 false)))

(declare-datatypes ((SeekEntryResult!13592 0))(
  ( (MissingZero!13592 (index!56766 (_ BitVec 32))) (Found!13592 (index!56767 (_ BitVec 32))) (Intermediate!13592 (undefined!14404 Bool) (index!56768 (_ BitVec 32)) (x!141546 (_ BitVec 32))) (Undefined!13592) (MissingVacant!13592 (index!56769 (_ BitVec 32))) )
))
(declare-fun lt!674065 () SeekEntryResult!13592)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105034 (_ BitVec 32)) SeekEntryResult!13592)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572627 (= lt!674065 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135072 res!1074487) b!1572625))

(assert (= (and b!1572625 res!1074488) b!1572626))

(assert (= (and b!1572626 res!1074489) b!1572627))

(declare-fun m!1446291 () Bool)

(assert (=> start!135072 m!1446291))

(declare-fun m!1446293 () Bool)

(assert (=> start!135072 m!1446293))

(declare-fun m!1446295 () Bool)

(assert (=> b!1572626 m!1446295))

(declare-fun m!1446297 () Bool)

(assert (=> b!1572627 m!1446297))

(assert (=> b!1572627 m!1446297))

(declare-fun m!1446299 () Bool)

(assert (=> b!1572627 m!1446299))

(push 1)

(assert (not start!135072))

(assert (not b!1572627))

(assert (not b!1572626))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

