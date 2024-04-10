; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83308 () Bool)

(assert start!83308)

(declare-fun b_free!19301 () Bool)

(declare-fun b_next!19301 () Bool)

(assert (=> start!83308 (= b_free!19301 (not b_next!19301))))

(declare-fun tp!67182 () Bool)

(declare-fun b_and!30823 () Bool)

(assert (=> start!83308 (= tp!67182 b_and!30823)))

(declare-fun b!972406 () Bool)

(declare-fun res!650892 () Bool)

(declare-fun e!548112 () Bool)

(assert (=> b!972406 (=> (not res!650892) (not e!548112))))

(declare-datatypes ((array!60445 0))(
  ( (array!60446 (arr!29086 (Array (_ BitVec 32) (_ BitVec 64))) (size!29565 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60445)

(declare-datatypes ((List!20166 0))(
  ( (Nil!20163) (Cons!20162 (h!21324 (_ BitVec 64)) (t!28565 List!20166)) )
))
(declare-fun arrayNoDuplicates!0 (array!60445 (_ BitVec 32) List!20166) Bool)

(assert (=> b!972406 (= res!650892 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20163))))

(declare-fun res!650886 () Bool)

(assert (=> start!83308 (=> (not res!650886) (not e!548112))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83308 (= res!650886 (validMask!0 mask!2147))))

(assert (=> start!83308 e!548112))

(assert (=> start!83308 true))

(declare-datatypes ((V!34581 0))(
  ( (V!34582 (val!11150 Int)) )
))
(declare-datatypes ((ValueCell!10618 0))(
  ( (ValueCellFull!10618 (v!13709 V!34581)) (EmptyCell!10618) )
))
(declare-datatypes ((array!60447 0))(
  ( (array!60448 (arr!29087 (Array (_ BitVec 32) ValueCell!10618)) (size!29566 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60447)

(declare-fun e!548109 () Bool)

(declare-fun array_inv!22499 (array!60447) Bool)

(assert (=> start!83308 (and (array_inv!22499 _values!1425) e!548109)))

(declare-fun tp_is_empty!22199 () Bool)

(assert (=> start!83308 tp_is_empty!22199))

(assert (=> start!83308 tp!67182))

(declare-fun array_inv!22500 (array!60445) Bool)

(assert (=> start!83308 (array_inv!22500 _keys!1717)))

(declare-fun b!972407 () Bool)

(declare-fun res!650888 () Bool)

(assert (=> b!972407 (=> (not res!650888) (not e!548112))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60445 (_ BitVec 32)) Bool)

(assert (=> b!972407 (= res!650888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!972408 () Bool)

(declare-fun e!548108 () Bool)

(declare-fun mapRes!35308 () Bool)

(assert (=> b!972408 (= e!548109 (and e!548108 mapRes!35308))))

(declare-fun condMapEmpty!35308 () Bool)

(declare-fun mapDefault!35308 () ValueCell!10618)

