; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105660 () Bool)

(assert start!105660)

(declare-fun b_free!27261 () Bool)

(declare-fun b_next!27261 () Bool)

(assert (=> start!105660 (= b_free!27261 (not b_next!27261))))

(declare-fun tp!95305 () Bool)

(declare-fun b_and!45135 () Bool)

(assert (=> start!105660 (= tp!95305 b_and!45135)))

(declare-fun b!1258609 () Bool)

(declare-fun res!838876 () Bool)

(declare-fun e!715863 () Bool)

(assert (=> b!1258609 (=> (not res!838876) (not e!715863))))

(declare-datatypes ((array!81946 0))(
  ( (array!81947 (arr!39529 (Array (_ BitVec 32) (_ BitVec 64))) (size!40065 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81946)

(declare-datatypes ((List!28069 0))(
  ( (Nil!28066) (Cons!28065 (h!29274 (_ BitVec 64)) (t!41562 List!28069)) )
))
(declare-fun arrayNoDuplicates!0 (array!81946 (_ BitVec 32) List!28069) Bool)

(assert (=> b!1258609 (= res!838876 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28066))))

(declare-fun b!1258610 () Bool)

(declare-fun e!715861 () Bool)

(declare-fun tp_is_empty!32163 () Bool)

(assert (=> b!1258610 (= e!715861 tp_is_empty!32163)))

(declare-fun b!1258611 () Bool)

(declare-fun e!715864 () Bool)

(declare-fun mapRes!50038 () Bool)

(assert (=> b!1258611 (= e!715864 (and e!715861 mapRes!50038))))

(declare-fun condMapEmpty!50038 () Bool)

(declare-datatypes ((V!48249 0))(
  ( (V!48250 (val!16144 Int)) )
))
(declare-datatypes ((ValueCell!15318 0))(
  ( (ValueCellFull!15318 (v!18846 V!48249)) (EmptyCell!15318) )
))
(declare-datatypes ((array!81948 0))(
  ( (array!81949 (arr!39530 (Array (_ BitVec 32) ValueCell!15318)) (size!40066 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81948)

(declare-fun mapDefault!50038 () ValueCell!15318)

(assert (=> b!1258611 (= condMapEmpty!50038 (= (arr!39530 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15318)) mapDefault!50038)))))

(declare-fun b!1258612 () Bool)

(declare-fun e!715865 () Bool)

(assert (=> b!1258612 (= e!715863 (not e!715865))))

(declare-fun res!838874 () Bool)

(assert (=> b!1258612 (=> res!838874 e!715865)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1258612 (= res!838874 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20856 0))(
  ( (tuple2!20857 (_1!10439 (_ BitVec 64)) (_2!10439 V!48249)) )
))
(declare-datatypes ((List!28070 0))(
  ( (Nil!28067) (Cons!28066 (h!29275 tuple2!20856) (t!41563 List!28070)) )
))
(declare-datatypes ((ListLongMap!18729 0))(
  ( (ListLongMap!18730 (toList!9380 List!28070)) )
))
(declare-fun lt!569288 () ListLongMap!18729)

(declare-fun lt!569287 () ListLongMap!18729)

(assert (=> b!1258612 (= lt!569288 lt!569287)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48249)

(declare-datatypes ((Unit!41942 0))(
  ( (Unit!41943) )
))
(declare-fun lt!569289 () Unit!41942)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!48249)

(declare-fun zeroValue!871 () V!48249)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1121 (array!81946 array!81948 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48249 V!48249 V!48249 V!48249 (_ BitVec 32) Int) Unit!41942)

(assert (=> b!1258612 (= lt!569289 (lemmaNoChangeToArrayThenSameMapNoExtras!1121 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5757 (array!81946 array!81948 (_ BitVec 32) (_ BitVec 32) V!48249 V!48249 (_ BitVec 32) Int) ListLongMap!18729)

(assert (=> b!1258612 (= lt!569287 (getCurrentListMapNoExtraKeys!5757 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258612 (= lt!569288 (getCurrentListMapNoExtraKeys!5757 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258613 () Bool)

(declare-fun res!838873 () Bool)

(assert (=> b!1258613 (=> (not res!838873) (not e!715863))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81946 (_ BitVec 32)) Bool)

(assert (=> b!1258613 (= res!838873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!50038 () Bool)

(declare-fun tp!95306 () Bool)

(declare-fun e!715860 () Bool)

(assert (=> mapNonEmpty!50038 (= mapRes!50038 (and tp!95306 e!715860))))

(declare-fun mapKey!50038 () (_ BitVec 32))

(declare-fun mapValue!50038 () ValueCell!15318)

(declare-fun mapRest!50038 () (Array (_ BitVec 32) ValueCell!15318))

(assert (=> mapNonEmpty!50038 (= (arr!39530 _values!914) (store mapRest!50038 mapKey!50038 mapValue!50038))))

(declare-fun b!1258614 () Bool)

(declare-fun res!838875 () Bool)

(assert (=> b!1258614 (=> (not res!838875) (not e!715863))))

(assert (=> b!1258614 (= res!838875 (and (= (size!40066 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40065 _keys!1118) (size!40066 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258616 () Bool)

(assert (=> b!1258616 (= e!715865 true)))

(declare-fun lt!569290 () ListLongMap!18729)

(declare-fun getCurrentListMap!4582 (array!81946 array!81948 (_ BitVec 32) (_ BitVec 32) V!48249 V!48249 (_ BitVec 32) Int) ListLongMap!18729)

(assert (=> b!1258616 (= lt!569290 (getCurrentListMap!4582 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50038 () Bool)

(assert (=> mapIsEmpty!50038 mapRes!50038))

(declare-fun res!838877 () Bool)

(assert (=> start!105660 (=> (not res!838877) (not e!715863))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105660 (= res!838877 (validMask!0 mask!1466))))

(assert (=> start!105660 e!715863))

(assert (=> start!105660 true))

(assert (=> start!105660 tp!95305))

(assert (=> start!105660 tp_is_empty!32163))

(declare-fun array_inv!30101 (array!81946) Bool)

(assert (=> start!105660 (array_inv!30101 _keys!1118)))

(declare-fun array_inv!30102 (array!81948) Bool)

(assert (=> start!105660 (and (array_inv!30102 _values!914) e!715864)))

(declare-fun b!1258615 () Bool)

(assert (=> b!1258615 (= e!715860 tp_is_empty!32163)))

(assert (= (and start!105660 res!838877) b!1258614))

(assert (= (and b!1258614 res!838875) b!1258613))

(assert (= (and b!1258613 res!838873) b!1258609))

(assert (= (and b!1258609 res!838876) b!1258612))

(assert (= (and b!1258612 (not res!838874)) b!1258616))

(assert (= (and b!1258611 condMapEmpty!50038) mapIsEmpty!50038))

(assert (= (and b!1258611 (not condMapEmpty!50038)) mapNonEmpty!50038))

(get-info :version)

(assert (= (and mapNonEmpty!50038 ((_ is ValueCellFull!15318) mapValue!50038)) b!1258615))

(assert (= (and b!1258611 ((_ is ValueCellFull!15318) mapDefault!50038)) b!1258610))

(assert (= start!105660 b!1258611))

(declare-fun m!1159009 () Bool)

(assert (=> b!1258613 m!1159009))

(declare-fun m!1159011 () Bool)

(assert (=> start!105660 m!1159011))

(declare-fun m!1159013 () Bool)

(assert (=> start!105660 m!1159013))

(declare-fun m!1159015 () Bool)

(assert (=> start!105660 m!1159015))

(declare-fun m!1159017 () Bool)

(assert (=> b!1258612 m!1159017))

(declare-fun m!1159019 () Bool)

(assert (=> b!1258612 m!1159019))

(declare-fun m!1159021 () Bool)

(assert (=> b!1258612 m!1159021))

(declare-fun m!1159023 () Bool)

(assert (=> b!1258609 m!1159023))

(declare-fun m!1159025 () Bool)

(assert (=> mapNonEmpty!50038 m!1159025))

(declare-fun m!1159027 () Bool)

(assert (=> b!1258616 m!1159027))

(check-sat (not b!1258612) (not b!1258616) (not mapNonEmpty!50038) (not b!1258613) (not start!105660) tp_is_empty!32163 (not b!1258609) b_and!45135 (not b_next!27261))
(check-sat b_and!45135 (not b_next!27261))
