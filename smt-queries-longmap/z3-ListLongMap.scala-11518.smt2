; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134084 () Bool)

(assert start!134084)

(declare-fun b_free!32211 () Bool)

(declare-fun b_next!32211 () Bool)

(assert (=> start!134084 (= b_free!32211 (not b_next!32211))))

(declare-fun tp!113951 () Bool)

(declare-fun b_and!51855 () Bool)

(assert (=> start!134084 (= tp!113951 b_and!51855)))

(declare-fun b!1567123 () Bool)

(declare-fun res!1071063 () Bool)

(declare-fun e!873553 () Bool)

(assert (=> b!1567123 (=> (not res!1071063) (not e!873553))))

(declare-datatypes ((array!104672 0))(
  ( (array!104673 (arr!50521 (Array (_ BitVec 32) (_ BitVec 64))) (size!51071 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104672)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567123 (= res!1071063 (not (validKeyInArray!0 (select (arr!50521 _keys!637) from!782))))))

(declare-fun b!1567124 () Bool)

(declare-fun e!873548 () Bool)

(assert (=> b!1567124 (= e!873553 e!873548)))

(declare-fun res!1071064 () Bool)

(assert (=> b!1567124 (=> (not res!1071064) (not e!873548))))

(declare-datatypes ((V!60195 0))(
  ( (V!60196 (val!19579 Int)) )
))
(declare-datatypes ((tuple2!25262 0))(
  ( (tuple2!25263 (_1!12642 (_ BitVec 64)) (_2!12642 V!60195)) )
))
(declare-datatypes ((List!36648 0))(
  ( (Nil!36645) (Cons!36644 (h!38091 tuple2!25262) (t!51552 List!36648)) )
))
(declare-datatypes ((ListLongMap!22697 0))(
  ( (ListLongMap!22698 (toList!11364 List!36648)) )
))
(declare-fun lt!672868 () ListLongMap!22697)

(declare-fun contains!10358 (ListLongMap!22697 (_ BitVec 64)) Bool)

(assert (=> b!1567124 (= res!1071064 (not (contains!10358 lt!672868 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60195)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60195)

(declare-datatypes ((ValueCell!18465 0))(
  ( (ValueCellFull!18465 (v!22338 V!60195)) (EmptyCell!18465) )
))
(declare-datatypes ((array!104674 0))(
  ( (array!104675 (arr!50522 (Array (_ BitVec 32) ValueCell!18465)) (size!51072 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104674)

(declare-fun getCurrentListMapNoExtraKeys!6729 (array!104672 array!104674 (_ BitVec 32) (_ BitVec 32) V!60195 V!60195 (_ BitVec 32) Int) ListLongMap!22697)

(assert (=> b!1567124 (= lt!672868 (getCurrentListMapNoExtraKeys!6729 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1567125 () Bool)

(declare-fun res!1071065 () Bool)

(assert (=> b!1567125 (=> (not res!1071065) (not e!873553))))

(declare-datatypes ((List!36649 0))(
  ( (Nil!36646) (Cons!36645 (h!38092 (_ BitVec 64)) (t!51553 List!36649)) )
))
(declare-fun arrayNoDuplicates!0 (array!104672 (_ BitVec 32) List!36649) Bool)

(assert (=> b!1567125 (= res!1071065 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36646))))

(declare-fun mapNonEmpty!59886 () Bool)

(declare-fun mapRes!59886 () Bool)

(declare-fun tp!113952 () Bool)

(declare-fun e!873550 () Bool)

(assert (=> mapNonEmpty!59886 (= mapRes!59886 (and tp!113952 e!873550))))

(declare-fun mapValue!59886 () ValueCell!18465)

(declare-fun mapKey!59886 () (_ BitVec 32))

(declare-fun mapRest!59886 () (Array (_ BitVec 32) ValueCell!18465))

(assert (=> mapNonEmpty!59886 (= (arr!50522 _values!487) (store mapRest!59886 mapKey!59886 mapValue!59886))))

(declare-fun b!1567126 () Bool)

(declare-fun e!873551 () Bool)

(declare-fun e!873549 () Bool)

(assert (=> b!1567126 (= e!873551 (and e!873549 mapRes!59886))))

(declare-fun condMapEmpty!59886 () Bool)

(declare-fun mapDefault!59886 () ValueCell!18465)

(assert (=> b!1567126 (= condMapEmpty!59886 (= (arr!50522 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18465)) mapDefault!59886)))))

(declare-fun b!1567127 () Bool)

(declare-fun tp_is_empty!38991 () Bool)

(assert (=> b!1567127 (= e!873550 tp_is_empty!38991)))

(declare-fun b!1567128 () Bool)

(declare-fun res!1071066 () Bool)

(assert (=> b!1567128 (=> (not res!1071066) (not e!873553))))

(assert (=> b!1567128 (= res!1071066 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51071 _keys!637)) (bvslt from!782 (size!51071 _keys!637))))))

(declare-fun res!1071061 () Bool)

(assert (=> start!134084 (=> (not res!1071061) (not e!873553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134084 (= res!1071061 (validMask!0 mask!947))))

(assert (=> start!134084 e!873553))

(assert (=> start!134084 tp!113951))

(assert (=> start!134084 tp_is_empty!38991))

(assert (=> start!134084 true))

(declare-fun array_inv!39253 (array!104672) Bool)

(assert (=> start!134084 (array_inv!39253 _keys!637)))

(declare-fun array_inv!39254 (array!104674) Bool)

(assert (=> start!134084 (and (array_inv!39254 _values!487) e!873551)))

(declare-fun b!1567129 () Bool)

(declare-fun res!1071067 () Bool)

(assert (=> b!1567129 (=> (not res!1071067) (not e!873553))))

(assert (=> b!1567129 (= res!1071067 (and (= (size!51072 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51071 _keys!637) (size!51072 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1567130 () Bool)

(declare-fun res!1071062 () Bool)

(assert (=> b!1567130 (=> (not res!1071062) (not e!873553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104672 (_ BitVec 32)) Bool)

(assert (=> b!1567130 (= res!1071062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1567131 () Bool)

(assert (=> b!1567131 (= e!873548 false)))

(declare-fun lt!672869 () Bool)

(assert (=> b!1567131 (= lt!672869 (contains!10358 lt!672868 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!59886 () Bool)

(assert (=> mapIsEmpty!59886 mapRes!59886))

(declare-fun b!1567132 () Bool)

(assert (=> b!1567132 (= e!873549 tp_is_empty!38991)))

(assert (= (and start!134084 res!1071061) b!1567129))

(assert (= (and b!1567129 res!1071067) b!1567130))

(assert (= (and b!1567130 res!1071062) b!1567125))

(assert (= (and b!1567125 res!1071065) b!1567128))

(assert (= (and b!1567128 res!1071066) b!1567123))

(assert (= (and b!1567123 res!1071063) b!1567124))

(assert (= (and b!1567124 res!1071064) b!1567131))

(assert (= (and b!1567126 condMapEmpty!59886) mapIsEmpty!59886))

(assert (= (and b!1567126 (not condMapEmpty!59886)) mapNonEmpty!59886))

(get-info :version)

(assert (= (and mapNonEmpty!59886 ((_ is ValueCellFull!18465) mapValue!59886)) b!1567127))

(assert (= (and b!1567126 ((_ is ValueCellFull!18465) mapDefault!59886)) b!1567132))

(assert (= start!134084 b!1567126))

(declare-fun m!1442067 () Bool)

(assert (=> b!1567125 m!1442067))

(declare-fun m!1442069 () Bool)

(assert (=> b!1567123 m!1442069))

(assert (=> b!1567123 m!1442069))

(declare-fun m!1442071 () Bool)

(assert (=> b!1567123 m!1442071))

(declare-fun m!1442073 () Bool)

(assert (=> start!134084 m!1442073))

(declare-fun m!1442075 () Bool)

(assert (=> start!134084 m!1442075))

(declare-fun m!1442077 () Bool)

(assert (=> start!134084 m!1442077))

(declare-fun m!1442079 () Bool)

(assert (=> b!1567124 m!1442079))

(declare-fun m!1442081 () Bool)

(assert (=> b!1567124 m!1442081))

(declare-fun m!1442083 () Bool)

(assert (=> mapNonEmpty!59886 m!1442083))

(declare-fun m!1442085 () Bool)

(assert (=> b!1567131 m!1442085))

(declare-fun m!1442087 () Bool)

(assert (=> b!1567130 m!1442087))

(check-sat (not b!1567124) (not b!1567130) (not b!1567131) (not start!134084) (not mapNonEmpty!59886) (not b_next!32211) tp_is_empty!38991 (not b!1567123) b_and!51855 (not b!1567125))
(check-sat b_and!51855 (not b_next!32211))
