; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81512 () Bool)

(assert start!81512)

(declare-fun b!952507 () Bool)

(declare-fun b_free!18293 () Bool)

(declare-fun b_next!18293 () Bool)

(assert (=> b!952507 (= b_free!18293 (not b_next!18293))))

(declare-fun tp!63501 () Bool)

(declare-fun b_and!29773 () Bool)

(assert (=> b!952507 (= tp!63501 b_and!29773)))

(declare-fun b!952503 () Bool)

(declare-fun e!536436 () Bool)

(declare-fun e!536438 () Bool)

(declare-fun mapRes!33139 () Bool)

(assert (=> b!952503 (= e!536436 (and e!536438 mapRes!33139))))

(declare-fun condMapEmpty!33139 () Bool)

(declare-datatypes ((V!32699 0))(
  ( (V!32700 (val!10451 Int)) )
))
(declare-datatypes ((ValueCell!9919 0))(
  ( (ValueCellFull!9919 (v!13002 V!32699)) (EmptyCell!9919) )
))
(declare-datatypes ((array!57636 0))(
  ( (array!57637 (arr!27710 (Array (_ BitVec 32) ValueCell!9919)) (size!28189 (_ BitVec 32))) )
))
(declare-datatypes ((array!57638 0))(
  ( (array!57639 (arr!27711 (Array (_ BitVec 32) (_ BitVec 64))) (size!28190 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4988 0))(
  ( (LongMapFixedSize!4989 (defaultEntry!5825 Int) (mask!27673 (_ BitVec 32)) (extraKeys!5557 (_ BitVec 32)) (zeroValue!5661 V!32699) (minValue!5661 V!32699) (_size!2549 (_ BitVec 32)) (_keys!10779 array!57638) (_values!5848 array!57636) (_vacant!2549 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4988)

(declare-fun mapDefault!33139 () ValueCell!9919)

