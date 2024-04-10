; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77998 () Bool)

(assert start!77998)

(declare-fun b_free!16525 () Bool)

(declare-fun b_next!16525 () Bool)

(assert (=> start!77998 (= b_free!16525 (not b_next!16525))))

(declare-fun tp!57846 () Bool)

(declare-fun b_and!27097 () Bool)

(assert (=> start!77998 (= tp!57846 b_and!27097)))

(declare-fun b!910528 () Bool)

(declare-fun e!510522 () Bool)

(assert (=> b!910528 (= e!510522 false)))

(declare-datatypes ((V!30223 0))(
  ( (V!30224 (val!9522 Int)) )
))
(declare-datatypes ((ValueCell!8990 0))(
  ( (ValueCellFull!8990 (v!12031 V!30223)) (EmptyCell!8990) )
))
(declare-datatypes ((array!53902 0))(
  ( (array!53903 (arr!25907 (Array (_ BitVec 32) ValueCell!8990)) (size!26366 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53902)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30223)

(declare-datatypes ((array!53904 0))(
  ( (array!53905 (arr!25908 (Array (_ BitVec 32) (_ BitVec 64))) (size!26367 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53904)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun lt!410270 () Bool)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30223)

(declare-datatypes ((tuple2!12408 0))(
  ( (tuple2!12409 (_1!6215 (_ BitVec 64)) (_2!6215 V!30223)) )
))
(declare-datatypes ((List!18198 0))(
  ( (Nil!18195) (Cons!18194 (h!19340 tuple2!12408) (t!25783 List!18198)) )
))
(declare-datatypes ((ListLongMap!11105 0))(
  ( (ListLongMap!11106 (toList!5568 List!18198)) )
))
(declare-fun contains!4612 (ListLongMap!11105 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2830 (array!53904 array!53902 (_ BitVec 32) (_ BitVec 32) V!30223 V!30223 (_ BitVec 32) Int) ListLongMap!11105)

(assert (=> b!910528 (= lt!410270 (contains!4612 (getCurrentListMap!2830 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun mapNonEmpty!30136 () Bool)

(declare-fun mapRes!30136 () Bool)

(declare-fun tp!57845 () Bool)

(declare-fun e!510524 () Bool)

(assert (=> mapNonEmpty!30136 (= mapRes!30136 (and tp!57845 e!510524))))

(declare-fun mapValue!30136 () ValueCell!8990)

(declare-fun mapKey!30136 () (_ BitVec 32))

(declare-fun mapRest!30136 () (Array (_ BitVec 32) ValueCell!8990))

(assert (=> mapNonEmpty!30136 (= (arr!25907 _values!1152) (store mapRest!30136 mapKey!30136 mapValue!30136))))

(declare-fun mapIsEmpty!30136 () Bool)

(assert (=> mapIsEmpty!30136 mapRes!30136))

(declare-fun b!910529 () Bool)

(declare-fun tp_is_empty!18943 () Bool)

(assert (=> b!910529 (= e!510524 tp_is_empty!18943)))

(declare-fun b!910530 () Bool)

(declare-fun e!510523 () Bool)

(assert (=> b!910530 (= e!510523 tp_is_empty!18943)))

(declare-fun b!910531 () Bool)

(declare-fun res!614414 () Bool)

(assert (=> b!910531 (=> (not res!614414) (not e!510522))))

(assert (=> b!910531 (= res!614414 (and (= (size!26366 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26367 _keys!1386) (size!26366 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!614412 () Bool)

(assert (=> start!77998 (=> (not res!614412) (not e!510522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77998 (= res!614412 (validMask!0 mask!1756))))

(assert (=> start!77998 e!510522))

(declare-fun e!510525 () Bool)

(declare-fun array_inv!20260 (array!53902) Bool)

(assert (=> start!77998 (and (array_inv!20260 _values!1152) e!510525)))

(assert (=> start!77998 tp!57846))

(assert (=> start!77998 true))

(assert (=> start!77998 tp_is_empty!18943))

(declare-fun array_inv!20261 (array!53904) Bool)

(assert (=> start!77998 (array_inv!20261 _keys!1386)))

(declare-fun b!910527 () Bool)

(declare-fun res!614415 () Bool)

(assert (=> b!910527 (=> (not res!614415) (not e!510522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53904 (_ BitVec 32)) Bool)

(assert (=> b!910527 (= res!614415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910532 () Bool)

(declare-fun res!614413 () Bool)

(assert (=> b!910532 (=> (not res!614413) (not e!510522))))

(declare-datatypes ((List!18199 0))(
  ( (Nil!18196) (Cons!18195 (h!19341 (_ BitVec 64)) (t!25784 List!18199)) )
))
(declare-fun arrayNoDuplicates!0 (array!53904 (_ BitVec 32) List!18199) Bool)

(assert (=> b!910532 (= res!614413 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18196))))

(declare-fun b!910533 () Bool)

(assert (=> b!910533 (= e!510525 (and e!510523 mapRes!30136))))

(declare-fun condMapEmpty!30136 () Bool)

(declare-fun mapDefault!30136 () ValueCell!8990)

