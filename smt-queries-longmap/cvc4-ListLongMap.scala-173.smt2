; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3302 () Bool)

(assert start!3302)

(declare-fun b!20374 () Bool)

(declare-fun b_free!719 () Bool)

(declare-fun b_next!719 () Bool)

(assert (=> b!20374 (= b_free!719 (not b_next!719))))

(declare-fun tp!3384 () Bool)

(declare-fun b_and!1395 () Bool)

(assert (=> b!20374 (= tp!3384 b_and!1395)))

(declare-fun b!20368 () Bool)

(declare-fun e!13328 () Bool)

(declare-fun e!13324 () Bool)

(declare-fun mapRes!946 () Bool)

(assert (=> b!20368 (= e!13328 (and e!13324 mapRes!946))))

(declare-fun condMapEmpty!946 () Bool)

(declare-datatypes ((V!1135 0))(
  ( (V!1136 (val!518 Int)) )
))
(declare-datatypes ((ValueCell!292 0))(
  ( (ValueCellFull!292 (v!1553 V!1135)) (EmptyCell!292) )
))
(declare-datatypes ((array!1191 0))(
  ( (array!1192 (arr!567 (Array (_ BitVec 32) ValueCell!292)) (size!660 (_ BitVec 32))) )
))
(declare-datatypes ((array!1193 0))(
  ( (array!1194 (arr!568 (Array (_ BitVec 32) (_ BitVec 64))) (size!661 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!170 0))(
  ( (LongMapFixedSize!171 (defaultEntry!1708 Int) (mask!4672 (_ BitVec 32)) (extraKeys!1614 (_ BitVec 32)) (zeroValue!1638 V!1135) (minValue!1638 V!1135) (_size!123 (_ BitVec 32)) (_keys!3132 array!1193) (_values!1700 array!1191) (_vacant!123 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!170 0))(
  ( (Cell!171 (v!1554 LongMapFixedSize!170)) )
))
(declare-datatypes ((LongMap!170 0))(
  ( (LongMap!171 (underlying!96 Cell!170)) )
))
(declare-fun thiss!938 () LongMap!170)

(declare-fun mapDefault!946 () ValueCell!292)

