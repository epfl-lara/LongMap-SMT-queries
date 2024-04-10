; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135768 () Bool)

(assert start!135768)

(declare-fun res!1076199 () Bool)

(declare-fun e!878446 () Bool)

(assert (=> start!135768 (=> (not res!1076199) (not e!878446))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135768 (= res!1076199 (validMask!0 mask!898))))

(assert (=> start!135768 e!878446))

(assert (=> start!135768 true))

(declare-datatypes ((array!105354 0))(
  ( (array!105355 (arr!50818 (Array (_ BitVec 32) (_ BitVec 64))) (size!51368 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105354)

(declare-fun array_inv!39545 (array!105354) Bool)

(assert (=> start!135768 (array_inv!39545 _keys!605)))

(declare-fun b!1575055 () Bool)

(declare-fun res!1076197 () Bool)

(assert (=> b!1575055 (=> (not res!1076197) (not e!878446))))

(assert (=> b!1575055 (= res!1076197 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51368 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575056 () Bool)

(declare-fun res!1076198 () Bool)

(assert (=> b!1575056 (=> (not res!1076198) (not e!878446))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575056 (= res!1076198 (validKeyInArray!0 k!761))))

(declare-fun b!1575057 () Bool)

(assert (=> b!1575057 (= e!878446 false)))

(declare-datatypes ((SeekEntryResult!13683 0))(
  ( (MissingZero!13683 (index!57130 (_ BitVec 32))) (Found!13683 (index!57131 (_ BitVec 32))) (Intermediate!13683 (undefined!14495 Bool) (index!57132 (_ BitVec 32)) (x!142091 (_ BitVec 32))) (Undefined!13683) (MissingVacant!13683 (index!57133 (_ BitVec 32))) )
))
(declare-fun lt!675049 () SeekEntryResult!13683)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105354 (_ BitVec 32)) SeekEntryResult!13683)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575057 (= lt!675049 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135768 res!1076199) b!1575055))

(assert (= (and b!1575055 res!1076197) b!1575056))

(assert (= (and b!1575056 res!1076198) b!1575057))

(declare-fun m!1448155 () Bool)

(assert (=> start!135768 m!1448155))

(declare-fun m!1448157 () Bool)

(assert (=> start!135768 m!1448157))

(declare-fun m!1448159 () Bool)

(assert (=> b!1575056 m!1448159))

(declare-fun m!1448161 () Bool)

(assert (=> b!1575057 m!1448161))

(assert (=> b!1575057 m!1448161))

(declare-fun m!1448163 () Bool)

(assert (=> b!1575057 m!1448163))

(push 1)

(assert (not b!1575056))

(assert (not b!1575057))

(assert (not start!135768))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

