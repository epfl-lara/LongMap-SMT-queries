; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82400 () Bool)

(assert start!82400)

(declare-fun b_free!18505 () Bool)

(declare-fun b_next!18505 () Bool)

(assert (=> start!82400 (= b_free!18505 (not b_next!18505))))

(declare-fun tp!64476 () Bool)

(declare-fun b_and!30003 () Bool)

(assert (=> start!82400 (= tp!64476 b_and!30003)))

(declare-fun b!959399 () Bool)

(declare-fun e!540939 () Bool)

(declare-fun tp_is_empty!21211 () Bool)

(assert (=> b!959399 (= e!540939 tp_is_empty!21211)))

(declare-fun b!959400 () Bool)

(declare-fun res!641928 () Bool)

(declare-fun e!540940 () Bool)

(assert (=> b!959400 (=> (not res!641928) (not e!540940))))

(declare-datatypes ((array!58552 0))(
  ( (array!58553 (arr!28145 (Array (_ BitVec 32) (_ BitVec 64))) (size!28625 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58552)

(declare-datatypes ((List!19553 0))(
  ( (Nil!19550) (Cons!19549 (h!20717 (_ BitVec 64)) (t!27908 List!19553)) )
))
(declare-fun arrayNoDuplicates!0 (array!58552 (_ BitVec 32) List!19553) Bool)

(assert (=> b!959400 (= res!641928 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19550))))

(declare-fun b!959401 () Bool)

(declare-fun e!540941 () Bool)

(declare-fun e!540938 () Bool)

(declare-fun mapRes!33796 () Bool)

(assert (=> b!959401 (= e!540941 (and e!540938 mapRes!33796))))

(declare-fun condMapEmpty!33796 () Bool)

(declare-datatypes ((V!33265 0))(
  ( (V!33266 (val!10656 Int)) )
))
(declare-datatypes ((ValueCell!10124 0))(
  ( (ValueCellFull!10124 (v!13210 V!33265)) (EmptyCell!10124) )
))
(declare-datatypes ((array!58554 0))(
  ( (array!58555 (arr!28146 (Array (_ BitVec 32) ValueCell!10124)) (size!28626 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58554)

(declare-fun mapDefault!33796 () ValueCell!10124)

(assert (=> b!959401 (= condMapEmpty!33796 (= (arr!28146 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10124)) mapDefault!33796)))))

(declare-fun b!959402 () Bool)

(assert (=> b!959402 (= e!540938 tp_is_empty!21211)))

(declare-fun b!959403 () Bool)

(declare-fun res!641929 () Bool)

(assert (=> b!959403 (=> (not res!641929) (not e!540940))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!959403 (= res!641929 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28625 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28625 _keys!1668))))))

(declare-fun b!959404 () Bool)

(declare-fun res!641930 () Bool)

(assert (=> b!959404 (=> (not res!641930) (not e!540940))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58552 (_ BitVec 32)) Bool)

(assert (=> b!959404 (= res!641930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959405 () Bool)

(declare-fun res!641927 () Bool)

(assert (=> b!959405 (=> (not res!641927) (not e!540940))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959405 (= res!641927 (validKeyInArray!0 (select (arr!28145 _keys!1668) i!793)))))

(declare-fun mapIsEmpty!33796 () Bool)

(assert (=> mapIsEmpty!33796 mapRes!33796))

(declare-fun b!959406 () Bool)

(assert (=> b!959406 (= e!540940 false)))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33265)

(declare-fun minValue!1328 () V!33265)

(declare-fun lt!430810 () Bool)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((tuple2!13720 0))(
  ( (tuple2!13721 (_1!6871 (_ BitVec 64)) (_2!6871 V!33265)) )
))
(declare-datatypes ((List!19554 0))(
  ( (Nil!19551) (Cons!19550 (h!20718 tuple2!13720) (t!27909 List!19554)) )
))
(declare-datatypes ((ListLongMap!12419 0))(
  ( (ListLongMap!12420 (toList!6225 List!19554)) )
))
(declare-fun contains!5339 (ListLongMap!12419 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3458 (array!58552 array!58554 (_ BitVec 32) (_ BitVec 32) V!33265 V!33265 (_ BitVec 32) Int) ListLongMap!12419)

(assert (=> b!959406 (= lt!430810 (contains!5339 (getCurrentListMap!3458 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28145 _keys!1668) i!793)))))

(declare-fun res!641931 () Bool)

(assert (=> start!82400 (=> (not res!641931) (not e!540940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82400 (= res!641931 (validMask!0 mask!2088))))

(assert (=> start!82400 e!540940))

(assert (=> start!82400 true))

(assert (=> start!82400 tp_is_empty!21211))

(declare-fun array_inv!21905 (array!58552) Bool)

(assert (=> start!82400 (array_inv!21905 _keys!1668)))

(declare-fun array_inv!21906 (array!58554) Bool)

(assert (=> start!82400 (and (array_inv!21906 _values!1386) e!540941)))

(assert (=> start!82400 tp!64476))

(declare-fun b!959407 () Bool)

(declare-fun res!641932 () Bool)

(assert (=> b!959407 (=> (not res!641932) (not e!540940))))

(assert (=> b!959407 (= res!641932 (and (= (size!28626 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28625 _keys!1668) (size!28626 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33796 () Bool)

(declare-fun tp!64477 () Bool)

(assert (=> mapNonEmpty!33796 (= mapRes!33796 (and tp!64477 e!540939))))

(declare-fun mapKey!33796 () (_ BitVec 32))

(declare-fun mapValue!33796 () ValueCell!10124)

(declare-fun mapRest!33796 () (Array (_ BitVec 32) ValueCell!10124))

(assert (=> mapNonEmpty!33796 (= (arr!28146 _values!1386) (store mapRest!33796 mapKey!33796 mapValue!33796))))

(assert (= (and start!82400 res!641931) b!959407))

(assert (= (and b!959407 res!641932) b!959404))

(assert (= (and b!959404 res!641930) b!959400))

(assert (= (and b!959400 res!641928) b!959403))

(assert (= (and b!959403 res!641929) b!959405))

(assert (= (and b!959405 res!641927) b!959406))

(assert (= (and b!959401 condMapEmpty!33796) mapIsEmpty!33796))

(assert (= (and b!959401 (not condMapEmpty!33796)) mapNonEmpty!33796))

(get-info :version)

(assert (= (and mapNonEmpty!33796 ((_ is ValueCellFull!10124) mapValue!33796)) b!959399))

(assert (= (and b!959401 ((_ is ValueCellFull!10124) mapDefault!33796)) b!959402))

(assert (= start!82400 b!959401))

(declare-fun m!890451 () Bool)

(assert (=> b!959405 m!890451))

(assert (=> b!959405 m!890451))

(declare-fun m!890453 () Bool)

(assert (=> b!959405 m!890453))

(declare-fun m!890455 () Bool)

(assert (=> mapNonEmpty!33796 m!890455))

(declare-fun m!890457 () Bool)

(assert (=> b!959404 m!890457))

(declare-fun m!890459 () Bool)

(assert (=> b!959400 m!890459))

(declare-fun m!890461 () Bool)

(assert (=> b!959406 m!890461))

(assert (=> b!959406 m!890451))

(assert (=> b!959406 m!890461))

(assert (=> b!959406 m!890451))

(declare-fun m!890463 () Bool)

(assert (=> b!959406 m!890463))

(declare-fun m!890465 () Bool)

(assert (=> start!82400 m!890465))

(declare-fun m!890467 () Bool)

(assert (=> start!82400 m!890467))

(declare-fun m!890469 () Bool)

(assert (=> start!82400 m!890469))

(check-sat (not b_next!18505) (not b!959406) tp_is_empty!21211 (not b!959405) (not b!959404) b_and!30003 (not mapNonEmpty!33796) (not start!82400) (not b!959400))
(check-sat b_and!30003 (not b_next!18505))
