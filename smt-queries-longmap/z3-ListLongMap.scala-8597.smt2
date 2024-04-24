; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105036 () Bool)

(assert start!105036)

(declare-fun b_free!26617 () Bool)

(declare-fun b_next!26617 () Bool)

(assert (=> start!105036 (= b_free!26617 (not b_next!26617))))

(declare-fun tp!93340 () Bool)

(declare-fun b_and!44387 () Bool)

(assert (=> start!105036 (= tp!93340 b_and!44387)))

(declare-fun b!1250673 () Bool)

(declare-fun res!833945 () Bool)

(declare-fun e!709933 () Bool)

(assert (=> b!1250673 (=> (not res!833945) (not e!709933))))

(declare-datatypes ((array!80757 0))(
  ( (array!80758 (arr!38941 (Array (_ BitVec 32) (_ BitVec 64))) (size!39478 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80757)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80757 (_ BitVec 32)) Bool)

(assert (=> b!1250673 (= res!833945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49039 () Bool)

(declare-fun mapRes!49039 () Bool)

(declare-fun tp!93341 () Bool)

(declare-fun e!709931 () Bool)

(assert (=> mapNonEmpty!49039 (= mapRes!49039 (and tp!93341 e!709931))))

(declare-datatypes ((V!47391 0))(
  ( (V!47392 (val!15822 Int)) )
))
(declare-datatypes ((ValueCell!14996 0))(
  ( (ValueCellFull!14996 (v!18514 V!47391)) (EmptyCell!14996) )
))
(declare-fun mapRest!49039 () (Array (_ BitVec 32) ValueCell!14996))

(declare-fun mapKey!49039 () (_ BitVec 32))

(declare-fun mapValue!49039 () ValueCell!14996)

(declare-datatypes ((array!80759 0))(
  ( (array!80760 (arr!38942 (Array (_ BitVec 32) ValueCell!14996)) (size!39479 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80759)

(assert (=> mapNonEmpty!49039 (= (arr!38942 _values!914) (store mapRest!49039 mapKey!49039 mapValue!49039))))

(declare-fun b!1250674 () Bool)

(declare-fun e!709932 () Bool)

(declare-fun tp_is_empty!31519 () Bool)

(assert (=> b!1250674 (= e!709932 tp_is_empty!31519)))

(declare-fun res!833946 () Bool)

(assert (=> start!105036 (=> (not res!833946) (not e!709933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105036 (= res!833946 (validMask!0 mask!1466))))

(assert (=> start!105036 e!709933))

(assert (=> start!105036 true))

(assert (=> start!105036 tp!93340))

(assert (=> start!105036 tp_is_empty!31519))

(declare-fun array_inv!29825 (array!80757) Bool)

(assert (=> start!105036 (array_inv!29825 _keys!1118)))

(declare-fun e!709934 () Bool)

(declare-fun array_inv!29826 (array!80759) Bool)

(assert (=> start!105036 (and (array_inv!29826 _values!914) e!709934)))

(declare-fun mapIsEmpty!49039 () Bool)

(assert (=> mapIsEmpty!49039 mapRes!49039))

(declare-fun b!1250675 () Bool)

(declare-fun res!833944 () Bool)

(assert (=> b!1250675 (=> (not res!833944) (not e!709933))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1250675 (= res!833944 (and (= (size!39479 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39478 _keys!1118) (size!39479 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250676 () Bool)

(declare-fun res!833947 () Bool)

(assert (=> b!1250676 (=> (not res!833947) (not e!709933))))

(declare-datatypes ((List!27660 0))(
  ( (Nil!27657) (Cons!27656 (h!28874 (_ BitVec 64)) (t!41123 List!27660)) )
))
(declare-fun arrayNoDuplicates!0 (array!80757 (_ BitVec 32) List!27660) Bool)

(assert (=> b!1250676 (= res!833947 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27657))))

(declare-fun b!1250677 () Bool)

(assert (=> b!1250677 (= e!709931 tp_is_empty!31519)))

(declare-fun b!1250678 () Bool)

(assert (=> b!1250678 (= e!709933 (not true))))

(declare-datatypes ((tuple2!20406 0))(
  ( (tuple2!20407 (_1!10214 (_ BitVec 64)) (_2!10214 V!47391)) )
))
(declare-datatypes ((List!27661 0))(
  ( (Nil!27658) (Cons!27657 (h!28875 tuple2!20406) (t!41124 List!27661)) )
))
(declare-datatypes ((ListLongMap!18287 0))(
  ( (ListLongMap!18288 (toList!9159 List!27661)) )
))
(declare-fun lt!564184 () ListLongMap!18287)

(declare-fun lt!564185 () ListLongMap!18287)

(assert (=> b!1250678 (= lt!564184 lt!564185)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47391)

(declare-fun zeroValue!871 () V!47391)

(declare-datatypes ((Unit!41458 0))(
  ( (Unit!41459) )
))
(declare-fun lt!564183 () Unit!41458)

(declare-fun minValueBefore!43 () V!47391)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!908 (array!80757 array!80759 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47391 V!47391 V!47391 V!47391 (_ BitVec 32) Int) Unit!41458)

(assert (=> b!1250678 (= lt!564183 (lemmaNoChangeToArrayThenSameMapNoExtras!908 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5594 (array!80757 array!80759 (_ BitVec 32) (_ BitVec 32) V!47391 V!47391 (_ BitVec 32) Int) ListLongMap!18287)

(assert (=> b!1250678 (= lt!564185 (getCurrentListMapNoExtraKeys!5594 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250678 (= lt!564184 (getCurrentListMapNoExtraKeys!5594 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250679 () Bool)

(assert (=> b!1250679 (= e!709934 (and e!709932 mapRes!49039))))

(declare-fun condMapEmpty!49039 () Bool)

(declare-fun mapDefault!49039 () ValueCell!14996)

(assert (=> b!1250679 (= condMapEmpty!49039 (= (arr!38942 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14996)) mapDefault!49039)))))

(assert (= (and start!105036 res!833946) b!1250675))

(assert (= (and b!1250675 res!833944) b!1250673))

(assert (= (and b!1250673 res!833945) b!1250676))

(assert (= (and b!1250676 res!833947) b!1250678))

(assert (= (and b!1250679 condMapEmpty!49039) mapIsEmpty!49039))

(assert (= (and b!1250679 (not condMapEmpty!49039)) mapNonEmpty!49039))

(get-info :version)

(assert (= (and mapNonEmpty!49039 ((_ is ValueCellFull!14996) mapValue!49039)) b!1250677))

(assert (= (and b!1250679 ((_ is ValueCellFull!14996) mapDefault!49039)) b!1250674))

(assert (= start!105036 b!1250679))

(declare-fun m!1151919 () Bool)

(assert (=> mapNonEmpty!49039 m!1151919))

(declare-fun m!1151921 () Bool)

(assert (=> b!1250673 m!1151921))

(declare-fun m!1151923 () Bool)

(assert (=> b!1250678 m!1151923))

(declare-fun m!1151925 () Bool)

(assert (=> b!1250678 m!1151925))

(declare-fun m!1151927 () Bool)

(assert (=> b!1250678 m!1151927))

(declare-fun m!1151929 () Bool)

(assert (=> start!105036 m!1151929))

(declare-fun m!1151931 () Bool)

(assert (=> start!105036 m!1151931))

(declare-fun m!1151933 () Bool)

(assert (=> start!105036 m!1151933))

(declare-fun m!1151935 () Bool)

(assert (=> b!1250676 m!1151935))

(check-sat (not start!105036) (not b_next!26617) tp_is_empty!31519 (not mapNonEmpty!49039) b_and!44387 (not b!1250673) (not b!1250678) (not b!1250676))
(check-sat b_and!44387 (not b_next!26617))
