; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75656 () Bool)

(assert start!75656)

(declare-fun b!889230 () Bool)

(declare-fun b_free!15559 () Bool)

(declare-fun b_next!15559 () Bool)

(assert (=> b!889230 (= b_free!15559 (not b_next!15559))))

(declare-fun tp!54628 () Bool)

(declare-fun b_and!25807 () Bool)

(assert (=> b!889230 (= tp!54628 b_and!25807)))

(declare-fun b!889228 () Bool)

(declare-fun e!495515 () Bool)

(declare-fun tp_is_empty!17887 () Bool)

(assert (=> b!889228 (= e!495515 tp_is_empty!17887)))

(declare-fun lt!402076 () Bool)

(declare-datatypes ((array!51783 0))(
  ( (array!51784 (arr!24898 (Array (_ BitVec 32) (_ BitVec 64))) (size!25340 (_ BitVec 32))) )
))
(declare-datatypes ((V!28815 0))(
  ( (V!28816 (val!8994 Int)) )
))
(declare-datatypes ((ValueCell!8462 0))(
  ( (ValueCellFull!8462 (v!11464 V!28815)) (EmptyCell!8462) )
))
(declare-datatypes ((array!51785 0))(
  ( (array!51786 (arr!24899 (Array (_ BitVec 32) ValueCell!8462)) (size!25341 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3940 0))(
  ( (LongMapFixedSize!3941 (defaultEntry!5164 Int) (mask!25625 (_ BitVec 32)) (extraKeys!4858 (_ BitVec 32)) (zeroValue!4962 V!28815) (minValue!4962 V!28815) (_size!2025 (_ BitVec 32)) (_keys!9871 array!51783) (_values!5149 array!51785) (_vacant!2025 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3940)

(declare-fun valid!1547 (LongMapFixedSize!3940) Bool)

(assert (=> start!75656 (= lt!402076 (valid!1547 thiss!1181))))

(assert (=> start!75656 false))

(declare-fun e!495514 () Bool)

(assert (=> start!75656 e!495514))

(declare-fun b!889229 () Bool)

(declare-fun e!495517 () Bool)

(assert (=> b!889229 (= e!495517 tp_is_empty!17887)))

(declare-fun mapNonEmpty!28367 () Bool)

(declare-fun mapRes!28367 () Bool)

(declare-fun tp!54629 () Bool)

(assert (=> mapNonEmpty!28367 (= mapRes!28367 (and tp!54629 e!495515))))

(declare-fun mapValue!28367 () ValueCell!8462)

(declare-fun mapKey!28367 () (_ BitVec 32))

(declare-fun mapRest!28367 () (Array (_ BitVec 32) ValueCell!8462))

(assert (=> mapNonEmpty!28367 (= (arr!24899 (_values!5149 thiss!1181)) (store mapRest!28367 mapKey!28367 mapValue!28367))))

(declare-fun e!495516 () Bool)

(declare-fun array_inv!19632 (array!51783) Bool)

(declare-fun array_inv!19633 (array!51785) Bool)

(assert (=> b!889230 (= e!495514 (and tp!54628 tp_is_empty!17887 (array_inv!19632 (_keys!9871 thiss!1181)) (array_inv!19633 (_values!5149 thiss!1181)) e!495516))))

(declare-fun b!889231 () Bool)

(assert (=> b!889231 (= e!495516 (and e!495517 mapRes!28367))))

(declare-fun condMapEmpty!28367 () Bool)

(declare-fun mapDefault!28367 () ValueCell!8462)

(assert (=> b!889231 (= condMapEmpty!28367 (= (arr!24899 (_values!5149 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8462)) mapDefault!28367)))))

(declare-fun mapIsEmpty!28367 () Bool)

(assert (=> mapIsEmpty!28367 mapRes!28367))

(assert (= (and b!889231 condMapEmpty!28367) mapIsEmpty!28367))

(assert (= (and b!889231 (not condMapEmpty!28367)) mapNonEmpty!28367))

(get-info :version)

(assert (= (and mapNonEmpty!28367 ((_ is ValueCellFull!8462) mapValue!28367)) b!889228))

(assert (= (and b!889231 ((_ is ValueCellFull!8462) mapDefault!28367)) b!889229))

(assert (= b!889230 b!889231))

(assert (= start!75656 b!889230))

(declare-fun m!828969 () Bool)

(assert (=> start!75656 m!828969))

(declare-fun m!828971 () Bool)

(assert (=> mapNonEmpty!28367 m!828971))

(declare-fun m!828973 () Bool)

(assert (=> b!889230 m!828973))

(declare-fun m!828975 () Bool)

(assert (=> b!889230 m!828975))

(check-sat b_and!25807 tp_is_empty!17887 (not start!75656) (not b_next!15559) (not b!889230) (not mapNonEmpty!28367))
(check-sat b_and!25807 (not b_next!15559))
