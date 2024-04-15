; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77550 () Bool)

(assert start!77550)

(declare-fun b_free!16153 () Bool)

(declare-fun b_next!16153 () Bool)

(assert (=> start!77550 (= b_free!16153 (not b_next!16153))))

(declare-fun tp!56721 () Bool)

(declare-fun b_and!26493 () Bool)

(assert (=> start!77550 (= tp!56721 b_and!26493)))

(declare-fun b!903556 () Bool)

(declare-fun e!506270 () Bool)

(declare-fun e!506276 () Bool)

(assert (=> b!903556 (= e!506270 e!506276)))

(declare-fun res!609661 () Bool)

(assert (=> b!903556 (=> res!609661 e!506276)))

(declare-datatypes ((V!29727 0))(
  ( (V!29728 (val!9336 Int)) )
))
(declare-datatypes ((tuple2!12148 0))(
  ( (tuple2!12149 (_1!6085 (_ BitVec 64)) (_2!6085 V!29727)) )
))
(declare-datatypes ((List!17953 0))(
  ( (Nil!17950) (Cons!17949 (h!19095 tuple2!12148) (t!25327 List!17953)) )
))
(declare-datatypes ((ListLongMap!10835 0))(
  ( (ListLongMap!10836 (toList!5433 List!17953)) )
))
(declare-fun lt!407839 () ListLongMap!10835)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4444 (ListLongMap!10835 (_ BitVec 64)) Bool)

(assert (=> b!903556 (= res!609661 (not (contains!4444 lt!407839 k0!1033)))))

(declare-datatypes ((ValueCell!8804 0))(
  ( (ValueCellFull!8804 (v!11840 V!29727)) (EmptyCell!8804) )
))
(declare-datatypes ((array!53173 0))(
  ( (array!53174 (arr!25546 (Array (_ BitVec 32) ValueCell!8804)) (size!26007 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53173)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29727)

(declare-datatypes ((array!53175 0))(
  ( (array!53176 (arr!25547 (Array (_ BitVec 32) (_ BitVec 64))) (size!26008 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53175)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29727)

(declare-fun getCurrentListMap!2648 (array!53175 array!53173 (_ BitVec 32) (_ BitVec 32) V!29727 V!29727 (_ BitVec 32) Int) ListLongMap!10835)

(assert (=> b!903556 (= lt!407839 (getCurrentListMap!2648 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun mapIsEmpty!29569 () Bool)

(declare-fun mapRes!29569 () Bool)

(assert (=> mapIsEmpty!29569 mapRes!29569))

(declare-fun b!903557 () Bool)

(declare-fun res!609664 () Bool)

(declare-fun e!506273 () Bool)

(assert (=> b!903557 (=> (not res!609664) (not e!506273))))

(assert (=> b!903557 (= res!609664 (and (= (size!26007 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26008 _keys!1386) (size!26007 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903558 () Bool)

(declare-fun res!609663 () Bool)

(assert (=> b!903558 (=> (not res!609663) (not e!506273))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!903558 (= res!609663 (inRange!0 i!717 mask!1756))))

(declare-fun b!903559 () Bool)

(declare-fun res!609662 () Bool)

(assert (=> b!903559 (=> (not res!609662) (not e!506273))))

(assert (=> b!903559 (= res!609662 (contains!4444 (getCurrentListMap!2648 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!903560 () Bool)

(assert (=> b!903560 (= e!506273 (not e!506270))))

(declare-fun res!609666 () Bool)

(assert (=> b!903560 (=> res!609666 e!506270)))

(assert (=> b!903560 (= res!609666 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26008 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!903560 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30588 0))(
  ( (Unit!30589) )
))
(declare-fun lt!407838 () Unit!30588)

(declare-fun lemmaKeyInListMapIsInArray!176 (array!53175 array!53173 (_ BitVec 32) (_ BitVec 32) V!29727 V!29727 (_ BitVec 64) Int) Unit!30588)

(assert (=> b!903560 (= lt!407838 (lemmaKeyInListMapIsInArray!176 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!903562 () Bool)

(declare-fun res!609665 () Bool)

(assert (=> b!903562 (=> (not res!609665) (not e!506273))))

(declare-datatypes ((List!17954 0))(
  ( (Nil!17951) (Cons!17950 (h!19096 (_ BitVec 64)) (t!25328 List!17954)) )
))
(declare-fun arrayNoDuplicates!0 (array!53175 (_ BitVec 32) List!17954) Bool)

(assert (=> b!903562 (= res!609665 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17951))))

(declare-fun mapNonEmpty!29569 () Bool)

(declare-fun tp!56722 () Bool)

(declare-fun e!506275 () Bool)

(assert (=> mapNonEmpty!29569 (= mapRes!29569 (and tp!56722 e!506275))))

(declare-fun mapKey!29569 () (_ BitVec 32))

(declare-fun mapRest!29569 () (Array (_ BitVec 32) ValueCell!8804))

(declare-fun mapValue!29569 () ValueCell!8804)

(assert (=> mapNonEmpty!29569 (= (arr!25546 _values!1152) (store mapRest!29569 mapKey!29569 mapValue!29569))))

(declare-fun b!903563 () Bool)

(declare-fun tp_is_empty!18571 () Bool)

(assert (=> b!903563 (= e!506275 tp_is_empty!18571)))

(declare-fun b!903564 () Bool)

(declare-fun e!506272 () Bool)

(declare-fun e!506274 () Bool)

(assert (=> b!903564 (= e!506272 (and e!506274 mapRes!29569))))

(declare-fun condMapEmpty!29569 () Bool)

(declare-fun mapDefault!29569 () ValueCell!8804)

(assert (=> b!903564 (= condMapEmpty!29569 (= (arr!25546 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8804)) mapDefault!29569)))))

(declare-fun b!903565 () Bool)

(assert (=> b!903565 (= e!506274 tp_is_empty!18571)))

(declare-fun b!903566 () Bool)

(declare-fun res!609658 () Bool)

(assert (=> b!903566 (=> (not res!609658) (not e!506273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53175 (_ BitVec 32)) Bool)

(assert (=> b!903566 (= res!609658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903567 () Bool)

(declare-fun res!609660 () Bool)

(assert (=> b!903567 (=> (not res!609660) (not e!506273))))

(assert (=> b!903567 (= res!609660 (and (= (select (arr!25547 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!609659 () Bool)

(assert (=> start!77550 (=> (not res!609659) (not e!506273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77550 (= res!609659 (validMask!0 mask!1756))))

(assert (=> start!77550 e!506273))

(declare-fun array_inv!20076 (array!53173) Bool)

(assert (=> start!77550 (and (array_inv!20076 _values!1152) e!506272)))

(assert (=> start!77550 tp!56721))

(assert (=> start!77550 true))

(assert (=> start!77550 tp_is_empty!18571))

(declare-fun array_inv!20077 (array!53175) Bool)

(assert (=> start!77550 (array_inv!20077 _keys!1386)))

(declare-fun b!903561 () Bool)

(assert (=> b!903561 (= e!506276 true)))

(declare-fun lt!407837 () V!29727)

(declare-fun apply!419 (ListLongMap!10835 (_ BitVec 64)) V!29727)

(assert (=> b!903561 (= lt!407837 (apply!419 lt!407839 k0!1033))))

(assert (= (and start!77550 res!609659) b!903557))

(assert (= (and b!903557 res!609664) b!903566))

(assert (= (and b!903566 res!609658) b!903562))

(assert (= (and b!903562 res!609665) b!903559))

(assert (= (and b!903559 res!609662) b!903558))

(assert (= (and b!903558 res!609663) b!903567))

(assert (= (and b!903567 res!609660) b!903560))

(assert (= (and b!903560 (not res!609666)) b!903556))

(assert (= (and b!903556 (not res!609661)) b!903561))

(assert (= (and b!903564 condMapEmpty!29569) mapIsEmpty!29569))

(assert (= (and b!903564 (not condMapEmpty!29569)) mapNonEmpty!29569))

(get-info :version)

(assert (= (and mapNonEmpty!29569 ((_ is ValueCellFull!8804) mapValue!29569)) b!903563))

(assert (= (and b!903564 ((_ is ValueCellFull!8804) mapDefault!29569)) b!903565))

(assert (= start!77550 b!903564))

(declare-fun m!838637 () Bool)

(assert (=> b!903556 m!838637))

(declare-fun m!838639 () Bool)

(assert (=> b!903556 m!838639))

(declare-fun m!838641 () Bool)

(assert (=> b!903562 m!838641))

(declare-fun m!838643 () Bool)

(assert (=> start!77550 m!838643))

(declare-fun m!838645 () Bool)

(assert (=> start!77550 m!838645))

(declare-fun m!838647 () Bool)

(assert (=> start!77550 m!838647))

(declare-fun m!838649 () Bool)

(assert (=> mapNonEmpty!29569 m!838649))

(declare-fun m!838651 () Bool)

(assert (=> b!903560 m!838651))

(declare-fun m!838653 () Bool)

(assert (=> b!903560 m!838653))

(declare-fun m!838655 () Bool)

(assert (=> b!903559 m!838655))

(assert (=> b!903559 m!838655))

(declare-fun m!838657 () Bool)

(assert (=> b!903559 m!838657))

(declare-fun m!838659 () Bool)

(assert (=> b!903567 m!838659))

(declare-fun m!838661 () Bool)

(assert (=> b!903558 m!838661))

(declare-fun m!838663 () Bool)

(assert (=> b!903566 m!838663))

(declare-fun m!838665 () Bool)

(assert (=> b!903561 m!838665))

(check-sat (not b!903566) (not b!903562) (not b!903558) (not mapNonEmpty!29569) b_and!26493 (not b!903560) (not b!903556) (not start!77550) tp_is_empty!18571 (not b_next!16153) (not b!903561) (not b!903559))
(check-sat b_and!26493 (not b_next!16153))
