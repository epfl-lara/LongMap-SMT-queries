; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3366 () Bool)

(assert start!3366)

(declare-fun b!21421 () Bool)

(declare-fun b_free!737 () Bool)

(declare-fun b_next!737 () Bool)

(assert (=> b!21421 (= b_free!737 (not b_next!737))))

(declare-fun tp!3447 () Bool)

(declare-fun b_and!1425 () Bool)

(assert (=> b!21421 (= tp!3447 b_and!1425)))

(declare-fun b!21417 () Bool)

(declare-datatypes ((V!1159 0))(
  ( (V!1160 (val!527 Int)) )
))
(declare-datatypes ((ValueCell!301 0))(
  ( (ValueCellFull!301 (v!1574 V!1159)) (EmptyCell!301) )
))
(declare-datatypes ((array!1233 0))(
  ( (array!1234 (arr!585 (Array (_ BitVec 32) ValueCell!301)) (size!678 (_ BitVec 32))) )
))
(declare-datatypes ((array!1235 0))(
  ( (array!1236 (arr!586 (Array (_ BitVec 32) (_ BitVec 64))) (size!679 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!188 0))(
  ( (LongMapFixedSize!189 (defaultEntry!1720 Int) (mask!4693 (_ BitVec 32)) (extraKeys!1623 (_ BitVec 32)) (zeroValue!1647 V!1159) (minValue!1647 V!1159) (_size!135 (_ BitVec 32)) (_keys!3141 array!1235) (_values!1709 array!1233) (_vacant!135 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!902 0))(
  ( (tuple2!903 (_1!454 Bool) (_2!454 LongMapFixedSize!188)) )
))
(declare-fun lt!6701 () tuple2!902)

(declare-fun call!1354 () tuple2!902)

(assert (=> b!21417 (= lt!6701 call!1354)))

(declare-datatypes ((Cell!188 0))(
  ( (Cell!189 (v!1575 LongMapFixedSize!188)) )
))
(declare-datatypes ((tuple2!904 0))(
  ( (tuple2!905 (_1!455 Bool) (_2!455 Cell!188)) )
))
(declare-fun e!13967 () tuple2!904)

(assert (=> b!21417 (= e!13967 (tuple2!905 (_1!454 lt!6701) (Cell!189 (_2!454 lt!6701))))))

(declare-fun b!21418 () Bool)

(declare-fun res!13785 () Bool)

(declare-fun e!13968 () Bool)

(assert (=> b!21418 (=> (not res!13785) (not e!13968))))

(declare-datatypes ((LongMap!188 0))(
  ( (LongMap!189 (underlying!105 Cell!188)) )
))
(declare-fun thiss!938 () LongMap!188)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!21418 (= res!13785 (validMask!0 (mask!4693 (v!1575 (underlying!105 thiss!938)))))))

(declare-fun b!21419 () Bool)

(declare-fun e!13966 () Bool)

(declare-fun tp_is_empty!1001 () Bool)

(assert (=> b!21419 (= e!13966 tp_is_empty!1001)))

(declare-fun b!21420 () Bool)

(declare-fun lt!6700 () tuple2!904)

(declare-datatypes ((tuple2!906 0))(
  ( (tuple2!907 (_1!456 (_ BitVec 64)) (_2!456 V!1159)) )
))
(declare-datatypes ((List!562 0))(
  ( (Nil!559) (Cons!558 (h!1124 tuple2!906) (t!3219 List!562)) )
))
(declare-datatypes ((ListLongMap!561 0))(
  ( (ListLongMap!562 (toList!296 List!562)) )
))
(declare-fun getCurrentListMap!127 (array!1235 array!1233 (_ BitVec 32) (_ BitVec 32) V!1159 V!1159 (_ BitVec 32) Int) ListLongMap!561)

(declare-fun map!396 (LongMapFixedSize!188) ListLongMap!561)

(assert (=> b!21420 (= e!13968 (not (= (getCurrentListMap!127 (_keys!3141 (v!1575 (underlying!105 thiss!938))) (_values!1709 (v!1575 (underlying!105 thiss!938))) (mask!4693 (v!1575 (underlying!105 thiss!938))) (extraKeys!1623 (v!1575 (underlying!105 thiss!938))) (zeroValue!1647 (v!1575 (underlying!105 thiss!938))) (minValue!1647 (v!1575 (underlying!105 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!679 (_keys!3141 (v!1575 (underlying!105 thiss!938)))) #b00000000000000000000000000000001)) (defaultEntry!1720 (v!1575 (underlying!105 thiss!938)))) (map!396 (v!1575 (_2!455 lt!6700))))))))

(declare-fun e!13965 () Bool)

(declare-fun e!13971 () Bool)

(declare-fun array_inv!395 (array!1235) Bool)

(declare-fun array_inv!396 (array!1233) Bool)

(assert (=> b!21421 (= e!13965 (and tp!3447 tp_is_empty!1001 (array_inv!395 (_keys!3141 (v!1575 (underlying!105 thiss!938)))) (array_inv!396 (_values!1709 (v!1575 (underlying!105 thiss!938)))) e!13971))))

(declare-fun b!21422 () Bool)

(declare-fun res!13786 () Bool)

(assert (=> b!21422 (=> (not res!13786) (not e!13968))))

(assert (=> b!21422 (= res!13786 (and (= (size!679 (_keys!3141 (v!1575 (underlying!105 thiss!938)))) (bvadd #b00000000000000000000000000000001 (mask!4693 (v!1575 (underlying!105 thiss!938))))) (bvsge (bvsub (size!679 (_keys!3141 (v!1575 (underlying!105 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (size!679 (_keys!3141 (v!1575 (underlying!105 thiss!938)))) #b00000000000000000000000000000001) (size!679 (_keys!3141 (v!1575 (underlying!105 thiss!938)))))))))

(declare-fun bm!1350 () Bool)

(declare-fun call!1353 () tuple2!902)

(declare-fun c!2462 () Bool)

(declare-fun lt!6696 () LongMapFixedSize!188)

(declare-fun c!2463 () Bool)

(declare-fun update!24 (LongMapFixedSize!188 (_ BitVec 64) V!1159) tuple2!902)

(assert (=> bm!1350 (= call!1353 (update!24 lt!6696 (ite (or c!2462 c!2463) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2462 c!2463) (zeroValue!1647 (v!1575 (underlying!105 thiss!938))) (minValue!1647 (v!1575 (underlying!105 thiss!938))))))))

(declare-fun res!13788 () Bool)

(declare-fun e!13963 () Bool)

(assert (=> start!3366 (=> (not res!13788) (not e!13963))))

(declare-fun valid!94 (LongMap!188) Bool)

(assert (=> start!3366 (= res!13788 (valid!94 thiss!938))))

(assert (=> start!3366 e!13963))

(declare-fun e!13970 () Bool)

(assert (=> start!3366 e!13970))

(declare-fun mapNonEmpty!982 () Bool)

(declare-fun mapRes!982 () Bool)

(declare-fun tp!3448 () Bool)

(assert (=> mapNonEmpty!982 (= mapRes!982 (and tp!3448 e!13966))))

(declare-fun mapKey!982 () (_ BitVec 32))

(declare-fun mapRest!982 () (Array (_ BitVec 32) ValueCell!301))

(declare-fun mapValue!982 () ValueCell!301)

(assert (=> mapNonEmpty!982 (= (arr!585 (_values!1709 (v!1575 (underlying!105 thiss!938)))) (store mapRest!982 mapKey!982 mapValue!982))))

(declare-fun b!21423 () Bool)

(declare-fun e!13969 () tuple2!904)

(assert (=> b!21423 (= e!13969 e!13967)))

(declare-fun lt!6699 () Bool)

(assert (=> b!21423 (= c!2463 (and (not lt!6699) (= (bvand (extraKeys!1623 (v!1575 (underlying!105 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!21424 () Bool)

(declare-fun e!13964 () tuple2!904)

(assert (=> b!21424 (= e!13964 (tuple2!905 true (Cell!189 lt!6696)))))

(declare-fun b!21425 () Bool)

(declare-fun e!13962 () Bool)

(assert (=> b!21425 (= e!13962 tp_is_empty!1001)))

(declare-fun b!21426 () Bool)

(declare-fun res!13789 () Bool)

(assert (=> b!21426 (=> (not res!13789) (not e!13968))))

(declare-fun valid!95 (LongMapFixedSize!188) Bool)

(assert (=> b!21426 (= res!13789 (valid!95 (v!1575 (_2!455 lt!6700))))))

(declare-fun b!21427 () Bool)

(declare-fun e!13960 () Bool)

(assert (=> b!21427 (= e!13970 e!13960)))

(declare-fun b!21428 () Bool)

(declare-fun res!13787 () Bool)

(assert (=> b!21428 (=> (not res!13787) (not e!13968))))

(assert (=> b!21428 (= res!13787 (bvsge (bvadd #b00000000000000000000000000000001 (mask!4693 (v!1575 (_2!455 lt!6700)))) (_size!135 (v!1575 (underlying!105 thiss!938)))))))

(declare-fun b!21429 () Bool)

(declare-fun lt!6702 () tuple2!902)

(declare-fun lt!6698 () tuple2!902)

(assert (=> b!21429 (= e!13969 (tuple2!905 (and (_1!454 lt!6702) (_1!454 lt!6698)) (Cell!189 (_2!454 lt!6698))))))

(assert (=> b!21429 (= lt!6702 call!1353)))

(assert (=> b!21429 (= lt!6698 (update!24 (_2!454 lt!6702) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1647 (v!1575 (underlying!105 thiss!938)))))))

(declare-fun b!21430 () Bool)

(assert (=> b!21430 (= e!13960 e!13965)))

(declare-fun bm!1351 () Bool)

(assert (=> bm!1351 (= call!1354 call!1353)))

(declare-fun b!21431 () Bool)

(assert (=> b!21431 (= e!13971 (and e!13962 mapRes!982))))

(declare-fun condMapEmpty!982 () Bool)

(declare-fun mapDefault!982 () ValueCell!301)

