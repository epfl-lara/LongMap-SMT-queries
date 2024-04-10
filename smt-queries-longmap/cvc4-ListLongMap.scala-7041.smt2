; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89262 () Bool)

(assert start!89262)

(declare-fun b!1023549 () Bool)

(declare-fun b_free!20303 () Bool)

(declare-fun b_next!20303 () Bool)

(assert (=> b!1023549 (= b_free!20303 (not b_next!20303))))

(declare-fun tp!71943 () Bool)

(declare-fun b_and!32525 () Bool)

(assert (=> b!1023549 (= tp!71943 b_and!32525)))

(declare-fun b!1023545 () Bool)

(declare-fun e!576760 () Bool)

(declare-fun e!576762 () Bool)

(declare-fun mapRes!37452 () Bool)

(assert (=> b!1023545 (= e!576760 (and e!576762 mapRes!37452))))

(declare-fun condMapEmpty!37452 () Bool)

(declare-datatypes ((V!36903 0))(
  ( (V!36904 (val!12062 Int)) )
))
(declare-datatypes ((ValueCell!11308 0))(
  ( (ValueCellFull!11308 (v!14631 V!36903)) (EmptyCell!11308) )
))
(declare-datatypes ((array!64090 0))(
  ( (array!64091 (arr!30857 (Array (_ BitVec 32) (_ BitVec 64))) (size!31368 (_ BitVec 32))) )
))
(declare-datatypes ((array!64092 0))(
  ( (array!64093 (arr!30858 (Array (_ BitVec 32) ValueCell!11308)) (size!31369 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5210 0))(
  ( (LongMapFixedSize!5211 (defaultEntry!5957 Int) (mask!29580 (_ BitVec 32)) (extraKeys!5689 (_ BitVec 32)) (zeroValue!5793 V!36903) (minValue!5793 V!36903) (_size!2660 (_ BitVec 32)) (_keys!11102 array!64090) (_values!5980 array!64092) (_vacant!2660 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5210)

(declare-fun mapDefault!37452 () ValueCell!11308)

