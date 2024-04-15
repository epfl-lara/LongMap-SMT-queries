; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111548 () Bool)

(assert start!111548)

(declare-fun b_free!30205 () Bool)

(declare-fun b_next!30205 () Bool)

(assert (=> start!111548 (= b_free!30205 (not b_next!30205))))

(declare-fun tp!106091 () Bool)

(declare-fun b_and!48551 () Bool)

(assert (=> start!111548 (= tp!106091 b_and!48551)))

(declare-fun b!1320735 () Bool)

(declare-fun e!753344 () Bool)

(declare-fun tp_is_empty!36025 () Bool)

(assert (=> b!1320735 (= e!753344 tp_is_empty!36025)))

(declare-fun b!1320736 () Bool)

(declare-fun res!876614 () Bool)

(declare-fun e!753342 () Bool)

(assert (=> b!1320736 (=> (not res!876614) (not e!753342))))

(declare-datatypes ((array!88903 0))(
  ( (array!88904 (arr!42926 (Array (_ BitVec 32) (_ BitVec 64))) (size!43478 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88903)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53137 0))(
  ( (V!53138 (val!18087 Int)) )
))
(declare-datatypes ((ValueCell!17114 0))(
  ( (ValueCellFull!17114 (v!20716 V!53137)) (EmptyCell!17114) )
))
(declare-datatypes ((array!88905 0))(
  ( (array!88906 (arr!42927 (Array (_ BitVec 32) ValueCell!17114)) (size!43479 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88905)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1320736 (= res!876614 (and (= (size!43479 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43478 _keys!1609) (size!43479 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320737 () Bool)

(assert (=> b!1320737 (= e!753342 (not true))))

(declare-datatypes ((tuple2!23368 0))(
  ( (tuple2!23369 (_1!11695 (_ BitVec 64)) (_2!11695 V!53137)) )
))
(declare-datatypes ((List!30503 0))(
  ( (Nil!30500) (Cons!30499 (h!31708 tuple2!23368) (t!44249 List!30503)) )
))
(declare-datatypes ((ListLongMap!21025 0))(
  ( (ListLongMap!21026 (toList!10528 List!30503)) )
))
(declare-fun lt!586902 () ListLongMap!21025)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8611 (ListLongMap!21025 (_ BitVec 64)) Bool)

(assert (=> b!1320737 (contains!8611 lt!586902 k0!1164)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((Unit!43327 0))(
  ( (Unit!43328) )
))
(declare-fun lt!586899 () Unit!43327)

(declare-fun lt!586901 () V!53137)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!137 ((_ BitVec 64) (_ BitVec 64) V!53137 ListLongMap!21025) Unit!43327)

(assert (=> b!1320737 (= lt!586899 (lemmaInListMapAfterAddingDiffThenInBefore!137 k0!1164 (select (arr!42926 _keys!1609) from!2000) lt!586901 lt!586902))))

(declare-fun lt!586898 () ListLongMap!21025)

(assert (=> b!1320737 (contains!8611 lt!586898 k0!1164)))

(declare-fun lt!586896 () Unit!43327)

(declare-fun zeroValue!1279 () V!53137)

(assert (=> b!1320737 (= lt!586896 (lemmaInListMapAfterAddingDiffThenInBefore!137 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586898))))

(declare-fun lt!586897 () ListLongMap!21025)

(assert (=> b!1320737 (contains!8611 lt!586897 k0!1164)))

(declare-fun minValue!1279 () V!53137)

(declare-fun lt!586900 () Unit!43327)

(assert (=> b!1320737 (= lt!586900 (lemmaInListMapAfterAddingDiffThenInBefore!137 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586897))))

(declare-fun +!4572 (ListLongMap!21025 tuple2!23368) ListLongMap!21025)

(assert (=> b!1320737 (= lt!586897 (+!4572 lt!586898 (tuple2!23369 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1320737 (= lt!586898 (+!4572 lt!586902 (tuple2!23369 (select (arr!42926 _keys!1609) from!2000) lt!586901)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21599 (ValueCell!17114 V!53137) V!53137)

(declare-fun dynLambda!3502 (Int (_ BitVec 64)) V!53137)

(assert (=> b!1320737 (= lt!586901 (get!21599 (select (arr!42927 _values!1337) from!2000) (dynLambda!3502 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6205 (array!88903 array!88905 (_ BitVec 32) (_ BitVec 32) V!53137 V!53137 (_ BitVec 32) Int) ListLongMap!21025)

(assert (=> b!1320737 (= lt!586902 (getCurrentListMapNoExtraKeys!6205 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun res!876609 () Bool)

(assert (=> start!111548 (=> (not res!876609) (not e!753342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111548 (= res!876609 (validMask!0 mask!2019))))

(assert (=> start!111548 e!753342))

(declare-fun array_inv!32591 (array!88903) Bool)

(assert (=> start!111548 (array_inv!32591 _keys!1609)))

(assert (=> start!111548 true))

(assert (=> start!111548 tp_is_empty!36025))

(declare-fun e!753346 () Bool)

(declare-fun array_inv!32592 (array!88905) Bool)

(assert (=> start!111548 (and (array_inv!32592 _values!1337) e!753346)))

(assert (=> start!111548 tp!106091))

(declare-fun b!1320738 () Bool)

(declare-fun res!876611 () Bool)

(assert (=> b!1320738 (=> (not res!876611) (not e!753342))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320738 (= res!876611 (validKeyInArray!0 (select (arr!42926 _keys!1609) from!2000)))))

(declare-fun mapIsEmpty!55685 () Bool)

(declare-fun mapRes!55685 () Bool)

(assert (=> mapIsEmpty!55685 mapRes!55685))

(declare-fun b!1320739 () Bool)

(declare-fun res!876612 () Bool)

(assert (=> b!1320739 (=> (not res!876612) (not e!753342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88903 (_ BitVec 32)) Bool)

(assert (=> b!1320739 (= res!876612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320740 () Bool)

(declare-fun res!876608 () Bool)

(assert (=> b!1320740 (=> (not res!876608) (not e!753342))))

(assert (=> b!1320740 (= res!876608 (not (= (select (arr!42926 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1320741 () Bool)

(assert (=> b!1320741 (= e!753346 (and e!753344 mapRes!55685))))

(declare-fun condMapEmpty!55685 () Bool)

(declare-fun mapDefault!55685 () ValueCell!17114)

(assert (=> b!1320741 (= condMapEmpty!55685 (= (arr!42927 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17114)) mapDefault!55685)))))

(declare-fun b!1320742 () Bool)

(declare-fun res!876615 () Bool)

(assert (=> b!1320742 (=> (not res!876615) (not e!753342))))

(declare-fun getCurrentListMap!5415 (array!88903 array!88905 (_ BitVec 32) (_ BitVec 32) V!53137 V!53137 (_ BitVec 32) Int) ListLongMap!21025)

(assert (=> b!1320742 (= res!876615 (contains!8611 (getCurrentListMap!5415 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapNonEmpty!55685 () Bool)

(declare-fun tp!106092 () Bool)

(declare-fun e!753345 () Bool)

(assert (=> mapNonEmpty!55685 (= mapRes!55685 (and tp!106092 e!753345))))

(declare-fun mapRest!55685 () (Array (_ BitVec 32) ValueCell!17114))

(declare-fun mapValue!55685 () ValueCell!17114)

(declare-fun mapKey!55685 () (_ BitVec 32))

(assert (=> mapNonEmpty!55685 (= (arr!42927 _values!1337) (store mapRest!55685 mapKey!55685 mapValue!55685))))

(declare-fun b!1320743 () Bool)

(assert (=> b!1320743 (= e!753345 tp_is_empty!36025)))

(declare-fun b!1320744 () Bool)

(declare-fun res!876610 () Bool)

(assert (=> b!1320744 (=> (not res!876610) (not e!753342))))

(declare-datatypes ((List!30504 0))(
  ( (Nil!30501) (Cons!30500 (h!31709 (_ BitVec 64)) (t!44250 List!30504)) )
))
(declare-fun arrayNoDuplicates!0 (array!88903 (_ BitVec 32) List!30504) Bool)

(assert (=> b!1320744 (= res!876610 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30501))))

(declare-fun b!1320745 () Bool)

(declare-fun res!876613 () Bool)

(assert (=> b!1320745 (=> (not res!876613) (not e!753342))))

(assert (=> b!1320745 (= res!876613 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43478 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111548 res!876609) b!1320736))

(assert (= (and b!1320736 res!876614) b!1320739))

(assert (= (and b!1320739 res!876612) b!1320744))

(assert (= (and b!1320744 res!876610) b!1320745))

(assert (= (and b!1320745 res!876613) b!1320742))

(assert (= (and b!1320742 res!876615) b!1320740))

(assert (= (and b!1320740 res!876608) b!1320738))

(assert (= (and b!1320738 res!876611) b!1320737))

(assert (= (and b!1320741 condMapEmpty!55685) mapIsEmpty!55685))

(assert (= (and b!1320741 (not condMapEmpty!55685)) mapNonEmpty!55685))

(get-info :version)

(assert (= (and mapNonEmpty!55685 ((_ is ValueCellFull!17114) mapValue!55685)) b!1320743))

(assert (= (and b!1320741 ((_ is ValueCellFull!17114) mapDefault!55685)) b!1320735))

(assert (= start!111548 b!1320741))

(declare-fun b_lambda!23521 () Bool)

(assert (=> (not b_lambda!23521) (not b!1320737)))

(declare-fun t!44248 () Bool)

(declare-fun tb!11549 () Bool)

(assert (=> (and start!111548 (= defaultEntry!1340 defaultEntry!1340) t!44248) tb!11549))

(declare-fun result!24161 () Bool)

(assert (=> tb!11549 (= result!24161 tp_is_empty!36025)))

(assert (=> b!1320737 t!44248))

(declare-fun b_and!48553 () Bool)

(assert (= b_and!48551 (and (=> t!44248 result!24161) b_and!48553)))

(declare-fun m!1208055 () Bool)

(assert (=> b!1320739 m!1208055))

(declare-fun m!1208057 () Bool)

(assert (=> b!1320744 m!1208057))

(declare-fun m!1208059 () Bool)

(assert (=> b!1320740 m!1208059))

(declare-fun m!1208061 () Bool)

(assert (=> mapNonEmpty!55685 m!1208061))

(declare-fun m!1208063 () Bool)

(assert (=> b!1320742 m!1208063))

(assert (=> b!1320742 m!1208063))

(declare-fun m!1208065 () Bool)

(assert (=> b!1320742 m!1208065))

(declare-fun m!1208067 () Bool)

(assert (=> b!1320737 m!1208067))

(declare-fun m!1208069 () Bool)

(assert (=> b!1320737 m!1208069))

(assert (=> b!1320737 m!1208059))

(declare-fun m!1208071 () Bool)

(assert (=> b!1320737 m!1208071))

(declare-fun m!1208073 () Bool)

(assert (=> b!1320737 m!1208073))

(declare-fun m!1208075 () Bool)

(assert (=> b!1320737 m!1208075))

(declare-fun m!1208077 () Bool)

(assert (=> b!1320737 m!1208077))

(declare-fun m!1208079 () Bool)

(assert (=> b!1320737 m!1208079))

(assert (=> b!1320737 m!1208075))

(assert (=> b!1320737 m!1208067))

(declare-fun m!1208081 () Bool)

(assert (=> b!1320737 m!1208081))

(assert (=> b!1320737 m!1208059))

(declare-fun m!1208083 () Bool)

(assert (=> b!1320737 m!1208083))

(declare-fun m!1208085 () Bool)

(assert (=> b!1320737 m!1208085))

(declare-fun m!1208087 () Bool)

(assert (=> b!1320737 m!1208087))

(declare-fun m!1208089 () Bool)

(assert (=> b!1320737 m!1208089))

(assert (=> b!1320738 m!1208059))

(assert (=> b!1320738 m!1208059))

(declare-fun m!1208091 () Bool)

(assert (=> b!1320738 m!1208091))

(declare-fun m!1208093 () Bool)

(assert (=> start!111548 m!1208093))

(declare-fun m!1208095 () Bool)

(assert (=> start!111548 m!1208095))

(declare-fun m!1208097 () Bool)

(assert (=> start!111548 m!1208097))

(check-sat (not b!1320738) (not b!1320739) tp_is_empty!36025 (not b!1320737) (not b!1320742) (not mapNonEmpty!55685) (not b!1320744) b_and!48553 (not start!111548) (not b_lambda!23521) (not b_next!30205))
(check-sat b_and!48553 (not b_next!30205))
