; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77736 () Bool)

(assert start!77736)

(declare-fun b_free!16153 () Bool)

(declare-fun b_next!16153 () Bool)

(assert (=> start!77736 (= b_free!16153 (not b_next!16153))))

(declare-fun tp!56721 () Bool)

(declare-fun b_and!26529 () Bool)

(assert (=> start!77736 (= tp!56721 b_and!26529)))

(declare-fun b!904698 () Bool)

(declare-fun res!610117 () Bool)

(declare-fun e!507000 () Bool)

(assert (=> b!904698 (=> (not res!610117) (not e!507000))))

(declare-datatypes ((V!29727 0))(
  ( (V!29728 (val!9336 Int)) )
))
(declare-datatypes ((ValueCell!8804 0))(
  ( (ValueCellFull!8804 (v!11838 V!29727)) (EmptyCell!8804) )
))
(declare-datatypes ((array!53233 0))(
  ( (array!53234 (arr!25571 (Array (_ BitVec 32) ValueCell!8804)) (size!26031 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53233)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53235 0))(
  ( (array!53236 (arr!25572 (Array (_ BitVec 32) (_ BitVec 64))) (size!26032 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53235)

(assert (=> b!904698 (= res!610117 (and (= (size!26031 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26032 _keys!1386) (size!26031 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!904699 () Bool)

(declare-fun e!507003 () Bool)

(declare-fun tp_is_empty!18571 () Bool)

(assert (=> b!904699 (= e!507003 tp_is_empty!18571)))

(declare-fun res!610113 () Bool)

(assert (=> start!77736 (=> (not res!610113) (not e!507000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77736 (= res!610113 (validMask!0 mask!1756))))

(assert (=> start!77736 e!507000))

(declare-fun e!507005 () Bool)

(declare-fun array_inv!20100 (array!53233) Bool)

(assert (=> start!77736 (and (array_inv!20100 _values!1152) e!507005)))

(assert (=> start!77736 tp!56721))

(assert (=> start!77736 true))

(assert (=> start!77736 tp_is_empty!18571))

(declare-fun array_inv!20101 (array!53235) Bool)

(assert (=> start!77736 (array_inv!20101 _keys!1386)))

(declare-fun b!904700 () Bool)

(declare-fun mapRes!29569 () Bool)

(assert (=> b!904700 (= e!507005 (and e!507003 mapRes!29569))))

(declare-fun condMapEmpty!29569 () Bool)

(declare-fun mapDefault!29569 () ValueCell!8804)

(assert (=> b!904700 (= condMapEmpty!29569 (= (arr!25571 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8804)) mapDefault!29569)))))

(declare-fun b!904701 () Bool)

(declare-fun res!610115 () Bool)

(assert (=> b!904701 (=> (not res!610115) (not e!507000))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904701 (= res!610115 (inRange!0 i!717 mask!1756))))

(declare-fun b!904702 () Bool)

(declare-fun e!507002 () Bool)

(assert (=> b!904702 (= e!507000 (not e!507002))))

(declare-fun res!610114 () Bool)

(assert (=> b!904702 (=> res!610114 e!507002)))

(assert (=> b!904702 (= res!610114 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26032 _keys!1386))))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904702 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29727)

(declare-datatypes ((Unit!30650 0))(
  ( (Unit!30651) )
))
(declare-fun lt!408435 () Unit!30650)

(declare-fun minValue!1094 () V!29727)

(declare-fun lemmaKeyInListMapIsInArray!172 (array!53235 array!53233 (_ BitVec 32) (_ BitVec 32) V!29727 V!29727 (_ BitVec 64) Int) Unit!30650)

(assert (=> b!904702 (= lt!408435 (lemmaKeyInListMapIsInArray!172 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!904703 () Bool)

(declare-fun res!610119 () Bool)

(assert (=> b!904703 (=> (not res!610119) (not e!507000))))

(declare-datatypes ((List!17908 0))(
  ( (Nil!17905) (Cons!17904 (h!19056 (_ BitVec 64)) (t!25283 List!17908)) )
))
(declare-fun arrayNoDuplicates!0 (array!53235 (_ BitVec 32) List!17908) Bool)

(assert (=> b!904703 (= res!610119 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17905))))

(declare-fun b!904704 () Bool)

(declare-fun res!610112 () Bool)

(assert (=> b!904704 (=> (not res!610112) (not e!507000))))

(declare-datatypes ((tuple2!12056 0))(
  ( (tuple2!12057 (_1!6039 (_ BitVec 64)) (_2!6039 V!29727)) )
))
(declare-datatypes ((List!17909 0))(
  ( (Nil!17906) (Cons!17905 (h!19057 tuple2!12056) (t!25284 List!17909)) )
))
(declare-datatypes ((ListLongMap!10755 0))(
  ( (ListLongMap!10756 (toList!5393 List!17909)) )
))
(declare-fun contains!4451 (ListLongMap!10755 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2662 (array!53235 array!53233 (_ BitVec 32) (_ BitVec 32) V!29727 V!29727 (_ BitVec 32) Int) ListLongMap!10755)

(assert (=> b!904704 (= res!610112 (contains!4451 (getCurrentListMap!2662 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!904705 () Bool)

(declare-fun e!507004 () Bool)

(assert (=> b!904705 (= e!507004 true)))

(declare-fun lt!408436 () V!29727)

(declare-fun lt!408434 () ListLongMap!10755)

(declare-fun apply!421 (ListLongMap!10755 (_ BitVec 64)) V!29727)

(assert (=> b!904705 (= lt!408436 (apply!421 lt!408434 k0!1033))))

(declare-fun b!904706 () Bool)

(declare-fun res!610120 () Bool)

(assert (=> b!904706 (=> (not res!610120) (not e!507000))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53235 (_ BitVec 32)) Bool)

(assert (=> b!904706 (= res!610120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!904707 () Bool)

(declare-fun e!507006 () Bool)

(assert (=> b!904707 (= e!507006 tp_is_empty!18571)))

(declare-fun b!904708 () Bool)

(assert (=> b!904708 (= e!507002 e!507004)))

(declare-fun res!610118 () Bool)

(assert (=> b!904708 (=> res!610118 e!507004)))

(assert (=> b!904708 (= res!610118 (not (contains!4451 lt!408434 k0!1033)))))

(assert (=> b!904708 (= lt!408434 (getCurrentListMap!2662 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun mapNonEmpty!29569 () Bool)

(declare-fun tp!56722 () Bool)

(assert (=> mapNonEmpty!29569 (= mapRes!29569 (and tp!56722 e!507006))))

(declare-fun mapRest!29569 () (Array (_ BitVec 32) ValueCell!8804))

(declare-fun mapKey!29569 () (_ BitVec 32))

(declare-fun mapValue!29569 () ValueCell!8804)

(assert (=> mapNonEmpty!29569 (= (arr!25571 _values!1152) (store mapRest!29569 mapKey!29569 mapValue!29569))))

(declare-fun mapIsEmpty!29569 () Bool)

(assert (=> mapIsEmpty!29569 mapRes!29569))

(declare-fun b!904709 () Bool)

(declare-fun res!610116 () Bool)

(assert (=> b!904709 (=> (not res!610116) (not e!507000))))

(assert (=> b!904709 (= res!610116 (and (= (select (arr!25572 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!77736 res!610113) b!904698))

(assert (= (and b!904698 res!610117) b!904706))

(assert (= (and b!904706 res!610120) b!904703))

(assert (= (and b!904703 res!610119) b!904704))

(assert (= (and b!904704 res!610112) b!904701))

(assert (= (and b!904701 res!610115) b!904709))

(assert (= (and b!904709 res!610116) b!904702))

(assert (= (and b!904702 (not res!610114)) b!904708))

(assert (= (and b!904708 (not res!610118)) b!904705))

(assert (= (and b!904700 condMapEmpty!29569) mapIsEmpty!29569))

(assert (= (and b!904700 (not condMapEmpty!29569)) mapNonEmpty!29569))

(get-info :version)

(assert (= (and mapNonEmpty!29569 ((_ is ValueCellFull!8804) mapValue!29569)) b!904707))

(assert (= (and b!904700 ((_ is ValueCellFull!8804) mapDefault!29569)) b!904699))

(assert (= start!77736 b!904700))

(declare-fun m!840689 () Bool)

(assert (=> b!904705 m!840689))

(declare-fun m!840691 () Bool)

(assert (=> mapNonEmpty!29569 m!840691))

(declare-fun m!840693 () Bool)

(assert (=> start!77736 m!840693))

(declare-fun m!840695 () Bool)

(assert (=> start!77736 m!840695))

(declare-fun m!840697 () Bool)

(assert (=> start!77736 m!840697))

(declare-fun m!840699 () Bool)

(assert (=> b!904709 m!840699))

(declare-fun m!840701 () Bool)

(assert (=> b!904704 m!840701))

(assert (=> b!904704 m!840701))

(declare-fun m!840703 () Bool)

(assert (=> b!904704 m!840703))

(declare-fun m!840705 () Bool)

(assert (=> b!904708 m!840705))

(declare-fun m!840707 () Bool)

(assert (=> b!904708 m!840707))

(declare-fun m!840709 () Bool)

(assert (=> b!904706 m!840709))

(declare-fun m!840711 () Bool)

(assert (=> b!904703 m!840711))

(declare-fun m!840713 () Bool)

(assert (=> b!904702 m!840713))

(declare-fun m!840715 () Bool)

(assert (=> b!904702 m!840715))

(declare-fun m!840717 () Bool)

(assert (=> b!904701 m!840717))

(check-sat (not start!77736) (not b!904705) (not b!904704) tp_is_empty!18571 (not mapNonEmpty!29569) (not b!904703) (not b!904701) (not b!904706) (not b!904702) b_and!26529 (not b!904708) (not b_next!16153))
(check-sat b_and!26529 (not b_next!16153))
