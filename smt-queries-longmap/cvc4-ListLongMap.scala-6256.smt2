; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80006 () Bool)

(assert start!80006)

(declare-fun b!940601 () Bool)

(declare-fun b_free!17861 () Bool)

(declare-fun b_next!17861 () Bool)

(assert (=> b!940601 (= b_free!17861 (not b_next!17861))))

(declare-fun tp!62057 () Bool)

(declare-fun b_and!29273 () Bool)

(assert (=> b!940601 (= tp!62057 b_and!29273)))

(declare-fun b!940596 () Bool)

(declare-fun res!632444 () Bool)

(declare-fun e!528626 () Bool)

(assert (=> b!940596 (=> res!632444 e!528626)))

(declare-datatypes ((V!32123 0))(
  ( (V!32124 (val!10235 Int)) )
))
(declare-datatypes ((ValueCell!9703 0))(
  ( (ValueCellFull!9703 (v!12766 V!32123)) (EmptyCell!9703) )
))
(declare-datatypes ((array!56686 0))(
  ( (array!56687 (arr!27278 (Array (_ BitVec 32) ValueCell!9703)) (size!27739 (_ BitVec 32))) )
))
(declare-datatypes ((array!56688 0))(
  ( (array!56689 (arr!27279 (Array (_ BitVec 32) (_ BitVec 64))) (size!27740 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4556 0))(
  ( (LongMapFixedSize!4557 (defaultEntry!5569 Int) (mask!27112 (_ BitVec 32)) (extraKeys!5301 (_ BitVec 32)) (zeroValue!5405 V!32123) (minValue!5405 V!32123) (_size!2333 (_ BitVec 32)) (_keys!10419 array!56688) (_values!5592 array!56686) (_vacant!2333 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4556)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56688 (_ BitVec 32)) Bool)

(assert (=> b!940596 (= res!632444 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10419 thiss!1141) (mask!27112 thiss!1141))))))

(declare-fun b!940597 () Bool)

(declare-fun e!528624 () Bool)

(declare-fun e!528628 () Bool)

(declare-fun mapRes!32344 () Bool)

(assert (=> b!940597 (= e!528624 (and e!528628 mapRes!32344))))

(declare-fun condMapEmpty!32344 () Bool)

(declare-fun mapDefault!32344 () ValueCell!9703)

