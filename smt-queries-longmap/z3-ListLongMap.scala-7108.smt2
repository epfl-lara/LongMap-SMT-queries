; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90096 () Bool)

(assert start!90096)

(declare-fun b!1032158 () Bool)

(declare-fun b_free!20703 () Bool)

(declare-fun b_next!20703 () Bool)

(assert (=> b!1032158 (= b_free!20703 (not b_next!20703))))

(declare-fun tp!73179 () Bool)

(declare-fun b_and!33171 () Bool)

(assert (=> b!1032158 (= tp!73179 b_and!33171)))

(declare-fun b!1032156 () Bool)

(declare-fun e!583109 () Bool)

(declare-fun tp_is_empty!24423 () Bool)

(assert (=> b!1032156 (= e!583109 tp_is_empty!24423)))

(declare-fun res!689938 () Bool)

(declare-fun e!583111 () Bool)

(assert (=> start!90096 (=> (not res!689938) (not e!583111))))

(declare-datatypes ((V!37437 0))(
  ( (V!37438 (val!12262 Int)) )
))
(declare-datatypes ((ValueCell!11508 0))(
  ( (ValueCellFull!11508 (v!14839 V!37437)) (EmptyCell!11508) )
))
(declare-datatypes ((array!64910 0))(
  ( (array!64911 (arr!31257 (Array (_ BitVec 32) (_ BitVec 64))) (size!31774 (_ BitVec 32))) )
))
(declare-datatypes ((array!64912 0))(
  ( (array!64913 (arr!31258 (Array (_ BitVec 32) ValueCell!11508)) (size!31775 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5610 0))(
  ( (LongMapFixedSize!5611 (defaultEntry!6179 Int) (mask!29989 (_ BitVec 32)) (extraKeys!5911 (_ BitVec 32)) (zeroValue!6015 V!37437) (minValue!6015 V!37437) (_size!2860 (_ BitVec 32)) (_keys!11352 array!64910) (_values!6202 array!64912) (_vacant!2860 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5610)

(declare-fun valid!2124 (LongMapFixedSize!5610) Bool)

(assert (=> start!90096 (= res!689938 (valid!2124 thiss!1427))))

(assert (=> start!90096 e!583111))

(declare-fun e!583108 () Bool)

(assert (=> start!90096 e!583108))

(assert (=> start!90096 true))

(declare-fun b!1032157 () Bool)

(declare-fun e!583113 () Bool)

(assert (=> b!1032157 (= e!583113 tp_is_empty!24423)))

(declare-fun e!583110 () Bool)

(declare-fun array_inv!24197 (array!64910) Bool)

(declare-fun array_inv!24198 (array!64912) Bool)

(assert (=> b!1032158 (= e!583108 (and tp!73179 tp_is_empty!24423 (array_inv!24197 (_keys!11352 thiss!1427)) (array_inv!24198 (_values!6202 thiss!1427)) e!583110))))

(declare-fun b!1032159 () Bool)

(assert (=> b!1032159 (= e!583111 false)))

(declare-datatypes ((SeekEntryResult!9724 0))(
  ( (MissingZero!9724 (index!41267 (_ BitVec 32))) (Found!9724 (index!41268 (_ BitVec 32))) (Intermediate!9724 (undefined!10536 Bool) (index!41269 (_ BitVec 32)) (x!91956 (_ BitVec 32))) (Undefined!9724) (MissingVacant!9724 (index!41270 (_ BitVec 32))) )
))
(declare-fun lt!455999 () SeekEntryResult!9724)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64910 (_ BitVec 32)) SeekEntryResult!9724)

(assert (=> b!1032159 (= lt!455999 (seekEntry!0 key!909 (_keys!11352 thiss!1427) (mask!29989 thiss!1427)))))

(declare-fun mapIsEmpty!38088 () Bool)

(declare-fun mapRes!38088 () Bool)

(assert (=> mapIsEmpty!38088 mapRes!38088))

(declare-fun b!1032160 () Bool)

(assert (=> b!1032160 (= e!583110 (and e!583113 mapRes!38088))))

(declare-fun condMapEmpty!38088 () Bool)

(declare-fun mapDefault!38088 () ValueCell!11508)

(assert (=> b!1032160 (= condMapEmpty!38088 (= (arr!31258 (_values!6202 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11508)) mapDefault!38088)))))

(declare-fun b!1032161 () Bool)

(declare-fun res!689939 () Bool)

(assert (=> b!1032161 (=> (not res!689939) (not e!583111))))

(assert (=> b!1032161 (= res!689939 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!38088 () Bool)

(declare-fun tp!73180 () Bool)

(assert (=> mapNonEmpty!38088 (= mapRes!38088 (and tp!73180 e!583109))))

(declare-fun mapValue!38088 () ValueCell!11508)

(declare-fun mapRest!38088 () (Array (_ BitVec 32) ValueCell!11508))

(declare-fun mapKey!38088 () (_ BitVec 32))

(assert (=> mapNonEmpty!38088 (= (arr!31258 (_values!6202 thiss!1427)) (store mapRest!38088 mapKey!38088 mapValue!38088))))

(assert (= (and start!90096 res!689938) b!1032161))

(assert (= (and b!1032161 res!689939) b!1032159))

(assert (= (and b!1032160 condMapEmpty!38088) mapIsEmpty!38088))

(assert (= (and b!1032160 (not condMapEmpty!38088)) mapNonEmpty!38088))

(get-info :version)

(assert (= (and mapNonEmpty!38088 ((_ is ValueCellFull!11508) mapValue!38088)) b!1032156))

(assert (= (and b!1032160 ((_ is ValueCellFull!11508) mapDefault!38088)) b!1032157))

(assert (= b!1032158 b!1032160))

(assert (= start!90096 b!1032158))

(declare-fun m!952567 () Bool)

(assert (=> start!90096 m!952567))

(declare-fun m!952569 () Bool)

(assert (=> b!1032158 m!952569))

(declare-fun m!952571 () Bool)

(assert (=> b!1032158 m!952571))

(declare-fun m!952573 () Bool)

(assert (=> b!1032159 m!952573))

(declare-fun m!952575 () Bool)

(assert (=> mapNonEmpty!38088 m!952575))

(check-sat tp_is_empty!24423 (not start!90096) (not b!1032158) (not mapNonEmpty!38088) (not b!1032159) b_and!33171 (not b_next!20703))
(check-sat b_and!33171 (not b_next!20703))
