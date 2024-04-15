; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105574 () Bool)

(assert start!105574)

(declare-fun b_free!27193 () Bool)

(declare-fun b_next!27193 () Bool)

(assert (=> start!105574 (= b_free!27193 (not b_next!27193))))

(declare-fun tp!95098 () Bool)

(declare-fun b_and!45041 () Bool)

(assert (=> start!105574 (= tp!95098 b_and!45041)))

(declare-fun b!1257660 () Bool)

(declare-fun res!838326 () Bool)

(declare-fun e!715182 () Bool)

(assert (=> b!1257660 (=> (not res!838326) (not e!715182))))

(declare-datatypes ((array!81747 0))(
  ( (array!81748 (arr!39431 (Array (_ BitVec 32) (_ BitVec 64))) (size!39969 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81747)

(declare-datatypes ((List!28106 0))(
  ( (Nil!28103) (Cons!28102 (h!29311 (_ BitVec 64)) (t!41588 List!28106)) )
))
(declare-fun arrayNoDuplicates!0 (array!81747 (_ BitVec 32) List!28106) Bool)

(assert (=> b!1257660 (= res!838326 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28103))))

(declare-fun b!1257661 () Bool)

(declare-fun e!715186 () Bool)

(declare-fun tp_is_empty!32095 () Bool)

(assert (=> b!1257661 (= e!715186 tp_is_empty!32095)))

(declare-fun b!1257662 () Bool)

(declare-fun res!838327 () Bool)

(assert (=> b!1257662 (=> (not res!838327) (not e!715182))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!48159 0))(
  ( (V!48160 (val!16110 Int)) )
))
(declare-datatypes ((ValueCell!15284 0))(
  ( (ValueCellFull!15284 (v!18811 V!48159)) (EmptyCell!15284) )
))
(declare-datatypes ((array!81749 0))(
  ( (array!81750 (arr!39432 (Array (_ BitVec 32) ValueCell!15284)) (size!39970 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81749)

(assert (=> b!1257662 (= res!838327 (and (= (size!39970 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39969 _keys!1118) (size!39970 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49933 () Bool)

(declare-fun mapRes!49933 () Bool)

(declare-fun tp!95099 () Bool)

(declare-fun e!715183 () Bool)

(assert (=> mapNonEmpty!49933 (= mapRes!49933 (and tp!95099 e!715183))))

(declare-fun mapValue!49933 () ValueCell!15284)

(declare-fun mapKey!49933 () (_ BitVec 32))

(declare-fun mapRest!49933 () (Array (_ BitVec 32) ValueCell!15284))

(assert (=> mapNonEmpty!49933 (= (arr!39432 _values!914) (store mapRest!49933 mapKey!49933 mapValue!49933))))

(declare-fun b!1257663 () Bool)

(declare-fun res!838328 () Bool)

(assert (=> b!1257663 (=> (not res!838328) (not e!715182))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81747 (_ BitVec 32)) Bool)

(assert (=> b!1257663 (= res!838328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257664 () Bool)

(declare-fun e!715184 () Bool)

(assert (=> b!1257664 (= e!715184 (and e!715186 mapRes!49933))))

(declare-fun condMapEmpty!49933 () Bool)

(declare-fun mapDefault!49933 () ValueCell!15284)

(assert (=> b!1257664 (= condMapEmpty!49933 (= (arr!39432 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15284)) mapDefault!49933)))))

(declare-fun res!838329 () Bool)

(assert (=> start!105574 (=> (not res!838329) (not e!715182))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105574 (= res!838329 (validMask!0 mask!1466))))

(assert (=> start!105574 e!715182))

(assert (=> start!105574 true))

(assert (=> start!105574 tp!95098))

(assert (=> start!105574 tp_is_empty!32095))

(declare-fun array_inv!30169 (array!81747) Bool)

(assert (=> start!105574 (array_inv!30169 _keys!1118)))

(declare-fun array_inv!30170 (array!81749) Bool)

(assert (=> start!105574 (and (array_inv!30170 _values!914) e!715184)))

(declare-fun b!1257665 () Bool)

(assert (=> b!1257665 (= e!715182 (not true))))

(declare-datatypes ((tuple2!20898 0))(
  ( (tuple2!20899 (_1!10460 (_ BitVec 64)) (_2!10460 V!48159)) )
))
(declare-datatypes ((List!28107 0))(
  ( (Nil!28104) (Cons!28103 (h!29312 tuple2!20898) (t!41589 List!28107)) )
))
(declare-datatypes ((ListLongMap!18771 0))(
  ( (ListLongMap!18772 (toList!9401 List!28107)) )
))
(declare-fun lt!568696 () ListLongMap!18771)

(declare-fun lt!568695 () ListLongMap!18771)

(assert (=> b!1257665 (= lt!568696 lt!568695)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48159)

(declare-fun zeroValue!871 () V!48159)

(declare-datatypes ((Unit!41761 0))(
  ( (Unit!41762) )
))
(declare-fun lt!568694 () Unit!41761)

(declare-fun minValueBefore!43 () V!48159)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1105 (array!81747 array!81749 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48159 V!48159 V!48159 V!48159 (_ BitVec 32) Int) Unit!41761)

(assert (=> b!1257665 (= lt!568694 (lemmaNoChangeToArrayThenSameMapNoExtras!1105 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5783 (array!81747 array!81749 (_ BitVec 32) (_ BitVec 32) V!48159 V!48159 (_ BitVec 32) Int) ListLongMap!18771)

(assert (=> b!1257665 (= lt!568695 (getCurrentListMapNoExtraKeys!5783 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257665 (= lt!568696 (getCurrentListMapNoExtraKeys!5783 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257666 () Bool)

(assert (=> b!1257666 (= e!715183 tp_is_empty!32095)))

(declare-fun mapIsEmpty!49933 () Bool)

(assert (=> mapIsEmpty!49933 mapRes!49933))

(assert (= (and start!105574 res!838329) b!1257662))

(assert (= (and b!1257662 res!838327) b!1257663))

(assert (= (and b!1257663 res!838328) b!1257660))

(assert (= (and b!1257660 res!838326) b!1257665))

(assert (= (and b!1257664 condMapEmpty!49933) mapIsEmpty!49933))

(assert (= (and b!1257664 (not condMapEmpty!49933)) mapNonEmpty!49933))

(get-info :version)

(assert (= (and mapNonEmpty!49933 ((_ is ValueCellFull!15284) mapValue!49933)) b!1257666))

(assert (= (and b!1257664 ((_ is ValueCellFull!15284) mapDefault!49933)) b!1257661))

(assert (= start!105574 b!1257664))

(declare-fun m!1157767 () Bool)

(assert (=> mapNonEmpty!49933 m!1157767))

(declare-fun m!1157769 () Bool)

(assert (=> start!105574 m!1157769))

(declare-fun m!1157771 () Bool)

(assert (=> start!105574 m!1157771))

(declare-fun m!1157773 () Bool)

(assert (=> start!105574 m!1157773))

(declare-fun m!1157775 () Bool)

(assert (=> b!1257663 m!1157775))

(declare-fun m!1157777 () Bool)

(assert (=> b!1257665 m!1157777))

(declare-fun m!1157779 () Bool)

(assert (=> b!1257665 m!1157779))

(declare-fun m!1157781 () Bool)

(assert (=> b!1257665 m!1157781))

(declare-fun m!1157783 () Bool)

(assert (=> b!1257660 m!1157783))

(check-sat (not start!105574) (not b_next!27193) (not b!1257660) tp_is_empty!32095 b_and!45041 (not b!1257663) (not b!1257665) (not mapNonEmpty!49933))
(check-sat b_and!45041 (not b_next!27193))
