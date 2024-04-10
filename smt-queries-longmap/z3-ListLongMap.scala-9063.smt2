; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109164 () Bool)

(assert start!109164)

(declare-fun b_free!28653 () Bool)

(declare-fun b_next!28653 () Bool)

(assert (=> start!109164 (= b_free!28653 (not b_next!28653))))

(declare-fun tp!101077 () Bool)

(declare-fun b_and!46743 () Bool)

(assert (=> start!109164 (= tp!101077 b_and!46743)))

(declare-fun b!1291037 () Bool)

(declare-fun res!857724 () Bool)

(declare-fun e!737018 () Bool)

(assert (=> b!1291037 (=> (not res!857724) (not e!737018))))

(declare-datatypes ((V!50827 0))(
  ( (V!50828 (val!17221 Int)) )
))
(declare-fun minValue!1387 () V!50827)

(declare-fun zeroValue!1387 () V!50827)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16248 0))(
  ( (ValueCellFull!16248 (v!19824 V!50827)) (EmptyCell!16248) )
))
(declare-datatypes ((array!85622 0))(
  ( (array!85623 (arr!41312 (Array (_ BitVec 32) ValueCell!16248)) (size!41862 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85622)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85624 0))(
  ( (array!85625 (arr!41313 (Array (_ BitVec 32) (_ BitVec 64))) (size!41863 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85624)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22136 0))(
  ( (tuple2!22137 (_1!11079 (_ BitVec 64)) (_2!11079 V!50827)) )
))
(declare-datatypes ((List!29297 0))(
  ( (Nil!29294) (Cons!29293 (h!30502 tuple2!22136) (t!42861 List!29297)) )
))
(declare-datatypes ((ListLongMap!19793 0))(
  ( (ListLongMap!19794 (toList!9912 List!29297)) )
))
(declare-fun contains!8030 (ListLongMap!19793 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4965 (array!85624 array!85622 (_ BitVec 32) (_ BitVec 32) V!50827 V!50827 (_ BitVec 32) Int) ListLongMap!19793)

(assert (=> b!1291037 (= res!857724 (contains!8030 (getCurrentListMap!4965 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!857719 () Bool)

(assert (=> start!109164 (=> (not res!857719) (not e!737018))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109164 (= res!857719 (validMask!0 mask!2175))))

(assert (=> start!109164 e!737018))

(declare-fun tp_is_empty!34293 () Bool)

(assert (=> start!109164 tp_is_empty!34293))

(assert (=> start!109164 true))

(declare-fun e!737017 () Bool)

(declare-fun array_inv!31307 (array!85622) Bool)

(assert (=> start!109164 (and (array_inv!31307 _values!1445) e!737017)))

(declare-fun array_inv!31308 (array!85624) Bool)

(assert (=> start!109164 (array_inv!31308 _keys!1741)))

(assert (=> start!109164 tp!101077))

(declare-fun b!1291038 () Bool)

(declare-fun e!737015 () Bool)

(assert (=> b!1291038 (= e!737015 tp_is_empty!34293)))

(declare-fun b!1291039 () Bool)

(declare-fun res!857721 () Bool)

(assert (=> b!1291039 (=> (not res!857721) (not e!737018))))

(assert (=> b!1291039 (= res!857721 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41863 _keys!1741))))))

(declare-fun b!1291040 () Bool)

(declare-fun e!737014 () Bool)

(assert (=> b!1291040 (= e!737018 (not e!737014))))

(declare-fun res!857723 () Bool)

(assert (=> b!1291040 (=> res!857723 e!737014)))

(assert (=> b!1291040 (= res!857723 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1291040 (not (contains!8030 (ListLongMap!19794 Nil!29294) k0!1205))))

(declare-datatypes ((Unit!42738 0))(
  ( (Unit!42739) )
))
(declare-fun lt!578930 () Unit!42738)

(declare-fun emptyContainsNothing!93 ((_ BitVec 64)) Unit!42738)

(assert (=> b!1291040 (= lt!578930 (emptyContainsNothing!93 k0!1205))))

(declare-fun b!1291041 () Bool)

(declare-fun res!857716 () Bool)

(assert (=> b!1291041 (=> (not res!857716) (not e!737018))))

(assert (=> b!1291041 (= res!857716 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41863 _keys!1741))))))

(declare-fun b!1291042 () Bool)

(declare-fun res!857717 () Bool)

(assert (=> b!1291042 (=> (not res!857717) (not e!737018))))

(assert (=> b!1291042 (= res!857717 (and (= (size!41862 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41863 _keys!1741) (size!41862 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1291043 () Bool)

(declare-fun res!857722 () Bool)

(assert (=> b!1291043 (=> (not res!857722) (not e!737018))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291043 (= res!857722 (not (validKeyInArray!0 (select (arr!41313 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!53000 () Bool)

(declare-fun mapRes!53000 () Bool)

(assert (=> mapIsEmpty!53000 mapRes!53000))

(declare-fun b!1291044 () Bool)

(assert (=> b!1291044 (= e!737017 (and e!737015 mapRes!53000))))

(declare-fun condMapEmpty!53000 () Bool)

(declare-fun mapDefault!53000 () ValueCell!16248)

(assert (=> b!1291044 (= condMapEmpty!53000 (= (arr!41312 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16248)) mapDefault!53000)))))

(declare-fun b!1291045 () Bool)

(declare-fun res!857720 () Bool)

(assert (=> b!1291045 (=> (not res!857720) (not e!737018))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85624 (_ BitVec 32)) Bool)

(assert (=> b!1291045 (= res!857720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!53000 () Bool)

(declare-fun tp!101078 () Bool)

(declare-fun e!737013 () Bool)

(assert (=> mapNonEmpty!53000 (= mapRes!53000 (and tp!101078 e!737013))))

(declare-fun mapKey!53000 () (_ BitVec 32))

(declare-fun mapRest!53000 () (Array (_ BitVec 32) ValueCell!16248))

(declare-fun mapValue!53000 () ValueCell!16248)

(assert (=> mapNonEmpty!53000 (= (arr!41312 _values!1445) (store mapRest!53000 mapKey!53000 mapValue!53000))))

(declare-fun b!1291046 () Bool)

(declare-fun res!857718 () Bool)

(assert (=> b!1291046 (=> (not res!857718) (not e!737018))))

(declare-datatypes ((List!29298 0))(
  ( (Nil!29295) (Cons!29294 (h!30503 (_ BitVec 64)) (t!42862 List!29298)) )
))
(declare-fun arrayNoDuplicates!0 (array!85624 (_ BitVec 32) List!29298) Bool)

(assert (=> b!1291046 (= res!857718 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29295))))

(declare-fun b!1291047 () Bool)

(assert (=> b!1291047 (= e!737013 tp_is_empty!34293)))

(declare-fun b!1291048 () Bool)

(assert (=> b!1291048 (= e!737014 true)))

(assert (=> b!1291048 false))

(declare-fun lt!578929 () ListLongMap!19793)

(declare-fun lt!578925 () Unit!42738)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!52 ((_ BitVec 64) (_ BitVec 64) V!50827 ListLongMap!19793) Unit!42738)

(assert (=> b!1291048 (= lt!578925 (lemmaInListMapAfterAddingDiffThenInBefore!52 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!578929))))

(declare-fun lt!578927 () ListLongMap!19793)

(declare-fun +!4378 (ListLongMap!19793 tuple2!22136) ListLongMap!19793)

(assert (=> b!1291048 (not (contains!8030 (+!4378 lt!578927 (tuple2!22137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!578926 () Unit!42738)

(declare-fun addStillNotContains!396 (ListLongMap!19793 (_ BitVec 64) V!50827 (_ BitVec 64)) Unit!42738)

(assert (=> b!1291048 (= lt!578926 (addStillNotContains!396 lt!578927 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1291048 (not (contains!8030 lt!578929 k0!1205))))

(assert (=> b!1291048 (= lt!578929 (+!4378 lt!578927 (tuple2!22137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578928 () Unit!42738)

(assert (=> b!1291048 (= lt!578928 (addStillNotContains!396 lt!578927 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6009 (array!85624 array!85622 (_ BitVec 32) (_ BitVec 32) V!50827 V!50827 (_ BitVec 32) Int) ListLongMap!19793)

(assert (=> b!1291048 (= lt!578927 (getCurrentListMapNoExtraKeys!6009 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(assert (= (and start!109164 res!857719) b!1291042))

(assert (= (and b!1291042 res!857717) b!1291045))

(assert (= (and b!1291045 res!857720) b!1291046))

(assert (= (and b!1291046 res!857718) b!1291041))

(assert (= (and b!1291041 res!857716) b!1291037))

(assert (= (and b!1291037 res!857724) b!1291039))

(assert (= (and b!1291039 res!857721) b!1291043))

(assert (= (and b!1291043 res!857722) b!1291040))

(assert (= (and b!1291040 (not res!857723)) b!1291048))

(assert (= (and b!1291044 condMapEmpty!53000) mapIsEmpty!53000))

(assert (= (and b!1291044 (not condMapEmpty!53000)) mapNonEmpty!53000))

(get-info :version)

(assert (= (and mapNonEmpty!53000 ((_ is ValueCellFull!16248) mapValue!53000)) b!1291047))

(assert (= (and b!1291044 ((_ is ValueCellFull!16248) mapDefault!53000)) b!1291038))

(assert (= start!109164 b!1291044))

(declare-fun m!1183695 () Bool)

(assert (=> b!1291043 m!1183695))

(assert (=> b!1291043 m!1183695))

(declare-fun m!1183697 () Bool)

(assert (=> b!1291043 m!1183697))

(declare-fun m!1183699 () Bool)

(assert (=> start!109164 m!1183699))

(declare-fun m!1183701 () Bool)

(assert (=> start!109164 m!1183701))

(declare-fun m!1183703 () Bool)

(assert (=> start!109164 m!1183703))

(declare-fun m!1183705 () Bool)

(assert (=> b!1291046 m!1183705))

(declare-fun m!1183707 () Bool)

(assert (=> b!1291045 m!1183707))

(declare-fun m!1183709 () Bool)

(assert (=> b!1291037 m!1183709))

(assert (=> b!1291037 m!1183709))

(declare-fun m!1183711 () Bool)

(assert (=> b!1291037 m!1183711))

(declare-fun m!1183713 () Bool)

(assert (=> b!1291048 m!1183713))

(declare-fun m!1183715 () Bool)

(assert (=> b!1291048 m!1183715))

(declare-fun m!1183717 () Bool)

(assert (=> b!1291048 m!1183717))

(declare-fun m!1183719 () Bool)

(assert (=> b!1291048 m!1183719))

(assert (=> b!1291048 m!1183713))

(declare-fun m!1183721 () Bool)

(assert (=> b!1291048 m!1183721))

(declare-fun m!1183723 () Bool)

(assert (=> b!1291048 m!1183723))

(declare-fun m!1183725 () Bool)

(assert (=> b!1291048 m!1183725))

(declare-fun m!1183727 () Bool)

(assert (=> b!1291048 m!1183727))

(declare-fun m!1183729 () Bool)

(assert (=> mapNonEmpty!53000 m!1183729))

(declare-fun m!1183731 () Bool)

(assert (=> b!1291040 m!1183731))

(declare-fun m!1183733 () Bool)

(assert (=> b!1291040 m!1183733))

(check-sat (not b!1291037) (not b!1291046) (not b!1291040) (not b!1291045) (not b!1291043) b_and!46743 (not mapNonEmpty!53000) tp_is_empty!34293 (not b!1291048) (not start!109164) (not b_next!28653))
(check-sat b_and!46743 (not b_next!28653))
