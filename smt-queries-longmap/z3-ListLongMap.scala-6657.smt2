; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83916 () Bool)

(assert start!83916)

(declare-fun b_free!19725 () Bool)

(declare-fun b_next!19725 () Bool)

(assert (=> start!83916 (= b_free!19725 (not b_next!19725))))

(declare-fun tp!68616 () Bool)

(declare-fun b_and!31539 () Bool)

(assert (=> start!83916 (= tp!68616 b_and!31539)))

(declare-fun b!980731 () Bool)

(declare-fun e!552776 () Bool)

(declare-fun tp_is_empty!22719 () Bool)

(assert (=> b!980731 (= e!552776 tp_is_empty!22719)))

(declare-fun b!980732 () Bool)

(declare-fun e!552780 () Bool)

(assert (=> b!980732 (= e!552780 tp_is_empty!22719)))

(declare-fun b!980733 () Bool)

(declare-fun res!656356 () Bool)

(declare-fun e!552775 () Bool)

(assert (=> b!980733 (=> (not res!656356) (not e!552775))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35275 0))(
  ( (V!35276 (val!11410 Int)) )
))
(declare-datatypes ((ValueCell!10878 0))(
  ( (ValueCellFull!10878 (v!13972 V!35275)) (EmptyCell!10878) )
))
(declare-datatypes ((array!61445 0))(
  ( (array!61446 (arr!29580 (Array (_ BitVec 32) ValueCell!10878)) (size!30059 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61445)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61447 0))(
  ( (array!61448 (arr!29581 (Array (_ BitVec 32) (_ BitVec 64))) (size!30060 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61447)

(assert (=> b!980733 (= res!656356 (and (= (size!30059 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30060 _keys!1544) (size!30059 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36107 () Bool)

(declare-fun mapRes!36107 () Bool)

(declare-fun tp!68617 () Bool)

(assert (=> mapNonEmpty!36107 (= mapRes!36107 (and tp!68617 e!552780))))

(declare-fun mapKey!36107 () (_ BitVec 32))

(declare-fun mapRest!36107 () (Array (_ BitVec 32) ValueCell!10878))

(declare-fun mapValue!36107 () ValueCell!10878)

(assert (=> mapNonEmpty!36107 (= (arr!29580 _values!1278) (store mapRest!36107 mapKey!36107 mapValue!36107))))

(declare-fun b!980734 () Bool)

(declare-fun res!656352 () Bool)

(assert (=> b!980734 (=> (not res!656352) (not e!552775))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!980734 (= res!656352 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30060 _keys!1544))))))

(declare-fun b!980735 () Bool)

(declare-fun res!656355 () Bool)

(assert (=> b!980735 (=> (not res!656355) (not e!552775))))

(assert (=> b!980735 (= res!656355 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!656354 () Bool)

(assert (=> start!83916 (=> (not res!656354) (not e!552775))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83916 (= res!656354 (validMask!0 mask!1948))))

(assert (=> start!83916 e!552775))

(assert (=> start!83916 true))

(assert (=> start!83916 tp_is_empty!22719))

(declare-fun e!552777 () Bool)

(declare-fun array_inv!22869 (array!61445) Bool)

(assert (=> start!83916 (and (array_inv!22869 _values!1278) e!552777)))

(assert (=> start!83916 tp!68616))

(declare-fun array_inv!22870 (array!61447) Bool)

(assert (=> start!83916 (array_inv!22870 _keys!1544)))

(declare-fun b!980736 () Bool)

(declare-fun res!656353 () Bool)

(assert (=> b!980736 (=> (not res!656353) (not e!552775))))

(declare-datatypes ((List!20503 0))(
  ( (Nil!20500) (Cons!20499 (h!21661 (_ BitVec 64)) (t!29184 List!20503)) )
))
(declare-fun arrayNoDuplicates!0 (array!61447 (_ BitVec 32) List!20503) Bool)

(assert (=> b!980736 (= res!656353 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20500))))

(declare-fun b!980737 () Bool)

(assert (=> b!980737 (= e!552777 (and e!552776 mapRes!36107))))

(declare-fun condMapEmpty!36107 () Bool)

(declare-fun mapDefault!36107 () ValueCell!10878)

(assert (=> b!980737 (= condMapEmpty!36107 (= (arr!29580 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10878)) mapDefault!36107)))))

(declare-fun b!980738 () Bool)

(declare-fun res!656350 () Bool)

(assert (=> b!980738 (=> (not res!656350) (not e!552775))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980738 (= res!656350 (validKeyInArray!0 (select (arr!29581 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!36107 () Bool)

(assert (=> mapIsEmpty!36107 mapRes!36107))

(declare-fun b!980739 () Bool)

(declare-fun e!552778 () Bool)

(assert (=> b!980739 (= e!552778 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!14636 0))(
  ( (tuple2!14637 (_1!7329 (_ BitVec 64)) (_2!7329 V!35275)) )
))
(declare-datatypes ((List!20504 0))(
  ( (Nil!20501) (Cons!20500 (h!21662 tuple2!14636) (t!29185 List!20504)) )
))
(declare-datatypes ((ListLongMap!13333 0))(
  ( (ListLongMap!13334 (toList!6682 List!20504)) )
))
(declare-fun lt!435563 () ListLongMap!13333)

(declare-fun lt!435569 () ListLongMap!13333)

(declare-fun lt!435561 () tuple2!14636)

(declare-fun lt!435568 () tuple2!14636)

(declare-fun +!2987 (ListLongMap!13333 tuple2!14636) ListLongMap!13333)

(assert (=> b!980739 (= lt!435563 (+!2987 (+!2987 lt!435569 lt!435561) lt!435568))))

(declare-fun lt!435565 () V!35275)

(declare-datatypes ((Unit!32613 0))(
  ( (Unit!32614) )
))
(declare-fun lt!435560 () Unit!32613)

(declare-fun zeroValue!1220 () V!35275)

(declare-fun addCommutativeForDiffKeys!615 (ListLongMap!13333 (_ BitVec 64) V!35275 (_ BitVec 64) V!35275) Unit!32613)

(assert (=> b!980739 (= lt!435560 (addCommutativeForDiffKeys!615 lt!435569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29581 _keys!1544) from!1932) lt!435565))))

(declare-fun b!980740 () Bool)

(declare-fun res!656351 () Bool)

(assert (=> b!980740 (=> (not res!656351) (not e!552775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61447 (_ BitVec 32)) Bool)

(assert (=> b!980740 (= res!656351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980741 () Bool)

(assert (=> b!980741 (= e!552775 (not e!552778))))

(declare-fun res!656357 () Bool)

(assert (=> b!980741 (=> res!656357 e!552778)))

(assert (=> b!980741 (= res!656357 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29581 _keys!1544) from!1932)))))

(declare-fun lt!435567 () ListLongMap!13333)

(declare-fun lt!435564 () tuple2!14636)

(assert (=> b!980741 (= (+!2987 lt!435567 lt!435561) (+!2987 lt!435563 lt!435564))))

(declare-fun lt!435562 () ListLongMap!13333)

(assert (=> b!980741 (= lt!435563 (+!2987 lt!435562 lt!435561))))

(assert (=> b!980741 (= lt!435561 (tuple2!14637 (select (arr!29581 _keys!1544) from!1932) lt!435565))))

(assert (=> b!980741 (= lt!435567 (+!2987 lt!435562 lt!435564))))

(declare-fun minValue!1220 () V!35275)

(assert (=> b!980741 (= lt!435564 (tuple2!14637 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!435566 () Unit!32613)

(assert (=> b!980741 (= lt!435566 (addCommutativeForDiffKeys!615 lt!435562 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29581 _keys!1544) from!1932) lt!435565))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15337 (ValueCell!10878 V!35275) V!35275)

(declare-fun dynLambda!1770 (Int (_ BitVec 64)) V!35275)

(assert (=> b!980741 (= lt!435565 (get!15337 (select (arr!29580 _values!1278) from!1932) (dynLambda!1770 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!980741 (= lt!435562 (+!2987 lt!435569 lt!435568))))

(assert (=> b!980741 (= lt!435568 (tuple2!14637 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3384 (array!61447 array!61445 (_ BitVec 32) (_ BitVec 32) V!35275 V!35275 (_ BitVec 32) Int) ListLongMap!13333)

(assert (=> b!980741 (= lt!435569 (getCurrentListMapNoExtraKeys!3384 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(assert (= (and start!83916 res!656354) b!980733))

(assert (= (and b!980733 res!656356) b!980740))

(assert (= (and b!980740 res!656351) b!980736))

(assert (= (and b!980736 res!656353) b!980734))

(assert (= (and b!980734 res!656352) b!980738))

(assert (= (and b!980738 res!656350) b!980735))

(assert (= (and b!980735 res!656355) b!980741))

(assert (= (and b!980741 (not res!656357)) b!980739))

(assert (= (and b!980737 condMapEmpty!36107) mapIsEmpty!36107))

(assert (= (and b!980737 (not condMapEmpty!36107)) mapNonEmpty!36107))

(get-info :version)

(assert (= (and mapNonEmpty!36107 ((_ is ValueCellFull!10878) mapValue!36107)) b!980732))

(assert (= (and b!980737 ((_ is ValueCellFull!10878) mapDefault!36107)) b!980731))

(assert (= start!83916 b!980737))

(declare-fun b_lambda!14769 () Bool)

(assert (=> (not b_lambda!14769) (not b!980741)))

(declare-fun t!29183 () Bool)

(declare-fun tb!6531 () Bool)

(assert (=> (and start!83916 (= defaultEntry!1281 defaultEntry!1281) t!29183) tb!6531))

(declare-fun result!13051 () Bool)

(assert (=> tb!6531 (= result!13051 tp_is_empty!22719)))

(assert (=> b!980741 t!29183))

(declare-fun b_and!31541 () Bool)

(assert (= b_and!31539 (and (=> t!29183 result!13051) b_and!31541)))

(declare-fun m!908299 () Bool)

(assert (=> b!980738 m!908299))

(assert (=> b!980738 m!908299))

(declare-fun m!908301 () Bool)

(assert (=> b!980738 m!908301))

(declare-fun m!908303 () Bool)

(assert (=> b!980740 m!908303))

(declare-fun m!908305 () Bool)

(assert (=> b!980741 m!908305))

(assert (=> b!980741 m!908299))

(declare-fun m!908307 () Bool)

(assert (=> b!980741 m!908307))

(declare-fun m!908309 () Bool)

(assert (=> b!980741 m!908309))

(declare-fun m!908311 () Bool)

(assert (=> b!980741 m!908311))

(assert (=> b!980741 m!908299))

(declare-fun m!908313 () Bool)

(assert (=> b!980741 m!908313))

(declare-fun m!908315 () Bool)

(assert (=> b!980741 m!908315))

(declare-fun m!908317 () Bool)

(assert (=> b!980741 m!908317))

(declare-fun m!908319 () Bool)

(assert (=> b!980741 m!908319))

(declare-fun m!908321 () Bool)

(assert (=> b!980741 m!908321))

(assert (=> b!980741 m!908307))

(assert (=> b!980741 m!908321))

(declare-fun m!908323 () Bool)

(assert (=> b!980741 m!908323))

(declare-fun m!908325 () Bool)

(assert (=> start!83916 m!908325))

(declare-fun m!908327 () Bool)

(assert (=> start!83916 m!908327))

(declare-fun m!908329 () Bool)

(assert (=> start!83916 m!908329))

(declare-fun m!908331 () Bool)

(assert (=> b!980739 m!908331))

(assert (=> b!980739 m!908331))

(declare-fun m!908333 () Bool)

(assert (=> b!980739 m!908333))

(assert (=> b!980739 m!908299))

(assert (=> b!980739 m!908299))

(declare-fun m!908335 () Bool)

(assert (=> b!980739 m!908335))

(declare-fun m!908337 () Bool)

(assert (=> mapNonEmpty!36107 m!908337))

(declare-fun m!908339 () Bool)

(assert (=> b!980736 m!908339))

(check-sat (not mapNonEmpty!36107) (not b!980741) (not b_lambda!14769) b_and!31541 tp_is_empty!22719 (not b!980736) (not start!83916) (not b!980739) (not b!980740) (not b_next!19725) (not b!980738))
(check-sat b_and!31541 (not b_next!19725))
