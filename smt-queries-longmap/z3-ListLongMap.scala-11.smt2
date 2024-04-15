; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!444 () Bool)

(assert start!444)

(declare-fun b!2616 () Bool)

(declare-fun b_free!61 () Bool)

(declare-fun b_next!61 () Bool)

(assert (=> b!2616 (= b_free!61 (not b_next!61))))

(declare-fun tp!248 () Bool)

(declare-fun b_and!199 () Bool)

(assert (=> b!2616 (= tp!248 b_and!199)))

(declare-fun b!2612 () Bool)

(declare-fun e!942 () Bool)

(declare-fun tp_is_empty!49 () Bool)

(assert (=> b!2612 (= e!942 tp_is_empty!49)))

(declare-fun b!2613 () Bool)

(declare-fun e!941 () Bool)

(declare-fun e!945 () Bool)

(assert (=> b!2613 (= e!941 e!945)))

(declare-fun b!2615 () Bool)

(declare-fun e!938 () Bool)

(assert (=> b!2615 (= e!938 false)))

(declare-fun lt!371 () Bool)

(declare-datatypes ((V!243 0))(
  ( (V!244 (val!30 Int)) )
))
(declare-datatypes ((ValueCell!8 0))(
  ( (ValueCellFull!8 (v!1113 V!243)) (EmptyCell!8) )
))
(declare-datatypes ((array!29 0))(
  ( (array!30 (arr!13 (Array (_ BitVec 32) ValueCell!8)) (size!75 (_ BitVec 32))) )
))
(declare-datatypes ((array!31 0))(
  ( (array!32 (arr!14 (Array (_ BitVec 32) (_ BitVec 64))) (size!76 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!16 0))(
  ( (LongMapFixedSize!17 (defaultEntry!1592 Int) (mask!4170 (_ BitVec 32)) (extraKeys!1509 (_ BitVec 32)) (zeroValue!1532 V!243) (minValue!1532 V!243) (_size!39 (_ BitVec 32)) (_keys!2994 array!31) (_values!1593 array!29) (_vacant!39 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!16 0))(
  ( (Cell!17 (v!1114 LongMapFixedSize!16)) )
))
(declare-datatypes ((LongMap!16 0))(
  ( (LongMap!17 (underlying!19 Cell!16)) )
))
(declare-fun thiss!814 () LongMap!16)

(declare-fun isEmpty!43 (LongMapFixedSize!16) Bool)

(assert (=> b!2615 (= lt!371 (isEmpty!43 (v!1114 (underlying!19 thiss!814))))))

(declare-fun mapIsEmpty!14 () Bool)

(declare-fun mapRes!14 () Bool)

(assert (=> mapIsEmpty!14 mapRes!14))

(declare-fun mapNonEmpty!14 () Bool)

(declare-fun tp!247 () Bool)

(declare-fun e!939 () Bool)

(assert (=> mapNonEmpty!14 (= mapRes!14 (and tp!247 e!939))))

(declare-fun mapRest!14 () (Array (_ BitVec 32) ValueCell!8))

(declare-fun mapKey!14 () (_ BitVec 32))

(declare-fun mapValue!14 () ValueCell!8)

(assert (=> mapNonEmpty!14 (= (arr!13 (_values!1593 (v!1114 (underlying!19 thiss!814)))) (store mapRest!14 mapKey!14 mapValue!14))))

(declare-fun e!940 () Bool)

(declare-fun e!943 () Bool)

(declare-fun array_inv!5 (array!31) Bool)

(declare-fun array_inv!6 (array!29) Bool)

(assert (=> b!2616 (= e!940 (and tp!248 tp_is_empty!49 (array_inv!5 (_keys!2994 (v!1114 (underlying!19 thiss!814)))) (array_inv!6 (_values!1593 (v!1114 (underlying!19 thiss!814)))) e!943))))

(declare-fun b!2614 () Bool)

(assert (=> b!2614 (= e!945 e!940)))

(declare-fun res!4793 () Bool)

(assert (=> start!444 (=> (not res!4793) (not e!938))))

(declare-fun valid!14 (LongMap!16) Bool)

(assert (=> start!444 (= res!4793 (valid!14 thiss!814))))

(assert (=> start!444 e!938))

(assert (=> start!444 e!941))

(declare-fun b!2617 () Bool)

(assert (=> b!2617 (= e!943 (and e!942 mapRes!14))))

(declare-fun condMapEmpty!14 () Bool)

(declare-fun mapDefault!14 () ValueCell!8)

(assert (=> b!2617 (= condMapEmpty!14 (= (arr!13 (_values!1593 (v!1114 (underlying!19 thiss!814)))) ((as const (Array (_ BitVec 32) ValueCell!8)) mapDefault!14)))))

(declare-fun b!2618 () Bool)

(assert (=> b!2618 (= e!939 tp_is_empty!49)))

(assert (= (and start!444 res!4793) b!2615))

(assert (= (and b!2617 condMapEmpty!14) mapIsEmpty!14))

(assert (= (and b!2617 (not condMapEmpty!14)) mapNonEmpty!14))

(get-info :version)

(assert (= (and mapNonEmpty!14 ((_ is ValueCellFull!8) mapValue!14)) b!2618))

(assert (= (and b!2617 ((_ is ValueCellFull!8) mapDefault!14)) b!2612))

(assert (= b!2616 b!2617))

(assert (= b!2614 b!2616))

(assert (= b!2613 b!2614))

(assert (= start!444 b!2613))

(declare-fun m!1135 () Bool)

(assert (=> b!2615 m!1135))

(declare-fun m!1137 () Bool)

(assert (=> mapNonEmpty!14 m!1137))

(declare-fun m!1139 () Bool)

(assert (=> b!2616 m!1139))

(declare-fun m!1141 () Bool)

(assert (=> b!2616 m!1141))

(declare-fun m!1143 () Bool)

(assert (=> start!444 m!1143))

(check-sat (not start!444) (not mapNonEmpty!14) tp_is_empty!49 (not b_next!61) b_and!199 (not b!2615) (not b!2616))
(check-sat b_and!199 (not b_next!61))
