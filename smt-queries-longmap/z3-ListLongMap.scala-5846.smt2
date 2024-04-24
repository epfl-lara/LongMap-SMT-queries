; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75718 () Bool)

(assert start!75718)

(declare-fun b!889617 () Bool)

(declare-fun b_free!15577 () Bool)

(declare-fun b_next!15577 () Bool)

(assert (=> b!889617 (= b_free!15577 (not b_next!15577))))

(declare-fun tp!54687 () Bool)

(declare-fun b_and!25827 () Bool)

(assert (=> b!889617 (= tp!54687 b_and!25827)))

(declare-fun mapNonEmpty!28398 () Bool)

(declare-fun mapRes!28398 () Bool)

(declare-fun tp!54686 () Bool)

(declare-fun e!495809 () Bool)

(assert (=> mapNonEmpty!28398 (= mapRes!28398 (and tp!54686 e!495809))))

(declare-fun mapKey!28398 () (_ BitVec 32))

(declare-datatypes ((array!51821 0))(
  ( (array!51822 (arr!24916 (Array (_ BitVec 32) (_ BitVec 64))) (size!25359 (_ BitVec 32))) )
))
(declare-datatypes ((V!28839 0))(
  ( (V!28840 (val!9003 Int)) )
))
(declare-datatypes ((ValueCell!8471 0))(
  ( (ValueCellFull!8471 (v!11475 V!28839)) (EmptyCell!8471) )
))
(declare-datatypes ((array!51823 0))(
  ( (array!51824 (arr!24917 (Array (_ BitVec 32) ValueCell!8471)) (size!25360 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3958 0))(
  ( (LongMapFixedSize!3959 (defaultEntry!5176 Int) (mask!25647 (_ BitVec 32)) (extraKeys!4870 (_ BitVec 32)) (zeroValue!4974 V!28839) (minValue!4974 V!28839) (_size!2034 (_ BitVec 32)) (_keys!9885 array!51821) (_values!5161 array!51823) (_vacant!2034 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3958)

(declare-fun mapValue!28398 () ValueCell!8471)

(declare-fun mapRest!28398 () (Array (_ BitVec 32) ValueCell!8471))

(assert (=> mapNonEmpty!28398 (= (arr!24917 (_values!5161 thiss!1181)) (store mapRest!28398 mapKey!28398 mapValue!28398))))

(declare-fun tp_is_empty!17905 () Bool)

(declare-fun e!495807 () Bool)

(declare-fun e!495805 () Bool)

(declare-fun array_inv!19646 (array!51821) Bool)

(declare-fun array_inv!19647 (array!51823) Bool)

(assert (=> b!889617 (= e!495807 (and tp!54687 tp_is_empty!17905 (array_inv!19646 (_keys!9885 thiss!1181)) (array_inv!19647 (_values!5161 thiss!1181)) e!495805))))

(declare-fun lt!402269 () Bool)

(declare-fun valid!1554 (LongMapFixedSize!3958) Bool)

(assert (=> start!75718 (= lt!402269 (valid!1554 thiss!1181))))

(assert (=> start!75718 false))

(assert (=> start!75718 e!495807))

(declare-fun b!889618 () Bool)

(assert (=> b!889618 (= e!495809 tp_is_empty!17905)))

(declare-fun b!889619 () Bool)

(declare-fun e!495806 () Bool)

(assert (=> b!889619 (= e!495806 tp_is_empty!17905)))

(declare-fun b!889620 () Bool)

(assert (=> b!889620 (= e!495805 (and e!495806 mapRes!28398))))

(declare-fun condMapEmpty!28398 () Bool)

(declare-fun mapDefault!28398 () ValueCell!8471)

(assert (=> b!889620 (= condMapEmpty!28398 (= (arr!24917 (_values!5161 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8471)) mapDefault!28398)))))

(declare-fun mapIsEmpty!28398 () Bool)

(assert (=> mapIsEmpty!28398 mapRes!28398))

(assert (= (and b!889620 condMapEmpty!28398) mapIsEmpty!28398))

(assert (= (and b!889620 (not condMapEmpty!28398)) mapNonEmpty!28398))

(get-info :version)

(assert (= (and mapNonEmpty!28398 ((_ is ValueCellFull!8471) mapValue!28398)) b!889618))

(assert (= (and b!889620 ((_ is ValueCellFull!8471) mapDefault!28398)) b!889619))

(assert (= b!889617 b!889620))

(assert (= start!75718 b!889617))

(declare-fun m!829243 () Bool)

(assert (=> mapNonEmpty!28398 m!829243))

(declare-fun m!829245 () Bool)

(assert (=> b!889617 m!829245))

(declare-fun m!829247 () Bool)

(assert (=> b!889617 m!829247))

(declare-fun m!829249 () Bool)

(assert (=> start!75718 m!829249))

(check-sat (not start!75718) (not b_next!15577) tp_is_empty!17905 (not b!889617) b_and!25827 (not mapNonEmpty!28398))
(check-sat b_and!25827 (not b_next!15577))
