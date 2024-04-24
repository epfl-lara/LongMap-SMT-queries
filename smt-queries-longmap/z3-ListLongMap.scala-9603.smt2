; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113762 () Bool)

(assert start!113762)

(declare-fun b_free!31531 () Bool)

(declare-fun b_next!31531 () Bool)

(assert (=> start!113762 (= b_free!31531 (not b_next!31531))))

(declare-fun tp!110401 () Bool)

(declare-fun b_and!50853 () Bool)

(assert (=> start!113762 (= tp!110401 b_and!50853)))

(declare-fun b!1349030 () Bool)

(declare-fun res!894740 () Bool)

(declare-fun e!767627 () Bool)

(assert (=> b!1349030 (=> (not res!894740) (not e!767627))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!92005 0))(
  ( (array!92006 (arr!44453 (Array (_ BitVec 32) (_ BitVec 64))) (size!45004 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!92005)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1349030 (= res!894740 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45004 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1349031 () Bool)

(declare-fun res!894748 () Bool)

(assert (=> b!1349031 (=> (not res!894748) (not e!767627))))

(declare-datatypes ((V!55145 0))(
  ( (V!55146 (val!18840 Int)) )
))
(declare-fun minValue!1245 () V!55145)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!55145)

(declare-datatypes ((ValueCell!17867 0))(
  ( (ValueCellFull!17867 (v!21486 V!55145)) (EmptyCell!17867) )
))
(declare-datatypes ((array!92007 0))(
  ( (array!92008 (arr!44454 (Array (_ BitVec 32) ValueCell!17867)) (size!45005 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!92007)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24340 0))(
  ( (tuple2!24341 (_1!12181 (_ BitVec 64)) (_2!12181 V!55145)) )
))
(declare-datatypes ((List!31479 0))(
  ( (Nil!31476) (Cons!31475 (h!32693 tuple2!24340) (t!46081 List!31479)) )
))
(declare-datatypes ((ListLongMap!22005 0))(
  ( (ListLongMap!22006 (toList!11018 List!31479)) )
))
(declare-fun contains!9207 (ListLongMap!22005 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5956 (array!92005 array!92007 (_ BitVec 32) (_ BitVec 32) V!55145 V!55145 (_ BitVec 32) Int) ListLongMap!22005)

(assert (=> b!1349031 (= res!894748 (contains!9207 (getCurrentListMap!5956 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1349032 () Bool)

(declare-fun e!767629 () Bool)

(declare-fun tp_is_empty!37531 () Bool)

(assert (=> b!1349032 (= e!767629 tp_is_empty!37531)))

(declare-fun res!894744 () Bool)

(assert (=> start!113762 (=> (not res!894744) (not e!767627))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113762 (= res!894744 (validMask!0 mask!1977))))

(assert (=> start!113762 e!767627))

(assert (=> start!113762 tp_is_empty!37531))

(assert (=> start!113762 true))

(declare-fun array_inv!33749 (array!92005) Bool)

(assert (=> start!113762 (array_inv!33749 _keys!1571)))

(declare-fun e!767626 () Bool)

(declare-fun array_inv!33750 (array!92007) Bool)

(assert (=> start!113762 (and (array_inv!33750 _values!1303) e!767626)))

(assert (=> start!113762 tp!110401))

(declare-fun b!1349033 () Bool)

(declare-fun res!894747 () Bool)

(assert (=> b!1349033 (=> (not res!894747) (not e!767627))))

(assert (=> b!1349033 (= res!894747 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1349034 () Bool)

(declare-fun res!894741 () Bool)

(assert (=> b!1349034 (=> (not res!894741) (not e!767627))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!92005 (_ BitVec 32)) Bool)

(assert (=> b!1349034 (= res!894741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1349035 () Bool)

(declare-fun mapRes!58007 () Bool)

(assert (=> b!1349035 (= e!767626 (and e!767629 mapRes!58007))))

(declare-fun condMapEmpty!58007 () Bool)

(declare-fun mapDefault!58007 () ValueCell!17867)

(assert (=> b!1349035 (= condMapEmpty!58007 (= (arr!44454 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17867)) mapDefault!58007)))))

(declare-fun b!1349036 () Bool)

(declare-fun res!894746 () Bool)

(assert (=> b!1349036 (=> (not res!894746) (not e!767627))))

(assert (=> b!1349036 (= res!894746 (not (= (select (arr!44453 _keys!1571) from!1960) k0!1142)))))

(declare-fun mapNonEmpty!58007 () Bool)

(declare-fun tp!110402 () Bool)

(declare-fun e!767628 () Bool)

(assert (=> mapNonEmpty!58007 (= mapRes!58007 (and tp!110402 e!767628))))

(declare-fun mapRest!58007 () (Array (_ BitVec 32) ValueCell!17867))

(declare-fun mapKey!58007 () (_ BitVec 32))

(declare-fun mapValue!58007 () ValueCell!17867)

(assert (=> mapNonEmpty!58007 (= (arr!44454 _values!1303) (store mapRest!58007 mapKey!58007 mapValue!58007))))

(declare-fun b!1349037 () Bool)

(assert (=> b!1349037 (= e!767627 (not (bvslt from!1960 (size!45005 _values!1303))))))

(declare-fun lt!596328 () ListLongMap!22005)

(assert (=> b!1349037 (contains!9207 lt!596328 k0!1142)))

(declare-datatypes ((Unit!44095 0))(
  ( (Unit!44096) )
))
(declare-fun lt!596327 () Unit!44095)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!396 ((_ BitVec 64) (_ BitVec 64) V!55145 ListLongMap!22005) Unit!44095)

(assert (=> b!1349037 (= lt!596327 (lemmaInListMapAfterAddingDiffThenInBefore!396 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!596328))))

(declare-fun +!4880 (ListLongMap!22005 tuple2!24340) ListLongMap!22005)

(declare-fun getCurrentListMapNoExtraKeys!6533 (array!92005 array!92007 (_ BitVec 32) (_ BitVec 32) V!55145 V!55145 (_ BitVec 32) Int) ListLongMap!22005)

(declare-fun get!22469 (ValueCell!17867 V!55145) V!55145)

(declare-fun dynLambda!3834 (Int (_ BitVec 64)) V!55145)

(assert (=> b!1349037 (= lt!596328 (+!4880 (getCurrentListMapNoExtraKeys!6533 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24341 (select (arr!44453 _keys!1571) from!1960) (get!22469 (select (arr!44454 _values!1303) from!1960) (dynLambda!3834 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!58007 () Bool)

(assert (=> mapIsEmpty!58007 mapRes!58007))

(declare-fun b!1349038 () Bool)

(declare-fun res!894742 () Bool)

(assert (=> b!1349038 (=> (not res!894742) (not e!767627))))

(declare-datatypes ((List!31480 0))(
  ( (Nil!31477) (Cons!31476 (h!32694 (_ BitVec 64)) (t!46082 List!31480)) )
))
(declare-fun arrayNoDuplicates!0 (array!92005 (_ BitVec 32) List!31480) Bool)

(assert (=> b!1349038 (= res!894742 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31477))))

(declare-fun b!1349039 () Bool)

(declare-fun res!894743 () Bool)

(assert (=> b!1349039 (=> (not res!894743) (not e!767627))))

(assert (=> b!1349039 (= res!894743 (and (= (size!45005 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!45004 _keys!1571) (size!45005 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1349040 () Bool)

(declare-fun res!894745 () Bool)

(assert (=> b!1349040 (=> (not res!894745) (not e!767627))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1349040 (= res!894745 (validKeyInArray!0 (select (arr!44453 _keys!1571) from!1960)))))

(declare-fun b!1349041 () Bool)

(assert (=> b!1349041 (= e!767628 tp_is_empty!37531)))

(assert (= (and start!113762 res!894744) b!1349039))

(assert (= (and b!1349039 res!894743) b!1349034))

(assert (= (and b!1349034 res!894741) b!1349038))

(assert (= (and b!1349038 res!894742) b!1349030))

(assert (= (and b!1349030 res!894740) b!1349031))

(assert (= (and b!1349031 res!894748) b!1349036))

(assert (= (and b!1349036 res!894746) b!1349040))

(assert (= (and b!1349040 res!894745) b!1349033))

(assert (= (and b!1349033 res!894747) b!1349037))

(assert (= (and b!1349035 condMapEmpty!58007) mapIsEmpty!58007))

(assert (= (and b!1349035 (not condMapEmpty!58007)) mapNonEmpty!58007))

(get-info :version)

(assert (= (and mapNonEmpty!58007 ((_ is ValueCellFull!17867) mapValue!58007)) b!1349041))

(assert (= (and b!1349035 ((_ is ValueCellFull!17867) mapDefault!58007)) b!1349032))

(assert (= start!113762 b!1349035))

(declare-fun b_lambda!24599 () Bool)

(assert (=> (not b_lambda!24599) (not b!1349037)))

(declare-fun t!46080 () Bool)

(declare-fun tb!12405 () Bool)

(assert (=> (and start!113762 (= defaultEntry!1306 defaultEntry!1306) t!46080) tb!12405))

(declare-fun result!25911 () Bool)

(assert (=> tb!12405 (= result!25911 tp_is_empty!37531)))

(assert (=> b!1349037 t!46080))

(declare-fun b_and!50855 () Bool)

(assert (= b_and!50853 (and (=> t!46080 result!25911) b_and!50855)))

(declare-fun m!1236385 () Bool)

(assert (=> b!1349034 m!1236385))

(declare-fun m!1236387 () Bool)

(assert (=> b!1349038 m!1236387))

(declare-fun m!1236389 () Bool)

(assert (=> b!1349040 m!1236389))

(assert (=> b!1349040 m!1236389))

(declare-fun m!1236391 () Bool)

(assert (=> b!1349040 m!1236391))

(assert (=> b!1349036 m!1236389))

(declare-fun m!1236393 () Bool)

(assert (=> start!113762 m!1236393))

(declare-fun m!1236395 () Bool)

(assert (=> start!113762 m!1236395))

(declare-fun m!1236397 () Bool)

(assert (=> start!113762 m!1236397))

(declare-fun m!1236399 () Bool)

(assert (=> b!1349031 m!1236399))

(assert (=> b!1349031 m!1236399))

(declare-fun m!1236401 () Bool)

(assert (=> b!1349031 m!1236401))

(declare-fun m!1236403 () Bool)

(assert (=> b!1349037 m!1236403))

(declare-fun m!1236405 () Bool)

(assert (=> b!1349037 m!1236405))

(declare-fun m!1236407 () Bool)

(assert (=> b!1349037 m!1236407))

(declare-fun m!1236409 () Bool)

(assert (=> b!1349037 m!1236409))

(assert (=> b!1349037 m!1236403))

(declare-fun m!1236411 () Bool)

(assert (=> b!1349037 m!1236411))

(assert (=> b!1349037 m!1236405))

(declare-fun m!1236413 () Bool)

(assert (=> b!1349037 m!1236413))

(assert (=> b!1349037 m!1236407))

(declare-fun m!1236415 () Bool)

(assert (=> b!1349037 m!1236415))

(assert (=> b!1349037 m!1236389))

(declare-fun m!1236417 () Bool)

(assert (=> mapNonEmpty!58007 m!1236417))

(check-sat (not b_next!31531) (not b!1349037) (not mapNonEmpty!58007) (not b!1349031) (not b_lambda!24599) (not start!113762) (not b!1349034) b_and!50855 tp_is_empty!37531 (not b!1349038) (not b!1349040))
(check-sat b_and!50855 (not b_next!31531))
