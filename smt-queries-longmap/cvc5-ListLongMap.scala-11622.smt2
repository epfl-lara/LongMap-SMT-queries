; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135612 () Bool)

(assert start!135612)

(declare-fun res!1075811 () Bool)

(declare-fun e!878113 () Bool)

(assert (=> start!135612 (=> (not res!1075811) (not e!878113))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135612 (= res!1075811 (validMask!0 mask!898))))

(assert (=> start!135612 e!878113))

(assert (=> start!135612 true))

(declare-datatypes ((array!105279 0))(
  ( (array!105280 (arr!50785 (Array (_ BitVec 32) (_ BitVec 64))) (size!51335 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105279)

(declare-fun array_inv!39512 (array!105279) Bool)

(assert (=> start!135612 (array_inv!39512 _keys!605)))

(declare-fun b!1574515 () Bool)

(declare-fun res!1075810 () Bool)

(assert (=> b!1574515 (=> (not res!1075810) (not e!878113))))

(assert (=> b!1574515 (= res!1075810 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51335 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574516 () Bool)

(declare-fun res!1075812 () Bool)

(assert (=> b!1574516 (=> (not res!1075812) (not e!878113))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574516 (= res!1075812 (validKeyInArray!0 k!761))))

(declare-fun b!1574517 () Bool)

(assert (=> b!1574517 (= e!878113 false)))

(declare-fun lt!674842 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574517 (= lt!674842 (toIndex!0 k!761 mask!898))))

(assert (= (and start!135612 res!1075811) b!1574515))

(assert (= (and b!1574515 res!1075810) b!1574516))

(assert (= (and b!1574516 res!1075812) b!1574517))

(declare-fun m!1447741 () Bool)

(assert (=> start!135612 m!1447741))

(declare-fun m!1447743 () Bool)

(assert (=> start!135612 m!1447743))

(declare-fun m!1447745 () Bool)

(assert (=> b!1574516 m!1447745))

(declare-fun m!1447747 () Bool)

(assert (=> b!1574517 m!1447747))

(push 1)

(assert (not b!1574517))

(assert (not start!135612))

(assert (not b!1574516))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

