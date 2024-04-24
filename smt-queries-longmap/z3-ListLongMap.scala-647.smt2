; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16234 () Bool)

(assert start!16234)

(declare-fun b!161946 () Bool)

(declare-fun b_free!3691 () Bool)

(declare-fun b_next!3691 () Bool)

(assert (=> b!161946 (= b_free!3691 (not b_next!3691))))

(declare-fun tp!13643 () Bool)

(declare-fun b_and!10119 () Bool)

(assert (=> b!161946 (= tp!13643 b_and!10119)))

(declare-fun b!161938 () Bool)

(declare-fun e!105954 () Bool)

(declare-fun e!105947 () Bool)

(assert (=> b!161938 (= e!105954 e!105947)))

(declare-fun res!76709 () Bool)

(assert (=> b!161938 (=> (not res!76709) (not e!105947))))

(declare-datatypes ((SeekEntryResult!362 0))(
  ( (MissingZero!362 (index!3616 (_ BitVec 32))) (Found!362 (index!3617 (_ BitVec 32))) (Intermediate!362 (undefined!1174 Bool) (index!3618 (_ BitVec 32)) (x!17882 (_ BitVec 32))) (Undefined!362) (MissingVacant!362 (index!3619 (_ BitVec 32))) )
))
(declare-fun lt!82366 () SeekEntryResult!362)

(get-info :version)

(assert (=> b!161938 (= res!76709 (and (not ((_ is Undefined!362) lt!82366)) ((_ is MissingVacant!362) lt!82366)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4305 0))(
  ( (V!4306 (val!1791 Int)) )
))
(declare-datatypes ((ValueCell!1403 0))(
  ( (ValueCellFull!1403 (v!3657 V!4305)) (EmptyCell!1403) )
))
(declare-datatypes ((array!6051 0))(
  ( (array!6052 (arr!2870 (Array (_ BitVec 32) (_ BitVec 64))) (size!3154 (_ BitVec 32))) )
))
(declare-datatypes ((array!6053 0))(
  ( (array!6054 (arr!2871 (Array (_ BitVec 32) ValueCell!1403)) (size!3155 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1714 0))(
  ( (LongMapFixedSize!1715 (defaultEntry!3299 Int) (mask!7905 (_ BitVec 32)) (extraKeys!3040 (_ BitVec 32)) (zeroValue!3142 V!4305) (minValue!3142 V!4305) (_size!906 (_ BitVec 32)) (_keys!5100 array!6051) (_values!3282 array!6053) (_vacant!906 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1714)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6051 (_ BitVec 32)) SeekEntryResult!362)

(assert (=> b!161938 (= lt!82366 (seekEntryOrOpen!0 key!828 (_keys!5100 thiss!1248) (mask!7905 thiss!1248)))))

(declare-fun b!161939 () Bool)

(declare-fun e!105948 () Bool)

(declare-fun e!105953 () Bool)

(declare-fun mapRes!5927 () Bool)

(assert (=> b!161939 (= e!105948 (and e!105953 mapRes!5927))))

(declare-fun condMapEmpty!5927 () Bool)

(declare-fun mapDefault!5927 () ValueCell!1403)

(assert (=> b!161939 (= condMapEmpty!5927 (= (arr!2871 (_values!3282 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1403)) mapDefault!5927)))))

(declare-fun b!161940 () Bool)

(declare-fun e!105950 () Bool)

(declare-fun tp_is_empty!3493 () Bool)

(assert (=> b!161940 (= e!105950 tp_is_empty!3493)))

(declare-fun b!161941 () Bool)

(declare-fun e!105951 () Bool)

(assert (=> b!161941 (= e!105951 false)))

(declare-fun lt!82367 () Bool)

(declare-datatypes ((tuple2!2928 0))(
  ( (tuple2!2929 (_1!1475 Bool) (_2!1475 LongMapFixedSize!1714)) )
))
(declare-fun lt!82368 () tuple2!2928)

(declare-datatypes ((tuple2!2930 0))(
  ( (tuple2!2931 (_1!1476 (_ BitVec 64)) (_2!1476 V!4305)) )
))
(declare-datatypes ((List!1978 0))(
  ( (Nil!1975) (Cons!1974 (h!2587 tuple2!2930) (t!6772 List!1978)) )
))
(declare-datatypes ((ListLongMap!1923 0))(
  ( (ListLongMap!1924 (toList!977 List!1978)) )
))
(declare-fun contains!1023 (ListLongMap!1923 (_ BitVec 64)) Bool)

(declare-fun map!1663 (LongMapFixedSize!1714) ListLongMap!1923)

(assert (=> b!161941 (= lt!82367 (contains!1023 (map!1663 (_2!1475 lt!82368)) key!828))))

(declare-fun mapNonEmpty!5927 () Bool)

(declare-fun tp!13642 () Bool)

(assert (=> mapNonEmpty!5927 (= mapRes!5927 (and tp!13642 e!105950))))

(declare-fun mapKey!5927 () (_ BitVec 32))

(declare-fun mapValue!5927 () ValueCell!1403)

(declare-fun mapRest!5927 () (Array (_ BitVec 32) ValueCell!1403))

(assert (=> mapNonEmpty!5927 (= (arr!2871 (_values!3282 thiss!1248)) (store mapRest!5927 mapKey!5927 mapValue!5927))))

(declare-fun b!161942 () Bool)

(assert (=> b!161942 (= e!105947 e!105951)))

(declare-fun res!76710 () Bool)

(assert (=> b!161942 (=> (not res!76710) (not e!105951))))

(declare-fun valid!800 (LongMapFixedSize!1714) Bool)

(assert (=> b!161942 (= res!76710 (valid!800 (_2!1475 lt!82368)))))

(declare-fun v!309 () V!4305)

(declare-fun updateHelperNewKey!74 (LongMapFixedSize!1714 (_ BitVec 64) V!4305 (_ BitVec 32)) tuple2!2928)

(assert (=> b!161942 (= lt!82368 (updateHelperNewKey!74 thiss!1248 key!828 v!309 (index!3619 lt!82366)))))

(declare-fun b!161943 () Bool)

(assert (=> b!161943 (= e!105953 tp_is_empty!3493)))

(declare-fun res!76711 () Bool)

(assert (=> start!16234 (=> (not res!76711) (not e!105954))))

(assert (=> start!16234 (= res!76711 (valid!800 thiss!1248))))

(assert (=> start!16234 e!105954))

(declare-fun e!105949 () Bool)

(assert (=> start!16234 e!105949))

(assert (=> start!16234 true))

(assert (=> start!16234 tp_is_empty!3493))

(declare-fun b!161944 () Bool)

(declare-fun res!76712 () Bool)

(assert (=> b!161944 (=> (not res!76712) (not e!105951))))

(assert (=> b!161944 (= res!76712 (_1!1475 lt!82368))))

(declare-fun mapIsEmpty!5927 () Bool)

(assert (=> mapIsEmpty!5927 mapRes!5927))

(declare-fun b!161945 () Bool)

(declare-fun res!76708 () Bool)

(assert (=> b!161945 (=> (not res!76708) (not e!105954))))

(assert (=> b!161945 (= res!76708 (not (= key!828 (bvneg key!828))))))

(declare-fun array_inv!1839 (array!6051) Bool)

(declare-fun array_inv!1840 (array!6053) Bool)

(assert (=> b!161946 (= e!105949 (and tp!13643 tp_is_empty!3493 (array_inv!1839 (_keys!5100 thiss!1248)) (array_inv!1840 (_values!3282 thiss!1248)) e!105948))))

(assert (= (and start!16234 res!76711) b!161945))

(assert (= (and b!161945 res!76708) b!161938))

(assert (= (and b!161938 res!76709) b!161942))

(assert (= (and b!161942 res!76710) b!161944))

(assert (= (and b!161944 res!76712) b!161941))

(assert (= (and b!161939 condMapEmpty!5927) mapIsEmpty!5927))

(assert (= (and b!161939 (not condMapEmpty!5927)) mapNonEmpty!5927))

(assert (= (and mapNonEmpty!5927 ((_ is ValueCellFull!1403) mapValue!5927)) b!161940))

(assert (= (and b!161939 ((_ is ValueCellFull!1403) mapDefault!5927)) b!161943))

(assert (= b!161946 b!161939))

(assert (= start!16234 b!161946))

(declare-fun m!193391 () Bool)

(assert (=> mapNonEmpty!5927 m!193391))

(declare-fun m!193393 () Bool)

(assert (=> b!161946 m!193393))

(declare-fun m!193395 () Bool)

(assert (=> b!161946 m!193395))

(declare-fun m!193397 () Bool)

(assert (=> b!161938 m!193397))

(declare-fun m!193399 () Bool)

(assert (=> start!16234 m!193399))

(declare-fun m!193401 () Bool)

(assert (=> b!161941 m!193401))

(assert (=> b!161941 m!193401))

(declare-fun m!193403 () Bool)

(assert (=> b!161941 m!193403))

(declare-fun m!193405 () Bool)

(assert (=> b!161942 m!193405))

(declare-fun m!193407 () Bool)

(assert (=> b!161942 m!193407))

(check-sat (not b!161938) (not b!161941) tp_is_empty!3493 (not b!161942) b_and!10119 (not start!16234) (not b_next!3691) (not b!161946) (not mapNonEmpty!5927))
(check-sat b_and!10119 (not b_next!3691))
