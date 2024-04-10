; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105692 () Bool)

(assert start!105692)

(declare-fun b_free!27277 () Bool)

(declare-fun b_next!27277 () Bool)

(assert (=> start!105692 (= b_free!27277 (not b_next!27277))))

(declare-fun tp!95357 () Bool)

(declare-fun b_and!45161 () Bool)

(assert (=> start!105692 (= tp!95357 b_and!45161)))

(declare-fun b!1258960 () Bool)

(declare-fun res!839062 () Bool)

(declare-fun e!716109 () Bool)

(assert (=> b!1258960 (=> (not res!839062) (not e!716109))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81978 0))(
  ( (array!81979 (arr!39544 (Array (_ BitVec 32) (_ BitVec 64))) (size!40080 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81978)

(declare-datatypes ((V!48271 0))(
  ( (V!48272 (val!16152 Int)) )
))
(declare-datatypes ((ValueCell!15326 0))(
  ( (ValueCellFull!15326 (v!18854 V!48271)) (EmptyCell!15326) )
))
(declare-datatypes ((array!81980 0))(
  ( (array!81981 (arr!39545 (Array (_ BitVec 32) ValueCell!15326)) (size!40081 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81980)

(assert (=> b!1258960 (= res!839062 (and (= (size!40081 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40080 _keys!1118) (size!40081 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258961 () Bool)

(declare-fun res!839065 () Bool)

(assert (=> b!1258961 (=> (not res!839065) (not e!716109))))

(declare-datatypes ((List!28080 0))(
  ( (Nil!28077) (Cons!28076 (h!29285 (_ BitVec 64)) (t!41575 List!28080)) )
))
(declare-fun arrayNoDuplicates!0 (array!81978 (_ BitVec 32) List!28080) Bool)

(assert (=> b!1258961 (= res!839065 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28077))))

(declare-fun mapNonEmpty!50065 () Bool)

(declare-fun mapRes!50065 () Bool)

(declare-fun tp!95356 () Bool)

(declare-fun e!716111 () Bool)

(assert (=> mapNonEmpty!50065 (= mapRes!50065 (and tp!95356 e!716111))))

(declare-fun mapValue!50065 () ValueCell!15326)

(declare-fun mapRest!50065 () (Array (_ BitVec 32) ValueCell!15326))

(declare-fun mapKey!50065 () (_ BitVec 32))

(assert (=> mapNonEmpty!50065 (= (arr!39545 _values!914) (store mapRest!50065 mapKey!50065 mapValue!50065))))

(declare-fun b!1258962 () Bool)

(declare-fun e!716113 () Bool)

(assert (=> b!1258962 (= e!716113 true)))

(declare-datatypes ((tuple2!20870 0))(
  ( (tuple2!20871 (_1!10446 (_ BitVec 64)) (_2!10446 V!48271)) )
))
(declare-datatypes ((List!28081 0))(
  ( (Nil!28078) (Cons!28077 (h!29286 tuple2!20870) (t!41576 List!28081)) )
))
(declare-datatypes ((ListLongMap!18743 0))(
  ( (ListLongMap!18744 (toList!9387 List!28081)) )
))
(declare-fun lt!569544 () ListLongMap!18743)

(declare-fun lt!569538 () ListLongMap!18743)

(declare-fun -!2096 (ListLongMap!18743 (_ BitVec 64)) ListLongMap!18743)

(assert (=> b!1258962 (= lt!569544 (-!2096 lt!569538 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!569542 () ListLongMap!18743)

(declare-fun lt!569537 () ListLongMap!18743)

(assert (=> b!1258962 (= (-!2096 lt!569542 #b1000000000000000000000000000000000000000000000000000000000000000) lt!569537)))

(declare-datatypes ((Unit!41957 0))(
  ( (Unit!41958) )
))
(declare-fun lt!569540 () Unit!41957)

(declare-fun minValueBefore!43 () V!48271)

(declare-fun addThenRemoveForNewKeyIsSame!333 (ListLongMap!18743 (_ BitVec 64) V!48271) Unit!41957)

(assert (=> b!1258962 (= lt!569540 (addThenRemoveForNewKeyIsSame!333 lt!569537 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716115 () Bool)

(assert (=> b!1258962 e!716115))

(declare-fun res!839066 () Bool)

(assert (=> b!1258962 (=> (not res!839066) (not e!716115))))

(assert (=> b!1258962 (= res!839066 (= lt!569538 lt!569542))))

(declare-fun +!4193 (ListLongMap!18743 tuple2!20870) ListLongMap!18743)

(assert (=> b!1258962 (= lt!569542 (+!4193 lt!569537 (tuple2!20871 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!569541 () ListLongMap!18743)

(declare-fun lt!569543 () tuple2!20870)

(assert (=> b!1258962 (= lt!569537 (+!4193 lt!569541 lt!569543))))

(declare-fun zeroValue!871 () V!48271)

(assert (=> b!1258962 (= lt!569543 (tuple2!20871 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48271)

(declare-fun lt!569546 () ListLongMap!18743)

(declare-fun getCurrentListMap!4587 (array!81978 array!81980 (_ BitVec 32) (_ BitVec 32) V!48271 V!48271 (_ BitVec 32) Int) ListLongMap!18743)

(assert (=> b!1258962 (= lt!569546 (getCurrentListMap!4587 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258962 (= lt!569538 (getCurrentListMap!4587 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50065 () Bool)

(assert (=> mapIsEmpty!50065 mapRes!50065))

(declare-fun b!1258963 () Bool)

(declare-fun e!716112 () Bool)

(declare-fun tp_is_empty!32179 () Bool)

(assert (=> b!1258963 (= e!716112 tp_is_empty!32179)))

(declare-fun b!1258964 () Bool)

(assert (=> b!1258964 (= e!716109 (not e!716113))))

(declare-fun res!839064 () Bool)

(assert (=> b!1258964 (=> res!839064 e!716113)))

(assert (=> b!1258964 (= res!839064 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!569539 () ListLongMap!18743)

(assert (=> b!1258964 (= lt!569541 lt!569539)))

(declare-fun lt!569545 () Unit!41957)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1128 (array!81978 array!81980 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48271 V!48271 V!48271 V!48271 (_ BitVec 32) Int) Unit!41957)

(assert (=> b!1258964 (= lt!569545 (lemmaNoChangeToArrayThenSameMapNoExtras!1128 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5764 (array!81978 array!81980 (_ BitVec 32) (_ BitVec 32) V!48271 V!48271 (_ BitVec 32) Int) ListLongMap!18743)

(assert (=> b!1258964 (= lt!569539 (getCurrentListMapNoExtraKeys!5764 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258964 (= lt!569541 (getCurrentListMapNoExtraKeys!5764 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258965 () Bool)

(assert (=> b!1258965 (= e!716115 (= lt!569546 (+!4193 lt!569539 lt!569543)))))

(declare-fun b!1258966 () Bool)

(declare-fun e!716110 () Bool)

(assert (=> b!1258966 (= e!716110 (and e!716112 mapRes!50065))))

(declare-fun condMapEmpty!50065 () Bool)

(declare-fun mapDefault!50065 () ValueCell!15326)

