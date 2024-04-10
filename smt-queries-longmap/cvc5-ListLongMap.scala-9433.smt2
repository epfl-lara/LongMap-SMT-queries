; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112206 () Bool)

(assert start!112206)

(declare-fun b_free!30601 () Bool)

(declare-fun b_next!30601 () Bool)

(assert (=> start!112206 (= b_free!30601 (not b_next!30601))))

(declare-fun tp!107440 () Bool)

(declare-fun b_and!49257 () Bool)

(assert (=> start!112206 (= tp!107440 b_and!49257)))

(declare-fun res!881777 () Bool)

(declare-fun e!757707 () Bool)

(assert (=> start!112206 (=> (not res!881777) (not e!757707))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112206 (= res!881777 (validMask!0 mask!1998))))

(assert (=> start!112206 e!757707))

(declare-datatypes ((V!53785 0))(
  ( (V!53786 (val!18330 Int)) )
))
(declare-datatypes ((ValueCell!17357 0))(
  ( (ValueCellFull!17357 (v!20967 V!53785)) (EmptyCell!17357) )
))
(declare-datatypes ((array!89914 0))(
  ( (array!89915 (arr!43423 (Array (_ BitVec 32) ValueCell!17357)) (size!43973 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89914)

(declare-fun e!757708 () Bool)

(declare-fun array_inv!32763 (array!89914) Bool)

(assert (=> start!112206 (and (array_inv!32763 _values!1320) e!757708)))

(assert (=> start!112206 true))

(declare-datatypes ((array!89916 0))(
  ( (array!89917 (arr!43424 (Array (_ BitVec 32) (_ BitVec 64))) (size!43974 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89916)

(declare-fun array_inv!32764 (array!89916) Bool)

(assert (=> start!112206 (array_inv!32764 _keys!1590)))

(assert (=> start!112206 tp!107440))

(declare-fun tp_is_empty!36511 () Bool)

(assert (=> start!112206 tp_is_empty!36511))

(declare-fun b!1328981 () Bool)

(declare-fun res!881770 () Bool)

(assert (=> b!1328981 (=> (not res!881770) (not e!757707))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1328981 (= res!881770 (and (= (size!43973 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43974 _keys!1590) (size!43973 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1328982 () Bool)

(declare-fun e!757709 () Bool)

(declare-fun mapRes!56440 () Bool)

(assert (=> b!1328982 (= e!757708 (and e!757709 mapRes!56440))))

(declare-fun condMapEmpty!56440 () Bool)

(declare-fun mapDefault!56440 () ValueCell!17357)

