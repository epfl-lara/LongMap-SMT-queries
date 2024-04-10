; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84550 () Bool)

(assert start!84550)

(declare-fun b_free!20031 () Bool)

(declare-fun b_next!20031 () Bool)

(assert (=> start!84550 (= b_free!20031 (not b_next!20031))))

(declare-fun tp!69881 () Bool)

(declare-fun b_and!32131 () Bool)

(assert (=> start!84550 (= tp!69881 b_and!32131)))

(declare-fun b!988872 () Bool)

(declare-fun res!661381 () Bool)

(declare-fun e!557606 () Bool)

(assert (=> b!988872 (=> (not res!661381) (not e!557606))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62455 0))(
  ( (array!62456 (arr!30081 (Array (_ BitVec 32) (_ BitVec 64))) (size!30560 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62455)

(assert (=> b!988872 (= res!661381 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30560 _keys!1544))))))

(declare-fun b!988873 () Bool)

(declare-fun e!557604 () Bool)

(assert (=> b!988873 (= e!557604 (not true))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35979 0))(
  ( (V!35980 (val!11674 Int)) )
))
(declare-fun minValue!1220 () V!35979)

(declare-datatypes ((ValueCell!11142 0))(
  ( (ValueCellFull!11142 (v!14241 V!35979)) (EmptyCell!11142) )
))
(declare-datatypes ((array!62457 0))(
  ( (array!62458 (arr!30082 (Array (_ BitVec 32) ValueCell!11142)) (size!30561 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62457)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35979)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!14876 0))(
  ( (tuple2!14877 (_1!7449 (_ BitVec 64)) (_2!7449 V!35979)) )
))
(declare-datatypes ((List!20806 0))(
  ( (Nil!20803) (Cons!20802 (h!21964 tuple2!14876) (t!29749 List!20806)) )
))
(declare-datatypes ((ListLongMap!13573 0))(
  ( (ListLongMap!13574 (toList!6802 List!20806)) )
))
(declare-fun lt!438608 () ListLongMap!13573)

(declare-fun getCurrentListMap!3861 (array!62455 array!62457 (_ BitVec 32) (_ BitVec 32) V!35979 V!35979 (_ BitVec 32) Int) ListLongMap!13573)

(assert (=> b!988873 (= lt!438608 (getCurrentListMap!3861 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!438609 () ListLongMap!13573)

(declare-fun lt!438611 () tuple2!14876)

(declare-fun lt!438612 () tuple2!14876)

(declare-fun +!3080 (ListLongMap!13573 tuple2!14876) ListLongMap!13573)

(assert (=> b!988873 (= (+!3080 (+!3080 lt!438609 lt!438611) lt!438612) (+!3080 (+!3080 lt!438609 lt!438612) lt!438611))))

(declare-fun lt!438613 () V!35979)

(assert (=> b!988873 (= lt!438612 (tuple2!14877 (select (arr!30081 _keys!1544) from!1932) lt!438613))))

(assert (=> b!988873 (= lt!438611 (tuple2!14877 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32815 0))(
  ( (Unit!32816) )
))
(declare-fun lt!438610 () Unit!32815)

(declare-fun addCommutativeForDiffKeys!703 (ListLongMap!13573 (_ BitVec 64) V!35979 (_ BitVec 64) V!35979) Unit!32815)

(assert (=> b!988873 (= lt!438610 (addCommutativeForDiffKeys!703 lt!438609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30081 _keys!1544) from!1932) lt!438613))))

(declare-fun b!988874 () Bool)

(declare-fun e!557608 () Bool)

(declare-fun tp_is_empty!23247 () Bool)

(assert (=> b!988874 (= e!557608 tp_is_empty!23247)))

(declare-fun b!988875 () Bool)

(declare-fun res!661382 () Bool)

(assert (=> b!988875 (=> (not res!661382) (not e!557606))))

(assert (=> b!988875 (= res!661382 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!36912 () Bool)

(declare-fun mapRes!36912 () Bool)

(assert (=> mapIsEmpty!36912 mapRes!36912))

(declare-fun b!988876 () Bool)

(assert (=> b!988876 (= e!557606 e!557604)))

(declare-fun res!661377 () Bool)

(assert (=> b!988876 (=> (not res!661377) (not e!557604))))

(assert (=> b!988876 (= res!661377 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30081 _keys!1544) from!1932))))))

(declare-fun get!15611 (ValueCell!11142 V!35979) V!35979)

(declare-fun dynLambda!1863 (Int (_ BitVec 64)) V!35979)

(assert (=> b!988876 (= lt!438613 (get!15611 (select (arr!30082 _values!1278) from!1932) (dynLambda!1863 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!3493 (array!62455 array!62457 (_ BitVec 32) (_ BitVec 32) V!35979 V!35979 (_ BitVec 32) Int) ListLongMap!13573)

(assert (=> b!988876 (= lt!438609 (getCurrentListMapNoExtraKeys!3493 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!661379 () Bool)

(assert (=> start!84550 (=> (not res!661379) (not e!557606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84550 (= res!661379 (validMask!0 mask!1948))))

(assert (=> start!84550 e!557606))

(assert (=> start!84550 true))

(assert (=> start!84550 tp_is_empty!23247))

(declare-fun e!557603 () Bool)

(declare-fun array_inv!23241 (array!62457) Bool)

(assert (=> start!84550 (and (array_inv!23241 _values!1278) e!557603)))

(assert (=> start!84550 tp!69881))

(declare-fun array_inv!23242 (array!62455) Bool)

(assert (=> start!84550 (array_inv!23242 _keys!1544)))

(declare-fun b!988877 () Bool)

(assert (=> b!988877 (= e!557603 (and e!557608 mapRes!36912))))

(declare-fun condMapEmpty!36912 () Bool)

(declare-fun mapDefault!36912 () ValueCell!11142)

(assert (=> b!988877 (= condMapEmpty!36912 (= (arr!30082 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11142)) mapDefault!36912)))))

(declare-fun b!988878 () Bool)

(declare-fun res!661378 () Bool)

(assert (=> b!988878 (=> (not res!661378) (not e!557606))))

(assert (=> b!988878 (= res!661378 (and (= (size!30561 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30560 _keys!1544) (size!30561 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!988879 () Bool)

(declare-fun res!661380 () Bool)

(assert (=> b!988879 (=> (not res!661380) (not e!557606))))

(declare-datatypes ((List!20807 0))(
  ( (Nil!20804) (Cons!20803 (h!21965 (_ BitVec 64)) (t!29750 List!20807)) )
))
(declare-fun arrayNoDuplicates!0 (array!62455 (_ BitVec 32) List!20807) Bool)

(assert (=> b!988879 (= res!661380 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20804))))

(declare-fun mapNonEmpty!36912 () Bool)

(declare-fun tp!69880 () Bool)

(declare-fun e!557607 () Bool)

(assert (=> mapNonEmpty!36912 (= mapRes!36912 (and tp!69880 e!557607))))

(declare-fun mapRest!36912 () (Array (_ BitVec 32) ValueCell!11142))

(declare-fun mapKey!36912 () (_ BitVec 32))

(declare-fun mapValue!36912 () ValueCell!11142)

(assert (=> mapNonEmpty!36912 (= (arr!30082 _values!1278) (store mapRest!36912 mapKey!36912 mapValue!36912))))

(declare-fun b!988880 () Bool)

(declare-fun res!661376 () Bool)

(assert (=> b!988880 (=> (not res!661376) (not e!557606))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62455 (_ BitVec 32)) Bool)

(assert (=> b!988880 (= res!661376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!988881 () Bool)

(assert (=> b!988881 (= e!557607 tp_is_empty!23247)))

(declare-fun b!988882 () Bool)

(declare-fun res!661383 () Bool)

(assert (=> b!988882 (=> (not res!661383) (not e!557606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!988882 (= res!661383 (validKeyInArray!0 (select (arr!30081 _keys!1544) from!1932)))))

(assert (= (and start!84550 res!661379) b!988878))

(assert (= (and b!988878 res!661378) b!988880))

(assert (= (and b!988880 res!661376) b!988879))

(assert (= (and b!988879 res!661380) b!988872))

(assert (= (and b!988872 res!661381) b!988882))

(assert (= (and b!988882 res!661383) b!988875))

(assert (= (and b!988875 res!661382) b!988876))

(assert (= (and b!988876 res!661377) b!988873))

(assert (= (and b!988877 condMapEmpty!36912) mapIsEmpty!36912))

(assert (= (and b!988877 (not condMapEmpty!36912)) mapNonEmpty!36912))

(get-info :version)

(assert (= (and mapNonEmpty!36912 ((_ is ValueCellFull!11142) mapValue!36912)) b!988881))

(assert (= (and b!988877 ((_ is ValueCellFull!11142) mapDefault!36912)) b!988874))

(assert (= start!84550 b!988877))

(declare-fun b_lambda!15087 () Bool)

(assert (=> (not b_lambda!15087) (not b!988876)))

(declare-fun t!29748 () Bool)

(declare-fun tb!6793 () Bool)

(assert (=> (and start!84550 (= defaultEntry!1281 defaultEntry!1281) t!29748) tb!6793))

(declare-fun result!13583 () Bool)

(assert (=> tb!6793 (= result!13583 tp_is_empty!23247)))

(assert (=> b!988876 t!29748))

(declare-fun b_and!32133 () Bool)

(assert (= b_and!32131 (and (=> t!29748 result!13583) b_and!32133)))

(declare-fun m!915979 () Bool)

(assert (=> b!988873 m!915979))

(declare-fun m!915981 () Bool)

(assert (=> b!988873 m!915981))

(assert (=> b!988873 m!915979))

(declare-fun m!915983 () Bool)

(assert (=> b!988873 m!915983))

(declare-fun m!915985 () Bool)

(assert (=> b!988873 m!915985))

(declare-fun m!915987 () Bool)

(assert (=> b!988873 m!915987))

(declare-fun m!915989 () Bool)

(assert (=> b!988873 m!915989))

(declare-fun m!915991 () Bool)

(assert (=> b!988873 m!915991))

(assert (=> b!988873 m!915987))

(assert (=> b!988873 m!915983))

(declare-fun m!915993 () Bool)

(assert (=> b!988880 m!915993))

(declare-fun m!915995 () Bool)

(assert (=> start!84550 m!915995))

(declare-fun m!915997 () Bool)

(assert (=> start!84550 m!915997))

(declare-fun m!915999 () Bool)

(assert (=> start!84550 m!915999))

(declare-fun m!916001 () Bool)

(assert (=> mapNonEmpty!36912 m!916001))

(assert (=> b!988882 m!915979))

(assert (=> b!988882 m!915979))

(declare-fun m!916003 () Bool)

(assert (=> b!988882 m!916003))

(assert (=> b!988876 m!915979))

(declare-fun m!916005 () Bool)

(assert (=> b!988876 m!916005))

(declare-fun m!916007 () Bool)

(assert (=> b!988876 m!916007))

(declare-fun m!916009 () Bool)

(assert (=> b!988876 m!916009))

(assert (=> b!988876 m!916005))

(assert (=> b!988876 m!916009))

(declare-fun m!916011 () Bool)

(assert (=> b!988876 m!916011))

(declare-fun m!916013 () Bool)

(assert (=> b!988879 m!916013))

(check-sat (not start!84550) (not b!988882) (not b!988876) (not b!988873) (not mapNonEmpty!36912) (not b!988880) (not b!988879) b_and!32133 (not b_next!20031) tp_is_empty!23247 (not b_lambda!15087))
(check-sat b_and!32133 (not b_next!20031))
