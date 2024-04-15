; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12044 () Bool)

(assert start!12044)

(declare-fun b!101289 () Bool)

(declare-fun b_free!2461 () Bool)

(declare-fun b_next!2461 () Bool)

(assert (=> b!101289 (= b_free!2461 (not b_next!2461))))

(declare-fun tp!9688 () Bool)

(declare-fun b_and!6221 () Bool)

(assert (=> b!101289 (= tp!9688 b_and!6221)))

(declare-fun b!101277 () Bool)

(declare-fun b_free!2463 () Bool)

(declare-fun b_next!2463 () Bool)

(assert (=> b!101277 (= b_free!2463 (not b_next!2463))))

(declare-fun tp!9687 () Bool)

(declare-fun b_and!6223 () Bool)

(assert (=> b!101277 (= tp!9687 b_and!6223)))

(declare-fun b!101273 () Bool)

(declare-fun res!50739 () Bool)

(declare-fun e!65934 () Bool)

(assert (=> b!101273 (=> (not res!50739) (not e!65934))))

(declare-datatypes ((V!3177 0))(
  ( (V!3178 (val!1368 Int)) )
))
(declare-datatypes ((array!4259 0))(
  ( (array!4260 (arr!2020 (Array (_ BitVec 32) (_ BitVec 64))) (size!2274 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!980 0))(
  ( (ValueCellFull!980 (v!2834 V!3177)) (EmptyCell!980) )
))
(declare-datatypes ((array!4261 0))(
  ( (array!4262 (arr!2021 (Array (_ BitVec 32) ValueCell!980)) (size!2275 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!868 0))(
  ( (LongMapFixedSize!869 (defaultEntry!2535 Int) (mask!6657 (_ BitVec 32)) (extraKeys!2346 (_ BitVec 32)) (zeroValue!2413 V!3177) (minValue!2413 V!3177) (_size!483 (_ BitVec 32)) (_keys!4234 array!4259) (_values!2518 array!4261) (_vacant!483 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!658 0))(
  ( (Cell!659 (v!2835 LongMapFixedSize!868)) )
))
(declare-datatypes ((LongMap!658 0))(
  ( (LongMap!659 (underlying!340 Cell!658)) )
))
(declare-fun thiss!992 () LongMap!658)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!101273 (= res!50739 (validMask!0 (mask!6657 (v!2835 (underlying!340 thiss!992)))))))

(declare-fun mapIsEmpty!3815 () Bool)

(declare-fun mapRes!3816 () Bool)

(assert (=> mapIsEmpty!3815 mapRes!3816))

(declare-fun b!101274 () Bool)

(declare-fun e!65935 () Bool)

(declare-fun tp_is_empty!2647 () Bool)

(assert (=> b!101274 (= e!65935 tp_is_empty!2647)))

(declare-fun b!101275 () Bool)

(declare-fun e!65927 () Bool)

(declare-fun e!65937 () Bool)

(assert (=> b!101275 (= e!65927 e!65937)))

(declare-fun b!101276 () Bool)

(declare-fun e!65931 () Bool)

(declare-fun e!65928 () Bool)

(assert (=> b!101276 (= e!65931 (and e!65928 mapRes!3816))))

(declare-fun condMapEmpty!3816 () Bool)

(declare-fun mapDefault!3816 () ValueCell!980)

(assert (=> b!101276 (= condMapEmpty!3816 (= (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!980)) mapDefault!3816)))))

(declare-fun e!65938 () Bool)

(declare-fun e!65939 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!868)

(declare-fun array_inv!1269 (array!4259) Bool)

(declare-fun array_inv!1270 (array!4261) Bool)

(assert (=> b!101277 (= e!65938 (and tp!9687 tp_is_empty!2647 (array_inv!1269 (_keys!4234 newMap!16)) (array_inv!1270 (_values!2518 newMap!16)) e!65939))))

(declare-fun b!101278 () Bool)

(declare-fun res!50742 () Bool)

(declare-fun e!65933 () Bool)

(assert (=> b!101278 (=> (not res!50742) (not e!65933))))

(assert (=> b!101278 (= res!50742 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6657 newMap!16)) (_size!483 (v!2835 (underlying!340 thiss!992)))))))

(declare-fun b!101279 () Bool)

(declare-fun e!65942 () Bool)

(assert (=> b!101279 (= e!65937 e!65942)))

(declare-fun b!101280 () Bool)

(declare-fun e!65940 () Bool)

(assert (=> b!101280 (= e!65940 e!65934)))

(declare-fun res!50743 () Bool)

(assert (=> b!101280 (=> (not res!50743) (not e!65934))))

(declare-datatypes ((tuple2!2348 0))(
  ( (tuple2!2349 (_1!1185 Bool) (_2!1185 LongMapFixedSize!868)) )
))
(declare-fun lt!51311 () tuple2!2348)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!101280 (= res!50743 (and (_1!1185 lt!51311) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!3090 0))(
  ( (Unit!3091) )
))
(declare-fun lt!51310 () Unit!3090)

(declare-fun e!65929 () Unit!3090)

(assert (=> b!101280 (= lt!51310 e!65929)))

(declare-datatypes ((tuple2!2350 0))(
  ( (tuple2!2351 (_1!1186 (_ BitVec 64)) (_2!1186 V!3177)) )
))
(declare-datatypes ((List!1599 0))(
  ( (Nil!1596) (Cons!1595 (h!2191 tuple2!2350) (t!5600 List!1599)) )
))
(declare-datatypes ((ListLongMap!1525 0))(
  ( (ListLongMap!1526 (toList!778 List!1599)) )
))
(declare-fun lt!51312 () ListLongMap!1525)

(declare-fun c!17416 () Bool)

(declare-fun contains!807 (ListLongMap!1525 (_ BitVec 64)) Bool)

(assert (=> b!101280 (= c!17416 (contains!807 lt!51312 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(declare-fun update!152 (LongMapFixedSize!868 (_ BitVec 64) V!3177) tuple2!2348)

(declare-fun get!1305 (ValueCell!980 V!3177) V!3177)

(declare-fun dynLambda!375 (Int (_ BitVec 64)) V!3177)

(assert (=> b!101280 (= lt!51311 (update!152 newMap!16 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!101281 () Bool)

(declare-datatypes ((List!1600 0))(
  ( (Nil!1597) (Cons!1596 (h!2192 (_ BitVec 64)) (t!5601 List!1600)) )
))
(declare-fun arrayNoDuplicates!0 (array!4259 (_ BitVec 32) List!1600) Bool)

(assert (=> b!101281 (= e!65934 (not (arrayNoDuplicates!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000000000000 Nil!1597)))))

(declare-fun b!101282 () Bool)

(declare-fun res!50746 () Bool)

(assert (=> b!101282 (=> (not res!50746) (not e!65934))))

(assert (=> b!101282 (= res!50746 (and (= (size!2275 (_values!2518 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6657 (v!2835 (underlying!340 thiss!992))))) (= (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (size!2275 (_values!2518 (v!2835 (underlying!340 thiss!992))))) (bvsge (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2346 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2346 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!101283 () Bool)

(assert (=> b!101283 (= e!65928 tp_is_empty!2647)))

(declare-fun b!101284 () Bool)

(declare-fun e!65930 () Bool)

(assert (=> b!101284 (= e!65930 tp_is_empty!2647)))

(declare-fun b!101285 () Bool)

(declare-fun res!50747 () Bool)

(assert (=> b!101285 (=> (not res!50747) (not e!65933))))

(declare-fun valid!403 (LongMapFixedSize!868) Bool)

(assert (=> b!101285 (= res!50747 (valid!403 newMap!16))))

(declare-fun b!101286 () Bool)

(declare-fun res!50741 () Bool)

(assert (=> b!101286 (=> (not res!50741) (not e!65934))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4259 (_ BitVec 32)) Bool)

(assert (=> b!101286 (= res!50741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (mask!6657 (v!2835 (underlying!340 thiss!992)))))))

(declare-fun b!101287 () Bool)

(declare-fun e!65932 () Bool)

(assert (=> b!101287 (= e!65932 tp_is_empty!2647)))

(declare-fun mapNonEmpty!3815 () Bool)

(declare-fun mapRes!3815 () Bool)

(declare-fun tp!9689 () Bool)

(assert (=> mapNonEmpty!3815 (= mapRes!3815 (and tp!9689 e!65935))))

(declare-fun mapKey!3816 () (_ BitVec 32))

(declare-fun mapRest!3815 () (Array (_ BitVec 32) ValueCell!980))

(declare-fun mapValue!3815 () ValueCell!980)

(assert (=> mapNonEmpty!3815 (= (arr!2021 (_values!2518 newMap!16)) (store mapRest!3815 mapKey!3816 mapValue!3815))))

(declare-fun b!101288 () Bool)

(declare-fun Unit!3092 () Unit!3090)

(assert (=> b!101288 (= e!65929 Unit!3092)))

(declare-fun lt!51308 () Unit!3090)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!102 (array!4259 array!4261 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 64) (_ BitVec 32) Int) Unit!3090)

(assert (=> b!101288 (= lt!51308 (lemmaListMapContainsThenArrayContainsFrom!102 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (_values!2518 (v!2835 (underlying!340 thiss!992))) (mask!6657 (v!2835 (underlying!340 thiss!992))) (extraKeys!2346 (v!2835 (underlying!340 thiss!992))) (zeroValue!2413 (v!2835 (underlying!340 thiss!992))) (minValue!2413 (v!2835 (underlying!340 thiss!992))) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2535 (v!2835 (underlying!340 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!101288 (arrayContainsKey!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!51307 () Unit!3090)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4259 (_ BitVec 32) (_ BitVec 32)) Unit!3090)

(assert (=> b!101288 (= lt!51307 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> b!101288 (arrayNoDuplicates!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) from!355 Nil!1597)))

(declare-fun lt!51313 () Unit!3090)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4259 (_ BitVec 32) (_ BitVec 64) List!1600) Unit!3090)

(assert (=> b!101288 (= lt!51313 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (Cons!1596 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) Nil!1597)))))

(assert (=> b!101288 false))

(assert (=> b!101289 (= e!65942 (and tp!9688 tp_is_empty!2647 (array_inv!1269 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (array_inv!1270 (_values!2518 (v!2835 (underlying!340 thiss!992)))) e!65931))))

(declare-fun mapNonEmpty!3816 () Bool)

(declare-fun tp!9690 () Bool)

(assert (=> mapNonEmpty!3816 (= mapRes!3816 (and tp!9690 e!65932))))

(declare-fun mapRest!3816 () (Array (_ BitVec 32) ValueCell!980))

(declare-fun mapKey!3815 () (_ BitVec 32))

(declare-fun mapValue!3816 () ValueCell!980)

(assert (=> mapNonEmpty!3816 (= (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) (store mapRest!3816 mapKey!3815 mapValue!3816))))

(declare-fun b!101290 () Bool)

(assert (=> b!101290 (= e!65939 (and e!65930 mapRes!3815))))

(declare-fun condMapEmpty!3815 () Bool)

(declare-fun mapDefault!3815 () ValueCell!980)

(assert (=> b!101290 (= condMapEmpty!3815 (= (arr!2021 (_values!2518 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!980)) mapDefault!3815)))))

(declare-fun res!50744 () Bool)

(assert (=> start!12044 (=> (not res!50744) (not e!65933))))

(declare-fun valid!404 (LongMap!658) Bool)

(assert (=> start!12044 (= res!50744 (valid!404 thiss!992))))

(assert (=> start!12044 e!65933))

(assert (=> start!12044 e!65927))

(assert (=> start!12044 true))

(assert (=> start!12044 e!65938))

(declare-fun b!101291 () Bool)

(assert (=> b!101291 (= e!65933 e!65940)))

(declare-fun res!50745 () Bool)

(assert (=> b!101291 (=> (not res!50745) (not e!65940))))

(declare-fun lt!51309 () ListLongMap!1525)

(assert (=> b!101291 (= res!50745 (and (= lt!51309 lt!51312) (not (= (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1253 (LongMapFixedSize!868) ListLongMap!1525)

(assert (=> b!101291 (= lt!51312 (map!1253 newMap!16))))

(declare-fun getCurrentListMap!457 (array!4259 array!4261 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 32) Int) ListLongMap!1525)

(assert (=> b!101291 (= lt!51309 (getCurrentListMap!457 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (_values!2518 (v!2835 (underlying!340 thiss!992))) (mask!6657 (v!2835 (underlying!340 thiss!992))) (extraKeys!2346 (v!2835 (underlying!340 thiss!992))) (zeroValue!2413 (v!2835 (underlying!340 thiss!992))) (minValue!2413 (v!2835 (underlying!340 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2535 (v!2835 (underlying!340 thiss!992)))))))

(declare-fun b!101292 () Bool)

(declare-fun Unit!3093 () Unit!3090)

(assert (=> b!101292 (= e!65929 Unit!3093)))

(declare-fun b!101293 () Bool)

(declare-fun res!50740 () Bool)

(assert (=> b!101293 (=> (not res!50740) (not e!65933))))

(assert (=> b!101293 (= res!50740 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992)))))))))

(declare-fun mapIsEmpty!3816 () Bool)

(assert (=> mapIsEmpty!3816 mapRes!3815))

(assert (= (and start!12044 res!50744) b!101293))

(assert (= (and b!101293 res!50740) b!101285))

(assert (= (and b!101285 res!50747) b!101278))

(assert (= (and b!101278 res!50742) b!101291))

(assert (= (and b!101291 res!50745) b!101280))

(assert (= (and b!101280 c!17416) b!101288))

(assert (= (and b!101280 (not c!17416)) b!101292))

(assert (= (and b!101280 res!50743) b!101273))

(assert (= (and b!101273 res!50739) b!101282))

(assert (= (and b!101282 res!50746) b!101286))

(assert (= (and b!101286 res!50741) b!101281))

(assert (= (and b!101276 condMapEmpty!3816) mapIsEmpty!3815))

(assert (= (and b!101276 (not condMapEmpty!3816)) mapNonEmpty!3816))

(get-info :version)

(assert (= (and mapNonEmpty!3816 ((_ is ValueCellFull!980) mapValue!3816)) b!101287))

(assert (= (and b!101276 ((_ is ValueCellFull!980) mapDefault!3816)) b!101283))

(assert (= b!101289 b!101276))

(assert (= b!101279 b!101289))

(assert (= b!101275 b!101279))

(assert (= start!12044 b!101275))

(assert (= (and b!101290 condMapEmpty!3815) mapIsEmpty!3816))

(assert (= (and b!101290 (not condMapEmpty!3815)) mapNonEmpty!3815))

(assert (= (and mapNonEmpty!3815 ((_ is ValueCellFull!980) mapValue!3815)) b!101274))

(assert (= (and b!101290 ((_ is ValueCellFull!980) mapDefault!3815)) b!101284))

(assert (= b!101277 b!101290))

(assert (= start!12044 b!101277))

(declare-fun b_lambda!4529 () Bool)

(assert (=> (not b_lambda!4529) (not b!101280)))

(declare-fun t!5597 () Bool)

(declare-fun tb!1969 () Bool)

(assert (=> (and b!101289 (= (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) (defaultEntry!2535 (v!2835 (underlying!340 thiss!992)))) t!5597) tb!1969))

(declare-fun result!3331 () Bool)

(assert (=> tb!1969 (= result!3331 tp_is_empty!2647)))

(assert (=> b!101280 t!5597))

(declare-fun b_and!6225 () Bool)

(assert (= b_and!6221 (and (=> t!5597 result!3331) b_and!6225)))

(declare-fun tb!1971 () Bool)

(declare-fun t!5599 () Bool)

(assert (=> (and b!101277 (= (defaultEntry!2535 newMap!16) (defaultEntry!2535 (v!2835 (underlying!340 thiss!992)))) t!5599) tb!1971))

(declare-fun result!3335 () Bool)

(assert (= result!3335 result!3331))

(assert (=> b!101280 t!5599))

(declare-fun b_and!6227 () Bool)

(assert (= b_and!6223 (and (=> t!5599 result!3335) b_and!6227)))

(declare-fun m!111955 () Bool)

(assert (=> mapNonEmpty!3816 m!111955))

(declare-fun m!111957 () Bool)

(assert (=> b!101288 m!111957))

(declare-fun m!111959 () Bool)

(assert (=> b!101288 m!111959))

(declare-fun m!111961 () Bool)

(assert (=> b!101288 m!111961))

(declare-fun m!111963 () Bool)

(assert (=> b!101288 m!111963))

(assert (=> b!101288 m!111961))

(assert (=> b!101288 m!111961))

(declare-fun m!111965 () Bool)

(assert (=> b!101288 m!111965))

(assert (=> b!101288 m!111961))

(declare-fun m!111967 () Bool)

(assert (=> b!101288 m!111967))

(declare-fun m!111969 () Bool)

(assert (=> b!101281 m!111969))

(assert (=> b!101291 m!111961))

(declare-fun m!111971 () Bool)

(assert (=> b!101291 m!111971))

(declare-fun m!111973 () Bool)

(assert (=> b!101291 m!111973))

(declare-fun m!111975 () Bool)

(assert (=> mapNonEmpty!3815 m!111975))

(assert (=> b!101280 m!111961))

(declare-fun m!111977 () Bool)

(assert (=> b!101280 m!111977))

(declare-fun m!111979 () Bool)

(assert (=> b!101280 m!111979))

(declare-fun m!111981 () Bool)

(assert (=> b!101280 m!111981))

(declare-fun m!111983 () Bool)

(assert (=> b!101280 m!111983))

(assert (=> b!101280 m!111961))

(assert (=> b!101280 m!111981))

(assert (=> b!101280 m!111961))

(assert (=> b!101280 m!111983))

(declare-fun m!111985 () Bool)

(assert (=> b!101280 m!111985))

(assert (=> b!101280 m!111979))

(declare-fun m!111987 () Bool)

(assert (=> b!101273 m!111987))

(declare-fun m!111989 () Bool)

(assert (=> b!101289 m!111989))

(declare-fun m!111991 () Bool)

(assert (=> b!101289 m!111991))

(declare-fun m!111993 () Bool)

(assert (=> b!101285 m!111993))

(declare-fun m!111995 () Bool)

(assert (=> b!101277 m!111995))

(declare-fun m!111997 () Bool)

(assert (=> b!101277 m!111997))

(declare-fun m!111999 () Bool)

(assert (=> start!12044 m!111999))

(declare-fun m!112001 () Bool)

(assert (=> b!101286 m!112001))

(check-sat (not b!101273) (not b_next!2461) (not b!101280) b_and!6225 (not b_lambda!4529) b_and!6227 (not b!101288) (not start!12044) (not b!101291) (not b!101286) tp_is_empty!2647 (not b_next!2463) (not b!101277) (not mapNonEmpty!3815) (not b!101289) (not b!101281) (not b!101285) (not mapNonEmpty!3816))
(check-sat b_and!6225 b_and!6227 (not b_next!2461) (not b_next!2463))
(get-model)

(declare-fun b_lambda!4535 () Bool)

(assert (= b_lambda!4529 (or (and b!101289 b_free!2461) (and b!101277 b_free!2463 (= (defaultEntry!2535 newMap!16) (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))))) b_lambda!4535)))

(check-sat (not b!101273) (not b_next!2461) (not b!101280) b_and!6225 b_and!6227 (not b!101288) (not b_lambda!4535) (not start!12044) (not b!101291) (not b!101286) tp_is_empty!2647 (not b_next!2463) (not b!101277) (not mapNonEmpty!3815) (not b!101289) (not b!101281) (not b!101285) (not mapNonEmpty!3816))
(check-sat b_and!6225 b_and!6227 (not b_next!2461) (not b_next!2463))
(get-model)

(declare-fun bm!10494 () Bool)

(declare-fun call!10497 () Bool)

(assert (=> bm!10494 (= call!10497 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4234 (v!2835 (underlying!340 thiss!992))) (mask!6657 (v!2835 (underlying!340 thiss!992)))))))

(declare-fun d!27409 () Bool)

(declare-fun res!50807 () Bool)

(declare-fun e!66047 () Bool)

(assert (=> d!27409 (=> res!50807 e!66047)))

(assert (=> d!27409 (= res!50807 (bvsge #b00000000000000000000000000000000 (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992))))))))

(assert (=> d!27409 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (mask!6657 (v!2835 (underlying!340 thiss!992)))) e!66047)))

(declare-fun b!101434 () Bool)

(declare-fun e!66046 () Bool)

(assert (=> b!101434 (= e!66046 call!10497)))

(declare-fun b!101435 () Bool)

(declare-fun e!66045 () Bool)

(assert (=> b!101435 (= e!66045 e!66046)))

(declare-fun lt!51362 () (_ BitVec 64))

(assert (=> b!101435 (= lt!51362 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!51363 () Unit!3090)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4259 (_ BitVec 64) (_ BitVec 32)) Unit!3090)

(assert (=> b!101435 (= lt!51363 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) lt!51362 #b00000000000000000000000000000000))))

(assert (=> b!101435 (arrayContainsKey!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) lt!51362 #b00000000000000000000000000000000)))

(declare-fun lt!51364 () Unit!3090)

(assert (=> b!101435 (= lt!51364 lt!51363)))

(declare-fun res!50806 () Bool)

(declare-datatypes ((SeekEntryResult!259 0))(
  ( (MissingZero!259 (index!3182 (_ BitVec 32))) (Found!259 (index!3183 (_ BitVec 32))) (Intermediate!259 (undefined!1071 Bool) (index!3184 (_ BitVec 32)) (x!13341 (_ BitVec 32))) (Undefined!259) (MissingVacant!259 (index!3185 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4259 (_ BitVec 32)) SeekEntryResult!259)

(assert (=> b!101435 (= res!50806 (= (seekEntryOrOpen!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) #b00000000000000000000000000000000) (_keys!4234 (v!2835 (underlying!340 thiss!992))) (mask!6657 (v!2835 (underlying!340 thiss!992)))) (Found!259 #b00000000000000000000000000000000)))))

(assert (=> b!101435 (=> (not res!50806) (not e!66046))))

(declare-fun b!101436 () Bool)

(assert (=> b!101436 (= e!66045 call!10497)))

(declare-fun b!101437 () Bool)

(assert (=> b!101437 (= e!66047 e!66045)))

(declare-fun c!17425 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!101437 (= c!17425 (validKeyInArray!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!27409 (not res!50807)) b!101437))

(assert (= (and b!101437 c!17425) b!101435))

(assert (= (and b!101437 (not c!17425)) b!101436))

(assert (= (and b!101435 res!50806) b!101434))

(assert (= (or b!101434 b!101436) bm!10494))

(declare-fun m!112099 () Bool)

(assert (=> bm!10494 m!112099))

(declare-fun m!112101 () Bool)

(assert (=> b!101435 m!112101))

(declare-fun m!112103 () Bool)

(assert (=> b!101435 m!112103))

(declare-fun m!112105 () Bool)

(assert (=> b!101435 m!112105))

(assert (=> b!101435 m!112101))

(declare-fun m!112107 () Bool)

(assert (=> b!101435 m!112107))

(assert (=> b!101437 m!112101))

(assert (=> b!101437 m!112101))

(declare-fun m!112109 () Bool)

(assert (=> b!101437 m!112109))

(assert (=> b!101286 d!27409))

(declare-fun b!101448 () Bool)

(declare-fun e!66057 () Bool)

(declare-fun contains!808 (List!1600 (_ BitVec 64)) Bool)

(assert (=> b!101448 (= e!66057 (contains!808 Nil!1597 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!101449 () Bool)

(declare-fun e!66058 () Bool)

(declare-fun e!66056 () Bool)

(assert (=> b!101449 (= e!66058 e!66056)))

(declare-fun res!50814 () Bool)

(assert (=> b!101449 (=> (not res!50814) (not e!66056))))

(assert (=> b!101449 (= res!50814 (not e!66057))))

(declare-fun res!50816 () Bool)

(assert (=> b!101449 (=> (not res!50816) (not e!66057))))

(assert (=> b!101449 (= res!50816 (validKeyInArray!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!101450 () Bool)

(declare-fun e!66059 () Bool)

(declare-fun call!10500 () Bool)

(assert (=> b!101450 (= e!66059 call!10500)))

(declare-fun b!101451 () Bool)

(assert (=> b!101451 (= e!66056 e!66059)))

(declare-fun c!17428 () Bool)

(assert (=> b!101451 (= c!17428 (validKeyInArray!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!10497 () Bool)

(assert (=> bm!10497 (= call!10500 (arrayNoDuplicates!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!17428 (Cons!1596 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) #b00000000000000000000000000000000) Nil!1597) Nil!1597)))))

(declare-fun d!27411 () Bool)

(declare-fun res!50815 () Bool)

(assert (=> d!27411 (=> res!50815 e!66058)))

(assert (=> d!27411 (= res!50815 (bvsge #b00000000000000000000000000000000 (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992))))))))

(assert (=> d!27411 (= (arrayNoDuplicates!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000000000000 Nil!1597) e!66058)))

(declare-fun b!101452 () Bool)

(assert (=> b!101452 (= e!66059 call!10500)))

(assert (= (and d!27411 (not res!50815)) b!101449))

(assert (= (and b!101449 res!50816) b!101448))

(assert (= (and b!101449 res!50814) b!101451))

(assert (= (and b!101451 c!17428) b!101452))

(assert (= (and b!101451 (not c!17428)) b!101450))

(assert (= (or b!101452 b!101450) bm!10497))

(assert (=> b!101448 m!112101))

(assert (=> b!101448 m!112101))

(declare-fun m!112111 () Bool)

(assert (=> b!101448 m!112111))

(assert (=> b!101449 m!112101))

(assert (=> b!101449 m!112101))

(assert (=> b!101449 m!112109))

(assert (=> b!101451 m!112101))

(assert (=> b!101451 m!112101))

(assert (=> b!101451 m!112109))

(assert (=> bm!10497 m!112101))

(declare-fun m!112113 () Bool)

(assert (=> bm!10497 m!112113))

(assert (=> b!101281 d!27411))

(declare-fun d!27413 () Bool)

(assert (=> d!27413 (= (validMask!0 (mask!6657 (v!2835 (underlying!340 thiss!992)))) (and (or (= (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000000000111) (= (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000000001111) (= (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000000011111) (= (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000000111111) (= (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000001111111) (= (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000011111111) (= (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000111111111) (= (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000001111111111) (= (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000011111111111) (= (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000111111111111) (= (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00000000000000000001111111111111) (= (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00000000000000000011111111111111) (= (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00000000000000000111111111111111) (= (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00000000000000001111111111111111) (= (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00000000000000011111111111111111) (= (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00000000000000111111111111111111) (= (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00000000000001111111111111111111) (= (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00000000000011111111111111111111) (= (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00000000000111111111111111111111) (= (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00000000001111111111111111111111) (= (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00000000011111111111111111111111) (= (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00000000111111111111111111111111) (= (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00000001111111111111111111111111) (= (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00000011111111111111111111111111) (= (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00000111111111111111111111111111) (= (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00001111111111111111111111111111) (= (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00011111111111111111111111111111) (= (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6657 (v!2835 (underlying!340 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!101273 d!27413))

(declare-fun d!27415 () Bool)

(assert (=> d!27415 (= (array_inv!1269 (_keys!4234 newMap!16)) (bvsge (size!2274 (_keys!4234 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!101277 d!27415))

(declare-fun d!27417 () Bool)

(assert (=> d!27417 (= (array_inv!1270 (_values!2518 newMap!16)) (bvsge (size!2275 (_values!2518 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!101277 d!27417))

(declare-fun d!27419 () Bool)

(assert (=> d!27419 (= (map!1253 newMap!16) (getCurrentListMap!457 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun bs!4183 () Bool)

(assert (= bs!4183 d!27419))

(declare-fun m!112115 () Bool)

(assert (=> bs!4183 m!112115))

(assert (=> b!101291 d!27419))

(declare-fun b!101495 () Bool)

(declare-fun e!66092 () Bool)

(declare-fun e!66095 () Bool)

(assert (=> b!101495 (= e!66092 e!66095)))

(declare-fun res!50837 () Bool)

(declare-fun call!10520 () Bool)

(assert (=> b!101495 (= res!50837 call!10520)))

(assert (=> b!101495 (=> (not res!50837) (not e!66095))))

(declare-fun b!101496 () Bool)

(declare-fun e!66089 () Unit!3090)

(declare-fun lt!51414 () Unit!3090)

(assert (=> b!101496 (= e!66089 lt!51414)))

(declare-fun lt!51420 () ListLongMap!1525)

(declare-fun getCurrentListMapNoExtraKeys!95 (array!4259 array!4261 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 32) Int) ListLongMap!1525)

(assert (=> b!101496 (= lt!51420 (getCurrentListMapNoExtraKeys!95 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (_values!2518 (v!2835 (underlying!340 thiss!992))) (mask!6657 (v!2835 (underlying!340 thiss!992))) (extraKeys!2346 (v!2835 (underlying!340 thiss!992))) (zeroValue!2413 (v!2835 (underlying!340 thiss!992))) (minValue!2413 (v!2835 (underlying!340 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2535 (v!2835 (underlying!340 thiss!992)))))))

(declare-fun lt!51425 () (_ BitVec 64))

(assert (=> b!101496 (= lt!51425 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51421 () (_ BitVec 64))

(assert (=> b!101496 (= lt!51421 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!51428 () Unit!3090)

(declare-fun addStillContains!71 (ListLongMap!1525 (_ BitVec 64) V!3177 (_ BitVec 64)) Unit!3090)

(assert (=> b!101496 (= lt!51428 (addStillContains!71 lt!51420 lt!51425 (zeroValue!2413 (v!2835 (underlying!340 thiss!992))) lt!51421))))

(declare-fun +!131 (ListLongMap!1525 tuple2!2350) ListLongMap!1525)

(assert (=> b!101496 (contains!807 (+!131 lt!51420 (tuple2!2351 lt!51425 (zeroValue!2413 (v!2835 (underlying!340 thiss!992))))) lt!51421)))

(declare-fun lt!51424 () Unit!3090)

(assert (=> b!101496 (= lt!51424 lt!51428)))

(declare-fun lt!51426 () ListLongMap!1525)

(assert (=> b!101496 (= lt!51426 (getCurrentListMapNoExtraKeys!95 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (_values!2518 (v!2835 (underlying!340 thiss!992))) (mask!6657 (v!2835 (underlying!340 thiss!992))) (extraKeys!2346 (v!2835 (underlying!340 thiss!992))) (zeroValue!2413 (v!2835 (underlying!340 thiss!992))) (minValue!2413 (v!2835 (underlying!340 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2535 (v!2835 (underlying!340 thiss!992)))))))

(declare-fun lt!51411 () (_ BitVec 64))

(assert (=> b!101496 (= lt!51411 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51416 () (_ BitVec 64))

(assert (=> b!101496 (= lt!51416 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!51427 () Unit!3090)

(declare-fun addApplyDifferent!71 (ListLongMap!1525 (_ BitVec 64) V!3177 (_ BitVec 64)) Unit!3090)

(assert (=> b!101496 (= lt!51427 (addApplyDifferent!71 lt!51426 lt!51411 (minValue!2413 (v!2835 (underlying!340 thiss!992))) lt!51416))))

(declare-fun apply!95 (ListLongMap!1525 (_ BitVec 64)) V!3177)

(assert (=> b!101496 (= (apply!95 (+!131 lt!51426 (tuple2!2351 lt!51411 (minValue!2413 (v!2835 (underlying!340 thiss!992))))) lt!51416) (apply!95 lt!51426 lt!51416))))

(declare-fun lt!51422 () Unit!3090)

(assert (=> b!101496 (= lt!51422 lt!51427)))

(declare-fun lt!51409 () ListLongMap!1525)

(assert (=> b!101496 (= lt!51409 (getCurrentListMapNoExtraKeys!95 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (_values!2518 (v!2835 (underlying!340 thiss!992))) (mask!6657 (v!2835 (underlying!340 thiss!992))) (extraKeys!2346 (v!2835 (underlying!340 thiss!992))) (zeroValue!2413 (v!2835 (underlying!340 thiss!992))) (minValue!2413 (v!2835 (underlying!340 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2535 (v!2835 (underlying!340 thiss!992)))))))

(declare-fun lt!51419 () (_ BitVec 64))

(assert (=> b!101496 (= lt!51419 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51412 () (_ BitVec 64))

(assert (=> b!101496 (= lt!51412 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!51413 () Unit!3090)

(assert (=> b!101496 (= lt!51413 (addApplyDifferent!71 lt!51409 lt!51419 (zeroValue!2413 (v!2835 (underlying!340 thiss!992))) lt!51412))))

(assert (=> b!101496 (= (apply!95 (+!131 lt!51409 (tuple2!2351 lt!51419 (zeroValue!2413 (v!2835 (underlying!340 thiss!992))))) lt!51412) (apply!95 lt!51409 lt!51412))))

(declare-fun lt!51418 () Unit!3090)

(assert (=> b!101496 (= lt!51418 lt!51413)))

(declare-fun lt!51429 () ListLongMap!1525)

(assert (=> b!101496 (= lt!51429 (getCurrentListMapNoExtraKeys!95 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (_values!2518 (v!2835 (underlying!340 thiss!992))) (mask!6657 (v!2835 (underlying!340 thiss!992))) (extraKeys!2346 (v!2835 (underlying!340 thiss!992))) (zeroValue!2413 (v!2835 (underlying!340 thiss!992))) (minValue!2413 (v!2835 (underlying!340 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2535 (v!2835 (underlying!340 thiss!992)))))))

(declare-fun lt!51430 () (_ BitVec 64))

(assert (=> b!101496 (= lt!51430 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51423 () (_ BitVec 64))

(assert (=> b!101496 (= lt!51423 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!101496 (= lt!51414 (addApplyDifferent!71 lt!51429 lt!51430 (minValue!2413 (v!2835 (underlying!340 thiss!992))) lt!51423))))

(assert (=> b!101496 (= (apply!95 (+!131 lt!51429 (tuple2!2351 lt!51430 (minValue!2413 (v!2835 (underlying!340 thiss!992))))) lt!51423) (apply!95 lt!51429 lt!51423))))

(declare-fun bm!10512 () Bool)

(declare-fun call!10517 () ListLongMap!1525)

(assert (=> bm!10512 (= call!10517 (getCurrentListMapNoExtraKeys!95 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (_values!2518 (v!2835 (underlying!340 thiss!992))) (mask!6657 (v!2835 (underlying!340 thiss!992))) (extraKeys!2346 (v!2835 (underlying!340 thiss!992))) (zeroValue!2413 (v!2835 (underlying!340 thiss!992))) (minValue!2413 (v!2835 (underlying!340 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2535 (v!2835 (underlying!340 thiss!992)))))))

(declare-fun b!101497 () Bool)

(declare-fun e!66097 () Bool)

(declare-fun e!66093 () Bool)

(assert (=> b!101497 (= e!66097 e!66093)))

(declare-fun res!50835 () Bool)

(declare-fun call!10516 () Bool)

(assert (=> b!101497 (= res!50835 call!10516)))

(assert (=> b!101497 (=> (not res!50835) (not e!66093))))

(declare-fun b!101498 () Bool)

(assert (=> b!101498 (= e!66092 (not call!10520))))

(declare-fun call!10521 () ListLongMap!1525)

(declare-fun c!17444 () Bool)

(declare-fun call!10515 () ListLongMap!1525)

(declare-fun c!17441 () Bool)

(declare-fun bm!10513 () Bool)

(declare-fun call!10519 () ListLongMap!1525)

(assert (=> bm!10513 (= call!10515 (+!131 (ite c!17444 call!10517 (ite c!17441 call!10519 call!10521)) (ite (or c!17444 c!17441) (tuple2!2351 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2835 (underlying!340 thiss!992)))))))))

(declare-fun b!101499 () Bool)

(declare-fun e!66091 () Bool)

(assert (=> b!101499 (= e!66091 (validKeyInArray!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!101500 () Bool)

(declare-fun lt!51415 () ListLongMap!1525)

(declare-fun e!66098 () Bool)

(assert (=> b!101500 (= e!66098 (= (apply!95 lt!51415 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101500 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2275 (_values!2518 (v!2835 (underlying!340 thiss!992))))))))

(assert (=> b!101500 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992))))))))

(declare-fun b!101501 () Bool)

(assert (=> b!101501 (= e!66095 (= (apply!95 lt!51415 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))))))

(declare-fun bm!10514 () Bool)

(declare-fun call!10518 () ListLongMap!1525)

(assert (=> bm!10514 (= call!10518 call!10515)))

(declare-fun b!101502 () Bool)

(declare-fun e!66090 () ListLongMap!1525)

(assert (=> b!101502 (= e!66090 call!10518)))

(declare-fun b!101503 () Bool)

(assert (=> b!101503 (= e!66097 (not call!10516))))

(declare-fun b!101504 () Bool)

(declare-fun e!66087 () Bool)

(assert (=> b!101504 (= e!66087 (validKeyInArray!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!10515 () Bool)

(assert (=> bm!10515 (= call!10521 call!10519)))

(declare-fun b!101505 () Bool)

(declare-fun Unit!3097 () Unit!3090)

(assert (=> b!101505 (= e!66089 Unit!3097)))

(declare-fun b!101506 () Bool)

(declare-fun e!66088 () ListLongMap!1525)

(assert (=> b!101506 (= e!66088 call!10521)))

(declare-fun b!101507 () Bool)

(declare-fun e!66094 () ListLongMap!1525)

(assert (=> b!101507 (= e!66094 (+!131 call!10515 (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2835 (underlying!340 thiss!992))))))))

(declare-fun b!101508 () Bool)

(declare-fun res!50836 () Bool)

(declare-fun e!66096 () Bool)

(assert (=> b!101508 (=> (not res!50836) (not e!66096))))

(declare-fun e!66086 () Bool)

(assert (=> b!101508 (= res!50836 e!66086)))

(declare-fun res!50841 () Bool)

(assert (=> b!101508 (=> res!50841 e!66086)))

(assert (=> b!101508 (= res!50841 (not e!66087))))

(declare-fun res!50842 () Bool)

(assert (=> b!101508 (=> (not res!50842) (not e!66087))))

(assert (=> b!101508 (= res!50842 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992))))))))

(declare-fun bm!10516 () Bool)

(assert (=> bm!10516 (= call!10516 (contains!807 lt!51415 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101509 () Bool)

(assert (=> b!101509 (= e!66096 e!66097)))

(declare-fun c!17442 () Bool)

(assert (=> b!101509 (= c!17442 (not (= (bvand (extraKeys!2346 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!101510 () Bool)

(assert (=> b!101510 (= e!66088 call!10518)))

(declare-fun b!101511 () Bool)

(assert (=> b!101511 (= e!66086 e!66098)))

(declare-fun res!50843 () Bool)

(assert (=> b!101511 (=> (not res!50843) (not e!66098))))

(assert (=> b!101511 (= res!50843 (contains!807 lt!51415 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!101511 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992))))))))

(declare-fun b!101512 () Bool)

(assert (=> b!101512 (= e!66094 e!66090)))

(assert (=> b!101512 (= c!17441 (and (not (= (bvand (extraKeys!2346 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2346 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!101513 () Bool)

(declare-fun res!50838 () Bool)

(assert (=> b!101513 (=> (not res!50838) (not e!66096))))

(assert (=> b!101513 (= res!50838 e!66092)))

(declare-fun c!17446 () Bool)

(assert (=> b!101513 (= c!17446 (not (= (bvand (extraKeys!2346 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!101514 () Bool)

(declare-fun c!17445 () Bool)

(assert (=> b!101514 (= c!17445 (and (not (= (bvand (extraKeys!2346 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2346 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!101514 (= e!66090 e!66088)))

(declare-fun b!101515 () Bool)

(assert (=> b!101515 (= e!66093 (= (apply!95 lt!51415 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2413 (v!2835 (underlying!340 thiss!992)))))))

(declare-fun bm!10517 () Bool)

(assert (=> bm!10517 (= call!10520 (contains!807 lt!51415 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!10518 () Bool)

(assert (=> bm!10518 (= call!10519 call!10517)))

(declare-fun d!27421 () Bool)

(assert (=> d!27421 e!66096))

(declare-fun res!50839 () Bool)

(assert (=> d!27421 (=> (not res!50839) (not e!66096))))

(assert (=> d!27421 (= res!50839 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992))))))))))

(declare-fun lt!51410 () ListLongMap!1525)

(assert (=> d!27421 (= lt!51415 lt!51410)))

(declare-fun lt!51417 () Unit!3090)

(assert (=> d!27421 (= lt!51417 e!66089)))

(declare-fun c!17443 () Bool)

(assert (=> d!27421 (= c!17443 e!66091)))

(declare-fun res!50840 () Bool)

(assert (=> d!27421 (=> (not res!50840) (not e!66091))))

(assert (=> d!27421 (= res!50840 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992))))))))

(assert (=> d!27421 (= lt!51410 e!66094)))

(assert (=> d!27421 (= c!17444 (and (not (= (bvand (extraKeys!2346 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2346 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27421 (validMask!0 (mask!6657 (v!2835 (underlying!340 thiss!992))))))

(assert (=> d!27421 (= (getCurrentListMap!457 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (_values!2518 (v!2835 (underlying!340 thiss!992))) (mask!6657 (v!2835 (underlying!340 thiss!992))) (extraKeys!2346 (v!2835 (underlying!340 thiss!992))) (zeroValue!2413 (v!2835 (underlying!340 thiss!992))) (minValue!2413 (v!2835 (underlying!340 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2535 (v!2835 (underlying!340 thiss!992)))) lt!51415)))

(assert (= (and d!27421 c!17444) b!101507))

(assert (= (and d!27421 (not c!17444)) b!101512))

(assert (= (and b!101512 c!17441) b!101502))

(assert (= (and b!101512 (not c!17441)) b!101514))

(assert (= (and b!101514 c!17445) b!101510))

(assert (= (and b!101514 (not c!17445)) b!101506))

(assert (= (or b!101510 b!101506) bm!10515))

(assert (= (or b!101502 bm!10515) bm!10518))

(assert (= (or b!101502 b!101510) bm!10514))

(assert (= (or b!101507 bm!10518) bm!10512))

(assert (= (or b!101507 bm!10514) bm!10513))

(assert (= (and d!27421 res!50840) b!101499))

(assert (= (and d!27421 c!17443) b!101496))

(assert (= (and d!27421 (not c!17443)) b!101505))

(assert (= (and d!27421 res!50839) b!101508))

(assert (= (and b!101508 res!50842) b!101504))

(assert (= (and b!101508 (not res!50841)) b!101511))

(assert (= (and b!101511 res!50843) b!101500))

(assert (= (and b!101508 res!50836) b!101513))

(assert (= (and b!101513 c!17446) b!101495))

(assert (= (and b!101513 (not c!17446)) b!101498))

(assert (= (and b!101495 res!50837) b!101501))

(assert (= (or b!101495 b!101498) bm!10517))

(assert (= (and b!101513 res!50838) b!101509))

(assert (= (and b!101509 c!17442) b!101497))

(assert (= (and b!101509 (not c!17442)) b!101503))

(assert (= (and b!101497 res!50835) b!101515))

(assert (= (or b!101497 b!101503) bm!10516))

(declare-fun b_lambda!4537 () Bool)

(assert (=> (not b_lambda!4537) (not b!101500)))

(assert (=> b!101500 t!5597))

(declare-fun b_and!6245 () Bool)

(assert (= b_and!6225 (and (=> t!5597 result!3331) b_and!6245)))

(assert (=> b!101500 t!5599))

(declare-fun b_and!6247 () Bool)

(assert (= b_and!6227 (and (=> t!5599 result!3335) b_and!6247)))

(declare-fun m!112117 () Bool)

(assert (=> bm!10516 m!112117))

(assert (=> d!27421 m!111987))

(declare-fun m!112119 () Bool)

(assert (=> b!101515 m!112119))

(declare-fun m!112121 () Bool)

(assert (=> b!101501 m!112121))

(declare-fun m!112123 () Bool)

(assert (=> b!101507 m!112123))

(declare-fun m!112125 () Bool)

(assert (=> bm!10517 m!112125))

(declare-fun m!112127 () Bool)

(assert (=> b!101511 m!112127))

(assert (=> b!101511 m!112127))

(declare-fun m!112129 () Bool)

(assert (=> b!101511 m!112129))

(assert (=> b!101499 m!112127))

(assert (=> b!101499 m!112127))

(declare-fun m!112131 () Bool)

(assert (=> b!101499 m!112131))

(declare-fun m!112133 () Bool)

(assert (=> b!101496 m!112133))

(declare-fun m!112135 () Bool)

(assert (=> b!101496 m!112135))

(assert (=> b!101496 m!112135))

(declare-fun m!112137 () Bool)

(assert (=> b!101496 m!112137))

(declare-fun m!112139 () Bool)

(assert (=> b!101496 m!112139))

(assert (=> b!101496 m!112133))

(declare-fun m!112141 () Bool)

(assert (=> b!101496 m!112141))

(declare-fun m!112143 () Bool)

(assert (=> b!101496 m!112143))

(declare-fun m!112145 () Bool)

(assert (=> b!101496 m!112145))

(assert (=> b!101496 m!112143))

(declare-fun m!112147 () Bool)

(assert (=> b!101496 m!112147))

(declare-fun m!112149 () Bool)

(assert (=> b!101496 m!112149))

(declare-fun m!112151 () Bool)

(assert (=> b!101496 m!112151))

(declare-fun m!112153 () Bool)

(assert (=> b!101496 m!112153))

(assert (=> b!101496 m!112127))

(declare-fun m!112155 () Bool)

(assert (=> b!101496 m!112155))

(declare-fun m!112157 () Bool)

(assert (=> b!101496 m!112157))

(declare-fun m!112159 () Bool)

(assert (=> b!101496 m!112159))

(declare-fun m!112161 () Bool)

(assert (=> b!101496 m!112161))

(assert (=> b!101496 m!112155))

(declare-fun m!112163 () Bool)

(assert (=> b!101496 m!112163))

(declare-fun m!112165 () Bool)

(assert (=> bm!10513 m!112165))

(assert (=> b!101504 m!112127))

(assert (=> b!101504 m!112127))

(assert (=> b!101504 m!112131))

(assert (=> b!101500 m!111981))

(declare-fun m!112167 () Bool)

(assert (=> b!101500 m!112167))

(assert (=> b!101500 m!111981))

(declare-fun m!112169 () Bool)

(assert (=> b!101500 m!112169))

(assert (=> b!101500 m!112167))

(assert (=> b!101500 m!112127))

(assert (=> b!101500 m!112127))

(declare-fun m!112171 () Bool)

(assert (=> b!101500 m!112171))

(assert (=> bm!10512 m!112151))

(assert (=> b!101291 d!27421))

(declare-fun d!27423 () Bool)

(assert (=> d!27423 (not (arrayContainsKey!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!51433 () Unit!3090)

(declare-fun choose!68 (array!4259 (_ BitVec 32) (_ BitVec 64) List!1600) Unit!3090)

(assert (=> d!27423 (= lt!51433 (choose!68 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (Cons!1596 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) Nil!1597)))))

(assert (=> d!27423 (bvslt (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!27423 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (Cons!1596 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) Nil!1597)) lt!51433)))

(declare-fun bs!4184 () Bool)

(assert (= bs!4184 d!27423))

(assert (=> bs!4184 m!111961))

(assert (=> bs!4184 m!111965))

(assert (=> bs!4184 m!111961))

(declare-fun m!112173 () Bool)

(assert (=> bs!4184 m!112173))

(assert (=> b!101288 d!27423))

(declare-fun d!27425 () Bool)

(assert (=> d!27425 (arrayNoDuplicates!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) from!355 Nil!1597)))

(declare-fun lt!51436 () Unit!3090)

(declare-fun choose!39 (array!4259 (_ BitVec 32) (_ BitVec 32)) Unit!3090)

(assert (=> d!27425 (= lt!51436 (choose!39 (_keys!4234 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!27425 (bvslt (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!27425 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000000000000 from!355) lt!51436)))

(declare-fun bs!4185 () Bool)

(assert (= bs!4185 d!27425))

(assert (=> bs!4185 m!111959))

(declare-fun m!112175 () Bool)

(assert (=> bs!4185 m!112175))

(assert (=> b!101288 d!27425))

(declare-fun d!27427 () Bool)

(declare-fun res!50848 () Bool)

(declare-fun e!66103 () Bool)

(assert (=> d!27427 (=> res!50848 e!66103)))

(assert (=> d!27427 (= res!50848 (= (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(assert (=> d!27427 (= (arrayContainsKey!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!66103)))

(declare-fun b!101520 () Bool)

(declare-fun e!66104 () Bool)

(assert (=> b!101520 (= e!66103 e!66104)))

(declare-fun res!50849 () Bool)

(assert (=> b!101520 (=> (not res!50849) (not e!66104))))

(assert (=> b!101520 (= res!50849 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992))))))))

(declare-fun b!101521 () Bool)

(assert (=> b!101521 (= e!66104 (arrayContainsKey!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!27427 (not res!50848)) b!101520))

(assert (= (and b!101520 res!50849) b!101521))

(assert (=> d!27427 m!112127))

(assert (=> b!101521 m!111961))

(declare-fun m!112177 () Bool)

(assert (=> b!101521 m!112177))

(assert (=> b!101288 d!27427))

(declare-fun d!27429 () Bool)

(declare-fun e!66107 () Bool)

(assert (=> d!27429 e!66107))

(declare-fun c!17449 () Bool)

(assert (=> d!27429 (= c!17449 (and (not (= (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!51439 () Unit!3090)

(declare-fun choose!632 (array!4259 array!4261 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 64) (_ BitVec 32) Int) Unit!3090)

(assert (=> d!27429 (= lt!51439 (choose!632 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (_values!2518 (v!2835 (underlying!340 thiss!992))) (mask!6657 (v!2835 (underlying!340 thiss!992))) (extraKeys!2346 (v!2835 (underlying!340 thiss!992))) (zeroValue!2413 (v!2835 (underlying!340 thiss!992))) (minValue!2413 (v!2835 (underlying!340 thiss!992))) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2535 (v!2835 (underlying!340 thiss!992)))))))

(assert (=> d!27429 (validMask!0 (mask!6657 (v!2835 (underlying!340 thiss!992))))))

(assert (=> d!27429 (= (lemmaListMapContainsThenArrayContainsFrom!102 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (_values!2518 (v!2835 (underlying!340 thiss!992))) (mask!6657 (v!2835 (underlying!340 thiss!992))) (extraKeys!2346 (v!2835 (underlying!340 thiss!992))) (zeroValue!2413 (v!2835 (underlying!340 thiss!992))) (minValue!2413 (v!2835 (underlying!340 thiss!992))) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2535 (v!2835 (underlying!340 thiss!992)))) lt!51439)))

(declare-fun b!101526 () Bool)

(assert (=> b!101526 (= e!66107 (arrayContainsKey!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!101527 () Bool)

(assert (=> b!101527 (= e!66107 (ite (= (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2346 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2346 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!27429 c!17449) b!101526))

(assert (= (and d!27429 (not c!17449)) b!101527))

(assert (=> d!27429 m!111961))

(declare-fun m!112179 () Bool)

(assert (=> d!27429 m!112179))

(assert (=> d!27429 m!111987))

(assert (=> b!101526 m!111961))

(assert (=> b!101526 m!111965))

(assert (=> b!101288 d!27429))

(declare-fun b!101528 () Bool)

(declare-fun e!66109 () Bool)

(assert (=> b!101528 (= e!66109 (contains!808 Nil!1597 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(declare-fun b!101529 () Bool)

(declare-fun e!66110 () Bool)

(declare-fun e!66108 () Bool)

(assert (=> b!101529 (= e!66110 e!66108)))

(declare-fun res!50850 () Bool)

(assert (=> b!101529 (=> (not res!50850) (not e!66108))))

(assert (=> b!101529 (= res!50850 (not e!66109))))

(declare-fun res!50852 () Bool)

(assert (=> b!101529 (=> (not res!50852) (not e!66109))))

(assert (=> b!101529 (= res!50852 (validKeyInArray!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(declare-fun b!101530 () Bool)

(declare-fun e!66111 () Bool)

(declare-fun call!10522 () Bool)

(assert (=> b!101530 (= e!66111 call!10522)))

(declare-fun b!101531 () Bool)

(assert (=> b!101531 (= e!66108 e!66111)))

(declare-fun c!17450 () Bool)

(assert (=> b!101531 (= c!17450 (validKeyInArray!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(declare-fun bm!10519 () Bool)

(assert (=> bm!10519 (= call!10522 (arrayNoDuplicates!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!17450 (Cons!1596 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) Nil!1597) Nil!1597)))))

(declare-fun d!27431 () Bool)

(declare-fun res!50851 () Bool)

(assert (=> d!27431 (=> res!50851 e!66110)))

(assert (=> d!27431 (= res!50851 (bvsge from!355 (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992))))))))

(assert (=> d!27431 (= (arrayNoDuplicates!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) from!355 Nil!1597) e!66110)))

(declare-fun b!101532 () Bool)

(assert (=> b!101532 (= e!66111 call!10522)))

(assert (= (and d!27431 (not res!50851)) b!101529))

(assert (= (and b!101529 res!50852) b!101528))

(assert (= (and b!101529 res!50850) b!101531))

(assert (= (and b!101531 c!17450) b!101532))

(assert (= (and b!101531 (not c!17450)) b!101530))

(assert (= (or b!101532 b!101530) bm!10519))

(assert (=> b!101528 m!111961))

(assert (=> b!101528 m!111961))

(declare-fun m!112181 () Bool)

(assert (=> b!101528 m!112181))

(assert (=> b!101529 m!111961))

(assert (=> b!101529 m!111961))

(declare-fun m!112183 () Bool)

(assert (=> b!101529 m!112183))

(assert (=> b!101531 m!111961))

(assert (=> b!101531 m!111961))

(assert (=> b!101531 m!112183))

(assert (=> bm!10519 m!111961))

(declare-fun m!112185 () Bool)

(assert (=> bm!10519 m!112185))

(assert (=> b!101288 d!27431))

(declare-fun d!27433 () Bool)

(assert (=> d!27433 (= (array_inv!1269 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvsge (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!101289 d!27433))

(declare-fun d!27435 () Bool)

(assert (=> d!27435 (= (array_inv!1270 (_values!2518 (v!2835 (underlying!340 thiss!992)))) (bvsge (size!2275 (_values!2518 (v!2835 (underlying!340 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!101289 d!27435))

(declare-fun d!27437 () Bool)

(assert (=> d!27437 (= (valid!404 thiss!992) (valid!403 (v!2835 (underlying!340 thiss!992))))))

(declare-fun bs!4186 () Bool)

(assert (= bs!4186 d!27437))

(declare-fun m!112187 () Bool)

(assert (=> bs!4186 m!112187))

(assert (=> start!12044 d!27437))

(declare-fun d!27439 () Bool)

(declare-fun e!66116 () Bool)

(assert (=> d!27439 e!66116))

(declare-fun res!50855 () Bool)

(assert (=> d!27439 (=> res!50855 e!66116)))

(declare-fun lt!51450 () Bool)

(assert (=> d!27439 (= res!50855 (not lt!51450))))

(declare-fun lt!51449 () Bool)

(assert (=> d!27439 (= lt!51450 lt!51449)))

(declare-fun lt!51451 () Unit!3090)

(declare-fun e!66117 () Unit!3090)

(assert (=> d!27439 (= lt!51451 e!66117)))

(declare-fun c!17453 () Bool)

(assert (=> d!27439 (= c!17453 lt!51449)))

(declare-fun containsKey!155 (List!1599 (_ BitVec 64)) Bool)

(assert (=> d!27439 (= lt!51449 (containsKey!155 (toList!778 lt!51312) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(assert (=> d!27439 (= (contains!807 lt!51312 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)) lt!51450)))

(declare-fun b!101539 () Bool)

(declare-fun lt!51448 () Unit!3090)

(assert (=> b!101539 (= e!66117 lt!51448)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!104 (List!1599 (_ BitVec 64)) Unit!3090)

(assert (=> b!101539 (= lt!51448 (lemmaContainsKeyImpliesGetValueByKeyDefined!104 (toList!778 lt!51312) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(declare-datatypes ((Option!157 0))(
  ( (Some!156 (v!2841 V!3177)) (None!155) )
))
(declare-fun isDefined!105 (Option!157) Bool)

(declare-fun getValueByKey!151 (List!1599 (_ BitVec 64)) Option!157)

(assert (=> b!101539 (isDefined!105 (getValueByKey!151 (toList!778 lt!51312) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(declare-fun b!101540 () Bool)

(declare-fun Unit!3098 () Unit!3090)

(assert (=> b!101540 (= e!66117 Unit!3098)))

(declare-fun b!101541 () Bool)

(assert (=> b!101541 (= e!66116 (isDefined!105 (getValueByKey!151 (toList!778 lt!51312) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355))))))

(assert (= (and d!27439 c!17453) b!101539))

(assert (= (and d!27439 (not c!17453)) b!101540))

(assert (= (and d!27439 (not res!50855)) b!101541))

(assert (=> d!27439 m!111961))

(declare-fun m!112189 () Bool)

(assert (=> d!27439 m!112189))

(assert (=> b!101539 m!111961))

(declare-fun m!112191 () Bool)

(assert (=> b!101539 m!112191))

(assert (=> b!101539 m!111961))

(declare-fun m!112193 () Bool)

(assert (=> b!101539 m!112193))

(assert (=> b!101539 m!112193))

(declare-fun m!112195 () Bool)

(assert (=> b!101539 m!112195))

(assert (=> b!101541 m!111961))

(assert (=> b!101541 m!112193))

(assert (=> b!101541 m!112193))

(assert (=> b!101541 m!112195))

(assert (=> b!101280 d!27439))

(declare-fun bm!10568 () Bool)

(declare-fun call!10584 () Bool)

(assert (=> bm!10568 (= call!10584 (arrayContainsKey!0 (_keys!4234 newMap!16) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!101626 () Bool)

(declare-fun res!50891 () Bool)

(declare-fun lt!51508 () SeekEntryResult!259)

(assert (=> b!101626 (= res!50891 (= (select (arr!2020 (_keys!4234 newMap!16)) (index!3185 lt!51508)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!66172 () Bool)

(assert (=> b!101626 (=> (not res!50891) (not e!66172))))

(declare-fun bm!10569 () Bool)

(declare-fun c!17491 () Bool)

(declare-fun c!17490 () Bool)

(assert (=> bm!10569 (= c!17491 c!17490)))

(declare-fun call!10582 () Bool)

(declare-fun e!66163 () ListLongMap!1525)

(assert (=> bm!10569 (= call!10582 (contains!807 e!66163 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(declare-fun b!101627 () Bool)

(declare-fun lt!51519 () Unit!3090)

(declare-fun e!66165 () Unit!3090)

(assert (=> b!101627 (= lt!51519 e!66165)))

(declare-fun c!17488 () Bool)

(assert (=> b!101627 (= c!17488 call!10582)))

(declare-fun e!66181 () tuple2!2348)

(assert (=> b!101627 (= e!66181 (tuple2!2349 false newMap!16))))

(declare-fun b!101628 () Bool)

(declare-fun lt!51515 () tuple2!2348)

(declare-fun call!10572 () tuple2!2348)

(assert (=> b!101628 (= lt!51515 call!10572)))

(declare-fun e!66177 () tuple2!2348)

(assert (=> b!101628 (= e!66177 (tuple2!2349 (_1!1185 lt!51515) (_2!1185 lt!51515)))))

(declare-fun b!101629 () Bool)

(declare-fun c!17493 () Bool)

(declare-fun lt!51512 () SeekEntryResult!259)

(assert (=> b!101629 (= c!17493 ((_ is MissingVacant!259) lt!51512))))

(declare-fun e!66167 () Bool)

(declare-fun e!66175 () Bool)

(assert (=> b!101629 (= e!66167 e!66175)))

(declare-fun b!101630 () Bool)

(declare-fun res!50893 () Bool)

(assert (=> b!101630 (= res!50893 (= (select (arr!2020 (_keys!4234 newMap!16)) (index!3185 lt!51512)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!66174 () Bool)

(assert (=> b!101630 (=> (not res!50893) (not e!66174))))

(declare-fun bm!10570 () Bool)

(declare-fun call!10576 () ListLongMap!1525)

(declare-fun call!10580 () ListLongMap!1525)

(assert (=> bm!10570 (= call!10576 call!10580)))

(declare-fun b!101631 () Bool)

(assert (=> b!101631 (= e!66163 call!10576)))

(declare-fun b!101632 () Bool)

(declare-fun lt!51510 () Unit!3090)

(declare-fun lt!51527 () Unit!3090)

(assert (=> b!101632 (= lt!51510 lt!51527)))

(declare-fun call!10573 () ListLongMap!1525)

(declare-fun call!10578 () ListLongMap!1525)

(assert (=> b!101632 (= call!10573 call!10578)))

(declare-fun lt!51522 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!44 (array!4259 array!4261 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 V!3177 Int) Unit!3090)

(assert (=> b!101632 (= lt!51527 (lemmaChangeLongMinValueKeyThenAddPairToListMap!44 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) lt!51522 (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2535 newMap!16)))))

(assert (=> b!101632 (= lt!51522 (bvor (extraKeys!2346 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!66164 () tuple2!2348)

(assert (=> b!101632 (= e!66164 (tuple2!2349 true (LongMapFixedSize!869 (defaultEntry!2535 newMap!16) (mask!6657 newMap!16) (bvor (extraKeys!2346 newMap!16) #b00000000000000000000000000000010) (zeroValue!2413 newMap!16) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!483 newMap!16) (_keys!4234 newMap!16) (_values!2518 newMap!16) (_vacant!483 newMap!16))))))

(declare-fun c!17486 () Bool)

(declare-fun call!10588 () ListLongMap!1525)

(declare-fun bm!10571 () Bool)

(declare-fun e!66178 () ListLongMap!1525)

(declare-fun c!17489 () Bool)

(assert (=> bm!10571 (= call!10588 (+!131 e!66178 (ite c!17489 (ite c!17486 (tuple2!2351 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2351 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!17482 () Bool)

(assert (=> bm!10571 (= c!17482 c!17489)))

(declare-fun b!101633 () Bool)

(declare-fun e!66179 () Unit!3090)

(declare-fun Unit!3099 () Unit!3090)

(assert (=> b!101633 (= e!66179 Unit!3099)))

(declare-fun lt!51526 () Unit!3090)

(declare-fun call!10583 () Unit!3090)

(assert (=> b!101633 (= lt!51526 call!10583)))

(declare-fun call!10592 () SeekEntryResult!259)

(assert (=> b!101633 (= lt!51508 call!10592)))

(declare-fun c!17483 () Bool)

(assert (=> b!101633 (= c!17483 ((_ is MissingZero!259) lt!51508))))

(declare-fun e!66170 () Bool)

(assert (=> b!101633 e!66170))

(declare-fun lt!51521 () Unit!3090)

(assert (=> b!101633 (= lt!51521 lt!51526)))

(assert (=> b!101633 false))

(declare-fun b!101634 () Bool)

(declare-fun call!10587 () Bool)

(assert (=> b!101634 (= e!66172 (not call!10587))))

(declare-fun bm!10572 () Bool)

(declare-fun call!10594 () SeekEntryResult!259)

(assert (=> bm!10572 (= call!10592 call!10594)))

(declare-fun b!101635 () Bool)

(declare-fun call!10571 () Bool)

(assert (=> b!101635 (= e!66174 (not call!10571))))

(declare-fun b!101636 () Bool)

(declare-fun e!66183 () tuple2!2348)

(declare-fun lt!51523 () tuple2!2348)

(assert (=> b!101636 (= e!66183 (tuple2!2349 (_1!1185 lt!51523) (_2!1185 lt!51523)))))

(assert (=> b!101636 (= lt!51523 call!10572)))

(declare-fun b!101637 () Bool)

(declare-fun e!66176 () Bool)

(assert (=> b!101637 (= e!66176 (not call!10571))))

(declare-fun b!101638 () Bool)

(declare-fun e!66182 () Bool)

(declare-fun call!10593 () ListLongMap!1525)

(declare-fun call!10581 () ListLongMap!1525)

(assert (=> b!101638 (= e!66182 (= call!10593 call!10581))))

(declare-fun bm!10573 () Bool)

(declare-fun call!10579 () Bool)

(declare-fun call!10591 () Bool)

(assert (=> bm!10573 (= call!10579 call!10591)))

(declare-fun b!101639 () Bool)

(declare-fun Unit!3100 () Unit!3090)

(assert (=> b!101639 (= e!66165 Unit!3100)))

(declare-fun lt!51516 () Unit!3090)

(declare-fun call!10575 () Unit!3090)

(assert (=> b!101639 (= lt!51516 call!10575)))

(declare-fun lt!51532 () SeekEntryResult!259)

(declare-fun call!10586 () SeekEntryResult!259)

(assert (=> b!101639 (= lt!51532 call!10586)))

(declare-fun res!50892 () Bool)

(assert (=> b!101639 (= res!50892 ((_ is Found!259) lt!51532))))

(declare-fun e!66169 () Bool)

(assert (=> b!101639 (=> (not res!50892) (not e!66169))))

(assert (=> b!101639 e!66169))

(declare-fun lt!51525 () Unit!3090)

(assert (=> b!101639 (= lt!51525 lt!51516)))

(assert (=> b!101639 false))

(declare-fun b!101640 () Bool)

(declare-fun lt!51529 () Unit!3090)

(declare-fun lt!51511 () Unit!3090)

(assert (=> b!101640 (= lt!51529 lt!51511)))

(assert (=> b!101640 (= call!10573 call!10578)))

(declare-fun lt!51524 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!44 (array!4259 array!4261 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 V!3177 Int) Unit!3090)

(assert (=> b!101640 (= lt!51511 (lemmaChangeZeroKeyThenAddPairToListMap!44 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) lt!51524 (zeroValue!2413 newMap!16) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2413 newMap!16) (defaultEntry!2535 newMap!16)))))

(assert (=> b!101640 (= lt!51524 (bvor (extraKeys!2346 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!101640 (= e!66164 (tuple2!2349 true (LongMapFixedSize!869 (defaultEntry!2535 newMap!16) (mask!6657 newMap!16) (bvor (extraKeys!2346 newMap!16) #b00000000000000000000000000000001) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2413 newMap!16) (_size!483 newMap!16) (_keys!4234 newMap!16) (_values!2518 newMap!16) (_vacant!483 newMap!16))))))

(declare-fun b!101641 () Bool)

(assert (=> b!101641 (= e!66169 (= (select (arr!2020 (_keys!4234 newMap!16)) (index!3183 lt!51532)) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(declare-fun b!101642 () Bool)

(declare-fun call!10590 () ListLongMap!1525)

(assert (=> b!101642 (= e!66178 call!10590)))

(declare-fun c!17495 () Bool)

(declare-fun c!17487 () Bool)

(declare-fun bm!10574 () Bool)

(declare-fun lt!51514 () SeekEntryResult!259)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!10574 (= call!10591 (inRange!0 (ite c!17490 (ite c!17488 (index!3183 lt!51532) (ite c!17495 (index!3182 lt!51512) (index!3185 lt!51512))) (ite c!17487 (index!3183 lt!51514) (ite c!17483 (index!3182 lt!51508) (index!3185 lt!51508)))) (mask!6657 newMap!16)))))

(declare-fun b!101643 () Bool)

(declare-fun res!50887 () Bool)

(assert (=> b!101643 (= res!50887 call!10579)))

(declare-fun e!66180 () Bool)

(assert (=> b!101643 (=> (not res!50887) (not e!66180))))

(declare-fun bm!10575 () Bool)

(assert (=> bm!10575 (= call!10581 (map!1253 newMap!16))))

(declare-fun b!101644 () Bool)

(declare-fun res!50885 () Bool)

(assert (=> b!101644 (=> (not res!50885) (not e!66176))))

(assert (=> b!101644 (= res!50885 (= (select (arr!2020 (_keys!4234 newMap!16)) (index!3182 lt!51512)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101645 () Bool)

(declare-fun e!66171 () Bool)

(assert (=> b!101645 (= e!66171 e!66182)))

(declare-fun c!17492 () Bool)

(declare-fun lt!51517 () tuple2!2348)

(assert (=> b!101645 (= c!17492 (_1!1185 lt!51517))))

(declare-fun b!101646 () Bool)

(declare-fun lt!51513 () Unit!3090)

(assert (=> b!101646 (= e!66179 lt!51513)))

(assert (=> b!101646 (= lt!51513 call!10575)))

(assert (=> b!101646 (= lt!51514 call!10592)))

(declare-fun res!50884 () Bool)

(assert (=> b!101646 (= res!50884 ((_ is Found!259) lt!51514))))

(assert (=> b!101646 (=> (not res!50884) (not e!66180))))

(assert (=> b!101646 e!66180))

(declare-fun bm!10576 () Bool)

(declare-fun lt!51507 () array!4261)

(assert (=> bm!10576 (= call!10580 (getCurrentListMap!457 (_keys!4234 newMap!16) (ite (or c!17489 c!17490) (_values!2518 newMap!16) lt!51507) (mask!6657 newMap!16) (ite c!17489 (ite c!17486 lt!51524 lt!51522) (extraKeys!2346 newMap!16)) (ite (and c!17489 c!17486) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2413 newMap!16)) (ite c!17489 (ite c!17486 (minValue!2413 newMap!16) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2413 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun call!10585 () ListLongMap!1525)

(declare-fun bm!10577 () Bool)

(declare-fun lt!51518 () SeekEntryResult!259)

(assert (=> bm!10577 (= call!10585 (getCurrentListMap!457 (_keys!4234 newMap!16) (ite c!17489 (_values!2518 newMap!16) (array!4262 (store (arr!2021 (_values!2518 newMap!16)) (index!3183 lt!51518) (ValueCellFull!980 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2275 (_values!2518 newMap!16)))) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun bm!10578 () Bool)

(assert (=> bm!10578 (= call!10586 call!10594)))

(declare-fun bm!10579 () Bool)

(declare-fun call!10574 () Bool)

(assert (=> bm!10579 (= call!10574 call!10579)))

(declare-fun b!101647 () Bool)

(declare-fun c!17485 () Bool)

(assert (=> b!101647 (= c!17485 ((_ is MissingVacant!259) lt!51518))))

(assert (=> b!101647 (= e!66181 e!66183)))

(declare-fun b!101648 () Bool)

(assert (=> b!101648 (= e!66183 e!66177)))

(declare-fun c!17484 () Bool)

(assert (=> b!101648 (= c!17484 ((_ is MissingZero!259) lt!51518))))

(declare-fun b!101649 () Bool)

(declare-fun e!66162 () tuple2!2348)

(assert (=> b!101649 (= e!66162 e!66181)))

(assert (=> b!101649 (= lt!51518 (seekEntryOrOpen!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (_keys!4234 newMap!16) (mask!6657 newMap!16)))))

(assert (=> b!101649 (= c!17490 ((_ is Undefined!259) lt!51518))))

(declare-fun b!101650 () Bool)

(assert (=> b!101650 (= e!66175 ((_ is Undefined!259) lt!51512))))

(declare-fun bm!10580 () Bool)

(assert (=> bm!10580 (= call!10573 call!10588)))

(declare-fun b!101651 () Bool)

(declare-fun e!66168 () Bool)

(assert (=> b!101651 (= e!66168 ((_ is Undefined!259) lt!51508))))

(declare-fun bm!10581 () Bool)

(assert (=> bm!10581 (= call!10594 (seekEntryOrOpen!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (_keys!4234 newMap!16) (mask!6657 newMap!16)))))

(declare-fun b!101652 () Bool)

(assert (=> b!101652 (= e!66175 e!66174)))

(declare-fun res!50889 () Bool)

(declare-fun call!10589 () Bool)

(assert (=> b!101652 (= res!50889 call!10589)))

(assert (=> b!101652 (=> (not res!50889) (not e!66174))))

(declare-fun bm!10582 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!44 (array!4259 array!4261 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 64) Int) Unit!3090)

(assert (=> bm!10582 (= call!10583 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!44 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (defaultEntry!2535 newMap!16)))))

(declare-fun b!101653 () Bool)

(declare-fun res!50897 () Bool)

(declare-fun e!66173 () Bool)

(assert (=> b!101653 (=> (not res!50897) (not e!66173))))

(assert (=> b!101653 (= res!50897 call!10574)))

(assert (=> b!101653 (= e!66170 e!66173)))

(declare-fun b!101654 () Bool)

(declare-fun res!50895 () Bool)

(assert (=> b!101654 (=> (not res!50895) (not e!66173))))

(assert (=> b!101654 (= res!50895 (= (select (arr!2020 (_keys!4234 newMap!16)) (index!3182 lt!51508)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101655 () Bool)

(assert (=> b!101655 (= e!66173 (not call!10587))))

(declare-fun b!101656 () Bool)

(declare-fun lt!51506 () Unit!3090)

(declare-fun lt!51531 () Unit!3090)

(assert (=> b!101656 (= lt!51506 lt!51531)))

(assert (=> b!101656 (contains!807 call!10576 (select (arr!2020 (_keys!4234 newMap!16)) (index!3183 lt!51518)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!103 (array!4259 array!4261 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 32) Int) Unit!3090)

(assert (=> b!101656 (= lt!51531 (lemmaValidKeyInArrayIsInListMap!103 (_keys!4234 newMap!16) lt!51507 (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (index!3183 lt!51518) (defaultEntry!2535 newMap!16)))))

(assert (=> b!101656 (= lt!51507 (array!4262 (store (arr!2021 (_values!2518 newMap!16)) (index!3183 lt!51518) (ValueCellFull!980 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2275 (_values!2518 newMap!16))))))

(declare-fun lt!51520 () Unit!3090)

(declare-fun lt!51530 () Unit!3090)

(assert (=> b!101656 (= lt!51520 lt!51530)))

(assert (=> b!101656 (= call!10588 call!10585)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!44 (array!4259 array!4261 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 32) (_ BitVec 64) V!3177 Int) Unit!3090)

(assert (=> b!101656 (= lt!51530 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!44 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (index!3183 lt!51518) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51509 () Unit!3090)

(assert (=> b!101656 (= lt!51509 e!66179)))

(assert (=> b!101656 (= c!17487 call!10582)))

(assert (=> b!101656 (= e!66177 (tuple2!2349 true (LongMapFixedSize!869 (defaultEntry!2535 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (_size!483 newMap!16) (_keys!4234 newMap!16) (array!4262 (store (arr!2021 (_values!2518 newMap!16)) (index!3183 lt!51518) (ValueCellFull!980 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2275 (_values!2518 newMap!16))) (_vacant!483 newMap!16))))))

(declare-fun b!101657 () Bool)

(assert (=> b!101657 (= e!66163 (getCurrentListMap!457 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun b!101658 () Bool)

(assert (=> b!101658 (= e!66180 (= (select (arr!2020 (_keys!4234 newMap!16)) (index!3183 lt!51514)) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(declare-fun b!101659 () Bool)

(assert (=> b!101659 (= e!66168 e!66172)))

(declare-fun res!50888 () Bool)

(assert (=> b!101659 (= res!50888 call!10574)))

(assert (=> b!101659 (=> (not res!50888) (not e!66172))))

(declare-fun b!101660 () Bool)

(declare-fun c!17494 () Bool)

(assert (=> b!101660 (= c!17494 ((_ is MissingVacant!259) lt!51508))))

(assert (=> b!101660 (= e!66170 e!66168)))

(declare-fun b!101661 () Bool)

(declare-fun e!66166 () Bool)

(assert (=> b!101661 (= e!66166 (= call!10593 (+!131 call!10581 (tuple2!2351 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!10583 () Bool)

(declare-fun updateHelperNewKey!44 (LongMapFixedSize!868 (_ BitVec 64) V!3177 (_ BitVec 32)) tuple2!2348)

(assert (=> bm!10583 (= call!10572 (updateHelperNewKey!44 newMap!16 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!17485 (index!3185 lt!51518) (index!3182 lt!51518))))))

(declare-fun bm!10584 () Bool)

(assert (=> bm!10584 (= call!10571 call!10584)))

(declare-fun bm!10585 () Bool)

(assert (=> bm!10585 (= call!10578 call!10580)))

(declare-fun bm!10586 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!44 (array!4259 array!4261 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 64) Int) Unit!3090)

(assert (=> bm!10586 (= call!10575 (lemmaInListMapThenSeekEntryOrOpenFindsIt!44 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (defaultEntry!2535 newMap!16)))))

(declare-fun bm!10587 () Bool)

(assert (=> bm!10587 (= call!10593 (map!1253 (_2!1185 lt!51517)))))

(declare-fun b!101662 () Bool)

(assert (=> b!101662 (= e!66178 (getCurrentListMap!457 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun bm!10588 () Bool)

(declare-fun call!10577 () Bool)

(assert (=> bm!10588 (= call!10589 call!10577)))

(declare-fun bm!10589 () Bool)

(assert (=> bm!10589 (= call!10590 call!10585)))

(declare-fun d!27441 () Bool)

(assert (=> d!27441 e!66171))

(declare-fun res!50894 () Bool)

(assert (=> d!27441 (=> (not res!50894) (not e!66171))))

(assert (=> d!27441 (= res!50894 (valid!403 (_2!1185 lt!51517)))))

(assert (=> d!27441 (= lt!51517 e!66162)))

(assert (=> d!27441 (= c!17489 (= (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (bvneg (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355))))))

(assert (=> d!27441 (valid!403 newMap!16)))

(assert (=> d!27441 (= (update!152 newMap!16 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!51517)))

(declare-fun bm!10590 () Bool)

(assert (=> bm!10590 (= call!10577 call!10591)))

(declare-fun b!101663 () Bool)

(declare-fun lt!51528 () Unit!3090)

(assert (=> b!101663 (= e!66165 lt!51528)))

(assert (=> b!101663 (= lt!51528 call!10583)))

(assert (=> b!101663 (= lt!51512 call!10586)))

(assert (=> b!101663 (= c!17495 ((_ is MissingZero!259) lt!51512))))

(assert (=> b!101663 e!66167))

(declare-fun b!101664 () Bool)

(declare-fun res!50896 () Bool)

(assert (=> b!101664 (=> (not res!50896) (not e!66176))))

(assert (=> b!101664 (= res!50896 call!10589)))

(assert (=> b!101664 (= e!66167 e!66176)))

(declare-fun bm!10591 () Bool)

(assert (=> bm!10591 (= call!10587 call!10584)))

(declare-fun b!101665 () Bool)

(assert (=> b!101665 (= e!66182 e!66166)))

(declare-fun res!50886 () Bool)

(assert (=> b!101665 (= res!50886 (contains!807 call!10593 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(assert (=> b!101665 (=> (not res!50886) (not e!66166))))

(declare-fun b!101666 () Bool)

(declare-fun res!50890 () Bool)

(assert (=> b!101666 (= res!50890 call!10577)))

(assert (=> b!101666 (=> (not res!50890) (not e!66169))))

(declare-fun b!101667 () Bool)

(assert (=> b!101667 (= e!66162 e!66164)))

(assert (=> b!101667 (= c!17486 (= (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!27441 c!17489) b!101667))

(assert (= (and d!27441 (not c!17489)) b!101649))

(assert (= (and b!101667 c!17486) b!101640))

(assert (= (and b!101667 (not c!17486)) b!101632))

(assert (= (or b!101640 b!101632) bm!10585))

(assert (= (or b!101640 b!101632) bm!10589))

(assert (= (or b!101640 b!101632) bm!10580))

(assert (= (and b!101649 c!17490) b!101627))

(assert (= (and b!101649 (not c!17490)) b!101647))

(assert (= (and b!101627 c!17488) b!101639))

(assert (= (and b!101627 (not c!17488)) b!101663))

(assert (= (and b!101639 res!50892) b!101666))

(assert (= (and b!101666 res!50890) b!101641))

(assert (= (and b!101663 c!17495) b!101664))

(assert (= (and b!101663 (not c!17495)) b!101629))

(assert (= (and b!101664 res!50896) b!101644))

(assert (= (and b!101644 res!50885) b!101637))

(assert (= (and b!101629 c!17493) b!101652))

(assert (= (and b!101629 (not c!17493)) b!101650))

(assert (= (and b!101652 res!50889) b!101630))

(assert (= (and b!101630 res!50893) b!101635))

(assert (= (or b!101664 b!101652) bm!10588))

(assert (= (or b!101637 b!101635) bm!10584))

(assert (= (or b!101666 bm!10588) bm!10590))

(assert (= (or b!101639 b!101663) bm!10578))

(assert (= (and b!101647 c!17485) b!101636))

(assert (= (and b!101647 (not c!17485)) b!101648))

(assert (= (and b!101648 c!17484) b!101628))

(assert (= (and b!101648 (not c!17484)) b!101656))

(assert (= (and b!101656 c!17487) b!101646))

(assert (= (and b!101656 (not c!17487)) b!101633))

(assert (= (and b!101646 res!50884) b!101643))

(assert (= (and b!101643 res!50887) b!101658))

(assert (= (and b!101633 c!17483) b!101653))

(assert (= (and b!101633 (not c!17483)) b!101660))

(assert (= (and b!101653 res!50897) b!101654))

(assert (= (and b!101654 res!50895) b!101655))

(assert (= (and b!101660 c!17494) b!101659))

(assert (= (and b!101660 (not c!17494)) b!101651))

(assert (= (and b!101659 res!50888) b!101626))

(assert (= (and b!101626 res!50891) b!101634))

(assert (= (or b!101653 b!101659) bm!10579))

(assert (= (or b!101655 b!101634) bm!10591))

(assert (= (or b!101643 bm!10579) bm!10573))

(assert (= (or b!101646 b!101633) bm!10572))

(assert (= (or b!101636 b!101628) bm!10583))

(assert (= (or b!101663 b!101633) bm!10582))

(assert (= (or bm!10584 bm!10591) bm!10568))

(assert (= (or bm!10590 bm!10573) bm!10574))

(assert (= (or b!101639 b!101646) bm!10586))

(assert (= (or bm!10578 bm!10572) bm!10581))

(assert (= (or b!101627 b!101656) bm!10570))

(assert (= (or b!101627 b!101656) bm!10569))

(assert (= (and bm!10569 c!17491) b!101631))

(assert (= (and bm!10569 (not c!17491)) b!101657))

(assert (= (or bm!10585 bm!10570) bm!10576))

(assert (= (or bm!10589 b!101656) bm!10577))

(assert (= (or bm!10580 b!101656) bm!10571))

(assert (= (and bm!10571 c!17482) b!101642))

(assert (= (and bm!10571 (not c!17482)) b!101662))

(assert (= (and d!27441 res!50894) b!101645))

(assert (= (and b!101645 c!17492) b!101665))

(assert (= (and b!101645 (not c!17492)) b!101638))

(assert (= (and b!101665 res!50886) b!101661))

(assert (= (or b!101665 b!101661 b!101638) bm!10587))

(assert (= (or b!101661 b!101638) bm!10575))

(assert (=> b!101640 m!111983))

(declare-fun m!112197 () Bool)

(assert (=> b!101640 m!112197))

(assert (=> bm!10569 m!111961))

(declare-fun m!112199 () Bool)

(assert (=> bm!10569 m!112199))

(assert (=> bm!10582 m!111961))

(declare-fun m!112201 () Bool)

(assert (=> bm!10582 m!112201))

(assert (=> b!101657 m!112115))

(declare-fun m!112203 () Bool)

(assert (=> b!101630 m!112203))

(assert (=> b!101662 m!112115))

(assert (=> b!101632 m!111983))

(declare-fun m!112205 () Bool)

(assert (=> b!101632 m!112205))

(declare-fun m!112207 () Bool)

(assert (=> b!101641 m!112207))

(declare-fun m!112209 () Bool)

(assert (=> bm!10571 m!112209))

(declare-fun m!112211 () Bool)

(assert (=> bm!10574 m!112211))

(declare-fun m!112213 () Bool)

(assert (=> b!101656 m!112213))

(declare-fun m!112215 () Bool)

(assert (=> b!101656 m!112215))

(declare-fun m!112217 () Bool)

(assert (=> b!101656 m!112217))

(assert (=> b!101656 m!112215))

(declare-fun m!112219 () Bool)

(assert (=> b!101656 m!112219))

(assert (=> b!101656 m!111961))

(assert (=> b!101656 m!111983))

(declare-fun m!112221 () Bool)

(assert (=> b!101656 m!112221))

(declare-fun m!112223 () Bool)

(assert (=> d!27441 m!112223))

(assert (=> d!27441 m!111993))

(assert (=> bm!10583 m!111961))

(assert (=> bm!10583 m!111983))

(declare-fun m!112225 () Bool)

(assert (=> bm!10583 m!112225))

(declare-fun m!112227 () Bool)

(assert (=> bm!10576 m!112227))

(declare-fun m!112229 () Bool)

(assert (=> bm!10587 m!112229))

(assert (=> bm!10581 m!111961))

(declare-fun m!112231 () Bool)

(assert (=> bm!10581 m!112231))

(assert (=> bm!10586 m!111961))

(declare-fun m!112233 () Bool)

(assert (=> bm!10586 m!112233))

(declare-fun m!112235 () Bool)

(assert (=> b!101654 m!112235))

(assert (=> bm!10568 m!111961))

(declare-fun m!112237 () Bool)

(assert (=> bm!10568 m!112237))

(assert (=> b!101665 m!111961))

(declare-fun m!112239 () Bool)

(assert (=> b!101665 m!112239))

(assert (=> bm!10577 m!112213))

(declare-fun m!112241 () Bool)

(assert (=> bm!10577 m!112241))

(declare-fun m!112243 () Bool)

(assert (=> b!101661 m!112243))

(assert (=> bm!10575 m!111971))

(declare-fun m!112245 () Bool)

(assert (=> b!101658 m!112245))

(declare-fun m!112247 () Bool)

(assert (=> b!101644 m!112247))

(declare-fun m!112249 () Bool)

(assert (=> b!101626 m!112249))

(assert (=> b!101649 m!111961))

(assert (=> b!101649 m!112231))

(assert (=> b!101280 d!27441))

(declare-fun d!27443 () Bool)

(declare-fun c!17498 () Bool)

(assert (=> d!27443 (= c!17498 ((_ is ValueCellFull!980) (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(declare-fun e!66186 () V!3177)

(assert (=> d!27443 (= (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!66186)))

(declare-fun b!101672 () Bool)

(declare-fun get!1306 (ValueCell!980 V!3177) V!3177)

(assert (=> b!101672 (= e!66186 (get!1306 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101673 () Bool)

(declare-fun get!1307 (ValueCell!980 V!3177) V!3177)

(assert (=> b!101673 (= e!66186 (get!1307 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!27443 c!17498) b!101672))

(assert (= (and d!27443 (not c!17498)) b!101673))

(assert (=> b!101672 m!111979))

(assert (=> b!101672 m!111981))

(declare-fun m!112251 () Bool)

(assert (=> b!101672 m!112251))

(assert (=> b!101673 m!111979))

(assert (=> b!101673 m!111981))

(declare-fun m!112253 () Bool)

(assert (=> b!101673 m!112253))

(assert (=> b!101280 d!27443))

(declare-fun d!27445 () Bool)

(declare-fun res!50904 () Bool)

(declare-fun e!66189 () Bool)

(assert (=> d!27445 (=> (not res!50904) (not e!66189))))

(declare-fun simpleValid!71 (LongMapFixedSize!868) Bool)

(assert (=> d!27445 (= res!50904 (simpleValid!71 newMap!16))))

(assert (=> d!27445 (= (valid!403 newMap!16) e!66189)))

(declare-fun b!101680 () Bool)

(declare-fun res!50905 () Bool)

(assert (=> b!101680 (=> (not res!50905) (not e!66189))))

(declare-fun arrayCountValidKeys!0 (array!4259 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!101680 (= res!50905 (= (arrayCountValidKeys!0 (_keys!4234 newMap!16) #b00000000000000000000000000000000 (size!2274 (_keys!4234 newMap!16))) (_size!483 newMap!16)))))

(declare-fun b!101681 () Bool)

(declare-fun res!50906 () Bool)

(assert (=> b!101681 (=> (not res!50906) (not e!66189))))

(assert (=> b!101681 (= res!50906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4234 newMap!16) (mask!6657 newMap!16)))))

(declare-fun b!101682 () Bool)

(assert (=> b!101682 (= e!66189 (arrayNoDuplicates!0 (_keys!4234 newMap!16) #b00000000000000000000000000000000 Nil!1597))))

(assert (= (and d!27445 res!50904) b!101680))

(assert (= (and b!101680 res!50905) b!101681))

(assert (= (and b!101681 res!50906) b!101682))

(declare-fun m!112255 () Bool)

(assert (=> d!27445 m!112255))

(declare-fun m!112257 () Bool)

(assert (=> b!101680 m!112257))

(declare-fun m!112259 () Bool)

(assert (=> b!101681 m!112259))

(declare-fun m!112261 () Bool)

(assert (=> b!101682 m!112261))

(assert (=> b!101285 d!27445))

(declare-fun mapIsEmpty!3831 () Bool)

(declare-fun mapRes!3831 () Bool)

(assert (=> mapIsEmpty!3831 mapRes!3831))

(declare-fun b!101689 () Bool)

(declare-fun e!66195 () Bool)

(assert (=> b!101689 (= e!66195 tp_is_empty!2647)))

(declare-fun condMapEmpty!3831 () Bool)

(declare-fun mapDefault!3831 () ValueCell!980)

(assert (=> mapNonEmpty!3816 (= condMapEmpty!3831 (= mapRest!3816 ((as const (Array (_ BitVec 32) ValueCell!980)) mapDefault!3831)))))

(declare-fun e!66194 () Bool)

(assert (=> mapNonEmpty!3816 (= tp!9690 (and e!66194 mapRes!3831))))

(declare-fun mapNonEmpty!3831 () Bool)

(declare-fun tp!9717 () Bool)

(assert (=> mapNonEmpty!3831 (= mapRes!3831 (and tp!9717 e!66195))))

(declare-fun mapValue!3831 () ValueCell!980)

(declare-fun mapKey!3831 () (_ BitVec 32))

(declare-fun mapRest!3831 () (Array (_ BitVec 32) ValueCell!980))

(assert (=> mapNonEmpty!3831 (= mapRest!3816 (store mapRest!3831 mapKey!3831 mapValue!3831))))

(declare-fun b!101690 () Bool)

(assert (=> b!101690 (= e!66194 tp_is_empty!2647)))

(assert (= (and mapNonEmpty!3816 condMapEmpty!3831) mapIsEmpty!3831))

(assert (= (and mapNonEmpty!3816 (not condMapEmpty!3831)) mapNonEmpty!3831))

(assert (= (and mapNonEmpty!3831 ((_ is ValueCellFull!980) mapValue!3831)) b!101689))

(assert (= (and mapNonEmpty!3816 ((_ is ValueCellFull!980) mapDefault!3831)) b!101690))

(declare-fun m!112263 () Bool)

(assert (=> mapNonEmpty!3831 m!112263))

(declare-fun mapIsEmpty!3832 () Bool)

(declare-fun mapRes!3832 () Bool)

(assert (=> mapIsEmpty!3832 mapRes!3832))

(declare-fun b!101691 () Bool)

(declare-fun e!66197 () Bool)

(assert (=> b!101691 (= e!66197 tp_is_empty!2647)))

(declare-fun condMapEmpty!3832 () Bool)

(declare-fun mapDefault!3832 () ValueCell!980)

(assert (=> mapNonEmpty!3815 (= condMapEmpty!3832 (= mapRest!3815 ((as const (Array (_ BitVec 32) ValueCell!980)) mapDefault!3832)))))

(declare-fun e!66196 () Bool)

(assert (=> mapNonEmpty!3815 (= tp!9689 (and e!66196 mapRes!3832))))

(declare-fun mapNonEmpty!3832 () Bool)

(declare-fun tp!9718 () Bool)

(assert (=> mapNonEmpty!3832 (= mapRes!3832 (and tp!9718 e!66197))))

(declare-fun mapRest!3832 () (Array (_ BitVec 32) ValueCell!980))

(declare-fun mapValue!3832 () ValueCell!980)

(declare-fun mapKey!3832 () (_ BitVec 32))

(assert (=> mapNonEmpty!3832 (= mapRest!3815 (store mapRest!3832 mapKey!3832 mapValue!3832))))

(declare-fun b!101692 () Bool)

(assert (=> b!101692 (= e!66196 tp_is_empty!2647)))

(assert (= (and mapNonEmpty!3815 condMapEmpty!3832) mapIsEmpty!3832))

(assert (= (and mapNonEmpty!3815 (not condMapEmpty!3832)) mapNonEmpty!3832))

(assert (= (and mapNonEmpty!3832 ((_ is ValueCellFull!980) mapValue!3832)) b!101691))

(assert (= (and mapNonEmpty!3815 ((_ is ValueCellFull!980) mapDefault!3832)) b!101692))

(declare-fun m!112265 () Bool)

(assert (=> mapNonEmpty!3832 m!112265))

(declare-fun b_lambda!4539 () Bool)

(assert (= b_lambda!4537 (or (and b!101289 b_free!2461) (and b!101277 b_free!2463 (= (defaultEntry!2535 newMap!16) (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))))) b_lambda!4539)))

(check-sat (not b!101541) (not b!101640) (not bm!10517) (not bm!10586) (not b!101504) (not b!101521) (not d!27429) (not b!101682) (not b!101511) (not d!27423) (not b_next!2461) (not d!27419) (not b!101526) (not b!101528) (not b!101662) (not b!101649) (not bm!10513) (not bm!10494) (not bm!10574) (not bm!10577) tp_is_empty!2647 (not mapNonEmpty!3832) (not d!27439) (not b!101680) (not b!101665) (not bm!10582) (not b!101500) (not bm!10575) (not b!101437) (not b_lambda!4539) (not bm!10576) (not b!101515) (not b!101501) (not b_next!2463) (not bm!10569) (not bm!10581) (not bm!10512) (not d!27441) (not d!27437) (not b!101499) (not bm!10516) (not b!101632) (not bm!10519) (not b!101448) (not b!101496) (not b!101435) (not b!101451) (not b!101531) (not b!101681) (not b!101656) (not bm!10568) (not bm!10571) b_and!6245 (not bm!10497) b_and!6247 (not b!101673) (not b!101529) (not b!101657) (not d!27421) (not d!27425) (not b!101672) (not bm!10587) (not b!101449) (not bm!10583) (not b!101661) (not d!27445) (not b!101507) (not b_lambda!4535) (not b!101539) (not mapNonEmpty!3831))
(check-sat b_and!6245 b_and!6247 (not b_next!2461) (not b_next!2463))
(get-model)

(declare-fun d!27447 () Bool)

(declare-fun e!66200 () Bool)

(assert (=> d!27447 e!66200))

(declare-fun res!50912 () Bool)

(assert (=> d!27447 (=> (not res!50912) (not e!66200))))

(declare-fun lt!51544 () ListLongMap!1525)

(assert (=> d!27447 (= res!50912 (contains!807 lt!51544 (_1!1186 (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2835 (underlying!340 thiss!992)))))))))

(declare-fun lt!51541 () List!1599)

(assert (=> d!27447 (= lt!51544 (ListLongMap!1526 lt!51541))))

(declare-fun lt!51543 () Unit!3090)

(declare-fun lt!51542 () Unit!3090)

(assert (=> d!27447 (= lt!51543 lt!51542)))

(assert (=> d!27447 (= (getValueByKey!151 lt!51541 (_1!1186 (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2835 (underlying!340 thiss!992)))))) (Some!156 (_2!1186 (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2835 (underlying!340 thiss!992)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!70 (List!1599 (_ BitVec 64) V!3177) Unit!3090)

(assert (=> d!27447 (= lt!51542 (lemmaContainsTupThenGetReturnValue!70 lt!51541 (_1!1186 (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2835 (underlying!340 thiss!992))))) (_2!1186 (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2835 (underlying!340 thiss!992)))))))))

(declare-fun insertStrictlySorted!73 (List!1599 (_ BitVec 64) V!3177) List!1599)

(assert (=> d!27447 (= lt!51541 (insertStrictlySorted!73 (toList!778 call!10515) (_1!1186 (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2835 (underlying!340 thiss!992))))) (_2!1186 (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2835 (underlying!340 thiss!992)))))))))

(assert (=> d!27447 (= (+!131 call!10515 (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2835 (underlying!340 thiss!992))))) lt!51544)))

(declare-fun b!101697 () Bool)

(declare-fun res!50911 () Bool)

(assert (=> b!101697 (=> (not res!50911) (not e!66200))))

(assert (=> b!101697 (= res!50911 (= (getValueByKey!151 (toList!778 lt!51544) (_1!1186 (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2835 (underlying!340 thiss!992)))))) (Some!156 (_2!1186 (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2835 (underlying!340 thiss!992))))))))))

(declare-fun b!101698 () Bool)

(declare-fun contains!809 (List!1599 tuple2!2350) Bool)

(assert (=> b!101698 (= e!66200 (contains!809 (toList!778 lt!51544) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2835 (underlying!340 thiss!992))))))))

(assert (= (and d!27447 res!50912) b!101697))

(assert (= (and b!101697 res!50911) b!101698))

(declare-fun m!112267 () Bool)

(assert (=> d!27447 m!112267))

(declare-fun m!112269 () Bool)

(assert (=> d!27447 m!112269))

(declare-fun m!112271 () Bool)

(assert (=> d!27447 m!112271))

(declare-fun m!112273 () Bool)

(assert (=> d!27447 m!112273))

(declare-fun m!112275 () Bool)

(assert (=> b!101697 m!112275))

(declare-fun m!112277 () Bool)

(assert (=> b!101698 m!112277))

(assert (=> b!101507 d!27447))

(declare-fun d!27449 () Bool)

(declare-fun res!50913 () Bool)

(declare-fun e!66201 () Bool)

(assert (=> d!27449 (=> res!50913 e!66201)))

(assert (=> d!27449 (= res!50913 (= (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(assert (=> d!27449 (= (arrayContainsKey!0 (_keys!4234 newMap!16) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) #b00000000000000000000000000000000) e!66201)))

(declare-fun b!101699 () Bool)

(declare-fun e!66202 () Bool)

(assert (=> b!101699 (= e!66201 e!66202)))

(declare-fun res!50914 () Bool)

(assert (=> b!101699 (=> (not res!50914) (not e!66202))))

(assert (=> b!101699 (= res!50914 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2274 (_keys!4234 newMap!16))))))

(declare-fun b!101700 () Bool)

(assert (=> b!101700 (= e!66202 (arrayContainsKey!0 (_keys!4234 newMap!16) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!27449 (not res!50913)) b!101699))

(assert (= (and b!101699 res!50914) b!101700))

(declare-fun m!112279 () Bool)

(assert (=> d!27449 m!112279))

(assert (=> b!101700 m!111961))

(declare-fun m!112281 () Bool)

(assert (=> b!101700 m!112281))

(assert (=> bm!10568 d!27449))

(declare-fun d!27451 () Bool)

(assert (=> d!27451 (= (validKeyInArray!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)) (and (not (= (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101531 d!27451))

(declare-fun d!27453 () Bool)

(declare-fun e!66203 () Bool)

(assert (=> d!27453 e!66203))

(declare-fun res!50915 () Bool)

(assert (=> d!27453 (=> res!50915 e!66203)))

(declare-fun lt!51547 () Bool)

(assert (=> d!27453 (= res!50915 (not lt!51547))))

(declare-fun lt!51546 () Bool)

(assert (=> d!27453 (= lt!51547 lt!51546)))

(declare-fun lt!51548 () Unit!3090)

(declare-fun e!66204 () Unit!3090)

(assert (=> d!27453 (= lt!51548 e!66204)))

(declare-fun c!17499 () Bool)

(assert (=> d!27453 (= c!17499 lt!51546)))

(assert (=> d!27453 (= lt!51546 (containsKey!155 (toList!778 call!10593) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(assert (=> d!27453 (= (contains!807 call!10593 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)) lt!51547)))

(declare-fun b!101701 () Bool)

(declare-fun lt!51545 () Unit!3090)

(assert (=> b!101701 (= e!66204 lt!51545)))

(assert (=> b!101701 (= lt!51545 (lemmaContainsKeyImpliesGetValueByKeyDefined!104 (toList!778 call!10593) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(assert (=> b!101701 (isDefined!105 (getValueByKey!151 (toList!778 call!10593) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(declare-fun b!101702 () Bool)

(declare-fun Unit!3101 () Unit!3090)

(assert (=> b!101702 (= e!66204 Unit!3101)))

(declare-fun b!101703 () Bool)

(assert (=> b!101703 (= e!66203 (isDefined!105 (getValueByKey!151 (toList!778 call!10593) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355))))))

(assert (= (and d!27453 c!17499) b!101701))

(assert (= (and d!27453 (not c!17499)) b!101702))

(assert (= (and d!27453 (not res!50915)) b!101703))

(assert (=> d!27453 m!111961))

(declare-fun m!112283 () Bool)

(assert (=> d!27453 m!112283))

(assert (=> b!101701 m!111961))

(declare-fun m!112285 () Bool)

(assert (=> b!101701 m!112285))

(assert (=> b!101701 m!111961))

(declare-fun m!112287 () Bool)

(assert (=> b!101701 m!112287))

(assert (=> b!101701 m!112287))

(declare-fun m!112289 () Bool)

(assert (=> b!101701 m!112289))

(assert (=> b!101703 m!111961))

(assert (=> b!101703 m!112287))

(assert (=> b!101703 m!112287))

(assert (=> b!101703 m!112289))

(assert (=> b!101665 d!27453))

(declare-fun d!27455 () Bool)

(declare-fun e!66205 () Bool)

(assert (=> d!27455 e!66205))

(declare-fun res!50916 () Bool)

(assert (=> d!27455 (=> res!50916 e!66205)))

(declare-fun lt!51551 () Bool)

(assert (=> d!27455 (= res!50916 (not lt!51551))))

(declare-fun lt!51550 () Bool)

(assert (=> d!27455 (= lt!51551 lt!51550)))

(declare-fun lt!51552 () Unit!3090)

(declare-fun e!66206 () Unit!3090)

(assert (=> d!27455 (= lt!51552 e!66206)))

(declare-fun c!17500 () Bool)

(assert (=> d!27455 (= c!17500 lt!51550)))

(assert (=> d!27455 (= lt!51550 (containsKey!155 (toList!778 lt!51415) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!27455 (= (contains!807 lt!51415 #b1000000000000000000000000000000000000000000000000000000000000000) lt!51551)))

(declare-fun b!101704 () Bool)

(declare-fun lt!51549 () Unit!3090)

(assert (=> b!101704 (= e!66206 lt!51549)))

(assert (=> b!101704 (= lt!51549 (lemmaContainsKeyImpliesGetValueByKeyDefined!104 (toList!778 lt!51415) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101704 (isDefined!105 (getValueByKey!151 (toList!778 lt!51415) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101705 () Bool)

(declare-fun Unit!3102 () Unit!3090)

(assert (=> b!101705 (= e!66206 Unit!3102)))

(declare-fun b!101706 () Bool)

(assert (=> b!101706 (= e!66205 (isDefined!105 (getValueByKey!151 (toList!778 lt!51415) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!27455 c!17500) b!101704))

(assert (= (and d!27455 (not c!17500)) b!101705))

(assert (= (and d!27455 (not res!50916)) b!101706))

(declare-fun m!112291 () Bool)

(assert (=> d!27455 m!112291))

(declare-fun m!112293 () Bool)

(assert (=> b!101704 m!112293))

(declare-fun m!112295 () Bool)

(assert (=> b!101704 m!112295))

(assert (=> b!101704 m!112295))

(declare-fun m!112297 () Bool)

(assert (=> b!101704 m!112297))

(assert (=> b!101706 m!112295))

(assert (=> b!101706 m!112295))

(assert (=> b!101706 m!112297))

(assert (=> bm!10516 d!27455))

(assert (=> d!27421 d!27413))

(declare-fun d!27457 () Bool)

(declare-fun e!66207 () Bool)

(assert (=> d!27457 e!66207))

(declare-fun res!50917 () Bool)

(assert (=> d!27457 (=> res!50917 e!66207)))

(declare-fun lt!51555 () Bool)

(assert (=> d!27457 (= res!50917 (not lt!51555))))

(declare-fun lt!51554 () Bool)

(assert (=> d!27457 (= lt!51555 lt!51554)))

(declare-fun lt!51556 () Unit!3090)

(declare-fun e!66208 () Unit!3090)

(assert (=> d!27457 (= lt!51556 e!66208)))

(declare-fun c!17501 () Bool)

(assert (=> d!27457 (= c!17501 lt!51554)))

(assert (=> d!27457 (= lt!51554 (containsKey!155 (toList!778 e!66163) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(assert (=> d!27457 (= (contains!807 e!66163 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)) lt!51555)))

(declare-fun b!101707 () Bool)

(declare-fun lt!51553 () Unit!3090)

(assert (=> b!101707 (= e!66208 lt!51553)))

(assert (=> b!101707 (= lt!51553 (lemmaContainsKeyImpliesGetValueByKeyDefined!104 (toList!778 e!66163) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(assert (=> b!101707 (isDefined!105 (getValueByKey!151 (toList!778 e!66163) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(declare-fun b!101708 () Bool)

(declare-fun Unit!3103 () Unit!3090)

(assert (=> b!101708 (= e!66208 Unit!3103)))

(declare-fun b!101709 () Bool)

(assert (=> b!101709 (= e!66207 (isDefined!105 (getValueByKey!151 (toList!778 e!66163) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355))))))

(assert (= (and d!27457 c!17501) b!101707))

(assert (= (and d!27457 (not c!17501)) b!101708))

(assert (= (and d!27457 (not res!50917)) b!101709))

(assert (=> d!27457 m!111961))

(declare-fun m!112299 () Bool)

(assert (=> d!27457 m!112299))

(assert (=> b!101707 m!111961))

(declare-fun m!112301 () Bool)

(assert (=> b!101707 m!112301))

(assert (=> b!101707 m!111961))

(declare-fun m!112303 () Bool)

(assert (=> b!101707 m!112303))

(assert (=> b!101707 m!112303))

(declare-fun m!112305 () Bool)

(assert (=> b!101707 m!112305))

(assert (=> b!101709 m!111961))

(assert (=> b!101709 m!112303))

(assert (=> b!101709 m!112303))

(assert (=> b!101709 m!112305))

(assert (=> bm!10569 d!27457))

(declare-fun d!27459 () Bool)

(assert (=> d!27459 (= (inRange!0 (ite c!17490 (ite c!17488 (index!3183 lt!51532) (ite c!17495 (index!3182 lt!51512) (index!3185 lt!51512))) (ite c!17487 (index!3183 lt!51514) (ite c!17483 (index!3182 lt!51508) (index!3185 lt!51508)))) (mask!6657 newMap!16)) (and (bvsge (ite c!17490 (ite c!17488 (index!3183 lt!51532) (ite c!17495 (index!3182 lt!51512) (index!3185 lt!51512))) (ite c!17487 (index!3183 lt!51514) (ite c!17483 (index!3182 lt!51508) (index!3185 lt!51508)))) #b00000000000000000000000000000000) (bvslt (ite c!17490 (ite c!17488 (index!3183 lt!51532) (ite c!17495 (index!3182 lt!51512) (index!3185 lt!51512))) (ite c!17487 (index!3183 lt!51514) (ite c!17483 (index!3182 lt!51508) (index!3185 lt!51508)))) (bvadd (mask!6657 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!10574 d!27459))

(assert (=> b!101529 d!27451))

(declare-fun d!27461 () Bool)

(declare-fun res!50918 () Bool)

(declare-fun e!66209 () Bool)

(assert (=> d!27461 (=> (not res!50918) (not e!66209))))

(assert (=> d!27461 (= res!50918 (simpleValid!71 (_2!1185 lt!51517)))))

(assert (=> d!27461 (= (valid!403 (_2!1185 lt!51517)) e!66209)))

(declare-fun b!101710 () Bool)

(declare-fun res!50919 () Bool)

(assert (=> b!101710 (=> (not res!50919) (not e!66209))))

(assert (=> b!101710 (= res!50919 (= (arrayCountValidKeys!0 (_keys!4234 (_2!1185 lt!51517)) #b00000000000000000000000000000000 (size!2274 (_keys!4234 (_2!1185 lt!51517)))) (_size!483 (_2!1185 lt!51517))))))

(declare-fun b!101711 () Bool)

(declare-fun res!50920 () Bool)

(assert (=> b!101711 (=> (not res!50920) (not e!66209))))

(assert (=> b!101711 (= res!50920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4234 (_2!1185 lt!51517)) (mask!6657 (_2!1185 lt!51517))))))

(declare-fun b!101712 () Bool)

(assert (=> b!101712 (= e!66209 (arrayNoDuplicates!0 (_keys!4234 (_2!1185 lt!51517)) #b00000000000000000000000000000000 Nil!1597))))

(assert (= (and d!27461 res!50918) b!101710))

(assert (= (and b!101710 res!50919) b!101711))

(assert (= (and b!101711 res!50920) b!101712))

(declare-fun m!112307 () Bool)

(assert (=> d!27461 m!112307))

(declare-fun m!112309 () Bool)

(assert (=> b!101710 m!112309))

(declare-fun m!112311 () Bool)

(assert (=> b!101711 m!112311))

(declare-fun m!112313 () Bool)

(assert (=> b!101712 m!112313))

(assert (=> d!27441 d!27461))

(assert (=> d!27441 d!27445))

(declare-fun d!27463 () Bool)

(declare-fun get!1308 (Option!157) V!3177)

(assert (=> d!27463 (= (apply!95 lt!51409 lt!51412) (get!1308 (getValueByKey!151 (toList!778 lt!51409) lt!51412)))))

(declare-fun bs!4187 () Bool)

(assert (= bs!4187 d!27463))

(declare-fun m!112315 () Bool)

(assert (=> bs!4187 m!112315))

(assert (=> bs!4187 m!112315))

(declare-fun m!112317 () Bool)

(assert (=> bs!4187 m!112317))

(assert (=> b!101496 d!27463))

(declare-fun d!27465 () Bool)

(assert (=> d!27465 (= (apply!95 (+!131 lt!51426 (tuple2!2351 lt!51411 (minValue!2413 (v!2835 (underlying!340 thiss!992))))) lt!51416) (apply!95 lt!51426 lt!51416))))

(declare-fun lt!51559 () Unit!3090)

(declare-fun choose!633 (ListLongMap!1525 (_ BitVec 64) V!3177 (_ BitVec 64)) Unit!3090)

(assert (=> d!27465 (= lt!51559 (choose!633 lt!51426 lt!51411 (minValue!2413 (v!2835 (underlying!340 thiss!992))) lt!51416))))

(declare-fun e!66212 () Bool)

(assert (=> d!27465 e!66212))

(declare-fun res!50923 () Bool)

(assert (=> d!27465 (=> (not res!50923) (not e!66212))))

(assert (=> d!27465 (= res!50923 (contains!807 lt!51426 lt!51416))))

(assert (=> d!27465 (= (addApplyDifferent!71 lt!51426 lt!51411 (minValue!2413 (v!2835 (underlying!340 thiss!992))) lt!51416) lt!51559)))

(declare-fun b!101716 () Bool)

(assert (=> b!101716 (= e!66212 (not (= lt!51416 lt!51411)))))

(assert (= (and d!27465 res!50923) b!101716))

(declare-fun m!112319 () Bool)

(assert (=> d!27465 m!112319))

(assert (=> d!27465 m!112133))

(assert (=> d!27465 m!112141))

(assert (=> d!27465 m!112133))

(declare-fun m!112321 () Bool)

(assert (=> d!27465 m!112321))

(assert (=> d!27465 m!112147))

(assert (=> b!101496 d!27465))

(declare-fun d!27467 () Bool)

(declare-fun e!66213 () Bool)

(assert (=> d!27467 e!66213))

(declare-fun res!50924 () Bool)

(assert (=> d!27467 (=> res!50924 e!66213)))

(declare-fun lt!51562 () Bool)

(assert (=> d!27467 (= res!50924 (not lt!51562))))

(declare-fun lt!51561 () Bool)

(assert (=> d!27467 (= lt!51562 lt!51561)))

(declare-fun lt!51563 () Unit!3090)

(declare-fun e!66214 () Unit!3090)

(assert (=> d!27467 (= lt!51563 e!66214)))

(declare-fun c!17502 () Bool)

(assert (=> d!27467 (= c!17502 lt!51561)))

(assert (=> d!27467 (= lt!51561 (containsKey!155 (toList!778 (+!131 lt!51420 (tuple2!2351 lt!51425 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))))) lt!51421))))

(assert (=> d!27467 (= (contains!807 (+!131 lt!51420 (tuple2!2351 lt!51425 (zeroValue!2413 (v!2835 (underlying!340 thiss!992))))) lt!51421) lt!51562)))

(declare-fun b!101717 () Bool)

(declare-fun lt!51560 () Unit!3090)

(assert (=> b!101717 (= e!66214 lt!51560)))

(assert (=> b!101717 (= lt!51560 (lemmaContainsKeyImpliesGetValueByKeyDefined!104 (toList!778 (+!131 lt!51420 (tuple2!2351 lt!51425 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))))) lt!51421))))

(assert (=> b!101717 (isDefined!105 (getValueByKey!151 (toList!778 (+!131 lt!51420 (tuple2!2351 lt!51425 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))))) lt!51421))))

(declare-fun b!101718 () Bool)

(declare-fun Unit!3104 () Unit!3090)

(assert (=> b!101718 (= e!66214 Unit!3104)))

(declare-fun b!101719 () Bool)

(assert (=> b!101719 (= e!66213 (isDefined!105 (getValueByKey!151 (toList!778 (+!131 lt!51420 (tuple2!2351 lt!51425 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))))) lt!51421)))))

(assert (= (and d!27467 c!17502) b!101717))

(assert (= (and d!27467 (not c!17502)) b!101718))

(assert (= (and d!27467 (not res!50924)) b!101719))

(declare-fun m!112323 () Bool)

(assert (=> d!27467 m!112323))

(declare-fun m!112325 () Bool)

(assert (=> b!101717 m!112325))

(declare-fun m!112327 () Bool)

(assert (=> b!101717 m!112327))

(assert (=> b!101717 m!112327))

(declare-fun m!112329 () Bool)

(assert (=> b!101717 m!112329))

(assert (=> b!101719 m!112327))

(assert (=> b!101719 m!112327))

(assert (=> b!101719 m!112329))

(assert (=> b!101496 d!27467))

(declare-fun d!27469 () Bool)

(assert (=> d!27469 (= (apply!95 (+!131 lt!51409 (tuple2!2351 lt!51419 (zeroValue!2413 (v!2835 (underlying!340 thiss!992))))) lt!51412) (get!1308 (getValueByKey!151 (toList!778 (+!131 lt!51409 (tuple2!2351 lt!51419 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))))) lt!51412)))))

(declare-fun bs!4188 () Bool)

(assert (= bs!4188 d!27469))

(declare-fun m!112331 () Bool)

(assert (=> bs!4188 m!112331))

(assert (=> bs!4188 m!112331))

(declare-fun m!112333 () Bool)

(assert (=> bs!4188 m!112333))

(assert (=> b!101496 d!27469))

(declare-fun d!27471 () Bool)

(assert (=> d!27471 (= (apply!95 lt!51429 lt!51423) (get!1308 (getValueByKey!151 (toList!778 lt!51429) lt!51423)))))

(declare-fun bs!4189 () Bool)

(assert (= bs!4189 d!27471))

(declare-fun m!112335 () Bool)

(assert (=> bs!4189 m!112335))

(assert (=> bs!4189 m!112335))

(declare-fun m!112337 () Bool)

(assert (=> bs!4189 m!112337))

(assert (=> b!101496 d!27471))

(declare-fun d!27473 () Bool)

(declare-fun e!66215 () Bool)

(assert (=> d!27473 e!66215))

(declare-fun res!50926 () Bool)

(assert (=> d!27473 (=> (not res!50926) (not e!66215))))

(declare-fun lt!51567 () ListLongMap!1525)

(assert (=> d!27473 (= res!50926 (contains!807 lt!51567 (_1!1186 (tuple2!2351 lt!51419 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))))))))

(declare-fun lt!51564 () List!1599)

(assert (=> d!27473 (= lt!51567 (ListLongMap!1526 lt!51564))))

(declare-fun lt!51566 () Unit!3090)

(declare-fun lt!51565 () Unit!3090)

(assert (=> d!27473 (= lt!51566 lt!51565)))

(assert (=> d!27473 (= (getValueByKey!151 lt!51564 (_1!1186 (tuple2!2351 lt!51419 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))))) (Some!156 (_2!1186 (tuple2!2351 lt!51419 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))))))))

(assert (=> d!27473 (= lt!51565 (lemmaContainsTupThenGetReturnValue!70 lt!51564 (_1!1186 (tuple2!2351 lt!51419 (zeroValue!2413 (v!2835 (underlying!340 thiss!992))))) (_2!1186 (tuple2!2351 lt!51419 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))))))))

(assert (=> d!27473 (= lt!51564 (insertStrictlySorted!73 (toList!778 lt!51409) (_1!1186 (tuple2!2351 lt!51419 (zeroValue!2413 (v!2835 (underlying!340 thiss!992))))) (_2!1186 (tuple2!2351 lt!51419 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))))))))

(assert (=> d!27473 (= (+!131 lt!51409 (tuple2!2351 lt!51419 (zeroValue!2413 (v!2835 (underlying!340 thiss!992))))) lt!51567)))

(declare-fun b!101720 () Bool)

(declare-fun res!50925 () Bool)

(assert (=> b!101720 (=> (not res!50925) (not e!66215))))

(assert (=> b!101720 (= res!50925 (= (getValueByKey!151 (toList!778 lt!51567) (_1!1186 (tuple2!2351 lt!51419 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))))) (Some!156 (_2!1186 (tuple2!2351 lt!51419 (zeroValue!2413 (v!2835 (underlying!340 thiss!992))))))))))

(declare-fun b!101721 () Bool)

(assert (=> b!101721 (= e!66215 (contains!809 (toList!778 lt!51567) (tuple2!2351 lt!51419 (zeroValue!2413 (v!2835 (underlying!340 thiss!992))))))))

(assert (= (and d!27473 res!50926) b!101720))

(assert (= (and b!101720 res!50925) b!101721))

(declare-fun m!112339 () Bool)

(assert (=> d!27473 m!112339))

(declare-fun m!112341 () Bool)

(assert (=> d!27473 m!112341))

(declare-fun m!112343 () Bool)

(assert (=> d!27473 m!112343))

(declare-fun m!112345 () Bool)

(assert (=> d!27473 m!112345))

(declare-fun m!112347 () Bool)

(assert (=> b!101720 m!112347))

(declare-fun m!112349 () Bool)

(assert (=> b!101721 m!112349))

(assert (=> b!101496 d!27473))

(declare-fun d!27475 () Bool)

(assert (=> d!27475 (= (apply!95 (+!131 lt!51429 (tuple2!2351 lt!51430 (minValue!2413 (v!2835 (underlying!340 thiss!992))))) lt!51423) (apply!95 lt!51429 lt!51423))))

(declare-fun lt!51568 () Unit!3090)

(assert (=> d!27475 (= lt!51568 (choose!633 lt!51429 lt!51430 (minValue!2413 (v!2835 (underlying!340 thiss!992))) lt!51423))))

(declare-fun e!66216 () Bool)

(assert (=> d!27475 e!66216))

(declare-fun res!50927 () Bool)

(assert (=> d!27475 (=> (not res!50927) (not e!66216))))

(assert (=> d!27475 (= res!50927 (contains!807 lt!51429 lt!51423))))

(assert (=> d!27475 (= (addApplyDifferent!71 lt!51429 lt!51430 (minValue!2413 (v!2835 (underlying!340 thiss!992))) lt!51423) lt!51568)))

(declare-fun b!101722 () Bool)

(assert (=> b!101722 (= e!66216 (not (= lt!51423 lt!51430)))))

(assert (= (and d!27475 res!50927) b!101722))

(declare-fun m!112351 () Bool)

(assert (=> d!27475 m!112351))

(assert (=> d!27475 m!112155))

(assert (=> d!27475 m!112157))

(assert (=> d!27475 m!112155))

(declare-fun m!112353 () Bool)

(assert (=> d!27475 m!112353))

(assert (=> d!27475 m!112159))

(assert (=> b!101496 d!27475))

(declare-fun d!27477 () Bool)

(assert (=> d!27477 (= (apply!95 lt!51426 lt!51416) (get!1308 (getValueByKey!151 (toList!778 lt!51426) lt!51416)))))

(declare-fun bs!4190 () Bool)

(assert (= bs!4190 d!27477))

(declare-fun m!112355 () Bool)

(assert (=> bs!4190 m!112355))

(assert (=> bs!4190 m!112355))

(declare-fun m!112357 () Bool)

(assert (=> bs!4190 m!112357))

(assert (=> b!101496 d!27477))

(declare-fun d!27479 () Bool)

(assert (=> d!27479 (= (apply!95 (+!131 lt!51426 (tuple2!2351 lt!51411 (minValue!2413 (v!2835 (underlying!340 thiss!992))))) lt!51416) (get!1308 (getValueByKey!151 (toList!778 (+!131 lt!51426 (tuple2!2351 lt!51411 (minValue!2413 (v!2835 (underlying!340 thiss!992)))))) lt!51416)))))

(declare-fun bs!4191 () Bool)

(assert (= bs!4191 d!27479))

(declare-fun m!112359 () Bool)

(assert (=> bs!4191 m!112359))

(assert (=> bs!4191 m!112359))

(declare-fun m!112361 () Bool)

(assert (=> bs!4191 m!112361))

(assert (=> b!101496 d!27479))

(declare-fun d!27481 () Bool)

(assert (=> d!27481 (contains!807 (+!131 lt!51420 (tuple2!2351 lt!51425 (zeroValue!2413 (v!2835 (underlying!340 thiss!992))))) lt!51421)))

(declare-fun lt!51571 () Unit!3090)

(declare-fun choose!634 (ListLongMap!1525 (_ BitVec 64) V!3177 (_ BitVec 64)) Unit!3090)

(assert (=> d!27481 (= lt!51571 (choose!634 lt!51420 lt!51425 (zeroValue!2413 (v!2835 (underlying!340 thiss!992))) lt!51421))))

(assert (=> d!27481 (contains!807 lt!51420 lt!51421)))

(assert (=> d!27481 (= (addStillContains!71 lt!51420 lt!51425 (zeroValue!2413 (v!2835 (underlying!340 thiss!992))) lt!51421) lt!51571)))

(declare-fun bs!4192 () Bool)

(assert (= bs!4192 d!27481))

(assert (=> bs!4192 m!112135))

(assert (=> bs!4192 m!112135))

(assert (=> bs!4192 m!112137))

(declare-fun m!112363 () Bool)

(assert (=> bs!4192 m!112363))

(declare-fun m!112365 () Bool)

(assert (=> bs!4192 m!112365))

(assert (=> b!101496 d!27481))

(declare-fun d!27483 () Bool)

(assert (=> d!27483 (= (apply!95 (+!131 lt!51429 (tuple2!2351 lt!51430 (minValue!2413 (v!2835 (underlying!340 thiss!992))))) lt!51423) (get!1308 (getValueByKey!151 (toList!778 (+!131 lt!51429 (tuple2!2351 lt!51430 (minValue!2413 (v!2835 (underlying!340 thiss!992)))))) lt!51423)))))

(declare-fun bs!4193 () Bool)

(assert (= bs!4193 d!27483))

(declare-fun m!112367 () Bool)

(assert (=> bs!4193 m!112367))

(assert (=> bs!4193 m!112367))

(declare-fun m!112369 () Bool)

(assert (=> bs!4193 m!112369))

(assert (=> b!101496 d!27483))

(declare-fun d!27485 () Bool)

(declare-fun e!66217 () Bool)

(assert (=> d!27485 e!66217))

(declare-fun res!50929 () Bool)

(assert (=> d!27485 (=> (not res!50929) (not e!66217))))

(declare-fun lt!51575 () ListLongMap!1525)

(assert (=> d!27485 (= res!50929 (contains!807 lt!51575 (_1!1186 (tuple2!2351 lt!51425 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))))))))

(declare-fun lt!51572 () List!1599)

(assert (=> d!27485 (= lt!51575 (ListLongMap!1526 lt!51572))))

(declare-fun lt!51574 () Unit!3090)

(declare-fun lt!51573 () Unit!3090)

(assert (=> d!27485 (= lt!51574 lt!51573)))

(assert (=> d!27485 (= (getValueByKey!151 lt!51572 (_1!1186 (tuple2!2351 lt!51425 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))))) (Some!156 (_2!1186 (tuple2!2351 lt!51425 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))))))))

(assert (=> d!27485 (= lt!51573 (lemmaContainsTupThenGetReturnValue!70 lt!51572 (_1!1186 (tuple2!2351 lt!51425 (zeroValue!2413 (v!2835 (underlying!340 thiss!992))))) (_2!1186 (tuple2!2351 lt!51425 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))))))))

(assert (=> d!27485 (= lt!51572 (insertStrictlySorted!73 (toList!778 lt!51420) (_1!1186 (tuple2!2351 lt!51425 (zeroValue!2413 (v!2835 (underlying!340 thiss!992))))) (_2!1186 (tuple2!2351 lt!51425 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))))))))

(assert (=> d!27485 (= (+!131 lt!51420 (tuple2!2351 lt!51425 (zeroValue!2413 (v!2835 (underlying!340 thiss!992))))) lt!51575)))

(declare-fun b!101724 () Bool)

(declare-fun res!50928 () Bool)

(assert (=> b!101724 (=> (not res!50928) (not e!66217))))

(assert (=> b!101724 (= res!50928 (= (getValueByKey!151 (toList!778 lt!51575) (_1!1186 (tuple2!2351 lt!51425 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))))) (Some!156 (_2!1186 (tuple2!2351 lt!51425 (zeroValue!2413 (v!2835 (underlying!340 thiss!992))))))))))

(declare-fun b!101725 () Bool)

(assert (=> b!101725 (= e!66217 (contains!809 (toList!778 lt!51575) (tuple2!2351 lt!51425 (zeroValue!2413 (v!2835 (underlying!340 thiss!992))))))))

(assert (= (and d!27485 res!50929) b!101724))

(assert (= (and b!101724 res!50928) b!101725))

(declare-fun m!112371 () Bool)

(assert (=> d!27485 m!112371))

(declare-fun m!112373 () Bool)

(assert (=> d!27485 m!112373))

(declare-fun m!112375 () Bool)

(assert (=> d!27485 m!112375))

(declare-fun m!112377 () Bool)

(assert (=> d!27485 m!112377))

(declare-fun m!112379 () Bool)

(assert (=> b!101724 m!112379))

(declare-fun m!112381 () Bool)

(assert (=> b!101725 m!112381))

(assert (=> b!101496 d!27485))

(declare-fun d!27487 () Bool)

(declare-fun e!66218 () Bool)

(assert (=> d!27487 e!66218))

(declare-fun res!50931 () Bool)

(assert (=> d!27487 (=> (not res!50931) (not e!66218))))

(declare-fun lt!51579 () ListLongMap!1525)

(assert (=> d!27487 (= res!50931 (contains!807 lt!51579 (_1!1186 (tuple2!2351 lt!51430 (minValue!2413 (v!2835 (underlying!340 thiss!992)))))))))

(declare-fun lt!51576 () List!1599)

(assert (=> d!27487 (= lt!51579 (ListLongMap!1526 lt!51576))))

(declare-fun lt!51578 () Unit!3090)

(declare-fun lt!51577 () Unit!3090)

(assert (=> d!27487 (= lt!51578 lt!51577)))

(assert (=> d!27487 (= (getValueByKey!151 lt!51576 (_1!1186 (tuple2!2351 lt!51430 (minValue!2413 (v!2835 (underlying!340 thiss!992)))))) (Some!156 (_2!1186 (tuple2!2351 lt!51430 (minValue!2413 (v!2835 (underlying!340 thiss!992)))))))))

(assert (=> d!27487 (= lt!51577 (lemmaContainsTupThenGetReturnValue!70 lt!51576 (_1!1186 (tuple2!2351 lt!51430 (minValue!2413 (v!2835 (underlying!340 thiss!992))))) (_2!1186 (tuple2!2351 lt!51430 (minValue!2413 (v!2835 (underlying!340 thiss!992)))))))))

(assert (=> d!27487 (= lt!51576 (insertStrictlySorted!73 (toList!778 lt!51429) (_1!1186 (tuple2!2351 lt!51430 (minValue!2413 (v!2835 (underlying!340 thiss!992))))) (_2!1186 (tuple2!2351 lt!51430 (minValue!2413 (v!2835 (underlying!340 thiss!992)))))))))

(assert (=> d!27487 (= (+!131 lt!51429 (tuple2!2351 lt!51430 (minValue!2413 (v!2835 (underlying!340 thiss!992))))) lt!51579)))

(declare-fun b!101726 () Bool)

(declare-fun res!50930 () Bool)

(assert (=> b!101726 (=> (not res!50930) (not e!66218))))

(assert (=> b!101726 (= res!50930 (= (getValueByKey!151 (toList!778 lt!51579) (_1!1186 (tuple2!2351 lt!51430 (minValue!2413 (v!2835 (underlying!340 thiss!992)))))) (Some!156 (_2!1186 (tuple2!2351 lt!51430 (minValue!2413 (v!2835 (underlying!340 thiss!992))))))))))

(declare-fun b!101727 () Bool)

(assert (=> b!101727 (= e!66218 (contains!809 (toList!778 lt!51579) (tuple2!2351 lt!51430 (minValue!2413 (v!2835 (underlying!340 thiss!992))))))))

(assert (= (and d!27487 res!50931) b!101726))

(assert (= (and b!101726 res!50930) b!101727))

(declare-fun m!112383 () Bool)

(assert (=> d!27487 m!112383))

(declare-fun m!112385 () Bool)

(assert (=> d!27487 m!112385))

(declare-fun m!112387 () Bool)

(assert (=> d!27487 m!112387))

(declare-fun m!112389 () Bool)

(assert (=> d!27487 m!112389))

(declare-fun m!112391 () Bool)

(assert (=> b!101726 m!112391))

(declare-fun m!112393 () Bool)

(assert (=> b!101727 m!112393))

(assert (=> b!101496 d!27487))

(declare-fun d!27489 () Bool)

(declare-fun e!66219 () Bool)

(assert (=> d!27489 e!66219))

(declare-fun res!50933 () Bool)

(assert (=> d!27489 (=> (not res!50933) (not e!66219))))

(declare-fun lt!51583 () ListLongMap!1525)

(assert (=> d!27489 (= res!50933 (contains!807 lt!51583 (_1!1186 (tuple2!2351 lt!51411 (minValue!2413 (v!2835 (underlying!340 thiss!992)))))))))

(declare-fun lt!51580 () List!1599)

(assert (=> d!27489 (= lt!51583 (ListLongMap!1526 lt!51580))))

(declare-fun lt!51582 () Unit!3090)

(declare-fun lt!51581 () Unit!3090)

(assert (=> d!27489 (= lt!51582 lt!51581)))

(assert (=> d!27489 (= (getValueByKey!151 lt!51580 (_1!1186 (tuple2!2351 lt!51411 (minValue!2413 (v!2835 (underlying!340 thiss!992)))))) (Some!156 (_2!1186 (tuple2!2351 lt!51411 (minValue!2413 (v!2835 (underlying!340 thiss!992)))))))))

(assert (=> d!27489 (= lt!51581 (lemmaContainsTupThenGetReturnValue!70 lt!51580 (_1!1186 (tuple2!2351 lt!51411 (minValue!2413 (v!2835 (underlying!340 thiss!992))))) (_2!1186 (tuple2!2351 lt!51411 (minValue!2413 (v!2835 (underlying!340 thiss!992)))))))))

(assert (=> d!27489 (= lt!51580 (insertStrictlySorted!73 (toList!778 lt!51426) (_1!1186 (tuple2!2351 lt!51411 (minValue!2413 (v!2835 (underlying!340 thiss!992))))) (_2!1186 (tuple2!2351 lt!51411 (minValue!2413 (v!2835 (underlying!340 thiss!992)))))))))

(assert (=> d!27489 (= (+!131 lt!51426 (tuple2!2351 lt!51411 (minValue!2413 (v!2835 (underlying!340 thiss!992))))) lt!51583)))

(declare-fun b!101728 () Bool)

(declare-fun res!50932 () Bool)

(assert (=> b!101728 (=> (not res!50932) (not e!66219))))

(assert (=> b!101728 (= res!50932 (= (getValueByKey!151 (toList!778 lt!51583) (_1!1186 (tuple2!2351 lt!51411 (minValue!2413 (v!2835 (underlying!340 thiss!992)))))) (Some!156 (_2!1186 (tuple2!2351 lt!51411 (minValue!2413 (v!2835 (underlying!340 thiss!992))))))))))

(declare-fun b!101729 () Bool)

(assert (=> b!101729 (= e!66219 (contains!809 (toList!778 lt!51583) (tuple2!2351 lt!51411 (minValue!2413 (v!2835 (underlying!340 thiss!992))))))))

(assert (= (and d!27489 res!50933) b!101728))

(assert (= (and b!101728 res!50932) b!101729))

(declare-fun m!112395 () Bool)

(assert (=> d!27489 m!112395))

(declare-fun m!112397 () Bool)

(assert (=> d!27489 m!112397))

(declare-fun m!112399 () Bool)

(assert (=> d!27489 m!112399))

(declare-fun m!112401 () Bool)

(assert (=> d!27489 m!112401))

(declare-fun m!112403 () Bool)

(assert (=> b!101728 m!112403))

(declare-fun m!112405 () Bool)

(assert (=> b!101729 m!112405))

(assert (=> b!101496 d!27489))

(declare-fun d!27491 () Bool)

(assert (=> d!27491 (= (apply!95 (+!131 lt!51409 (tuple2!2351 lt!51419 (zeroValue!2413 (v!2835 (underlying!340 thiss!992))))) lt!51412) (apply!95 lt!51409 lt!51412))))

(declare-fun lt!51584 () Unit!3090)

(assert (=> d!27491 (= lt!51584 (choose!633 lt!51409 lt!51419 (zeroValue!2413 (v!2835 (underlying!340 thiss!992))) lt!51412))))

(declare-fun e!66220 () Bool)

(assert (=> d!27491 e!66220))

(declare-fun res!50934 () Bool)

(assert (=> d!27491 (=> (not res!50934) (not e!66220))))

(assert (=> d!27491 (= res!50934 (contains!807 lt!51409 lt!51412))))

(assert (=> d!27491 (= (addApplyDifferent!71 lt!51409 lt!51419 (zeroValue!2413 (v!2835 (underlying!340 thiss!992))) lt!51412) lt!51584)))

(declare-fun b!101730 () Bool)

(assert (=> b!101730 (= e!66220 (not (= lt!51412 lt!51419)))))

(assert (= (and d!27491 res!50934) b!101730))

(declare-fun m!112407 () Bool)

(assert (=> d!27491 m!112407))

(assert (=> d!27491 m!112143))

(assert (=> d!27491 m!112145))

(assert (=> d!27491 m!112143))

(declare-fun m!112409 () Bool)

(assert (=> d!27491 m!112409))

(assert (=> d!27491 m!112153))

(assert (=> b!101496 d!27491))

(declare-fun b!101755 () Bool)

(declare-fun e!66235 () ListLongMap!1525)

(declare-fun e!66239 () ListLongMap!1525)

(assert (=> b!101755 (= e!66235 e!66239)))

(declare-fun c!17512 () Bool)

(assert (=> b!101755 (= c!17512 (validKeyInArray!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun d!27493 () Bool)

(declare-fun e!66238 () Bool)

(assert (=> d!27493 e!66238))

(declare-fun res!50944 () Bool)

(assert (=> d!27493 (=> (not res!50944) (not e!66238))))

(declare-fun lt!51601 () ListLongMap!1525)

(assert (=> d!27493 (= res!50944 (not (contains!807 lt!51601 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27493 (= lt!51601 e!66235)))

(declare-fun c!17514 () Bool)

(assert (=> d!27493 (= c!17514 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992))))))))

(assert (=> d!27493 (validMask!0 (mask!6657 (v!2835 (underlying!340 thiss!992))))))

(assert (=> d!27493 (= (getCurrentListMapNoExtraKeys!95 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (_values!2518 (v!2835 (underlying!340 thiss!992))) (mask!6657 (v!2835 (underlying!340 thiss!992))) (extraKeys!2346 (v!2835 (underlying!340 thiss!992))) (zeroValue!2413 (v!2835 (underlying!340 thiss!992))) (minValue!2413 (v!2835 (underlying!340 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2535 (v!2835 (underlying!340 thiss!992)))) lt!51601)))

(declare-fun bm!10594 () Bool)

(declare-fun call!10597 () ListLongMap!1525)

(assert (=> bm!10594 (= call!10597 (getCurrentListMapNoExtraKeys!95 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (_values!2518 (v!2835 (underlying!340 thiss!992))) (mask!6657 (v!2835 (underlying!340 thiss!992))) (extraKeys!2346 (v!2835 (underlying!340 thiss!992))) (zeroValue!2413 (v!2835 (underlying!340 thiss!992))) (minValue!2413 (v!2835 (underlying!340 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2535 (v!2835 (underlying!340 thiss!992)))))))

(declare-fun b!101756 () Bool)

(declare-fun e!66241 () Bool)

(declare-fun isEmpty!368 (ListLongMap!1525) Bool)

(assert (=> b!101756 (= e!66241 (isEmpty!368 lt!51601))))

(declare-fun b!101757 () Bool)

(declare-fun e!66236 () Bool)

(assert (=> b!101757 (= e!66238 e!66236)))

(declare-fun c!17511 () Bool)

(declare-fun e!66237 () Bool)

(assert (=> b!101757 (= c!17511 e!66237)))

(declare-fun res!50946 () Bool)

(assert (=> b!101757 (=> (not res!50946) (not e!66237))))

(assert (=> b!101757 (= res!50946 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992))))))))

(declare-fun b!101758 () Bool)

(assert (=> b!101758 (= e!66235 (ListLongMap!1526 Nil!1596))))

(declare-fun b!101759 () Bool)

(assert (=> b!101759 (= e!66241 (= lt!51601 (getCurrentListMapNoExtraKeys!95 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (_values!2518 (v!2835 (underlying!340 thiss!992))) (mask!6657 (v!2835 (underlying!340 thiss!992))) (extraKeys!2346 (v!2835 (underlying!340 thiss!992))) (zeroValue!2413 (v!2835 (underlying!340 thiss!992))) (minValue!2413 (v!2835 (underlying!340 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))))))))

(declare-fun b!101760 () Bool)

(assert (=> b!101760 (= e!66237 (validKeyInArray!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!101760 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!101761 () Bool)

(declare-fun lt!51602 () Unit!3090)

(declare-fun lt!51600 () Unit!3090)

(assert (=> b!101761 (= lt!51602 lt!51600)))

(declare-fun lt!51604 () (_ BitVec 64))

(declare-fun lt!51599 () (_ BitVec 64))

(declare-fun lt!51603 () ListLongMap!1525)

(declare-fun lt!51605 () V!3177)

(assert (=> b!101761 (not (contains!807 (+!131 lt!51603 (tuple2!2351 lt!51599 lt!51605)) lt!51604))))

(declare-fun addStillNotContains!44 (ListLongMap!1525 (_ BitVec 64) V!3177 (_ BitVec 64)) Unit!3090)

(assert (=> b!101761 (= lt!51600 (addStillNotContains!44 lt!51603 lt!51599 lt!51605 lt!51604))))

(assert (=> b!101761 (= lt!51604 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!101761 (= lt!51605 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!101761 (= lt!51599 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!101761 (= lt!51603 call!10597)))

(assert (=> b!101761 (= e!66239 (+!131 call!10597 (tuple2!2351 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!101762 () Bool)

(assert (=> b!101762 (= e!66239 call!10597)))

(declare-fun b!101763 () Bool)

(assert (=> b!101763 (= e!66236 e!66241)))

(declare-fun c!17513 () Bool)

(assert (=> b!101763 (= c!17513 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992))))))))

(declare-fun b!101764 () Bool)

(declare-fun res!50943 () Bool)

(assert (=> b!101764 (=> (not res!50943) (not e!66238))))

(assert (=> b!101764 (= res!50943 (not (contains!807 lt!51601 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101765 () Bool)

(assert (=> b!101765 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992))))))))

(assert (=> b!101765 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2275 (_values!2518 (v!2835 (underlying!340 thiss!992))))))))

(declare-fun e!66240 () Bool)

(assert (=> b!101765 (= e!66240 (= (apply!95 lt!51601 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!101766 () Bool)

(assert (=> b!101766 (= e!66236 e!66240)))

(assert (=> b!101766 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992))))))))

(declare-fun res!50945 () Bool)

(assert (=> b!101766 (= res!50945 (contains!807 lt!51601 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!101766 (=> (not res!50945) (not e!66240))))

(assert (= (and d!27493 c!17514) b!101758))

(assert (= (and d!27493 (not c!17514)) b!101755))

(assert (= (and b!101755 c!17512) b!101761))

(assert (= (and b!101755 (not c!17512)) b!101762))

(assert (= (or b!101761 b!101762) bm!10594))

(assert (= (and d!27493 res!50944) b!101764))

(assert (= (and b!101764 res!50943) b!101757))

(assert (= (and b!101757 res!50946) b!101760))

(assert (= (and b!101757 c!17511) b!101766))

(assert (= (and b!101757 (not c!17511)) b!101763))

(assert (= (and b!101766 res!50945) b!101765))

(assert (= (and b!101763 c!17513) b!101759))

(assert (= (and b!101763 (not c!17513)) b!101756))

(declare-fun b_lambda!4541 () Bool)

(assert (=> (not b_lambda!4541) (not b!101761)))

(assert (=> b!101761 t!5597))

(declare-fun b_and!6249 () Bool)

(assert (= b_and!6245 (and (=> t!5597 result!3331) b_and!6249)))

(assert (=> b!101761 t!5599))

(declare-fun b_and!6251 () Bool)

(assert (= b_and!6247 (and (=> t!5599 result!3335) b_and!6251)))

(declare-fun b_lambda!4543 () Bool)

(assert (=> (not b_lambda!4543) (not b!101765)))

(assert (=> b!101765 t!5597))

(declare-fun b_and!6253 () Bool)

(assert (= b_and!6249 (and (=> t!5597 result!3331) b_and!6253)))

(assert (=> b!101765 t!5599))

(declare-fun b_and!6255 () Bool)

(assert (= b_and!6251 (and (=> t!5599 result!3335) b_and!6255)))

(declare-fun m!112411 () Bool)

(assert (=> b!101759 m!112411))

(assert (=> b!101766 m!112127))

(assert (=> b!101766 m!112127))

(declare-fun m!112413 () Bool)

(assert (=> b!101766 m!112413))

(assert (=> b!101760 m!112127))

(assert (=> b!101760 m!112127))

(assert (=> b!101760 m!112131))

(declare-fun m!112415 () Bool)

(assert (=> b!101756 m!112415))

(assert (=> b!101765 m!111981))

(assert (=> b!101765 m!112167))

(assert (=> b!101765 m!111981))

(assert (=> b!101765 m!112169))

(assert (=> b!101765 m!112127))

(declare-fun m!112417 () Bool)

(assert (=> b!101765 m!112417))

(assert (=> b!101765 m!112127))

(assert (=> b!101765 m!112167))

(assert (=> b!101755 m!112127))

(assert (=> b!101755 m!112127))

(assert (=> b!101755 m!112131))

(assert (=> b!101761 m!111981))

(declare-fun m!112419 () Bool)

(assert (=> b!101761 m!112419))

(declare-fun m!112421 () Bool)

(assert (=> b!101761 m!112421))

(assert (=> b!101761 m!112167))

(assert (=> b!101761 m!111981))

(assert (=> b!101761 m!112169))

(declare-fun m!112423 () Bool)

(assert (=> b!101761 m!112423))

(assert (=> b!101761 m!112167))

(assert (=> b!101761 m!112127))

(assert (=> b!101761 m!112421))

(declare-fun m!112425 () Bool)

(assert (=> b!101761 m!112425))

(declare-fun m!112427 () Bool)

(assert (=> d!27493 m!112427))

(assert (=> d!27493 m!111987))

(declare-fun m!112429 () Bool)

(assert (=> b!101764 m!112429))

(assert (=> bm!10594 m!112411))

(assert (=> b!101496 d!27493))

(assert (=> bm!10575 d!27419))

(declare-fun b!101767 () Bool)

(declare-fun e!66248 () Bool)

(declare-fun e!66251 () Bool)

(assert (=> b!101767 (= e!66248 e!66251)))

(declare-fun res!50949 () Bool)

(declare-fun call!10603 () Bool)

(assert (=> b!101767 (= res!50949 call!10603)))

(assert (=> b!101767 (=> (not res!50949) (not e!66251))))

(declare-fun b!101768 () Bool)

(declare-fun e!66245 () Unit!3090)

(declare-fun lt!51611 () Unit!3090)

(assert (=> b!101768 (= e!66245 lt!51611)))

(declare-fun lt!51617 () ListLongMap!1525)

(assert (=> b!101768 (= lt!51617 (getCurrentListMapNoExtraKeys!95 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51622 () (_ BitVec 64))

(assert (=> b!101768 (= lt!51622 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51618 () (_ BitVec 64))

(assert (=> b!101768 (= lt!51618 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51625 () Unit!3090)

(assert (=> b!101768 (= lt!51625 (addStillContains!71 lt!51617 lt!51622 (zeroValue!2413 newMap!16) lt!51618))))

(assert (=> b!101768 (contains!807 (+!131 lt!51617 (tuple2!2351 lt!51622 (zeroValue!2413 newMap!16))) lt!51618)))

(declare-fun lt!51621 () Unit!3090)

(assert (=> b!101768 (= lt!51621 lt!51625)))

(declare-fun lt!51623 () ListLongMap!1525)

(assert (=> b!101768 (= lt!51623 (getCurrentListMapNoExtraKeys!95 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51608 () (_ BitVec 64))

(assert (=> b!101768 (= lt!51608 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51613 () (_ BitVec 64))

(assert (=> b!101768 (= lt!51613 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51624 () Unit!3090)

(assert (=> b!101768 (= lt!51624 (addApplyDifferent!71 lt!51623 lt!51608 (minValue!2413 newMap!16) lt!51613))))

(assert (=> b!101768 (= (apply!95 (+!131 lt!51623 (tuple2!2351 lt!51608 (minValue!2413 newMap!16))) lt!51613) (apply!95 lt!51623 lt!51613))))

(declare-fun lt!51619 () Unit!3090)

(assert (=> b!101768 (= lt!51619 lt!51624)))

(declare-fun lt!51606 () ListLongMap!1525)

(assert (=> b!101768 (= lt!51606 (getCurrentListMapNoExtraKeys!95 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51616 () (_ BitVec 64))

(assert (=> b!101768 (= lt!51616 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51609 () (_ BitVec 64))

(assert (=> b!101768 (= lt!51609 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51610 () Unit!3090)

(assert (=> b!101768 (= lt!51610 (addApplyDifferent!71 lt!51606 lt!51616 (zeroValue!2413 newMap!16) lt!51609))))

(assert (=> b!101768 (= (apply!95 (+!131 lt!51606 (tuple2!2351 lt!51616 (zeroValue!2413 newMap!16))) lt!51609) (apply!95 lt!51606 lt!51609))))

(declare-fun lt!51615 () Unit!3090)

(assert (=> b!101768 (= lt!51615 lt!51610)))

(declare-fun lt!51626 () ListLongMap!1525)

(assert (=> b!101768 (= lt!51626 (getCurrentListMapNoExtraKeys!95 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51627 () (_ BitVec 64))

(assert (=> b!101768 (= lt!51627 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51620 () (_ BitVec 64))

(assert (=> b!101768 (= lt!51620 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!101768 (= lt!51611 (addApplyDifferent!71 lt!51626 lt!51627 (minValue!2413 newMap!16) lt!51620))))

(assert (=> b!101768 (= (apply!95 (+!131 lt!51626 (tuple2!2351 lt!51627 (minValue!2413 newMap!16))) lt!51620) (apply!95 lt!51626 lt!51620))))

(declare-fun bm!10595 () Bool)

(declare-fun call!10600 () ListLongMap!1525)

(assert (=> bm!10595 (= call!10600 (getCurrentListMapNoExtraKeys!95 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun b!101769 () Bool)

(declare-fun e!66253 () Bool)

(declare-fun e!66249 () Bool)

(assert (=> b!101769 (= e!66253 e!66249)))

(declare-fun res!50947 () Bool)

(declare-fun call!10599 () Bool)

(assert (=> b!101769 (= res!50947 call!10599)))

(assert (=> b!101769 (=> (not res!50947) (not e!66249))))

(declare-fun b!101770 () Bool)

(assert (=> b!101770 (= e!66248 (not call!10603))))

(declare-fun c!17518 () Bool)

(declare-fun bm!10596 () Bool)

(declare-fun call!10602 () ListLongMap!1525)

(declare-fun call!10604 () ListLongMap!1525)

(declare-fun call!10598 () ListLongMap!1525)

(declare-fun c!17515 () Bool)

(assert (=> bm!10596 (= call!10598 (+!131 (ite c!17518 call!10600 (ite c!17515 call!10602 call!10604)) (ite (or c!17518 c!17515) (tuple2!2351 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2413 newMap!16)) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 newMap!16)))))))

(declare-fun b!101771 () Bool)

(declare-fun e!66247 () Bool)

(assert (=> b!101771 (= e!66247 (validKeyInArray!0 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101772 () Bool)

(declare-fun e!66254 () Bool)

(declare-fun lt!51612 () ListLongMap!1525)

(assert (=> b!101772 (= e!66254 (= (apply!95 lt!51612 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000)) (get!1305 (select (arr!2021 (_values!2518 newMap!16)) #b00000000000000000000000000000000) (dynLambda!375 (defaultEntry!2535 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101772 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2275 (_values!2518 newMap!16))))))

(assert (=> b!101772 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2274 (_keys!4234 newMap!16))))))

(declare-fun b!101773 () Bool)

(assert (=> b!101773 (= e!66251 (= (apply!95 lt!51612 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2413 newMap!16)))))

(declare-fun bm!10597 () Bool)

(declare-fun call!10601 () ListLongMap!1525)

(assert (=> bm!10597 (= call!10601 call!10598)))

(declare-fun b!101774 () Bool)

(declare-fun e!66246 () ListLongMap!1525)

(assert (=> b!101774 (= e!66246 call!10601)))

(declare-fun b!101775 () Bool)

(assert (=> b!101775 (= e!66253 (not call!10599))))

(declare-fun b!101776 () Bool)

(declare-fun e!66243 () Bool)

(assert (=> b!101776 (= e!66243 (validKeyInArray!0 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!10598 () Bool)

(assert (=> bm!10598 (= call!10604 call!10602)))

(declare-fun b!101777 () Bool)

(declare-fun Unit!3105 () Unit!3090)

(assert (=> b!101777 (= e!66245 Unit!3105)))

(declare-fun b!101778 () Bool)

(declare-fun e!66244 () ListLongMap!1525)

(assert (=> b!101778 (= e!66244 call!10604)))

(declare-fun b!101779 () Bool)

(declare-fun e!66250 () ListLongMap!1525)

(assert (=> b!101779 (= e!66250 (+!131 call!10598 (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 newMap!16))))))

(declare-fun b!101780 () Bool)

(declare-fun res!50948 () Bool)

(declare-fun e!66252 () Bool)

(assert (=> b!101780 (=> (not res!50948) (not e!66252))))

(declare-fun e!66242 () Bool)

(assert (=> b!101780 (= res!50948 e!66242)))

(declare-fun res!50953 () Bool)

(assert (=> b!101780 (=> res!50953 e!66242)))

(assert (=> b!101780 (= res!50953 (not e!66243))))

(declare-fun res!50954 () Bool)

(assert (=> b!101780 (=> (not res!50954) (not e!66243))))

(assert (=> b!101780 (= res!50954 (bvslt #b00000000000000000000000000000000 (size!2274 (_keys!4234 newMap!16))))))

(declare-fun bm!10599 () Bool)

(assert (=> bm!10599 (= call!10599 (contains!807 lt!51612 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101781 () Bool)

(assert (=> b!101781 (= e!66252 e!66253)))

(declare-fun c!17516 () Bool)

(assert (=> b!101781 (= c!17516 (not (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!101782 () Bool)

(assert (=> b!101782 (= e!66244 call!10601)))

(declare-fun b!101783 () Bool)

(assert (=> b!101783 (= e!66242 e!66254)))

(declare-fun res!50955 () Bool)

(assert (=> b!101783 (=> (not res!50955) (not e!66254))))

(assert (=> b!101783 (= res!50955 (contains!807 lt!51612 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!101783 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2274 (_keys!4234 newMap!16))))))

(declare-fun b!101784 () Bool)

(assert (=> b!101784 (= e!66250 e!66246)))

(assert (=> b!101784 (= c!17515 (and (not (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!101785 () Bool)

(declare-fun res!50950 () Bool)

(assert (=> b!101785 (=> (not res!50950) (not e!66252))))

(assert (=> b!101785 (= res!50950 e!66248)))

(declare-fun c!17520 () Bool)

(assert (=> b!101785 (= c!17520 (not (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!101786 () Bool)

(declare-fun c!17519 () Bool)

(assert (=> b!101786 (= c!17519 (and (not (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!101786 (= e!66246 e!66244)))

(declare-fun b!101787 () Bool)

(assert (=> b!101787 (= e!66249 (= (apply!95 lt!51612 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2413 newMap!16)))))

(declare-fun bm!10600 () Bool)

(assert (=> bm!10600 (= call!10603 (contains!807 lt!51612 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!10601 () Bool)

(assert (=> bm!10601 (= call!10602 call!10600)))

(declare-fun d!27495 () Bool)

(assert (=> d!27495 e!66252))

(declare-fun res!50951 () Bool)

(assert (=> d!27495 (=> (not res!50951) (not e!66252))))

(assert (=> d!27495 (= res!50951 (or (bvsge #b00000000000000000000000000000000 (size!2274 (_keys!4234 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2274 (_keys!4234 newMap!16))))))))

(declare-fun lt!51607 () ListLongMap!1525)

(assert (=> d!27495 (= lt!51612 lt!51607)))

(declare-fun lt!51614 () Unit!3090)

(assert (=> d!27495 (= lt!51614 e!66245)))

(declare-fun c!17517 () Bool)

(assert (=> d!27495 (= c!17517 e!66247)))

(declare-fun res!50952 () Bool)

(assert (=> d!27495 (=> (not res!50952) (not e!66247))))

(assert (=> d!27495 (= res!50952 (bvslt #b00000000000000000000000000000000 (size!2274 (_keys!4234 newMap!16))))))

(assert (=> d!27495 (= lt!51607 e!66250)))

(assert (=> d!27495 (= c!17518 (and (not (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27495 (validMask!0 (mask!6657 newMap!16))))

(assert (=> d!27495 (= (getCurrentListMap!457 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)) lt!51612)))

(assert (= (and d!27495 c!17518) b!101779))

(assert (= (and d!27495 (not c!17518)) b!101784))

(assert (= (and b!101784 c!17515) b!101774))

(assert (= (and b!101784 (not c!17515)) b!101786))

(assert (= (and b!101786 c!17519) b!101782))

(assert (= (and b!101786 (not c!17519)) b!101778))

(assert (= (or b!101782 b!101778) bm!10598))

(assert (= (or b!101774 bm!10598) bm!10601))

(assert (= (or b!101774 b!101782) bm!10597))

(assert (= (or b!101779 bm!10601) bm!10595))

(assert (= (or b!101779 bm!10597) bm!10596))

(assert (= (and d!27495 res!50952) b!101771))

(assert (= (and d!27495 c!17517) b!101768))

(assert (= (and d!27495 (not c!17517)) b!101777))

(assert (= (and d!27495 res!50951) b!101780))

(assert (= (and b!101780 res!50954) b!101776))

(assert (= (and b!101780 (not res!50953)) b!101783))

(assert (= (and b!101783 res!50955) b!101772))

(assert (= (and b!101780 res!50948) b!101785))

(assert (= (and b!101785 c!17520) b!101767))

(assert (= (and b!101785 (not c!17520)) b!101770))

(assert (= (and b!101767 res!50949) b!101773))

(assert (= (or b!101767 b!101770) bm!10600))

(assert (= (and b!101785 res!50950) b!101781))

(assert (= (and b!101781 c!17516) b!101769))

(assert (= (and b!101781 (not c!17516)) b!101775))

(assert (= (and b!101769 res!50947) b!101787))

(assert (= (or b!101769 b!101775) bm!10599))

(declare-fun b_lambda!4545 () Bool)

(assert (=> (not b_lambda!4545) (not b!101772)))

(declare-fun t!5612 () Bool)

(declare-fun tb!1981 () Bool)

(assert (=> (and b!101289 (= (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) (defaultEntry!2535 newMap!16)) t!5612) tb!1981))

(declare-fun result!3351 () Bool)

(assert (=> tb!1981 (= result!3351 tp_is_empty!2647)))

(assert (=> b!101772 t!5612))

(declare-fun b_and!6257 () Bool)

(assert (= b_and!6253 (and (=> t!5612 result!3351) b_and!6257)))

(declare-fun t!5614 () Bool)

(declare-fun tb!1983 () Bool)

(assert (=> (and b!101277 (= (defaultEntry!2535 newMap!16) (defaultEntry!2535 newMap!16)) t!5614) tb!1983))

(declare-fun result!3353 () Bool)

(assert (= result!3353 result!3351))

(assert (=> b!101772 t!5614))

(declare-fun b_and!6259 () Bool)

(assert (= b_and!6255 (and (=> t!5614 result!3353) b_and!6259)))

(declare-fun m!112431 () Bool)

(assert (=> bm!10599 m!112431))

(declare-fun m!112433 () Bool)

(assert (=> d!27495 m!112433))

(declare-fun m!112435 () Bool)

(assert (=> b!101787 m!112435))

(declare-fun m!112437 () Bool)

(assert (=> b!101773 m!112437))

(declare-fun m!112439 () Bool)

(assert (=> b!101779 m!112439))

(declare-fun m!112441 () Bool)

(assert (=> bm!10600 m!112441))

(assert (=> b!101783 m!112279))

(assert (=> b!101783 m!112279))

(declare-fun m!112443 () Bool)

(assert (=> b!101783 m!112443))

(assert (=> b!101771 m!112279))

(assert (=> b!101771 m!112279))

(declare-fun m!112445 () Bool)

(assert (=> b!101771 m!112445))

(declare-fun m!112447 () Bool)

(assert (=> b!101768 m!112447))

(declare-fun m!112449 () Bool)

(assert (=> b!101768 m!112449))

(assert (=> b!101768 m!112449))

(declare-fun m!112451 () Bool)

(assert (=> b!101768 m!112451))

(declare-fun m!112453 () Bool)

(assert (=> b!101768 m!112453))

(assert (=> b!101768 m!112447))

(declare-fun m!112455 () Bool)

(assert (=> b!101768 m!112455))

(declare-fun m!112457 () Bool)

(assert (=> b!101768 m!112457))

(declare-fun m!112459 () Bool)

(assert (=> b!101768 m!112459))

(assert (=> b!101768 m!112457))

(declare-fun m!112461 () Bool)

(assert (=> b!101768 m!112461))

(declare-fun m!112463 () Bool)

(assert (=> b!101768 m!112463))

(declare-fun m!112465 () Bool)

(assert (=> b!101768 m!112465))

(declare-fun m!112467 () Bool)

(assert (=> b!101768 m!112467))

(assert (=> b!101768 m!112279))

(declare-fun m!112469 () Bool)

(assert (=> b!101768 m!112469))

(declare-fun m!112471 () Bool)

(assert (=> b!101768 m!112471))

(declare-fun m!112473 () Bool)

(assert (=> b!101768 m!112473))

(declare-fun m!112475 () Bool)

(assert (=> b!101768 m!112475))

(assert (=> b!101768 m!112469))

(declare-fun m!112477 () Bool)

(assert (=> b!101768 m!112477))

(declare-fun m!112479 () Bool)

(assert (=> bm!10596 m!112479))

(assert (=> b!101776 m!112279))

(assert (=> b!101776 m!112279))

(assert (=> b!101776 m!112445))

(declare-fun m!112481 () Bool)

(assert (=> b!101772 m!112481))

(declare-fun m!112483 () Bool)

(assert (=> b!101772 m!112483))

(assert (=> b!101772 m!112481))

(declare-fun m!112485 () Bool)

(assert (=> b!101772 m!112485))

(assert (=> b!101772 m!112483))

(assert (=> b!101772 m!112279))

(assert (=> b!101772 m!112279))

(declare-fun m!112487 () Bool)

(assert (=> b!101772 m!112487))

(assert (=> bm!10595 m!112465))

(assert (=> b!101657 d!27495))

(declare-fun d!27497 () Bool)

(assert (=> d!27497 (= (get!1306 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2834 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(assert (=> b!101672 d!27497))

(declare-fun b!101788 () Bool)

(declare-fun e!66261 () Bool)

(declare-fun e!66264 () Bool)

(assert (=> b!101788 (= e!66261 e!66264)))

(declare-fun res!50958 () Bool)

(declare-fun call!10610 () Bool)

(assert (=> b!101788 (= res!50958 call!10610)))

(assert (=> b!101788 (=> (not res!50958) (not e!66264))))

(declare-fun b!101789 () Bool)

(declare-fun e!66258 () Unit!3090)

(declare-fun lt!51633 () Unit!3090)

(assert (=> b!101789 (= e!66258 lt!51633)))

(declare-fun lt!51639 () ListLongMap!1525)

(assert (=> b!101789 (= lt!51639 (getCurrentListMapNoExtraKeys!95 (_keys!4234 newMap!16) (ite (or c!17489 c!17490) (_values!2518 newMap!16) lt!51507) (mask!6657 newMap!16) (ite c!17489 (ite c!17486 lt!51524 lt!51522) (extraKeys!2346 newMap!16)) (ite (and c!17489 c!17486) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2413 newMap!16)) (ite c!17489 (ite c!17486 (minValue!2413 newMap!16) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2413 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51644 () (_ BitVec 64))

(assert (=> b!101789 (= lt!51644 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51640 () (_ BitVec 64))

(assert (=> b!101789 (= lt!51640 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51647 () Unit!3090)

(assert (=> b!101789 (= lt!51647 (addStillContains!71 lt!51639 lt!51644 (ite (and c!17489 c!17486) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2413 newMap!16)) lt!51640))))

(assert (=> b!101789 (contains!807 (+!131 lt!51639 (tuple2!2351 lt!51644 (ite (and c!17489 c!17486) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2413 newMap!16)))) lt!51640)))

(declare-fun lt!51643 () Unit!3090)

(assert (=> b!101789 (= lt!51643 lt!51647)))

(declare-fun lt!51645 () ListLongMap!1525)

(assert (=> b!101789 (= lt!51645 (getCurrentListMapNoExtraKeys!95 (_keys!4234 newMap!16) (ite (or c!17489 c!17490) (_values!2518 newMap!16) lt!51507) (mask!6657 newMap!16) (ite c!17489 (ite c!17486 lt!51524 lt!51522) (extraKeys!2346 newMap!16)) (ite (and c!17489 c!17486) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2413 newMap!16)) (ite c!17489 (ite c!17486 (minValue!2413 newMap!16) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2413 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51630 () (_ BitVec 64))

(assert (=> b!101789 (= lt!51630 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51635 () (_ BitVec 64))

(assert (=> b!101789 (= lt!51635 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51646 () Unit!3090)

(assert (=> b!101789 (= lt!51646 (addApplyDifferent!71 lt!51645 lt!51630 (ite c!17489 (ite c!17486 (minValue!2413 newMap!16) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2413 newMap!16)) lt!51635))))

(assert (=> b!101789 (= (apply!95 (+!131 lt!51645 (tuple2!2351 lt!51630 (ite c!17489 (ite c!17486 (minValue!2413 newMap!16) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2413 newMap!16)))) lt!51635) (apply!95 lt!51645 lt!51635))))

(declare-fun lt!51641 () Unit!3090)

(assert (=> b!101789 (= lt!51641 lt!51646)))

(declare-fun lt!51628 () ListLongMap!1525)

(assert (=> b!101789 (= lt!51628 (getCurrentListMapNoExtraKeys!95 (_keys!4234 newMap!16) (ite (or c!17489 c!17490) (_values!2518 newMap!16) lt!51507) (mask!6657 newMap!16) (ite c!17489 (ite c!17486 lt!51524 lt!51522) (extraKeys!2346 newMap!16)) (ite (and c!17489 c!17486) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2413 newMap!16)) (ite c!17489 (ite c!17486 (minValue!2413 newMap!16) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2413 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51638 () (_ BitVec 64))

(assert (=> b!101789 (= lt!51638 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51631 () (_ BitVec 64))

(assert (=> b!101789 (= lt!51631 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51632 () Unit!3090)

(assert (=> b!101789 (= lt!51632 (addApplyDifferent!71 lt!51628 lt!51638 (ite (and c!17489 c!17486) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2413 newMap!16)) lt!51631))))

(assert (=> b!101789 (= (apply!95 (+!131 lt!51628 (tuple2!2351 lt!51638 (ite (and c!17489 c!17486) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2413 newMap!16)))) lt!51631) (apply!95 lt!51628 lt!51631))))

(declare-fun lt!51637 () Unit!3090)

(assert (=> b!101789 (= lt!51637 lt!51632)))

(declare-fun lt!51648 () ListLongMap!1525)

(assert (=> b!101789 (= lt!51648 (getCurrentListMapNoExtraKeys!95 (_keys!4234 newMap!16) (ite (or c!17489 c!17490) (_values!2518 newMap!16) lt!51507) (mask!6657 newMap!16) (ite c!17489 (ite c!17486 lt!51524 lt!51522) (extraKeys!2346 newMap!16)) (ite (and c!17489 c!17486) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2413 newMap!16)) (ite c!17489 (ite c!17486 (minValue!2413 newMap!16) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2413 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51649 () (_ BitVec 64))

(assert (=> b!101789 (= lt!51649 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51642 () (_ BitVec 64))

(assert (=> b!101789 (= lt!51642 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!101789 (= lt!51633 (addApplyDifferent!71 lt!51648 lt!51649 (ite c!17489 (ite c!17486 (minValue!2413 newMap!16) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2413 newMap!16)) lt!51642))))

(assert (=> b!101789 (= (apply!95 (+!131 lt!51648 (tuple2!2351 lt!51649 (ite c!17489 (ite c!17486 (minValue!2413 newMap!16) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2413 newMap!16)))) lt!51642) (apply!95 lt!51648 lt!51642))))

(declare-fun bm!10602 () Bool)

(declare-fun call!10607 () ListLongMap!1525)

(assert (=> bm!10602 (= call!10607 (getCurrentListMapNoExtraKeys!95 (_keys!4234 newMap!16) (ite (or c!17489 c!17490) (_values!2518 newMap!16) lt!51507) (mask!6657 newMap!16) (ite c!17489 (ite c!17486 lt!51524 lt!51522) (extraKeys!2346 newMap!16)) (ite (and c!17489 c!17486) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2413 newMap!16)) (ite c!17489 (ite c!17486 (minValue!2413 newMap!16) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2413 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun b!101790 () Bool)

(declare-fun e!66266 () Bool)

(declare-fun e!66262 () Bool)

(assert (=> b!101790 (= e!66266 e!66262)))

(declare-fun res!50956 () Bool)

(declare-fun call!10606 () Bool)

(assert (=> b!101790 (= res!50956 call!10606)))

(assert (=> b!101790 (=> (not res!50956) (not e!66262))))

(declare-fun b!101791 () Bool)

(assert (=> b!101791 (= e!66261 (not call!10610))))

(declare-fun call!10611 () ListLongMap!1525)

(declare-fun bm!10603 () Bool)

(declare-fun call!10605 () ListLongMap!1525)

(declare-fun c!17521 () Bool)

(declare-fun call!10609 () ListLongMap!1525)

(declare-fun c!17524 () Bool)

(assert (=> bm!10603 (= call!10605 (+!131 (ite c!17524 call!10607 (ite c!17521 call!10609 call!10611)) (ite (or c!17524 c!17521) (tuple2!2351 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!17489 c!17486) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2413 newMap!16))) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!17489 (ite c!17486 (minValue!2413 newMap!16) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2413 newMap!16))))))))

(declare-fun b!101792 () Bool)

(declare-fun e!66260 () Bool)

(assert (=> b!101792 (= e!66260 (validKeyInArray!0 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!66267 () Bool)

(declare-fun b!101793 () Bool)

(declare-fun lt!51634 () ListLongMap!1525)

(assert (=> b!101793 (= e!66267 (= (apply!95 lt!51634 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000)) (get!1305 (select (arr!2021 (ite (or c!17489 c!17490) (_values!2518 newMap!16) lt!51507)) #b00000000000000000000000000000000) (dynLambda!375 (defaultEntry!2535 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101793 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2275 (ite (or c!17489 c!17490) (_values!2518 newMap!16) lt!51507))))))

(assert (=> b!101793 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2274 (_keys!4234 newMap!16))))))

(declare-fun b!101794 () Bool)

(assert (=> b!101794 (= e!66264 (= (apply!95 lt!51634 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!17489 c!17486) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2413 newMap!16))))))

(declare-fun bm!10604 () Bool)

(declare-fun call!10608 () ListLongMap!1525)

(assert (=> bm!10604 (= call!10608 call!10605)))

(declare-fun b!101795 () Bool)

(declare-fun e!66259 () ListLongMap!1525)

(assert (=> b!101795 (= e!66259 call!10608)))

(declare-fun b!101796 () Bool)

(assert (=> b!101796 (= e!66266 (not call!10606))))

(declare-fun b!101797 () Bool)

(declare-fun e!66256 () Bool)

(assert (=> b!101797 (= e!66256 (validKeyInArray!0 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!10605 () Bool)

(assert (=> bm!10605 (= call!10611 call!10609)))

(declare-fun b!101798 () Bool)

(declare-fun Unit!3106 () Unit!3090)

(assert (=> b!101798 (= e!66258 Unit!3106)))

(declare-fun b!101799 () Bool)

(declare-fun e!66257 () ListLongMap!1525)

(assert (=> b!101799 (= e!66257 call!10611)))

(declare-fun b!101800 () Bool)

(declare-fun e!66263 () ListLongMap!1525)

(assert (=> b!101800 (= e!66263 (+!131 call!10605 (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!17489 (ite c!17486 (minValue!2413 newMap!16) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2413 newMap!16)))))))

(declare-fun b!101801 () Bool)

(declare-fun res!50957 () Bool)

(declare-fun e!66265 () Bool)

(assert (=> b!101801 (=> (not res!50957) (not e!66265))))

(declare-fun e!66255 () Bool)

(assert (=> b!101801 (= res!50957 e!66255)))

(declare-fun res!50962 () Bool)

(assert (=> b!101801 (=> res!50962 e!66255)))

(assert (=> b!101801 (= res!50962 (not e!66256))))

(declare-fun res!50963 () Bool)

(assert (=> b!101801 (=> (not res!50963) (not e!66256))))

(assert (=> b!101801 (= res!50963 (bvslt #b00000000000000000000000000000000 (size!2274 (_keys!4234 newMap!16))))))

(declare-fun bm!10606 () Bool)

(assert (=> bm!10606 (= call!10606 (contains!807 lt!51634 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101802 () Bool)

(assert (=> b!101802 (= e!66265 e!66266)))

(declare-fun c!17522 () Bool)

(assert (=> b!101802 (= c!17522 (not (= (bvand (ite c!17489 (ite c!17486 lt!51524 lt!51522) (extraKeys!2346 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!101803 () Bool)

(assert (=> b!101803 (= e!66257 call!10608)))

(declare-fun b!101804 () Bool)

(assert (=> b!101804 (= e!66255 e!66267)))

(declare-fun res!50964 () Bool)

(assert (=> b!101804 (=> (not res!50964) (not e!66267))))

(assert (=> b!101804 (= res!50964 (contains!807 lt!51634 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!101804 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2274 (_keys!4234 newMap!16))))))

(declare-fun b!101805 () Bool)

(assert (=> b!101805 (= e!66263 e!66259)))

(assert (=> b!101805 (= c!17521 (and (not (= (bvand (ite c!17489 (ite c!17486 lt!51524 lt!51522) (extraKeys!2346 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!17489 (ite c!17486 lt!51524 lt!51522) (extraKeys!2346 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!101806 () Bool)

(declare-fun res!50959 () Bool)

(assert (=> b!101806 (=> (not res!50959) (not e!66265))))

(assert (=> b!101806 (= res!50959 e!66261)))

(declare-fun c!17526 () Bool)

(assert (=> b!101806 (= c!17526 (not (= (bvand (ite c!17489 (ite c!17486 lt!51524 lt!51522) (extraKeys!2346 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun c!17525 () Bool)

(declare-fun b!101807 () Bool)

(assert (=> b!101807 (= c!17525 (and (not (= (bvand (ite c!17489 (ite c!17486 lt!51524 lt!51522) (extraKeys!2346 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!17489 (ite c!17486 lt!51524 lt!51522) (extraKeys!2346 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!101807 (= e!66259 e!66257)))

(declare-fun b!101808 () Bool)

(assert (=> b!101808 (= e!66262 (= (apply!95 lt!51634 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!17489 (ite c!17486 (minValue!2413 newMap!16) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2413 newMap!16))))))

(declare-fun bm!10607 () Bool)

(assert (=> bm!10607 (= call!10610 (contains!807 lt!51634 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!10608 () Bool)

(assert (=> bm!10608 (= call!10609 call!10607)))

(declare-fun d!27499 () Bool)

(assert (=> d!27499 e!66265))

(declare-fun res!50960 () Bool)

(assert (=> d!27499 (=> (not res!50960) (not e!66265))))

(assert (=> d!27499 (= res!50960 (or (bvsge #b00000000000000000000000000000000 (size!2274 (_keys!4234 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2274 (_keys!4234 newMap!16))))))))

(declare-fun lt!51629 () ListLongMap!1525)

(assert (=> d!27499 (= lt!51634 lt!51629)))

(declare-fun lt!51636 () Unit!3090)

(assert (=> d!27499 (= lt!51636 e!66258)))

(declare-fun c!17523 () Bool)

(assert (=> d!27499 (= c!17523 e!66260)))

(declare-fun res!50961 () Bool)

(assert (=> d!27499 (=> (not res!50961) (not e!66260))))

(assert (=> d!27499 (= res!50961 (bvslt #b00000000000000000000000000000000 (size!2274 (_keys!4234 newMap!16))))))

(assert (=> d!27499 (= lt!51629 e!66263)))

(assert (=> d!27499 (= c!17524 (and (not (= (bvand (ite c!17489 (ite c!17486 lt!51524 lt!51522) (extraKeys!2346 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!17489 (ite c!17486 lt!51524 lt!51522) (extraKeys!2346 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27499 (validMask!0 (mask!6657 newMap!16))))

(assert (=> d!27499 (= (getCurrentListMap!457 (_keys!4234 newMap!16) (ite (or c!17489 c!17490) (_values!2518 newMap!16) lt!51507) (mask!6657 newMap!16) (ite c!17489 (ite c!17486 lt!51524 lt!51522) (extraKeys!2346 newMap!16)) (ite (and c!17489 c!17486) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2413 newMap!16)) (ite c!17489 (ite c!17486 (minValue!2413 newMap!16) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2413 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)) lt!51634)))

(assert (= (and d!27499 c!17524) b!101800))

(assert (= (and d!27499 (not c!17524)) b!101805))

(assert (= (and b!101805 c!17521) b!101795))

(assert (= (and b!101805 (not c!17521)) b!101807))

(assert (= (and b!101807 c!17525) b!101803))

(assert (= (and b!101807 (not c!17525)) b!101799))

(assert (= (or b!101803 b!101799) bm!10605))

(assert (= (or b!101795 bm!10605) bm!10608))

(assert (= (or b!101795 b!101803) bm!10604))

(assert (= (or b!101800 bm!10608) bm!10602))

(assert (= (or b!101800 bm!10604) bm!10603))

(assert (= (and d!27499 res!50961) b!101792))

(assert (= (and d!27499 c!17523) b!101789))

(assert (= (and d!27499 (not c!17523)) b!101798))

(assert (= (and d!27499 res!50960) b!101801))

(assert (= (and b!101801 res!50963) b!101797))

(assert (= (and b!101801 (not res!50962)) b!101804))

(assert (= (and b!101804 res!50964) b!101793))

(assert (= (and b!101801 res!50957) b!101806))

(assert (= (and b!101806 c!17526) b!101788))

(assert (= (and b!101806 (not c!17526)) b!101791))

(assert (= (and b!101788 res!50958) b!101794))

(assert (= (or b!101788 b!101791) bm!10607))

(assert (= (and b!101806 res!50959) b!101802))

(assert (= (and b!101802 c!17522) b!101790))

(assert (= (and b!101802 (not c!17522)) b!101796))

(assert (= (and b!101790 res!50956) b!101808))

(assert (= (or b!101790 b!101796) bm!10606))

(declare-fun b_lambda!4547 () Bool)

(assert (=> (not b_lambda!4547) (not b!101793)))

(assert (=> b!101793 t!5612))

(declare-fun b_and!6261 () Bool)

(assert (= b_and!6257 (and (=> t!5612 result!3351) b_and!6261)))

(assert (=> b!101793 t!5614))

(declare-fun b_and!6263 () Bool)

(assert (= b_and!6259 (and (=> t!5614 result!3353) b_and!6263)))

(declare-fun m!112489 () Bool)

(assert (=> bm!10606 m!112489))

(assert (=> d!27499 m!112433))

(declare-fun m!112491 () Bool)

(assert (=> b!101808 m!112491))

(declare-fun m!112493 () Bool)

(assert (=> b!101794 m!112493))

(declare-fun m!112495 () Bool)

(assert (=> b!101800 m!112495))

(declare-fun m!112497 () Bool)

(assert (=> bm!10607 m!112497))

(assert (=> b!101804 m!112279))

(assert (=> b!101804 m!112279))

(declare-fun m!112499 () Bool)

(assert (=> b!101804 m!112499))

(assert (=> b!101792 m!112279))

(assert (=> b!101792 m!112279))

(assert (=> b!101792 m!112445))

(declare-fun m!112501 () Bool)

(assert (=> b!101789 m!112501))

(declare-fun m!112503 () Bool)

(assert (=> b!101789 m!112503))

(assert (=> b!101789 m!112503))

(declare-fun m!112505 () Bool)

(assert (=> b!101789 m!112505))

(declare-fun m!112507 () Bool)

(assert (=> b!101789 m!112507))

(assert (=> b!101789 m!112501))

(declare-fun m!112509 () Bool)

(assert (=> b!101789 m!112509))

(declare-fun m!112511 () Bool)

(assert (=> b!101789 m!112511))

(declare-fun m!112513 () Bool)

(assert (=> b!101789 m!112513))

(assert (=> b!101789 m!112511))

(declare-fun m!112515 () Bool)

(assert (=> b!101789 m!112515))

(declare-fun m!112517 () Bool)

(assert (=> b!101789 m!112517))

(declare-fun m!112519 () Bool)

(assert (=> b!101789 m!112519))

(declare-fun m!112521 () Bool)

(assert (=> b!101789 m!112521))

(assert (=> b!101789 m!112279))

(declare-fun m!112523 () Bool)

(assert (=> b!101789 m!112523))

(declare-fun m!112525 () Bool)

(assert (=> b!101789 m!112525))

(declare-fun m!112527 () Bool)

(assert (=> b!101789 m!112527))

(declare-fun m!112529 () Bool)

(assert (=> b!101789 m!112529))

(assert (=> b!101789 m!112523))

(declare-fun m!112531 () Bool)

(assert (=> b!101789 m!112531))

(declare-fun m!112533 () Bool)

(assert (=> bm!10603 m!112533))

(assert (=> b!101797 m!112279))

(assert (=> b!101797 m!112279))

(assert (=> b!101797 m!112445))

(assert (=> b!101793 m!112481))

(declare-fun m!112535 () Bool)

(assert (=> b!101793 m!112535))

(assert (=> b!101793 m!112481))

(declare-fun m!112537 () Bool)

(assert (=> b!101793 m!112537))

(assert (=> b!101793 m!112535))

(assert (=> b!101793 m!112279))

(assert (=> b!101793 m!112279))

(declare-fun m!112539 () Bool)

(assert (=> b!101793 m!112539))

(assert (=> bm!10602 m!112519))

(assert (=> bm!10576 d!27499))

(declare-fun d!27501 () Bool)

(declare-fun e!66268 () Bool)

(assert (=> d!27501 e!66268))

(declare-fun res!50966 () Bool)

(assert (=> d!27501 (=> (not res!50966) (not e!66268))))

(declare-fun lt!51653 () ListLongMap!1525)

(assert (=> d!27501 (= res!50966 (contains!807 lt!51653 (_1!1186 (tuple2!2351 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!51650 () List!1599)

(assert (=> d!27501 (= lt!51653 (ListLongMap!1526 lt!51650))))

(declare-fun lt!51652 () Unit!3090)

(declare-fun lt!51651 () Unit!3090)

(assert (=> d!27501 (= lt!51652 lt!51651)))

(assert (=> d!27501 (= (getValueByKey!151 lt!51650 (_1!1186 (tuple2!2351 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!156 (_2!1186 (tuple2!2351 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!27501 (= lt!51651 (lemmaContainsTupThenGetReturnValue!70 lt!51650 (_1!1186 (tuple2!2351 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1186 (tuple2!2351 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!27501 (= lt!51650 (insertStrictlySorted!73 (toList!778 call!10581) (_1!1186 (tuple2!2351 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1186 (tuple2!2351 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!27501 (= (+!131 call!10581 (tuple2!2351 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!51653)))

(declare-fun b!101809 () Bool)

(declare-fun res!50965 () Bool)

(assert (=> b!101809 (=> (not res!50965) (not e!66268))))

(assert (=> b!101809 (= res!50965 (= (getValueByKey!151 (toList!778 lt!51653) (_1!1186 (tuple2!2351 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!156 (_2!1186 (tuple2!2351 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!101810 () Bool)

(assert (=> b!101810 (= e!66268 (contains!809 (toList!778 lt!51653) (tuple2!2351 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!27501 res!50966) b!101809))

(assert (= (and b!101809 res!50965) b!101810))

(declare-fun m!112541 () Bool)

(assert (=> d!27501 m!112541))

(declare-fun m!112543 () Bool)

(assert (=> d!27501 m!112543))

(declare-fun m!112545 () Bool)

(assert (=> d!27501 m!112545))

(declare-fun m!112547 () Bool)

(assert (=> d!27501 m!112547))

(declare-fun m!112549 () Bool)

(assert (=> b!101809 m!112549))

(declare-fun m!112551 () Bool)

(assert (=> b!101810 m!112551))

(assert (=> b!101661 d!27501))

(declare-fun d!27503 () Bool)

(declare-fun lt!51656 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!106 (List!1600) (InoxSet (_ BitVec 64)))

(assert (=> d!27503 (= lt!51656 (select (content!106 Nil!1597) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!66273 () Bool)

(assert (=> d!27503 (= lt!51656 e!66273)))

(declare-fun res!50971 () Bool)

(assert (=> d!27503 (=> (not res!50971) (not e!66273))))

(assert (=> d!27503 (= res!50971 ((_ is Cons!1596) Nil!1597))))

(assert (=> d!27503 (= (contains!808 Nil!1597 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) #b00000000000000000000000000000000)) lt!51656)))

(declare-fun b!101815 () Bool)

(declare-fun e!66274 () Bool)

(assert (=> b!101815 (= e!66273 e!66274)))

(declare-fun res!50972 () Bool)

(assert (=> b!101815 (=> res!50972 e!66274)))

(assert (=> b!101815 (= res!50972 (= (h!2192 Nil!1597) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!101816 () Bool)

(assert (=> b!101816 (= e!66274 (contains!808 (t!5601 Nil!1597) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!27503 res!50971) b!101815))

(assert (= (and b!101815 (not res!50972)) b!101816))

(declare-fun m!112553 () Bool)

(assert (=> d!27503 m!112553))

(assert (=> d!27503 m!112101))

(declare-fun m!112555 () Bool)

(assert (=> d!27503 m!112555))

(assert (=> b!101816 m!112101))

(declare-fun m!112557 () Bool)

(assert (=> b!101816 m!112557))

(assert (=> b!101448 d!27503))

(assert (=> d!27423 d!27427))

(declare-fun d!27505 () Bool)

(assert (=> d!27505 (not (arrayContainsKey!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!27505 true))

(declare-fun _$68!100 () Unit!3090)

(assert (=> d!27505 (= (choose!68 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (Cons!1596 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) Nil!1597)) _$68!100)))

(declare-fun bs!4194 () Bool)

(assert (= bs!4194 d!27505))

(assert (=> bs!4194 m!111961))

(assert (=> bs!4194 m!111965))

(assert (=> d!27423 d!27505))

(declare-fun bm!10609 () Bool)

(declare-fun call!10612 () Bool)

(assert (=> bm!10609 (= call!10612 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4234 (v!2835 (underlying!340 thiss!992))) (mask!6657 (v!2835 (underlying!340 thiss!992)))))))

(declare-fun d!27507 () Bool)

(declare-fun res!50974 () Bool)

(declare-fun e!66277 () Bool)

(assert (=> d!27507 (=> res!50974 e!66277)))

(assert (=> d!27507 (= res!50974 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992))))))))

(assert (=> d!27507 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4234 (v!2835 (underlying!340 thiss!992))) (mask!6657 (v!2835 (underlying!340 thiss!992)))) e!66277)))

(declare-fun b!101817 () Bool)

(declare-fun e!66276 () Bool)

(assert (=> b!101817 (= e!66276 call!10612)))

(declare-fun b!101818 () Bool)

(declare-fun e!66275 () Bool)

(assert (=> b!101818 (= e!66275 e!66276)))

(declare-fun lt!51657 () (_ BitVec 64))

(assert (=> b!101818 (= lt!51657 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!51658 () Unit!3090)

(assert (=> b!101818 (= lt!51658 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) lt!51657 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!101818 (arrayContainsKey!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) lt!51657 #b00000000000000000000000000000000)))

(declare-fun lt!51659 () Unit!3090)

(assert (=> b!101818 (= lt!51659 lt!51658)))

(declare-fun res!50973 () Bool)

(assert (=> b!101818 (= res!50973 (= (seekEntryOrOpen!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4234 (v!2835 (underlying!340 thiss!992))) (mask!6657 (v!2835 (underlying!340 thiss!992)))) (Found!259 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!101818 (=> (not res!50973) (not e!66276))))

(declare-fun b!101819 () Bool)

(assert (=> b!101819 (= e!66275 call!10612)))

(declare-fun b!101820 () Bool)

(assert (=> b!101820 (= e!66277 e!66275)))

(declare-fun c!17527 () Bool)

(assert (=> b!101820 (= c!17527 (validKeyInArray!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!27507 (not res!50974)) b!101820))

(assert (= (and b!101820 c!17527) b!101818))

(assert (= (and b!101820 (not c!17527)) b!101819))

(assert (= (and b!101818 res!50973) b!101817))

(assert (= (or b!101817 b!101819) bm!10609))

(declare-fun m!112559 () Bool)

(assert (=> bm!10609 m!112559))

(declare-fun m!112561 () Bool)

(assert (=> b!101818 m!112561))

(declare-fun m!112563 () Bool)

(assert (=> b!101818 m!112563))

(declare-fun m!112565 () Bool)

(assert (=> b!101818 m!112565))

(assert (=> b!101818 m!112561))

(declare-fun m!112567 () Bool)

(assert (=> b!101818 m!112567))

(assert (=> b!101820 m!112561))

(assert (=> b!101820 m!112561))

(declare-fun m!112569 () Bool)

(assert (=> b!101820 m!112569))

(assert (=> bm!10494 d!27507))

(declare-fun d!27509 () Bool)

(declare-fun e!66278 () Bool)

(assert (=> d!27509 e!66278))

(declare-fun res!50976 () Bool)

(assert (=> d!27509 (=> (not res!50976) (not e!66278))))

(declare-fun lt!51663 () ListLongMap!1525)

(assert (=> d!27509 (= res!50976 (contains!807 lt!51663 (_1!1186 (ite c!17489 (ite c!17486 (tuple2!2351 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2351 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!51660 () List!1599)

(assert (=> d!27509 (= lt!51663 (ListLongMap!1526 lt!51660))))

(declare-fun lt!51662 () Unit!3090)

(declare-fun lt!51661 () Unit!3090)

(assert (=> d!27509 (= lt!51662 lt!51661)))

(assert (=> d!27509 (= (getValueByKey!151 lt!51660 (_1!1186 (ite c!17489 (ite c!17486 (tuple2!2351 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2351 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!156 (_2!1186 (ite c!17489 (ite c!17486 (tuple2!2351 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2351 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!27509 (= lt!51661 (lemmaContainsTupThenGetReturnValue!70 lt!51660 (_1!1186 (ite c!17489 (ite c!17486 (tuple2!2351 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2351 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1186 (ite c!17489 (ite c!17486 (tuple2!2351 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2351 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!27509 (= lt!51660 (insertStrictlySorted!73 (toList!778 e!66178) (_1!1186 (ite c!17489 (ite c!17486 (tuple2!2351 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2351 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1186 (ite c!17489 (ite c!17486 (tuple2!2351 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2351 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!27509 (= (+!131 e!66178 (ite c!17489 (ite c!17486 (tuple2!2351 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2351 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!51663)))

(declare-fun b!101821 () Bool)

(declare-fun res!50975 () Bool)

(assert (=> b!101821 (=> (not res!50975) (not e!66278))))

(assert (=> b!101821 (= res!50975 (= (getValueByKey!151 (toList!778 lt!51663) (_1!1186 (ite c!17489 (ite c!17486 (tuple2!2351 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2351 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!156 (_2!1186 (ite c!17489 (ite c!17486 (tuple2!2351 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2351 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!101822 () Bool)

(assert (=> b!101822 (= e!66278 (contains!809 (toList!778 lt!51663) (ite c!17489 (ite c!17486 (tuple2!2351 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2351 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!27509 res!50976) b!101821))

(assert (= (and b!101821 res!50975) b!101822))

(declare-fun m!112571 () Bool)

(assert (=> d!27509 m!112571))

(declare-fun m!112573 () Bool)

(assert (=> d!27509 m!112573))

(declare-fun m!112575 () Bool)

(assert (=> d!27509 m!112575))

(declare-fun m!112577 () Bool)

(assert (=> d!27509 m!112577))

(declare-fun m!112579 () Bool)

(assert (=> b!101821 m!112579))

(declare-fun m!112581 () Bool)

(assert (=> b!101822 m!112581))

(assert (=> bm!10571 d!27509))

(declare-fun d!27511 () Bool)

(assert (=> d!27511 (= (apply!95 lt!51415 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1308 (getValueByKey!151 (toList!778 lt!51415) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!4195 () Bool)

(assert (= bs!4195 d!27511))

(assert (=> bs!4195 m!112127))

(declare-fun m!112583 () Bool)

(assert (=> bs!4195 m!112583))

(assert (=> bs!4195 m!112583))

(declare-fun m!112585 () Bool)

(assert (=> bs!4195 m!112585))

(assert (=> b!101500 d!27511))

(declare-fun d!27513 () Bool)

(declare-fun c!17528 () Bool)

(assert (=> d!27513 (= c!17528 ((_ is ValueCellFull!980) (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!66279 () V!3177)

(assert (=> d!27513 (= (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!66279)))

(declare-fun b!101823 () Bool)

(assert (=> b!101823 (= e!66279 (get!1306 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101824 () Bool)

(assert (=> b!101824 (= e!66279 (get!1307 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!27513 c!17528) b!101823))

(assert (= (and d!27513 (not c!17528)) b!101824))

(assert (=> b!101823 m!112167))

(assert (=> b!101823 m!111981))

(declare-fun m!112587 () Bool)

(assert (=> b!101823 m!112587))

(assert (=> b!101824 m!112167))

(assert (=> b!101824 m!111981))

(declare-fun m!112589 () Bool)

(assert (=> b!101824 m!112589))

(assert (=> b!101500 d!27513))

(declare-fun b!101837 () Bool)

(declare-fun e!66286 () SeekEntryResult!259)

(assert (=> b!101837 (= e!66286 Undefined!259)))

(declare-fun b!101838 () Bool)

(declare-fun e!66288 () SeekEntryResult!259)

(declare-fun lt!51671 () SeekEntryResult!259)

(assert (=> b!101838 (= e!66288 (MissingZero!259 (index!3184 lt!51671)))))

(declare-fun b!101839 () Bool)

(declare-fun e!66287 () SeekEntryResult!259)

(assert (=> b!101839 (= e!66286 e!66287)))

(declare-fun lt!51672 () (_ BitVec 64))

(assert (=> b!101839 (= lt!51672 (select (arr!2020 (_keys!4234 newMap!16)) (index!3184 lt!51671)))))

(declare-fun c!17537 () Bool)

(assert (=> b!101839 (= c!17537 (= lt!51672 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(declare-fun b!101840 () Bool)

(assert (=> b!101840 (= e!66287 (Found!259 (index!3184 lt!51671)))))

(declare-fun b!101841 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4259 (_ BitVec 32)) SeekEntryResult!259)

(assert (=> b!101841 (= e!66288 (seekKeyOrZeroReturnVacant!0 (x!13341 lt!51671) (index!3184 lt!51671) (index!3184 lt!51671) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (_keys!4234 newMap!16) (mask!6657 newMap!16)))))

(declare-fun lt!51670 () SeekEntryResult!259)

(declare-fun d!27515 () Bool)

(assert (=> d!27515 (and (or ((_ is Undefined!259) lt!51670) (not ((_ is Found!259) lt!51670)) (and (bvsge (index!3183 lt!51670) #b00000000000000000000000000000000) (bvslt (index!3183 lt!51670) (size!2274 (_keys!4234 newMap!16))))) (or ((_ is Undefined!259) lt!51670) ((_ is Found!259) lt!51670) (not ((_ is MissingZero!259) lt!51670)) (and (bvsge (index!3182 lt!51670) #b00000000000000000000000000000000) (bvslt (index!3182 lt!51670) (size!2274 (_keys!4234 newMap!16))))) (or ((_ is Undefined!259) lt!51670) ((_ is Found!259) lt!51670) ((_ is MissingZero!259) lt!51670) (not ((_ is MissingVacant!259) lt!51670)) (and (bvsge (index!3185 lt!51670) #b00000000000000000000000000000000) (bvslt (index!3185 lt!51670) (size!2274 (_keys!4234 newMap!16))))) (or ((_ is Undefined!259) lt!51670) (ite ((_ is Found!259) lt!51670) (= (select (arr!2020 (_keys!4234 newMap!16)) (index!3183 lt!51670)) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)) (ite ((_ is MissingZero!259) lt!51670) (= (select (arr!2020 (_keys!4234 newMap!16)) (index!3182 lt!51670)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!259) lt!51670) (= (select (arr!2020 (_keys!4234 newMap!16)) (index!3185 lt!51670)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!27515 (= lt!51670 e!66286)))

(declare-fun c!17536 () Bool)

(assert (=> d!27515 (= c!17536 (and ((_ is Intermediate!259) lt!51671) (undefined!1071 lt!51671)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4259 (_ BitVec 32)) SeekEntryResult!259)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!27515 (= lt!51671 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (mask!6657 newMap!16)) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (_keys!4234 newMap!16) (mask!6657 newMap!16)))))

(assert (=> d!27515 (validMask!0 (mask!6657 newMap!16))))

(assert (=> d!27515 (= (seekEntryOrOpen!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (_keys!4234 newMap!16) (mask!6657 newMap!16)) lt!51670)))

(declare-fun b!101842 () Bool)

(declare-fun c!17535 () Bool)

(assert (=> b!101842 (= c!17535 (= lt!51672 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101842 (= e!66287 e!66288)))

(assert (= (and d!27515 c!17536) b!101837))

(assert (= (and d!27515 (not c!17536)) b!101839))

(assert (= (and b!101839 c!17537) b!101840))

(assert (= (and b!101839 (not c!17537)) b!101842))

(assert (= (and b!101842 c!17535) b!101838))

(assert (= (and b!101842 (not c!17535)) b!101841))

(declare-fun m!112591 () Bool)

(assert (=> b!101839 m!112591))

(assert (=> b!101841 m!111961))

(declare-fun m!112593 () Bool)

(assert (=> b!101841 m!112593))

(assert (=> d!27515 m!111961))

(declare-fun m!112595 () Bool)

(assert (=> d!27515 m!112595))

(declare-fun m!112597 () Bool)

(assert (=> d!27515 m!112597))

(assert (=> d!27515 m!112595))

(assert (=> d!27515 m!111961))

(declare-fun m!112599 () Bool)

(assert (=> d!27515 m!112599))

(declare-fun m!112601 () Bool)

(assert (=> d!27515 m!112601))

(declare-fun m!112603 () Bool)

(assert (=> d!27515 m!112603))

(assert (=> d!27515 m!112433))

(assert (=> b!101649 d!27515))

(assert (=> b!101662 d!27495))

(declare-fun d!27517 () Bool)

(declare-fun e!66289 () Bool)

(assert (=> d!27517 e!66289))

(declare-fun res!50977 () Bool)

(assert (=> d!27517 (=> res!50977 e!66289)))

(declare-fun lt!51675 () Bool)

(assert (=> d!27517 (= res!50977 (not lt!51675))))

(declare-fun lt!51674 () Bool)

(assert (=> d!27517 (= lt!51675 lt!51674)))

(declare-fun lt!51676 () Unit!3090)

(declare-fun e!66290 () Unit!3090)

(assert (=> d!27517 (= lt!51676 e!66290)))

(declare-fun c!17538 () Bool)

(assert (=> d!27517 (= c!17538 lt!51674)))

(assert (=> d!27517 (= lt!51674 (containsKey!155 (toList!778 lt!51415) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!27517 (= (contains!807 lt!51415 #b0000000000000000000000000000000000000000000000000000000000000000) lt!51675)))

(declare-fun b!101843 () Bool)

(declare-fun lt!51673 () Unit!3090)

(assert (=> b!101843 (= e!66290 lt!51673)))

(assert (=> b!101843 (= lt!51673 (lemmaContainsKeyImpliesGetValueByKeyDefined!104 (toList!778 lt!51415) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101843 (isDefined!105 (getValueByKey!151 (toList!778 lt!51415) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101844 () Bool)

(declare-fun Unit!3107 () Unit!3090)

(assert (=> b!101844 (= e!66290 Unit!3107)))

(declare-fun b!101845 () Bool)

(assert (=> b!101845 (= e!66289 (isDefined!105 (getValueByKey!151 (toList!778 lt!51415) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!27517 c!17538) b!101843))

(assert (= (and d!27517 (not c!17538)) b!101844))

(assert (= (and d!27517 (not res!50977)) b!101845))

(declare-fun m!112605 () Bool)

(assert (=> d!27517 m!112605))

(declare-fun m!112607 () Bool)

(assert (=> b!101843 m!112607))

(declare-fun m!112609 () Bool)

(assert (=> b!101843 m!112609))

(assert (=> b!101843 m!112609))

(declare-fun m!112611 () Bool)

(assert (=> b!101843 m!112611))

(assert (=> b!101845 m!112609))

(assert (=> b!101845 m!112609))

(assert (=> b!101845 m!112611))

(assert (=> bm!10517 d!27517))

(declare-fun d!27519 () Bool)

(declare-fun e!66291 () Bool)

(assert (=> d!27519 e!66291))

(declare-fun res!50979 () Bool)

(assert (=> d!27519 (=> (not res!50979) (not e!66291))))

(declare-fun lt!51680 () ListLongMap!1525)

(assert (=> d!27519 (= res!50979 (contains!807 lt!51680 (_1!1186 (ite (or c!17444 c!17441) (tuple2!2351 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2835 (underlying!340 thiss!992))))))))))

(declare-fun lt!51677 () List!1599)

(assert (=> d!27519 (= lt!51680 (ListLongMap!1526 lt!51677))))

(declare-fun lt!51679 () Unit!3090)

(declare-fun lt!51678 () Unit!3090)

(assert (=> d!27519 (= lt!51679 lt!51678)))

(assert (=> d!27519 (= (getValueByKey!151 lt!51677 (_1!1186 (ite (or c!17444 c!17441) (tuple2!2351 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2835 (underlying!340 thiss!992))))))) (Some!156 (_2!1186 (ite (or c!17444 c!17441) (tuple2!2351 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2835 (underlying!340 thiss!992))))))))))

(assert (=> d!27519 (= lt!51678 (lemmaContainsTupThenGetReturnValue!70 lt!51677 (_1!1186 (ite (or c!17444 c!17441) (tuple2!2351 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2835 (underlying!340 thiss!992)))))) (_2!1186 (ite (or c!17444 c!17441) (tuple2!2351 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2835 (underlying!340 thiss!992))))))))))

(assert (=> d!27519 (= lt!51677 (insertStrictlySorted!73 (toList!778 (ite c!17444 call!10517 (ite c!17441 call!10519 call!10521))) (_1!1186 (ite (or c!17444 c!17441) (tuple2!2351 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2835 (underlying!340 thiss!992)))))) (_2!1186 (ite (or c!17444 c!17441) (tuple2!2351 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2835 (underlying!340 thiss!992))))))))))

(assert (=> d!27519 (= (+!131 (ite c!17444 call!10517 (ite c!17441 call!10519 call!10521)) (ite (or c!17444 c!17441) (tuple2!2351 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2835 (underlying!340 thiss!992)))))) lt!51680)))

(declare-fun b!101846 () Bool)

(declare-fun res!50978 () Bool)

(assert (=> b!101846 (=> (not res!50978) (not e!66291))))

(assert (=> b!101846 (= res!50978 (= (getValueByKey!151 (toList!778 lt!51680) (_1!1186 (ite (or c!17444 c!17441) (tuple2!2351 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2835 (underlying!340 thiss!992))))))) (Some!156 (_2!1186 (ite (or c!17444 c!17441) (tuple2!2351 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2835 (underlying!340 thiss!992)))))))))))

(declare-fun b!101847 () Bool)

(assert (=> b!101847 (= e!66291 (contains!809 (toList!778 lt!51680) (ite (or c!17444 c!17441) (tuple2!2351 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2413 (v!2835 (underlying!340 thiss!992)))) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2835 (underlying!340 thiss!992)))))))))

(assert (= (and d!27519 res!50979) b!101846))

(assert (= (and b!101846 res!50978) b!101847))

(declare-fun m!112613 () Bool)

(assert (=> d!27519 m!112613))

(declare-fun m!112615 () Bool)

(assert (=> d!27519 m!112615))

(declare-fun m!112617 () Bool)

(assert (=> d!27519 m!112617))

(declare-fun m!112619 () Bool)

(assert (=> d!27519 m!112619))

(declare-fun m!112621 () Bool)

(assert (=> b!101846 m!112621))

(declare-fun m!112623 () Bool)

(assert (=> b!101847 m!112623))

(assert (=> bm!10513 d!27519))

(declare-fun d!27521 () Bool)

(declare-fun e!66294 () Bool)

(assert (=> d!27521 e!66294))

(declare-fun res!50984 () Bool)

(assert (=> d!27521 (=> (not res!50984) (not e!66294))))

(declare-fun lt!51686 () SeekEntryResult!259)

(assert (=> d!27521 (= res!50984 ((_ is Found!259) lt!51686))))

(assert (=> d!27521 (= lt!51686 (seekEntryOrOpen!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (_keys!4234 newMap!16) (mask!6657 newMap!16)))))

(declare-fun lt!51685 () Unit!3090)

(declare-fun choose!635 (array!4259 array!4261 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 64) Int) Unit!3090)

(assert (=> d!27521 (= lt!51685 (choose!635 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (defaultEntry!2535 newMap!16)))))

(assert (=> d!27521 (validMask!0 (mask!6657 newMap!16))))

(assert (=> d!27521 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!44 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (defaultEntry!2535 newMap!16)) lt!51685)))

(declare-fun b!101852 () Bool)

(declare-fun res!50985 () Bool)

(assert (=> b!101852 (=> (not res!50985) (not e!66294))))

(assert (=> b!101852 (= res!50985 (inRange!0 (index!3183 lt!51686) (mask!6657 newMap!16)))))

(declare-fun b!101853 () Bool)

(assert (=> b!101853 (= e!66294 (= (select (arr!2020 (_keys!4234 newMap!16)) (index!3183 lt!51686)) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(assert (=> b!101853 (and (bvsge (index!3183 lt!51686) #b00000000000000000000000000000000) (bvslt (index!3183 lt!51686) (size!2274 (_keys!4234 newMap!16))))))

(assert (= (and d!27521 res!50984) b!101852))

(assert (= (and b!101852 res!50985) b!101853))

(assert (=> d!27521 m!111961))

(assert (=> d!27521 m!112231))

(assert (=> d!27521 m!111961))

(declare-fun m!112625 () Bool)

(assert (=> d!27521 m!112625))

(assert (=> d!27521 m!112433))

(declare-fun m!112627 () Bool)

(assert (=> b!101852 m!112627))

(declare-fun m!112629 () Bool)

(assert (=> b!101853 m!112629))

(assert (=> bm!10586 d!27521))

(declare-fun b!101863 () Bool)

(declare-fun e!66300 () (_ BitVec 32))

(assert (=> b!101863 (= e!66300 #b00000000000000000000000000000000)))

(declare-fun b!101864 () Bool)

(declare-fun e!66299 () (_ BitVec 32))

(assert (=> b!101864 (= e!66300 e!66299)))

(declare-fun c!17543 () Bool)

(assert (=> b!101864 (= c!17543 (validKeyInArray!0 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!10612 () Bool)

(declare-fun call!10615 () (_ BitVec 32))

(assert (=> bm!10612 (= call!10615 (arrayCountValidKeys!0 (_keys!4234 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2274 (_keys!4234 newMap!16))))))

(declare-fun b!101865 () Bool)

(assert (=> b!101865 (= e!66299 call!10615)))

(declare-fun d!27523 () Bool)

(declare-fun lt!51689 () (_ BitVec 32))

(assert (=> d!27523 (and (bvsge lt!51689 #b00000000000000000000000000000000) (bvsle lt!51689 (bvsub (size!2274 (_keys!4234 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!27523 (= lt!51689 e!66300)))

(declare-fun c!17544 () Bool)

(assert (=> d!27523 (= c!17544 (bvsge #b00000000000000000000000000000000 (size!2274 (_keys!4234 newMap!16))))))

(assert (=> d!27523 (and (bvsle #b00000000000000000000000000000000 (size!2274 (_keys!4234 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2274 (_keys!4234 newMap!16)) (size!2274 (_keys!4234 newMap!16))))))

(assert (=> d!27523 (= (arrayCountValidKeys!0 (_keys!4234 newMap!16) #b00000000000000000000000000000000 (size!2274 (_keys!4234 newMap!16))) lt!51689)))

(declare-fun b!101862 () Bool)

(assert (=> b!101862 (= e!66299 (bvadd #b00000000000000000000000000000001 call!10615))))

(assert (= (and d!27523 c!17544) b!101863))

(assert (= (and d!27523 (not c!17544)) b!101864))

(assert (= (and b!101864 c!17543) b!101862))

(assert (= (and b!101864 (not c!17543)) b!101865))

(assert (= (or b!101862 b!101865) bm!10612))

(assert (=> b!101864 m!112279))

(assert (=> b!101864 m!112279))

(assert (=> b!101864 m!112445))

(declare-fun m!112631 () Bool)

(assert (=> bm!10612 m!112631))

(assert (=> b!101680 d!27523))

(declare-fun d!27525 () Bool)

(declare-fun res!50986 () Bool)

(declare-fun e!66301 () Bool)

(assert (=> d!27525 (=> res!50986 e!66301)))

(assert (=> d!27525 (= res!50986 (= (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(assert (=> d!27525 (= (arrayContainsKey!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!66301)))

(declare-fun b!101866 () Bool)

(declare-fun e!66302 () Bool)

(assert (=> b!101866 (= e!66301 e!66302)))

(declare-fun res!50987 () Bool)

(assert (=> b!101866 (=> (not res!50987) (not e!66302))))

(assert (=> b!101866 (= res!50987 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992))))))))

(declare-fun b!101867 () Bool)

(assert (=> b!101867 (= e!66302 (arrayContainsKey!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!27525 (not res!50986)) b!101866))

(assert (= (and b!101866 res!50987) b!101867))

(declare-fun m!112633 () Bool)

(assert (=> d!27525 m!112633))

(assert (=> b!101867 m!111961))

(declare-fun m!112635 () Bool)

(assert (=> b!101867 m!112635))

(assert (=> b!101521 d!27525))

(declare-fun d!27527 () Bool)

(assert (=> d!27527 (arrayContainsKey!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) lt!51362 #b00000000000000000000000000000000)))

(declare-fun lt!51692 () Unit!3090)

(declare-fun choose!13 (array!4259 (_ BitVec 64) (_ BitVec 32)) Unit!3090)

(assert (=> d!27527 (= lt!51692 (choose!13 (_keys!4234 (v!2835 (underlying!340 thiss!992))) lt!51362 #b00000000000000000000000000000000))))

(assert (=> d!27527 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!27527 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) lt!51362 #b00000000000000000000000000000000) lt!51692)))

(declare-fun bs!4196 () Bool)

(assert (= bs!4196 d!27527))

(assert (=> bs!4196 m!112105))

(declare-fun m!112637 () Bool)

(assert (=> bs!4196 m!112637))

(assert (=> b!101435 d!27527))

(declare-fun d!27529 () Bool)

(declare-fun res!50988 () Bool)

(declare-fun e!66303 () Bool)

(assert (=> d!27529 (=> res!50988 e!66303)))

(assert (=> d!27529 (= res!50988 (= (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) #b00000000000000000000000000000000) lt!51362))))

(assert (=> d!27529 (= (arrayContainsKey!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) lt!51362 #b00000000000000000000000000000000) e!66303)))

(declare-fun b!101868 () Bool)

(declare-fun e!66304 () Bool)

(assert (=> b!101868 (= e!66303 e!66304)))

(declare-fun res!50989 () Bool)

(assert (=> b!101868 (=> (not res!50989) (not e!66304))))

(assert (=> b!101868 (= res!50989 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992))))))))

(declare-fun b!101869 () Bool)

(assert (=> b!101869 (= e!66304 (arrayContainsKey!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) lt!51362 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!27529 (not res!50988)) b!101868))

(assert (= (and b!101868 res!50989) b!101869))

(assert (=> d!27529 m!112101))

(declare-fun m!112639 () Bool)

(assert (=> b!101869 m!112639))

(assert (=> b!101435 d!27529))

(declare-fun b!101870 () Bool)

(declare-fun e!66305 () SeekEntryResult!259)

(assert (=> b!101870 (= e!66305 Undefined!259)))

(declare-fun b!101871 () Bool)

(declare-fun e!66307 () SeekEntryResult!259)

(declare-fun lt!51694 () SeekEntryResult!259)

(assert (=> b!101871 (= e!66307 (MissingZero!259 (index!3184 lt!51694)))))

(declare-fun b!101872 () Bool)

(declare-fun e!66306 () SeekEntryResult!259)

(assert (=> b!101872 (= e!66305 e!66306)))

(declare-fun lt!51695 () (_ BitVec 64))

(assert (=> b!101872 (= lt!51695 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (index!3184 lt!51694)))))

(declare-fun c!17547 () Bool)

(assert (=> b!101872 (= c!17547 (= lt!51695 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!101873 () Bool)

(assert (=> b!101873 (= e!66306 (Found!259 (index!3184 lt!51694)))))

(declare-fun b!101874 () Bool)

(assert (=> b!101874 (= e!66307 (seekKeyOrZeroReturnVacant!0 (x!13341 lt!51694) (index!3184 lt!51694) (index!3184 lt!51694) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) #b00000000000000000000000000000000) (_keys!4234 (v!2835 (underlying!340 thiss!992))) (mask!6657 (v!2835 (underlying!340 thiss!992)))))))

(declare-fun d!27531 () Bool)

(declare-fun lt!51693 () SeekEntryResult!259)

(assert (=> d!27531 (and (or ((_ is Undefined!259) lt!51693) (not ((_ is Found!259) lt!51693)) (and (bvsge (index!3183 lt!51693) #b00000000000000000000000000000000) (bvslt (index!3183 lt!51693) (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992))))))) (or ((_ is Undefined!259) lt!51693) ((_ is Found!259) lt!51693) (not ((_ is MissingZero!259) lt!51693)) (and (bvsge (index!3182 lt!51693) #b00000000000000000000000000000000) (bvslt (index!3182 lt!51693) (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992))))))) (or ((_ is Undefined!259) lt!51693) ((_ is Found!259) lt!51693) ((_ is MissingZero!259) lt!51693) (not ((_ is MissingVacant!259) lt!51693)) (and (bvsge (index!3185 lt!51693) #b00000000000000000000000000000000) (bvslt (index!3185 lt!51693) (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992))))))) (or ((_ is Undefined!259) lt!51693) (ite ((_ is Found!259) lt!51693) (= (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (index!3183 lt!51693)) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!259) lt!51693) (= (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (index!3182 lt!51693)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!259) lt!51693) (= (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (index!3185 lt!51693)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!27531 (= lt!51693 e!66305)))

(declare-fun c!17546 () Bool)

(assert (=> d!27531 (= c!17546 (and ((_ is Intermediate!259) lt!51694) (undefined!1071 lt!51694)))))

(assert (=> d!27531 (= lt!51694 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) #b00000000000000000000000000000000) (mask!6657 (v!2835 (underlying!340 thiss!992)))) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) #b00000000000000000000000000000000) (_keys!4234 (v!2835 (underlying!340 thiss!992))) (mask!6657 (v!2835 (underlying!340 thiss!992)))))))

(assert (=> d!27531 (validMask!0 (mask!6657 (v!2835 (underlying!340 thiss!992))))))

(assert (=> d!27531 (= (seekEntryOrOpen!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) #b00000000000000000000000000000000) (_keys!4234 (v!2835 (underlying!340 thiss!992))) (mask!6657 (v!2835 (underlying!340 thiss!992)))) lt!51693)))

(declare-fun b!101875 () Bool)

(declare-fun c!17545 () Bool)

(assert (=> b!101875 (= c!17545 (= lt!51695 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101875 (= e!66306 e!66307)))

(assert (= (and d!27531 c!17546) b!101870))

(assert (= (and d!27531 (not c!17546)) b!101872))

(assert (= (and b!101872 c!17547) b!101873))

(assert (= (and b!101872 (not c!17547)) b!101875))

(assert (= (and b!101875 c!17545) b!101871))

(assert (= (and b!101875 (not c!17545)) b!101874))

(declare-fun m!112641 () Bool)

(assert (=> b!101872 m!112641))

(assert (=> b!101874 m!112101))

(declare-fun m!112643 () Bool)

(assert (=> b!101874 m!112643))

(assert (=> d!27531 m!112101))

(declare-fun m!112645 () Bool)

(assert (=> d!27531 m!112645))

(declare-fun m!112647 () Bool)

(assert (=> d!27531 m!112647))

(assert (=> d!27531 m!112645))

(assert (=> d!27531 m!112101))

(declare-fun m!112649 () Bool)

(assert (=> d!27531 m!112649))

(declare-fun m!112651 () Bool)

(assert (=> d!27531 m!112651))

(declare-fun m!112653 () Bool)

(assert (=> d!27531 m!112653))

(assert (=> d!27531 m!111987))

(assert (=> b!101435 d!27531))

(declare-fun b!101876 () Bool)

(declare-fun e!66309 () Bool)

(assert (=> b!101876 (= e!66309 (contains!808 (ite c!17428 (Cons!1596 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) #b00000000000000000000000000000000) Nil!1597) Nil!1597) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!101877 () Bool)

(declare-fun e!66310 () Bool)

(declare-fun e!66308 () Bool)

(assert (=> b!101877 (= e!66310 e!66308)))

(declare-fun res!50990 () Bool)

(assert (=> b!101877 (=> (not res!50990) (not e!66308))))

(assert (=> b!101877 (= res!50990 (not e!66309))))

(declare-fun res!50992 () Bool)

(assert (=> b!101877 (=> (not res!50992) (not e!66309))))

(assert (=> b!101877 (= res!50992 (validKeyInArray!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!101878 () Bool)

(declare-fun e!66311 () Bool)

(declare-fun call!10616 () Bool)

(assert (=> b!101878 (= e!66311 call!10616)))

(declare-fun b!101879 () Bool)

(assert (=> b!101879 (= e!66308 e!66311)))

(declare-fun c!17548 () Bool)

(assert (=> b!101879 (= c!17548 (validKeyInArray!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!10613 () Bool)

(assert (=> bm!10613 (= call!10616 (arrayNoDuplicates!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!17548 (Cons!1596 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!17428 (Cons!1596 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) #b00000000000000000000000000000000) Nil!1597) Nil!1597)) (ite c!17428 (Cons!1596 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) #b00000000000000000000000000000000) Nil!1597) Nil!1597))))))

(declare-fun d!27533 () Bool)

(declare-fun res!50991 () Bool)

(assert (=> d!27533 (=> res!50991 e!66310)))

(assert (=> d!27533 (= res!50991 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992))))))))

(assert (=> d!27533 (= (arrayNoDuplicates!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!17428 (Cons!1596 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) #b00000000000000000000000000000000) Nil!1597) Nil!1597)) e!66310)))

(declare-fun b!101880 () Bool)

(assert (=> b!101880 (= e!66311 call!10616)))

(assert (= (and d!27533 (not res!50991)) b!101877))

(assert (= (and b!101877 res!50992) b!101876))

(assert (= (and b!101877 res!50990) b!101879))

(assert (= (and b!101879 c!17548) b!101880))

(assert (= (and b!101879 (not c!17548)) b!101878))

(assert (= (or b!101880 b!101878) bm!10613))

(assert (=> b!101876 m!112561))

(assert (=> b!101876 m!112561))

(declare-fun m!112655 () Bool)

(assert (=> b!101876 m!112655))

(assert (=> b!101877 m!112561))

(assert (=> b!101877 m!112561))

(assert (=> b!101877 m!112569))

(assert (=> b!101879 m!112561))

(assert (=> b!101879 m!112561))

(assert (=> b!101879 m!112569))

(assert (=> bm!10613 m!112561))

(declare-fun m!112657 () Bool)

(assert (=> bm!10613 m!112657))

(assert (=> bm!10497 d!27533))

(declare-fun b!101881 () Bool)

(declare-fun e!66313 () Bool)

(assert (=> b!101881 (= e!66313 (contains!808 Nil!1597 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101882 () Bool)

(declare-fun e!66314 () Bool)

(declare-fun e!66312 () Bool)

(assert (=> b!101882 (= e!66314 e!66312)))

(declare-fun res!50993 () Bool)

(assert (=> b!101882 (=> (not res!50993) (not e!66312))))

(assert (=> b!101882 (= res!50993 (not e!66313))))

(declare-fun res!50995 () Bool)

(assert (=> b!101882 (=> (not res!50995) (not e!66313))))

(assert (=> b!101882 (= res!50995 (validKeyInArray!0 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101883 () Bool)

(declare-fun e!66315 () Bool)

(declare-fun call!10617 () Bool)

(assert (=> b!101883 (= e!66315 call!10617)))

(declare-fun b!101884 () Bool)

(assert (=> b!101884 (= e!66312 e!66315)))

(declare-fun c!17549 () Bool)

(assert (=> b!101884 (= c!17549 (validKeyInArray!0 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!10614 () Bool)

(assert (=> bm!10614 (= call!10617 (arrayNoDuplicates!0 (_keys!4234 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!17549 (Cons!1596 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000) Nil!1597) Nil!1597)))))

(declare-fun d!27535 () Bool)

(declare-fun res!50994 () Bool)

(assert (=> d!27535 (=> res!50994 e!66314)))

(assert (=> d!27535 (= res!50994 (bvsge #b00000000000000000000000000000000 (size!2274 (_keys!4234 newMap!16))))))

(assert (=> d!27535 (= (arrayNoDuplicates!0 (_keys!4234 newMap!16) #b00000000000000000000000000000000 Nil!1597) e!66314)))

(declare-fun b!101885 () Bool)

(assert (=> b!101885 (= e!66315 call!10617)))

(assert (= (and d!27535 (not res!50994)) b!101882))

(assert (= (and b!101882 res!50995) b!101881))

(assert (= (and b!101882 res!50993) b!101884))

(assert (= (and b!101884 c!17549) b!101885))

(assert (= (and b!101884 (not c!17549)) b!101883))

(assert (= (or b!101885 b!101883) bm!10614))

(assert (=> b!101881 m!112279))

(assert (=> b!101881 m!112279))

(declare-fun m!112659 () Bool)

(assert (=> b!101881 m!112659))

(assert (=> b!101882 m!112279))

(assert (=> b!101882 m!112279))

(assert (=> b!101882 m!112445))

(assert (=> b!101884 m!112279))

(assert (=> b!101884 m!112279))

(assert (=> b!101884 m!112445))

(assert (=> bm!10614 m!112279))

(declare-fun m!112661 () Bool)

(assert (=> bm!10614 m!112661))

(assert (=> b!101682 d!27535))

(assert (=> bm!10581 d!27515))

(declare-fun d!27537 () Bool)

(declare-fun res!50996 () Bool)

(declare-fun e!66316 () Bool)

(assert (=> d!27537 (=> (not res!50996) (not e!66316))))

(assert (=> d!27537 (= res!50996 (simpleValid!71 (v!2835 (underlying!340 thiss!992))))))

(assert (=> d!27537 (= (valid!403 (v!2835 (underlying!340 thiss!992))) e!66316)))

(declare-fun b!101886 () Bool)

(declare-fun res!50997 () Bool)

(assert (=> b!101886 (=> (not res!50997) (not e!66316))))

(assert (=> b!101886 (= res!50997 (= (arrayCountValidKeys!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000000000000 (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992))))) (_size!483 (v!2835 (underlying!340 thiss!992)))))))

(declare-fun b!101887 () Bool)

(declare-fun res!50998 () Bool)

(assert (=> b!101887 (=> (not res!50998) (not e!66316))))

(assert (=> b!101887 (= res!50998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (mask!6657 (v!2835 (underlying!340 thiss!992)))))))

(declare-fun b!101888 () Bool)

(assert (=> b!101888 (= e!66316 (arrayNoDuplicates!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000000000000 Nil!1597))))

(assert (= (and d!27537 res!50996) b!101886))

(assert (= (and b!101886 res!50997) b!101887))

(assert (= (and b!101887 res!50998) b!101888))

(declare-fun m!112663 () Bool)

(assert (=> d!27537 m!112663))

(declare-fun m!112665 () Bool)

(assert (=> b!101886 m!112665))

(assert (=> b!101887 m!112001))

(assert (=> b!101888 m!111969))

(assert (=> d!27437 d!27537))

(declare-fun d!27539 () Bool)

(assert (=> d!27539 (= (validKeyInArray!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101437 d!27539))

(declare-fun d!27541 () Bool)

(declare-fun e!66319 () Bool)

(assert (=> d!27541 e!66319))

(declare-fun c!17552 () Bool)

(assert (=> d!27541 (= c!17552 (and (not (= (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!27541 true))

(declare-fun _$29!135 () Unit!3090)

(assert (=> d!27541 (= (choose!632 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (_values!2518 (v!2835 (underlying!340 thiss!992))) (mask!6657 (v!2835 (underlying!340 thiss!992))) (extraKeys!2346 (v!2835 (underlying!340 thiss!992))) (zeroValue!2413 (v!2835 (underlying!340 thiss!992))) (minValue!2413 (v!2835 (underlying!340 thiss!992))) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2535 (v!2835 (underlying!340 thiss!992)))) _$29!135)))

(declare-fun b!101893 () Bool)

(assert (=> b!101893 (= e!66319 (arrayContainsKey!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!101894 () Bool)

(assert (=> b!101894 (= e!66319 (ite (= (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2346 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2346 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!27541 c!17552) b!101893))

(assert (= (and d!27541 (not c!17552)) b!101894))

(assert (=> b!101893 m!111961))

(assert (=> b!101893 m!111965))

(assert (=> d!27429 d!27541))

(assert (=> d!27429 d!27413))

(declare-fun d!27543 () Bool)

(assert (=> d!27543 (= (+!131 (getCurrentListMap!457 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)) (tuple2!2351 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!457 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) lt!51524 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51698 () Unit!3090)

(declare-fun choose!636 (array!4259 array!4261 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 V!3177 Int) Unit!3090)

(assert (=> d!27543 (= lt!51698 (choose!636 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) lt!51524 (zeroValue!2413 newMap!16) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2413 newMap!16) (defaultEntry!2535 newMap!16)))))

(assert (=> d!27543 (validMask!0 (mask!6657 newMap!16))))

(assert (=> d!27543 (= (lemmaChangeZeroKeyThenAddPairToListMap!44 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) lt!51524 (zeroValue!2413 newMap!16) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2413 newMap!16) (defaultEntry!2535 newMap!16)) lt!51698)))

(declare-fun bs!4197 () Bool)

(assert (= bs!4197 d!27543))

(assert (=> bs!4197 m!111983))

(declare-fun m!112667 () Bool)

(assert (=> bs!4197 m!112667))

(assert (=> bs!4197 m!112115))

(declare-fun m!112669 () Bool)

(assert (=> bs!4197 m!112669))

(assert (=> bs!4197 m!112433))

(assert (=> bs!4197 m!112115))

(assert (=> bs!4197 m!111983))

(declare-fun m!112671 () Bool)

(assert (=> bs!4197 m!112671))

(assert (=> b!101640 d!27543))

(declare-fun d!27545 () Bool)

(declare-fun res!51003 () Bool)

(declare-fun e!66324 () Bool)

(assert (=> d!27545 (=> res!51003 e!66324)))

(assert (=> d!27545 (= res!51003 (and ((_ is Cons!1595) (toList!778 lt!51312)) (= (_1!1186 (h!2191 (toList!778 lt!51312))) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355))))))

(assert (=> d!27545 (= (containsKey!155 (toList!778 lt!51312) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)) e!66324)))

(declare-fun b!101899 () Bool)

(declare-fun e!66325 () Bool)

(assert (=> b!101899 (= e!66324 e!66325)))

(declare-fun res!51004 () Bool)

(assert (=> b!101899 (=> (not res!51004) (not e!66325))))

(assert (=> b!101899 (= res!51004 (and (or (not ((_ is Cons!1595) (toList!778 lt!51312))) (bvsle (_1!1186 (h!2191 (toList!778 lt!51312))) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355))) ((_ is Cons!1595) (toList!778 lt!51312)) (bvslt (_1!1186 (h!2191 (toList!778 lt!51312))) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355))))))

(declare-fun b!101900 () Bool)

(assert (=> b!101900 (= e!66325 (containsKey!155 (t!5600 (toList!778 lt!51312)) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(assert (= (and d!27545 (not res!51003)) b!101899))

(assert (= (and b!101899 res!51004) b!101900))

(assert (=> b!101900 m!111961))

(declare-fun m!112673 () Bool)

(assert (=> b!101900 m!112673))

(assert (=> d!27439 d!27545))

(declare-fun b!101917 () Bool)

(declare-fun e!66335 () Bool)

(declare-fun lt!51704 () SeekEntryResult!259)

(assert (=> b!101917 (= e!66335 ((_ is Undefined!259) lt!51704))))

(declare-fun b!101918 () Bool)

(declare-fun e!66337 () Bool)

(declare-fun e!66336 () Bool)

(assert (=> b!101918 (= e!66337 e!66336)))

(declare-fun res!51016 () Bool)

(declare-fun call!10623 () Bool)

(assert (=> b!101918 (= res!51016 call!10623)))

(assert (=> b!101918 (=> (not res!51016) (not e!66336))))

(declare-fun d!27547 () Bool)

(assert (=> d!27547 e!66337))

(declare-fun c!17558 () Bool)

(assert (=> d!27547 (= c!17558 ((_ is MissingZero!259) lt!51704))))

(assert (=> d!27547 (= lt!51704 (seekEntryOrOpen!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (_keys!4234 newMap!16) (mask!6657 newMap!16)))))

(declare-fun lt!51703 () Unit!3090)

(declare-fun choose!637 (array!4259 array!4261 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 64) Int) Unit!3090)

(assert (=> d!27547 (= lt!51703 (choose!637 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (defaultEntry!2535 newMap!16)))))

(assert (=> d!27547 (validMask!0 (mask!6657 newMap!16))))

(assert (=> d!27547 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!44 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (defaultEntry!2535 newMap!16)) lt!51703)))

(declare-fun b!101919 () Bool)

(assert (=> b!101919 (= e!66337 e!66335)))

(declare-fun c!17557 () Bool)

(assert (=> b!101919 (= c!17557 ((_ is MissingVacant!259) lt!51704))))

(declare-fun bm!10619 () Bool)

(assert (=> bm!10619 (= call!10623 (inRange!0 (ite c!17558 (index!3182 lt!51704) (index!3185 lt!51704)) (mask!6657 newMap!16)))))

(declare-fun b!101920 () Bool)

(assert (=> b!101920 (and (bvsge (index!3182 lt!51704) #b00000000000000000000000000000000) (bvslt (index!3182 lt!51704) (size!2274 (_keys!4234 newMap!16))))))

(declare-fun res!51015 () Bool)

(assert (=> b!101920 (= res!51015 (= (select (arr!2020 (_keys!4234 newMap!16)) (index!3182 lt!51704)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101920 (=> (not res!51015) (not e!66336))))

(declare-fun b!101921 () Bool)

(declare-fun res!51014 () Bool)

(declare-fun e!66334 () Bool)

(assert (=> b!101921 (=> (not res!51014) (not e!66334))))

(assert (=> b!101921 (= res!51014 call!10623)))

(assert (=> b!101921 (= e!66335 e!66334)))

(declare-fun bm!10620 () Bool)

(declare-fun call!10622 () Bool)

(assert (=> bm!10620 (= call!10622 (arrayContainsKey!0 (_keys!4234 newMap!16) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!101922 () Bool)

(assert (=> b!101922 (= e!66334 (not call!10622))))

(declare-fun b!101923 () Bool)

(assert (=> b!101923 (= e!66336 (not call!10622))))

(declare-fun b!101924 () Bool)

(declare-fun res!51013 () Bool)

(assert (=> b!101924 (=> (not res!51013) (not e!66334))))

(assert (=> b!101924 (= res!51013 (= (select (arr!2020 (_keys!4234 newMap!16)) (index!3185 lt!51704)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101924 (and (bvsge (index!3185 lt!51704) #b00000000000000000000000000000000) (bvslt (index!3185 lt!51704) (size!2274 (_keys!4234 newMap!16))))))

(assert (= (and d!27547 c!17558) b!101918))

(assert (= (and d!27547 (not c!17558)) b!101919))

(assert (= (and b!101918 res!51016) b!101920))

(assert (= (and b!101920 res!51015) b!101923))

(assert (= (and b!101919 c!17557) b!101921))

(assert (= (and b!101919 (not c!17557)) b!101917))

(assert (= (and b!101921 res!51014) b!101924))

(assert (= (and b!101924 res!51013) b!101922))

(assert (= (or b!101918 b!101921) bm!10619))

(assert (= (or b!101923 b!101922) bm!10620))

(declare-fun m!112675 () Bool)

(assert (=> b!101920 m!112675))

(assert (=> d!27547 m!111961))

(assert (=> d!27547 m!112231))

(assert (=> d!27547 m!111961))

(declare-fun m!112677 () Bool)

(assert (=> d!27547 m!112677))

(assert (=> d!27547 m!112433))

(declare-fun m!112679 () Bool)

(assert (=> b!101924 m!112679))

(declare-fun m!112681 () Bool)

(assert (=> bm!10619 m!112681))

(assert (=> bm!10620 m!111961))

(assert (=> bm!10620 m!112237))

(assert (=> bm!10582 d!27547))

(declare-fun b!101925 () Bool)

(declare-fun e!66339 () Bool)

(assert (=> b!101925 (= e!66339 (contains!808 (ite c!17450 (Cons!1596 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) Nil!1597) Nil!1597) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!101926 () Bool)

(declare-fun e!66340 () Bool)

(declare-fun e!66338 () Bool)

(assert (=> b!101926 (= e!66340 e!66338)))

(declare-fun res!51017 () Bool)

(assert (=> b!101926 (=> (not res!51017) (not e!66338))))

(assert (=> b!101926 (= res!51017 (not e!66339))))

(declare-fun res!51019 () Bool)

(assert (=> b!101926 (=> (not res!51019) (not e!66339))))

(assert (=> b!101926 (= res!51019 (validKeyInArray!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!101927 () Bool)

(declare-fun e!66341 () Bool)

(declare-fun call!10624 () Bool)

(assert (=> b!101927 (= e!66341 call!10624)))

(declare-fun b!101928 () Bool)

(assert (=> b!101928 (= e!66338 e!66341)))

(declare-fun c!17559 () Bool)

(assert (=> b!101928 (= c!17559 (validKeyInArray!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun bm!10621 () Bool)

(assert (=> bm!10621 (= call!10624 (arrayNoDuplicates!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!17559 (Cons!1596 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!17450 (Cons!1596 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) Nil!1597) Nil!1597)) (ite c!17450 (Cons!1596 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) Nil!1597) Nil!1597))))))

(declare-fun d!27549 () Bool)

(declare-fun res!51018 () Bool)

(assert (=> d!27549 (=> res!51018 e!66340)))

(assert (=> d!27549 (= res!51018 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2274 (_keys!4234 (v!2835 (underlying!340 thiss!992))))))))

(assert (=> d!27549 (= (arrayNoDuplicates!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!17450 (Cons!1596 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) Nil!1597) Nil!1597)) e!66340)))

(declare-fun b!101929 () Bool)

(assert (=> b!101929 (= e!66341 call!10624)))

(assert (= (and d!27549 (not res!51018)) b!101926))

(assert (= (and b!101926 res!51019) b!101925))

(assert (= (and b!101926 res!51017) b!101928))

(assert (= (and b!101928 c!17559) b!101929))

(assert (= (and b!101928 (not c!17559)) b!101927))

(assert (= (or b!101929 b!101927) bm!10621))

(declare-fun m!112683 () Bool)

(assert (=> b!101925 m!112683))

(assert (=> b!101925 m!112683))

(declare-fun m!112685 () Bool)

(assert (=> b!101925 m!112685))

(assert (=> b!101926 m!112683))

(assert (=> b!101926 m!112683))

(declare-fun m!112687 () Bool)

(assert (=> b!101926 m!112687))

(assert (=> b!101928 m!112683))

(assert (=> b!101928 m!112683))

(assert (=> b!101928 m!112687))

(assert (=> bm!10621 m!112683))

(declare-fun m!112689 () Bool)

(assert (=> bm!10621 m!112689))

(assert (=> bm!10519 d!27549))

(declare-fun d!27551 () Bool)

(declare-fun e!66342 () Bool)

(assert (=> d!27551 e!66342))

(declare-fun res!51020 () Bool)

(assert (=> d!27551 (=> res!51020 e!66342)))

(declare-fun lt!51707 () Bool)

(assert (=> d!27551 (= res!51020 (not lt!51707))))

(declare-fun lt!51706 () Bool)

(assert (=> d!27551 (= lt!51707 lt!51706)))

(declare-fun lt!51708 () Unit!3090)

(declare-fun e!66343 () Unit!3090)

(assert (=> d!27551 (= lt!51708 e!66343)))

(declare-fun c!17560 () Bool)

(assert (=> d!27551 (= c!17560 lt!51706)))

(assert (=> d!27551 (= lt!51706 (containsKey!155 (toList!778 call!10576) (select (arr!2020 (_keys!4234 newMap!16)) (index!3183 lt!51518))))))

(assert (=> d!27551 (= (contains!807 call!10576 (select (arr!2020 (_keys!4234 newMap!16)) (index!3183 lt!51518))) lt!51707)))

(declare-fun b!101930 () Bool)

(declare-fun lt!51705 () Unit!3090)

(assert (=> b!101930 (= e!66343 lt!51705)))

(assert (=> b!101930 (= lt!51705 (lemmaContainsKeyImpliesGetValueByKeyDefined!104 (toList!778 call!10576) (select (arr!2020 (_keys!4234 newMap!16)) (index!3183 lt!51518))))))

(assert (=> b!101930 (isDefined!105 (getValueByKey!151 (toList!778 call!10576) (select (arr!2020 (_keys!4234 newMap!16)) (index!3183 lt!51518))))))

(declare-fun b!101931 () Bool)

(declare-fun Unit!3108 () Unit!3090)

(assert (=> b!101931 (= e!66343 Unit!3108)))

(declare-fun b!101932 () Bool)

(assert (=> b!101932 (= e!66342 (isDefined!105 (getValueByKey!151 (toList!778 call!10576) (select (arr!2020 (_keys!4234 newMap!16)) (index!3183 lt!51518)))))))

(assert (= (and d!27551 c!17560) b!101930))

(assert (= (and d!27551 (not c!17560)) b!101931))

(assert (= (and d!27551 (not res!51020)) b!101932))

(assert (=> d!27551 m!112215))

(declare-fun m!112691 () Bool)

(assert (=> d!27551 m!112691))

(assert (=> b!101930 m!112215))

(declare-fun m!112693 () Bool)

(assert (=> b!101930 m!112693))

(assert (=> b!101930 m!112215))

(declare-fun m!112695 () Bool)

(assert (=> b!101930 m!112695))

(assert (=> b!101930 m!112695))

(declare-fun m!112697 () Bool)

(assert (=> b!101930 m!112697))

(assert (=> b!101932 m!112215))

(assert (=> b!101932 m!112695))

(assert (=> b!101932 m!112695))

(assert (=> b!101932 m!112697))

(assert (=> b!101656 d!27551))

(declare-fun d!27553 () Bool)

(declare-fun e!66346 () Bool)

(assert (=> d!27553 e!66346))

(declare-fun res!51023 () Bool)

(assert (=> d!27553 (=> (not res!51023) (not e!66346))))

(assert (=> d!27553 (= res!51023 (and (bvsge (index!3183 lt!51518) #b00000000000000000000000000000000) (bvslt (index!3183 lt!51518) (size!2274 (_keys!4234 newMap!16)))))))

(declare-fun lt!51711 () Unit!3090)

(declare-fun choose!638 (array!4259 array!4261 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 32) Int) Unit!3090)

(assert (=> d!27553 (= lt!51711 (choose!638 (_keys!4234 newMap!16) lt!51507 (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (index!3183 lt!51518) (defaultEntry!2535 newMap!16)))))

(assert (=> d!27553 (validMask!0 (mask!6657 newMap!16))))

(assert (=> d!27553 (= (lemmaValidKeyInArrayIsInListMap!103 (_keys!4234 newMap!16) lt!51507 (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (index!3183 lt!51518) (defaultEntry!2535 newMap!16)) lt!51711)))

(declare-fun b!101935 () Bool)

(assert (=> b!101935 (= e!66346 (contains!807 (getCurrentListMap!457 (_keys!4234 newMap!16) lt!51507 (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)) (select (arr!2020 (_keys!4234 newMap!16)) (index!3183 lt!51518))))))

(assert (= (and d!27553 res!51023) b!101935))

(declare-fun m!112699 () Bool)

(assert (=> d!27553 m!112699))

(assert (=> d!27553 m!112433))

(declare-fun m!112701 () Bool)

(assert (=> b!101935 m!112701))

(assert (=> b!101935 m!112215))

(assert (=> b!101935 m!112701))

(assert (=> b!101935 m!112215))

(declare-fun m!112703 () Bool)

(assert (=> b!101935 m!112703))

(assert (=> b!101656 d!27553))

(declare-fun d!27555 () Bool)

(declare-fun e!66349 () Bool)

(assert (=> d!27555 e!66349))

(declare-fun res!51026 () Bool)

(assert (=> d!27555 (=> (not res!51026) (not e!66349))))

(assert (=> d!27555 (= res!51026 (and (bvsge (index!3183 lt!51518) #b00000000000000000000000000000000) (bvslt (index!3183 lt!51518) (size!2275 (_values!2518 newMap!16)))))))

(declare-fun lt!51714 () Unit!3090)

(declare-fun choose!639 (array!4259 array!4261 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 32) (_ BitVec 64) V!3177 Int) Unit!3090)

(assert (=> d!27555 (= lt!51714 (choose!639 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (index!3183 lt!51518) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2535 newMap!16)))))

(assert (=> d!27555 (validMask!0 (mask!6657 newMap!16))))

(assert (=> d!27555 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!44 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (index!3183 lt!51518) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2535 newMap!16)) lt!51714)))

(declare-fun b!101938 () Bool)

(assert (=> b!101938 (= e!66349 (= (+!131 (getCurrentListMap!457 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)) (tuple2!2351 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!457 (_keys!4234 newMap!16) (array!4262 (store (arr!2021 (_values!2518 newMap!16)) (index!3183 lt!51518) (ValueCellFull!980 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2275 (_values!2518 newMap!16))) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16))))))

(assert (= (and d!27555 res!51026) b!101938))

(assert (=> d!27555 m!111961))

(assert (=> d!27555 m!111983))

(declare-fun m!112705 () Bool)

(assert (=> d!27555 m!112705))

(assert (=> d!27555 m!112433))

(assert (=> b!101938 m!112115))

(assert (=> b!101938 m!112115))

(declare-fun m!112707 () Bool)

(assert (=> b!101938 m!112707))

(assert (=> b!101938 m!112213))

(declare-fun m!112709 () Bool)

(assert (=> b!101938 m!112709))

(assert (=> b!101656 d!27555))

(declare-fun d!27557 () Bool)

(declare-fun lt!51715 () Bool)

(assert (=> d!27557 (= lt!51715 (select (content!106 Nil!1597) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(declare-fun e!66350 () Bool)

(assert (=> d!27557 (= lt!51715 e!66350)))

(declare-fun res!51027 () Bool)

(assert (=> d!27557 (=> (not res!51027) (not e!66350))))

(assert (=> d!27557 (= res!51027 ((_ is Cons!1596) Nil!1597))))

(assert (=> d!27557 (= (contains!808 Nil!1597 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)) lt!51715)))

(declare-fun b!101939 () Bool)

(declare-fun e!66351 () Bool)

(assert (=> b!101939 (= e!66350 e!66351)))

(declare-fun res!51028 () Bool)

(assert (=> b!101939 (=> res!51028 e!66351)))

(assert (=> b!101939 (= res!51028 (= (h!2192 Nil!1597) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(declare-fun b!101940 () Bool)

(assert (=> b!101940 (= e!66351 (contains!808 (t!5601 Nil!1597) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(assert (= (and d!27557 res!51027) b!101939))

(assert (= (and b!101939 (not res!51028)) b!101940))

(assert (=> d!27557 m!112553))

(assert (=> d!27557 m!111961))

(declare-fun m!112711 () Bool)

(assert (=> d!27557 m!112711))

(assert (=> b!101940 m!111961))

(declare-fun m!112713 () Bool)

(assert (=> b!101940 m!112713))

(assert (=> b!101528 d!27557))

(assert (=> bm!10512 d!27493))

(declare-fun b!101975 () Bool)

(declare-fun res!51049 () Bool)

(declare-fun e!66370 () Bool)

(assert (=> b!101975 (=> (not res!51049) (not e!66370))))

(declare-fun lt!51792 () tuple2!2348)

(assert (=> b!101975 (= res!51049 (contains!807 (map!1253 (_2!1185 lt!51792)) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(declare-fun b!101976 () Bool)

(declare-fun e!66368 () Bool)

(declare-fun call!10634 () Bool)

(assert (=> b!101976 (= e!66368 (not call!10634))))

(declare-fun b!101977 () Bool)

(declare-fun e!66375 () Bool)

(assert (=> b!101977 (= e!66375 (not call!10634))))

(declare-fun b!101978 () Bool)

(declare-fun res!51055 () Bool)

(declare-fun call!10633 () Bool)

(assert (=> b!101978 (= res!51055 call!10633)))

(declare-fun e!66372 () Bool)

(assert (=> b!101978 (=> (not res!51055) (not e!66372))))

(declare-fun b!101979 () Bool)

(declare-fun e!66369 () Bool)

(declare-fun lt!51789 () SeekEntryResult!259)

(assert (=> b!101979 (= e!66369 ((_ is Undefined!259) lt!51789))))

(declare-fun b!101980 () Bool)

(declare-fun e!66371 () Unit!3090)

(declare-fun lt!51776 () Unit!3090)

(assert (=> b!101980 (= e!66371 lt!51776)))

(assert (=> b!101980 (= lt!51776 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!44 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (defaultEntry!2535 newMap!16)))))

(declare-fun call!10635 () SeekEntryResult!259)

(assert (=> b!101980 (= lt!51789 call!10635)))

(declare-fun c!17572 () Bool)

(assert (=> b!101980 (= c!17572 ((_ is MissingZero!259) lt!51789))))

(declare-fun e!66373 () Bool)

(assert (=> b!101980 e!66373))

(declare-fun bm!10631 () Bool)

(declare-fun lt!51777 () SeekEntryResult!259)

(declare-fun c!17570 () Bool)

(assert (=> bm!10631 (= call!10633 (inRange!0 (ite c!17570 (index!3183 lt!51777) (ite c!17572 (index!3182 lt!51789) (index!3185 lt!51789))) (mask!6657 newMap!16)))))

(declare-fun b!101981 () Bool)

(declare-fun Unit!3109 () Unit!3090)

(assert (=> b!101981 (= e!66371 Unit!3109)))

(declare-fun lt!51785 () Unit!3090)

(assert (=> b!101981 (= lt!51785 (lemmaInListMapThenSeekEntryOrOpenFindsIt!44 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (defaultEntry!2535 newMap!16)))))

(assert (=> b!101981 (= lt!51777 call!10635)))

(declare-fun res!51051 () Bool)

(assert (=> b!101981 (= res!51051 ((_ is Found!259) lt!51777))))

(assert (=> b!101981 (=> (not res!51051) (not e!66372))))

(assert (=> b!101981 e!66372))

(declare-fun lt!51804 () Unit!3090)

(assert (=> b!101981 (= lt!51804 lt!51785)))

(assert (=> b!101981 false))

(declare-fun b!101982 () Bool)

(declare-fun e!66374 () Unit!3090)

(declare-fun Unit!3110 () Unit!3090)

(assert (=> b!101982 (= e!66374 Unit!3110)))

(declare-fun lt!51797 () Unit!3090)

(declare-fun lemmaArrayContainsKeyThenInListMap!28 (array!4259 array!4261 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 64) (_ BitVec 32) Int) Unit!3090)

(assert (=> b!101982 (= lt!51797 (lemmaArrayContainsKeyThenInListMap!28 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(assert (=> b!101982 (contains!807 (getCurrentListMap!457 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355))))

(declare-fun lt!51801 () Unit!3090)

(assert (=> b!101982 (= lt!51801 lt!51797)))

(assert (=> b!101982 false))

(declare-fun b!101983 () Bool)

(assert (=> b!101983 (= e!66369 e!66375)))

(declare-fun res!51054 () Bool)

(declare-fun call!10636 () Bool)

(assert (=> b!101983 (= res!51054 call!10636)))

(assert (=> b!101983 (=> (not res!51054) (not e!66375))))

(declare-fun d!27559 () Bool)

(assert (=> d!27559 e!66370))

(declare-fun res!51047 () Bool)

(assert (=> d!27559 (=> (not res!51047) (not e!66370))))

(assert (=> d!27559 (= res!51047 (_1!1185 lt!51792))))

(assert (=> d!27559 (= lt!51792 (tuple2!2349 true (LongMapFixedSize!869 (defaultEntry!2535 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (bvadd (_size!483 newMap!16) #b00000000000000000000000000000001) (array!4260 (store (arr!2020 (_keys!4234 newMap!16)) (ite c!17485 (index!3185 lt!51518) (index!3182 lt!51518)) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)) (size!2274 (_keys!4234 newMap!16))) (array!4262 (store (arr!2021 (_values!2518 newMap!16)) (ite c!17485 (index!3185 lt!51518) (index!3182 lt!51518)) (ValueCellFull!980 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2275 (_values!2518 newMap!16))) (_vacant!483 newMap!16))))))

(declare-fun lt!51779 () Unit!3090)

(declare-fun lt!51790 () Unit!3090)

(assert (=> d!27559 (= lt!51779 lt!51790)))

(declare-fun lt!51800 () array!4259)

(declare-fun lt!51788 () array!4261)

(assert (=> d!27559 (contains!807 (getCurrentListMap!457 lt!51800 lt!51788 (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)) (select (store (arr!2020 (_keys!4234 newMap!16)) (ite c!17485 (index!3185 lt!51518) (index!3182 lt!51518)) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)) (ite c!17485 (index!3185 lt!51518) (index!3182 lt!51518))))))

(assert (=> d!27559 (= lt!51790 (lemmaValidKeyInArrayIsInListMap!103 lt!51800 lt!51788 (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (ite c!17485 (index!3185 lt!51518) (index!3182 lt!51518)) (defaultEntry!2535 newMap!16)))))

(assert (=> d!27559 (= lt!51788 (array!4262 (store (arr!2021 (_values!2518 newMap!16)) (ite c!17485 (index!3185 lt!51518) (index!3182 lt!51518)) (ValueCellFull!980 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2275 (_values!2518 newMap!16))))))

(assert (=> d!27559 (= lt!51800 (array!4260 (store (arr!2020 (_keys!4234 newMap!16)) (ite c!17485 (index!3185 lt!51518) (index!3182 lt!51518)) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)) (size!2274 (_keys!4234 newMap!16))))))

(declare-fun lt!51796 () Unit!3090)

(declare-fun lt!51786 () Unit!3090)

(assert (=> d!27559 (= lt!51796 lt!51786)))

(declare-fun lt!51783 () array!4259)

(assert (=> d!27559 (= (arrayCountValidKeys!0 lt!51783 (ite c!17485 (index!3185 lt!51518) (index!3182 lt!51518)) (bvadd (ite c!17485 (index!3185 lt!51518) (index!3182 lt!51518)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4259 (_ BitVec 32)) Unit!3090)

(assert (=> d!27559 (= lt!51786 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!51783 (ite c!17485 (index!3185 lt!51518) (index!3182 lt!51518))))))

(assert (=> d!27559 (= lt!51783 (array!4260 (store (arr!2020 (_keys!4234 newMap!16)) (ite c!17485 (index!3185 lt!51518) (index!3182 lt!51518)) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)) (size!2274 (_keys!4234 newMap!16))))))

(declare-fun lt!51794 () Unit!3090)

(declare-fun lt!51784 () Unit!3090)

(assert (=> d!27559 (= lt!51794 lt!51784)))

(declare-fun lt!51787 () array!4259)

(assert (=> d!27559 (arrayContainsKey!0 lt!51787 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!27559 (= lt!51784 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!51787 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (ite c!17485 (index!3185 lt!51518) (index!3182 lt!51518))))))

(assert (=> d!27559 (= lt!51787 (array!4260 (store (arr!2020 (_keys!4234 newMap!16)) (ite c!17485 (index!3185 lt!51518) (index!3182 lt!51518)) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)) (size!2274 (_keys!4234 newMap!16))))))

(declare-fun lt!51782 () Unit!3090)

(declare-fun lt!51798 () Unit!3090)

(assert (=> d!27559 (= lt!51782 lt!51798)))

(assert (=> d!27559 (= (+!131 (getCurrentListMap!457 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)) (tuple2!2351 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!457 (array!4260 (store (arr!2020 (_keys!4234 newMap!16)) (ite c!17485 (index!3185 lt!51518) (index!3182 lt!51518)) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)) (size!2274 (_keys!4234 newMap!16))) (array!4262 (store (arr!2021 (_values!2518 newMap!16)) (ite c!17485 (index!3185 lt!51518) (index!3182 lt!51518)) (ValueCellFull!980 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2275 (_values!2518 newMap!16))) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!28 (array!4259 array!4261 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 32) (_ BitVec 64) V!3177 Int) Unit!3090)

(assert (=> d!27559 (= lt!51798 (lemmaAddValidKeyToArrayThenAddPairToListMap!28 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (ite c!17485 (index!3185 lt!51518) (index!3182 lt!51518)) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51795 () Unit!3090)

(declare-fun lt!51781 () Unit!3090)

(assert (=> d!27559 (= lt!51795 lt!51781)))

(assert (=> d!27559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4260 (store (arr!2020 (_keys!4234 newMap!16)) (ite c!17485 (index!3185 lt!51518) (index!3182 lt!51518)) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)) (size!2274 (_keys!4234 newMap!16))) (mask!6657 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4259 (_ BitVec 32) (_ BitVec 32)) Unit!3090)

(assert (=> d!27559 (= lt!51781 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (_keys!4234 newMap!16) (ite c!17485 (index!3185 lt!51518) (index!3182 lt!51518)) (mask!6657 newMap!16)))))

(declare-fun lt!51778 () Unit!3090)

(declare-fun lt!51793 () Unit!3090)

(assert (=> d!27559 (= lt!51778 lt!51793)))

(assert (=> d!27559 (= (arrayCountValidKeys!0 (array!4260 (store (arr!2020 (_keys!4234 newMap!16)) (ite c!17485 (index!3185 lt!51518) (index!3182 lt!51518)) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)) (size!2274 (_keys!4234 newMap!16))) #b00000000000000000000000000000000 (size!2274 (_keys!4234 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4234 newMap!16) #b00000000000000000000000000000000 (size!2274 (_keys!4234 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4259 (_ BitVec 32) (_ BitVec 64)) Unit!3090)

(assert (=> d!27559 (= lt!51793 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4234 newMap!16) (ite c!17485 (index!3185 lt!51518) (index!3182 lt!51518)) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(declare-fun lt!51780 () Unit!3090)

(declare-fun lt!51805 () Unit!3090)

(assert (=> d!27559 (= lt!51780 lt!51805)))

(declare-fun lt!51802 () List!1600)

(declare-fun lt!51799 () (_ BitVec 32))

(assert (=> d!27559 (arrayNoDuplicates!0 (array!4260 (store (arr!2020 (_keys!4234 newMap!16)) (ite c!17485 (index!3185 lt!51518) (index!3182 lt!51518)) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)) (size!2274 (_keys!4234 newMap!16))) lt!51799 lt!51802)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4259 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1600) Unit!3090)

(assert (=> d!27559 (= lt!51805 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4234 newMap!16) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (ite c!17485 (index!3185 lt!51518) (index!3182 lt!51518)) lt!51799 lt!51802))))

(assert (=> d!27559 (= lt!51802 Nil!1597)))

(assert (=> d!27559 (= lt!51799 #b00000000000000000000000000000000)))

(declare-fun lt!51791 () Unit!3090)

(assert (=> d!27559 (= lt!51791 e!66374)))

(declare-fun c!17571 () Bool)

(assert (=> d!27559 (= c!17571 (arrayContainsKey!0 (_keys!4234 newMap!16) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!51803 () Unit!3090)

(assert (=> d!27559 (= lt!51803 e!66371)))

(assert (=> d!27559 (= c!17570 (contains!807 (getCurrentListMap!457 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(assert (=> d!27559 (valid!403 newMap!16)))

(assert (=> d!27559 (= (updateHelperNewKey!44 newMap!16 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!17485 (index!3185 lt!51518) (index!3182 lt!51518))) lt!51792)))

(declare-fun bm!10630 () Bool)

(assert (=> bm!10630 (= call!10636 call!10633)))

(declare-fun b!101984 () Bool)

(declare-fun c!17569 () Bool)

(assert (=> b!101984 (= c!17569 ((_ is MissingVacant!259) lt!51789))))

(assert (=> b!101984 (= e!66373 e!66369)))

(declare-fun b!101985 () Bool)

(declare-fun res!51050 () Bool)

(assert (=> b!101985 (= res!51050 (= (select (arr!2020 (_keys!4234 newMap!16)) (index!3185 lt!51789)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101985 (=> (not res!51050) (not e!66375))))

(declare-fun b!101986 () Bool)

(declare-fun res!51048 () Bool)

(assert (=> b!101986 (=> (not res!51048) (not e!66368))))

(assert (=> b!101986 (= res!51048 call!10636)))

(assert (=> b!101986 (= e!66373 e!66368)))

(declare-fun bm!10632 () Bool)

(assert (=> bm!10632 (= call!10634 (arrayContainsKey!0 (_keys!4234 newMap!16) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!101987 () Bool)

(declare-fun res!51053 () Bool)

(assert (=> b!101987 (=> (not res!51053) (not e!66370))))

(assert (=> b!101987 (= res!51053 (valid!403 (_2!1185 lt!51792)))))

(declare-fun b!101988 () Bool)

(declare-fun Unit!3111 () Unit!3090)

(assert (=> b!101988 (= e!66374 Unit!3111)))

(declare-fun b!101989 () Bool)

(assert (=> b!101989 (= e!66372 (= (select (arr!2020 (_keys!4234 newMap!16)) (index!3183 lt!51777)) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(declare-fun b!101990 () Bool)

(declare-fun res!51052 () Bool)

(assert (=> b!101990 (=> (not res!51052) (not e!66368))))

(assert (=> b!101990 (= res!51052 (= (select (arr!2020 (_keys!4234 newMap!16)) (index!3182 lt!51789)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!10633 () Bool)

(assert (=> bm!10633 (= call!10635 (seekEntryOrOpen!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (_keys!4234 newMap!16) (mask!6657 newMap!16)))))

(declare-fun b!101991 () Bool)

(assert (=> b!101991 (= e!66370 (= (map!1253 (_2!1185 lt!51792)) (+!131 (map!1253 newMap!16) (tuple2!2351 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!27559 c!17570) b!101981))

(assert (= (and d!27559 (not c!17570)) b!101980))

(assert (= (and b!101981 res!51051) b!101978))

(assert (= (and b!101978 res!51055) b!101989))

(assert (= (and b!101980 c!17572) b!101986))

(assert (= (and b!101980 (not c!17572)) b!101984))

(assert (= (and b!101986 res!51048) b!101990))

(assert (= (and b!101990 res!51052) b!101976))

(assert (= (and b!101984 c!17569) b!101983))

(assert (= (and b!101984 (not c!17569)) b!101979))

(assert (= (and b!101983 res!51054) b!101985))

(assert (= (and b!101985 res!51050) b!101977))

(assert (= (or b!101986 b!101983) bm!10630))

(assert (= (or b!101976 b!101977) bm!10632))

(assert (= (or b!101978 bm!10630) bm!10631))

(assert (= (or b!101981 b!101980) bm!10633))

(assert (= (and d!27559 c!17571) b!101982))

(assert (= (and d!27559 (not c!17571)) b!101988))

(assert (= (and d!27559 res!51047) b!101987))

(assert (= (and b!101987 res!51053) b!101975))

(assert (= (and b!101975 res!51049) b!101991))

(declare-fun m!112715 () Bool)

(assert (=> b!101990 m!112715))

(declare-fun m!112717 () Bool)

(assert (=> bm!10631 m!112717))

(assert (=> d!27559 m!112115))

(assert (=> d!27559 m!112707))

(assert (=> d!27559 m!111961))

(declare-fun m!112719 () Bool)

(assert (=> d!27559 m!112719))

(declare-fun m!112721 () Bool)

(assert (=> d!27559 m!112721))

(declare-fun m!112723 () Bool)

(assert (=> d!27559 m!112723))

(declare-fun m!112725 () Bool)

(assert (=> d!27559 m!112725))

(declare-fun m!112727 () Bool)

(assert (=> d!27559 m!112727))

(declare-fun m!112729 () Bool)

(assert (=> d!27559 m!112729))

(declare-fun m!112731 () Bool)

(assert (=> d!27559 m!112731))

(declare-fun m!112733 () Bool)

(assert (=> d!27559 m!112733))

(declare-fun m!112735 () Bool)

(assert (=> d!27559 m!112735))

(assert (=> d!27559 m!111961))

(assert (=> d!27559 m!112237))

(assert (=> d!27559 m!112115))

(assert (=> d!27559 m!111961))

(declare-fun m!112737 () Bool)

(assert (=> d!27559 m!112737))

(assert (=> d!27559 m!112115))

(assert (=> d!27559 m!111961))

(declare-fun m!112739 () Bool)

(assert (=> d!27559 m!112739))

(assert (=> d!27559 m!112257))

(assert (=> d!27559 m!111993))

(assert (=> d!27559 m!112727))

(assert (=> d!27559 m!111961))

(assert (=> d!27559 m!111983))

(declare-fun m!112741 () Bool)

(assert (=> d!27559 m!112741))

(assert (=> d!27559 m!111961))

(declare-fun m!112743 () Bool)

(assert (=> d!27559 m!112743))

(assert (=> d!27559 m!111961))

(declare-fun m!112745 () Bool)

(assert (=> d!27559 m!112745))

(declare-fun m!112747 () Bool)

(assert (=> d!27559 m!112747))

(assert (=> d!27559 m!112725))

(assert (=> d!27559 m!111961))

(declare-fun m!112749 () Bool)

(assert (=> d!27559 m!112749))

(declare-fun m!112751 () Bool)

(assert (=> d!27559 m!112751))

(declare-fun m!112753 () Bool)

(assert (=> d!27559 m!112753))

(declare-fun m!112755 () Bool)

(assert (=> d!27559 m!112755))

(assert (=> b!101982 m!111961))

(declare-fun m!112757 () Bool)

(assert (=> b!101982 m!112757))

(assert (=> b!101982 m!112115))

(assert (=> b!101982 m!112115))

(assert (=> b!101982 m!111961))

(assert (=> b!101982 m!112737))

(assert (=> bm!10633 m!111961))

(assert (=> bm!10633 m!112231))

(declare-fun m!112759 () Bool)

(assert (=> b!101975 m!112759))

(assert (=> b!101975 m!112759))

(assert (=> b!101975 m!111961))

(declare-fun m!112761 () Bool)

(assert (=> b!101975 m!112761))

(declare-fun m!112763 () Bool)

(assert (=> b!101987 m!112763))

(assert (=> b!101991 m!112759))

(assert (=> b!101991 m!111971))

(assert (=> b!101991 m!111971))

(declare-fun m!112765 () Bool)

(assert (=> b!101991 m!112765))

(declare-fun m!112767 () Bool)

(assert (=> b!101985 m!112767))

(assert (=> bm!10632 m!111961))

(assert (=> bm!10632 m!112237))

(declare-fun m!112769 () Bool)

(assert (=> b!101989 m!112769))

(assert (=> b!101980 m!111961))

(assert (=> b!101980 m!112201))

(assert (=> b!101981 m!111961))

(assert (=> b!101981 m!112233))

(assert (=> bm!10583 d!27559))

(assert (=> d!27425 d!27431))

(declare-fun d!27561 () Bool)

(assert (=> d!27561 (arrayNoDuplicates!0 (_keys!4234 (v!2835 (underlying!340 thiss!992))) from!355 Nil!1597)))

(assert (=> d!27561 true))

(declare-fun _$71!141 () Unit!3090)

(assert (=> d!27561 (= (choose!39 (_keys!4234 (v!2835 (underlying!340 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!141)))

(declare-fun bs!4198 () Bool)

(assert (= bs!4198 d!27561))

(assert (=> bs!4198 m!111959))

(assert (=> d!27425 d!27561))

(assert (=> b!101526 d!27427))

(declare-fun d!27563 () Bool)

(declare-fun e!66376 () Bool)

(assert (=> d!27563 e!66376))

(declare-fun res!51056 () Bool)

(assert (=> d!27563 (=> res!51056 e!66376)))

(declare-fun lt!51808 () Bool)

(assert (=> d!27563 (= res!51056 (not lt!51808))))

(declare-fun lt!51807 () Bool)

(assert (=> d!27563 (= lt!51808 lt!51807)))

(declare-fun lt!51809 () Unit!3090)

(declare-fun e!66377 () Unit!3090)

(assert (=> d!27563 (= lt!51809 e!66377)))

(declare-fun c!17573 () Bool)

(assert (=> d!27563 (= c!17573 lt!51807)))

(assert (=> d!27563 (= lt!51807 (containsKey!155 (toList!778 lt!51415) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!27563 (= (contains!807 lt!51415 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!51808)))

(declare-fun b!101992 () Bool)

(declare-fun lt!51806 () Unit!3090)

(assert (=> b!101992 (= e!66377 lt!51806)))

(assert (=> b!101992 (= lt!51806 (lemmaContainsKeyImpliesGetValueByKeyDefined!104 (toList!778 lt!51415) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!101992 (isDefined!105 (getValueByKey!151 (toList!778 lt!51415) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!101993 () Bool)

(declare-fun Unit!3112 () Unit!3090)

(assert (=> b!101993 (= e!66377 Unit!3112)))

(declare-fun b!101994 () Bool)

(assert (=> b!101994 (= e!66376 (isDefined!105 (getValueByKey!151 (toList!778 lt!51415) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!27563 c!17573) b!101992))

(assert (= (and d!27563 (not c!17573)) b!101993))

(assert (= (and d!27563 (not res!51056)) b!101994))

(assert (=> d!27563 m!112127))

(declare-fun m!112771 () Bool)

(assert (=> d!27563 m!112771))

(assert (=> b!101992 m!112127))

(declare-fun m!112773 () Bool)

(assert (=> b!101992 m!112773))

(assert (=> b!101992 m!112127))

(assert (=> b!101992 m!112583))

(assert (=> b!101992 m!112583))

(declare-fun m!112775 () Bool)

(assert (=> b!101992 m!112775))

(assert (=> b!101994 m!112127))

(assert (=> b!101994 m!112583))

(assert (=> b!101994 m!112583))

(assert (=> b!101994 m!112775))

(assert (=> b!101511 d!27563))

(declare-fun d!27565 () Bool)

(assert (=> d!27565 (= (validKeyInArray!0 (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101499 d!27565))

(assert (=> b!101449 d!27539))

(declare-fun d!27567 () Bool)

(assert (=> d!27567 (= (get!1307 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101673 d!27567))

(declare-fun d!27569 () Bool)

(assert (=> d!27569 (= (+!131 (getCurrentListMap!457 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!457 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) lt!51522 (zeroValue!2413 newMap!16) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51812 () Unit!3090)

(declare-fun choose!640 (array!4259 array!4261 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 V!3177 Int) Unit!3090)

(assert (=> d!27569 (= lt!51812 (choose!640 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) lt!51522 (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2535 newMap!16)))))

(assert (=> d!27569 (validMask!0 (mask!6657 newMap!16))))

(assert (=> d!27569 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!44 (_keys!4234 newMap!16) (_values!2518 newMap!16) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) lt!51522 (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2535 newMap!16)) lt!51812)))

(declare-fun bs!4199 () Bool)

(assert (= bs!4199 d!27569))

(assert (=> bs!4199 m!111983))

(declare-fun m!112777 () Bool)

(assert (=> bs!4199 m!112777))

(assert (=> bs!4199 m!112115))

(assert (=> bs!4199 m!111983))

(declare-fun m!112779 () Bool)

(assert (=> bs!4199 m!112779))

(assert (=> bs!4199 m!112115))

(declare-fun m!112781 () Bool)

(assert (=> bs!4199 m!112781))

(assert (=> bs!4199 m!112433))

(assert (=> b!101632 d!27569))

(declare-fun b!101995 () Bool)

(declare-fun e!66384 () Bool)

(declare-fun e!66387 () Bool)

(assert (=> b!101995 (= e!66384 e!66387)))

(declare-fun res!51059 () Bool)

(declare-fun call!10642 () Bool)

(assert (=> b!101995 (= res!51059 call!10642)))

(assert (=> b!101995 (=> (not res!51059) (not e!66387))))

(declare-fun b!101996 () Bool)

(declare-fun e!66381 () Unit!3090)

(declare-fun lt!51818 () Unit!3090)

(assert (=> b!101996 (= e!66381 lt!51818)))

(declare-fun lt!51824 () ListLongMap!1525)

(assert (=> b!101996 (= lt!51824 (getCurrentListMapNoExtraKeys!95 (_keys!4234 newMap!16) (ite c!17489 (_values!2518 newMap!16) (array!4262 (store (arr!2021 (_values!2518 newMap!16)) (index!3183 lt!51518) (ValueCellFull!980 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2275 (_values!2518 newMap!16)))) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51829 () (_ BitVec 64))

(assert (=> b!101996 (= lt!51829 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51825 () (_ BitVec 64))

(assert (=> b!101996 (= lt!51825 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51832 () Unit!3090)

(assert (=> b!101996 (= lt!51832 (addStillContains!71 lt!51824 lt!51829 (zeroValue!2413 newMap!16) lt!51825))))

(assert (=> b!101996 (contains!807 (+!131 lt!51824 (tuple2!2351 lt!51829 (zeroValue!2413 newMap!16))) lt!51825)))

(declare-fun lt!51828 () Unit!3090)

(assert (=> b!101996 (= lt!51828 lt!51832)))

(declare-fun lt!51830 () ListLongMap!1525)

(assert (=> b!101996 (= lt!51830 (getCurrentListMapNoExtraKeys!95 (_keys!4234 newMap!16) (ite c!17489 (_values!2518 newMap!16) (array!4262 (store (arr!2021 (_values!2518 newMap!16)) (index!3183 lt!51518) (ValueCellFull!980 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2275 (_values!2518 newMap!16)))) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51815 () (_ BitVec 64))

(assert (=> b!101996 (= lt!51815 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51820 () (_ BitVec 64))

(assert (=> b!101996 (= lt!51820 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51831 () Unit!3090)

(assert (=> b!101996 (= lt!51831 (addApplyDifferent!71 lt!51830 lt!51815 (minValue!2413 newMap!16) lt!51820))))

(assert (=> b!101996 (= (apply!95 (+!131 lt!51830 (tuple2!2351 lt!51815 (minValue!2413 newMap!16))) lt!51820) (apply!95 lt!51830 lt!51820))))

(declare-fun lt!51826 () Unit!3090)

(assert (=> b!101996 (= lt!51826 lt!51831)))

(declare-fun lt!51813 () ListLongMap!1525)

(assert (=> b!101996 (= lt!51813 (getCurrentListMapNoExtraKeys!95 (_keys!4234 newMap!16) (ite c!17489 (_values!2518 newMap!16) (array!4262 (store (arr!2021 (_values!2518 newMap!16)) (index!3183 lt!51518) (ValueCellFull!980 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2275 (_values!2518 newMap!16)))) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51823 () (_ BitVec 64))

(assert (=> b!101996 (= lt!51823 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51816 () (_ BitVec 64))

(assert (=> b!101996 (= lt!51816 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51817 () Unit!3090)

(assert (=> b!101996 (= lt!51817 (addApplyDifferent!71 lt!51813 lt!51823 (zeroValue!2413 newMap!16) lt!51816))))

(assert (=> b!101996 (= (apply!95 (+!131 lt!51813 (tuple2!2351 lt!51823 (zeroValue!2413 newMap!16))) lt!51816) (apply!95 lt!51813 lt!51816))))

(declare-fun lt!51822 () Unit!3090)

(assert (=> b!101996 (= lt!51822 lt!51817)))

(declare-fun lt!51833 () ListLongMap!1525)

(assert (=> b!101996 (= lt!51833 (getCurrentListMapNoExtraKeys!95 (_keys!4234 newMap!16) (ite c!17489 (_values!2518 newMap!16) (array!4262 (store (arr!2021 (_values!2518 newMap!16)) (index!3183 lt!51518) (ValueCellFull!980 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2275 (_values!2518 newMap!16)))) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51834 () (_ BitVec 64))

(assert (=> b!101996 (= lt!51834 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51827 () (_ BitVec 64))

(assert (=> b!101996 (= lt!51827 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!101996 (= lt!51818 (addApplyDifferent!71 lt!51833 lt!51834 (minValue!2413 newMap!16) lt!51827))))

(assert (=> b!101996 (= (apply!95 (+!131 lt!51833 (tuple2!2351 lt!51834 (minValue!2413 newMap!16))) lt!51827) (apply!95 lt!51833 lt!51827))))

(declare-fun call!10639 () ListLongMap!1525)

(declare-fun bm!10634 () Bool)

(assert (=> bm!10634 (= call!10639 (getCurrentListMapNoExtraKeys!95 (_keys!4234 newMap!16) (ite c!17489 (_values!2518 newMap!16) (array!4262 (store (arr!2021 (_values!2518 newMap!16)) (index!3183 lt!51518) (ValueCellFull!980 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2275 (_values!2518 newMap!16)))) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun b!101997 () Bool)

(declare-fun e!66389 () Bool)

(declare-fun e!66385 () Bool)

(assert (=> b!101997 (= e!66389 e!66385)))

(declare-fun res!51057 () Bool)

(declare-fun call!10638 () Bool)

(assert (=> b!101997 (= res!51057 call!10638)))

(assert (=> b!101997 (=> (not res!51057) (not e!66385))))

(declare-fun b!101998 () Bool)

(assert (=> b!101998 (= e!66384 (not call!10642))))

(declare-fun c!17577 () Bool)

(declare-fun call!10637 () ListLongMap!1525)

(declare-fun call!10643 () ListLongMap!1525)

(declare-fun call!10641 () ListLongMap!1525)

(declare-fun c!17574 () Bool)

(declare-fun bm!10635 () Bool)

(assert (=> bm!10635 (= call!10637 (+!131 (ite c!17577 call!10639 (ite c!17574 call!10641 call!10643)) (ite (or c!17577 c!17574) (tuple2!2351 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2413 newMap!16)) (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 newMap!16)))))))

(declare-fun b!101999 () Bool)

(declare-fun e!66383 () Bool)

(assert (=> b!101999 (= e!66383 (validKeyInArray!0 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!66390 () Bool)

(declare-fun b!102000 () Bool)

(declare-fun lt!51819 () ListLongMap!1525)

(assert (=> b!102000 (= e!66390 (= (apply!95 lt!51819 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000)) (get!1305 (select (arr!2021 (ite c!17489 (_values!2518 newMap!16) (array!4262 (store (arr!2021 (_values!2518 newMap!16)) (index!3183 lt!51518) (ValueCellFull!980 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2275 (_values!2518 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!375 (defaultEntry!2535 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!102000 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2275 (ite c!17489 (_values!2518 newMap!16) (array!4262 (store (arr!2021 (_values!2518 newMap!16)) (index!3183 lt!51518) (ValueCellFull!980 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2275 (_values!2518 newMap!16)))))))))

(assert (=> b!102000 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2274 (_keys!4234 newMap!16))))))

(declare-fun b!102001 () Bool)

(assert (=> b!102001 (= e!66387 (= (apply!95 lt!51819 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2413 newMap!16)))))

(declare-fun bm!10636 () Bool)

(declare-fun call!10640 () ListLongMap!1525)

(assert (=> bm!10636 (= call!10640 call!10637)))

(declare-fun b!102002 () Bool)

(declare-fun e!66382 () ListLongMap!1525)

(assert (=> b!102002 (= e!66382 call!10640)))

(declare-fun b!102003 () Bool)

(assert (=> b!102003 (= e!66389 (not call!10638))))

(declare-fun b!102004 () Bool)

(declare-fun e!66379 () Bool)

(assert (=> b!102004 (= e!66379 (validKeyInArray!0 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!10637 () Bool)

(assert (=> bm!10637 (= call!10643 call!10641)))

(declare-fun b!102005 () Bool)

(declare-fun Unit!3113 () Unit!3090)

(assert (=> b!102005 (= e!66381 Unit!3113)))

(declare-fun b!102006 () Bool)

(declare-fun e!66380 () ListLongMap!1525)

(assert (=> b!102006 (= e!66380 call!10643)))

(declare-fun b!102007 () Bool)

(declare-fun e!66386 () ListLongMap!1525)

(assert (=> b!102007 (= e!66386 (+!131 call!10637 (tuple2!2351 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 newMap!16))))))

(declare-fun b!102008 () Bool)

(declare-fun res!51058 () Bool)

(declare-fun e!66388 () Bool)

(assert (=> b!102008 (=> (not res!51058) (not e!66388))))

(declare-fun e!66378 () Bool)

(assert (=> b!102008 (= res!51058 e!66378)))

(declare-fun res!51063 () Bool)

(assert (=> b!102008 (=> res!51063 e!66378)))

(assert (=> b!102008 (= res!51063 (not e!66379))))

(declare-fun res!51064 () Bool)

(assert (=> b!102008 (=> (not res!51064) (not e!66379))))

(assert (=> b!102008 (= res!51064 (bvslt #b00000000000000000000000000000000 (size!2274 (_keys!4234 newMap!16))))))

(declare-fun bm!10638 () Bool)

(assert (=> bm!10638 (= call!10638 (contains!807 lt!51819 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!102009 () Bool)

(assert (=> b!102009 (= e!66388 e!66389)))

(declare-fun c!17575 () Bool)

(assert (=> b!102009 (= c!17575 (not (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!102010 () Bool)

(assert (=> b!102010 (= e!66380 call!10640)))

(declare-fun b!102011 () Bool)

(assert (=> b!102011 (= e!66378 e!66390)))

(declare-fun res!51065 () Bool)

(assert (=> b!102011 (=> (not res!51065) (not e!66390))))

(assert (=> b!102011 (= res!51065 (contains!807 lt!51819 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!102011 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2274 (_keys!4234 newMap!16))))))

(declare-fun b!102012 () Bool)

(assert (=> b!102012 (= e!66386 e!66382)))

(assert (=> b!102012 (= c!17574 (and (not (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!102013 () Bool)

(declare-fun res!51060 () Bool)

(assert (=> b!102013 (=> (not res!51060) (not e!66388))))

(assert (=> b!102013 (= res!51060 e!66384)))

(declare-fun c!17579 () Bool)

(assert (=> b!102013 (= c!17579 (not (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!102014 () Bool)

(declare-fun c!17578 () Bool)

(assert (=> b!102014 (= c!17578 (and (not (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!102014 (= e!66382 e!66380)))

(declare-fun b!102015 () Bool)

(assert (=> b!102015 (= e!66385 (= (apply!95 lt!51819 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2413 newMap!16)))))

(declare-fun bm!10639 () Bool)

(assert (=> bm!10639 (= call!10642 (contains!807 lt!51819 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!10640 () Bool)

(assert (=> bm!10640 (= call!10641 call!10639)))

(declare-fun d!27571 () Bool)

(assert (=> d!27571 e!66388))

(declare-fun res!51061 () Bool)

(assert (=> d!27571 (=> (not res!51061) (not e!66388))))

(assert (=> d!27571 (= res!51061 (or (bvsge #b00000000000000000000000000000000 (size!2274 (_keys!4234 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2274 (_keys!4234 newMap!16))))))))

(declare-fun lt!51814 () ListLongMap!1525)

(assert (=> d!27571 (= lt!51819 lt!51814)))

(declare-fun lt!51821 () Unit!3090)

(assert (=> d!27571 (= lt!51821 e!66381)))

(declare-fun c!17576 () Bool)

(assert (=> d!27571 (= c!17576 e!66383)))

(declare-fun res!51062 () Bool)

(assert (=> d!27571 (=> (not res!51062) (not e!66383))))

(assert (=> d!27571 (= res!51062 (bvslt #b00000000000000000000000000000000 (size!2274 (_keys!4234 newMap!16))))))

(assert (=> d!27571 (= lt!51814 e!66386)))

(assert (=> d!27571 (= c!17577 (and (not (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27571 (validMask!0 (mask!6657 newMap!16))))

(assert (=> d!27571 (= (getCurrentListMap!457 (_keys!4234 newMap!16) (ite c!17489 (_values!2518 newMap!16) (array!4262 (store (arr!2021 (_values!2518 newMap!16)) (index!3183 lt!51518) (ValueCellFull!980 (get!1305 (select (arr!2021 (_values!2518 (v!2835 (underlying!340 thiss!992)))) from!355) (dynLambda!375 (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2275 (_values!2518 newMap!16)))) (mask!6657 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)) lt!51819)))

(assert (= (and d!27571 c!17577) b!102007))

(assert (= (and d!27571 (not c!17577)) b!102012))

(assert (= (and b!102012 c!17574) b!102002))

(assert (= (and b!102012 (not c!17574)) b!102014))

(assert (= (and b!102014 c!17578) b!102010))

(assert (= (and b!102014 (not c!17578)) b!102006))

(assert (= (or b!102010 b!102006) bm!10637))

(assert (= (or b!102002 bm!10637) bm!10640))

(assert (= (or b!102002 b!102010) bm!10636))

(assert (= (or b!102007 bm!10640) bm!10634))

(assert (= (or b!102007 bm!10636) bm!10635))

(assert (= (and d!27571 res!51062) b!101999))

(assert (= (and d!27571 c!17576) b!101996))

(assert (= (and d!27571 (not c!17576)) b!102005))

(assert (= (and d!27571 res!51061) b!102008))

(assert (= (and b!102008 res!51064) b!102004))

(assert (= (and b!102008 (not res!51063)) b!102011))

(assert (= (and b!102011 res!51065) b!102000))

(assert (= (and b!102008 res!51058) b!102013))

(assert (= (and b!102013 c!17579) b!101995))

(assert (= (and b!102013 (not c!17579)) b!101998))

(assert (= (and b!101995 res!51059) b!102001))

(assert (= (or b!101995 b!101998) bm!10639))

(assert (= (and b!102013 res!51060) b!102009))

(assert (= (and b!102009 c!17575) b!101997))

(assert (= (and b!102009 (not c!17575)) b!102003))

(assert (= (and b!101997 res!51057) b!102015))

(assert (= (or b!101997 b!102003) bm!10638))

(declare-fun b_lambda!4549 () Bool)

(assert (=> (not b_lambda!4549) (not b!102000)))

(assert (=> b!102000 t!5612))

(declare-fun b_and!6265 () Bool)

(assert (= b_and!6261 (and (=> t!5612 result!3351) b_and!6265)))

(assert (=> b!102000 t!5614))

(declare-fun b_and!6267 () Bool)

(assert (= b_and!6263 (and (=> t!5614 result!3353) b_and!6267)))

(declare-fun m!112783 () Bool)

(assert (=> bm!10638 m!112783))

(assert (=> d!27571 m!112433))

(declare-fun m!112785 () Bool)

(assert (=> b!102015 m!112785))

(declare-fun m!112787 () Bool)

(assert (=> b!102001 m!112787))

(declare-fun m!112789 () Bool)

(assert (=> b!102007 m!112789))

(declare-fun m!112791 () Bool)

(assert (=> bm!10639 m!112791))

(assert (=> b!102011 m!112279))

(assert (=> b!102011 m!112279))

(declare-fun m!112793 () Bool)

(assert (=> b!102011 m!112793))

(assert (=> b!101999 m!112279))

(assert (=> b!101999 m!112279))

(assert (=> b!101999 m!112445))

(declare-fun m!112795 () Bool)

(assert (=> b!101996 m!112795))

(declare-fun m!112797 () Bool)

(assert (=> b!101996 m!112797))

(assert (=> b!101996 m!112797))

(declare-fun m!112799 () Bool)

(assert (=> b!101996 m!112799))

(declare-fun m!112801 () Bool)

(assert (=> b!101996 m!112801))

(assert (=> b!101996 m!112795))

(declare-fun m!112803 () Bool)

(assert (=> b!101996 m!112803))

(declare-fun m!112805 () Bool)

(assert (=> b!101996 m!112805))

(declare-fun m!112807 () Bool)

(assert (=> b!101996 m!112807))

(assert (=> b!101996 m!112805))

(declare-fun m!112809 () Bool)

(assert (=> b!101996 m!112809))

(declare-fun m!112811 () Bool)

(assert (=> b!101996 m!112811))

(declare-fun m!112813 () Bool)

(assert (=> b!101996 m!112813))

(declare-fun m!112815 () Bool)

(assert (=> b!101996 m!112815))

(assert (=> b!101996 m!112279))

(declare-fun m!112817 () Bool)

(assert (=> b!101996 m!112817))

(declare-fun m!112819 () Bool)

(assert (=> b!101996 m!112819))

(declare-fun m!112821 () Bool)

(assert (=> b!101996 m!112821))

(declare-fun m!112823 () Bool)

(assert (=> b!101996 m!112823))

(assert (=> b!101996 m!112817))

(declare-fun m!112825 () Bool)

(assert (=> b!101996 m!112825))

(declare-fun m!112827 () Bool)

(assert (=> bm!10635 m!112827))

(assert (=> b!102004 m!112279))

(assert (=> b!102004 m!112279))

(assert (=> b!102004 m!112445))

(assert (=> b!102000 m!112481))

(declare-fun m!112829 () Bool)

(assert (=> b!102000 m!112829))

(assert (=> b!102000 m!112481))

(declare-fun m!112831 () Bool)

(assert (=> b!102000 m!112831))

(assert (=> b!102000 m!112829))

(assert (=> b!102000 m!112279))

(assert (=> b!102000 m!112279))

(declare-fun m!112833 () Bool)

(assert (=> b!102000 m!112833))

(assert (=> bm!10634 m!112813))

(assert (=> bm!10577 d!27571))

(declare-fun d!27573 () Bool)

(assert (=> d!27573 (= (apply!95 lt!51415 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1308 (getValueByKey!151 (toList!778 lt!51415) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4200 () Bool)

(assert (= bs!4200 d!27573))

(assert (=> bs!4200 m!112295))

(assert (=> bs!4200 m!112295))

(declare-fun m!112835 () Bool)

(assert (=> bs!4200 m!112835))

(assert (=> b!101515 d!27573))

(declare-fun d!27575 () Bool)

(assert (=> d!27575 (= (map!1253 (_2!1185 lt!51517)) (getCurrentListMap!457 (_keys!4234 (_2!1185 lt!51517)) (_values!2518 (_2!1185 lt!51517)) (mask!6657 (_2!1185 lt!51517)) (extraKeys!2346 (_2!1185 lt!51517)) (zeroValue!2413 (_2!1185 lt!51517)) (minValue!2413 (_2!1185 lt!51517)) #b00000000000000000000000000000000 (defaultEntry!2535 (_2!1185 lt!51517))))))

(declare-fun bs!4201 () Bool)

(assert (= bs!4201 d!27575))

(declare-fun m!112837 () Bool)

(assert (=> bs!4201 m!112837))

(assert (=> bm!10587 d!27575))

(assert (=> b!101504 d!27565))

(declare-fun b!102027 () Bool)

(declare-fun e!66393 () Bool)

(assert (=> b!102027 (= e!66393 (and (bvsge (extraKeys!2346 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2346 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!483 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!102024 () Bool)

(declare-fun res!51074 () Bool)

(assert (=> b!102024 (=> (not res!51074) (not e!66393))))

(assert (=> b!102024 (= res!51074 (and (= (size!2275 (_values!2518 newMap!16)) (bvadd (mask!6657 newMap!16) #b00000000000000000000000000000001)) (= (size!2274 (_keys!4234 newMap!16)) (size!2275 (_values!2518 newMap!16))) (bvsge (_size!483 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!483 newMap!16) (bvadd (mask!6657 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun d!27577 () Bool)

(declare-fun res!51077 () Bool)

(assert (=> d!27577 (=> (not res!51077) (not e!66393))))

(assert (=> d!27577 (= res!51077 (validMask!0 (mask!6657 newMap!16)))))

(assert (=> d!27577 (= (simpleValid!71 newMap!16) e!66393)))

(declare-fun b!102025 () Bool)

(declare-fun res!51076 () Bool)

(assert (=> b!102025 (=> (not res!51076) (not e!66393))))

(declare-fun size!2280 (LongMapFixedSize!868) (_ BitVec 32))

(assert (=> b!102025 (= res!51076 (bvsge (size!2280 newMap!16) (_size!483 newMap!16)))))

(declare-fun b!102026 () Bool)

(declare-fun res!51075 () Bool)

(assert (=> b!102026 (=> (not res!51075) (not e!66393))))

(assert (=> b!102026 (= res!51075 (= (size!2280 newMap!16) (bvadd (_size!483 newMap!16) (bvsdiv (bvadd (extraKeys!2346 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!27577 res!51077) b!102024))

(assert (= (and b!102024 res!51074) b!102025))

(assert (= (and b!102025 res!51076) b!102026))

(assert (= (and b!102026 res!51075) b!102027))

(assert (=> d!27577 m!112433))

(declare-fun m!112839 () Bool)

(assert (=> b!102025 m!112839))

(assert (=> b!102026 m!112839))

(assert (=> d!27445 d!27577))

(declare-fun d!27579 () Bool)

(declare-fun isEmpty!369 (Option!157) Bool)

(assert (=> d!27579 (= (isDefined!105 (getValueByKey!151 (toList!778 lt!51312) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355))) (not (isEmpty!369 (getValueByKey!151 (toList!778 lt!51312) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))))

(declare-fun bs!4202 () Bool)

(assert (= bs!4202 d!27579))

(assert (=> bs!4202 m!112193))

(declare-fun m!112841 () Bool)

(assert (=> bs!4202 m!112841))

(assert (=> b!101541 d!27579))

(declare-fun b!102039 () Bool)

(declare-fun e!66399 () Option!157)

(assert (=> b!102039 (= e!66399 None!155)))

(declare-fun d!27581 () Bool)

(declare-fun c!17584 () Bool)

(assert (=> d!27581 (= c!17584 (and ((_ is Cons!1595) (toList!778 lt!51312)) (= (_1!1186 (h!2191 (toList!778 lt!51312))) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355))))))

(declare-fun e!66398 () Option!157)

(assert (=> d!27581 (= (getValueByKey!151 (toList!778 lt!51312) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)) e!66398)))

(declare-fun b!102036 () Bool)

(assert (=> b!102036 (= e!66398 (Some!156 (_2!1186 (h!2191 (toList!778 lt!51312)))))))

(declare-fun b!102037 () Bool)

(assert (=> b!102037 (= e!66398 e!66399)))

(declare-fun c!17585 () Bool)

(assert (=> b!102037 (= c!17585 (and ((_ is Cons!1595) (toList!778 lt!51312)) (not (= (_1!1186 (h!2191 (toList!778 lt!51312))) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))))

(declare-fun b!102038 () Bool)

(assert (=> b!102038 (= e!66399 (getValueByKey!151 (t!5600 (toList!778 lt!51312)) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(assert (= (and d!27581 c!17584) b!102036))

(assert (= (and d!27581 (not c!17584)) b!102037))

(assert (= (and b!102037 c!17585) b!102038))

(assert (= (and b!102037 (not c!17585)) b!102039))

(assert (=> b!102038 m!111961))

(declare-fun m!112843 () Bool)

(assert (=> b!102038 m!112843))

(assert (=> b!101541 d!27581))

(declare-fun d!27583 () Bool)

(assert (=> d!27583 (= (apply!95 lt!51415 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1308 (getValueByKey!151 (toList!778 lt!51415) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4203 () Bool)

(assert (= bs!4203 d!27583))

(assert (=> bs!4203 m!112609))

(assert (=> bs!4203 m!112609))

(declare-fun m!112845 () Bool)

(assert (=> bs!4203 m!112845))

(assert (=> b!101501 d!27583))

(assert (=> b!101451 d!27539))

(assert (=> d!27419 d!27495))

(declare-fun d!27585 () Bool)

(assert (=> d!27585 (isDefined!105 (getValueByKey!151 (toList!778 lt!51312) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(declare-fun lt!51837 () Unit!3090)

(declare-fun choose!641 (List!1599 (_ BitVec 64)) Unit!3090)

(assert (=> d!27585 (= lt!51837 (choose!641 (toList!778 lt!51312) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(declare-fun e!66402 () Bool)

(assert (=> d!27585 e!66402))

(declare-fun res!51080 () Bool)

(assert (=> d!27585 (=> (not res!51080) (not e!66402))))

(declare-fun isStrictlySorted!302 (List!1599) Bool)

(assert (=> d!27585 (= res!51080 (isStrictlySorted!302 (toList!778 lt!51312)))))

(assert (=> d!27585 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!104 (toList!778 lt!51312) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)) lt!51837)))

(declare-fun b!102042 () Bool)

(assert (=> b!102042 (= e!66402 (containsKey!155 (toList!778 lt!51312) (select (arr!2020 (_keys!4234 (v!2835 (underlying!340 thiss!992)))) from!355)))))

(assert (= (and d!27585 res!51080) b!102042))

(assert (=> d!27585 m!111961))

(assert (=> d!27585 m!112193))

(assert (=> d!27585 m!112193))

(assert (=> d!27585 m!112195))

(assert (=> d!27585 m!111961))

(declare-fun m!112847 () Bool)

(assert (=> d!27585 m!112847))

(declare-fun m!112849 () Bool)

(assert (=> d!27585 m!112849))

(assert (=> b!102042 m!111961))

(assert (=> b!102042 m!112189))

(assert (=> b!101539 d!27585))

(assert (=> b!101539 d!27579))

(assert (=> b!101539 d!27581))

(declare-fun bm!10641 () Bool)

(declare-fun call!10644 () Bool)

(assert (=> bm!10641 (= call!10644 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4234 newMap!16) (mask!6657 newMap!16)))))

(declare-fun d!27587 () Bool)

(declare-fun res!51082 () Bool)

(declare-fun e!66405 () Bool)

(assert (=> d!27587 (=> res!51082 e!66405)))

(assert (=> d!27587 (= res!51082 (bvsge #b00000000000000000000000000000000 (size!2274 (_keys!4234 newMap!16))))))

(assert (=> d!27587 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4234 newMap!16) (mask!6657 newMap!16)) e!66405)))

(declare-fun b!102043 () Bool)

(declare-fun e!66404 () Bool)

(assert (=> b!102043 (= e!66404 call!10644)))

(declare-fun b!102044 () Bool)

(declare-fun e!66403 () Bool)

(assert (=> b!102044 (= e!66403 e!66404)))

(declare-fun lt!51838 () (_ BitVec 64))

(assert (=> b!102044 (= lt!51838 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51839 () Unit!3090)

(assert (=> b!102044 (= lt!51839 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4234 newMap!16) lt!51838 #b00000000000000000000000000000000))))

(assert (=> b!102044 (arrayContainsKey!0 (_keys!4234 newMap!16) lt!51838 #b00000000000000000000000000000000)))

(declare-fun lt!51840 () Unit!3090)

(assert (=> b!102044 (= lt!51840 lt!51839)))

(declare-fun res!51081 () Bool)

(assert (=> b!102044 (= res!51081 (= (seekEntryOrOpen!0 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000) (_keys!4234 newMap!16) (mask!6657 newMap!16)) (Found!259 #b00000000000000000000000000000000)))))

(assert (=> b!102044 (=> (not res!51081) (not e!66404))))

(declare-fun b!102045 () Bool)

(assert (=> b!102045 (= e!66403 call!10644)))

(declare-fun b!102046 () Bool)

(assert (=> b!102046 (= e!66405 e!66403)))

(declare-fun c!17586 () Bool)

(assert (=> b!102046 (= c!17586 (validKeyInArray!0 (select (arr!2020 (_keys!4234 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!27587 (not res!51082)) b!102046))

(assert (= (and b!102046 c!17586) b!102044))

(assert (= (and b!102046 (not c!17586)) b!102045))

(assert (= (and b!102044 res!51081) b!102043))

(assert (= (or b!102043 b!102045) bm!10641))

(declare-fun m!112851 () Bool)

(assert (=> bm!10641 m!112851))

(assert (=> b!102044 m!112279))

(declare-fun m!112853 () Bool)

(assert (=> b!102044 m!112853))

(declare-fun m!112855 () Bool)

(assert (=> b!102044 m!112855))

(assert (=> b!102044 m!112279))

(declare-fun m!112857 () Bool)

(assert (=> b!102044 m!112857))

(assert (=> b!102046 m!112279))

(assert (=> b!102046 m!112279))

(assert (=> b!102046 m!112445))

(assert (=> b!101681 d!27587))

(declare-fun mapIsEmpty!3833 () Bool)

(declare-fun mapRes!3833 () Bool)

(assert (=> mapIsEmpty!3833 mapRes!3833))

(declare-fun b!102047 () Bool)

(declare-fun e!66407 () Bool)

(assert (=> b!102047 (= e!66407 tp_is_empty!2647)))

(declare-fun condMapEmpty!3833 () Bool)

(declare-fun mapDefault!3833 () ValueCell!980)

(assert (=> mapNonEmpty!3831 (= condMapEmpty!3833 (= mapRest!3831 ((as const (Array (_ BitVec 32) ValueCell!980)) mapDefault!3833)))))

(declare-fun e!66406 () Bool)

(assert (=> mapNonEmpty!3831 (= tp!9717 (and e!66406 mapRes!3833))))

(declare-fun mapNonEmpty!3833 () Bool)

(declare-fun tp!9719 () Bool)

(assert (=> mapNonEmpty!3833 (= mapRes!3833 (and tp!9719 e!66407))))

(declare-fun mapKey!3833 () (_ BitVec 32))

(declare-fun mapRest!3833 () (Array (_ BitVec 32) ValueCell!980))

(declare-fun mapValue!3833 () ValueCell!980)

(assert (=> mapNonEmpty!3833 (= mapRest!3831 (store mapRest!3833 mapKey!3833 mapValue!3833))))

(declare-fun b!102048 () Bool)

(assert (=> b!102048 (= e!66406 tp_is_empty!2647)))

(assert (= (and mapNonEmpty!3831 condMapEmpty!3833) mapIsEmpty!3833))

(assert (= (and mapNonEmpty!3831 (not condMapEmpty!3833)) mapNonEmpty!3833))

(assert (= (and mapNonEmpty!3833 ((_ is ValueCellFull!980) mapValue!3833)) b!102047))

(assert (= (and mapNonEmpty!3831 ((_ is ValueCellFull!980) mapDefault!3833)) b!102048))

(declare-fun m!112859 () Bool)

(assert (=> mapNonEmpty!3833 m!112859))

(declare-fun mapIsEmpty!3834 () Bool)

(declare-fun mapRes!3834 () Bool)

(assert (=> mapIsEmpty!3834 mapRes!3834))

(declare-fun b!102049 () Bool)

(declare-fun e!66409 () Bool)

(assert (=> b!102049 (= e!66409 tp_is_empty!2647)))

(declare-fun condMapEmpty!3834 () Bool)

(declare-fun mapDefault!3834 () ValueCell!980)

(assert (=> mapNonEmpty!3832 (= condMapEmpty!3834 (= mapRest!3832 ((as const (Array (_ BitVec 32) ValueCell!980)) mapDefault!3834)))))

(declare-fun e!66408 () Bool)

(assert (=> mapNonEmpty!3832 (= tp!9718 (and e!66408 mapRes!3834))))

(declare-fun mapNonEmpty!3834 () Bool)

(declare-fun tp!9720 () Bool)

(assert (=> mapNonEmpty!3834 (= mapRes!3834 (and tp!9720 e!66409))))

(declare-fun mapValue!3834 () ValueCell!980)

(declare-fun mapRest!3834 () (Array (_ BitVec 32) ValueCell!980))

(declare-fun mapKey!3834 () (_ BitVec 32))

(assert (=> mapNonEmpty!3834 (= mapRest!3832 (store mapRest!3834 mapKey!3834 mapValue!3834))))

(declare-fun b!102050 () Bool)

(assert (=> b!102050 (= e!66408 tp_is_empty!2647)))

(assert (= (and mapNonEmpty!3832 condMapEmpty!3834) mapIsEmpty!3834))

(assert (= (and mapNonEmpty!3832 (not condMapEmpty!3834)) mapNonEmpty!3834))

(assert (= (and mapNonEmpty!3834 ((_ is ValueCellFull!980) mapValue!3834)) b!102049))

(assert (= (and mapNonEmpty!3832 ((_ is ValueCellFull!980) mapDefault!3834)) b!102050))

(declare-fun m!112861 () Bool)

(assert (=> mapNonEmpty!3834 m!112861))

(declare-fun b_lambda!4551 () Bool)

(assert (= b_lambda!4543 (or (and b!101289 b_free!2461) (and b!101277 b_free!2463 (= (defaultEntry!2535 newMap!16) (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))))) b_lambda!4551)))

(declare-fun b_lambda!4553 () Bool)

(assert (= b_lambda!4549 (or (and b!101289 b_free!2461 (= (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) (defaultEntry!2535 newMap!16))) (and b!101277 b_free!2463) b_lambda!4553)))

(declare-fun b_lambda!4555 () Bool)

(assert (= b_lambda!4545 (or (and b!101289 b_free!2461 (= (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) (defaultEntry!2535 newMap!16))) (and b!101277 b_free!2463) b_lambda!4555)))

(declare-fun b_lambda!4557 () Bool)

(assert (= b_lambda!4541 (or (and b!101289 b_free!2461) (and b!101277 b_free!2463 (= (defaultEntry!2535 newMap!16) (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))))) b_lambda!4557)))

(declare-fun b_lambda!4559 () Bool)

(assert (= b_lambda!4547 (or (and b!101289 b_free!2461 (= (defaultEntry!2535 (v!2835 (underlying!340 thiss!992))) (defaultEntry!2535 newMap!16))) (and b!101277 b_free!2463) b_lambda!4559)))

(check-sat (not b!101818) (not b!101719) (not d!27555) (not b_lambda!4553) (not b!102000) (not b!102004) (not b_next!2461) (not d!27505) (not d!27531) (not b_lambda!4551) (not b!101925) (not b!101816) (not bm!10595) (not bm!10602) (not b!101991) (not bm!10638) (not b!101824) (not b!101787) (not d!27511) (not b!101710) (not d!27543) (not b!101706) (not b!101928) (not b!101940) (not b!101765) (not d!27575) (not d!27465) (not d!27491) (not b!101703) (not d!27495) (not b!101729) (not b!101766) (not d!27585) (not b!101981) (not b!101938) (not bm!10621) (not b!101800) b_and!6265 (not b!101789) (not bm!10614) (not b!101794) (not b!101707) (not d!27573) (not d!27553) (not b!101711) (not b!101697) (not b!101887) (not b!101771) (not bm!10606) (not d!27517) (not b!101698) (not b!101809) (not d!27527) (not b!101700) (not b!102025) (not d!27473) (not b!101852) (not bm!10613) (not b!102001) (not d!27519) (not b!102046) (not b!101704) (not b!101884) (not bm!10633) (not b!101755) (not b!101761) (not bm!10635) tp_is_empty!2647 (not b!101779) (not d!27569) (not d!27515) (not b!101756) (not bm!10609) (not d!27559) (not b!101845) (not b!101724) (not d!27447) (not b!101841) (not b_lambda!4539) (not b!102042) (not d!27509) (not b!101926) (not d!27467) (not b_lambda!4557) (not d!27537) (not b!101721) (not d!27461) (not bm!10632) (not d!27487) (not b!101881) (not b!101900) (not b!101843) (not bm!10594) (not b!101720) (not b!101935) (not b!101810) (not b!101820) (not b!101772) (not b!101776) (not d!27503) (not b!102015) (not b!101822) (not b!101728) (not d!27563) (not d!27547) (not b_next!2463) (not bm!10600) (not b!101930) (not d!27471) (not bm!10619) (not d!27475) (not d!27469) (not bm!10639) (not d!27485) (not b!101987) (not mapNonEmpty!3834) (not b!101867) (not b!101717) (not b!101768) (not b!101864) (not b!101888) (not b!101879) (not b!101760) (not d!27579) (not b!101792) (not b!101932) b_and!6267 (not d!27477) (not b!101882) (not bm!10596) (not d!27457) (not b!101821) (not b!101793) (not bm!10641) (not b!101804) (not b_lambda!4555) (not b!101893) (not b!102026) (not d!27489) (not b_lambda!4559) (not d!27481) (not d!27493) (not b!101999) (not b!101992) (not b!102038) (not b!101886) (not bm!10607) (not d!27501) (not mapNonEmpty!3833) (not b!101726) (not d!27455) (not b!101709) (not b!101846) (not b!101808) (not b!101712) (not d!27577) (not b!101975) (not b!102007) (not b!101980) (not b!101877) (not b!101869) (not b!102044) (not d!27557) (not b!101982) (not b!101783) (not d!27499) (not d!27521) (not d!27479) (not b!101996) (not b!101725) (not bm!10620) (not b!101759) (not b!101797) (not b!101764) (not d!27583) (not b!101823) (not b!101727) (not d!27483) (not d!27453) (not bm!10599) (not b!101874) (not b!102011) (not bm!10603) (not b!101701) (not b!101876) (not d!27551) (not d!27463) (not bm!10612) (not b_lambda!4535) (not bm!10631) (not bm!10634) (not d!27561) (not b!101994) (not b!101847) (not d!27571) (not b!101773))
(check-sat b_and!6265 b_and!6267 (not b_next!2461) (not b_next!2463))
