; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3902 () Bool)

(assert start!3902)

(declare-fun b_free!807 () Bool)

(declare-fun b_next!807 () Bool)

(assert (=> start!3902 (= b_free!807 (not b_next!807))))

(declare-fun tp!3840 () Bool)

(declare-fun b_and!1617 () Bool)

(assert (=> start!3902 (= tp!3840 b_and!1617)))

(declare-fun b!27486 () Bool)

(declare-fun res!16272 () Bool)

(declare-fun e!17903 () Bool)

(assert (=> b!27486 (=> (not res!16272) (not e!17903))))

(declare-datatypes ((array!1565 0))(
  ( (array!1566 (arr!736 (Array (_ BitVec 32) (_ BitVec 64))) (size!837 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1565)

(declare-datatypes ((List!622 0))(
  ( (Nil!619) (Cons!618 (h!1185 (_ BitVec 64)) (t!3315 List!622)) )
))
(declare-fun arrayNoDuplicates!0 (array!1565 (_ BitVec 32) List!622) Bool)

(assert (=> b!27486 (= res!16272 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!619))))

(declare-fun mapIsEmpty!1270 () Bool)

(declare-fun mapRes!1270 () Bool)

(assert (=> mapIsEmpty!1270 mapRes!1270))

(declare-fun b!27487 () Bool)

(declare-fun res!16274 () Bool)

(assert (=> b!27487 (=> (not res!16274) (not e!17903))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1565 (_ BitVec 32)) Bool)

(assert (=> b!27487 (= res!16274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!27488 () Bool)

(declare-fun res!16277 () Bool)

(assert (=> b!27488 (=> (not res!16277) (not e!17903))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27488 (= res!16277 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27489 () Bool)

(declare-fun res!16273 () Bool)

(assert (=> b!27489 (=> (not res!16273) (not e!17903))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1373 0))(
  ( (V!1374 (val!607 Int)) )
))
(declare-datatypes ((ValueCell!381 0))(
  ( (ValueCellFull!381 (v!1696 V!1373)) (EmptyCell!381) )
))
(declare-datatypes ((array!1567 0))(
  ( (array!1568 (arr!737 (Array (_ BitVec 32) ValueCell!381)) (size!838 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1567)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1373)

(declare-fun minValue!1443 () V!1373)

(declare-datatypes ((tuple2!1022 0))(
  ( (tuple2!1023 (_1!522 (_ BitVec 64)) (_2!522 V!1373)) )
))
(declare-datatypes ((List!623 0))(
  ( (Nil!620) (Cons!619 (h!1186 tuple2!1022) (t!3316 List!623)) )
))
(declare-datatypes ((ListLongMap!599 0))(
  ( (ListLongMap!600 (toList!315 List!623)) )
))
(declare-fun contains!255 (ListLongMap!599 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!145 (array!1565 array!1567 (_ BitVec 32) (_ BitVec 32) V!1373 V!1373 (_ BitVec 32) Int) ListLongMap!599)

(assert (=> b!27489 (= res!16273 (not (contains!255 (getCurrentListMap!145 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!27490 () Bool)

(declare-fun res!16278 () Bool)

(assert (=> b!27490 (=> (not res!16278) (not e!17903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27490 (= res!16278 (validKeyInArray!0 k0!1304))))

(declare-fun b!27491 () Bool)

(assert (=> b!27491 (= e!17903 false)))

(declare-fun lt!10685 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1565 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!27491 (= lt!10685 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27492 () Bool)

(declare-fun e!17902 () Bool)

(declare-fun e!17901 () Bool)

(assert (=> b!27492 (= e!17902 (and e!17901 mapRes!1270))))

(declare-fun condMapEmpty!1270 () Bool)

(declare-fun mapDefault!1270 () ValueCell!381)

(assert (=> b!27492 (= condMapEmpty!1270 (= (arr!737 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!381)) mapDefault!1270)))))

(declare-fun res!16276 () Bool)

(assert (=> start!3902 (=> (not res!16276) (not e!17903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3902 (= res!16276 (validMask!0 mask!2294))))

(assert (=> start!3902 e!17903))

(assert (=> start!3902 true))

(assert (=> start!3902 tp!3840))

(declare-fun array_inv!507 (array!1567) Bool)

(assert (=> start!3902 (and (array_inv!507 _values!1501) e!17902)))

(declare-fun array_inv!508 (array!1565) Bool)

(assert (=> start!3902 (array_inv!508 _keys!1833)))

(declare-fun tp_is_empty!1161 () Bool)

(assert (=> start!3902 tp_is_empty!1161))

(declare-fun b!27493 () Bool)

(declare-fun res!16275 () Bool)

(assert (=> b!27493 (=> (not res!16275) (not e!17903))))

(assert (=> b!27493 (= res!16275 (and (= (size!838 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!837 _keys!1833) (size!838 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!27494 () Bool)

(assert (=> b!27494 (= e!17901 tp_is_empty!1161)))

(declare-fun b!27495 () Bool)

(declare-fun e!17899 () Bool)

(assert (=> b!27495 (= e!17899 tp_is_empty!1161)))

(declare-fun mapNonEmpty!1270 () Bool)

(declare-fun tp!3841 () Bool)

(assert (=> mapNonEmpty!1270 (= mapRes!1270 (and tp!3841 e!17899))))

(declare-fun mapValue!1270 () ValueCell!381)

(declare-fun mapRest!1270 () (Array (_ BitVec 32) ValueCell!381))

(declare-fun mapKey!1270 () (_ BitVec 32))

(assert (=> mapNonEmpty!1270 (= (arr!737 _values!1501) (store mapRest!1270 mapKey!1270 mapValue!1270))))

(assert (= (and start!3902 res!16276) b!27493))

(assert (= (and b!27493 res!16275) b!27487))

(assert (= (and b!27487 res!16274) b!27486))

(assert (= (and b!27486 res!16272) b!27490))

(assert (= (and b!27490 res!16278) b!27489))

(assert (= (and b!27489 res!16273) b!27488))

(assert (= (and b!27488 res!16277) b!27491))

(assert (= (and b!27492 condMapEmpty!1270) mapIsEmpty!1270))

(assert (= (and b!27492 (not condMapEmpty!1270)) mapNonEmpty!1270))

(get-info :version)

(assert (= (and mapNonEmpty!1270 ((_ is ValueCellFull!381) mapValue!1270)) b!27495))

(assert (= (and b!27492 ((_ is ValueCellFull!381) mapDefault!1270)) b!27494))

(assert (= start!3902 b!27492))

(declare-fun m!21929 () Bool)

(assert (=> start!3902 m!21929))

(declare-fun m!21931 () Bool)

(assert (=> start!3902 m!21931))

(declare-fun m!21933 () Bool)

(assert (=> start!3902 m!21933))

(declare-fun m!21935 () Bool)

(assert (=> mapNonEmpty!1270 m!21935))

(declare-fun m!21937 () Bool)

(assert (=> b!27490 m!21937))

(declare-fun m!21939 () Bool)

(assert (=> b!27491 m!21939))

(declare-fun m!21941 () Bool)

(assert (=> b!27487 m!21941))

(declare-fun m!21943 () Bool)

(assert (=> b!27489 m!21943))

(assert (=> b!27489 m!21943))

(declare-fun m!21945 () Bool)

(assert (=> b!27489 m!21945))

(declare-fun m!21947 () Bool)

(assert (=> b!27486 m!21947))

(declare-fun m!21949 () Bool)

(assert (=> b!27488 m!21949))

(check-sat (not mapNonEmpty!1270) tp_is_empty!1161 (not b!27487) (not b!27488) (not b!27490) (not b!27489) b_and!1617 (not b!27491) (not start!3902) (not b_next!807) (not b!27486))
(check-sat b_and!1617 (not b_next!807))
