; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20994 () Bool)

(assert start!20994)

(declare-fun b_free!5565 () Bool)

(declare-fun b_next!5565 () Bool)

(assert (=> start!20994 (= b_free!5565 (not b_next!5565))))

(declare-fun tp!19748 () Bool)

(declare-fun b_and!12359 () Bool)

(assert (=> start!20994 (= tp!19748 b_and!12359)))

(declare-fun b!211027 () Bool)

(declare-fun res!103045 () Bool)

(declare-fun e!137385 () Bool)

(assert (=> b!211027 (=> (not res!103045) (not e!137385))))

(declare-datatypes ((array!10053 0))(
  ( (array!10054 (arr!4773 (Array (_ BitVec 32) (_ BitVec 64))) (size!5098 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10053)

(declare-datatypes ((List!3061 0))(
  ( (Nil!3058) (Cons!3057 (h!3699 (_ BitVec 64)) (t!8000 List!3061)) )
))
(declare-fun arrayNoDuplicates!0 (array!10053 (_ BitVec 32) List!3061) Bool)

(assert (=> b!211027 (= res!103045 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3058))))

(declare-datatypes ((V!6883 0))(
  ( (V!6884 (val!2758 Int)) )
))
(declare-datatypes ((tuple2!4168 0))(
  ( (tuple2!4169 (_1!2095 (_ BitVec 64)) (_2!2095 V!6883)) )
))
(declare-datatypes ((List!3062 0))(
  ( (Nil!3059) (Cons!3058 (h!3700 tuple2!4168) (t!8001 List!3062)) )
))
(declare-datatypes ((ListLongMap!3081 0))(
  ( (ListLongMap!3082 (toList!1556 List!3062)) )
))
(declare-fun lt!108413 () ListLongMap!3081)

(declare-fun lt!108415 () ListLongMap!3081)

(declare-fun b!211028 () Bool)

(declare-fun e!137386 () Bool)

(declare-fun zeroValue!615 () V!6883)

(declare-fun +!559 (ListLongMap!3081 tuple2!4168) ListLongMap!3081)

(assert (=> b!211028 (= e!137386 (= lt!108413 (+!559 lt!108415 (tuple2!4169 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))))

(declare-fun b!211029 () Bool)

(declare-fun res!103047 () Bool)

(assert (=> b!211029 (=> (not res!103047) (not e!137385))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!211029 (= res!103047 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5098 _keys!825))))))

(declare-fun mapNonEmpty!9221 () Bool)

(declare-fun mapRes!9221 () Bool)

(declare-fun tp!19747 () Bool)

(declare-fun e!137384 () Bool)

(assert (=> mapNonEmpty!9221 (= mapRes!9221 (and tp!19747 e!137384))))

(declare-datatypes ((ValueCell!2370 0))(
  ( (ValueCellFull!2370 (v!4744 V!6883)) (EmptyCell!2370) )
))
(declare-datatypes ((array!10055 0))(
  ( (array!10056 (arr!4774 (Array (_ BitVec 32) ValueCell!2370)) (size!5099 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10055)

(declare-fun mapRest!9221 () (Array (_ BitVec 32) ValueCell!2370))

(declare-fun mapKey!9221 () (_ BitVec 32))

(declare-fun mapValue!9221 () ValueCell!2370)

(assert (=> mapNonEmpty!9221 (= (arr!4774 _values!649) (store mapRest!9221 mapKey!9221 mapValue!9221))))

(declare-fun res!103046 () Bool)

(assert (=> start!20994 (=> (not res!103046) (not e!137385))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20994 (= res!103046 (validMask!0 mask!1149))))

(assert (=> start!20994 e!137385))

(declare-fun e!137387 () Bool)

(declare-fun array_inv!3161 (array!10055) Bool)

(assert (=> start!20994 (and (array_inv!3161 _values!649) e!137387)))

(assert (=> start!20994 true))

(declare-fun tp_is_empty!5427 () Bool)

(assert (=> start!20994 tp_is_empty!5427))

(declare-fun array_inv!3162 (array!10053) Bool)

(assert (=> start!20994 (array_inv!3162 _keys!825)))

(assert (=> start!20994 tp!19748))

(declare-fun b!211030 () Bool)

(assert (=> b!211030 (= e!137385 (not e!137386))))

(declare-fun res!103044 () Bool)

(assert (=> b!211030 (=> res!103044 e!137386)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!211030 (= res!103044 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6883)

(declare-fun lt!108414 () ListLongMap!3081)

(declare-fun getCurrentListMap!1090 (array!10053 array!10055 (_ BitVec 32) (_ BitVec 32) V!6883 V!6883 (_ BitVec 32) Int) ListLongMap!3081)

(assert (=> b!211030 (= lt!108414 (getCurrentListMap!1090 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108416 () array!10055)

(assert (=> b!211030 (= lt!108413 (getCurrentListMap!1090 _keys!825 lt!108416 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108417 () ListLongMap!3081)

(assert (=> b!211030 (and (= lt!108415 lt!108417) (= lt!108417 lt!108415))))

(declare-fun v!520 () V!6883)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun lt!108412 () ListLongMap!3081)

(assert (=> b!211030 (= lt!108417 (+!559 lt!108412 (tuple2!4169 k0!843 v!520)))))

(declare-datatypes ((Unit!6408 0))(
  ( (Unit!6409) )
))
(declare-fun lt!108411 () Unit!6408)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!207 (array!10053 array!10055 (_ BitVec 32) (_ BitVec 32) V!6883 V!6883 (_ BitVec 32) (_ BitVec 64) V!6883 (_ BitVec 32) Int) Unit!6408)

(assert (=> b!211030 (= lt!108411 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!207 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!492 (array!10053 array!10055 (_ BitVec 32) (_ BitVec 32) V!6883 V!6883 (_ BitVec 32) Int) ListLongMap!3081)

(assert (=> b!211030 (= lt!108415 (getCurrentListMapNoExtraKeys!492 _keys!825 lt!108416 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!211030 (= lt!108416 (array!10056 (store (arr!4774 _values!649) i!601 (ValueCellFull!2370 v!520)) (size!5099 _values!649)))))

(assert (=> b!211030 (= lt!108412 (getCurrentListMapNoExtraKeys!492 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211031 () Bool)

(declare-fun res!103041 () Bool)

(assert (=> b!211031 (=> (not res!103041) (not e!137385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10053 (_ BitVec 32)) Bool)

(assert (=> b!211031 (= res!103041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!211032 () Bool)

(declare-fun e!137383 () Bool)

(assert (=> b!211032 (= e!137387 (and e!137383 mapRes!9221))))

(declare-fun condMapEmpty!9221 () Bool)

(declare-fun mapDefault!9221 () ValueCell!2370)

(assert (=> b!211032 (= condMapEmpty!9221 (= (arr!4774 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2370)) mapDefault!9221)))))

(declare-fun b!211033 () Bool)

(declare-fun res!103042 () Bool)

(assert (=> b!211033 (=> (not res!103042) (not e!137385))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!211033 (= res!103042 (validKeyInArray!0 k0!843))))

(declare-fun mapIsEmpty!9221 () Bool)

(assert (=> mapIsEmpty!9221 mapRes!9221))

(declare-fun b!211034 () Bool)

(assert (=> b!211034 (= e!137383 tp_is_empty!5427)))

(declare-fun b!211035 () Bool)

(assert (=> b!211035 (= e!137384 tp_is_empty!5427)))

(declare-fun b!211036 () Bool)

(declare-fun res!103043 () Bool)

(assert (=> b!211036 (=> (not res!103043) (not e!137385))))

(assert (=> b!211036 (= res!103043 (= (select (arr!4773 _keys!825) i!601) k0!843))))

(declare-fun b!211037 () Bool)

(declare-fun res!103048 () Bool)

(assert (=> b!211037 (=> (not res!103048) (not e!137385))))

(assert (=> b!211037 (= res!103048 (and (= (size!5099 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5098 _keys!825) (size!5099 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20994 res!103046) b!211037))

(assert (= (and b!211037 res!103048) b!211031))

(assert (= (and b!211031 res!103041) b!211027))

(assert (= (and b!211027 res!103045) b!211029))

(assert (= (and b!211029 res!103047) b!211033))

(assert (= (and b!211033 res!103042) b!211036))

(assert (= (and b!211036 res!103043) b!211030))

(assert (= (and b!211030 (not res!103044)) b!211028))

(assert (= (and b!211032 condMapEmpty!9221) mapIsEmpty!9221))

(assert (= (and b!211032 (not condMapEmpty!9221)) mapNonEmpty!9221))

(get-info :version)

(assert (= (and mapNonEmpty!9221 ((_ is ValueCellFull!2370) mapValue!9221)) b!211035))

(assert (= (and b!211032 ((_ is ValueCellFull!2370) mapDefault!9221)) b!211034))

(assert (= start!20994 b!211032))

(declare-fun m!238763 () Bool)

(assert (=> start!20994 m!238763))

(declare-fun m!238765 () Bool)

(assert (=> start!20994 m!238765))

(declare-fun m!238767 () Bool)

(assert (=> start!20994 m!238767))

(declare-fun m!238769 () Bool)

(assert (=> b!211036 m!238769))

(declare-fun m!238771 () Bool)

(assert (=> b!211028 m!238771))

(declare-fun m!238773 () Bool)

(assert (=> b!211027 m!238773))

(declare-fun m!238775 () Bool)

(assert (=> b!211030 m!238775))

(declare-fun m!238777 () Bool)

(assert (=> b!211030 m!238777))

(declare-fun m!238779 () Bool)

(assert (=> b!211030 m!238779))

(declare-fun m!238781 () Bool)

(assert (=> b!211030 m!238781))

(declare-fun m!238783 () Bool)

(assert (=> b!211030 m!238783))

(declare-fun m!238785 () Bool)

(assert (=> b!211030 m!238785))

(declare-fun m!238787 () Bool)

(assert (=> b!211030 m!238787))

(declare-fun m!238789 () Bool)

(assert (=> mapNonEmpty!9221 m!238789))

(declare-fun m!238791 () Bool)

(assert (=> b!211031 m!238791))

(declare-fun m!238793 () Bool)

(assert (=> b!211033 m!238793))

(check-sat b_and!12359 (not b!211030) (not mapNonEmpty!9221) (not start!20994) (not b_next!5565) (not b!211027) (not b!211028) (not b!211031) tp_is_empty!5427 (not b!211033))
(check-sat b_and!12359 (not b_next!5565))
(get-model)

(declare-fun d!58011 () Bool)

(assert (=> d!58011 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211033 d!58011))

(declare-fun d!58013 () Bool)

(assert (=> d!58013 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!20994 d!58013))

(declare-fun d!58015 () Bool)

(assert (=> d!58015 (= (array_inv!3161 _values!649) (bvsge (size!5099 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!20994 d!58015))

(declare-fun d!58017 () Bool)

(assert (=> d!58017 (= (array_inv!3162 _keys!825) (bvsge (size!5098 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!20994 d!58017))

(declare-fun b!211081 () Bool)

(declare-fun e!137415 () Bool)

(declare-fun e!137417 () Bool)

(assert (=> b!211081 (= e!137415 e!137417)))

(declare-fun res!103080 () Bool)

(assert (=> b!211081 (=> (not res!103080) (not e!137417))))

(declare-fun e!137416 () Bool)

(assert (=> b!211081 (= res!103080 (not e!137416))))

(declare-fun res!103079 () Bool)

(assert (=> b!211081 (=> (not res!103079) (not e!137416))))

(assert (=> b!211081 (= res!103079 (validKeyInArray!0 (select (arr!4773 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!58019 () Bool)

(declare-fun res!103081 () Bool)

(assert (=> d!58019 (=> res!103081 e!137415)))

(assert (=> d!58019 (= res!103081 (bvsge #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(assert (=> d!58019 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3058) e!137415)))

(declare-fun b!211082 () Bool)

(declare-fun e!137414 () Bool)

(assert (=> b!211082 (= e!137417 e!137414)))

(declare-fun c!35634 () Bool)

(assert (=> b!211082 (= c!35634 (validKeyInArray!0 (select (arr!4773 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211083 () Bool)

(declare-fun call!19955 () Bool)

(assert (=> b!211083 (= e!137414 call!19955)))

(declare-fun bm!19952 () Bool)

(assert (=> bm!19952 (= call!19955 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35634 (Cons!3057 (select (arr!4773 _keys!825) #b00000000000000000000000000000000) Nil!3058) Nil!3058)))))

(declare-fun b!211084 () Bool)

(declare-fun contains!1401 (List!3061 (_ BitVec 64)) Bool)

(assert (=> b!211084 (= e!137416 (contains!1401 Nil!3058 (select (arr!4773 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211085 () Bool)

(assert (=> b!211085 (= e!137414 call!19955)))

(assert (= (and d!58019 (not res!103081)) b!211081))

(assert (= (and b!211081 res!103079) b!211084))

(assert (= (and b!211081 res!103080) b!211082))

(assert (= (and b!211082 c!35634) b!211083))

(assert (= (and b!211082 (not c!35634)) b!211085))

(assert (= (or b!211083 b!211085) bm!19952))

(declare-fun m!238827 () Bool)

(assert (=> b!211081 m!238827))

(assert (=> b!211081 m!238827))

(declare-fun m!238829 () Bool)

(assert (=> b!211081 m!238829))

(assert (=> b!211082 m!238827))

(assert (=> b!211082 m!238827))

(assert (=> b!211082 m!238829))

(assert (=> bm!19952 m!238827))

(declare-fun m!238831 () Bool)

(assert (=> bm!19952 m!238831))

(assert (=> b!211084 m!238827))

(assert (=> b!211084 m!238827))

(declare-fun m!238833 () Bool)

(assert (=> b!211084 m!238833))

(assert (=> b!211027 d!58019))

(declare-fun d!58021 () Bool)

(declare-fun e!137420 () Bool)

(assert (=> d!58021 e!137420))

(declare-fun res!103087 () Bool)

(assert (=> d!58021 (=> (not res!103087) (not e!137420))))

(declare-fun lt!108447 () ListLongMap!3081)

(declare-fun contains!1402 (ListLongMap!3081 (_ BitVec 64)) Bool)

(assert (=> d!58021 (= res!103087 (contains!1402 lt!108447 (_1!2095 (tuple2!4169 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))))

(declare-fun lt!108449 () List!3062)

(assert (=> d!58021 (= lt!108447 (ListLongMap!3082 lt!108449))))

(declare-fun lt!108450 () Unit!6408)

(declare-fun lt!108448 () Unit!6408)

(assert (=> d!58021 (= lt!108450 lt!108448)))

(declare-datatypes ((Option!257 0))(
  ( (Some!256 (v!4749 V!6883)) (None!255) )
))
(declare-fun getValueByKey!251 (List!3062 (_ BitVec 64)) Option!257)

(assert (=> d!58021 (= (getValueByKey!251 lt!108449 (_1!2095 (tuple2!4169 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))) (Some!256 (_2!2095 (tuple2!4169 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))))

(declare-fun lemmaContainsTupThenGetReturnValue!138 (List!3062 (_ BitVec 64) V!6883) Unit!6408)

(assert (=> d!58021 (= lt!108448 (lemmaContainsTupThenGetReturnValue!138 lt!108449 (_1!2095 (tuple2!4169 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) (_2!2095 (tuple2!4169 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))))

(declare-fun insertStrictlySorted!141 (List!3062 (_ BitVec 64) V!6883) List!3062)

(assert (=> d!58021 (= lt!108449 (insertStrictlySorted!141 (toList!1556 lt!108415) (_1!2095 (tuple2!4169 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) (_2!2095 (tuple2!4169 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))))

(assert (=> d!58021 (= (+!559 lt!108415 (tuple2!4169 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) lt!108447)))

(declare-fun b!211090 () Bool)

(declare-fun res!103086 () Bool)

(assert (=> b!211090 (=> (not res!103086) (not e!137420))))

(assert (=> b!211090 (= res!103086 (= (getValueByKey!251 (toList!1556 lt!108447) (_1!2095 (tuple2!4169 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))) (Some!256 (_2!2095 (tuple2!4169 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)))))))

(declare-fun b!211091 () Bool)

(declare-fun contains!1403 (List!3062 tuple2!4168) Bool)

(assert (=> b!211091 (= e!137420 (contains!1403 (toList!1556 lt!108447) (tuple2!4169 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)))))

(assert (= (and d!58021 res!103087) b!211090))

(assert (= (and b!211090 res!103086) b!211091))

(declare-fun m!238835 () Bool)

(assert (=> d!58021 m!238835))

(declare-fun m!238837 () Bool)

(assert (=> d!58021 m!238837))

(declare-fun m!238839 () Bool)

(assert (=> d!58021 m!238839))

(declare-fun m!238841 () Bool)

(assert (=> d!58021 m!238841))

(declare-fun m!238843 () Bool)

(assert (=> b!211090 m!238843))

(declare-fun m!238845 () Bool)

(assert (=> b!211091 m!238845))

(assert (=> b!211028 d!58021))

(declare-fun b!211116 () Bool)

(declare-fun e!137440 () ListLongMap!3081)

(assert (=> b!211116 (= e!137440 (ListLongMap!3082 Nil!3059))))

(declare-fun b!211117 () Bool)

(declare-fun e!137436 () ListLongMap!3081)

(assert (=> b!211117 (= e!137440 e!137436)))

(declare-fun c!35646 () Bool)

(assert (=> b!211117 (= c!35646 (validKeyInArray!0 (select (arr!4773 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211118 () Bool)

(assert (=> b!211118 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(assert (=> b!211118 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5099 _values!649)))))

(declare-fun e!137437 () Bool)

(declare-fun lt!108471 () ListLongMap!3081)

(declare-fun apply!193 (ListLongMap!3081 (_ BitVec 64)) V!6883)

(declare-fun get!2557 (ValueCell!2370 V!6883) V!6883)

(declare-fun dynLambda!536 (Int (_ BitVec 64)) V!6883)

(assert (=> b!211118 (= e!137437 (= (apply!193 lt!108471 (select (arr!4773 _keys!825) #b00000000000000000000000000000000)) (get!2557 (select (arr!4774 _values!649) #b00000000000000000000000000000000) (dynLambda!536 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!211119 () Bool)

(declare-fun e!137441 () Bool)

(assert (=> b!211119 (= e!137441 (validKeyInArray!0 (select (arr!4773 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211119 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun call!19958 () ListLongMap!3081)

(declare-fun bm!19955 () Bool)

(assert (=> bm!19955 (= call!19958 (getCurrentListMapNoExtraKeys!492 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun d!58023 () Bool)

(declare-fun e!137435 () Bool)

(assert (=> d!58023 e!137435))

(declare-fun res!103099 () Bool)

(assert (=> d!58023 (=> (not res!103099) (not e!137435))))

(assert (=> d!58023 (= res!103099 (not (contains!1402 lt!108471 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58023 (= lt!108471 e!137440)))

(declare-fun c!35644 () Bool)

(assert (=> d!58023 (= c!35644 (bvsge #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(assert (=> d!58023 (validMask!0 mask!1149)))

(assert (=> d!58023 (= (getCurrentListMapNoExtraKeys!492 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108471)))

(declare-fun b!211120 () Bool)

(declare-fun e!137439 () Bool)

(assert (=> b!211120 (= e!137439 e!137437)))

(assert (=> b!211120 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(declare-fun res!103096 () Bool)

(assert (=> b!211120 (= res!103096 (contains!1402 lt!108471 (select (arr!4773 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211120 (=> (not res!103096) (not e!137437))))

(declare-fun b!211121 () Bool)

(declare-fun lt!108469 () Unit!6408)

(declare-fun lt!108467 () Unit!6408)

(assert (=> b!211121 (= lt!108469 lt!108467)))

(declare-fun lt!108468 () ListLongMap!3081)

(declare-fun lt!108466 () (_ BitVec 64))

(declare-fun lt!108470 () V!6883)

(declare-fun lt!108465 () (_ BitVec 64))

(assert (=> b!211121 (not (contains!1402 (+!559 lt!108468 (tuple2!4169 lt!108465 lt!108470)) lt!108466))))

(declare-fun addStillNotContains!102 (ListLongMap!3081 (_ BitVec 64) V!6883 (_ BitVec 64)) Unit!6408)

(assert (=> b!211121 (= lt!108467 (addStillNotContains!102 lt!108468 lt!108465 lt!108470 lt!108466))))

(assert (=> b!211121 (= lt!108466 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!211121 (= lt!108470 (get!2557 (select (arr!4774 _values!649) #b00000000000000000000000000000000) (dynLambda!536 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211121 (= lt!108465 (select (arr!4773 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211121 (= lt!108468 call!19958)))

(assert (=> b!211121 (= e!137436 (+!559 call!19958 (tuple2!4169 (select (arr!4773 _keys!825) #b00000000000000000000000000000000) (get!2557 (select (arr!4774 _values!649) #b00000000000000000000000000000000) (dynLambda!536 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!211122 () Bool)

(assert (=> b!211122 (= e!137435 e!137439)))

(declare-fun c!35645 () Bool)

(assert (=> b!211122 (= c!35645 e!137441)))

(declare-fun res!103097 () Bool)

(assert (=> b!211122 (=> (not res!103097) (not e!137441))))

(assert (=> b!211122 (= res!103097 (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(declare-fun b!211123 () Bool)

(declare-fun e!137438 () Bool)

(assert (=> b!211123 (= e!137439 e!137438)))

(declare-fun c!35643 () Bool)

(assert (=> b!211123 (= c!35643 (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(declare-fun b!211124 () Bool)

(declare-fun isEmpty!494 (ListLongMap!3081) Bool)

(assert (=> b!211124 (= e!137438 (isEmpty!494 lt!108471))))

(declare-fun b!211125 () Bool)

(assert (=> b!211125 (= e!137438 (= lt!108471 (getCurrentListMapNoExtraKeys!492 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!211126 () Bool)

(declare-fun res!103098 () Bool)

(assert (=> b!211126 (=> (not res!103098) (not e!137435))))

(assert (=> b!211126 (= res!103098 (not (contains!1402 lt!108471 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!211127 () Bool)

(assert (=> b!211127 (= e!137436 call!19958)))

(assert (= (and d!58023 c!35644) b!211116))

(assert (= (and d!58023 (not c!35644)) b!211117))

(assert (= (and b!211117 c!35646) b!211121))

(assert (= (and b!211117 (not c!35646)) b!211127))

(assert (= (or b!211121 b!211127) bm!19955))

(assert (= (and d!58023 res!103099) b!211126))

(assert (= (and b!211126 res!103098) b!211122))

(assert (= (and b!211122 res!103097) b!211119))

(assert (= (and b!211122 c!35645) b!211120))

(assert (= (and b!211122 (not c!35645)) b!211123))

(assert (= (and b!211120 res!103096) b!211118))

(assert (= (and b!211123 c!35643) b!211125))

(assert (= (and b!211123 (not c!35643)) b!211124))

(declare-fun b_lambda!7635 () Bool)

(assert (=> (not b_lambda!7635) (not b!211118)))

(declare-fun t!8005 () Bool)

(declare-fun tb!2899 () Bool)

(assert (=> (and start!20994 (= defaultEntry!657 defaultEntry!657) t!8005) tb!2899))

(declare-fun result!4985 () Bool)

(assert (=> tb!2899 (= result!4985 tp_is_empty!5427)))

(assert (=> b!211118 t!8005))

(declare-fun b_and!12363 () Bool)

(assert (= b_and!12359 (and (=> t!8005 result!4985) b_and!12363)))

(declare-fun b_lambda!7637 () Bool)

(assert (=> (not b_lambda!7637) (not b!211121)))

(assert (=> b!211121 t!8005))

(declare-fun b_and!12365 () Bool)

(assert (= b_and!12363 (and (=> t!8005 result!4985) b_and!12365)))

(assert (=> b!211120 m!238827))

(assert (=> b!211120 m!238827))

(declare-fun m!238847 () Bool)

(assert (=> b!211120 m!238847))

(assert (=> b!211117 m!238827))

(assert (=> b!211117 m!238827))

(assert (=> b!211117 m!238829))

(declare-fun m!238849 () Bool)

(assert (=> b!211126 m!238849))

(declare-fun m!238851 () Bool)

(assert (=> b!211118 m!238851))

(assert (=> b!211118 m!238827))

(declare-fun m!238853 () Bool)

(assert (=> b!211118 m!238853))

(assert (=> b!211118 m!238853))

(assert (=> b!211118 m!238851))

(declare-fun m!238855 () Bool)

(assert (=> b!211118 m!238855))

(assert (=> b!211118 m!238827))

(declare-fun m!238857 () Bool)

(assert (=> b!211118 m!238857))

(declare-fun m!238859 () Bool)

(assert (=> b!211121 m!238859))

(declare-fun m!238861 () Bool)

(assert (=> b!211121 m!238861))

(assert (=> b!211121 m!238851))

(assert (=> b!211121 m!238827))

(declare-fun m!238863 () Bool)

(assert (=> b!211121 m!238863))

(assert (=> b!211121 m!238853))

(assert (=> b!211121 m!238853))

(assert (=> b!211121 m!238851))

(assert (=> b!211121 m!238855))

(assert (=> b!211121 m!238861))

(declare-fun m!238865 () Bool)

(assert (=> b!211121 m!238865))

(assert (=> b!211119 m!238827))

(assert (=> b!211119 m!238827))

(assert (=> b!211119 m!238829))

(declare-fun m!238867 () Bool)

(assert (=> b!211125 m!238867))

(declare-fun m!238869 () Bool)

(assert (=> d!58023 m!238869))

(assert (=> d!58023 m!238763))

(declare-fun m!238871 () Bool)

(assert (=> b!211124 m!238871))

(assert (=> bm!19955 m!238867))

(assert (=> b!211030 d!58023))

(declare-fun b!211172 () Bool)

(declare-fun e!137474 () Bool)

(assert (=> b!211172 (= e!137474 (validKeyInArray!0 (select (arr!4773 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211173 () Bool)

(declare-fun e!137470 () ListLongMap!3081)

(declare-fun call!19975 () ListLongMap!3081)

(assert (=> b!211173 (= e!137470 call!19975)))

(declare-fun bm!19970 () Bool)

(declare-fun call!19973 () ListLongMap!3081)

(assert (=> bm!19970 (= call!19973 (getCurrentListMapNoExtraKeys!492 _keys!825 lt!108416 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun d!58025 () Bool)

(declare-fun e!137479 () Bool)

(assert (=> d!58025 e!137479))

(declare-fun res!103124 () Bool)

(assert (=> d!58025 (=> (not res!103124) (not e!137479))))

(assert (=> d!58025 (= res!103124 (or (bvsge #b00000000000000000000000000000000 (size!5098 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))))

(declare-fun lt!108534 () ListLongMap!3081)

(declare-fun lt!108517 () ListLongMap!3081)

(assert (=> d!58025 (= lt!108534 lt!108517)))

(declare-fun lt!108529 () Unit!6408)

(declare-fun e!137471 () Unit!6408)

(assert (=> d!58025 (= lt!108529 e!137471)))

(declare-fun c!35663 () Bool)

(declare-fun e!137478 () Bool)

(assert (=> d!58025 (= c!35663 e!137478)))

(declare-fun res!103123 () Bool)

(assert (=> d!58025 (=> (not res!103123) (not e!137478))))

(assert (=> d!58025 (= res!103123 (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(declare-fun e!137469 () ListLongMap!3081)

(assert (=> d!58025 (= lt!108517 e!137469)))

(declare-fun c!35659 () Bool)

(assert (=> d!58025 (= c!35659 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58025 (validMask!0 mask!1149)))

(assert (=> d!58025 (= (getCurrentListMap!1090 _keys!825 lt!108416 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108534)))

(declare-fun bm!19971 () Bool)

(declare-fun call!19977 () Bool)

(assert (=> bm!19971 (= call!19977 (contains!1402 lt!108534 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!211174 () Bool)

(declare-fun res!103120 () Bool)

(assert (=> b!211174 (=> (not res!103120) (not e!137479))))

(declare-fun e!137468 () Bool)

(assert (=> b!211174 (= res!103120 e!137468)))

(declare-fun c!35664 () Bool)

(assert (=> b!211174 (= c!35664 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!211175 () Bool)

(declare-fun Unit!6412 () Unit!6408)

(assert (=> b!211175 (= e!137471 Unit!6412)))

(declare-fun bm!19972 () Bool)

(declare-fun call!19974 () Bool)

(assert (=> bm!19972 (= call!19974 (contains!1402 lt!108534 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19973 () Bool)

(declare-fun call!19976 () ListLongMap!3081)

(declare-fun call!19978 () ListLongMap!3081)

(assert (=> bm!19973 (= call!19976 call!19978)))

(declare-fun b!211176 () Bool)

(declare-fun e!137480 () Bool)

(declare-fun e!137472 () Bool)

(assert (=> b!211176 (= e!137480 e!137472)))

(declare-fun res!103125 () Bool)

(assert (=> b!211176 (=> (not res!103125) (not e!137472))))

(assert (=> b!211176 (= res!103125 (contains!1402 lt!108534 (select (arr!4773 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211176 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(declare-fun b!211177 () Bool)

(declare-fun e!137477 () Bool)

(assert (=> b!211177 (= e!137468 e!137477)))

(declare-fun res!103119 () Bool)

(assert (=> b!211177 (= res!103119 call!19974)))

(assert (=> b!211177 (=> (not res!103119) (not e!137477))))

(declare-fun c!35661 () Bool)

(declare-fun call!19979 () ListLongMap!3081)

(declare-fun bm!19974 () Bool)

(assert (=> bm!19974 (= call!19979 (+!559 (ite c!35659 call!19973 (ite c!35661 call!19978 call!19976)) (ite (or c!35659 c!35661) (tuple2!4169 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4169 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!211178 () Bool)

(assert (=> b!211178 (= e!137469 e!137470)))

(assert (=> b!211178 (= c!35661 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211179 () Bool)

(assert (=> b!211179 (= e!137478 (validKeyInArray!0 (select (arr!4773 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211180 () Bool)

(declare-fun e!137473 () ListLongMap!3081)

(assert (=> b!211180 (= e!137473 call!19976)))

(declare-fun b!211181 () Bool)

(assert (=> b!211181 (= e!137473 call!19975)))

(declare-fun b!211182 () Bool)

(declare-fun e!137475 () Bool)

(declare-fun e!137476 () Bool)

(assert (=> b!211182 (= e!137475 e!137476)))

(declare-fun res!103122 () Bool)

(assert (=> b!211182 (= res!103122 call!19977)))

(assert (=> b!211182 (=> (not res!103122) (not e!137476))))

(declare-fun bm!19975 () Bool)

(assert (=> bm!19975 (= call!19978 call!19973)))

(declare-fun b!211183 () Bool)

(assert (=> b!211183 (= e!137472 (= (apply!193 lt!108534 (select (arr!4773 _keys!825) #b00000000000000000000000000000000)) (get!2557 (select (arr!4774 lt!108416) #b00000000000000000000000000000000) (dynLambda!536 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211183 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5099 lt!108416)))))

(assert (=> b!211183 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(declare-fun b!211184 () Bool)

(assert (=> b!211184 (= e!137477 (= (apply!193 lt!108534 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!211185 () Bool)

(assert (=> b!211185 (= e!137475 (not call!19977))))

(declare-fun bm!19976 () Bool)

(assert (=> bm!19976 (= call!19975 call!19979)))

(declare-fun b!211186 () Bool)

(assert (=> b!211186 (= e!137468 (not call!19974))))

(declare-fun b!211187 () Bool)

(declare-fun c!35660 () Bool)

(assert (=> b!211187 (= c!35660 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!211187 (= e!137470 e!137473)))

(declare-fun b!211188 () Bool)

(assert (=> b!211188 (= e!137476 (= (apply!193 lt!108534 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!211189 () Bool)

(assert (=> b!211189 (= e!137479 e!137475)))

(declare-fun c!35662 () Bool)

(assert (=> b!211189 (= c!35662 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211190 () Bool)

(declare-fun res!103126 () Bool)

(assert (=> b!211190 (=> (not res!103126) (not e!137479))))

(assert (=> b!211190 (= res!103126 e!137480)))

(declare-fun res!103118 () Bool)

(assert (=> b!211190 (=> res!103118 e!137480)))

(assert (=> b!211190 (= res!103118 (not e!137474))))

(declare-fun res!103121 () Bool)

(assert (=> b!211190 (=> (not res!103121) (not e!137474))))

(assert (=> b!211190 (= res!103121 (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(declare-fun b!211191 () Bool)

(declare-fun lt!108536 () Unit!6408)

(assert (=> b!211191 (= e!137471 lt!108536)))

(declare-fun lt!108523 () ListLongMap!3081)

(assert (=> b!211191 (= lt!108523 (getCurrentListMapNoExtraKeys!492 _keys!825 lt!108416 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108532 () (_ BitVec 64))

(assert (=> b!211191 (= lt!108532 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108535 () (_ BitVec 64))

(assert (=> b!211191 (= lt!108535 (select (arr!4773 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108526 () Unit!6408)

(declare-fun addStillContains!169 (ListLongMap!3081 (_ BitVec 64) V!6883 (_ BitVec 64)) Unit!6408)

(assert (=> b!211191 (= lt!108526 (addStillContains!169 lt!108523 lt!108532 zeroValue!615 lt!108535))))

(assert (=> b!211191 (contains!1402 (+!559 lt!108523 (tuple2!4169 lt!108532 zeroValue!615)) lt!108535)))

(declare-fun lt!108528 () Unit!6408)

(assert (=> b!211191 (= lt!108528 lt!108526)))

(declare-fun lt!108537 () ListLongMap!3081)

(assert (=> b!211191 (= lt!108537 (getCurrentListMapNoExtraKeys!492 _keys!825 lt!108416 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108520 () (_ BitVec 64))

(assert (=> b!211191 (= lt!108520 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108519 () (_ BitVec 64))

(assert (=> b!211191 (= lt!108519 (select (arr!4773 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108530 () Unit!6408)

(declare-fun addApplyDifferent!169 (ListLongMap!3081 (_ BitVec 64) V!6883 (_ BitVec 64)) Unit!6408)

(assert (=> b!211191 (= lt!108530 (addApplyDifferent!169 lt!108537 lt!108520 minValue!615 lt!108519))))

(assert (=> b!211191 (= (apply!193 (+!559 lt!108537 (tuple2!4169 lt!108520 minValue!615)) lt!108519) (apply!193 lt!108537 lt!108519))))

(declare-fun lt!108525 () Unit!6408)

(assert (=> b!211191 (= lt!108525 lt!108530)))

(declare-fun lt!108522 () ListLongMap!3081)

(assert (=> b!211191 (= lt!108522 (getCurrentListMapNoExtraKeys!492 _keys!825 lt!108416 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108518 () (_ BitVec 64))

(assert (=> b!211191 (= lt!108518 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108516 () (_ BitVec 64))

(assert (=> b!211191 (= lt!108516 (select (arr!4773 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108533 () Unit!6408)

(assert (=> b!211191 (= lt!108533 (addApplyDifferent!169 lt!108522 lt!108518 zeroValue!615 lt!108516))))

(assert (=> b!211191 (= (apply!193 (+!559 lt!108522 (tuple2!4169 lt!108518 zeroValue!615)) lt!108516) (apply!193 lt!108522 lt!108516))))

(declare-fun lt!108531 () Unit!6408)

(assert (=> b!211191 (= lt!108531 lt!108533)))

(declare-fun lt!108527 () ListLongMap!3081)

(assert (=> b!211191 (= lt!108527 (getCurrentListMapNoExtraKeys!492 _keys!825 lt!108416 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108521 () (_ BitVec 64))

(assert (=> b!211191 (= lt!108521 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108524 () (_ BitVec 64))

(assert (=> b!211191 (= lt!108524 (select (arr!4773 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211191 (= lt!108536 (addApplyDifferent!169 lt!108527 lt!108521 minValue!615 lt!108524))))

(assert (=> b!211191 (= (apply!193 (+!559 lt!108527 (tuple2!4169 lt!108521 minValue!615)) lt!108524) (apply!193 lt!108527 lt!108524))))

(declare-fun b!211192 () Bool)

(assert (=> b!211192 (= e!137469 (+!559 call!19979 (tuple2!4169 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(assert (= (and d!58025 c!35659) b!211192))

(assert (= (and d!58025 (not c!35659)) b!211178))

(assert (= (and b!211178 c!35661) b!211173))

(assert (= (and b!211178 (not c!35661)) b!211187))

(assert (= (and b!211187 c!35660) b!211181))

(assert (= (and b!211187 (not c!35660)) b!211180))

(assert (= (or b!211181 b!211180) bm!19973))

(assert (= (or b!211173 bm!19973) bm!19975))

(assert (= (or b!211173 b!211181) bm!19976))

(assert (= (or b!211192 bm!19975) bm!19970))

(assert (= (or b!211192 bm!19976) bm!19974))

(assert (= (and d!58025 res!103123) b!211179))

(assert (= (and d!58025 c!35663) b!211191))

(assert (= (and d!58025 (not c!35663)) b!211175))

(assert (= (and d!58025 res!103124) b!211190))

(assert (= (and b!211190 res!103121) b!211172))

(assert (= (and b!211190 (not res!103118)) b!211176))

(assert (= (and b!211176 res!103125) b!211183))

(assert (= (and b!211190 res!103126) b!211174))

(assert (= (and b!211174 c!35664) b!211177))

(assert (= (and b!211174 (not c!35664)) b!211186))

(assert (= (and b!211177 res!103119) b!211184))

(assert (= (or b!211177 b!211186) bm!19972))

(assert (= (and b!211174 res!103120) b!211189))

(assert (= (and b!211189 c!35662) b!211182))

(assert (= (and b!211189 (not c!35662)) b!211185))

(assert (= (and b!211182 res!103122) b!211188))

(assert (= (or b!211182 b!211185) bm!19971))

(declare-fun b_lambda!7639 () Bool)

(assert (=> (not b_lambda!7639) (not b!211183)))

(assert (=> b!211183 t!8005))

(declare-fun b_and!12367 () Bool)

(assert (= b_and!12365 (and (=> t!8005 result!4985) b_and!12367)))

(assert (=> bm!19970 m!238775))

(assert (=> b!211172 m!238827))

(assert (=> b!211172 m!238827))

(assert (=> b!211172 m!238829))

(declare-fun m!238873 () Bool)

(assert (=> b!211184 m!238873))

(declare-fun m!238875 () Bool)

(assert (=> b!211191 m!238875))

(declare-fun m!238877 () Bool)

(assert (=> b!211191 m!238877))

(assert (=> b!211191 m!238827))

(assert (=> b!211191 m!238775))

(declare-fun m!238879 () Bool)

(assert (=> b!211191 m!238879))

(declare-fun m!238881 () Bool)

(assert (=> b!211191 m!238881))

(declare-fun m!238883 () Bool)

(assert (=> b!211191 m!238883))

(declare-fun m!238885 () Bool)

(assert (=> b!211191 m!238885))

(declare-fun m!238887 () Bool)

(assert (=> b!211191 m!238887))

(declare-fun m!238889 () Bool)

(assert (=> b!211191 m!238889))

(declare-fun m!238891 () Bool)

(assert (=> b!211191 m!238891))

(declare-fun m!238893 () Bool)

(assert (=> b!211191 m!238893))

(assert (=> b!211191 m!238883))

(assert (=> b!211191 m!238889))

(declare-fun m!238895 () Bool)

(assert (=> b!211191 m!238895))

(declare-fun m!238897 () Bool)

(assert (=> b!211191 m!238897))

(assert (=> b!211191 m!238887))

(declare-fun m!238899 () Bool)

(assert (=> b!211191 m!238899))

(declare-fun m!238901 () Bool)

(assert (=> b!211191 m!238901))

(assert (=> b!211191 m!238881))

(declare-fun m!238903 () Bool)

(assert (=> b!211191 m!238903))

(declare-fun m!238905 () Bool)

(assert (=> bm!19971 m!238905))

(assert (=> b!211176 m!238827))

(assert (=> b!211176 m!238827))

(declare-fun m!238907 () Bool)

(assert (=> b!211176 m!238907))

(assert (=> d!58025 m!238763))

(declare-fun m!238909 () Bool)

(assert (=> bm!19974 m!238909))

(declare-fun m!238911 () Bool)

(assert (=> bm!19972 m!238911))

(assert (=> b!211183 m!238827))

(declare-fun m!238913 () Bool)

(assert (=> b!211183 m!238913))

(assert (=> b!211183 m!238827))

(declare-fun m!238915 () Bool)

(assert (=> b!211183 m!238915))

(assert (=> b!211183 m!238913))

(assert (=> b!211183 m!238851))

(declare-fun m!238917 () Bool)

(assert (=> b!211183 m!238917))

(assert (=> b!211183 m!238851))

(declare-fun m!238919 () Bool)

(assert (=> b!211188 m!238919))

(assert (=> b!211179 m!238827))

(assert (=> b!211179 m!238827))

(assert (=> b!211179 m!238829))

(declare-fun m!238921 () Bool)

(assert (=> b!211192 m!238921))

(assert (=> b!211030 d!58025))

(declare-fun b!211199 () Bool)

(declare-fun e!137486 () Bool)

(declare-fun call!19985 () ListLongMap!3081)

(declare-fun call!19984 () ListLongMap!3081)

(assert (=> b!211199 (= e!137486 (= call!19985 call!19984))))

(declare-fun bm!19981 () Bool)

(assert (=> bm!19981 (= call!19984 (getCurrentListMapNoExtraKeys!492 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211200 () Bool)

(assert (=> b!211200 (= e!137486 (= call!19985 (+!559 call!19984 (tuple2!4169 k0!843 v!520))))))

(declare-fun d!58027 () Bool)

(declare-fun e!137485 () Bool)

(assert (=> d!58027 e!137485))

(declare-fun res!103129 () Bool)

(assert (=> d!58027 (=> (not res!103129) (not e!137485))))

(assert (=> d!58027 (= res!103129 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5099 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5099 _values!649))))))))

(declare-fun lt!108540 () Unit!6408)

(declare-fun choose!1077 (array!10053 array!10055 (_ BitVec 32) (_ BitVec 32) V!6883 V!6883 (_ BitVec 32) (_ BitVec 64) V!6883 (_ BitVec 32) Int) Unit!6408)

(assert (=> d!58027 (= lt!108540 (choose!1077 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!58027 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(assert (=> d!58027 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!207 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!108540)))

(declare-fun bm!19982 () Bool)

(assert (=> bm!19982 (= call!19985 (getCurrentListMapNoExtraKeys!492 _keys!825 (array!10056 (store (arr!4774 _values!649) i!601 (ValueCellFull!2370 v!520)) (size!5099 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211201 () Bool)

(assert (=> b!211201 (= e!137485 e!137486)))

(declare-fun c!35667 () Bool)

(assert (=> b!211201 (= c!35667 (bvsle #b00000000000000000000000000000000 i!601))))

(assert (= (and d!58027 res!103129) b!211201))

(assert (= (and b!211201 c!35667) b!211200))

(assert (= (and b!211201 (not c!35667)) b!211199))

(assert (= (or b!211200 b!211199) bm!19982))

(assert (= (or b!211200 b!211199) bm!19981))

(assert (=> bm!19981 m!238787))

(declare-fun m!238923 () Bool)

(assert (=> b!211200 m!238923))

(declare-fun m!238925 () Bool)

(assert (=> d!58027 m!238925))

(assert (=> bm!19982 m!238779))

(declare-fun m!238927 () Bool)

(assert (=> bm!19982 m!238927))

(assert (=> b!211030 d!58027))

(declare-fun b!211202 () Bool)

(declare-fun e!137492 () ListLongMap!3081)

(assert (=> b!211202 (= e!137492 (ListLongMap!3082 Nil!3059))))

(declare-fun b!211203 () Bool)

(declare-fun e!137488 () ListLongMap!3081)

(assert (=> b!211203 (= e!137492 e!137488)))

(declare-fun c!35671 () Bool)

(assert (=> b!211203 (= c!35671 (validKeyInArray!0 (select (arr!4773 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211204 () Bool)

(assert (=> b!211204 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(assert (=> b!211204 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5099 lt!108416)))))

(declare-fun e!137489 () Bool)

(declare-fun lt!108547 () ListLongMap!3081)

(assert (=> b!211204 (= e!137489 (= (apply!193 lt!108547 (select (arr!4773 _keys!825) #b00000000000000000000000000000000)) (get!2557 (select (arr!4774 lt!108416) #b00000000000000000000000000000000) (dynLambda!536 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!211205 () Bool)

(declare-fun e!137493 () Bool)

(assert (=> b!211205 (= e!137493 (validKeyInArray!0 (select (arr!4773 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211205 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!19983 () Bool)

(declare-fun call!19986 () ListLongMap!3081)

(assert (=> bm!19983 (= call!19986 (getCurrentListMapNoExtraKeys!492 _keys!825 lt!108416 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun d!58029 () Bool)

(declare-fun e!137487 () Bool)

(assert (=> d!58029 e!137487))

(declare-fun res!103133 () Bool)

(assert (=> d!58029 (=> (not res!103133) (not e!137487))))

(assert (=> d!58029 (= res!103133 (not (contains!1402 lt!108547 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58029 (= lt!108547 e!137492)))

(declare-fun c!35669 () Bool)

(assert (=> d!58029 (= c!35669 (bvsge #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(assert (=> d!58029 (validMask!0 mask!1149)))

(assert (=> d!58029 (= (getCurrentListMapNoExtraKeys!492 _keys!825 lt!108416 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108547)))

(declare-fun b!211206 () Bool)

(declare-fun e!137491 () Bool)

(assert (=> b!211206 (= e!137491 e!137489)))

(assert (=> b!211206 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(declare-fun res!103130 () Bool)

(assert (=> b!211206 (= res!103130 (contains!1402 lt!108547 (select (arr!4773 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211206 (=> (not res!103130) (not e!137489))))

(declare-fun b!211207 () Bool)

(declare-fun lt!108545 () Unit!6408)

(declare-fun lt!108543 () Unit!6408)

(assert (=> b!211207 (= lt!108545 lt!108543)))

(declare-fun lt!108542 () (_ BitVec 64))

(declare-fun lt!108544 () ListLongMap!3081)

(declare-fun lt!108541 () (_ BitVec 64))

(declare-fun lt!108546 () V!6883)

(assert (=> b!211207 (not (contains!1402 (+!559 lt!108544 (tuple2!4169 lt!108541 lt!108546)) lt!108542))))

(assert (=> b!211207 (= lt!108543 (addStillNotContains!102 lt!108544 lt!108541 lt!108546 lt!108542))))

(assert (=> b!211207 (= lt!108542 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!211207 (= lt!108546 (get!2557 (select (arr!4774 lt!108416) #b00000000000000000000000000000000) (dynLambda!536 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211207 (= lt!108541 (select (arr!4773 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211207 (= lt!108544 call!19986)))

(assert (=> b!211207 (= e!137488 (+!559 call!19986 (tuple2!4169 (select (arr!4773 _keys!825) #b00000000000000000000000000000000) (get!2557 (select (arr!4774 lt!108416) #b00000000000000000000000000000000) (dynLambda!536 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!211208 () Bool)

(assert (=> b!211208 (= e!137487 e!137491)))

(declare-fun c!35670 () Bool)

(assert (=> b!211208 (= c!35670 e!137493)))

(declare-fun res!103131 () Bool)

(assert (=> b!211208 (=> (not res!103131) (not e!137493))))

(assert (=> b!211208 (= res!103131 (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(declare-fun b!211209 () Bool)

(declare-fun e!137490 () Bool)

(assert (=> b!211209 (= e!137491 e!137490)))

(declare-fun c!35668 () Bool)

(assert (=> b!211209 (= c!35668 (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(declare-fun b!211210 () Bool)

(assert (=> b!211210 (= e!137490 (isEmpty!494 lt!108547))))

(declare-fun b!211211 () Bool)

(assert (=> b!211211 (= e!137490 (= lt!108547 (getCurrentListMapNoExtraKeys!492 _keys!825 lt!108416 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!211212 () Bool)

(declare-fun res!103132 () Bool)

(assert (=> b!211212 (=> (not res!103132) (not e!137487))))

(assert (=> b!211212 (= res!103132 (not (contains!1402 lt!108547 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!211213 () Bool)

(assert (=> b!211213 (= e!137488 call!19986)))

(assert (= (and d!58029 c!35669) b!211202))

(assert (= (and d!58029 (not c!35669)) b!211203))

(assert (= (and b!211203 c!35671) b!211207))

(assert (= (and b!211203 (not c!35671)) b!211213))

(assert (= (or b!211207 b!211213) bm!19983))

(assert (= (and d!58029 res!103133) b!211212))

(assert (= (and b!211212 res!103132) b!211208))

(assert (= (and b!211208 res!103131) b!211205))

(assert (= (and b!211208 c!35670) b!211206))

(assert (= (and b!211208 (not c!35670)) b!211209))

(assert (= (and b!211206 res!103130) b!211204))

(assert (= (and b!211209 c!35668) b!211211))

(assert (= (and b!211209 (not c!35668)) b!211210))

(declare-fun b_lambda!7641 () Bool)

(assert (=> (not b_lambda!7641) (not b!211204)))

(assert (=> b!211204 t!8005))

(declare-fun b_and!12369 () Bool)

(assert (= b_and!12367 (and (=> t!8005 result!4985) b_and!12369)))

(declare-fun b_lambda!7643 () Bool)

(assert (=> (not b_lambda!7643) (not b!211207)))

(assert (=> b!211207 t!8005))

(declare-fun b_and!12371 () Bool)

(assert (= b_and!12369 (and (=> t!8005 result!4985) b_and!12371)))

(assert (=> b!211206 m!238827))

(assert (=> b!211206 m!238827))

(declare-fun m!238929 () Bool)

(assert (=> b!211206 m!238929))

(assert (=> b!211203 m!238827))

(assert (=> b!211203 m!238827))

(assert (=> b!211203 m!238829))

(declare-fun m!238931 () Bool)

(assert (=> b!211212 m!238931))

(assert (=> b!211204 m!238851))

(assert (=> b!211204 m!238827))

(assert (=> b!211204 m!238913))

(assert (=> b!211204 m!238913))

(assert (=> b!211204 m!238851))

(assert (=> b!211204 m!238917))

(assert (=> b!211204 m!238827))

(declare-fun m!238933 () Bool)

(assert (=> b!211204 m!238933))

(declare-fun m!238935 () Bool)

(assert (=> b!211207 m!238935))

(declare-fun m!238937 () Bool)

(assert (=> b!211207 m!238937))

(assert (=> b!211207 m!238851))

(assert (=> b!211207 m!238827))

(declare-fun m!238939 () Bool)

(assert (=> b!211207 m!238939))

(assert (=> b!211207 m!238913))

(assert (=> b!211207 m!238913))

(assert (=> b!211207 m!238851))

(assert (=> b!211207 m!238917))

(assert (=> b!211207 m!238937))

(declare-fun m!238941 () Bool)

(assert (=> b!211207 m!238941))

(assert (=> b!211205 m!238827))

(assert (=> b!211205 m!238827))

(assert (=> b!211205 m!238829))

(declare-fun m!238943 () Bool)

(assert (=> b!211211 m!238943))

(declare-fun m!238945 () Bool)

(assert (=> d!58029 m!238945))

(assert (=> d!58029 m!238763))

(declare-fun m!238947 () Bool)

(assert (=> b!211210 m!238947))

(assert (=> bm!19983 m!238943))

(assert (=> b!211030 d!58029))

(declare-fun b!211214 () Bool)

(declare-fun e!137500 () Bool)

(assert (=> b!211214 (= e!137500 (validKeyInArray!0 (select (arr!4773 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211215 () Bool)

(declare-fun e!137496 () ListLongMap!3081)

(declare-fun call!19989 () ListLongMap!3081)

(assert (=> b!211215 (= e!137496 call!19989)))

(declare-fun bm!19984 () Bool)

(declare-fun call!19987 () ListLongMap!3081)

(assert (=> bm!19984 (= call!19987 (getCurrentListMapNoExtraKeys!492 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun d!58031 () Bool)

(declare-fun e!137505 () Bool)

(assert (=> d!58031 e!137505))

(declare-fun res!103140 () Bool)

(assert (=> d!58031 (=> (not res!103140) (not e!137505))))

(assert (=> d!58031 (= res!103140 (or (bvsge #b00000000000000000000000000000000 (size!5098 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))))

(declare-fun lt!108566 () ListLongMap!3081)

(declare-fun lt!108549 () ListLongMap!3081)

(assert (=> d!58031 (= lt!108566 lt!108549)))

(declare-fun lt!108561 () Unit!6408)

(declare-fun e!137497 () Unit!6408)

(assert (=> d!58031 (= lt!108561 e!137497)))

(declare-fun c!35676 () Bool)

(declare-fun e!137504 () Bool)

(assert (=> d!58031 (= c!35676 e!137504)))

(declare-fun res!103139 () Bool)

(assert (=> d!58031 (=> (not res!103139) (not e!137504))))

(assert (=> d!58031 (= res!103139 (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(declare-fun e!137495 () ListLongMap!3081)

(assert (=> d!58031 (= lt!108549 e!137495)))

(declare-fun c!35672 () Bool)

(assert (=> d!58031 (= c!35672 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58031 (validMask!0 mask!1149)))

(assert (=> d!58031 (= (getCurrentListMap!1090 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108566)))

(declare-fun bm!19985 () Bool)

(declare-fun call!19991 () Bool)

(assert (=> bm!19985 (= call!19991 (contains!1402 lt!108566 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!211216 () Bool)

(declare-fun res!103136 () Bool)

(assert (=> b!211216 (=> (not res!103136) (not e!137505))))

(declare-fun e!137494 () Bool)

(assert (=> b!211216 (= res!103136 e!137494)))

(declare-fun c!35677 () Bool)

(assert (=> b!211216 (= c!35677 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!211217 () Bool)

(declare-fun Unit!6413 () Unit!6408)

(assert (=> b!211217 (= e!137497 Unit!6413)))

(declare-fun bm!19986 () Bool)

(declare-fun call!19988 () Bool)

(assert (=> bm!19986 (= call!19988 (contains!1402 lt!108566 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19987 () Bool)

(declare-fun call!19990 () ListLongMap!3081)

(declare-fun call!19992 () ListLongMap!3081)

(assert (=> bm!19987 (= call!19990 call!19992)))

(declare-fun b!211218 () Bool)

(declare-fun e!137506 () Bool)

(declare-fun e!137498 () Bool)

(assert (=> b!211218 (= e!137506 e!137498)))

(declare-fun res!103141 () Bool)

(assert (=> b!211218 (=> (not res!103141) (not e!137498))))

(assert (=> b!211218 (= res!103141 (contains!1402 lt!108566 (select (arr!4773 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211218 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(declare-fun b!211219 () Bool)

(declare-fun e!137503 () Bool)

(assert (=> b!211219 (= e!137494 e!137503)))

(declare-fun res!103135 () Bool)

(assert (=> b!211219 (= res!103135 call!19988)))

(assert (=> b!211219 (=> (not res!103135) (not e!137503))))

(declare-fun c!35674 () Bool)

(declare-fun call!19993 () ListLongMap!3081)

(declare-fun bm!19988 () Bool)

(assert (=> bm!19988 (= call!19993 (+!559 (ite c!35672 call!19987 (ite c!35674 call!19992 call!19990)) (ite (or c!35672 c!35674) (tuple2!4169 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4169 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!211220 () Bool)

(assert (=> b!211220 (= e!137495 e!137496)))

(assert (=> b!211220 (= c!35674 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211221 () Bool)

(assert (=> b!211221 (= e!137504 (validKeyInArray!0 (select (arr!4773 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211222 () Bool)

(declare-fun e!137499 () ListLongMap!3081)

(assert (=> b!211222 (= e!137499 call!19990)))

(declare-fun b!211223 () Bool)

(assert (=> b!211223 (= e!137499 call!19989)))

(declare-fun b!211224 () Bool)

(declare-fun e!137501 () Bool)

(declare-fun e!137502 () Bool)

(assert (=> b!211224 (= e!137501 e!137502)))

(declare-fun res!103138 () Bool)

(assert (=> b!211224 (= res!103138 call!19991)))

(assert (=> b!211224 (=> (not res!103138) (not e!137502))))

(declare-fun bm!19989 () Bool)

(assert (=> bm!19989 (= call!19992 call!19987)))

(declare-fun b!211225 () Bool)

(assert (=> b!211225 (= e!137498 (= (apply!193 lt!108566 (select (arr!4773 _keys!825) #b00000000000000000000000000000000)) (get!2557 (select (arr!4774 _values!649) #b00000000000000000000000000000000) (dynLambda!536 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211225 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5099 _values!649)))))

(assert (=> b!211225 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(declare-fun b!211226 () Bool)

(assert (=> b!211226 (= e!137503 (= (apply!193 lt!108566 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!211227 () Bool)

(assert (=> b!211227 (= e!137501 (not call!19991))))

(declare-fun bm!19990 () Bool)

(assert (=> bm!19990 (= call!19989 call!19993)))

(declare-fun b!211228 () Bool)

(assert (=> b!211228 (= e!137494 (not call!19988))))

(declare-fun b!211229 () Bool)

(declare-fun c!35673 () Bool)

(assert (=> b!211229 (= c!35673 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!211229 (= e!137496 e!137499)))

(declare-fun b!211230 () Bool)

(assert (=> b!211230 (= e!137502 (= (apply!193 lt!108566 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!211231 () Bool)

(assert (=> b!211231 (= e!137505 e!137501)))

(declare-fun c!35675 () Bool)

(assert (=> b!211231 (= c!35675 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211232 () Bool)

(declare-fun res!103142 () Bool)

(assert (=> b!211232 (=> (not res!103142) (not e!137505))))

(assert (=> b!211232 (= res!103142 e!137506)))

(declare-fun res!103134 () Bool)

(assert (=> b!211232 (=> res!103134 e!137506)))

(assert (=> b!211232 (= res!103134 (not e!137500))))

(declare-fun res!103137 () Bool)

(assert (=> b!211232 (=> (not res!103137) (not e!137500))))

(assert (=> b!211232 (= res!103137 (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(declare-fun b!211233 () Bool)

(declare-fun lt!108568 () Unit!6408)

(assert (=> b!211233 (= e!137497 lt!108568)))

(declare-fun lt!108555 () ListLongMap!3081)

(assert (=> b!211233 (= lt!108555 (getCurrentListMapNoExtraKeys!492 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108564 () (_ BitVec 64))

(assert (=> b!211233 (= lt!108564 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108567 () (_ BitVec 64))

(assert (=> b!211233 (= lt!108567 (select (arr!4773 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108558 () Unit!6408)

(assert (=> b!211233 (= lt!108558 (addStillContains!169 lt!108555 lt!108564 zeroValue!615 lt!108567))))

(assert (=> b!211233 (contains!1402 (+!559 lt!108555 (tuple2!4169 lt!108564 zeroValue!615)) lt!108567)))

(declare-fun lt!108560 () Unit!6408)

(assert (=> b!211233 (= lt!108560 lt!108558)))

(declare-fun lt!108569 () ListLongMap!3081)

(assert (=> b!211233 (= lt!108569 (getCurrentListMapNoExtraKeys!492 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108552 () (_ BitVec 64))

(assert (=> b!211233 (= lt!108552 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108551 () (_ BitVec 64))

(assert (=> b!211233 (= lt!108551 (select (arr!4773 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108562 () Unit!6408)

(assert (=> b!211233 (= lt!108562 (addApplyDifferent!169 lt!108569 lt!108552 minValue!615 lt!108551))))

(assert (=> b!211233 (= (apply!193 (+!559 lt!108569 (tuple2!4169 lt!108552 minValue!615)) lt!108551) (apply!193 lt!108569 lt!108551))))

(declare-fun lt!108557 () Unit!6408)

(assert (=> b!211233 (= lt!108557 lt!108562)))

(declare-fun lt!108554 () ListLongMap!3081)

(assert (=> b!211233 (= lt!108554 (getCurrentListMapNoExtraKeys!492 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108550 () (_ BitVec 64))

(assert (=> b!211233 (= lt!108550 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108548 () (_ BitVec 64))

(assert (=> b!211233 (= lt!108548 (select (arr!4773 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108565 () Unit!6408)

(assert (=> b!211233 (= lt!108565 (addApplyDifferent!169 lt!108554 lt!108550 zeroValue!615 lt!108548))))

(assert (=> b!211233 (= (apply!193 (+!559 lt!108554 (tuple2!4169 lt!108550 zeroValue!615)) lt!108548) (apply!193 lt!108554 lt!108548))))

(declare-fun lt!108563 () Unit!6408)

(assert (=> b!211233 (= lt!108563 lt!108565)))

(declare-fun lt!108559 () ListLongMap!3081)

(assert (=> b!211233 (= lt!108559 (getCurrentListMapNoExtraKeys!492 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108553 () (_ BitVec 64))

(assert (=> b!211233 (= lt!108553 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108556 () (_ BitVec 64))

(assert (=> b!211233 (= lt!108556 (select (arr!4773 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211233 (= lt!108568 (addApplyDifferent!169 lt!108559 lt!108553 minValue!615 lt!108556))))

(assert (=> b!211233 (= (apply!193 (+!559 lt!108559 (tuple2!4169 lt!108553 minValue!615)) lt!108556) (apply!193 lt!108559 lt!108556))))

(declare-fun b!211234 () Bool)

(assert (=> b!211234 (= e!137495 (+!559 call!19993 (tuple2!4169 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(assert (= (and d!58031 c!35672) b!211234))

(assert (= (and d!58031 (not c!35672)) b!211220))

(assert (= (and b!211220 c!35674) b!211215))

(assert (= (and b!211220 (not c!35674)) b!211229))

(assert (= (and b!211229 c!35673) b!211223))

(assert (= (and b!211229 (not c!35673)) b!211222))

(assert (= (or b!211223 b!211222) bm!19987))

(assert (= (or b!211215 bm!19987) bm!19989))

(assert (= (or b!211215 b!211223) bm!19990))

(assert (= (or b!211234 bm!19989) bm!19984))

(assert (= (or b!211234 bm!19990) bm!19988))

(assert (= (and d!58031 res!103139) b!211221))

(assert (= (and d!58031 c!35676) b!211233))

(assert (= (and d!58031 (not c!35676)) b!211217))

(assert (= (and d!58031 res!103140) b!211232))

(assert (= (and b!211232 res!103137) b!211214))

(assert (= (and b!211232 (not res!103134)) b!211218))

(assert (= (and b!211218 res!103141) b!211225))

(assert (= (and b!211232 res!103142) b!211216))

(assert (= (and b!211216 c!35677) b!211219))

(assert (= (and b!211216 (not c!35677)) b!211228))

(assert (= (and b!211219 res!103135) b!211226))

(assert (= (or b!211219 b!211228) bm!19986))

(assert (= (and b!211216 res!103136) b!211231))

(assert (= (and b!211231 c!35675) b!211224))

(assert (= (and b!211231 (not c!35675)) b!211227))

(assert (= (and b!211224 res!103138) b!211230))

(assert (= (or b!211224 b!211227) bm!19985))

(declare-fun b_lambda!7645 () Bool)

(assert (=> (not b_lambda!7645) (not b!211225)))

(assert (=> b!211225 t!8005))

(declare-fun b_and!12373 () Bool)

(assert (= b_and!12371 (and (=> t!8005 result!4985) b_and!12373)))

(assert (=> bm!19984 m!238787))

(assert (=> b!211214 m!238827))

(assert (=> b!211214 m!238827))

(assert (=> b!211214 m!238829))

(declare-fun m!238949 () Bool)

(assert (=> b!211226 m!238949))

(declare-fun m!238951 () Bool)

(assert (=> b!211233 m!238951))

(declare-fun m!238953 () Bool)

(assert (=> b!211233 m!238953))

(assert (=> b!211233 m!238827))

(assert (=> b!211233 m!238787))

(declare-fun m!238955 () Bool)

(assert (=> b!211233 m!238955))

(declare-fun m!238957 () Bool)

(assert (=> b!211233 m!238957))

(declare-fun m!238959 () Bool)

(assert (=> b!211233 m!238959))

(declare-fun m!238961 () Bool)

(assert (=> b!211233 m!238961))

(declare-fun m!238963 () Bool)

(assert (=> b!211233 m!238963))

(declare-fun m!238965 () Bool)

(assert (=> b!211233 m!238965))

(declare-fun m!238967 () Bool)

(assert (=> b!211233 m!238967))

(declare-fun m!238969 () Bool)

(assert (=> b!211233 m!238969))

(assert (=> b!211233 m!238959))

(assert (=> b!211233 m!238965))

(declare-fun m!238971 () Bool)

(assert (=> b!211233 m!238971))

(declare-fun m!238973 () Bool)

(assert (=> b!211233 m!238973))

(assert (=> b!211233 m!238963))

(declare-fun m!238975 () Bool)

(assert (=> b!211233 m!238975))

(declare-fun m!238977 () Bool)

(assert (=> b!211233 m!238977))

(assert (=> b!211233 m!238957))

(declare-fun m!238979 () Bool)

(assert (=> b!211233 m!238979))

(declare-fun m!238981 () Bool)

(assert (=> bm!19985 m!238981))

(assert (=> b!211218 m!238827))

(assert (=> b!211218 m!238827))

(declare-fun m!238983 () Bool)

(assert (=> b!211218 m!238983))

(assert (=> d!58031 m!238763))

(declare-fun m!238985 () Bool)

(assert (=> bm!19988 m!238985))

(declare-fun m!238987 () Bool)

(assert (=> bm!19986 m!238987))

(assert (=> b!211225 m!238827))

(assert (=> b!211225 m!238853))

(assert (=> b!211225 m!238827))

(declare-fun m!238989 () Bool)

(assert (=> b!211225 m!238989))

(assert (=> b!211225 m!238853))

(assert (=> b!211225 m!238851))

(assert (=> b!211225 m!238855))

(assert (=> b!211225 m!238851))

(declare-fun m!238991 () Bool)

(assert (=> b!211230 m!238991))

(assert (=> b!211221 m!238827))

(assert (=> b!211221 m!238827))

(assert (=> b!211221 m!238829))

(declare-fun m!238993 () Bool)

(assert (=> b!211234 m!238993))

(assert (=> b!211030 d!58031))

(declare-fun d!58033 () Bool)

(declare-fun e!137507 () Bool)

(assert (=> d!58033 e!137507))

(declare-fun res!103144 () Bool)

(assert (=> d!58033 (=> (not res!103144) (not e!137507))))

(declare-fun lt!108570 () ListLongMap!3081)

(assert (=> d!58033 (= res!103144 (contains!1402 lt!108570 (_1!2095 (tuple2!4169 k0!843 v!520))))))

(declare-fun lt!108572 () List!3062)

(assert (=> d!58033 (= lt!108570 (ListLongMap!3082 lt!108572))))

(declare-fun lt!108573 () Unit!6408)

(declare-fun lt!108571 () Unit!6408)

(assert (=> d!58033 (= lt!108573 lt!108571)))

(assert (=> d!58033 (= (getValueByKey!251 lt!108572 (_1!2095 (tuple2!4169 k0!843 v!520))) (Some!256 (_2!2095 (tuple2!4169 k0!843 v!520))))))

(assert (=> d!58033 (= lt!108571 (lemmaContainsTupThenGetReturnValue!138 lt!108572 (_1!2095 (tuple2!4169 k0!843 v!520)) (_2!2095 (tuple2!4169 k0!843 v!520))))))

(assert (=> d!58033 (= lt!108572 (insertStrictlySorted!141 (toList!1556 lt!108412) (_1!2095 (tuple2!4169 k0!843 v!520)) (_2!2095 (tuple2!4169 k0!843 v!520))))))

(assert (=> d!58033 (= (+!559 lt!108412 (tuple2!4169 k0!843 v!520)) lt!108570)))

(declare-fun b!211235 () Bool)

(declare-fun res!103143 () Bool)

(assert (=> b!211235 (=> (not res!103143) (not e!137507))))

(assert (=> b!211235 (= res!103143 (= (getValueByKey!251 (toList!1556 lt!108570) (_1!2095 (tuple2!4169 k0!843 v!520))) (Some!256 (_2!2095 (tuple2!4169 k0!843 v!520)))))))

(declare-fun b!211236 () Bool)

(assert (=> b!211236 (= e!137507 (contains!1403 (toList!1556 lt!108570) (tuple2!4169 k0!843 v!520)))))

(assert (= (and d!58033 res!103144) b!211235))

(assert (= (and b!211235 res!103143) b!211236))

(declare-fun m!238995 () Bool)

(assert (=> d!58033 m!238995))

(declare-fun m!238997 () Bool)

(assert (=> d!58033 m!238997))

(declare-fun m!238999 () Bool)

(assert (=> d!58033 m!238999))

(declare-fun m!239001 () Bool)

(assert (=> d!58033 m!239001))

(declare-fun m!239003 () Bool)

(assert (=> b!211235 m!239003))

(declare-fun m!239005 () Bool)

(assert (=> b!211236 m!239005))

(assert (=> b!211030 d!58033))

(declare-fun b!211245 () Bool)

(declare-fun e!137515 () Bool)

(declare-fun e!137516 () Bool)

(assert (=> b!211245 (= e!137515 e!137516)))

(declare-fun c!35680 () Bool)

(assert (=> b!211245 (= c!35680 (validKeyInArray!0 (select (arr!4773 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211246 () Bool)

(declare-fun e!137514 () Bool)

(declare-fun call!19996 () Bool)

(assert (=> b!211246 (= e!137514 call!19996)))

(declare-fun b!211247 () Bool)

(assert (=> b!211247 (= e!137516 call!19996)))

(declare-fun b!211248 () Bool)

(assert (=> b!211248 (= e!137516 e!137514)))

(declare-fun lt!108581 () (_ BitVec 64))

(assert (=> b!211248 (= lt!108581 (select (arr!4773 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108580 () Unit!6408)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10053 (_ BitVec 64) (_ BitVec 32)) Unit!6408)

(assert (=> b!211248 (= lt!108580 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!108581 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!211248 (arrayContainsKey!0 _keys!825 lt!108581 #b00000000000000000000000000000000)))

(declare-fun lt!108582 () Unit!6408)

(assert (=> b!211248 (= lt!108582 lt!108580)))

(declare-fun res!103150 () Bool)

(declare-datatypes ((SeekEntryResult!708 0))(
  ( (MissingZero!708 (index!5002 (_ BitVec 32))) (Found!708 (index!5003 (_ BitVec 32))) (Intermediate!708 (undefined!1520 Bool) (index!5004 (_ BitVec 32)) (x!22078 (_ BitVec 32))) (Undefined!708) (MissingVacant!708 (index!5005 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10053 (_ BitVec 32)) SeekEntryResult!708)

(assert (=> b!211248 (= res!103150 (= (seekEntryOrOpen!0 (select (arr!4773 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!708 #b00000000000000000000000000000000)))))

(assert (=> b!211248 (=> (not res!103150) (not e!137514))))

(declare-fun d!58035 () Bool)

(declare-fun res!103149 () Bool)

(assert (=> d!58035 (=> res!103149 e!137515)))

(assert (=> d!58035 (= res!103149 (bvsge #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(assert (=> d!58035 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!137515)))

(declare-fun bm!19993 () Bool)

(assert (=> bm!19993 (= call!19996 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(assert (= (and d!58035 (not res!103149)) b!211245))

(assert (= (and b!211245 c!35680) b!211248))

(assert (= (and b!211245 (not c!35680)) b!211247))

(assert (= (and b!211248 res!103150) b!211246))

(assert (= (or b!211246 b!211247) bm!19993))

(assert (=> b!211245 m!238827))

(assert (=> b!211245 m!238827))

(assert (=> b!211245 m!238829))

(assert (=> b!211248 m!238827))

(declare-fun m!239007 () Bool)

(assert (=> b!211248 m!239007))

(declare-fun m!239009 () Bool)

(assert (=> b!211248 m!239009))

(assert (=> b!211248 m!238827))

(declare-fun m!239011 () Bool)

(assert (=> b!211248 m!239011))

(declare-fun m!239013 () Bool)

(assert (=> bm!19993 m!239013))

(assert (=> b!211031 d!58035))

(declare-fun b!211255 () Bool)

(declare-fun e!137521 () Bool)

(assert (=> b!211255 (= e!137521 tp_is_empty!5427)))

(declare-fun b!211256 () Bool)

(declare-fun e!137522 () Bool)

(assert (=> b!211256 (= e!137522 tp_is_empty!5427)))

(declare-fun mapNonEmpty!9227 () Bool)

(declare-fun mapRes!9227 () Bool)

(declare-fun tp!19757 () Bool)

(assert (=> mapNonEmpty!9227 (= mapRes!9227 (and tp!19757 e!137521))))

(declare-fun mapRest!9227 () (Array (_ BitVec 32) ValueCell!2370))

(declare-fun mapKey!9227 () (_ BitVec 32))

(declare-fun mapValue!9227 () ValueCell!2370)

(assert (=> mapNonEmpty!9227 (= mapRest!9221 (store mapRest!9227 mapKey!9227 mapValue!9227))))

(declare-fun condMapEmpty!9227 () Bool)

(declare-fun mapDefault!9227 () ValueCell!2370)

(assert (=> mapNonEmpty!9221 (= condMapEmpty!9227 (= mapRest!9221 ((as const (Array (_ BitVec 32) ValueCell!2370)) mapDefault!9227)))))

(assert (=> mapNonEmpty!9221 (= tp!19747 (and e!137522 mapRes!9227))))

(declare-fun mapIsEmpty!9227 () Bool)

(assert (=> mapIsEmpty!9227 mapRes!9227))

(assert (= (and mapNonEmpty!9221 condMapEmpty!9227) mapIsEmpty!9227))

(assert (= (and mapNonEmpty!9221 (not condMapEmpty!9227)) mapNonEmpty!9227))

(assert (= (and mapNonEmpty!9227 ((_ is ValueCellFull!2370) mapValue!9227)) b!211255))

(assert (= (and mapNonEmpty!9221 ((_ is ValueCellFull!2370) mapDefault!9227)) b!211256))

(declare-fun m!239015 () Bool)

(assert (=> mapNonEmpty!9227 m!239015))

(declare-fun b_lambda!7647 () Bool)

(assert (= b_lambda!7643 (or (and start!20994 b_free!5565) b_lambda!7647)))

(declare-fun b_lambda!7649 () Bool)

(assert (= b_lambda!7639 (or (and start!20994 b_free!5565) b_lambda!7649)))

(declare-fun b_lambda!7651 () Bool)

(assert (= b_lambda!7635 (or (and start!20994 b_free!5565) b_lambda!7651)))

(declare-fun b_lambda!7653 () Bool)

(assert (= b_lambda!7645 (or (and start!20994 b_free!5565) b_lambda!7653)))

(declare-fun b_lambda!7655 () Bool)

(assert (= b_lambda!7637 (or (and start!20994 b_free!5565) b_lambda!7655)))

(declare-fun b_lambda!7657 () Bool)

(assert (= b_lambda!7641 (or (and start!20994 b_free!5565) b_lambda!7657)))

(check-sat (not bm!19988) (not d!58025) (not bm!19974) (not b!211245) (not b!211084) (not bm!19955) (not b!211121) (not b_next!5565) (not bm!19983) (not b!211118) (not b!211225) (not b!211248) (not b!211234) (not b_lambda!7655) (not bm!19986) tp_is_empty!5427 (not b!211081) (not b!211124) (not b_lambda!7657) (not b!211230) (not d!58029) (not bm!19971) (not b!211206) (not b!211212) (not b!211221) (not mapNonEmpty!9227) (not b_lambda!7651) (not b!211172) (not bm!19993) (not b!211211) (not d!58023) b_and!12373 (not b!211179) (not b_lambda!7649) (not b!211235) (not bm!19982) (not b!211205) (not b_lambda!7647) (not d!58033) (not bm!19984) (not b!211188) (not b!211226) (not bm!19952) (not b!211125) (not b!211192) (not b!211091) (not d!58031) (not b!211082) (not b!211117) (not b!211207) (not b!211120) (not b!211203) (not b!211210) (not bm!19981) (not bm!19970) (not b!211184) (not b!211191) (not b!211200) (not b!211214) (not b!211204) (not b!211236) (not d!58027) (not b!211119) (not b!211126) (not d!58021) (not b!211183) (not b!211176) (not b_lambda!7653) (not bm!19985) (not b!211218) (not bm!19972) (not b!211233) (not b!211090))
(check-sat b_and!12373 (not b_next!5565))
