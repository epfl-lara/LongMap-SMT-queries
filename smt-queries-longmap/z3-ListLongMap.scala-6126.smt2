; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78866 () Bool)

(assert start!78866)

(declare-fun b_free!17079 () Bool)

(declare-fun b_next!17079 () Bool)

(assert (=> start!78866 (= b_free!17079 (not b_next!17079))))

(declare-fun tp!59678 () Bool)

(declare-fun b_and!27895 () Bool)

(assert (=> start!78866 (= tp!59678 b_and!27895)))

(declare-fun b!921539 () Bool)

(declare-fun res!621458 () Bool)

(declare-fun e!517126 () Bool)

(assert (=> b!921539 (=> (not res!621458) (not e!517126))))

(declare-datatypes ((array!55152 0))(
  ( (array!55153 (arr!26521 (Array (_ BitVec 32) (_ BitVec 64))) (size!26980 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55152)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55152 (_ BitVec 32)) Bool)

(assert (=> b!921539 (= res!621458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!921540 () Bool)

(declare-fun res!621459 () Bool)

(declare-fun e!517128 () Bool)

(assert (=> b!921540 (=> res!621459 e!517128)))

(declare-datatypes ((List!18608 0))(
  ( (Nil!18605) (Cons!18604 (h!19750 (_ BitVec 64)) (t!26417 List!18608)) )
))
(declare-fun noDuplicate!1347 (List!18608) Bool)

(assert (=> b!921540 (= res!621459 (not (noDuplicate!1347 Nil!18605)))))

(declare-fun b!921541 () Bool)

(declare-fun e!517127 () Bool)

(assert (=> b!921541 (= e!517127 (not e!517128))))

(declare-fun res!621464 () Bool)

(assert (=> b!921541 (=> res!621464 e!517128)))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!921541 (= res!621464 (or (bvsge (size!26980 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26980 _keys!1487))))))

(declare-fun e!517132 () Bool)

(assert (=> b!921541 e!517132))

(declare-fun c!96120 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!921541 (= c!96120 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31094 0))(
  ( (Unit!31095) )
))
(declare-fun lt!413748 () Unit!31094)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31081 0))(
  ( (V!31082 (val!9844 Int)) )
))
(declare-datatypes ((ValueCell!9312 0))(
  ( (ValueCellFull!9312 (v!12362 V!31081)) (EmptyCell!9312) )
))
(declare-datatypes ((array!55154 0))(
  ( (array!55155 (arr!26522 (Array (_ BitVec 32) ValueCell!9312)) (size!26981 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55154)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31081)

(declare-fun minValue!1173 () V!31081)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!180 (array!55152 array!55154 (_ BitVec 32) (_ BitVec 32) V!31081 V!31081 (_ BitVec 64) (_ BitVec 32) Int) Unit!31094)

(assert (=> b!921541 (= lt!413748 (lemmaListMapContainsThenArrayContainsFrom!180 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55152 (_ BitVec 32) List!18608) Bool)

(assert (=> b!921541 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18605)))

(declare-fun lt!413745 () Unit!31094)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55152 (_ BitVec 32) (_ BitVec 32)) Unit!31094)

(assert (=> b!921541 (= lt!413745 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12804 0))(
  ( (tuple2!12805 (_1!6413 (_ BitVec 64)) (_2!6413 V!31081)) )
))
(declare-datatypes ((List!18609 0))(
  ( (Nil!18606) (Cons!18605 (h!19751 tuple2!12804) (t!26418 List!18609)) )
))
(declare-datatypes ((ListLongMap!11501 0))(
  ( (ListLongMap!11502 (toList!5766 List!18609)) )
))
(declare-fun lt!413744 () ListLongMap!11501)

(declare-fun lt!413741 () tuple2!12804)

(declare-fun contains!4827 (ListLongMap!11501 (_ BitVec 64)) Bool)

(declare-fun +!2673 (ListLongMap!11501 tuple2!12804) ListLongMap!11501)

(assert (=> b!921541 (contains!4827 (+!2673 lt!413744 lt!413741) k0!1099)))

(declare-fun lt!413747 () V!31081)

(declare-fun lt!413746 () (_ BitVec 64))

(declare-fun lt!413742 () Unit!31094)

(declare-fun addStillContains!397 (ListLongMap!11501 (_ BitVec 64) V!31081 (_ BitVec 64)) Unit!31094)

(assert (=> b!921541 (= lt!413742 (addStillContains!397 lt!413744 lt!413746 lt!413747 k0!1099))))

(declare-fun getCurrentListMap!3020 (array!55152 array!55154 (_ BitVec 32) (_ BitVec 32) V!31081 V!31081 (_ BitVec 32) Int) ListLongMap!11501)

(assert (=> b!921541 (= (getCurrentListMap!3020 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2673 (getCurrentListMap!3020 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413741))))

(assert (=> b!921541 (= lt!413741 (tuple2!12805 lt!413746 lt!413747))))

(declare-fun get!13922 (ValueCell!9312 V!31081) V!31081)

(declare-fun dynLambda!1462 (Int (_ BitVec 64)) V!31081)

(assert (=> b!921541 (= lt!413747 (get!13922 (select (arr!26522 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1462 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413743 () Unit!31094)

(declare-fun lemmaListMapRecursiveValidKeyArray!63 (array!55152 array!55154 (_ BitVec 32) (_ BitVec 32) V!31081 V!31081 (_ BitVec 32) Int) Unit!31094)

(assert (=> b!921541 (= lt!413743 (lemmaListMapRecursiveValidKeyArray!63 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!921542 () Bool)

(assert (=> b!921542 (= e!517128 true)))

(declare-fun lt!413749 () Bool)

(declare-fun contains!4828 (List!18608 (_ BitVec 64)) Bool)

(assert (=> b!921542 (= lt!413749 (contains!4828 Nil!18605 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!921543 () Bool)

(declare-fun e!517131 () Bool)

(declare-fun e!517124 () Bool)

(declare-fun mapRes!31137 () Bool)

(assert (=> b!921543 (= e!517131 (and e!517124 mapRes!31137))))

(declare-fun condMapEmpty!31137 () Bool)

(declare-fun mapDefault!31137 () ValueCell!9312)

(assert (=> b!921543 (= condMapEmpty!31137 (= (arr!26522 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9312)) mapDefault!31137)))))

(declare-fun b!921544 () Bool)

(declare-fun res!621455 () Bool)

(assert (=> b!921544 (=> res!621455 e!517128)))

(assert (=> b!921544 (= res!621455 (contains!4828 Nil!18605 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!921545 () Bool)

(declare-fun res!621465 () Bool)

(assert (=> b!921545 (=> (not res!621465) (not e!517126))))

(assert (=> b!921545 (= res!621465 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18605))))

(declare-fun b!921546 () Bool)

(declare-fun res!621462 () Bool)

(declare-fun e!517129 () Bool)

(assert (=> b!921546 (=> (not res!621462) (not e!517129))))

(assert (=> b!921546 (= res!621462 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!31137 () Bool)

(assert (=> mapIsEmpty!31137 mapRes!31137))

(declare-fun b!921547 () Bool)

(declare-fun tp_is_empty!19587 () Bool)

(assert (=> b!921547 (= e!517124 tp_is_empty!19587)))

(declare-fun b!921548 () Bool)

(declare-fun e!517125 () Bool)

(assert (=> b!921548 (= e!517125 tp_is_empty!19587)))

(declare-fun b!921549 () Bool)

(declare-fun arrayContainsKey!0 (array!55152 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!921549 (= e!517132 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!921550 () Bool)

(declare-fun res!621454 () Bool)

(assert (=> b!921550 (=> (not res!621454) (not e!517126))))

(assert (=> b!921550 (= res!621454 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26980 _keys!1487))))))

(declare-fun b!921551 () Bool)

(assert (=> b!921551 (= e!517129 e!517127)))

(declare-fun res!621463 () Bool)

(assert (=> b!921551 (=> (not res!621463) (not e!517127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!921551 (= res!621463 (validKeyInArray!0 lt!413746))))

(assert (=> b!921551 (= lt!413746 (select (arr!26521 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!921552 () Bool)

(declare-fun res!621457 () Bool)

(assert (=> b!921552 (=> (not res!621457) (not e!517126))))

(assert (=> b!921552 (= res!621457 (and (= (size!26981 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26980 _keys!1487) (size!26981 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!621456 () Bool)

(assert (=> start!78866 (=> (not res!621456) (not e!517126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78866 (= res!621456 (validMask!0 mask!1881))))

(assert (=> start!78866 e!517126))

(assert (=> start!78866 true))

(assert (=> start!78866 tp_is_empty!19587))

(declare-fun array_inv!20664 (array!55154) Bool)

(assert (=> start!78866 (and (array_inv!20664 _values!1231) e!517131)))

(assert (=> start!78866 tp!59678))

(declare-fun array_inv!20665 (array!55152) Bool)

(assert (=> start!78866 (array_inv!20665 _keys!1487)))

(declare-fun b!921553 () Bool)

(assert (=> b!921553 (= e!517126 e!517129)))

(declare-fun res!621466 () Bool)

(assert (=> b!921553 (=> (not res!621466) (not e!517129))))

(assert (=> b!921553 (= res!621466 (contains!4827 lt!413744 k0!1099))))

(assert (=> b!921553 (= lt!413744 (getCurrentListMap!3020 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!31137 () Bool)

(declare-fun tp!59677 () Bool)

(assert (=> mapNonEmpty!31137 (= mapRes!31137 (and tp!59677 e!517125))))

(declare-fun mapRest!31137 () (Array (_ BitVec 32) ValueCell!9312))

(declare-fun mapKey!31137 () (_ BitVec 32))

(declare-fun mapValue!31137 () ValueCell!9312)

(assert (=> mapNonEmpty!31137 (= (arr!26522 _values!1231) (store mapRest!31137 mapKey!31137 mapValue!31137))))

(declare-fun b!921554 () Bool)

(declare-fun res!621460 () Bool)

(assert (=> b!921554 (=> (not res!621460) (not e!517129))))

(assert (=> b!921554 (= res!621460 (validKeyInArray!0 k0!1099))))

(declare-fun b!921555 () Bool)

(assert (=> b!921555 (= e!517132 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!921556 () Bool)

(declare-fun res!621461 () Bool)

(assert (=> b!921556 (=> (not res!621461) (not e!517129))))

(declare-fun v!791 () V!31081)

(declare-fun apply!605 (ListLongMap!11501 (_ BitVec 64)) V!31081)

(assert (=> b!921556 (= res!621461 (= (apply!605 lt!413744 k0!1099) v!791))))

(assert (= (and start!78866 res!621456) b!921552))

(assert (= (and b!921552 res!621457) b!921539))

(assert (= (and b!921539 res!621458) b!921545))

(assert (= (and b!921545 res!621465) b!921550))

(assert (= (and b!921550 res!621454) b!921553))

(assert (= (and b!921553 res!621466) b!921556))

(assert (= (and b!921556 res!621461) b!921546))

(assert (= (and b!921546 res!621462) b!921554))

(assert (= (and b!921554 res!621460) b!921551))

(assert (= (and b!921551 res!621463) b!921541))

(assert (= (and b!921541 c!96120) b!921549))

(assert (= (and b!921541 (not c!96120)) b!921555))

(assert (= (and b!921541 (not res!621464)) b!921540))

(assert (= (and b!921540 (not res!621459)) b!921544))

(assert (= (and b!921544 (not res!621455)) b!921542))

(assert (= (and b!921543 condMapEmpty!31137) mapIsEmpty!31137))

(assert (= (and b!921543 (not condMapEmpty!31137)) mapNonEmpty!31137))

(get-info :version)

(assert (= (and mapNonEmpty!31137 ((_ is ValueCellFull!9312) mapValue!31137)) b!921548))

(assert (= (and b!921543 ((_ is ValueCellFull!9312) mapDefault!31137)) b!921547))

(assert (= start!78866 b!921543))

(declare-fun b_lambda!13581 () Bool)

(assert (=> (not b_lambda!13581) (not b!921541)))

(declare-fun t!26416 () Bool)

(declare-fun tb!5659 () Bool)

(assert (=> (and start!78866 (= defaultEntry!1235 defaultEntry!1235) t!26416) tb!5659))

(declare-fun result!11141 () Bool)

(assert (=> tb!5659 (= result!11141 tp_is_empty!19587)))

(assert (=> b!921541 t!26416))

(declare-fun b_and!27897 () Bool)

(assert (= b_and!27895 (and (=> t!26416 result!11141) b_and!27897)))

(declare-fun m!855499 () Bool)

(assert (=> b!921539 m!855499))

(declare-fun m!855501 () Bool)

(assert (=> b!921545 m!855501))

(declare-fun m!855503 () Bool)

(assert (=> b!921556 m!855503))

(declare-fun m!855505 () Bool)

(assert (=> start!78866 m!855505))

(declare-fun m!855507 () Bool)

(assert (=> start!78866 m!855507))

(declare-fun m!855509 () Bool)

(assert (=> start!78866 m!855509))

(declare-fun m!855511 () Bool)

(assert (=> b!921541 m!855511))

(declare-fun m!855513 () Bool)

(assert (=> b!921541 m!855513))

(declare-fun m!855515 () Bool)

(assert (=> b!921541 m!855515))

(declare-fun m!855517 () Bool)

(assert (=> b!921541 m!855517))

(declare-fun m!855519 () Bool)

(assert (=> b!921541 m!855519))

(declare-fun m!855521 () Bool)

(assert (=> b!921541 m!855521))

(assert (=> b!921541 m!855515))

(assert (=> b!921541 m!855517))

(declare-fun m!855523 () Bool)

(assert (=> b!921541 m!855523))

(declare-fun m!855525 () Bool)

(assert (=> b!921541 m!855525))

(declare-fun m!855527 () Bool)

(assert (=> b!921541 m!855527))

(declare-fun m!855529 () Bool)

(assert (=> b!921541 m!855529))

(assert (=> b!921541 m!855519))

(declare-fun m!855531 () Bool)

(assert (=> b!921541 m!855531))

(declare-fun m!855533 () Bool)

(assert (=> b!921541 m!855533))

(assert (=> b!921541 m!855511))

(declare-fun m!855535 () Bool)

(assert (=> b!921541 m!855535))

(declare-fun m!855537 () Bool)

(assert (=> b!921551 m!855537))

(declare-fun m!855539 () Bool)

(assert (=> b!921551 m!855539))

(declare-fun m!855541 () Bool)

(assert (=> b!921540 m!855541))

(declare-fun m!855543 () Bool)

(assert (=> b!921554 m!855543))

(declare-fun m!855545 () Bool)

(assert (=> b!921553 m!855545))

(declare-fun m!855547 () Bool)

(assert (=> b!921553 m!855547))

(declare-fun m!855549 () Bool)

(assert (=> b!921549 m!855549))

(declare-fun m!855551 () Bool)

(assert (=> b!921544 m!855551))

(declare-fun m!855553 () Bool)

(assert (=> b!921542 m!855553))

(declare-fun m!855555 () Bool)

(assert (=> mapNonEmpty!31137 m!855555))

(check-sat (not b!921545) b_and!27897 (not mapNonEmpty!31137) (not b!921554) (not b!921549) tp_is_empty!19587 (not start!78866) (not b!921553) (not b_next!17079) (not b!921541) (not b!921542) (not b!921540) (not b!921539) (not b_lambda!13581) (not b!921556) (not b!921544) (not b!921551))
(check-sat b_and!27897 (not b_next!17079))
