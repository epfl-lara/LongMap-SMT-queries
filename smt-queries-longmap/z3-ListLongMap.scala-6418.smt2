; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82472 () Bool)

(assert start!82472)

(declare-fun b_free!18577 () Bool)

(declare-fun b_next!18577 () Bool)

(assert (=> start!82472 (= b_free!18577 (not b_next!18577))))

(declare-fun tp!64692 () Bool)

(declare-fun b_and!30075 () Bool)

(assert (=> start!82472 (= tp!64692 b_and!30075)))

(declare-fun b!960445 () Bool)

(declare-fun res!642651 () Bool)

(declare-fun e!541482 () Bool)

(assert (=> b!960445 (=> (not res!642651) (not e!541482))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((V!33361 0))(
  ( (V!33362 (val!10692 Int)) )
))
(declare-datatypes ((ValueCell!10160 0))(
  ( (ValueCellFull!10160 (v!13246 V!33361)) (EmptyCell!10160) )
))
(declare-datatypes ((array!58694 0))(
  ( (array!58695 (arr!28216 (Array (_ BitVec 32) ValueCell!10160)) (size!28696 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58694)

(declare-datatypes ((array!58696 0))(
  ( (array!58697 (arr!28217 (Array (_ BitVec 32) (_ BitVec 64))) (size!28697 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58696)

(assert (=> b!960445 (= res!642651 (and (= (size!28696 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28697 _keys!1668) (size!28696 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960446 () Bool)

(declare-fun res!642653 () Bool)

(assert (=> b!960446 (=> (not res!642653) (not e!541482))))

(declare-fun minValue!1328 () V!33361)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33361)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13774 0))(
  ( (tuple2!13775 (_1!6898 (_ BitVec 64)) (_2!6898 V!33361)) )
))
(declare-datatypes ((List!19605 0))(
  ( (Nil!19602) (Cons!19601 (h!20769 tuple2!13774) (t!27960 List!19605)) )
))
(declare-datatypes ((ListLongMap!12473 0))(
  ( (ListLongMap!12474 (toList!6252 List!19605)) )
))
(declare-fun contains!5366 (ListLongMap!12473 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3485 (array!58696 array!58694 (_ BitVec 32) (_ BitVec 32) V!33361 V!33361 (_ BitVec 32) Int) ListLongMap!12473)

(assert (=> b!960446 (= res!642653 (contains!5366 (getCurrentListMap!3485 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28217 _keys!1668) i!793)))))

(declare-fun b!960447 () Bool)

(declare-fun res!642650 () Bool)

(assert (=> b!960447 (=> (not res!642650) (not e!541482))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960447 (= res!642650 (validKeyInArray!0 (select (arr!28217 _keys!1668) i!793)))))

(declare-fun res!642654 () Bool)

(assert (=> start!82472 (=> (not res!642654) (not e!541482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82472 (= res!642654 (validMask!0 mask!2088))))

(assert (=> start!82472 e!541482))

(assert (=> start!82472 true))

(declare-fun tp_is_empty!21283 () Bool)

(assert (=> start!82472 tp_is_empty!21283))

(declare-fun array_inv!21949 (array!58696) Bool)

(assert (=> start!82472 (array_inv!21949 _keys!1668)))

(declare-fun e!541479 () Bool)

(declare-fun array_inv!21950 (array!58694) Bool)

(assert (=> start!82472 (and (array_inv!21950 _values!1386) e!541479)))

(assert (=> start!82472 tp!64692))

(declare-fun b!960448 () Bool)

(declare-fun res!642655 () Bool)

(assert (=> b!960448 (=> (not res!642655) (not e!541482))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58696 (_ BitVec 32)) Bool)

(assert (=> b!960448 (= res!642655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!960449 () Bool)

(declare-fun e!541480 () Bool)

(declare-fun mapRes!33904 () Bool)

(assert (=> b!960449 (= e!541479 (and e!541480 mapRes!33904))))

(declare-fun condMapEmpty!33904 () Bool)

(declare-fun mapDefault!33904 () ValueCell!10160)

(assert (=> b!960449 (= condMapEmpty!33904 (= (arr!28216 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10160)) mapDefault!33904)))))

(declare-fun mapIsEmpty!33904 () Bool)

(assert (=> mapIsEmpty!33904 mapRes!33904))

(declare-fun b!960450 () Bool)

(declare-fun res!642649 () Bool)

(assert (=> b!960450 (=> (not res!642649) (not e!541482))))

(declare-datatypes ((List!19606 0))(
  ( (Nil!19603) (Cons!19602 (h!20770 (_ BitVec 64)) (t!27961 List!19606)) )
))
(declare-fun arrayNoDuplicates!0 (array!58696 (_ BitVec 32) List!19606) Bool)

(assert (=> b!960450 (= res!642649 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19603))))

(declare-fun b!960451 () Bool)

(declare-fun e!541478 () Bool)

(assert (=> b!960451 (= e!541478 tp_is_empty!21283)))

(declare-fun b!960452 () Bool)

(declare-fun res!642652 () Bool)

(assert (=> b!960452 (=> (not res!642652) (not e!541482))))

(assert (=> b!960452 (= res!642652 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28697 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28697 _keys!1668))))))

(declare-fun b!960453 () Bool)

(assert (=> b!960453 (= e!541482 (not (bvsle #b00000000000000000000000000000000 (size!28697 _keys!1668))))))

(assert (=> b!960453 (contains!5366 (getCurrentListMap!3485 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28217 _keys!1668) i!793))))

(declare-datatypes ((Unit!32154 0))(
  ( (Unit!32155) )
))
(declare-fun lt!430918 () Unit!32154)

(declare-fun lemmaInListMapFromThenInFromSmaller!15 (array!58696 array!58694 (_ BitVec 32) (_ BitVec 32) V!33361 V!33361 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32154)

(assert (=> b!960453 (= lt!430918 (lemmaInListMapFromThenInFromSmaller!15 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!960454 () Bool)

(assert (=> b!960454 (= e!541480 tp_is_empty!21283)))

(declare-fun mapNonEmpty!33904 () Bool)

(declare-fun tp!64693 () Bool)

(assert (=> mapNonEmpty!33904 (= mapRes!33904 (and tp!64693 e!541478))))

(declare-fun mapKey!33904 () (_ BitVec 32))

(declare-fun mapRest!33904 () (Array (_ BitVec 32) ValueCell!10160))

(declare-fun mapValue!33904 () ValueCell!10160)

(assert (=> mapNonEmpty!33904 (= (arr!28216 _values!1386) (store mapRest!33904 mapKey!33904 mapValue!33904))))

(assert (= (and start!82472 res!642654) b!960445))

(assert (= (and b!960445 res!642651) b!960448))

(assert (= (and b!960448 res!642655) b!960450))

(assert (= (and b!960450 res!642649) b!960452))

(assert (= (and b!960452 res!642652) b!960447))

(assert (= (and b!960447 res!642650) b!960446))

(assert (= (and b!960446 res!642653) b!960453))

(assert (= (and b!960449 condMapEmpty!33904) mapIsEmpty!33904))

(assert (= (and b!960449 (not condMapEmpty!33904)) mapNonEmpty!33904))

(get-info :version)

(assert (= (and mapNonEmpty!33904 ((_ is ValueCellFull!10160) mapValue!33904)) b!960451))

(assert (= (and b!960449 ((_ is ValueCellFull!10160) mapDefault!33904)) b!960454))

(assert (= start!82472 b!960449))

(declare-fun m!891315 () Bool)

(assert (=> b!960447 m!891315))

(assert (=> b!960447 m!891315))

(declare-fun m!891317 () Bool)

(assert (=> b!960447 m!891317))

(declare-fun m!891319 () Bool)

(assert (=> b!960453 m!891319))

(assert (=> b!960453 m!891315))

(assert (=> b!960453 m!891319))

(assert (=> b!960453 m!891315))

(declare-fun m!891321 () Bool)

(assert (=> b!960453 m!891321))

(declare-fun m!891323 () Bool)

(assert (=> b!960453 m!891323))

(declare-fun m!891325 () Bool)

(assert (=> mapNonEmpty!33904 m!891325))

(declare-fun m!891327 () Bool)

(assert (=> b!960450 m!891327))

(declare-fun m!891329 () Bool)

(assert (=> start!82472 m!891329))

(declare-fun m!891331 () Bool)

(assert (=> start!82472 m!891331))

(declare-fun m!891333 () Bool)

(assert (=> start!82472 m!891333))

(declare-fun m!891335 () Bool)

(assert (=> b!960448 m!891335))

(declare-fun m!891337 () Bool)

(assert (=> b!960446 m!891337))

(assert (=> b!960446 m!891315))

(assert (=> b!960446 m!891337))

(assert (=> b!960446 m!891315))

(declare-fun m!891339 () Bool)

(assert (=> b!960446 m!891339))

(check-sat (not b!960446) (not start!82472) (not b!960453) (not b_next!18577) (not b!960450) (not b!960447) (not mapNonEmpty!33904) tp_is_empty!21283 (not b!960448) b_and!30075)
(check-sat b_and!30075 (not b_next!18577))
