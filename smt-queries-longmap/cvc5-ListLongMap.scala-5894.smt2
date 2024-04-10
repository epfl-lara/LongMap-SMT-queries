; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76122 () Bool)

(assert start!76122)

(declare-fun b!894371 () Bool)

(declare-fun b_free!15865 () Bool)

(declare-fun b_next!15865 () Bool)

(assert (=> b!894371 (= b_free!15865 (not b_next!15865))))

(declare-fun tp!55579 () Bool)

(declare-fun b_and!26151 () Bool)

(assert (=> b!894371 (= tp!55579 b_and!26151)))

(declare-fun b!894366 () Bool)

(declare-fun e!499539 () Bool)

(declare-fun e!499542 () Bool)

(declare-fun mapRes!28860 () Bool)

(assert (=> b!894366 (= e!499539 (and e!499542 mapRes!28860))))

(declare-fun condMapEmpty!28860 () Bool)

(declare-datatypes ((array!52374 0))(
  ( (array!52375 (arr!25189 (Array (_ BitVec 32) (_ BitVec 64))) (size!25635 (_ BitVec 32))) )
))
(declare-datatypes ((V!29223 0))(
  ( (V!29224 (val!9147 Int)) )
))
(declare-datatypes ((ValueCell!8615 0))(
  ( (ValueCellFull!8615 (v!11635 V!29223)) (EmptyCell!8615) )
))
(declare-datatypes ((array!52376 0))(
  ( (array!52377 (arr!25190 (Array (_ BitVec 32) ValueCell!8615)) (size!25636 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4246 0))(
  ( (LongMapFixedSize!4247 (defaultEntry!5335 Int) (mask!25892 (_ BitVec 32)) (extraKeys!5031 (_ BitVec 32)) (zeroValue!5135 V!29223) (minValue!5135 V!29223) (_size!2178 (_ BitVec 32)) (_keys!10032 array!52374) (_values!5322 array!52376) (_vacant!2178 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4246)

(declare-fun mapDefault!28860 () ValueCell!8615)

