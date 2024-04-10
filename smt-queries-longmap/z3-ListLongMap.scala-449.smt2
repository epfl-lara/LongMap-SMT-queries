; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8308 () Bool)

(assert start!8308)

(declare-fun b!54393 () Bool)

(declare-fun b_free!1781 () Bool)

(declare-fun b_next!1781 () Bool)

(assert (=> b!54393 (= b_free!1781 (not b_next!1781))))

(declare-fun tp!7444 () Bool)

(declare-fun b_and!3103 () Bool)

(assert (=> b!54393 (= tp!7444 b_and!3103)))

(declare-fun b!54386 () Bool)

(declare-fun b_free!1783 () Bool)

(declare-fun b_next!1783 () Bool)

(assert (=> b!54386 (= b_free!1783 (not b_next!1783))))

(declare-fun tp!7446 () Bool)

(declare-fun b_and!3105 () Bool)

(assert (=> b!54386 (= tp!7446 b_and!3105)))

(declare-fun mapNonEmpty!2591 () Bool)

(declare-fun mapRes!2592 () Bool)

(declare-fun tp!7443 () Bool)

(declare-fun e!35518 () Bool)

(assert (=> mapNonEmpty!2591 (= mapRes!2592 (and tp!7443 e!35518))))

(declare-datatypes ((V!2723 0))(
  ( (V!2724 (val!1198 Int)) )
))
(declare-datatypes ((array!3537 0))(
  ( (array!3538 (arr!1691 (Array (_ BitVec 32) (_ BitVec 64))) (size!1920 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!810 0))(
  ( (ValueCellFull!810 (v!2282 V!2723)) (EmptyCell!810) )
))
(declare-datatypes ((array!3539 0))(
  ( (array!3540 (arr!1692 (Array (_ BitVec 32) ValueCell!810)) (size!1921 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!528 0))(
  ( (LongMapFixedSize!529 (defaultEntry!1978 Int) (mask!5823 (_ BitVec 32)) (extraKeys!1869 (_ BitVec 32)) (zeroValue!1896 V!2723) (minValue!1896 V!2723) (_size!313 (_ BitVec 32)) (_keys!3598 array!3537) (_values!1961 array!3539) (_vacant!313 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!344 0))(
  ( (Cell!345 (v!2283 LongMapFixedSize!528)) )
))
(declare-datatypes ((LongMap!344 0))(
  ( (LongMap!345 (underlying!183 Cell!344)) )
))
(declare-fun thiss!992 () LongMap!344)

(declare-fun mapKey!2591 () (_ BitVec 32))

(declare-fun mapRest!2591 () (Array (_ BitVec 32) ValueCell!810))

(declare-fun mapValue!2591 () ValueCell!810)

(assert (=> mapNonEmpty!2591 (= (arr!1692 (_values!1961 (v!2283 (underlying!183 thiss!992)))) (store mapRest!2591 mapKey!2591 mapValue!2591))))

(declare-fun b!54380 () Bool)

(declare-fun res!30777 () Bool)

(declare-fun e!35512 () Bool)

(assert (=> b!54380 (=> (not res!30777) (not e!35512))))

(declare-datatypes ((List!1372 0))(
  ( (Nil!1369) (Cons!1368 (h!1948 (_ BitVec 64)) (t!4522 List!1372)) )
))
(declare-fun arrayNoDuplicates!0 (array!3537 (_ BitVec 32) List!1372) Bool)

(assert (=> b!54380 (= res!30777 (arrayNoDuplicates!0 (_keys!3598 (v!2283 (underlying!183 thiss!992))) #b00000000000000000000000000000000 Nil!1369))))

(declare-fun b!54381 () Bool)

(declare-fun e!35513 () Bool)

(declare-fun e!35519 () Bool)

(assert (=> b!54381 (= e!35513 e!35519)))

(declare-fun b!54382 () Bool)

(declare-fun e!35508 () Bool)

(declare-fun tp_is_empty!2307 () Bool)

(assert (=> b!54382 (= e!35508 tp_is_empty!2307)))

(declare-fun res!30778 () Bool)

(declare-fun e!35521 () Bool)

(assert (=> start!8308 (=> (not res!30778) (not e!35521))))

(declare-fun valid!203 (LongMap!344) Bool)

(assert (=> start!8308 (= res!30778 (valid!203 thiss!992))))

(assert (=> start!8308 e!35521))

(declare-fun e!35515 () Bool)

(assert (=> start!8308 e!35515))

(assert (=> start!8308 true))

(declare-fun e!35509 () Bool)

(assert (=> start!8308 e!35509))

(declare-fun b!54383 () Bool)

(declare-fun e!35516 () Bool)

(assert (=> b!54383 (= e!35521 e!35516)))

(declare-fun res!30779 () Bool)

(assert (=> b!54383 (=> (not res!30779) (not e!35516))))

(declare-datatypes ((tuple2!1918 0))(
  ( (tuple2!1919 (_1!970 (_ BitVec 64)) (_2!970 V!2723)) )
))
(declare-datatypes ((List!1373 0))(
  ( (Nil!1370) (Cons!1369 (h!1949 tuple2!1918) (t!4523 List!1373)) )
))
(declare-datatypes ((ListLongMap!1307 0))(
  ( (ListLongMap!1308 (toList!669 List!1373)) )
))
(declare-fun lt!21640 () ListLongMap!1307)

(declare-fun lt!21642 () ListLongMap!1307)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!54383 (= res!30779 (and (= lt!21642 lt!21640) (not (= (select (arr!1691 (_keys!3598 (v!2283 (underlying!183 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1691 (_keys!3598 (v!2283 (underlying!183 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!528)

(declare-fun map!1052 (LongMapFixedSize!528) ListLongMap!1307)

(assert (=> b!54383 (= lt!21640 (map!1052 newMap!16))))

(declare-fun getCurrentListMap!379 (array!3537 array!3539 (_ BitVec 32) (_ BitVec 32) V!2723 V!2723 (_ BitVec 32) Int) ListLongMap!1307)

(assert (=> b!54383 (= lt!21642 (getCurrentListMap!379 (_keys!3598 (v!2283 (underlying!183 thiss!992))) (_values!1961 (v!2283 (underlying!183 thiss!992))) (mask!5823 (v!2283 (underlying!183 thiss!992))) (extraKeys!1869 (v!2283 (underlying!183 thiss!992))) (zeroValue!1896 (v!2283 (underlying!183 thiss!992))) (minValue!1896 (v!2283 (underlying!183 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1978 (v!2283 (underlying!183 thiss!992)))))))

(declare-fun b!54384 () Bool)

(declare-fun e!35511 () Bool)

(declare-fun e!35517 () Bool)

(declare-fun mapRes!2591 () Bool)

(assert (=> b!54384 (= e!35511 (and e!35517 mapRes!2591))))

(declare-fun condMapEmpty!2591 () Bool)

(declare-fun mapDefault!2592 () ValueCell!810)

(assert (=> b!54384 (= condMapEmpty!2591 (= (arr!1692 (_values!1961 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!810)) mapDefault!2592)))))

(declare-fun b!54385 () Bool)

(assert (=> b!54385 (= e!35517 tp_is_empty!2307)))

(declare-fun array_inv!1045 (array!3537) Bool)

(declare-fun array_inv!1046 (array!3539) Bool)

(assert (=> b!54386 (= e!35509 (and tp!7446 tp_is_empty!2307 (array_inv!1045 (_keys!3598 newMap!16)) (array_inv!1046 (_values!1961 newMap!16)) e!35511))))

(declare-fun b!54387 () Bool)

(assert (=> b!54387 (= e!35515 e!35513)))

(declare-fun b!54388 () Bool)

(assert (=> b!54388 (= e!35518 tp_is_empty!2307)))

(declare-fun b!54389 () Bool)

(declare-fun res!30776 () Bool)

(assert (=> b!54389 (=> (not res!30776) (not e!35512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!54389 (= res!30776 (validMask!0 (mask!5823 (v!2283 (underlying!183 thiss!992)))))))

(declare-fun b!54390 () Bool)

(declare-fun e!35522 () Bool)

(assert (=> b!54390 (= e!35522 (and e!35508 mapRes!2592))))

(declare-fun condMapEmpty!2592 () Bool)

(declare-fun mapDefault!2591 () ValueCell!810)

(assert (=> b!54390 (= condMapEmpty!2592 (= (arr!1692 (_values!1961 (v!2283 (underlying!183 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!810)) mapDefault!2591)))))

(declare-fun b!54391 () Bool)

(declare-fun res!30782 () Bool)

(assert (=> b!54391 (=> (not res!30782) (not e!35521))))

(assert (=> b!54391 (= res!30782 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5823 newMap!16)) (_size!313 (v!2283 (underlying!183 thiss!992)))))))

(declare-fun b!54392 () Bool)

(declare-fun res!30783 () Bool)

(assert (=> b!54392 (=> (not res!30783) (not e!35512))))

(assert (=> b!54392 (= res!30783 (and (= (size!1921 (_values!1961 (v!2283 (underlying!183 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5823 (v!2283 (underlying!183 thiss!992))))) (= (size!1920 (_keys!3598 (v!2283 (underlying!183 thiss!992)))) (size!1921 (_values!1961 (v!2283 (underlying!183 thiss!992))))) (bvsge (mask!5823 (v!2283 (underlying!183 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1869 (v!2283 (underlying!183 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1869 (v!2283 (underlying!183 thiss!992))) #b00000000000000000000000000000011)))))

(assert (=> b!54393 (= e!35519 (and tp!7444 tp_is_empty!2307 (array_inv!1045 (_keys!3598 (v!2283 (underlying!183 thiss!992)))) (array_inv!1046 (_values!1961 (v!2283 (underlying!183 thiss!992)))) e!35522))))

(declare-fun b!54394 () Bool)

(declare-fun e!35514 () Bool)

(assert (=> b!54394 (= e!35514 tp_is_empty!2307)))

(declare-fun b!54395 () Bool)

(declare-fun res!30775 () Bool)

(assert (=> b!54395 (=> (not res!30775) (not e!35512))))

(assert (=> b!54395 (= res!30775 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1920 (_keys!3598 (v!2283 (underlying!183 thiss!992)))))))))

(declare-fun mapIsEmpty!2591 () Bool)

(assert (=> mapIsEmpty!2591 mapRes!2592))

(declare-fun b!54396 () Bool)

(assert (=> b!54396 (= e!35516 e!35512)))

(declare-fun res!30781 () Bool)

(assert (=> b!54396 (=> (not res!30781) (not e!35512))))

(declare-fun contains!642 (ListLongMap!1307 (_ BitVec 64)) Bool)

(assert (=> b!54396 (= res!30781 (contains!642 lt!21640 (select (arr!1691 (_keys!3598 (v!2283 (underlying!183 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1920 0))(
  ( (tuple2!1921 (_1!971 Bool) (_2!971 LongMapFixedSize!528)) )
))
(declare-fun lt!21641 () tuple2!1920)

(declare-fun update!50 (LongMapFixedSize!528 (_ BitVec 64) V!2723) tuple2!1920)

(declare-fun get!1008 (ValueCell!810 V!2723) V!2723)

(declare-fun dynLambda!281 (Int (_ BitVec 64)) V!2723)

(assert (=> b!54396 (= lt!21641 (update!50 newMap!16 (select (arr!1691 (_keys!3598 (v!2283 (underlying!183 thiss!992)))) from!355) (get!1008 (select (arr!1692 (_values!1961 (v!2283 (underlying!183 thiss!992)))) from!355) (dynLambda!281 (defaultEntry!1978 (v!2283 (underlying!183 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!54397 () Bool)

(declare-fun res!30780 () Bool)

(assert (=> b!54397 (=> (not res!30780) (not e!35521))))

(assert (=> b!54397 (= res!30780 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1920 (_keys!3598 (v!2283 (underlying!183 thiss!992)))))))))

(declare-fun mapNonEmpty!2592 () Bool)

(declare-fun tp!7445 () Bool)

(assert (=> mapNonEmpty!2592 (= mapRes!2591 (and tp!7445 e!35514))))

(declare-fun mapValue!2592 () ValueCell!810)

(declare-fun mapRest!2592 () (Array (_ BitVec 32) ValueCell!810))

(declare-fun mapKey!2592 () (_ BitVec 32))

(assert (=> mapNonEmpty!2592 (= (arr!1692 (_values!1961 newMap!16)) (store mapRest!2592 mapKey!2592 mapValue!2592))))

(declare-fun b!54398 () Bool)

(declare-fun res!30785 () Bool)

(assert (=> b!54398 (=> (not res!30785) (not e!35521))))

(declare-fun valid!204 (LongMapFixedSize!528) Bool)

(assert (=> b!54398 (= res!30785 (valid!204 newMap!16))))

(declare-fun mapIsEmpty!2592 () Bool)

(assert (=> mapIsEmpty!2592 mapRes!2591))

(declare-fun b!54399 () Bool)

(declare-fun res!30784 () Bool)

(assert (=> b!54399 (=> (not res!30784) (not e!35512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3537 (_ BitVec 32)) Bool)

(assert (=> b!54399 (= res!30784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3598 (v!2283 (underlying!183 thiss!992))) (mask!5823 (v!2283 (underlying!183 thiss!992)))))))

(declare-fun b!54400 () Bool)

(assert (=> b!54400 (= e!35512 false)))

(declare-fun lt!21639 () Bool)

(assert (=> b!54400 (= lt!21639 (contains!642 lt!21642 (select (arr!1691 (_keys!3598 (v!2283 (underlying!183 thiss!992)))) from!355)))))

(assert (= (and start!8308 res!30778) b!54397))

(assert (= (and b!54397 res!30780) b!54398))

(assert (= (and b!54398 res!30785) b!54391))

(assert (= (and b!54391 res!30782) b!54383))

(assert (= (and b!54383 res!30779) b!54396))

(assert (= (and b!54396 res!30781) b!54389))

(assert (= (and b!54389 res!30776) b!54392))

(assert (= (and b!54392 res!30783) b!54399))

(assert (= (and b!54399 res!30784) b!54380))

(assert (= (and b!54380 res!30777) b!54395))

(assert (= (and b!54395 res!30775) b!54400))

(assert (= (and b!54390 condMapEmpty!2592) mapIsEmpty!2591))

(assert (= (and b!54390 (not condMapEmpty!2592)) mapNonEmpty!2591))

(get-info :version)

(assert (= (and mapNonEmpty!2591 ((_ is ValueCellFull!810) mapValue!2591)) b!54388))

(assert (= (and b!54390 ((_ is ValueCellFull!810) mapDefault!2591)) b!54382))

(assert (= b!54393 b!54390))

(assert (= b!54381 b!54393))

(assert (= b!54387 b!54381))

(assert (= start!8308 b!54387))

(assert (= (and b!54384 condMapEmpty!2591) mapIsEmpty!2592))

(assert (= (and b!54384 (not condMapEmpty!2591)) mapNonEmpty!2592))

(assert (= (and mapNonEmpty!2592 ((_ is ValueCellFull!810) mapValue!2592)) b!54394))

(assert (= (and b!54384 ((_ is ValueCellFull!810) mapDefault!2592)) b!54385))

(assert (= b!54386 b!54384))

(assert (= start!8308 b!54386))

(declare-fun b_lambda!2401 () Bool)

(assert (=> (not b_lambda!2401) (not b!54396)))

(declare-fun t!4519 () Bool)

(declare-fun tb!1125 () Bool)

(assert (=> (and b!54393 (= (defaultEntry!1978 (v!2283 (underlying!183 thiss!992))) (defaultEntry!1978 (v!2283 (underlying!183 thiss!992)))) t!4519) tb!1125))

(declare-fun result!2085 () Bool)

(assert (=> tb!1125 (= result!2085 tp_is_empty!2307)))

(assert (=> b!54396 t!4519))

(declare-fun b_and!3107 () Bool)

(assert (= b_and!3103 (and (=> t!4519 result!2085) b_and!3107)))

(declare-fun tb!1127 () Bool)

(declare-fun t!4521 () Bool)

(assert (=> (and b!54386 (= (defaultEntry!1978 newMap!16) (defaultEntry!1978 (v!2283 (underlying!183 thiss!992)))) t!4521) tb!1127))

(declare-fun result!2089 () Bool)

(assert (= result!2089 result!2085))

(assert (=> b!54396 t!4521))

(declare-fun b_and!3109 () Bool)

(assert (= b_and!3105 (and (=> t!4521 result!2089) b_and!3109)))

(declare-fun m!46005 () Bool)

(assert (=> b!54389 m!46005))

(declare-fun m!46007 () Bool)

(assert (=> start!8308 m!46007))

(declare-fun m!46009 () Bool)

(assert (=> b!54400 m!46009))

(assert (=> b!54400 m!46009))

(declare-fun m!46011 () Bool)

(assert (=> b!54400 m!46011))

(assert (=> b!54383 m!46009))

(declare-fun m!46013 () Bool)

(assert (=> b!54383 m!46013))

(declare-fun m!46015 () Bool)

(assert (=> b!54383 m!46015))

(declare-fun m!46017 () Bool)

(assert (=> mapNonEmpty!2592 m!46017))

(declare-fun m!46019 () Bool)

(assert (=> b!54399 m!46019))

(declare-fun m!46021 () Bool)

(assert (=> mapNonEmpty!2591 m!46021))

(declare-fun m!46023 () Bool)

(assert (=> b!54398 m!46023))

(assert (=> b!54396 m!46009))

(declare-fun m!46025 () Bool)

(assert (=> b!54396 m!46025))

(assert (=> b!54396 m!46009))

(declare-fun m!46027 () Bool)

(assert (=> b!54396 m!46027))

(declare-fun m!46029 () Bool)

(assert (=> b!54396 m!46029))

(declare-fun m!46031 () Bool)

(assert (=> b!54396 m!46031))

(assert (=> b!54396 m!46031))

(assert (=> b!54396 m!46025))

(assert (=> b!54396 m!46027))

(assert (=> b!54396 m!46009))

(declare-fun m!46033 () Bool)

(assert (=> b!54396 m!46033))

(declare-fun m!46035 () Bool)

(assert (=> b!54386 m!46035))

(declare-fun m!46037 () Bool)

(assert (=> b!54386 m!46037))

(declare-fun m!46039 () Bool)

(assert (=> b!54380 m!46039))

(declare-fun m!46041 () Bool)

(assert (=> b!54393 m!46041))

(declare-fun m!46043 () Bool)

(assert (=> b!54393 m!46043))

(check-sat (not start!8308) b_and!3107 (not mapNonEmpty!2592) (not b!54398) tp_is_empty!2307 (not b!54396) (not b!54383) (not b!54393) (not mapNonEmpty!2591) (not b_next!1783) (not b!54400) (not b!54380) (not b!54386) b_and!3109 (not b!54399) (not b_lambda!2401) (not b!54389) (not b_next!1781))
(check-sat b_and!3107 b_and!3109 (not b_next!1781) (not b_next!1783))
