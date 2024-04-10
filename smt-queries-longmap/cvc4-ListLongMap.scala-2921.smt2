; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41700 () Bool)

(assert start!41700)

(declare-fun b_free!11339 () Bool)

(declare-fun b_next!11339 () Bool)

(assert (=> start!41700 (= b_free!11339 (not b_next!11339))))

(declare-fun tp!40020 () Bool)

(declare-fun b_and!19695 () Bool)

(assert (=> start!41700 (= tp!40020 b_and!19695)))

(declare-fun b!465602 () Bool)

(declare-fun res!278313 () Bool)

(declare-fun e!272124 () Bool)

(assert (=> b!465602 (=> (not res!278313) (not e!272124))))

(declare-datatypes ((array!29315 0))(
  ( (array!29316 (arr!14087 (Array (_ BitVec 32) (_ BitVec 64))) (size!14439 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29315)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29315 (_ BitVec 32)) Bool)

(assert (=> b!465602 (= res!278313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465603 () Bool)

(declare-fun e!272126 () Bool)

(declare-fun tp_is_empty!12767 () Bool)

(assert (=> b!465603 (= e!272126 tp_is_empty!12767)))

(declare-fun b!465604 () Bool)

(declare-fun e!272128 () Bool)

(declare-fun mapRes!20833 () Bool)

(assert (=> b!465604 (= e!272128 (and e!272126 mapRes!20833))))

(declare-fun condMapEmpty!20833 () Bool)

(declare-datatypes ((V!18127 0))(
  ( (V!18128 (val!6428 Int)) )
))
(declare-datatypes ((ValueCell!6040 0))(
  ( (ValueCellFull!6040 (v!8715 V!18127)) (EmptyCell!6040) )
))
(declare-datatypes ((array!29317 0))(
  ( (array!29318 (arr!14088 (Array (_ BitVec 32) ValueCell!6040)) (size!14440 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29317)

(declare-fun mapDefault!20833 () ValueCell!6040)

