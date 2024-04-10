; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10132 () Bool)

(assert start!10132)

(declare-fun b!77009 () Bool)

(declare-fun b_free!2153 () Bool)

(declare-fun b_next!2153 () Bool)

(assert (=> b!77009 (= b_free!2153 (not b_next!2153))))

(declare-fun tp!8656 () Bool)

(declare-fun b_and!4707 () Bool)

(assert (=> b!77009 (= tp!8656 b_and!4707)))

(declare-fun b!77007 () Bool)

(declare-fun b_free!2155 () Bool)

(declare-fun b_next!2155 () Bool)

(assert (=> b!77007 (= b_free!2155 (not b_next!2155))))

(declare-fun tp!8658 () Bool)

(declare-fun b_and!4709 () Bool)

(assert (=> b!77007 (= tp!8658 b_and!4709)))

(declare-fun b!77000 () Bool)

(declare-fun res!40486 () Bool)

(declare-fun e!50277 () Bool)

(assert (=> b!77000 (=> res!40486 e!50277)))

(declare-datatypes ((V!2971 0))(
  ( (V!2972 (val!1291 Int)) )
))
(declare-datatypes ((array!3937 0))(
  ( (array!3938 (arr!1877 (Array (_ BitVec 32) (_ BitVec 64))) (size!2118 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!903 0))(
  ( (ValueCellFull!903 (v!2571 V!2971)) (EmptyCell!903) )
))
(declare-datatypes ((array!3939 0))(
  ( (array!3940 (arr!1878 (Array (_ BitVec 32) ValueCell!903)) (size!2119 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!714 0))(
  ( (LongMapFixedSize!715 (defaultEntry!2260 Int) (mask!6249 (_ BitVec 32)) (extraKeys!2111 (_ BitVec 32)) (zeroValue!2158 V!2971) (minValue!2158 V!2971) (_size!406 (_ BitVec 32)) (_keys!3920 array!3937) (_values!2243 array!3939) (_vacant!406 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!516 0))(
  ( (Cell!517 (v!2572 LongMapFixedSize!714)) )
))
(declare-datatypes ((LongMap!516 0))(
  ( (LongMap!517 (underlying!269 Cell!516)) )
))
(declare-fun thiss!992 () LongMap!516)

(declare-datatypes ((List!1493 0))(
  ( (Nil!1490) (Cons!1489 (h!2077 (_ BitVec 64)) (t!5103 List!1493)) )
))
(declare-fun arrayNoDuplicates!0 (array!3937 (_ BitVec 32) List!1493) Bool)

(assert (=> b!77000 (= res!40486 (not (arrayNoDuplicates!0 (_keys!3920 (v!2572 (underlying!269 thiss!992))) #b00000000000000000000000000000000 Nil!1490)))))

(declare-fun b!77001 () Bool)

(declare-fun e!50278 () Bool)

(declare-fun e!50280 () Bool)

(declare-fun mapRes!3246 () Bool)

(assert (=> b!77001 (= e!50278 (and e!50280 mapRes!3246))))

(declare-fun condMapEmpty!3245 () Bool)

(declare-fun mapDefault!3246 () ValueCell!903)

(assert (=> b!77001 (= condMapEmpty!3245 (= (arr!1878 (_values!2243 (v!2572 (underlying!269 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!903)) mapDefault!3246)))))

(declare-fun mapIsEmpty!3245 () Bool)

(assert (=> mapIsEmpty!3245 mapRes!3246))

(declare-fun b!77002 () Bool)

(declare-fun e!50285 () Bool)

(declare-fun e!50289 () Bool)

(declare-fun mapRes!3245 () Bool)

(assert (=> b!77002 (= e!50285 (and e!50289 mapRes!3245))))

(declare-fun condMapEmpty!3246 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!714)

(declare-fun mapDefault!3245 () ValueCell!903)

(assert (=> b!77002 (= condMapEmpty!3246 (= (arr!1878 (_values!2243 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!903)) mapDefault!3245)))))

(declare-fun b!77003 () Bool)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!77003 (= e!50277 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000))))

(declare-fun b!77004 () Bool)

(declare-fun e!50276 () Bool)

(declare-fun e!50275 () Bool)

(assert (=> b!77004 (= e!50276 e!50275)))

(declare-fun b!77005 () Bool)

(declare-fun res!40487 () Bool)

(assert (=> b!77005 (=> res!40487 e!50277)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3937 (_ BitVec 32)) Bool)

(assert (=> b!77005 (= res!40487 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3920 (v!2572 (underlying!269 thiss!992))) (mask!6249 (v!2572 (underlying!269 thiss!992))))))))

(declare-fun mapIsEmpty!3246 () Bool)

(assert (=> mapIsEmpty!3246 mapRes!3245))

(declare-fun mapNonEmpty!3245 () Bool)

(declare-fun tp!8655 () Bool)

(declare-fun e!50281 () Bool)

(assert (=> mapNonEmpty!3245 (= mapRes!3245 (and tp!8655 e!50281))))

(declare-fun mapRest!3245 () (Array (_ BitVec 32) ValueCell!903))

(declare-fun mapKey!3246 () (_ BitVec 32))

(declare-fun mapValue!3245 () ValueCell!903)

(assert (=> mapNonEmpty!3245 (= (arr!1878 (_values!2243 newMap!16)) (store mapRest!3245 mapKey!3246 mapValue!3245))))

(declare-fun b!77006 () Bool)

(declare-fun e!50274 () Bool)

(assert (=> b!77006 (= e!50274 (not e!50277))))

(declare-fun res!40495 () Bool)

(assert (=> b!77006 (=> res!40495 e!50277)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!77006 (= res!40495 (not (validMask!0 (mask!6249 (v!2572 (underlying!269 thiss!992))))))))

(declare-datatypes ((tuple2!2148 0))(
  ( (tuple2!2149 (_1!1085 (_ BitVec 64)) (_2!1085 V!2971)) )
))
(declare-datatypes ((List!1494 0))(
  ( (Nil!1491) (Cons!1490 (h!2078 tuple2!2148) (t!5104 List!1494)) )
))
(declare-datatypes ((ListLongMap!1433 0))(
  ( (ListLongMap!1434 (toList!732 List!1494)) )
))
(declare-fun lt!35223 () ListLongMap!1433)

(declare-fun lt!35224 () tuple2!2148)

(declare-fun lt!35222 () tuple2!2148)

(declare-fun +!100 (ListLongMap!1433 tuple2!2148) ListLongMap!1433)

(assert (=> b!77006 (= (+!100 (+!100 lt!35223 lt!35224) lt!35222) (+!100 (+!100 lt!35223 lt!35222) lt!35224))))

(assert (=> b!77006 (= lt!35222 (tuple2!2149 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2158 (v!2572 (underlying!269 thiss!992)))))))

(declare-fun lt!35221 () V!2971)

(assert (=> b!77006 (= lt!35224 (tuple2!2149 (select (arr!1877 (_keys!3920 (v!2572 (underlying!269 thiss!992)))) from!355) lt!35221))))

(declare-datatypes ((Unit!2226 0))(
  ( (Unit!2227) )
))
(declare-fun lt!35216 () Unit!2226)

(declare-fun addCommutativeForDiffKeys!19 (ListLongMap!1433 (_ BitVec 64) V!2971 (_ BitVec 64) V!2971) Unit!2226)

(assert (=> b!77006 (= lt!35216 (addCommutativeForDiffKeys!19 lt!35223 (select (arr!1877 (_keys!3920 (v!2572 (underlying!269 thiss!992)))) from!355) lt!35221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2158 (v!2572 (underlying!269 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!65 (array!3937 array!3939 (_ BitVec 32) (_ BitVec 32) V!2971 V!2971 (_ BitVec 32) Int) ListLongMap!1433)

(assert (=> b!77006 (= lt!35223 (getCurrentListMapNoExtraKeys!65 (_keys!3920 (v!2572 (underlying!269 thiss!992))) (_values!2243 (v!2572 (underlying!269 thiss!992))) (mask!6249 (v!2572 (underlying!269 thiss!992))) (extraKeys!2111 (v!2572 (underlying!269 thiss!992))) (zeroValue!2158 (v!2572 (underlying!269 thiss!992))) (minValue!2158 (v!2572 (underlying!269 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2260 (v!2572 (underlying!269 thiss!992)))))))

(declare-fun e!50283 () Bool)

(declare-fun tp_is_empty!2493 () Bool)

(declare-fun array_inv!1159 (array!3937) Bool)

(declare-fun array_inv!1160 (array!3939) Bool)

(assert (=> b!77007 (= e!50283 (and tp!8658 tp_is_empty!2493 (array_inv!1159 (_keys!3920 newMap!16)) (array_inv!1160 (_values!2243 newMap!16)) e!50285))))

(declare-fun b!77008 () Bool)

(declare-fun res!40488 () Bool)

(assert (=> b!77008 (=> res!40488 e!50277)))

(assert (=> b!77008 (= res!40488 (or (not (= (size!2119 (_values!2243 (v!2572 (underlying!269 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6249 (v!2572 (underlying!269 thiss!992)))))) (not (= (size!2118 (_keys!3920 (v!2572 (underlying!269 thiss!992)))) (size!2119 (_values!2243 (v!2572 (underlying!269 thiss!992)))))) (bvslt (mask!6249 (v!2572 (underlying!269 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2111 (v!2572 (underlying!269 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2111 (v!2572 (underlying!269 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun res!40485 () Bool)

(declare-fun e!50284 () Bool)

(assert (=> start!10132 (=> (not res!40485) (not e!50284))))

(declare-fun valid!302 (LongMap!516) Bool)

(assert (=> start!10132 (= res!40485 (valid!302 thiss!992))))

(assert (=> start!10132 e!50284))

(assert (=> start!10132 e!50276))

(assert (=> start!10132 true))

(assert (=> start!10132 e!50283))

(declare-fun e!50282 () Bool)

(assert (=> b!77009 (= e!50282 (and tp!8656 tp_is_empty!2493 (array_inv!1159 (_keys!3920 (v!2572 (underlying!269 thiss!992)))) (array_inv!1160 (_values!2243 (v!2572 (underlying!269 thiss!992)))) e!50278))))

(declare-fun b!77010 () Bool)

(declare-fun e!50287 () Bool)

(declare-fun e!50272 () Bool)

(assert (=> b!77010 (= e!50287 e!50272)))

(declare-fun res!40493 () Bool)

(assert (=> b!77010 (=> (not res!40493) (not e!50272))))

(assert (=> b!77010 (= res!40493 (and (not (= (select (arr!1877 (_keys!3920 (v!2572 (underlying!269 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1877 (_keys!3920 (v!2572 (underlying!269 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1161 (ValueCell!903 V!2971) V!2971)

(declare-fun dynLambda!332 (Int (_ BitVec 64)) V!2971)

(assert (=> b!77010 (= lt!35221 (get!1161 (select (arr!1878 (_values!2243 (v!2572 (underlying!269 thiss!992)))) from!355) (dynLambda!332 (defaultEntry!2260 (v!2572 (underlying!269 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!77011 () Bool)

(assert (=> b!77011 (= e!50280 tp_is_empty!2493)))

(declare-fun b!77012 () Bool)

(declare-fun e!50288 () Bool)

(assert (=> b!77012 (= e!50288 tp_is_empty!2493)))

(declare-fun b!77013 () Bool)

(assert (=> b!77013 (= e!50281 tp_is_empty!2493)))

(declare-fun mapNonEmpty!3246 () Bool)

(declare-fun tp!8657 () Bool)

(assert (=> mapNonEmpty!3246 (= mapRes!3246 (and tp!8657 e!50288))))

(declare-fun mapKey!3245 () (_ BitVec 32))

(declare-fun mapValue!3246 () ValueCell!903)

(declare-fun mapRest!3246 () (Array (_ BitVec 32) ValueCell!903))

(assert (=> mapNonEmpty!3246 (= (arr!1878 (_values!2243 (v!2572 (underlying!269 thiss!992)))) (store mapRest!3246 mapKey!3245 mapValue!3246))))

(declare-fun b!77014 () Bool)

(declare-fun e!50279 () Unit!2226)

(declare-fun Unit!2228 () Unit!2226)

(assert (=> b!77014 (= e!50279 Unit!2228)))

(declare-fun lt!35220 () Unit!2226)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!55 (array!3937 array!3939 (_ BitVec 32) (_ BitVec 32) V!2971 V!2971 (_ BitVec 64) (_ BitVec 32) Int) Unit!2226)

(assert (=> b!77014 (= lt!35220 (lemmaListMapContainsThenArrayContainsFrom!55 (_keys!3920 (v!2572 (underlying!269 thiss!992))) (_values!2243 (v!2572 (underlying!269 thiss!992))) (mask!6249 (v!2572 (underlying!269 thiss!992))) (extraKeys!2111 (v!2572 (underlying!269 thiss!992))) (zeroValue!2158 (v!2572 (underlying!269 thiss!992))) (minValue!2158 (v!2572 (underlying!269 thiss!992))) (select (arr!1877 (_keys!3920 (v!2572 (underlying!269 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2260 (v!2572 (underlying!269 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3937 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!77014 (arrayContainsKey!0 (_keys!3920 (v!2572 (underlying!269 thiss!992))) (select (arr!1877 (_keys!3920 (v!2572 (underlying!269 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!35225 () Unit!2226)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3937 (_ BitVec 32) (_ BitVec 32)) Unit!2226)

(assert (=> b!77014 (= lt!35225 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3920 (v!2572 (underlying!269 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> b!77014 (arrayNoDuplicates!0 (_keys!3920 (v!2572 (underlying!269 thiss!992))) from!355 Nil!1490)))

(declare-fun lt!35219 () Unit!2226)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3937 (_ BitVec 32) (_ BitVec 64) List!1493) Unit!2226)

(assert (=> b!77014 (= lt!35219 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3920 (v!2572 (underlying!269 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1877 (_keys!3920 (v!2572 (underlying!269 thiss!992)))) from!355) (Cons!1489 (select (arr!1877 (_keys!3920 (v!2572 (underlying!269 thiss!992)))) from!355) Nil!1490)))))

(assert (=> b!77014 false))

(declare-fun b!77015 () Bool)

(declare-fun res!40490 () Bool)

(assert (=> b!77015 (=> (not res!40490) (not e!50284))))

(declare-fun valid!303 (LongMapFixedSize!714) Bool)

(assert (=> b!77015 (= res!40490 (valid!303 newMap!16))))

(declare-fun b!77016 () Bool)

(declare-fun res!40489 () Bool)

(assert (=> b!77016 (=> (not res!40489) (not e!50284))))

(assert (=> b!77016 (= res!40489 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2118 (_keys!3920 (v!2572 (underlying!269 thiss!992)))))))))

(declare-fun b!77017 () Bool)

(declare-fun res!40492 () Bool)

(assert (=> b!77017 (=> (not res!40492) (not e!50284))))

(assert (=> b!77017 (= res!40492 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6249 newMap!16)) (_size!406 (v!2572 (underlying!269 thiss!992)))))))

(declare-fun b!77018 () Bool)

(assert (=> b!77018 (= e!50289 tp_is_empty!2493)))

(declare-fun b!77019 () Bool)

(assert (=> b!77019 (= e!50272 e!50274)))

(declare-fun res!40494 () Bool)

(assert (=> b!77019 (=> (not res!40494) (not e!50274))))

(declare-datatypes ((tuple2!2150 0))(
  ( (tuple2!2151 (_1!1086 Bool) (_2!1086 LongMapFixedSize!714)) )
))
(declare-fun lt!35226 () tuple2!2150)

(assert (=> b!77019 (= res!40494 (and (_1!1086 lt!35226) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!35218 () Unit!2226)

(assert (=> b!77019 (= lt!35218 e!50279)))

(declare-fun c!11787 () Bool)

(declare-fun lt!35227 () ListLongMap!1433)

(declare-fun contains!735 (ListLongMap!1433 (_ BitVec 64)) Bool)

(assert (=> b!77019 (= c!11787 (contains!735 lt!35227 (select (arr!1877 (_keys!3920 (v!2572 (underlying!269 thiss!992)))) from!355)))))

(declare-fun update!102 (LongMapFixedSize!714 (_ BitVec 64) V!2971) tuple2!2150)

(assert (=> b!77019 (= lt!35226 (update!102 newMap!16 (select (arr!1877 (_keys!3920 (v!2572 (underlying!269 thiss!992)))) from!355) lt!35221))))

(declare-fun b!77020 () Bool)

(assert (=> b!77020 (= e!50284 e!50287)))

(declare-fun res!40491 () Bool)

(assert (=> b!77020 (=> (not res!40491) (not e!50287))))

(declare-fun lt!35217 () ListLongMap!1433)

(assert (=> b!77020 (= res!40491 (= lt!35217 lt!35227))))

(declare-fun map!1162 (LongMapFixedSize!714) ListLongMap!1433)

(assert (=> b!77020 (= lt!35227 (map!1162 newMap!16))))

(declare-fun getCurrentListMap!427 (array!3937 array!3939 (_ BitVec 32) (_ BitVec 32) V!2971 V!2971 (_ BitVec 32) Int) ListLongMap!1433)

(assert (=> b!77020 (= lt!35217 (getCurrentListMap!427 (_keys!3920 (v!2572 (underlying!269 thiss!992))) (_values!2243 (v!2572 (underlying!269 thiss!992))) (mask!6249 (v!2572 (underlying!269 thiss!992))) (extraKeys!2111 (v!2572 (underlying!269 thiss!992))) (zeroValue!2158 (v!2572 (underlying!269 thiss!992))) (minValue!2158 (v!2572 (underlying!269 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2260 (v!2572 (underlying!269 thiss!992)))))))

(declare-fun b!77021 () Bool)

(assert (=> b!77021 (= e!50275 e!50282)))

(declare-fun b!77022 () Bool)

(declare-fun Unit!2229 () Unit!2226)

(assert (=> b!77022 (= e!50279 Unit!2229)))

(assert (= (and start!10132 res!40485) b!77016))

(assert (= (and b!77016 res!40489) b!77015))

(assert (= (and b!77015 res!40490) b!77017))

(assert (= (and b!77017 res!40492) b!77020))

(assert (= (and b!77020 res!40491) b!77010))

(assert (= (and b!77010 res!40493) b!77019))

(assert (= (and b!77019 c!11787) b!77014))

(assert (= (and b!77019 (not c!11787)) b!77022))

(assert (= (and b!77019 res!40494) b!77006))

(assert (= (and b!77006 (not res!40495)) b!77008))

(assert (= (and b!77008 (not res!40488)) b!77005))

(assert (= (and b!77005 (not res!40487)) b!77000))

(assert (= (and b!77000 (not res!40486)) b!77003))

(assert (= (and b!77001 condMapEmpty!3245) mapIsEmpty!3245))

(assert (= (and b!77001 (not condMapEmpty!3245)) mapNonEmpty!3246))

(get-info :version)

(assert (= (and mapNonEmpty!3246 ((_ is ValueCellFull!903) mapValue!3246)) b!77012))

(assert (= (and b!77001 ((_ is ValueCellFull!903) mapDefault!3246)) b!77011))

(assert (= b!77009 b!77001))

(assert (= b!77021 b!77009))

(assert (= b!77004 b!77021))

(assert (= start!10132 b!77004))

(assert (= (and b!77002 condMapEmpty!3246) mapIsEmpty!3246))

(assert (= (and b!77002 (not condMapEmpty!3246)) mapNonEmpty!3245))

(assert (= (and mapNonEmpty!3245 ((_ is ValueCellFull!903) mapValue!3245)) b!77013))

(assert (= (and b!77002 ((_ is ValueCellFull!903) mapDefault!3245)) b!77018))

(assert (= b!77007 b!77002))

(assert (= start!10132 b!77007))

(declare-fun b_lambda!3457 () Bool)

(assert (=> (not b_lambda!3457) (not b!77010)))

(declare-fun t!5100 () Bool)

(declare-fun tb!1581 () Bool)

(assert (=> (and b!77009 (= (defaultEntry!2260 (v!2572 (underlying!269 thiss!992))) (defaultEntry!2260 (v!2572 (underlying!269 thiss!992)))) t!5100) tb!1581))

(declare-fun result!2755 () Bool)

(assert (=> tb!1581 (= result!2755 tp_is_empty!2493)))

(assert (=> b!77010 t!5100))

(declare-fun b_and!4711 () Bool)

(assert (= b_and!4707 (and (=> t!5100 result!2755) b_and!4711)))

(declare-fun t!5102 () Bool)

(declare-fun tb!1583 () Bool)

(assert (=> (and b!77007 (= (defaultEntry!2260 newMap!16) (defaultEntry!2260 (v!2572 (underlying!269 thiss!992)))) t!5102) tb!1583))

(declare-fun result!2759 () Bool)

(assert (= result!2759 result!2755))

(assert (=> b!77010 t!5102))

(declare-fun b_and!4713 () Bool)

(assert (= b_and!4709 (and (=> t!5102 result!2759) b_and!4713)))

(declare-fun m!77145 () Bool)

(assert (=> b!77005 m!77145))

(declare-fun m!77147 () Bool)

(assert (=> b!77000 m!77147))

(declare-fun m!77149 () Bool)

(assert (=> b!77020 m!77149))

(declare-fun m!77151 () Bool)

(assert (=> b!77020 m!77151))

(declare-fun m!77153 () Bool)

(assert (=> b!77014 m!77153))

(declare-fun m!77155 () Bool)

(assert (=> b!77014 m!77155))

(declare-fun m!77157 () Bool)

(assert (=> b!77014 m!77157))

(declare-fun m!77159 () Bool)

(assert (=> b!77014 m!77159))

(assert (=> b!77014 m!77157))

(assert (=> b!77014 m!77157))

(declare-fun m!77161 () Bool)

(assert (=> b!77014 m!77161))

(assert (=> b!77014 m!77157))

(declare-fun m!77163 () Bool)

(assert (=> b!77014 m!77163))

(declare-fun m!77165 () Bool)

(assert (=> b!77006 m!77165))

(declare-fun m!77167 () Bool)

(assert (=> b!77006 m!77167))

(declare-fun m!77169 () Bool)

(assert (=> b!77006 m!77169))

(declare-fun m!77171 () Bool)

(assert (=> b!77006 m!77171))

(declare-fun m!77173 () Bool)

(assert (=> b!77006 m!77173))

(assert (=> b!77006 m!77165))

(assert (=> b!77006 m!77157))

(assert (=> b!77006 m!77169))

(assert (=> b!77006 m!77157))

(declare-fun m!77175 () Bool)

(assert (=> b!77006 m!77175))

(declare-fun m!77177 () Bool)

(assert (=> b!77006 m!77177))

(declare-fun m!77179 () Bool)

(assert (=> b!77009 m!77179))

(declare-fun m!77181 () Bool)

(assert (=> b!77009 m!77181))

(declare-fun m!77183 () Bool)

(assert (=> b!77007 m!77183))

(declare-fun m!77185 () Bool)

(assert (=> b!77007 m!77185))

(declare-fun m!77187 () Bool)

(assert (=> b!77015 m!77187))

(declare-fun m!77189 () Bool)

(assert (=> mapNonEmpty!3245 m!77189))

(declare-fun m!77191 () Bool)

(assert (=> mapNonEmpty!3246 m!77191))

(declare-fun m!77193 () Bool)

(assert (=> start!10132 m!77193))

(assert (=> b!77019 m!77157))

(assert (=> b!77019 m!77157))

(declare-fun m!77195 () Bool)

(assert (=> b!77019 m!77195))

(assert (=> b!77019 m!77157))

(declare-fun m!77197 () Bool)

(assert (=> b!77019 m!77197))

(assert (=> b!77010 m!77157))

(declare-fun m!77199 () Bool)

(assert (=> b!77010 m!77199))

(declare-fun m!77201 () Bool)

(assert (=> b!77010 m!77201))

(assert (=> b!77010 m!77199))

(assert (=> b!77010 m!77201))

(declare-fun m!77203 () Bool)

(assert (=> b!77010 m!77203))

(check-sat b_and!4711 (not b!77005) (not b!77009) (not b_next!2153) (not b!77010) (not b!77006) (not b!77007) (not b!77019) (not b_next!2155) (not b!77000) (not b!77020) (not start!10132) (not mapNonEmpty!3246) (not mapNonEmpty!3245) b_and!4713 tp_is_empty!2493 (not b_lambda!3457) (not b!77014) (not b!77015))
(check-sat b_and!4711 b_and!4713 (not b_next!2153) (not b_next!2155))
