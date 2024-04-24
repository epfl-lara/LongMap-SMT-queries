; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84226 () Bool)

(assert start!84226)

(declare-fun b_free!19813 () Bool)

(declare-fun b_next!19813 () Bool)

(assert (=> start!84226 (= b_free!19813 (not b_next!19813))))

(declare-fun tp!68962 () Bool)

(declare-fun b_and!31719 () Bool)

(assert (=> start!84226 (= tp!68962 b_and!31719)))

(declare-fun mapIsEmpty!36320 () Bool)

(declare-fun mapRes!36320 () Bool)

(assert (=> mapIsEmpty!36320 mapRes!36320))

(declare-fun b!983672 () Bool)

(declare-fun e!554546 () Bool)

(declare-fun tp_is_empty!22861 () Bool)

(assert (=> b!983672 (= e!554546 tp_is_empty!22861)))

(declare-fun b!983673 () Bool)

(declare-fun res!658014 () Bool)

(declare-fun e!554548 () Bool)

(assert (=> b!983673 (=> (not res!658014) (not e!554548))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35465 0))(
  ( (V!35466 (val!11481 Int)) )
))
(declare-datatypes ((ValueCell!10949 0))(
  ( (ValueCellFull!10949 (v!14040 V!35465)) (EmptyCell!10949) )
))
(declare-datatypes ((array!61750 0))(
  ( (array!61751 (arr!29728 (Array (_ BitVec 32) ValueCell!10949)) (size!30208 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61750)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61752 0))(
  ( (array!61753 (arr!29729 (Array (_ BitVec 32) (_ BitVec 64))) (size!30209 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61752)

(assert (=> b!983673 (= res!658014 (and (= (size!30208 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30209 _keys!1544) (size!30208 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983674 () Bool)

(declare-fun res!658018 () Bool)

(assert (=> b!983674 (=> (not res!658018) (not e!554548))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!983674 (= res!658018 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30209 _keys!1544))))))

(declare-fun res!658017 () Bool)

(assert (=> start!84226 (=> (not res!658017) (not e!554548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84226 (= res!658017 (validMask!0 mask!1948))))

(assert (=> start!84226 e!554548))

(assert (=> start!84226 true))

(assert (=> start!84226 tp_is_empty!22861))

(declare-fun e!554547 () Bool)

(declare-fun array_inv!23003 (array!61750) Bool)

(assert (=> start!84226 (and (array_inv!23003 _values!1278) e!554547)))

(assert (=> start!84226 tp!68962))

(declare-fun array_inv!23004 (array!61752) Bool)

(assert (=> start!84226 (array_inv!23004 _keys!1544)))

(declare-fun b!983675 () Bool)

(declare-fun e!554545 () Bool)

(assert (=> b!983675 (= e!554548 e!554545)))

(declare-fun res!658012 () Bool)

(assert (=> b!983675 (=> (not res!658012) (not e!554545))))

(assert (=> b!983675 (= res!658012 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29729 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!436641 () V!35465)

(declare-fun get!15448 (ValueCell!10949 V!35465) V!35465)

(declare-fun dynLambda!1829 (Int (_ BitVec 64)) V!35465)

(assert (=> b!983675 (= lt!436641 (get!15448 (select (arr!29728 _values!1278) from!1932) (dynLambda!1829 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35465)

(declare-fun zeroValue!1220 () V!35465)

(declare-datatypes ((tuple2!14726 0))(
  ( (tuple2!14727 (_1!7374 (_ BitVec 64)) (_2!7374 V!35465)) )
))
(declare-datatypes ((List!20599 0))(
  ( (Nil!20596) (Cons!20595 (h!21763 tuple2!14726) (t!29354 List!20599)) )
))
(declare-datatypes ((ListLongMap!13425 0))(
  ( (ListLongMap!13426 (toList!6728 List!20599)) )
))
(declare-fun lt!436637 () ListLongMap!13425)

(declare-fun getCurrentListMapNoExtraKeys!3470 (array!61752 array!61750 (_ BitVec 32) (_ BitVec 32) V!35465 V!35465 (_ BitVec 32) Int) ListLongMap!13425)

(assert (=> b!983675 (= lt!436637 (getCurrentListMapNoExtraKeys!3470 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!983676 () Bool)

(declare-fun res!658015 () Bool)

(assert (=> b!983676 (=> (not res!658015) (not e!554548))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983676 (= res!658015 (validKeyInArray!0 (select (arr!29729 _keys!1544) from!1932)))))

(declare-fun b!983677 () Bool)

(declare-fun res!658013 () Bool)

(assert (=> b!983677 (=> (not res!658013) (not e!554548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61752 (_ BitVec 32)) Bool)

(assert (=> b!983677 (= res!658013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983678 () Bool)

(declare-fun res!658016 () Bool)

(assert (=> b!983678 (=> (not res!658016) (not e!554548))))

(declare-datatypes ((List!20600 0))(
  ( (Nil!20597) (Cons!20596 (h!21764 (_ BitVec 64)) (t!29355 List!20600)) )
))
(declare-fun arrayNoDuplicates!0 (array!61752 (_ BitVec 32) List!20600) Bool)

(assert (=> b!983678 (= res!658016 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20597))))

(declare-fun b!983679 () Bool)

(declare-fun res!658011 () Bool)

(assert (=> b!983679 (=> (not res!658011) (not e!554548))))

(assert (=> b!983679 (= res!658011 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!983680 () Bool)

(declare-fun e!554550 () Bool)

(assert (=> b!983680 (= e!554547 (and e!554550 mapRes!36320))))

(declare-fun condMapEmpty!36320 () Bool)

(declare-fun mapDefault!36320 () ValueCell!10949)

(assert (=> b!983680 (= condMapEmpty!36320 (= (arr!29728 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10949)) mapDefault!36320)))))

(declare-fun b!983681 () Bool)

(assert (=> b!983681 (= e!554550 tp_is_empty!22861)))

(declare-fun mapNonEmpty!36320 () Bool)

(declare-fun tp!68963 () Bool)

(assert (=> mapNonEmpty!36320 (= mapRes!36320 (and tp!68963 e!554546))))

(declare-fun mapRest!36320 () (Array (_ BitVec 32) ValueCell!10949))

(declare-fun mapKey!36320 () (_ BitVec 32))

(declare-fun mapValue!36320 () ValueCell!10949)

(assert (=> mapNonEmpty!36320 (= (arr!29728 _values!1278) (store mapRest!36320 mapKey!36320 mapValue!36320))))

(declare-fun b!983682 () Bool)

(assert (=> b!983682 (= e!554545 (not true))))

(declare-fun lt!436638 () tuple2!14726)

(declare-fun lt!436640 () tuple2!14726)

(declare-fun +!3034 (ListLongMap!13425 tuple2!14726) ListLongMap!13425)

(assert (=> b!983682 (= (+!3034 (+!3034 lt!436637 lt!436638) lt!436640) (+!3034 (+!3034 lt!436637 lt!436640) lt!436638))))

(assert (=> b!983682 (= lt!436640 (tuple2!14727 (select (arr!29729 _keys!1544) from!1932) lt!436641))))

(assert (=> b!983682 (= lt!436638 (tuple2!14727 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32648 0))(
  ( (Unit!32649) )
))
(declare-fun lt!436639 () Unit!32648)

(declare-fun addCommutativeForDiffKeys!641 (ListLongMap!13425 (_ BitVec 64) V!35465 (_ BitVec 64) V!35465) Unit!32648)

(assert (=> b!983682 (= lt!436639 (addCommutativeForDiffKeys!641 lt!436637 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29729 _keys!1544) from!1932) lt!436641))))

(assert (= (and start!84226 res!658017) b!983673))

(assert (= (and b!983673 res!658014) b!983677))

(assert (= (and b!983677 res!658013) b!983678))

(assert (= (and b!983678 res!658016) b!983674))

(assert (= (and b!983674 res!658018) b!983676))

(assert (= (and b!983676 res!658015) b!983679))

(assert (= (and b!983679 res!658011) b!983675))

(assert (= (and b!983675 res!658012) b!983682))

(assert (= (and b!983680 condMapEmpty!36320) mapIsEmpty!36320))

(assert (= (and b!983680 (not condMapEmpty!36320)) mapNonEmpty!36320))

(get-info :version)

(assert (= (and mapNonEmpty!36320 ((_ is ValueCellFull!10949) mapValue!36320)) b!983672))

(assert (= (and b!983680 ((_ is ValueCellFull!10949) mapDefault!36320)) b!983681))

(assert (= start!84226 b!983680))

(declare-fun b_lambda!14865 () Bool)

(assert (=> (not b_lambda!14865) (not b!983675)))

(declare-fun t!29353 () Bool)

(declare-fun tb!6605 () Bool)

(assert (=> (and start!84226 (= defaultEntry!1281 defaultEntry!1281) t!29353) tb!6605))

(declare-fun result!13207 () Bool)

(assert (=> tb!6605 (= result!13207 tp_is_empty!22861)))

(assert (=> b!983675 t!29353))

(declare-fun b_and!31721 () Bool)

(assert (= b_and!31719 (and (=> t!29353 result!13207) b_and!31721)))

(declare-fun m!911393 () Bool)

(assert (=> b!983678 m!911393))

(declare-fun m!911395 () Bool)

(assert (=> b!983676 m!911395))

(assert (=> b!983676 m!911395))

(declare-fun m!911397 () Bool)

(assert (=> b!983676 m!911397))

(declare-fun m!911399 () Bool)

(assert (=> b!983677 m!911399))

(assert (=> b!983682 m!911395))

(declare-fun m!911401 () Bool)

(assert (=> b!983682 m!911401))

(declare-fun m!911403 () Bool)

(assert (=> b!983682 m!911403))

(declare-fun m!911405 () Bool)

(assert (=> b!983682 m!911405))

(declare-fun m!911407 () Bool)

(assert (=> b!983682 m!911407))

(assert (=> b!983682 m!911401))

(assert (=> b!983682 m!911395))

(declare-fun m!911409 () Bool)

(assert (=> b!983682 m!911409))

(assert (=> b!983682 m!911405))

(declare-fun m!911411 () Bool)

(assert (=> mapNonEmpty!36320 m!911411))

(assert (=> b!983675 m!911395))

(declare-fun m!911413 () Bool)

(assert (=> b!983675 m!911413))

(declare-fun m!911415 () Bool)

(assert (=> b!983675 m!911415))

(declare-fun m!911417 () Bool)

(assert (=> b!983675 m!911417))

(assert (=> b!983675 m!911413))

(assert (=> b!983675 m!911417))

(declare-fun m!911419 () Bool)

(assert (=> b!983675 m!911419))

(declare-fun m!911421 () Bool)

(assert (=> start!84226 m!911421))

(declare-fun m!911423 () Bool)

(assert (=> start!84226 m!911423))

(declare-fun m!911425 () Bool)

(assert (=> start!84226 m!911425))

(check-sat (not start!84226) (not b!983675) (not b!983677) (not b_next!19813) tp_is_empty!22861 (not b!983678) (not b!983682) (not b_lambda!14865) (not mapNonEmpty!36320) b_and!31721 (not b!983676))
(check-sat b_and!31721 (not b_next!19813))
