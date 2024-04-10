; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111556 () Bool)

(assert start!111556)

(declare-fun b_free!30213 () Bool)

(declare-fun b_next!30213 () Bool)

(assert (=> start!111556 (= b_free!30213 (not b_next!30213))))

(declare-fun tp!106114 () Bool)

(declare-fun b_and!48585 () Bool)

(assert (=> start!111556 (= tp!106114 b_and!48585)))

(declare-fun b!1320945 () Bool)

(declare-fun res!876740 () Bool)

(declare-fun e!753437 () Bool)

(assert (=> b!1320945 (=> (not res!876740) (not e!753437))))

(declare-datatypes ((array!88996 0))(
  ( (array!88997 (arr!42972 (Array (_ BitVec 32) (_ BitVec 64))) (size!43522 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88996)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88996 (_ BitVec 32)) Bool)

(assert (=> b!1320945 (= res!876740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320946 () Bool)

(declare-fun e!753438 () Bool)

(declare-fun tp_is_empty!36033 () Bool)

(assert (=> b!1320946 (= e!753438 tp_is_empty!36033)))

(declare-fun b!1320947 () Bool)

(assert (=> b!1320947 (= e!753437 (not true))))

(declare-datatypes ((V!53147 0))(
  ( (V!53148 (val!18091 Int)) )
))
(declare-datatypes ((tuple2!23298 0))(
  ( (tuple2!23299 (_1!11660 (_ BitVec 64)) (_2!11660 V!53147)) )
))
(declare-datatypes ((List!30447 0))(
  ( (Nil!30444) (Cons!30443 (h!31652 tuple2!23298) (t!44209 List!30447)) )
))
(declare-datatypes ((ListLongMap!20955 0))(
  ( (ListLongMap!20956 (toList!10493 List!30447)) )
))
(declare-fun lt!587167 () ListLongMap!20955)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8648 (ListLongMap!20955 (_ BitVec 64)) Bool)

(assert (=> b!1320947 (contains!8648 lt!587167 k0!1164)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun lt!587166 () V!53147)

(declare-datatypes ((Unit!43522 0))(
  ( (Unit!43523) )
))
(declare-fun lt!587169 () Unit!43522)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!147 ((_ BitVec 64) (_ BitVec 64) V!53147 ListLongMap!20955) Unit!43522)

(assert (=> b!1320947 (= lt!587169 (lemmaInListMapAfterAddingDiffThenInBefore!147 k0!1164 (select (arr!42972 _keys!1609) from!2000) lt!587166 lt!587167))))

(declare-fun lt!587170 () ListLongMap!20955)

(assert (=> b!1320947 (contains!8648 lt!587170 k0!1164)))

(declare-fun zeroValue!1279 () V!53147)

(declare-fun lt!587168 () Unit!43522)

(assert (=> b!1320947 (= lt!587168 (lemmaInListMapAfterAddingDiffThenInBefore!147 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587170))))

(declare-fun lt!587171 () ListLongMap!20955)

(assert (=> b!1320947 (contains!8648 lt!587171 k0!1164)))

(declare-fun minValue!1279 () V!53147)

(declare-fun lt!587172 () Unit!43522)

(assert (=> b!1320947 (= lt!587172 (lemmaInListMapAfterAddingDiffThenInBefore!147 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587171))))

(declare-fun +!4551 (ListLongMap!20955 tuple2!23298) ListLongMap!20955)

(assert (=> b!1320947 (= lt!587171 (+!4551 lt!587170 (tuple2!23299 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1320947 (= lt!587170 (+!4551 lt!587167 (tuple2!23299 (select (arr!42972 _keys!1609) from!2000) lt!587166)))))

(declare-datatypes ((ValueCell!17118 0))(
  ( (ValueCellFull!17118 (v!20721 V!53147)) (EmptyCell!17118) )
))
(declare-datatypes ((array!88998 0))(
  ( (array!88999 (arr!42973 (Array (_ BitVec 32) ValueCell!17118)) (size!43523 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88998)

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21613 (ValueCell!17118 V!53147) V!53147)

(declare-fun dynLambda!3490 (Int (_ BitVec 64)) V!53147)

(assert (=> b!1320947 (= lt!587166 (get!21613 (select (arr!42973 _values!1337) from!2000) (dynLambda!3490 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6186 (array!88996 array!88998 (_ BitVec 32) (_ BitVec 32) V!53147 V!53147 (_ BitVec 32) Int) ListLongMap!20955)

(assert (=> b!1320947 (= lt!587167 (getCurrentListMapNoExtraKeys!6186 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1320948 () Bool)

(declare-fun e!753439 () Bool)

(assert (=> b!1320948 (= e!753439 tp_is_empty!36033)))

(declare-fun b!1320949 () Bool)

(declare-fun res!876739 () Bool)

(assert (=> b!1320949 (=> (not res!876739) (not e!753437))))

(assert (=> b!1320949 (= res!876739 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43522 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320950 () Bool)

(declare-fun e!753435 () Bool)

(declare-fun mapRes!55697 () Bool)

(assert (=> b!1320950 (= e!753435 (and e!753439 mapRes!55697))))

(declare-fun condMapEmpty!55697 () Bool)

(declare-fun mapDefault!55697 () ValueCell!17118)

(assert (=> b!1320950 (= condMapEmpty!55697 (= (arr!42973 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17118)) mapDefault!55697)))))

(declare-fun mapIsEmpty!55697 () Bool)

(assert (=> mapIsEmpty!55697 mapRes!55697))

(declare-fun res!876736 () Bool)

(assert (=> start!111556 (=> (not res!876736) (not e!753437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111556 (= res!876736 (validMask!0 mask!2019))))

(assert (=> start!111556 e!753437))

(declare-fun array_inv!32441 (array!88996) Bool)

(assert (=> start!111556 (array_inv!32441 _keys!1609)))

(assert (=> start!111556 true))

(assert (=> start!111556 tp_is_empty!36033))

(declare-fun array_inv!32442 (array!88998) Bool)

(assert (=> start!111556 (and (array_inv!32442 _values!1337) e!753435)))

(assert (=> start!111556 tp!106114))

(declare-fun b!1320951 () Bool)

(declare-fun res!876735 () Bool)

(assert (=> b!1320951 (=> (not res!876735) (not e!753437))))

(assert (=> b!1320951 (= res!876735 (not (= (select (arr!42972 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapNonEmpty!55697 () Bool)

(declare-fun tp!106115 () Bool)

(assert (=> mapNonEmpty!55697 (= mapRes!55697 (and tp!106115 e!753438))))

(declare-fun mapValue!55697 () ValueCell!17118)

(declare-fun mapKey!55697 () (_ BitVec 32))

(declare-fun mapRest!55697 () (Array (_ BitVec 32) ValueCell!17118))

(assert (=> mapNonEmpty!55697 (= (arr!42973 _values!1337) (store mapRest!55697 mapKey!55697 mapValue!55697))))

(declare-fun b!1320952 () Bool)

(declare-fun res!876738 () Bool)

(assert (=> b!1320952 (=> (not res!876738) (not e!753437))))

(assert (=> b!1320952 (= res!876738 (and (= (size!43523 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43522 _keys!1609) (size!43523 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320953 () Bool)

(declare-fun res!876737 () Bool)

(assert (=> b!1320953 (=> (not res!876737) (not e!753437))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320953 (= res!876737 (validKeyInArray!0 (select (arr!42972 _keys!1609) from!2000)))))

(declare-fun b!1320954 () Bool)

(declare-fun res!876734 () Bool)

(assert (=> b!1320954 (=> (not res!876734) (not e!753437))))

(declare-fun getCurrentListMap!5496 (array!88996 array!88998 (_ BitVec 32) (_ BitVec 32) V!53147 V!53147 (_ BitVec 32) Int) ListLongMap!20955)

(assert (=> b!1320954 (= res!876734 (contains!8648 (getCurrentListMap!5496 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1320955 () Bool)

(declare-fun res!876733 () Bool)

(assert (=> b!1320955 (=> (not res!876733) (not e!753437))))

(declare-datatypes ((List!30448 0))(
  ( (Nil!30445) (Cons!30444 (h!31653 (_ BitVec 64)) (t!44210 List!30448)) )
))
(declare-fun arrayNoDuplicates!0 (array!88996 (_ BitVec 32) List!30448) Bool)

(assert (=> b!1320955 (= res!876733 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30445))))

(assert (= (and start!111556 res!876736) b!1320952))

(assert (= (and b!1320952 res!876738) b!1320945))

(assert (= (and b!1320945 res!876740) b!1320955))

(assert (= (and b!1320955 res!876733) b!1320949))

(assert (= (and b!1320949 res!876739) b!1320954))

(assert (= (and b!1320954 res!876734) b!1320951))

(assert (= (and b!1320951 res!876735) b!1320953))

(assert (= (and b!1320953 res!876737) b!1320947))

(assert (= (and b!1320950 condMapEmpty!55697) mapIsEmpty!55697))

(assert (= (and b!1320950 (not condMapEmpty!55697)) mapNonEmpty!55697))

(get-info :version)

(assert (= (and mapNonEmpty!55697 ((_ is ValueCellFull!17118) mapValue!55697)) b!1320946))

(assert (= (and b!1320950 ((_ is ValueCellFull!17118) mapDefault!55697)) b!1320948))

(assert (= start!111556 b!1320950))

(declare-fun b_lambda!23539 () Bool)

(assert (=> (not b_lambda!23539) (not b!1320947)))

(declare-fun t!44208 () Bool)

(declare-fun tb!11565 () Bool)

(assert (=> (and start!111556 (= defaultEntry!1340 defaultEntry!1340) t!44208) tb!11565))

(declare-fun result!24185 () Bool)

(assert (=> tb!11565 (= result!24185 tp_is_empty!36033)))

(assert (=> b!1320947 t!44208))

(declare-fun b_and!48587 () Bool)

(assert (= b_and!48585 (and (=> t!44208 result!24185) b_and!48587)))

(declare-fun m!1208747 () Bool)

(assert (=> b!1320945 m!1208747))

(declare-fun m!1208749 () Bool)

(assert (=> b!1320953 m!1208749))

(assert (=> b!1320953 m!1208749))

(declare-fun m!1208751 () Bool)

(assert (=> b!1320953 m!1208751))

(assert (=> b!1320951 m!1208749))

(declare-fun m!1208753 () Bool)

(assert (=> mapNonEmpty!55697 m!1208753))

(declare-fun m!1208755 () Bool)

(assert (=> b!1320954 m!1208755))

(assert (=> b!1320954 m!1208755))

(declare-fun m!1208757 () Bool)

(assert (=> b!1320954 m!1208757))

(declare-fun m!1208759 () Bool)

(assert (=> start!111556 m!1208759))

(declare-fun m!1208761 () Bool)

(assert (=> start!111556 m!1208761))

(declare-fun m!1208763 () Bool)

(assert (=> start!111556 m!1208763))

(declare-fun m!1208765 () Bool)

(assert (=> b!1320947 m!1208765))

(declare-fun m!1208767 () Bool)

(assert (=> b!1320947 m!1208767))

(declare-fun m!1208769 () Bool)

(assert (=> b!1320947 m!1208769))

(declare-fun m!1208771 () Bool)

(assert (=> b!1320947 m!1208771))

(declare-fun m!1208773 () Bool)

(assert (=> b!1320947 m!1208773))

(declare-fun m!1208775 () Bool)

(assert (=> b!1320947 m!1208775))

(assert (=> b!1320947 m!1208749))

(declare-fun m!1208777 () Bool)

(assert (=> b!1320947 m!1208777))

(declare-fun m!1208779 () Bool)

(assert (=> b!1320947 m!1208779))

(declare-fun m!1208781 () Bool)

(assert (=> b!1320947 m!1208781))

(assert (=> b!1320947 m!1208779))

(assert (=> b!1320947 m!1208773))

(declare-fun m!1208783 () Bool)

(assert (=> b!1320947 m!1208783))

(declare-fun m!1208785 () Bool)

(assert (=> b!1320947 m!1208785))

(assert (=> b!1320947 m!1208749))

(declare-fun m!1208787 () Bool)

(assert (=> b!1320947 m!1208787))

(declare-fun m!1208789 () Bool)

(assert (=> b!1320955 m!1208789))

(check-sat (not b!1320947) (not b!1320955) b_and!48587 (not start!111556) (not mapNonEmpty!55697) tp_is_empty!36033 (not b_lambda!23539) (not b!1320953) (not b!1320954) (not b_next!30213) (not b!1320945))
(check-sat b_and!48587 (not b_next!30213))
