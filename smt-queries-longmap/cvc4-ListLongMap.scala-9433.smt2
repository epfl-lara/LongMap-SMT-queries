; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112210 () Bool)

(assert start!112210)

(declare-fun b_free!30605 () Bool)

(declare-fun b_next!30605 () Bool)

(assert (=> start!112210 (= b_free!30605 (not b_next!30605))))

(declare-fun tp!107451 () Bool)

(declare-fun b_and!49265 () Bool)

(assert (=> start!112210 (= tp!107451 b_and!49265)))

(declare-fun b!1329057 () Bool)

(declare-fun res!881825 () Bool)

(declare-fun e!757738 () Bool)

(assert (=> b!1329057 (=> (not res!881825) (not e!757738))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1329057 (= res!881825 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1329058 () Bool)

(declare-fun e!757737 () Bool)

(declare-fun tp_is_empty!36515 () Bool)

(assert (=> b!1329058 (= e!757737 tp_is_empty!36515)))

(declare-fun b!1329059 () Bool)

(declare-fun res!881826 () Bool)

(assert (=> b!1329059 (=> (not res!881826) (not e!757738))))

(declare-datatypes ((array!89922 0))(
  ( (array!89923 (arr!43427 (Array (_ BitVec 32) (_ BitVec 64))) (size!43977 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89922)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun from!1980 () (_ BitVec 32))

(assert (=> b!1329059 (= res!881826 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43977 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1329060 () Bool)

(declare-fun res!881829 () Bool)

(assert (=> b!1329060 (=> (not res!881829) (not e!757738))))

(declare-datatypes ((List!30753 0))(
  ( (Nil!30750) (Cons!30749 (h!31958 (_ BitVec 64)) (t!44771 List!30753)) )
))
(declare-fun arrayNoDuplicates!0 (array!89922 (_ BitVec 32) List!30753) Bool)

(assert (=> b!1329060 (= res!881829 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30750))))

(declare-fun mapIsEmpty!56446 () Bool)

(declare-fun mapRes!56446 () Bool)

(assert (=> mapIsEmpty!56446 mapRes!56446))

(declare-fun mapNonEmpty!56446 () Bool)

(declare-fun tp!107452 () Bool)

(assert (=> mapNonEmpty!56446 (= mapRes!56446 (and tp!107452 e!757737))))

(declare-fun mapKey!56446 () (_ BitVec 32))

(declare-datatypes ((V!53789 0))(
  ( (V!53790 (val!18332 Int)) )
))
(declare-datatypes ((ValueCell!17359 0))(
  ( (ValueCellFull!17359 (v!20969 V!53789)) (EmptyCell!17359) )
))
(declare-datatypes ((array!89924 0))(
  ( (array!89925 (arr!43428 (Array (_ BitVec 32) ValueCell!17359)) (size!43978 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89924)

(declare-fun mapValue!56446 () ValueCell!17359)

(declare-fun mapRest!56446 () (Array (_ BitVec 32) ValueCell!17359))

(assert (=> mapNonEmpty!56446 (= (arr!43428 _values!1320) (store mapRest!56446 mapKey!56446 mapValue!56446))))

(declare-fun b!1329061 () Bool)

(declare-fun res!881832 () Bool)

(assert (=> b!1329061 (=> (not res!881832) (not e!757738))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53789)

(declare-fun zeroValue!1262 () V!53789)

(declare-datatypes ((tuple2!23598 0))(
  ( (tuple2!23599 (_1!11810 (_ BitVec 64)) (_2!11810 V!53789)) )
))
(declare-datatypes ((List!30754 0))(
  ( (Nil!30751) (Cons!30750 (h!31959 tuple2!23598) (t!44772 List!30754)) )
))
(declare-datatypes ((ListLongMap!21255 0))(
  ( (ListLongMap!21256 (toList!10643 List!30754)) )
))
(declare-fun contains!8807 (ListLongMap!21255 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5633 (array!89922 array!89924 (_ BitVec 32) (_ BitVec 32) V!53789 V!53789 (_ BitVec 32) Int) ListLongMap!21255)

(assert (=> b!1329061 (= res!881832 (contains!8807 (getCurrentListMap!5633 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1329062 () Bool)

(declare-fun res!881828 () Bool)

(assert (=> b!1329062 (=> (not res!881828) (not e!757738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89922 (_ BitVec 32)) Bool)

(assert (=> b!1329062 (= res!881828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329063 () Bool)

(declare-fun res!881831 () Bool)

(assert (=> b!1329063 (=> (not res!881831) (not e!757738))))

(assert (=> b!1329063 (= res!881831 (not (= (select (arr!43427 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1329064 () Bool)

(declare-fun e!757739 () Bool)

(declare-fun e!757740 () Bool)

(assert (=> b!1329064 (= e!757739 (and e!757740 mapRes!56446))))

(declare-fun condMapEmpty!56446 () Bool)

(declare-fun mapDefault!56446 () ValueCell!17359)

