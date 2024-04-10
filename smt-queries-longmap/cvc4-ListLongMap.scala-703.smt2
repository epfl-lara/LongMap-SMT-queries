; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16726 () Bool)

(assert start!16726)

(declare-fun b!167920 () Bool)

(declare-fun b_free!4031 () Bool)

(declare-fun b_next!4031 () Bool)

(assert (=> b!167920 (= b_free!4031 (not b_next!4031))))

(declare-fun tp!14694 () Bool)

(declare-fun b_and!10445 () Bool)

(assert (=> b!167920 (= tp!14694 b_and!10445)))

(declare-fun b!167916 () Bool)

(declare-datatypes ((SeekEntryResult!489 0))(
  ( (MissingZero!489 (index!4124 (_ BitVec 32))) (Found!489 (index!4125 (_ BitVec 32))) (Intermediate!489 (undefined!1301 Bool) (index!4126 (_ BitVec 32)) (x!18565 (_ BitVec 32))) (Undefined!489) (MissingVacant!489 (index!4127 (_ BitVec 32))) )
))
(declare-fun lt!83946 () SeekEntryResult!489)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4757 0))(
  ( (V!4758 (val!1961 Int)) )
))
(declare-datatypes ((ValueCell!1573 0))(
  ( (ValueCellFull!1573 (v!3826 V!4757)) (EmptyCell!1573) )
))
(declare-datatypes ((array!6763 0))(
  ( (array!6764 (arr!3217 (Array (_ BitVec 32) (_ BitVec 64))) (size!3505 (_ BitVec 32))) )
))
(declare-datatypes ((array!6765 0))(
  ( (array!6766 (arr!3218 (Array (_ BitVec 32) ValueCell!1573)) (size!3506 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2054 0))(
  ( (LongMapFixedSize!2055 (defaultEntry!3469 Int) (mask!8224 (_ BitVec 32)) (extraKeys!3210 (_ BitVec 32)) (zeroValue!3312 V!4757) (minValue!3312 V!4757) (_size!1076 (_ BitVec 32)) (_keys!5294 array!6763) (_values!3452 array!6765) (_vacant!1076 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2054)

(declare-fun e!110336 () Bool)

(assert (=> b!167916 (= e!110336 (= (select (arr!3217 (_keys!5294 thiss!1248)) (index!4125 lt!83946)) key!828))))

(declare-fun b!167917 () Bool)

(declare-fun e!110330 () Bool)

(declare-fun tp_is_empty!3833 () Bool)

(assert (=> b!167917 (= e!110330 tp_is_empty!3833)))

(declare-fun mapNonEmpty!6468 () Bool)

(declare-fun mapRes!6468 () Bool)

(declare-fun tp!14693 () Bool)

(declare-fun e!110333 () Bool)

(assert (=> mapNonEmpty!6468 (= mapRes!6468 (and tp!14693 e!110333))))

(declare-fun mapValue!6468 () ValueCell!1573)

(declare-fun mapRest!6468 () (Array (_ BitVec 32) ValueCell!1573))

(declare-fun mapKey!6468 () (_ BitVec 32))

(assert (=> mapNonEmpty!6468 (= (arr!3218 (_values!3452 thiss!1248)) (store mapRest!6468 mapKey!6468 mapValue!6468))))

(declare-fun res!79898 () Bool)

(declare-fun e!110338 () Bool)

(assert (=> start!16726 (=> (not res!79898) (not e!110338))))

(declare-fun valid!893 (LongMapFixedSize!2054) Bool)

(assert (=> start!16726 (= res!79898 (valid!893 thiss!1248))))

(assert (=> start!16726 e!110338))

(declare-fun e!110335 () Bool)

(assert (=> start!16726 e!110335))

(assert (=> start!16726 true))

(assert (=> start!16726 tp_is_empty!3833))

(declare-fun b!167918 () Bool)

(declare-fun res!79901 () Bool)

(assert (=> b!167918 (=> (not res!79901) (not e!110338))))

(assert (=> b!167918 (= res!79901 (not (= key!828 (bvneg key!828))))))

(declare-fun b!167919 () Bool)

(declare-fun res!79897 () Bool)

(declare-fun e!110331 () Bool)

(assert (=> b!167919 (=> res!79897 e!110331)))

(assert (=> b!167919 (= res!79897 (or (not (= (size!3506 (_values!3452 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8224 thiss!1248)))) (not (= (size!3505 (_keys!5294 thiss!1248)) (size!3506 (_values!3452 thiss!1248)))) (bvslt (mask!8224 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3210 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3210 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun e!110339 () Bool)

(declare-fun array_inv!2069 (array!6763) Bool)

(declare-fun array_inv!2070 (array!6765) Bool)

(assert (=> b!167920 (= e!110335 (and tp!14694 tp_is_empty!3833 (array_inv!2069 (_keys!5294 thiss!1248)) (array_inv!2070 (_values!3452 thiss!1248)) e!110339))))

(declare-fun b!167921 () Bool)

(declare-fun e!110332 () Bool)

(assert (=> b!167921 (= e!110338 e!110332)))

(declare-fun res!79902 () Bool)

(assert (=> b!167921 (=> (not res!79902) (not e!110332))))

(assert (=> b!167921 (= res!79902 (and (not (is-Undefined!489 lt!83946)) (not (is-MissingVacant!489 lt!83946)) (not (is-MissingZero!489 lt!83946)) (is-Found!489 lt!83946)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6763 (_ BitVec 32)) SeekEntryResult!489)

(assert (=> b!167921 (= lt!83946 (seekEntryOrOpen!0 key!828 (_keys!5294 thiss!1248) (mask!8224 thiss!1248)))))

(declare-fun b!167922 () Bool)

(declare-datatypes ((Unit!5151 0))(
  ( (Unit!5152) )
))
(declare-fun e!110337 () Unit!5151)

(declare-fun lt!83948 () Unit!5151)

(assert (=> b!167922 (= e!110337 lt!83948)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!113 (array!6763 array!6765 (_ BitVec 32) (_ BitVec 32) V!4757 V!4757 (_ BitVec 64) Int) Unit!5151)

(assert (=> b!167922 (= lt!83948 (lemmaInListMapThenSeekEntryOrOpenFindsIt!113 (_keys!5294 thiss!1248) (_values!3452 thiss!1248) (mask!8224 thiss!1248) (extraKeys!3210 thiss!1248) (zeroValue!3312 thiss!1248) (minValue!3312 thiss!1248) key!828 (defaultEntry!3469 thiss!1248)))))

(declare-fun res!79899 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167922 (= res!79899 (inRange!0 (index!4125 lt!83946) (mask!8224 thiss!1248)))))

(assert (=> b!167922 (=> (not res!79899) (not e!110336))))

(assert (=> b!167922 e!110336))

(declare-fun b!167923 () Bool)

(assert (=> b!167923 (= e!110331 true)))

(declare-fun lt!83945 () Bool)

(declare-datatypes ((List!2142 0))(
  ( (Nil!2139) (Cons!2138 (h!2755 (_ BitVec 64)) (t!6944 List!2142)) )
))
(declare-fun arrayNoDuplicates!0 (array!6763 (_ BitVec 32) List!2142) Bool)

(assert (=> b!167923 (= lt!83945 (arrayNoDuplicates!0 (_keys!5294 thiss!1248) #b00000000000000000000000000000000 Nil!2139))))

(declare-fun mapIsEmpty!6468 () Bool)

(assert (=> mapIsEmpty!6468 mapRes!6468))

(declare-fun b!167924 () Bool)

(declare-fun Unit!5153 () Unit!5151)

(assert (=> b!167924 (= e!110337 Unit!5153)))

(declare-fun lt!83944 () Unit!5151)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!114 (array!6763 array!6765 (_ BitVec 32) (_ BitVec 32) V!4757 V!4757 (_ BitVec 64) Int) Unit!5151)

(assert (=> b!167924 (= lt!83944 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!114 (_keys!5294 thiss!1248) (_values!3452 thiss!1248) (mask!8224 thiss!1248) (extraKeys!3210 thiss!1248) (zeroValue!3312 thiss!1248) (minValue!3312 thiss!1248) key!828 (defaultEntry!3469 thiss!1248)))))

(assert (=> b!167924 false))

(declare-fun b!167925 () Bool)

(assert (=> b!167925 (= e!110332 (not e!110331))))

(declare-fun res!79900 () Bool)

(assert (=> b!167925 (=> res!79900 e!110331)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167925 (= res!79900 (not (validMask!0 (mask!8224 thiss!1248))))))

(declare-datatypes ((tuple2!3154 0))(
  ( (tuple2!3155 (_1!1588 (_ BitVec 64)) (_2!1588 V!4757)) )
))
(declare-datatypes ((List!2143 0))(
  ( (Nil!2140) (Cons!2139 (h!2756 tuple2!3154) (t!6945 List!2143)) )
))
(declare-datatypes ((ListLongMap!2109 0))(
  ( (ListLongMap!2110 (toList!1070 List!2143)) )
))
(declare-fun lt!83949 () ListLongMap!2109)

(declare-fun v!309 () V!4757)

(declare-fun +!222 (ListLongMap!2109 tuple2!3154) ListLongMap!2109)

(declare-fun getCurrentListMap!728 (array!6763 array!6765 (_ BitVec 32) (_ BitVec 32) V!4757 V!4757 (_ BitVec 32) Int) ListLongMap!2109)

(assert (=> b!167925 (= (+!222 lt!83949 (tuple2!3155 key!828 v!309)) (getCurrentListMap!728 (_keys!5294 thiss!1248) (array!6766 (store (arr!3218 (_values!3452 thiss!1248)) (index!4125 lt!83946) (ValueCellFull!1573 v!309)) (size!3506 (_values!3452 thiss!1248))) (mask!8224 thiss!1248) (extraKeys!3210 thiss!1248) (zeroValue!3312 thiss!1248) (minValue!3312 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3469 thiss!1248)))))

(declare-fun lt!83947 () Unit!5151)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!77 (array!6763 array!6765 (_ BitVec 32) (_ BitVec 32) V!4757 V!4757 (_ BitVec 32) (_ BitVec 64) V!4757 Int) Unit!5151)

(assert (=> b!167925 (= lt!83947 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!77 (_keys!5294 thiss!1248) (_values!3452 thiss!1248) (mask!8224 thiss!1248) (extraKeys!3210 thiss!1248) (zeroValue!3312 thiss!1248) (minValue!3312 thiss!1248) (index!4125 lt!83946) key!828 v!309 (defaultEntry!3469 thiss!1248)))))

(declare-fun lt!83950 () Unit!5151)

(assert (=> b!167925 (= lt!83950 e!110337)))

(declare-fun c!30328 () Bool)

(declare-fun contains!1112 (ListLongMap!2109 (_ BitVec 64)) Bool)

(assert (=> b!167925 (= c!30328 (contains!1112 lt!83949 key!828))))

(assert (=> b!167925 (= lt!83949 (getCurrentListMap!728 (_keys!5294 thiss!1248) (_values!3452 thiss!1248) (mask!8224 thiss!1248) (extraKeys!3210 thiss!1248) (zeroValue!3312 thiss!1248) (minValue!3312 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3469 thiss!1248)))))

(declare-fun b!167926 () Bool)

(assert (=> b!167926 (= e!110333 tp_is_empty!3833)))

(declare-fun b!167927 () Bool)

(assert (=> b!167927 (= e!110339 (and e!110330 mapRes!6468))))

(declare-fun condMapEmpty!6468 () Bool)

(declare-fun mapDefault!6468 () ValueCell!1573)

