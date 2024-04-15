; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78720 () Bool)

(assert start!78720)

(declare-fun b_free!16951 () Bool)

(declare-fun b_next!16951 () Bool)

(assert (=> start!78720 (= b_free!16951 (not b_next!16951))))

(declare-fun tp!59295 () Bool)

(declare-fun b_and!27613 () Bool)

(assert (=> start!78720 (= tp!59295 b_and!27613)))

(declare-fun b!918336 () Bool)

(declare-fun res!619224 () Bool)

(declare-fun e!515501 () Bool)

(assert (=> b!918336 (=> (not res!619224) (not e!515501))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918336 (= res!619224 (validKeyInArray!0 k0!1099))))

(declare-fun b!918337 () Bool)

(declare-fun res!619222 () Bool)

(declare-fun e!515497 () Bool)

(assert (=> b!918337 (=> (not res!619222) (not e!515497))))

(declare-datatypes ((array!54885 0))(
  ( (array!54886 (arr!26388 (Array (_ BitVec 32) (_ BitVec 64))) (size!26849 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54885)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54885 (_ BitVec 32)) Bool)

(assert (=> b!918337 (= res!619222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!918338 () Bool)

(declare-fun res!619229 () Bool)

(assert (=> b!918338 (=> (not res!619229) (not e!515497))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!918338 (= res!619229 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26849 _keys!1487))))))

(declare-fun b!918339 () Bool)

(declare-fun e!515500 () Bool)

(assert (=> b!918339 (= e!515500 (not true))))

(declare-datatypes ((V!30911 0))(
  ( (V!30912 (val!9780 Int)) )
))
(declare-datatypes ((tuple2!12756 0))(
  ( (tuple2!12757 (_1!6389 (_ BitVec 64)) (_2!6389 V!30911)) )
))
(declare-datatypes ((List!18545 0))(
  ( (Nil!18542) (Cons!18541 (h!19687 tuple2!12756) (t!26217 List!18545)) )
))
(declare-datatypes ((ListLongMap!11443 0))(
  ( (ListLongMap!11444 (toList!5737 List!18545)) )
))
(declare-fun lt!412062 () ListLongMap!11443)

(declare-fun lt!412059 () tuple2!12756)

(declare-fun contains!4738 (ListLongMap!11443 (_ BitVec 64)) Bool)

(declare-fun +!2657 (ListLongMap!11443 tuple2!12756) ListLongMap!11443)

(assert (=> b!918339 (contains!4738 (+!2657 lt!412062 lt!412059) k0!1099)))

(declare-fun lt!412060 () (_ BitVec 64))

(declare-fun lt!412061 () V!30911)

(declare-datatypes ((Unit!30926 0))(
  ( (Unit!30927) )
))
(declare-fun lt!412064 () Unit!30926)

(declare-fun addStillContains!354 (ListLongMap!11443 (_ BitVec 64) V!30911 (_ BitVec 64)) Unit!30926)

(assert (=> b!918339 (= lt!412064 (addStillContains!354 lt!412062 lt!412060 lt!412061 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9248 0))(
  ( (ValueCellFull!9248 (v!12297 V!30911)) (EmptyCell!9248) )
))
(declare-datatypes ((array!54887 0))(
  ( (array!54888 (arr!26389 (Array (_ BitVec 32) ValueCell!9248)) (size!26850 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54887)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30911)

(declare-fun minValue!1173 () V!30911)

(declare-fun getCurrentListMap!2930 (array!54885 array!54887 (_ BitVec 32) (_ BitVec 32) V!30911 V!30911 (_ BitVec 32) Int) ListLongMap!11443)

(assert (=> b!918339 (= (getCurrentListMap!2930 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2657 (getCurrentListMap!2930 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412059))))

(assert (=> b!918339 (= lt!412059 (tuple2!12757 lt!412060 lt!412061))))

(declare-fun get!13836 (ValueCell!9248 V!30911) V!30911)

(declare-fun dynLambda!1413 (Int (_ BitVec 64)) V!30911)

(assert (=> b!918339 (= lt!412061 (get!13836 (select (arr!26389 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1413 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412063 () Unit!30926)

(declare-fun lemmaListMapRecursiveValidKeyArray!21 (array!54885 array!54887 (_ BitVec 32) (_ BitVec 32) V!30911 V!30911 (_ BitVec 32) Int) Unit!30926)

(assert (=> b!918339 (= lt!412063 (lemmaListMapRecursiveValidKeyArray!21 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!918340 () Bool)

(declare-fun res!619226 () Bool)

(assert (=> b!918340 (=> (not res!619226) (not e!515497))))

(declare-datatypes ((List!18546 0))(
  ( (Nil!18543) (Cons!18542 (h!19688 (_ BitVec 64)) (t!26218 List!18546)) )
))
(declare-fun arrayNoDuplicates!0 (array!54885 (_ BitVec 32) List!18546) Bool)

(assert (=> b!918340 (= res!619226 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18543))))

(declare-fun b!918341 () Bool)

(declare-fun res!619221 () Bool)

(assert (=> b!918341 (=> (not res!619221) (not e!515501))))

(assert (=> b!918341 (= res!619221 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918342 () Bool)

(declare-fun res!619220 () Bool)

(assert (=> b!918342 (=> (not res!619220) (not e!515501))))

(declare-fun v!791 () V!30911)

(declare-fun apply!570 (ListLongMap!11443 (_ BitVec 64)) V!30911)

(assert (=> b!918342 (= res!619220 (= (apply!570 lt!412062 k0!1099) v!791))))

(declare-fun b!918343 () Bool)

(declare-fun res!619227 () Bool)

(assert (=> b!918343 (=> (not res!619227) (not e!515497))))

(assert (=> b!918343 (= res!619227 (and (= (size!26850 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26849 _keys!1487) (size!26850 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!619223 () Bool)

(assert (=> start!78720 (=> (not res!619223) (not e!515497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78720 (= res!619223 (validMask!0 mask!1881))))

(assert (=> start!78720 e!515497))

(assert (=> start!78720 true))

(declare-fun tp_is_empty!19459 () Bool)

(assert (=> start!78720 tp_is_empty!19459))

(declare-fun e!515496 () Bool)

(declare-fun array_inv!20654 (array!54887) Bool)

(assert (=> start!78720 (and (array_inv!20654 _values!1231) e!515496)))

(assert (=> start!78720 tp!59295))

(declare-fun array_inv!20655 (array!54885) Bool)

(assert (=> start!78720 (array_inv!20655 _keys!1487)))

(declare-fun b!918344 () Bool)

(assert (=> b!918344 (= e!515501 e!515500)))

(declare-fun res!619228 () Bool)

(assert (=> b!918344 (=> (not res!619228) (not e!515500))))

(assert (=> b!918344 (= res!619228 (validKeyInArray!0 lt!412060))))

(assert (=> b!918344 (= lt!412060 (select (arr!26388 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapNonEmpty!30945 () Bool)

(declare-fun mapRes!30945 () Bool)

(declare-fun tp!59294 () Bool)

(declare-fun e!515502 () Bool)

(assert (=> mapNonEmpty!30945 (= mapRes!30945 (and tp!59294 e!515502))))

(declare-fun mapRest!30945 () (Array (_ BitVec 32) ValueCell!9248))

(declare-fun mapKey!30945 () (_ BitVec 32))

(declare-fun mapValue!30945 () ValueCell!9248)

(assert (=> mapNonEmpty!30945 (= (arr!26389 _values!1231) (store mapRest!30945 mapKey!30945 mapValue!30945))))

(declare-fun b!918345 () Bool)

(declare-fun e!515499 () Bool)

(assert (=> b!918345 (= e!515496 (and e!515499 mapRes!30945))))

(declare-fun condMapEmpty!30945 () Bool)

(declare-fun mapDefault!30945 () ValueCell!9248)

(assert (=> b!918345 (= condMapEmpty!30945 (= (arr!26389 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9248)) mapDefault!30945)))))

(declare-fun b!918346 () Bool)

(assert (=> b!918346 (= e!515502 tp_is_empty!19459)))

(declare-fun b!918347 () Bool)

(assert (=> b!918347 (= e!515497 e!515501)))

(declare-fun res!619225 () Bool)

(assert (=> b!918347 (=> (not res!619225) (not e!515501))))

(assert (=> b!918347 (= res!619225 (contains!4738 lt!412062 k0!1099))))

(assert (=> b!918347 (= lt!412062 (getCurrentListMap!2930 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!30945 () Bool)

(assert (=> mapIsEmpty!30945 mapRes!30945))

(declare-fun b!918348 () Bool)

(assert (=> b!918348 (= e!515499 tp_is_empty!19459)))

(assert (= (and start!78720 res!619223) b!918343))

(assert (= (and b!918343 res!619227) b!918337))

(assert (= (and b!918337 res!619222) b!918340))

(assert (= (and b!918340 res!619226) b!918338))

(assert (= (and b!918338 res!619229) b!918347))

(assert (= (and b!918347 res!619225) b!918342))

(assert (= (and b!918342 res!619220) b!918341))

(assert (= (and b!918341 res!619221) b!918336))

(assert (= (and b!918336 res!619224) b!918344))

(assert (= (and b!918344 res!619228) b!918339))

(assert (= (and b!918345 condMapEmpty!30945) mapIsEmpty!30945))

(assert (= (and b!918345 (not condMapEmpty!30945)) mapNonEmpty!30945))

(get-info :version)

(assert (= (and mapNonEmpty!30945 ((_ is ValueCellFull!9248) mapValue!30945)) b!918346))

(assert (= (and b!918345 ((_ is ValueCellFull!9248) mapDefault!30945)) b!918348))

(assert (= start!78720 b!918345))

(declare-fun b_lambda!13435 () Bool)

(assert (=> (not b_lambda!13435) (not b!918339)))

(declare-fun t!26216 () Bool)

(declare-fun tb!5523 () Bool)

(assert (=> (and start!78720 (= defaultEntry!1235 defaultEntry!1235) t!26216) tb!5523))

(declare-fun result!10877 () Bool)

(assert (=> tb!5523 (= result!10877 tp_is_empty!19459)))

(assert (=> b!918339 t!26216))

(declare-fun b_and!27615 () Bool)

(assert (= b_and!27613 (and (=> t!26216 result!10877) b_and!27615)))

(declare-fun m!851497 () Bool)

(assert (=> b!918342 m!851497))

(declare-fun m!851499 () Bool)

(assert (=> mapNonEmpty!30945 m!851499))

(declare-fun m!851501 () Bool)

(assert (=> b!918337 m!851501))

(declare-fun m!851503 () Bool)

(assert (=> b!918340 m!851503))

(declare-fun m!851505 () Bool)

(assert (=> b!918336 m!851505))

(declare-fun m!851507 () Bool)

(assert (=> b!918344 m!851507))

(declare-fun m!851509 () Bool)

(assert (=> b!918344 m!851509))

(declare-fun m!851511 () Bool)

(assert (=> start!78720 m!851511))

(declare-fun m!851513 () Bool)

(assert (=> start!78720 m!851513))

(declare-fun m!851515 () Bool)

(assert (=> start!78720 m!851515))

(declare-fun m!851517 () Bool)

(assert (=> b!918347 m!851517))

(declare-fun m!851519 () Bool)

(assert (=> b!918347 m!851519))

(declare-fun m!851521 () Bool)

(assert (=> b!918339 m!851521))

(declare-fun m!851523 () Bool)

(assert (=> b!918339 m!851523))

(declare-fun m!851525 () Bool)

(assert (=> b!918339 m!851525))

(declare-fun m!851527 () Bool)

(assert (=> b!918339 m!851527))

(declare-fun m!851529 () Bool)

(assert (=> b!918339 m!851529))

(declare-fun m!851531 () Bool)

(assert (=> b!918339 m!851531))

(declare-fun m!851533 () Bool)

(assert (=> b!918339 m!851533))

(assert (=> b!918339 m!851521))

(assert (=> b!918339 m!851527))

(assert (=> b!918339 m!851529))

(declare-fun m!851535 () Bool)

(assert (=> b!918339 m!851535))

(declare-fun m!851537 () Bool)

(assert (=> b!918339 m!851537))

(assert (=> b!918339 m!851533))

(declare-fun m!851539 () Bool)

(assert (=> b!918339 m!851539))

(check-sat (not b!918336) (not b!918339) (not b_lambda!13435) (not start!78720) (not b!918342) (not b_next!16951) b_and!27615 (not mapNonEmpty!30945) (not b!918337) (not b!918344) (not b!918347) (not b!918340) tp_is_empty!19459)
(check-sat b_and!27615 (not b_next!16951))
