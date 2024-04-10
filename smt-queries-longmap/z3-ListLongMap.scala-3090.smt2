; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43482 () Bool)

(assert start!43482)

(declare-fun b_free!12261 () Bool)

(declare-fun b_next!12261 () Bool)

(assert (=> start!43482 (= b_free!12261 (not b_next!12261))))

(declare-fun tp!43065 () Bool)

(declare-fun b_and!21021 () Bool)

(assert (=> start!43482 (= tp!43065 b_and!21021)))

(declare-fun b!481780 () Bool)

(declare-fun e!283460 () Bool)

(declare-fun tp_is_empty!13773 () Bool)

(assert (=> b!481780 (= e!283460 tp_is_empty!13773)))

(declare-fun b!481781 () Bool)

(declare-fun res!287210 () Bool)

(declare-fun e!283459 () Bool)

(assert (=> b!481781 (=> (not res!287210) (not e!283459))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19435 0))(
  ( (V!19436 (val!6934 Int)) )
))
(declare-fun minValue!1458 () V!19435)

(declare-fun zeroValue!1458 () V!19435)

(declare-datatypes ((ValueCell!6525 0))(
  ( (ValueCellFull!6525 (v!9227 V!19435)) (EmptyCell!6525) )
))
(declare-datatypes ((array!31207 0))(
  ( (array!31208 (arr!15006 (Array (_ BitVec 32) ValueCell!6525)) (size!15364 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31207)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31209 0))(
  ( (array!31210 (arr!15007 (Array (_ BitVec 32) (_ BitVec 64))) (size!15365 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31209)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((tuple2!9098 0))(
  ( (tuple2!9099 (_1!4560 (_ BitVec 64)) (_2!4560 V!19435)) )
))
(declare-datatypes ((List!9177 0))(
  ( (Nil!9174) (Cons!9173 (h!10029 tuple2!9098) (t!15391 List!9177)) )
))
(declare-datatypes ((ListLongMap!8011 0))(
  ( (ListLongMap!8012 (toList!4021 List!9177)) )
))
(declare-fun contains!2635 (ListLongMap!8011 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2340 (array!31209 array!31207 (_ BitVec 32) (_ BitVec 32) V!19435 V!19435 (_ BitVec 32) Int) ListLongMap!8011)

(assert (=> b!481781 (= res!287210 (contains!2635 (getCurrentListMap!2340 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!481782 () Bool)

(declare-fun e!283461 () Bool)

(declare-fun e!283458 () Bool)

(declare-fun mapRes!22369 () Bool)

(assert (=> b!481782 (= e!283461 (and e!283458 mapRes!22369))))

(declare-fun condMapEmpty!22369 () Bool)

(declare-fun mapDefault!22369 () ValueCell!6525)

(assert (=> b!481782 (= condMapEmpty!22369 (= (arr!15006 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6525)) mapDefault!22369)))))

(declare-fun b!481783 () Bool)

(declare-fun e!283457 () Bool)

(assert (=> b!481783 (= e!283457 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!481784 () Bool)

(declare-fun res!287214 () Bool)

(assert (=> b!481784 (=> (not res!287214) (not e!283459))))

(declare-datatypes ((List!9178 0))(
  ( (Nil!9175) (Cons!9174 (h!10030 (_ BitVec 64)) (t!15392 List!9178)) )
))
(declare-fun arrayNoDuplicates!0 (array!31209 (_ BitVec 32) List!9178) Bool)

(assert (=> b!481784 (= res!287214 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9175))))

(declare-fun mapIsEmpty!22369 () Bool)

(assert (=> mapIsEmpty!22369 mapRes!22369))

(declare-fun b!481785 () Bool)

(declare-fun res!287212 () Bool)

(assert (=> b!481785 (=> (not res!287212) (not e!283459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!481785 (= res!287212 (validKeyInArray!0 k0!1332))))

(declare-fun res!287211 () Bool)

(assert (=> start!43482 (=> (not res!287211) (not e!283459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43482 (= res!287211 (validMask!0 mask!2352))))

(assert (=> start!43482 e!283459))

(assert (=> start!43482 true))

(assert (=> start!43482 tp_is_empty!13773))

(declare-fun array_inv!10822 (array!31207) Bool)

(assert (=> start!43482 (and (array_inv!10822 _values!1516) e!283461)))

(assert (=> start!43482 tp!43065))

(declare-fun array_inv!10823 (array!31209) Bool)

(assert (=> start!43482 (array_inv!10823 _keys!1874)))

(declare-fun b!481786 () Bool)

(assert (=> b!481786 (= e!283459 (not true))))

(declare-fun lt!218621 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31209 (_ BitVec 32)) Bool)

(assert (=> b!481786 (arrayForallSeekEntryOrOpenFound!0 lt!218621 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14136 0))(
  ( (Unit!14137) )
))
(declare-fun lt!218622 () Unit!14136)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31209 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14136)

(assert (=> b!481786 (= lt!218622 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218621))))

(declare-fun arrayScanForKey!0 (array!31209 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!481786 (= lt!218621 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!481786 e!283457))

(declare-fun c!57945 () Bool)

(assert (=> b!481786 (= c!57945 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218623 () Unit!14136)

(declare-fun lemmaKeyInListMapIsInArray!139 (array!31209 array!31207 (_ BitVec 32) (_ BitVec 32) V!19435 V!19435 (_ BitVec 64) Int) Unit!14136)

(assert (=> b!481786 (= lt!218623 (lemmaKeyInListMapIsInArray!139 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun mapNonEmpty!22369 () Bool)

(declare-fun tp!43066 () Bool)

(assert (=> mapNonEmpty!22369 (= mapRes!22369 (and tp!43066 e!283460))))

(declare-fun mapValue!22369 () ValueCell!6525)

(declare-fun mapRest!22369 () (Array (_ BitVec 32) ValueCell!6525))

(declare-fun mapKey!22369 () (_ BitVec 32))

(assert (=> mapNonEmpty!22369 (= (arr!15006 _values!1516) (store mapRest!22369 mapKey!22369 mapValue!22369))))

(declare-fun b!481787 () Bool)

(declare-fun arrayContainsKey!0 (array!31209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!481787 (= e!283457 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!481788 () Bool)

(declare-fun res!287213 () Bool)

(assert (=> b!481788 (=> (not res!287213) (not e!283459))))

(assert (=> b!481788 (= res!287213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!481789 () Bool)

(assert (=> b!481789 (= e!283458 tp_is_empty!13773)))

(declare-fun b!481790 () Bool)

(declare-fun res!287215 () Bool)

(assert (=> b!481790 (=> (not res!287215) (not e!283459))))

(assert (=> b!481790 (= res!287215 (and (= (size!15364 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15365 _keys!1874) (size!15364 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(assert (= (and start!43482 res!287211) b!481790))

(assert (= (and b!481790 res!287215) b!481788))

(assert (= (and b!481788 res!287213) b!481784))

(assert (= (and b!481784 res!287214) b!481781))

(assert (= (and b!481781 res!287210) b!481785))

(assert (= (and b!481785 res!287212) b!481786))

(assert (= (and b!481786 c!57945) b!481787))

(assert (= (and b!481786 (not c!57945)) b!481783))

(assert (= (and b!481782 condMapEmpty!22369) mapIsEmpty!22369))

(assert (= (and b!481782 (not condMapEmpty!22369)) mapNonEmpty!22369))

(get-info :version)

(assert (= (and mapNonEmpty!22369 ((_ is ValueCellFull!6525) mapValue!22369)) b!481780))

(assert (= (and b!481782 ((_ is ValueCellFull!6525) mapDefault!22369)) b!481789))

(assert (= start!43482 b!481782))

(declare-fun m!463179 () Bool)

(assert (=> b!481785 m!463179))

(declare-fun m!463181 () Bool)

(assert (=> b!481781 m!463181))

(assert (=> b!481781 m!463181))

(declare-fun m!463183 () Bool)

(assert (=> b!481781 m!463183))

(declare-fun m!463185 () Bool)

(assert (=> b!481787 m!463185))

(declare-fun m!463187 () Bool)

(assert (=> b!481788 m!463187))

(declare-fun m!463189 () Bool)

(assert (=> start!43482 m!463189))

(declare-fun m!463191 () Bool)

(assert (=> start!43482 m!463191))

(declare-fun m!463193 () Bool)

(assert (=> start!43482 m!463193))

(declare-fun m!463195 () Bool)

(assert (=> mapNonEmpty!22369 m!463195))

(declare-fun m!463197 () Bool)

(assert (=> b!481784 m!463197))

(declare-fun m!463199 () Bool)

(assert (=> b!481786 m!463199))

(declare-fun m!463201 () Bool)

(assert (=> b!481786 m!463201))

(declare-fun m!463203 () Bool)

(assert (=> b!481786 m!463203))

(declare-fun m!463205 () Bool)

(assert (=> b!481786 m!463205))

(check-sat (not b!481788) (not b!481786) b_and!21021 (not b!481784) (not start!43482) (not b!481787) (not mapNonEmpty!22369) (not b!481781) (not b_next!12261) (not b!481785) tp_is_empty!13773)
(check-sat b_and!21021 (not b_next!12261))
