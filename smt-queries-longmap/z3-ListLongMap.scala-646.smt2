; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16226 () Bool)

(assert start!16226)

(declare-fun b!161848 () Bool)

(declare-fun b_free!3687 () Bool)

(declare-fun b_next!3687 () Bool)

(assert (=> b!161848 (= b_free!3687 (not b_next!3687))))

(declare-fun tp!13631 () Bool)

(declare-fun b_and!10101 () Bool)

(assert (=> b!161848 (= tp!13631 b_and!10101)))

(declare-fun b!161845 () Bool)

(declare-fun e!105885 () Bool)

(declare-fun tp_is_empty!3489 () Bool)

(assert (=> b!161845 (= e!105885 tp_is_empty!3489)))

(declare-fun b!161846 () Bool)

(declare-fun e!105879 () Bool)

(assert (=> b!161846 (= e!105879 false)))

(declare-fun lt!82293 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4299 0))(
  ( (V!4300 (val!1789 Int)) )
))
(declare-fun v!309 () V!4299)

(declare-datatypes ((ValueCell!1401 0))(
  ( (ValueCellFull!1401 (v!3654 V!4299)) (EmptyCell!1401) )
))
(declare-datatypes ((array!6057 0))(
  ( (array!6058 (arr!2873 (Array (_ BitVec 32) (_ BitVec 64))) (size!3157 (_ BitVec 32))) )
))
(declare-datatypes ((array!6059 0))(
  ( (array!6060 (arr!2874 (Array (_ BitVec 32) ValueCell!1401)) (size!3158 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1710 0))(
  ( (LongMapFixedSize!1711 (defaultEntry!3297 Int) (mask!7901 (_ BitVec 32)) (extraKeys!3038 (_ BitVec 32)) (zeroValue!3140 V!4299) (minValue!3140 V!4299) (_size!904 (_ BitVec 32)) (_keys!5098 array!6057) (_values!3280 array!6059) (_vacant!904 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1710)

(declare-datatypes ((SeekEntryResult!364 0))(
  ( (MissingZero!364 (index!3624 (_ BitVec 32))) (Found!364 (index!3625 (_ BitVec 32))) (Intermediate!364 (undefined!1176 Bool) (index!3626 (_ BitVec 32)) (x!17876 (_ BitVec 32))) (Undefined!364) (MissingVacant!364 (index!3627 (_ BitVec 32))) )
))
(declare-fun lt!82294 () SeekEntryResult!364)

(declare-fun valid!778 (LongMapFixedSize!1710) Bool)

(declare-datatypes ((tuple2!2970 0))(
  ( (tuple2!2971 (_1!1496 Bool) (_2!1496 LongMapFixedSize!1710)) )
))
(declare-fun updateHelperNewKey!72 (LongMapFixedSize!1710 (_ BitVec 64) V!4299 (_ BitVec 32)) tuple2!2970)

(assert (=> b!161846 (= lt!82293 (valid!778 (_2!1496 (updateHelperNewKey!72 thiss!1248 key!828 v!309 (index!3627 lt!82294)))))))

(declare-fun b!161847 () Bool)

(declare-fun e!105884 () Bool)

(assert (=> b!161847 (= e!105884 tp_is_empty!3489)))

(declare-fun e!105883 () Bool)

(declare-fun e!105882 () Bool)

(declare-fun array_inv!1839 (array!6057) Bool)

(declare-fun array_inv!1840 (array!6059) Bool)

(assert (=> b!161848 (= e!105882 (and tp!13631 tp_is_empty!3489 (array_inv!1839 (_keys!5098 thiss!1248)) (array_inv!1840 (_values!3280 thiss!1248)) e!105883))))

(declare-fun b!161849 () Bool)

(declare-fun mapRes!5921 () Bool)

(assert (=> b!161849 (= e!105883 (and e!105884 mapRes!5921))))

(declare-fun condMapEmpty!5921 () Bool)

(declare-fun mapDefault!5921 () ValueCell!1401)

(assert (=> b!161849 (= condMapEmpty!5921 (= (arr!2874 (_values!3280 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1401)) mapDefault!5921)))))

(declare-fun res!76665 () Bool)

(declare-fun e!105881 () Bool)

(assert (=> start!16226 (=> (not res!76665) (not e!105881))))

(assert (=> start!16226 (= res!76665 (valid!778 thiss!1248))))

(assert (=> start!16226 e!105881))

(assert (=> start!16226 e!105882))

(assert (=> start!16226 true))

(assert (=> start!16226 tp_is_empty!3489))

(declare-fun b!161850 () Bool)

(assert (=> b!161850 (= e!105881 e!105879)))

(declare-fun res!76666 () Bool)

(assert (=> b!161850 (=> (not res!76666) (not e!105879))))

(get-info :version)

(assert (=> b!161850 (= res!76666 (and (not ((_ is Undefined!364) lt!82294)) ((_ is MissingVacant!364) lt!82294)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6057 (_ BitVec 32)) SeekEntryResult!364)

(assert (=> b!161850 (= lt!82294 (seekEntryOrOpen!0 key!828 (_keys!5098 thiss!1248) (mask!7901 thiss!1248)))))

(declare-fun mapIsEmpty!5921 () Bool)

(assert (=> mapIsEmpty!5921 mapRes!5921))

(declare-fun mapNonEmpty!5921 () Bool)

(declare-fun tp!13630 () Bool)

(assert (=> mapNonEmpty!5921 (= mapRes!5921 (and tp!13630 e!105885))))

(declare-fun mapRest!5921 () (Array (_ BitVec 32) ValueCell!1401))

(declare-fun mapValue!5921 () ValueCell!1401)

(declare-fun mapKey!5921 () (_ BitVec 32))

(assert (=> mapNonEmpty!5921 (= (arr!2874 (_values!3280 thiss!1248)) (store mapRest!5921 mapKey!5921 mapValue!5921))))

(declare-fun b!161851 () Bool)

(declare-fun res!76667 () Bool)

(assert (=> b!161851 (=> (not res!76667) (not e!105881))))

(assert (=> b!161851 (= res!76667 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!16226 res!76665) b!161851))

(assert (= (and b!161851 res!76667) b!161850))

(assert (= (and b!161850 res!76666) b!161846))

(assert (= (and b!161849 condMapEmpty!5921) mapIsEmpty!5921))

(assert (= (and b!161849 (not condMapEmpty!5921)) mapNonEmpty!5921))

(assert (= (and mapNonEmpty!5921 ((_ is ValueCellFull!1401) mapValue!5921)) b!161845))

(assert (= (and b!161849 ((_ is ValueCellFull!1401) mapDefault!5921)) b!161847))

(assert (= b!161848 b!161849))

(assert (= start!16226 b!161848))

(declare-fun m!193181 () Bool)

(assert (=> mapNonEmpty!5921 m!193181))

(declare-fun m!193183 () Bool)

(assert (=> b!161846 m!193183))

(declare-fun m!193185 () Bool)

(assert (=> b!161846 m!193185))

(declare-fun m!193187 () Bool)

(assert (=> b!161848 m!193187))

(declare-fun m!193189 () Bool)

(assert (=> b!161848 m!193189))

(declare-fun m!193191 () Bool)

(assert (=> b!161850 m!193191))

(declare-fun m!193193 () Bool)

(assert (=> start!16226 m!193193))

(check-sat (not b_next!3687) (not start!16226) (not b!161848) b_and!10101 tp_is_empty!3489 (not b!161846) (not mapNonEmpty!5921) (not b!161850))
(check-sat b_and!10101 (not b_next!3687))
