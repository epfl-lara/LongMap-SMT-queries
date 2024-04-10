; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78782 () Bool)

(assert start!78782)

(declare-fun b_free!16995 () Bool)

(declare-fun b_next!16995 () Bool)

(assert (=> start!78782 (= b_free!16995 (not b_next!16995))))

(declare-fun tp!59425 () Bool)

(declare-fun b_and!27727 () Bool)

(assert (=> start!78782 (= tp!59425 b_and!27727)))

(declare-fun b!919477 () Bool)

(declare-fun e!516111 () Bool)

(declare-fun tp_is_empty!19503 () Bool)

(assert (=> b!919477 (= e!516111 tp_is_empty!19503)))

(declare-fun b!919478 () Bool)

(declare-fun res!619996 () Bool)

(declare-fun e!516109 () Bool)

(assert (=> b!919478 (=> (not res!619996) (not e!516109))))

(declare-datatypes ((array!54990 0))(
  ( (array!54991 (arr!26440 (Array (_ BitVec 32) (_ BitVec 64))) (size!26899 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54990)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30969 0))(
  ( (V!30970 (val!9802 Int)) )
))
(declare-datatypes ((ValueCell!9270 0))(
  ( (ValueCellFull!9270 (v!12320 V!30969)) (EmptyCell!9270) )
))
(declare-datatypes ((array!54992 0))(
  ( (array!54993 (arr!26441 (Array (_ BitVec 32) ValueCell!9270)) (size!26900 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54992)

(assert (=> b!919478 (= res!619996 (and (= (size!26900 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26899 _keys!1487) (size!26900 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!919479 () Bool)

(declare-fun res!619990 () Bool)

(declare-fun e!516106 () Bool)

(assert (=> b!919479 (=> (not res!619990) (not e!516106))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919479 (= res!619990 (validKeyInArray!0 k0!1099))))

(declare-fun b!919481 () Bool)

(declare-fun res!619991 () Bool)

(assert (=> b!919481 (=> (not res!619991) (not e!516109))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!919481 (= res!619991 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26899 _keys!1487))))))

(declare-fun b!919482 () Bool)

(assert (=> b!919482 (= e!516109 e!516106)))

(declare-fun res!619999 () Bool)

(assert (=> b!919482 (=> (not res!619999) (not e!516106))))

(declare-datatypes ((tuple2!12740 0))(
  ( (tuple2!12741 (_1!6381 (_ BitVec 64)) (_2!6381 V!30969)) )
))
(declare-datatypes ((List!18544 0))(
  ( (Nil!18541) (Cons!18540 (h!19686 tuple2!12740) (t!26269 List!18544)) )
))
(declare-datatypes ((ListLongMap!11437 0))(
  ( (ListLongMap!11438 (toList!5734 List!18544)) )
))
(declare-fun lt!412725 () ListLongMap!11437)

(declare-fun contains!4780 (ListLongMap!11437 (_ BitVec 64)) Bool)

(assert (=> b!919482 (= res!619999 (contains!4780 lt!412725 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30969)

(declare-fun minValue!1173 () V!30969)

(declare-fun getCurrentListMap!2990 (array!54990 array!54992 (_ BitVec 32) (_ BitVec 32) V!30969 V!30969 (_ BitVec 32) Int) ListLongMap!11437)

(assert (=> b!919482 (= lt!412725 (getCurrentListMap!2990 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!919483 () Bool)

(declare-fun e!516112 () Bool)

(assert (=> b!919483 (= e!516112 tp_is_empty!19503)))

(declare-fun b!919484 () Bool)

(declare-fun e!516108 () Bool)

(declare-fun mapRes!31011 () Bool)

(assert (=> b!919484 (= e!516108 (and e!516112 mapRes!31011))))

(declare-fun condMapEmpty!31011 () Bool)

(declare-fun mapDefault!31011 () ValueCell!9270)

(assert (=> b!919484 (= condMapEmpty!31011 (= (arr!26441 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9270)) mapDefault!31011)))))

(declare-fun mapIsEmpty!31011 () Bool)

(assert (=> mapIsEmpty!31011 mapRes!31011))

(declare-fun b!919485 () Bool)

(declare-fun res!619992 () Bool)

(assert (=> b!919485 (=> (not res!619992) (not e!516109))))

(declare-datatypes ((List!18545 0))(
  ( (Nil!18542) (Cons!18541 (h!19687 (_ BitVec 64)) (t!26270 List!18545)) )
))
(declare-fun arrayNoDuplicates!0 (array!54990 (_ BitVec 32) List!18545) Bool)

(assert (=> b!919485 (= res!619992 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18542))))

(declare-fun b!919486 () Bool)

(declare-fun e!516110 () Bool)

(assert (=> b!919486 (= e!516110 (not true))))

(assert (=> b!919486 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18542)))

(declare-datatypes ((Unit!31038 0))(
  ( (Unit!31039) )
))
(declare-fun lt!412729 () Unit!31038)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!54990 (_ BitVec 32) (_ BitVec 32)) Unit!31038)

(assert (=> b!919486 (= lt!412729 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!412728 () tuple2!12740)

(declare-fun +!2645 (ListLongMap!11437 tuple2!12740) ListLongMap!11437)

(assert (=> b!919486 (contains!4780 (+!2645 lt!412725 lt!412728) k0!1099)))

(declare-fun lt!412726 () Unit!31038)

(declare-fun lt!412724 () (_ BitVec 64))

(declare-fun lt!412723 () V!30969)

(declare-fun addStillContains!369 (ListLongMap!11437 (_ BitVec 64) V!30969 (_ BitVec 64)) Unit!31038)

(assert (=> b!919486 (= lt!412726 (addStillContains!369 lt!412725 lt!412724 lt!412723 k0!1099))))

(assert (=> b!919486 (= (getCurrentListMap!2990 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2645 (getCurrentListMap!2990 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412728))))

(assert (=> b!919486 (= lt!412728 (tuple2!12741 lt!412724 lt!412723))))

(declare-fun get!13866 (ValueCell!9270 V!30969) V!30969)

(declare-fun dynLambda!1434 (Int (_ BitVec 64)) V!30969)

(assert (=> b!919486 (= lt!412723 (get!13866 (select (arr!26441 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1434 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412727 () Unit!31038)

(declare-fun lemmaListMapRecursiveValidKeyArray!35 (array!54990 array!54992 (_ BitVec 32) (_ BitVec 32) V!30969 V!30969 (_ BitVec 32) Int) Unit!31038)

(assert (=> b!919486 (= lt!412727 (lemmaListMapRecursiveValidKeyArray!35 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!619993 () Bool)

(assert (=> start!78782 (=> (not res!619993) (not e!516109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78782 (= res!619993 (validMask!0 mask!1881))))

(assert (=> start!78782 e!516109))

(assert (=> start!78782 true))

(assert (=> start!78782 tp_is_empty!19503))

(declare-fun array_inv!20608 (array!54992) Bool)

(assert (=> start!78782 (and (array_inv!20608 _values!1231) e!516108)))

(assert (=> start!78782 tp!59425))

(declare-fun array_inv!20609 (array!54990) Bool)

(assert (=> start!78782 (array_inv!20609 _keys!1487)))

(declare-fun b!919480 () Bool)

(assert (=> b!919480 (= e!516106 e!516110)))

(declare-fun res!619997 () Bool)

(assert (=> b!919480 (=> (not res!619997) (not e!516110))))

(assert (=> b!919480 (= res!619997 (validKeyInArray!0 lt!412724))))

(assert (=> b!919480 (= lt!412724 (select (arr!26440 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapNonEmpty!31011 () Bool)

(declare-fun tp!59426 () Bool)

(assert (=> mapNonEmpty!31011 (= mapRes!31011 (and tp!59426 e!516111))))

(declare-fun mapRest!31011 () (Array (_ BitVec 32) ValueCell!9270))

(declare-fun mapKey!31011 () (_ BitVec 32))

(declare-fun mapValue!31011 () ValueCell!9270)

(assert (=> mapNonEmpty!31011 (= (arr!26441 _values!1231) (store mapRest!31011 mapKey!31011 mapValue!31011))))

(declare-fun b!919487 () Bool)

(declare-fun res!619994 () Bool)

(assert (=> b!919487 (=> (not res!619994) (not e!516106))))

(declare-fun v!791 () V!30969)

(declare-fun apply!578 (ListLongMap!11437 (_ BitVec 64)) V!30969)

(assert (=> b!919487 (= res!619994 (= (apply!578 lt!412725 k0!1099) v!791))))

(declare-fun b!919488 () Bool)

(declare-fun res!619995 () Bool)

(assert (=> b!919488 (=> (not res!619995) (not e!516106))))

(assert (=> b!919488 (= res!619995 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!919489 () Bool)

(declare-fun res!619998 () Bool)

(assert (=> b!919489 (=> (not res!619998) (not e!516109))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54990 (_ BitVec 32)) Bool)

(assert (=> b!919489 (= res!619998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!78782 res!619993) b!919478))

(assert (= (and b!919478 res!619996) b!919489))

(assert (= (and b!919489 res!619998) b!919485))

(assert (= (and b!919485 res!619992) b!919481))

(assert (= (and b!919481 res!619991) b!919482))

(assert (= (and b!919482 res!619999) b!919487))

(assert (= (and b!919487 res!619994) b!919488))

(assert (= (and b!919488 res!619995) b!919479))

(assert (= (and b!919479 res!619990) b!919480))

(assert (= (and b!919480 res!619997) b!919486))

(assert (= (and b!919484 condMapEmpty!31011) mapIsEmpty!31011))

(assert (= (and b!919484 (not condMapEmpty!31011)) mapNonEmpty!31011))

(get-info :version)

(assert (= (and mapNonEmpty!31011 ((_ is ValueCellFull!9270) mapValue!31011)) b!919477))

(assert (= (and b!919484 ((_ is ValueCellFull!9270) mapDefault!31011)) b!919483))

(assert (= start!78782 b!919484))

(declare-fun b_lambda!13497 () Bool)

(assert (=> (not b_lambda!13497) (not b!919486)))

(declare-fun t!26268 () Bool)

(declare-fun tb!5575 () Bool)

(assert (=> (and start!78782 (= defaultEntry!1235 defaultEntry!1235) t!26268) tb!5575))

(declare-fun result!10973 () Bool)

(assert (=> tb!5575 (= result!10973 tp_is_empty!19503)))

(assert (=> b!919486 t!26268))

(declare-fun b_and!27729 () Bool)

(assert (= b_and!27727 (and (=> t!26268 result!10973) b_and!27729)))

(declare-fun m!853263 () Bool)

(assert (=> b!919485 m!853263))

(declare-fun m!853265 () Bool)

(assert (=> mapNonEmpty!31011 m!853265))

(declare-fun m!853267 () Bool)

(assert (=> b!919482 m!853267))

(declare-fun m!853269 () Bool)

(assert (=> b!919482 m!853269))

(declare-fun m!853271 () Bool)

(assert (=> start!78782 m!853271))

(declare-fun m!853273 () Bool)

(assert (=> start!78782 m!853273))

(declare-fun m!853275 () Bool)

(assert (=> start!78782 m!853275))

(declare-fun m!853277 () Bool)

(assert (=> b!919486 m!853277))

(declare-fun m!853279 () Bool)

(assert (=> b!919486 m!853279))

(declare-fun m!853281 () Bool)

(assert (=> b!919486 m!853281))

(declare-fun m!853283 () Bool)

(assert (=> b!919486 m!853283))

(declare-fun m!853285 () Bool)

(assert (=> b!919486 m!853285))

(declare-fun m!853287 () Bool)

(assert (=> b!919486 m!853287))

(assert (=> b!919486 m!853281))

(declare-fun m!853289 () Bool)

(assert (=> b!919486 m!853289))

(declare-fun m!853291 () Bool)

(assert (=> b!919486 m!853291))

(declare-fun m!853293 () Bool)

(assert (=> b!919486 m!853293))

(assert (=> b!919486 m!853285))

(assert (=> b!919486 m!853287))

(declare-fun m!853295 () Bool)

(assert (=> b!919486 m!853295))

(declare-fun m!853297 () Bool)

(assert (=> b!919486 m!853297))

(assert (=> b!919486 m!853277))

(declare-fun m!853299 () Bool)

(assert (=> b!919486 m!853299))

(declare-fun m!853301 () Bool)

(assert (=> b!919489 m!853301))

(declare-fun m!853303 () Bool)

(assert (=> b!919487 m!853303))

(declare-fun m!853305 () Bool)

(assert (=> b!919480 m!853305))

(declare-fun m!853307 () Bool)

(assert (=> b!919480 m!853307))

(declare-fun m!853309 () Bool)

(assert (=> b!919479 m!853309))

(check-sat (not start!78782) (not b!919489) (not b_lambda!13497) (not b!919479) (not b!919480) b_and!27729 (not b!919487) (not b_next!16995) tp_is_empty!19503 (not b!919486) (not b!919482) (not mapNonEmpty!31011) (not b!919485))
(check-sat b_and!27729 (not b_next!16995))
