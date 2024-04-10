; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105044 () Bool)

(assert start!105044)

(declare-fun b_free!26791 () Bool)

(declare-fun b_next!26791 () Bool)

(assert (=> start!105044 (= b_free!26791 (not b_next!26791))))

(declare-fun tp!93872 () Bool)

(declare-fun b_and!44587 () Bool)

(assert (=> start!105044 (= tp!93872 b_and!44587)))

(declare-fun mapNonEmpty!49309 () Bool)

(declare-fun mapRes!49309 () Bool)

(declare-fun tp!93871 () Bool)

(declare-fun e!710979 () Bool)

(assert (=> mapNonEmpty!49309 (= mapRes!49309 (and tp!93871 e!710979))))

(declare-fun mapKey!49309 () (_ BitVec 32))

(declare-datatypes ((V!47623 0))(
  ( (V!47624 (val!15909 Int)) )
))
(declare-datatypes ((ValueCell!15083 0))(
  ( (ValueCellFull!15083 (v!18607 V!47623)) (EmptyCell!15083) )
))
(declare-fun mapRest!49309 () (Array (_ BitVec 32) ValueCell!15083))

(declare-fun mapValue!49309 () ValueCell!15083)

(declare-datatypes ((array!81050 0))(
  ( (array!81051 (arr!39089 (Array (_ BitVec 32) ValueCell!15083)) (size!39625 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81050)

(assert (=> mapNonEmpty!49309 (= (arr!39089 _values!914) (store mapRest!49309 mapKey!49309 mapValue!49309))))

(declare-fun b!1251927 () Bool)

(declare-fun e!710980 () Bool)

(assert (=> b!1251927 (= e!710980 (not true))))

(declare-datatypes ((tuple2!20516 0))(
  ( (tuple2!20517 (_1!10269 (_ BitVec 64)) (_2!10269 V!47623)) )
))
(declare-datatypes ((List!27748 0))(
  ( (Nil!27745) (Cons!27744 (h!28953 tuple2!20516) (t!41225 List!27748)) )
))
(declare-datatypes ((ListLongMap!18389 0))(
  ( (ListLongMap!18390 (toList!9210 List!27748)) )
))
(declare-fun lt!565104 () ListLongMap!18389)

(declare-fun lt!565105 () ListLongMap!18389)

(assert (=> b!1251927 (= lt!565104 lt!565105)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-datatypes ((Unit!41609 0))(
  ( (Unit!41610) )
))
(declare-fun lt!565103 () Unit!41609)

(declare-fun minValueAfter!43 () V!47623)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47623)

(declare-datatypes ((array!81052 0))(
  ( (array!81053 (arr!39090 (Array (_ BitVec 32) (_ BitVec 64))) (size!39626 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81052)

(declare-fun minValueBefore!43 () V!47623)

(declare-fun defaultEntry!922 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!970 (array!81052 array!81050 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47623 V!47623 V!47623 V!47623 (_ BitVec 32) Int) Unit!41609)

(assert (=> b!1251927 (= lt!565103 (lemmaNoChangeToArrayThenSameMapNoExtras!970 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5606 (array!81052 array!81050 (_ BitVec 32) (_ BitVec 32) V!47623 V!47623 (_ BitVec 32) Int) ListLongMap!18389)

(assert (=> b!1251927 (= lt!565105 (getCurrentListMapNoExtraKeys!5606 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251927 (= lt!565104 (getCurrentListMapNoExtraKeys!5606 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251928 () Bool)

(declare-fun res!834955 () Bool)

(assert (=> b!1251928 (=> (not res!834955) (not e!710980))))

(declare-datatypes ((List!27749 0))(
  ( (Nil!27746) (Cons!27745 (h!28954 (_ BitVec 64)) (t!41226 List!27749)) )
))
(declare-fun arrayNoDuplicates!0 (array!81052 (_ BitVec 32) List!27749) Bool)

(assert (=> b!1251928 (= res!834955 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27746))))

(declare-fun res!834954 () Bool)

(assert (=> start!105044 (=> (not res!834954) (not e!710980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105044 (= res!834954 (validMask!0 mask!1466))))

(assert (=> start!105044 e!710980))

(assert (=> start!105044 true))

(assert (=> start!105044 tp!93872))

(declare-fun tp_is_empty!31693 () Bool)

(assert (=> start!105044 tp_is_empty!31693))

(declare-fun array_inv!29815 (array!81052) Bool)

(assert (=> start!105044 (array_inv!29815 _keys!1118)))

(declare-fun e!710976 () Bool)

(declare-fun array_inv!29816 (array!81050) Bool)

(assert (=> start!105044 (and (array_inv!29816 _values!914) e!710976)))

(declare-fun b!1251929 () Bool)

(declare-fun res!834957 () Bool)

(assert (=> b!1251929 (=> (not res!834957) (not e!710980))))

(assert (=> b!1251929 (= res!834957 (and (= (size!39625 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39626 _keys!1118) (size!39625 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251930 () Bool)

(declare-fun res!834956 () Bool)

(assert (=> b!1251930 (=> (not res!834956) (not e!710980))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81052 (_ BitVec 32)) Bool)

(assert (=> b!1251930 (= res!834956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251931 () Bool)

(declare-fun e!710977 () Bool)

(assert (=> b!1251931 (= e!710976 (and e!710977 mapRes!49309))))

(declare-fun condMapEmpty!49309 () Bool)

(declare-fun mapDefault!49309 () ValueCell!15083)

