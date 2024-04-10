; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107646 () Bool)

(assert start!107646)

(declare-fun b!1273972 () Bool)

(declare-fun b_free!27761 () Bool)

(declare-fun b_next!27761 () Bool)

(assert (=> b!1273972 (= b_free!27761 (not b_next!27761))))

(declare-fun tp!97845 () Bool)

(declare-fun b_and!45817 () Bool)

(assert (=> b!1273972 (= tp!97845 b_and!45817)))

(declare-fun b!1273968 () Bool)

(declare-fun e!726974 () Bool)

(declare-fun tp_is_empty!33131 () Bool)

(assert (=> b!1273968 (= e!726974 tp_is_empty!33131)))

(declare-fun mapIsEmpty!51334 () Bool)

(declare-fun mapRes!51334 () Bool)

(assert (=> mapIsEmpty!51334 mapRes!51334))

(declare-fun mapNonEmpty!51334 () Bool)

(declare-fun tp!97846 () Bool)

(assert (=> mapNonEmpty!51334 (= mapRes!51334 (and tp!97846 e!726974))))

(declare-fun mapKey!51334 () (_ BitVec 32))

(declare-datatypes ((V!49367 0))(
  ( (V!49368 (val!16640 Int)) )
))
(declare-datatypes ((ValueCell!15712 0))(
  ( (ValueCellFull!15712 (v!19277 V!49367)) (EmptyCell!15712) )
))
(declare-fun mapRest!51334 () (Array (_ BitVec 32) ValueCell!15712))

(declare-datatypes ((array!83544 0))(
  ( (array!83545 (arr!40292 (Array (_ BitVec 32) ValueCell!15712)) (size!40839 (_ BitVec 32))) )
))
(declare-datatypes ((array!83546 0))(
  ( (array!83547 (arr!40293 (Array (_ BitVec 32) (_ BitVec 64))) (size!40840 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6188 0))(
  ( (LongMapFixedSize!6189 (defaultEntry!6740 Int) (mask!34538 (_ BitVec 32)) (extraKeys!6419 (_ BitVec 32)) (zeroValue!6525 V!49367) (minValue!6525 V!49367) (_size!3149 (_ BitVec 32)) (_keys!12155 array!83546) (_values!6763 array!83544) (_vacant!3149 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6188)

(declare-fun mapValue!51334 () ValueCell!15712)

(assert (=> mapNonEmpty!51334 (= (arr!40292 (_values!6763 thiss!1551)) (store mapRest!51334 mapKey!51334 mapValue!51334))))

(declare-fun b!1273970 () Bool)

(declare-fun e!726973 () Bool)

(assert (=> b!1273970 (= e!726973 tp_is_empty!33131)))

(declare-fun b!1273971 () Bool)

(declare-fun res!847049 () Bool)

(declare-fun e!726975 () Bool)

(assert (=> b!1273971 (=> (not res!847049) (not e!726975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83546 (_ BitVec 32)) Bool)

(assert (=> b!1273971 (= res!847049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12155 thiss!1551) (mask!34538 thiss!1551)))))

(declare-fun e!726971 () Bool)

(declare-fun e!726976 () Bool)

(declare-fun array_inv!30631 (array!83546) Bool)

(declare-fun array_inv!30632 (array!83544) Bool)

(assert (=> b!1273972 (= e!726976 (and tp!97845 tp_is_empty!33131 (array_inv!30631 (_keys!12155 thiss!1551)) (array_inv!30632 (_values!6763 thiss!1551)) e!726971))))

(declare-fun b!1273969 () Bool)

(assert (=> b!1273969 (= e!726971 (and e!726973 mapRes!51334))))

(declare-fun condMapEmpty!51334 () Bool)

(declare-fun mapDefault!51334 () ValueCell!15712)

