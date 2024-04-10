; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89240 () Bool)

(assert start!89240)

(declare-fun b!1023255 () Bool)

(declare-fun b_free!20281 () Bool)

(declare-fun b_next!20281 () Bool)

(assert (=> b!1023255 (= b_free!20281 (not b_next!20281))))

(declare-fun tp!71878 () Bool)

(declare-fun b_and!32503 () Bool)

(assert (=> b!1023255 (= tp!71878 b_and!32503)))

(declare-fun mapIsEmpty!37419 () Bool)

(declare-fun mapRes!37419 () Bool)

(assert (=> mapIsEmpty!37419 mapRes!37419))

(declare-fun mapNonEmpty!37419 () Bool)

(declare-fun tp!71877 () Bool)

(declare-fun e!576565 () Bool)

(assert (=> mapNonEmpty!37419 (= mapRes!37419 (and tp!71877 e!576565))))

(declare-datatypes ((V!36875 0))(
  ( (V!36876 (val!12051 Int)) )
))
(declare-datatypes ((ValueCell!11297 0))(
  ( (ValueCellFull!11297 (v!14620 V!36875)) (EmptyCell!11297) )
))
(declare-datatypes ((array!64046 0))(
  ( (array!64047 (arr!30835 (Array (_ BitVec 32) (_ BitVec 64))) (size!31346 (_ BitVec 32))) )
))
(declare-datatypes ((array!64048 0))(
  ( (array!64049 (arr!30836 (Array (_ BitVec 32) ValueCell!11297)) (size!31347 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5188 0))(
  ( (LongMapFixedSize!5189 (defaultEntry!5946 Int) (mask!29563 (_ BitVec 32)) (extraKeys!5678 (_ BitVec 32)) (zeroValue!5782 V!36875) (minValue!5782 V!36875) (_size!2649 (_ BitVec 32)) (_keys!11091 array!64046) (_values!5969 array!64048) (_vacant!2649 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5188)

(declare-fun mapValue!37419 () ValueCell!11297)

(declare-fun mapRest!37419 () (Array (_ BitVec 32) ValueCell!11297))

(declare-fun mapKey!37419 () (_ BitVec 32))

(assert (=> mapNonEmpty!37419 (= (arr!30836 (_values!5969 thiss!1427)) (store mapRest!37419 mapKey!37419 mapValue!37419))))

(declare-fun b!1023249 () Bool)

(declare-fun e!576562 () Bool)

(assert (=> b!1023249 (= e!576562 false)))

(declare-fun lt!450387 () Bool)

(declare-datatypes ((List!21708 0))(
  ( (Nil!21705) (Cons!21704 (h!22902 (_ BitVec 64)) (t!30746 List!21708)) )
))
(declare-fun arrayNoDuplicates!0 (array!64046 (_ BitVec 32) List!21708) Bool)

(assert (=> b!1023249 (= lt!450387 (arrayNoDuplicates!0 (_keys!11091 thiss!1427) #b00000000000000000000000000000000 Nil!21705))))

(declare-fun b!1023250 () Bool)

(declare-fun res!685326 () Bool)

(assert (=> b!1023250 (=> (not res!685326) (not e!576562))))

(assert (=> b!1023250 (= res!685326 (and (= (size!31347 (_values!5969 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29563 thiss!1427))) (= (size!31346 (_keys!11091 thiss!1427)) (size!31347 (_values!5969 thiss!1427))) (bvsge (mask!29563 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5678 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5678 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5678 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5678 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5678 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5678 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5678 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1023251 () Bool)

(declare-fun res!685328 () Bool)

(assert (=> b!1023251 (=> (not res!685328) (not e!576562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023251 (= res!685328 (validMask!0 (mask!29563 thiss!1427)))))

(declare-fun b!1023252 () Bool)

(declare-fun res!685325 () Bool)

(assert (=> b!1023252 (=> (not res!685325) (not e!576562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64046 (_ BitVec 32)) Bool)

(assert (=> b!1023252 (= res!685325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11091 thiss!1427) (mask!29563 thiss!1427)))))

(declare-fun b!1023253 () Bool)

(declare-fun tp_is_empty!24001 () Bool)

(assert (=> b!1023253 (= e!576565 tp_is_empty!24001)))

(declare-fun b!1023254 () Bool)

(declare-fun e!576564 () Bool)

(assert (=> b!1023254 (= e!576564 tp_is_empty!24001)))

(declare-fun e!576563 () Bool)

(declare-fun e!576567 () Bool)

(declare-fun array_inv!23893 (array!64046) Bool)

(declare-fun array_inv!23894 (array!64048) Bool)

(assert (=> b!1023255 (= e!576563 (and tp!71878 tp_is_empty!24001 (array_inv!23893 (_keys!11091 thiss!1427)) (array_inv!23894 (_values!5969 thiss!1427)) e!576567))))

(declare-fun b!1023256 () Bool)

(assert (=> b!1023256 (= e!576567 (and e!576564 mapRes!37419))))

(declare-fun condMapEmpty!37419 () Bool)

(declare-fun mapDefault!37419 () ValueCell!11297)

