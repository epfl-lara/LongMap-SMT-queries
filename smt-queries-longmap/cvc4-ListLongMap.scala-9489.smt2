; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112546 () Bool)

(assert start!112546)

(declare-fun b_free!30941 () Bool)

(declare-fun b_next!30941 () Bool)

(assert (=> start!112546 (= b_free!30941 (not b_next!30941))))

(declare-fun tp!108460 () Bool)

(declare-fun b_and!49849 () Bool)

(assert (=> start!112546 (= tp!108460 b_and!49849)))

(declare-fun b!1335006 () Bool)

(declare-fun res!886014 () Bool)

(declare-fun e!760342 () Bool)

(assert (=> b!1335006 (=> (not res!886014) (not e!760342))))

(declare-datatypes ((V!54237 0))(
  ( (V!54238 (val!18500 Int)) )
))
(declare-datatypes ((ValueCell!17527 0))(
  ( (ValueCellFull!17527 (v!21137 V!54237)) (EmptyCell!17527) )
))
(declare-datatypes ((array!90562 0))(
  ( (array!90563 (arr!43747 (Array (_ BitVec 32) ValueCell!17527)) (size!44297 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90562)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90564 0))(
  ( (array!90565 (arr!43748 (Array (_ BitVec 32) (_ BitVec 64))) (size!44298 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90564)

(assert (=> b!1335006 (= res!886014 (and (= (size!44297 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44298 _keys!1590) (size!44297 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1335007 () Bool)

(declare-fun e!760338 () Bool)

(declare-fun tp_is_empty!36851 () Bool)

(assert (=> b!1335007 (= e!760338 tp_is_empty!36851)))

(declare-fun b!1335008 () Bool)

(declare-fun e!760340 () Bool)

(assert (=> b!1335008 (= e!760340 tp_is_empty!36851)))

(declare-fun mapNonEmpty!56950 () Bool)

(declare-fun mapRes!56950 () Bool)

(declare-fun tp!108459 () Bool)

(assert (=> mapNonEmpty!56950 (= mapRes!56950 (and tp!108459 e!760340))))

(declare-fun mapValue!56950 () ValueCell!17527)

(declare-fun mapKey!56950 () (_ BitVec 32))

(declare-fun mapRest!56950 () (Array (_ BitVec 32) ValueCell!17527))

(assert (=> mapNonEmpty!56950 (= (arr!43747 _values!1320) (store mapRest!56950 mapKey!56950 mapValue!56950))))

(declare-fun res!886016 () Bool)

(assert (=> start!112546 (=> (not res!886016) (not e!760342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112546 (= res!886016 (validMask!0 mask!1998))))

(assert (=> start!112546 e!760342))

(declare-fun e!760339 () Bool)

(declare-fun array_inv!32991 (array!90562) Bool)

(assert (=> start!112546 (and (array_inv!32991 _values!1320) e!760339)))

(assert (=> start!112546 true))

(declare-fun array_inv!32992 (array!90564) Bool)

(assert (=> start!112546 (array_inv!32992 _keys!1590)))

(assert (=> start!112546 tp!108460))

(assert (=> start!112546 tp_is_empty!36851))

(declare-fun mapIsEmpty!56950 () Bool)

(assert (=> mapIsEmpty!56950 mapRes!56950))

(declare-fun b!1335009 () Bool)

(declare-fun res!886017 () Bool)

(assert (=> b!1335009 (=> (not res!886017) (not e!760342))))

(declare-datatypes ((List!30992 0))(
  ( (Nil!30989) (Cons!30988 (h!32197 (_ BitVec 64)) (t!45256 List!30992)) )
))
(declare-fun arrayNoDuplicates!0 (array!90564 (_ BitVec 32) List!30992) Bool)

(assert (=> b!1335009 (= res!886017 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30989))))

(declare-fun b!1335010 () Bool)

(assert (=> b!1335010 (= e!760339 (and e!760338 mapRes!56950))))

(declare-fun condMapEmpty!56950 () Bool)

(declare-fun mapDefault!56950 () ValueCell!17527)

