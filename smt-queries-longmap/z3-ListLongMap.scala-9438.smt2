; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112236 () Bool)

(assert start!112236)

(declare-fun b_free!30631 () Bool)

(declare-fun b_next!30631 () Bool)

(assert (=> start!112236 (= b_free!30631 (not b_next!30631))))

(declare-fun tp!107530 () Bool)

(declare-fun b_and!49299 () Bool)

(assert (=> start!112236 (= tp!107530 b_and!49299)))

(declare-fun b!1329481 () Bool)

(declare-fun e!757899 () Bool)

(assert (=> b!1329481 (= e!757899 (not true))))

(declare-datatypes ((V!53825 0))(
  ( (V!53826 (val!18345 Int)) )
))
(declare-datatypes ((tuple2!23680 0))(
  ( (tuple2!23681 (_1!11851 (_ BitVec 64)) (_2!11851 V!53825)) )
))
(declare-datatypes ((List!30829 0))(
  ( (Nil!30826) (Cons!30825 (h!32034 tuple2!23680) (t!44865 List!30829)) )
))
(declare-datatypes ((ListLongMap!21337 0))(
  ( (ListLongMap!21338 (toList!10684 List!30829)) )
))
(declare-fun lt!590788 () ListLongMap!21337)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8776 (ListLongMap!21337 (_ BitVec 64)) Bool)

(assert (=> b!1329481 (contains!8776 lt!590788 k0!1153)))

(declare-datatypes ((Unit!43552 0))(
  ( (Unit!43553) )
))
(declare-fun lt!590787 () Unit!43552)

(declare-fun minValue!1262 () V!53825)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!226 ((_ BitVec 64) (_ BitVec 64) V!53825 ListLongMap!21337) Unit!43552)

(assert (=> b!1329481 (= lt!590787 (lemmaInListMapAfterAddingDiffThenInBefore!226 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!590788))))

(declare-datatypes ((ValueCell!17372 0))(
  ( (ValueCellFull!17372 (v!20981 V!53825)) (EmptyCell!17372) )
))
(declare-datatypes ((array!89907 0))(
  ( (array!89908 (arr!43420 (Array (_ BitVec 32) ValueCell!17372)) (size!43972 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89907)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89909 0))(
  ( (array!89910 (arr!43421 (Array (_ BitVec 32) (_ BitVec 64))) (size!43973 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89909)

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!53825)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun +!4670 (ListLongMap!21337 tuple2!23680) ListLongMap!21337)

(declare-fun getCurrentListMapNoExtraKeys!6308 (array!89909 array!89907 (_ BitVec 32) (_ BitVec 32) V!53825 V!53825 (_ BitVec 32) Int) ListLongMap!21337)

(declare-fun get!21877 (ValueCell!17372 V!53825) V!53825)

(declare-fun dynLambda!3600 (Int (_ BitVec 64)) V!53825)

(assert (=> b!1329481 (= lt!590788 (+!4670 (getCurrentListMapNoExtraKeys!6308 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23681 (select (arr!43421 _keys!1590) from!1980) (get!21877 (select (arr!43420 _values!1320) from!1980) (dynLambda!3600 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1329482 () Bool)

(declare-fun res!882148 () Bool)

(assert (=> b!1329482 (=> (not res!882148) (not e!757899))))

(assert (=> b!1329482 (= res!882148 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!56485 () Bool)

(declare-fun mapRes!56485 () Bool)

(declare-fun tp!107531 () Bool)

(declare-fun e!757903 () Bool)

(assert (=> mapNonEmpty!56485 (= mapRes!56485 (and tp!107531 e!757903))))

(declare-fun mapKey!56485 () (_ BitVec 32))

(declare-fun mapRest!56485 () (Array (_ BitVec 32) ValueCell!17372))

(declare-fun mapValue!56485 () ValueCell!17372)

(assert (=> mapNonEmpty!56485 (= (arr!43420 _values!1320) (store mapRest!56485 mapKey!56485 mapValue!56485))))

(declare-fun b!1329483 () Bool)

(declare-fun res!882151 () Bool)

(assert (=> b!1329483 (=> (not res!882151) (not e!757899))))

(assert (=> b!1329483 (= res!882151 (not (= (select (arr!43421 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1329484 () Bool)

(declare-fun res!882153 () Bool)

(assert (=> b!1329484 (=> (not res!882153) (not e!757899))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1329484 (= res!882153 (validKeyInArray!0 (select (arr!43421 _keys!1590) from!1980)))))

(declare-fun b!1329485 () Bool)

(declare-fun res!882152 () Bool)

(assert (=> b!1329485 (=> (not res!882152) (not e!757899))))

(declare-fun getCurrentListMap!5554 (array!89909 array!89907 (_ BitVec 32) (_ BitVec 32) V!53825 V!53825 (_ BitVec 32) Int) ListLongMap!21337)

(assert (=> b!1329485 (= res!882152 (contains!8776 (getCurrentListMap!5554 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1329486 () Bool)

(declare-fun res!882147 () Bool)

(assert (=> b!1329486 (=> (not res!882147) (not e!757899))))

(assert (=> b!1329486 (= res!882147 (and (= (size!43972 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43973 _keys!1590) (size!43972 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun res!882154 () Bool)

(assert (=> start!112236 (=> (not res!882154) (not e!757899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112236 (= res!882154 (validMask!0 mask!1998))))

(assert (=> start!112236 e!757899))

(declare-fun e!757902 () Bool)

(declare-fun array_inv!32931 (array!89907) Bool)

(assert (=> start!112236 (and (array_inv!32931 _values!1320) e!757902)))

(assert (=> start!112236 true))

(declare-fun array_inv!32932 (array!89909) Bool)

(assert (=> start!112236 (array_inv!32932 _keys!1590)))

(assert (=> start!112236 tp!107530))

(declare-fun tp_is_empty!36541 () Bool)

(assert (=> start!112236 tp_is_empty!36541))

(declare-fun mapIsEmpty!56485 () Bool)

(assert (=> mapIsEmpty!56485 mapRes!56485))

(declare-fun b!1329487 () Bool)

(declare-fun e!757901 () Bool)

(assert (=> b!1329487 (= e!757902 (and e!757901 mapRes!56485))))

(declare-fun condMapEmpty!56485 () Bool)

(declare-fun mapDefault!56485 () ValueCell!17372)

(assert (=> b!1329487 (= condMapEmpty!56485 (= (arr!43420 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17372)) mapDefault!56485)))))

(declare-fun b!1329488 () Bool)

(declare-fun res!882149 () Bool)

(assert (=> b!1329488 (=> (not res!882149) (not e!757899))))

(declare-datatypes ((List!30830 0))(
  ( (Nil!30827) (Cons!30826 (h!32035 (_ BitVec 64)) (t!44866 List!30830)) )
))
(declare-fun arrayNoDuplicates!0 (array!89909 (_ BitVec 32) List!30830) Bool)

(assert (=> b!1329488 (= res!882149 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30827))))

(declare-fun b!1329489 () Bool)

(declare-fun res!882150 () Bool)

(assert (=> b!1329489 (=> (not res!882150) (not e!757899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89909 (_ BitVec 32)) Bool)

(assert (=> b!1329489 (= res!882150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329490 () Bool)

(assert (=> b!1329490 (= e!757903 tp_is_empty!36541)))

(declare-fun b!1329491 () Bool)

(declare-fun res!882146 () Bool)

(assert (=> b!1329491 (=> (not res!882146) (not e!757899))))

(assert (=> b!1329491 (= res!882146 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43973 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1329492 () Bool)

(assert (=> b!1329492 (= e!757901 tp_is_empty!36541)))

(assert (= (and start!112236 res!882154) b!1329486))

(assert (= (and b!1329486 res!882147) b!1329489))

(assert (= (and b!1329489 res!882150) b!1329488))

(assert (= (and b!1329488 res!882149) b!1329491))

(assert (= (and b!1329491 res!882146) b!1329485))

(assert (= (and b!1329485 res!882152) b!1329483))

(assert (= (and b!1329483 res!882151) b!1329484))

(assert (= (and b!1329484 res!882153) b!1329482))

(assert (= (and b!1329482 res!882148) b!1329481))

(assert (= (and b!1329487 condMapEmpty!56485) mapIsEmpty!56485))

(assert (= (and b!1329487 (not condMapEmpty!56485)) mapNonEmpty!56485))

(get-info :version)

(assert (= (and mapNonEmpty!56485 ((_ is ValueCellFull!17372) mapValue!56485)) b!1329490))

(assert (= (and b!1329487 ((_ is ValueCellFull!17372) mapDefault!56485)) b!1329492))

(assert (= start!112236 b!1329487))

(declare-fun b_lambda!23881 () Bool)

(assert (=> (not b_lambda!23881) (not b!1329481)))

(declare-fun t!44864 () Bool)

(declare-fun tb!11839 () Bool)

(assert (=> (and start!112236 (= defaultEntry!1323 defaultEntry!1323) t!44864) tb!11839))

(declare-fun result!24757 () Bool)

(assert (=> tb!11839 (= result!24757 tp_is_empty!36541)))

(assert (=> b!1329481 t!44864))

(declare-fun b_and!49301 () Bool)

(assert (= b_and!49299 (and (=> t!44864 result!24757) b_and!49301)))

(declare-fun m!1217781 () Bool)

(assert (=> start!112236 m!1217781))

(declare-fun m!1217783 () Bool)

(assert (=> start!112236 m!1217783))

(declare-fun m!1217785 () Bool)

(assert (=> start!112236 m!1217785))

(declare-fun m!1217787 () Bool)

(assert (=> b!1329489 m!1217787))

(declare-fun m!1217789 () Bool)

(assert (=> b!1329483 m!1217789))

(declare-fun m!1217791 () Bool)

(assert (=> mapNonEmpty!56485 m!1217791))

(declare-fun m!1217793 () Bool)

(assert (=> b!1329488 m!1217793))

(declare-fun m!1217795 () Bool)

(assert (=> b!1329485 m!1217795))

(assert (=> b!1329485 m!1217795))

(declare-fun m!1217797 () Bool)

(assert (=> b!1329485 m!1217797))

(assert (=> b!1329484 m!1217789))

(assert (=> b!1329484 m!1217789))

(declare-fun m!1217799 () Bool)

(assert (=> b!1329484 m!1217799))

(declare-fun m!1217801 () Bool)

(assert (=> b!1329481 m!1217801))

(declare-fun m!1217803 () Bool)

(assert (=> b!1329481 m!1217803))

(declare-fun m!1217805 () Bool)

(assert (=> b!1329481 m!1217805))

(declare-fun m!1217807 () Bool)

(assert (=> b!1329481 m!1217807))

(assert (=> b!1329481 m!1217801))

(declare-fun m!1217809 () Bool)

(assert (=> b!1329481 m!1217809))

(declare-fun m!1217811 () Bool)

(assert (=> b!1329481 m!1217811))

(declare-fun m!1217813 () Bool)

(assert (=> b!1329481 m!1217813))

(assert (=> b!1329481 m!1217803))

(assert (=> b!1329481 m!1217807))

(assert (=> b!1329481 m!1217789))

(check-sat (not b!1329481) (not b_lambda!23881) (not b_next!30631) (not b!1329485) (not b!1329489) (not start!112236) b_and!49301 (not b!1329488) (not mapNonEmpty!56485) tp_is_empty!36541 (not b!1329484))
(check-sat b_and!49301 (not b_next!30631))
