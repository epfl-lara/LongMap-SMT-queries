; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96674 () Bool)

(assert start!96674)

(declare-fun b_free!23121 () Bool)

(declare-fun b_next!23121 () Bool)

(assert (=> start!96674 (= b_free!23121 (not b_next!23121))))

(declare-fun tp!81305 () Bool)

(declare-fun b_and!36975 () Bool)

(assert (=> start!96674 (= tp!81305 b_and!36975)))

(declare-fun b!1099537 () Bool)

(declare-fun e!627572 () Bool)

(declare-fun e!627570 () Bool)

(assert (=> b!1099537 (= e!627572 (not e!627570))))

(declare-fun res!733763 () Bool)

(assert (=> b!1099537 (=> res!733763 e!627570)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1099537 (= res!733763 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41355 0))(
  ( (V!41356 (val!13642 Int)) )
))
(declare-fun minValue!831 () V!41355)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17336 0))(
  ( (tuple2!17337 (_1!8679 (_ BitVec 64)) (_2!8679 V!41355)) )
))
(declare-datatypes ((List!23954 0))(
  ( (Nil!23951) (Cons!23950 (h!25159 tuple2!17336) (t!34121 List!23954)) )
))
(declare-datatypes ((ListLongMap!15305 0))(
  ( (ListLongMap!15306 (toList!7668 List!23954)) )
))
(declare-fun lt!492377 () ListLongMap!15305)

(declare-fun zeroValue!831 () V!41355)

(declare-datatypes ((array!71257 0))(
  ( (array!71258 (arr!34295 (Array (_ BitVec 32) (_ BitVec 64))) (size!34831 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71257)

(declare-datatypes ((ValueCell!12876 0))(
  ( (ValueCellFull!12876 (v!16268 V!41355)) (EmptyCell!12876) )
))
(declare-datatypes ((array!71259 0))(
  ( (array!71260 (arr!34296 (Array (_ BitVec 32) ValueCell!12876)) (size!34832 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71259)

(declare-fun getCurrentListMap!4382 (array!71257 array!71259 (_ BitVec 32) (_ BitVec 32) V!41355 V!41355 (_ BitVec 32) Int) ListLongMap!15305)

(assert (=> b!1099537 (= lt!492377 (getCurrentListMap!4382 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492372 () array!71259)

(declare-fun lt!492378 () array!71257)

(declare-fun lt!492371 () ListLongMap!15305)

(assert (=> b!1099537 (= lt!492371 (getCurrentListMap!4382 lt!492378 lt!492372 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492374 () ListLongMap!15305)

(declare-fun lt!492373 () ListLongMap!15305)

(assert (=> b!1099537 (and (= lt!492374 lt!492373) (= lt!492373 lt!492374))))

(declare-fun lt!492380 () ListLongMap!15305)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!957 (ListLongMap!15305 (_ BitVec 64)) ListLongMap!15305)

(assert (=> b!1099537 (= lt!492373 (-!957 lt!492380 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!36156 0))(
  ( (Unit!36157) )
))
(declare-fun lt!492376 () Unit!36156)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!208 (array!71257 array!71259 (_ BitVec 32) (_ BitVec 32) V!41355 V!41355 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36156)

(assert (=> b!1099537 (= lt!492376 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!208 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4178 (array!71257 array!71259 (_ BitVec 32) (_ BitVec 32) V!41355 V!41355 (_ BitVec 32) Int) ListLongMap!15305)

(assert (=> b!1099537 (= lt!492374 (getCurrentListMapNoExtraKeys!4178 lt!492378 lt!492372 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2313 (Int (_ BitVec 64)) V!41355)

(assert (=> b!1099537 (= lt!492372 (array!71260 (store (arr!34296 _values!874) i!650 (ValueCellFull!12876 (dynLambda!2313 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34832 _values!874)))))

(assert (=> b!1099537 (= lt!492380 (getCurrentListMapNoExtraKeys!4178 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1099537 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!492375 () Unit!36156)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71257 (_ BitVec 64) (_ BitVec 32)) Unit!36156)

(assert (=> b!1099537 (= lt!492375 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun lt!492379 () tuple2!17336)

(declare-fun b!1099538 () Bool)

(declare-fun +!3376 (ListLongMap!15305 tuple2!17336) ListLongMap!15305)

(assert (=> b!1099538 (= e!627570 (= lt!492377 (+!3376 lt!492380 lt!492379)))))

(assert (=> b!1099538 (= lt!492371 (+!3376 lt!492374 lt!492379))))

(assert (=> b!1099538 (= lt!492379 (tuple2!17337 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1099539 () Bool)

(declare-fun e!627571 () Bool)

(declare-fun tp_is_empty!27171 () Bool)

(assert (=> b!1099539 (= e!627571 tp_is_empty!27171)))

(declare-fun res!733757 () Bool)

(declare-fun e!627576 () Bool)

(assert (=> start!96674 (=> (not res!733757) (not e!627576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96674 (= res!733757 (validMask!0 mask!1414))))

(assert (=> start!96674 e!627576))

(assert (=> start!96674 tp!81305))

(assert (=> start!96674 true))

(assert (=> start!96674 tp_is_empty!27171))

(declare-fun array_inv!26418 (array!71257) Bool)

(assert (=> start!96674 (array_inv!26418 _keys!1070)))

(declare-fun e!627574 () Bool)

(declare-fun array_inv!26419 (array!71259) Bool)

(assert (=> start!96674 (and (array_inv!26419 _values!874) e!627574)))

(declare-fun b!1099540 () Bool)

(declare-fun mapRes!42532 () Bool)

(assert (=> b!1099540 (= e!627574 (and e!627571 mapRes!42532))))

(declare-fun condMapEmpty!42532 () Bool)

(declare-fun mapDefault!42532 () ValueCell!12876)

(assert (=> b!1099540 (= condMapEmpty!42532 (= (arr!34296 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12876)) mapDefault!42532)))))

(declare-fun b!1099541 () Bool)

(declare-fun res!733754 () Bool)

(assert (=> b!1099541 (=> (not res!733754) (not e!627576))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1099541 (= res!733754 (validKeyInArray!0 k0!904))))

(declare-fun b!1099542 () Bool)

(declare-fun res!733760 () Bool)

(assert (=> b!1099542 (=> (not res!733760) (not e!627576))))

(declare-datatypes ((List!23955 0))(
  ( (Nil!23952) (Cons!23951 (h!25160 (_ BitVec 64)) (t!34122 List!23955)) )
))
(declare-fun arrayNoDuplicates!0 (array!71257 (_ BitVec 32) List!23955) Bool)

(assert (=> b!1099542 (= res!733760 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23952))))

(declare-fun b!1099543 () Bool)

(declare-fun res!733761 () Bool)

(assert (=> b!1099543 (=> (not res!733761) (not e!627576))))

(assert (=> b!1099543 (= res!733761 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34831 _keys!1070))))))

(declare-fun b!1099544 () Bool)

(declare-fun res!733756 () Bool)

(assert (=> b!1099544 (=> (not res!733756) (not e!627576))))

(assert (=> b!1099544 (= res!733756 (= (select (arr!34295 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!42532 () Bool)

(declare-fun tp!81304 () Bool)

(declare-fun e!627573 () Bool)

(assert (=> mapNonEmpty!42532 (= mapRes!42532 (and tp!81304 e!627573))))

(declare-fun mapValue!42532 () ValueCell!12876)

(declare-fun mapKey!42532 () (_ BitVec 32))

(declare-fun mapRest!42532 () (Array (_ BitVec 32) ValueCell!12876))

(assert (=> mapNonEmpty!42532 (= (arr!34296 _values!874) (store mapRest!42532 mapKey!42532 mapValue!42532))))

(declare-fun b!1099545 () Bool)

(assert (=> b!1099545 (= e!627573 tp_is_empty!27171)))

(declare-fun b!1099546 () Bool)

(declare-fun res!733755 () Bool)

(assert (=> b!1099546 (=> (not res!733755) (not e!627576))))

(assert (=> b!1099546 (= res!733755 (and (= (size!34832 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34831 _keys!1070) (size!34832 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1099547 () Bool)

(declare-fun res!733758 () Bool)

(assert (=> b!1099547 (=> (not res!733758) (not e!627576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71257 (_ BitVec 32)) Bool)

(assert (=> b!1099547 (= res!733758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!42532 () Bool)

(assert (=> mapIsEmpty!42532 mapRes!42532))

(declare-fun b!1099548 () Bool)

(assert (=> b!1099548 (= e!627576 e!627572)))

(declare-fun res!733762 () Bool)

(assert (=> b!1099548 (=> (not res!733762) (not e!627572))))

(assert (=> b!1099548 (= res!733762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492378 mask!1414))))

(assert (=> b!1099548 (= lt!492378 (array!71258 (store (arr!34295 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34831 _keys!1070)))))

(declare-fun b!1099549 () Bool)

(declare-fun res!733759 () Bool)

(assert (=> b!1099549 (=> (not res!733759) (not e!627572))))

(assert (=> b!1099549 (= res!733759 (arrayNoDuplicates!0 lt!492378 #b00000000000000000000000000000000 Nil!23952))))

(assert (= (and start!96674 res!733757) b!1099546))

(assert (= (and b!1099546 res!733755) b!1099547))

(assert (= (and b!1099547 res!733758) b!1099542))

(assert (= (and b!1099542 res!733760) b!1099543))

(assert (= (and b!1099543 res!733761) b!1099541))

(assert (= (and b!1099541 res!733754) b!1099544))

(assert (= (and b!1099544 res!733756) b!1099548))

(assert (= (and b!1099548 res!733762) b!1099549))

(assert (= (and b!1099549 res!733759) b!1099537))

(assert (= (and b!1099537 (not res!733763)) b!1099538))

(assert (= (and b!1099540 condMapEmpty!42532) mapIsEmpty!42532))

(assert (= (and b!1099540 (not condMapEmpty!42532)) mapNonEmpty!42532))

(get-info :version)

(assert (= (and mapNonEmpty!42532 ((_ is ValueCellFull!12876) mapValue!42532)) b!1099545))

(assert (= (and b!1099540 ((_ is ValueCellFull!12876) mapDefault!42532)) b!1099539))

(assert (= start!96674 b!1099540))

(declare-fun b_lambda!17929 () Bool)

(assert (=> (not b_lambda!17929) (not b!1099537)))

(declare-fun t!34120 () Bool)

(declare-fun tb!7987 () Bool)

(assert (=> (and start!96674 (= defaultEntry!882 defaultEntry!882) t!34120) tb!7987))

(declare-fun result!16507 () Bool)

(assert (=> tb!7987 (= result!16507 tp_is_empty!27171)))

(assert (=> b!1099537 t!34120))

(declare-fun b_and!36977 () Bool)

(assert (= b_and!36975 (and (=> t!34120 result!16507) b_and!36977)))

(declare-fun m!1019521 () Bool)

(assert (=> b!1099548 m!1019521))

(declare-fun m!1019523 () Bool)

(assert (=> b!1099548 m!1019523))

(declare-fun m!1019525 () Bool)

(assert (=> b!1099537 m!1019525))

(declare-fun m!1019527 () Bool)

(assert (=> b!1099537 m!1019527))

(declare-fun m!1019529 () Bool)

(assert (=> b!1099537 m!1019529))

(declare-fun m!1019531 () Bool)

(assert (=> b!1099537 m!1019531))

(declare-fun m!1019533 () Bool)

(assert (=> b!1099537 m!1019533))

(declare-fun m!1019535 () Bool)

(assert (=> b!1099537 m!1019535))

(declare-fun m!1019537 () Bool)

(assert (=> b!1099537 m!1019537))

(declare-fun m!1019539 () Bool)

(assert (=> b!1099537 m!1019539))

(declare-fun m!1019541 () Bool)

(assert (=> b!1099537 m!1019541))

(declare-fun m!1019543 () Bool)

(assert (=> b!1099537 m!1019543))

(declare-fun m!1019545 () Bool)

(assert (=> b!1099538 m!1019545))

(declare-fun m!1019547 () Bool)

(assert (=> b!1099538 m!1019547))

(declare-fun m!1019549 () Bool)

(assert (=> mapNonEmpty!42532 m!1019549))

(declare-fun m!1019551 () Bool)

(assert (=> b!1099547 m!1019551))

(declare-fun m!1019553 () Bool)

(assert (=> b!1099544 m!1019553))

(declare-fun m!1019555 () Bool)

(assert (=> b!1099549 m!1019555))

(declare-fun m!1019557 () Bool)

(assert (=> b!1099541 m!1019557))

(declare-fun m!1019559 () Bool)

(assert (=> start!96674 m!1019559))

(declare-fun m!1019561 () Bool)

(assert (=> start!96674 m!1019561))

(declare-fun m!1019563 () Bool)

(assert (=> start!96674 m!1019563))

(declare-fun m!1019565 () Bool)

(assert (=> b!1099542 m!1019565))

(check-sat (not b!1099549) (not b!1099542) (not b!1099537) (not b!1099541) (not b!1099547) (not b!1099548) (not b_next!23121) tp_is_empty!27171 (not mapNonEmpty!42532) (not b_lambda!17929) (not b!1099538) (not start!96674) b_and!36977)
(check-sat b_and!36977 (not b_next!23121))
(get-model)

(declare-fun b_lambda!17933 () Bool)

(assert (= b_lambda!17929 (or (and start!96674 b_free!23121) b_lambda!17933)))

(check-sat (not b!1099549) (not b!1099538) (not b!1099542) (not b!1099537) (not b!1099541) (not b!1099547) (not b!1099548) (not b_next!23121) (not b_lambda!17933) tp_is_empty!27171 (not mapNonEmpty!42532) (not start!96674) b_and!36977)
(check-sat b_and!36977 (not b_next!23121))
(get-model)

(declare-fun d!130513 () Bool)

(declare-fun res!733798 () Bool)

(declare-fun e!627605 () Bool)

(assert (=> d!130513 (=> res!733798 e!627605)))

(assert (=> d!130513 (= res!733798 (bvsge #b00000000000000000000000000000000 (size!34831 lt!492378)))))

(assert (=> d!130513 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492378 mask!1414) e!627605)))

(declare-fun b!1099601 () Bool)

(declare-fun e!627606 () Bool)

(declare-fun e!627604 () Bool)

(assert (=> b!1099601 (= e!627606 e!627604)))

(declare-fun lt!492417 () (_ BitVec 64))

(assert (=> b!1099601 (= lt!492417 (select (arr!34295 lt!492378) #b00000000000000000000000000000000))))

(declare-fun lt!492419 () Unit!36156)

(assert (=> b!1099601 (= lt!492419 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!492378 lt!492417 #b00000000000000000000000000000000))))

(assert (=> b!1099601 (arrayContainsKey!0 lt!492378 lt!492417 #b00000000000000000000000000000000)))

(declare-fun lt!492418 () Unit!36156)

(assert (=> b!1099601 (= lt!492418 lt!492419)))

(declare-fun res!733799 () Bool)

(declare-datatypes ((SeekEntryResult!9911 0))(
  ( (MissingZero!9911 (index!42015 (_ BitVec 32))) (Found!9911 (index!42016 (_ BitVec 32))) (Intermediate!9911 (undefined!10723 Bool) (index!42017 (_ BitVec 32)) (x!98896 (_ BitVec 32))) (Undefined!9911) (MissingVacant!9911 (index!42018 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71257 (_ BitVec 32)) SeekEntryResult!9911)

(assert (=> b!1099601 (= res!733799 (= (seekEntryOrOpen!0 (select (arr!34295 lt!492378) #b00000000000000000000000000000000) lt!492378 mask!1414) (Found!9911 #b00000000000000000000000000000000)))))

(assert (=> b!1099601 (=> (not res!733799) (not e!627604))))

(declare-fun bm!45994 () Bool)

(declare-fun call!45997 () Bool)

(assert (=> bm!45994 (= call!45997 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!492378 mask!1414))))

(declare-fun b!1099602 () Bool)

(assert (=> b!1099602 (= e!627605 e!627606)))

(declare-fun c!108616 () Bool)

(assert (=> b!1099602 (= c!108616 (validKeyInArray!0 (select (arr!34295 lt!492378) #b00000000000000000000000000000000)))))

(declare-fun b!1099603 () Bool)

(assert (=> b!1099603 (= e!627606 call!45997)))

(declare-fun b!1099604 () Bool)

(assert (=> b!1099604 (= e!627604 call!45997)))

(assert (= (and d!130513 (not res!733798)) b!1099602))

(assert (= (and b!1099602 c!108616) b!1099601))

(assert (= (and b!1099602 (not c!108616)) b!1099603))

(assert (= (and b!1099601 res!733799) b!1099604))

(assert (= (or b!1099604 b!1099603) bm!45994))

(declare-fun m!1019613 () Bool)

(assert (=> b!1099601 m!1019613))

(declare-fun m!1019615 () Bool)

(assert (=> b!1099601 m!1019615))

(declare-fun m!1019617 () Bool)

(assert (=> b!1099601 m!1019617))

(assert (=> b!1099601 m!1019613))

(declare-fun m!1019619 () Bool)

(assert (=> b!1099601 m!1019619))

(declare-fun m!1019621 () Bool)

(assert (=> bm!45994 m!1019621))

(assert (=> b!1099602 m!1019613))

(assert (=> b!1099602 m!1019613))

(declare-fun m!1019623 () Bool)

(assert (=> b!1099602 m!1019623))

(assert (=> b!1099548 d!130513))

(declare-fun b!1099615 () Bool)

(declare-fun e!627615 () Bool)

(declare-fun contains!6392 (List!23955 (_ BitVec 64)) Bool)

(assert (=> b!1099615 (= e!627615 (contains!6392 Nil!23952 (select (arr!34295 lt!492378) #b00000000000000000000000000000000)))))

(declare-fun b!1099616 () Bool)

(declare-fun e!627618 () Bool)

(declare-fun e!627617 () Bool)

(assert (=> b!1099616 (= e!627618 e!627617)))

(declare-fun res!733808 () Bool)

(assert (=> b!1099616 (=> (not res!733808) (not e!627617))))

(assert (=> b!1099616 (= res!733808 (not e!627615))))

(declare-fun res!733807 () Bool)

(assert (=> b!1099616 (=> (not res!733807) (not e!627615))))

(assert (=> b!1099616 (= res!733807 (validKeyInArray!0 (select (arr!34295 lt!492378) #b00000000000000000000000000000000)))))

(declare-fun b!1099617 () Bool)

(declare-fun e!627616 () Bool)

(declare-fun call!46000 () Bool)

(assert (=> b!1099617 (= e!627616 call!46000)))

(declare-fun bm!45997 () Bool)

(declare-fun c!108619 () Bool)

(assert (=> bm!45997 (= call!46000 (arrayNoDuplicates!0 lt!492378 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108619 (Cons!23951 (select (arr!34295 lt!492378) #b00000000000000000000000000000000) Nil!23952) Nil!23952)))))

(declare-fun d!130515 () Bool)

(declare-fun res!733806 () Bool)

(assert (=> d!130515 (=> res!733806 e!627618)))

(assert (=> d!130515 (= res!733806 (bvsge #b00000000000000000000000000000000 (size!34831 lt!492378)))))

(assert (=> d!130515 (= (arrayNoDuplicates!0 lt!492378 #b00000000000000000000000000000000 Nil!23952) e!627618)))

(declare-fun b!1099618 () Bool)

(assert (=> b!1099618 (= e!627617 e!627616)))

(assert (=> b!1099618 (= c!108619 (validKeyInArray!0 (select (arr!34295 lt!492378) #b00000000000000000000000000000000)))))

(declare-fun b!1099619 () Bool)

(assert (=> b!1099619 (= e!627616 call!46000)))

(assert (= (and d!130515 (not res!733806)) b!1099616))

(assert (= (and b!1099616 res!733807) b!1099615))

(assert (= (and b!1099616 res!733808) b!1099618))

(assert (= (and b!1099618 c!108619) b!1099619))

(assert (= (and b!1099618 (not c!108619)) b!1099617))

(assert (= (or b!1099619 b!1099617) bm!45997))

(assert (=> b!1099615 m!1019613))

(assert (=> b!1099615 m!1019613))

(declare-fun m!1019625 () Bool)

(assert (=> b!1099615 m!1019625))

(assert (=> b!1099616 m!1019613))

(assert (=> b!1099616 m!1019613))

(assert (=> b!1099616 m!1019623))

(assert (=> bm!45997 m!1019613))

(declare-fun m!1019627 () Bool)

(assert (=> bm!45997 m!1019627))

(assert (=> b!1099618 m!1019613))

(assert (=> b!1099618 m!1019613))

(assert (=> b!1099618 m!1019623))

(assert (=> b!1099549 d!130515))

(declare-fun d!130517 () Bool)

(declare-fun e!627621 () Bool)

(assert (=> d!130517 e!627621))

(declare-fun res!733813 () Bool)

(assert (=> d!130517 (=> (not res!733813) (not e!627621))))

(declare-fun lt!492429 () ListLongMap!15305)

(declare-fun contains!6393 (ListLongMap!15305 (_ BitVec 64)) Bool)

(assert (=> d!130517 (= res!733813 (contains!6393 lt!492429 (_1!8679 lt!492379)))))

(declare-fun lt!492428 () List!23954)

(assert (=> d!130517 (= lt!492429 (ListLongMap!15306 lt!492428))))

(declare-fun lt!492431 () Unit!36156)

(declare-fun lt!492430 () Unit!36156)

(assert (=> d!130517 (= lt!492431 lt!492430)))

(declare-datatypes ((Option!674 0))(
  ( (Some!673 (v!16270 V!41355)) (None!672) )
))
(declare-fun getValueByKey!623 (List!23954 (_ BitVec 64)) Option!674)

(assert (=> d!130517 (= (getValueByKey!623 lt!492428 (_1!8679 lt!492379)) (Some!673 (_2!8679 lt!492379)))))

(declare-fun lemmaContainsTupThenGetReturnValue!300 (List!23954 (_ BitVec 64) V!41355) Unit!36156)

(assert (=> d!130517 (= lt!492430 (lemmaContainsTupThenGetReturnValue!300 lt!492428 (_1!8679 lt!492379) (_2!8679 lt!492379)))))

(declare-fun insertStrictlySorted!393 (List!23954 (_ BitVec 64) V!41355) List!23954)

(assert (=> d!130517 (= lt!492428 (insertStrictlySorted!393 (toList!7668 lt!492380) (_1!8679 lt!492379) (_2!8679 lt!492379)))))

(assert (=> d!130517 (= (+!3376 lt!492380 lt!492379) lt!492429)))

(declare-fun b!1099624 () Bool)

(declare-fun res!733814 () Bool)

(assert (=> b!1099624 (=> (not res!733814) (not e!627621))))

(assert (=> b!1099624 (= res!733814 (= (getValueByKey!623 (toList!7668 lt!492429) (_1!8679 lt!492379)) (Some!673 (_2!8679 lt!492379))))))

(declare-fun b!1099625 () Bool)

(declare-fun contains!6394 (List!23954 tuple2!17336) Bool)

(assert (=> b!1099625 (= e!627621 (contains!6394 (toList!7668 lt!492429) lt!492379))))

(assert (= (and d!130517 res!733813) b!1099624))

(assert (= (and b!1099624 res!733814) b!1099625))

(declare-fun m!1019629 () Bool)

(assert (=> d!130517 m!1019629))

(declare-fun m!1019631 () Bool)

(assert (=> d!130517 m!1019631))

(declare-fun m!1019633 () Bool)

(assert (=> d!130517 m!1019633))

(declare-fun m!1019635 () Bool)

(assert (=> d!130517 m!1019635))

(declare-fun m!1019637 () Bool)

(assert (=> b!1099624 m!1019637))

(declare-fun m!1019639 () Bool)

(assert (=> b!1099625 m!1019639))

(assert (=> b!1099538 d!130517))

(declare-fun d!130519 () Bool)

(declare-fun e!627622 () Bool)

(assert (=> d!130519 e!627622))

(declare-fun res!733815 () Bool)

(assert (=> d!130519 (=> (not res!733815) (not e!627622))))

(declare-fun lt!492433 () ListLongMap!15305)

(assert (=> d!130519 (= res!733815 (contains!6393 lt!492433 (_1!8679 lt!492379)))))

(declare-fun lt!492432 () List!23954)

(assert (=> d!130519 (= lt!492433 (ListLongMap!15306 lt!492432))))

(declare-fun lt!492435 () Unit!36156)

(declare-fun lt!492434 () Unit!36156)

(assert (=> d!130519 (= lt!492435 lt!492434)))

(assert (=> d!130519 (= (getValueByKey!623 lt!492432 (_1!8679 lt!492379)) (Some!673 (_2!8679 lt!492379)))))

(assert (=> d!130519 (= lt!492434 (lemmaContainsTupThenGetReturnValue!300 lt!492432 (_1!8679 lt!492379) (_2!8679 lt!492379)))))

(assert (=> d!130519 (= lt!492432 (insertStrictlySorted!393 (toList!7668 lt!492374) (_1!8679 lt!492379) (_2!8679 lt!492379)))))

(assert (=> d!130519 (= (+!3376 lt!492374 lt!492379) lt!492433)))

(declare-fun b!1099626 () Bool)

(declare-fun res!733816 () Bool)

(assert (=> b!1099626 (=> (not res!733816) (not e!627622))))

(assert (=> b!1099626 (= res!733816 (= (getValueByKey!623 (toList!7668 lt!492433) (_1!8679 lt!492379)) (Some!673 (_2!8679 lt!492379))))))

(declare-fun b!1099627 () Bool)

(assert (=> b!1099627 (= e!627622 (contains!6394 (toList!7668 lt!492433) lt!492379))))

(assert (= (and d!130519 res!733815) b!1099626))

(assert (= (and b!1099626 res!733816) b!1099627))

(declare-fun m!1019641 () Bool)

(assert (=> d!130519 m!1019641))

(declare-fun m!1019643 () Bool)

(assert (=> d!130519 m!1019643))

(declare-fun m!1019645 () Bool)

(assert (=> d!130519 m!1019645))

(declare-fun m!1019647 () Bool)

(assert (=> d!130519 m!1019647))

(declare-fun m!1019649 () Bool)

(assert (=> b!1099626 m!1019649))

(declare-fun m!1019651 () Bool)

(assert (=> b!1099627 m!1019651))

(assert (=> b!1099538 d!130519))

(declare-fun b!1099628 () Bool)

(declare-fun e!627623 () Bool)

(assert (=> b!1099628 (= e!627623 (contains!6392 Nil!23952 (select (arr!34295 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1099629 () Bool)

(declare-fun e!627626 () Bool)

(declare-fun e!627625 () Bool)

(assert (=> b!1099629 (= e!627626 e!627625)))

(declare-fun res!733819 () Bool)

(assert (=> b!1099629 (=> (not res!733819) (not e!627625))))

(assert (=> b!1099629 (= res!733819 (not e!627623))))

(declare-fun res!733818 () Bool)

(assert (=> b!1099629 (=> (not res!733818) (not e!627623))))

(assert (=> b!1099629 (= res!733818 (validKeyInArray!0 (select (arr!34295 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1099630 () Bool)

(declare-fun e!627624 () Bool)

(declare-fun call!46001 () Bool)

(assert (=> b!1099630 (= e!627624 call!46001)))

(declare-fun bm!45998 () Bool)

(declare-fun c!108620 () Bool)

(assert (=> bm!45998 (= call!46001 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108620 (Cons!23951 (select (arr!34295 _keys!1070) #b00000000000000000000000000000000) Nil!23952) Nil!23952)))))

(declare-fun d!130521 () Bool)

(declare-fun res!733817 () Bool)

(assert (=> d!130521 (=> res!733817 e!627626)))

(assert (=> d!130521 (= res!733817 (bvsge #b00000000000000000000000000000000 (size!34831 _keys!1070)))))

(assert (=> d!130521 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23952) e!627626)))

(declare-fun b!1099631 () Bool)

(assert (=> b!1099631 (= e!627625 e!627624)))

(assert (=> b!1099631 (= c!108620 (validKeyInArray!0 (select (arr!34295 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1099632 () Bool)

(assert (=> b!1099632 (= e!627624 call!46001)))

(assert (= (and d!130521 (not res!733817)) b!1099629))

(assert (= (and b!1099629 res!733818) b!1099628))

(assert (= (and b!1099629 res!733819) b!1099631))

(assert (= (and b!1099631 c!108620) b!1099632))

(assert (= (and b!1099631 (not c!108620)) b!1099630))

(assert (= (or b!1099632 b!1099630) bm!45998))

(declare-fun m!1019653 () Bool)

(assert (=> b!1099628 m!1019653))

(assert (=> b!1099628 m!1019653))

(declare-fun m!1019655 () Bool)

(assert (=> b!1099628 m!1019655))

(assert (=> b!1099629 m!1019653))

(assert (=> b!1099629 m!1019653))

(declare-fun m!1019657 () Bool)

(assert (=> b!1099629 m!1019657))

(assert (=> bm!45998 m!1019653))

(declare-fun m!1019659 () Bool)

(assert (=> bm!45998 m!1019659))

(assert (=> b!1099631 m!1019653))

(assert (=> b!1099631 m!1019653))

(assert (=> b!1099631 m!1019657))

(assert (=> b!1099542 d!130521))

(declare-fun d!130523 () Bool)

(declare-fun res!733824 () Bool)

(declare-fun e!627631 () Bool)

(assert (=> d!130523 (=> res!733824 e!627631)))

(assert (=> d!130523 (= res!733824 (= (select (arr!34295 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130523 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!627631)))

(declare-fun b!1099637 () Bool)

(declare-fun e!627632 () Bool)

(assert (=> b!1099637 (= e!627631 e!627632)))

(declare-fun res!733825 () Bool)

(assert (=> b!1099637 (=> (not res!733825) (not e!627632))))

(assert (=> b!1099637 (= res!733825 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34831 _keys!1070)))))

(declare-fun b!1099638 () Bool)

(assert (=> b!1099638 (= e!627632 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130523 (not res!733824)) b!1099637))

(assert (= (and b!1099637 res!733825) b!1099638))

(assert (=> d!130523 m!1019653))

(declare-fun m!1019661 () Bool)

(assert (=> b!1099638 m!1019661))

(assert (=> b!1099537 d!130523))

(declare-fun bm!46014 () Bool)

(declare-fun call!46020 () ListLongMap!15305)

(declare-fun call!46016 () ListLongMap!15305)

(assert (=> bm!46014 (= call!46020 call!46016)))

(declare-fun b!1099681 () Bool)

(declare-fun e!627660 () Bool)

(assert (=> b!1099681 (= e!627660 (validKeyInArray!0 (select (arr!34295 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1099682 () Bool)

(declare-fun e!627668 () Bool)

(declare-fun e!627664 () Bool)

(assert (=> b!1099682 (= e!627668 e!627664)))

(declare-fun res!733852 () Bool)

(declare-fun call!46021 () Bool)

(assert (=> b!1099682 (= res!733852 call!46021)))

(assert (=> b!1099682 (=> (not res!733852) (not e!627664))))

(declare-fun b!1099683 () Bool)

(declare-fun e!627671 () Bool)

(declare-fun e!627663 () Bool)

(assert (=> b!1099683 (= e!627671 e!627663)))

(declare-fun res!733849 () Bool)

(declare-fun call!46019 () Bool)

(assert (=> b!1099683 (= res!733849 call!46019)))

(assert (=> b!1099683 (=> (not res!733849) (not e!627663))))

(declare-fun b!1099684 () Bool)

(declare-fun e!627661 () Bool)

(declare-fun e!627669 () Bool)

(assert (=> b!1099684 (= e!627661 e!627669)))

(declare-fun res!733844 () Bool)

(assert (=> b!1099684 (=> (not res!733844) (not e!627669))))

(declare-fun lt!492490 () ListLongMap!15305)

(assert (=> b!1099684 (= res!733844 (contains!6393 lt!492490 (select (arr!34295 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1099684 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34831 _keys!1070)))))

(declare-fun b!1099685 () Bool)

(declare-fun apply!948 (ListLongMap!15305 (_ BitVec 64)) V!41355)

(assert (=> b!1099685 (= e!627664 (= (apply!948 lt!492490 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun bm!46015 () Bool)

(declare-fun c!108634 () Bool)

(declare-fun call!46017 () ListLongMap!15305)

(declare-fun c!108638 () Bool)

(declare-fun call!46022 () ListLongMap!15305)

(declare-fun call!46018 () ListLongMap!15305)

(assert (=> bm!46015 (= call!46016 (+!3376 (ite c!108638 call!46018 (ite c!108634 call!46017 call!46022)) (ite (or c!108638 c!108634) (tuple2!17337 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1099686 () Bool)

(declare-fun e!627667 () ListLongMap!15305)

(declare-fun e!627670 () ListLongMap!15305)

(assert (=> b!1099686 (= e!627667 e!627670)))

(assert (=> b!1099686 (= c!108634 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!46016 () Bool)

(assert (=> bm!46016 (= call!46021 (contains!6393 lt!492490 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1099687 () Bool)

(assert (=> b!1099687 (= e!627671 (not call!46019))))

(declare-fun b!1099688 () Bool)

(declare-fun res!733850 () Bool)

(declare-fun e!627662 () Bool)

(assert (=> b!1099688 (=> (not res!733850) (not e!627662))))

(assert (=> b!1099688 (= res!733850 e!627661)))

(declare-fun res!733847 () Bool)

(assert (=> b!1099688 (=> res!733847 e!627661)))

(assert (=> b!1099688 (= res!733847 (not e!627660))))

(declare-fun res!733851 () Bool)

(assert (=> b!1099688 (=> (not res!733851) (not e!627660))))

(assert (=> b!1099688 (= res!733851 (bvslt #b00000000000000000000000000000000 (size!34831 _keys!1070)))))

(declare-fun b!1099689 () Bool)

(declare-fun e!627665 () Bool)

(assert (=> b!1099689 (= e!627665 (validKeyInArray!0 (select (arr!34295 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!130525 () Bool)

(assert (=> d!130525 e!627662))

(declare-fun res!733848 () Bool)

(assert (=> d!130525 (=> (not res!733848) (not e!627662))))

(assert (=> d!130525 (= res!733848 (or (bvsge #b00000000000000000000000000000000 (size!34831 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34831 _keys!1070)))))))

(declare-fun lt!492497 () ListLongMap!15305)

(assert (=> d!130525 (= lt!492490 lt!492497)))

(declare-fun lt!492482 () Unit!36156)

(declare-fun e!627659 () Unit!36156)

(assert (=> d!130525 (= lt!492482 e!627659)))

(declare-fun c!108635 () Bool)

(assert (=> d!130525 (= c!108635 e!627665)))

(declare-fun res!733845 () Bool)

(assert (=> d!130525 (=> (not res!733845) (not e!627665))))

(assert (=> d!130525 (= res!733845 (bvslt #b00000000000000000000000000000000 (size!34831 _keys!1070)))))

(assert (=> d!130525 (= lt!492497 e!627667)))

(assert (=> d!130525 (= c!108638 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130525 (validMask!0 mask!1414)))

(assert (=> d!130525 (= (getCurrentListMap!4382 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492490)))

(declare-fun bm!46013 () Bool)

(assert (=> bm!46013 (= call!46019 (contains!6393 lt!492490 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!46017 () Bool)

(assert (=> bm!46017 (= call!46018 (getCurrentListMapNoExtraKeys!4178 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1099690 () Bool)

(assert (=> b!1099690 (= e!627667 (+!3376 call!46016 (tuple2!17337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1099691 () Bool)

(declare-fun res!733846 () Bool)

(assert (=> b!1099691 (=> (not res!733846) (not e!627662))))

(assert (=> b!1099691 (= res!733846 e!627668)))

(declare-fun c!108633 () Bool)

(assert (=> b!1099691 (= c!108633 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1099692 () Bool)

(assert (=> b!1099692 (= e!627663 (= (apply!948 lt!492490 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun bm!46018 () Bool)

(assert (=> bm!46018 (= call!46022 call!46017)))

(declare-fun b!1099693 () Bool)

(declare-fun get!17634 (ValueCell!12876 V!41355) V!41355)

(assert (=> b!1099693 (= e!627669 (= (apply!948 lt!492490 (select (arr!34295 _keys!1070) #b00000000000000000000000000000000)) (get!17634 (select (arr!34296 _values!874) #b00000000000000000000000000000000) (dynLambda!2313 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1099693 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34832 _values!874)))))

(assert (=> b!1099693 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34831 _keys!1070)))))

(declare-fun b!1099694 () Bool)

(declare-fun lt!492496 () Unit!36156)

(assert (=> b!1099694 (= e!627659 lt!492496)))

(declare-fun lt!492483 () ListLongMap!15305)

(assert (=> b!1099694 (= lt!492483 (getCurrentListMapNoExtraKeys!4178 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492493 () (_ BitVec 64))

(assert (=> b!1099694 (= lt!492493 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492492 () (_ BitVec 64))

(assert (=> b!1099694 (= lt!492492 (select (arr!34295 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492489 () Unit!36156)

(declare-fun addStillContains!661 (ListLongMap!15305 (_ BitVec 64) V!41355 (_ BitVec 64)) Unit!36156)

(assert (=> b!1099694 (= lt!492489 (addStillContains!661 lt!492483 lt!492493 zeroValue!831 lt!492492))))

(assert (=> b!1099694 (contains!6393 (+!3376 lt!492483 (tuple2!17337 lt!492493 zeroValue!831)) lt!492492)))

(declare-fun lt!492501 () Unit!36156)

(assert (=> b!1099694 (= lt!492501 lt!492489)))

(declare-fun lt!492488 () ListLongMap!15305)

(assert (=> b!1099694 (= lt!492488 (getCurrentListMapNoExtraKeys!4178 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492485 () (_ BitVec 64))

(assert (=> b!1099694 (= lt!492485 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492499 () (_ BitVec 64))

(assert (=> b!1099694 (= lt!492499 (select (arr!34295 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492491 () Unit!36156)

(declare-fun addApplyDifferent!521 (ListLongMap!15305 (_ BitVec 64) V!41355 (_ BitVec 64)) Unit!36156)

(assert (=> b!1099694 (= lt!492491 (addApplyDifferent!521 lt!492488 lt!492485 minValue!831 lt!492499))))

(assert (=> b!1099694 (= (apply!948 (+!3376 lt!492488 (tuple2!17337 lt!492485 minValue!831)) lt!492499) (apply!948 lt!492488 lt!492499))))

(declare-fun lt!492495 () Unit!36156)

(assert (=> b!1099694 (= lt!492495 lt!492491)))

(declare-fun lt!492480 () ListLongMap!15305)

(assert (=> b!1099694 (= lt!492480 (getCurrentListMapNoExtraKeys!4178 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492500 () (_ BitVec 64))

(assert (=> b!1099694 (= lt!492500 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492494 () (_ BitVec 64))

(assert (=> b!1099694 (= lt!492494 (select (arr!34295 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492481 () Unit!36156)

(assert (=> b!1099694 (= lt!492481 (addApplyDifferent!521 lt!492480 lt!492500 zeroValue!831 lt!492494))))

(assert (=> b!1099694 (= (apply!948 (+!3376 lt!492480 (tuple2!17337 lt!492500 zeroValue!831)) lt!492494) (apply!948 lt!492480 lt!492494))))

(declare-fun lt!492484 () Unit!36156)

(assert (=> b!1099694 (= lt!492484 lt!492481)))

(declare-fun lt!492498 () ListLongMap!15305)

(assert (=> b!1099694 (= lt!492498 (getCurrentListMapNoExtraKeys!4178 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492486 () (_ BitVec 64))

(assert (=> b!1099694 (= lt!492486 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492487 () (_ BitVec 64))

(assert (=> b!1099694 (= lt!492487 (select (arr!34295 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1099694 (= lt!492496 (addApplyDifferent!521 lt!492498 lt!492486 minValue!831 lt!492487))))

(assert (=> b!1099694 (= (apply!948 (+!3376 lt!492498 (tuple2!17337 lt!492486 minValue!831)) lt!492487) (apply!948 lt!492498 lt!492487))))

(declare-fun b!1099695 () Bool)

(declare-fun Unit!36158 () Unit!36156)

(assert (=> b!1099695 (= e!627659 Unit!36158)))

(declare-fun b!1099696 () Bool)

(assert (=> b!1099696 (= e!627670 call!46020)))

(declare-fun b!1099697 () Bool)

(assert (=> b!1099697 (= e!627662 e!627671)))

(declare-fun c!108637 () Bool)

(assert (=> b!1099697 (= c!108637 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1099698 () Bool)

(assert (=> b!1099698 (= e!627668 (not call!46021))))

(declare-fun b!1099699 () Bool)

(declare-fun c!108636 () Bool)

(assert (=> b!1099699 (= c!108636 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!627666 () ListLongMap!15305)

(assert (=> b!1099699 (= e!627670 e!627666)))

(declare-fun b!1099700 () Bool)

(assert (=> b!1099700 (= e!627666 call!46020)))

(declare-fun b!1099701 () Bool)

(assert (=> b!1099701 (= e!627666 call!46022)))

(declare-fun bm!46019 () Bool)

(assert (=> bm!46019 (= call!46017 call!46018)))

(assert (= (and d!130525 c!108638) b!1099690))

(assert (= (and d!130525 (not c!108638)) b!1099686))

(assert (= (and b!1099686 c!108634) b!1099696))

(assert (= (and b!1099686 (not c!108634)) b!1099699))

(assert (= (and b!1099699 c!108636) b!1099700))

(assert (= (and b!1099699 (not c!108636)) b!1099701))

(assert (= (or b!1099700 b!1099701) bm!46018))

(assert (= (or b!1099696 bm!46018) bm!46019))

(assert (= (or b!1099696 b!1099700) bm!46014))

(assert (= (or b!1099690 bm!46019) bm!46017))

(assert (= (or b!1099690 bm!46014) bm!46015))

(assert (= (and d!130525 res!733845) b!1099689))

(assert (= (and d!130525 c!108635) b!1099694))

(assert (= (and d!130525 (not c!108635)) b!1099695))

(assert (= (and d!130525 res!733848) b!1099688))

(assert (= (and b!1099688 res!733851) b!1099681))

(assert (= (and b!1099688 (not res!733847)) b!1099684))

(assert (= (and b!1099684 res!733844) b!1099693))

(assert (= (and b!1099688 res!733850) b!1099691))

(assert (= (and b!1099691 c!108633) b!1099682))

(assert (= (and b!1099691 (not c!108633)) b!1099698))

(assert (= (and b!1099682 res!733852) b!1099685))

(assert (= (or b!1099682 b!1099698) bm!46016))

(assert (= (and b!1099691 res!733846) b!1099697))

(assert (= (and b!1099697 c!108637) b!1099683))

(assert (= (and b!1099697 (not c!108637)) b!1099687))

(assert (= (and b!1099683 res!733849) b!1099692))

(assert (= (or b!1099683 b!1099687) bm!46013))

(declare-fun b_lambda!17935 () Bool)

(assert (=> (not b_lambda!17935) (not b!1099693)))

(assert (=> b!1099693 t!34120))

(declare-fun b_and!36983 () Bool)

(assert (= b_and!36977 (and (=> t!34120 result!16507) b_and!36983)))

(declare-fun m!1019663 () Bool)

(assert (=> b!1099694 m!1019663))

(declare-fun m!1019665 () Bool)

(assert (=> b!1099694 m!1019665))

(declare-fun m!1019667 () Bool)

(assert (=> b!1099694 m!1019667))

(assert (=> b!1099694 m!1019539))

(assert (=> b!1099694 m!1019667))

(declare-fun m!1019669 () Bool)

(assert (=> b!1099694 m!1019669))

(declare-fun m!1019671 () Bool)

(assert (=> b!1099694 m!1019671))

(declare-fun m!1019673 () Bool)

(assert (=> b!1099694 m!1019673))

(assert (=> b!1099694 m!1019653))

(declare-fun m!1019675 () Bool)

(assert (=> b!1099694 m!1019675))

(declare-fun m!1019677 () Bool)

(assert (=> b!1099694 m!1019677))

(declare-fun m!1019679 () Bool)

(assert (=> b!1099694 m!1019679))

(assert (=> b!1099694 m!1019675))

(declare-fun m!1019681 () Bool)

(assert (=> b!1099694 m!1019681))

(declare-fun m!1019683 () Bool)

(assert (=> b!1099694 m!1019683))

(declare-fun m!1019685 () Bool)

(assert (=> b!1099694 m!1019685))

(declare-fun m!1019687 () Bool)

(assert (=> b!1099694 m!1019687))

(declare-fun m!1019689 () Bool)

(assert (=> b!1099694 m!1019689))

(assert (=> b!1099694 m!1019683))

(declare-fun m!1019691 () Bool)

(assert (=> b!1099694 m!1019691))

(assert (=> b!1099694 m!1019685))

(declare-fun m!1019693 () Bool)

(assert (=> bm!46015 m!1019693))

(assert (=> b!1099681 m!1019653))

(assert (=> b!1099681 m!1019653))

(assert (=> b!1099681 m!1019657))

(declare-fun m!1019695 () Bool)

(assert (=> bm!46016 m!1019695))

(assert (=> b!1099684 m!1019653))

(assert (=> b!1099684 m!1019653))

(declare-fun m!1019697 () Bool)

(assert (=> b!1099684 m!1019697))

(assert (=> bm!46017 m!1019539))

(declare-fun m!1019699 () Bool)

(assert (=> bm!46013 m!1019699))

(assert (=> b!1099693 m!1019525))

(declare-fun m!1019701 () Bool)

(assert (=> b!1099693 m!1019701))

(assert (=> b!1099693 m!1019525))

(declare-fun m!1019703 () Bool)

(assert (=> b!1099693 m!1019703))

(assert (=> b!1099693 m!1019653))

(assert (=> b!1099693 m!1019653))

(declare-fun m!1019705 () Bool)

(assert (=> b!1099693 m!1019705))

(assert (=> b!1099693 m!1019701))

(assert (=> d!130525 m!1019559))

(assert (=> b!1099689 m!1019653))

(assert (=> b!1099689 m!1019653))

(assert (=> b!1099689 m!1019657))

(declare-fun m!1019707 () Bool)

(assert (=> b!1099692 m!1019707))

(declare-fun m!1019709 () Bool)

(assert (=> b!1099685 m!1019709))

(declare-fun m!1019711 () Bool)

(assert (=> b!1099690 m!1019711))

(assert (=> b!1099537 d!130525))

(declare-fun bm!46021 () Bool)

(declare-fun call!46027 () ListLongMap!15305)

(declare-fun call!46023 () ListLongMap!15305)

(assert (=> bm!46021 (= call!46027 call!46023)))

(declare-fun b!1099702 () Bool)

(declare-fun e!627673 () Bool)

(assert (=> b!1099702 (= e!627673 (validKeyInArray!0 (select (arr!34295 lt!492378) #b00000000000000000000000000000000)))))

(declare-fun b!1099703 () Bool)

(declare-fun e!627681 () Bool)

(declare-fun e!627677 () Bool)

(assert (=> b!1099703 (= e!627681 e!627677)))

(declare-fun res!733861 () Bool)

(declare-fun call!46028 () Bool)

(assert (=> b!1099703 (= res!733861 call!46028)))

(assert (=> b!1099703 (=> (not res!733861) (not e!627677))))

(declare-fun b!1099704 () Bool)

(declare-fun e!627684 () Bool)

(declare-fun e!627676 () Bool)

(assert (=> b!1099704 (= e!627684 e!627676)))

(declare-fun res!733858 () Bool)

(declare-fun call!46026 () Bool)

(assert (=> b!1099704 (= res!733858 call!46026)))

(assert (=> b!1099704 (=> (not res!733858) (not e!627676))))

(declare-fun b!1099705 () Bool)

(declare-fun e!627674 () Bool)

(declare-fun e!627682 () Bool)

(assert (=> b!1099705 (= e!627674 e!627682)))

(declare-fun res!733853 () Bool)

(assert (=> b!1099705 (=> (not res!733853) (not e!627682))))

(declare-fun lt!492512 () ListLongMap!15305)

(assert (=> b!1099705 (= res!733853 (contains!6393 lt!492512 (select (arr!34295 lt!492378) #b00000000000000000000000000000000)))))

(assert (=> b!1099705 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34831 lt!492378)))))

(declare-fun b!1099706 () Bool)

(assert (=> b!1099706 (= e!627677 (= (apply!948 lt!492512 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun call!46025 () ListLongMap!15305)

(declare-fun call!46029 () ListLongMap!15305)

(declare-fun c!108640 () Bool)

(declare-fun bm!46022 () Bool)

(declare-fun call!46024 () ListLongMap!15305)

(declare-fun c!108644 () Bool)

(assert (=> bm!46022 (= call!46023 (+!3376 (ite c!108644 call!46025 (ite c!108640 call!46024 call!46029)) (ite (or c!108644 c!108640) (tuple2!17337 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1099707 () Bool)

(declare-fun e!627680 () ListLongMap!15305)

(declare-fun e!627683 () ListLongMap!15305)

(assert (=> b!1099707 (= e!627680 e!627683)))

(assert (=> b!1099707 (= c!108640 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!46023 () Bool)

(assert (=> bm!46023 (= call!46028 (contains!6393 lt!492512 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1099708 () Bool)

(assert (=> b!1099708 (= e!627684 (not call!46026))))

(declare-fun b!1099709 () Bool)

(declare-fun res!733859 () Bool)

(declare-fun e!627675 () Bool)

(assert (=> b!1099709 (=> (not res!733859) (not e!627675))))

(assert (=> b!1099709 (= res!733859 e!627674)))

(declare-fun res!733856 () Bool)

(assert (=> b!1099709 (=> res!733856 e!627674)))

(assert (=> b!1099709 (= res!733856 (not e!627673))))

(declare-fun res!733860 () Bool)

(assert (=> b!1099709 (=> (not res!733860) (not e!627673))))

(assert (=> b!1099709 (= res!733860 (bvslt #b00000000000000000000000000000000 (size!34831 lt!492378)))))

(declare-fun b!1099710 () Bool)

(declare-fun e!627678 () Bool)

(assert (=> b!1099710 (= e!627678 (validKeyInArray!0 (select (arr!34295 lt!492378) #b00000000000000000000000000000000)))))

(declare-fun d!130527 () Bool)

(assert (=> d!130527 e!627675))

(declare-fun res!733857 () Bool)

(assert (=> d!130527 (=> (not res!733857) (not e!627675))))

(assert (=> d!130527 (= res!733857 (or (bvsge #b00000000000000000000000000000000 (size!34831 lt!492378)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34831 lt!492378)))))))

(declare-fun lt!492519 () ListLongMap!15305)

(assert (=> d!130527 (= lt!492512 lt!492519)))

(declare-fun lt!492504 () Unit!36156)

(declare-fun e!627672 () Unit!36156)

(assert (=> d!130527 (= lt!492504 e!627672)))

(declare-fun c!108641 () Bool)

(assert (=> d!130527 (= c!108641 e!627678)))

(declare-fun res!733854 () Bool)

(assert (=> d!130527 (=> (not res!733854) (not e!627678))))

(assert (=> d!130527 (= res!733854 (bvslt #b00000000000000000000000000000000 (size!34831 lt!492378)))))

(assert (=> d!130527 (= lt!492519 e!627680)))

(assert (=> d!130527 (= c!108644 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130527 (validMask!0 mask!1414)))

(assert (=> d!130527 (= (getCurrentListMap!4382 lt!492378 lt!492372 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492512)))

(declare-fun bm!46020 () Bool)

(assert (=> bm!46020 (= call!46026 (contains!6393 lt!492512 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!46024 () Bool)

(assert (=> bm!46024 (= call!46025 (getCurrentListMapNoExtraKeys!4178 lt!492378 lt!492372 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1099711 () Bool)

(assert (=> b!1099711 (= e!627680 (+!3376 call!46023 (tuple2!17337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1099712 () Bool)

(declare-fun res!733855 () Bool)

(assert (=> b!1099712 (=> (not res!733855) (not e!627675))))

(assert (=> b!1099712 (= res!733855 e!627681)))

(declare-fun c!108639 () Bool)

(assert (=> b!1099712 (= c!108639 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1099713 () Bool)

(assert (=> b!1099713 (= e!627676 (= (apply!948 lt!492512 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun bm!46025 () Bool)

(assert (=> bm!46025 (= call!46029 call!46024)))

(declare-fun b!1099714 () Bool)

(assert (=> b!1099714 (= e!627682 (= (apply!948 lt!492512 (select (arr!34295 lt!492378) #b00000000000000000000000000000000)) (get!17634 (select (arr!34296 lt!492372) #b00000000000000000000000000000000) (dynLambda!2313 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1099714 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34832 lt!492372)))))

(assert (=> b!1099714 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34831 lt!492378)))))

(declare-fun b!1099715 () Bool)

(declare-fun lt!492518 () Unit!36156)

(assert (=> b!1099715 (= e!627672 lt!492518)))

(declare-fun lt!492505 () ListLongMap!15305)

(assert (=> b!1099715 (= lt!492505 (getCurrentListMapNoExtraKeys!4178 lt!492378 lt!492372 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492515 () (_ BitVec 64))

(assert (=> b!1099715 (= lt!492515 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492514 () (_ BitVec 64))

(assert (=> b!1099715 (= lt!492514 (select (arr!34295 lt!492378) #b00000000000000000000000000000000))))

(declare-fun lt!492511 () Unit!36156)

(assert (=> b!1099715 (= lt!492511 (addStillContains!661 lt!492505 lt!492515 zeroValue!831 lt!492514))))

(assert (=> b!1099715 (contains!6393 (+!3376 lt!492505 (tuple2!17337 lt!492515 zeroValue!831)) lt!492514)))

(declare-fun lt!492523 () Unit!36156)

(assert (=> b!1099715 (= lt!492523 lt!492511)))

(declare-fun lt!492510 () ListLongMap!15305)

(assert (=> b!1099715 (= lt!492510 (getCurrentListMapNoExtraKeys!4178 lt!492378 lt!492372 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492507 () (_ BitVec 64))

(assert (=> b!1099715 (= lt!492507 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492521 () (_ BitVec 64))

(assert (=> b!1099715 (= lt!492521 (select (arr!34295 lt!492378) #b00000000000000000000000000000000))))

(declare-fun lt!492513 () Unit!36156)

(assert (=> b!1099715 (= lt!492513 (addApplyDifferent!521 lt!492510 lt!492507 minValue!831 lt!492521))))

(assert (=> b!1099715 (= (apply!948 (+!3376 lt!492510 (tuple2!17337 lt!492507 minValue!831)) lt!492521) (apply!948 lt!492510 lt!492521))))

(declare-fun lt!492517 () Unit!36156)

(assert (=> b!1099715 (= lt!492517 lt!492513)))

(declare-fun lt!492502 () ListLongMap!15305)

(assert (=> b!1099715 (= lt!492502 (getCurrentListMapNoExtraKeys!4178 lt!492378 lt!492372 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492522 () (_ BitVec 64))

(assert (=> b!1099715 (= lt!492522 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492516 () (_ BitVec 64))

(assert (=> b!1099715 (= lt!492516 (select (arr!34295 lt!492378) #b00000000000000000000000000000000))))

(declare-fun lt!492503 () Unit!36156)

(assert (=> b!1099715 (= lt!492503 (addApplyDifferent!521 lt!492502 lt!492522 zeroValue!831 lt!492516))))

(assert (=> b!1099715 (= (apply!948 (+!3376 lt!492502 (tuple2!17337 lt!492522 zeroValue!831)) lt!492516) (apply!948 lt!492502 lt!492516))))

(declare-fun lt!492506 () Unit!36156)

(assert (=> b!1099715 (= lt!492506 lt!492503)))

(declare-fun lt!492520 () ListLongMap!15305)

(assert (=> b!1099715 (= lt!492520 (getCurrentListMapNoExtraKeys!4178 lt!492378 lt!492372 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492508 () (_ BitVec 64))

(assert (=> b!1099715 (= lt!492508 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492509 () (_ BitVec 64))

(assert (=> b!1099715 (= lt!492509 (select (arr!34295 lt!492378) #b00000000000000000000000000000000))))

(assert (=> b!1099715 (= lt!492518 (addApplyDifferent!521 lt!492520 lt!492508 minValue!831 lt!492509))))

(assert (=> b!1099715 (= (apply!948 (+!3376 lt!492520 (tuple2!17337 lt!492508 minValue!831)) lt!492509) (apply!948 lt!492520 lt!492509))))

(declare-fun b!1099716 () Bool)

(declare-fun Unit!36159 () Unit!36156)

(assert (=> b!1099716 (= e!627672 Unit!36159)))

(declare-fun b!1099717 () Bool)

(assert (=> b!1099717 (= e!627683 call!46027)))

(declare-fun b!1099718 () Bool)

(assert (=> b!1099718 (= e!627675 e!627684)))

(declare-fun c!108643 () Bool)

(assert (=> b!1099718 (= c!108643 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1099719 () Bool)

(assert (=> b!1099719 (= e!627681 (not call!46028))))

(declare-fun b!1099720 () Bool)

(declare-fun c!108642 () Bool)

(assert (=> b!1099720 (= c!108642 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!627679 () ListLongMap!15305)

(assert (=> b!1099720 (= e!627683 e!627679)))

(declare-fun b!1099721 () Bool)

(assert (=> b!1099721 (= e!627679 call!46027)))

(declare-fun b!1099722 () Bool)

(assert (=> b!1099722 (= e!627679 call!46029)))

(declare-fun bm!46026 () Bool)

(assert (=> bm!46026 (= call!46024 call!46025)))

(assert (= (and d!130527 c!108644) b!1099711))

(assert (= (and d!130527 (not c!108644)) b!1099707))

(assert (= (and b!1099707 c!108640) b!1099717))

(assert (= (and b!1099707 (not c!108640)) b!1099720))

(assert (= (and b!1099720 c!108642) b!1099721))

(assert (= (and b!1099720 (not c!108642)) b!1099722))

(assert (= (or b!1099721 b!1099722) bm!46025))

(assert (= (or b!1099717 bm!46025) bm!46026))

(assert (= (or b!1099717 b!1099721) bm!46021))

(assert (= (or b!1099711 bm!46026) bm!46024))

(assert (= (or b!1099711 bm!46021) bm!46022))

(assert (= (and d!130527 res!733854) b!1099710))

(assert (= (and d!130527 c!108641) b!1099715))

(assert (= (and d!130527 (not c!108641)) b!1099716))

(assert (= (and d!130527 res!733857) b!1099709))

(assert (= (and b!1099709 res!733860) b!1099702))

(assert (= (and b!1099709 (not res!733856)) b!1099705))

(assert (= (and b!1099705 res!733853) b!1099714))

(assert (= (and b!1099709 res!733859) b!1099712))

(assert (= (and b!1099712 c!108639) b!1099703))

(assert (= (and b!1099712 (not c!108639)) b!1099719))

(assert (= (and b!1099703 res!733861) b!1099706))

(assert (= (or b!1099703 b!1099719) bm!46023))

(assert (= (and b!1099712 res!733855) b!1099718))

(assert (= (and b!1099718 c!108643) b!1099704))

(assert (= (and b!1099718 (not c!108643)) b!1099708))

(assert (= (and b!1099704 res!733858) b!1099713))

(assert (= (or b!1099704 b!1099708) bm!46020))

(declare-fun b_lambda!17937 () Bool)

(assert (=> (not b_lambda!17937) (not b!1099714)))

(assert (=> b!1099714 t!34120))

(declare-fun b_and!36985 () Bool)

(assert (= b_and!36983 (and (=> t!34120 result!16507) b_and!36985)))

(declare-fun m!1019713 () Bool)

(assert (=> b!1099715 m!1019713))

(declare-fun m!1019715 () Bool)

(assert (=> b!1099715 m!1019715))

(declare-fun m!1019717 () Bool)

(assert (=> b!1099715 m!1019717))

(assert (=> b!1099715 m!1019527))

(assert (=> b!1099715 m!1019717))

(declare-fun m!1019719 () Bool)

(assert (=> b!1099715 m!1019719))

(declare-fun m!1019721 () Bool)

(assert (=> b!1099715 m!1019721))

(declare-fun m!1019723 () Bool)

(assert (=> b!1099715 m!1019723))

(assert (=> b!1099715 m!1019613))

(declare-fun m!1019725 () Bool)

(assert (=> b!1099715 m!1019725))

(declare-fun m!1019727 () Bool)

(assert (=> b!1099715 m!1019727))

(declare-fun m!1019729 () Bool)

(assert (=> b!1099715 m!1019729))

(assert (=> b!1099715 m!1019725))

(declare-fun m!1019731 () Bool)

(assert (=> b!1099715 m!1019731))

(declare-fun m!1019733 () Bool)

(assert (=> b!1099715 m!1019733))

(declare-fun m!1019735 () Bool)

(assert (=> b!1099715 m!1019735))

(declare-fun m!1019737 () Bool)

(assert (=> b!1099715 m!1019737))

(declare-fun m!1019739 () Bool)

(assert (=> b!1099715 m!1019739))

(assert (=> b!1099715 m!1019733))

(declare-fun m!1019741 () Bool)

(assert (=> b!1099715 m!1019741))

(assert (=> b!1099715 m!1019735))

(declare-fun m!1019743 () Bool)

(assert (=> bm!46022 m!1019743))

(assert (=> b!1099702 m!1019613))

(assert (=> b!1099702 m!1019613))

(assert (=> b!1099702 m!1019623))

(declare-fun m!1019745 () Bool)

(assert (=> bm!46023 m!1019745))

(assert (=> b!1099705 m!1019613))

(assert (=> b!1099705 m!1019613))

(declare-fun m!1019747 () Bool)

(assert (=> b!1099705 m!1019747))

(assert (=> bm!46024 m!1019527))

(declare-fun m!1019749 () Bool)

(assert (=> bm!46020 m!1019749))

(assert (=> b!1099714 m!1019525))

(declare-fun m!1019751 () Bool)

(assert (=> b!1099714 m!1019751))

(assert (=> b!1099714 m!1019525))

(declare-fun m!1019753 () Bool)

(assert (=> b!1099714 m!1019753))

(assert (=> b!1099714 m!1019613))

(assert (=> b!1099714 m!1019613))

(declare-fun m!1019755 () Bool)

(assert (=> b!1099714 m!1019755))

(assert (=> b!1099714 m!1019751))

(assert (=> d!130527 m!1019559))

(assert (=> b!1099710 m!1019613))

(assert (=> b!1099710 m!1019613))

(assert (=> b!1099710 m!1019623))

(declare-fun m!1019757 () Bool)

(assert (=> b!1099713 m!1019757))

(declare-fun m!1019759 () Bool)

(assert (=> b!1099706 m!1019759))

(declare-fun m!1019761 () Bool)

(assert (=> b!1099711 m!1019761))

(assert (=> b!1099537 d!130527))

(declare-fun d!130529 () Bool)

(declare-fun e!627703 () Bool)

(assert (=> d!130529 e!627703))

(declare-fun res!733871 () Bool)

(assert (=> d!130529 (=> (not res!733871) (not e!627703))))

(declare-fun lt!492544 () ListLongMap!15305)

(assert (=> d!130529 (= res!733871 (not (contains!6393 lt!492544 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!627702 () ListLongMap!15305)

(assert (=> d!130529 (= lt!492544 e!627702)))

(declare-fun c!108654 () Bool)

(assert (=> d!130529 (= c!108654 (bvsge #b00000000000000000000000000000000 (size!34831 lt!492378)))))

(assert (=> d!130529 (validMask!0 mask!1414)))

(assert (=> d!130529 (= (getCurrentListMapNoExtraKeys!4178 lt!492378 lt!492372 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492544)))

(declare-fun b!1099747 () Bool)

(declare-fun e!627701 () Bool)

(declare-fun e!627704 () Bool)

(assert (=> b!1099747 (= e!627701 e!627704)))

(declare-fun c!108653 () Bool)

(assert (=> b!1099747 (= c!108653 (bvslt #b00000000000000000000000000000000 (size!34831 lt!492378)))))

(declare-fun b!1099748 () Bool)

(assert (=> b!1099748 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34831 lt!492378)))))

(assert (=> b!1099748 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34832 lt!492372)))))

(declare-fun e!627700 () Bool)

(assert (=> b!1099748 (= e!627700 (= (apply!948 lt!492544 (select (arr!34295 lt!492378) #b00000000000000000000000000000000)) (get!17634 (select (arr!34296 lt!492372) #b00000000000000000000000000000000) (dynLambda!2313 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun call!46032 () ListLongMap!15305)

(declare-fun bm!46029 () Bool)

(assert (=> bm!46029 (= call!46032 (getCurrentListMapNoExtraKeys!4178 lt!492378 lt!492372 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1099749 () Bool)

(declare-fun e!627699 () ListLongMap!15305)

(assert (=> b!1099749 (= e!627702 e!627699)))

(declare-fun c!108655 () Bool)

(assert (=> b!1099749 (= c!108655 (validKeyInArray!0 (select (arr!34295 lt!492378) #b00000000000000000000000000000000)))))

(declare-fun b!1099750 () Bool)

(declare-fun res!733870 () Bool)

(assert (=> b!1099750 (=> (not res!733870) (not e!627703))))

(assert (=> b!1099750 (= res!733870 (not (contains!6393 lt!492544 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1099751 () Bool)

(assert (=> b!1099751 (= e!627701 e!627700)))

(assert (=> b!1099751 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34831 lt!492378)))))

(declare-fun res!733873 () Bool)

(assert (=> b!1099751 (= res!733873 (contains!6393 lt!492544 (select (arr!34295 lt!492378) #b00000000000000000000000000000000)))))

(assert (=> b!1099751 (=> (not res!733873) (not e!627700))))

(declare-fun b!1099752 () Bool)

(declare-fun lt!492539 () Unit!36156)

(declare-fun lt!492542 () Unit!36156)

(assert (=> b!1099752 (= lt!492539 lt!492542)))

(declare-fun lt!492543 () V!41355)

(declare-fun lt!492538 () (_ BitVec 64))

(declare-fun lt!492540 () (_ BitVec 64))

(declare-fun lt!492541 () ListLongMap!15305)

(assert (=> b!1099752 (not (contains!6393 (+!3376 lt!492541 (tuple2!17337 lt!492538 lt!492543)) lt!492540))))

(declare-fun addStillNotContains!276 (ListLongMap!15305 (_ BitVec 64) V!41355 (_ BitVec 64)) Unit!36156)

(assert (=> b!1099752 (= lt!492542 (addStillNotContains!276 lt!492541 lt!492538 lt!492543 lt!492540))))

(assert (=> b!1099752 (= lt!492540 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1099752 (= lt!492543 (get!17634 (select (arr!34296 lt!492372) #b00000000000000000000000000000000) (dynLambda!2313 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1099752 (= lt!492538 (select (arr!34295 lt!492378) #b00000000000000000000000000000000))))

(assert (=> b!1099752 (= lt!492541 call!46032)))

(assert (=> b!1099752 (= e!627699 (+!3376 call!46032 (tuple2!17337 (select (arr!34295 lt!492378) #b00000000000000000000000000000000) (get!17634 (select (arr!34296 lt!492372) #b00000000000000000000000000000000) (dynLambda!2313 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1099753 () Bool)

(declare-fun isEmpty!966 (ListLongMap!15305) Bool)

(assert (=> b!1099753 (= e!627704 (isEmpty!966 lt!492544))))

(declare-fun b!1099754 () Bool)

(assert (=> b!1099754 (= e!627699 call!46032)))

(declare-fun b!1099755 () Bool)

(assert (=> b!1099755 (= e!627704 (= lt!492544 (getCurrentListMapNoExtraKeys!4178 lt!492378 lt!492372 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1099756 () Bool)

(assert (=> b!1099756 (= e!627703 e!627701)))

(declare-fun c!108656 () Bool)

(declare-fun e!627705 () Bool)

(assert (=> b!1099756 (= c!108656 e!627705)))

(declare-fun res!733872 () Bool)

(assert (=> b!1099756 (=> (not res!733872) (not e!627705))))

(assert (=> b!1099756 (= res!733872 (bvslt #b00000000000000000000000000000000 (size!34831 lt!492378)))))

(declare-fun b!1099757 () Bool)

(assert (=> b!1099757 (= e!627705 (validKeyInArray!0 (select (arr!34295 lt!492378) #b00000000000000000000000000000000)))))

(assert (=> b!1099757 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1099758 () Bool)

(assert (=> b!1099758 (= e!627702 (ListLongMap!15306 Nil!23951))))

(assert (= (and d!130529 c!108654) b!1099758))

(assert (= (and d!130529 (not c!108654)) b!1099749))

(assert (= (and b!1099749 c!108655) b!1099752))

(assert (= (and b!1099749 (not c!108655)) b!1099754))

(assert (= (or b!1099752 b!1099754) bm!46029))

(assert (= (and d!130529 res!733871) b!1099750))

(assert (= (and b!1099750 res!733870) b!1099756))

(assert (= (and b!1099756 res!733872) b!1099757))

(assert (= (and b!1099756 c!108656) b!1099751))

(assert (= (and b!1099756 (not c!108656)) b!1099747))

(assert (= (and b!1099751 res!733873) b!1099748))

(assert (= (and b!1099747 c!108653) b!1099755))

(assert (= (and b!1099747 (not c!108653)) b!1099753))

(declare-fun b_lambda!17939 () Bool)

(assert (=> (not b_lambda!17939) (not b!1099748)))

(assert (=> b!1099748 t!34120))

(declare-fun b_and!36987 () Bool)

(assert (= b_and!36985 (and (=> t!34120 result!16507) b_and!36987)))

(declare-fun b_lambda!17941 () Bool)

(assert (=> (not b_lambda!17941) (not b!1099752)))

(assert (=> b!1099752 t!34120))

(declare-fun b_and!36989 () Bool)

(assert (= b_and!36987 (and (=> t!34120 result!16507) b_and!36989)))

(assert (=> b!1099749 m!1019613))

(assert (=> b!1099749 m!1019613))

(assert (=> b!1099749 m!1019623))

(declare-fun m!1019763 () Bool)

(assert (=> b!1099753 m!1019763))

(assert (=> b!1099757 m!1019613))

(assert (=> b!1099757 m!1019613))

(assert (=> b!1099757 m!1019623))

(declare-fun m!1019765 () Bool)

(assert (=> b!1099755 m!1019765))

(declare-fun m!1019767 () Bool)

(assert (=> b!1099752 m!1019767))

(declare-fun m!1019769 () Bool)

(assert (=> b!1099752 m!1019769))

(declare-fun m!1019771 () Bool)

(assert (=> b!1099752 m!1019771))

(declare-fun m!1019773 () Bool)

(assert (=> b!1099752 m!1019773))

(assert (=> b!1099752 m!1019767))

(assert (=> b!1099752 m!1019613))

(assert (=> b!1099752 m!1019751))

(assert (=> b!1099752 m!1019525))

(assert (=> b!1099752 m!1019751))

(assert (=> b!1099752 m!1019525))

(assert (=> b!1099752 m!1019753))

(declare-fun m!1019775 () Bool)

(assert (=> d!130529 m!1019775))

(assert (=> d!130529 m!1019559))

(declare-fun m!1019777 () Bool)

(assert (=> b!1099750 m!1019777))

(assert (=> b!1099748 m!1019613))

(declare-fun m!1019779 () Bool)

(assert (=> b!1099748 m!1019779))

(assert (=> b!1099748 m!1019613))

(assert (=> b!1099748 m!1019751))

(assert (=> b!1099748 m!1019525))

(assert (=> b!1099748 m!1019751))

(assert (=> b!1099748 m!1019525))

(assert (=> b!1099748 m!1019753))

(assert (=> bm!46029 m!1019765))

(assert (=> b!1099751 m!1019613))

(assert (=> b!1099751 m!1019613))

(declare-fun m!1019781 () Bool)

(assert (=> b!1099751 m!1019781))

(assert (=> b!1099537 d!130529))

(declare-fun call!46038 () ListLongMap!15305)

(declare-fun bm!46034 () Bool)

(assert (=> bm!46034 (= call!46038 (getCurrentListMapNoExtraKeys!4178 (array!71258 (store (arr!34295 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34831 _keys!1070)) (array!71260 (store (arr!34296 _values!874) i!650 (ValueCellFull!12876 (dynLambda!2313 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34832 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun e!627710 () Bool)

(declare-fun b!1099765 () Bool)

(declare-fun call!46037 () ListLongMap!15305)

(assert (=> b!1099765 (= e!627710 (= call!46038 (-!957 call!46037 k0!904)))))

(assert (=> b!1099765 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34832 _values!874)))))

(declare-fun d!130531 () Bool)

(declare-fun e!627711 () Bool)

(assert (=> d!130531 e!627711))

(declare-fun res!733876 () Bool)

(assert (=> d!130531 (=> (not res!733876) (not e!627711))))

(assert (=> d!130531 (= res!733876 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34831 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34831 _keys!1070))))))))

(declare-fun lt!492547 () Unit!36156)

(declare-fun choose!1767 (array!71257 array!71259 (_ BitVec 32) (_ BitVec 32) V!41355 V!41355 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36156)

(assert (=> d!130531 (= lt!492547 (choose!1767 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130531 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34831 _keys!1070)))))

(assert (=> d!130531 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!208 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!492547)))

(declare-fun bm!46035 () Bool)

(assert (=> bm!46035 (= call!46037 (getCurrentListMapNoExtraKeys!4178 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1099766 () Bool)

(assert (=> b!1099766 (= e!627711 e!627710)))

(declare-fun c!108659 () Bool)

(assert (=> b!1099766 (= c!108659 (bvsle #b00000000000000000000000000000000 i!650))))

(declare-fun b!1099767 () Bool)

(assert (=> b!1099767 (= e!627710 (= call!46038 call!46037))))

(assert (=> b!1099767 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34832 _values!874)))))

(assert (= (and d!130531 res!733876) b!1099766))

(assert (= (and b!1099766 c!108659) b!1099765))

(assert (= (and b!1099766 (not c!108659)) b!1099767))

(assert (= (or b!1099765 b!1099767) bm!46035))

(assert (= (or b!1099765 b!1099767) bm!46034))

(declare-fun b_lambda!17943 () Bool)

(assert (=> (not b_lambda!17943) (not bm!46034)))

(assert (=> bm!46034 t!34120))

(declare-fun b_and!36991 () Bool)

(assert (= b_and!36989 (and (=> t!34120 result!16507) b_and!36991)))

(assert (=> bm!46034 m!1019523))

(assert (=> bm!46034 m!1019525))

(assert (=> bm!46034 m!1019531))

(declare-fun m!1019783 () Bool)

(assert (=> bm!46034 m!1019783))

(declare-fun m!1019785 () Bool)

(assert (=> b!1099765 m!1019785))

(declare-fun m!1019787 () Bool)

(assert (=> d!130531 m!1019787))

(assert (=> bm!46035 m!1019539))

(assert (=> b!1099537 d!130531))

(declare-fun d!130533 () Bool)

(declare-fun lt!492550 () ListLongMap!15305)

(assert (=> d!130533 (not (contains!6393 lt!492550 k0!904))))

(declare-fun removeStrictlySorted!82 (List!23954 (_ BitVec 64)) List!23954)

(assert (=> d!130533 (= lt!492550 (ListLongMap!15306 (removeStrictlySorted!82 (toList!7668 lt!492380) k0!904)))))

(assert (=> d!130533 (= (-!957 lt!492380 k0!904) lt!492550)))

(declare-fun bs!32293 () Bool)

(assert (= bs!32293 d!130533))

(declare-fun m!1019789 () Bool)

(assert (=> bs!32293 m!1019789))

(declare-fun m!1019791 () Bool)

(assert (=> bs!32293 m!1019791))

(assert (=> b!1099537 d!130533))

(declare-fun d!130535 () Bool)

(declare-fun e!627716 () Bool)

(assert (=> d!130535 e!627716))

(declare-fun res!733878 () Bool)

(assert (=> d!130535 (=> (not res!733878) (not e!627716))))

(declare-fun lt!492557 () ListLongMap!15305)

(assert (=> d!130535 (= res!733878 (not (contains!6393 lt!492557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!627715 () ListLongMap!15305)

(assert (=> d!130535 (= lt!492557 e!627715)))

(declare-fun c!108661 () Bool)

(assert (=> d!130535 (= c!108661 (bvsge #b00000000000000000000000000000000 (size!34831 _keys!1070)))))

(assert (=> d!130535 (validMask!0 mask!1414)))

(assert (=> d!130535 (= (getCurrentListMapNoExtraKeys!4178 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492557)))

(declare-fun b!1099768 () Bool)

(declare-fun e!627714 () Bool)

(declare-fun e!627717 () Bool)

(assert (=> b!1099768 (= e!627714 e!627717)))

(declare-fun c!108660 () Bool)

(assert (=> b!1099768 (= c!108660 (bvslt #b00000000000000000000000000000000 (size!34831 _keys!1070)))))

(declare-fun b!1099769 () Bool)

(assert (=> b!1099769 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34831 _keys!1070)))))

(assert (=> b!1099769 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34832 _values!874)))))

(declare-fun e!627713 () Bool)

(assert (=> b!1099769 (= e!627713 (= (apply!948 lt!492557 (select (arr!34295 _keys!1070) #b00000000000000000000000000000000)) (get!17634 (select (arr!34296 _values!874) #b00000000000000000000000000000000) (dynLambda!2313 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!46036 () Bool)

(declare-fun call!46039 () ListLongMap!15305)

(assert (=> bm!46036 (= call!46039 (getCurrentListMapNoExtraKeys!4178 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1099770 () Bool)

(declare-fun e!627712 () ListLongMap!15305)

(assert (=> b!1099770 (= e!627715 e!627712)))

(declare-fun c!108662 () Bool)

(assert (=> b!1099770 (= c!108662 (validKeyInArray!0 (select (arr!34295 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1099771 () Bool)

(declare-fun res!733877 () Bool)

(assert (=> b!1099771 (=> (not res!733877) (not e!627716))))

(assert (=> b!1099771 (= res!733877 (not (contains!6393 lt!492557 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1099772 () Bool)

(assert (=> b!1099772 (= e!627714 e!627713)))

(assert (=> b!1099772 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34831 _keys!1070)))))

(declare-fun res!733880 () Bool)

(assert (=> b!1099772 (= res!733880 (contains!6393 lt!492557 (select (arr!34295 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1099772 (=> (not res!733880) (not e!627713))))

(declare-fun b!1099773 () Bool)

(declare-fun lt!492552 () Unit!36156)

(declare-fun lt!492555 () Unit!36156)

(assert (=> b!1099773 (= lt!492552 lt!492555)))

(declare-fun lt!492554 () ListLongMap!15305)

(declare-fun lt!492551 () (_ BitVec 64))

(declare-fun lt!492556 () V!41355)

(declare-fun lt!492553 () (_ BitVec 64))

(assert (=> b!1099773 (not (contains!6393 (+!3376 lt!492554 (tuple2!17337 lt!492551 lt!492556)) lt!492553))))

(assert (=> b!1099773 (= lt!492555 (addStillNotContains!276 lt!492554 lt!492551 lt!492556 lt!492553))))

(assert (=> b!1099773 (= lt!492553 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1099773 (= lt!492556 (get!17634 (select (arr!34296 _values!874) #b00000000000000000000000000000000) (dynLambda!2313 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1099773 (= lt!492551 (select (arr!34295 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1099773 (= lt!492554 call!46039)))

(assert (=> b!1099773 (= e!627712 (+!3376 call!46039 (tuple2!17337 (select (arr!34295 _keys!1070) #b00000000000000000000000000000000) (get!17634 (select (arr!34296 _values!874) #b00000000000000000000000000000000) (dynLambda!2313 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1099774 () Bool)

(assert (=> b!1099774 (= e!627717 (isEmpty!966 lt!492557))))

(declare-fun b!1099775 () Bool)

(assert (=> b!1099775 (= e!627712 call!46039)))

(declare-fun b!1099776 () Bool)

(assert (=> b!1099776 (= e!627717 (= lt!492557 (getCurrentListMapNoExtraKeys!4178 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1099777 () Bool)

(assert (=> b!1099777 (= e!627716 e!627714)))

(declare-fun c!108663 () Bool)

(declare-fun e!627718 () Bool)

(assert (=> b!1099777 (= c!108663 e!627718)))

(declare-fun res!733879 () Bool)

(assert (=> b!1099777 (=> (not res!733879) (not e!627718))))

(assert (=> b!1099777 (= res!733879 (bvslt #b00000000000000000000000000000000 (size!34831 _keys!1070)))))

(declare-fun b!1099778 () Bool)

(assert (=> b!1099778 (= e!627718 (validKeyInArray!0 (select (arr!34295 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1099778 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1099779 () Bool)

(assert (=> b!1099779 (= e!627715 (ListLongMap!15306 Nil!23951))))

(assert (= (and d!130535 c!108661) b!1099779))

(assert (= (and d!130535 (not c!108661)) b!1099770))

(assert (= (and b!1099770 c!108662) b!1099773))

(assert (= (and b!1099770 (not c!108662)) b!1099775))

(assert (= (or b!1099773 b!1099775) bm!46036))

(assert (= (and d!130535 res!733878) b!1099771))

(assert (= (and b!1099771 res!733877) b!1099777))

(assert (= (and b!1099777 res!733879) b!1099778))

(assert (= (and b!1099777 c!108663) b!1099772))

(assert (= (and b!1099777 (not c!108663)) b!1099768))

(assert (= (and b!1099772 res!733880) b!1099769))

(assert (= (and b!1099768 c!108660) b!1099776))

(assert (= (and b!1099768 (not c!108660)) b!1099774))

(declare-fun b_lambda!17945 () Bool)

(assert (=> (not b_lambda!17945) (not b!1099769)))

(assert (=> b!1099769 t!34120))

(declare-fun b_and!36993 () Bool)

(assert (= b_and!36991 (and (=> t!34120 result!16507) b_and!36993)))

(declare-fun b_lambda!17947 () Bool)

(assert (=> (not b_lambda!17947) (not b!1099773)))

(assert (=> b!1099773 t!34120))

(declare-fun b_and!36995 () Bool)

(assert (= b_and!36993 (and (=> t!34120 result!16507) b_and!36995)))

(assert (=> b!1099770 m!1019653))

(assert (=> b!1099770 m!1019653))

(assert (=> b!1099770 m!1019657))

(declare-fun m!1019793 () Bool)

(assert (=> b!1099774 m!1019793))

(assert (=> b!1099778 m!1019653))

(assert (=> b!1099778 m!1019653))

(assert (=> b!1099778 m!1019657))

(declare-fun m!1019795 () Bool)

(assert (=> b!1099776 m!1019795))

(declare-fun m!1019797 () Bool)

(assert (=> b!1099773 m!1019797))

(declare-fun m!1019799 () Bool)

(assert (=> b!1099773 m!1019799))

(declare-fun m!1019801 () Bool)

(assert (=> b!1099773 m!1019801))

(declare-fun m!1019803 () Bool)

(assert (=> b!1099773 m!1019803))

(assert (=> b!1099773 m!1019797))

(assert (=> b!1099773 m!1019653))

(assert (=> b!1099773 m!1019701))

(assert (=> b!1099773 m!1019525))

(assert (=> b!1099773 m!1019701))

(assert (=> b!1099773 m!1019525))

(assert (=> b!1099773 m!1019703))

(declare-fun m!1019805 () Bool)

(assert (=> d!130535 m!1019805))

(assert (=> d!130535 m!1019559))

(declare-fun m!1019807 () Bool)

(assert (=> b!1099771 m!1019807))

(assert (=> b!1099769 m!1019653))

(declare-fun m!1019809 () Bool)

(assert (=> b!1099769 m!1019809))

(assert (=> b!1099769 m!1019653))

(assert (=> b!1099769 m!1019701))

(assert (=> b!1099769 m!1019525))

(assert (=> b!1099769 m!1019701))

(assert (=> b!1099769 m!1019525))

(assert (=> b!1099769 m!1019703))

(assert (=> bm!46036 m!1019795))

(assert (=> b!1099772 m!1019653))

(assert (=> b!1099772 m!1019653))

(declare-fun m!1019811 () Bool)

(assert (=> b!1099772 m!1019811))

(assert (=> b!1099537 d!130535))

(declare-fun d!130537 () Bool)

(assert (=> d!130537 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!492560 () Unit!36156)

(declare-fun choose!13 (array!71257 (_ BitVec 64) (_ BitVec 32)) Unit!36156)

(assert (=> d!130537 (= lt!492560 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130537 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130537 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!492560)))

(declare-fun bs!32294 () Bool)

(assert (= bs!32294 d!130537))

(assert (=> bs!32294 m!1019533))

(declare-fun m!1019813 () Bool)

(assert (=> bs!32294 m!1019813))

(assert (=> b!1099537 d!130537))

(declare-fun d!130539 () Bool)

(declare-fun res!733881 () Bool)

(declare-fun e!627720 () Bool)

(assert (=> d!130539 (=> res!733881 e!627720)))

(assert (=> d!130539 (= res!733881 (bvsge #b00000000000000000000000000000000 (size!34831 _keys!1070)))))

(assert (=> d!130539 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!627720)))

(declare-fun b!1099780 () Bool)

(declare-fun e!627721 () Bool)

(declare-fun e!627719 () Bool)

(assert (=> b!1099780 (= e!627721 e!627719)))

(declare-fun lt!492561 () (_ BitVec 64))

(assert (=> b!1099780 (= lt!492561 (select (arr!34295 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492563 () Unit!36156)

(assert (=> b!1099780 (= lt!492563 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!492561 #b00000000000000000000000000000000))))

(assert (=> b!1099780 (arrayContainsKey!0 _keys!1070 lt!492561 #b00000000000000000000000000000000)))

(declare-fun lt!492562 () Unit!36156)

(assert (=> b!1099780 (= lt!492562 lt!492563)))

(declare-fun res!733882 () Bool)

(assert (=> b!1099780 (= res!733882 (= (seekEntryOrOpen!0 (select (arr!34295 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9911 #b00000000000000000000000000000000)))))

(assert (=> b!1099780 (=> (not res!733882) (not e!627719))))

(declare-fun bm!46037 () Bool)

(declare-fun call!46040 () Bool)

(assert (=> bm!46037 (= call!46040 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1099781 () Bool)

(assert (=> b!1099781 (= e!627720 e!627721)))

(declare-fun c!108664 () Bool)

(assert (=> b!1099781 (= c!108664 (validKeyInArray!0 (select (arr!34295 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1099782 () Bool)

(assert (=> b!1099782 (= e!627721 call!46040)))

(declare-fun b!1099783 () Bool)

(assert (=> b!1099783 (= e!627719 call!46040)))

(assert (= (and d!130539 (not res!733881)) b!1099781))

(assert (= (and b!1099781 c!108664) b!1099780))

(assert (= (and b!1099781 (not c!108664)) b!1099782))

(assert (= (and b!1099780 res!733882) b!1099783))

(assert (= (or b!1099783 b!1099782) bm!46037))

(assert (=> b!1099780 m!1019653))

(declare-fun m!1019815 () Bool)

(assert (=> b!1099780 m!1019815))

(declare-fun m!1019817 () Bool)

(assert (=> b!1099780 m!1019817))

(assert (=> b!1099780 m!1019653))

(declare-fun m!1019819 () Bool)

(assert (=> b!1099780 m!1019819))

(declare-fun m!1019821 () Bool)

(assert (=> bm!46037 m!1019821))

(assert (=> b!1099781 m!1019653))

(assert (=> b!1099781 m!1019653))

(assert (=> b!1099781 m!1019657))

(assert (=> b!1099547 d!130539))

(declare-fun d!130541 () Bool)

(assert (=> d!130541 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96674 d!130541))

(declare-fun d!130543 () Bool)

(assert (=> d!130543 (= (array_inv!26418 _keys!1070) (bvsge (size!34831 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96674 d!130543))

(declare-fun d!130545 () Bool)

(assert (=> d!130545 (= (array_inv!26419 _values!874) (bvsge (size!34832 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96674 d!130545))

(declare-fun d!130547 () Bool)

(assert (=> d!130547 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1099541 d!130547))

(declare-fun condMapEmpty!42538 () Bool)

(declare-fun mapDefault!42538 () ValueCell!12876)

(assert (=> mapNonEmpty!42532 (= condMapEmpty!42538 (= mapRest!42532 ((as const (Array (_ BitVec 32) ValueCell!12876)) mapDefault!42538)))))

(declare-fun e!627726 () Bool)

(declare-fun mapRes!42538 () Bool)

(assert (=> mapNonEmpty!42532 (= tp!81304 (and e!627726 mapRes!42538))))

(declare-fun b!1099791 () Bool)

(assert (=> b!1099791 (= e!627726 tp_is_empty!27171)))

(declare-fun mapNonEmpty!42538 () Bool)

(declare-fun tp!81314 () Bool)

(declare-fun e!627727 () Bool)

(assert (=> mapNonEmpty!42538 (= mapRes!42538 (and tp!81314 e!627727))))

(declare-fun mapKey!42538 () (_ BitVec 32))

(declare-fun mapValue!42538 () ValueCell!12876)

(declare-fun mapRest!42538 () (Array (_ BitVec 32) ValueCell!12876))

(assert (=> mapNonEmpty!42538 (= mapRest!42532 (store mapRest!42538 mapKey!42538 mapValue!42538))))

(declare-fun mapIsEmpty!42538 () Bool)

(assert (=> mapIsEmpty!42538 mapRes!42538))

(declare-fun b!1099790 () Bool)

(assert (=> b!1099790 (= e!627727 tp_is_empty!27171)))

(assert (= (and mapNonEmpty!42532 condMapEmpty!42538) mapIsEmpty!42538))

(assert (= (and mapNonEmpty!42532 (not condMapEmpty!42538)) mapNonEmpty!42538))

(assert (= (and mapNonEmpty!42538 ((_ is ValueCellFull!12876) mapValue!42538)) b!1099790))

(assert (= (and mapNonEmpty!42532 ((_ is ValueCellFull!12876) mapDefault!42538)) b!1099791))

(declare-fun m!1019823 () Bool)

(assert (=> mapNonEmpty!42538 m!1019823))

(declare-fun b_lambda!17949 () Bool)

(assert (= b_lambda!17937 (or (and start!96674 b_free!23121) b_lambda!17949)))

(declare-fun b_lambda!17951 () Bool)

(assert (= b_lambda!17947 (or (and start!96674 b_free!23121) b_lambda!17951)))

(declare-fun b_lambda!17953 () Bool)

(assert (= b_lambda!17939 (or (and start!96674 b_free!23121) b_lambda!17953)))

(declare-fun b_lambda!17955 () Bool)

(assert (= b_lambda!17943 (or (and start!96674 b_free!23121) b_lambda!17955)))

(declare-fun b_lambda!17957 () Bool)

(assert (= b_lambda!17945 (or (and start!96674 b_free!23121) b_lambda!17957)))

(declare-fun b_lambda!17959 () Bool)

(assert (= b_lambda!17935 (or (and start!96674 b_free!23121) b_lambda!17959)))

(declare-fun b_lambda!17961 () Bool)

(assert (= b_lambda!17941 (or (and start!96674 b_free!23121) b_lambda!17961)))

(check-sat (not b!1099776) (not b!1099601) (not b!1099773) (not bm!46020) (not b_next!23121) (not d!130535) (not b!1099684) (not b!1099750) (not bm!45997) (not b!1099631) (not b!1099702) (not d!130519) b_and!36995 (not b!1099757) (not b_lambda!17957) (not b!1099705) (not b_lambda!17953) (not b!1099771) (not b!1099749) (not b!1099751) (not bm!46013) (not b!1099770) (not b!1099685) (not b!1099618) (not bm!46035) (not b_lambda!17961) (not b!1099616) (not b!1099638) (not b!1099765) (not bm!46036) (not b!1099602) (not b!1099752) (not bm!46037) (not d!130531) (not bm!46023) (not b!1099781) (not b!1099689) (not bm!45994) (not b!1099627) (not b!1099706) (not d!130525) (not b!1099715) (not bm!46024) (not b!1099755) (not b!1099769) (not d!130517) (not b!1099690) (not bm!45998) (not b_lambda!17955) (not b!1099628) (not b!1099693) (not bm!46022) (not b_lambda!17949) (not b!1099629) (not bm!46029) (not bm!46015) (not mapNonEmpty!42538) (not b!1099772) (not b!1099774) (not b!1099748) (not b!1099713) (not b!1099714) (not d!130529) (not b!1099778) (not b!1099711) (not b!1099624) (not b!1099625) (not b!1099615) (not bm!46016) (not b!1099753) (not d!130533) (not d!130527) (not b_lambda!17933) (not b!1099681) (not b!1099694) (not d!130537) (not b!1099692) (not b!1099710) (not b!1099626) (not bm!46034) (not b!1099780) tp_is_empty!27171 (not b_lambda!17959) (not b_lambda!17951) (not bm!46017))
(check-sat b_and!36995 (not b_next!23121))
