; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84064 () Bool)

(assert start!84064)

(declare-fun b_free!19837 () Bool)

(declare-fun b_next!19837 () Bool)

(assert (=> start!84064 (= b_free!19837 (not b_next!19837))))

(declare-fun tp!69035 () Bool)

(declare-fun b_and!31731 () Bool)

(assert (=> start!84064 (= tp!69035 b_and!31731)))

(declare-fun b!982950 () Bool)

(declare-fun res!657850 () Bool)

(declare-fun e!554033 () Bool)

(assert (=> b!982950 (=> (not res!657850) (not e!554033))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35497 0))(
  ( (V!35498 (val!11493 Int)) )
))
(declare-datatypes ((ValueCell!10961 0))(
  ( (ValueCellFull!10961 (v!14054 V!35497)) (EmptyCell!10961) )
))
(declare-datatypes ((array!61694 0))(
  ( (array!61695 (arr!29705 (Array (_ BitVec 32) ValueCell!10961)) (size!30186 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61694)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61696 0))(
  ( (array!61697 (arr!29706 (Array (_ BitVec 32) (_ BitVec 64))) (size!30187 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61696)

(assert (=> b!982950 (= res!657850 (and (= (size!30186 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30187 _keys!1544) (size!30186 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982951 () Bool)

(declare-fun e!554035 () Bool)

(declare-fun e!554034 () Bool)

(declare-fun mapRes!36356 () Bool)

(assert (=> b!982951 (= e!554035 (and e!554034 mapRes!36356))))

(declare-fun condMapEmpty!36356 () Bool)

(declare-fun mapDefault!36356 () ValueCell!10961)

(assert (=> b!982951 (= condMapEmpty!36356 (= (arr!29705 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10961)) mapDefault!36356)))))

(declare-fun b!982952 () Bool)

(declare-fun res!657849 () Bool)

(assert (=> b!982952 (=> (not res!657849) (not e!554033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61696 (_ BitVec 32)) Bool)

(assert (=> b!982952 (= res!657849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982953 () Bool)

(declare-fun e!554032 () Bool)

(assert (=> b!982953 (= e!554033 e!554032)))

(declare-fun res!657852 () Bool)

(assert (=> b!982953 (=> (not res!657852) (not e!554032))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!982953 (= res!657852 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29706 _keys!1544) from!1932))))))

(declare-fun lt!436224 () V!35497)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15428 (ValueCell!10961 V!35497) V!35497)

(declare-fun dynLambda!1800 (Int (_ BitVec 64)) V!35497)

(assert (=> b!982953 (= lt!436224 (get!15428 (select (arr!29705 _values!1278) from!1932) (dynLambda!1800 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35497)

(declare-datatypes ((tuple2!14804 0))(
  ( (tuple2!14805 (_1!7413 (_ BitVec 64)) (_2!7413 V!35497)) )
))
(declare-datatypes ((List!20640 0))(
  ( (Nil!20637) (Cons!20636 (h!21798 tuple2!14804) (t!29418 List!20640)) )
))
(declare-datatypes ((ListLongMap!13491 0))(
  ( (ListLongMap!13492 (toList!6761 List!20640)) )
))
(declare-fun lt!436222 () ListLongMap!13491)

(declare-fun zeroValue!1220 () V!35497)

(declare-fun getCurrentListMapNoExtraKeys!3470 (array!61696 array!61694 (_ BitVec 32) (_ BitVec 32) V!35497 V!35497 (_ BitVec 32) Int) ListLongMap!13491)

(assert (=> b!982953 (= lt!436222 (getCurrentListMapNoExtraKeys!3470 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982954 () Bool)

(declare-fun res!657851 () Bool)

(assert (=> b!982954 (=> (not res!657851) (not e!554033))))

(assert (=> b!982954 (= res!657851 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30187 _keys!1544))))))

(declare-fun b!982955 () Bool)

(declare-fun res!657845 () Bool)

(assert (=> b!982955 (=> (not res!657845) (not e!554033))))

(declare-datatypes ((List!20641 0))(
  ( (Nil!20638) (Cons!20637 (h!21799 (_ BitVec 64)) (t!29419 List!20641)) )
))
(declare-fun arrayNoDuplicates!0 (array!61696 (_ BitVec 32) List!20641) Bool)

(assert (=> b!982955 (= res!657845 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20638))))

(declare-fun b!982956 () Bool)

(declare-fun res!657846 () Bool)

(assert (=> b!982956 (=> (not res!657846) (not e!554033))))

(assert (=> b!982956 (= res!657846 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!657848 () Bool)

(assert (=> start!84064 (=> (not res!657848) (not e!554033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84064 (= res!657848 (validMask!0 mask!1948))))

(assert (=> start!84064 e!554033))

(assert (=> start!84064 true))

(declare-fun tp_is_empty!22885 () Bool)

(assert (=> start!84064 tp_is_empty!22885))

(declare-fun array_inv!22981 (array!61694) Bool)

(assert (=> start!84064 (and (array_inv!22981 _values!1278) e!554035)))

(assert (=> start!84064 tp!69035))

(declare-fun array_inv!22982 (array!61696) Bool)

(assert (=> start!84064 (array_inv!22982 _keys!1544)))

(declare-fun b!982957 () Bool)

(declare-fun e!554036 () Bool)

(assert (=> b!982957 (= e!554036 tp_is_empty!22885)))

(declare-fun mapIsEmpty!36356 () Bool)

(assert (=> mapIsEmpty!36356 mapRes!36356))

(declare-fun b!982958 () Bool)

(assert (=> b!982958 (= e!554032 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(declare-fun lt!436221 () tuple2!14804)

(declare-fun lt!436220 () tuple2!14804)

(declare-fun +!3048 (ListLongMap!13491 tuple2!14804) ListLongMap!13491)

(assert (=> b!982958 (= (+!3048 (+!3048 lt!436222 lt!436221) lt!436220) (+!3048 (+!3048 lt!436222 lt!436220) lt!436221))))

(assert (=> b!982958 (= lt!436220 (tuple2!14805 (select (arr!29706 _keys!1544) from!1932) lt!436224))))

(assert (=> b!982958 (= lt!436221 (tuple2!14805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32562 0))(
  ( (Unit!32563) )
))
(declare-fun lt!436223 () Unit!32562)

(declare-fun addCommutativeForDiffKeys!652 (ListLongMap!13491 (_ BitVec 64) V!35497 (_ BitVec 64) V!35497) Unit!32562)

(assert (=> b!982958 (= lt!436223 (addCommutativeForDiffKeys!652 lt!436222 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29706 _keys!1544) from!1932) lt!436224))))

(declare-fun mapNonEmpty!36356 () Bool)

(declare-fun tp!69034 () Bool)

(assert (=> mapNonEmpty!36356 (= mapRes!36356 (and tp!69034 e!554036))))

(declare-fun mapRest!36356 () (Array (_ BitVec 32) ValueCell!10961))

(declare-fun mapKey!36356 () (_ BitVec 32))

(declare-fun mapValue!36356 () ValueCell!10961)

(assert (=> mapNonEmpty!36356 (= (arr!29705 _values!1278) (store mapRest!36356 mapKey!36356 mapValue!36356))))

(declare-fun b!982959 () Bool)

(assert (=> b!982959 (= e!554034 tp_is_empty!22885)))

(declare-fun b!982960 () Bool)

(declare-fun res!657847 () Bool)

(assert (=> b!982960 (=> (not res!657847) (not e!554033))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982960 (= res!657847 (validKeyInArray!0 (select (arr!29706 _keys!1544) from!1932)))))

(assert (= (and start!84064 res!657848) b!982950))

(assert (= (and b!982950 res!657850) b!982952))

(assert (= (and b!982952 res!657849) b!982955))

(assert (= (and b!982955 res!657845) b!982954))

(assert (= (and b!982954 res!657851) b!982960))

(assert (= (and b!982960 res!657847) b!982956))

(assert (= (and b!982956 res!657846) b!982953))

(assert (= (and b!982953 res!657852) b!982958))

(assert (= (and b!982951 condMapEmpty!36356) mapIsEmpty!36356))

(assert (= (and b!982951 (not condMapEmpty!36356)) mapNonEmpty!36356))

(get-info :version)

(assert (= (and mapNonEmpty!36356 ((_ is ValueCellFull!10961) mapValue!36356)) b!982957))

(assert (= (and b!982951 ((_ is ValueCellFull!10961) mapDefault!36356)) b!982959))

(assert (= start!84064 b!982951))

(declare-fun b_lambda!14857 () Bool)

(assert (=> (not b_lambda!14857) (not b!982953)))

(declare-fun t!29417 () Bool)

(declare-fun tb!6629 () Bool)

(assert (=> (and start!84064 (= defaultEntry!1281 defaultEntry!1281) t!29417) tb!6629))

(declare-fun result!13255 () Bool)

(assert (=> tb!6629 (= result!13255 tp_is_empty!22885)))

(assert (=> b!982953 t!29417))

(declare-fun b_and!31733 () Bool)

(assert (= b_and!31731 (and (=> t!29417 result!13255) b_and!31733)))

(declare-fun m!909749 () Bool)

(assert (=> b!982958 m!909749))

(declare-fun m!909751 () Bool)

(assert (=> b!982958 m!909751))

(assert (=> b!982958 m!909749))

(declare-fun m!909753 () Bool)

(assert (=> b!982958 m!909753))

(assert (=> b!982958 m!909751))

(declare-fun m!909755 () Bool)

(assert (=> b!982958 m!909755))

(declare-fun m!909757 () Bool)

(assert (=> b!982958 m!909757))

(declare-fun m!909759 () Bool)

(assert (=> b!982958 m!909759))

(assert (=> b!982958 m!909757))

(declare-fun m!909761 () Bool)

(assert (=> start!84064 m!909761))

(declare-fun m!909763 () Bool)

(assert (=> start!84064 m!909763))

(declare-fun m!909765 () Bool)

(assert (=> start!84064 m!909765))

(assert (=> b!982953 m!909749))

(declare-fun m!909767 () Bool)

(assert (=> b!982953 m!909767))

(declare-fun m!909769 () Bool)

(assert (=> b!982953 m!909769))

(declare-fun m!909771 () Bool)

(assert (=> b!982953 m!909771))

(assert (=> b!982953 m!909767))

(assert (=> b!982953 m!909771))

(declare-fun m!909773 () Bool)

(assert (=> b!982953 m!909773))

(declare-fun m!909775 () Bool)

(assert (=> b!982955 m!909775))

(assert (=> b!982960 m!909749))

(assert (=> b!982960 m!909749))

(declare-fun m!909777 () Bool)

(assert (=> b!982960 m!909777))

(declare-fun m!909779 () Bool)

(assert (=> b!982952 m!909779))

(declare-fun m!909781 () Bool)

(assert (=> mapNonEmpty!36356 m!909781))

(check-sat (not b!982955) (not b!982953) (not b!982960) (not b_lambda!14857) (not b_next!19837) (not mapNonEmpty!36356) (not start!84064) (not b!982958) tp_is_empty!22885 b_and!31733 (not b!982952))
(check-sat b_and!31733 (not b_next!19837))
