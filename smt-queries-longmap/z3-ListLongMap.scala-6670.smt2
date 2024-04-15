; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83974 () Bool)

(assert start!83974)

(declare-fun b_free!19747 () Bool)

(declare-fun b_next!19747 () Bool)

(assert (=> start!83974 (= b_free!19747 (not b_next!19747))))

(declare-fun tp!68765 () Bool)

(declare-fun b_and!31551 () Bool)

(assert (=> start!83974 (= tp!68765 b_and!31551)))

(declare-fun b!981375 () Bool)

(declare-fun res!656766 () Bool)

(declare-fun e!553223 () Bool)

(assert (=> b!981375 (=> (not res!656766) (not e!553223))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981375 (= res!656766 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!981376 () Bool)

(declare-fun res!656767 () Bool)

(assert (=> b!981376 (=> (not res!656767) (not e!553223))))

(declare-datatypes ((V!35377 0))(
  ( (V!35378 (val!11448 Int)) )
))
(declare-datatypes ((ValueCell!10916 0))(
  ( (ValueCellFull!10916 (v!14009 V!35377)) (EmptyCell!10916) )
))
(declare-datatypes ((array!61520 0))(
  ( (array!61521 (arr!29618 (Array (_ BitVec 32) ValueCell!10916)) (size!30099 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61520)

(declare-datatypes ((array!61522 0))(
  ( (array!61523 (arr!29619 (Array (_ BitVec 32) (_ BitVec 64))) (size!30100 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61522)

(declare-fun mask!1948 () (_ BitVec 32))

(assert (=> b!981376 (= res!656767 (and (= (size!30099 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30100 _keys!1544) (size!30099 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981377 () Bool)

(declare-fun res!656772 () Bool)

(assert (=> b!981377 (=> (not res!656772) (not e!553223))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!981377 (= res!656772 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30100 _keys!1544))))))

(declare-fun b!981378 () Bool)

(declare-fun res!656765 () Bool)

(assert (=> b!981378 (=> (not res!656765) (not e!553223))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981378 (= res!656765 (validKeyInArray!0 (select (arr!29619 _keys!1544) from!1932)))))

(declare-fun b!981379 () Bool)

(declare-fun e!553221 () Bool)

(declare-fun tp_is_empty!22795 () Bool)

(assert (=> b!981379 (= e!553221 tp_is_empty!22795)))

(declare-fun b!981380 () Bool)

(declare-fun res!656771 () Bool)

(assert (=> b!981380 (=> (not res!656771) (not e!553223))))

(declare-datatypes ((List!20569 0))(
  ( (Nil!20566) (Cons!20565 (h!21727 (_ BitVec 64)) (t!29257 List!20569)) )
))
(declare-fun arrayNoDuplicates!0 (array!61522 (_ BitVec 32) List!20569) Bool)

(assert (=> b!981380 (= res!656771 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20566))))

(declare-fun mapIsEmpty!36221 () Bool)

(declare-fun mapRes!36221 () Bool)

(assert (=> mapIsEmpty!36221 mapRes!36221))

(declare-fun res!656770 () Bool)

(assert (=> start!83974 (=> (not res!656770) (not e!553223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83974 (= res!656770 (validMask!0 mask!1948))))

(assert (=> start!83974 e!553223))

(assert (=> start!83974 true))

(assert (=> start!83974 tp_is_empty!22795))

(declare-fun e!553225 () Bool)

(declare-fun array_inv!22921 (array!61520) Bool)

(assert (=> start!83974 (and (array_inv!22921 _values!1278) e!553225)))

(assert (=> start!83974 tp!68765))

(declare-fun array_inv!22922 (array!61522) Bool)

(assert (=> start!83974 (array_inv!22922 _keys!1544)))

(declare-fun b!981381 () Bool)

(declare-fun e!553226 () Bool)

(assert (=> b!981381 (= e!553226 (not true))))

(declare-datatypes ((tuple2!14728 0))(
  ( (tuple2!14729 (_1!7375 (_ BitVec 64)) (_2!7375 V!35377)) )
))
(declare-datatypes ((List!20570 0))(
  ( (Nil!20567) (Cons!20566 (h!21728 tuple2!14728) (t!29258 List!20570)) )
))
(declare-datatypes ((ListLongMap!13415 0))(
  ( (ListLongMap!13416 (toList!6723 List!20570)) )
))
(declare-fun lt!435547 () ListLongMap!13415)

(declare-fun lt!435549 () tuple2!14728)

(declare-fun lt!435548 () tuple2!14728)

(declare-fun +!3020 (ListLongMap!13415 tuple2!14728) ListLongMap!13415)

(assert (=> b!981381 (= (+!3020 (+!3020 lt!435547 lt!435549) lt!435548) (+!3020 (+!3020 lt!435547 lt!435548) lt!435549))))

(declare-fun lt!435546 () V!35377)

(assert (=> b!981381 (= lt!435548 (tuple2!14729 (select (arr!29619 _keys!1544) from!1932) lt!435546))))

(declare-fun zeroValue!1220 () V!35377)

(assert (=> b!981381 (= lt!435549 (tuple2!14729 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32506 0))(
  ( (Unit!32507) )
))
(declare-fun lt!435545 () Unit!32506)

(declare-fun addCommutativeForDiffKeys!624 (ListLongMap!13415 (_ BitVec 64) V!35377 (_ BitVec 64) V!35377) Unit!32506)

(assert (=> b!981381 (= lt!435545 (addCommutativeForDiffKeys!624 lt!435547 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29619 _keys!1544) from!1932) lt!435546))))

(declare-fun b!981382 () Bool)

(declare-fun res!656769 () Bool)

(assert (=> b!981382 (=> (not res!656769) (not e!553223))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61522 (_ BitVec 32)) Bool)

(assert (=> b!981382 (= res!656769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981383 () Bool)

(assert (=> b!981383 (= e!553223 e!553226)))

(declare-fun res!656768 () Bool)

(assert (=> b!981383 (=> (not res!656768) (not e!553226))))

(assert (=> b!981383 (= res!656768 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29619 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15364 (ValueCell!10916 V!35377) V!35377)

(declare-fun dynLambda!1766 (Int (_ BitVec 64)) V!35377)

(assert (=> b!981383 (= lt!435546 (get!15364 (select (arr!29618 _values!1278) from!1932) (dynLambda!1766 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35377)

(declare-fun getCurrentListMapNoExtraKeys!3436 (array!61522 array!61520 (_ BitVec 32) (_ BitVec 32) V!35377 V!35377 (_ BitVec 32) Int) ListLongMap!13415)

(assert (=> b!981383 (= lt!435547 (getCurrentListMapNoExtraKeys!3436 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!981384 () Bool)

(declare-fun e!553222 () Bool)

(assert (=> b!981384 (= e!553225 (and e!553222 mapRes!36221))))

(declare-fun condMapEmpty!36221 () Bool)

(declare-fun mapDefault!36221 () ValueCell!10916)

(assert (=> b!981384 (= condMapEmpty!36221 (= (arr!29618 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10916)) mapDefault!36221)))))

(declare-fun mapNonEmpty!36221 () Bool)

(declare-fun tp!68764 () Bool)

(assert (=> mapNonEmpty!36221 (= mapRes!36221 (and tp!68764 e!553221))))

(declare-fun mapKey!36221 () (_ BitVec 32))

(declare-fun mapValue!36221 () ValueCell!10916)

(declare-fun mapRest!36221 () (Array (_ BitVec 32) ValueCell!10916))

(assert (=> mapNonEmpty!36221 (= (arr!29618 _values!1278) (store mapRest!36221 mapKey!36221 mapValue!36221))))

(declare-fun b!981385 () Bool)

(assert (=> b!981385 (= e!553222 tp_is_empty!22795)))

(assert (= (and start!83974 res!656770) b!981376))

(assert (= (and b!981376 res!656767) b!981382))

(assert (= (and b!981382 res!656769) b!981380))

(assert (= (and b!981380 res!656771) b!981377))

(assert (= (and b!981377 res!656772) b!981378))

(assert (= (and b!981378 res!656765) b!981375))

(assert (= (and b!981375 res!656766) b!981383))

(assert (= (and b!981383 res!656768) b!981381))

(assert (= (and b!981384 condMapEmpty!36221) mapIsEmpty!36221))

(assert (= (and b!981384 (not condMapEmpty!36221)) mapNonEmpty!36221))

(get-info :version)

(assert (= (and mapNonEmpty!36221 ((_ is ValueCellFull!10916) mapValue!36221)) b!981379))

(assert (= (and b!981384 ((_ is ValueCellFull!10916) mapDefault!36221)) b!981385))

(assert (= start!83974 b!981384))

(declare-fun b_lambda!14767 () Bool)

(assert (=> (not b_lambda!14767) (not b!981383)))

(declare-fun t!29256 () Bool)

(declare-fun tb!6539 () Bool)

(assert (=> (and start!83974 (= defaultEntry!1281 defaultEntry!1281) t!29256) tb!6539))

(declare-fun result!13075 () Bool)

(assert (=> tb!6539 (= result!13075 tp_is_empty!22795)))

(assert (=> b!981383 t!29256))

(declare-fun b_and!31553 () Bool)

(assert (= b_and!31551 (and (=> t!29256 result!13075) b_and!31553)))

(declare-fun m!908219 () Bool)

(assert (=> b!981381 m!908219))

(declare-fun m!908221 () Bool)

(assert (=> b!981381 m!908221))

(declare-fun m!908223 () Bool)

(assert (=> b!981381 m!908223))

(declare-fun m!908225 () Bool)

(assert (=> b!981381 m!908225))

(assert (=> b!981381 m!908223))

(declare-fun m!908227 () Bool)

(assert (=> b!981381 m!908227))

(assert (=> b!981381 m!908227))

(declare-fun m!908229 () Bool)

(assert (=> b!981381 m!908229))

(assert (=> b!981381 m!908219))

(declare-fun m!908231 () Bool)

(assert (=> start!83974 m!908231))

(declare-fun m!908233 () Bool)

(assert (=> start!83974 m!908233))

(declare-fun m!908235 () Bool)

(assert (=> start!83974 m!908235))

(declare-fun m!908237 () Bool)

(assert (=> mapNonEmpty!36221 m!908237))

(declare-fun m!908239 () Bool)

(assert (=> b!981382 m!908239))

(declare-fun m!908241 () Bool)

(assert (=> b!981380 m!908241))

(assert (=> b!981383 m!908223))

(declare-fun m!908243 () Bool)

(assert (=> b!981383 m!908243))

(declare-fun m!908245 () Bool)

(assert (=> b!981383 m!908245))

(declare-fun m!908247 () Bool)

(assert (=> b!981383 m!908247))

(assert (=> b!981383 m!908243))

(assert (=> b!981383 m!908247))

(declare-fun m!908249 () Bool)

(assert (=> b!981383 m!908249))

(assert (=> b!981378 m!908223))

(assert (=> b!981378 m!908223))

(declare-fun m!908251 () Bool)

(assert (=> b!981378 m!908251))

(check-sat (not b!981381) b_and!31553 (not start!83974) (not b!981383) (not b!981380) (not b!981382) (not b_next!19747) (not b!981378) (not mapNonEmpty!36221) tp_is_empty!22795 (not b_lambda!14767))
(check-sat b_and!31553 (not b_next!19747))
