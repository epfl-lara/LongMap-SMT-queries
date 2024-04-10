; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16712 () Bool)

(assert start!16712)

(declare-fun b!167651 () Bool)

(declare-fun b_free!4017 () Bool)

(declare-fun b_next!4017 () Bool)

(assert (=> b!167651 (= b_free!4017 (not b_next!4017))))

(declare-fun tp!14651 () Bool)

(declare-fun b_and!10431 () Bool)

(assert (=> b!167651 (= tp!14651 b_and!10431)))

(declare-fun res!79755 () Bool)

(declare-fun e!110122 () Bool)

(assert (=> start!16712 (=> (not res!79755) (not e!110122))))

(declare-datatypes ((V!4739 0))(
  ( (V!4740 (val!1954 Int)) )
))
(declare-datatypes ((ValueCell!1566 0))(
  ( (ValueCellFull!1566 (v!3819 V!4739)) (EmptyCell!1566) )
))
(declare-datatypes ((array!6735 0))(
  ( (array!6736 (arr!3203 (Array (_ BitVec 32) (_ BitVec 64))) (size!3491 (_ BitVec 32))) )
))
(declare-datatypes ((array!6737 0))(
  ( (array!6738 (arr!3204 (Array (_ BitVec 32) ValueCell!1566)) (size!3492 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2040 0))(
  ( (LongMapFixedSize!2041 (defaultEntry!3462 Int) (mask!8213 (_ BitVec 32)) (extraKeys!3203 (_ BitVec 32)) (zeroValue!3305 V!4739) (minValue!3305 V!4739) (_size!1069 (_ BitVec 32)) (_keys!5287 array!6735) (_values!3445 array!6737) (_vacant!1069 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2040)

(declare-fun valid!889 (LongMapFixedSize!2040) Bool)

(assert (=> start!16712 (= res!79755 (valid!889 thiss!1248))))

(assert (=> start!16712 e!110122))

(declare-fun e!110124 () Bool)

(assert (=> start!16712 e!110124))

(assert (=> start!16712 true))

(declare-fun tp_is_empty!3819 () Bool)

(assert (=> start!16712 tp_is_empty!3819))

(declare-fun b!167643 () Bool)

(declare-fun e!110126 () Bool)

(assert (=> b!167643 (= e!110126 tp_is_empty!3819)))

(declare-fun b!167644 () Bool)

(declare-fun res!79749 () Bool)

(declare-fun e!110129 () Bool)

(assert (=> b!167644 (=> res!79749 e!110129)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6735 (_ BitVec 32)) Bool)

(assert (=> b!167644 (= res!79749 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5287 thiss!1248) (mask!8213 thiss!1248))))))

(declare-fun mapNonEmpty!6447 () Bool)

(declare-fun mapRes!6447 () Bool)

(declare-fun tp!14652 () Bool)

(declare-fun e!110125 () Bool)

(assert (=> mapNonEmpty!6447 (= mapRes!6447 (and tp!14652 e!110125))))

(declare-fun mapRest!6447 () (Array (_ BitVec 32) ValueCell!1566))

(declare-fun mapValue!6447 () ValueCell!1566)

(declare-fun mapKey!6447 () (_ BitVec 32))

(assert (=> mapNonEmpty!6447 (= (arr!3204 (_values!3445 thiss!1248)) (store mapRest!6447 mapKey!6447 mapValue!6447))))

(declare-fun b!167645 () Bool)

(declare-fun e!110127 () Bool)

(assert (=> b!167645 (= e!110122 e!110127)))

(declare-fun res!79750 () Bool)

(assert (=> b!167645 (=> (not res!79750) (not e!110127))))

(declare-datatypes ((SeekEntryResult!483 0))(
  ( (MissingZero!483 (index!4100 (_ BitVec 32))) (Found!483 (index!4101 (_ BitVec 32))) (Intermediate!483 (undefined!1295 Bool) (index!4102 (_ BitVec 32)) (x!18543 (_ BitVec 32))) (Undefined!483) (MissingVacant!483 (index!4103 (_ BitVec 32))) )
))
(declare-fun lt!83797 () SeekEntryResult!483)

(get-info :version)

(assert (=> b!167645 (= res!79750 (and (not ((_ is Undefined!483) lt!83797)) (not ((_ is MissingVacant!483) lt!83797)) (not ((_ is MissingZero!483) lt!83797)) ((_ is Found!483) lt!83797)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6735 (_ BitVec 32)) SeekEntryResult!483)

(assert (=> b!167645 (= lt!83797 (seekEntryOrOpen!0 key!828 (_keys!5287 thiss!1248) (mask!8213 thiss!1248)))))

(declare-fun e!110120 () Bool)

(declare-fun b!167646 () Bool)

(assert (=> b!167646 (= e!110120 (= (select (arr!3203 (_keys!5287 thiss!1248)) (index!4101 lt!83797)) key!828))))

(declare-fun b!167647 () Bool)

(declare-fun res!79752 () Bool)

(assert (=> b!167647 (=> (not res!79752) (not e!110122))))

(assert (=> b!167647 (= res!79752 (not (= key!828 (bvneg key!828))))))

(declare-fun b!167648 () Bool)

(assert (=> b!167648 (= e!110127 (not e!110129))))

(declare-fun res!79751 () Bool)

(assert (=> b!167648 (=> res!79751 e!110129)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167648 (= res!79751 (not (validMask!0 (mask!8213 thiss!1248))))))

(declare-datatypes ((tuple2!3148 0))(
  ( (tuple2!3149 (_1!1585 (_ BitVec 64)) (_2!1585 V!4739)) )
))
(declare-datatypes ((List!2136 0))(
  ( (Nil!2133) (Cons!2132 (h!2749 tuple2!3148) (t!6938 List!2136)) )
))
(declare-datatypes ((ListLongMap!2103 0))(
  ( (ListLongMap!2104 (toList!1067 List!2136)) )
))
(declare-fun lt!83799 () ListLongMap!2103)

(declare-fun v!309 () V!4739)

(declare-fun +!219 (ListLongMap!2103 tuple2!3148) ListLongMap!2103)

(declare-fun getCurrentListMap!725 (array!6735 array!6737 (_ BitVec 32) (_ BitVec 32) V!4739 V!4739 (_ BitVec 32) Int) ListLongMap!2103)

(assert (=> b!167648 (= (+!219 lt!83799 (tuple2!3149 key!828 v!309)) (getCurrentListMap!725 (_keys!5287 thiss!1248) (array!6738 (store (arr!3204 (_values!3445 thiss!1248)) (index!4101 lt!83797) (ValueCellFull!1566 v!309)) (size!3492 (_values!3445 thiss!1248))) (mask!8213 thiss!1248) (extraKeys!3203 thiss!1248) (zeroValue!3305 thiss!1248) (minValue!3305 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3462 thiss!1248)))))

(declare-datatypes ((Unit!5137 0))(
  ( (Unit!5138) )
))
(declare-fun lt!83798 () Unit!5137)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!74 (array!6735 array!6737 (_ BitVec 32) (_ BitVec 32) V!4739 V!4739 (_ BitVec 32) (_ BitVec 64) V!4739 Int) Unit!5137)

(assert (=> b!167648 (= lt!83798 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!74 (_keys!5287 thiss!1248) (_values!3445 thiss!1248) (mask!8213 thiss!1248) (extraKeys!3203 thiss!1248) (zeroValue!3305 thiss!1248) (minValue!3305 thiss!1248) (index!4101 lt!83797) key!828 v!309 (defaultEntry!3462 thiss!1248)))))

(declare-fun lt!83801 () Unit!5137)

(declare-fun e!110123 () Unit!5137)

(assert (=> b!167648 (= lt!83801 e!110123)))

(declare-fun c!30307 () Bool)

(declare-fun contains!1109 (ListLongMap!2103 (_ BitVec 64)) Bool)

(assert (=> b!167648 (= c!30307 (contains!1109 lt!83799 key!828))))

(assert (=> b!167648 (= lt!83799 (getCurrentListMap!725 (_keys!5287 thiss!1248) (_values!3445 thiss!1248) (mask!8213 thiss!1248) (extraKeys!3203 thiss!1248) (zeroValue!3305 thiss!1248) (minValue!3305 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3462 thiss!1248)))))

(declare-fun b!167649 () Bool)

(declare-fun e!110128 () Bool)

(assert (=> b!167649 (= e!110128 (and e!110126 mapRes!6447))))

(declare-fun condMapEmpty!6447 () Bool)

(declare-fun mapDefault!6447 () ValueCell!1566)

(assert (=> b!167649 (= condMapEmpty!6447 (= (arr!3204 (_values!3445 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1566)) mapDefault!6447)))))

(declare-fun b!167650 () Bool)

(declare-fun lt!83802 () Unit!5137)

(assert (=> b!167650 (= e!110123 lt!83802)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!109 (array!6735 array!6737 (_ BitVec 32) (_ BitVec 32) V!4739 V!4739 (_ BitVec 64) Int) Unit!5137)

(assert (=> b!167650 (= lt!83802 (lemmaInListMapThenSeekEntryOrOpenFindsIt!109 (_keys!5287 thiss!1248) (_values!3445 thiss!1248) (mask!8213 thiss!1248) (extraKeys!3203 thiss!1248) (zeroValue!3305 thiss!1248) (minValue!3305 thiss!1248) key!828 (defaultEntry!3462 thiss!1248)))))

(declare-fun res!79753 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167650 (= res!79753 (inRange!0 (index!4101 lt!83797) (mask!8213 thiss!1248)))))

(assert (=> b!167650 (=> (not res!79753) (not e!110120))))

(assert (=> b!167650 e!110120))

(declare-fun array_inv!2063 (array!6735) Bool)

(declare-fun array_inv!2064 (array!6737) Bool)

(assert (=> b!167651 (= e!110124 (and tp!14651 tp_is_empty!3819 (array_inv!2063 (_keys!5287 thiss!1248)) (array_inv!2064 (_values!3445 thiss!1248)) e!110128))))

(declare-fun mapIsEmpty!6447 () Bool)

(assert (=> mapIsEmpty!6447 mapRes!6447))

(declare-fun b!167652 () Bool)

(declare-fun Unit!5139 () Unit!5137)

(assert (=> b!167652 (= e!110123 Unit!5139)))

(declare-fun lt!83803 () Unit!5137)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!110 (array!6735 array!6737 (_ BitVec 32) (_ BitVec 32) V!4739 V!4739 (_ BitVec 64) Int) Unit!5137)

(assert (=> b!167652 (= lt!83803 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!110 (_keys!5287 thiss!1248) (_values!3445 thiss!1248) (mask!8213 thiss!1248) (extraKeys!3203 thiss!1248) (zeroValue!3305 thiss!1248) (minValue!3305 thiss!1248) key!828 (defaultEntry!3462 thiss!1248)))))

(assert (=> b!167652 false))

(declare-fun b!167653 () Bool)

(assert (=> b!167653 (= e!110125 tp_is_empty!3819)))

(declare-fun b!167654 () Bool)

(declare-fun res!79754 () Bool)

(assert (=> b!167654 (=> res!79754 e!110129)))

(assert (=> b!167654 (= res!79754 (or (not (= (size!3492 (_values!3445 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8213 thiss!1248)))) (not (= (size!3491 (_keys!5287 thiss!1248)) (size!3492 (_values!3445 thiss!1248)))) (bvslt (mask!8213 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3203 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3203 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!167655 () Bool)

(assert (=> b!167655 (= e!110129 true)))

(declare-fun lt!83800 () Bool)

(declare-datatypes ((List!2137 0))(
  ( (Nil!2134) (Cons!2133 (h!2750 (_ BitVec 64)) (t!6939 List!2137)) )
))
(declare-fun arrayNoDuplicates!0 (array!6735 (_ BitVec 32) List!2137) Bool)

(assert (=> b!167655 (= lt!83800 (arrayNoDuplicates!0 (_keys!5287 thiss!1248) #b00000000000000000000000000000000 Nil!2134))))

(assert (= (and start!16712 res!79755) b!167647))

(assert (= (and b!167647 res!79752) b!167645))

(assert (= (and b!167645 res!79750) b!167648))

(assert (= (and b!167648 c!30307) b!167650))

(assert (= (and b!167648 (not c!30307)) b!167652))

(assert (= (and b!167650 res!79753) b!167646))

(assert (= (and b!167648 (not res!79751)) b!167654))

(assert (= (and b!167654 (not res!79754)) b!167644))

(assert (= (and b!167644 (not res!79749)) b!167655))

(assert (= (and b!167649 condMapEmpty!6447) mapIsEmpty!6447))

(assert (= (and b!167649 (not condMapEmpty!6447)) mapNonEmpty!6447))

(assert (= (and mapNonEmpty!6447 ((_ is ValueCellFull!1566) mapValue!6447)) b!167653))

(assert (= (and b!167649 ((_ is ValueCellFull!1566) mapDefault!6447)) b!167643))

(assert (= b!167651 b!167649))

(assert (= start!16712 b!167651))

(declare-fun m!196779 () Bool)

(assert (=> b!167651 m!196779))

(declare-fun m!196781 () Bool)

(assert (=> b!167651 m!196781))

(declare-fun m!196783 () Bool)

(assert (=> start!16712 m!196783))

(declare-fun m!196785 () Bool)

(assert (=> mapNonEmpty!6447 m!196785))

(declare-fun m!196787 () Bool)

(assert (=> b!167650 m!196787))

(declare-fun m!196789 () Bool)

(assert (=> b!167650 m!196789))

(declare-fun m!196791 () Bool)

(assert (=> b!167648 m!196791))

(declare-fun m!196793 () Bool)

(assert (=> b!167648 m!196793))

(declare-fun m!196795 () Bool)

(assert (=> b!167648 m!196795))

(declare-fun m!196797 () Bool)

(assert (=> b!167648 m!196797))

(declare-fun m!196799 () Bool)

(assert (=> b!167648 m!196799))

(declare-fun m!196801 () Bool)

(assert (=> b!167648 m!196801))

(declare-fun m!196803 () Bool)

(assert (=> b!167648 m!196803))

(declare-fun m!196805 () Bool)

(assert (=> b!167646 m!196805))

(declare-fun m!196807 () Bool)

(assert (=> b!167652 m!196807))

(declare-fun m!196809 () Bool)

(assert (=> b!167644 m!196809))

(declare-fun m!196811 () Bool)

(assert (=> b!167655 m!196811))

(declare-fun m!196813 () Bool)

(assert (=> b!167645 m!196813))

(check-sat (not mapNonEmpty!6447) (not b!167648) (not b!167655) (not b!167645) (not start!16712) (not b!167644) tp_is_empty!3819 (not b!167650) b_and!10431 (not b_next!4017) (not b!167652) (not b!167651))
(check-sat b_and!10431 (not b_next!4017))
