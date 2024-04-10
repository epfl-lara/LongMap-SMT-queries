; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41074 () Bool)

(assert start!41074)

(declare-fun b_free!10987 () Bool)

(declare-fun b_next!10987 () Bool)

(assert (=> start!41074 (= b_free!10987 (not b_next!10987))))

(declare-fun tp!38790 () Bool)

(declare-fun b_and!19181 () Bool)

(assert (=> start!41074 (= tp!38790 b_and!19181)))

(declare-fun b!458197 () Bool)

(declare-fun res!273728 () Bool)

(declare-fun e!267515 () Bool)

(assert (=> b!458197 (=> (not res!273728) (not e!267515))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!458197 (= res!273728 (validKeyInArray!0 k!794))))

(declare-fun mapIsEmpty!20131 () Bool)

(declare-fun mapRes!20131 () Bool)

(assert (=> mapIsEmpty!20131 mapRes!20131))

(declare-fun b!458198 () Bool)

(declare-fun e!267519 () Bool)

(declare-fun e!267520 () Bool)

(assert (=> b!458198 (= e!267519 (and e!267520 mapRes!20131))))

(declare-fun condMapEmpty!20131 () Bool)

(declare-datatypes ((V!17539 0))(
  ( (V!17540 (val!6207 Int)) )
))
(declare-datatypes ((ValueCell!5819 0))(
  ( (ValueCellFull!5819 (v!8477 V!17539)) (EmptyCell!5819) )
))
(declare-datatypes ((array!28451 0))(
  ( (array!28452 (arr!13668 (Array (_ BitVec 32) ValueCell!5819)) (size!14020 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28451)

(declare-fun mapDefault!20131 () ValueCell!5819)

