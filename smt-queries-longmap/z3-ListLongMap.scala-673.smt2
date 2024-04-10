; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16544 () Bool)

(assert start!16544)

(declare-fun b!164652 () Bool)

(declare-fun b_free!3849 () Bool)

(declare-fun b_next!3849 () Bool)

(assert (=> b!164652 (= b_free!3849 (not b_next!3849))))

(declare-fun tp!14148 () Bool)

(declare-fun b_and!10263 () Bool)

(assert (=> b!164652 (= tp!14148 b_and!10263)))

(declare-fun mapNonEmpty!6195 () Bool)

(declare-fun mapRes!6195 () Bool)

(declare-fun tp!14147 () Bool)

(declare-fun e!108019 () Bool)

(assert (=> mapNonEmpty!6195 (= mapRes!6195 (and tp!14147 e!108019))))

(declare-datatypes ((V!4515 0))(
  ( (V!4516 (val!1870 Int)) )
))
(declare-datatypes ((ValueCell!1482 0))(
  ( (ValueCellFull!1482 (v!3735 V!4515)) (EmptyCell!1482) )
))
(declare-fun mapRest!6195 () (Array (_ BitVec 32) ValueCell!1482))

(declare-fun mapKey!6195 () (_ BitVec 32))

(declare-datatypes ((array!6399 0))(
  ( (array!6400 (arr!3035 (Array (_ BitVec 32) (_ BitVec 64))) (size!3323 (_ BitVec 32))) )
))
(declare-datatypes ((array!6401 0))(
  ( (array!6402 (arr!3036 (Array (_ BitVec 32) ValueCell!1482)) (size!3324 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1872 0))(
  ( (LongMapFixedSize!1873 (defaultEntry!3378 Int) (mask!8073 (_ BitVec 32)) (extraKeys!3119 (_ BitVec 32)) (zeroValue!3221 V!4515) (minValue!3221 V!4515) (_size!985 (_ BitVec 32)) (_keys!5203 array!6399) (_values!3361 array!6401) (_vacant!985 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1872)

(declare-fun mapValue!6195 () ValueCell!1482)

(assert (=> mapNonEmpty!6195 (= (arr!3036 (_values!3361 thiss!1248)) (store mapRest!6195 mapKey!6195 mapValue!6195))))

(declare-fun b!164645 () Bool)

(declare-fun tp_is_empty!3651 () Bool)

(assert (=> b!164645 (= e!108019 tp_is_empty!3651)))

(declare-fun b!164646 () Bool)

(declare-fun res!77991 () Bool)

(declare-fun e!108023 () Bool)

(assert (=> b!164646 (=> (not res!77991) (not e!108023))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6399 (_ BitVec 32)) Bool)

(assert (=> b!164646 (= res!77991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5203 thiss!1248) (mask!8073 thiss!1248)))))

(declare-fun b!164647 () Bool)

(declare-fun res!77990 () Bool)

(declare-fun e!108018 () Bool)

(assert (=> b!164647 (=> (not res!77990) (not e!108018))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!164647 (= res!77990 (not (= key!828 (bvneg key!828))))))

(declare-fun b!164648 () Bool)

(declare-fun res!77988 () Bool)

(assert (=> b!164648 (=> (not res!77988) (not e!108023))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164648 (= res!77988 (validMask!0 (mask!8073 thiss!1248)))))

(declare-fun b!164649 () Bool)

(declare-fun res!77987 () Bool)

(assert (=> b!164649 (=> (not res!77987) (not e!108023))))

(assert (=> b!164649 (= res!77987 (and (= (size!3324 (_values!3361 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8073 thiss!1248))) (= (size!3323 (_keys!5203 thiss!1248)) (size!3324 (_values!3361 thiss!1248))) (bvsge (mask!8073 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3119 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3119 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!164650 () Bool)

(declare-fun e!108021 () Bool)

(assert (=> b!164650 (= e!108021 tp_is_empty!3651)))

(declare-fun b!164651 () Bool)

(declare-fun e!108017 () Bool)

(assert (=> b!164651 (= e!108017 (and e!108021 mapRes!6195))))

(declare-fun condMapEmpty!6195 () Bool)

(declare-fun mapDefault!6195 () ValueCell!1482)

(assert (=> b!164651 (= condMapEmpty!6195 (= (arr!3036 (_values!3361 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1482)) mapDefault!6195)))))

(declare-fun mapIsEmpty!6195 () Bool)

(assert (=> mapIsEmpty!6195 mapRes!6195))

(declare-fun e!108020 () Bool)

(declare-fun array_inv!1947 (array!6399) Bool)

(declare-fun array_inv!1948 (array!6401) Bool)

(assert (=> b!164652 (= e!108020 (and tp!14148 tp_is_empty!3651 (array_inv!1947 (_keys!5203 thiss!1248)) (array_inv!1948 (_values!3361 thiss!1248)) e!108017))))

(declare-fun b!164653 () Bool)

(assert (=> b!164653 (= e!108018 e!108023)))

(declare-fun res!77985 () Bool)

(assert (=> b!164653 (=> (not res!77985) (not e!108023))))

(declare-datatypes ((SeekEntryResult!421 0))(
  ( (MissingZero!421 (index!3852 (_ BitVec 32))) (Found!421 (index!3853 (_ BitVec 32))) (Intermediate!421 (undefined!1233 Bool) (index!3854 (_ BitVec 32)) (x!18257 (_ BitVec 32))) (Undefined!421) (MissingVacant!421 (index!3855 (_ BitVec 32))) )
))
(declare-fun lt!82927 () SeekEntryResult!421)

(get-info :version)

(assert (=> b!164653 (= res!77985 (and (not ((_ is Undefined!421) lt!82927)) (not ((_ is MissingVacant!421) lt!82927)) (not ((_ is MissingZero!421) lt!82927)) ((_ is Found!421) lt!82927)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6399 (_ BitVec 32)) SeekEntryResult!421)

(assert (=> b!164653 (= lt!82927 (seekEntryOrOpen!0 key!828 (_keys!5203 thiss!1248) (mask!8073 thiss!1248)))))

(declare-fun b!164654 () Bool)

(declare-fun res!77989 () Bool)

(assert (=> b!164654 (=> (not res!77989) (not e!108023))))

(declare-datatypes ((tuple2!3036 0))(
  ( (tuple2!3037 (_1!1529 (_ BitVec 64)) (_2!1529 V!4515)) )
))
(declare-datatypes ((List!2018 0))(
  ( (Nil!2015) (Cons!2014 (h!2631 tuple2!3036) (t!6820 List!2018)) )
))
(declare-datatypes ((ListLongMap!1991 0))(
  ( (ListLongMap!1992 (toList!1011 List!2018)) )
))
(declare-fun contains!1053 (ListLongMap!1991 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!669 (array!6399 array!6401 (_ BitVec 32) (_ BitVec 32) V!4515 V!4515 (_ BitVec 32) Int) ListLongMap!1991)

(assert (=> b!164654 (= res!77989 (contains!1053 (getCurrentListMap!669 (_keys!5203 thiss!1248) (_values!3361 thiss!1248) (mask!8073 thiss!1248) (extraKeys!3119 thiss!1248) (zeroValue!3221 thiss!1248) (minValue!3221 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3378 thiss!1248)) key!828))))

(declare-fun b!164655 () Bool)

(assert (=> b!164655 (= e!108023 false)))

(declare-fun lt!82926 () Bool)

(declare-datatypes ((List!2019 0))(
  ( (Nil!2016) (Cons!2015 (h!2632 (_ BitVec 64)) (t!6821 List!2019)) )
))
(declare-fun arrayNoDuplicates!0 (array!6399 (_ BitVec 32) List!2019) Bool)

(assert (=> b!164655 (= lt!82926 (arrayNoDuplicates!0 (_keys!5203 thiss!1248) #b00000000000000000000000000000000 Nil!2016))))

(declare-fun res!77986 () Bool)

(assert (=> start!16544 (=> (not res!77986) (not e!108018))))

(declare-fun valid!834 (LongMapFixedSize!1872) Bool)

(assert (=> start!16544 (= res!77986 (valid!834 thiss!1248))))

(assert (=> start!16544 e!108018))

(assert (=> start!16544 e!108020))

(assert (=> start!16544 true))

(assert (= (and start!16544 res!77986) b!164647))

(assert (= (and b!164647 res!77990) b!164653))

(assert (= (and b!164653 res!77985) b!164654))

(assert (= (and b!164654 res!77989) b!164648))

(assert (= (and b!164648 res!77988) b!164649))

(assert (= (and b!164649 res!77987) b!164646))

(assert (= (and b!164646 res!77991) b!164655))

(assert (= (and b!164651 condMapEmpty!6195) mapIsEmpty!6195))

(assert (= (and b!164651 (not condMapEmpty!6195)) mapNonEmpty!6195))

(assert (= (and mapNonEmpty!6195 ((_ is ValueCellFull!1482) mapValue!6195)) b!164645))

(assert (= (and b!164651 ((_ is ValueCellFull!1482) mapDefault!6195)) b!164650))

(assert (= b!164652 b!164651))

(assert (= start!16544 b!164652))

(declare-fun m!194771 () Bool)

(assert (=> mapNonEmpty!6195 m!194771))

(declare-fun m!194773 () Bool)

(assert (=> b!164655 m!194773))

(declare-fun m!194775 () Bool)

(assert (=> b!164646 m!194775))

(declare-fun m!194777 () Bool)

(assert (=> b!164648 m!194777))

(declare-fun m!194779 () Bool)

(assert (=> start!16544 m!194779))

(declare-fun m!194781 () Bool)

(assert (=> b!164653 m!194781))

(declare-fun m!194783 () Bool)

(assert (=> b!164652 m!194783))

(declare-fun m!194785 () Bool)

(assert (=> b!164652 m!194785))

(declare-fun m!194787 () Bool)

(assert (=> b!164654 m!194787))

(assert (=> b!164654 m!194787))

(declare-fun m!194789 () Bool)

(assert (=> b!164654 m!194789))

(check-sat (not b!164655) (not start!16544) (not mapNonEmpty!6195) (not b!164648) tp_is_empty!3651 (not b!164652) (not b!164646) (not b!164653) (not b!164654) (not b_next!3849) b_and!10263)
(check-sat b_and!10263 (not b_next!3849))
