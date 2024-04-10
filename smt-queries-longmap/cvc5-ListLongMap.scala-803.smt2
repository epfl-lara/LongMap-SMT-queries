; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19288 () Bool)

(assert start!19288)

(declare-fun b!189801 () Bool)

(declare-fun b_free!4657 () Bool)

(declare-fun b_next!4657 () Bool)

(assert (=> b!189801 (= b_free!4657 (not b_next!4657))))

(declare-fun tp!16806 () Bool)

(declare-fun b_and!11299 () Bool)

(assert (=> b!189801 (= tp!16806 b_and!11299)))

(declare-fun b!189792 () Bool)

(declare-datatypes ((Unit!5731 0))(
  ( (Unit!5732) )
))
(declare-fun e!124900 () Unit!5731)

(declare-fun Unit!5733 () Unit!5731)

(assert (=> b!189792 (= e!124900 Unit!5733)))

(declare-fun lt!93977 () Unit!5731)

(declare-datatypes ((V!5553 0))(
  ( (V!5554 (val!2259 Int)) )
))
(declare-datatypes ((ValueCell!1871 0))(
  ( (ValueCellFull!1871 (v!4183 V!5553)) (EmptyCell!1871) )
))
(declare-datatypes ((array!8089 0))(
  ( (array!8090 (arr!3813 (Array (_ BitVec 32) (_ BitVec 64))) (size!4133 (_ BitVec 32))) )
))
(declare-datatypes ((array!8091 0))(
  ( (array!8092 (arr!3814 (Array (_ BitVec 32) ValueCell!1871)) (size!4134 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2650 0))(
  ( (LongMapFixedSize!2651 (defaultEntry!3873 Int) (mask!9066 (_ BitVec 32)) (extraKeys!3610 (_ BitVec 32)) (zeroValue!3714 V!5553) (minValue!3714 V!5553) (_size!1374 (_ BitVec 32)) (_keys!5841 array!8089) (_values!3856 array!8091) (_vacant!1374 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2650)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!171 (array!8089 array!8091 (_ BitVec 32) (_ BitVec 32) V!5553 V!5553 (_ BitVec 64) Int) Unit!5731)

(assert (=> b!189792 (= lt!93977 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!171 (_keys!5841 thiss!1248) (_values!3856 thiss!1248) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) key!828 (defaultEntry!3873 thiss!1248)))))

(assert (=> b!189792 false))

(declare-fun mapNonEmpty!7642 () Bool)

(declare-fun mapRes!7642 () Bool)

(declare-fun tp!16807 () Bool)

(declare-fun e!124902 () Bool)

(assert (=> mapNonEmpty!7642 (= mapRes!7642 (and tp!16807 e!124902))))

(declare-fun mapKey!7642 () (_ BitVec 32))

(declare-fun mapRest!7642 () (Array (_ BitVec 32) ValueCell!1871))

(declare-fun mapValue!7642 () ValueCell!1871)

(assert (=> mapNonEmpty!7642 (= (arr!3814 (_values!3856 thiss!1248)) (store mapRest!7642 mapKey!7642 mapValue!7642))))

(declare-fun b!189794 () Bool)

(declare-fun e!124906 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!189794 (= e!124906 (not (validMask!0 (mask!9066 thiss!1248))))))

(declare-datatypes ((tuple2!3514 0))(
  ( (tuple2!3515 (_1!1768 (_ BitVec 64)) (_2!1768 V!5553)) )
))
(declare-datatypes ((List!2412 0))(
  ( (Nil!2409) (Cons!2408 (h!3045 tuple2!3514) (t!7318 List!2412)) )
))
(declare-datatypes ((ListLongMap!2431 0))(
  ( (ListLongMap!2432 (toList!1231 List!2412)) )
))
(declare-fun lt!93980 () ListLongMap!2431)

(declare-fun v!309 () V!5553)

(declare-datatypes ((SeekEntryResult!668 0))(
  ( (MissingZero!668 (index!4842 (_ BitVec 32))) (Found!668 (index!4843 (_ BitVec 32))) (Intermediate!668 (undefined!1480 Bool) (index!4844 (_ BitVec 32)) (x!20452 (_ BitVec 32))) (Undefined!668) (MissingVacant!668 (index!4845 (_ BitVec 32))) )
))
(declare-fun lt!93978 () SeekEntryResult!668)

(declare-fun +!299 (ListLongMap!2431 tuple2!3514) ListLongMap!2431)

(declare-fun getCurrentListMap!879 (array!8089 array!8091 (_ BitVec 32) (_ BitVec 32) V!5553 V!5553 (_ BitVec 32) Int) ListLongMap!2431)

(assert (=> b!189794 (= (+!299 lt!93980 (tuple2!3515 key!828 v!309)) (getCurrentListMap!879 (_keys!5841 thiss!1248) (array!8092 (store (arr!3814 (_values!3856 thiss!1248)) (index!4843 lt!93978) (ValueCellFull!1871 v!309)) (size!4134 (_values!3856 thiss!1248))) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)))))

(declare-fun lt!93981 () Unit!5731)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!100 (array!8089 array!8091 (_ BitVec 32) (_ BitVec 32) V!5553 V!5553 (_ BitVec 32) (_ BitVec 64) V!5553 Int) Unit!5731)

(assert (=> b!189794 (= lt!93981 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!100 (_keys!5841 thiss!1248) (_values!3856 thiss!1248) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) (index!4843 lt!93978) key!828 v!309 (defaultEntry!3873 thiss!1248)))))

(declare-fun lt!93979 () Unit!5731)

(assert (=> b!189794 (= lt!93979 e!124900)))

(declare-fun c!34100 () Bool)

(declare-fun contains!1339 (ListLongMap!2431 (_ BitVec 64)) Bool)

(assert (=> b!189794 (= c!34100 (contains!1339 lt!93980 key!828))))

(assert (=> b!189794 (= lt!93980 (getCurrentListMap!879 (_keys!5841 thiss!1248) (_values!3856 thiss!1248) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)))))

(declare-fun mapIsEmpty!7642 () Bool)

(assert (=> mapIsEmpty!7642 mapRes!7642))

(declare-fun b!189795 () Bool)

(declare-fun tp_is_empty!4429 () Bool)

(assert (=> b!189795 (= e!124902 tp_is_empty!4429)))

(declare-fun b!189793 () Bool)

(declare-fun e!124901 () Bool)

(assert (=> b!189793 (= e!124901 e!124906)))

(declare-fun res!89743 () Bool)

(assert (=> b!189793 (=> (not res!89743) (not e!124906))))

(assert (=> b!189793 (= res!89743 (and (not (is-Undefined!668 lt!93978)) (not (is-MissingVacant!668 lt!93978)) (not (is-MissingZero!668 lt!93978)) (is-Found!668 lt!93978)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8089 (_ BitVec 32)) SeekEntryResult!668)

(assert (=> b!189793 (= lt!93978 (seekEntryOrOpen!0 key!828 (_keys!5841 thiss!1248) (mask!9066 thiss!1248)))))

(declare-fun res!89740 () Bool)

(assert (=> start!19288 (=> (not res!89740) (not e!124901))))

(declare-fun valid!1088 (LongMapFixedSize!2650) Bool)

(assert (=> start!19288 (= res!89740 (valid!1088 thiss!1248))))

(assert (=> start!19288 e!124901))

(declare-fun e!124904 () Bool)

(assert (=> start!19288 e!124904))

(assert (=> start!19288 true))

(assert (=> start!19288 tp_is_empty!4429))

(declare-fun b!189796 () Bool)

(declare-fun e!124899 () Bool)

(assert (=> b!189796 (= e!124899 tp_is_empty!4429)))

(declare-fun b!189797 () Bool)

(declare-fun lt!93976 () Unit!5731)

(assert (=> b!189797 (= e!124900 lt!93976)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!167 (array!8089 array!8091 (_ BitVec 32) (_ BitVec 32) V!5553 V!5553 (_ BitVec 64) Int) Unit!5731)

(assert (=> b!189797 (= lt!93976 (lemmaInListMapThenSeekEntryOrOpenFindsIt!167 (_keys!5841 thiss!1248) (_values!3856 thiss!1248) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) key!828 (defaultEntry!3873 thiss!1248)))))

(declare-fun res!89742 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!189797 (= res!89742 (inRange!0 (index!4843 lt!93978) (mask!9066 thiss!1248)))))

(declare-fun e!124905 () Bool)

(assert (=> b!189797 (=> (not res!89742) (not e!124905))))

(assert (=> b!189797 e!124905))

(declare-fun b!189798 () Bool)

(declare-fun e!124898 () Bool)

(assert (=> b!189798 (= e!124898 (and e!124899 mapRes!7642))))

(declare-fun condMapEmpty!7642 () Bool)

(declare-fun mapDefault!7642 () ValueCell!1871)

