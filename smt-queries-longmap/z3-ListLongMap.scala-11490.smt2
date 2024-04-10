; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133740 () Bool)

(assert start!133740)

(declare-fun b_free!32103 () Bool)

(declare-fun b_next!32103 () Bool)

(assert (=> start!133740 (= b_free!32103 (not b_next!32103))))

(declare-fun tp!113514 () Bool)

(declare-fun b_and!51673 () Bool)

(assert (=> start!133740 (= tp!113514 b_and!51673)))

(declare-fun b!1563815 () Bool)

(declare-fun e!871577 () Bool)

(declare-fun e!871581 () Bool)

(declare-fun mapRes!59610 () Bool)

(assert (=> b!1563815 (= e!871577 (and e!871581 mapRes!59610))))

(declare-fun condMapEmpty!59610 () Bool)

(declare-datatypes ((V!59971 0))(
  ( (V!59972 (val!19495 Int)) )
))
(declare-datatypes ((ValueCell!18381 0))(
  ( (ValueCellFull!18381 (v!22247 V!59971)) (EmptyCell!18381) )
))
(declare-datatypes ((array!104338 0))(
  ( (array!104339 (arr!50361 (Array (_ BitVec 32) ValueCell!18381)) (size!50911 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104338)

(declare-fun mapDefault!59610 () ValueCell!18381)

(assert (=> b!1563815 (= condMapEmpty!59610 (= (arr!50361 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18381)) mapDefault!59610)))))

(declare-fun mapIsEmpty!59610 () Bool)

(assert (=> mapIsEmpty!59610 mapRes!59610))

(declare-fun b!1563816 () Bool)

(declare-fun e!871582 () Bool)

(declare-fun tp_is_empty!38823 () Bool)

(assert (=> b!1563816 (= e!871582 tp_is_empty!38823)))

(declare-fun b!1563817 () Bool)

(declare-fun res!1069107 () Bool)

(declare-fun e!871578 () Bool)

(assert (=> b!1563817 (=> (not res!1069107) (not e!871578))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104340 0))(
  ( (array!104341 (arr!50362 (Array (_ BitVec 32) (_ BitVec 64))) (size!50912 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104340)

(assert (=> b!1563817 (= res!1069107 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50912 _keys!637)) (bvslt from!782 (size!50912 _keys!637))))))

(declare-fun b!1563818 () Bool)

(declare-fun e!871579 () Bool)

(assert (=> b!1563818 (= e!871579 false)))

(declare-fun lt!671963 () Bool)

(declare-datatypes ((tuple2!25150 0))(
  ( (tuple2!25151 (_1!12586 (_ BitVec 64)) (_2!12586 V!59971)) )
))
(declare-datatypes ((List!36536 0))(
  ( (Nil!36533) (Cons!36532 (h!37978 tuple2!25150) (t!51383 List!36536)) )
))
(declare-datatypes ((ListLongMap!22585 0))(
  ( (ListLongMap!22586 (toList!11308 List!36536)) )
))
(declare-fun lt!671964 () ListLongMap!22585)

(declare-fun contains!10298 (ListLongMap!22585 (_ BitVec 64)) Bool)

(assert (=> b!1563818 (= lt!671963 (contains!10298 lt!671964 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1563819 () Bool)

(declare-fun res!1069108 () Bool)

(assert (=> b!1563819 (=> (not res!1069108) (not e!871578))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563819 (= res!1069108 (not (validKeyInArray!0 (select (arr!50362 _keys!637) from!782))))))

(declare-fun b!1563820 () Bool)

(assert (=> b!1563820 (= e!871581 tp_is_empty!38823)))

(declare-fun b!1563821 () Bool)

(declare-fun res!1069111 () Bool)

(assert (=> b!1563821 (=> (not res!1069111) (not e!871578))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104340 (_ BitVec 32)) Bool)

(assert (=> b!1563821 (= res!1069111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapNonEmpty!59610 () Bool)

(declare-fun tp!113513 () Bool)

(assert (=> mapNonEmpty!59610 (= mapRes!59610 (and tp!113513 e!871582))))

(declare-fun mapRest!59610 () (Array (_ BitVec 32) ValueCell!18381))

(declare-fun mapKey!59610 () (_ BitVec 32))

(declare-fun mapValue!59610 () ValueCell!18381)

(assert (=> mapNonEmpty!59610 (= (arr!50361 _values!487) (store mapRest!59610 mapKey!59610 mapValue!59610))))

(declare-fun res!1069110 () Bool)

(assert (=> start!133740 (=> (not res!1069110) (not e!871578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133740 (= res!1069110 (validMask!0 mask!947))))

(assert (=> start!133740 e!871578))

(assert (=> start!133740 tp!113514))

(assert (=> start!133740 tp_is_empty!38823))

(assert (=> start!133740 true))

(declare-fun array_inv!39135 (array!104340) Bool)

(assert (=> start!133740 (array_inv!39135 _keys!637)))

(declare-fun array_inv!39136 (array!104338) Bool)

(assert (=> start!133740 (and (array_inv!39136 _values!487) e!871577)))

(declare-fun b!1563822 () Bool)

(declare-fun res!1069113 () Bool)

(assert (=> b!1563822 (=> (not res!1069113) (not e!871578))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1563822 (= res!1069113 (and (= (size!50911 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50912 _keys!637) (size!50911 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563823 () Bool)

(declare-fun res!1069112 () Bool)

(assert (=> b!1563823 (=> (not res!1069112) (not e!871578))))

(declare-datatypes ((List!36537 0))(
  ( (Nil!36534) (Cons!36533 (h!37979 (_ BitVec 64)) (t!51384 List!36537)) )
))
(declare-fun arrayNoDuplicates!0 (array!104340 (_ BitVec 32) List!36537) Bool)

(assert (=> b!1563823 (= res!1069112 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36534))))

(declare-fun b!1563824 () Bool)

(assert (=> b!1563824 (= e!871578 e!871579)))

(declare-fun res!1069109 () Bool)

(assert (=> b!1563824 (=> (not res!1069109) (not e!871579))))

(assert (=> b!1563824 (= res!1069109 (not (contains!10298 lt!671964 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59971)

(declare-fun minValue!453 () V!59971)

(declare-fun getCurrentListMapNoExtraKeys!6691 (array!104340 array!104338 (_ BitVec 32) (_ BitVec 32) V!59971 V!59971 (_ BitVec 32) Int) ListLongMap!22585)

(assert (=> b!1563824 (= lt!671964 (getCurrentListMapNoExtraKeys!6691 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(assert (= (and start!133740 res!1069110) b!1563822))

(assert (= (and b!1563822 res!1069113) b!1563821))

(assert (= (and b!1563821 res!1069111) b!1563823))

(assert (= (and b!1563823 res!1069112) b!1563817))

(assert (= (and b!1563817 res!1069107) b!1563819))

(assert (= (and b!1563819 res!1069108) b!1563824))

(assert (= (and b!1563824 res!1069109) b!1563818))

(assert (= (and b!1563815 condMapEmpty!59610) mapIsEmpty!59610))

(assert (= (and b!1563815 (not condMapEmpty!59610)) mapNonEmpty!59610))

(get-info :version)

(assert (= (and mapNonEmpty!59610 ((_ is ValueCellFull!18381) mapValue!59610)) b!1563816))

(assert (= (and b!1563815 ((_ is ValueCellFull!18381) mapDefault!59610)) b!1563820))

(assert (= start!133740 b!1563815))

(declare-fun m!1439237 () Bool)

(assert (=> b!1563823 m!1439237))

(declare-fun m!1439239 () Bool)

(assert (=> b!1563821 m!1439239))

(declare-fun m!1439241 () Bool)

(assert (=> b!1563819 m!1439241))

(assert (=> b!1563819 m!1439241))

(declare-fun m!1439243 () Bool)

(assert (=> b!1563819 m!1439243))

(declare-fun m!1439245 () Bool)

(assert (=> start!133740 m!1439245))

(declare-fun m!1439247 () Bool)

(assert (=> start!133740 m!1439247))

(declare-fun m!1439249 () Bool)

(assert (=> start!133740 m!1439249))

(declare-fun m!1439251 () Bool)

(assert (=> mapNonEmpty!59610 m!1439251))

(declare-fun m!1439253 () Bool)

(assert (=> b!1563818 m!1439253))

(declare-fun m!1439255 () Bool)

(assert (=> b!1563824 m!1439255))

(declare-fun m!1439257 () Bool)

(assert (=> b!1563824 m!1439257))

(check-sat tp_is_empty!38823 b_and!51673 (not b!1563821) (not b!1563824) (not b!1563819) (not b_next!32103) (not b!1563818) (not b!1563823) (not start!133740) (not mapNonEmpty!59610))
(check-sat b_and!51673 (not b_next!32103))
