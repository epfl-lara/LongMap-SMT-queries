; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41918 () Bool)

(assert start!41918)

(declare-fun b_free!11507 () Bool)

(declare-fun b_next!11507 () Bool)

(assert (=> start!41918 (= b_free!11507 (not b_next!11507))))

(declare-fun tp!40533 () Bool)

(declare-fun b_and!19895 () Bool)

(assert (=> start!41918 (= tp!40533 b_and!19895)))

(declare-fun mapIsEmpty!21094 () Bool)

(declare-fun mapRes!21094 () Bool)

(assert (=> mapIsEmpty!21094 mapRes!21094))

(declare-fun b!467990 () Bool)

(declare-fun e!273831 () Bool)

(assert (=> b!467990 (= e!273831 true)))

(declare-datatypes ((V!18351 0))(
  ( (V!18352 (val!6512 Int)) )
))
(declare-datatypes ((tuple2!8552 0))(
  ( (tuple2!8553 (_1!4287 (_ BitVec 64)) (_2!4287 V!18351)) )
))
(declare-datatypes ((List!8640 0))(
  ( (Nil!8637) (Cons!8636 (h!9492 tuple2!8552) (t!14596 List!8640)) )
))
(declare-datatypes ((ListLongMap!7465 0))(
  ( (ListLongMap!7466 (toList!3748 List!8640)) )
))
(declare-fun lt!211611 () ListLongMap!7465)

(declare-fun minValueBefore!38 () V!18351)

(declare-fun zeroValue!794 () V!18351)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!29647 0))(
  ( (array!29648 (arr!14250 (Array (_ BitVec 32) (_ BitVec 64))) (size!14602 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29647)

(declare-datatypes ((ValueCell!6124 0))(
  ( (ValueCellFull!6124 (v!8801 V!18351)) (EmptyCell!6124) )
))
(declare-datatypes ((array!29649 0))(
  ( (array!29650 (arr!14251 (Array (_ BitVec 32) ValueCell!6124)) (size!14603 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29649)

(declare-fun getCurrentListMap!2177 (array!29647 array!29649 (_ BitVec 32) (_ BitVec 32) V!18351 V!18351 (_ BitVec 32) Int) ListLongMap!7465)

(assert (=> b!467990 (= lt!211611 (getCurrentListMap!2177 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!279689 () Bool)

(declare-fun e!273834 () Bool)

(assert (=> start!41918 (=> (not res!279689) (not e!273834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41918 (= res!279689 (validMask!0 mask!1365))))

(assert (=> start!41918 e!273834))

(declare-fun tp_is_empty!12935 () Bool)

(assert (=> start!41918 tp_is_empty!12935))

(assert (=> start!41918 tp!40533))

(assert (=> start!41918 true))

(declare-fun array_inv!10288 (array!29647) Bool)

(assert (=> start!41918 (array_inv!10288 _keys!1025)))

(declare-fun e!273832 () Bool)

(declare-fun array_inv!10289 (array!29649) Bool)

(assert (=> start!41918 (and (array_inv!10289 _values!833) e!273832)))

(declare-fun b!467991 () Bool)

(declare-fun res!279688 () Bool)

(assert (=> b!467991 (=> (not res!279688) (not e!273834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29647 (_ BitVec 32)) Bool)

(assert (=> b!467991 (= res!279688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467992 () Bool)

(declare-fun res!279687 () Bool)

(assert (=> b!467992 (=> (not res!279687) (not e!273834))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!467992 (= res!279687 (and (= (size!14603 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14602 _keys!1025) (size!14603 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467993 () Bool)

(declare-fun res!279690 () Bool)

(assert (=> b!467993 (=> (not res!279690) (not e!273834))))

(declare-datatypes ((List!8641 0))(
  ( (Nil!8638) (Cons!8637 (h!9493 (_ BitVec 64)) (t!14597 List!8641)) )
))
(declare-fun arrayNoDuplicates!0 (array!29647 (_ BitVec 32) List!8641) Bool)

(assert (=> b!467993 (= res!279690 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8638))))

(declare-fun b!467994 () Bool)

(declare-fun e!273835 () Bool)

(assert (=> b!467994 (= e!273832 (and e!273835 mapRes!21094))))

(declare-fun condMapEmpty!21094 () Bool)

(declare-fun mapDefault!21094 () ValueCell!6124)

