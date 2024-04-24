; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75570 () Bool)

(assert start!75570)

(declare-fun b!888672 () Bool)

(declare-fun b_free!15529 () Bool)

(declare-fun b_next!15529 () Bool)

(assert (=> b!888672 (= b_free!15529 (not b_next!15529))))

(declare-fun tp!54532 () Bool)

(declare-fun b_and!25775 () Bool)

(assert (=> b!888672 (= tp!54532 b_and!25775)))

(declare-fun e!495058 () Bool)

(declare-datatypes ((V!28775 0))(
  ( (V!28776 (val!8979 Int)) )
))
(declare-datatypes ((array!51719 0))(
  ( (array!51720 (arr!24868 (Array (_ BitVec 32) (_ BitVec 64))) (size!25309 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!8447 0))(
  ( (ValueCellFull!8447 (v!11441 V!28775)) (EmptyCell!8447) )
))
(declare-datatypes ((array!51721 0))(
  ( (array!51722 (arr!24869 (Array (_ BitVec 32) ValueCell!8447)) (size!25310 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3910 0))(
  ( (LongMapFixedSize!3911 (defaultEntry!5146 Int) (mask!25593 (_ BitVec 32)) (extraKeys!4840 (_ BitVec 32)) (zeroValue!4944 V!28775) (minValue!4944 V!28775) (_size!2010 (_ BitVec 32)) (_keys!9851 array!51719) (_values!5131 array!51721) (_vacant!2010 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1070 0))(
  ( (Cell!1071 (v!11442 LongMapFixedSize!3910)) )
))
(declare-datatypes ((LongMap!1070 0))(
  ( (LongMap!1071 (underlying!546 Cell!1070)) )
))
(declare-fun thiss!821 () LongMap!1070)

(declare-fun tp_is_empty!17857 () Bool)

(declare-fun e!495060 () Bool)

(declare-fun array_inv!19612 (array!51719) Bool)

(declare-fun array_inv!19613 (array!51721) Bool)

(assert (=> b!888672 (= e!495058 (and tp!54532 tp_is_empty!17857 (array_inv!19612 (_keys!9851 (v!11442 (underlying!546 thiss!821)))) (array_inv!19613 (_values!5131 (v!11442 (underlying!546 thiss!821)))) e!495060))))

(declare-fun mapNonEmpty!28315 () Bool)

(declare-fun mapRes!28315 () Bool)

(declare-fun tp!54531 () Bool)

(declare-fun e!495059 () Bool)

(assert (=> mapNonEmpty!28315 (= mapRes!28315 (and tp!54531 e!495059))))

(declare-fun mapKey!28315 () (_ BitVec 32))

(declare-fun mapRest!28315 () (Array (_ BitVec 32) ValueCell!8447))

(declare-fun mapValue!28315 () ValueCell!8447)

(assert (=> mapNonEmpty!28315 (= (arr!24869 (_values!5131 (v!11442 (underlying!546 thiss!821)))) (store mapRest!28315 mapKey!28315 mapValue!28315))))

(declare-fun b!888673 () Bool)

(declare-fun e!495064 () Bool)

(declare-fun e!495061 () Bool)

(assert (=> b!888673 (= e!495064 e!495061)))

(declare-fun res!602548 () Bool)

(declare-fun e!495062 () Bool)

(assert (=> start!75570 (=> (not res!602548) (not e!495062))))

(declare-fun valid!1534 (LongMap!1070) Bool)

(assert (=> start!75570 (= res!602548 (valid!1534 thiss!821))))

(assert (=> start!75570 e!495062))

(assert (=> start!75570 e!495064))

(assert (=> start!75570 true))

(declare-fun b!888674 () Bool)

(assert (=> b!888674 (= e!495062 false)))

(declare-fun lt!401817 () Bool)

(declare-fun key!666 () (_ BitVec 64))

(declare-fun contains!4289 (LongMapFixedSize!3910 (_ BitVec 64)) Bool)

(assert (=> b!888674 (= lt!401817 (contains!4289 (v!11442 (underlying!546 thiss!821)) key!666))))

(declare-fun b!888675 () Bool)

(assert (=> b!888675 (= e!495061 e!495058)))

(declare-fun b!888676 () Bool)

(declare-fun e!495065 () Bool)

(assert (=> b!888676 (= e!495065 tp_is_empty!17857)))

(declare-fun b!888677 () Bool)

(assert (=> b!888677 (= e!495059 tp_is_empty!17857)))

(declare-fun mapIsEmpty!28315 () Bool)

(assert (=> mapIsEmpty!28315 mapRes!28315))

(declare-fun b!888678 () Bool)

(assert (=> b!888678 (= e!495060 (and e!495065 mapRes!28315))))

(declare-fun condMapEmpty!28315 () Bool)

(declare-fun mapDefault!28315 () ValueCell!8447)

(assert (=> b!888678 (= condMapEmpty!28315 (= (arr!24869 (_values!5131 (v!11442 (underlying!546 thiss!821)))) ((as const (Array (_ BitVec 32) ValueCell!8447)) mapDefault!28315)))))

(assert (= (and start!75570 res!602548) b!888674))

(assert (= (and b!888678 condMapEmpty!28315) mapIsEmpty!28315))

(assert (= (and b!888678 (not condMapEmpty!28315)) mapNonEmpty!28315))

(get-info :version)

(assert (= (and mapNonEmpty!28315 ((_ is ValueCellFull!8447) mapValue!28315)) b!888677))

(assert (= (and b!888678 ((_ is ValueCellFull!8447) mapDefault!28315)) b!888676))

(assert (= b!888672 b!888678))

(assert (= b!888675 b!888672))

(assert (= b!888673 b!888675))

(assert (= start!75570 b!888673))

(declare-fun m!828583 () Bool)

(assert (=> b!888672 m!828583))

(declare-fun m!828585 () Bool)

(assert (=> b!888672 m!828585))

(declare-fun m!828587 () Bool)

(assert (=> mapNonEmpty!28315 m!828587))

(declare-fun m!828589 () Bool)

(assert (=> start!75570 m!828589))

(declare-fun m!828591 () Bool)

(assert (=> b!888674 m!828591))

(check-sat b_and!25775 (not mapNonEmpty!28315) (not b_next!15529) tp_is_empty!17857 (not b!888672) (not start!75570) (not b!888674))
(check-sat b_and!25775 (not b_next!15529))
