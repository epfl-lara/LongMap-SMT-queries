; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133688 () Bool)

(assert start!133688)

(declare-fun b_free!32101 () Bool)

(declare-fun b_next!32101 () Bool)

(assert (=> start!133688 (= b_free!32101 (not b_next!32101))))

(declare-fun tp!113508 () Bool)

(declare-fun b_and!51653 () Bool)

(assert (=> start!133688 (= tp!113508 b_and!51653)))

(declare-fun b!1563472 () Bool)

(declare-fun e!871361 () Bool)

(assert (=> b!1563472 (= e!871361 false)))

(declare-fun lt!671672 () Bool)

(declare-datatypes ((V!59969 0))(
  ( (V!59970 (val!19494 Int)) )
))
(declare-datatypes ((tuple2!25228 0))(
  ( (tuple2!25229 (_1!12625 (_ BitVec 64)) (_2!12625 V!59969)) )
))
(declare-datatypes ((List!36584 0))(
  ( (Nil!36581) (Cons!36580 (h!38027 tuple2!25228) (t!51423 List!36584)) )
))
(declare-datatypes ((ListLongMap!22663 0))(
  ( (ListLongMap!22664 (toList!11347 List!36584)) )
))
(declare-fun lt!671671 () ListLongMap!22663)

(declare-fun contains!10257 (ListLongMap!22663 (_ BitVec 64)) Bool)

(assert (=> b!1563472 (= lt!671672 (contains!10257 lt!671671 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!59607 () Bool)

(declare-fun mapRes!59607 () Bool)

(assert (=> mapIsEmpty!59607 mapRes!59607))

(declare-fun b!1563473 () Bool)

(declare-fun res!1068961 () Bool)

(declare-fun e!871365 () Bool)

(assert (=> b!1563473 (=> (not res!1068961) (not e!871365))))

(declare-datatypes ((array!104258 0))(
  ( (array!104259 (arr!50322 (Array (_ BitVec 32) (_ BitVec 64))) (size!50874 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104258)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104258 (_ BitVec 32)) Bool)

(assert (=> b!1563473 (= res!1068961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1563474 () Bool)

(declare-fun e!871362 () Bool)

(declare-fun tp_is_empty!38821 () Bool)

(assert (=> b!1563474 (= e!871362 tp_is_empty!38821)))

(declare-fun b!1563475 () Bool)

(declare-fun res!1068962 () Bool)

(assert (=> b!1563475 (=> (not res!1068962) (not e!871365))))

(declare-datatypes ((List!36585 0))(
  ( (Nil!36582) (Cons!36581 (h!38028 (_ BitVec 64)) (t!51424 List!36585)) )
))
(declare-fun arrayNoDuplicates!0 (array!104258 (_ BitVec 32) List!36585) Bool)

(assert (=> b!1563475 (= res!1068962 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36582))))

(declare-fun b!1563476 () Bool)

(declare-fun res!1068957 () Bool)

(assert (=> b!1563476 (=> (not res!1068957) (not e!871365))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1563476 (= res!1068957 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50874 _keys!637)) (bvslt from!782 (size!50874 _keys!637))))))

(declare-fun res!1068963 () Bool)

(assert (=> start!133688 (=> (not res!1068963) (not e!871365))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133688 (= res!1068963 (validMask!0 mask!947))))

(assert (=> start!133688 e!871365))

(assert (=> start!133688 tp!113508))

(assert (=> start!133688 tp_is_empty!38821))

(assert (=> start!133688 true))

(declare-fun array_inv!39301 (array!104258) Bool)

(assert (=> start!133688 (array_inv!39301 _keys!637)))

(declare-datatypes ((ValueCell!18380 0))(
  ( (ValueCellFull!18380 (v!22242 V!59969)) (EmptyCell!18380) )
))
(declare-datatypes ((array!104260 0))(
  ( (array!104261 (arr!50323 (Array (_ BitVec 32) ValueCell!18380)) (size!50875 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104260)

(declare-fun e!871366 () Bool)

(declare-fun array_inv!39302 (array!104260) Bool)

(assert (=> start!133688 (and (array_inv!39302 _values!487) e!871366)))

(declare-fun b!1563477 () Bool)

(assert (=> b!1563477 (= e!871365 e!871361)))

(declare-fun res!1068958 () Bool)

(assert (=> b!1563477 (=> (not res!1068958) (not e!871361))))

(assert (=> b!1563477 (= res!1068958 (not (contains!10257 lt!671671 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59969)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59969)

(declare-fun getCurrentListMapNoExtraKeys!6717 (array!104258 array!104260 (_ BitVec 32) (_ BitVec 32) V!59969 V!59969 (_ BitVec 32) Int) ListLongMap!22663)

(assert (=> b!1563477 (= lt!671671 (getCurrentListMapNoExtraKeys!6717 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1563478 () Bool)

(declare-fun res!1068959 () Bool)

(assert (=> b!1563478 (=> (not res!1068959) (not e!871365))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563478 (= res!1068959 (not (validKeyInArray!0 (select (arr!50322 _keys!637) from!782))))))

(declare-fun mapNonEmpty!59607 () Bool)

(declare-fun tp!113509 () Bool)

(declare-fun e!871364 () Bool)

(assert (=> mapNonEmpty!59607 (= mapRes!59607 (and tp!113509 e!871364))))

(declare-fun mapValue!59607 () ValueCell!18380)

(declare-fun mapRest!59607 () (Array (_ BitVec 32) ValueCell!18380))

(declare-fun mapKey!59607 () (_ BitVec 32))

(assert (=> mapNonEmpty!59607 (= (arr!50323 _values!487) (store mapRest!59607 mapKey!59607 mapValue!59607))))

(declare-fun b!1563479 () Bool)

(assert (=> b!1563479 (= e!871364 tp_is_empty!38821)))

(declare-fun b!1563480 () Bool)

(assert (=> b!1563480 (= e!871366 (and e!871362 mapRes!59607))))

(declare-fun condMapEmpty!59607 () Bool)

(declare-fun mapDefault!59607 () ValueCell!18380)

(assert (=> b!1563480 (= condMapEmpty!59607 (= (arr!50323 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18380)) mapDefault!59607)))))

(declare-fun b!1563481 () Bool)

(declare-fun res!1068960 () Bool)

(assert (=> b!1563481 (=> (not res!1068960) (not e!871365))))

(assert (=> b!1563481 (= res!1068960 (and (= (size!50875 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50874 _keys!637) (size!50875 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(assert (= (and start!133688 res!1068963) b!1563481))

(assert (= (and b!1563481 res!1068960) b!1563473))

(assert (= (and b!1563473 res!1068961) b!1563475))

(assert (= (and b!1563475 res!1068962) b!1563476))

(assert (= (and b!1563476 res!1068957) b!1563478))

(assert (= (and b!1563478 res!1068959) b!1563477))

(assert (= (and b!1563477 res!1068958) b!1563472))

(assert (= (and b!1563480 condMapEmpty!59607) mapIsEmpty!59607))

(assert (= (and b!1563480 (not condMapEmpty!59607)) mapNonEmpty!59607))

(get-info :version)

(assert (= (and mapNonEmpty!59607 ((_ is ValueCellFull!18380) mapValue!59607)) b!1563479))

(assert (= (and b!1563480 ((_ is ValueCellFull!18380) mapDefault!59607)) b!1563474))

(assert (= start!133688 b!1563480))

(declare-fun m!1438323 () Bool)

(assert (=> b!1563472 m!1438323))

(declare-fun m!1438325 () Bool)

(assert (=> b!1563477 m!1438325))

(declare-fun m!1438327 () Bool)

(assert (=> b!1563477 m!1438327))

(declare-fun m!1438329 () Bool)

(assert (=> start!133688 m!1438329))

(declare-fun m!1438331 () Bool)

(assert (=> start!133688 m!1438331))

(declare-fun m!1438333 () Bool)

(assert (=> start!133688 m!1438333))

(declare-fun m!1438335 () Bool)

(assert (=> b!1563475 m!1438335))

(declare-fun m!1438337 () Bool)

(assert (=> b!1563473 m!1438337))

(declare-fun m!1438339 () Bool)

(assert (=> b!1563478 m!1438339))

(assert (=> b!1563478 m!1438339))

(declare-fun m!1438341 () Bool)

(assert (=> b!1563478 m!1438341))

(declare-fun m!1438343 () Bool)

(assert (=> mapNonEmpty!59607 m!1438343))

(check-sat b_and!51653 (not b!1563473) (not start!133688) (not b!1563475) (not mapNonEmpty!59607) tp_is_empty!38821 (not b_next!32101) (not b!1563478) (not b!1563472) (not b!1563477))
(check-sat b_and!51653 (not b_next!32101))
