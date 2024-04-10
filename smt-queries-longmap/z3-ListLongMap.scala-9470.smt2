; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112430 () Bool)

(assert start!112430)

(declare-fun b_free!30825 () Bool)

(declare-fun b_next!30825 () Bool)

(assert (=> start!112430 (= b_free!30825 (not b_next!30825))))

(declare-fun tp!108111 () Bool)

(declare-fun b_and!49667 () Bool)

(assert (=> start!112430 (= tp!108111 b_and!49667)))

(declare-fun b!1332963 () Bool)

(declare-fun e!759387 () Bool)

(assert (=> b!1332963 (= e!759387 false)))

(declare-datatypes ((V!54083 0))(
  ( (V!54084 (val!18442 Int)) )
))
(declare-datatypes ((ValueCell!17469 0))(
  ( (ValueCellFull!17469 (v!21079 V!54083)) (EmptyCell!17469) )
))
(declare-datatypes ((array!90344 0))(
  ( (array!90345 (arr!43638 (Array (_ BitVec 32) ValueCell!17469)) (size!44188 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90344)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-datatypes ((array!90346 0))(
  ( (array!90347 (arr!43639 (Array (_ BitVec 32) (_ BitVec 64))) (size!44189 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90346)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54083)

(declare-fun zeroValue!1262 () V!54083)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!592090 () Bool)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((tuple2!23768 0))(
  ( (tuple2!23769 (_1!11895 (_ BitVec 64)) (_2!11895 V!54083)) )
))
(declare-datatypes ((List!30913 0))(
  ( (Nil!30910) (Cons!30909 (h!32118 tuple2!23768) (t!45111 List!30913)) )
))
(declare-datatypes ((ListLongMap!21425 0))(
  ( (ListLongMap!21426 (toList!10728 List!30913)) )
))
(declare-fun contains!8892 (ListLongMap!21425 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5709 (array!90346 array!90344 (_ BitVec 32) (_ BitVec 32) V!54083 V!54083 (_ BitVec 32) Int) ListLongMap!21425)

(assert (=> b!1332963 (= lt!592090 (contains!8892 (getCurrentListMap!5709 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapIsEmpty!56776 () Bool)

(declare-fun mapRes!56776 () Bool)

(assert (=> mapIsEmpty!56776 mapRes!56776))

(declare-fun b!1332964 () Bool)

(declare-fun res!884559 () Bool)

(assert (=> b!1332964 (=> (not res!884559) (not e!759387))))

(declare-datatypes ((List!30914 0))(
  ( (Nil!30911) (Cons!30910 (h!32119 (_ BitVec 64)) (t!45112 List!30914)) )
))
(declare-fun arrayNoDuplicates!0 (array!90346 (_ BitVec 32) List!30914) Bool)

(assert (=> b!1332964 (= res!884559 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30911))))

(declare-fun b!1332965 () Bool)

(declare-fun e!759389 () Bool)

(declare-fun e!759390 () Bool)

(assert (=> b!1332965 (= e!759389 (and e!759390 mapRes!56776))))

(declare-fun condMapEmpty!56776 () Bool)

(declare-fun mapDefault!56776 () ValueCell!17469)

(assert (=> b!1332965 (= condMapEmpty!56776 (= (arr!43638 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17469)) mapDefault!56776)))))

(declare-fun b!1332966 () Bool)

(declare-fun tp_is_empty!36735 () Bool)

(assert (=> b!1332966 (= e!759390 tp_is_empty!36735)))

(declare-fun b!1332967 () Bool)

(declare-fun e!759388 () Bool)

(assert (=> b!1332967 (= e!759388 tp_is_empty!36735)))

(declare-fun b!1332968 () Bool)

(declare-fun res!884562 () Bool)

(assert (=> b!1332968 (=> (not res!884562) (not e!759387))))

(assert (=> b!1332968 (= res!884562 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44189 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332969 () Bool)

(declare-fun res!884560 () Bool)

(assert (=> b!1332969 (=> (not res!884560) (not e!759387))))

(assert (=> b!1332969 (= res!884560 (and (= (size!44188 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44189 _keys!1590) (size!44188 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56776 () Bool)

(declare-fun tp!108112 () Bool)

(assert (=> mapNonEmpty!56776 (= mapRes!56776 (and tp!108112 e!759388))))

(declare-fun mapKey!56776 () (_ BitVec 32))

(declare-fun mapValue!56776 () ValueCell!17469)

(declare-fun mapRest!56776 () (Array (_ BitVec 32) ValueCell!17469))

(assert (=> mapNonEmpty!56776 (= (arr!43638 _values!1320) (store mapRest!56776 mapKey!56776 mapValue!56776))))

(declare-fun res!884561 () Bool)

(assert (=> start!112430 (=> (not res!884561) (not e!759387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112430 (= res!884561 (validMask!0 mask!1998))))

(assert (=> start!112430 e!759387))

(declare-fun array_inv!32915 (array!90344) Bool)

(assert (=> start!112430 (and (array_inv!32915 _values!1320) e!759389)))

(assert (=> start!112430 true))

(declare-fun array_inv!32916 (array!90346) Bool)

(assert (=> start!112430 (array_inv!32916 _keys!1590)))

(assert (=> start!112430 tp!108111))

(assert (=> start!112430 tp_is_empty!36735))

(declare-fun b!1332970 () Bool)

(declare-fun res!884558 () Bool)

(assert (=> b!1332970 (=> (not res!884558) (not e!759387))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90346 (_ BitVec 32)) Bool)

(assert (=> b!1332970 (= res!884558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112430 res!884561) b!1332969))

(assert (= (and b!1332969 res!884560) b!1332970))

(assert (= (and b!1332970 res!884558) b!1332964))

(assert (= (and b!1332964 res!884559) b!1332968))

(assert (= (and b!1332968 res!884562) b!1332963))

(assert (= (and b!1332965 condMapEmpty!56776) mapIsEmpty!56776))

(assert (= (and b!1332965 (not condMapEmpty!56776)) mapNonEmpty!56776))

(get-info :version)

(assert (= (and mapNonEmpty!56776 ((_ is ValueCellFull!17469) mapValue!56776)) b!1332967))

(assert (= (and b!1332965 ((_ is ValueCellFull!17469) mapDefault!56776)) b!1332966))

(assert (= start!112430 b!1332965))

(declare-fun m!1221643 () Bool)

(assert (=> b!1332964 m!1221643))

(declare-fun m!1221645 () Bool)

(assert (=> b!1332970 m!1221645))

(declare-fun m!1221647 () Bool)

(assert (=> mapNonEmpty!56776 m!1221647))

(declare-fun m!1221649 () Bool)

(assert (=> start!112430 m!1221649))

(declare-fun m!1221651 () Bool)

(assert (=> start!112430 m!1221651))

(declare-fun m!1221653 () Bool)

(assert (=> start!112430 m!1221653))

(declare-fun m!1221655 () Bool)

(assert (=> b!1332963 m!1221655))

(assert (=> b!1332963 m!1221655))

(declare-fun m!1221657 () Bool)

(assert (=> b!1332963 m!1221657))

(check-sat (not b!1332963) (not start!112430) (not mapNonEmpty!56776) (not b!1332970) b_and!49667 (not b!1332964) (not b_next!30825) tp_is_empty!36735)
(check-sat b_and!49667 (not b_next!30825))
