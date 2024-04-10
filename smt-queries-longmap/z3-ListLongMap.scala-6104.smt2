; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78734 () Bool)

(assert start!78734)

(declare-fun b_free!16947 () Bool)

(declare-fun b_next!16947 () Bool)

(assert (=> start!78734 (= b_free!16947 (not b_next!16947))))

(declare-fun tp!59281 () Bool)

(declare-fun b_and!27631 () Bool)

(assert (=> start!78734 (= tp!59281 b_and!27631)))

(declare-fun b!918493 () Bool)

(declare-fun res!619274 () Bool)

(declare-fun e!515608 () Bool)

(assert (=> b!918493 (=> (not res!619274) (not e!515608))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!918493 (= res!619274 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918494 () Bool)

(declare-fun e!515602 () Bool)

(assert (=> b!918494 (= e!515602 (not true))))

(declare-datatypes ((V!30905 0))(
  ( (V!30906 (val!9778 Int)) )
))
(declare-datatypes ((tuple2!12704 0))(
  ( (tuple2!12705 (_1!6363 (_ BitVec 64)) (_2!6363 V!30905)) )
))
(declare-datatypes ((List!18510 0))(
  ( (Nil!18507) (Cons!18506 (h!19652 tuple2!12704) (t!26187 List!18510)) )
))
(declare-datatypes ((ListLongMap!11401 0))(
  ( (ListLongMap!11402 (toList!5716 List!18510)) )
))
(declare-fun lt!412263 () ListLongMap!11401)

(declare-fun lt!412259 () tuple2!12704)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4762 (ListLongMap!11401 (_ BitVec 64)) Bool)

(declare-fun +!2628 (ListLongMap!11401 tuple2!12704) ListLongMap!11401)

(assert (=> b!918494 (contains!4762 (+!2628 lt!412263 lt!412259) k0!1099)))

(declare-fun lt!412260 () (_ BitVec 64))

(declare-fun lt!412261 () V!30905)

(declare-datatypes ((Unit!31004 0))(
  ( (Unit!31005) )
))
(declare-fun lt!412262 () Unit!31004)

(declare-fun addStillContains!352 (ListLongMap!11401 (_ BitVec 64) V!30905 (_ BitVec 64)) Unit!31004)

(assert (=> b!918494 (= lt!412262 (addStillContains!352 lt!412263 lt!412260 lt!412261 k0!1099))))

(declare-datatypes ((array!54894 0))(
  ( (array!54895 (arr!26392 (Array (_ BitVec 32) (_ BitVec 64))) (size!26851 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54894)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9246 0))(
  ( (ValueCellFull!9246 (v!12296 V!30905)) (EmptyCell!9246) )
))
(declare-datatypes ((array!54896 0))(
  ( (array!54897 (arr!26393 (Array (_ BitVec 32) ValueCell!9246)) (size!26852 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54896)

(declare-fun defaultEntry!1235 () Int)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!30905)

(declare-fun minValue!1173 () V!30905)

(declare-fun getCurrentListMap!2972 (array!54894 array!54896 (_ BitVec 32) (_ BitVec 32) V!30905 V!30905 (_ BitVec 32) Int) ListLongMap!11401)

(assert (=> b!918494 (= (getCurrentListMap!2972 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2628 (getCurrentListMap!2972 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412259))))

(assert (=> b!918494 (= lt!412259 (tuple2!12705 lt!412260 lt!412261))))

(declare-fun get!13833 (ValueCell!9246 V!30905) V!30905)

(declare-fun dynLambda!1417 (Int (_ BitVec 64)) V!30905)

(assert (=> b!918494 (= lt!412261 (get!13833 (select (arr!26393 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1417 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412264 () Unit!31004)

(declare-fun lemmaListMapRecursiveValidKeyArray!18 (array!54894 array!54896 (_ BitVec 32) (_ BitVec 32) V!30905 V!30905 (_ BitVec 32) Int) Unit!31004)

(assert (=> b!918494 (= lt!412264 (lemmaListMapRecursiveValidKeyArray!18 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!918496 () Bool)

(declare-fun res!619278 () Bool)

(declare-fun e!515604 () Bool)

(assert (=> b!918496 (=> (not res!619278) (not e!515604))))

(assert (=> b!918496 (= res!619278 (and (= (size!26852 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26851 _keys!1487) (size!26852 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!918497 () Bool)

(assert (=> b!918497 (= e!515608 e!515602)))

(declare-fun res!619273 () Bool)

(assert (=> b!918497 (=> (not res!619273) (not e!515602))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918497 (= res!619273 (validKeyInArray!0 lt!412260))))

(assert (=> b!918497 (= lt!412260 (select (arr!26392 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!918498 () Bool)

(declare-fun res!619279 () Bool)

(assert (=> b!918498 (=> (not res!619279) (not e!515604))))

(assert (=> b!918498 (= res!619279 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26851 _keys!1487))))))

(declare-fun mapNonEmpty!30939 () Bool)

(declare-fun mapRes!30939 () Bool)

(declare-fun tp!59282 () Bool)

(declare-fun e!515607 () Bool)

(assert (=> mapNonEmpty!30939 (= mapRes!30939 (and tp!59282 e!515607))))

(declare-fun mapKey!30939 () (_ BitVec 32))

(declare-fun mapValue!30939 () ValueCell!9246)

(declare-fun mapRest!30939 () (Array (_ BitVec 32) ValueCell!9246))

(assert (=> mapNonEmpty!30939 (= (arr!26393 _values!1231) (store mapRest!30939 mapKey!30939 mapValue!30939))))

(declare-fun b!918499 () Bool)

(declare-fun res!619271 () Bool)

(assert (=> b!918499 (=> (not res!619271) (not e!515604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54894 (_ BitVec 32)) Bool)

(assert (=> b!918499 (= res!619271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!918500 () Bool)

(declare-fun tp_is_empty!19455 () Bool)

(assert (=> b!918500 (= e!515607 tp_is_empty!19455)))

(declare-fun b!918495 () Bool)

(assert (=> b!918495 (= e!515604 e!515608)))

(declare-fun res!619277 () Bool)

(assert (=> b!918495 (=> (not res!619277) (not e!515608))))

(assert (=> b!918495 (= res!619277 (contains!4762 lt!412263 k0!1099))))

(assert (=> b!918495 (= lt!412263 (getCurrentListMap!2972 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!619270 () Bool)

(assert (=> start!78734 (=> (not res!619270) (not e!515604))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78734 (= res!619270 (validMask!0 mask!1881))))

(assert (=> start!78734 e!515604))

(assert (=> start!78734 true))

(assert (=> start!78734 tp_is_empty!19455))

(declare-fun e!515605 () Bool)

(declare-fun array_inv!20574 (array!54896) Bool)

(assert (=> start!78734 (and (array_inv!20574 _values!1231) e!515605)))

(assert (=> start!78734 tp!59281))

(declare-fun array_inv!20575 (array!54894) Bool)

(assert (=> start!78734 (array_inv!20575 _keys!1487)))

(declare-fun b!918501 () Bool)

(declare-fun e!515603 () Bool)

(assert (=> b!918501 (= e!515605 (and e!515603 mapRes!30939))))

(declare-fun condMapEmpty!30939 () Bool)

(declare-fun mapDefault!30939 () ValueCell!9246)

(assert (=> b!918501 (= condMapEmpty!30939 (= (arr!26393 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9246)) mapDefault!30939)))))

(declare-fun b!918502 () Bool)

(assert (=> b!918502 (= e!515603 tp_is_empty!19455)))

(declare-fun b!918503 () Bool)

(declare-fun res!619275 () Bool)

(assert (=> b!918503 (=> (not res!619275) (not e!515608))))

(assert (=> b!918503 (= res!619275 (validKeyInArray!0 k0!1099))))

(declare-fun b!918504 () Bool)

(declare-fun res!619276 () Bool)

(assert (=> b!918504 (=> (not res!619276) (not e!515604))))

(declare-datatypes ((List!18511 0))(
  ( (Nil!18508) (Cons!18507 (h!19653 (_ BitVec 64)) (t!26188 List!18511)) )
))
(declare-fun arrayNoDuplicates!0 (array!54894 (_ BitVec 32) List!18511) Bool)

(assert (=> b!918504 (= res!619276 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18508))))

(declare-fun b!918505 () Bool)

(declare-fun res!619272 () Bool)

(assert (=> b!918505 (=> (not res!619272) (not e!515608))))

(declare-fun v!791 () V!30905)

(declare-fun apply!564 (ListLongMap!11401 (_ BitVec 64)) V!30905)

(assert (=> b!918505 (= res!619272 (= (apply!564 lt!412263 k0!1099) v!791))))

(declare-fun mapIsEmpty!30939 () Bool)

(assert (=> mapIsEmpty!30939 mapRes!30939))

(assert (= (and start!78734 res!619270) b!918496))

(assert (= (and b!918496 res!619278) b!918499))

(assert (= (and b!918499 res!619271) b!918504))

(assert (= (and b!918504 res!619276) b!918498))

(assert (= (and b!918498 res!619279) b!918495))

(assert (= (and b!918495 res!619277) b!918505))

(assert (= (and b!918505 res!619272) b!918493))

(assert (= (and b!918493 res!619274) b!918503))

(assert (= (and b!918503 res!619275) b!918497))

(assert (= (and b!918497 res!619273) b!918494))

(assert (= (and b!918501 condMapEmpty!30939) mapIsEmpty!30939))

(assert (= (and b!918501 (not condMapEmpty!30939)) mapNonEmpty!30939))

(get-info :version)

(assert (= (and mapNonEmpty!30939 ((_ is ValueCellFull!9246) mapValue!30939)) b!918500))

(assert (= (and b!918501 ((_ is ValueCellFull!9246) mapDefault!30939)) b!918502))

(assert (= start!78734 b!918501))

(declare-fun b_lambda!13449 () Bool)

(assert (=> (not b_lambda!13449) (not b!918494)))

(declare-fun t!26186 () Bool)

(declare-fun tb!5527 () Bool)

(assert (=> (and start!78734 (= defaultEntry!1235 defaultEntry!1235) t!26186) tb!5527))

(declare-fun result!10877 () Bool)

(assert (=> tb!5527 (= result!10877 tp_is_empty!19455)))

(assert (=> b!918494 t!26186))

(declare-fun b_and!27633 () Bool)

(assert (= b_and!27631 (and (=> t!26186 result!10877) b_and!27633)))

(declare-fun m!852167 () Bool)

(assert (=> b!918499 m!852167))

(declare-fun m!852169 () Bool)

(assert (=> b!918505 m!852169))

(declare-fun m!852171 () Bool)

(assert (=> b!918503 m!852171))

(declare-fun m!852173 () Bool)

(assert (=> b!918504 m!852173))

(declare-fun m!852175 () Bool)

(assert (=> b!918494 m!852175))

(declare-fun m!852177 () Bool)

(assert (=> b!918494 m!852177))

(declare-fun m!852179 () Bool)

(assert (=> b!918494 m!852179))

(declare-fun m!852181 () Bool)

(assert (=> b!918494 m!852181))

(assert (=> b!918494 m!852175))

(assert (=> b!918494 m!852181))

(declare-fun m!852183 () Bool)

(assert (=> b!918494 m!852183))

(declare-fun m!852185 () Bool)

(assert (=> b!918494 m!852185))

(declare-fun m!852187 () Bool)

(assert (=> b!918494 m!852187))

(declare-fun m!852189 () Bool)

(assert (=> b!918494 m!852189))

(declare-fun m!852191 () Bool)

(assert (=> b!918494 m!852191))

(assert (=> b!918494 m!852177))

(assert (=> b!918494 m!852189))

(declare-fun m!852193 () Bool)

(assert (=> b!918494 m!852193))

(declare-fun m!852195 () Bool)

(assert (=> start!78734 m!852195))

(declare-fun m!852197 () Bool)

(assert (=> start!78734 m!852197))

(declare-fun m!852199 () Bool)

(assert (=> start!78734 m!852199))

(declare-fun m!852201 () Bool)

(assert (=> b!918495 m!852201))

(declare-fun m!852203 () Bool)

(assert (=> b!918495 m!852203))

(declare-fun m!852205 () Bool)

(assert (=> b!918497 m!852205))

(declare-fun m!852207 () Bool)

(assert (=> b!918497 m!852207))

(declare-fun m!852209 () Bool)

(assert (=> mapNonEmpty!30939 m!852209))

(check-sat (not b!918499) (not b_lambda!13449) (not b!918505) tp_is_empty!19455 (not b!918503) (not b!918495) b_and!27633 (not b!918497) (not b!918504) (not mapNonEmpty!30939) (not b_next!16947) (not b!918494) (not start!78734))
(check-sat b_and!27633 (not b_next!16947))
