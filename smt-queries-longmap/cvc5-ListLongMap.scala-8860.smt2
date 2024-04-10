; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107508 () Bool)

(assert start!107508)

(declare-fun b!1273132 () Bool)

(declare-fun b_free!27703 () Bool)

(declare-fun b_next!27703 () Bool)

(assert (=> b!1273132 (= b_free!27703 (not b_next!27703))))

(declare-fun tp!97646 () Bool)

(declare-fun b_and!45759 () Bool)

(assert (=> b!1273132 (= tp!97646 b_and!45759)))

(declare-fun b!1273127 () Bool)

(declare-fun res!846700 () Bool)

(declare-fun e!726300 () Bool)

(assert (=> b!1273127 (=> (not res!846700) (not e!726300))))

(declare-datatypes ((V!49291 0))(
  ( (V!49292 (val!16611 Int)) )
))
(declare-datatypes ((ValueCell!15683 0))(
  ( (ValueCellFull!15683 (v!19248 V!49291)) (EmptyCell!15683) )
))
(declare-datatypes ((array!83412 0))(
  ( (array!83413 (arr!40234 (Array (_ BitVec 32) ValueCell!15683)) (size!40775 (_ BitVec 32))) )
))
(declare-datatypes ((array!83414 0))(
  ( (array!83415 (arr!40235 (Array (_ BitVec 32) (_ BitVec 64))) (size!40776 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6130 0))(
  ( (LongMapFixedSize!6131 (defaultEntry!6711 Int) (mask!34482 (_ BitVec 32)) (extraKeys!6390 (_ BitVec 32)) (zeroValue!6496 V!49291) (minValue!6496 V!49291) (_size!3120 (_ BitVec 32)) (_keys!12123 array!83414) (_values!6734 array!83412) (_vacant!3120 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6130)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1273127 (= res!846700 (validMask!0 (mask!34482 thiss!1559)))))

(declare-fun b!1273128 () Bool)

(declare-datatypes ((List!28565 0))(
  ( (Nil!28562) (Cons!28561 (h!29770 (_ BitVec 64)) (t!42098 List!28565)) )
))
(declare-fun arrayNoDuplicates!0 (array!83414 (_ BitVec 32) List!28565) Bool)

(assert (=> b!1273128 (= e!726300 (not (arrayNoDuplicates!0 (_keys!12123 thiss!1559) #b00000000000000000000000000000000 Nil!28562)))))

(declare-fun b!1273129 () Bool)

(declare-fun e!726301 () Bool)

(declare-fun tp_is_empty!33073 () Bool)

(assert (=> b!1273129 (= e!726301 tp_is_empty!33073)))

(declare-fun res!846701 () Bool)

(assert (=> start!107508 (=> (not res!846701) (not e!726300))))

(declare-fun valid!2300 (LongMapFixedSize!6130) Bool)

(assert (=> start!107508 (= res!846701 (valid!2300 thiss!1559))))

(assert (=> start!107508 e!726300))

(declare-fun e!726303 () Bool)

(assert (=> start!107508 e!726303))

(declare-fun b!1273130 () Bool)

(declare-fun res!846702 () Bool)

(assert (=> b!1273130 (=> (not res!846702) (not e!726300))))

(assert (=> b!1273130 (= res!846702 (and (= (size!40775 (_values!6734 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34482 thiss!1559))) (= (size!40776 (_keys!12123 thiss!1559)) (size!40775 (_values!6734 thiss!1559))) (bvsge (mask!34482 thiss!1559) #b00000000000000000000000000000000) (bvsge (extraKeys!6390 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6390 thiss!1559) #b00000000000000000000000000000011)))))

(declare-fun b!1273131 () Bool)

(declare-fun e!726305 () Bool)

(assert (=> b!1273131 (= e!726305 tp_is_empty!33073)))

(declare-fun e!726302 () Bool)

(declare-fun array_inv!30595 (array!83414) Bool)

(declare-fun array_inv!30596 (array!83412) Bool)

(assert (=> b!1273132 (= e!726303 (and tp!97646 tp_is_empty!33073 (array_inv!30595 (_keys!12123 thiss!1559)) (array_inv!30596 (_values!6734 thiss!1559)) e!726302))))

(declare-fun b!1273133 () Bool)

(declare-fun mapRes!51222 () Bool)

(assert (=> b!1273133 (= e!726302 (and e!726301 mapRes!51222))))

(declare-fun condMapEmpty!51222 () Bool)

(declare-fun mapDefault!51222 () ValueCell!15683)

