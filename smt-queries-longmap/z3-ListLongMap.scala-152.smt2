; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2978 () Bool)

(assert start!2978)

(declare-fun b!17197 () Bool)

(declare-fun b_free!589 () Bool)

(declare-fun b_next!589 () Bool)

(assert (=> b!17197 (= b_free!589 (not b_next!589))))

(declare-fun tp!2957 () Bool)

(declare-fun b_and!1231 () Bool)

(assert (=> b!17197 (= tp!2957 b_and!1231)))

(declare-fun b!17190 () Bool)

(declare-fun e!10706 () Bool)

(declare-fun e!10698 () Bool)

(declare-fun mapRes!714 () Bool)

(assert (=> b!17190 (= e!10706 (and e!10698 mapRes!714))))

(declare-fun condMapEmpty!714 () Bool)

(declare-datatypes ((V!963 0))(
  ( (V!964 (val!453 Int)) )
))
(declare-datatypes ((ValueCell!227 0))(
  ( (ValueCellFull!227 (v!1410 V!963)) (EmptyCell!227) )
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
  ( (Cell!41 (v!1411 LongMapFixedSize!40)) )
))
(declare-datatypes ((LongMap!40 0))(
  ( (LongMap!41 (underlying!31 Cell!40)) )
))
(declare-fun thiss!848 () LongMap!40)

(declare-fun mapDefault!714 () ValueCell!227)

(assert (=> b!17190 (= condMapEmpty!714 (= (arr!428 (_values!1628 (v!1411 (underlying!31 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!227)) mapDefault!714)))))

(declare-fun mapNonEmpty!714 () Bool)

(declare-fun tp!2958 () Bool)

(declare-fun e!10705 () Bool)

(assert (=> mapNonEmpty!714 (= mapRes!714 (and tp!2958 e!10705))))

(declare-fun mapRest!714 () (Array (_ BitVec 32) ValueCell!227))

(declare-fun mapKey!714 () (_ BitVec 32))

(declare-fun mapValue!714 () ValueCell!227)

(assert (=> mapNonEmpty!714 (= (arr!428 (_values!1628 (v!1411 (underlying!31 thiss!848)))) (store mapRest!714 mapKey!714 mapValue!714))))

(declare-fun b!17191 () Bool)

(declare-fun e!10699 () Bool)

(declare-fun e!10703 () Bool)

(assert (=> b!17191 (= e!10699 e!10703)))

(declare-fun mapIsEmpty!714 () Bool)

(assert (=> mapIsEmpty!714 mapRes!714))

(declare-fun b!17192 () Bool)

(declare-datatypes ((tuple2!704 0))(
  ( (tuple2!705 (_1!353 Bool) (_2!353 LongMap!40)) )
))
(declare-fun e!10702 () tuple2!704)

(assert (=> b!17192 (= e!10702 (tuple2!705 true thiss!848))))

(declare-fun b!17193 () Bool)

(declare-fun tp_is_empty!853 () Bool)

(assert (=> b!17193 (= e!10698 tp_is_empty!853)))

(declare-fun b!17194 () Bool)

(declare-fun e!10700 () Bool)

(assert (=> b!17194 (= e!10700 e!10699)))

(declare-fun b!17195 () Bool)

(declare-fun e!10704 () Bool)

(assert (=> b!17195 (= e!10704 false)))

(declare-fun lt!4473 () tuple2!704)

(declare-fun key!682 () (_ BitVec 64))

(declare-fun lt!4474 () Bool)

(declare-fun v!259 () V!963)

(declare-fun valid!29 (LongMap!40) Bool)

(declare-datatypes ((tuple2!706 0))(
  ( (tuple2!707 (_1!354 Bool) (_2!354 LongMapFixedSize!40)) )
))
(declare-fun update!3 (LongMapFixedSize!40 (_ BitVec 64) V!963) tuple2!706)

(assert (=> b!17195 (= lt!4474 (valid!29 (LongMap!41 (Cell!41 (_2!354 (update!3 (v!1411 (underlying!31 (_2!353 lt!4473))) key!682 v!259))))))))

(declare-fun b!17196 () Bool)

(declare-fun e!10701 () Bool)

(assert (=> b!17196 (= e!10701 e!10704)))

(declare-fun res!12504 () Bool)

(assert (=> b!17196 (=> (not res!12504) (not e!10704))))

(assert (=> b!17196 (= res!12504 (_1!353 lt!4473))))

(assert (=> b!17196 (= lt!4473 e!10702)))

(declare-fun c!1722 () Bool)

(declare-fun imbalanced!5 (LongMap!40) Bool)

(assert (=> b!17196 (= c!1722 (imbalanced!5 thiss!848))))

(declare-fun array_inv!311 (array!895) Bool)

(declare-fun array_inv!312 (array!893) Bool)

(assert (=> b!17197 (= e!10703 (and tp!2957 tp_is_empty!853 (array_inv!311 (_keys!3056 (v!1411 (underlying!31 thiss!848)))) (array_inv!312 (_values!1628 (v!1411 (underlying!31 thiss!848)))) e!10706))))

(declare-fun res!12503 () Bool)

(assert (=> start!2978 (=> (not res!12503) (not e!10701))))

(assert (=> start!2978 (= res!12503 (valid!29 thiss!848))))

(assert (=> start!2978 e!10701))

(assert (=> start!2978 e!10700))

(assert (=> start!2978 true))

(assert (=> start!2978 tp_is_empty!853))

(declare-fun b!17198 () Bool)

(assert (=> b!17198 (= e!10705 tp_is_empty!853)))

(declare-fun b!17199 () Bool)

(declare-fun repack!3 (LongMap!40) tuple2!704)

(assert (=> b!17199 (= e!10702 (repack!3 thiss!848))))

(assert (= (and start!2978 res!12503) b!17196))

(assert (= (and b!17196 c!1722) b!17199))

(assert (= (and b!17196 (not c!1722)) b!17192))

(assert (= (and b!17196 res!12504) b!17195))

(assert (= (and b!17190 condMapEmpty!714) mapIsEmpty!714))

(assert (= (and b!17190 (not condMapEmpty!714)) mapNonEmpty!714))

(get-info :version)

(assert (= (and mapNonEmpty!714 ((_ is ValueCellFull!227) mapValue!714)) b!17198))

(assert (= (and b!17190 ((_ is ValueCellFull!227) mapDefault!714)) b!17193))

(assert (= b!17197 b!17190))

(assert (= b!17191 b!17197))

(assert (= b!17194 b!17191))

(assert (= start!2978 b!17194))

(declare-fun m!12117 () Bool)

(assert (=> start!2978 m!12117))

(declare-fun m!12119 () Bool)

(assert (=> b!17199 m!12119))

(declare-fun m!12121 () Bool)

(assert (=> b!17196 m!12121))

(declare-fun m!12123 () Bool)

(assert (=> mapNonEmpty!714 m!12123))

(declare-fun m!12125 () Bool)

(assert (=> b!17197 m!12125))

(declare-fun m!12127 () Bool)

(assert (=> b!17197 m!12127))

(declare-fun m!12129 () Bool)

(assert (=> b!17195 m!12129))

(declare-fun m!12131 () Bool)

(assert (=> b!17195 m!12131))

(check-sat (not b_next!589) tp_is_empty!853 (not start!2978) (not mapNonEmpty!714) (not b!17196) b_and!1231 (not b!17195) (not b!17197) (not b!17199))
(check-sat b_and!1231 (not b_next!589))
