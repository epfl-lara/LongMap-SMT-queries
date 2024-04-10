; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112212 () Bool)

(assert start!112212)

(declare-fun b_free!30607 () Bool)

(declare-fun b_next!30607 () Bool)

(assert (=> start!112212 (= b_free!30607 (not b_next!30607))))

(declare-fun tp!107457 () Bool)

(declare-fun b_and!49269 () Bool)

(assert (=> start!112212 (= tp!107457 b_and!49269)))

(declare-fun b!1329095 () Bool)

(declare-fun res!881857 () Bool)

(declare-fun e!757752 () Bool)

(assert (=> b!1329095 (=> (not res!881857) (not e!757752))))

(declare-datatypes ((array!89926 0))(
  ( (array!89927 (arr!43429 (Array (_ BitVec 32) (_ BitVec 64))) (size!43979 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89926)

(declare-datatypes ((List!30755 0))(
  ( (Nil!30752) (Cons!30751 (h!31960 (_ BitVec 64)) (t!44775 List!30755)) )
))
(declare-fun arrayNoDuplicates!0 (array!89926 (_ BitVec 32) List!30755) Bool)

(assert (=> b!1329095 (= res!881857 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30752))))

(declare-fun b!1329096 () Bool)

(declare-fun e!757755 () Bool)

(declare-fun tp_is_empty!36517 () Bool)

(assert (=> b!1329096 (= e!757755 tp_is_empty!36517)))

(declare-fun b!1329097 () Bool)

(assert (=> b!1329097 (= e!757752 (not true))))

(declare-datatypes ((V!53793 0))(
  ( (V!53794 (val!18333 Int)) )
))
(declare-datatypes ((tuple2!23600 0))(
  ( (tuple2!23601 (_1!11811 (_ BitVec 64)) (_2!11811 V!53793)) )
))
(declare-datatypes ((List!30756 0))(
  ( (Nil!30753) (Cons!30752 (h!31961 tuple2!23600) (t!44776 List!30756)) )
))
(declare-datatypes ((ListLongMap!21257 0))(
  ( (ListLongMap!21258 (toList!10644 List!30756)) )
))
(declare-fun lt!590902 () ListLongMap!21257)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun contains!8808 (ListLongMap!21257 (_ BitVec 64)) Bool)

(assert (=> b!1329097 (contains!8808 lt!590902 k!1153)))

(declare-datatypes ((Unit!43739 0))(
  ( (Unit!43740) )
))
(declare-fun lt!590901 () Unit!43739)

(declare-fun minValue!1262 () V!53793)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!232 ((_ BitVec 64) (_ BitVec 64) V!53793 ListLongMap!21257) Unit!43739)

(assert (=> b!1329097 (= lt!590901 (lemmaInListMapAfterAddingDiffThenInBefore!232 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!590902))))

(declare-datatypes ((ValueCell!17360 0))(
  ( (ValueCellFull!17360 (v!20970 V!53793)) (EmptyCell!17360) )
))
(declare-datatypes ((array!89928 0))(
  ( (array!89929 (arr!43430 (Array (_ BitVec 32) ValueCell!17360)) (size!43980 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89928)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!53793)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun +!4645 (ListLongMap!21257 tuple2!23600) ListLongMap!21257)

(declare-fun getCurrentListMapNoExtraKeys!6283 (array!89926 array!89928 (_ BitVec 32) (_ BitVec 32) V!53793 V!53793 (_ BitVec 32) Int) ListLongMap!21257)

(declare-fun get!21877 (ValueCell!17360 V!53793) V!53793)

(declare-fun dynLambda!3584 (Int (_ BitVec 64)) V!53793)

(assert (=> b!1329097 (= lt!590902 (+!4645 (getCurrentListMapNoExtraKeys!6283 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23601 (select (arr!43429 _keys!1590) from!1980) (get!21877 (select (arr!43430 _values!1320) from!1980) (dynLambda!3584 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!56449 () Bool)

(declare-fun mapRes!56449 () Bool)

(declare-fun tp!107458 () Bool)

(declare-fun e!757754 () Bool)

(assert (=> mapNonEmpty!56449 (= mapRes!56449 (and tp!107458 e!757754))))

(declare-fun mapValue!56449 () ValueCell!17360)

(declare-fun mapKey!56449 () (_ BitVec 32))

(declare-fun mapRest!56449 () (Array (_ BitVec 32) ValueCell!17360))

(assert (=> mapNonEmpty!56449 (= (arr!43430 _values!1320) (store mapRest!56449 mapKey!56449 mapValue!56449))))

(declare-fun b!1329098 () Bool)

(declare-fun res!881859 () Bool)

(assert (=> b!1329098 (=> (not res!881859) (not e!757752))))

(assert (=> b!1329098 (= res!881859 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1329099 () Bool)

(declare-fun res!881855 () Bool)

(assert (=> b!1329099 (=> (not res!881855) (not e!757752))))

(assert (=> b!1329099 (= res!881855 (and (= (size!43980 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43979 _keys!1590) (size!43980 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329100 () Bool)

(declare-fun res!881852 () Bool)

(assert (=> b!1329100 (=> (not res!881852) (not e!757752))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1329100 (= res!881852 (validKeyInArray!0 (select (arr!43429 _keys!1590) from!1980)))))

(declare-fun res!881854 () Bool)

(assert (=> start!112212 (=> (not res!881854) (not e!757752))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112212 (= res!881854 (validMask!0 mask!1998))))

(assert (=> start!112212 e!757752))

(declare-fun e!757756 () Bool)

(declare-fun array_inv!32767 (array!89928) Bool)

(assert (=> start!112212 (and (array_inv!32767 _values!1320) e!757756)))

(assert (=> start!112212 true))

(declare-fun array_inv!32768 (array!89926) Bool)

(assert (=> start!112212 (array_inv!32768 _keys!1590)))

(assert (=> start!112212 tp!107457))

(assert (=> start!112212 tp_is_empty!36517))

(declare-fun b!1329101 () Bool)

(declare-fun res!881853 () Bool)

(assert (=> b!1329101 (=> (not res!881853) (not e!757752))))

(assert (=> b!1329101 (= res!881853 (not (= (select (arr!43429 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1329102 () Bool)

(assert (=> b!1329102 (= e!757754 tp_is_empty!36517)))

(declare-fun b!1329103 () Bool)

(declare-fun res!881856 () Bool)

(assert (=> b!1329103 (=> (not res!881856) (not e!757752))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89926 (_ BitVec 32)) Bool)

(assert (=> b!1329103 (= res!881856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329104 () Bool)

(declare-fun res!881851 () Bool)

(assert (=> b!1329104 (=> (not res!881851) (not e!757752))))

(declare-fun getCurrentListMap!5634 (array!89926 array!89928 (_ BitVec 32) (_ BitVec 32) V!53793 V!53793 (_ BitVec 32) Int) ListLongMap!21257)

(assert (=> b!1329104 (= res!881851 (contains!8808 (getCurrentListMap!5634 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1329105 () Bool)

(assert (=> b!1329105 (= e!757756 (and e!757755 mapRes!56449))))

(declare-fun condMapEmpty!56449 () Bool)

(declare-fun mapDefault!56449 () ValueCell!17360)

