; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112264 () Bool)

(assert start!112264)

(declare-fun b_free!30659 () Bool)

(declare-fun b_next!30659 () Bool)

(assert (=> start!112264 (= b_free!30659 (not b_next!30659))))

(declare-fun tp!107613 () Bool)

(declare-fun b_and!49373 () Bool)

(assert (=> start!112264 (= tp!107613 b_and!49373)))

(declare-fun b!1330083 () Bool)

(declare-fun res!882560 () Bool)

(declare-fun e!758142 () Bool)

(assert (=> b!1330083 (=> (not res!882560) (not e!758142))))

(declare-datatypes ((array!90028 0))(
  ( (array!90029 (arr!43480 (Array (_ BitVec 32) (_ BitVec 64))) (size!44030 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90028)

(declare-datatypes ((List!30792 0))(
  ( (Nil!30789) (Cons!30788 (h!31997 (_ BitVec 64)) (t!44864 List!30792)) )
))
(declare-fun arrayNoDuplicates!0 (array!90028 (_ BitVec 32) List!30792) Bool)

(assert (=> b!1330083 (= res!882560 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30789))))

(declare-fun b!1330084 () Bool)

(declare-fun e!758144 () Bool)

(declare-fun tp_is_empty!36569 () Bool)

(assert (=> b!1330084 (= e!758144 tp_is_empty!36569)))

(declare-fun b!1330085 () Bool)

(declare-fun res!882559 () Bool)

(assert (=> b!1330085 (=> (not res!882559) (not e!758142))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1330085 (= res!882559 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44030 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1330086 () Bool)

(declare-fun res!882558 () Bool)

(assert (=> b!1330086 (=> (not res!882558) (not e!758142))))

(declare-datatypes ((V!53861 0))(
  ( (V!53862 (val!18359 Int)) )
))
(declare-datatypes ((ValueCell!17386 0))(
  ( (ValueCellFull!17386 (v!20996 V!53861)) (EmptyCell!17386) )
))
(declare-datatypes ((array!90030 0))(
  ( (array!90031 (arr!43481 (Array (_ BitVec 32) ValueCell!17386)) (size!44031 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90030)

(declare-fun mask!1998 () (_ BitVec 32))

(assert (=> b!1330086 (= res!882558 (and (= (size!44031 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44030 _keys!1590) (size!44031 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun res!882557 () Bool)

(assert (=> start!112264 (=> (not res!882557) (not e!758142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112264 (= res!882557 (validMask!0 mask!1998))))

(assert (=> start!112264 e!758142))

(declare-fun e!758143 () Bool)

(declare-fun array_inv!32803 (array!90030) Bool)

(assert (=> start!112264 (and (array_inv!32803 _values!1320) e!758143)))

(assert (=> start!112264 true))

(declare-fun array_inv!32804 (array!90028) Bool)

(assert (=> start!112264 (array_inv!32804 _keys!1590)))

(assert (=> start!112264 tp!107613))

(assert (=> start!112264 tp_is_empty!36569))

(declare-fun b!1330087 () Bool)

(declare-fun res!882553 () Bool)

(assert (=> b!1330087 (=> (not res!882553) (not e!758142))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53861)

(declare-fun zeroValue!1262 () V!53861)

(declare-datatypes ((tuple2!23640 0))(
  ( (tuple2!23641 (_1!11831 (_ BitVec 64)) (_2!11831 V!53861)) )
))
(declare-datatypes ((List!30793 0))(
  ( (Nil!30790) (Cons!30789 (h!31998 tuple2!23640) (t!44865 List!30793)) )
))
(declare-datatypes ((ListLongMap!21297 0))(
  ( (ListLongMap!21298 (toList!10664 List!30793)) )
))
(declare-fun contains!8828 (ListLongMap!21297 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5652 (array!90028 array!90030 (_ BitVec 32) (_ BitVec 32) V!53861 V!53861 (_ BitVec 32) Int) ListLongMap!21297)

(assert (=> b!1330087 (= res!882553 (contains!8828 (getCurrentListMap!5652 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1330088 () Bool)

(declare-fun res!882556 () Bool)

(assert (=> b!1330088 (=> (not res!882556) (not e!758142))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90028 (_ BitVec 32)) Bool)

(assert (=> b!1330088 (= res!882556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapNonEmpty!56527 () Bool)

(declare-fun mapRes!56527 () Bool)

(declare-fun tp!107614 () Bool)

(assert (=> mapNonEmpty!56527 (= mapRes!56527 (and tp!107614 e!758144))))

(declare-fun mapKey!56527 () (_ BitVec 32))

(declare-fun mapRest!56527 () (Array (_ BitVec 32) ValueCell!17386))

(declare-fun mapValue!56527 () ValueCell!17386)

(assert (=> mapNonEmpty!56527 (= (arr!43481 _values!1320) (store mapRest!56527 mapKey!56527 mapValue!56527))))

(declare-fun b!1330089 () Bool)

(assert (=> b!1330089 (= e!758142 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))))

(declare-fun lt!591058 () ListLongMap!21297)

(assert (=> b!1330089 (contains!8828 lt!591058 k!1153)))

(declare-datatypes ((Unit!43773 0))(
  ( (Unit!43774) )
))
(declare-fun lt!591057 () Unit!43773)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!249 ((_ BitVec 64) (_ BitVec 64) V!53861 ListLongMap!21297) Unit!43773)

(assert (=> b!1330089 (= lt!591057 (lemmaInListMapAfterAddingDiffThenInBefore!249 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591058))))

(declare-fun +!4662 (ListLongMap!21297 tuple2!23640) ListLongMap!21297)

(declare-fun getCurrentListMapNoExtraKeys!6300 (array!90028 array!90030 (_ BitVec 32) (_ BitVec 32) V!53861 V!53861 (_ BitVec 32) Int) ListLongMap!21297)

(declare-fun get!21910 (ValueCell!17386 V!53861) V!53861)

(declare-fun dynLambda!3601 (Int (_ BitVec 64)) V!53861)

(assert (=> b!1330089 (= lt!591058 (+!4662 (getCurrentListMapNoExtraKeys!6300 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23641 (select (arr!43480 _keys!1590) from!1980) (get!21910 (select (arr!43481 _values!1320) from!1980) (dynLambda!3601 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1330090 () Bool)

(declare-fun res!882555 () Bool)

(assert (=> b!1330090 (=> (not res!882555) (not e!758142))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330090 (= res!882555 (validKeyInArray!0 (select (arr!43480 _keys!1590) from!1980)))))

(declare-fun b!1330091 () Bool)

(declare-fun res!882554 () Bool)

(assert (=> b!1330091 (=> (not res!882554) (not e!758142))))

(assert (=> b!1330091 (= res!882554 (not (= (select (arr!43480 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1330092 () Bool)

(declare-fun e!758146 () Bool)

(assert (=> b!1330092 (= e!758143 (and e!758146 mapRes!56527))))

(declare-fun condMapEmpty!56527 () Bool)

(declare-fun mapDefault!56527 () ValueCell!17386)

