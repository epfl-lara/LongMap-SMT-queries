; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111412 () Bool)

(assert start!111412)

(declare-fun b_free!30069 () Bool)

(declare-fun b_next!30069 () Bool)

(assert (=> start!111412 (= b_free!30069 (not b_next!30069))))

(declare-fun tp!105683 () Bool)

(declare-fun b_and!48297 () Bool)

(assert (=> start!111412 (= tp!105683 b_and!48297)))

(declare-fun b!1318425 () Bool)

(declare-fun res!875012 () Bool)

(declare-fun e!752355 () Bool)

(assert (=> b!1318425 (=> (not res!875012) (not e!752355))))

(declare-datatypes ((array!88724 0))(
  ( (array!88725 (arr!42836 (Array (_ BitVec 32) (_ BitVec 64))) (size!43386 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88724)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1318425 (= res!875012 (not (= (select (arr!42836 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1318426 () Bool)

(declare-fun res!875006 () Bool)

(assert (=> b!1318426 (=> (not res!875006) (not e!752355))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88724 (_ BitVec 32)) Bool)

(assert (=> b!1318426 (= res!875006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun res!875007 () Bool)

(assert (=> start!111412 (=> (not res!875007) (not e!752355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111412 (= res!875007 (validMask!0 mask!2019))))

(assert (=> start!111412 e!752355))

(declare-fun array_inv!32349 (array!88724) Bool)

(assert (=> start!111412 (array_inv!32349 _keys!1609)))

(assert (=> start!111412 true))

(declare-fun tp_is_empty!35889 () Bool)

(assert (=> start!111412 tp_is_empty!35889))

(declare-datatypes ((V!52955 0))(
  ( (V!52956 (val!18019 Int)) )
))
(declare-datatypes ((ValueCell!17046 0))(
  ( (ValueCellFull!17046 (v!20649 V!52955)) (EmptyCell!17046) )
))
(declare-datatypes ((array!88726 0))(
  ( (array!88727 (arr!42837 (Array (_ BitVec 32) ValueCell!17046)) (size!43387 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88726)

(declare-fun e!752356 () Bool)

(declare-fun array_inv!32350 (array!88726) Bool)

(assert (=> start!111412 (and (array_inv!32350 _values!1337) e!752356)))

(assert (=> start!111412 tp!105683))

(declare-fun b!1318427 () Bool)

(declare-fun res!875005 () Bool)

(assert (=> b!1318427 (=> (not res!875005) (not e!752355))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1318427 (= res!875005 (and (= (size!43387 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43386 _keys!1609) (size!43387 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1318428 () Bool)

(assert (=> b!1318428 (= e!752355 false)))

(declare-fun zeroValue!1279 () V!52955)

(declare-fun minValue!1279 () V!52955)

(declare-fun lt!586470 () Bool)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23190 0))(
  ( (tuple2!23191 (_1!11606 (_ BitVec 64)) (_2!11606 V!52955)) )
))
(declare-datatypes ((List!30345 0))(
  ( (Nil!30342) (Cons!30341 (h!31550 tuple2!23190) (t!43963 List!30345)) )
))
(declare-datatypes ((ListLongMap!20847 0))(
  ( (ListLongMap!20848 (toList!10439 List!30345)) )
))
(declare-fun contains!8594 (ListLongMap!20847 (_ BitVec 64)) Bool)

(declare-fun +!4500 (ListLongMap!20847 tuple2!23190) ListLongMap!20847)

(declare-fun getCurrentListMapNoExtraKeys!6135 (array!88724 array!88726 (_ BitVec 32) (_ BitVec 32) V!52955 V!52955 (_ BitVec 32) Int) ListLongMap!20847)

(declare-fun get!21514 (ValueCell!17046 V!52955) V!52955)

(declare-fun dynLambda!3439 (Int (_ BitVec 64)) V!52955)

(assert (=> b!1318428 (= lt!586470 (contains!8594 (+!4500 (+!4500 (+!4500 (getCurrentListMapNoExtraKeys!6135 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23191 (select (arr!42836 _keys!1609) from!2000) (get!21514 (select (arr!42837 _values!1337) from!2000) (dynLambda!3439 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23191 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23191 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164))))

(declare-fun b!1318429 () Bool)

(declare-fun res!875008 () Bool)

(assert (=> b!1318429 (=> (not res!875008) (not e!752355))))

(assert (=> b!1318429 (= res!875008 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43386 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!55481 () Bool)

(declare-fun mapRes!55481 () Bool)

(declare-fun tp!105682 () Bool)

(declare-fun e!752357 () Bool)

(assert (=> mapNonEmpty!55481 (= mapRes!55481 (and tp!105682 e!752357))))

(declare-fun mapKey!55481 () (_ BitVec 32))

(declare-fun mapRest!55481 () (Array (_ BitVec 32) ValueCell!17046))

(declare-fun mapValue!55481 () ValueCell!17046)

(assert (=> mapNonEmpty!55481 (= (arr!42837 _values!1337) (store mapRest!55481 mapKey!55481 mapValue!55481))))

(declare-fun b!1318430 () Bool)

(declare-fun res!875011 () Bool)

(assert (=> b!1318430 (=> (not res!875011) (not e!752355))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1318430 (= res!875011 (validKeyInArray!0 (select (arr!42836 _keys!1609) from!2000)))))

(declare-fun b!1318431 () Bool)

(declare-fun e!752358 () Bool)

(assert (=> b!1318431 (= e!752358 tp_is_empty!35889)))

(declare-fun b!1318432 () Bool)

(declare-fun res!875009 () Bool)

(assert (=> b!1318432 (=> (not res!875009) (not e!752355))))

(declare-datatypes ((List!30346 0))(
  ( (Nil!30343) (Cons!30342 (h!31551 (_ BitVec 64)) (t!43964 List!30346)) )
))
(declare-fun arrayNoDuplicates!0 (array!88724 (_ BitVec 32) List!30346) Bool)

(assert (=> b!1318432 (= res!875009 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30343))))

(declare-fun b!1318433 () Bool)

(assert (=> b!1318433 (= e!752356 (and e!752358 mapRes!55481))))

(declare-fun condMapEmpty!55481 () Bool)

(declare-fun mapDefault!55481 () ValueCell!17046)

(assert (=> b!1318433 (= condMapEmpty!55481 (= (arr!42837 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17046)) mapDefault!55481)))))

(declare-fun b!1318434 () Bool)

(assert (=> b!1318434 (= e!752357 tp_is_empty!35889)))

(declare-fun mapIsEmpty!55481 () Bool)

(assert (=> mapIsEmpty!55481 mapRes!55481))

(declare-fun b!1318435 () Bool)

(declare-fun res!875010 () Bool)

(assert (=> b!1318435 (=> (not res!875010) (not e!752355))))

(declare-fun getCurrentListMap!5452 (array!88724 array!88726 (_ BitVec 32) (_ BitVec 32) V!52955 V!52955 (_ BitVec 32) Int) ListLongMap!20847)

(assert (=> b!1318435 (= res!875010 (contains!8594 (getCurrentListMap!5452 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(assert (= (and start!111412 res!875007) b!1318427))

(assert (= (and b!1318427 res!875005) b!1318426))

(assert (= (and b!1318426 res!875006) b!1318432))

(assert (= (and b!1318432 res!875009) b!1318429))

(assert (= (and b!1318429 res!875008) b!1318435))

(assert (= (and b!1318435 res!875010) b!1318425))

(assert (= (and b!1318425 res!875012) b!1318430))

(assert (= (and b!1318430 res!875011) b!1318428))

(assert (= (and b!1318433 condMapEmpty!55481) mapIsEmpty!55481))

(assert (= (and b!1318433 (not condMapEmpty!55481)) mapNonEmpty!55481))

(get-info :version)

(assert (= (and mapNonEmpty!55481 ((_ is ValueCellFull!17046) mapValue!55481)) b!1318434))

(assert (= (and b!1318433 ((_ is ValueCellFull!17046) mapDefault!55481)) b!1318431))

(assert (= start!111412 b!1318433))

(declare-fun b_lambda!23395 () Bool)

(assert (=> (not b_lambda!23395) (not b!1318428)))

(declare-fun t!43962 () Bool)

(declare-fun tb!11421 () Bool)

(assert (=> (and start!111412 (= defaultEntry!1340 defaultEntry!1340) t!43962) tb!11421))

(declare-fun result!23897 () Bool)

(assert (=> tb!11421 (= result!23897 tp_is_empty!35889)))

(assert (=> b!1318428 t!43962))

(declare-fun b_and!48299 () Bool)

(assert (= b_and!48297 (and (=> t!43962 result!23897) b_and!48299)))

(declare-fun m!1205991 () Bool)

(assert (=> b!1318428 m!1205991))

(declare-fun m!1205993 () Bool)

(assert (=> b!1318428 m!1205993))

(assert (=> b!1318428 m!1205991))

(declare-fun m!1205995 () Bool)

(assert (=> b!1318428 m!1205995))

(declare-fun m!1205997 () Bool)

(assert (=> b!1318428 m!1205997))

(declare-fun m!1205999 () Bool)

(assert (=> b!1318428 m!1205999))

(declare-fun m!1206001 () Bool)

(assert (=> b!1318428 m!1206001))

(assert (=> b!1318428 m!1205995))

(declare-fun m!1206003 () Bool)

(assert (=> b!1318428 m!1206003))

(declare-fun m!1206005 () Bool)

(assert (=> b!1318428 m!1206005))

(assert (=> b!1318428 m!1206003))

(assert (=> b!1318428 m!1205997))

(assert (=> b!1318428 m!1206001))

(assert (=> b!1318428 m!1205993))

(declare-fun m!1206007 () Bool)

(assert (=> b!1318428 m!1206007))

(assert (=> b!1318430 m!1206005))

(assert (=> b!1318430 m!1206005))

(declare-fun m!1206009 () Bool)

(assert (=> b!1318430 m!1206009))

(assert (=> b!1318425 m!1206005))

(declare-fun m!1206011 () Bool)

(assert (=> b!1318432 m!1206011))

(declare-fun m!1206013 () Bool)

(assert (=> mapNonEmpty!55481 m!1206013))

(declare-fun m!1206015 () Bool)

(assert (=> b!1318426 m!1206015))

(declare-fun m!1206017 () Bool)

(assert (=> b!1318435 m!1206017))

(assert (=> b!1318435 m!1206017))

(declare-fun m!1206019 () Bool)

(assert (=> b!1318435 m!1206019))

(declare-fun m!1206021 () Bool)

(assert (=> start!111412 m!1206021))

(declare-fun m!1206023 () Bool)

(assert (=> start!111412 m!1206023))

(declare-fun m!1206025 () Bool)

(assert (=> start!111412 m!1206025))

(check-sat (not mapNonEmpty!55481) (not b_lambda!23395) (not b!1318426) tp_is_empty!35889 (not start!111412) b_and!48299 (not b_next!30069) (not b!1318432) (not b!1318435) (not b!1318430) (not b!1318428))
(check-sat b_and!48299 (not b_next!30069))
