; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41644 () Bool)

(assert start!41644)

(declare-fun b_free!11297 () Bool)

(declare-fun b_next!11297 () Bool)

(assert (=> start!41644 (= b_free!11297 (not b_next!11297))))

(declare-fun tp!39891 () Bool)

(declare-fun b_and!19645 () Bool)

(assert (=> start!41644 (= tp!39891 b_and!19645)))

(declare-fun res!278005 () Bool)

(declare-fun e!271731 () Bool)

(assert (=> start!41644 (=> (not res!278005) (not e!271731))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41644 (= res!278005 (validMask!0 mask!1365))))

(assert (=> start!41644 e!271731))

(declare-fun tp_is_empty!12725 () Bool)

(assert (=> start!41644 tp_is_empty!12725))

(assert (=> start!41644 tp!39891))

(assert (=> start!41644 true))

(declare-datatypes ((array!29235 0))(
  ( (array!29236 (arr!14048 (Array (_ BitVec 32) (_ BitVec 64))) (size!14400 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29235)

(declare-fun array_inv!10150 (array!29235) Bool)

(assert (=> start!41644 (array_inv!10150 _keys!1025)))

(declare-datatypes ((V!18071 0))(
  ( (V!18072 (val!6407 Int)) )
))
(declare-datatypes ((ValueCell!6019 0))(
  ( (ValueCellFull!6019 (v!8694 V!18071)) (EmptyCell!6019) )
))
(declare-datatypes ((array!29237 0))(
  ( (array!29238 (arr!14049 (Array (_ BitVec 32) ValueCell!6019)) (size!14401 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29237)

(declare-fun e!271730 () Bool)

(declare-fun array_inv!10151 (array!29237) Bool)

(assert (=> start!41644 (and (array_inv!10151 _values!833) e!271730)))

(declare-fun b!465050 () Bool)

(declare-fun e!271728 () Bool)

(assert (=> b!465050 (= e!271728 tp_is_empty!12725)))

(declare-fun b!465051 () Bool)

(declare-fun e!271732 () Bool)

(assert (=> b!465051 (= e!271732 tp_is_empty!12725)))

(declare-fun b!465052 () Bool)

(declare-fun mapRes!20767 () Bool)

(assert (=> b!465052 (= e!271730 (and e!271728 mapRes!20767))))

(declare-fun condMapEmpty!20767 () Bool)

(declare-fun mapDefault!20767 () ValueCell!6019)

