; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12150 () Bool)

(assert start!12150)

(declare-fun b!102463 () Bool)

(declare-fun b_free!2497 () Bool)

(declare-fun b_next!2497 () Bool)

(assert (=> b!102463 (= b_free!2497 (not b_next!2497))))

(declare-fun tp!9804 () Bool)

(declare-fun b_and!6317 () Bool)

(assert (=> b!102463 (= tp!9804 b_and!6317)))

(declare-fun b!102471 () Bool)

(declare-fun b_free!2499 () Bool)

(declare-fun b_next!2499 () Bool)

(assert (=> b!102471 (= b_free!2499 (not b_next!2499))))

(declare-fun tp!9802 () Bool)

(declare-fun b_and!6319 () Bool)

(assert (=> b!102471 (= tp!9802 b_and!6319)))

(declare-fun mapIsEmpty!3875 () Bool)

(declare-fun mapRes!3875 () Bool)

(assert (=> mapIsEmpty!3875 mapRes!3875))

(declare-fun mapNonEmpty!3875 () Bool)

(declare-fun mapRes!3876 () Bool)

(declare-fun tp!9803 () Bool)

(declare-fun e!66732 () Bool)

(assert (=> mapNonEmpty!3875 (= mapRes!3876 (and tp!9803 e!66732))))

(declare-fun mapKey!3876 () (_ BitVec 32))

(declare-datatypes ((V!3201 0))(
  ( (V!3202 (val!1377 Int)) )
))
(declare-datatypes ((ValueCell!989 0))(
  ( (ValueCellFull!989 (v!2858 V!3201)) (EmptyCell!989) )
))
(declare-fun mapRest!3876 () (Array (_ BitVec 32) ValueCell!989))

(declare-fun mapValue!3875 () ValueCell!989)

(declare-datatypes ((array!4297 0))(
  ( (array!4298 (arr!2038 (Array (_ BitVec 32) (_ BitVec 64))) (size!2293 (_ BitVec 32))) )
))
(declare-datatypes ((array!4299 0))(
  ( (array!4300 (arr!2039 (Array (_ BitVec 32) ValueCell!989)) (size!2294 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!886 0))(
  ( (LongMapFixedSize!887 (defaultEntry!2554 Int) (mask!6686 (_ BitVec 32)) (extraKeys!2363 (_ BitVec 32)) (zeroValue!2431 V!3201) (minValue!2431 V!3201) (_size!492 (_ BitVec 32)) (_keys!4255 array!4297) (_values!2537 array!4299) (_vacant!492 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!886)

(assert (=> mapNonEmpty!3875 (= (arr!2039 (_values!2537 newMap!16)) (store mapRest!3876 mapKey!3876 mapValue!3875))))

(declare-fun b!102461 () Bool)

(declare-fun tp_is_empty!2665 () Bool)

(assert (=> b!102461 (= e!66732 tp_is_empty!2665)))

(declare-fun b!102462 () Bool)

(declare-fun e!66748 () Bool)

(declare-fun e!66747 () Bool)

(assert (=> b!102462 (= e!66748 e!66747)))

(declare-datatypes ((Cell!676 0))(
  ( (Cell!677 (v!2859 LongMapFixedSize!886)) )
))
(declare-datatypes ((LongMap!676 0))(
  ( (LongMap!677 (underlying!349 Cell!676)) )
))
(declare-fun thiss!992 () LongMap!676)

(declare-fun e!66741 () Bool)

(declare-fun array_inv!1283 (array!4297) Bool)

(declare-fun array_inv!1284 (array!4299) Bool)

(assert (=> b!102463 (= e!66747 (and tp!9804 tp_is_empty!2665 (array_inv!1283 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) (array_inv!1284 (_values!2537 (v!2859 (underlying!349 thiss!992)))) e!66741))))

(declare-fun b!102464 () Bool)

(declare-fun e!66735 () Bool)

(assert (=> b!102464 (= e!66741 (and e!66735 mapRes!3875))))

(declare-fun condMapEmpty!3875 () Bool)

(declare-fun mapDefault!3875 () ValueCell!989)

(assert (=> b!102464 (= condMapEmpty!3875 (= (arr!2039 (_values!2537 (v!2859 (underlying!349 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!989)) mapDefault!3875)))))

(declare-fun b!102465 () Bool)

(declare-fun e!66743 () Bool)

(assert (=> b!102465 (= e!66743 e!66748)))

(declare-fun b!102466 () Bool)

(declare-fun e!66739 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!102466 (= e!66739 (not (validMask!0 (mask!6686 (v!2859 (underlying!349 thiss!992))))))))

(declare-datatypes ((tuple2!2364 0))(
  ( (tuple2!2365 (_1!1193 (_ BitVec 64)) (_2!1193 V!3201)) )
))
(declare-datatypes ((List!1607 0))(
  ( (Nil!1604) (Cons!1603 (h!2199 tuple2!2364) (t!5648 List!1607)) )
))
(declare-datatypes ((ListLongMap!1533 0))(
  ( (ListLongMap!1534 (toList!782 List!1607)) )
))
(declare-fun lt!52002 () ListLongMap!1533)

(declare-fun lt!52005 () tuple2!2364)

(declare-fun lt!52011 () tuple2!2364)

(declare-fun +!132 (ListLongMap!1533 tuple2!2364) ListLongMap!1533)

(assert (=> b!102466 (= (+!132 (+!132 lt!52002 lt!52005) lt!52011) (+!132 (+!132 lt!52002 lt!52011) lt!52005))))

(assert (=> b!102466 (= lt!52011 (tuple2!2365 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2431 (v!2859 (underlying!349 thiss!992)))))))

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!52007 () V!3201)

(assert (=> b!102466 (= lt!52005 (tuple2!2365 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) lt!52007))))

(declare-datatypes ((Unit!3127 0))(
  ( (Unit!3128) )
))
(declare-fun lt!52010 () Unit!3127)

(declare-fun addCommutativeForDiffKeys!44 (ListLongMap!1533 (_ BitVec 64) V!3201 (_ BitVec 64) V!3201) Unit!3127)

(assert (=> b!102466 (= lt!52010 (addCommutativeForDiffKeys!44 lt!52002 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) lt!52007 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2431 (v!2859 (underlying!349 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!97 (array!4297 array!4299 (_ BitVec 32) (_ BitVec 32) V!3201 V!3201 (_ BitVec 32) Int) ListLongMap!1533)

(assert (=> b!102466 (= lt!52002 (getCurrentListMapNoExtraKeys!97 (_keys!4255 (v!2859 (underlying!349 thiss!992))) (_values!2537 (v!2859 (underlying!349 thiss!992))) (mask!6686 (v!2859 (underlying!349 thiss!992))) (extraKeys!2363 (v!2859 (underlying!349 thiss!992))) (zeroValue!2431 (v!2859 (underlying!349 thiss!992))) (minValue!2431 (v!2859 (underlying!349 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2554 (v!2859 (underlying!349 thiss!992)))))))

(declare-fun b!102467 () Bool)

(declare-fun res!51243 () Bool)

(declare-fun e!66738 () Bool)

(assert (=> b!102467 (=> (not res!51243) (not e!66738))))

(assert (=> b!102467 (= res!51243 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2293 (_keys!4255 (v!2859 (underlying!349 thiss!992)))))))))

(declare-fun b!102468 () Bool)

(declare-fun e!66742 () Bool)

(assert (=> b!102468 (= e!66738 e!66742)))

(declare-fun res!51245 () Bool)

(assert (=> b!102468 (=> (not res!51245) (not e!66742))))

(declare-fun lt!52003 () ListLongMap!1533)

(declare-fun lt!52001 () ListLongMap!1533)

(assert (=> b!102468 (= res!51245 (= lt!52003 lt!52001))))

(declare-fun map!1262 (LongMapFixedSize!886) ListLongMap!1533)

(assert (=> b!102468 (= lt!52001 (map!1262 newMap!16))))

(declare-fun getCurrentListMap!460 (array!4297 array!4299 (_ BitVec 32) (_ BitVec 32) V!3201 V!3201 (_ BitVec 32) Int) ListLongMap!1533)

(assert (=> b!102468 (= lt!52003 (getCurrentListMap!460 (_keys!4255 (v!2859 (underlying!349 thiss!992))) (_values!2537 (v!2859 (underlying!349 thiss!992))) (mask!6686 (v!2859 (underlying!349 thiss!992))) (extraKeys!2363 (v!2859 (underlying!349 thiss!992))) (zeroValue!2431 (v!2859 (underlying!349 thiss!992))) (minValue!2431 (v!2859 (underlying!349 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2554 (v!2859 (underlying!349 thiss!992)))))))

(declare-fun b!102469 () Bool)

(declare-fun res!51244 () Bool)

(assert (=> b!102469 (=> (not res!51244) (not e!66738))))

(assert (=> b!102469 (= res!51244 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6686 newMap!16)) (_size!492 (v!2859 (underlying!349 thiss!992)))))))

(declare-fun b!102470 () Bool)

(declare-fun e!66734 () Bool)

(assert (=> b!102470 (= e!66734 e!66739)))

(declare-fun res!51241 () Bool)

(assert (=> b!102470 (=> (not res!51241) (not e!66739))))

(declare-datatypes ((tuple2!2366 0))(
  ( (tuple2!2367 (_1!1194 Bool) (_2!1194 LongMapFixedSize!886)) )
))
(declare-fun lt!52009 () tuple2!2366)

(assert (=> b!102470 (= res!51241 (and (_1!1194 lt!52009) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!52004 () Unit!3127)

(declare-fun e!66745 () Unit!3127)

(assert (=> b!102470 (= lt!52004 e!66745)))

(declare-fun c!17607 () Bool)

(declare-fun contains!813 (ListLongMap!1533 (_ BitVec 64)) Bool)

(assert (=> b!102470 (= c!17607 (contains!813 lt!52001 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355)))))

(declare-fun update!156 (LongMapFixedSize!886 (_ BitVec 64) V!3201) tuple2!2366)

(assert (=> b!102470 (= lt!52009 (update!156 newMap!16 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) lt!52007))))

(declare-fun mapIsEmpty!3876 () Bool)

(assert (=> mapIsEmpty!3876 mapRes!3876))

(declare-fun b!102472 () Bool)

(assert (=> b!102472 (= e!66742 e!66734)))

(declare-fun res!51246 () Bool)

(assert (=> b!102472 (=> (not res!51246) (not e!66734))))

(assert (=> b!102472 (= res!51246 (and (not (= (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1318 (ValueCell!989 V!3201) V!3201)

(declare-fun dynLambda!379 (Int (_ BitVec 64)) V!3201)

(assert (=> b!102472 (= lt!52007 (get!1318 (select (arr!2039 (_values!2537 (v!2859 (underlying!349 thiss!992)))) from!355) (dynLambda!379 (defaultEntry!2554 (v!2859 (underlying!349 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!102473 () Bool)

(declare-fun Unit!3129 () Unit!3127)

(assert (=> b!102473 (= e!66745 Unit!3129)))

(declare-fun b!102474 () Bool)

(declare-fun res!51242 () Bool)

(assert (=> b!102474 (=> (not res!51242) (not e!66738))))

(declare-fun valid!414 (LongMapFixedSize!886) Bool)

(assert (=> b!102474 (= res!51242 (valid!414 newMap!16))))

(declare-fun b!102475 () Bool)

(assert (=> b!102475 (= e!66735 tp_is_empty!2665)))

(declare-fun mapNonEmpty!3876 () Bool)

(declare-fun tp!9801 () Bool)

(declare-fun e!66740 () Bool)

(assert (=> mapNonEmpty!3876 (= mapRes!3875 (and tp!9801 e!66740))))

(declare-fun mapValue!3876 () ValueCell!989)

(declare-fun mapKey!3875 () (_ BitVec 32))

(declare-fun mapRest!3875 () (Array (_ BitVec 32) ValueCell!989))

(assert (=> mapNonEmpty!3876 (= (arr!2039 (_values!2537 (v!2859 (underlying!349 thiss!992)))) (store mapRest!3875 mapKey!3875 mapValue!3876))))

(declare-fun b!102476 () Bool)

(declare-fun e!66744 () Bool)

(declare-fun e!66746 () Bool)

(assert (=> b!102476 (= e!66744 (and e!66746 mapRes!3876))))

(declare-fun condMapEmpty!3876 () Bool)

(declare-fun mapDefault!3876 () ValueCell!989)

(assert (=> b!102476 (= condMapEmpty!3876 (= (arr!2039 (_values!2537 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!989)) mapDefault!3876)))))

(declare-fun b!102477 () Bool)

(declare-fun Unit!3130 () Unit!3127)

(assert (=> b!102477 (= e!66745 Unit!3130)))

(declare-fun lt!52008 () Unit!3127)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!106 (array!4297 array!4299 (_ BitVec 32) (_ BitVec 32) V!3201 V!3201 (_ BitVec 64) (_ BitVec 32) Int) Unit!3127)

(assert (=> b!102477 (= lt!52008 (lemmaListMapContainsThenArrayContainsFrom!106 (_keys!4255 (v!2859 (underlying!349 thiss!992))) (_values!2537 (v!2859 (underlying!349 thiss!992))) (mask!6686 (v!2859 (underlying!349 thiss!992))) (extraKeys!2363 (v!2859 (underlying!349 thiss!992))) (zeroValue!2431 (v!2859 (underlying!349 thiss!992))) (minValue!2431 (v!2859 (underlying!349 thiss!992))) (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2554 (v!2859 (underlying!349 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!102477 (arrayContainsKey!0 (_keys!4255 (v!2859 (underlying!349 thiss!992))) (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!52000 () Unit!3127)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4297 (_ BitVec 32) (_ BitVec 32)) Unit!3127)

(assert (=> b!102477 (= lt!52000 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4255 (v!2859 (underlying!349 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1608 0))(
  ( (Nil!1605) (Cons!1604 (h!2200 (_ BitVec 64)) (t!5649 List!1608)) )
))
(declare-fun arrayNoDuplicates!0 (array!4297 (_ BitVec 32) List!1608) Bool)

(assert (=> b!102477 (arrayNoDuplicates!0 (_keys!4255 (v!2859 (underlying!349 thiss!992))) from!355 Nil!1605)))

(declare-fun lt!52006 () Unit!3127)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4297 (_ BitVec 32) (_ BitVec 64) List!1608) Unit!3127)

(assert (=> b!102477 (= lt!52006 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4255 (v!2859 (underlying!349 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) (Cons!1604 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) Nil!1605)))))

(assert (=> b!102477 false))

(declare-fun b!102478 () Bool)

(assert (=> b!102478 (= e!66740 tp_is_empty!2665)))

(declare-fun b!102479 () Bool)

(assert (=> b!102479 (= e!66746 tp_is_empty!2665)))

(declare-fun res!51247 () Bool)

(assert (=> start!12150 (=> (not res!51247) (not e!66738))))

(declare-fun valid!415 (LongMap!676) Bool)

(assert (=> start!12150 (= res!51247 (valid!415 thiss!992))))

(assert (=> start!12150 e!66738))

(assert (=> start!12150 e!66743))

(assert (=> start!12150 true))

(declare-fun e!66736 () Bool)

(assert (=> start!12150 e!66736))

(assert (=> b!102471 (= e!66736 (and tp!9802 tp_is_empty!2665 (array_inv!1283 (_keys!4255 newMap!16)) (array_inv!1284 (_values!2537 newMap!16)) e!66744))))

(assert (= (and start!12150 res!51247) b!102467))

(assert (= (and b!102467 res!51243) b!102474))

(assert (= (and b!102474 res!51242) b!102469))

(assert (= (and b!102469 res!51244) b!102468))

(assert (= (and b!102468 res!51245) b!102472))

(assert (= (and b!102472 res!51246) b!102470))

(assert (= (and b!102470 c!17607) b!102477))

(assert (= (and b!102470 (not c!17607)) b!102473))

(assert (= (and b!102470 res!51241) b!102466))

(assert (= (and b!102464 condMapEmpty!3875) mapIsEmpty!3875))

(assert (= (and b!102464 (not condMapEmpty!3875)) mapNonEmpty!3876))

(get-info :version)

(assert (= (and mapNonEmpty!3876 ((_ is ValueCellFull!989) mapValue!3876)) b!102478))

(assert (= (and b!102464 ((_ is ValueCellFull!989) mapDefault!3875)) b!102475))

(assert (= b!102463 b!102464))

(assert (= b!102462 b!102463))

(assert (= b!102465 b!102462))

(assert (= start!12150 b!102465))

(assert (= (and b!102476 condMapEmpty!3876) mapIsEmpty!3876))

(assert (= (and b!102476 (not condMapEmpty!3876)) mapNonEmpty!3875))

(assert (= (and mapNonEmpty!3875 ((_ is ValueCellFull!989) mapValue!3875)) b!102461))

(assert (= (and b!102476 ((_ is ValueCellFull!989) mapDefault!3876)) b!102479))

(assert (= b!102471 b!102476))

(assert (= start!12150 b!102471))

(declare-fun b_lambda!4573 () Bool)

(assert (=> (not b_lambda!4573) (not b!102472)))

(declare-fun t!5645 () Bool)

(declare-fun tb!2009 () Bool)

(assert (=> (and b!102463 (= (defaultEntry!2554 (v!2859 (underlying!349 thiss!992))) (defaultEntry!2554 (v!2859 (underlying!349 thiss!992)))) t!5645) tb!2009))

(declare-fun result!3391 () Bool)

(assert (=> tb!2009 (= result!3391 tp_is_empty!2665)))

(assert (=> b!102472 t!5645))

(declare-fun b_and!6321 () Bool)

(assert (= b_and!6317 (and (=> t!5645 result!3391) b_and!6321)))

(declare-fun tb!2011 () Bool)

(declare-fun t!5647 () Bool)

(assert (=> (and b!102471 (= (defaultEntry!2554 newMap!16) (defaultEntry!2554 (v!2859 (underlying!349 thiss!992)))) t!5647) tb!2011))

(declare-fun result!3395 () Bool)

(assert (= result!3395 result!3391))

(assert (=> b!102472 t!5647))

(declare-fun b_and!6323 () Bool)

(assert (= b_and!6319 (and (=> t!5647 result!3395) b_and!6323)))

(declare-fun m!113139 () Bool)

(assert (=> b!102466 m!113139))

(declare-fun m!113141 () Bool)

(assert (=> b!102466 m!113141))

(declare-fun m!113143 () Bool)

(assert (=> b!102466 m!113143))

(declare-fun m!113145 () Bool)

(assert (=> b!102466 m!113145))

(declare-fun m!113147 () Bool)

(assert (=> b!102466 m!113147))

(assert (=> b!102466 m!113141))

(assert (=> b!102466 m!113145))

(declare-fun m!113149 () Bool)

(assert (=> b!102466 m!113149))

(assert (=> b!102466 m!113147))

(declare-fun m!113151 () Bool)

(assert (=> b!102466 m!113151))

(declare-fun m!113153 () Bool)

(assert (=> b!102466 m!113153))

(declare-fun m!113155 () Bool)

(assert (=> b!102468 m!113155))

(declare-fun m!113157 () Bool)

(assert (=> b!102468 m!113157))

(declare-fun m!113159 () Bool)

(assert (=> start!12150 m!113159))

(declare-fun m!113161 () Bool)

(assert (=> b!102463 m!113161))

(declare-fun m!113163 () Bool)

(assert (=> b!102463 m!113163))

(declare-fun m!113165 () Bool)

(assert (=> mapNonEmpty!3875 m!113165))

(assert (=> b!102472 m!113147))

(declare-fun m!113167 () Bool)

(assert (=> b!102472 m!113167))

(declare-fun m!113169 () Bool)

(assert (=> b!102472 m!113169))

(assert (=> b!102472 m!113167))

(assert (=> b!102472 m!113169))

(declare-fun m!113171 () Bool)

(assert (=> b!102472 m!113171))

(declare-fun m!113173 () Bool)

(assert (=> mapNonEmpty!3876 m!113173))

(assert (=> b!102470 m!113147))

(assert (=> b!102470 m!113147))

(declare-fun m!113175 () Bool)

(assert (=> b!102470 m!113175))

(assert (=> b!102470 m!113147))

(declare-fun m!113177 () Bool)

(assert (=> b!102470 m!113177))

(declare-fun m!113179 () Bool)

(assert (=> b!102471 m!113179))

(declare-fun m!113181 () Bool)

(assert (=> b!102471 m!113181))

(declare-fun m!113183 () Bool)

(assert (=> b!102477 m!113183))

(declare-fun m!113185 () Bool)

(assert (=> b!102477 m!113185))

(assert (=> b!102477 m!113147))

(declare-fun m!113187 () Bool)

(assert (=> b!102477 m!113187))

(assert (=> b!102477 m!113147))

(assert (=> b!102477 m!113147))

(declare-fun m!113189 () Bool)

(assert (=> b!102477 m!113189))

(assert (=> b!102477 m!113147))

(declare-fun m!113191 () Bool)

(assert (=> b!102477 m!113191))

(declare-fun m!113193 () Bool)

(assert (=> b!102474 m!113193))

(check-sat (not b!102470) (not b!102468) (not b_next!2497) (not start!12150) (not b!102463) tp_is_empty!2665 (not b!102472) (not mapNonEmpty!3875) b_and!6323 (not mapNonEmpty!3876) (not b!102474) b_and!6321 (not b_lambda!4573) (not b_next!2499) (not b!102471) (not b!102466) (not b!102477))
(check-sat b_and!6321 b_and!6323 (not b_next!2497) (not b_next!2499))
(get-model)

(declare-fun b_lambda!4579 () Bool)

(assert (= b_lambda!4573 (or (and b!102463 b_free!2497) (and b!102471 b_free!2499 (= (defaultEntry!2554 newMap!16) (defaultEntry!2554 (v!2859 (underlying!349 thiss!992))))) b_lambda!4579)))

(check-sat (not b!102470) (not b!102468) (not b_next!2497) (not start!12150) (not b!102463) (not b_lambda!4579) tp_is_empty!2665 (not b!102472) (not mapNonEmpty!3875) b_and!6323 b_and!6321 (not mapNonEmpty!3876) (not b!102474) (not b_next!2499) (not b!102471) (not b!102466) (not b!102477))
(check-sat b_and!6321 b_and!6323 (not b_next!2497) (not b_next!2499))
(get-model)

(declare-fun d!27595 () Bool)

(assert (=> d!27595 (not (arrayContainsKey!0 (_keys!4255 (v!2859 (underlying!349 thiss!992))) (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!52086 () Unit!3127)

(declare-fun choose!68 (array!4297 (_ BitVec 32) (_ BitVec 64) List!1608) Unit!3127)

(assert (=> d!27595 (= lt!52086 (choose!68 (_keys!4255 (v!2859 (underlying!349 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) (Cons!1604 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) Nil!1605)))))

(assert (=> d!27595 (bvslt (size!2293 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!27595 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4255 (v!2859 (underlying!349 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) (Cons!1604 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) Nil!1605)) lt!52086)))

(declare-fun bs!4213 () Bool)

(assert (= bs!4213 d!27595))

(assert (=> bs!4213 m!113147))

(assert (=> bs!4213 m!113189))

(assert (=> bs!4213 m!113147))

(declare-fun m!113307 () Bool)

(assert (=> bs!4213 m!113307))

(assert (=> b!102477 d!27595))

(declare-fun d!27597 () Bool)

(assert (=> d!27597 (arrayNoDuplicates!0 (_keys!4255 (v!2859 (underlying!349 thiss!992))) from!355 Nil!1605)))

(declare-fun lt!52089 () Unit!3127)

(declare-fun choose!39 (array!4297 (_ BitVec 32) (_ BitVec 32)) Unit!3127)

(assert (=> d!27597 (= lt!52089 (choose!39 (_keys!4255 (v!2859 (underlying!349 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!27597 (bvslt (size!2293 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!27597 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4255 (v!2859 (underlying!349 thiss!992))) #b00000000000000000000000000000000 from!355) lt!52089)))

(declare-fun bs!4214 () Bool)

(assert (= bs!4214 d!27597))

(assert (=> bs!4214 m!113185))

(declare-fun m!113309 () Bool)

(assert (=> bs!4214 m!113309))

(assert (=> b!102477 d!27597))

(declare-fun d!27599 () Bool)

(declare-fun res!51294 () Bool)

(declare-fun e!66855 () Bool)

(assert (=> d!27599 (=> res!51294 e!66855)))

(assert (=> d!27599 (= res!51294 (= (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355)))))

(assert (=> d!27599 (= (arrayContainsKey!0 (_keys!4255 (v!2859 (underlying!349 thiss!992))) (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!66855)))

(declare-fun b!102604 () Bool)

(declare-fun e!66856 () Bool)

(assert (=> b!102604 (= e!66855 e!66856)))

(declare-fun res!51295 () Bool)

(assert (=> b!102604 (=> (not res!51295) (not e!66856))))

(assert (=> b!102604 (= res!51295 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2293 (_keys!4255 (v!2859 (underlying!349 thiss!992))))))))

(declare-fun b!102605 () Bool)

(assert (=> b!102605 (= e!66856 (arrayContainsKey!0 (_keys!4255 (v!2859 (underlying!349 thiss!992))) (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!27599 (not res!51294)) b!102604))

(assert (= (and b!102604 res!51295) b!102605))

(declare-fun m!113311 () Bool)

(assert (=> d!27599 m!113311))

(assert (=> b!102605 m!113147))

(declare-fun m!113313 () Bool)

(assert (=> b!102605 m!113313))

(assert (=> b!102477 d!27599))

(declare-fun d!27601 () Bool)

(declare-fun e!66859 () Bool)

(assert (=> d!27601 e!66859))

(declare-fun c!17616 () Bool)

(assert (=> d!27601 (= c!17616 (and (not (= (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!52092 () Unit!3127)

(declare-fun choose!642 (array!4297 array!4299 (_ BitVec 32) (_ BitVec 32) V!3201 V!3201 (_ BitVec 64) (_ BitVec 32) Int) Unit!3127)

(assert (=> d!27601 (= lt!52092 (choose!642 (_keys!4255 (v!2859 (underlying!349 thiss!992))) (_values!2537 (v!2859 (underlying!349 thiss!992))) (mask!6686 (v!2859 (underlying!349 thiss!992))) (extraKeys!2363 (v!2859 (underlying!349 thiss!992))) (zeroValue!2431 (v!2859 (underlying!349 thiss!992))) (minValue!2431 (v!2859 (underlying!349 thiss!992))) (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2554 (v!2859 (underlying!349 thiss!992)))))))

(assert (=> d!27601 (validMask!0 (mask!6686 (v!2859 (underlying!349 thiss!992))))))

(assert (=> d!27601 (= (lemmaListMapContainsThenArrayContainsFrom!106 (_keys!4255 (v!2859 (underlying!349 thiss!992))) (_values!2537 (v!2859 (underlying!349 thiss!992))) (mask!6686 (v!2859 (underlying!349 thiss!992))) (extraKeys!2363 (v!2859 (underlying!349 thiss!992))) (zeroValue!2431 (v!2859 (underlying!349 thiss!992))) (minValue!2431 (v!2859 (underlying!349 thiss!992))) (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2554 (v!2859 (underlying!349 thiss!992)))) lt!52092)))

(declare-fun b!102610 () Bool)

(assert (=> b!102610 (= e!66859 (arrayContainsKey!0 (_keys!4255 (v!2859 (underlying!349 thiss!992))) (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!102611 () Bool)

(assert (=> b!102611 (= e!66859 (ite (= (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2363 (v!2859 (underlying!349 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2363 (v!2859 (underlying!349 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!27601 c!17616) b!102610))

(assert (= (and d!27601 (not c!17616)) b!102611))

(assert (=> d!27601 m!113147))

(declare-fun m!113315 () Bool)

(assert (=> d!27601 m!113315))

(assert (=> d!27601 m!113139))

(assert (=> b!102610 m!113147))

(assert (=> b!102610 m!113189))

(assert (=> b!102477 d!27601))

(declare-fun d!27603 () Bool)

(declare-fun res!51304 () Bool)

(declare-fun e!66869 () Bool)

(assert (=> d!27603 (=> res!51304 e!66869)))

(assert (=> d!27603 (= res!51304 (bvsge from!355 (size!2293 (_keys!4255 (v!2859 (underlying!349 thiss!992))))))))

(assert (=> d!27603 (= (arrayNoDuplicates!0 (_keys!4255 (v!2859 (underlying!349 thiss!992))) from!355 Nil!1605) e!66869)))

(declare-fun call!10647 () Bool)

(declare-fun c!17619 () Bool)

(declare-fun bm!10644 () Bool)

(assert (=> bm!10644 (= call!10647 (arrayNoDuplicates!0 (_keys!4255 (v!2859 (underlying!349 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!17619 (Cons!1604 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) Nil!1605) Nil!1605)))))

(declare-fun b!102622 () Bool)

(declare-fun e!66868 () Bool)

(declare-fun e!66870 () Bool)

(assert (=> b!102622 (= e!66868 e!66870)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!102622 (= c!17619 (validKeyInArray!0 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355)))))

(declare-fun b!102623 () Bool)

(assert (=> b!102623 (= e!66869 e!66868)))

(declare-fun res!51303 () Bool)

(assert (=> b!102623 (=> (not res!51303) (not e!66868))))

(declare-fun e!66871 () Bool)

(assert (=> b!102623 (= res!51303 (not e!66871))))

(declare-fun res!51302 () Bool)

(assert (=> b!102623 (=> (not res!51302) (not e!66871))))

(assert (=> b!102623 (= res!51302 (validKeyInArray!0 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355)))))

(declare-fun b!102624 () Bool)

(declare-fun contains!814 (List!1608 (_ BitVec 64)) Bool)

(assert (=> b!102624 (= e!66871 (contains!814 Nil!1605 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355)))))

(declare-fun b!102625 () Bool)

(assert (=> b!102625 (= e!66870 call!10647)))

(declare-fun b!102626 () Bool)

(assert (=> b!102626 (= e!66870 call!10647)))

(assert (= (and d!27603 (not res!51304)) b!102623))

(assert (= (and b!102623 res!51302) b!102624))

(assert (= (and b!102623 res!51303) b!102622))

(assert (= (and b!102622 c!17619) b!102626))

(assert (= (and b!102622 (not c!17619)) b!102625))

(assert (= (or b!102626 b!102625) bm!10644))

(assert (=> bm!10644 m!113147))

(declare-fun m!113317 () Bool)

(assert (=> bm!10644 m!113317))

(assert (=> b!102622 m!113147))

(assert (=> b!102622 m!113147))

(declare-fun m!113319 () Bool)

(assert (=> b!102622 m!113319))

(assert (=> b!102623 m!113147))

(assert (=> b!102623 m!113147))

(assert (=> b!102623 m!113319))

(assert (=> b!102624 m!113147))

(assert (=> b!102624 m!113147))

(declare-fun m!113321 () Bool)

(assert (=> b!102624 m!113321))

(assert (=> b!102477 d!27603))

(declare-fun d!27605 () Bool)

(assert (=> d!27605 (= (array_inv!1283 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) (bvsge (size!2293 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!102463 d!27605))

(declare-fun d!27607 () Bool)

(assert (=> d!27607 (= (array_inv!1284 (_values!2537 (v!2859 (underlying!349 thiss!992)))) (bvsge (size!2294 (_values!2537 (v!2859 (underlying!349 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!102463 d!27607))

(declare-fun d!27609 () Bool)

(declare-fun c!17622 () Bool)

(assert (=> d!27609 (= c!17622 ((_ is ValueCellFull!989) (select (arr!2039 (_values!2537 (v!2859 (underlying!349 thiss!992)))) from!355)))))

(declare-fun e!66874 () V!3201)

(assert (=> d!27609 (= (get!1318 (select (arr!2039 (_values!2537 (v!2859 (underlying!349 thiss!992)))) from!355) (dynLambda!379 (defaultEntry!2554 (v!2859 (underlying!349 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!66874)))

(declare-fun b!102631 () Bool)

(declare-fun get!1321 (ValueCell!989 V!3201) V!3201)

(assert (=> b!102631 (= e!66874 (get!1321 (select (arr!2039 (_values!2537 (v!2859 (underlying!349 thiss!992)))) from!355) (dynLambda!379 (defaultEntry!2554 (v!2859 (underlying!349 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!102632 () Bool)

(declare-fun get!1322 (ValueCell!989 V!3201) V!3201)

(assert (=> b!102632 (= e!66874 (get!1322 (select (arr!2039 (_values!2537 (v!2859 (underlying!349 thiss!992)))) from!355) (dynLambda!379 (defaultEntry!2554 (v!2859 (underlying!349 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!27609 c!17622) b!102631))

(assert (= (and d!27609 (not c!17622)) b!102632))

(assert (=> b!102631 m!113167))

(assert (=> b!102631 m!113169))

(declare-fun m!113323 () Bool)

(assert (=> b!102631 m!113323))

(assert (=> b!102632 m!113167))

(assert (=> b!102632 m!113169))

(declare-fun m!113325 () Bool)

(assert (=> b!102632 m!113325))

(assert (=> b!102472 d!27609))

(declare-fun d!27611 () Bool)

(assert (=> d!27611 (= (map!1262 newMap!16) (getCurrentListMap!460 (_keys!4255 newMap!16) (_values!2537 newMap!16) (mask!6686 newMap!16) (extraKeys!2363 newMap!16) (zeroValue!2431 newMap!16) (minValue!2431 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2554 newMap!16)))))

(declare-fun bs!4215 () Bool)

(assert (= bs!4215 d!27611))

(declare-fun m!113327 () Bool)

(assert (=> bs!4215 m!113327))

(assert (=> b!102468 d!27611))

(declare-fun b!102675 () Bool)

(declare-fun e!66912 () Bool)

(declare-fun e!66905 () Bool)

(assert (=> b!102675 (= e!66912 e!66905)))

(declare-fun res!51325 () Bool)

(assert (=> b!102675 (=> (not res!51325) (not e!66905))))

(declare-fun lt!52140 () ListLongMap!1533)

(assert (=> b!102675 (= res!51325 (contains!813 lt!52140 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!102675 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2293 (_keys!4255 (v!2859 (underlying!349 thiss!992))))))))

(declare-fun b!102676 () Bool)

(declare-fun c!17636 () Bool)

(assert (=> b!102676 (= c!17636 (and (not (= (bvand (extraKeys!2363 (v!2859 (underlying!349 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2363 (v!2859 (underlying!349 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!66901 () ListLongMap!1533)

(declare-fun e!66910 () ListLongMap!1533)

(assert (=> b!102676 (= e!66901 e!66910)))

(declare-fun b!102677 () Bool)

(declare-fun e!66902 () Unit!3127)

(declare-fun Unit!3137 () Unit!3127)

(assert (=> b!102677 (= e!66902 Unit!3137)))

(declare-fun b!102678 () Bool)

(declare-fun res!51329 () Bool)

(declare-fun e!66903 () Bool)

(assert (=> b!102678 (=> (not res!51329) (not e!66903))))

(declare-fun e!66907 () Bool)

(assert (=> b!102678 (= res!51329 e!66907)))

(declare-fun c!17637 () Bool)

(assert (=> b!102678 (= c!17637 (not (= (bvand (extraKeys!2363 (v!2859 (underlying!349 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!102679 () Bool)

(declare-fun lt!52150 () Unit!3127)

(assert (=> b!102679 (= e!66902 lt!52150)))

(declare-fun lt!52138 () ListLongMap!1533)

(assert (=> b!102679 (= lt!52138 (getCurrentListMapNoExtraKeys!97 (_keys!4255 (v!2859 (underlying!349 thiss!992))) (_values!2537 (v!2859 (underlying!349 thiss!992))) (mask!6686 (v!2859 (underlying!349 thiss!992))) (extraKeys!2363 (v!2859 (underlying!349 thiss!992))) (zeroValue!2431 (v!2859 (underlying!349 thiss!992))) (minValue!2431 (v!2859 (underlying!349 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2554 (v!2859 (underlying!349 thiss!992)))))))

(declare-fun lt!52156 () (_ BitVec 64))

(assert (=> b!102679 (= lt!52156 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!52151 () (_ BitVec 64))

(assert (=> b!102679 (= lt!52151 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!52158 () Unit!3127)

(declare-fun addStillContains!72 (ListLongMap!1533 (_ BitVec 64) V!3201 (_ BitVec 64)) Unit!3127)

(assert (=> b!102679 (= lt!52158 (addStillContains!72 lt!52138 lt!52156 (zeroValue!2431 (v!2859 (underlying!349 thiss!992))) lt!52151))))

(assert (=> b!102679 (contains!813 (+!132 lt!52138 (tuple2!2365 lt!52156 (zeroValue!2431 (v!2859 (underlying!349 thiss!992))))) lt!52151)))

(declare-fun lt!52147 () Unit!3127)

(assert (=> b!102679 (= lt!52147 lt!52158)))

(declare-fun lt!52148 () ListLongMap!1533)

(assert (=> b!102679 (= lt!52148 (getCurrentListMapNoExtraKeys!97 (_keys!4255 (v!2859 (underlying!349 thiss!992))) (_values!2537 (v!2859 (underlying!349 thiss!992))) (mask!6686 (v!2859 (underlying!349 thiss!992))) (extraKeys!2363 (v!2859 (underlying!349 thiss!992))) (zeroValue!2431 (v!2859 (underlying!349 thiss!992))) (minValue!2431 (v!2859 (underlying!349 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2554 (v!2859 (underlying!349 thiss!992)))))))

(declare-fun lt!52157 () (_ BitVec 64))

(assert (=> b!102679 (= lt!52157 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!52153 () (_ BitVec 64))

(assert (=> b!102679 (= lt!52153 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!52143 () Unit!3127)

(declare-fun addApplyDifferent!72 (ListLongMap!1533 (_ BitVec 64) V!3201 (_ BitVec 64)) Unit!3127)

(assert (=> b!102679 (= lt!52143 (addApplyDifferent!72 lt!52148 lt!52157 (minValue!2431 (v!2859 (underlying!349 thiss!992))) lt!52153))))

(declare-fun apply!96 (ListLongMap!1533 (_ BitVec 64)) V!3201)

(assert (=> b!102679 (= (apply!96 (+!132 lt!52148 (tuple2!2365 lt!52157 (minValue!2431 (v!2859 (underlying!349 thiss!992))))) lt!52153) (apply!96 lt!52148 lt!52153))))

(declare-fun lt!52144 () Unit!3127)

(assert (=> b!102679 (= lt!52144 lt!52143)))

(declare-fun lt!52154 () ListLongMap!1533)

(assert (=> b!102679 (= lt!52154 (getCurrentListMapNoExtraKeys!97 (_keys!4255 (v!2859 (underlying!349 thiss!992))) (_values!2537 (v!2859 (underlying!349 thiss!992))) (mask!6686 (v!2859 (underlying!349 thiss!992))) (extraKeys!2363 (v!2859 (underlying!349 thiss!992))) (zeroValue!2431 (v!2859 (underlying!349 thiss!992))) (minValue!2431 (v!2859 (underlying!349 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2554 (v!2859 (underlying!349 thiss!992)))))))

(declare-fun lt!52139 () (_ BitVec 64))

(assert (=> b!102679 (= lt!52139 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!52142 () (_ BitVec 64))

(assert (=> b!102679 (= lt!52142 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!52145 () Unit!3127)

(assert (=> b!102679 (= lt!52145 (addApplyDifferent!72 lt!52154 lt!52139 (zeroValue!2431 (v!2859 (underlying!349 thiss!992))) lt!52142))))

(assert (=> b!102679 (= (apply!96 (+!132 lt!52154 (tuple2!2365 lt!52139 (zeroValue!2431 (v!2859 (underlying!349 thiss!992))))) lt!52142) (apply!96 lt!52154 lt!52142))))

(declare-fun lt!52149 () Unit!3127)

(assert (=> b!102679 (= lt!52149 lt!52145)))

(declare-fun lt!52141 () ListLongMap!1533)

(assert (=> b!102679 (= lt!52141 (getCurrentListMapNoExtraKeys!97 (_keys!4255 (v!2859 (underlying!349 thiss!992))) (_values!2537 (v!2859 (underlying!349 thiss!992))) (mask!6686 (v!2859 (underlying!349 thiss!992))) (extraKeys!2363 (v!2859 (underlying!349 thiss!992))) (zeroValue!2431 (v!2859 (underlying!349 thiss!992))) (minValue!2431 (v!2859 (underlying!349 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2554 (v!2859 (underlying!349 thiss!992)))))))

(declare-fun lt!52137 () (_ BitVec 64))

(assert (=> b!102679 (= lt!52137 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!52146 () (_ BitVec 64))

(assert (=> b!102679 (= lt!52146 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!102679 (= lt!52150 (addApplyDifferent!72 lt!52141 lt!52137 (minValue!2431 (v!2859 (underlying!349 thiss!992))) lt!52146))))

(assert (=> b!102679 (= (apply!96 (+!132 lt!52141 (tuple2!2365 lt!52137 (minValue!2431 (v!2859 (underlying!349 thiss!992))))) lt!52146) (apply!96 lt!52141 lt!52146))))

(declare-fun bm!10659 () Bool)

(declare-fun call!10666 () ListLongMap!1533)

(assert (=> bm!10659 (= call!10666 (getCurrentListMapNoExtraKeys!97 (_keys!4255 (v!2859 (underlying!349 thiss!992))) (_values!2537 (v!2859 (underlying!349 thiss!992))) (mask!6686 (v!2859 (underlying!349 thiss!992))) (extraKeys!2363 (v!2859 (underlying!349 thiss!992))) (zeroValue!2431 (v!2859 (underlying!349 thiss!992))) (minValue!2431 (v!2859 (underlying!349 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2554 (v!2859 (underlying!349 thiss!992)))))))

(declare-fun bm!10660 () Bool)

(declare-fun call!10664 () Bool)

(assert (=> bm!10660 (= call!10664 (contains!813 lt!52140 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!10661 () Bool)

(declare-fun call!10667 () ListLongMap!1533)

(assert (=> bm!10661 (= call!10667 call!10666)))

(declare-fun b!102680 () Bool)

(declare-fun e!66909 () Bool)

(assert (=> b!102680 (= e!66909 (validKeyInArray!0 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!102681 () Bool)

(declare-fun call!10668 () ListLongMap!1533)

(assert (=> b!102681 (= e!66910 call!10668)))

(declare-fun c!17638 () Bool)

(declare-fun call!10663 () ListLongMap!1533)

(declare-fun bm!10662 () Bool)

(declare-fun c!17635 () Bool)

(assert (=> bm!10662 (= call!10663 (+!132 (ite c!17638 call!10666 (ite c!17635 call!10667 call!10668)) (ite (or c!17638 c!17635) (tuple2!2365 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2431 (v!2859 (underlying!349 thiss!992)))) (tuple2!2365 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2431 (v!2859 (underlying!349 thiss!992)))))))))

(declare-fun b!102682 () Bool)

(declare-fun e!66906 () Bool)

(assert (=> b!102682 (= e!66907 e!66906)))

(declare-fun res!51328 () Bool)

(assert (=> b!102682 (= res!51328 call!10664)))

(assert (=> b!102682 (=> (not res!51328) (not e!66906))))

(declare-fun bm!10663 () Bool)

(declare-fun call!10662 () Bool)

(assert (=> bm!10663 (= call!10662 (contains!813 lt!52140 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!102683 () Bool)

(declare-fun e!66908 () Bool)

(declare-fun e!66911 () Bool)

(assert (=> b!102683 (= e!66908 e!66911)))

(declare-fun res!51326 () Bool)

(assert (=> b!102683 (= res!51326 call!10662)))

(assert (=> b!102683 (=> (not res!51326) (not e!66911))))

(declare-fun d!27613 () Bool)

(assert (=> d!27613 e!66903))

(declare-fun res!51330 () Bool)

(assert (=> d!27613 (=> (not res!51330) (not e!66903))))

(assert (=> d!27613 (= res!51330 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2293 (_keys!4255 (v!2859 (underlying!349 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2293 (_keys!4255 (v!2859 (underlying!349 thiss!992))))))))))

(declare-fun lt!52152 () ListLongMap!1533)

(assert (=> d!27613 (= lt!52140 lt!52152)))

(declare-fun lt!52155 () Unit!3127)

(assert (=> d!27613 (= lt!52155 e!66902)))

(declare-fun c!17640 () Bool)

(declare-fun e!66904 () Bool)

(assert (=> d!27613 (= c!17640 e!66904)))

(declare-fun res!51324 () Bool)

(assert (=> d!27613 (=> (not res!51324) (not e!66904))))

(assert (=> d!27613 (= res!51324 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2293 (_keys!4255 (v!2859 (underlying!349 thiss!992))))))))

(declare-fun e!66913 () ListLongMap!1533)

(assert (=> d!27613 (= lt!52152 e!66913)))

(assert (=> d!27613 (= c!17638 (and (not (= (bvand (extraKeys!2363 (v!2859 (underlying!349 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2363 (v!2859 (underlying!349 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27613 (validMask!0 (mask!6686 (v!2859 (underlying!349 thiss!992))))))

(assert (=> d!27613 (= (getCurrentListMap!460 (_keys!4255 (v!2859 (underlying!349 thiss!992))) (_values!2537 (v!2859 (underlying!349 thiss!992))) (mask!6686 (v!2859 (underlying!349 thiss!992))) (extraKeys!2363 (v!2859 (underlying!349 thiss!992))) (zeroValue!2431 (v!2859 (underlying!349 thiss!992))) (minValue!2431 (v!2859 (underlying!349 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2554 (v!2859 (underlying!349 thiss!992)))) lt!52140)))

(declare-fun b!102684 () Bool)

(assert (=> b!102684 (= e!66913 e!66901)))

(assert (=> b!102684 (= c!17635 (and (not (= (bvand (extraKeys!2363 (v!2859 (underlying!349 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2363 (v!2859 (underlying!349 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!102685 () Bool)

(assert (=> b!102685 (= e!66908 (not call!10662))))

(declare-fun bm!10664 () Bool)

(declare-fun call!10665 () ListLongMap!1533)

(assert (=> bm!10664 (= call!10665 call!10663)))

(declare-fun b!102686 () Bool)

(assert (=> b!102686 (= e!66901 call!10665)))

(declare-fun b!102687 () Bool)

(assert (=> b!102687 (= e!66907 (not call!10664))))

(declare-fun b!102688 () Bool)

(assert (=> b!102688 (= e!66910 call!10665)))

(declare-fun b!102689 () Bool)

(assert (=> b!102689 (= e!66906 (= (apply!96 lt!52140 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2431 (v!2859 (underlying!349 thiss!992)))))))

(declare-fun b!102690 () Bool)

(declare-fun res!51327 () Bool)

(assert (=> b!102690 (=> (not res!51327) (not e!66903))))

(assert (=> b!102690 (= res!51327 e!66912)))

(declare-fun res!51323 () Bool)

(assert (=> b!102690 (=> res!51323 e!66912)))

(assert (=> b!102690 (= res!51323 (not e!66909))))

(declare-fun res!51331 () Bool)

(assert (=> b!102690 (=> (not res!51331) (not e!66909))))

(assert (=> b!102690 (= res!51331 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2293 (_keys!4255 (v!2859 (underlying!349 thiss!992))))))))

(declare-fun b!102691 () Bool)

(assert (=> b!102691 (= e!66903 e!66908)))

(declare-fun c!17639 () Bool)

(assert (=> b!102691 (= c!17639 (not (= (bvand (extraKeys!2363 (v!2859 (underlying!349 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!102692 () Bool)

(assert (=> b!102692 (= e!66904 (validKeyInArray!0 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!10665 () Bool)

(assert (=> bm!10665 (= call!10668 call!10667)))

(declare-fun b!102693 () Bool)

(assert (=> b!102693 (= e!66913 (+!132 call!10663 (tuple2!2365 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2431 (v!2859 (underlying!349 thiss!992))))))))

(declare-fun b!102694 () Bool)

(assert (=> b!102694 (= e!66911 (= (apply!96 lt!52140 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2431 (v!2859 (underlying!349 thiss!992)))))))

(declare-fun b!102695 () Bool)

(assert (=> b!102695 (= e!66905 (= (apply!96 lt!52140 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1318 (select (arr!2039 (_values!2537 (v!2859 (underlying!349 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!379 (defaultEntry!2554 (v!2859 (underlying!349 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!102695 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2294 (_values!2537 (v!2859 (underlying!349 thiss!992))))))))

(assert (=> b!102695 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2293 (_keys!4255 (v!2859 (underlying!349 thiss!992))))))))

(assert (= (and d!27613 c!17638) b!102693))

(assert (= (and d!27613 (not c!17638)) b!102684))

(assert (= (and b!102684 c!17635) b!102686))

(assert (= (and b!102684 (not c!17635)) b!102676))

(assert (= (and b!102676 c!17636) b!102688))

(assert (= (and b!102676 (not c!17636)) b!102681))

(assert (= (or b!102688 b!102681) bm!10665))

(assert (= (or b!102686 bm!10665) bm!10661))

(assert (= (or b!102686 b!102688) bm!10664))

(assert (= (or b!102693 bm!10661) bm!10659))

(assert (= (or b!102693 bm!10664) bm!10662))

(assert (= (and d!27613 res!51324) b!102692))

(assert (= (and d!27613 c!17640) b!102679))

(assert (= (and d!27613 (not c!17640)) b!102677))

(assert (= (and d!27613 res!51330) b!102690))

(assert (= (and b!102690 res!51331) b!102680))

(assert (= (and b!102690 (not res!51323)) b!102675))

(assert (= (and b!102675 res!51325) b!102695))

(assert (= (and b!102690 res!51327) b!102678))

(assert (= (and b!102678 c!17637) b!102682))

(assert (= (and b!102678 (not c!17637)) b!102687))

(assert (= (and b!102682 res!51328) b!102689))

(assert (= (or b!102682 b!102687) bm!10660))

(assert (= (and b!102678 res!51329) b!102691))

(assert (= (and b!102691 c!17639) b!102683))

(assert (= (and b!102691 (not c!17639)) b!102685))

(assert (= (and b!102683 res!51326) b!102694))

(assert (= (or b!102683 b!102685) bm!10663))

(declare-fun b_lambda!4581 () Bool)

(assert (=> (not b_lambda!4581) (not b!102695)))

(assert (=> b!102695 t!5645))

(declare-fun b_and!6341 () Bool)

(assert (= b_and!6321 (and (=> t!5645 result!3391) b_and!6341)))

(assert (=> b!102695 t!5647))

(declare-fun b_and!6343 () Bool)

(assert (= b_and!6323 (and (=> t!5647 result!3395) b_and!6343)))

(assert (=> b!102675 m!113311))

(assert (=> b!102675 m!113311))

(declare-fun m!113329 () Bool)

(assert (=> b!102675 m!113329))

(assert (=> bm!10659 m!113153))

(assert (=> b!102695 m!113311))

(declare-fun m!113331 () Bool)

(assert (=> b!102695 m!113331))

(declare-fun m!113333 () Bool)

(assert (=> b!102695 m!113333))

(assert (=> b!102695 m!113333))

(assert (=> b!102695 m!113169))

(declare-fun m!113335 () Bool)

(assert (=> b!102695 m!113335))

(assert (=> b!102695 m!113311))

(assert (=> b!102695 m!113169))

(assert (=> b!102680 m!113311))

(assert (=> b!102680 m!113311))

(declare-fun m!113337 () Bool)

(assert (=> b!102680 m!113337))

(declare-fun m!113339 () Bool)

(assert (=> bm!10660 m!113339))

(assert (=> b!102692 m!113311))

(assert (=> b!102692 m!113311))

(assert (=> b!102692 m!113337))

(declare-fun m!113341 () Bool)

(assert (=> b!102694 m!113341))

(declare-fun m!113343 () Bool)

(assert (=> bm!10663 m!113343))

(declare-fun m!113345 () Bool)

(assert (=> b!102679 m!113345))

(declare-fun m!113347 () Bool)

(assert (=> b!102679 m!113347))

(declare-fun m!113349 () Bool)

(assert (=> b!102679 m!113349))

(declare-fun m!113351 () Bool)

(assert (=> b!102679 m!113351))

(assert (=> b!102679 m!113347))

(declare-fun m!113353 () Bool)

(assert (=> b!102679 m!113353))

(declare-fun m!113355 () Bool)

(assert (=> b!102679 m!113355))

(declare-fun m!113357 () Bool)

(assert (=> b!102679 m!113357))

(declare-fun m!113359 () Bool)

(assert (=> b!102679 m!113359))

(declare-fun m!113361 () Bool)

(assert (=> b!102679 m!113361))

(assert (=> b!102679 m!113311))

(assert (=> b!102679 m!113351))

(declare-fun m!113363 () Bool)

(assert (=> b!102679 m!113363))

(declare-fun m!113365 () Bool)

(assert (=> b!102679 m!113365))

(declare-fun m!113367 () Bool)

(assert (=> b!102679 m!113367))

(assert (=> b!102679 m!113367))

(declare-fun m!113369 () Bool)

(assert (=> b!102679 m!113369))

(assert (=> b!102679 m!113355))

(declare-fun m!113371 () Bool)

(assert (=> b!102679 m!113371))

(assert (=> b!102679 m!113153))

(declare-fun m!113373 () Bool)

(assert (=> b!102679 m!113373))

(assert (=> d!27613 m!113139))

(declare-fun m!113375 () Bool)

(assert (=> b!102689 m!113375))

(declare-fun m!113377 () Bool)

(assert (=> b!102693 m!113377))

(declare-fun m!113379 () Bool)

(assert (=> bm!10662 m!113379))

(assert (=> b!102468 d!27613))

(declare-fun d!27615 () Bool)

(declare-fun res!51338 () Bool)

(declare-fun e!66916 () Bool)

(assert (=> d!27615 (=> (not res!51338) (not e!66916))))

(declare-fun simpleValid!72 (LongMapFixedSize!886) Bool)

(assert (=> d!27615 (= res!51338 (simpleValid!72 newMap!16))))

(assert (=> d!27615 (= (valid!414 newMap!16) e!66916)))

(declare-fun b!102702 () Bool)

(declare-fun res!51339 () Bool)

(assert (=> b!102702 (=> (not res!51339) (not e!66916))))

(declare-fun arrayCountValidKeys!0 (array!4297 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!102702 (= res!51339 (= (arrayCountValidKeys!0 (_keys!4255 newMap!16) #b00000000000000000000000000000000 (size!2293 (_keys!4255 newMap!16))) (_size!492 newMap!16)))))

(declare-fun b!102703 () Bool)

(declare-fun res!51340 () Bool)

(assert (=> b!102703 (=> (not res!51340) (not e!66916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4297 (_ BitVec 32)) Bool)

(assert (=> b!102703 (= res!51340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4255 newMap!16) (mask!6686 newMap!16)))))

(declare-fun b!102704 () Bool)

(assert (=> b!102704 (= e!66916 (arrayNoDuplicates!0 (_keys!4255 newMap!16) #b00000000000000000000000000000000 Nil!1605))))

(assert (= (and d!27615 res!51338) b!102702))

(assert (= (and b!102702 res!51339) b!102703))

(assert (= (and b!102703 res!51340) b!102704))

(declare-fun m!113381 () Bool)

(assert (=> d!27615 m!113381))

(declare-fun m!113383 () Bool)

(assert (=> b!102702 m!113383))

(declare-fun m!113385 () Bool)

(assert (=> b!102703 m!113385))

(declare-fun m!113387 () Bool)

(assert (=> b!102704 m!113387))

(assert (=> b!102474 d!27615))

(declare-fun d!27617 () Bool)

(assert (=> d!27617 (= (valid!415 thiss!992) (valid!414 (v!2859 (underlying!349 thiss!992))))))

(declare-fun bs!4216 () Bool)

(assert (= bs!4216 d!27617))

(declare-fun m!113389 () Bool)

(assert (=> bs!4216 m!113389))

(assert (=> start!12150 d!27617))

(declare-fun d!27619 () Bool)

(declare-fun e!66922 () Bool)

(assert (=> d!27619 e!66922))

(declare-fun res!51343 () Bool)

(assert (=> d!27619 (=> res!51343 e!66922)))

(declare-fun lt!52167 () Bool)

(assert (=> d!27619 (= res!51343 (not lt!52167))))

(declare-fun lt!52170 () Bool)

(assert (=> d!27619 (= lt!52167 lt!52170)))

(declare-fun lt!52168 () Unit!3127)

(declare-fun e!66921 () Unit!3127)

(assert (=> d!27619 (= lt!52168 e!66921)))

(declare-fun c!17643 () Bool)

(assert (=> d!27619 (= c!17643 lt!52170)))

(declare-fun containsKey!156 (List!1607 (_ BitVec 64)) Bool)

(assert (=> d!27619 (= lt!52170 (containsKey!156 (toList!782 lt!52001) (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355)))))

(assert (=> d!27619 (= (contains!813 lt!52001 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355)) lt!52167)))

(declare-fun b!102711 () Bool)

(declare-fun lt!52169 () Unit!3127)

(assert (=> b!102711 (= e!66921 lt!52169)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!105 (List!1607 (_ BitVec 64)) Unit!3127)

(assert (=> b!102711 (= lt!52169 (lemmaContainsKeyImpliesGetValueByKeyDefined!105 (toList!782 lt!52001) (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355)))))

(declare-datatypes ((Option!158 0))(
  ( (Some!157 (v!2865 V!3201)) (None!156) )
))
(declare-fun isDefined!106 (Option!158) Bool)

(declare-fun getValueByKey!152 (List!1607 (_ BitVec 64)) Option!158)

(assert (=> b!102711 (isDefined!106 (getValueByKey!152 (toList!782 lt!52001) (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355)))))

(declare-fun b!102712 () Bool)

(declare-fun Unit!3138 () Unit!3127)

(assert (=> b!102712 (= e!66921 Unit!3138)))

(declare-fun b!102713 () Bool)

(assert (=> b!102713 (= e!66922 (isDefined!106 (getValueByKey!152 (toList!782 lt!52001) (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355))))))

(assert (= (and d!27619 c!17643) b!102711))

(assert (= (and d!27619 (not c!17643)) b!102712))

(assert (= (and d!27619 (not res!51343)) b!102713))

(assert (=> d!27619 m!113147))

(declare-fun m!113391 () Bool)

(assert (=> d!27619 m!113391))

(assert (=> b!102711 m!113147))

(declare-fun m!113393 () Bool)

(assert (=> b!102711 m!113393))

(assert (=> b!102711 m!113147))

(declare-fun m!113395 () Bool)

(assert (=> b!102711 m!113395))

(assert (=> b!102711 m!113395))

(declare-fun m!113397 () Bool)

(assert (=> b!102711 m!113397))

(assert (=> b!102713 m!113147))

(assert (=> b!102713 m!113395))

(assert (=> b!102713 m!113395))

(assert (=> b!102713 m!113397))

(assert (=> b!102470 d!27619))

(declare-fun b!102794 () Bool)

(declare-fun lt!52229 () Unit!3127)

(declare-fun lt!52234 () Unit!3127)

(assert (=> b!102794 (= lt!52229 lt!52234)))

(declare-fun call!10736 () ListLongMap!1533)

(declare-fun call!10733 () ListLongMap!1533)

(assert (=> b!102794 (= call!10736 call!10733)))

(declare-fun lt!52239 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!45 (array!4297 array!4299 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3201 V!3201 V!3201 Int) Unit!3127)

(assert (=> b!102794 (= lt!52234 (lemmaChangeZeroKeyThenAddPairToListMap!45 (_keys!4255 newMap!16) (_values!2537 newMap!16) (mask!6686 newMap!16) (extraKeys!2363 newMap!16) lt!52239 (zeroValue!2431 newMap!16) lt!52007 (minValue!2431 newMap!16) (defaultEntry!2554 newMap!16)))))

(assert (=> b!102794 (= lt!52239 (bvor (extraKeys!2363 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!66979 () tuple2!2366)

(assert (=> b!102794 (= e!66979 (tuple2!2367 true (LongMapFixedSize!887 (defaultEntry!2554 newMap!16) (mask!6686 newMap!16) (bvor (extraKeys!2363 newMap!16) #b00000000000000000000000000000001) lt!52007 (minValue!2431 newMap!16) (_size!492 newMap!16) (_keys!4255 newMap!16) (_values!2537 newMap!16) (_vacant!492 newMap!16))))))

(declare-fun b!102795 () Bool)

(declare-fun e!66970 () tuple2!2366)

(assert (=> b!102795 (= e!66970 e!66979)))

(declare-fun c!17675 () Bool)

(assert (=> b!102795 (= c!17675 (= (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!102796 () Bool)

(declare-fun e!66980 () Bool)

(declare-fun call!10721 () Bool)

(assert (=> b!102796 (= e!66980 (not call!10721))))

(declare-fun b!102797 () Bool)

(declare-fun c!17672 () Bool)

(declare-datatypes ((SeekEntryResult!260 0))(
  ( (MissingZero!260 (index!3187 (_ BitVec 32))) (Found!260 (index!3188 (_ BitVec 32))) (Intermediate!260 (undefined!1072 Bool) (index!3189 (_ BitVec 32)) (x!13460 (_ BitVec 32))) (Undefined!260) (MissingVacant!260 (index!3190 (_ BitVec 32))) )
))
(declare-fun lt!52233 () SeekEntryResult!260)

(assert (=> b!102797 (= c!17672 ((_ is MissingVacant!260) lt!52233))))

(declare-fun e!66976 () Bool)

(declare-fun e!66968 () Bool)

(assert (=> b!102797 (= e!66976 e!66968)))

(declare-fun b!102798 () Bool)

(declare-fun res!51382 () Bool)

(declare-fun lt!52232 () SeekEntryResult!260)

(assert (=> b!102798 (= res!51382 (= (select (arr!2038 (_keys!4255 newMap!16)) (index!3190 lt!52232)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!66981 () Bool)

(assert (=> b!102798 (=> (not res!51382) (not e!66981))))

(declare-fun call!10728 () Bool)

(declare-fun bm!10714 () Bool)

(assert (=> bm!10714 (= call!10728 (arrayContainsKey!0 (_keys!4255 newMap!16) (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!10715 () Bool)

(declare-fun call!10718 () ListLongMap!1533)

(assert (=> bm!10715 (= call!10736 call!10718)))

(declare-fun bm!10716 () Bool)

(declare-fun call!10726 () ListLongMap!1533)

(declare-fun lt!52248 () tuple2!2366)

(assert (=> bm!10716 (= call!10726 (map!1262 (_2!1194 lt!52248)))))

(declare-fun b!102800 () Bool)

(declare-fun e!66974 () ListLongMap!1533)

(declare-fun call!10723 () ListLongMap!1533)

(assert (=> b!102800 (= e!66974 call!10723)))

(declare-fun e!66973 () Bool)

(declare-fun lt!52242 () SeekEntryResult!260)

(declare-fun b!102801 () Bool)

(assert (=> b!102801 (= e!66973 (= (select (arr!2038 (_keys!4255 newMap!16)) (index!3188 lt!52242)) (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355)))))

(declare-fun d!27621 () Bool)

(declare-fun e!66975 () Bool)

(assert (=> d!27621 e!66975))

(declare-fun res!51379 () Bool)

(assert (=> d!27621 (=> (not res!51379) (not e!66975))))

(assert (=> d!27621 (= res!51379 (valid!414 (_2!1194 lt!52248)))))

(assert (=> d!27621 (= lt!52248 e!66970)))

(declare-fun c!17676 () Bool)

(assert (=> d!27621 (= c!17676 (= (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) (bvneg (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355))))))

(assert (=> d!27621 (valid!414 newMap!16)))

(assert (=> d!27621 (= (update!156 newMap!16 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) lt!52007) lt!52248)))

(declare-fun e!66966 () Bool)

(declare-fun call!10734 () ListLongMap!1533)

(declare-fun b!102799 () Bool)

(assert (=> b!102799 (= e!66966 (= call!10726 (+!132 call!10734 (tuple2!2365 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) lt!52007))))))

(declare-fun bm!10717 () Bool)

(declare-fun c!17673 () Bool)

(declare-fun c!17682 () Bool)

(assert (=> bm!10717 (= c!17673 c!17682)))

(declare-fun call!10725 () Bool)

(declare-fun lt!52235 () SeekEntryResult!260)

(assert (=> bm!10717 (= call!10725 (contains!813 e!66974 (ite c!17682 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) (select (arr!2038 (_keys!4255 newMap!16)) (index!3188 lt!52235)))))))

(declare-fun call!10739 () ListLongMap!1533)

(declare-fun bm!10718 () Bool)

(declare-fun call!10727 () ListLongMap!1533)

(assert (=> bm!10718 (= call!10718 (+!132 (ite c!17676 call!10727 call!10739) (ite c!17676 (ite c!17675 (tuple2!2365 #b0000000000000000000000000000000000000000000000000000000000000000 lt!52007) (tuple2!2365 #b1000000000000000000000000000000000000000000000000000000000000000 lt!52007)) (tuple2!2365 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) lt!52007))))))

(declare-fun b!102802 () Bool)

(declare-fun c!17671 () Bool)

(assert (=> b!102802 (= c!17671 ((_ is MissingVacant!260) lt!52235))))

(declare-fun e!66967 () tuple2!2366)

(declare-fun e!66978 () tuple2!2366)

(assert (=> b!102802 (= e!66967 e!66978)))

(declare-fun bm!10719 () Bool)

(assert (=> bm!10719 (= call!10727 call!10739)))

(declare-fun bm!10720 () Bool)

(declare-fun call!10719 () Bool)

(declare-fun call!10729 () Bool)

(assert (=> bm!10720 (= call!10719 call!10729)))

(declare-fun b!102803 () Bool)

(declare-fun lt!52247 () tuple2!2366)

(assert (=> b!102803 (= e!66978 (tuple2!2367 (_1!1194 lt!52247) (_2!1194 lt!52247)))))

(declare-fun call!10737 () tuple2!2366)

(assert (=> b!102803 (= lt!52247 call!10737)))

(declare-fun b!102804 () Bool)

(declare-fun e!66969 () Bool)

(assert (=> b!102804 (= e!66968 e!66969)))

(declare-fun res!51384 () Bool)

(declare-fun call!10738 () Bool)

(assert (=> b!102804 (= res!51384 call!10738)))

(assert (=> b!102804 (=> (not res!51384) (not e!66969))))

(declare-fun b!102805 () Bool)

(declare-fun c!17680 () Bool)

(assert (=> b!102805 (= c!17680 ((_ is MissingVacant!260) lt!52232))))

(declare-fun e!66984 () Bool)

(declare-fun e!66977 () Bool)

(assert (=> b!102805 (= e!66984 e!66977)))

(declare-fun bm!10721 () Bool)

(declare-fun call!10740 () SeekEntryResult!260)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4297 (_ BitVec 32)) SeekEntryResult!260)

(assert (=> bm!10721 (= call!10740 (seekEntryOrOpen!0 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) (_keys!4255 newMap!16) (mask!6686 newMap!16)))))

(declare-fun bm!10722 () Bool)

(declare-fun call!10722 () Unit!3127)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!45 (array!4297 array!4299 (_ BitVec 32) (_ BitVec 32) V!3201 V!3201 (_ BitVec 64) Int) Unit!3127)

(assert (=> bm!10722 (= call!10722 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!45 (_keys!4255 newMap!16) (_values!2537 newMap!16) (mask!6686 newMap!16) (extraKeys!2363 newMap!16) (zeroValue!2431 newMap!16) (minValue!2431 newMap!16) (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) (defaultEntry!2554 newMap!16)))))

(declare-fun b!102806 () Bool)

(assert (=> b!102806 (= e!66968 ((_ is Undefined!260) lt!52233))))

(declare-fun b!102807 () Bool)

(declare-fun lt!52243 () Unit!3127)

(declare-fun lt!52246 () Unit!3127)

(assert (=> b!102807 (= lt!52243 lt!52246)))

(assert (=> b!102807 (= call!10736 call!10733)))

(declare-fun lt!52245 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!45 (array!4297 array!4299 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3201 V!3201 V!3201 Int) Unit!3127)

(assert (=> b!102807 (= lt!52246 (lemmaChangeLongMinValueKeyThenAddPairToListMap!45 (_keys!4255 newMap!16) (_values!2537 newMap!16) (mask!6686 newMap!16) (extraKeys!2363 newMap!16) lt!52245 (zeroValue!2431 newMap!16) (minValue!2431 newMap!16) lt!52007 (defaultEntry!2554 newMap!16)))))

(assert (=> b!102807 (= lt!52245 (bvor (extraKeys!2363 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!102807 (= e!66979 (tuple2!2367 true (LongMapFixedSize!887 (defaultEntry!2554 newMap!16) (mask!6686 newMap!16) (bvor (extraKeys!2363 newMap!16) #b00000000000000000000000000000010) (zeroValue!2431 newMap!16) lt!52007 (_size!492 newMap!16) (_keys!4255 newMap!16) (_values!2537 newMap!16) (_vacant!492 newMap!16))))))

(declare-fun b!102808 () Bool)

(declare-fun res!51380 () Bool)

(declare-fun call!10732 () Bool)

(assert (=> b!102808 (= res!51380 call!10732)))

(assert (=> b!102808 (=> (not res!51380) (not e!66973))))

(declare-fun c!17679 () Bool)

(declare-fun bm!10723 () Bool)

(declare-fun c!17678 () Bool)

(declare-fun c!17674 () Bool)

(declare-fun call!10731 () Bool)

(declare-fun lt!52225 () SeekEntryResult!260)

(declare-fun c!17677 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!10723 (= call!10731 (inRange!0 (ite c!17682 (ite c!17678 (index!3188 lt!52242) (ite c!17677 (index!3187 lt!52233) (index!3190 lt!52233))) (ite c!17679 (index!3188 lt!52225) (ite c!17674 (index!3187 lt!52232) (index!3190 lt!52232)))) (mask!6686 newMap!16)))))

(declare-fun bm!10724 () Bool)

(declare-fun call!10735 () ListLongMap!1533)

(assert (=> bm!10724 (= call!10723 call!10735)))

(declare-fun b!102809 () Bool)

(declare-fun res!51383 () Bool)

(assert (=> b!102809 (=> (not res!51383) (not e!66980))))

(assert (=> b!102809 (= res!51383 (= (select (arr!2038 (_keys!4255 newMap!16)) (index!3187 lt!52232)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!102810 () Bool)

(declare-fun e!66971 () Bool)

(assert (=> b!102810 (= e!66971 e!66966)))

(declare-fun res!51385 () Bool)

(assert (=> b!102810 (= res!51385 (contains!813 call!10726 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355)))))

(assert (=> b!102810 (=> (not res!51385) (not e!66966))))

(declare-fun b!102811 () Bool)

(assert (=> b!102811 (= e!66977 ((_ is Undefined!260) lt!52232))))

(declare-fun bm!10725 () Bool)

(assert (=> bm!10725 (= call!10733 call!10735)))

(declare-fun bm!10726 () Bool)

(assert (=> bm!10726 (= call!10721 call!10728)))

(declare-fun b!102812 () Bool)

(assert (=> b!102812 (= e!66971 (= call!10726 call!10734))))

(declare-fun call!10717 () Unit!3127)

(declare-fun bm!10727 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!45 (array!4297 array!4299 (_ BitVec 32) (_ BitVec 32) V!3201 V!3201 (_ BitVec 64) Int) Unit!3127)

(assert (=> bm!10727 (= call!10717 (lemmaInListMapThenSeekEntryOrOpenFindsIt!45 (_keys!4255 newMap!16) (_values!2537 newMap!16) (mask!6686 newMap!16) (extraKeys!2363 newMap!16) (zeroValue!2431 newMap!16) (minValue!2431 newMap!16) (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) (defaultEntry!2554 newMap!16)))))

(declare-fun bm!10728 () Bool)

(declare-fun call!10724 () Bool)

(assert (=> bm!10728 (= call!10724 call!10728)))

(declare-fun b!102813 () Bool)

(assert (=> b!102813 (= e!66969 (not call!10724))))

(declare-fun bm!10729 () Bool)

(assert (=> bm!10729 (= call!10735 (getCurrentListMap!460 (_keys!4255 newMap!16) (ite (or c!17676 c!17682) (_values!2537 newMap!16) (array!4300 (store (arr!2039 (_values!2537 newMap!16)) (index!3188 lt!52235) (ValueCellFull!989 lt!52007)) (size!2294 (_values!2537 newMap!16)))) (mask!6686 newMap!16) (ite c!17676 (ite c!17675 lt!52239 lt!52245) (extraKeys!2363 newMap!16)) (ite (and c!17676 c!17675) lt!52007 (zeroValue!2431 newMap!16)) (ite c!17676 (ite c!17675 (minValue!2431 newMap!16) lt!52007) (minValue!2431 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2554 newMap!16)))))

(declare-fun b!102814 () Bool)

(declare-fun e!66965 () Unit!3127)

(declare-fun lt!52236 () Unit!3127)

(assert (=> b!102814 (= e!66965 lt!52236)))

(assert (=> b!102814 (= lt!52236 call!10722)))

(declare-fun call!10720 () SeekEntryResult!260)

(assert (=> b!102814 (= lt!52233 call!10720)))

(assert (=> b!102814 (= c!17677 ((_ is MissingZero!260) lt!52233))))

(assert (=> b!102814 e!66976))

(declare-fun b!102815 () Bool)

(declare-fun lt!52241 () Unit!3127)

(declare-fun lt!52251 () Unit!3127)

(assert (=> b!102815 (= lt!52241 lt!52251)))

(assert (=> b!102815 call!10725))

(declare-fun lt!52238 () array!4299)

(declare-fun lemmaValidKeyInArrayIsInListMap!104 (array!4297 array!4299 (_ BitVec 32) (_ BitVec 32) V!3201 V!3201 (_ BitVec 32) Int) Unit!3127)

(assert (=> b!102815 (= lt!52251 (lemmaValidKeyInArrayIsInListMap!104 (_keys!4255 newMap!16) lt!52238 (mask!6686 newMap!16) (extraKeys!2363 newMap!16) (zeroValue!2431 newMap!16) (minValue!2431 newMap!16) (index!3188 lt!52235) (defaultEntry!2554 newMap!16)))))

(assert (=> b!102815 (= lt!52238 (array!4300 (store (arr!2039 (_values!2537 newMap!16)) (index!3188 lt!52235) (ValueCellFull!989 lt!52007)) (size!2294 (_values!2537 newMap!16))))))

(declare-fun lt!52249 () Unit!3127)

(declare-fun lt!52227 () Unit!3127)

(assert (=> b!102815 (= lt!52249 lt!52227)))

(assert (=> b!102815 (= call!10718 call!10723)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!45 (array!4297 array!4299 (_ BitVec 32) (_ BitVec 32) V!3201 V!3201 (_ BitVec 32) (_ BitVec 64) V!3201 Int) Unit!3127)

(assert (=> b!102815 (= lt!52227 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!45 (_keys!4255 newMap!16) (_values!2537 newMap!16) (mask!6686 newMap!16) (extraKeys!2363 newMap!16) (zeroValue!2431 newMap!16) (minValue!2431 newMap!16) (index!3188 lt!52235) (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) lt!52007 (defaultEntry!2554 newMap!16)))))

(declare-fun lt!52250 () Unit!3127)

(declare-fun e!66985 () Unit!3127)

(assert (=> b!102815 (= lt!52250 e!66985)))

(assert (=> b!102815 (= c!17679 (contains!813 call!10739 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355)))))

(declare-fun e!66982 () tuple2!2366)

(assert (=> b!102815 (= e!66982 (tuple2!2367 true (LongMapFixedSize!887 (defaultEntry!2554 newMap!16) (mask!6686 newMap!16) (extraKeys!2363 newMap!16) (zeroValue!2431 newMap!16) (minValue!2431 newMap!16) (_size!492 newMap!16) (_keys!4255 newMap!16) (array!4300 (store (arr!2039 (_values!2537 newMap!16)) (index!3188 lt!52235) (ValueCellFull!989 lt!52007)) (size!2294 (_values!2537 newMap!16))) (_vacant!492 newMap!16))))))

(declare-fun b!102816 () Bool)

(declare-fun lt!52231 () Unit!3127)

(assert (=> b!102816 (= e!66985 lt!52231)))

(assert (=> b!102816 (= lt!52231 call!10717)))

(declare-fun call!10730 () SeekEntryResult!260)

(assert (=> b!102816 (= lt!52225 call!10730)))

(declare-fun res!51378 () Bool)

(assert (=> b!102816 (= res!51378 ((_ is Found!260) lt!52225))))

(declare-fun e!66983 () Bool)

(assert (=> b!102816 (=> (not res!51378) (not e!66983))))

(assert (=> b!102816 e!66983))

(declare-fun b!102817 () Bool)

(declare-fun res!51377 () Bool)

(declare-fun e!66972 () Bool)

(assert (=> b!102817 (=> (not res!51377) (not e!66972))))

(assert (=> b!102817 (= res!51377 call!10738)))

(assert (=> b!102817 (= e!66976 e!66972)))

(declare-fun b!102818 () Bool)

(declare-fun Unit!3139 () Unit!3127)

(assert (=> b!102818 (= e!66965 Unit!3139)))

(declare-fun lt!52228 () Unit!3127)

(assert (=> b!102818 (= lt!52228 call!10717)))

(assert (=> b!102818 (= lt!52242 call!10720)))

(declare-fun res!51372 () Bool)

(assert (=> b!102818 (= res!51372 ((_ is Found!260) lt!52242))))

(assert (=> b!102818 (=> (not res!51372) (not e!66973))))

(assert (=> b!102818 e!66973))

(declare-fun lt!52237 () Unit!3127)

(assert (=> b!102818 (= lt!52237 lt!52228)))

(assert (=> b!102818 false))

(declare-fun b!102819 () Bool)

(assert (=> b!102819 (= e!66975 e!66971)))

(declare-fun c!17670 () Bool)

(assert (=> b!102819 (= c!17670 (_1!1194 lt!52248))))

(declare-fun b!102820 () Bool)

(declare-fun Unit!3140 () Unit!3127)

(assert (=> b!102820 (= e!66985 Unit!3140)))

(declare-fun lt!52226 () Unit!3127)

(assert (=> b!102820 (= lt!52226 call!10722)))

(assert (=> b!102820 (= lt!52232 call!10730)))

(assert (=> b!102820 (= c!17674 ((_ is MissingZero!260) lt!52232))))

(assert (=> b!102820 e!66984))

(declare-fun lt!52244 () Unit!3127)

(assert (=> b!102820 (= lt!52244 lt!52226)))

(assert (=> b!102820 false))

(declare-fun b!102821 () Bool)

(assert (=> b!102821 (= e!66977 e!66981)))

(declare-fun res!51375 () Bool)

(assert (=> b!102821 (= res!51375 call!10719)))

(assert (=> b!102821 (=> (not res!51375) (not e!66981))))

(declare-fun b!102822 () Bool)

(declare-fun res!51381 () Bool)

(assert (=> b!102822 (=> (not res!51381) (not e!66972))))

(assert (=> b!102822 (= res!51381 (= (select (arr!2038 (_keys!4255 newMap!16)) (index!3187 lt!52233)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!10730 () Bool)

(assert (=> bm!10730 (= call!10720 call!10740)))

(declare-fun b!102823 () Bool)

(assert (=> b!102823 (= e!66970 e!66967)))

(assert (=> b!102823 (= lt!52235 (seekEntryOrOpen!0 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) (_keys!4255 newMap!16) (mask!6686 newMap!16)))))

(assert (=> b!102823 (= c!17682 ((_ is Undefined!260) lt!52235))))

(declare-fun b!102824 () Bool)

(declare-fun res!51374 () Bool)

(assert (=> b!102824 (= res!51374 call!10729)))

(assert (=> b!102824 (=> (not res!51374) (not e!66983))))

(declare-fun b!102825 () Bool)

(declare-fun res!51373 () Bool)

(assert (=> b!102825 (=> (not res!51373) (not e!66980))))

(assert (=> b!102825 (= res!51373 call!10719)))

(assert (=> b!102825 (= e!66984 e!66980)))

(declare-fun b!102826 () Bool)

(assert (=> b!102826 (= e!66978 e!66982)))

(declare-fun c!17681 () Bool)

(assert (=> b!102826 (= c!17681 ((_ is MissingZero!260) lt!52235))))

(declare-fun bm!10731 () Bool)

(assert (=> bm!10731 (= call!10734 (map!1262 newMap!16))))

(declare-fun b!102827 () Bool)

(declare-fun lt!52230 () Unit!3127)

(assert (=> b!102827 (= lt!52230 e!66965)))

(assert (=> b!102827 (= c!17678 call!10725)))

(assert (=> b!102827 (= e!66967 (tuple2!2367 false newMap!16))))

(declare-fun bm!10732 () Bool)

(assert (=> bm!10732 (= call!10732 call!10731)))

(declare-fun bm!10733 () Bool)

(declare-fun updateHelperNewKey!45 (LongMapFixedSize!886 (_ BitVec 64) V!3201 (_ BitVec 32)) tuple2!2366)

(assert (=> bm!10733 (= call!10737 (updateHelperNewKey!45 newMap!16 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) lt!52007 (ite c!17671 (index!3190 lt!52235) (index!3187 lt!52235))))))

(declare-fun b!102828 () Bool)

(declare-fun lt!52240 () tuple2!2366)

(assert (=> b!102828 (= lt!52240 call!10737)))

(assert (=> b!102828 (= e!66982 (tuple2!2367 (_1!1194 lt!52240) (_2!1194 lt!52240)))))

(declare-fun bm!10734 () Bool)

(assert (=> bm!10734 (= call!10729 call!10731)))

(declare-fun b!102829 () Bool)

(assert (=> b!102829 (= e!66972 (not call!10724))))

(declare-fun bm!10735 () Bool)

(assert (=> bm!10735 (= call!10730 call!10740)))

(declare-fun bm!10736 () Bool)

(assert (=> bm!10736 (= call!10739 (getCurrentListMap!460 (_keys!4255 newMap!16) (_values!2537 newMap!16) (mask!6686 newMap!16) (extraKeys!2363 newMap!16) (zeroValue!2431 newMap!16) (minValue!2431 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2554 newMap!16)))))

(declare-fun b!102830 () Bool)

(declare-fun res!51376 () Bool)

(assert (=> b!102830 (= res!51376 (= (select (arr!2038 (_keys!4255 newMap!16)) (index!3190 lt!52233)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!102830 (=> (not res!51376) (not e!66969))))

(declare-fun bm!10737 () Bool)

(assert (=> bm!10737 (= call!10738 call!10732)))

(declare-fun b!102831 () Bool)

(assert (=> b!102831 (= e!66983 (= (select (arr!2038 (_keys!4255 newMap!16)) (index!3188 lt!52225)) (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355)))))

(declare-fun b!102832 () Bool)

(assert (=> b!102832 (= e!66974 (getCurrentListMap!460 (_keys!4255 newMap!16) lt!52238 (mask!6686 newMap!16) (extraKeys!2363 newMap!16) (zeroValue!2431 newMap!16) (minValue!2431 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2554 newMap!16)))))

(declare-fun b!102833 () Bool)

(assert (=> b!102833 (= e!66981 (not call!10721))))

(assert (= (and d!27621 c!17676) b!102795))

(assert (= (and d!27621 (not c!17676)) b!102823))

(assert (= (and b!102795 c!17675) b!102794))

(assert (= (and b!102795 (not c!17675)) b!102807))

(assert (= (or b!102794 b!102807) bm!10725))

(assert (= (or b!102794 b!102807) bm!10719))

(assert (= (or b!102794 b!102807) bm!10715))

(assert (= (and b!102823 c!17682) b!102827))

(assert (= (and b!102823 (not c!17682)) b!102802))

(assert (= (and b!102827 c!17678) b!102818))

(assert (= (and b!102827 (not c!17678)) b!102814))

(assert (= (and b!102818 res!51372) b!102808))

(assert (= (and b!102808 res!51380) b!102801))

(assert (= (and b!102814 c!17677) b!102817))

(assert (= (and b!102814 (not c!17677)) b!102797))

(assert (= (and b!102817 res!51377) b!102822))

(assert (= (and b!102822 res!51381) b!102829))

(assert (= (and b!102797 c!17672) b!102804))

(assert (= (and b!102797 (not c!17672)) b!102806))

(assert (= (and b!102804 res!51384) b!102830))

(assert (= (and b!102830 res!51376) b!102813))

(assert (= (or b!102817 b!102804) bm!10737))

(assert (= (or b!102829 b!102813) bm!10728))

(assert (= (or b!102808 bm!10737) bm!10732))

(assert (= (or b!102818 b!102814) bm!10730))

(assert (= (and b!102802 c!17671) b!102803))

(assert (= (and b!102802 (not c!17671)) b!102826))

(assert (= (and b!102826 c!17681) b!102828))

(assert (= (and b!102826 (not c!17681)) b!102815))

(assert (= (and b!102815 c!17679) b!102816))

(assert (= (and b!102815 (not c!17679)) b!102820))

(assert (= (and b!102816 res!51378) b!102824))

(assert (= (and b!102824 res!51374) b!102831))

(assert (= (and b!102820 c!17674) b!102825))

(assert (= (and b!102820 (not c!17674)) b!102805))

(assert (= (and b!102825 res!51373) b!102809))

(assert (= (and b!102809 res!51383) b!102796))

(assert (= (and b!102805 c!17680) b!102821))

(assert (= (and b!102805 (not c!17680)) b!102811))

(assert (= (and b!102821 res!51375) b!102798))

(assert (= (and b!102798 res!51382) b!102833))

(assert (= (or b!102825 b!102821) bm!10720))

(assert (= (or b!102796 b!102833) bm!10726))

(assert (= (or b!102824 bm!10720) bm!10734))

(assert (= (or b!102816 b!102820) bm!10735))

(assert (= (or b!102803 b!102828) bm!10733))

(assert (= (or b!102818 b!102816) bm!10727))

(assert (= (or b!102827 b!102815) bm!10724))

(assert (= (or bm!10728 bm!10726) bm!10714))

(assert (= (or bm!10730 bm!10735) bm!10721))

(assert (= (or b!102814 b!102820) bm!10722))

(assert (= (or bm!10732 bm!10734) bm!10723))

(assert (= (or b!102827 b!102815) bm!10717))

(assert (= (and bm!10717 c!17673) b!102800))

(assert (= (and bm!10717 (not c!17673)) b!102832))

(assert (= (or bm!10725 bm!10724) bm!10729))

(assert (= (or bm!10719 b!102815) bm!10736))

(assert (= (or bm!10715 b!102815) bm!10718))

(assert (= (and d!27621 res!51379) b!102819))

(assert (= (and b!102819 c!17670) b!102810))

(assert (= (and b!102819 (not c!17670)) b!102812))

(assert (= (and b!102810 res!51385) b!102799))

(assert (= (or b!102810 b!102799 b!102812) bm!10716))

(assert (= (or b!102799 b!102812) bm!10731))

(declare-fun m!113399 () Bool)

(assert (=> bm!10718 m!113399))

(declare-fun m!113401 () Bool)

(assert (=> b!102830 m!113401))

(declare-fun m!113403 () Bool)

(assert (=> b!102807 m!113403))

(declare-fun m!113405 () Bool)

(assert (=> bm!10723 m!113405))

(assert (=> bm!10731 m!113155))

(declare-fun m!113407 () Bool)

(assert (=> b!102831 m!113407))

(declare-fun m!113409 () Bool)

(assert (=> b!102809 m!113409))

(declare-fun m!113411 () Bool)

(assert (=> bm!10716 m!113411))

(assert (=> bm!10736 m!113327))

(declare-fun m!113413 () Bool)

(assert (=> b!102794 m!113413))

(assert (=> bm!10727 m!113147))

(declare-fun m!113415 () Bool)

(assert (=> bm!10727 m!113415))

(assert (=> bm!10714 m!113147))

(declare-fun m!113417 () Bool)

(assert (=> bm!10714 m!113417))

(declare-fun m!113419 () Bool)

(assert (=> b!102799 m!113419))

(declare-fun m!113421 () Bool)

(assert (=> bm!10729 m!113421))

(declare-fun m!113423 () Bool)

(assert (=> bm!10729 m!113423))

(declare-fun m!113425 () Bool)

(assert (=> b!102832 m!113425))

(assert (=> b!102810 m!113147))

(declare-fun m!113427 () Bool)

(assert (=> b!102810 m!113427))

(declare-fun m!113429 () Bool)

(assert (=> b!102822 m!113429))

(declare-fun m!113431 () Bool)

(assert (=> bm!10717 m!113431))

(declare-fun m!113433 () Bool)

(assert (=> bm!10717 m!113433))

(assert (=> bm!10733 m!113147))

(declare-fun m!113435 () Bool)

(assert (=> bm!10733 m!113435))

(assert (=> b!102823 m!113147))

(declare-fun m!113437 () Bool)

(assert (=> b!102823 m!113437))

(declare-fun m!113439 () Bool)

(assert (=> b!102798 m!113439))

(assert (=> bm!10721 m!113147))

(assert (=> bm!10721 m!113437))

(assert (=> bm!10722 m!113147))

(declare-fun m!113441 () Bool)

(assert (=> bm!10722 m!113441))

(declare-fun m!113443 () Bool)

(assert (=> d!27621 m!113443))

(assert (=> d!27621 m!113193))

(declare-fun m!113445 () Bool)

(assert (=> b!102815 m!113445))

(assert (=> b!102815 m!113421))

(assert (=> b!102815 m!113147))

(declare-fun m!113447 () Bool)

(assert (=> b!102815 m!113447))

(assert (=> b!102815 m!113147))

(declare-fun m!113449 () Bool)

(assert (=> b!102815 m!113449))

(declare-fun m!113451 () Bool)

(assert (=> b!102801 m!113451))

(assert (=> b!102470 d!27621))

(declare-fun d!27623 () Bool)

(assert (=> d!27623 (= (array_inv!1283 (_keys!4255 newMap!16)) (bvsge (size!2293 (_keys!4255 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!102471 d!27623))

(declare-fun d!27625 () Bool)

(assert (=> d!27625 (= (array_inv!1284 (_values!2537 newMap!16)) (bvsge (size!2294 (_values!2537 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!102471 d!27625))

(declare-fun b!102858 () Bool)

(declare-fun e!67003 () Bool)

(declare-fun lt!52268 () ListLongMap!1533)

(declare-fun isEmpty!370 (ListLongMap!1533) Bool)

(assert (=> b!102858 (= e!67003 (isEmpty!370 lt!52268))))

(declare-fun b!102859 () Bool)

(assert (=> b!102859 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2293 (_keys!4255 (v!2859 (underlying!349 thiss!992))))))))

(assert (=> b!102859 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2294 (_values!2537 (v!2859 (underlying!349 thiss!992))))))))

(declare-fun e!67002 () Bool)

(assert (=> b!102859 (= e!67002 (= (apply!96 lt!52268 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1318 (select (arr!2039 (_values!2537 (v!2859 (underlying!349 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!379 (defaultEntry!2554 (v!2859 (underlying!349 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!10740 () Bool)

(declare-fun call!10743 () ListLongMap!1533)

(assert (=> bm!10740 (= call!10743 (getCurrentListMapNoExtraKeys!97 (_keys!4255 (v!2859 (underlying!349 thiss!992))) (_values!2537 (v!2859 (underlying!349 thiss!992))) (mask!6686 (v!2859 (underlying!349 thiss!992))) (extraKeys!2363 (v!2859 (underlying!349 thiss!992))) (zeroValue!2431 (v!2859 (underlying!349 thiss!992))) (minValue!2431 (v!2859 (underlying!349 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2554 (v!2859 (underlying!349 thiss!992)))))))

(declare-fun b!102860 () Bool)

(assert (=> b!102860 (= e!67003 (= lt!52268 (getCurrentListMapNoExtraKeys!97 (_keys!4255 (v!2859 (underlying!349 thiss!992))) (_values!2537 (v!2859 (underlying!349 thiss!992))) (mask!6686 (v!2859 (underlying!349 thiss!992))) (extraKeys!2363 (v!2859 (underlying!349 thiss!992))) (zeroValue!2431 (v!2859 (underlying!349 thiss!992))) (minValue!2431 (v!2859 (underlying!349 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2554 (v!2859 (underlying!349 thiss!992))))))))

(declare-fun b!102861 () Bool)

(declare-fun e!67000 () ListLongMap!1533)

(declare-fun e!67001 () ListLongMap!1533)

(assert (=> b!102861 (= e!67000 e!67001)))

(declare-fun c!17692 () Bool)

(assert (=> b!102861 (= c!17692 (validKeyInArray!0 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!102862 () Bool)

(declare-fun e!67004 () Bool)

(declare-fun e!67006 () Bool)

(assert (=> b!102862 (= e!67004 e!67006)))

(declare-fun c!17694 () Bool)

(declare-fun e!67005 () Bool)

(assert (=> b!102862 (= c!17694 e!67005)))

(declare-fun res!51396 () Bool)

(assert (=> b!102862 (=> (not res!51396) (not e!67005))))

(assert (=> b!102862 (= res!51396 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2293 (_keys!4255 (v!2859 (underlying!349 thiss!992))))))))

(declare-fun b!102863 () Bool)

(assert (=> b!102863 (= e!67000 (ListLongMap!1534 Nil!1604))))

(declare-fun d!27627 () Bool)

(assert (=> d!27627 e!67004))

(declare-fun res!51395 () Bool)

(assert (=> d!27627 (=> (not res!51395) (not e!67004))))

(assert (=> d!27627 (= res!51395 (not (contains!813 lt!52268 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27627 (= lt!52268 e!67000)))

(declare-fun c!17693 () Bool)

(assert (=> d!27627 (= c!17693 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2293 (_keys!4255 (v!2859 (underlying!349 thiss!992))))))))

(assert (=> d!27627 (validMask!0 (mask!6686 (v!2859 (underlying!349 thiss!992))))))

(assert (=> d!27627 (= (getCurrentListMapNoExtraKeys!97 (_keys!4255 (v!2859 (underlying!349 thiss!992))) (_values!2537 (v!2859 (underlying!349 thiss!992))) (mask!6686 (v!2859 (underlying!349 thiss!992))) (extraKeys!2363 (v!2859 (underlying!349 thiss!992))) (zeroValue!2431 (v!2859 (underlying!349 thiss!992))) (minValue!2431 (v!2859 (underlying!349 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2554 (v!2859 (underlying!349 thiss!992)))) lt!52268)))

(declare-fun b!102864 () Bool)

(assert (=> b!102864 (= e!67006 e!67003)))

(declare-fun c!17691 () Bool)

(assert (=> b!102864 (= c!17691 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2293 (_keys!4255 (v!2859 (underlying!349 thiss!992))))))))

(declare-fun b!102865 () Bool)

(assert (=> b!102865 (= e!67006 e!67002)))

(assert (=> b!102865 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2293 (_keys!4255 (v!2859 (underlying!349 thiss!992))))))))

(declare-fun res!51394 () Bool)

(assert (=> b!102865 (= res!51394 (contains!813 lt!52268 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!102865 (=> (not res!51394) (not e!67002))))

(declare-fun b!102866 () Bool)

(assert (=> b!102866 (= e!67005 (validKeyInArray!0 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!102866 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!102867 () Bool)

(declare-fun lt!52271 () Unit!3127)

(declare-fun lt!52266 () Unit!3127)

(assert (=> b!102867 (= lt!52271 lt!52266)))

(declare-fun lt!52269 () V!3201)

(declare-fun lt!52267 () (_ BitVec 64))

(declare-fun lt!52270 () (_ BitVec 64))

(declare-fun lt!52272 () ListLongMap!1533)

(assert (=> b!102867 (not (contains!813 (+!132 lt!52272 (tuple2!2365 lt!52267 lt!52269)) lt!52270))))

(declare-fun addStillNotContains!45 (ListLongMap!1533 (_ BitVec 64) V!3201 (_ BitVec 64)) Unit!3127)

(assert (=> b!102867 (= lt!52266 (addStillNotContains!45 lt!52272 lt!52267 lt!52269 lt!52270))))

(assert (=> b!102867 (= lt!52270 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!102867 (= lt!52269 (get!1318 (select (arr!2039 (_values!2537 (v!2859 (underlying!349 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!379 (defaultEntry!2554 (v!2859 (underlying!349 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!102867 (= lt!52267 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!102867 (= lt!52272 call!10743)))

(assert (=> b!102867 (= e!67001 (+!132 call!10743 (tuple2!2365 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1318 (select (arr!2039 (_values!2537 (v!2859 (underlying!349 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!379 (defaultEntry!2554 (v!2859 (underlying!349 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!102868 () Bool)

(declare-fun res!51397 () Bool)

(assert (=> b!102868 (=> (not res!51397) (not e!67004))))

(assert (=> b!102868 (= res!51397 (not (contains!813 lt!52268 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!102869 () Bool)

(assert (=> b!102869 (= e!67001 call!10743)))

(assert (= (and d!27627 c!17693) b!102863))

(assert (= (and d!27627 (not c!17693)) b!102861))

(assert (= (and b!102861 c!17692) b!102867))

(assert (= (and b!102861 (not c!17692)) b!102869))

(assert (= (or b!102867 b!102869) bm!10740))

(assert (= (and d!27627 res!51395) b!102868))

(assert (= (and b!102868 res!51397) b!102862))

(assert (= (and b!102862 res!51396) b!102866))

(assert (= (and b!102862 c!17694) b!102865))

(assert (= (and b!102862 (not c!17694)) b!102864))

(assert (= (and b!102865 res!51394) b!102859))

(assert (= (and b!102864 c!17691) b!102860))

(assert (= (and b!102864 (not c!17691)) b!102858))

(declare-fun b_lambda!4583 () Bool)

(assert (=> (not b_lambda!4583) (not b!102859)))

(assert (=> b!102859 t!5645))

(declare-fun b_and!6345 () Bool)

(assert (= b_and!6341 (and (=> t!5645 result!3391) b_and!6345)))

(assert (=> b!102859 t!5647))

(declare-fun b_and!6347 () Bool)

(assert (= b_and!6343 (and (=> t!5647 result!3395) b_and!6347)))

(declare-fun b_lambda!4585 () Bool)

(assert (=> (not b_lambda!4585) (not b!102867)))

(assert (=> b!102867 t!5645))

(declare-fun b_and!6349 () Bool)

(assert (= b_and!6345 (and (=> t!5645 result!3391) b_and!6349)))

(assert (=> b!102867 t!5647))

(declare-fun b_and!6351 () Bool)

(assert (= b_and!6347 (and (=> t!5647 result!3395) b_and!6351)))

(declare-fun m!113453 () Bool)

(assert (=> b!102858 m!113453))

(declare-fun m!113455 () Bool)

(assert (=> bm!10740 m!113455))

(assert (=> b!102865 m!113311))

(assert (=> b!102865 m!113311))

(declare-fun m!113457 () Bool)

(assert (=> b!102865 m!113457))

(assert (=> b!102860 m!113455))

(assert (=> b!102859 m!113169))

(assert (=> b!102859 m!113333))

(assert (=> b!102859 m!113311))

(assert (=> b!102859 m!113333))

(assert (=> b!102859 m!113169))

(assert (=> b!102859 m!113335))

(assert (=> b!102859 m!113311))

(declare-fun m!113459 () Bool)

(assert (=> b!102859 m!113459))

(assert (=> b!102866 m!113311))

(assert (=> b!102866 m!113311))

(assert (=> b!102866 m!113337))

(declare-fun m!113461 () Bool)

(assert (=> b!102868 m!113461))

(declare-fun m!113463 () Bool)

(assert (=> d!27627 m!113463))

(assert (=> d!27627 m!113139))

(assert (=> b!102861 m!113311))

(assert (=> b!102861 m!113311))

(assert (=> b!102861 m!113337))

(assert (=> b!102867 m!113169))

(declare-fun m!113465 () Bool)

(assert (=> b!102867 m!113465))

(declare-fun m!113467 () Bool)

(assert (=> b!102867 m!113467))

(assert (=> b!102867 m!113333))

(assert (=> b!102867 m!113465))

(assert (=> b!102867 m!113311))

(declare-fun m!113469 () Bool)

(assert (=> b!102867 m!113469))

(assert (=> b!102867 m!113333))

(assert (=> b!102867 m!113169))

(assert (=> b!102867 m!113335))

(declare-fun m!113471 () Bool)

(assert (=> b!102867 m!113471))

(assert (=> b!102466 d!27627))

(declare-fun d!27629 () Bool)

(declare-fun e!67009 () Bool)

(assert (=> d!27629 e!67009))

(declare-fun res!51402 () Bool)

(assert (=> d!27629 (=> (not res!51402) (not e!67009))))

(declare-fun lt!52282 () ListLongMap!1533)

(assert (=> d!27629 (= res!51402 (contains!813 lt!52282 (_1!1193 lt!52011)))))

(declare-fun lt!52283 () List!1607)

(assert (=> d!27629 (= lt!52282 (ListLongMap!1534 lt!52283))))

(declare-fun lt!52281 () Unit!3127)

(declare-fun lt!52284 () Unit!3127)

(assert (=> d!27629 (= lt!52281 lt!52284)))

(assert (=> d!27629 (= (getValueByKey!152 lt!52283 (_1!1193 lt!52011)) (Some!157 (_2!1193 lt!52011)))))

(declare-fun lemmaContainsTupThenGetReturnValue!71 (List!1607 (_ BitVec 64) V!3201) Unit!3127)

(assert (=> d!27629 (= lt!52284 (lemmaContainsTupThenGetReturnValue!71 lt!52283 (_1!1193 lt!52011) (_2!1193 lt!52011)))))

(declare-fun insertStrictlySorted!74 (List!1607 (_ BitVec 64) V!3201) List!1607)

(assert (=> d!27629 (= lt!52283 (insertStrictlySorted!74 (toList!782 lt!52002) (_1!1193 lt!52011) (_2!1193 lt!52011)))))

(assert (=> d!27629 (= (+!132 lt!52002 lt!52011) lt!52282)))

(declare-fun b!102874 () Bool)

(declare-fun res!51403 () Bool)

(assert (=> b!102874 (=> (not res!51403) (not e!67009))))

(assert (=> b!102874 (= res!51403 (= (getValueByKey!152 (toList!782 lt!52282) (_1!1193 lt!52011)) (Some!157 (_2!1193 lt!52011))))))

(declare-fun b!102875 () Bool)

(declare-fun contains!815 (List!1607 tuple2!2364) Bool)

(assert (=> b!102875 (= e!67009 (contains!815 (toList!782 lt!52282) lt!52011))))

(assert (= (and d!27629 res!51402) b!102874))

(assert (= (and b!102874 res!51403) b!102875))

(declare-fun m!113473 () Bool)

(assert (=> d!27629 m!113473))

(declare-fun m!113475 () Bool)

(assert (=> d!27629 m!113475))

(declare-fun m!113477 () Bool)

(assert (=> d!27629 m!113477))

(declare-fun m!113479 () Bool)

(assert (=> d!27629 m!113479))

(declare-fun m!113481 () Bool)

(assert (=> b!102874 m!113481))

(declare-fun m!113483 () Bool)

(assert (=> b!102875 m!113483))

(assert (=> b!102466 d!27629))

(declare-fun d!27631 () Bool)

(declare-fun e!67010 () Bool)

(assert (=> d!27631 e!67010))

(declare-fun res!51404 () Bool)

(assert (=> d!27631 (=> (not res!51404) (not e!67010))))

(declare-fun lt!52286 () ListLongMap!1533)

(assert (=> d!27631 (= res!51404 (contains!813 lt!52286 (_1!1193 lt!52005)))))

(declare-fun lt!52287 () List!1607)

(assert (=> d!27631 (= lt!52286 (ListLongMap!1534 lt!52287))))

(declare-fun lt!52285 () Unit!3127)

(declare-fun lt!52288 () Unit!3127)

(assert (=> d!27631 (= lt!52285 lt!52288)))

(assert (=> d!27631 (= (getValueByKey!152 lt!52287 (_1!1193 lt!52005)) (Some!157 (_2!1193 lt!52005)))))

(assert (=> d!27631 (= lt!52288 (lemmaContainsTupThenGetReturnValue!71 lt!52287 (_1!1193 lt!52005) (_2!1193 lt!52005)))))

(assert (=> d!27631 (= lt!52287 (insertStrictlySorted!74 (toList!782 lt!52002) (_1!1193 lt!52005) (_2!1193 lt!52005)))))

(assert (=> d!27631 (= (+!132 lt!52002 lt!52005) lt!52286)))

(declare-fun b!102876 () Bool)

(declare-fun res!51405 () Bool)

(assert (=> b!102876 (=> (not res!51405) (not e!67010))))

(assert (=> b!102876 (= res!51405 (= (getValueByKey!152 (toList!782 lt!52286) (_1!1193 lt!52005)) (Some!157 (_2!1193 lt!52005))))))

(declare-fun b!102877 () Bool)

(assert (=> b!102877 (= e!67010 (contains!815 (toList!782 lt!52286) lt!52005))))

(assert (= (and d!27631 res!51404) b!102876))

(assert (= (and b!102876 res!51405) b!102877))

(declare-fun m!113485 () Bool)

(assert (=> d!27631 m!113485))

(declare-fun m!113487 () Bool)

(assert (=> d!27631 m!113487))

(declare-fun m!113489 () Bool)

(assert (=> d!27631 m!113489))

(declare-fun m!113491 () Bool)

(assert (=> d!27631 m!113491))

(declare-fun m!113493 () Bool)

(assert (=> b!102876 m!113493))

(declare-fun m!113495 () Bool)

(assert (=> b!102877 m!113495))

(assert (=> b!102466 d!27631))

(declare-fun d!27633 () Bool)

(declare-fun e!67011 () Bool)

(assert (=> d!27633 e!67011))

(declare-fun res!51406 () Bool)

(assert (=> d!27633 (=> (not res!51406) (not e!67011))))

(declare-fun lt!52290 () ListLongMap!1533)

(assert (=> d!27633 (= res!51406 (contains!813 lt!52290 (_1!1193 lt!52011)))))

(declare-fun lt!52291 () List!1607)

(assert (=> d!27633 (= lt!52290 (ListLongMap!1534 lt!52291))))

(declare-fun lt!52289 () Unit!3127)

(declare-fun lt!52292 () Unit!3127)

(assert (=> d!27633 (= lt!52289 lt!52292)))

(assert (=> d!27633 (= (getValueByKey!152 lt!52291 (_1!1193 lt!52011)) (Some!157 (_2!1193 lt!52011)))))

(assert (=> d!27633 (= lt!52292 (lemmaContainsTupThenGetReturnValue!71 lt!52291 (_1!1193 lt!52011) (_2!1193 lt!52011)))))

(assert (=> d!27633 (= lt!52291 (insertStrictlySorted!74 (toList!782 (+!132 lt!52002 lt!52005)) (_1!1193 lt!52011) (_2!1193 lt!52011)))))

(assert (=> d!27633 (= (+!132 (+!132 lt!52002 lt!52005) lt!52011) lt!52290)))

(declare-fun b!102878 () Bool)

(declare-fun res!51407 () Bool)

(assert (=> b!102878 (=> (not res!51407) (not e!67011))))

(assert (=> b!102878 (= res!51407 (= (getValueByKey!152 (toList!782 lt!52290) (_1!1193 lt!52011)) (Some!157 (_2!1193 lt!52011))))))

(declare-fun b!102879 () Bool)

(assert (=> b!102879 (= e!67011 (contains!815 (toList!782 lt!52290) lt!52011))))

(assert (= (and d!27633 res!51406) b!102878))

(assert (= (and b!102878 res!51407) b!102879))

(declare-fun m!113497 () Bool)

(assert (=> d!27633 m!113497))

(declare-fun m!113499 () Bool)

(assert (=> d!27633 m!113499))

(declare-fun m!113501 () Bool)

(assert (=> d!27633 m!113501))

(declare-fun m!113503 () Bool)

(assert (=> d!27633 m!113503))

(declare-fun m!113505 () Bool)

(assert (=> b!102878 m!113505))

(declare-fun m!113507 () Bool)

(assert (=> b!102879 m!113507))

(assert (=> b!102466 d!27633))

(declare-fun d!27635 () Bool)

(assert (=> d!27635 (= (+!132 (+!132 lt!52002 (tuple2!2365 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) lt!52007)) (tuple2!2365 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2431 (v!2859 (underlying!349 thiss!992))))) (+!132 (+!132 lt!52002 (tuple2!2365 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2431 (v!2859 (underlying!349 thiss!992))))) (tuple2!2365 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) lt!52007)))))

(declare-fun lt!52295 () Unit!3127)

(declare-fun choose!643 (ListLongMap!1533 (_ BitVec 64) V!3201 (_ BitVec 64) V!3201) Unit!3127)

(assert (=> d!27635 (= lt!52295 (choose!643 lt!52002 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) lt!52007 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2431 (v!2859 (underlying!349 thiss!992)))))))

(assert (=> d!27635 (not (= (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!27635 (= (addCommutativeForDiffKeys!44 lt!52002 (select (arr!2038 (_keys!4255 (v!2859 (underlying!349 thiss!992)))) from!355) lt!52007 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2431 (v!2859 (underlying!349 thiss!992)))) lt!52295)))

(declare-fun bs!4217 () Bool)

(assert (= bs!4217 d!27635))

(declare-fun m!113509 () Bool)

(assert (=> bs!4217 m!113509))

(declare-fun m!113511 () Bool)

(assert (=> bs!4217 m!113511))

(assert (=> bs!4217 m!113509))

(declare-fun m!113513 () Bool)

(assert (=> bs!4217 m!113513))

(assert (=> bs!4217 m!113513))

(declare-fun m!113515 () Bool)

(assert (=> bs!4217 m!113515))

(assert (=> bs!4217 m!113147))

(declare-fun m!113517 () Bool)

(assert (=> bs!4217 m!113517))

(assert (=> b!102466 d!27635))

(declare-fun d!27637 () Bool)

(declare-fun e!67012 () Bool)

(assert (=> d!27637 e!67012))

(declare-fun res!51408 () Bool)

(assert (=> d!27637 (=> (not res!51408) (not e!67012))))

(declare-fun lt!52297 () ListLongMap!1533)

(assert (=> d!27637 (= res!51408 (contains!813 lt!52297 (_1!1193 lt!52005)))))

(declare-fun lt!52298 () List!1607)

(assert (=> d!27637 (= lt!52297 (ListLongMap!1534 lt!52298))))

(declare-fun lt!52296 () Unit!3127)

(declare-fun lt!52299 () Unit!3127)

(assert (=> d!27637 (= lt!52296 lt!52299)))

(assert (=> d!27637 (= (getValueByKey!152 lt!52298 (_1!1193 lt!52005)) (Some!157 (_2!1193 lt!52005)))))

(assert (=> d!27637 (= lt!52299 (lemmaContainsTupThenGetReturnValue!71 lt!52298 (_1!1193 lt!52005) (_2!1193 lt!52005)))))

(assert (=> d!27637 (= lt!52298 (insertStrictlySorted!74 (toList!782 (+!132 lt!52002 lt!52011)) (_1!1193 lt!52005) (_2!1193 lt!52005)))))

(assert (=> d!27637 (= (+!132 (+!132 lt!52002 lt!52011) lt!52005) lt!52297)))

(declare-fun b!102880 () Bool)

(declare-fun res!51409 () Bool)

(assert (=> b!102880 (=> (not res!51409) (not e!67012))))

(assert (=> b!102880 (= res!51409 (= (getValueByKey!152 (toList!782 lt!52297) (_1!1193 lt!52005)) (Some!157 (_2!1193 lt!52005))))))

(declare-fun b!102881 () Bool)

(assert (=> b!102881 (= e!67012 (contains!815 (toList!782 lt!52297) lt!52005))))

(assert (= (and d!27637 res!51408) b!102880))

(assert (= (and b!102880 res!51409) b!102881))

(declare-fun m!113519 () Bool)

(assert (=> d!27637 m!113519))

(declare-fun m!113521 () Bool)

(assert (=> d!27637 m!113521))

(declare-fun m!113523 () Bool)

(assert (=> d!27637 m!113523))

(declare-fun m!113525 () Bool)

(assert (=> d!27637 m!113525))

(declare-fun m!113527 () Bool)

(assert (=> b!102880 m!113527))

(declare-fun m!113529 () Bool)

(assert (=> b!102881 m!113529))

(assert (=> b!102466 d!27637))

(declare-fun d!27639 () Bool)

(assert (=> d!27639 (= (validMask!0 (mask!6686 (v!2859 (underlying!349 thiss!992)))) (and (or (= (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00000000000000000000000000000111) (= (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00000000000000000000000000001111) (= (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00000000000000000000000000011111) (= (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00000000000000000000000000111111) (= (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00000000000000000000000001111111) (= (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00000000000000000000000011111111) (= (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00000000000000000000000111111111) (= (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00000000000000000000001111111111) (= (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00000000000000000000011111111111) (= (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00000000000000000000111111111111) (= (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00000000000000000001111111111111) (= (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00000000000000000011111111111111) (= (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00000000000000000111111111111111) (= (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00000000000000001111111111111111) (= (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00000000000000011111111111111111) (= (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00000000000000111111111111111111) (= (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00000000000001111111111111111111) (= (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00000000000011111111111111111111) (= (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00000000000111111111111111111111) (= (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00000000001111111111111111111111) (= (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00000000011111111111111111111111) (= (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00000000111111111111111111111111) (= (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00000001111111111111111111111111) (= (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00000011111111111111111111111111) (= (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00000111111111111111111111111111) (= (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00001111111111111111111111111111) (= (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00011111111111111111111111111111) (= (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6686 (v!2859 (underlying!349 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!102466 d!27639))

(declare-fun b!102889 () Bool)

(declare-fun e!67017 () Bool)

(assert (=> b!102889 (= e!67017 tp_is_empty!2665)))

(declare-fun b!102888 () Bool)

(declare-fun e!67018 () Bool)

(assert (=> b!102888 (= e!67018 tp_is_empty!2665)))

(declare-fun condMapEmpty!3891 () Bool)

(declare-fun mapDefault!3891 () ValueCell!989)

(assert (=> mapNonEmpty!3875 (= condMapEmpty!3891 (= mapRest!3876 ((as const (Array (_ BitVec 32) ValueCell!989)) mapDefault!3891)))))

(declare-fun mapRes!3891 () Bool)

(assert (=> mapNonEmpty!3875 (= tp!9803 (and e!67017 mapRes!3891))))

(declare-fun mapNonEmpty!3891 () Bool)

(declare-fun tp!9831 () Bool)

(assert (=> mapNonEmpty!3891 (= mapRes!3891 (and tp!9831 e!67018))))

(declare-fun mapRest!3891 () (Array (_ BitVec 32) ValueCell!989))

(declare-fun mapKey!3891 () (_ BitVec 32))

(declare-fun mapValue!3891 () ValueCell!989)

(assert (=> mapNonEmpty!3891 (= mapRest!3876 (store mapRest!3891 mapKey!3891 mapValue!3891))))

(declare-fun mapIsEmpty!3891 () Bool)

(assert (=> mapIsEmpty!3891 mapRes!3891))

(assert (= (and mapNonEmpty!3875 condMapEmpty!3891) mapIsEmpty!3891))

(assert (= (and mapNonEmpty!3875 (not condMapEmpty!3891)) mapNonEmpty!3891))

(assert (= (and mapNonEmpty!3891 ((_ is ValueCellFull!989) mapValue!3891)) b!102888))

(assert (= (and mapNonEmpty!3875 ((_ is ValueCellFull!989) mapDefault!3891)) b!102889))

(declare-fun m!113531 () Bool)

(assert (=> mapNonEmpty!3891 m!113531))

(declare-fun b!102891 () Bool)

(declare-fun e!67019 () Bool)

(assert (=> b!102891 (= e!67019 tp_is_empty!2665)))

(declare-fun b!102890 () Bool)

(declare-fun e!67020 () Bool)

(assert (=> b!102890 (= e!67020 tp_is_empty!2665)))

(declare-fun condMapEmpty!3892 () Bool)

(declare-fun mapDefault!3892 () ValueCell!989)

(assert (=> mapNonEmpty!3876 (= condMapEmpty!3892 (= mapRest!3875 ((as const (Array (_ BitVec 32) ValueCell!989)) mapDefault!3892)))))

(declare-fun mapRes!3892 () Bool)

(assert (=> mapNonEmpty!3876 (= tp!9801 (and e!67019 mapRes!3892))))

(declare-fun mapNonEmpty!3892 () Bool)

(declare-fun tp!9832 () Bool)

(assert (=> mapNonEmpty!3892 (= mapRes!3892 (and tp!9832 e!67020))))

(declare-fun mapRest!3892 () (Array (_ BitVec 32) ValueCell!989))

(declare-fun mapKey!3892 () (_ BitVec 32))

(declare-fun mapValue!3892 () ValueCell!989)

(assert (=> mapNonEmpty!3892 (= mapRest!3875 (store mapRest!3892 mapKey!3892 mapValue!3892))))

(declare-fun mapIsEmpty!3892 () Bool)

(assert (=> mapIsEmpty!3892 mapRes!3892))

(assert (= (and mapNonEmpty!3876 condMapEmpty!3892) mapIsEmpty!3892))

(assert (= (and mapNonEmpty!3876 (not condMapEmpty!3892)) mapNonEmpty!3892))

(assert (= (and mapNonEmpty!3892 ((_ is ValueCellFull!989) mapValue!3892)) b!102890))

(assert (= (and mapNonEmpty!3876 ((_ is ValueCellFull!989) mapDefault!3892)) b!102891))

(declare-fun m!113533 () Bool)

(assert (=> mapNonEmpty!3892 m!113533))

(declare-fun b_lambda!4587 () Bool)

(assert (= b_lambda!4585 (or (and b!102463 b_free!2497) (and b!102471 b_free!2499 (= (defaultEntry!2554 newMap!16) (defaultEntry!2554 (v!2859 (underlying!349 thiss!992))))) b_lambda!4587)))

(declare-fun b_lambda!4589 () Bool)

(assert (= b_lambda!4583 (or (and b!102463 b_free!2497) (and b!102471 b_free!2499 (= (defaultEntry!2554 newMap!16) (defaultEntry!2554 (v!2859 (underlying!349 thiss!992))))) b_lambda!4589)))

(declare-fun b_lambda!4591 () Bool)

(assert (= b_lambda!4581 (or (and b!102463 b_free!2497) (and b!102471 b_free!2499 (= (defaultEntry!2554 newMap!16) (defaultEntry!2554 (v!2859 (underlying!349 thiss!992))))) b_lambda!4591)))

(check-sat (not b!102861) (not b!102865) (not b!102815) (not b!102868) (not b!102610) (not d!27619) (not b_lambda!4587) (not bm!10644) (not d!27597) (not bm!10729) (not b!102693) (not bm!10717) (not d!27621) b_and!6349 (not b!102794) (not bm!10727) (not b!102622) (not b!102702) (not mapNonEmpty!3891) (not b!102858) (not b_lambda!4589) (not bm!10663) (not bm!10722) (not b!102695) (not d!27611) (not b!102875) (not b!102675) (not b_next!2497) (not d!27601) (not bm!10714) (not d!27635) (not b!102679) (not bm!10736) (not b!102624) (not b!102711) (not b!102874) (not d!27627) (not b!102866) (not b!102704) (not b!102876) (not b_lambda!4579) (not b!102703) (not b!102713) (not bm!10733) (not d!27617) tp_is_empty!2665 (not b!102631) (not d!27615) (not bm!10659) (not mapNonEmpty!3892) (not b!102605) (not b!102880) (not b!102694) (not bm!10662) (not b!102879) b_and!6351 (not d!27613) (not b!102860) (not b!102823) (not b!102810) (not b!102689) (not bm!10660) (not bm!10716) (not b!102832) (not b!102859) (not b!102877) (not d!27637) (not b!102807) (not d!27595) (not d!27629) (not b_next!2499) (not b!102867) (not d!27633) (not bm!10718) (not bm!10721) (not b!102632) (not d!27631) (not b_lambda!4591) (not bm!10740) (not bm!10731) (not b!102881) (not b!102623) (not b!102878) (not b!102799) (not b!102680) (not b!102692) (not bm!10723))
(check-sat b_and!6349 b_and!6351 (not b_next!2497) (not b_next!2499))
