; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3020 () Bool)

(assert start!3020)

(declare-fun b!17844 () Bool)

(declare-fun b_free!627 () Bool)

(declare-fun b_next!627 () Bool)

(assert (=> b!17844 (= b_free!627 (not b_next!627))))

(declare-fun tp!3072 () Bool)

(declare-fun b_and!1275 () Bool)

(assert (=> b!17844 (= tp!3072 b_and!1275)))

(declare-fun b!17838 () Bool)

(declare-fun e!11318 () Bool)

(declare-fun tp_is_empty!891 () Bool)

(assert (=> b!17838 (= e!11318 tp_is_empty!891)))

(declare-fun b!17839 () Bool)

(declare-fun e!11323 () Bool)

(declare-fun e!11317 () Bool)

(assert (=> b!17839 (= e!11323 e!11317)))

(declare-fun res!12675 () Bool)

(assert (=> b!17839 (=> (not res!12675) (not e!11317))))

(declare-datatypes ((V!1013 0))(
  ( (V!1014 (val!472 Int)) )
))
(declare-datatypes ((ValueCell!246 0))(
  ( (ValueCellFull!246 (v!1448 V!1013)) (EmptyCell!246) )
))
(declare-datatypes ((array!987 0))(
  ( (array!988 (arr!475 (Array (_ BitVec 32) ValueCell!246)) (size!565 (_ BitVec 32))) )
))
(declare-datatypes ((array!989 0))(
  ( (array!990 (arr!476 (Array (_ BitVec 32) (_ BitVec 64))) (size!566 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!78 0))(
  ( (LongMapFixedSize!79 (defaultEntry!1650 Int) (mask!4575 (_ BitVec 32)) (extraKeys!1563 (_ BitVec 32)) (zeroValue!1586 V!1013) (minValue!1586 V!1013) (_size!71 (_ BitVec 32)) (_keys!3075 array!989) (_values!1647 array!987) (_vacant!71 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!78 0))(
  ( (Cell!79 (v!1449 LongMapFixedSize!78)) )
))
(declare-datatypes ((LongMap!78 0))(
  ( (LongMap!79 (underlying!50 Cell!78)) )
))
(declare-datatypes ((tuple2!770 0))(
  ( (tuple2!771 (_1!386 Bool) (_2!386 LongMap!78)) )
))
(declare-fun lt!4623 () tuple2!770)

(assert (=> b!17839 (= res!12675 (not (_1!386 lt!4623)))))

(declare-fun e!11326 () tuple2!770)

(assert (=> b!17839 (= lt!4623 e!11326)))

(declare-fun c!1789 () Bool)

(declare-fun thiss!848 () LongMap!78)

(declare-fun imbalanced!21 (LongMap!78) Bool)

(assert (=> b!17839 (= c!1789 (imbalanced!21 thiss!848))))

(declare-fun mapIsEmpty!771 () Bool)

(declare-fun mapRes!771 () Bool)

(assert (=> mapIsEmpty!771 mapRes!771))

(declare-fun b!17840 () Bool)

(declare-fun e!11325 () Bool)

(assert (=> b!17840 (= e!11325 tp_is_empty!891)))

(declare-fun mapNonEmpty!771 () Bool)

(declare-fun tp!3071 () Bool)

(assert (=> mapNonEmpty!771 (= mapRes!771 (and tp!3071 e!11325))))

(declare-fun mapKey!771 () (_ BitVec 32))

(declare-fun mapValue!771 () ValueCell!246)

(declare-fun mapRest!771 () (Array (_ BitVec 32) ValueCell!246))

(assert (=> mapNonEmpty!771 (= (arr!475 (_values!1647 (v!1449 (underlying!50 thiss!848)))) (store mapRest!771 mapKey!771 mapValue!771))))

(declare-fun b!17841 () Bool)

(declare-fun e!11319 () Bool)

(declare-fun e!11324 () Bool)

(assert (=> b!17841 (= e!11319 e!11324)))

(declare-fun b!17842 () Bool)

(assert (=> b!17842 (= e!11317 false)))

(declare-fun lt!4624 () Bool)

(declare-fun valid!39 (LongMap!78) Bool)

(assert (=> b!17842 (= lt!4624 (valid!39 (_2!386 lt!4623)))))

(declare-fun b!17843 () Bool)

(declare-fun e!11322 () Bool)

(assert (=> b!17843 (= e!11324 e!11322)))

(declare-fun res!12676 () Bool)

(assert (=> start!3020 (=> (not res!12676) (not e!11323))))

(assert (=> start!3020 (= res!12676 (valid!39 thiss!848))))

(assert (=> start!3020 e!11323))

(assert (=> start!3020 e!11319))

(declare-fun e!11321 () Bool)

(declare-fun array_inv!329 (array!989) Bool)

(declare-fun array_inv!330 (array!987) Bool)

(assert (=> b!17844 (= e!11322 (and tp!3072 tp_is_empty!891 (array_inv!329 (_keys!3075 (v!1449 (underlying!50 thiss!848)))) (array_inv!330 (_values!1647 (v!1449 (underlying!50 thiss!848)))) e!11321))))

(declare-fun b!17845 () Bool)

(assert (=> b!17845 (= e!11326 (tuple2!771 true thiss!848))))

(declare-fun b!17846 () Bool)

(assert (=> b!17846 (= e!11321 (and e!11318 mapRes!771))))

(declare-fun condMapEmpty!771 () Bool)

(declare-fun mapDefault!771 () ValueCell!246)

(assert (=> b!17846 (= condMapEmpty!771 (= (arr!475 (_values!1647 (v!1449 (underlying!50 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!246)) mapDefault!771)))))

(declare-fun b!17847 () Bool)

(declare-fun repack!15 (LongMap!78) tuple2!770)

(assert (=> b!17847 (= e!11326 (repack!15 thiss!848))))

(assert (= (and start!3020 res!12676) b!17839))

(assert (= (and b!17839 c!1789) b!17847))

(assert (= (and b!17839 (not c!1789)) b!17845))

(assert (= (and b!17839 res!12675) b!17842))

(assert (= (and b!17846 condMapEmpty!771) mapIsEmpty!771))

(assert (= (and b!17846 (not condMapEmpty!771)) mapNonEmpty!771))

(get-info :version)

(assert (= (and mapNonEmpty!771 ((_ is ValueCellFull!246) mapValue!771)) b!17840))

(assert (= (and b!17846 ((_ is ValueCellFull!246) mapDefault!771)) b!17838))

(assert (= b!17844 b!17846))

(assert (= b!17843 b!17844))

(assert (= b!17841 b!17843))

(assert (= start!3020 b!17841))

(declare-fun m!12485 () Bool)

(assert (=> b!17847 m!12485))

(declare-fun m!12487 () Bool)

(assert (=> start!3020 m!12487))

(declare-fun m!12489 () Bool)

(assert (=> b!17839 m!12489))

(declare-fun m!12491 () Bool)

(assert (=> b!17844 m!12491))

(declare-fun m!12493 () Bool)

(assert (=> b!17844 m!12493))

(declare-fun m!12495 () Bool)

(assert (=> b!17842 m!12495))

(declare-fun m!12497 () Bool)

(assert (=> mapNonEmpty!771 m!12497))

(check-sat b_and!1275 tp_is_empty!891 (not mapNonEmpty!771) (not b!17847) (not b!17839) (not b!17842) (not b_next!627) (not start!3020) (not b!17844))
(check-sat b_and!1275 (not b_next!627))
