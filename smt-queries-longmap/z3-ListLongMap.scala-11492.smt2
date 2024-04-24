; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134162 () Bool)

(assert start!134162)

(declare-fun b_free!32113 () Bool)

(declare-fun b_next!32113 () Bool)

(assert (=> start!134162 (= b_free!32113 (not b_next!32113))))

(declare-fun tp!113544 () Bool)

(declare-fun b_and!51685 () Bool)

(assert (=> start!134162 (= tp!113544 b_and!51685)))

(declare-fun b!1566403 () Bool)

(declare-fun e!873177 () Bool)

(declare-fun tp_is_empty!38833 () Bool)

(assert (=> b!1566403 (= e!873177 tp_is_empty!38833)))

(declare-fun b!1566404 () Bool)

(declare-fun res!1070080 () Bool)

(declare-fun e!873178 () Bool)

(assert (=> b!1566404 (=> (not res!1070080) (not e!873178))))

(declare-datatypes ((V!59985 0))(
  ( (V!59986 (val!19500 Int)) )
))
(declare-datatypes ((tuple2!25220 0))(
  ( (tuple2!25221 (_1!12621 (_ BitVec 64)) (_2!12621 V!59985)) )
))
(declare-datatypes ((List!36582 0))(
  ( (Nil!36579) (Cons!36578 (h!38042 tuple2!25220) (t!51421 List!36582)) )
))
(declare-datatypes ((ListLongMap!22663 0))(
  ( (ListLongMap!22664 (toList!11347 List!36582)) )
))
(declare-fun lt!672899 () ListLongMap!22663)

(declare-fun contains!10348 (ListLongMap!22663 (_ BitVec 64)) Bool)

(assert (=> b!1566404 (= res!1070080 (not (contains!10348 lt!672899 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566405 () Bool)

(declare-fun e!873181 () Bool)

(declare-fun e!873179 () Bool)

(declare-fun mapRes!59625 () Bool)

(assert (=> b!1566405 (= e!873181 (and e!873179 mapRes!59625))))

(declare-fun condMapEmpty!59625 () Bool)

(declare-datatypes ((ValueCell!18386 0))(
  ( (ValueCellFull!18386 (v!22244 V!59985)) (EmptyCell!18386) )
))
(declare-datatypes ((array!104482 0))(
  ( (array!104483 (arr!50426 (Array (_ BitVec 32) ValueCell!18386)) (size!50977 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104482)

(declare-fun mapDefault!59625 () ValueCell!18386)

(assert (=> b!1566405 (= condMapEmpty!59625 (= (arr!50426 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18386)) mapDefault!59625)))))

(declare-fun b!1566406 () Bool)

(declare-fun res!1070077 () Bool)

(declare-fun e!873176 () Bool)

(assert (=> b!1566406 (=> (not res!1070077) (not e!873176))))

(declare-datatypes ((array!104484 0))(
  ( (array!104485 (arr!50427 (Array (_ BitVec 32) (_ BitVec 64))) (size!50978 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104484)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104484 (_ BitVec 32)) Bool)

(assert (=> b!1566406 (= res!1070077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1566407 () Bool)

(assert (=> b!1566407 (= e!873176 e!873178)))

(declare-fun res!1070075 () Bool)

(assert (=> b!1566407 (=> (not res!1070075) (not e!873178))))

(assert (=> b!1566407 (= res!1070075 (not (contains!10348 lt!672899 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59985)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun zeroValue!453 () V!59985)

(declare-fun getCurrentListMapNoExtraKeys!6743 (array!104484 array!104482 (_ BitVec 32) (_ BitVec 32) V!59985 V!59985 (_ BitVec 32) Int) ListLongMap!22663)

(assert (=> b!1566407 (= lt!672899 (getCurrentListMapNoExtraKeys!6743 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun res!1070079 () Bool)

(assert (=> start!134162 (=> (not res!1070079) (not e!873176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134162 (= res!1070079 (validMask!0 mask!947))))

(assert (=> start!134162 e!873176))

(assert (=> start!134162 tp!113544))

(assert (=> start!134162 tp_is_empty!38833))

(assert (=> start!134162 true))

(declare-fun array_inv!39431 (array!104484) Bool)

(assert (=> start!134162 (array_inv!39431 _keys!637)))

(declare-fun array_inv!39432 (array!104482) Bool)

(assert (=> start!134162 (and (array_inv!39432 _values!487) e!873181)))

(declare-fun b!1566408 () Bool)

(declare-fun res!1070081 () Bool)

(assert (=> b!1566408 (=> (not res!1070081) (not e!873176))))

(declare-datatypes ((List!36583 0))(
  ( (Nil!36580) (Cons!36579 (h!38043 (_ BitVec 64)) (t!51422 List!36583)) )
))
(declare-fun arrayNoDuplicates!0 (array!104484 (_ BitVec 32) List!36583) Bool)

(assert (=> b!1566408 (= res!1070081 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36580))))

(declare-fun b!1566409 () Bool)

(declare-fun res!1070078 () Bool)

(assert (=> b!1566409 (=> (not res!1070078) (not e!873176))))

(assert (=> b!1566409 (= res!1070078 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50978 _keys!637)) (bvslt from!782 (size!50978 _keys!637))))))

(declare-fun mapIsEmpty!59625 () Bool)

(assert (=> mapIsEmpty!59625 mapRes!59625))

(declare-fun b!1566410 () Bool)

(assert (=> b!1566410 (= e!873179 tp_is_empty!38833)))

(declare-fun b!1566411 () Bool)

(declare-fun res!1070074 () Bool)

(assert (=> b!1566411 (=> (not res!1070074) (not e!873176))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1566411 (= res!1070074 (not (validKeyInArray!0 (select (arr!50427 _keys!637) from!782))))))

(declare-fun b!1566412 () Bool)

(assert (=> b!1566412 (= e!873178 (bvslt (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000))))

(declare-fun b!1566413 () Bool)

(declare-fun res!1070076 () Bool)

(assert (=> b!1566413 (=> (not res!1070076) (not e!873176))))

(assert (=> b!1566413 (= res!1070076 (and (= (size!50977 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50978 _keys!637) (size!50977 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!59625 () Bool)

(declare-fun tp!113543 () Bool)

(assert (=> mapNonEmpty!59625 (= mapRes!59625 (and tp!113543 e!873177))))

(declare-fun mapKey!59625 () (_ BitVec 32))

(declare-fun mapValue!59625 () ValueCell!18386)

(declare-fun mapRest!59625 () (Array (_ BitVec 32) ValueCell!18386))

(assert (=> mapNonEmpty!59625 (= (arr!50426 _values!487) (store mapRest!59625 mapKey!59625 mapValue!59625))))

(assert (= (and start!134162 res!1070079) b!1566413))

(assert (= (and b!1566413 res!1070076) b!1566406))

(assert (= (and b!1566406 res!1070077) b!1566408))

(assert (= (and b!1566408 res!1070081) b!1566409))

(assert (= (and b!1566409 res!1070078) b!1566411))

(assert (= (and b!1566411 res!1070074) b!1566407))

(assert (= (and b!1566407 res!1070075) b!1566404))

(assert (= (and b!1566404 res!1070080) b!1566412))

(assert (= (and b!1566405 condMapEmpty!59625) mapIsEmpty!59625))

(assert (= (and b!1566405 (not condMapEmpty!59625)) mapNonEmpty!59625))

(get-info :version)

(assert (= (and mapNonEmpty!59625 ((_ is ValueCellFull!18386) mapValue!59625)) b!1566403))

(assert (= (and b!1566405 ((_ is ValueCellFull!18386) mapDefault!59625)) b!1566410))

(assert (= start!134162 b!1566405))

(declare-fun m!1441605 () Bool)

(assert (=> b!1566407 m!1441605))

(declare-fun m!1441607 () Bool)

(assert (=> b!1566407 m!1441607))

(declare-fun m!1441609 () Bool)

(assert (=> b!1566406 m!1441609))

(declare-fun m!1441611 () Bool)

(assert (=> start!134162 m!1441611))

(declare-fun m!1441613 () Bool)

(assert (=> start!134162 m!1441613))

(declare-fun m!1441615 () Bool)

(assert (=> start!134162 m!1441615))

(declare-fun m!1441617 () Bool)

(assert (=> b!1566411 m!1441617))

(assert (=> b!1566411 m!1441617))

(declare-fun m!1441619 () Bool)

(assert (=> b!1566411 m!1441619))

(declare-fun m!1441621 () Bool)

(assert (=> b!1566404 m!1441621))

(declare-fun m!1441623 () Bool)

(assert (=> mapNonEmpty!59625 m!1441623))

(declare-fun m!1441625 () Bool)

(assert (=> b!1566408 m!1441625))

(check-sat tp_is_empty!38833 b_and!51685 (not b_next!32113) (not b!1566407) (not b!1566411) (not start!134162) (not b!1566406) (not mapNonEmpty!59625) (not b!1566404) (not b!1566408))
(check-sat b_and!51685 (not b_next!32113))
