; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3236 () Bool)

(assert start!3236)

(declare-fun b!19686 () Bool)

(declare-fun b_free!691 () Bool)

(declare-fun b_next!691 () Bool)

(assert (=> b!19686 (= b_free!691 (not b_next!691))))

(declare-fun tp!3292 () Bool)

(declare-fun b_and!1355 () Bool)

(assert (=> b!19686 (= tp!3292 b_and!1355)))

(declare-fun b!19679 () Bool)

(declare-fun e!12777 () Bool)

(declare-fun e!12778 () Bool)

(declare-fun mapRes!895 () Bool)

(assert (=> b!19679 (= e!12777 (and e!12778 mapRes!895))))

(declare-fun condMapEmpty!895 () Bool)

(declare-datatypes ((V!1099 0))(
  ( (V!1100 (val!504 Int)) )
))
(declare-datatypes ((ValueCell!278 0))(
  ( (ValueCellFull!278 (v!1524 V!1099)) (EmptyCell!278) )
))
(declare-datatypes ((array!1129 0))(
  ( (array!1130 (arr!539 (Array (_ BitVec 32) ValueCell!278)) (size!632 (_ BitVec 32))) )
))
(declare-datatypes ((array!1131 0))(
  ( (array!1132 (arr!540 (Array (_ BitVec 32) (_ BitVec 64))) (size!633 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!142 0))(
  ( (LongMapFixedSize!143 (defaultEntry!1691 Int) (mask!4647 (_ BitVec 32)) (extraKeys!1600 (_ BitVec 32)) (zeroValue!1624 V!1099) (minValue!1624 V!1099) (_size!106 (_ BitVec 32)) (_keys!3118 array!1131) (_values!1686 array!1129) (_vacant!106 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!142 0))(
  ( (Cell!143 (v!1525 LongMapFixedSize!142)) )
))
(declare-datatypes ((LongMap!142 0))(
  ( (LongMap!143 (underlying!82 Cell!142)) )
))
(declare-fun thiss!938 () LongMap!142)

(declare-fun mapDefault!895 () ValueCell!278)

