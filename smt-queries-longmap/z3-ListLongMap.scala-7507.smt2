; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95182 () Bool)

(assert start!95182)

(declare-fun b_free!22221 () Bool)

(declare-fun b_next!22221 () Bool)

(assert (=> start!95182 (= b_free!22221 (not b_next!22221))))

(declare-fun tp!78155 () Bool)

(declare-fun b_and!35175 () Bool)

(assert (=> start!95182 (= tp!78155 b_and!35175)))

(declare-fun b!1075882 () Bool)

(declare-fun e!614932 () Bool)

(declare-fun e!614930 () Bool)

(assert (=> b!1075882 (= e!614932 (not e!614930))))

(declare-fun res!717153 () Bool)

(assert (=> b!1075882 (=> res!717153 e!614930)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1075882 (= res!717153 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!614933 () Bool)

(assert (=> b!1075882 e!614933))

(declare-fun res!717157 () Bool)

(assert (=> b!1075882 (=> (not res!717157) (not e!614933))))

(declare-datatypes ((V!39843 0))(
  ( (V!39844 (val!13066 Int)) )
))
(declare-datatypes ((tuple2!16644 0))(
  ( (tuple2!16645 (_1!8333 (_ BitVec 64)) (_2!8333 V!39843)) )
))
(declare-datatypes ((List!23180 0))(
  ( (Nil!23177) (Cons!23176 (h!24385 tuple2!16644) (t!32535 List!23180)) )
))
(declare-datatypes ((ListLongMap!14613 0))(
  ( (ListLongMap!14614 (toList!7322 List!23180)) )
))
(declare-fun lt!477690 () ListLongMap!14613)

(declare-fun lt!477691 () ListLongMap!14613)

(assert (=> b!1075882 (= res!717157 (= lt!477690 lt!477691))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12312 0))(
  ( (ValueCellFull!12312 (v!15692 V!39843)) (EmptyCell!12312) )
))
(declare-datatypes ((array!69031 0))(
  ( (array!69032 (arr!33200 (Array (_ BitVec 32) ValueCell!12312)) (size!33736 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69031)

(declare-fun minValue!907 () V!39843)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39843)

(declare-datatypes ((Unit!35417 0))(
  ( (Unit!35418) )
))
(declare-fun lt!477692 () Unit!35417)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39843)

(declare-datatypes ((array!69033 0))(
  ( (array!69034 (arr!33201 (Array (_ BitVec 32) (_ BitVec 64))) (size!33737 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69033)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!900 (array!69033 array!69031 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39843 V!39843 V!39843 V!39843 (_ BitVec 32) Int) Unit!35417)

(assert (=> b!1075882 (= lt!477692 (lemmaNoChangeToArrayThenSameMapNoExtras!900 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3884 (array!69033 array!69031 (_ BitVec 32) (_ BitVec 32) V!39843 V!39843 (_ BitVec 32) Int) ListLongMap!14613)

(assert (=> b!1075882 (= lt!477691 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1075882 (= lt!477690 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1075883 () Bool)

(declare-fun getCurrentListMap!4191 (array!69033 array!69031 (_ BitVec 32) (_ BitVec 32) V!39843 V!39843 (_ BitVec 32) Int) ListLongMap!14613)

(declare-fun +!3228 (ListLongMap!14613 tuple2!16644) ListLongMap!14613)

(assert (=> b!1075883 (= e!614930 (= (getCurrentListMap!4191 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (+!3228 lt!477691 (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1075884 () Bool)

(declare-fun e!614929 () Bool)

(assert (=> b!1075884 (= e!614933 e!614929)))

(declare-fun res!717154 () Bool)

(assert (=> b!1075884 (=> res!717154 e!614929)))

(assert (=> b!1075884 (= res!717154 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1075885 () Bool)

(declare-fun res!717155 () Bool)

(assert (=> b!1075885 (=> (not res!717155) (not e!614932))))

(declare-datatypes ((List!23181 0))(
  ( (Nil!23178) (Cons!23177 (h!24386 (_ BitVec 64)) (t!32536 List!23181)) )
))
(declare-fun arrayNoDuplicates!0 (array!69033 (_ BitVec 32) List!23181) Bool)

(assert (=> b!1075885 (= res!717155 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23178))))

(declare-fun mapNonEmpty!40786 () Bool)

(declare-fun mapRes!40786 () Bool)

(declare-fun tp!78154 () Bool)

(declare-fun e!614927 () Bool)

(assert (=> mapNonEmpty!40786 (= mapRes!40786 (and tp!78154 e!614927))))

(declare-fun mapValue!40786 () ValueCell!12312)

(declare-fun mapKey!40786 () (_ BitVec 32))

(declare-fun mapRest!40786 () (Array (_ BitVec 32) ValueCell!12312))

(assert (=> mapNonEmpty!40786 (= (arr!33200 _values!955) (store mapRest!40786 mapKey!40786 mapValue!40786))))

(declare-fun res!717159 () Bool)

(assert (=> start!95182 (=> (not res!717159) (not e!614932))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95182 (= res!717159 (validMask!0 mask!1515))))

(assert (=> start!95182 e!614932))

(assert (=> start!95182 true))

(declare-fun tp_is_empty!26031 () Bool)

(assert (=> start!95182 tp_is_empty!26031))

(declare-fun e!614928 () Bool)

(declare-fun array_inv!25654 (array!69031) Bool)

(assert (=> start!95182 (and (array_inv!25654 _values!955) e!614928)))

(assert (=> start!95182 tp!78155))

(declare-fun array_inv!25655 (array!69033) Bool)

(assert (=> start!95182 (array_inv!25655 _keys!1163)))

(declare-fun mapIsEmpty!40786 () Bool)

(assert (=> mapIsEmpty!40786 mapRes!40786))

(declare-fun b!1075886 () Bool)

(declare-fun e!614931 () Bool)

(assert (=> b!1075886 (= e!614931 tp_is_empty!26031)))

(declare-fun b!1075887 () Bool)

(assert (=> b!1075887 (= e!614928 (and e!614931 mapRes!40786))))

(declare-fun condMapEmpty!40786 () Bool)

(declare-fun mapDefault!40786 () ValueCell!12312)

(assert (=> b!1075887 (= condMapEmpty!40786 (= (arr!33200 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12312)) mapDefault!40786)))))

(declare-fun b!1075888 () Bool)

(assert (=> b!1075888 (= e!614927 tp_is_empty!26031)))

(declare-fun b!1075889 () Bool)

(declare-fun res!717156 () Bool)

(assert (=> b!1075889 (=> (not res!717156) (not e!614932))))

(assert (=> b!1075889 (= res!717156 (and (= (size!33736 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33737 _keys!1163) (size!33736 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1075890 () Bool)

(declare-fun res!717158 () Bool)

(assert (=> b!1075890 (=> (not res!717158) (not e!614932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69033 (_ BitVec 32)) Bool)

(assert (=> b!1075890 (= res!717158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1075891 () Bool)

(assert (=> b!1075891 (= e!614929 (= (getCurrentListMap!4191 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (+!3228 (+!3228 lt!477690 (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(assert (= (and start!95182 res!717159) b!1075889))

(assert (= (and b!1075889 res!717156) b!1075890))

(assert (= (and b!1075890 res!717158) b!1075885))

(assert (= (and b!1075885 res!717155) b!1075882))

(assert (= (and b!1075882 res!717157) b!1075884))

(assert (= (and b!1075884 (not res!717154)) b!1075891))

(assert (= (and b!1075882 (not res!717153)) b!1075883))

(assert (= (and b!1075887 condMapEmpty!40786) mapIsEmpty!40786))

(assert (= (and b!1075887 (not condMapEmpty!40786)) mapNonEmpty!40786))

(get-info :version)

(assert (= (and mapNonEmpty!40786 ((_ is ValueCellFull!12312) mapValue!40786)) b!1075888))

(assert (= (and b!1075887 ((_ is ValueCellFull!12312) mapDefault!40786)) b!1075886))

(assert (= start!95182 b!1075887))

(declare-fun m!994715 () Bool)

(assert (=> b!1075882 m!994715))

(declare-fun m!994717 () Bool)

(assert (=> b!1075882 m!994717))

(declare-fun m!994719 () Bool)

(assert (=> b!1075882 m!994719))

(declare-fun m!994721 () Bool)

(assert (=> b!1075885 m!994721))

(declare-fun m!994723 () Bool)

(assert (=> mapNonEmpty!40786 m!994723))

(declare-fun m!994725 () Bool)

(assert (=> b!1075883 m!994725))

(declare-fun m!994727 () Bool)

(assert (=> b!1075883 m!994727))

(declare-fun m!994729 () Bool)

(assert (=> start!95182 m!994729))

(declare-fun m!994731 () Bool)

(assert (=> start!95182 m!994731))

(declare-fun m!994733 () Bool)

(assert (=> start!95182 m!994733))

(declare-fun m!994735 () Bool)

(assert (=> b!1075890 m!994735))

(declare-fun m!994737 () Bool)

(assert (=> b!1075891 m!994737))

(declare-fun m!994739 () Bool)

(assert (=> b!1075891 m!994739))

(assert (=> b!1075891 m!994739))

(declare-fun m!994741 () Bool)

(assert (=> b!1075891 m!994741))

(check-sat (not b!1075890) b_and!35175 (not mapNonEmpty!40786) (not b_next!22221) (not b!1075891) (not b!1075882) (not b!1075885) (not b!1075883) (not start!95182) tp_is_empty!26031)
(check-sat b_and!35175 (not b_next!22221))
(get-model)

(declare-fun b!1075932 () Bool)

(declare-fun e!614968 () Bool)

(declare-fun e!614969 () Bool)

(assert (=> b!1075932 (= e!614968 e!614969)))

(declare-fun c!108137 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1075932 (= c!108137 (validKeyInArray!0 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45577 () Bool)

(declare-fun call!45580 () Bool)

(assert (=> bm!45577 (= call!45580 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108137 (Cons!23177 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000) Nil!23178) Nil!23178)))))

(declare-fun b!1075934 () Bool)

(assert (=> b!1075934 (= e!614969 call!45580)))

(declare-fun d!129643 () Bool)

(declare-fun res!717187 () Bool)

(declare-fun e!614970 () Bool)

(assert (=> d!129643 (=> res!717187 e!614970)))

(assert (=> d!129643 (= res!717187 (bvsge #b00000000000000000000000000000000 (size!33737 _keys!1163)))))

(assert (=> d!129643 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23178) e!614970)))

(declare-fun b!1075933 () Bool)

(assert (=> b!1075933 (= e!614970 e!614968)))

(declare-fun res!717188 () Bool)

(assert (=> b!1075933 (=> (not res!717188) (not e!614968))))

(declare-fun e!614967 () Bool)

(assert (=> b!1075933 (= res!717188 (not e!614967))))

(declare-fun res!717189 () Bool)

(assert (=> b!1075933 (=> (not res!717189) (not e!614967))))

(assert (=> b!1075933 (= res!717189 (validKeyInArray!0 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075935 () Bool)

(declare-fun contains!6353 (List!23181 (_ BitVec 64)) Bool)

(assert (=> b!1075935 (= e!614967 (contains!6353 Nil!23178 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075936 () Bool)

(assert (=> b!1075936 (= e!614969 call!45580)))

(assert (= (and d!129643 (not res!717187)) b!1075933))

(assert (= (and b!1075933 res!717189) b!1075935))

(assert (= (and b!1075933 res!717188) b!1075932))

(assert (= (and b!1075932 c!108137) b!1075934))

(assert (= (and b!1075932 (not c!108137)) b!1075936))

(assert (= (or b!1075934 b!1075936) bm!45577))

(declare-fun m!994771 () Bool)

(assert (=> b!1075932 m!994771))

(assert (=> b!1075932 m!994771))

(declare-fun m!994773 () Bool)

(assert (=> b!1075932 m!994773))

(assert (=> bm!45577 m!994771))

(declare-fun m!994775 () Bool)

(assert (=> bm!45577 m!994775))

(assert (=> b!1075933 m!994771))

(assert (=> b!1075933 m!994771))

(assert (=> b!1075933 m!994773))

(assert (=> b!1075935 m!994771))

(assert (=> b!1075935 m!994771))

(declare-fun m!994777 () Bool)

(assert (=> b!1075935 m!994777))

(assert (=> b!1075885 d!129643))

(declare-fun b!1075946 () Bool)

(declare-fun e!614979 () Bool)

(declare-fun call!45583 () Bool)

(assert (=> b!1075946 (= e!614979 call!45583)))

(declare-fun b!1075947 () Bool)

(declare-fun e!614977 () Bool)

(declare-fun e!614978 () Bool)

(assert (=> b!1075947 (= e!614977 e!614978)))

(declare-fun c!108140 () Bool)

(assert (=> b!1075947 (= c!108140 (validKeyInArray!0 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075948 () Bool)

(assert (=> b!1075948 (= e!614978 call!45583)))

(declare-fun bm!45580 () Bool)

(assert (=> bm!45580 (= call!45583 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1075945 () Bool)

(assert (=> b!1075945 (= e!614978 e!614979)))

(declare-fun lt!477710 () (_ BitVec 64))

(assert (=> b!1075945 (= lt!477710 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477708 () Unit!35417)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69033 (_ BitVec 64) (_ BitVec 32)) Unit!35417)

(assert (=> b!1075945 (= lt!477708 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!477710 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1075945 (arrayContainsKey!0 _keys!1163 lt!477710 #b00000000000000000000000000000000)))

(declare-fun lt!477709 () Unit!35417)

(assert (=> b!1075945 (= lt!477709 lt!477708)))

(declare-fun res!717195 () Bool)

(declare-datatypes ((SeekEntryResult!9894 0))(
  ( (MissingZero!9894 (index!41947 (_ BitVec 32))) (Found!9894 (index!41948 (_ BitVec 32))) (Intermediate!9894 (undefined!10706 Bool) (index!41949 (_ BitVec 32)) (x!96422 (_ BitVec 32))) (Undefined!9894) (MissingVacant!9894 (index!41950 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69033 (_ BitVec 32)) SeekEntryResult!9894)

(assert (=> b!1075945 (= res!717195 (= (seekEntryOrOpen!0 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9894 #b00000000000000000000000000000000)))))

(assert (=> b!1075945 (=> (not res!717195) (not e!614979))))

(declare-fun d!129645 () Bool)

(declare-fun res!717194 () Bool)

(assert (=> d!129645 (=> res!717194 e!614977)))

(assert (=> d!129645 (= res!717194 (bvsge #b00000000000000000000000000000000 (size!33737 _keys!1163)))))

(assert (=> d!129645 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!614977)))

(assert (= (and d!129645 (not res!717194)) b!1075947))

(assert (= (and b!1075947 c!108140) b!1075945))

(assert (= (and b!1075947 (not c!108140)) b!1075948))

(assert (= (and b!1075945 res!717195) b!1075946))

(assert (= (or b!1075946 b!1075948) bm!45580))

(assert (=> b!1075947 m!994771))

(assert (=> b!1075947 m!994771))

(assert (=> b!1075947 m!994773))

(declare-fun m!994779 () Bool)

(assert (=> bm!45580 m!994779))

(assert (=> b!1075945 m!994771))

(declare-fun m!994781 () Bool)

(assert (=> b!1075945 m!994781))

(declare-fun m!994783 () Bool)

(assert (=> b!1075945 m!994783))

(assert (=> b!1075945 m!994771))

(declare-fun m!994785 () Bool)

(assert (=> b!1075945 m!994785))

(assert (=> b!1075890 d!129645))

(declare-fun b!1075991 () Bool)

(declare-fun e!615018 () ListLongMap!14613)

(declare-fun call!45598 () ListLongMap!14613)

(assert (=> b!1075991 (= e!615018 call!45598)))

(declare-fun bm!45595 () Bool)

(declare-fun call!45604 () Bool)

(declare-fun lt!477775 () ListLongMap!14613)

(declare-fun contains!6354 (ListLongMap!14613 (_ BitVec 64)) Bool)

(assert (=> bm!45595 (= call!45604 (contains!6354 lt!477775 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075992 () Bool)

(declare-fun e!615015 () ListLongMap!14613)

(declare-fun e!615013 () ListLongMap!14613)

(assert (=> b!1075992 (= e!615015 e!615013)))

(declare-fun c!108156 () Bool)

(assert (=> b!1075992 (= c!108156 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1075993 () Bool)

(declare-fun e!615006 () Bool)

(declare-fun e!615017 () Bool)

(assert (=> b!1075993 (= e!615006 e!615017)))

(declare-fun c!108157 () Bool)

(assert (=> b!1075993 (= c!108157 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1075994 () Bool)

(declare-fun call!45602 () ListLongMap!14613)

(assert (=> b!1075994 (= e!615018 call!45602)))

(declare-fun b!1075995 () Bool)

(declare-fun e!615009 () Bool)

(declare-fun apply!941 (ListLongMap!14613 (_ BitVec 64)) V!39843)

(assert (=> b!1075995 (= e!615009 (= (apply!941 lt!477775 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1075996 () Bool)

(declare-fun e!615011 () Unit!35417)

(declare-fun Unit!35421 () Unit!35417)

(assert (=> b!1075996 (= e!615011 Unit!35421)))

(declare-fun b!1075997 () Bool)

(declare-fun call!45601 () ListLongMap!14613)

(assert (=> b!1075997 (= e!615015 (+!3228 call!45601 (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun e!615016 () Bool)

(declare-fun b!1075998 () Bool)

(declare-fun get!17243 (ValueCell!12312 V!39843) V!39843)

(declare-fun dynLambda!2048 (Int (_ BitVec 64)) V!39843)

(assert (=> b!1075998 (= e!615016 (= (apply!941 lt!477775 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000)) (get!17243 (select (arr!33200 _values!955) #b00000000000000000000000000000000) (dynLambda!2048 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1075998 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33736 _values!955)))))

(assert (=> b!1075998 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33737 _keys!1163)))))

(declare-fun b!1075999 () Bool)

(assert (=> b!1075999 (= e!615017 e!615009)))

(declare-fun res!717216 () Bool)

(declare-fun call!45599 () Bool)

(assert (=> b!1075999 (= res!717216 call!45599)))

(assert (=> b!1075999 (=> (not res!717216) (not e!615009))))

(declare-fun b!1076000 () Bool)

(declare-fun res!717221 () Bool)

(assert (=> b!1076000 (=> (not res!717221) (not e!615006))))

(declare-fun e!615007 () Bool)

(assert (=> b!1076000 (= res!717221 e!615007)))

(declare-fun res!717214 () Bool)

(assert (=> b!1076000 (=> res!717214 e!615007)))

(declare-fun e!615012 () Bool)

(assert (=> b!1076000 (= res!717214 (not e!615012))))

(declare-fun res!717219 () Bool)

(assert (=> b!1076000 (=> (not res!717219) (not e!615012))))

(assert (=> b!1076000 (= res!717219 (bvslt #b00000000000000000000000000000000 (size!33737 _keys!1163)))))

(declare-fun bm!45597 () Bool)

(assert (=> bm!45597 (= call!45598 call!45601)))

(declare-fun bm!45598 () Bool)

(declare-fun call!45603 () ListLongMap!14613)

(declare-fun call!45600 () ListLongMap!14613)

(assert (=> bm!45598 (= call!45603 call!45600)))

(declare-fun b!1076001 () Bool)

(assert (=> b!1076001 (= e!615012 (validKeyInArray!0 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076002 () Bool)

(declare-fun c!108153 () Bool)

(assert (=> b!1076002 (= c!108153 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1076002 (= e!615013 e!615018)))

(declare-fun b!1076003 () Bool)

(declare-fun e!615014 () Bool)

(assert (=> b!1076003 (= e!615014 (= (apply!941 lt!477775 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1076004 () Bool)

(declare-fun e!615010 () Bool)

(assert (=> b!1076004 (= e!615010 (not call!45604))))

(declare-fun bm!45599 () Bool)

(declare-fun c!108154 () Bool)

(assert (=> bm!45599 (= call!45601 (+!3228 (ite c!108154 call!45600 (ite c!108156 call!45603 call!45602)) (ite (or c!108154 c!108156) (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1076005 () Bool)

(declare-fun lt!477756 () Unit!35417)

(assert (=> b!1076005 (= e!615011 lt!477756)))

(declare-fun lt!477767 () ListLongMap!14613)

(assert (=> b!1076005 (= lt!477767 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477760 () (_ BitVec 64))

(assert (=> b!1076005 (= lt!477760 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477768 () (_ BitVec 64))

(assert (=> b!1076005 (= lt!477768 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477761 () Unit!35417)

(declare-fun addStillContains!654 (ListLongMap!14613 (_ BitVec 64) V!39843 (_ BitVec 64)) Unit!35417)

(assert (=> b!1076005 (= lt!477761 (addStillContains!654 lt!477767 lt!477760 zeroValueBefore!47 lt!477768))))

(assert (=> b!1076005 (contains!6354 (+!3228 lt!477767 (tuple2!16645 lt!477760 zeroValueBefore!47)) lt!477768)))

(declare-fun lt!477755 () Unit!35417)

(assert (=> b!1076005 (= lt!477755 lt!477761)))

(declare-fun lt!477774 () ListLongMap!14613)

(assert (=> b!1076005 (= lt!477774 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477770 () (_ BitVec 64))

(assert (=> b!1076005 (= lt!477770 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477759 () (_ BitVec 64))

(assert (=> b!1076005 (= lt!477759 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477766 () Unit!35417)

(declare-fun addApplyDifferent!514 (ListLongMap!14613 (_ BitVec 64) V!39843 (_ BitVec 64)) Unit!35417)

(assert (=> b!1076005 (= lt!477766 (addApplyDifferent!514 lt!477774 lt!477770 minValue!907 lt!477759))))

(assert (=> b!1076005 (= (apply!941 (+!3228 lt!477774 (tuple2!16645 lt!477770 minValue!907)) lt!477759) (apply!941 lt!477774 lt!477759))))

(declare-fun lt!477772 () Unit!35417)

(assert (=> b!1076005 (= lt!477772 lt!477766)))

(declare-fun lt!477763 () ListLongMap!14613)

(assert (=> b!1076005 (= lt!477763 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477764 () (_ BitVec 64))

(assert (=> b!1076005 (= lt!477764 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477771 () (_ BitVec 64))

(assert (=> b!1076005 (= lt!477771 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477762 () Unit!35417)

(assert (=> b!1076005 (= lt!477762 (addApplyDifferent!514 lt!477763 lt!477764 zeroValueBefore!47 lt!477771))))

(assert (=> b!1076005 (= (apply!941 (+!3228 lt!477763 (tuple2!16645 lt!477764 zeroValueBefore!47)) lt!477771) (apply!941 lt!477763 lt!477771))))

(declare-fun lt!477758 () Unit!35417)

(assert (=> b!1076005 (= lt!477758 lt!477762)))

(declare-fun lt!477769 () ListLongMap!14613)

(assert (=> b!1076005 (= lt!477769 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477765 () (_ BitVec 64))

(assert (=> b!1076005 (= lt!477765 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477757 () (_ BitVec 64))

(assert (=> b!1076005 (= lt!477757 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1076005 (= lt!477756 (addApplyDifferent!514 lt!477769 lt!477765 minValue!907 lt!477757))))

(assert (=> b!1076005 (= (apply!941 (+!3228 lt!477769 (tuple2!16645 lt!477765 minValue!907)) lt!477757) (apply!941 lt!477769 lt!477757))))

(declare-fun b!1076006 () Bool)

(assert (=> b!1076006 (= e!615013 call!45598)))

(declare-fun b!1076007 () Bool)

(assert (=> b!1076007 (= e!615017 (not call!45599))))

(declare-fun bm!45600 () Bool)

(assert (=> bm!45600 (= call!45602 call!45603)))

(declare-fun b!1076008 () Bool)

(assert (=> b!1076008 (= e!615007 e!615016)))

(declare-fun res!717215 () Bool)

(assert (=> b!1076008 (=> (not res!717215) (not e!615016))))

(assert (=> b!1076008 (= res!717215 (contains!6354 lt!477775 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076008 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33737 _keys!1163)))))

(declare-fun d!129647 () Bool)

(assert (=> d!129647 e!615006))

(declare-fun res!717217 () Bool)

(assert (=> d!129647 (=> (not res!717217) (not e!615006))))

(assert (=> d!129647 (= res!717217 (or (bvsge #b00000000000000000000000000000000 (size!33737 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33737 _keys!1163)))))))

(declare-fun lt!477776 () ListLongMap!14613)

(assert (=> d!129647 (= lt!477775 lt!477776)))

(declare-fun lt!477773 () Unit!35417)

(assert (=> d!129647 (= lt!477773 e!615011)))

(declare-fun c!108158 () Bool)

(declare-fun e!615008 () Bool)

(assert (=> d!129647 (= c!108158 e!615008)))

(declare-fun res!717218 () Bool)

(assert (=> d!129647 (=> (not res!717218) (not e!615008))))

(assert (=> d!129647 (= res!717218 (bvslt #b00000000000000000000000000000000 (size!33737 _keys!1163)))))

(assert (=> d!129647 (= lt!477776 e!615015)))

(assert (=> d!129647 (= c!108154 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129647 (validMask!0 mask!1515)))

(assert (=> d!129647 (= (getCurrentListMap!4191 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477775)))

(declare-fun bm!45596 () Bool)

(assert (=> bm!45596 (= call!45599 (contains!6354 lt!477775 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1076009 () Bool)

(assert (=> b!1076009 (= e!615008 (validKeyInArray!0 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45601 () Bool)

(assert (=> bm!45601 (= call!45600 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076010 () Bool)

(assert (=> b!1076010 (= e!615010 e!615014)))

(declare-fun res!717220 () Bool)

(assert (=> b!1076010 (= res!717220 call!45604)))

(assert (=> b!1076010 (=> (not res!717220) (not e!615014))))

(declare-fun b!1076011 () Bool)

(declare-fun res!717222 () Bool)

(assert (=> b!1076011 (=> (not res!717222) (not e!615006))))

(assert (=> b!1076011 (= res!717222 e!615010)))

(declare-fun c!108155 () Bool)

(assert (=> b!1076011 (= c!108155 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!129647 c!108154) b!1075997))

(assert (= (and d!129647 (not c!108154)) b!1075992))

(assert (= (and b!1075992 c!108156) b!1076006))

(assert (= (and b!1075992 (not c!108156)) b!1076002))

(assert (= (and b!1076002 c!108153) b!1075991))

(assert (= (and b!1076002 (not c!108153)) b!1075994))

(assert (= (or b!1075991 b!1075994) bm!45600))

(assert (= (or b!1076006 bm!45600) bm!45598))

(assert (= (or b!1076006 b!1075991) bm!45597))

(assert (= (or b!1075997 bm!45598) bm!45601))

(assert (= (or b!1075997 bm!45597) bm!45599))

(assert (= (and d!129647 res!717218) b!1076009))

(assert (= (and d!129647 c!108158) b!1076005))

(assert (= (and d!129647 (not c!108158)) b!1075996))

(assert (= (and d!129647 res!717217) b!1076000))

(assert (= (and b!1076000 res!717219) b!1076001))

(assert (= (and b!1076000 (not res!717214)) b!1076008))

(assert (= (and b!1076008 res!717215) b!1075998))

(assert (= (and b!1076000 res!717221) b!1076011))

(assert (= (and b!1076011 c!108155) b!1076010))

(assert (= (and b!1076011 (not c!108155)) b!1076004))

(assert (= (and b!1076010 res!717220) b!1076003))

(assert (= (or b!1076010 b!1076004) bm!45595))

(assert (= (and b!1076011 res!717222) b!1075993))

(assert (= (and b!1075993 c!108157) b!1075999))

(assert (= (and b!1075993 (not c!108157)) b!1076007))

(assert (= (and b!1075999 res!717216) b!1075995))

(assert (= (or b!1075999 b!1076007) bm!45596))

(declare-fun b_lambda!16925 () Bool)

(assert (=> (not b_lambda!16925) (not b!1075998)))

(declare-fun t!32539 () Bool)

(declare-fun tb!7177 () Bool)

(assert (=> (and start!95182 (= defaultEntry!963 defaultEntry!963) t!32539) tb!7177))

(declare-fun result!14839 () Bool)

(assert (=> tb!7177 (= result!14839 tp_is_empty!26031)))

(assert (=> b!1075998 t!32539))

(declare-fun b_and!35179 () Bool)

(assert (= b_and!35175 (and (=> t!32539 result!14839) b_and!35179)))

(assert (=> b!1076009 m!994771))

(assert (=> b!1076009 m!994771))

(assert (=> b!1076009 m!994773))

(assert (=> bm!45601 m!994719))

(declare-fun m!994787 () Bool)

(assert (=> b!1075998 m!994787))

(declare-fun m!994789 () Bool)

(assert (=> b!1075998 m!994789))

(declare-fun m!994791 () Bool)

(assert (=> b!1075998 m!994791))

(assert (=> b!1075998 m!994771))

(assert (=> b!1075998 m!994771))

(declare-fun m!994793 () Bool)

(assert (=> b!1075998 m!994793))

(assert (=> b!1075998 m!994789))

(assert (=> b!1075998 m!994787))

(declare-fun m!994795 () Bool)

(assert (=> bm!45599 m!994795))

(declare-fun m!994797 () Bool)

(assert (=> b!1076005 m!994797))

(declare-fun m!994799 () Bool)

(assert (=> b!1076005 m!994799))

(declare-fun m!994801 () Bool)

(assert (=> b!1076005 m!994801))

(declare-fun m!994803 () Bool)

(assert (=> b!1076005 m!994803))

(declare-fun m!994805 () Bool)

(assert (=> b!1076005 m!994805))

(declare-fun m!994807 () Bool)

(assert (=> b!1076005 m!994807))

(declare-fun m!994809 () Bool)

(assert (=> b!1076005 m!994809))

(assert (=> b!1076005 m!994719))

(declare-fun m!994811 () Bool)

(assert (=> b!1076005 m!994811))

(assert (=> b!1076005 m!994809))

(declare-fun m!994813 () Bool)

(assert (=> b!1076005 m!994813))

(declare-fun m!994815 () Bool)

(assert (=> b!1076005 m!994815))

(assert (=> b!1076005 m!994797))

(declare-fun m!994817 () Bool)

(assert (=> b!1076005 m!994817))

(declare-fun m!994819 () Bool)

(assert (=> b!1076005 m!994819))

(declare-fun m!994821 () Bool)

(assert (=> b!1076005 m!994821))

(assert (=> b!1076005 m!994771))

(declare-fun m!994823 () Bool)

(assert (=> b!1076005 m!994823))

(assert (=> b!1076005 m!994819))

(assert (=> b!1076005 m!994815))

(declare-fun m!994825 () Bool)

(assert (=> b!1076005 m!994825))

(assert (=> d!129647 m!994729))

(declare-fun m!994827 () Bool)

(assert (=> bm!45595 m!994827))

(assert (=> b!1076008 m!994771))

(assert (=> b!1076008 m!994771))

(declare-fun m!994829 () Bool)

(assert (=> b!1076008 m!994829))

(declare-fun m!994831 () Bool)

(assert (=> b!1076003 m!994831))

(assert (=> b!1076001 m!994771))

(assert (=> b!1076001 m!994771))

(assert (=> b!1076001 m!994773))

(declare-fun m!994833 () Bool)

(assert (=> bm!45596 m!994833))

(declare-fun m!994835 () Bool)

(assert (=> b!1075995 m!994835))

(declare-fun m!994837 () Bool)

(assert (=> b!1075997 m!994837))

(assert (=> b!1075891 d!129647))

(declare-fun d!129649 () Bool)

(declare-fun e!615021 () Bool)

(assert (=> d!129649 e!615021))

(declare-fun res!717228 () Bool)

(assert (=> d!129649 (=> (not res!717228) (not e!615021))))

(declare-fun lt!477785 () ListLongMap!14613)

(assert (=> d!129649 (= res!717228 (contains!6354 lt!477785 (_1!8333 (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun lt!477788 () List!23180)

(assert (=> d!129649 (= lt!477785 (ListLongMap!14614 lt!477788))))

(declare-fun lt!477786 () Unit!35417)

(declare-fun lt!477787 () Unit!35417)

(assert (=> d!129649 (= lt!477786 lt!477787)))

(declare-datatypes ((Option!664 0))(
  ( (Some!663 (v!15694 V!39843)) (None!662) )
))
(declare-fun getValueByKey!613 (List!23180 (_ BitVec 64)) Option!664)

(assert (=> d!129649 (= (getValueByKey!613 lt!477788 (_1!8333 (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))) (Some!663 (_2!8333 (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun lemmaContainsTupThenGetReturnValue!290 (List!23180 (_ BitVec 64) V!39843) Unit!35417)

(assert (=> d!129649 (= lt!477787 (lemmaContainsTupThenGetReturnValue!290 lt!477788 (_1!8333 (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (_2!8333 (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun insertStrictlySorted!383 (List!23180 (_ BitVec 64) V!39843) List!23180)

(assert (=> d!129649 (= lt!477788 (insertStrictlySorted!383 (toList!7322 (+!3228 lt!477690 (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (_1!8333 (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (_2!8333 (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(assert (=> d!129649 (= (+!3228 (+!3228 lt!477690 (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) lt!477785)))

(declare-fun b!1076018 () Bool)

(declare-fun res!717227 () Bool)

(assert (=> b!1076018 (=> (not res!717227) (not e!615021))))

(assert (=> b!1076018 (= res!717227 (= (getValueByKey!613 (toList!7322 lt!477785) (_1!8333 (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))) (Some!663 (_2!8333 (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))))

(declare-fun b!1076019 () Bool)

(declare-fun contains!6355 (List!23180 tuple2!16644) Bool)

(assert (=> b!1076019 (= e!615021 (contains!6355 (toList!7322 lt!477785) (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(assert (= (and d!129649 res!717228) b!1076018))

(assert (= (and b!1076018 res!717227) b!1076019))

(declare-fun m!994839 () Bool)

(assert (=> d!129649 m!994839))

(declare-fun m!994841 () Bool)

(assert (=> d!129649 m!994841))

(declare-fun m!994843 () Bool)

(assert (=> d!129649 m!994843))

(declare-fun m!994845 () Bool)

(assert (=> d!129649 m!994845))

(declare-fun m!994847 () Bool)

(assert (=> b!1076018 m!994847))

(declare-fun m!994849 () Bool)

(assert (=> b!1076019 m!994849))

(assert (=> b!1075891 d!129649))

(declare-fun d!129651 () Bool)

(declare-fun e!615022 () Bool)

(assert (=> d!129651 e!615022))

(declare-fun res!717230 () Bool)

(assert (=> d!129651 (=> (not res!717230) (not e!615022))))

(declare-fun lt!477789 () ListLongMap!14613)

(assert (=> d!129651 (= res!717230 (contains!6354 lt!477789 (_1!8333 (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!477792 () List!23180)

(assert (=> d!129651 (= lt!477789 (ListLongMap!14614 lt!477792))))

(declare-fun lt!477790 () Unit!35417)

(declare-fun lt!477791 () Unit!35417)

(assert (=> d!129651 (= lt!477790 lt!477791)))

(assert (=> d!129651 (= (getValueByKey!613 lt!477792 (_1!8333 (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!663 (_2!8333 (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!129651 (= lt!477791 (lemmaContainsTupThenGetReturnValue!290 lt!477792 (_1!8333 (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8333 (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!129651 (= lt!477792 (insertStrictlySorted!383 (toList!7322 lt!477690) (_1!8333 (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8333 (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!129651 (= (+!3228 lt!477690 (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!477789)))

(declare-fun b!1076020 () Bool)

(declare-fun res!717229 () Bool)

(assert (=> b!1076020 (=> (not res!717229) (not e!615022))))

(assert (=> b!1076020 (= res!717229 (= (getValueByKey!613 (toList!7322 lt!477789) (_1!8333 (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!663 (_2!8333 (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))))

(declare-fun b!1076021 () Bool)

(assert (=> b!1076021 (= e!615022 (contains!6355 (toList!7322 lt!477789) (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(assert (= (and d!129651 res!717230) b!1076020))

(assert (= (and b!1076020 res!717229) b!1076021))

(declare-fun m!994851 () Bool)

(assert (=> d!129651 m!994851))

(declare-fun m!994853 () Bool)

(assert (=> d!129651 m!994853))

(declare-fun m!994855 () Bool)

(assert (=> d!129651 m!994855))

(declare-fun m!994857 () Bool)

(assert (=> d!129651 m!994857))

(declare-fun m!994859 () Bool)

(assert (=> b!1076020 m!994859))

(declare-fun m!994861 () Bool)

(assert (=> b!1076021 m!994861))

(assert (=> b!1075891 d!129651))

(declare-fun d!129653 () Bool)

(assert (=> d!129653 (= (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477795 () Unit!35417)

(declare-fun choose!1757 (array!69033 array!69031 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39843 V!39843 V!39843 V!39843 (_ BitVec 32) Int) Unit!35417)

(assert (=> d!129653 (= lt!477795 (choose!1757 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129653 (validMask!0 mask!1515)))

(assert (=> d!129653 (= (lemmaNoChangeToArrayThenSameMapNoExtras!900 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477795)))

(declare-fun bs!31693 () Bool)

(assert (= bs!31693 d!129653))

(assert (=> bs!31693 m!994719))

(assert (=> bs!31693 m!994717))

(declare-fun m!994863 () Bool)

(assert (=> bs!31693 m!994863))

(assert (=> bs!31693 m!994729))

(assert (=> b!1075882 d!129653))

(declare-fun b!1076046 () Bool)

(declare-fun lt!477811 () Unit!35417)

(declare-fun lt!477814 () Unit!35417)

(assert (=> b!1076046 (= lt!477811 lt!477814)))

(declare-fun lt!477813 () (_ BitVec 64))

(declare-fun lt!477810 () ListLongMap!14613)

(declare-fun lt!477816 () V!39843)

(declare-fun lt!477812 () (_ BitVec 64))

(assert (=> b!1076046 (not (contains!6354 (+!3228 lt!477810 (tuple2!16645 lt!477812 lt!477816)) lt!477813))))

(declare-fun addStillNotContains!269 (ListLongMap!14613 (_ BitVec 64) V!39843 (_ BitVec 64)) Unit!35417)

(assert (=> b!1076046 (= lt!477814 (addStillNotContains!269 lt!477810 lt!477812 lt!477816 lt!477813))))

(assert (=> b!1076046 (= lt!477813 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1076046 (= lt!477816 (get!17243 (select (arr!33200 _values!955) #b00000000000000000000000000000000) (dynLambda!2048 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1076046 (= lt!477812 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45607 () ListLongMap!14613)

(assert (=> b!1076046 (= lt!477810 call!45607)))

(declare-fun e!615041 () ListLongMap!14613)

(assert (=> b!1076046 (= e!615041 (+!3228 call!45607 (tuple2!16645 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000) (get!17243 (select (arr!33200 _values!955) #b00000000000000000000000000000000) (dynLambda!2048 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1076047 () Bool)

(assert (=> b!1076047 (= e!615041 call!45607)))

(declare-fun b!1076048 () Bool)

(declare-fun e!615043 () ListLongMap!14613)

(assert (=> b!1076048 (= e!615043 (ListLongMap!14614 Nil!23177))))

(declare-fun b!1076049 () Bool)

(declare-fun e!615037 () Bool)

(declare-fun lt!477815 () ListLongMap!14613)

(declare-fun isEmpty!959 (ListLongMap!14613) Bool)

(assert (=> b!1076049 (= e!615037 (isEmpty!959 lt!477815))))

(declare-fun b!1076050 () Bool)

(declare-fun e!615042 () Bool)

(declare-fun e!615038 () Bool)

(assert (=> b!1076050 (= e!615042 e!615038)))

(declare-fun c!108170 () Bool)

(declare-fun e!615039 () Bool)

(assert (=> b!1076050 (= c!108170 e!615039)))

(declare-fun res!717241 () Bool)

(assert (=> b!1076050 (=> (not res!717241) (not e!615039))))

(assert (=> b!1076050 (= res!717241 (bvslt #b00000000000000000000000000000000 (size!33737 _keys!1163)))))

(declare-fun b!1076051 () Bool)

(declare-fun e!615040 () Bool)

(assert (=> b!1076051 (= e!615038 e!615040)))

(assert (=> b!1076051 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33737 _keys!1163)))))

(declare-fun res!717239 () Bool)

(assert (=> b!1076051 (= res!717239 (contains!6354 lt!477815 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076051 (=> (not res!717239) (not e!615040))))

(declare-fun b!1076052 () Bool)

(declare-fun res!717240 () Bool)

(assert (=> b!1076052 (=> (not res!717240) (not e!615042))))

(assert (=> b!1076052 (= res!717240 (not (contains!6354 lt!477815 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1076053 () Bool)

(assert (=> b!1076053 (= e!615043 e!615041)))

(declare-fun c!108168 () Bool)

(assert (=> b!1076053 (= c!108168 (validKeyInArray!0 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129655 () Bool)

(assert (=> d!129655 e!615042))

(declare-fun res!717242 () Bool)

(assert (=> d!129655 (=> (not res!717242) (not e!615042))))

(assert (=> d!129655 (= res!717242 (not (contains!6354 lt!477815 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129655 (= lt!477815 e!615043)))

(declare-fun c!108169 () Bool)

(assert (=> d!129655 (= c!108169 (bvsge #b00000000000000000000000000000000 (size!33737 _keys!1163)))))

(assert (=> d!129655 (validMask!0 mask!1515)))

(assert (=> d!129655 (= (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477815)))

(declare-fun b!1076054 () Bool)

(assert (=> b!1076054 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33737 _keys!1163)))))

(assert (=> b!1076054 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33736 _values!955)))))

(assert (=> b!1076054 (= e!615040 (= (apply!941 lt!477815 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000)) (get!17243 (select (arr!33200 _values!955) #b00000000000000000000000000000000) (dynLambda!2048 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1076055 () Bool)

(assert (=> b!1076055 (= e!615037 (= lt!477815 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun bm!45604 () Bool)

(assert (=> bm!45604 (= call!45607 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1076056 () Bool)

(assert (=> b!1076056 (= e!615039 (validKeyInArray!0 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076056 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1076057 () Bool)

(assert (=> b!1076057 (= e!615038 e!615037)))

(declare-fun c!108167 () Bool)

(assert (=> b!1076057 (= c!108167 (bvslt #b00000000000000000000000000000000 (size!33737 _keys!1163)))))

(assert (= (and d!129655 c!108169) b!1076048))

(assert (= (and d!129655 (not c!108169)) b!1076053))

(assert (= (and b!1076053 c!108168) b!1076046))

(assert (= (and b!1076053 (not c!108168)) b!1076047))

(assert (= (or b!1076046 b!1076047) bm!45604))

(assert (= (and d!129655 res!717242) b!1076052))

(assert (= (and b!1076052 res!717240) b!1076050))

(assert (= (and b!1076050 res!717241) b!1076056))

(assert (= (and b!1076050 c!108170) b!1076051))

(assert (= (and b!1076050 (not c!108170)) b!1076057))

(assert (= (and b!1076051 res!717239) b!1076054))

(assert (= (and b!1076057 c!108167) b!1076055))

(assert (= (and b!1076057 (not c!108167)) b!1076049))

(declare-fun b_lambda!16927 () Bool)

(assert (=> (not b_lambda!16927) (not b!1076046)))

(assert (=> b!1076046 t!32539))

(declare-fun b_and!35181 () Bool)

(assert (= b_and!35179 (and (=> t!32539 result!14839) b_and!35181)))

(declare-fun b_lambda!16929 () Bool)

(assert (=> (not b_lambda!16929) (not b!1076054)))

(assert (=> b!1076054 t!32539))

(declare-fun b_and!35183 () Bool)

(assert (= b_and!35181 (and (=> t!32539 result!14839) b_and!35183)))

(assert (=> b!1076056 m!994771))

(assert (=> b!1076056 m!994771))

(assert (=> b!1076056 m!994773))

(declare-fun m!994865 () Bool)

(assert (=> bm!45604 m!994865))

(assert (=> b!1076053 m!994771))

(assert (=> b!1076053 m!994771))

(assert (=> b!1076053 m!994773))

(declare-fun m!994867 () Bool)

(assert (=> b!1076046 m!994867))

(declare-fun m!994869 () Bool)

(assert (=> b!1076046 m!994869))

(declare-fun m!994871 () Bool)

(assert (=> b!1076046 m!994871))

(assert (=> b!1076046 m!994789))

(assert (=> b!1076046 m!994867))

(declare-fun m!994873 () Bool)

(assert (=> b!1076046 m!994873))

(assert (=> b!1076046 m!994771))

(assert (=> b!1076046 m!994787))

(assert (=> b!1076046 m!994787))

(assert (=> b!1076046 m!994789))

(assert (=> b!1076046 m!994791))

(declare-fun m!994875 () Bool)

(assert (=> d!129655 m!994875))

(assert (=> d!129655 m!994729))

(assert (=> b!1076055 m!994865))

(assert (=> b!1076051 m!994771))

(assert (=> b!1076051 m!994771))

(declare-fun m!994877 () Bool)

(assert (=> b!1076051 m!994877))

(declare-fun m!994879 () Bool)

(assert (=> b!1076049 m!994879))

(assert (=> b!1076054 m!994771))

(declare-fun m!994881 () Bool)

(assert (=> b!1076054 m!994881))

(assert (=> b!1076054 m!994789))

(assert (=> b!1076054 m!994771))

(assert (=> b!1076054 m!994787))

(assert (=> b!1076054 m!994787))

(assert (=> b!1076054 m!994789))

(assert (=> b!1076054 m!994791))

(declare-fun m!994883 () Bool)

(assert (=> b!1076052 m!994883))

(assert (=> b!1075882 d!129655))

(declare-fun b!1076058 () Bool)

(declare-fun lt!477818 () Unit!35417)

(declare-fun lt!477821 () Unit!35417)

(assert (=> b!1076058 (= lt!477818 lt!477821)))

(declare-fun lt!477823 () V!39843)

(declare-fun lt!477819 () (_ BitVec 64))

(declare-fun lt!477820 () (_ BitVec 64))

(declare-fun lt!477817 () ListLongMap!14613)

(assert (=> b!1076058 (not (contains!6354 (+!3228 lt!477817 (tuple2!16645 lt!477819 lt!477823)) lt!477820))))

(assert (=> b!1076058 (= lt!477821 (addStillNotContains!269 lt!477817 lt!477819 lt!477823 lt!477820))))

(assert (=> b!1076058 (= lt!477820 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1076058 (= lt!477823 (get!17243 (select (arr!33200 _values!955) #b00000000000000000000000000000000) (dynLambda!2048 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1076058 (= lt!477819 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45608 () ListLongMap!14613)

(assert (=> b!1076058 (= lt!477817 call!45608)))

(declare-fun e!615048 () ListLongMap!14613)

(assert (=> b!1076058 (= e!615048 (+!3228 call!45608 (tuple2!16645 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000) (get!17243 (select (arr!33200 _values!955) #b00000000000000000000000000000000) (dynLambda!2048 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1076059 () Bool)

(assert (=> b!1076059 (= e!615048 call!45608)))

(declare-fun b!1076060 () Bool)

(declare-fun e!615050 () ListLongMap!14613)

(assert (=> b!1076060 (= e!615050 (ListLongMap!14614 Nil!23177))))

(declare-fun b!1076061 () Bool)

(declare-fun e!615044 () Bool)

(declare-fun lt!477822 () ListLongMap!14613)

(assert (=> b!1076061 (= e!615044 (isEmpty!959 lt!477822))))

(declare-fun b!1076062 () Bool)

(declare-fun e!615049 () Bool)

(declare-fun e!615045 () Bool)

(assert (=> b!1076062 (= e!615049 e!615045)))

(declare-fun c!108174 () Bool)

(declare-fun e!615046 () Bool)

(assert (=> b!1076062 (= c!108174 e!615046)))

(declare-fun res!717245 () Bool)

(assert (=> b!1076062 (=> (not res!717245) (not e!615046))))

(assert (=> b!1076062 (= res!717245 (bvslt #b00000000000000000000000000000000 (size!33737 _keys!1163)))))

(declare-fun b!1076063 () Bool)

(declare-fun e!615047 () Bool)

(assert (=> b!1076063 (= e!615045 e!615047)))

(assert (=> b!1076063 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33737 _keys!1163)))))

(declare-fun res!717243 () Bool)

(assert (=> b!1076063 (= res!717243 (contains!6354 lt!477822 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076063 (=> (not res!717243) (not e!615047))))

(declare-fun b!1076064 () Bool)

(declare-fun res!717244 () Bool)

(assert (=> b!1076064 (=> (not res!717244) (not e!615049))))

(assert (=> b!1076064 (= res!717244 (not (contains!6354 lt!477822 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1076065 () Bool)

(assert (=> b!1076065 (= e!615050 e!615048)))

(declare-fun c!108172 () Bool)

(assert (=> b!1076065 (= c!108172 (validKeyInArray!0 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129657 () Bool)

(assert (=> d!129657 e!615049))

(declare-fun res!717246 () Bool)

(assert (=> d!129657 (=> (not res!717246) (not e!615049))))

(assert (=> d!129657 (= res!717246 (not (contains!6354 lt!477822 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129657 (= lt!477822 e!615050)))

(declare-fun c!108173 () Bool)

(assert (=> d!129657 (= c!108173 (bvsge #b00000000000000000000000000000000 (size!33737 _keys!1163)))))

(assert (=> d!129657 (validMask!0 mask!1515)))

(assert (=> d!129657 (= (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477822)))

(declare-fun b!1076066 () Bool)

(assert (=> b!1076066 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33737 _keys!1163)))))

(assert (=> b!1076066 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33736 _values!955)))))

(assert (=> b!1076066 (= e!615047 (= (apply!941 lt!477822 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000)) (get!17243 (select (arr!33200 _values!955) #b00000000000000000000000000000000) (dynLambda!2048 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1076067 () Bool)

(assert (=> b!1076067 (= e!615044 (= lt!477822 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun bm!45605 () Bool)

(assert (=> bm!45605 (= call!45608 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1076068 () Bool)

(assert (=> b!1076068 (= e!615046 (validKeyInArray!0 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076068 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1076069 () Bool)

(assert (=> b!1076069 (= e!615045 e!615044)))

(declare-fun c!108171 () Bool)

(assert (=> b!1076069 (= c!108171 (bvslt #b00000000000000000000000000000000 (size!33737 _keys!1163)))))

(assert (= (and d!129657 c!108173) b!1076060))

(assert (= (and d!129657 (not c!108173)) b!1076065))

(assert (= (and b!1076065 c!108172) b!1076058))

(assert (= (and b!1076065 (not c!108172)) b!1076059))

(assert (= (or b!1076058 b!1076059) bm!45605))

(assert (= (and d!129657 res!717246) b!1076064))

(assert (= (and b!1076064 res!717244) b!1076062))

(assert (= (and b!1076062 res!717245) b!1076068))

(assert (= (and b!1076062 c!108174) b!1076063))

(assert (= (and b!1076062 (not c!108174)) b!1076069))

(assert (= (and b!1076063 res!717243) b!1076066))

(assert (= (and b!1076069 c!108171) b!1076067))

(assert (= (and b!1076069 (not c!108171)) b!1076061))

(declare-fun b_lambda!16931 () Bool)

(assert (=> (not b_lambda!16931) (not b!1076058)))

(assert (=> b!1076058 t!32539))

(declare-fun b_and!35185 () Bool)

(assert (= b_and!35183 (and (=> t!32539 result!14839) b_and!35185)))

(declare-fun b_lambda!16933 () Bool)

(assert (=> (not b_lambda!16933) (not b!1076066)))

(assert (=> b!1076066 t!32539))

(declare-fun b_and!35187 () Bool)

(assert (= b_and!35185 (and (=> t!32539 result!14839) b_and!35187)))

(assert (=> b!1076068 m!994771))

(assert (=> b!1076068 m!994771))

(assert (=> b!1076068 m!994773))

(declare-fun m!994885 () Bool)

(assert (=> bm!45605 m!994885))

(assert (=> b!1076065 m!994771))

(assert (=> b!1076065 m!994771))

(assert (=> b!1076065 m!994773))

(declare-fun m!994887 () Bool)

(assert (=> b!1076058 m!994887))

(declare-fun m!994889 () Bool)

(assert (=> b!1076058 m!994889))

(declare-fun m!994891 () Bool)

(assert (=> b!1076058 m!994891))

(assert (=> b!1076058 m!994789))

(assert (=> b!1076058 m!994887))

(declare-fun m!994893 () Bool)

(assert (=> b!1076058 m!994893))

(assert (=> b!1076058 m!994771))

(assert (=> b!1076058 m!994787))

(assert (=> b!1076058 m!994787))

(assert (=> b!1076058 m!994789))

(assert (=> b!1076058 m!994791))

(declare-fun m!994895 () Bool)

(assert (=> d!129657 m!994895))

(assert (=> d!129657 m!994729))

(assert (=> b!1076067 m!994885))

(assert (=> b!1076063 m!994771))

(assert (=> b!1076063 m!994771))

(declare-fun m!994897 () Bool)

(assert (=> b!1076063 m!994897))

(declare-fun m!994899 () Bool)

(assert (=> b!1076061 m!994899))

(assert (=> b!1076066 m!994771))

(declare-fun m!994901 () Bool)

(assert (=> b!1076066 m!994901))

(assert (=> b!1076066 m!994789))

(assert (=> b!1076066 m!994771))

(assert (=> b!1076066 m!994787))

(assert (=> b!1076066 m!994787))

(assert (=> b!1076066 m!994789))

(assert (=> b!1076066 m!994791))

(declare-fun m!994903 () Bool)

(assert (=> b!1076064 m!994903))

(assert (=> b!1075882 d!129657))

(declare-fun b!1076070 () Bool)

(declare-fun e!615063 () ListLongMap!14613)

(declare-fun call!45609 () ListLongMap!14613)

(assert (=> b!1076070 (= e!615063 call!45609)))

(declare-fun bm!45606 () Bool)

(declare-fun call!45615 () Bool)

(declare-fun lt!477844 () ListLongMap!14613)

(assert (=> bm!45606 (= call!45615 (contains!6354 lt!477844 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1076071 () Bool)

(declare-fun e!615060 () ListLongMap!14613)

(declare-fun e!615058 () ListLongMap!14613)

(assert (=> b!1076071 (= e!615060 e!615058)))

(declare-fun c!108178 () Bool)

(assert (=> b!1076071 (= c!108178 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1076072 () Bool)

(declare-fun e!615051 () Bool)

(declare-fun e!615062 () Bool)

(assert (=> b!1076072 (= e!615051 e!615062)))

(declare-fun c!108179 () Bool)

(assert (=> b!1076072 (= c!108179 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1076073 () Bool)

(declare-fun call!45613 () ListLongMap!14613)

(assert (=> b!1076073 (= e!615063 call!45613)))

(declare-fun b!1076074 () Bool)

(declare-fun e!615054 () Bool)

(assert (=> b!1076074 (= e!615054 (= (apply!941 lt!477844 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1076075 () Bool)

(declare-fun e!615056 () Unit!35417)

(declare-fun Unit!35422 () Unit!35417)

(assert (=> b!1076075 (= e!615056 Unit!35422)))

(declare-fun b!1076076 () Bool)

(declare-fun call!45612 () ListLongMap!14613)

(assert (=> b!1076076 (= e!615060 (+!3228 call!45612 (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1076077 () Bool)

(declare-fun e!615061 () Bool)

(assert (=> b!1076077 (= e!615061 (= (apply!941 lt!477844 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000)) (get!17243 (select (arr!33200 _values!955) #b00000000000000000000000000000000) (dynLambda!2048 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1076077 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33736 _values!955)))))

(assert (=> b!1076077 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33737 _keys!1163)))))

(declare-fun b!1076078 () Bool)

(assert (=> b!1076078 (= e!615062 e!615054)))

(declare-fun res!717249 () Bool)

(declare-fun call!45610 () Bool)

(assert (=> b!1076078 (= res!717249 call!45610)))

(assert (=> b!1076078 (=> (not res!717249) (not e!615054))))

(declare-fun b!1076079 () Bool)

(declare-fun res!717254 () Bool)

(assert (=> b!1076079 (=> (not res!717254) (not e!615051))))

(declare-fun e!615052 () Bool)

(assert (=> b!1076079 (= res!717254 e!615052)))

(declare-fun res!717247 () Bool)

(assert (=> b!1076079 (=> res!717247 e!615052)))

(declare-fun e!615057 () Bool)

(assert (=> b!1076079 (= res!717247 (not e!615057))))

(declare-fun res!717252 () Bool)

(assert (=> b!1076079 (=> (not res!717252) (not e!615057))))

(assert (=> b!1076079 (= res!717252 (bvslt #b00000000000000000000000000000000 (size!33737 _keys!1163)))))

(declare-fun bm!45608 () Bool)

(assert (=> bm!45608 (= call!45609 call!45612)))

(declare-fun bm!45609 () Bool)

(declare-fun call!45614 () ListLongMap!14613)

(declare-fun call!45611 () ListLongMap!14613)

(assert (=> bm!45609 (= call!45614 call!45611)))

(declare-fun b!1076080 () Bool)

(assert (=> b!1076080 (= e!615057 (validKeyInArray!0 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076081 () Bool)

(declare-fun c!108175 () Bool)

(assert (=> b!1076081 (= c!108175 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1076081 (= e!615058 e!615063)))

(declare-fun b!1076082 () Bool)

(declare-fun e!615059 () Bool)

(assert (=> b!1076082 (= e!615059 (= (apply!941 lt!477844 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun b!1076083 () Bool)

(declare-fun e!615055 () Bool)

(assert (=> b!1076083 (= e!615055 (not call!45615))))

(declare-fun bm!45610 () Bool)

(declare-fun c!108176 () Bool)

(assert (=> bm!45610 (= call!45612 (+!3228 (ite c!108176 call!45611 (ite c!108178 call!45614 call!45613)) (ite (or c!108176 c!108178) (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1076084 () Bool)

(declare-fun lt!477825 () Unit!35417)

(assert (=> b!1076084 (= e!615056 lt!477825)))

(declare-fun lt!477836 () ListLongMap!14613)

(assert (=> b!1076084 (= lt!477836 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477829 () (_ BitVec 64))

(assert (=> b!1076084 (= lt!477829 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477837 () (_ BitVec 64))

(assert (=> b!1076084 (= lt!477837 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477830 () Unit!35417)

(assert (=> b!1076084 (= lt!477830 (addStillContains!654 lt!477836 lt!477829 zeroValueAfter!47 lt!477837))))

(assert (=> b!1076084 (contains!6354 (+!3228 lt!477836 (tuple2!16645 lt!477829 zeroValueAfter!47)) lt!477837)))

(declare-fun lt!477824 () Unit!35417)

(assert (=> b!1076084 (= lt!477824 lt!477830)))

(declare-fun lt!477843 () ListLongMap!14613)

(assert (=> b!1076084 (= lt!477843 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477839 () (_ BitVec 64))

(assert (=> b!1076084 (= lt!477839 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477828 () (_ BitVec 64))

(assert (=> b!1076084 (= lt!477828 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477835 () Unit!35417)

(assert (=> b!1076084 (= lt!477835 (addApplyDifferent!514 lt!477843 lt!477839 minValue!907 lt!477828))))

(assert (=> b!1076084 (= (apply!941 (+!3228 lt!477843 (tuple2!16645 lt!477839 minValue!907)) lt!477828) (apply!941 lt!477843 lt!477828))))

(declare-fun lt!477841 () Unit!35417)

(assert (=> b!1076084 (= lt!477841 lt!477835)))

(declare-fun lt!477832 () ListLongMap!14613)

(assert (=> b!1076084 (= lt!477832 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477833 () (_ BitVec 64))

(assert (=> b!1076084 (= lt!477833 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477840 () (_ BitVec 64))

(assert (=> b!1076084 (= lt!477840 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477831 () Unit!35417)

(assert (=> b!1076084 (= lt!477831 (addApplyDifferent!514 lt!477832 lt!477833 zeroValueAfter!47 lt!477840))))

(assert (=> b!1076084 (= (apply!941 (+!3228 lt!477832 (tuple2!16645 lt!477833 zeroValueAfter!47)) lt!477840) (apply!941 lt!477832 lt!477840))))

(declare-fun lt!477827 () Unit!35417)

(assert (=> b!1076084 (= lt!477827 lt!477831)))

(declare-fun lt!477838 () ListLongMap!14613)

(assert (=> b!1076084 (= lt!477838 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477834 () (_ BitVec 64))

(assert (=> b!1076084 (= lt!477834 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477826 () (_ BitVec 64))

(assert (=> b!1076084 (= lt!477826 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1076084 (= lt!477825 (addApplyDifferent!514 lt!477838 lt!477834 minValue!907 lt!477826))))

(assert (=> b!1076084 (= (apply!941 (+!3228 lt!477838 (tuple2!16645 lt!477834 minValue!907)) lt!477826) (apply!941 lt!477838 lt!477826))))

(declare-fun b!1076085 () Bool)

(assert (=> b!1076085 (= e!615058 call!45609)))

(declare-fun b!1076086 () Bool)

(assert (=> b!1076086 (= e!615062 (not call!45610))))

(declare-fun bm!45611 () Bool)

(assert (=> bm!45611 (= call!45613 call!45614)))

(declare-fun b!1076087 () Bool)

(assert (=> b!1076087 (= e!615052 e!615061)))

(declare-fun res!717248 () Bool)

(assert (=> b!1076087 (=> (not res!717248) (not e!615061))))

(assert (=> b!1076087 (= res!717248 (contains!6354 lt!477844 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076087 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33737 _keys!1163)))))

(declare-fun d!129659 () Bool)

(assert (=> d!129659 e!615051))

(declare-fun res!717250 () Bool)

(assert (=> d!129659 (=> (not res!717250) (not e!615051))))

(assert (=> d!129659 (= res!717250 (or (bvsge #b00000000000000000000000000000000 (size!33737 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33737 _keys!1163)))))))

(declare-fun lt!477845 () ListLongMap!14613)

(assert (=> d!129659 (= lt!477844 lt!477845)))

(declare-fun lt!477842 () Unit!35417)

(assert (=> d!129659 (= lt!477842 e!615056)))

(declare-fun c!108180 () Bool)

(declare-fun e!615053 () Bool)

(assert (=> d!129659 (= c!108180 e!615053)))

(declare-fun res!717251 () Bool)

(assert (=> d!129659 (=> (not res!717251) (not e!615053))))

(assert (=> d!129659 (= res!717251 (bvslt #b00000000000000000000000000000000 (size!33737 _keys!1163)))))

(assert (=> d!129659 (= lt!477845 e!615060)))

(assert (=> d!129659 (= c!108176 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129659 (validMask!0 mask!1515)))

(assert (=> d!129659 (= (getCurrentListMap!4191 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477844)))

(declare-fun bm!45607 () Bool)

(assert (=> bm!45607 (= call!45610 (contains!6354 lt!477844 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1076088 () Bool)

(assert (=> b!1076088 (= e!615053 (validKeyInArray!0 (select (arr!33201 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45612 () Bool)

(assert (=> bm!45612 (= call!45611 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076089 () Bool)

(assert (=> b!1076089 (= e!615055 e!615059)))

(declare-fun res!717253 () Bool)

(assert (=> b!1076089 (= res!717253 call!45615)))

(assert (=> b!1076089 (=> (not res!717253) (not e!615059))))

(declare-fun b!1076090 () Bool)

(declare-fun res!717255 () Bool)

(assert (=> b!1076090 (=> (not res!717255) (not e!615051))))

(assert (=> b!1076090 (= res!717255 e!615055)))

(declare-fun c!108177 () Bool)

(assert (=> b!1076090 (= c!108177 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!129659 c!108176) b!1076076))

(assert (= (and d!129659 (not c!108176)) b!1076071))

(assert (= (and b!1076071 c!108178) b!1076085))

(assert (= (and b!1076071 (not c!108178)) b!1076081))

(assert (= (and b!1076081 c!108175) b!1076070))

(assert (= (and b!1076081 (not c!108175)) b!1076073))

(assert (= (or b!1076070 b!1076073) bm!45611))

(assert (= (or b!1076085 bm!45611) bm!45609))

(assert (= (or b!1076085 b!1076070) bm!45608))

(assert (= (or b!1076076 bm!45609) bm!45612))

(assert (= (or b!1076076 bm!45608) bm!45610))

(assert (= (and d!129659 res!717251) b!1076088))

(assert (= (and d!129659 c!108180) b!1076084))

(assert (= (and d!129659 (not c!108180)) b!1076075))

(assert (= (and d!129659 res!717250) b!1076079))

(assert (= (and b!1076079 res!717252) b!1076080))

(assert (= (and b!1076079 (not res!717247)) b!1076087))

(assert (= (and b!1076087 res!717248) b!1076077))

(assert (= (and b!1076079 res!717254) b!1076090))

(assert (= (and b!1076090 c!108177) b!1076089))

(assert (= (and b!1076090 (not c!108177)) b!1076083))

(assert (= (and b!1076089 res!717253) b!1076082))

(assert (= (or b!1076089 b!1076083) bm!45606))

(assert (= (and b!1076090 res!717255) b!1076072))

(assert (= (and b!1076072 c!108179) b!1076078))

(assert (= (and b!1076072 (not c!108179)) b!1076086))

(assert (= (and b!1076078 res!717249) b!1076074))

(assert (= (or b!1076078 b!1076086) bm!45607))

(declare-fun b_lambda!16935 () Bool)

(assert (=> (not b_lambda!16935) (not b!1076077)))

(assert (=> b!1076077 t!32539))

(declare-fun b_and!35189 () Bool)

(assert (= b_and!35187 (and (=> t!32539 result!14839) b_and!35189)))

(assert (=> b!1076088 m!994771))

(assert (=> b!1076088 m!994771))

(assert (=> b!1076088 m!994773))

(assert (=> bm!45612 m!994717))

(assert (=> b!1076077 m!994787))

(assert (=> b!1076077 m!994789))

(assert (=> b!1076077 m!994791))

(assert (=> b!1076077 m!994771))

(assert (=> b!1076077 m!994771))

(declare-fun m!994905 () Bool)

(assert (=> b!1076077 m!994905))

(assert (=> b!1076077 m!994789))

(assert (=> b!1076077 m!994787))

(declare-fun m!994907 () Bool)

(assert (=> bm!45610 m!994907))

(declare-fun m!994909 () Bool)

(assert (=> b!1076084 m!994909))

(declare-fun m!994911 () Bool)

(assert (=> b!1076084 m!994911))

(declare-fun m!994913 () Bool)

(assert (=> b!1076084 m!994913))

(declare-fun m!994915 () Bool)

(assert (=> b!1076084 m!994915))

(declare-fun m!994917 () Bool)

(assert (=> b!1076084 m!994917))

(declare-fun m!994919 () Bool)

(assert (=> b!1076084 m!994919))

(declare-fun m!994921 () Bool)

(assert (=> b!1076084 m!994921))

(assert (=> b!1076084 m!994717))

(declare-fun m!994923 () Bool)

(assert (=> b!1076084 m!994923))

(assert (=> b!1076084 m!994921))

(declare-fun m!994925 () Bool)

(assert (=> b!1076084 m!994925))

(declare-fun m!994927 () Bool)

(assert (=> b!1076084 m!994927))

(assert (=> b!1076084 m!994909))

(declare-fun m!994929 () Bool)

(assert (=> b!1076084 m!994929))

(declare-fun m!994931 () Bool)

(assert (=> b!1076084 m!994931))

(declare-fun m!994933 () Bool)

(assert (=> b!1076084 m!994933))

(assert (=> b!1076084 m!994771))

(declare-fun m!994935 () Bool)

(assert (=> b!1076084 m!994935))

(assert (=> b!1076084 m!994931))

(assert (=> b!1076084 m!994927))

(declare-fun m!994937 () Bool)

(assert (=> b!1076084 m!994937))

(assert (=> d!129659 m!994729))

(declare-fun m!994939 () Bool)

(assert (=> bm!45606 m!994939))

(assert (=> b!1076087 m!994771))

(assert (=> b!1076087 m!994771))

(declare-fun m!994941 () Bool)

(assert (=> b!1076087 m!994941))

(declare-fun m!994943 () Bool)

(assert (=> b!1076082 m!994943))

(assert (=> b!1076080 m!994771))

(assert (=> b!1076080 m!994771))

(assert (=> b!1076080 m!994773))

(declare-fun m!994945 () Bool)

(assert (=> bm!45607 m!994945))

(declare-fun m!994947 () Bool)

(assert (=> b!1076074 m!994947))

(declare-fun m!994949 () Bool)

(assert (=> b!1076076 m!994949))

(assert (=> b!1075883 d!129659))

(declare-fun d!129661 () Bool)

(declare-fun e!615064 () Bool)

(assert (=> d!129661 e!615064))

(declare-fun res!717257 () Bool)

(assert (=> d!129661 (=> (not res!717257) (not e!615064))))

(declare-fun lt!477846 () ListLongMap!14613)

(assert (=> d!129661 (= res!717257 (contains!6354 lt!477846 (_1!8333 (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun lt!477849 () List!23180)

(assert (=> d!129661 (= lt!477846 (ListLongMap!14614 lt!477849))))

(declare-fun lt!477847 () Unit!35417)

(declare-fun lt!477848 () Unit!35417)

(assert (=> d!129661 (= lt!477847 lt!477848)))

(assert (=> d!129661 (= (getValueByKey!613 lt!477849 (_1!8333 (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))) (Some!663 (_2!8333 (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(assert (=> d!129661 (= lt!477848 (lemmaContainsTupThenGetReturnValue!290 lt!477849 (_1!8333 (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (_2!8333 (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(assert (=> d!129661 (= lt!477849 (insertStrictlySorted!383 (toList!7322 lt!477691) (_1!8333 (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (_2!8333 (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(assert (=> d!129661 (= (+!3228 lt!477691 (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) lt!477846)))

(declare-fun b!1076091 () Bool)

(declare-fun res!717256 () Bool)

(assert (=> b!1076091 (=> (not res!717256) (not e!615064))))

(assert (=> b!1076091 (= res!717256 (= (getValueByKey!613 (toList!7322 lt!477846) (_1!8333 (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))) (Some!663 (_2!8333 (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))))

(declare-fun b!1076092 () Bool)

(assert (=> b!1076092 (= e!615064 (contains!6355 (toList!7322 lt!477846) (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(assert (= (and d!129661 res!717257) b!1076091))

(assert (= (and b!1076091 res!717256) b!1076092))

(declare-fun m!994951 () Bool)

(assert (=> d!129661 m!994951))

(declare-fun m!994953 () Bool)

(assert (=> d!129661 m!994953))

(declare-fun m!994955 () Bool)

(assert (=> d!129661 m!994955))

(declare-fun m!994957 () Bool)

(assert (=> d!129661 m!994957))

(declare-fun m!994959 () Bool)

(assert (=> b!1076091 m!994959))

(declare-fun m!994961 () Bool)

(assert (=> b!1076092 m!994961))

(assert (=> b!1075883 d!129661))

(declare-fun d!129663 () Bool)

(assert (=> d!129663 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95182 d!129663))

(declare-fun d!129665 () Bool)

(assert (=> d!129665 (= (array_inv!25654 _values!955) (bvsge (size!33736 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95182 d!129665))

(declare-fun d!129667 () Bool)

(assert (=> d!129667 (= (array_inv!25655 _keys!1163) (bvsge (size!33737 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95182 d!129667))

(declare-fun b!1076100 () Bool)

(declare-fun e!615070 () Bool)

(assert (=> b!1076100 (= e!615070 tp_is_empty!26031)))

(declare-fun condMapEmpty!40792 () Bool)

(declare-fun mapDefault!40792 () ValueCell!12312)

(assert (=> mapNonEmpty!40786 (= condMapEmpty!40792 (= mapRest!40786 ((as const (Array (_ BitVec 32) ValueCell!12312)) mapDefault!40792)))))

(declare-fun mapRes!40792 () Bool)

(assert (=> mapNonEmpty!40786 (= tp!78154 (and e!615070 mapRes!40792))))

(declare-fun mapIsEmpty!40792 () Bool)

(assert (=> mapIsEmpty!40792 mapRes!40792))

(declare-fun b!1076099 () Bool)

(declare-fun e!615069 () Bool)

(assert (=> b!1076099 (= e!615069 tp_is_empty!26031)))

(declare-fun mapNonEmpty!40792 () Bool)

(declare-fun tp!78164 () Bool)

(assert (=> mapNonEmpty!40792 (= mapRes!40792 (and tp!78164 e!615069))))

(declare-fun mapKey!40792 () (_ BitVec 32))

(declare-fun mapValue!40792 () ValueCell!12312)

(declare-fun mapRest!40792 () (Array (_ BitVec 32) ValueCell!12312))

(assert (=> mapNonEmpty!40792 (= mapRest!40786 (store mapRest!40792 mapKey!40792 mapValue!40792))))

(assert (= (and mapNonEmpty!40786 condMapEmpty!40792) mapIsEmpty!40792))

(assert (= (and mapNonEmpty!40786 (not condMapEmpty!40792)) mapNonEmpty!40792))

(assert (= (and mapNonEmpty!40792 ((_ is ValueCellFull!12312) mapValue!40792)) b!1076099))

(assert (= (and mapNonEmpty!40786 ((_ is ValueCellFull!12312) mapDefault!40792)) b!1076100))

(declare-fun m!994963 () Bool)

(assert (=> mapNonEmpty!40792 m!994963))

(declare-fun b_lambda!16937 () Bool)

(assert (= b_lambda!16933 (or (and start!95182 b_free!22221) b_lambda!16937)))

(declare-fun b_lambda!16939 () Bool)

(assert (= b_lambda!16925 (or (and start!95182 b_free!22221) b_lambda!16939)))

(declare-fun b_lambda!16941 () Bool)

(assert (= b_lambda!16931 (or (and start!95182 b_free!22221) b_lambda!16941)))

(declare-fun b_lambda!16943 () Bool)

(assert (= b_lambda!16929 (or (and start!95182 b_free!22221) b_lambda!16943)))

(declare-fun b_lambda!16945 () Bool)

(assert (= b_lambda!16935 (or (and start!95182 b_free!22221) b_lambda!16945)))

(declare-fun b_lambda!16947 () Bool)

(assert (= b_lambda!16927 (or (and start!95182 b_free!22221) b_lambda!16947)))

(check-sat (not b!1076066) (not b!1076021) (not b!1076051) (not b!1076087) (not b!1076061) (not d!129657) (not b!1076088) (not d!129659) (not b!1076049) (not b_lambda!16939) (not mapNonEmpty!40792) (not b!1076092) (not bm!45580) (not b_lambda!16937) (not b!1075998) (not b!1076019) (not b_lambda!16947) (not b!1076058) (not b!1075933) (not b_next!22221) (not bm!45604) (not b_lambda!16943) (not b!1076084) (not b!1075932) (not bm!45606) (not b!1076056) (not b!1076068) (not b!1076009) (not b!1076020) (not b!1076082) (not bm!45596) (not b!1076018) (not bm!45595) (not bm!45599) (not b!1076005) (not b!1075995) (not b!1076074) (not d!129651) (not b!1076067) (not b_lambda!16941) (not b!1075935) tp_is_empty!26031 (not d!129649) (not b!1076063) (not bm!45577) (not bm!45607) (not b!1076077) (not b!1076052) (not b!1075945) (not b_lambda!16945) (not d!129647) (not b!1076003) (not b!1076080) (not d!129655) (not bm!45612) (not d!129653) (not b!1076001) (not b!1076091) b_and!35189 (not b!1076046) (not b!1076054) (not b!1076055) (not d!129661) (not b!1075997) (not b!1075947) (not b!1076008) (not bm!45601) (not bm!45610) (not b!1076064) (not b!1076065) (not b!1076076) (not b!1076053) (not bm!45605))
(check-sat b_and!35189 (not b_next!22221))
