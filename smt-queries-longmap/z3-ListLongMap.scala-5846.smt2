; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75552 () Bool)

(assert start!75552)

(declare-fun b!888728 () Bool)

(declare-fun b_free!15579 () Bool)

(declare-fun b_next!15579 () Bool)

(assert (=> b!888728 (= b_free!15579 (not b_next!15579))))

(declare-fun tp!54692 () Bool)

(declare-fun b_and!25819 () Bool)

(assert (=> b!888728 (= tp!54692 b_and!25819)))

(declare-fun b!888726 () Bool)

(declare-fun e!495240 () Bool)

(declare-fun e!495242 () Bool)

(declare-fun mapRes!28401 () Bool)

(assert (=> b!888726 (= e!495240 (and e!495242 mapRes!28401))))

(declare-fun condMapEmpty!28401 () Bool)

(declare-datatypes ((array!51786 0))(
  ( (array!51787 (arr!24903 (Array (_ BitVec 32) (_ BitVec 64))) (size!25345 (_ BitVec 32))) )
))
(declare-datatypes ((V!28841 0))(
  ( (V!28842 (val!9004 Int)) )
))
(declare-datatypes ((ValueCell!8472 0))(
  ( (ValueCellFull!8472 (v!11480 V!28841)) (EmptyCell!8472) )
))
(declare-datatypes ((array!51788 0))(
  ( (array!51789 (arr!24904 (Array (_ BitVec 32) ValueCell!8472)) (size!25346 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3960 0))(
  ( (LongMapFixedSize!3961 (defaultEntry!5177 Int) (mask!25605 (_ BitVec 32)) (extraKeys!4871 (_ BitVec 32)) (zeroValue!4975 V!28841) (minValue!4975 V!28841) (_size!2035 (_ BitVec 32)) (_keys!9858 array!51786) (_values!5162 array!51788) (_vacant!2035 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3960)

(declare-fun mapDefault!28401 () ValueCell!8472)

(assert (=> b!888726 (= condMapEmpty!28401 (= (arr!24904 (_values!5162 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8472)) mapDefault!28401)))))

(declare-fun b!888727 () Bool)

(declare-fun e!495241 () Bool)

(declare-fun tp_is_empty!17907 () Bool)

(assert (=> b!888727 (= e!495241 tp_is_empty!17907)))

(declare-fun mapIsEmpty!28401 () Bool)

(assert (=> mapIsEmpty!28401 mapRes!28401))

(declare-fun mapNonEmpty!28401 () Bool)

(declare-fun tp!54691 () Bool)

(assert (=> mapNonEmpty!28401 (= mapRes!28401 (and tp!54691 e!495241))))

(declare-fun mapRest!28401 () (Array (_ BitVec 32) ValueCell!8472))

(declare-fun mapValue!28401 () ValueCell!8472)

(declare-fun mapKey!28401 () (_ BitVec 32))

(assert (=> mapNonEmpty!28401 (= (arr!24904 (_values!5162 thiss!1181)) (store mapRest!28401 mapKey!28401 mapValue!28401))))

(declare-fun b!888729 () Bool)

(assert (=> b!888729 (= e!495242 tp_is_empty!17907)))

(declare-fun lt!401911 () Bool)

(declare-fun valid!1544 (LongMapFixedSize!3960) Bool)

(assert (=> start!75552 (= lt!401911 (valid!1544 thiss!1181))))

(assert (=> start!75552 false))

(declare-fun e!495238 () Bool)

(assert (=> start!75552 e!495238))

(declare-fun array_inv!19596 (array!51786) Bool)

(declare-fun array_inv!19597 (array!51788) Bool)

(assert (=> b!888728 (= e!495238 (and tp!54692 tp_is_empty!17907 (array_inv!19596 (_keys!9858 thiss!1181)) (array_inv!19597 (_values!5162 thiss!1181)) e!495240))))

(assert (= (and b!888726 condMapEmpty!28401) mapIsEmpty!28401))

(assert (= (and b!888726 (not condMapEmpty!28401)) mapNonEmpty!28401))

(get-info :version)

(assert (= (and mapNonEmpty!28401 ((_ is ValueCellFull!8472) mapValue!28401)) b!888727))

(assert (= (and b!888726 ((_ is ValueCellFull!8472) mapDefault!28401)) b!888729))

(assert (= b!888728 b!888726))

(assert (= start!75552 b!888728))

(declare-fun m!827957 () Bool)

(assert (=> mapNonEmpty!28401 m!827957))

(declare-fun m!827959 () Bool)

(assert (=> start!75552 m!827959))

(declare-fun m!827961 () Bool)

(assert (=> b!888728 m!827961))

(declare-fun m!827963 () Bool)

(assert (=> b!888728 m!827963))

(check-sat (not b_next!15579) tp_is_empty!17907 (not start!75552) b_and!25819 (not mapNonEmpty!28401) (not b!888728))
(check-sat b_and!25819 (not b_next!15579))
