; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112554 () Bool)

(assert start!112554)

(declare-fun b_free!30949 () Bool)

(declare-fun b_next!30949 () Bool)

(assert (=> start!112554 (= b_free!30949 (not b_next!30949))))

(declare-fun tp!108483 () Bool)

(declare-fun b_and!49857 () Bool)

(assert (=> start!112554 (= tp!108483 b_and!49857)))

(declare-fun b!1335102 () Bool)

(declare-fun e!760398 () Bool)

(declare-fun tp_is_empty!36859 () Bool)

(assert (=> b!1335102 (= e!760398 tp_is_empty!36859)))

(declare-fun mapIsEmpty!56962 () Bool)

(declare-fun mapRes!56962 () Bool)

(assert (=> mapIsEmpty!56962 mapRes!56962))

(declare-fun res!886073 () Bool)

(declare-fun e!760401 () Bool)

(assert (=> start!112554 (=> (not res!886073) (not e!760401))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112554 (= res!886073 (validMask!0 mask!1998))))

(assert (=> start!112554 e!760401))

(declare-datatypes ((V!54249 0))(
  ( (V!54250 (val!18504 Int)) )
))
(declare-datatypes ((ValueCell!17531 0))(
  ( (ValueCellFull!17531 (v!21141 V!54249)) (EmptyCell!17531) )
))
(declare-datatypes ((array!90578 0))(
  ( (array!90579 (arr!43755 (Array (_ BitVec 32) ValueCell!17531)) (size!44305 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90578)

(declare-fun e!760399 () Bool)

(declare-fun array_inv!32999 (array!90578) Bool)

(assert (=> start!112554 (and (array_inv!32999 _values!1320) e!760399)))

(assert (=> start!112554 true))

(declare-datatypes ((array!90580 0))(
  ( (array!90581 (arr!43756 (Array (_ BitVec 32) (_ BitVec 64))) (size!44306 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90580)

(declare-fun array_inv!33000 (array!90580) Bool)

(assert (=> start!112554 (array_inv!33000 _keys!1590)))

(assert (=> start!112554 tp!108483))

(assert (=> start!112554 tp_is_empty!36859))

(declare-fun b!1335103 () Bool)

(declare-fun res!886076 () Bool)

(assert (=> b!1335103 (=> (not res!886076) (not e!760401))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1335103 (= res!886076 (and (= (size!44305 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44306 _keys!1590) (size!44305 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1335104 () Bool)

(declare-fun e!760402 () Bool)

(assert (=> b!1335104 (= e!760402 tp_is_empty!36859)))

(declare-fun b!1335105 () Bool)

(declare-fun res!886077 () Bool)

(assert (=> b!1335105 (=> (not res!886077) (not e!760401))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1335105 (= res!886077 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44306 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1335106 () Bool)

(assert (=> b!1335106 (= e!760401 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun lt!592429 () Bool)

(declare-fun minValue!1262 () V!54249)

(declare-fun zeroValue!1262 () V!54249)

(declare-datatypes ((tuple2!23858 0))(
  ( (tuple2!23859 (_1!11940 (_ BitVec 64)) (_2!11940 V!54249)) )
))
(declare-datatypes ((List!30998 0))(
  ( (Nil!30995) (Cons!30994 (h!32203 tuple2!23858) (t!45262 List!30998)) )
))
(declare-datatypes ((ListLongMap!21515 0))(
  ( (ListLongMap!21516 (toList!10773 List!30998)) )
))
(declare-fun contains!8937 (ListLongMap!21515 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5747 (array!90580 array!90578 (_ BitVec 32) (_ BitVec 32) V!54249 V!54249 (_ BitVec 32) Int) ListLongMap!21515)

(assert (=> b!1335106 (= lt!592429 (contains!8937 (getCurrentListMap!5747 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun mapNonEmpty!56962 () Bool)

(declare-fun tp!108484 () Bool)

(assert (=> mapNonEmpty!56962 (= mapRes!56962 (and tp!108484 e!760402))))

(declare-fun mapRest!56962 () (Array (_ BitVec 32) ValueCell!17531))

(declare-fun mapValue!56962 () ValueCell!17531)

(declare-fun mapKey!56962 () (_ BitVec 32))

(assert (=> mapNonEmpty!56962 (= (arr!43755 _values!1320) (store mapRest!56962 mapKey!56962 mapValue!56962))))

(declare-fun b!1335107 () Bool)

(declare-fun res!886075 () Bool)

(assert (=> b!1335107 (=> (not res!886075) (not e!760401))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90580 (_ BitVec 32)) Bool)

(assert (=> b!1335107 (= res!886075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1335108 () Bool)

(declare-fun res!886074 () Bool)

(assert (=> b!1335108 (=> (not res!886074) (not e!760401))))

(declare-datatypes ((List!30999 0))(
  ( (Nil!30996) (Cons!30995 (h!32204 (_ BitVec 64)) (t!45263 List!30999)) )
))
(declare-fun arrayNoDuplicates!0 (array!90580 (_ BitVec 32) List!30999) Bool)

(assert (=> b!1335108 (= res!886074 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30996))))

(declare-fun b!1335109 () Bool)

(assert (=> b!1335109 (= e!760399 (and e!760398 mapRes!56962))))

(declare-fun condMapEmpty!56962 () Bool)

(declare-fun mapDefault!56962 () ValueCell!17531)

