; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95020 () Bool)

(assert start!95020)

(declare-fun b_free!22173 () Bool)

(declare-fun b_next!22173 () Bool)

(assert (=> start!95020 (= b_free!22173 (not b_next!22173))))

(declare-fun tp!77993 () Bool)

(declare-fun b_and!35057 () Bool)

(assert (=> start!95020 (= tp!77993 b_and!35057)))

(declare-fun b!1074214 () Bool)

(declare-fun res!716323 () Bool)

(declare-fun e!613794 () Bool)

(assert (=> b!1074214 (=> (not res!716323) (not e!613794))))

(declare-datatypes ((array!68931 0))(
  ( (array!68932 (arr!33156 (Array (_ BitVec 32) (_ BitVec 64))) (size!33692 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68931)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68931 (_ BitVec 32)) Bool)

(assert (=> b!1074214 (= res!716323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1074215 () Bool)

(declare-fun e!613791 () Bool)

(declare-fun tp_is_empty!25983 () Bool)

(assert (=> b!1074215 (= e!613791 tp_is_empty!25983)))

(declare-fun b!1074216 () Bool)

(declare-fun res!716322 () Bool)

(assert (=> b!1074216 (=> (not res!716322) (not e!613794))))

(declare-datatypes ((List!23148 0))(
  ( (Nil!23145) (Cons!23144 (h!24353 (_ BitVec 64)) (t!32491 List!23148)) )
))
(declare-fun arrayNoDuplicates!0 (array!68931 (_ BitVec 32) List!23148) Bool)

(assert (=> b!1074216 (= res!716322 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23145))))

(declare-fun mapNonEmpty!40696 () Bool)

(declare-fun mapRes!40696 () Bool)

(declare-fun tp!77992 () Bool)

(assert (=> mapNonEmpty!40696 (= mapRes!40696 (and tp!77992 e!613791))))

(declare-datatypes ((V!39779 0))(
  ( (V!39780 (val!13042 Int)) )
))
(declare-datatypes ((ValueCell!12288 0))(
  ( (ValueCellFull!12288 (v!15662 V!39779)) (EmptyCell!12288) )
))
(declare-fun mapRest!40696 () (Array (_ BitVec 32) ValueCell!12288))

(declare-fun mapValue!40696 () ValueCell!12288)

(declare-datatypes ((array!68933 0))(
  ( (array!68934 (arr!33157 (Array (_ BitVec 32) ValueCell!12288)) (size!33693 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68933)

(declare-fun mapKey!40696 () (_ BitVec 32))

(assert (=> mapNonEmpty!40696 (= (arr!33157 _values!955) (store mapRest!40696 mapKey!40696 mapValue!40696))))

(declare-fun b!1074217 () Bool)

(declare-fun e!613789 () Bool)

(assert (=> b!1074217 (= e!613789 tp_is_empty!25983)))

(declare-fun b!1074218 () Bool)

(declare-fun e!613792 () Bool)

(assert (=> b!1074218 (= e!613792 (and e!613789 mapRes!40696))))

(declare-fun condMapEmpty!40696 () Bool)

(declare-fun mapDefault!40696 () ValueCell!12288)

(assert (=> b!1074218 (= condMapEmpty!40696 (= (arr!33157 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12288)) mapDefault!40696)))))

(declare-fun zeroValueBefore!47 () V!39779)

(declare-fun e!613790 () Bool)

(declare-datatypes ((tuple2!16612 0))(
  ( (tuple2!16613 (_1!8317 (_ BitVec 64)) (_2!8317 V!39779)) )
))
(declare-datatypes ((List!23149 0))(
  ( (Nil!23146) (Cons!23145 (h!24354 tuple2!16612) (t!32492 List!23149)) )
))
(declare-datatypes ((ListLongMap!14581 0))(
  ( (ListLongMap!14582 (toList!7306 List!23149)) )
))
(declare-fun lt!476497 () ListLongMap!14581)

(declare-fun defaultEntry!963 () Int)

(declare-fun b!1074219 () Bool)

(declare-fun minValue!907 () V!39779)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4176 (array!68931 array!68933 (_ BitVec 32) (_ BitVec 32) V!39779 V!39779 (_ BitVec 32) Int) ListLongMap!14581)

(declare-fun +!3215 (ListLongMap!14581 tuple2!16612) ListLongMap!14581)

(assert (=> b!1074219 (= e!613790 (= (getCurrentListMap!4176 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (+!3215 lt!476497 (tuple2!16613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!476496 () ListLongMap!14581)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!39779)

(assert (=> b!1074219 (= lt!476496 (getCurrentListMap!4176 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!716321 () Bool)

(assert (=> start!95020 (=> (not res!716321) (not e!613794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95020 (= res!716321 (validMask!0 mask!1515))))

(assert (=> start!95020 e!613794))

(assert (=> start!95020 true))

(assert (=> start!95020 tp_is_empty!25983))

(declare-fun array_inv!25624 (array!68933) Bool)

(assert (=> start!95020 (and (array_inv!25624 _values!955) e!613792)))

(assert (=> start!95020 tp!77993))

(declare-fun array_inv!25625 (array!68931) Bool)

(assert (=> start!95020 (array_inv!25625 _keys!1163)))

(declare-fun b!1074220 () Bool)

(assert (=> b!1074220 (= e!613794 (not e!613790))))

(declare-fun res!716319 () Bool)

(assert (=> b!1074220 (=> res!716319 e!613790)))

(assert (=> b!1074220 (= res!716319 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!476498 () ListLongMap!14581)

(assert (=> b!1074220 (= lt!476497 lt!476498)))

(declare-datatypes ((Unit!35373 0))(
  ( (Unit!35374) )
))
(declare-fun lt!476495 () Unit!35373)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!885 (array!68931 array!68933 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39779 V!39779 V!39779 V!39779 (_ BitVec 32) Int) Unit!35373)

(assert (=> b!1074220 (= lt!476495 (lemmaNoChangeToArrayThenSameMapNoExtras!885 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3869 (array!68931 array!68933 (_ BitVec 32) (_ BitVec 32) V!39779 V!39779 (_ BitVec 32) Int) ListLongMap!14581)

(assert (=> b!1074220 (= lt!476498 (getCurrentListMapNoExtraKeys!3869 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1074220 (= lt!476497 (getCurrentListMapNoExtraKeys!3869 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074221 () Bool)

(declare-fun res!716320 () Bool)

(assert (=> b!1074221 (=> (not res!716320) (not e!613794))))

(assert (=> b!1074221 (= res!716320 (and (= (size!33693 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33692 _keys!1163) (size!33693 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40696 () Bool)

(assert (=> mapIsEmpty!40696 mapRes!40696))

(assert (= (and start!95020 res!716321) b!1074221))

(assert (= (and b!1074221 res!716320) b!1074214))

(assert (= (and b!1074214 res!716323) b!1074216))

(assert (= (and b!1074216 res!716322) b!1074220))

(assert (= (and b!1074220 (not res!716319)) b!1074219))

(assert (= (and b!1074218 condMapEmpty!40696) mapIsEmpty!40696))

(assert (= (and b!1074218 (not condMapEmpty!40696)) mapNonEmpty!40696))

(get-info :version)

(assert (= (and mapNonEmpty!40696 ((_ is ValueCellFull!12288) mapValue!40696)) b!1074215))

(assert (= (and b!1074218 ((_ is ValueCellFull!12288) mapDefault!40696)) b!1074217))

(assert (= start!95020 b!1074218))

(declare-fun m!993089 () Bool)

(assert (=> b!1074220 m!993089))

(declare-fun m!993091 () Bool)

(assert (=> b!1074220 m!993091))

(declare-fun m!993093 () Bool)

(assert (=> b!1074220 m!993093))

(declare-fun m!993095 () Bool)

(assert (=> b!1074214 m!993095))

(declare-fun m!993097 () Bool)

(assert (=> b!1074219 m!993097))

(declare-fun m!993099 () Bool)

(assert (=> b!1074219 m!993099))

(declare-fun m!993101 () Bool)

(assert (=> b!1074219 m!993101))

(declare-fun m!993103 () Bool)

(assert (=> b!1074216 m!993103))

(declare-fun m!993105 () Bool)

(assert (=> mapNonEmpty!40696 m!993105))

(declare-fun m!993107 () Bool)

(assert (=> start!95020 m!993107))

(declare-fun m!993109 () Bool)

(assert (=> start!95020 m!993109))

(declare-fun m!993111 () Bool)

(assert (=> start!95020 m!993111))

(check-sat (not start!95020) tp_is_empty!25983 (not mapNonEmpty!40696) b_and!35057 (not b!1074216) (not b!1074220) (not b!1074214) (not b_next!22173) (not b!1074219))
(check-sat b_and!35057 (not b_next!22173))
(get-model)

(declare-fun b!1074254 () Bool)

(declare-fun e!613819 () Bool)

(declare-fun call!45359 () Bool)

(assert (=> b!1074254 (= e!613819 call!45359)))

(declare-fun b!1074255 () Bool)

(declare-fun e!613821 () Bool)

(assert (=> b!1074255 (= e!613819 e!613821)))

(declare-fun lt!476518 () (_ BitVec 64))

(assert (=> b!1074255 (= lt!476518 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476517 () Unit!35373)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68931 (_ BitVec 64) (_ BitVec 32)) Unit!35373)

(assert (=> b!1074255 (= lt!476517 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!476518 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1074255 (arrayContainsKey!0 _keys!1163 lt!476518 #b00000000000000000000000000000000)))

(declare-fun lt!476519 () Unit!35373)

(assert (=> b!1074255 (= lt!476519 lt!476517)))

(declare-fun res!716343 () Bool)

(declare-datatypes ((SeekEntryResult!9888 0))(
  ( (MissingZero!9888 (index!41923 (_ BitVec 32))) (Found!9888 (index!41924 (_ BitVec 32))) (Intermediate!9888 (undefined!10700 Bool) (index!41925 (_ BitVec 32)) (x!96286 (_ BitVec 32))) (Undefined!9888) (MissingVacant!9888 (index!41926 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68931 (_ BitVec 32)) SeekEntryResult!9888)

(assert (=> b!1074255 (= res!716343 (= (seekEntryOrOpen!0 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9888 #b00000000000000000000000000000000)))))

(assert (=> b!1074255 (=> (not res!716343) (not e!613821))))

(declare-fun b!1074256 () Bool)

(declare-fun e!613820 () Bool)

(assert (=> b!1074256 (= e!613820 e!613819)))

(declare-fun c!107858 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1074256 (= c!107858 (validKeyInArray!0 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45356 () Bool)

(assert (=> bm!45356 (= call!45359 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun d!129489 () Bool)

(declare-fun res!716344 () Bool)

(assert (=> d!129489 (=> res!716344 e!613820)))

(assert (=> d!129489 (= res!716344 (bvsge #b00000000000000000000000000000000 (size!33692 _keys!1163)))))

(assert (=> d!129489 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!613820)))

(declare-fun b!1074257 () Bool)

(assert (=> b!1074257 (= e!613821 call!45359)))

(assert (= (and d!129489 (not res!716344)) b!1074256))

(assert (= (and b!1074256 c!107858) b!1074255))

(assert (= (and b!1074256 (not c!107858)) b!1074254))

(assert (= (and b!1074255 res!716343) b!1074257))

(assert (= (or b!1074257 b!1074254) bm!45356))

(declare-fun m!993137 () Bool)

(assert (=> b!1074255 m!993137))

(declare-fun m!993139 () Bool)

(assert (=> b!1074255 m!993139))

(declare-fun m!993141 () Bool)

(assert (=> b!1074255 m!993141))

(assert (=> b!1074255 m!993137))

(declare-fun m!993143 () Bool)

(assert (=> b!1074255 m!993143))

(assert (=> b!1074256 m!993137))

(assert (=> b!1074256 m!993137))

(declare-fun m!993145 () Bool)

(assert (=> b!1074256 m!993145))

(declare-fun m!993147 () Bool)

(assert (=> bm!45356 m!993147))

(assert (=> b!1074214 d!129489))

(declare-fun b!1074300 () Bool)

(declare-fun res!716363 () Bool)

(declare-fun e!613857 () Bool)

(assert (=> b!1074300 (=> (not res!716363) (not e!613857))))

(declare-fun e!613859 () Bool)

(assert (=> b!1074300 (= res!716363 e!613859)))

(declare-fun res!716370 () Bool)

(assert (=> b!1074300 (=> res!716370 e!613859)))

(declare-fun e!613851 () Bool)

(assert (=> b!1074300 (= res!716370 (not e!613851))))

(declare-fun res!716367 () Bool)

(assert (=> b!1074300 (=> (not res!716367) (not e!613851))))

(assert (=> b!1074300 (= res!716367 (bvslt #b00000000000000000000000000000000 (size!33692 _keys!1163)))))

(declare-fun b!1074301 () Bool)

(declare-fun e!613855 () Unit!35373)

(declare-fun lt!476582 () Unit!35373)

(assert (=> b!1074301 (= e!613855 lt!476582)))

(declare-fun lt!476580 () ListLongMap!14581)

(assert (=> b!1074301 (= lt!476580 (getCurrentListMapNoExtraKeys!3869 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476567 () (_ BitVec 64))

(assert (=> b!1074301 (= lt!476567 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476574 () (_ BitVec 64))

(assert (=> b!1074301 (= lt!476574 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476571 () Unit!35373)

(declare-fun addStillContains!648 (ListLongMap!14581 (_ BitVec 64) V!39779 (_ BitVec 64)) Unit!35373)

(assert (=> b!1074301 (= lt!476571 (addStillContains!648 lt!476580 lt!476567 zeroValueBefore!47 lt!476574))))

(declare-fun contains!6335 (ListLongMap!14581 (_ BitVec 64)) Bool)

(assert (=> b!1074301 (contains!6335 (+!3215 lt!476580 (tuple2!16613 lt!476567 zeroValueBefore!47)) lt!476574)))

(declare-fun lt!476573 () Unit!35373)

(assert (=> b!1074301 (= lt!476573 lt!476571)))

(declare-fun lt!476578 () ListLongMap!14581)

(assert (=> b!1074301 (= lt!476578 (getCurrentListMapNoExtraKeys!3869 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476575 () (_ BitVec 64))

(assert (=> b!1074301 (= lt!476575 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476577 () (_ BitVec 64))

(assert (=> b!1074301 (= lt!476577 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476570 () Unit!35373)

(declare-fun addApplyDifferent!508 (ListLongMap!14581 (_ BitVec 64) V!39779 (_ BitVec 64)) Unit!35373)

(assert (=> b!1074301 (= lt!476570 (addApplyDifferent!508 lt!476578 lt!476575 minValue!907 lt!476577))))

(declare-fun apply!935 (ListLongMap!14581 (_ BitVec 64)) V!39779)

(assert (=> b!1074301 (= (apply!935 (+!3215 lt!476578 (tuple2!16613 lt!476575 minValue!907)) lt!476577) (apply!935 lt!476578 lt!476577))))

(declare-fun lt!476565 () Unit!35373)

(assert (=> b!1074301 (= lt!476565 lt!476570)))

(declare-fun lt!476585 () ListLongMap!14581)

(assert (=> b!1074301 (= lt!476585 (getCurrentListMapNoExtraKeys!3869 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476572 () (_ BitVec 64))

(assert (=> b!1074301 (= lt!476572 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476568 () (_ BitVec 64))

(assert (=> b!1074301 (= lt!476568 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476581 () Unit!35373)

(assert (=> b!1074301 (= lt!476581 (addApplyDifferent!508 lt!476585 lt!476572 zeroValueBefore!47 lt!476568))))

(assert (=> b!1074301 (= (apply!935 (+!3215 lt!476585 (tuple2!16613 lt!476572 zeroValueBefore!47)) lt!476568) (apply!935 lt!476585 lt!476568))))

(declare-fun lt!476583 () Unit!35373)

(assert (=> b!1074301 (= lt!476583 lt!476581)))

(declare-fun lt!476579 () ListLongMap!14581)

(assert (=> b!1074301 (= lt!476579 (getCurrentListMapNoExtraKeys!3869 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476566 () (_ BitVec 64))

(assert (=> b!1074301 (= lt!476566 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476569 () (_ BitVec 64))

(assert (=> b!1074301 (= lt!476569 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074301 (= lt!476582 (addApplyDifferent!508 lt!476579 lt!476566 minValue!907 lt!476569))))

(assert (=> b!1074301 (= (apply!935 (+!3215 lt!476579 (tuple2!16613 lt!476566 minValue!907)) lt!476569) (apply!935 lt!476579 lt!476569))))

(declare-fun bm!45371 () Bool)

(declare-fun call!45379 () ListLongMap!14581)

(declare-fun call!45376 () ListLongMap!14581)

(assert (=> bm!45371 (= call!45379 call!45376)))

(declare-fun b!1074302 () Bool)

(declare-fun res!716368 () Bool)

(assert (=> b!1074302 (=> (not res!716368) (not e!613857))))

(declare-fun e!613852 () Bool)

(assert (=> b!1074302 (= res!716368 e!613852)))

(declare-fun c!107872 () Bool)

(assert (=> b!1074302 (= c!107872 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1074303 () Bool)

(declare-fun call!45374 () Bool)

(assert (=> b!1074303 (= e!613852 (not call!45374))))

(declare-fun bm!45372 () Bool)

(declare-fun call!45378 () Bool)

(declare-fun lt!476584 () ListLongMap!14581)

(assert (=> bm!45372 (= call!45378 (contains!6335 lt!476584 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1074304 () Bool)

(declare-fun c!107874 () Bool)

(assert (=> b!1074304 (= c!107874 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!613849 () ListLongMap!14581)

(declare-fun e!613860 () ListLongMap!14581)

(assert (=> b!1074304 (= e!613849 e!613860)))

(declare-fun b!1074305 () Bool)

(declare-fun e!613858 () ListLongMap!14581)

(assert (=> b!1074305 (= e!613858 (+!3215 call!45376 (tuple2!16613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun bm!45373 () Bool)

(declare-fun call!45375 () ListLongMap!14581)

(assert (=> bm!45373 (= call!45375 (getCurrentListMapNoExtraKeys!3869 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074306 () Bool)

(assert (=> b!1074306 (= e!613860 call!45379)))

(declare-fun b!1074307 () Bool)

(assert (=> b!1074307 (= e!613849 call!45379)))

(declare-fun b!1074308 () Bool)

(assert (=> b!1074308 (= e!613858 e!613849)))

(declare-fun c!107876 () Bool)

(assert (=> b!1074308 (= c!107876 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!129491 () Bool)

(assert (=> d!129491 e!613857))

(declare-fun res!716371 () Bool)

(assert (=> d!129491 (=> (not res!716371) (not e!613857))))

(assert (=> d!129491 (= res!716371 (or (bvsge #b00000000000000000000000000000000 (size!33692 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33692 _keys!1163)))))))

(declare-fun lt!476564 () ListLongMap!14581)

(assert (=> d!129491 (= lt!476584 lt!476564)))

(declare-fun lt!476576 () Unit!35373)

(assert (=> d!129491 (= lt!476576 e!613855)))

(declare-fun c!107875 () Bool)

(declare-fun e!613853 () Bool)

(assert (=> d!129491 (= c!107875 e!613853)))

(declare-fun res!716364 () Bool)

(assert (=> d!129491 (=> (not res!716364) (not e!613853))))

(assert (=> d!129491 (= res!716364 (bvslt #b00000000000000000000000000000000 (size!33692 _keys!1163)))))

(assert (=> d!129491 (= lt!476564 e!613858)))

(declare-fun c!107871 () Bool)

(assert (=> d!129491 (= c!107871 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129491 (validMask!0 mask!1515)))

(assert (=> d!129491 (= (getCurrentListMap!4176 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476584)))

(declare-fun b!1074309 () Bool)

(declare-fun Unit!35377 () Unit!35373)

(assert (=> b!1074309 (= e!613855 Unit!35377)))

(declare-fun b!1074310 () Bool)

(declare-fun e!613856 () Bool)

(assert (=> b!1074310 (= e!613857 e!613856)))

(declare-fun c!107873 () Bool)

(assert (=> b!1074310 (= c!107873 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1074311 () Bool)

(assert (=> b!1074311 (= e!613851 (validKeyInArray!0 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45374 () Bool)

(assert (=> bm!45374 (= call!45374 (contains!6335 lt!476584 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!45377 () ListLongMap!14581)

(declare-fun bm!45375 () Bool)

(declare-fun call!45380 () ListLongMap!14581)

(assert (=> bm!45375 (= call!45376 (+!3215 (ite c!107871 call!45375 (ite c!107876 call!45380 call!45377)) (ite (or c!107871 c!107876) (tuple2!16613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1074312 () Bool)

(assert (=> b!1074312 (= e!613856 (not call!45378))))

(declare-fun e!613854 () Bool)

(declare-fun b!1074313 () Bool)

(declare-fun get!17221 (ValueCell!12288 V!39779) V!39779)

(declare-fun dynLambda!2042 (Int (_ BitVec 64)) V!39779)

(assert (=> b!1074313 (= e!613854 (= (apply!935 lt!476584 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)) (get!17221 (select (arr!33157 _values!955) #b00000000000000000000000000000000) (dynLambda!2042 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1074313 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33693 _values!955)))))

(assert (=> b!1074313 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33692 _keys!1163)))))

(declare-fun b!1074314 () Bool)

(assert (=> b!1074314 (= e!613860 call!45377)))

(declare-fun b!1074315 () Bool)

(declare-fun e!613850 () Bool)

(assert (=> b!1074315 (= e!613850 (= (apply!935 lt!476584 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1074316 () Bool)

(assert (=> b!1074316 (= e!613859 e!613854)))

(declare-fun res!716365 () Bool)

(assert (=> b!1074316 (=> (not res!716365) (not e!613854))))

(assert (=> b!1074316 (= res!716365 (contains!6335 lt!476584 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074316 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33692 _keys!1163)))))

(declare-fun b!1074317 () Bool)

(declare-fun e!613848 () Bool)

(assert (=> b!1074317 (= e!613848 (= (apply!935 lt!476584 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1074318 () Bool)

(assert (=> b!1074318 (= e!613856 e!613850)))

(declare-fun res!716366 () Bool)

(assert (=> b!1074318 (= res!716366 call!45378)))

(assert (=> b!1074318 (=> (not res!716366) (not e!613850))))

(declare-fun b!1074319 () Bool)

(assert (=> b!1074319 (= e!613852 e!613848)))

(declare-fun res!716369 () Bool)

(assert (=> b!1074319 (= res!716369 call!45374)))

(assert (=> b!1074319 (=> (not res!716369) (not e!613848))))

(declare-fun bm!45376 () Bool)

(assert (=> bm!45376 (= call!45380 call!45375)))

(declare-fun bm!45377 () Bool)

(assert (=> bm!45377 (= call!45377 call!45380)))

(declare-fun b!1074320 () Bool)

(assert (=> b!1074320 (= e!613853 (validKeyInArray!0 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129491 c!107871) b!1074305))

(assert (= (and d!129491 (not c!107871)) b!1074308))

(assert (= (and b!1074308 c!107876) b!1074307))

(assert (= (and b!1074308 (not c!107876)) b!1074304))

(assert (= (and b!1074304 c!107874) b!1074306))

(assert (= (and b!1074304 (not c!107874)) b!1074314))

(assert (= (or b!1074306 b!1074314) bm!45377))

(assert (= (or b!1074307 bm!45377) bm!45376))

(assert (= (or b!1074307 b!1074306) bm!45371))

(assert (= (or b!1074305 bm!45376) bm!45373))

(assert (= (or b!1074305 bm!45371) bm!45375))

(assert (= (and d!129491 res!716364) b!1074320))

(assert (= (and d!129491 c!107875) b!1074301))

(assert (= (and d!129491 (not c!107875)) b!1074309))

(assert (= (and d!129491 res!716371) b!1074300))

(assert (= (and b!1074300 res!716367) b!1074311))

(assert (= (and b!1074300 (not res!716370)) b!1074316))

(assert (= (and b!1074316 res!716365) b!1074313))

(assert (= (and b!1074300 res!716363) b!1074302))

(assert (= (and b!1074302 c!107872) b!1074319))

(assert (= (and b!1074302 (not c!107872)) b!1074303))

(assert (= (and b!1074319 res!716369) b!1074317))

(assert (= (or b!1074319 b!1074303) bm!45374))

(assert (= (and b!1074302 res!716368) b!1074310))

(assert (= (and b!1074310 c!107873) b!1074318))

(assert (= (and b!1074310 (not c!107873)) b!1074312))

(assert (= (and b!1074318 res!716366) b!1074315))

(assert (= (or b!1074318 b!1074312) bm!45372))

(declare-fun b_lambda!16785 () Bool)

(assert (=> (not b_lambda!16785) (not b!1074313)))

(declare-fun t!32496 () Bool)

(declare-fun tb!7165 () Bool)

(assert (=> (and start!95020 (= defaultEntry!963 defaultEntry!963) t!32496) tb!7165))

(declare-fun result!14803 () Bool)

(assert (=> tb!7165 (= result!14803 tp_is_empty!25983)))

(assert (=> b!1074313 t!32496))

(declare-fun b_and!35061 () Bool)

(assert (= b_and!35057 (and (=> t!32496 result!14803) b_and!35061)))

(declare-fun m!993149 () Bool)

(assert (=> bm!45372 m!993149))

(assert (=> b!1074320 m!993137))

(assert (=> b!1074320 m!993137))

(assert (=> b!1074320 m!993145))

(declare-fun m!993151 () Bool)

(assert (=> bm!45374 m!993151))

(declare-fun m!993153 () Bool)

(assert (=> b!1074313 m!993153))

(declare-fun m!993155 () Bool)

(assert (=> b!1074313 m!993155))

(declare-fun m!993157 () Bool)

(assert (=> b!1074313 m!993157))

(assert (=> b!1074313 m!993137))

(declare-fun m!993159 () Bool)

(assert (=> b!1074313 m!993159))

(assert (=> b!1074313 m!993155))

(assert (=> b!1074313 m!993137))

(assert (=> b!1074313 m!993153))

(assert (=> b!1074316 m!993137))

(assert (=> b!1074316 m!993137))

(declare-fun m!993161 () Bool)

(assert (=> b!1074316 m!993161))

(declare-fun m!993163 () Bool)

(assert (=> b!1074301 m!993163))

(declare-fun m!993165 () Bool)

(assert (=> b!1074301 m!993165))

(declare-fun m!993167 () Bool)

(assert (=> b!1074301 m!993167))

(declare-fun m!993169 () Bool)

(assert (=> b!1074301 m!993169))

(declare-fun m!993171 () Bool)

(assert (=> b!1074301 m!993171))

(declare-fun m!993173 () Bool)

(assert (=> b!1074301 m!993173))

(declare-fun m!993175 () Bool)

(assert (=> b!1074301 m!993175))

(declare-fun m!993177 () Bool)

(assert (=> b!1074301 m!993177))

(declare-fun m!993179 () Bool)

(assert (=> b!1074301 m!993179))

(declare-fun m!993181 () Bool)

(assert (=> b!1074301 m!993181))

(declare-fun m!993183 () Bool)

(assert (=> b!1074301 m!993183))

(assert (=> b!1074301 m!993093))

(assert (=> b!1074301 m!993137))

(declare-fun m!993185 () Bool)

(assert (=> b!1074301 m!993185))

(declare-fun m!993187 () Bool)

(assert (=> b!1074301 m!993187))

(declare-fun m!993189 () Bool)

(assert (=> b!1074301 m!993189))

(assert (=> b!1074301 m!993171))

(assert (=> b!1074301 m!993181))

(assert (=> b!1074301 m!993165))

(declare-fun m!993191 () Bool)

(assert (=> b!1074301 m!993191))

(assert (=> b!1074301 m!993177))

(declare-fun m!993193 () Bool)

(assert (=> bm!45375 m!993193))

(assert (=> d!129491 m!993107))

(declare-fun m!993195 () Bool)

(assert (=> b!1074315 m!993195))

(assert (=> b!1074311 m!993137))

(assert (=> b!1074311 m!993137))

(assert (=> b!1074311 m!993145))

(declare-fun m!993197 () Bool)

(assert (=> b!1074317 m!993197))

(declare-fun m!993199 () Bool)

(assert (=> b!1074305 m!993199))

(assert (=> bm!45373 m!993093))

(assert (=> b!1074219 d!129491))

(declare-fun d!129493 () Bool)

(declare-fun e!613863 () Bool)

(assert (=> d!129493 e!613863))

(declare-fun res!716376 () Bool)

(assert (=> d!129493 (=> (not res!716376) (not e!613863))))

(declare-fun lt!476595 () ListLongMap!14581)

(assert (=> d!129493 (= res!716376 (contains!6335 lt!476595 (_1!8317 (tuple2!16613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!476594 () List!23149)

(assert (=> d!129493 (= lt!476595 (ListLongMap!14582 lt!476594))))

(declare-fun lt!476596 () Unit!35373)

(declare-fun lt!476597 () Unit!35373)

(assert (=> d!129493 (= lt!476596 lt!476597)))

(declare-datatypes ((Option!658 0))(
  ( (Some!657 (v!15664 V!39779)) (None!656) )
))
(declare-fun getValueByKey!607 (List!23149 (_ BitVec 64)) Option!658)

(assert (=> d!129493 (= (getValueByKey!607 lt!476594 (_1!8317 (tuple2!16613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!657 (_2!8317 (tuple2!16613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lemmaContainsTupThenGetReturnValue!286 (List!23149 (_ BitVec 64) V!39779) Unit!35373)

(assert (=> d!129493 (= lt!476597 (lemmaContainsTupThenGetReturnValue!286 lt!476594 (_1!8317 (tuple2!16613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8317 (tuple2!16613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun insertStrictlySorted!379 (List!23149 (_ BitVec 64) V!39779) List!23149)

(assert (=> d!129493 (= lt!476594 (insertStrictlySorted!379 (toList!7306 lt!476497) (_1!8317 (tuple2!16613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8317 (tuple2!16613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!129493 (= (+!3215 lt!476497 (tuple2!16613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!476595)))

(declare-fun b!1074327 () Bool)

(declare-fun res!716377 () Bool)

(assert (=> b!1074327 (=> (not res!716377) (not e!613863))))

(assert (=> b!1074327 (= res!716377 (= (getValueByKey!607 (toList!7306 lt!476595) (_1!8317 (tuple2!16613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!657 (_2!8317 (tuple2!16613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))))

(declare-fun b!1074328 () Bool)

(declare-fun contains!6336 (List!23149 tuple2!16612) Bool)

(assert (=> b!1074328 (= e!613863 (contains!6336 (toList!7306 lt!476595) (tuple2!16613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(assert (= (and d!129493 res!716376) b!1074327))

(assert (= (and b!1074327 res!716377) b!1074328))

(declare-fun m!993201 () Bool)

(assert (=> d!129493 m!993201))

(declare-fun m!993203 () Bool)

(assert (=> d!129493 m!993203))

(declare-fun m!993205 () Bool)

(assert (=> d!129493 m!993205))

(declare-fun m!993207 () Bool)

(assert (=> d!129493 m!993207))

(declare-fun m!993209 () Bool)

(assert (=> b!1074327 m!993209))

(declare-fun m!993211 () Bool)

(assert (=> b!1074328 m!993211))

(assert (=> b!1074219 d!129493))

(declare-fun b!1074329 () Bool)

(declare-fun res!716378 () Bool)

(declare-fun e!613873 () Bool)

(assert (=> b!1074329 (=> (not res!716378) (not e!613873))))

(declare-fun e!613875 () Bool)

(assert (=> b!1074329 (= res!716378 e!613875)))

(declare-fun res!716385 () Bool)

(assert (=> b!1074329 (=> res!716385 e!613875)))

(declare-fun e!613867 () Bool)

(assert (=> b!1074329 (= res!716385 (not e!613867))))

(declare-fun res!716382 () Bool)

(assert (=> b!1074329 (=> (not res!716382) (not e!613867))))

(assert (=> b!1074329 (= res!716382 (bvslt #b00000000000000000000000000000000 (size!33692 _keys!1163)))))

(declare-fun b!1074330 () Bool)

(declare-fun e!613871 () Unit!35373)

(declare-fun lt!476616 () Unit!35373)

(assert (=> b!1074330 (= e!613871 lt!476616)))

(declare-fun lt!476614 () ListLongMap!14581)

(assert (=> b!1074330 (= lt!476614 (getCurrentListMapNoExtraKeys!3869 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476601 () (_ BitVec 64))

(assert (=> b!1074330 (= lt!476601 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476608 () (_ BitVec 64))

(assert (=> b!1074330 (= lt!476608 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476605 () Unit!35373)

(assert (=> b!1074330 (= lt!476605 (addStillContains!648 lt!476614 lt!476601 zeroValueAfter!47 lt!476608))))

(assert (=> b!1074330 (contains!6335 (+!3215 lt!476614 (tuple2!16613 lt!476601 zeroValueAfter!47)) lt!476608)))

(declare-fun lt!476607 () Unit!35373)

(assert (=> b!1074330 (= lt!476607 lt!476605)))

(declare-fun lt!476612 () ListLongMap!14581)

(assert (=> b!1074330 (= lt!476612 (getCurrentListMapNoExtraKeys!3869 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476609 () (_ BitVec 64))

(assert (=> b!1074330 (= lt!476609 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476611 () (_ BitVec 64))

(assert (=> b!1074330 (= lt!476611 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476604 () Unit!35373)

(assert (=> b!1074330 (= lt!476604 (addApplyDifferent!508 lt!476612 lt!476609 minValue!907 lt!476611))))

(assert (=> b!1074330 (= (apply!935 (+!3215 lt!476612 (tuple2!16613 lt!476609 minValue!907)) lt!476611) (apply!935 lt!476612 lt!476611))))

(declare-fun lt!476599 () Unit!35373)

(assert (=> b!1074330 (= lt!476599 lt!476604)))

(declare-fun lt!476619 () ListLongMap!14581)

(assert (=> b!1074330 (= lt!476619 (getCurrentListMapNoExtraKeys!3869 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476606 () (_ BitVec 64))

(assert (=> b!1074330 (= lt!476606 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476602 () (_ BitVec 64))

(assert (=> b!1074330 (= lt!476602 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476615 () Unit!35373)

(assert (=> b!1074330 (= lt!476615 (addApplyDifferent!508 lt!476619 lt!476606 zeroValueAfter!47 lt!476602))))

(assert (=> b!1074330 (= (apply!935 (+!3215 lt!476619 (tuple2!16613 lt!476606 zeroValueAfter!47)) lt!476602) (apply!935 lt!476619 lt!476602))))

(declare-fun lt!476617 () Unit!35373)

(assert (=> b!1074330 (= lt!476617 lt!476615)))

(declare-fun lt!476613 () ListLongMap!14581)

(assert (=> b!1074330 (= lt!476613 (getCurrentListMapNoExtraKeys!3869 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476600 () (_ BitVec 64))

(assert (=> b!1074330 (= lt!476600 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476603 () (_ BitVec 64))

(assert (=> b!1074330 (= lt!476603 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074330 (= lt!476616 (addApplyDifferent!508 lt!476613 lt!476600 minValue!907 lt!476603))))

(assert (=> b!1074330 (= (apply!935 (+!3215 lt!476613 (tuple2!16613 lt!476600 minValue!907)) lt!476603) (apply!935 lt!476613 lt!476603))))

(declare-fun bm!45378 () Bool)

(declare-fun call!45386 () ListLongMap!14581)

(declare-fun call!45383 () ListLongMap!14581)

(assert (=> bm!45378 (= call!45386 call!45383)))

(declare-fun b!1074331 () Bool)

(declare-fun res!716383 () Bool)

(assert (=> b!1074331 (=> (not res!716383) (not e!613873))))

(declare-fun e!613868 () Bool)

(assert (=> b!1074331 (= res!716383 e!613868)))

(declare-fun c!107878 () Bool)

(assert (=> b!1074331 (= c!107878 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1074332 () Bool)

(declare-fun call!45381 () Bool)

(assert (=> b!1074332 (= e!613868 (not call!45381))))

(declare-fun bm!45379 () Bool)

(declare-fun call!45385 () Bool)

(declare-fun lt!476618 () ListLongMap!14581)

(assert (=> bm!45379 (= call!45385 (contains!6335 lt!476618 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1074333 () Bool)

(declare-fun c!107880 () Bool)

(assert (=> b!1074333 (= c!107880 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!613865 () ListLongMap!14581)

(declare-fun e!613876 () ListLongMap!14581)

(assert (=> b!1074333 (= e!613865 e!613876)))

(declare-fun b!1074334 () Bool)

(declare-fun e!613874 () ListLongMap!14581)

(assert (=> b!1074334 (= e!613874 (+!3215 call!45383 (tuple2!16613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun call!45382 () ListLongMap!14581)

(declare-fun bm!45380 () Bool)

(assert (=> bm!45380 (= call!45382 (getCurrentListMapNoExtraKeys!3869 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074335 () Bool)

(assert (=> b!1074335 (= e!613876 call!45386)))

(declare-fun b!1074336 () Bool)

(assert (=> b!1074336 (= e!613865 call!45386)))

(declare-fun b!1074337 () Bool)

(assert (=> b!1074337 (= e!613874 e!613865)))

(declare-fun c!107882 () Bool)

(assert (=> b!1074337 (= c!107882 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!129495 () Bool)

(assert (=> d!129495 e!613873))

(declare-fun res!716386 () Bool)

(assert (=> d!129495 (=> (not res!716386) (not e!613873))))

(assert (=> d!129495 (= res!716386 (or (bvsge #b00000000000000000000000000000000 (size!33692 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33692 _keys!1163)))))))

(declare-fun lt!476598 () ListLongMap!14581)

(assert (=> d!129495 (= lt!476618 lt!476598)))

(declare-fun lt!476610 () Unit!35373)

(assert (=> d!129495 (= lt!476610 e!613871)))

(declare-fun c!107881 () Bool)

(declare-fun e!613869 () Bool)

(assert (=> d!129495 (= c!107881 e!613869)))

(declare-fun res!716379 () Bool)

(assert (=> d!129495 (=> (not res!716379) (not e!613869))))

(assert (=> d!129495 (= res!716379 (bvslt #b00000000000000000000000000000000 (size!33692 _keys!1163)))))

(assert (=> d!129495 (= lt!476598 e!613874)))

(declare-fun c!107877 () Bool)

(assert (=> d!129495 (= c!107877 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129495 (validMask!0 mask!1515)))

(assert (=> d!129495 (= (getCurrentListMap!4176 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476618)))

(declare-fun b!1074338 () Bool)

(declare-fun Unit!35378 () Unit!35373)

(assert (=> b!1074338 (= e!613871 Unit!35378)))

(declare-fun b!1074339 () Bool)

(declare-fun e!613872 () Bool)

(assert (=> b!1074339 (= e!613873 e!613872)))

(declare-fun c!107879 () Bool)

(assert (=> b!1074339 (= c!107879 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1074340 () Bool)

(assert (=> b!1074340 (= e!613867 (validKeyInArray!0 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45381 () Bool)

(assert (=> bm!45381 (= call!45381 (contains!6335 lt!476618 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45382 () Bool)

(declare-fun call!45387 () ListLongMap!14581)

(declare-fun call!45384 () ListLongMap!14581)

(assert (=> bm!45382 (= call!45383 (+!3215 (ite c!107877 call!45382 (ite c!107882 call!45387 call!45384)) (ite (or c!107877 c!107882) (tuple2!16613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1074341 () Bool)

(assert (=> b!1074341 (= e!613872 (not call!45385))))

(declare-fun b!1074342 () Bool)

(declare-fun e!613870 () Bool)

(assert (=> b!1074342 (= e!613870 (= (apply!935 lt!476618 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)) (get!17221 (select (arr!33157 _values!955) #b00000000000000000000000000000000) (dynLambda!2042 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1074342 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33693 _values!955)))))

(assert (=> b!1074342 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33692 _keys!1163)))))

(declare-fun b!1074343 () Bool)

(assert (=> b!1074343 (= e!613876 call!45384)))

(declare-fun b!1074344 () Bool)

(declare-fun e!613866 () Bool)

(assert (=> b!1074344 (= e!613866 (= (apply!935 lt!476618 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1074345 () Bool)

(assert (=> b!1074345 (= e!613875 e!613870)))

(declare-fun res!716380 () Bool)

(assert (=> b!1074345 (=> (not res!716380) (not e!613870))))

(assert (=> b!1074345 (= res!716380 (contains!6335 lt!476618 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074345 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33692 _keys!1163)))))

(declare-fun b!1074346 () Bool)

(declare-fun e!613864 () Bool)

(assert (=> b!1074346 (= e!613864 (= (apply!935 lt!476618 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun b!1074347 () Bool)

(assert (=> b!1074347 (= e!613872 e!613866)))

(declare-fun res!716381 () Bool)

(assert (=> b!1074347 (= res!716381 call!45385)))

(assert (=> b!1074347 (=> (not res!716381) (not e!613866))))

(declare-fun b!1074348 () Bool)

(assert (=> b!1074348 (= e!613868 e!613864)))

(declare-fun res!716384 () Bool)

(assert (=> b!1074348 (= res!716384 call!45381)))

(assert (=> b!1074348 (=> (not res!716384) (not e!613864))))

(declare-fun bm!45383 () Bool)

(assert (=> bm!45383 (= call!45387 call!45382)))

(declare-fun bm!45384 () Bool)

(assert (=> bm!45384 (= call!45384 call!45387)))

(declare-fun b!1074349 () Bool)

(assert (=> b!1074349 (= e!613869 (validKeyInArray!0 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129495 c!107877) b!1074334))

(assert (= (and d!129495 (not c!107877)) b!1074337))

(assert (= (and b!1074337 c!107882) b!1074336))

(assert (= (and b!1074337 (not c!107882)) b!1074333))

(assert (= (and b!1074333 c!107880) b!1074335))

(assert (= (and b!1074333 (not c!107880)) b!1074343))

(assert (= (or b!1074335 b!1074343) bm!45384))

(assert (= (or b!1074336 bm!45384) bm!45383))

(assert (= (or b!1074336 b!1074335) bm!45378))

(assert (= (or b!1074334 bm!45383) bm!45380))

(assert (= (or b!1074334 bm!45378) bm!45382))

(assert (= (and d!129495 res!716379) b!1074349))

(assert (= (and d!129495 c!107881) b!1074330))

(assert (= (and d!129495 (not c!107881)) b!1074338))

(assert (= (and d!129495 res!716386) b!1074329))

(assert (= (and b!1074329 res!716382) b!1074340))

(assert (= (and b!1074329 (not res!716385)) b!1074345))

(assert (= (and b!1074345 res!716380) b!1074342))

(assert (= (and b!1074329 res!716378) b!1074331))

(assert (= (and b!1074331 c!107878) b!1074348))

(assert (= (and b!1074331 (not c!107878)) b!1074332))

(assert (= (and b!1074348 res!716384) b!1074346))

(assert (= (or b!1074348 b!1074332) bm!45381))

(assert (= (and b!1074331 res!716383) b!1074339))

(assert (= (and b!1074339 c!107879) b!1074347))

(assert (= (and b!1074339 (not c!107879)) b!1074341))

(assert (= (and b!1074347 res!716381) b!1074344))

(assert (= (or b!1074347 b!1074341) bm!45379))

(declare-fun b_lambda!16787 () Bool)

(assert (=> (not b_lambda!16787) (not b!1074342)))

(assert (=> b!1074342 t!32496))

(declare-fun b_and!35063 () Bool)

(assert (= b_and!35061 (and (=> t!32496 result!14803) b_and!35063)))

(declare-fun m!993213 () Bool)

(assert (=> bm!45379 m!993213))

(assert (=> b!1074349 m!993137))

(assert (=> b!1074349 m!993137))

(assert (=> b!1074349 m!993145))

(declare-fun m!993215 () Bool)

(assert (=> bm!45381 m!993215))

(assert (=> b!1074342 m!993153))

(assert (=> b!1074342 m!993155))

(assert (=> b!1074342 m!993157))

(assert (=> b!1074342 m!993137))

(declare-fun m!993217 () Bool)

(assert (=> b!1074342 m!993217))

(assert (=> b!1074342 m!993155))

(assert (=> b!1074342 m!993137))

(assert (=> b!1074342 m!993153))

(assert (=> b!1074345 m!993137))

(assert (=> b!1074345 m!993137))

(declare-fun m!993219 () Bool)

(assert (=> b!1074345 m!993219))

(declare-fun m!993221 () Bool)

(assert (=> b!1074330 m!993221))

(declare-fun m!993223 () Bool)

(assert (=> b!1074330 m!993223))

(declare-fun m!993225 () Bool)

(assert (=> b!1074330 m!993225))

(declare-fun m!993227 () Bool)

(assert (=> b!1074330 m!993227))

(declare-fun m!993229 () Bool)

(assert (=> b!1074330 m!993229))

(declare-fun m!993231 () Bool)

(assert (=> b!1074330 m!993231))

(declare-fun m!993233 () Bool)

(assert (=> b!1074330 m!993233))

(declare-fun m!993235 () Bool)

(assert (=> b!1074330 m!993235))

(declare-fun m!993237 () Bool)

(assert (=> b!1074330 m!993237))

(declare-fun m!993239 () Bool)

(assert (=> b!1074330 m!993239))

(declare-fun m!993241 () Bool)

(assert (=> b!1074330 m!993241))

(assert (=> b!1074330 m!993091))

(assert (=> b!1074330 m!993137))

(declare-fun m!993243 () Bool)

(assert (=> b!1074330 m!993243))

(declare-fun m!993245 () Bool)

(assert (=> b!1074330 m!993245))

(declare-fun m!993247 () Bool)

(assert (=> b!1074330 m!993247))

(assert (=> b!1074330 m!993229))

(assert (=> b!1074330 m!993239))

(assert (=> b!1074330 m!993223))

(declare-fun m!993249 () Bool)

(assert (=> b!1074330 m!993249))

(assert (=> b!1074330 m!993235))

(declare-fun m!993251 () Bool)

(assert (=> bm!45382 m!993251))

(assert (=> d!129495 m!993107))

(declare-fun m!993253 () Bool)

(assert (=> b!1074344 m!993253))

(assert (=> b!1074340 m!993137))

(assert (=> b!1074340 m!993137))

(assert (=> b!1074340 m!993145))

(declare-fun m!993255 () Bool)

(assert (=> b!1074346 m!993255))

(declare-fun m!993257 () Bool)

(assert (=> b!1074334 m!993257))

(assert (=> bm!45380 m!993091))

(assert (=> b!1074219 d!129495))

(declare-fun d!129497 () Bool)

(assert (=> d!129497 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95020 d!129497))

(declare-fun d!129499 () Bool)

(assert (=> d!129499 (= (array_inv!25624 _values!955) (bvsge (size!33693 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95020 d!129499))

(declare-fun d!129501 () Bool)

(assert (=> d!129501 (= (array_inv!25625 _keys!1163) (bvsge (size!33692 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95020 d!129501))

(declare-fun d!129503 () Bool)

(assert (=> d!129503 (= (getCurrentListMapNoExtraKeys!3869 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3869 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476622 () Unit!35373)

(declare-fun choose!1750 (array!68931 array!68933 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39779 V!39779 V!39779 V!39779 (_ BitVec 32) Int) Unit!35373)

(assert (=> d!129503 (= lt!476622 (choose!1750 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129503 (validMask!0 mask!1515)))

(assert (=> d!129503 (= (lemmaNoChangeToArrayThenSameMapNoExtras!885 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476622)))

(declare-fun bs!31661 () Bool)

(assert (= bs!31661 d!129503))

(assert (=> bs!31661 m!993093))

(assert (=> bs!31661 m!993091))

(declare-fun m!993259 () Bool)

(assert (=> bs!31661 m!993259))

(assert (=> bs!31661 m!993107))

(assert (=> b!1074220 d!129503))

(declare-fun b!1074374 () Bool)

(declare-fun e!613891 () ListLongMap!14581)

(assert (=> b!1074374 (= e!613891 (ListLongMap!14582 Nil!23146))))

(declare-fun b!1074375 () Bool)

(declare-fun e!613895 () Bool)

(declare-fun e!613894 () Bool)

(assert (=> b!1074375 (= e!613895 e!613894)))

(assert (=> b!1074375 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33692 _keys!1163)))))

(declare-fun res!716398 () Bool)

(declare-fun lt!476639 () ListLongMap!14581)

(assert (=> b!1074375 (= res!716398 (contains!6335 lt!476639 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074375 (=> (not res!716398) (not e!613894))))

(declare-fun d!129505 () Bool)

(declare-fun e!613892 () Bool)

(assert (=> d!129505 e!613892))

(declare-fun res!716397 () Bool)

(assert (=> d!129505 (=> (not res!716397) (not e!613892))))

(assert (=> d!129505 (= res!716397 (not (contains!6335 lt!476639 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129505 (= lt!476639 e!613891)))

(declare-fun c!107892 () Bool)

(assert (=> d!129505 (= c!107892 (bvsge #b00000000000000000000000000000000 (size!33692 _keys!1163)))))

(assert (=> d!129505 (validMask!0 mask!1515)))

(assert (=> d!129505 (= (getCurrentListMapNoExtraKeys!3869 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476639)))

(declare-fun b!1074376 () Bool)

(declare-fun e!613893 () ListLongMap!14581)

(assert (=> b!1074376 (= e!613891 e!613893)))

(declare-fun c!107893 () Bool)

(assert (=> b!1074376 (= c!107893 (validKeyInArray!0 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun e!613896 () Bool)

(declare-fun b!1074377 () Bool)

(assert (=> b!1074377 (= e!613896 (= lt!476639 (getCurrentListMapNoExtraKeys!3869 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1074378 () Bool)

(assert (=> b!1074378 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33692 _keys!1163)))))

(assert (=> b!1074378 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33693 _values!955)))))

(assert (=> b!1074378 (= e!613894 (= (apply!935 lt!476639 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)) (get!17221 (select (arr!33157 _values!955) #b00000000000000000000000000000000) (dynLambda!2042 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1074379 () Bool)

(declare-fun res!716396 () Bool)

(assert (=> b!1074379 (=> (not res!716396) (not e!613892))))

(assert (=> b!1074379 (= res!716396 (not (contains!6335 lt!476639 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!45387 () Bool)

(declare-fun call!45390 () ListLongMap!14581)

(assert (=> bm!45387 (= call!45390 (getCurrentListMapNoExtraKeys!3869 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1074380 () Bool)

(declare-fun e!613897 () Bool)

(assert (=> b!1074380 (= e!613897 (validKeyInArray!0 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074380 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1074381 () Bool)

(declare-fun lt!476643 () Unit!35373)

(declare-fun lt!476637 () Unit!35373)

(assert (=> b!1074381 (= lt!476643 lt!476637)))

(declare-fun lt!476642 () (_ BitVec 64))

(declare-fun lt!476638 () ListLongMap!14581)

(declare-fun lt!476640 () V!39779)

(declare-fun lt!476641 () (_ BitVec 64))

(assert (=> b!1074381 (not (contains!6335 (+!3215 lt!476638 (tuple2!16613 lt!476642 lt!476640)) lt!476641))))

(declare-fun addStillNotContains!263 (ListLongMap!14581 (_ BitVec 64) V!39779 (_ BitVec 64)) Unit!35373)

(assert (=> b!1074381 (= lt!476637 (addStillNotContains!263 lt!476638 lt!476642 lt!476640 lt!476641))))

(assert (=> b!1074381 (= lt!476641 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1074381 (= lt!476640 (get!17221 (select (arr!33157 _values!955) #b00000000000000000000000000000000) (dynLambda!2042 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1074381 (= lt!476642 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074381 (= lt!476638 call!45390)))

(assert (=> b!1074381 (= e!613893 (+!3215 call!45390 (tuple2!16613 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000) (get!17221 (select (arr!33157 _values!955) #b00000000000000000000000000000000) (dynLambda!2042 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1074382 () Bool)

(assert (=> b!1074382 (= e!613893 call!45390)))

(declare-fun b!1074383 () Bool)

(assert (=> b!1074383 (= e!613892 e!613895)))

(declare-fun c!107891 () Bool)

(assert (=> b!1074383 (= c!107891 e!613897)))

(declare-fun res!716395 () Bool)

(assert (=> b!1074383 (=> (not res!716395) (not e!613897))))

(assert (=> b!1074383 (= res!716395 (bvslt #b00000000000000000000000000000000 (size!33692 _keys!1163)))))

(declare-fun b!1074384 () Bool)

(assert (=> b!1074384 (= e!613895 e!613896)))

(declare-fun c!107894 () Bool)

(assert (=> b!1074384 (= c!107894 (bvslt #b00000000000000000000000000000000 (size!33692 _keys!1163)))))

(declare-fun b!1074385 () Bool)

(declare-fun isEmpty!953 (ListLongMap!14581) Bool)

(assert (=> b!1074385 (= e!613896 (isEmpty!953 lt!476639))))

(assert (= (and d!129505 c!107892) b!1074374))

(assert (= (and d!129505 (not c!107892)) b!1074376))

(assert (= (and b!1074376 c!107893) b!1074381))

(assert (= (and b!1074376 (not c!107893)) b!1074382))

(assert (= (or b!1074381 b!1074382) bm!45387))

(assert (= (and d!129505 res!716397) b!1074379))

(assert (= (and b!1074379 res!716396) b!1074383))

(assert (= (and b!1074383 res!716395) b!1074380))

(assert (= (and b!1074383 c!107891) b!1074375))

(assert (= (and b!1074383 (not c!107891)) b!1074384))

(assert (= (and b!1074375 res!716398) b!1074378))

(assert (= (and b!1074384 c!107894) b!1074377))

(assert (= (and b!1074384 (not c!107894)) b!1074385))

(declare-fun b_lambda!16789 () Bool)

(assert (=> (not b_lambda!16789) (not b!1074378)))

(assert (=> b!1074378 t!32496))

(declare-fun b_and!35065 () Bool)

(assert (= b_and!35063 (and (=> t!32496 result!14803) b_and!35065)))

(declare-fun b_lambda!16791 () Bool)

(assert (=> (not b_lambda!16791) (not b!1074381)))

(assert (=> b!1074381 t!32496))

(declare-fun b_and!35067 () Bool)

(assert (= b_and!35065 (and (=> t!32496 result!14803) b_and!35067)))

(assert (=> b!1074378 m!993153))

(assert (=> b!1074378 m!993155))

(assert (=> b!1074378 m!993157))

(assert (=> b!1074378 m!993155))

(assert (=> b!1074378 m!993137))

(assert (=> b!1074378 m!993153))

(assert (=> b!1074378 m!993137))

(declare-fun m!993261 () Bool)

(assert (=> b!1074378 m!993261))

(declare-fun m!993263 () Bool)

(assert (=> b!1074385 m!993263))

(declare-fun m!993265 () Bool)

(assert (=> bm!45387 m!993265))

(assert (=> b!1074375 m!993137))

(assert (=> b!1074375 m!993137))

(declare-fun m!993267 () Bool)

(assert (=> b!1074375 m!993267))

(assert (=> b!1074376 m!993137))

(assert (=> b!1074376 m!993137))

(assert (=> b!1074376 m!993145))

(assert (=> b!1074377 m!993265))

(declare-fun m!993269 () Bool)

(assert (=> b!1074379 m!993269))

(declare-fun m!993271 () Bool)

(assert (=> b!1074381 m!993271))

(declare-fun m!993273 () Bool)

(assert (=> b!1074381 m!993273))

(assert (=> b!1074381 m!993155))

(assert (=> b!1074381 m!993137))

(declare-fun m!993275 () Bool)

(assert (=> b!1074381 m!993275))

(declare-fun m!993277 () Bool)

(assert (=> b!1074381 m!993277))

(assert (=> b!1074381 m!993153))

(assert (=> b!1074381 m!993153))

(assert (=> b!1074381 m!993155))

(assert (=> b!1074381 m!993157))

(assert (=> b!1074381 m!993271))

(declare-fun m!993279 () Bool)

(assert (=> d!129505 m!993279))

(assert (=> d!129505 m!993107))

(assert (=> b!1074380 m!993137))

(assert (=> b!1074380 m!993137))

(assert (=> b!1074380 m!993145))

(assert (=> b!1074220 d!129505))

(declare-fun b!1074386 () Bool)

(declare-fun e!613898 () ListLongMap!14581)

(assert (=> b!1074386 (= e!613898 (ListLongMap!14582 Nil!23146))))

(declare-fun b!1074387 () Bool)

(declare-fun e!613902 () Bool)

(declare-fun e!613901 () Bool)

(assert (=> b!1074387 (= e!613902 e!613901)))

(assert (=> b!1074387 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33692 _keys!1163)))))

(declare-fun res!716402 () Bool)

(declare-fun lt!476646 () ListLongMap!14581)

(assert (=> b!1074387 (= res!716402 (contains!6335 lt!476646 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074387 (=> (not res!716402) (not e!613901))))

(declare-fun d!129507 () Bool)

(declare-fun e!613899 () Bool)

(assert (=> d!129507 e!613899))

(declare-fun res!716401 () Bool)

(assert (=> d!129507 (=> (not res!716401) (not e!613899))))

(assert (=> d!129507 (= res!716401 (not (contains!6335 lt!476646 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129507 (= lt!476646 e!613898)))

(declare-fun c!107896 () Bool)

(assert (=> d!129507 (= c!107896 (bvsge #b00000000000000000000000000000000 (size!33692 _keys!1163)))))

(assert (=> d!129507 (validMask!0 mask!1515)))

(assert (=> d!129507 (= (getCurrentListMapNoExtraKeys!3869 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476646)))

(declare-fun b!1074388 () Bool)

(declare-fun e!613900 () ListLongMap!14581)

(assert (=> b!1074388 (= e!613898 e!613900)))

(declare-fun c!107897 () Bool)

(assert (=> b!1074388 (= c!107897 (validKeyInArray!0 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun e!613903 () Bool)

(declare-fun b!1074389 () Bool)

(assert (=> b!1074389 (= e!613903 (= lt!476646 (getCurrentListMapNoExtraKeys!3869 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1074390 () Bool)

(assert (=> b!1074390 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33692 _keys!1163)))))

(assert (=> b!1074390 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33693 _values!955)))))

(assert (=> b!1074390 (= e!613901 (= (apply!935 lt!476646 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)) (get!17221 (select (arr!33157 _values!955) #b00000000000000000000000000000000) (dynLambda!2042 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1074391 () Bool)

(declare-fun res!716400 () Bool)

(assert (=> b!1074391 (=> (not res!716400) (not e!613899))))

(assert (=> b!1074391 (= res!716400 (not (contains!6335 lt!476646 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!45388 () Bool)

(declare-fun call!45391 () ListLongMap!14581)

(assert (=> bm!45388 (= call!45391 (getCurrentListMapNoExtraKeys!3869 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1074392 () Bool)

(declare-fun e!613904 () Bool)

(assert (=> b!1074392 (= e!613904 (validKeyInArray!0 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074392 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1074393 () Bool)

(declare-fun lt!476650 () Unit!35373)

(declare-fun lt!476644 () Unit!35373)

(assert (=> b!1074393 (= lt!476650 lt!476644)))

(declare-fun lt!476645 () ListLongMap!14581)

(declare-fun lt!476648 () (_ BitVec 64))

(declare-fun lt!476649 () (_ BitVec 64))

(declare-fun lt!476647 () V!39779)

(assert (=> b!1074393 (not (contains!6335 (+!3215 lt!476645 (tuple2!16613 lt!476649 lt!476647)) lt!476648))))

(assert (=> b!1074393 (= lt!476644 (addStillNotContains!263 lt!476645 lt!476649 lt!476647 lt!476648))))

(assert (=> b!1074393 (= lt!476648 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1074393 (= lt!476647 (get!17221 (select (arr!33157 _values!955) #b00000000000000000000000000000000) (dynLambda!2042 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1074393 (= lt!476649 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074393 (= lt!476645 call!45391)))

(assert (=> b!1074393 (= e!613900 (+!3215 call!45391 (tuple2!16613 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000) (get!17221 (select (arr!33157 _values!955) #b00000000000000000000000000000000) (dynLambda!2042 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1074394 () Bool)

(assert (=> b!1074394 (= e!613900 call!45391)))

(declare-fun b!1074395 () Bool)

(assert (=> b!1074395 (= e!613899 e!613902)))

(declare-fun c!107895 () Bool)

(assert (=> b!1074395 (= c!107895 e!613904)))

(declare-fun res!716399 () Bool)

(assert (=> b!1074395 (=> (not res!716399) (not e!613904))))

(assert (=> b!1074395 (= res!716399 (bvslt #b00000000000000000000000000000000 (size!33692 _keys!1163)))))

(declare-fun b!1074396 () Bool)

(assert (=> b!1074396 (= e!613902 e!613903)))

(declare-fun c!107898 () Bool)

(assert (=> b!1074396 (= c!107898 (bvslt #b00000000000000000000000000000000 (size!33692 _keys!1163)))))

(declare-fun b!1074397 () Bool)

(assert (=> b!1074397 (= e!613903 (isEmpty!953 lt!476646))))

(assert (= (and d!129507 c!107896) b!1074386))

(assert (= (and d!129507 (not c!107896)) b!1074388))

(assert (= (and b!1074388 c!107897) b!1074393))

(assert (= (and b!1074388 (not c!107897)) b!1074394))

(assert (= (or b!1074393 b!1074394) bm!45388))

(assert (= (and d!129507 res!716401) b!1074391))

(assert (= (and b!1074391 res!716400) b!1074395))

(assert (= (and b!1074395 res!716399) b!1074392))

(assert (= (and b!1074395 c!107895) b!1074387))

(assert (= (and b!1074395 (not c!107895)) b!1074396))

(assert (= (and b!1074387 res!716402) b!1074390))

(assert (= (and b!1074396 c!107898) b!1074389))

(assert (= (and b!1074396 (not c!107898)) b!1074397))

(declare-fun b_lambda!16793 () Bool)

(assert (=> (not b_lambda!16793) (not b!1074390)))

(assert (=> b!1074390 t!32496))

(declare-fun b_and!35069 () Bool)

(assert (= b_and!35067 (and (=> t!32496 result!14803) b_and!35069)))

(declare-fun b_lambda!16795 () Bool)

(assert (=> (not b_lambda!16795) (not b!1074393)))

(assert (=> b!1074393 t!32496))

(declare-fun b_and!35071 () Bool)

(assert (= b_and!35069 (and (=> t!32496 result!14803) b_and!35071)))

(assert (=> b!1074390 m!993153))

(assert (=> b!1074390 m!993155))

(assert (=> b!1074390 m!993157))

(assert (=> b!1074390 m!993155))

(assert (=> b!1074390 m!993137))

(assert (=> b!1074390 m!993153))

(assert (=> b!1074390 m!993137))

(declare-fun m!993281 () Bool)

(assert (=> b!1074390 m!993281))

(declare-fun m!993283 () Bool)

(assert (=> b!1074397 m!993283))

(declare-fun m!993285 () Bool)

(assert (=> bm!45388 m!993285))

(assert (=> b!1074387 m!993137))

(assert (=> b!1074387 m!993137))

(declare-fun m!993287 () Bool)

(assert (=> b!1074387 m!993287))

(assert (=> b!1074388 m!993137))

(assert (=> b!1074388 m!993137))

(assert (=> b!1074388 m!993145))

(assert (=> b!1074389 m!993285))

(declare-fun m!993289 () Bool)

(assert (=> b!1074391 m!993289))

(declare-fun m!993291 () Bool)

(assert (=> b!1074393 m!993291))

(declare-fun m!993293 () Bool)

(assert (=> b!1074393 m!993293))

(assert (=> b!1074393 m!993155))

(assert (=> b!1074393 m!993137))

(declare-fun m!993295 () Bool)

(assert (=> b!1074393 m!993295))

(declare-fun m!993297 () Bool)

(assert (=> b!1074393 m!993297))

(assert (=> b!1074393 m!993153))

(assert (=> b!1074393 m!993153))

(assert (=> b!1074393 m!993155))

(assert (=> b!1074393 m!993157))

(assert (=> b!1074393 m!993291))

(declare-fun m!993299 () Bool)

(assert (=> d!129507 m!993299))

(assert (=> d!129507 m!993107))

(assert (=> b!1074392 m!993137))

(assert (=> b!1074392 m!993137))

(assert (=> b!1074392 m!993145))

(assert (=> b!1074220 d!129507))

(declare-fun b!1074408 () Bool)

(declare-fun e!613915 () Bool)

(declare-fun e!613913 () Bool)

(assert (=> b!1074408 (= e!613915 e!613913)))

(declare-fun res!716409 () Bool)

(assert (=> b!1074408 (=> (not res!716409) (not e!613913))))

(declare-fun e!613914 () Bool)

(assert (=> b!1074408 (= res!716409 (not e!613914))))

(declare-fun res!716410 () Bool)

(assert (=> b!1074408 (=> (not res!716410) (not e!613914))))

(assert (=> b!1074408 (= res!716410 (validKeyInArray!0 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074409 () Bool)

(declare-fun e!613916 () Bool)

(declare-fun call!45394 () Bool)

(assert (=> b!1074409 (= e!613916 call!45394)))

(declare-fun b!1074410 () Bool)

(assert (=> b!1074410 (= e!613916 call!45394)))

(declare-fun b!1074411 () Bool)

(declare-fun contains!6337 (List!23148 (_ BitVec 64)) Bool)

(assert (=> b!1074411 (= e!613914 (contains!6337 Nil!23145 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074412 () Bool)

(assert (=> b!1074412 (= e!613913 e!613916)))

(declare-fun c!107901 () Bool)

(assert (=> b!1074412 (= c!107901 (validKeyInArray!0 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129509 () Bool)

(declare-fun res!716411 () Bool)

(assert (=> d!129509 (=> res!716411 e!613915)))

(assert (=> d!129509 (= res!716411 (bvsge #b00000000000000000000000000000000 (size!33692 _keys!1163)))))

(assert (=> d!129509 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23145) e!613915)))

(declare-fun bm!45391 () Bool)

(assert (=> bm!45391 (= call!45394 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107901 (Cons!23144 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000) Nil!23145) Nil!23145)))))

(assert (= (and d!129509 (not res!716411)) b!1074408))

(assert (= (and b!1074408 res!716410) b!1074411))

(assert (= (and b!1074408 res!716409) b!1074412))

(assert (= (and b!1074412 c!107901) b!1074409))

(assert (= (and b!1074412 (not c!107901)) b!1074410))

(assert (= (or b!1074409 b!1074410) bm!45391))

(assert (=> b!1074408 m!993137))

(assert (=> b!1074408 m!993137))

(assert (=> b!1074408 m!993145))

(assert (=> b!1074411 m!993137))

(assert (=> b!1074411 m!993137))

(declare-fun m!993301 () Bool)

(assert (=> b!1074411 m!993301))

(assert (=> b!1074412 m!993137))

(assert (=> b!1074412 m!993137))

(assert (=> b!1074412 m!993145))

(assert (=> bm!45391 m!993137))

(declare-fun m!993303 () Bool)

(assert (=> bm!45391 m!993303))

(assert (=> b!1074216 d!129509))

(declare-fun b!1074420 () Bool)

(declare-fun e!613922 () Bool)

(assert (=> b!1074420 (= e!613922 tp_is_empty!25983)))

(declare-fun condMapEmpty!40702 () Bool)

(declare-fun mapDefault!40702 () ValueCell!12288)

(assert (=> mapNonEmpty!40696 (= condMapEmpty!40702 (= mapRest!40696 ((as const (Array (_ BitVec 32) ValueCell!12288)) mapDefault!40702)))))

(declare-fun mapRes!40702 () Bool)

(assert (=> mapNonEmpty!40696 (= tp!77992 (and e!613922 mapRes!40702))))

(declare-fun b!1074419 () Bool)

(declare-fun e!613921 () Bool)

(assert (=> b!1074419 (= e!613921 tp_is_empty!25983)))

(declare-fun mapNonEmpty!40702 () Bool)

(declare-fun tp!78002 () Bool)

(assert (=> mapNonEmpty!40702 (= mapRes!40702 (and tp!78002 e!613921))))

(declare-fun mapRest!40702 () (Array (_ BitVec 32) ValueCell!12288))

(declare-fun mapKey!40702 () (_ BitVec 32))

(declare-fun mapValue!40702 () ValueCell!12288)

(assert (=> mapNonEmpty!40702 (= mapRest!40696 (store mapRest!40702 mapKey!40702 mapValue!40702))))

(declare-fun mapIsEmpty!40702 () Bool)

(assert (=> mapIsEmpty!40702 mapRes!40702))

(assert (= (and mapNonEmpty!40696 condMapEmpty!40702) mapIsEmpty!40702))

(assert (= (and mapNonEmpty!40696 (not condMapEmpty!40702)) mapNonEmpty!40702))

(assert (= (and mapNonEmpty!40702 ((_ is ValueCellFull!12288) mapValue!40702)) b!1074419))

(assert (= (and mapNonEmpty!40696 ((_ is ValueCellFull!12288) mapDefault!40702)) b!1074420))

(declare-fun m!993305 () Bool)

(assert (=> mapNonEmpty!40702 m!993305))

(declare-fun b_lambda!16797 () Bool)

(assert (= b_lambda!16785 (or (and start!95020 b_free!22173) b_lambda!16797)))

(declare-fun b_lambda!16799 () Bool)

(assert (= b_lambda!16791 (or (and start!95020 b_free!22173) b_lambda!16799)))

(declare-fun b_lambda!16801 () Bool)

(assert (= b_lambda!16793 (or (and start!95020 b_free!22173) b_lambda!16801)))

(declare-fun b_lambda!16803 () Bool)

(assert (= b_lambda!16789 (or (and start!95020 b_free!22173) b_lambda!16803)))

(declare-fun b_lambda!16805 () Bool)

(assert (= b_lambda!16787 (or (and start!95020 b_free!22173) b_lambda!16805)))

(declare-fun b_lambda!16807 () Bool)

(assert (= b_lambda!16795 (or (and start!95020 b_free!22173) b_lambda!16807)))

(check-sat (not b_lambda!16805) (not b!1074305) (not b!1074255) (not d!129495) (not b!1074340) (not bm!45373) (not b!1074256) (not b!1074317) (not b!1074342) (not d!129505) (not b!1074315) (not bm!45391) (not b!1074387) (not bm!45388) (not b!1074411) (not b!1074392) (not b!1074378) (not b!1074328) (not b!1074376) (not b!1074388) (not b!1074334) (not d!129491) (not mapNonEmpty!40702) (not b!1074346) (not b_lambda!16801) (not b!1074412) (not b!1074380) (not bm!45379) (not b!1074390) (not bm!45372) (not bm!45356) (not bm!45380) tp_is_empty!25983 (not b!1074330) (not bm!45375) (not b_lambda!16797) (not d!129507) (not b!1074349) (not b_lambda!16807) (not b_lambda!16803) (not b!1074379) (not b!1074393) (not b!1074316) (not b!1074377) (not b!1074313) b_and!35071 (not b!1074345) (not b!1074301) (not b!1074389) (not b!1074385) (not bm!45381) (not b!1074320) (not b!1074311) (not bm!45382) (not b!1074344) (not bm!45374) (not b!1074397) (not d!129493) (not b_next!22173) (not b!1074327) (not b!1074408) (not bm!45387) (not b!1074391) (not b!1074381) (not b!1074375) (not b_lambda!16799) (not d!129503))
(check-sat b_and!35071 (not b_next!22173))
