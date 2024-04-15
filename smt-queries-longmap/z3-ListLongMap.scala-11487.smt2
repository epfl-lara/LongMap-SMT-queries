; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133670 () Bool)

(assert start!133670)

(declare-fun b_free!32083 () Bool)

(declare-fun b_next!32083 () Bool)

(assert (=> start!133670 (= b_free!32083 (not b_next!32083))))

(declare-fun tp!113454 () Bool)

(declare-fun b_and!51635 () Bool)

(assert (=> start!133670 (= tp!113454 b_and!51635)))

(declare-fun b!1563202 () Bool)

(declare-fun e!871204 () Bool)

(declare-fun e!871199 () Bool)

(assert (=> b!1563202 (= e!871204 e!871199)))

(declare-fun res!1068773 () Bool)

(assert (=> b!1563202 (=> (not res!1068773) (not e!871199))))

(declare-datatypes ((V!59945 0))(
  ( (V!59946 (val!19485 Int)) )
))
(declare-datatypes ((tuple2!25212 0))(
  ( (tuple2!25213 (_1!12617 (_ BitVec 64)) (_2!12617 V!59945)) )
))
(declare-datatypes ((List!36570 0))(
  ( (Nil!36567) (Cons!36566 (h!38013 tuple2!25212) (t!51409 List!36570)) )
))
(declare-datatypes ((ListLongMap!22647 0))(
  ( (ListLongMap!22648 (toList!11339 List!36570)) )
))
(declare-fun lt!671618 () ListLongMap!22647)

(declare-fun contains!10249 (ListLongMap!22647 (_ BitVec 64)) Bool)

(assert (=> b!1563202 (= res!1068773 (not (contains!10249 lt!671618 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59945)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59945)

(declare-datatypes ((array!104222 0))(
  ( (array!104223 (arr!50304 (Array (_ BitVec 32) (_ BitVec 64))) (size!50856 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104222)

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18371 0))(
  ( (ValueCellFull!18371 (v!22233 V!59945)) (EmptyCell!18371) )
))
(declare-datatypes ((array!104224 0))(
  ( (array!104225 (arr!50305 (Array (_ BitVec 32) ValueCell!18371)) (size!50857 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104224)

(declare-fun getCurrentListMapNoExtraKeys!6712 (array!104222 array!104224 (_ BitVec 32) (_ BitVec 32) V!59945 V!59945 (_ BitVec 32) Int) ListLongMap!22647)

(assert (=> b!1563202 (= lt!671618 (getCurrentListMapNoExtraKeys!6712 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun res!1068772 () Bool)

(assert (=> start!133670 (=> (not res!1068772) (not e!871204))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133670 (= res!1068772 (validMask!0 mask!947))))

(assert (=> start!133670 e!871204))

(assert (=> start!133670 tp!113454))

(declare-fun tp_is_empty!38803 () Bool)

(assert (=> start!133670 tp_is_empty!38803))

(assert (=> start!133670 true))

(declare-fun array_inv!39283 (array!104222) Bool)

(assert (=> start!133670 (array_inv!39283 _keys!637)))

(declare-fun e!871202 () Bool)

(declare-fun array_inv!39284 (array!104224) Bool)

(assert (=> start!133670 (and (array_inv!39284 _values!487) e!871202)))

(declare-fun b!1563203 () Bool)

(declare-fun e!871203 () Bool)

(declare-fun mapRes!59580 () Bool)

(assert (=> b!1563203 (= e!871202 (and e!871203 mapRes!59580))))

(declare-fun condMapEmpty!59580 () Bool)

(declare-fun mapDefault!59580 () ValueCell!18371)

(assert (=> b!1563203 (= condMapEmpty!59580 (= (arr!50305 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18371)) mapDefault!59580)))))

(declare-fun mapNonEmpty!59580 () Bool)

(declare-fun tp!113455 () Bool)

(declare-fun e!871200 () Bool)

(assert (=> mapNonEmpty!59580 (= mapRes!59580 (and tp!113455 e!871200))))

(declare-fun mapKey!59580 () (_ BitVec 32))

(declare-fun mapRest!59580 () (Array (_ BitVec 32) ValueCell!18371))

(declare-fun mapValue!59580 () ValueCell!18371)

(assert (=> mapNonEmpty!59580 (= (arr!50305 _values!487) (store mapRest!59580 mapKey!59580 mapValue!59580))))

(declare-fun b!1563204 () Bool)

(declare-fun res!1068770 () Bool)

(assert (=> b!1563204 (=> (not res!1068770) (not e!871204))))

(assert (=> b!1563204 (= res!1068770 (and (= (size!50857 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50856 _keys!637) (size!50857 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563205 () Bool)

(declare-fun res!1068771 () Bool)

(assert (=> b!1563205 (=> (not res!1068771) (not e!871204))))

(declare-datatypes ((List!36571 0))(
  ( (Nil!36568) (Cons!36567 (h!38014 (_ BitVec 64)) (t!51410 List!36571)) )
))
(declare-fun arrayNoDuplicates!0 (array!104222 (_ BitVec 32) List!36571) Bool)

(assert (=> b!1563205 (= res!1068771 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36568))))

(declare-fun mapIsEmpty!59580 () Bool)

(assert (=> mapIsEmpty!59580 mapRes!59580))

(declare-fun b!1563206 () Bool)

(declare-fun res!1068768 () Bool)

(assert (=> b!1563206 (=> (not res!1068768) (not e!871204))))

(assert (=> b!1563206 (= res!1068768 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50856 _keys!637)) (bvslt from!782 (size!50856 _keys!637))))))

(declare-fun b!1563207 () Bool)

(declare-fun res!1068774 () Bool)

(assert (=> b!1563207 (=> (not res!1068774) (not e!871204))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563207 (= res!1068774 (not (validKeyInArray!0 (select (arr!50304 _keys!637) from!782))))))

(declare-fun b!1563208 () Bool)

(declare-fun res!1068769 () Bool)

(assert (=> b!1563208 (=> (not res!1068769) (not e!871204))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104222 (_ BitVec 32)) Bool)

(assert (=> b!1563208 (= res!1068769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1563209 () Bool)

(assert (=> b!1563209 (= e!871203 tp_is_empty!38803)))

(declare-fun b!1563210 () Bool)

(assert (=> b!1563210 (= e!871199 false)))

(declare-fun lt!671617 () Bool)

(assert (=> b!1563210 (= lt!671617 (contains!10249 lt!671618 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1563211 () Bool)

(assert (=> b!1563211 (= e!871200 tp_is_empty!38803)))

(assert (= (and start!133670 res!1068772) b!1563204))

(assert (= (and b!1563204 res!1068770) b!1563208))

(assert (= (and b!1563208 res!1068769) b!1563205))

(assert (= (and b!1563205 res!1068771) b!1563206))

(assert (= (and b!1563206 res!1068768) b!1563207))

(assert (= (and b!1563207 res!1068774) b!1563202))

(assert (= (and b!1563202 res!1068773) b!1563210))

(assert (= (and b!1563203 condMapEmpty!59580) mapIsEmpty!59580))

(assert (= (and b!1563203 (not condMapEmpty!59580)) mapNonEmpty!59580))

(get-info :version)

(assert (= (and mapNonEmpty!59580 ((_ is ValueCellFull!18371) mapValue!59580)) b!1563211))

(assert (= (and b!1563203 ((_ is ValueCellFull!18371) mapDefault!59580)) b!1563209))

(assert (= start!133670 b!1563203))

(declare-fun m!1438125 () Bool)

(assert (=> b!1563202 m!1438125))

(declare-fun m!1438127 () Bool)

(assert (=> b!1563202 m!1438127))

(declare-fun m!1438129 () Bool)

(assert (=> start!133670 m!1438129))

(declare-fun m!1438131 () Bool)

(assert (=> start!133670 m!1438131))

(declare-fun m!1438133 () Bool)

(assert (=> start!133670 m!1438133))

(declare-fun m!1438135 () Bool)

(assert (=> b!1563210 m!1438135))

(declare-fun m!1438137 () Bool)

(assert (=> b!1563205 m!1438137))

(declare-fun m!1438139 () Bool)

(assert (=> mapNonEmpty!59580 m!1438139))

(declare-fun m!1438141 () Bool)

(assert (=> b!1563208 m!1438141))

(declare-fun m!1438143 () Bool)

(assert (=> b!1563207 m!1438143))

(assert (=> b!1563207 m!1438143))

(declare-fun m!1438145 () Bool)

(assert (=> b!1563207 m!1438145))

(check-sat (not mapNonEmpty!59580) (not b!1563207) (not b!1563205) (not b_next!32083) (not b!1563208) (not start!133670) b_and!51635 tp_is_empty!38803 (not b!1563210) (not b!1563202))
(check-sat b_and!51635 (not b_next!32083))
