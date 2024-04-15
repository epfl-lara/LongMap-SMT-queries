; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2972 () Bool)

(assert start!2972)

(declare-fun b!17174 () Bool)

(declare-fun b_free!589 () Bool)

(declare-fun b_next!589 () Bool)

(assert (=> b!17174 (= b_free!589 (not b_next!589))))

(declare-fun tp!2958 () Bool)

(declare-fun b_and!1231 () Bool)

(assert (=> b!17174 (= tp!2958 b_and!1231)))

(declare-fun b!17172 () Bool)

(declare-fun e!10690 () Bool)

(declare-fun tp_is_empty!853 () Bool)

(assert (=> b!17172 (= e!10690 tp_is_empty!853)))

(declare-fun b!17173 () Bool)

(declare-fun e!10687 () Bool)

(declare-fun e!10688 () Bool)

(assert (=> b!17173 (= e!10687 e!10688)))

(declare-datatypes ((V!963 0))(
  ( (V!964 (val!453 Int)) )
))
(declare-datatypes ((ValueCell!227 0))(
  ( (ValueCellFull!227 (v!1409 V!963)) (EmptyCell!227) )
))
(declare-datatypes ((array!893 0))(
  ( (array!894 (arr!428 (Array (_ BitVec 32) ValueCell!227)) (size!518 (_ BitVec 32))) )
))
(declare-datatypes ((array!895 0))(
  ( (array!896 (arr!429 (Array (_ BitVec 32) (_ BitVec 64))) (size!519 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!40 0))(
  ( (LongMapFixedSize!41 (defaultEntry!1631 Int) (mask!4544 (_ BitVec 32)) (extraKeys!1544 (_ BitVec 32)) (zeroValue!1567 V!963) (minValue!1567 V!963) (_size!52 (_ BitVec 32)) (_keys!3056 array!895) (_values!1628 array!893) (_vacant!52 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!40 0))(
  ( (Cell!41 (v!1410 LongMapFixedSize!40)) )
))
(declare-datatypes ((LongMap!40 0))(
  ( (LongMap!41 (underlying!31 Cell!40)) )
))
(declare-fun thiss!848 () LongMap!40)

(declare-fun e!10692 () Bool)

(declare-fun array_inv!313 (array!895) Bool)

(declare-fun array_inv!314 (array!893) Bool)

(assert (=> b!17174 (= e!10688 (and tp!2958 tp_is_empty!853 (array_inv!313 (_keys!3056 (v!1410 (underlying!31 thiss!848)))) (array_inv!314 (_values!1628 (v!1410 (underlying!31 thiss!848)))) e!10692))))

(declare-fun b!17175 () Bool)

(declare-datatypes ((tuple2!704 0))(
  ( (tuple2!705 (_1!353 Bool) (_2!353 LongMap!40)) )
))
(declare-fun e!10689 () tuple2!704)

(declare-fun repack!4 (LongMap!40) tuple2!704)

(assert (=> b!17175 (= e!10689 (repack!4 thiss!848))))

(declare-fun mapIsEmpty!714 () Bool)

(declare-fun mapRes!714 () Bool)

(assert (=> mapIsEmpty!714 mapRes!714))

(declare-fun b!17176 () Bool)

(declare-fun e!10685 () Bool)

(assert (=> b!17176 (= e!10685 tp_is_empty!853)))

(declare-fun res!12494 () Bool)

(declare-fun e!10683 () Bool)

(assert (=> start!2972 (=> (not res!12494) (not e!10683))))

(declare-fun valid!30 (LongMap!40) Bool)

(assert (=> start!2972 (= res!12494 (valid!30 thiss!848))))

(assert (=> start!2972 e!10683))

(declare-fun e!10686 () Bool)

(assert (=> start!2972 e!10686))

(assert (=> start!2972 true))

(assert (=> start!2972 tp_is_empty!853))

(declare-fun mapNonEmpty!714 () Bool)

(declare-fun tp!2957 () Bool)

(assert (=> mapNonEmpty!714 (= mapRes!714 (and tp!2957 e!10690))))

(declare-fun mapKey!714 () (_ BitVec 32))

(declare-fun mapValue!714 () ValueCell!227)

(declare-fun mapRest!714 () (Array (_ BitVec 32) ValueCell!227))

(assert (=> mapNonEmpty!714 (= (arr!428 (_values!1628 (v!1410 (underlying!31 thiss!848)))) (store mapRest!714 mapKey!714 mapValue!714))))

(declare-fun b!17177 () Bool)

(declare-fun e!10691 () Bool)

(assert (=> b!17177 (= e!10683 e!10691)))

(declare-fun res!12493 () Bool)

(assert (=> b!17177 (=> (not res!12493) (not e!10691))))

(declare-fun lt!4470 () tuple2!704)

(assert (=> b!17177 (= res!12493 (_1!353 lt!4470))))

(assert (=> b!17177 (= lt!4470 e!10689)))

(declare-fun c!1718 () Bool)

(declare-fun imbalanced!4 (LongMap!40) Bool)

(assert (=> b!17177 (= c!1718 (imbalanced!4 thiss!848))))

(declare-fun b!17178 () Bool)

(assert (=> b!17178 (= e!10691 false)))

(declare-fun key!682 () (_ BitVec 64))

(declare-fun lt!4469 () Bool)

(declare-fun v!259 () V!963)

(declare-datatypes ((tuple2!706 0))(
  ( (tuple2!707 (_1!354 Bool) (_2!354 LongMapFixedSize!40)) )
))
(declare-fun update!3 (LongMapFixedSize!40 (_ BitVec 64) V!963) tuple2!706)

(assert (=> b!17178 (= lt!4469 (valid!30 (LongMap!41 (Cell!41 (_2!354 (update!3 (v!1410 (underlying!31 (_2!353 lt!4470))) key!682 v!259))))))))

(declare-fun b!17179 () Bool)

(assert (=> b!17179 (= e!10689 (tuple2!705 true thiss!848))))

(declare-fun b!17180 () Bool)

(assert (=> b!17180 (= e!10692 (and e!10685 mapRes!714))))

(declare-fun condMapEmpty!714 () Bool)

(declare-fun mapDefault!714 () ValueCell!227)

(assert (=> b!17180 (= condMapEmpty!714 (= (arr!428 (_values!1628 (v!1410 (underlying!31 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!227)) mapDefault!714)))))

(declare-fun b!17181 () Bool)

(assert (=> b!17181 (= e!10686 e!10687)))

(assert (= (and start!2972 res!12494) b!17177))

(assert (= (and b!17177 c!1718) b!17175))

(assert (= (and b!17177 (not c!1718)) b!17179))

(assert (= (and b!17177 res!12493) b!17178))

(assert (= (and b!17180 condMapEmpty!714) mapIsEmpty!714))

(assert (= (and b!17180 (not condMapEmpty!714)) mapNonEmpty!714))

(get-info :version)

(assert (= (and mapNonEmpty!714 ((_ is ValueCellFull!227) mapValue!714)) b!17172))

(assert (= (and b!17180 ((_ is ValueCellFull!227) mapDefault!714)) b!17176))

(assert (= b!17174 b!17180))

(assert (= b!17173 b!17174))

(assert (= b!17181 b!17173))

(assert (= start!2972 b!17181))

(declare-fun m!12103 () Bool)

(assert (=> b!17178 m!12103))

(declare-fun m!12105 () Bool)

(assert (=> b!17178 m!12105))

(declare-fun m!12107 () Bool)

(assert (=> b!17175 m!12107))

(declare-fun m!12109 () Bool)

(assert (=> b!17177 m!12109))

(declare-fun m!12111 () Bool)

(assert (=> b!17174 m!12111))

(declare-fun m!12113 () Bool)

(assert (=> b!17174 m!12113))

(declare-fun m!12115 () Bool)

(assert (=> start!2972 m!12115))

(declare-fun m!12117 () Bool)

(assert (=> mapNonEmpty!714 m!12117))

(check-sat (not b!17174) b_and!1231 tp_is_empty!853 (not mapNonEmpty!714) (not b!17175) (not b!17177) (not start!2972) (not b!17178) (not b_next!589))
(check-sat b_and!1231 (not b_next!589))
