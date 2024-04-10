; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34556 () Bool)

(assert start!34556)

(declare-fun b_free!7461 () Bool)

(declare-fun b_next!7461 () Bool)

(assert (=> start!34556 (= b_free!7461 (not b_next!7461))))

(declare-fun tp!25932 () Bool)

(declare-fun b_and!14671 () Bool)

(assert (=> start!34556 (= tp!25932 b_and!14671)))

(declare-datatypes ((SeekEntryResult!3361 0))(
  ( (MissingZero!3361 (index!15623 (_ BitVec 32))) (Found!3361 (index!15624 (_ BitVec 32))) (Intermediate!3361 (undefined!4173 Bool) (index!15625 (_ BitVec 32)) (x!34413 (_ BitVec 32))) (Undefined!3361) (MissingVacant!3361 (index!15626 (_ BitVec 32))) )
))
(declare-fun lt!162862 () SeekEntryResult!3361)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun b!345403 () Bool)

(declare-datatypes ((array!18411 0))(
  ( (array!18412 (arr!8721 (Array (_ BitVec 32) (_ BitVec 64))) (size!9073 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18411)

(declare-fun e!211697 () Bool)

(declare-fun arrayContainsKey!0 (array!18411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!345403 (= e!211697 (not (arrayContainsKey!0 _keys!1895 k0!1348 (index!15624 lt!162862))))))

(declare-fun b!345404 () Bool)

(declare-fun res!191094 () Bool)

(declare-fun e!211700 () Bool)

(assert (=> b!345404 (=> (not res!191094) (not e!211700))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18411 (_ BitVec 32)) Bool)

(assert (=> b!345404 (= res!191094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!345405 () Bool)

(declare-fun res!191090 () Bool)

(assert (=> b!345405 (=> (not res!191090) (not e!211700))))

(declare-datatypes ((V!10861 0))(
  ( (V!10862 (val!3751 Int)) )
))
(declare-fun zeroValue!1467 () V!10861)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3363 0))(
  ( (ValueCellFull!3363 (v!5928 V!10861)) (EmptyCell!3363) )
))
(declare-datatypes ((array!18413 0))(
  ( (array!18414 (arr!8722 (Array (_ BitVec 32) ValueCell!3363)) (size!9074 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18413)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10861)

(declare-datatypes ((tuple2!5422 0))(
  ( (tuple2!5423 (_1!2722 (_ BitVec 64)) (_2!2722 V!10861)) )
))
(declare-datatypes ((List!5046 0))(
  ( (Nil!5043) (Cons!5042 (h!5898 tuple2!5422) (t!10164 List!5046)) )
))
(declare-datatypes ((ListLongMap!4335 0))(
  ( (ListLongMap!4336 (toList!2183 List!5046)) )
))
(declare-fun contains!2242 (ListLongMap!4335 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1704 (array!18411 array!18413 (_ BitVec 32) (_ BitVec 32) V!10861 V!10861 (_ BitVec 32) Int) ListLongMap!4335)

(assert (=> b!345405 (= res!191090 (not (contains!2242 (getCurrentListMap!1704 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!345406 () Bool)

(declare-fun res!191091 () Bool)

(assert (=> b!345406 (=> (not res!191091) (not e!211700))))

(declare-datatypes ((List!5047 0))(
  ( (Nil!5044) (Cons!5043 (h!5899 (_ BitVec 64)) (t!10165 List!5047)) )
))
(declare-fun arrayNoDuplicates!0 (array!18411 (_ BitVec 32) List!5047) Bool)

(assert (=> b!345406 (= res!191091 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5044))))

(declare-fun b!345407 () Bool)

(assert (=> b!345407 (= e!211700 e!211697)))

(declare-fun res!191096 () Bool)

(assert (=> b!345407 (=> (not res!191096) (not e!211697))))

(get-info :version)

(assert (=> b!345407 (= res!191096 (and ((_ is Found!3361) lt!162862) (= (select (arr!8721 _keys!1895) (index!15624 lt!162862)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18411 (_ BitVec 32)) SeekEntryResult!3361)

(assert (=> b!345407 (= lt!162862 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!191092 () Bool)

(assert (=> start!34556 (=> (not res!191092) (not e!211700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34556 (= res!191092 (validMask!0 mask!2385))))

(assert (=> start!34556 e!211700))

(assert (=> start!34556 true))

(declare-fun tp_is_empty!7413 () Bool)

(assert (=> start!34556 tp_is_empty!7413))

(assert (=> start!34556 tp!25932))

(declare-fun e!211698 () Bool)

(declare-fun array_inv!6454 (array!18413) Bool)

(assert (=> start!34556 (and (array_inv!6454 _values!1525) e!211698)))

(declare-fun array_inv!6455 (array!18411) Bool)

(assert (=> start!34556 (array_inv!6455 _keys!1895)))

(declare-fun b!345408 () Bool)

(declare-fun res!191095 () Bool)

(assert (=> b!345408 (=> (not res!191095) (not e!211700))))

(assert (=> b!345408 (= res!191095 (and (= (size!9074 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9073 _keys!1895) (size!9074 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!345409 () Bool)

(declare-fun e!211701 () Bool)

(assert (=> b!345409 (= e!211701 tp_is_empty!7413)))

(declare-fun mapIsEmpty!12561 () Bool)

(declare-fun mapRes!12561 () Bool)

(assert (=> mapIsEmpty!12561 mapRes!12561))

(declare-fun mapNonEmpty!12561 () Bool)

(declare-fun tp!25931 () Bool)

(assert (=> mapNonEmpty!12561 (= mapRes!12561 (and tp!25931 e!211701))))

(declare-fun mapRest!12561 () (Array (_ BitVec 32) ValueCell!3363))

(declare-fun mapKey!12561 () (_ BitVec 32))

(declare-fun mapValue!12561 () ValueCell!3363)

(assert (=> mapNonEmpty!12561 (= (arr!8722 _values!1525) (store mapRest!12561 mapKey!12561 mapValue!12561))))

(declare-fun b!345410 () Bool)

(declare-fun e!211699 () Bool)

(assert (=> b!345410 (= e!211698 (and e!211699 mapRes!12561))))

(declare-fun condMapEmpty!12561 () Bool)

(declare-fun mapDefault!12561 () ValueCell!3363)

(assert (=> b!345410 (= condMapEmpty!12561 (= (arr!8722 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3363)) mapDefault!12561)))))

(declare-fun b!345411 () Bool)

(assert (=> b!345411 (= e!211699 tp_is_empty!7413)))

(declare-fun b!345412 () Bool)

(declare-fun res!191093 () Bool)

(assert (=> b!345412 (=> (not res!191093) (not e!211700))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!345412 (= res!191093 (validKeyInArray!0 k0!1348))))

(assert (= (and start!34556 res!191092) b!345408))

(assert (= (and b!345408 res!191095) b!345404))

(assert (= (and b!345404 res!191094) b!345406))

(assert (= (and b!345406 res!191091) b!345412))

(assert (= (and b!345412 res!191093) b!345405))

(assert (= (and b!345405 res!191090) b!345407))

(assert (= (and b!345407 res!191096) b!345403))

(assert (= (and b!345410 condMapEmpty!12561) mapIsEmpty!12561))

(assert (= (and b!345410 (not condMapEmpty!12561)) mapNonEmpty!12561))

(assert (= (and mapNonEmpty!12561 ((_ is ValueCellFull!3363) mapValue!12561)) b!345409))

(assert (= (and b!345410 ((_ is ValueCellFull!3363) mapDefault!12561)) b!345411))

(assert (= start!34556 b!345410))

(declare-fun m!346781 () Bool)

(assert (=> b!345403 m!346781))

(declare-fun m!346783 () Bool)

(assert (=> b!345405 m!346783))

(assert (=> b!345405 m!346783))

(declare-fun m!346785 () Bool)

(assert (=> b!345405 m!346785))

(declare-fun m!346787 () Bool)

(assert (=> b!345412 m!346787))

(declare-fun m!346789 () Bool)

(assert (=> b!345406 m!346789))

(declare-fun m!346791 () Bool)

(assert (=> b!345404 m!346791))

(declare-fun m!346793 () Bool)

(assert (=> start!34556 m!346793))

(declare-fun m!346795 () Bool)

(assert (=> start!34556 m!346795))

(declare-fun m!346797 () Bool)

(assert (=> start!34556 m!346797))

(declare-fun m!346799 () Bool)

(assert (=> mapNonEmpty!12561 m!346799))

(declare-fun m!346801 () Bool)

(assert (=> b!345407 m!346801))

(declare-fun m!346803 () Bool)

(assert (=> b!345407 m!346803))

(check-sat b_and!14671 (not b_next!7461) (not b!345403) (not start!34556) (not b!345405) tp_is_empty!7413 (not mapNonEmpty!12561) (not b!345404) (not b!345412) (not b!345407) (not b!345406))
(check-sat b_and!14671 (not b_next!7461))
(get-model)

(declare-fun b!345455 () Bool)

(declare-fun c!53001 () Bool)

(declare-fun lt!162873 () (_ BitVec 64))

(assert (=> b!345455 (= c!53001 (= lt!162873 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!211726 () SeekEntryResult!3361)

(declare-fun e!211727 () SeekEntryResult!3361)

(assert (=> b!345455 (= e!211726 e!211727)))

(declare-fun b!345456 () Bool)

(declare-fun lt!162874 () SeekEntryResult!3361)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18411 (_ BitVec 32)) SeekEntryResult!3361)

(assert (=> b!345456 (= e!211727 (seekKeyOrZeroReturnVacant!0 (x!34413 lt!162874) (index!15625 lt!162874) (index!15625 lt!162874) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!345457 () Bool)

(declare-fun e!211728 () SeekEntryResult!3361)

(assert (=> b!345457 (= e!211728 e!211726)))

(assert (=> b!345457 (= lt!162873 (select (arr!8721 _keys!1895) (index!15625 lt!162874)))))

(declare-fun c!53000 () Bool)

(assert (=> b!345457 (= c!53000 (= lt!162873 k0!1348))))

(declare-fun d!71139 () Bool)

(declare-fun lt!162872 () SeekEntryResult!3361)

(assert (=> d!71139 (and (or ((_ is Undefined!3361) lt!162872) (not ((_ is Found!3361) lt!162872)) (and (bvsge (index!15624 lt!162872) #b00000000000000000000000000000000) (bvslt (index!15624 lt!162872) (size!9073 _keys!1895)))) (or ((_ is Undefined!3361) lt!162872) ((_ is Found!3361) lt!162872) (not ((_ is MissingZero!3361) lt!162872)) (and (bvsge (index!15623 lt!162872) #b00000000000000000000000000000000) (bvslt (index!15623 lt!162872) (size!9073 _keys!1895)))) (or ((_ is Undefined!3361) lt!162872) ((_ is Found!3361) lt!162872) ((_ is MissingZero!3361) lt!162872) (not ((_ is MissingVacant!3361) lt!162872)) (and (bvsge (index!15626 lt!162872) #b00000000000000000000000000000000) (bvslt (index!15626 lt!162872) (size!9073 _keys!1895)))) (or ((_ is Undefined!3361) lt!162872) (ite ((_ is Found!3361) lt!162872) (= (select (arr!8721 _keys!1895) (index!15624 lt!162872)) k0!1348) (ite ((_ is MissingZero!3361) lt!162872) (= (select (arr!8721 _keys!1895) (index!15623 lt!162872)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3361) lt!162872) (= (select (arr!8721 _keys!1895) (index!15626 lt!162872)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71139 (= lt!162872 e!211728)))

(declare-fun c!52999 () Bool)

(assert (=> d!71139 (= c!52999 (and ((_ is Intermediate!3361) lt!162874) (undefined!4173 lt!162874)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18411 (_ BitVec 32)) SeekEntryResult!3361)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71139 (= lt!162874 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71139 (validMask!0 mask!2385)))

(assert (=> d!71139 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!162872)))

(declare-fun b!345458 () Bool)

(assert (=> b!345458 (= e!211728 Undefined!3361)))

(declare-fun b!345459 () Bool)

(assert (=> b!345459 (= e!211726 (Found!3361 (index!15625 lt!162874)))))

(declare-fun b!345460 () Bool)

(assert (=> b!345460 (= e!211727 (MissingZero!3361 (index!15625 lt!162874)))))

(assert (= (and d!71139 c!52999) b!345458))

(assert (= (and d!71139 (not c!52999)) b!345457))

(assert (= (and b!345457 c!53000) b!345459))

(assert (= (and b!345457 (not c!53000)) b!345455))

(assert (= (and b!345455 c!53001) b!345460))

(assert (= (and b!345455 (not c!53001)) b!345456))

(declare-fun m!346829 () Bool)

(assert (=> b!345456 m!346829))

(declare-fun m!346831 () Bool)

(assert (=> b!345457 m!346831))

(declare-fun m!346833 () Bool)

(assert (=> d!71139 m!346833))

(assert (=> d!71139 m!346793))

(declare-fun m!346835 () Bool)

(assert (=> d!71139 m!346835))

(assert (=> d!71139 m!346833))

(declare-fun m!346837 () Bool)

(assert (=> d!71139 m!346837))

(declare-fun m!346839 () Bool)

(assert (=> d!71139 m!346839))

(declare-fun m!346841 () Bool)

(assert (=> d!71139 m!346841))

(assert (=> b!345407 d!71139))

(declare-fun b!345469 () Bool)

(declare-fun e!211737 () Bool)

(declare-fun e!211735 () Bool)

(assert (=> b!345469 (= e!211737 e!211735)))

(declare-fun lt!162881 () (_ BitVec 64))

(assert (=> b!345469 (= lt!162881 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10733 0))(
  ( (Unit!10734) )
))
(declare-fun lt!162883 () Unit!10733)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18411 (_ BitVec 64) (_ BitVec 32)) Unit!10733)

(assert (=> b!345469 (= lt!162883 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!162881 #b00000000000000000000000000000000))))

(assert (=> b!345469 (arrayContainsKey!0 _keys!1895 lt!162881 #b00000000000000000000000000000000)))

(declare-fun lt!162882 () Unit!10733)

(assert (=> b!345469 (= lt!162882 lt!162883)))

(declare-fun res!191122 () Bool)

(assert (=> b!345469 (= res!191122 (= (seekEntryOrOpen!0 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3361 #b00000000000000000000000000000000)))))

(assert (=> b!345469 (=> (not res!191122) (not e!211735))))

(declare-fun b!345470 () Bool)

(declare-fun call!26704 () Bool)

(assert (=> b!345470 (= e!211735 call!26704)))

(declare-fun d!71141 () Bool)

(declare-fun res!191123 () Bool)

(declare-fun e!211736 () Bool)

(assert (=> d!71141 (=> res!191123 e!211736)))

(assert (=> d!71141 (= res!191123 (bvsge #b00000000000000000000000000000000 (size!9073 _keys!1895)))))

(assert (=> d!71141 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!211736)))

(declare-fun b!345471 () Bool)

(assert (=> b!345471 (= e!211737 call!26704)))

(declare-fun b!345472 () Bool)

(assert (=> b!345472 (= e!211736 e!211737)))

(declare-fun c!53004 () Bool)

(assert (=> b!345472 (= c!53004 (validKeyInArray!0 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26701 () Bool)

(assert (=> bm!26701 (= call!26704 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(assert (= (and d!71141 (not res!191123)) b!345472))

(assert (= (and b!345472 c!53004) b!345469))

(assert (= (and b!345472 (not c!53004)) b!345471))

(assert (= (and b!345469 res!191122) b!345470))

(assert (= (or b!345470 b!345471) bm!26701))

(declare-fun m!346843 () Bool)

(assert (=> b!345469 m!346843))

(declare-fun m!346845 () Bool)

(assert (=> b!345469 m!346845))

(declare-fun m!346847 () Bool)

(assert (=> b!345469 m!346847))

(assert (=> b!345469 m!346843))

(declare-fun m!346849 () Bool)

(assert (=> b!345469 m!346849))

(assert (=> b!345472 m!346843))

(assert (=> b!345472 m!346843))

(declare-fun m!346851 () Bool)

(assert (=> b!345472 m!346851))

(declare-fun m!346853 () Bool)

(assert (=> bm!26701 m!346853))

(assert (=> b!345404 d!71141))

(declare-fun d!71143 () Bool)

(declare-fun res!191128 () Bool)

(declare-fun e!211742 () Bool)

(assert (=> d!71143 (=> res!191128 e!211742)))

(assert (=> d!71143 (= res!191128 (= (select (arr!8721 _keys!1895) (index!15624 lt!162862)) k0!1348))))

(assert (=> d!71143 (= (arrayContainsKey!0 _keys!1895 k0!1348 (index!15624 lt!162862)) e!211742)))

(declare-fun b!345477 () Bool)

(declare-fun e!211743 () Bool)

(assert (=> b!345477 (= e!211742 e!211743)))

(declare-fun res!191129 () Bool)

(assert (=> b!345477 (=> (not res!191129) (not e!211743))))

(assert (=> b!345477 (= res!191129 (bvslt (bvadd (index!15624 lt!162862) #b00000000000000000000000000000001) (size!9073 _keys!1895)))))

(declare-fun b!345478 () Bool)

(assert (=> b!345478 (= e!211743 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd (index!15624 lt!162862) #b00000000000000000000000000000001)))))

(assert (= (and d!71143 (not res!191128)) b!345477))

(assert (= (and b!345477 res!191129) b!345478))

(assert (=> d!71143 m!346801))

(declare-fun m!346855 () Bool)

(assert (=> b!345478 m!346855))

(assert (=> b!345403 d!71143))

(declare-fun d!71145 () Bool)

(assert (=> d!71145 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!345412 d!71145))

(declare-fun d!71147 () Bool)

(declare-fun e!211749 () Bool)

(assert (=> d!71147 e!211749))

(declare-fun res!191132 () Bool)

(assert (=> d!71147 (=> res!191132 e!211749)))

(declare-fun lt!162894 () Bool)

(assert (=> d!71147 (= res!191132 (not lt!162894))))

(declare-fun lt!162895 () Bool)

(assert (=> d!71147 (= lt!162894 lt!162895)))

(declare-fun lt!162893 () Unit!10733)

(declare-fun e!211748 () Unit!10733)

(assert (=> d!71147 (= lt!162893 e!211748)))

(declare-fun c!53007 () Bool)

(assert (=> d!71147 (= c!53007 lt!162895)))

(declare-fun containsKey!331 (List!5046 (_ BitVec 64)) Bool)

(assert (=> d!71147 (= lt!162895 (containsKey!331 (toList!2183 (getCurrentListMap!1704 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71147 (= (contains!2242 (getCurrentListMap!1704 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!162894)))

(declare-fun b!345485 () Bool)

(declare-fun lt!162892 () Unit!10733)

(assert (=> b!345485 (= e!211748 lt!162892)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!279 (List!5046 (_ BitVec 64)) Unit!10733)

(assert (=> b!345485 (= lt!162892 (lemmaContainsKeyImpliesGetValueByKeyDefined!279 (toList!2183 (getCurrentListMap!1704 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!345 0))(
  ( (Some!344 (v!5930 V!10861)) (None!343) )
))
(declare-fun isDefined!280 (Option!345) Bool)

(declare-fun getValueByKey!339 (List!5046 (_ BitVec 64)) Option!345)

(assert (=> b!345485 (isDefined!280 (getValueByKey!339 (toList!2183 (getCurrentListMap!1704 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!345486 () Bool)

(declare-fun Unit!10735 () Unit!10733)

(assert (=> b!345486 (= e!211748 Unit!10735)))

(declare-fun b!345487 () Bool)

(assert (=> b!345487 (= e!211749 (isDefined!280 (getValueByKey!339 (toList!2183 (getCurrentListMap!1704 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71147 c!53007) b!345485))

(assert (= (and d!71147 (not c!53007)) b!345486))

(assert (= (and d!71147 (not res!191132)) b!345487))

(declare-fun m!346857 () Bool)

(assert (=> d!71147 m!346857))

(declare-fun m!346859 () Bool)

(assert (=> b!345485 m!346859))

(declare-fun m!346861 () Bool)

(assert (=> b!345485 m!346861))

(assert (=> b!345485 m!346861))

(declare-fun m!346863 () Bool)

(assert (=> b!345485 m!346863))

(assert (=> b!345487 m!346861))

(assert (=> b!345487 m!346861))

(assert (=> b!345487 m!346863))

(assert (=> b!345405 d!71147))

(declare-fun b!345530 () Bool)

(declare-fun e!211784 () Unit!10733)

(declare-fun Unit!10736 () Unit!10733)

(assert (=> b!345530 (= e!211784 Unit!10736)))

(declare-fun b!345531 () Bool)

(declare-fun e!211782 () Bool)

(declare-fun call!26719 () Bool)

(assert (=> b!345531 (= e!211782 (not call!26719))))

(declare-fun b!345532 () Bool)

(declare-fun e!211783 () ListLongMap!4335)

(declare-fun e!211779 () ListLongMap!4335)

(assert (=> b!345532 (= e!211783 e!211779)))

(declare-fun c!53022 () Bool)

(assert (=> b!345532 (= c!53022 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!345533 () Bool)

(declare-fun e!211780 () ListLongMap!4335)

(declare-fun call!26722 () ListLongMap!4335)

(assert (=> b!345533 (= e!211780 call!26722)))

(declare-fun bm!26716 () Bool)

(declare-fun call!26724 () Bool)

(declare-fun lt!162951 () ListLongMap!4335)

(assert (=> bm!26716 (= call!26724 (contains!2242 lt!162951 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!26721 () ListLongMap!4335)

(declare-fun bm!26717 () Bool)

(declare-fun call!26725 () ListLongMap!4335)

(declare-fun c!53023 () Bool)

(declare-fun call!26723 () ListLongMap!4335)

(declare-fun +!730 (ListLongMap!4335 tuple2!5422) ListLongMap!4335)

(assert (=> bm!26717 (= call!26723 (+!730 (ite c!53023 call!26721 (ite c!53022 call!26725 call!26722)) (ite (or c!53023 c!53022) (tuple2!5423 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5423 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!345534 () Bool)

(declare-fun res!191156 () Bool)

(declare-fun e!211777 () Bool)

(assert (=> b!345534 (=> (not res!191156) (not e!211777))))

(declare-fun e!211788 () Bool)

(assert (=> b!345534 (= res!191156 e!211788)))

(declare-fun res!191158 () Bool)

(assert (=> b!345534 (=> res!191158 e!211788)))

(declare-fun e!211776 () Bool)

(assert (=> b!345534 (= res!191158 (not e!211776))))

(declare-fun res!191151 () Bool)

(assert (=> b!345534 (=> (not res!191151) (not e!211776))))

(assert (=> b!345534 (= res!191151 (bvslt #b00000000000000000000000000000000 (size!9073 _keys!1895)))))

(declare-fun b!345535 () Bool)

(declare-fun e!211781 () Bool)

(assert (=> b!345535 (= e!211781 (not call!26724))))

(declare-fun bm!26718 () Bool)

(assert (=> bm!26718 (= call!26725 call!26721)))

(declare-fun bm!26719 () Bool)

(assert (=> bm!26719 (= call!26719 (contains!2242 lt!162951 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!345536 () Bool)

(declare-fun call!26720 () ListLongMap!4335)

(assert (=> b!345536 (= e!211780 call!26720)))

(declare-fun bm!26720 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!603 (array!18411 array!18413 (_ BitVec 32) (_ BitVec 32) V!10861 V!10861 (_ BitVec 32) Int) ListLongMap!4335)

(assert (=> bm!26720 (= call!26721 (getCurrentListMapNoExtraKeys!603 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!345537 () Bool)

(assert (=> b!345537 (= e!211783 (+!730 call!26723 (tuple2!5423 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!345538 () Bool)

(declare-fun e!211787 () Bool)

(assert (=> b!345538 (= e!211782 e!211787)))

(declare-fun res!191154 () Bool)

(assert (=> b!345538 (= res!191154 call!26719)))

(assert (=> b!345538 (=> (not res!191154) (not e!211787))))

(declare-fun b!345539 () Bool)

(declare-fun e!211786 () Bool)

(assert (=> b!345539 (= e!211786 (validKeyInArray!0 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345540 () Bool)

(declare-fun lt!162950 () Unit!10733)

(assert (=> b!345540 (= e!211784 lt!162950)))

(declare-fun lt!162952 () ListLongMap!4335)

(assert (=> b!345540 (= lt!162952 (getCurrentListMapNoExtraKeys!603 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162946 () (_ BitVec 64))

(assert (=> b!345540 (= lt!162946 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162940 () (_ BitVec 64))

(assert (=> b!345540 (= lt!162940 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162956 () Unit!10733)

(declare-fun addStillContains!257 (ListLongMap!4335 (_ BitVec 64) V!10861 (_ BitVec 64)) Unit!10733)

(assert (=> b!345540 (= lt!162956 (addStillContains!257 lt!162952 lt!162946 zeroValue!1467 lt!162940))))

(assert (=> b!345540 (contains!2242 (+!730 lt!162952 (tuple2!5423 lt!162946 zeroValue!1467)) lt!162940)))

(declare-fun lt!162945 () Unit!10733)

(assert (=> b!345540 (= lt!162945 lt!162956)))

(declare-fun lt!162949 () ListLongMap!4335)

(assert (=> b!345540 (= lt!162949 (getCurrentListMapNoExtraKeys!603 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162957 () (_ BitVec 64))

(assert (=> b!345540 (= lt!162957 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162941 () (_ BitVec 64))

(assert (=> b!345540 (= lt!162941 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162947 () Unit!10733)

(declare-fun addApplyDifferent!257 (ListLongMap!4335 (_ BitVec 64) V!10861 (_ BitVec 64)) Unit!10733)

(assert (=> b!345540 (= lt!162947 (addApplyDifferent!257 lt!162949 lt!162957 minValue!1467 lt!162941))))

(declare-fun apply!281 (ListLongMap!4335 (_ BitVec 64)) V!10861)

(assert (=> b!345540 (= (apply!281 (+!730 lt!162949 (tuple2!5423 lt!162957 minValue!1467)) lt!162941) (apply!281 lt!162949 lt!162941))))

(declare-fun lt!162958 () Unit!10733)

(assert (=> b!345540 (= lt!162958 lt!162947)))

(declare-fun lt!162944 () ListLongMap!4335)

(assert (=> b!345540 (= lt!162944 (getCurrentListMapNoExtraKeys!603 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162948 () (_ BitVec 64))

(assert (=> b!345540 (= lt!162948 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162961 () (_ BitVec 64))

(assert (=> b!345540 (= lt!162961 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162954 () Unit!10733)

(assert (=> b!345540 (= lt!162954 (addApplyDifferent!257 lt!162944 lt!162948 zeroValue!1467 lt!162961))))

(assert (=> b!345540 (= (apply!281 (+!730 lt!162944 (tuple2!5423 lt!162948 zeroValue!1467)) lt!162961) (apply!281 lt!162944 lt!162961))))

(declare-fun lt!162953 () Unit!10733)

(assert (=> b!345540 (= lt!162953 lt!162954)))

(declare-fun lt!162960 () ListLongMap!4335)

(assert (=> b!345540 (= lt!162960 (getCurrentListMapNoExtraKeys!603 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162942 () (_ BitVec 64))

(assert (=> b!345540 (= lt!162942 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162955 () (_ BitVec 64))

(assert (=> b!345540 (= lt!162955 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!345540 (= lt!162950 (addApplyDifferent!257 lt!162960 lt!162942 minValue!1467 lt!162955))))

(assert (=> b!345540 (= (apply!281 (+!730 lt!162960 (tuple2!5423 lt!162942 minValue!1467)) lt!162955) (apply!281 lt!162960 lt!162955))))

(declare-fun b!345541 () Bool)

(declare-fun e!211785 () Bool)

(assert (=> b!345541 (= e!211781 e!211785)))

(declare-fun res!191159 () Bool)

(assert (=> b!345541 (= res!191159 call!26724)))

(assert (=> b!345541 (=> (not res!191159) (not e!211785))))

(declare-fun b!345542 () Bool)

(declare-fun res!191152 () Bool)

(assert (=> b!345542 (=> (not res!191152) (not e!211777))))

(assert (=> b!345542 (= res!191152 e!211781)))

(declare-fun c!53025 () Bool)

(assert (=> b!345542 (= c!53025 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!211778 () Bool)

(declare-fun b!345543 () Bool)

(declare-fun get!4697 (ValueCell!3363 V!10861) V!10861)

(declare-fun dynLambda!624 (Int (_ BitVec 64)) V!10861)

(assert (=> b!345543 (= e!211778 (= (apply!281 lt!162951 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000)) (get!4697 (select (arr!8722 _values!1525) #b00000000000000000000000000000000) (dynLambda!624 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!345543 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9074 _values!1525)))))

(assert (=> b!345543 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9073 _keys!1895)))))

(declare-fun b!345544 () Bool)

(declare-fun c!53021 () Bool)

(assert (=> b!345544 (= c!53021 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!345544 (= e!211779 e!211780)))

(declare-fun b!345545 () Bool)

(assert (=> b!345545 (= e!211777 e!211782)))

(declare-fun c!53024 () Bool)

(assert (=> b!345545 (= c!53024 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!345546 () Bool)

(assert (=> b!345546 (= e!211785 (= (apply!281 lt!162951 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!345547 () Bool)

(assert (=> b!345547 (= e!211787 (= (apply!281 lt!162951 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!345549 () Bool)

(assert (=> b!345549 (= e!211779 call!26720)))

(declare-fun d!71149 () Bool)

(assert (=> d!71149 e!211777))

(declare-fun res!191157 () Bool)

(assert (=> d!71149 (=> (not res!191157) (not e!211777))))

(assert (=> d!71149 (= res!191157 (or (bvsge #b00000000000000000000000000000000 (size!9073 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9073 _keys!1895)))))))

(declare-fun lt!162959 () ListLongMap!4335)

(assert (=> d!71149 (= lt!162951 lt!162959)))

(declare-fun lt!162943 () Unit!10733)

(assert (=> d!71149 (= lt!162943 e!211784)))

(declare-fun c!53020 () Bool)

(assert (=> d!71149 (= c!53020 e!211786)))

(declare-fun res!191155 () Bool)

(assert (=> d!71149 (=> (not res!191155) (not e!211786))))

(assert (=> d!71149 (= res!191155 (bvslt #b00000000000000000000000000000000 (size!9073 _keys!1895)))))

(assert (=> d!71149 (= lt!162959 e!211783)))

(assert (=> d!71149 (= c!53023 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71149 (validMask!0 mask!2385)))

(assert (=> d!71149 (= (getCurrentListMap!1704 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!162951)))

(declare-fun b!345548 () Bool)

(assert (=> b!345548 (= e!211788 e!211778)))

(declare-fun res!191153 () Bool)

(assert (=> b!345548 (=> (not res!191153) (not e!211778))))

(assert (=> b!345548 (= res!191153 (contains!2242 lt!162951 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!345548 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9073 _keys!1895)))))

(declare-fun bm!26721 () Bool)

(assert (=> bm!26721 (= call!26720 call!26723)))

(declare-fun b!345550 () Bool)

(assert (=> b!345550 (= e!211776 (validKeyInArray!0 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26722 () Bool)

(assert (=> bm!26722 (= call!26722 call!26725)))

(assert (= (and d!71149 c!53023) b!345537))

(assert (= (and d!71149 (not c!53023)) b!345532))

(assert (= (and b!345532 c!53022) b!345549))

(assert (= (and b!345532 (not c!53022)) b!345544))

(assert (= (and b!345544 c!53021) b!345536))

(assert (= (and b!345544 (not c!53021)) b!345533))

(assert (= (or b!345536 b!345533) bm!26722))

(assert (= (or b!345549 bm!26722) bm!26718))

(assert (= (or b!345549 b!345536) bm!26721))

(assert (= (or b!345537 bm!26718) bm!26720))

(assert (= (or b!345537 bm!26721) bm!26717))

(assert (= (and d!71149 res!191155) b!345539))

(assert (= (and d!71149 c!53020) b!345540))

(assert (= (and d!71149 (not c!53020)) b!345530))

(assert (= (and d!71149 res!191157) b!345534))

(assert (= (and b!345534 res!191151) b!345550))

(assert (= (and b!345534 (not res!191158)) b!345548))

(assert (= (and b!345548 res!191153) b!345543))

(assert (= (and b!345534 res!191156) b!345542))

(assert (= (and b!345542 c!53025) b!345541))

(assert (= (and b!345542 (not c!53025)) b!345535))

(assert (= (and b!345541 res!191159) b!345546))

(assert (= (or b!345541 b!345535) bm!26716))

(assert (= (and b!345542 res!191152) b!345545))

(assert (= (and b!345545 c!53024) b!345538))

(assert (= (and b!345545 (not c!53024)) b!345531))

(assert (= (and b!345538 res!191154) b!345547))

(assert (= (or b!345538 b!345531) bm!26719))

(declare-fun b_lambda!8463 () Bool)

(assert (=> (not b_lambda!8463) (not b!345543)))

(declare-fun t!10169 () Bool)

(declare-fun tb!3077 () Bool)

(assert (=> (and start!34556 (= defaultEntry!1528 defaultEntry!1528) t!10169) tb!3077))

(declare-fun result!5561 () Bool)

(assert (=> tb!3077 (= result!5561 tp_is_empty!7413)))

(assert (=> b!345543 t!10169))

(declare-fun b_and!14675 () Bool)

(assert (= b_and!14671 (and (=> t!10169 result!5561) b_and!14675)))

(declare-fun m!346865 () Bool)

(assert (=> bm!26716 m!346865))

(assert (=> b!345550 m!346843))

(assert (=> b!345550 m!346843))

(assert (=> b!345550 m!346851))

(declare-fun m!346867 () Bool)

(assert (=> b!345540 m!346867))

(declare-fun m!346869 () Bool)

(assert (=> b!345540 m!346869))

(declare-fun m!346871 () Bool)

(assert (=> b!345540 m!346871))

(declare-fun m!346873 () Bool)

(assert (=> b!345540 m!346873))

(declare-fun m!346875 () Bool)

(assert (=> b!345540 m!346875))

(declare-fun m!346877 () Bool)

(assert (=> b!345540 m!346877))

(declare-fun m!346879 () Bool)

(assert (=> b!345540 m!346879))

(declare-fun m!346881 () Bool)

(assert (=> b!345540 m!346881))

(declare-fun m!346883 () Bool)

(assert (=> b!345540 m!346883))

(assert (=> b!345540 m!346867))

(declare-fun m!346885 () Bool)

(assert (=> b!345540 m!346885))

(assert (=> b!345540 m!346843))

(declare-fun m!346887 () Bool)

(assert (=> b!345540 m!346887))

(declare-fun m!346889 () Bool)

(assert (=> b!345540 m!346889))

(assert (=> b!345540 m!346881))

(declare-fun m!346891 () Bool)

(assert (=> b!345540 m!346891))

(assert (=> b!345540 m!346887))

(declare-fun m!346893 () Bool)

(assert (=> b!345540 m!346893))

(assert (=> b!345540 m!346873))

(declare-fun m!346895 () Bool)

(assert (=> b!345540 m!346895))

(declare-fun m!346897 () Bool)

(assert (=> b!345540 m!346897))

(assert (=> b!345548 m!346843))

(assert (=> b!345548 m!346843))

(declare-fun m!346899 () Bool)

(assert (=> b!345548 m!346899))

(declare-fun m!346901 () Bool)

(assert (=> bm!26719 m!346901))

(assert (=> b!345539 m!346843))

(assert (=> b!345539 m!346843))

(assert (=> b!345539 m!346851))

(declare-fun m!346903 () Bool)

(assert (=> bm!26717 m!346903))

(assert (=> d!71149 m!346793))

(declare-fun m!346905 () Bool)

(assert (=> b!345537 m!346905))

(declare-fun m!346907 () Bool)

(assert (=> b!345546 m!346907))

(declare-fun m!346909 () Bool)

(assert (=> b!345543 m!346909))

(declare-fun m!346911 () Bool)

(assert (=> b!345543 m!346911))

(assert (=> b!345543 m!346911))

(assert (=> b!345543 m!346909))

(declare-fun m!346913 () Bool)

(assert (=> b!345543 m!346913))

(assert (=> b!345543 m!346843))

(declare-fun m!346915 () Bool)

(assert (=> b!345543 m!346915))

(assert (=> b!345543 m!346843))

(assert (=> bm!26720 m!346897))

(declare-fun m!346917 () Bool)

(assert (=> b!345547 m!346917))

(assert (=> b!345405 d!71149))

(declare-fun b!345564 () Bool)

(declare-fun e!211800 () Bool)

(declare-fun e!211798 () Bool)

(assert (=> b!345564 (= e!211800 e!211798)))

(declare-fun res!191166 () Bool)

(assert (=> b!345564 (=> (not res!191166) (not e!211798))))

(declare-fun e!211799 () Bool)

(assert (=> b!345564 (= res!191166 (not e!211799))))

(declare-fun res!191168 () Bool)

(assert (=> b!345564 (=> (not res!191168) (not e!211799))))

(assert (=> b!345564 (= res!191168 (validKeyInArray!0 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345565 () Bool)

(declare-fun contains!2244 (List!5047 (_ BitVec 64)) Bool)

(assert (=> b!345565 (= e!211799 (contains!2244 Nil!5044 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345566 () Bool)

(declare-fun e!211797 () Bool)

(declare-fun call!26728 () Bool)

(assert (=> b!345566 (= e!211797 call!26728)))

(declare-fun b!345567 () Bool)

(assert (=> b!345567 (= e!211798 e!211797)))

(declare-fun c!53028 () Bool)

(assert (=> b!345567 (= c!53028 (validKeyInArray!0 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26725 () Bool)

(assert (=> bm!26725 (= call!26728 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53028 (Cons!5043 (select (arr!8721 _keys!1895) #b00000000000000000000000000000000) Nil!5044) Nil!5044)))))

(declare-fun b!345563 () Bool)

(assert (=> b!345563 (= e!211797 call!26728)))

(declare-fun d!71151 () Bool)

(declare-fun res!191167 () Bool)

(assert (=> d!71151 (=> res!191167 e!211800)))

(assert (=> d!71151 (= res!191167 (bvsge #b00000000000000000000000000000000 (size!9073 _keys!1895)))))

(assert (=> d!71151 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5044) e!211800)))

(assert (= (and d!71151 (not res!191167)) b!345564))

(assert (= (and b!345564 res!191168) b!345565))

(assert (= (and b!345564 res!191166) b!345567))

(assert (= (and b!345567 c!53028) b!345563))

(assert (= (and b!345567 (not c!53028)) b!345566))

(assert (= (or b!345563 b!345566) bm!26725))

(assert (=> b!345564 m!346843))

(assert (=> b!345564 m!346843))

(assert (=> b!345564 m!346851))

(assert (=> b!345565 m!346843))

(assert (=> b!345565 m!346843))

(declare-fun m!346919 () Bool)

(assert (=> b!345565 m!346919))

(assert (=> b!345567 m!346843))

(assert (=> b!345567 m!346843))

(assert (=> b!345567 m!346851))

(assert (=> bm!26725 m!346843))

(declare-fun m!346921 () Bool)

(assert (=> bm!26725 m!346921))

(assert (=> b!345406 d!71151))

(declare-fun d!71153 () Bool)

(assert (=> d!71153 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34556 d!71153))

(declare-fun d!71155 () Bool)

(assert (=> d!71155 (= (array_inv!6454 _values!1525) (bvsge (size!9074 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34556 d!71155))

(declare-fun d!71157 () Bool)

(assert (=> d!71157 (= (array_inv!6455 _keys!1895) (bvsge (size!9073 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34556 d!71157))

(declare-fun condMapEmpty!12567 () Bool)

(declare-fun mapDefault!12567 () ValueCell!3363)

(assert (=> mapNonEmpty!12561 (= condMapEmpty!12567 (= mapRest!12561 ((as const (Array (_ BitVec 32) ValueCell!3363)) mapDefault!12567)))))

(declare-fun e!211806 () Bool)

(declare-fun mapRes!12567 () Bool)

(assert (=> mapNonEmpty!12561 (= tp!25931 (and e!211806 mapRes!12567))))

(declare-fun mapIsEmpty!12567 () Bool)

(assert (=> mapIsEmpty!12567 mapRes!12567))

(declare-fun b!345574 () Bool)

(declare-fun e!211805 () Bool)

(assert (=> b!345574 (= e!211805 tp_is_empty!7413)))

(declare-fun mapNonEmpty!12567 () Bool)

(declare-fun tp!25941 () Bool)

(assert (=> mapNonEmpty!12567 (= mapRes!12567 (and tp!25941 e!211805))))

(declare-fun mapKey!12567 () (_ BitVec 32))

(declare-fun mapRest!12567 () (Array (_ BitVec 32) ValueCell!3363))

(declare-fun mapValue!12567 () ValueCell!3363)

(assert (=> mapNonEmpty!12567 (= mapRest!12561 (store mapRest!12567 mapKey!12567 mapValue!12567))))

(declare-fun b!345575 () Bool)

(assert (=> b!345575 (= e!211806 tp_is_empty!7413)))

(assert (= (and mapNonEmpty!12561 condMapEmpty!12567) mapIsEmpty!12567))

(assert (= (and mapNonEmpty!12561 (not condMapEmpty!12567)) mapNonEmpty!12567))

(assert (= (and mapNonEmpty!12567 ((_ is ValueCellFull!3363) mapValue!12567)) b!345574))

(assert (= (and mapNonEmpty!12561 ((_ is ValueCellFull!3363) mapDefault!12567)) b!345575))

(declare-fun m!346923 () Bool)

(assert (=> mapNonEmpty!12567 m!346923))

(declare-fun b_lambda!8465 () Bool)

(assert (= b_lambda!8463 (or (and start!34556 b_free!7461) b_lambda!8465)))

(check-sat (not b!345540) (not b!345469) (not b!345548) (not d!71139) (not b!345485) (not b_lambda!8465) (not b!345564) (not b!345565) tp_is_empty!7413 (not b!345546) (not bm!26701) (not bm!26717) (not b!345550) (not bm!26716) (not b!345537) (not b!345547) (not b_next!7461) (not d!71147) (not b!345539) b_and!14675 (not bm!26725) (not bm!26719) (not b!345472) (not b!345567) (not b!345456) (not bm!26720) (not d!71149) (not b!345487) (not b!345543) (not b!345478) (not mapNonEmpty!12567))
(check-sat b_and!14675 (not b_next!7461))
