; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112394 () Bool)

(assert start!112394)

(declare-fun b_free!30565 () Bool)

(declare-fun b_next!30565 () Bool)

(assert (=> start!112394 (= b_free!30565 (not b_next!30565))))

(declare-fun tp!107332 () Bool)

(declare-fun b_and!49217 () Bool)

(assert (=> start!112394 (= tp!107332 b_and!49217)))

(declare-fun b!1329771 () Bool)

(declare-fun res!881947 () Bool)

(declare-fun e!758282 () Bool)

(assert (=> b!1329771 (=> (not res!881947) (not e!758282))))

(declare-datatypes ((array!89951 0))(
  ( (array!89952 (arr!43437 (Array (_ BitVec 32) (_ BitVec 64))) (size!43988 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89951)

(declare-datatypes ((List!30773 0))(
  ( (Nil!30770) (Cons!30769 (h!31987 (_ BitVec 64)) (t!44771 List!30773)) )
))
(declare-fun arrayNoDuplicates!0 (array!89951 (_ BitVec 32) List!30773) Bool)

(assert (=> b!1329771 (= res!881947 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30770))))

(declare-fun mapIsEmpty!56386 () Bool)

(declare-fun mapRes!56386 () Bool)

(assert (=> mapIsEmpty!56386 mapRes!56386))

(declare-fun b!1329772 () Bool)

(declare-fun res!881948 () Bool)

(assert (=> b!1329772 (=> (not res!881948) (not e!758282))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1329772 (= res!881948 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43988 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1329773 () Bool)

(declare-fun res!881951 () Bool)

(assert (=> b!1329773 (=> (not res!881951) (not e!758282))))

(declare-datatypes ((V!53737 0))(
  ( (V!53738 (val!18312 Int)) )
))
(declare-datatypes ((ValueCell!17339 0))(
  ( (ValueCellFull!17339 (v!20944 V!53737)) (EmptyCell!17339) )
))
(declare-datatypes ((array!89953 0))(
  ( (array!89954 (arr!43438 (Array (_ BitVec 32) ValueCell!17339)) (size!43989 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89953)

(declare-fun mask!1998 () (_ BitVec 32))

(assert (=> b!1329773 (= res!881951 (and (= (size!43989 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43988 _keys!1590) (size!43989 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329774 () Bool)

(declare-fun e!758280 () Bool)

(declare-fun e!758283 () Bool)

(assert (=> b!1329774 (= e!758280 (and e!758283 mapRes!56386))))

(declare-fun condMapEmpty!56386 () Bool)

(declare-fun mapDefault!56386 () ValueCell!17339)

(assert (=> b!1329774 (= condMapEmpty!56386 (= (arr!43438 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17339)) mapDefault!56386)))))

(declare-fun b!1329775 () Bool)

(assert (=> b!1329775 (= e!758282 false)))

(declare-fun zeroValue!1262 () V!53737)

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53737)

(declare-fun lt!591321 () Bool)

(declare-datatypes ((tuple2!23596 0))(
  ( (tuple2!23597 (_1!11809 (_ BitVec 64)) (_2!11809 V!53737)) )
))
(declare-datatypes ((List!30774 0))(
  ( (Nil!30771) (Cons!30770 (h!31988 tuple2!23596) (t!44772 List!30774)) )
))
(declare-datatypes ((ListLongMap!21261 0))(
  ( (ListLongMap!21262 (toList!10646 List!30774)) )
))
(declare-fun contains!8822 (ListLongMap!21261 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5623 (array!89951 array!89953 (_ BitVec 32) (_ BitVec 32) V!53737 V!53737 (_ BitVec 32) Int) ListLongMap!21261)

(assert (=> b!1329775 (= lt!591321 (contains!8822 (getCurrentListMap!5623 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapNonEmpty!56386 () Bool)

(declare-fun tp!107331 () Bool)

(declare-fun e!758281 () Bool)

(assert (=> mapNonEmpty!56386 (= mapRes!56386 (and tp!107331 e!758281))))

(declare-fun mapValue!56386 () ValueCell!17339)

(declare-fun mapKey!56386 () (_ BitVec 32))

(declare-fun mapRest!56386 () (Array (_ BitVec 32) ValueCell!17339))

(assert (=> mapNonEmpty!56386 (= (arr!43438 _values!1320) (store mapRest!56386 mapKey!56386 mapValue!56386))))

(declare-fun b!1329776 () Bool)

(declare-fun tp_is_empty!36475 () Bool)

(assert (=> b!1329776 (= e!758281 tp_is_empty!36475)))

(declare-fun res!881949 () Bool)

(assert (=> start!112394 (=> (not res!881949) (not e!758282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112394 (= res!881949 (validMask!0 mask!1998))))

(assert (=> start!112394 e!758282))

(declare-fun array_inv!33055 (array!89953) Bool)

(assert (=> start!112394 (and (array_inv!33055 _values!1320) e!758280)))

(assert (=> start!112394 true))

(declare-fun array_inv!33056 (array!89951) Bool)

(assert (=> start!112394 (array_inv!33056 _keys!1590)))

(assert (=> start!112394 tp!107332))

(assert (=> start!112394 tp_is_empty!36475))

(declare-fun b!1329777 () Bool)

(assert (=> b!1329777 (= e!758283 tp_is_empty!36475)))

(declare-fun b!1329778 () Bool)

(declare-fun res!881950 () Bool)

(assert (=> b!1329778 (=> (not res!881950) (not e!758282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89951 (_ BitVec 32)) Bool)

(assert (=> b!1329778 (= res!881950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112394 res!881949) b!1329773))

(assert (= (and b!1329773 res!881951) b!1329778))

(assert (= (and b!1329778 res!881950) b!1329771))

(assert (= (and b!1329771 res!881947) b!1329772))

(assert (= (and b!1329772 res!881948) b!1329775))

(assert (= (and b!1329774 condMapEmpty!56386) mapIsEmpty!56386))

(assert (= (and b!1329774 (not condMapEmpty!56386)) mapNonEmpty!56386))

(get-info :version)

(assert (= (and mapNonEmpty!56386 ((_ is ValueCellFull!17339) mapValue!56386)) b!1329776))

(assert (= (and b!1329774 ((_ is ValueCellFull!17339) mapDefault!56386)) b!1329777))

(assert (= start!112394 b!1329774))

(declare-fun m!1219031 () Bool)

(assert (=> b!1329778 m!1219031))

(declare-fun m!1219033 () Bool)

(assert (=> b!1329775 m!1219033))

(assert (=> b!1329775 m!1219033))

(declare-fun m!1219035 () Bool)

(assert (=> b!1329775 m!1219035))

(declare-fun m!1219037 () Bool)

(assert (=> start!112394 m!1219037))

(declare-fun m!1219039 () Bool)

(assert (=> start!112394 m!1219039))

(declare-fun m!1219041 () Bool)

(assert (=> start!112394 m!1219041))

(declare-fun m!1219043 () Bool)

(assert (=> b!1329771 m!1219043))

(declare-fun m!1219045 () Bool)

(assert (=> mapNonEmpty!56386 m!1219045))

(check-sat (not b!1329778) (not mapNonEmpty!56386) b_and!49217 (not b_next!30565) (not b!1329775) tp_is_empty!36475 (not start!112394) (not b!1329771))
(check-sat b_and!49217 (not b_next!30565))
