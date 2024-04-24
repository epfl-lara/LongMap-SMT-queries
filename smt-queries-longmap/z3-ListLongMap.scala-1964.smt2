; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34516 () Bool)

(assert start!34516)

(declare-fun b_free!7453 () Bool)

(declare-fun b_next!7453 () Bool)

(assert (=> start!34516 (= b_free!7453 (not b_next!7453))))

(declare-fun tp!25904 () Bool)

(declare-fun b_and!14675 () Bool)

(assert (=> start!34516 (= tp!25904 b_and!14675)))

(declare-fun mapIsEmpty!12546 () Bool)

(declare-fun mapRes!12546 () Bool)

(assert (=> mapIsEmpty!12546 mapRes!12546))

(declare-fun res!190967 () Bool)

(declare-fun e!211519 () Bool)

(assert (=> start!34516 (=> (not res!190967) (not e!211519))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34516 (= res!190967 (validMask!0 mask!2385))))

(assert (=> start!34516 e!211519))

(assert (=> start!34516 true))

(declare-fun tp_is_empty!7405 () Bool)

(assert (=> start!34516 tp_is_empty!7405))

(assert (=> start!34516 tp!25904))

(declare-datatypes ((V!10851 0))(
  ( (V!10852 (val!3747 Int)) )
))
(declare-datatypes ((ValueCell!3359 0))(
  ( (ValueCellFull!3359 (v!5924 V!10851)) (EmptyCell!3359) )
))
(declare-datatypes ((array!18388 0))(
  ( (array!18389 (arr!8710 (Array (_ BitVec 32) ValueCell!3359)) (size!9062 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18388)

(declare-fun e!211520 () Bool)

(declare-fun array_inv!6436 (array!18388) Bool)

(assert (=> start!34516 (and (array_inv!6436 _values!1525) e!211520)))

(declare-datatypes ((array!18390 0))(
  ( (array!18391 (arr!8711 (Array (_ BitVec 32) (_ BitVec 64))) (size!9063 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18390)

(declare-fun array_inv!6437 (array!18390) Bool)

(assert (=> start!34516 (array_inv!6437 _keys!1895)))

(declare-fun b!345110 () Bool)

(declare-fun e!211518 () Bool)

(assert (=> b!345110 (= e!211518 tp_is_empty!7405)))

(declare-fun b!345111 () Bool)

(declare-fun res!190965 () Bool)

(assert (=> b!345111 (=> (not res!190965) (not e!211519))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!345111 (= res!190965 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12546 () Bool)

(declare-fun tp!25905 () Bool)

(declare-fun e!211516 () Bool)

(assert (=> mapNonEmpty!12546 (= mapRes!12546 (and tp!25905 e!211516))))

(declare-fun mapRest!12546 () (Array (_ BitVec 32) ValueCell!3359))

(declare-fun mapValue!12546 () ValueCell!3359)

(declare-fun mapKey!12546 () (_ BitVec 32))

(assert (=> mapNonEmpty!12546 (= (arr!8710 _values!1525) (store mapRest!12546 mapKey!12546 mapValue!12546))))

(declare-fun b!345112 () Bool)

(assert (=> b!345112 (= e!211516 tp_is_empty!7405)))

(declare-fun b!345113 () Bool)

(declare-fun res!190968 () Bool)

(assert (=> b!345113 (=> (not res!190968) (not e!211519))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!345113 (= res!190968 (and (= (size!9062 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9063 _keys!1895) (size!9062 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!345114 () Bool)

(declare-fun res!190966 () Bool)

(assert (=> b!345114 (=> (not res!190966) (not e!211519))))

(declare-datatypes ((List!4943 0))(
  ( (Nil!4940) (Cons!4939 (h!5795 (_ BitVec 64)) (t!10051 List!4943)) )
))
(declare-fun arrayNoDuplicates!0 (array!18390 (_ BitVec 32) List!4943) Bool)

(assert (=> b!345114 (= res!190966 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4940))))

(declare-fun b!345115 () Bool)

(declare-fun res!190969 () Bool)

(assert (=> b!345115 (=> (not res!190969) (not e!211519))))

(declare-fun zeroValue!1467 () V!10851)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10851)

(declare-datatypes ((tuple2!5338 0))(
  ( (tuple2!5339 (_1!2680 (_ BitVec 64)) (_2!2680 V!10851)) )
))
(declare-datatypes ((List!4944 0))(
  ( (Nil!4941) (Cons!4940 (h!5796 tuple2!5338) (t!10052 List!4944)) )
))
(declare-datatypes ((ListLongMap!4253 0))(
  ( (ListLongMap!4254 (toList!2142 List!4944)) )
))
(declare-fun contains!2219 (ListLongMap!4253 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1671 (array!18390 array!18388 (_ BitVec 32) (_ BitVec 32) V!10851 V!10851 (_ BitVec 32) Int) ListLongMap!4253)

(assert (=> b!345115 (= res!190969 (not (contains!2219 (getCurrentListMap!1671 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!345116 () Bool)

(declare-datatypes ((SeekEntryResult!3310 0))(
  ( (MissingZero!3310 (index!15419 (_ BitVec 32))) (Found!3310 (index!15420 (_ BitVec 32))) (Intermediate!3310 (undefined!4122 Bool) (index!15421 (_ BitVec 32)) (x!34341 (_ BitVec 32))) (Undefined!3310) (MissingVacant!3310 (index!15422 (_ BitVec 32))) )
))
(declare-fun lt!162772 () SeekEntryResult!3310)

(get-info :version)

(assert (=> b!345116 (= e!211519 (and ((_ is Found!3310) lt!162772) (not (= (select (arr!8711 _keys!1895) (index!15420 lt!162772)) k0!1348))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18390 (_ BitVec 32)) SeekEntryResult!3310)

(assert (=> b!345116 (= lt!162772 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!345117 () Bool)

(declare-fun res!190970 () Bool)

(assert (=> b!345117 (=> (not res!190970) (not e!211519))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18390 (_ BitVec 32)) Bool)

(assert (=> b!345117 (= res!190970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!345118 () Bool)

(assert (=> b!345118 (= e!211520 (and e!211518 mapRes!12546))))

(declare-fun condMapEmpty!12546 () Bool)

(declare-fun mapDefault!12546 () ValueCell!3359)

(assert (=> b!345118 (= condMapEmpty!12546 (= (arr!8710 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3359)) mapDefault!12546)))))

(assert (= (and start!34516 res!190967) b!345113))

(assert (= (and b!345113 res!190968) b!345117))

(assert (= (and b!345117 res!190970) b!345114))

(assert (= (and b!345114 res!190966) b!345111))

(assert (= (and b!345111 res!190965) b!345115))

(assert (= (and b!345115 res!190969) b!345116))

(assert (= (and b!345118 condMapEmpty!12546) mapIsEmpty!12546))

(assert (= (and b!345118 (not condMapEmpty!12546)) mapNonEmpty!12546))

(assert (= (and mapNonEmpty!12546 ((_ is ValueCellFull!3359) mapValue!12546)) b!345112))

(assert (= (and b!345118 ((_ is ValueCellFull!3359) mapDefault!12546)) b!345110))

(assert (= start!34516 b!345118))

(declare-fun m!346821 () Bool)

(assert (=> b!345117 m!346821))

(declare-fun m!346823 () Bool)

(assert (=> b!345111 m!346823))

(declare-fun m!346825 () Bool)

(assert (=> mapNonEmpty!12546 m!346825))

(declare-fun m!346827 () Bool)

(assert (=> start!34516 m!346827))

(declare-fun m!346829 () Bool)

(assert (=> start!34516 m!346829))

(declare-fun m!346831 () Bool)

(assert (=> start!34516 m!346831))

(declare-fun m!346833 () Bool)

(assert (=> b!345115 m!346833))

(assert (=> b!345115 m!346833))

(declare-fun m!346835 () Bool)

(assert (=> b!345115 m!346835))

(declare-fun m!346837 () Bool)

(assert (=> b!345114 m!346837))

(declare-fun m!346839 () Bool)

(assert (=> b!345116 m!346839))

(declare-fun m!346841 () Bool)

(assert (=> b!345116 m!346841))

(check-sat (not b!345111) (not b!345114) (not mapNonEmpty!12546) (not b!345116) (not b!345117) (not b_next!7453) (not b!345115) (not start!34516) tp_is_empty!7405 b_and!14675)
(check-sat b_and!14675 (not b_next!7453))
(get-model)

(declare-fun b!345185 () Bool)

(declare-fun e!211558 () SeekEntryResult!3310)

(declare-fun e!211559 () SeekEntryResult!3310)

(assert (=> b!345185 (= e!211558 e!211559)))

(declare-fun lt!162785 () (_ BitVec 64))

(declare-fun lt!162786 () SeekEntryResult!3310)

(assert (=> b!345185 (= lt!162785 (select (arr!8711 _keys!1895) (index!15421 lt!162786)))))

(declare-fun c!52940 () Bool)

(assert (=> b!345185 (= c!52940 (= lt!162785 k0!1348))))

(declare-fun b!345186 () Bool)

(assert (=> b!345186 (= e!211559 (Found!3310 (index!15421 lt!162786)))))

(declare-fun b!345187 () Bool)

(assert (=> b!345187 (= e!211558 Undefined!3310)))

(declare-fun d!71147 () Bool)

(declare-fun lt!162787 () SeekEntryResult!3310)

(assert (=> d!71147 (and (or ((_ is Undefined!3310) lt!162787) (not ((_ is Found!3310) lt!162787)) (and (bvsge (index!15420 lt!162787) #b00000000000000000000000000000000) (bvslt (index!15420 lt!162787) (size!9063 _keys!1895)))) (or ((_ is Undefined!3310) lt!162787) ((_ is Found!3310) lt!162787) (not ((_ is MissingZero!3310) lt!162787)) (and (bvsge (index!15419 lt!162787) #b00000000000000000000000000000000) (bvslt (index!15419 lt!162787) (size!9063 _keys!1895)))) (or ((_ is Undefined!3310) lt!162787) ((_ is Found!3310) lt!162787) ((_ is MissingZero!3310) lt!162787) (not ((_ is MissingVacant!3310) lt!162787)) (and (bvsge (index!15422 lt!162787) #b00000000000000000000000000000000) (bvslt (index!15422 lt!162787) (size!9063 _keys!1895)))) (or ((_ is Undefined!3310) lt!162787) (ite ((_ is Found!3310) lt!162787) (= (select (arr!8711 _keys!1895) (index!15420 lt!162787)) k0!1348) (ite ((_ is MissingZero!3310) lt!162787) (= (select (arr!8711 _keys!1895) (index!15419 lt!162787)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3310) lt!162787) (= (select (arr!8711 _keys!1895) (index!15422 lt!162787)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71147 (= lt!162787 e!211558)))

(declare-fun c!52939 () Bool)

(assert (=> d!71147 (= c!52939 (and ((_ is Intermediate!3310) lt!162786) (undefined!4122 lt!162786)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18390 (_ BitVec 32)) SeekEntryResult!3310)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71147 (= lt!162786 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71147 (validMask!0 mask!2385)))

(assert (=> d!71147 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!162787)))

(declare-fun b!345188 () Bool)

(declare-fun e!211557 () SeekEntryResult!3310)

(assert (=> b!345188 (= e!211557 (MissingZero!3310 (index!15421 lt!162786)))))

(declare-fun b!345189 () Bool)

(declare-fun c!52938 () Bool)

(assert (=> b!345189 (= c!52938 (= lt!162785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!345189 (= e!211559 e!211557)))

(declare-fun b!345190 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18390 (_ BitVec 32)) SeekEntryResult!3310)

(assert (=> b!345190 (= e!211557 (seekKeyOrZeroReturnVacant!0 (x!34341 lt!162786) (index!15421 lt!162786) (index!15421 lt!162786) k0!1348 _keys!1895 mask!2385))))

(assert (= (and d!71147 c!52939) b!345187))

(assert (= (and d!71147 (not c!52939)) b!345185))

(assert (= (and b!345185 c!52940) b!345186))

(assert (= (and b!345185 (not c!52940)) b!345189))

(assert (= (and b!345189 c!52938) b!345188))

(assert (= (and b!345189 (not c!52938)) b!345190))

(declare-fun m!346887 () Bool)

(assert (=> b!345185 m!346887))

(declare-fun m!346889 () Bool)

(assert (=> d!71147 m!346889))

(assert (=> d!71147 m!346827))

(declare-fun m!346891 () Bool)

(assert (=> d!71147 m!346891))

(declare-fun m!346893 () Bool)

(assert (=> d!71147 m!346893))

(declare-fun m!346895 () Bool)

(assert (=> d!71147 m!346895))

(assert (=> d!71147 m!346895))

(declare-fun m!346897 () Bool)

(assert (=> d!71147 m!346897))

(declare-fun m!346899 () Bool)

(assert (=> b!345190 m!346899))

(assert (=> b!345116 d!71147))

(declare-fun d!71149 () Bool)

(declare-fun e!211565 () Bool)

(assert (=> d!71149 e!211565))

(declare-fun res!191009 () Bool)

(assert (=> d!71149 (=> res!191009 e!211565)))

(declare-fun lt!162798 () Bool)

(assert (=> d!71149 (= res!191009 (not lt!162798))))

(declare-fun lt!162796 () Bool)

(assert (=> d!71149 (= lt!162798 lt!162796)))

(declare-datatypes ((Unit!10697 0))(
  ( (Unit!10698) )
))
(declare-fun lt!162799 () Unit!10697)

(declare-fun e!211564 () Unit!10697)

(assert (=> d!71149 (= lt!162799 e!211564)))

(declare-fun c!52943 () Bool)

(assert (=> d!71149 (= c!52943 lt!162796)))

(declare-fun containsKey!330 (List!4944 (_ BitVec 64)) Bool)

(assert (=> d!71149 (= lt!162796 (containsKey!330 (toList!2142 (getCurrentListMap!1671 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71149 (= (contains!2219 (getCurrentListMap!1671 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!162798)))

(declare-fun b!345197 () Bool)

(declare-fun lt!162797 () Unit!10697)

(assert (=> b!345197 (= e!211564 lt!162797)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!278 (List!4944 (_ BitVec 64)) Unit!10697)

(assert (=> b!345197 (= lt!162797 (lemmaContainsKeyImpliesGetValueByKeyDefined!278 (toList!2142 (getCurrentListMap!1671 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!345 0))(
  ( (Some!344 (v!5927 V!10851)) (None!343) )
))
(declare-fun isDefined!279 (Option!345) Bool)

(declare-fun getValueByKey!339 (List!4944 (_ BitVec 64)) Option!345)

(assert (=> b!345197 (isDefined!279 (getValueByKey!339 (toList!2142 (getCurrentListMap!1671 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!345198 () Bool)

(declare-fun Unit!10699 () Unit!10697)

(assert (=> b!345198 (= e!211564 Unit!10699)))

(declare-fun b!345199 () Bool)

(assert (=> b!345199 (= e!211565 (isDefined!279 (getValueByKey!339 (toList!2142 (getCurrentListMap!1671 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71149 c!52943) b!345197))

(assert (= (and d!71149 (not c!52943)) b!345198))

(assert (= (and d!71149 (not res!191009)) b!345199))

(declare-fun m!346901 () Bool)

(assert (=> d!71149 m!346901))

(declare-fun m!346903 () Bool)

(assert (=> b!345197 m!346903))

(declare-fun m!346905 () Bool)

(assert (=> b!345197 m!346905))

(assert (=> b!345197 m!346905))

(declare-fun m!346907 () Bool)

(assert (=> b!345197 m!346907))

(assert (=> b!345199 m!346905))

(assert (=> b!345199 m!346905))

(assert (=> b!345199 m!346907))

(assert (=> b!345115 d!71149))

(declare-fun b!345242 () Bool)

(declare-fun e!211597 () Bool)

(declare-fun e!211603 () Bool)

(assert (=> b!345242 (= e!211597 e!211603)))

(declare-fun res!191033 () Bool)

(declare-fun call!26678 () Bool)

(assert (=> b!345242 (= res!191033 call!26678)))

(assert (=> b!345242 (=> (not res!191033) (not e!211603))))

(declare-fun bm!26672 () Bool)

(declare-fun call!26681 () ListLongMap!4253)

(declare-fun call!26679 () ListLongMap!4253)

(assert (=> bm!26672 (= call!26681 call!26679)))

(declare-fun b!345243 () Bool)

(declare-fun e!211595 () Unit!10697)

(declare-fun lt!162862 () Unit!10697)

(assert (=> b!345243 (= e!211595 lt!162862)))

(declare-fun lt!162845 () ListLongMap!4253)

(declare-fun getCurrentListMapNoExtraKeys!596 (array!18390 array!18388 (_ BitVec 32) (_ BitVec 32) V!10851 V!10851 (_ BitVec 32) Int) ListLongMap!4253)

(assert (=> b!345243 (= lt!162845 (getCurrentListMapNoExtraKeys!596 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162853 () (_ BitVec 64))

(assert (=> b!345243 (= lt!162853 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162848 () (_ BitVec 64))

(assert (=> b!345243 (= lt!162848 (select (arr!8711 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162865 () Unit!10697)

(declare-fun addStillContains!256 (ListLongMap!4253 (_ BitVec 64) V!10851 (_ BitVec 64)) Unit!10697)

(assert (=> b!345243 (= lt!162865 (addStillContains!256 lt!162845 lt!162853 zeroValue!1467 lt!162848))))

(declare-fun +!731 (ListLongMap!4253 tuple2!5338) ListLongMap!4253)

(assert (=> b!345243 (contains!2219 (+!731 lt!162845 (tuple2!5339 lt!162853 zeroValue!1467)) lt!162848)))

(declare-fun lt!162860 () Unit!10697)

(assert (=> b!345243 (= lt!162860 lt!162865)))

(declare-fun lt!162847 () ListLongMap!4253)

(assert (=> b!345243 (= lt!162847 (getCurrentListMapNoExtraKeys!596 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162854 () (_ BitVec 64))

(assert (=> b!345243 (= lt!162854 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162856 () (_ BitVec 64))

(assert (=> b!345243 (= lt!162856 (select (arr!8711 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162851 () Unit!10697)

(declare-fun addApplyDifferent!256 (ListLongMap!4253 (_ BitVec 64) V!10851 (_ BitVec 64)) Unit!10697)

(assert (=> b!345243 (= lt!162851 (addApplyDifferent!256 lt!162847 lt!162854 minValue!1467 lt!162856))))

(declare-fun apply!280 (ListLongMap!4253 (_ BitVec 64)) V!10851)

(assert (=> b!345243 (= (apply!280 (+!731 lt!162847 (tuple2!5339 lt!162854 minValue!1467)) lt!162856) (apply!280 lt!162847 lt!162856))))

(declare-fun lt!162858 () Unit!10697)

(assert (=> b!345243 (= lt!162858 lt!162851)))

(declare-fun lt!162846 () ListLongMap!4253)

(assert (=> b!345243 (= lt!162846 (getCurrentListMapNoExtraKeys!596 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162849 () (_ BitVec 64))

(assert (=> b!345243 (= lt!162849 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162852 () (_ BitVec 64))

(assert (=> b!345243 (= lt!162852 (select (arr!8711 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162863 () Unit!10697)

(assert (=> b!345243 (= lt!162863 (addApplyDifferent!256 lt!162846 lt!162849 zeroValue!1467 lt!162852))))

(assert (=> b!345243 (= (apply!280 (+!731 lt!162846 (tuple2!5339 lt!162849 zeroValue!1467)) lt!162852) (apply!280 lt!162846 lt!162852))))

(declare-fun lt!162861 () Unit!10697)

(assert (=> b!345243 (= lt!162861 lt!162863)))

(declare-fun lt!162855 () ListLongMap!4253)

(assert (=> b!345243 (= lt!162855 (getCurrentListMapNoExtraKeys!596 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162864 () (_ BitVec 64))

(assert (=> b!345243 (= lt!162864 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162857 () (_ BitVec 64))

(assert (=> b!345243 (= lt!162857 (select (arr!8711 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!345243 (= lt!162862 (addApplyDifferent!256 lt!162855 lt!162864 minValue!1467 lt!162857))))

(assert (=> b!345243 (= (apply!280 (+!731 lt!162855 (tuple2!5339 lt!162864 minValue!1467)) lt!162857) (apply!280 lt!162855 lt!162857))))

(declare-fun b!345244 () Bool)

(assert (=> b!345244 (= e!211597 (not call!26678))))

(declare-fun b!345245 () Bool)

(declare-fun e!211601 () ListLongMap!4253)

(declare-fun call!26675 () ListLongMap!4253)

(assert (=> b!345245 (= e!211601 call!26675)))

(declare-fun b!345246 () Bool)

(declare-fun Unit!10700 () Unit!10697)

(assert (=> b!345246 (= e!211595 Unit!10700)))

(declare-fun b!345247 () Bool)

(declare-fun e!211599 () ListLongMap!4253)

(declare-fun call!26680 () ListLongMap!4253)

(assert (=> b!345247 (= e!211599 (+!731 call!26680 (tuple2!5339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!345248 () Bool)

(declare-fun e!211592 () Bool)

(assert (=> b!345248 (= e!211592 (validKeyInArray!0 (select (arr!8711 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345249 () Bool)

(declare-fun e!211602 () Bool)

(declare-fun lt!162859 () ListLongMap!4253)

(assert (=> b!345249 (= e!211602 (= (apply!280 lt!162859 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!345250 () Bool)

(declare-fun e!211604 () Bool)

(declare-fun e!211596 () Bool)

(assert (=> b!345250 (= e!211604 e!211596)))

(declare-fun c!52958 () Bool)

(assert (=> b!345250 (= c!52958 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!345251 () Bool)

(assert (=> b!345251 (= e!211603 (= (apply!280 lt!162859 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun e!211600 () Bool)

(declare-fun b!345252 () Bool)

(declare-fun get!4700 (ValueCell!3359 V!10851) V!10851)

(declare-fun dynLambda!623 (Int (_ BitVec 64)) V!10851)

(assert (=> b!345252 (= e!211600 (= (apply!280 lt!162859 (select (arr!8711 _keys!1895) #b00000000000000000000000000000000)) (get!4700 (select (arr!8710 _values!1525) #b00000000000000000000000000000000) (dynLambda!623 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!345252 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9062 _values!1525)))))

(assert (=> b!345252 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9063 _keys!1895)))))

(declare-fun b!345253 () Bool)

(declare-fun e!211593 () Bool)

(assert (=> b!345253 (= e!211593 (validKeyInArray!0 (select (arr!8711 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345254 () Bool)

(assert (=> b!345254 (= e!211599 e!211601)))

(declare-fun c!52961 () Bool)

(assert (=> b!345254 (= c!52961 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!345255 () Bool)

(declare-fun res!191034 () Bool)

(assert (=> b!345255 (=> (not res!191034) (not e!211604))))

(assert (=> b!345255 (= res!191034 e!211597)))

(declare-fun c!52956 () Bool)

(assert (=> b!345255 (= c!52956 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!71151 () Bool)

(assert (=> d!71151 e!211604))

(declare-fun res!191036 () Bool)

(assert (=> d!71151 (=> (not res!191036) (not e!211604))))

(assert (=> d!71151 (= res!191036 (or (bvsge #b00000000000000000000000000000000 (size!9063 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9063 _keys!1895)))))))

(declare-fun lt!162850 () ListLongMap!4253)

(assert (=> d!71151 (= lt!162859 lt!162850)))

(declare-fun lt!162844 () Unit!10697)

(assert (=> d!71151 (= lt!162844 e!211595)))

(declare-fun c!52957 () Bool)

(assert (=> d!71151 (= c!52957 e!211593)))

(declare-fun res!191029 () Bool)

(assert (=> d!71151 (=> (not res!191029) (not e!211593))))

(assert (=> d!71151 (= res!191029 (bvslt #b00000000000000000000000000000000 (size!9063 _keys!1895)))))

(assert (=> d!71151 (= lt!162850 e!211599)))

(declare-fun c!52960 () Bool)

(assert (=> d!71151 (= c!52960 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71151 (validMask!0 mask!2385)))

(assert (=> d!71151 (= (getCurrentListMap!1671 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!162859)))

(declare-fun bm!26673 () Bool)

(assert (=> bm!26673 (= call!26678 (contains!2219 lt!162859 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!345256 () Bool)

(declare-fun call!26676 () Bool)

(assert (=> b!345256 (= e!211596 (not call!26676))))

(declare-fun b!345257 () Bool)

(declare-fun e!211598 () Bool)

(assert (=> b!345257 (= e!211598 e!211600)))

(declare-fun res!191028 () Bool)

(assert (=> b!345257 (=> (not res!191028) (not e!211600))))

(assert (=> b!345257 (= res!191028 (contains!2219 lt!162859 (select (arr!8711 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!345257 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9063 _keys!1895)))))

(declare-fun b!345258 () Bool)

(declare-fun c!52959 () Bool)

(assert (=> b!345258 (= c!52959 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!211594 () ListLongMap!4253)

(assert (=> b!345258 (= e!211601 e!211594)))

(declare-fun b!345259 () Bool)

(assert (=> b!345259 (= e!211596 e!211602)))

(declare-fun res!191031 () Bool)

(assert (=> b!345259 (= res!191031 call!26676)))

(assert (=> b!345259 (=> (not res!191031) (not e!211602))))

(declare-fun bm!26674 () Bool)

(assert (=> bm!26674 (= call!26676 (contains!2219 lt!162859 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26675 () Bool)

(declare-fun call!26677 () ListLongMap!4253)

(assert (=> bm!26675 (= call!26679 call!26677)))

(declare-fun b!345260 () Bool)

(assert (=> b!345260 (= e!211594 call!26681)))

(declare-fun b!345261 () Bool)

(declare-fun res!191032 () Bool)

(assert (=> b!345261 (=> (not res!191032) (not e!211604))))

(assert (=> b!345261 (= res!191032 e!211598)))

(declare-fun res!191035 () Bool)

(assert (=> b!345261 (=> res!191035 e!211598)))

(assert (=> b!345261 (= res!191035 (not e!211592))))

(declare-fun res!191030 () Bool)

(assert (=> b!345261 (=> (not res!191030) (not e!211592))))

(assert (=> b!345261 (= res!191030 (bvslt #b00000000000000000000000000000000 (size!9063 _keys!1895)))))

(declare-fun bm!26676 () Bool)

(assert (=> bm!26676 (= call!26675 call!26680)))

(declare-fun bm!26677 () Bool)

(assert (=> bm!26677 (= call!26677 (getCurrentListMapNoExtraKeys!596 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun bm!26678 () Bool)

(assert (=> bm!26678 (= call!26680 (+!731 (ite c!52960 call!26677 (ite c!52961 call!26679 call!26681)) (ite (or c!52960 c!52961) (tuple2!5339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!345262 () Bool)

(assert (=> b!345262 (= e!211594 call!26675)))

(assert (= (and d!71151 c!52960) b!345247))

(assert (= (and d!71151 (not c!52960)) b!345254))

(assert (= (and b!345254 c!52961) b!345245))

(assert (= (and b!345254 (not c!52961)) b!345258))

(assert (= (and b!345258 c!52959) b!345262))

(assert (= (and b!345258 (not c!52959)) b!345260))

(assert (= (or b!345262 b!345260) bm!26672))

(assert (= (or b!345245 bm!26672) bm!26675))

(assert (= (or b!345245 b!345262) bm!26676))

(assert (= (or b!345247 bm!26675) bm!26677))

(assert (= (or b!345247 bm!26676) bm!26678))

(assert (= (and d!71151 res!191029) b!345253))

(assert (= (and d!71151 c!52957) b!345243))

(assert (= (and d!71151 (not c!52957)) b!345246))

(assert (= (and d!71151 res!191036) b!345261))

(assert (= (and b!345261 res!191030) b!345248))

(assert (= (and b!345261 (not res!191035)) b!345257))

(assert (= (and b!345257 res!191028) b!345252))

(assert (= (and b!345261 res!191032) b!345255))

(assert (= (and b!345255 c!52956) b!345242))

(assert (= (and b!345255 (not c!52956)) b!345244))

(assert (= (and b!345242 res!191033) b!345251))

(assert (= (or b!345242 b!345244) bm!26673))

(assert (= (and b!345255 res!191034) b!345250))

(assert (= (and b!345250 c!52958) b!345259))

(assert (= (and b!345250 (not c!52958)) b!345256))

(assert (= (and b!345259 res!191031) b!345249))

(assert (= (or b!345259 b!345256) bm!26674))

(declare-fun b_lambda!8481 () Bool)

(assert (=> (not b_lambda!8481) (not b!345252)))

(declare-fun t!10058 () Bool)

(declare-fun tb!3067 () Bool)

(assert (=> (and start!34516 (= defaultEntry!1528 defaultEntry!1528) t!10058) tb!3067))

(declare-fun result!5547 () Bool)

(assert (=> tb!3067 (= result!5547 tp_is_empty!7405)))

(assert (=> b!345252 t!10058))

(declare-fun b_and!14681 () Bool)

(assert (= b_and!14675 (and (=> t!10058 result!5547) b_and!14681)))

(declare-fun m!346909 () Bool)

(assert (=> b!345257 m!346909))

(assert (=> b!345257 m!346909))

(declare-fun m!346911 () Bool)

(assert (=> b!345257 m!346911))

(assert (=> d!71151 m!346827))

(declare-fun m!346913 () Bool)

(assert (=> b!345243 m!346913))

(declare-fun m!346915 () Bool)

(assert (=> b!345243 m!346915))

(declare-fun m!346917 () Bool)

(assert (=> b!345243 m!346917))

(assert (=> b!345243 m!346915))

(declare-fun m!346919 () Bool)

(assert (=> b!345243 m!346919))

(declare-fun m!346921 () Bool)

(assert (=> b!345243 m!346921))

(declare-fun m!346923 () Bool)

(assert (=> b!345243 m!346923))

(declare-fun m!346925 () Bool)

(assert (=> b!345243 m!346925))

(declare-fun m!346927 () Bool)

(assert (=> b!345243 m!346927))

(declare-fun m!346929 () Bool)

(assert (=> b!345243 m!346929))

(declare-fun m!346931 () Bool)

(assert (=> b!345243 m!346931))

(declare-fun m!346933 () Bool)

(assert (=> b!345243 m!346933))

(declare-fun m!346935 () Bool)

(assert (=> b!345243 m!346935))

(declare-fun m!346937 () Bool)

(assert (=> b!345243 m!346937))

(assert (=> b!345243 m!346935))

(assert (=> b!345243 m!346909))

(assert (=> b!345243 m!346929))

(declare-fun m!346939 () Bool)

(assert (=> b!345243 m!346939))

(declare-fun m!346941 () Bool)

(assert (=> b!345243 m!346941))

(declare-fun m!346943 () Bool)

(assert (=> b!345243 m!346943))

(assert (=> b!345243 m!346921))

(assert (=> b!345248 m!346909))

(assert (=> b!345248 m!346909))

(declare-fun m!346945 () Bool)

(assert (=> b!345248 m!346945))

(assert (=> bm!26677 m!346941))

(declare-fun m!346947 () Bool)

(assert (=> bm!26678 m!346947))

(assert (=> b!345253 m!346909))

(assert (=> b!345253 m!346909))

(assert (=> b!345253 m!346945))

(declare-fun m!346949 () Bool)

(assert (=> bm!26673 m!346949))

(declare-fun m!346951 () Bool)

(assert (=> b!345247 m!346951))

(declare-fun m!346953 () Bool)

(assert (=> bm!26674 m!346953))

(declare-fun m!346955 () Bool)

(assert (=> b!345249 m!346955))

(assert (=> b!345252 m!346909))

(declare-fun m!346957 () Bool)

(assert (=> b!345252 m!346957))

(declare-fun m!346959 () Bool)

(assert (=> b!345252 m!346959))

(assert (=> b!345252 m!346909))

(declare-fun m!346961 () Bool)

(assert (=> b!345252 m!346961))

(assert (=> b!345252 m!346959))

(declare-fun m!346963 () Bool)

(assert (=> b!345252 m!346963))

(assert (=> b!345252 m!346961))

(declare-fun m!346965 () Bool)

(assert (=> b!345251 m!346965))

(assert (=> b!345115 d!71151))

(declare-fun d!71153 () Bool)

(assert (=> d!71153 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!345111 d!71153))

(declare-fun d!71155 () Bool)

(assert (=> d!71155 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34516 d!71155))

(declare-fun d!71157 () Bool)

(assert (=> d!71157 (= (array_inv!6436 _values!1525) (bvsge (size!9062 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34516 d!71157))

(declare-fun d!71159 () Bool)

(assert (=> d!71159 (= (array_inv!6437 _keys!1895) (bvsge (size!9063 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34516 d!71159))

(declare-fun b!345275 () Bool)

(declare-fun e!211613 () Bool)

(declare-fun e!211614 () Bool)

(assert (=> b!345275 (= e!211613 e!211614)))

(declare-fun res!191044 () Bool)

(assert (=> b!345275 (=> (not res!191044) (not e!211614))))

(declare-fun e!211616 () Bool)

(assert (=> b!345275 (= res!191044 (not e!211616))))

(declare-fun res!191045 () Bool)

(assert (=> b!345275 (=> (not res!191045) (not e!211616))))

(assert (=> b!345275 (= res!191045 (validKeyInArray!0 (select (arr!8711 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71161 () Bool)

(declare-fun res!191043 () Bool)

(assert (=> d!71161 (=> res!191043 e!211613)))

(assert (=> d!71161 (= res!191043 (bvsge #b00000000000000000000000000000000 (size!9063 _keys!1895)))))

(assert (=> d!71161 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4940) e!211613)))

(declare-fun b!345276 () Bool)

(declare-fun e!211615 () Bool)

(assert (=> b!345276 (= e!211614 e!211615)))

(declare-fun c!52964 () Bool)

(assert (=> b!345276 (= c!52964 (validKeyInArray!0 (select (arr!8711 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345277 () Bool)

(declare-fun call!26684 () Bool)

(assert (=> b!345277 (= e!211615 call!26684)))

(declare-fun b!345278 () Bool)

(assert (=> b!345278 (= e!211615 call!26684)))

(declare-fun bm!26681 () Bool)

(assert (=> bm!26681 (= call!26684 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52964 (Cons!4939 (select (arr!8711 _keys!1895) #b00000000000000000000000000000000) Nil!4940) Nil!4940)))))

(declare-fun b!345279 () Bool)

(declare-fun contains!2222 (List!4943 (_ BitVec 64)) Bool)

(assert (=> b!345279 (= e!211616 (contains!2222 Nil!4940 (select (arr!8711 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71161 (not res!191043)) b!345275))

(assert (= (and b!345275 res!191045) b!345279))

(assert (= (and b!345275 res!191044) b!345276))

(assert (= (and b!345276 c!52964) b!345278))

(assert (= (and b!345276 (not c!52964)) b!345277))

(assert (= (or b!345278 b!345277) bm!26681))

(assert (=> b!345275 m!346909))

(assert (=> b!345275 m!346909))

(assert (=> b!345275 m!346945))

(assert (=> b!345276 m!346909))

(assert (=> b!345276 m!346909))

(assert (=> b!345276 m!346945))

(assert (=> bm!26681 m!346909))

(declare-fun m!346967 () Bool)

(assert (=> bm!26681 m!346967))

(assert (=> b!345279 m!346909))

(assert (=> b!345279 m!346909))

(declare-fun m!346969 () Bool)

(assert (=> b!345279 m!346969))

(assert (=> b!345114 d!71161))

(declare-fun b!345288 () Bool)

(declare-fun e!211624 () Bool)

(declare-fun call!26687 () Bool)

(assert (=> b!345288 (= e!211624 call!26687)))

(declare-fun b!345289 () Bool)

(declare-fun e!211623 () Bool)

(assert (=> b!345289 (= e!211623 call!26687)))

(declare-fun b!345290 () Bool)

(assert (=> b!345290 (= e!211624 e!211623)))

(declare-fun lt!162874 () (_ BitVec 64))

(assert (=> b!345290 (= lt!162874 (select (arr!8711 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162872 () Unit!10697)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18390 (_ BitVec 64) (_ BitVec 32)) Unit!10697)

(assert (=> b!345290 (= lt!162872 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!162874 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!18390 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!345290 (arrayContainsKey!0 _keys!1895 lt!162874 #b00000000000000000000000000000000)))

(declare-fun lt!162873 () Unit!10697)

(assert (=> b!345290 (= lt!162873 lt!162872)))

(declare-fun res!191051 () Bool)

(assert (=> b!345290 (= res!191051 (= (seekEntryOrOpen!0 (select (arr!8711 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3310 #b00000000000000000000000000000000)))))

(assert (=> b!345290 (=> (not res!191051) (not e!211623))))

(declare-fun b!345291 () Bool)

(declare-fun e!211625 () Bool)

(assert (=> b!345291 (= e!211625 e!211624)))

(declare-fun c!52967 () Bool)

(assert (=> b!345291 (= c!52967 (validKeyInArray!0 (select (arr!8711 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26684 () Bool)

(assert (=> bm!26684 (= call!26687 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun d!71163 () Bool)

(declare-fun res!191050 () Bool)

(assert (=> d!71163 (=> res!191050 e!211625)))

(assert (=> d!71163 (= res!191050 (bvsge #b00000000000000000000000000000000 (size!9063 _keys!1895)))))

(assert (=> d!71163 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!211625)))

(assert (= (and d!71163 (not res!191050)) b!345291))

(assert (= (and b!345291 c!52967) b!345290))

(assert (= (and b!345291 (not c!52967)) b!345288))

(assert (= (and b!345290 res!191051) b!345289))

(assert (= (or b!345289 b!345288) bm!26684))

(assert (=> b!345290 m!346909))

(declare-fun m!346971 () Bool)

(assert (=> b!345290 m!346971))

(declare-fun m!346973 () Bool)

(assert (=> b!345290 m!346973))

(assert (=> b!345290 m!346909))

(declare-fun m!346975 () Bool)

(assert (=> b!345290 m!346975))

(assert (=> b!345291 m!346909))

(assert (=> b!345291 m!346909))

(assert (=> b!345291 m!346945))

(declare-fun m!346977 () Bool)

(assert (=> bm!26684 m!346977))

(assert (=> b!345117 d!71163))

(declare-fun b!345298 () Bool)

(declare-fun e!211630 () Bool)

(assert (=> b!345298 (= e!211630 tp_is_empty!7405)))

(declare-fun b!345299 () Bool)

(declare-fun e!211631 () Bool)

(assert (=> b!345299 (= e!211631 tp_is_empty!7405)))

(declare-fun mapNonEmpty!12555 () Bool)

(declare-fun mapRes!12555 () Bool)

(declare-fun tp!25920 () Bool)

(assert (=> mapNonEmpty!12555 (= mapRes!12555 (and tp!25920 e!211630))))

(declare-fun mapValue!12555 () ValueCell!3359)

(declare-fun mapRest!12555 () (Array (_ BitVec 32) ValueCell!3359))

(declare-fun mapKey!12555 () (_ BitVec 32))

(assert (=> mapNonEmpty!12555 (= mapRest!12546 (store mapRest!12555 mapKey!12555 mapValue!12555))))

(declare-fun mapIsEmpty!12555 () Bool)

(assert (=> mapIsEmpty!12555 mapRes!12555))

(declare-fun condMapEmpty!12555 () Bool)

(declare-fun mapDefault!12555 () ValueCell!3359)

(assert (=> mapNonEmpty!12546 (= condMapEmpty!12555 (= mapRest!12546 ((as const (Array (_ BitVec 32) ValueCell!3359)) mapDefault!12555)))))

(assert (=> mapNonEmpty!12546 (= tp!25905 (and e!211631 mapRes!12555))))

(assert (= (and mapNonEmpty!12546 condMapEmpty!12555) mapIsEmpty!12555))

(assert (= (and mapNonEmpty!12546 (not condMapEmpty!12555)) mapNonEmpty!12555))

(assert (= (and mapNonEmpty!12555 ((_ is ValueCellFull!3359) mapValue!12555)) b!345298))

(assert (= (and mapNonEmpty!12546 ((_ is ValueCellFull!3359) mapDefault!12555)) b!345299))

(declare-fun m!346979 () Bool)

(assert (=> mapNonEmpty!12555 m!346979))

(declare-fun b_lambda!8483 () Bool)

(assert (= b_lambda!8481 (or (and start!34516 b_free!7453) b_lambda!8483)))

(check-sat (not bm!26677) (not b!345275) (not bm!26673) b_and!14681 (not b!345248) (not b!345247) (not mapNonEmpty!12555) (not b_next!7453) (not bm!26684) (not b!345197) tp_is_empty!7405 (not b!345291) (not b!345252) (not bm!26681) (not b!345276) (not bm!26674) (not bm!26678) (not d!71149) (not b!345199) (not d!71147) (not b_lambda!8483) (not b!345253) (not b!345251) (not b!345257) (not b!345279) (not b!345190) (not b!345243) (not b!345249) (not b!345290) (not d!71151))
(check-sat b_and!14681 (not b_next!7453))
