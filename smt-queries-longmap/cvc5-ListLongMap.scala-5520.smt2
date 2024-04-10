; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72904 () Bool)

(assert start!72904)

(declare-fun b_free!13819 () Bool)

(declare-fun b_next!13819 () Bool)

(assert (=> start!72904 (= b_free!13819 (not b_next!13819))))

(declare-fun tp!48960 () Bool)

(declare-fun b_and!22905 () Bool)

(assert (=> start!72904 (= tp!48960 b_and!22905)))

(declare-fun b!846397 () Bool)

(declare-fun e!472402 () Bool)

(declare-fun tp_is_empty!15955 () Bool)

(assert (=> b!846397 (= e!472402 tp_is_empty!15955)))

(declare-fun b!846398 () Bool)

(declare-fun res!575044 () Bool)

(declare-fun e!472401 () Bool)

(assert (=> b!846398 (=> (not res!575044) (not e!472401))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846398 (= res!575044 (validMask!0 mask!1196))))

(declare-fun b!846399 () Bool)

(declare-fun e!472400 () Bool)

(declare-fun mapRes!25532 () Bool)

(assert (=> b!846399 (= e!472400 (and e!472402 mapRes!25532))))

(declare-fun condMapEmpty!25532 () Bool)

(declare-datatypes ((V!26321 0))(
  ( (V!26322 (val!8025 Int)) )
))
(declare-datatypes ((ValueCell!7538 0))(
  ( (ValueCellFull!7538 (v!10450 V!26321)) (EmptyCell!7538) )
))
(declare-datatypes ((array!48124 0))(
  ( (array!48125 (arr!23093 (Array (_ BitVec 32) ValueCell!7538)) (size!23533 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48124)

(declare-fun mapDefault!25532 () ValueCell!7538)

