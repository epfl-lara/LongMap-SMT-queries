; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11644 () Bool)

(assert start!11644)

(declare-fun b!97236 () Bool)

(declare-fun b_free!2413 () Bool)

(declare-fun b_next!2413 () Bool)

(assert (=> b!97236 (= b_free!2413 (not b_next!2413))))

(declare-fun tp!9521 () Bool)

(declare-fun b_and!5955 () Bool)

(assert (=> b!97236 (= tp!9521 b_and!5955)))

(declare-fun b!97247 () Bool)

(declare-fun b_free!2415 () Bool)

(declare-fun b_next!2415 () Bool)

(assert (=> b!97247 (= b_free!2415 (not b_next!2415))))

(declare-fun tp!9524 () Bool)

(declare-fun b_and!5957 () Bool)

(assert (=> b!97247 (= tp!9524 b_and!5957)))

(declare-fun b!97230 () Bool)

(declare-fun res!49027 () Bool)

(declare-fun e!63381 () Bool)

(assert (=> b!97230 (=> (not res!49027) (not e!63381))))

(declare-datatypes ((V!3145 0))(
  ( (V!3146 (val!1356 Int)) )
))
(declare-datatypes ((array!4225 0))(
  ( (array!4226 (arr!2007 (Array (_ BitVec 32) (_ BitVec 64))) (size!2257 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!968 0))(
  ( (ValueCellFull!968 (v!2791 V!3145)) (EmptyCell!968) )
))
(declare-datatypes ((array!4227 0))(
  ( (array!4228 (arr!2008 (Array (_ BitVec 32) ValueCell!968)) (size!2258 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!844 0))(
  ( (LongMapFixedSize!845 (defaultEntry!2477 Int) (mask!6572 (_ BitVec 32)) (extraKeys!2298 (_ BitVec 32)) (zeroValue!2360 V!3145) (minValue!2360 V!3145) (_size!471 (_ BitVec 32)) (_keys!4167 array!4225) (_values!2460 array!4227) (_vacant!471 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!844)

(declare-datatypes ((Cell!644 0))(
  ( (Cell!645 (v!2792 LongMapFixedSize!844)) )
))
(declare-datatypes ((LongMap!644 0))(
  ( (LongMap!645 (underlying!333 Cell!644)) )
))
(declare-fun thiss!992 () LongMap!644)

(assert (=> b!97230 (= res!49027 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6572 newMap!16)) (_size!471 (v!2792 (underlying!333 thiss!992)))))))

(declare-fun b!97231 () Bool)

(declare-fun e!63391 () Bool)

(declare-fun e!63376 () Bool)

(declare-fun mapRes!3722 () Bool)

(assert (=> b!97231 (= e!63391 (and e!63376 mapRes!3722))))

(declare-fun condMapEmpty!3722 () Bool)

(declare-fun mapDefault!3721 () ValueCell!968)

