; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!448 () Bool)

(assert start!448)

(declare-fun b!2656 () Bool)

(declare-fun b_free!65 () Bool)

(declare-fun b_next!65 () Bool)

(assert (=> b!2656 (= b_free!65 (not b_next!65))))

(declare-fun tp!259 () Bool)

(declare-fun b_and!203 () Bool)

(assert (=> b!2656 (= tp!259 b_and!203)))

(declare-fun b!2654 () Bool)

(declare-fun e!989 () Bool)

(declare-fun tp_is_empty!53 () Bool)

(assert (=> b!2654 (= e!989 tp_is_empty!53)))

(declare-fun b!2655 () Bool)

(declare-fun e!987 () Bool)

(declare-fun e!993 () Bool)

(declare-fun mapRes!20 () Bool)

(assert (=> b!2655 (= e!987 (and e!993 mapRes!20))))

(declare-fun condMapEmpty!20 () Bool)

(declare-datatypes ((V!247 0))(
  ( (V!248 (val!32 Int)) )
))
(declare-datatypes ((ValueCell!10 0))(
  ( (ValueCellFull!10 (v!1117 V!247)) (EmptyCell!10) )
))
(declare-datatypes ((array!37 0))(
  ( (array!38 (arr!17 (Array (_ BitVec 32) ValueCell!10)) (size!79 (_ BitVec 32))) )
))
(declare-datatypes ((array!39 0))(
  ( (array!40 (arr!18 (Array (_ BitVec 32) (_ BitVec 64))) (size!80 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!20 0))(
  ( (LongMapFixedSize!21 (defaultEntry!1594 Int) (mask!4172 (_ BitVec 32)) (extraKeys!1511 (_ BitVec 32)) (zeroValue!1534 V!247) (minValue!1534 V!247) (_size!41 (_ BitVec 32)) (_keys!2996 array!39) (_values!1595 array!37) (_vacant!41 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!20 0))(
  ( (Cell!21 (v!1118 LongMapFixedSize!20)) )
))
(declare-datatypes ((LongMap!20 0))(
  ( (LongMap!21 (underlying!21 Cell!20)) )
))
(declare-fun thiss!814 () LongMap!20)

(declare-fun mapDefault!20 () ValueCell!10)

