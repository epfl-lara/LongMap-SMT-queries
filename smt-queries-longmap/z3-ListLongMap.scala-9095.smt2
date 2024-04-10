; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109356 () Bool)

(assert start!109356)

(declare-fun b_free!28845 () Bool)

(declare-fun b_next!28845 () Bool)

(assert (=> start!109356 (= b_free!28845 (not b_next!28845))))

(declare-fun tp!101654 () Bool)

(declare-fun b_and!46935 () Bool)

(assert (=> start!109356 (= tp!101654 b_and!46935)))

(declare-fun b!1294371 () Bool)

(declare-fun res!860192 () Bool)

(declare-fun e!738622 () Bool)

(assert (=> b!1294371 (=> (not res!860192) (not e!738622))))

(declare-datatypes ((array!85992 0))(
  ( (array!85993 (arr!41497 (Array (_ BitVec 32) (_ BitVec 64))) (size!42047 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85992)

(declare-datatypes ((List!29435 0))(
  ( (Nil!29432) (Cons!29431 (h!30640 (_ BitVec 64)) (t!42999 List!29435)) )
))
(declare-fun arrayNoDuplicates!0 (array!85992 (_ BitVec 32) List!29435) Bool)

(assert (=> b!1294371 (= res!860192 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29432))))

(declare-fun mapIsEmpty!53288 () Bool)

(declare-fun mapRes!53288 () Bool)

(assert (=> mapIsEmpty!53288 mapRes!53288))

(declare-fun b!1294372 () Bool)

(assert (=> b!1294372 (= e!738622 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!51083 0))(
  ( (V!51084 (val!17317 Int)) )
))
(declare-datatypes ((tuple2!22292 0))(
  ( (tuple2!22293 (_1!11157 (_ BitVec 64)) (_2!11157 V!51083)) )
))
(declare-datatypes ((List!29436 0))(
  ( (Nil!29433) (Cons!29432 (h!30641 tuple2!22292) (t!43000 List!29436)) )
))
(declare-datatypes ((ListLongMap!19949 0))(
  ( (ListLongMap!19950 (toList!9990 List!29436)) )
))
(declare-fun contains!8108 (ListLongMap!19949 (_ BitVec 64)) Bool)

(assert (=> b!1294372 (not (contains!8108 (ListLongMap!19950 Nil!29433) k0!1205))))

(declare-datatypes ((Unit!42870 0))(
  ( (Unit!42871) )
))
(declare-fun lt!579710 () Unit!42870)

(declare-fun emptyContainsNothing!156 ((_ BitVec 64)) Unit!42870)

(assert (=> b!1294372 (= lt!579710 (emptyContainsNothing!156 k0!1205))))

(declare-fun b!1294373 () Bool)

(declare-fun e!738619 () Bool)

(declare-fun tp_is_empty!34485 () Bool)

(assert (=> b!1294373 (= e!738619 tp_is_empty!34485)))

(declare-fun res!860188 () Bool)

(assert (=> start!109356 (=> (not res!860188) (not e!738622))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109356 (= res!860188 (validMask!0 mask!2175))))

(assert (=> start!109356 e!738622))

(assert (=> start!109356 tp_is_empty!34485))

(assert (=> start!109356 true))

(declare-datatypes ((ValueCell!16344 0))(
  ( (ValueCellFull!16344 (v!19920 V!51083)) (EmptyCell!16344) )
))
(declare-datatypes ((array!85994 0))(
  ( (array!85995 (arr!41498 (Array (_ BitVec 32) ValueCell!16344)) (size!42048 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85994)

(declare-fun e!738620 () Bool)

(declare-fun array_inv!31427 (array!85994) Bool)

(assert (=> start!109356 (and (array_inv!31427 _values!1445) e!738620)))

(declare-fun array_inv!31428 (array!85992) Bool)

(assert (=> start!109356 (array_inv!31428 _keys!1741)))

(assert (=> start!109356 tp!101654))

(declare-fun b!1294374 () Bool)

(declare-fun res!860186 () Bool)

(assert (=> b!1294374 (=> (not res!860186) (not e!738622))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294374 (= res!860186 (not (validKeyInArray!0 (select (arr!41497 _keys!1741) from!2144))))))

(declare-fun b!1294375 () Bool)

(declare-fun e!738621 () Bool)

(assert (=> b!1294375 (= e!738620 (and e!738621 mapRes!53288))))

(declare-fun condMapEmpty!53288 () Bool)

(declare-fun mapDefault!53288 () ValueCell!16344)

(assert (=> b!1294375 (= condMapEmpty!53288 (= (arr!41498 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16344)) mapDefault!53288)))))

(declare-fun b!1294376 () Bool)

(declare-fun res!860191 () Bool)

(assert (=> b!1294376 (=> (not res!860191) (not e!738622))))

(assert (=> b!1294376 (= res!860191 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42047 _keys!1741))))))

(declare-fun mapNonEmpty!53288 () Bool)

(declare-fun tp!101653 () Bool)

(assert (=> mapNonEmpty!53288 (= mapRes!53288 (and tp!101653 e!738619))))

(declare-fun mapRest!53288 () (Array (_ BitVec 32) ValueCell!16344))

(declare-fun mapValue!53288 () ValueCell!16344)

(declare-fun mapKey!53288 () (_ BitVec 32))

(assert (=> mapNonEmpty!53288 (= (arr!41498 _values!1445) (store mapRest!53288 mapKey!53288 mapValue!53288))))

(declare-fun b!1294377 () Bool)

(declare-fun res!860190 () Bool)

(assert (=> b!1294377 (=> (not res!860190) (not e!738622))))

(declare-fun zeroValue!1387 () V!51083)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun minValue!1387 () V!51083)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5028 (array!85992 array!85994 (_ BitVec 32) (_ BitVec 32) V!51083 V!51083 (_ BitVec 32) Int) ListLongMap!19949)

(assert (=> b!1294377 (= res!860190 (contains!8108 (getCurrentListMap!5028 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1294378 () Bool)

(declare-fun res!860193 () Bool)

(assert (=> b!1294378 (=> (not res!860193) (not e!738622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85992 (_ BitVec 32)) Bool)

(assert (=> b!1294378 (= res!860193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294379 () Bool)

(assert (=> b!1294379 (= e!738621 tp_is_empty!34485)))

(declare-fun b!1294380 () Bool)

(declare-fun res!860187 () Bool)

(assert (=> b!1294380 (=> (not res!860187) (not e!738622))))

(assert (=> b!1294380 (= res!860187 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42047 _keys!1741))))))

(declare-fun b!1294381 () Bool)

(declare-fun res!860189 () Bool)

(assert (=> b!1294381 (=> (not res!860189) (not e!738622))))

(assert (=> b!1294381 (= res!860189 (and (= (size!42048 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42047 _keys!1741) (size!42048 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!109356 res!860188) b!1294381))

(assert (= (and b!1294381 res!860189) b!1294378))

(assert (= (and b!1294378 res!860193) b!1294371))

(assert (= (and b!1294371 res!860192) b!1294380))

(assert (= (and b!1294380 res!860187) b!1294377))

(assert (= (and b!1294377 res!860190) b!1294376))

(assert (= (and b!1294376 res!860191) b!1294374))

(assert (= (and b!1294374 res!860186) b!1294372))

(assert (= (and b!1294375 condMapEmpty!53288) mapIsEmpty!53288))

(assert (= (and b!1294375 (not condMapEmpty!53288)) mapNonEmpty!53288))

(get-info :version)

(assert (= (and mapNonEmpty!53288 ((_ is ValueCellFull!16344) mapValue!53288)) b!1294373))

(assert (= (and b!1294375 ((_ is ValueCellFull!16344) mapDefault!53288)) b!1294379))

(assert (= start!109356 b!1294375))

(declare-fun m!1186595 () Bool)

(assert (=> mapNonEmpty!53288 m!1186595))

(declare-fun m!1186597 () Bool)

(assert (=> b!1294377 m!1186597))

(assert (=> b!1294377 m!1186597))

(declare-fun m!1186599 () Bool)

(assert (=> b!1294377 m!1186599))

(declare-fun m!1186601 () Bool)

(assert (=> b!1294374 m!1186601))

(assert (=> b!1294374 m!1186601))

(declare-fun m!1186603 () Bool)

(assert (=> b!1294374 m!1186603))

(declare-fun m!1186605 () Bool)

(assert (=> b!1294378 m!1186605))

(declare-fun m!1186607 () Bool)

(assert (=> b!1294372 m!1186607))

(declare-fun m!1186609 () Bool)

(assert (=> b!1294372 m!1186609))

(declare-fun m!1186611 () Bool)

(assert (=> b!1294371 m!1186611))

(declare-fun m!1186613 () Bool)

(assert (=> start!109356 m!1186613))

(declare-fun m!1186615 () Bool)

(assert (=> start!109356 m!1186615))

(declare-fun m!1186617 () Bool)

(assert (=> start!109356 m!1186617))

(check-sat (not b!1294372) (not b_next!28845) tp_is_empty!34485 (not b!1294377) (not start!109356) (not b!1294374) (not b!1294378) b_and!46935 (not mapNonEmpty!53288) (not b!1294371))
(check-sat b_and!46935 (not b_next!28845))
