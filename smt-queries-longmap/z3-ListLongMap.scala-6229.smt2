; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79648 () Bool)

(assert start!79648)

(declare-fun b_free!17697 () Bool)

(declare-fun b_next!17697 () Bool)

(assert (=> start!79648 (= b_free!17697 (not b_next!17697))))

(declare-fun tp!61546 () Bool)

(declare-fun b_and!28985 () Bool)

(assert (=> start!79648 (= tp!61546 b_and!28985)))

(declare-fun b!936388 () Bool)

(declare-fun e!525779 () Bool)

(declare-fun e!525777 () Bool)

(assert (=> b!936388 (= e!525779 e!525777)))

(declare-fun res!630512 () Bool)

(assert (=> b!936388 (=> (not res!630512) (not e!525777))))

(declare-datatypes ((V!31905 0))(
  ( (V!31906 (val!10153 Int)) )
))
(declare-datatypes ((tuple2!13332 0))(
  ( (tuple2!13333 (_1!6677 (_ BitVec 64)) (_2!6677 V!31905)) )
))
(declare-datatypes ((List!19112 0))(
  ( (Nil!19109) (Cons!19108 (h!20254 tuple2!13332) (t!27353 List!19112)) )
))
(declare-datatypes ((ListLongMap!12029 0))(
  ( (ListLongMap!12030 (toList!6030 List!19112)) )
))
(declare-fun lt!422194 () ListLongMap!12029)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5090 (ListLongMap!12029 (_ BitVec 64)) Bool)

(assert (=> b!936388 (= res!630512 (contains!5090 lt!422194 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9621 0))(
  ( (ValueCellFull!9621 (v!12678 V!31905)) (EmptyCell!9621) )
))
(declare-datatypes ((array!56352 0))(
  ( (array!56353 (arr!27116 (Array (_ BitVec 32) ValueCell!9621)) (size!27575 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56352)

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((array!56354 0))(
  ( (array!56355 (arr!27117 (Array (_ BitVec 32) (_ BitVec 64))) (size!27576 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56354)

(declare-fun zeroValue!1173 () V!31905)

(declare-fun minValue!1173 () V!31905)

(declare-fun getCurrentListMap!3266 (array!56354 array!56352 (_ BitVec 32) (_ BitVec 32) V!31905 V!31905 (_ BitVec 32) Int) ListLongMap!12029)

(assert (=> b!936388 (= lt!422194 (getCurrentListMap!3266 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!936389 () Bool)

(declare-fun res!630511 () Bool)

(assert (=> b!936389 (=> (not res!630511) (not e!525779))))

(assert (=> b!936389 (= res!630511 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27576 _keys!1487))))))

(declare-fun res!630516 () Bool)

(assert (=> start!79648 (=> (not res!630516) (not e!525779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79648 (= res!630516 (validMask!0 mask!1881))))

(assert (=> start!79648 e!525779))

(assert (=> start!79648 true))

(declare-fun tp_is_empty!20205 () Bool)

(assert (=> start!79648 tp_is_empty!20205))

(declare-fun e!525786 () Bool)

(declare-fun array_inv!21098 (array!56352) Bool)

(assert (=> start!79648 (and (array_inv!21098 _values!1231) e!525786)))

(assert (=> start!79648 tp!61546))

(declare-fun array_inv!21099 (array!56354) Bool)

(assert (=> start!79648 (array_inv!21099 _keys!1487)))

(declare-fun b!936390 () Bool)

(declare-fun e!525785 () Bool)

(declare-fun mapRes!32079 () Bool)

(assert (=> b!936390 (= e!525786 (and e!525785 mapRes!32079))))

(declare-fun condMapEmpty!32079 () Bool)

(declare-fun mapDefault!32079 () ValueCell!9621)

(assert (=> b!936390 (= condMapEmpty!32079 (= (arr!27116 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9621)) mapDefault!32079)))))

(declare-fun b!936391 () Bool)

(declare-datatypes ((Unit!31584 0))(
  ( (Unit!31585) )
))
(declare-fun e!525778 () Unit!31584)

(declare-fun Unit!31586 () Unit!31584)

(assert (=> b!936391 (= e!525778 Unit!31586)))

(declare-fun b!936392 () Bool)

(declare-fun e!525784 () Bool)

(declare-fun arrayContainsKey!0 (array!56354 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!936392 (= e!525784 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!936393 () Bool)

(declare-fun res!630513 () Bool)

(assert (=> b!936393 (=> (not res!630513) (not e!525779))))

(assert (=> b!936393 (= res!630513 (and (= (size!27575 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27576 _keys!1487) (size!27575 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!936394 () Bool)

(assert (=> b!936394 (= e!525784 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!936395 () Bool)

(declare-fun e!525781 () Bool)

(assert (=> b!936395 (= e!525777 e!525781)))

(declare-fun res!630517 () Bool)

(assert (=> b!936395 (=> (not res!630517) (not e!525781))))

(declare-fun v!791 () V!31905)

(declare-fun lt!422188 () V!31905)

(assert (=> b!936395 (= res!630517 (and (= lt!422188 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun apply!832 (ListLongMap!12029 (_ BitVec 64)) V!31905)

(assert (=> b!936395 (= lt!422188 (apply!832 lt!422194 k0!1099))))

(declare-fun mapIsEmpty!32079 () Bool)

(assert (=> mapIsEmpty!32079 mapRes!32079))

(declare-fun b!936396 () Bool)

(declare-fun res!630514 () Bool)

(assert (=> b!936396 (=> (not res!630514) (not e!525779))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56354 (_ BitVec 32)) Bool)

(assert (=> b!936396 (= res!630514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!936397 () Bool)

(declare-fun e!525783 () Unit!31584)

(assert (=> b!936397 (= e!525783 e!525778)))

(declare-fun lt!422184 () (_ BitVec 64))

(assert (=> b!936397 (= lt!422184 (select (arr!27117 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97388 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!936397 (= c!97388 (validKeyInArray!0 lt!422184))))

(declare-fun b!936398 () Bool)

(assert (=> b!936398 (= e!525785 tp_is_empty!20205)))

(declare-fun b!936399 () Bool)

(declare-fun lt!422190 () ListLongMap!12029)

(assert (=> b!936399 (= (apply!832 lt!422190 k0!1099) lt!422188)))

(declare-fun lt!422183 () V!31905)

(declare-fun lt!422193 () Unit!31584)

(declare-fun addApplyDifferent!422 (ListLongMap!12029 (_ BitVec 64) V!31905 (_ BitVec 64)) Unit!31584)

(assert (=> b!936399 (= lt!422193 (addApplyDifferent!422 lt!422194 lt!422184 lt!422183 k0!1099))))

(assert (=> b!936399 (not (= lt!422184 k0!1099))))

(declare-fun lt!422189 () Unit!31584)

(declare-datatypes ((List!19113 0))(
  ( (Nil!19110) (Cons!19109 (h!20255 (_ BitVec 64)) (t!27354 List!19113)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56354 (_ BitVec 64) (_ BitVec 32) List!19113) Unit!31584)

(assert (=> b!936399 (= lt!422189 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19110))))

(assert (=> b!936399 e!525784))

(declare-fun c!97387 () Bool)

(assert (=> b!936399 (= c!97387 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!422187 () Unit!31584)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!295 (array!56354 array!56352 (_ BitVec 32) (_ BitVec 32) V!31905 V!31905 (_ BitVec 64) (_ BitVec 32) Int) Unit!31584)

(assert (=> b!936399 (= lt!422187 (lemmaListMapContainsThenArrayContainsFrom!295 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56354 (_ BitVec 32) List!19113) Bool)

(assert (=> b!936399 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19110)))

(declare-fun lt!422186 () Unit!31584)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56354 (_ BitVec 32) (_ BitVec 32)) Unit!31584)

(assert (=> b!936399 (= lt!422186 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!936399 (contains!5090 lt!422190 k0!1099)))

(declare-fun lt!422195 () tuple2!13332)

(declare-fun +!2823 (ListLongMap!12029 tuple2!13332) ListLongMap!12029)

(assert (=> b!936399 (= lt!422190 (+!2823 lt!422194 lt!422195))))

(declare-fun lt!422185 () Unit!31584)

(declare-fun addStillContains!542 (ListLongMap!12029 (_ BitVec 64) V!31905 (_ BitVec 64)) Unit!31584)

(assert (=> b!936399 (= lt!422185 (addStillContains!542 lt!422194 lt!422184 lt!422183 k0!1099))))

(assert (=> b!936399 (= (getCurrentListMap!3266 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2823 (getCurrentListMap!3266 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422195))))

(assert (=> b!936399 (= lt!422195 (tuple2!13333 lt!422184 lt!422183))))

(declare-fun get!14293 (ValueCell!9621 V!31905) V!31905)

(declare-fun dynLambda!1612 (Int (_ BitVec 64)) V!31905)

(assert (=> b!936399 (= lt!422183 (get!14293 (select (arr!27116 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1612 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422191 () Unit!31584)

(declare-fun lemmaListMapRecursiveValidKeyArray!213 (array!56354 array!56352 (_ BitVec 32) (_ BitVec 32) V!31905 V!31905 (_ BitVec 32) Int) Unit!31584)

(assert (=> b!936399 (= lt!422191 (lemmaListMapRecursiveValidKeyArray!213 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!936399 (= e!525778 lt!422193)))

(declare-fun b!936400 () Bool)

(assert (=> b!936400 (= e!525781 false)))

(declare-fun lt!422192 () Unit!31584)

(assert (=> b!936400 (= lt!422192 e!525783)))

(declare-fun c!97389 () Bool)

(assert (=> b!936400 (= c!97389 (validKeyInArray!0 k0!1099))))

(declare-fun b!936401 () Bool)

(declare-fun e!525780 () Bool)

(assert (=> b!936401 (= e!525780 tp_is_empty!20205)))

(declare-fun b!936402 () Bool)

(declare-fun Unit!31587 () Unit!31584)

(assert (=> b!936402 (= e!525783 Unit!31587)))

(declare-fun mapNonEmpty!32079 () Bool)

(declare-fun tp!61547 () Bool)

(assert (=> mapNonEmpty!32079 (= mapRes!32079 (and tp!61547 e!525780))))

(declare-fun mapRest!32079 () (Array (_ BitVec 32) ValueCell!9621))

(declare-fun mapKey!32079 () (_ BitVec 32))

(declare-fun mapValue!32079 () ValueCell!9621)

(assert (=> mapNonEmpty!32079 (= (arr!27116 _values!1231) (store mapRest!32079 mapKey!32079 mapValue!32079))))

(declare-fun b!936403 () Bool)

(declare-fun res!630515 () Bool)

(assert (=> b!936403 (=> (not res!630515) (not e!525779))))

(assert (=> b!936403 (= res!630515 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19110))))

(assert (= (and start!79648 res!630516) b!936393))

(assert (= (and b!936393 res!630513) b!936396))

(assert (= (and b!936396 res!630514) b!936403))

(assert (= (and b!936403 res!630515) b!936389))

(assert (= (and b!936389 res!630511) b!936388))

(assert (= (and b!936388 res!630512) b!936395))

(assert (= (and b!936395 res!630517) b!936400))

(assert (= (and b!936400 c!97389) b!936397))

(assert (= (and b!936400 (not c!97389)) b!936402))

(assert (= (and b!936397 c!97388) b!936399))

(assert (= (and b!936397 (not c!97388)) b!936391))

(assert (= (and b!936399 c!97387) b!936392))

(assert (= (and b!936399 (not c!97387)) b!936394))

(assert (= (and b!936390 condMapEmpty!32079) mapIsEmpty!32079))

(assert (= (and b!936390 (not condMapEmpty!32079)) mapNonEmpty!32079))

(get-info :version)

(assert (= (and mapNonEmpty!32079 ((_ is ValueCellFull!9621) mapValue!32079)) b!936401))

(assert (= (and b!936390 ((_ is ValueCellFull!9621) mapDefault!32079)) b!936398))

(assert (= start!79648 b!936390))

(declare-fun b_lambda!14103 () Bool)

(assert (=> (not b_lambda!14103) (not b!936399)))

(declare-fun t!27352 () Bool)

(declare-fun tb!6091 () Bool)

(assert (=> (and start!79648 (= defaultEntry!1235 defaultEntry!1235) t!27352) tb!6091))

(declare-fun result!12015 () Bool)

(assert (=> tb!6091 (= result!12015 tp_is_empty!20205)))

(assert (=> b!936399 t!27352))

(declare-fun b_and!28987 () Bool)

(assert (= b_and!28985 (and (=> t!27352 result!12015) b_and!28987)))

(declare-fun m!870983 () Bool)

(assert (=> b!936403 m!870983))

(declare-fun m!870985 () Bool)

(assert (=> b!936395 m!870985))

(declare-fun m!870987 () Bool)

(assert (=> b!936396 m!870987))

(declare-fun m!870989 () Bool)

(assert (=> b!936397 m!870989))

(declare-fun m!870991 () Bool)

(assert (=> b!936397 m!870991))

(declare-fun m!870993 () Bool)

(assert (=> start!79648 m!870993))

(declare-fun m!870995 () Bool)

(assert (=> start!79648 m!870995))

(declare-fun m!870997 () Bool)

(assert (=> start!79648 m!870997))

(declare-fun m!870999 () Bool)

(assert (=> b!936399 m!870999))

(declare-fun m!871001 () Bool)

(assert (=> b!936399 m!871001))

(declare-fun m!871003 () Bool)

(assert (=> b!936399 m!871003))

(declare-fun m!871005 () Bool)

(assert (=> b!936399 m!871005))

(declare-fun m!871007 () Bool)

(assert (=> b!936399 m!871007))

(declare-fun m!871009 () Bool)

(assert (=> b!936399 m!871009))

(declare-fun m!871011 () Bool)

(assert (=> b!936399 m!871011))

(declare-fun m!871013 () Bool)

(assert (=> b!936399 m!871013))

(declare-fun m!871015 () Bool)

(assert (=> b!936399 m!871015))

(declare-fun m!871017 () Bool)

(assert (=> b!936399 m!871017))

(declare-fun m!871019 () Bool)

(assert (=> b!936399 m!871019))

(declare-fun m!871021 () Bool)

(assert (=> b!936399 m!871021))

(assert (=> b!936399 m!871009))

(assert (=> b!936399 m!871011))

(declare-fun m!871023 () Bool)

(assert (=> b!936399 m!871023))

(declare-fun m!871025 () Bool)

(assert (=> b!936399 m!871025))

(declare-fun m!871027 () Bool)

(assert (=> b!936399 m!871027))

(assert (=> b!936399 m!871005))

(declare-fun m!871029 () Bool)

(assert (=> b!936399 m!871029))

(declare-fun m!871031 () Bool)

(assert (=> b!936388 m!871031))

(declare-fun m!871033 () Bool)

(assert (=> b!936388 m!871033))

(declare-fun m!871035 () Bool)

(assert (=> b!936392 m!871035))

(declare-fun m!871037 () Bool)

(assert (=> b!936400 m!871037))

(declare-fun m!871039 () Bool)

(assert (=> mapNonEmpty!32079 m!871039))

(check-sat (not b_lambda!14103) (not b!936395) (not b!936392) (not b!936399) (not b!936388) (not b!936403) (not b!936400) (not b!936396) (not start!79648) tp_is_empty!20205 (not b_next!17697) b_and!28987 (not mapNonEmpty!32079) (not b!936397))
(check-sat b_and!28987 (not b_next!17697))
