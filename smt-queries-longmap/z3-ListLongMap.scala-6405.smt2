; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82228 () Bool)

(assert start!82228)

(declare-fun b_free!18501 () Bool)

(declare-fun b_next!18501 () Bool)

(assert (=> start!82228 (= b_free!18501 (not b_next!18501))))

(declare-fun tp!64463 () Bool)

(declare-fun b_and!29989 () Bool)

(assert (=> start!82228 (= tp!64463 b_and!29989)))

(declare-fun res!641549 () Bool)

(declare-fun e!540328 () Bool)

(assert (=> start!82228 (=> (not res!641549) (not e!540328))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82228 (= res!641549 (validMask!0 mask!2088))))

(assert (=> start!82228 e!540328))

(assert (=> start!82228 true))

(declare-fun tp_is_empty!21207 () Bool)

(assert (=> start!82228 tp_is_empty!21207))

(declare-datatypes ((array!58515 0))(
  ( (array!58516 (arr!28131 (Array (_ BitVec 32) (_ BitVec 64))) (size!28610 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58515)

(declare-fun array_inv!21819 (array!58515) Bool)

(assert (=> start!82228 (array_inv!21819 _keys!1668)))

(declare-datatypes ((V!33259 0))(
  ( (V!33260 (val!10654 Int)) )
))
(declare-datatypes ((ValueCell!10122 0))(
  ( (ValueCellFull!10122 (v!13211 V!33259)) (EmptyCell!10122) )
))
(declare-datatypes ((array!58517 0))(
  ( (array!58518 (arr!28132 (Array (_ BitVec 32) ValueCell!10122)) (size!28611 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58517)

(declare-fun e!540329 () Bool)

(declare-fun array_inv!21820 (array!58517) Bool)

(assert (=> start!82228 (and (array_inv!21820 _values!1386) e!540329)))

(assert (=> start!82228 tp!64463))

(declare-fun b!958442 () Bool)

(assert (=> b!958442 (= e!540328 false)))

(declare-fun lt!430443 () Bool)

(declare-fun minValue!1328 () V!33259)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33259)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13734 0))(
  ( (tuple2!13735 (_1!6878 (_ BitVec 64)) (_2!6878 V!33259)) )
))
(declare-datatypes ((List!19556 0))(
  ( (Nil!19553) (Cons!19552 (h!20714 tuple2!13734) (t!27919 List!19556)) )
))
(declare-datatypes ((ListLongMap!12431 0))(
  ( (ListLongMap!12432 (toList!6231 List!19556)) )
))
(declare-fun contains!5332 (ListLongMap!12431 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3464 (array!58515 array!58517 (_ BitVec 32) (_ BitVec 32) V!33259 V!33259 (_ BitVec 32) Int) ListLongMap!12431)

(assert (=> b!958442 (= lt!430443 (contains!5332 (getCurrentListMap!3464 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28131 _keys!1668) i!793)))))

(declare-fun b!958443 () Bool)

(declare-fun res!641548 () Bool)

(assert (=> b!958443 (=> (not res!641548) (not e!540328))))

(declare-datatypes ((List!19557 0))(
  ( (Nil!19554) (Cons!19553 (h!20715 (_ BitVec 64)) (t!27920 List!19557)) )
))
(declare-fun arrayNoDuplicates!0 (array!58515 (_ BitVec 32) List!19557) Bool)

(assert (=> b!958443 (= res!641548 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19554))))

(declare-fun b!958444 () Bool)

(declare-fun res!641550 () Bool)

(assert (=> b!958444 (=> (not res!641550) (not e!540328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58515 (_ BitVec 32)) Bool)

(assert (=> b!958444 (= res!641550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958445 () Bool)

(declare-fun e!540330 () Bool)

(assert (=> b!958445 (= e!540330 tp_is_empty!21207)))

(declare-fun mapNonEmpty!33790 () Bool)

(declare-fun mapRes!33790 () Bool)

(declare-fun tp!64464 () Bool)

(declare-fun e!540327 () Bool)

(assert (=> mapNonEmpty!33790 (= mapRes!33790 (and tp!64464 e!540327))))

(declare-fun mapRest!33790 () (Array (_ BitVec 32) ValueCell!10122))

(declare-fun mapKey!33790 () (_ BitVec 32))

(declare-fun mapValue!33790 () ValueCell!10122)

(assert (=> mapNonEmpty!33790 (= (arr!28132 _values!1386) (store mapRest!33790 mapKey!33790 mapValue!33790))))

(declare-fun b!958446 () Bool)

(declare-fun res!641547 () Bool)

(assert (=> b!958446 (=> (not res!641547) (not e!540328))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958446 (= res!641547 (validKeyInArray!0 (select (arr!28131 _keys!1668) i!793)))))

(declare-fun b!958447 () Bool)

(assert (=> b!958447 (= e!540327 tp_is_empty!21207)))

(declare-fun b!958448 () Bool)

(assert (=> b!958448 (= e!540329 (and e!540330 mapRes!33790))))

(declare-fun condMapEmpty!33790 () Bool)

(declare-fun mapDefault!33790 () ValueCell!10122)

(assert (=> b!958448 (= condMapEmpty!33790 (= (arr!28132 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10122)) mapDefault!33790)))))

(declare-fun b!958449 () Bool)

(declare-fun res!641551 () Bool)

(assert (=> b!958449 (=> (not res!641551) (not e!540328))))

(assert (=> b!958449 (= res!641551 (and (= (size!28611 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28610 _keys!1668) (size!28611 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33790 () Bool)

(assert (=> mapIsEmpty!33790 mapRes!33790))

(declare-fun b!958450 () Bool)

(declare-fun res!641552 () Bool)

(assert (=> b!958450 (=> (not res!641552) (not e!540328))))

(assert (=> b!958450 (= res!641552 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28610 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28610 _keys!1668))))))

(assert (= (and start!82228 res!641549) b!958449))

(assert (= (and b!958449 res!641551) b!958444))

(assert (= (and b!958444 res!641550) b!958443))

(assert (= (and b!958443 res!641548) b!958450))

(assert (= (and b!958450 res!641552) b!958446))

(assert (= (and b!958446 res!641547) b!958442))

(assert (= (and b!958448 condMapEmpty!33790) mapIsEmpty!33790))

(assert (= (and b!958448 (not condMapEmpty!33790)) mapNonEmpty!33790))

(get-info :version)

(assert (= (and mapNonEmpty!33790 ((_ is ValueCellFull!10122) mapValue!33790)) b!958447))

(assert (= (and b!958448 ((_ is ValueCellFull!10122) mapDefault!33790)) b!958445))

(assert (= start!82228 b!958448))

(declare-fun m!889117 () Bool)

(assert (=> start!82228 m!889117))

(declare-fun m!889119 () Bool)

(assert (=> start!82228 m!889119))

(declare-fun m!889121 () Bool)

(assert (=> start!82228 m!889121))

(declare-fun m!889123 () Bool)

(assert (=> b!958443 m!889123))

(declare-fun m!889125 () Bool)

(assert (=> b!958442 m!889125))

(declare-fun m!889127 () Bool)

(assert (=> b!958442 m!889127))

(assert (=> b!958442 m!889125))

(assert (=> b!958442 m!889127))

(declare-fun m!889129 () Bool)

(assert (=> b!958442 m!889129))

(assert (=> b!958446 m!889127))

(assert (=> b!958446 m!889127))

(declare-fun m!889131 () Bool)

(assert (=> b!958446 m!889131))

(declare-fun m!889133 () Bool)

(assert (=> b!958444 m!889133))

(declare-fun m!889135 () Bool)

(assert (=> mapNonEmpty!33790 m!889135))

(check-sat (not b!958446) (not b!958442) (not start!82228) (not mapNonEmpty!33790) (not b!958443) b_and!29989 (not b!958444) (not b_next!18501) tp_is_empty!21207)
(check-sat b_and!29989 (not b_next!18501))
