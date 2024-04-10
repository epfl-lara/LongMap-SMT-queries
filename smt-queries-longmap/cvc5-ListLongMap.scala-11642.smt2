; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135882 () Bool)

(assert start!135882)

(declare-fun res!1076500 () Bool)

(declare-fun e!878699 () Bool)

(assert (=> start!135882 (=> (not res!1076500) (not e!878699))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135882 (= res!1076500 (validMask!0 mask!898))))

(assert (=> start!135882 e!878699))

(assert (=> start!135882 true))

(declare-datatypes ((array!105414 0))(
  ( (array!105415 (arr!50845 (Array (_ BitVec 32) (_ BitVec 64))) (size!51395 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105414)

(declare-fun array_inv!39572 (array!105414) Bool)

(assert (=> start!135882 (array_inv!39572 _keys!605)))

(declare-fun b!1575460 () Bool)

(declare-fun res!1076501 () Bool)

(assert (=> b!1575460 (=> (not res!1076501) (not e!878699))))

(assert (=> b!1575460 (= res!1076501 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51395 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575461 () Bool)

(declare-fun res!1076502 () Bool)

(assert (=> b!1575461 (=> (not res!1076502) (not e!878699))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575461 (= res!1076502 (validKeyInArray!0 k!761))))

(declare-fun b!1575462 () Bool)

(assert (=> b!1575462 (= e!878699 false)))

(declare-datatypes ((SeekEntryResult!13710 0))(
  ( (MissingZero!13710 (index!57238 (_ BitVec 32))) (Found!13710 (index!57239 (_ BitVec 32))) (Intermediate!13710 (undefined!14522 Bool) (index!57240 (_ BitVec 32)) (x!142202 (_ BitVec 32))) (Undefined!13710) (MissingVacant!13710 (index!57241 (_ BitVec 32))) )
))
(declare-fun lt!675202 () SeekEntryResult!13710)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105414 (_ BitVec 32)) SeekEntryResult!13710)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575462 (= lt!675202 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135882 res!1076500) b!1575460))

(assert (= (and b!1575460 res!1076501) b!1575461))

(assert (= (and b!1575461 res!1076502) b!1575462))

(declare-fun m!1448479 () Bool)

(assert (=> start!135882 m!1448479))

(declare-fun m!1448481 () Bool)

(assert (=> start!135882 m!1448481))

(declare-fun m!1448483 () Bool)

(assert (=> b!1575461 m!1448483))

(declare-fun m!1448485 () Bool)

(assert (=> b!1575462 m!1448485))

(assert (=> b!1575462 m!1448485))

(declare-fun m!1448487 () Bool)

(assert (=> b!1575462 m!1448487))

(push 1)

(assert (not b!1575462))

(assert (not start!135882))

(assert (not b!1575461))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

