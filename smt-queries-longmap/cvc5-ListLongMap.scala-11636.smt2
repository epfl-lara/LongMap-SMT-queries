; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136214 () Bool)

(assert start!136214)

(declare-fun res!1077156 () Bool)

(declare-fun e!880021 () Bool)

(assert (=> start!136214 (=> (not res!1077156) (not e!880021))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136214 (= res!1077156 (validMask!0 mask!898))))

(assert (=> start!136214 e!880021))

(assert (=> start!136214 true))

(declare-datatypes ((array!105501 0))(
  ( (array!105502 (arr!50883 (Array (_ BitVec 32) (_ BitVec 64))) (size!51434 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105501)

(declare-fun array_inv!39838 (array!105501) Bool)

(assert (=> start!136214 (array_inv!39838 _keys!605)))

(declare-fun b!1577590 () Bool)

(declare-fun res!1077157 () Bool)

(assert (=> b!1577590 (=> (not res!1077157) (not e!880021))))

(assert (=> b!1577590 (= res!1077157 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51434 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1577591 () Bool)

(declare-fun res!1077158 () Bool)

(assert (=> b!1577591 (=> (not res!1077158) (not e!880021))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577591 (= res!1077158 (validKeyInArray!0 k!761))))

(declare-fun b!1577592 () Bool)

(assert (=> b!1577592 (= e!880021 false)))

(declare-datatypes ((SeekEntryResult!13642 0))(
  ( (MissingZero!13642 (index!56966 (_ BitVec 32))) (Found!13642 (index!56967 (_ BitVec 32))) (Intermediate!13642 (undefined!14454 Bool) (index!56968 (_ BitVec 32)) (x!142125 (_ BitVec 32))) (Undefined!13642) (MissingVacant!13642 (index!56969 (_ BitVec 32))) )
))
(declare-fun lt!675990 () SeekEntryResult!13642)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105501 (_ BitVec 32)) SeekEntryResult!13642)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577592 (= lt!675990 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!136214 res!1077156) b!1577590))

(assert (= (and b!1577590 res!1077157) b!1577591))

(assert (= (and b!1577591 res!1077158) b!1577592))

(declare-fun m!1450523 () Bool)

(assert (=> start!136214 m!1450523))

(declare-fun m!1450525 () Bool)

(assert (=> start!136214 m!1450525))

(declare-fun m!1450527 () Bool)

(assert (=> b!1577591 m!1450527))

(declare-fun m!1450529 () Bool)

(assert (=> b!1577592 m!1450529))

(assert (=> b!1577592 m!1450529))

(declare-fun m!1450531 () Bool)

(assert (=> b!1577592 m!1450531))

(push 1)

(assert (not b!1577592))

(assert (not start!136214))

(assert (not b!1577591))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

