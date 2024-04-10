; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16430 () Bool)

(assert start!16430)

(declare-fun b!163569 () Bool)

(declare-fun b_free!3799 () Bool)

(declare-fun b_next!3799 () Bool)

(assert (=> b!163569 (= b_free!3799 (not b_next!3799))))

(declare-fun tp!13985 () Bool)

(declare-fun b_and!10213 () Bool)

(assert (=> b!163569 (= tp!13985 b_and!10213)))

(declare-fun b!163564 () Bool)

(declare-fun e!107314 () Bool)

(declare-fun e!107315 () Bool)

(declare-fun mapRes!6107 () Bool)

(assert (=> b!163564 (= e!107314 (and e!107315 mapRes!6107))))

(declare-fun condMapEmpty!6107 () Bool)

(declare-datatypes ((V!4449 0))(
  ( (V!4450 (val!1845 Int)) )
))
(declare-datatypes ((ValueCell!1457 0))(
  ( (ValueCellFull!1457 (v!3710 V!4449)) (EmptyCell!1457) )
))
(declare-datatypes ((array!6291 0))(
  ( (array!6292 (arr!2985 (Array (_ BitVec 32) (_ BitVec 64))) (size!3272 (_ BitVec 32))) )
))
(declare-datatypes ((array!6293 0))(
  ( (array!6294 (arr!2986 (Array (_ BitVec 32) ValueCell!1457)) (size!3273 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1822 0))(
  ( (LongMapFixedSize!1823 (defaultEntry!3353 Int) (mask!8017 (_ BitVec 32)) (extraKeys!3094 (_ BitVec 32)) (zeroValue!3196 V!4449) (minValue!3196 V!4449) (_size!960 (_ BitVec 32)) (_keys!5168 array!6291) (_values!3336 array!6293) (_vacant!960 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1822)

(declare-fun mapDefault!6107 () ValueCell!1457)

