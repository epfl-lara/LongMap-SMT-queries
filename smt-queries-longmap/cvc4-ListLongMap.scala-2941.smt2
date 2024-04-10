; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41856 () Bool)

(assert start!41856)

(declare-fun b_free!11459 () Bool)

(declare-fun b_next!11459 () Bool)

(assert (=> start!41856 (= b_free!11459 (not b_next!11459))))

(declare-fun tp!40387 () Bool)

(declare-fun b_and!19839 () Bool)

(assert (=> start!41856 (= tp!40387 b_and!19839)))

(declare-fun b!467366 () Bool)

(declare-fun res!279333 () Bool)

(declare-fun e!273382 () Bool)

(assert (=> b!467366 (=> (not res!279333) (not e!273382))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29553 0))(
  ( (array!29554 (arr!14204 (Array (_ BitVec 32) (_ BitVec 64))) (size!14556 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29553)

(declare-datatypes ((V!18287 0))(
  ( (V!18288 (val!6488 Int)) )
))
(declare-datatypes ((ValueCell!6100 0))(
  ( (ValueCellFull!6100 (v!8777 V!18287)) (EmptyCell!6100) )
))
(declare-datatypes ((array!29555 0))(
  ( (array!29556 (arr!14205 (Array (_ BitVec 32) ValueCell!6100)) (size!14557 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29555)

(assert (=> b!467366 (= res!279333 (and (= (size!14557 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14556 _keys!1025) (size!14557 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!279336 () Bool)

(assert (=> start!41856 (=> (not res!279336) (not e!273382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41856 (= res!279336 (validMask!0 mask!1365))))

(assert (=> start!41856 e!273382))

(declare-fun tp_is_empty!12887 () Bool)

(assert (=> start!41856 tp_is_empty!12887))

(assert (=> start!41856 tp!40387))

(assert (=> start!41856 true))

(declare-fun array_inv!10254 (array!29553) Bool)

(assert (=> start!41856 (array_inv!10254 _keys!1025)))

(declare-fun e!273383 () Bool)

(declare-fun array_inv!10255 (array!29555) Bool)

(assert (=> start!41856 (and (array_inv!10255 _values!833) e!273383)))

(declare-fun b!467367 () Bool)

(declare-fun e!273380 () Bool)

(declare-fun mapRes!21019 () Bool)

(assert (=> b!467367 (= e!273383 (and e!273380 mapRes!21019))))

(declare-fun condMapEmpty!21019 () Bool)

(declare-fun mapDefault!21019 () ValueCell!6100)

