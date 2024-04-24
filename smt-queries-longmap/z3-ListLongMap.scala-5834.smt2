; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75474 () Bool)

(assert start!75474)

(declare-fun b!888044 () Bool)

(declare-fun b_free!15505 () Bool)

(declare-fun b_next!15505 () Bool)

(assert (=> b!888044 (= b_free!15505 (not b_next!15505))))

(declare-fun tp!54449 () Bool)

(declare-fun b_and!25721 () Bool)

(assert (=> b!888044 (= tp!54449 b_and!25721)))

(declare-fun b!888039 () Bool)

(declare-fun e!494544 () Bool)

(declare-fun tp_is_empty!17833 () Bool)

(assert (=> b!888039 (= e!494544 tp_is_empty!17833)))

(declare-fun b!888040 () Bool)

(declare-fun e!494543 () Bool)

(declare-fun e!494547 () Bool)

(assert (=> b!888040 (= e!494543 e!494547)))

(declare-fun res!602409 () Bool)

(declare-fun e!494550 () Bool)

(assert (=> start!75474 (=> (not res!602409) (not e!494550))))

(declare-datatypes ((V!28743 0))(
  ( (V!28744 (val!8967 Int)) )
))
(declare-datatypes ((ValueCell!8435 0))(
  ( (ValueCellFull!8435 (v!11414 V!28743)) (EmptyCell!8435) )
))
(declare-datatypes ((array!51665 0))(
  ( (array!51666 (arr!24844 (Array (_ BitVec 32) ValueCell!8435)) (size!25285 (_ BitVec 32))) )
))
(declare-datatypes ((array!51667 0))(
  ( (array!51668 (arr!24845 (Array (_ BitVec 32) (_ BitVec 64))) (size!25286 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3886 0))(
  ( (LongMapFixedSize!3887 (defaultEntry!5131 Int) (mask!25567 (_ BitVec 32)) (extraKeys!4824 (_ BitVec 32)) (zeroValue!4928 V!28743) (minValue!4928 V!28743) (_size!1998 (_ BitVec 32)) (_keys!9834 array!51667) (_values!5115 array!51665) (_vacant!1998 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1046 0))(
  ( (Cell!1047 (v!11415 LongMapFixedSize!3886)) )
))
(declare-datatypes ((LongMap!1046 0))(
  ( (LongMap!1047 (underlying!534 Cell!1046)) )
))
(declare-fun thiss!833 () LongMap!1046)

(declare-fun valid!1523 (LongMap!1046) Bool)

(assert (=> start!75474 (= res!602409 (valid!1523 thiss!833))))

(assert (=> start!75474 e!494550))

(assert (=> start!75474 e!494543))

(assert (=> start!75474 true))

(declare-fun b!888041 () Bool)

(declare-fun e!494549 () Bool)

(assert (=> b!888041 (= e!494547 e!494549)))

(declare-fun b!888042 () Bool)

(declare-fun e!494548 () Bool)

(declare-fun e!494546 () Bool)

(declare-fun mapRes!28269 () Bool)

(assert (=> b!888042 (= e!494548 (and e!494546 mapRes!28269))))

(declare-fun condMapEmpty!28269 () Bool)

(declare-fun mapDefault!28269 () ValueCell!8435)

(assert (=> b!888042 (= condMapEmpty!28269 (= (arr!24844 (_values!5115 (v!11415 (underlying!534 thiss!833)))) ((as const (Array (_ BitVec 32) ValueCell!8435)) mapDefault!28269)))))

(declare-fun b!888043 () Bool)

(assert (=> b!888043 (= e!494546 tp_is_empty!17833)))

(declare-fun array_inv!19598 (array!51667) Bool)

(declare-fun array_inv!19599 (array!51665) Bool)

(assert (=> b!888044 (= e!494549 (and tp!54449 tp_is_empty!17833 (array_inv!19598 (_keys!9834 (v!11415 (underlying!534 thiss!833)))) (array_inv!19599 (_values!5115 (v!11415 (underlying!534 thiss!833)))) e!494548))))

(declare-fun mapIsEmpty!28269 () Bool)

(assert (=> mapIsEmpty!28269 mapRes!28269))

(declare-fun mapNonEmpty!28269 () Bool)

(declare-fun tp!54450 () Bool)

(assert (=> mapNonEmpty!28269 (= mapRes!28269 (and tp!54450 e!494544))))

(declare-fun mapKey!28269 () (_ BitVec 32))

(declare-fun mapRest!28269 () (Array (_ BitVec 32) ValueCell!8435))

(declare-fun mapValue!28269 () ValueCell!8435)

(assert (=> mapNonEmpty!28269 (= (arr!24844 (_values!5115 (v!11415 (underlying!534 thiss!833)))) (store mapRest!28269 mapKey!28269 mapValue!28269))))

(declare-fun b!888045 () Bool)

(assert (=> b!888045 (= e!494550 false)))

(declare-fun lt!401557 () Bool)

(declare-fun key!673 () (_ BitVec 64))

(declare-fun contains!4281 (LongMap!1046 (_ BitVec 64)) Bool)

(assert (=> b!888045 (= lt!401557 (contains!4281 thiss!833 key!673))))

(declare-fun lt!401558 () V!28743)

(declare-fun apply!389 (LongMapFixedSize!3886 (_ BitVec 64)) V!28743)

(assert (=> b!888045 (= lt!401558 (apply!389 (v!11415 (underlying!534 thiss!833)) key!673))))

(assert (= (and start!75474 res!602409) b!888045))

(assert (= (and b!888042 condMapEmpty!28269) mapIsEmpty!28269))

(assert (= (and b!888042 (not condMapEmpty!28269)) mapNonEmpty!28269))

(get-info :version)

(assert (= (and mapNonEmpty!28269 ((_ is ValueCellFull!8435) mapValue!28269)) b!888039))

(assert (= (and b!888042 ((_ is ValueCellFull!8435) mapDefault!28269)) b!888043))

(assert (= b!888044 b!888042))

(assert (= b!888041 b!888044))

(assert (= b!888040 b!888041))

(assert (= start!75474 b!888040))

(declare-fun m!828165 () Bool)

(assert (=> start!75474 m!828165))

(declare-fun m!828167 () Bool)

(assert (=> b!888044 m!828167))

(declare-fun m!828169 () Bool)

(assert (=> b!888044 m!828169))

(declare-fun m!828171 () Bool)

(assert (=> mapNonEmpty!28269 m!828171))

(declare-fun m!828173 () Bool)

(assert (=> b!888045 m!828173))

(declare-fun m!828175 () Bool)

(assert (=> b!888045 m!828175))

(check-sat (not b!888044) (not b!888045) tp_is_empty!17833 (not start!75474) b_and!25721 (not b_next!15505) (not mapNonEmpty!28269))
(check-sat b_and!25721 (not b_next!15505))
