; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40058 () Bool)

(assert start!40058)

(declare-fun b_free!10325 () Bool)

(declare-fun b_next!10325 () Bool)

(assert (=> start!40058 (= b_free!10325 (not b_next!10325))))

(declare-fun tp!36504 () Bool)

(declare-fun b_and!18293 () Bool)

(assert (=> start!40058 (= tp!36504 b_and!18293)))

(declare-fun b!437156 () Bool)

(declare-fun e!258057 () Bool)

(declare-fun tp_is_empty!11477 () Bool)

(assert (=> b!437156 (= e!258057 tp_is_empty!11477)))

(declare-fun b!437157 () Bool)

(declare-fun res!257834 () Bool)

(declare-fun e!258055 () Bool)

(assert (=> b!437157 (=> (not res!257834) (not e!258055))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437157 (= res!257834 (validKeyInArray!0 k!794))))

(declare-fun b!437158 () Bool)

(declare-fun e!258058 () Bool)

(declare-fun mapRes!18837 () Bool)

(assert (=> b!437158 (= e!258058 (and e!258057 mapRes!18837))))

(declare-fun condMapEmpty!18837 () Bool)

(declare-datatypes ((V!16407 0))(
  ( (V!16408 (val!5783 Int)) )
))
(declare-datatypes ((ValueCell!5395 0))(
  ( (ValueCellFull!5395 (v!8030 V!16407)) (EmptyCell!5395) )
))
(declare-datatypes ((array!26777 0))(
  ( (array!26778 (arr!12838 (Array (_ BitVec 32) ValueCell!5395)) (size!13190 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26777)

(declare-fun mapDefault!18837 () ValueCell!5395)

