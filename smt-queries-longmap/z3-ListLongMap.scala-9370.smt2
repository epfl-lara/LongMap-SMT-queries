; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111880 () Bool)

(assert start!111880)

(declare-fun b_free!30313 () Bool)

(declare-fun b_next!30313 () Bool)

(assert (=> start!111880 (= b_free!30313 (not b_next!30313))))

(declare-fun tp!106414 () Bool)

(declare-fun b_and!48787 () Bool)

(assert (=> start!111880 (= tp!106414 b_and!48787)))

(declare-fun mapNonEmpty!55847 () Bool)

(declare-fun mapRes!55847 () Bool)

(declare-fun tp!106415 () Bool)

(declare-fun e!755029 () Bool)

(assert (=> mapNonEmpty!55847 (= mapRes!55847 (and tp!106415 e!755029))))

(declare-fun mapKey!55847 () (_ BitVec 32))

(declare-datatypes ((V!53281 0))(
  ( (V!53282 (val!18141 Int)) )
))
(declare-datatypes ((ValueCell!17168 0))(
  ( (ValueCellFull!17168 (v!20766 V!53281)) (EmptyCell!17168) )
))
(declare-datatypes ((array!89271 0))(
  ( (array!89272 (arr!43105 (Array (_ BitVec 32) ValueCell!17168)) (size!43656 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89271)

(declare-fun mapValue!55847 () ValueCell!17168)

(declare-fun mapRest!55847 () (Array (_ BitVec 32) ValueCell!17168))

(assert (=> mapNonEmpty!55847 (= (arr!43105 _values!1337) (store mapRest!55847 mapKey!55847 mapValue!55847))))

(declare-fun b!1323994 () Bool)

(declare-fun res!878457 () Bool)

(declare-fun e!755031 () Bool)

(assert (=> b!1323994 (=> (not res!878457) (not e!755031))))

(declare-datatypes ((array!89273 0))(
  ( (array!89274 (arr!43106 (Array (_ BitVec 32) (_ BitVec 64))) (size!43657 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89273)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323994 (= res!878457 (validKeyInArray!0 (select (arr!43106 _keys!1609) from!2000)))))

(declare-fun b!1323995 () Bool)

(declare-fun res!878454 () Bool)

(assert (=> b!1323995 (=> (not res!878454) (not e!755031))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1323995 (= res!878454 (and (= (size!43656 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43657 _keys!1609) (size!43656 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323996 () Bool)

(declare-fun res!878455 () Bool)

(assert (=> b!1323996 (=> (not res!878455) (not e!755031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89273 (_ BitVec 32)) Bool)

(assert (=> b!1323996 (= res!878455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323997 () Bool)

(declare-fun res!878451 () Bool)

(assert (=> b!1323997 (=> (not res!878451) (not e!755031))))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1323997 (= res!878451 (not (= (select (arr!43106 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1323998 () Bool)

(declare-fun e!755028 () Bool)

(declare-fun tp_is_empty!36133 () Bool)

(assert (=> b!1323998 (= e!755028 tp_is_empty!36133)))

(declare-fun mapIsEmpty!55847 () Bool)

(assert (=> mapIsEmpty!55847 mapRes!55847))

(declare-fun res!878456 () Bool)

(assert (=> start!111880 (=> (not res!878456) (not e!755031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111880 (= res!878456 (validMask!0 mask!2019))))

(assert (=> start!111880 e!755031))

(declare-fun array_inv!32817 (array!89273) Bool)

(assert (=> start!111880 (array_inv!32817 _keys!1609)))

(assert (=> start!111880 true))

(assert (=> start!111880 tp_is_empty!36133))

(declare-fun e!755032 () Bool)

(declare-fun array_inv!32818 (array!89271) Bool)

(assert (=> start!111880 (and (array_inv!32818 _values!1337) e!755032)))

(assert (=> start!111880 tp!106414))

(declare-fun b!1323999 () Bool)

(declare-fun res!878458 () Bool)

(assert (=> b!1323999 (=> (not res!878458) (not e!755031))))

(declare-fun zeroValue!1279 () V!53281)

(declare-fun minValue!1279 () V!53281)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23420 0))(
  ( (tuple2!23421 (_1!11721 (_ BitVec 64)) (_2!11721 V!53281)) )
))
(declare-datatypes ((List!30570 0))(
  ( (Nil!30567) (Cons!30566 (h!31784 tuple2!23420) (t!44424 List!30570)) )
))
(declare-datatypes ((ListLongMap!21085 0))(
  ( (ListLongMap!21086 (toList!10558 List!30570)) )
))
(declare-fun contains!8725 (ListLongMap!21085 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5546 (array!89273 array!89271 (_ BitVec 32) (_ BitVec 32) V!53281 V!53281 (_ BitVec 32) Int) ListLongMap!21085)

(assert (=> b!1323999 (= res!878458 (contains!8725 (getCurrentListMap!5546 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1324000 () Bool)

(declare-fun res!878452 () Bool)

(assert (=> b!1324000 (=> (not res!878452) (not e!755031))))

(declare-datatypes ((List!30571 0))(
  ( (Nil!30568) (Cons!30567 (h!31785 (_ BitVec 64)) (t!44425 List!30571)) )
))
(declare-fun arrayNoDuplicates!0 (array!89273 (_ BitVec 32) List!30571) Bool)

(assert (=> b!1324000 (= res!878452 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30568))))

(declare-fun b!1324001 () Bool)

(assert (=> b!1324001 (= e!755032 (and e!755028 mapRes!55847))))

(declare-fun condMapEmpty!55847 () Bool)

(declare-fun mapDefault!55847 () ValueCell!17168)

(assert (=> b!1324001 (= condMapEmpty!55847 (= (arr!43105 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17168)) mapDefault!55847)))))

(declare-fun b!1324002 () Bool)

(assert (=> b!1324002 (= e!755031 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))))

(declare-fun lt!588841 () ListLongMap!21085)

(declare-fun lt!588846 () tuple2!23420)

(declare-fun +!4633 (ListLongMap!21085 tuple2!23420) ListLongMap!21085)

(assert (=> b!1324002 (contains!8725 (+!4633 lt!588841 lt!588846) k0!1164)))

(declare-datatypes ((Unit!43553 0))(
  ( (Unit!43554) )
))
(declare-fun lt!588843 () Unit!43553)

(declare-fun addStillContains!1145 (ListLongMap!21085 (_ BitVec 64) V!53281 (_ BitVec 64)) Unit!43553)

(assert (=> b!1324002 (= lt!588843 (addStillContains!1145 lt!588841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1324002 (contains!8725 lt!588841 k0!1164)))

(declare-fun lt!588840 () Unit!43553)

(declare-fun lt!588848 () V!53281)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!188 ((_ BitVec 64) (_ BitVec 64) V!53281 ListLongMap!21085) Unit!43553)

(assert (=> b!1324002 (= lt!588840 (lemmaInListMapAfterAddingDiffThenInBefore!188 k0!1164 (select (arr!43106 _keys!1609) from!2000) lt!588848 lt!588841))))

(declare-fun lt!588847 () ListLongMap!21085)

(assert (=> b!1324002 (contains!8725 lt!588847 k0!1164)))

(declare-fun lt!588842 () Unit!43553)

(assert (=> b!1324002 (= lt!588842 (lemmaInListMapAfterAddingDiffThenInBefore!188 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588847))))

(declare-fun lt!588844 () ListLongMap!21085)

(assert (=> b!1324002 (contains!8725 lt!588844 k0!1164)))

(declare-fun lt!588845 () Unit!43553)

(assert (=> b!1324002 (= lt!588845 (lemmaInListMapAfterAddingDiffThenInBefore!188 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588844))))

(assert (=> b!1324002 (= lt!588844 (+!4633 lt!588847 lt!588846))))

(assert (=> b!1324002 (= lt!588846 (tuple2!23421 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1324002 (= lt!588847 (+!4633 lt!588841 (tuple2!23421 (select (arr!43106 _keys!1609) from!2000) lt!588848)))))

(declare-fun get!21732 (ValueCell!17168 V!53281) V!53281)

(declare-fun dynLambda!3587 (Int (_ BitVec 64)) V!53281)

(assert (=> b!1324002 (= lt!588848 (get!21732 (select (arr!43105 _values!1337) from!2000) (dynLambda!3587 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6272 (array!89273 array!89271 (_ BitVec 32) (_ BitVec 32) V!53281 V!53281 (_ BitVec 32) Int) ListLongMap!21085)

(assert (=> b!1324002 (= lt!588841 (getCurrentListMapNoExtraKeys!6272 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1324003 () Bool)

(assert (=> b!1324003 (= e!755029 tp_is_empty!36133)))

(declare-fun b!1324004 () Bool)

(declare-fun res!878453 () Bool)

(assert (=> b!1324004 (=> (not res!878453) (not e!755031))))

(assert (=> b!1324004 (= res!878453 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43657 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111880 res!878456) b!1323995))

(assert (= (and b!1323995 res!878454) b!1323996))

(assert (= (and b!1323996 res!878455) b!1324000))

(assert (= (and b!1324000 res!878452) b!1324004))

(assert (= (and b!1324004 res!878453) b!1323999))

(assert (= (and b!1323999 res!878458) b!1323997))

(assert (= (and b!1323997 res!878451) b!1323994))

(assert (= (and b!1323994 res!878457) b!1324002))

(assert (= (and b!1324001 condMapEmpty!55847) mapIsEmpty!55847))

(assert (= (and b!1324001 (not condMapEmpty!55847)) mapNonEmpty!55847))

(get-info :version)

(assert (= (and mapNonEmpty!55847 ((_ is ValueCellFull!17168) mapValue!55847)) b!1324003))

(assert (= (and b!1324001 ((_ is ValueCellFull!17168) mapDefault!55847)) b!1323998))

(assert (= start!111880 b!1324001))

(declare-fun b_lambda!23633 () Bool)

(assert (=> (not b_lambda!23633) (not b!1324002)))

(declare-fun t!44423 () Bool)

(declare-fun tb!11657 () Bool)

(assert (=> (and start!111880 (= defaultEntry!1340 defaultEntry!1340) t!44423) tb!11657))

(declare-fun result!24377 () Bool)

(assert (=> tb!11657 (= result!24377 tp_is_empty!36133)))

(assert (=> b!1324002 t!44423))

(declare-fun b_and!48789 () Bool)

(assert (= b_and!48787 (and (=> t!44423 result!24377) b_and!48789)))

(declare-fun m!1212689 () Bool)

(assert (=> b!1323997 m!1212689))

(declare-fun m!1212691 () Bool)

(assert (=> start!111880 m!1212691))

(declare-fun m!1212693 () Bool)

(assert (=> start!111880 m!1212693))

(declare-fun m!1212695 () Bool)

(assert (=> start!111880 m!1212695))

(declare-fun m!1212697 () Bool)

(assert (=> b!1324002 m!1212697))

(declare-fun m!1212699 () Bool)

(assert (=> b!1324002 m!1212699))

(declare-fun m!1212701 () Bool)

(assert (=> b!1324002 m!1212701))

(declare-fun m!1212703 () Bool)

(assert (=> b!1324002 m!1212703))

(declare-fun m!1212705 () Bool)

(assert (=> b!1324002 m!1212705))

(assert (=> b!1324002 m!1212689))

(declare-fun m!1212707 () Bool)

(assert (=> b!1324002 m!1212707))

(declare-fun m!1212709 () Bool)

(assert (=> b!1324002 m!1212709))

(declare-fun m!1212711 () Bool)

(assert (=> b!1324002 m!1212711))

(declare-fun m!1212713 () Bool)

(assert (=> b!1324002 m!1212713))

(declare-fun m!1212715 () Bool)

(assert (=> b!1324002 m!1212715))

(declare-fun m!1212717 () Bool)

(assert (=> b!1324002 m!1212717))

(declare-fun m!1212719 () Bool)

(assert (=> b!1324002 m!1212719))

(declare-fun m!1212721 () Bool)

(assert (=> b!1324002 m!1212721))

(assert (=> b!1324002 m!1212717))

(assert (=> b!1324002 m!1212709))

(declare-fun m!1212723 () Bool)

(assert (=> b!1324002 m!1212723))

(assert (=> b!1324002 m!1212689))

(assert (=> b!1324002 m!1212697))

(declare-fun m!1212725 () Bool)

(assert (=> b!1324002 m!1212725))

(declare-fun m!1212727 () Bool)

(assert (=> b!1323999 m!1212727))

(assert (=> b!1323999 m!1212727))

(declare-fun m!1212729 () Bool)

(assert (=> b!1323999 m!1212729))

(assert (=> b!1323994 m!1212689))

(assert (=> b!1323994 m!1212689))

(declare-fun m!1212731 () Bool)

(assert (=> b!1323994 m!1212731))

(declare-fun m!1212733 () Bool)

(assert (=> b!1324000 m!1212733))

(declare-fun m!1212735 () Bool)

(assert (=> b!1323996 m!1212735))

(declare-fun m!1212737 () Bool)

(assert (=> mapNonEmpty!55847 m!1212737))

(check-sat (not mapNonEmpty!55847) b_and!48789 (not b!1323994) tp_is_empty!36133 (not start!111880) (not b!1324000) (not b!1323999) (not b!1324002) (not b!1323996) (not b_lambda!23633) (not b_next!30313))
(check-sat b_and!48789 (not b_next!30313))
