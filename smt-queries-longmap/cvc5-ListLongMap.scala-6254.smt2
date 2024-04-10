; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79990 () Bool)

(assert start!79990)

(declare-fun b!940364 () Bool)

(declare-fun b_free!17845 () Bool)

(declare-fun b_next!17845 () Bool)

(assert (=> b!940364 (= b_free!17845 (not b_next!17845))))

(declare-fun tp!62009 () Bool)

(declare-fun b_and!29257 () Bool)

(assert (=> b!940364 (= tp!62009 b_and!29257)))

(declare-fun res!632300 () Bool)

(declare-fun e!528436 () Bool)

(assert (=> start!79990 (=> (not res!632300) (not e!528436))))

(declare-datatypes ((V!32103 0))(
  ( (V!32104 (val!10227 Int)) )
))
(declare-datatypes ((ValueCell!9695 0))(
  ( (ValueCellFull!9695 (v!12758 V!32103)) (EmptyCell!9695) )
))
(declare-datatypes ((array!56654 0))(
  ( (array!56655 (arr!27262 (Array (_ BitVec 32) ValueCell!9695)) (size!27723 (_ BitVec 32))) )
))
(declare-datatypes ((array!56656 0))(
  ( (array!56657 (arr!27263 (Array (_ BitVec 32) (_ BitVec 64))) (size!27724 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4540 0))(
  ( (LongMapFixedSize!4541 (defaultEntry!5561 Int) (mask!27100 (_ BitVec 32)) (extraKeys!5293 (_ BitVec 32)) (zeroValue!5397 V!32103) (minValue!5397 V!32103) (_size!2325 (_ BitVec 32)) (_keys!10411 array!56656) (_values!5584 array!56654) (_vacant!2325 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4540)

(declare-fun valid!1741 (LongMapFixedSize!4540) Bool)

(assert (=> start!79990 (= res!632300 (valid!1741 thiss!1141))))

(assert (=> start!79990 e!528436))

(declare-fun e!528429 () Bool)

(assert (=> start!79990 e!528429))

(assert (=> start!79990 true))

(declare-fun b!940356 () Bool)

(declare-fun e!528430 () Bool)

(declare-fun e!528433 () Bool)

(declare-fun mapRes!32320 () Bool)

(assert (=> b!940356 (= e!528430 (and e!528433 mapRes!32320))))

(declare-fun condMapEmpty!32320 () Bool)

(declare-fun mapDefault!32320 () ValueCell!9695)

