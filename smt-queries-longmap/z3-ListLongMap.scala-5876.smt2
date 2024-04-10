; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75788 () Bool)

(assert start!75788)

(declare-fun b!891406 () Bool)

(declare-fun b_free!15759 () Bool)

(declare-fun b_next!15759 () Bool)

(assert (=> b!891406 (= b_free!15759 (not b_next!15759))))

(declare-fun tp!55246 () Bool)

(declare-fun b_and!25999 () Bool)

(assert (=> b!891406 (= tp!55246 b_and!25999)))

(declare-fun b!891403 () Bool)

(declare-fun res!603945 () Bool)

(declare-fun e!497410 () Bool)

(assert (=> b!891403 (=> res!603945 e!497410)))

(declare-datatypes ((array!52154 0))(
  ( (array!52155 (arr!25083 (Array (_ BitVec 32) (_ BitVec 64))) (size!25527 (_ BitVec 32))) )
))
(declare-datatypes ((V!29081 0))(
  ( (V!29082 (val!9094 Int)) )
))
(declare-datatypes ((ValueCell!8562 0))(
  ( (ValueCellFull!8562 (v!11572 V!29081)) (EmptyCell!8562) )
))
(declare-datatypes ((array!52156 0))(
  ( (array!52157 (arr!25084 (Array (_ BitVec 32) ValueCell!8562)) (size!25528 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4140 0))(
  ( (LongMapFixedSize!4141 (defaultEntry!5267 Int) (mask!25760 (_ BitVec 32)) (extraKeys!4961 (_ BitVec 32)) (zeroValue!5065 V!29081) (minValue!5065 V!29081) (_size!2125 (_ BitVec 32)) (_keys!9950 array!52154) (_values!5252 array!52156) (_vacant!2125 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4140)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52154 (_ BitVec 32)) Bool)

(assert (=> b!891403 (= res!603945 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9950 thiss!1181) (mask!25760 thiss!1181))))))

(declare-fun b!891404 () Bool)

(declare-fun e!497411 () Bool)

(declare-fun e!497409 () Bool)

(assert (=> b!891404 (= e!497411 (not e!497409))))

(declare-fun res!603946 () Bool)

(assert (=> b!891404 (=> res!603946 e!497409)))

(declare-datatypes ((SeekEntryResult!8823 0))(
  ( (MissingZero!8823 (index!37663 (_ BitVec 32))) (Found!8823 (index!37664 (_ BitVec 32))) (Intermediate!8823 (undefined!9635 Bool) (index!37665 (_ BitVec 32)) (x!75743 (_ BitVec 32))) (Undefined!8823) (MissingVacant!8823 (index!37666 (_ BitVec 32))) )
))
(declare-fun lt!402674 () SeekEntryResult!8823)

(get-info :version)

(assert (=> b!891404 (= res!603946 (not ((_ is Found!8823) lt!402674)))))

(declare-fun e!497404 () Bool)

(assert (=> b!891404 e!497404))

(declare-fun res!603944 () Bool)

(assert (=> b!891404 (=> res!603944 e!497404)))

(assert (=> b!891404 (= res!603944 (not ((_ is Found!8823) lt!402674)))))

(declare-datatypes ((Unit!30342 0))(
  ( (Unit!30343) )
))
(declare-fun lt!402671 () Unit!30342)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!27 (array!52154 array!52156 (_ BitVec 32) (_ BitVec 32) V!29081 V!29081 (_ BitVec 64)) Unit!30342)

(assert (=> b!891404 (= lt!402671 (lemmaSeekEntryGivesInRangeIndex!27 (_keys!9950 thiss!1181) (_values!5252 thiss!1181) (mask!25760 thiss!1181) (extraKeys!4961 thiss!1181) (zeroValue!5065 thiss!1181) (minValue!5065 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52154 (_ BitVec 32)) SeekEntryResult!8823)

(assert (=> b!891404 (= lt!402674 (seekEntry!0 key!785 (_keys!9950 thiss!1181) (mask!25760 thiss!1181)))))

(declare-fun b!891405 () Bool)

(assert (=> b!891405 (= e!497410 true)))

(declare-fun lt!402676 () Bool)

(declare-datatypes ((tuple2!11948 0))(
  ( (tuple2!11949 (_1!5985 (_ BitVec 64)) (_2!5985 V!29081)) )
))
(declare-datatypes ((List!17742 0))(
  ( (Nil!17739) (Cons!17738 (h!18869 tuple2!11948) (t!25041 List!17742)) )
))
(declare-datatypes ((ListLongMap!10645 0))(
  ( (ListLongMap!10646 (toList!5338 List!17742)) )
))
(declare-fun lt!402673 () ListLongMap!10645)

(declare-fun contains!4340 (ListLongMap!10645 (_ BitVec 64)) Bool)

(assert (=> b!891405 (= lt!402676 (contains!4340 lt!402673 key!785))))

(declare-fun mapNonEmpty!28685 () Bool)

(declare-fun mapRes!28685 () Bool)

(declare-fun tp!55245 () Bool)

(declare-fun e!497408 () Bool)

(assert (=> mapNonEmpty!28685 (= mapRes!28685 (and tp!55245 e!497408))))

(declare-fun mapKey!28685 () (_ BitVec 32))

(declare-fun mapValue!28685 () ValueCell!8562)

(declare-fun mapRest!28685 () (Array (_ BitVec 32) ValueCell!8562))

(assert (=> mapNonEmpty!28685 (= (arr!25084 (_values!5252 thiss!1181)) (store mapRest!28685 mapKey!28685 mapValue!28685))))

(declare-fun e!497407 () Bool)

(declare-fun tp_is_empty!18087 () Bool)

(declare-fun e!497405 () Bool)

(declare-fun array_inv!19710 (array!52154) Bool)

(declare-fun array_inv!19711 (array!52156) Bool)

(assert (=> b!891406 (= e!497405 (and tp!55246 tp_is_empty!18087 (array_inv!19710 (_keys!9950 thiss!1181)) (array_inv!19711 (_values!5252 thiss!1181)) e!497407))))

(declare-fun b!891407 () Bool)

(declare-fun e!497406 () Bool)

(assert (=> b!891407 (= e!497406 tp_is_empty!18087)))

(declare-fun b!891408 () Bool)

(assert (=> b!891408 (= e!497409 e!497410)))

(declare-fun res!603941 () Bool)

(assert (=> b!891408 (=> res!603941 e!497410)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891408 (= res!603941 (not (validMask!0 (mask!25760 thiss!1181))))))

(assert (=> b!891408 (contains!4340 lt!402673 (select (arr!25083 (_keys!9950 thiss!1181)) (index!37664 lt!402674)))))

(declare-fun getCurrentListMap!2621 (array!52154 array!52156 (_ BitVec 32) (_ BitVec 32) V!29081 V!29081 (_ BitVec 32) Int) ListLongMap!10645)

(assert (=> b!891408 (= lt!402673 (getCurrentListMap!2621 (_keys!9950 thiss!1181) (_values!5252 thiss!1181) (mask!25760 thiss!1181) (extraKeys!4961 thiss!1181) (zeroValue!5065 thiss!1181) (minValue!5065 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5267 thiss!1181)))))

(declare-fun lt!402672 () Unit!30342)

(declare-fun lemmaValidKeyInArrayIsInListMap!210 (array!52154 array!52156 (_ BitVec 32) (_ BitVec 32) V!29081 V!29081 (_ BitVec 32) Int) Unit!30342)

(assert (=> b!891408 (= lt!402672 (lemmaValidKeyInArrayIsInListMap!210 (_keys!9950 thiss!1181) (_values!5252 thiss!1181) (mask!25760 thiss!1181) (extraKeys!4961 thiss!1181) (zeroValue!5065 thiss!1181) (minValue!5065 thiss!1181) (index!37664 lt!402674) (defaultEntry!5267 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52154 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891408 (arrayContainsKey!0 (_keys!9950 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402675 () Unit!30342)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52154 (_ BitVec 64) (_ BitVec 32)) Unit!30342)

(assert (=> b!891408 (= lt!402675 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9950 thiss!1181) key!785 (index!37664 lt!402674)))))

(declare-fun res!603942 () Bool)

(assert (=> start!75788 (=> (not res!603942) (not e!497411))))

(declare-fun valid!1604 (LongMapFixedSize!4140) Bool)

(assert (=> start!75788 (= res!603942 (valid!1604 thiss!1181))))

(assert (=> start!75788 e!497411))

(assert (=> start!75788 e!497405))

(assert (=> start!75788 true))

(declare-fun b!891409 () Bool)

(assert (=> b!891409 (= e!497407 (and e!497406 mapRes!28685))))

(declare-fun condMapEmpty!28685 () Bool)

(declare-fun mapDefault!28685 () ValueCell!8562)

(assert (=> b!891409 (= condMapEmpty!28685 (= (arr!25084 (_values!5252 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8562)) mapDefault!28685)))))

(declare-fun b!891410 () Bool)

(declare-fun res!603943 () Bool)

(assert (=> b!891410 (=> res!603943 e!497410)))

(assert (=> b!891410 (= res!603943 (or (not (= (size!25528 (_values!5252 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25760 thiss!1181)))) (not (= (size!25527 (_keys!9950 thiss!1181)) (size!25528 (_values!5252 thiss!1181)))) (bvslt (mask!25760 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4961 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4961 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!891411 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891411 (= e!497404 (inRange!0 (index!37664 lt!402674) (mask!25760 thiss!1181)))))

(declare-fun b!891412 () Bool)

(declare-fun res!603947 () Bool)

(assert (=> b!891412 (=> (not res!603947) (not e!497411))))

(assert (=> b!891412 (= res!603947 (not (= key!785 (bvneg key!785))))))

(declare-fun mapIsEmpty!28685 () Bool)

(assert (=> mapIsEmpty!28685 mapRes!28685))

(declare-fun b!891413 () Bool)

(declare-fun res!603940 () Bool)

(assert (=> b!891413 (=> res!603940 e!497410)))

(declare-datatypes ((List!17743 0))(
  ( (Nil!17740) (Cons!17739 (h!18870 (_ BitVec 64)) (t!25042 List!17743)) )
))
(declare-fun arrayNoDuplicates!0 (array!52154 (_ BitVec 32) List!17743) Bool)

(assert (=> b!891413 (= res!603940 (not (arrayNoDuplicates!0 (_keys!9950 thiss!1181) #b00000000000000000000000000000000 Nil!17740)))))

(declare-fun b!891414 () Bool)

(assert (=> b!891414 (= e!497408 tp_is_empty!18087)))

(assert (= (and start!75788 res!603942) b!891412))

(assert (= (and b!891412 res!603947) b!891404))

(assert (= (and b!891404 (not res!603944)) b!891411))

(assert (= (and b!891404 (not res!603946)) b!891408))

(assert (= (and b!891408 (not res!603941)) b!891410))

(assert (= (and b!891410 (not res!603943)) b!891403))

(assert (= (and b!891403 (not res!603945)) b!891413))

(assert (= (and b!891413 (not res!603940)) b!891405))

(assert (= (and b!891409 condMapEmpty!28685) mapIsEmpty!28685))

(assert (= (and b!891409 (not condMapEmpty!28685)) mapNonEmpty!28685))

(assert (= (and mapNonEmpty!28685 ((_ is ValueCellFull!8562) mapValue!28685)) b!891414))

(assert (= (and b!891409 ((_ is ValueCellFull!8562) mapDefault!28685)) b!891407))

(assert (= b!891406 b!891409))

(assert (= start!75788 b!891406))

(declare-fun m!829717 () Bool)

(assert (=> b!891411 m!829717))

(declare-fun m!829719 () Bool)

(assert (=> start!75788 m!829719))

(declare-fun m!829721 () Bool)

(assert (=> mapNonEmpty!28685 m!829721))

(declare-fun m!829723 () Bool)

(assert (=> b!891405 m!829723))

(declare-fun m!829725 () Bool)

(assert (=> b!891413 m!829725))

(declare-fun m!829727 () Bool)

(assert (=> b!891403 m!829727))

(declare-fun m!829729 () Bool)

(assert (=> b!891408 m!829729))

(declare-fun m!829731 () Bool)

(assert (=> b!891408 m!829731))

(assert (=> b!891408 m!829729))

(declare-fun m!829733 () Bool)

(assert (=> b!891408 m!829733))

(declare-fun m!829735 () Bool)

(assert (=> b!891408 m!829735))

(declare-fun m!829737 () Bool)

(assert (=> b!891408 m!829737))

(declare-fun m!829739 () Bool)

(assert (=> b!891408 m!829739))

(declare-fun m!829741 () Bool)

(assert (=> b!891408 m!829741))

(declare-fun m!829743 () Bool)

(assert (=> b!891406 m!829743))

(declare-fun m!829745 () Bool)

(assert (=> b!891406 m!829745))

(declare-fun m!829747 () Bool)

(assert (=> b!891404 m!829747))

(declare-fun m!829749 () Bool)

(assert (=> b!891404 m!829749))

(check-sat (not mapNonEmpty!28685) (not b!891408) b_and!25999 (not start!75788) (not b!891403) (not b!891413) (not b!891411) (not b!891405) (not b_next!15759) tp_is_empty!18087 (not b!891404) (not b!891406))
(check-sat b_and!25999 (not b_next!15759))
