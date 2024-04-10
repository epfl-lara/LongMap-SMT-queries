; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79954 () Bool)

(assert start!79954)

(declare-fun b!939956 () Bool)

(declare-fun b_free!17809 () Bool)

(declare-fun b_next!17809 () Bool)

(assert (=> b!939956 (= b_free!17809 (not b_next!17809))))

(declare-fun tp!61902 () Bool)

(declare-fun b_and!29221 () Bool)

(assert (=> b!939956 (= tp!61902 b_and!29221)))

(declare-fun b!939952 () Bool)

(declare-fun e!528065 () Bool)

(declare-fun e!528066 () Bool)

(declare-fun mapRes!32266 () Bool)

(assert (=> b!939952 (= e!528065 (and e!528066 mapRes!32266))))

(declare-fun condMapEmpty!32266 () Bool)

(declare-datatypes ((V!32055 0))(
  ( (V!32056 (val!10209 Int)) )
))
(declare-datatypes ((ValueCell!9677 0))(
  ( (ValueCellFull!9677 (v!12740 V!32055)) (EmptyCell!9677) )
))
(declare-datatypes ((array!56582 0))(
  ( (array!56583 (arr!27226 (Array (_ BitVec 32) ValueCell!9677)) (size!27687 (_ BitVec 32))) )
))
(declare-datatypes ((array!56584 0))(
  ( (array!56585 (arr!27227 (Array (_ BitVec 32) (_ BitVec 64))) (size!27688 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4504 0))(
  ( (LongMapFixedSize!4505 (defaultEntry!5543 Int) (mask!27070 (_ BitVec 32)) (extraKeys!5275 (_ BitVec 32)) (zeroValue!5379 V!32055) (minValue!5379 V!32055) (_size!2307 (_ BitVec 32)) (_keys!10393 array!56584) (_values!5566 array!56582) (_vacant!2307 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4504)

(declare-fun mapDefault!32266 () ValueCell!9677)

