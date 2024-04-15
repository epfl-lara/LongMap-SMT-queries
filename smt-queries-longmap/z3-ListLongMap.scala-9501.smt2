; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112672 () Bool)

(assert start!112672)

(declare-fun b_free!31009 () Bool)

(declare-fun b_next!31009 () Bool)

(assert (=> start!112672 (= b_free!31009 (not b_next!31009))))

(declare-fun tp!108668 () Bool)

(declare-fun b_and!49937 () Bool)

(assert (=> start!112672 (= tp!108668 b_and!49937)))

(declare-fun b!1336411 () Bool)

(declare-fun res!886910 () Bool)

(declare-fun e!761059 () Bool)

(assert (=> b!1336411 (=> (not res!886910) (not e!761059))))

(declare-datatypes ((V!54329 0))(
  ( (V!54330 (val!18534 Int)) )
))
(declare-datatypes ((ValueCell!17561 0))(
  ( (ValueCellFull!17561 (v!21173 V!54329)) (EmptyCell!17561) )
))
(declare-datatypes ((array!90645 0))(
  ( (array!90646 (arr!43788 (Array (_ BitVec 32) ValueCell!17561)) (size!44340 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90645)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90647 0))(
  ( (array!90648 (arr!43789 (Array (_ BitVec 32) (_ BitVec 64))) (size!44341 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90647)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54329)

(declare-fun zeroValue!1262 () V!54329)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23970 0))(
  ( (tuple2!23971 (_1!11996 (_ BitVec 64)) (_2!11996 V!54329)) )
))
(declare-datatypes ((List!31102 0))(
  ( (Nil!31099) (Cons!31098 (h!32307 tuple2!23970) (t!45384 List!31102)) )
))
(declare-datatypes ((ListLongMap!21627 0))(
  ( (ListLongMap!21628 (toList!10829 List!31102)) )
))
(declare-fun contains!8923 (ListLongMap!21627 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5682 (array!90647 array!90645 (_ BitVec 32) (_ BitVec 32) V!54329 V!54329 (_ BitVec 32) Int) ListLongMap!21627)

(assert (=> b!1336411 (= res!886910 (contains!8923 (getCurrentListMap!5682 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1336412 () Bool)

(declare-fun res!886911 () Bool)

(assert (=> b!1336412 (=> (not res!886911) (not e!761059))))

(declare-datatypes ((List!31103 0))(
  ( (Nil!31100) (Cons!31099 (h!32308 (_ BitVec 64)) (t!45385 List!31103)) )
))
(declare-fun arrayNoDuplicates!0 (array!90647 (_ BitVec 32) List!31103) Bool)

(assert (=> b!1336412 (= res!886911 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31100))))

(declare-fun b!1336413 () Bool)

(declare-fun res!886907 () Bool)

(assert (=> b!1336413 (=> (not res!886907) (not e!761059))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90647 (_ BitVec 32)) Bool)

(assert (=> b!1336413 (= res!886907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1336414 () Bool)

(assert (=> b!1336414 (= e!761059 (not true))))

(declare-fun lt!592594 () ListLongMap!21627)

(assert (=> b!1336414 (contains!8923 lt!592594 k0!1153)))

(declare-datatypes ((Unit!43729 0))(
  ( (Unit!43730) )
))
(declare-fun lt!592595 () Unit!43729)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!307 ((_ BitVec 64) (_ BitVec 64) V!54329 ListLongMap!21627) Unit!43729)

(assert (=> b!1336414 (= lt!592595 (lemmaInListMapAfterAddingDiffThenInBefore!307 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592594))))

(declare-fun +!4762 (ListLongMap!21627 tuple2!23970) ListLongMap!21627)

(declare-fun getCurrentListMapNoExtraKeys!6405 (array!90647 array!90645 (_ BitVec 32) (_ BitVec 32) V!54329 V!54329 (_ BitVec 32) Int) ListLongMap!21627)

(declare-fun get!22098 (ValueCell!17561 V!54329) V!54329)

(declare-fun dynLambda!3692 (Int (_ BitVec 64)) V!54329)

(assert (=> b!1336414 (= lt!592594 (+!4762 (getCurrentListMapNoExtraKeys!6405 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23971 (select (arr!43789 _keys!1590) from!1980) (get!22098 (select (arr!43788 _values!1320) from!1980) (dynLambda!3692 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!886908 () Bool)

(assert (=> start!112672 (=> (not res!886908) (not e!761059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112672 (= res!886908 (validMask!0 mask!1998))))

(assert (=> start!112672 e!761059))

(declare-fun e!761061 () Bool)

(declare-fun array_inv!33217 (array!90645) Bool)

(assert (=> start!112672 (and (array_inv!33217 _values!1320) e!761061)))

(assert (=> start!112672 true))

(declare-fun array_inv!33218 (array!90647) Bool)

(assert (=> start!112672 (array_inv!33218 _keys!1590)))

(assert (=> start!112672 tp!108668))

(declare-fun tp_is_empty!36919 () Bool)

(assert (=> start!112672 tp_is_empty!36919))

(declare-fun b!1336415 () Bool)

(declare-fun res!886913 () Bool)

(assert (=> b!1336415 (=> (not res!886913) (not e!761059))))

(assert (=> b!1336415 (= res!886913 (and (= (size!44340 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44341 _keys!1590) (size!44340 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1336416 () Bool)

(declare-fun e!761060 () Bool)

(assert (=> b!1336416 (= e!761060 tp_is_empty!36919)))

(declare-fun b!1336417 () Bool)

(declare-fun res!886909 () Bool)

(assert (=> b!1336417 (=> (not res!886909) (not e!761059))))

(assert (=> b!1336417 (= res!886909 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44341 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57056 () Bool)

(declare-fun mapRes!57056 () Bool)

(assert (=> mapIsEmpty!57056 mapRes!57056))

(declare-fun b!1336418 () Bool)

(declare-fun e!761062 () Bool)

(assert (=> b!1336418 (= e!761062 tp_is_empty!36919)))

(declare-fun b!1336419 () Bool)

(declare-fun res!886914 () Bool)

(assert (=> b!1336419 (=> (not res!886914) (not e!761059))))

(assert (=> b!1336419 (= res!886914 (not (= (select (arr!43789 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1336420 () Bool)

(assert (=> b!1336420 (= e!761061 (and e!761062 mapRes!57056))))

(declare-fun condMapEmpty!57056 () Bool)

(declare-fun mapDefault!57056 () ValueCell!17561)

(assert (=> b!1336420 (= condMapEmpty!57056 (= (arr!43788 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17561)) mapDefault!57056)))))

(declare-fun b!1336421 () Bool)

(declare-fun res!886906 () Bool)

(assert (=> b!1336421 (=> (not res!886906) (not e!761059))))

(assert (=> b!1336421 (= res!886906 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!57056 () Bool)

(declare-fun tp!108669 () Bool)

(assert (=> mapNonEmpty!57056 (= mapRes!57056 (and tp!108669 e!761060))))

(declare-fun mapKey!57056 () (_ BitVec 32))

(declare-fun mapValue!57056 () ValueCell!17561)

(declare-fun mapRest!57056 () (Array (_ BitVec 32) ValueCell!17561))

(assert (=> mapNonEmpty!57056 (= (arr!43788 _values!1320) (store mapRest!57056 mapKey!57056 mapValue!57056))))

(declare-fun b!1336422 () Bool)

(declare-fun res!886912 () Bool)

(assert (=> b!1336422 (=> (not res!886912) (not e!761059))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1336422 (= res!886912 (validKeyInArray!0 (select (arr!43789 _keys!1590) from!1980)))))

(assert (= (and start!112672 res!886908) b!1336415))

(assert (= (and b!1336415 res!886913) b!1336413))

(assert (= (and b!1336413 res!886907) b!1336412))

(assert (= (and b!1336412 res!886911) b!1336417))

(assert (= (and b!1336417 res!886909) b!1336411))

(assert (= (and b!1336411 res!886910) b!1336419))

(assert (= (and b!1336419 res!886914) b!1336422))

(assert (= (and b!1336422 res!886912) b!1336421))

(assert (= (and b!1336421 res!886906) b!1336414))

(assert (= (and b!1336420 condMapEmpty!57056) mapIsEmpty!57056))

(assert (= (and b!1336420 (not condMapEmpty!57056)) mapNonEmpty!57056))

(get-info :version)

(assert (= (and mapNonEmpty!57056 ((_ is ValueCellFull!17561) mapValue!57056)) b!1336416))

(assert (= (and b!1336420 ((_ is ValueCellFull!17561) mapDefault!57056)) b!1336418))

(assert (= start!112672 b!1336420))

(declare-fun b_lambda!24157 () Bool)

(assert (=> (not b_lambda!24157) (not b!1336414)))

(declare-fun t!45383 () Bool)

(declare-fun tb!12085 () Bool)

(assert (=> (and start!112672 (= defaultEntry!1323 defaultEntry!1323) t!45383) tb!12085))

(declare-fun result!25251 () Bool)

(assert (=> tb!12085 (= result!25251 tp_is_empty!36919)))

(assert (=> b!1336414 t!45383))

(declare-fun b_and!49939 () Bool)

(assert (= b_and!49937 (and (=> t!45383 result!25251) b_and!49939)))

(declare-fun m!1224049 () Bool)

(assert (=> mapNonEmpty!57056 m!1224049))

(declare-fun m!1224051 () Bool)

(assert (=> b!1336411 m!1224051))

(assert (=> b!1336411 m!1224051))

(declare-fun m!1224053 () Bool)

(assert (=> b!1336411 m!1224053))

(declare-fun m!1224055 () Bool)

(assert (=> b!1336414 m!1224055))

(declare-fun m!1224057 () Bool)

(assert (=> b!1336414 m!1224057))

(declare-fun m!1224059 () Bool)

(assert (=> b!1336414 m!1224059))

(declare-fun m!1224061 () Bool)

(assert (=> b!1336414 m!1224061))

(assert (=> b!1336414 m!1224055))

(declare-fun m!1224063 () Bool)

(assert (=> b!1336414 m!1224063))

(declare-fun m!1224065 () Bool)

(assert (=> b!1336414 m!1224065))

(assert (=> b!1336414 m!1224061))

(declare-fun m!1224067 () Bool)

(assert (=> b!1336414 m!1224067))

(assert (=> b!1336414 m!1224057))

(declare-fun m!1224069 () Bool)

(assert (=> b!1336414 m!1224069))

(declare-fun m!1224071 () Bool)

(assert (=> b!1336412 m!1224071))

(declare-fun m!1224073 () Bool)

(assert (=> start!112672 m!1224073))

(declare-fun m!1224075 () Bool)

(assert (=> start!112672 m!1224075))

(declare-fun m!1224077 () Bool)

(assert (=> start!112672 m!1224077))

(assert (=> b!1336419 m!1224067))

(declare-fun m!1224079 () Bool)

(assert (=> b!1336413 m!1224079))

(assert (=> b!1336422 m!1224067))

(assert (=> b!1336422 m!1224067))

(declare-fun m!1224081 () Bool)

(assert (=> b!1336422 m!1224081))

(check-sat (not b_next!31009) (not b!1336411) tp_is_empty!36919 (not b!1336412) b_and!49939 (not b!1336413) (not b_lambda!24157) (not b!1336422) (not mapNonEmpty!57056) (not start!112672) (not b!1336414))
(check-sat b_and!49939 (not b_next!31009))
