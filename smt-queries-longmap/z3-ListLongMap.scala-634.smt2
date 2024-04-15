; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16156 () Bool)

(assert start!16156)

(declare-fun b!160776 () Bool)

(declare-fun b_free!3613 () Bool)

(declare-fun b_next!3613 () Bool)

(assert (=> b!160776 (= b_free!3613 (not b_next!3613))))

(declare-fun tp!13408 () Bool)

(declare-fun b_and!10001 () Bool)

(assert (=> b!160776 (= tp!13408 b_and!10001)))

(declare-fun b!160767 () Bool)

(declare-fun res!76179 () Bool)

(declare-fun e!105066 () Bool)

(assert (=> b!160767 (=> (not res!76179) (not e!105066))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!160767 (= res!76179 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!5810 () Bool)

(declare-fun mapRes!5810 () Bool)

(declare-fun tp!13409 () Bool)

(declare-fun e!105065 () Bool)

(assert (=> mapNonEmpty!5810 (= mapRes!5810 (and tp!13409 e!105065))))

(declare-fun mapKey!5810 () (_ BitVec 32))

(declare-datatypes ((V!4201 0))(
  ( (V!4202 (val!1752 Int)) )
))
(declare-datatypes ((ValueCell!1364 0))(
  ( (ValueCellFull!1364 (v!3611 V!4201)) (EmptyCell!1364) )
))
(declare-fun mapValue!5810 () ValueCell!1364)

(declare-fun mapRest!5810 () (Array (_ BitVec 32) ValueCell!1364))

(declare-datatypes ((array!5889 0))(
  ( (array!5890 (arr!2788 (Array (_ BitVec 32) (_ BitVec 64))) (size!3073 (_ BitVec 32))) )
))
(declare-datatypes ((array!5891 0))(
  ( (array!5892 (arr!2789 (Array (_ BitVec 32) ValueCell!1364)) (size!3074 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1636 0))(
  ( (LongMapFixedSize!1637 (defaultEntry!3260 Int) (mask!7839 (_ BitVec 32)) (extraKeys!3001 (_ BitVec 32)) (zeroValue!3103 V!4201) (minValue!3103 V!4201) (_size!867 (_ BitVec 32)) (_keys!5060 array!5889) (_values!3243 array!5891) (_vacant!867 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1636)

(assert (=> mapNonEmpty!5810 (= (arr!2789 (_values!3243 thiss!1248)) (store mapRest!5810 mapKey!5810 mapValue!5810))))

(declare-fun b!160768 () Bool)

(declare-fun e!105062 () Bool)

(declare-fun e!105063 () Bool)

(assert (=> b!160768 (= e!105062 (and e!105063 mapRes!5810))))

(declare-fun condMapEmpty!5810 () Bool)

(declare-fun mapDefault!5810 () ValueCell!1364)

(assert (=> b!160768 (= condMapEmpty!5810 (= (arr!2789 (_values!3243 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1364)) mapDefault!5810)))))

(declare-fun b!160769 () Bool)

(declare-fun res!76173 () Bool)

(assert (=> b!160769 (=> (not res!76173) (not e!105066))))

(declare-datatypes ((tuple2!2912 0))(
  ( (tuple2!2913 (_1!1467 (_ BitVec 64)) (_2!1467 V!4201)) )
))
(declare-datatypes ((List!1962 0))(
  ( (Nil!1959) (Cons!1958 (h!2571 tuple2!2912) (t!6755 List!1962)) )
))
(declare-datatypes ((ListLongMap!1899 0))(
  ( (ListLongMap!1900 (toList!965 List!1962)) )
))
(declare-fun contains!1004 (ListLongMap!1899 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!615 (array!5889 array!5891 (_ BitVec 32) (_ BitVec 32) V!4201 V!4201 (_ BitVec 32) Int) ListLongMap!1899)

(assert (=> b!160769 (= res!76173 (not (contains!1004 (getCurrentListMap!615 (_keys!5060 thiss!1248) (_values!3243 thiss!1248) (mask!7839 thiss!1248) (extraKeys!3001 thiss!1248) (zeroValue!3103 thiss!1248) (minValue!3103 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3260 thiss!1248)) key!828)))))

(declare-fun b!160770 () Bool)

(declare-fun res!76178 () Bool)

(assert (=> b!160770 (=> (not res!76178) (not e!105066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160770 (= res!76178 (validMask!0 (mask!7839 thiss!1248)))))

(declare-fun res!76175 () Bool)

(assert (=> start!16156 (=> (not res!76175) (not e!105066))))

(declare-fun valid!756 (LongMapFixedSize!1636) Bool)

(assert (=> start!16156 (= res!76175 (valid!756 thiss!1248))))

(assert (=> start!16156 e!105066))

(declare-fun e!105067 () Bool)

(assert (=> start!16156 e!105067))

(assert (=> start!16156 true))

(declare-fun b!160771 () Bool)

(declare-fun tp_is_empty!3415 () Bool)

(assert (=> b!160771 (= e!105063 tp_is_empty!3415)))

(declare-fun b!160772 () Bool)

(declare-fun res!76174 () Bool)

(assert (=> b!160772 (=> (not res!76174) (not e!105066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5889 (_ BitVec 32)) Bool)

(assert (=> b!160772 (= res!76174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5060 thiss!1248) (mask!7839 thiss!1248)))))

(declare-fun b!160773 () Bool)

(declare-fun res!76177 () Bool)

(assert (=> b!160773 (=> (not res!76177) (not e!105066))))

(assert (=> b!160773 (= res!76177 (and (= (size!3074 (_values!3243 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7839 thiss!1248))) (= (size!3073 (_keys!5060 thiss!1248)) (size!3074 (_values!3243 thiss!1248))) (bvsge (mask!7839 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3001 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3001 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160774 () Bool)

(declare-fun res!76176 () Bool)

(assert (=> b!160774 (=> (not res!76176) (not e!105066))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!349 0))(
  ( (MissingZero!349 (index!3564 (_ BitVec 32))) (Found!349 (index!3565 (_ BitVec 32))) (Intermediate!349 (undefined!1161 Bool) (index!3566 (_ BitVec 32)) (x!17764 (_ BitVec 32))) (Undefined!349) (MissingVacant!349 (index!3567 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5889 (_ BitVec 32)) SeekEntryResult!349)

(assert (=> b!160774 (= res!76176 ((_ is Undefined!349) (seekEntryOrOpen!0 key!828 (_keys!5060 thiss!1248) (mask!7839 thiss!1248))))))

(declare-fun b!160775 () Bool)

(assert (=> b!160775 (= e!105065 tp_is_empty!3415)))

(declare-fun mapIsEmpty!5810 () Bool)

(assert (=> mapIsEmpty!5810 mapRes!5810))

(declare-fun array_inv!1795 (array!5889) Bool)

(declare-fun array_inv!1796 (array!5891) Bool)

(assert (=> b!160776 (= e!105067 (and tp!13408 tp_is_empty!3415 (array_inv!1795 (_keys!5060 thiss!1248)) (array_inv!1796 (_values!3243 thiss!1248)) e!105062))))

(declare-fun b!160777 () Bool)

(assert (=> b!160777 (= e!105066 false)))

(declare-fun lt!81951 () Bool)

(declare-datatypes ((List!1963 0))(
  ( (Nil!1960) (Cons!1959 (h!2572 (_ BitVec 64)) (t!6756 List!1963)) )
))
(declare-fun arrayNoDuplicates!0 (array!5889 (_ BitVec 32) List!1963) Bool)

(assert (=> b!160777 (= lt!81951 (arrayNoDuplicates!0 (_keys!5060 thiss!1248) #b00000000000000000000000000000000 Nil!1960))))

(assert (= (and start!16156 res!76175) b!160767))

(assert (= (and b!160767 res!76179) b!160774))

(assert (= (and b!160774 res!76176) b!160769))

(assert (= (and b!160769 res!76173) b!160770))

(assert (= (and b!160770 res!76178) b!160773))

(assert (= (and b!160773 res!76177) b!160772))

(assert (= (and b!160772 res!76174) b!160777))

(assert (= (and b!160768 condMapEmpty!5810) mapIsEmpty!5810))

(assert (= (and b!160768 (not condMapEmpty!5810)) mapNonEmpty!5810))

(assert (= (and mapNonEmpty!5810 ((_ is ValueCellFull!1364) mapValue!5810)) b!160775))

(assert (= (and b!160768 ((_ is ValueCellFull!1364) mapDefault!5810)) b!160771))

(assert (= b!160776 b!160768))

(assert (= start!16156 b!160776))

(declare-fun m!191977 () Bool)

(assert (=> b!160772 m!191977))

(declare-fun m!191979 () Bool)

(assert (=> b!160776 m!191979))

(declare-fun m!191981 () Bool)

(assert (=> b!160776 m!191981))

(declare-fun m!191983 () Bool)

(assert (=> b!160769 m!191983))

(assert (=> b!160769 m!191983))

(declare-fun m!191985 () Bool)

(assert (=> b!160769 m!191985))

(declare-fun m!191987 () Bool)

(assert (=> mapNonEmpty!5810 m!191987))

(declare-fun m!191989 () Bool)

(assert (=> b!160770 m!191989))

(declare-fun m!191991 () Bool)

(assert (=> b!160774 m!191991))

(declare-fun m!191993 () Bool)

(assert (=> start!16156 m!191993))

(declare-fun m!191995 () Bool)

(assert (=> b!160777 m!191995))

(check-sat (not b!160777) (not mapNonEmpty!5810) (not b!160774) (not b!160772) (not b!160776) (not start!16156) (not b!160769) b_and!10001 (not b_next!3613) (not b!160770) tp_is_empty!3415)
(check-sat b_and!10001 (not b_next!3613))
