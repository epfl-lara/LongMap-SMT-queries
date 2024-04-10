; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112572 () Bool)

(assert start!112572)

(declare-fun b_free!30967 () Bool)

(declare-fun b_next!30967 () Bool)

(assert (=> start!112572 (= b_free!30967 (not b_next!30967))))

(declare-fun tp!108537 () Bool)

(declare-fun b_and!49875 () Bool)

(assert (=> start!112572 (= tp!108537 b_and!49875)))

(declare-fun b!1335345 () Bool)

(declare-fun e!760534 () Bool)

(declare-fun tp_is_empty!36877 () Bool)

(assert (=> b!1335345 (= e!760534 tp_is_empty!36877)))

(declare-fun mapNonEmpty!56989 () Bool)

(declare-fun mapRes!56989 () Bool)

(declare-fun tp!108538 () Bool)

(assert (=> mapNonEmpty!56989 (= mapRes!56989 (and tp!108538 e!760534))))

(declare-datatypes ((V!54273 0))(
  ( (V!54274 (val!18513 Int)) )
))
(declare-datatypes ((ValueCell!17540 0))(
  ( (ValueCellFull!17540 (v!21150 V!54273)) (EmptyCell!17540) )
))
(declare-datatypes ((array!90614 0))(
  ( (array!90615 (arr!43773 (Array (_ BitVec 32) ValueCell!17540)) (size!44323 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90614)

(declare-fun mapValue!56989 () ValueCell!17540)

(declare-fun mapKey!56989 () (_ BitVec 32))

(declare-fun mapRest!56989 () (Array (_ BitVec 32) ValueCell!17540))

(assert (=> mapNonEmpty!56989 (= (arr!43773 _values!1320) (store mapRest!56989 mapKey!56989 mapValue!56989))))

(declare-fun b!1335346 () Bool)

(declare-fun e!760536 () Bool)

(assert (=> b!1335346 (= e!760536 false)))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90616 0))(
  ( (array!90617 (arr!43774 (Array (_ BitVec 32) (_ BitVec 64))) (size!44324 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90616)

(declare-fun defaultEntry!1323 () Int)

(declare-fun lt!592447 () Bool)

(declare-fun minValue!1262 () V!54273)

(declare-fun zeroValue!1262 () V!54273)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(declare-datatypes ((tuple2!23872 0))(
  ( (tuple2!23873 (_1!11947 (_ BitVec 64)) (_2!11947 V!54273)) )
))
(declare-datatypes ((List!31013 0))(
  ( (Nil!31010) (Cons!31009 (h!32218 tuple2!23872) (t!45277 List!31013)) )
))
(declare-datatypes ((ListLongMap!21529 0))(
  ( (ListLongMap!21530 (toList!10780 List!31013)) )
))
(declare-fun contains!8944 (ListLongMap!21529 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5754 (array!90616 array!90614 (_ BitVec 32) (_ BitVec 32) V!54273 V!54273 (_ BitVec 32) Int) ListLongMap!21529)

(assert (=> b!1335346 (= lt!592447 (contains!8944 (getCurrentListMap!5754 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1335347 () Bool)

(declare-fun res!886237 () Bool)

(assert (=> b!1335347 (=> (not res!886237) (not e!760536))))

(assert (=> b!1335347 (= res!886237 (and (= (size!44323 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44324 _keys!1590) (size!44323 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1335348 () Bool)

(declare-fun e!760535 () Bool)

(assert (=> b!1335348 (= e!760535 tp_is_empty!36877)))

(declare-fun b!1335349 () Bool)

(declare-fun res!886238 () Bool)

(assert (=> b!1335349 (=> (not res!886238) (not e!760536))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90616 (_ BitVec 32)) Bool)

(assert (=> b!1335349 (= res!886238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1335350 () Bool)

(declare-fun res!886239 () Bool)

(assert (=> b!1335350 (=> (not res!886239) (not e!760536))))

(declare-datatypes ((List!31014 0))(
  ( (Nil!31011) (Cons!31010 (h!32219 (_ BitVec 64)) (t!45278 List!31014)) )
))
(declare-fun arrayNoDuplicates!0 (array!90616 (_ BitVec 32) List!31014) Bool)

(assert (=> b!1335350 (= res!886239 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31011))))

(declare-fun res!886236 () Bool)

(assert (=> start!112572 (=> (not res!886236) (not e!760536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112572 (= res!886236 (validMask!0 mask!1998))))

(assert (=> start!112572 e!760536))

(declare-fun e!760533 () Bool)

(declare-fun array_inv!33011 (array!90614) Bool)

(assert (=> start!112572 (and (array_inv!33011 _values!1320) e!760533)))

(assert (=> start!112572 true))

(declare-fun array_inv!33012 (array!90616) Bool)

(assert (=> start!112572 (array_inv!33012 _keys!1590)))

(assert (=> start!112572 tp!108537))

(assert (=> start!112572 tp_is_empty!36877))

(declare-fun mapIsEmpty!56989 () Bool)

(assert (=> mapIsEmpty!56989 mapRes!56989))

(declare-fun b!1335351 () Bool)

(assert (=> b!1335351 (= e!760533 (and e!760535 mapRes!56989))))

(declare-fun condMapEmpty!56989 () Bool)

(declare-fun mapDefault!56989 () ValueCell!17540)

