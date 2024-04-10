; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41578 () Bool)

(assert start!41578)

(declare-fun b_free!11245 () Bool)

(declare-fun b_next!11245 () Bool)

(assert (=> start!41578 (= b_free!11245 (not b_next!11245))))

(declare-fun tp!39733 () Bool)

(declare-fun b_and!19585 () Bool)

(assert (=> start!41578 (= tp!39733 b_and!19585)))

(declare-fun res!277663 () Bool)

(declare-fun e!271284 () Bool)

(assert (=> start!41578 (=> (not res!277663) (not e!271284))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41578 (= res!277663 (validMask!0 mask!1365))))

(assert (=> start!41578 e!271284))

(declare-fun tp_is_empty!12673 () Bool)

(assert (=> start!41578 tp_is_empty!12673))

(assert (=> start!41578 tp!39733))

(assert (=> start!41578 true))

(declare-datatypes ((array!29133 0))(
  ( (array!29134 (arr!13998 (Array (_ BitVec 32) (_ BitVec 64))) (size!14350 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29133)

(declare-fun array_inv!10112 (array!29133) Bool)

(assert (=> start!41578 (array_inv!10112 _keys!1025)))

(declare-datatypes ((V!18003 0))(
  ( (V!18004 (val!6381 Int)) )
))
(declare-datatypes ((ValueCell!5993 0))(
  ( (ValueCellFull!5993 (v!8668 V!18003)) (EmptyCell!5993) )
))
(declare-datatypes ((array!29135 0))(
  ( (array!29136 (arr!13999 (Array (_ BitVec 32) ValueCell!5993)) (size!14351 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29135)

(declare-fun e!271285 () Bool)

(declare-fun array_inv!10113 (array!29135) Bool)

(assert (=> start!41578 (and (array_inv!10113 _values!833) e!271285)))

(declare-fun b!464419 () Bool)

(declare-fun e!271287 () Bool)

(declare-fun mapRes!20686 () Bool)

(assert (=> b!464419 (= e!271285 (and e!271287 mapRes!20686))))

(declare-fun condMapEmpty!20686 () Bool)

(declare-fun mapDefault!20686 () ValueCell!5993)

