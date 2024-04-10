; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41664 () Bool)

(assert start!41664)

(declare-fun b_free!11317 () Bool)

(declare-fun b_next!11317 () Bool)

(assert (=> start!41664 (= b_free!11317 (not b_next!11317))))

(declare-fun tp!39951 () Bool)

(declare-fun b_and!19665 () Bool)

(assert (=> start!41664 (= tp!39951 b_and!19665)))

(declare-fun b!465260 () Bool)

(declare-fun e!271879 () Bool)

(declare-fun tp_is_empty!12745 () Bool)

(assert (=> b!465260 (= e!271879 tp_is_empty!12745)))

(declare-fun b!465261 () Bool)

(declare-fun res!278127 () Bool)

(declare-fun e!271878 () Bool)

(assert (=> b!465261 (=> (not res!278127) (not e!271878))))

(declare-datatypes ((array!29273 0))(
  ( (array!29274 (arr!14067 (Array (_ BitVec 32) (_ BitVec 64))) (size!14419 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29273)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29273 (_ BitVec 32)) Bool)

(assert (=> b!465261 (= res!278127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465262 () Bool)

(declare-fun e!271882 () Bool)

(declare-fun mapRes!20797 () Bool)

(assert (=> b!465262 (= e!271882 (and e!271879 mapRes!20797))))

(declare-fun condMapEmpty!20797 () Bool)

(declare-datatypes ((V!18099 0))(
  ( (V!18100 (val!6417 Int)) )
))
(declare-datatypes ((ValueCell!6029 0))(
  ( (ValueCellFull!6029 (v!8704 V!18099)) (EmptyCell!6029) )
))
(declare-datatypes ((array!29275 0))(
  ( (array!29276 (arr!14068 (Array (_ BitVec 32) ValueCell!6029)) (size!14420 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29275)

(declare-fun mapDefault!20797 () ValueCell!6029)

