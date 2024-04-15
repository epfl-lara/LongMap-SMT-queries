; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111770 () Bool)

(assert start!111770)

(declare-fun b_free!30427 () Bool)

(declare-fun b_next!30427 () Bool)

(assert (=> start!111770 (= b_free!30427 (not b_next!30427))))

(declare-fun tp!106757 () Bool)

(declare-fun b_and!48947 () Bool)

(assert (=> start!111770 (= tp!106757 b_and!48947)))

(declare-fun mapNonEmpty!56018 () Bool)

(declare-fun mapRes!56018 () Bool)

(declare-fun tp!106758 () Bool)

(declare-fun e!755007 () Bool)

(assert (=> mapNonEmpty!56018 (= mapRes!56018 (and tp!106758 e!755007))))

(declare-fun mapKey!56018 () (_ BitVec 32))

(declare-datatypes ((V!53433 0))(
  ( (V!53434 (val!18198 Int)) )
))
(declare-datatypes ((ValueCell!17225 0))(
  ( (ValueCellFull!17225 (v!20827 V!53433)) (EmptyCell!17225) )
))
(declare-fun mapValue!56018 () ValueCell!17225)

(declare-fun mapRest!56018 () (Array (_ BitVec 32) ValueCell!17225))

(declare-datatypes ((array!89337 0))(
  ( (array!89338 (arr!43143 (Array (_ BitVec 32) ValueCell!17225)) (size!43695 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89337)

(assert (=> mapNonEmpty!56018 (= (arr!43143 _values!1337) (store mapRest!56018 mapKey!56018 mapValue!56018))))

(declare-fun b!1324356 () Bool)

(declare-fun res!879058 () Bool)

(declare-fun e!755008 () Bool)

(assert (=> b!1324356 (=> (not res!879058) (not e!755008))))

(declare-datatypes ((array!89339 0))(
  ( (array!89340 (arr!43144 (Array (_ BitVec 32) (_ BitVec 64))) (size!43696 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89339)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1324356 (= res!879058 (not (validKeyInArray!0 (select (arr!43144 _keys!1609) from!2000))))))

(declare-fun b!1324357 () Bool)

(declare-fun e!755009 () Bool)

(declare-fun tp_is_empty!36247 () Bool)

(assert (=> b!1324357 (= e!755009 tp_is_empty!36247)))

(declare-fun b!1324358 () Bool)

(declare-fun e!755011 () Bool)

(assert (=> b!1324358 (= e!755011 (and e!755009 mapRes!56018))))

(declare-fun condMapEmpty!56018 () Bool)

(declare-fun mapDefault!56018 () ValueCell!17225)

(assert (=> b!1324358 (= condMapEmpty!56018 (= (arr!43143 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17225)) mapDefault!56018)))))

(declare-fun res!879063 () Bool)

(assert (=> start!111770 (=> (not res!879063) (not e!755008))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111770 (= res!879063 (validMask!0 mask!2019))))

(assert (=> start!111770 e!755008))

(declare-fun array_inv!32753 (array!89339) Bool)

(assert (=> start!111770 (array_inv!32753 _keys!1609)))

(assert (=> start!111770 true))

(assert (=> start!111770 tp_is_empty!36247))

(declare-fun array_inv!32754 (array!89337) Bool)

(assert (=> start!111770 (and (array_inv!32754 _values!1337) e!755011)))

(assert (=> start!111770 tp!106757))

(declare-fun b!1324359 () Bool)

(declare-fun res!879059 () Bool)

(assert (=> b!1324359 (=> (not res!879059) (not e!755008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89339 (_ BitVec 32)) Bool)

(assert (=> b!1324359 (= res!879059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324360 () Bool)

(declare-fun res!879057 () Bool)

(assert (=> b!1324360 (=> (not res!879057) (not e!755008))))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1324360 (= res!879057 (not (= (select (arr!43144 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1324361 () Bool)

(declare-fun res!879060 () Bool)

(assert (=> b!1324361 (=> (not res!879060) (not e!755008))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1324361 (= res!879060 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43696 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1324362 () Bool)

(assert (=> b!1324362 (= e!755007 tp_is_empty!36247)))

(declare-fun b!1324363 () Bool)

(declare-fun res!879062 () Bool)

(assert (=> b!1324363 (=> (not res!879062) (not e!755008))))

(declare-fun zeroValue!1279 () V!53433)

(declare-fun minValue!1279 () V!53433)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23532 0))(
  ( (tuple2!23533 (_1!11777 (_ BitVec 64)) (_2!11777 V!53433)) )
))
(declare-datatypes ((List!30664 0))(
  ( (Nil!30661) (Cons!30660 (h!31869 tuple2!23532) (t!44582 List!30664)) )
))
(declare-datatypes ((ListLongMap!21189 0))(
  ( (ListLongMap!21190 (toList!10610 List!30664)) )
))
(declare-fun contains!8693 (ListLongMap!21189 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5489 (array!89339 array!89337 (_ BitVec 32) (_ BitVec 32) V!53433 V!53433 (_ BitVec 32) Int) ListLongMap!21189)

(assert (=> b!1324363 (= res!879062 (contains!8693 (getCurrentListMap!5489 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1324364 () Bool)

(assert (=> b!1324364 (= e!755008 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000))))

(declare-fun b!1324365 () Bool)

(declare-fun res!879061 () Bool)

(assert (=> b!1324365 (=> (not res!879061) (not e!755008))))

(declare-datatypes ((List!30665 0))(
  ( (Nil!30662) (Cons!30661 (h!31870 (_ BitVec 64)) (t!44583 List!30665)) )
))
(declare-fun arrayNoDuplicates!0 (array!89339 (_ BitVec 32) List!30665) Bool)

(assert (=> b!1324365 (= res!879061 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30662))))

(declare-fun b!1324366 () Bool)

(declare-fun res!879056 () Bool)

(assert (=> b!1324366 (=> (not res!879056) (not e!755008))))

(assert (=> b!1324366 (= res!879056 (and (= (size!43695 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43696 _keys!1609) (size!43695 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56018 () Bool)

(assert (=> mapIsEmpty!56018 mapRes!56018))

(assert (= (and start!111770 res!879063) b!1324366))

(assert (= (and b!1324366 res!879056) b!1324359))

(assert (= (and b!1324359 res!879059) b!1324365))

(assert (= (and b!1324365 res!879061) b!1324361))

(assert (= (and b!1324361 res!879060) b!1324363))

(assert (= (and b!1324363 res!879062) b!1324360))

(assert (= (and b!1324360 res!879057) b!1324356))

(assert (= (and b!1324356 res!879058) b!1324364))

(assert (= (and b!1324358 condMapEmpty!56018) mapIsEmpty!56018))

(assert (= (and b!1324358 (not condMapEmpty!56018)) mapNonEmpty!56018))

(get-info :version)

(assert (= (and mapNonEmpty!56018 ((_ is ValueCellFull!17225) mapValue!56018)) b!1324362))

(assert (= (and b!1324358 ((_ is ValueCellFull!17225) mapDefault!56018)) b!1324357))

(assert (= start!111770 b!1324358))

(declare-fun m!1212771 () Bool)

(assert (=> b!1324360 m!1212771))

(declare-fun m!1212773 () Bool)

(assert (=> b!1324359 m!1212773))

(declare-fun m!1212775 () Bool)

(assert (=> mapNonEmpty!56018 m!1212775))

(declare-fun m!1212777 () Bool)

(assert (=> start!111770 m!1212777))

(declare-fun m!1212779 () Bool)

(assert (=> start!111770 m!1212779))

(declare-fun m!1212781 () Bool)

(assert (=> start!111770 m!1212781))

(assert (=> b!1324356 m!1212771))

(assert (=> b!1324356 m!1212771))

(declare-fun m!1212783 () Bool)

(assert (=> b!1324356 m!1212783))

(declare-fun m!1212785 () Bool)

(assert (=> b!1324365 m!1212785))

(declare-fun m!1212787 () Bool)

(assert (=> b!1324363 m!1212787))

(assert (=> b!1324363 m!1212787))

(declare-fun m!1212789 () Bool)

(assert (=> b!1324363 m!1212789))

(check-sat (not b!1324363) b_and!48947 (not start!111770) (not b!1324356) (not b!1324359) (not mapNonEmpty!56018) (not b_next!30427) tp_is_empty!36247 (not b!1324365))
(check-sat b_and!48947 (not b_next!30427))
