; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79302 () Bool)

(assert start!79302)

(declare-fun b_free!17533 () Bool)

(declare-fun b_next!17533 () Bool)

(assert (=> start!79302 (= b_free!17533 (not b_next!17533))))

(declare-fun tp!61040 () Bool)

(declare-fun b_and!28591 () Bool)

(assert (=> start!79302 (= tp!61040 b_and!28591)))

(declare-fun b!931503 () Bool)

(declare-fun e!523106 () Bool)

(declare-fun e!523107 () Bool)

(assert (=> b!931503 (= e!523106 e!523107)))

(declare-fun res!627412 () Bool)

(assert (=> b!931503 (=> (not res!627412) (not e!523107))))

(declare-fun lt!419269 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!931503 (= res!627412 (validKeyInArray!0 lt!419269))))

(declare-datatypes ((array!55989 0))(
  ( (array!55990 (arr!26940 (Array (_ BitVec 32) (_ BitVec 64))) (size!27401 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55989)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!931503 (= lt!419269 (select (arr!26940 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!931504 () Bool)

(declare-fun res!627413 () Bool)

(declare-fun e!523104 () Bool)

(assert (=> b!931504 (=> (not res!627413) (not e!523104))))

(assert (=> b!931504 (= res!627413 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27401 _keys!1487))))))

(declare-fun mapIsEmpty!31818 () Bool)

(declare-fun mapRes!31818 () Bool)

(assert (=> mapIsEmpty!31818 mapRes!31818))

(declare-fun b!931505 () Bool)

(assert (=> b!931505 (= e!523104 e!523106)))

(declare-fun res!627414 () Bool)

(assert (=> b!931505 (=> (not res!627414) (not e!523106))))

(declare-datatypes ((V!31687 0))(
  ( (V!31688 (val!10071 Int)) )
))
(declare-datatypes ((tuple2!13244 0))(
  ( (tuple2!13245 (_1!6633 (_ BitVec 64)) (_2!6633 V!31687)) )
))
(declare-datatypes ((List!18998 0))(
  ( (Nil!18995) (Cons!18994 (h!20140 tuple2!13244) (t!27066 List!18998)) )
))
(declare-datatypes ((ListLongMap!11931 0))(
  ( (ListLongMap!11932 (toList!5981 List!18998)) )
))
(declare-fun lt!419273 () ListLongMap!11931)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4978 (ListLongMap!11931 (_ BitVec 64)) Bool)

(assert (=> b!931505 (= res!627414 (contains!4978 lt!419273 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9539 0))(
  ( (ValueCellFull!9539 (v!12588 V!31687)) (EmptyCell!9539) )
))
(declare-datatypes ((array!55991 0))(
  ( (array!55992 (arr!26941 (Array (_ BitVec 32) ValueCell!9539)) (size!27402 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55991)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31687)

(declare-fun minValue!1173 () V!31687)

(declare-fun getCurrentListMap!3155 (array!55989 array!55991 (_ BitVec 32) (_ BitVec 32) V!31687 V!31687 (_ BitVec 32) Int) ListLongMap!11931)

(assert (=> b!931505 (= lt!419273 (getCurrentListMap!3155 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!931506 () Bool)

(declare-fun res!627415 () Bool)

(assert (=> b!931506 (=> (not res!627415) (not e!523104))))

(assert (=> b!931506 (= res!627415 (and (= (size!27402 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27401 _keys!1487) (size!27402 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!931507 () Bool)

(assert (=> b!931507 (= e!523107 (not (bvslt (size!27401 _keys!1487) #b01111111111111111111111111111111)))))

(declare-fun lt!419272 () tuple2!13244)

(declare-fun +!2792 (ListLongMap!11931 tuple2!13244) ListLongMap!11931)

(assert (=> b!931507 (contains!4978 (+!2792 lt!419273 lt!419272) k0!1099)))

(declare-datatypes ((Unit!31349 0))(
  ( (Unit!31350) )
))
(declare-fun lt!419271 () Unit!31349)

(declare-fun lt!419270 () V!31687)

(declare-fun addStillContains!481 (ListLongMap!11931 (_ BitVec 64) V!31687 (_ BitVec 64)) Unit!31349)

(assert (=> b!931507 (= lt!419271 (addStillContains!481 lt!419273 lt!419269 lt!419270 k0!1099))))

(assert (=> b!931507 (= (getCurrentListMap!3155 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2792 (getCurrentListMap!3155 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419272))))

(assert (=> b!931507 (= lt!419272 (tuple2!13245 lt!419269 lt!419270))))

(declare-fun get!14165 (ValueCell!9539 V!31687) V!31687)

(declare-fun dynLambda!1548 (Int (_ BitVec 64)) V!31687)

(assert (=> b!931507 (= lt!419270 (get!14165 (select (arr!26941 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1548 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!419268 () Unit!31349)

(declare-fun lemmaListMapRecursiveValidKeyArray!156 (array!55989 array!55991 (_ BitVec 32) (_ BitVec 32) V!31687 V!31687 (_ BitVec 32) Int) Unit!31349)

(assert (=> b!931507 (= lt!419268 (lemmaListMapRecursiveValidKeyArray!156 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!931508 () Bool)

(declare-fun res!627411 () Bool)

(assert (=> b!931508 (=> (not res!627411) (not e!523104))))

(declare-datatypes ((List!18999 0))(
  ( (Nil!18996) (Cons!18995 (h!20141 (_ BitVec 64)) (t!27067 List!18999)) )
))
(declare-fun arrayNoDuplicates!0 (array!55989 (_ BitVec 32) List!18999) Bool)

(assert (=> b!931508 (= res!627411 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18996))))

(declare-fun mapNonEmpty!31818 () Bool)

(declare-fun tp!61041 () Bool)

(declare-fun e!523103 () Bool)

(assert (=> mapNonEmpty!31818 (= mapRes!31818 (and tp!61041 e!523103))))

(declare-fun mapRest!31818 () (Array (_ BitVec 32) ValueCell!9539))

(declare-fun mapKey!31818 () (_ BitVec 32))

(declare-fun mapValue!31818 () ValueCell!9539)

(assert (=> mapNonEmpty!31818 (= (arr!26941 _values!1231) (store mapRest!31818 mapKey!31818 mapValue!31818))))

(declare-fun b!931509 () Bool)

(declare-fun res!627418 () Bool)

(assert (=> b!931509 (=> (not res!627418) (not e!523106))))

(assert (=> b!931509 (= res!627418 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!931510 () Bool)

(declare-fun e!523102 () Bool)

(declare-fun tp_is_empty!20041 () Bool)

(assert (=> b!931510 (= e!523102 tp_is_empty!20041)))

(declare-fun b!931511 () Bool)

(declare-fun res!627416 () Bool)

(assert (=> b!931511 (=> (not res!627416) (not e!523106))))

(assert (=> b!931511 (= res!627416 (validKeyInArray!0 k0!1099))))

(declare-fun res!627410 () Bool)

(assert (=> start!79302 (=> (not res!627410) (not e!523104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79302 (= res!627410 (validMask!0 mask!1881))))

(assert (=> start!79302 e!523104))

(assert (=> start!79302 true))

(assert (=> start!79302 tp_is_empty!20041))

(declare-fun e!523101 () Bool)

(declare-fun array_inv!21036 (array!55991) Bool)

(assert (=> start!79302 (and (array_inv!21036 _values!1231) e!523101)))

(assert (=> start!79302 tp!61040))

(declare-fun array_inv!21037 (array!55989) Bool)

(assert (=> start!79302 (array_inv!21037 _keys!1487)))

(declare-fun b!931512 () Bool)

(assert (=> b!931512 (= e!523103 tp_is_empty!20041)))

(declare-fun b!931513 () Bool)

(declare-fun res!627419 () Bool)

(assert (=> b!931513 (=> (not res!627419) (not e!523106))))

(declare-fun v!791 () V!31687)

(declare-fun apply!773 (ListLongMap!11931 (_ BitVec 64)) V!31687)

(assert (=> b!931513 (= res!627419 (= (apply!773 lt!419273 k0!1099) v!791))))

(declare-fun b!931514 () Bool)

(declare-fun res!627417 () Bool)

(assert (=> b!931514 (=> (not res!627417) (not e!523104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55989 (_ BitVec 32)) Bool)

(assert (=> b!931514 (= res!627417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!931515 () Bool)

(assert (=> b!931515 (= e!523101 (and e!523102 mapRes!31818))))

(declare-fun condMapEmpty!31818 () Bool)

(declare-fun mapDefault!31818 () ValueCell!9539)

(assert (=> b!931515 (= condMapEmpty!31818 (= (arr!26941 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9539)) mapDefault!31818)))))

(assert (= (and start!79302 res!627410) b!931506))

(assert (= (and b!931506 res!627415) b!931514))

(assert (= (and b!931514 res!627417) b!931508))

(assert (= (and b!931508 res!627411) b!931504))

(assert (= (and b!931504 res!627413) b!931505))

(assert (= (and b!931505 res!627414) b!931513))

(assert (= (and b!931513 res!627419) b!931509))

(assert (= (and b!931509 res!627418) b!931511))

(assert (= (and b!931511 res!627416) b!931503))

(assert (= (and b!931503 res!627412) b!931507))

(assert (= (and b!931515 condMapEmpty!31818) mapIsEmpty!31818))

(assert (= (and b!931515 (not condMapEmpty!31818)) mapNonEmpty!31818))

(get-info :version)

(assert (= (and mapNonEmpty!31818 ((_ is ValueCellFull!9539) mapValue!31818)) b!931512))

(assert (= (and b!931515 ((_ is ValueCellFull!9539) mapDefault!31818)) b!931510))

(assert (= start!79302 b!931515))

(declare-fun b_lambda!13831 () Bool)

(assert (=> (not b_lambda!13831) (not b!931507)))

(declare-fun t!27065 () Bool)

(declare-fun tb!5919 () Bool)

(assert (=> (and start!79302 (= defaultEntry!1235 defaultEntry!1235) t!27065) tb!5919))

(declare-fun result!11669 () Bool)

(assert (=> tb!5919 (= result!11669 tp_is_empty!20041)))

(assert (=> b!931507 t!27065))

(declare-fun b_and!28593 () Bool)

(assert (= b_and!28591 (and (=> t!27065 result!11669) b_and!28593)))

(declare-fun m!864847 () Bool)

(assert (=> b!931505 m!864847))

(declare-fun m!864849 () Bool)

(assert (=> b!931505 m!864849))

(declare-fun m!864851 () Bool)

(assert (=> b!931507 m!864851))

(declare-fun m!864853 () Bool)

(assert (=> b!931507 m!864853))

(declare-fun m!864855 () Bool)

(assert (=> b!931507 m!864855))

(declare-fun m!864857 () Bool)

(assert (=> b!931507 m!864857))

(assert (=> b!931507 m!864853))

(assert (=> b!931507 m!864855))

(declare-fun m!864859 () Bool)

(assert (=> b!931507 m!864859))

(declare-fun m!864861 () Bool)

(assert (=> b!931507 m!864861))

(assert (=> b!931507 m!864851))

(declare-fun m!864863 () Bool)

(assert (=> b!931507 m!864863))

(declare-fun m!864865 () Bool)

(assert (=> b!931507 m!864865))

(assert (=> b!931507 m!864865))

(declare-fun m!864867 () Bool)

(assert (=> b!931507 m!864867))

(declare-fun m!864869 () Bool)

(assert (=> b!931507 m!864869))

(declare-fun m!864871 () Bool)

(assert (=> b!931513 m!864871))

(declare-fun m!864873 () Bool)

(assert (=> b!931514 m!864873))

(declare-fun m!864875 () Bool)

(assert (=> b!931508 m!864875))

(declare-fun m!864877 () Bool)

(assert (=> b!931511 m!864877))

(declare-fun m!864879 () Bool)

(assert (=> b!931503 m!864879))

(declare-fun m!864881 () Bool)

(assert (=> b!931503 m!864881))

(declare-fun m!864883 () Bool)

(assert (=> start!79302 m!864883))

(declare-fun m!864885 () Bool)

(assert (=> start!79302 m!864885))

(declare-fun m!864887 () Bool)

(assert (=> start!79302 m!864887))

(declare-fun m!864889 () Bool)

(assert (=> mapNonEmpty!31818 m!864889))

(check-sat (not b!931511) (not mapNonEmpty!31818) (not b!931503) (not b_next!17533) (not b!931505) (not b!931507) tp_is_empty!20041 (not start!79302) (not b!931513) (not b!931514) b_and!28593 (not b!931508) (not b_lambda!13831))
(check-sat b_and!28593 (not b_next!17533))
(get-model)

(declare-fun b_lambda!13837 () Bool)

(assert (= b_lambda!13831 (or (and start!79302 b_free!17533) b_lambda!13837)))

(check-sat (not b!931511) (not mapNonEmpty!31818) (not b_lambda!13837) (not b!931503) (not b_next!17533) (not b!931505) (not b!931507) (not b!931508) tp_is_empty!20041 (not start!79302) (not b!931513) (not b!931514) b_and!28593)
(check-sat b_and!28593 (not b_next!17533))
(get-model)

(declare-fun b!931642 () Bool)

(declare-fun e!523185 () Bool)

(declare-fun lt!419373 () ListLongMap!11931)

(assert (=> b!931642 (= e!523185 (= (apply!773 lt!419373 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40535 () Bool)

(declare-fun call!40541 () ListLongMap!11931)

(declare-fun call!40540 () ListLongMap!11931)

(assert (=> bm!40535 (= call!40541 call!40540)))

(declare-fun bm!40536 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3334 (array!55989 array!55991 (_ BitVec 32) (_ BitVec 32) V!31687 V!31687 (_ BitVec 32) Int) ListLongMap!11931)

(assert (=> bm!40536 (= call!40540 (getCurrentListMapNoExtraKeys!3334 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun b!931643 () Bool)

(declare-fun e!523183 () ListLongMap!11931)

(declare-fun call!40544 () ListLongMap!11931)

(assert (=> b!931643 (= e!523183 call!40544)))

(declare-fun b!931644 () Bool)

(declare-fun e!523188 () Unit!31349)

(declare-fun lt!419366 () Unit!31349)

(assert (=> b!931644 (= e!523188 lt!419366)))

(declare-fun lt!419369 () ListLongMap!11931)

(assert (=> b!931644 (= lt!419369 (getCurrentListMapNoExtraKeys!3334 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!419374 () (_ BitVec 64))

(assert (=> b!931644 (= lt!419374 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419367 () (_ BitVec 64))

(assert (=> b!931644 (= lt!419367 (select (arr!26940 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!419359 () Unit!31349)

(assert (=> b!931644 (= lt!419359 (addStillContains!481 lt!419369 lt!419374 zeroValue!1173 lt!419367))))

(assert (=> b!931644 (contains!4978 (+!2792 lt!419369 (tuple2!13245 lt!419374 zeroValue!1173)) lt!419367)))

(declare-fun lt!419365 () Unit!31349)

(assert (=> b!931644 (= lt!419365 lt!419359)))

(declare-fun lt!419372 () ListLongMap!11931)

(assert (=> b!931644 (= lt!419372 (getCurrentListMapNoExtraKeys!3334 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!419362 () (_ BitVec 64))

(assert (=> b!931644 (= lt!419362 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419358 () (_ BitVec 64))

(assert (=> b!931644 (= lt!419358 (select (arr!26940 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!419364 () Unit!31349)

(declare-fun addApplyDifferent!412 (ListLongMap!11931 (_ BitVec 64) V!31687 (_ BitVec 64)) Unit!31349)

(assert (=> b!931644 (= lt!419364 (addApplyDifferent!412 lt!419372 lt!419362 minValue!1173 lt!419358))))

(assert (=> b!931644 (= (apply!773 (+!2792 lt!419372 (tuple2!13245 lt!419362 minValue!1173)) lt!419358) (apply!773 lt!419372 lt!419358))))

(declare-fun lt!419356 () Unit!31349)

(assert (=> b!931644 (= lt!419356 lt!419364)))

(declare-fun lt!419375 () ListLongMap!11931)

(assert (=> b!931644 (= lt!419375 (getCurrentListMapNoExtraKeys!3334 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!419368 () (_ BitVec 64))

(assert (=> b!931644 (= lt!419368 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419360 () (_ BitVec 64))

(assert (=> b!931644 (= lt!419360 (select (arr!26940 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!419361 () Unit!31349)

(assert (=> b!931644 (= lt!419361 (addApplyDifferent!412 lt!419375 lt!419368 zeroValue!1173 lt!419360))))

(assert (=> b!931644 (= (apply!773 (+!2792 lt!419375 (tuple2!13245 lt!419368 zeroValue!1173)) lt!419360) (apply!773 lt!419375 lt!419360))))

(declare-fun lt!419357 () Unit!31349)

(assert (=> b!931644 (= lt!419357 lt!419361)))

(declare-fun lt!419371 () ListLongMap!11931)

(assert (=> b!931644 (= lt!419371 (getCurrentListMapNoExtraKeys!3334 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!419354 () (_ BitVec 64))

(assert (=> b!931644 (= lt!419354 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419363 () (_ BitVec 64))

(assert (=> b!931644 (= lt!419363 (select (arr!26940 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!931644 (= lt!419366 (addApplyDifferent!412 lt!419371 lt!419354 minValue!1173 lt!419363))))

(assert (=> b!931644 (= (apply!773 (+!2792 lt!419371 (tuple2!13245 lt!419354 minValue!1173)) lt!419363) (apply!773 lt!419371 lt!419363))))

(declare-fun b!931645 () Bool)

(declare-fun e!523182 () ListLongMap!11931)

(assert (=> b!931645 (= e!523182 e!523183)))

(declare-fun c!96981 () Bool)

(assert (=> b!931645 (= c!96981 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!931646 () Bool)

(declare-fun e!523181 () Bool)

(assert (=> b!931646 (= e!523181 (validKeyInArray!0 (select (arr!26940 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun d!112829 () Bool)

(declare-fun e!523180 () Bool)

(assert (=> d!112829 e!523180))

(declare-fun res!627502 () Bool)

(assert (=> d!112829 (=> (not res!627502) (not e!523180))))

(assert (=> d!112829 (= res!627502 (or (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27401 _keys!1487)) (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27401 _keys!1487)))))))

(declare-fun lt!419370 () ListLongMap!11931)

(assert (=> d!112829 (= lt!419373 lt!419370)))

(declare-fun lt!419355 () Unit!31349)

(assert (=> d!112829 (= lt!419355 e!523188)))

(declare-fun c!96980 () Bool)

(assert (=> d!112829 (= c!96980 e!523181)))

(declare-fun res!627500 () Bool)

(assert (=> d!112829 (=> (not res!627500) (not e!523181))))

(assert (=> d!112829 (= res!627500 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27401 _keys!1487)))))

(assert (=> d!112829 (= lt!419370 e!523182)))

(declare-fun c!96983 () Bool)

(assert (=> d!112829 (= c!96983 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112829 (validMask!0 mask!1881)))

(assert (=> d!112829 (= (getCurrentListMap!3155 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419373)))

(declare-fun b!931647 () Bool)

(declare-fun res!627501 () Bool)

(assert (=> b!931647 (=> (not res!627501) (not e!523180))))

(declare-fun e!523177 () Bool)

(assert (=> b!931647 (= res!627501 e!523177)))

(declare-fun c!96982 () Bool)

(assert (=> b!931647 (= c!96982 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40537 () Bool)

(declare-fun call!40538 () Bool)

(assert (=> bm!40537 (= call!40538 (contains!4978 lt!419373 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!931648 () Bool)

(assert (=> b!931648 (= e!523177 (not call!40538))))

(declare-fun b!931649 () Bool)

(declare-fun e!523178 () Bool)

(assert (=> b!931649 (= e!523178 (= (apply!773 lt!419373 (select (arr!26940 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14165 (select (arr!26941 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1548 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!931649 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27402 _values!1231)))))

(assert (=> b!931649 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27401 _keys!1487)))))

(declare-fun b!931650 () Bool)

(declare-fun e!523176 () Bool)

(declare-fun call!40542 () Bool)

(assert (=> b!931650 (= e!523176 (not call!40542))))

(declare-fun b!931651 () Bool)

(declare-fun e!523179 () Bool)

(assert (=> b!931651 (= e!523177 e!523179)))

(declare-fun res!627505 () Bool)

(assert (=> b!931651 (= res!627505 call!40538)))

(assert (=> b!931651 (=> (not res!627505) (not e!523179))))

(declare-fun bm!40538 () Bool)

(declare-fun call!40539 () ListLongMap!11931)

(assert (=> bm!40538 (= call!40539 call!40541)))

(declare-fun b!931652 () Bool)

(declare-fun e!523184 () Bool)

(assert (=> b!931652 (= e!523184 (validKeyInArray!0 (select (arr!26940 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!931653 () Bool)

(assert (=> b!931653 (= e!523179 (= (apply!773 lt!419373 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun bm!40539 () Bool)

(declare-fun call!40543 () ListLongMap!11931)

(assert (=> bm!40539 (= call!40544 call!40543)))

(declare-fun b!931654 () Bool)

(declare-fun Unit!31353 () Unit!31349)

(assert (=> b!931654 (= e!523188 Unit!31353)))

(declare-fun b!931655 () Bool)

(declare-fun c!96984 () Bool)

(assert (=> b!931655 (= c!96984 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!523186 () ListLongMap!11931)

(assert (=> b!931655 (= e!523183 e!523186)))

(declare-fun b!931656 () Bool)

(assert (=> b!931656 (= e!523186 call!40544)))

(declare-fun b!931657 () Bool)

(assert (=> b!931657 (= e!523182 (+!2792 call!40543 (tuple2!13245 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun bm!40540 () Bool)

(assert (=> bm!40540 (= call!40542 (contains!4978 lt!419373 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!931658 () Bool)

(assert (=> b!931658 (= e!523186 call!40539)))

(declare-fun b!931659 () Bool)

(declare-fun e!523187 () Bool)

(assert (=> b!931659 (= e!523187 e!523178)))

(declare-fun res!627503 () Bool)

(assert (=> b!931659 (=> (not res!627503) (not e!523178))))

(assert (=> b!931659 (= res!627503 (contains!4978 lt!419373 (select (arr!26940 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!931659 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27401 _keys!1487)))))

(declare-fun bm!40541 () Bool)

(assert (=> bm!40541 (= call!40543 (+!2792 (ite c!96983 call!40540 (ite c!96981 call!40541 call!40539)) (ite (or c!96983 c!96981) (tuple2!13245 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13245 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!931660 () Bool)

(assert (=> b!931660 (= e!523176 e!523185)))

(declare-fun res!627499 () Bool)

(assert (=> b!931660 (= res!627499 call!40542)))

(assert (=> b!931660 (=> (not res!627499) (not e!523185))))

(declare-fun b!931661 () Bool)

(declare-fun res!627506 () Bool)

(assert (=> b!931661 (=> (not res!627506) (not e!523180))))

(assert (=> b!931661 (= res!627506 e!523187)))

(declare-fun res!627504 () Bool)

(assert (=> b!931661 (=> res!627504 e!523187)))

(assert (=> b!931661 (= res!627504 (not e!523184))))

(declare-fun res!627498 () Bool)

(assert (=> b!931661 (=> (not res!627498) (not e!523184))))

(assert (=> b!931661 (= res!627498 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27401 _keys!1487)))))

(declare-fun b!931662 () Bool)

(assert (=> b!931662 (= e!523180 e!523176)))

(declare-fun c!96985 () Bool)

(assert (=> b!931662 (= c!96985 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!112829 c!96983) b!931657))

(assert (= (and d!112829 (not c!96983)) b!931645))

(assert (= (and b!931645 c!96981) b!931643))

(assert (= (and b!931645 (not c!96981)) b!931655))

(assert (= (and b!931655 c!96984) b!931656))

(assert (= (and b!931655 (not c!96984)) b!931658))

(assert (= (or b!931656 b!931658) bm!40538))

(assert (= (or b!931643 bm!40538) bm!40535))

(assert (= (or b!931643 b!931656) bm!40539))

(assert (= (or b!931657 bm!40535) bm!40536))

(assert (= (or b!931657 bm!40539) bm!40541))

(assert (= (and d!112829 res!627500) b!931646))

(assert (= (and d!112829 c!96980) b!931644))

(assert (= (and d!112829 (not c!96980)) b!931654))

(assert (= (and d!112829 res!627502) b!931661))

(assert (= (and b!931661 res!627498) b!931652))

(assert (= (and b!931661 (not res!627504)) b!931659))

(assert (= (and b!931659 res!627503) b!931649))

(assert (= (and b!931661 res!627506) b!931647))

(assert (= (and b!931647 c!96982) b!931651))

(assert (= (and b!931647 (not c!96982)) b!931648))

(assert (= (and b!931651 res!627505) b!931653))

(assert (= (or b!931651 b!931648) bm!40537))

(assert (= (and b!931647 res!627501) b!931662))

(assert (= (and b!931662 c!96985) b!931660))

(assert (= (and b!931662 (not c!96985)) b!931650))

(assert (= (and b!931660 res!627499) b!931642))

(assert (= (or b!931660 b!931650) bm!40540))

(declare-fun b_lambda!13839 () Bool)

(assert (=> (not b_lambda!13839) (not b!931649)))

(assert (=> b!931649 t!27065))

(declare-fun b_and!28603 () Bool)

(assert (= b_and!28593 (and (=> t!27065 result!11669) b_and!28603)))

(declare-fun m!864979 () Bool)

(assert (=> bm!40536 m!864979))

(assert (=> d!112829 m!864883))

(declare-fun m!864981 () Bool)

(assert (=> b!931653 m!864981))

(declare-fun m!864983 () Bool)

(assert (=> bm!40541 m!864983))

(declare-fun m!864985 () Bool)

(assert (=> b!931652 m!864985))

(assert (=> b!931652 m!864985))

(declare-fun m!864987 () Bool)

(assert (=> b!931652 m!864987))

(declare-fun m!864989 () Bool)

(assert (=> b!931657 m!864989))

(declare-fun m!864991 () Bool)

(assert (=> bm!40540 m!864991))

(declare-fun m!864993 () Bool)

(assert (=> b!931642 m!864993))

(assert (=> b!931649 m!864985))

(declare-fun m!864995 () Bool)

(assert (=> b!931649 m!864995))

(assert (=> b!931649 m!864855))

(declare-fun m!864997 () Bool)

(assert (=> b!931649 m!864997))

(assert (=> b!931649 m!864855))

(declare-fun m!864999 () Bool)

(assert (=> b!931649 m!864999))

(assert (=> b!931649 m!864997))

(assert (=> b!931649 m!864985))

(assert (=> b!931646 m!864985))

(assert (=> b!931646 m!864985))

(assert (=> b!931646 m!864987))

(assert (=> b!931659 m!864985))

(assert (=> b!931659 m!864985))

(declare-fun m!865001 () Bool)

(assert (=> b!931659 m!865001))

(declare-fun m!865003 () Bool)

(assert (=> b!931644 m!865003))

(declare-fun m!865005 () Bool)

(assert (=> b!931644 m!865005))

(declare-fun m!865007 () Bool)

(assert (=> b!931644 m!865007))

(declare-fun m!865009 () Bool)

(assert (=> b!931644 m!865009))

(declare-fun m!865011 () Bool)

(assert (=> b!931644 m!865011))

(declare-fun m!865013 () Bool)

(assert (=> b!931644 m!865013))

(declare-fun m!865015 () Bool)

(assert (=> b!931644 m!865015))

(declare-fun m!865017 () Bool)

(assert (=> b!931644 m!865017))

(declare-fun m!865019 () Bool)

(assert (=> b!931644 m!865019))

(declare-fun m!865021 () Bool)

(assert (=> b!931644 m!865021))

(declare-fun m!865023 () Bool)

(assert (=> b!931644 m!865023))

(assert (=> b!931644 m!864979))

(assert (=> b!931644 m!865013))

(declare-fun m!865025 () Bool)

(assert (=> b!931644 m!865025))

(assert (=> b!931644 m!865003))

(declare-fun m!865027 () Bool)

(assert (=> b!931644 m!865027))

(assert (=> b!931644 m!865021))

(declare-fun m!865029 () Bool)

(assert (=> b!931644 m!865029))

(assert (=> b!931644 m!865005))

(declare-fun m!865031 () Bool)

(assert (=> b!931644 m!865031))

(assert (=> b!931644 m!864985))

(declare-fun m!865033 () Bool)

(assert (=> bm!40537 m!865033))

(assert (=> b!931507 d!112829))

(declare-fun d!112831 () Bool)

(declare-fun e!523191 () Bool)

(assert (=> d!112831 e!523191))

(declare-fun res!627509 () Bool)

(assert (=> d!112831 (=> (not res!627509) (not e!523191))))

(assert (=> d!112831 (= res!627509 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27401 _keys!1487)) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27402 _values!1231))))))

(declare-fun lt!419378 () Unit!31349)

(declare-fun choose!1548 (array!55989 array!55991 (_ BitVec 32) (_ BitVec 32) V!31687 V!31687 (_ BitVec 32) Int) Unit!31349)

(assert (=> d!112831 (= lt!419378 (choose!1548 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> d!112831 (validMask!0 mask!1881)))

(assert (=> d!112831 (= (lemmaListMapRecursiveValidKeyArray!156 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!419378)))

(declare-fun b!931665 () Bool)

(assert (=> b!931665 (= e!523191 (= (getCurrentListMap!3155 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2792 (getCurrentListMap!3155 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13245 (select (arr!26940 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14165 (select (arr!26941 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1548 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!112831 res!627509) b!931665))

(declare-fun b_lambda!13841 () Bool)

(assert (=> (not b_lambda!13841) (not b!931665)))

(assert (=> b!931665 t!27065))

(declare-fun b_and!28605 () Bool)

(assert (= b_and!28603 (and (=> t!27065 result!11669) b_and!28605)))

(declare-fun m!865035 () Bool)

(assert (=> d!112831 m!865035))

(assert (=> d!112831 m!864883))

(declare-fun m!865037 () Bool)

(assert (=> b!931665 m!865037))

(declare-fun m!865039 () Bool)

(assert (=> b!931665 m!865039))

(assert (=> b!931665 m!864855))

(assert (=> b!931665 m!864853))

(assert (=> b!931665 m!864855))

(assert (=> b!931665 m!864859))

(assert (=> b!931665 m!864861))

(assert (=> b!931665 m!864853))

(assert (=> b!931665 m!864881))

(assert (=> b!931665 m!865037))

(assert (=> b!931507 d!112831))

(declare-fun d!112833 () Bool)

(assert (=> d!112833 (contains!4978 (+!2792 lt!419273 (tuple2!13245 lt!419269 lt!419270)) k0!1099)))

(declare-fun lt!419381 () Unit!31349)

(declare-fun choose!1549 (ListLongMap!11931 (_ BitVec 64) V!31687 (_ BitVec 64)) Unit!31349)

(assert (=> d!112833 (= lt!419381 (choose!1549 lt!419273 lt!419269 lt!419270 k0!1099))))

(assert (=> d!112833 (contains!4978 lt!419273 k0!1099)))

(assert (=> d!112833 (= (addStillContains!481 lt!419273 lt!419269 lt!419270 k0!1099) lt!419381)))

(declare-fun bs!26147 () Bool)

(assert (= bs!26147 d!112833))

(declare-fun m!865041 () Bool)

(assert (=> bs!26147 m!865041))

(assert (=> bs!26147 m!865041))

(declare-fun m!865043 () Bool)

(assert (=> bs!26147 m!865043))

(declare-fun m!865045 () Bool)

(assert (=> bs!26147 m!865045))

(assert (=> bs!26147 m!864847))

(assert (=> b!931507 d!112833))

(declare-fun d!112835 () Bool)

(declare-fun e!523196 () Bool)

(assert (=> d!112835 e!523196))

(declare-fun res!627512 () Bool)

(assert (=> d!112835 (=> res!627512 e!523196)))

(declare-fun lt!419392 () Bool)

(assert (=> d!112835 (= res!627512 (not lt!419392))))

(declare-fun lt!419393 () Bool)

(assert (=> d!112835 (= lt!419392 lt!419393)))

(declare-fun lt!419391 () Unit!31349)

(declare-fun e!523197 () Unit!31349)

(assert (=> d!112835 (= lt!419391 e!523197)))

(declare-fun c!96988 () Bool)

(assert (=> d!112835 (= c!96988 lt!419393)))

(declare-fun containsKey!445 (List!18998 (_ BitVec 64)) Bool)

(assert (=> d!112835 (= lt!419393 (containsKey!445 (toList!5981 (+!2792 lt!419273 lt!419272)) k0!1099))))

(assert (=> d!112835 (= (contains!4978 (+!2792 lt!419273 lt!419272) k0!1099) lt!419392)))

(declare-fun b!931673 () Bool)

(declare-fun lt!419390 () Unit!31349)

(assert (=> b!931673 (= e!523197 lt!419390)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!340 (List!18998 (_ BitVec 64)) Unit!31349)

(assert (=> b!931673 (= lt!419390 (lemmaContainsKeyImpliesGetValueByKeyDefined!340 (toList!5981 (+!2792 lt!419273 lt!419272)) k0!1099))))

(declare-datatypes ((Option!487 0))(
  ( (Some!486 (v!12591 V!31687)) (None!485) )
))
(declare-fun isDefined!353 (Option!487) Bool)

(declare-fun getValueByKey!481 (List!18998 (_ BitVec 64)) Option!487)

(assert (=> b!931673 (isDefined!353 (getValueByKey!481 (toList!5981 (+!2792 lt!419273 lt!419272)) k0!1099))))

(declare-fun b!931674 () Bool)

(declare-fun Unit!31354 () Unit!31349)

(assert (=> b!931674 (= e!523197 Unit!31354)))

(declare-fun b!931675 () Bool)

(assert (=> b!931675 (= e!523196 (isDefined!353 (getValueByKey!481 (toList!5981 (+!2792 lt!419273 lt!419272)) k0!1099)))))

(assert (= (and d!112835 c!96988) b!931673))

(assert (= (and d!112835 (not c!96988)) b!931674))

(assert (= (and d!112835 (not res!627512)) b!931675))

(declare-fun m!865047 () Bool)

(assert (=> d!112835 m!865047))

(declare-fun m!865049 () Bool)

(assert (=> b!931673 m!865049))

(declare-fun m!865051 () Bool)

(assert (=> b!931673 m!865051))

(assert (=> b!931673 m!865051))

(declare-fun m!865053 () Bool)

(assert (=> b!931673 m!865053))

(assert (=> b!931675 m!865051))

(assert (=> b!931675 m!865051))

(assert (=> b!931675 m!865053))

(assert (=> b!931507 d!112835))

(declare-fun d!112837 () Bool)

(declare-fun e!523200 () Bool)

(assert (=> d!112837 e!523200))

(declare-fun res!627518 () Bool)

(assert (=> d!112837 (=> (not res!627518) (not e!523200))))

(declare-fun lt!419403 () ListLongMap!11931)

(assert (=> d!112837 (= res!627518 (contains!4978 lt!419403 (_1!6633 lt!419272)))))

(declare-fun lt!419402 () List!18998)

(assert (=> d!112837 (= lt!419403 (ListLongMap!11932 lt!419402))))

(declare-fun lt!419404 () Unit!31349)

(declare-fun lt!419405 () Unit!31349)

(assert (=> d!112837 (= lt!419404 lt!419405)))

(assert (=> d!112837 (= (getValueByKey!481 lt!419402 (_1!6633 lt!419272)) (Some!486 (_2!6633 lt!419272)))))

(declare-fun lemmaContainsTupThenGetReturnValue!255 (List!18998 (_ BitVec 64) V!31687) Unit!31349)

(assert (=> d!112837 (= lt!419405 (lemmaContainsTupThenGetReturnValue!255 lt!419402 (_1!6633 lt!419272) (_2!6633 lt!419272)))))

(declare-fun insertStrictlySorted!312 (List!18998 (_ BitVec 64) V!31687) List!18998)

(assert (=> d!112837 (= lt!419402 (insertStrictlySorted!312 (toList!5981 (getCurrentListMap!3155 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)) (_1!6633 lt!419272) (_2!6633 lt!419272)))))

(assert (=> d!112837 (= (+!2792 (getCurrentListMap!3155 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419272) lt!419403)))

(declare-fun b!931680 () Bool)

(declare-fun res!627517 () Bool)

(assert (=> b!931680 (=> (not res!627517) (not e!523200))))

(assert (=> b!931680 (= res!627517 (= (getValueByKey!481 (toList!5981 lt!419403) (_1!6633 lt!419272)) (Some!486 (_2!6633 lt!419272))))))

(declare-fun b!931681 () Bool)

(declare-fun contains!4980 (List!18998 tuple2!13244) Bool)

(assert (=> b!931681 (= e!523200 (contains!4980 (toList!5981 lt!419403) lt!419272))))

(assert (= (and d!112837 res!627518) b!931680))

(assert (= (and b!931680 res!627517) b!931681))

(declare-fun m!865055 () Bool)

(assert (=> d!112837 m!865055))

(declare-fun m!865057 () Bool)

(assert (=> d!112837 m!865057))

(declare-fun m!865059 () Bool)

(assert (=> d!112837 m!865059))

(declare-fun m!865061 () Bool)

(assert (=> d!112837 m!865061))

(declare-fun m!865063 () Bool)

(assert (=> b!931680 m!865063))

(declare-fun m!865065 () Bool)

(assert (=> b!931681 m!865065))

(assert (=> b!931507 d!112837))

(declare-fun d!112839 () Bool)

(declare-fun c!96991 () Bool)

(assert (=> d!112839 (= c!96991 ((_ is ValueCellFull!9539) (select (arr!26941 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun e!523203 () V!31687)

(assert (=> d!112839 (= (get!14165 (select (arr!26941 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1548 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!523203)))

(declare-fun b!931686 () Bool)

(declare-fun get!14167 (ValueCell!9539 V!31687) V!31687)

(assert (=> b!931686 (= e!523203 (get!14167 (select (arr!26941 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1548 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!931687 () Bool)

(declare-fun get!14168 (ValueCell!9539 V!31687) V!31687)

(assert (=> b!931687 (= e!523203 (get!14168 (select (arr!26941 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1548 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112839 c!96991) b!931686))

(assert (= (and d!112839 (not c!96991)) b!931687))

(assert (=> b!931686 m!864853))

(assert (=> b!931686 m!864855))

(declare-fun m!865067 () Bool)

(assert (=> b!931686 m!865067))

(assert (=> b!931687 m!864853))

(assert (=> b!931687 m!864855))

(declare-fun m!865069 () Bool)

(assert (=> b!931687 m!865069))

(assert (=> b!931507 d!112839))

(declare-fun d!112841 () Bool)

(declare-fun e!523204 () Bool)

(assert (=> d!112841 e!523204))

(declare-fun res!627520 () Bool)

(assert (=> d!112841 (=> (not res!627520) (not e!523204))))

(declare-fun lt!419407 () ListLongMap!11931)

(assert (=> d!112841 (= res!627520 (contains!4978 lt!419407 (_1!6633 lt!419272)))))

(declare-fun lt!419406 () List!18998)

(assert (=> d!112841 (= lt!419407 (ListLongMap!11932 lt!419406))))

(declare-fun lt!419408 () Unit!31349)

(declare-fun lt!419409 () Unit!31349)

(assert (=> d!112841 (= lt!419408 lt!419409)))

(assert (=> d!112841 (= (getValueByKey!481 lt!419406 (_1!6633 lt!419272)) (Some!486 (_2!6633 lt!419272)))))

(assert (=> d!112841 (= lt!419409 (lemmaContainsTupThenGetReturnValue!255 lt!419406 (_1!6633 lt!419272) (_2!6633 lt!419272)))))

(assert (=> d!112841 (= lt!419406 (insertStrictlySorted!312 (toList!5981 lt!419273) (_1!6633 lt!419272) (_2!6633 lt!419272)))))

(assert (=> d!112841 (= (+!2792 lt!419273 lt!419272) lt!419407)))

(declare-fun b!931688 () Bool)

(declare-fun res!627519 () Bool)

(assert (=> b!931688 (=> (not res!627519) (not e!523204))))

(assert (=> b!931688 (= res!627519 (= (getValueByKey!481 (toList!5981 lt!419407) (_1!6633 lt!419272)) (Some!486 (_2!6633 lt!419272))))))

(declare-fun b!931689 () Bool)

(assert (=> b!931689 (= e!523204 (contains!4980 (toList!5981 lt!419407) lt!419272))))

(assert (= (and d!112841 res!627520) b!931688))

(assert (= (and b!931688 res!627519) b!931689))

(declare-fun m!865071 () Bool)

(assert (=> d!112841 m!865071))

(declare-fun m!865073 () Bool)

(assert (=> d!112841 m!865073))

(declare-fun m!865075 () Bool)

(assert (=> d!112841 m!865075))

(declare-fun m!865077 () Bool)

(assert (=> d!112841 m!865077))

(declare-fun m!865079 () Bool)

(assert (=> b!931688 m!865079))

(declare-fun m!865081 () Bool)

(assert (=> b!931689 m!865081))

(assert (=> b!931507 d!112841))

(declare-fun b!931690 () Bool)

(declare-fun e!523214 () Bool)

(declare-fun lt!419429 () ListLongMap!11931)

(assert (=> b!931690 (= e!523214 (= (apply!773 lt!419429 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40542 () Bool)

(declare-fun call!40548 () ListLongMap!11931)

(declare-fun call!40547 () ListLongMap!11931)

(assert (=> bm!40542 (= call!40548 call!40547)))

(declare-fun bm!40543 () Bool)

(assert (=> bm!40543 (= call!40547 (getCurrentListMapNoExtraKeys!3334 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!931691 () Bool)

(declare-fun e!523212 () ListLongMap!11931)

(declare-fun call!40551 () ListLongMap!11931)

(assert (=> b!931691 (= e!523212 call!40551)))

(declare-fun b!931692 () Bool)

(declare-fun e!523217 () Unit!31349)

(declare-fun lt!419422 () Unit!31349)

(assert (=> b!931692 (= e!523217 lt!419422)))

(declare-fun lt!419425 () ListLongMap!11931)

(assert (=> b!931692 (= lt!419425 (getCurrentListMapNoExtraKeys!3334 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!419430 () (_ BitVec 64))

(assert (=> b!931692 (= lt!419430 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419423 () (_ BitVec 64))

(assert (=> b!931692 (= lt!419423 (select (arr!26940 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!419415 () Unit!31349)

(assert (=> b!931692 (= lt!419415 (addStillContains!481 lt!419425 lt!419430 zeroValue!1173 lt!419423))))

(assert (=> b!931692 (contains!4978 (+!2792 lt!419425 (tuple2!13245 lt!419430 zeroValue!1173)) lt!419423)))

(declare-fun lt!419421 () Unit!31349)

(assert (=> b!931692 (= lt!419421 lt!419415)))

(declare-fun lt!419428 () ListLongMap!11931)

(assert (=> b!931692 (= lt!419428 (getCurrentListMapNoExtraKeys!3334 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!419418 () (_ BitVec 64))

(assert (=> b!931692 (= lt!419418 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419414 () (_ BitVec 64))

(assert (=> b!931692 (= lt!419414 (select (arr!26940 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!419420 () Unit!31349)

(assert (=> b!931692 (= lt!419420 (addApplyDifferent!412 lt!419428 lt!419418 minValue!1173 lt!419414))))

(assert (=> b!931692 (= (apply!773 (+!2792 lt!419428 (tuple2!13245 lt!419418 minValue!1173)) lt!419414) (apply!773 lt!419428 lt!419414))))

(declare-fun lt!419412 () Unit!31349)

(assert (=> b!931692 (= lt!419412 lt!419420)))

(declare-fun lt!419431 () ListLongMap!11931)

(assert (=> b!931692 (= lt!419431 (getCurrentListMapNoExtraKeys!3334 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!419424 () (_ BitVec 64))

(assert (=> b!931692 (= lt!419424 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419416 () (_ BitVec 64))

(assert (=> b!931692 (= lt!419416 (select (arr!26940 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!419417 () Unit!31349)

(assert (=> b!931692 (= lt!419417 (addApplyDifferent!412 lt!419431 lt!419424 zeroValue!1173 lt!419416))))

(assert (=> b!931692 (= (apply!773 (+!2792 lt!419431 (tuple2!13245 lt!419424 zeroValue!1173)) lt!419416) (apply!773 lt!419431 lt!419416))))

(declare-fun lt!419413 () Unit!31349)

(assert (=> b!931692 (= lt!419413 lt!419417)))

(declare-fun lt!419427 () ListLongMap!11931)

(assert (=> b!931692 (= lt!419427 (getCurrentListMapNoExtraKeys!3334 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!419410 () (_ BitVec 64))

(assert (=> b!931692 (= lt!419410 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419419 () (_ BitVec 64))

(assert (=> b!931692 (= lt!419419 (select (arr!26940 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!931692 (= lt!419422 (addApplyDifferent!412 lt!419427 lt!419410 minValue!1173 lt!419419))))

(assert (=> b!931692 (= (apply!773 (+!2792 lt!419427 (tuple2!13245 lt!419410 minValue!1173)) lt!419419) (apply!773 lt!419427 lt!419419))))

(declare-fun b!931693 () Bool)

(declare-fun e!523211 () ListLongMap!11931)

(assert (=> b!931693 (= e!523211 e!523212)))

(declare-fun c!96993 () Bool)

(assert (=> b!931693 (= c!96993 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!931694 () Bool)

(declare-fun e!523210 () Bool)

(assert (=> b!931694 (= e!523210 (validKeyInArray!0 (select (arr!26940 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun d!112843 () Bool)

(declare-fun e!523209 () Bool)

(assert (=> d!112843 e!523209))

(declare-fun res!627525 () Bool)

(assert (=> d!112843 (=> (not res!627525) (not e!523209))))

(assert (=> d!112843 (= res!627525 (or (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27401 _keys!1487)) (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27401 _keys!1487)))))))

(declare-fun lt!419426 () ListLongMap!11931)

(assert (=> d!112843 (= lt!419429 lt!419426)))

(declare-fun lt!419411 () Unit!31349)

(assert (=> d!112843 (= lt!419411 e!523217)))

(declare-fun c!96992 () Bool)

(assert (=> d!112843 (= c!96992 e!523210)))

(declare-fun res!627523 () Bool)

(assert (=> d!112843 (=> (not res!627523) (not e!523210))))

(assert (=> d!112843 (= res!627523 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27401 _keys!1487)))))

(assert (=> d!112843 (= lt!419426 e!523211)))

(declare-fun c!96995 () Bool)

(assert (=> d!112843 (= c!96995 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112843 (validMask!0 mask!1881)))

(assert (=> d!112843 (= (getCurrentListMap!3155 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!419429)))

(declare-fun b!931695 () Bool)

(declare-fun res!627524 () Bool)

(assert (=> b!931695 (=> (not res!627524) (not e!523209))))

(declare-fun e!523206 () Bool)

(assert (=> b!931695 (= res!627524 e!523206)))

(declare-fun c!96994 () Bool)

(assert (=> b!931695 (= c!96994 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40544 () Bool)

(declare-fun call!40545 () Bool)

(assert (=> bm!40544 (= call!40545 (contains!4978 lt!419429 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!931696 () Bool)

(assert (=> b!931696 (= e!523206 (not call!40545))))

(declare-fun e!523207 () Bool)

(declare-fun b!931697 () Bool)

(assert (=> b!931697 (= e!523207 (= (apply!773 lt!419429 (select (arr!26940 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14165 (select (arr!26941 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1548 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!931697 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27402 _values!1231)))))

(assert (=> b!931697 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27401 _keys!1487)))))

(declare-fun b!931698 () Bool)

(declare-fun e!523205 () Bool)

(declare-fun call!40549 () Bool)

(assert (=> b!931698 (= e!523205 (not call!40549))))

(declare-fun b!931699 () Bool)

(declare-fun e!523208 () Bool)

(assert (=> b!931699 (= e!523206 e!523208)))

(declare-fun res!627528 () Bool)

(assert (=> b!931699 (= res!627528 call!40545)))

(assert (=> b!931699 (=> (not res!627528) (not e!523208))))

(declare-fun bm!40545 () Bool)

(declare-fun call!40546 () ListLongMap!11931)

(assert (=> bm!40545 (= call!40546 call!40548)))

(declare-fun b!931700 () Bool)

(declare-fun e!523213 () Bool)

(assert (=> b!931700 (= e!523213 (validKeyInArray!0 (select (arr!26940 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!931701 () Bool)

(assert (=> b!931701 (= e!523208 (= (apply!773 lt!419429 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun bm!40546 () Bool)

(declare-fun call!40550 () ListLongMap!11931)

(assert (=> bm!40546 (= call!40551 call!40550)))

(declare-fun b!931702 () Bool)

(declare-fun Unit!31355 () Unit!31349)

(assert (=> b!931702 (= e!523217 Unit!31355)))

(declare-fun b!931703 () Bool)

(declare-fun c!96996 () Bool)

(assert (=> b!931703 (= c!96996 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!523215 () ListLongMap!11931)

(assert (=> b!931703 (= e!523212 e!523215)))

(declare-fun b!931704 () Bool)

(assert (=> b!931704 (= e!523215 call!40551)))

(declare-fun b!931705 () Bool)

(assert (=> b!931705 (= e!523211 (+!2792 call!40550 (tuple2!13245 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun bm!40547 () Bool)

(assert (=> bm!40547 (= call!40549 (contains!4978 lt!419429 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!931706 () Bool)

(assert (=> b!931706 (= e!523215 call!40546)))

(declare-fun b!931707 () Bool)

(declare-fun e!523216 () Bool)

(assert (=> b!931707 (= e!523216 e!523207)))

(declare-fun res!627526 () Bool)

(assert (=> b!931707 (=> (not res!627526) (not e!523207))))

(assert (=> b!931707 (= res!627526 (contains!4978 lt!419429 (select (arr!26940 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!931707 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27401 _keys!1487)))))

(declare-fun bm!40548 () Bool)

(assert (=> bm!40548 (= call!40550 (+!2792 (ite c!96995 call!40547 (ite c!96993 call!40548 call!40546)) (ite (or c!96995 c!96993) (tuple2!13245 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13245 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!931708 () Bool)

(assert (=> b!931708 (= e!523205 e!523214)))

(declare-fun res!627522 () Bool)

(assert (=> b!931708 (= res!627522 call!40549)))

(assert (=> b!931708 (=> (not res!627522) (not e!523214))))

(declare-fun b!931709 () Bool)

(declare-fun res!627529 () Bool)

(assert (=> b!931709 (=> (not res!627529) (not e!523209))))

(assert (=> b!931709 (= res!627529 e!523216)))

(declare-fun res!627527 () Bool)

(assert (=> b!931709 (=> res!627527 e!523216)))

(assert (=> b!931709 (= res!627527 (not e!523213))))

(declare-fun res!627521 () Bool)

(assert (=> b!931709 (=> (not res!627521) (not e!523213))))

(assert (=> b!931709 (= res!627521 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27401 _keys!1487)))))

(declare-fun b!931710 () Bool)

(assert (=> b!931710 (= e!523209 e!523205)))

(declare-fun c!96997 () Bool)

(assert (=> b!931710 (= c!96997 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!112843 c!96995) b!931705))

(assert (= (and d!112843 (not c!96995)) b!931693))

(assert (= (and b!931693 c!96993) b!931691))

(assert (= (and b!931693 (not c!96993)) b!931703))

(assert (= (and b!931703 c!96996) b!931704))

(assert (= (and b!931703 (not c!96996)) b!931706))

(assert (= (or b!931704 b!931706) bm!40545))

(assert (= (or b!931691 bm!40545) bm!40542))

(assert (= (or b!931691 b!931704) bm!40546))

(assert (= (or b!931705 bm!40542) bm!40543))

(assert (= (or b!931705 bm!40546) bm!40548))

(assert (= (and d!112843 res!627523) b!931694))

(assert (= (and d!112843 c!96992) b!931692))

(assert (= (and d!112843 (not c!96992)) b!931702))

(assert (= (and d!112843 res!627525) b!931709))

(assert (= (and b!931709 res!627521) b!931700))

(assert (= (and b!931709 (not res!627527)) b!931707))

(assert (= (and b!931707 res!627526) b!931697))

(assert (= (and b!931709 res!627529) b!931695))

(assert (= (and b!931695 c!96994) b!931699))

(assert (= (and b!931695 (not c!96994)) b!931696))

(assert (= (and b!931699 res!627528) b!931701))

(assert (= (or b!931699 b!931696) bm!40544))

(assert (= (and b!931695 res!627524) b!931710))

(assert (= (and b!931710 c!96997) b!931708))

(assert (= (and b!931710 (not c!96997)) b!931698))

(assert (= (and b!931708 res!627522) b!931690))

(assert (= (or b!931708 b!931698) bm!40547))

(declare-fun b_lambda!13843 () Bool)

(assert (=> (not b_lambda!13843) (not b!931697)))

(assert (=> b!931697 t!27065))

(declare-fun b_and!28607 () Bool)

(assert (= b_and!28605 (and (=> t!27065 result!11669) b_and!28607)))

(declare-fun m!865083 () Bool)

(assert (=> bm!40543 m!865083))

(assert (=> d!112843 m!864883))

(declare-fun m!865085 () Bool)

(assert (=> b!931701 m!865085))

(declare-fun m!865087 () Bool)

(assert (=> bm!40548 m!865087))

(assert (=> b!931700 m!864881))

(assert (=> b!931700 m!864881))

(declare-fun m!865089 () Bool)

(assert (=> b!931700 m!865089))

(declare-fun m!865091 () Bool)

(assert (=> b!931705 m!865091))

(declare-fun m!865093 () Bool)

(assert (=> bm!40547 m!865093))

(declare-fun m!865095 () Bool)

(assert (=> b!931690 m!865095))

(assert (=> b!931697 m!864881))

(declare-fun m!865097 () Bool)

(assert (=> b!931697 m!865097))

(assert (=> b!931697 m!864855))

(assert (=> b!931697 m!864853))

(assert (=> b!931697 m!864855))

(assert (=> b!931697 m!864859))

(assert (=> b!931697 m!864853))

(assert (=> b!931697 m!864881))

(assert (=> b!931694 m!864881))

(assert (=> b!931694 m!864881))

(assert (=> b!931694 m!865089))

(assert (=> b!931707 m!864881))

(assert (=> b!931707 m!864881))

(declare-fun m!865099 () Bool)

(assert (=> b!931707 m!865099))

(declare-fun m!865101 () Bool)

(assert (=> b!931692 m!865101))

(declare-fun m!865103 () Bool)

(assert (=> b!931692 m!865103))

(declare-fun m!865105 () Bool)

(assert (=> b!931692 m!865105))

(declare-fun m!865107 () Bool)

(assert (=> b!931692 m!865107))

(declare-fun m!865109 () Bool)

(assert (=> b!931692 m!865109))

(declare-fun m!865111 () Bool)

(assert (=> b!931692 m!865111))

(declare-fun m!865113 () Bool)

(assert (=> b!931692 m!865113))

(declare-fun m!865115 () Bool)

(assert (=> b!931692 m!865115))

(declare-fun m!865117 () Bool)

(assert (=> b!931692 m!865117))

(declare-fun m!865119 () Bool)

(assert (=> b!931692 m!865119))

(declare-fun m!865121 () Bool)

(assert (=> b!931692 m!865121))

(assert (=> b!931692 m!865083))

(assert (=> b!931692 m!865111))

(declare-fun m!865123 () Bool)

(assert (=> b!931692 m!865123))

(assert (=> b!931692 m!865101))

(declare-fun m!865125 () Bool)

(assert (=> b!931692 m!865125))

(assert (=> b!931692 m!865119))

(declare-fun m!865127 () Bool)

(assert (=> b!931692 m!865127))

(assert (=> b!931692 m!865103))

(declare-fun m!865129 () Bool)

(assert (=> b!931692 m!865129))

(assert (=> b!931692 m!864881))

(declare-fun m!865131 () Bool)

(assert (=> bm!40544 m!865131))

(assert (=> b!931507 d!112843))

(declare-fun d!112845 () Bool)

(assert (=> d!112845 (= (validKeyInArray!0 k0!1099) (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!931511 d!112845))

(declare-fun d!112847 () Bool)

(assert (=> d!112847 (= (validKeyInArray!0 lt!419269) (and (not (= lt!419269 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!419269 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!931503 d!112847))

(declare-fun bm!40551 () Bool)

(declare-fun call!40554 () Bool)

(declare-fun c!97000 () Bool)

(assert (=> bm!40551 (= call!40554 (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!97000 (Cons!18995 (select (arr!26940 _keys!1487) #b00000000000000000000000000000000) Nil!18996) Nil!18996)))))

(declare-fun b!931721 () Bool)

(declare-fun e!523228 () Bool)

(declare-fun contains!4981 (List!18999 (_ BitVec 64)) Bool)

(assert (=> b!931721 (= e!523228 (contains!4981 Nil!18996 (select (arr!26940 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!931722 () Bool)

(declare-fun e!523229 () Bool)

(declare-fun e!523226 () Bool)

(assert (=> b!931722 (= e!523229 e!523226)))

(declare-fun res!627537 () Bool)

(assert (=> b!931722 (=> (not res!627537) (not e!523226))))

(assert (=> b!931722 (= res!627537 (not e!523228))))

(declare-fun res!627536 () Bool)

(assert (=> b!931722 (=> (not res!627536) (not e!523228))))

(assert (=> b!931722 (= res!627536 (validKeyInArray!0 (select (arr!26940 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun d!112849 () Bool)

(declare-fun res!627538 () Bool)

(assert (=> d!112849 (=> res!627538 e!523229)))

(assert (=> d!112849 (= res!627538 (bvsge #b00000000000000000000000000000000 (size!27401 _keys!1487)))))

(assert (=> d!112849 (= (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18996) e!523229)))

(declare-fun b!931723 () Bool)

(declare-fun e!523227 () Bool)

(assert (=> b!931723 (= e!523227 call!40554)))

(declare-fun b!931724 () Bool)

(assert (=> b!931724 (= e!523226 e!523227)))

(assert (=> b!931724 (= c!97000 (validKeyInArray!0 (select (arr!26940 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!931725 () Bool)

(assert (=> b!931725 (= e!523227 call!40554)))

(assert (= (and d!112849 (not res!627538)) b!931722))

(assert (= (and b!931722 res!627536) b!931721))

(assert (= (and b!931722 res!627537) b!931724))

(assert (= (and b!931724 c!97000) b!931723))

(assert (= (and b!931724 (not c!97000)) b!931725))

(assert (= (or b!931723 b!931725) bm!40551))

(declare-fun m!865133 () Bool)

(assert (=> bm!40551 m!865133))

(declare-fun m!865135 () Bool)

(assert (=> bm!40551 m!865135))

(assert (=> b!931721 m!865133))

(assert (=> b!931721 m!865133))

(declare-fun m!865137 () Bool)

(assert (=> b!931721 m!865137))

(assert (=> b!931722 m!865133))

(assert (=> b!931722 m!865133))

(declare-fun m!865139 () Bool)

(assert (=> b!931722 m!865139))

(assert (=> b!931724 m!865133))

(assert (=> b!931724 m!865133))

(assert (=> b!931724 m!865139))

(assert (=> b!931508 d!112849))

(declare-fun d!112851 () Bool)

(declare-fun get!14169 (Option!487) V!31687)

(assert (=> d!112851 (= (apply!773 lt!419273 k0!1099) (get!14169 (getValueByKey!481 (toList!5981 lt!419273) k0!1099)))))

(declare-fun bs!26148 () Bool)

(assert (= bs!26148 d!112851))

(declare-fun m!865141 () Bool)

(assert (=> bs!26148 m!865141))

(assert (=> bs!26148 m!865141))

(declare-fun m!865143 () Bool)

(assert (=> bs!26148 m!865143))

(assert (=> b!931513 d!112851))

(declare-fun d!112853 () Bool)

(declare-fun res!627544 () Bool)

(declare-fun e!523238 () Bool)

(assert (=> d!112853 (=> res!627544 e!523238)))

(assert (=> d!112853 (= res!627544 (bvsge #b00000000000000000000000000000000 (size!27401 _keys!1487)))))

(assert (=> d!112853 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!523238)))

(declare-fun b!931734 () Bool)

(declare-fun e!523237 () Bool)

(declare-fun call!40557 () Bool)

(assert (=> b!931734 (= e!523237 call!40557)))

(declare-fun b!931735 () Bool)

(declare-fun e!523236 () Bool)

(assert (=> b!931735 (= e!523236 e!523237)))

(declare-fun lt!419438 () (_ BitVec 64))

(assert (=> b!931735 (= lt!419438 (select (arr!26940 _keys!1487) #b00000000000000000000000000000000))))

(declare-fun lt!419439 () Unit!31349)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!55989 (_ BitVec 64) (_ BitVec 32)) Unit!31349)

(assert (=> b!931735 (= lt!419439 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!419438 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!55989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!931735 (arrayContainsKey!0 _keys!1487 lt!419438 #b00000000000000000000000000000000)))

(declare-fun lt!419440 () Unit!31349)

(assert (=> b!931735 (= lt!419440 lt!419439)))

(declare-fun res!627543 () Bool)

(declare-datatypes ((SeekEntryResult!8976 0))(
  ( (MissingZero!8976 (index!38275 (_ BitVec 32))) (Found!8976 (index!38276 (_ BitVec 32))) (Intermediate!8976 (undefined!9788 Bool) (index!38277 (_ BitVec 32)) (x!79868 (_ BitVec 32))) (Undefined!8976) (MissingVacant!8976 (index!38278 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!55989 (_ BitVec 32)) SeekEntryResult!8976)

(assert (=> b!931735 (= res!627543 (= (seekEntryOrOpen!0 (select (arr!26940 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8976 #b00000000000000000000000000000000)))))

(assert (=> b!931735 (=> (not res!627543) (not e!523237))))

(declare-fun b!931736 () Bool)

(assert (=> b!931736 (= e!523238 e!523236)))

(declare-fun c!97003 () Bool)

(assert (=> b!931736 (= c!97003 (validKeyInArray!0 (select (arr!26940 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun bm!40554 () Bool)

(assert (=> bm!40554 (= call!40557 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(declare-fun b!931737 () Bool)

(assert (=> b!931737 (= e!523236 call!40557)))

(assert (= (and d!112853 (not res!627544)) b!931736))

(assert (= (and b!931736 c!97003) b!931735))

(assert (= (and b!931736 (not c!97003)) b!931737))

(assert (= (and b!931735 res!627543) b!931734))

(assert (= (or b!931734 b!931737) bm!40554))

(assert (=> b!931735 m!865133))

(declare-fun m!865145 () Bool)

(assert (=> b!931735 m!865145))

(declare-fun m!865147 () Bool)

(assert (=> b!931735 m!865147))

(assert (=> b!931735 m!865133))

(declare-fun m!865149 () Bool)

(assert (=> b!931735 m!865149))

(assert (=> b!931736 m!865133))

(assert (=> b!931736 m!865133))

(assert (=> b!931736 m!865139))

(declare-fun m!865151 () Bool)

(assert (=> bm!40554 m!865151))

(assert (=> b!931514 d!112853))

(declare-fun d!112855 () Bool)

(assert (=> d!112855 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!79302 d!112855))

(declare-fun d!112857 () Bool)

(assert (=> d!112857 (= (array_inv!21036 _values!1231) (bvsge (size!27402 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!79302 d!112857))

(declare-fun d!112859 () Bool)

(assert (=> d!112859 (= (array_inv!21037 _keys!1487) (bvsge (size!27401 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!79302 d!112859))

(declare-fun d!112861 () Bool)

(declare-fun e!523239 () Bool)

(assert (=> d!112861 e!523239))

(declare-fun res!627545 () Bool)

(assert (=> d!112861 (=> res!627545 e!523239)))

(declare-fun lt!419443 () Bool)

(assert (=> d!112861 (= res!627545 (not lt!419443))))

(declare-fun lt!419444 () Bool)

(assert (=> d!112861 (= lt!419443 lt!419444)))

(declare-fun lt!419442 () Unit!31349)

(declare-fun e!523240 () Unit!31349)

(assert (=> d!112861 (= lt!419442 e!523240)))

(declare-fun c!97004 () Bool)

(assert (=> d!112861 (= c!97004 lt!419444)))

(assert (=> d!112861 (= lt!419444 (containsKey!445 (toList!5981 lt!419273) k0!1099))))

(assert (=> d!112861 (= (contains!4978 lt!419273 k0!1099) lt!419443)))

(declare-fun b!931738 () Bool)

(declare-fun lt!419441 () Unit!31349)

(assert (=> b!931738 (= e!523240 lt!419441)))

(assert (=> b!931738 (= lt!419441 (lemmaContainsKeyImpliesGetValueByKeyDefined!340 (toList!5981 lt!419273) k0!1099))))

(assert (=> b!931738 (isDefined!353 (getValueByKey!481 (toList!5981 lt!419273) k0!1099))))

(declare-fun b!931739 () Bool)

(declare-fun Unit!31356 () Unit!31349)

(assert (=> b!931739 (= e!523240 Unit!31356)))

(declare-fun b!931740 () Bool)

(assert (=> b!931740 (= e!523239 (isDefined!353 (getValueByKey!481 (toList!5981 lt!419273) k0!1099)))))

(assert (= (and d!112861 c!97004) b!931738))

(assert (= (and d!112861 (not c!97004)) b!931739))

(assert (= (and d!112861 (not res!627545)) b!931740))

(declare-fun m!865153 () Bool)

(assert (=> d!112861 m!865153))

(declare-fun m!865155 () Bool)

(assert (=> b!931738 m!865155))

(assert (=> b!931738 m!865141))

(assert (=> b!931738 m!865141))

(declare-fun m!865157 () Bool)

(assert (=> b!931738 m!865157))

(assert (=> b!931740 m!865141))

(assert (=> b!931740 m!865141))

(assert (=> b!931740 m!865157))

(assert (=> b!931505 d!112861))

(declare-fun b!931741 () Bool)

(declare-fun e!523250 () Bool)

(declare-fun lt!419464 () ListLongMap!11931)

(assert (=> b!931741 (= e!523250 (= (apply!773 lt!419464 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40555 () Bool)

(declare-fun call!40561 () ListLongMap!11931)

(declare-fun call!40560 () ListLongMap!11931)

(assert (=> bm!40555 (= call!40561 call!40560)))

(declare-fun bm!40556 () Bool)

(assert (=> bm!40556 (= call!40560 (getCurrentListMapNoExtraKeys!3334 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!931742 () Bool)

(declare-fun e!523248 () ListLongMap!11931)

(declare-fun call!40564 () ListLongMap!11931)

(assert (=> b!931742 (= e!523248 call!40564)))

(declare-fun b!931743 () Bool)

(declare-fun e!523253 () Unit!31349)

(declare-fun lt!419457 () Unit!31349)

(assert (=> b!931743 (= e!523253 lt!419457)))

(declare-fun lt!419460 () ListLongMap!11931)

(assert (=> b!931743 (= lt!419460 (getCurrentListMapNoExtraKeys!3334 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!419465 () (_ BitVec 64))

(assert (=> b!931743 (= lt!419465 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419458 () (_ BitVec 64))

(assert (=> b!931743 (= lt!419458 (select (arr!26940 _keys!1487) from!1844))))

(declare-fun lt!419450 () Unit!31349)

(assert (=> b!931743 (= lt!419450 (addStillContains!481 lt!419460 lt!419465 zeroValue!1173 lt!419458))))

(assert (=> b!931743 (contains!4978 (+!2792 lt!419460 (tuple2!13245 lt!419465 zeroValue!1173)) lt!419458)))

(declare-fun lt!419456 () Unit!31349)

(assert (=> b!931743 (= lt!419456 lt!419450)))

(declare-fun lt!419463 () ListLongMap!11931)

(assert (=> b!931743 (= lt!419463 (getCurrentListMapNoExtraKeys!3334 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!419453 () (_ BitVec 64))

(assert (=> b!931743 (= lt!419453 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419449 () (_ BitVec 64))

(assert (=> b!931743 (= lt!419449 (select (arr!26940 _keys!1487) from!1844))))

(declare-fun lt!419455 () Unit!31349)

(assert (=> b!931743 (= lt!419455 (addApplyDifferent!412 lt!419463 lt!419453 minValue!1173 lt!419449))))

(assert (=> b!931743 (= (apply!773 (+!2792 lt!419463 (tuple2!13245 lt!419453 minValue!1173)) lt!419449) (apply!773 lt!419463 lt!419449))))

(declare-fun lt!419447 () Unit!31349)

(assert (=> b!931743 (= lt!419447 lt!419455)))

(declare-fun lt!419466 () ListLongMap!11931)

(assert (=> b!931743 (= lt!419466 (getCurrentListMapNoExtraKeys!3334 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!419459 () (_ BitVec 64))

(assert (=> b!931743 (= lt!419459 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419451 () (_ BitVec 64))

(assert (=> b!931743 (= lt!419451 (select (arr!26940 _keys!1487) from!1844))))

(declare-fun lt!419452 () Unit!31349)

(assert (=> b!931743 (= lt!419452 (addApplyDifferent!412 lt!419466 lt!419459 zeroValue!1173 lt!419451))))

(assert (=> b!931743 (= (apply!773 (+!2792 lt!419466 (tuple2!13245 lt!419459 zeroValue!1173)) lt!419451) (apply!773 lt!419466 lt!419451))))

(declare-fun lt!419448 () Unit!31349)

(assert (=> b!931743 (= lt!419448 lt!419452)))

(declare-fun lt!419462 () ListLongMap!11931)

(assert (=> b!931743 (= lt!419462 (getCurrentListMapNoExtraKeys!3334 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!419445 () (_ BitVec 64))

(assert (=> b!931743 (= lt!419445 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!419454 () (_ BitVec 64))

(assert (=> b!931743 (= lt!419454 (select (arr!26940 _keys!1487) from!1844))))

(assert (=> b!931743 (= lt!419457 (addApplyDifferent!412 lt!419462 lt!419445 minValue!1173 lt!419454))))

(assert (=> b!931743 (= (apply!773 (+!2792 lt!419462 (tuple2!13245 lt!419445 minValue!1173)) lt!419454) (apply!773 lt!419462 lt!419454))))

(declare-fun b!931744 () Bool)

(declare-fun e!523247 () ListLongMap!11931)

(assert (=> b!931744 (= e!523247 e!523248)))

(declare-fun c!97006 () Bool)

(assert (=> b!931744 (= c!97006 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!931745 () Bool)

(declare-fun e!523246 () Bool)

(assert (=> b!931745 (= e!523246 (validKeyInArray!0 (select (arr!26940 _keys!1487) from!1844)))))

(declare-fun d!112863 () Bool)

(declare-fun e!523245 () Bool)

(assert (=> d!112863 e!523245))

(declare-fun res!627550 () Bool)

(assert (=> d!112863 (=> (not res!627550) (not e!523245))))

(assert (=> d!112863 (= res!627550 (or (bvsge from!1844 (size!27401 _keys!1487)) (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27401 _keys!1487)))))))

(declare-fun lt!419461 () ListLongMap!11931)

(assert (=> d!112863 (= lt!419464 lt!419461)))

(declare-fun lt!419446 () Unit!31349)

(assert (=> d!112863 (= lt!419446 e!523253)))

(declare-fun c!97005 () Bool)

(assert (=> d!112863 (= c!97005 e!523246)))

(declare-fun res!627548 () Bool)

(assert (=> d!112863 (=> (not res!627548) (not e!523246))))

(assert (=> d!112863 (= res!627548 (bvslt from!1844 (size!27401 _keys!1487)))))

(assert (=> d!112863 (= lt!419461 e!523247)))

(declare-fun c!97008 () Bool)

(assert (=> d!112863 (= c!97008 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112863 (validMask!0 mask!1881)))

(assert (=> d!112863 (= (getCurrentListMap!3155 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) lt!419464)))

(declare-fun b!931746 () Bool)

(declare-fun res!627549 () Bool)

(assert (=> b!931746 (=> (not res!627549) (not e!523245))))

(declare-fun e!523242 () Bool)

(assert (=> b!931746 (= res!627549 e!523242)))

(declare-fun c!97007 () Bool)

(assert (=> b!931746 (= c!97007 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40557 () Bool)

(declare-fun call!40558 () Bool)

(assert (=> bm!40557 (= call!40558 (contains!4978 lt!419464 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!931747 () Bool)

(assert (=> b!931747 (= e!523242 (not call!40558))))

(declare-fun e!523243 () Bool)

(declare-fun b!931748 () Bool)

(assert (=> b!931748 (= e!523243 (= (apply!773 lt!419464 (select (arr!26940 _keys!1487) from!1844)) (get!14165 (select (arr!26941 _values!1231) from!1844) (dynLambda!1548 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!931748 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27402 _values!1231)))))

(assert (=> b!931748 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27401 _keys!1487)))))

(declare-fun b!931749 () Bool)

(declare-fun e!523241 () Bool)

(declare-fun call!40562 () Bool)

(assert (=> b!931749 (= e!523241 (not call!40562))))

(declare-fun b!931750 () Bool)

(declare-fun e!523244 () Bool)

(assert (=> b!931750 (= e!523242 e!523244)))

(declare-fun res!627553 () Bool)

(assert (=> b!931750 (= res!627553 call!40558)))

(assert (=> b!931750 (=> (not res!627553) (not e!523244))))

(declare-fun bm!40558 () Bool)

(declare-fun call!40559 () ListLongMap!11931)

(assert (=> bm!40558 (= call!40559 call!40561)))

(declare-fun b!931751 () Bool)

(declare-fun e!523249 () Bool)

(assert (=> b!931751 (= e!523249 (validKeyInArray!0 (select (arr!26940 _keys!1487) from!1844)))))

(declare-fun b!931752 () Bool)

(assert (=> b!931752 (= e!523244 (= (apply!773 lt!419464 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun bm!40559 () Bool)

(declare-fun call!40563 () ListLongMap!11931)

(assert (=> bm!40559 (= call!40564 call!40563)))

(declare-fun b!931753 () Bool)

(declare-fun Unit!31357 () Unit!31349)

(assert (=> b!931753 (= e!523253 Unit!31357)))

(declare-fun b!931754 () Bool)

(declare-fun c!97009 () Bool)

(assert (=> b!931754 (= c!97009 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!523251 () ListLongMap!11931)

(assert (=> b!931754 (= e!523248 e!523251)))

(declare-fun b!931755 () Bool)

(assert (=> b!931755 (= e!523251 call!40564)))

(declare-fun b!931756 () Bool)

(assert (=> b!931756 (= e!523247 (+!2792 call!40563 (tuple2!13245 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun bm!40560 () Bool)

(assert (=> bm!40560 (= call!40562 (contains!4978 lt!419464 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!931757 () Bool)

(assert (=> b!931757 (= e!523251 call!40559)))

(declare-fun b!931758 () Bool)

(declare-fun e!523252 () Bool)

(assert (=> b!931758 (= e!523252 e!523243)))

(declare-fun res!627551 () Bool)

(assert (=> b!931758 (=> (not res!627551) (not e!523243))))

(assert (=> b!931758 (= res!627551 (contains!4978 lt!419464 (select (arr!26940 _keys!1487) from!1844)))))

(assert (=> b!931758 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27401 _keys!1487)))))

(declare-fun bm!40561 () Bool)

(assert (=> bm!40561 (= call!40563 (+!2792 (ite c!97008 call!40560 (ite c!97006 call!40561 call!40559)) (ite (or c!97008 c!97006) (tuple2!13245 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13245 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!931759 () Bool)

(assert (=> b!931759 (= e!523241 e!523250)))

(declare-fun res!627547 () Bool)

(assert (=> b!931759 (= res!627547 call!40562)))

(assert (=> b!931759 (=> (not res!627547) (not e!523250))))

(declare-fun b!931760 () Bool)

(declare-fun res!627554 () Bool)

(assert (=> b!931760 (=> (not res!627554) (not e!523245))))

(assert (=> b!931760 (= res!627554 e!523252)))

(declare-fun res!627552 () Bool)

(assert (=> b!931760 (=> res!627552 e!523252)))

(assert (=> b!931760 (= res!627552 (not e!523249))))

(declare-fun res!627546 () Bool)

(assert (=> b!931760 (=> (not res!627546) (not e!523249))))

(assert (=> b!931760 (= res!627546 (bvslt from!1844 (size!27401 _keys!1487)))))

(declare-fun b!931761 () Bool)

(assert (=> b!931761 (= e!523245 e!523241)))

(declare-fun c!97010 () Bool)

(assert (=> b!931761 (= c!97010 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!112863 c!97008) b!931756))

(assert (= (and d!112863 (not c!97008)) b!931744))

(assert (= (and b!931744 c!97006) b!931742))

(assert (= (and b!931744 (not c!97006)) b!931754))

(assert (= (and b!931754 c!97009) b!931755))

(assert (= (and b!931754 (not c!97009)) b!931757))

(assert (= (or b!931755 b!931757) bm!40558))

(assert (= (or b!931742 bm!40558) bm!40555))

(assert (= (or b!931742 b!931755) bm!40559))

(assert (= (or b!931756 bm!40555) bm!40556))

(assert (= (or b!931756 bm!40559) bm!40561))

(assert (= (and d!112863 res!627548) b!931745))

(assert (= (and d!112863 c!97005) b!931743))

(assert (= (and d!112863 (not c!97005)) b!931753))

(assert (= (and d!112863 res!627550) b!931760))

(assert (= (and b!931760 res!627546) b!931751))

(assert (= (and b!931760 (not res!627552)) b!931758))

(assert (= (and b!931758 res!627551) b!931748))

(assert (= (and b!931760 res!627554) b!931746))

(assert (= (and b!931746 c!97007) b!931750))

(assert (= (and b!931746 (not c!97007)) b!931747))

(assert (= (and b!931750 res!627553) b!931752))

(assert (= (or b!931750 b!931747) bm!40557))

(assert (= (and b!931746 res!627549) b!931761))

(assert (= (and b!931761 c!97010) b!931759))

(assert (= (and b!931761 (not c!97010)) b!931749))

(assert (= (and b!931759 res!627547) b!931741))

(assert (= (or b!931759 b!931749) bm!40560))

(declare-fun b_lambda!13845 () Bool)

(assert (=> (not b_lambda!13845) (not b!931748)))

(assert (=> b!931748 t!27065))

(declare-fun b_and!28609 () Bool)

(assert (= b_and!28607 (and (=> t!27065 result!11669) b_and!28609)))

(declare-fun m!865159 () Bool)

(assert (=> bm!40556 m!865159))

(assert (=> d!112863 m!864883))

(declare-fun m!865161 () Bool)

(assert (=> b!931752 m!865161))

(declare-fun m!865163 () Bool)

(assert (=> bm!40561 m!865163))

(declare-fun m!865165 () Bool)

(assert (=> b!931751 m!865165))

(assert (=> b!931751 m!865165))

(declare-fun m!865167 () Bool)

(assert (=> b!931751 m!865167))

(declare-fun m!865169 () Bool)

(assert (=> b!931756 m!865169))

(declare-fun m!865171 () Bool)

(assert (=> bm!40560 m!865171))

(declare-fun m!865173 () Bool)

(assert (=> b!931741 m!865173))

(assert (=> b!931748 m!865165))

(declare-fun m!865175 () Bool)

(assert (=> b!931748 m!865175))

(assert (=> b!931748 m!864855))

(declare-fun m!865177 () Bool)

(assert (=> b!931748 m!865177))

(assert (=> b!931748 m!864855))

(declare-fun m!865179 () Bool)

(assert (=> b!931748 m!865179))

(assert (=> b!931748 m!865177))

(assert (=> b!931748 m!865165))

(assert (=> b!931745 m!865165))

(assert (=> b!931745 m!865165))

(assert (=> b!931745 m!865167))

(assert (=> b!931758 m!865165))

(assert (=> b!931758 m!865165))

(declare-fun m!865181 () Bool)

(assert (=> b!931758 m!865181))

(declare-fun m!865183 () Bool)

(assert (=> b!931743 m!865183))

(declare-fun m!865185 () Bool)

(assert (=> b!931743 m!865185))

(declare-fun m!865187 () Bool)

(assert (=> b!931743 m!865187))

(declare-fun m!865189 () Bool)

(assert (=> b!931743 m!865189))

(declare-fun m!865191 () Bool)

(assert (=> b!931743 m!865191))

(declare-fun m!865193 () Bool)

(assert (=> b!931743 m!865193))

(declare-fun m!865195 () Bool)

(assert (=> b!931743 m!865195))

(declare-fun m!865197 () Bool)

(assert (=> b!931743 m!865197))

(declare-fun m!865199 () Bool)

(assert (=> b!931743 m!865199))

(declare-fun m!865201 () Bool)

(assert (=> b!931743 m!865201))

(declare-fun m!865203 () Bool)

(assert (=> b!931743 m!865203))

(assert (=> b!931743 m!865159))

(assert (=> b!931743 m!865193))

(declare-fun m!865205 () Bool)

(assert (=> b!931743 m!865205))

(assert (=> b!931743 m!865183))

(declare-fun m!865207 () Bool)

(assert (=> b!931743 m!865207))

(assert (=> b!931743 m!865201))

(declare-fun m!865209 () Bool)

(assert (=> b!931743 m!865209))

(assert (=> b!931743 m!865185))

(declare-fun m!865211 () Bool)

(assert (=> b!931743 m!865211))

(assert (=> b!931743 m!865165))

(declare-fun m!865213 () Bool)

(assert (=> bm!40557 m!865213))

(assert (=> b!931505 d!112863))

(declare-fun b!931769 () Bool)

(declare-fun e!523258 () Bool)

(assert (=> b!931769 (= e!523258 tp_is_empty!20041)))

(declare-fun condMapEmpty!31827 () Bool)

(declare-fun mapDefault!31827 () ValueCell!9539)

(assert (=> mapNonEmpty!31818 (= condMapEmpty!31827 (= mapRest!31818 ((as const (Array (_ BitVec 32) ValueCell!9539)) mapDefault!31827)))))

(declare-fun mapRes!31827 () Bool)

(assert (=> mapNonEmpty!31818 (= tp!61041 (and e!523258 mapRes!31827))))

(declare-fun mapNonEmpty!31827 () Bool)

(declare-fun tp!61056 () Bool)

(declare-fun e!523259 () Bool)

(assert (=> mapNonEmpty!31827 (= mapRes!31827 (and tp!61056 e!523259))))

(declare-fun mapKey!31827 () (_ BitVec 32))

(declare-fun mapValue!31827 () ValueCell!9539)

(declare-fun mapRest!31827 () (Array (_ BitVec 32) ValueCell!9539))

(assert (=> mapNonEmpty!31827 (= mapRest!31818 (store mapRest!31827 mapKey!31827 mapValue!31827))))

(declare-fun mapIsEmpty!31827 () Bool)

(assert (=> mapIsEmpty!31827 mapRes!31827))

(declare-fun b!931768 () Bool)

(assert (=> b!931768 (= e!523259 tp_is_empty!20041)))

(assert (= (and mapNonEmpty!31818 condMapEmpty!31827) mapIsEmpty!31827))

(assert (= (and mapNonEmpty!31818 (not condMapEmpty!31827)) mapNonEmpty!31827))

(assert (= (and mapNonEmpty!31827 ((_ is ValueCellFull!9539) mapValue!31827)) b!931768))

(assert (= (and mapNonEmpty!31818 ((_ is ValueCellFull!9539) mapDefault!31827)) b!931769))

(declare-fun m!865215 () Bool)

(assert (=> mapNonEmpty!31827 m!865215))

(declare-fun b_lambda!13847 () Bool)

(assert (= b_lambda!13845 (or (and start!79302 b_free!17533) b_lambda!13847)))

(declare-fun b_lambda!13849 () Bool)

(assert (= b_lambda!13841 (or (and start!79302 b_free!17533) b_lambda!13849)))

(declare-fun b_lambda!13851 () Bool)

(assert (= b_lambda!13839 (or (and start!79302 b_free!17533) b_lambda!13851)))

(declare-fun b_lambda!13853 () Bool)

(assert (= b_lambda!13843 (or (and start!79302 b_free!17533) b_lambda!13853)))

(check-sat (not bm!40551) (not d!112831) (not b!931657) (not b!931689) (not d!112841) (not d!112829) (not b!931751) (not b!931681) (not b!931741) (not b!931694) (not b!931675) (not b!931721) (not bm!40560) (not bm!40540) (not d!112833) (not b!931722) (not d!112837) (not b!931705) (not b_lambda!13837) (not b!931692) (not d!112835) (not b!931686) (not bm!40541) (not bm!40536) (not b!931665) (not b!931688) (not bm!40547) (not b_next!17533) (not mapNonEmpty!31827) (not b_lambda!13851) (not b!931745) (not bm!40544) (not b!931700) (not b!931646) (not bm!40557) (not b!931738) (not b!931724) (not b!931653) (not d!112861) (not b!931649) (not b_lambda!13849) (not bm!40556) (not b!931748) (not bm!40543) (not b!931644) (not b!931652) (not b!931701) (not b!931659) (not b!931752) (not bm!40554) (not b_lambda!13847) (not d!112851) (not b!931756) (not b!931736) (not b!931697) (not d!112843) (not b_lambda!13853) b_and!28609 (not b!931735) (not bm!40561) (not bm!40548) (not bm!40537) (not b!931707) (not b!931758) (not b!931680) tp_is_empty!20041 (not b!931642) (not b!931673) (not b!931690) (not b!931740) (not d!112863) (not b!931687) (not b!931743))
(check-sat b_and!28609 (not b_next!17533))
