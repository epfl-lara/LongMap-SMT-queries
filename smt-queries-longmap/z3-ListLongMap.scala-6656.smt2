; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83910 () Bool)

(assert start!83910)

(declare-fun b_free!19719 () Bool)

(declare-fun b_next!19719 () Bool)

(assert (=> start!83910 (= b_free!19719 (not b_next!19719))))

(declare-fun tp!68599 () Bool)

(declare-fun b_and!31527 () Bool)

(assert (=> start!83910 (= tp!68599 b_and!31527)))

(declare-fun b!980626 () Bool)

(declare-fun res!656278 () Bool)

(declare-fun e!552726 () Bool)

(assert (=> b!980626 (=> (not res!656278) (not e!552726))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61433 0))(
  ( (array!61434 (arr!29574 (Array (_ BitVec 32) (_ BitVec 64))) (size!30053 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61433)

(assert (=> b!980626 (= res!656278 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30053 _keys!1544))))))

(declare-fun b!980627 () Bool)

(declare-fun res!656285 () Bool)

(assert (=> b!980627 (=> (not res!656285) (not e!552726))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35267 0))(
  ( (V!35268 (val!11407 Int)) )
))
(declare-datatypes ((ValueCell!10875 0))(
  ( (ValueCellFull!10875 (v!13969 V!35267)) (EmptyCell!10875) )
))
(declare-datatypes ((array!61435 0))(
  ( (array!61436 (arr!29575 (Array (_ BitVec 32) ValueCell!10875)) (size!30054 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61435)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980627 (= res!656285 (and (= (size!30054 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30053 _keys!1544) (size!30054 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980628 () Bool)

(declare-fun res!656280 () Bool)

(assert (=> b!980628 (=> (not res!656280) (not e!552726))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980628 (= res!656280 (validKeyInArray!0 (select (arr!29574 _keys!1544) from!1932)))))

(declare-fun res!656281 () Bool)

(assert (=> start!83910 (=> (not res!656281) (not e!552726))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83910 (= res!656281 (validMask!0 mask!1948))))

(assert (=> start!83910 e!552726))

(assert (=> start!83910 true))

(declare-fun tp_is_empty!22713 () Bool)

(assert (=> start!83910 tp_is_empty!22713))

(declare-fun e!552722 () Bool)

(declare-fun array_inv!22863 (array!61435) Bool)

(assert (=> start!83910 (and (array_inv!22863 _values!1278) e!552722)))

(assert (=> start!83910 tp!68599))

(declare-fun array_inv!22864 (array!61433) Bool)

(assert (=> start!83910 (array_inv!22864 _keys!1544)))

(declare-fun b!980629 () Bool)

(declare-fun e!552725 () Bool)

(assert (=> b!980629 (= e!552726 (not e!552725))))

(declare-fun res!656284 () Bool)

(assert (=> b!980629 (=> res!656284 e!552725)))

(assert (=> b!980629 (= res!656284 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29574 _keys!1544) from!1932)))))

(declare-datatypes ((tuple2!14632 0))(
  ( (tuple2!14633 (_1!7327 (_ BitVec 64)) (_2!7327 V!35267)) )
))
(declare-datatypes ((List!20498 0))(
  ( (Nil!20495) (Cons!20494 (h!21656 tuple2!14632) (t!29173 List!20498)) )
))
(declare-datatypes ((ListLongMap!13329 0))(
  ( (ListLongMap!13330 (toList!6680 List!20498)) )
))
(declare-fun lt!435476 () ListLongMap!13329)

(declare-fun lt!435470 () tuple2!14632)

(declare-fun lt!435478 () tuple2!14632)

(declare-fun lt!435475 () ListLongMap!13329)

(declare-fun +!2985 (ListLongMap!13329 tuple2!14632) ListLongMap!13329)

(assert (=> b!980629 (= (+!2985 lt!435476 lt!435478) (+!2985 lt!435475 lt!435470))))

(declare-fun lt!435472 () ListLongMap!13329)

(assert (=> b!980629 (= lt!435475 (+!2985 lt!435472 lt!435478))))

(declare-fun lt!435473 () V!35267)

(assert (=> b!980629 (= lt!435478 (tuple2!14633 (select (arr!29574 _keys!1544) from!1932) lt!435473))))

(assert (=> b!980629 (= lt!435476 (+!2985 lt!435472 lt!435470))))

(declare-fun minValue!1220 () V!35267)

(assert (=> b!980629 (= lt!435470 (tuple2!14633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32609 0))(
  ( (Unit!32610) )
))
(declare-fun lt!435479 () Unit!32609)

(declare-fun addCommutativeForDiffKeys!613 (ListLongMap!13329 (_ BitVec 64) V!35267 (_ BitVec 64) V!35267) Unit!32609)

(assert (=> b!980629 (= lt!435479 (addCommutativeForDiffKeys!613 lt!435472 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29574 _keys!1544) from!1932) lt!435473))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15334 (ValueCell!10875 V!35267) V!35267)

(declare-fun dynLambda!1769 (Int (_ BitVec 64)) V!35267)

(assert (=> b!980629 (= lt!435473 (get!15334 (select (arr!29575 _values!1278) from!1932) (dynLambda!1769 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!435471 () ListLongMap!13329)

(declare-fun lt!435474 () tuple2!14632)

(assert (=> b!980629 (= lt!435472 (+!2985 lt!435471 lt!435474))))

(declare-fun zeroValue!1220 () V!35267)

(assert (=> b!980629 (= lt!435474 (tuple2!14633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3383 (array!61433 array!61435 (_ BitVec 32) (_ BitVec 32) V!35267 V!35267 (_ BitVec 32) Int) ListLongMap!13329)

(assert (=> b!980629 (= lt!435471 (getCurrentListMapNoExtraKeys!3383 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!980630 () Bool)

(assert (=> b!980630 (= e!552725 true)))

(assert (=> b!980630 (= lt!435475 (+!2985 (+!2985 lt!435471 lt!435478) lt!435474))))

(declare-fun lt!435477 () Unit!32609)

(assert (=> b!980630 (= lt!435477 (addCommutativeForDiffKeys!613 lt!435471 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29574 _keys!1544) from!1932) lt!435473))))

(declare-fun b!980631 () Bool)

(declare-fun e!552721 () Bool)

(assert (=> b!980631 (= e!552721 tp_is_empty!22713)))

(declare-fun b!980632 () Bool)

(declare-fun e!552723 () Bool)

(assert (=> b!980632 (= e!552723 tp_is_empty!22713)))

(declare-fun b!980633 () Bool)

(declare-fun res!656283 () Bool)

(assert (=> b!980633 (=> (not res!656283) (not e!552726))))

(assert (=> b!980633 (= res!656283 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!980634 () Bool)

(declare-fun res!656279 () Bool)

(assert (=> b!980634 (=> (not res!656279) (not e!552726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61433 (_ BitVec 32)) Bool)

(assert (=> b!980634 (= res!656279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36098 () Bool)

(declare-fun mapRes!36098 () Bool)

(declare-fun tp!68598 () Bool)

(assert (=> mapNonEmpty!36098 (= mapRes!36098 (and tp!68598 e!552721))))

(declare-fun mapKey!36098 () (_ BitVec 32))

(declare-fun mapRest!36098 () (Array (_ BitVec 32) ValueCell!10875))

(declare-fun mapValue!36098 () ValueCell!10875)

(assert (=> mapNonEmpty!36098 (= (arr!29575 _values!1278) (store mapRest!36098 mapKey!36098 mapValue!36098))))

(declare-fun b!980635 () Bool)

(assert (=> b!980635 (= e!552722 (and e!552723 mapRes!36098))))

(declare-fun condMapEmpty!36098 () Bool)

(declare-fun mapDefault!36098 () ValueCell!10875)

(assert (=> b!980635 (= condMapEmpty!36098 (= (arr!29575 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10875)) mapDefault!36098)))))

(declare-fun b!980636 () Bool)

(declare-fun res!656282 () Bool)

(assert (=> b!980636 (=> (not res!656282) (not e!552726))))

(declare-datatypes ((List!20499 0))(
  ( (Nil!20496) (Cons!20495 (h!21657 (_ BitVec 64)) (t!29174 List!20499)) )
))
(declare-fun arrayNoDuplicates!0 (array!61433 (_ BitVec 32) List!20499) Bool)

(assert (=> b!980636 (= res!656282 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20496))))

(declare-fun mapIsEmpty!36098 () Bool)

(assert (=> mapIsEmpty!36098 mapRes!36098))

(assert (= (and start!83910 res!656281) b!980627))

(assert (= (and b!980627 res!656285) b!980634))

(assert (= (and b!980634 res!656279) b!980636))

(assert (= (and b!980636 res!656282) b!980626))

(assert (= (and b!980626 res!656278) b!980628))

(assert (= (and b!980628 res!656280) b!980633))

(assert (= (and b!980633 res!656283) b!980629))

(assert (= (and b!980629 (not res!656284)) b!980630))

(assert (= (and b!980635 condMapEmpty!36098) mapIsEmpty!36098))

(assert (= (and b!980635 (not condMapEmpty!36098)) mapNonEmpty!36098))

(get-info :version)

(assert (= (and mapNonEmpty!36098 ((_ is ValueCellFull!10875) mapValue!36098)) b!980631))

(assert (= (and b!980635 ((_ is ValueCellFull!10875) mapDefault!36098)) b!980632))

(assert (= start!83910 b!980635))

(declare-fun b_lambda!14763 () Bool)

(assert (=> (not b_lambda!14763) (not b!980629)))

(declare-fun t!29172 () Bool)

(declare-fun tb!6525 () Bool)

(assert (=> (and start!83910 (= defaultEntry!1281 defaultEntry!1281) t!29172) tb!6525))

(declare-fun result!13039 () Bool)

(assert (=> tb!6525 (= result!13039 tp_is_empty!22713)))

(assert (=> b!980629 t!29172))

(declare-fun b_and!31529 () Bool)

(assert (= b_and!31527 (and (=> t!29172 result!13039) b_and!31529)))

(declare-fun m!908173 () Bool)

(assert (=> b!980636 m!908173))

(declare-fun m!908175 () Bool)

(assert (=> start!83910 m!908175))

(declare-fun m!908177 () Bool)

(assert (=> start!83910 m!908177))

(declare-fun m!908179 () Bool)

(assert (=> start!83910 m!908179))

(declare-fun m!908181 () Bool)

(assert (=> b!980630 m!908181))

(assert (=> b!980630 m!908181))

(declare-fun m!908183 () Bool)

(assert (=> b!980630 m!908183))

(declare-fun m!908185 () Bool)

(assert (=> b!980630 m!908185))

(assert (=> b!980630 m!908185))

(declare-fun m!908187 () Bool)

(assert (=> b!980630 m!908187))

(declare-fun m!908189 () Bool)

(assert (=> b!980629 m!908189))

(declare-fun m!908191 () Bool)

(assert (=> b!980629 m!908191))

(declare-fun m!908193 () Bool)

(assert (=> b!980629 m!908193))

(assert (=> b!980629 m!908185))

(declare-fun m!908195 () Bool)

(assert (=> b!980629 m!908195))

(declare-fun m!908197 () Bool)

(assert (=> b!980629 m!908197))

(declare-fun m!908199 () Bool)

(assert (=> b!980629 m!908199))

(declare-fun m!908201 () Bool)

(assert (=> b!980629 m!908201))

(assert (=> b!980629 m!908185))

(declare-fun m!908203 () Bool)

(assert (=> b!980629 m!908203))

(declare-fun m!908205 () Bool)

(assert (=> b!980629 m!908205))

(assert (=> b!980629 m!908189))

(assert (=> b!980629 m!908205))

(declare-fun m!908207 () Bool)

(assert (=> b!980629 m!908207))

(declare-fun m!908209 () Bool)

(assert (=> mapNonEmpty!36098 m!908209))

(declare-fun m!908211 () Bool)

(assert (=> b!980634 m!908211))

(assert (=> b!980628 m!908185))

(assert (=> b!980628 m!908185))

(declare-fun m!908213 () Bool)

(assert (=> b!980628 m!908213))

(check-sat (not start!83910) tp_is_empty!22713 (not b_lambda!14763) (not mapNonEmpty!36098) (not b!980630) (not b_next!19719) (not b!980628) (not b!980636) b_and!31529 (not b!980634) (not b!980629))
(check-sat b_and!31529 (not b_next!19719))
