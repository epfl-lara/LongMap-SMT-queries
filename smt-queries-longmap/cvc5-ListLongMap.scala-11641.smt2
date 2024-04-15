; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135842 () Bool)

(assert start!135842)

(declare-fun res!1076363 () Bool)

(declare-fun e!878494 () Bool)

(assert (=> start!135842 (=> (not res!1076363) (not e!878494))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135842 (= res!1076363 (validMask!0 mask!898))))

(assert (=> start!135842 e!878494))

(assert (=> start!135842 true))

(declare-datatypes ((array!105342 0))(
  ( (array!105343 (arr!50809 (Array (_ BitVec 32) (_ BitVec 64))) (size!51361 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105342)

(declare-fun array_inv!39745 (array!105342) Bool)

(assert (=> start!135842 (array_inv!39745 _keys!605)))

(declare-fun b!1575138 () Bool)

(declare-fun res!1076362 () Bool)

(assert (=> b!1575138 (=> (not res!1076362) (not e!878494))))

(assert (=> b!1575138 (= res!1076362 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51361 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575139 () Bool)

(declare-fun res!1076364 () Bool)

(assert (=> b!1575139 (=> (not res!1076364) (not e!878494))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575139 (= res!1076364 (validKeyInArray!0 k!761))))

(declare-fun b!1575140 () Bool)

(assert (=> b!1575140 (= e!878494 false)))

(declare-datatypes ((SeekEntryResult!13709 0))(
  ( (MissingZero!13709 (index!57234 (_ BitVec 32))) (Found!13709 (index!57235 (_ BitVec 32))) (Intermediate!13709 (undefined!14521 Bool) (index!57236 (_ BitVec 32)) (x!142188 (_ BitVec 32))) (Undefined!13709) (MissingVacant!13709 (index!57237 (_ BitVec 32))) )
))
(declare-fun lt!674913 () SeekEntryResult!13709)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105342 (_ BitVec 32)) SeekEntryResult!13709)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575140 (= lt!674913 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135842 res!1076363) b!1575138))

(assert (= (and b!1575138 res!1076362) b!1575139))

(assert (= (and b!1575139 res!1076364) b!1575140))

(declare-fun m!1447577 () Bool)

(assert (=> start!135842 m!1447577))

(declare-fun m!1447579 () Bool)

(assert (=> start!135842 m!1447579))

(declare-fun m!1447581 () Bool)

(assert (=> b!1575139 m!1447581))

(declare-fun m!1447583 () Bool)

(assert (=> b!1575140 m!1447583))

(assert (=> b!1575140 m!1447583))

(declare-fun m!1447585 () Bool)

(assert (=> b!1575140 m!1447585))

(push 1)

(assert (not start!135842))

(assert (not b!1575139))

(assert (not b!1575140))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

