; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112220 () Bool)

(assert start!112220)

(declare-fun b_free!30615 () Bool)

(declare-fun b_next!30615 () Bool)

(assert (=> start!112220 (= b_free!30615 (not b_next!30615))))

(declare-fun tp!107481 () Bool)

(declare-fun b_and!49285 () Bool)

(assert (=> start!112220 (= tp!107481 b_and!49285)))

(declare-fun b!1329247 () Bool)

(declare-fun res!881964 () Bool)

(declare-fun e!757812 () Bool)

(assert (=> b!1329247 (=> (not res!881964) (not e!757812))))

(declare-datatypes ((V!53803 0))(
  ( (V!53804 (val!18337 Int)) )
))
(declare-datatypes ((ValueCell!17364 0))(
  ( (ValueCellFull!17364 (v!20974 V!53803)) (EmptyCell!17364) )
))
(declare-datatypes ((array!89942 0))(
  ( (array!89943 (arr!43437 (Array (_ BitVec 32) ValueCell!17364)) (size!43987 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89942)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89944 0))(
  ( (array!89945 (arr!43438 (Array (_ BitVec 32) (_ BitVec 64))) (size!43988 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89944)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53803)

(declare-fun zeroValue!1262 () V!53803)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23608 0))(
  ( (tuple2!23609 (_1!11815 (_ BitVec 64)) (_2!11815 V!53803)) )
))
(declare-datatypes ((List!30762 0))(
  ( (Nil!30759) (Cons!30758 (h!31967 tuple2!23608) (t!44790 List!30762)) )
))
(declare-datatypes ((ListLongMap!21265 0))(
  ( (ListLongMap!21266 (toList!10648 List!30762)) )
))
(declare-fun contains!8812 (ListLongMap!21265 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5638 (array!89944 array!89942 (_ BitVec 32) (_ BitVec 32) V!53803 V!53803 (_ BitVec 32) Int) ListLongMap!21265)

(assert (=> b!1329247 (= res!881964 (contains!8812 (getCurrentListMap!5638 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1329248 () Bool)

(declare-fun res!881960 () Bool)

(assert (=> b!1329248 (=> (not res!881960) (not e!757812))))

(assert (=> b!1329248 (= res!881960 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43988 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1329249 () Bool)

(declare-fun res!881961 () Bool)

(assert (=> b!1329249 (=> (not res!881961) (not e!757812))))

(assert (=> b!1329249 (= res!881961 (and (= (size!43987 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43988 _keys!1590) (size!43987 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329250 () Bool)

(assert (=> b!1329250 (= e!757812 (not true))))

(declare-fun lt!590925 () ListLongMap!21265)

(assert (=> b!1329250 (contains!8812 lt!590925 k0!1153)))

(declare-datatypes ((Unit!43745 0))(
  ( (Unit!43746) )
))
(declare-fun lt!590926 () Unit!43745)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!235 ((_ BitVec 64) (_ BitVec 64) V!53803 ListLongMap!21265) Unit!43745)

(assert (=> b!1329250 (= lt!590926 (lemmaInListMapAfterAddingDiffThenInBefore!235 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!590925))))

(declare-fun +!4648 (ListLongMap!21265 tuple2!23608) ListLongMap!21265)

(declare-fun getCurrentListMapNoExtraKeys!6286 (array!89944 array!89942 (_ BitVec 32) (_ BitVec 32) V!53803 V!53803 (_ BitVec 32) Int) ListLongMap!21265)

(declare-fun get!21882 (ValueCell!17364 V!53803) V!53803)

(declare-fun dynLambda!3587 (Int (_ BitVec 64)) V!53803)

(assert (=> b!1329250 (= lt!590925 (+!4648 (getCurrentListMapNoExtraKeys!6286 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23609 (select (arr!43438 _keys!1590) from!1980) (get!21882 (select (arr!43437 _values!1320) from!1980) (dynLambda!3587 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1329251 () Bool)

(declare-fun res!881962 () Bool)

(assert (=> b!1329251 (=> (not res!881962) (not e!757812))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89944 (_ BitVec 32)) Bool)

(assert (=> b!1329251 (= res!881962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapIsEmpty!56461 () Bool)

(declare-fun mapRes!56461 () Bool)

(assert (=> mapIsEmpty!56461 mapRes!56461))

(declare-fun b!1329252 () Bool)

(declare-fun e!757816 () Bool)

(declare-fun tp_is_empty!36525 () Bool)

(assert (=> b!1329252 (= e!757816 tp_is_empty!36525)))

(declare-fun b!1329253 () Bool)

(declare-fun res!881959 () Bool)

(assert (=> b!1329253 (=> (not res!881959) (not e!757812))))

(assert (=> b!1329253 (= res!881959 (not (= (select (arr!43438 _keys!1590) from!1980) k0!1153)))))

(declare-fun res!881967 () Bool)

(assert (=> start!112220 (=> (not res!881967) (not e!757812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112220 (= res!881967 (validMask!0 mask!1998))))

(assert (=> start!112220 e!757812))

(declare-fun e!757815 () Bool)

(declare-fun array_inv!32775 (array!89942) Bool)

(assert (=> start!112220 (and (array_inv!32775 _values!1320) e!757815)))

(assert (=> start!112220 true))

(declare-fun array_inv!32776 (array!89944) Bool)

(assert (=> start!112220 (array_inv!32776 _keys!1590)))

(assert (=> start!112220 tp!107481))

(assert (=> start!112220 tp_is_empty!36525))

(declare-fun b!1329254 () Bool)

(declare-fun res!881963 () Bool)

(assert (=> b!1329254 (=> (not res!881963) (not e!757812))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1329254 (= res!881963 (validKeyInArray!0 (select (arr!43438 _keys!1590) from!1980)))))

(declare-fun b!1329255 () Bool)

(declare-fun e!757813 () Bool)

(assert (=> b!1329255 (= e!757813 tp_is_empty!36525)))

(declare-fun b!1329256 () Bool)

(assert (=> b!1329256 (= e!757815 (and e!757816 mapRes!56461))))

(declare-fun condMapEmpty!56461 () Bool)

(declare-fun mapDefault!56461 () ValueCell!17364)

(assert (=> b!1329256 (= condMapEmpty!56461 (= (arr!43437 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17364)) mapDefault!56461)))))

(declare-fun mapNonEmpty!56461 () Bool)

(declare-fun tp!107482 () Bool)

(assert (=> mapNonEmpty!56461 (= mapRes!56461 (and tp!107482 e!757813))))

(declare-fun mapKey!56461 () (_ BitVec 32))

(declare-fun mapRest!56461 () (Array (_ BitVec 32) ValueCell!17364))

(declare-fun mapValue!56461 () ValueCell!17364)

(assert (=> mapNonEmpty!56461 (= (arr!43437 _values!1320) (store mapRest!56461 mapKey!56461 mapValue!56461))))

(declare-fun b!1329257 () Bool)

(declare-fun res!881965 () Bool)

(assert (=> b!1329257 (=> (not res!881965) (not e!757812))))

(assert (=> b!1329257 (= res!881965 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1329258 () Bool)

(declare-fun res!881966 () Bool)

(assert (=> b!1329258 (=> (not res!881966) (not e!757812))))

(declare-datatypes ((List!30763 0))(
  ( (Nil!30760) (Cons!30759 (h!31968 (_ BitVec 64)) (t!44791 List!30763)) )
))
(declare-fun arrayNoDuplicates!0 (array!89944 (_ BitVec 32) List!30763) Bool)

(assert (=> b!1329258 (= res!881966 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30760))))

(assert (= (and start!112220 res!881967) b!1329249))

(assert (= (and b!1329249 res!881961) b!1329251))

(assert (= (and b!1329251 res!881962) b!1329258))

(assert (= (and b!1329258 res!881966) b!1329248))

(assert (= (and b!1329248 res!881960) b!1329247))

(assert (= (and b!1329247 res!881964) b!1329253))

(assert (= (and b!1329253 res!881959) b!1329254))

(assert (= (and b!1329254 res!881963) b!1329257))

(assert (= (and b!1329257 res!881965) b!1329250))

(assert (= (and b!1329256 condMapEmpty!56461) mapIsEmpty!56461))

(assert (= (and b!1329256 (not condMapEmpty!56461)) mapNonEmpty!56461))

(get-info :version)

(assert (= (and mapNonEmpty!56461 ((_ is ValueCellFull!17364) mapValue!56461)) b!1329255))

(assert (= (and b!1329256 ((_ is ValueCellFull!17364) mapDefault!56461)) b!1329252))

(assert (= start!112220 b!1329256))

(declare-fun b_lambda!23875 () Bool)

(assert (=> (not b_lambda!23875) (not b!1329250)))

(declare-fun t!44789 () Bool)

(declare-fun tb!11831 () Bool)

(assert (=> (and start!112220 (= defaultEntry!1323 defaultEntry!1323) t!44789) tb!11831))

(declare-fun result!24733 () Bool)

(assert (=> tb!11831 (= result!24733 tp_is_empty!36525)))

(assert (=> b!1329250 t!44789))

(declare-fun b_and!49287 () Bool)

(assert (= b_and!49285 (and (=> t!44789 result!24733) b_and!49287)))

(declare-fun m!1218025 () Bool)

(assert (=> b!1329253 m!1218025))

(assert (=> b!1329254 m!1218025))

(assert (=> b!1329254 m!1218025))

(declare-fun m!1218027 () Bool)

(assert (=> b!1329254 m!1218027))

(declare-fun m!1218029 () Bool)

(assert (=> b!1329258 m!1218029))

(declare-fun m!1218031 () Bool)

(assert (=> start!112220 m!1218031))

(declare-fun m!1218033 () Bool)

(assert (=> start!112220 m!1218033))

(declare-fun m!1218035 () Bool)

(assert (=> start!112220 m!1218035))

(declare-fun m!1218037 () Bool)

(assert (=> b!1329251 m!1218037))

(declare-fun m!1218039 () Bool)

(assert (=> mapNonEmpty!56461 m!1218039))

(declare-fun m!1218041 () Bool)

(assert (=> b!1329247 m!1218041))

(assert (=> b!1329247 m!1218041))

(declare-fun m!1218043 () Bool)

(assert (=> b!1329247 m!1218043))

(declare-fun m!1218045 () Bool)

(assert (=> b!1329250 m!1218045))

(declare-fun m!1218047 () Bool)

(assert (=> b!1329250 m!1218047))

(declare-fun m!1218049 () Bool)

(assert (=> b!1329250 m!1218049))

(declare-fun m!1218051 () Bool)

(assert (=> b!1329250 m!1218051))

(declare-fun m!1218053 () Bool)

(assert (=> b!1329250 m!1218053))

(assert (=> b!1329250 m!1218047))

(declare-fun m!1218055 () Bool)

(assert (=> b!1329250 m!1218055))

(declare-fun m!1218057 () Bool)

(assert (=> b!1329250 m!1218057))

(assert (=> b!1329250 m!1218049))

(assert (=> b!1329250 m!1218053))

(assert (=> b!1329250 m!1218025))

(check-sat (not b!1329258) (not b_next!30615) b_and!49287 (not b!1329254) (not mapNonEmpty!56461) (not b!1329247) (not b!1329251) tp_is_empty!36525 (not b_lambda!23875) (not start!112220) (not b!1329250))
(check-sat b_and!49287 (not b_next!30615))
