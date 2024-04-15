; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77664 () Bool)

(assert start!77664)

(declare-fun b_free!16267 () Bool)

(declare-fun b_next!16267 () Bool)

(assert (=> start!77664 (= b_free!16267 (not b_next!16267))))

(declare-fun tp!57064 () Bool)

(declare-fun b_and!26661 () Bool)

(assert (=> start!77664 (= tp!57064 b_and!26661)))

(declare-fun mapIsEmpty!29740 () Bool)

(declare-fun mapRes!29740 () Bool)

(assert (=> mapIsEmpty!29740 mapRes!29740))

(declare-fun b!905746 () Bool)

(declare-fun res!611284 () Bool)

(declare-fun e!507550 () Bool)

(assert (=> b!905746 (=> (not res!611284) (not e!507550))))

(declare-datatypes ((V!29879 0))(
  ( (V!29880 (val!9393 Int)) )
))
(declare-datatypes ((ValueCell!8861 0))(
  ( (ValueCellFull!8861 (v!11897 V!29879)) (EmptyCell!8861) )
))
(declare-datatypes ((array!53391 0))(
  ( (array!53392 (arr!25655 (Array (_ BitVec 32) ValueCell!8861)) (size!26116 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53391)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53393 0))(
  ( (array!53394 (arr!25656 (Array (_ BitVec 32) (_ BitVec 64))) (size!26117 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53393)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!905746 (= res!611284 (and (= (size!26116 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26117 _keys!1386) (size!26116 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!905747 () Bool)

(declare-fun res!611283 () Bool)

(declare-fun e!507556 () Bool)

(assert (=> b!905747 (=> (not res!611283) (not e!507556))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905747 (= res!611283 (inRange!0 i!717 mask!1756))))

(declare-fun b!905748 () Bool)

(assert (=> b!905748 (= e!507550 e!507556)))

(declare-fun res!611281 () Bool)

(assert (=> b!905748 (=> (not res!611281) (not e!507556))))

(declare-datatypes ((tuple2!12242 0))(
  ( (tuple2!12243 (_1!6132 (_ BitVec 64)) (_2!6132 V!29879)) )
))
(declare-datatypes ((List!18035 0))(
  ( (Nil!18032) (Cons!18031 (h!19177 tuple2!12242) (t!25465 List!18035)) )
))
(declare-datatypes ((ListLongMap!10929 0))(
  ( (ListLongMap!10930 (toList!5480 List!18035)) )
))
(declare-fun lt!408519 () ListLongMap!10929)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4488 (ListLongMap!10929 (_ BitVec 64)) Bool)

(assert (=> b!905748 (= res!611281 (contains!4488 lt!408519 k0!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun minValue!1094 () V!29879)

(declare-fun zeroValue!1094 () V!29879)

(declare-fun getCurrentListMap!2692 (array!53393 array!53391 (_ BitVec 32) (_ BitVec 32) V!29879 V!29879 (_ BitVec 32) Int) ListLongMap!10929)

(assert (=> b!905748 (= lt!408519 (getCurrentListMap!2692 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!905749 () Bool)

(declare-fun e!507553 () Bool)

(assert (=> b!905749 (= e!507556 (not e!507553))))

(declare-fun res!611286 () Bool)

(assert (=> b!905749 (=> res!611286 e!507553)))

(assert (=> b!905749 (= res!611286 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26117 _keys!1386))))))

(declare-fun lt!408518 () V!29879)

(declare-fun get!13490 (ValueCell!8861 V!29879) V!29879)

(declare-fun dynLambda!1335 (Int (_ BitVec 64)) V!29879)

(assert (=> b!905749 (= lt!408518 (get!13490 (select (arr!25655 _values!1152) i!717) (dynLambda!1335 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53393 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905749 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30664 0))(
  ( (Unit!30665) )
))
(declare-fun lt!408516 () Unit!30664)

(declare-fun lemmaKeyInListMapIsInArray!211 (array!53393 array!53391 (_ BitVec 32) (_ BitVec 32) V!29879 V!29879 (_ BitVec 64) Int) Unit!30664)

(assert (=> b!905749 (= lt!408516 (lemmaKeyInListMapIsInArray!211 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun mapNonEmpty!29740 () Bool)

(declare-fun tp!57063 () Bool)

(declare-fun e!507555 () Bool)

(assert (=> mapNonEmpty!29740 (= mapRes!29740 (and tp!57063 e!507555))))

(declare-fun mapKey!29740 () (_ BitVec 32))

(declare-fun mapRest!29740 () (Array (_ BitVec 32) ValueCell!8861))

(declare-fun mapValue!29740 () ValueCell!8861)

(assert (=> mapNonEmpty!29740 (= (arr!25655 _values!1152) (store mapRest!29740 mapKey!29740 mapValue!29740))))

(declare-fun b!905750 () Bool)

(declare-fun res!611280 () Bool)

(assert (=> b!905750 (=> (not res!611280) (not e!507550))))

(declare-datatypes ((List!18036 0))(
  ( (Nil!18033) (Cons!18032 (h!19178 (_ BitVec 64)) (t!25466 List!18036)) )
))
(declare-fun arrayNoDuplicates!0 (array!53393 (_ BitVec 32) List!18036) Bool)

(assert (=> b!905750 (= res!611280 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18033))))

(declare-fun b!905751 () Bool)

(declare-fun e!507552 () Bool)

(declare-fun tp_is_empty!18685 () Bool)

(assert (=> b!905751 (= e!507552 tp_is_empty!18685)))

(declare-fun b!905752 () Bool)

(declare-fun res!611289 () Bool)

(assert (=> b!905752 (=> (not res!611289) (not e!507556))))

(assert (=> b!905752 (= res!611289 (and (= (select (arr!25656 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905753 () Bool)

(declare-fun e!507557 () Bool)

(assert (=> b!905753 (= e!507557 (and e!507552 mapRes!29740))))

(declare-fun condMapEmpty!29740 () Bool)

(declare-fun mapDefault!29740 () ValueCell!8861)

(assert (=> b!905753 (= condMapEmpty!29740 (= (arr!25655 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8861)) mapDefault!29740)))))

(declare-fun b!905745 () Bool)

(declare-fun res!611282 () Bool)

(assert (=> b!905745 (=> (not res!611282) (not e!507550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53393 (_ BitVec 32)) Bool)

(assert (=> b!905745 (= res!611282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!611285 () Bool)

(assert (=> start!77664 (=> (not res!611285) (not e!507550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77664 (= res!611285 (validMask!0 mask!1756))))

(assert (=> start!77664 e!507550))

(declare-fun array_inv!20144 (array!53391) Bool)

(assert (=> start!77664 (and (array_inv!20144 _values!1152) e!507557)))

(assert (=> start!77664 tp!57064))

(assert (=> start!77664 true))

(assert (=> start!77664 tp_is_empty!18685))

(declare-fun array_inv!20145 (array!53393) Bool)

(assert (=> start!77664 (array_inv!20145 _keys!1386)))

(declare-fun b!905754 () Bool)

(assert (=> b!905754 (= e!507555 tp_is_empty!18685)))

(declare-fun b!905755 () Bool)

(declare-fun res!611288 () Bool)

(declare-fun e!507554 () Bool)

(assert (=> b!905755 (=> res!611288 e!507554)))

(declare-fun lt!408520 () ListLongMap!10929)

(declare-fun apply!458 (ListLongMap!10929 (_ BitVec 64)) V!29879)

(assert (=> b!905755 (= res!611288 (not (= (apply!458 lt!408520 k0!1033) lt!408518)))))

(declare-fun b!905756 () Bool)

(assert (=> b!905756 (= e!507554 true)))

(assert (=> b!905756 (= (apply!458 lt!408519 k0!1033) lt!408518)))

(declare-fun lt!408517 () Unit!30664)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!20 (array!53393 array!53391 (_ BitVec 32) (_ BitVec 32) V!29879 V!29879 (_ BitVec 64) V!29879 (_ BitVec 32) Int) Unit!30664)

(assert (=> b!905756 (= lt!408517 (lemmaListMapApplyFromThenApplyFromZero!20 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408518 i!717 defaultEntry!1160))))

(declare-fun b!905757 () Bool)

(assert (=> b!905757 (= e!507553 e!507554)))

(declare-fun res!611287 () Bool)

(assert (=> b!905757 (=> res!611287 e!507554)))

(assert (=> b!905757 (= res!611287 (not (contains!4488 lt!408520 k0!1033)))))

(assert (=> b!905757 (= lt!408520 (getCurrentListMap!2692 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(assert (= (and start!77664 res!611285) b!905746))

(assert (= (and b!905746 res!611284) b!905745))

(assert (= (and b!905745 res!611282) b!905750))

(assert (= (and b!905750 res!611280) b!905748))

(assert (= (and b!905748 res!611281) b!905747))

(assert (= (and b!905747 res!611283) b!905752))

(assert (= (and b!905752 res!611289) b!905749))

(assert (= (and b!905749 (not res!611286)) b!905757))

(assert (= (and b!905757 (not res!611287)) b!905755))

(assert (= (and b!905755 (not res!611288)) b!905756))

(assert (= (and b!905753 condMapEmpty!29740) mapIsEmpty!29740))

(assert (= (and b!905753 (not condMapEmpty!29740)) mapNonEmpty!29740))

(get-info :version)

(assert (= (and mapNonEmpty!29740 ((_ is ValueCellFull!8861) mapValue!29740)) b!905754))

(assert (= (and b!905753 ((_ is ValueCellFull!8861) mapDefault!29740)) b!905751))

(assert (= start!77664 b!905753))

(declare-fun b_lambda!13123 () Bool)

(assert (=> (not b_lambda!13123) (not b!905749)))

(declare-fun t!25464 () Bool)

(declare-fun tb!5281 () Bool)

(assert (=> (and start!77664 (= defaultEntry!1160 defaultEntry!1160) t!25464) tb!5281))

(declare-fun result!10365 () Bool)

(assert (=> tb!5281 (= result!10365 tp_is_empty!18685)))

(assert (=> b!905749 t!25464))

(declare-fun b_and!26663 () Bool)

(assert (= b_and!26661 (and (=> t!25464 result!10365) b_and!26663)))

(declare-fun m!840617 () Bool)

(assert (=> b!905745 m!840617))

(declare-fun m!840619 () Bool)

(assert (=> b!905750 m!840619))

(declare-fun m!840621 () Bool)

(assert (=> b!905755 m!840621))

(declare-fun m!840623 () Bool)

(assert (=> start!77664 m!840623))

(declare-fun m!840625 () Bool)

(assert (=> start!77664 m!840625))

(declare-fun m!840627 () Bool)

(assert (=> start!77664 m!840627))

(declare-fun m!840629 () Bool)

(assert (=> b!905757 m!840629))

(declare-fun m!840631 () Bool)

(assert (=> b!905757 m!840631))

(declare-fun m!840633 () Bool)

(assert (=> mapNonEmpty!29740 m!840633))

(declare-fun m!840635 () Bool)

(assert (=> b!905747 m!840635))

(declare-fun m!840637 () Bool)

(assert (=> b!905752 m!840637))

(declare-fun m!840639 () Bool)

(assert (=> b!905756 m!840639))

(declare-fun m!840641 () Bool)

(assert (=> b!905756 m!840641))

(declare-fun m!840643 () Bool)

(assert (=> b!905749 m!840643))

(declare-fun m!840645 () Bool)

(assert (=> b!905749 m!840645))

(declare-fun m!840647 () Bool)

(assert (=> b!905749 m!840647))

(declare-fun m!840649 () Bool)

(assert (=> b!905749 m!840649))

(assert (=> b!905749 m!840643))

(assert (=> b!905749 m!840647))

(declare-fun m!840651 () Bool)

(assert (=> b!905749 m!840651))

(declare-fun m!840653 () Bool)

(assert (=> b!905748 m!840653))

(declare-fun m!840655 () Bool)

(assert (=> b!905748 m!840655))

(check-sat (not b_lambda!13123) (not b!905757) (not b!905749) tp_is_empty!18685 (not b!905756) (not b_next!16267) (not start!77664) b_and!26663 (not mapNonEmpty!29740) (not b!905755) (not b!905747) (not b!905750) (not b!905748) (not b!905745))
(check-sat b_and!26663 (not b_next!16267))
