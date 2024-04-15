; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111572 () Bool)

(assert start!111572)

(declare-fun b_free!30229 () Bool)

(declare-fun b_next!30229 () Bool)

(assert (=> start!111572 (= b_free!30229 (not b_next!30229))))

(declare-fun tp!106164 () Bool)

(declare-fun b_and!48599 () Bool)

(assert (=> start!111572 (= tp!106164 b_and!48599)))

(declare-fun mapIsEmpty!55721 () Bool)

(declare-fun mapRes!55721 () Bool)

(assert (=> mapIsEmpty!55721 mapRes!55721))

(declare-fun mapNonEmpty!55721 () Bool)

(declare-fun tp!106163 () Bool)

(declare-fun e!753525 () Bool)

(assert (=> mapNonEmpty!55721 (= mapRes!55721 (and tp!106163 e!753525))))

(declare-datatypes ((V!53169 0))(
  ( (V!53170 (val!18099 Int)) )
))
(declare-datatypes ((ValueCell!17126 0))(
  ( (ValueCellFull!17126 (v!20728 V!53169)) (EmptyCell!17126) )
))
(declare-datatypes ((array!88951 0))(
  ( (array!88952 (arr!42950 (Array (_ BitVec 32) ValueCell!17126)) (size!43502 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88951)

(declare-fun mapKey!55721 () (_ BitVec 32))

(declare-fun mapRest!55721 () (Array (_ BitVec 32) ValueCell!17126))

(declare-fun mapValue!55721 () ValueCell!17126)

(assert (=> mapNonEmpty!55721 (= (arr!42950 _values!1337) (store mapRest!55721 mapKey!55721 mapValue!55721))))

(declare-fun b!1321155 () Bool)

(declare-fun tp_is_empty!36049 () Bool)

(assert (=> b!1321155 (= e!753525 tp_is_empty!36049)))

(declare-fun b!1321156 () Bool)

(declare-fun res!876897 () Bool)

(declare-fun e!753522 () Bool)

(assert (=> b!1321156 (=> (not res!876897) (not e!753522))))

(declare-datatypes ((array!88953 0))(
  ( (array!88954 (arr!42951 (Array (_ BitVec 32) (_ BitVec 64))) (size!43503 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88953)

(declare-datatypes ((List!30523 0))(
  ( (Nil!30520) (Cons!30519 (h!31728 (_ BitVec 64)) (t!44293 List!30523)) )
))
(declare-fun arrayNoDuplicates!0 (array!88953 (_ BitVec 32) List!30523) Bool)

(assert (=> b!1321156 (= res!876897 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30520))))

(declare-fun b!1321157 () Bool)

(assert (=> b!1321157 (= e!753522 (not true))))

(declare-datatypes ((tuple2!23390 0))(
  ( (tuple2!23391 (_1!11706 (_ BitVec 64)) (_2!11706 V!53169)) )
))
(declare-datatypes ((List!30524 0))(
  ( (Nil!30521) (Cons!30520 (h!31729 tuple2!23390) (t!44294 List!30524)) )
))
(declare-datatypes ((ListLongMap!21047 0))(
  ( (ListLongMap!21048 (toList!10539 List!30524)) )
))
(declare-fun lt!587151 () ListLongMap!21047)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8622 (ListLongMap!21047 (_ BitVec 64)) Bool)

(assert (=> b!1321157 (contains!8622 lt!587151 k0!1164)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((Unit!43347 0))(
  ( (Unit!43348) )
))
(declare-fun lt!587153 () Unit!43347)

(declare-fun lt!587148 () V!53169)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!147 ((_ BitVec 64) (_ BitVec 64) V!53169 ListLongMap!21047) Unit!43347)

(assert (=> b!1321157 (= lt!587153 (lemmaInListMapAfterAddingDiffThenInBefore!147 k0!1164 (select (arr!42951 _keys!1609) from!2000) lt!587148 lt!587151))))

(declare-fun lt!587152 () ListLongMap!21047)

(assert (=> b!1321157 (contains!8622 lt!587152 k0!1164)))

(declare-fun zeroValue!1279 () V!53169)

(declare-fun lt!587150 () Unit!43347)

(assert (=> b!1321157 (= lt!587150 (lemmaInListMapAfterAddingDiffThenInBefore!147 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587152))))

(declare-fun lt!587154 () ListLongMap!21047)

(assert (=> b!1321157 (contains!8622 lt!587154 k0!1164)))

(declare-fun minValue!1279 () V!53169)

(declare-fun lt!587149 () Unit!43347)

(assert (=> b!1321157 (= lt!587149 (lemmaInListMapAfterAddingDiffThenInBefore!147 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587154))))

(declare-fun +!4582 (ListLongMap!21047 tuple2!23390) ListLongMap!21047)

(assert (=> b!1321157 (= lt!587154 (+!4582 lt!587152 (tuple2!23391 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1321157 (= lt!587152 (+!4582 lt!587151 (tuple2!23391 (select (arr!42951 _keys!1609) from!2000) lt!587148)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21617 (ValueCell!17126 V!53169) V!53169)

(declare-fun dynLambda!3512 (Int (_ BitVec 64)) V!53169)

(assert (=> b!1321157 (= lt!587148 (get!21617 (select (arr!42950 _values!1337) from!2000) (dynLambda!3512 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6215 (array!88953 array!88951 (_ BitVec 32) (_ BitVec 32) V!53169 V!53169 (_ BitVec 32) Int) ListLongMap!21047)

(assert (=> b!1321157 (= lt!587151 (getCurrentListMapNoExtraKeys!6215 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun res!876896 () Bool)

(assert (=> start!111572 (=> (not res!876896) (not e!753522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111572 (= res!876896 (validMask!0 mask!2019))))

(assert (=> start!111572 e!753522))

(declare-fun array_inv!32611 (array!88953) Bool)

(assert (=> start!111572 (array_inv!32611 _keys!1609)))

(assert (=> start!111572 true))

(assert (=> start!111572 tp_is_empty!36049))

(declare-fun e!753524 () Bool)

(declare-fun array_inv!32612 (array!88951) Bool)

(assert (=> start!111572 (and (array_inv!32612 _values!1337) e!753524)))

(assert (=> start!111572 tp!106164))

(declare-fun b!1321158 () Bool)

(declare-fun res!876901 () Bool)

(assert (=> b!1321158 (=> (not res!876901) (not e!753522))))

(assert (=> b!1321158 (= res!876901 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43503 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1321159 () Bool)

(declare-fun res!876902 () Bool)

(assert (=> b!1321159 (=> (not res!876902) (not e!753522))))

(assert (=> b!1321159 (= res!876902 (and (= (size!43502 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43503 _keys!1609) (size!43502 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321160 () Bool)

(declare-fun res!876903 () Bool)

(assert (=> b!1321160 (=> (not res!876903) (not e!753522))))

(declare-fun getCurrentListMap!5425 (array!88953 array!88951 (_ BitVec 32) (_ BitVec 32) V!53169 V!53169 (_ BitVec 32) Int) ListLongMap!21047)

(assert (=> b!1321160 (= res!876903 (contains!8622 (getCurrentListMap!5425 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1321161 () Bool)

(declare-fun res!876899 () Bool)

(assert (=> b!1321161 (=> (not res!876899) (not e!753522))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321161 (= res!876899 (validKeyInArray!0 (select (arr!42951 _keys!1609) from!2000)))))

(declare-fun b!1321162 () Bool)

(declare-fun res!876900 () Bool)

(assert (=> b!1321162 (=> (not res!876900) (not e!753522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88953 (_ BitVec 32)) Bool)

(assert (=> b!1321162 (= res!876900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1321163 () Bool)

(declare-fun e!753523 () Bool)

(assert (=> b!1321163 (= e!753523 tp_is_empty!36049)))

(declare-fun b!1321164 () Bool)

(assert (=> b!1321164 (= e!753524 (and e!753523 mapRes!55721))))

(declare-fun condMapEmpty!55721 () Bool)

(declare-fun mapDefault!55721 () ValueCell!17126)

(assert (=> b!1321164 (= condMapEmpty!55721 (= (arr!42950 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17126)) mapDefault!55721)))))

(declare-fun b!1321165 () Bool)

(declare-fun res!876898 () Bool)

(assert (=> b!1321165 (=> (not res!876898) (not e!753522))))

(assert (=> b!1321165 (= res!876898 (not (= (select (arr!42951 _keys!1609) from!2000) k0!1164)))))

(assert (= (and start!111572 res!876896) b!1321159))

(assert (= (and b!1321159 res!876902) b!1321162))

(assert (= (and b!1321162 res!876900) b!1321156))

(assert (= (and b!1321156 res!876897) b!1321158))

(assert (= (and b!1321158 res!876901) b!1321160))

(assert (= (and b!1321160 res!876903) b!1321165))

(assert (= (and b!1321165 res!876898) b!1321161))

(assert (= (and b!1321161 res!876899) b!1321157))

(assert (= (and b!1321164 condMapEmpty!55721) mapIsEmpty!55721))

(assert (= (and b!1321164 (not condMapEmpty!55721)) mapNonEmpty!55721))

(get-info :version)

(assert (= (and mapNonEmpty!55721 ((_ is ValueCellFull!17126) mapValue!55721)) b!1321155))

(assert (= (and b!1321164 ((_ is ValueCellFull!17126) mapDefault!55721)) b!1321163))

(assert (= start!111572 b!1321164))

(declare-fun b_lambda!23545 () Bool)

(assert (=> (not b_lambda!23545) (not b!1321157)))

(declare-fun t!44292 () Bool)

(declare-fun tb!11573 () Bool)

(assert (=> (and start!111572 (= defaultEntry!1340 defaultEntry!1340) t!44292) tb!11573))

(declare-fun result!24209 () Bool)

(assert (=> tb!11573 (= result!24209 tp_is_empty!36049)))

(assert (=> b!1321157 t!44292))

(declare-fun b_and!48601 () Bool)

(assert (= b_and!48599 (and (=> t!44292 result!24209) b_and!48601)))

(declare-fun m!1208583 () Bool)

(assert (=> b!1321157 m!1208583))

(declare-fun m!1208585 () Bool)

(assert (=> b!1321157 m!1208585))

(declare-fun m!1208587 () Bool)

(assert (=> b!1321157 m!1208587))

(declare-fun m!1208589 () Bool)

(assert (=> b!1321157 m!1208589))

(declare-fun m!1208591 () Bool)

(assert (=> b!1321157 m!1208591))

(declare-fun m!1208593 () Bool)

(assert (=> b!1321157 m!1208593))

(declare-fun m!1208595 () Bool)

(assert (=> b!1321157 m!1208595))

(declare-fun m!1208597 () Bool)

(assert (=> b!1321157 m!1208597))

(assert (=> b!1321157 m!1208595))

(assert (=> b!1321157 m!1208587))

(declare-fun m!1208599 () Bool)

(assert (=> b!1321157 m!1208599))

(declare-fun m!1208601 () Bool)

(assert (=> b!1321157 m!1208601))

(declare-fun m!1208603 () Bool)

(assert (=> b!1321157 m!1208603))

(assert (=> b!1321157 m!1208601))

(declare-fun m!1208605 () Bool)

(assert (=> b!1321157 m!1208605))

(declare-fun m!1208607 () Bool)

(assert (=> b!1321157 m!1208607))

(declare-fun m!1208609 () Bool)

(assert (=> b!1321156 m!1208609))

(assert (=> b!1321161 m!1208601))

(assert (=> b!1321161 m!1208601))

(declare-fun m!1208611 () Bool)

(assert (=> b!1321161 m!1208611))

(declare-fun m!1208613 () Bool)

(assert (=> start!111572 m!1208613))

(declare-fun m!1208615 () Bool)

(assert (=> start!111572 m!1208615))

(declare-fun m!1208617 () Bool)

(assert (=> start!111572 m!1208617))

(assert (=> b!1321165 m!1208601))

(declare-fun m!1208619 () Bool)

(assert (=> mapNonEmpty!55721 m!1208619))

(declare-fun m!1208621 () Bool)

(assert (=> b!1321160 m!1208621))

(assert (=> b!1321160 m!1208621))

(declare-fun m!1208623 () Bool)

(assert (=> b!1321160 m!1208623))

(declare-fun m!1208625 () Bool)

(assert (=> b!1321162 m!1208625))

(check-sat b_and!48601 (not b!1321157) (not b!1321161) (not b!1321156) (not b!1321160) (not b_next!30229) (not start!111572) (not b_lambda!23545) (not b!1321162) (not mapNonEmpty!55721) tp_is_empty!36049)
(check-sat b_and!48601 (not b_next!30229))
