; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75468 () Bool)

(assert start!75468)

(declare-fun b!887979 () Bool)

(declare-fun b_free!15499 () Bool)

(declare-fun b_next!15499 () Bool)

(assert (=> b!887979 (= b_free!15499 (not b_next!15499))))

(declare-fun tp!54431 () Bool)

(declare-fun b_and!25715 () Bool)

(assert (=> b!887979 (= tp!54431 b_and!25715)))

(declare-fun b!887976 () Bool)

(declare-fun e!494471 () Bool)

(declare-fun tp_is_empty!17827 () Bool)

(assert (=> b!887976 (= e!494471 tp_is_empty!17827)))

(declare-fun res!602400 () Bool)

(declare-fun e!494477 () Bool)

(assert (=> start!75468 (=> (not res!602400) (not e!494477))))

(declare-datatypes ((V!28735 0))(
  ( (V!28736 (val!8964 Int)) )
))
(declare-datatypes ((ValueCell!8432 0))(
  ( (ValueCellFull!8432 (v!11408 V!28735)) (EmptyCell!8432) )
))
(declare-datatypes ((array!51653 0))(
  ( (array!51654 (arr!24838 (Array (_ BitVec 32) ValueCell!8432)) (size!25279 (_ BitVec 32))) )
))
(declare-datatypes ((array!51655 0))(
  ( (array!51656 (arr!24839 (Array (_ BitVec 32) (_ BitVec 64))) (size!25280 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3880 0))(
  ( (LongMapFixedSize!3881 (defaultEntry!5128 Int) (mask!25562 (_ BitVec 32)) (extraKeys!4821 (_ BitVec 32)) (zeroValue!4925 V!28735) (minValue!4925 V!28735) (_size!1995 (_ BitVec 32)) (_keys!9831 array!51655) (_values!5112 array!51653) (_vacant!1995 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1040 0))(
  ( (Cell!1041 (v!11409 LongMapFixedSize!3880)) )
))
(declare-datatypes ((LongMap!1040 0))(
  ( (LongMap!1041 (underlying!531 Cell!1040)) )
))
(declare-fun thiss!833 () LongMap!1040)

(declare-fun valid!1521 (LongMap!1040) Bool)

(assert (=> start!75468 (= res!602400 (valid!1521 thiss!833))))

(assert (=> start!75468 e!494477))

(declare-fun e!494474 () Bool)

(assert (=> start!75468 e!494474))

(assert (=> start!75468 true))

(declare-fun b!887977 () Bool)

(declare-fun e!494475 () Bool)

(assert (=> b!887977 (= e!494474 e!494475)))

(declare-fun mapIsEmpty!28260 () Bool)

(declare-fun mapRes!28260 () Bool)

(assert (=> mapIsEmpty!28260 mapRes!28260))

(declare-fun mapNonEmpty!28260 () Bool)

(declare-fun tp!54432 () Bool)

(declare-fun e!494476 () Bool)

(assert (=> mapNonEmpty!28260 (= mapRes!28260 (and tp!54432 e!494476))))

(declare-fun mapValue!28260 () ValueCell!8432)

(declare-fun mapRest!28260 () (Array (_ BitVec 32) ValueCell!8432))

(declare-fun mapKey!28260 () (_ BitVec 32))

(assert (=> mapNonEmpty!28260 (= (arr!24838 (_values!5112 (v!11409 (underlying!531 thiss!833)))) (store mapRest!28260 mapKey!28260 mapValue!28260))))

(declare-fun b!887978 () Bool)

(declare-fun e!494478 () Bool)

(assert (=> b!887978 (= e!494475 e!494478)))

(declare-fun e!494472 () Bool)

(declare-fun array_inv!19592 (array!51655) Bool)

(declare-fun array_inv!19593 (array!51653) Bool)

(assert (=> b!887979 (= e!494478 (and tp!54431 tp_is_empty!17827 (array_inv!19592 (_keys!9831 (v!11409 (underlying!531 thiss!833)))) (array_inv!19593 (_values!5112 (v!11409 (underlying!531 thiss!833)))) e!494472))))

(declare-fun b!887980 () Bool)

(assert (=> b!887980 (= e!494476 tp_is_empty!17827)))

(declare-fun b!887981 () Bool)

(assert (=> b!887981 (= e!494477 false)))

(declare-fun lt!401546 () V!28735)

(declare-fun key!673 () (_ BitVec 64))

(declare-fun apply!387 (LongMapFixedSize!3880 (_ BitVec 64)) V!28735)

(assert (=> b!887981 (= lt!401546 (apply!387 (v!11409 (underlying!531 thiss!833)) key!673))))

(declare-fun b!887982 () Bool)

(assert (=> b!887982 (= e!494472 (and e!494471 mapRes!28260))))

(declare-fun condMapEmpty!28260 () Bool)

(declare-fun mapDefault!28260 () ValueCell!8432)

(assert (=> b!887982 (= condMapEmpty!28260 (= (arr!24838 (_values!5112 (v!11409 (underlying!531 thiss!833)))) ((as const (Array (_ BitVec 32) ValueCell!8432)) mapDefault!28260)))))

(assert (= (and start!75468 res!602400) b!887981))

(assert (= (and b!887982 condMapEmpty!28260) mapIsEmpty!28260))

(assert (= (and b!887982 (not condMapEmpty!28260)) mapNonEmpty!28260))

(get-info :version)

(assert (= (and mapNonEmpty!28260 ((_ is ValueCellFull!8432) mapValue!28260)) b!887980))

(assert (= (and b!887982 ((_ is ValueCellFull!8432) mapDefault!28260)) b!887976))

(assert (= b!887979 b!887982))

(assert (= b!887978 b!887979))

(assert (= b!887977 b!887978))

(assert (= start!75468 b!887977))

(declare-fun m!828135 () Bool)

(assert (=> start!75468 m!828135))

(declare-fun m!828137 () Bool)

(assert (=> mapNonEmpty!28260 m!828137))

(declare-fun m!828139 () Bool)

(assert (=> b!887979 m!828139))

(declare-fun m!828141 () Bool)

(assert (=> b!887979 m!828141))

(declare-fun m!828143 () Bool)

(assert (=> b!887981 m!828143))

(check-sat (not start!75468) b_and!25715 tp_is_empty!17827 (not b!887981) (not b!887979) (not mapNonEmpty!28260) (not b_next!15499))
(check-sat b_and!25715 (not b_next!15499))
