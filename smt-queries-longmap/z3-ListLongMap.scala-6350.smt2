; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81818 () Bool)

(assert start!81818)

(declare-fun b_free!18331 () Bool)

(declare-fun b_next!18331 () Bool)

(assert (=> start!81818 (= b_free!18331 (not b_next!18331))))

(declare-fun tp!63693 () Bool)

(declare-fun b_and!29791 () Bool)

(assert (=> start!81818 (= tp!63693 b_and!29791)))

(declare-fun b!954107 () Bool)

(declare-fun e!537523 () Bool)

(declare-fun e!537524 () Bool)

(declare-fun mapRes!33274 () Bool)

(assert (=> b!954107 (= e!537523 (and e!537524 mapRes!33274))))

(declare-fun condMapEmpty!33274 () Bool)

(declare-datatypes ((V!32817 0))(
  ( (V!32818 (val!10488 Int)) )
))
(declare-datatypes ((ValueCell!9956 0))(
  ( (ValueCellFull!9956 (v!13042 V!32817)) (EmptyCell!9956) )
))
(declare-datatypes ((array!57822 0))(
  ( (array!57823 (arr!27791 (Array (_ BitVec 32) ValueCell!9956)) (size!28272 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57822)

(declare-fun mapDefault!33274 () ValueCell!9956)

(assert (=> b!954107 (= condMapEmpty!33274 (= (arr!27791 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9956)) mapDefault!33274)))))

(declare-fun b!954108 () Bool)

(declare-fun res!638963 () Bool)

(declare-fun e!537522 () Bool)

(assert (=> b!954108 (=> (not res!638963) (not e!537522))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((array!57824 0))(
  ( (array!57825 (arr!27792 (Array (_ BitVec 32) (_ BitVec 64))) (size!28273 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57824)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!954108 (= res!638963 (and (= (size!28272 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28273 _keys!1441) (size!28272 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!954109 () Bool)

(declare-fun res!638968 () Bool)

(assert (=> b!954109 (=> (not res!638968) (not e!537522))))

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954109 (= res!638968 (validKeyInArray!0 (select (arr!27792 _keys!1441) i!735)))))

(declare-fun mapIsEmpty!33274 () Bool)

(assert (=> mapIsEmpty!33274 mapRes!33274))

(declare-fun b!954110 () Bool)

(declare-fun e!537525 () Bool)

(declare-fun tp_is_empty!20875 () Bool)

(assert (=> b!954110 (= e!537525 tp_is_empty!20875)))

(declare-fun res!638966 () Bool)

(assert (=> start!81818 (=> (not res!638966) (not e!537522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81818 (= res!638966 (validMask!0 mask!1823))))

(assert (=> start!81818 e!537522))

(assert (=> start!81818 true))

(assert (=> start!81818 tp_is_empty!20875))

(declare-fun array_inv!21637 (array!57824) Bool)

(assert (=> start!81818 (array_inv!21637 _keys!1441)))

(declare-fun array_inv!21638 (array!57822) Bool)

(assert (=> start!81818 (and (array_inv!21638 _values!1197) e!537523)))

(assert (=> start!81818 tp!63693))

(declare-fun b!954111 () Bool)

(declare-fun res!638964 () Bool)

(assert (=> b!954111 (=> (not res!638964) (not e!537522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57824 (_ BitVec 32)) Bool)

(assert (=> b!954111 (= res!638964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!954112 () Bool)

(assert (=> b!954112 (= e!537522 false)))

(declare-fun lt!429654 () Bool)

(declare-fun zeroValue!1139 () V!32817)

(declare-fun minValue!1139 () V!32817)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13658 0))(
  ( (tuple2!13659 (_1!6840 (_ BitVec 64)) (_2!6840 V!32817)) )
))
(declare-datatypes ((List!19399 0))(
  ( (Nil!19396) (Cons!19395 (h!20557 tuple2!13658) (t!27751 List!19399)) )
))
(declare-datatypes ((ListLongMap!12345 0))(
  ( (ListLongMap!12346 (toList!6188 List!19399)) )
))
(declare-fun contains!5229 (ListLongMap!12345 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3350 (array!57824 array!57822 (_ BitVec 32) (_ BitVec 32) V!32817 V!32817 (_ BitVec 32) Int) ListLongMap!12345)

(assert (=> b!954112 (= lt!429654 (contains!5229 (getCurrentListMap!3350 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27792 _keys!1441) i!735)))))

(declare-fun mapNonEmpty!33274 () Bool)

(declare-fun tp!63694 () Bool)

(assert (=> mapNonEmpty!33274 (= mapRes!33274 (and tp!63694 e!537525))))

(declare-fun mapKey!33274 () (_ BitVec 32))

(declare-fun mapValue!33274 () ValueCell!9956)

(declare-fun mapRest!33274 () (Array (_ BitVec 32) ValueCell!9956))

(assert (=> mapNonEmpty!33274 (= (arr!27791 _values!1197) (store mapRest!33274 mapKey!33274 mapValue!33274))))

(declare-fun b!954113 () Bool)

(assert (=> b!954113 (= e!537524 tp_is_empty!20875)))

(declare-fun b!954114 () Bool)

(declare-fun res!638965 () Bool)

(assert (=> b!954114 (=> (not res!638965) (not e!537522))))

(declare-datatypes ((List!19400 0))(
  ( (Nil!19397) (Cons!19396 (h!20558 (_ BitVec 64)) (t!27752 List!19400)) )
))
(declare-fun arrayNoDuplicates!0 (array!57824 (_ BitVec 32) List!19400) Bool)

(assert (=> b!954114 (= res!638965 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19397))))

(declare-fun b!954115 () Bool)

(declare-fun res!638967 () Bool)

(assert (=> b!954115 (=> (not res!638967) (not e!537522))))

(assert (=> b!954115 (= res!638967 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28273 _keys!1441))))))

(assert (= (and start!81818 res!638966) b!954108))

(assert (= (and b!954108 res!638963) b!954111))

(assert (= (and b!954111 res!638964) b!954114))

(assert (= (and b!954114 res!638965) b!954115))

(assert (= (and b!954115 res!638967) b!954109))

(assert (= (and b!954109 res!638968) b!954112))

(assert (= (and b!954107 condMapEmpty!33274) mapIsEmpty!33274))

(assert (= (and b!954107 (not condMapEmpty!33274)) mapNonEmpty!33274))

(get-info :version)

(assert (= (and mapNonEmpty!33274 ((_ is ValueCellFull!9956) mapValue!33274)) b!954110))

(assert (= (and b!954107 ((_ is ValueCellFull!9956) mapDefault!33274)) b!954113))

(assert (= start!81818 b!954107))

(declare-fun m!885345 () Bool)

(assert (=> b!954109 m!885345))

(assert (=> b!954109 m!885345))

(declare-fun m!885347 () Bool)

(assert (=> b!954109 m!885347))

(declare-fun m!885349 () Bool)

(assert (=> b!954112 m!885349))

(assert (=> b!954112 m!885345))

(assert (=> b!954112 m!885349))

(assert (=> b!954112 m!885345))

(declare-fun m!885351 () Bool)

(assert (=> b!954112 m!885351))

(declare-fun m!885353 () Bool)

(assert (=> mapNonEmpty!33274 m!885353))

(declare-fun m!885355 () Bool)

(assert (=> start!81818 m!885355))

(declare-fun m!885357 () Bool)

(assert (=> start!81818 m!885357))

(declare-fun m!885359 () Bool)

(assert (=> start!81818 m!885359))

(declare-fun m!885361 () Bool)

(assert (=> b!954114 m!885361))

(declare-fun m!885363 () Bool)

(assert (=> b!954111 m!885363))

(check-sat (not b!954114) (not start!81818) tp_is_empty!20875 (not b!954111) (not mapNonEmpty!33274) (not b!954109) (not b!954112) b_and!29791 (not b_next!18331))
(check-sat b_and!29791 (not b_next!18331))
