; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134144 () Bool)

(assert start!134144)

(declare-fun b_free!32095 () Bool)

(declare-fun b_next!32095 () Bool)

(assert (=> start!134144 (= b_free!32095 (not b_next!32095))))

(declare-fun tp!113490 () Bool)

(declare-fun b_and!51667 () Bool)

(assert (=> start!134144 (= tp!113490 b_and!51667)))

(declare-fun mapIsEmpty!59598 () Bool)

(declare-fun mapRes!59598 () Bool)

(assert (=> mapIsEmpty!59598 mapRes!59598))

(declare-fun mapNonEmpty!59598 () Bool)

(declare-fun tp!113489 () Bool)

(declare-fun e!873017 () Bool)

(assert (=> mapNonEmpty!59598 (= mapRes!59598 (and tp!113489 e!873017))))

(declare-datatypes ((V!59961 0))(
  ( (V!59962 (val!19491 Int)) )
))
(declare-datatypes ((ValueCell!18377 0))(
  ( (ValueCellFull!18377 (v!22235 V!59961)) (EmptyCell!18377) )
))
(declare-fun mapValue!59598 () ValueCell!18377)

(declare-fun mapRest!59598 () (Array (_ BitVec 32) ValueCell!18377))

(declare-datatypes ((array!104448 0))(
  ( (array!104449 (arr!50409 (Array (_ BitVec 32) ValueCell!18377)) (size!50960 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104448)

(declare-fun mapKey!59598 () (_ BitVec 32))

(assert (=> mapNonEmpty!59598 (= (arr!50409 _values!487) (store mapRest!59598 mapKey!59598 mapValue!59598))))

(declare-fun b!1566131 () Bool)

(declare-fun res!1069889 () Bool)

(declare-fun e!873019 () Bool)

(assert (=> b!1566131 (=> (not res!1069889) (not e!873019))))

(declare-datatypes ((array!104450 0))(
  ( (array!104451 (arr!50410 (Array (_ BitVec 32) (_ BitVec 64))) (size!50961 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104450)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1566131 (= res!1069889 (not (validKeyInArray!0 (select (arr!50410 _keys!637) from!782))))))

(declare-fun res!1069887 () Bool)

(assert (=> start!134144 (=> (not res!1069887) (not e!873019))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134144 (= res!1069887 (validMask!0 mask!947))))

(assert (=> start!134144 e!873019))

(assert (=> start!134144 tp!113490))

(declare-fun tp_is_empty!38815 () Bool)

(assert (=> start!134144 tp_is_empty!38815))

(assert (=> start!134144 true))

(declare-fun array_inv!39417 (array!104450) Bool)

(assert (=> start!134144 (array_inv!39417 _keys!637)))

(declare-fun e!873014 () Bool)

(declare-fun array_inv!39418 (array!104448) Bool)

(assert (=> start!134144 (and (array_inv!39418 _values!487) e!873014)))

(declare-fun b!1566132 () Bool)

(declare-fun res!1069886 () Bool)

(assert (=> b!1566132 (=> (not res!1069886) (not e!873019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104450 (_ BitVec 32)) Bool)

(assert (=> b!1566132 (= res!1069886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1566133 () Bool)

(declare-fun res!1069883 () Bool)

(assert (=> b!1566133 (=> (not res!1069883) (not e!873019))))

(declare-datatypes ((List!36568 0))(
  ( (Nil!36565) (Cons!36564 (h!38028 (_ BitVec 64)) (t!51407 List!36568)) )
))
(declare-fun arrayNoDuplicates!0 (array!104450 (_ BitVec 32) List!36568) Bool)

(assert (=> b!1566133 (= res!1069883 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36565))))

(declare-fun b!1566134 () Bool)

(declare-fun e!873015 () Bool)

(assert (=> b!1566134 (= e!873015 false)))

(declare-fun lt!672847 () Bool)

(declare-datatypes ((tuple2!25204 0))(
  ( (tuple2!25205 (_1!12613 (_ BitVec 64)) (_2!12613 V!59961)) )
))
(declare-datatypes ((List!36569 0))(
  ( (Nil!36566) (Cons!36565 (h!38029 tuple2!25204) (t!51408 List!36569)) )
))
(declare-datatypes ((ListLongMap!22647 0))(
  ( (ListLongMap!22648 (toList!11339 List!36569)) )
))
(declare-fun lt!672848 () ListLongMap!22647)

(declare-fun contains!10340 (ListLongMap!22647 (_ BitVec 64)) Bool)

(assert (=> b!1566134 (= lt!672847 (contains!10340 lt!672848 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566135 () Bool)

(declare-fun e!873016 () Bool)

(assert (=> b!1566135 (= e!873014 (and e!873016 mapRes!59598))))

(declare-fun condMapEmpty!59598 () Bool)

(declare-fun mapDefault!59598 () ValueCell!18377)

(assert (=> b!1566135 (= condMapEmpty!59598 (= (arr!50409 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18377)) mapDefault!59598)))))

(declare-fun b!1566136 () Bool)

(assert (=> b!1566136 (= e!873016 tp_is_empty!38815)))

(declare-fun b!1566137 () Bool)

(declare-fun res!1069884 () Bool)

(assert (=> b!1566137 (=> (not res!1069884) (not e!873019))))

(assert (=> b!1566137 (= res!1069884 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50961 _keys!637)) (bvslt from!782 (size!50961 _keys!637))))))

(declare-fun b!1566138 () Bool)

(declare-fun res!1069888 () Bool)

(assert (=> b!1566138 (=> (not res!1069888) (not e!873019))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1566138 (= res!1069888 (and (= (size!50960 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50961 _keys!637) (size!50960 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1566139 () Bool)

(assert (=> b!1566139 (= e!873017 tp_is_empty!38815)))

(declare-fun b!1566140 () Bool)

(assert (=> b!1566140 (= e!873019 e!873015)))

(declare-fun res!1069885 () Bool)

(assert (=> b!1566140 (=> (not res!1069885) (not e!873015))))

(assert (=> b!1566140 (= res!1069885 (not (contains!10340 lt!672848 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59961)

(declare-fun minValue!453 () V!59961)

(declare-fun defaultEntry!495 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6735 (array!104450 array!104448 (_ BitVec 32) (_ BitVec 32) V!59961 V!59961 (_ BitVec 32) Int) ListLongMap!22647)

(assert (=> b!1566140 (= lt!672848 (getCurrentListMapNoExtraKeys!6735 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(assert (= (and start!134144 res!1069887) b!1566138))

(assert (= (and b!1566138 res!1069888) b!1566132))

(assert (= (and b!1566132 res!1069886) b!1566133))

(assert (= (and b!1566133 res!1069883) b!1566137))

(assert (= (and b!1566137 res!1069884) b!1566131))

(assert (= (and b!1566131 res!1069889) b!1566140))

(assert (= (and b!1566140 res!1069885) b!1566134))

(assert (= (and b!1566135 condMapEmpty!59598) mapIsEmpty!59598))

(assert (= (and b!1566135 (not condMapEmpty!59598)) mapNonEmpty!59598))

(get-info :version)

(assert (= (and mapNonEmpty!59598 ((_ is ValueCellFull!18377) mapValue!59598)) b!1566139))

(assert (= (and b!1566135 ((_ is ValueCellFull!18377) mapDefault!59598)) b!1566136))

(assert (= start!134144 b!1566135))

(declare-fun m!1441407 () Bool)

(assert (=> mapNonEmpty!59598 m!1441407))

(declare-fun m!1441409 () Bool)

(assert (=> b!1566133 m!1441409))

(declare-fun m!1441411 () Bool)

(assert (=> b!1566134 m!1441411))

(declare-fun m!1441413 () Bool)

(assert (=> start!134144 m!1441413))

(declare-fun m!1441415 () Bool)

(assert (=> start!134144 m!1441415))

(declare-fun m!1441417 () Bool)

(assert (=> start!134144 m!1441417))

(declare-fun m!1441419 () Bool)

(assert (=> b!1566132 m!1441419))

(declare-fun m!1441421 () Bool)

(assert (=> b!1566140 m!1441421))

(declare-fun m!1441423 () Bool)

(assert (=> b!1566140 m!1441423))

(declare-fun m!1441425 () Bool)

(assert (=> b!1566131 m!1441425))

(assert (=> b!1566131 m!1441425))

(declare-fun m!1441427 () Bool)

(assert (=> b!1566131 m!1441427))

(check-sat (not b!1566131) (not b!1566132) tp_is_empty!38815 (not b_next!32095) (not mapNonEmpty!59598) (not b!1566134) (not b!1566140) b_and!51667 (not b!1566133) (not start!134144))
(check-sat b_and!51667 (not b_next!32095))
