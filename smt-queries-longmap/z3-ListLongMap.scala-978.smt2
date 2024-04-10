; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21148 () Bool)

(assert start!21148)

(declare-fun b_free!5619 () Bool)

(declare-fun b_next!5619 () Bool)

(assert (=> start!21148 (= b_free!5619 (not b_next!5619))))

(declare-fun tp!19925 () Bool)

(declare-fun b_and!12473 () Bool)

(assert (=> start!21148 (= tp!19925 b_and!12473)))

(declare-fun b!212922 () Bool)

(declare-fun res!104158 () Bool)

(declare-fun e!138510 () Bool)

(assert (=> b!212922 (=> (not res!104158) (not e!138510))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!212922 (= res!104158 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!9317 () Bool)

(declare-fun mapRes!9317 () Bool)

(declare-fun tp!19924 () Bool)

(declare-fun e!138509 () Bool)

(assert (=> mapNonEmpty!9317 (= mapRes!9317 (and tp!19924 e!138509))))

(declare-datatypes ((V!6955 0))(
  ( (V!6956 (val!2785 Int)) )
))
(declare-datatypes ((ValueCell!2397 0))(
  ( (ValueCellFull!2397 (v!4791 V!6955)) (EmptyCell!2397) )
))
(declare-fun mapRest!9317 () (Array (_ BitVec 32) ValueCell!2397))

(declare-fun mapValue!9317 () ValueCell!2397)

(declare-datatypes ((array!10165 0))(
  ( (array!10166 (arr!4824 (Array (_ BitVec 32) ValueCell!2397)) (size!5149 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10165)

(declare-fun mapKey!9317 () (_ BitVec 32))

(assert (=> mapNonEmpty!9317 (= (arr!4824 _values!649) (store mapRest!9317 mapKey!9317 mapValue!9317))))

(declare-fun b!212923 () Bool)

(declare-fun e!138514 () Bool)

(declare-fun tp_is_empty!5481 () Bool)

(assert (=> b!212923 (= e!138514 tp_is_empty!5481)))

(declare-fun b!212924 () Bool)

(assert (=> b!212924 (= e!138509 tp_is_empty!5481)))

(declare-datatypes ((tuple2!4216 0))(
  ( (tuple2!4217 (_1!2119 (_ BitVec 64)) (_2!2119 V!6955)) )
))
(declare-fun lt!109863 () tuple2!4216)

(declare-fun b!212925 () Bool)

(declare-fun e!138511 () Bool)

(declare-datatypes ((List!3103 0))(
  ( (Nil!3100) (Cons!3099 (h!3741 tuple2!4216) (t!8052 List!3103)) )
))
(declare-datatypes ((ListLongMap!3129 0))(
  ( (ListLongMap!3130 (toList!1580 List!3103)) )
))
(declare-fun lt!109865 () ListLongMap!3129)

(declare-fun lt!109864 () ListLongMap!3129)

(declare-fun +!583 (ListLongMap!3129 tuple2!4216) ListLongMap!3129)

(assert (=> b!212925 (= e!138511 (= lt!109865 (+!583 lt!109864 lt!109863)))))

(declare-fun b!212926 () Bool)

(declare-fun res!104154 () Bool)

(assert (=> b!212926 (=> (not res!104154) (not e!138510))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!10167 0))(
  ( (array!10168 (arr!4825 (Array (_ BitVec 32) (_ BitVec 64))) (size!5150 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10167)

(assert (=> b!212926 (= res!104154 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5150 _keys!825))))))

(declare-fun res!104157 () Bool)

(assert (=> start!21148 (=> (not res!104157) (not e!138510))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21148 (= res!104157 (validMask!0 mask!1149))))

(assert (=> start!21148 e!138510))

(declare-fun e!138512 () Bool)

(declare-fun array_inv!3191 (array!10165) Bool)

(assert (=> start!21148 (and (array_inv!3191 _values!649) e!138512)))

(assert (=> start!21148 true))

(assert (=> start!21148 tp_is_empty!5481))

(declare-fun array_inv!3192 (array!10167) Bool)

(assert (=> start!21148 (array_inv!3192 _keys!825)))

(assert (=> start!21148 tp!19925))

(declare-fun b!212927 () Bool)

(declare-fun res!104159 () Bool)

(assert (=> b!212927 (=> (not res!104159) (not e!138510))))

(declare-datatypes ((List!3104 0))(
  ( (Nil!3101) (Cons!3100 (h!3742 (_ BitVec 64)) (t!8053 List!3104)) )
))
(declare-fun arrayNoDuplicates!0 (array!10167 (_ BitVec 32) List!3104) Bool)

(assert (=> b!212927 (= res!104159 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3101))))

(declare-fun b!212928 () Bool)

(declare-fun res!104156 () Bool)

(assert (=> b!212928 (=> (not res!104156) (not e!138510))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!212928 (= res!104156 (and (= (size!5149 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5150 _keys!825) (size!5149 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!9317 () Bool)

(assert (=> mapIsEmpty!9317 mapRes!9317))

(declare-fun b!212929 () Bool)

(declare-fun res!104161 () Bool)

(assert (=> b!212929 (=> (not res!104161) (not e!138510))))

(assert (=> b!212929 (= res!104161 (= (select (arr!4825 _keys!825) i!601) k0!843))))

(declare-fun b!212930 () Bool)

(declare-fun res!104155 () Bool)

(assert (=> b!212930 (=> (not res!104155) (not e!138510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10167 (_ BitVec 32)) Bool)

(assert (=> b!212930 (= res!104155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!212931 () Bool)

(declare-fun e!138513 () Bool)

(assert (=> b!212931 (= e!138513 (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212931 e!138511))

(declare-fun res!104153 () Bool)

(assert (=> b!212931 (=> (not res!104153) (not e!138511))))

(declare-fun lt!109860 () ListLongMap!3129)

(declare-fun lt!109861 () ListLongMap!3129)

(assert (=> b!212931 (= res!104153 (= lt!109860 (+!583 lt!109861 lt!109863)))))

(declare-fun minValue!615 () V!6955)

(assert (=> b!212931 (= lt!109863 (tuple2!4217 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!212932 () Bool)

(assert (=> b!212932 (= e!138510 (not e!138513))))

(declare-fun res!104160 () Bool)

(assert (=> b!212932 (=> res!104160 e!138513)))

(assert (=> b!212932 (= res!104160 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6955)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1111 (array!10167 array!10165 (_ BitVec 32) (_ BitVec 32) V!6955 V!6955 (_ BitVec 32) Int) ListLongMap!3129)

(assert (=> b!212932 (= lt!109865 (getCurrentListMap!1111 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109859 () array!10165)

(assert (=> b!212932 (= lt!109860 (getCurrentListMap!1111 _keys!825 lt!109859 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109862 () ListLongMap!3129)

(assert (=> b!212932 (and (= lt!109861 lt!109862) (= lt!109862 lt!109861))))

(declare-fun v!520 () V!6955)

(assert (=> b!212932 (= lt!109862 (+!583 lt!109864 (tuple2!4217 k0!843 v!520)))))

(declare-datatypes ((Unit!6460 0))(
  ( (Unit!6461) )
))
(declare-fun lt!109858 () Unit!6460)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!228 (array!10167 array!10165 (_ BitVec 32) (_ BitVec 32) V!6955 V!6955 (_ BitVec 32) (_ BitVec 64) V!6955 (_ BitVec 32) Int) Unit!6460)

(assert (=> b!212932 (= lt!109858 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!228 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!513 (array!10167 array!10165 (_ BitVec 32) (_ BitVec 32) V!6955 V!6955 (_ BitVec 32) Int) ListLongMap!3129)

(assert (=> b!212932 (= lt!109861 (getCurrentListMapNoExtraKeys!513 _keys!825 lt!109859 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212932 (= lt!109859 (array!10166 (store (arr!4824 _values!649) i!601 (ValueCellFull!2397 v!520)) (size!5149 _values!649)))))

(assert (=> b!212932 (= lt!109864 (getCurrentListMapNoExtraKeys!513 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212933 () Bool)

(declare-fun res!104162 () Bool)

(assert (=> b!212933 (=> (not res!104162) (not e!138511))))

(assert (=> b!212933 (= res!104162 (= lt!109860 (+!583 lt!109862 lt!109863)))))

(declare-fun b!212934 () Bool)

(assert (=> b!212934 (= e!138512 (and e!138514 mapRes!9317))))

(declare-fun condMapEmpty!9317 () Bool)

(declare-fun mapDefault!9317 () ValueCell!2397)

(assert (=> b!212934 (= condMapEmpty!9317 (= (arr!4824 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2397)) mapDefault!9317)))))

(assert (= (and start!21148 res!104157) b!212928))

(assert (= (and b!212928 res!104156) b!212930))

(assert (= (and b!212930 res!104155) b!212927))

(assert (= (and b!212927 res!104159) b!212926))

(assert (= (and b!212926 res!104154) b!212922))

(assert (= (and b!212922 res!104158) b!212929))

(assert (= (and b!212929 res!104161) b!212932))

(assert (= (and b!212932 (not res!104160)) b!212931))

(assert (= (and b!212931 res!104153) b!212933))

(assert (= (and b!212933 res!104162) b!212925))

(assert (= (and b!212934 condMapEmpty!9317) mapIsEmpty!9317))

(assert (= (and b!212934 (not condMapEmpty!9317)) mapNonEmpty!9317))

(get-info :version)

(assert (= (and mapNonEmpty!9317 ((_ is ValueCellFull!2397) mapValue!9317)) b!212924))

(assert (= (and b!212934 ((_ is ValueCellFull!2397) mapDefault!9317)) b!212923))

(assert (= start!21148 b!212934))

(declare-fun m!240743 () Bool)

(assert (=> b!212925 m!240743))

(declare-fun m!240745 () Bool)

(assert (=> b!212929 m!240745))

(declare-fun m!240747 () Bool)

(assert (=> b!212932 m!240747))

(declare-fun m!240749 () Bool)

(assert (=> b!212932 m!240749))

(declare-fun m!240751 () Bool)

(assert (=> b!212932 m!240751))

(declare-fun m!240753 () Bool)

(assert (=> b!212932 m!240753))

(declare-fun m!240755 () Bool)

(assert (=> b!212932 m!240755))

(declare-fun m!240757 () Bool)

(assert (=> b!212932 m!240757))

(declare-fun m!240759 () Bool)

(assert (=> b!212932 m!240759))

(declare-fun m!240761 () Bool)

(assert (=> start!21148 m!240761))

(declare-fun m!240763 () Bool)

(assert (=> start!21148 m!240763))

(declare-fun m!240765 () Bool)

(assert (=> start!21148 m!240765))

(declare-fun m!240767 () Bool)

(assert (=> b!212922 m!240767))

(declare-fun m!240769 () Bool)

(assert (=> mapNonEmpty!9317 m!240769))

(declare-fun m!240771 () Bool)

(assert (=> b!212933 m!240771))

(declare-fun m!240773 () Bool)

(assert (=> b!212931 m!240773))

(declare-fun m!240775 () Bool)

(assert (=> b!212927 m!240775))

(declare-fun m!240777 () Bool)

(assert (=> b!212930 m!240777))

(check-sat (not b!212922) (not start!21148) (not b!212927) (not b!212925) (not b!212931) (not mapNonEmpty!9317) (not b!212932) (not b_next!5619) (not b!212933) (not b!212930) tp_is_empty!5481 b_and!12473)
(check-sat b_and!12473 (not b_next!5619))
(get-model)

(declare-fun d!58169 () Bool)

(declare-fun e!138538 () Bool)

(assert (=> d!58169 e!138538))

(declare-fun res!104197 () Bool)

(assert (=> d!58169 (=> (not res!104197) (not e!138538))))

(declare-fun lt!109899 () ListLongMap!3129)

(declare-fun contains!1416 (ListLongMap!3129 (_ BitVec 64)) Bool)

(assert (=> d!58169 (= res!104197 (contains!1416 lt!109899 (_1!2119 lt!109863)))))

(declare-fun lt!109898 () List!3103)

(assert (=> d!58169 (= lt!109899 (ListLongMap!3130 lt!109898))))

(declare-fun lt!109901 () Unit!6460)

(declare-fun lt!109900 () Unit!6460)

(assert (=> d!58169 (= lt!109901 lt!109900)))

(declare-datatypes ((Option!262 0))(
  ( (Some!261 (v!4796 V!6955)) (None!260) )
))
(declare-fun getValueByKey!256 (List!3103 (_ BitVec 64)) Option!262)

(assert (=> d!58169 (= (getValueByKey!256 lt!109898 (_1!2119 lt!109863)) (Some!261 (_2!2119 lt!109863)))))

(declare-fun lemmaContainsTupThenGetReturnValue!143 (List!3103 (_ BitVec 64) V!6955) Unit!6460)

(assert (=> d!58169 (= lt!109900 (lemmaContainsTupThenGetReturnValue!143 lt!109898 (_1!2119 lt!109863) (_2!2119 lt!109863)))))

(declare-fun insertStrictlySorted!146 (List!3103 (_ BitVec 64) V!6955) List!3103)

(assert (=> d!58169 (= lt!109898 (insertStrictlySorted!146 (toList!1580 lt!109862) (_1!2119 lt!109863) (_2!2119 lt!109863)))))

(assert (=> d!58169 (= (+!583 lt!109862 lt!109863) lt!109899)))

(declare-fun b!212978 () Bool)

(declare-fun res!104198 () Bool)

(assert (=> b!212978 (=> (not res!104198) (not e!138538))))

(assert (=> b!212978 (= res!104198 (= (getValueByKey!256 (toList!1580 lt!109899) (_1!2119 lt!109863)) (Some!261 (_2!2119 lt!109863))))))

(declare-fun b!212979 () Bool)

(declare-fun contains!1417 (List!3103 tuple2!4216) Bool)

(assert (=> b!212979 (= e!138538 (contains!1417 (toList!1580 lt!109899) lt!109863))))

(assert (= (and d!58169 res!104197) b!212978))

(assert (= (and b!212978 res!104198) b!212979))

(declare-fun m!240815 () Bool)

(assert (=> d!58169 m!240815))

(declare-fun m!240817 () Bool)

(assert (=> d!58169 m!240817))

(declare-fun m!240819 () Bool)

(assert (=> d!58169 m!240819))

(declare-fun m!240821 () Bool)

(assert (=> d!58169 m!240821))

(declare-fun m!240823 () Bool)

(assert (=> b!212978 m!240823))

(declare-fun m!240825 () Bool)

(assert (=> b!212979 m!240825))

(assert (=> b!212933 d!58169))

(declare-fun d!58171 () Bool)

(declare-fun e!138539 () Bool)

(assert (=> d!58171 e!138539))

(declare-fun res!104199 () Bool)

(assert (=> d!58171 (=> (not res!104199) (not e!138539))))

(declare-fun lt!109903 () ListLongMap!3129)

(assert (=> d!58171 (= res!104199 (contains!1416 lt!109903 (_1!2119 lt!109863)))))

(declare-fun lt!109902 () List!3103)

(assert (=> d!58171 (= lt!109903 (ListLongMap!3130 lt!109902))))

(declare-fun lt!109905 () Unit!6460)

(declare-fun lt!109904 () Unit!6460)

(assert (=> d!58171 (= lt!109905 lt!109904)))

(assert (=> d!58171 (= (getValueByKey!256 lt!109902 (_1!2119 lt!109863)) (Some!261 (_2!2119 lt!109863)))))

(assert (=> d!58171 (= lt!109904 (lemmaContainsTupThenGetReturnValue!143 lt!109902 (_1!2119 lt!109863) (_2!2119 lt!109863)))))

(assert (=> d!58171 (= lt!109902 (insertStrictlySorted!146 (toList!1580 lt!109864) (_1!2119 lt!109863) (_2!2119 lt!109863)))))

(assert (=> d!58171 (= (+!583 lt!109864 lt!109863) lt!109903)))

(declare-fun b!212980 () Bool)

(declare-fun res!104200 () Bool)

(assert (=> b!212980 (=> (not res!104200) (not e!138539))))

(assert (=> b!212980 (= res!104200 (= (getValueByKey!256 (toList!1580 lt!109903) (_1!2119 lt!109863)) (Some!261 (_2!2119 lt!109863))))))

(declare-fun b!212981 () Bool)

(assert (=> b!212981 (= e!138539 (contains!1417 (toList!1580 lt!109903) lt!109863))))

(assert (= (and d!58171 res!104199) b!212980))

(assert (= (and b!212980 res!104200) b!212981))

(declare-fun m!240827 () Bool)

(assert (=> d!58171 m!240827))

(declare-fun m!240829 () Bool)

(assert (=> d!58171 m!240829))

(declare-fun m!240831 () Bool)

(assert (=> d!58171 m!240831))

(declare-fun m!240833 () Bool)

(assert (=> d!58171 m!240833))

(declare-fun m!240835 () Bool)

(assert (=> b!212980 m!240835))

(declare-fun m!240837 () Bool)

(assert (=> b!212981 m!240837))

(assert (=> b!212925 d!58171))

(declare-fun b!212990 () Bool)

(declare-fun e!138546 () Bool)

(declare-fun call!20175 () Bool)

(assert (=> b!212990 (= e!138546 call!20175)))

(declare-fun b!212991 () Bool)

(declare-fun e!138547 () Bool)

(assert (=> b!212991 (= e!138547 e!138546)))

(declare-fun lt!109914 () (_ BitVec 64))

(assert (=> b!212991 (= lt!109914 (select (arr!4825 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109913 () Unit!6460)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10167 (_ BitVec 64) (_ BitVec 32)) Unit!6460)

(assert (=> b!212991 (= lt!109913 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!109914 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!212991 (arrayContainsKey!0 _keys!825 lt!109914 #b00000000000000000000000000000000)))

(declare-fun lt!109912 () Unit!6460)

(assert (=> b!212991 (= lt!109912 lt!109913)))

(declare-fun res!104205 () Bool)

(declare-datatypes ((SeekEntryResult!713 0))(
  ( (MissingZero!713 (index!5022 (_ BitVec 32))) (Found!713 (index!5023 (_ BitVec 32))) (Intermediate!713 (undefined!1525 Bool) (index!5024 (_ BitVec 32)) (x!22210 (_ BitVec 32))) (Undefined!713) (MissingVacant!713 (index!5025 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10167 (_ BitVec 32)) SeekEntryResult!713)

(assert (=> b!212991 (= res!104205 (= (seekEntryOrOpen!0 (select (arr!4825 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!713 #b00000000000000000000000000000000)))))

(assert (=> b!212991 (=> (not res!104205) (not e!138546))))

(declare-fun b!212993 () Bool)

(declare-fun e!138548 () Bool)

(assert (=> b!212993 (= e!138548 e!138547)))

(declare-fun c!35879 () Bool)

(assert (=> b!212993 (= c!35879 (validKeyInArray!0 (select (arr!4825 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20172 () Bool)

(assert (=> bm!20172 (= call!20175 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun d!58173 () Bool)

(declare-fun res!104206 () Bool)

(assert (=> d!58173 (=> res!104206 e!138548)))

(assert (=> d!58173 (= res!104206 (bvsge #b00000000000000000000000000000000 (size!5150 _keys!825)))))

(assert (=> d!58173 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!138548)))

(declare-fun b!212992 () Bool)

(assert (=> b!212992 (= e!138547 call!20175)))

(assert (= (and d!58173 (not res!104206)) b!212993))

(assert (= (and b!212993 c!35879) b!212991))

(assert (= (and b!212993 (not c!35879)) b!212992))

(assert (= (and b!212991 res!104205) b!212990))

(assert (= (or b!212990 b!212992) bm!20172))

(declare-fun m!240839 () Bool)

(assert (=> b!212991 m!240839))

(declare-fun m!240841 () Bool)

(assert (=> b!212991 m!240841))

(declare-fun m!240843 () Bool)

(assert (=> b!212991 m!240843))

(assert (=> b!212991 m!240839))

(declare-fun m!240845 () Bool)

(assert (=> b!212991 m!240845))

(assert (=> b!212993 m!240839))

(assert (=> b!212993 m!240839))

(declare-fun m!240847 () Bool)

(assert (=> b!212993 m!240847))

(declare-fun m!240849 () Bool)

(assert (=> bm!20172 m!240849))

(assert (=> b!212930 d!58173))

(declare-fun d!58175 () Bool)

(declare-fun e!138549 () Bool)

(assert (=> d!58175 e!138549))

(declare-fun res!104207 () Bool)

(assert (=> d!58175 (=> (not res!104207) (not e!138549))))

(declare-fun lt!109916 () ListLongMap!3129)

(assert (=> d!58175 (= res!104207 (contains!1416 lt!109916 (_1!2119 lt!109863)))))

(declare-fun lt!109915 () List!3103)

(assert (=> d!58175 (= lt!109916 (ListLongMap!3130 lt!109915))))

(declare-fun lt!109918 () Unit!6460)

(declare-fun lt!109917 () Unit!6460)

(assert (=> d!58175 (= lt!109918 lt!109917)))

(assert (=> d!58175 (= (getValueByKey!256 lt!109915 (_1!2119 lt!109863)) (Some!261 (_2!2119 lt!109863)))))

(assert (=> d!58175 (= lt!109917 (lemmaContainsTupThenGetReturnValue!143 lt!109915 (_1!2119 lt!109863) (_2!2119 lt!109863)))))

(assert (=> d!58175 (= lt!109915 (insertStrictlySorted!146 (toList!1580 lt!109861) (_1!2119 lt!109863) (_2!2119 lt!109863)))))

(assert (=> d!58175 (= (+!583 lt!109861 lt!109863) lt!109916)))

(declare-fun b!212994 () Bool)

(declare-fun res!104208 () Bool)

(assert (=> b!212994 (=> (not res!104208) (not e!138549))))

(assert (=> b!212994 (= res!104208 (= (getValueByKey!256 (toList!1580 lt!109916) (_1!2119 lt!109863)) (Some!261 (_2!2119 lt!109863))))))

(declare-fun b!212995 () Bool)

(assert (=> b!212995 (= e!138549 (contains!1417 (toList!1580 lt!109916) lt!109863))))

(assert (= (and d!58175 res!104207) b!212994))

(assert (= (and b!212994 res!104208) b!212995))

(declare-fun m!240851 () Bool)

(assert (=> d!58175 m!240851))

(declare-fun m!240853 () Bool)

(assert (=> d!58175 m!240853))

(declare-fun m!240855 () Bool)

(assert (=> d!58175 m!240855))

(declare-fun m!240857 () Bool)

(assert (=> d!58175 m!240857))

(declare-fun m!240859 () Bool)

(assert (=> b!212994 m!240859))

(declare-fun m!240861 () Bool)

(assert (=> b!212995 m!240861))

(assert (=> b!212931 d!58175))

(declare-fun d!58177 () Bool)

(assert (=> d!58177 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!212922 d!58177))

(declare-fun b!213006 () Bool)

(declare-fun e!138558 () Bool)

(declare-fun e!138560 () Bool)

(assert (=> b!213006 (= e!138558 e!138560)))

(declare-fun c!35882 () Bool)

(assert (=> b!213006 (= c!35882 (validKeyInArray!0 (select (arr!4825 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213007 () Bool)

(declare-fun call!20178 () Bool)

(assert (=> b!213007 (= e!138560 call!20178)))

(declare-fun d!58179 () Bool)

(declare-fun res!104215 () Bool)

(declare-fun e!138559 () Bool)

(assert (=> d!58179 (=> res!104215 e!138559)))

(assert (=> d!58179 (= res!104215 (bvsge #b00000000000000000000000000000000 (size!5150 _keys!825)))))

(assert (=> d!58179 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3101) e!138559)))

(declare-fun b!213008 () Bool)

(assert (=> b!213008 (= e!138560 call!20178)))

(declare-fun b!213009 () Bool)

(assert (=> b!213009 (= e!138559 e!138558)))

(declare-fun res!104216 () Bool)

(assert (=> b!213009 (=> (not res!104216) (not e!138558))))

(declare-fun e!138561 () Bool)

(assert (=> b!213009 (= res!104216 (not e!138561))))

(declare-fun res!104217 () Bool)

(assert (=> b!213009 (=> (not res!104217) (not e!138561))))

(assert (=> b!213009 (= res!104217 (validKeyInArray!0 (select (arr!4825 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213010 () Bool)

(declare-fun contains!1418 (List!3104 (_ BitVec 64)) Bool)

(assert (=> b!213010 (= e!138561 (contains!1418 Nil!3101 (select (arr!4825 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20175 () Bool)

(assert (=> bm!20175 (= call!20178 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35882 (Cons!3100 (select (arr!4825 _keys!825) #b00000000000000000000000000000000) Nil!3101) Nil!3101)))))

(assert (= (and d!58179 (not res!104215)) b!213009))

(assert (= (and b!213009 res!104217) b!213010))

(assert (= (and b!213009 res!104216) b!213006))

(assert (= (and b!213006 c!35882) b!213007))

(assert (= (and b!213006 (not c!35882)) b!213008))

(assert (= (or b!213007 b!213008) bm!20175))

(assert (=> b!213006 m!240839))

(assert (=> b!213006 m!240839))

(assert (=> b!213006 m!240847))

(assert (=> b!213009 m!240839))

(assert (=> b!213009 m!240839))

(assert (=> b!213009 m!240847))

(assert (=> b!213010 m!240839))

(assert (=> b!213010 m!240839))

(declare-fun m!240863 () Bool)

(assert (=> b!213010 m!240863))

(assert (=> bm!20175 m!240839))

(declare-fun m!240865 () Bool)

(assert (=> bm!20175 m!240865))

(assert (=> b!212927 d!58179))

(declare-fun b!213035 () Bool)

(declare-fun res!104226 () Bool)

(declare-fun e!138581 () Bool)

(assert (=> b!213035 (=> (not res!104226) (not e!138581))))

(declare-fun lt!109933 () ListLongMap!3129)

(assert (=> b!213035 (= res!104226 (not (contains!1416 lt!109933 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!213036 () Bool)

(declare-fun e!138579 () Bool)

(assert (=> b!213036 (= e!138579 (= lt!109933 (getCurrentListMapNoExtraKeys!513 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!213037 () Bool)

(declare-fun isEmpty!499 (ListLongMap!3129) Bool)

(assert (=> b!213037 (= e!138579 (isEmpty!499 lt!109933))))

(declare-fun b!213038 () Bool)

(declare-fun e!138578 () Bool)

(declare-fun e!138576 () Bool)

(assert (=> b!213038 (= e!138578 e!138576)))

(assert (=> b!213038 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5150 _keys!825)))))

(declare-fun res!104229 () Bool)

(assert (=> b!213038 (= res!104229 (contains!1416 lt!109933 (select (arr!4825 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213038 (=> (not res!104229) (not e!138576))))

(declare-fun call!20181 () ListLongMap!3129)

(declare-fun bm!20178 () Bool)

(assert (=> bm!20178 (= call!20181 (getCurrentListMapNoExtraKeys!513 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!213039 () Bool)

(assert (=> b!213039 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5150 _keys!825)))))

(assert (=> b!213039 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5149 _values!649)))))

(declare-fun apply!198 (ListLongMap!3129 (_ BitVec 64)) V!6955)

(declare-fun get!2580 (ValueCell!2397 V!6955) V!6955)

(declare-fun dynLambda!541 (Int (_ BitVec 64)) V!6955)

(assert (=> b!213039 (= e!138576 (= (apply!198 lt!109933 (select (arr!4825 _keys!825) #b00000000000000000000000000000000)) (get!2580 (select (arr!4824 _values!649) #b00000000000000000000000000000000) (dynLambda!541 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!213040 () Bool)

(assert (=> b!213040 (= e!138578 e!138579)))

(declare-fun c!35891 () Bool)

(assert (=> b!213040 (= c!35891 (bvslt #b00000000000000000000000000000000 (size!5150 _keys!825)))))

(declare-fun b!213041 () Bool)

(declare-fun e!138577 () ListLongMap!3129)

(declare-fun e!138580 () ListLongMap!3129)

(assert (=> b!213041 (= e!138577 e!138580)))

(declare-fun c!35893 () Bool)

(assert (=> b!213041 (= c!35893 (validKeyInArray!0 (select (arr!4825 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!58181 () Bool)

(assert (=> d!58181 e!138581))

(declare-fun res!104227 () Bool)

(assert (=> d!58181 (=> (not res!104227) (not e!138581))))

(assert (=> d!58181 (= res!104227 (not (contains!1416 lt!109933 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58181 (= lt!109933 e!138577)))

(declare-fun c!35892 () Bool)

(assert (=> d!58181 (= c!35892 (bvsge #b00000000000000000000000000000000 (size!5150 _keys!825)))))

(assert (=> d!58181 (validMask!0 mask!1149)))

(assert (=> d!58181 (= (getCurrentListMapNoExtraKeys!513 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109933)))

(declare-fun b!213042 () Bool)

(assert (=> b!213042 (= e!138580 call!20181)))

(declare-fun b!213043 () Bool)

(declare-fun lt!109935 () Unit!6460)

(declare-fun lt!109937 () Unit!6460)

(assert (=> b!213043 (= lt!109935 lt!109937)))

(declare-fun lt!109934 () (_ BitVec 64))

(declare-fun lt!109939 () (_ BitVec 64))

(declare-fun lt!109936 () ListLongMap!3129)

(declare-fun lt!109938 () V!6955)

(assert (=> b!213043 (not (contains!1416 (+!583 lt!109936 (tuple2!4217 lt!109939 lt!109938)) lt!109934))))

(declare-fun addStillNotContains!107 (ListLongMap!3129 (_ BitVec 64) V!6955 (_ BitVec 64)) Unit!6460)

(assert (=> b!213043 (= lt!109937 (addStillNotContains!107 lt!109936 lt!109939 lt!109938 lt!109934))))

(assert (=> b!213043 (= lt!109934 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!213043 (= lt!109938 (get!2580 (select (arr!4824 _values!649) #b00000000000000000000000000000000) (dynLambda!541 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213043 (= lt!109939 (select (arr!4825 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!213043 (= lt!109936 call!20181)))

(assert (=> b!213043 (= e!138580 (+!583 call!20181 (tuple2!4217 (select (arr!4825 _keys!825) #b00000000000000000000000000000000) (get!2580 (select (arr!4824 _values!649) #b00000000000000000000000000000000) (dynLambda!541 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!213044 () Bool)

(assert (=> b!213044 (= e!138577 (ListLongMap!3130 Nil!3100))))

(declare-fun b!213045 () Bool)

(declare-fun e!138582 () Bool)

(assert (=> b!213045 (= e!138582 (validKeyInArray!0 (select (arr!4825 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213045 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!213046 () Bool)

(assert (=> b!213046 (= e!138581 e!138578)))

(declare-fun c!35894 () Bool)

(assert (=> b!213046 (= c!35894 e!138582)))

(declare-fun res!104228 () Bool)

(assert (=> b!213046 (=> (not res!104228) (not e!138582))))

(assert (=> b!213046 (= res!104228 (bvslt #b00000000000000000000000000000000 (size!5150 _keys!825)))))

(assert (= (and d!58181 c!35892) b!213044))

(assert (= (and d!58181 (not c!35892)) b!213041))

(assert (= (and b!213041 c!35893) b!213043))

(assert (= (and b!213041 (not c!35893)) b!213042))

(assert (= (or b!213043 b!213042) bm!20178))

(assert (= (and d!58181 res!104227) b!213035))

(assert (= (and b!213035 res!104226) b!213046))

(assert (= (and b!213046 res!104228) b!213045))

(assert (= (and b!213046 c!35894) b!213038))

(assert (= (and b!213046 (not c!35894)) b!213040))

(assert (= (and b!213038 res!104229) b!213039))

(assert (= (and b!213040 c!35891) b!213036))

(assert (= (and b!213040 (not c!35891)) b!213037))

(declare-fun b_lambda!7755 () Bool)

(assert (=> (not b_lambda!7755) (not b!213039)))

(declare-fun t!8057 () Bool)

(declare-fun tb!2909 () Bool)

(assert (=> (and start!21148 (= defaultEntry!657 defaultEntry!657) t!8057) tb!2909))

(declare-fun result!5015 () Bool)

(assert (=> tb!2909 (= result!5015 tp_is_empty!5481)))

(assert (=> b!213039 t!8057))

(declare-fun b_and!12477 () Bool)

(assert (= b_and!12473 (and (=> t!8057 result!5015) b_and!12477)))

(declare-fun b_lambda!7757 () Bool)

(assert (=> (not b_lambda!7757) (not b!213043)))

(assert (=> b!213043 t!8057))

(declare-fun b_and!12479 () Bool)

(assert (= b_and!12477 (and (=> t!8057 result!5015) b_and!12479)))

(assert (=> b!213045 m!240839))

(assert (=> b!213045 m!240839))

(assert (=> b!213045 m!240847))

(declare-fun m!240867 () Bool)

(assert (=> b!213035 m!240867))

(assert (=> b!213039 m!240839))

(declare-fun m!240869 () Bool)

(assert (=> b!213039 m!240869))

(assert (=> b!213039 m!240839))

(declare-fun m!240871 () Bool)

(assert (=> b!213039 m!240871))

(assert (=> b!213039 m!240869))

(declare-fun m!240873 () Bool)

(assert (=> b!213039 m!240873))

(declare-fun m!240875 () Bool)

(assert (=> b!213039 m!240875))

(assert (=> b!213039 m!240873))

(declare-fun m!240877 () Bool)

(assert (=> b!213036 m!240877))

(declare-fun m!240879 () Bool)

(assert (=> b!213043 m!240879))

(assert (=> b!213043 m!240879))

(declare-fun m!240881 () Bool)

(assert (=> b!213043 m!240881))

(declare-fun m!240883 () Bool)

(assert (=> b!213043 m!240883))

(assert (=> b!213043 m!240869))

(declare-fun m!240885 () Bool)

(assert (=> b!213043 m!240885))

(assert (=> b!213043 m!240839))

(assert (=> b!213043 m!240869))

(assert (=> b!213043 m!240873))

(assert (=> b!213043 m!240875))

(assert (=> b!213043 m!240873))

(declare-fun m!240887 () Bool)

(assert (=> d!58181 m!240887))

(assert (=> d!58181 m!240761))

(assert (=> b!213041 m!240839))

(assert (=> b!213041 m!240839))

(assert (=> b!213041 m!240847))

(assert (=> bm!20178 m!240877))

(assert (=> b!213038 m!240839))

(assert (=> b!213038 m!240839))

(declare-fun m!240889 () Bool)

(assert (=> b!213038 m!240889))

(declare-fun m!240891 () Bool)

(assert (=> b!213037 m!240891))

(assert (=> b!212932 d!58181))

(declare-fun b!213091 () Bool)

(declare-fun e!138618 () Bool)

(declare-fun lt!109986 () ListLongMap!3129)

(assert (=> b!213091 (= e!138618 (= (apply!198 lt!109986 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!213092 () Bool)

(declare-fun e!138611 () Bool)

(declare-fun e!138613 () Bool)

(assert (=> b!213092 (= e!138611 e!138613)))

(declare-fun c!35907 () Bool)

(assert (=> b!213092 (= c!35907 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!20193 () Bool)

(declare-fun call!20202 () ListLongMap!3129)

(declare-fun call!20201 () ListLongMap!3129)

(assert (=> bm!20193 (= call!20202 call!20201)))

(declare-fun b!213093 () Bool)

(declare-fun e!138610 () Bool)

(assert (=> b!213093 (= e!138610 (validKeyInArray!0 (select (arr!4825 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213094 () Bool)

(declare-fun e!138616 () ListLongMap!3129)

(declare-fun call!20199 () ListLongMap!3129)

(assert (=> b!213094 (= e!138616 (+!583 call!20199 (tuple2!4217 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!213095 () Bool)

(declare-fun e!138621 () Unit!6460)

(declare-fun Unit!6462 () Unit!6460)

(assert (=> b!213095 (= e!138621 Unit!6462)))

(declare-fun b!213096 () Bool)

(declare-fun call!20198 () Bool)

(assert (=> b!213096 (= e!138613 (not call!20198))))

(declare-fun b!213097 () Bool)

(assert (=> b!213097 (= e!138613 e!138618)))

(declare-fun res!104252 () Bool)

(assert (=> b!213097 (= res!104252 call!20198)))

(assert (=> b!213097 (=> (not res!104252) (not e!138618))))

(declare-fun b!213098 () Bool)

(declare-fun e!138619 () ListLongMap!3129)

(declare-fun call!20200 () ListLongMap!3129)

(assert (=> b!213098 (= e!138619 call!20200)))

(declare-fun b!213099 () Bool)

(declare-fun res!104249 () Bool)

(assert (=> b!213099 (=> (not res!104249) (not e!138611))))

(declare-fun e!138609 () Bool)

(assert (=> b!213099 (= res!104249 e!138609)))

(declare-fun c!35911 () Bool)

(assert (=> b!213099 (= c!35911 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!20195 () Bool)

(declare-fun call!20197 () Bool)

(assert (=> bm!20195 (= call!20197 (contains!1416 lt!109986 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!213100 () Bool)

(declare-fun res!104254 () Bool)

(assert (=> b!213100 (=> (not res!104254) (not e!138611))))

(declare-fun e!138615 () Bool)

(assert (=> b!213100 (= res!104254 e!138615)))

(declare-fun res!104248 () Bool)

(assert (=> b!213100 (=> res!104248 e!138615)))

(declare-fun e!138614 () Bool)

(assert (=> b!213100 (= res!104248 (not e!138614))))

(declare-fun res!104251 () Bool)

(assert (=> b!213100 (=> (not res!104251) (not e!138614))))

(assert (=> b!213100 (= res!104251 (bvslt #b00000000000000000000000000000000 (size!5150 _keys!825)))))

(declare-fun b!213101 () Bool)

(declare-fun e!138617 () ListLongMap!3129)

(assert (=> b!213101 (= e!138617 call!20200)))

(declare-fun call!20196 () ListLongMap!3129)

(declare-fun bm!20196 () Bool)

(assert (=> bm!20196 (= call!20196 (getCurrentListMapNoExtraKeys!513 _keys!825 lt!109859 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213102 () Bool)

(declare-fun e!138612 () Bool)

(assert (=> b!213102 (= e!138612 (= (apply!198 lt!109986 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!213103 () Bool)

(assert (=> b!213103 (= e!138609 (not call!20197))))

(declare-fun b!213104 () Bool)

(assert (=> b!213104 (= e!138614 (validKeyInArray!0 (select (arr!4825 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213105 () Bool)

(assert (=> b!213105 (= e!138609 e!138612)))

(declare-fun res!104255 () Bool)

(assert (=> b!213105 (= res!104255 call!20197)))

(assert (=> b!213105 (=> (not res!104255) (not e!138612))))

(declare-fun e!138620 () Bool)

(declare-fun b!213106 () Bool)

(assert (=> b!213106 (= e!138620 (= (apply!198 lt!109986 (select (arr!4825 _keys!825) #b00000000000000000000000000000000)) (get!2580 (select (arr!4824 lt!109859) #b00000000000000000000000000000000) (dynLambda!541 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!213106 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5149 lt!109859)))))

(assert (=> b!213106 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5150 _keys!825)))))

(declare-fun bm!20197 () Bool)

(assert (=> bm!20197 (= call!20200 call!20199)))

(declare-fun bm!20198 () Bool)

(declare-fun c!35910 () Bool)

(declare-fun c!35908 () Bool)

(assert (=> bm!20198 (= call!20199 (+!583 (ite c!35910 call!20196 (ite c!35908 call!20201 call!20202)) (ite (or c!35910 c!35908) (tuple2!4217 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4217 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!213107 () Bool)

(declare-fun c!35912 () Bool)

(assert (=> b!213107 (= c!35912 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!213107 (= e!138619 e!138617)))

(declare-fun b!213108 () Bool)

(assert (=> b!213108 (= e!138617 call!20202)))

(declare-fun b!213109 () Bool)

(declare-fun lt!109998 () Unit!6460)

(assert (=> b!213109 (= e!138621 lt!109998)))

(declare-fun lt!109997 () ListLongMap!3129)

(assert (=> b!213109 (= lt!109997 (getCurrentListMapNoExtraKeys!513 _keys!825 lt!109859 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110004 () (_ BitVec 64))

(assert (=> b!213109 (= lt!110004 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109992 () (_ BitVec 64))

(assert (=> b!213109 (= lt!109992 (select (arr!4825 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109984 () Unit!6460)

(declare-fun addStillContains!174 (ListLongMap!3129 (_ BitVec 64) V!6955 (_ BitVec 64)) Unit!6460)

(assert (=> b!213109 (= lt!109984 (addStillContains!174 lt!109997 lt!110004 zeroValue!615 lt!109992))))

(assert (=> b!213109 (contains!1416 (+!583 lt!109997 (tuple2!4217 lt!110004 zeroValue!615)) lt!109992)))

(declare-fun lt!109985 () Unit!6460)

(assert (=> b!213109 (= lt!109985 lt!109984)))

(declare-fun lt!109989 () ListLongMap!3129)

(assert (=> b!213109 (= lt!109989 (getCurrentListMapNoExtraKeys!513 _keys!825 lt!109859 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109990 () (_ BitVec 64))

(assert (=> b!213109 (= lt!109990 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110002 () (_ BitVec 64))

(assert (=> b!213109 (= lt!110002 (select (arr!4825 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109991 () Unit!6460)

(declare-fun addApplyDifferent!174 (ListLongMap!3129 (_ BitVec 64) V!6955 (_ BitVec 64)) Unit!6460)

(assert (=> b!213109 (= lt!109991 (addApplyDifferent!174 lt!109989 lt!109990 minValue!615 lt!110002))))

(assert (=> b!213109 (= (apply!198 (+!583 lt!109989 (tuple2!4217 lt!109990 minValue!615)) lt!110002) (apply!198 lt!109989 lt!110002))))

(declare-fun lt!109993 () Unit!6460)

(assert (=> b!213109 (= lt!109993 lt!109991)))

(declare-fun lt!109994 () ListLongMap!3129)

(assert (=> b!213109 (= lt!109994 (getCurrentListMapNoExtraKeys!513 _keys!825 lt!109859 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109996 () (_ BitVec 64))

(assert (=> b!213109 (= lt!109996 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110000 () (_ BitVec 64))

(assert (=> b!213109 (= lt!110000 (select (arr!4825 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110001 () Unit!6460)

(assert (=> b!213109 (= lt!110001 (addApplyDifferent!174 lt!109994 lt!109996 zeroValue!615 lt!110000))))

(assert (=> b!213109 (= (apply!198 (+!583 lt!109994 (tuple2!4217 lt!109996 zeroValue!615)) lt!110000) (apply!198 lt!109994 lt!110000))))

(declare-fun lt!110005 () Unit!6460)

(assert (=> b!213109 (= lt!110005 lt!110001)))

(declare-fun lt!109988 () ListLongMap!3129)

(assert (=> b!213109 (= lt!109988 (getCurrentListMapNoExtraKeys!513 _keys!825 lt!109859 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109999 () (_ BitVec 64))

(assert (=> b!213109 (= lt!109999 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109995 () (_ BitVec 64))

(assert (=> b!213109 (= lt!109995 (select (arr!4825 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!213109 (= lt!109998 (addApplyDifferent!174 lt!109988 lt!109999 minValue!615 lt!109995))))

(assert (=> b!213109 (= (apply!198 (+!583 lt!109988 (tuple2!4217 lt!109999 minValue!615)) lt!109995) (apply!198 lt!109988 lt!109995))))

(declare-fun bm!20194 () Bool)

(assert (=> bm!20194 (= call!20198 (contains!1416 lt!109986 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!58183 () Bool)

(assert (=> d!58183 e!138611))

(declare-fun res!104256 () Bool)

(assert (=> d!58183 (=> (not res!104256) (not e!138611))))

(assert (=> d!58183 (= res!104256 (or (bvsge #b00000000000000000000000000000000 (size!5150 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5150 _keys!825)))))))

(declare-fun lt!110003 () ListLongMap!3129)

(assert (=> d!58183 (= lt!109986 lt!110003)))

(declare-fun lt!109987 () Unit!6460)

(assert (=> d!58183 (= lt!109987 e!138621)))

(declare-fun c!35909 () Bool)

(assert (=> d!58183 (= c!35909 e!138610)))

(declare-fun res!104253 () Bool)

(assert (=> d!58183 (=> (not res!104253) (not e!138610))))

(assert (=> d!58183 (= res!104253 (bvslt #b00000000000000000000000000000000 (size!5150 _keys!825)))))

(assert (=> d!58183 (= lt!110003 e!138616)))

(assert (=> d!58183 (= c!35910 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58183 (validMask!0 mask!1149)))

(assert (=> d!58183 (= (getCurrentListMap!1111 _keys!825 lt!109859 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109986)))

(declare-fun b!213110 () Bool)

(assert (=> b!213110 (= e!138616 e!138619)))

(assert (=> b!213110 (= c!35908 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!213111 () Bool)

(assert (=> b!213111 (= e!138615 e!138620)))

(declare-fun res!104250 () Bool)

(assert (=> b!213111 (=> (not res!104250) (not e!138620))))

(assert (=> b!213111 (= res!104250 (contains!1416 lt!109986 (select (arr!4825 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213111 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5150 _keys!825)))))

(declare-fun bm!20199 () Bool)

(assert (=> bm!20199 (= call!20201 call!20196)))

(assert (= (and d!58183 c!35910) b!213094))

(assert (= (and d!58183 (not c!35910)) b!213110))

(assert (= (and b!213110 c!35908) b!213098))

(assert (= (and b!213110 (not c!35908)) b!213107))

(assert (= (and b!213107 c!35912) b!213101))

(assert (= (and b!213107 (not c!35912)) b!213108))

(assert (= (or b!213101 b!213108) bm!20193))

(assert (= (or b!213098 bm!20193) bm!20199))

(assert (= (or b!213098 b!213101) bm!20197))

(assert (= (or b!213094 bm!20199) bm!20196))

(assert (= (or b!213094 bm!20197) bm!20198))

(assert (= (and d!58183 res!104253) b!213093))

(assert (= (and d!58183 c!35909) b!213109))

(assert (= (and d!58183 (not c!35909)) b!213095))

(assert (= (and d!58183 res!104256) b!213100))

(assert (= (and b!213100 res!104251) b!213104))

(assert (= (and b!213100 (not res!104248)) b!213111))

(assert (= (and b!213111 res!104250) b!213106))

(assert (= (and b!213100 res!104254) b!213099))

(assert (= (and b!213099 c!35911) b!213105))

(assert (= (and b!213099 (not c!35911)) b!213103))

(assert (= (and b!213105 res!104255) b!213102))

(assert (= (or b!213105 b!213103) bm!20195))

(assert (= (and b!213099 res!104249) b!213092))

(assert (= (and b!213092 c!35907) b!213097))

(assert (= (and b!213092 (not c!35907)) b!213096))

(assert (= (and b!213097 res!104252) b!213091))

(assert (= (or b!213097 b!213096) bm!20194))

(declare-fun b_lambda!7759 () Bool)

(assert (=> (not b_lambda!7759) (not b!213106)))

(assert (=> b!213106 t!8057))

(declare-fun b_and!12481 () Bool)

(assert (= b_and!12479 (and (=> t!8057 result!5015) b_and!12481)))

(declare-fun m!240893 () Bool)

(assert (=> b!213091 m!240893))

(declare-fun m!240895 () Bool)

(assert (=> b!213094 m!240895))

(declare-fun m!240897 () Bool)

(assert (=> bm!20195 m!240897))

(assert (=> d!58183 m!240761))

(assert (=> bm!20196 m!240751))

(assert (=> b!213093 m!240839))

(assert (=> b!213093 m!240839))

(assert (=> b!213093 m!240847))

(declare-fun m!240899 () Bool)

(assert (=> bm!20194 m!240899))

(assert (=> b!213106 m!240839))

(assert (=> b!213106 m!240839))

(declare-fun m!240901 () Bool)

(assert (=> b!213106 m!240901))

(assert (=> b!213106 m!240873))

(declare-fun m!240903 () Bool)

(assert (=> b!213106 m!240903))

(assert (=> b!213106 m!240873))

(declare-fun m!240905 () Bool)

(assert (=> b!213106 m!240905))

(assert (=> b!213106 m!240903))

(declare-fun m!240907 () Bool)

(assert (=> b!213109 m!240907))

(declare-fun m!240909 () Bool)

(assert (=> b!213109 m!240909))

(assert (=> b!213109 m!240907))

(assert (=> b!213109 m!240839))

(declare-fun m!240911 () Bool)

(assert (=> b!213109 m!240911))

(declare-fun m!240913 () Bool)

(assert (=> b!213109 m!240913))

(declare-fun m!240915 () Bool)

(assert (=> b!213109 m!240915))

(declare-fun m!240917 () Bool)

(assert (=> b!213109 m!240917))

(declare-fun m!240919 () Bool)

(assert (=> b!213109 m!240919))

(declare-fun m!240921 () Bool)

(assert (=> b!213109 m!240921))

(declare-fun m!240923 () Bool)

(assert (=> b!213109 m!240923))

(declare-fun m!240925 () Bool)

(assert (=> b!213109 m!240925))

(declare-fun m!240927 () Bool)

(assert (=> b!213109 m!240927))

(declare-fun m!240929 () Bool)

(assert (=> b!213109 m!240929))

(assert (=> b!213109 m!240917))

(assert (=> b!213109 m!240913))

(declare-fun m!240931 () Bool)

(assert (=> b!213109 m!240931))

(declare-fun m!240933 () Bool)

(assert (=> b!213109 m!240933))

(assert (=> b!213109 m!240751))

(declare-fun m!240935 () Bool)

(assert (=> b!213109 m!240935))

(assert (=> b!213109 m!240923))

(declare-fun m!240937 () Bool)

(assert (=> b!213102 m!240937))

(assert (=> b!213111 m!240839))

(assert (=> b!213111 m!240839))

(declare-fun m!240939 () Bool)

(assert (=> b!213111 m!240939))

(declare-fun m!240941 () Bool)

(assert (=> bm!20198 m!240941))

(assert (=> b!213104 m!240839))

(assert (=> b!213104 m!240839))

(assert (=> b!213104 m!240847))

(assert (=> b!212932 d!58183))

(declare-fun d!58185 () Bool)

(declare-fun e!138627 () Bool)

(assert (=> d!58185 e!138627))

(declare-fun res!104259 () Bool)

(assert (=> d!58185 (=> (not res!104259) (not e!138627))))

(assert (=> d!58185 (= res!104259 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5149 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5149 _values!649))))))))

(declare-fun lt!110008 () Unit!6460)

(declare-fun choose!1082 (array!10167 array!10165 (_ BitVec 32) (_ BitVec 32) V!6955 V!6955 (_ BitVec 32) (_ BitVec 64) V!6955 (_ BitVec 32) Int) Unit!6460)

(assert (=> d!58185 (= lt!110008 (choose!1082 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!58185 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5150 _keys!825)))))

(assert (=> d!58185 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!228 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!110008)))

(declare-fun e!138626 () Bool)

(declare-fun call!20208 () ListLongMap!3129)

(declare-fun call!20207 () ListLongMap!3129)

(declare-fun b!213118 () Bool)

(assert (=> b!213118 (= e!138626 (= call!20207 (+!583 call!20208 (tuple2!4217 k0!843 v!520))))))

(declare-fun b!213119 () Bool)

(assert (=> b!213119 (= e!138626 (= call!20207 call!20208))))

(declare-fun b!213120 () Bool)

(assert (=> b!213120 (= e!138627 e!138626)))

(declare-fun c!35915 () Bool)

(assert (=> b!213120 (= c!35915 (bvsle #b00000000000000000000000000000000 i!601))))

(declare-fun bm!20204 () Bool)

(assert (=> bm!20204 (= call!20208 (getCurrentListMapNoExtraKeys!513 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun bm!20205 () Bool)

(assert (=> bm!20205 (= call!20207 (getCurrentListMapNoExtraKeys!513 _keys!825 (array!10166 (store (arr!4824 _values!649) i!601 (ValueCellFull!2397 v!520)) (size!5149 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and d!58185 res!104259) b!213120))

(assert (= (and b!213120 c!35915) b!213118))

(assert (= (and b!213120 (not c!35915)) b!213119))

(assert (= (or b!213118 b!213119) bm!20205))

(assert (= (or b!213118 b!213119) bm!20204))

(declare-fun m!240943 () Bool)

(assert (=> d!58185 m!240943))

(declare-fun m!240945 () Bool)

(assert (=> b!213118 m!240945))

(assert (=> bm!20204 m!240755))

(assert (=> bm!20205 m!240747))

(declare-fun m!240947 () Bool)

(assert (=> bm!20205 m!240947))

(assert (=> b!212932 d!58185))

(declare-fun b!213121 () Bool)

(declare-fun res!104260 () Bool)

(declare-fun e!138633 () Bool)

(assert (=> b!213121 (=> (not res!104260) (not e!138633))))

(declare-fun lt!110009 () ListLongMap!3129)

(assert (=> b!213121 (= res!104260 (not (contains!1416 lt!110009 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!138631 () Bool)

(declare-fun b!213122 () Bool)

(assert (=> b!213122 (= e!138631 (= lt!110009 (getCurrentListMapNoExtraKeys!513 _keys!825 lt!109859 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!213123 () Bool)

(assert (=> b!213123 (= e!138631 (isEmpty!499 lt!110009))))

(declare-fun b!213124 () Bool)

(declare-fun e!138630 () Bool)

(declare-fun e!138628 () Bool)

(assert (=> b!213124 (= e!138630 e!138628)))

(assert (=> b!213124 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5150 _keys!825)))))

(declare-fun res!104263 () Bool)

(assert (=> b!213124 (= res!104263 (contains!1416 lt!110009 (select (arr!4825 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213124 (=> (not res!104263) (not e!138628))))

(declare-fun bm!20206 () Bool)

(declare-fun call!20209 () ListLongMap!3129)

(assert (=> bm!20206 (= call!20209 (getCurrentListMapNoExtraKeys!513 _keys!825 lt!109859 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!213125 () Bool)

(assert (=> b!213125 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5150 _keys!825)))))

(assert (=> b!213125 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5149 lt!109859)))))

(assert (=> b!213125 (= e!138628 (= (apply!198 lt!110009 (select (arr!4825 _keys!825) #b00000000000000000000000000000000)) (get!2580 (select (arr!4824 lt!109859) #b00000000000000000000000000000000) (dynLambda!541 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!213126 () Bool)

(assert (=> b!213126 (= e!138630 e!138631)))

(declare-fun c!35916 () Bool)

(assert (=> b!213126 (= c!35916 (bvslt #b00000000000000000000000000000000 (size!5150 _keys!825)))))

(declare-fun b!213127 () Bool)

(declare-fun e!138629 () ListLongMap!3129)

(declare-fun e!138632 () ListLongMap!3129)

(assert (=> b!213127 (= e!138629 e!138632)))

(declare-fun c!35918 () Bool)

(assert (=> b!213127 (= c!35918 (validKeyInArray!0 (select (arr!4825 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!58187 () Bool)

(assert (=> d!58187 e!138633))

(declare-fun res!104261 () Bool)

(assert (=> d!58187 (=> (not res!104261) (not e!138633))))

(assert (=> d!58187 (= res!104261 (not (contains!1416 lt!110009 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58187 (= lt!110009 e!138629)))

(declare-fun c!35917 () Bool)

(assert (=> d!58187 (= c!35917 (bvsge #b00000000000000000000000000000000 (size!5150 _keys!825)))))

(assert (=> d!58187 (validMask!0 mask!1149)))

(assert (=> d!58187 (= (getCurrentListMapNoExtraKeys!513 _keys!825 lt!109859 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110009)))

(declare-fun b!213128 () Bool)

(assert (=> b!213128 (= e!138632 call!20209)))

(declare-fun b!213129 () Bool)

(declare-fun lt!110011 () Unit!6460)

(declare-fun lt!110013 () Unit!6460)

(assert (=> b!213129 (= lt!110011 lt!110013)))

(declare-fun lt!110015 () (_ BitVec 64))

(declare-fun lt!110012 () ListLongMap!3129)

(declare-fun lt!110014 () V!6955)

(declare-fun lt!110010 () (_ BitVec 64))

(assert (=> b!213129 (not (contains!1416 (+!583 lt!110012 (tuple2!4217 lt!110015 lt!110014)) lt!110010))))

(assert (=> b!213129 (= lt!110013 (addStillNotContains!107 lt!110012 lt!110015 lt!110014 lt!110010))))

(assert (=> b!213129 (= lt!110010 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!213129 (= lt!110014 (get!2580 (select (arr!4824 lt!109859) #b00000000000000000000000000000000) (dynLambda!541 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213129 (= lt!110015 (select (arr!4825 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!213129 (= lt!110012 call!20209)))

(assert (=> b!213129 (= e!138632 (+!583 call!20209 (tuple2!4217 (select (arr!4825 _keys!825) #b00000000000000000000000000000000) (get!2580 (select (arr!4824 lt!109859) #b00000000000000000000000000000000) (dynLambda!541 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!213130 () Bool)

(assert (=> b!213130 (= e!138629 (ListLongMap!3130 Nil!3100))))

(declare-fun b!213131 () Bool)

(declare-fun e!138634 () Bool)

(assert (=> b!213131 (= e!138634 (validKeyInArray!0 (select (arr!4825 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213131 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!213132 () Bool)

(assert (=> b!213132 (= e!138633 e!138630)))

(declare-fun c!35919 () Bool)

(assert (=> b!213132 (= c!35919 e!138634)))

(declare-fun res!104262 () Bool)

(assert (=> b!213132 (=> (not res!104262) (not e!138634))))

(assert (=> b!213132 (= res!104262 (bvslt #b00000000000000000000000000000000 (size!5150 _keys!825)))))

(assert (= (and d!58187 c!35917) b!213130))

(assert (= (and d!58187 (not c!35917)) b!213127))

(assert (= (and b!213127 c!35918) b!213129))

(assert (= (and b!213127 (not c!35918)) b!213128))

(assert (= (or b!213129 b!213128) bm!20206))

(assert (= (and d!58187 res!104261) b!213121))

(assert (= (and b!213121 res!104260) b!213132))

(assert (= (and b!213132 res!104262) b!213131))

(assert (= (and b!213132 c!35919) b!213124))

(assert (= (and b!213132 (not c!35919)) b!213126))

(assert (= (and b!213124 res!104263) b!213125))

(assert (= (and b!213126 c!35916) b!213122))

(assert (= (and b!213126 (not c!35916)) b!213123))

(declare-fun b_lambda!7761 () Bool)

(assert (=> (not b_lambda!7761) (not b!213125)))

(assert (=> b!213125 t!8057))

(declare-fun b_and!12483 () Bool)

(assert (= b_and!12481 (and (=> t!8057 result!5015) b_and!12483)))

(declare-fun b_lambda!7763 () Bool)

(assert (=> (not b_lambda!7763) (not b!213129)))

(assert (=> b!213129 t!8057))

(declare-fun b_and!12485 () Bool)

(assert (= b_and!12483 (and (=> t!8057 result!5015) b_and!12485)))

(assert (=> b!213131 m!240839))

(assert (=> b!213131 m!240839))

(assert (=> b!213131 m!240847))

(declare-fun m!240949 () Bool)

(assert (=> b!213121 m!240949))

(assert (=> b!213125 m!240839))

(assert (=> b!213125 m!240903))

(assert (=> b!213125 m!240839))

(declare-fun m!240951 () Bool)

(assert (=> b!213125 m!240951))

(assert (=> b!213125 m!240903))

(assert (=> b!213125 m!240873))

(assert (=> b!213125 m!240905))

(assert (=> b!213125 m!240873))

(declare-fun m!240953 () Bool)

(assert (=> b!213122 m!240953))

(declare-fun m!240955 () Bool)

(assert (=> b!213129 m!240955))

(assert (=> b!213129 m!240955))

(declare-fun m!240957 () Bool)

(assert (=> b!213129 m!240957))

(declare-fun m!240959 () Bool)

(assert (=> b!213129 m!240959))

(assert (=> b!213129 m!240903))

(declare-fun m!240961 () Bool)

(assert (=> b!213129 m!240961))

(assert (=> b!213129 m!240839))

(assert (=> b!213129 m!240903))

(assert (=> b!213129 m!240873))

(assert (=> b!213129 m!240905))

(assert (=> b!213129 m!240873))

(declare-fun m!240963 () Bool)

(assert (=> d!58187 m!240963))

(assert (=> d!58187 m!240761))

(assert (=> b!213127 m!240839))

(assert (=> b!213127 m!240839))

(assert (=> b!213127 m!240847))

(assert (=> bm!20206 m!240953))

(assert (=> b!213124 m!240839))

(assert (=> b!213124 m!240839))

(declare-fun m!240965 () Bool)

(assert (=> b!213124 m!240965))

(declare-fun m!240967 () Bool)

(assert (=> b!213123 m!240967))

(assert (=> b!212932 d!58187))

(declare-fun d!58189 () Bool)

(declare-fun e!138635 () Bool)

(assert (=> d!58189 e!138635))

(declare-fun res!104264 () Bool)

(assert (=> d!58189 (=> (not res!104264) (not e!138635))))

(declare-fun lt!110017 () ListLongMap!3129)

(assert (=> d!58189 (= res!104264 (contains!1416 lt!110017 (_1!2119 (tuple2!4217 k0!843 v!520))))))

(declare-fun lt!110016 () List!3103)

(assert (=> d!58189 (= lt!110017 (ListLongMap!3130 lt!110016))))

(declare-fun lt!110019 () Unit!6460)

(declare-fun lt!110018 () Unit!6460)

(assert (=> d!58189 (= lt!110019 lt!110018)))

(assert (=> d!58189 (= (getValueByKey!256 lt!110016 (_1!2119 (tuple2!4217 k0!843 v!520))) (Some!261 (_2!2119 (tuple2!4217 k0!843 v!520))))))

(assert (=> d!58189 (= lt!110018 (lemmaContainsTupThenGetReturnValue!143 lt!110016 (_1!2119 (tuple2!4217 k0!843 v!520)) (_2!2119 (tuple2!4217 k0!843 v!520))))))

(assert (=> d!58189 (= lt!110016 (insertStrictlySorted!146 (toList!1580 lt!109864) (_1!2119 (tuple2!4217 k0!843 v!520)) (_2!2119 (tuple2!4217 k0!843 v!520))))))

(assert (=> d!58189 (= (+!583 lt!109864 (tuple2!4217 k0!843 v!520)) lt!110017)))

(declare-fun b!213133 () Bool)

(declare-fun res!104265 () Bool)

(assert (=> b!213133 (=> (not res!104265) (not e!138635))))

(assert (=> b!213133 (= res!104265 (= (getValueByKey!256 (toList!1580 lt!110017) (_1!2119 (tuple2!4217 k0!843 v!520))) (Some!261 (_2!2119 (tuple2!4217 k0!843 v!520)))))))

(declare-fun b!213134 () Bool)

(assert (=> b!213134 (= e!138635 (contains!1417 (toList!1580 lt!110017) (tuple2!4217 k0!843 v!520)))))

(assert (= (and d!58189 res!104264) b!213133))

(assert (= (and b!213133 res!104265) b!213134))

(declare-fun m!240969 () Bool)

(assert (=> d!58189 m!240969))

(declare-fun m!240971 () Bool)

(assert (=> d!58189 m!240971))

(declare-fun m!240973 () Bool)

(assert (=> d!58189 m!240973))

(declare-fun m!240975 () Bool)

(assert (=> d!58189 m!240975))

(declare-fun m!240977 () Bool)

(assert (=> b!213133 m!240977))

(declare-fun m!240979 () Bool)

(assert (=> b!213134 m!240979))

(assert (=> b!212932 d!58189))

(declare-fun b!213135 () Bool)

(declare-fun e!138645 () Bool)

(declare-fun lt!110022 () ListLongMap!3129)

(assert (=> b!213135 (= e!138645 (= (apply!198 lt!110022 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!213136 () Bool)

(declare-fun e!138638 () Bool)

(declare-fun e!138640 () Bool)

(assert (=> b!213136 (= e!138638 e!138640)))

(declare-fun c!35920 () Bool)

(assert (=> b!213136 (= c!35920 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!20207 () Bool)

(declare-fun call!20216 () ListLongMap!3129)

(declare-fun call!20215 () ListLongMap!3129)

(assert (=> bm!20207 (= call!20216 call!20215)))

(declare-fun b!213137 () Bool)

(declare-fun e!138637 () Bool)

(assert (=> b!213137 (= e!138637 (validKeyInArray!0 (select (arr!4825 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213138 () Bool)

(declare-fun e!138643 () ListLongMap!3129)

(declare-fun call!20213 () ListLongMap!3129)

(assert (=> b!213138 (= e!138643 (+!583 call!20213 (tuple2!4217 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!213139 () Bool)

(declare-fun e!138648 () Unit!6460)

(declare-fun Unit!6463 () Unit!6460)

(assert (=> b!213139 (= e!138648 Unit!6463)))

(declare-fun b!213140 () Bool)

(declare-fun call!20212 () Bool)

(assert (=> b!213140 (= e!138640 (not call!20212))))

(declare-fun b!213141 () Bool)

(assert (=> b!213141 (= e!138640 e!138645)))

(declare-fun res!104270 () Bool)

(assert (=> b!213141 (= res!104270 call!20212)))

(assert (=> b!213141 (=> (not res!104270) (not e!138645))))

(declare-fun b!213142 () Bool)

(declare-fun e!138646 () ListLongMap!3129)

(declare-fun call!20214 () ListLongMap!3129)

(assert (=> b!213142 (= e!138646 call!20214)))

(declare-fun b!213143 () Bool)

(declare-fun res!104267 () Bool)

(assert (=> b!213143 (=> (not res!104267) (not e!138638))))

(declare-fun e!138636 () Bool)

(assert (=> b!213143 (= res!104267 e!138636)))

(declare-fun c!35924 () Bool)

(assert (=> b!213143 (= c!35924 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!20209 () Bool)

(declare-fun call!20211 () Bool)

(assert (=> bm!20209 (= call!20211 (contains!1416 lt!110022 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!213144 () Bool)

(declare-fun res!104272 () Bool)

(assert (=> b!213144 (=> (not res!104272) (not e!138638))))

(declare-fun e!138642 () Bool)

(assert (=> b!213144 (= res!104272 e!138642)))

(declare-fun res!104266 () Bool)

(assert (=> b!213144 (=> res!104266 e!138642)))

(declare-fun e!138641 () Bool)

(assert (=> b!213144 (= res!104266 (not e!138641))))

(declare-fun res!104269 () Bool)

(assert (=> b!213144 (=> (not res!104269) (not e!138641))))

(assert (=> b!213144 (= res!104269 (bvslt #b00000000000000000000000000000000 (size!5150 _keys!825)))))

(declare-fun b!213145 () Bool)

(declare-fun e!138644 () ListLongMap!3129)

(assert (=> b!213145 (= e!138644 call!20214)))

(declare-fun call!20210 () ListLongMap!3129)

(declare-fun bm!20210 () Bool)

(assert (=> bm!20210 (= call!20210 (getCurrentListMapNoExtraKeys!513 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213146 () Bool)

(declare-fun e!138639 () Bool)

(assert (=> b!213146 (= e!138639 (= (apply!198 lt!110022 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!213147 () Bool)

(assert (=> b!213147 (= e!138636 (not call!20211))))

(declare-fun b!213148 () Bool)

(assert (=> b!213148 (= e!138641 (validKeyInArray!0 (select (arr!4825 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213149 () Bool)

(assert (=> b!213149 (= e!138636 e!138639)))

(declare-fun res!104273 () Bool)

(assert (=> b!213149 (= res!104273 call!20211)))

(assert (=> b!213149 (=> (not res!104273) (not e!138639))))

(declare-fun e!138647 () Bool)

(declare-fun b!213150 () Bool)

(assert (=> b!213150 (= e!138647 (= (apply!198 lt!110022 (select (arr!4825 _keys!825) #b00000000000000000000000000000000)) (get!2580 (select (arr!4824 _values!649) #b00000000000000000000000000000000) (dynLambda!541 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!213150 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5149 _values!649)))))

(assert (=> b!213150 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5150 _keys!825)))))

(declare-fun bm!20211 () Bool)

(assert (=> bm!20211 (= call!20214 call!20213)))

(declare-fun bm!20212 () Bool)

(declare-fun c!35921 () Bool)

(declare-fun c!35923 () Bool)

(assert (=> bm!20212 (= call!20213 (+!583 (ite c!35923 call!20210 (ite c!35921 call!20215 call!20216)) (ite (or c!35923 c!35921) (tuple2!4217 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4217 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!213151 () Bool)

(declare-fun c!35925 () Bool)

(assert (=> b!213151 (= c!35925 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!213151 (= e!138646 e!138644)))

(declare-fun b!213152 () Bool)

(assert (=> b!213152 (= e!138644 call!20216)))

(declare-fun b!213153 () Bool)

(declare-fun lt!110034 () Unit!6460)

(assert (=> b!213153 (= e!138648 lt!110034)))

(declare-fun lt!110033 () ListLongMap!3129)

(assert (=> b!213153 (= lt!110033 (getCurrentListMapNoExtraKeys!513 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110040 () (_ BitVec 64))

(assert (=> b!213153 (= lt!110040 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110028 () (_ BitVec 64))

(assert (=> b!213153 (= lt!110028 (select (arr!4825 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110020 () Unit!6460)

(assert (=> b!213153 (= lt!110020 (addStillContains!174 lt!110033 lt!110040 zeroValue!615 lt!110028))))

(assert (=> b!213153 (contains!1416 (+!583 lt!110033 (tuple2!4217 lt!110040 zeroValue!615)) lt!110028)))

(declare-fun lt!110021 () Unit!6460)

(assert (=> b!213153 (= lt!110021 lt!110020)))

(declare-fun lt!110025 () ListLongMap!3129)

(assert (=> b!213153 (= lt!110025 (getCurrentListMapNoExtraKeys!513 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110026 () (_ BitVec 64))

(assert (=> b!213153 (= lt!110026 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110038 () (_ BitVec 64))

(assert (=> b!213153 (= lt!110038 (select (arr!4825 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110027 () Unit!6460)

(assert (=> b!213153 (= lt!110027 (addApplyDifferent!174 lt!110025 lt!110026 minValue!615 lt!110038))))

(assert (=> b!213153 (= (apply!198 (+!583 lt!110025 (tuple2!4217 lt!110026 minValue!615)) lt!110038) (apply!198 lt!110025 lt!110038))))

(declare-fun lt!110029 () Unit!6460)

(assert (=> b!213153 (= lt!110029 lt!110027)))

(declare-fun lt!110030 () ListLongMap!3129)

(assert (=> b!213153 (= lt!110030 (getCurrentListMapNoExtraKeys!513 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110032 () (_ BitVec 64))

(assert (=> b!213153 (= lt!110032 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110036 () (_ BitVec 64))

(assert (=> b!213153 (= lt!110036 (select (arr!4825 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110037 () Unit!6460)

(assert (=> b!213153 (= lt!110037 (addApplyDifferent!174 lt!110030 lt!110032 zeroValue!615 lt!110036))))

(assert (=> b!213153 (= (apply!198 (+!583 lt!110030 (tuple2!4217 lt!110032 zeroValue!615)) lt!110036) (apply!198 lt!110030 lt!110036))))

(declare-fun lt!110041 () Unit!6460)

(assert (=> b!213153 (= lt!110041 lt!110037)))

(declare-fun lt!110024 () ListLongMap!3129)

(assert (=> b!213153 (= lt!110024 (getCurrentListMapNoExtraKeys!513 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110035 () (_ BitVec 64))

(assert (=> b!213153 (= lt!110035 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110031 () (_ BitVec 64))

(assert (=> b!213153 (= lt!110031 (select (arr!4825 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!213153 (= lt!110034 (addApplyDifferent!174 lt!110024 lt!110035 minValue!615 lt!110031))))

(assert (=> b!213153 (= (apply!198 (+!583 lt!110024 (tuple2!4217 lt!110035 minValue!615)) lt!110031) (apply!198 lt!110024 lt!110031))))

(declare-fun bm!20208 () Bool)

(assert (=> bm!20208 (= call!20212 (contains!1416 lt!110022 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!58191 () Bool)

(assert (=> d!58191 e!138638))

(declare-fun res!104274 () Bool)

(assert (=> d!58191 (=> (not res!104274) (not e!138638))))

(assert (=> d!58191 (= res!104274 (or (bvsge #b00000000000000000000000000000000 (size!5150 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5150 _keys!825)))))))

(declare-fun lt!110039 () ListLongMap!3129)

(assert (=> d!58191 (= lt!110022 lt!110039)))

(declare-fun lt!110023 () Unit!6460)

(assert (=> d!58191 (= lt!110023 e!138648)))

(declare-fun c!35922 () Bool)

(assert (=> d!58191 (= c!35922 e!138637)))

(declare-fun res!104271 () Bool)

(assert (=> d!58191 (=> (not res!104271) (not e!138637))))

(assert (=> d!58191 (= res!104271 (bvslt #b00000000000000000000000000000000 (size!5150 _keys!825)))))

(assert (=> d!58191 (= lt!110039 e!138643)))

(assert (=> d!58191 (= c!35923 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58191 (validMask!0 mask!1149)))

(assert (=> d!58191 (= (getCurrentListMap!1111 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110022)))

(declare-fun b!213154 () Bool)

(assert (=> b!213154 (= e!138643 e!138646)))

(assert (=> b!213154 (= c!35921 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!213155 () Bool)

(assert (=> b!213155 (= e!138642 e!138647)))

(declare-fun res!104268 () Bool)

(assert (=> b!213155 (=> (not res!104268) (not e!138647))))

(assert (=> b!213155 (= res!104268 (contains!1416 lt!110022 (select (arr!4825 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213155 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5150 _keys!825)))))

(declare-fun bm!20213 () Bool)

(assert (=> bm!20213 (= call!20215 call!20210)))

(assert (= (and d!58191 c!35923) b!213138))

(assert (= (and d!58191 (not c!35923)) b!213154))

(assert (= (and b!213154 c!35921) b!213142))

(assert (= (and b!213154 (not c!35921)) b!213151))

(assert (= (and b!213151 c!35925) b!213145))

(assert (= (and b!213151 (not c!35925)) b!213152))

(assert (= (or b!213145 b!213152) bm!20207))

(assert (= (or b!213142 bm!20207) bm!20213))

(assert (= (or b!213142 b!213145) bm!20211))

(assert (= (or b!213138 bm!20213) bm!20210))

(assert (= (or b!213138 bm!20211) bm!20212))

(assert (= (and d!58191 res!104271) b!213137))

(assert (= (and d!58191 c!35922) b!213153))

(assert (= (and d!58191 (not c!35922)) b!213139))

(assert (= (and d!58191 res!104274) b!213144))

(assert (= (and b!213144 res!104269) b!213148))

(assert (= (and b!213144 (not res!104266)) b!213155))

(assert (= (and b!213155 res!104268) b!213150))

(assert (= (and b!213144 res!104272) b!213143))

(assert (= (and b!213143 c!35924) b!213149))

(assert (= (and b!213143 (not c!35924)) b!213147))

(assert (= (and b!213149 res!104273) b!213146))

(assert (= (or b!213149 b!213147) bm!20209))

(assert (= (and b!213143 res!104267) b!213136))

(assert (= (and b!213136 c!35920) b!213141))

(assert (= (and b!213136 (not c!35920)) b!213140))

(assert (= (and b!213141 res!104270) b!213135))

(assert (= (or b!213141 b!213140) bm!20208))

(declare-fun b_lambda!7765 () Bool)

(assert (=> (not b_lambda!7765) (not b!213150)))

(assert (=> b!213150 t!8057))

(declare-fun b_and!12487 () Bool)

(assert (= b_and!12485 (and (=> t!8057 result!5015) b_and!12487)))

(declare-fun m!240981 () Bool)

(assert (=> b!213135 m!240981))

(declare-fun m!240983 () Bool)

(assert (=> b!213138 m!240983))

(declare-fun m!240985 () Bool)

(assert (=> bm!20209 m!240985))

(assert (=> d!58191 m!240761))

(assert (=> bm!20210 m!240755))

(assert (=> b!213137 m!240839))

(assert (=> b!213137 m!240839))

(assert (=> b!213137 m!240847))

(declare-fun m!240987 () Bool)

(assert (=> bm!20208 m!240987))

(assert (=> b!213150 m!240839))

(assert (=> b!213150 m!240839))

(declare-fun m!240989 () Bool)

(assert (=> b!213150 m!240989))

(assert (=> b!213150 m!240873))

(assert (=> b!213150 m!240869))

(assert (=> b!213150 m!240873))

(assert (=> b!213150 m!240875))

(assert (=> b!213150 m!240869))

(declare-fun m!240991 () Bool)

(assert (=> b!213153 m!240991))

(declare-fun m!240993 () Bool)

(assert (=> b!213153 m!240993))

(assert (=> b!213153 m!240991))

(assert (=> b!213153 m!240839))

(declare-fun m!240995 () Bool)

(assert (=> b!213153 m!240995))

(declare-fun m!240997 () Bool)

(assert (=> b!213153 m!240997))

(declare-fun m!240999 () Bool)

(assert (=> b!213153 m!240999))

(declare-fun m!241001 () Bool)

(assert (=> b!213153 m!241001))

(declare-fun m!241003 () Bool)

(assert (=> b!213153 m!241003))

(declare-fun m!241005 () Bool)

(assert (=> b!213153 m!241005))

(declare-fun m!241007 () Bool)

(assert (=> b!213153 m!241007))

(declare-fun m!241009 () Bool)

(assert (=> b!213153 m!241009))

(declare-fun m!241011 () Bool)

(assert (=> b!213153 m!241011))

(declare-fun m!241013 () Bool)

(assert (=> b!213153 m!241013))

(assert (=> b!213153 m!241001))

(assert (=> b!213153 m!240997))

(declare-fun m!241015 () Bool)

(assert (=> b!213153 m!241015))

(declare-fun m!241017 () Bool)

(assert (=> b!213153 m!241017))

(assert (=> b!213153 m!240755))

(declare-fun m!241019 () Bool)

(assert (=> b!213153 m!241019))

(assert (=> b!213153 m!241007))

(declare-fun m!241021 () Bool)

(assert (=> b!213146 m!241021))

(assert (=> b!213155 m!240839))

(assert (=> b!213155 m!240839))

(declare-fun m!241023 () Bool)

(assert (=> b!213155 m!241023))

(declare-fun m!241025 () Bool)

(assert (=> bm!20212 m!241025))

(assert (=> b!213148 m!240839))

(assert (=> b!213148 m!240839))

(assert (=> b!213148 m!240847))

(assert (=> b!212932 d!58191))

(declare-fun d!58193 () Bool)

(assert (=> d!58193 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!21148 d!58193))

(declare-fun d!58195 () Bool)

(assert (=> d!58195 (= (array_inv!3191 _values!649) (bvsge (size!5149 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!21148 d!58195))

(declare-fun d!58197 () Bool)

(assert (=> d!58197 (= (array_inv!3192 _keys!825) (bvsge (size!5150 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!21148 d!58197))

(declare-fun condMapEmpty!9323 () Bool)

(declare-fun mapDefault!9323 () ValueCell!2397)

(assert (=> mapNonEmpty!9317 (= condMapEmpty!9323 (= mapRest!9317 ((as const (Array (_ BitVec 32) ValueCell!2397)) mapDefault!9323)))))

(declare-fun e!138654 () Bool)

(declare-fun mapRes!9323 () Bool)

(assert (=> mapNonEmpty!9317 (= tp!19924 (and e!138654 mapRes!9323))))

(declare-fun b!213162 () Bool)

(declare-fun e!138653 () Bool)

(assert (=> b!213162 (= e!138653 tp_is_empty!5481)))

(declare-fun b!213163 () Bool)

(assert (=> b!213163 (= e!138654 tp_is_empty!5481)))

(declare-fun mapIsEmpty!9323 () Bool)

(assert (=> mapIsEmpty!9323 mapRes!9323))

(declare-fun mapNonEmpty!9323 () Bool)

(declare-fun tp!19934 () Bool)

(assert (=> mapNonEmpty!9323 (= mapRes!9323 (and tp!19934 e!138653))))

(declare-fun mapKey!9323 () (_ BitVec 32))

(declare-fun mapValue!9323 () ValueCell!2397)

(declare-fun mapRest!9323 () (Array (_ BitVec 32) ValueCell!2397))

(assert (=> mapNonEmpty!9323 (= mapRest!9317 (store mapRest!9323 mapKey!9323 mapValue!9323))))

(assert (= (and mapNonEmpty!9317 condMapEmpty!9323) mapIsEmpty!9323))

(assert (= (and mapNonEmpty!9317 (not condMapEmpty!9323)) mapNonEmpty!9323))

(assert (= (and mapNonEmpty!9323 ((_ is ValueCellFull!2397) mapValue!9323)) b!213162))

(assert (= (and mapNonEmpty!9317 ((_ is ValueCellFull!2397) mapDefault!9323)) b!213163))

(declare-fun m!241027 () Bool)

(assert (=> mapNonEmpty!9323 m!241027))

(declare-fun b_lambda!7767 () Bool)

(assert (= b_lambda!7763 (or (and start!21148 b_free!5619) b_lambda!7767)))

(declare-fun b_lambda!7769 () Bool)

(assert (= b_lambda!7755 (or (and start!21148 b_free!5619) b_lambda!7769)))

(declare-fun b_lambda!7771 () Bool)

(assert (= b_lambda!7759 (or (and start!21148 b_free!5619) b_lambda!7771)))

(declare-fun b_lambda!7773 () Bool)

(assert (= b_lambda!7757 (or (and start!21148 b_free!5619) b_lambda!7773)))

(declare-fun b_lambda!7775 () Bool)

(assert (= b_lambda!7765 (or (and start!21148 b_free!5619) b_lambda!7775)))

(declare-fun b_lambda!7777 () Bool)

(assert (= b_lambda!7761 (or (and start!21148 b_free!5619) b_lambda!7777)))

(check-sat (not b_lambda!7769) (not b!213093) (not b!213155) (not b!213131) (not b_lambda!7771) (not b!213133) (not b!212978) (not b!213035) (not b!212981) (not b!213043) (not d!58181) (not mapNonEmpty!9323) (not b!213134) (not bm!20175) (not b_lambda!7773) (not b!213111) (not b!212991) (not b!213010) (not bm!20210) (not b!213006) (not bm!20178) (not b!213121) (not b_lambda!7777) (not bm!20172) (not d!58171) (not bm!20205) (not b_lambda!7767) (not d!58183) (not b!213129) (not bm!20194) b_and!12487 (not b!213122) (not b!212979) (not b!213037) (not b!213137) (not b!213135) (not b!213091) (not b!213124) (not d!58169) (not b!213127) (not b!213009) (not b!213148) (not b!212980) (not b!213125) (not d!58185) (not b!213109) (not b!213123) (not b_lambda!7775) (not b!213138) (not b!213118) (not bm!20206) (not b!213104) (not b!212993) (not bm!20208) (not b_next!5619) (not bm!20196) (not b!213150) (not bm!20198) tp_is_empty!5481 (not d!58191) (not bm!20204) (not d!58187) (not b!213045) (not b!213102) (not d!58189) (not bm!20209) (not b!213153) (not b!212994) (not b!213094) (not bm!20212) (not b!213038) (not b!213146) (not bm!20195) (not b!213106) (not d!58175) (not b!213036) (not b!212995) (not b!213039) (not b!213041))
(check-sat b_and!12487 (not b_next!5619))
