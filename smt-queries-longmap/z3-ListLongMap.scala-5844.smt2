; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75476 () Bool)

(assert start!75476)

(declare-fun b!888131 () Bool)

(declare-fun b_free!15565 () Bool)

(declare-fun b_next!15565 () Bool)

(assert (=> b!888131 (= b_free!15565 (not b_next!15565))))

(declare-fun tp!54646 () Bool)

(declare-fun b_and!25777 () Bool)

(assert (=> b!888131 (= tp!54646 b_and!25777)))

(declare-fun mapNonEmpty!28376 () Bool)

(declare-fun mapRes!28376 () Bool)

(declare-fun tp!54647 () Bool)

(declare-fun e!494833 () Bool)

(assert (=> mapNonEmpty!28376 (= mapRes!28376 (and tp!54647 e!494833))))

(declare-datatypes ((V!28823 0))(
  ( (V!28824 (val!8997 Int)) )
))
(declare-datatypes ((ValueCell!8465 0))(
  ( (ValueCellFull!8465 (v!11464 V!28823)) (EmptyCell!8465) )
))
(declare-fun mapValue!28376 () ValueCell!8465)

(declare-fun mapKey!28376 () (_ BitVec 32))

(declare-fun mapRest!28376 () (Array (_ BitVec 32) ValueCell!8465))

(declare-datatypes ((array!51739 0))(
  ( (array!51740 (arr!24881 (Array (_ BitVec 32) (_ BitVec 64))) (size!25324 (_ BitVec 32))) )
))
(declare-datatypes ((array!51741 0))(
  ( (array!51742 (arr!24882 (Array (_ BitVec 32) ValueCell!8465)) (size!25325 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3946 0))(
  ( (LongMapFixedSize!3947 (defaultEntry!5167 Int) (mask!25580 (_ BitVec 32)) (extraKeys!4861 (_ BitVec 32)) (zeroValue!4965 V!28823) (minValue!4965 V!28823) (_size!2028 (_ BitVec 32)) (_keys!9841 array!51739) (_values!5152 array!51741) (_vacant!2028 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3946)

(assert (=> mapNonEmpty!28376 (= (arr!24882 (_values!5152 thiss!1181)) (store mapRest!28376 mapKey!28376 mapValue!28376))))

(declare-fun b!888126 () Bool)

(declare-fun e!494832 () Bool)

(declare-fun tp_is_empty!17893 () Bool)

(assert (=> b!888126 (= e!494832 tp_is_empty!17893)))

(declare-fun b!888128 () Bool)

(assert (=> b!888128 (= e!494833 tp_is_empty!17893)))

(declare-fun b!888129 () Bool)

(declare-fun res!602240 () Bool)

(declare-fun e!494834 () Bool)

(assert (=> b!888129 (=> (not res!602240) (not e!494834))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!888129 (= res!602240 (and (= key!785 (bvneg key!785)) (or (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!4861 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4861 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!888130 () Bool)

(assert (=> b!888130 (= e!494834 false)))

(declare-fun lt!401488 () Bool)

(declare-fun contains!4296 (LongMapFixedSize!3946 (_ BitVec 64)) Bool)

(assert (=> b!888130 (= lt!401488 (contains!4296 thiss!1181 key!785))))

(declare-fun e!494836 () Bool)

(declare-fun e!494835 () Bool)

(declare-fun array_inv!19626 (array!51739) Bool)

(declare-fun array_inv!19627 (array!51741) Bool)

(assert (=> b!888131 (= e!494835 (and tp!54646 tp_is_empty!17893 (array_inv!19626 (_keys!9841 thiss!1181)) (array_inv!19627 (_values!5152 thiss!1181)) e!494836))))

(declare-fun mapIsEmpty!28376 () Bool)

(assert (=> mapIsEmpty!28376 mapRes!28376))

(declare-fun b!888127 () Bool)

(assert (=> b!888127 (= e!494836 (and e!494832 mapRes!28376))))

(declare-fun condMapEmpty!28376 () Bool)

(declare-fun mapDefault!28376 () ValueCell!8465)

(assert (=> b!888127 (= condMapEmpty!28376 (= (arr!24882 (_values!5152 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8465)) mapDefault!28376)))))

(declare-fun res!602241 () Bool)

(assert (=> start!75476 (=> (not res!602241) (not e!494834))))

(declare-fun valid!1547 (LongMapFixedSize!3946) Bool)

(assert (=> start!75476 (= res!602241 (valid!1547 thiss!1181))))

(assert (=> start!75476 e!494834))

(assert (=> start!75476 e!494835))

(assert (=> start!75476 true))

(assert (= (and start!75476 res!602241) b!888129))

(assert (= (and b!888129 res!602240) b!888130))

(assert (= (and b!888127 condMapEmpty!28376) mapIsEmpty!28376))

(assert (= (and b!888127 (not condMapEmpty!28376)) mapNonEmpty!28376))

(get-info :version)

(assert (= (and mapNonEmpty!28376 ((_ is ValueCellFull!8465) mapValue!28376)) b!888128))

(assert (= (and b!888127 ((_ is ValueCellFull!8465) mapDefault!28376)) b!888126))

(assert (= b!888131 b!888127))

(assert (= start!75476 b!888131))

(declare-fun m!826941 () Bool)

(assert (=> mapNonEmpty!28376 m!826941))

(declare-fun m!826943 () Bool)

(assert (=> b!888130 m!826943))

(declare-fun m!826945 () Bool)

(assert (=> b!888131 m!826945))

(declare-fun m!826947 () Bool)

(assert (=> b!888131 m!826947))

(declare-fun m!826949 () Bool)

(assert (=> start!75476 m!826949))

(check-sat (not start!75476) (not b!888130) tp_is_empty!17893 (not mapNonEmpty!28376) (not b_next!15565) b_and!25777 (not b!888131))
(check-sat b_and!25777 (not b_next!15565))
