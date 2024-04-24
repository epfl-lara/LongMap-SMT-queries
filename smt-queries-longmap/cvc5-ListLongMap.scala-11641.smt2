; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136304 () Bool)

(assert start!136304)

(declare-fun res!1077353 () Bool)

(declare-fun e!880202 () Bool)

(assert (=> start!136304 (=> (not res!1077353) (not e!880202))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136304 (= res!1077353 (validMask!0 mask!898))))

(assert (=> start!136304 e!880202))

(assert (=> start!136304 true))

(declare-datatypes ((array!105537 0))(
  ( (array!105538 (arr!50898 (Array (_ BitVec 32) (_ BitVec 64))) (size!51449 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105537)

(declare-fun array_inv!39853 (array!105537) Bool)

(assert (=> start!136304 (array_inv!39853 _keys!605)))

(declare-fun b!1577887 () Bool)

(declare-fun res!1077352 () Bool)

(assert (=> b!1577887 (=> (not res!1077352) (not e!880202))))

(assert (=> b!1577887 (= res!1077352 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51449 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1577888 () Bool)

(declare-fun res!1077351 () Bool)

(assert (=> b!1577888 (=> (not res!1077351) (not e!880202))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577888 (= res!1077351 (validKeyInArray!0 k!761))))

(declare-fun b!1577889 () Bool)

(assert (=> b!1577889 (= e!880202 false)))

(declare-datatypes ((SeekEntryResult!13657 0))(
  ( (MissingZero!13657 (index!57026 (_ BitVec 32))) (Found!13657 (index!57027 (_ BitVec 32))) (Intermediate!13657 (undefined!14469 Bool) (index!57028 (_ BitVec 32)) (x!142192 (_ BitVec 32))) (Undefined!13657) (MissingVacant!13657 (index!57029 (_ BitVec 32))) )
))
(declare-fun lt!676107 () SeekEntryResult!13657)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105537 (_ BitVec 32)) SeekEntryResult!13657)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577889 (= lt!676107 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!136304 res!1077353) b!1577887))

(assert (= (and b!1577887 res!1077352) b!1577888))

(assert (= (and b!1577888 res!1077351) b!1577889))

(declare-fun m!1450727 () Bool)

(assert (=> start!136304 m!1450727))

(declare-fun m!1450729 () Bool)

(assert (=> start!136304 m!1450729))

(declare-fun m!1450731 () Bool)

(assert (=> b!1577888 m!1450731))

(declare-fun m!1450733 () Bool)

(assert (=> b!1577889 m!1450733))

(assert (=> b!1577889 m!1450733))

(declare-fun m!1450735 () Bool)

(assert (=> b!1577889 m!1450735))

(push 1)

(assert (not start!136304))

(assert (not b!1577889))

(assert (not b!1577888))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

