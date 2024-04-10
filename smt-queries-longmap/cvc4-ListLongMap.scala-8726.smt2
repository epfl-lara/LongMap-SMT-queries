; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105854 () Bool)

(assert start!105854)

(declare-fun b_free!27395 () Bool)

(declare-fun b_next!27395 () Bool)

(assert (=> start!105854 (= b_free!27395 (not b_next!27395))))

(declare-fun tp!95717 () Bool)

(declare-fun b_and!45303 () Bool)

(assert (=> start!105854 (= tp!95717 b_and!45303)))

(declare-fun mapIsEmpty!50248 () Bool)

(declare-fun mapRes!50248 () Bool)

(assert (=> mapIsEmpty!50248 mapRes!50248))

(declare-fun b!1260895 () Bool)

(declare-fun res!840264 () Bool)

(declare-fun e!717556 () Bool)

(assert (=> b!1260895 (=> (not res!840264) (not e!717556))))

(declare-datatypes ((array!82210 0))(
  ( (array!82211 (arr!39658 (Array (_ BitVec 32) (_ BitVec 64))) (size!40194 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82210)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82210 (_ BitVec 32)) Bool)

(assert (=> b!1260895 (= res!840264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260896 () Bool)

(declare-fun res!840262 () Bool)

(assert (=> b!1260896 (=> (not res!840262) (not e!717556))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((V!48427 0))(
  ( (V!48428 (val!16211 Int)) )
))
(declare-datatypes ((ValueCell!15385 0))(
  ( (ValueCellFull!15385 (v!18915 V!48427)) (EmptyCell!15385) )
))
(declare-datatypes ((array!82212 0))(
  ( (array!82213 (arr!39659 (Array (_ BitVec 32) ValueCell!15385)) (size!40195 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82212)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1260896 (= res!840262 (and (= (size!40195 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40194 _keys!1118) (size!40195 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260897 () Bool)

(declare-fun res!840265 () Bool)

(assert (=> b!1260897 (=> (not res!840265) (not e!717556))))

(declare-datatypes ((List!28173 0))(
  ( (Nil!28170) (Cons!28169 (h!29378 (_ BitVec 64)) (t!41672 List!28173)) )
))
(declare-fun arrayNoDuplicates!0 (array!82210 (_ BitVec 32) List!28173) Bool)

(assert (=> b!1260897 (= res!840265 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28170))))

(declare-fun b!1260899 () Bool)

(declare-fun e!717559 () Bool)

(declare-fun tp_is_empty!32297 () Bool)

(assert (=> b!1260899 (= e!717559 tp_is_empty!32297)))

(declare-fun b!1260900 () Bool)

(declare-fun e!717558 () Bool)

(assert (=> b!1260900 (= e!717558 tp_is_empty!32297)))

(declare-fun mapNonEmpty!50248 () Bool)

(declare-fun tp!95716 () Bool)

(assert (=> mapNonEmpty!50248 (= mapRes!50248 (and tp!95716 e!717558))))

(declare-fun mapValue!50248 () ValueCell!15385)

(declare-fun mapKey!50248 () (_ BitVec 32))

(declare-fun mapRest!50248 () (Array (_ BitVec 32) ValueCell!15385))

(assert (=> mapNonEmpty!50248 (= (arr!39659 _values!914) (store mapRest!50248 mapKey!50248 mapValue!50248))))

(declare-fun b!1260901 () Bool)

(assert (=> b!1260901 (= e!717556 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48427)

(declare-fun zeroValue!871 () V!48427)

(declare-datatypes ((tuple2!20976 0))(
  ( (tuple2!20977 (_1!10499 (_ BitVec 64)) (_2!10499 V!48427)) )
))
(declare-datatypes ((List!28174 0))(
  ( (Nil!28171) (Cons!28170 (h!29379 tuple2!20976) (t!41673 List!28174)) )
))
(declare-datatypes ((ListLongMap!18849 0))(
  ( (ListLongMap!18850 (toList!9440 List!28174)) )
))
(declare-fun lt!571473 () ListLongMap!18849)

(declare-fun getCurrentListMapNoExtraKeys!5808 (array!82210 array!82212 (_ BitVec 32) (_ BitVec 32) V!48427 V!48427 (_ BitVec 32) Int) ListLongMap!18849)

(assert (=> b!1260901 (= lt!571473 (getCurrentListMapNoExtraKeys!5808 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571472 () ListLongMap!18849)

(declare-fun minValueBefore!43 () V!48427)

(assert (=> b!1260901 (= lt!571472 (getCurrentListMapNoExtraKeys!5808 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260898 () Bool)

(declare-fun e!717560 () Bool)

(assert (=> b!1260898 (= e!717560 (and e!717559 mapRes!50248))))

(declare-fun condMapEmpty!50248 () Bool)

(declare-fun mapDefault!50248 () ValueCell!15385)

