; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95410 () Bool)

(assert start!95410)

(declare-fun b!1077575 () Bool)

(declare-fun e!616154 () Bool)

(declare-fun tp_is_empty!26123 () Bool)

(assert (=> b!1077575 (= e!616154 tp_is_empty!26123)))

(declare-fun b!1077576 () Bool)

(declare-fun e!616156 () Bool)

(declare-fun e!616155 () Bool)

(declare-fun mapRes!40927 () Bool)

(assert (=> b!1077576 (= e!616156 (and e!616155 mapRes!40927))))

(declare-fun condMapEmpty!40927 () Bool)

(declare-datatypes ((V!39957 0))(
  ( (V!39958 (val!13118 Int)) )
))
(declare-datatypes ((ValueCell!12352 0))(
  ( (ValueCellFull!12352 (v!15738 V!39957)) (EmptyCell!12352) )
))
(declare-datatypes ((array!69197 0))(
  ( (array!69198 (arr!33276 (Array (_ BitVec 32) ValueCell!12352)) (size!33812 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69197)

(declare-fun mapDefault!40927 () ValueCell!12352)

