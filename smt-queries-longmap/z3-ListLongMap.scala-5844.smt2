; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75662 () Bool)

(assert start!75662)

(declare-fun b!889272 () Bool)

(declare-fun b_free!15565 () Bool)

(declare-fun b_next!15565 () Bool)

(assert (=> b!889272 (= b_free!15565 (not b_next!15565))))

(declare-fun tp!54646 () Bool)

(declare-fun b_and!25813 () Bool)

(assert (=> b!889272 (= tp!54646 b_and!25813)))

(declare-fun b!889268 () Bool)

(declare-fun e!495563 () Bool)

(declare-fun e!495566 () Bool)

(declare-fun mapRes!28376 () Bool)

(assert (=> b!889268 (= e!495563 (and e!495566 mapRes!28376))))

(declare-fun condMapEmpty!28376 () Bool)

(declare-datatypes ((array!51795 0))(
  ( (array!51796 (arr!24904 (Array (_ BitVec 32) (_ BitVec 64))) (size!25346 (_ BitVec 32))) )
))
(declare-datatypes ((V!28823 0))(
  ( (V!28824 (val!8997 Int)) )
))
(declare-datatypes ((ValueCell!8465 0))(
  ( (ValueCellFull!8465 (v!11467 V!28823)) (EmptyCell!8465) )
))
(declare-datatypes ((array!51797 0))(
  ( (array!51798 (arr!24905 (Array (_ BitVec 32) ValueCell!8465)) (size!25347 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3946 0))(
  ( (LongMapFixedSize!3947 (defaultEntry!5167 Int) (mask!25630 (_ BitVec 32)) (extraKeys!4861 (_ BitVec 32)) (zeroValue!4965 V!28823) (minValue!4965 V!28823) (_size!2028 (_ BitVec 32)) (_keys!9874 array!51795) (_values!5152 array!51797) (_vacant!2028 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3946)

(declare-fun mapDefault!28376 () ValueCell!8465)

(assert (=> b!889268 (= condMapEmpty!28376 (= (arr!24905 (_values!5152 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8465)) mapDefault!28376)))))

(declare-fun b!889269 () Bool)

(declare-fun tp_is_empty!17893 () Bool)

(assert (=> b!889269 (= e!495566 tp_is_empty!17893)))

(declare-fun b!889270 () Bool)

(declare-fun e!495564 () Bool)

(assert (=> b!889270 (= e!495564 false)))

(declare-fun lt!402085 () Bool)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4298 (LongMapFixedSize!3946 (_ BitVec 64)) Bool)

(assert (=> b!889270 (= lt!402085 (contains!4298 thiss!1181 key!785))))

(declare-fun mapNonEmpty!28376 () Bool)

(declare-fun tp!54647 () Bool)

(declare-fun e!495565 () Bool)

(assert (=> mapNonEmpty!28376 (= mapRes!28376 (and tp!54647 e!495565))))

(declare-fun mapKey!28376 () (_ BitVec 32))

(declare-fun mapRest!28376 () (Array (_ BitVec 32) ValueCell!8465))

(declare-fun mapValue!28376 () ValueCell!8465)

(assert (=> mapNonEmpty!28376 (= (arr!24905 (_values!5152 thiss!1181)) (store mapRest!28376 mapKey!28376 mapValue!28376))))

(declare-fun mapIsEmpty!28376 () Bool)

(assert (=> mapIsEmpty!28376 mapRes!28376))

(declare-fun b!889271 () Bool)

(declare-fun res!602694 () Bool)

(assert (=> b!889271 (=> (not res!602694) (not e!495564))))

(assert (=> b!889271 (= res!602694 (and (= key!785 (bvneg key!785)) (or (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!4861 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4861 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!602695 () Bool)

(assert (=> start!75662 (=> (not res!602695) (not e!495564))))

(declare-fun valid!1549 (LongMapFixedSize!3946) Bool)

(assert (=> start!75662 (= res!602695 (valid!1549 thiss!1181))))

(assert (=> start!75662 e!495564))

(declare-fun e!495561 () Bool)

(assert (=> start!75662 e!495561))

(assert (=> start!75662 true))

(declare-fun array_inv!19636 (array!51795) Bool)

(declare-fun array_inv!19637 (array!51797) Bool)

(assert (=> b!889272 (= e!495561 (and tp!54646 tp_is_empty!17893 (array_inv!19636 (_keys!9874 thiss!1181)) (array_inv!19637 (_values!5152 thiss!1181)) e!495563))))

(declare-fun b!889273 () Bool)

(assert (=> b!889273 (= e!495565 tp_is_empty!17893)))

(assert (= (and start!75662 res!602695) b!889271))

(assert (= (and b!889271 res!602694) b!889270))

(assert (= (and b!889268 condMapEmpty!28376) mapIsEmpty!28376))

(assert (= (and b!889268 (not condMapEmpty!28376)) mapNonEmpty!28376))

(get-info :version)

(assert (= (and mapNonEmpty!28376 ((_ is ValueCellFull!8465) mapValue!28376)) b!889273))

(assert (= (and b!889268 ((_ is ValueCellFull!8465) mapDefault!28376)) b!889269))

(assert (= b!889272 b!889268))

(assert (= start!75662 b!889272))

(declare-fun m!828993 () Bool)

(assert (=> b!889270 m!828993))

(declare-fun m!828995 () Bool)

(assert (=> mapNonEmpty!28376 m!828995))

(declare-fun m!828997 () Bool)

(assert (=> start!75662 m!828997))

(declare-fun m!828999 () Bool)

(assert (=> b!889272 m!828999))

(declare-fun m!829001 () Bool)

(assert (=> b!889272 m!829001))

(check-sat (not start!75662) (not b_next!15565) b_and!25813 tp_is_empty!17893 (not mapNonEmpty!28376) (not b!889272) (not b!889270))
(check-sat b_and!25813 (not b_next!15565))
