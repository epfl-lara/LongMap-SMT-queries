; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111554 () Bool)

(assert start!111554)

(declare-fun b_free!30211 () Bool)

(declare-fun b_next!30211 () Bool)

(assert (=> start!111554 (= b_free!30211 (not b_next!30211))))

(declare-fun tp!106110 () Bool)

(declare-fun b_and!48563 () Bool)

(assert (=> start!111554 (= tp!106110 b_and!48563)))

(declare-fun b!1320841 () Bool)

(declare-fun e!753391 () Bool)

(assert (=> b!1320841 (= e!753391 (not true))))

(declare-datatypes ((V!53145 0))(
  ( (V!53146 (val!18090 Int)) )
))
(declare-datatypes ((tuple2!23374 0))(
  ( (tuple2!23375 (_1!11698 (_ BitVec 64)) (_2!11698 V!53145)) )
))
(declare-datatypes ((List!30508 0))(
  ( (Nil!30505) (Cons!30504 (h!31713 tuple2!23374) (t!44260 List!30508)) )
))
(declare-datatypes ((ListLongMap!21031 0))(
  ( (ListLongMap!21032 (toList!10531 List!30508)) )
))
(declare-fun lt!586962 () ListLongMap!21031)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8614 (ListLongMap!21031 (_ BitVec 64)) Bool)

(assert (=> b!1320841 (contains!8614 lt!586962 k0!1164)))

(declare-datatypes ((array!88915 0))(
  ( (array!88916 (arr!42932 (Array (_ BitVec 32) (_ BitVec 64))) (size!43484 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88915)

(declare-datatypes ((Unit!43331 0))(
  ( (Unit!43332) )
))
(declare-fun lt!586960 () Unit!43331)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun lt!586964 () V!53145)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!139 ((_ BitVec 64) (_ BitVec 64) V!53145 ListLongMap!21031) Unit!43331)

(assert (=> b!1320841 (= lt!586960 (lemmaInListMapAfterAddingDiffThenInBefore!139 k0!1164 (select (arr!42932 _keys!1609) from!2000) lt!586964 lt!586962))))

(declare-fun lt!586965 () ListLongMap!21031)

(assert (=> b!1320841 (contains!8614 lt!586965 k0!1164)))

(declare-fun zeroValue!1279 () V!53145)

(declare-fun lt!586963 () Unit!43331)

(assert (=> b!1320841 (= lt!586963 (lemmaInListMapAfterAddingDiffThenInBefore!139 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586965))))

(declare-fun lt!586961 () ListLongMap!21031)

(assert (=> b!1320841 (contains!8614 lt!586961 k0!1164)))

(declare-fun lt!586959 () Unit!43331)

(declare-fun minValue!1279 () V!53145)

(assert (=> b!1320841 (= lt!586959 (lemmaInListMapAfterAddingDiffThenInBefore!139 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586961))))

(declare-fun +!4574 (ListLongMap!21031 tuple2!23374) ListLongMap!21031)

(assert (=> b!1320841 (= lt!586961 (+!4574 lt!586965 (tuple2!23375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1320841 (= lt!586965 (+!4574 lt!586962 (tuple2!23375 (select (arr!42932 _keys!1609) from!2000) lt!586964)))))

(declare-datatypes ((ValueCell!17117 0))(
  ( (ValueCellFull!17117 (v!20719 V!53145)) (EmptyCell!17117) )
))
(declare-datatypes ((array!88917 0))(
  ( (array!88918 (arr!42933 (Array (_ BitVec 32) ValueCell!17117)) (size!43485 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88917)

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21603 (ValueCell!17117 V!53145) V!53145)

(declare-fun dynLambda!3504 (Int (_ BitVec 64)) V!53145)

(assert (=> b!1320841 (= lt!586964 (get!21603 (select (arr!42933 _values!1337) from!2000) (dynLambda!3504 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6207 (array!88915 array!88917 (_ BitVec 32) (_ BitVec 32) V!53145 V!53145 (_ BitVec 32) Int) ListLongMap!21031)

(assert (=> b!1320841 (= lt!586962 (getCurrentListMapNoExtraKeys!6207 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1320842 () Bool)

(declare-fun e!753388 () Bool)

(declare-fun tp_is_empty!36031 () Bool)

(assert (=> b!1320842 (= e!753388 tp_is_empty!36031)))

(declare-fun b!1320843 () Bool)

(declare-fun res!876685 () Bool)

(assert (=> b!1320843 (=> (not res!876685) (not e!753391))))

(declare-datatypes ((List!30509 0))(
  ( (Nil!30506) (Cons!30505 (h!31714 (_ BitVec 64)) (t!44261 List!30509)) )
))
(declare-fun arrayNoDuplicates!0 (array!88915 (_ BitVec 32) List!30509) Bool)

(assert (=> b!1320843 (= res!876685 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30506))))

(declare-fun b!1320844 () Bool)

(declare-fun res!876680 () Bool)

(assert (=> b!1320844 (=> (not res!876680) (not e!753391))))

(assert (=> b!1320844 (= res!876680 (and (= (size!43485 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43484 _keys!1609) (size!43485 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55694 () Bool)

(declare-fun mapRes!55694 () Bool)

(assert (=> mapIsEmpty!55694 mapRes!55694))

(declare-fun b!1320845 () Bool)

(declare-fun res!876686 () Bool)

(assert (=> b!1320845 (=> (not res!876686) (not e!753391))))

(declare-fun getCurrentListMap!5417 (array!88915 array!88917 (_ BitVec 32) (_ BitVec 32) V!53145 V!53145 (_ BitVec 32) Int) ListLongMap!21031)

(assert (=> b!1320845 (= res!876686 (contains!8614 (getCurrentListMap!5417 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1320846 () Bool)

(declare-fun res!876687 () Bool)

(assert (=> b!1320846 (=> (not res!876687) (not e!753391))))

(assert (=> b!1320846 (= res!876687 (not (= (select (arr!42932 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1320847 () Bool)

(declare-fun e!753389 () Bool)

(assert (=> b!1320847 (= e!753389 (and e!753388 mapRes!55694))))

(declare-fun condMapEmpty!55694 () Bool)

(declare-fun mapDefault!55694 () ValueCell!17117)

(assert (=> b!1320847 (= condMapEmpty!55694 (= (arr!42933 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17117)) mapDefault!55694)))))

(declare-fun b!1320848 () Bool)

(declare-fun e!753390 () Bool)

(assert (=> b!1320848 (= e!753390 tp_is_empty!36031)))

(declare-fun mapNonEmpty!55694 () Bool)

(declare-fun tp!106109 () Bool)

(assert (=> mapNonEmpty!55694 (= mapRes!55694 (and tp!106109 e!753390))))

(declare-fun mapValue!55694 () ValueCell!17117)

(declare-fun mapRest!55694 () (Array (_ BitVec 32) ValueCell!17117))

(declare-fun mapKey!55694 () (_ BitVec 32))

(assert (=> mapNonEmpty!55694 (= (arr!42933 _values!1337) (store mapRest!55694 mapKey!55694 mapValue!55694))))

(declare-fun res!876681 () Bool)

(assert (=> start!111554 (=> (not res!876681) (not e!753391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111554 (= res!876681 (validMask!0 mask!2019))))

(assert (=> start!111554 e!753391))

(declare-fun array_inv!32597 (array!88915) Bool)

(assert (=> start!111554 (array_inv!32597 _keys!1609)))

(assert (=> start!111554 true))

(assert (=> start!111554 tp_is_empty!36031))

(declare-fun array_inv!32598 (array!88917) Bool)

(assert (=> start!111554 (and (array_inv!32598 _values!1337) e!753389)))

(assert (=> start!111554 tp!106110))

(declare-fun b!1320840 () Bool)

(declare-fun res!876683 () Bool)

(assert (=> b!1320840 (=> (not res!876683) (not e!753391))))

(assert (=> b!1320840 (= res!876683 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43484 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320849 () Bool)

(declare-fun res!876684 () Bool)

(assert (=> b!1320849 (=> (not res!876684) (not e!753391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88915 (_ BitVec 32)) Bool)

(assert (=> b!1320849 (= res!876684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320850 () Bool)

(declare-fun res!876682 () Bool)

(assert (=> b!1320850 (=> (not res!876682) (not e!753391))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320850 (= res!876682 (validKeyInArray!0 (select (arr!42932 _keys!1609) from!2000)))))

(assert (= (and start!111554 res!876681) b!1320844))

(assert (= (and b!1320844 res!876680) b!1320849))

(assert (= (and b!1320849 res!876684) b!1320843))

(assert (= (and b!1320843 res!876685) b!1320840))

(assert (= (and b!1320840 res!876683) b!1320845))

(assert (= (and b!1320845 res!876686) b!1320846))

(assert (= (and b!1320846 res!876687) b!1320850))

(assert (= (and b!1320850 res!876682) b!1320841))

(assert (= (and b!1320847 condMapEmpty!55694) mapIsEmpty!55694))

(assert (= (and b!1320847 (not condMapEmpty!55694)) mapNonEmpty!55694))

(get-info :version)

(assert (= (and mapNonEmpty!55694 ((_ is ValueCellFull!17117) mapValue!55694)) b!1320848))

(assert (= (and b!1320847 ((_ is ValueCellFull!17117) mapDefault!55694)) b!1320842))

(assert (= start!111554 b!1320847))

(declare-fun b_lambda!23527 () Bool)

(assert (=> (not b_lambda!23527) (not b!1320841)))

(declare-fun t!44259 () Bool)

(declare-fun tb!11555 () Bool)

(assert (=> (and start!111554 (= defaultEntry!1340 defaultEntry!1340) t!44259) tb!11555))

(declare-fun result!24173 () Bool)

(assert (=> tb!11555 (= result!24173 tp_is_empty!36031)))

(assert (=> b!1320841 t!44259))

(declare-fun b_and!48565 () Bool)

(assert (= b_and!48563 (and (=> t!44259 result!24173) b_and!48565)))

(declare-fun m!1208187 () Bool)

(assert (=> mapNonEmpty!55694 m!1208187))

(declare-fun m!1208189 () Bool)

(assert (=> b!1320846 m!1208189))

(declare-fun m!1208191 () Bool)

(assert (=> b!1320849 m!1208191))

(assert (=> b!1320850 m!1208189))

(assert (=> b!1320850 m!1208189))

(declare-fun m!1208193 () Bool)

(assert (=> b!1320850 m!1208193))

(declare-fun m!1208195 () Bool)

(assert (=> b!1320845 m!1208195))

(assert (=> b!1320845 m!1208195))

(declare-fun m!1208197 () Bool)

(assert (=> b!1320845 m!1208197))

(declare-fun m!1208199 () Bool)

(assert (=> b!1320841 m!1208199))

(declare-fun m!1208201 () Bool)

(assert (=> b!1320841 m!1208201))

(declare-fun m!1208203 () Bool)

(assert (=> b!1320841 m!1208203))

(declare-fun m!1208205 () Bool)

(assert (=> b!1320841 m!1208205))

(declare-fun m!1208207 () Bool)

(assert (=> b!1320841 m!1208207))

(declare-fun m!1208209 () Bool)

(assert (=> b!1320841 m!1208209))

(declare-fun m!1208211 () Bool)

(assert (=> b!1320841 m!1208211))

(assert (=> b!1320841 m!1208211))

(assert (=> b!1320841 m!1208203))

(declare-fun m!1208213 () Bool)

(assert (=> b!1320841 m!1208213))

(declare-fun m!1208215 () Bool)

(assert (=> b!1320841 m!1208215))

(assert (=> b!1320841 m!1208189))

(assert (=> b!1320841 m!1208189))

(declare-fun m!1208217 () Bool)

(assert (=> b!1320841 m!1208217))

(declare-fun m!1208219 () Bool)

(assert (=> b!1320841 m!1208219))

(declare-fun m!1208221 () Bool)

(assert (=> b!1320841 m!1208221))

(declare-fun m!1208223 () Bool)

(assert (=> start!111554 m!1208223))

(declare-fun m!1208225 () Bool)

(assert (=> start!111554 m!1208225))

(declare-fun m!1208227 () Bool)

(assert (=> start!111554 m!1208227))

(declare-fun m!1208229 () Bool)

(assert (=> b!1320843 m!1208229))

(check-sat (not b_lambda!23527) (not b!1320849) (not b!1320843) (not b!1320845) (not b!1320841) b_and!48565 (not start!111554) (not mapNonEmpty!55694) (not b!1320850) tp_is_empty!36031 (not b_next!30211))
(check-sat b_and!48565 (not b_next!30211))
