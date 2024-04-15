; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!830 () Bool)

(assert start!830)

(declare-fun b_free!223 () Bool)

(declare-fun b_next!223 () Bool)

(assert (=> start!830 (= b_free!223 (not b_next!223))))

(declare-fun tp!899 () Bool)

(declare-fun b_and!369 () Bool)

(assert (=> start!830 (= tp!899 b_and!369)))

(declare-fun res!6866 () Bool)

(declare-fun e!3581 () Bool)

(assert (=> start!830 (=> (not res!6866) (not e!3581))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!830 (= res!6866 (validMask!0 mask!2250))))

(assert (=> start!830 e!3581))

(assert (=> start!830 tp!899))

(assert (=> start!830 true))

(declare-datatypes ((V!579 0))(
  ( (V!580 (val!156 Int)) )
))
(declare-datatypes ((ValueCell!134 0))(
  ( (ValueCellFull!134 (v!1247 V!579)) (EmptyCell!134) )
))
(declare-datatypes ((array!527 0))(
  ( (array!528 (arr!252 (Array (_ BitVec 32) ValueCell!134)) (size!314 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!527)

(declare-fun e!3582 () Bool)

(declare-fun array_inv!181 (array!527) Bool)

(assert (=> start!830 (and (array_inv!181 _values!1492) e!3582)))

(declare-fun tp_is_empty!301 () Bool)

(assert (=> start!830 tp_is_empty!301))

(declare-datatypes ((array!529 0))(
  ( (array!530 (arr!253 (Array (_ BitVec 32) (_ BitVec 64))) (size!315 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!529)

(declare-fun array_inv!182 (array!529) Bool)

(assert (=> start!830 (array_inv!182 _keys!1806)))

(declare-fun b!6509 () Bool)

(declare-fun e!3580 () Bool)

(declare-fun e!3585 () Bool)

(assert (=> b!6509 (= e!3580 e!3585)))

(declare-fun res!6865 () Bool)

(assert (=> b!6509 (=> res!6865 e!3585)))

(assert (=> b!6509 (= res!6865 (not (= (size!315 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(declare-fun lt!1227 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!529 (_ BitVec 32)) Bool)

(assert (=> b!6509 (arrayForallSeekEntryOrOpenFound!0 lt!1227 _keys!1806 mask!2250)))

(declare-datatypes ((Unit!113 0))(
  ( (Unit!114) )
))
(declare-fun lt!1229 () Unit!113)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!529 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!113)

(assert (=> b!6509 (= lt!1229 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1227))))

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!529 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!6509 (= lt!1227 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!6510 () Bool)

(declare-fun res!6864 () Bool)

(assert (=> b!6510 (=> (not res!6864) (not e!3581))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!579)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!579)

(declare-datatypes ((tuple2!160 0))(
  ( (tuple2!161 (_1!80 (_ BitVec 64)) (_2!80 V!579)) )
))
(declare-datatypes ((List!170 0))(
  ( (Nil!167) (Cons!166 (h!732 tuple2!160) (t!2305 List!170)) )
))
(declare-datatypes ((ListLongMap!165 0))(
  ( (ListLongMap!166 (toList!98 List!170)) )
))
(declare-fun contains!72 (ListLongMap!165 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!57 (array!529 array!527 (_ BitVec 32) (_ BitVec 32) V!579 V!579 (_ BitVec 32) Int) ListLongMap!165)

(assert (=> b!6510 (= res!6864 (contains!72 (getCurrentListMap!57 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!6511 () Bool)

(declare-fun res!6863 () Bool)

(assert (=> b!6511 (=> (not res!6863) (not e!3581))))

(assert (=> b!6511 (= res!6863 (and (= (size!314 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!315 _keys!1806) (size!314 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!6512 () Bool)

(assert (=> b!6512 (= e!3585 true)))

(declare-datatypes ((SeekEntryResult!19 0))(
  ( (MissingZero!19 (index!2195 (_ BitVec 32))) (Found!19 (index!2196 (_ BitVec 32))) (Intermediate!19 (undefined!831 Bool) (index!2197 (_ BitVec 32)) (x!2533 (_ BitVec 32))) (Undefined!19) (MissingVacant!19 (index!2198 (_ BitVec 32))) )
))
(declare-fun lt!1228 () SeekEntryResult!19)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!529 (_ BitVec 32)) SeekEntryResult!19)

(assert (=> b!6512 (= lt!1228 (seekEntryOrOpen!0 k0!1278 _keys!1806 mask!2250))))

(declare-fun b!6513 () Bool)

(declare-fun e!3586 () Bool)

(assert (=> b!6513 (= e!3586 tp_is_empty!301)))

(declare-fun mapIsEmpty!422 () Bool)

(declare-fun mapRes!422 () Bool)

(assert (=> mapIsEmpty!422 mapRes!422))

(declare-fun b!6514 () Bool)

(declare-fun e!3587 () Bool)

(declare-fun arrayContainsKey!0 (array!529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!6514 (= e!3587 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!6515 () Bool)

(declare-fun e!3583 () Bool)

(assert (=> b!6515 (= e!3583 tp_is_empty!301)))

(declare-fun b!6516 () Bool)

(declare-fun res!6861 () Bool)

(assert (=> b!6516 (=> (not res!6861) (not e!3581))))

(declare-datatypes ((List!171 0))(
  ( (Nil!168) (Cons!167 (h!733 (_ BitVec 64)) (t!2306 List!171)) )
))
(declare-fun arrayNoDuplicates!0 (array!529 (_ BitVec 32) List!171) Bool)

(assert (=> b!6516 (= res!6861 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!168))))

(declare-fun b!6517 () Bool)

(declare-fun res!6862 () Bool)

(assert (=> b!6517 (=> (not res!6862) (not e!3581))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6517 (= res!6862 (validKeyInArray!0 k0!1278))))

(declare-fun b!6518 () Bool)

(assert (=> b!6518 (= e!3587 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!422 () Bool)

(declare-fun tp!898 () Bool)

(assert (=> mapNonEmpty!422 (= mapRes!422 (and tp!898 e!3586))))

(declare-fun mapRest!422 () (Array (_ BitVec 32) ValueCell!134))

(declare-fun mapValue!422 () ValueCell!134)

(declare-fun mapKey!422 () (_ BitVec 32))

(assert (=> mapNonEmpty!422 (= (arr!252 _values!1492) (store mapRest!422 mapKey!422 mapValue!422))))

(declare-fun b!6519 () Bool)

(assert (=> b!6519 (= e!3581 (not e!3580))))

(declare-fun res!6868 () Bool)

(assert (=> b!6519 (=> res!6868 e!3580)))

(assert (=> b!6519 (= res!6868 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!6519 e!3587))

(declare-fun c!467 () Bool)

(assert (=> b!6519 (= c!467 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!1230 () Unit!113)

(declare-fun lemmaKeyInListMapIsInArray!40 (array!529 array!527 (_ BitVec 32) (_ BitVec 32) V!579 V!579 (_ BitVec 64) Int) Unit!113)

(assert (=> b!6519 (= lt!1230 (lemmaKeyInListMapIsInArray!40 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!6520 () Bool)

(declare-fun res!6867 () Bool)

(assert (=> b!6520 (=> (not res!6867) (not e!3581))))

(assert (=> b!6520 (= res!6867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!6521 () Bool)

(assert (=> b!6521 (= e!3582 (and e!3583 mapRes!422))))

(declare-fun condMapEmpty!422 () Bool)

(declare-fun mapDefault!422 () ValueCell!134)

(assert (=> b!6521 (= condMapEmpty!422 (= (arr!252 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!134)) mapDefault!422)))))

(assert (= (and start!830 res!6866) b!6511))

(assert (= (and b!6511 res!6863) b!6520))

(assert (= (and b!6520 res!6867) b!6516))

(assert (= (and b!6516 res!6861) b!6510))

(assert (= (and b!6510 res!6864) b!6517))

(assert (= (and b!6517 res!6862) b!6519))

(assert (= (and b!6519 c!467) b!6514))

(assert (= (and b!6519 (not c!467)) b!6518))

(assert (= (and b!6519 (not res!6868)) b!6509))

(assert (= (and b!6509 (not res!6865)) b!6512))

(assert (= (and b!6521 condMapEmpty!422) mapIsEmpty!422))

(assert (= (and b!6521 (not condMapEmpty!422)) mapNonEmpty!422))

(get-info :version)

(assert (= (and mapNonEmpty!422 ((_ is ValueCellFull!134) mapValue!422)) b!6513))

(assert (= (and b!6521 ((_ is ValueCellFull!134) mapDefault!422)) b!6515))

(assert (= start!830 b!6521))

(declare-fun m!3767 () Bool)

(assert (=> b!6514 m!3767))

(declare-fun m!3769 () Bool)

(assert (=> mapNonEmpty!422 m!3769))

(declare-fun m!3771 () Bool)

(assert (=> b!6516 m!3771))

(declare-fun m!3773 () Bool)

(assert (=> b!6509 m!3773))

(declare-fun m!3775 () Bool)

(assert (=> b!6509 m!3775))

(declare-fun m!3777 () Bool)

(assert (=> b!6509 m!3777))

(declare-fun m!3779 () Bool)

(assert (=> b!6510 m!3779))

(assert (=> b!6510 m!3779))

(declare-fun m!3781 () Bool)

(assert (=> b!6510 m!3781))

(declare-fun m!3783 () Bool)

(assert (=> b!6517 m!3783))

(declare-fun m!3785 () Bool)

(assert (=> b!6512 m!3785))

(declare-fun m!3787 () Bool)

(assert (=> b!6520 m!3787))

(declare-fun m!3789 () Bool)

(assert (=> start!830 m!3789))

(declare-fun m!3791 () Bool)

(assert (=> start!830 m!3791))

(declare-fun m!3793 () Bool)

(assert (=> start!830 m!3793))

(assert (=> b!6519 m!3767))

(declare-fun m!3795 () Bool)

(assert (=> b!6519 m!3795))

(check-sat (not b!6510) (not b!6520) (not b!6519) (not b!6516) (not b!6512) (not start!830) b_and!369 (not b_next!223) tp_is_empty!301 (not b!6517) (not b!6509) (not mapNonEmpty!422) (not b!6514))
(check-sat b_and!369 (not b_next!223))
