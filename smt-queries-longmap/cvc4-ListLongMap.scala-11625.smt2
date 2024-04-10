; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135634 () Bool)

(assert start!135634)

(declare-fun res!1075909 () Bool)

(declare-fun e!878179 () Bool)

(assert (=> start!135634 (=> (not res!1075909) (not e!878179))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135634 (= res!1075909 (validMask!0 mask!898))))

(assert (=> start!135634 e!878179))

(assert (=> start!135634 true))

(declare-datatypes ((array!105301 0))(
  ( (array!105302 (arr!50796 (Array (_ BitVec 32) (_ BitVec 64))) (size!51346 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105301)

(declare-fun array_inv!39523 (array!105301) Bool)

(assert (=> start!135634 (array_inv!39523 _keys!605)))

(declare-fun b!1574614 () Bool)

(declare-fun res!1075910 () Bool)

(assert (=> b!1574614 (=> (not res!1075910) (not e!878179))))

(assert (=> b!1574614 (= res!1075910 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51346 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574615 () Bool)

(declare-fun res!1075911 () Bool)

(assert (=> b!1574615 (=> (not res!1075911) (not e!878179))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574615 (= res!1075911 (validKeyInArray!0 k!761))))

(declare-fun b!1574616 () Bool)

(assert (=> b!1574616 (= e!878179 false)))

(declare-datatypes ((SeekEntryResult!13661 0))(
  ( (MissingZero!13661 (index!57042 (_ BitVec 32))) (Found!13661 (index!57043 (_ BitVec 32))) (Intermediate!13661 (undefined!14473 Bool) (index!57044 (_ BitVec 32)) (x!141987 (_ BitVec 32))) (Undefined!13661) (MissingVacant!13661 (index!57045 (_ BitVec 32))) )
))
(declare-fun lt!674875 () SeekEntryResult!13661)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105301 (_ BitVec 32)) SeekEntryResult!13661)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574616 (= lt!674875 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135634 res!1075909) b!1574614))

(assert (= (and b!1574614 res!1075910) b!1574615))

(assert (= (and b!1574615 res!1075911) b!1574616))

(declare-fun m!1447845 () Bool)

(assert (=> start!135634 m!1447845))

(declare-fun m!1447847 () Bool)

(assert (=> start!135634 m!1447847))

(declare-fun m!1447849 () Bool)

(assert (=> b!1574615 m!1447849))

(declare-fun m!1447851 () Bool)

(assert (=> b!1574616 m!1447851))

(assert (=> b!1574616 m!1447851))

(declare-fun m!1447853 () Bool)

(assert (=> b!1574616 m!1447853))

(push 1)

(assert (not b!1574616))

(assert (not start!135634))

(assert (not b!1574615))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

