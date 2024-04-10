; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112558 () Bool)

(assert start!112558)

(declare-fun b_free!30953 () Bool)

(declare-fun b_next!30953 () Bool)

(assert (=> start!112558 (= b_free!30953 (not b_next!30953))))

(declare-fun tp!108495 () Bool)

(declare-fun b_and!49861 () Bool)

(assert (=> start!112558 (= tp!108495 b_and!49861)))

(declare-fun b!1335150 () Bool)

(declare-fun e!760432 () Bool)

(assert (=> b!1335150 (= e!760432 false)))

(declare-datatypes ((V!54253 0))(
  ( (V!54254 (val!18506 Int)) )
))
(declare-datatypes ((ValueCell!17533 0))(
  ( (ValueCellFull!17533 (v!21143 V!54253)) (EmptyCell!17533) )
))
(declare-datatypes ((array!90586 0))(
  ( (array!90587 (arr!43759 (Array (_ BitVec 32) ValueCell!17533)) (size!44309 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90586)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-datatypes ((array!90588 0))(
  ( (array!90589 (arr!43760 (Array (_ BitVec 32) (_ BitVec 64))) (size!44310 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90588)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54253)

(declare-fun zeroValue!1262 () V!54253)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun lt!592435 () Bool)

(declare-datatypes ((tuple2!23862 0))(
  ( (tuple2!23863 (_1!11942 (_ BitVec 64)) (_2!11942 V!54253)) )
))
(declare-datatypes ((List!31002 0))(
  ( (Nil!30999) (Cons!30998 (h!32207 tuple2!23862) (t!45266 List!31002)) )
))
(declare-datatypes ((ListLongMap!21519 0))(
  ( (ListLongMap!21520 (toList!10775 List!31002)) )
))
(declare-fun contains!8939 (ListLongMap!21519 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5749 (array!90588 array!90586 (_ BitVec 32) (_ BitVec 32) V!54253 V!54253 (_ BitVec 32) Int) ListLongMap!21519)

(assert (=> b!1335150 (= lt!592435 (contains!8939 (getCurrentListMap!5749 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun mapNonEmpty!56968 () Bool)

(declare-fun mapRes!56968 () Bool)

(declare-fun tp!108496 () Bool)

(declare-fun e!760431 () Bool)

(assert (=> mapNonEmpty!56968 (= mapRes!56968 (and tp!108496 e!760431))))

(declare-fun mapRest!56968 () (Array (_ BitVec 32) ValueCell!17533))

(declare-fun mapValue!56968 () ValueCell!17533)

(declare-fun mapKey!56968 () (_ BitVec 32))

(assert (=> mapNonEmpty!56968 (= (arr!43759 _values!1320) (store mapRest!56968 mapKey!56968 mapValue!56968))))

(declare-fun b!1335151 () Bool)

(declare-fun res!886106 () Bool)

(assert (=> b!1335151 (=> (not res!886106) (not e!760432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90588 (_ BitVec 32)) Bool)

(assert (=> b!1335151 (= res!886106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1335152 () Bool)

(declare-fun res!886105 () Bool)

(assert (=> b!1335152 (=> (not res!886105) (not e!760432))))

(declare-datatypes ((List!31003 0))(
  ( (Nil!31000) (Cons!30999 (h!32208 (_ BitVec 64)) (t!45267 List!31003)) )
))
(declare-fun arrayNoDuplicates!0 (array!90588 (_ BitVec 32) List!31003) Bool)

(assert (=> b!1335152 (= res!886105 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31000))))

(declare-fun mapIsEmpty!56968 () Bool)

(assert (=> mapIsEmpty!56968 mapRes!56968))

(declare-fun b!1335153 () Bool)

(declare-fun e!760429 () Bool)

(declare-fun e!760430 () Bool)

(assert (=> b!1335153 (= e!760429 (and e!760430 mapRes!56968))))

(declare-fun condMapEmpty!56968 () Bool)

(declare-fun mapDefault!56968 () ValueCell!17533)

