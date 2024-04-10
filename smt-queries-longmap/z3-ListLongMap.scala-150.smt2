; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2942 () Bool)

(assert start!2942)

(declare-fun b!16767 () Bool)

(declare-fun b_free!579 () Bool)

(declare-fun b_next!579 () Bool)

(assert (=> b!16767 (= b_free!579 (not b_next!579))))

(declare-fun tp!2924 () Bool)

(declare-fun b_and!1221 () Bool)

(assert (=> b!16767 (= tp!2924 b_and!1221)))

(declare-fun mapIsEmpty!695 () Bool)

(declare-fun mapRes!695 () Bool)

(assert (=> mapIsEmpty!695 mapRes!695))

(declare-fun mapNonEmpty!695 () Bool)

(declare-fun tp!2923 () Bool)

(declare-fun e!10411 () Bool)

(assert (=> mapNonEmpty!695 (= mapRes!695 (and tp!2923 e!10411))))

(declare-datatypes ((V!949 0))(
  ( (V!950 (val!448 Int)) )
))
(declare-datatypes ((ValueCell!222 0))(
  ( (ValueCellFull!222 (v!1396 V!949)) (EmptyCell!222) )
))
(declare-datatypes ((array!889 0))(
  ( (array!890 (arr!427 (Array (_ BitVec 32) ValueCell!222)) (size!516 (_ BitVec 32))) )
))
(declare-datatypes ((array!891 0))(
  ( (array!892 (arr!428 (Array (_ BitVec 32) (_ BitVec 64))) (size!517 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!30 0))(
  ( (LongMapFixedSize!31 (defaultEntry!1625 Int) (mask!4533 (_ BitVec 32)) (extraKeys!1539 (_ BitVec 32)) (zeroValue!1562 V!949) (minValue!1562 V!949) (_size!46 (_ BitVec 32)) (_keys!3050 array!891) (_values!1623 array!889) (_vacant!46 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!30 0))(
  ( (Cell!31 (v!1397 LongMapFixedSize!30)) )
))
(declare-datatypes ((LongMap!30 0))(
  ( (LongMap!31 (underlying!26 Cell!30)) )
))
(declare-fun thiss!848 () LongMap!30)

(declare-fun mapValue!695 () ValueCell!222)

(declare-fun mapKey!695 () (_ BitVec 32))

(declare-fun mapRest!695 () (Array (_ BitVec 32) ValueCell!222))

(assert (=> mapNonEmpty!695 (= (arr!427 (_values!1623 (v!1397 (underlying!26 thiss!848)))) (store mapRest!695 mapKey!695 mapValue!695))))

(declare-fun tp_is_empty!843 () Bool)

(declare-fun e!10412 () Bool)

(declare-fun e!10415 () Bool)

(declare-fun array_inv!303 (array!891) Bool)

(declare-fun array_inv!304 (array!889) Bool)

(assert (=> b!16767 (= e!10412 (and tp!2924 tp_is_empty!843 (array_inv!303 (_keys!3050 (v!1397 (underlying!26 thiss!848)))) (array_inv!304 (_values!1623 (v!1397 (underlying!26 thiss!848)))) e!10415))))

(declare-fun b!16768 () Bool)

(declare-fun e!10416 () Bool)

(declare-fun e!10417 () Bool)

(assert (=> b!16768 (= e!10416 e!10417)))

(declare-fun b!16769 () Bool)

(declare-fun e!10413 () Bool)

(assert (=> b!16769 (= e!10415 (and e!10413 mapRes!695))))

(declare-fun condMapEmpty!695 () Bool)

(declare-fun mapDefault!695 () ValueCell!222)

(assert (=> b!16769 (= condMapEmpty!695 (= (arr!427 (_values!1623 (v!1397 (underlying!26 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!222)) mapDefault!695)))))

(declare-fun lt!4135 () Bool)

(declare-fun valid!18 (LongMap!30) Bool)

(assert (=> start!2942 (= lt!4135 (valid!18 thiss!848))))

(assert (=> start!2942 false))

(assert (=> start!2942 e!10416))

(declare-fun b!16770 () Bool)

(assert (=> b!16770 (= e!10413 tp_is_empty!843)))

(declare-fun b!16771 () Bool)

(assert (=> b!16771 (= e!10417 e!10412)))

(declare-fun b!16772 () Bool)

(assert (=> b!16772 (= e!10411 tp_is_empty!843)))

(assert (= (and b!16769 condMapEmpty!695) mapIsEmpty!695))

(assert (= (and b!16769 (not condMapEmpty!695)) mapNonEmpty!695))

(get-info :version)

(assert (= (and mapNonEmpty!695 ((_ is ValueCellFull!222) mapValue!695)) b!16772))

(assert (= (and b!16769 ((_ is ValueCellFull!222) mapDefault!695)) b!16770))

(assert (= b!16767 b!16769))

(assert (= b!16771 b!16767))

(assert (= b!16768 b!16771))

(assert (= start!2942 b!16768))

(declare-fun m!11835 () Bool)

(assert (=> mapNonEmpty!695 m!11835))

(declare-fun m!11837 () Bool)

(assert (=> b!16767 m!11837))

(declare-fun m!11839 () Bool)

(assert (=> b!16767 m!11839))

(declare-fun m!11841 () Bool)

(assert (=> start!2942 m!11841))

(check-sat tp_is_empty!843 (not mapNonEmpty!695) (not b_next!579) (not b!16767) b_and!1221 (not start!2942))
(check-sat b_and!1221 (not b_next!579))
