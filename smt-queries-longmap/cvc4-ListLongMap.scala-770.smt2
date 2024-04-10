; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18124 () Bool)

(assert start!18124)

(declare-fun b!180474 () Bool)

(declare-fun b_free!4463 () Bool)

(declare-fun b_next!4463 () Bool)

(assert (=> b!180474 (= b_free!4463 (not b_next!4463))))

(declare-fun tp!16126 () Bool)

(declare-fun b_and!10997 () Bool)

(assert (=> b!180474 (= tp!16126 b_and!10997)))

(declare-fun mapIsEmpty!7252 () Bool)

(declare-fun mapRes!7252 () Bool)

(assert (=> mapIsEmpty!7252 mapRes!7252))

(declare-fun mapNonEmpty!7252 () Bool)

(declare-fun tp!16125 () Bool)

(declare-fun e!118894 () Bool)

(assert (=> mapNonEmpty!7252 (= mapRes!7252 (and tp!16125 e!118894))))

(declare-datatypes ((V!5293 0))(
  ( (V!5294 (val!2162 Int)) )
))
(declare-datatypes ((ValueCell!1774 0))(
  ( (ValueCellFull!1774 (v!4055 V!5293)) (EmptyCell!1774) )
))
(declare-fun mapValue!7252 () ValueCell!1774)

(declare-fun mapRest!7252 () (Array (_ BitVec 32) ValueCell!1774))

(declare-datatypes ((array!7643 0))(
  ( (array!7644 (arr!3619 (Array (_ BitVec 32) (_ BitVec 64))) (size!3927 (_ BitVec 32))) )
))
(declare-datatypes ((array!7645 0))(
  ( (array!7646 (arr!3620 (Array (_ BitVec 32) ValueCell!1774)) (size!3928 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2456 0))(
  ( (LongMapFixedSize!2457 (defaultEntry!3704 Int) (mask!8705 (_ BitVec 32)) (extraKeys!3441 (_ BitVec 32)) (zeroValue!3545 V!5293) (minValue!3545 V!5293) (_size!1277 (_ BitVec 32)) (_keys!5597 array!7643) (_values!3687 array!7645) (_vacant!1277 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2456)

(declare-fun mapKey!7252 () (_ BitVec 32))

(assert (=> mapNonEmpty!7252 (= (arr!3620 (_values!3687 thiss!1248)) (store mapRest!7252 mapKey!7252 mapValue!7252))))

(declare-fun res!85485 () Bool)

(declare-fun e!118891 () Bool)

(assert (=> start!18124 (=> (not res!85485) (not e!118891))))

(declare-fun valid!1020 (LongMapFixedSize!2456) Bool)

(assert (=> start!18124 (= res!85485 (valid!1020 thiss!1248))))

(assert (=> start!18124 e!118891))

(declare-fun e!118895 () Bool)

(assert (=> start!18124 e!118895))

(assert (=> start!18124 true))

(declare-fun b!180471 () Bool)

(declare-fun res!85484 () Bool)

(assert (=> b!180471 (=> (not res!85484) (not e!118891))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!180471 (= res!85484 (not (= key!828 (bvneg key!828))))))

(declare-fun b!180472 () Bool)

(declare-fun e!118893 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!180472 (= e!118893 (not (validMask!0 (mask!8705 thiss!1248))))))

(declare-fun b!180473 () Bool)

(declare-fun e!118892 () Bool)

(declare-fun e!118890 () Bool)

(assert (=> b!180473 (= e!118892 (and e!118890 mapRes!7252))))

(declare-fun condMapEmpty!7252 () Bool)

(declare-fun mapDefault!7252 () ValueCell!1774)

