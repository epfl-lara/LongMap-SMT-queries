; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135774 () Bool)

(assert start!135774)

(declare-fun res!1076225 () Bool)

(declare-fun e!878465 () Bool)

(assert (=> start!135774 (=> (not res!1076225) (not e!878465))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135774 (= res!1076225 (validMask!0 mask!898))))

(assert (=> start!135774 e!878465))

(assert (=> start!135774 true))

(declare-datatypes ((array!105360 0))(
  ( (array!105361 (arr!50821 (Array (_ BitVec 32) (_ BitVec 64))) (size!51371 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105360)

(declare-fun array_inv!39548 (array!105360) Bool)

(assert (=> start!135774 (array_inv!39548 _keys!605)))

(declare-fun b!1575082 () Bool)

(declare-fun res!1076226 () Bool)

(assert (=> b!1575082 (=> (not res!1076226) (not e!878465))))

(assert (=> b!1575082 (= res!1076226 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51371 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575083 () Bool)

(declare-fun res!1076224 () Bool)

(assert (=> b!1575083 (=> (not res!1076224) (not e!878465))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575083 (= res!1076224 (validKeyInArray!0 k!761))))

(declare-fun b!1575084 () Bool)

(assert (=> b!1575084 (= e!878465 false)))

(declare-datatypes ((SeekEntryResult!13686 0))(
  ( (MissingZero!13686 (index!57142 (_ BitVec 32))) (Found!13686 (index!57143 (_ BitVec 32))) (Intermediate!13686 (undefined!14498 Bool) (index!57144 (_ BitVec 32)) (x!142102 (_ BitVec 32))) (Undefined!13686) (MissingVacant!13686 (index!57145 (_ BitVec 32))) )
))
(declare-fun lt!675058 () SeekEntryResult!13686)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105360 (_ BitVec 32)) SeekEntryResult!13686)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575084 (= lt!675058 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135774 res!1076225) b!1575082))

(assert (= (and b!1575082 res!1076226) b!1575083))

(assert (= (and b!1575083 res!1076224) b!1575084))

(declare-fun m!1448185 () Bool)

(assert (=> start!135774 m!1448185))

(declare-fun m!1448187 () Bool)

(assert (=> start!135774 m!1448187))

(declare-fun m!1448189 () Bool)

(assert (=> b!1575083 m!1448189))

(declare-fun m!1448191 () Bool)

(assert (=> b!1575084 m!1448191))

(assert (=> b!1575084 m!1448191))

(declare-fun m!1448193 () Bool)

(assert (=> b!1575084 m!1448193))

(push 1)

(assert (not start!135774))

(assert (not b!1575084))

(assert (not b!1575083))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

