; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135690 () Bool)

(assert start!135690)

(declare-fun res!1076056 () Bool)

(declare-fun e!878303 () Bool)

(assert (=> start!135690 (=> (not res!1076056) (not e!878303))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135690 (= res!1076056 (validMask!0 mask!898))))

(assert (=> start!135690 e!878303))

(assert (=> start!135690 true))

(declare-datatypes ((array!105330 0))(
  ( (array!105331 (arr!50809 (Array (_ BitVec 32) (_ BitVec 64))) (size!51359 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105330)

(declare-fun array_inv!39536 (array!105330) Bool)

(assert (=> start!135690 (array_inv!39536 _keys!605)))

(declare-fun b!1574812 () Bool)

(declare-fun res!1076058 () Bool)

(assert (=> b!1574812 (=> (not res!1076058) (not e!878303))))

(assert (=> b!1574812 (= res!1076058 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51359 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574813 () Bool)

(declare-fun res!1076057 () Bool)

(assert (=> b!1574813 (=> (not res!1076057) (not e!878303))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574813 (= res!1076057 (validKeyInArray!0 k!761))))

(declare-fun b!1574814 () Bool)

(assert (=> b!1574814 (= e!878303 false)))

(declare-datatypes ((SeekEntryResult!13674 0))(
  ( (MissingZero!13674 (index!57094 (_ BitVec 32))) (Found!13674 (index!57095 (_ BitVec 32))) (Intermediate!13674 (undefined!14486 Bool) (index!57096 (_ BitVec 32)) (x!142046 (_ BitVec 32))) (Undefined!13674) (MissingVacant!13674 (index!57097 (_ BitVec 32))) )
))
(declare-fun lt!674950 () SeekEntryResult!13674)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105330 (_ BitVec 32)) SeekEntryResult!13674)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574814 (= lt!674950 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135690 res!1076056) b!1574812))

(assert (= (and b!1574812 res!1076058) b!1574813))

(assert (= (and b!1574813 res!1076057) b!1574814))

(declare-fun m!1448005 () Bool)

(assert (=> start!135690 m!1448005))

(declare-fun m!1448007 () Bool)

(assert (=> start!135690 m!1448007))

(declare-fun m!1448009 () Bool)

(assert (=> b!1574813 m!1448009))

(declare-fun m!1448011 () Bool)

(assert (=> b!1574814 m!1448011))

(assert (=> b!1574814 m!1448011))

(declare-fun m!1448013 () Bool)

(assert (=> b!1574814 m!1448013))

(push 1)

(assert (not start!135690))

(assert (not b!1574814))

(assert (not b!1574813))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

