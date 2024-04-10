; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16166 () Bool)

(assert start!16166)

(declare-fun b!161147 () Bool)

(declare-fun b_free!3627 () Bool)

(declare-fun b_next!3627 () Bool)

(assert (=> b!161147 (= b_free!3627 (not b_next!3627))))

(declare-fun tp!13451 () Bool)

(declare-fun b_and!10041 () Bool)

(assert (=> b!161147 (= tp!13451 b_and!10041)))

(declare-fun b!161145 () Bool)

(declare-fun e!105294 () Bool)

(assert (=> b!161145 (= e!105294 false)))

(declare-fun lt!82153 () Bool)

(declare-datatypes ((V!4219 0))(
  ( (V!4220 (val!1759 Int)) )
))
(declare-datatypes ((ValueCell!1371 0))(
  ( (ValueCellFull!1371 (v!3624 V!4219)) (EmptyCell!1371) )
))
(declare-datatypes ((array!5937 0))(
  ( (array!5938 (arr!2813 (Array (_ BitVec 32) (_ BitVec 64))) (size!3097 (_ BitVec 32))) )
))
(declare-datatypes ((array!5939 0))(
  ( (array!5940 (arr!2814 (Array (_ BitVec 32) ValueCell!1371)) (size!3098 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1650 0))(
  ( (LongMapFixedSize!1651 (defaultEntry!3267 Int) (mask!7851 (_ BitVec 32)) (extraKeys!3008 (_ BitVec 32)) (zeroValue!3110 V!4219) (minValue!3110 V!4219) (_size!874 (_ BitVec 32)) (_keys!5068 array!5937) (_values!3250 array!5939) (_vacant!874 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1650)

(declare-datatypes ((List!1969 0))(
  ( (Nil!1966) (Cons!1965 (h!2578 (_ BitVec 64)) (t!6771 List!1969)) )
))
(declare-fun arrayNoDuplicates!0 (array!5937 (_ BitVec 32) List!1969) Bool)

(assert (=> b!161145 (= lt!82153 (arrayNoDuplicates!0 (_keys!5068 thiss!1248) #b00000000000000000000000000000000 Nil!1966))))

(declare-fun b!161146 () Bool)

(declare-fun res!76418 () Bool)

(assert (=> b!161146 (=> (not res!76418) (not e!105294))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2950 0))(
  ( (tuple2!2951 (_1!1486 (_ BitVec 64)) (_2!1486 V!4219)) )
))
(declare-datatypes ((List!1970 0))(
  ( (Nil!1967) (Cons!1966 (h!2579 tuple2!2950) (t!6772 List!1970)) )
))
(declare-datatypes ((ListLongMap!1937 0))(
  ( (ListLongMap!1938 (toList!984 List!1970)) )
))
(declare-fun contains!1020 (ListLongMap!1937 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!648 (array!5937 array!5939 (_ BitVec 32) (_ BitVec 32) V!4219 V!4219 (_ BitVec 32) Int) ListLongMap!1937)

(assert (=> b!161146 (= res!76418 (not (contains!1020 (getCurrentListMap!648 (_keys!5068 thiss!1248) (_values!3250 thiss!1248) (mask!7851 thiss!1248) (extraKeys!3008 thiss!1248) (zeroValue!3110 thiss!1248) (minValue!3110 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3267 thiss!1248)) key!828)))))

(declare-fun mapNonEmpty!5831 () Bool)

(declare-fun mapRes!5831 () Bool)

(declare-fun tp!13450 () Bool)

(declare-fun e!105292 () Bool)

(assert (=> mapNonEmpty!5831 (= mapRes!5831 (and tp!13450 e!105292))))

(declare-fun mapValue!5831 () ValueCell!1371)

(declare-fun mapRest!5831 () (Array (_ BitVec 32) ValueCell!1371))

(declare-fun mapKey!5831 () (_ BitVec 32))

(assert (=> mapNonEmpty!5831 (= (arr!2814 (_values!3250 thiss!1248)) (store mapRest!5831 mapKey!5831 mapValue!5831))))

(declare-fun e!105291 () Bool)

(declare-fun e!105293 () Bool)

(declare-fun tp_is_empty!3429 () Bool)

(declare-fun array_inv!1797 (array!5937) Bool)

(declare-fun array_inv!1798 (array!5939) Bool)

(assert (=> b!161147 (= e!105293 (and tp!13451 tp_is_empty!3429 (array_inv!1797 (_keys!5068 thiss!1248)) (array_inv!1798 (_values!3250 thiss!1248)) e!105291))))

(declare-fun res!76419 () Bool)

(assert (=> start!16166 (=> (not res!76419) (not e!105294))))

(declare-fun valid!759 (LongMapFixedSize!1650) Bool)

(assert (=> start!16166 (= res!76419 (valid!759 thiss!1248))))

(assert (=> start!16166 e!105294))

(assert (=> start!16166 e!105293))

(assert (=> start!16166 true))

(declare-fun mapIsEmpty!5831 () Bool)

(assert (=> mapIsEmpty!5831 mapRes!5831))

(declare-fun b!161148 () Bool)

(declare-fun e!105289 () Bool)

(assert (=> b!161148 (= e!105289 tp_is_empty!3429)))

(declare-fun b!161149 () Bool)

(assert (=> b!161149 (= e!105292 tp_is_empty!3429)))

(declare-fun b!161150 () Bool)

(declare-fun res!76421 () Bool)

(assert (=> b!161150 (=> (not res!76421) (not e!105294))))

(assert (=> b!161150 (= res!76421 (and (= (size!3098 (_values!3250 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7851 thiss!1248))) (= (size!3097 (_keys!5068 thiss!1248)) (size!3098 (_values!3250 thiss!1248))) (bvsge (mask!7851 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3008 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3008 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!161151 () Bool)

(declare-fun res!76415 () Bool)

(assert (=> b!161151 (=> (not res!76415) (not e!105294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5937 (_ BitVec 32)) Bool)

(assert (=> b!161151 (= res!76415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5068 thiss!1248) (mask!7851 thiss!1248)))))

(declare-fun b!161152 () Bool)

(assert (=> b!161152 (= e!105291 (and e!105289 mapRes!5831))))

(declare-fun condMapEmpty!5831 () Bool)

(declare-fun mapDefault!5831 () ValueCell!1371)

(assert (=> b!161152 (= condMapEmpty!5831 (= (arr!2814 (_values!3250 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1371)) mapDefault!5831)))))

(declare-fun b!161153 () Bool)

(declare-fun res!76417 () Bool)

(assert (=> b!161153 (=> (not res!76417) (not e!105294))))

(assert (=> b!161153 (= res!76417 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161154 () Bool)

(declare-fun res!76420 () Bool)

(assert (=> b!161154 (=> (not res!76420) (not e!105294))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!347 0))(
  ( (MissingZero!347 (index!3556 (_ BitVec 32))) (Found!347 (index!3557 (_ BitVec 32))) (Intermediate!347 (undefined!1159 Bool) (index!3558 (_ BitVec 32)) (x!17779 (_ BitVec 32))) (Undefined!347) (MissingVacant!347 (index!3559 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5937 (_ BitVec 32)) SeekEntryResult!347)

(assert (=> b!161154 (= res!76420 ((_ is Undefined!347) (seekEntryOrOpen!0 key!828 (_keys!5068 thiss!1248) (mask!7851 thiss!1248))))))

(declare-fun b!161155 () Bool)

(declare-fun res!76416 () Bool)

(assert (=> b!161155 (=> (not res!76416) (not e!105294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!161155 (= res!76416 (validMask!0 (mask!7851 thiss!1248)))))

(assert (= (and start!16166 res!76419) b!161153))

(assert (= (and b!161153 res!76417) b!161154))

(assert (= (and b!161154 res!76420) b!161146))

(assert (= (and b!161146 res!76418) b!161155))

(assert (= (and b!161155 res!76416) b!161150))

(assert (= (and b!161150 res!76421) b!161151))

(assert (= (and b!161151 res!76415) b!161145))

(assert (= (and b!161152 condMapEmpty!5831) mapIsEmpty!5831))

(assert (= (and b!161152 (not condMapEmpty!5831)) mapNonEmpty!5831))

(assert (= (and mapNonEmpty!5831 ((_ is ValueCellFull!1371) mapValue!5831)) b!161149))

(assert (= (and b!161152 ((_ is ValueCellFull!1371) mapDefault!5831)) b!161148))

(assert (= b!161147 b!161152))

(assert (= start!16166 b!161147))

(declare-fun m!192737 () Bool)

(assert (=> b!161155 m!192737))

(declare-fun m!192739 () Bool)

(assert (=> start!16166 m!192739))

(declare-fun m!192741 () Bool)

(assert (=> b!161147 m!192741))

(declare-fun m!192743 () Bool)

(assert (=> b!161147 m!192743))

(declare-fun m!192745 () Bool)

(assert (=> mapNonEmpty!5831 m!192745))

(declare-fun m!192747 () Bool)

(assert (=> b!161154 m!192747))

(declare-fun m!192749 () Bool)

(assert (=> b!161151 m!192749))

(declare-fun m!192751 () Bool)

(assert (=> b!161146 m!192751))

(assert (=> b!161146 m!192751))

(declare-fun m!192753 () Bool)

(assert (=> b!161146 m!192753))

(declare-fun m!192755 () Bool)

(assert (=> b!161145 m!192755))

(check-sat (not b!161155) (not b_next!3627) (not b!161146) (not b!161145) b_and!10041 (not b!161147) tp_is_empty!3429 (not b!161151) (not start!16166) (not b!161154) (not mapNonEmpty!5831))
(check-sat b_and!10041 (not b_next!3627))
