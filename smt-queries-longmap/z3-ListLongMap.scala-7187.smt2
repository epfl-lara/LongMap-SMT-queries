; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92358 () Bool)

(assert start!92358)

(declare-fun b!1049284 () Bool)

(declare-fun b_free!21175 () Bool)

(declare-fun b_next!21175 () Bool)

(assert (=> b!1049284 (= b_free!21175 (not b_next!21175))))

(declare-fun tp!74792 () Bool)

(declare-fun b_and!33895 () Bool)

(assert (=> b!1049284 (= tp!74792 b_and!33895)))

(declare-fun b!1049280 () Bool)

(declare-fun e!595101 () Bool)

(declare-fun tp_is_empty!24895 () Bool)

(assert (=> b!1049280 (= e!595101 tp_is_empty!24895)))

(declare-fun b!1049281 () Bool)

(declare-fun res!697667 () Bool)

(declare-fun e!595102 () Bool)

(assert (=> b!1049281 (=> (not res!697667) (not e!595102))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!38067 0))(
  ( (V!38068 (val!12498 Int)) )
))
(declare-datatypes ((ValueCell!11744 0))(
  ( (ValueCellFull!11744 (v!15094 V!38067)) (EmptyCell!11744) )
))
(declare-datatypes ((array!66019 0))(
  ( (array!66020 (arr!31747 (Array (_ BitVec 32) (_ BitVec 64))) (size!32284 (_ BitVec 32))) )
))
(declare-datatypes ((array!66021 0))(
  ( (array!66022 (arr!31748 (Array (_ BitVec 32) ValueCell!11744)) (size!32285 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6082 0))(
  ( (LongMapFixedSize!6083 (defaultEntry!6445 Int) (mask!30662 (_ BitVec 32)) (extraKeys!6173 (_ BitVec 32)) (zeroValue!6279 V!38067) (minValue!6279 V!38067) (_size!3096 (_ BitVec 32)) (_keys!11762 array!66019) (_values!6468 array!66021) (_vacant!3096 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6082)

(get-info :version)

(declare-datatypes ((SeekEntryResult!9819 0))(
  ( (MissingZero!9819 (index!41647 (_ BitVec 32))) (Found!9819 (index!41648 (_ BitVec 32))) (Intermediate!9819 (undefined!10631 Bool) (index!41649 (_ BitVec 32)) (x!93522 (_ BitVec 32))) (Undefined!9819) (MissingVacant!9819 (index!41650 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!66019 (_ BitVec 32)) SeekEntryResult!9819)

(assert (=> b!1049281 (= res!697667 (not ((_ is Found!9819) (seekEntry!0 key!909 (_keys!11762 thiss!1427) (mask!30662 thiss!1427)))))))

(declare-fun mapIsEmpty!38992 () Bool)

(declare-fun mapRes!38992 () Bool)

(assert (=> mapIsEmpty!38992 mapRes!38992))

(declare-fun b!1049282 () Bool)

(declare-fun res!697665 () Bool)

(assert (=> b!1049282 (=> (not res!697665) (not e!595102))))

(assert (=> b!1049282 (= res!697665 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1049283 () Bool)

(declare-fun e!595100 () Bool)

(declare-fun e!595097 () Bool)

(assert (=> b!1049283 (= e!595100 (and e!595097 mapRes!38992))))

(declare-fun condMapEmpty!38992 () Bool)

(declare-fun mapDefault!38992 () ValueCell!11744)

(assert (=> b!1049283 (= condMapEmpty!38992 (= (arr!31748 (_values!6468 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11744)) mapDefault!38992)))))

(declare-fun e!595098 () Bool)

(declare-fun array_inv!24533 (array!66019) Bool)

(declare-fun array_inv!24534 (array!66021) Bool)

(assert (=> b!1049284 (= e!595098 (and tp!74792 tp_is_empty!24895 (array_inv!24533 (_keys!11762 thiss!1427)) (array_inv!24534 (_values!6468 thiss!1427)) e!595100))))

(declare-fun mapNonEmpty!38992 () Bool)

(declare-fun tp!74791 () Bool)

(assert (=> mapNonEmpty!38992 (= mapRes!38992 (and tp!74791 e!595101))))

(declare-fun mapValue!38992 () ValueCell!11744)

(declare-fun mapRest!38992 () (Array (_ BitVec 32) ValueCell!11744))

(declare-fun mapKey!38992 () (_ BitVec 32))

(assert (=> mapNonEmpty!38992 (= (arr!31748 (_values!6468 thiss!1427)) (store mapRest!38992 mapKey!38992 mapValue!38992))))

(declare-fun b!1049285 () Bool)

(assert (=> b!1049285 (= e!595097 tp_is_empty!24895)))

(declare-fun res!697666 () Bool)

(assert (=> start!92358 (=> (not res!697666) (not e!595102))))

(declare-fun valid!2286 (LongMapFixedSize!6082) Bool)

(assert (=> start!92358 (= res!697666 (valid!2286 thiss!1427))))

(assert (=> start!92358 e!595102))

(assert (=> start!92358 e!595098))

(assert (=> start!92358 true))

(declare-fun b!1049286 () Bool)

(assert (=> b!1049286 (= e!595102 false)))

(declare-datatypes ((tuple2!15846 0))(
  ( (tuple2!15847 (_1!7934 (_ BitVec 64)) (_2!7934 V!38067)) )
))
(declare-datatypes ((List!22036 0))(
  ( (Nil!22033) (Cons!22032 (h!23250 tuple2!15846) (t!31335 List!22036)) )
))
(declare-datatypes ((ListLongMap!13823 0))(
  ( (ListLongMap!13824 (toList!6927 List!22036)) )
))
(declare-fun lt!463607 () ListLongMap!13823)

(declare-fun map!14817 (LongMapFixedSize!6082) ListLongMap!13823)

(assert (=> b!1049286 (= lt!463607 (map!14817 thiss!1427))))

(assert (= (and start!92358 res!697666) b!1049282))

(assert (= (and b!1049282 res!697665) b!1049281))

(assert (= (and b!1049281 res!697667) b!1049286))

(assert (= (and b!1049283 condMapEmpty!38992) mapIsEmpty!38992))

(assert (= (and b!1049283 (not condMapEmpty!38992)) mapNonEmpty!38992))

(assert (= (and mapNonEmpty!38992 ((_ is ValueCellFull!11744) mapValue!38992)) b!1049280))

(assert (= (and b!1049283 ((_ is ValueCellFull!11744) mapDefault!38992)) b!1049285))

(assert (= b!1049284 b!1049283))

(assert (= start!92358 b!1049284))

(declare-fun m!970679 () Bool)

(assert (=> b!1049284 m!970679))

(declare-fun m!970681 () Bool)

(assert (=> b!1049284 m!970681))

(declare-fun m!970683 () Bool)

(assert (=> start!92358 m!970683))

(declare-fun m!970685 () Bool)

(assert (=> b!1049281 m!970685))

(declare-fun m!970687 () Bool)

(assert (=> b!1049286 m!970687))

(declare-fun m!970689 () Bool)

(assert (=> mapNonEmpty!38992 m!970689))

(check-sat b_and!33895 (not b!1049284) (not b!1049286) (not b!1049281) (not b_next!21175) (not start!92358) (not mapNonEmpty!38992) tp_is_empty!24895)
(check-sat b_and!33895 (not b_next!21175))
