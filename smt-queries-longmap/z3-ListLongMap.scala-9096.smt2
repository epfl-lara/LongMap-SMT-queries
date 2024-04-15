; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109360 () Bool)

(assert start!109360)

(declare-fun b_free!28849 () Bool)

(declare-fun b_next!28849 () Bool)

(assert (=> start!109360 (= b_free!28849 (not b_next!28849))))

(declare-fun tp!101666 () Bool)

(declare-fun b_and!46921 () Bool)

(assert (=> start!109360 (= tp!101666 b_and!46921)))

(declare-fun b!1294373 () Bool)

(declare-fun res!860213 () Bool)

(declare-fun e!738621 () Bool)

(assert (=> b!1294373 (=> (not res!860213) (not e!738621))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85891 0))(
  ( (array!85892 (arr!41447 (Array (_ BitVec 32) (_ BitVec 64))) (size!41999 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85891)

(assert (=> b!1294373 (= res!860213 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41999 _keys!1741))))))

(declare-fun b!1294374 () Bool)

(declare-fun res!860207 () Bool)

(assert (=> b!1294374 (=> (not res!860207) (not e!738621))))

(declare-datatypes ((List!29478 0))(
  ( (Nil!29475) (Cons!29474 (h!30683 (_ BitVec 64)) (t!43034 List!29478)) )
))
(declare-fun arrayNoDuplicates!0 (array!85891 (_ BitVec 32) List!29478) Bool)

(assert (=> b!1294374 (= res!860207 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29475))))

(declare-fun b!1294375 () Bool)

(declare-fun res!860208 () Bool)

(assert (=> b!1294375 (=> (not res!860208) (not e!738621))))

(declare-datatypes ((V!51089 0))(
  ( (V!51090 (val!17319 Int)) )
))
(declare-datatypes ((ValueCell!16346 0))(
  ( (ValueCellFull!16346 (v!19921 V!51089)) (EmptyCell!16346) )
))
(declare-datatypes ((array!85893 0))(
  ( (array!85894 (arr!41448 (Array (_ BitVec 32) ValueCell!16346)) (size!42000 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85893)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1294375 (= res!860208 (and (= (size!42000 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41999 _keys!1741) (size!42000 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1294376 () Bool)

(declare-fun res!860210 () Bool)

(assert (=> b!1294376 (=> (not res!860210) (not e!738621))))

(assert (=> b!1294376 (= res!860210 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41999 _keys!1741))))))

(declare-fun mapNonEmpty!53294 () Bool)

(declare-fun mapRes!53294 () Bool)

(declare-fun tp!101667 () Bool)

(declare-fun e!738622 () Bool)

(assert (=> mapNonEmpty!53294 (= mapRes!53294 (and tp!101667 e!738622))))

(declare-fun mapKey!53294 () (_ BitVec 32))

(declare-fun mapRest!53294 () (Array (_ BitVec 32) ValueCell!16346))

(declare-fun mapValue!53294 () ValueCell!16346)

(assert (=> mapNonEmpty!53294 (= (arr!41448 _values!1445) (store mapRest!53294 mapKey!53294 mapValue!53294))))

(declare-fun b!1294377 () Bool)

(declare-fun res!860212 () Bool)

(assert (=> b!1294377 (=> (not res!860212) (not e!738621))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85891 (_ BitVec 32)) Bool)

(assert (=> b!1294377 (= res!860212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!53294 () Bool)

(assert (=> mapIsEmpty!53294 mapRes!53294))

(declare-fun res!860214 () Bool)

(assert (=> start!109360 (=> (not res!860214) (not e!738621))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109360 (= res!860214 (validMask!0 mask!2175))))

(assert (=> start!109360 e!738621))

(declare-fun tp_is_empty!34489 () Bool)

(assert (=> start!109360 tp_is_empty!34489))

(assert (=> start!109360 true))

(declare-fun e!738624 () Bool)

(declare-fun array_inv!31551 (array!85893) Bool)

(assert (=> start!109360 (and (array_inv!31551 _values!1445) e!738624)))

(declare-fun array_inv!31552 (array!85891) Bool)

(assert (=> start!109360 (array_inv!31552 _keys!1741)))

(assert (=> start!109360 tp!101666))

(declare-fun b!1294378 () Bool)

(declare-fun e!738623 () Bool)

(assert (=> b!1294378 (= e!738623 tp_is_empty!34489)))

(declare-fun b!1294379 () Bool)

(assert (=> b!1294379 (= e!738624 (and e!738623 mapRes!53294))))

(declare-fun condMapEmpty!53294 () Bool)

(declare-fun mapDefault!53294 () ValueCell!16346)

(assert (=> b!1294379 (= condMapEmpty!53294 (= (arr!41448 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16346)) mapDefault!53294)))))

(declare-fun b!1294380 () Bool)

(assert (=> b!1294380 (= e!738621 (not true))))

(declare-datatypes ((tuple2!22338 0))(
  ( (tuple2!22339 (_1!11180 (_ BitVec 64)) (_2!11180 V!51089)) )
))
(declare-datatypes ((List!29479 0))(
  ( (Nil!29476) (Cons!29475 (h!30684 tuple2!22338) (t!43035 List!29479)) )
))
(declare-datatypes ((ListLongMap!19995 0))(
  ( (ListLongMap!19996 (toList!10013 List!29479)) )
))
(declare-fun contains!8061 (ListLongMap!19995 (_ BitVec 64)) Bool)

(assert (=> b!1294380 (not (contains!8061 (ListLongMap!19996 Nil!29476) k0!1205))))

(declare-datatypes ((Unit!42700 0))(
  ( (Unit!42701) )
))
(declare-fun lt!579538 () Unit!42700)

(declare-fun emptyContainsNothing!143 ((_ BitVec 64)) Unit!42700)

(assert (=> b!1294380 (= lt!579538 (emptyContainsNothing!143 k0!1205))))

(declare-fun b!1294381 () Bool)

(declare-fun res!860211 () Bool)

(assert (=> b!1294381 (=> (not res!860211) (not e!738621))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294381 (= res!860211 (not (validKeyInArray!0 (select (arr!41447 _keys!1741) from!2144))))))

(declare-fun b!1294382 () Bool)

(assert (=> b!1294382 (= e!738622 tp_is_empty!34489)))

(declare-fun b!1294383 () Bool)

(declare-fun res!860209 () Bool)

(assert (=> b!1294383 (=> (not res!860209) (not e!738621))))

(declare-fun minValue!1387 () V!51089)

(declare-fun zeroValue!1387 () V!51089)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4944 (array!85891 array!85893 (_ BitVec 32) (_ BitVec 32) V!51089 V!51089 (_ BitVec 32) Int) ListLongMap!19995)

(assert (=> b!1294383 (= res!860209 (contains!8061 (getCurrentListMap!4944 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109360 res!860214) b!1294375))

(assert (= (and b!1294375 res!860208) b!1294377))

(assert (= (and b!1294377 res!860212) b!1294374))

(assert (= (and b!1294374 res!860207) b!1294376))

(assert (= (and b!1294376 res!860210) b!1294383))

(assert (= (and b!1294383 res!860209) b!1294373))

(assert (= (and b!1294373 res!860213) b!1294381))

(assert (= (and b!1294381 res!860211) b!1294380))

(assert (= (and b!1294379 condMapEmpty!53294) mapIsEmpty!53294))

(assert (= (and b!1294379 (not condMapEmpty!53294)) mapNonEmpty!53294))

(get-info :version)

(assert (= (and mapNonEmpty!53294 ((_ is ValueCellFull!16346) mapValue!53294)) b!1294382))

(assert (= (and b!1294379 ((_ is ValueCellFull!16346) mapDefault!53294)) b!1294378))

(assert (= start!109360 b!1294379))

(declare-fun m!1186143 () Bool)

(assert (=> b!1294381 m!1186143))

(assert (=> b!1294381 m!1186143))

(declare-fun m!1186145 () Bool)

(assert (=> b!1294381 m!1186145))

(declare-fun m!1186147 () Bool)

(assert (=> mapNonEmpty!53294 m!1186147))

(declare-fun m!1186149 () Bool)

(assert (=> b!1294374 m!1186149))

(declare-fun m!1186151 () Bool)

(assert (=> b!1294377 m!1186151))

(declare-fun m!1186153 () Bool)

(assert (=> b!1294380 m!1186153))

(declare-fun m!1186155 () Bool)

(assert (=> b!1294380 m!1186155))

(declare-fun m!1186157 () Bool)

(assert (=> b!1294383 m!1186157))

(assert (=> b!1294383 m!1186157))

(declare-fun m!1186159 () Bool)

(assert (=> b!1294383 m!1186159))

(declare-fun m!1186161 () Bool)

(assert (=> start!109360 m!1186161))

(declare-fun m!1186163 () Bool)

(assert (=> start!109360 m!1186163))

(declare-fun m!1186165 () Bool)

(assert (=> start!109360 m!1186165))

(check-sat (not mapNonEmpty!53294) (not b!1294374) (not start!109360) (not b!1294377) (not b!1294383) b_and!46921 tp_is_empty!34489 (not b!1294381) (not b_next!28849) (not b!1294380))
(check-sat b_and!46921 (not b_next!28849))
