; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135610 () Bool)

(assert start!135610)

(declare-fun res!1075801 () Bool)

(declare-fun e!878107 () Bool)

(assert (=> start!135610 (=> (not res!1075801) (not e!878107))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135610 (= res!1075801 (validMask!0 mask!898))))

(assert (=> start!135610 e!878107))

(assert (=> start!135610 true))

(declare-datatypes ((array!105277 0))(
  ( (array!105278 (arr!50784 (Array (_ BitVec 32) (_ BitVec 64))) (size!51334 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105277)

(declare-fun array_inv!39511 (array!105277) Bool)

(assert (=> start!135610 (array_inv!39511 _keys!605)))

(declare-fun b!1574506 () Bool)

(declare-fun res!1075802 () Bool)

(assert (=> b!1574506 (=> (not res!1075802) (not e!878107))))

(assert (=> b!1574506 (= res!1075802 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51334 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574507 () Bool)

(declare-fun res!1075803 () Bool)

(assert (=> b!1574507 (=> (not res!1075803) (not e!878107))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574507 (= res!1075803 (validKeyInArray!0 k!761))))

(declare-fun b!1574508 () Bool)

(assert (=> b!1574508 (= e!878107 false)))

(declare-fun lt!674839 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574508 (= lt!674839 (toIndex!0 k!761 mask!898))))

(assert (= (and start!135610 res!1075801) b!1574506))

(assert (= (and b!1574506 res!1075802) b!1574507))

(assert (= (and b!1574507 res!1075803) b!1574508))

(declare-fun m!1447733 () Bool)

(assert (=> start!135610 m!1447733))

(declare-fun m!1447735 () Bool)

(assert (=> start!135610 m!1447735))

(declare-fun m!1447737 () Bool)

(assert (=> b!1574507 m!1447737))

(declare-fun m!1447739 () Bool)

(assert (=> b!1574508 m!1447739))

(push 1)

(assert (not b!1574508))

(assert (not start!135610))

(assert (not b!1574507))

