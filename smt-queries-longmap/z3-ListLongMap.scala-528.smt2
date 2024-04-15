; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13200 () Bool)

(assert start!13200)

(declare-fun b!115951 () Bool)

(declare-fun b_free!2725 () Bool)

(declare-fun b_next!2725 () Bool)

(assert (=> b!115951 (= b_free!2725 (not b_next!2725))))

(declare-fun tp!10546 () Bool)

(declare-fun b_and!7209 () Bool)

(assert (=> b!115951 (= tp!10546 b_and!7209)))

(declare-fun b!115952 () Bool)

(declare-fun b_free!2727 () Bool)

(declare-fun b_next!2727 () Bool)

(assert (=> b!115952 (= b_free!2727 (not b_next!2727))))

(declare-fun tp!10544 () Bool)

(declare-fun b_and!7211 () Bool)

(assert (=> b!115952 (= tp!10544 b_and!7211)))

(declare-fun mapIsEmpty!4275 () Bool)

(declare-fun mapRes!4275 () Bool)

(assert (=> mapIsEmpty!4275 mapRes!4275))

(declare-fun b!115947 () Bool)

(declare-fun e!75674 () Bool)

(declare-fun tp_is_empty!2779 () Bool)

(assert (=> b!115947 (= e!75674 tp_is_empty!2779)))

(declare-fun b!115948 () Bool)

(declare-fun res!56841 () Bool)

(declare-fun e!75684 () Bool)

(assert (=> b!115948 (=> (not res!56841) (not e!75684))))

(declare-datatypes ((V!3353 0))(
  ( (V!3354 (val!1434 Int)) )
))
(declare-datatypes ((array!4543 0))(
  ( (array!4544 (arr!2152 (Array (_ BitVec 32) (_ BitVec 64))) (size!2414 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1046 0))(
  ( (ValueCellFull!1046 (v!3030 V!3353)) (EmptyCell!1046) )
))
(declare-datatypes ((array!4545 0))(
  ( (array!4546 (arr!2153 (Array (_ BitVec 32) ValueCell!1046)) (size!2415 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1000 0))(
  ( (LongMapFixedSize!1001 (defaultEntry!2711 Int) (mask!6924 (_ BitVec 32)) (extraKeys!2500 (_ BitVec 32)) (zeroValue!2578 V!3353) (minValue!2578 V!3353) (_size!549 (_ BitVec 32)) (_keys!4433 array!4543) (_values!2694 array!4545) (_vacant!549 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1000)

(declare-fun valid!476 (LongMapFixedSize!1000) Bool)

(assert (=> b!115948 (= res!56841 (valid!476 newMap!16))))

(declare-fun mapNonEmpty!4275 () Bool)

(declare-fun tp!10545 () Bool)

(declare-fun e!75682 () Bool)

(assert (=> mapNonEmpty!4275 (= mapRes!4275 (and tp!10545 e!75682))))

(declare-fun mapValue!4275 () ValueCell!1046)

(declare-fun mapKey!4276 () (_ BitVec 32))

(declare-fun mapRest!4275 () (Array (_ BitVec 32) ValueCell!1046))

(declare-datatypes ((Cell!788 0))(
  ( (Cell!789 (v!3031 LongMapFixedSize!1000)) )
))
(declare-datatypes ((LongMap!788 0))(
  ( (LongMap!789 (underlying!405 Cell!788)) )
))
(declare-fun thiss!992 () LongMap!788)

(assert (=> mapNonEmpty!4275 (= (arr!2153 (_values!2694 (v!3031 (underlying!405 thiss!992)))) (store mapRest!4275 mapKey!4276 mapValue!4275))))

(declare-fun b!115949 () Bool)

(declare-fun e!75681 () Bool)

(declare-fun e!75679 () Bool)

(assert (=> b!115949 (= e!75681 e!75679)))

(declare-fun b!115950 () Bool)

(declare-fun res!56842 () Bool)

(assert (=> b!115950 (=> (not res!56842) (not e!75684))))

(assert (=> b!115950 (= res!56842 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6924 newMap!16)) (_size!549 (v!3031 (underlying!405 thiss!992)))))))

(declare-fun e!75676 () Bool)

(declare-fun array_inv!1365 (array!4543) Bool)

(declare-fun array_inv!1366 (array!4545) Bool)

(assert (=> b!115951 (= e!75679 (and tp!10546 tp_is_empty!2779 (array_inv!1365 (_keys!4433 (v!3031 (underlying!405 thiss!992)))) (array_inv!1366 (_values!2694 (v!3031 (underlying!405 thiss!992)))) e!75676))))

(declare-fun e!75685 () Bool)

(declare-fun e!75678 () Bool)

(assert (=> b!115952 (= e!75678 (and tp!10544 tp_is_empty!2779 (array_inv!1365 (_keys!4433 newMap!16)) (array_inv!1366 (_values!2694 newMap!16)) e!75685))))

(declare-fun b!115953 () Bool)

(declare-fun e!75677 () Bool)

(assert (=> b!115953 (= e!75677 e!75681)))

(declare-fun b!115954 () Bool)

(declare-fun e!75683 () Bool)

(assert (=> b!115954 (= e!75683 tp_is_empty!2779)))

(declare-fun mapIsEmpty!4276 () Bool)

(declare-fun mapRes!4276 () Bool)

(assert (=> mapIsEmpty!4276 mapRes!4276))

(declare-fun mapNonEmpty!4276 () Bool)

(declare-fun tp!10543 () Bool)

(assert (=> mapNonEmpty!4276 (= mapRes!4276 (and tp!10543 e!75674))))

(declare-fun mapValue!4276 () ValueCell!1046)

(declare-fun mapKey!4275 () (_ BitVec 32))

(declare-fun mapRest!4276 () (Array (_ BitVec 32) ValueCell!1046))

(assert (=> mapNonEmpty!4276 (= (arr!2153 (_values!2694 newMap!16)) (store mapRest!4276 mapKey!4275 mapValue!4276))))

(declare-fun b!115955 () Bool)

(declare-fun res!56840 () Bool)

(assert (=> b!115955 (=> (not res!56840) (not e!75684))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!115955 (= res!56840 (and (or (= (select (arr!2152 (_keys!4433 (v!3031 (underlying!405 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2152 (_keys!4433 (v!3031 (underlying!405 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun b!115957 () Bool)

(declare-fun e!75680 () Bool)

(assert (=> b!115957 (= e!75676 (and e!75680 mapRes!4275))))

(declare-fun condMapEmpty!4275 () Bool)

(declare-fun mapDefault!4275 () ValueCell!1046)

(assert (=> b!115957 (= condMapEmpty!4275 (= (arr!2153 (_values!2694 (v!3031 (underlying!405 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1046)) mapDefault!4275)))))

(declare-fun b!115958 () Bool)

(assert (=> b!115958 (= e!75682 tp_is_empty!2779)))

(declare-fun b!115959 () Bool)

(declare-fun e!75673 () Bool)

(assert (=> b!115959 (= e!75684 e!75673)))

(declare-fun res!56843 () Bool)

(assert (=> b!115959 (=> (not res!56843) (not e!75673))))

(declare-datatypes ((tuple2!2490 0))(
  ( (tuple2!2491 (_1!1256 Bool) (_2!1256 LongMapFixedSize!1000)) )
))
(declare-fun lt!60195 () tuple2!2490)

(assert (=> b!115959 (= res!56843 (_1!1256 lt!60195))))

(declare-fun repackFrom!16 (LongMap!788 LongMapFixedSize!1000 (_ BitVec 32)) tuple2!2490)

(assert (=> b!115959 (= lt!60195 (repackFrom!16 thiss!992 newMap!16 (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun b!115960 () Bool)

(assert (=> b!115960 (= e!75680 tp_is_empty!2779)))

(declare-fun b!115961 () Bool)

(declare-fun res!56838 () Bool)

(assert (=> b!115961 (=> (not res!56838) (not e!75684))))

(assert (=> b!115961 (= res!56838 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2414 (_keys!4433 (v!3031 (underlying!405 thiss!992)))))))))

(declare-fun b!115962 () Bool)

(assert (=> b!115962 (= e!75685 (and e!75683 mapRes!4276))))

(declare-fun condMapEmpty!4276 () Bool)

(declare-fun mapDefault!4276 () ValueCell!1046)

(assert (=> b!115962 (= condMapEmpty!4276 (= (arr!2153 (_values!2694 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1046)) mapDefault!4276)))))

(declare-fun b!115963 () Bool)

(assert (=> b!115963 (= e!75673 false)))

(declare-fun lt!60194 () Bool)

(assert (=> b!115963 (= lt!60194 (valid!476 (_2!1256 lt!60195)))))

(declare-fun b!115956 () Bool)

(declare-fun res!56839 () Bool)

(assert (=> b!115956 (=> (not res!56839) (not e!75684))))

(declare-datatypes ((tuple2!2492 0))(
  ( (tuple2!2493 (_1!1257 (_ BitVec 64)) (_2!1257 V!3353)) )
))
(declare-datatypes ((List!1670 0))(
  ( (Nil!1667) (Cons!1666 (h!2266 tuple2!2492) (t!5927 List!1670)) )
))
(declare-datatypes ((ListLongMap!1615 0))(
  ( (ListLongMap!1616 (toList!823 List!1670)) )
))
(declare-fun getCurrentListMap!494 (array!4543 array!4545 (_ BitVec 32) (_ BitVec 32) V!3353 V!3353 (_ BitVec 32) Int) ListLongMap!1615)

(declare-fun map!1334 (LongMapFixedSize!1000) ListLongMap!1615)

(assert (=> b!115956 (= res!56839 (= (getCurrentListMap!494 (_keys!4433 (v!3031 (underlying!405 thiss!992))) (_values!2694 (v!3031 (underlying!405 thiss!992))) (mask!6924 (v!3031 (underlying!405 thiss!992))) (extraKeys!2500 (v!3031 (underlying!405 thiss!992))) (zeroValue!2578 (v!3031 (underlying!405 thiss!992))) (minValue!2578 (v!3031 (underlying!405 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2711 (v!3031 (underlying!405 thiss!992)))) (map!1334 newMap!16)))))

(declare-fun res!56837 () Bool)

(assert (=> start!13200 (=> (not res!56837) (not e!75684))))

(declare-fun valid!477 (LongMap!788) Bool)

(assert (=> start!13200 (= res!56837 (valid!477 thiss!992))))

(assert (=> start!13200 e!75684))

(assert (=> start!13200 e!75677))

(assert (=> start!13200 true))

(assert (=> start!13200 e!75678))

(assert (= (and start!13200 res!56837) b!115961))

(assert (= (and b!115961 res!56838) b!115948))

(assert (= (and b!115948 res!56841) b!115950))

(assert (= (and b!115950 res!56842) b!115956))

(assert (= (and b!115956 res!56839) b!115955))

(assert (= (and b!115955 res!56840) b!115959))

(assert (= (and b!115959 res!56843) b!115963))

(assert (= (and b!115957 condMapEmpty!4275) mapIsEmpty!4275))

(assert (= (and b!115957 (not condMapEmpty!4275)) mapNonEmpty!4275))

(get-info :version)

(assert (= (and mapNonEmpty!4275 ((_ is ValueCellFull!1046) mapValue!4275)) b!115958))

(assert (= (and b!115957 ((_ is ValueCellFull!1046) mapDefault!4275)) b!115960))

(assert (= b!115951 b!115957))

(assert (= b!115949 b!115951))

(assert (= b!115953 b!115949))

(assert (= start!13200 b!115953))

(assert (= (and b!115962 condMapEmpty!4276) mapIsEmpty!4276))

(assert (= (and b!115962 (not condMapEmpty!4276)) mapNonEmpty!4276))

(assert (= (and mapNonEmpty!4276 ((_ is ValueCellFull!1046) mapValue!4276)) b!115947))

(assert (= (and b!115962 ((_ is ValueCellFull!1046) mapDefault!4276)) b!115954))

(assert (= b!115952 b!115962))

(assert (= start!13200 b!115952))

(declare-fun m!131947 () Bool)

(assert (=> b!115959 m!131947))

(declare-fun m!131949 () Bool)

(assert (=> b!115948 m!131949))

(declare-fun m!131951 () Bool)

(assert (=> b!115951 m!131951))

(declare-fun m!131953 () Bool)

(assert (=> b!115951 m!131953))

(declare-fun m!131955 () Bool)

(assert (=> b!115955 m!131955))

(declare-fun m!131957 () Bool)

(assert (=> b!115952 m!131957))

(declare-fun m!131959 () Bool)

(assert (=> b!115952 m!131959))

(declare-fun m!131961 () Bool)

(assert (=> start!13200 m!131961))

(declare-fun m!131963 () Bool)

(assert (=> b!115963 m!131963))

(declare-fun m!131965 () Bool)

(assert (=> b!115956 m!131965))

(declare-fun m!131967 () Bool)

(assert (=> b!115956 m!131967))

(declare-fun m!131969 () Bool)

(assert (=> mapNonEmpty!4276 m!131969))

(declare-fun m!131971 () Bool)

(assert (=> mapNonEmpty!4275 m!131971))

(check-sat (not mapNonEmpty!4275) (not mapNonEmpty!4276) (not b!115956) (not b!115952) b_and!7211 (not b_next!2725) tp_is_empty!2779 (not start!13200) (not b!115948) (not b!115951) (not b!115959) b_and!7209 (not b_next!2727) (not b!115963))
(check-sat b_and!7209 b_and!7211 (not b_next!2725) (not b_next!2727))
