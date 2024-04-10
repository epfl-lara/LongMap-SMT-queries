; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75496 () Bool)

(assert start!75496)

(declare-fun b!888383 () Bool)

(declare-fun b_free!15567 () Bool)

(declare-fun b_next!15567 () Bool)

(assert (=> b!888383 (= b_free!15567 (not b_next!15567))))

(declare-fun tp!54652 () Bool)

(declare-fun b_and!25805 () Bool)

(assert (=> b!888383 (= tp!54652 b_and!25805)))

(declare-datatypes ((array!51760 0))(
  ( (array!51761 (arr!24891 (Array (_ BitVec 32) (_ BitVec 64))) (size!25332 (_ BitVec 32))) )
))
(declare-datatypes ((V!28825 0))(
  ( (V!28826 (val!8998 Int)) )
))
(declare-datatypes ((ValueCell!8466 0))(
  ( (ValueCellFull!8466 (v!11471 V!28825)) (EmptyCell!8466) )
))
(declare-datatypes ((array!51762 0))(
  ( (array!51763 (arr!24892 (Array (_ BitVec 32) ValueCell!8466)) (size!25333 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3948 0))(
  ( (LongMapFixedSize!3949 (defaultEntry!5168 Int) (mask!25588 (_ BitVec 32)) (extraKeys!4862 (_ BitVec 32)) (zeroValue!4966 V!28825) (minValue!4966 V!28825) (_size!2029 (_ BitVec 32)) (_keys!9847 array!51760) (_values!5153 array!51762) (_vacant!2029 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3948)

(declare-fun e!495002 () Bool)

(declare-fun e!494997 () Bool)

(declare-fun tp_is_empty!17895 () Bool)

(declare-fun array_inv!19588 (array!51760) Bool)

(declare-fun array_inv!19589 (array!51762) Bool)

(assert (=> b!888383 (= e!494997 (and tp!54652 tp_is_empty!17895 (array_inv!19588 (_keys!9847 thiss!1181)) (array_inv!19589 (_values!5153 thiss!1181)) e!495002))))

(declare-fun mapIsEmpty!28379 () Bool)

(declare-fun mapRes!28379 () Bool)

(assert (=> mapIsEmpty!28379 mapRes!28379))

(declare-fun b!888384 () Bool)

(declare-fun res!602357 () Bool)

(declare-fun e!494999 () Bool)

(assert (=> b!888384 (=> (not res!602357) (not e!494999))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!888384 (= res!602357 (and (= key!785 (bvneg key!785)) (or (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!4862 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4862 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!888385 () Bool)

(declare-fun e!495000 () Bool)

(assert (=> b!888385 (= e!495000 tp_is_empty!17895)))

(declare-fun mapNonEmpty!28379 () Bool)

(declare-fun tp!54651 () Bool)

(declare-fun e!494998 () Bool)

(assert (=> mapNonEmpty!28379 (= mapRes!28379 (and tp!54651 e!494998))))

(declare-fun mapKey!28379 () (_ BitVec 32))

(declare-fun mapValue!28379 () ValueCell!8466)

(declare-fun mapRest!28379 () (Array (_ BitVec 32) ValueCell!8466))

(assert (=> mapNonEmpty!28379 (= (arr!24892 (_values!5153 thiss!1181)) (store mapRest!28379 mapKey!28379 mapValue!28379))))

(declare-fun b!888386 () Bool)

(assert (=> b!888386 (= e!495002 (and e!495000 mapRes!28379))))

(declare-fun condMapEmpty!28379 () Bool)

(declare-fun mapDefault!28379 () ValueCell!8466)

(assert (=> b!888386 (= condMapEmpty!28379 (= (arr!24892 (_values!5153 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8466)) mapDefault!28379)))))

(declare-fun b!888388 () Bool)

(assert (=> b!888388 (= e!494999 false)))

(declare-fun lt!401727 () Bool)

(declare-fun contains!4321 (LongMapFixedSize!3948 (_ BitVec 64)) Bool)

(assert (=> b!888388 (= lt!401727 (contains!4321 thiss!1181 key!785))))

(declare-fun b!888387 () Bool)

(assert (=> b!888387 (= e!494998 tp_is_empty!17895)))

(declare-fun res!602356 () Bool)

(assert (=> start!75496 (=> (not res!602356) (not e!494999))))

(declare-fun valid!1540 (LongMapFixedSize!3948) Bool)

(assert (=> start!75496 (= res!602356 (valid!1540 thiss!1181))))

(assert (=> start!75496 e!494999))

(assert (=> start!75496 e!494997))

(assert (=> start!75496 true))

(assert (= (and start!75496 res!602356) b!888384))

(assert (= (and b!888384 res!602357) b!888388))

(assert (= (and b!888386 condMapEmpty!28379) mapIsEmpty!28379))

(assert (= (and b!888386 (not condMapEmpty!28379)) mapNonEmpty!28379))

(get-info :version)

(assert (= (and mapNonEmpty!28379 ((_ is ValueCellFull!8466) mapValue!28379)) b!888387))

(assert (= (and b!888386 ((_ is ValueCellFull!8466) mapDefault!28379)) b!888385))

(assert (= b!888383 b!888386))

(assert (= start!75496 b!888383))

(declare-fun m!827709 () Bool)

(assert (=> b!888383 m!827709))

(declare-fun m!827711 () Bool)

(assert (=> b!888383 m!827711))

(declare-fun m!827713 () Bool)

(assert (=> mapNonEmpty!28379 m!827713))

(declare-fun m!827715 () Bool)

(assert (=> b!888388 m!827715))

(declare-fun m!827717 () Bool)

(assert (=> start!75496 m!827717))

(check-sat (not b!888388) (not start!75496) b_and!25805 (not b_next!15567) (not b!888383) (not mapNonEmpty!28379) tp_is_empty!17895)
(check-sat b_and!25805 (not b_next!15567))
