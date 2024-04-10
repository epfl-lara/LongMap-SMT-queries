; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78836 () Bool)

(assert start!78836)

(declare-fun b_free!17049 () Bool)

(declare-fun b_next!17049 () Bool)

(assert (=> start!78836 (= b_free!17049 (not b_next!17049))))

(declare-fun tp!59587 () Bool)

(declare-fun b_and!27835 () Bool)

(assert (=> start!78836 (= tp!59587 b_and!27835)))

(declare-fun b!920699 () Bool)

(declare-fun e!516725 () Bool)

(declare-fun tp_is_empty!19557 () Bool)

(assert (=> b!920699 (= e!516725 tp_is_empty!19557)))

(declare-fun b!920700 () Bool)

(declare-fun res!620875 () Bool)

(declare-fun e!516721 () Bool)

(assert (=> b!920700 (=> (not res!620875) (not e!516721))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55094 0))(
  ( (array!55095 (arr!26492 (Array (_ BitVec 32) (_ BitVec 64))) (size!26951 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55094)

(assert (=> b!920700 (= res!620875 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26951 _keys!1487))))))

(declare-fun b!920701 () Bool)

(declare-fun e!516723 () Bool)

(assert (=> b!920701 (= e!516723 true)))

(declare-fun lt!413339 () Bool)

(declare-datatypes ((List!18583 0))(
  ( (Nil!18580) (Cons!18579 (h!19725 (_ BitVec 64)) (t!26362 List!18583)) )
))
(declare-fun contains!4804 (List!18583 (_ BitVec 64)) Bool)

(assert (=> b!920701 (= lt!413339 (contains!4804 Nil!18580 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!920702 () Bool)

(declare-fun res!620876 () Bool)

(declare-fun e!516719 () Bool)

(assert (=> b!920702 (=> (not res!620876) (not e!516719))))

(assert (=> b!920702 (= res!620876 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!31092 () Bool)

(declare-fun mapRes!31092 () Bool)

(declare-fun tp!59588 () Bool)

(declare-fun e!516724 () Bool)

(assert (=> mapNonEmpty!31092 (= mapRes!31092 (and tp!59588 e!516724))))

(declare-fun mapKey!31092 () (_ BitVec 32))

(declare-datatypes ((V!31041 0))(
  ( (V!31042 (val!9829 Int)) )
))
(declare-datatypes ((ValueCell!9297 0))(
  ( (ValueCellFull!9297 (v!12347 V!31041)) (EmptyCell!9297) )
))
(declare-fun mapRest!31092 () (Array (_ BitVec 32) ValueCell!9297))

(declare-datatypes ((array!55096 0))(
  ( (array!55097 (arr!26493 (Array (_ BitVec 32) ValueCell!9297)) (size!26952 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55096)

(declare-fun mapValue!31092 () ValueCell!9297)

(assert (=> mapNonEmpty!31092 (= (arr!26493 _values!1231) (store mapRest!31092 mapKey!31092 mapValue!31092))))

(declare-fun e!516720 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun b!920703 () Bool)

(declare-fun arrayContainsKey!0 (array!55094 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!920703 (= e!516720 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!920704 () Bool)

(declare-fun e!516727 () Bool)

(assert (=> b!920704 (= e!516727 (not e!516723))))

(declare-fun res!620873 () Bool)

(assert (=> b!920704 (=> res!620873 e!516723)))

(assert (=> b!920704 (= res!620873 (or (bvsge (size!26951 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26951 _keys!1487))))))

(assert (=> b!920704 e!516720))

(declare-fun c!96075 () Bool)

(assert (=> b!920704 (= c!96075 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((Unit!31072 0))(
  ( (Unit!31073) )
))
(declare-fun lt!413341 () Unit!31072)

(declare-fun zeroValue!1173 () V!31041)

(declare-fun minValue!1173 () V!31041)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!169 (array!55094 array!55096 (_ BitVec 32) (_ BitVec 32) V!31041 V!31041 (_ BitVec 64) (_ BitVec 32) Int) Unit!31072)

(assert (=> b!920704 (= lt!413341 (lemmaListMapContainsThenArrayContainsFrom!169 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55094 (_ BitVec 32) List!18583) Bool)

(assert (=> b!920704 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18580)))

(declare-fun lt!413342 () Unit!31072)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55094 (_ BitVec 32) (_ BitVec 32)) Unit!31072)

(assert (=> b!920704 (= lt!413342 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12780 0))(
  ( (tuple2!12781 (_1!6401 (_ BitVec 64)) (_2!6401 V!31041)) )
))
(declare-datatypes ((List!18584 0))(
  ( (Nil!18581) (Cons!18580 (h!19726 tuple2!12780) (t!26363 List!18584)) )
))
(declare-datatypes ((ListLongMap!11477 0))(
  ( (ListLongMap!11478 (toList!5754 List!18584)) )
))
(declare-fun lt!413343 () ListLongMap!11477)

(declare-fun lt!413337 () tuple2!12780)

(declare-fun contains!4805 (ListLongMap!11477 (_ BitVec 64)) Bool)

(declare-fun +!2662 (ListLongMap!11477 tuple2!12780) ListLongMap!11477)

(assert (=> b!920704 (contains!4805 (+!2662 lt!413343 lt!413337) k0!1099)))

(declare-fun lt!413340 () (_ BitVec 64))

(declare-fun lt!413338 () V!31041)

(declare-fun lt!413344 () Unit!31072)

(declare-fun addStillContains!386 (ListLongMap!11477 (_ BitVec 64) V!31041 (_ BitVec 64)) Unit!31072)

(assert (=> b!920704 (= lt!413344 (addStillContains!386 lt!413343 lt!413340 lt!413338 k0!1099))))

(declare-fun getCurrentListMap!3009 (array!55094 array!55096 (_ BitVec 32) (_ BitVec 32) V!31041 V!31041 (_ BitVec 32) Int) ListLongMap!11477)

(assert (=> b!920704 (= (getCurrentListMap!3009 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2662 (getCurrentListMap!3009 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413337))))

(assert (=> b!920704 (= lt!413337 (tuple2!12781 lt!413340 lt!413338))))

(declare-fun get!13901 (ValueCell!9297 V!31041) V!31041)

(declare-fun dynLambda!1451 (Int (_ BitVec 64)) V!31041)

(assert (=> b!920704 (= lt!413338 (get!13901 (select (arr!26493 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1451 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413336 () Unit!31072)

(declare-fun lemmaListMapRecursiveValidKeyArray!52 (array!55094 array!55096 (_ BitVec 32) (_ BitVec 32) V!31041 V!31041 (_ BitVec 32) Int) Unit!31072)

(assert (=> b!920704 (= lt!413336 (lemmaListMapRecursiveValidKeyArray!52 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!920705 () Bool)

(declare-fun res!620878 () Bool)

(assert (=> b!920705 (=> res!620878 e!516723)))

(declare-fun noDuplicate!1335 (List!18583) Bool)

(assert (=> b!920705 (= res!620878 (not (noDuplicate!1335 Nil!18580)))))

(declare-fun b!920706 () Bool)

(assert (=> b!920706 (= e!516724 tp_is_empty!19557)))

(declare-fun res!620881 () Bool)

(assert (=> start!78836 (=> (not res!620881) (not e!516721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78836 (= res!620881 (validMask!0 mask!1881))))

(assert (=> start!78836 e!516721))

(assert (=> start!78836 true))

(assert (=> start!78836 tp_is_empty!19557))

(declare-fun e!516722 () Bool)

(declare-fun array_inv!20646 (array!55096) Bool)

(assert (=> start!78836 (and (array_inv!20646 _values!1231) e!516722)))

(assert (=> start!78836 tp!59587))

(declare-fun array_inv!20647 (array!55094) Bool)

(assert (=> start!78836 (array_inv!20647 _keys!1487)))

(declare-fun b!920707 () Bool)

(declare-fun res!620872 () Bool)

(assert (=> b!920707 (=> (not res!620872) (not e!516721))))

(assert (=> b!920707 (= res!620872 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18580))))

(declare-fun b!920708 () Bool)

(declare-fun res!620869 () Bool)

(assert (=> b!920708 (=> (not res!620869) (not e!516721))))

(assert (=> b!920708 (= res!620869 (and (= (size!26952 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26951 _keys!1487) (size!26952 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!920709 () Bool)

(declare-fun res!620874 () Bool)

(assert (=> b!920709 (=> (not res!620874) (not e!516719))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920709 (= res!620874 (validKeyInArray!0 k0!1099))))

(declare-fun b!920710 () Bool)

(assert (=> b!920710 (= e!516720 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!31092 () Bool)

(assert (=> mapIsEmpty!31092 mapRes!31092))

(declare-fun b!920711 () Bool)

(declare-fun res!620880 () Bool)

(assert (=> b!920711 (=> (not res!620880) (not e!516719))))

(declare-fun v!791 () V!31041)

(declare-fun apply!595 (ListLongMap!11477 (_ BitVec 64)) V!31041)

(assert (=> b!920711 (= res!620880 (= (apply!595 lt!413343 k0!1099) v!791))))

(declare-fun b!920712 () Bool)

(assert (=> b!920712 (= e!516719 e!516727)))

(declare-fun res!620879 () Bool)

(assert (=> b!920712 (=> (not res!620879) (not e!516727))))

(assert (=> b!920712 (= res!620879 (validKeyInArray!0 lt!413340))))

(assert (=> b!920712 (= lt!413340 (select (arr!26492 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!920713 () Bool)

(assert (=> b!920713 (= e!516721 e!516719)))

(declare-fun res!620870 () Bool)

(assert (=> b!920713 (=> (not res!620870) (not e!516719))))

(assert (=> b!920713 (= res!620870 (contains!4805 lt!413343 k0!1099))))

(assert (=> b!920713 (= lt!413343 (getCurrentListMap!3009 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!920714 () Bool)

(declare-fun res!620877 () Bool)

(assert (=> b!920714 (=> res!620877 e!516723)))

(assert (=> b!920714 (= res!620877 (contains!4804 Nil!18580 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!920715 () Bool)

(declare-fun res!620871 () Bool)

(assert (=> b!920715 (=> (not res!620871) (not e!516721))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55094 (_ BitVec 32)) Bool)

(assert (=> b!920715 (= res!620871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!920716 () Bool)

(assert (=> b!920716 (= e!516722 (and e!516725 mapRes!31092))))

(declare-fun condMapEmpty!31092 () Bool)

(declare-fun mapDefault!31092 () ValueCell!9297)

(assert (=> b!920716 (= condMapEmpty!31092 (= (arr!26493 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9297)) mapDefault!31092)))))

(assert (= (and start!78836 res!620881) b!920708))

(assert (= (and b!920708 res!620869) b!920715))

(assert (= (and b!920715 res!620871) b!920707))

(assert (= (and b!920707 res!620872) b!920700))

(assert (= (and b!920700 res!620875) b!920713))

(assert (= (and b!920713 res!620870) b!920711))

(assert (= (and b!920711 res!620880) b!920702))

(assert (= (and b!920702 res!620876) b!920709))

(assert (= (and b!920709 res!620874) b!920712))

(assert (= (and b!920712 res!620879) b!920704))

(assert (= (and b!920704 c!96075) b!920703))

(assert (= (and b!920704 (not c!96075)) b!920710))

(assert (= (and b!920704 (not res!620873)) b!920705))

(assert (= (and b!920705 (not res!620878)) b!920714))

(assert (= (and b!920714 (not res!620877)) b!920701))

(assert (= (and b!920716 condMapEmpty!31092) mapIsEmpty!31092))

(assert (= (and b!920716 (not condMapEmpty!31092)) mapNonEmpty!31092))

(get-info :version)

(assert (= (and mapNonEmpty!31092 ((_ is ValueCellFull!9297) mapValue!31092)) b!920706))

(assert (= (and b!920716 ((_ is ValueCellFull!9297) mapDefault!31092)) b!920699))

(assert (= start!78836 b!920716))

(declare-fun b_lambda!13551 () Bool)

(assert (=> (not b_lambda!13551) (not b!920704)))

(declare-fun t!26361 () Bool)

(declare-fun tb!5629 () Bool)

(assert (=> (and start!78836 (= defaultEntry!1235 defaultEntry!1235) t!26361) tb!5629))

(declare-fun result!11081 () Bool)

(assert (=> tb!5629 (= result!11081 tp_is_empty!19557)))

(assert (=> b!920704 t!26361))

(declare-fun b_and!27837 () Bool)

(assert (= b_and!27835 (and (=> t!26361 result!11081) b_and!27837)))

(declare-fun m!854629 () Bool)

(assert (=> b!920705 m!854629))

(declare-fun m!854631 () Bool)

(assert (=> b!920701 m!854631))

(declare-fun m!854633 () Bool)

(assert (=> b!920703 m!854633))

(declare-fun m!854635 () Bool)

(assert (=> b!920709 m!854635))

(declare-fun m!854637 () Bool)

(assert (=> b!920711 m!854637))

(declare-fun m!854639 () Bool)

(assert (=> b!920713 m!854639))

(declare-fun m!854641 () Bool)

(assert (=> b!920713 m!854641))

(declare-fun m!854643 () Bool)

(assert (=> mapNonEmpty!31092 m!854643))

(declare-fun m!854645 () Bool)

(assert (=> start!78836 m!854645))

(declare-fun m!854647 () Bool)

(assert (=> start!78836 m!854647))

(declare-fun m!854649 () Bool)

(assert (=> start!78836 m!854649))

(declare-fun m!854651 () Bool)

(assert (=> b!920712 m!854651))

(declare-fun m!854653 () Bool)

(assert (=> b!920712 m!854653))

(declare-fun m!854655 () Bool)

(assert (=> b!920714 m!854655))

(declare-fun m!854657 () Bool)

(assert (=> b!920715 m!854657))

(declare-fun m!854659 () Bool)

(assert (=> b!920707 m!854659))

(declare-fun m!854661 () Bool)

(assert (=> b!920704 m!854661))

(assert (=> b!920704 m!854661))

(declare-fun m!854663 () Bool)

(assert (=> b!920704 m!854663))

(declare-fun m!854665 () Bool)

(assert (=> b!920704 m!854665))

(declare-fun m!854667 () Bool)

(assert (=> b!920704 m!854667))

(declare-fun m!854669 () Bool)

(assert (=> b!920704 m!854669))

(declare-fun m!854671 () Bool)

(assert (=> b!920704 m!854671))

(declare-fun m!854673 () Bool)

(assert (=> b!920704 m!854673))

(declare-fun m!854675 () Bool)

(assert (=> b!920704 m!854675))

(assert (=> b!920704 m!854673))

(assert (=> b!920704 m!854675))

(declare-fun m!854677 () Bool)

(assert (=> b!920704 m!854677))

(declare-fun m!854679 () Bool)

(assert (=> b!920704 m!854679))

(declare-fun m!854681 () Bool)

(assert (=> b!920704 m!854681))

(declare-fun m!854683 () Bool)

(assert (=> b!920704 m!854683))

(assert (=> b!920704 m!854665))

(declare-fun m!854685 () Bool)

(assert (=> b!920704 m!854685))

(check-sat (not b!920701) (not b!920713) (not b!920703) (not start!78836) (not b!920711) b_and!27837 (not b!920715) (not b!920705) (not b!920714) (not b!920707) (not b!920712) tp_is_empty!19557 (not b_next!17049) (not b!920709) (not mapNonEmpty!31092) (not b!920704) (not b_lambda!13551))
(check-sat b_and!27837 (not b_next!17049))
