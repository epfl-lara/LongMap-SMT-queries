; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75404 () Bool)

(assert start!75404)

(declare-fun b!887796 () Bool)

(declare-fun b_free!15531 () Bool)

(declare-fun b_next!15531 () Bool)

(assert (=> b!887796 (= b_free!15531 (not b_next!15531))))

(declare-fun tp!54537 () Bool)

(declare-fun b_and!25767 () Bool)

(assert (=> b!887796 (= tp!54537 b_and!25767)))

(declare-fun b!887790 () Bool)

(declare-fun e!494506 () Bool)

(declare-fun tp_is_empty!17859 () Bool)

(assert (=> b!887790 (= e!494506 tp_is_empty!17859)))

(declare-fun b!887791 () Bool)

(declare-fun e!494501 () Bool)

(declare-fun e!494505 () Bool)

(assert (=> b!887791 (= e!494501 e!494505)))

(declare-fun b!887792 () Bool)

(declare-fun e!494504 () Bool)

(assert (=> b!887792 (= e!494504 tp_is_empty!17859)))

(declare-fun res!602207 () Bool)

(declare-fun e!494502 () Bool)

(assert (=> start!75404 (=> (not res!602207) (not e!494502))))

(declare-datatypes ((V!28777 0))(
  ( (V!28778 (val!8980 Int)) )
))
(declare-datatypes ((array!51684 0))(
  ( (array!51685 (arr!24855 (Array (_ BitVec 32) (_ BitVec 64))) (size!25295 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!8448 0))(
  ( (ValueCellFull!8448 (v!11446 V!28777)) (EmptyCell!8448) )
))
(declare-datatypes ((array!51686 0))(
  ( (array!51687 (arr!24856 (Array (_ BitVec 32) ValueCell!8448)) (size!25296 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3912 0))(
  ( (LongMapFixedSize!3913 (defaultEntry!5147 Int) (mask!25551 (_ BitVec 32)) (extraKeys!4841 (_ BitVec 32)) (zeroValue!4945 V!28777) (minValue!4945 V!28777) (_size!2011 (_ BitVec 32)) (_keys!9824 array!51684) (_values!5132 array!51686) (_vacant!2011 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1072 0))(
  ( (Cell!1073 (v!11447 LongMapFixedSize!3912)) )
))
(declare-datatypes ((LongMap!1072 0))(
  ( (LongMap!1073 (underlying!547 Cell!1072)) )
))
(declare-fun thiss!821 () LongMap!1072)

(declare-fun valid!1526 (LongMap!1072) Bool)

(assert (=> start!75404 (= res!602207 (valid!1526 thiss!821))))

(assert (=> start!75404 e!494502))

(assert (=> start!75404 e!494501))

(assert (=> start!75404 true))

(declare-fun b!887793 () Bool)

(declare-fun e!494507 () Bool)

(assert (=> b!887793 (= e!494505 e!494507)))

(declare-fun b!887794 () Bool)

(declare-fun e!494500 () Bool)

(declare-fun mapRes!28318 () Bool)

(assert (=> b!887794 (= e!494500 (and e!494506 mapRes!28318))))

(declare-fun condMapEmpty!28318 () Bool)

(declare-fun mapDefault!28318 () ValueCell!8448)

(assert (=> b!887794 (= condMapEmpty!28318 (= (arr!24856 (_values!5132 (v!11447 (underlying!547 thiss!821)))) ((as const (Array (_ BitVec 32) ValueCell!8448)) mapDefault!28318)))))

(declare-fun b!887795 () Bool)

(assert (=> b!887795 (= e!494502 false)))

(declare-fun lt!401459 () Bool)

(declare-fun key!666 () (_ BitVec 64))

(declare-fun contains!4312 (LongMapFixedSize!3912 (_ BitVec 64)) Bool)

(assert (=> b!887795 (= lt!401459 (contains!4312 (v!11447 (underlying!547 thiss!821)) key!666))))

(declare-fun mapNonEmpty!28318 () Bool)

(declare-fun tp!54536 () Bool)

(assert (=> mapNonEmpty!28318 (= mapRes!28318 (and tp!54536 e!494504))))

(declare-fun mapKey!28318 () (_ BitVec 32))

(declare-fun mapRest!28318 () (Array (_ BitVec 32) ValueCell!8448))

(declare-fun mapValue!28318 () ValueCell!8448)

(assert (=> mapNonEmpty!28318 (= (arr!24856 (_values!5132 (v!11447 (underlying!547 thiss!821)))) (store mapRest!28318 mapKey!28318 mapValue!28318))))

(declare-fun mapIsEmpty!28318 () Bool)

(assert (=> mapIsEmpty!28318 mapRes!28318))

(declare-fun array_inv!19562 (array!51684) Bool)

(declare-fun array_inv!19563 (array!51686) Bool)

(assert (=> b!887796 (= e!494507 (and tp!54537 tp_is_empty!17859 (array_inv!19562 (_keys!9824 (v!11447 (underlying!547 thiss!821)))) (array_inv!19563 (_values!5132 (v!11447 (underlying!547 thiss!821)))) e!494500))))

(assert (= (and start!75404 res!602207) b!887795))

(assert (= (and b!887794 condMapEmpty!28318) mapIsEmpty!28318))

(assert (= (and b!887794 (not condMapEmpty!28318)) mapNonEmpty!28318))

(get-info :version)

(assert (= (and mapNonEmpty!28318 ((_ is ValueCellFull!8448) mapValue!28318)) b!887792))

(assert (= (and b!887794 ((_ is ValueCellFull!8448) mapDefault!28318)) b!887790))

(assert (= b!887796 b!887794))

(assert (= b!887793 b!887796))

(assert (= b!887791 b!887793))

(assert (= start!75404 b!887791))

(declare-fun m!827299 () Bool)

(assert (=> start!75404 m!827299))

(declare-fun m!827301 () Bool)

(assert (=> b!887795 m!827301))

(declare-fun m!827303 () Bool)

(assert (=> mapNonEmpty!28318 m!827303))

(declare-fun m!827305 () Bool)

(assert (=> b!887796 m!827305))

(declare-fun m!827307 () Bool)

(assert (=> b!887796 m!827307))

(check-sat (not b!887796) (not start!75404) tp_is_empty!17859 (not mapNonEmpty!28318) (not b_next!15531) (not b!887795) b_and!25767)
(check-sat b_and!25767 (not b_next!15531))
