; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105690 () Bool)

(assert start!105690)

(declare-fun b_free!27275 () Bool)

(declare-fun b_next!27275 () Bool)

(assert (=> start!105690 (= b_free!27275 (not b_next!27275))))

(declare-fun tp!95350 () Bool)

(declare-fun b_and!45159 () Bool)

(assert (=> start!105690 (= tp!95350 b_and!45159)))

(declare-fun mapNonEmpty!50062 () Bool)

(declare-fun mapRes!50062 () Bool)

(declare-fun tp!95351 () Bool)

(declare-fun e!716094 () Bool)

(assert (=> mapNonEmpty!50062 (= mapRes!50062 (and tp!95351 e!716094))))

(declare-datatypes ((V!48267 0))(
  ( (V!48268 (val!16151 Int)) )
))
(declare-datatypes ((ValueCell!15325 0))(
  ( (ValueCellFull!15325 (v!18853 V!48267)) (EmptyCell!15325) )
))
(declare-fun mapValue!50062 () ValueCell!15325)

(declare-fun mapRest!50062 () (Array (_ BitVec 32) ValueCell!15325))

(declare-datatypes ((array!81974 0))(
  ( (array!81975 (arr!39542 (Array (_ BitVec 32) ValueCell!15325)) (size!40078 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81974)

(declare-fun mapKey!50062 () (_ BitVec 32))

(assert (=> mapNonEmpty!50062 (= (arr!39542 _values!914) (store mapRest!50062 mapKey!50062 mapValue!50062))))

(declare-fun b!1258933 () Bool)

(declare-fun res!839045 () Bool)

(declare-fun e!716091 () Bool)

(assert (=> b!1258933 (=> (not res!839045) (not e!716091))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81976 0))(
  ( (array!81977 (arr!39543 (Array (_ BitVec 32) (_ BitVec 64))) (size!40079 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81976)

(declare-fun mask!1466 () (_ BitVec 32))

(assert (=> b!1258933 (= res!839045 (and (= (size!40078 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40079 _keys!1118) (size!40078 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258934 () Bool)

(declare-fun e!716093 () Bool)

(assert (=> b!1258934 (= e!716091 (not e!716093))))

(declare-fun res!839047 () Bool)

(assert (=> b!1258934 (=> res!839047 e!716093)))

(assert (=> b!1258934 (= res!839047 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20868 0))(
  ( (tuple2!20869 (_1!10445 (_ BitVec 64)) (_2!10445 V!48267)) )
))
(declare-datatypes ((List!28078 0))(
  ( (Nil!28075) (Cons!28074 (h!29283 tuple2!20868) (t!41573 List!28078)) )
))
(declare-datatypes ((ListLongMap!18741 0))(
  ( (ListLongMap!18742 (toList!9386 List!28078)) )
))
(declare-fun lt!569511 () ListLongMap!18741)

(declare-fun lt!569509 () ListLongMap!18741)

(assert (=> b!1258934 (= lt!569511 lt!569509)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41955 0))(
  ( (Unit!41956) )
))
(declare-fun lt!569513 () Unit!41955)

(declare-fun minValueAfter!43 () V!48267)

(declare-fun zeroValue!871 () V!48267)

(declare-fun minValueBefore!43 () V!48267)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1127 (array!81976 array!81974 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48267 V!48267 V!48267 V!48267 (_ BitVec 32) Int) Unit!41955)

(assert (=> b!1258934 (= lt!569513 (lemmaNoChangeToArrayThenSameMapNoExtras!1127 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5763 (array!81976 array!81974 (_ BitVec 32) (_ BitVec 32) V!48267 V!48267 (_ BitVec 32) Int) ListLongMap!18741)

(assert (=> b!1258934 (= lt!569509 (getCurrentListMapNoExtraKeys!5763 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258934 (= lt!569511 (getCurrentListMapNoExtraKeys!5763 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!569515 () ListLongMap!18741)

(declare-fun b!1258935 () Bool)

(declare-fun lt!569510 () tuple2!20868)

(declare-fun e!716092 () Bool)

(declare-fun +!4192 (ListLongMap!18741 tuple2!20868) ListLongMap!18741)

(assert (=> b!1258935 (= e!716092 (= lt!569515 (+!4192 lt!569509 lt!569510)))))

(declare-fun b!1258936 () Bool)

(assert (=> b!1258936 (= e!716093 true)))

(declare-fun lt!569514 () Bool)

(declare-fun lt!569512 () ListLongMap!18741)

(declare-fun contains!7572 (ListLongMap!18741 (_ BitVec 64)) Bool)

(assert (=> b!1258936 (= lt!569514 (contains!7572 lt!569512 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1258936 e!716092))

(declare-fun res!839046 () Bool)

(assert (=> b!1258936 (=> (not res!839046) (not e!716092))))

(declare-fun lt!569516 () ListLongMap!18741)

(assert (=> b!1258936 (= res!839046 (= lt!569516 (+!4192 lt!569512 (tuple2!20869 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> b!1258936 (= lt!569512 (+!4192 lt!569511 lt!569510))))

(assert (=> b!1258936 (= lt!569510 (tuple2!20869 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun getCurrentListMap!4586 (array!81976 array!81974 (_ BitVec 32) (_ BitVec 32) V!48267 V!48267 (_ BitVec 32) Int) ListLongMap!18741)

(assert (=> b!1258936 (= lt!569515 (getCurrentListMap!4586 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258936 (= lt!569516 (getCurrentListMap!4586 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!839044 () Bool)

(assert (=> start!105690 (=> (not res!839044) (not e!716091))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105690 (= res!839044 (validMask!0 mask!1466))))

(assert (=> start!105690 e!716091))

(assert (=> start!105690 true))

(assert (=> start!105690 tp!95350))

(declare-fun tp_is_empty!32177 () Bool)

(assert (=> start!105690 tp_is_empty!32177))

(declare-fun array_inv!30109 (array!81976) Bool)

(assert (=> start!105690 (array_inv!30109 _keys!1118)))

(declare-fun e!716088 () Bool)

(declare-fun array_inv!30110 (array!81974) Bool)

(assert (=> start!105690 (and (array_inv!30110 _values!914) e!716088)))

(declare-fun b!1258937 () Bool)

(assert (=> b!1258937 (= e!716094 tp_is_empty!32177)))

(declare-fun b!1258938 () Bool)

(declare-fun res!839048 () Bool)

(assert (=> b!1258938 (=> (not res!839048) (not e!716091))))

(declare-datatypes ((List!28079 0))(
  ( (Nil!28076) (Cons!28075 (h!29284 (_ BitVec 64)) (t!41574 List!28079)) )
))
(declare-fun arrayNoDuplicates!0 (array!81976 (_ BitVec 32) List!28079) Bool)

(assert (=> b!1258938 (= res!839048 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28076))))

(declare-fun b!1258939 () Bool)

(declare-fun e!716089 () Bool)

(assert (=> b!1258939 (= e!716089 tp_is_empty!32177)))

(declare-fun b!1258940 () Bool)

(declare-fun res!839049 () Bool)

(assert (=> b!1258940 (=> (not res!839049) (not e!716091))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81976 (_ BitVec 32)) Bool)

(assert (=> b!1258940 (= res!839049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258941 () Bool)

(assert (=> b!1258941 (= e!716088 (and e!716089 mapRes!50062))))

(declare-fun condMapEmpty!50062 () Bool)

(declare-fun mapDefault!50062 () ValueCell!15325)

