; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89202 () Bool)

(assert start!89202)

(declare-fun b!1022742 () Bool)

(declare-fun b_free!20243 () Bool)

(declare-fun b_next!20243 () Bool)

(assert (=> b!1022742 (= b_free!20243 (not b_next!20243))))

(declare-fun tp!71763 () Bool)

(declare-fun b_and!32465 () Bool)

(assert (=> b!1022742 (= tp!71763 b_and!32465)))

(declare-fun mapIsEmpty!37362 () Bool)

(declare-fun mapRes!37362 () Bool)

(assert (=> mapIsEmpty!37362 mapRes!37362))

(declare-fun b!1022735 () Bool)

(declare-fun e!576221 () Bool)

(declare-fun e!576223 () Bool)

(assert (=> b!1022735 (= e!576221 (and e!576223 mapRes!37362))))

(declare-fun condMapEmpty!37362 () Bool)

(declare-datatypes ((V!36823 0))(
  ( (V!36824 (val!12032 Int)) )
))
(declare-datatypes ((ValueCell!11278 0))(
  ( (ValueCellFull!11278 (v!14601 V!36823)) (EmptyCell!11278) )
))
(declare-datatypes ((array!63970 0))(
  ( (array!63971 (arr!30797 (Array (_ BitVec 32) (_ BitVec 64))) (size!31308 (_ BitVec 32))) )
))
(declare-datatypes ((array!63972 0))(
  ( (array!63973 (arr!30798 (Array (_ BitVec 32) ValueCell!11278)) (size!31309 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5150 0))(
  ( (LongMapFixedSize!5151 (defaultEntry!5927 Int) (mask!29530 (_ BitVec 32)) (extraKeys!5659 (_ BitVec 32)) (zeroValue!5763 V!36823) (minValue!5763 V!36823) (_size!2630 (_ BitVec 32)) (_keys!11072 array!63970) (_values!5950 array!63972) (_vacant!2630 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5150)

(declare-fun mapDefault!37362 () ValueCell!11278)

