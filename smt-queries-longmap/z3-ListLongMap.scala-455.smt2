; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8344 () Bool)

(assert start!8344)

(declare-fun b!55378 () Bool)

(declare-fun b_free!1853 () Bool)

(declare-fun b_next!1853 () Bool)

(assert (=> b!55378 (= b_free!1853 (not b_next!1853))))

(declare-fun tp!7659 () Bool)

(declare-fun b_and!3247 () Bool)

(assert (=> b!55378 (= tp!7659 b_and!3247)))

(declare-fun b!55379 () Bool)

(declare-fun b_free!1855 () Bool)

(declare-fun b_next!1855 () Bool)

(assert (=> b!55379 (= b_free!1855 (not b_next!1855))))

(declare-fun tp!7661 () Bool)

(declare-fun b_and!3249 () Bool)

(assert (=> b!55379 (= tp!7661 b_and!3249)))

(declare-fun b!55370 () Bool)

(declare-fun e!36383 () Bool)

(declare-fun e!36378 () Bool)

(assert (=> b!55370 (= e!36383 e!36378)))

(declare-fun res!31196 () Bool)

(assert (=> b!55370 (=> (not res!31196) (not e!36378))))

(declare-datatypes ((V!2771 0))(
  ( (V!2772 (val!1216 Int)) )
))
(declare-datatypes ((tuple2!1962 0))(
  ( (tuple2!1963 (_1!992 (_ BitVec 64)) (_2!992 V!2771)) )
))
(declare-datatypes ((List!1393 0))(
  ( (Nil!1390) (Cons!1389 (h!1969 tuple2!1962) (t!4615 List!1393)) )
))
(declare-datatypes ((ListLongMap!1329 0))(
  ( (ListLongMap!1330 (toList!680 List!1393)) )
))
(declare-fun lt!21916 () ListLongMap!1329)

(declare-datatypes ((array!3609 0))(
  ( (array!3610 (arr!1727 (Array (_ BitVec 32) (_ BitVec 64))) (size!1956 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!828 0))(
  ( (ValueCellFull!828 (v!2318 V!2771)) (EmptyCell!828) )
))
(declare-datatypes ((array!3611 0))(
  ( (array!3612 (arr!1728 (Array (_ BitVec 32) ValueCell!828)) (size!1957 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!564 0))(
  ( (LongMapFixedSize!565 (defaultEntry!1996 Int) (mask!5853 (_ BitVec 32)) (extraKeys!1887 (_ BitVec 32)) (zeroValue!1914 V!2771) (minValue!1914 V!2771) (_size!331 (_ BitVec 32)) (_keys!3616 array!3609) (_values!1979 array!3611) (_vacant!331 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!380 0))(
  ( (Cell!381 (v!2319 LongMapFixedSize!564)) )
))
(declare-datatypes ((LongMap!380 0))(
  ( (LongMap!381 (underlying!201 Cell!380)) )
))
(declare-fun thiss!992 () LongMap!380)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!654 (ListLongMap!1329 (_ BitVec 64)) Bool)

(assert (=> b!55370 (= res!31196 (contains!654 lt!21916 (select (arr!1727 (_keys!3616 (v!2319 (underlying!201 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1964 0))(
  ( (tuple2!1965 (_1!993 Bool) (_2!993 LongMapFixedSize!564)) )
))
(declare-fun lt!21920 () tuple2!1964)

(declare-fun newMap!16 () LongMapFixedSize!564)

(declare-fun update!61 (LongMapFixedSize!564 (_ BitVec 64) V!2771) tuple2!1964)

(declare-fun get!1031 (ValueCell!828 V!2771) V!2771)

(declare-fun dynLambda!292 (Int (_ BitVec 64)) V!2771)

(assert (=> b!55370 (= lt!21920 (update!61 newMap!16 (select (arr!1727 (_keys!3616 (v!2319 (underlying!201 thiss!992)))) from!355) (get!1031 (select (arr!1728 (_values!1979 (v!2319 (underlying!201 thiss!992)))) from!355) (dynLambda!292 (defaultEntry!1996 (v!2319 (underlying!201 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!55371 () Bool)

(declare-fun res!31191 () Bool)

(declare-fun e!36375 () Bool)

(assert (=> b!55371 (=> res!31191 e!36375)))

(declare-datatypes ((List!1394 0))(
  ( (Nil!1391) (Cons!1390 (h!1970 (_ BitVec 64)) (t!4616 List!1394)) )
))
(declare-fun lt!21918 () List!1394)

(declare-fun contains!655 (List!1394 (_ BitVec 64)) Bool)

(assert (=> b!55371 (= res!31191 (contains!655 lt!21918 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!55372 () Bool)

(assert (=> b!55372 (= e!36378 (not e!36375))))

(declare-fun res!31189 () Bool)

(assert (=> b!55372 (=> res!31189 e!36375)))

(assert (=> b!55372 (= res!31189 (or (bvsge (size!1956 (_keys!3616 (v!2319 (underlying!201 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1956 (_keys!3616 (v!2319 (underlying!201 thiss!992)))))))))

(assert (=> b!55372 (= lt!21918 (Cons!1390 (select (arr!1727 (_keys!3616 (v!2319 (underlying!201 thiss!992)))) from!355) Nil!1391))))

(declare-fun arrayNoDuplicates!0 (array!3609 (_ BitVec 32) List!1394) Bool)

(assert (=> b!55372 (arrayNoDuplicates!0 (_keys!3616 (v!2319 (underlying!201 thiss!992))) from!355 Nil!1391)))

(declare-datatypes ((Unit!1453 0))(
  ( (Unit!1454) )
))
(declare-fun lt!21921 () Unit!1453)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3609 (_ BitVec 32) (_ BitVec 32)) Unit!1453)

(assert (=> b!55372 (= lt!21921 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3616 (v!2319 (underlying!201 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!3609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!55372 (arrayContainsKey!0 (_keys!3616 (v!2319 (underlying!201 thiss!992))) (select (arr!1727 (_keys!3616 (v!2319 (underlying!201 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!21915 () Unit!1453)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!16 (array!3609 array!3611 (_ BitVec 32) (_ BitVec 32) V!2771 V!2771 (_ BitVec 64) (_ BitVec 32) Int) Unit!1453)

(assert (=> b!55372 (= lt!21915 (lemmaListMapContainsThenArrayContainsFrom!16 (_keys!3616 (v!2319 (underlying!201 thiss!992))) (_values!1979 (v!2319 (underlying!201 thiss!992))) (mask!5853 (v!2319 (underlying!201 thiss!992))) (extraKeys!1887 (v!2319 (underlying!201 thiss!992))) (zeroValue!1914 (v!2319 (underlying!201 thiss!992))) (minValue!1914 (v!2319 (underlying!201 thiss!992))) (select (arr!1727 (_keys!3616 (v!2319 (underlying!201 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1996 (v!2319 (underlying!201 thiss!992)))))))

(declare-fun b!55373 () Bool)

(declare-fun res!31198 () Bool)

(declare-fun e!36377 () Bool)

(assert (=> b!55373 (=> (not res!31198) (not e!36377))))

(assert (=> b!55373 (= res!31198 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1956 (_keys!3616 (v!2319 (underlying!201 thiss!992)))))))))

(declare-fun mapIsEmpty!2699 () Bool)

(declare-fun mapRes!2699 () Bool)

(assert (=> mapIsEmpty!2699 mapRes!2699))

(declare-fun b!55374 () Bool)

(declare-fun e!36373 () Bool)

(declare-fun e!36380 () Bool)

(assert (=> b!55374 (= e!36373 e!36380)))

(declare-fun b!55375 () Bool)

(assert (=> b!55375 (= e!36375 true)))

(declare-fun lt!21919 () Bool)

(assert (=> b!55375 (= lt!21919 (contains!655 lt!21918 (select (arr!1727 (_keys!3616 (v!2319 (underlying!201 thiss!992)))) from!355)))))

(declare-fun res!31193 () Bool)

(assert (=> start!8344 (=> (not res!31193) (not e!36377))))

(declare-fun valid!224 (LongMap!380) Bool)

(assert (=> start!8344 (= res!31193 (valid!224 thiss!992))))

(assert (=> start!8344 e!36377))

(assert (=> start!8344 e!36373))

(assert (=> start!8344 true))

(declare-fun e!36376 () Bool)

(assert (=> start!8344 e!36376))

(declare-fun b!55376 () Bool)

(declare-fun e!36379 () Bool)

(declare-fun tp_is_empty!2343 () Bool)

(assert (=> b!55376 (= e!36379 tp_is_empty!2343)))

(declare-fun b!55377 () Bool)

(declare-fun e!36371 () Bool)

(assert (=> b!55377 (= e!36380 e!36371)))

(declare-fun e!36369 () Bool)

(declare-fun array_inv!1069 (array!3609) Bool)

(declare-fun array_inv!1070 (array!3611) Bool)

(assert (=> b!55378 (= e!36371 (and tp!7659 tp_is_empty!2343 (array_inv!1069 (_keys!3616 (v!2319 (underlying!201 thiss!992)))) (array_inv!1070 (_values!1979 (v!2319 (underlying!201 thiss!992)))) e!36369))))

(declare-fun mapNonEmpty!2699 () Bool)

(declare-fun tp!7662 () Bool)

(declare-fun e!36382 () Bool)

(assert (=> mapNonEmpty!2699 (= mapRes!2699 (and tp!7662 e!36382))))

(declare-fun mapValue!2700 () ValueCell!828)

(declare-fun mapKey!2699 () (_ BitVec 32))

(declare-fun mapRest!2700 () (Array (_ BitVec 32) ValueCell!828))

(assert (=> mapNonEmpty!2699 (= (arr!1728 (_values!1979 newMap!16)) (store mapRest!2700 mapKey!2699 mapValue!2700))))

(declare-fun mapNonEmpty!2700 () Bool)

(declare-fun mapRes!2700 () Bool)

(declare-fun tp!7660 () Bool)

(assert (=> mapNonEmpty!2700 (= mapRes!2700 (and tp!7660 e!36379))))

(declare-fun mapValue!2699 () ValueCell!828)

(declare-fun mapRest!2699 () (Array (_ BitVec 32) ValueCell!828))

(declare-fun mapKey!2700 () (_ BitVec 32))

(assert (=> mapNonEmpty!2700 (= (arr!1728 (_values!1979 (v!2319 (underlying!201 thiss!992)))) (store mapRest!2699 mapKey!2700 mapValue!2699))))

(declare-fun mapIsEmpty!2700 () Bool)

(assert (=> mapIsEmpty!2700 mapRes!2700))

(declare-fun e!36368 () Bool)

(assert (=> b!55379 (= e!36376 (and tp!7661 tp_is_empty!2343 (array_inv!1069 (_keys!3616 newMap!16)) (array_inv!1070 (_values!1979 newMap!16)) e!36368))))

(declare-fun b!55380 () Bool)

(declare-fun res!31195 () Bool)

(assert (=> b!55380 (=> (not res!31195) (not e!36377))))

(declare-fun valid!225 (LongMapFixedSize!564) Bool)

(assert (=> b!55380 (= res!31195 (valid!225 newMap!16))))

(declare-fun b!55381 () Bool)

(declare-fun res!31194 () Bool)

(assert (=> b!55381 (=> res!31194 e!36375)))

(assert (=> b!55381 (= res!31194 (contains!655 lt!21918 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!55382 () Bool)

(declare-fun e!36381 () Bool)

(assert (=> b!55382 (= e!36381 tp_is_empty!2343)))

(declare-fun b!55383 () Bool)

(declare-fun res!31199 () Bool)

(assert (=> b!55383 (=> res!31199 e!36375)))

(declare-fun noDuplicate!41 (List!1394) Bool)

(assert (=> b!55383 (= res!31199 (not (noDuplicate!41 lt!21918)))))

(declare-fun b!55384 () Bool)

(declare-fun res!31190 () Bool)

(assert (=> b!55384 (=> res!31190 e!36375)))

(assert (=> b!55384 (= res!31190 (not (arrayNoDuplicates!0 (_keys!3616 (v!2319 (underlying!201 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!21918)))))

(declare-fun b!55385 () Bool)

(declare-fun res!31197 () Bool)

(assert (=> b!55385 (=> (not res!31197) (not e!36377))))

(assert (=> b!55385 (= res!31197 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5853 newMap!16)) (_size!331 (v!2319 (underlying!201 thiss!992)))))))

(declare-fun b!55386 () Bool)

(declare-fun e!36374 () Bool)

(assert (=> b!55386 (= e!36368 (and e!36374 mapRes!2699))))

(declare-fun condMapEmpty!2700 () Bool)

(declare-fun mapDefault!2700 () ValueCell!828)

(assert (=> b!55386 (= condMapEmpty!2700 (= (arr!1728 (_values!1979 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!828)) mapDefault!2700)))))

(declare-fun b!55387 () Bool)

(assert (=> b!55387 (= e!36382 tp_is_empty!2343)))

(declare-fun b!55388 () Bool)

(assert (=> b!55388 (= e!36374 tp_is_empty!2343)))

(declare-fun b!55389 () Bool)

(assert (=> b!55389 (= e!36369 (and e!36381 mapRes!2700))))

(declare-fun condMapEmpty!2699 () Bool)

(declare-fun mapDefault!2699 () ValueCell!828)

(assert (=> b!55389 (= condMapEmpty!2699 (= (arr!1728 (_values!1979 (v!2319 (underlying!201 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!828)) mapDefault!2699)))))

(declare-fun b!55390 () Bool)

(assert (=> b!55390 (= e!36377 e!36383)))

(declare-fun res!31192 () Bool)

(assert (=> b!55390 (=> (not res!31192) (not e!36383))))

(declare-fun lt!21917 () ListLongMap!1329)

(assert (=> b!55390 (= res!31192 (and (= lt!21917 lt!21916) (not (= (select (arr!1727 (_keys!3616 (v!2319 (underlying!201 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1727 (_keys!3616 (v!2319 (underlying!201 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1072 (LongMapFixedSize!564) ListLongMap!1329)

(assert (=> b!55390 (= lt!21916 (map!1072 newMap!16))))

(declare-fun getCurrentListMap!387 (array!3609 array!3611 (_ BitVec 32) (_ BitVec 32) V!2771 V!2771 (_ BitVec 32) Int) ListLongMap!1329)

(assert (=> b!55390 (= lt!21917 (getCurrentListMap!387 (_keys!3616 (v!2319 (underlying!201 thiss!992))) (_values!1979 (v!2319 (underlying!201 thiss!992))) (mask!5853 (v!2319 (underlying!201 thiss!992))) (extraKeys!1887 (v!2319 (underlying!201 thiss!992))) (zeroValue!1914 (v!2319 (underlying!201 thiss!992))) (minValue!1914 (v!2319 (underlying!201 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1996 (v!2319 (underlying!201 thiss!992)))))))

(assert (= (and start!8344 res!31193) b!55373))

(assert (= (and b!55373 res!31198) b!55380))

(assert (= (and b!55380 res!31195) b!55385))

(assert (= (and b!55385 res!31197) b!55390))

(assert (= (and b!55390 res!31192) b!55370))

(assert (= (and b!55370 res!31196) b!55372))

(assert (= (and b!55372 (not res!31189)) b!55383))

(assert (= (and b!55383 (not res!31199)) b!55381))

(assert (= (and b!55381 (not res!31194)) b!55371))

(assert (= (and b!55371 (not res!31191)) b!55384))

(assert (= (and b!55384 (not res!31190)) b!55375))

(assert (= (and b!55389 condMapEmpty!2699) mapIsEmpty!2700))

(assert (= (and b!55389 (not condMapEmpty!2699)) mapNonEmpty!2700))

(get-info :version)

(assert (= (and mapNonEmpty!2700 ((_ is ValueCellFull!828) mapValue!2699)) b!55376))

(assert (= (and b!55389 ((_ is ValueCellFull!828) mapDefault!2699)) b!55382))

(assert (= b!55378 b!55389))

(assert (= b!55377 b!55378))

(assert (= b!55374 b!55377))

(assert (= start!8344 b!55374))

(assert (= (and b!55386 condMapEmpty!2700) mapIsEmpty!2699))

(assert (= (and b!55386 (not condMapEmpty!2700)) mapNonEmpty!2699))

(assert (= (and mapNonEmpty!2699 ((_ is ValueCellFull!828) mapValue!2700)) b!55387))

(assert (= (and b!55386 ((_ is ValueCellFull!828) mapDefault!2700)) b!55388))

(assert (= b!55379 b!55386))

(assert (= start!8344 b!55379))

(declare-fun b_lambda!2437 () Bool)

(assert (=> (not b_lambda!2437) (not b!55370)))

(declare-fun t!4612 () Bool)

(declare-fun tb!1197 () Bool)

(assert (=> (and b!55378 (= (defaultEntry!1996 (v!2319 (underlying!201 thiss!992))) (defaultEntry!1996 (v!2319 (underlying!201 thiss!992)))) t!4612) tb!1197))

(declare-fun result!2193 () Bool)

(assert (=> tb!1197 (= result!2193 tp_is_empty!2343)))

(assert (=> b!55370 t!4612))

(declare-fun b_and!3251 () Bool)

(assert (= b_and!3247 (and (=> t!4612 result!2193) b_and!3251)))

(declare-fun t!4614 () Bool)

(declare-fun tb!1199 () Bool)

(assert (=> (and b!55379 (= (defaultEntry!1996 newMap!16) (defaultEntry!1996 (v!2319 (underlying!201 thiss!992)))) t!4614) tb!1199))

(declare-fun result!2197 () Bool)

(assert (= result!2197 result!2193))

(assert (=> b!55370 t!4614))

(declare-fun b_and!3253 () Bool)

(assert (= b_and!3249 (and (=> t!4614 result!2197) b_and!3253)))

(declare-fun m!46705 () Bool)

(assert (=> b!55375 m!46705))

(assert (=> b!55375 m!46705))

(declare-fun m!46707 () Bool)

(assert (=> b!55375 m!46707))

(declare-fun m!46709 () Bool)

(assert (=> b!55383 m!46709))

(declare-fun m!46711 () Bool)

(assert (=> b!55381 m!46711))

(declare-fun m!46713 () Bool)

(assert (=> b!55378 m!46713))

(declare-fun m!46715 () Bool)

(assert (=> b!55378 m!46715))

(declare-fun m!46717 () Bool)

(assert (=> b!55371 m!46717))

(declare-fun m!46719 () Bool)

(assert (=> b!55384 m!46719))

(declare-fun m!46721 () Bool)

(assert (=> mapNonEmpty!2699 m!46721))

(declare-fun m!46723 () Bool)

(assert (=> mapNonEmpty!2700 m!46723))

(assert (=> b!55390 m!46705))

(declare-fun m!46725 () Bool)

(assert (=> b!55390 m!46725))

(declare-fun m!46727 () Bool)

(assert (=> b!55390 m!46727))

(declare-fun m!46729 () Bool)

(assert (=> b!55370 m!46729))

(declare-fun m!46731 () Bool)

(assert (=> b!55370 m!46731))

(declare-fun m!46733 () Bool)

(assert (=> b!55370 m!46733))

(assert (=> b!55370 m!46705))

(assert (=> b!55370 m!46731))

(assert (=> b!55370 m!46705))

(declare-fun m!46735 () Bool)

(assert (=> b!55370 m!46735))

(assert (=> b!55370 m!46705))

(assert (=> b!55370 m!46733))

(declare-fun m!46737 () Bool)

(assert (=> b!55370 m!46737))

(assert (=> b!55370 m!46729))

(declare-fun m!46739 () Bool)

(assert (=> start!8344 m!46739))

(declare-fun m!46741 () Bool)

(assert (=> b!55380 m!46741))

(declare-fun m!46743 () Bool)

(assert (=> b!55372 m!46743))

(declare-fun m!46745 () Bool)

(assert (=> b!55372 m!46745))

(assert (=> b!55372 m!46705))

(declare-fun m!46747 () Bool)

(assert (=> b!55372 m!46747))

(assert (=> b!55372 m!46705))

(assert (=> b!55372 m!46705))

(declare-fun m!46749 () Bool)

(assert (=> b!55372 m!46749))

(declare-fun m!46751 () Bool)

(assert (=> b!55379 m!46751))

(declare-fun m!46753 () Bool)

(assert (=> b!55379 m!46753))

(check-sat (not b!55378) (not start!8344) b_and!3253 (not b_next!1853) b_and!3251 (not b!55390) (not b!55375) (not b!55372) tp_is_empty!2343 (not b_lambda!2437) (not b!55379) (not b!55381) (not mapNonEmpty!2700) (not b!55383) (not b!55371) (not b!55384) (not mapNonEmpty!2699) (not b!55370) (not b_next!1855) (not b!55380))
(check-sat b_and!3251 b_and!3253 (not b_next!1853) (not b_next!1855))
