; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135628 () Bool)

(assert start!135628)

(declare-fun res!1075882 () Bool)

(declare-fun e!878162 () Bool)

(assert (=> start!135628 (=> (not res!1075882) (not e!878162))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135628 (= res!1075882 (validMask!0 mask!898))))

(assert (=> start!135628 e!878162))

(assert (=> start!135628 true))

(declare-datatypes ((array!105295 0))(
  ( (array!105296 (arr!50793 (Array (_ BitVec 32) (_ BitVec 64))) (size!51343 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105295)

(declare-fun array_inv!39520 (array!105295) Bool)

(assert (=> start!135628 (array_inv!39520 _keys!605)))

(declare-fun b!1574587 () Bool)

(declare-fun res!1075883 () Bool)

(assert (=> b!1574587 (=> (not res!1075883) (not e!878162))))

(assert (=> b!1574587 (= res!1075883 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51343 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574588 () Bool)

(declare-fun res!1075884 () Bool)

(assert (=> b!1574588 (=> (not res!1075884) (not e!878162))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574588 (= res!1075884 (validKeyInArray!0 k!761))))

(declare-fun b!1574589 () Bool)

(assert (=> b!1574589 (= e!878162 false)))

(declare-datatypes ((SeekEntryResult!13658 0))(
  ( (MissingZero!13658 (index!57030 (_ BitVec 32))) (Found!13658 (index!57031 (_ BitVec 32))) (Intermediate!13658 (undefined!14470 Bool) (index!57032 (_ BitVec 32)) (x!141976 (_ BitVec 32))) (Undefined!13658) (MissingVacant!13658 (index!57033 (_ BitVec 32))) )
))
(declare-fun lt!674866 () SeekEntryResult!13658)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105295 (_ BitVec 32)) SeekEntryResult!13658)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574589 (= lt!674866 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135628 res!1075882) b!1574587))

(assert (= (and b!1574587 res!1075883) b!1574588))

(assert (= (and b!1574588 res!1075884) b!1574589))

(declare-fun m!1447815 () Bool)

(assert (=> start!135628 m!1447815))

(declare-fun m!1447817 () Bool)

(assert (=> start!135628 m!1447817))

(declare-fun m!1447819 () Bool)

(assert (=> b!1574588 m!1447819))

(declare-fun m!1447821 () Bool)

(assert (=> b!1574589 m!1447821))

(assert (=> b!1574589 m!1447821))

(declare-fun m!1447823 () Bool)

(assert (=> b!1574589 m!1447823))

(push 1)

(assert (not b!1574589))

(assert (not start!135628))

(assert (not b!1574588))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

