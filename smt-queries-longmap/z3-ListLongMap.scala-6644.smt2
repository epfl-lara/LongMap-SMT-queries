; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83838 () Bool)

(assert start!83838)

(declare-fun b_free!19647 () Bool)

(declare-fun b_next!19647 () Bool)

(assert (=> start!83838 (= b_free!19647 (not b_next!19647))))

(declare-fun tp!68383 () Bool)

(declare-fun b_and!31383 () Bool)

(assert (=> start!83838 (= tp!68383 b_and!31383)))

(declare-fun b!979366 () Bool)

(declare-fun res!655421 () Bool)

(declare-fun e!552077 () Bool)

(assert (=> b!979366 (=> (not res!655421) (not e!552077))))

(declare-datatypes ((array!61299 0))(
  ( (array!61300 (arr!29507 (Array (_ BitVec 32) (_ BitVec 64))) (size!29986 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61299)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61299 (_ BitVec 32)) Bool)

(assert (=> b!979366 (= res!655421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!979367 () Bool)

(declare-fun res!655415 () Bool)

(assert (=> b!979367 (=> (not res!655415) (not e!552077))))

(declare-datatypes ((V!35171 0))(
  ( (V!35172 (val!11371 Int)) )
))
(declare-datatypes ((ValueCell!10839 0))(
  ( (ValueCellFull!10839 (v!13933 V!35171)) (EmptyCell!10839) )
))
(declare-datatypes ((array!61301 0))(
  ( (array!61302 (arr!29508 (Array (_ BitVec 32) ValueCell!10839)) (size!29987 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61301)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!979367 (= res!655415 (and (= (size!29987 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29986 _keys!1544) (size!29987 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!979368 () Bool)

(declare-fun e!552075 () Bool)

(declare-fun tp_is_empty!22641 () Bool)

(assert (=> b!979368 (= e!552075 tp_is_empty!22641)))

(declare-fun b!979369 () Bool)

(declare-fun e!552073 () Bool)

(assert (=> b!979369 (= e!552077 (not e!552073))))

(declare-fun res!655417 () Bool)

(assert (=> b!979369 (=> res!655417 e!552073)))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!979369 (= res!655417 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29507 _keys!1544) from!1932)))))

(declare-datatypes ((tuple2!14588 0))(
  ( (tuple2!14589 (_1!7305 (_ BitVec 64)) (_2!7305 V!35171)) )
))
(declare-datatypes ((List!20457 0))(
  ( (Nil!20454) (Cons!20453 (h!21615 tuple2!14588) (t!29060 List!20457)) )
))
(declare-datatypes ((ListLongMap!13285 0))(
  ( (ListLongMap!13286 (toList!6658 List!20457)) )
))
(declare-fun lt!434393 () ListLongMap!13285)

(declare-fun lt!434396 () tuple2!14588)

(declare-fun lt!434392 () ListLongMap!13285)

(declare-fun lt!434397 () tuple2!14588)

(declare-fun +!2963 (ListLongMap!13285 tuple2!14588) ListLongMap!13285)

(assert (=> b!979369 (= (+!2963 lt!434393 lt!434397) (+!2963 lt!434392 lt!434396))))

(declare-fun lt!434394 () ListLongMap!13285)

(assert (=> b!979369 (= lt!434392 (+!2963 lt!434394 lt!434397))))

(declare-fun lt!434395 () V!35171)

(assert (=> b!979369 (= lt!434397 (tuple2!14589 (select (arr!29507 _keys!1544) from!1932) lt!434395))))

(assert (=> b!979369 (= lt!434393 (+!2963 lt!434394 lt!434396))))

(declare-fun minValue!1220 () V!35171)

(assert (=> b!979369 (= lt!434396 (tuple2!14589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32565 0))(
  ( (Unit!32566) )
))
(declare-fun lt!434391 () Unit!32565)

(declare-fun addCommutativeForDiffKeys!591 (ListLongMap!13285 (_ BitVec 64) V!35171 (_ BitVec 64) V!35171) Unit!32565)

(assert (=> b!979369 (= lt!434391 (addCommutativeForDiffKeys!591 lt!434394 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29507 _keys!1544) from!1932) lt!434395))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15291 (ValueCell!10839 V!35171) V!35171)

(declare-fun dynLambda!1750 (Int (_ BitVec 64)) V!35171)

(assert (=> b!979369 (= lt!434395 (get!15291 (select (arr!29508 _values!1278) from!1932) (dynLambda!1750 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!434398 () ListLongMap!13285)

(declare-fun lt!434390 () tuple2!14588)

(assert (=> b!979369 (= lt!434394 (+!2963 lt!434398 lt!434390))))

(declare-fun zeroValue!1220 () V!35171)

(assert (=> b!979369 (= lt!434390 (tuple2!14589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3364 (array!61299 array!61301 (_ BitVec 32) (_ BitVec 32) V!35171 V!35171 (_ BitVec 32) Int) ListLongMap!13285)

(assert (=> b!979369 (= lt!434398 (getCurrentListMapNoExtraKeys!3364 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!655419 () Bool)

(assert (=> start!83838 (=> (not res!655419) (not e!552077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83838 (= res!655419 (validMask!0 mask!1948))))

(assert (=> start!83838 e!552077))

(assert (=> start!83838 true))

(assert (=> start!83838 tp_is_empty!22641))

(declare-fun e!552074 () Bool)

(declare-fun array_inv!22815 (array!61301) Bool)

(assert (=> start!83838 (and (array_inv!22815 _values!1278) e!552074)))

(assert (=> start!83838 tp!68383))

(declare-fun array_inv!22816 (array!61299) Bool)

(assert (=> start!83838 (array_inv!22816 _keys!1544)))

(declare-fun b!979370 () Bool)

(declare-fun res!655418 () Bool)

(assert (=> b!979370 (=> (not res!655418) (not e!552077))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979370 (= res!655418 (validKeyInArray!0 (select (arr!29507 _keys!1544) from!1932)))))

(declare-fun b!979371 () Bool)

(declare-fun res!655420 () Bool)

(assert (=> b!979371 (=> (not res!655420) (not e!552077))))

(assert (=> b!979371 (= res!655420 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!35990 () Bool)

(declare-fun mapRes!35990 () Bool)

(declare-fun tp!68382 () Bool)

(declare-fun e!552076 () Bool)

(assert (=> mapNonEmpty!35990 (= mapRes!35990 (and tp!68382 e!552076))))

(declare-fun mapKey!35990 () (_ BitVec 32))

(declare-fun mapRest!35990 () (Array (_ BitVec 32) ValueCell!10839))

(declare-fun mapValue!35990 () ValueCell!10839)

(assert (=> mapNonEmpty!35990 (= (arr!29508 _values!1278) (store mapRest!35990 mapKey!35990 mapValue!35990))))

(declare-fun b!979372 () Bool)

(declare-fun res!655414 () Bool)

(assert (=> b!979372 (=> (not res!655414) (not e!552077))))

(declare-datatypes ((List!20458 0))(
  ( (Nil!20455) (Cons!20454 (h!21616 (_ BitVec 64)) (t!29061 List!20458)) )
))
(declare-fun arrayNoDuplicates!0 (array!61299 (_ BitVec 32) List!20458) Bool)

(assert (=> b!979372 (= res!655414 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20455))))

(declare-fun b!979373 () Bool)

(assert (=> b!979373 (= e!552073 true)))

(assert (=> b!979373 (= lt!434392 (+!2963 (+!2963 lt!434398 lt!434397) lt!434390))))

(declare-fun lt!434399 () Unit!32565)

(assert (=> b!979373 (= lt!434399 (addCommutativeForDiffKeys!591 lt!434398 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29507 _keys!1544) from!1932) lt!434395))))

(declare-fun b!979374 () Bool)

(declare-fun res!655416 () Bool)

(assert (=> b!979374 (=> (not res!655416) (not e!552077))))

(assert (=> b!979374 (= res!655416 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29986 _keys!1544))))))

(declare-fun b!979375 () Bool)

(assert (=> b!979375 (= e!552076 tp_is_empty!22641)))

(declare-fun b!979376 () Bool)

(assert (=> b!979376 (= e!552074 (and e!552075 mapRes!35990))))

(declare-fun condMapEmpty!35990 () Bool)

(declare-fun mapDefault!35990 () ValueCell!10839)

(assert (=> b!979376 (= condMapEmpty!35990 (= (arr!29508 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10839)) mapDefault!35990)))))

(declare-fun mapIsEmpty!35990 () Bool)

(assert (=> mapIsEmpty!35990 mapRes!35990))

(assert (= (and start!83838 res!655419) b!979367))

(assert (= (and b!979367 res!655415) b!979366))

(assert (= (and b!979366 res!655421) b!979372))

(assert (= (and b!979372 res!655414) b!979374))

(assert (= (and b!979374 res!655416) b!979370))

(assert (= (and b!979370 res!655418) b!979371))

(assert (= (and b!979371 res!655420) b!979369))

(assert (= (and b!979369 (not res!655417)) b!979373))

(assert (= (and b!979376 condMapEmpty!35990) mapIsEmpty!35990))

(assert (= (and b!979376 (not condMapEmpty!35990)) mapNonEmpty!35990))

(get-info :version)

(assert (= (and mapNonEmpty!35990 ((_ is ValueCellFull!10839) mapValue!35990)) b!979375))

(assert (= (and b!979376 ((_ is ValueCellFull!10839) mapDefault!35990)) b!979368))

(assert (= start!83838 b!979376))

(declare-fun b_lambda!14691 () Bool)

(assert (=> (not b_lambda!14691) (not b!979369)))

(declare-fun t!29059 () Bool)

(declare-fun tb!6453 () Bool)

(assert (=> (and start!83838 (= defaultEntry!1281 defaultEntry!1281) t!29059) tb!6453))

(declare-fun result!12895 () Bool)

(assert (=> tb!6453 (= result!12895 tp_is_empty!22641)))

(assert (=> b!979369 t!29059))

(declare-fun b_and!31385 () Bool)

(assert (= b_and!31383 (and (=> t!29059 result!12895) b_and!31385)))

(declare-fun m!906661 () Bool)

(assert (=> b!979373 m!906661))

(assert (=> b!979373 m!906661))

(declare-fun m!906663 () Bool)

(assert (=> b!979373 m!906663))

(declare-fun m!906665 () Bool)

(assert (=> b!979373 m!906665))

(assert (=> b!979373 m!906665))

(declare-fun m!906667 () Bool)

(assert (=> b!979373 m!906667))

(declare-fun m!906669 () Bool)

(assert (=> b!979369 m!906669))

(assert (=> b!979369 m!906665))

(declare-fun m!906671 () Bool)

(assert (=> b!979369 m!906671))

(declare-fun m!906673 () Bool)

(assert (=> b!979369 m!906673))

(declare-fun m!906675 () Bool)

(assert (=> b!979369 m!906675))

(declare-fun m!906677 () Bool)

(assert (=> b!979369 m!906677))

(declare-fun m!906679 () Bool)

(assert (=> b!979369 m!906679))

(assert (=> b!979369 m!906665))

(declare-fun m!906681 () Bool)

(assert (=> b!979369 m!906681))

(declare-fun m!906683 () Bool)

(assert (=> b!979369 m!906683))

(declare-fun m!906685 () Bool)

(assert (=> b!979369 m!906685))

(assert (=> b!979369 m!906671))

(assert (=> b!979369 m!906685))

(declare-fun m!906687 () Bool)

(assert (=> b!979369 m!906687))

(declare-fun m!906689 () Bool)

(assert (=> start!83838 m!906689))

(declare-fun m!906691 () Bool)

(assert (=> start!83838 m!906691))

(declare-fun m!906693 () Bool)

(assert (=> start!83838 m!906693))

(declare-fun m!906695 () Bool)

(assert (=> b!979366 m!906695))

(declare-fun m!906697 () Bool)

(assert (=> b!979372 m!906697))

(assert (=> b!979370 m!906665))

(assert (=> b!979370 m!906665))

(declare-fun m!906699 () Bool)

(assert (=> b!979370 m!906699))

(declare-fun m!906701 () Bool)

(assert (=> mapNonEmpty!35990 m!906701))

(check-sat (not b!979366) tp_is_empty!22641 b_and!31385 (not b_lambda!14691) (not b!979370) (not b!979372) (not b!979373) (not b_next!19647) (not b!979369) (not mapNonEmpty!35990) (not start!83838))
(check-sat b_and!31385 (not b_next!19647))
