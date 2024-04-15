; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112728 () Bool)

(assert start!112728)

(declare-fun b_free!31039 () Bool)

(declare-fun b_next!31039 () Bool)

(assert (=> start!112728 (= b_free!31039 (not b_next!31039))))

(declare-fun tp!108762 () Bool)

(declare-fun b_and!49999 () Bool)

(assert (=> start!112728 (= tp!108762 b_and!49999)))

(declare-fun mapNonEmpty!57104 () Bool)

(declare-fun mapRes!57104 () Bool)

(declare-fun tp!108761 () Bool)

(declare-fun e!761407 () Bool)

(assert (=> mapNonEmpty!57104 (= mapRes!57104 (and tp!108761 e!761407))))

(declare-fun mapKey!57104 () (_ BitVec 32))

(declare-datatypes ((V!54369 0))(
  ( (V!54370 (val!18549 Int)) )
))
(declare-datatypes ((ValueCell!17576 0))(
  ( (ValueCellFull!17576 (v!21189 V!54369)) (EmptyCell!17576) )
))
(declare-datatypes ((array!90701 0))(
  ( (array!90702 (arr!43815 (Array (_ BitVec 32) ValueCell!17576)) (size!44367 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90701)

(declare-fun mapValue!57104 () ValueCell!17576)

(declare-fun mapRest!57104 () (Array (_ BitVec 32) ValueCell!17576))

(assert (=> mapNonEmpty!57104 (= (arr!43815 _values!1320) (store mapRest!57104 mapKey!57104 mapValue!57104))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun e!761404 () Bool)

(declare-fun b!1337128 () Bool)

(assert (=> b!1337128 (= e!761404 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1980 (size!44367 _values!1320))))))

(declare-fun b!1337129 () Bool)

(declare-fun e!761405 () Bool)

(declare-fun e!761408 () Bool)

(assert (=> b!1337129 (= e!761405 (and e!761408 mapRes!57104))))

(declare-fun condMapEmpty!57104 () Bool)

(declare-fun mapDefault!57104 () ValueCell!17576)

(assert (=> b!1337129 (= condMapEmpty!57104 (= (arr!43815 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17576)) mapDefault!57104)))))

(declare-fun b!1337131 () Bool)

(declare-fun res!887358 () Bool)

(assert (=> b!1337131 (=> (not res!887358) (not e!761404))))

(declare-datatypes ((array!90703 0))(
  ( (array!90704 (arr!43816 (Array (_ BitVec 32) (_ BitVec 64))) (size!44368 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90703)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1337131 (= res!887358 (validKeyInArray!0 (select (arr!43816 _keys!1590) from!1980)))))

(declare-fun mapIsEmpty!57104 () Bool)

(assert (=> mapIsEmpty!57104 mapRes!57104))

(declare-fun b!1337132 () Bool)

(declare-fun res!887351 () Bool)

(assert (=> b!1337132 (=> (not res!887351) (not e!761404))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun zeroValue!1262 () V!54369)

(declare-fun minValue!1262 () V!54369)

(declare-datatypes ((tuple2!23986 0))(
  ( (tuple2!23987 (_1!12004 (_ BitVec 64)) (_2!12004 V!54369)) )
))
(declare-datatypes ((List!31116 0))(
  ( (Nil!31113) (Cons!31112 (h!32321 tuple2!23986) (t!45420 List!31116)) )
))
(declare-datatypes ((ListLongMap!21643 0))(
  ( (ListLongMap!21644 (toList!10837 List!31116)) )
))
(declare-fun contains!8933 (ListLongMap!21643 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5690 (array!90703 array!90701 (_ BitVec 32) (_ BitVec 32) V!54369 V!54369 (_ BitVec 32) Int) ListLongMap!21643)

(assert (=> b!1337132 (= res!887351 (contains!8933 (getCurrentListMap!5690 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1337133 () Bool)

(declare-fun res!887353 () Bool)

(assert (=> b!1337133 (=> (not res!887353) (not e!761404))))

(assert (=> b!1337133 (= res!887353 (not (= (select (arr!43816 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1337134 () Bool)

(declare-fun tp_is_empty!36949 () Bool)

(assert (=> b!1337134 (= e!761407 tp_is_empty!36949)))

(declare-fun b!1337135 () Bool)

(declare-fun res!887356 () Bool)

(assert (=> b!1337135 (=> (not res!887356) (not e!761404))))

(assert (=> b!1337135 (= res!887356 (and (= (size!44367 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44368 _keys!1590) (size!44367 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1337136 () Bool)

(declare-fun res!887352 () Bool)

(assert (=> b!1337136 (=> (not res!887352) (not e!761404))))

(declare-datatypes ((List!31117 0))(
  ( (Nil!31114) (Cons!31113 (h!32322 (_ BitVec 64)) (t!45421 List!31117)) )
))
(declare-fun arrayNoDuplicates!0 (array!90703 (_ BitVec 32) List!31117) Bool)

(assert (=> b!1337136 (= res!887352 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31114))))

(declare-fun b!1337130 () Bool)

(declare-fun res!887355 () Bool)

(assert (=> b!1337130 (=> (not res!887355) (not e!761404))))

(assert (=> b!1337130 (= res!887355 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44368 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!887357 () Bool)

(assert (=> start!112728 (=> (not res!887357) (not e!761404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112728 (= res!887357 (validMask!0 mask!1998))))

(assert (=> start!112728 e!761404))

(declare-fun array_inv!33237 (array!90701) Bool)

(assert (=> start!112728 (and (array_inv!33237 _values!1320) e!761405)))

(assert (=> start!112728 true))

(declare-fun array_inv!33238 (array!90703) Bool)

(assert (=> start!112728 (array_inv!33238 _keys!1590)))

(assert (=> start!112728 tp!108762))

(assert (=> start!112728 tp_is_empty!36949))

(declare-fun b!1337137 () Bool)

(assert (=> b!1337137 (= e!761408 tp_is_empty!36949)))

(declare-fun b!1337138 () Bool)

(declare-fun res!887354 () Bool)

(assert (=> b!1337138 (=> (not res!887354) (not e!761404))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90703 (_ BitVec 32)) Bool)

(assert (=> b!1337138 (= res!887354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112728 res!887357) b!1337135))

(assert (= (and b!1337135 res!887356) b!1337138))

(assert (= (and b!1337138 res!887354) b!1337136))

(assert (= (and b!1337136 res!887352) b!1337130))

(assert (= (and b!1337130 res!887355) b!1337132))

(assert (= (and b!1337132 res!887351) b!1337133))

(assert (= (and b!1337133 res!887353) b!1337131))

(assert (= (and b!1337131 res!887358) b!1337128))

(assert (= (and b!1337129 condMapEmpty!57104) mapIsEmpty!57104))

(assert (= (and b!1337129 (not condMapEmpty!57104)) mapNonEmpty!57104))

(get-info :version)

(assert (= (and mapNonEmpty!57104 ((_ is ValueCellFull!17576) mapValue!57104)) b!1337134))

(assert (= (and b!1337129 ((_ is ValueCellFull!17576) mapDefault!57104)) b!1337137))

(assert (= start!112728 b!1337129))

(declare-fun m!1224779 () Bool)

(assert (=> start!112728 m!1224779))

(declare-fun m!1224781 () Bool)

(assert (=> start!112728 m!1224781))

(declare-fun m!1224783 () Bool)

(assert (=> start!112728 m!1224783))

(declare-fun m!1224785 () Bool)

(assert (=> b!1337131 m!1224785))

(assert (=> b!1337131 m!1224785))

(declare-fun m!1224787 () Bool)

(assert (=> b!1337131 m!1224787))

(declare-fun m!1224789 () Bool)

(assert (=> b!1337132 m!1224789))

(assert (=> b!1337132 m!1224789))

(declare-fun m!1224791 () Bool)

(assert (=> b!1337132 m!1224791))

(declare-fun m!1224793 () Bool)

(assert (=> mapNonEmpty!57104 m!1224793))

(declare-fun m!1224795 () Bool)

(assert (=> b!1337138 m!1224795))

(declare-fun m!1224797 () Bool)

(assert (=> b!1337136 m!1224797))

(assert (=> b!1337133 m!1224785))

(check-sat (not b!1337131) (not b!1337132) (not mapNonEmpty!57104) b_and!49999 (not b!1337138) (not b_next!31039) (not b!1337136) (not start!112728) tp_is_empty!36949)
(check-sat b_and!49999 (not b_next!31039))
