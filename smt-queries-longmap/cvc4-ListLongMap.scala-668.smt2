; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16502 () Bool)

(assert start!16502)

(declare-fun b!164126 () Bool)

(declare-fun b_free!3821 () Bool)

(declare-fun b_next!3821 () Bool)

(assert (=> b!164126 (= b_free!3821 (not b_next!3821))))

(declare-fun tp!14061 () Bool)

(declare-fun b_and!10235 () Bool)

(assert (=> b!164126 (= tp!14061 b_and!10235)))

(declare-fun b!164121 () Bool)

(declare-fun e!107690 () Bool)

(declare-fun e!107686 () Bool)

(declare-fun mapRes!6150 () Bool)

(assert (=> b!164121 (= e!107690 (and e!107686 mapRes!6150))))

(declare-fun condMapEmpty!6150 () Bool)

(declare-datatypes ((V!4477 0))(
  ( (V!4478 (val!1856 Int)) )
))
(declare-datatypes ((ValueCell!1468 0))(
  ( (ValueCellFull!1468 (v!3721 V!4477)) (EmptyCell!1468) )
))
(declare-datatypes ((array!6341 0))(
  ( (array!6342 (arr!3007 (Array (_ BitVec 32) (_ BitVec 64))) (size!3295 (_ BitVec 32))) )
))
(declare-datatypes ((array!6343 0))(
  ( (array!6344 (arr!3008 (Array (_ BitVec 32) ValueCell!1468)) (size!3296 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1844 0))(
  ( (LongMapFixedSize!1845 (defaultEntry!3364 Int) (mask!8046 (_ BitVec 32)) (extraKeys!3105 (_ BitVec 32)) (zeroValue!3207 V!4477) (minValue!3207 V!4477) (_size!971 (_ BitVec 32)) (_keys!5187 array!6341) (_values!3347 array!6343) (_vacant!971 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1844)

(declare-fun mapDefault!6150 () ValueCell!1468)

