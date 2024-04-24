; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3008 () Bool)

(assert start!3008)

(declare-fun b!17680 () Bool)

(declare-fun b_free!619 () Bool)

(declare-fun b_next!619 () Bool)

(assert (=> b!17680 (= b_free!619 (not b_next!619))))

(declare-fun tp!3047 () Bool)

(declare-fun b_and!1261 () Bool)

(assert (=> b!17680 (= tp!3047 b_and!1261)))

(declare-fun b!17676 () Bool)

(declare-fun e!11171 () Bool)

(declare-fun tp_is_empty!883 () Bool)

(assert (=> b!17676 (= e!11171 tp_is_empty!883)))

(declare-fun b!17677 () Bool)

(declare-datatypes ((V!1003 0))(
  ( (V!1004 (val!468 Int)) )
))
(declare-datatypes ((ValueCell!242 0))(
  ( (ValueCellFull!242 (v!1440 V!1003)) (EmptyCell!242) )
))
(declare-datatypes ((array!953 0))(
  ( (array!954 (arr!458 (Array (_ BitVec 32) ValueCell!242)) (size!548 (_ BitVec 32))) )
))
(declare-datatypes ((array!955 0))(
  ( (array!956 (arr!459 (Array (_ BitVec 32) (_ BitVec 64))) (size!549 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!70 0))(
  ( (LongMapFixedSize!71 (defaultEntry!1646 Int) (mask!4569 (_ BitVec 32)) (extraKeys!1559 (_ BitVec 32)) (zeroValue!1582 V!1003) (minValue!1582 V!1003) (_size!67 (_ BitVec 32)) (_keys!3071 array!955) (_values!1643 array!953) (_vacant!67 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!70 0))(
  ( (Cell!71 (v!1441 LongMapFixedSize!70)) )
))
(declare-datatypes ((LongMap!70 0))(
  ( (LongMap!71 (underlying!46 Cell!70)) )
))
(declare-datatypes ((tuple2!762 0))(
  ( (tuple2!763 (_1!382 Bool) (_2!382 LongMap!70)) )
))
(declare-fun e!11166 () tuple2!762)

(declare-fun thiss!848 () LongMap!70)

(assert (=> b!17677 (= e!11166 (tuple2!763 true thiss!848))))

(declare-fun b!17678 () Bool)

(declare-fun e!11173 () Bool)

(declare-fun e!11165 () Bool)

(assert (=> b!17678 (= e!11173 e!11165)))

(declare-fun res!12629 () Bool)

(assert (=> b!17678 (=> (not res!12629) (not e!11165))))

(declare-fun lt!4600 () tuple2!762)

(assert (=> b!17678 (= res!12629 (not (_1!382 lt!4600)))))

(assert (=> b!17678 (= lt!4600 e!11166)))

(declare-fun c!1767 () Bool)

(declare-fun imbalanced!16 (LongMap!70) Bool)

(assert (=> b!17678 (= c!1767 (imbalanced!16 thiss!848))))

(declare-fun mapNonEmpty!759 () Bool)

(declare-fun mapRes!759 () Bool)

(declare-fun tp!3048 () Bool)

(declare-fun e!11167 () Bool)

(assert (=> mapNonEmpty!759 (= mapRes!759 (and tp!3048 e!11167))))

(declare-fun mapKey!759 () (_ BitVec 32))

(declare-fun mapValue!759 () ValueCell!242)

(declare-fun mapRest!759 () (Array (_ BitVec 32) ValueCell!242))

(assert (=> mapNonEmpty!759 (= (arr!458 (_values!1643 (v!1441 (underlying!46 thiss!848)))) (store mapRest!759 mapKey!759 mapValue!759))))

(declare-fun mapIsEmpty!759 () Bool)

(assert (=> mapIsEmpty!759 mapRes!759))

(declare-fun b!17679 () Bool)

(assert (=> b!17679 (= e!11165 false)))

(declare-fun lt!4599 () Bool)

(declare-fun valid!41 (LongMap!70) Bool)

(assert (=> b!17679 (= lt!4599 (valid!41 (_2!382 lt!4600)))))

(declare-fun e!11174 () Bool)

(declare-fun e!11168 () Bool)

(declare-fun array_inv!329 (array!955) Bool)

(declare-fun array_inv!330 (array!953) Bool)

(assert (=> b!17680 (= e!11174 (and tp!3047 tp_is_empty!883 (array_inv!329 (_keys!3071 (v!1441 (underlying!46 thiss!848)))) (array_inv!330 (_values!1643 (v!1441 (underlying!46 thiss!848)))) e!11168))))

(declare-fun b!17681 () Bool)

(declare-fun repack!12 (LongMap!70) tuple2!762)

(assert (=> b!17681 (= e!11166 (repack!12 thiss!848))))

(declare-fun b!17682 () Bool)

(assert (=> b!17682 (= e!11168 (and e!11171 mapRes!759))))

(declare-fun condMapEmpty!759 () Bool)

(declare-fun mapDefault!759 () ValueCell!242)

(assert (=> b!17682 (= condMapEmpty!759 (= (arr!458 (_values!1643 (v!1441 (underlying!46 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!242)) mapDefault!759)))))

(declare-fun b!17684 () Bool)

(assert (=> b!17684 (= e!11167 tp_is_empty!883)))

(declare-fun b!17685 () Bool)

(declare-fun e!11169 () Bool)

(assert (=> b!17685 (= e!11169 e!11174)))

(declare-fun b!17683 () Bool)

(declare-fun e!11172 () Bool)

(assert (=> b!17683 (= e!11172 e!11169)))

(declare-fun res!12630 () Bool)

(assert (=> start!3008 (=> (not res!12630) (not e!11173))))

(assert (=> start!3008 (= res!12630 (valid!41 thiss!848))))

(assert (=> start!3008 e!11173))

(assert (=> start!3008 e!11172))

(assert (= (and start!3008 res!12630) b!17678))

(assert (= (and b!17678 c!1767) b!17681))

(assert (= (and b!17678 (not c!1767)) b!17677))

(assert (= (and b!17678 res!12629) b!17679))

(assert (= (and b!17682 condMapEmpty!759) mapIsEmpty!759))

(assert (= (and b!17682 (not condMapEmpty!759)) mapNonEmpty!759))

(get-info :version)

(assert (= (and mapNonEmpty!759 ((_ is ValueCellFull!242) mapValue!759)) b!17684))

(assert (= (and b!17682 ((_ is ValueCellFull!242) mapDefault!759)) b!17676))

(assert (= b!17680 b!17682))

(assert (= b!17685 b!17680))

(assert (= b!17683 b!17685))

(assert (= start!3008 b!17683))

(declare-fun m!12381 () Bool)

(assert (=> b!17678 m!12381))

(declare-fun m!12383 () Bool)

(assert (=> b!17680 m!12383))

(declare-fun m!12385 () Bool)

(assert (=> b!17680 m!12385))

(declare-fun m!12387 () Bool)

(assert (=> start!3008 m!12387))

(declare-fun m!12389 () Bool)

(assert (=> mapNonEmpty!759 m!12389))

(declare-fun m!12391 () Bool)

(assert (=> b!17679 m!12391))

(declare-fun m!12393 () Bool)

(assert (=> b!17681 m!12393))

(check-sat (not b!17678) tp_is_empty!883 (not b!17681) (not b!17679) (not start!3008) (not b!17680) b_and!1261 (not b_next!619) (not mapNonEmpty!759))
(check-sat b_and!1261 (not b_next!619))
