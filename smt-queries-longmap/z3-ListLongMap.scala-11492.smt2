; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133700 () Bool)

(assert start!133700)

(declare-fun b_free!32113 () Bool)

(declare-fun b_next!32113 () Bool)

(assert (=> start!133700 (= b_free!32113 (not b_next!32113))))

(declare-fun tp!113544 () Bool)

(declare-fun b_and!51665 () Bool)

(assert (=> start!133700 (= tp!113544 b_and!51665)))

(declare-fun b!1563654 () Bool)

(declare-fun res!1069086 () Bool)

(declare-fun e!871473 () Bool)

(assert (=> b!1563654 (=> (not res!1069086) (not e!871473))))

(declare-datatypes ((V!59985 0))(
  ( (V!59986 (val!19500 Int)) )
))
(declare-datatypes ((tuple2!25240 0))(
  ( (tuple2!25241 (_1!12631 (_ BitVec 64)) (_2!12631 V!59985)) )
))
(declare-datatypes ((List!36595 0))(
  ( (Nil!36592) (Cons!36591 (h!38038 tuple2!25240) (t!51434 List!36595)) )
))
(declare-datatypes ((ListLongMap!22675 0))(
  ( (ListLongMap!22676 (toList!11353 List!36595)) )
))
(declare-fun lt!671705 () ListLongMap!22675)

(declare-fun contains!10263 (ListLongMap!22675 (_ BitVec 64)) Bool)

(assert (=> b!1563654 (= res!1069086 (not (contains!10263 lt!671705 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1563655 () Bool)

(declare-fun res!1069090 () Bool)

(declare-fun e!871472 () Bool)

(assert (=> b!1563655 (=> (not res!1069090) (not e!871472))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104282 0))(
  ( (array!104283 (arr!50334 (Array (_ BitVec 32) (_ BitVec 64))) (size!50886 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104282)

(assert (=> b!1563655 (= res!1069090 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50886 _keys!637)) (bvslt from!782 (size!50886 _keys!637))))))

(declare-fun res!1069087 () Bool)

(assert (=> start!133700 (=> (not res!1069087) (not e!871472))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133700 (= res!1069087 (validMask!0 mask!947))))

(assert (=> start!133700 e!871472))

(assert (=> start!133700 tp!113544))

(declare-fun tp_is_empty!38833 () Bool)

(assert (=> start!133700 tp_is_empty!38833))

(assert (=> start!133700 true))

(declare-fun array_inv!39313 (array!104282) Bool)

(assert (=> start!133700 (array_inv!39313 _keys!637)))

(declare-datatypes ((ValueCell!18386 0))(
  ( (ValueCellFull!18386 (v!22248 V!59985)) (EmptyCell!18386) )
))
(declare-datatypes ((array!104284 0))(
  ( (array!104285 (arr!50335 (Array (_ BitVec 32) ValueCell!18386)) (size!50887 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104284)

(declare-fun e!871471 () Bool)

(declare-fun array_inv!39314 (array!104284) Bool)

(assert (=> start!133700 (and (array_inv!39314 _values!487) e!871471)))

(declare-fun mapNonEmpty!59625 () Bool)

(declare-fun mapRes!59625 () Bool)

(declare-fun tp!113545 () Bool)

(declare-fun e!871474 () Bool)

(assert (=> mapNonEmpty!59625 (= mapRes!59625 (and tp!113545 e!871474))))

(declare-fun mapRest!59625 () (Array (_ BitVec 32) ValueCell!18386))

(declare-fun mapValue!59625 () ValueCell!18386)

(declare-fun mapKey!59625 () (_ BitVec 32))

(assert (=> mapNonEmpty!59625 (= (arr!50335 _values!487) (store mapRest!59625 mapKey!59625 mapValue!59625))))

(declare-fun b!1563656 () Bool)

(declare-fun res!1069091 () Bool)

(assert (=> b!1563656 (=> (not res!1069091) (not e!871472))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1563656 (= res!1069091 (and (= (size!50887 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50886 _keys!637) (size!50887 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563657 () Bool)

(assert (=> b!1563657 (= e!871472 e!871473)))

(declare-fun res!1069085 () Bool)

(assert (=> b!1563657 (=> (not res!1069085) (not e!871473))))

(assert (=> b!1563657 (= res!1069085 (not (contains!10263 lt!671705 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59985)

(declare-fun minValue!453 () V!59985)

(declare-fun getCurrentListMapNoExtraKeys!6722 (array!104282 array!104284 (_ BitVec 32) (_ BitVec 32) V!59985 V!59985 (_ BitVec 32) Int) ListLongMap!22675)

(assert (=> b!1563657 (= lt!671705 (getCurrentListMapNoExtraKeys!6722 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1563658 () Bool)

(declare-fun res!1069088 () Bool)

(assert (=> b!1563658 (=> (not res!1069088) (not e!871472))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104282 (_ BitVec 32)) Bool)

(assert (=> b!1563658 (= res!1069088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1563659 () Bool)

(declare-fun res!1069089 () Bool)

(assert (=> b!1563659 (=> (not res!1069089) (not e!871472))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563659 (= res!1069089 (not (validKeyInArray!0 (select (arr!50334 _keys!637) from!782))))))

(declare-fun b!1563660 () Bool)

(declare-fun res!1069092 () Bool)

(assert (=> b!1563660 (=> (not res!1069092) (not e!871472))))

(declare-datatypes ((List!36596 0))(
  ( (Nil!36593) (Cons!36592 (h!38039 (_ BitVec 64)) (t!51435 List!36596)) )
))
(declare-fun arrayNoDuplicates!0 (array!104282 (_ BitVec 32) List!36596) Bool)

(assert (=> b!1563660 (= res!1069092 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36593))))

(declare-fun b!1563661 () Bool)

(assert (=> b!1563661 (= e!871474 tp_is_empty!38833)))

(declare-fun mapIsEmpty!59625 () Bool)

(assert (=> mapIsEmpty!59625 mapRes!59625))

(declare-fun b!1563662 () Bool)

(assert (=> b!1563662 (= e!871473 (bvslt (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000))))

(declare-fun b!1563663 () Bool)

(declare-fun e!871470 () Bool)

(assert (=> b!1563663 (= e!871470 tp_is_empty!38833)))

(declare-fun b!1563664 () Bool)

(assert (=> b!1563664 (= e!871471 (and e!871470 mapRes!59625))))

(declare-fun condMapEmpty!59625 () Bool)

(declare-fun mapDefault!59625 () ValueCell!18386)

(assert (=> b!1563664 (= condMapEmpty!59625 (= (arr!50335 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18386)) mapDefault!59625)))))

(assert (= (and start!133700 res!1069087) b!1563656))

(assert (= (and b!1563656 res!1069091) b!1563658))

(assert (= (and b!1563658 res!1069088) b!1563660))

(assert (= (and b!1563660 res!1069092) b!1563655))

(assert (= (and b!1563655 res!1069090) b!1563659))

(assert (= (and b!1563659 res!1069089) b!1563657))

(assert (= (and b!1563657 res!1069085) b!1563654))

(assert (= (and b!1563654 res!1069086) b!1563662))

(assert (= (and b!1563664 condMapEmpty!59625) mapIsEmpty!59625))

(assert (= (and b!1563664 (not condMapEmpty!59625)) mapNonEmpty!59625))

(get-info :version)

(assert (= (and mapNonEmpty!59625 ((_ is ValueCellFull!18386) mapValue!59625)) b!1563661))

(assert (= (and b!1563664 ((_ is ValueCellFull!18386) mapDefault!59625)) b!1563663))

(assert (= start!133700 b!1563664))

(declare-fun m!1438455 () Bool)

(assert (=> b!1563659 m!1438455))

(assert (=> b!1563659 m!1438455))

(declare-fun m!1438457 () Bool)

(assert (=> b!1563659 m!1438457))

(declare-fun m!1438459 () Bool)

(assert (=> start!133700 m!1438459))

(declare-fun m!1438461 () Bool)

(assert (=> start!133700 m!1438461))

(declare-fun m!1438463 () Bool)

(assert (=> start!133700 m!1438463))

(declare-fun m!1438465 () Bool)

(assert (=> b!1563657 m!1438465))

(declare-fun m!1438467 () Bool)

(assert (=> b!1563657 m!1438467))

(declare-fun m!1438469 () Bool)

(assert (=> b!1563658 m!1438469))

(declare-fun m!1438471 () Bool)

(assert (=> b!1563654 m!1438471))

(declare-fun m!1438473 () Bool)

(assert (=> b!1563660 m!1438473))

(declare-fun m!1438475 () Bool)

(assert (=> mapNonEmpty!59625 m!1438475))

(check-sat (not b!1563658) (not b!1563660) (not b!1563659) tp_is_empty!38833 b_and!51665 (not b!1563657) (not mapNonEmpty!59625) (not start!133700) (not b!1563654) (not b_next!32113))
(check-sat b_and!51665 (not b_next!32113))
