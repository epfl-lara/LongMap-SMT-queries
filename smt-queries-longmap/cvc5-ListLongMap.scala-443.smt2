; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8270 () Bool)

(assert start!8270)

(declare-fun b!53158 () Bool)

(declare-fun b_free!1705 () Bool)

(declare-fun b_next!1705 () Bool)

(assert (=> b!53158 (= b_free!1705 (not b_next!1705))))

(declare-fun tp!7218 () Bool)

(declare-fun b_and!2951 () Bool)

(assert (=> b!53158 (= tp!7218 b_and!2951)))

(declare-fun b!53149 () Bool)

(declare-fun b_free!1707 () Bool)

(declare-fun b_next!1707 () Bool)

(assert (=> b!53149 (= b_free!1707 (not b_next!1707))))

(declare-fun tp!7216 () Bool)

(declare-fun b_and!2953 () Bool)

(assert (=> b!53149 (= tp!7216 b_and!2953)))

(declare-fun mapIsEmpty!2477 () Bool)

(declare-fun mapRes!2478 () Bool)

(assert (=> mapIsEmpty!2477 mapRes!2478))

(declare-fun res!30155 () Bool)

(declare-fun e!34659 () Bool)

(assert (=> start!8270 (=> (not res!30155) (not e!34659))))

(declare-datatypes ((V!2673 0))(
  ( (V!2674 (val!1179 Int)) )
))
(declare-datatypes ((array!3461 0))(
  ( (array!3462 (arr!1653 (Array (_ BitVec 32) (_ BitVec 64))) (size!1882 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!791 0))(
  ( (ValueCellFull!791 (v!2247 V!2673)) (EmptyCell!791) )
))
(declare-datatypes ((array!3463 0))(
  ( (array!3464 (arr!1654 (Array (_ BitVec 32) ValueCell!791)) (size!1883 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!490 0))(
  ( (LongMapFixedSize!491 (defaultEntry!1959 Int) (mask!5792 (_ BitVec 32)) (extraKeys!1850 (_ BitVec 32)) (zeroValue!1877 V!2673) (minValue!1877 V!2673) (_size!294 (_ BitVec 32)) (_keys!3579 array!3461) (_values!1942 array!3463) (_vacant!294 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!312 0))(
  ( (Cell!313 (v!2248 LongMapFixedSize!490)) )
))
(declare-datatypes ((LongMap!312 0))(
  ( (LongMap!313 (underlying!167 Cell!312)) )
))
(declare-fun thiss!992 () LongMap!312)

(declare-fun valid!184 (LongMap!312) Bool)

(assert (=> start!8270 (= res!30155 (valid!184 thiss!992))))

(assert (=> start!8270 e!34659))

(declare-fun e!34654 () Bool)

(assert (=> start!8270 e!34654))

(assert (=> start!8270 true))

(declare-fun e!34665 () Bool)

(assert (=> start!8270 e!34665))

(declare-fun b!53145 () Bool)

(declare-fun e!34663 () Bool)

(assert (=> b!53145 (= e!34654 e!34663)))

(declare-fun mapNonEmpty!2477 () Bool)

(declare-fun tp!7215 () Bool)

(declare-fun e!34658 () Bool)

(assert (=> mapNonEmpty!2477 (= mapRes!2478 (and tp!7215 e!34658))))

(declare-fun mapValue!2478 () ValueCell!791)

(declare-fun mapRest!2477 () (Array (_ BitVec 32) ValueCell!791))

(declare-fun mapKey!2477 () (_ BitVec 32))

(assert (=> mapNonEmpty!2477 (= (arr!1654 (_values!1942 (v!2248 (underlying!167 thiss!992)))) (store mapRest!2477 mapKey!2477 mapValue!2478))))

(declare-fun b!53146 () Bool)

(declare-fun e!34653 () Bool)

(declare-fun e!34655 () Bool)

(declare-fun mapRes!2477 () Bool)

(assert (=> b!53146 (= e!34653 (and e!34655 mapRes!2477))))

(declare-fun condMapEmpty!2478 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!490)

(declare-fun mapDefault!2477 () ValueCell!791)

