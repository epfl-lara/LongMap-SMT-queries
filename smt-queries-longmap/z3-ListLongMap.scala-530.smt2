; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13226 () Bool)

(assert start!13226)

(declare-fun b!116427 () Bool)

(declare-fun b_free!2749 () Bool)

(declare-fun b_next!2749 () Bool)

(assert (=> b!116427 (= b_free!2749 (not b_next!2749))))

(declare-fun tp!10621 () Bool)

(declare-fun b_and!7249 () Bool)

(assert (=> b!116427 (= tp!10621 b_and!7249)))

(declare-fun b!116432 () Bool)

(declare-fun b_free!2751 () Bool)

(declare-fun b_next!2751 () Bool)

(assert (=> b!116432 (= b_free!2751 (not b_next!2751))))

(declare-fun tp!10619 () Bool)

(declare-fun b_and!7251 () Bool)

(assert (=> b!116432 (= tp!10619 b_and!7251)))

(declare-fun b!116424 () Bool)

(declare-fun e!76034 () Bool)

(assert (=> b!116424 (= e!76034 false)))

(declare-datatypes ((V!3369 0))(
  ( (V!3370 (val!1440 Int)) )
))
(declare-datatypes ((tuple2!2490 0))(
  ( (tuple2!2491 (_1!1256 (_ BitVec 64)) (_2!1256 V!3369)) )
))
(declare-datatypes ((List!1658 0))(
  ( (Nil!1655) (Cons!1654 (h!2254 tuple2!2490) (t!5920 List!1658)) )
))
(declare-datatypes ((ListLongMap!1607 0))(
  ( (ListLongMap!1608 (toList!819 List!1658)) )
))
(declare-fun lt!60426 () ListLongMap!1607)

(declare-datatypes ((array!4575 0))(
  ( (array!4576 (arr!2168 (Array (_ BitVec 32) (_ BitVec 64))) (size!2429 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1052 0))(
  ( (ValueCellFull!1052 (v!3051 V!3369)) (EmptyCell!1052) )
))
(declare-datatypes ((array!4577 0))(
  ( (array!4578 (arr!2169 (Array (_ BitVec 32) ValueCell!1052)) (size!2430 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1012 0))(
  ( (LongMapFixedSize!1013 (defaultEntry!2718 Int) (mask!6936 (_ BitVec 32)) (extraKeys!2507 (_ BitVec 32)) (zeroValue!2585 V!3369) (minValue!2585 V!3369) (_size!555 (_ BitVec 32)) (_keys!4441 array!4575) (_values!2701 array!4577) (_vacant!555 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1012)

(declare-fun map!1352 (LongMapFixedSize!1012) ListLongMap!1607)

(assert (=> b!116424 (= lt!60426 (map!1352 newMap!16))))

(declare-fun lt!60425 () ListLongMap!1607)

(declare-datatypes ((Cell!812 0))(
  ( (Cell!813 (v!3052 LongMapFixedSize!1012)) )
))
(declare-datatypes ((LongMap!812 0))(
  ( (LongMap!813 (underlying!417 Cell!812)) )
))
(declare-fun thiss!992 () LongMap!812)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!500 (array!4575 array!4577 (_ BitVec 32) (_ BitVec 32) V!3369 V!3369 (_ BitVec 32) Int) ListLongMap!1607)

(assert (=> b!116424 (= lt!60425 (getCurrentListMap!500 (_keys!4441 (v!3052 (underlying!417 thiss!992))) (_values!2701 (v!3052 (underlying!417 thiss!992))) (mask!6936 (v!3052 (underlying!417 thiss!992))) (extraKeys!2507 (v!3052 (underlying!417 thiss!992))) (zeroValue!2585 (v!3052 (underlying!417 thiss!992))) (minValue!2585 (v!3052 (underlying!417 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2718 (v!3052 (underlying!417 thiss!992)))))))

(declare-fun b!116425 () Bool)

(declare-fun res!57043 () Bool)

(assert (=> b!116425 (=> (not res!57043) (not e!76034))))

(assert (=> b!116425 (= res!57043 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6936 newMap!16)) (_size!555 (v!3052 (underlying!417 thiss!992)))))))

(declare-fun mapIsEmpty!4315 () Bool)

(declare-fun mapRes!4315 () Bool)

(assert (=> mapIsEmpty!4315 mapRes!4315))

(declare-fun b!116426 () Bool)

(declare-fun e!76036 () Bool)

(declare-fun tp_is_empty!2791 () Bool)

(assert (=> b!116426 (= e!76036 tp_is_empty!2791)))

(declare-fun e!76037 () Bool)

(declare-fun e!76032 () Bool)

(declare-fun array_inv!1357 (array!4575) Bool)

(declare-fun array_inv!1358 (array!4577) Bool)

(assert (=> b!116427 (= e!76032 (and tp!10621 tp_is_empty!2791 (array_inv!1357 (_keys!4441 (v!3052 (underlying!417 thiss!992)))) (array_inv!1358 (_values!2701 (v!3052 (underlying!417 thiss!992)))) e!76037))))

(declare-fun res!57041 () Bool)

(assert (=> start!13226 (=> (not res!57041) (not e!76034))))

(declare-fun valid!491 (LongMap!812) Bool)

(assert (=> start!13226 (= res!57041 (valid!491 thiss!992))))

(assert (=> start!13226 e!76034))

(declare-fun e!76029 () Bool)

(assert (=> start!13226 e!76029))

(assert (=> start!13226 true))

(declare-fun e!76026 () Bool)

(assert (=> start!13226 e!76026))

(declare-fun b!116428 () Bool)

(declare-fun e!76027 () Bool)

(assert (=> b!116428 (= e!76027 tp_is_empty!2791)))

(declare-fun mapNonEmpty!4315 () Bool)

(declare-fun tp!10622 () Bool)

(declare-fun e!76035 () Bool)

(assert (=> mapNonEmpty!4315 (= mapRes!4315 (and tp!10622 e!76035))))

(declare-fun mapKey!4316 () (_ BitVec 32))

(declare-fun mapValue!4315 () ValueCell!1052)

(declare-fun mapRest!4315 () (Array (_ BitVec 32) ValueCell!1052))

(assert (=> mapNonEmpty!4315 (= (arr!2169 (_values!2701 newMap!16)) (store mapRest!4315 mapKey!4316 mapValue!4315))))

(declare-fun b!116429 () Bool)

(declare-fun e!76028 () Bool)

(assert (=> b!116429 (= e!76029 e!76028)))

(declare-fun b!116430 () Bool)

(assert (=> b!116430 (= e!76035 tp_is_empty!2791)))

(declare-fun b!116431 () Bool)

(declare-fun mapRes!4316 () Bool)

(assert (=> b!116431 (= e!76037 (and e!76027 mapRes!4316))))

(declare-fun condMapEmpty!4316 () Bool)

(declare-fun mapDefault!4315 () ValueCell!1052)

(assert (=> b!116431 (= condMapEmpty!4316 (= (arr!2169 (_values!2701 (v!3052 (underlying!417 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1052)) mapDefault!4315)))))

(declare-fun mapNonEmpty!4316 () Bool)

(declare-fun tp!10620 () Bool)

(assert (=> mapNonEmpty!4316 (= mapRes!4316 (and tp!10620 e!76036))))

(declare-fun mapValue!4316 () ValueCell!1052)

(declare-fun mapRest!4316 () (Array (_ BitVec 32) ValueCell!1052))

(declare-fun mapKey!4315 () (_ BitVec 32))

(assert (=> mapNonEmpty!4316 (= (arr!2169 (_values!2701 (v!3052 (underlying!417 thiss!992)))) (store mapRest!4316 mapKey!4315 mapValue!4316))))

(declare-fun e!76025 () Bool)

(assert (=> b!116432 (= e!76026 (and tp!10619 tp_is_empty!2791 (array_inv!1357 (_keys!4441 newMap!16)) (array_inv!1358 (_values!2701 newMap!16)) e!76025))))

(declare-fun b!116433 () Bool)

(declare-fun e!76031 () Bool)

(assert (=> b!116433 (= e!76025 (and e!76031 mapRes!4315))))

(declare-fun condMapEmpty!4315 () Bool)

(declare-fun mapDefault!4316 () ValueCell!1052)

(assert (=> b!116433 (= condMapEmpty!4315 (= (arr!2169 (_values!2701 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1052)) mapDefault!4316)))))

(declare-fun b!116434 () Bool)

(declare-fun res!57040 () Bool)

(assert (=> b!116434 (=> (not res!57040) (not e!76034))))

(assert (=> b!116434 (= res!57040 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2429 (_keys!4441 (v!3052 (underlying!417 thiss!992)))))))))

(declare-fun b!116435 () Bool)

(declare-fun res!57042 () Bool)

(assert (=> b!116435 (=> (not res!57042) (not e!76034))))

(declare-fun valid!492 (LongMapFixedSize!1012) Bool)

(assert (=> b!116435 (= res!57042 (valid!492 newMap!16))))

(declare-fun b!116436 () Bool)

(assert (=> b!116436 (= e!76031 tp_is_empty!2791)))

(declare-fun b!116437 () Bool)

(assert (=> b!116437 (= e!76028 e!76032)))

(declare-fun mapIsEmpty!4316 () Bool)

(assert (=> mapIsEmpty!4316 mapRes!4316))

(assert (= (and start!13226 res!57041) b!116434))

(assert (= (and b!116434 res!57040) b!116435))

(assert (= (and b!116435 res!57042) b!116425))

(assert (= (and b!116425 res!57043) b!116424))

(assert (= (and b!116431 condMapEmpty!4316) mapIsEmpty!4316))

(assert (= (and b!116431 (not condMapEmpty!4316)) mapNonEmpty!4316))

(get-info :version)

(assert (= (and mapNonEmpty!4316 ((_ is ValueCellFull!1052) mapValue!4316)) b!116426))

(assert (= (and b!116431 ((_ is ValueCellFull!1052) mapDefault!4315)) b!116428))

(assert (= b!116427 b!116431))

(assert (= b!116437 b!116427))

(assert (= b!116429 b!116437))

(assert (= start!13226 b!116429))

(assert (= (and b!116433 condMapEmpty!4315) mapIsEmpty!4315))

(assert (= (and b!116433 (not condMapEmpty!4315)) mapNonEmpty!4315))

(assert (= (and mapNonEmpty!4315 ((_ is ValueCellFull!1052) mapValue!4315)) b!116430))

(assert (= (and b!116433 ((_ is ValueCellFull!1052) mapDefault!4316)) b!116436))

(assert (= b!116432 b!116433))

(assert (= start!13226 b!116432))

(declare-fun m!132415 () Bool)

(assert (=> b!116432 m!132415))

(declare-fun m!132417 () Bool)

(assert (=> b!116432 m!132417))

(declare-fun m!132419 () Bool)

(assert (=> start!13226 m!132419))

(declare-fun m!132421 () Bool)

(assert (=> b!116427 m!132421))

(declare-fun m!132423 () Bool)

(assert (=> b!116427 m!132423))

(declare-fun m!132425 () Bool)

(assert (=> b!116424 m!132425))

(declare-fun m!132427 () Bool)

(assert (=> b!116424 m!132427))

(declare-fun m!132429 () Bool)

(assert (=> mapNonEmpty!4316 m!132429))

(declare-fun m!132431 () Bool)

(assert (=> mapNonEmpty!4315 m!132431))

(declare-fun m!132433 () Bool)

(assert (=> b!116435 m!132433))

(check-sat tp_is_empty!2791 (not b!116427) (not b!116432) (not b_next!2751) (not b_next!2749) b_and!7249 (not b!116424) (not b!116435) (not mapNonEmpty!4315) b_and!7251 (not start!13226) (not mapNonEmpty!4316))
(check-sat b_and!7249 b_and!7251 (not b_next!2749) (not b_next!2751))
