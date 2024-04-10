; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112186 () Bool)

(assert start!112186)

(declare-fun b_free!30581 () Bool)

(declare-fun b_next!30581 () Bool)

(assert (=> start!112186 (= b_free!30581 (not b_next!30581))))

(declare-fun tp!107380 () Bool)

(declare-fun b_and!49231 () Bool)

(assert (=> start!112186 (= tp!107380 b_and!49231)))

(declare-fun res!881550 () Bool)

(declare-fun e!757557 () Bool)

(assert (=> start!112186 (=> (not res!881550) (not e!757557))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112186 (= res!881550 (validMask!0 mask!1998))))

(assert (=> start!112186 e!757557))

(declare-datatypes ((V!53757 0))(
  ( (V!53758 (val!18320 Int)) )
))
(declare-datatypes ((ValueCell!17347 0))(
  ( (ValueCellFull!17347 (v!20957 V!53757)) (EmptyCell!17347) )
))
(declare-datatypes ((array!89876 0))(
  ( (array!89877 (arr!43404 (Array (_ BitVec 32) ValueCell!17347)) (size!43954 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89876)

(declare-fun e!757559 () Bool)

(declare-fun array_inv!32749 (array!89876) Bool)

(assert (=> start!112186 (and (array_inv!32749 _values!1320) e!757559)))

(assert (=> start!112186 true))

(declare-datatypes ((array!89878 0))(
  ( (array!89879 (arr!43405 (Array (_ BitVec 32) (_ BitVec 64))) (size!43955 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89878)

(declare-fun array_inv!32750 (array!89878) Bool)

(assert (=> start!112186 (array_inv!32750 _keys!1590)))

(assert (=> start!112186 tp!107380))

(declare-fun tp_is_empty!36491 () Bool)

(assert (=> start!112186 tp_is_empty!36491))

(declare-fun b!1328664 () Bool)

(declare-fun res!881551 () Bool)

(assert (=> b!1328664 (=> (not res!881551) (not e!757557))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1328664 (= res!881551 (and (= (size!43954 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43955 _keys!1590) (size!43954 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56410 () Bool)

(declare-fun mapRes!56410 () Bool)

(assert (=> mapIsEmpty!56410 mapRes!56410))

(declare-fun b!1328665 () Bool)

(assert (=> b!1328665 (= e!757557 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53757)

(declare-fun zeroValue!1262 () V!53757)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!590869 () Bool)

(declare-datatypes ((tuple2!23580 0))(
  ( (tuple2!23581 (_1!11801 (_ BitVec 64)) (_2!11801 V!53757)) )
))
(declare-datatypes ((List!30738 0))(
  ( (Nil!30735) (Cons!30734 (h!31943 tuple2!23580) (t!44744 List!30738)) )
))
(declare-datatypes ((ListLongMap!21237 0))(
  ( (ListLongMap!21238 (toList!10634 List!30738)) )
))
(declare-fun contains!8798 (ListLongMap!21237 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5625 (array!89878 array!89876 (_ BitVec 32) (_ BitVec 32) V!53757 V!53757 (_ BitVec 32) Int) ListLongMap!21237)

(assert (=> b!1328665 (= lt!590869 (contains!8798 (getCurrentListMap!5625 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1328666 () Bool)

(declare-fun e!757561 () Bool)

(assert (=> b!1328666 (= e!757559 (and e!757561 mapRes!56410))))

(declare-fun condMapEmpty!56410 () Bool)

(declare-fun mapDefault!56410 () ValueCell!17347)

