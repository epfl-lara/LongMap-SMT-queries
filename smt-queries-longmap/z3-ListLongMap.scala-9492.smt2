; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112784 () Bool)

(assert start!112784)

(declare-fun b_free!30955 () Bool)

(declare-fun b_next!30955 () Bool)

(assert (=> start!112784 (= b_free!30955 (not b_next!30955))))

(declare-fun tp!108501 () Bool)

(declare-fun b_and!49865 () Bool)

(assert (=> start!112784 (= tp!108501 b_and!49865)))

(declare-fun b!1336479 () Bool)

(declare-fun res!886642 () Bool)

(declare-fun e!761288 () Bool)

(assert (=> b!1336479 (=> (not res!886642) (not e!761288))))

(declare-datatypes ((array!90701 0))(
  ( (array!90702 (arr!43812 (Array (_ BitVec 32) (_ BitVec 64))) (size!44363 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90701)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1336479 (= res!886642 (not (validKeyInArray!0 (select (arr!43812 _keys!1590) from!1980))))))

(declare-fun mapIsEmpty!56971 () Bool)

(declare-fun mapRes!56971 () Bool)

(assert (=> mapIsEmpty!56971 mapRes!56971))

(declare-fun mapNonEmpty!56971 () Bool)

(declare-fun tp!108502 () Bool)

(declare-fun e!761286 () Bool)

(assert (=> mapNonEmpty!56971 (= mapRes!56971 (and tp!108502 e!761286))))

(declare-datatypes ((V!54257 0))(
  ( (V!54258 (val!18507 Int)) )
))
(declare-datatypes ((ValueCell!17534 0))(
  ( (ValueCellFull!17534 (v!21139 V!54257)) (EmptyCell!17534) )
))
(declare-fun mapRest!56971 () (Array (_ BitVec 32) ValueCell!17534))

(declare-datatypes ((array!90703 0))(
  ( (array!90704 (arr!43813 (Array (_ BitVec 32) ValueCell!17534)) (size!44364 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90703)

(declare-fun mapValue!56971 () ValueCell!17534)

(declare-fun mapKey!56971 () (_ BitVec 32))

(assert (=> mapNonEmpty!56971 (= (arr!43813 _values!1320) (store mapRest!56971 mapKey!56971 mapValue!56971))))

(declare-fun b!1336480 () Bool)

(declare-fun res!886645 () Bool)

(assert (=> b!1336480 (=> (not res!886645) (not e!761288))))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1336480 (= res!886645 (not (= (select (arr!43812 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1336481 () Bool)

(declare-fun e!761289 () Bool)

(declare-fun e!761287 () Bool)

(assert (=> b!1336481 (= e!761289 (and e!761287 mapRes!56971))))

(declare-fun condMapEmpty!56971 () Bool)

(declare-fun mapDefault!56971 () ValueCell!17534)

(assert (=> b!1336481 (= condMapEmpty!56971 (= (arr!43813 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17534)) mapDefault!56971)))))

(declare-fun b!1336482 () Bool)

(declare-fun tp_is_empty!36865 () Bool)

(assert (=> b!1336482 (= e!761286 tp_is_empty!36865)))

(declare-fun b!1336483 () Bool)

(declare-fun res!886648 () Bool)

(assert (=> b!1336483 (=> (not res!886648) (not e!761288))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1336483 (= res!886648 (and (= (size!44364 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44363 _keys!1590) (size!44364 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1336484 () Bool)

(declare-fun res!886644 () Bool)

(assert (=> b!1336484 (=> (not res!886644) (not e!761288))))

(declare-datatypes ((List!31041 0))(
  ( (Nil!31038) (Cons!31037 (h!32255 (_ BitVec 64)) (t!45297 List!31041)) )
))
(declare-fun arrayNoDuplicates!0 (array!90701 (_ BitVec 32) List!31041) Bool)

(assert (=> b!1336484 (= res!886644 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31038))))

(declare-fun b!1336485 () Bool)

(declare-fun res!886649 () Bool)

(assert (=> b!1336485 (=> (not res!886649) (not e!761288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90701 (_ BitVec 32)) Bool)

(assert (=> b!1336485 (= res!886649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1336486 () Bool)

(declare-fun res!886647 () Bool)

(assert (=> b!1336486 (=> (not res!886647) (not e!761288))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54257)

(declare-fun zeroValue!1262 () V!54257)

(declare-datatypes ((tuple2!23894 0))(
  ( (tuple2!23895 (_1!11958 (_ BitVec 64)) (_2!11958 V!54257)) )
))
(declare-datatypes ((List!31042 0))(
  ( (Nil!31039) (Cons!31038 (h!32256 tuple2!23894) (t!45298 List!31042)) )
))
(declare-datatypes ((ListLongMap!21559 0))(
  ( (ListLongMap!21560 (toList!10795 List!31042)) )
))
(declare-fun contains!8971 (ListLongMap!21559 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5754 (array!90701 array!90703 (_ BitVec 32) (_ BitVec 32) V!54257 V!54257 (_ BitVec 32) Int) ListLongMap!21559)

(assert (=> b!1336486 (= res!886647 (contains!8971 (getCurrentListMap!5754 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1336487 () Bool)

(declare-fun res!886643 () Bool)

(assert (=> b!1336487 (=> (not res!886643) (not e!761288))))

(assert (=> b!1336487 (= res!886643 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44363 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1336488 () Bool)

(assert (=> b!1336488 (= e!761287 tp_is_empty!36865)))

(declare-fun res!886646 () Bool)

(assert (=> start!112784 (=> (not res!886646) (not e!761288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112784 (= res!886646 (validMask!0 mask!1998))))

(assert (=> start!112784 e!761288))

(declare-fun array_inv!33307 (array!90703) Bool)

(assert (=> start!112784 (and (array_inv!33307 _values!1320) e!761289)))

(assert (=> start!112784 true))

(declare-fun array_inv!33308 (array!90701) Bool)

(assert (=> start!112784 (array_inv!33308 _keys!1590)))

(assert (=> start!112784 tp!108501))

(assert (=> start!112784 tp_is_empty!36865))

(declare-fun b!1336489 () Bool)

(assert (=> b!1336489 (= e!761288 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000))))

(assert (= (and start!112784 res!886646) b!1336483))

(assert (= (and b!1336483 res!886648) b!1336485))

(assert (= (and b!1336485 res!886649) b!1336484))

(assert (= (and b!1336484 res!886644) b!1336487))

(assert (= (and b!1336487 res!886643) b!1336486))

(assert (= (and b!1336486 res!886647) b!1336480))

(assert (= (and b!1336480 res!886645) b!1336479))

(assert (= (and b!1336479 res!886642) b!1336489))

(assert (= (and b!1336481 condMapEmpty!56971) mapIsEmpty!56971))

(assert (= (and b!1336481 (not condMapEmpty!56971)) mapNonEmpty!56971))

(get-info :version)

(assert (= (and mapNonEmpty!56971 ((_ is ValueCellFull!17534) mapValue!56971)) b!1336482))

(assert (= (and b!1336481 ((_ is ValueCellFull!17534) mapDefault!56971)) b!1336488))

(assert (= start!112784 b!1336481))

(declare-fun m!1224929 () Bool)

(assert (=> b!1336480 m!1224929))

(declare-fun m!1224931 () Bool)

(assert (=> start!112784 m!1224931))

(declare-fun m!1224933 () Bool)

(assert (=> start!112784 m!1224933))

(declare-fun m!1224935 () Bool)

(assert (=> start!112784 m!1224935))

(declare-fun m!1224937 () Bool)

(assert (=> b!1336484 m!1224937))

(assert (=> b!1336479 m!1224929))

(assert (=> b!1336479 m!1224929))

(declare-fun m!1224939 () Bool)

(assert (=> b!1336479 m!1224939))

(declare-fun m!1224941 () Bool)

(assert (=> b!1336486 m!1224941))

(assert (=> b!1336486 m!1224941))

(declare-fun m!1224943 () Bool)

(assert (=> b!1336486 m!1224943))

(declare-fun m!1224945 () Bool)

(assert (=> b!1336485 m!1224945))

(declare-fun m!1224947 () Bool)

(assert (=> mapNonEmpty!56971 m!1224947))

(check-sat (not mapNonEmpty!56971) (not b_next!30955) (not b!1336484) b_and!49865 (not b!1336486) (not start!112784) tp_is_empty!36865 (not b!1336479) (not b!1336485))
(check-sat b_and!49865 (not b_next!30955))
