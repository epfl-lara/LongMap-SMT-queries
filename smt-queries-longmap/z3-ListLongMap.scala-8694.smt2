; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105808 () Bool)

(assert start!105808)

(declare-fun b_free!27199 () Bool)

(declare-fun b_next!27199 () Bool)

(assert (=> start!105808 (= b_free!27199 (not b_next!27199))))

(declare-fun tp!95117 () Bool)

(declare-fun b_and!45067 () Bool)

(assert (=> start!105808 (= tp!95117 b_and!45067)))

(declare-fun b!1259110 () Bool)

(declare-fun e!716123 () Bool)

(declare-fun e!716122 () Bool)

(declare-fun mapRes!49942 () Bool)

(assert (=> b!1259110 (= e!716123 (and e!716122 mapRes!49942))))

(declare-fun condMapEmpty!49942 () Bool)

(declare-datatypes ((V!48167 0))(
  ( (V!48168 (val!16113 Int)) )
))
(declare-datatypes ((ValueCell!15287 0))(
  ( (ValueCellFull!15287 (v!18811 V!48167)) (EmptyCell!15287) )
))
(declare-datatypes ((array!81879 0))(
  ( (array!81880 (arr!39492 (Array (_ BitVec 32) ValueCell!15287)) (size!40029 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81879)

(declare-fun mapDefault!49942 () ValueCell!15287)

(assert (=> b!1259110 (= condMapEmpty!49942 (= (arr!39492 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15287)) mapDefault!49942)))))

(declare-fun b!1259111 () Bool)

(declare-fun res!838923 () Bool)

(declare-fun e!716119 () Bool)

(assert (=> b!1259111 (=> (not res!838923) (not e!716119))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81881 0))(
  ( (array!81882 (arr!39493 (Array (_ BitVec 32) (_ BitVec 64))) (size!40030 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81881)

(assert (=> b!1259111 (= res!838923 (and (= (size!40029 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40030 _keys!1118) (size!40029 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259112 () Bool)

(assert (=> b!1259112 (= e!716119 (not true))))

(declare-datatypes ((tuple2!20840 0))(
  ( (tuple2!20841 (_1!10431 (_ BitVec 64)) (_2!10431 V!48167)) )
))
(declare-datatypes ((List!28068 0))(
  ( (Nil!28065) (Cons!28064 (h!29282 tuple2!20840) (t!41551 List!28068)) )
))
(declare-datatypes ((ListLongMap!18721 0))(
  ( (ListLongMap!18722 (toList!9376 List!28068)) )
))
(declare-fun lt!569386 () ListLongMap!18721)

(declare-fun lt!569384 () ListLongMap!18721)

(assert (=> b!1259112 (= lt!569386 lt!569384)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48167)

(declare-datatypes ((Unit!41895 0))(
  ( (Unit!41896) )
))
(declare-fun lt!569385 () Unit!41895)

(declare-fun zeroValue!871 () V!48167)

(declare-fun minValueBefore!43 () V!48167)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1106 (array!81881 array!81879 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48167 V!48167 V!48167 V!48167 (_ BitVec 32) Int) Unit!41895)

(assert (=> b!1259112 (= lt!569385 (lemmaNoChangeToArrayThenSameMapNoExtras!1106 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5792 (array!81881 array!81879 (_ BitVec 32) (_ BitVec 32) V!48167 V!48167 (_ BitVec 32) Int) ListLongMap!18721)

(assert (=> b!1259112 (= lt!569384 (getCurrentListMapNoExtraKeys!5792 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259112 (= lt!569386 (getCurrentListMapNoExtraKeys!5792 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259113 () Bool)

(declare-fun res!838925 () Bool)

(assert (=> b!1259113 (=> (not res!838925) (not e!716119))))

(declare-datatypes ((List!28069 0))(
  ( (Nil!28066) (Cons!28065 (h!29283 (_ BitVec 64)) (t!41552 List!28069)) )
))
(declare-fun arrayNoDuplicates!0 (array!81881 (_ BitVec 32) List!28069) Bool)

(assert (=> b!1259113 (= res!838925 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28066))))

(declare-fun mapNonEmpty!49942 () Bool)

(declare-fun tp!95116 () Bool)

(declare-fun e!716121 () Bool)

(assert (=> mapNonEmpty!49942 (= mapRes!49942 (and tp!95116 e!716121))))

(declare-fun mapValue!49942 () ValueCell!15287)

(declare-fun mapKey!49942 () (_ BitVec 32))

(declare-fun mapRest!49942 () (Array (_ BitVec 32) ValueCell!15287))

(assert (=> mapNonEmpty!49942 (= (arr!39492 _values!914) (store mapRest!49942 mapKey!49942 mapValue!49942))))

(declare-fun b!1259115 () Bool)

(declare-fun tp_is_empty!32101 () Bool)

(assert (=> b!1259115 (= e!716122 tp_is_empty!32101)))

(declare-fun b!1259116 () Bool)

(assert (=> b!1259116 (= e!716121 tp_is_empty!32101)))

(declare-fun mapIsEmpty!49942 () Bool)

(assert (=> mapIsEmpty!49942 mapRes!49942))

(declare-fun b!1259114 () Bool)

(declare-fun res!838922 () Bool)

(assert (=> b!1259114 (=> (not res!838922) (not e!716119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81881 (_ BitVec 32)) Bool)

(assert (=> b!1259114 (= res!838922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!838924 () Bool)

(assert (=> start!105808 (=> (not res!838924) (not e!716119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105808 (= res!838924 (validMask!0 mask!1466))))

(assert (=> start!105808 e!716119))

(assert (=> start!105808 true))

(assert (=> start!105808 tp!95117))

(assert (=> start!105808 tp_is_empty!32101))

(declare-fun array_inv!30219 (array!81881) Bool)

(assert (=> start!105808 (array_inv!30219 _keys!1118)))

(declare-fun array_inv!30220 (array!81879) Bool)

(assert (=> start!105808 (and (array_inv!30220 _values!914) e!716123)))

(assert (= (and start!105808 res!838924) b!1259111))

(assert (= (and b!1259111 res!838923) b!1259114))

(assert (= (and b!1259114 res!838922) b!1259113))

(assert (= (and b!1259113 res!838925) b!1259112))

(assert (= (and b!1259110 condMapEmpty!49942) mapIsEmpty!49942))

(assert (= (and b!1259110 (not condMapEmpty!49942)) mapNonEmpty!49942))

(get-info :version)

(assert (= (and mapNonEmpty!49942 ((_ is ValueCellFull!15287) mapValue!49942)) b!1259116))

(assert (= (and b!1259110 ((_ is ValueCellFull!15287) mapDefault!49942)) b!1259115))

(assert (= start!105808 b!1259110))

(declare-fun m!1159953 () Bool)

(assert (=> b!1259112 m!1159953))

(declare-fun m!1159955 () Bool)

(assert (=> b!1259112 m!1159955))

(declare-fun m!1159957 () Bool)

(assert (=> b!1259112 m!1159957))

(declare-fun m!1159959 () Bool)

(assert (=> start!105808 m!1159959))

(declare-fun m!1159961 () Bool)

(assert (=> start!105808 m!1159961))

(declare-fun m!1159963 () Bool)

(assert (=> start!105808 m!1159963))

(declare-fun m!1159965 () Bool)

(assert (=> b!1259113 m!1159965))

(declare-fun m!1159967 () Bool)

(assert (=> mapNonEmpty!49942 m!1159967))

(declare-fun m!1159969 () Bool)

(assert (=> b!1259114 m!1159969))

(check-sat b_and!45067 tp_is_empty!32101 (not b!1259112) (not b_next!27199) (not mapNonEmpty!49942) (not b!1259114) (not b!1259113) (not start!105808))
(check-sat b_and!45067 (not b_next!27199))
