; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!948 () Bool)

(assert start!948)

(declare-fun b_free!321 () Bool)

(declare-fun b_next!321 () Bool)

(assert (=> start!948 (= b_free!321 (not b_next!321))))

(declare-fun tp!1195 () Bool)

(declare-fun b_and!469 () Bool)

(assert (=> start!948 (= tp!1195 b_and!469)))

(declare-fun b!8042 () Bool)

(declare-fun res!7755 () Bool)

(declare-fun e!4559 () Bool)

(assert (=> b!8042 (=> (not res!7755) (not e!4559))))

(declare-datatypes ((array!729 0))(
  ( (array!730 (arr!352 (Array (_ BitVec 32) (_ BitVec 64))) (size!414 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!729)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!729 (_ BitVec 32)) Bool)

(assert (=> b!8042 (= res!7755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!8043 () Bool)

(declare-fun e!4553 () Bool)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!8043 (= e!4553 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!8044 () Bool)

(declare-fun e!4554 () Bool)

(assert (=> b!8044 (= e!4554 true)))

(declare-fun lt!1625 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!729 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!8044 (= lt!1625 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!8045 () Bool)

(declare-fun e!4556 () Bool)

(declare-fun tp_is_empty!399 () Bool)

(assert (=> b!8045 (= e!4556 tp_is_empty!399)))

(declare-fun b!8046 () Bool)

(declare-fun e!4557 () Bool)

(declare-fun e!4555 () Bool)

(declare-fun mapRes!572 () Bool)

(assert (=> b!8046 (= e!4557 (and e!4555 mapRes!572))))

(declare-fun condMapEmpty!572 () Bool)

(declare-datatypes ((V!709 0))(
  ( (V!710 (val!205 Int)) )
))
(declare-datatypes ((ValueCell!183 0))(
  ( (ValueCellFull!183 (v!1297 V!709)) (EmptyCell!183) )
))
(declare-datatypes ((array!731 0))(
  ( (array!732 (arr!353 (Array (_ BitVec 32) ValueCell!183)) (size!415 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!731)

(declare-fun mapDefault!572 () ValueCell!183)

(assert (=> b!8046 (= condMapEmpty!572 (= (arr!353 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!183)) mapDefault!572)))))

(declare-fun mapNonEmpty!572 () Bool)

(declare-fun tp!1196 () Bool)

(assert (=> mapNonEmpty!572 (= mapRes!572 (and tp!1196 e!4556))))

(declare-fun mapKey!572 () (_ BitVec 32))

(declare-fun mapValue!572 () ValueCell!183)

(declare-fun mapRest!572 () (Array (_ BitVec 32) ValueCell!183))

(assert (=> mapNonEmpty!572 (= (arr!353 _values!1492) (store mapRest!572 mapKey!572 mapValue!572))))

(declare-fun b!8047 () Bool)

(assert (=> b!8047 (= e!4555 tp_is_empty!399)))

(declare-fun b!8048 () Bool)

(declare-fun res!7750 () Bool)

(assert (=> b!8048 (=> (not res!7750) (not e!4559))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!8048 (= res!7750 (and (= (size!415 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!414 _keys!1806) (size!415 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun res!7754 () Bool)

(assert (=> start!948 (=> (not res!7754) (not e!4559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!948 (= res!7754 (validMask!0 mask!2250))))

(assert (=> start!948 e!4559))

(assert (=> start!948 tp!1195))

(assert (=> start!948 true))

(declare-fun array_inv!259 (array!731) Bool)

(assert (=> start!948 (and (array_inv!259 _values!1492) e!4557)))

(assert (=> start!948 tp_is_empty!399))

(declare-fun array_inv!260 (array!729) Bool)

(assert (=> start!948 (array_inv!260 _keys!1806)))

(declare-fun b!8041 () Bool)

(assert (=> b!8041 (= e!4559 (not e!4554))))

(declare-fun res!7753 () Bool)

(assert (=> b!8041 (=> res!7753 e!4554)))

(assert (=> b!8041 (= res!7753 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!8041 e!4553))

(declare-fun c!563 () Bool)

(assert (=> b!8041 (= c!563 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!709)

(declare-fun zeroValue!1434 () V!709)

(declare-datatypes ((Unit!149 0))(
  ( (Unit!150) )
))
(declare-fun lt!1626 () Unit!149)

(declare-fun lemmaKeyInListMapIsInArray!55 (array!729 array!731 (_ BitVec 32) (_ BitVec 32) V!709 V!709 (_ BitVec 64) Int) Unit!149)

(assert (=> b!8041 (= lt!1626 (lemmaKeyInListMapIsInArray!55 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun mapIsEmpty!572 () Bool)

(assert (=> mapIsEmpty!572 mapRes!572))

(declare-fun b!8049 () Bool)

(declare-fun res!7756 () Bool)

(assert (=> b!8049 (=> (not res!7756) (not e!4559))))

(declare-datatypes ((List!239 0))(
  ( (Nil!236) (Cons!235 (h!801 (_ BitVec 64)) (t!2376 List!239)) )
))
(declare-fun arrayNoDuplicates!0 (array!729 (_ BitVec 32) List!239) Bool)

(assert (=> b!8049 (= res!7756 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!236))))

(declare-fun b!8050 () Bool)

(assert (=> b!8050 (= e!4553 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!8051 () Bool)

(declare-fun res!7751 () Bool)

(assert (=> b!8051 (=> (not res!7751) (not e!4559))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!8051 (= res!7751 (validKeyInArray!0 k0!1278))))

(declare-fun b!8052 () Bool)

(declare-fun res!7752 () Bool)

(assert (=> b!8052 (=> (not res!7752) (not e!4559))))

(declare-datatypes ((tuple2!228 0))(
  ( (tuple2!229 (_1!114 (_ BitVec 64)) (_2!114 V!709)) )
))
(declare-datatypes ((List!240 0))(
  ( (Nil!237) (Cons!236 (h!802 tuple2!228) (t!2377 List!240)) )
))
(declare-datatypes ((ListLongMap!233 0))(
  ( (ListLongMap!234 (toList!132 List!240)) )
))
(declare-fun contains!107 (ListLongMap!233 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!91 (array!729 array!731 (_ BitVec 32) (_ BitVec 32) V!709 V!709 (_ BitVec 32) Int) ListLongMap!233)

(assert (=> b!8052 (= res!7752 (contains!107 (getCurrentListMap!91 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(assert (= (and start!948 res!7754) b!8048))

(assert (= (and b!8048 res!7750) b!8042))

(assert (= (and b!8042 res!7755) b!8049))

(assert (= (and b!8049 res!7756) b!8052))

(assert (= (and b!8052 res!7752) b!8051))

(assert (= (and b!8051 res!7751) b!8041))

(assert (= (and b!8041 c!563) b!8043))

(assert (= (and b!8041 (not c!563)) b!8050))

(assert (= (and b!8041 (not res!7753)) b!8044))

(assert (= (and b!8046 condMapEmpty!572) mapIsEmpty!572))

(assert (= (and b!8046 (not condMapEmpty!572)) mapNonEmpty!572))

(get-info :version)

(assert (= (and mapNonEmpty!572 ((_ is ValueCellFull!183) mapValue!572)) b!8045))

(assert (= (and b!8046 ((_ is ValueCellFull!183) mapDefault!572)) b!8047))

(assert (= start!948 b!8046))

(declare-fun m!4925 () Bool)

(assert (=> mapNonEmpty!572 m!4925))

(declare-fun m!4927 () Bool)

(assert (=> b!8052 m!4927))

(assert (=> b!8052 m!4927))

(declare-fun m!4929 () Bool)

(assert (=> b!8052 m!4929))

(declare-fun m!4931 () Bool)

(assert (=> b!8041 m!4931))

(declare-fun m!4933 () Bool)

(assert (=> b!8041 m!4933))

(declare-fun m!4935 () Bool)

(assert (=> b!8042 m!4935))

(assert (=> b!8043 m!4931))

(declare-fun m!4937 () Bool)

(assert (=> b!8044 m!4937))

(declare-fun m!4939 () Bool)

(assert (=> start!948 m!4939))

(declare-fun m!4941 () Bool)

(assert (=> start!948 m!4941))

(declare-fun m!4943 () Bool)

(assert (=> start!948 m!4943))

(declare-fun m!4945 () Bool)

(assert (=> b!8049 m!4945))

(declare-fun m!4947 () Bool)

(assert (=> b!8051 m!4947))

(check-sat b_and!469 (not b!8041) (not b!8043) (not b!8052) (not b!8051) (not b!8042) (not mapNonEmpty!572) tp_is_empty!399 (not b!8044) (not b_next!321) (not b!8049) (not start!948))
(check-sat b_and!469 (not b_next!321))
