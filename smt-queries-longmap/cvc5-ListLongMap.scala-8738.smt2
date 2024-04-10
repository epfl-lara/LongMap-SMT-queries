; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105952 () Bool)

(assert start!105952)

(declare-fun b_free!27463 () Bool)

(declare-fun b_next!27463 () Bool)

(assert (=> start!105952 (= b_free!27463 (not b_next!27463))))

(declare-fun tp!95926 () Bool)

(declare-fun b_and!45389 () Bool)

(assert (=> start!105952 (= tp!95926 b_and!45389)))

(declare-fun mapNonEmpty!50356 () Bool)

(declare-fun mapRes!50356 () Bool)

(declare-fun tp!95927 () Bool)

(declare-fun e!718235 () Bool)

(assert (=> mapNonEmpty!50356 (= mapRes!50356 (and tp!95927 e!718235))))

(declare-fun mapKey!50356 () (_ BitVec 32))

(declare-datatypes ((V!48519 0))(
  ( (V!48520 (val!16245 Int)) )
))
(declare-datatypes ((ValueCell!15419 0))(
  ( (ValueCellFull!15419 (v!18950 V!48519)) (EmptyCell!15419) )
))
(declare-fun mapValue!50356 () ValueCell!15419)

(declare-fun mapRest!50356 () (Array (_ BitVec 32) ValueCell!15419))

(declare-datatypes ((array!82348 0))(
  ( (array!82349 (arr!39725 (Array (_ BitVec 32) ValueCell!15419)) (size!40261 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82348)

(assert (=> mapNonEmpty!50356 (= (arr!39725 _values!914) (store mapRest!50356 mapKey!50356 mapValue!50356))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48519)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82350 0))(
  ( (array!82351 (arr!39726 (Array (_ BitVec 32) (_ BitVec 64))) (size!40262 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82350)

(declare-fun b!1261864 () Bool)

(declare-datatypes ((tuple2!21024 0))(
  ( (tuple2!21025 (_1!10523 (_ BitVec 64)) (_2!10523 V!48519)) )
))
(declare-datatypes ((List!28219 0))(
  ( (Nil!28216) (Cons!28215 (h!29424 tuple2!21024) (t!41722 List!28219)) )
))
(declare-datatypes ((ListLongMap!18897 0))(
  ( (ListLongMap!18898 (toList!9464 List!28219)) )
))
(declare-fun lt!571851 () ListLongMap!18897)

(declare-fun zeroValue!871 () V!48519)

(declare-fun e!718236 () Bool)

(declare-fun getCurrentListMap!4634 (array!82350 array!82348 (_ BitVec 32) (_ BitVec 32) V!48519 V!48519 (_ BitVec 32) Int) ListLongMap!18897)

(assert (=> b!1261864 (= e!718236 (= lt!571851 (getCurrentListMap!4634 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922)))))

(declare-fun lt!571849 () ListLongMap!18897)

(assert (=> b!1261864 (= lt!571851 lt!571849)))

(declare-fun -!2140 (ListLongMap!18897 (_ BitVec 64)) ListLongMap!18897)

(assert (=> b!1261864 (= lt!571851 (-!2140 lt!571849 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!42067 0))(
  ( (Unit!42068) )
))
(declare-fun lt!571852 () Unit!42067)

(declare-fun removeNotPresentStillSame!149 (ListLongMap!18897 (_ BitVec 64)) Unit!42067)

(assert (=> b!1261864 (= lt!571852 (removeNotPresentStillSame!149 lt!571849 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1261865 () Bool)

(declare-fun res!840778 () Bool)

(declare-fun e!718240 () Bool)

(assert (=> b!1261865 (=> (not res!840778) (not e!718240))))

(declare-datatypes ((List!28220 0))(
  ( (Nil!28217) (Cons!28216 (h!29425 (_ BitVec 64)) (t!41723 List!28220)) )
))
(declare-fun arrayNoDuplicates!0 (array!82350 (_ BitVec 32) List!28220) Bool)

(assert (=> b!1261865 (= res!840778 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28217))))

(declare-fun b!1261866 () Bool)

(declare-fun e!718239 () Bool)

(assert (=> b!1261866 (= e!718239 e!718236)))

(declare-fun res!840775 () Bool)

(assert (=> b!1261866 (=> res!840775 e!718236)))

(declare-fun contains!7585 (ListLongMap!18897 (_ BitVec 64)) Bool)

(assert (=> b!1261866 (= res!840775 (contains!7585 lt!571849 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!48519)

(assert (=> b!1261866 (= lt!571849 (getCurrentListMap!4634 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!840776 () Bool)

(assert (=> start!105952 (=> (not res!840776) (not e!718240))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105952 (= res!840776 (validMask!0 mask!1466))))

(assert (=> start!105952 e!718240))

(assert (=> start!105952 true))

(assert (=> start!105952 tp!95926))

(declare-fun tp_is_empty!32365 () Bool)

(assert (=> start!105952 tp_is_empty!32365))

(declare-fun array_inv!30241 (array!82350) Bool)

(assert (=> start!105952 (array_inv!30241 _keys!1118)))

(declare-fun e!718238 () Bool)

(declare-fun array_inv!30242 (array!82348) Bool)

(assert (=> start!105952 (and (array_inv!30242 _values!914) e!718238)))

(declare-fun mapIsEmpty!50356 () Bool)

(assert (=> mapIsEmpty!50356 mapRes!50356))

(declare-fun b!1261867 () Bool)

(assert (=> b!1261867 (= e!718240 (not e!718239))))

(declare-fun res!840780 () Bool)

(assert (=> b!1261867 (=> res!840780 e!718239)))

(assert (=> b!1261867 (= res!840780 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!571850 () ListLongMap!18897)

(declare-fun lt!571848 () ListLongMap!18897)

(assert (=> b!1261867 (= lt!571850 lt!571848)))

(declare-fun lt!571853 () Unit!42067)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1172 (array!82350 array!82348 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48519 V!48519 V!48519 V!48519 (_ BitVec 32) Int) Unit!42067)

(assert (=> b!1261867 (= lt!571853 (lemmaNoChangeToArrayThenSameMapNoExtras!1172 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5830 (array!82350 array!82348 (_ BitVec 32) (_ BitVec 32) V!48519 V!48519 (_ BitVec 32) Int) ListLongMap!18897)

(assert (=> b!1261867 (= lt!571848 (getCurrentListMapNoExtraKeys!5830 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1261867 (= lt!571850 (getCurrentListMapNoExtraKeys!5830 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261868 () Bool)

(declare-fun res!840777 () Bool)

(assert (=> b!1261868 (=> (not res!840777) (not e!718240))))

(assert (=> b!1261868 (= res!840777 (and (= (size!40261 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40262 _keys!1118) (size!40261 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261869 () Bool)

(declare-fun e!718234 () Bool)

(assert (=> b!1261869 (= e!718234 tp_is_empty!32365)))

(declare-fun b!1261870 () Bool)

(assert (=> b!1261870 (= e!718238 (and e!718234 mapRes!50356))))

(declare-fun condMapEmpty!50356 () Bool)

(declare-fun mapDefault!50356 () ValueCell!15419)

