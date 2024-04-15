; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16240 () Bool)

(assert start!16240)

(declare-fun b!161830 () Bool)

(declare-fun b_free!3697 () Bool)

(declare-fun b_next!3697 () Bool)

(assert (=> b!161830 (= b_free!3697 (not b_next!3697))))

(declare-fun tp!13660 () Bool)

(declare-fun b_and!10085 () Bool)

(assert (=> b!161830 (= tp!13660 b_and!10085)))

(declare-fun b!161825 () Bool)

(declare-fun res!76637 () Bool)

(declare-fun e!105900 () Bool)

(assert (=> b!161825 (=> (not res!76637) (not e!105900))))

(declare-datatypes ((V!4313 0))(
  ( (V!4314 (val!1794 Int)) )
))
(declare-datatypes ((ValueCell!1406 0))(
  ( (ValueCellFull!1406 (v!3653 V!4313)) (EmptyCell!1406) )
))
(declare-datatypes ((array!6057 0))(
  ( (array!6058 (arr!2872 (Array (_ BitVec 32) (_ BitVec 64))) (size!3157 (_ BitVec 32))) )
))
(declare-datatypes ((array!6059 0))(
  ( (array!6060 (arr!2873 (Array (_ BitVec 32) ValueCell!1406)) (size!3158 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1720 0))(
  ( (LongMapFixedSize!1721 (defaultEntry!3302 Int) (mask!7909 (_ BitVec 32)) (extraKeys!3043 (_ BitVec 32)) (zeroValue!3145 V!4313) (minValue!3145 V!4313) (_size!909 (_ BitVec 32)) (_keys!5102 array!6057) (_values!3285 array!6059) (_vacant!909 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2958 0))(
  ( (tuple2!2959 (_1!1490 Bool) (_2!1490 LongMapFixedSize!1720)) )
))
(declare-fun lt!82155 () tuple2!2958)

(assert (=> b!161825 (= res!76637 (_1!1490 lt!82155))))

(declare-fun b!161826 () Bool)

(assert (=> b!161826 (= e!105900 false)))

(declare-fun lt!82153 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2960 0))(
  ( (tuple2!2961 (_1!1491 (_ BitVec 64)) (_2!1491 V!4313)) )
))
(declare-datatypes ((List!1987 0))(
  ( (Nil!1984) (Cons!1983 (h!2596 tuple2!2960) (t!6780 List!1987)) )
))
(declare-datatypes ((ListLongMap!1935 0))(
  ( (ListLongMap!1936 (toList!983 List!1987)) )
))
(declare-fun contains!1022 (ListLongMap!1935 (_ BitVec 64)) Bool)

(declare-fun map!1654 (LongMapFixedSize!1720) ListLongMap!1935)

(assert (=> b!161826 (= lt!82153 (contains!1022 (map!1654 (_2!1490 lt!82155)) key!828))))

(declare-fun b!161827 () Bool)

(declare-fun e!105901 () Bool)

(assert (=> b!161827 (= e!105901 e!105900)))

(declare-fun res!76640 () Bool)

(assert (=> b!161827 (=> (not res!76640) (not e!105900))))

(declare-fun valid!784 (LongMapFixedSize!1720) Bool)

(assert (=> b!161827 (= res!76640 (valid!784 (_2!1490 lt!82155)))))

(declare-datatypes ((SeekEntryResult!377 0))(
  ( (MissingZero!377 (index!3676 (_ BitVec 32))) (Found!377 (index!3677 (_ BitVec 32))) (Intermediate!377 (undefined!1189 Bool) (index!3678 (_ BitVec 32)) (x!17904 (_ BitVec 32))) (Undefined!377) (MissingVacant!377 (index!3679 (_ BitVec 32))) )
))
(declare-fun lt!82154 () SeekEntryResult!377)

(declare-fun v!309 () V!4313)

(declare-fun thiss!1248 () LongMapFixedSize!1720)

(declare-fun updateHelperNewKey!76 (LongMapFixedSize!1720 (_ BitVec 64) V!4313 (_ BitVec 32)) tuple2!2958)

(assert (=> b!161827 (= lt!82155 (updateHelperNewKey!76 thiss!1248 key!828 v!309 (index!3679 lt!82154)))))

(declare-fun b!161828 () Bool)

(declare-fun e!105899 () Bool)

(assert (=> b!161828 (= e!105899 e!105901)))

(declare-fun res!76638 () Bool)

(assert (=> b!161828 (=> (not res!76638) (not e!105901))))

(get-info :version)

(assert (=> b!161828 (= res!76638 (and (not ((_ is Undefined!377) lt!82154)) ((_ is MissingVacant!377) lt!82154)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6057 (_ BitVec 32)) SeekEntryResult!377)

(assert (=> b!161828 (= lt!82154 (seekEntryOrOpen!0 key!828 (_keys!5102 thiss!1248) (mask!7909 thiss!1248)))))

(declare-fun mapIsEmpty!5936 () Bool)

(declare-fun mapRes!5936 () Bool)

(assert (=> mapIsEmpty!5936 mapRes!5936))

(declare-fun e!105897 () Bool)

(declare-fun e!105898 () Bool)

(declare-fun tp_is_empty!3499 () Bool)

(declare-fun array_inv!1859 (array!6057) Bool)

(declare-fun array_inv!1860 (array!6059) Bool)

(assert (=> b!161830 (= e!105898 (and tp!13660 tp_is_empty!3499 (array_inv!1859 (_keys!5102 thiss!1248)) (array_inv!1860 (_values!3285 thiss!1248)) e!105897))))

(declare-fun b!161831 () Bool)

(declare-fun e!105894 () Bool)

(assert (=> b!161831 (= e!105897 (and e!105894 mapRes!5936))))

(declare-fun condMapEmpty!5936 () Bool)

(declare-fun mapDefault!5936 () ValueCell!1406)

(assert (=> b!161831 (= condMapEmpty!5936 (= (arr!2873 (_values!3285 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1406)) mapDefault!5936)))))

(declare-fun mapNonEmpty!5936 () Bool)

(declare-fun tp!13661 () Bool)

(declare-fun e!105895 () Bool)

(assert (=> mapNonEmpty!5936 (= mapRes!5936 (and tp!13661 e!105895))))

(declare-fun mapValue!5936 () ValueCell!1406)

(declare-fun mapRest!5936 () (Array (_ BitVec 32) ValueCell!1406))

(declare-fun mapKey!5936 () (_ BitVec 32))

(assert (=> mapNonEmpty!5936 (= (arr!2873 (_values!3285 thiss!1248)) (store mapRest!5936 mapKey!5936 mapValue!5936))))

(declare-fun b!161832 () Bool)

(declare-fun res!76639 () Bool)

(assert (=> b!161832 (=> (not res!76639) (not e!105899))))

(assert (=> b!161832 (= res!76639 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161833 () Bool)

(assert (=> b!161833 (= e!105894 tp_is_empty!3499)))

(declare-fun b!161829 () Bool)

(assert (=> b!161829 (= e!105895 tp_is_empty!3499)))

(declare-fun res!76641 () Bool)

(assert (=> start!16240 (=> (not res!76641) (not e!105899))))

(assert (=> start!16240 (= res!76641 (valid!784 thiss!1248))))

(assert (=> start!16240 e!105899))

(assert (=> start!16240 e!105898))

(assert (=> start!16240 true))

(assert (=> start!16240 tp_is_empty!3499))

(assert (= (and start!16240 res!76641) b!161832))

(assert (= (and b!161832 res!76639) b!161828))

(assert (= (and b!161828 res!76638) b!161827))

(assert (= (and b!161827 res!76640) b!161825))

(assert (= (and b!161825 res!76637) b!161826))

(assert (= (and b!161831 condMapEmpty!5936) mapIsEmpty!5936))

(assert (= (and b!161831 (not condMapEmpty!5936)) mapNonEmpty!5936))

(assert (= (and mapNonEmpty!5936 ((_ is ValueCellFull!1406) mapValue!5936)) b!161829))

(assert (= (and b!161831 ((_ is ValueCellFull!1406) mapDefault!5936)) b!161833))

(assert (= b!161830 b!161831))

(assert (= start!16240 b!161830))

(declare-fun m!192643 () Bool)

(assert (=> mapNonEmpty!5936 m!192643))

(declare-fun m!192645 () Bool)

(assert (=> b!161828 m!192645))

(declare-fun m!192647 () Bool)

(assert (=> b!161827 m!192647))

(declare-fun m!192649 () Bool)

(assert (=> b!161827 m!192649))

(declare-fun m!192651 () Bool)

(assert (=> start!16240 m!192651))

(declare-fun m!192653 () Bool)

(assert (=> b!161830 m!192653))

(declare-fun m!192655 () Bool)

(assert (=> b!161830 m!192655))

(declare-fun m!192657 () Bool)

(assert (=> b!161826 m!192657))

(assert (=> b!161826 m!192657))

(declare-fun m!192659 () Bool)

(assert (=> b!161826 m!192659))

(check-sat (not b!161828) tp_is_empty!3499 b_and!10085 (not b_next!3697) (not b!161826) (not b!161827) (not b!161830) (not start!16240) (not mapNonEmpty!5936))
(check-sat b_and!10085 (not b_next!3697))
