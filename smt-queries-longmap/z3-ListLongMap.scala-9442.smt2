; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112260 () Bool)

(assert start!112260)

(declare-fun b_free!30655 () Bool)

(declare-fun b_next!30655 () Bool)

(assert (=> start!112260 (= b_free!30655 (not b_next!30655))))

(declare-fun tp!107602 () Bool)

(declare-fun b_and!49347 () Bool)

(assert (=> start!112260 (= tp!107602 b_and!49347)))

(declare-fun b!1329937 () Bool)

(declare-fun res!882475 () Bool)

(declare-fun e!758082 () Bool)

(assert (=> b!1329937 (=> (not res!882475) (not e!758082))))

(declare-datatypes ((array!89953 0))(
  ( (array!89954 (arr!43443 (Array (_ BitVec 32) (_ BitVec 64))) (size!43995 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89953)

(declare-datatypes ((List!30845 0))(
  ( (Nil!30842) (Cons!30841 (h!32050 (_ BitVec 64)) (t!44905 List!30845)) )
))
(declare-fun arrayNoDuplicates!0 (array!89953 (_ BitVec 32) List!30845) Bool)

(assert (=> b!1329937 (= res!882475 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30842))))

(declare-fun b!1329938 () Bool)

(declare-fun res!882470 () Bool)

(assert (=> b!1329938 (=> (not res!882470) (not e!758082))))

(declare-datatypes ((V!53857 0))(
  ( (V!53858 (val!18357 Int)) )
))
(declare-datatypes ((ValueCell!17384 0))(
  ( (ValueCellFull!17384 (v!20993 V!53857)) (EmptyCell!17384) )
))
(declare-datatypes ((array!89955 0))(
  ( (array!89956 (arr!43444 (Array (_ BitVec 32) ValueCell!17384)) (size!43996 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89955)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1329938 (= res!882470 (and (= (size!43996 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43995 _keys!1590) (size!43996 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329939 () Bool)

(declare-fun from!1980 () (_ BitVec 32))

(assert (=> b!1329939 (= e!758082 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!23698 0))(
  ( (tuple2!23699 (_1!11860 (_ BitVec 64)) (_2!11860 V!53857)) )
))
(declare-datatypes ((List!30846 0))(
  ( (Nil!30843) (Cons!30842 (h!32051 tuple2!23698) (t!44906 List!30846)) )
))
(declare-datatypes ((ListLongMap!21355 0))(
  ( (ListLongMap!21356 (toList!10693 List!30846)) )
))
(declare-fun lt!590859 () ListLongMap!21355)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8785 (ListLongMap!21355 (_ BitVec 64)) Bool)

(assert (=> b!1329939 (contains!8785 lt!590859 k0!1153)))

(declare-datatypes ((Unit!43568 0))(
  ( (Unit!43569) )
))
(declare-fun lt!590860 () Unit!43568)

(declare-fun minValue!1262 () V!53857)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!234 ((_ BitVec 64) (_ BitVec 64) V!53857 ListLongMap!21355) Unit!43568)

(assert (=> b!1329939 (= lt!590860 (lemmaInListMapAfterAddingDiffThenInBefore!234 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!590859))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!53857)

(declare-fun +!4678 (ListLongMap!21355 tuple2!23698) ListLongMap!21355)

(declare-fun getCurrentListMapNoExtraKeys!6316 (array!89953 array!89955 (_ BitVec 32) (_ BitVec 32) V!53857 V!53857 (_ BitVec 32) Int) ListLongMap!21355)

(declare-fun get!21893 (ValueCell!17384 V!53857) V!53857)

(declare-fun dynLambda!3608 (Int (_ BitVec 64)) V!53857)

(assert (=> b!1329939 (= lt!590859 (+!4678 (getCurrentListMapNoExtraKeys!6316 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23699 (select (arr!43443 _keys!1590) from!1980) (get!21893 (select (arr!43444 _values!1320) from!1980) (dynLambda!3608 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1329940 () Bool)

(declare-fun e!758081 () Bool)

(declare-fun tp_is_empty!36565 () Bool)

(assert (=> b!1329940 (= e!758081 tp_is_empty!36565)))

(declare-fun b!1329941 () Bool)

(declare-fun e!758079 () Bool)

(declare-fun mapRes!56521 () Bool)

(assert (=> b!1329941 (= e!758079 (and e!758081 mapRes!56521))))

(declare-fun condMapEmpty!56521 () Bool)

(declare-fun mapDefault!56521 () ValueCell!17384)

(assert (=> b!1329941 (= condMapEmpty!56521 (= (arr!43444 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17384)) mapDefault!56521)))))

(declare-fun b!1329942 () Bool)

(declare-fun res!882477 () Bool)

(assert (=> b!1329942 (=> (not res!882477) (not e!758082))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1329942 (= res!882477 (validKeyInArray!0 (select (arr!43443 _keys!1590) from!1980)))))

(declare-fun b!1329943 () Bool)

(declare-fun res!882472 () Bool)

(assert (=> b!1329943 (=> (not res!882472) (not e!758082))))

(assert (=> b!1329943 (= res!882472 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!882474 () Bool)

(assert (=> start!112260 (=> (not res!882474) (not e!758082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112260 (= res!882474 (validMask!0 mask!1998))))

(assert (=> start!112260 e!758082))

(declare-fun array_inv!32947 (array!89955) Bool)

(assert (=> start!112260 (and (array_inv!32947 _values!1320) e!758079)))

(assert (=> start!112260 true))

(declare-fun array_inv!32948 (array!89953) Bool)

(assert (=> start!112260 (array_inv!32948 _keys!1590)))

(assert (=> start!112260 tp!107602))

(assert (=> start!112260 tp_is_empty!36565))

(declare-fun mapIsEmpty!56521 () Bool)

(assert (=> mapIsEmpty!56521 mapRes!56521))

(declare-fun b!1329944 () Bool)

(declare-fun res!882473 () Bool)

(assert (=> b!1329944 (=> (not res!882473) (not e!758082))))

(assert (=> b!1329944 (= res!882473 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43995 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!56521 () Bool)

(declare-fun tp!107603 () Bool)

(declare-fun e!758080 () Bool)

(assert (=> mapNonEmpty!56521 (= mapRes!56521 (and tp!107603 e!758080))))

(declare-fun mapRest!56521 () (Array (_ BitVec 32) ValueCell!17384))

(declare-fun mapKey!56521 () (_ BitVec 32))

(declare-fun mapValue!56521 () ValueCell!17384)

(assert (=> mapNonEmpty!56521 (= (arr!43444 _values!1320) (store mapRest!56521 mapKey!56521 mapValue!56521))))

(declare-fun b!1329945 () Bool)

(assert (=> b!1329945 (= e!758080 tp_is_empty!36565)))

(declare-fun b!1329946 () Bool)

(declare-fun res!882478 () Bool)

(assert (=> b!1329946 (=> (not res!882478) (not e!758082))))

(declare-fun getCurrentListMap!5559 (array!89953 array!89955 (_ BitVec 32) (_ BitVec 32) V!53857 V!53857 (_ BitVec 32) Int) ListLongMap!21355)

(assert (=> b!1329946 (= res!882478 (contains!8785 (getCurrentListMap!5559 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1329947 () Bool)

(declare-fun res!882476 () Bool)

(assert (=> b!1329947 (=> (not res!882476) (not e!758082))))

(assert (=> b!1329947 (= res!882476 (not (= (select (arr!43443 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1329948 () Bool)

(declare-fun res!882471 () Bool)

(assert (=> b!1329948 (=> (not res!882471) (not e!758082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89953 (_ BitVec 32)) Bool)

(assert (=> b!1329948 (= res!882471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112260 res!882474) b!1329938))

(assert (= (and b!1329938 res!882470) b!1329948))

(assert (= (and b!1329948 res!882471) b!1329937))

(assert (= (and b!1329937 res!882475) b!1329944))

(assert (= (and b!1329944 res!882473) b!1329946))

(assert (= (and b!1329946 res!882478) b!1329947))

(assert (= (and b!1329947 res!882476) b!1329942))

(assert (= (and b!1329942 res!882477) b!1329943))

(assert (= (and b!1329943 res!882472) b!1329939))

(assert (= (and b!1329941 condMapEmpty!56521) mapIsEmpty!56521))

(assert (= (and b!1329941 (not condMapEmpty!56521)) mapNonEmpty!56521))

(get-info :version)

(assert (= (and mapNonEmpty!56521 ((_ is ValueCellFull!17384) mapValue!56521)) b!1329945))

(assert (= (and b!1329941 ((_ is ValueCellFull!17384) mapDefault!56521)) b!1329940))

(assert (= start!112260 b!1329941))

(declare-fun b_lambda!23905 () Bool)

(assert (=> (not b_lambda!23905) (not b!1329939)))

(declare-fun t!44904 () Bool)

(declare-fun tb!11863 () Bool)

(assert (=> (and start!112260 (= defaultEntry!1323 defaultEntry!1323) t!44904) tb!11863))

(declare-fun result!24805 () Bool)

(assert (=> tb!11863 (= result!24805 tp_is_empty!36565)))

(assert (=> b!1329939 t!44904))

(declare-fun b_and!49349 () Bool)

(assert (= b_and!49347 (and (=> t!44904 result!24805) b_and!49349)))

(declare-fun m!1218189 () Bool)

(assert (=> b!1329948 m!1218189))

(declare-fun m!1218191 () Bool)

(assert (=> b!1329937 m!1218191))

(declare-fun m!1218193 () Bool)

(assert (=> mapNonEmpty!56521 m!1218193))

(declare-fun m!1218195 () Bool)

(assert (=> b!1329942 m!1218195))

(assert (=> b!1329942 m!1218195))

(declare-fun m!1218197 () Bool)

(assert (=> b!1329942 m!1218197))

(declare-fun m!1218199 () Bool)

(assert (=> start!112260 m!1218199))

(declare-fun m!1218201 () Bool)

(assert (=> start!112260 m!1218201))

(declare-fun m!1218203 () Bool)

(assert (=> start!112260 m!1218203))

(declare-fun m!1218205 () Bool)

(assert (=> b!1329939 m!1218205))

(declare-fun m!1218207 () Bool)

(assert (=> b!1329939 m!1218207))

(declare-fun m!1218209 () Bool)

(assert (=> b!1329939 m!1218209))

(declare-fun m!1218211 () Bool)

(assert (=> b!1329939 m!1218211))

(declare-fun m!1218213 () Bool)

(assert (=> b!1329939 m!1218213))

(assert (=> b!1329939 m!1218207))

(declare-fun m!1218215 () Bool)

(assert (=> b!1329939 m!1218215))

(declare-fun m!1218217 () Bool)

(assert (=> b!1329939 m!1218217))

(assert (=> b!1329939 m!1218209))

(assert (=> b!1329939 m!1218213))

(assert (=> b!1329939 m!1218195))

(assert (=> b!1329947 m!1218195))

(declare-fun m!1218219 () Bool)

(assert (=> b!1329946 m!1218219))

(assert (=> b!1329946 m!1218219))

(declare-fun m!1218221 () Bool)

(assert (=> b!1329946 m!1218221))

(check-sat (not b_lambda!23905) (not b!1329946) b_and!49349 tp_is_empty!36565 (not b!1329937) (not mapNonEmpty!56521) (not start!112260) (not b!1329942) (not b!1329948) (not b_next!30655) (not b!1329939))
(check-sat b_and!49349 (not b_next!30655))
