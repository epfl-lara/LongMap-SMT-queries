; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105518 () Bool)

(assert start!105518)

(declare-fun b_free!27155 () Bool)

(declare-fun b_next!27155 () Bool)

(assert (=> start!105518 (= b_free!27155 (not b_next!27155))))

(declare-fun tp!94982 () Bool)

(declare-fun b_and!45011 () Bool)

(assert (=> start!105518 (= tp!94982 b_and!45011)))

(declare-fun b!1257166 () Bool)

(declare-fun res!838060 () Bool)

(declare-fun e!714822 () Bool)

(assert (=> b!1257166 (=> (not res!838060) (not e!714822))))

(declare-datatypes ((array!81748 0))(
  ( (array!81749 (arr!39432 (Array (_ BitVec 32) (_ BitVec 64))) (size!39968 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81748)

(declare-datatypes ((List!28003 0))(
  ( (Nil!28000) (Cons!27999 (h!29208 (_ BitVec 64)) (t!41492 List!28003)) )
))
(declare-fun arrayNoDuplicates!0 (array!81748 (_ BitVec 32) List!28003) Bool)

(assert (=> b!1257166 (= res!838060 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28000))))

(declare-fun res!838059 () Bool)

(assert (=> start!105518 (=> (not res!838059) (not e!714822))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105518 (= res!838059 (validMask!0 mask!1466))))

(assert (=> start!105518 e!714822))

(assert (=> start!105518 true))

(assert (=> start!105518 tp!94982))

(declare-fun tp_is_empty!32057 () Bool)

(assert (=> start!105518 tp_is_empty!32057))

(declare-fun array_inv!30037 (array!81748) Bool)

(assert (=> start!105518 (array_inv!30037 _keys!1118)))

(declare-datatypes ((V!48107 0))(
  ( (V!48108 (val!16091 Int)) )
))
(declare-datatypes ((ValueCell!15265 0))(
  ( (ValueCellFull!15265 (v!18792 V!48107)) (EmptyCell!15265) )
))
(declare-datatypes ((array!81750 0))(
  ( (array!81751 (arr!39433 (Array (_ BitVec 32) ValueCell!15265)) (size!39969 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81750)

(declare-fun e!714823 () Bool)

(declare-fun array_inv!30038 (array!81750) Bool)

(assert (=> start!105518 (and (array_inv!30038 _values!914) e!714823)))

(declare-fun mapIsEmpty!49873 () Bool)

(declare-fun mapRes!49873 () Bool)

(assert (=> mapIsEmpty!49873 mapRes!49873))

(declare-fun b!1257167 () Bool)

(declare-fun e!714824 () Bool)

(assert (=> b!1257167 (= e!714822 (not e!714824))))

(declare-fun res!838061 () Bool)

(assert (=> b!1257167 (=> res!838061 e!714824)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1257167 (= res!838061 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20788 0))(
  ( (tuple2!20789 (_1!10405 (_ BitVec 64)) (_2!10405 V!48107)) )
))
(declare-datatypes ((List!28004 0))(
  ( (Nil!28001) (Cons!28000 (h!29209 tuple2!20788) (t!41493 List!28004)) )
))
(declare-datatypes ((ListLongMap!18661 0))(
  ( (ListLongMap!18662 (toList!9346 List!28004)) )
))
(declare-fun lt!568558 () ListLongMap!18661)

(declare-fun lt!568562 () ListLongMap!18661)

(assert (=> b!1257167 (= lt!568558 lt!568562)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48107)

(declare-datatypes ((Unit!41876 0))(
  ( (Unit!41877) )
))
(declare-fun lt!568559 () Unit!41876)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48107)

(declare-fun minValueBefore!43 () V!48107)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1089 (array!81748 array!81750 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48107 V!48107 V!48107 V!48107 (_ BitVec 32) Int) Unit!41876)

(assert (=> b!1257167 (= lt!568559 (lemmaNoChangeToArrayThenSameMapNoExtras!1089 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5725 (array!81748 array!81750 (_ BitVec 32) (_ BitVec 32) V!48107 V!48107 (_ BitVec 32) Int) ListLongMap!18661)

(assert (=> b!1257167 (= lt!568562 (getCurrentListMapNoExtraKeys!5725 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257167 (= lt!568558 (getCurrentListMapNoExtraKeys!5725 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49873 () Bool)

(declare-fun tp!94981 () Bool)

(declare-fun e!714827 () Bool)

(assert (=> mapNonEmpty!49873 (= mapRes!49873 (and tp!94981 e!714827))))

(declare-fun mapRest!49873 () (Array (_ BitVec 32) ValueCell!15265))

(declare-fun mapValue!49873 () ValueCell!15265)

(declare-fun mapKey!49873 () (_ BitVec 32))

(assert (=> mapNonEmpty!49873 (= (arr!39433 _values!914) (store mapRest!49873 mapKey!49873 mapValue!49873))))

(declare-fun b!1257168 () Bool)

(declare-fun res!838058 () Bool)

(assert (=> b!1257168 (=> (not res!838058) (not e!714822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81748 (_ BitVec 32)) Bool)

(assert (=> b!1257168 (= res!838058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257169 () Bool)

(declare-fun e!714826 () Bool)

(assert (=> b!1257169 (= e!714824 e!714826)))

(declare-fun res!838062 () Bool)

(assert (=> b!1257169 (=> res!838062 e!714826)))

(declare-fun lt!568560 () ListLongMap!18661)

(declare-fun contains!7562 (ListLongMap!18661 (_ BitVec 64)) Bool)

(assert (=> b!1257169 (= res!838062 (contains!7562 lt!568560 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4567 (array!81748 array!81750 (_ BitVec 32) (_ BitVec 32) V!48107 V!48107 (_ BitVec 32) Int) ListLongMap!18661)

(assert (=> b!1257169 (= lt!568560 (getCurrentListMap!4567 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257170 () Bool)

(assert (=> b!1257170 (= e!714827 tp_is_empty!32057)))

(declare-fun b!1257171 () Bool)

(declare-fun res!838057 () Bool)

(assert (=> b!1257171 (=> (not res!838057) (not e!714822))))

(assert (=> b!1257171 (= res!838057 (and (= (size!39969 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39968 _keys!1118) (size!39969 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1257172 () Bool)

(declare-fun e!714828 () Bool)

(assert (=> b!1257172 (= e!714823 (and e!714828 mapRes!49873))))

(declare-fun condMapEmpty!49873 () Bool)

(declare-fun mapDefault!49873 () ValueCell!15265)

