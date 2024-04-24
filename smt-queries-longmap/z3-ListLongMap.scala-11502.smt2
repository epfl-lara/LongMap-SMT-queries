; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134270 () Bool)

(assert start!134270)

(declare-fun b_free!32119 () Bool)

(declare-fun b_next!32119 () Bool)

(assert (=> start!134270 (= b_free!32119 (not b_next!32119))))

(declare-fun tp!113653 () Bool)

(declare-fun b_and!51691 () Bool)

(assert (=> start!134270 (= tp!113653 b_and!51691)))

(declare-fun res!1070666 () Bool)

(declare-fun e!873768 () Bool)

(assert (=> start!134270 (=> (not res!1070666) (not e!873768))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134270 (= res!1070666 (validMask!0 mask!947))))

(assert (=> start!134270 e!873768))

(assert (=> start!134270 tp!113653))

(declare-fun tp_is_empty!38893 () Bool)

(assert (=> start!134270 tp_is_empty!38893))

(assert (=> start!134270 true))

(declare-datatypes ((array!104598 0))(
  ( (array!104599 (arr!50481 (Array (_ BitVec 32) (_ BitVec 64))) (size!51032 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104598)

(declare-fun array_inv!39473 (array!104598) Bool)

(assert (=> start!134270 (array_inv!39473 _keys!637)))

(declare-datatypes ((V!60065 0))(
  ( (V!60066 (val!19530 Int)) )
))
(declare-datatypes ((ValueCell!18416 0))(
  ( (ValueCellFull!18416 (v!22276 V!60065)) (EmptyCell!18416) )
))
(declare-datatypes ((array!104600 0))(
  ( (array!104601 (arr!50482 (Array (_ BitVec 32) ValueCell!18416)) (size!51033 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104600)

(declare-fun e!873766 () Bool)

(declare-fun array_inv!39474 (array!104600) Bool)

(assert (=> start!134270 (and (array_inv!39474 _values!487) e!873766)))

(declare-fun mapNonEmpty!59725 () Bool)

(declare-fun mapRes!59725 () Bool)

(declare-fun tp!113652 () Bool)

(declare-fun e!873769 () Bool)

(assert (=> mapNonEmpty!59725 (= mapRes!59725 (and tp!113652 e!873769))))

(declare-fun mapKey!59725 () (_ BitVec 32))

(declare-fun mapRest!59725 () (Array (_ BitVec 32) ValueCell!18416))

(declare-fun mapValue!59725 () ValueCell!18416)

(assert (=> mapNonEmpty!59725 (= (arr!50482 _values!487) (store mapRest!59725 mapKey!59725 mapValue!59725))))

(declare-fun b!1567353 () Bool)

(declare-fun res!1070664 () Bool)

(assert (=> b!1567353 (=> (not res!1070664) (not e!873768))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104598 (_ BitVec 32)) Bool)

(assert (=> b!1567353 (= res!1070664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1567354 () Bool)

(declare-fun res!1070663 () Bool)

(assert (=> b!1567354 (=> (not res!1070663) (not e!873768))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1567354 (= res!1070663 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51032 _keys!637)) (bvslt from!782 (size!51032 _keys!637))))))

(declare-fun b!1567355 () Bool)

(declare-fun res!1070667 () Bool)

(assert (=> b!1567355 (=> (not res!1070667) (not e!873768))))

(declare-datatypes ((List!36616 0))(
  ( (Nil!36613) (Cons!36612 (h!38076 (_ BitVec 64)) (t!51455 List!36616)) )
))
(declare-fun arrayNoDuplicates!0 (array!104598 (_ BitVec 32) List!36616) Bool)

(assert (=> b!1567355 (= res!1070667 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36613))))

(declare-fun mapIsEmpty!59725 () Bool)

(assert (=> mapIsEmpty!59725 mapRes!59725))

(declare-fun b!1567356 () Bool)

(assert (=> b!1567356 (= e!873768 false)))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60065)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60065)

(declare-datatypes ((tuple2!25252 0))(
  ( (tuple2!25253 (_1!12637 (_ BitVec 64)) (_2!12637 V!60065)) )
))
(declare-datatypes ((List!36617 0))(
  ( (Nil!36614) (Cons!36613 (h!38077 tuple2!25252) (t!51456 List!36617)) )
))
(declare-datatypes ((ListLongMap!22695 0))(
  ( (ListLongMap!22696 (toList!11363 List!36617)) )
))
(declare-fun lt!673027 () ListLongMap!22695)

(declare-fun getCurrentListMapNoExtraKeys!6746 (array!104598 array!104600 (_ BitVec 32) (_ BitVec 32) V!60065 V!60065 (_ BitVec 32) Int) ListLongMap!22695)

(assert (=> b!1567356 (= lt!673027 (getCurrentListMapNoExtraKeys!6746 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1567357 () Bool)

(declare-fun e!873767 () Bool)

(assert (=> b!1567357 (= e!873766 (and e!873767 mapRes!59725))))

(declare-fun condMapEmpty!59725 () Bool)

(declare-fun mapDefault!59725 () ValueCell!18416)

(assert (=> b!1567357 (= condMapEmpty!59725 (= (arr!50482 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18416)) mapDefault!59725)))))

(declare-fun b!1567358 () Bool)

(declare-fun res!1070665 () Bool)

(assert (=> b!1567358 (=> (not res!1070665) (not e!873768))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567358 (= res!1070665 (validKeyInArray!0 (select (arr!50481 _keys!637) from!782)))))

(declare-fun b!1567359 () Bool)

(declare-fun res!1070662 () Bool)

(assert (=> b!1567359 (=> (not res!1070662) (not e!873768))))

(assert (=> b!1567359 (= res!1070662 (and (= (size!51033 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51032 _keys!637) (size!51033 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1567360 () Bool)

(assert (=> b!1567360 (= e!873769 tp_is_empty!38893)))

(declare-fun b!1567361 () Bool)

(assert (=> b!1567361 (= e!873767 tp_is_empty!38893)))

(assert (= (and start!134270 res!1070666) b!1567359))

(assert (= (and b!1567359 res!1070662) b!1567353))

(assert (= (and b!1567353 res!1070664) b!1567355))

(assert (= (and b!1567355 res!1070667) b!1567354))

(assert (= (and b!1567354 res!1070663) b!1567358))

(assert (= (and b!1567358 res!1070665) b!1567356))

(assert (= (and b!1567357 condMapEmpty!59725) mapIsEmpty!59725))

(assert (= (and b!1567357 (not condMapEmpty!59725)) mapNonEmpty!59725))

(get-info :version)

(assert (= (and mapNonEmpty!59725 ((_ is ValueCellFull!18416) mapValue!59725)) b!1567360))

(assert (= (and b!1567357 ((_ is ValueCellFull!18416) mapDefault!59725)) b!1567361))

(assert (= start!134270 b!1567357))

(declare-fun m!1442205 () Bool)

(assert (=> b!1567356 m!1442205))

(declare-fun m!1442207 () Bool)

(assert (=> b!1567355 m!1442207))

(declare-fun m!1442209 () Bool)

(assert (=> start!134270 m!1442209))

(declare-fun m!1442211 () Bool)

(assert (=> start!134270 m!1442211))

(declare-fun m!1442213 () Bool)

(assert (=> start!134270 m!1442213))

(declare-fun m!1442215 () Bool)

(assert (=> b!1567353 m!1442215))

(declare-fun m!1442217 () Bool)

(assert (=> b!1567358 m!1442217))

(assert (=> b!1567358 m!1442217))

(declare-fun m!1442219 () Bool)

(assert (=> b!1567358 m!1442219))

(declare-fun m!1442221 () Bool)

(assert (=> mapNonEmpty!59725 m!1442221))

(check-sat b_and!51691 (not b!1567358) (not b!1567355) tp_is_empty!38893 (not start!134270) (not b_next!32119) (not b!1567356) (not mapNonEmpty!59725) (not b!1567353))
(check-sat b_and!51691 (not b_next!32119))
