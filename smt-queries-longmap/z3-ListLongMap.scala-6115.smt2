; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78966 () Bool)

(assert start!78966)

(declare-fun b_free!17011 () Bool)

(declare-fun b_next!17011 () Bool)

(assert (=> start!78966 (= b_free!17011 (not b_next!17011))))

(declare-fun tp!59475 () Bool)

(declare-fun b_and!27769 () Bool)

(assert (=> start!78966 (= tp!59475 b_and!27769)))

(declare-fun b!920708 () Bool)

(declare-fun res!620576 () Bool)

(declare-fun e!516859 () Bool)

(assert (=> b!920708 (=> (not res!620576) (not e!516859))))

(declare-datatypes ((array!55067 0))(
  ( (array!55068 (arr!26474 (Array (_ BitVec 32) (_ BitVec 64))) (size!26934 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55067)

(declare-datatypes ((List!18549 0))(
  ( (Nil!18546) (Cons!18545 (h!19697 (_ BitVec 64)) (t!26282 List!18549)) )
))
(declare-fun arrayNoDuplicates!0 (array!55067 (_ BitVec 32) List!18549) Bool)

(assert (=> b!920708 (= res!620576 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18546))))

(declare-fun b!920709 () Bool)

(declare-fun e!516860 () Bool)

(assert (=> b!920709 (= e!516860 (not true))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!920709 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18546)))

(declare-datatypes ((Unit!31046 0))(
  ( (Unit!31047) )
))
(declare-fun lt!413254 () Unit!31046)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55067 (_ BitVec 32) (_ BitVec 32)) Unit!31046)

(assert (=> b!920709 (= lt!413254 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((V!30991 0))(
  ( (V!30992 (val!9810 Int)) )
))
(declare-datatypes ((tuple2!12732 0))(
  ( (tuple2!12733 (_1!6377 (_ BitVec 64)) (_2!6377 V!30991)) )
))
(declare-datatypes ((List!18550 0))(
  ( (Nil!18547) (Cons!18546 (h!19698 tuple2!12732) (t!26283 List!18550)) )
))
(declare-datatypes ((ListLongMap!11431 0))(
  ( (ListLongMap!11432 (toList!5731 List!18550)) )
))
(declare-fun lt!413252 () ListLongMap!11431)

(declare-fun lt!413253 () tuple2!12732)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4784 (ListLongMap!11431 (_ BitVec 64)) Bool)

(declare-fun +!2667 (ListLongMap!11431 tuple2!12732) ListLongMap!11431)

(assert (=> b!920709 (contains!4784 (+!2667 lt!413252 lt!413253) k0!1099)))

(declare-fun lt!413257 () Unit!31046)

(declare-fun lt!413255 () (_ BitVec 64))

(declare-fun lt!413258 () V!30991)

(declare-fun addStillContains!376 (ListLongMap!11431 (_ BitVec 64) V!30991 (_ BitVec 64)) Unit!31046)

(assert (=> b!920709 (= lt!413257 (addStillContains!376 lt!413252 lt!413255 lt!413258 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9278 0))(
  ( (ValueCellFull!9278 (v!12325 V!30991)) (EmptyCell!9278) )
))
(declare-datatypes ((array!55069 0))(
  ( (array!55070 (arr!26475 (Array (_ BitVec 32) ValueCell!9278)) (size!26935 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55069)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30991)

(declare-fun minValue!1173 () V!30991)

(declare-fun getCurrentListMap!2984 (array!55067 array!55069 (_ BitVec 32) (_ BitVec 32) V!30991 V!30991 (_ BitVec 32) Int) ListLongMap!11431)

(assert (=> b!920709 (= (getCurrentListMap!2984 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2667 (getCurrentListMap!2984 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413253))))

(assert (=> b!920709 (= lt!413253 (tuple2!12733 lt!413255 lt!413258))))

(declare-fun get!13906 (ValueCell!9278 V!30991) V!30991)

(declare-fun dynLambda!1464 (Int (_ BitVec 64)) V!30991)

(assert (=> b!920709 (= lt!413258 (get!13906 (select (arr!26475 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1464 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413256 () Unit!31046)

(declare-fun lemmaListMapRecursiveValidKeyArray!47 (array!55067 array!55069 (_ BitVec 32) (_ BitVec 32) V!30991 V!30991 (_ BitVec 32) Int) Unit!31046)

(assert (=> b!920709 (= lt!413256 (lemmaListMapRecursiveValidKeyArray!47 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!920710 () Bool)

(declare-fun res!620574 () Bool)

(assert (=> b!920710 (=> (not res!620574) (not e!516859))))

(assert (=> b!920710 (= res!620574 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26934 _keys!1487))))))

(declare-fun b!920711 () Bool)

(declare-fun e!516862 () Bool)

(declare-fun tp_is_empty!19519 () Bool)

(assert (=> b!920711 (= e!516862 tp_is_empty!19519)))

(declare-fun b!920712 () Bool)

(declare-fun res!620577 () Bool)

(assert (=> b!920712 (=> (not res!620577) (not e!516859))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55067 (_ BitVec 32)) Bool)

(assert (=> b!920712 (= res!620577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!920713 () Bool)

(declare-fun res!620575 () Bool)

(declare-fun e!516858 () Bool)

(assert (=> b!920713 (=> (not res!620575) (not e!516858))))

(assert (=> b!920713 (= res!620575 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!31035 () Bool)

(declare-fun mapRes!31035 () Bool)

(assert (=> mapIsEmpty!31035 mapRes!31035))

(declare-fun b!920714 () Bool)

(declare-fun e!516861 () Bool)

(assert (=> b!920714 (= e!516861 tp_is_empty!19519)))

(declare-fun b!920715 () Bool)

(assert (=> b!920715 (= e!516858 e!516860)))

(declare-fun res!620580 () Bool)

(assert (=> b!920715 (=> (not res!620580) (not e!516860))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920715 (= res!620580 (validKeyInArray!0 lt!413255))))

(assert (=> b!920715 (= lt!413255 (select (arr!26474 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapNonEmpty!31035 () Bool)

(declare-fun tp!59474 () Bool)

(assert (=> mapNonEmpty!31035 (= mapRes!31035 (and tp!59474 e!516861))))

(declare-fun mapValue!31035 () ValueCell!9278)

(declare-fun mapKey!31035 () (_ BitVec 32))

(declare-fun mapRest!31035 () (Array (_ BitVec 32) ValueCell!9278))

(assert (=> mapNonEmpty!31035 (= (arr!26475 _values!1231) (store mapRest!31035 mapKey!31035 mapValue!31035))))

(declare-fun b!920716 () Bool)

(declare-fun res!620581 () Bool)

(assert (=> b!920716 (=> (not res!620581) (not e!516858))))

(declare-fun v!791 () V!30991)

(declare-fun apply!601 (ListLongMap!11431 (_ BitVec 64)) V!30991)

(assert (=> b!920716 (= res!620581 (= (apply!601 lt!413252 k0!1099) v!791))))

(declare-fun b!920717 () Bool)

(declare-fun e!516856 () Bool)

(assert (=> b!920717 (= e!516856 (and e!516862 mapRes!31035))))

(declare-fun condMapEmpty!31035 () Bool)

(declare-fun mapDefault!31035 () ValueCell!9278)

(assert (=> b!920717 (= condMapEmpty!31035 (= (arr!26475 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9278)) mapDefault!31035)))))

(declare-fun b!920718 () Bool)

(declare-fun res!620583 () Bool)

(assert (=> b!920718 (=> (not res!620583) (not e!516859))))

(assert (=> b!920718 (= res!620583 (and (= (size!26935 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26934 _keys!1487) (size!26935 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!920719 () Bool)

(declare-fun res!620579 () Bool)

(assert (=> b!920719 (=> (not res!620579) (not e!516858))))

(assert (=> b!920719 (= res!620579 (validKeyInArray!0 k0!1099))))

(declare-fun res!620582 () Bool)

(assert (=> start!78966 (=> (not res!620582) (not e!516859))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78966 (= res!620582 (validMask!0 mask!1881))))

(assert (=> start!78966 e!516859))

(assert (=> start!78966 true))

(assert (=> start!78966 tp_is_empty!19519))

(declare-fun array_inv!20726 (array!55069) Bool)

(assert (=> start!78966 (and (array_inv!20726 _values!1231) e!516856)))

(assert (=> start!78966 tp!59475))

(declare-fun array_inv!20727 (array!55067) Bool)

(assert (=> start!78966 (array_inv!20727 _keys!1487)))

(declare-fun b!920720 () Bool)

(assert (=> b!920720 (= e!516859 e!516858)))

(declare-fun res!620578 () Bool)

(assert (=> b!920720 (=> (not res!620578) (not e!516858))))

(assert (=> b!920720 (= res!620578 (contains!4784 lt!413252 k0!1099))))

(assert (=> b!920720 (= lt!413252 (getCurrentListMap!2984 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(assert (= (and start!78966 res!620582) b!920718))

(assert (= (and b!920718 res!620583) b!920712))

(assert (= (and b!920712 res!620577) b!920708))

(assert (= (and b!920708 res!620576) b!920710))

(assert (= (and b!920710 res!620574) b!920720))

(assert (= (and b!920720 res!620578) b!920716))

(assert (= (and b!920716 res!620581) b!920713))

(assert (= (and b!920713 res!620575) b!920719))

(assert (= (and b!920719 res!620579) b!920715))

(assert (= (and b!920715 res!620580) b!920709))

(assert (= (and b!920717 condMapEmpty!31035) mapIsEmpty!31035))

(assert (= (and b!920717 (not condMapEmpty!31035)) mapNonEmpty!31035))

(get-info :version)

(assert (= (and mapNonEmpty!31035 ((_ is ValueCellFull!9278) mapValue!31035)) b!920714))

(assert (= (and b!920717 ((_ is ValueCellFull!9278) mapDefault!31035)) b!920711))

(assert (= start!78966 b!920717))

(declare-fun b_lambda!13527 () Bool)

(assert (=> (not b_lambda!13527) (not b!920709)))

(declare-fun t!26281 () Bool)

(declare-fun tb!5583 () Bool)

(assert (=> (and start!78966 (= defaultEntry!1235 defaultEntry!1235) t!26281) tb!5583))

(declare-fun result!10997 () Bool)

(assert (=> tb!5583 (= result!10997 tp_is_empty!19519)))

(assert (=> b!920709 t!26281))

(declare-fun b_and!27771 () Bool)

(assert (= b_and!27769 (and (=> t!26281 result!10997) b_and!27771)))

(declare-fun m!854941 () Bool)

(assert (=> b!920719 m!854941))

(declare-fun m!854943 () Bool)

(assert (=> mapNonEmpty!31035 m!854943))

(declare-fun m!854945 () Bool)

(assert (=> start!78966 m!854945))

(declare-fun m!854947 () Bool)

(assert (=> start!78966 m!854947))

(declare-fun m!854949 () Bool)

(assert (=> start!78966 m!854949))

(declare-fun m!854951 () Bool)

(assert (=> b!920716 m!854951))

(declare-fun m!854953 () Bool)

(assert (=> b!920708 m!854953))

(declare-fun m!854955 () Bool)

(assert (=> b!920709 m!854955))

(declare-fun m!854957 () Bool)

(assert (=> b!920709 m!854957))

(declare-fun m!854959 () Bool)

(assert (=> b!920709 m!854959))

(declare-fun m!854961 () Bool)

(assert (=> b!920709 m!854961))

(declare-fun m!854963 () Bool)

(assert (=> b!920709 m!854963))

(assert (=> b!920709 m!854957))

(assert (=> b!920709 m!854959))

(declare-fun m!854965 () Bool)

(assert (=> b!920709 m!854965))

(declare-fun m!854967 () Bool)

(assert (=> b!920709 m!854967))

(declare-fun m!854969 () Bool)

(assert (=> b!920709 m!854969))

(assert (=> b!920709 m!854961))

(declare-fun m!854971 () Bool)

(assert (=> b!920709 m!854971))

(assert (=> b!920709 m!854955))

(declare-fun m!854973 () Bool)

(assert (=> b!920709 m!854973))

(declare-fun m!854975 () Bool)

(assert (=> b!920709 m!854975))

(declare-fun m!854977 () Bool)

(assert (=> b!920709 m!854977))

(declare-fun m!854979 () Bool)

(assert (=> b!920715 m!854979))

(declare-fun m!854981 () Bool)

(assert (=> b!920715 m!854981))

(declare-fun m!854983 () Bool)

(assert (=> b!920720 m!854983))

(declare-fun m!854985 () Bool)

(assert (=> b!920720 m!854985))

(declare-fun m!854987 () Bool)

(assert (=> b!920712 m!854987))

(check-sat (not start!78966) (not b!920720) (not b!920716) (not b!920709) (not b!920719) (not mapNonEmpty!31035) (not b!920712) b_and!27771 (not b_next!17011) (not b!920708) (not b_lambda!13527) (not b!920715) tp_is_empty!19519)
(check-sat b_and!27771 (not b_next!17011))
