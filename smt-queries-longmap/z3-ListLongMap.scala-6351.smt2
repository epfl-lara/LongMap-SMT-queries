; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82010 () Bool)

(assert start!82010)

(declare-fun b_free!18337 () Bool)

(declare-fun b_next!18337 () Bool)

(assert (=> start!82010 (= b_free!18337 (not b_next!18337))))

(declare-fun tp!63712 () Bool)

(declare-fun b_and!29833 () Bool)

(assert (=> start!82010 (= tp!63712 b_and!29833)))

(declare-fun b!955331 () Bool)

(declare-fun e!538299 () Bool)

(declare-fun e!538298 () Bool)

(declare-fun mapRes!33283 () Bool)

(assert (=> b!955331 (= e!538299 (and e!538298 mapRes!33283))))

(declare-fun condMapEmpty!33283 () Bool)

(declare-datatypes ((V!32825 0))(
  ( (V!32826 (val!10491 Int)) )
))
(declare-datatypes ((ValueCell!9959 0))(
  ( (ValueCellFull!9959 (v!13043 V!32825)) (EmptyCell!9959) )
))
(declare-datatypes ((array!57922 0))(
  ( (array!57923 (arr!27836 (Array (_ BitVec 32) ValueCell!9959)) (size!28316 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57922)

(declare-fun mapDefault!33283 () ValueCell!9959)

(assert (=> b!955331 (= condMapEmpty!33283 (= (arr!27836 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9959)) mapDefault!33283)))))

(declare-fun b!955332 () Bool)

(declare-fun e!538297 () Bool)

(declare-fun tp_is_empty!20881 () Bool)

(assert (=> b!955332 (= e!538297 tp_is_empty!20881)))

(declare-fun mapNonEmpty!33283 () Bool)

(declare-fun tp!63711 () Bool)

(assert (=> mapNonEmpty!33283 (= mapRes!33283 (and tp!63711 e!538297))))

(declare-fun mapKey!33283 () (_ BitVec 32))

(declare-fun mapValue!33283 () ValueCell!9959)

(declare-fun mapRest!33283 () (Array (_ BitVec 32) ValueCell!9959))

(assert (=> mapNonEmpty!33283 (= (arr!27836 _values!1197) (store mapRest!33283 mapKey!33283 mapValue!33283))))

(declare-fun b!955333 () Bool)

(declare-fun e!538300 () Bool)

(assert (=> b!955333 (= e!538300 false)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun zeroValue!1139 () V!32825)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun lt!430260 () Bool)

(declare-datatypes ((array!57924 0))(
  ( (array!57925 (arr!27837 (Array (_ BitVec 32) (_ BitVec 64))) (size!28317 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57924)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32825)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13598 0))(
  ( (tuple2!13599 (_1!6810 (_ BitVec 64)) (_2!6810 V!32825)) )
))
(declare-datatypes ((List!19388 0))(
  ( (Nil!19385) (Cons!19384 (h!20552 tuple2!13598) (t!27741 List!19388)) )
))
(declare-datatypes ((ListLongMap!12297 0))(
  ( (ListLongMap!12298 (toList!6164 List!19388)) )
))
(declare-fun contains!5273 (ListLongMap!12297 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3397 (array!57924 array!57922 (_ BitVec 32) (_ BitVec 32) V!32825 V!32825 (_ BitVec 32) Int) ListLongMap!12297)

(assert (=> b!955333 (= lt!430260 (contains!5273 (getCurrentListMap!3397 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27837 _keys!1441) i!735)))))

(declare-fun b!955334 () Bool)

(declare-fun res!639476 () Bool)

(assert (=> b!955334 (=> (not res!639476) (not e!538300))))

(declare-datatypes ((List!19389 0))(
  ( (Nil!19386) (Cons!19385 (h!20553 (_ BitVec 64)) (t!27742 List!19389)) )
))
(declare-fun arrayNoDuplicates!0 (array!57924 (_ BitVec 32) List!19389) Bool)

(assert (=> b!955334 (= res!639476 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19386))))

(declare-fun b!955335 () Bool)

(assert (=> b!955335 (= e!538298 tp_is_empty!20881)))

(declare-fun mapIsEmpty!33283 () Bool)

(assert (=> mapIsEmpty!33283 mapRes!33283))

(declare-fun b!955336 () Bool)

(declare-fun res!639475 () Bool)

(assert (=> b!955336 (=> (not res!639475) (not e!538300))))

(assert (=> b!955336 (= res!639475 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28317 _keys!1441))))))

(declare-fun b!955337 () Bool)

(declare-fun res!639472 () Bool)

(assert (=> b!955337 (=> (not res!639472) (not e!538300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955337 (= res!639472 (validKeyInArray!0 (select (arr!27837 _keys!1441) i!735)))))

(declare-fun b!955338 () Bool)

(declare-fun res!639474 () Bool)

(assert (=> b!955338 (=> (not res!639474) (not e!538300))))

(assert (=> b!955338 (= res!639474 (and (= (size!28316 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28317 _keys!1441) (size!28316 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun res!639471 () Bool)

(assert (=> start!82010 (=> (not res!639471) (not e!538300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82010 (= res!639471 (validMask!0 mask!1823))))

(assert (=> start!82010 e!538300))

(assert (=> start!82010 true))

(assert (=> start!82010 tp_is_empty!20881))

(declare-fun array_inv!21683 (array!57924) Bool)

(assert (=> start!82010 (array_inv!21683 _keys!1441)))

(declare-fun array_inv!21684 (array!57922) Bool)

(assert (=> start!82010 (and (array_inv!21684 _values!1197) e!538299)))

(assert (=> start!82010 tp!63712))

(declare-fun b!955330 () Bool)

(declare-fun res!639473 () Bool)

(assert (=> b!955330 (=> (not res!639473) (not e!538300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57924 (_ BitVec 32)) Bool)

(assert (=> b!955330 (= res!639473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(assert (= (and start!82010 res!639471) b!955338))

(assert (= (and b!955338 res!639474) b!955330))

(assert (= (and b!955330 res!639473) b!955334))

(assert (= (and b!955334 res!639476) b!955336))

(assert (= (and b!955336 res!639475) b!955337))

(assert (= (and b!955337 res!639472) b!955333))

(assert (= (and b!955331 condMapEmpty!33283) mapIsEmpty!33283))

(assert (= (and b!955331 (not condMapEmpty!33283)) mapNonEmpty!33283))

(get-info :version)

(assert (= (and mapNonEmpty!33283 ((_ is ValueCellFull!9959) mapValue!33283)) b!955332))

(assert (= (and b!955331 ((_ is ValueCellFull!9959) mapDefault!33283)) b!955335))

(assert (= start!82010 b!955331))

(declare-fun m!887457 () Bool)

(assert (=> start!82010 m!887457))

(declare-fun m!887459 () Bool)

(assert (=> start!82010 m!887459))

(declare-fun m!887461 () Bool)

(assert (=> start!82010 m!887461))

(declare-fun m!887463 () Bool)

(assert (=> b!955330 m!887463))

(declare-fun m!887465 () Bool)

(assert (=> mapNonEmpty!33283 m!887465))

(declare-fun m!887467 () Bool)

(assert (=> b!955337 m!887467))

(assert (=> b!955337 m!887467))

(declare-fun m!887469 () Bool)

(assert (=> b!955337 m!887469))

(declare-fun m!887471 () Bool)

(assert (=> b!955334 m!887471))

(declare-fun m!887473 () Bool)

(assert (=> b!955333 m!887473))

(assert (=> b!955333 m!887467))

(assert (=> b!955333 m!887473))

(assert (=> b!955333 m!887467))

(declare-fun m!887475 () Bool)

(assert (=> b!955333 m!887475))

(check-sat b_and!29833 (not b!955334) (not b!955337) (not b!955330) (not mapNonEmpty!33283) (not b!955333) tp_is_empty!20881 (not start!82010) (not b_next!18337))
(check-sat b_and!29833 (not b_next!18337))
