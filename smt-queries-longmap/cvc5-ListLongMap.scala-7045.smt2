; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89282 () Bool)

(assert start!89282)

(declare-fun b!1023770 () Bool)

(declare-fun b_free!20323 () Bool)

(declare-fun b_next!20323 () Bool)

(assert (=> b!1023770 (= b_free!20323 (not b_next!20323))))

(declare-fun tp!72004 () Bool)

(declare-fun b_and!32557 () Bool)

(assert (=> b!1023770 (= tp!72004 b_and!32557)))

(declare-fun mapNonEmpty!37482 () Bool)

(declare-fun mapRes!37482 () Bool)

(declare-fun tp!72003 () Bool)

(declare-fun e!576941 () Bool)

(assert (=> mapNonEmpty!37482 (= mapRes!37482 (and tp!72003 e!576941))))

(declare-datatypes ((V!36931 0))(
  ( (V!36932 (val!12072 Int)) )
))
(declare-datatypes ((ValueCell!11318 0))(
  ( (ValueCellFull!11318 (v!14641 V!36931)) (EmptyCell!11318) )
))
(declare-fun mapValue!37482 () ValueCell!11318)

(declare-fun mapKey!37482 () (_ BitVec 32))

(declare-fun mapRest!37482 () (Array (_ BitVec 32) ValueCell!11318))

(declare-datatypes ((array!64130 0))(
  ( (array!64131 (arr!30877 (Array (_ BitVec 32) (_ BitVec 64))) (size!31388 (_ BitVec 32))) )
))
(declare-datatypes ((array!64132 0))(
  ( (array!64133 (arr!30878 (Array (_ BitVec 32) ValueCell!11318)) (size!31389 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5230 0))(
  ( (LongMapFixedSize!5231 (defaultEntry!5967 Int) (mask!29598 (_ BitVec 32)) (extraKeys!5699 (_ BitVec 32)) (zeroValue!5803 V!36931) (minValue!5803 V!36931) (_size!2670 (_ BitVec 32)) (_keys!11112 array!64130) (_values!5990 array!64132) (_vacant!2670 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5230)

(assert (=> mapNonEmpty!37482 (= (arr!30878 (_values!5990 thiss!1427)) (store mapRest!37482 mapKey!37482 mapValue!37482))))

(declare-fun res!685579 () Bool)

(declare-fun e!576943 () Bool)

(assert (=> start!89282 (=> (not res!685579) (not e!576943))))

(declare-fun valid!1992 (LongMapFixedSize!5230) Bool)

(assert (=> start!89282 (= res!685579 (valid!1992 thiss!1427))))

(assert (=> start!89282 e!576943))

(declare-fun e!576940 () Bool)

(assert (=> start!89282 e!576940))

(assert (=> start!89282 true))

(declare-fun mapIsEmpty!37482 () Bool)

(assert (=> mapIsEmpty!37482 mapRes!37482))

(declare-fun b!1023767 () Bool)

(declare-fun e!576945 () Bool)

(declare-fun e!576942 () Bool)

(assert (=> b!1023767 (= e!576945 (and e!576942 mapRes!37482))))

(declare-fun condMapEmpty!37482 () Bool)

(declare-fun mapDefault!37482 () ValueCell!11318)

