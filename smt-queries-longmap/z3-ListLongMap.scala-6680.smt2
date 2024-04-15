; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84034 () Bool)

(assert start!84034)

(declare-fun b_free!19807 () Bool)

(declare-fun b_next!19807 () Bool)

(assert (=> start!84034 (= b_free!19807 (not b_next!19807))))

(declare-fun tp!68944 () Bool)

(declare-fun b_and!31671 () Bool)

(assert (=> start!84034 (= tp!68944 b_and!31671)))

(declare-fun b!982425 () Bool)

(declare-fun res!657490 () Bool)

(declare-fun e!553763 () Bool)

(assert (=> b!982425 (=> (not res!657490) (not e!553763))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35457 0))(
  ( (V!35458 (val!11478 Int)) )
))
(declare-datatypes ((ValueCell!10946 0))(
  ( (ValueCellFull!10946 (v!14039 V!35457)) (EmptyCell!10946) )
))
(declare-datatypes ((array!61634 0))(
  ( (array!61635 (arr!29675 (Array (_ BitVec 32) ValueCell!10946)) (size!30156 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61634)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61636 0))(
  ( (array!61637 (arr!29676 (Array (_ BitVec 32) (_ BitVec 64))) (size!30157 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61636)

(assert (=> b!982425 (= res!657490 (and (= (size!30156 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30157 _keys!1544) (size!30156 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982426 () Bool)

(declare-fun res!657489 () Bool)

(assert (=> b!982426 (=> (not res!657489) (not e!553763))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!982426 (= res!657489 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30157 _keys!1544))))))

(declare-fun b!982427 () Bool)

(declare-fun res!657487 () Bool)

(assert (=> b!982427 (=> (not res!657487) (not e!553763))))

(declare-datatypes ((List!20616 0))(
  ( (Nil!20613) (Cons!20612 (h!21774 (_ BitVec 64)) (t!29364 List!20616)) )
))
(declare-fun arrayNoDuplicates!0 (array!61636 (_ BitVec 32) List!20616) Bool)

(assert (=> b!982427 (= res!657487 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20613))))

(declare-fun mapIsEmpty!36311 () Bool)

(declare-fun mapRes!36311 () Bool)

(assert (=> mapIsEmpty!36311 mapRes!36311))

(declare-fun b!982428 () Bool)

(declare-fun res!657488 () Bool)

(assert (=> b!982428 (=> (not res!657488) (not e!553763))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982428 (= res!657488 (validKeyInArray!0 (select (arr!29676 _keys!1544) from!1932)))))

(declare-fun b!982429 () Bool)

(declare-fun res!657492 () Bool)

(assert (=> b!982429 (=> (not res!657492) (not e!553763))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61636 (_ BitVec 32)) Bool)

(assert (=> b!982429 (= res!657492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982430 () Bool)

(declare-fun e!553766 () Bool)

(declare-fun tp_is_empty!22855 () Bool)

(assert (=> b!982430 (= e!553766 tp_is_empty!22855)))

(declare-fun b!982431 () Bool)

(declare-fun e!553762 () Bool)

(assert (=> b!982431 (= e!553762 tp_is_empty!22855)))

(declare-fun res!657491 () Bool)

(assert (=> start!84034 (=> (not res!657491) (not e!553763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84034 (= res!657491 (validMask!0 mask!1948))))

(assert (=> start!84034 e!553763))

(assert (=> start!84034 true))

(assert (=> start!84034 tp_is_empty!22855))

(declare-fun e!553761 () Bool)

(declare-fun array_inv!22959 (array!61634) Bool)

(assert (=> start!84034 (and (array_inv!22959 _values!1278) e!553761)))

(assert (=> start!84034 tp!68944))

(declare-fun array_inv!22960 (array!61636) Bool)

(assert (=> start!84034 (array_inv!22960 _keys!1544)))

(declare-fun b!982432 () Bool)

(declare-fun res!657485 () Bool)

(assert (=> b!982432 (=> (not res!657485) (not e!553763))))

(assert (=> b!982432 (= res!657485 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982433 () Bool)

(declare-fun e!553764 () Bool)

(assert (=> b!982433 (= e!553763 e!553764)))

(declare-fun res!657486 () Bool)

(assert (=> b!982433 (=> (not res!657486) (not e!553764))))

(assert (=> b!982433 (= res!657486 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29676 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!435999 () V!35457)

(declare-fun get!15406 (ValueCell!10946 V!35457) V!35457)

(declare-fun dynLambda!1788 (Int (_ BitVec 64)) V!35457)

(assert (=> b!982433 (= lt!435999 (get!15406 (select (arr!29675 _values!1278) from!1932) (dynLambda!1788 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35457)

(declare-datatypes ((tuple2!14778 0))(
  ( (tuple2!14779 (_1!7400 (_ BitVec 64)) (_2!7400 V!35457)) )
))
(declare-datatypes ((List!20617 0))(
  ( (Nil!20614) (Cons!20613 (h!21775 tuple2!14778) (t!29365 List!20617)) )
))
(declare-datatypes ((ListLongMap!13465 0))(
  ( (ListLongMap!13466 (toList!6748 List!20617)) )
))
(declare-fun lt!435995 () ListLongMap!13465)

(declare-fun zeroValue!1220 () V!35457)

(declare-fun getCurrentListMapNoExtraKeys!3458 (array!61636 array!61634 (_ BitVec 32) (_ BitVec 32) V!35457 V!35457 (_ BitVec 32) Int) ListLongMap!13465)

(assert (=> b!982433 (= lt!435995 (getCurrentListMapNoExtraKeys!3458 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapNonEmpty!36311 () Bool)

(declare-fun tp!68945 () Bool)

(assert (=> mapNonEmpty!36311 (= mapRes!36311 (and tp!68945 e!553762))))

(declare-fun mapValue!36311 () ValueCell!10946)

(declare-fun mapRest!36311 () (Array (_ BitVec 32) ValueCell!10946))

(declare-fun mapKey!36311 () (_ BitVec 32))

(assert (=> mapNonEmpty!36311 (= (arr!29675 _values!1278) (store mapRest!36311 mapKey!36311 mapValue!36311))))

(declare-fun b!982434 () Bool)

(assert (=> b!982434 (= e!553764 (not true))))

(declare-fun lt!435998 () tuple2!14778)

(declare-fun lt!435997 () tuple2!14778)

(declare-fun +!3038 (ListLongMap!13465 tuple2!14778) ListLongMap!13465)

(assert (=> b!982434 (= (+!3038 (+!3038 lt!435995 lt!435998) lt!435997) (+!3038 (+!3038 lt!435995 lt!435997) lt!435998))))

(assert (=> b!982434 (= lt!435997 (tuple2!14779 (select (arr!29676 _keys!1544) from!1932) lt!435999))))

(assert (=> b!982434 (= lt!435998 (tuple2!14779 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32542 0))(
  ( (Unit!32543) )
))
(declare-fun lt!435996 () Unit!32542)

(declare-fun addCommutativeForDiffKeys!642 (ListLongMap!13465 (_ BitVec 64) V!35457 (_ BitVec 64) V!35457) Unit!32542)

(assert (=> b!982434 (= lt!435996 (addCommutativeForDiffKeys!642 lt!435995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29676 _keys!1544) from!1932) lt!435999))))

(declare-fun b!982435 () Bool)

(assert (=> b!982435 (= e!553761 (and e!553766 mapRes!36311))))

(declare-fun condMapEmpty!36311 () Bool)

(declare-fun mapDefault!36311 () ValueCell!10946)

(assert (=> b!982435 (= condMapEmpty!36311 (= (arr!29675 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10946)) mapDefault!36311)))))

(assert (= (and start!84034 res!657491) b!982425))

(assert (= (and b!982425 res!657490) b!982429))

(assert (= (and b!982429 res!657492) b!982427))

(assert (= (and b!982427 res!657487) b!982426))

(assert (= (and b!982426 res!657489) b!982428))

(assert (= (and b!982428 res!657488) b!982432))

(assert (= (and b!982432 res!657485) b!982433))

(assert (= (and b!982433 res!657486) b!982434))

(assert (= (and b!982435 condMapEmpty!36311) mapIsEmpty!36311))

(assert (= (and b!982435 (not condMapEmpty!36311)) mapNonEmpty!36311))

(get-info :version)

(assert (= (and mapNonEmpty!36311 ((_ is ValueCellFull!10946) mapValue!36311)) b!982431))

(assert (= (and b!982435 ((_ is ValueCellFull!10946) mapDefault!36311)) b!982430))

(assert (= start!84034 b!982435))

(declare-fun b_lambda!14827 () Bool)

(assert (=> (not b_lambda!14827) (not b!982433)))

(declare-fun t!29363 () Bool)

(declare-fun tb!6599 () Bool)

(assert (=> (and start!84034 (= defaultEntry!1281 defaultEntry!1281) t!29363) tb!6599))

(declare-fun result!13195 () Bool)

(assert (=> tb!6599 (= result!13195 tp_is_empty!22855)))

(assert (=> b!982433 t!29363))

(declare-fun b_and!31673 () Bool)

(assert (= b_and!31671 (and (=> t!29363 result!13195) b_and!31673)))

(declare-fun m!909239 () Bool)

(assert (=> mapNonEmpty!36311 m!909239))

(declare-fun m!909241 () Bool)

(assert (=> start!84034 m!909241))

(declare-fun m!909243 () Bool)

(assert (=> start!84034 m!909243))

(declare-fun m!909245 () Bool)

(assert (=> start!84034 m!909245))

(declare-fun m!909247 () Bool)

(assert (=> b!982428 m!909247))

(assert (=> b!982428 m!909247))

(declare-fun m!909249 () Bool)

(assert (=> b!982428 m!909249))

(assert (=> b!982434 m!909247))

(declare-fun m!909251 () Bool)

(assert (=> b!982434 m!909251))

(declare-fun m!909253 () Bool)

(assert (=> b!982434 m!909253))

(declare-fun m!909255 () Bool)

(assert (=> b!982434 m!909255))

(assert (=> b!982434 m!909255))

(declare-fun m!909257 () Bool)

(assert (=> b!982434 m!909257))

(assert (=> b!982434 m!909247))

(declare-fun m!909259 () Bool)

(assert (=> b!982434 m!909259))

(assert (=> b!982434 m!909251))

(assert (=> b!982433 m!909247))

(declare-fun m!909261 () Bool)

(assert (=> b!982433 m!909261))

(declare-fun m!909263 () Bool)

(assert (=> b!982433 m!909263))

(declare-fun m!909265 () Bool)

(assert (=> b!982433 m!909265))

(assert (=> b!982433 m!909261))

(assert (=> b!982433 m!909265))

(declare-fun m!909267 () Bool)

(assert (=> b!982433 m!909267))

(declare-fun m!909269 () Bool)

(assert (=> b!982429 m!909269))

(declare-fun m!909271 () Bool)

(assert (=> b!982427 m!909271))

(check-sat (not b!982427) (not mapNonEmpty!36311) (not b!982428) (not b_lambda!14827) (not b_next!19807) (not b!982429) (not b!982434) b_and!31673 (not start!84034) (not b!982433) tp_is_empty!22855)
(check-sat b_and!31673 (not b_next!19807))
