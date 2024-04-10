; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95068 () Bool)

(assert start!95068)

(declare-fun b_free!22185 () Bool)

(declare-fun b_next!22185 () Bool)

(assert (=> start!95068 (= b_free!22185 (not b_next!22185))))

(declare-fun tp!78034 () Bool)

(declare-fun b_and!35093 () Bool)

(assert (=> start!95068 (= tp!78034 b_and!35093)))

(declare-fun b!1074731 () Bool)

(declare-fun e!614143 () Bool)

(declare-datatypes ((V!39795 0))(
  ( (V!39796 (val!13048 Int)) )
))
(declare-datatypes ((tuple2!16622 0))(
  ( (tuple2!16623 (_1!8322 (_ BitVec 64)) (_2!8322 V!39795)) )
))
(declare-datatypes ((List!23158 0))(
  ( (Nil!23155) (Cons!23154 (h!24363 tuple2!16622) (t!32505 List!23158)) )
))
(declare-datatypes ((ListLongMap!14591 0))(
  ( (ListLongMap!14592 (toList!7311 List!23158)) )
))
(declare-fun lt!476843 () ListLongMap!14591)

(declare-fun contains!6341 (ListLongMap!14591 (_ BitVec 64)) Bool)

(assert (=> b!1074731 (= e!614143 (not (contains!6341 lt!476843 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!614145 () Bool)

(assert (=> b!1074731 e!614145))

(declare-fun res!716580 () Bool)

(assert (=> b!1074731 (=> (not res!716580) (not e!614145))))

(declare-fun zeroValueBefore!47 () V!39795)

(declare-fun lt!476845 () ListLongMap!14591)

(declare-fun +!3220 (ListLongMap!14591 tuple2!16622) ListLongMap!14591)

(assert (=> b!1074731 (= res!716580 (= lt!476845 (+!3220 lt!476843 (tuple2!16623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun lt!476846 () ListLongMap!14591)

(declare-datatypes ((ValueCell!12294 0))(
  ( (ValueCellFull!12294 (v!15670 V!39795)) (EmptyCell!12294) )
))
(declare-datatypes ((array!68957 0))(
  ( (array!68958 (arr!33167 (Array (_ BitVec 32) ValueCell!12294)) (size!33703 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68957)

(declare-fun minValue!907 () V!39795)

(declare-datatypes ((array!68959 0))(
  ( (array!68960 (arr!33168 (Array (_ BitVec 32) (_ BitVec 64))) (size!33704 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68959)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39795)

(declare-fun getCurrentListMap!4181 (array!68959 array!68957 (_ BitVec 32) (_ BitVec 32) V!39795 V!39795 (_ BitVec 32) Int) ListLongMap!14591)

(assert (=> b!1074731 (= lt!476846 (getCurrentListMap!4181 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1074731 (= lt!476845 (getCurrentListMap!4181 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40720 () Bool)

(declare-fun mapRes!40720 () Bool)

(assert (=> mapIsEmpty!40720 mapRes!40720))

(declare-fun b!1074732 () Bool)

(declare-fun e!614141 () Bool)

(declare-fun tp_is_empty!25995 () Bool)

(assert (=> b!1074732 (= e!614141 tp_is_empty!25995)))

(declare-fun mapNonEmpty!40720 () Bool)

(declare-fun tp!78035 () Bool)

(assert (=> mapNonEmpty!40720 (= mapRes!40720 (and tp!78035 e!614141))))

(declare-fun mapValue!40720 () ValueCell!12294)

(declare-fun mapKey!40720 () (_ BitVec 32))

(declare-fun mapRest!40720 () (Array (_ BitVec 32) ValueCell!12294))

(assert (=> mapNonEmpty!40720 (= (arr!33167 _values!955) (store mapRest!40720 mapKey!40720 mapValue!40720))))

(declare-fun b!1074733 () Bool)

(declare-fun e!614144 () Bool)

(assert (=> b!1074733 (= e!614144 (not e!614143))))

(declare-fun res!716578 () Bool)

(assert (=> b!1074733 (=> res!716578 e!614143)))

(assert (=> b!1074733 (= res!716578 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!476844 () ListLongMap!14591)

(assert (=> b!1074733 (= lt!476843 lt!476844)))

(declare-datatypes ((Unit!35387 0))(
  ( (Unit!35388) )
))
(declare-fun lt!476847 () Unit!35387)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!890 (array!68959 array!68957 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39795 V!39795 V!39795 V!39795 (_ BitVec 32) Int) Unit!35387)

(assert (=> b!1074733 (= lt!476847 (lemmaNoChangeToArrayThenSameMapNoExtras!890 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3874 (array!68959 array!68957 (_ BitVec 32) (_ BitVec 32) V!39795 V!39795 (_ BitVec 32) Int) ListLongMap!14591)

(assert (=> b!1074733 (= lt!476844 (getCurrentListMapNoExtraKeys!3874 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1074733 (= lt!476843 (getCurrentListMapNoExtraKeys!3874 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074734 () Bool)

(assert (=> b!1074734 (= e!614145 (= lt!476846 lt!476844))))

(declare-fun b!1074736 () Bool)

(declare-fun res!716582 () Bool)

(assert (=> b!1074736 (=> (not res!716582) (not e!614144))))

(declare-datatypes ((List!23159 0))(
  ( (Nil!23156) (Cons!23155 (h!24364 (_ BitVec 64)) (t!32506 List!23159)) )
))
(declare-fun arrayNoDuplicates!0 (array!68959 (_ BitVec 32) List!23159) Bool)

(assert (=> b!1074736 (= res!716582 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23156))))

(declare-fun b!1074737 () Bool)

(declare-fun e!614142 () Bool)

(assert (=> b!1074737 (= e!614142 tp_is_empty!25995)))

(declare-fun b!1074738 () Bool)

(declare-fun res!716583 () Bool)

(assert (=> b!1074738 (=> (not res!716583) (not e!614144))))

(assert (=> b!1074738 (= res!716583 (and (= (size!33703 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33704 _keys!1163) (size!33703 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1074739 () Bool)

(declare-fun res!716579 () Bool)

(assert (=> b!1074739 (=> (not res!716579) (not e!614144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68959 (_ BitVec 32)) Bool)

(assert (=> b!1074739 (= res!716579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1074735 () Bool)

(declare-fun e!614146 () Bool)

(assert (=> b!1074735 (= e!614146 (and e!614142 mapRes!40720))))

(declare-fun condMapEmpty!40720 () Bool)

(declare-fun mapDefault!40720 () ValueCell!12294)

(assert (=> b!1074735 (= condMapEmpty!40720 (= (arr!33167 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12294)) mapDefault!40720)))))

(declare-fun res!716581 () Bool)

(assert (=> start!95068 (=> (not res!716581) (not e!614144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95068 (= res!716581 (validMask!0 mask!1515))))

(assert (=> start!95068 e!614144))

(assert (=> start!95068 true))

(assert (=> start!95068 tp_is_empty!25995))

(declare-fun array_inv!25634 (array!68957) Bool)

(assert (=> start!95068 (and (array_inv!25634 _values!955) e!614146)))

(assert (=> start!95068 tp!78034))

(declare-fun array_inv!25635 (array!68959) Bool)

(assert (=> start!95068 (array_inv!25635 _keys!1163)))

(assert (= (and start!95068 res!716581) b!1074738))

(assert (= (and b!1074738 res!716583) b!1074739))

(assert (= (and b!1074739 res!716579) b!1074736))

(assert (= (and b!1074736 res!716582) b!1074733))

(assert (= (and b!1074733 (not res!716578)) b!1074731))

(assert (= (and b!1074731 res!716580) b!1074734))

(assert (= (and b!1074735 condMapEmpty!40720) mapIsEmpty!40720))

(assert (= (and b!1074735 (not condMapEmpty!40720)) mapNonEmpty!40720))

(get-info :version)

(assert (= (and mapNonEmpty!40720 ((_ is ValueCellFull!12294) mapValue!40720)) b!1074732))

(assert (= (and b!1074735 ((_ is ValueCellFull!12294) mapDefault!40720)) b!1074737))

(assert (= start!95068 b!1074735))

(declare-fun m!993575 () Bool)

(assert (=> start!95068 m!993575))

(declare-fun m!993577 () Bool)

(assert (=> start!95068 m!993577))

(declare-fun m!993579 () Bool)

(assert (=> start!95068 m!993579))

(declare-fun m!993581 () Bool)

(assert (=> b!1074739 m!993581))

(declare-fun m!993583 () Bool)

(assert (=> b!1074736 m!993583))

(declare-fun m!993585 () Bool)

(assert (=> b!1074733 m!993585))

(declare-fun m!993587 () Bool)

(assert (=> b!1074733 m!993587))

(declare-fun m!993589 () Bool)

(assert (=> b!1074733 m!993589))

(declare-fun m!993591 () Bool)

(assert (=> mapNonEmpty!40720 m!993591))

(declare-fun m!993593 () Bool)

(assert (=> b!1074731 m!993593))

(declare-fun m!993595 () Bool)

(assert (=> b!1074731 m!993595))

(declare-fun m!993597 () Bool)

(assert (=> b!1074731 m!993597))

(declare-fun m!993599 () Bool)

(assert (=> b!1074731 m!993599))

(check-sat (not b!1074731) b_and!35093 (not b!1074733) tp_is_empty!25995 (not mapNonEmpty!40720) (not b!1074736) (not b_next!22185) (not b!1074739) (not start!95068))
(check-sat b_and!35093 (not b_next!22185))
(get-model)

(declare-fun b!1074777 () Bool)

(declare-fun e!614179 () Bool)

(declare-fun e!614178 () Bool)

(assert (=> b!1074777 (= e!614179 e!614178)))

(declare-fun c!107950 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1074777 (= c!107950 (validKeyInArray!0 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45432 () Bool)

(declare-fun call!45435 () Bool)

(assert (=> bm!45432 (= call!45435 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107950 (Cons!23155 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000) Nil!23156) Nil!23156)))))

(declare-fun d!129537 () Bool)

(declare-fun res!716610 () Bool)

(declare-fun e!614177 () Bool)

(assert (=> d!129537 (=> res!716610 e!614177)))

(assert (=> d!129537 (= res!716610 (bvsge #b00000000000000000000000000000000 (size!33704 _keys!1163)))))

(assert (=> d!129537 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23156) e!614177)))

(declare-fun b!1074778 () Bool)

(assert (=> b!1074778 (= e!614178 call!45435)))

(declare-fun b!1074779 () Bool)

(declare-fun e!614176 () Bool)

(declare-fun contains!6342 (List!23159 (_ BitVec 64)) Bool)

(assert (=> b!1074779 (= e!614176 (contains!6342 Nil!23156 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074780 () Bool)

(assert (=> b!1074780 (= e!614177 e!614179)))

(declare-fun res!716609 () Bool)

(assert (=> b!1074780 (=> (not res!716609) (not e!614179))))

(assert (=> b!1074780 (= res!716609 (not e!614176))))

(declare-fun res!716608 () Bool)

(assert (=> b!1074780 (=> (not res!716608) (not e!614176))))

(assert (=> b!1074780 (= res!716608 (validKeyInArray!0 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074781 () Bool)

(assert (=> b!1074781 (= e!614178 call!45435)))

(assert (= (and d!129537 (not res!716610)) b!1074780))

(assert (= (and b!1074780 res!716608) b!1074779))

(assert (= (and b!1074780 res!716609) b!1074777))

(assert (= (and b!1074777 c!107950) b!1074781))

(assert (= (and b!1074777 (not c!107950)) b!1074778))

(assert (= (or b!1074781 b!1074778) bm!45432))

(declare-fun m!993627 () Bool)

(assert (=> b!1074777 m!993627))

(assert (=> b!1074777 m!993627))

(declare-fun m!993629 () Bool)

(assert (=> b!1074777 m!993629))

(assert (=> bm!45432 m!993627))

(declare-fun m!993631 () Bool)

(assert (=> bm!45432 m!993631))

(assert (=> b!1074779 m!993627))

(assert (=> b!1074779 m!993627))

(declare-fun m!993633 () Bool)

(assert (=> b!1074779 m!993633))

(assert (=> b!1074780 m!993627))

(assert (=> b!1074780 m!993627))

(assert (=> b!1074780 m!993629))

(assert (=> b!1074736 d!129537))

(declare-fun d!129539 () Bool)

(assert (=> d!129539 (= (getCurrentListMapNoExtraKeys!3874 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3874 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476865 () Unit!35387)

(declare-fun choose!1752 (array!68959 array!68957 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39795 V!39795 V!39795 V!39795 (_ BitVec 32) Int) Unit!35387)

(assert (=> d!129539 (= lt!476865 (choose!1752 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129539 (validMask!0 mask!1515)))

(assert (=> d!129539 (= (lemmaNoChangeToArrayThenSameMapNoExtras!890 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476865)))

(declare-fun bs!31669 () Bool)

(assert (= bs!31669 d!129539))

(assert (=> bs!31669 m!993589))

(assert (=> bs!31669 m!993587))

(declare-fun m!993635 () Bool)

(assert (=> bs!31669 m!993635))

(assert (=> bs!31669 m!993575))

(assert (=> b!1074733 d!129539))

(declare-fun b!1074806 () Bool)

(declare-fun e!614198 () Bool)

(declare-fun lt!476885 () ListLongMap!14591)

(declare-fun isEmpty!955 (ListLongMap!14591) Bool)

(assert (=> b!1074806 (= e!614198 (isEmpty!955 lt!476885))))

(declare-fun call!45438 () ListLongMap!14591)

(declare-fun bm!45435 () Bool)

(assert (=> bm!45435 (= call!45438 (getCurrentListMapNoExtraKeys!3874 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1074807 () Bool)

(assert (=> b!1074807 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33704 _keys!1163)))))

(assert (=> b!1074807 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33703 _values!955)))))

(declare-fun e!614194 () Bool)

(declare-fun apply!937 (ListLongMap!14591 (_ BitVec 64)) V!39795)

(declare-fun get!17227 (ValueCell!12294 V!39795) V!39795)

(declare-fun dynLambda!2044 (Int (_ BitVec 64)) V!39795)

(assert (=> b!1074807 (= e!614194 (= (apply!937 lt!476885 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000)) (get!17227 (select (arr!33167 _values!955) #b00000000000000000000000000000000) (dynLambda!2044 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!129541 () Bool)

(declare-fun e!614196 () Bool)

(assert (=> d!129541 e!614196))

(declare-fun res!716619 () Bool)

(assert (=> d!129541 (=> (not res!716619) (not e!614196))))

(assert (=> d!129541 (= res!716619 (not (contains!6341 lt!476885 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!614199 () ListLongMap!14591)

(assert (=> d!129541 (= lt!476885 e!614199)))

(declare-fun c!107960 () Bool)

(assert (=> d!129541 (= c!107960 (bvsge #b00000000000000000000000000000000 (size!33704 _keys!1163)))))

(assert (=> d!129541 (validMask!0 mask!1515)))

(assert (=> d!129541 (= (getCurrentListMapNoExtraKeys!3874 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476885)))

(declare-fun b!1074808 () Bool)

(declare-fun e!614195 () Bool)

(assert (=> b!1074808 (= e!614195 (validKeyInArray!0 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074808 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1074809 () Bool)

(declare-fun e!614200 () Bool)

(assert (=> b!1074809 (= e!614200 e!614194)))

(assert (=> b!1074809 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33704 _keys!1163)))))

(declare-fun res!716622 () Bool)

(assert (=> b!1074809 (= res!716622 (contains!6341 lt!476885 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074809 (=> (not res!716622) (not e!614194))))

(declare-fun b!1074810 () Bool)

(assert (=> b!1074810 (= e!614200 e!614198)))

(declare-fun c!107962 () Bool)

(assert (=> b!1074810 (= c!107962 (bvslt #b00000000000000000000000000000000 (size!33704 _keys!1163)))))

(declare-fun b!1074811 () Bool)

(assert (=> b!1074811 (= e!614199 (ListLongMap!14592 Nil!23155))))

(declare-fun b!1074812 () Bool)

(declare-fun e!614197 () ListLongMap!14591)

(assert (=> b!1074812 (= e!614199 e!614197)))

(declare-fun c!107959 () Bool)

(assert (=> b!1074812 (= c!107959 (validKeyInArray!0 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074813 () Bool)

(declare-fun lt!476886 () Unit!35387)

(declare-fun lt!476883 () Unit!35387)

(assert (=> b!1074813 (= lt!476886 lt!476883)))

(declare-fun lt!476882 () ListLongMap!14591)

(declare-fun lt!476880 () (_ BitVec 64))

(declare-fun lt!476884 () (_ BitVec 64))

(declare-fun lt!476881 () V!39795)

(assert (=> b!1074813 (not (contains!6341 (+!3220 lt!476882 (tuple2!16623 lt!476884 lt!476881)) lt!476880))))

(declare-fun addStillNotContains!265 (ListLongMap!14591 (_ BitVec 64) V!39795 (_ BitVec 64)) Unit!35387)

(assert (=> b!1074813 (= lt!476883 (addStillNotContains!265 lt!476882 lt!476884 lt!476881 lt!476880))))

(assert (=> b!1074813 (= lt!476880 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1074813 (= lt!476881 (get!17227 (select (arr!33167 _values!955) #b00000000000000000000000000000000) (dynLambda!2044 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1074813 (= lt!476884 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074813 (= lt!476882 call!45438)))

(assert (=> b!1074813 (= e!614197 (+!3220 call!45438 (tuple2!16623 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000) (get!17227 (select (arr!33167 _values!955) #b00000000000000000000000000000000) (dynLambda!2044 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1074814 () Bool)

(declare-fun res!716620 () Bool)

(assert (=> b!1074814 (=> (not res!716620) (not e!614196))))

(assert (=> b!1074814 (= res!716620 (not (contains!6341 lt!476885 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1074815 () Bool)

(assert (=> b!1074815 (= e!614197 call!45438)))

(declare-fun b!1074816 () Bool)

(assert (=> b!1074816 (= e!614198 (= lt!476885 (getCurrentListMapNoExtraKeys!3874 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1074817 () Bool)

(assert (=> b!1074817 (= e!614196 e!614200)))

(declare-fun c!107961 () Bool)

(assert (=> b!1074817 (= c!107961 e!614195)))

(declare-fun res!716621 () Bool)

(assert (=> b!1074817 (=> (not res!716621) (not e!614195))))

(assert (=> b!1074817 (= res!716621 (bvslt #b00000000000000000000000000000000 (size!33704 _keys!1163)))))

(assert (= (and d!129541 c!107960) b!1074811))

(assert (= (and d!129541 (not c!107960)) b!1074812))

(assert (= (and b!1074812 c!107959) b!1074813))

(assert (= (and b!1074812 (not c!107959)) b!1074815))

(assert (= (or b!1074813 b!1074815) bm!45435))

(assert (= (and d!129541 res!716619) b!1074814))

(assert (= (and b!1074814 res!716620) b!1074817))

(assert (= (and b!1074817 res!716621) b!1074808))

(assert (= (and b!1074817 c!107961) b!1074809))

(assert (= (and b!1074817 (not c!107961)) b!1074810))

(assert (= (and b!1074809 res!716622) b!1074807))

(assert (= (and b!1074810 c!107962) b!1074816))

(assert (= (and b!1074810 (not c!107962)) b!1074806))

(declare-fun b_lambda!16833 () Bool)

(assert (=> (not b_lambda!16833) (not b!1074807)))

(declare-fun t!32509 () Bool)

(declare-fun tb!7169 () Bool)

(assert (=> (and start!95068 (= defaultEntry!963 defaultEntry!963) t!32509) tb!7169))

(declare-fun result!14815 () Bool)

(assert (=> tb!7169 (= result!14815 tp_is_empty!25995)))

(assert (=> b!1074807 t!32509))

(declare-fun b_and!35097 () Bool)

(assert (= b_and!35093 (and (=> t!32509 result!14815) b_and!35097)))

(declare-fun b_lambda!16835 () Bool)

(assert (=> (not b_lambda!16835) (not b!1074813)))

(assert (=> b!1074813 t!32509))

(declare-fun b_and!35099 () Bool)

(assert (= b_and!35097 (and (=> t!32509 result!14815) b_and!35099)))

(assert (=> b!1074808 m!993627))

(assert (=> b!1074808 m!993627))

(assert (=> b!1074808 m!993629))

(declare-fun m!993637 () Bool)

(assert (=> b!1074806 m!993637))

(declare-fun m!993639 () Bool)

(assert (=> b!1074816 m!993639))

(declare-fun m!993641 () Bool)

(assert (=> b!1074814 m!993641))

(declare-fun m!993643 () Bool)

(assert (=> d!129541 m!993643))

(assert (=> d!129541 m!993575))

(declare-fun m!993645 () Bool)

(assert (=> b!1074813 m!993645))

(declare-fun m!993647 () Bool)

(assert (=> b!1074813 m!993647))

(declare-fun m!993649 () Bool)

(assert (=> b!1074813 m!993649))

(declare-fun m!993651 () Bool)

(assert (=> b!1074813 m!993651))

(assert (=> b!1074813 m!993627))

(declare-fun m!993653 () Bool)

(assert (=> b!1074813 m!993653))

(assert (=> b!1074813 m!993645))

(assert (=> b!1074813 m!993647))

(declare-fun m!993655 () Bool)

(assert (=> b!1074813 m!993655))

(declare-fun m!993657 () Bool)

(assert (=> b!1074813 m!993657))

(assert (=> b!1074813 m!993649))

(assert (=> b!1074809 m!993627))

(assert (=> b!1074809 m!993627))

(declare-fun m!993659 () Bool)

(assert (=> b!1074809 m!993659))

(assert (=> b!1074812 m!993627))

(assert (=> b!1074812 m!993627))

(assert (=> b!1074812 m!993629))

(assert (=> bm!45435 m!993639))

(assert (=> b!1074807 m!993645))

(assert (=> b!1074807 m!993627))

(assert (=> b!1074807 m!993645))

(assert (=> b!1074807 m!993647))

(assert (=> b!1074807 m!993655))

(assert (=> b!1074807 m!993647))

(assert (=> b!1074807 m!993627))

(declare-fun m!993661 () Bool)

(assert (=> b!1074807 m!993661))

(assert (=> b!1074733 d!129541))

(declare-fun b!1074820 () Bool)

(declare-fun e!614205 () Bool)

(declare-fun lt!476892 () ListLongMap!14591)

(assert (=> b!1074820 (= e!614205 (isEmpty!955 lt!476892))))

(declare-fun call!45439 () ListLongMap!14591)

(declare-fun bm!45436 () Bool)

(assert (=> bm!45436 (= call!45439 (getCurrentListMapNoExtraKeys!3874 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1074821 () Bool)

(assert (=> b!1074821 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33704 _keys!1163)))))

(assert (=> b!1074821 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33703 _values!955)))))

(declare-fun e!614201 () Bool)

(assert (=> b!1074821 (= e!614201 (= (apply!937 lt!476892 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000)) (get!17227 (select (arr!33167 _values!955) #b00000000000000000000000000000000) (dynLambda!2044 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!129543 () Bool)

(declare-fun e!614203 () Bool)

(assert (=> d!129543 e!614203))

(declare-fun res!716623 () Bool)

(assert (=> d!129543 (=> (not res!716623) (not e!614203))))

(assert (=> d!129543 (= res!716623 (not (contains!6341 lt!476892 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!614206 () ListLongMap!14591)

(assert (=> d!129543 (= lt!476892 e!614206)))

(declare-fun c!107964 () Bool)

(assert (=> d!129543 (= c!107964 (bvsge #b00000000000000000000000000000000 (size!33704 _keys!1163)))))

(assert (=> d!129543 (validMask!0 mask!1515)))

(assert (=> d!129543 (= (getCurrentListMapNoExtraKeys!3874 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476892)))

(declare-fun b!1074822 () Bool)

(declare-fun e!614202 () Bool)

(assert (=> b!1074822 (= e!614202 (validKeyInArray!0 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074822 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1074823 () Bool)

(declare-fun e!614207 () Bool)

(assert (=> b!1074823 (= e!614207 e!614201)))

(assert (=> b!1074823 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33704 _keys!1163)))))

(declare-fun res!716626 () Bool)

(assert (=> b!1074823 (= res!716626 (contains!6341 lt!476892 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074823 (=> (not res!716626) (not e!614201))))

(declare-fun b!1074824 () Bool)

(assert (=> b!1074824 (= e!614207 e!614205)))

(declare-fun c!107966 () Bool)

(assert (=> b!1074824 (= c!107966 (bvslt #b00000000000000000000000000000000 (size!33704 _keys!1163)))))

(declare-fun b!1074825 () Bool)

(assert (=> b!1074825 (= e!614206 (ListLongMap!14592 Nil!23155))))

(declare-fun b!1074826 () Bool)

(declare-fun e!614204 () ListLongMap!14591)

(assert (=> b!1074826 (= e!614206 e!614204)))

(declare-fun c!107963 () Bool)

(assert (=> b!1074826 (= c!107963 (validKeyInArray!0 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074827 () Bool)

(declare-fun lt!476893 () Unit!35387)

(declare-fun lt!476890 () Unit!35387)

(assert (=> b!1074827 (= lt!476893 lt!476890)))

(declare-fun lt!476891 () (_ BitVec 64))

(declare-fun lt!476888 () V!39795)

(declare-fun lt!476889 () ListLongMap!14591)

(declare-fun lt!476887 () (_ BitVec 64))

(assert (=> b!1074827 (not (contains!6341 (+!3220 lt!476889 (tuple2!16623 lt!476891 lt!476888)) lt!476887))))

(assert (=> b!1074827 (= lt!476890 (addStillNotContains!265 lt!476889 lt!476891 lt!476888 lt!476887))))

(assert (=> b!1074827 (= lt!476887 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1074827 (= lt!476888 (get!17227 (select (arr!33167 _values!955) #b00000000000000000000000000000000) (dynLambda!2044 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1074827 (= lt!476891 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074827 (= lt!476889 call!45439)))

(assert (=> b!1074827 (= e!614204 (+!3220 call!45439 (tuple2!16623 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000) (get!17227 (select (arr!33167 _values!955) #b00000000000000000000000000000000) (dynLambda!2044 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1074828 () Bool)

(declare-fun res!716624 () Bool)

(assert (=> b!1074828 (=> (not res!716624) (not e!614203))))

(assert (=> b!1074828 (= res!716624 (not (contains!6341 lt!476892 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1074829 () Bool)

(assert (=> b!1074829 (= e!614204 call!45439)))

(declare-fun b!1074830 () Bool)

(assert (=> b!1074830 (= e!614205 (= lt!476892 (getCurrentListMapNoExtraKeys!3874 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1074831 () Bool)

(assert (=> b!1074831 (= e!614203 e!614207)))

(declare-fun c!107965 () Bool)

(assert (=> b!1074831 (= c!107965 e!614202)))

(declare-fun res!716625 () Bool)

(assert (=> b!1074831 (=> (not res!716625) (not e!614202))))

(assert (=> b!1074831 (= res!716625 (bvslt #b00000000000000000000000000000000 (size!33704 _keys!1163)))))

(assert (= (and d!129543 c!107964) b!1074825))

(assert (= (and d!129543 (not c!107964)) b!1074826))

(assert (= (and b!1074826 c!107963) b!1074827))

(assert (= (and b!1074826 (not c!107963)) b!1074829))

(assert (= (or b!1074827 b!1074829) bm!45436))

(assert (= (and d!129543 res!716623) b!1074828))

(assert (= (and b!1074828 res!716624) b!1074831))

(assert (= (and b!1074831 res!716625) b!1074822))

(assert (= (and b!1074831 c!107965) b!1074823))

(assert (= (and b!1074831 (not c!107965)) b!1074824))

(assert (= (and b!1074823 res!716626) b!1074821))

(assert (= (and b!1074824 c!107966) b!1074830))

(assert (= (and b!1074824 (not c!107966)) b!1074820))

(declare-fun b_lambda!16837 () Bool)

(assert (=> (not b_lambda!16837) (not b!1074821)))

(assert (=> b!1074821 t!32509))

(declare-fun b_and!35101 () Bool)

(assert (= b_and!35099 (and (=> t!32509 result!14815) b_and!35101)))

(declare-fun b_lambda!16839 () Bool)

(assert (=> (not b_lambda!16839) (not b!1074827)))

(assert (=> b!1074827 t!32509))

(declare-fun b_and!35103 () Bool)

(assert (= b_and!35101 (and (=> t!32509 result!14815) b_and!35103)))

(assert (=> b!1074822 m!993627))

(assert (=> b!1074822 m!993627))

(assert (=> b!1074822 m!993629))

(declare-fun m!993663 () Bool)

(assert (=> b!1074820 m!993663))

(declare-fun m!993665 () Bool)

(assert (=> b!1074830 m!993665))

(declare-fun m!993667 () Bool)

(assert (=> b!1074828 m!993667))

(declare-fun m!993669 () Bool)

(assert (=> d!129543 m!993669))

(assert (=> d!129543 m!993575))

(assert (=> b!1074827 m!993645))

(assert (=> b!1074827 m!993647))

(declare-fun m!993671 () Bool)

(assert (=> b!1074827 m!993671))

(declare-fun m!993673 () Bool)

(assert (=> b!1074827 m!993673))

(assert (=> b!1074827 m!993627))

(declare-fun m!993675 () Bool)

(assert (=> b!1074827 m!993675))

(assert (=> b!1074827 m!993645))

(assert (=> b!1074827 m!993647))

(assert (=> b!1074827 m!993655))

(declare-fun m!993677 () Bool)

(assert (=> b!1074827 m!993677))

(assert (=> b!1074827 m!993671))

(assert (=> b!1074823 m!993627))

(assert (=> b!1074823 m!993627))

(declare-fun m!993679 () Bool)

(assert (=> b!1074823 m!993679))

(assert (=> b!1074826 m!993627))

(assert (=> b!1074826 m!993627))

(assert (=> b!1074826 m!993629))

(assert (=> bm!45436 m!993665))

(assert (=> b!1074821 m!993645))

(assert (=> b!1074821 m!993627))

(assert (=> b!1074821 m!993645))

(assert (=> b!1074821 m!993647))

(assert (=> b!1074821 m!993655))

(assert (=> b!1074821 m!993647))

(assert (=> b!1074821 m!993627))

(declare-fun m!993681 () Bool)

(assert (=> b!1074821 m!993681))

(assert (=> b!1074733 d!129543))

(declare-fun d!129545 () Bool)

(assert (=> d!129545 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95068 d!129545))

(declare-fun d!129547 () Bool)

(assert (=> d!129547 (= (array_inv!25634 _values!955) (bvsge (size!33703 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95068 d!129547))

(declare-fun d!129549 () Bool)

(assert (=> d!129549 (= (array_inv!25635 _keys!1163) (bvsge (size!33704 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95068 d!129549))

(declare-fun b!1074840 () Bool)

(declare-fun e!614214 () Bool)

(declare-fun e!614215 () Bool)

(assert (=> b!1074840 (= e!614214 e!614215)))

(declare-fun lt!476901 () (_ BitVec 64))

(assert (=> b!1074840 (= lt!476901 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476902 () Unit!35387)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68959 (_ BitVec 64) (_ BitVec 32)) Unit!35387)

(assert (=> b!1074840 (= lt!476902 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!476901 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1074840 (arrayContainsKey!0 _keys!1163 lt!476901 #b00000000000000000000000000000000)))

(declare-fun lt!476900 () Unit!35387)

(assert (=> b!1074840 (= lt!476900 lt!476902)))

(declare-fun res!716631 () Bool)

(declare-datatypes ((SeekEntryResult!9890 0))(
  ( (MissingZero!9890 (index!41931 (_ BitVec 32))) (Found!9890 (index!41932 (_ BitVec 32))) (Intermediate!9890 (undefined!10702 Bool) (index!41933 (_ BitVec 32)) (x!96326 (_ BitVec 32))) (Undefined!9890) (MissingVacant!9890 (index!41934 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68959 (_ BitVec 32)) SeekEntryResult!9890)

(assert (=> b!1074840 (= res!716631 (= (seekEntryOrOpen!0 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9890 #b00000000000000000000000000000000)))))

(assert (=> b!1074840 (=> (not res!716631) (not e!614215))))

(declare-fun d!129551 () Bool)

(declare-fun res!716632 () Bool)

(declare-fun e!614216 () Bool)

(assert (=> d!129551 (=> res!716632 e!614216)))

(assert (=> d!129551 (= res!716632 (bvsge #b00000000000000000000000000000000 (size!33704 _keys!1163)))))

(assert (=> d!129551 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!614216)))

(declare-fun b!1074841 () Bool)

(assert (=> b!1074841 (= e!614216 e!614214)))

(declare-fun c!107969 () Bool)

(assert (=> b!1074841 (= c!107969 (validKeyInArray!0 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074842 () Bool)

(declare-fun call!45442 () Bool)

(assert (=> b!1074842 (= e!614214 call!45442)))

(declare-fun b!1074843 () Bool)

(assert (=> b!1074843 (= e!614215 call!45442)))

(declare-fun bm!45439 () Bool)

(assert (=> bm!45439 (= call!45442 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(assert (= (and d!129551 (not res!716632)) b!1074841))

(assert (= (and b!1074841 c!107969) b!1074840))

(assert (= (and b!1074841 (not c!107969)) b!1074842))

(assert (= (and b!1074840 res!716631) b!1074843))

(assert (= (or b!1074843 b!1074842) bm!45439))

(assert (=> b!1074840 m!993627))

(declare-fun m!993683 () Bool)

(assert (=> b!1074840 m!993683))

(declare-fun m!993685 () Bool)

(assert (=> b!1074840 m!993685))

(assert (=> b!1074840 m!993627))

(declare-fun m!993687 () Bool)

(assert (=> b!1074840 m!993687))

(assert (=> b!1074841 m!993627))

(assert (=> b!1074841 m!993627))

(assert (=> b!1074841 m!993629))

(declare-fun m!993689 () Bool)

(assert (=> bm!45439 m!993689))

(assert (=> b!1074739 d!129551))

(declare-fun d!129553 () Bool)

(declare-fun e!614222 () Bool)

(assert (=> d!129553 e!614222))

(declare-fun res!716635 () Bool)

(assert (=> d!129553 (=> res!716635 e!614222)))

(declare-fun lt!476912 () Bool)

(assert (=> d!129553 (= res!716635 (not lt!476912))))

(declare-fun lt!476913 () Bool)

(assert (=> d!129553 (= lt!476912 lt!476913)))

(declare-fun lt!476914 () Unit!35387)

(declare-fun e!614221 () Unit!35387)

(assert (=> d!129553 (= lt!476914 e!614221)))

(declare-fun c!107972 () Bool)

(assert (=> d!129553 (= c!107972 lt!476913)))

(declare-fun containsKey!578 (List!23158 (_ BitVec 64)) Bool)

(assert (=> d!129553 (= lt!476913 (containsKey!578 (toList!7311 lt!476843) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129553 (= (contains!6341 lt!476843 #b0000000000000000000000000000000000000000000000000000000000000000) lt!476912)))

(declare-fun b!1074850 () Bool)

(declare-fun lt!476911 () Unit!35387)

(assert (=> b!1074850 (= e!614221 lt!476911)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!411 (List!23158 (_ BitVec 64)) Unit!35387)

(assert (=> b!1074850 (= lt!476911 (lemmaContainsKeyImpliesGetValueByKeyDefined!411 (toList!7311 lt!476843) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!660 0))(
  ( (Some!659 (v!15672 V!39795)) (None!658) )
))
(declare-fun isDefined!450 (Option!660) Bool)

(declare-fun getValueByKey!609 (List!23158 (_ BitVec 64)) Option!660)

(assert (=> b!1074850 (isDefined!450 (getValueByKey!609 (toList!7311 lt!476843) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1074851 () Bool)

(declare-fun Unit!35391 () Unit!35387)

(assert (=> b!1074851 (= e!614221 Unit!35391)))

(declare-fun b!1074852 () Bool)

(assert (=> b!1074852 (= e!614222 (isDefined!450 (getValueByKey!609 (toList!7311 lt!476843) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129553 c!107972) b!1074850))

(assert (= (and d!129553 (not c!107972)) b!1074851))

(assert (= (and d!129553 (not res!716635)) b!1074852))

(declare-fun m!993691 () Bool)

(assert (=> d!129553 m!993691))

(declare-fun m!993693 () Bool)

(assert (=> b!1074850 m!993693))

(declare-fun m!993695 () Bool)

(assert (=> b!1074850 m!993695))

(assert (=> b!1074850 m!993695))

(declare-fun m!993697 () Bool)

(assert (=> b!1074850 m!993697))

(assert (=> b!1074852 m!993695))

(assert (=> b!1074852 m!993695))

(assert (=> b!1074852 m!993697))

(assert (=> b!1074731 d!129553))

(declare-fun d!129555 () Bool)

(declare-fun e!614225 () Bool)

(assert (=> d!129555 e!614225))

(declare-fun res!716641 () Bool)

(assert (=> d!129555 (=> (not res!716641) (not e!614225))))

(declare-fun lt!476923 () ListLongMap!14591)

(assert (=> d!129555 (= res!716641 (contains!6341 lt!476923 (_1!8322 (tuple2!16623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!476925 () List!23158)

(assert (=> d!129555 (= lt!476923 (ListLongMap!14592 lt!476925))))

(declare-fun lt!476924 () Unit!35387)

(declare-fun lt!476926 () Unit!35387)

(assert (=> d!129555 (= lt!476924 lt!476926)))

(assert (=> d!129555 (= (getValueByKey!609 lt!476925 (_1!8322 (tuple2!16623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!659 (_2!8322 (tuple2!16623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lemmaContainsTupThenGetReturnValue!288 (List!23158 (_ BitVec 64) V!39795) Unit!35387)

(assert (=> d!129555 (= lt!476926 (lemmaContainsTupThenGetReturnValue!288 lt!476925 (_1!8322 (tuple2!16623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8322 (tuple2!16623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun insertStrictlySorted!381 (List!23158 (_ BitVec 64) V!39795) List!23158)

(assert (=> d!129555 (= lt!476925 (insertStrictlySorted!381 (toList!7311 lt!476843) (_1!8322 (tuple2!16623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8322 (tuple2!16623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!129555 (= (+!3220 lt!476843 (tuple2!16623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!476923)))

(declare-fun b!1074857 () Bool)

(declare-fun res!716640 () Bool)

(assert (=> b!1074857 (=> (not res!716640) (not e!614225))))

(assert (=> b!1074857 (= res!716640 (= (getValueByKey!609 (toList!7311 lt!476923) (_1!8322 (tuple2!16623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!659 (_2!8322 (tuple2!16623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))))

(declare-fun b!1074858 () Bool)

(declare-fun contains!6343 (List!23158 tuple2!16622) Bool)

(assert (=> b!1074858 (= e!614225 (contains!6343 (toList!7311 lt!476923) (tuple2!16623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(assert (= (and d!129555 res!716641) b!1074857))

(assert (= (and b!1074857 res!716640) b!1074858))

(declare-fun m!993699 () Bool)

(assert (=> d!129555 m!993699))

(declare-fun m!993701 () Bool)

(assert (=> d!129555 m!993701))

(declare-fun m!993703 () Bool)

(assert (=> d!129555 m!993703))

(declare-fun m!993705 () Bool)

(assert (=> d!129555 m!993705))

(declare-fun m!993707 () Bool)

(assert (=> b!1074857 m!993707))

(declare-fun m!993709 () Bool)

(assert (=> b!1074858 m!993709))

(assert (=> b!1074731 d!129555))

(declare-fun d!129557 () Bool)

(declare-fun e!614264 () Bool)

(assert (=> d!129557 e!614264))

(declare-fun res!716667 () Bool)

(assert (=> d!129557 (=> (not res!716667) (not e!614264))))

(assert (=> d!129557 (= res!716667 (or (bvsge #b00000000000000000000000000000000 (size!33704 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33704 _keys!1163)))))))

(declare-fun lt!476979 () ListLongMap!14591)

(declare-fun lt!476982 () ListLongMap!14591)

(assert (=> d!129557 (= lt!476979 lt!476982)))

(declare-fun lt!476989 () Unit!35387)

(declare-fun e!614260 () Unit!35387)

(assert (=> d!129557 (= lt!476989 e!614260)))

(declare-fun c!107986 () Bool)

(declare-fun e!614258 () Bool)

(assert (=> d!129557 (= c!107986 e!614258)))

(declare-fun res!716664 () Bool)

(assert (=> d!129557 (=> (not res!716664) (not e!614258))))

(assert (=> d!129557 (= res!716664 (bvslt #b00000000000000000000000000000000 (size!33704 _keys!1163)))))

(declare-fun e!614253 () ListLongMap!14591)

(assert (=> d!129557 (= lt!476982 e!614253)))

(declare-fun c!107990 () Bool)

(assert (=> d!129557 (= c!107990 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129557 (validMask!0 mask!1515)))

(assert (=> d!129557 (= (getCurrentListMap!4181 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476979)))

(declare-fun bm!45454 () Bool)

(declare-fun call!45462 () ListLongMap!14591)

(declare-fun call!45461 () ListLongMap!14591)

(assert (=> bm!45454 (= call!45462 call!45461)))

(declare-fun b!1074901 () Bool)

(declare-fun e!614255 () ListLongMap!14591)

(assert (=> b!1074901 (= e!614253 e!614255)))

(declare-fun c!107987 () Bool)

(assert (=> b!1074901 (= c!107987 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1074902 () Bool)

(declare-fun e!614261 () ListLongMap!14591)

(assert (=> b!1074902 (= e!614261 call!45462)))

(declare-fun b!1074903 () Bool)

(declare-fun e!614252 () Bool)

(assert (=> b!1074903 (= e!614252 (= (apply!937 lt!476979 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000)) (get!17227 (select (arr!33167 _values!955) #b00000000000000000000000000000000) (dynLambda!2044 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1074903 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33703 _values!955)))))

(assert (=> b!1074903 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33704 _keys!1163)))))

(declare-fun b!1074904 () Bool)

(assert (=> b!1074904 (= e!614258 (validKeyInArray!0 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074905 () Bool)

(declare-fun e!614262 () Bool)

(declare-fun e!614263 () Bool)

(assert (=> b!1074905 (= e!614262 e!614263)))

(declare-fun res!716665 () Bool)

(declare-fun call!45459 () Bool)

(assert (=> b!1074905 (= res!716665 call!45459)))

(assert (=> b!1074905 (=> (not res!716665) (not e!614263))))

(declare-fun b!1074906 () Bool)

(declare-fun res!716666 () Bool)

(assert (=> b!1074906 (=> (not res!716666) (not e!614264))))

(declare-fun e!614256 () Bool)

(assert (=> b!1074906 (= res!716666 e!614256)))

(declare-fun res!716668 () Bool)

(assert (=> b!1074906 (=> res!716668 e!614256)))

(declare-fun e!614259 () Bool)

(assert (=> b!1074906 (= res!716668 (not e!614259))))

(declare-fun res!716660 () Bool)

(assert (=> b!1074906 (=> (not res!716660) (not e!614259))))

(assert (=> b!1074906 (= res!716660 (bvslt #b00000000000000000000000000000000 (size!33704 _keys!1163)))))

(declare-fun b!1074907 () Bool)

(declare-fun call!45460 () ListLongMap!14591)

(assert (=> b!1074907 (= e!614261 call!45460)))

(declare-fun b!1074908 () Bool)

(declare-fun c!107988 () Bool)

(assert (=> b!1074908 (= c!107988 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1074908 (= e!614255 e!614261)))

(declare-fun b!1074909 () Bool)

(declare-fun lt!476978 () Unit!35387)

(assert (=> b!1074909 (= e!614260 lt!476978)))

(declare-fun lt!476988 () ListLongMap!14591)

(assert (=> b!1074909 (= lt!476988 (getCurrentListMapNoExtraKeys!3874 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476987 () (_ BitVec 64))

(assert (=> b!1074909 (= lt!476987 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476992 () (_ BitVec 64))

(assert (=> b!1074909 (= lt!476992 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476974 () Unit!35387)

(declare-fun addStillContains!650 (ListLongMap!14591 (_ BitVec 64) V!39795 (_ BitVec 64)) Unit!35387)

(assert (=> b!1074909 (= lt!476974 (addStillContains!650 lt!476988 lt!476987 zeroValueAfter!47 lt!476992))))

(assert (=> b!1074909 (contains!6341 (+!3220 lt!476988 (tuple2!16623 lt!476987 zeroValueAfter!47)) lt!476992)))

(declare-fun lt!476986 () Unit!35387)

(assert (=> b!1074909 (= lt!476986 lt!476974)))

(declare-fun lt!476991 () ListLongMap!14591)

(assert (=> b!1074909 (= lt!476991 (getCurrentListMapNoExtraKeys!3874 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476977 () (_ BitVec 64))

(assert (=> b!1074909 (= lt!476977 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476981 () (_ BitVec 64))

(assert (=> b!1074909 (= lt!476981 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476971 () Unit!35387)

(declare-fun addApplyDifferent!510 (ListLongMap!14591 (_ BitVec 64) V!39795 (_ BitVec 64)) Unit!35387)

(assert (=> b!1074909 (= lt!476971 (addApplyDifferent!510 lt!476991 lt!476977 minValue!907 lt!476981))))

(assert (=> b!1074909 (= (apply!937 (+!3220 lt!476991 (tuple2!16623 lt!476977 minValue!907)) lt!476981) (apply!937 lt!476991 lt!476981))))

(declare-fun lt!476984 () Unit!35387)

(assert (=> b!1074909 (= lt!476984 lt!476971)))

(declare-fun lt!476976 () ListLongMap!14591)

(assert (=> b!1074909 (= lt!476976 (getCurrentListMapNoExtraKeys!3874 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476983 () (_ BitVec 64))

(assert (=> b!1074909 (= lt!476983 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476980 () (_ BitVec 64))

(assert (=> b!1074909 (= lt!476980 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476973 () Unit!35387)

(assert (=> b!1074909 (= lt!476973 (addApplyDifferent!510 lt!476976 lt!476983 zeroValueAfter!47 lt!476980))))

(assert (=> b!1074909 (= (apply!937 (+!3220 lt!476976 (tuple2!16623 lt!476983 zeroValueAfter!47)) lt!476980) (apply!937 lt!476976 lt!476980))))

(declare-fun lt!476990 () Unit!35387)

(assert (=> b!1074909 (= lt!476990 lt!476973)))

(declare-fun lt!476972 () ListLongMap!14591)

(assert (=> b!1074909 (= lt!476972 (getCurrentListMapNoExtraKeys!3874 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476975 () (_ BitVec 64))

(assert (=> b!1074909 (= lt!476975 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476985 () (_ BitVec 64))

(assert (=> b!1074909 (= lt!476985 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074909 (= lt!476978 (addApplyDifferent!510 lt!476972 lt!476975 minValue!907 lt!476985))))

(assert (=> b!1074909 (= (apply!937 (+!3220 lt!476972 (tuple2!16623 lt!476975 minValue!907)) lt!476985) (apply!937 lt!476972 lt!476985))))

(declare-fun bm!45455 () Bool)

(declare-fun call!45463 () Bool)

(assert (=> bm!45455 (= call!45463 (contains!6341 lt!476979 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1074910 () Bool)

(declare-fun e!614254 () Bool)

(declare-fun e!614257 () Bool)

(assert (=> b!1074910 (= e!614254 e!614257)))

(declare-fun res!716661 () Bool)

(assert (=> b!1074910 (= res!716661 call!45463)))

(assert (=> b!1074910 (=> (not res!716661) (not e!614257))))

(declare-fun bm!45456 () Bool)

(declare-fun call!45458 () ListLongMap!14591)

(assert (=> bm!45456 (= call!45461 call!45458)))

(declare-fun call!45457 () ListLongMap!14591)

(declare-fun bm!45457 () Bool)

(assert (=> bm!45457 (= call!45457 (+!3220 (ite c!107990 call!45458 (ite c!107987 call!45461 call!45462)) (ite (or c!107990 c!107987) (tuple2!16623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1074911 () Bool)

(assert (=> b!1074911 (= e!614254 (not call!45463))))

(declare-fun b!1074912 () Bool)

(assert (=> b!1074912 (= e!614262 (not call!45459))))

(declare-fun b!1074913 () Bool)

(assert (=> b!1074913 (= e!614263 (= (apply!937 lt!476979 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1074914 () Bool)

(assert (=> b!1074914 (= e!614259 (validKeyInArray!0 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074915 () Bool)

(assert (=> b!1074915 (= e!614255 call!45460)))

(declare-fun b!1074916 () Bool)

(declare-fun Unit!35392 () Unit!35387)

(assert (=> b!1074916 (= e!614260 Unit!35392)))

(declare-fun b!1074917 () Bool)

(assert (=> b!1074917 (= e!614264 e!614262)))

(declare-fun c!107985 () Bool)

(assert (=> b!1074917 (= c!107985 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1074918 () Bool)

(assert (=> b!1074918 (= e!614257 (= (apply!937 lt!476979 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun bm!45458 () Bool)

(assert (=> bm!45458 (= call!45460 call!45457)))

(declare-fun b!1074919 () Bool)

(assert (=> b!1074919 (= e!614256 e!614252)))

(declare-fun res!716663 () Bool)

(assert (=> b!1074919 (=> (not res!716663) (not e!614252))))

(assert (=> b!1074919 (= res!716663 (contains!6341 lt!476979 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074919 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33704 _keys!1163)))))

(declare-fun bm!45459 () Bool)

(assert (=> bm!45459 (= call!45459 (contains!6341 lt!476979 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1074920 () Bool)

(assert (=> b!1074920 (= e!614253 (+!3220 call!45457 (tuple2!16623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1074921 () Bool)

(declare-fun res!716662 () Bool)

(assert (=> b!1074921 (=> (not res!716662) (not e!614264))))

(assert (=> b!1074921 (= res!716662 e!614254)))

(declare-fun c!107989 () Bool)

(assert (=> b!1074921 (= c!107989 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45460 () Bool)

(assert (=> bm!45460 (= call!45458 (getCurrentListMapNoExtraKeys!3874 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and d!129557 c!107990) b!1074920))

(assert (= (and d!129557 (not c!107990)) b!1074901))

(assert (= (and b!1074901 c!107987) b!1074915))

(assert (= (and b!1074901 (not c!107987)) b!1074908))

(assert (= (and b!1074908 c!107988) b!1074907))

(assert (= (and b!1074908 (not c!107988)) b!1074902))

(assert (= (or b!1074907 b!1074902) bm!45454))

(assert (= (or b!1074915 bm!45454) bm!45456))

(assert (= (or b!1074915 b!1074907) bm!45458))

(assert (= (or b!1074920 bm!45456) bm!45460))

(assert (= (or b!1074920 bm!45458) bm!45457))

(assert (= (and d!129557 res!716664) b!1074904))

(assert (= (and d!129557 c!107986) b!1074909))

(assert (= (and d!129557 (not c!107986)) b!1074916))

(assert (= (and d!129557 res!716667) b!1074906))

(assert (= (and b!1074906 res!716660) b!1074914))

(assert (= (and b!1074906 (not res!716668)) b!1074919))

(assert (= (and b!1074919 res!716663) b!1074903))

(assert (= (and b!1074906 res!716666) b!1074921))

(assert (= (and b!1074921 c!107989) b!1074910))

(assert (= (and b!1074921 (not c!107989)) b!1074911))

(assert (= (and b!1074910 res!716661) b!1074918))

(assert (= (or b!1074910 b!1074911) bm!45455))

(assert (= (and b!1074921 res!716662) b!1074917))

(assert (= (and b!1074917 c!107985) b!1074905))

(assert (= (and b!1074917 (not c!107985)) b!1074912))

(assert (= (and b!1074905 res!716665) b!1074913))

(assert (= (or b!1074905 b!1074912) bm!45459))

(declare-fun b_lambda!16841 () Bool)

(assert (=> (not b_lambda!16841) (not b!1074903)))

(assert (=> b!1074903 t!32509))

(declare-fun b_and!35105 () Bool)

(assert (= b_and!35103 (and (=> t!32509 result!14815) b_and!35105)))

(assert (=> b!1074914 m!993627))

(assert (=> b!1074914 m!993627))

(assert (=> b!1074914 m!993629))

(assert (=> bm!45460 m!993587))

(declare-fun m!993711 () Bool)

(assert (=> bm!45455 m!993711))

(declare-fun m!993713 () Bool)

(assert (=> bm!45457 m!993713))

(declare-fun m!993715 () Bool)

(assert (=> b!1074909 m!993715))

(declare-fun m!993717 () Bool)

(assert (=> b!1074909 m!993717))

(assert (=> b!1074909 m!993627))

(declare-fun m!993719 () Bool)

(assert (=> b!1074909 m!993719))

(declare-fun m!993721 () Bool)

(assert (=> b!1074909 m!993721))

(declare-fun m!993723 () Bool)

(assert (=> b!1074909 m!993723))

(assert (=> b!1074909 m!993723))

(declare-fun m!993725 () Bool)

(assert (=> b!1074909 m!993725))

(declare-fun m!993727 () Bool)

(assert (=> b!1074909 m!993727))

(declare-fun m!993729 () Bool)

(assert (=> b!1074909 m!993729))

(assert (=> b!1074909 m!993587))

(declare-fun m!993731 () Bool)

(assert (=> b!1074909 m!993731))

(declare-fun m!993733 () Bool)

(assert (=> b!1074909 m!993733))

(assert (=> b!1074909 m!993719))

(declare-fun m!993735 () Bool)

(assert (=> b!1074909 m!993735))

(assert (=> b!1074909 m!993717))

(declare-fun m!993737 () Bool)

(assert (=> b!1074909 m!993737))

(declare-fun m!993739 () Bool)

(assert (=> b!1074909 m!993739))

(declare-fun m!993741 () Bool)

(assert (=> b!1074909 m!993741))

(declare-fun m!993743 () Bool)

(assert (=> b!1074909 m!993743))

(assert (=> b!1074909 m!993741))

(declare-fun m!993745 () Bool)

(assert (=> b!1074918 m!993745))

(assert (=> b!1074904 m!993627))

(assert (=> b!1074904 m!993627))

(assert (=> b!1074904 m!993629))

(assert (=> b!1074903 m!993645))

(assert (=> b!1074903 m!993627))

(assert (=> b!1074903 m!993645))

(assert (=> b!1074903 m!993647))

(assert (=> b!1074903 m!993655))

(assert (=> b!1074903 m!993627))

(declare-fun m!993747 () Bool)

(assert (=> b!1074903 m!993747))

(assert (=> b!1074903 m!993647))

(declare-fun m!993749 () Bool)

(assert (=> b!1074913 m!993749))

(declare-fun m!993751 () Bool)

(assert (=> b!1074920 m!993751))

(declare-fun m!993753 () Bool)

(assert (=> bm!45459 m!993753))

(assert (=> b!1074919 m!993627))

(assert (=> b!1074919 m!993627))

(declare-fun m!993755 () Bool)

(assert (=> b!1074919 m!993755))

(assert (=> d!129557 m!993575))

(assert (=> b!1074731 d!129557))

(declare-fun d!129559 () Bool)

(declare-fun e!614277 () Bool)

(assert (=> d!129559 e!614277))

(declare-fun res!716676 () Bool)

(assert (=> d!129559 (=> (not res!716676) (not e!614277))))

(assert (=> d!129559 (= res!716676 (or (bvsge #b00000000000000000000000000000000 (size!33704 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33704 _keys!1163)))))))

(declare-fun lt!477001 () ListLongMap!14591)

(declare-fun lt!477004 () ListLongMap!14591)

(assert (=> d!129559 (= lt!477001 lt!477004)))

(declare-fun lt!477011 () Unit!35387)

(declare-fun e!614273 () Unit!35387)

(assert (=> d!129559 (= lt!477011 e!614273)))

(declare-fun c!107992 () Bool)

(declare-fun e!614271 () Bool)

(assert (=> d!129559 (= c!107992 e!614271)))

(declare-fun res!716673 () Bool)

(assert (=> d!129559 (=> (not res!716673) (not e!614271))))

(assert (=> d!129559 (= res!716673 (bvslt #b00000000000000000000000000000000 (size!33704 _keys!1163)))))

(declare-fun e!614266 () ListLongMap!14591)

(assert (=> d!129559 (= lt!477004 e!614266)))

(declare-fun c!107996 () Bool)

(assert (=> d!129559 (= c!107996 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129559 (validMask!0 mask!1515)))

(assert (=> d!129559 (= (getCurrentListMap!4181 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477001)))

(declare-fun bm!45461 () Bool)

(declare-fun call!45469 () ListLongMap!14591)

(declare-fun call!45468 () ListLongMap!14591)

(assert (=> bm!45461 (= call!45469 call!45468)))

(declare-fun b!1074922 () Bool)

(declare-fun e!614268 () ListLongMap!14591)

(assert (=> b!1074922 (= e!614266 e!614268)))

(declare-fun c!107993 () Bool)

(assert (=> b!1074922 (= c!107993 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1074923 () Bool)

(declare-fun e!614274 () ListLongMap!14591)

(assert (=> b!1074923 (= e!614274 call!45469)))

(declare-fun e!614265 () Bool)

(declare-fun b!1074924 () Bool)

(assert (=> b!1074924 (= e!614265 (= (apply!937 lt!477001 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000)) (get!17227 (select (arr!33167 _values!955) #b00000000000000000000000000000000) (dynLambda!2044 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1074924 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33703 _values!955)))))

(assert (=> b!1074924 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33704 _keys!1163)))))

(declare-fun b!1074925 () Bool)

(assert (=> b!1074925 (= e!614271 (validKeyInArray!0 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074926 () Bool)

(declare-fun e!614275 () Bool)

(declare-fun e!614276 () Bool)

(assert (=> b!1074926 (= e!614275 e!614276)))

(declare-fun res!716674 () Bool)

(declare-fun call!45466 () Bool)

(assert (=> b!1074926 (= res!716674 call!45466)))

(assert (=> b!1074926 (=> (not res!716674) (not e!614276))))

(declare-fun b!1074927 () Bool)

(declare-fun res!716675 () Bool)

(assert (=> b!1074927 (=> (not res!716675) (not e!614277))))

(declare-fun e!614269 () Bool)

(assert (=> b!1074927 (= res!716675 e!614269)))

(declare-fun res!716677 () Bool)

(assert (=> b!1074927 (=> res!716677 e!614269)))

(declare-fun e!614272 () Bool)

(assert (=> b!1074927 (= res!716677 (not e!614272))))

(declare-fun res!716669 () Bool)

(assert (=> b!1074927 (=> (not res!716669) (not e!614272))))

(assert (=> b!1074927 (= res!716669 (bvslt #b00000000000000000000000000000000 (size!33704 _keys!1163)))))

(declare-fun b!1074928 () Bool)

(declare-fun call!45467 () ListLongMap!14591)

(assert (=> b!1074928 (= e!614274 call!45467)))

(declare-fun b!1074929 () Bool)

(declare-fun c!107994 () Bool)

(assert (=> b!1074929 (= c!107994 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1074929 (= e!614268 e!614274)))

(declare-fun b!1074930 () Bool)

(declare-fun lt!477000 () Unit!35387)

(assert (=> b!1074930 (= e!614273 lt!477000)))

(declare-fun lt!477010 () ListLongMap!14591)

(assert (=> b!1074930 (= lt!477010 (getCurrentListMapNoExtraKeys!3874 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477009 () (_ BitVec 64))

(assert (=> b!1074930 (= lt!477009 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477014 () (_ BitVec 64))

(assert (=> b!1074930 (= lt!477014 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476996 () Unit!35387)

(assert (=> b!1074930 (= lt!476996 (addStillContains!650 lt!477010 lt!477009 zeroValueBefore!47 lt!477014))))

(assert (=> b!1074930 (contains!6341 (+!3220 lt!477010 (tuple2!16623 lt!477009 zeroValueBefore!47)) lt!477014)))

(declare-fun lt!477008 () Unit!35387)

(assert (=> b!1074930 (= lt!477008 lt!476996)))

(declare-fun lt!477013 () ListLongMap!14591)

(assert (=> b!1074930 (= lt!477013 (getCurrentListMapNoExtraKeys!3874 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476999 () (_ BitVec 64))

(assert (=> b!1074930 (= lt!476999 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477003 () (_ BitVec 64))

(assert (=> b!1074930 (= lt!477003 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476993 () Unit!35387)

(assert (=> b!1074930 (= lt!476993 (addApplyDifferent!510 lt!477013 lt!476999 minValue!907 lt!477003))))

(assert (=> b!1074930 (= (apply!937 (+!3220 lt!477013 (tuple2!16623 lt!476999 minValue!907)) lt!477003) (apply!937 lt!477013 lt!477003))))

(declare-fun lt!477006 () Unit!35387)

(assert (=> b!1074930 (= lt!477006 lt!476993)))

(declare-fun lt!476998 () ListLongMap!14591)

(assert (=> b!1074930 (= lt!476998 (getCurrentListMapNoExtraKeys!3874 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477005 () (_ BitVec 64))

(assert (=> b!1074930 (= lt!477005 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477002 () (_ BitVec 64))

(assert (=> b!1074930 (= lt!477002 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476995 () Unit!35387)

(assert (=> b!1074930 (= lt!476995 (addApplyDifferent!510 lt!476998 lt!477005 zeroValueBefore!47 lt!477002))))

(assert (=> b!1074930 (= (apply!937 (+!3220 lt!476998 (tuple2!16623 lt!477005 zeroValueBefore!47)) lt!477002) (apply!937 lt!476998 lt!477002))))

(declare-fun lt!477012 () Unit!35387)

(assert (=> b!1074930 (= lt!477012 lt!476995)))

(declare-fun lt!476994 () ListLongMap!14591)

(assert (=> b!1074930 (= lt!476994 (getCurrentListMapNoExtraKeys!3874 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476997 () (_ BitVec 64))

(assert (=> b!1074930 (= lt!476997 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477007 () (_ BitVec 64))

(assert (=> b!1074930 (= lt!477007 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074930 (= lt!477000 (addApplyDifferent!510 lt!476994 lt!476997 minValue!907 lt!477007))))

(assert (=> b!1074930 (= (apply!937 (+!3220 lt!476994 (tuple2!16623 lt!476997 minValue!907)) lt!477007) (apply!937 lt!476994 lt!477007))))

(declare-fun bm!45462 () Bool)

(declare-fun call!45470 () Bool)

(assert (=> bm!45462 (= call!45470 (contains!6341 lt!477001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1074931 () Bool)

(declare-fun e!614267 () Bool)

(declare-fun e!614270 () Bool)

(assert (=> b!1074931 (= e!614267 e!614270)))

(declare-fun res!716670 () Bool)

(assert (=> b!1074931 (= res!716670 call!45470)))

(assert (=> b!1074931 (=> (not res!716670) (not e!614270))))

(declare-fun bm!45463 () Bool)

(declare-fun call!45465 () ListLongMap!14591)

(assert (=> bm!45463 (= call!45468 call!45465)))

(declare-fun bm!45464 () Bool)

(declare-fun call!45464 () ListLongMap!14591)

(assert (=> bm!45464 (= call!45464 (+!3220 (ite c!107996 call!45465 (ite c!107993 call!45468 call!45469)) (ite (or c!107996 c!107993) (tuple2!16623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1074932 () Bool)

(assert (=> b!1074932 (= e!614267 (not call!45470))))

(declare-fun b!1074933 () Bool)

(assert (=> b!1074933 (= e!614275 (not call!45466))))

(declare-fun b!1074934 () Bool)

(assert (=> b!1074934 (= e!614276 (= (apply!937 lt!477001 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1074935 () Bool)

(assert (=> b!1074935 (= e!614272 (validKeyInArray!0 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074936 () Bool)

(assert (=> b!1074936 (= e!614268 call!45467)))

(declare-fun b!1074937 () Bool)

(declare-fun Unit!35393 () Unit!35387)

(assert (=> b!1074937 (= e!614273 Unit!35393)))

(declare-fun b!1074938 () Bool)

(assert (=> b!1074938 (= e!614277 e!614275)))

(declare-fun c!107991 () Bool)

(assert (=> b!1074938 (= c!107991 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1074939 () Bool)

(assert (=> b!1074939 (= e!614270 (= (apply!937 lt!477001 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun bm!45465 () Bool)

(assert (=> bm!45465 (= call!45467 call!45464)))

(declare-fun b!1074940 () Bool)

(assert (=> b!1074940 (= e!614269 e!614265)))

(declare-fun res!716672 () Bool)

(assert (=> b!1074940 (=> (not res!716672) (not e!614265))))

(assert (=> b!1074940 (= res!716672 (contains!6341 lt!477001 (select (arr!33168 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074940 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33704 _keys!1163)))))

(declare-fun bm!45466 () Bool)

(assert (=> bm!45466 (= call!45466 (contains!6341 lt!477001 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1074941 () Bool)

(assert (=> b!1074941 (= e!614266 (+!3220 call!45464 (tuple2!16623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1074942 () Bool)

(declare-fun res!716671 () Bool)

(assert (=> b!1074942 (=> (not res!716671) (not e!614277))))

(assert (=> b!1074942 (= res!716671 e!614267)))

(declare-fun c!107995 () Bool)

(assert (=> b!1074942 (= c!107995 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45467 () Bool)

(assert (=> bm!45467 (= call!45465 (getCurrentListMapNoExtraKeys!3874 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and d!129559 c!107996) b!1074941))

(assert (= (and d!129559 (not c!107996)) b!1074922))

(assert (= (and b!1074922 c!107993) b!1074936))

(assert (= (and b!1074922 (not c!107993)) b!1074929))

(assert (= (and b!1074929 c!107994) b!1074928))

(assert (= (and b!1074929 (not c!107994)) b!1074923))

(assert (= (or b!1074928 b!1074923) bm!45461))

(assert (= (or b!1074936 bm!45461) bm!45463))

(assert (= (or b!1074936 b!1074928) bm!45465))

(assert (= (or b!1074941 bm!45463) bm!45467))

(assert (= (or b!1074941 bm!45465) bm!45464))

(assert (= (and d!129559 res!716673) b!1074925))

(assert (= (and d!129559 c!107992) b!1074930))

(assert (= (and d!129559 (not c!107992)) b!1074937))

(assert (= (and d!129559 res!716676) b!1074927))

(assert (= (and b!1074927 res!716669) b!1074935))

(assert (= (and b!1074927 (not res!716677)) b!1074940))

(assert (= (and b!1074940 res!716672) b!1074924))

(assert (= (and b!1074927 res!716675) b!1074942))

(assert (= (and b!1074942 c!107995) b!1074931))

(assert (= (and b!1074942 (not c!107995)) b!1074932))

(assert (= (and b!1074931 res!716670) b!1074939))

(assert (= (or b!1074931 b!1074932) bm!45462))

(assert (= (and b!1074942 res!716671) b!1074938))

(assert (= (and b!1074938 c!107991) b!1074926))

(assert (= (and b!1074938 (not c!107991)) b!1074933))

(assert (= (and b!1074926 res!716674) b!1074934))

(assert (= (or b!1074926 b!1074933) bm!45466))

(declare-fun b_lambda!16843 () Bool)

(assert (=> (not b_lambda!16843) (not b!1074924)))

(assert (=> b!1074924 t!32509))

(declare-fun b_and!35107 () Bool)

(assert (= b_and!35105 (and (=> t!32509 result!14815) b_and!35107)))

(assert (=> b!1074935 m!993627))

(assert (=> b!1074935 m!993627))

(assert (=> b!1074935 m!993629))

(assert (=> bm!45467 m!993589))

(declare-fun m!993757 () Bool)

(assert (=> bm!45462 m!993757))

(declare-fun m!993759 () Bool)

(assert (=> bm!45464 m!993759))

(declare-fun m!993761 () Bool)

(assert (=> b!1074930 m!993761))

(declare-fun m!993763 () Bool)

(assert (=> b!1074930 m!993763))

(assert (=> b!1074930 m!993627))

(declare-fun m!993765 () Bool)

(assert (=> b!1074930 m!993765))

(declare-fun m!993767 () Bool)

(assert (=> b!1074930 m!993767))

(declare-fun m!993769 () Bool)

(assert (=> b!1074930 m!993769))

(assert (=> b!1074930 m!993769))

(declare-fun m!993771 () Bool)

(assert (=> b!1074930 m!993771))

(declare-fun m!993773 () Bool)

(assert (=> b!1074930 m!993773))

(declare-fun m!993775 () Bool)

(assert (=> b!1074930 m!993775))

(assert (=> b!1074930 m!993589))

(declare-fun m!993777 () Bool)

(assert (=> b!1074930 m!993777))

(declare-fun m!993779 () Bool)

(assert (=> b!1074930 m!993779))

(assert (=> b!1074930 m!993765))

(declare-fun m!993781 () Bool)

(assert (=> b!1074930 m!993781))

(assert (=> b!1074930 m!993763))

(declare-fun m!993783 () Bool)

(assert (=> b!1074930 m!993783))

(declare-fun m!993785 () Bool)

(assert (=> b!1074930 m!993785))

(declare-fun m!993787 () Bool)

(assert (=> b!1074930 m!993787))

(declare-fun m!993789 () Bool)

(assert (=> b!1074930 m!993789))

(assert (=> b!1074930 m!993787))

(declare-fun m!993791 () Bool)

(assert (=> b!1074939 m!993791))

(assert (=> b!1074925 m!993627))

(assert (=> b!1074925 m!993627))

(assert (=> b!1074925 m!993629))

(assert (=> b!1074924 m!993645))

(assert (=> b!1074924 m!993627))

(assert (=> b!1074924 m!993645))

(assert (=> b!1074924 m!993647))

(assert (=> b!1074924 m!993655))

(assert (=> b!1074924 m!993627))

(declare-fun m!993793 () Bool)

(assert (=> b!1074924 m!993793))

(assert (=> b!1074924 m!993647))

(declare-fun m!993795 () Bool)

(assert (=> b!1074934 m!993795))

(declare-fun m!993797 () Bool)

(assert (=> b!1074941 m!993797))

(declare-fun m!993799 () Bool)

(assert (=> bm!45466 m!993799))

(assert (=> b!1074940 m!993627))

(assert (=> b!1074940 m!993627))

(declare-fun m!993801 () Bool)

(assert (=> b!1074940 m!993801))

(assert (=> d!129559 m!993575))

(assert (=> b!1074731 d!129559))

(declare-fun mapIsEmpty!40726 () Bool)

(declare-fun mapRes!40726 () Bool)

(assert (=> mapIsEmpty!40726 mapRes!40726))

(declare-fun mapNonEmpty!40726 () Bool)

(declare-fun tp!78044 () Bool)

(declare-fun e!614283 () Bool)

(assert (=> mapNonEmpty!40726 (= mapRes!40726 (and tp!78044 e!614283))))

(declare-fun mapKey!40726 () (_ BitVec 32))

(declare-fun mapRest!40726 () (Array (_ BitVec 32) ValueCell!12294))

(declare-fun mapValue!40726 () ValueCell!12294)

(assert (=> mapNonEmpty!40726 (= mapRest!40720 (store mapRest!40726 mapKey!40726 mapValue!40726))))

(declare-fun b!1074950 () Bool)

(declare-fun e!614282 () Bool)

(assert (=> b!1074950 (= e!614282 tp_is_empty!25995)))

(declare-fun b!1074949 () Bool)

(assert (=> b!1074949 (= e!614283 tp_is_empty!25995)))

(declare-fun condMapEmpty!40726 () Bool)

(declare-fun mapDefault!40726 () ValueCell!12294)

(assert (=> mapNonEmpty!40720 (= condMapEmpty!40726 (= mapRest!40720 ((as const (Array (_ BitVec 32) ValueCell!12294)) mapDefault!40726)))))

(assert (=> mapNonEmpty!40720 (= tp!78035 (and e!614282 mapRes!40726))))

(assert (= (and mapNonEmpty!40720 condMapEmpty!40726) mapIsEmpty!40726))

(assert (= (and mapNonEmpty!40720 (not condMapEmpty!40726)) mapNonEmpty!40726))

(assert (= (and mapNonEmpty!40726 ((_ is ValueCellFull!12294) mapValue!40726)) b!1074949))

(assert (= (and mapNonEmpty!40720 ((_ is ValueCellFull!12294) mapDefault!40726)) b!1074950))

(declare-fun m!993803 () Bool)

(assert (=> mapNonEmpty!40726 m!993803))

(declare-fun b_lambda!16845 () Bool)

(assert (= b_lambda!16839 (or (and start!95068 b_free!22185) b_lambda!16845)))

(declare-fun b_lambda!16847 () Bool)

(assert (= b_lambda!16835 (or (and start!95068 b_free!22185) b_lambda!16847)))

(declare-fun b_lambda!16849 () Bool)

(assert (= b_lambda!16841 (or (and start!95068 b_free!22185) b_lambda!16849)))

(declare-fun b_lambda!16851 () Bool)

(assert (= b_lambda!16833 (or (and start!95068 b_free!22185) b_lambda!16851)))

(declare-fun b_lambda!16853 () Bool)

(assert (= b_lambda!16837 (or (and start!95068 b_free!22185) b_lambda!16853)))

(declare-fun b_lambda!16855 () Bool)

(assert (= b_lambda!16843 (or (and start!95068 b_free!22185) b_lambda!16855)))

(check-sat (not b!1074780) (not b!1074920) (not b!1074935) (not bm!45464) (not b!1074939) (not b!1074822) (not b!1074806) (not b_lambda!16845) (not b!1074779) (not b!1074918) (not d!129541) (not mapNonEmpty!40726) (not bm!45460) (not b_lambda!16855) (not b!1074813) (not b_lambda!16849) (not bm!45455) (not d!129555) (not b_lambda!16853) (not bm!45462) (not b!1074809) (not b!1074828) (not b!1074914) (not b_lambda!16847) (not b!1074826) (not b!1074919) (not b!1074852) (not d!129557) (not b!1074812) (not bm!45436) (not b!1074841) (not b!1074807) (not b!1074814) (not b!1074820) (not b!1074903) (not b!1074777) (not d!129559) (not d!129543) (not bm!45435) tp_is_empty!25995 (not bm!45459) (not b_lambda!16851) (not b!1074857) (not bm!45457) (not b!1074823) (not b!1074925) (not bm!45439) (not b!1074934) (not b!1074909) (not b_next!22185) (not b!1074816) (not b!1074941) b_and!35107 (not b!1074940) (not b!1074808) (not d!129553) (not b!1074821) (not bm!45466) (not d!129539) (not bm!45467) (not b!1074924) (not b!1074830) (not b!1074827) (not b!1074930) (not b!1074904) (not b!1074913) (not b!1074850) (not b!1074840) (not bm!45432) (not b!1074858))
(check-sat b_and!35107 (not b_next!22185))
