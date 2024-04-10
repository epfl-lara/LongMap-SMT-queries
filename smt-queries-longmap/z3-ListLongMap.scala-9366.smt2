; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111634 () Bool)

(assert start!111634)

(declare-fun b_free!30291 () Bool)

(declare-fun b_next!30291 () Bool)

(assert (=> start!111634 (= b_free!30291 (not b_next!30291))))

(declare-fun tp!106349 () Bool)

(declare-fun b_and!48741 () Bool)

(assert (=> start!111634 (= tp!106349 b_and!48741)))

(declare-fun b!1322310 () Bool)

(declare-fun res!877672 () Bool)

(declare-fun e!754023 () Bool)

(assert (=> b!1322310 (=> (not res!877672) (not e!754023))))

(declare-datatypes ((array!89144 0))(
  ( (array!89145 (arr!43046 (Array (_ BitVec 32) (_ BitVec 64))) (size!43596 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89144)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322310 (= res!877672 (validKeyInArray!0 (select (arr!43046 _keys!1609) from!2000)))))

(declare-fun b!1322311 () Bool)

(declare-fun res!877669 () Bool)

(assert (=> b!1322311 (=> (not res!877669) (not e!754023))))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1322311 (= res!877669 (not (= (select (arr!43046 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapIsEmpty!55814 () Bool)

(declare-fun mapRes!55814 () Bool)

(assert (=> mapIsEmpty!55814 mapRes!55814))

(declare-fun b!1322312 () Bool)

(declare-fun res!877674 () Bool)

(assert (=> b!1322312 (=> (not res!877674) (not e!754023))))

(declare-datatypes ((List!30505 0))(
  ( (Nil!30502) (Cons!30501 (h!31710 (_ BitVec 64)) (t!44345 List!30505)) )
))
(declare-fun arrayNoDuplicates!0 (array!89144 (_ BitVec 32) List!30505) Bool)

(assert (=> b!1322312 (= res!877674 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30502))))

(declare-fun b!1322313 () Bool)

(declare-fun e!754022 () Bool)

(declare-fun e!754020 () Bool)

(assert (=> b!1322313 (= e!754022 (and e!754020 mapRes!55814))))

(declare-fun condMapEmpty!55814 () Bool)

(declare-datatypes ((V!53251 0))(
  ( (V!53252 (val!18130 Int)) )
))
(declare-datatypes ((ValueCell!17157 0))(
  ( (ValueCellFull!17157 (v!20760 V!53251)) (EmptyCell!17157) )
))
(declare-datatypes ((array!89146 0))(
  ( (array!89147 (arr!43047 (Array (_ BitVec 32) ValueCell!17157)) (size!43597 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89146)

(declare-fun mapDefault!55814 () ValueCell!17157)

(assert (=> b!1322313 (= condMapEmpty!55814 (= (arr!43047 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17157)) mapDefault!55814)))))

(declare-fun b!1322314 () Bool)

(declare-fun res!877671 () Bool)

(assert (=> b!1322314 (=> (not res!877671) (not e!754023))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89144 (_ BitVec 32)) Bool)

(assert (=> b!1322314 (= res!877671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322315 () Bool)

(declare-fun tp_is_empty!36111 () Bool)

(assert (=> b!1322315 (= e!754020 tp_is_empty!36111)))

(declare-fun res!877670 () Bool)

(assert (=> start!111634 (=> (not res!877670) (not e!754023))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111634 (= res!877670 (validMask!0 mask!2019))))

(assert (=> start!111634 e!754023))

(declare-fun array_inv!32501 (array!89144) Bool)

(assert (=> start!111634 (array_inv!32501 _keys!1609)))

(assert (=> start!111634 true))

(assert (=> start!111634 tp_is_empty!36111))

(declare-fun array_inv!32502 (array!89146) Bool)

(assert (=> start!111634 (and (array_inv!32502 _values!1337) e!754022)))

(assert (=> start!111634 tp!106349))

(declare-fun b!1322316 () Bool)

(declare-fun res!877675 () Bool)

(assert (=> b!1322316 (=> (not res!877675) (not e!754023))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1322316 (= res!877675 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43596 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1322317 () Bool)

(assert (=> b!1322317 (= e!754023 (not true))))

(declare-datatypes ((tuple2!23358 0))(
  ( (tuple2!23359 (_1!11690 (_ BitVec 64)) (_2!11690 V!53251)) )
))
(declare-datatypes ((List!30506 0))(
  ( (Nil!30503) (Cons!30502 (h!31711 tuple2!23358) (t!44346 List!30506)) )
))
(declare-datatypes ((ListLongMap!21015 0))(
  ( (ListLongMap!21016 (toList!10523 List!30506)) )
))
(declare-fun lt!588069 () ListLongMap!21015)

(declare-fun lt!588072 () tuple2!23358)

(declare-fun contains!8678 (ListLongMap!21015 (_ BitVec 64)) Bool)

(declare-fun +!4578 (ListLongMap!21015 tuple2!23358) ListLongMap!21015)

(assert (=> b!1322317 (contains!8678 (+!4578 lt!588069 lt!588072) k0!1164)))

(declare-fun zeroValue!1279 () V!53251)

(declare-datatypes ((Unit!43576 0))(
  ( (Unit!43577) )
))
(declare-fun lt!588075 () Unit!43576)

(declare-fun addStillContains!1127 (ListLongMap!21015 (_ BitVec 64) V!53251 (_ BitVec 64)) Unit!43576)

(assert (=> b!1322317 (= lt!588075 (addStillContains!1127 lt!588069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1322317 (contains!8678 lt!588069 k0!1164)))

(declare-fun lt!588068 () V!53251)

(declare-fun lt!588067 () Unit!43576)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!174 ((_ BitVec 64) (_ BitVec 64) V!53251 ListLongMap!21015) Unit!43576)

(assert (=> b!1322317 (= lt!588067 (lemmaInListMapAfterAddingDiffThenInBefore!174 k0!1164 (select (arr!43046 _keys!1609) from!2000) lt!588068 lt!588069))))

(declare-fun lt!588073 () ListLongMap!21015)

(assert (=> b!1322317 (contains!8678 lt!588073 k0!1164)))

(declare-fun lt!588070 () Unit!43576)

(assert (=> b!1322317 (= lt!588070 (lemmaInListMapAfterAddingDiffThenInBefore!174 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588073))))

(declare-fun lt!588074 () ListLongMap!21015)

(assert (=> b!1322317 (contains!8678 lt!588074 k0!1164)))

(declare-fun minValue!1279 () V!53251)

(declare-fun lt!588071 () Unit!43576)

(assert (=> b!1322317 (= lt!588071 (lemmaInListMapAfterAddingDiffThenInBefore!174 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588074))))

(assert (=> b!1322317 (= lt!588074 (+!4578 lt!588073 lt!588072))))

(assert (=> b!1322317 (= lt!588072 (tuple2!23359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322317 (= lt!588073 (+!4578 lt!588069 (tuple2!23359 (select (arr!43046 _keys!1609) from!2000) lt!588068)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21666 (ValueCell!17157 V!53251) V!53251)

(declare-fun dynLambda!3517 (Int (_ BitVec 64)) V!53251)

(assert (=> b!1322317 (= lt!588068 (get!21666 (select (arr!43047 _values!1337) from!2000) (dynLambda!3517 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6213 (array!89144 array!89146 (_ BitVec 32) (_ BitVec 32) V!53251 V!53251 (_ BitVec 32) Int) ListLongMap!21015)

(assert (=> b!1322317 (= lt!588069 (getCurrentListMapNoExtraKeys!6213 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322318 () Bool)

(declare-fun res!877673 () Bool)

(assert (=> b!1322318 (=> (not res!877673) (not e!754023))))

(assert (=> b!1322318 (= res!877673 (and (= (size!43597 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43596 _keys!1609) (size!43597 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1322319 () Bool)

(declare-fun e!754024 () Bool)

(assert (=> b!1322319 (= e!754024 tp_is_empty!36111)))

(declare-fun mapNonEmpty!55814 () Bool)

(declare-fun tp!106348 () Bool)

(assert (=> mapNonEmpty!55814 (= mapRes!55814 (and tp!106348 e!754024))))

(declare-fun mapRest!55814 () (Array (_ BitVec 32) ValueCell!17157))

(declare-fun mapKey!55814 () (_ BitVec 32))

(declare-fun mapValue!55814 () ValueCell!17157)

(assert (=> mapNonEmpty!55814 (= (arr!43047 _values!1337) (store mapRest!55814 mapKey!55814 mapValue!55814))))

(declare-fun b!1322320 () Bool)

(declare-fun res!877676 () Bool)

(assert (=> b!1322320 (=> (not res!877676) (not e!754023))))

(declare-fun getCurrentListMap!5524 (array!89144 array!89146 (_ BitVec 32) (_ BitVec 32) V!53251 V!53251 (_ BitVec 32) Int) ListLongMap!21015)

(assert (=> b!1322320 (= res!877676 (contains!8678 (getCurrentListMap!5524 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(assert (= (and start!111634 res!877670) b!1322318))

(assert (= (and b!1322318 res!877673) b!1322314))

(assert (= (and b!1322314 res!877671) b!1322312))

(assert (= (and b!1322312 res!877674) b!1322316))

(assert (= (and b!1322316 res!877675) b!1322320))

(assert (= (and b!1322320 res!877676) b!1322311))

(assert (= (and b!1322311 res!877669) b!1322310))

(assert (= (and b!1322310 res!877672) b!1322317))

(assert (= (and b!1322313 condMapEmpty!55814) mapIsEmpty!55814))

(assert (= (and b!1322313 (not condMapEmpty!55814)) mapNonEmpty!55814))

(get-info :version)

(assert (= (and mapNonEmpty!55814 ((_ is ValueCellFull!17157) mapValue!55814)) b!1322319))

(assert (= (and b!1322313 ((_ is ValueCellFull!17157) mapDefault!55814)) b!1322315))

(assert (= start!111634 b!1322313))

(declare-fun b_lambda!23617 () Bool)

(assert (=> (not b_lambda!23617) (not b!1322317)))

(declare-fun t!44344 () Bool)

(declare-fun tb!11643 () Bool)

(assert (=> (and start!111634 (= defaultEntry!1340 defaultEntry!1340) t!44344) tb!11643))

(declare-fun result!24341 () Bool)

(assert (=> tb!11643 (= result!24341 tp_is_empty!36111)))

(assert (=> b!1322317 t!44344))

(declare-fun b_and!48743 () Bool)

(assert (= b_and!48741 (and (=> t!44344 result!24341) b_and!48743)))

(declare-fun m!1210541 () Bool)

(assert (=> b!1322314 m!1210541))

(declare-fun m!1210543 () Bool)

(assert (=> b!1322311 m!1210543))

(declare-fun m!1210545 () Bool)

(assert (=> mapNonEmpty!55814 m!1210545))

(assert (=> b!1322310 m!1210543))

(assert (=> b!1322310 m!1210543))

(declare-fun m!1210547 () Bool)

(assert (=> b!1322310 m!1210547))

(declare-fun m!1210549 () Bool)

(assert (=> b!1322312 m!1210549))

(declare-fun m!1210551 () Bool)

(assert (=> b!1322317 m!1210551))

(declare-fun m!1210553 () Bool)

(assert (=> b!1322317 m!1210553))

(assert (=> b!1322317 m!1210543))

(declare-fun m!1210555 () Bool)

(assert (=> b!1322317 m!1210555))

(declare-fun m!1210557 () Bool)

(assert (=> b!1322317 m!1210557))

(declare-fun m!1210559 () Bool)

(assert (=> b!1322317 m!1210559))

(declare-fun m!1210561 () Bool)

(assert (=> b!1322317 m!1210561))

(declare-fun m!1210563 () Bool)

(assert (=> b!1322317 m!1210563))

(assert (=> b!1322317 m!1210559))

(assert (=> b!1322317 m!1210563))

(assert (=> b!1322317 m!1210557))

(declare-fun m!1210565 () Bool)

(assert (=> b!1322317 m!1210565))

(declare-fun m!1210567 () Bool)

(assert (=> b!1322317 m!1210567))

(assert (=> b!1322317 m!1210543))

(declare-fun m!1210569 () Bool)

(assert (=> b!1322317 m!1210569))

(declare-fun m!1210571 () Bool)

(assert (=> b!1322317 m!1210571))

(declare-fun m!1210573 () Bool)

(assert (=> b!1322317 m!1210573))

(declare-fun m!1210575 () Bool)

(assert (=> b!1322317 m!1210575))

(declare-fun m!1210577 () Bool)

(assert (=> b!1322317 m!1210577))

(declare-fun m!1210579 () Bool)

(assert (=> b!1322317 m!1210579))

(declare-fun m!1210581 () Bool)

(assert (=> start!111634 m!1210581))

(declare-fun m!1210583 () Bool)

(assert (=> start!111634 m!1210583))

(declare-fun m!1210585 () Bool)

(assert (=> start!111634 m!1210585))

(declare-fun m!1210587 () Bool)

(assert (=> b!1322320 m!1210587))

(assert (=> b!1322320 m!1210587))

(declare-fun m!1210589 () Bool)

(assert (=> b!1322320 m!1210589))

(check-sat (not b_next!30291) (not b_lambda!23617) (not b!1322310) (not b!1322314) (not b!1322320) (not start!111634) b_and!48743 (not mapNonEmpty!55814) tp_is_empty!36111 (not b!1322317) (not b!1322312))
(check-sat b_and!48743 (not b_next!30291))
