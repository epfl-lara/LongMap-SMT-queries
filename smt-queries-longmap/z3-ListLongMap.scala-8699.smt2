; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105630 () Bool)

(assert start!105630)

(declare-fun b_free!27231 () Bool)

(declare-fun b_next!27231 () Bool)

(assert (=> start!105630 (= b_free!27231 (not b_next!27231))))

(declare-fun tp!95216 () Bool)

(declare-fun b_and!45105 () Bool)

(assert (=> start!105630 (= tp!95216 b_and!45105)))

(declare-fun mapIsEmpty!49993 () Bool)

(declare-fun mapRes!49993 () Bool)

(assert (=> mapIsEmpty!49993 mapRes!49993))

(declare-fun b!1258249 () Bool)

(declare-fun e!715594 () Bool)

(assert (=> b!1258249 (= e!715594 true)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!48209 0))(
  ( (V!48210 (val!16129 Int)) )
))
(declare-datatypes ((tuple2!20834 0))(
  ( (tuple2!20835 (_1!10428 (_ BitVec 64)) (_2!10428 V!48209)) )
))
(declare-datatypes ((List!28050 0))(
  ( (Nil!28047) (Cons!28046 (h!29255 tuple2!20834) (t!41543 List!28050)) )
))
(declare-datatypes ((ListLongMap!18707 0))(
  ( (ListLongMap!18708 (toList!9369 List!28050)) )
))
(declare-fun lt!569109 () ListLongMap!18707)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48209)

(declare-datatypes ((array!81890 0))(
  ( (array!81891 (arr!39501 (Array (_ BitVec 32) (_ BitVec 64))) (size!40037 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81890)

(declare-fun minValueBefore!43 () V!48209)

(declare-datatypes ((ValueCell!15303 0))(
  ( (ValueCellFull!15303 (v!18831 V!48209)) (EmptyCell!15303) )
))
(declare-datatypes ((array!81892 0))(
  ( (array!81893 (arr!39502 (Array (_ BitVec 32) ValueCell!15303)) (size!40038 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81892)

(declare-fun getCurrentListMap!4574 (array!81890 array!81892 (_ BitVec 32) (_ BitVec 32) V!48209 V!48209 (_ BitVec 32) Int) ListLongMap!18707)

(assert (=> b!1258249 (= lt!569109 (getCurrentListMap!4574 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258250 () Bool)

(declare-fun e!715590 () Bool)

(declare-fun e!715593 () Bool)

(assert (=> b!1258250 (= e!715590 (and e!715593 mapRes!49993))))

(declare-fun condMapEmpty!49993 () Bool)

(declare-fun mapDefault!49993 () ValueCell!15303)

(assert (=> b!1258250 (= condMapEmpty!49993 (= (arr!39502 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15303)) mapDefault!49993)))))

(declare-fun b!1258251 () Bool)

(declare-fun tp_is_empty!32133 () Bool)

(assert (=> b!1258251 (= e!715593 tp_is_empty!32133)))

(declare-fun mapNonEmpty!49993 () Bool)

(declare-fun tp!95215 () Bool)

(declare-fun e!715595 () Bool)

(assert (=> mapNonEmpty!49993 (= mapRes!49993 (and tp!95215 e!715595))))

(declare-fun mapKey!49993 () (_ BitVec 32))

(declare-fun mapValue!49993 () ValueCell!15303)

(declare-fun mapRest!49993 () (Array (_ BitVec 32) ValueCell!15303))

(assert (=> mapNonEmpty!49993 (= (arr!39502 _values!914) (store mapRest!49993 mapKey!49993 mapValue!49993))))

(declare-fun b!1258253 () Bool)

(assert (=> b!1258253 (= e!715595 tp_is_empty!32133)))

(declare-fun b!1258254 () Bool)

(declare-fun e!715592 () Bool)

(assert (=> b!1258254 (= e!715592 (not e!715594))))

(declare-fun res!838650 () Bool)

(assert (=> b!1258254 (=> res!838650 e!715594)))

(assert (=> b!1258254 (= res!838650 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!569107 () ListLongMap!18707)

(declare-fun lt!569110 () ListLongMap!18707)

(assert (=> b!1258254 (= lt!569107 lt!569110)))

(declare-fun minValueAfter!43 () V!48209)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((Unit!41922 0))(
  ( (Unit!41923) )
))
(declare-fun lt!569108 () Unit!41922)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1111 (array!81890 array!81892 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48209 V!48209 V!48209 V!48209 (_ BitVec 32) Int) Unit!41922)

(assert (=> b!1258254 (= lt!569108 (lemmaNoChangeToArrayThenSameMapNoExtras!1111 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5747 (array!81890 array!81892 (_ BitVec 32) (_ BitVec 32) V!48209 V!48209 (_ BitVec 32) Int) ListLongMap!18707)

(assert (=> b!1258254 (= lt!569110 (getCurrentListMapNoExtraKeys!5747 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258254 (= lt!569107 (getCurrentListMapNoExtraKeys!5747 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258255 () Bool)

(declare-fun res!838649 () Bool)

(assert (=> b!1258255 (=> (not res!838649) (not e!715592))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81890 (_ BitVec 32)) Bool)

(assert (=> b!1258255 (= res!838649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258256 () Bool)

(declare-fun res!838652 () Bool)

(assert (=> b!1258256 (=> (not res!838652) (not e!715592))))

(assert (=> b!1258256 (= res!838652 (and (= (size!40038 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40037 _keys!1118) (size!40038 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258252 () Bool)

(declare-fun res!838651 () Bool)

(assert (=> b!1258252 (=> (not res!838651) (not e!715592))))

(declare-datatypes ((List!28051 0))(
  ( (Nil!28048) (Cons!28047 (h!29256 (_ BitVec 64)) (t!41544 List!28051)) )
))
(declare-fun arrayNoDuplicates!0 (array!81890 (_ BitVec 32) List!28051) Bool)

(assert (=> b!1258252 (= res!838651 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28048))))

(declare-fun res!838648 () Bool)

(assert (=> start!105630 (=> (not res!838648) (not e!715592))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105630 (= res!838648 (validMask!0 mask!1466))))

(assert (=> start!105630 e!715592))

(assert (=> start!105630 true))

(assert (=> start!105630 tp!95216))

(assert (=> start!105630 tp_is_empty!32133))

(declare-fun array_inv!30087 (array!81890) Bool)

(assert (=> start!105630 (array_inv!30087 _keys!1118)))

(declare-fun array_inv!30088 (array!81892) Bool)

(assert (=> start!105630 (and (array_inv!30088 _values!914) e!715590)))

(assert (= (and start!105630 res!838648) b!1258256))

(assert (= (and b!1258256 res!838652) b!1258255))

(assert (= (and b!1258255 res!838649) b!1258252))

(assert (= (and b!1258252 res!838651) b!1258254))

(assert (= (and b!1258254 (not res!838650)) b!1258249))

(assert (= (and b!1258250 condMapEmpty!49993) mapIsEmpty!49993))

(assert (= (and b!1258250 (not condMapEmpty!49993)) mapNonEmpty!49993))

(get-info :version)

(assert (= (and mapNonEmpty!49993 ((_ is ValueCellFull!15303) mapValue!49993)) b!1258253))

(assert (= (and b!1258250 ((_ is ValueCellFull!15303) mapDefault!49993)) b!1258251))

(assert (= start!105630 b!1258250))

(declare-fun m!1158709 () Bool)

(assert (=> b!1258254 m!1158709))

(declare-fun m!1158711 () Bool)

(assert (=> b!1258254 m!1158711))

(declare-fun m!1158713 () Bool)

(assert (=> b!1258254 m!1158713))

(declare-fun m!1158715 () Bool)

(assert (=> mapNonEmpty!49993 m!1158715))

(declare-fun m!1158717 () Bool)

(assert (=> b!1258255 m!1158717))

(declare-fun m!1158719 () Bool)

(assert (=> start!105630 m!1158719))

(declare-fun m!1158721 () Bool)

(assert (=> start!105630 m!1158721))

(declare-fun m!1158723 () Bool)

(assert (=> start!105630 m!1158723))

(declare-fun m!1158725 () Bool)

(assert (=> b!1258249 m!1158725))

(declare-fun m!1158727 () Bool)

(assert (=> b!1258252 m!1158727))

(check-sat (not b!1258255) (not mapNonEmpty!49993) b_and!45105 tp_is_empty!32133 (not b_next!27231) (not b!1258252) (not b!1258254) (not start!105630) (not b!1258249))
(check-sat b_and!45105 (not b_next!27231))
