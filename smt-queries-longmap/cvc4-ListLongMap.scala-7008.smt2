; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89036 () Bool)

(assert start!89036)

(declare-fun b!1020947 () Bool)

(declare-fun b_free!20105 () Bool)

(declare-fun b_next!20105 () Bool)

(assert (=> b!1020947 (= b_free!20105 (not b_next!20105))))

(declare-fun tp!71341 () Bool)

(declare-fun b_and!32293 () Bool)

(assert (=> b!1020947 (= tp!71341 b_and!32293)))

(declare-fun b!1020944 () Bool)

(declare-fun e!574801 () Bool)

(declare-fun e!574802 () Bool)

(declare-fun mapRes!37146 () Bool)

(assert (=> b!1020944 (= e!574801 (and e!574802 mapRes!37146))))

(declare-fun condMapEmpty!37146 () Bool)

(declare-datatypes ((V!36639 0))(
  ( (V!36640 (val!11963 Int)) )
))
(declare-datatypes ((array!63688 0))(
  ( (array!63689 (arr!30659 (Array (_ BitVec 32) (_ BitVec 64))) (size!31170 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!11209 0))(
  ( (ValueCellFull!11209 (v!14513 V!36639)) (EmptyCell!11209) )
))
(declare-datatypes ((array!63690 0))(
  ( (array!63691 (arr!30660 (Array (_ BitVec 32) ValueCell!11209)) (size!31171 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5012 0))(
  ( (LongMapFixedSize!5013 (defaultEntry!5858 Int) (mask!29415 (_ BitVec 32)) (extraKeys!5590 (_ BitVec 32)) (zeroValue!5694 V!36639) (minValue!5694 V!36639) (_size!2561 (_ BitVec 32)) (_keys!11003 array!63688) (_values!5881 array!63690) (_vacant!2561 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1086 0))(
  ( (Cell!1087 (v!14514 LongMapFixedSize!5012)) )
))
(declare-datatypes ((LongMap!1086 0))(
  ( (LongMap!1087 (underlying!554 Cell!1086)) )
))
(declare-fun thiss!908 () LongMap!1086)

(declare-fun mapDefault!37146 () ValueCell!11209)

