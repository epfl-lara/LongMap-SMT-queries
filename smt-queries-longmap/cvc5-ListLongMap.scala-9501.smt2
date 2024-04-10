; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112672 () Bool)

(assert start!112672)

(declare-fun b_free!31009 () Bool)

(declare-fun b_next!31009 () Bool)

(assert (=> start!112672 (= b_free!31009 (not b_next!31009))))

(declare-fun tp!108668 () Bool)

(declare-fun b_and!49955 () Bool)

(assert (=> start!112672 (= tp!108668 b_and!49955)))

(declare-fun b!1336481 () Bool)

(declare-fun res!886939 () Bool)

(declare-fun e!761091 () Bool)

(assert (=> b!1336481 (=> (not res!886939) (not e!761091))))

(declare-datatypes ((V!54329 0))(
  ( (V!54330 (val!18534 Int)) )
))
(declare-datatypes ((ValueCell!17561 0))(
  ( (ValueCellFull!17561 (v!21174 V!54329)) (EmptyCell!17561) )
))
(declare-datatypes ((array!90698 0))(
  ( (array!90699 (arr!43814 (Array (_ BitVec 32) ValueCell!17561)) (size!44364 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90698)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90700 0))(
  ( (array!90701 (arr!43815 (Array (_ BitVec 32) (_ BitVec 64))) (size!44365 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90700)

(assert (=> b!1336481 (= res!886939 (and (= (size!44364 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44365 _keys!1590) (size!44364 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57056 () Bool)

(declare-fun mapRes!57056 () Bool)

(declare-fun tp!108667 () Bool)

(declare-fun e!761094 () Bool)

(assert (=> mapNonEmpty!57056 (= mapRes!57056 (and tp!108667 e!761094))))

(declare-fun mapValue!57056 () ValueCell!17561)

(declare-fun mapKey!57056 () (_ BitVec 32))

(declare-fun mapRest!57056 () (Array (_ BitVec 32) ValueCell!17561))

(assert (=> mapNonEmpty!57056 (= (arr!43814 _values!1320) (store mapRest!57056 mapKey!57056 mapValue!57056))))

(declare-fun b!1336482 () Bool)

(assert (=> b!1336482 (= e!761091 (not true))))

(declare-datatypes ((tuple2!23904 0))(
  ( (tuple2!23905 (_1!11963 (_ BitVec 64)) (_2!11963 V!54329)) )
))
(declare-datatypes ((List!31046 0))(
  ( (Nil!31043) (Cons!31042 (h!32251 tuple2!23904) (t!45336 List!31046)) )
))
(declare-datatypes ((ListLongMap!21561 0))(
  ( (ListLongMap!21562 (toList!10796 List!31046)) )
))
(declare-fun lt!592781 () ListLongMap!21561)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun contains!8961 (ListLongMap!21561 (_ BitVec 64)) Bool)

(assert (=> b!1336482 (contains!8961 lt!592781 k!1153)))

(declare-datatypes ((Unit!43924 0))(
  ( (Unit!43925) )
))
(declare-fun lt!592780 () Unit!43924)

(declare-fun minValue!1262 () V!54329)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!317 ((_ BitVec 64) (_ BitVec 64) V!54329 ListLongMap!21561) Unit!43924)

(assert (=> b!1336482 (= lt!592780 (lemmaInListMapAfterAddingDiffThenInBefore!317 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592781))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!54329)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun +!4738 (ListLongMap!21561 tuple2!23904) ListLongMap!21561)

(declare-fun getCurrentListMapNoExtraKeys!6380 (array!90700 array!90698 (_ BitVec 32) (_ BitVec 32) V!54329 V!54329 (_ BitVec 32) Int) ListLongMap!21561)

(declare-fun get!22107 (ValueCell!17561 V!54329) V!54329)

(declare-fun dynLambda!3677 (Int (_ BitVec 64)) V!54329)

(assert (=> b!1336482 (= lt!592781 (+!4738 (getCurrentListMapNoExtraKeys!6380 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23905 (select (arr!43815 _keys!1590) from!1980) (get!22107 (select (arr!43814 _values!1320) from!1980) (dynLambda!3677 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1336483 () Bool)

(declare-fun res!886941 () Bool)

(assert (=> b!1336483 (=> (not res!886941) (not e!761091))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1336483 (= res!886941 (validKeyInArray!0 (select (arr!43815 _keys!1590) from!1980)))))

(declare-fun b!1336484 () Bool)

(declare-fun res!886938 () Bool)

(assert (=> b!1336484 (=> (not res!886938) (not e!761091))))

(assert (=> b!1336484 (= res!886938 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44365 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57056 () Bool)

(assert (=> mapIsEmpty!57056 mapRes!57056))

(declare-fun b!1336485 () Bool)

(declare-fun tp_is_empty!36919 () Bool)

(assert (=> b!1336485 (= e!761094 tp_is_empty!36919)))

(declare-fun res!886935 () Bool)

(assert (=> start!112672 (=> (not res!886935) (not e!761091))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112672 (= res!886935 (validMask!0 mask!1998))))

(assert (=> start!112672 e!761091))

(declare-fun e!761095 () Bool)

(declare-fun array_inv!33041 (array!90698) Bool)

(assert (=> start!112672 (and (array_inv!33041 _values!1320) e!761095)))

(assert (=> start!112672 true))

(declare-fun array_inv!33042 (array!90700) Bool)

(assert (=> start!112672 (array_inv!33042 _keys!1590)))

(assert (=> start!112672 tp!108668))

(assert (=> start!112672 tp_is_empty!36919))

(declare-fun b!1336486 () Bool)

(declare-fun res!886937 () Bool)

(assert (=> b!1336486 (=> (not res!886937) (not e!761091))))

(assert (=> b!1336486 (= res!886937 (not (= (select (arr!43815 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1336487 () Bool)

(declare-fun res!886940 () Bool)

(assert (=> b!1336487 (=> (not res!886940) (not e!761091))))

(declare-fun getCurrentListMap!5768 (array!90700 array!90698 (_ BitVec 32) (_ BitVec 32) V!54329 V!54329 (_ BitVec 32) Int) ListLongMap!21561)

(assert (=> b!1336487 (= res!886940 (contains!8961 (getCurrentListMap!5768 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1336488 () Bool)

(declare-fun res!886936 () Bool)

(assert (=> b!1336488 (=> (not res!886936) (not e!761091))))

(assert (=> b!1336488 (= res!886936 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1336489 () Bool)

(declare-fun res!886943 () Bool)

(assert (=> b!1336489 (=> (not res!886943) (not e!761091))))

(declare-datatypes ((List!31047 0))(
  ( (Nil!31044) (Cons!31043 (h!32252 (_ BitVec 64)) (t!45337 List!31047)) )
))
(declare-fun arrayNoDuplicates!0 (array!90700 (_ BitVec 32) List!31047) Bool)

(assert (=> b!1336489 (= res!886943 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31044))))

(declare-fun b!1336490 () Bool)

(declare-fun res!886942 () Bool)

(assert (=> b!1336490 (=> (not res!886942) (not e!761091))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90700 (_ BitVec 32)) Bool)

(assert (=> b!1336490 (= res!886942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1336491 () Bool)

(declare-fun e!761093 () Bool)

(assert (=> b!1336491 (= e!761093 tp_is_empty!36919)))

(declare-fun b!1336492 () Bool)

(assert (=> b!1336492 (= e!761095 (and e!761093 mapRes!57056))))

(declare-fun condMapEmpty!57056 () Bool)

(declare-fun mapDefault!57056 () ValueCell!17561)

