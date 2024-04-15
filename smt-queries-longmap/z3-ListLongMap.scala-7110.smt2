; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90104 () Bool)

(assert start!90104)

(declare-fun b!1032095 () Bool)

(declare-fun b_free!20713 () Bool)

(declare-fun b_next!20713 () Bool)

(assert (=> b!1032095 (= b_free!20713 (not b_next!20713))))

(declare-fun tp!73209 () Bool)

(declare-fun b_and!33155 () Bool)

(assert (=> b!1032095 (= tp!73209 b_and!33155)))

(declare-fun mapIsEmpty!38103 () Bool)

(declare-fun mapRes!38103 () Bool)

(assert (=> mapIsEmpty!38103 mapRes!38103))

(declare-fun mapNonEmpty!38103 () Bool)

(declare-fun tp!73210 () Bool)

(declare-fun e!583107 () Bool)

(assert (=> mapNonEmpty!38103 (= mapRes!38103 (and tp!73210 e!583107))))

(declare-datatypes ((V!37451 0))(
  ( (V!37452 (val!12267 Int)) )
))
(declare-datatypes ((ValueCell!11513 0))(
  ( (ValueCellFull!11513 (v!14843 V!37451)) (EmptyCell!11513) )
))
(declare-fun mapValue!38103 () ValueCell!11513)

(declare-datatypes ((array!64869 0))(
  ( (array!64870 (arr!31236 (Array (_ BitVec 32) (_ BitVec 64))) (size!31755 (_ BitVec 32))) )
))
(declare-datatypes ((array!64871 0))(
  ( (array!64872 (arr!31237 (Array (_ BitVec 32) ValueCell!11513)) (size!31756 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5620 0))(
  ( (LongMapFixedSize!5621 (defaultEntry!6184 Int) (mask!29993 (_ BitVec 32)) (extraKeys!5916 (_ BitVec 32)) (zeroValue!6020 V!37451) (minValue!6020 V!37451) (_size!2865 (_ BitVec 32)) (_keys!11353 array!64869) (_values!6207 array!64871) (_vacant!2865 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5620)

(declare-fun mapKey!38103 () (_ BitVec 32))

(declare-fun mapRest!38103 () (Array (_ BitVec 32) ValueCell!11513))

(assert (=> mapNonEmpty!38103 (= (arr!31237 (_values!6207 thiss!1427)) (store mapRest!38103 mapKey!38103 mapValue!38103))))

(declare-fun tp_is_empty!24433 () Bool)

(declare-fun e!583110 () Bool)

(declare-fun e!583112 () Bool)

(declare-fun array_inv!24173 (array!64869) Bool)

(declare-fun array_inv!24174 (array!64871) Bool)

(assert (=> b!1032095 (= e!583110 (and tp!73209 tp_is_empty!24433 (array_inv!24173 (_keys!11353 thiss!1427)) (array_inv!24174 (_values!6207 thiss!1427)) e!583112))))

(declare-fun b!1032096 () Bool)

(declare-fun e!583109 () Bool)

(assert (=> b!1032096 (= e!583112 (and e!583109 mapRes!38103))))

(declare-fun condMapEmpty!38103 () Bool)

(declare-fun mapDefault!38103 () ValueCell!11513)

(assert (=> b!1032096 (= condMapEmpty!38103 (= (arr!31237 (_values!6207 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11513)) mapDefault!38103)))))

(declare-fun res!689901 () Bool)

(declare-fun e!583108 () Bool)

(assert (=> start!90104 (=> (not res!689901) (not e!583108))))

(declare-fun valid!2116 (LongMapFixedSize!5620) Bool)

(assert (=> start!90104 (= res!689901 (valid!2116 thiss!1427))))

(assert (=> start!90104 e!583108))

(assert (=> start!90104 e!583110))

(assert (=> start!90104 true))

(declare-fun b!1032097 () Bool)

(assert (=> b!1032097 (= e!583108 false)))

(declare-datatypes ((SeekEntryResult!9718 0))(
  ( (MissingZero!9718 (index!41243 (_ BitVec 32))) (Found!9718 (index!41244 (_ BitVec 32))) (Intermediate!9718 (undefined!10530 Bool) (index!41245 (_ BitVec 32)) (x!91963 (_ BitVec 32))) (Undefined!9718) (MissingVacant!9718 (index!41246 (_ BitVec 32))) )
))
(declare-fun lt!455814 () SeekEntryResult!9718)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64869 (_ BitVec 32)) SeekEntryResult!9718)

(assert (=> b!1032097 (= lt!455814 (seekEntry!0 key!909 (_keys!11353 thiss!1427) (mask!29993 thiss!1427)))))

(declare-fun b!1032098 () Bool)

(declare-fun res!689902 () Bool)

(assert (=> b!1032098 (=> (not res!689902) (not e!583108))))

(assert (=> b!1032098 (= res!689902 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1032099 () Bool)

(assert (=> b!1032099 (= e!583109 tp_is_empty!24433)))

(declare-fun b!1032100 () Bool)

(assert (=> b!1032100 (= e!583107 tp_is_empty!24433)))

(assert (= (and start!90104 res!689901) b!1032098))

(assert (= (and b!1032098 res!689902) b!1032097))

(assert (= (and b!1032096 condMapEmpty!38103) mapIsEmpty!38103))

(assert (= (and b!1032096 (not condMapEmpty!38103)) mapNonEmpty!38103))

(get-info :version)

(assert (= (and mapNonEmpty!38103 ((_ is ValueCellFull!11513) mapValue!38103)) b!1032100))

(assert (= (and b!1032096 ((_ is ValueCellFull!11513) mapDefault!38103)) b!1032099))

(assert (= b!1032095 b!1032096))

(assert (= start!90104 b!1032095))

(declare-fun m!951997 () Bool)

(assert (=> mapNonEmpty!38103 m!951997))

(declare-fun m!951999 () Bool)

(assert (=> b!1032095 m!951999))

(declare-fun m!952001 () Bool)

(assert (=> b!1032095 m!952001))

(declare-fun m!952003 () Bool)

(assert (=> start!90104 m!952003))

(declare-fun m!952005 () Bool)

(assert (=> b!1032097 m!952005))

(check-sat tp_is_empty!24433 (not b!1032097) (not b_next!20713) (not b!1032095) b_and!33155 (not start!90104) (not mapNonEmpty!38103))
(check-sat b_and!33155 (not b_next!20713))
