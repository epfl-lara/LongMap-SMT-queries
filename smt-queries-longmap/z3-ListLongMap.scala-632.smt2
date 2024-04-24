; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16144 () Bool)

(assert start!16144)

(declare-fun b!160767 () Bool)

(declare-fun b_free!3601 () Bool)

(declare-fun b_next!3601 () Bool)

(assert (=> b!160767 (= b_free!3601 (not b_next!3601))))

(declare-fun tp!13372 () Bool)

(declare-fun b_and!10029 () Bool)

(assert (=> b!160767 (= tp!13372 b_and!10029)))

(declare-fun b!160763 () Bool)

(declare-fun res!76165 () Bool)

(declare-fun e!105079 () Bool)

(assert (=> b!160763 (=> (not res!76165) (not e!105079))))

(declare-datatypes ((V!4185 0))(
  ( (V!4186 (val!1746 Int)) )
))
(declare-datatypes ((ValueCell!1358 0))(
  ( (ValueCellFull!1358 (v!3612 V!4185)) (EmptyCell!1358) )
))
(declare-datatypes ((array!5871 0))(
  ( (array!5872 (arr!2780 (Array (_ BitVec 32) (_ BitVec 64))) (size!3064 (_ BitVec 32))) )
))
(declare-datatypes ((array!5873 0))(
  ( (array!5874 (arr!2781 (Array (_ BitVec 32) ValueCell!1358)) (size!3065 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1624 0))(
  ( (LongMapFixedSize!1625 (defaultEntry!3254 Int) (mask!7830 (_ BitVec 32)) (extraKeys!2995 (_ BitVec 32)) (zeroValue!3097 V!4185) (minValue!3097 V!4185) (_size!861 (_ BitVec 32)) (_keys!5055 array!5871) (_values!3237 array!5873) (_vacant!861 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1624)

(assert (=> b!160763 (= res!76165 (and (= (size!3065 (_values!3237 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7830 thiss!1248))) (= (size!3064 (_keys!5055 thiss!1248)) (size!3065 (_values!3237 thiss!1248))) (bvsge (mask!7830 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2995 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2995 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160764 () Bool)

(declare-fun res!76168 () Bool)

(assert (=> b!160764 (=> (not res!76168) (not e!105079))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!330 0))(
  ( (MissingZero!330 (index!3488 (_ BitVec 32))) (Found!330 (index!3489 (_ BitVec 32))) (Intermediate!330 (undefined!1142 Bool) (index!3490 (_ BitVec 32)) (x!17730 (_ BitVec 32))) (Undefined!330) (MissingVacant!330 (index!3491 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5871 (_ BitVec 32)) SeekEntryResult!330)

(assert (=> b!160764 (= res!76168 ((_ is Undefined!330) (seekEntryOrOpen!0 key!828 (_keys!5055 thiss!1248) (mask!7830 thiss!1248))))))

(declare-fun b!160765 () Bool)

(declare-fun res!76163 () Bool)

(assert (=> b!160765 (=> (not res!76163) (not e!105079))))

(declare-datatypes ((tuple2!2882 0))(
  ( (tuple2!2883 (_1!1452 (_ BitVec 64)) (_2!1452 V!4185)) )
))
(declare-datatypes ((List!1945 0))(
  ( (Nil!1942) (Cons!1941 (h!2554 tuple2!2882) (t!6739 List!1945)) )
))
(declare-datatypes ((ListLongMap!1881 0))(
  ( (ListLongMap!1882 (toList!956 List!1945)) )
))
(declare-fun contains!1002 (ListLongMap!1881 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!623 (array!5871 array!5873 (_ BitVec 32) (_ BitVec 32) V!4185 V!4185 (_ BitVec 32) Int) ListLongMap!1881)

(assert (=> b!160765 (= res!76163 (not (contains!1002 (getCurrentListMap!623 (_keys!5055 thiss!1248) (_values!3237 thiss!1248) (mask!7830 thiss!1248) (extraKeys!2995 thiss!1248) (zeroValue!3097 thiss!1248) (minValue!3097 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3254 thiss!1248)) key!828)))))

(declare-fun b!160766 () Bool)

(declare-fun res!76166 () Bool)

(assert (=> b!160766 (=> (not res!76166) (not e!105079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160766 (= res!76166 (validMask!0 (mask!7830 thiss!1248)))))

(declare-fun mapIsEmpty!5792 () Bool)

(declare-fun mapRes!5792 () Bool)

(assert (=> mapIsEmpty!5792 mapRes!5792))

(declare-fun tp_is_empty!3403 () Bool)

(declare-fun e!105084 () Bool)

(declare-fun e!105081 () Bool)

(declare-fun array_inv!1777 (array!5871) Bool)

(declare-fun array_inv!1778 (array!5873) Bool)

(assert (=> b!160767 (= e!105084 (and tp!13372 tp_is_empty!3403 (array_inv!1777 (_keys!5055 thiss!1248)) (array_inv!1778 (_values!3237 thiss!1248)) e!105081))))

(declare-fun b!160768 () Bool)

(declare-fun e!105080 () Bool)

(assert (=> b!160768 (= e!105081 (and e!105080 mapRes!5792))))

(declare-fun condMapEmpty!5792 () Bool)

(declare-fun mapDefault!5792 () ValueCell!1358)

(assert (=> b!160768 (= condMapEmpty!5792 (= (arr!2781 (_values!3237 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1358)) mapDefault!5792)))))

(declare-fun mapNonEmpty!5792 () Bool)

(declare-fun tp!13373 () Bool)

(declare-fun e!105083 () Bool)

(assert (=> mapNonEmpty!5792 (= mapRes!5792 (and tp!13373 e!105083))))

(declare-fun mapKey!5792 () (_ BitVec 32))

(declare-fun mapRest!5792 () (Array (_ BitVec 32) ValueCell!1358))

(declare-fun mapValue!5792 () ValueCell!1358)

(assert (=> mapNonEmpty!5792 (= (arr!2781 (_values!3237 thiss!1248)) (store mapRest!5792 mapKey!5792 mapValue!5792))))

(declare-fun b!160769 () Bool)

(assert (=> b!160769 (= e!105083 tp_is_empty!3403)))

(declare-fun res!76164 () Bool)

(assert (=> start!16144 (=> (not res!76164) (not e!105079))))

(declare-fun valid!770 (LongMapFixedSize!1624) Bool)

(assert (=> start!16144 (= res!76164 (valid!770 thiss!1248))))

(assert (=> start!16144 e!105079))

(assert (=> start!16144 e!105084))

(assert (=> start!16144 true))

(declare-fun b!160770 () Bool)

(assert (=> b!160770 (= e!105080 tp_is_empty!3403)))

(declare-fun b!160771 () Bool)

(declare-fun res!76169 () Bool)

(assert (=> b!160771 (=> (not res!76169) (not e!105079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5871 (_ BitVec 32)) Bool)

(assert (=> b!160771 (= res!76169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5055 thiss!1248) (mask!7830 thiss!1248)))))

(declare-fun b!160772 () Bool)

(assert (=> b!160772 (= e!105079 false)))

(declare-fun lt!82173 () Bool)

(declare-datatypes ((List!1946 0))(
  ( (Nil!1943) (Cons!1942 (h!2555 (_ BitVec 64)) (t!6740 List!1946)) )
))
(declare-fun arrayNoDuplicates!0 (array!5871 (_ BitVec 32) List!1946) Bool)

(assert (=> b!160772 (= lt!82173 (arrayNoDuplicates!0 (_keys!5055 thiss!1248) #b00000000000000000000000000000000 Nil!1943))))

(declare-fun b!160773 () Bool)

(declare-fun res!76167 () Bool)

(assert (=> b!160773 (=> (not res!76167) (not e!105079))))

(assert (=> b!160773 (= res!76167 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!16144 res!76164) b!160773))

(assert (= (and b!160773 res!76167) b!160764))

(assert (= (and b!160764 res!76168) b!160765))

(assert (= (and b!160765 res!76163) b!160766))

(assert (= (and b!160766 res!76166) b!160763))

(assert (= (and b!160763 res!76165) b!160771))

(assert (= (and b!160771 res!76169) b!160772))

(assert (= (and b!160768 condMapEmpty!5792) mapIsEmpty!5792))

(assert (= (and b!160768 (not condMapEmpty!5792)) mapNonEmpty!5792))

(assert (= (and mapNonEmpty!5792 ((_ is ValueCellFull!1358) mapValue!5792)) b!160769))

(assert (= (and b!160768 ((_ is ValueCellFull!1358) mapDefault!5792)) b!160770))

(assert (= b!160767 b!160768))

(assert (= start!16144 b!160767))

(declare-fun m!192659 () Bool)

(assert (=> b!160766 m!192659))

(declare-fun m!192661 () Bool)

(assert (=> mapNonEmpty!5792 m!192661))

(declare-fun m!192663 () Bool)

(assert (=> start!16144 m!192663))

(declare-fun m!192665 () Bool)

(assert (=> b!160772 m!192665))

(declare-fun m!192667 () Bool)

(assert (=> b!160767 m!192667))

(declare-fun m!192669 () Bool)

(assert (=> b!160767 m!192669))

(declare-fun m!192671 () Bool)

(assert (=> b!160764 m!192671))

(declare-fun m!192673 () Bool)

(assert (=> b!160771 m!192673))

(declare-fun m!192675 () Bool)

(assert (=> b!160765 m!192675))

(assert (=> b!160765 m!192675))

(declare-fun m!192677 () Bool)

(assert (=> b!160765 m!192677))

(check-sat (not b_next!3601) (not b!160771) (not mapNonEmpty!5792) b_and!10029 (not b!160766) (not b!160767) (not b!160764) tp_is_empty!3403 (not start!16144) (not b!160765) (not b!160772))
(check-sat b_and!10029 (not b_next!3601))
