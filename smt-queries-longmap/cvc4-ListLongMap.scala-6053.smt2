; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78262 () Bool)

(assert start!78262)

(declare-fun b_free!16733 () Bool)

(declare-fun b_next!16733 () Bool)

(assert (=> start!78262 (= b_free!16733 (not b_next!16733))))

(declare-fun tp!58479 () Bool)

(declare-fun b_and!27311 () Bool)

(assert (=> start!78262 (= tp!58479 b_and!27311)))

(declare-fun b!913382 () Bool)

(declare-fun res!616130 () Bool)

(declare-fun e!512325 () Bool)

(assert (=> b!913382 (=> (not res!616130) (not e!512325))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!913382 (= res!616130 (inRange!0 i!717 mask!1756))))

(declare-fun b!913383 () Bool)

(declare-fun res!616127 () Bool)

(assert (=> b!913383 (=> (not res!616127) (not e!512325))))

(declare-datatypes ((V!30499 0))(
  ( (V!30500 (val!9626 Int)) )
))
(declare-datatypes ((ValueCell!9094 0))(
  ( (ValueCellFull!9094 (v!12138 V!30499)) (EmptyCell!9094) )
))
(declare-datatypes ((array!54294 0))(
  ( (array!54295 (arr!26100 (Array (_ BitVec 32) ValueCell!9094)) (size!26559 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54294)

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30499)

(declare-datatypes ((array!54296 0))(
  ( (array!54297 (arr!26101 (Array (_ BitVec 32) (_ BitVec 64))) (size!26560 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54296)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30499)

(declare-datatypes ((tuple2!12546 0))(
  ( (tuple2!12547 (_1!6284 (_ BitVec 64)) (_2!6284 V!30499)) )
))
(declare-datatypes ((List!18334 0))(
  ( (Nil!18331) (Cons!18330 (h!19476 tuple2!12546) (t!25925 List!18334)) )
))
(declare-datatypes ((ListLongMap!11243 0))(
  ( (ListLongMap!11244 (toList!5637 List!18334)) )
))
(declare-fun contains!4684 (ListLongMap!11243 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2899 (array!54296 array!54294 (_ BitVec 32) (_ BitVec 32) V!30499 V!30499 (_ BitVec 32) Int) ListLongMap!11243)

(assert (=> b!913383 (= res!616127 (contains!4684 (getCurrentListMap!2899 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!913384 () Bool)

(declare-fun res!616133 () Bool)

(assert (=> b!913384 (=> (not res!616133) (not e!512325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54296 (_ BitVec 32)) Bool)

(assert (=> b!913384 (= res!616133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!913385 () Bool)

(declare-fun res!616129 () Bool)

(assert (=> b!913385 (=> (not res!616129) (not e!512325))))

(assert (=> b!913385 (= res!616129 (and (= (select (arr!26101 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!616132 () Bool)

(assert (=> start!78262 (=> (not res!616132) (not e!512325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78262 (= res!616132 (validMask!0 mask!1756))))

(assert (=> start!78262 e!512325))

(declare-fun e!512328 () Bool)

(declare-fun array_inv!20386 (array!54294) Bool)

(assert (=> start!78262 (and (array_inv!20386 _values!1152) e!512328)))

(assert (=> start!78262 tp!58479))

(assert (=> start!78262 true))

(declare-fun tp_is_empty!19151 () Bool)

(assert (=> start!78262 tp_is_empty!19151))

(declare-fun array_inv!20387 (array!54296) Bool)

(assert (=> start!78262 (array_inv!20387 _keys!1386)))

(declare-fun b!913386 () Bool)

(declare-fun res!616128 () Bool)

(assert (=> b!913386 (=> (not res!616128) (not e!512325))))

(assert (=> b!913386 (= res!616128 (and (= (size!26559 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26560 _keys!1386) (size!26559 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!913387 () Bool)

(declare-fun res!616134 () Bool)

(assert (=> b!913387 (=> (not res!616134) (not e!512325))))

(declare-datatypes ((List!18335 0))(
  ( (Nil!18332) (Cons!18331 (h!19477 (_ BitVec 64)) (t!25926 List!18335)) )
))
(declare-fun arrayNoDuplicates!0 (array!54296 (_ BitVec 32) List!18335) Bool)

(assert (=> b!913387 (= res!616134 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18332))))

(declare-fun b!913388 () Bool)

(declare-fun e!512327 () Bool)

(assert (=> b!913388 (= e!512325 (not e!512327))))

(declare-fun res!616131 () Bool)

(assert (=> b!913388 (=> res!616131 e!512327)))

(assert (=> b!913388 (= res!616131 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26560 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!54296 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!913388 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30920 0))(
  ( (Unit!30921) )
))
(declare-fun lt!410840 () Unit!30920)

(declare-fun lemmaKeyInListMapIsInArray!284 (array!54296 array!54294 (_ BitVec 32) (_ BitVec 32) V!30499 V!30499 (_ BitVec 64) Int) Unit!30920)

(assert (=> b!913388 (= lt!410840 (lemmaKeyInListMapIsInArray!284 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun mapNonEmpty!30457 () Bool)

(declare-fun mapRes!30457 () Bool)

(declare-fun tp!58478 () Bool)

(declare-fun e!512324 () Bool)

(assert (=> mapNonEmpty!30457 (= mapRes!30457 (and tp!58478 e!512324))))

(declare-fun mapValue!30457 () ValueCell!9094)

(declare-fun mapRest!30457 () (Array (_ BitVec 32) ValueCell!9094))

(declare-fun mapKey!30457 () (_ BitVec 32))

(assert (=> mapNonEmpty!30457 (= (arr!26100 _values!1152) (store mapRest!30457 mapKey!30457 mapValue!30457))))

(declare-fun b!913389 () Bool)

(assert (=> b!913389 (= e!512327 (contains!4684 (getCurrentListMap!2899 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160) k!1033))))

(declare-fun b!913390 () Bool)

(assert (=> b!913390 (= e!512324 tp_is_empty!19151)))

(declare-fun b!913391 () Bool)

(declare-fun e!512326 () Bool)

(assert (=> b!913391 (= e!512328 (and e!512326 mapRes!30457))))

(declare-fun condMapEmpty!30457 () Bool)

(declare-fun mapDefault!30457 () ValueCell!9094)

