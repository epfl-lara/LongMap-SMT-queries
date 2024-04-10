; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38228 () Bool)

(assert start!38228)

(declare-fun b_free!9065 () Bool)

(declare-fun b_next!9065 () Bool)

(assert (=> start!38228 (= b_free!9065 (not b_next!9065))))

(declare-fun tp!31983 () Bool)

(declare-fun b_and!16451 () Bool)

(assert (=> start!38228 (= tp!31983 b_and!16451)))

(declare-fun b!394321 () Bool)

(declare-fun res!225992 () Bool)

(declare-fun e!238702 () Bool)

(assert (=> b!394321 (=> (not res!225992) (not e!238702))))

(declare-datatypes ((array!23383 0))(
  ( (array!23384 (arr!11148 (Array (_ BitVec 32) (_ BitVec 64))) (size!11500 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23383)

(declare-datatypes ((List!6486 0))(
  ( (Nil!6483) (Cons!6482 (h!7338 (_ BitVec 64)) (t!11660 List!6486)) )
))
(declare-fun arrayNoDuplicates!0 (array!23383 (_ BitVec 32) List!6486) Bool)

(assert (=> b!394321 (= res!225992 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6483))))

(declare-fun b!394322 () Bool)

(declare-fun res!225988 () Bool)

(assert (=> b!394322 (=> (not res!225988) (not e!238702))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!394322 (= res!225988 (validKeyInArray!0 k!778))))

(declare-fun b!394323 () Bool)

(declare-fun res!225983 () Bool)

(assert (=> b!394323 (=> (not res!225983) (not e!238702))))

(declare-fun arrayContainsKey!0 (array!23383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!394323 (= res!225983 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!394324 () Bool)

(declare-fun e!238700 () Bool)

(declare-fun tp_is_empty!9737 () Bool)

(assert (=> b!394324 (= e!238700 tp_is_empty!9737)))

(declare-fun b!394325 () Bool)

(declare-fun e!238703 () Bool)

(declare-fun mapRes!16206 () Bool)

(assert (=> b!394325 (= e!238703 (and e!238700 mapRes!16206))))

(declare-fun condMapEmpty!16206 () Bool)

(declare-datatypes ((V!14087 0))(
  ( (V!14088 (val!4913 Int)) )
))
(declare-datatypes ((ValueCell!4525 0))(
  ( (ValueCellFull!4525 (v!7158 V!14087)) (EmptyCell!4525) )
))
(declare-datatypes ((array!23385 0))(
  ( (array!23386 (arr!11149 (Array (_ BitVec 32) ValueCell!4525)) (size!11501 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23385)

(declare-fun mapDefault!16206 () ValueCell!4525)

