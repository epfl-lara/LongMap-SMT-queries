; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34096 () Bool)

(assert start!34096)

(declare-fun b_free!7171 () Bool)

(declare-fun b_next!7171 () Bool)

(assert (=> start!34096 (= b_free!7171 (not b_next!7171))))

(declare-fun tp!25040 () Bool)

(declare-fun b_and!14381 () Bool)

(assert (=> start!34096 (= tp!25040 b_and!14381)))

(declare-fun b!339884 () Bool)

(declare-fun res!187763 () Bool)

(declare-fun e!208516 () Bool)

(assert (=> b!339884 (=> (not res!187763) (not e!208516))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339884 (= res!187763 (validKeyInArray!0 k0!1348))))

(declare-fun res!187762 () Bool)

(assert (=> start!34096 (=> (not res!187762) (not e!208516))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34096 (= res!187762 (validMask!0 mask!2385))))

(assert (=> start!34096 e!208516))

(assert (=> start!34096 true))

(declare-fun tp_is_empty!7123 () Bool)

(assert (=> start!34096 tp_is_empty!7123))

(assert (=> start!34096 tp!25040))

(declare-datatypes ((V!10475 0))(
  ( (V!10476 (val!3606 Int)) )
))
(declare-datatypes ((ValueCell!3218 0))(
  ( (ValueCellFull!3218 (v!5777 V!10475)) (EmptyCell!3218) )
))
(declare-datatypes ((array!17828 0))(
  ( (array!17829 (arr!8436 (Array (_ BitVec 32) ValueCell!3218)) (size!8788 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17828)

(declare-fun e!208515 () Bool)

(declare-fun array_inv!6252 (array!17828) Bool)

(assert (=> start!34096 (and (array_inv!6252 _values!1525) e!208515)))

(declare-datatypes ((array!17830 0))(
  ( (array!17831 (arr!8437 (Array (_ BitVec 32) (_ BitVec 64))) (size!8789 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17830)

(declare-fun array_inv!6253 (array!17830) Bool)

(assert (=> start!34096 (array_inv!6253 _keys!1895)))

(declare-fun mapIsEmpty!12105 () Bool)

(declare-fun mapRes!12105 () Bool)

(assert (=> mapIsEmpty!12105 mapRes!12105))

(declare-fun b!339885 () Bool)

(declare-fun res!187760 () Bool)

(assert (=> b!339885 (=> (not res!187760) (not e!208516))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!339885 (= res!187760 (and (= (size!8788 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8789 _keys!1895) (size!8788 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!339886 () Bool)

(declare-fun e!208517 () Bool)

(assert (=> b!339886 (= e!208517 tp_is_empty!7123)))

(declare-fun b!339887 () Bool)

(declare-fun res!187758 () Bool)

(assert (=> b!339887 (=> (not res!187758) (not e!208516))))

(declare-datatypes ((List!4752 0))(
  ( (Nil!4749) (Cons!4748 (h!5604 (_ BitVec 64)) (t!9848 List!4752)) )
))
(declare-fun arrayNoDuplicates!0 (array!17830 (_ BitVec 32) List!4752) Bool)

(assert (=> b!339887 (= res!187758 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4749))))

(declare-fun mapNonEmpty!12105 () Bool)

(declare-fun tp!25041 () Bool)

(declare-fun e!208514 () Bool)

(assert (=> mapNonEmpty!12105 (= mapRes!12105 (and tp!25041 e!208514))))

(declare-fun mapRest!12105 () (Array (_ BitVec 32) ValueCell!3218))

(declare-fun mapKey!12105 () (_ BitVec 32))

(declare-fun mapValue!12105 () ValueCell!3218)

(assert (=> mapNonEmpty!12105 (= (arr!8436 _values!1525) (store mapRest!12105 mapKey!12105 mapValue!12105))))

(declare-fun b!339888 () Bool)

(declare-fun res!187759 () Bool)

(assert (=> b!339888 (=> (not res!187759) (not e!208516))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17830 (_ BitVec 32)) Bool)

(assert (=> b!339888 (= res!187759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!339889 () Bool)

(assert (=> b!339889 (= e!208515 (and e!208517 mapRes!12105))))

(declare-fun condMapEmpty!12105 () Bool)

(declare-fun mapDefault!12105 () ValueCell!3218)

(assert (=> b!339889 (= condMapEmpty!12105 (= (arr!8436 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3218)) mapDefault!12105)))))

(declare-fun b!339890 () Bool)

(declare-fun res!187761 () Bool)

(assert (=> b!339890 (=> (not res!187761) (not e!208516))))

(declare-fun zeroValue!1467 () V!10475)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10475)

(declare-datatypes ((tuple2!5144 0))(
  ( (tuple2!5145 (_1!2583 (_ BitVec 64)) (_2!2583 V!10475)) )
))
(declare-datatypes ((List!4753 0))(
  ( (Nil!4750) (Cons!4749 (h!5605 tuple2!5144) (t!9849 List!4753)) )
))
(declare-datatypes ((ListLongMap!4059 0))(
  ( (ListLongMap!4060 (toList!2045 List!4753)) )
))
(declare-fun contains!2116 (ListLongMap!4059 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1574 (array!17830 array!17828 (_ BitVec 32) (_ BitVec 32) V!10475 V!10475 (_ BitVec 32) Int) ListLongMap!4059)

(assert (=> b!339890 (= res!187761 (not (contains!2116 (getCurrentListMap!1574 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!339891 () Bool)

(declare-datatypes ((SeekEntryResult!3217 0))(
  ( (MissingZero!3217 (index!15047 (_ BitVec 32))) (Found!3217 (index!15048 (_ BitVec 32))) (Intermediate!3217 (undefined!4029 Bool) (index!15049 (_ BitVec 32)) (x!33812 (_ BitVec 32))) (Undefined!3217) (MissingVacant!3217 (index!15050 (_ BitVec 32))) )
))
(declare-fun lt!161389 () SeekEntryResult!3217)

(get-info :version)

(assert (=> b!339891 (= e!208516 (and (not ((_ is Found!3217) lt!161389)) (not ((_ is MissingZero!3217) lt!161389)) ((_ is MissingVacant!3217) lt!161389) (bvslt #b00000000000000000000000000000000 (size!8789 _keys!1895)) (bvsge (size!8789 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17830 (_ BitVec 32)) SeekEntryResult!3217)

(assert (=> b!339891 (= lt!161389 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!339892 () Bool)

(assert (=> b!339892 (= e!208514 tp_is_empty!7123)))

(assert (= (and start!34096 res!187762) b!339885))

(assert (= (and b!339885 res!187760) b!339888))

(assert (= (and b!339888 res!187759) b!339887))

(assert (= (and b!339887 res!187758) b!339884))

(assert (= (and b!339884 res!187763) b!339890))

(assert (= (and b!339890 res!187761) b!339891))

(assert (= (and b!339889 condMapEmpty!12105) mapIsEmpty!12105))

(assert (= (and b!339889 (not condMapEmpty!12105)) mapNonEmpty!12105))

(assert (= (and mapNonEmpty!12105 ((_ is ValueCellFull!3218) mapValue!12105)) b!339892))

(assert (= (and b!339889 ((_ is ValueCellFull!3218) mapDefault!12105)) b!339886))

(assert (= start!34096 b!339889))

(declare-fun m!343007 () Bool)

(assert (=> b!339890 m!343007))

(assert (=> b!339890 m!343007))

(declare-fun m!343009 () Bool)

(assert (=> b!339890 m!343009))

(declare-fun m!343011 () Bool)

(assert (=> b!339887 m!343011))

(declare-fun m!343013 () Bool)

(assert (=> b!339884 m!343013))

(declare-fun m!343015 () Bool)

(assert (=> start!34096 m!343015))

(declare-fun m!343017 () Bool)

(assert (=> start!34096 m!343017))

(declare-fun m!343019 () Bool)

(assert (=> start!34096 m!343019))

(declare-fun m!343021 () Bool)

(assert (=> mapNonEmpty!12105 m!343021))

(declare-fun m!343023 () Bool)

(assert (=> b!339888 m!343023))

(declare-fun m!343025 () Bool)

(assert (=> b!339891 m!343025))

(check-sat (not start!34096) (not b!339891) b_and!14381 (not b!339884) (not b!339887) (not b_next!7171) (not b!339890) (not mapNonEmpty!12105) tp_is_empty!7123 (not b!339888))
(check-sat b_and!14381 (not b_next!7171))
(get-model)

(declare-fun d!70915 () Bool)

(declare-fun e!208553 () Bool)

(assert (=> d!70915 e!208553))

(declare-fun res!187802 () Bool)

(assert (=> d!70915 (=> res!187802 e!208553)))

(declare-fun lt!161405 () Bool)

(assert (=> d!70915 (= res!187802 (not lt!161405))))

(declare-fun lt!161407 () Bool)

(assert (=> d!70915 (= lt!161405 lt!161407)))

(declare-datatypes ((Unit!10564 0))(
  ( (Unit!10565) )
))
(declare-fun lt!161404 () Unit!10564)

(declare-fun e!208552 () Unit!10564)

(assert (=> d!70915 (= lt!161404 e!208552)))

(declare-fun c!52589 () Bool)

(assert (=> d!70915 (= c!52589 lt!161407)))

(declare-fun containsKey!324 (List!4753 (_ BitVec 64)) Bool)

(assert (=> d!70915 (= lt!161407 (containsKey!324 (toList!2045 (getCurrentListMap!1574 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70915 (= (contains!2116 (getCurrentListMap!1574 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!161405)))

(declare-fun b!339953 () Bool)

(declare-fun lt!161406 () Unit!10564)

(assert (=> b!339953 (= e!208552 lt!161406)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!272 (List!4753 (_ BitVec 64)) Unit!10564)

(assert (=> b!339953 (= lt!161406 (lemmaContainsKeyImpliesGetValueByKeyDefined!272 (toList!2045 (getCurrentListMap!1574 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!339 0))(
  ( (Some!338 (v!5780 V!10475)) (None!337) )
))
(declare-fun isDefined!273 (Option!339) Bool)

(declare-fun getValueByKey!333 (List!4753 (_ BitVec 64)) Option!339)

(assert (=> b!339953 (isDefined!273 (getValueByKey!333 (toList!2045 (getCurrentListMap!1574 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!339954 () Bool)

(declare-fun Unit!10566 () Unit!10564)

(assert (=> b!339954 (= e!208552 Unit!10566)))

(declare-fun b!339955 () Bool)

(assert (=> b!339955 (= e!208553 (isDefined!273 (getValueByKey!333 (toList!2045 (getCurrentListMap!1574 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70915 c!52589) b!339953))

(assert (= (and d!70915 (not c!52589)) b!339954))

(assert (= (and d!70915 (not res!187802)) b!339955))

(declare-fun m!343067 () Bool)

(assert (=> d!70915 m!343067))

(declare-fun m!343069 () Bool)

(assert (=> b!339953 m!343069))

(declare-fun m!343071 () Bool)

(assert (=> b!339953 m!343071))

(assert (=> b!339953 m!343071))

(declare-fun m!343073 () Bool)

(assert (=> b!339953 m!343073))

(assert (=> b!339955 m!343071))

(assert (=> b!339955 m!343071))

(assert (=> b!339955 m!343073))

(assert (=> b!339890 d!70915))

(declare-fun b!339998 () Bool)

(declare-fun e!208582 () Unit!10564)

(declare-fun lt!161471 () Unit!10564)

(assert (=> b!339998 (= e!208582 lt!161471)))

(declare-fun lt!161455 () ListLongMap!4059)

(declare-fun getCurrentListMapNoExtraKeys!590 (array!17830 array!17828 (_ BitVec 32) (_ BitVec 32) V!10475 V!10475 (_ BitVec 32) Int) ListLongMap!4059)

(assert (=> b!339998 (= lt!161455 (getCurrentListMapNoExtraKeys!590 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161456 () (_ BitVec 64))

(assert (=> b!339998 (= lt!161456 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161464 () (_ BitVec 64))

(assert (=> b!339998 (= lt!161464 (select (arr!8437 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161461 () Unit!10564)

(declare-fun addStillContains!250 (ListLongMap!4059 (_ BitVec 64) V!10475 (_ BitVec 64)) Unit!10564)

(assert (=> b!339998 (= lt!161461 (addStillContains!250 lt!161455 lt!161456 zeroValue!1467 lt!161464))))

(declare-fun +!725 (ListLongMap!4059 tuple2!5144) ListLongMap!4059)

(assert (=> b!339998 (contains!2116 (+!725 lt!161455 (tuple2!5145 lt!161456 zeroValue!1467)) lt!161464)))

(declare-fun lt!161462 () Unit!10564)

(assert (=> b!339998 (= lt!161462 lt!161461)))

(declare-fun lt!161454 () ListLongMap!4059)

(assert (=> b!339998 (= lt!161454 (getCurrentListMapNoExtraKeys!590 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161469 () (_ BitVec 64))

(assert (=> b!339998 (= lt!161469 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161470 () (_ BitVec 64))

(assert (=> b!339998 (= lt!161470 (select (arr!8437 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161453 () Unit!10564)

(declare-fun addApplyDifferent!250 (ListLongMap!4059 (_ BitVec 64) V!10475 (_ BitVec 64)) Unit!10564)

(assert (=> b!339998 (= lt!161453 (addApplyDifferent!250 lt!161454 lt!161469 minValue!1467 lt!161470))))

(declare-fun apply!274 (ListLongMap!4059 (_ BitVec 64)) V!10475)

(assert (=> b!339998 (= (apply!274 (+!725 lt!161454 (tuple2!5145 lt!161469 minValue!1467)) lt!161470) (apply!274 lt!161454 lt!161470))))

(declare-fun lt!161466 () Unit!10564)

(assert (=> b!339998 (= lt!161466 lt!161453)))

(declare-fun lt!161465 () ListLongMap!4059)

(assert (=> b!339998 (= lt!161465 (getCurrentListMapNoExtraKeys!590 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161472 () (_ BitVec 64))

(assert (=> b!339998 (= lt!161472 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161458 () (_ BitVec 64))

(assert (=> b!339998 (= lt!161458 (select (arr!8437 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161452 () Unit!10564)

(assert (=> b!339998 (= lt!161452 (addApplyDifferent!250 lt!161465 lt!161472 zeroValue!1467 lt!161458))))

(assert (=> b!339998 (= (apply!274 (+!725 lt!161465 (tuple2!5145 lt!161472 zeroValue!1467)) lt!161458) (apply!274 lt!161465 lt!161458))))

(declare-fun lt!161473 () Unit!10564)

(assert (=> b!339998 (= lt!161473 lt!161452)))

(declare-fun lt!161468 () ListLongMap!4059)

(assert (=> b!339998 (= lt!161468 (getCurrentListMapNoExtraKeys!590 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161467 () (_ BitVec 64))

(assert (=> b!339998 (= lt!161467 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161460 () (_ BitVec 64))

(assert (=> b!339998 (= lt!161460 (select (arr!8437 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!339998 (= lt!161471 (addApplyDifferent!250 lt!161468 lt!161467 minValue!1467 lt!161460))))

(assert (=> b!339998 (= (apply!274 (+!725 lt!161468 (tuple2!5145 lt!161467 minValue!1467)) lt!161460) (apply!274 lt!161468 lt!161460))))

(declare-fun b!339999 () Bool)

(declare-fun e!208589 () Bool)

(declare-fun lt!161463 () ListLongMap!4059)

(assert (=> b!339999 (= e!208589 (= (apply!274 lt!161463 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!340000 () Bool)

(declare-fun e!208591 () Bool)

(declare-fun get!4600 (ValueCell!3218 V!10475) V!10475)

(declare-fun dynLambda!617 (Int (_ BitVec 64)) V!10475)

(assert (=> b!340000 (= e!208591 (= (apply!274 lt!161463 (select (arr!8437 _keys!1895) #b00000000000000000000000000000000)) (get!4600 (select (arr!8436 _values!1525) #b00000000000000000000000000000000) (dynLambda!617 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!340000 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8788 _values!1525)))))

(assert (=> b!340000 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8789 _keys!1895)))))

(declare-fun b!340001 () Bool)

(declare-fun e!208583 () ListLongMap!4059)

(declare-fun e!208586 () ListLongMap!4059)

(assert (=> b!340001 (= e!208583 e!208586)))

(declare-fun c!52602 () Bool)

(assert (=> b!340001 (= c!52602 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!340002 () Bool)

(declare-fun call!26515 () ListLongMap!4059)

(assert (=> b!340002 (= e!208586 call!26515)))

(declare-fun b!340004 () Bool)

(declare-fun e!208580 () Bool)

(assert (=> b!340004 (= e!208580 e!208591)))

(declare-fun res!187826 () Bool)

(assert (=> b!340004 (=> (not res!187826) (not e!208591))))

(assert (=> b!340004 (= res!187826 (contains!2116 lt!161463 (select (arr!8437 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!340004 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8789 _keys!1895)))))

(declare-fun b!340005 () Bool)

(declare-fun e!208590 () Bool)

(declare-fun e!208587 () Bool)

(assert (=> b!340005 (= e!208590 e!208587)))

(declare-fun res!187825 () Bool)

(declare-fun call!26518 () Bool)

(assert (=> b!340005 (= res!187825 call!26518)))

(assert (=> b!340005 (=> (not res!187825) (not e!208587))))

(declare-fun bm!26510 () Bool)

(declare-fun call!26514 () ListLongMap!4059)

(assert (=> bm!26510 (= call!26514 (getCurrentListMapNoExtraKeys!590 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!340006 () Bool)

(declare-fun e!208581 () Bool)

(declare-fun e!208585 () Bool)

(assert (=> b!340006 (= e!208581 e!208585)))

(declare-fun c!52607 () Bool)

(assert (=> b!340006 (= c!52607 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!340007 () Bool)

(declare-fun call!26519 () Bool)

(assert (=> b!340007 (= e!208585 (not call!26519))))

(declare-fun bm!26511 () Bool)

(declare-fun call!26517 () ListLongMap!4059)

(declare-fun call!26513 () ListLongMap!4059)

(assert (=> bm!26511 (= call!26517 call!26513)))

(declare-fun bm!26512 () Bool)

(assert (=> bm!26512 (= call!26519 (contains!2116 lt!161463 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26513 () Bool)

(declare-fun call!26516 () ListLongMap!4059)

(assert (=> bm!26513 (= call!26515 call!26516)))

(declare-fun b!340008 () Bool)

(declare-fun e!208588 () Bool)

(assert (=> b!340008 (= e!208588 (validKeyInArray!0 (select (arr!8437 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!340009 () Bool)

(declare-fun e!208592 () ListLongMap!4059)

(assert (=> b!340009 (= e!208592 call!26515)))

(declare-fun bm!26514 () Bool)

(declare-fun c!52606 () Bool)

(assert (=> bm!26514 (= call!26516 (+!725 (ite c!52606 call!26514 (ite c!52602 call!26513 call!26517)) (ite (or c!52606 c!52602) (tuple2!5145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!340010 () Bool)

(declare-fun res!187821 () Bool)

(assert (=> b!340010 (=> (not res!187821) (not e!208581))))

(assert (=> b!340010 (= res!187821 e!208580)))

(declare-fun res!187824 () Bool)

(assert (=> b!340010 (=> res!187824 e!208580)))

(declare-fun e!208584 () Bool)

(assert (=> b!340010 (= res!187824 (not e!208584))))

(declare-fun res!187822 () Bool)

(assert (=> b!340010 (=> (not res!187822) (not e!208584))))

(assert (=> b!340010 (= res!187822 (bvslt #b00000000000000000000000000000000 (size!8789 _keys!1895)))))

(declare-fun b!340011 () Bool)

(declare-fun c!52603 () Bool)

(assert (=> b!340011 (= c!52603 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!340011 (= e!208586 e!208592)))

(declare-fun b!340012 () Bool)

(assert (=> b!340012 (= e!208587 (= (apply!274 lt!161463 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!340013 () Bool)

(declare-fun Unit!10567 () Unit!10564)

(assert (=> b!340013 (= e!208582 Unit!10567)))

(declare-fun b!340003 () Bool)

(assert (=> b!340003 (= e!208590 (not call!26518))))

(declare-fun d!70917 () Bool)

(assert (=> d!70917 e!208581))

(declare-fun res!187829 () Bool)

(assert (=> d!70917 (=> (not res!187829) (not e!208581))))

(assert (=> d!70917 (= res!187829 (or (bvsge #b00000000000000000000000000000000 (size!8789 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8789 _keys!1895)))))))

(declare-fun lt!161457 () ListLongMap!4059)

(assert (=> d!70917 (= lt!161463 lt!161457)))

(declare-fun lt!161459 () Unit!10564)

(assert (=> d!70917 (= lt!161459 e!208582)))

(declare-fun c!52605 () Bool)

(assert (=> d!70917 (= c!52605 e!208588)))

(declare-fun res!187828 () Bool)

(assert (=> d!70917 (=> (not res!187828) (not e!208588))))

(assert (=> d!70917 (= res!187828 (bvslt #b00000000000000000000000000000000 (size!8789 _keys!1895)))))

(assert (=> d!70917 (= lt!161457 e!208583)))

(assert (=> d!70917 (= c!52606 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70917 (validMask!0 mask!2385)))

(assert (=> d!70917 (= (getCurrentListMap!1574 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!161463)))

(declare-fun bm!26515 () Bool)

(assert (=> bm!26515 (= call!26513 call!26514)))

(declare-fun b!340014 () Bool)

(assert (=> b!340014 (= e!208592 call!26517)))

(declare-fun b!340015 () Bool)

(assert (=> b!340015 (= e!208583 (+!725 call!26516 (tuple2!5145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!340016 () Bool)

(assert (=> b!340016 (= e!208585 e!208589)))

(declare-fun res!187823 () Bool)

(assert (=> b!340016 (= res!187823 call!26519)))

(assert (=> b!340016 (=> (not res!187823) (not e!208589))))

(declare-fun b!340017 () Bool)

(assert (=> b!340017 (= e!208584 (validKeyInArray!0 (select (arr!8437 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!340018 () Bool)

(declare-fun res!187827 () Bool)

(assert (=> b!340018 (=> (not res!187827) (not e!208581))))

(assert (=> b!340018 (= res!187827 e!208590)))

(declare-fun c!52604 () Bool)

(assert (=> b!340018 (= c!52604 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!26516 () Bool)

(assert (=> bm!26516 (= call!26518 (contains!2116 lt!161463 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!70917 c!52606) b!340015))

(assert (= (and d!70917 (not c!52606)) b!340001))

(assert (= (and b!340001 c!52602) b!340002))

(assert (= (and b!340001 (not c!52602)) b!340011))

(assert (= (and b!340011 c!52603) b!340009))

(assert (= (and b!340011 (not c!52603)) b!340014))

(assert (= (or b!340009 b!340014) bm!26511))

(assert (= (or b!340002 bm!26511) bm!26515))

(assert (= (or b!340002 b!340009) bm!26513))

(assert (= (or b!340015 bm!26515) bm!26510))

(assert (= (or b!340015 bm!26513) bm!26514))

(assert (= (and d!70917 res!187828) b!340008))

(assert (= (and d!70917 c!52605) b!339998))

(assert (= (and d!70917 (not c!52605)) b!340013))

(assert (= (and d!70917 res!187829) b!340010))

(assert (= (and b!340010 res!187822) b!340017))

(assert (= (and b!340010 (not res!187824)) b!340004))

(assert (= (and b!340004 res!187826) b!340000))

(assert (= (and b!340010 res!187821) b!340018))

(assert (= (and b!340018 c!52604) b!340005))

(assert (= (and b!340018 (not c!52604)) b!340003))

(assert (= (and b!340005 res!187825) b!340012))

(assert (= (or b!340005 b!340003) bm!26516))

(assert (= (and b!340018 res!187827) b!340006))

(assert (= (and b!340006 c!52607) b!340016))

(assert (= (and b!340006 (not c!52607)) b!340007))

(assert (= (and b!340016 res!187823) b!339999))

(assert (= (or b!340016 b!340007) bm!26512))

(declare-fun b_lambda!8457 () Bool)

(assert (=> (not b_lambda!8457) (not b!340000)))

(declare-fun t!9854 () Bool)

(declare-fun tb!3055 () Bool)

(assert (=> (and start!34096 (= defaultEntry!1528 defaultEntry!1528) t!9854) tb!3055))

(declare-fun result!5511 () Bool)

(assert (=> tb!3055 (= result!5511 tp_is_empty!7123)))

(assert (=> b!340000 t!9854))

(declare-fun b_and!14387 () Bool)

(assert (= b_and!14381 (and (=> t!9854 result!5511) b_and!14387)))

(declare-fun m!343075 () Bool)

(assert (=> bm!26514 m!343075))

(declare-fun m!343077 () Bool)

(assert (=> b!340012 m!343077))

(declare-fun m!343079 () Bool)

(assert (=> bm!26510 m!343079))

(declare-fun m!343081 () Bool)

(assert (=> b!340015 m!343081))

(assert (=> d!70917 m!343015))

(declare-fun m!343083 () Bool)

(assert (=> bm!26516 m!343083))

(declare-fun m!343085 () Bool)

(assert (=> b!339999 m!343085))

(declare-fun m!343087 () Bool)

(assert (=> b!340004 m!343087))

(assert (=> b!340004 m!343087))

(declare-fun m!343089 () Bool)

(assert (=> b!340004 m!343089))

(declare-fun m!343091 () Bool)

(assert (=> bm!26512 m!343091))

(assert (=> b!340008 m!343087))

(assert (=> b!340008 m!343087))

(declare-fun m!343093 () Bool)

(assert (=> b!340008 m!343093))

(assert (=> b!340017 m!343087))

(assert (=> b!340017 m!343087))

(assert (=> b!340017 m!343093))

(declare-fun m!343095 () Bool)

(assert (=> b!339998 m!343095))

(declare-fun m!343097 () Bool)

(assert (=> b!339998 m!343097))

(declare-fun m!343099 () Bool)

(assert (=> b!339998 m!343099))

(assert (=> b!339998 m!343087))

(declare-fun m!343101 () Bool)

(assert (=> b!339998 m!343101))

(declare-fun m!343103 () Bool)

(assert (=> b!339998 m!343103))

(declare-fun m!343105 () Bool)

(assert (=> b!339998 m!343105))

(declare-fun m!343107 () Bool)

(assert (=> b!339998 m!343107))

(declare-fun m!343109 () Bool)

(assert (=> b!339998 m!343109))

(declare-fun m!343111 () Bool)

(assert (=> b!339998 m!343111))

(declare-fun m!343113 () Bool)

(assert (=> b!339998 m!343113))

(assert (=> b!339998 m!343095))

(declare-fun m!343115 () Bool)

(assert (=> b!339998 m!343115))

(declare-fun m!343117 () Bool)

(assert (=> b!339998 m!343117))

(assert (=> b!339998 m!343107))

(assert (=> b!339998 m!343079))

(assert (=> b!339998 m!343101))

(declare-fun m!343119 () Bool)

(assert (=> b!339998 m!343119))

(assert (=> b!339998 m!343113))

(declare-fun m!343121 () Bool)

(assert (=> b!339998 m!343121))

(declare-fun m!343123 () Bool)

(assert (=> b!339998 m!343123))

(declare-fun m!343125 () Bool)

(assert (=> b!340000 m!343125))

(declare-fun m!343127 () Bool)

(assert (=> b!340000 m!343127))

(declare-fun m!343129 () Bool)

(assert (=> b!340000 m!343129))

(assert (=> b!340000 m!343127))

(assert (=> b!340000 m!343087))

(assert (=> b!340000 m!343087))

(declare-fun m!343131 () Bool)

(assert (=> b!340000 m!343131))

(assert (=> b!340000 m!343125))

(assert (=> b!339890 d!70917))

(declare-fun b!340033 () Bool)

(declare-fun e!208599 () SeekEntryResult!3217)

(declare-fun lt!161480 () SeekEntryResult!3217)

(assert (=> b!340033 (= e!208599 (MissingZero!3217 (index!15049 lt!161480)))))

(declare-fun b!340034 () Bool)

(declare-fun e!208601 () SeekEntryResult!3217)

(assert (=> b!340034 (= e!208601 Undefined!3217)))

(declare-fun b!340035 () Bool)

(declare-fun e!208600 () SeekEntryResult!3217)

(assert (=> b!340035 (= e!208600 (Found!3217 (index!15049 lt!161480)))))

(declare-fun b!340036 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17830 (_ BitVec 32)) SeekEntryResult!3217)

(assert (=> b!340036 (= e!208599 (seekKeyOrZeroReturnVacant!0 (x!33812 lt!161480) (index!15049 lt!161480) (index!15049 lt!161480) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!340037 () Bool)

(assert (=> b!340037 (= e!208601 e!208600)))

(declare-fun lt!161482 () (_ BitVec 64))

(assert (=> b!340037 (= lt!161482 (select (arr!8437 _keys!1895) (index!15049 lt!161480)))))

(declare-fun c!52615 () Bool)

(assert (=> b!340037 (= c!52615 (= lt!161482 k0!1348))))

(declare-fun d!70919 () Bool)

(declare-fun lt!161481 () SeekEntryResult!3217)

(assert (=> d!70919 (and (or ((_ is Undefined!3217) lt!161481) (not ((_ is Found!3217) lt!161481)) (and (bvsge (index!15048 lt!161481) #b00000000000000000000000000000000) (bvslt (index!15048 lt!161481) (size!8789 _keys!1895)))) (or ((_ is Undefined!3217) lt!161481) ((_ is Found!3217) lt!161481) (not ((_ is MissingZero!3217) lt!161481)) (and (bvsge (index!15047 lt!161481) #b00000000000000000000000000000000) (bvslt (index!15047 lt!161481) (size!8789 _keys!1895)))) (or ((_ is Undefined!3217) lt!161481) ((_ is Found!3217) lt!161481) ((_ is MissingZero!3217) lt!161481) (not ((_ is MissingVacant!3217) lt!161481)) (and (bvsge (index!15050 lt!161481) #b00000000000000000000000000000000) (bvslt (index!15050 lt!161481) (size!8789 _keys!1895)))) (or ((_ is Undefined!3217) lt!161481) (ite ((_ is Found!3217) lt!161481) (= (select (arr!8437 _keys!1895) (index!15048 lt!161481)) k0!1348) (ite ((_ is MissingZero!3217) lt!161481) (= (select (arr!8437 _keys!1895) (index!15047 lt!161481)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3217) lt!161481) (= (select (arr!8437 _keys!1895) (index!15050 lt!161481)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70919 (= lt!161481 e!208601)))

(declare-fun c!52616 () Bool)

(assert (=> d!70919 (= c!52616 (and ((_ is Intermediate!3217) lt!161480) (undefined!4029 lt!161480)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17830 (_ BitVec 32)) SeekEntryResult!3217)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70919 (= lt!161480 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70919 (validMask!0 mask!2385)))

(assert (=> d!70919 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!161481)))

(declare-fun b!340038 () Bool)

(declare-fun c!52614 () Bool)

(assert (=> b!340038 (= c!52614 (= lt!161482 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!340038 (= e!208600 e!208599)))

(assert (= (and d!70919 c!52616) b!340034))

(assert (= (and d!70919 (not c!52616)) b!340037))

(assert (= (and b!340037 c!52615) b!340035))

(assert (= (and b!340037 (not c!52615)) b!340038))

(assert (= (and b!340038 c!52614) b!340033))

(assert (= (and b!340038 (not c!52614)) b!340036))

(declare-fun m!343133 () Bool)

(assert (=> b!340036 m!343133))

(declare-fun m!343135 () Bool)

(assert (=> b!340037 m!343135))

(declare-fun m!343137 () Bool)

(assert (=> d!70919 m!343137))

(declare-fun m!343139 () Bool)

(assert (=> d!70919 m!343139))

(declare-fun m!343141 () Bool)

(assert (=> d!70919 m!343141))

(assert (=> d!70919 m!343139))

(declare-fun m!343143 () Bool)

(assert (=> d!70919 m!343143))

(assert (=> d!70919 m!343015))

(declare-fun m!343145 () Bool)

(assert (=> d!70919 m!343145))

(assert (=> b!339891 d!70919))

(declare-fun b!340047 () Bool)

(declare-fun e!208610 () Bool)

(declare-fun e!208609 () Bool)

(assert (=> b!340047 (= e!208610 e!208609)))

(declare-fun c!52619 () Bool)

(assert (=> b!340047 (= c!52619 (validKeyInArray!0 (select (arr!8437 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!340048 () Bool)

(declare-fun e!208608 () Bool)

(declare-fun call!26522 () Bool)

(assert (=> b!340048 (= e!208608 call!26522)))

(declare-fun d!70921 () Bool)

(declare-fun res!187834 () Bool)

(assert (=> d!70921 (=> res!187834 e!208610)))

(assert (=> d!70921 (= res!187834 (bvsge #b00000000000000000000000000000000 (size!8789 _keys!1895)))))

(assert (=> d!70921 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!208610)))

(declare-fun bm!26519 () Bool)

(assert (=> bm!26519 (= call!26522 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!340049 () Bool)

(assert (=> b!340049 (= e!208609 call!26522)))

(declare-fun b!340050 () Bool)

(assert (=> b!340050 (= e!208609 e!208608)))

(declare-fun lt!161490 () (_ BitVec 64))

(assert (=> b!340050 (= lt!161490 (select (arr!8437 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161489 () Unit!10564)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17830 (_ BitVec 64) (_ BitVec 32)) Unit!10564)

(assert (=> b!340050 (= lt!161489 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!161490 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!17830 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340050 (arrayContainsKey!0 _keys!1895 lt!161490 #b00000000000000000000000000000000)))

(declare-fun lt!161491 () Unit!10564)

(assert (=> b!340050 (= lt!161491 lt!161489)))

(declare-fun res!187835 () Bool)

(assert (=> b!340050 (= res!187835 (= (seekEntryOrOpen!0 (select (arr!8437 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3217 #b00000000000000000000000000000000)))))

(assert (=> b!340050 (=> (not res!187835) (not e!208608))))

(assert (= (and d!70921 (not res!187834)) b!340047))

(assert (= (and b!340047 c!52619) b!340050))

(assert (= (and b!340047 (not c!52619)) b!340049))

(assert (= (and b!340050 res!187835) b!340048))

(assert (= (or b!340048 b!340049) bm!26519))

(assert (=> b!340047 m!343087))

(assert (=> b!340047 m!343087))

(assert (=> b!340047 m!343093))

(declare-fun m!343147 () Bool)

(assert (=> bm!26519 m!343147))

(assert (=> b!340050 m!343087))

(declare-fun m!343149 () Bool)

(assert (=> b!340050 m!343149))

(declare-fun m!343151 () Bool)

(assert (=> b!340050 m!343151))

(assert (=> b!340050 m!343087))

(declare-fun m!343153 () Bool)

(assert (=> b!340050 m!343153))

(assert (=> b!339888 d!70921))

(declare-fun d!70923 () Bool)

(assert (=> d!70923 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!339884 d!70923))

(declare-fun d!70925 () Bool)

(assert (=> d!70925 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34096 d!70925))

(declare-fun d!70927 () Bool)

(assert (=> d!70927 (= (array_inv!6252 _values!1525) (bvsge (size!8788 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34096 d!70927))

(declare-fun d!70929 () Bool)

(assert (=> d!70929 (= (array_inv!6253 _keys!1895) (bvsge (size!8789 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34096 d!70929))

(declare-fun d!70931 () Bool)

(declare-fun res!187844 () Bool)

(declare-fun e!208620 () Bool)

(assert (=> d!70931 (=> res!187844 e!208620)))

(assert (=> d!70931 (= res!187844 (bvsge #b00000000000000000000000000000000 (size!8789 _keys!1895)))))

(assert (=> d!70931 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4749) e!208620)))

(declare-fun b!340061 () Bool)

(declare-fun e!208621 () Bool)

(declare-fun e!208622 () Bool)

(assert (=> b!340061 (= e!208621 e!208622)))

(declare-fun c!52622 () Bool)

(assert (=> b!340061 (= c!52622 (validKeyInArray!0 (select (arr!8437 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!340062 () Bool)

(assert (=> b!340062 (= e!208620 e!208621)))

(declare-fun res!187843 () Bool)

(assert (=> b!340062 (=> (not res!187843) (not e!208621))))

(declare-fun e!208619 () Bool)

(assert (=> b!340062 (= res!187843 (not e!208619))))

(declare-fun res!187842 () Bool)

(assert (=> b!340062 (=> (not res!187842) (not e!208619))))

(assert (=> b!340062 (= res!187842 (validKeyInArray!0 (select (arr!8437 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!340063 () Bool)

(declare-fun call!26525 () Bool)

(assert (=> b!340063 (= e!208622 call!26525)))

(declare-fun bm!26522 () Bool)

(assert (=> bm!26522 (= call!26525 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52622 (Cons!4748 (select (arr!8437 _keys!1895) #b00000000000000000000000000000000) Nil!4749) Nil!4749)))))

(declare-fun b!340064 () Bool)

(assert (=> b!340064 (= e!208622 call!26525)))

(declare-fun b!340065 () Bool)

(declare-fun contains!2118 (List!4752 (_ BitVec 64)) Bool)

(assert (=> b!340065 (= e!208619 (contains!2118 Nil!4749 (select (arr!8437 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70931 (not res!187844)) b!340062))

(assert (= (and b!340062 res!187842) b!340065))

(assert (= (and b!340062 res!187843) b!340061))

(assert (= (and b!340061 c!52622) b!340064))

(assert (= (and b!340061 (not c!52622)) b!340063))

(assert (= (or b!340064 b!340063) bm!26522))

(assert (=> b!340061 m!343087))

(assert (=> b!340061 m!343087))

(assert (=> b!340061 m!343093))

(assert (=> b!340062 m!343087))

(assert (=> b!340062 m!343087))

(assert (=> b!340062 m!343093))

(assert (=> bm!26522 m!343087))

(declare-fun m!343155 () Bool)

(assert (=> bm!26522 m!343155))

(assert (=> b!340065 m!343087))

(assert (=> b!340065 m!343087))

(declare-fun m!343157 () Bool)

(assert (=> b!340065 m!343157))

(assert (=> b!339887 d!70931))

(declare-fun condMapEmpty!12114 () Bool)

(declare-fun mapDefault!12114 () ValueCell!3218)

(assert (=> mapNonEmpty!12105 (= condMapEmpty!12114 (= mapRest!12105 ((as const (Array (_ BitVec 32) ValueCell!3218)) mapDefault!12114)))))

(declare-fun e!208627 () Bool)

(declare-fun mapRes!12114 () Bool)

(assert (=> mapNonEmpty!12105 (= tp!25041 (and e!208627 mapRes!12114))))

(declare-fun mapIsEmpty!12114 () Bool)

(assert (=> mapIsEmpty!12114 mapRes!12114))

(declare-fun b!340072 () Bool)

(declare-fun e!208628 () Bool)

(assert (=> b!340072 (= e!208628 tp_is_empty!7123)))

(declare-fun b!340073 () Bool)

(assert (=> b!340073 (= e!208627 tp_is_empty!7123)))

(declare-fun mapNonEmpty!12114 () Bool)

(declare-fun tp!25056 () Bool)

(assert (=> mapNonEmpty!12114 (= mapRes!12114 (and tp!25056 e!208628))))

(declare-fun mapValue!12114 () ValueCell!3218)

(declare-fun mapRest!12114 () (Array (_ BitVec 32) ValueCell!3218))

(declare-fun mapKey!12114 () (_ BitVec 32))

(assert (=> mapNonEmpty!12114 (= mapRest!12105 (store mapRest!12114 mapKey!12114 mapValue!12114))))

(assert (= (and mapNonEmpty!12105 condMapEmpty!12114) mapIsEmpty!12114))

(assert (= (and mapNonEmpty!12105 (not condMapEmpty!12114)) mapNonEmpty!12114))

(assert (= (and mapNonEmpty!12114 ((_ is ValueCellFull!3218) mapValue!12114)) b!340072))

(assert (= (and mapNonEmpty!12105 ((_ is ValueCellFull!3218) mapDefault!12114)) b!340073))

(declare-fun m!343159 () Bool)

(assert (=> mapNonEmpty!12114 m!343159))

(declare-fun b_lambda!8459 () Bool)

(assert (= b_lambda!8457 (or (and start!34096 b_free!7171) b_lambda!8459)))

(check-sat (not b_lambda!8459) (not b!340017) (not mapNonEmpty!12114) (not b!340050) (not bm!26516) (not bm!26514) (not b!340065) (not b!340062) (not b!339953) (not b!340047) b_and!14387 (not d!70919) (not d!70917) (not b!340008) (not b!340061) (not b_next!7171) (not b!339955) (not b!339999) (not b!340036) (not b!340012) (not b!340004) (not b!339998) (not bm!26522) tp_is_empty!7123 (not b!340000) (not bm!26519) (not b!340015) (not d!70915) (not bm!26512) (not bm!26510))
(check-sat b_and!14387 (not b_next!7171))
