; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112146 () Bool)

(assert start!112146)

(declare-fun b_free!30541 () Bool)

(declare-fun b_next!30541 () Bool)

(assert (=> start!112146 (= b_free!30541 (not b_next!30541))))

(declare-fun tp!107261 () Bool)

(declare-fun b_and!49173 () Bool)

(assert (=> start!112146 (= tp!107261 b_and!49173)))

(declare-fun b!1328114 () Bool)

(declare-fun e!757225 () Bool)

(assert (=> b!1328114 (= e!757225 false)))

(declare-datatypes ((V!53705 0))(
  ( (V!53706 (val!18300 Int)) )
))
(declare-datatypes ((ValueCell!17327 0))(
  ( (ValueCellFull!17327 (v!20936 V!53705)) (EmptyCell!17327) )
))
(declare-datatypes ((array!89733 0))(
  ( (array!89734 (arr!43333 (Array (_ BitVec 32) ValueCell!17327)) (size!43885 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89733)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89735 0))(
  ( (array!89736 (arr!43334 (Array (_ BitVec 32) (_ BitVec 64))) (size!43886 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89735)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun lt!590623 () Bool)

(declare-fun minValue!1262 () V!53705)

(declare-fun zeroValue!1262 () V!53705)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23616 0))(
  ( (tuple2!23617 (_1!11819 (_ BitVec 64)) (_2!11819 V!53705)) )
))
(declare-datatypes ((List!30764 0))(
  ( (Nil!30761) (Cons!30760 (h!31969 tuple2!23616) (t!44762 List!30764)) )
))
(declare-datatypes ((ListLongMap!21273 0))(
  ( (ListLongMap!21274 (toList!10652 List!30764)) )
))
(declare-fun contains!8744 (ListLongMap!21273 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5524 (array!89735 array!89733 (_ BitVec 32) (_ BitVec 32) V!53705 V!53705 (_ BitVec 32) Int) ListLongMap!21273)

(assert (=> b!1328114 (= lt!590623 (contains!8744 (getCurrentListMap!5524 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapNonEmpty!56350 () Bool)

(declare-fun mapRes!56350 () Bool)

(declare-fun tp!107260 () Bool)

(declare-fun e!757227 () Bool)

(assert (=> mapNonEmpty!56350 (= mapRes!56350 (and tp!107260 e!757227))))

(declare-fun mapKey!56350 () (_ BitVec 32))

(declare-fun mapValue!56350 () ValueCell!17327)

(declare-fun mapRest!56350 () (Array (_ BitVec 32) ValueCell!17327))

(assert (=> mapNonEmpty!56350 (= (arr!43333 _values!1320) (store mapRest!56350 mapKey!56350 mapValue!56350))))

(declare-fun b!1328115 () Bool)

(declare-fun res!881223 () Bool)

(assert (=> b!1328115 (=> (not res!881223) (not e!757225))))

(declare-datatypes ((List!30765 0))(
  ( (Nil!30762) (Cons!30761 (h!31970 (_ BitVec 64)) (t!44763 List!30765)) )
))
(declare-fun arrayNoDuplicates!0 (array!89735 (_ BitVec 32) List!30765) Bool)

(assert (=> b!1328115 (= res!881223 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30762))))

(declare-fun b!1328116 () Bool)

(declare-fun res!881221 () Bool)

(assert (=> b!1328116 (=> (not res!881221) (not e!757225))))

(assert (=> b!1328116 (= res!881221 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43886 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!881222 () Bool)

(assert (=> start!112146 (=> (not res!881222) (not e!757225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112146 (= res!881222 (validMask!0 mask!1998))))

(assert (=> start!112146 e!757225))

(declare-fun e!757224 () Bool)

(declare-fun array_inv!32871 (array!89733) Bool)

(assert (=> start!112146 (and (array_inv!32871 _values!1320) e!757224)))

(assert (=> start!112146 true))

(declare-fun array_inv!32872 (array!89735) Bool)

(assert (=> start!112146 (array_inv!32872 _keys!1590)))

(assert (=> start!112146 tp!107261))

(declare-fun tp_is_empty!36451 () Bool)

(assert (=> start!112146 tp_is_empty!36451))

(declare-fun b!1328117 () Bool)

(assert (=> b!1328117 (= e!757227 tp_is_empty!36451)))

(declare-fun b!1328118 () Bool)

(declare-fun res!881220 () Bool)

(assert (=> b!1328118 (=> (not res!881220) (not e!757225))))

(assert (=> b!1328118 (= res!881220 (and (= (size!43885 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43886 _keys!1590) (size!43885 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1328119 () Bool)

(declare-fun e!757226 () Bool)

(assert (=> b!1328119 (= e!757224 (and e!757226 mapRes!56350))))

(declare-fun condMapEmpty!56350 () Bool)

(declare-fun mapDefault!56350 () ValueCell!17327)

(assert (=> b!1328119 (= condMapEmpty!56350 (= (arr!43333 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17327)) mapDefault!56350)))))

(declare-fun b!1328120 () Bool)

(declare-fun res!881224 () Bool)

(assert (=> b!1328120 (=> (not res!881224) (not e!757225))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89735 (_ BitVec 32)) Bool)

(assert (=> b!1328120 (= res!881224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1328121 () Bool)

(assert (=> b!1328121 (= e!757226 tp_is_empty!36451)))

(declare-fun mapIsEmpty!56350 () Bool)

(assert (=> mapIsEmpty!56350 mapRes!56350))

(assert (= (and start!112146 res!881222) b!1328118))

(assert (= (and b!1328118 res!881220) b!1328120))

(assert (= (and b!1328120 res!881224) b!1328115))

(assert (= (and b!1328115 res!881223) b!1328116))

(assert (= (and b!1328116 res!881221) b!1328114))

(assert (= (and b!1328119 condMapEmpty!56350) mapIsEmpty!56350))

(assert (= (and b!1328119 (not condMapEmpty!56350)) mapNonEmpty!56350))

(get-info :version)

(assert (= (and mapNonEmpty!56350 ((_ is ValueCellFull!17327) mapValue!56350)) b!1328117))

(assert (= (and b!1328119 ((_ is ValueCellFull!17327) mapDefault!56350)) b!1328121))

(assert (= start!112146 b!1328119))

(declare-fun m!1216725 () Bool)

(assert (=> b!1328120 m!1216725))

(declare-fun m!1216727 () Bool)

(assert (=> b!1328114 m!1216727))

(assert (=> b!1328114 m!1216727))

(declare-fun m!1216729 () Bool)

(assert (=> b!1328114 m!1216729))

(declare-fun m!1216731 () Bool)

(assert (=> mapNonEmpty!56350 m!1216731))

(declare-fun m!1216733 () Bool)

(assert (=> b!1328115 m!1216733))

(declare-fun m!1216735 () Bool)

(assert (=> start!112146 m!1216735))

(declare-fun m!1216737 () Bool)

(assert (=> start!112146 m!1216737))

(declare-fun m!1216739 () Bool)

(assert (=> start!112146 m!1216739))

(check-sat (not b!1328114) (not start!112146) tp_is_empty!36451 (not b!1328120) (not mapNonEmpty!56350) b_and!49173 (not b_next!30541) (not b!1328115))
(check-sat b_and!49173 (not b_next!30541))
