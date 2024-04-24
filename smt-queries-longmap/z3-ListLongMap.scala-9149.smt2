; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109958 () Bool)

(assert start!109958)

(declare-fun b_free!29167 () Bool)

(declare-fun b_next!29167 () Bool)

(assert (=> start!109958 (= b_free!29167 (not b_next!29167))))

(declare-fun tp!102628 () Bool)

(declare-fun b_and!47271 () Bool)

(assert (=> start!109958 (= tp!102628 b_and!47271)))

(declare-fun b!1301157 () Bool)

(declare-fun res!864338 () Bool)

(declare-fun e!742357 () Bool)

(assert (=> b!1301157 (=> (not res!864338) (not e!742357))))

(declare-datatypes ((array!86663 0))(
  ( (array!86664 (arr!41825 (Array (_ BitVec 32) (_ BitVec 64))) (size!42376 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86663)

(declare-datatypes ((List!29717 0))(
  ( (Nil!29714) (Cons!29713 (h!30931 (_ BitVec 64)) (t!43279 List!29717)) )
))
(declare-fun arrayNoDuplicates!0 (array!86663 (_ BitVec 32) List!29717) Bool)

(assert (=> b!1301157 (= res!864338 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29714))))

(declare-fun b!1301158 () Bool)

(declare-fun res!864344 () Bool)

(assert (=> b!1301158 (=> (not res!864344) (not e!742357))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1301158 (= res!864344 (validKeyInArray!0 (select (arr!41825 _keys!1741) from!2144)))))

(declare-fun res!864343 () Bool)

(assert (=> start!109958 (=> (not res!864343) (not e!742357))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109958 (= res!864343 (validMask!0 mask!2175))))

(assert (=> start!109958 e!742357))

(declare-fun tp_is_empty!34807 () Bool)

(assert (=> start!109958 tp_is_empty!34807))

(assert (=> start!109958 true))

(declare-datatypes ((V!51513 0))(
  ( (V!51514 (val!17478 Int)) )
))
(declare-datatypes ((ValueCell!16505 0))(
  ( (ValueCellFull!16505 (v!20079 V!51513)) (EmptyCell!16505) )
))
(declare-datatypes ((array!86665 0))(
  ( (array!86666 (arr!41826 (Array (_ BitVec 32) ValueCell!16505)) (size!42377 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86665)

(declare-fun e!742358 () Bool)

(declare-fun array_inv!31887 (array!86665) Bool)

(assert (=> start!109958 (and (array_inv!31887 _values!1445) e!742358)))

(declare-fun array_inv!31888 (array!86663) Bool)

(assert (=> start!109958 (array_inv!31888 _keys!1741)))

(assert (=> start!109958 tp!102628))

(declare-fun b!1301159 () Bool)

(declare-fun res!864342 () Bool)

(assert (=> b!1301159 (=> (not res!864342) (not e!742357))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86663 (_ BitVec 32)) Bool)

(assert (=> b!1301159 (= res!864342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1301160 () Bool)

(declare-fun res!864339 () Bool)

(assert (=> b!1301160 (=> (not res!864339) (not e!742357))))

(assert (=> b!1301160 (= res!864339 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42376 _keys!1741))))))

(declare-fun mapIsEmpty!53780 () Bool)

(declare-fun mapRes!53780 () Bool)

(assert (=> mapIsEmpty!53780 mapRes!53780))

(declare-fun mapNonEmpty!53780 () Bool)

(declare-fun tp!102629 () Bool)

(declare-fun e!742354 () Bool)

(assert (=> mapNonEmpty!53780 (= mapRes!53780 (and tp!102629 e!742354))))

(declare-fun mapKey!53780 () (_ BitVec 32))

(declare-fun mapValue!53780 () ValueCell!16505)

(declare-fun mapRest!53780 () (Array (_ BitVec 32) ValueCell!16505))

(assert (=> mapNonEmpty!53780 (= (arr!41826 _values!1445) (store mapRest!53780 mapKey!53780 mapValue!53780))))

(declare-fun b!1301161 () Bool)

(assert (=> b!1301161 (= e!742354 tp_is_empty!34807)))

(declare-fun minValue!1387 () V!51513)

(declare-fun zeroValue!1387 () V!51513)

(declare-fun b!1301162 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22558 0))(
  ( (tuple2!22559 (_1!11290 (_ BitVec 64)) (_2!11290 V!51513)) )
))
(declare-datatypes ((List!29718 0))(
  ( (Nil!29715) (Cons!29714 (h!30932 tuple2!22558) (t!43280 List!29718)) )
))
(declare-datatypes ((ListLongMap!20223 0))(
  ( (ListLongMap!20224 (toList!10127 List!29718)) )
))
(declare-fun contains!8261 (ListLongMap!20223 (_ BitVec 64)) Bool)

(declare-fun +!4499 (ListLongMap!20223 tuple2!22558) ListLongMap!20223)

(declare-fun getCurrentListMapNoExtraKeys!6139 (array!86663 array!86665 (_ BitVec 32) (_ BitVec 32) V!51513 V!51513 (_ BitVec 32) Int) ListLongMap!20223)

(assert (=> b!1301162 (= e!742357 (not (contains!8261 (+!4499 (getCurrentListMapNoExtraKeys!6139 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205)))))

(declare-fun b!1301163 () Bool)

(declare-fun res!864346 () Bool)

(assert (=> b!1301163 (=> (not res!864346) (not e!742357))))

(assert (=> b!1301163 (= res!864346 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!1301164 () Bool)

(declare-fun res!864340 () Bool)

(assert (=> b!1301164 (=> (not res!864340) (not e!742357))))

(assert (=> b!1301164 (= res!864340 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42376 _keys!1741))))))

(declare-fun b!1301165 () Bool)

(declare-fun e!742355 () Bool)

(assert (=> b!1301165 (= e!742358 (and e!742355 mapRes!53780))))

(declare-fun condMapEmpty!53780 () Bool)

(declare-fun mapDefault!53780 () ValueCell!16505)

(assert (=> b!1301165 (= condMapEmpty!53780 (= (arr!41826 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16505)) mapDefault!53780)))))

(declare-fun b!1301166 () Bool)

(assert (=> b!1301166 (= e!742355 tp_is_empty!34807)))

(declare-fun b!1301167 () Bool)

(declare-fun res!864345 () Bool)

(assert (=> b!1301167 (=> (not res!864345) (not e!742357))))

(assert (=> b!1301167 (= res!864345 (and (= (size!42377 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42376 _keys!1741) (size!42377 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1301168 () Bool)

(declare-fun res!864341 () Bool)

(assert (=> b!1301168 (=> (not res!864341) (not e!742357))))

(declare-fun getCurrentListMap!5144 (array!86663 array!86665 (_ BitVec 32) (_ BitVec 32) V!51513 V!51513 (_ BitVec 32) Int) ListLongMap!20223)

(assert (=> b!1301168 (= res!864341 (contains!8261 (getCurrentListMap!5144 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109958 res!864343) b!1301167))

(assert (= (and b!1301167 res!864345) b!1301159))

(assert (= (and b!1301159 res!864342) b!1301157))

(assert (= (and b!1301157 res!864338) b!1301160))

(assert (= (and b!1301160 res!864339) b!1301168))

(assert (= (and b!1301168 res!864341) b!1301164))

(assert (= (and b!1301164 res!864340) b!1301158))

(assert (= (and b!1301158 res!864344) b!1301163))

(assert (= (and b!1301163 res!864346) b!1301162))

(assert (= (and b!1301165 condMapEmpty!53780) mapIsEmpty!53780))

(assert (= (and b!1301165 (not condMapEmpty!53780)) mapNonEmpty!53780))

(get-info :version)

(assert (= (and mapNonEmpty!53780 ((_ is ValueCellFull!16505) mapValue!53780)) b!1301161))

(assert (= (and b!1301165 ((_ is ValueCellFull!16505) mapDefault!53780)) b!1301166))

(assert (= start!109958 b!1301165))

(declare-fun m!1192551 () Bool)

(assert (=> b!1301168 m!1192551))

(assert (=> b!1301168 m!1192551))

(declare-fun m!1192553 () Bool)

(assert (=> b!1301168 m!1192553))

(declare-fun m!1192555 () Bool)

(assert (=> b!1301157 m!1192555))

(declare-fun m!1192557 () Bool)

(assert (=> mapNonEmpty!53780 m!1192557))

(declare-fun m!1192559 () Bool)

(assert (=> b!1301158 m!1192559))

(assert (=> b!1301158 m!1192559))

(declare-fun m!1192561 () Bool)

(assert (=> b!1301158 m!1192561))

(declare-fun m!1192563 () Bool)

(assert (=> b!1301159 m!1192563))

(declare-fun m!1192565 () Bool)

(assert (=> b!1301162 m!1192565))

(assert (=> b!1301162 m!1192565))

(declare-fun m!1192567 () Bool)

(assert (=> b!1301162 m!1192567))

(assert (=> b!1301162 m!1192567))

(declare-fun m!1192569 () Bool)

(assert (=> b!1301162 m!1192569))

(declare-fun m!1192571 () Bool)

(assert (=> start!109958 m!1192571))

(declare-fun m!1192573 () Bool)

(assert (=> start!109958 m!1192573))

(declare-fun m!1192575 () Bool)

(assert (=> start!109958 m!1192575))

(check-sat (not b_next!29167) tp_is_empty!34807 (not start!109958) (not b!1301168) (not b!1301158) b_and!47271 (not b!1301159) (not b!1301157) (not mapNonEmpty!53780) (not b!1301162))
(check-sat b_and!47271 (not b_next!29167))
(get-model)

(declare-fun d!141579 () Bool)

(declare-fun e!742394 () Bool)

(assert (=> d!141579 e!742394))

(declare-fun res!864403 () Bool)

(assert (=> d!141579 (=> res!864403 e!742394)))

(declare-fun lt!581631 () Bool)

(assert (=> d!141579 (= res!864403 (not lt!581631))))

(declare-fun lt!581630 () Bool)

(assert (=> d!141579 (= lt!581631 lt!581630)))

(declare-datatypes ((Unit!42998 0))(
  ( (Unit!42999) )
))
(declare-fun lt!581632 () Unit!42998)

(declare-fun e!742393 () Unit!42998)

(assert (=> d!141579 (= lt!581632 e!742393)))

(declare-fun c!124921 () Bool)

(assert (=> d!141579 (= c!124921 lt!581630)))

(declare-fun containsKey!720 (List!29718 (_ BitVec 64)) Bool)

(assert (=> d!141579 (= lt!581630 (containsKey!720 (toList!10127 (getCurrentListMap!5144 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141579 (= (contains!8261 (getCurrentListMap!5144 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!581631)))

(declare-fun b!1301247 () Bool)

(declare-fun lt!581629 () Unit!42998)

(assert (=> b!1301247 (= e!742393 lt!581629)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!466 (List!29718 (_ BitVec 64)) Unit!42998)

(assert (=> b!1301247 (= lt!581629 (lemmaContainsKeyImpliesGetValueByKeyDefined!466 (toList!10127 (getCurrentListMap!5144 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-datatypes ((Option!745 0))(
  ( (Some!744 (v!20082 V!51513)) (None!743) )
))
(declare-fun isDefined!503 (Option!745) Bool)

(declare-fun getValueByKey!694 (List!29718 (_ BitVec 64)) Option!745)

(assert (=> b!1301247 (isDefined!503 (getValueByKey!694 (toList!10127 (getCurrentListMap!5144 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1301248 () Bool)

(declare-fun Unit!43000 () Unit!42998)

(assert (=> b!1301248 (= e!742393 Unit!43000)))

(declare-fun b!1301249 () Bool)

(assert (=> b!1301249 (= e!742394 (isDefined!503 (getValueByKey!694 (toList!10127 (getCurrentListMap!5144 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141579 c!124921) b!1301247))

(assert (= (and d!141579 (not c!124921)) b!1301248))

(assert (= (and d!141579 (not res!864403)) b!1301249))

(declare-fun m!1192629 () Bool)

(assert (=> d!141579 m!1192629))

(declare-fun m!1192631 () Bool)

(assert (=> b!1301247 m!1192631))

(declare-fun m!1192633 () Bool)

(assert (=> b!1301247 m!1192633))

(assert (=> b!1301247 m!1192633))

(declare-fun m!1192635 () Bool)

(assert (=> b!1301247 m!1192635))

(assert (=> b!1301249 m!1192633))

(assert (=> b!1301249 m!1192633))

(assert (=> b!1301249 m!1192635))

(assert (=> b!1301168 d!141579))

(declare-fun b!1301292 () Bool)

(declare-fun res!864424 () Bool)

(declare-fun e!742424 () Bool)

(assert (=> b!1301292 (=> (not res!864424) (not e!742424))))

(declare-fun e!742422 () Bool)

(assert (=> b!1301292 (= res!864424 e!742422)))

(declare-fun res!864422 () Bool)

(assert (=> b!1301292 (=> res!864422 e!742422)))

(declare-fun e!742421 () Bool)

(assert (=> b!1301292 (= res!864422 (not e!742421))))

(declare-fun res!864425 () Bool)

(assert (=> b!1301292 (=> (not res!864425) (not e!742421))))

(assert (=> b!1301292 (= res!864425 (bvslt from!2144 (size!42376 _keys!1741)))))

(declare-fun b!1301293 () Bool)

(assert (=> b!1301293 (= e!742421 (validKeyInArray!0 (select (arr!41825 _keys!1741) from!2144)))))

(declare-fun b!1301294 () Bool)

(declare-fun e!742427 () Bool)

(assert (=> b!1301294 (= e!742424 e!742427)))

(declare-fun c!124939 () Bool)

(assert (=> b!1301294 (= c!124939 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!63686 () ListLongMap!20223)

(declare-fun c!124934 () Bool)

(declare-fun c!124938 () Bool)

(declare-fun call!63684 () ListLongMap!20223)

(declare-fun bm!63677 () Bool)

(declare-fun call!63681 () ListLongMap!20223)

(declare-fun call!63683 () ListLongMap!20223)

(assert (=> bm!63677 (= call!63683 (+!4499 (ite c!124938 call!63681 (ite c!124934 call!63686 call!63684)) (ite (or c!124938 c!124934) (tuple2!22559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22559 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1301295 () Bool)

(declare-fun e!742431 () Bool)

(assert (=> b!1301295 (= e!742427 e!742431)))

(declare-fun res!864428 () Bool)

(declare-fun call!63682 () Bool)

(assert (=> b!1301295 (= res!864428 call!63682)))

(assert (=> b!1301295 (=> (not res!864428) (not e!742431))))

(declare-fun b!1301296 () Bool)

(declare-fun c!124935 () Bool)

(assert (=> b!1301296 (= c!124935 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!742430 () ListLongMap!20223)

(declare-fun e!742426 () ListLongMap!20223)

(assert (=> b!1301296 (= e!742430 e!742426)))

(declare-fun d!141581 () Bool)

(assert (=> d!141581 e!742424))

(declare-fun res!864427 () Bool)

(assert (=> d!141581 (=> (not res!864427) (not e!742424))))

(assert (=> d!141581 (= res!864427 (or (bvsge from!2144 (size!42376 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42376 _keys!1741)))))))

(declare-fun lt!581681 () ListLongMap!20223)

(declare-fun lt!581692 () ListLongMap!20223)

(assert (=> d!141581 (= lt!581681 lt!581692)))

(declare-fun lt!581696 () Unit!42998)

(declare-fun e!742429 () Unit!42998)

(assert (=> d!141581 (= lt!581696 e!742429)))

(declare-fun c!124936 () Bool)

(declare-fun e!742433 () Bool)

(assert (=> d!141581 (= c!124936 e!742433)))

(declare-fun res!864429 () Bool)

(assert (=> d!141581 (=> (not res!864429) (not e!742433))))

(assert (=> d!141581 (= res!864429 (bvslt from!2144 (size!42376 _keys!1741)))))

(declare-fun e!742432 () ListLongMap!20223)

(assert (=> d!141581 (= lt!581692 e!742432)))

(assert (=> d!141581 (= c!124938 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141581 (validMask!0 mask!2175)))

(assert (=> d!141581 (= (getCurrentListMap!5144 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!581681)))

(declare-fun b!1301297 () Bool)

(assert (=> b!1301297 (= e!742432 e!742430)))

(assert (=> b!1301297 (= c!124934 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1301298 () Bool)

(assert (=> b!1301298 (= e!742432 (+!4499 call!63683 (tuple2!22559 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun bm!63678 () Bool)

(assert (=> bm!63678 (= call!63686 call!63681)))

(declare-fun b!1301299 () Bool)

(declare-fun e!742428 () Bool)

(declare-fun apply!1024 (ListLongMap!20223 (_ BitVec 64)) V!51513)

(assert (=> b!1301299 (= e!742428 (= (apply!1024 lt!581681 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun bm!63679 () Bool)

(declare-fun call!63685 () Bool)

(assert (=> bm!63679 (= call!63685 (contains!8261 lt!581681 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1301300 () Bool)

(declare-fun e!742425 () Bool)

(declare-fun get!21166 (ValueCell!16505 V!51513) V!51513)

(declare-fun dynLambda!3481 (Int (_ BitVec 64)) V!51513)

(assert (=> b!1301300 (= e!742425 (= (apply!1024 lt!581681 (select (arr!41825 _keys!1741) from!2144)) (get!21166 (select (arr!41826 _values!1445) from!2144) (dynLambda!3481 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1301300 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42377 _values!1445)))))

(assert (=> b!1301300 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42376 _keys!1741)))))

(declare-fun b!1301301 () Bool)

(declare-fun res!864426 () Bool)

(assert (=> b!1301301 (=> (not res!864426) (not e!742424))))

(declare-fun e!742423 () Bool)

(assert (=> b!1301301 (= res!864426 e!742423)))

(declare-fun c!124937 () Bool)

(assert (=> b!1301301 (= c!124937 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1301302 () Bool)

(assert (=> b!1301302 (= e!742431 (= (apply!1024 lt!581681 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun bm!63680 () Bool)

(assert (=> bm!63680 (= call!63684 call!63686)))

(declare-fun b!1301303 () Bool)

(assert (=> b!1301303 (= e!742426 call!63684)))

(declare-fun b!1301304 () Bool)

(assert (=> b!1301304 (= e!742422 e!742425)))

(declare-fun res!864430 () Bool)

(assert (=> b!1301304 (=> (not res!864430) (not e!742425))))

(assert (=> b!1301304 (= res!864430 (contains!8261 lt!581681 (select (arr!41825 _keys!1741) from!2144)))))

(assert (=> b!1301304 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42376 _keys!1741)))))

(declare-fun b!1301305 () Bool)

(assert (=> b!1301305 (= e!742433 (validKeyInArray!0 (select (arr!41825 _keys!1741) from!2144)))))

(declare-fun bm!63681 () Bool)

(assert (=> bm!63681 (= call!63682 (contains!8261 lt!581681 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!63682 () Bool)

(assert (=> bm!63682 (= call!63681 (getCurrentListMapNoExtraKeys!6139 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1301306 () Bool)

(assert (=> b!1301306 (= e!742423 e!742428)))

(declare-fun res!864423 () Bool)

(assert (=> b!1301306 (= res!864423 call!63685)))

(assert (=> b!1301306 (=> (not res!864423) (not e!742428))))

(declare-fun b!1301307 () Bool)

(declare-fun Unit!43001 () Unit!42998)

(assert (=> b!1301307 (= e!742429 Unit!43001)))

(declare-fun b!1301308 () Bool)

(assert (=> b!1301308 (= e!742423 (not call!63685))))

(declare-fun b!1301309 () Bool)

(assert (=> b!1301309 (= e!742427 (not call!63682))))

(declare-fun b!1301310 () Bool)

(declare-fun lt!581683 () Unit!42998)

(assert (=> b!1301310 (= e!742429 lt!581683)))

(declare-fun lt!581698 () ListLongMap!20223)

(assert (=> b!1301310 (= lt!581698 (getCurrentListMapNoExtraKeys!6139 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581677 () (_ BitVec 64))

(assert (=> b!1301310 (= lt!581677 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581689 () (_ BitVec 64))

(assert (=> b!1301310 (= lt!581689 (select (arr!41825 _keys!1741) from!2144))))

(declare-fun lt!581690 () Unit!42998)

(declare-fun addStillContains!1111 (ListLongMap!20223 (_ BitVec 64) V!51513 (_ BitVec 64)) Unit!42998)

(assert (=> b!1301310 (= lt!581690 (addStillContains!1111 lt!581698 lt!581677 zeroValue!1387 lt!581689))))

(assert (=> b!1301310 (contains!8261 (+!4499 lt!581698 (tuple2!22559 lt!581677 zeroValue!1387)) lt!581689)))

(declare-fun lt!581679 () Unit!42998)

(assert (=> b!1301310 (= lt!581679 lt!581690)))

(declare-fun lt!581684 () ListLongMap!20223)

(assert (=> b!1301310 (= lt!581684 (getCurrentListMapNoExtraKeys!6139 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581685 () (_ BitVec 64))

(assert (=> b!1301310 (= lt!581685 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581695 () (_ BitVec 64))

(assert (=> b!1301310 (= lt!581695 (select (arr!41825 _keys!1741) from!2144))))

(declare-fun lt!581691 () Unit!42998)

(declare-fun addApplyDifferent!553 (ListLongMap!20223 (_ BitVec 64) V!51513 (_ BitVec 64)) Unit!42998)

(assert (=> b!1301310 (= lt!581691 (addApplyDifferent!553 lt!581684 lt!581685 minValue!1387 lt!581695))))

(assert (=> b!1301310 (= (apply!1024 (+!4499 lt!581684 (tuple2!22559 lt!581685 minValue!1387)) lt!581695) (apply!1024 lt!581684 lt!581695))))

(declare-fun lt!581678 () Unit!42998)

(assert (=> b!1301310 (= lt!581678 lt!581691)))

(declare-fun lt!581697 () ListLongMap!20223)

(assert (=> b!1301310 (= lt!581697 (getCurrentListMapNoExtraKeys!6139 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581688 () (_ BitVec 64))

(assert (=> b!1301310 (= lt!581688 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581682 () (_ BitVec 64))

(assert (=> b!1301310 (= lt!581682 (select (arr!41825 _keys!1741) from!2144))))

(declare-fun lt!581680 () Unit!42998)

(assert (=> b!1301310 (= lt!581680 (addApplyDifferent!553 lt!581697 lt!581688 zeroValue!1387 lt!581682))))

(assert (=> b!1301310 (= (apply!1024 (+!4499 lt!581697 (tuple2!22559 lt!581688 zeroValue!1387)) lt!581682) (apply!1024 lt!581697 lt!581682))))

(declare-fun lt!581687 () Unit!42998)

(assert (=> b!1301310 (= lt!581687 lt!581680)))

(declare-fun lt!581686 () ListLongMap!20223)

(assert (=> b!1301310 (= lt!581686 (getCurrentListMapNoExtraKeys!6139 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581694 () (_ BitVec 64))

(assert (=> b!1301310 (= lt!581694 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581693 () (_ BitVec 64))

(assert (=> b!1301310 (= lt!581693 (select (arr!41825 _keys!1741) from!2144))))

(assert (=> b!1301310 (= lt!581683 (addApplyDifferent!553 lt!581686 lt!581694 minValue!1387 lt!581693))))

(assert (=> b!1301310 (= (apply!1024 (+!4499 lt!581686 (tuple2!22559 lt!581694 minValue!1387)) lt!581693) (apply!1024 lt!581686 lt!581693))))

(declare-fun b!1301311 () Bool)

(declare-fun call!63680 () ListLongMap!20223)

(assert (=> b!1301311 (= e!742426 call!63680)))

(declare-fun bm!63683 () Bool)

(assert (=> bm!63683 (= call!63680 call!63683)))

(declare-fun b!1301312 () Bool)

(assert (=> b!1301312 (= e!742430 call!63680)))

(assert (= (and d!141581 c!124938) b!1301298))

(assert (= (and d!141581 (not c!124938)) b!1301297))

(assert (= (and b!1301297 c!124934) b!1301312))

(assert (= (and b!1301297 (not c!124934)) b!1301296))

(assert (= (and b!1301296 c!124935) b!1301311))

(assert (= (and b!1301296 (not c!124935)) b!1301303))

(assert (= (or b!1301311 b!1301303) bm!63680))

(assert (= (or b!1301312 bm!63680) bm!63678))

(assert (= (or b!1301312 b!1301311) bm!63683))

(assert (= (or b!1301298 bm!63678) bm!63682))

(assert (= (or b!1301298 bm!63683) bm!63677))

(assert (= (and d!141581 res!864429) b!1301305))

(assert (= (and d!141581 c!124936) b!1301310))

(assert (= (and d!141581 (not c!124936)) b!1301307))

(assert (= (and d!141581 res!864427) b!1301292))

(assert (= (and b!1301292 res!864425) b!1301293))

(assert (= (and b!1301292 (not res!864422)) b!1301304))

(assert (= (and b!1301304 res!864430) b!1301300))

(assert (= (and b!1301292 res!864424) b!1301301))

(assert (= (and b!1301301 c!124937) b!1301306))

(assert (= (and b!1301301 (not c!124937)) b!1301308))

(assert (= (and b!1301306 res!864423) b!1301299))

(assert (= (or b!1301306 b!1301308) bm!63679))

(assert (= (and b!1301301 res!864426) b!1301294))

(assert (= (and b!1301294 c!124939) b!1301295))

(assert (= (and b!1301294 (not c!124939)) b!1301309))

(assert (= (and b!1301295 res!864428) b!1301302))

(assert (= (or b!1301295 b!1301309) bm!63681))

(declare-fun b_lambda!23155 () Bool)

(assert (=> (not b_lambda!23155) (not b!1301300)))

(declare-fun t!43283 () Bool)

(declare-fun tb!11367 () Bool)

(assert (=> (and start!109958 (= defaultEntry!1448 defaultEntry!1448) t!43283) tb!11367))

(declare-fun result!23749 () Bool)

(assert (=> tb!11367 (= result!23749 tp_is_empty!34807)))

(assert (=> b!1301300 t!43283))

(declare-fun b_and!47277 () Bool)

(assert (= b_and!47271 (and (=> t!43283 result!23749) b_and!47277)))

(declare-fun m!1192637 () Bool)

(assert (=> bm!63677 m!1192637))

(declare-fun m!1192639 () Bool)

(assert (=> bm!63679 m!1192639))

(assert (=> b!1301305 m!1192559))

(assert (=> b!1301305 m!1192559))

(assert (=> b!1301305 m!1192561))

(assert (=> b!1301304 m!1192559))

(assert (=> b!1301304 m!1192559))

(declare-fun m!1192641 () Bool)

(assert (=> b!1301304 m!1192641))

(declare-fun m!1192643 () Bool)

(assert (=> b!1301299 m!1192643))

(assert (=> bm!63682 m!1192565))

(declare-fun m!1192645 () Bool)

(assert (=> b!1301310 m!1192645))

(declare-fun m!1192647 () Bool)

(assert (=> b!1301310 m!1192647))

(declare-fun m!1192649 () Bool)

(assert (=> b!1301310 m!1192649))

(declare-fun m!1192651 () Bool)

(assert (=> b!1301310 m!1192651))

(declare-fun m!1192653 () Bool)

(assert (=> b!1301310 m!1192653))

(declare-fun m!1192655 () Bool)

(assert (=> b!1301310 m!1192655))

(assert (=> b!1301310 m!1192559))

(declare-fun m!1192657 () Bool)

(assert (=> b!1301310 m!1192657))

(assert (=> b!1301310 m!1192647))

(declare-fun m!1192659 () Bool)

(assert (=> b!1301310 m!1192659))

(assert (=> b!1301310 m!1192651))

(declare-fun m!1192661 () Bool)

(assert (=> b!1301310 m!1192661))

(declare-fun m!1192663 () Bool)

(assert (=> b!1301310 m!1192663))

(declare-fun m!1192665 () Bool)

(assert (=> b!1301310 m!1192665))

(declare-fun m!1192667 () Bool)

(assert (=> b!1301310 m!1192667))

(assert (=> b!1301310 m!1192565))

(declare-fun m!1192669 () Bool)

(assert (=> b!1301310 m!1192669))

(assert (=> b!1301310 m!1192653))

(declare-fun m!1192671 () Bool)

(assert (=> b!1301310 m!1192671))

(assert (=> b!1301310 m!1192657))

(declare-fun m!1192673 () Bool)

(assert (=> b!1301310 m!1192673))

(declare-fun m!1192675 () Bool)

(assert (=> bm!63681 m!1192675))

(assert (=> b!1301293 m!1192559))

(assert (=> b!1301293 m!1192559))

(assert (=> b!1301293 m!1192561))

(declare-fun m!1192677 () Bool)

(assert (=> b!1301302 m!1192677))

(assert (=> d!141581 m!1192571))

(assert (=> b!1301300 m!1192559))

(declare-fun m!1192679 () Bool)

(assert (=> b!1301300 m!1192679))

(declare-fun m!1192681 () Bool)

(assert (=> b!1301300 m!1192681))

(declare-fun m!1192683 () Bool)

(assert (=> b!1301300 m!1192683))

(declare-fun m!1192685 () Bool)

(assert (=> b!1301300 m!1192685))

(assert (=> b!1301300 m!1192683))

(assert (=> b!1301300 m!1192681))

(assert (=> b!1301300 m!1192559))

(declare-fun m!1192687 () Bool)

(assert (=> b!1301298 m!1192687))

(assert (=> b!1301168 d!141581))

(declare-fun bm!63686 () Bool)

(declare-fun call!63689 () Bool)

(assert (=> bm!63686 (= call!63689 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1301323 () Bool)

(declare-fun e!742442 () Bool)

(assert (=> b!1301323 (= e!742442 call!63689)))

(declare-fun b!1301324 () Bool)

(declare-fun e!742441 () Bool)

(assert (=> b!1301324 (= e!742441 call!63689)))

(declare-fun b!1301325 () Bool)

(declare-fun e!742440 () Bool)

(assert (=> b!1301325 (= e!742440 e!742441)))

(declare-fun c!124942 () Bool)

(assert (=> b!1301325 (= c!124942 (validKeyInArray!0 (select (arr!41825 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!141583 () Bool)

(declare-fun res!864436 () Bool)

(assert (=> d!141583 (=> res!864436 e!742440)))

(assert (=> d!141583 (= res!864436 (bvsge #b00000000000000000000000000000000 (size!42376 _keys!1741)))))

(assert (=> d!141583 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!742440)))

(declare-fun b!1301326 () Bool)

(assert (=> b!1301326 (= e!742441 e!742442)))

(declare-fun lt!581706 () (_ BitVec 64))

(assert (=> b!1301326 (= lt!581706 (select (arr!41825 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!581707 () Unit!42998)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86663 (_ BitVec 64) (_ BitVec 32)) Unit!42998)

(assert (=> b!1301326 (= lt!581707 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!581706 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1301326 (arrayContainsKey!0 _keys!1741 lt!581706 #b00000000000000000000000000000000)))

(declare-fun lt!581705 () Unit!42998)

(assert (=> b!1301326 (= lt!581705 lt!581707)))

(declare-fun res!864435 () Bool)

(declare-datatypes ((SeekEntryResult!9974 0))(
  ( (MissingZero!9974 (index!42267 (_ BitVec 32))) (Found!9974 (index!42268 (_ BitVec 32))) (Intermediate!9974 (undefined!10786 Bool) (index!42269 (_ BitVec 32)) (x!115452 (_ BitVec 32))) (Undefined!9974) (MissingVacant!9974 (index!42270 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86663 (_ BitVec 32)) SeekEntryResult!9974)

(assert (=> b!1301326 (= res!864435 (= (seekEntryOrOpen!0 (select (arr!41825 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!9974 #b00000000000000000000000000000000)))))

(assert (=> b!1301326 (=> (not res!864435) (not e!742442))))

(assert (= (and d!141583 (not res!864436)) b!1301325))

(assert (= (and b!1301325 c!124942) b!1301326))

(assert (= (and b!1301325 (not c!124942)) b!1301324))

(assert (= (and b!1301326 res!864435) b!1301323))

(assert (= (or b!1301323 b!1301324) bm!63686))

(declare-fun m!1192689 () Bool)

(assert (=> bm!63686 m!1192689))

(declare-fun m!1192691 () Bool)

(assert (=> b!1301325 m!1192691))

(assert (=> b!1301325 m!1192691))

(declare-fun m!1192693 () Bool)

(assert (=> b!1301325 m!1192693))

(assert (=> b!1301326 m!1192691))

(declare-fun m!1192695 () Bool)

(assert (=> b!1301326 m!1192695))

(declare-fun m!1192697 () Bool)

(assert (=> b!1301326 m!1192697))

(assert (=> b!1301326 m!1192691))

(declare-fun m!1192699 () Bool)

(assert (=> b!1301326 m!1192699))

(assert (=> b!1301159 d!141583))

(declare-fun d!141585 () Bool)

(declare-fun e!742444 () Bool)

(assert (=> d!141585 e!742444))

(declare-fun res!864437 () Bool)

(assert (=> d!141585 (=> res!864437 e!742444)))

(declare-fun lt!581710 () Bool)

(assert (=> d!141585 (= res!864437 (not lt!581710))))

(declare-fun lt!581709 () Bool)

(assert (=> d!141585 (= lt!581710 lt!581709)))

(declare-fun lt!581711 () Unit!42998)

(declare-fun e!742443 () Unit!42998)

(assert (=> d!141585 (= lt!581711 e!742443)))

(declare-fun c!124943 () Bool)

(assert (=> d!141585 (= c!124943 lt!581709)))

(assert (=> d!141585 (= lt!581709 (containsKey!720 (toList!10127 (+!4499 (getCurrentListMapNoExtraKeys!6139 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(assert (=> d!141585 (= (contains!8261 (+!4499 (getCurrentListMapNoExtraKeys!6139 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205) lt!581710)))

(declare-fun b!1301327 () Bool)

(declare-fun lt!581708 () Unit!42998)

(assert (=> b!1301327 (= e!742443 lt!581708)))

(assert (=> b!1301327 (= lt!581708 (lemmaContainsKeyImpliesGetValueByKeyDefined!466 (toList!10127 (+!4499 (getCurrentListMapNoExtraKeys!6139 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(assert (=> b!1301327 (isDefined!503 (getValueByKey!694 (toList!10127 (+!4499 (getCurrentListMapNoExtraKeys!6139 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(declare-fun b!1301328 () Bool)

(declare-fun Unit!43002 () Unit!42998)

(assert (=> b!1301328 (= e!742443 Unit!43002)))

(declare-fun b!1301329 () Bool)

(assert (=> b!1301329 (= e!742444 (isDefined!503 (getValueByKey!694 (toList!10127 (+!4499 (getCurrentListMapNoExtraKeys!6139 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205)))))

(assert (= (and d!141585 c!124943) b!1301327))

(assert (= (and d!141585 (not c!124943)) b!1301328))

(assert (= (and d!141585 (not res!864437)) b!1301329))

(declare-fun m!1192701 () Bool)

(assert (=> d!141585 m!1192701))

(declare-fun m!1192703 () Bool)

(assert (=> b!1301327 m!1192703))

(declare-fun m!1192705 () Bool)

(assert (=> b!1301327 m!1192705))

(assert (=> b!1301327 m!1192705))

(declare-fun m!1192707 () Bool)

(assert (=> b!1301327 m!1192707))

(assert (=> b!1301329 m!1192705))

(assert (=> b!1301329 m!1192705))

(assert (=> b!1301329 m!1192707))

(assert (=> b!1301162 d!141585))

(declare-fun d!141587 () Bool)

(declare-fun e!742447 () Bool)

(assert (=> d!141587 e!742447))

(declare-fun res!864442 () Bool)

(assert (=> d!141587 (=> (not res!864442) (not e!742447))))

(declare-fun lt!581720 () ListLongMap!20223)

(assert (=> d!141587 (= res!864442 (contains!8261 lt!581720 (_1!11290 (tuple2!22559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!581721 () List!29718)

(assert (=> d!141587 (= lt!581720 (ListLongMap!20224 lt!581721))))

(declare-fun lt!581723 () Unit!42998)

(declare-fun lt!581722 () Unit!42998)

(assert (=> d!141587 (= lt!581723 lt!581722)))

(assert (=> d!141587 (= (getValueByKey!694 lt!581721 (_1!11290 (tuple2!22559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!744 (_2!11290 (tuple2!22559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!345 (List!29718 (_ BitVec 64) V!51513) Unit!42998)

(assert (=> d!141587 (= lt!581722 (lemmaContainsTupThenGetReturnValue!345 lt!581721 (_1!11290 (tuple2!22559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11290 (tuple2!22559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun insertStrictlySorted!474 (List!29718 (_ BitVec 64) V!51513) List!29718)

(assert (=> d!141587 (= lt!581721 (insertStrictlySorted!474 (toList!10127 (getCurrentListMapNoExtraKeys!6139 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) (_1!11290 (tuple2!22559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11290 (tuple2!22559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141587 (= (+!4499 (getCurrentListMapNoExtraKeys!6139 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!581720)))

(declare-fun b!1301334 () Bool)

(declare-fun res!864443 () Bool)

(assert (=> b!1301334 (=> (not res!864443) (not e!742447))))

(assert (=> b!1301334 (= res!864443 (= (getValueByKey!694 (toList!10127 lt!581720) (_1!11290 (tuple2!22559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!744 (_2!11290 (tuple2!22559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1301335 () Bool)

(declare-fun contains!8262 (List!29718 tuple2!22558) Bool)

(assert (=> b!1301335 (= e!742447 (contains!8262 (toList!10127 lt!581720) (tuple2!22559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!141587 res!864442) b!1301334))

(assert (= (and b!1301334 res!864443) b!1301335))

(declare-fun m!1192709 () Bool)

(assert (=> d!141587 m!1192709))

(declare-fun m!1192711 () Bool)

(assert (=> d!141587 m!1192711))

(declare-fun m!1192713 () Bool)

(assert (=> d!141587 m!1192713))

(declare-fun m!1192715 () Bool)

(assert (=> d!141587 m!1192715))

(declare-fun m!1192717 () Bool)

(assert (=> b!1301334 m!1192717))

(declare-fun m!1192719 () Bool)

(assert (=> b!1301335 m!1192719))

(assert (=> b!1301162 d!141587))

(declare-fun b!1301360 () Bool)

(declare-fun e!742464 () Bool)

(declare-fun e!742465 () Bool)

(assert (=> b!1301360 (= e!742464 e!742465)))

(declare-fun c!124952 () Bool)

(assert (=> b!1301360 (= c!124952 (bvslt from!2144 (size!42376 _keys!1741)))))

(declare-fun b!1301361 () Bool)

(declare-fun e!742467 () Bool)

(assert (=> b!1301361 (= e!742467 e!742464)))

(declare-fun c!124954 () Bool)

(declare-fun e!742462 () Bool)

(assert (=> b!1301361 (= c!124954 e!742462)))

(declare-fun res!864455 () Bool)

(assert (=> b!1301361 (=> (not res!864455) (not e!742462))))

(assert (=> b!1301361 (= res!864455 (bvslt from!2144 (size!42376 _keys!1741)))))

(declare-fun b!1301362 () Bool)

(declare-fun res!864453 () Bool)

(assert (=> b!1301362 (=> (not res!864453) (not e!742467))))

(declare-fun lt!581739 () ListLongMap!20223)

(assert (=> b!1301362 (= res!864453 (not (contains!8261 lt!581739 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun call!63692 () ListLongMap!20223)

(declare-fun bm!63689 () Bool)

(assert (=> bm!63689 (= call!63692 (getCurrentListMapNoExtraKeys!6139 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1301363 () Bool)

(declare-fun isEmpty!1055 (ListLongMap!20223) Bool)

(assert (=> b!1301363 (= e!742465 (isEmpty!1055 lt!581739))))

(declare-fun b!1301364 () Bool)

(declare-fun e!742468 () ListLongMap!20223)

(assert (=> b!1301364 (= e!742468 (ListLongMap!20224 Nil!29715))))

(declare-fun b!1301365 () Bool)

(assert (=> b!1301365 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42376 _keys!1741)))))

(assert (=> b!1301365 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42377 _values!1445)))))

(declare-fun e!742466 () Bool)

(assert (=> b!1301365 (= e!742466 (= (apply!1024 lt!581739 (select (arr!41825 _keys!1741) from!2144)) (get!21166 (select (arr!41826 _values!1445) from!2144) (dynLambda!3481 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!141589 () Bool)

(assert (=> d!141589 e!742467))

(declare-fun res!864454 () Bool)

(assert (=> d!141589 (=> (not res!864454) (not e!742467))))

(assert (=> d!141589 (= res!864454 (not (contains!8261 lt!581739 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141589 (= lt!581739 e!742468)))

(declare-fun c!124953 () Bool)

(assert (=> d!141589 (= c!124953 (bvsge from!2144 (size!42376 _keys!1741)))))

(assert (=> d!141589 (validMask!0 mask!2175)))

(assert (=> d!141589 (= (getCurrentListMapNoExtraKeys!6139 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!581739)))

(declare-fun b!1301366 () Bool)

(assert (=> b!1301366 (= e!742462 (validKeyInArray!0 (select (arr!41825 _keys!1741) from!2144)))))

(assert (=> b!1301366 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1301367 () Bool)

(assert (=> b!1301367 (= e!742464 e!742466)))

(assert (=> b!1301367 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42376 _keys!1741)))))

(declare-fun res!864452 () Bool)

(assert (=> b!1301367 (= res!864452 (contains!8261 lt!581739 (select (arr!41825 _keys!1741) from!2144)))))

(assert (=> b!1301367 (=> (not res!864452) (not e!742466))))

(declare-fun b!1301368 () Bool)

(declare-fun e!742463 () ListLongMap!20223)

(assert (=> b!1301368 (= e!742463 call!63692)))

(declare-fun b!1301369 () Bool)

(assert (=> b!1301369 (= e!742465 (= lt!581739 (getCurrentListMapNoExtraKeys!6139 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1301370 () Bool)

(assert (=> b!1301370 (= e!742468 e!742463)))

(declare-fun c!124955 () Bool)

(assert (=> b!1301370 (= c!124955 (validKeyInArray!0 (select (arr!41825 _keys!1741) from!2144)))))

(declare-fun b!1301371 () Bool)

(declare-fun lt!581740 () Unit!42998)

(declare-fun lt!581744 () Unit!42998)

(assert (=> b!1301371 (= lt!581740 lt!581744)))

(declare-fun lt!581738 () V!51513)

(declare-fun lt!581742 () (_ BitVec 64))

(declare-fun lt!581743 () ListLongMap!20223)

(declare-fun lt!581741 () (_ BitVec 64))

(assert (=> b!1301371 (not (contains!8261 (+!4499 lt!581743 (tuple2!22559 lt!581741 lt!581738)) lt!581742))))

(declare-fun addStillNotContains!463 (ListLongMap!20223 (_ BitVec 64) V!51513 (_ BitVec 64)) Unit!42998)

(assert (=> b!1301371 (= lt!581744 (addStillNotContains!463 lt!581743 lt!581741 lt!581738 lt!581742))))

(assert (=> b!1301371 (= lt!581742 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1301371 (= lt!581738 (get!21166 (select (arr!41826 _values!1445) from!2144) (dynLambda!3481 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1301371 (= lt!581741 (select (arr!41825 _keys!1741) from!2144))))

(assert (=> b!1301371 (= lt!581743 call!63692)))

(assert (=> b!1301371 (= e!742463 (+!4499 call!63692 (tuple2!22559 (select (arr!41825 _keys!1741) from!2144) (get!21166 (select (arr!41826 _values!1445) from!2144) (dynLambda!3481 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!141589 c!124953) b!1301364))

(assert (= (and d!141589 (not c!124953)) b!1301370))

(assert (= (and b!1301370 c!124955) b!1301371))

(assert (= (and b!1301370 (not c!124955)) b!1301368))

(assert (= (or b!1301371 b!1301368) bm!63689))

(assert (= (and d!141589 res!864454) b!1301362))

(assert (= (and b!1301362 res!864453) b!1301361))

(assert (= (and b!1301361 res!864455) b!1301366))

(assert (= (and b!1301361 c!124954) b!1301367))

(assert (= (and b!1301361 (not c!124954)) b!1301360))

(assert (= (and b!1301367 res!864452) b!1301365))

(assert (= (and b!1301360 c!124952) b!1301369))

(assert (= (and b!1301360 (not c!124952)) b!1301363))

(declare-fun b_lambda!23157 () Bool)

(assert (=> (not b_lambda!23157) (not b!1301365)))

(assert (=> b!1301365 t!43283))

(declare-fun b_and!47279 () Bool)

(assert (= b_and!47277 (and (=> t!43283 result!23749) b_and!47279)))

(declare-fun b_lambda!23159 () Bool)

(assert (=> (not b_lambda!23159) (not b!1301371)))

(assert (=> b!1301371 t!43283))

(declare-fun b_and!47281 () Bool)

(assert (= b_and!47279 (and (=> t!43283 result!23749) b_and!47281)))

(declare-fun m!1192721 () Bool)

(assert (=> bm!63689 m!1192721))

(declare-fun m!1192723 () Bool)

(assert (=> b!1301362 m!1192723))

(assert (=> b!1301365 m!1192559))

(declare-fun m!1192725 () Bool)

(assert (=> b!1301365 m!1192725))

(assert (=> b!1301365 m!1192681))

(assert (=> b!1301365 m!1192683))

(assert (=> b!1301365 m!1192685))

(assert (=> b!1301365 m!1192559))

(assert (=> b!1301365 m!1192683))

(assert (=> b!1301365 m!1192681))

(assert (=> b!1301366 m!1192559))

(assert (=> b!1301366 m!1192559))

(assert (=> b!1301366 m!1192561))

(declare-fun m!1192727 () Bool)

(assert (=> b!1301363 m!1192727))

(assert (=> b!1301371 m!1192681))

(assert (=> b!1301371 m!1192683))

(assert (=> b!1301371 m!1192685))

(declare-fun m!1192729 () Bool)

(assert (=> b!1301371 m!1192729))

(assert (=> b!1301371 m!1192559))

(assert (=> b!1301371 m!1192683))

(declare-fun m!1192731 () Bool)

(assert (=> b!1301371 m!1192731))

(declare-fun m!1192733 () Bool)

(assert (=> b!1301371 m!1192733))

(assert (=> b!1301371 m!1192731))

(declare-fun m!1192735 () Bool)

(assert (=> b!1301371 m!1192735))

(assert (=> b!1301371 m!1192681))

(assert (=> b!1301369 m!1192721))

(assert (=> b!1301370 m!1192559))

(assert (=> b!1301370 m!1192559))

(assert (=> b!1301370 m!1192561))

(assert (=> b!1301367 m!1192559))

(assert (=> b!1301367 m!1192559))

(declare-fun m!1192737 () Bool)

(assert (=> b!1301367 m!1192737))

(declare-fun m!1192739 () Bool)

(assert (=> d!141589 m!1192739))

(assert (=> d!141589 m!1192571))

(assert (=> b!1301162 d!141589))

(declare-fun d!141591 () Bool)

(assert (=> d!141591 (= (validKeyInArray!0 (select (arr!41825 _keys!1741) from!2144)) (and (not (= (select (arr!41825 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41825 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1301158 d!141591))

(declare-fun b!1301382 () Bool)

(declare-fun e!742477 () Bool)

(declare-fun e!742479 () Bool)

(assert (=> b!1301382 (= e!742477 e!742479)))

(declare-fun res!864462 () Bool)

(assert (=> b!1301382 (=> (not res!864462) (not e!742479))))

(declare-fun e!742478 () Bool)

(assert (=> b!1301382 (= res!864462 (not e!742478))))

(declare-fun res!864463 () Bool)

(assert (=> b!1301382 (=> (not res!864463) (not e!742478))))

(assert (=> b!1301382 (= res!864463 (validKeyInArray!0 (select (arr!41825 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1301383 () Bool)

(declare-fun e!742480 () Bool)

(declare-fun call!63695 () Bool)

(assert (=> b!1301383 (= e!742480 call!63695)))

(declare-fun b!1301384 () Bool)

(assert (=> b!1301384 (= e!742479 e!742480)))

(declare-fun c!124958 () Bool)

(assert (=> b!1301384 (= c!124958 (validKeyInArray!0 (select (arr!41825 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1301385 () Bool)

(assert (=> b!1301385 (= e!742480 call!63695)))

(declare-fun b!1301386 () Bool)

(declare-fun contains!8263 (List!29717 (_ BitVec 64)) Bool)

(assert (=> b!1301386 (= e!742478 (contains!8263 Nil!29714 (select (arr!41825 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!63692 () Bool)

(assert (=> bm!63692 (= call!63695 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124958 (Cons!29713 (select (arr!41825 _keys!1741) #b00000000000000000000000000000000) Nil!29714) Nil!29714)))))

(declare-fun d!141593 () Bool)

(declare-fun res!864464 () Bool)

(assert (=> d!141593 (=> res!864464 e!742477)))

(assert (=> d!141593 (= res!864464 (bvsge #b00000000000000000000000000000000 (size!42376 _keys!1741)))))

(assert (=> d!141593 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29714) e!742477)))

(assert (= (and d!141593 (not res!864464)) b!1301382))

(assert (= (and b!1301382 res!864463) b!1301386))

(assert (= (and b!1301382 res!864462) b!1301384))

(assert (= (and b!1301384 c!124958) b!1301385))

(assert (= (and b!1301384 (not c!124958)) b!1301383))

(assert (= (or b!1301385 b!1301383) bm!63692))

(assert (=> b!1301382 m!1192691))

(assert (=> b!1301382 m!1192691))

(assert (=> b!1301382 m!1192693))

(assert (=> b!1301384 m!1192691))

(assert (=> b!1301384 m!1192691))

(assert (=> b!1301384 m!1192693))

(assert (=> b!1301386 m!1192691))

(assert (=> b!1301386 m!1192691))

(declare-fun m!1192741 () Bool)

(assert (=> b!1301386 m!1192741))

(assert (=> bm!63692 m!1192691))

(declare-fun m!1192743 () Bool)

(assert (=> bm!63692 m!1192743))

(assert (=> b!1301157 d!141593))

(declare-fun d!141595 () Bool)

(assert (=> d!141595 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!109958 d!141595))

(declare-fun d!141597 () Bool)

(assert (=> d!141597 (= (array_inv!31887 _values!1445) (bvsge (size!42377 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!109958 d!141597))

(declare-fun d!141599 () Bool)

(assert (=> d!141599 (= (array_inv!31888 _keys!1741) (bvsge (size!42376 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!109958 d!141599))

(declare-fun b!1301394 () Bool)

(declare-fun e!742485 () Bool)

(assert (=> b!1301394 (= e!742485 tp_is_empty!34807)))

(declare-fun mapNonEmpty!53789 () Bool)

(declare-fun mapRes!53789 () Bool)

(declare-fun tp!102644 () Bool)

(declare-fun e!742486 () Bool)

(assert (=> mapNonEmpty!53789 (= mapRes!53789 (and tp!102644 e!742486))))

(declare-fun mapValue!53789 () ValueCell!16505)

(declare-fun mapRest!53789 () (Array (_ BitVec 32) ValueCell!16505))

(declare-fun mapKey!53789 () (_ BitVec 32))

(assert (=> mapNonEmpty!53789 (= mapRest!53780 (store mapRest!53789 mapKey!53789 mapValue!53789))))

(declare-fun b!1301393 () Bool)

(assert (=> b!1301393 (= e!742486 tp_is_empty!34807)))

(declare-fun condMapEmpty!53789 () Bool)

(declare-fun mapDefault!53789 () ValueCell!16505)

(assert (=> mapNonEmpty!53780 (= condMapEmpty!53789 (= mapRest!53780 ((as const (Array (_ BitVec 32) ValueCell!16505)) mapDefault!53789)))))

(assert (=> mapNonEmpty!53780 (= tp!102629 (and e!742485 mapRes!53789))))

(declare-fun mapIsEmpty!53789 () Bool)

(assert (=> mapIsEmpty!53789 mapRes!53789))

(assert (= (and mapNonEmpty!53780 condMapEmpty!53789) mapIsEmpty!53789))

(assert (= (and mapNonEmpty!53780 (not condMapEmpty!53789)) mapNonEmpty!53789))

(assert (= (and mapNonEmpty!53789 ((_ is ValueCellFull!16505) mapValue!53789)) b!1301393))

(assert (= (and mapNonEmpty!53780 ((_ is ValueCellFull!16505) mapDefault!53789)) b!1301394))

(declare-fun m!1192745 () Bool)

(assert (=> mapNonEmpty!53789 m!1192745))

(declare-fun b_lambda!23161 () Bool)

(assert (= b_lambda!23155 (or (and start!109958 b_free!29167) b_lambda!23161)))

(declare-fun b_lambda!23163 () Bool)

(assert (= b_lambda!23157 (or (and start!109958 b_free!29167) b_lambda!23163)))

(declare-fun b_lambda!23165 () Bool)

(assert (= b_lambda!23159 (or (and start!109958 b_free!29167) b_lambda!23165)))

(check-sat (not b!1301370) tp_is_empty!34807 (not b!1301384) (not d!141581) (not b!1301366) (not bm!63679) (not b!1301302) (not d!141585) (not bm!63686) (not b!1301304) (not b!1301329) (not bm!63681) (not b!1301325) (not b!1301362) (not d!141589) (not b!1301371) (not b!1301369) (not b!1301334) (not b_lambda!23165) (not b!1301326) (not b!1301299) (not b!1301335) (not bm!63689) (not b!1301305) (not b!1301298) (not bm!63692) (not b_next!29167) (not b_lambda!23163) (not bm!63677) (not b!1301327) (not b!1301300) (not b!1301249) (not b!1301363) (not b!1301365) (not bm!63682) (not b!1301382) (not d!141579) (not b!1301247) (not mapNonEmpty!53789) (not b!1301293) b_and!47281 (not b!1301386) (not b_lambda!23161) (not d!141587) (not b!1301367) (not b!1301310))
(check-sat b_and!47281 (not b_next!29167))
