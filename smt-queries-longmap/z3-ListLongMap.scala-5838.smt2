; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75384 () Bool)

(assert start!75384)

(declare-fun b!887534 () Bool)

(declare-fun b_free!15529 () Bool)

(declare-fun b_next!15529 () Bool)

(assert (=> b!887534 (= b_free!15529 (not b_next!15529))))

(declare-fun tp!54531 () Bool)

(declare-fun b_and!25739 () Bool)

(assert (=> b!887534 (= tp!54531 b_and!25739)))

(declare-fun mapNonEmpty!28315 () Bool)

(declare-fun mapRes!28315 () Bool)

(declare-fun tp!54532 () Bool)

(declare-fun e!494331 () Bool)

(assert (=> mapNonEmpty!28315 (= mapRes!28315 (and tp!54532 e!494331))))

(declare-datatypes ((V!28775 0))(
  ( (V!28776 (val!8979 Int)) )
))
(declare-datatypes ((array!51663 0))(
  ( (array!51664 (arr!24845 (Array (_ BitVec 32) (_ BitVec 64))) (size!25287 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!8447 0))(
  ( (ValueCellFull!8447 (v!11436 V!28775)) (EmptyCell!8447) )
))
(declare-datatypes ((array!51665 0))(
  ( (array!51666 (arr!24846 (Array (_ BitVec 32) ValueCell!8447)) (size!25288 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3910 0))(
  ( (LongMapFixedSize!3911 (defaultEntry!5146 Int) (mask!25543 (_ BitVec 32)) (extraKeys!4840 (_ BitVec 32)) (zeroValue!4944 V!28775) (minValue!4944 V!28775) (_size!2010 (_ BitVec 32)) (_keys!9818 array!51663) (_values!5131 array!51665) (_vacant!2010 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1062 0))(
  ( (Cell!1063 (v!11437 LongMapFixedSize!3910)) )
))
(declare-datatypes ((LongMap!1062 0))(
  ( (LongMap!1063 (underlying!542 Cell!1062)) )
))
(declare-fun thiss!821 () LongMap!1062)

(declare-fun mapKey!28315 () (_ BitVec 32))

(declare-fun mapValue!28315 () ValueCell!8447)

(declare-fun mapRest!28315 () (Array (_ BitVec 32) ValueCell!8447))

(assert (=> mapNonEmpty!28315 (= (arr!24846 (_values!5131 (v!11437 (underlying!542 thiss!821)))) (store mapRest!28315 mapKey!28315 mapValue!28315))))

(declare-fun b!887530 () Bool)

(declare-fun e!494335 () Bool)

(assert (=> b!887530 (= e!494335 false)))

(declare-fun lt!401220 () Bool)

(declare-fun key!666 () (_ BitVec 64))

(declare-fun contains!4285 (LongMapFixedSize!3910 (_ BitVec 64)) Bool)

(assert (=> b!887530 (= lt!401220 (contains!4285 (v!11437 (underlying!542 thiss!821)) key!666))))

(declare-fun res!602094 () Bool)

(assert (=> start!75384 (=> (not res!602094) (not e!494335))))

(declare-fun valid!1532 (LongMap!1062) Bool)

(assert (=> start!75384 (= res!602094 (valid!1532 thiss!821))))

(assert (=> start!75384 e!494335))

(declare-fun e!494333 () Bool)

(assert (=> start!75384 e!494333))

(assert (=> start!75384 true))

(declare-fun b!887531 () Bool)

(declare-fun e!494332 () Bool)

(declare-fun tp_is_empty!17857 () Bool)

(assert (=> b!887531 (= e!494332 tp_is_empty!17857)))

(declare-fun b!887532 () Bool)

(assert (=> b!887532 (= e!494331 tp_is_empty!17857)))

(declare-fun b!887533 () Bool)

(declare-fun e!494330 () Bool)

(declare-fun e!494328 () Bool)

(assert (=> b!887533 (= e!494330 e!494328)))

(declare-fun e!494334 () Bool)

(declare-fun array_inv!19602 (array!51663) Bool)

(declare-fun array_inv!19603 (array!51665) Bool)

(assert (=> b!887534 (= e!494328 (and tp!54531 tp_is_empty!17857 (array_inv!19602 (_keys!9818 (v!11437 (underlying!542 thiss!821)))) (array_inv!19603 (_values!5131 (v!11437 (underlying!542 thiss!821)))) e!494334))))

(declare-fun b!887535 () Bool)

(assert (=> b!887535 (= e!494334 (and e!494332 mapRes!28315))))

(declare-fun condMapEmpty!28315 () Bool)

(declare-fun mapDefault!28315 () ValueCell!8447)

(assert (=> b!887535 (= condMapEmpty!28315 (= (arr!24846 (_values!5131 (v!11437 (underlying!542 thiss!821)))) ((as const (Array (_ BitVec 32) ValueCell!8447)) mapDefault!28315)))))

(declare-fun mapIsEmpty!28315 () Bool)

(assert (=> mapIsEmpty!28315 mapRes!28315))

(declare-fun b!887536 () Bool)

(assert (=> b!887536 (= e!494333 e!494330)))

(assert (= (and start!75384 res!602094) b!887530))

(assert (= (and b!887535 condMapEmpty!28315) mapIsEmpty!28315))

(assert (= (and b!887535 (not condMapEmpty!28315)) mapNonEmpty!28315))

(get-info :version)

(assert (= (and mapNonEmpty!28315 ((_ is ValueCellFull!8447) mapValue!28315)) b!887532))

(assert (= (and b!887535 ((_ is ValueCellFull!8447) mapDefault!28315)) b!887531))

(assert (= b!887534 b!887535))

(assert (= b!887533 b!887534))

(assert (= b!887536 b!887533))

(assert (= start!75384 b!887536))

(declare-fun m!826531 () Bool)

(assert (=> mapNonEmpty!28315 m!826531))

(declare-fun m!826533 () Bool)

(assert (=> b!887530 m!826533))

(declare-fun m!826535 () Bool)

(assert (=> start!75384 m!826535))

(declare-fun m!826537 () Bool)

(assert (=> b!887534 m!826537))

(declare-fun m!826539 () Bool)

(assert (=> b!887534 m!826539))

(check-sat b_and!25739 (not b_next!15529) (not b!887534) (not mapNonEmpty!28315) (not b!887530) tp_is_empty!17857 (not start!75384))
(check-sat b_and!25739 (not b_next!15529))
