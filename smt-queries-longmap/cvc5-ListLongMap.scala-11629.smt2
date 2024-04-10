; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135684 () Bool)

(assert start!135684)

(declare-fun res!1076031 () Bool)

(declare-fun e!878284 () Bool)

(assert (=> start!135684 (=> (not res!1076031) (not e!878284))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135684 (= res!1076031 (validMask!0 mask!898))))

(assert (=> start!135684 e!878284))

(assert (=> start!135684 true))

(declare-datatypes ((array!105324 0))(
  ( (array!105325 (arr!50806 (Array (_ BitVec 32) (_ BitVec 64))) (size!51356 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105324)

(declare-fun array_inv!39533 (array!105324) Bool)

(assert (=> start!135684 (array_inv!39533 _keys!605)))

(declare-fun b!1574785 () Bool)

(declare-fun res!1076029 () Bool)

(assert (=> b!1574785 (=> (not res!1076029) (not e!878284))))

(assert (=> b!1574785 (= res!1076029 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51356 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574786 () Bool)

(declare-fun res!1076030 () Bool)

(assert (=> b!1574786 (=> (not res!1076030) (not e!878284))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574786 (= res!1076030 (validKeyInArray!0 k!761))))

(declare-fun b!1574787 () Bool)

(assert (=> b!1574787 (= e!878284 false)))

(declare-datatypes ((SeekEntryResult!13671 0))(
  ( (MissingZero!13671 (index!57082 (_ BitVec 32))) (Found!13671 (index!57083 (_ BitVec 32))) (Intermediate!13671 (undefined!14483 Bool) (index!57084 (_ BitVec 32)) (x!142035 (_ BitVec 32))) (Undefined!13671) (MissingVacant!13671 (index!57085 (_ BitVec 32))) )
))
(declare-fun lt!674941 () SeekEntryResult!13671)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105324 (_ BitVec 32)) SeekEntryResult!13671)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574787 (= lt!674941 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135684 res!1076031) b!1574785))

(assert (= (and b!1574785 res!1076029) b!1574786))

(assert (= (and b!1574786 res!1076030) b!1574787))

(declare-fun m!1447975 () Bool)

(assert (=> start!135684 m!1447975))

(declare-fun m!1447977 () Bool)

(assert (=> start!135684 m!1447977))

(declare-fun m!1447979 () Bool)

(assert (=> b!1574786 m!1447979))

(declare-fun m!1447981 () Bool)

(assert (=> b!1574787 m!1447981))

(assert (=> b!1574787 m!1447981))

(declare-fun m!1447983 () Bool)

(assert (=> b!1574787 m!1447983))

(push 1)

(assert (not b!1574787))

(assert (not b!1574786))

(assert (not start!135684))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

