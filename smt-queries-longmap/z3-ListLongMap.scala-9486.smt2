; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112524 () Bool)

(assert start!112524)

(declare-fun b_free!30919 () Bool)

(declare-fun b_next!30919 () Bool)

(assert (=> start!112524 (= b_free!30919 (not b_next!30919))))

(declare-fun tp!108394 () Bool)

(declare-fun b_and!49809 () Bool)

(assert (=> start!112524 (= tp!108394 b_and!49809)))

(declare-fun b!1334672 () Bool)

(declare-fun e!760143 () Bool)

(declare-fun e!760140 () Bool)

(declare-fun mapRes!56917 () Bool)

(assert (=> b!1334672 (= e!760143 (and e!760140 mapRes!56917))))

(declare-fun condMapEmpty!56917 () Bool)

(declare-datatypes ((V!54209 0))(
  ( (V!54210 (val!18489 Int)) )
))
(declare-datatypes ((ValueCell!17516 0))(
  ( (ValueCellFull!17516 (v!21125 V!54209)) (EmptyCell!17516) )
))
(declare-datatypes ((array!90469 0))(
  ( (array!90470 (arr!43701 (Array (_ BitVec 32) ValueCell!17516)) (size!44253 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90469)

(declare-fun mapDefault!56917 () ValueCell!17516)

(assert (=> b!1334672 (= condMapEmpty!56917 (= (arr!43701 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17516)) mapDefault!56917)))))

(declare-fun b!1334674 () Bool)

(declare-fun res!885823 () Bool)

(declare-fun e!760141 () Bool)

(assert (=> b!1334674 (=> (not res!885823) (not e!760141))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90471 0))(
  ( (array!90472 (arr!43702 (Array (_ BitVec 32) (_ BitVec 64))) (size!44254 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90471)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1334674 (= res!885823 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44254 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334675 () Bool)

(declare-fun res!885821 () Bool)

(assert (=> b!1334675 (=> (not res!885821) (not e!760141))))

(declare-datatypes ((List!31040 0))(
  ( (Nil!31037) (Cons!31036 (h!32245 (_ BitVec 64)) (t!45296 List!31040)) )
))
(declare-fun arrayNoDuplicates!0 (array!90471 (_ BitVec 32) List!31040) Bool)

(assert (=> b!1334675 (= res!885821 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31037))))

(declare-fun b!1334676 () Bool)

(declare-fun tp_is_empty!36829 () Bool)

(assert (=> b!1334676 (= e!760140 tp_is_empty!36829)))

(declare-fun mapNonEmpty!56917 () Bool)

(declare-fun tp!108395 () Bool)

(declare-fun e!760142 () Bool)

(assert (=> mapNonEmpty!56917 (= mapRes!56917 (and tp!108395 e!760142))))

(declare-fun mapValue!56917 () ValueCell!17516)

(declare-fun mapRest!56917 () (Array (_ BitVec 32) ValueCell!17516))

(declare-fun mapKey!56917 () (_ BitVec 32))

(assert (=> mapNonEmpty!56917 (= (arr!43701 _values!1320) (store mapRest!56917 mapKey!56917 mapValue!56917))))

(declare-fun b!1334677 () Bool)

(declare-fun res!885819 () Bool)

(assert (=> b!1334677 (=> (not res!885819) (not e!760141))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90471 (_ BitVec 32)) Bool)

(assert (=> b!1334677 (= res!885819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334678 () Bool)

(assert (=> b!1334678 (= e!760141 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54209)

(declare-fun zeroValue!1262 () V!54209)

(declare-fun lt!592198 () Bool)

(declare-datatypes ((tuple2!23902 0))(
  ( (tuple2!23903 (_1!11962 (_ BitVec 64)) (_2!11962 V!54209)) )
))
(declare-datatypes ((List!31041 0))(
  ( (Nil!31038) (Cons!31037 (h!32246 tuple2!23902) (t!45297 List!31041)) )
))
(declare-datatypes ((ListLongMap!21559 0))(
  ( (ListLongMap!21560 (toList!10795 List!31041)) )
))
(declare-fun contains!8887 (ListLongMap!21559 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5649 (array!90471 array!90469 (_ BitVec 32) (_ BitVec 32) V!54209 V!54209 (_ BitVec 32) Int) ListLongMap!21559)

(assert (=> b!1334678 (= lt!592198 (contains!8887 (getCurrentListMap!5649 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun res!885820 () Bool)

(assert (=> start!112524 (=> (not res!885820) (not e!760141))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112524 (= res!885820 (validMask!0 mask!1998))))

(assert (=> start!112524 e!760141))

(declare-fun array_inv!33155 (array!90469) Bool)

(assert (=> start!112524 (and (array_inv!33155 _values!1320) e!760143)))

(assert (=> start!112524 true))

(declare-fun array_inv!33156 (array!90471) Bool)

(assert (=> start!112524 (array_inv!33156 _keys!1590)))

(assert (=> start!112524 tp!108394))

(assert (=> start!112524 tp_is_empty!36829))

(declare-fun b!1334673 () Bool)

(declare-fun res!885822 () Bool)

(assert (=> b!1334673 (=> (not res!885822) (not e!760141))))

(assert (=> b!1334673 (= res!885822 (and (= (size!44253 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44254 _keys!1590) (size!44253 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334679 () Bool)

(assert (=> b!1334679 (= e!760142 tp_is_empty!36829)))

(declare-fun mapIsEmpty!56917 () Bool)

(assert (=> mapIsEmpty!56917 mapRes!56917))

(assert (= (and start!112524 res!885820) b!1334673))

(assert (= (and b!1334673 res!885822) b!1334677))

(assert (= (and b!1334677 res!885819) b!1334675))

(assert (= (and b!1334675 res!885821) b!1334674))

(assert (= (and b!1334674 res!885823) b!1334678))

(assert (= (and b!1334672 condMapEmpty!56917) mapIsEmpty!56917))

(assert (= (and b!1334672 (not condMapEmpty!56917)) mapNonEmpty!56917))

(get-info :version)

(assert (= (and mapNonEmpty!56917 ((_ is ValueCellFull!17516) mapValue!56917)) b!1334679))

(assert (= (and b!1334672 ((_ is ValueCellFull!17516) mapDefault!56917)) b!1334676))

(assert (= start!112524 b!1334672))

(declare-fun m!1222527 () Bool)

(assert (=> b!1334677 m!1222527))

(declare-fun m!1222529 () Bool)

(assert (=> b!1334678 m!1222529))

(assert (=> b!1334678 m!1222529))

(declare-fun m!1222531 () Bool)

(assert (=> b!1334678 m!1222531))

(declare-fun m!1222533 () Bool)

(assert (=> mapNonEmpty!56917 m!1222533))

(declare-fun m!1222535 () Bool)

(assert (=> start!112524 m!1222535))

(declare-fun m!1222537 () Bool)

(assert (=> start!112524 m!1222537))

(declare-fun m!1222539 () Bool)

(assert (=> start!112524 m!1222539))

(declare-fun m!1222541 () Bool)

(assert (=> b!1334675 m!1222541))

(check-sat (not b!1334678) (not mapNonEmpty!56917) tp_is_empty!36829 (not b_next!30919) b_and!49809 (not start!112524) (not b!1334675) (not b!1334677))
(check-sat b_and!49809 (not b_next!30919))
