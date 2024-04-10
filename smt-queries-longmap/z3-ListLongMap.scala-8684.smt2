; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105504 () Bool)

(assert start!105504)

(declare-fun b_free!27141 () Bool)

(declare-fun b_next!27141 () Bool)

(assert (=> start!105504 (= b_free!27141 (not b_next!27141))))

(declare-fun tp!94939 () Bool)

(declare-fun b_and!44997 () Bool)

(assert (=> start!105504 (= tp!94939 b_and!44997)))

(declare-fun b!1256977 () Bool)

(declare-fun res!837933 () Bool)

(declare-fun e!714681 () Bool)

(assert (=> b!1256977 (=> (not res!837933) (not e!714681))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81722 0))(
  ( (array!81723 (arr!39419 (Array (_ BitVec 32) (_ BitVec 64))) (size!39955 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81722)

(declare-datatypes ((V!48089 0))(
  ( (V!48090 (val!16084 Int)) )
))
(declare-datatypes ((ValueCell!15258 0))(
  ( (ValueCellFull!15258 (v!18785 V!48089)) (EmptyCell!15258) )
))
(declare-datatypes ((array!81724 0))(
  ( (array!81725 (arr!39420 (Array (_ BitVec 32) ValueCell!15258)) (size!39956 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81724)

(assert (=> b!1256977 (= res!837933 (and (= (size!39956 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39955 _keys!1118) (size!39956 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49852 () Bool)

(declare-fun mapRes!49852 () Bool)

(assert (=> mapIsEmpty!49852 mapRes!49852))

(declare-fun b!1256978 () Bool)

(declare-fun res!837935 () Bool)

(assert (=> b!1256978 (=> (not res!837935) (not e!714681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81722 (_ BitVec 32)) Bool)

(assert (=> b!1256978 (= res!837935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256979 () Bool)

(declare-fun e!714680 () Bool)

(assert (=> b!1256979 (= e!714680 true)))

(declare-datatypes ((tuple2!20776 0))(
  ( (tuple2!20777 (_1!10399 (_ BitVec 64)) (_2!10399 V!48089)) )
))
(declare-datatypes ((List!27993 0))(
  ( (Nil!27990) (Cons!27989 (h!29198 tuple2!20776) (t!41482 List!27993)) )
))
(declare-datatypes ((ListLongMap!18649 0))(
  ( (ListLongMap!18650 (toList!9340 List!27993)) )
))
(declare-fun lt!568455 () ListLongMap!18649)

(declare-fun -!2088 (ListLongMap!18649 (_ BitVec 64)) ListLongMap!18649)

(assert (=> b!1256979 (= (-!2088 lt!568455 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568455)))

(declare-datatypes ((Unit!41864 0))(
  ( (Unit!41865) )
))
(declare-fun lt!568457 () Unit!41864)

(declare-fun removeNotPresentStillSame!141 (ListLongMap!18649 (_ BitVec 64)) Unit!41864)

(assert (=> b!1256979 (= lt!568457 (removeNotPresentStillSame!141 lt!568455 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!837934 () Bool)

(assert (=> start!105504 (=> (not res!837934) (not e!714681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105504 (= res!837934 (validMask!0 mask!1466))))

(assert (=> start!105504 e!714681))

(assert (=> start!105504 true))

(assert (=> start!105504 tp!94939))

(declare-fun tp_is_empty!32043 () Bool)

(assert (=> start!105504 tp_is_empty!32043))

(declare-fun array_inv!30025 (array!81722) Bool)

(assert (=> start!105504 (array_inv!30025 _keys!1118)))

(declare-fun e!714678 () Bool)

(declare-fun array_inv!30026 (array!81724) Bool)

(assert (=> start!105504 (and (array_inv!30026 _values!914) e!714678)))

(declare-fun mapNonEmpty!49852 () Bool)

(declare-fun tp!94940 () Bool)

(declare-fun e!714675 () Bool)

(assert (=> mapNonEmpty!49852 (= mapRes!49852 (and tp!94940 e!714675))))

(declare-fun mapRest!49852 () (Array (_ BitVec 32) ValueCell!15258))

(declare-fun mapKey!49852 () (_ BitVec 32))

(declare-fun mapValue!49852 () ValueCell!15258)

(assert (=> mapNonEmpty!49852 (= (arr!39420 _values!914) (store mapRest!49852 mapKey!49852 mapValue!49852))))

(declare-fun b!1256980 () Bool)

(declare-fun e!714679 () Bool)

(assert (=> b!1256980 (= e!714678 (and e!714679 mapRes!49852))))

(declare-fun condMapEmpty!49852 () Bool)

(declare-fun mapDefault!49852 () ValueCell!15258)

(assert (=> b!1256980 (= condMapEmpty!49852 (= (arr!39420 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15258)) mapDefault!49852)))))

(declare-fun b!1256981 () Bool)

(assert (=> b!1256981 (= e!714679 tp_is_empty!32043)))

(declare-fun b!1256982 () Bool)

(declare-fun e!714677 () Bool)

(assert (=> b!1256982 (= e!714677 e!714680)))

(declare-fun res!837932 () Bool)

(assert (=> b!1256982 (=> res!837932 e!714680)))

(declare-fun contains!7557 (ListLongMap!18649 (_ BitVec 64)) Bool)

(assert (=> b!1256982 (= res!837932 (contains!7557 lt!568455 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!48089)

(declare-fun minValueBefore!43 () V!48089)

(declare-fun getCurrentListMap!4562 (array!81722 array!81724 (_ BitVec 32) (_ BitVec 32) V!48089 V!48089 (_ BitVec 32) Int) ListLongMap!18649)

(assert (=> b!1256982 (= lt!568455 (getCurrentListMap!4562 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256983 () Bool)

(declare-fun res!837931 () Bool)

(assert (=> b!1256983 (=> (not res!837931) (not e!714681))))

(declare-datatypes ((List!27994 0))(
  ( (Nil!27991) (Cons!27990 (h!29199 (_ BitVec 64)) (t!41483 List!27994)) )
))
(declare-fun arrayNoDuplicates!0 (array!81722 (_ BitVec 32) List!27994) Bool)

(assert (=> b!1256983 (= res!837931 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27991))))

(declare-fun b!1256984 () Bool)

(assert (=> b!1256984 (= e!714681 (not e!714677))))

(declare-fun res!837936 () Bool)

(assert (=> b!1256984 (=> res!837936 e!714677)))

(assert (=> b!1256984 (= res!837936 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!568453 () ListLongMap!18649)

(declare-fun lt!568456 () ListLongMap!18649)

(assert (=> b!1256984 (= lt!568453 lt!568456)))

(declare-fun minValueAfter!43 () V!48089)

(declare-fun lt!568454 () Unit!41864)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1086 (array!81722 array!81724 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48089 V!48089 V!48089 V!48089 (_ BitVec 32) Int) Unit!41864)

(assert (=> b!1256984 (= lt!568454 (lemmaNoChangeToArrayThenSameMapNoExtras!1086 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5722 (array!81722 array!81724 (_ BitVec 32) (_ BitVec 32) V!48089 V!48089 (_ BitVec 32) Int) ListLongMap!18649)

(assert (=> b!1256984 (= lt!568456 (getCurrentListMapNoExtraKeys!5722 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256984 (= lt!568453 (getCurrentListMapNoExtraKeys!5722 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256985 () Bool)

(assert (=> b!1256985 (= e!714675 tp_is_empty!32043)))

(assert (= (and start!105504 res!837934) b!1256977))

(assert (= (and b!1256977 res!837933) b!1256978))

(assert (= (and b!1256978 res!837935) b!1256983))

(assert (= (and b!1256983 res!837931) b!1256984))

(assert (= (and b!1256984 (not res!837936)) b!1256982))

(assert (= (and b!1256982 (not res!837932)) b!1256979))

(assert (= (and b!1256980 condMapEmpty!49852) mapIsEmpty!49852))

(assert (= (and b!1256980 (not condMapEmpty!49852)) mapNonEmpty!49852))

(get-info :version)

(assert (= (and mapNonEmpty!49852 ((_ is ValueCellFull!15258) mapValue!49852)) b!1256985))

(assert (= (and b!1256980 ((_ is ValueCellFull!15258) mapDefault!49852)) b!1256981))

(assert (= start!105504 b!1256980))

(declare-fun m!1157605 () Bool)

(assert (=> b!1256979 m!1157605))

(declare-fun m!1157607 () Bool)

(assert (=> b!1256979 m!1157607))

(declare-fun m!1157609 () Bool)

(assert (=> b!1256978 m!1157609))

(declare-fun m!1157611 () Bool)

(assert (=> b!1256983 m!1157611))

(declare-fun m!1157613 () Bool)

(assert (=> start!105504 m!1157613))

(declare-fun m!1157615 () Bool)

(assert (=> start!105504 m!1157615))

(declare-fun m!1157617 () Bool)

(assert (=> start!105504 m!1157617))

(declare-fun m!1157619 () Bool)

(assert (=> b!1256982 m!1157619))

(declare-fun m!1157621 () Bool)

(assert (=> b!1256982 m!1157621))

(declare-fun m!1157623 () Bool)

(assert (=> b!1256984 m!1157623))

(declare-fun m!1157625 () Bool)

(assert (=> b!1256984 m!1157625))

(declare-fun m!1157627 () Bool)

(assert (=> b!1256984 m!1157627))

(declare-fun m!1157629 () Bool)

(assert (=> mapNonEmpty!49852 m!1157629))

(check-sat b_and!44997 tp_is_empty!32043 (not b!1256982) (not b!1256984) (not start!105504) (not b!1256979) (not b_next!27141) (not b!1256983) (not b!1256978) (not mapNonEmpty!49852))
(check-sat b_and!44997 (not b_next!27141))
