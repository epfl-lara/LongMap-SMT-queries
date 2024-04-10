; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135868 () Bool)

(assert start!135868)

(declare-fun res!1076437 () Bool)

(declare-fun e!878656 () Bool)

(assert (=> start!135868 (=> (not res!1076437) (not e!878656))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135868 (= res!1076437 (validMask!0 mask!898))))

(assert (=> start!135868 e!878656))

(assert (=> start!135868 true))

(declare-datatypes ((array!105400 0))(
  ( (array!105401 (arr!50838 (Array (_ BitVec 32) (_ BitVec 64))) (size!51388 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105400)

(declare-fun array_inv!39565 (array!105400) Bool)

(assert (=> start!135868 (array_inv!39565 _keys!605)))

(declare-fun b!1575397 () Bool)

(declare-fun res!1076439 () Bool)

(assert (=> b!1575397 (=> (not res!1076439) (not e!878656))))

(assert (=> b!1575397 (= res!1076439 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51388 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575398 () Bool)

(declare-fun res!1076438 () Bool)

(assert (=> b!1575398 (=> (not res!1076438) (not e!878656))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575398 (= res!1076438 (validKeyInArray!0 k!761))))

(declare-fun b!1575399 () Bool)

(assert (=> b!1575399 (= e!878656 false)))

(declare-datatypes ((SeekEntryResult!13703 0))(
  ( (MissingZero!13703 (index!57210 (_ BitVec 32))) (Found!13703 (index!57211 (_ BitVec 32))) (Intermediate!13703 (undefined!14515 Bool) (index!57212 (_ BitVec 32)) (x!142171 (_ BitVec 32))) (Undefined!13703) (MissingVacant!13703 (index!57213 (_ BitVec 32))) )
))
(declare-fun lt!675181 () SeekEntryResult!13703)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105400 (_ BitVec 32)) SeekEntryResult!13703)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575399 (= lt!675181 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135868 res!1076437) b!1575397))

(assert (= (and b!1575397 res!1076439) b!1575398))

(assert (= (and b!1575398 res!1076438) b!1575399))

(declare-fun m!1448409 () Bool)

(assert (=> start!135868 m!1448409))

(declare-fun m!1448411 () Bool)

(assert (=> start!135868 m!1448411))

(declare-fun m!1448413 () Bool)

(assert (=> b!1575398 m!1448413))

(declare-fun m!1448415 () Bool)

(assert (=> b!1575399 m!1448415))

(assert (=> b!1575399 m!1448415))

(declare-fun m!1448417 () Bool)

(assert (=> b!1575399 m!1448417))

(push 1)

(assert (not b!1575399))

(assert (not b!1575398))

(assert (not start!135868))

(check-sat)

(pop 1)

