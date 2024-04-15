; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75470 () Bool)

(assert start!75470)

(declare-fun b!888087 () Bool)

(declare-fun b_free!15559 () Bool)

(declare-fun b_next!15559 () Bool)

(assert (=> b!888087 (= b_free!15559 (not b_next!15559))))

(declare-fun tp!54629 () Bool)

(declare-fun b_and!25771 () Bool)

(assert (=> b!888087 (= tp!54629 b_and!25771)))

(declare-fun b!888086 () Bool)

(declare-fun e!494787 () Bool)

(declare-fun tp_is_empty!17887 () Bool)

(assert (=> b!888086 (= e!494787 tp_is_empty!17887)))

(declare-fun e!494785 () Bool)

(declare-datatypes ((array!51727 0))(
  ( (array!51728 (arr!24875 (Array (_ BitVec 32) (_ BitVec 64))) (size!25318 (_ BitVec 32))) )
))
(declare-datatypes ((V!28815 0))(
  ( (V!28816 (val!8994 Int)) )
))
(declare-datatypes ((ValueCell!8462 0))(
  ( (ValueCellFull!8462 (v!11461 V!28815)) (EmptyCell!8462) )
))
(declare-datatypes ((array!51729 0))(
  ( (array!51730 (arr!24876 (Array (_ BitVec 32) ValueCell!8462)) (size!25319 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3940 0))(
  ( (LongMapFixedSize!3941 (defaultEntry!5164 Int) (mask!25575 (_ BitVec 32)) (extraKeys!4858 (_ BitVec 32)) (zeroValue!4962 V!28815) (minValue!4962 V!28815) (_size!2025 (_ BitVec 32)) (_keys!9838 array!51727) (_values!5149 array!51729) (_vacant!2025 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3940)

(declare-fun e!494788 () Bool)

(declare-fun array_inv!19620 (array!51727) Bool)

(declare-fun array_inv!19621 (array!51729) Bool)

(assert (=> b!888087 (= e!494785 (and tp!54629 tp_is_empty!17887 (array_inv!19620 (_keys!9838 thiss!1181)) (array_inv!19621 (_values!5149 thiss!1181)) e!494788))))

(declare-fun mapIsEmpty!28367 () Bool)

(declare-fun mapRes!28367 () Bool)

(assert (=> mapIsEmpty!28367 mapRes!28367))

(declare-fun lt!401479 () Bool)

(declare-fun valid!1544 (LongMapFixedSize!3940) Bool)

(assert (=> start!75470 (= lt!401479 (valid!1544 thiss!1181))))

(assert (=> start!75470 false))

(assert (=> start!75470 e!494785))

(declare-fun b!888088 () Bool)

(declare-fun e!494784 () Bool)

(assert (=> b!888088 (= e!494788 (and e!494784 mapRes!28367))))

(declare-fun condMapEmpty!28367 () Bool)

(declare-fun mapDefault!28367 () ValueCell!8462)

(assert (=> b!888088 (= condMapEmpty!28367 (= (arr!24876 (_values!5149 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8462)) mapDefault!28367)))))

(declare-fun mapNonEmpty!28367 () Bool)

(declare-fun tp!54628 () Bool)

(assert (=> mapNonEmpty!28367 (= mapRes!28367 (and tp!54628 e!494787))))

(declare-fun mapKey!28367 () (_ BitVec 32))

(declare-fun mapRest!28367 () (Array (_ BitVec 32) ValueCell!8462))

(declare-fun mapValue!28367 () ValueCell!8462)

(assert (=> mapNonEmpty!28367 (= (arr!24876 (_values!5149 thiss!1181)) (store mapRest!28367 mapKey!28367 mapValue!28367))))

(declare-fun b!888089 () Bool)

(assert (=> b!888089 (= e!494784 tp_is_empty!17887)))

(assert (= (and b!888088 condMapEmpty!28367) mapIsEmpty!28367))

(assert (= (and b!888088 (not condMapEmpty!28367)) mapNonEmpty!28367))

(get-info :version)

(assert (= (and mapNonEmpty!28367 ((_ is ValueCellFull!8462) mapValue!28367)) b!888086))

(assert (= (and b!888088 ((_ is ValueCellFull!8462) mapDefault!28367)) b!888089))

(assert (= b!888087 b!888088))

(assert (= start!75470 b!888087))

(declare-fun m!826917 () Bool)

(assert (=> b!888087 m!826917))

(declare-fun m!826919 () Bool)

(assert (=> b!888087 m!826919))

(declare-fun m!826921 () Bool)

(assert (=> start!75470 m!826921))

(declare-fun m!826923 () Bool)

(assert (=> mapNonEmpty!28367 m!826923))

(check-sat (not start!75470) tp_is_empty!17887 (not b!888087) (not b_next!15559) b_and!25771 (not mapNonEmpty!28367))
(check-sat b_and!25771 (not b_next!15559))
