; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82380 () Bool)

(assert start!82380)

(declare-fun b_free!18647 () Bool)

(declare-fun b_next!18647 () Bool)

(assert (=> start!82380 (= b_free!18647 (not b_next!18647))))

(declare-fun tp!64911 () Bool)

(declare-fun b_and!30135 () Bool)

(assert (=> start!82380 (= tp!64911 b_and!30135)))

(declare-fun res!642981 () Bool)

(declare-fun e!541467 () Bool)

(assert (=> start!82380 (=> (not res!642981) (not e!541467))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82380 (= res!642981 (validMask!0 mask!2088))))

(assert (=> start!82380 e!541467))

(assert (=> start!82380 true))

(declare-fun tp_is_empty!21359 () Bool)

(assert (=> start!82380 tp_is_empty!21359))

(declare-datatypes ((array!58807 0))(
  ( (array!58808 (arr!28277 (Array (_ BitVec 32) (_ BitVec 64))) (size!28756 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58807)

(declare-fun array_inv!21913 (array!58807) Bool)

(assert (=> start!82380 (array_inv!21913 _keys!1668)))

(declare-datatypes ((V!33461 0))(
  ( (V!33462 (val!10730 Int)) )
))
(declare-datatypes ((ValueCell!10198 0))(
  ( (ValueCellFull!10198 (v!13287 V!33461)) (EmptyCell!10198) )
))
(declare-datatypes ((array!58809 0))(
  ( (array!58810 (arr!28278 (Array (_ BitVec 32) ValueCell!10198)) (size!28757 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58809)

(declare-fun e!541468 () Bool)

(declare-fun array_inv!21914 (array!58809) Bool)

(assert (=> start!82380 (and (array_inv!21914 _values!1386) e!541468)))

(assert (=> start!82380 tp!64911))

(declare-fun b!960557 () Bool)

(declare-fun e!541466 () Bool)

(declare-fun mapRes!34018 () Bool)

(assert (=> b!960557 (= e!541468 (and e!541466 mapRes!34018))))

(declare-fun condMapEmpty!34018 () Bool)

(declare-fun mapDefault!34018 () ValueCell!10198)

