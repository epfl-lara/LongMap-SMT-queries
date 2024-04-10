; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105550 () Bool)

(assert start!105550)

(declare-fun b_free!27165 () Bool)

(declare-fun b_next!27165 () Bool)

(assert (=> start!105550 (= b_free!27165 (not b_next!27165))))

(declare-fun tp!95015 () Bool)

(declare-fun b_and!45031 () Bool)

(assert (=> start!105550 (= tp!95015 b_and!45031)))

(declare-fun b!1257448 () Bool)

(declare-fun e!715017 () Bool)

(declare-fun tp_is_empty!32067 () Bool)

(assert (=> b!1257448 (= e!715017 tp_is_empty!32067)))

(declare-fun res!838200 () Bool)

(declare-fun e!715019 () Bool)

(assert (=> start!105550 (=> (not res!838200) (not e!715019))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105550 (= res!838200 (validMask!0 mask!1466))))

(assert (=> start!105550 e!715019))

(assert (=> start!105550 true))

(assert (=> start!105550 tp!95015))

(assert (=> start!105550 tp_is_empty!32067))

(declare-datatypes ((array!81770 0))(
  ( (array!81771 (arr!39442 (Array (_ BitVec 32) (_ BitVec 64))) (size!39978 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81770)

(declare-fun array_inv!30045 (array!81770) Bool)

(assert (=> start!105550 (array_inv!30045 _keys!1118)))

(declare-datatypes ((V!48121 0))(
  ( (V!48122 (val!16096 Int)) )
))
(declare-datatypes ((ValueCell!15270 0))(
  ( (ValueCellFull!15270 (v!18798 V!48121)) (EmptyCell!15270) )
))
(declare-datatypes ((array!81772 0))(
  ( (array!81773 (arr!39443 (Array (_ BitVec 32) ValueCell!15270)) (size!39979 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81772)

(declare-fun e!715020 () Bool)

(declare-fun array_inv!30046 (array!81772) Bool)

(assert (=> start!105550 (and (array_inv!30046 _values!914) e!715020)))

(declare-fun mapNonEmpty!49891 () Bool)

(declare-fun mapRes!49891 () Bool)

(declare-fun tp!95014 () Bool)

(declare-fun e!715021 () Bool)

(assert (=> mapNonEmpty!49891 (= mapRes!49891 (and tp!95014 e!715021))))

(declare-fun mapRest!49891 () (Array (_ BitVec 32) ValueCell!15270))

(declare-fun mapValue!49891 () ValueCell!15270)

(declare-fun mapKey!49891 () (_ BitVec 32))

(assert (=> mapNonEmpty!49891 (= (arr!39443 _values!914) (store mapRest!49891 mapKey!49891 mapValue!49891))))

(declare-fun b!1257449 () Bool)

(assert (=> b!1257449 (= e!715020 (and e!715017 mapRes!49891))))

(declare-fun condMapEmpty!49891 () Bool)

(declare-fun mapDefault!49891 () ValueCell!15270)

(assert (=> b!1257449 (= condMapEmpty!49891 (= (arr!39443 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15270)) mapDefault!49891)))))

(declare-fun b!1257450 () Bool)

(declare-fun res!838199 () Bool)

(assert (=> b!1257450 (=> (not res!838199) (not e!715019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81770 (_ BitVec 32)) Bool)

(assert (=> b!1257450 (= res!838199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257451 () Bool)

(assert (=> b!1257451 (= e!715019 (not true))))

(declare-datatypes ((tuple2!20798 0))(
  ( (tuple2!20799 (_1!10410 (_ BitVec 64)) (_2!10410 V!48121)) )
))
(declare-datatypes ((List!28011 0))(
  ( (Nil!28008) (Cons!28007 (h!29216 tuple2!20798) (t!41502 List!28011)) )
))
(declare-datatypes ((ListLongMap!18671 0))(
  ( (ListLongMap!18672 (toList!9351 List!28011)) )
))
(declare-fun lt!568748 () ListLongMap!18671)

(declare-fun lt!568749 () ListLongMap!18671)

(assert (=> b!1257451 (= lt!568748 lt!568749)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41886 0))(
  ( (Unit!41887) )
))
(declare-fun lt!568747 () Unit!41886)

(declare-fun minValueAfter!43 () V!48121)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48121)

(declare-fun minValueBefore!43 () V!48121)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1093 (array!81770 array!81772 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48121 V!48121 V!48121 V!48121 (_ BitVec 32) Int) Unit!41886)

(assert (=> b!1257451 (= lt!568747 (lemmaNoChangeToArrayThenSameMapNoExtras!1093 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5729 (array!81770 array!81772 (_ BitVec 32) (_ BitVec 32) V!48121 V!48121 (_ BitVec 32) Int) ListLongMap!18671)

(assert (=> b!1257451 (= lt!568749 (getCurrentListMapNoExtraKeys!5729 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257451 (= lt!568748 (getCurrentListMapNoExtraKeys!5729 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257452 () Bool)

(declare-fun res!838201 () Bool)

(assert (=> b!1257452 (=> (not res!838201) (not e!715019))))

(declare-datatypes ((List!28012 0))(
  ( (Nil!28009) (Cons!28008 (h!29217 (_ BitVec 64)) (t!41503 List!28012)) )
))
(declare-fun arrayNoDuplicates!0 (array!81770 (_ BitVec 32) List!28012) Bool)

(assert (=> b!1257452 (= res!838201 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28009))))

(declare-fun b!1257453 () Bool)

(declare-fun res!838198 () Bool)

(assert (=> b!1257453 (=> (not res!838198) (not e!715019))))

(assert (=> b!1257453 (= res!838198 (and (= (size!39979 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39978 _keys!1118) (size!39979 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49891 () Bool)

(assert (=> mapIsEmpty!49891 mapRes!49891))

(declare-fun b!1257454 () Bool)

(assert (=> b!1257454 (= e!715021 tp_is_empty!32067)))

(assert (= (and start!105550 res!838200) b!1257453))

(assert (= (and b!1257453 res!838198) b!1257450))

(assert (= (and b!1257450 res!838199) b!1257452))

(assert (= (and b!1257452 res!838201) b!1257451))

(assert (= (and b!1257449 condMapEmpty!49891) mapIsEmpty!49891))

(assert (= (and b!1257449 (not condMapEmpty!49891)) mapNonEmpty!49891))

(get-info :version)

(assert (= (and mapNonEmpty!49891 ((_ is ValueCellFull!15270) mapValue!49891)) b!1257454))

(assert (= (and b!1257449 ((_ is ValueCellFull!15270) mapDefault!49891)) b!1257448))

(assert (= start!105550 b!1257449))

(declare-fun m!1158035 () Bool)

(assert (=> b!1257450 m!1158035))

(declare-fun m!1158037 () Bool)

(assert (=> start!105550 m!1158037))

(declare-fun m!1158039 () Bool)

(assert (=> start!105550 m!1158039))

(declare-fun m!1158041 () Bool)

(assert (=> start!105550 m!1158041))

(declare-fun m!1158043 () Bool)

(assert (=> b!1257451 m!1158043))

(declare-fun m!1158045 () Bool)

(assert (=> b!1257451 m!1158045))

(declare-fun m!1158047 () Bool)

(assert (=> b!1257451 m!1158047))

(declare-fun m!1158049 () Bool)

(assert (=> mapNonEmpty!49891 m!1158049))

(declare-fun m!1158051 () Bool)

(assert (=> b!1257452 m!1158051))

(check-sat (not b!1257451) tp_is_empty!32067 (not b!1257452) (not start!105550) b_and!45031 (not b_next!27165) (not mapNonEmpty!49891) (not b!1257450))
(check-sat b_and!45031 (not b_next!27165))
