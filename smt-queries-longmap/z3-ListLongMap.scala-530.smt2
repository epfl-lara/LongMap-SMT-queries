; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13226 () Bool)

(assert start!13226)

(declare-fun b!116397 () Bool)

(declare-fun b_free!2749 () Bool)

(declare-fun b_next!2749 () Bool)

(assert (=> b!116397 (= b_free!2749 (not b_next!2749))))

(declare-fun tp!10622 () Bool)

(declare-fun b_and!7241 () Bool)

(assert (=> b!116397 (= tp!10622 b_and!7241)))

(declare-fun b!116396 () Bool)

(declare-fun b_free!2751 () Bool)

(declare-fun b_next!2751 () Bool)

(assert (=> b!116396 (= b_free!2751 (not b_next!2751))))

(declare-fun tp!10621 () Bool)

(declare-fun b_and!7243 () Bool)

(assert (=> b!116396 (= tp!10621 b_and!7243)))

(declare-fun mapIsEmpty!4315 () Bool)

(declare-fun mapRes!4315 () Bool)

(assert (=> mapIsEmpty!4315 mapRes!4315))

(declare-fun b!116388 () Bool)

(declare-fun e!76007 () Bool)

(declare-fun e!76009 () Bool)

(assert (=> b!116388 (= e!76007 e!76009)))

(declare-fun b!116389 () Bool)

(declare-fun e!76001 () Bool)

(declare-fun e!76000 () Bool)

(assert (=> b!116389 (= e!76001 (and e!76000 mapRes!4315))))

(declare-fun condMapEmpty!4316 () Bool)

(declare-datatypes ((V!3369 0))(
  ( (V!3370 (val!1440 Int)) )
))
(declare-datatypes ((array!4569 0))(
  ( (array!4570 (arr!2164 (Array (_ BitVec 32) (_ BitVec 64))) (size!2426 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1052 0))(
  ( (ValueCellFull!1052 (v!3042 V!3369)) (EmptyCell!1052) )
))
(declare-datatypes ((array!4571 0))(
  ( (array!4572 (arr!2165 (Array (_ BitVec 32) ValueCell!1052)) (size!2427 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1012 0))(
  ( (LongMapFixedSize!1013 (defaultEntry!2718 Int) (mask!6935 (_ BitVec 32)) (extraKeys!2507 (_ BitVec 32)) (zeroValue!2585 V!3369) (minValue!2585 V!3369) (_size!555 (_ BitVec 32)) (_keys!4440 array!4569) (_values!2701 array!4571) (_vacant!555 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1012)

(declare-fun mapDefault!4315 () ValueCell!1052)

(assert (=> b!116389 (= condMapEmpty!4316 (= (arr!2165 (_values!2701 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1052)) mapDefault!4315)))))

(declare-fun b!116390 () Bool)

(declare-fun e!76006 () Bool)

(assert (=> b!116390 (= e!76006 false)))

(declare-datatypes ((tuple2!2506 0))(
  ( (tuple2!2507 (_1!1264 (_ BitVec 64)) (_2!1264 V!3369)) )
))
(declare-datatypes ((List!1674 0))(
  ( (Nil!1671) (Cons!1670 (h!2270 tuple2!2506) (t!5935 List!1674)) )
))
(declare-datatypes ((ListLongMap!1621 0))(
  ( (ListLongMap!1622 (toList!826 List!1674)) )
))
(declare-fun lt!60383 () ListLongMap!1621)

(declare-fun map!1341 (LongMapFixedSize!1012) ListLongMap!1621)

(assert (=> b!116390 (= lt!60383 (map!1341 newMap!16))))

(declare-fun lt!60384 () ListLongMap!1621)

(declare-datatypes ((Cell!800 0))(
  ( (Cell!801 (v!3043 LongMapFixedSize!1012)) )
))
(declare-datatypes ((LongMap!800 0))(
  ( (LongMap!801 (underlying!411 Cell!800)) )
))
(declare-fun thiss!992 () LongMap!800)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!497 (array!4569 array!4571 (_ BitVec 32) (_ BitVec 32) V!3369 V!3369 (_ BitVec 32) Int) ListLongMap!1621)

(assert (=> b!116390 (= lt!60384 (getCurrentListMap!497 (_keys!4440 (v!3043 (underlying!411 thiss!992))) (_values!2701 (v!3043 (underlying!411 thiss!992))) (mask!6935 (v!3043 (underlying!411 thiss!992))) (extraKeys!2507 (v!3043 (underlying!411 thiss!992))) (zeroValue!2585 (v!3043 (underlying!411 thiss!992))) (minValue!2585 (v!3043 (underlying!411 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2718 (v!3043 (underlying!411 thiss!992)))))))

(declare-fun b!116391 () Bool)

(declare-fun e!76002 () Bool)

(declare-fun e!75999 () Bool)

(declare-fun mapRes!4316 () Bool)

(assert (=> b!116391 (= e!76002 (and e!75999 mapRes!4316))))

(declare-fun condMapEmpty!4315 () Bool)

(declare-fun mapDefault!4316 () ValueCell!1052)

(assert (=> b!116391 (= condMapEmpty!4315 (= (arr!2165 (_values!2701 (v!3043 (underlying!411 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1052)) mapDefault!4316)))))

(declare-fun b!116392 () Bool)

(declare-fun e!76005 () Bool)

(declare-fun tp_is_empty!2791 () Bool)

(assert (=> b!116392 (= e!76005 tp_is_empty!2791)))

(declare-fun b!116393 () Bool)

(declare-fun res!57015 () Bool)

(assert (=> b!116393 (=> (not res!57015) (not e!76006))))

(assert (=> b!116393 (= res!57015 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2426 (_keys!4440 (v!3043 (underlying!411 thiss!992)))))))))

(declare-fun b!116394 () Bool)

(declare-fun res!57016 () Bool)

(assert (=> b!116394 (=> (not res!57016) (not e!76006))))

(assert (=> b!116394 (= res!57016 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6935 newMap!16)) (_size!555 (v!3043 (underlying!411 thiss!992)))))))

(declare-fun res!57014 () Bool)

(assert (=> start!13226 (=> (not res!57014) (not e!76006))))

(declare-fun valid!484 (LongMap!800) Bool)

(assert (=> start!13226 (= res!57014 (valid!484 thiss!992))))

(assert (=> start!13226 e!76006))

(assert (=> start!13226 e!76007))

(assert (=> start!13226 true))

(declare-fun e!76003 () Bool)

(assert (=> start!13226 e!76003))

(declare-fun mapNonEmpty!4315 () Bool)

(declare-fun tp!10620 () Bool)

(assert (=> mapNonEmpty!4315 (= mapRes!4316 (and tp!10620 e!76005))))

(declare-fun mapValue!4316 () ValueCell!1052)

(declare-fun mapKey!4315 () (_ BitVec 32))

(declare-fun mapRest!4316 () (Array (_ BitVec 32) ValueCell!1052))

(assert (=> mapNonEmpty!4315 (= (arr!2165 (_values!2701 (v!3043 (underlying!411 thiss!992)))) (store mapRest!4316 mapKey!4315 mapValue!4316))))

(declare-fun b!116395 () Bool)

(assert (=> b!116395 (= e!75999 tp_is_empty!2791)))

(declare-fun array_inv!1371 (array!4569) Bool)

(declare-fun array_inv!1372 (array!4571) Bool)

(assert (=> b!116396 (= e!76003 (and tp!10621 tp_is_empty!2791 (array_inv!1371 (_keys!4440 newMap!16)) (array_inv!1372 (_values!2701 newMap!16)) e!76001))))

(declare-fun e!76011 () Bool)

(assert (=> b!116397 (= e!76011 (and tp!10622 tp_is_empty!2791 (array_inv!1371 (_keys!4440 (v!3043 (underlying!411 thiss!992)))) (array_inv!1372 (_values!2701 (v!3043 (underlying!411 thiss!992)))) e!76002))))

(declare-fun mapIsEmpty!4316 () Bool)

(assert (=> mapIsEmpty!4316 mapRes!4316))

(declare-fun b!116398 () Bool)

(assert (=> b!116398 (= e!76000 tp_is_empty!2791)))

(declare-fun b!116399 () Bool)

(declare-fun res!57017 () Bool)

(assert (=> b!116399 (=> (not res!57017) (not e!76006))))

(declare-fun valid!485 (LongMapFixedSize!1012) Bool)

(assert (=> b!116399 (= res!57017 (valid!485 newMap!16))))

(declare-fun b!116400 () Bool)

(assert (=> b!116400 (= e!76009 e!76011)))

(declare-fun mapNonEmpty!4316 () Bool)

(declare-fun tp!10619 () Bool)

(declare-fun e!76010 () Bool)

(assert (=> mapNonEmpty!4316 (= mapRes!4315 (and tp!10619 e!76010))))

(declare-fun mapValue!4315 () ValueCell!1052)

(declare-fun mapKey!4316 () (_ BitVec 32))

(declare-fun mapRest!4315 () (Array (_ BitVec 32) ValueCell!1052))

(assert (=> mapNonEmpty!4316 (= (arr!2165 (_values!2701 newMap!16)) (store mapRest!4315 mapKey!4316 mapValue!4315))))

(declare-fun b!116401 () Bool)

(assert (=> b!116401 (= e!76010 tp_is_empty!2791)))

(assert (= (and start!13226 res!57014) b!116393))

(assert (= (and b!116393 res!57015) b!116399))

(assert (= (and b!116399 res!57017) b!116394))

(assert (= (and b!116394 res!57016) b!116390))

(assert (= (and b!116391 condMapEmpty!4315) mapIsEmpty!4316))

(assert (= (and b!116391 (not condMapEmpty!4315)) mapNonEmpty!4315))

(get-info :version)

(assert (= (and mapNonEmpty!4315 ((_ is ValueCellFull!1052) mapValue!4316)) b!116392))

(assert (= (and b!116391 ((_ is ValueCellFull!1052) mapDefault!4316)) b!116395))

(assert (= b!116397 b!116391))

(assert (= b!116400 b!116397))

(assert (= b!116388 b!116400))

(assert (= start!13226 b!116388))

(assert (= (and b!116389 condMapEmpty!4316) mapIsEmpty!4315))

(assert (= (and b!116389 (not condMapEmpty!4316)) mapNonEmpty!4316))

(assert (= (and mapNonEmpty!4316 ((_ is ValueCellFull!1052) mapValue!4315)) b!116401))

(assert (= (and b!116389 ((_ is ValueCellFull!1052) mapDefault!4315)) b!116398))

(assert (= b!116396 b!116389))

(assert (= start!13226 b!116396))

(declare-fun m!132253 () Bool)

(assert (=> b!116399 m!132253))

(declare-fun m!132255 () Bool)

(assert (=> b!116390 m!132255))

(declare-fun m!132257 () Bool)

(assert (=> b!116390 m!132257))

(declare-fun m!132259 () Bool)

(assert (=> start!13226 m!132259))

(declare-fun m!132261 () Bool)

(assert (=> b!116396 m!132261))

(declare-fun m!132263 () Bool)

(assert (=> b!116396 m!132263))

(declare-fun m!132265 () Bool)

(assert (=> mapNonEmpty!4316 m!132265))

(declare-fun m!132267 () Bool)

(assert (=> b!116397 m!132267))

(declare-fun m!132269 () Bool)

(assert (=> b!116397 m!132269))

(declare-fun m!132271 () Bool)

(assert (=> mapNonEmpty!4315 m!132271))

(check-sat (not start!13226) (not b_next!2749) (not b!116390) (not mapNonEmpty!4316) (not mapNonEmpty!4315) b_and!7243 (not b_next!2751) (not b!116396) tp_is_empty!2791 (not b!116399) (not b!116397) b_and!7241)
(check-sat b_and!7241 b_and!7243 (not b_next!2749) (not b_next!2751))
