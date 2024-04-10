; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108708 () Bool)

(assert start!108708)

(declare-fun b_free!28221 () Bool)

(declare-fun b_next!28221 () Bool)

(assert (=> start!108708 (= b_free!28221 (not b_next!28221))))

(declare-fun tp!99779 () Bool)

(declare-fun b_and!46287 () Bool)

(assert (=> start!108708 (= tp!99779 b_and!46287)))

(declare-fun b!1283416 () Bool)

(declare-fun e!733219 () Bool)

(declare-fun e!733220 () Bool)

(declare-fun mapRes!52349 () Bool)

(assert (=> b!1283416 (= e!733219 (and e!733220 mapRes!52349))))

(declare-fun condMapEmpty!52349 () Bool)

(declare-datatypes ((V!50251 0))(
  ( (V!50252 (val!17005 Int)) )
))
(declare-datatypes ((ValueCell!16032 0))(
  ( (ValueCellFull!16032 (v!19607 V!50251)) (EmptyCell!16032) )
))
(declare-datatypes ((array!84784 0))(
  ( (array!84785 (arr!40894 (Array (_ BitVec 32) ValueCell!16032)) (size!41444 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84784)

(declare-fun mapDefault!52349 () ValueCell!16032)

(assert (=> b!1283416 (= condMapEmpty!52349 (= (arr!40894 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16032)) mapDefault!52349)))))

(declare-fun b!1283417 () Bool)

(declare-fun res!852531 () Bool)

(declare-fun e!733216 () Bool)

(assert (=> b!1283417 (=> (not res!852531) (not e!733216))))

(declare-fun minValue!1387 () V!50251)

(declare-fun zeroValue!1387 () V!50251)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84786 0))(
  ( (array!84787 (arr!40895 (Array (_ BitVec 32) (_ BitVec 64))) (size!41445 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84786)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21776 0))(
  ( (tuple2!21777 (_1!10899 (_ BitVec 64)) (_2!10899 V!50251)) )
))
(declare-datatypes ((List!28974 0))(
  ( (Nil!28971) (Cons!28970 (h!30179 tuple2!21776) (t!42518 List!28974)) )
))
(declare-datatypes ((ListLongMap!19433 0))(
  ( (ListLongMap!19434 (toList!9732 List!28974)) )
))
(declare-fun contains!7849 (ListLongMap!19433 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4815 (array!84786 array!84784 (_ BitVec 32) (_ BitVec 32) V!50251 V!50251 (_ BitVec 32) Int) ListLongMap!19433)

(assert (=> b!1283417 (= res!852531 (contains!7849 (getCurrentListMap!4815 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1283418 () Bool)

(declare-fun res!852536 () Bool)

(assert (=> b!1283418 (=> (not res!852536) (not e!733216))))

(assert (=> b!1283418 (= res!852536 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41445 _keys!1741))))))

(declare-fun mapNonEmpty!52349 () Bool)

(declare-fun tp!99778 () Bool)

(declare-fun e!733218 () Bool)

(assert (=> mapNonEmpty!52349 (= mapRes!52349 (and tp!99778 e!733218))))

(declare-fun mapValue!52349 () ValueCell!16032)

(declare-fun mapRest!52349 () (Array (_ BitVec 32) ValueCell!16032))

(declare-fun mapKey!52349 () (_ BitVec 32))

(assert (=> mapNonEmpty!52349 (= (arr!40894 _values!1445) (store mapRest!52349 mapKey!52349 mapValue!52349))))

(declare-fun b!1283419 () Bool)

(declare-fun res!852533 () Bool)

(assert (=> b!1283419 (=> (not res!852533) (not e!733216))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1283419 (= res!852533 (validKeyInArray!0 (select (arr!40895 _keys!1741) from!2144)))))

(declare-fun b!1283420 () Bool)

(declare-fun res!852537 () Bool)

(assert (=> b!1283420 (=> (not res!852537) (not e!733216))))

(assert (=> b!1283420 (= res!852537 (and (= (size!41444 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41445 _keys!1741) (size!41444 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283421 () Bool)

(assert (=> b!1283421 (= e!733216 (not true))))

(declare-fun lt!576652 () ListLongMap!19433)

(assert (=> b!1283421 (contains!7849 lt!576652 k0!1205)))

(declare-datatypes ((Unit!42473 0))(
  ( (Unit!42474) )
))
(declare-fun lt!576651 () Unit!42473)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!7 ((_ BitVec 64) (_ BitVec 64) V!50251 ListLongMap!19433) Unit!42473)

(assert (=> b!1283421 (= lt!576651 (lemmaInListMapAfterAddingDiffThenInBefore!7 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576652))))

(declare-fun +!4283 (ListLongMap!19433 tuple2!21776) ListLongMap!19433)

(declare-fun getCurrentListMapNoExtraKeys!5913 (array!84786 array!84784 (_ BitVec 32) (_ BitVec 32) V!50251 V!50251 (_ BitVec 32) Int) ListLongMap!19433)

(assert (=> b!1283421 (= lt!576652 (+!4283 (getCurrentListMapNoExtraKeys!5913 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21777 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1283422 () Bool)

(declare-fun res!852534 () Bool)

(assert (=> b!1283422 (=> (not res!852534) (not e!733216))))

(assert (=> b!1283422 (= res!852534 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41445 _keys!1741))))))

(declare-fun res!852530 () Bool)

(assert (=> start!108708 (=> (not res!852530) (not e!733216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108708 (= res!852530 (validMask!0 mask!2175))))

(assert (=> start!108708 e!733216))

(declare-fun tp_is_empty!33861 () Bool)

(assert (=> start!108708 tp_is_empty!33861))

(assert (=> start!108708 true))

(declare-fun array_inv!31021 (array!84784) Bool)

(assert (=> start!108708 (and (array_inv!31021 _values!1445) e!733219)))

(declare-fun array_inv!31022 (array!84786) Bool)

(assert (=> start!108708 (array_inv!31022 _keys!1741)))

(assert (=> start!108708 tp!99779))

(declare-fun b!1283423 () Bool)

(declare-fun res!852529 () Bool)

(assert (=> b!1283423 (=> (not res!852529) (not e!733216))))

(declare-datatypes ((List!28975 0))(
  ( (Nil!28972) (Cons!28971 (h!30180 (_ BitVec 64)) (t!42519 List!28975)) )
))
(declare-fun arrayNoDuplicates!0 (array!84786 (_ BitVec 32) List!28975) Bool)

(assert (=> b!1283423 (= res!852529 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28972))))

(declare-fun b!1283424 () Bool)

(assert (=> b!1283424 (= e!733220 tp_is_empty!33861)))

(declare-fun b!1283425 () Bool)

(assert (=> b!1283425 (= e!733218 tp_is_empty!33861)))

(declare-fun b!1283426 () Bool)

(declare-fun res!852532 () Bool)

(assert (=> b!1283426 (=> (not res!852532) (not e!733216))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84786 (_ BitVec 32)) Bool)

(assert (=> b!1283426 (= res!852532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52349 () Bool)

(assert (=> mapIsEmpty!52349 mapRes!52349))

(declare-fun b!1283427 () Bool)

(declare-fun res!852535 () Bool)

(assert (=> b!1283427 (=> (not res!852535) (not e!733216))))

(assert (=> b!1283427 (= res!852535 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!108708 res!852530) b!1283420))

(assert (= (and b!1283420 res!852537) b!1283426))

(assert (= (and b!1283426 res!852532) b!1283423))

(assert (= (and b!1283423 res!852529) b!1283422))

(assert (= (and b!1283422 res!852534) b!1283417))

(assert (= (and b!1283417 res!852531) b!1283418))

(assert (= (and b!1283418 res!852536) b!1283419))

(assert (= (and b!1283419 res!852533) b!1283427))

(assert (= (and b!1283427 res!852535) b!1283421))

(assert (= (and b!1283416 condMapEmpty!52349) mapIsEmpty!52349))

(assert (= (and b!1283416 (not condMapEmpty!52349)) mapNonEmpty!52349))

(get-info :version)

(assert (= (and mapNonEmpty!52349 ((_ is ValueCellFull!16032) mapValue!52349)) b!1283425))

(assert (= (and b!1283416 ((_ is ValueCellFull!16032) mapDefault!52349)) b!1283424))

(assert (= start!108708 b!1283416))

(declare-fun m!1177345 () Bool)

(assert (=> start!108708 m!1177345))

(declare-fun m!1177347 () Bool)

(assert (=> start!108708 m!1177347))

(declare-fun m!1177349 () Bool)

(assert (=> start!108708 m!1177349))

(declare-fun m!1177351 () Bool)

(assert (=> b!1283421 m!1177351))

(declare-fun m!1177353 () Bool)

(assert (=> b!1283421 m!1177353))

(declare-fun m!1177355 () Bool)

(assert (=> b!1283421 m!1177355))

(assert (=> b!1283421 m!1177355))

(declare-fun m!1177357 () Bool)

(assert (=> b!1283421 m!1177357))

(declare-fun m!1177359 () Bool)

(assert (=> b!1283419 m!1177359))

(assert (=> b!1283419 m!1177359))

(declare-fun m!1177361 () Bool)

(assert (=> b!1283419 m!1177361))

(declare-fun m!1177363 () Bool)

(assert (=> b!1283423 m!1177363))

(declare-fun m!1177365 () Bool)

(assert (=> b!1283417 m!1177365))

(assert (=> b!1283417 m!1177365))

(declare-fun m!1177367 () Bool)

(assert (=> b!1283417 m!1177367))

(declare-fun m!1177369 () Bool)

(assert (=> mapNonEmpty!52349 m!1177369))

(declare-fun m!1177371 () Bool)

(assert (=> b!1283426 m!1177371))

(check-sat (not b_next!28221) tp_is_empty!33861 (not b!1283419) (not b!1283423) (not mapNonEmpty!52349) b_and!46287 (not b!1283417) (not b!1283421) (not start!108708) (not b!1283426))
(check-sat b_and!46287 (not b_next!28221))
