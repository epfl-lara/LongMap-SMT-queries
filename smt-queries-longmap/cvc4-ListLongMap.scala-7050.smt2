; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89358 () Bool)

(assert start!89358)

(declare-fun b!1024271 () Bool)

(declare-fun b_free!20357 () Bool)

(declare-fun b_next!20357 () Bool)

(assert (=> b!1024271 (= b_free!20357 (not b_next!20357))))

(declare-fun tp!72116 () Bool)

(declare-fun b_and!32603 () Bool)

(assert (=> b!1024271 (= tp!72116 b_and!32603)))

(declare-fun b!1024270 () Bool)

(declare-fun e!577337 () Bool)

(declare-fun e!577341 () Bool)

(declare-fun mapRes!37544 () Bool)

(assert (=> b!1024270 (= e!577337 (and e!577341 mapRes!37544))))

(declare-fun condMapEmpty!37544 () Bool)

(declare-datatypes ((V!36975 0))(
  ( (V!36976 (val!12089 Int)) )
))
(declare-datatypes ((ValueCell!11335 0))(
  ( (ValueCellFull!11335 (v!14658 V!36975)) (EmptyCell!11335) )
))
(declare-datatypes ((array!64204 0))(
  ( (array!64205 (arr!30911 (Array (_ BitVec 32) (_ BitVec 64))) (size!31424 (_ BitVec 32))) )
))
(declare-datatypes ((array!64206 0))(
  ( (array!64207 (arr!30912 (Array (_ BitVec 32) ValueCell!11335)) (size!31425 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5264 0))(
  ( (LongMapFixedSize!5265 (defaultEntry!5984 Int) (mask!29630 (_ BitVec 32)) (extraKeys!5716 (_ BitVec 32)) (zeroValue!5820 V!36975) (minValue!5820 V!36975) (_size!2687 (_ BitVec 32)) (_keys!11131 array!64204) (_values!6007 array!64206) (_vacant!2687 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5264)

(declare-fun mapDefault!37544 () ValueCell!11335)

