; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72950 () Bool)

(assert start!72950)

(declare-fun b_free!13865 () Bool)

(declare-fun b_next!13865 () Bool)

(assert (=> start!72950 (= b_free!13865 (not b_next!13865))))

(declare-fun tp!49098 () Bool)

(declare-fun b_and!22951 () Bool)

(assert (=> start!72950 (= tp!49098 b_and!22951)))

(declare-fun mapIsEmpty!25601 () Bool)

(declare-fun mapRes!25601 () Bool)

(assert (=> mapIsEmpty!25601 mapRes!25601))

(declare-fun b!847156 () Bool)

(declare-fun e!472745 () Bool)

(declare-fun e!472743 () Bool)

(assert (=> b!847156 (= e!472745 (and e!472743 mapRes!25601))))

(declare-fun condMapEmpty!25601 () Bool)

(declare-datatypes ((V!26381 0))(
  ( (V!26382 (val!8048 Int)) )
))
(declare-datatypes ((ValueCell!7561 0))(
  ( (ValueCellFull!7561 (v!10473 V!26381)) (EmptyCell!7561) )
))
(declare-datatypes ((array!48214 0))(
  ( (array!48215 (arr!23138 (Array (_ BitVec 32) ValueCell!7561)) (size!23578 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48214)

(declare-fun mapDefault!25601 () ValueCell!7561)

