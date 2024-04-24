; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78918 () Bool)

(assert start!78918)

(declare-fun b_free!16963 () Bool)

(declare-fun b_next!16963 () Bool)

(assert (=> start!78918 (= b_free!16963 (not b_next!16963))))

(declare-fun tp!59330 () Bool)

(declare-fun b_and!27673 () Bool)

(assert (=> start!78918 (= tp!59330 b_and!27673)))

(declare-fun b!919724 () Bool)

(declare-fun e!516357 () Bool)

(declare-fun e!516358 () Bool)

(assert (=> b!919724 (= e!516357 e!516358)))

(declare-fun res!619860 () Bool)

(assert (=> b!919724 (=> (not res!619860) (not e!516358))))

(declare-fun lt!412766 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919724 (= res!619860 (validKeyInArray!0 lt!412766))))

(declare-datatypes ((array!54971 0))(
  ( (array!54972 (arr!26426 (Array (_ BitVec 32) (_ BitVec 64))) (size!26886 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54971)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!919724 (= lt!412766 (select (arr!26426 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!919725 () Bool)

(declare-fun res!619856 () Bool)

(assert (=> b!919725 (=> (not res!619856) (not e!516357))))

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!919725 (= res!619856 (validKeyInArray!0 k0!1099))))

(declare-fun b!919726 () Bool)

(declare-fun res!619857 () Bool)

(declare-fun e!516354 () Bool)

(assert (=> b!919726 (=> (not res!619857) (not e!516354))))

(declare-datatypes ((List!18508 0))(
  ( (Nil!18505) (Cons!18504 (h!19656 (_ BitVec 64)) (t!26193 List!18508)) )
))
(declare-fun arrayNoDuplicates!0 (array!54971 (_ BitVec 32) List!18508) Bool)

(assert (=> b!919726 (= res!619857 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18505))))

(declare-fun mapNonEmpty!30963 () Bool)

(declare-fun mapRes!30963 () Bool)

(declare-fun tp!59331 () Bool)

(declare-fun e!516353 () Bool)

(assert (=> mapNonEmpty!30963 (= mapRes!30963 (and tp!59331 e!516353))))

(declare-datatypes ((V!30927 0))(
  ( (V!30928 (val!9786 Int)) )
))
(declare-datatypes ((ValueCell!9254 0))(
  ( (ValueCellFull!9254 (v!12301 V!30927)) (EmptyCell!9254) )
))
(declare-fun mapValue!30963 () ValueCell!9254)

(declare-datatypes ((array!54973 0))(
  ( (array!54974 (arr!26427 (Array (_ BitVec 32) ValueCell!9254)) (size!26887 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54973)

(declare-fun mapKey!30963 () (_ BitVec 32))

(declare-fun mapRest!30963 () (Array (_ BitVec 32) ValueCell!9254))

(assert (=> mapNonEmpty!30963 (= (arr!26427 _values!1231) (store mapRest!30963 mapKey!30963 mapValue!30963))))

(declare-fun b!919727 () Bool)

(declare-fun tp_is_empty!19471 () Bool)

(assert (=> b!919727 (= e!516353 tp_is_empty!19471)))

(declare-fun b!919728 () Bool)

(assert (=> b!919728 (= e!516354 e!516357)))

(declare-fun res!619862 () Bool)

(assert (=> b!919728 (=> (not res!619862) (not e!516357))))

(declare-datatypes ((tuple2!12690 0))(
  ( (tuple2!12691 (_1!6356 (_ BitVec 64)) (_2!6356 V!30927)) )
))
(declare-datatypes ((List!18509 0))(
  ( (Nil!18506) (Cons!18505 (h!19657 tuple2!12690) (t!26194 List!18509)) )
))
(declare-datatypes ((ListLongMap!11389 0))(
  ( (ListLongMap!11390 (toList!5710 List!18509)) )
))
(declare-fun lt!412765 () ListLongMap!11389)

(declare-fun contains!4764 (ListLongMap!11389 (_ BitVec 64)) Bool)

(assert (=> b!919728 (= res!619862 (contains!4764 lt!412765 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!30927)

(declare-fun minValue!1173 () V!30927)

(declare-fun getCurrentListMap!2964 (array!54971 array!54973 (_ BitVec 32) (_ BitVec 32) V!30927 V!30927 (_ BitVec 32) Int) ListLongMap!11389)

(assert (=> b!919728 (= lt!412765 (getCurrentListMap!2964 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!919729 () Bool)

(declare-fun e!516355 () Bool)

(assert (=> b!919729 (= e!516355 tp_is_empty!19471)))

(declare-fun b!919730 () Bool)

(assert (=> b!919730 (= e!516358 (not true))))

(declare-fun lt!412764 () tuple2!12690)

(declare-fun +!2651 (ListLongMap!11389 tuple2!12690) ListLongMap!11389)

(assert (=> b!919730 (contains!4764 (+!2651 lt!412765 lt!412764) k0!1099)))

(declare-datatypes ((Unit!31014 0))(
  ( (Unit!31015) )
))
(declare-fun lt!412769 () Unit!31014)

(declare-fun lt!412767 () V!30927)

(declare-fun addStillContains!360 (ListLongMap!11389 (_ BitVec 64) V!30927 (_ BitVec 64)) Unit!31014)

(assert (=> b!919730 (= lt!412769 (addStillContains!360 lt!412765 lt!412766 lt!412767 k0!1099))))

(assert (=> b!919730 (= (getCurrentListMap!2964 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2651 (getCurrentListMap!2964 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412764))))

(assert (=> b!919730 (= lt!412764 (tuple2!12691 lt!412766 lt!412767))))

(declare-fun get!13874 (ValueCell!9254 V!30927) V!30927)

(declare-fun dynLambda!1448 (Int (_ BitVec 64)) V!30927)

(assert (=> b!919730 (= lt!412767 (get!13874 (select (arr!26427 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1448 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412768 () Unit!31014)

(declare-fun lemmaListMapRecursiveValidKeyArray!31 (array!54971 array!54973 (_ BitVec 32) (_ BitVec 32) V!30927 V!30927 (_ BitVec 32) Int) Unit!31014)

(assert (=> b!919730 (= lt!412768 (lemmaListMapRecursiveValidKeyArray!31 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!919731 () Bool)

(declare-fun e!516356 () Bool)

(assert (=> b!919731 (= e!516356 (and e!516355 mapRes!30963))))

(declare-fun condMapEmpty!30963 () Bool)

(declare-fun mapDefault!30963 () ValueCell!9254)

(assert (=> b!919731 (= condMapEmpty!30963 (= (arr!26427 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9254)) mapDefault!30963)))))

(declare-fun b!919732 () Bool)

(declare-fun res!619859 () Bool)

(assert (=> b!919732 (=> (not res!619859) (not e!516354))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54971 (_ BitVec 32)) Bool)

(assert (=> b!919732 (= res!619859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!919733 () Bool)

(declare-fun res!619863 () Bool)

(assert (=> b!919733 (=> (not res!619863) (not e!516357))))

(assert (=> b!919733 (= res!619863 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!919734 () Bool)

(declare-fun res!619861 () Bool)

(assert (=> b!919734 (=> (not res!619861) (not e!516354))))

(assert (=> b!919734 (= res!619861 (and (= (size!26887 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26886 _keys!1487) (size!26887 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!919735 () Bool)

(declare-fun res!619855 () Bool)

(assert (=> b!919735 (=> (not res!619855) (not e!516357))))

(declare-fun v!791 () V!30927)

(declare-fun apply!585 (ListLongMap!11389 (_ BitVec 64)) V!30927)

(assert (=> b!919735 (= res!619855 (= (apply!585 lt!412765 k0!1099) v!791))))

(declare-fun b!919736 () Bool)

(declare-fun res!619854 () Bool)

(assert (=> b!919736 (=> (not res!619854) (not e!516354))))

(assert (=> b!919736 (= res!619854 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26886 _keys!1487))))))

(declare-fun mapIsEmpty!30963 () Bool)

(assert (=> mapIsEmpty!30963 mapRes!30963))

(declare-fun res!619858 () Bool)

(assert (=> start!78918 (=> (not res!619858) (not e!516354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78918 (= res!619858 (validMask!0 mask!1881))))

(assert (=> start!78918 e!516354))

(assert (=> start!78918 true))

(assert (=> start!78918 tp_is_empty!19471))

(declare-fun array_inv!20694 (array!54973) Bool)

(assert (=> start!78918 (and (array_inv!20694 _values!1231) e!516356)))

(assert (=> start!78918 tp!59330))

(declare-fun array_inv!20695 (array!54971) Bool)

(assert (=> start!78918 (array_inv!20695 _keys!1487)))

(assert (= (and start!78918 res!619858) b!919734))

(assert (= (and b!919734 res!619861) b!919732))

(assert (= (and b!919732 res!619859) b!919726))

(assert (= (and b!919726 res!619857) b!919736))

(assert (= (and b!919736 res!619854) b!919728))

(assert (= (and b!919728 res!619862) b!919735))

(assert (= (and b!919735 res!619855) b!919733))

(assert (= (and b!919733 res!619863) b!919725))

(assert (= (and b!919725 res!619856) b!919724))

(assert (= (and b!919724 res!619860) b!919730))

(assert (= (and b!919731 condMapEmpty!30963) mapIsEmpty!30963))

(assert (= (and b!919731 (not condMapEmpty!30963)) mapNonEmpty!30963))

(get-info :version)

(assert (= (and mapNonEmpty!30963 ((_ is ValueCellFull!9254) mapValue!30963)) b!919727))

(assert (= (and b!919731 ((_ is ValueCellFull!9254) mapDefault!30963)) b!919729))

(assert (= start!78918 b!919731))

(declare-fun b_lambda!13479 () Bool)

(assert (=> (not b_lambda!13479) (not b!919730)))

(declare-fun t!26192 () Bool)

(declare-fun tb!5535 () Bool)

(assert (=> (and start!78918 (= defaultEntry!1235 defaultEntry!1235) t!26192) tb!5535))

(declare-fun result!10901 () Bool)

(assert (=> tb!5535 (= result!10901 tp_is_empty!19471)))

(assert (=> b!919730 t!26192))

(declare-fun b_and!27675 () Bool)

(assert (= b_and!27673 (and (=> t!26192 result!10901) b_and!27675)))

(declare-fun m!853813 () Bool)

(assert (=> b!919730 m!853813))

(declare-fun m!853815 () Bool)

(assert (=> b!919730 m!853815))

(declare-fun m!853817 () Bool)

(assert (=> b!919730 m!853817))

(declare-fun m!853819 () Bool)

(assert (=> b!919730 m!853819))

(assert (=> b!919730 m!853817))

(declare-fun m!853821 () Bool)

(assert (=> b!919730 m!853821))

(declare-fun m!853823 () Bool)

(assert (=> b!919730 m!853823))

(assert (=> b!919730 m!853813))

(declare-fun m!853825 () Bool)

(assert (=> b!919730 m!853825))

(declare-fun m!853827 () Bool)

(assert (=> b!919730 m!853827))

(assert (=> b!919730 m!853825))

(assert (=> b!919730 m!853819))

(declare-fun m!853829 () Bool)

(assert (=> b!919730 m!853829))

(declare-fun m!853831 () Bool)

(assert (=> b!919730 m!853831))

(declare-fun m!853833 () Bool)

(assert (=> b!919726 m!853833))

(declare-fun m!853835 () Bool)

(assert (=> mapNonEmpty!30963 m!853835))

(declare-fun m!853837 () Bool)

(assert (=> b!919728 m!853837))

(declare-fun m!853839 () Bool)

(assert (=> b!919728 m!853839))

(declare-fun m!853841 () Bool)

(assert (=> b!919724 m!853841))

(declare-fun m!853843 () Bool)

(assert (=> b!919724 m!853843))

(declare-fun m!853845 () Bool)

(assert (=> b!919732 m!853845))

(declare-fun m!853847 () Bool)

(assert (=> start!78918 m!853847))

(declare-fun m!853849 () Bool)

(assert (=> start!78918 m!853849))

(declare-fun m!853851 () Bool)

(assert (=> start!78918 m!853851))

(declare-fun m!853853 () Bool)

(assert (=> b!919725 m!853853))

(declare-fun m!853855 () Bool)

(assert (=> b!919735 m!853855))

(check-sat (not b!919728) (not b!919730) (not b_next!16963) (not b_lambda!13479) (not start!78918) (not b!919725) (not b!919724) (not mapNonEmpty!30963) (not b!919732) (not b!919735) tp_is_empty!19471 b_and!27675 (not b!919726))
(check-sat b_and!27675 (not b_next!16963))
