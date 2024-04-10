; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89396 () Bool)

(assert start!89396)

(declare-fun b!1024900 () Bool)

(declare-fun b_free!20395 () Bool)

(declare-fun b_next!20395 () Bool)

(assert (=> b!1024900 (= b_free!20395 (not b_next!20395))))

(declare-fun tp!72231 () Bool)

(declare-fun b_and!32641 () Bool)

(assert (=> b!1024900 (= tp!72231 b_and!32641)))

(declare-fun mapIsEmpty!37601 () Bool)

(declare-fun mapRes!37601 () Bool)

(assert (=> mapIsEmpty!37601 mapRes!37601))

(declare-fun b!1024891 () Bool)

(declare-fun e!577791 () Bool)

(declare-fun e!577797 () Bool)

(assert (=> b!1024891 (= e!577791 (and e!577797 mapRes!37601))))

(declare-fun condMapEmpty!37601 () Bool)

(declare-datatypes ((V!37027 0))(
  ( (V!37028 (val!12108 Int)) )
))
(declare-datatypes ((ValueCell!11354 0))(
  ( (ValueCellFull!11354 (v!14677 V!37027)) (EmptyCell!11354) )
))
(declare-datatypes ((array!64280 0))(
  ( (array!64281 (arr!30949 (Array (_ BitVec 32) (_ BitVec 64))) (size!31462 (_ BitVec 32))) )
))
(declare-datatypes ((array!64282 0))(
  ( (array!64283 (arr!30950 (Array (_ BitVec 32) ValueCell!11354)) (size!31463 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5302 0))(
  ( (LongMapFixedSize!5303 (defaultEntry!6003 Int) (mask!29663 (_ BitVec 32)) (extraKeys!5735 (_ BitVec 32)) (zeroValue!5839 V!37027) (minValue!5839 V!37027) (_size!2706 (_ BitVec 32)) (_keys!11150 array!64280) (_values!6026 array!64282) (_vacant!2706 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5302)

(declare-fun mapDefault!37601 () ValueCell!11354)

