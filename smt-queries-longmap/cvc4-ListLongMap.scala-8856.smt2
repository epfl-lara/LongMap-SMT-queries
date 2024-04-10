; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107438 () Bool)

(assert start!107438)

(declare-fun b!1272753 () Bool)

(declare-fun b_free!27683 () Bool)

(declare-fun b_next!27683 () Bool)

(assert (=> b!1272753 (= b_free!27683 (not b_next!27683))))

(declare-fun tp!97572 () Bool)

(declare-fun b_and!45739 () Bool)

(assert (=> b!1272753 (= tp!97572 b_and!45739)))

(declare-fun b!1272748 () Bool)

(declare-fun e!726016 () Bool)

(declare-datatypes ((V!49263 0))(
  ( (V!49264 (val!16601 Int)) )
))
(declare-datatypes ((ValueCell!15673 0))(
  ( (ValueCellFull!15673 (v!19238 V!49263)) (EmptyCell!15673) )
))
(declare-datatypes ((array!83364 0))(
  ( (array!83365 (arr!40214 (Array (_ BitVec 32) ValueCell!15673)) (size!40753 (_ BitVec 32))) )
))
(declare-datatypes ((array!83366 0))(
  ( (array!83367 (arr!40215 (Array (_ BitVec 32) (_ BitVec 64))) (size!40754 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6110 0))(
  ( (LongMapFixedSize!6111 (defaultEntry!6701 Int) (mask!34457 (_ BitVec 32)) (extraKeys!6380 (_ BitVec 32)) (zeroValue!6486 V!49263) (minValue!6486 V!49263) (_size!3110 (_ BitVec 32)) (_keys!12110 array!83366) (_values!6724 array!83364) (_vacant!3110 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6110)

(assert (=> b!1272748 (= e!726016 (and (= (size!40753 (_values!6724 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34457 thiss!1559))) (= (size!40754 (_keys!12110 thiss!1559)) (size!40753 (_values!6724 thiss!1559))) (bvslt (mask!34457 thiss!1559) #b00000000000000000000000000000000)))))

(declare-fun b!1272749 () Bool)

(declare-fun e!726013 () Bool)

(declare-fun tp_is_empty!33053 () Bool)

(assert (=> b!1272749 (= e!726013 tp_is_empty!33053)))

(declare-fun b!1272750 () Bool)

(declare-fun e!726012 () Bool)

(assert (=> b!1272750 (= e!726012 tp_is_empty!33053)))

(declare-fun b!1272751 () Bool)

(declare-fun res!846530 () Bool)

(assert (=> b!1272751 (=> (not res!846530) (not e!726016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1272751 (= res!846530 (validMask!0 (mask!34457 thiss!1559)))))

(declare-fun mapIsEmpty!51178 () Bool)

(declare-fun mapRes!51178 () Bool)

(assert (=> mapIsEmpty!51178 mapRes!51178))

(declare-fun b!1272752 () Bool)

(declare-fun e!726014 () Bool)

(assert (=> b!1272752 (= e!726014 (and e!726013 mapRes!51178))))

(declare-fun condMapEmpty!51178 () Bool)

(declare-fun mapDefault!51178 () ValueCell!15673)

