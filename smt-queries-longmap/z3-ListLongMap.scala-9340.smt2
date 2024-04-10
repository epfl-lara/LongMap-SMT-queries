; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111478 () Bool)

(assert start!111478)

(declare-fun b_free!30135 () Bool)

(declare-fun b_next!30135 () Bool)

(assert (=> start!111478 (= b_free!30135 (not b_next!30135))))

(declare-fun tp!105881 () Bool)

(declare-fun b_and!48429 () Bool)

(assert (=> start!111478 (= tp!105881 b_and!48429)))

(declare-fun b!1319580 () Bool)

(declare-fun e!752852 () Bool)

(declare-fun e!752850 () Bool)

(declare-fun mapRes!55580 () Bool)

(assert (=> b!1319580 (= e!752852 (and e!752850 mapRes!55580))))

(declare-fun condMapEmpty!55580 () Bool)

(declare-datatypes ((V!53043 0))(
  ( (V!53044 (val!18052 Int)) )
))
(declare-datatypes ((ValueCell!17079 0))(
  ( (ValueCellFull!17079 (v!20682 V!53043)) (EmptyCell!17079) )
))
(declare-datatypes ((array!88848 0))(
  ( (array!88849 (arr!42898 (Array (_ BitVec 32) ValueCell!17079)) (size!43448 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88848)

(declare-fun mapDefault!55580 () ValueCell!17079)

(assert (=> b!1319580 (= condMapEmpty!55580 (= (arr!42898 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17079)) mapDefault!55580)))))

(declare-fun b!1319581 () Bool)

(declare-fun res!875799 () Bool)

(declare-fun e!752851 () Bool)

(assert (=> b!1319581 (=> (not res!875799) (not e!752851))))

(declare-datatypes ((array!88850 0))(
  ( (array!88851 (arr!42899 (Array (_ BitVec 32) (_ BitVec 64))) (size!43449 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88850)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53043)

(declare-fun minValue!1279 () V!53043)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23236 0))(
  ( (tuple2!23237 (_1!11629 (_ BitVec 64)) (_2!11629 V!53043)) )
))
(declare-datatypes ((List!30389 0))(
  ( (Nil!30386) (Cons!30385 (h!31594 tuple2!23236) (t!44073 List!30389)) )
))
(declare-datatypes ((ListLongMap!20893 0))(
  ( (ListLongMap!20894 (toList!10462 List!30389)) )
))
(declare-fun contains!8617 (ListLongMap!20893 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5471 (array!88850 array!88848 (_ BitVec 32) (_ BitVec 32) V!53043 V!53043 (_ BitVec 32) Int) ListLongMap!20893)

(assert (=> b!1319581 (= res!875799 (contains!8617 (getCurrentListMap!5471 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapNonEmpty!55580 () Bool)

(declare-fun tp!105880 () Bool)

(declare-fun e!752853 () Bool)

(assert (=> mapNonEmpty!55580 (= mapRes!55580 (and tp!105880 e!752853))))

(declare-fun mapRest!55580 () (Array (_ BitVec 32) ValueCell!17079))

(declare-fun mapKey!55580 () (_ BitVec 32))

(declare-fun mapValue!55580 () ValueCell!17079)

(assert (=> mapNonEmpty!55580 (= (arr!42898 _values!1337) (store mapRest!55580 mapKey!55580 mapValue!55580))))

(declare-fun mapIsEmpty!55580 () Bool)

(assert (=> mapIsEmpty!55580 mapRes!55580))

(declare-fun b!1319582 () Bool)

(declare-fun res!875797 () Bool)

(assert (=> b!1319582 (=> (not res!875797) (not e!752851))))

(assert (=> b!1319582 (= res!875797 (not (= (select (arr!42899 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1319583 () Bool)

(declare-fun res!875801 () Bool)

(assert (=> b!1319583 (=> (not res!875801) (not e!752851))))

(declare-datatypes ((List!30390 0))(
  ( (Nil!30387) (Cons!30386 (h!31595 (_ BitVec 64)) (t!44074 List!30390)) )
))
(declare-fun arrayNoDuplicates!0 (array!88850 (_ BitVec 32) List!30390) Bool)

(assert (=> b!1319583 (= res!875801 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30387))))

(declare-fun b!1319584 () Bool)

(declare-fun res!875800 () Bool)

(assert (=> b!1319584 (=> (not res!875800) (not e!752851))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88850 (_ BitVec 32)) Bool)

(assert (=> b!1319584 (= res!875800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319585 () Bool)

(assert (=> b!1319585 (= e!752851 (not true))))

(declare-fun lt!586664 () ListLongMap!20893)

(assert (=> b!1319585 (contains!8617 lt!586664 k0!1164)))

(declare-datatypes ((Unit!43462 0))(
  ( (Unit!43463) )
))
(declare-fun lt!586665 () Unit!43462)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!117 ((_ BitVec 64) (_ BitVec 64) V!53043 ListLongMap!20893) Unit!43462)

(assert (=> b!1319585 (= lt!586665 (lemmaInListMapAfterAddingDiffThenInBefore!117 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586664))))

(declare-fun +!4521 (ListLongMap!20893 tuple2!23236) ListLongMap!20893)

(declare-fun getCurrentListMapNoExtraKeys!6156 (array!88850 array!88848 (_ BitVec 32) (_ BitVec 32) V!53043 V!53043 (_ BitVec 32) Int) ListLongMap!20893)

(declare-fun get!21557 (ValueCell!17079 V!53043) V!53043)

(declare-fun dynLambda!3460 (Int (_ BitVec 64)) V!53043)

(assert (=> b!1319585 (= lt!586664 (+!4521 (+!4521 (getCurrentListMapNoExtraKeys!6156 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23237 (select (arr!42899 _keys!1609) from!2000) (get!21557 (select (arr!42898 _values!1337) from!2000) (dynLambda!3460 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23237 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun res!875802 () Bool)

(assert (=> start!111478 (=> (not res!875802) (not e!752851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111478 (= res!875802 (validMask!0 mask!2019))))

(assert (=> start!111478 e!752851))

(declare-fun array_inv!32387 (array!88850) Bool)

(assert (=> start!111478 (array_inv!32387 _keys!1609)))

(assert (=> start!111478 true))

(declare-fun tp_is_empty!35955 () Bool)

(assert (=> start!111478 tp_is_empty!35955))

(declare-fun array_inv!32388 (array!88848) Bool)

(assert (=> start!111478 (and (array_inv!32388 _values!1337) e!752852)))

(assert (=> start!111478 tp!105881))

(declare-fun b!1319586 () Bool)

(declare-fun res!875798 () Bool)

(assert (=> b!1319586 (=> (not res!875798) (not e!752851))))

(assert (=> b!1319586 (= res!875798 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43449 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319587 () Bool)

(declare-fun res!875803 () Bool)

(assert (=> b!1319587 (=> (not res!875803) (not e!752851))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319587 (= res!875803 (validKeyInArray!0 (select (arr!42899 _keys!1609) from!2000)))))

(declare-fun b!1319588 () Bool)

(declare-fun res!875804 () Bool)

(assert (=> b!1319588 (=> (not res!875804) (not e!752851))))

(assert (=> b!1319588 (= res!875804 (and (= (size!43448 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43449 _keys!1609) (size!43448 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319589 () Bool)

(assert (=> b!1319589 (= e!752853 tp_is_empty!35955)))

(declare-fun b!1319590 () Bool)

(assert (=> b!1319590 (= e!752850 tp_is_empty!35955)))

(assert (= (and start!111478 res!875802) b!1319588))

(assert (= (and b!1319588 res!875804) b!1319584))

(assert (= (and b!1319584 res!875800) b!1319583))

(assert (= (and b!1319583 res!875801) b!1319586))

(assert (= (and b!1319586 res!875798) b!1319581))

(assert (= (and b!1319581 res!875799) b!1319582))

(assert (= (and b!1319582 res!875797) b!1319587))

(assert (= (and b!1319587 res!875803) b!1319585))

(assert (= (and b!1319580 condMapEmpty!55580) mapIsEmpty!55580))

(assert (= (and b!1319580 (not condMapEmpty!55580)) mapNonEmpty!55580))

(get-info :version)

(assert (= (and mapNonEmpty!55580 ((_ is ValueCellFull!17079) mapValue!55580)) b!1319589))

(assert (= (and b!1319580 ((_ is ValueCellFull!17079) mapDefault!55580)) b!1319590))

(assert (= start!111478 b!1319580))

(declare-fun b_lambda!23461 () Bool)

(assert (=> (not b_lambda!23461) (not b!1319585)))

(declare-fun t!44072 () Bool)

(declare-fun tb!11487 () Bool)

(assert (=> (and start!111478 (= defaultEntry!1340 defaultEntry!1340) t!44072) tb!11487))

(declare-fun result!24029 () Bool)

(assert (=> tb!11487 (= result!24029 tp_is_empty!35955)))

(assert (=> b!1319585 t!44072))

(declare-fun b_and!48431 () Bool)

(assert (= b_and!48429 (and (=> t!44072 result!24029) b_and!48431)))

(declare-fun m!1207179 () Bool)

(assert (=> b!1319585 m!1207179))

(assert (=> b!1319585 m!1207179))

(declare-fun m!1207181 () Bool)

(assert (=> b!1319585 m!1207181))

(declare-fun m!1207183 () Bool)

(assert (=> b!1319585 m!1207183))

(declare-fun m!1207185 () Bool)

(assert (=> b!1319585 m!1207185))

(assert (=> b!1319585 m!1207181))

(declare-fun m!1207187 () Bool)

(assert (=> b!1319585 m!1207187))

(assert (=> b!1319585 m!1207185))

(declare-fun m!1207189 () Bool)

(assert (=> b!1319585 m!1207189))

(declare-fun m!1207191 () Bool)

(assert (=> b!1319585 m!1207191))

(declare-fun m!1207193 () Bool)

(assert (=> b!1319585 m!1207193))

(declare-fun m!1207195 () Bool)

(assert (=> b!1319585 m!1207195))

(assert (=> b!1319585 m!1207189))

(declare-fun m!1207197 () Bool)

(assert (=> b!1319584 m!1207197))

(declare-fun m!1207199 () Bool)

(assert (=> start!111478 m!1207199))

(declare-fun m!1207201 () Bool)

(assert (=> start!111478 m!1207201))

(declare-fun m!1207203 () Bool)

(assert (=> start!111478 m!1207203))

(assert (=> b!1319587 m!1207193))

(assert (=> b!1319587 m!1207193))

(declare-fun m!1207205 () Bool)

(assert (=> b!1319587 m!1207205))

(assert (=> b!1319582 m!1207193))

(declare-fun m!1207207 () Bool)

(assert (=> b!1319581 m!1207207))

(assert (=> b!1319581 m!1207207))

(declare-fun m!1207209 () Bool)

(assert (=> b!1319581 m!1207209))

(declare-fun m!1207211 () Bool)

(assert (=> mapNonEmpty!55580 m!1207211))

(declare-fun m!1207213 () Bool)

(assert (=> b!1319583 m!1207213))

(check-sat (not b!1319587) tp_is_empty!35955 (not b!1319581) b_and!48431 (not mapNonEmpty!55580) (not start!111478) (not b!1319584) (not b!1319583) (not b_next!30135) (not b_lambda!23461) (not b!1319585))
(check-sat b_and!48431 (not b_next!30135))
