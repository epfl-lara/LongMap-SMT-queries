; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112332 () Bool)

(assert start!112332)

(declare-fun b_free!30727 () Bool)

(declare-fun b_next!30727 () Bool)

(assert (=> start!112332 (= b_free!30727 (not b_next!30727))))

(declare-fun tp!107818 () Bool)

(declare-fun b_and!49491 () Bool)

(assert (=> start!112332 (= tp!107818 b_and!49491)))

(declare-fun b!1331305 () Bool)

(declare-fun res!883442 () Bool)

(declare-fun e!758623 () Bool)

(assert (=> b!1331305 (=> (not res!883442) (not e!758623))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90093 0))(
  ( (array!90094 (arr!43513 (Array (_ BitVec 32) (_ BitVec 64))) (size!44065 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90093)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-datatypes ((V!53953 0))(
  ( (V!53954 (val!18393 Int)) )
))
(declare-fun minValue!1262 () V!53953)

(declare-fun zeroValue!1262 () V!53953)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17420 0))(
  ( (ValueCellFull!17420 (v!21029 V!53953)) (EmptyCell!17420) )
))
(declare-datatypes ((array!90095 0))(
  ( (array!90096 (arr!43514 (Array (_ BitVec 32) ValueCell!17420)) (size!44066 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90095)

(declare-datatypes ((tuple2!23760 0))(
  ( (tuple2!23761 (_1!11891 (_ BitVec 64)) (_2!11891 V!53953)) )
))
(declare-datatypes ((List!30898 0))(
  ( (Nil!30895) (Cons!30894 (h!32103 tuple2!23760) (t!45030 List!30898)) )
))
(declare-datatypes ((ListLongMap!21417 0))(
  ( (ListLongMap!21418 (toList!10724 List!30898)) )
))
(declare-fun contains!8816 (ListLongMap!21417 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5584 (array!90093 array!90095 (_ BitVec 32) (_ BitVec 32) V!53953 V!53953 (_ BitVec 32) Int) ListLongMap!21417)

(assert (=> b!1331305 (= res!883442 (contains!8816 (getCurrentListMap!5584 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1331306 () Bool)

(declare-fun res!883447 () Bool)

(assert (=> b!1331306 (=> (not res!883447) (not e!758623))))

(assert (=> b!1331306 (= res!883447 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44065 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1331307 () Bool)

(declare-fun e!758619 () Bool)

(declare-fun tp_is_empty!36637 () Bool)

(assert (=> b!1331307 (= e!758619 tp_is_empty!36637)))

(declare-fun b!1331308 () Bool)

(declare-fun res!883449 () Bool)

(assert (=> b!1331308 (=> (not res!883449) (not e!758623))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90093 (_ BitVec 32)) Bool)

(assert (=> b!1331308 (= res!883449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1331309 () Bool)

(declare-fun e!758622 () Bool)

(assert (=> b!1331309 (= e!758622 tp_is_empty!36637)))

(declare-fun b!1331310 () Bool)

(declare-fun res!883446 () Bool)

(assert (=> b!1331310 (=> (not res!883446) (not e!758623))))

(assert (=> b!1331310 (= res!883446 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1331311 () Bool)

(declare-fun res!883444 () Bool)

(assert (=> b!1331311 (=> (not res!883444) (not e!758623))))

(declare-datatypes ((List!30899 0))(
  ( (Nil!30896) (Cons!30895 (h!32104 (_ BitVec 64)) (t!45031 List!30899)) )
))
(declare-fun arrayNoDuplicates!0 (array!90093 (_ BitVec 32) List!30899) Bool)

(assert (=> b!1331311 (= res!883444 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30896))))

(declare-fun b!1331312 () Bool)

(assert (=> b!1331312 (= e!758623 (not true))))

(declare-fun lt!591326 () ListLongMap!21417)

(assert (=> b!1331312 (contains!8816 lt!591326 k0!1153)))

(declare-fun lt!591328 () V!53953)

(declare-datatypes ((Unit!43622 0))(
  ( (Unit!43623) )
))
(declare-fun lt!591324 () Unit!43622)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!261 ((_ BitVec 64) (_ BitVec 64) V!53953 ListLongMap!21417) Unit!43622)

(assert (=> b!1331312 (= lt!591324 (lemmaInListMapAfterAddingDiffThenInBefore!261 k0!1153 (select (arr!43513 _keys!1590) from!1980) lt!591328 lt!591326))))

(declare-fun lt!591325 () ListLongMap!21417)

(assert (=> b!1331312 (contains!8816 lt!591325 k0!1153)))

(declare-fun lt!591327 () Unit!43622)

(assert (=> b!1331312 (= lt!591327 (lemmaInListMapAfterAddingDiffThenInBefore!261 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591325))))

(declare-fun +!4705 (ListLongMap!21417 tuple2!23760) ListLongMap!21417)

(assert (=> b!1331312 (= lt!591325 (+!4705 lt!591326 (tuple2!23761 (select (arr!43513 _keys!1590) from!1980) lt!591328)))))

(declare-fun get!21944 (ValueCell!17420 V!53953) V!53953)

(declare-fun dynLambda!3635 (Int (_ BitVec 64)) V!53953)

(assert (=> b!1331312 (= lt!591328 (get!21944 (select (arr!43514 _values!1320) from!1980) (dynLambda!3635 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6343 (array!90093 array!90095 (_ BitVec 32) (_ BitVec 32) V!53953 V!53953 (_ BitVec 32) Int) ListLongMap!21417)

(assert (=> b!1331312 (= lt!591326 (getCurrentListMapNoExtraKeys!6343 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1331313 () Bool)

(declare-fun res!883445 () Bool)

(assert (=> b!1331313 (=> (not res!883445) (not e!758623))))

(assert (=> b!1331313 (= res!883445 (and (= (size!44066 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44065 _keys!1590) (size!44066 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56629 () Bool)

(declare-fun mapRes!56629 () Bool)

(assert (=> mapIsEmpty!56629 mapRes!56629))

(declare-fun b!1331314 () Bool)

(declare-fun res!883443 () Bool)

(assert (=> b!1331314 (=> (not res!883443) (not e!758623))))

(assert (=> b!1331314 (= res!883443 (not (= (select (arr!43513 _keys!1590) from!1980) k0!1153)))))

(declare-fun res!883448 () Bool)

(assert (=> start!112332 (=> (not res!883448) (not e!758623))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112332 (= res!883448 (validMask!0 mask!1998))))

(assert (=> start!112332 e!758623))

(declare-fun e!758620 () Bool)

(declare-fun array_inv!33005 (array!90095) Bool)

(assert (=> start!112332 (and (array_inv!33005 _values!1320) e!758620)))

(assert (=> start!112332 true))

(declare-fun array_inv!33006 (array!90093) Bool)

(assert (=> start!112332 (array_inv!33006 _keys!1590)))

(assert (=> start!112332 tp!107818))

(assert (=> start!112332 tp_is_empty!36637))

(declare-fun mapNonEmpty!56629 () Bool)

(declare-fun tp!107819 () Bool)

(assert (=> mapNonEmpty!56629 (= mapRes!56629 (and tp!107819 e!758622))))

(declare-fun mapValue!56629 () ValueCell!17420)

(declare-fun mapRest!56629 () (Array (_ BitVec 32) ValueCell!17420))

(declare-fun mapKey!56629 () (_ BitVec 32))

(assert (=> mapNonEmpty!56629 (= (arr!43514 _values!1320) (store mapRest!56629 mapKey!56629 mapValue!56629))))

(declare-fun b!1331315 () Bool)

(assert (=> b!1331315 (= e!758620 (and e!758619 mapRes!56629))))

(declare-fun condMapEmpty!56629 () Bool)

(declare-fun mapDefault!56629 () ValueCell!17420)

(assert (=> b!1331315 (= condMapEmpty!56629 (= (arr!43514 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17420)) mapDefault!56629)))))

(declare-fun b!1331316 () Bool)

(declare-fun res!883450 () Bool)

(assert (=> b!1331316 (=> (not res!883450) (not e!758623))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331316 (= res!883450 (validKeyInArray!0 (select (arr!43513 _keys!1590) from!1980)))))

(assert (= (and start!112332 res!883448) b!1331313))

(assert (= (and b!1331313 res!883445) b!1331308))

(assert (= (and b!1331308 res!883449) b!1331311))

(assert (= (and b!1331311 res!883444) b!1331306))

(assert (= (and b!1331306 res!883447) b!1331305))

(assert (= (and b!1331305 res!883442) b!1331314))

(assert (= (and b!1331314 res!883443) b!1331316))

(assert (= (and b!1331316 res!883450) b!1331310))

(assert (= (and b!1331310 res!883446) b!1331312))

(assert (= (and b!1331315 condMapEmpty!56629) mapIsEmpty!56629))

(assert (= (and b!1331315 (not condMapEmpty!56629)) mapNonEmpty!56629))

(get-info :version)

(assert (= (and mapNonEmpty!56629 ((_ is ValueCellFull!17420) mapValue!56629)) b!1331309))

(assert (= (and b!1331315 ((_ is ValueCellFull!17420) mapDefault!56629)) b!1331307))

(assert (= start!112332 b!1331315))

(declare-fun b_lambda!23977 () Bool)

(assert (=> (not b_lambda!23977) (not b!1331312)))

(declare-fun t!45029 () Bool)

(declare-fun tb!11935 () Bool)

(assert (=> (and start!112332 (= defaultEntry!1323 defaultEntry!1323) t!45029) tb!11935))

(declare-fun result!24949 () Bool)

(assert (=> tb!11935 (= result!24949 tp_is_empty!36637)))

(assert (=> b!1331312 t!45029))

(declare-fun b_and!49493 () Bool)

(assert (= b_and!49491 (and (=> t!45029 result!24949) b_and!49493)))

(declare-fun m!1219521 () Bool)

(assert (=> b!1331311 m!1219521))

(declare-fun m!1219523 () Bool)

(assert (=> b!1331312 m!1219523))

(declare-fun m!1219525 () Bool)

(assert (=> b!1331312 m!1219525))

(declare-fun m!1219527 () Bool)

(assert (=> b!1331312 m!1219527))

(declare-fun m!1219529 () Bool)

(assert (=> b!1331312 m!1219529))

(declare-fun m!1219531 () Bool)

(assert (=> b!1331312 m!1219531))

(declare-fun m!1219533 () Bool)

(assert (=> b!1331312 m!1219533))

(declare-fun m!1219535 () Bool)

(assert (=> b!1331312 m!1219535))

(declare-fun m!1219537 () Bool)

(assert (=> b!1331312 m!1219537))

(assert (=> b!1331312 m!1219525))

(declare-fun m!1219539 () Bool)

(assert (=> b!1331312 m!1219539))

(assert (=> b!1331312 m!1219523))

(assert (=> b!1331312 m!1219537))

(declare-fun m!1219541 () Bool)

(assert (=> b!1331312 m!1219541))

(declare-fun m!1219543 () Bool)

(assert (=> b!1331305 m!1219543))

(assert (=> b!1331305 m!1219543))

(declare-fun m!1219545 () Bool)

(assert (=> b!1331305 m!1219545))

(declare-fun m!1219547 () Bool)

(assert (=> mapNonEmpty!56629 m!1219547))

(assert (=> b!1331314 m!1219537))

(assert (=> b!1331316 m!1219537))

(assert (=> b!1331316 m!1219537))

(declare-fun m!1219549 () Bool)

(assert (=> b!1331316 m!1219549))

(declare-fun m!1219551 () Bool)

(assert (=> b!1331308 m!1219551))

(declare-fun m!1219553 () Bool)

(assert (=> start!112332 m!1219553))

(declare-fun m!1219555 () Bool)

(assert (=> start!112332 m!1219555))

(declare-fun m!1219557 () Bool)

(assert (=> start!112332 m!1219557))

(check-sat (not b!1331308) (not b_next!30727) (not b!1331311) b_and!49493 tp_is_empty!36637 (not b!1331305) (not b!1331312) (not b_lambda!23977) (not mapNonEmpty!56629) (not b!1331316) (not start!112332))
(check-sat b_and!49493 (not b_next!30727))
