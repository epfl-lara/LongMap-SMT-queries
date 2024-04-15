; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75532 () Bool)

(assert start!75532)

(declare-fun b!888476 () Bool)

(declare-fun b_free!15577 () Bool)

(declare-fun b_next!15577 () Bool)

(assert (=> b!888476 (= b_free!15577 (not b_next!15577))))

(declare-fun tp!54686 () Bool)

(declare-fun b_and!25791 () Bool)

(assert (=> b!888476 (= tp!54686 b_and!25791)))

(declare-fun b!888475 () Bool)

(declare-fun e!495075 () Bool)

(declare-fun tp_is_empty!17905 () Bool)

(assert (=> b!888475 (= e!495075 tp_is_empty!17905)))

(declare-fun lt!401672 () Bool)

(declare-datatypes ((array!51765 0))(
  ( (array!51766 (arr!24893 (Array (_ BitVec 32) (_ BitVec 64))) (size!25337 (_ BitVec 32))) )
))
(declare-datatypes ((V!28839 0))(
  ( (V!28840 (val!9003 Int)) )
))
(declare-datatypes ((ValueCell!8471 0))(
  ( (ValueCellFull!8471 (v!11472 V!28839)) (EmptyCell!8471) )
))
(declare-datatypes ((array!51767 0))(
  ( (array!51768 (arr!24894 (Array (_ BitVec 32) ValueCell!8471)) (size!25338 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3958 0))(
  ( (LongMapFixedSize!3959 (defaultEntry!5176 Int) (mask!25597 (_ BitVec 32)) (extraKeys!4870 (_ BitVec 32)) (zeroValue!4974 V!28839) (minValue!4974 V!28839) (_size!2034 (_ BitVec 32)) (_keys!9852 array!51765) (_values!5161 array!51767) (_vacant!2034 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3958)

(declare-fun valid!1550 (LongMapFixedSize!3958) Bool)

(assert (=> start!75532 (= lt!401672 (valid!1550 thiss!1181))))

(assert (=> start!75532 false))

(declare-fun e!495079 () Bool)

(assert (=> start!75532 e!495079))

(declare-fun e!495077 () Bool)

(declare-fun array_inv!19632 (array!51765) Bool)

(declare-fun array_inv!19633 (array!51767) Bool)

(assert (=> b!888476 (= e!495079 (and tp!54686 tp_is_empty!17905 (array_inv!19632 (_keys!9852 thiss!1181)) (array_inv!19633 (_values!5161 thiss!1181)) e!495077))))

(declare-fun b!888477 () Bool)

(declare-fun e!495078 () Bool)

(declare-fun mapRes!28398 () Bool)

(assert (=> b!888477 (= e!495077 (and e!495078 mapRes!28398))))

(declare-fun condMapEmpty!28398 () Bool)

(declare-fun mapDefault!28398 () ValueCell!8471)

(assert (=> b!888477 (= condMapEmpty!28398 (= (arr!24894 (_values!5161 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8471)) mapDefault!28398)))))

(declare-fun mapNonEmpty!28398 () Bool)

(declare-fun tp!54687 () Bool)

(assert (=> mapNonEmpty!28398 (= mapRes!28398 (and tp!54687 e!495075))))

(declare-fun mapRest!28398 () (Array (_ BitVec 32) ValueCell!8471))

(declare-fun mapKey!28398 () (_ BitVec 32))

(declare-fun mapValue!28398 () ValueCell!8471)

(assert (=> mapNonEmpty!28398 (= (arr!24894 (_values!5161 thiss!1181)) (store mapRest!28398 mapKey!28398 mapValue!28398))))

(declare-fun mapIsEmpty!28398 () Bool)

(assert (=> mapIsEmpty!28398 mapRes!28398))

(declare-fun b!888478 () Bool)

(assert (=> b!888478 (= e!495078 tp_is_empty!17905)))

(assert (= (and b!888477 condMapEmpty!28398) mapIsEmpty!28398))

(assert (= (and b!888477 (not condMapEmpty!28398)) mapNonEmpty!28398))

(get-info :version)

(assert (= (and mapNonEmpty!28398 ((_ is ValueCellFull!8471) mapValue!28398)) b!888475))

(assert (= (and b!888477 ((_ is ValueCellFull!8471) mapDefault!28398)) b!888478))

(assert (= b!888476 b!888477))

(assert (= start!75532 b!888476))

(declare-fun m!827191 () Bool)

(assert (=> start!75532 m!827191))

(declare-fun m!827193 () Bool)

(assert (=> b!888476 m!827193))

(declare-fun m!827195 () Bool)

(assert (=> b!888476 m!827195))

(declare-fun m!827197 () Bool)

(assert (=> mapNonEmpty!28398 m!827197))

(check-sat (not b!888476) (not b_next!15577) b_and!25791 tp_is_empty!17905 (not start!75532) (not mapNonEmpty!28398))
(check-sat b_and!25791 (not b_next!15577))
