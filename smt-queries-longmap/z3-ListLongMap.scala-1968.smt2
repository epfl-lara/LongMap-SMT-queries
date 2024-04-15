; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34616 () Bool)

(assert start!34616)

(declare-fun b_free!7477 () Bool)

(declare-fun b_next!7477 () Bool)

(assert (=> start!34616 (= b_free!7477 (not b_next!7477))))

(declare-fun tp!25989 () Bool)

(declare-fun b_and!14667 () Bool)

(assert (=> start!34616 (= tp!25989 b_and!14667)))

(declare-fun b!345763 () Bool)

(declare-fun e!211911 () Bool)

(declare-datatypes ((SeekEntryResult!3363 0))(
  ( (MissingZero!3363 (index!15631 (_ BitVec 32))) (Found!3363 (index!15632 (_ BitVec 32))) (Intermediate!3363 (undefined!4175 Bool) (index!15633 (_ BitVec 32)) (x!34464 (_ BitVec 32))) (Undefined!3363) (MissingVacant!3363 (index!15634 (_ BitVec 32))) )
))
(declare-fun lt!162939 () SeekEntryResult!3363)

(declare-datatypes ((array!18435 0))(
  ( (array!18436 (arr!8730 (Array (_ BitVec 32) (_ BitVec 64))) (size!9083 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18435)

(assert (=> b!345763 (= e!211911 (and (bvsge (index!15632 lt!162939) #b00000000000000000000000000000000) (bvsge (index!15632 lt!162939) (size!9083 _keys!1895))))))

(declare-fun b!345764 () Bool)

(declare-fun res!191279 () Bool)

(declare-fun e!211914 () Bool)

(assert (=> b!345764 (=> (not res!191279) (not e!211914))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!345764 (= res!191279 (validKeyInArray!0 k0!1348))))

(declare-fun b!345765 () Bool)

(declare-fun res!191281 () Bool)

(assert (=> b!345765 (=> (not res!191281) (not e!211914))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10883 0))(
  ( (V!10884 (val!3759 Int)) )
))
(declare-fun zeroValue!1467 () V!10883)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10883)

(declare-datatypes ((ValueCell!3371 0))(
  ( (ValueCellFull!3371 (v!5933 V!10883)) (EmptyCell!3371) )
))
(declare-datatypes ((array!18437 0))(
  ( (array!18438 (arr!8731 (Array (_ BitVec 32) ValueCell!3371)) (size!9084 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18437)

(declare-datatypes ((tuple2!5398 0))(
  ( (tuple2!5399 (_1!2710 (_ BitVec 64)) (_2!2710 V!10883)) )
))
(declare-datatypes ((List!5015 0))(
  ( (Nil!5012) (Cons!5011 (h!5867 tuple2!5398) (t!10130 List!5015)) )
))
(declare-datatypes ((ListLongMap!4301 0))(
  ( (ListLongMap!4302 (toList!2166 List!5015)) )
))
(declare-fun contains!2239 (ListLongMap!4301 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1672 (array!18435 array!18437 (_ BitVec 32) (_ BitVec 32) V!10883 V!10883 (_ BitVec 32) Int) ListLongMap!4301)

(assert (=> b!345765 (= res!191281 (not (contains!2239 (getCurrentListMap!1672 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!345766 () Bool)

(declare-fun res!191284 () Bool)

(assert (=> b!345766 (=> (not res!191284) (not e!211911))))

(declare-fun arrayContainsKey!0 (array!18435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!345766 (= res!191284 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15632 lt!162939)))))

(declare-fun b!345767 () Bool)

(declare-fun e!211913 () Bool)

(declare-fun tp_is_empty!7429 () Bool)

(assert (=> b!345767 (= e!211913 tp_is_empty!7429)))

(declare-fun mapIsEmpty!12594 () Bool)

(declare-fun mapRes!12594 () Bool)

(assert (=> mapIsEmpty!12594 mapRes!12594))

(declare-fun b!345768 () Bool)

(declare-fun res!191285 () Bool)

(assert (=> b!345768 (=> (not res!191285) (not e!211914))))

(assert (=> b!345768 (= res!191285 (and (= (size!9084 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9083 _keys!1895) (size!9084 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!345769 () Bool)

(declare-fun res!191283 () Bool)

(assert (=> b!345769 (=> (not res!191283) (not e!211914))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18435 (_ BitVec 32)) Bool)

(assert (=> b!345769 (= res!191283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!345770 () Bool)

(declare-fun res!191278 () Bool)

(assert (=> b!345770 (=> (not res!191278) (not e!211914))))

(declare-datatypes ((List!5016 0))(
  ( (Nil!5013) (Cons!5012 (h!5868 (_ BitVec 64)) (t!10131 List!5016)) )
))
(declare-fun arrayNoDuplicates!0 (array!18435 (_ BitVec 32) List!5016) Bool)

(assert (=> b!345770 (= res!191278 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5013))))

(declare-fun b!345771 () Bool)

(declare-fun e!211912 () Bool)

(assert (=> b!345771 (= e!211912 tp_is_empty!7429)))

(declare-fun res!191280 () Bool)

(assert (=> start!34616 (=> (not res!191280) (not e!211914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34616 (= res!191280 (validMask!0 mask!2385))))

(assert (=> start!34616 e!211914))

(assert (=> start!34616 true))

(assert (=> start!34616 tp_is_empty!7429))

(assert (=> start!34616 tp!25989))

(declare-fun e!211910 () Bool)

(declare-fun array_inv!6488 (array!18437) Bool)

(assert (=> start!34616 (and (array_inv!6488 _values!1525) e!211910)))

(declare-fun array_inv!6489 (array!18435) Bool)

(assert (=> start!34616 (array_inv!6489 _keys!1895)))

(declare-fun mapNonEmpty!12594 () Bool)

(declare-fun tp!25988 () Bool)

(assert (=> mapNonEmpty!12594 (= mapRes!12594 (and tp!25988 e!211912))))

(declare-fun mapValue!12594 () ValueCell!3371)

(declare-fun mapRest!12594 () (Array (_ BitVec 32) ValueCell!3371))

(declare-fun mapKey!12594 () (_ BitVec 32))

(assert (=> mapNonEmpty!12594 (= (arr!8731 _values!1525) (store mapRest!12594 mapKey!12594 mapValue!12594))))

(declare-fun b!345772 () Bool)

(assert (=> b!345772 (= e!211914 e!211911)))

(declare-fun res!191282 () Bool)

(assert (=> b!345772 (=> (not res!191282) (not e!211911))))

(get-info :version)

(assert (=> b!345772 (= res!191282 (and ((_ is Found!3363) lt!162939) (= (select (arr!8730 _keys!1895) (index!15632 lt!162939)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18435 (_ BitVec 32)) SeekEntryResult!3363)

(assert (=> b!345772 (= lt!162939 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!345773 () Bool)

(assert (=> b!345773 (= e!211910 (and e!211913 mapRes!12594))))

(declare-fun condMapEmpty!12594 () Bool)

(declare-fun mapDefault!12594 () ValueCell!3371)

(assert (=> b!345773 (= condMapEmpty!12594 (= (arr!8731 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3371)) mapDefault!12594)))))

(assert (= (and start!34616 res!191280) b!345768))

(assert (= (and b!345768 res!191285) b!345769))

(assert (= (and b!345769 res!191283) b!345770))

(assert (= (and b!345770 res!191278) b!345764))

(assert (= (and b!345764 res!191279) b!345765))

(assert (= (and b!345765 res!191281) b!345772))

(assert (= (and b!345772 res!191282) b!345766))

(assert (= (and b!345766 res!191284) b!345763))

(assert (= (and b!345773 condMapEmpty!12594) mapIsEmpty!12594))

(assert (= (and b!345773 (not condMapEmpty!12594)) mapNonEmpty!12594))

(assert (= (and mapNonEmpty!12594 ((_ is ValueCellFull!3371) mapValue!12594)) b!345771))

(assert (= (and b!345773 ((_ is ValueCellFull!3371) mapDefault!12594)) b!345767))

(assert (= start!34616 b!345773))

(declare-fun m!346517 () Bool)

(assert (=> b!345766 m!346517))

(declare-fun m!346519 () Bool)

(assert (=> mapNonEmpty!12594 m!346519))

(declare-fun m!346521 () Bool)

(assert (=> b!345769 m!346521))

(declare-fun m!346523 () Bool)

(assert (=> b!345764 m!346523))

(declare-fun m!346525 () Bool)

(assert (=> b!345772 m!346525))

(declare-fun m!346527 () Bool)

(assert (=> b!345772 m!346527))

(declare-fun m!346529 () Bool)

(assert (=> start!34616 m!346529))

(declare-fun m!346531 () Bool)

(assert (=> start!34616 m!346531))

(declare-fun m!346533 () Bool)

(assert (=> start!34616 m!346533))

(declare-fun m!346535 () Bool)

(assert (=> b!345765 m!346535))

(assert (=> b!345765 m!346535))

(declare-fun m!346537 () Bool)

(assert (=> b!345765 m!346537))

(declare-fun m!346539 () Bool)

(assert (=> b!345770 m!346539))

(check-sat tp_is_empty!7429 (not b!345764) (not b!345770) (not start!34616) (not b!345772) (not b!345765) (not b_next!7477) (not mapNonEmpty!12594) b_and!14667 (not b!345766) (not b!345769))
(check-sat b_and!14667 (not b_next!7477))
(get-model)

(declare-fun b!345850 () Bool)

(declare-fun e!211962 () Bool)

(declare-fun contains!2241 (List!5016 (_ BitVec 64)) Bool)

(assert (=> b!345850 (= e!211962 (contains!2241 Nil!5013 (select (arr!8730 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345851 () Bool)

(declare-fun e!211961 () Bool)

(declare-fun call!26759 () Bool)

(assert (=> b!345851 (= e!211961 call!26759)))

(declare-fun b!345852 () Bool)

(declare-fun e!211960 () Bool)

(assert (=> b!345852 (= e!211960 e!211961)))

(declare-fun c!53030 () Bool)

(assert (=> b!345852 (= c!53030 (validKeyInArray!0 (select (arr!8730 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345853 () Bool)

(assert (=> b!345853 (= e!211961 call!26759)))

(declare-fun b!345854 () Bool)

(declare-fun e!211963 () Bool)

(assert (=> b!345854 (= e!211963 e!211960)))

(declare-fun res!191342 () Bool)

(assert (=> b!345854 (=> (not res!191342) (not e!211960))))

(assert (=> b!345854 (= res!191342 (not e!211962))))

(declare-fun res!191341 () Bool)

(assert (=> b!345854 (=> (not res!191341) (not e!211962))))

(assert (=> b!345854 (= res!191341 (validKeyInArray!0 (select (arr!8730 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26756 () Bool)

(assert (=> bm!26756 (= call!26759 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53030 (Cons!5012 (select (arr!8730 _keys!1895) #b00000000000000000000000000000000) Nil!5013) Nil!5013)))))

(declare-fun d!70997 () Bool)

(declare-fun res!191340 () Bool)

(assert (=> d!70997 (=> res!191340 e!211963)))

(assert (=> d!70997 (= res!191340 (bvsge #b00000000000000000000000000000000 (size!9083 _keys!1895)))))

(assert (=> d!70997 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5013) e!211963)))

(assert (= (and d!70997 (not res!191340)) b!345854))

(assert (= (and b!345854 res!191341) b!345850))

(assert (= (and b!345854 res!191342) b!345852))

(assert (= (and b!345852 c!53030) b!345853))

(assert (= (and b!345852 (not c!53030)) b!345851))

(assert (= (or b!345853 b!345851) bm!26756))

(declare-fun m!346589 () Bool)

(assert (=> b!345850 m!346589))

(assert (=> b!345850 m!346589))

(declare-fun m!346591 () Bool)

(assert (=> b!345850 m!346591))

(assert (=> b!345852 m!346589))

(assert (=> b!345852 m!346589))

(declare-fun m!346593 () Bool)

(assert (=> b!345852 m!346593))

(assert (=> b!345854 m!346589))

(assert (=> b!345854 m!346589))

(assert (=> b!345854 m!346593))

(assert (=> bm!26756 m!346589))

(declare-fun m!346595 () Bool)

(assert (=> bm!26756 m!346595))

(assert (=> b!345770 d!70997))

(declare-fun lt!162952 () SeekEntryResult!3363)

(declare-fun b!345867 () Bool)

(declare-fun e!211970 () SeekEntryResult!3363)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18435 (_ BitVec 32)) SeekEntryResult!3363)

(assert (=> b!345867 (= e!211970 (seekKeyOrZeroReturnVacant!0 (x!34464 lt!162952) (index!15633 lt!162952) (index!15633 lt!162952) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!345868 () Bool)

(declare-fun e!211972 () SeekEntryResult!3363)

(declare-fun e!211971 () SeekEntryResult!3363)

(assert (=> b!345868 (= e!211972 e!211971)))

(declare-fun lt!162953 () (_ BitVec 64))

(assert (=> b!345868 (= lt!162953 (select (arr!8730 _keys!1895) (index!15633 lt!162952)))))

(declare-fun c!53038 () Bool)

(assert (=> b!345868 (= c!53038 (= lt!162953 k0!1348))))

(declare-fun b!345869 () Bool)

(assert (=> b!345869 (= e!211971 (Found!3363 (index!15633 lt!162952)))))

(declare-fun d!70999 () Bool)

(declare-fun lt!162954 () SeekEntryResult!3363)

(assert (=> d!70999 (and (or ((_ is Undefined!3363) lt!162954) (not ((_ is Found!3363) lt!162954)) (and (bvsge (index!15632 lt!162954) #b00000000000000000000000000000000) (bvslt (index!15632 lt!162954) (size!9083 _keys!1895)))) (or ((_ is Undefined!3363) lt!162954) ((_ is Found!3363) lt!162954) (not ((_ is MissingZero!3363) lt!162954)) (and (bvsge (index!15631 lt!162954) #b00000000000000000000000000000000) (bvslt (index!15631 lt!162954) (size!9083 _keys!1895)))) (or ((_ is Undefined!3363) lt!162954) ((_ is Found!3363) lt!162954) ((_ is MissingZero!3363) lt!162954) (not ((_ is MissingVacant!3363) lt!162954)) (and (bvsge (index!15634 lt!162954) #b00000000000000000000000000000000) (bvslt (index!15634 lt!162954) (size!9083 _keys!1895)))) (or ((_ is Undefined!3363) lt!162954) (ite ((_ is Found!3363) lt!162954) (= (select (arr!8730 _keys!1895) (index!15632 lt!162954)) k0!1348) (ite ((_ is MissingZero!3363) lt!162954) (= (select (arr!8730 _keys!1895) (index!15631 lt!162954)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3363) lt!162954) (= (select (arr!8730 _keys!1895) (index!15634 lt!162954)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70999 (= lt!162954 e!211972)))

(declare-fun c!53039 () Bool)

(assert (=> d!70999 (= c!53039 (and ((_ is Intermediate!3363) lt!162952) (undefined!4175 lt!162952)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18435 (_ BitVec 32)) SeekEntryResult!3363)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70999 (= lt!162952 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70999 (validMask!0 mask!2385)))

(assert (=> d!70999 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!162954)))

(declare-fun b!345870 () Bool)

(assert (=> b!345870 (= e!211972 Undefined!3363)))

(declare-fun b!345871 () Bool)

(assert (=> b!345871 (= e!211970 (MissingZero!3363 (index!15633 lt!162952)))))

(declare-fun b!345872 () Bool)

(declare-fun c!53037 () Bool)

(assert (=> b!345872 (= c!53037 (= lt!162953 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!345872 (= e!211971 e!211970)))

(assert (= (and d!70999 c!53039) b!345870))

(assert (= (and d!70999 (not c!53039)) b!345868))

(assert (= (and b!345868 c!53038) b!345869))

(assert (= (and b!345868 (not c!53038)) b!345872))

(assert (= (and b!345872 c!53037) b!345871))

(assert (= (and b!345872 (not c!53037)) b!345867))

(declare-fun m!346597 () Bool)

(assert (=> b!345867 m!346597))

(declare-fun m!346599 () Bool)

(assert (=> b!345868 m!346599))

(declare-fun m!346601 () Bool)

(assert (=> d!70999 m!346601))

(declare-fun m!346603 () Bool)

(assert (=> d!70999 m!346603))

(declare-fun m!346605 () Bool)

(assert (=> d!70999 m!346605))

(declare-fun m!346607 () Bool)

(assert (=> d!70999 m!346607))

(declare-fun m!346609 () Bool)

(assert (=> d!70999 m!346609))

(assert (=> d!70999 m!346601))

(assert (=> d!70999 m!346529))

(assert (=> b!345772 d!70999))

(declare-fun d!71001 () Bool)

(assert (=> d!71001 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!345764 d!71001))

(declare-fun d!71003 () Bool)

(declare-fun e!211978 () Bool)

(assert (=> d!71003 e!211978))

(declare-fun res!191345 () Bool)

(assert (=> d!71003 (=> res!191345 e!211978)))

(declare-fun lt!162965 () Bool)

(assert (=> d!71003 (= res!191345 (not lt!162965))))

(declare-fun lt!162963 () Bool)

(assert (=> d!71003 (= lt!162965 lt!162963)))

(declare-datatypes ((Unit!10722 0))(
  ( (Unit!10723) )
))
(declare-fun lt!162964 () Unit!10722)

(declare-fun e!211977 () Unit!10722)

(assert (=> d!71003 (= lt!162964 e!211977)))

(declare-fun c!53042 () Bool)

(assert (=> d!71003 (= c!53042 lt!162963)))

(declare-fun containsKey!332 (List!5015 (_ BitVec 64)) Bool)

(assert (=> d!71003 (= lt!162963 (containsKey!332 (toList!2166 (getCurrentListMap!1672 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71003 (= (contains!2239 (getCurrentListMap!1672 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!162965)))

(declare-fun b!345879 () Bool)

(declare-fun lt!162966 () Unit!10722)

(assert (=> b!345879 (= e!211977 lt!162966)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!281 (List!5015 (_ BitVec 64)) Unit!10722)

(assert (=> b!345879 (= lt!162966 (lemmaContainsKeyImpliesGetValueByKeyDefined!281 (toList!2166 (getCurrentListMap!1672 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!346 0))(
  ( (Some!345 (v!5936 V!10883)) (None!344) )
))
(declare-fun isDefined!282 (Option!346) Bool)

(declare-fun getValueByKey!340 (List!5015 (_ BitVec 64)) Option!346)

(assert (=> b!345879 (isDefined!282 (getValueByKey!340 (toList!2166 (getCurrentListMap!1672 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!345880 () Bool)

(declare-fun Unit!10724 () Unit!10722)

(assert (=> b!345880 (= e!211977 Unit!10724)))

(declare-fun b!345881 () Bool)

(assert (=> b!345881 (= e!211978 (isDefined!282 (getValueByKey!340 (toList!2166 (getCurrentListMap!1672 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71003 c!53042) b!345879))

(assert (= (and d!71003 (not c!53042)) b!345880))

(assert (= (and d!71003 (not res!191345)) b!345881))

(declare-fun m!346611 () Bool)

(assert (=> d!71003 m!346611))

(declare-fun m!346613 () Bool)

(assert (=> b!345879 m!346613))

(declare-fun m!346615 () Bool)

(assert (=> b!345879 m!346615))

(assert (=> b!345879 m!346615))

(declare-fun m!346617 () Bool)

(assert (=> b!345879 m!346617))

(assert (=> b!345881 m!346615))

(assert (=> b!345881 m!346615))

(assert (=> b!345881 m!346617))

(assert (=> b!345765 d!71003))

(declare-fun b!345924 () Bool)

(declare-fun e!212009 () Bool)

(assert (=> b!345924 (= e!212009 (validKeyInArray!0 (select (arr!8730 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345925 () Bool)

(declare-fun e!212015 () Bool)

(declare-fun e!212014 () Bool)

(assert (=> b!345925 (= e!212015 e!212014)))

(declare-fun res!191364 () Bool)

(declare-fun call!26778 () Bool)

(assert (=> b!345925 (= res!191364 call!26778)))

(assert (=> b!345925 (=> (not res!191364) (not e!212014))))

(declare-fun c!53058 () Bool)

(declare-fun call!26775 () ListLongMap!4301)

(declare-fun bm!26771 () Bool)

(declare-fun c!53057 () Bool)

(declare-fun call!26777 () ListLongMap!4301)

(declare-fun call!26776 () ListLongMap!4301)

(declare-fun call!26780 () ListLongMap!4301)

(declare-fun +!737 (ListLongMap!4301 tuple2!5398) ListLongMap!4301)

(assert (=> bm!26771 (= call!26777 (+!737 (ite c!53057 call!26775 (ite c!53058 call!26780 call!26776)) (ite (or c!53057 c!53058) (tuple2!5399 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5399 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun bm!26772 () Bool)

(assert (=> bm!26772 (= call!26780 call!26775)))

(declare-fun b!345926 () Bool)

(declare-fun res!191367 () Bool)

(declare-fun e!212016 () Bool)

(assert (=> b!345926 (=> (not res!191367) (not e!212016))))

(declare-fun e!212006 () Bool)

(assert (=> b!345926 (= res!191367 e!212006)))

(declare-fun res!191370 () Bool)

(assert (=> b!345926 (=> res!191370 e!212006)))

(assert (=> b!345926 (= res!191370 (not e!212009))))

(declare-fun res!191365 () Bool)

(assert (=> b!345926 (=> (not res!191365) (not e!212009))))

(assert (=> b!345926 (= res!191365 (bvslt #b00000000000000000000000000000000 (size!9083 _keys!1895)))))

(declare-fun b!345927 () Bool)

(declare-fun e!212013 () Unit!10722)

(declare-fun lt!163013 () Unit!10722)

(assert (=> b!345927 (= e!212013 lt!163013)))

(declare-fun lt!163018 () ListLongMap!4301)

(declare-fun getCurrentListMapNoExtraKeys!600 (array!18435 array!18437 (_ BitVec 32) (_ BitVec 32) V!10883 V!10883 (_ BitVec 32) Int) ListLongMap!4301)

(assert (=> b!345927 (= lt!163018 (getCurrentListMapNoExtraKeys!600 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163024 () (_ BitVec 64))

(assert (=> b!345927 (= lt!163024 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163020 () (_ BitVec 64))

(assert (=> b!345927 (= lt!163020 (select (arr!8730 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163028 () Unit!10722)

(declare-fun addStillContains!260 (ListLongMap!4301 (_ BitVec 64) V!10883 (_ BitVec 64)) Unit!10722)

(assert (=> b!345927 (= lt!163028 (addStillContains!260 lt!163018 lt!163024 zeroValue!1467 lt!163020))))

(assert (=> b!345927 (contains!2239 (+!737 lt!163018 (tuple2!5399 lt!163024 zeroValue!1467)) lt!163020)))

(declare-fun lt!163025 () Unit!10722)

(assert (=> b!345927 (= lt!163025 lt!163028)))

(declare-fun lt!163019 () ListLongMap!4301)

(assert (=> b!345927 (= lt!163019 (getCurrentListMapNoExtraKeys!600 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163016 () (_ BitVec 64))

(assert (=> b!345927 (= lt!163016 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163021 () (_ BitVec 64))

(assert (=> b!345927 (= lt!163021 (select (arr!8730 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163014 () Unit!10722)

(declare-fun addApplyDifferent!260 (ListLongMap!4301 (_ BitVec 64) V!10883 (_ BitVec 64)) Unit!10722)

(assert (=> b!345927 (= lt!163014 (addApplyDifferent!260 lt!163019 lt!163016 minValue!1467 lt!163021))))

(declare-fun apply!284 (ListLongMap!4301 (_ BitVec 64)) V!10883)

(assert (=> b!345927 (= (apply!284 (+!737 lt!163019 (tuple2!5399 lt!163016 minValue!1467)) lt!163021) (apply!284 lt!163019 lt!163021))))

(declare-fun lt!163012 () Unit!10722)

(assert (=> b!345927 (= lt!163012 lt!163014)))

(declare-fun lt!163030 () ListLongMap!4301)

(assert (=> b!345927 (= lt!163030 (getCurrentListMapNoExtraKeys!600 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163017 () (_ BitVec 64))

(assert (=> b!345927 (= lt!163017 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163027 () (_ BitVec 64))

(assert (=> b!345927 (= lt!163027 (select (arr!8730 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163026 () Unit!10722)

(assert (=> b!345927 (= lt!163026 (addApplyDifferent!260 lt!163030 lt!163017 zeroValue!1467 lt!163027))))

(assert (=> b!345927 (= (apply!284 (+!737 lt!163030 (tuple2!5399 lt!163017 zeroValue!1467)) lt!163027) (apply!284 lt!163030 lt!163027))))

(declare-fun lt!163032 () Unit!10722)

(assert (=> b!345927 (= lt!163032 lt!163026)))

(declare-fun lt!163015 () ListLongMap!4301)

(assert (=> b!345927 (= lt!163015 (getCurrentListMapNoExtraKeys!600 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163022 () (_ BitVec 64))

(assert (=> b!345927 (= lt!163022 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163023 () (_ BitVec 64))

(assert (=> b!345927 (= lt!163023 (select (arr!8730 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!345927 (= lt!163013 (addApplyDifferent!260 lt!163015 lt!163022 minValue!1467 lt!163023))))

(assert (=> b!345927 (= (apply!284 (+!737 lt!163015 (tuple2!5399 lt!163022 minValue!1467)) lt!163023) (apply!284 lt!163015 lt!163023))))

(declare-fun d!71005 () Bool)

(assert (=> d!71005 e!212016))

(declare-fun res!191368 () Bool)

(assert (=> d!71005 (=> (not res!191368) (not e!212016))))

(assert (=> d!71005 (= res!191368 (or (bvsge #b00000000000000000000000000000000 (size!9083 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9083 _keys!1895)))))))

(declare-fun lt!163029 () ListLongMap!4301)

(declare-fun lt!163031 () ListLongMap!4301)

(assert (=> d!71005 (= lt!163029 lt!163031)))

(declare-fun lt!163011 () Unit!10722)

(assert (=> d!71005 (= lt!163011 e!212013)))

(declare-fun c!53060 () Bool)

(declare-fun e!212012 () Bool)

(assert (=> d!71005 (= c!53060 e!212012)))

(declare-fun res!191369 () Bool)

(assert (=> d!71005 (=> (not res!191369) (not e!212012))))

(assert (=> d!71005 (= res!191369 (bvslt #b00000000000000000000000000000000 (size!9083 _keys!1895)))))

(declare-fun e!212011 () ListLongMap!4301)

(assert (=> d!71005 (= lt!163031 e!212011)))

(assert (=> d!71005 (= c!53057 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71005 (validMask!0 mask!2385)))

(assert (=> d!71005 (= (getCurrentListMap!1672 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!163029)))

(declare-fun b!345928 () Bool)

(assert (=> b!345928 (= e!212014 (= (apply!284 lt!163029 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!345929 () Bool)

(declare-fun e!212008 () ListLongMap!4301)

(assert (=> b!345929 (= e!212011 e!212008)))

(assert (=> b!345929 (= c!53058 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!345930 () Bool)

(declare-fun Unit!10725 () Unit!10722)

(assert (=> b!345930 (= e!212013 Unit!10725)))

(declare-fun b!345931 () Bool)

(assert (=> b!345931 (= e!212011 (+!737 call!26777 (tuple2!5399 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun bm!26773 () Bool)

(assert (=> bm!26773 (= call!26776 call!26780)))

(declare-fun b!345932 () Bool)

(assert (=> b!345932 (= e!212012 (validKeyInArray!0 (select (arr!8730 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345933 () Bool)

(assert (=> b!345933 (= e!212016 e!212015)))

(declare-fun c!53059 () Bool)

(assert (=> b!345933 (= c!53059 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!345934 () Bool)

(declare-fun e!212007 () Bool)

(declare-fun get!4700 (ValueCell!3371 V!10883) V!10883)

(declare-fun dynLambda!618 (Int (_ BitVec 64)) V!10883)

(assert (=> b!345934 (= e!212007 (= (apply!284 lt!163029 (select (arr!8730 _keys!1895) #b00000000000000000000000000000000)) (get!4700 (select (arr!8731 _values!1525) #b00000000000000000000000000000000) (dynLambda!618 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!345934 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9084 _values!1525)))))

(assert (=> b!345934 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9083 _keys!1895)))))

(declare-fun b!345935 () Bool)

(declare-fun e!212017 () Bool)

(declare-fun call!26774 () Bool)

(assert (=> b!345935 (= e!212017 (not call!26774))))

(declare-fun bm!26774 () Bool)

(assert (=> bm!26774 (= call!26774 (contains!2239 lt!163029 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!345936 () Bool)

(declare-fun call!26779 () ListLongMap!4301)

(assert (=> b!345936 (= e!212008 call!26779)))

(declare-fun bm!26775 () Bool)

(assert (=> bm!26775 (= call!26779 call!26777)))

(declare-fun b!345937 () Bool)

(assert (=> b!345937 (= e!212015 (not call!26778))))

(declare-fun b!345938 () Bool)

(assert (=> b!345938 (= e!212006 e!212007)))

(declare-fun res!191372 () Bool)

(assert (=> b!345938 (=> (not res!191372) (not e!212007))))

(assert (=> b!345938 (= res!191372 (contains!2239 lt!163029 (select (arr!8730 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!345938 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9083 _keys!1895)))))

(declare-fun b!345939 () Bool)

(declare-fun e!212005 () Bool)

(assert (=> b!345939 (= e!212005 (= (apply!284 lt!163029 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun bm!26776 () Bool)

(assert (=> bm!26776 (= call!26778 (contains!2239 lt!163029 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!345940 () Bool)

(declare-fun c!53056 () Bool)

(assert (=> b!345940 (= c!53056 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!212010 () ListLongMap!4301)

(assert (=> b!345940 (= e!212008 e!212010)))

(declare-fun b!345941 () Bool)

(assert (=> b!345941 (= e!212010 call!26779)))

(declare-fun b!345942 () Bool)

(assert (=> b!345942 (= e!212010 call!26776)))

(declare-fun bm!26777 () Bool)

(assert (=> bm!26777 (= call!26775 (getCurrentListMapNoExtraKeys!600 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!345943 () Bool)

(declare-fun res!191366 () Bool)

(assert (=> b!345943 (=> (not res!191366) (not e!212016))))

(assert (=> b!345943 (= res!191366 e!212017)))

(declare-fun c!53055 () Bool)

(assert (=> b!345943 (= c!53055 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!345944 () Bool)

(assert (=> b!345944 (= e!212017 e!212005)))

(declare-fun res!191371 () Bool)

(assert (=> b!345944 (= res!191371 call!26774)))

(assert (=> b!345944 (=> (not res!191371) (not e!212005))))

(assert (= (and d!71005 c!53057) b!345931))

(assert (= (and d!71005 (not c!53057)) b!345929))

(assert (= (and b!345929 c!53058) b!345936))

(assert (= (and b!345929 (not c!53058)) b!345940))

(assert (= (and b!345940 c!53056) b!345941))

(assert (= (and b!345940 (not c!53056)) b!345942))

(assert (= (or b!345941 b!345942) bm!26773))

(assert (= (or b!345936 bm!26773) bm!26772))

(assert (= (or b!345936 b!345941) bm!26775))

(assert (= (or b!345931 bm!26772) bm!26777))

(assert (= (or b!345931 bm!26775) bm!26771))

(assert (= (and d!71005 res!191369) b!345932))

(assert (= (and d!71005 c!53060) b!345927))

(assert (= (and d!71005 (not c!53060)) b!345930))

(assert (= (and d!71005 res!191368) b!345926))

(assert (= (and b!345926 res!191365) b!345924))

(assert (= (and b!345926 (not res!191370)) b!345938))

(assert (= (and b!345938 res!191372) b!345934))

(assert (= (and b!345926 res!191367) b!345943))

(assert (= (and b!345943 c!53055) b!345944))

(assert (= (and b!345943 (not c!53055)) b!345935))

(assert (= (and b!345944 res!191371) b!345939))

(assert (= (or b!345944 b!345935) bm!26774))

(assert (= (and b!345943 res!191366) b!345933))

(assert (= (and b!345933 c!53059) b!345925))

(assert (= (and b!345933 (not c!53059)) b!345937))

(assert (= (and b!345925 res!191364) b!345928))

(assert (= (or b!345925 b!345937) bm!26776))

(declare-fun b_lambda!8457 () Bool)

(assert (=> (not b_lambda!8457) (not b!345934)))

(declare-fun t!10135 () Bool)

(declare-fun tb!3075 () Bool)

(assert (=> (and start!34616 (= defaultEntry!1528 defaultEntry!1528) t!10135) tb!3075))

(declare-fun result!5571 () Bool)

(assert (=> tb!3075 (= result!5571 tp_is_empty!7429)))

(assert (=> b!345934 t!10135))

(declare-fun b_and!14673 () Bool)

(assert (= b_and!14667 (and (=> t!10135 result!5571) b_and!14673)))

(declare-fun m!346619 () Bool)

(assert (=> bm!26774 m!346619))

(declare-fun m!346621 () Bool)

(assert (=> b!345939 m!346621))

(declare-fun m!346623 () Bool)

(assert (=> b!345934 m!346623))

(declare-fun m!346625 () Bool)

(assert (=> b!345934 m!346625))

(assert (=> b!345934 m!346623))

(assert (=> b!345934 m!346625))

(declare-fun m!346627 () Bool)

(assert (=> b!345934 m!346627))

(assert (=> b!345934 m!346589))

(declare-fun m!346629 () Bool)

(assert (=> b!345934 m!346629))

(assert (=> b!345934 m!346589))

(declare-fun m!346631 () Bool)

(assert (=> b!345928 m!346631))

(assert (=> d!71005 m!346529))

(assert (=> b!345938 m!346589))

(assert (=> b!345938 m!346589))

(declare-fun m!346633 () Bool)

(assert (=> b!345938 m!346633))

(declare-fun m!346635 () Bool)

(assert (=> bm!26771 m!346635))

(declare-fun m!346637 () Bool)

(assert (=> b!345927 m!346637))

(declare-fun m!346639 () Bool)

(assert (=> b!345927 m!346639))

(declare-fun m!346641 () Bool)

(assert (=> b!345927 m!346641))

(assert (=> b!345927 m!346637))

(declare-fun m!346643 () Bool)

(assert (=> b!345927 m!346643))

(declare-fun m!346645 () Bool)

(assert (=> b!345927 m!346645))

(declare-fun m!346647 () Bool)

(assert (=> b!345927 m!346647))

(declare-fun m!346649 () Bool)

(assert (=> b!345927 m!346649))

(assert (=> b!345927 m!346647))

(declare-fun m!346651 () Bool)

(assert (=> b!345927 m!346651))

(declare-fun m!346653 () Bool)

(assert (=> b!345927 m!346653))

(assert (=> b!345927 m!346589))

(declare-fun m!346655 () Bool)

(assert (=> b!345927 m!346655))

(assert (=> b!345927 m!346643))

(declare-fun m!346657 () Bool)

(assert (=> b!345927 m!346657))

(declare-fun m!346659 () Bool)

(assert (=> b!345927 m!346659))

(assert (=> b!345927 m!346649))

(declare-fun m!346661 () Bool)

(assert (=> b!345927 m!346661))

(declare-fun m!346663 () Bool)

(assert (=> b!345927 m!346663))

(declare-fun m!346665 () Bool)

(assert (=> b!345927 m!346665))

(declare-fun m!346667 () Bool)

(assert (=> b!345927 m!346667))

(assert (=> bm!26777 m!346667))

(declare-fun m!346669 () Bool)

(assert (=> bm!26776 m!346669))

(assert (=> b!345932 m!346589))

(assert (=> b!345932 m!346589))

(assert (=> b!345932 m!346593))

(assert (=> b!345924 m!346589))

(assert (=> b!345924 m!346589))

(assert (=> b!345924 m!346593))

(declare-fun m!346671 () Bool)

(assert (=> b!345931 m!346671))

(assert (=> b!345765 d!71005))

(declare-fun b!345956 () Bool)

(declare-fun e!212026 () Bool)

(declare-fun call!26783 () Bool)

(assert (=> b!345956 (= e!212026 call!26783)))

(declare-fun b!345957 () Bool)

(declare-fun e!212024 () Bool)

(assert (=> b!345957 (= e!212024 call!26783)))

(declare-fun b!345955 () Bool)

(declare-fun e!212025 () Bool)

(assert (=> b!345955 (= e!212025 e!212026)))

(declare-fun c!53063 () Bool)

(assert (=> b!345955 (= c!53063 (validKeyInArray!0 (select (arr!8730 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71007 () Bool)

(declare-fun res!191377 () Bool)

(assert (=> d!71007 (=> res!191377 e!212025)))

(assert (=> d!71007 (= res!191377 (bvsge #b00000000000000000000000000000000 (size!9083 _keys!1895)))))

(assert (=> d!71007 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!212025)))

(declare-fun bm!26780 () Bool)

(assert (=> bm!26780 (= call!26783 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!345958 () Bool)

(assert (=> b!345958 (= e!212026 e!212024)))

(declare-fun lt!163039 () (_ BitVec 64))

(assert (=> b!345958 (= lt!163039 (select (arr!8730 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163041 () Unit!10722)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18435 (_ BitVec 64) (_ BitVec 32)) Unit!10722)

(assert (=> b!345958 (= lt!163041 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!163039 #b00000000000000000000000000000000))))

(assert (=> b!345958 (arrayContainsKey!0 _keys!1895 lt!163039 #b00000000000000000000000000000000)))

(declare-fun lt!163040 () Unit!10722)

(assert (=> b!345958 (= lt!163040 lt!163041)))

(declare-fun res!191378 () Bool)

(assert (=> b!345958 (= res!191378 (= (seekEntryOrOpen!0 (select (arr!8730 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3363 #b00000000000000000000000000000000)))))

(assert (=> b!345958 (=> (not res!191378) (not e!212024))))

(assert (= (and d!71007 (not res!191377)) b!345955))

(assert (= (and b!345955 c!53063) b!345958))

(assert (= (and b!345955 (not c!53063)) b!345956))

(assert (= (and b!345958 res!191378) b!345957))

(assert (= (or b!345957 b!345956) bm!26780))

(assert (=> b!345955 m!346589))

(assert (=> b!345955 m!346589))

(assert (=> b!345955 m!346593))

(declare-fun m!346673 () Bool)

(assert (=> bm!26780 m!346673))

(assert (=> b!345958 m!346589))

(declare-fun m!346675 () Bool)

(assert (=> b!345958 m!346675))

(declare-fun m!346677 () Bool)

(assert (=> b!345958 m!346677))

(assert (=> b!345958 m!346589))

(declare-fun m!346679 () Bool)

(assert (=> b!345958 m!346679))

(assert (=> b!345769 d!71007))

(declare-fun d!71009 () Bool)

(declare-fun res!191383 () Bool)

(declare-fun e!212031 () Bool)

(assert (=> d!71009 (=> res!191383 e!212031)))

(assert (=> d!71009 (= res!191383 (= (select (arr!8730 _keys!1895) (index!15632 lt!162939)) k0!1348))))

(assert (=> d!71009 (= (arrayContainsKey!0 _keys!1895 k0!1348 (index!15632 lt!162939)) e!212031)))

(declare-fun b!345963 () Bool)

(declare-fun e!212032 () Bool)

(assert (=> b!345963 (= e!212031 e!212032)))

(declare-fun res!191384 () Bool)

(assert (=> b!345963 (=> (not res!191384) (not e!212032))))

(assert (=> b!345963 (= res!191384 (bvslt (bvadd (index!15632 lt!162939) #b00000000000000000000000000000001) (size!9083 _keys!1895)))))

(declare-fun b!345964 () Bool)

(assert (=> b!345964 (= e!212032 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd (index!15632 lt!162939) #b00000000000000000000000000000001)))))

(assert (= (and d!71009 (not res!191383)) b!345963))

(assert (= (and b!345963 res!191384) b!345964))

(assert (=> d!71009 m!346525))

(declare-fun m!346681 () Bool)

(assert (=> b!345964 m!346681))

(assert (=> b!345766 d!71009))

(declare-fun d!71011 () Bool)

(assert (=> d!71011 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34616 d!71011))

(declare-fun d!71013 () Bool)

(assert (=> d!71013 (= (array_inv!6488 _values!1525) (bvsge (size!9084 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34616 d!71013))

(declare-fun d!71015 () Bool)

(assert (=> d!71015 (= (array_inv!6489 _keys!1895) (bvsge (size!9083 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34616 d!71015))

(declare-fun mapNonEmpty!12603 () Bool)

(declare-fun mapRes!12603 () Bool)

(declare-fun tp!26004 () Bool)

(declare-fun e!212037 () Bool)

(assert (=> mapNonEmpty!12603 (= mapRes!12603 (and tp!26004 e!212037))))

(declare-fun mapRest!12603 () (Array (_ BitVec 32) ValueCell!3371))

(declare-fun mapKey!12603 () (_ BitVec 32))

(declare-fun mapValue!12603 () ValueCell!3371)

(assert (=> mapNonEmpty!12603 (= mapRest!12594 (store mapRest!12603 mapKey!12603 mapValue!12603))))

(declare-fun condMapEmpty!12603 () Bool)

(declare-fun mapDefault!12603 () ValueCell!3371)

(assert (=> mapNonEmpty!12594 (= condMapEmpty!12603 (= mapRest!12594 ((as const (Array (_ BitVec 32) ValueCell!3371)) mapDefault!12603)))))

(declare-fun e!212038 () Bool)

(assert (=> mapNonEmpty!12594 (= tp!25988 (and e!212038 mapRes!12603))))

(declare-fun b!345971 () Bool)

(assert (=> b!345971 (= e!212037 tp_is_empty!7429)))

(declare-fun mapIsEmpty!12603 () Bool)

(assert (=> mapIsEmpty!12603 mapRes!12603))

(declare-fun b!345972 () Bool)

(assert (=> b!345972 (= e!212038 tp_is_empty!7429)))

(assert (= (and mapNonEmpty!12594 condMapEmpty!12603) mapIsEmpty!12603))

(assert (= (and mapNonEmpty!12594 (not condMapEmpty!12603)) mapNonEmpty!12603))

(assert (= (and mapNonEmpty!12603 ((_ is ValueCellFull!3371) mapValue!12603)) b!345971))

(assert (= (and mapNonEmpty!12594 ((_ is ValueCellFull!3371) mapDefault!12603)) b!345972))

(declare-fun m!346683 () Bool)

(assert (=> mapNonEmpty!12603 m!346683))

(declare-fun b_lambda!8459 () Bool)

(assert (= b_lambda!8457 (or (and start!34616 b_free!7477) b_lambda!8459)))

(check-sat (not mapNonEmpty!12603) (not bm!26776) (not bm!26756) (not bm!26780) (not bm!26771) (not d!71005) (not b!345938) (not bm!26774) (not b!345927) (not b!345955) (not b!345867) (not d!71003) (not b_next!7477) (not b!345928) tp_is_empty!7429 (not b!345934) (not b!345854) (not b!345879) (not b_lambda!8459) (not b!345931) (not b!345924) (not b!345939) b_and!14673 (not bm!26777) (not b!345852) (not d!70999) (not b!345958) (not b!345850) (not b!345964) (not b!345932) (not b!345881))
(check-sat b_and!14673 (not b_next!7477))
