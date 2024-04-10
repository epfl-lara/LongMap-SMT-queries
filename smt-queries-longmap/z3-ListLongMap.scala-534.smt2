; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13434 () Bool)

(assert start!13434)

(declare-fun b!123084 () Bool)

(declare-fun b_free!2801 () Bool)

(declare-fun b_next!2801 () Bool)

(assert (=> b!123084 (= b_free!2801 (not b_next!2801))))

(declare-fun tp!10790 () Bool)

(declare-fun b_and!7555 () Bool)

(assert (=> b!123084 (= tp!10790 b_and!7555)))

(declare-fun b!123083 () Bool)

(declare-fun b_free!2803 () Bool)

(declare-fun b_next!2803 () Bool)

(assert (=> b!123083 (= b_free!2803 (not b_next!2803))))

(declare-fun tp!10792 () Bool)

(declare-fun b_and!7557 () Bool)

(assert (=> b!123083 (= tp!10792 b_and!7557)))

(declare-fun b!123075 () Bool)

(declare-fun e!80424 () Bool)

(declare-fun tp_is_empty!2817 () Bool)

(assert (=> b!123075 (= e!80424 tp_is_empty!2817)))

(declare-fun b!123076 () Bool)

(declare-fun e!80417 () Bool)

(declare-fun e!80416 () Bool)

(declare-fun mapRes!4407 () Bool)

(assert (=> b!123076 (= e!80417 (and e!80416 mapRes!4407))))

(declare-fun condMapEmpty!4408 () Bool)

(declare-datatypes ((V!3403 0))(
  ( (V!3404 (val!1453 Int)) )
))
(declare-datatypes ((array!4645 0))(
  ( (array!4646 (arr!2201 (Array (_ BitVec 32) (_ BitVec 64))) (size!2463 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1065 0))(
  ( (ValueCellFull!1065 (v!3085 V!3403)) (EmptyCell!1065) )
))
(declare-datatypes ((array!4647 0))(
  ( (array!4648 (arr!2202 (Array (_ BitVec 32) ValueCell!1065)) (size!2464 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1038 0))(
  ( (LongMapFixedSize!1039 (defaultEntry!2752 Int) (mask!6988 (_ BitVec 32)) (extraKeys!2537 (_ BitVec 32)) (zeroValue!2617 V!3403) (minValue!2617 V!3403) (_size!568 (_ BitVec 32)) (_keys!4479 array!4645) (_values!2735 array!4647) (_vacant!568 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1038)

(declare-fun mapDefault!4408 () ValueCell!1065)

(assert (=> b!123076 (= condMapEmpty!4408 (= (arr!2202 (_values!2735 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1065)) mapDefault!4408)))))

(declare-fun b!123077 () Bool)

(declare-fun res!59804 () Bool)

(declare-fun e!80423 () Bool)

(assert (=> b!123077 (=> (not res!59804) (not e!80423))))

(declare-datatypes ((Cell!834 0))(
  ( (Cell!835 (v!3086 LongMapFixedSize!1038)) )
))
(declare-datatypes ((LongMap!834 0))(
  ( (LongMap!835 (underlying!428 Cell!834)) )
))
(declare-fun thiss!992 () LongMap!834)

(assert (=> b!123077 (= res!59804 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6988 newMap!16)) (_size!568 (v!3086 (underlying!428 thiss!992)))))))

(declare-fun b!123078 () Bool)

(declare-fun e!80418 () Bool)

(declare-fun e!80428 () Bool)

(assert (=> b!123078 (= e!80418 e!80428)))

(declare-fun b!123079 () Bool)

(declare-fun e!80419 () Bool)

(assert (=> b!123079 (= e!80419 tp_is_empty!2817)))

(declare-fun b!123080 () Bool)

(assert (=> b!123080 (= e!80423 false)))

(declare-datatypes ((tuple2!2560 0))(
  ( (tuple2!2561 (_1!1291 (_ BitVec 64)) (_2!1291 V!3403)) )
))
(declare-datatypes ((List!1690 0))(
  ( (Nil!1687) (Cons!1686 (h!2287 tuple2!2560) (t!5989 List!1690)) )
))
(declare-datatypes ((ListLongMap!1671 0))(
  ( (ListLongMap!1672 (toList!851 List!1690)) )
))
(declare-fun lt!63369 () ListLongMap!1671)

(declare-fun map!1375 (LongMapFixedSize!1038) ListLongMap!1671)

(assert (=> b!123080 (= lt!63369 (map!1375 newMap!16))))

(declare-fun lt!63370 () ListLongMap!1671)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!532 (array!4645 array!4647 (_ BitVec 32) (_ BitVec 32) V!3403 V!3403 (_ BitVec 32) Int) ListLongMap!1671)

(assert (=> b!123080 (= lt!63370 (getCurrentListMap!532 (_keys!4479 (v!3086 (underlying!428 thiss!992))) (_values!2735 (v!3086 (underlying!428 thiss!992))) (mask!6988 (v!3086 (underlying!428 thiss!992))) (extraKeys!2537 (v!3086 (underlying!428 thiss!992))) (zeroValue!2617 (v!3086 (underlying!428 thiss!992))) (minValue!2617 (v!3086 (underlying!428 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2752 (v!3086 (underlying!428 thiss!992)))))))

(declare-fun mapNonEmpty!4407 () Bool)

(declare-fun mapRes!4408 () Bool)

(declare-fun tp!10791 () Bool)

(declare-fun e!80426 () Bool)

(assert (=> mapNonEmpty!4407 (= mapRes!4408 (and tp!10791 e!80426))))

(declare-fun mapKey!4407 () (_ BitVec 32))

(declare-fun mapValue!4407 () ValueCell!1065)

(declare-fun mapRest!4407 () (Array (_ BitVec 32) ValueCell!1065))

(assert (=> mapNonEmpty!4407 (= (arr!2202 (_values!2735 (v!3086 (underlying!428 thiss!992)))) (store mapRest!4407 mapKey!4407 mapValue!4407))))

(declare-fun mapIsEmpty!4407 () Bool)

(assert (=> mapIsEmpty!4407 mapRes!4408))

(declare-fun b!123081 () Bool)

(declare-fun res!59803 () Bool)

(assert (=> b!123081 (=> (not res!59803) (not e!80423))))

(assert (=> b!123081 (= res!59803 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2463 (_keys!4479 (v!3086 (underlying!428 thiss!992)))))))))

(declare-fun res!59805 () Bool)

(assert (=> start!13434 (=> (not res!59805) (not e!80423))))

(declare-fun valid!493 (LongMap!834) Bool)

(assert (=> start!13434 (= res!59805 (valid!493 thiss!992))))

(assert (=> start!13434 e!80423))

(assert (=> start!13434 e!80418))

(assert (=> start!13434 true))

(declare-fun e!80427 () Bool)

(assert (=> start!13434 e!80427))

(declare-fun mapIsEmpty!4408 () Bool)

(assert (=> mapIsEmpty!4408 mapRes!4407))

(declare-fun b!123082 () Bool)

(assert (=> b!123082 (= e!80416 tp_is_empty!2817)))

(declare-fun array_inv!1385 (array!4645) Bool)

(declare-fun array_inv!1386 (array!4647) Bool)

(assert (=> b!123083 (= e!80427 (and tp!10792 tp_is_empty!2817 (array_inv!1385 (_keys!4479 newMap!16)) (array_inv!1386 (_values!2735 newMap!16)) e!80417))))

(declare-fun e!80422 () Bool)

(declare-fun e!80425 () Bool)

(assert (=> b!123084 (= e!80425 (and tp!10790 tp_is_empty!2817 (array_inv!1385 (_keys!4479 (v!3086 (underlying!428 thiss!992)))) (array_inv!1386 (_values!2735 (v!3086 (underlying!428 thiss!992)))) e!80422))))

(declare-fun b!123085 () Bool)

(assert (=> b!123085 (= e!80428 e!80425)))

(declare-fun mapNonEmpty!4408 () Bool)

(declare-fun tp!10789 () Bool)

(assert (=> mapNonEmpty!4408 (= mapRes!4407 (and tp!10789 e!80419))))

(declare-fun mapKey!4408 () (_ BitVec 32))

(declare-fun mapValue!4408 () ValueCell!1065)

(declare-fun mapRest!4408 () (Array (_ BitVec 32) ValueCell!1065))

(assert (=> mapNonEmpty!4408 (= (arr!2202 (_values!2735 newMap!16)) (store mapRest!4408 mapKey!4408 mapValue!4408))))

(declare-fun b!123086 () Bool)

(assert (=> b!123086 (= e!80422 (and e!80424 mapRes!4408))))

(declare-fun condMapEmpty!4407 () Bool)

(declare-fun mapDefault!4407 () ValueCell!1065)

(assert (=> b!123086 (= condMapEmpty!4407 (= (arr!2202 (_values!2735 (v!3086 (underlying!428 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1065)) mapDefault!4407)))))

(declare-fun b!123087 () Bool)

(assert (=> b!123087 (= e!80426 tp_is_empty!2817)))

(declare-fun b!123088 () Bool)

(declare-fun res!59802 () Bool)

(assert (=> b!123088 (=> (not res!59802) (not e!80423))))

(declare-fun valid!494 (LongMapFixedSize!1038) Bool)

(assert (=> b!123088 (= res!59802 (valid!494 newMap!16))))

(assert (= (and start!13434 res!59805) b!123081))

(assert (= (and b!123081 res!59803) b!123088))

(assert (= (and b!123088 res!59802) b!123077))

(assert (= (and b!123077 res!59804) b!123080))

(assert (= (and b!123086 condMapEmpty!4407) mapIsEmpty!4407))

(assert (= (and b!123086 (not condMapEmpty!4407)) mapNonEmpty!4407))

(get-info :version)

(assert (= (and mapNonEmpty!4407 ((_ is ValueCellFull!1065) mapValue!4407)) b!123087))

(assert (= (and b!123086 ((_ is ValueCellFull!1065) mapDefault!4407)) b!123075))

(assert (= b!123084 b!123086))

(assert (= b!123085 b!123084))

(assert (= b!123078 b!123085))

(assert (= start!13434 b!123078))

(assert (= (and b!123076 condMapEmpty!4408) mapIsEmpty!4408))

(assert (= (and b!123076 (not condMapEmpty!4408)) mapNonEmpty!4408))

(assert (= (and mapNonEmpty!4408 ((_ is ValueCellFull!1065) mapValue!4408)) b!123079))

(assert (= (and b!123076 ((_ is ValueCellFull!1065) mapDefault!4408)) b!123082))

(assert (= b!123083 b!123076))

(assert (= start!13434 b!123083))

(declare-fun m!143079 () Bool)

(assert (=> mapNonEmpty!4408 m!143079))

(declare-fun m!143081 () Bool)

(assert (=> b!123080 m!143081))

(declare-fun m!143083 () Bool)

(assert (=> b!123080 m!143083))

(declare-fun m!143085 () Bool)

(assert (=> b!123083 m!143085))

(declare-fun m!143087 () Bool)

(assert (=> b!123083 m!143087))

(declare-fun m!143089 () Bool)

(assert (=> b!123088 m!143089))

(declare-fun m!143091 () Bool)

(assert (=> mapNonEmpty!4407 m!143091))

(declare-fun m!143093 () Bool)

(assert (=> b!123084 m!143093))

(declare-fun m!143095 () Bool)

(assert (=> b!123084 m!143095))

(declare-fun m!143097 () Bool)

(assert (=> start!13434 m!143097))

(check-sat (not b_next!2801) (not b!123088) tp_is_empty!2817 (not b_next!2803) (not b!123084) (not start!13434) b_and!7555 b_and!7557 (not b!123083) (not mapNonEmpty!4408) (not mapNonEmpty!4407) (not b!123080))
(check-sat b_and!7555 b_and!7557 (not b_next!2801) (not b_next!2803))
