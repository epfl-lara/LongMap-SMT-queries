; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89370 () Bool)

(assert start!89370)

(declare-fun b!1024469 () Bool)

(declare-fun b_free!20369 () Bool)

(declare-fun b_next!20369 () Bool)

(assert (=> b!1024469 (= b_free!20369 (not b_next!20369))))

(declare-fun tp!72152 () Bool)

(declare-fun b_and!32615 () Bool)

(assert (=> b!1024469 (= tp!72152 b_and!32615)))

(declare-fun b!1024462 () Bool)

(declare-fun e!577483 () Bool)

(declare-fun e!577484 () Bool)

(declare-fun mapRes!37562 () Bool)

(assert (=> b!1024462 (= e!577483 (and e!577484 mapRes!37562))))

(declare-fun condMapEmpty!37562 () Bool)

(declare-datatypes ((V!36991 0))(
  ( (V!36992 (val!12095 Int)) )
))
(declare-datatypes ((ValueCell!11341 0))(
  ( (ValueCellFull!11341 (v!14664 V!36991)) (EmptyCell!11341) )
))
(declare-datatypes ((array!64228 0))(
  ( (array!64229 (arr!30923 (Array (_ BitVec 32) (_ BitVec 64))) (size!31436 (_ BitVec 32))) )
))
(declare-datatypes ((array!64230 0))(
  ( (array!64231 (arr!30924 (Array (_ BitVec 32) ValueCell!11341)) (size!31437 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5276 0))(
  ( (LongMapFixedSize!5277 (defaultEntry!5990 Int) (mask!29640 (_ BitVec 32)) (extraKeys!5722 (_ BitVec 32)) (zeroValue!5826 V!36991) (minValue!5826 V!36991) (_size!2693 (_ BitVec 32)) (_keys!11137 array!64228) (_values!6013 array!64230) (_vacant!2693 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5276)

(declare-fun mapDefault!37562 () ValueCell!11341)

