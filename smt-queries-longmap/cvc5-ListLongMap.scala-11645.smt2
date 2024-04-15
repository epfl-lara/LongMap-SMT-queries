; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135896 () Bool)

(assert start!135896)

(declare-fun res!1076500 () Bool)

(declare-fun e!878611 () Bool)

(assert (=> start!135896 (=> (not res!1076500) (not e!878611))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135896 (= res!1076500 (validMask!0 mask!898))))

(assert (=> start!135896 e!878611))

(assert (=> start!135896 true))

(declare-datatypes ((array!105369 0))(
  ( (array!105370 (arr!50821 (Array (_ BitVec 32) (_ BitVec 64))) (size!51373 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105369)

(declare-fun array_inv!39757 (array!105369) Bool)

(assert (=> start!135896 (array_inv!39757 _keys!605)))

(declare-fun b!1575327 () Bool)

(declare-fun res!1076502 () Bool)

(assert (=> b!1575327 (=> (not res!1076502) (not e!878611))))

(assert (=> b!1575327 (= res!1076502 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51373 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575328 () Bool)

(declare-fun res!1076501 () Bool)

(assert (=> b!1575328 (=> (not res!1076501) (not e!878611))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575328 (= res!1076501 (validKeyInArray!0 k!761))))

(declare-fun b!1575329 () Bool)

(assert (=> b!1575329 (= e!878611 false)))

(declare-datatypes ((SeekEntryResult!13721 0))(
  ( (MissingZero!13721 (index!57282 (_ BitVec 32))) (Found!13721 (index!57283 (_ BitVec 32))) (Intermediate!13721 (undefined!14533 Bool) (index!57284 (_ BitVec 32)) (x!142238 (_ BitVec 32))) (Undefined!13721) (MissingVacant!13721 (index!57285 (_ BitVec 32))) )
))
(declare-fun lt!674985 () SeekEntryResult!13721)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105369 (_ BitVec 32)) SeekEntryResult!13721)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575329 (= lt!674985 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135896 res!1076500) b!1575327))

(assert (= (and b!1575327 res!1076502) b!1575328))

(assert (= (and b!1575328 res!1076501) b!1575329))

(declare-fun m!1447727 () Bool)

(assert (=> start!135896 m!1447727))

(declare-fun m!1447729 () Bool)

(assert (=> start!135896 m!1447729))

(declare-fun m!1447731 () Bool)

(assert (=> b!1575328 m!1447731))

(declare-fun m!1447733 () Bool)

(assert (=> b!1575329 m!1447733))

(assert (=> b!1575329 m!1447733))

(declare-fun m!1447735 () Bool)

(assert (=> b!1575329 m!1447735))

(push 1)

(assert (not start!135896))

(assert (not b!1575329))

(assert (not b!1575328))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

