; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77762 () Bool)

(assert start!77762)

(declare-fun b_free!16347 () Bool)

(declare-fun b_next!16347 () Bool)

(assert (=> start!77762 (= b_free!16347 (not b_next!16347))))

(declare-fun tp!57303 () Bool)

(declare-fun b_and!26847 () Bool)

(assert (=> start!77762 (= tp!57303 b_and!26847)))

(declare-fun b!907624 () Bool)

(declare-fun res!612596 () Bool)

(declare-fun e!508665 () Bool)

(assert (=> b!907624 (=> (not res!612596) (not e!508665))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907624 (= res!612596 (inRange!0 i!717 mask!1756))))

(declare-fun b!907625 () Bool)

(declare-fun res!612590 () Bool)

(declare-fun e!508663 () Bool)

(assert (=> b!907625 (=> (not res!612590) (not e!508663))))

(declare-datatypes ((array!53562 0))(
  ( (array!53563 (arr!25740 (Array (_ BitVec 32) (_ BitVec 64))) (size!26199 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53562)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53562 (_ BitVec 32)) Bool)

(assert (=> b!907625 (= res!612590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!907626 () Bool)

(declare-fun e!508659 () Bool)

(assert (=> b!907626 (= e!508659 (or (bvsge #b00000000000000000000000000000000 (size!26199 _keys!1386)) (bvslt (size!26199 _keys!1386) #b01111111111111111111111111111111)))))

(declare-datatypes ((V!29985 0))(
  ( (V!29986 (val!9433 Int)) )
))
(declare-datatypes ((tuple2!12286 0))(
  ( (tuple2!12287 (_1!6154 (_ BitVec 64)) (_2!6154 V!29985)) )
))
(declare-datatypes ((List!18086 0))(
  ( (Nil!18083) (Cons!18082 (h!19228 tuple2!12286) (t!25605 List!18086)) )
))
(declare-datatypes ((ListLongMap!10983 0))(
  ( (ListLongMap!10984 (toList!5507 List!18086)) )
))
(declare-fun lt!409354 () ListLongMap!10983)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!409352 () V!29985)

(declare-fun apply!491 (ListLongMap!10983 (_ BitVec 64)) V!29985)

(assert (=> b!907626 (= (apply!491 lt!409354 k0!1033) lt!409352)))

(declare-datatypes ((ValueCell!8901 0))(
  ( (ValueCellFull!8901 (v!11938 V!29985)) (EmptyCell!8901) )
))
(declare-datatypes ((array!53564 0))(
  ( (array!53565 (arr!25741 (Array (_ BitVec 32) ValueCell!8901)) (size!26200 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53564)

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29985)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29985)

(declare-datatypes ((Unit!30804 0))(
  ( (Unit!30805) )
))
(declare-fun lt!409353 () Unit!30804)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!44 (array!53562 array!53564 (_ BitVec 32) (_ BitVec 32) V!29985 V!29985 (_ BitVec 64) V!29985 (_ BitVec 32) Int) Unit!30804)

(assert (=> b!907626 (= lt!409353 (lemmaListMapApplyFromThenApplyFromZero!44 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409352 i!717 defaultEntry!1160))))

(declare-fun b!907627 () Bool)

(declare-fun e!508661 () Bool)

(assert (=> b!907627 (= e!508661 e!508659)))

(declare-fun res!612597 () Bool)

(assert (=> b!907627 (=> res!612597 e!508659)))

(declare-fun lt!409356 () ListLongMap!10983)

(declare-fun contains!4550 (ListLongMap!10983 (_ BitVec 64)) Bool)

(assert (=> b!907627 (= res!612597 (not (contains!4550 lt!409356 k0!1033)))))

(declare-fun getCurrentListMap!2771 (array!53562 array!53564 (_ BitVec 32) (_ BitVec 32) V!29985 V!29985 (_ BitVec 32) Int) ListLongMap!10983)

(assert (=> b!907627 (= lt!409356 (getCurrentListMap!2771 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun res!612598 () Bool)

(assert (=> start!77762 (=> (not res!612598) (not e!508663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77762 (= res!612598 (validMask!0 mask!1756))))

(assert (=> start!77762 e!508663))

(declare-fun e!508660 () Bool)

(declare-fun array_inv!20154 (array!53564) Bool)

(assert (=> start!77762 (and (array_inv!20154 _values!1152) e!508660)))

(assert (=> start!77762 tp!57303))

(assert (=> start!77762 true))

(declare-fun tp_is_empty!18765 () Bool)

(assert (=> start!77762 tp_is_empty!18765))

(declare-fun array_inv!20155 (array!53562) Bool)

(assert (=> start!77762 (array_inv!20155 _keys!1386)))

(declare-fun b!907628 () Bool)

(declare-fun res!612595 () Bool)

(assert (=> b!907628 (=> res!612595 e!508659)))

(assert (=> b!907628 (= res!612595 (not (= (apply!491 lt!409356 k0!1033) lt!409352)))))

(declare-fun b!907629 () Bool)

(declare-fun res!612592 () Bool)

(assert (=> b!907629 (=> (not res!612592) (not e!508663))))

(declare-datatypes ((List!18087 0))(
  ( (Nil!18084) (Cons!18083 (h!19229 (_ BitVec 64)) (t!25606 List!18087)) )
))
(declare-fun arrayNoDuplicates!0 (array!53562 (_ BitVec 32) List!18087) Bool)

(assert (=> b!907629 (= res!612592 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18084))))

(declare-fun b!907630 () Bool)

(declare-fun res!612591 () Bool)

(assert (=> b!907630 (=> (not res!612591) (not e!508665))))

(assert (=> b!907630 (= res!612591 (and (= (select (arr!25740 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!29860 () Bool)

(declare-fun mapRes!29860 () Bool)

(assert (=> mapIsEmpty!29860 mapRes!29860))

(declare-fun mapNonEmpty!29860 () Bool)

(declare-fun tp!57302 () Bool)

(declare-fun e!508662 () Bool)

(assert (=> mapNonEmpty!29860 (= mapRes!29860 (and tp!57302 e!508662))))

(declare-fun mapValue!29860 () ValueCell!8901)

(declare-fun mapRest!29860 () (Array (_ BitVec 32) ValueCell!8901))

(declare-fun mapKey!29860 () (_ BitVec 32))

(assert (=> mapNonEmpty!29860 (= (arr!25741 _values!1152) (store mapRest!29860 mapKey!29860 mapValue!29860))))

(declare-fun b!907631 () Bool)

(declare-fun e!508664 () Bool)

(assert (=> b!907631 (= e!508664 tp_is_empty!18765)))

(declare-fun b!907632 () Bool)

(assert (=> b!907632 (= e!508663 e!508665)))

(declare-fun res!612593 () Bool)

(assert (=> b!907632 (=> (not res!612593) (not e!508665))))

(assert (=> b!907632 (= res!612593 (contains!4550 lt!409354 k0!1033))))

(assert (=> b!907632 (= lt!409354 (getCurrentListMap!2771 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!907633 () Bool)

(assert (=> b!907633 (= e!508662 tp_is_empty!18765)))

(declare-fun b!907634 () Bool)

(assert (=> b!907634 (= e!508665 (not e!508661))))

(declare-fun res!612599 () Bool)

(assert (=> b!907634 (=> res!612599 e!508661)))

(assert (=> b!907634 (= res!612599 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26199 _keys!1386))))))

(declare-fun get!13542 (ValueCell!8901 V!29985) V!29985)

(declare-fun dynLambda!1366 (Int (_ BitVec 64)) V!29985)

(assert (=> b!907634 (= lt!409352 (get!13542 (select (arr!25741 _values!1152) i!717) (dynLambda!1366 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53562 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907634 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409355 () Unit!30804)

(declare-fun lemmaKeyInListMapIsInArray!238 (array!53562 array!53564 (_ BitVec 32) (_ BitVec 32) V!29985 V!29985 (_ BitVec 64) Int) Unit!30804)

(assert (=> b!907634 (= lt!409355 (lemmaKeyInListMapIsInArray!238 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!907635 () Bool)

(declare-fun res!612594 () Bool)

(assert (=> b!907635 (=> (not res!612594) (not e!508663))))

(assert (=> b!907635 (= res!612594 (and (= (size!26200 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26199 _keys!1386) (size!26200 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!907636 () Bool)

(assert (=> b!907636 (= e!508660 (and e!508664 mapRes!29860))))

(declare-fun condMapEmpty!29860 () Bool)

(declare-fun mapDefault!29860 () ValueCell!8901)

(assert (=> b!907636 (= condMapEmpty!29860 (= (arr!25741 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8901)) mapDefault!29860)))))

(assert (= (and start!77762 res!612598) b!907635))

(assert (= (and b!907635 res!612594) b!907625))

(assert (= (and b!907625 res!612590) b!907629))

(assert (= (and b!907629 res!612592) b!907632))

(assert (= (and b!907632 res!612593) b!907624))

(assert (= (and b!907624 res!612596) b!907630))

(assert (= (and b!907630 res!612591) b!907634))

(assert (= (and b!907634 (not res!612599)) b!907627))

(assert (= (and b!907627 (not res!612597)) b!907628))

(assert (= (and b!907628 (not res!612595)) b!907626))

(assert (= (and b!907636 condMapEmpty!29860) mapIsEmpty!29860))

(assert (= (and b!907636 (not condMapEmpty!29860)) mapNonEmpty!29860))

(get-info :version)

(assert (= (and mapNonEmpty!29860 ((_ is ValueCellFull!8901) mapValue!29860)) b!907633))

(assert (= (and b!907636 ((_ is ValueCellFull!8901) mapDefault!29860)) b!907631))

(assert (= start!77762 b!907636))

(declare-fun b_lambda!13221 () Bool)

(assert (=> (not b_lambda!13221) (not b!907634)))

(declare-fun t!25604 () Bool)

(declare-fun tb!5369 () Bool)

(assert (=> (and start!77762 (= defaultEntry!1160 defaultEntry!1160) t!25604) tb!5369))

(declare-fun result!10533 () Bool)

(assert (=> tb!5369 (= result!10533 tp_is_empty!18765)))

(assert (=> b!907634 t!25604))

(declare-fun b_and!26849 () Bool)

(assert (= b_and!26847 (and (=> t!25604 result!10533) b_and!26849)))

(declare-fun m!842975 () Bool)

(assert (=> b!907634 m!842975))

(declare-fun m!842977 () Bool)

(assert (=> b!907634 m!842977))

(declare-fun m!842979 () Bool)

(assert (=> b!907634 m!842979))

(declare-fun m!842981 () Bool)

(assert (=> b!907634 m!842981))

(assert (=> b!907634 m!842975))

(assert (=> b!907634 m!842979))

(declare-fun m!842983 () Bool)

(assert (=> b!907634 m!842983))

(declare-fun m!842985 () Bool)

(assert (=> b!907630 m!842985))

(declare-fun m!842987 () Bool)

(assert (=> b!907632 m!842987))

(declare-fun m!842989 () Bool)

(assert (=> b!907632 m!842989))

(declare-fun m!842991 () Bool)

(assert (=> b!907624 m!842991))

(declare-fun m!842993 () Bool)

(assert (=> b!907625 m!842993))

(declare-fun m!842995 () Bool)

(assert (=> start!77762 m!842995))

(declare-fun m!842997 () Bool)

(assert (=> start!77762 m!842997))

(declare-fun m!842999 () Bool)

(assert (=> start!77762 m!842999))

(declare-fun m!843001 () Bool)

(assert (=> b!907627 m!843001))

(declare-fun m!843003 () Bool)

(assert (=> b!907627 m!843003))

(declare-fun m!843005 () Bool)

(assert (=> b!907628 m!843005))

(declare-fun m!843007 () Bool)

(assert (=> b!907626 m!843007))

(declare-fun m!843009 () Bool)

(assert (=> b!907626 m!843009))

(declare-fun m!843011 () Bool)

(assert (=> mapNonEmpty!29860 m!843011))

(declare-fun m!843013 () Bool)

(assert (=> b!907629 m!843013))

(check-sat (not b_lambda!13221) (not b_next!16347) (not b!907634) (not b!907628) (not b!907632) (not b!907626) tp_is_empty!18765 (not b!907629) (not mapNonEmpty!29860) (not b!907624) (not b!907625) (not start!77762) b_and!26849 (not b!907627))
(check-sat b_and!26849 (not b_next!16347))
(get-model)

(declare-fun b_lambda!13225 () Bool)

(assert (= b_lambda!13221 (or (and start!77762 b_free!16347) b_lambda!13225)))

(check-sat (not b_next!16347) (not b!907634) (not b!907628) (not b!907632) (not b!907626) (not b_lambda!13225) tp_is_empty!18765 (not b!907629) (not mapNonEmpty!29860) (not b!907624) (not b!907625) (not start!77762) b_and!26849 (not b!907627))
(check-sat b_and!26849 (not b_next!16347))
(get-model)

(declare-fun b!907688 () Bool)

(declare-fun e!508697 () Bool)

(declare-fun e!508698 () Bool)

(assert (=> b!907688 (= e!508697 e!508698)))

(declare-fun c!95651 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!907688 (= c!95651 (validKeyInArray!0 (select (arr!25740 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!907689 () Bool)

(declare-fun e!508696 () Bool)

(assert (=> b!907689 (= e!508698 e!508696)))

(declare-fun lt!409379 () (_ BitVec 64))

(assert (=> b!907689 (= lt!409379 (select (arr!25740 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!409380 () Unit!30804)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!53562 (_ BitVec 64) (_ BitVec 32)) Unit!30804)

(assert (=> b!907689 (= lt!409380 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!409379 #b00000000000000000000000000000000))))

(assert (=> b!907689 (arrayContainsKey!0 _keys!1386 lt!409379 #b00000000000000000000000000000000)))

(declare-fun lt!409378 () Unit!30804)

(assert (=> b!907689 (= lt!409378 lt!409380)))

(declare-fun res!612635 () Bool)

(declare-datatypes ((SeekEntryResult!8963 0))(
  ( (MissingZero!8963 (index!38223 (_ BitVec 32))) (Found!8963 (index!38224 (_ BitVec 32))) (Intermediate!8963 (undefined!9775 Bool) (index!38225 (_ BitVec 32)) (x!77500 (_ BitVec 32))) (Undefined!8963) (MissingVacant!8963 (index!38226 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!53562 (_ BitVec 32)) SeekEntryResult!8963)

(assert (=> b!907689 (= res!612635 (= (seekEntryOrOpen!0 (select (arr!25740 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8963 #b00000000000000000000000000000000)))))

(assert (=> b!907689 (=> (not res!612635) (not e!508696))))

(declare-fun bm!40252 () Bool)

(declare-fun call!40255 () Bool)

(assert (=> bm!40252 (= call!40255 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!907690 () Bool)

(assert (=> b!907690 (= e!508698 call!40255)))

(declare-fun d!112089 () Bool)

(declare-fun res!612634 () Bool)

(assert (=> d!112089 (=> res!612634 e!508697)))

(assert (=> d!112089 (= res!612634 (bvsge #b00000000000000000000000000000000 (size!26199 _keys!1386)))))

(assert (=> d!112089 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!508697)))

(declare-fun b!907691 () Bool)

(assert (=> b!907691 (= e!508696 call!40255)))

(assert (= (and d!112089 (not res!612634)) b!907688))

(assert (= (and b!907688 c!95651) b!907689))

(assert (= (and b!907688 (not c!95651)) b!907690))

(assert (= (and b!907689 res!612635) b!907691))

(assert (= (or b!907691 b!907690) bm!40252))

(declare-fun m!843055 () Bool)

(assert (=> b!907688 m!843055))

(assert (=> b!907688 m!843055))

(declare-fun m!843057 () Bool)

(assert (=> b!907688 m!843057))

(assert (=> b!907689 m!843055))

(declare-fun m!843059 () Bool)

(assert (=> b!907689 m!843059))

(declare-fun m!843061 () Bool)

(assert (=> b!907689 m!843061))

(assert (=> b!907689 m!843055))

(declare-fun m!843063 () Bool)

(assert (=> b!907689 m!843063))

(declare-fun m!843065 () Bool)

(assert (=> bm!40252 m!843065))

(assert (=> b!907625 d!112089))

(declare-fun d!112091 () Bool)

(declare-fun c!95654 () Bool)

(assert (=> d!112091 (= c!95654 ((_ is ValueCellFull!8901) (select (arr!25741 _values!1152) i!717)))))

(declare-fun e!508701 () V!29985)

(assert (=> d!112091 (= (get!13542 (select (arr!25741 _values!1152) i!717) (dynLambda!1366 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)) e!508701)))

(declare-fun b!907696 () Bool)

(declare-fun get!13544 (ValueCell!8901 V!29985) V!29985)

(assert (=> b!907696 (= e!508701 (get!13544 (select (arr!25741 _values!1152) i!717) (dynLambda!1366 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!907697 () Bool)

(declare-fun get!13545 (ValueCell!8901 V!29985) V!29985)

(assert (=> b!907697 (= e!508701 (get!13545 (select (arr!25741 _values!1152) i!717) (dynLambda!1366 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112091 c!95654) b!907696))

(assert (= (and d!112091 (not c!95654)) b!907697))

(assert (=> b!907696 m!842975))

(assert (=> b!907696 m!842979))

(declare-fun m!843067 () Bool)

(assert (=> b!907696 m!843067))

(assert (=> b!907697 m!842975))

(assert (=> b!907697 m!842979))

(declare-fun m!843069 () Bool)

(assert (=> b!907697 m!843069))

(assert (=> b!907634 d!112091))

(declare-fun d!112093 () Bool)

(declare-fun res!612640 () Bool)

(declare-fun e!508706 () Bool)

(assert (=> d!112093 (=> res!612640 e!508706)))

(assert (=> d!112093 (= res!612640 (= (select (arr!25740 _keys!1386) #b00000000000000000000000000000000) k0!1033))))

(assert (=> d!112093 (= (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000) e!508706)))

(declare-fun b!907702 () Bool)

(declare-fun e!508707 () Bool)

(assert (=> b!907702 (= e!508706 e!508707)))

(declare-fun res!612641 () Bool)

(assert (=> b!907702 (=> (not res!612641) (not e!508707))))

(assert (=> b!907702 (= res!612641 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26199 _keys!1386)))))

(declare-fun b!907703 () Bool)

(assert (=> b!907703 (= e!508707 (arrayContainsKey!0 _keys!1386 k0!1033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!112093 (not res!612640)) b!907702))

(assert (= (and b!907702 res!612641) b!907703))

(assert (=> d!112093 m!843055))

(declare-fun m!843071 () Bool)

(assert (=> b!907703 m!843071))

(assert (=> b!907634 d!112093))

(declare-fun d!112095 () Bool)

(declare-fun e!508710 () Bool)

(assert (=> d!112095 e!508710))

(declare-fun c!95657 () Bool)

(assert (=> d!112095 (= c!95657 (and (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!409383 () Unit!30804)

(declare-fun choose!1527 (array!53562 array!53564 (_ BitVec 32) (_ BitVec 32) V!29985 V!29985 (_ BitVec 64) Int) Unit!30804)

(assert (=> d!112095 (= lt!409383 (choose!1527 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(assert (=> d!112095 (validMask!0 mask!1756)))

(assert (=> d!112095 (= (lemmaKeyInListMapIsInArray!238 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160) lt!409383)))

(declare-fun b!907708 () Bool)

(assert (=> b!907708 (= e!508710 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000))))

(declare-fun b!907709 () Bool)

(assert (=> b!907709 (= e!508710 (ite (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!112095 c!95657) b!907708))

(assert (= (and d!112095 (not c!95657)) b!907709))

(declare-fun m!843073 () Bool)

(assert (=> d!112095 m!843073))

(assert (=> d!112095 m!842995))

(assert (=> b!907708 m!842981))

(assert (=> b!907634 d!112095))

(declare-fun b!907720 () Bool)

(declare-fun e!508720 () Bool)

(declare-fun e!508722 () Bool)

(assert (=> b!907720 (= e!508720 e!508722)))

(declare-fun res!612649 () Bool)

(assert (=> b!907720 (=> (not res!612649) (not e!508722))))

(declare-fun e!508719 () Bool)

(assert (=> b!907720 (= res!612649 (not e!508719))))

(declare-fun res!612650 () Bool)

(assert (=> b!907720 (=> (not res!612650) (not e!508719))))

(assert (=> b!907720 (= res!612650 (validKeyInArray!0 (select (arr!25740 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun d!112097 () Bool)

(declare-fun res!612648 () Bool)

(assert (=> d!112097 (=> res!612648 e!508720)))

(assert (=> d!112097 (= res!612648 (bvsge #b00000000000000000000000000000000 (size!26199 _keys!1386)))))

(assert (=> d!112097 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18084) e!508720)))

(declare-fun b!907721 () Bool)

(declare-fun contains!4551 (List!18087 (_ BitVec 64)) Bool)

(assert (=> b!907721 (= e!508719 (contains!4551 Nil!18084 (select (arr!25740 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!907722 () Bool)

(declare-fun e!508721 () Bool)

(declare-fun call!40258 () Bool)

(assert (=> b!907722 (= e!508721 call!40258)))

(declare-fun bm!40255 () Bool)

(declare-fun c!95660 () Bool)

(assert (=> bm!40255 (= call!40258 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95660 (Cons!18083 (select (arr!25740 _keys!1386) #b00000000000000000000000000000000) Nil!18084) Nil!18084)))))

(declare-fun b!907723 () Bool)

(assert (=> b!907723 (= e!508721 call!40258)))

(declare-fun b!907724 () Bool)

(assert (=> b!907724 (= e!508722 e!508721)))

(assert (=> b!907724 (= c!95660 (validKeyInArray!0 (select (arr!25740 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112097 (not res!612648)) b!907720))

(assert (= (and b!907720 res!612650) b!907721))

(assert (= (and b!907720 res!612649) b!907724))

(assert (= (and b!907724 c!95660) b!907723))

(assert (= (and b!907724 (not c!95660)) b!907722))

(assert (= (or b!907723 b!907722) bm!40255))

(assert (=> b!907720 m!843055))

(assert (=> b!907720 m!843055))

(assert (=> b!907720 m!843057))

(assert (=> b!907721 m!843055))

(assert (=> b!907721 m!843055))

(declare-fun m!843075 () Bool)

(assert (=> b!907721 m!843075))

(assert (=> bm!40255 m!843055))

(declare-fun m!843077 () Bool)

(assert (=> bm!40255 m!843077))

(assert (=> b!907724 m!843055))

(assert (=> b!907724 m!843055))

(assert (=> b!907724 m!843057))

(assert (=> b!907629 d!112097))

(declare-fun d!112099 () Bool)

(assert (=> d!112099 (= (inRange!0 i!717 mask!1756) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (bvadd mask!1756 #b00000000000000000000000000000001))))))

(assert (=> b!907624 d!112099))

(declare-fun d!112101 () Bool)

(declare-fun e!508728 () Bool)

(assert (=> d!112101 e!508728))

(declare-fun res!612653 () Bool)

(assert (=> d!112101 (=> res!612653 e!508728)))

(declare-fun lt!409395 () Bool)

(assert (=> d!112101 (= res!612653 (not lt!409395))))

(declare-fun lt!409392 () Bool)

(assert (=> d!112101 (= lt!409395 lt!409392)))

(declare-fun lt!409393 () Unit!30804)

(declare-fun e!508727 () Unit!30804)

(assert (=> d!112101 (= lt!409393 e!508727)))

(declare-fun c!95663 () Bool)

(assert (=> d!112101 (= c!95663 lt!409392)))

(declare-fun containsKey!436 (List!18086 (_ BitVec 64)) Bool)

(assert (=> d!112101 (= lt!409392 (containsKey!436 (toList!5507 lt!409354) k0!1033))))

(assert (=> d!112101 (= (contains!4550 lt!409354 k0!1033) lt!409395)))

(declare-fun b!907731 () Bool)

(declare-fun lt!409394 () Unit!30804)

(assert (=> b!907731 (= e!508727 lt!409394)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!332 (List!18086 (_ BitVec 64)) Unit!30804)

(assert (=> b!907731 (= lt!409394 (lemmaContainsKeyImpliesGetValueByKeyDefined!332 (toList!5507 lt!409354) k0!1033))))

(declare-datatypes ((Option!475 0))(
  ( (Some!474 (v!11941 V!29985)) (None!473) )
))
(declare-fun isDefined!341 (Option!475) Bool)

(declare-fun getValueByKey!469 (List!18086 (_ BitVec 64)) Option!475)

(assert (=> b!907731 (isDefined!341 (getValueByKey!469 (toList!5507 lt!409354) k0!1033))))

(declare-fun b!907732 () Bool)

(declare-fun Unit!30808 () Unit!30804)

(assert (=> b!907732 (= e!508727 Unit!30808)))

(declare-fun b!907733 () Bool)

(assert (=> b!907733 (= e!508728 (isDefined!341 (getValueByKey!469 (toList!5507 lt!409354) k0!1033)))))

(assert (= (and d!112101 c!95663) b!907731))

(assert (= (and d!112101 (not c!95663)) b!907732))

(assert (= (and d!112101 (not res!612653)) b!907733))

(declare-fun m!843079 () Bool)

(assert (=> d!112101 m!843079))

(declare-fun m!843081 () Bool)

(assert (=> b!907731 m!843081))

(declare-fun m!843083 () Bool)

(assert (=> b!907731 m!843083))

(assert (=> b!907731 m!843083))

(declare-fun m!843085 () Bool)

(assert (=> b!907731 m!843085))

(assert (=> b!907733 m!843083))

(assert (=> b!907733 m!843083))

(assert (=> b!907733 m!843085))

(assert (=> b!907632 d!112101))

(declare-fun b!907776 () Bool)

(declare-fun e!508764 () ListLongMap!10983)

(declare-fun call!40274 () ListLongMap!10983)

(assert (=> b!907776 (= e!508764 call!40274)))

(declare-fun d!112103 () Bool)

(declare-fun e!508767 () Bool)

(assert (=> d!112103 e!508767))

(declare-fun res!612674 () Bool)

(assert (=> d!112103 (=> (not res!612674) (not e!508767))))

(assert (=> d!112103 (= res!612674 (or (bvsge #b00000000000000000000000000000000 (size!26199 _keys!1386)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26199 _keys!1386)))))))

(declare-fun lt!409442 () ListLongMap!10983)

(declare-fun lt!409451 () ListLongMap!10983)

(assert (=> d!112103 (= lt!409442 lt!409451)))

(declare-fun lt!409457 () Unit!30804)

(declare-fun e!508765 () Unit!30804)

(assert (=> d!112103 (= lt!409457 e!508765)))

(declare-fun c!95677 () Bool)

(declare-fun e!508757 () Bool)

(assert (=> d!112103 (= c!95677 e!508757)))

(declare-fun res!612676 () Bool)

(assert (=> d!112103 (=> (not res!612676) (not e!508757))))

(assert (=> d!112103 (= res!612676 (bvslt #b00000000000000000000000000000000 (size!26199 _keys!1386)))))

(declare-fun e!508760 () ListLongMap!10983)

(assert (=> d!112103 (= lt!409451 e!508760)))

(declare-fun c!95680 () Bool)

(assert (=> d!112103 (= c!95680 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112103 (validMask!0 mask!1756)))

(assert (=> d!112103 (= (getCurrentListMap!2771 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!409442)))

(declare-fun b!907777 () Bool)

(declare-fun e!508762 () Bool)

(assert (=> b!907777 (= e!508767 e!508762)))

(declare-fun c!95678 () Bool)

(assert (=> b!907777 (= c!95678 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40270 () Bool)

(declare-fun call!40275 () Bool)

(assert (=> bm!40270 (= call!40275 (contains!4550 lt!409442 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40271 () Bool)

(declare-fun call!40276 () ListLongMap!10983)

(declare-fun call!40273 () ListLongMap!10983)

(assert (=> bm!40271 (= call!40276 call!40273)))

(declare-fun b!907778 () Bool)

(assert (=> b!907778 (= e!508760 e!508764)))

(declare-fun c!95681 () Bool)

(assert (=> b!907778 (= c!95681 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!907779 () Bool)

(declare-fun call!40278 () ListLongMap!10983)

(declare-fun +!2602 (ListLongMap!10983 tuple2!12286) ListLongMap!10983)

(assert (=> b!907779 (= e!508760 (+!2602 call!40278 (tuple2!12287 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun b!907780 () Bool)

(declare-fun e!508766 () Bool)

(assert (=> b!907780 (= e!508762 e!508766)))

(declare-fun res!612675 () Bool)

(assert (=> b!907780 (= res!612675 call!40275)))

(assert (=> b!907780 (=> (not res!612675) (not e!508766))))

(declare-fun b!907781 () Bool)

(declare-fun e!508763 () ListLongMap!10983)

(assert (=> b!907781 (= e!508763 call!40276)))

(declare-fun b!907782 () Bool)

(assert (=> b!907782 (= e!508763 call!40274)))

(declare-fun b!907783 () Bool)

(declare-fun e!508761 () Bool)

(assert (=> b!907783 (= e!508761 (validKeyInArray!0 (select (arr!25740 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!907784 () Bool)

(declare-fun e!508758 () Bool)

(declare-fun call!40277 () Bool)

(assert (=> b!907784 (= e!508758 (not call!40277))))

(declare-fun b!907785 () Bool)

(assert (=> b!907785 (= e!508757 (validKeyInArray!0 (select (arr!25740 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!907786 () Bool)

(declare-fun e!508759 () Bool)

(assert (=> b!907786 (= e!508759 (= (apply!491 lt!409442 (select (arr!25740 _keys!1386) #b00000000000000000000000000000000)) (get!13542 (select (arr!25741 _values!1152) #b00000000000000000000000000000000) (dynLambda!1366 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!907786 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26200 _values!1152)))))

(assert (=> b!907786 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26199 _keys!1386)))))

(declare-fun b!907787 () Bool)

(declare-fun e!508756 () Bool)

(assert (=> b!907787 (= e!508756 e!508759)))

(declare-fun res!612672 () Bool)

(assert (=> b!907787 (=> (not res!612672) (not e!508759))))

(assert (=> b!907787 (= res!612672 (contains!4550 lt!409442 (select (arr!25740 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!907787 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26199 _keys!1386)))))

(declare-fun bm!40272 () Bool)

(declare-fun call!40279 () ListLongMap!10983)

(assert (=> bm!40272 (= call!40273 call!40279)))

(declare-fun b!907788 () Bool)

(declare-fun res!612678 () Bool)

(assert (=> b!907788 (=> (not res!612678) (not e!508767))))

(assert (=> b!907788 (= res!612678 e!508756)))

(declare-fun res!612680 () Bool)

(assert (=> b!907788 (=> res!612680 e!508756)))

(assert (=> b!907788 (= res!612680 (not e!508761))))

(declare-fun res!612679 () Bool)

(assert (=> b!907788 (=> (not res!612679) (not e!508761))))

(assert (=> b!907788 (= res!612679 (bvslt #b00000000000000000000000000000000 (size!26199 _keys!1386)))))

(declare-fun bm!40273 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3289 (array!53562 array!53564 (_ BitVec 32) (_ BitVec 32) V!29985 V!29985 (_ BitVec 32) Int) ListLongMap!10983)

(assert (=> bm!40273 (= call!40279 (getCurrentListMapNoExtraKeys!3289 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!907789 () Bool)

(declare-fun res!612677 () Bool)

(assert (=> b!907789 (=> (not res!612677) (not e!508767))))

(assert (=> b!907789 (= res!612677 e!508758)))

(declare-fun c!95679 () Bool)

(assert (=> b!907789 (= c!95679 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!907790 () Bool)

(assert (=> b!907790 (= e!508766 (= (apply!491 lt!409442 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!907791 () Bool)

(declare-fun e!508755 () Bool)

(assert (=> b!907791 (= e!508758 e!508755)))

(declare-fun res!612673 () Bool)

(assert (=> b!907791 (= res!612673 call!40277)))

(assert (=> b!907791 (=> (not res!612673) (not e!508755))))

(declare-fun b!907792 () Bool)

(declare-fun c!95676 () Bool)

(assert (=> b!907792 (= c!95676 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!907792 (= e!508764 e!508763)))

(declare-fun b!907793 () Bool)

(assert (=> b!907793 (= e!508755 (= (apply!491 lt!409442 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun bm!40274 () Bool)

(assert (=> bm!40274 (= call!40277 (contains!4550 lt!409442 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!907794 () Bool)

(declare-fun lt!409445 () Unit!30804)

(assert (=> b!907794 (= e!508765 lt!409445)))

(declare-fun lt!409440 () ListLongMap!10983)

(assert (=> b!907794 (= lt!409440 (getCurrentListMapNoExtraKeys!3289 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!409443 () (_ BitVec 64))

(assert (=> b!907794 (= lt!409443 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!409441 () (_ BitVec 64))

(assert (=> b!907794 (= lt!409441 (select (arr!25740 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!409444 () Unit!30804)

(declare-fun addStillContains!343 (ListLongMap!10983 (_ BitVec 64) V!29985 (_ BitVec 64)) Unit!30804)

(assert (=> b!907794 (= lt!409444 (addStillContains!343 lt!409440 lt!409443 zeroValue!1094 lt!409441))))

(assert (=> b!907794 (contains!4550 (+!2602 lt!409440 (tuple2!12287 lt!409443 zeroValue!1094)) lt!409441)))

(declare-fun lt!409452 () Unit!30804)

(assert (=> b!907794 (= lt!409452 lt!409444)))

(declare-fun lt!409453 () ListLongMap!10983)

(assert (=> b!907794 (= lt!409453 (getCurrentListMapNoExtraKeys!3289 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!409447 () (_ BitVec 64))

(assert (=> b!907794 (= lt!409447 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!409456 () (_ BitVec 64))

(assert (=> b!907794 (= lt!409456 (select (arr!25740 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!409455 () Unit!30804)

(declare-fun addApplyDifferent!343 (ListLongMap!10983 (_ BitVec 64) V!29985 (_ BitVec 64)) Unit!30804)

(assert (=> b!907794 (= lt!409455 (addApplyDifferent!343 lt!409453 lt!409447 minValue!1094 lt!409456))))

(assert (=> b!907794 (= (apply!491 (+!2602 lt!409453 (tuple2!12287 lt!409447 minValue!1094)) lt!409456) (apply!491 lt!409453 lt!409456))))

(declare-fun lt!409454 () Unit!30804)

(assert (=> b!907794 (= lt!409454 lt!409455)))

(declare-fun lt!409458 () ListLongMap!10983)

(assert (=> b!907794 (= lt!409458 (getCurrentListMapNoExtraKeys!3289 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!409446 () (_ BitVec 64))

(assert (=> b!907794 (= lt!409446 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!409449 () (_ BitVec 64))

(assert (=> b!907794 (= lt!409449 (select (arr!25740 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!409448 () Unit!30804)

(assert (=> b!907794 (= lt!409448 (addApplyDifferent!343 lt!409458 lt!409446 zeroValue!1094 lt!409449))))

(assert (=> b!907794 (= (apply!491 (+!2602 lt!409458 (tuple2!12287 lt!409446 zeroValue!1094)) lt!409449) (apply!491 lt!409458 lt!409449))))

(declare-fun lt!409461 () Unit!30804)

(assert (=> b!907794 (= lt!409461 lt!409448)))

(declare-fun lt!409460 () ListLongMap!10983)

(assert (=> b!907794 (= lt!409460 (getCurrentListMapNoExtraKeys!3289 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!409459 () (_ BitVec 64))

(assert (=> b!907794 (= lt!409459 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!409450 () (_ BitVec 64))

(assert (=> b!907794 (= lt!409450 (select (arr!25740 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!907794 (= lt!409445 (addApplyDifferent!343 lt!409460 lt!409459 minValue!1094 lt!409450))))

(assert (=> b!907794 (= (apply!491 (+!2602 lt!409460 (tuple2!12287 lt!409459 minValue!1094)) lt!409450) (apply!491 lt!409460 lt!409450))))

(declare-fun b!907795 () Bool)

(assert (=> b!907795 (= e!508762 (not call!40275))))

(declare-fun bm!40275 () Bool)

(assert (=> bm!40275 (= call!40274 call!40278)))

(declare-fun bm!40276 () Bool)

(assert (=> bm!40276 (= call!40278 (+!2602 (ite c!95680 call!40279 (ite c!95681 call!40273 call!40276)) (ite (or c!95680 c!95681) (tuple2!12287 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12287 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun b!907796 () Bool)

(declare-fun Unit!30809 () Unit!30804)

(assert (=> b!907796 (= e!508765 Unit!30809)))

(assert (= (and d!112103 c!95680) b!907779))

(assert (= (and d!112103 (not c!95680)) b!907778))

(assert (= (and b!907778 c!95681) b!907776))

(assert (= (and b!907778 (not c!95681)) b!907792))

(assert (= (and b!907792 c!95676) b!907782))

(assert (= (and b!907792 (not c!95676)) b!907781))

(assert (= (or b!907782 b!907781) bm!40271))

(assert (= (or b!907776 bm!40271) bm!40272))

(assert (= (or b!907776 b!907782) bm!40275))

(assert (= (or b!907779 bm!40272) bm!40273))

(assert (= (or b!907779 bm!40275) bm!40276))

(assert (= (and d!112103 res!612676) b!907785))

(assert (= (and d!112103 c!95677) b!907794))

(assert (= (and d!112103 (not c!95677)) b!907796))

(assert (= (and d!112103 res!612674) b!907788))

(assert (= (and b!907788 res!612679) b!907783))

(assert (= (and b!907788 (not res!612680)) b!907787))

(assert (= (and b!907787 res!612672) b!907786))

(assert (= (and b!907788 res!612678) b!907789))

(assert (= (and b!907789 c!95679) b!907791))

(assert (= (and b!907789 (not c!95679)) b!907784))

(assert (= (and b!907791 res!612673) b!907793))

(assert (= (or b!907791 b!907784) bm!40274))

(assert (= (and b!907789 res!612677) b!907777))

(assert (= (and b!907777 c!95678) b!907780))

(assert (= (and b!907777 (not c!95678)) b!907795))

(assert (= (and b!907780 res!612675) b!907790))

(assert (= (or b!907780 b!907795) bm!40270))

(declare-fun b_lambda!13227 () Bool)

(assert (=> (not b_lambda!13227) (not b!907786)))

(assert (=> b!907786 t!25604))

(declare-fun b_and!26855 () Bool)

(assert (= b_and!26849 (and (=> t!25604 result!10533) b_and!26855)))

(declare-fun m!843087 () Bool)

(assert (=> b!907793 m!843087))

(assert (=> d!112103 m!842995))

(assert (=> b!907786 m!842979))

(declare-fun m!843089 () Bool)

(assert (=> b!907786 m!843089))

(assert (=> b!907786 m!842979))

(declare-fun m!843091 () Bool)

(assert (=> b!907786 m!843091))

(assert (=> b!907786 m!843055))

(assert (=> b!907786 m!843055))

(declare-fun m!843093 () Bool)

(assert (=> b!907786 m!843093))

(assert (=> b!907786 m!843089))

(assert (=> b!907785 m!843055))

(assert (=> b!907785 m!843055))

(assert (=> b!907785 m!843057))

(declare-fun m!843095 () Bool)

(assert (=> bm!40273 m!843095))

(assert (=> b!907787 m!843055))

(assert (=> b!907787 m!843055))

(declare-fun m!843097 () Bool)

(assert (=> b!907787 m!843097))

(declare-fun m!843099 () Bool)

(assert (=> b!907779 m!843099))

(declare-fun m!843101 () Bool)

(assert (=> b!907790 m!843101))

(declare-fun m!843103 () Bool)

(assert (=> bm!40274 m!843103))

(assert (=> b!907783 m!843055))

(assert (=> b!907783 m!843055))

(assert (=> b!907783 m!843057))

(declare-fun m!843105 () Bool)

(assert (=> b!907794 m!843105))

(declare-fun m!843107 () Bool)

(assert (=> b!907794 m!843107))

(declare-fun m!843109 () Bool)

(assert (=> b!907794 m!843109))

(assert (=> b!907794 m!843055))

(declare-fun m!843111 () Bool)

(assert (=> b!907794 m!843111))

(declare-fun m!843113 () Bool)

(assert (=> b!907794 m!843113))

(declare-fun m!843115 () Bool)

(assert (=> b!907794 m!843115))

(declare-fun m!843117 () Bool)

(assert (=> b!907794 m!843117))

(assert (=> b!907794 m!843115))

(assert (=> b!907794 m!843105))

(declare-fun m!843119 () Bool)

(assert (=> b!907794 m!843119))

(declare-fun m!843121 () Bool)

(assert (=> b!907794 m!843121))

(assert (=> b!907794 m!843111))

(declare-fun m!843123 () Bool)

(assert (=> b!907794 m!843123))

(declare-fun m!843125 () Bool)

(assert (=> b!907794 m!843125))

(declare-fun m!843127 () Bool)

(assert (=> b!907794 m!843127))

(assert (=> b!907794 m!843123))

(declare-fun m!843129 () Bool)

(assert (=> b!907794 m!843129))

(assert (=> b!907794 m!843095))

(declare-fun m!843131 () Bool)

(assert (=> b!907794 m!843131))

(declare-fun m!843133 () Bool)

(assert (=> b!907794 m!843133))

(declare-fun m!843135 () Bool)

(assert (=> bm!40276 m!843135))

(declare-fun m!843137 () Bool)

(assert (=> bm!40270 m!843137))

(assert (=> b!907632 d!112103))

(declare-fun d!112105 () Bool)

(declare-fun get!13546 (Option!475) V!29985)

(assert (=> d!112105 (= (apply!491 lt!409356 k0!1033) (get!13546 (getValueByKey!469 (toList!5507 lt!409356) k0!1033)))))

(declare-fun bs!25491 () Bool)

(assert (= bs!25491 d!112105))

(declare-fun m!843139 () Bool)

(assert (=> bs!25491 m!843139))

(assert (=> bs!25491 m!843139))

(declare-fun m!843141 () Bool)

(assert (=> bs!25491 m!843141))

(assert (=> b!907628 d!112105))

(declare-fun d!112107 () Bool)

(declare-fun e!508769 () Bool)

(assert (=> d!112107 e!508769))

(declare-fun res!612681 () Bool)

(assert (=> d!112107 (=> res!612681 e!508769)))

(declare-fun lt!409465 () Bool)

(assert (=> d!112107 (= res!612681 (not lt!409465))))

(declare-fun lt!409462 () Bool)

(assert (=> d!112107 (= lt!409465 lt!409462)))

(declare-fun lt!409463 () Unit!30804)

(declare-fun e!508768 () Unit!30804)

(assert (=> d!112107 (= lt!409463 e!508768)))

(declare-fun c!95682 () Bool)

(assert (=> d!112107 (= c!95682 lt!409462)))

(assert (=> d!112107 (= lt!409462 (containsKey!436 (toList!5507 lt!409356) k0!1033))))

(assert (=> d!112107 (= (contains!4550 lt!409356 k0!1033) lt!409465)))

(declare-fun b!907797 () Bool)

(declare-fun lt!409464 () Unit!30804)

(assert (=> b!907797 (= e!508768 lt!409464)))

(assert (=> b!907797 (= lt!409464 (lemmaContainsKeyImpliesGetValueByKeyDefined!332 (toList!5507 lt!409356) k0!1033))))

(assert (=> b!907797 (isDefined!341 (getValueByKey!469 (toList!5507 lt!409356) k0!1033))))

(declare-fun b!907798 () Bool)

(declare-fun Unit!30810 () Unit!30804)

(assert (=> b!907798 (= e!508768 Unit!30810)))

(declare-fun b!907799 () Bool)

(assert (=> b!907799 (= e!508769 (isDefined!341 (getValueByKey!469 (toList!5507 lt!409356) k0!1033)))))

(assert (= (and d!112107 c!95682) b!907797))

(assert (= (and d!112107 (not c!95682)) b!907798))

(assert (= (and d!112107 (not res!612681)) b!907799))

(declare-fun m!843143 () Bool)

(assert (=> d!112107 m!843143))

(declare-fun m!843145 () Bool)

(assert (=> b!907797 m!843145))

(assert (=> b!907797 m!843139))

(assert (=> b!907797 m!843139))

(declare-fun m!843147 () Bool)

(assert (=> b!907797 m!843147))

(assert (=> b!907799 m!843139))

(assert (=> b!907799 m!843139))

(assert (=> b!907799 m!843147))

(assert (=> b!907627 d!112107))

(declare-fun b!907800 () Bool)

(declare-fun e!508779 () ListLongMap!10983)

(declare-fun call!40281 () ListLongMap!10983)

(assert (=> b!907800 (= e!508779 call!40281)))

(declare-fun d!112109 () Bool)

(declare-fun e!508782 () Bool)

(assert (=> d!112109 e!508782))

(declare-fun res!612684 () Bool)

(assert (=> d!112109 (=> (not res!612684) (not e!508782))))

(assert (=> d!112109 (= res!612684 (or (bvsge i!717 (size!26199 _keys!1386)) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26199 _keys!1386)))))))

(declare-fun lt!409468 () ListLongMap!10983)

(declare-fun lt!409477 () ListLongMap!10983)

(assert (=> d!112109 (= lt!409468 lt!409477)))

(declare-fun lt!409483 () Unit!30804)

(declare-fun e!508780 () Unit!30804)

(assert (=> d!112109 (= lt!409483 e!508780)))

(declare-fun c!95684 () Bool)

(declare-fun e!508772 () Bool)

(assert (=> d!112109 (= c!95684 e!508772)))

(declare-fun res!612686 () Bool)

(assert (=> d!112109 (=> (not res!612686) (not e!508772))))

(assert (=> d!112109 (= res!612686 (bvslt i!717 (size!26199 _keys!1386)))))

(declare-fun e!508775 () ListLongMap!10983)

(assert (=> d!112109 (= lt!409477 e!508775)))

(declare-fun c!95687 () Bool)

(assert (=> d!112109 (= c!95687 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112109 (validMask!0 mask!1756)))

(assert (=> d!112109 (= (getCurrentListMap!2771 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160) lt!409468)))

(declare-fun b!907801 () Bool)

(declare-fun e!508777 () Bool)

(assert (=> b!907801 (= e!508782 e!508777)))

(declare-fun c!95685 () Bool)

(assert (=> b!907801 (= c!95685 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40277 () Bool)

(declare-fun call!40282 () Bool)

(assert (=> bm!40277 (= call!40282 (contains!4550 lt!409468 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40278 () Bool)

(declare-fun call!40283 () ListLongMap!10983)

(declare-fun call!40280 () ListLongMap!10983)

(assert (=> bm!40278 (= call!40283 call!40280)))

(declare-fun b!907802 () Bool)

(assert (=> b!907802 (= e!508775 e!508779)))

(declare-fun c!95688 () Bool)

(assert (=> b!907802 (= c!95688 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!907803 () Bool)

(declare-fun call!40285 () ListLongMap!10983)

(assert (=> b!907803 (= e!508775 (+!2602 call!40285 (tuple2!12287 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun b!907804 () Bool)

(declare-fun e!508781 () Bool)

(assert (=> b!907804 (= e!508777 e!508781)))

(declare-fun res!612685 () Bool)

(assert (=> b!907804 (= res!612685 call!40282)))

(assert (=> b!907804 (=> (not res!612685) (not e!508781))))

(declare-fun b!907805 () Bool)

(declare-fun e!508778 () ListLongMap!10983)

(assert (=> b!907805 (= e!508778 call!40283)))

(declare-fun b!907806 () Bool)

(assert (=> b!907806 (= e!508778 call!40281)))

(declare-fun b!907807 () Bool)

(declare-fun e!508776 () Bool)

(assert (=> b!907807 (= e!508776 (validKeyInArray!0 (select (arr!25740 _keys!1386) i!717)))))

(declare-fun b!907808 () Bool)

(declare-fun e!508773 () Bool)

(declare-fun call!40284 () Bool)

(assert (=> b!907808 (= e!508773 (not call!40284))))

(declare-fun b!907809 () Bool)

(assert (=> b!907809 (= e!508772 (validKeyInArray!0 (select (arr!25740 _keys!1386) i!717)))))

(declare-fun b!907810 () Bool)

(declare-fun e!508774 () Bool)

(assert (=> b!907810 (= e!508774 (= (apply!491 lt!409468 (select (arr!25740 _keys!1386) i!717)) (get!13542 (select (arr!25741 _values!1152) i!717) (dynLambda!1366 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!907810 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26200 _values!1152)))))

(assert (=> b!907810 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26199 _keys!1386)))))

(declare-fun b!907811 () Bool)

(declare-fun e!508771 () Bool)

(assert (=> b!907811 (= e!508771 e!508774)))

(declare-fun res!612682 () Bool)

(assert (=> b!907811 (=> (not res!612682) (not e!508774))))

(assert (=> b!907811 (= res!612682 (contains!4550 lt!409468 (select (arr!25740 _keys!1386) i!717)))))

(assert (=> b!907811 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26199 _keys!1386)))))

(declare-fun bm!40279 () Bool)

(declare-fun call!40286 () ListLongMap!10983)

(assert (=> bm!40279 (= call!40280 call!40286)))

(declare-fun b!907812 () Bool)

(declare-fun res!612688 () Bool)

(assert (=> b!907812 (=> (not res!612688) (not e!508782))))

(assert (=> b!907812 (= res!612688 e!508771)))

(declare-fun res!612690 () Bool)

(assert (=> b!907812 (=> res!612690 e!508771)))

(assert (=> b!907812 (= res!612690 (not e!508776))))

(declare-fun res!612689 () Bool)

(assert (=> b!907812 (=> (not res!612689) (not e!508776))))

(assert (=> b!907812 (= res!612689 (bvslt i!717 (size!26199 _keys!1386)))))

(declare-fun bm!40280 () Bool)

(assert (=> bm!40280 (= call!40286 (getCurrentListMapNoExtraKeys!3289 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!907813 () Bool)

(declare-fun res!612687 () Bool)

(assert (=> b!907813 (=> (not res!612687) (not e!508782))))

(assert (=> b!907813 (= res!612687 e!508773)))

(declare-fun c!95686 () Bool)

(assert (=> b!907813 (= c!95686 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!907814 () Bool)

(assert (=> b!907814 (= e!508781 (= (apply!491 lt!409468 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!907815 () Bool)

(declare-fun e!508770 () Bool)

(assert (=> b!907815 (= e!508773 e!508770)))

(declare-fun res!612683 () Bool)

(assert (=> b!907815 (= res!612683 call!40284)))

(assert (=> b!907815 (=> (not res!612683) (not e!508770))))

(declare-fun b!907816 () Bool)

(declare-fun c!95683 () Bool)

(assert (=> b!907816 (= c!95683 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!907816 (= e!508779 e!508778)))

(declare-fun b!907817 () Bool)

(assert (=> b!907817 (= e!508770 (= (apply!491 lt!409468 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun bm!40281 () Bool)

(assert (=> bm!40281 (= call!40284 (contains!4550 lt!409468 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!907818 () Bool)

(declare-fun lt!409471 () Unit!30804)

(assert (=> b!907818 (= e!508780 lt!409471)))

(declare-fun lt!409466 () ListLongMap!10983)

(assert (=> b!907818 (= lt!409466 (getCurrentListMapNoExtraKeys!3289 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!409469 () (_ BitVec 64))

(assert (=> b!907818 (= lt!409469 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!409467 () (_ BitVec 64))

(assert (=> b!907818 (= lt!409467 (select (arr!25740 _keys!1386) i!717))))

(declare-fun lt!409470 () Unit!30804)

(assert (=> b!907818 (= lt!409470 (addStillContains!343 lt!409466 lt!409469 zeroValue!1094 lt!409467))))

(assert (=> b!907818 (contains!4550 (+!2602 lt!409466 (tuple2!12287 lt!409469 zeroValue!1094)) lt!409467)))

(declare-fun lt!409478 () Unit!30804)

(assert (=> b!907818 (= lt!409478 lt!409470)))

(declare-fun lt!409479 () ListLongMap!10983)

(assert (=> b!907818 (= lt!409479 (getCurrentListMapNoExtraKeys!3289 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!409473 () (_ BitVec 64))

(assert (=> b!907818 (= lt!409473 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!409482 () (_ BitVec 64))

(assert (=> b!907818 (= lt!409482 (select (arr!25740 _keys!1386) i!717))))

(declare-fun lt!409481 () Unit!30804)

(assert (=> b!907818 (= lt!409481 (addApplyDifferent!343 lt!409479 lt!409473 minValue!1094 lt!409482))))

(assert (=> b!907818 (= (apply!491 (+!2602 lt!409479 (tuple2!12287 lt!409473 minValue!1094)) lt!409482) (apply!491 lt!409479 lt!409482))))

(declare-fun lt!409480 () Unit!30804)

(assert (=> b!907818 (= lt!409480 lt!409481)))

(declare-fun lt!409484 () ListLongMap!10983)

(assert (=> b!907818 (= lt!409484 (getCurrentListMapNoExtraKeys!3289 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!409472 () (_ BitVec 64))

(assert (=> b!907818 (= lt!409472 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!409475 () (_ BitVec 64))

(assert (=> b!907818 (= lt!409475 (select (arr!25740 _keys!1386) i!717))))

(declare-fun lt!409474 () Unit!30804)

(assert (=> b!907818 (= lt!409474 (addApplyDifferent!343 lt!409484 lt!409472 zeroValue!1094 lt!409475))))

(assert (=> b!907818 (= (apply!491 (+!2602 lt!409484 (tuple2!12287 lt!409472 zeroValue!1094)) lt!409475) (apply!491 lt!409484 lt!409475))))

(declare-fun lt!409487 () Unit!30804)

(assert (=> b!907818 (= lt!409487 lt!409474)))

(declare-fun lt!409486 () ListLongMap!10983)

(assert (=> b!907818 (= lt!409486 (getCurrentListMapNoExtraKeys!3289 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!409485 () (_ BitVec 64))

(assert (=> b!907818 (= lt!409485 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!409476 () (_ BitVec 64))

(assert (=> b!907818 (= lt!409476 (select (arr!25740 _keys!1386) i!717))))

(assert (=> b!907818 (= lt!409471 (addApplyDifferent!343 lt!409486 lt!409485 minValue!1094 lt!409476))))

(assert (=> b!907818 (= (apply!491 (+!2602 lt!409486 (tuple2!12287 lt!409485 minValue!1094)) lt!409476) (apply!491 lt!409486 lt!409476))))

(declare-fun b!907819 () Bool)

(assert (=> b!907819 (= e!508777 (not call!40282))))

(declare-fun bm!40282 () Bool)

(assert (=> bm!40282 (= call!40281 call!40285)))

(declare-fun bm!40283 () Bool)

(assert (=> bm!40283 (= call!40285 (+!2602 (ite c!95687 call!40286 (ite c!95688 call!40280 call!40283)) (ite (or c!95687 c!95688) (tuple2!12287 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12287 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun b!907820 () Bool)

(declare-fun Unit!30811 () Unit!30804)

(assert (=> b!907820 (= e!508780 Unit!30811)))

(assert (= (and d!112109 c!95687) b!907803))

(assert (= (and d!112109 (not c!95687)) b!907802))

(assert (= (and b!907802 c!95688) b!907800))

(assert (= (and b!907802 (not c!95688)) b!907816))

(assert (= (and b!907816 c!95683) b!907806))

(assert (= (and b!907816 (not c!95683)) b!907805))

(assert (= (or b!907806 b!907805) bm!40278))

(assert (= (or b!907800 bm!40278) bm!40279))

(assert (= (or b!907800 b!907806) bm!40282))

(assert (= (or b!907803 bm!40279) bm!40280))

(assert (= (or b!907803 bm!40282) bm!40283))

(assert (= (and d!112109 res!612686) b!907809))

(assert (= (and d!112109 c!95684) b!907818))

(assert (= (and d!112109 (not c!95684)) b!907820))

(assert (= (and d!112109 res!612684) b!907812))

(assert (= (and b!907812 res!612689) b!907807))

(assert (= (and b!907812 (not res!612690)) b!907811))

(assert (= (and b!907811 res!612682) b!907810))

(assert (= (and b!907812 res!612688) b!907813))

(assert (= (and b!907813 c!95686) b!907815))

(assert (= (and b!907813 (not c!95686)) b!907808))

(assert (= (and b!907815 res!612683) b!907817))

(assert (= (or b!907815 b!907808) bm!40281))

(assert (= (and b!907813 res!612687) b!907801))

(assert (= (and b!907801 c!95685) b!907804))

(assert (= (and b!907801 (not c!95685)) b!907819))

(assert (= (and b!907804 res!612685) b!907814))

(assert (= (or b!907804 b!907819) bm!40277))

(declare-fun b_lambda!13229 () Bool)

(assert (=> (not b_lambda!13229) (not b!907810)))

(assert (=> b!907810 t!25604))

(declare-fun b_and!26857 () Bool)

(assert (= b_and!26855 (and (=> t!25604 result!10533) b_and!26857)))

(declare-fun m!843149 () Bool)

(assert (=> b!907817 m!843149))

(assert (=> d!112109 m!842995))

(assert (=> b!907810 m!842979))

(assert (=> b!907810 m!842975))

(assert (=> b!907810 m!842979))

(assert (=> b!907810 m!842983))

(assert (=> b!907810 m!842985))

(assert (=> b!907810 m!842985))

(declare-fun m!843151 () Bool)

(assert (=> b!907810 m!843151))

(assert (=> b!907810 m!842975))

(assert (=> b!907809 m!842985))

(assert (=> b!907809 m!842985))

(declare-fun m!843153 () Bool)

(assert (=> b!907809 m!843153))

(declare-fun m!843155 () Bool)

(assert (=> bm!40280 m!843155))

(assert (=> b!907811 m!842985))

(assert (=> b!907811 m!842985))

(declare-fun m!843157 () Bool)

(assert (=> b!907811 m!843157))

(declare-fun m!843159 () Bool)

(assert (=> b!907803 m!843159))

(declare-fun m!843161 () Bool)

(assert (=> b!907814 m!843161))

(declare-fun m!843163 () Bool)

(assert (=> bm!40281 m!843163))

(assert (=> b!907807 m!842985))

(assert (=> b!907807 m!842985))

(assert (=> b!907807 m!843153))

(declare-fun m!843165 () Bool)

(assert (=> b!907818 m!843165))

(declare-fun m!843167 () Bool)

(assert (=> b!907818 m!843167))

(declare-fun m!843169 () Bool)

(assert (=> b!907818 m!843169))

(assert (=> b!907818 m!842985))

(declare-fun m!843171 () Bool)

(assert (=> b!907818 m!843171))

(declare-fun m!843173 () Bool)

(assert (=> b!907818 m!843173))

(declare-fun m!843175 () Bool)

(assert (=> b!907818 m!843175))

(declare-fun m!843177 () Bool)

(assert (=> b!907818 m!843177))

(assert (=> b!907818 m!843175))

(assert (=> b!907818 m!843165))

(declare-fun m!843179 () Bool)

(assert (=> b!907818 m!843179))

(declare-fun m!843181 () Bool)

(assert (=> b!907818 m!843181))

(assert (=> b!907818 m!843171))

(declare-fun m!843183 () Bool)

(assert (=> b!907818 m!843183))

(declare-fun m!843185 () Bool)

(assert (=> b!907818 m!843185))

(declare-fun m!843187 () Bool)

(assert (=> b!907818 m!843187))

(assert (=> b!907818 m!843183))

(declare-fun m!843189 () Bool)

(assert (=> b!907818 m!843189))

(assert (=> b!907818 m!843155))

(declare-fun m!843191 () Bool)

(assert (=> b!907818 m!843191))

(declare-fun m!843193 () Bool)

(assert (=> b!907818 m!843193))

(declare-fun m!843195 () Bool)

(assert (=> bm!40283 m!843195))

(declare-fun m!843197 () Bool)

(assert (=> bm!40277 m!843197))

(assert (=> b!907627 d!112109))

(declare-fun d!112111 () Bool)

(assert (=> d!112111 (= (apply!491 lt!409354 k0!1033) (get!13546 (getValueByKey!469 (toList!5507 lt!409354) k0!1033)))))

(declare-fun bs!25492 () Bool)

(assert (= bs!25492 d!112111))

(assert (=> bs!25492 m!843083))

(assert (=> bs!25492 m!843083))

(declare-fun m!843199 () Bool)

(assert (=> bs!25492 m!843199))

(assert (=> b!907626 d!112111))

(declare-fun d!112113 () Bool)

(declare-fun e!508785 () Bool)

(assert (=> d!112113 e!508785))

(declare-fun res!612693 () Bool)

(assert (=> d!112113 (=> (not res!612693) (not e!508785))))

(assert (=> d!112113 (= res!612693 (contains!4550 (getCurrentListMap!2771 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun lt!409490 () Unit!30804)

(declare-fun choose!1528 (array!53562 array!53564 (_ BitVec 32) (_ BitVec 32) V!29985 V!29985 (_ BitVec 64) V!29985 (_ BitVec 32) Int) Unit!30804)

(assert (=> d!112113 (= lt!409490 (choose!1528 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409352 i!717 defaultEntry!1160))))

(assert (=> d!112113 (validMask!0 mask!1756)))

(assert (=> d!112113 (= (lemmaListMapApplyFromThenApplyFromZero!44 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409352 i!717 defaultEntry!1160) lt!409490)))

(declare-fun b!907823 () Bool)

(assert (=> b!907823 (= e!508785 (= (apply!491 (getCurrentListMap!2771 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033) lt!409352))))

(assert (= (and d!112113 res!612693) b!907823))

(assert (=> d!112113 m!842989))

(assert (=> d!112113 m!842989))

(declare-fun m!843201 () Bool)

(assert (=> d!112113 m!843201))

(declare-fun m!843203 () Bool)

(assert (=> d!112113 m!843203))

(assert (=> d!112113 m!842995))

(assert (=> b!907823 m!842989))

(assert (=> b!907823 m!842989))

(declare-fun m!843205 () Bool)

(assert (=> b!907823 m!843205))

(assert (=> b!907626 d!112113))

(declare-fun d!112115 () Bool)

(assert (=> d!112115 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!77762 d!112115))

(declare-fun d!112117 () Bool)

(assert (=> d!112117 (= (array_inv!20154 _values!1152) (bvsge (size!26200 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!77762 d!112117))

(declare-fun d!112119 () Bool)

(assert (=> d!112119 (= (array_inv!20155 _keys!1386) (bvsge (size!26199 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!77762 d!112119))

(declare-fun mapIsEmpty!29866 () Bool)

(declare-fun mapRes!29866 () Bool)

(assert (=> mapIsEmpty!29866 mapRes!29866))

(declare-fun condMapEmpty!29866 () Bool)

(declare-fun mapDefault!29866 () ValueCell!8901)

(assert (=> mapNonEmpty!29860 (= condMapEmpty!29866 (= mapRest!29860 ((as const (Array (_ BitVec 32) ValueCell!8901)) mapDefault!29866)))))

(declare-fun e!508791 () Bool)

(assert (=> mapNonEmpty!29860 (= tp!57302 (and e!508791 mapRes!29866))))

(declare-fun mapNonEmpty!29866 () Bool)

(declare-fun tp!57312 () Bool)

(declare-fun e!508790 () Bool)

(assert (=> mapNonEmpty!29866 (= mapRes!29866 (and tp!57312 e!508790))))

(declare-fun mapValue!29866 () ValueCell!8901)

(declare-fun mapKey!29866 () (_ BitVec 32))

(declare-fun mapRest!29866 () (Array (_ BitVec 32) ValueCell!8901))

(assert (=> mapNonEmpty!29866 (= mapRest!29860 (store mapRest!29866 mapKey!29866 mapValue!29866))))

(declare-fun b!907830 () Bool)

(assert (=> b!907830 (= e!508790 tp_is_empty!18765)))

(declare-fun b!907831 () Bool)

(assert (=> b!907831 (= e!508791 tp_is_empty!18765)))

(assert (= (and mapNonEmpty!29860 condMapEmpty!29866) mapIsEmpty!29866))

(assert (= (and mapNonEmpty!29860 (not condMapEmpty!29866)) mapNonEmpty!29866))

(assert (= (and mapNonEmpty!29866 ((_ is ValueCellFull!8901) mapValue!29866)) b!907830))

(assert (= (and mapNonEmpty!29860 ((_ is ValueCellFull!8901) mapDefault!29866)) b!907831))

(declare-fun m!843207 () Bool)

(assert (=> mapNonEmpty!29866 m!843207))

(declare-fun b_lambda!13231 () Bool)

(assert (= b_lambda!13227 (or (and start!77762 b_free!16347) b_lambda!13231)))

(declare-fun b_lambda!13233 () Bool)

(assert (= b_lambda!13229 (or (and start!77762 b_free!16347) b_lambda!13233)))

(check-sat (not b!907724) (not bm!40270) (not b!907779) (not b!907818) (not b!907785) (not bm!40280) (not b!907731) (not d!112109) (not b!907807) (not bm!40273) (not b!907797) (not d!112105) (not b!907823) (not d!112113) (not b_next!16347) (not b!907721) b_and!26857 (not b!907733) (not mapNonEmpty!29866) (not b!907790) (not d!112103) (not b!907799) (not b_lambda!13231) (not b!907696) (not b!907708) (not b!907697) (not b!907809) (not d!112095) (not b!907803) (not b!907810) (not b!907787) (not bm!40252) (not d!112101) (not b!907703) (not d!112111) (not b!907786) (not bm!40283) (not b!907783) (not bm!40274) (not b!907811) (not bm!40255) (not b!907688) (not b!907814) (not bm!40277) (not b!907817) (not b_lambda!13233) (not b_lambda!13225) (not b!907793) (not bm!40276) tp_is_empty!18765 (not bm!40281) (not b!907794) (not b!907689) (not d!112107) (not b!907720))
(check-sat b_and!26857 (not b_next!16347))
