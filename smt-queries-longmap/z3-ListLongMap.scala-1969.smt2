; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34642 () Bool)

(assert start!34642)

(declare-fun b_free!7483 () Bool)

(declare-fun b_next!7483 () Bool)

(assert (=> start!34642 (= b_free!7483 (not b_next!7483))))

(declare-fun tp!26009 () Bool)

(declare-fun b_and!14675 () Bool)

(assert (=> start!34642 (= tp!26009 b_and!14675)))

(declare-fun b!345995 () Bool)

(declare-fun e!212055 () Bool)

(declare-fun e!212051 () Bool)

(declare-fun mapRes!12606 () Bool)

(assert (=> b!345995 (= e!212055 (and e!212051 mapRes!12606))))

(declare-fun condMapEmpty!12606 () Bool)

(declare-datatypes ((V!10891 0))(
  ( (V!10892 (val!3762 Int)) )
))
(declare-datatypes ((ValueCell!3374 0))(
  ( (ValueCellFull!3374 (v!5937 V!10891)) (EmptyCell!3374) )
))
(declare-datatypes ((array!18447 0))(
  ( (array!18448 (arr!8735 (Array (_ BitVec 32) ValueCell!3374)) (size!9088 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18447)

(declare-fun mapDefault!12606 () ValueCell!3374)

(assert (=> b!345995 (= condMapEmpty!12606 (= (arr!8735 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3374)) mapDefault!12606)))))

(declare-fun b!345996 () Bool)

(declare-fun res!191405 () Bool)

(declare-fun e!212056 () Bool)

(assert (=> b!345996 (=> (not res!191405) (not e!212056))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!345996 (= res!191405 (validKeyInArray!0 k0!1348))))

(declare-fun b!345997 () Bool)

(declare-fun res!191407 () Bool)

(assert (=> b!345997 (=> (not res!191407) (not e!212056))))

(declare-datatypes ((array!18449 0))(
  ( (array!18450 (arr!8736 (Array (_ BitVec 32) (_ BitVec 64))) (size!9089 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18449)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18449 (_ BitVec 32)) Bool)

(assert (=> b!345997 (= res!191407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!345998 () Bool)

(declare-fun res!191403 () Bool)

(assert (=> b!345998 (=> (not res!191403) (not e!212056))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!345998 (= res!191403 (and (= (size!9088 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9089 _keys!1895) (size!9088 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!345999 () Bool)

(declare-fun e!212052 () Bool)

(declare-fun tp_is_empty!7435 () Bool)

(assert (=> b!345999 (= e!212052 tp_is_empty!7435)))

(declare-fun b!346000 () Bool)

(declare-fun res!191408 () Bool)

(declare-fun e!212053 () Bool)

(assert (=> b!346000 (=> (not res!191408) (not e!212053))))

(declare-datatypes ((SeekEntryResult!3365 0))(
  ( (MissingZero!3365 (index!15639 (_ BitVec 32))) (Found!3365 (index!15640 (_ BitVec 32))) (Intermediate!3365 (undefined!4177 Bool) (index!15641 (_ BitVec 32)) (x!34484 (_ BitVec 32))) (Undefined!3365) (MissingVacant!3365 (index!15642 (_ BitVec 32))) )
))
(declare-fun lt!163044 () SeekEntryResult!3365)

(declare-fun arrayContainsKey!0 (array!18449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346000 (= res!191408 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15640 lt!163044)))))

(declare-fun b!346001 () Bool)

(declare-fun res!191401 () Bool)

(assert (=> b!346001 (=> (not res!191401) (not e!212056))))

(declare-datatypes ((List!5019 0))(
  ( (Nil!5016) (Cons!5015 (h!5871 (_ BitVec 64)) (t!10136 List!5019)) )
))
(declare-fun arrayNoDuplicates!0 (array!18449 (_ BitVec 32) List!5019) Bool)

(assert (=> b!346001 (= res!191401 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5016))))

(declare-fun b!346002 () Bool)

(assert (=> b!346002 (= e!212051 tp_is_empty!7435)))

(declare-fun b!346003 () Bool)

(assert (=> b!346003 (= e!212053 (and (bvsge (index!15640 lt!163044) #b00000000000000000000000000000000) (bvslt (index!15640 lt!163044) (size!9089 _keys!1895)) (bvsge (size!9089 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!12606 () Bool)

(assert (=> mapIsEmpty!12606 mapRes!12606))

(declare-fun res!191404 () Bool)

(assert (=> start!34642 (=> (not res!191404) (not e!212056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34642 (= res!191404 (validMask!0 mask!2385))))

(assert (=> start!34642 e!212056))

(assert (=> start!34642 true))

(assert (=> start!34642 tp_is_empty!7435))

(assert (=> start!34642 tp!26009))

(declare-fun array_inv!6490 (array!18447) Bool)

(assert (=> start!34642 (and (array_inv!6490 _values!1525) e!212055)))

(declare-fun array_inv!6491 (array!18449) Bool)

(assert (=> start!34642 (array_inv!6491 _keys!1895)))

(declare-fun b!346004 () Bool)

(declare-fun res!191402 () Bool)

(assert (=> b!346004 (=> (not res!191402) (not e!212056))))

(declare-fun zeroValue!1467 () V!10891)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10891)

(declare-datatypes ((tuple2!5402 0))(
  ( (tuple2!5403 (_1!2712 (_ BitVec 64)) (_2!2712 V!10891)) )
))
(declare-datatypes ((List!5020 0))(
  ( (Nil!5017) (Cons!5016 (h!5872 tuple2!5402) (t!10137 List!5020)) )
))
(declare-datatypes ((ListLongMap!4305 0))(
  ( (ListLongMap!4306 (toList!2168 List!5020)) )
))
(declare-fun contains!2242 (ListLongMap!4305 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1674 (array!18449 array!18447 (_ BitVec 32) (_ BitVec 32) V!10891 V!10891 (_ BitVec 32) Int) ListLongMap!4305)

(assert (=> b!346004 (= res!191402 (not (contains!2242 (getCurrentListMap!1674 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!346005 () Bool)

(assert (=> b!346005 (= e!212056 e!212053)))

(declare-fun res!191406 () Bool)

(assert (=> b!346005 (=> (not res!191406) (not e!212053))))

(get-info :version)

(assert (=> b!346005 (= res!191406 (and ((_ is Found!3365) lt!163044) (= (select (arr!8736 _keys!1895) (index!15640 lt!163044)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18449 (_ BitVec 32)) SeekEntryResult!3365)

(assert (=> b!346005 (= lt!163044 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12606 () Bool)

(declare-fun tp!26010 () Bool)

(assert (=> mapNonEmpty!12606 (= mapRes!12606 (and tp!26010 e!212052))))

(declare-fun mapValue!12606 () ValueCell!3374)

(declare-fun mapRest!12606 () (Array (_ BitVec 32) ValueCell!3374))

(declare-fun mapKey!12606 () (_ BitVec 32))

(assert (=> mapNonEmpty!12606 (= (arr!8735 _values!1525) (store mapRest!12606 mapKey!12606 mapValue!12606))))

(assert (= (and start!34642 res!191404) b!345998))

(assert (= (and b!345998 res!191403) b!345997))

(assert (= (and b!345997 res!191407) b!346001))

(assert (= (and b!346001 res!191401) b!345996))

(assert (= (and b!345996 res!191405) b!346004))

(assert (= (and b!346004 res!191402) b!346005))

(assert (= (and b!346005 res!191406) b!346000))

(assert (= (and b!346000 res!191408) b!346003))

(assert (= (and b!345995 condMapEmpty!12606) mapIsEmpty!12606))

(assert (= (and b!345995 (not condMapEmpty!12606)) mapNonEmpty!12606))

(assert (= (and mapNonEmpty!12606 ((_ is ValueCellFull!3374) mapValue!12606)) b!345999))

(assert (= (and b!345995 ((_ is ValueCellFull!3374) mapDefault!12606)) b!346002))

(assert (= start!34642 b!345995))

(declare-fun m!346685 () Bool)

(assert (=> b!345997 m!346685))

(declare-fun m!346687 () Bool)

(assert (=> mapNonEmpty!12606 m!346687))

(declare-fun m!346689 () Bool)

(assert (=> b!346004 m!346689))

(assert (=> b!346004 m!346689))

(declare-fun m!346691 () Bool)

(assert (=> b!346004 m!346691))

(declare-fun m!346693 () Bool)

(assert (=> start!34642 m!346693))

(declare-fun m!346695 () Bool)

(assert (=> start!34642 m!346695))

(declare-fun m!346697 () Bool)

(assert (=> start!34642 m!346697))

(declare-fun m!346699 () Bool)

(assert (=> b!346000 m!346699))

(declare-fun m!346701 () Bool)

(assert (=> b!345996 m!346701))

(declare-fun m!346703 () Bool)

(assert (=> b!346005 m!346703))

(declare-fun m!346705 () Bool)

(assert (=> b!346005 m!346705))

(declare-fun m!346707 () Bool)

(assert (=> b!346001 m!346707))

(check-sat (not b!346000) (not b!345996) (not b!345997) tp_is_empty!7435 (not b!346001) (not mapNonEmpty!12606) b_and!14675 (not b!346005) (not b_next!7483) (not b!346004) (not start!34642))
(check-sat b_and!14675 (not b_next!7483))
(get-model)

(declare-fun d!71019 () Bool)

(assert (=> d!71019 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!345996 d!71019))

(declare-fun bm!26783 () Bool)

(declare-fun call!26786 () Bool)

(declare-fun c!53066 () Bool)

(assert (=> bm!26783 (= call!26786 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53066 (Cons!5015 (select (arr!8736 _keys!1895) #b00000000000000000000000000000000) Nil!5016) Nil!5016)))))

(declare-fun b!346083 () Bool)

(declare-fun e!212103 () Bool)

(declare-fun contains!2245 (List!5019 (_ BitVec 64)) Bool)

(assert (=> b!346083 (= e!212103 (contains!2245 Nil!5016 (select (arr!8736 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!346084 () Bool)

(declare-fun e!212102 () Bool)

(declare-fun e!212101 () Bool)

(assert (=> b!346084 (= e!212102 e!212101)))

(assert (=> b!346084 (= c!53066 (validKeyInArray!0 (select (arr!8736 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!346085 () Bool)

(assert (=> b!346085 (= e!212101 call!26786)))

(declare-fun b!346086 () Bool)

(declare-fun e!212104 () Bool)

(assert (=> b!346086 (= e!212104 e!212102)))

(declare-fun res!191465 () Bool)

(assert (=> b!346086 (=> (not res!191465) (not e!212102))))

(assert (=> b!346086 (= res!191465 (not e!212103))))

(declare-fun res!191464 () Bool)

(assert (=> b!346086 (=> (not res!191464) (not e!212103))))

(assert (=> b!346086 (= res!191464 (validKeyInArray!0 (select (arr!8736 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!346082 () Bool)

(assert (=> b!346082 (= e!212101 call!26786)))

(declare-fun d!71021 () Bool)

(declare-fun res!191463 () Bool)

(assert (=> d!71021 (=> res!191463 e!212104)))

(assert (=> d!71021 (= res!191463 (bvsge #b00000000000000000000000000000000 (size!9089 _keys!1895)))))

(assert (=> d!71021 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5016) e!212104)))

(assert (= (and d!71021 (not res!191463)) b!346086))

(assert (= (and b!346086 res!191464) b!346083))

(assert (= (and b!346086 res!191465) b!346084))

(assert (= (and b!346084 c!53066) b!346085))

(assert (= (and b!346084 (not c!53066)) b!346082))

(assert (= (or b!346085 b!346082) bm!26783))

(declare-fun m!346757 () Bool)

(assert (=> bm!26783 m!346757))

(declare-fun m!346759 () Bool)

(assert (=> bm!26783 m!346759))

(assert (=> b!346083 m!346757))

(assert (=> b!346083 m!346757))

(declare-fun m!346761 () Bool)

(assert (=> b!346083 m!346761))

(assert (=> b!346084 m!346757))

(assert (=> b!346084 m!346757))

(declare-fun m!346763 () Bool)

(assert (=> b!346084 m!346763))

(assert (=> b!346086 m!346757))

(assert (=> b!346086 m!346757))

(assert (=> b!346086 m!346763))

(assert (=> b!346001 d!71021))

(declare-fun d!71023 () Bool)

(declare-fun lt!163057 () SeekEntryResult!3365)

(assert (=> d!71023 (and (or ((_ is Undefined!3365) lt!163057) (not ((_ is Found!3365) lt!163057)) (and (bvsge (index!15640 lt!163057) #b00000000000000000000000000000000) (bvslt (index!15640 lt!163057) (size!9089 _keys!1895)))) (or ((_ is Undefined!3365) lt!163057) ((_ is Found!3365) lt!163057) (not ((_ is MissingZero!3365) lt!163057)) (and (bvsge (index!15639 lt!163057) #b00000000000000000000000000000000) (bvslt (index!15639 lt!163057) (size!9089 _keys!1895)))) (or ((_ is Undefined!3365) lt!163057) ((_ is Found!3365) lt!163057) ((_ is MissingZero!3365) lt!163057) (not ((_ is MissingVacant!3365) lt!163057)) (and (bvsge (index!15642 lt!163057) #b00000000000000000000000000000000) (bvslt (index!15642 lt!163057) (size!9089 _keys!1895)))) (or ((_ is Undefined!3365) lt!163057) (ite ((_ is Found!3365) lt!163057) (= (select (arr!8736 _keys!1895) (index!15640 lt!163057)) k0!1348) (ite ((_ is MissingZero!3365) lt!163057) (= (select (arr!8736 _keys!1895) (index!15639 lt!163057)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3365) lt!163057) (= (select (arr!8736 _keys!1895) (index!15642 lt!163057)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!212111 () SeekEntryResult!3365)

(assert (=> d!71023 (= lt!163057 e!212111)))

(declare-fun c!53075 () Bool)

(declare-fun lt!163058 () SeekEntryResult!3365)

(assert (=> d!71023 (= c!53075 (and ((_ is Intermediate!3365) lt!163058) (undefined!4177 lt!163058)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18449 (_ BitVec 32)) SeekEntryResult!3365)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71023 (= lt!163058 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71023 (validMask!0 mask!2385)))

(assert (=> d!71023 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!163057)))

(declare-fun b!346099 () Bool)

(declare-fun e!212113 () SeekEntryResult!3365)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18449 (_ BitVec 32)) SeekEntryResult!3365)

(assert (=> b!346099 (= e!212113 (seekKeyOrZeroReturnVacant!0 (x!34484 lt!163058) (index!15641 lt!163058) (index!15641 lt!163058) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!346100 () Bool)

(assert (=> b!346100 (= e!212113 (MissingZero!3365 (index!15641 lt!163058)))))

(declare-fun b!346101 () Bool)

(declare-fun c!53073 () Bool)

(declare-fun lt!163059 () (_ BitVec 64))

(assert (=> b!346101 (= c!53073 (= lt!163059 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!212112 () SeekEntryResult!3365)

(assert (=> b!346101 (= e!212112 e!212113)))

(declare-fun b!346102 () Bool)

(assert (=> b!346102 (= e!212111 e!212112)))

(assert (=> b!346102 (= lt!163059 (select (arr!8736 _keys!1895) (index!15641 lt!163058)))))

(declare-fun c!53074 () Bool)

(assert (=> b!346102 (= c!53074 (= lt!163059 k0!1348))))

(declare-fun b!346103 () Bool)

(assert (=> b!346103 (= e!212111 Undefined!3365)))

(declare-fun b!346104 () Bool)

(assert (=> b!346104 (= e!212112 (Found!3365 (index!15641 lt!163058)))))

(assert (= (and d!71023 c!53075) b!346103))

(assert (= (and d!71023 (not c!53075)) b!346102))

(assert (= (and b!346102 c!53074) b!346104))

(assert (= (and b!346102 (not c!53074)) b!346101))

(assert (= (and b!346101 c!53073) b!346100))

(assert (= (and b!346101 (not c!53073)) b!346099))

(declare-fun m!346765 () Bool)

(assert (=> d!71023 m!346765))

(declare-fun m!346767 () Bool)

(assert (=> d!71023 m!346767))

(assert (=> d!71023 m!346693))

(declare-fun m!346769 () Bool)

(assert (=> d!71023 m!346769))

(declare-fun m!346771 () Bool)

(assert (=> d!71023 m!346771))

(assert (=> d!71023 m!346765))

(declare-fun m!346773 () Bool)

(assert (=> d!71023 m!346773))

(declare-fun m!346775 () Bool)

(assert (=> b!346099 m!346775))

(declare-fun m!346777 () Bool)

(assert (=> b!346102 m!346777))

(assert (=> b!346005 d!71023))

(declare-fun d!71025 () Bool)

(declare-fun res!191470 () Bool)

(declare-fun e!212118 () Bool)

(assert (=> d!71025 (=> res!191470 e!212118)))

(assert (=> d!71025 (= res!191470 (= (select (arr!8736 _keys!1895) (index!15640 lt!163044)) k0!1348))))

(assert (=> d!71025 (= (arrayContainsKey!0 _keys!1895 k0!1348 (index!15640 lt!163044)) e!212118)))

(declare-fun b!346109 () Bool)

(declare-fun e!212119 () Bool)

(assert (=> b!346109 (= e!212118 e!212119)))

(declare-fun res!191471 () Bool)

(assert (=> b!346109 (=> (not res!191471) (not e!212119))))

(assert (=> b!346109 (= res!191471 (bvslt (bvadd (index!15640 lt!163044) #b00000000000000000000000000000001) (size!9089 _keys!1895)))))

(declare-fun b!346110 () Bool)

(assert (=> b!346110 (= e!212119 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd (index!15640 lt!163044) #b00000000000000000000000000000001)))))

(assert (= (and d!71025 (not res!191470)) b!346109))

(assert (= (and b!346109 res!191471) b!346110))

(assert (=> d!71025 m!346703))

(declare-fun m!346779 () Bool)

(assert (=> b!346110 m!346779))

(assert (=> b!346000 d!71025))

(declare-fun d!71027 () Bool)

(declare-fun e!212125 () Bool)

(assert (=> d!71027 e!212125))

(declare-fun res!191474 () Bool)

(assert (=> d!71027 (=> res!191474 e!212125)))

(declare-fun lt!163068 () Bool)

(assert (=> d!71027 (= res!191474 (not lt!163068))))

(declare-fun lt!163070 () Bool)

(assert (=> d!71027 (= lt!163068 lt!163070)))

(declare-datatypes ((Unit!10726 0))(
  ( (Unit!10727) )
))
(declare-fun lt!163071 () Unit!10726)

(declare-fun e!212124 () Unit!10726)

(assert (=> d!71027 (= lt!163071 e!212124)))

(declare-fun c!53078 () Bool)

(assert (=> d!71027 (= c!53078 lt!163070)))

(declare-fun containsKey!333 (List!5020 (_ BitVec 64)) Bool)

(assert (=> d!71027 (= lt!163070 (containsKey!333 (toList!2168 (getCurrentListMap!1674 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71027 (= (contains!2242 (getCurrentListMap!1674 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!163068)))

(declare-fun b!346117 () Bool)

(declare-fun lt!163069 () Unit!10726)

(assert (=> b!346117 (= e!212124 lt!163069)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!282 (List!5020 (_ BitVec 64)) Unit!10726)

(assert (=> b!346117 (= lt!163069 (lemmaContainsKeyImpliesGetValueByKeyDefined!282 (toList!2168 (getCurrentListMap!1674 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!347 0))(
  ( (Some!346 (v!5940 V!10891)) (None!345) )
))
(declare-fun isDefined!283 (Option!347) Bool)

(declare-fun getValueByKey!341 (List!5020 (_ BitVec 64)) Option!347)

(assert (=> b!346117 (isDefined!283 (getValueByKey!341 (toList!2168 (getCurrentListMap!1674 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!346118 () Bool)

(declare-fun Unit!10728 () Unit!10726)

(assert (=> b!346118 (= e!212124 Unit!10728)))

(declare-fun b!346119 () Bool)

(assert (=> b!346119 (= e!212125 (isDefined!283 (getValueByKey!341 (toList!2168 (getCurrentListMap!1674 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71027 c!53078) b!346117))

(assert (= (and d!71027 (not c!53078)) b!346118))

(assert (= (and d!71027 (not res!191474)) b!346119))

(declare-fun m!346781 () Bool)

(assert (=> d!71027 m!346781))

(declare-fun m!346783 () Bool)

(assert (=> b!346117 m!346783))

(declare-fun m!346785 () Bool)

(assert (=> b!346117 m!346785))

(assert (=> b!346117 m!346785))

(declare-fun m!346787 () Bool)

(assert (=> b!346117 m!346787))

(assert (=> b!346119 m!346785))

(assert (=> b!346119 m!346785))

(assert (=> b!346119 m!346787))

(assert (=> b!346004 d!71027))

(declare-fun b!346162 () Bool)

(declare-fun lt!163136 () ListLongMap!4305)

(declare-fun e!212161 () Bool)

(declare-fun apply!285 (ListLongMap!4305 (_ BitVec 64)) V!10891)

(declare-fun get!4703 (ValueCell!3374 V!10891) V!10891)

(declare-fun dynLambda!619 (Int (_ BitVec 64)) V!10891)

(assert (=> b!346162 (= e!212161 (= (apply!285 lt!163136 (select (arr!8736 _keys!1895) #b00000000000000000000000000000000)) (get!4703 (select (arr!8735 _values!1525) #b00000000000000000000000000000000) (dynLambda!619 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!346162 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9088 _values!1525)))))

(assert (=> b!346162 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9089 _keys!1895)))))

(declare-fun b!346163 () Bool)

(declare-fun e!212159 () Bool)

(declare-fun e!212156 () Bool)

(assert (=> b!346163 (= e!212159 e!212156)))

(declare-fun res!191493 () Bool)

(declare-fun call!26806 () Bool)

(assert (=> b!346163 (= res!191493 call!26806)))

(assert (=> b!346163 (=> (not res!191493) (not e!212156))))

(declare-fun bm!26798 () Bool)

(declare-fun call!26801 () ListLongMap!4305)

(declare-fun call!26807 () ListLongMap!4305)

(assert (=> bm!26798 (= call!26801 call!26807)))

(declare-fun b!346164 () Bool)

(assert (=> b!346164 (= e!212159 (not call!26806))))

(declare-fun b!346165 () Bool)

(assert (=> b!346165 (= e!212156 (= (apply!285 lt!163136 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!346166 () Bool)

(declare-fun e!212155 () Unit!10726)

(declare-fun Unit!10729 () Unit!10726)

(assert (=> b!346166 (= e!212155 Unit!10729)))

(declare-fun c!53091 () Bool)

(declare-fun bm!26799 () Bool)

(declare-fun call!26805 () ListLongMap!4305)

(declare-fun c!53095 () Bool)

(declare-fun call!26802 () ListLongMap!4305)

(declare-fun +!738 (ListLongMap!4305 tuple2!5402) ListLongMap!4305)

(assert (=> bm!26799 (= call!26805 (+!738 (ite c!53095 call!26802 (ite c!53091 call!26807 call!26801)) (ite (or c!53095 c!53091) (tuple2!5403 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5403 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun bm!26800 () Bool)

(declare-fun call!26803 () ListLongMap!4305)

(assert (=> bm!26800 (= call!26803 call!26805)))

(declare-fun b!346167 () Bool)

(declare-fun e!212154 () Bool)

(declare-fun call!26804 () Bool)

(assert (=> b!346167 (= e!212154 (not call!26804))))

(declare-fun d!71029 () Bool)

(declare-fun e!212160 () Bool)

(assert (=> d!71029 e!212160))

(declare-fun res!191497 () Bool)

(assert (=> d!71029 (=> (not res!191497) (not e!212160))))

(assert (=> d!71029 (= res!191497 (or (bvsge #b00000000000000000000000000000000 (size!9089 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9089 _keys!1895)))))))

(declare-fun lt!163119 () ListLongMap!4305)

(assert (=> d!71029 (= lt!163136 lt!163119)))

(declare-fun lt!163129 () Unit!10726)

(assert (=> d!71029 (= lt!163129 e!212155)))

(declare-fun c!53093 () Bool)

(declare-fun e!212153 () Bool)

(assert (=> d!71029 (= c!53093 e!212153)))

(declare-fun res!191500 () Bool)

(assert (=> d!71029 (=> (not res!191500) (not e!212153))))

(assert (=> d!71029 (= res!191500 (bvslt #b00000000000000000000000000000000 (size!9089 _keys!1895)))))

(declare-fun e!212158 () ListLongMap!4305)

(assert (=> d!71029 (= lt!163119 e!212158)))

(assert (=> d!71029 (= c!53095 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71029 (validMask!0 mask!2385)))

(assert (=> d!71029 (= (getCurrentListMap!1674 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!163136)))

(declare-fun b!346168 () Bool)

(declare-fun e!212152 () Bool)

(assert (=> b!346168 (= e!212152 e!212161)))

(declare-fun res!191496 () Bool)

(assert (=> b!346168 (=> (not res!191496) (not e!212161))))

(assert (=> b!346168 (= res!191496 (contains!2242 lt!163136 (select (arr!8736 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!346168 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9089 _keys!1895)))))

(declare-fun b!346169 () Bool)

(declare-fun e!212163 () Bool)

(assert (=> b!346169 (= e!212154 e!212163)))

(declare-fun res!191495 () Bool)

(assert (=> b!346169 (= res!191495 call!26804)))

(assert (=> b!346169 (=> (not res!191495) (not e!212163))))

(declare-fun b!346170 () Bool)

(declare-fun lt!163118 () Unit!10726)

(assert (=> b!346170 (= e!212155 lt!163118)))

(declare-fun lt!163122 () ListLongMap!4305)

(declare-fun getCurrentListMapNoExtraKeys!601 (array!18449 array!18447 (_ BitVec 32) (_ BitVec 32) V!10891 V!10891 (_ BitVec 32) Int) ListLongMap!4305)

(assert (=> b!346170 (= lt!163122 (getCurrentListMapNoExtraKeys!601 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163124 () (_ BitVec 64))

(assert (=> b!346170 (= lt!163124 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163128 () (_ BitVec 64))

(assert (=> b!346170 (= lt!163128 (select (arr!8736 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163132 () Unit!10726)

(declare-fun addStillContains!261 (ListLongMap!4305 (_ BitVec 64) V!10891 (_ BitVec 64)) Unit!10726)

(assert (=> b!346170 (= lt!163132 (addStillContains!261 lt!163122 lt!163124 zeroValue!1467 lt!163128))))

(assert (=> b!346170 (contains!2242 (+!738 lt!163122 (tuple2!5403 lt!163124 zeroValue!1467)) lt!163128)))

(declare-fun lt!163125 () Unit!10726)

(assert (=> b!346170 (= lt!163125 lt!163132)))

(declare-fun lt!163127 () ListLongMap!4305)

(assert (=> b!346170 (= lt!163127 (getCurrentListMapNoExtraKeys!601 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163126 () (_ BitVec 64))

(assert (=> b!346170 (= lt!163126 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163120 () (_ BitVec 64))

(assert (=> b!346170 (= lt!163120 (select (arr!8736 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163123 () Unit!10726)

(declare-fun addApplyDifferent!261 (ListLongMap!4305 (_ BitVec 64) V!10891 (_ BitVec 64)) Unit!10726)

(assert (=> b!346170 (= lt!163123 (addApplyDifferent!261 lt!163127 lt!163126 minValue!1467 lt!163120))))

(assert (=> b!346170 (= (apply!285 (+!738 lt!163127 (tuple2!5403 lt!163126 minValue!1467)) lt!163120) (apply!285 lt!163127 lt!163120))))

(declare-fun lt!163130 () Unit!10726)

(assert (=> b!346170 (= lt!163130 lt!163123)))

(declare-fun lt!163116 () ListLongMap!4305)

(assert (=> b!346170 (= lt!163116 (getCurrentListMapNoExtraKeys!601 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163121 () (_ BitVec 64))

(assert (=> b!346170 (= lt!163121 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163137 () (_ BitVec 64))

(assert (=> b!346170 (= lt!163137 (select (arr!8736 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163117 () Unit!10726)

(assert (=> b!346170 (= lt!163117 (addApplyDifferent!261 lt!163116 lt!163121 zeroValue!1467 lt!163137))))

(assert (=> b!346170 (= (apply!285 (+!738 lt!163116 (tuple2!5403 lt!163121 zeroValue!1467)) lt!163137) (apply!285 lt!163116 lt!163137))))

(declare-fun lt!163134 () Unit!10726)

(assert (=> b!346170 (= lt!163134 lt!163117)))

(declare-fun lt!163133 () ListLongMap!4305)

(assert (=> b!346170 (= lt!163133 (getCurrentListMapNoExtraKeys!601 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163135 () (_ BitVec 64))

(assert (=> b!346170 (= lt!163135 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163131 () (_ BitVec 64))

(assert (=> b!346170 (= lt!163131 (select (arr!8736 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!346170 (= lt!163118 (addApplyDifferent!261 lt!163133 lt!163135 minValue!1467 lt!163131))))

(assert (=> b!346170 (= (apply!285 (+!738 lt!163133 (tuple2!5403 lt!163135 minValue!1467)) lt!163131) (apply!285 lt!163133 lt!163131))))

(declare-fun b!346171 () Bool)

(declare-fun res!191499 () Bool)

(assert (=> b!346171 (=> (not res!191499) (not e!212160))))

(assert (=> b!346171 (= res!191499 e!212159)))

(declare-fun c!53096 () Bool)

(assert (=> b!346171 (= c!53096 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!346172 () Bool)

(declare-fun res!191498 () Bool)

(assert (=> b!346172 (=> (not res!191498) (not e!212160))))

(assert (=> b!346172 (= res!191498 e!212152)))

(declare-fun res!191501 () Bool)

(assert (=> b!346172 (=> res!191501 e!212152)))

(declare-fun e!212157 () Bool)

(assert (=> b!346172 (= res!191501 (not e!212157))))

(declare-fun res!191494 () Bool)

(assert (=> b!346172 (=> (not res!191494) (not e!212157))))

(assert (=> b!346172 (= res!191494 (bvslt #b00000000000000000000000000000000 (size!9089 _keys!1895)))))

(declare-fun b!346173 () Bool)

(declare-fun e!212162 () ListLongMap!4305)

(assert (=> b!346173 (= e!212162 call!26801)))

(declare-fun b!346174 () Bool)

(assert (=> b!346174 (= e!212158 (+!738 call!26805 (tuple2!5403 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!346175 () Bool)

(declare-fun e!212164 () ListLongMap!4305)

(assert (=> b!346175 (= e!212164 call!26803)))

(declare-fun b!346176 () Bool)

(assert (=> b!346176 (= e!212163 (= (apply!285 lt!163136 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!346177 () Bool)

(assert (=> b!346177 (= e!212153 (validKeyInArray!0 (select (arr!8736 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!346178 () Bool)

(assert (=> b!346178 (= e!212162 call!26803)))

(declare-fun b!346179 () Bool)

(declare-fun c!53094 () Bool)

(assert (=> b!346179 (= c!53094 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!346179 (= e!212164 e!212162)))

(declare-fun b!346180 () Bool)

(assert (=> b!346180 (= e!212158 e!212164)))

(assert (=> b!346180 (= c!53091 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26801 () Bool)

(assert (=> bm!26801 (= call!26806 (contains!2242 lt!163136 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26802 () Bool)

(assert (=> bm!26802 (= call!26804 (contains!2242 lt!163136 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26803 () Bool)

(assert (=> bm!26803 (= call!26802 (getCurrentListMapNoExtraKeys!601 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!346181 () Bool)

(assert (=> b!346181 (= e!212157 (validKeyInArray!0 (select (arr!8736 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!346182 () Bool)

(assert (=> b!346182 (= e!212160 e!212154)))

(declare-fun c!53092 () Bool)

(assert (=> b!346182 (= c!53092 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26804 () Bool)

(assert (=> bm!26804 (= call!26807 call!26802)))

(assert (= (and d!71029 c!53095) b!346174))

(assert (= (and d!71029 (not c!53095)) b!346180))

(assert (= (and b!346180 c!53091) b!346175))

(assert (= (and b!346180 (not c!53091)) b!346179))

(assert (= (and b!346179 c!53094) b!346178))

(assert (= (and b!346179 (not c!53094)) b!346173))

(assert (= (or b!346178 b!346173) bm!26798))

(assert (= (or b!346175 bm!26798) bm!26804))

(assert (= (or b!346175 b!346178) bm!26800))

(assert (= (or b!346174 bm!26804) bm!26803))

(assert (= (or b!346174 bm!26800) bm!26799))

(assert (= (and d!71029 res!191500) b!346177))

(assert (= (and d!71029 c!53093) b!346170))

(assert (= (and d!71029 (not c!53093)) b!346166))

(assert (= (and d!71029 res!191497) b!346172))

(assert (= (and b!346172 res!191494) b!346181))

(assert (= (and b!346172 (not res!191501)) b!346168))

(assert (= (and b!346168 res!191496) b!346162))

(assert (= (and b!346172 res!191498) b!346171))

(assert (= (and b!346171 c!53096) b!346163))

(assert (= (and b!346171 (not c!53096)) b!346164))

(assert (= (and b!346163 res!191493) b!346165))

(assert (= (or b!346163 b!346164) bm!26801))

(assert (= (and b!346171 res!191499) b!346182))

(assert (= (and b!346182 c!53092) b!346169))

(assert (= (and b!346182 (not c!53092)) b!346167))

(assert (= (and b!346169 res!191495) b!346176))

(assert (= (or b!346169 b!346167) bm!26802))

(declare-fun b_lambda!8461 () Bool)

(assert (=> (not b_lambda!8461) (not b!346162)))

(declare-fun t!10143 () Bool)

(declare-fun tb!3077 () Bool)

(assert (=> (and start!34642 (= defaultEntry!1528 defaultEntry!1528) t!10143) tb!3077))

(declare-fun result!5577 () Bool)

(assert (=> tb!3077 (= result!5577 tp_is_empty!7435)))

(assert (=> b!346162 t!10143))

(declare-fun b_and!14681 () Bool)

(assert (= b_and!14675 (and (=> t!10143 result!5577) b_and!14681)))

(declare-fun m!346789 () Bool)

(assert (=> bm!26802 m!346789))

(declare-fun m!346791 () Bool)

(assert (=> bm!26801 m!346791))

(declare-fun m!346793 () Bool)

(assert (=> bm!26803 m!346793))

(declare-fun m!346795 () Bool)

(assert (=> bm!26799 m!346795))

(declare-fun m!346797 () Bool)

(assert (=> b!346162 m!346797))

(declare-fun m!346799 () Bool)

(assert (=> b!346162 m!346799))

(assert (=> b!346162 m!346757))

(declare-fun m!346801 () Bool)

(assert (=> b!346162 m!346801))

(assert (=> b!346162 m!346757))

(assert (=> b!346162 m!346799))

(assert (=> b!346162 m!346797))

(declare-fun m!346803 () Bool)

(assert (=> b!346162 m!346803))

(declare-fun m!346805 () Bool)

(assert (=> b!346170 m!346805))

(declare-fun m!346807 () Bool)

(assert (=> b!346170 m!346807))

(declare-fun m!346809 () Bool)

(assert (=> b!346170 m!346809))

(declare-fun m!346811 () Bool)

(assert (=> b!346170 m!346811))

(declare-fun m!346813 () Bool)

(assert (=> b!346170 m!346813))

(declare-fun m!346815 () Bool)

(assert (=> b!346170 m!346815))

(declare-fun m!346817 () Bool)

(assert (=> b!346170 m!346817))

(assert (=> b!346170 m!346757))

(declare-fun m!346819 () Bool)

(assert (=> b!346170 m!346819))

(declare-fun m!346821 () Bool)

(assert (=> b!346170 m!346821))

(assert (=> b!346170 m!346805))

(declare-fun m!346823 () Bool)

(assert (=> b!346170 m!346823))

(declare-fun m!346825 () Bool)

(assert (=> b!346170 m!346825))

(declare-fun m!346827 () Bool)

(assert (=> b!346170 m!346827))

(declare-fun m!346829 () Bool)

(assert (=> b!346170 m!346829))

(assert (=> b!346170 m!346811))

(assert (=> b!346170 m!346823))

(assert (=> b!346170 m!346793))

(assert (=> b!346170 m!346815))

(declare-fun m!346831 () Bool)

(assert (=> b!346170 m!346831))

(declare-fun m!346833 () Bool)

(assert (=> b!346170 m!346833))

(declare-fun m!346835 () Bool)

(assert (=> b!346174 m!346835))

(declare-fun m!346837 () Bool)

(assert (=> b!346165 m!346837))

(declare-fun m!346839 () Bool)

(assert (=> b!346176 m!346839))

(assert (=> b!346181 m!346757))

(assert (=> b!346181 m!346757))

(assert (=> b!346181 m!346763))

(assert (=> b!346168 m!346757))

(assert (=> b!346168 m!346757))

(declare-fun m!346841 () Bool)

(assert (=> b!346168 m!346841))

(assert (=> b!346177 m!346757))

(assert (=> b!346177 m!346757))

(assert (=> b!346177 m!346763))

(assert (=> d!71029 m!346693))

(assert (=> b!346004 d!71029))

(declare-fun d!71031 () Bool)

(assert (=> d!71031 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34642 d!71031))

(declare-fun d!71033 () Bool)

(assert (=> d!71033 (= (array_inv!6490 _values!1525) (bvsge (size!9088 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34642 d!71033))

(declare-fun d!71035 () Bool)

(assert (=> d!71035 (= (array_inv!6491 _keys!1895) (bvsge (size!9089 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34642 d!71035))

(declare-fun b!346193 () Bool)

(declare-fun e!212173 () Bool)

(declare-fun call!26810 () Bool)

(assert (=> b!346193 (= e!212173 call!26810)))

(declare-fun b!346194 () Bool)

(declare-fun e!212172 () Bool)

(assert (=> b!346194 (= e!212172 call!26810)))

(declare-fun b!346195 () Bool)

(declare-fun e!212171 () Bool)

(assert (=> b!346195 (= e!212171 e!212173)))

(declare-fun c!53099 () Bool)

(assert (=> b!346195 (= c!53099 (validKeyInArray!0 (select (arr!8736 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26807 () Bool)

(assert (=> bm!26807 (= call!26810 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun d!71037 () Bool)

(declare-fun res!191506 () Bool)

(assert (=> d!71037 (=> res!191506 e!212171)))

(assert (=> d!71037 (= res!191506 (bvsge #b00000000000000000000000000000000 (size!9089 _keys!1895)))))

(assert (=> d!71037 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!212171)))

(declare-fun b!346196 () Bool)

(assert (=> b!346196 (= e!212173 e!212172)))

(declare-fun lt!163146 () (_ BitVec 64))

(assert (=> b!346196 (= lt!163146 (select (arr!8736 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163144 () Unit!10726)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18449 (_ BitVec 64) (_ BitVec 32)) Unit!10726)

(assert (=> b!346196 (= lt!163144 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!163146 #b00000000000000000000000000000000))))

(assert (=> b!346196 (arrayContainsKey!0 _keys!1895 lt!163146 #b00000000000000000000000000000000)))

(declare-fun lt!163145 () Unit!10726)

(assert (=> b!346196 (= lt!163145 lt!163144)))

(declare-fun res!191507 () Bool)

(assert (=> b!346196 (= res!191507 (= (seekEntryOrOpen!0 (select (arr!8736 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3365 #b00000000000000000000000000000000)))))

(assert (=> b!346196 (=> (not res!191507) (not e!212172))))

(assert (= (and d!71037 (not res!191506)) b!346195))

(assert (= (and b!346195 c!53099) b!346196))

(assert (= (and b!346195 (not c!53099)) b!346193))

(assert (= (and b!346196 res!191507) b!346194))

(assert (= (or b!346194 b!346193) bm!26807))

(assert (=> b!346195 m!346757))

(assert (=> b!346195 m!346757))

(assert (=> b!346195 m!346763))

(declare-fun m!346843 () Bool)

(assert (=> bm!26807 m!346843))

(assert (=> b!346196 m!346757))

(declare-fun m!346845 () Bool)

(assert (=> b!346196 m!346845))

(declare-fun m!346847 () Bool)

(assert (=> b!346196 m!346847))

(assert (=> b!346196 m!346757))

(declare-fun m!346849 () Bool)

(assert (=> b!346196 m!346849))

(assert (=> b!345997 d!71037))

(declare-fun b!346203 () Bool)

(declare-fun e!212179 () Bool)

(assert (=> b!346203 (= e!212179 tp_is_empty!7435)))

(declare-fun mapIsEmpty!12615 () Bool)

(declare-fun mapRes!12615 () Bool)

(assert (=> mapIsEmpty!12615 mapRes!12615))

(declare-fun mapNonEmpty!12615 () Bool)

(declare-fun tp!26025 () Bool)

(assert (=> mapNonEmpty!12615 (= mapRes!12615 (and tp!26025 e!212179))))

(declare-fun mapValue!12615 () ValueCell!3374)

(declare-fun mapKey!12615 () (_ BitVec 32))

(declare-fun mapRest!12615 () (Array (_ BitVec 32) ValueCell!3374))

(assert (=> mapNonEmpty!12615 (= mapRest!12606 (store mapRest!12615 mapKey!12615 mapValue!12615))))

(declare-fun condMapEmpty!12615 () Bool)

(declare-fun mapDefault!12615 () ValueCell!3374)

(assert (=> mapNonEmpty!12606 (= condMapEmpty!12615 (= mapRest!12606 ((as const (Array (_ BitVec 32) ValueCell!3374)) mapDefault!12615)))))

(declare-fun e!212178 () Bool)

(assert (=> mapNonEmpty!12606 (= tp!26010 (and e!212178 mapRes!12615))))

(declare-fun b!346204 () Bool)

(assert (=> b!346204 (= e!212178 tp_is_empty!7435)))

(assert (= (and mapNonEmpty!12606 condMapEmpty!12615) mapIsEmpty!12615))

(assert (= (and mapNonEmpty!12606 (not condMapEmpty!12615)) mapNonEmpty!12615))

(assert (= (and mapNonEmpty!12615 ((_ is ValueCellFull!3374) mapValue!12615)) b!346203))

(assert (= (and mapNonEmpty!12606 ((_ is ValueCellFull!3374) mapDefault!12615)) b!346204))

(declare-fun m!346851 () Bool)

(assert (=> mapNonEmpty!12615 m!346851))

(declare-fun b_lambda!8463 () Bool)

(assert (= b_lambda!8461 (or (and start!34642 b_free!7483) b_lambda!8463)))

(check-sat (not b!346086) (not b!346117) (not b!346177) (not mapNonEmpty!12615) (not b!346168) (not bm!26783) (not b!346196) (not d!71029) (not b!346195) (not b!346110) (not d!71027) (not b!346119) (not bm!26803) (not b!346170) (not d!71023) (not b!346083) tp_is_empty!7435 (not bm!26799) (not b!346099) (not bm!26801) (not bm!26802) (not b!346165) (not b!346181) (not b!346084) (not b_lambda!8463) (not b!346162) (not b!346176) (not b_next!7483) (not b!346174) (not bm!26807) b_and!14681)
(check-sat b_and!14681 (not b_next!7483))
