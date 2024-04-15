; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92122 () Bool)

(assert start!92122)

(declare-fun b!1047815 () Bool)

(declare-fun b_free!21175 () Bool)

(declare-fun b_next!21175 () Bool)

(assert (=> b!1047815 (= b_free!21175 (not b_next!21175))))

(declare-fun tp!74791 () Bool)

(declare-fun b_and!33859 () Bool)

(assert (=> b!1047815 (= tp!74791 b_and!33859)))

(declare-fun b!1047814 () Bool)

(declare-fun e!594166 () Bool)

(assert (=> b!1047814 (= e!594166 false)))

(declare-datatypes ((V!38067 0))(
  ( (V!38068 (val!12498 Int)) )
))
(declare-datatypes ((tuple2!15914 0))(
  ( (tuple2!15915 (_1!7968 (_ BitVec 64)) (_2!7968 V!38067)) )
))
(declare-datatypes ((List!22076 0))(
  ( (Nil!22073) (Cons!22072 (h!23281 tuple2!15914) (t!31374 List!22076)) )
))
(declare-datatypes ((ListLongMap!13883 0))(
  ( (ListLongMap!13884 (toList!6957 List!22076)) )
))
(declare-fun lt!462892 () ListLongMap!13883)

(declare-datatypes ((ValueCell!11744 0))(
  ( (ValueCellFull!11744 (v!15097 V!38067)) (EmptyCell!11744) )
))
(declare-datatypes ((array!65909 0))(
  ( (array!65910 (arr!31698 (Array (_ BitVec 32) (_ BitVec 64))) (size!32236 (_ BitVec 32))) )
))
(declare-datatypes ((array!65911 0))(
  ( (array!65912 (arr!31699 (Array (_ BitVec 32) ValueCell!11744)) (size!32237 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6082 0))(
  ( (LongMapFixedSize!6083 (defaultEntry!6445 Int) (mask!30597 (_ BitVec 32)) (extraKeys!6173 (_ BitVec 32)) (zeroValue!6279 V!38067) (minValue!6279 V!38067) (_size!3096 (_ BitVec 32)) (_keys!11720 array!65909) (_values!6468 array!65911) (_vacant!3096 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6082)

(declare-fun map!14818 (LongMapFixedSize!6082) ListLongMap!13883)

(assert (=> b!1047814 (= lt!462892 (map!14818 thiss!1427))))

(declare-fun e!594163 () Bool)

(declare-fun tp_is_empty!24895 () Bool)

(declare-fun e!594167 () Bool)

(declare-fun array_inv!24483 (array!65909) Bool)

(declare-fun array_inv!24484 (array!65911) Bool)

(assert (=> b!1047815 (= e!594163 (and tp!74791 tp_is_empty!24895 (array_inv!24483 (_keys!11720 thiss!1427)) (array_inv!24484 (_values!6468 thiss!1427)) e!594167))))

(declare-fun b!1047816 () Bool)

(declare-fun e!594168 () Bool)

(assert (=> b!1047816 (= e!594168 tp_is_empty!24895)))

(declare-fun b!1047818 () Bool)

(declare-fun e!594165 () Bool)

(assert (=> b!1047818 (= e!594165 tp_is_empty!24895)))

(declare-fun b!1047819 () Bool)

(declare-fun res!697090 () Bool)

(assert (=> b!1047819 (=> (not res!697090) (not e!594166))))

(declare-fun key!909 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9863 0))(
  ( (MissingZero!9863 (index!41823 (_ BitVec 32))) (Found!9863 (index!41824 (_ BitVec 32))) (Intermediate!9863 (undefined!10675 Bool) (index!41825 (_ BitVec 32)) (x!93541 (_ BitVec 32))) (Undefined!9863) (MissingVacant!9863 (index!41826 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!65909 (_ BitVec 32)) SeekEntryResult!9863)

(assert (=> b!1047819 (= res!697090 (not ((_ is Found!9863) (seekEntry!0 key!909 (_keys!11720 thiss!1427) (mask!30597 thiss!1427)))))))

(declare-fun b!1047820 () Bool)

(declare-fun res!697088 () Bool)

(assert (=> b!1047820 (=> (not res!697088) (not e!594166))))

(assert (=> b!1047820 (= res!697088 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!38992 () Bool)

(declare-fun mapRes!38992 () Bool)

(declare-fun tp!74792 () Bool)

(assert (=> mapNonEmpty!38992 (= mapRes!38992 (and tp!74792 e!594168))))

(declare-fun mapRest!38992 () (Array (_ BitVec 32) ValueCell!11744))

(declare-fun mapValue!38992 () ValueCell!11744)

(declare-fun mapKey!38992 () (_ BitVec 32))

(assert (=> mapNonEmpty!38992 (= (arr!31699 (_values!6468 thiss!1427)) (store mapRest!38992 mapKey!38992 mapValue!38992))))

(declare-fun mapIsEmpty!38992 () Bool)

(assert (=> mapIsEmpty!38992 mapRes!38992))

(declare-fun res!697089 () Bool)

(assert (=> start!92122 (=> (not res!697089) (not e!594166))))

(declare-fun valid!2277 (LongMapFixedSize!6082) Bool)

(assert (=> start!92122 (= res!697089 (valid!2277 thiss!1427))))

(assert (=> start!92122 e!594166))

(assert (=> start!92122 e!594163))

(assert (=> start!92122 true))

(declare-fun b!1047817 () Bool)

(assert (=> b!1047817 (= e!594167 (and e!594165 mapRes!38992))))

(declare-fun condMapEmpty!38992 () Bool)

(declare-fun mapDefault!38992 () ValueCell!11744)

(assert (=> b!1047817 (= condMapEmpty!38992 (= (arr!31699 (_values!6468 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11744)) mapDefault!38992)))))

(assert (= (and start!92122 res!697089) b!1047820))

(assert (= (and b!1047820 res!697088) b!1047819))

(assert (= (and b!1047819 res!697090) b!1047814))

(assert (= (and b!1047817 condMapEmpty!38992) mapIsEmpty!38992))

(assert (= (and b!1047817 (not condMapEmpty!38992)) mapNonEmpty!38992))

(assert (= (and mapNonEmpty!38992 ((_ is ValueCellFull!11744) mapValue!38992)) b!1047816))

(assert (= (and b!1047817 ((_ is ValueCellFull!11744) mapDefault!38992)) b!1047818))

(assert (= b!1047815 b!1047817))

(assert (= start!92122 b!1047815))

(declare-fun m!968395 () Bool)

(assert (=> start!92122 m!968395))

(declare-fun m!968397 () Bool)

(assert (=> b!1047815 m!968397))

(declare-fun m!968399 () Bool)

(assert (=> b!1047815 m!968399))

(declare-fun m!968401 () Bool)

(assert (=> mapNonEmpty!38992 m!968401))

(declare-fun m!968403 () Bool)

(assert (=> b!1047819 m!968403))

(declare-fun m!968405 () Bool)

(assert (=> b!1047814 m!968405))

(check-sat (not b!1047815) (not start!92122) tp_is_empty!24895 b_and!33859 (not b_next!21175) (not mapNonEmpty!38992) (not b!1047819) (not b!1047814))
(check-sat b_and!33859 (not b_next!21175))
