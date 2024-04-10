; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135930 () Bool)

(assert start!135930)

(declare-fun res!1076611 () Bool)

(declare-fun e!878797 () Bool)

(assert (=> start!135930 (=> (not res!1076611) (not e!878797))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135930 (= res!1076611 (validMask!0 mask!898))))

(assert (=> start!135930 e!878797))

(assert (=> start!135930 true))

(declare-datatypes ((array!105435 0))(
  ( (array!105436 (arr!50854 (Array (_ BitVec 32) (_ BitVec 64))) (size!51404 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105435)

(declare-fun array_inv!39581 (array!105435) Bool)

(assert (=> start!135930 (array_inv!39581 _keys!605)))

(declare-fun b!1575622 () Bool)

(declare-fun res!1076612 () Bool)

(assert (=> b!1575622 (=> (not res!1076612) (not e!878797))))

(assert (=> b!1575622 (= res!1076612 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51404 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575623 () Bool)

(declare-fun res!1076613 () Bool)

(assert (=> b!1575623 (=> (not res!1076613) (not e!878797))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575623 (= res!1076613 (validKeyInArray!0 k!761))))

(declare-fun b!1575624 () Bool)

(assert (=> b!1575624 (= e!878797 false)))

(declare-datatypes ((SeekEntryResult!13719 0))(
  ( (MissingZero!13719 (index!57274 (_ BitVec 32))) (Found!13719 (index!57275 (_ BitVec 32))) (Intermediate!13719 (undefined!14531 Bool) (index!57276 (_ BitVec 32)) (x!142241 (_ BitVec 32))) (Undefined!13719) (MissingVacant!13719 (index!57277 (_ BitVec 32))) )
))
(declare-fun lt!675265 () SeekEntryResult!13719)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105435 (_ BitVec 32)) SeekEntryResult!13719)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575624 (= lt!675265 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135930 res!1076611) b!1575622))

(assert (= (and b!1575622 res!1076612) b!1575623))

(assert (= (and b!1575623 res!1076613) b!1575624))

(declare-fun m!1448599 () Bool)

(assert (=> start!135930 m!1448599))

(declare-fun m!1448601 () Bool)

(assert (=> start!135930 m!1448601))

(declare-fun m!1448603 () Bool)

(assert (=> b!1575623 m!1448603))

(declare-fun m!1448605 () Bool)

(assert (=> b!1575624 m!1448605))

(assert (=> b!1575624 m!1448605))

(declare-fun m!1448607 () Bool)

(assert (=> b!1575624 m!1448607))

(push 1)

(assert (not b!1575623))

(assert (not start!135930))

(assert (not b!1575624))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

