; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136064 () Bool)

(assert start!136064)

(declare-fun res!1076798 () Bool)

(declare-fun e!879706 () Bool)

(assert (=> start!136064 (=> (not res!1076798) (not e!879706))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136064 (= res!1076798 (validMask!0 mask!898))))

(assert (=> start!136064 e!879706))

(assert (=> start!136064 true))

(declare-datatypes ((array!105432 0))(
  ( (array!105433 (arr!50853 (Array (_ BitVec 32) (_ BitVec 64))) (size!51404 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105432)

(declare-fun array_inv!39808 (array!105432) Bool)

(assert (=> start!136064 (array_inv!39808 _keys!605)))

(declare-fun b!1577077 () Bool)

(declare-fun res!1076797 () Bool)

(assert (=> b!1577077 (=> (not res!1076797) (not e!879706))))

(assert (=> b!1577077 (= res!1076797 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51404 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1577078 () Bool)

(declare-fun res!1076796 () Bool)

(assert (=> b!1577078 (=> (not res!1076796) (not e!879706))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577078 (= res!1076796 (validKeyInArray!0 k!761))))

(declare-fun b!1577079 () Bool)

(assert (=> b!1577079 (= e!879706 false)))

(declare-datatypes ((SeekEntryResult!13612 0))(
  ( (MissingZero!13612 (index!56846 (_ BitVec 32))) (Found!13612 (index!56847 (_ BitVec 32))) (Intermediate!13612 (undefined!14424 Bool) (index!56848 (_ BitVec 32)) (x!141997 (_ BitVec 32))) (Undefined!13612) (MissingVacant!13612 (index!56849 (_ BitVec 32))) )
))
(declare-fun lt!675792 () SeekEntryResult!13612)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105432 (_ BitVec 32)) SeekEntryResult!13612)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577079 (= lt!675792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!136064 res!1076798) b!1577077))

(assert (= (and b!1577077 res!1076797) b!1577078))

(assert (= (and b!1577078 res!1076796) b!1577079))

(declare-fun m!1450133 () Bool)

(assert (=> start!136064 m!1450133))

(declare-fun m!1450135 () Bool)

(assert (=> start!136064 m!1450135))

(declare-fun m!1450137 () Bool)

(assert (=> b!1577078 m!1450137))

(declare-fun m!1450139 () Bool)

(assert (=> b!1577079 m!1450139))

(assert (=> b!1577079 m!1450139))

(declare-fun m!1450141 () Bool)

(assert (=> b!1577079 m!1450141))

(push 1)

(assert (not b!1577079))

(assert (not start!136064))

(assert (not b!1577078))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

