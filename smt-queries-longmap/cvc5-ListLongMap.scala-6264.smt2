; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80060 () Bool)

(assert start!80060)

(declare-fun b!941236 () Bool)

(declare-fun b_free!17905 () Bool)

(declare-fun b_next!17905 () Bool)

(assert (=> b!941236 (= b_free!17905 (not b_next!17905))))

(declare-fun tp!62192 () Bool)

(declare-fun b_and!29317 () Bool)

(assert (=> b!941236 (= tp!62192 b_and!29317)))

(declare-fun b!941233 () Bool)

(declare-fun res!632792 () Bool)

(declare-fun e!529139 () Bool)

(assert (=> b!941233 (=> (not res!632792) (not e!529139))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!941233 (= res!632792 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!32413 () Bool)

(declare-fun mapRes!32413 () Bool)

(assert (=> mapIsEmpty!32413 mapRes!32413))

(declare-fun b!941234 () Bool)

(declare-fun e!529140 () Bool)

(declare-fun e!529137 () Bool)

(assert (=> b!941234 (= e!529140 (and e!529137 mapRes!32413))))

(declare-fun condMapEmpty!32413 () Bool)

(declare-datatypes ((V!32183 0))(
  ( (V!32184 (val!10257 Int)) )
))
(declare-datatypes ((ValueCell!9725 0))(
  ( (ValueCellFull!9725 (v!12788 V!32183)) (EmptyCell!9725) )
))
(declare-datatypes ((array!56776 0))(
  ( (array!56777 (arr!27322 (Array (_ BitVec 32) ValueCell!9725)) (size!27783 (_ BitVec 32))) )
))
(declare-datatypes ((array!56778 0))(
  ( (array!56779 (arr!27323 (Array (_ BitVec 32) (_ BitVec 64))) (size!27784 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4600 0))(
  ( (LongMapFixedSize!4601 (defaultEntry!5591 Int) (mask!27152 (_ BitVec 32)) (extraKeys!5323 (_ BitVec 32)) (zeroValue!5427 V!32183) (minValue!5427 V!32183) (_size!2355 (_ BitVec 32)) (_keys!10442 array!56778) (_values!5614 array!56776) (_vacant!2355 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4600)

(declare-fun mapDefault!32413 () ValueCell!9725)

