; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78948 () Bool)

(assert start!78948)

(declare-fun b_free!16993 () Bool)

(declare-fun b_next!16993 () Bool)

(assert (=> start!78948 (= b_free!16993 (not b_next!16993))))

(declare-fun tp!59421 () Bool)

(declare-fun b_and!27733 () Bool)

(assert (=> start!78948 (= tp!59421 b_and!27733)))

(declare-fun b!920339 () Bool)

(declare-fun res!620313 () Bool)

(declare-fun e!516671 () Bool)

(assert (=> b!920339 (=> (not res!620313) (not e!516671))))

(declare-datatypes ((array!55031 0))(
  ( (array!55032 (arr!26456 (Array (_ BitVec 32) (_ BitVec 64))) (size!26916 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55031)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55031 (_ BitVec 32)) Bool)

(assert (=> b!920339 (= res!620313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!920340 () Bool)

(declare-fun res!620305 () Bool)

(declare-fun e!516669 () Bool)

(assert (=> b!920340 (=> (not res!620305) (not e!516669))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!920340 (= res!620305 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!920341 () Bool)

(declare-fun res!620312 () Bool)

(assert (=> b!920341 (=> (not res!620312) (not e!516671))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30967 0))(
  ( (V!30968 (val!9801 Int)) )
))
(declare-datatypes ((ValueCell!9269 0))(
  ( (ValueCellFull!9269 (v!12316 V!30967)) (EmptyCell!9269) )
))
(declare-datatypes ((array!55033 0))(
  ( (array!55034 (arr!26457 (Array (_ BitVec 32) ValueCell!9269)) (size!26917 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55033)

(assert (=> b!920341 (= res!620312 (and (= (size!26917 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26916 _keys!1487) (size!26917 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!920342 () Bool)

(declare-fun e!516672 () Bool)

(declare-fun e!516668 () Bool)

(declare-fun mapRes!31008 () Bool)

(assert (=> b!920342 (= e!516672 (and e!516668 mapRes!31008))))

(declare-fun condMapEmpty!31008 () Bool)

(declare-fun mapDefault!31008 () ValueCell!9269)

(assert (=> b!920342 (= condMapEmpty!31008 (= (arr!26457 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9269)) mapDefault!31008)))))

(declare-fun res!620306 () Bool)

(assert (=> start!78948 (=> (not res!620306) (not e!516671))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78948 (= res!620306 (validMask!0 mask!1881))))

(assert (=> start!78948 e!516671))

(assert (=> start!78948 true))

(declare-fun tp_is_empty!19501 () Bool)

(assert (=> start!78948 tp_is_empty!19501))

(declare-fun array_inv!20712 (array!55033) Bool)

(assert (=> start!78948 (and (array_inv!20712 _values!1231) e!516672)))

(assert (=> start!78948 tp!59421))

(declare-fun array_inv!20713 (array!55031) Bool)

(assert (=> start!78948 (array_inv!20713 _keys!1487)))

(declare-fun b!920343 () Bool)

(declare-fun e!516673 () Bool)

(assert (=> b!920343 (= e!516673 tp_is_empty!19501)))

(declare-fun mapNonEmpty!31008 () Bool)

(declare-fun tp!59420 () Bool)

(assert (=> mapNonEmpty!31008 (= mapRes!31008 (and tp!59420 e!516673))))

(declare-fun mapValue!31008 () ValueCell!9269)

(declare-fun mapRest!31008 () (Array (_ BitVec 32) ValueCell!9269))

(declare-fun mapKey!31008 () (_ BitVec 32))

(assert (=> mapNonEmpty!31008 (= (arr!26457 _values!1231) (store mapRest!31008 mapKey!31008 mapValue!31008))))

(declare-fun mapIsEmpty!31008 () Bool)

(assert (=> mapIsEmpty!31008 mapRes!31008))

(declare-fun b!920344 () Bool)

(assert (=> b!920344 (= e!516671 e!516669)))

(declare-fun res!620304 () Bool)

(assert (=> b!920344 (=> (not res!620304) (not e!516669))))

(declare-datatypes ((tuple2!12716 0))(
  ( (tuple2!12717 (_1!6369 (_ BitVec 64)) (_2!6369 V!30967)) )
))
(declare-datatypes ((List!18534 0))(
  ( (Nil!18531) (Cons!18530 (h!19682 tuple2!12716) (t!26249 List!18534)) )
))
(declare-datatypes ((ListLongMap!11415 0))(
  ( (ListLongMap!11416 (toList!5723 List!18534)) )
))
(declare-fun lt!413067 () ListLongMap!11415)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4777 (ListLongMap!11415 (_ BitVec 64)) Bool)

(assert (=> b!920344 (= res!620304 (contains!4777 lt!413067 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30967)

(declare-fun minValue!1173 () V!30967)

(declare-fun getCurrentListMap!2977 (array!55031 array!55033 (_ BitVec 32) (_ BitVec 32) V!30967 V!30967 (_ BitVec 32) Int) ListLongMap!11415)

(assert (=> b!920344 (= lt!413067 (getCurrentListMap!2977 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!920345 () Bool)

(declare-fun res!620309 () Bool)

(assert (=> b!920345 (=> (not res!620309) (not e!516669))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920345 (= res!620309 (validKeyInArray!0 k0!1099))))

(declare-fun b!920346 () Bool)

(declare-fun res!620311 () Bool)

(assert (=> b!920346 (=> (not res!620311) (not e!516669))))

(declare-fun v!791 () V!30967)

(declare-fun apply!593 (ListLongMap!11415 (_ BitVec 64)) V!30967)

(assert (=> b!920346 (= res!620311 (= (apply!593 lt!413067 k0!1099) v!791))))

(declare-fun b!920347 () Bool)

(declare-fun res!620310 () Bool)

(assert (=> b!920347 (=> (not res!620310) (not e!516671))))

(assert (=> b!920347 (= res!620310 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26916 _keys!1487))))))

(declare-fun b!920348 () Bool)

(declare-fun e!516670 () Bool)

(assert (=> b!920348 (= e!516669 e!516670)))

(declare-fun res!620308 () Bool)

(assert (=> b!920348 (=> (not res!620308) (not e!516670))))

(declare-fun lt!413066 () (_ BitVec 64))

(assert (=> b!920348 (= res!620308 (validKeyInArray!0 lt!413066))))

(assert (=> b!920348 (= lt!413066 (select (arr!26456 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!920349 () Bool)

(assert (=> b!920349 (= e!516670 (not true))))

(declare-datatypes ((List!18535 0))(
  ( (Nil!18532) (Cons!18531 (h!19683 (_ BitVec 64)) (t!26250 List!18535)) )
))
(declare-fun arrayNoDuplicates!0 (array!55031 (_ BitVec 32) List!18535) Bool)

(assert (=> b!920349 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18532)))

(declare-datatypes ((Unit!31038 0))(
  ( (Unit!31039) )
))
(declare-fun lt!413064 () Unit!31038)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55031 (_ BitVec 32) (_ BitVec 32)) Unit!31038)

(assert (=> b!920349 (= lt!413064 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413063 () tuple2!12716)

(declare-fun +!2663 (ListLongMap!11415 tuple2!12716) ListLongMap!11415)

(assert (=> b!920349 (contains!4777 (+!2663 lt!413067 lt!413063) k0!1099)))

(declare-fun lt!413065 () V!30967)

(declare-fun lt!413068 () Unit!31038)

(declare-fun addStillContains!372 (ListLongMap!11415 (_ BitVec 64) V!30967 (_ BitVec 64)) Unit!31038)

(assert (=> b!920349 (= lt!413068 (addStillContains!372 lt!413067 lt!413066 lt!413065 k0!1099))))

(assert (=> b!920349 (= (getCurrentListMap!2977 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2663 (getCurrentListMap!2977 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413063))))

(assert (=> b!920349 (= lt!413063 (tuple2!12717 lt!413066 lt!413065))))

(declare-fun get!13896 (ValueCell!9269 V!30967) V!30967)

(declare-fun dynLambda!1460 (Int (_ BitVec 64)) V!30967)

(assert (=> b!920349 (= lt!413065 (get!13896 (select (arr!26457 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1460 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413069 () Unit!31038)

(declare-fun lemmaListMapRecursiveValidKeyArray!43 (array!55031 array!55033 (_ BitVec 32) (_ BitVec 32) V!30967 V!30967 (_ BitVec 32) Int) Unit!31038)

(assert (=> b!920349 (= lt!413069 (lemmaListMapRecursiveValidKeyArray!43 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!920350 () Bool)

(declare-fun res!620307 () Bool)

(assert (=> b!920350 (=> (not res!620307) (not e!516671))))

(assert (=> b!920350 (= res!620307 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18532))))

(declare-fun b!920351 () Bool)

(assert (=> b!920351 (= e!516668 tp_is_empty!19501)))

(assert (= (and start!78948 res!620306) b!920341))

(assert (= (and b!920341 res!620312) b!920339))

(assert (= (and b!920339 res!620313) b!920350))

(assert (= (and b!920350 res!620307) b!920347))

(assert (= (and b!920347 res!620310) b!920344))

(assert (= (and b!920344 res!620304) b!920346))

(assert (= (and b!920346 res!620311) b!920340))

(assert (= (and b!920340 res!620305) b!920345))

(assert (= (and b!920345 res!620309) b!920348))

(assert (= (and b!920348 res!620308) b!920349))

(assert (= (and b!920342 condMapEmpty!31008) mapIsEmpty!31008))

(assert (= (and b!920342 (not condMapEmpty!31008)) mapNonEmpty!31008))

(get-info :version)

(assert (= (and mapNonEmpty!31008 ((_ is ValueCellFull!9269) mapValue!31008)) b!920343))

(assert (= (and b!920342 ((_ is ValueCellFull!9269) mapDefault!31008)) b!920351))

(assert (= start!78948 b!920342))

(declare-fun b_lambda!13509 () Bool)

(assert (=> (not b_lambda!13509) (not b!920349)))

(declare-fun t!26248 () Bool)

(declare-fun tb!5565 () Bool)

(assert (=> (and start!78948 (= defaultEntry!1235 defaultEntry!1235) t!26248) tb!5565))

(declare-fun result!10961 () Bool)

(assert (=> tb!5565 (= result!10961 tp_is_empty!19501)))

(assert (=> b!920349 t!26248))

(declare-fun b_and!27735 () Bool)

(assert (= b_and!27733 (and (=> t!26248 result!10961) b_and!27735)))

(declare-fun m!854509 () Bool)

(assert (=> b!920346 m!854509))

(declare-fun m!854511 () Bool)

(assert (=> b!920345 m!854511))

(declare-fun m!854513 () Bool)

(assert (=> b!920339 m!854513))

(declare-fun m!854515 () Bool)

(assert (=> b!920349 m!854515))

(declare-fun m!854517 () Bool)

(assert (=> b!920349 m!854517))

(assert (=> b!920349 m!854515))

(declare-fun m!854519 () Bool)

(assert (=> b!920349 m!854519))

(declare-fun m!854521 () Bool)

(assert (=> b!920349 m!854521))

(declare-fun m!854523 () Bool)

(assert (=> b!920349 m!854523))

(assert (=> b!920349 m!854519))

(assert (=> b!920349 m!854523))

(declare-fun m!854525 () Bool)

(assert (=> b!920349 m!854525))

(declare-fun m!854527 () Bool)

(assert (=> b!920349 m!854527))

(declare-fun m!854529 () Bool)

(assert (=> b!920349 m!854529))

(declare-fun m!854531 () Bool)

(assert (=> b!920349 m!854531))

(declare-fun m!854533 () Bool)

(assert (=> b!920349 m!854533))

(declare-fun m!854535 () Bool)

(assert (=> b!920349 m!854535))

(assert (=> b!920349 m!854529))

(declare-fun m!854537 () Bool)

(assert (=> b!920349 m!854537))

(declare-fun m!854539 () Bool)

(assert (=> start!78948 m!854539))

(declare-fun m!854541 () Bool)

(assert (=> start!78948 m!854541))

(declare-fun m!854543 () Bool)

(assert (=> start!78948 m!854543))

(declare-fun m!854545 () Bool)

(assert (=> b!920350 m!854545))

(declare-fun m!854547 () Bool)

(assert (=> b!920348 m!854547))

(declare-fun m!854549 () Bool)

(assert (=> b!920348 m!854549))

(declare-fun m!854551 () Bool)

(assert (=> mapNonEmpty!31008 m!854551))

(declare-fun m!854553 () Bool)

(assert (=> b!920344 m!854553))

(declare-fun m!854555 () Bool)

(assert (=> b!920344 m!854555))

(check-sat (not b!920348) tp_is_empty!19501 (not b!920344) (not mapNonEmpty!31008) (not b!920346) b_and!27735 (not b!920345) (not b!920349) (not b_lambda!13509) (not b!920339) (not start!78948) (not b!920350) (not b_next!16993))
(check-sat b_and!27735 (not b_next!16993))
