; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75282 () Bool)

(assert start!75282)

(declare-fun b!886834 () Bool)

(declare-fun b_free!15499 () Bool)

(declare-fun b_next!15499 () Bool)

(assert (=> b!886834 (= b_free!15499 (not b_next!15499))))

(declare-fun tp!54432 () Bool)

(declare-fun b_and!25679 () Bool)

(assert (=> b!886834 (= tp!54432 b_and!25679)))

(declare-fun mapIsEmpty!28260 () Bool)

(declare-fun mapRes!28260 () Bool)

(assert (=> mapIsEmpty!28260 mapRes!28260))

(declare-fun e!493744 () Bool)

(declare-fun tp_is_empty!17827 () Bool)

(declare-fun e!493747 () Bool)

(declare-datatypes ((V!28735 0))(
  ( (V!28736 (val!8964 Int)) )
))
(declare-datatypes ((ValueCell!8432 0))(
  ( (ValueCellFull!8432 (v!11402 V!28735)) (EmptyCell!8432) )
))
(declare-datatypes ((array!51597 0))(
  ( (array!51598 (arr!24815 (Array (_ BitVec 32) ValueCell!8432)) (size!25257 (_ BitVec 32))) )
))
(declare-datatypes ((array!51599 0))(
  ( (array!51600 (arr!24816 (Array (_ BitVec 32) (_ BitVec 64))) (size!25258 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3880 0))(
  ( (LongMapFixedSize!3881 (defaultEntry!5128 Int) (mask!25512 (_ BitVec 32)) (extraKeys!4821 (_ BitVec 32)) (zeroValue!4925 V!28735) (minValue!4925 V!28735) (_size!1995 (_ BitVec 32)) (_keys!9798 array!51599) (_values!5112 array!51597) (_vacant!1995 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1032 0))(
  ( (Cell!1033 (v!11403 LongMapFixedSize!3880)) )
))
(declare-datatypes ((LongMap!1032 0))(
  ( (LongMap!1033 (underlying!527 Cell!1032)) )
))
(declare-fun thiss!833 () LongMap!1032)

(declare-fun array_inv!19586 (array!51599) Bool)

(declare-fun array_inv!19587 (array!51597) Bool)

(assert (=> b!886834 (= e!493744 (and tp!54432 tp_is_empty!17827 (array_inv!19586 (_keys!9798 (v!11403 (underlying!527 thiss!833)))) (array_inv!19587 (_values!5112 (v!11403 (underlying!527 thiss!833)))) e!493747))))

(declare-fun b!886835 () Bool)

(declare-fun e!493742 () Bool)

(assert (=> b!886835 (= e!493742 tp_is_empty!17827)))

(declare-fun mapNonEmpty!28260 () Bool)

(declare-fun tp!54431 () Bool)

(assert (=> mapNonEmpty!28260 (= mapRes!28260 (and tp!54431 e!493742))))

(declare-fun mapRest!28260 () (Array (_ BitVec 32) ValueCell!8432))

(declare-fun mapValue!28260 () ValueCell!8432)

(declare-fun mapKey!28260 () (_ BitVec 32))

(assert (=> mapNonEmpty!28260 (= (arr!24815 (_values!5112 (v!11403 (underlying!527 thiss!833)))) (store mapRest!28260 mapKey!28260 mapValue!28260))))

(declare-fun b!886836 () Bool)

(declare-fun e!493741 () Bool)

(declare-fun e!493746 () Bool)

(assert (=> b!886836 (= e!493741 e!493746)))

(declare-fun res!601946 () Bool)

(declare-fun e!493748 () Bool)

(assert (=> start!75282 (=> (not res!601946) (not e!493748))))

(declare-fun valid!1518 (LongMap!1032) Bool)

(assert (=> start!75282 (= res!601946 (valid!1518 thiss!833))))

(assert (=> start!75282 e!493748))

(assert (=> start!75282 e!493741))

(assert (=> start!75282 true))

(declare-fun b!886837 () Bool)

(assert (=> b!886837 (= e!493748 false)))

(declare-fun lt!400949 () V!28735)

(declare-fun key!673 () (_ BitVec 64))

(declare-fun apply!387 (LongMapFixedSize!3880 (_ BitVec 64)) V!28735)

(assert (=> b!886837 (= lt!400949 (apply!387 (v!11403 (underlying!527 thiss!833)) key!673))))

(declare-fun b!886838 () Bool)

(declare-fun e!493743 () Bool)

(assert (=> b!886838 (= e!493743 tp_is_empty!17827)))

(declare-fun b!886839 () Bool)

(assert (=> b!886839 (= e!493746 e!493744)))

(declare-fun b!886840 () Bool)

(assert (=> b!886840 (= e!493747 (and e!493743 mapRes!28260))))

(declare-fun condMapEmpty!28260 () Bool)

(declare-fun mapDefault!28260 () ValueCell!8432)

(assert (=> b!886840 (= condMapEmpty!28260 (= (arr!24815 (_values!5112 (v!11403 (underlying!527 thiss!833)))) ((as const (Array (_ BitVec 32) ValueCell!8432)) mapDefault!28260)))))

(assert (= (and start!75282 res!601946) b!886837))

(assert (= (and b!886840 condMapEmpty!28260) mapIsEmpty!28260))

(assert (= (and b!886840 (not condMapEmpty!28260)) mapNonEmpty!28260))

(get-info :version)

(assert (= (and mapNonEmpty!28260 ((_ is ValueCellFull!8432) mapValue!28260)) b!886835))

(assert (= (and b!886840 ((_ is ValueCellFull!8432) mapDefault!28260)) b!886838))

(assert (= b!886834 b!886840))

(assert (= b!886839 b!886834))

(assert (= b!886836 b!886839))

(assert (= start!75282 b!886836))

(declare-fun m!826083 () Bool)

(assert (=> b!886834 m!826083))

(declare-fun m!826085 () Bool)

(assert (=> b!886834 m!826085))

(declare-fun m!826087 () Bool)

(assert (=> mapNonEmpty!28260 m!826087))

(declare-fun m!826089 () Bool)

(assert (=> start!75282 m!826089))

(declare-fun m!826091 () Bool)

(assert (=> b!886837 m!826091))

(check-sat (not b!886837) tp_is_empty!17827 (not b!886834) (not b_next!15499) (not mapNonEmpty!28260) (not start!75282) b_and!25679)
(check-sat b_and!25679 (not b_next!15499))
