; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95044 () Bool)

(assert start!95044)

(declare-fun b_free!22179 () Bool)

(declare-fun b_next!22179 () Bool)

(assert (=> start!95044 (= b_free!22179 (not b_next!22179))))

(declare-fun tp!78013 () Bool)

(declare-fun b_and!35075 () Bool)

(assert (=> start!95044 (= tp!78013 b_and!35075)))

(declare-fun b!1074471 () Bool)

(declare-fun e!613964 () Bool)

(declare-fun e!613968 () Bool)

(assert (=> b!1074471 (= e!613964 e!613968)))

(declare-fun res!716449 () Bool)

(assert (=> b!1074471 (=> res!716449 e!613968)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1074471 (= res!716449 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1074472 () Bool)

(declare-fun e!613969 () Bool)

(declare-fun tp_is_empty!25989 () Bool)

(assert (=> b!1074472 (= e!613969 tp_is_empty!25989)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun b!1074473 () Bool)

(declare-fun e!613966 () Bool)

(declare-datatypes ((V!39787 0))(
  ( (V!39788 (val!13045 Int)) )
))
(declare-datatypes ((ValueCell!12291 0))(
  ( (ValueCellFull!12291 (v!15666 V!39787)) (EmptyCell!12291) )
))
(declare-datatypes ((array!68945 0))(
  ( (array!68946 (arr!33162 (Array (_ BitVec 32) ValueCell!12291)) (size!33698 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68945)

(declare-fun minValue!907 () V!39787)

(declare-datatypes ((array!68947 0))(
  ( (array!68948 (arr!33163 (Array (_ BitVec 32) (_ BitVec 64))) (size!33699 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68947)

(declare-datatypes ((tuple2!16618 0))(
  ( (tuple2!16619 (_1!8320 (_ BitVec 64)) (_2!8320 V!39787)) )
))
(declare-datatypes ((List!23154 0))(
  ( (Nil!23151) (Cons!23150 (h!24359 tuple2!16618) (t!32499 List!23154)) )
))
(declare-datatypes ((ListLongMap!14587 0))(
  ( (ListLongMap!14588 (toList!7309 List!23154)) )
))
(declare-fun lt!476667 () ListLongMap!14587)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39787)

(declare-fun getCurrentListMap!4179 (array!68947 array!68945 (_ BitVec 32) (_ BitVec 32) V!39787 V!39787 (_ BitVec 32) Int) ListLongMap!14587)

(assert (=> b!1074473 (= e!613966 (= (getCurrentListMap!4179 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476667))))

(declare-fun b!1074474 () Bool)

(declare-fun res!716448 () Bool)

(declare-fun e!613970 () Bool)

(assert (=> b!1074474 (=> (not res!716448) (not e!613970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68947 (_ BitVec 32)) Bool)

(assert (=> b!1074474 (= res!716448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1074475 () Bool)

(assert (=> b!1074475 (= e!613970 (not e!613966))))

(declare-fun res!716453 () Bool)

(assert (=> b!1074475 (=> res!716453 e!613966)))

(assert (=> b!1074475 (= res!716453 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1074475 e!613964))

(declare-fun res!716451 () Bool)

(assert (=> b!1074475 (=> (not res!716451) (not e!613964))))

(declare-fun lt!476666 () ListLongMap!14587)

(assert (=> b!1074475 (= res!716451 (= lt!476666 lt!476667))))

(declare-fun zeroValueBefore!47 () V!39787)

(declare-datatypes ((Unit!35381 0))(
  ( (Unit!35382) )
))
(declare-fun lt!476668 () Unit!35381)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!888 (array!68947 array!68945 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39787 V!39787 V!39787 V!39787 (_ BitVec 32) Int) Unit!35381)

(assert (=> b!1074475 (= lt!476668 (lemmaNoChangeToArrayThenSameMapNoExtras!888 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3872 (array!68947 array!68945 (_ BitVec 32) (_ BitVec 32) V!39787 V!39787 (_ BitVec 32) Int) ListLongMap!14587)

(assert (=> b!1074475 (= lt!476667 (getCurrentListMapNoExtraKeys!3872 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1074475 (= lt!476666 (getCurrentListMapNoExtraKeys!3872 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074476 () Bool)

(declare-fun res!716450 () Bool)

(assert (=> b!1074476 (=> (not res!716450) (not e!613970))))

(assert (=> b!1074476 (= res!716450 (and (= (size!33698 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33699 _keys!1163) (size!33698 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40708 () Bool)

(declare-fun mapRes!40708 () Bool)

(assert (=> mapIsEmpty!40708 mapRes!40708))

(declare-fun b!1074477 () Bool)

(declare-fun e!613963 () Bool)

(assert (=> b!1074477 (= e!613963 tp_is_empty!25989)))

(declare-fun b!1074478 () Bool)

(declare-fun res!716452 () Bool)

(assert (=> b!1074478 (=> (not res!716452) (not e!613970))))

(declare-datatypes ((List!23155 0))(
  ( (Nil!23152) (Cons!23151 (h!24360 (_ BitVec 64)) (t!32500 List!23155)) )
))
(declare-fun arrayNoDuplicates!0 (array!68947 (_ BitVec 32) List!23155) Bool)

(assert (=> b!1074478 (= res!716452 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23152))))

(declare-fun mapNonEmpty!40708 () Bool)

(declare-fun tp!78014 () Bool)

(assert (=> mapNonEmpty!40708 (= mapRes!40708 (and tp!78014 e!613969))))

(declare-fun mapKey!40708 () (_ BitVec 32))

(declare-fun mapRest!40708 () (Array (_ BitVec 32) ValueCell!12291))

(declare-fun mapValue!40708 () ValueCell!12291)

(assert (=> mapNonEmpty!40708 (= (arr!33162 _values!955) (store mapRest!40708 mapKey!40708 mapValue!40708))))

(declare-fun res!716447 () Bool)

(assert (=> start!95044 (=> (not res!716447) (not e!613970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95044 (= res!716447 (validMask!0 mask!1515))))

(assert (=> start!95044 e!613970))

(assert (=> start!95044 true))

(assert (=> start!95044 tp_is_empty!25989))

(declare-fun e!613967 () Bool)

(declare-fun array_inv!25630 (array!68945) Bool)

(assert (=> start!95044 (and (array_inv!25630 _values!955) e!613967)))

(assert (=> start!95044 tp!78013))

(declare-fun array_inv!25631 (array!68947) Bool)

(assert (=> start!95044 (array_inv!25631 _keys!1163)))

(declare-fun b!1074479 () Bool)

(declare-fun +!3218 (ListLongMap!14587 tuple2!16618) ListLongMap!14587)

(assert (=> b!1074479 (= e!613968 (= (getCurrentListMap!4179 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (+!3218 lt!476666 (tuple2!16619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun b!1074480 () Bool)

(assert (=> b!1074480 (= e!613967 (and e!613963 mapRes!40708))))

(declare-fun condMapEmpty!40708 () Bool)

(declare-fun mapDefault!40708 () ValueCell!12291)

(assert (=> b!1074480 (= condMapEmpty!40708 (= (arr!33162 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12291)) mapDefault!40708)))))

(assert (= (and start!95044 res!716447) b!1074476))

(assert (= (and b!1074476 res!716450) b!1074474))

(assert (= (and b!1074474 res!716448) b!1074478))

(assert (= (and b!1074478 res!716452) b!1074475))

(assert (= (and b!1074475 res!716451) b!1074471))

(assert (= (and b!1074471 (not res!716449)) b!1074479))

(assert (= (and b!1074475 (not res!716453)) b!1074473))

(assert (= (and b!1074480 condMapEmpty!40708) mapIsEmpty!40708))

(assert (= (and b!1074480 (not condMapEmpty!40708)) mapNonEmpty!40708))

(get-info :version)

(assert (= (and mapNonEmpty!40708 ((_ is ValueCellFull!12291) mapValue!40708)) b!1074472))

(assert (= (and b!1074480 ((_ is ValueCellFull!12291) mapDefault!40708)) b!1074477))

(assert (= start!95044 b!1074480))

(declare-fun m!993331 () Bool)

(assert (=> start!95044 m!993331))

(declare-fun m!993333 () Bool)

(assert (=> start!95044 m!993333))

(declare-fun m!993335 () Bool)

(assert (=> start!95044 m!993335))

(declare-fun m!993337 () Bool)

(assert (=> b!1074479 m!993337))

(declare-fun m!993339 () Bool)

(assert (=> b!1074479 m!993339))

(declare-fun m!993341 () Bool)

(assert (=> b!1074473 m!993341))

(declare-fun m!993343 () Bool)

(assert (=> b!1074474 m!993343))

(declare-fun m!993345 () Bool)

(assert (=> mapNonEmpty!40708 m!993345))

(declare-fun m!993347 () Bool)

(assert (=> b!1074475 m!993347))

(declare-fun m!993349 () Bool)

(assert (=> b!1074475 m!993349))

(declare-fun m!993351 () Bool)

(assert (=> b!1074475 m!993351))

(declare-fun m!993353 () Bool)

(assert (=> b!1074478 m!993353))

(check-sat tp_is_empty!25989 (not b!1074474) (not b!1074475) (not b!1074473) b_and!35075 (not b!1074479) (not b!1074478) (not b_next!22179) (not mapNonEmpty!40708) (not start!95044))
(check-sat b_and!35075 (not b_next!22179))
(get-model)

(declare-fun b!1074554 () Bool)

(declare-fun e!614023 () Bool)

(declare-fun call!45413 () Bool)

(assert (=> b!1074554 (= e!614023 (not call!45413))))

(declare-fun b!1074555 () Bool)

(declare-fun e!614025 () Unit!35381)

(declare-fun Unit!35385 () Unit!35381)

(assert (=> b!1074555 (= e!614025 Unit!35385)))

(declare-fun b!1074556 () Bool)

(declare-fun e!614031 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1074556 (= e!614031 (validKeyInArray!0 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074557 () Bool)

(declare-fun e!614021 () ListLongMap!14587)

(declare-fun call!45414 () ListLongMap!14587)

(assert (=> b!1074557 (= e!614021 call!45414)))

(declare-fun e!614026 () Bool)

(declare-fun b!1074558 () Bool)

(declare-fun lt!476736 () ListLongMap!14587)

(declare-fun apply!936 (ListLongMap!14587 (_ BitVec 64)) V!39787)

(declare-fun get!17224 (ValueCell!12291 V!39787) V!39787)

(declare-fun dynLambda!2043 (Int (_ BitVec 64)) V!39787)

(assert (=> b!1074558 (= e!614026 (= (apply!936 lt!476736 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000)) (get!17224 (select (arr!33162 _values!955) #b00000000000000000000000000000000) (dynLambda!2043 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1074558 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33698 _values!955)))))

(assert (=> b!1074558 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33699 _keys!1163)))))

(declare-fun bm!45406 () Bool)

(declare-fun call!45411 () Bool)

(declare-fun contains!6338 (ListLongMap!14587 (_ BitVec 64)) Bool)

(assert (=> bm!45406 (= call!45411 (contains!6338 lt!476736 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!45412 () ListLongMap!14587)

(declare-fun bm!45407 () Bool)

(assert (=> bm!45407 (= call!45412 (getCurrentListMapNoExtraKeys!3872 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074559 () Bool)

(declare-fun c!107919 () Bool)

(assert (=> b!1074559 (= c!107919 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!614033 () ListLongMap!14587)

(assert (=> b!1074559 (= e!614033 e!614021)))

(declare-fun b!1074560 () Bool)

(declare-fun e!614032 () Bool)

(assert (=> b!1074560 (= e!614032 e!614026)))

(declare-fun res!716501 () Bool)

(assert (=> b!1074560 (=> (not res!716501) (not e!614026))))

(assert (=> b!1074560 (= res!716501 (contains!6338 lt!476736 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074560 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33699 _keys!1163)))))

(declare-fun b!1074561 () Bool)

(declare-fun call!45410 () ListLongMap!14587)

(assert (=> b!1074561 (= e!614033 call!45410)))

(declare-fun b!1074562 () Bool)

(declare-fun lt!476729 () Unit!35381)

(assert (=> b!1074562 (= e!614025 lt!476729)))

(declare-fun lt!476725 () ListLongMap!14587)

(assert (=> b!1074562 (= lt!476725 (getCurrentListMapNoExtraKeys!3872 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476727 () (_ BitVec 64))

(assert (=> b!1074562 (= lt!476727 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476740 () (_ BitVec 64))

(assert (=> b!1074562 (= lt!476740 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476737 () Unit!35381)

(declare-fun addStillContains!649 (ListLongMap!14587 (_ BitVec 64) V!39787 (_ BitVec 64)) Unit!35381)

(assert (=> b!1074562 (= lt!476737 (addStillContains!649 lt!476725 lt!476727 zeroValueBefore!47 lt!476740))))

(assert (=> b!1074562 (contains!6338 (+!3218 lt!476725 (tuple2!16619 lt!476727 zeroValueBefore!47)) lt!476740)))

(declare-fun lt!476728 () Unit!35381)

(assert (=> b!1074562 (= lt!476728 lt!476737)))

(declare-fun lt!476731 () ListLongMap!14587)

(assert (=> b!1074562 (= lt!476731 (getCurrentListMapNoExtraKeys!3872 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476733 () (_ BitVec 64))

(assert (=> b!1074562 (= lt!476733 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476738 () (_ BitVec 64))

(assert (=> b!1074562 (= lt!476738 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476743 () Unit!35381)

(declare-fun addApplyDifferent!509 (ListLongMap!14587 (_ BitVec 64) V!39787 (_ BitVec 64)) Unit!35381)

(assert (=> b!1074562 (= lt!476743 (addApplyDifferent!509 lt!476731 lt!476733 minValue!907 lt!476738))))

(assert (=> b!1074562 (= (apply!936 (+!3218 lt!476731 (tuple2!16619 lt!476733 minValue!907)) lt!476738) (apply!936 lt!476731 lt!476738))))

(declare-fun lt!476726 () Unit!35381)

(assert (=> b!1074562 (= lt!476726 lt!476743)))

(declare-fun lt!476732 () ListLongMap!14587)

(assert (=> b!1074562 (= lt!476732 (getCurrentListMapNoExtraKeys!3872 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476739 () (_ BitVec 64))

(assert (=> b!1074562 (= lt!476739 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476741 () (_ BitVec 64))

(assert (=> b!1074562 (= lt!476741 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476730 () Unit!35381)

(assert (=> b!1074562 (= lt!476730 (addApplyDifferent!509 lt!476732 lt!476739 zeroValueBefore!47 lt!476741))))

(assert (=> b!1074562 (= (apply!936 (+!3218 lt!476732 (tuple2!16619 lt!476739 zeroValueBefore!47)) lt!476741) (apply!936 lt!476732 lt!476741))))

(declare-fun lt!476735 () Unit!35381)

(assert (=> b!1074562 (= lt!476735 lt!476730)))

(declare-fun lt!476742 () ListLongMap!14587)

(assert (=> b!1074562 (= lt!476742 (getCurrentListMapNoExtraKeys!3872 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476722 () (_ BitVec 64))

(assert (=> b!1074562 (= lt!476722 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476723 () (_ BitVec 64))

(assert (=> b!1074562 (= lt!476723 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074562 (= lt!476729 (addApplyDifferent!509 lt!476742 lt!476722 minValue!907 lt!476723))))

(assert (=> b!1074562 (= (apply!936 (+!3218 lt!476742 (tuple2!16619 lt!476722 minValue!907)) lt!476723) (apply!936 lt!476742 lt!476723))))

(declare-fun b!1074563 () Bool)

(declare-fun e!614030 () Bool)

(declare-fun e!614022 () Bool)

(assert (=> b!1074563 (= e!614030 e!614022)))

(declare-fun res!716495 () Bool)

(assert (=> b!1074563 (= res!716495 call!45411)))

(assert (=> b!1074563 (=> (not res!716495) (not e!614022))))

(declare-fun b!1074564 () Bool)

(declare-fun e!614027 () Bool)

(assert (=> b!1074564 (= e!614027 (= (apply!936 lt!476736 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun bm!45408 () Bool)

(declare-fun call!45409 () ListLongMap!14587)

(assert (=> bm!45408 (= call!45410 call!45409)))

(declare-fun b!1074565 () Bool)

(declare-fun e!614024 () Bool)

(assert (=> b!1074565 (= e!614024 e!614030)))

(declare-fun c!107918 () Bool)

(assert (=> b!1074565 (= c!107918 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!129513 () Bool)

(assert (=> d!129513 e!614024))

(declare-fun res!716498 () Bool)

(assert (=> d!129513 (=> (not res!716498) (not e!614024))))

(assert (=> d!129513 (= res!716498 (or (bvsge #b00000000000000000000000000000000 (size!33699 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33699 _keys!1163)))))))

(declare-fun lt!476734 () ListLongMap!14587)

(assert (=> d!129513 (= lt!476736 lt!476734)))

(declare-fun lt!476724 () Unit!35381)

(assert (=> d!129513 (= lt!476724 e!614025)))

(declare-fun c!107916 () Bool)

(declare-fun e!614029 () Bool)

(assert (=> d!129513 (= c!107916 e!614029)))

(declare-fun res!716493 () Bool)

(assert (=> d!129513 (=> (not res!716493) (not e!614029))))

(assert (=> d!129513 (= res!716493 (bvslt #b00000000000000000000000000000000 (size!33699 _keys!1163)))))

(declare-fun e!614028 () ListLongMap!14587)

(assert (=> d!129513 (= lt!476734 e!614028)))

(declare-fun c!107917 () Bool)

(assert (=> d!129513 (= c!107917 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129513 (validMask!0 mask!1515)))

(assert (=> d!129513 (= (getCurrentListMap!4179 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476736)))

(declare-fun b!1074553 () Bool)

(assert (=> b!1074553 (= e!614028 (+!3218 call!45409 (tuple2!16619 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun bm!45409 () Bool)

(assert (=> bm!45409 (= call!45413 (contains!6338 lt!476736 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1074566 () Bool)

(assert (=> b!1074566 (= e!614029 (validKeyInArray!0 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074567 () Bool)

(assert (=> b!1074567 (= e!614021 call!45410)))

(declare-fun bm!45410 () Bool)

(declare-fun call!45415 () ListLongMap!14587)

(assert (=> bm!45410 (= call!45414 call!45415)))

(declare-fun b!1074568 () Bool)

(declare-fun res!716497 () Bool)

(assert (=> b!1074568 (=> (not res!716497) (not e!614024))))

(assert (=> b!1074568 (= res!716497 e!614032)))

(declare-fun res!716494 () Bool)

(assert (=> b!1074568 (=> res!716494 e!614032)))

(assert (=> b!1074568 (= res!716494 (not e!614031))))

(declare-fun res!716500 () Bool)

(assert (=> b!1074568 (=> (not res!716500) (not e!614031))))

(assert (=> b!1074568 (= res!716500 (bvslt #b00000000000000000000000000000000 (size!33699 _keys!1163)))))

(declare-fun b!1074569 () Bool)

(assert (=> b!1074569 (= e!614028 e!614033)))

(declare-fun c!107914 () Bool)

(assert (=> b!1074569 (= c!107914 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45411 () Bool)

(assert (=> bm!45411 (= call!45409 (+!3218 (ite c!107917 call!45412 (ite c!107914 call!45415 call!45414)) (ite (or c!107917 c!107914) (tuple2!16619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16619 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1074570 () Bool)

(assert (=> b!1074570 (= e!614023 e!614027)))

(declare-fun res!716496 () Bool)

(assert (=> b!1074570 (= res!716496 call!45413)))

(assert (=> b!1074570 (=> (not res!716496) (not e!614027))))

(declare-fun b!1074571 () Bool)

(declare-fun res!716499 () Bool)

(assert (=> b!1074571 (=> (not res!716499) (not e!614024))))

(assert (=> b!1074571 (= res!716499 e!614023)))

(declare-fun c!107915 () Bool)

(assert (=> b!1074571 (= c!107915 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1074572 () Bool)

(assert (=> b!1074572 (= e!614022 (= (apply!936 lt!476736 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun bm!45412 () Bool)

(assert (=> bm!45412 (= call!45415 call!45412)))

(declare-fun b!1074573 () Bool)

(assert (=> b!1074573 (= e!614030 (not call!45411))))

(assert (= (and d!129513 c!107917) b!1074553))

(assert (= (and d!129513 (not c!107917)) b!1074569))

(assert (= (and b!1074569 c!107914) b!1074561))

(assert (= (and b!1074569 (not c!107914)) b!1074559))

(assert (= (and b!1074559 c!107919) b!1074567))

(assert (= (and b!1074559 (not c!107919)) b!1074557))

(assert (= (or b!1074567 b!1074557) bm!45410))

(assert (= (or b!1074561 bm!45410) bm!45412))

(assert (= (or b!1074561 b!1074567) bm!45408))

(assert (= (or b!1074553 bm!45412) bm!45407))

(assert (= (or b!1074553 bm!45408) bm!45411))

(assert (= (and d!129513 res!716493) b!1074566))

(assert (= (and d!129513 c!107916) b!1074562))

(assert (= (and d!129513 (not c!107916)) b!1074555))

(assert (= (and d!129513 res!716498) b!1074568))

(assert (= (and b!1074568 res!716500) b!1074556))

(assert (= (and b!1074568 (not res!716494)) b!1074560))

(assert (= (and b!1074560 res!716501) b!1074558))

(assert (= (and b!1074568 res!716497) b!1074571))

(assert (= (and b!1074571 c!107915) b!1074570))

(assert (= (and b!1074571 (not c!107915)) b!1074554))

(assert (= (and b!1074570 res!716496) b!1074564))

(assert (= (or b!1074570 b!1074554) bm!45409))

(assert (= (and b!1074571 res!716499) b!1074565))

(assert (= (and b!1074565 c!107918) b!1074563))

(assert (= (and b!1074565 (not c!107918)) b!1074573))

(assert (= (and b!1074563 res!716495) b!1074572))

(assert (= (or b!1074563 b!1074573) bm!45406))

(declare-fun b_lambda!16809 () Bool)

(assert (=> (not b_lambda!16809) (not b!1074558)))

(declare-fun t!32504 () Bool)

(declare-fun tb!7167 () Bool)

(assert (=> (and start!95044 (= defaultEntry!963 defaultEntry!963) t!32504) tb!7167))

(declare-fun result!14809 () Bool)

(assert (=> tb!7167 (= result!14809 tp_is_empty!25989)))

(assert (=> b!1074558 t!32504))

(declare-fun b_and!35079 () Bool)

(assert (= b_and!35075 (and (=> t!32504 result!14809) b_and!35079)))

(declare-fun m!993379 () Bool)

(assert (=> b!1074556 m!993379))

(assert (=> b!1074556 m!993379))

(declare-fun m!993381 () Bool)

(assert (=> b!1074556 m!993381))

(declare-fun m!993383 () Bool)

(assert (=> b!1074572 m!993383))

(declare-fun m!993385 () Bool)

(assert (=> b!1074564 m!993385))

(declare-fun m!993387 () Bool)

(assert (=> bm!45406 m!993387))

(assert (=> b!1074566 m!993379))

(assert (=> b!1074566 m!993379))

(assert (=> b!1074566 m!993381))

(declare-fun m!993389 () Bool)

(assert (=> b!1074553 m!993389))

(declare-fun m!993391 () Bool)

(assert (=> bm!45409 m!993391))

(declare-fun m!993393 () Bool)

(assert (=> b!1074558 m!993393))

(declare-fun m!993395 () Bool)

(assert (=> b!1074558 m!993395))

(declare-fun m!993397 () Bool)

(assert (=> b!1074558 m!993397))

(assert (=> b!1074558 m!993379))

(declare-fun m!993399 () Bool)

(assert (=> b!1074558 m!993399))

(assert (=> b!1074558 m!993393))

(assert (=> b!1074558 m!993395))

(assert (=> b!1074558 m!993379))

(assert (=> b!1074562 m!993351))

(declare-fun m!993401 () Bool)

(assert (=> b!1074562 m!993401))

(declare-fun m!993403 () Bool)

(assert (=> b!1074562 m!993403))

(declare-fun m!993405 () Bool)

(assert (=> b!1074562 m!993405))

(declare-fun m!993407 () Bool)

(assert (=> b!1074562 m!993407))

(declare-fun m!993409 () Bool)

(assert (=> b!1074562 m!993409))

(declare-fun m!993411 () Bool)

(assert (=> b!1074562 m!993411))

(declare-fun m!993413 () Bool)

(assert (=> b!1074562 m!993413))

(assert (=> b!1074562 m!993405))

(declare-fun m!993415 () Bool)

(assert (=> b!1074562 m!993415))

(assert (=> b!1074562 m!993411))

(declare-fun m!993417 () Bool)

(assert (=> b!1074562 m!993417))

(assert (=> b!1074562 m!993409))

(declare-fun m!993419 () Bool)

(assert (=> b!1074562 m!993419))

(assert (=> b!1074562 m!993401))

(declare-fun m!993421 () Bool)

(assert (=> b!1074562 m!993421))

(declare-fun m!993423 () Bool)

(assert (=> b!1074562 m!993423))

(declare-fun m!993425 () Bool)

(assert (=> b!1074562 m!993425))

(declare-fun m!993427 () Bool)

(assert (=> b!1074562 m!993427))

(declare-fun m!993429 () Bool)

(assert (=> b!1074562 m!993429))

(assert (=> b!1074562 m!993379))

(assert (=> d!129513 m!993331))

(assert (=> b!1074560 m!993379))

(assert (=> b!1074560 m!993379))

(declare-fun m!993431 () Bool)

(assert (=> b!1074560 m!993431))

(declare-fun m!993433 () Bool)

(assert (=> bm!45411 m!993433))

(assert (=> bm!45407 m!993351))

(assert (=> b!1074479 d!129513))

(declare-fun d!129515 () Bool)

(declare-fun e!614036 () Bool)

(assert (=> d!129515 e!614036))

(declare-fun res!716506 () Bool)

(assert (=> d!129515 (=> (not res!716506) (not e!614036))))

(declare-fun lt!476753 () ListLongMap!14587)

(assert (=> d!129515 (= res!716506 (contains!6338 lt!476753 (_1!8320 (tuple2!16619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!476752 () List!23154)

(assert (=> d!129515 (= lt!476753 (ListLongMap!14588 lt!476752))))

(declare-fun lt!476755 () Unit!35381)

(declare-fun lt!476754 () Unit!35381)

(assert (=> d!129515 (= lt!476755 lt!476754)))

(declare-datatypes ((Option!659 0))(
  ( (Some!658 (v!15668 V!39787)) (None!657) )
))
(declare-fun getValueByKey!608 (List!23154 (_ BitVec 64)) Option!659)

(assert (=> d!129515 (= (getValueByKey!608 lt!476752 (_1!8320 (tuple2!16619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!658 (_2!8320 (tuple2!16619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lemmaContainsTupThenGetReturnValue!287 (List!23154 (_ BitVec 64) V!39787) Unit!35381)

(assert (=> d!129515 (= lt!476754 (lemmaContainsTupThenGetReturnValue!287 lt!476752 (_1!8320 (tuple2!16619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8320 (tuple2!16619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun insertStrictlySorted!380 (List!23154 (_ BitVec 64) V!39787) List!23154)

(assert (=> d!129515 (= lt!476752 (insertStrictlySorted!380 (toList!7309 lt!476666) (_1!8320 (tuple2!16619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8320 (tuple2!16619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!129515 (= (+!3218 lt!476666 (tuple2!16619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!476753)))

(declare-fun b!1074580 () Bool)

(declare-fun res!716507 () Bool)

(assert (=> b!1074580 (=> (not res!716507) (not e!614036))))

(assert (=> b!1074580 (= res!716507 (= (getValueByKey!608 (toList!7309 lt!476753) (_1!8320 (tuple2!16619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!658 (_2!8320 (tuple2!16619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))))

(declare-fun b!1074581 () Bool)

(declare-fun contains!6339 (List!23154 tuple2!16618) Bool)

(assert (=> b!1074581 (= e!614036 (contains!6339 (toList!7309 lt!476753) (tuple2!16619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(assert (= (and d!129515 res!716506) b!1074580))

(assert (= (and b!1074580 res!716507) b!1074581))

(declare-fun m!993435 () Bool)

(assert (=> d!129515 m!993435))

(declare-fun m!993437 () Bool)

(assert (=> d!129515 m!993437))

(declare-fun m!993439 () Bool)

(assert (=> d!129515 m!993439))

(declare-fun m!993441 () Bool)

(assert (=> d!129515 m!993441))

(declare-fun m!993443 () Bool)

(assert (=> b!1074580 m!993443))

(declare-fun m!993445 () Bool)

(assert (=> b!1074581 m!993445))

(assert (=> b!1074479 d!129515))

(declare-fun b!1074592 () Bool)

(declare-fun e!614046 () Bool)

(declare-fun e!614047 () Bool)

(assert (=> b!1074592 (= e!614046 e!614047)))

(declare-fun res!716516 () Bool)

(assert (=> b!1074592 (=> (not res!716516) (not e!614047))))

(declare-fun e!614048 () Bool)

(assert (=> b!1074592 (= res!716516 (not e!614048))))

(declare-fun res!716514 () Bool)

(assert (=> b!1074592 (=> (not res!716514) (not e!614048))))

(assert (=> b!1074592 (= res!716514 (validKeyInArray!0 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074593 () Bool)

(declare-fun contains!6340 (List!23155 (_ BitVec 64)) Bool)

(assert (=> b!1074593 (= e!614048 (contains!6340 Nil!23152 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074594 () Bool)

(declare-fun e!614045 () Bool)

(declare-fun call!45418 () Bool)

(assert (=> b!1074594 (= e!614045 call!45418)))

(declare-fun b!1074595 () Bool)

(assert (=> b!1074595 (= e!614045 call!45418)))

(declare-fun bm!45415 () Bool)

(declare-fun c!107922 () Bool)

(assert (=> bm!45415 (= call!45418 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107922 (Cons!23151 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000) Nil!23152) Nil!23152)))))

(declare-fun b!1074596 () Bool)

(assert (=> b!1074596 (= e!614047 e!614045)))

(assert (=> b!1074596 (= c!107922 (validKeyInArray!0 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129517 () Bool)

(declare-fun res!716515 () Bool)

(assert (=> d!129517 (=> res!716515 e!614046)))

(assert (=> d!129517 (= res!716515 (bvsge #b00000000000000000000000000000000 (size!33699 _keys!1163)))))

(assert (=> d!129517 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23152) e!614046)))

(assert (= (and d!129517 (not res!716515)) b!1074592))

(assert (= (and b!1074592 res!716514) b!1074593))

(assert (= (and b!1074592 res!716516) b!1074596))

(assert (= (and b!1074596 c!107922) b!1074594))

(assert (= (and b!1074596 (not c!107922)) b!1074595))

(assert (= (or b!1074594 b!1074595) bm!45415))

(assert (=> b!1074592 m!993379))

(assert (=> b!1074592 m!993379))

(assert (=> b!1074592 m!993381))

(assert (=> b!1074593 m!993379))

(assert (=> b!1074593 m!993379))

(declare-fun m!993447 () Bool)

(assert (=> b!1074593 m!993447))

(assert (=> bm!45415 m!993379))

(declare-fun m!993449 () Bool)

(assert (=> bm!45415 m!993449))

(assert (=> b!1074596 m!993379))

(assert (=> b!1074596 m!993379))

(assert (=> b!1074596 m!993381))

(assert (=> b!1074478 d!129517))

(declare-fun d!129519 () Bool)

(assert (=> d!129519 (= (getCurrentListMapNoExtraKeys!3872 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3872 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476758 () Unit!35381)

(declare-fun choose!1751 (array!68947 array!68945 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39787 V!39787 V!39787 V!39787 (_ BitVec 32) Int) Unit!35381)

(assert (=> d!129519 (= lt!476758 (choose!1751 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129519 (validMask!0 mask!1515)))

(assert (=> d!129519 (= (lemmaNoChangeToArrayThenSameMapNoExtras!888 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476758)))

(declare-fun bs!31665 () Bool)

(assert (= bs!31665 d!129519))

(assert (=> bs!31665 m!993351))

(assert (=> bs!31665 m!993349))

(declare-fun m!993451 () Bool)

(assert (=> bs!31665 m!993451))

(assert (=> bs!31665 m!993331))

(assert (=> b!1074475 d!129519))

(declare-fun b!1074621 () Bool)

(declare-fun e!614067 () Bool)

(declare-fun e!614069 () Bool)

(assert (=> b!1074621 (= e!614067 e!614069)))

(declare-fun c!107933 () Bool)

(assert (=> b!1074621 (= c!107933 (bvslt #b00000000000000000000000000000000 (size!33699 _keys!1163)))))

(declare-fun bm!45418 () Bool)

(declare-fun call!45421 () ListLongMap!14587)

(assert (=> bm!45418 (= call!45421 (getCurrentListMapNoExtraKeys!3872 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1074622 () Bool)

(declare-fun lt!476775 () Unit!35381)

(declare-fun lt!476776 () Unit!35381)

(assert (=> b!1074622 (= lt!476775 lt!476776)))

(declare-fun lt!476778 () (_ BitVec 64))

(declare-fun lt!476777 () V!39787)

(declare-fun lt!476779 () (_ BitVec 64))

(declare-fun lt!476774 () ListLongMap!14587)

(assert (=> b!1074622 (not (contains!6338 (+!3218 lt!476774 (tuple2!16619 lt!476779 lt!476777)) lt!476778))))

(declare-fun addStillNotContains!264 (ListLongMap!14587 (_ BitVec 64) V!39787 (_ BitVec 64)) Unit!35381)

(assert (=> b!1074622 (= lt!476776 (addStillNotContains!264 lt!476774 lt!476779 lt!476777 lt!476778))))

(assert (=> b!1074622 (= lt!476778 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1074622 (= lt!476777 (get!17224 (select (arr!33162 _values!955) #b00000000000000000000000000000000) (dynLambda!2043 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1074622 (= lt!476779 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074622 (= lt!476774 call!45421)))

(declare-fun e!614066 () ListLongMap!14587)

(assert (=> b!1074622 (= e!614066 (+!3218 call!45421 (tuple2!16619 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000) (get!17224 (select (arr!33162 _values!955) #b00000000000000000000000000000000) (dynLambda!2043 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!476773 () ListLongMap!14587)

(declare-fun b!1074624 () Bool)

(assert (=> b!1074624 (= e!614069 (= lt!476773 (getCurrentListMapNoExtraKeys!3872 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1074625 () Bool)

(declare-fun e!614064 () Bool)

(assert (=> b!1074625 (= e!614067 e!614064)))

(assert (=> b!1074625 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33699 _keys!1163)))))

(declare-fun res!716525 () Bool)

(assert (=> b!1074625 (= res!716525 (contains!6338 lt!476773 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074625 (=> (not res!716525) (not e!614064))))

(declare-fun b!1074626 () Bool)

(declare-fun e!614068 () ListLongMap!14587)

(assert (=> b!1074626 (= e!614068 e!614066)))

(declare-fun c!107934 () Bool)

(assert (=> b!1074626 (= c!107934 (validKeyInArray!0 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074627 () Bool)

(declare-fun e!614065 () Bool)

(assert (=> b!1074627 (= e!614065 e!614067)))

(declare-fun c!107932 () Bool)

(declare-fun e!614063 () Bool)

(assert (=> b!1074627 (= c!107932 e!614063)))

(declare-fun res!716526 () Bool)

(assert (=> b!1074627 (=> (not res!716526) (not e!614063))))

(assert (=> b!1074627 (= res!716526 (bvslt #b00000000000000000000000000000000 (size!33699 _keys!1163)))))

(declare-fun b!1074628 () Bool)

(declare-fun isEmpty!954 (ListLongMap!14587) Bool)

(assert (=> b!1074628 (= e!614069 (isEmpty!954 lt!476773))))

(declare-fun b!1074629 () Bool)

(assert (=> b!1074629 (= e!614063 (validKeyInArray!0 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074629 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1074630 () Bool)

(assert (=> b!1074630 (= e!614066 call!45421)))

(declare-fun b!1074623 () Bool)

(assert (=> b!1074623 (= e!614068 (ListLongMap!14588 Nil!23151))))

(declare-fun d!129521 () Bool)

(assert (=> d!129521 e!614065))

(declare-fun res!716528 () Bool)

(assert (=> d!129521 (=> (not res!716528) (not e!614065))))

(assert (=> d!129521 (= res!716528 (not (contains!6338 lt!476773 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129521 (= lt!476773 e!614068)))

(declare-fun c!107931 () Bool)

(assert (=> d!129521 (= c!107931 (bvsge #b00000000000000000000000000000000 (size!33699 _keys!1163)))))

(assert (=> d!129521 (validMask!0 mask!1515)))

(assert (=> d!129521 (= (getCurrentListMapNoExtraKeys!3872 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476773)))

(declare-fun b!1074631 () Bool)

(assert (=> b!1074631 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33699 _keys!1163)))))

(assert (=> b!1074631 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33698 _values!955)))))

(assert (=> b!1074631 (= e!614064 (= (apply!936 lt!476773 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000)) (get!17224 (select (arr!33162 _values!955) #b00000000000000000000000000000000) (dynLambda!2043 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1074632 () Bool)

(declare-fun res!716527 () Bool)

(assert (=> b!1074632 (=> (not res!716527) (not e!614065))))

(assert (=> b!1074632 (= res!716527 (not (contains!6338 lt!476773 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129521 c!107931) b!1074623))

(assert (= (and d!129521 (not c!107931)) b!1074626))

(assert (= (and b!1074626 c!107934) b!1074622))

(assert (= (and b!1074626 (not c!107934)) b!1074630))

(assert (= (or b!1074622 b!1074630) bm!45418))

(assert (= (and d!129521 res!716528) b!1074632))

(assert (= (and b!1074632 res!716527) b!1074627))

(assert (= (and b!1074627 res!716526) b!1074629))

(assert (= (and b!1074627 c!107932) b!1074625))

(assert (= (and b!1074627 (not c!107932)) b!1074621))

(assert (= (and b!1074625 res!716525) b!1074631))

(assert (= (and b!1074621 c!107933) b!1074624))

(assert (= (and b!1074621 (not c!107933)) b!1074628))

(declare-fun b_lambda!16811 () Bool)

(assert (=> (not b_lambda!16811) (not b!1074622)))

(assert (=> b!1074622 t!32504))

(declare-fun b_and!35081 () Bool)

(assert (= b_and!35079 (and (=> t!32504 result!14809) b_and!35081)))

(declare-fun b_lambda!16813 () Bool)

(assert (=> (not b_lambda!16813) (not b!1074631)))

(assert (=> b!1074631 t!32504))

(declare-fun b_and!35083 () Bool)

(assert (= b_and!35081 (and (=> t!32504 result!14809) b_and!35083)))

(assert (=> b!1074625 m!993379))

(assert (=> b!1074625 m!993379))

(declare-fun m!993453 () Bool)

(assert (=> b!1074625 m!993453))

(assert (=> b!1074626 m!993379))

(assert (=> b!1074626 m!993379))

(assert (=> b!1074626 m!993381))

(assert (=> b!1074629 m!993379))

(assert (=> b!1074629 m!993379))

(assert (=> b!1074629 m!993381))

(declare-fun m!993455 () Bool)

(assert (=> b!1074624 m!993455))

(declare-fun m!993457 () Bool)

(assert (=> b!1074628 m!993457))

(declare-fun m!993459 () Bool)

(assert (=> b!1074632 m!993459))

(assert (=> bm!45418 m!993455))

(assert (=> b!1074631 m!993393))

(assert (=> b!1074631 m!993395))

(assert (=> b!1074631 m!993397))

(assert (=> b!1074631 m!993379))

(assert (=> b!1074631 m!993379))

(declare-fun m!993461 () Bool)

(assert (=> b!1074631 m!993461))

(assert (=> b!1074631 m!993395))

(assert (=> b!1074631 m!993393))

(declare-fun m!993463 () Bool)

(assert (=> d!129521 m!993463))

(assert (=> d!129521 m!993331))

(assert (=> b!1074622 m!993393))

(assert (=> b!1074622 m!993395))

(assert (=> b!1074622 m!993397))

(assert (=> b!1074622 m!993395))

(declare-fun m!993465 () Bool)

(assert (=> b!1074622 m!993465))

(declare-fun m!993467 () Bool)

(assert (=> b!1074622 m!993467))

(assert (=> b!1074622 m!993393))

(assert (=> b!1074622 m!993465))

(assert (=> b!1074622 m!993379))

(declare-fun m!993469 () Bool)

(assert (=> b!1074622 m!993469))

(declare-fun m!993471 () Bool)

(assert (=> b!1074622 m!993471))

(assert (=> b!1074475 d!129521))

(declare-fun b!1074633 () Bool)

(declare-fun e!614074 () Bool)

(declare-fun e!614076 () Bool)

(assert (=> b!1074633 (= e!614074 e!614076)))

(declare-fun c!107937 () Bool)

(assert (=> b!1074633 (= c!107937 (bvslt #b00000000000000000000000000000000 (size!33699 _keys!1163)))))

(declare-fun bm!45419 () Bool)

(declare-fun call!45422 () ListLongMap!14587)

(assert (=> bm!45419 (= call!45422 (getCurrentListMapNoExtraKeys!3872 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1074634 () Bool)

(declare-fun lt!476782 () Unit!35381)

(declare-fun lt!476783 () Unit!35381)

(assert (=> b!1074634 (= lt!476782 lt!476783)))

(declare-fun lt!476784 () V!39787)

(declare-fun lt!476786 () (_ BitVec 64))

(declare-fun lt!476781 () ListLongMap!14587)

(declare-fun lt!476785 () (_ BitVec 64))

(assert (=> b!1074634 (not (contains!6338 (+!3218 lt!476781 (tuple2!16619 lt!476786 lt!476784)) lt!476785))))

(assert (=> b!1074634 (= lt!476783 (addStillNotContains!264 lt!476781 lt!476786 lt!476784 lt!476785))))

(assert (=> b!1074634 (= lt!476785 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1074634 (= lt!476784 (get!17224 (select (arr!33162 _values!955) #b00000000000000000000000000000000) (dynLambda!2043 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1074634 (= lt!476786 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074634 (= lt!476781 call!45422)))

(declare-fun e!614073 () ListLongMap!14587)

(assert (=> b!1074634 (= e!614073 (+!3218 call!45422 (tuple2!16619 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000) (get!17224 (select (arr!33162 _values!955) #b00000000000000000000000000000000) (dynLambda!2043 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1074636 () Bool)

(declare-fun lt!476780 () ListLongMap!14587)

(assert (=> b!1074636 (= e!614076 (= lt!476780 (getCurrentListMapNoExtraKeys!3872 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1074637 () Bool)

(declare-fun e!614071 () Bool)

(assert (=> b!1074637 (= e!614074 e!614071)))

(assert (=> b!1074637 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33699 _keys!1163)))))

(declare-fun res!716529 () Bool)

(assert (=> b!1074637 (= res!716529 (contains!6338 lt!476780 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074637 (=> (not res!716529) (not e!614071))))

(declare-fun b!1074638 () Bool)

(declare-fun e!614075 () ListLongMap!14587)

(assert (=> b!1074638 (= e!614075 e!614073)))

(declare-fun c!107938 () Bool)

(assert (=> b!1074638 (= c!107938 (validKeyInArray!0 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074639 () Bool)

(declare-fun e!614072 () Bool)

(assert (=> b!1074639 (= e!614072 e!614074)))

(declare-fun c!107936 () Bool)

(declare-fun e!614070 () Bool)

(assert (=> b!1074639 (= c!107936 e!614070)))

(declare-fun res!716530 () Bool)

(assert (=> b!1074639 (=> (not res!716530) (not e!614070))))

(assert (=> b!1074639 (= res!716530 (bvslt #b00000000000000000000000000000000 (size!33699 _keys!1163)))))

(declare-fun b!1074640 () Bool)

(assert (=> b!1074640 (= e!614076 (isEmpty!954 lt!476780))))

(declare-fun b!1074641 () Bool)

(assert (=> b!1074641 (= e!614070 (validKeyInArray!0 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074641 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1074642 () Bool)

(assert (=> b!1074642 (= e!614073 call!45422)))

(declare-fun b!1074635 () Bool)

(assert (=> b!1074635 (= e!614075 (ListLongMap!14588 Nil!23151))))

(declare-fun d!129523 () Bool)

(assert (=> d!129523 e!614072))

(declare-fun res!716532 () Bool)

(assert (=> d!129523 (=> (not res!716532) (not e!614072))))

(assert (=> d!129523 (= res!716532 (not (contains!6338 lt!476780 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129523 (= lt!476780 e!614075)))

(declare-fun c!107935 () Bool)

(assert (=> d!129523 (= c!107935 (bvsge #b00000000000000000000000000000000 (size!33699 _keys!1163)))))

(assert (=> d!129523 (validMask!0 mask!1515)))

(assert (=> d!129523 (= (getCurrentListMapNoExtraKeys!3872 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476780)))

(declare-fun b!1074643 () Bool)

(assert (=> b!1074643 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33699 _keys!1163)))))

(assert (=> b!1074643 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33698 _values!955)))))

(assert (=> b!1074643 (= e!614071 (= (apply!936 lt!476780 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000)) (get!17224 (select (arr!33162 _values!955) #b00000000000000000000000000000000) (dynLambda!2043 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1074644 () Bool)

(declare-fun res!716531 () Bool)

(assert (=> b!1074644 (=> (not res!716531) (not e!614072))))

(assert (=> b!1074644 (= res!716531 (not (contains!6338 lt!476780 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129523 c!107935) b!1074635))

(assert (= (and d!129523 (not c!107935)) b!1074638))

(assert (= (and b!1074638 c!107938) b!1074634))

(assert (= (and b!1074638 (not c!107938)) b!1074642))

(assert (= (or b!1074634 b!1074642) bm!45419))

(assert (= (and d!129523 res!716532) b!1074644))

(assert (= (and b!1074644 res!716531) b!1074639))

(assert (= (and b!1074639 res!716530) b!1074641))

(assert (= (and b!1074639 c!107936) b!1074637))

(assert (= (and b!1074639 (not c!107936)) b!1074633))

(assert (= (and b!1074637 res!716529) b!1074643))

(assert (= (and b!1074633 c!107937) b!1074636))

(assert (= (and b!1074633 (not c!107937)) b!1074640))

(declare-fun b_lambda!16815 () Bool)

(assert (=> (not b_lambda!16815) (not b!1074634)))

(assert (=> b!1074634 t!32504))

(declare-fun b_and!35085 () Bool)

(assert (= b_and!35083 (and (=> t!32504 result!14809) b_and!35085)))

(declare-fun b_lambda!16817 () Bool)

(assert (=> (not b_lambda!16817) (not b!1074643)))

(assert (=> b!1074643 t!32504))

(declare-fun b_and!35087 () Bool)

(assert (= b_and!35085 (and (=> t!32504 result!14809) b_and!35087)))

(assert (=> b!1074637 m!993379))

(assert (=> b!1074637 m!993379))

(declare-fun m!993473 () Bool)

(assert (=> b!1074637 m!993473))

(assert (=> b!1074638 m!993379))

(assert (=> b!1074638 m!993379))

(assert (=> b!1074638 m!993381))

(assert (=> b!1074641 m!993379))

(assert (=> b!1074641 m!993379))

(assert (=> b!1074641 m!993381))

(declare-fun m!993475 () Bool)

(assert (=> b!1074636 m!993475))

(declare-fun m!993477 () Bool)

(assert (=> b!1074640 m!993477))

(declare-fun m!993479 () Bool)

(assert (=> b!1074644 m!993479))

(assert (=> bm!45419 m!993475))

(assert (=> b!1074643 m!993393))

(assert (=> b!1074643 m!993395))

(assert (=> b!1074643 m!993397))

(assert (=> b!1074643 m!993379))

(assert (=> b!1074643 m!993379))

(declare-fun m!993481 () Bool)

(assert (=> b!1074643 m!993481))

(assert (=> b!1074643 m!993395))

(assert (=> b!1074643 m!993393))

(declare-fun m!993483 () Bool)

(assert (=> d!129523 m!993483))

(assert (=> d!129523 m!993331))

(assert (=> b!1074634 m!993393))

(assert (=> b!1074634 m!993395))

(assert (=> b!1074634 m!993397))

(assert (=> b!1074634 m!993395))

(declare-fun m!993485 () Bool)

(assert (=> b!1074634 m!993485))

(declare-fun m!993487 () Bool)

(assert (=> b!1074634 m!993487))

(assert (=> b!1074634 m!993393))

(assert (=> b!1074634 m!993485))

(assert (=> b!1074634 m!993379))

(declare-fun m!993489 () Bool)

(assert (=> b!1074634 m!993489))

(declare-fun m!993491 () Bool)

(assert (=> b!1074634 m!993491))

(assert (=> b!1074475 d!129523))

(declare-fun d!129525 () Bool)

(assert (=> d!129525 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95044 d!129525))

(declare-fun d!129527 () Bool)

(assert (=> d!129527 (= (array_inv!25630 _values!955) (bvsge (size!33698 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95044 d!129527))

(declare-fun d!129529 () Bool)

(assert (=> d!129529 (= (array_inv!25631 _keys!1163) (bvsge (size!33699 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95044 d!129529))

(declare-fun b!1074646 () Bool)

(declare-fun e!614079 () Bool)

(declare-fun call!45427 () Bool)

(assert (=> b!1074646 (= e!614079 (not call!45427))))

(declare-fun b!1074647 () Bool)

(declare-fun e!614081 () Unit!35381)

(declare-fun Unit!35386 () Unit!35381)

(assert (=> b!1074647 (= e!614081 Unit!35386)))

(declare-fun b!1074648 () Bool)

(declare-fun e!614087 () Bool)

(assert (=> b!1074648 (= e!614087 (validKeyInArray!0 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074649 () Bool)

(declare-fun e!614077 () ListLongMap!14587)

(declare-fun call!45428 () ListLongMap!14587)

(assert (=> b!1074649 (= e!614077 call!45428)))

(declare-fun b!1074650 () Bool)

(declare-fun e!614082 () Bool)

(declare-fun lt!476801 () ListLongMap!14587)

(assert (=> b!1074650 (= e!614082 (= (apply!936 lt!476801 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000)) (get!17224 (select (arr!33162 _values!955) #b00000000000000000000000000000000) (dynLambda!2043 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1074650 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33698 _values!955)))))

(assert (=> b!1074650 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33699 _keys!1163)))))

(declare-fun bm!45420 () Bool)

(declare-fun call!45425 () Bool)

(assert (=> bm!45420 (= call!45425 (contains!6338 lt!476801 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45421 () Bool)

(declare-fun call!45426 () ListLongMap!14587)

(assert (=> bm!45421 (= call!45426 (getCurrentListMapNoExtraKeys!3872 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074651 () Bool)

(declare-fun c!107944 () Bool)

(assert (=> b!1074651 (= c!107944 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!614089 () ListLongMap!14587)

(assert (=> b!1074651 (= e!614089 e!614077)))

(declare-fun b!1074652 () Bool)

(declare-fun e!614088 () Bool)

(assert (=> b!1074652 (= e!614088 e!614082)))

(declare-fun res!716541 () Bool)

(assert (=> b!1074652 (=> (not res!716541) (not e!614082))))

(assert (=> b!1074652 (= res!716541 (contains!6338 lt!476801 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074652 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33699 _keys!1163)))))

(declare-fun b!1074653 () Bool)

(declare-fun call!45424 () ListLongMap!14587)

(assert (=> b!1074653 (= e!614089 call!45424)))

(declare-fun b!1074654 () Bool)

(declare-fun lt!476794 () Unit!35381)

(assert (=> b!1074654 (= e!614081 lt!476794)))

(declare-fun lt!476790 () ListLongMap!14587)

(assert (=> b!1074654 (= lt!476790 (getCurrentListMapNoExtraKeys!3872 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476792 () (_ BitVec 64))

(assert (=> b!1074654 (= lt!476792 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476805 () (_ BitVec 64))

(assert (=> b!1074654 (= lt!476805 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476802 () Unit!35381)

(assert (=> b!1074654 (= lt!476802 (addStillContains!649 lt!476790 lt!476792 zeroValueAfter!47 lt!476805))))

(assert (=> b!1074654 (contains!6338 (+!3218 lt!476790 (tuple2!16619 lt!476792 zeroValueAfter!47)) lt!476805)))

(declare-fun lt!476793 () Unit!35381)

(assert (=> b!1074654 (= lt!476793 lt!476802)))

(declare-fun lt!476796 () ListLongMap!14587)

(assert (=> b!1074654 (= lt!476796 (getCurrentListMapNoExtraKeys!3872 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476798 () (_ BitVec 64))

(assert (=> b!1074654 (= lt!476798 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476803 () (_ BitVec 64))

(assert (=> b!1074654 (= lt!476803 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476808 () Unit!35381)

(assert (=> b!1074654 (= lt!476808 (addApplyDifferent!509 lt!476796 lt!476798 minValue!907 lt!476803))))

(assert (=> b!1074654 (= (apply!936 (+!3218 lt!476796 (tuple2!16619 lt!476798 minValue!907)) lt!476803) (apply!936 lt!476796 lt!476803))))

(declare-fun lt!476791 () Unit!35381)

(assert (=> b!1074654 (= lt!476791 lt!476808)))

(declare-fun lt!476797 () ListLongMap!14587)

(assert (=> b!1074654 (= lt!476797 (getCurrentListMapNoExtraKeys!3872 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476804 () (_ BitVec 64))

(assert (=> b!1074654 (= lt!476804 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476806 () (_ BitVec 64))

(assert (=> b!1074654 (= lt!476806 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476795 () Unit!35381)

(assert (=> b!1074654 (= lt!476795 (addApplyDifferent!509 lt!476797 lt!476804 zeroValueAfter!47 lt!476806))))

(assert (=> b!1074654 (= (apply!936 (+!3218 lt!476797 (tuple2!16619 lt!476804 zeroValueAfter!47)) lt!476806) (apply!936 lt!476797 lt!476806))))

(declare-fun lt!476800 () Unit!35381)

(assert (=> b!1074654 (= lt!476800 lt!476795)))

(declare-fun lt!476807 () ListLongMap!14587)

(assert (=> b!1074654 (= lt!476807 (getCurrentListMapNoExtraKeys!3872 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476787 () (_ BitVec 64))

(assert (=> b!1074654 (= lt!476787 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476788 () (_ BitVec 64))

(assert (=> b!1074654 (= lt!476788 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074654 (= lt!476794 (addApplyDifferent!509 lt!476807 lt!476787 minValue!907 lt!476788))))

(assert (=> b!1074654 (= (apply!936 (+!3218 lt!476807 (tuple2!16619 lt!476787 minValue!907)) lt!476788) (apply!936 lt!476807 lt!476788))))

(declare-fun b!1074655 () Bool)

(declare-fun e!614086 () Bool)

(declare-fun e!614078 () Bool)

(assert (=> b!1074655 (= e!614086 e!614078)))

(declare-fun res!716535 () Bool)

(assert (=> b!1074655 (= res!716535 call!45425)))

(assert (=> b!1074655 (=> (not res!716535) (not e!614078))))

(declare-fun b!1074656 () Bool)

(declare-fun e!614083 () Bool)

(assert (=> b!1074656 (= e!614083 (= (apply!936 lt!476801 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun bm!45422 () Bool)

(declare-fun call!45423 () ListLongMap!14587)

(assert (=> bm!45422 (= call!45424 call!45423)))

(declare-fun b!1074657 () Bool)

(declare-fun e!614080 () Bool)

(assert (=> b!1074657 (= e!614080 e!614086)))

(declare-fun c!107943 () Bool)

(assert (=> b!1074657 (= c!107943 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!129531 () Bool)

(assert (=> d!129531 e!614080))

(declare-fun res!716538 () Bool)

(assert (=> d!129531 (=> (not res!716538) (not e!614080))))

(assert (=> d!129531 (= res!716538 (or (bvsge #b00000000000000000000000000000000 (size!33699 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33699 _keys!1163)))))))

(declare-fun lt!476799 () ListLongMap!14587)

(assert (=> d!129531 (= lt!476801 lt!476799)))

(declare-fun lt!476789 () Unit!35381)

(assert (=> d!129531 (= lt!476789 e!614081)))

(declare-fun c!107941 () Bool)

(declare-fun e!614085 () Bool)

(assert (=> d!129531 (= c!107941 e!614085)))

(declare-fun res!716533 () Bool)

(assert (=> d!129531 (=> (not res!716533) (not e!614085))))

(assert (=> d!129531 (= res!716533 (bvslt #b00000000000000000000000000000000 (size!33699 _keys!1163)))))

(declare-fun e!614084 () ListLongMap!14587)

(assert (=> d!129531 (= lt!476799 e!614084)))

(declare-fun c!107942 () Bool)

(assert (=> d!129531 (= c!107942 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129531 (validMask!0 mask!1515)))

(assert (=> d!129531 (= (getCurrentListMap!4179 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476801)))

(declare-fun b!1074645 () Bool)

(assert (=> b!1074645 (= e!614084 (+!3218 call!45423 (tuple2!16619 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun bm!45423 () Bool)

(assert (=> bm!45423 (= call!45427 (contains!6338 lt!476801 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1074658 () Bool)

(assert (=> b!1074658 (= e!614085 (validKeyInArray!0 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074659 () Bool)

(assert (=> b!1074659 (= e!614077 call!45424)))

(declare-fun bm!45424 () Bool)

(declare-fun call!45429 () ListLongMap!14587)

(assert (=> bm!45424 (= call!45428 call!45429)))

(declare-fun b!1074660 () Bool)

(declare-fun res!716537 () Bool)

(assert (=> b!1074660 (=> (not res!716537) (not e!614080))))

(assert (=> b!1074660 (= res!716537 e!614088)))

(declare-fun res!716534 () Bool)

(assert (=> b!1074660 (=> res!716534 e!614088)))

(assert (=> b!1074660 (= res!716534 (not e!614087))))

(declare-fun res!716540 () Bool)

(assert (=> b!1074660 (=> (not res!716540) (not e!614087))))

(assert (=> b!1074660 (= res!716540 (bvslt #b00000000000000000000000000000000 (size!33699 _keys!1163)))))

(declare-fun b!1074661 () Bool)

(assert (=> b!1074661 (= e!614084 e!614089)))

(declare-fun c!107939 () Bool)

(assert (=> b!1074661 (= c!107939 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45425 () Bool)

(assert (=> bm!45425 (= call!45423 (+!3218 (ite c!107942 call!45426 (ite c!107939 call!45429 call!45428)) (ite (or c!107942 c!107939) (tuple2!16619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16619 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1074662 () Bool)

(assert (=> b!1074662 (= e!614079 e!614083)))

(declare-fun res!716536 () Bool)

(assert (=> b!1074662 (= res!716536 call!45427)))

(assert (=> b!1074662 (=> (not res!716536) (not e!614083))))

(declare-fun b!1074663 () Bool)

(declare-fun res!716539 () Bool)

(assert (=> b!1074663 (=> (not res!716539) (not e!614080))))

(assert (=> b!1074663 (= res!716539 e!614079)))

(declare-fun c!107940 () Bool)

(assert (=> b!1074663 (= c!107940 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1074664 () Bool)

(assert (=> b!1074664 (= e!614078 (= (apply!936 lt!476801 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun bm!45426 () Bool)

(assert (=> bm!45426 (= call!45429 call!45426)))

(declare-fun b!1074665 () Bool)

(assert (=> b!1074665 (= e!614086 (not call!45425))))

(assert (= (and d!129531 c!107942) b!1074645))

(assert (= (and d!129531 (not c!107942)) b!1074661))

(assert (= (and b!1074661 c!107939) b!1074653))

(assert (= (and b!1074661 (not c!107939)) b!1074651))

(assert (= (and b!1074651 c!107944) b!1074659))

(assert (= (and b!1074651 (not c!107944)) b!1074649))

(assert (= (or b!1074659 b!1074649) bm!45424))

(assert (= (or b!1074653 bm!45424) bm!45426))

(assert (= (or b!1074653 b!1074659) bm!45422))

(assert (= (or b!1074645 bm!45426) bm!45421))

(assert (= (or b!1074645 bm!45422) bm!45425))

(assert (= (and d!129531 res!716533) b!1074658))

(assert (= (and d!129531 c!107941) b!1074654))

(assert (= (and d!129531 (not c!107941)) b!1074647))

(assert (= (and d!129531 res!716538) b!1074660))

(assert (= (and b!1074660 res!716540) b!1074648))

(assert (= (and b!1074660 (not res!716534)) b!1074652))

(assert (= (and b!1074652 res!716541) b!1074650))

(assert (= (and b!1074660 res!716537) b!1074663))

(assert (= (and b!1074663 c!107940) b!1074662))

(assert (= (and b!1074663 (not c!107940)) b!1074646))

(assert (= (and b!1074662 res!716536) b!1074656))

(assert (= (or b!1074662 b!1074646) bm!45423))

(assert (= (and b!1074663 res!716539) b!1074657))

(assert (= (and b!1074657 c!107943) b!1074655))

(assert (= (and b!1074657 (not c!107943)) b!1074665))

(assert (= (and b!1074655 res!716535) b!1074664))

(assert (= (or b!1074655 b!1074665) bm!45420))

(declare-fun b_lambda!16819 () Bool)

(assert (=> (not b_lambda!16819) (not b!1074650)))

(assert (=> b!1074650 t!32504))

(declare-fun b_and!35089 () Bool)

(assert (= b_and!35087 (and (=> t!32504 result!14809) b_and!35089)))

(assert (=> b!1074648 m!993379))

(assert (=> b!1074648 m!993379))

(assert (=> b!1074648 m!993381))

(declare-fun m!993493 () Bool)

(assert (=> b!1074664 m!993493))

(declare-fun m!993495 () Bool)

(assert (=> b!1074656 m!993495))

(declare-fun m!993497 () Bool)

(assert (=> bm!45420 m!993497))

(assert (=> b!1074658 m!993379))

(assert (=> b!1074658 m!993379))

(assert (=> b!1074658 m!993381))

(declare-fun m!993499 () Bool)

(assert (=> b!1074645 m!993499))

(declare-fun m!993501 () Bool)

(assert (=> bm!45423 m!993501))

(assert (=> b!1074650 m!993393))

(assert (=> b!1074650 m!993395))

(assert (=> b!1074650 m!993397))

(assert (=> b!1074650 m!993379))

(declare-fun m!993503 () Bool)

(assert (=> b!1074650 m!993503))

(assert (=> b!1074650 m!993393))

(assert (=> b!1074650 m!993395))

(assert (=> b!1074650 m!993379))

(assert (=> b!1074654 m!993349))

(declare-fun m!993505 () Bool)

(assert (=> b!1074654 m!993505))

(declare-fun m!993507 () Bool)

(assert (=> b!1074654 m!993507))

(declare-fun m!993509 () Bool)

(assert (=> b!1074654 m!993509))

(declare-fun m!993511 () Bool)

(assert (=> b!1074654 m!993511))

(declare-fun m!993513 () Bool)

(assert (=> b!1074654 m!993513))

(declare-fun m!993515 () Bool)

(assert (=> b!1074654 m!993515))

(declare-fun m!993517 () Bool)

(assert (=> b!1074654 m!993517))

(assert (=> b!1074654 m!993509))

(declare-fun m!993519 () Bool)

(assert (=> b!1074654 m!993519))

(assert (=> b!1074654 m!993515))

(declare-fun m!993521 () Bool)

(assert (=> b!1074654 m!993521))

(assert (=> b!1074654 m!993513))

(declare-fun m!993523 () Bool)

(assert (=> b!1074654 m!993523))

(assert (=> b!1074654 m!993505))

(declare-fun m!993525 () Bool)

(assert (=> b!1074654 m!993525))

(declare-fun m!993527 () Bool)

(assert (=> b!1074654 m!993527))

(declare-fun m!993529 () Bool)

(assert (=> b!1074654 m!993529))

(declare-fun m!993531 () Bool)

(assert (=> b!1074654 m!993531))

(declare-fun m!993533 () Bool)

(assert (=> b!1074654 m!993533))

(assert (=> b!1074654 m!993379))

(assert (=> d!129531 m!993331))

(assert (=> b!1074652 m!993379))

(assert (=> b!1074652 m!993379))

(declare-fun m!993535 () Bool)

(assert (=> b!1074652 m!993535))

(declare-fun m!993537 () Bool)

(assert (=> bm!45425 m!993537))

(assert (=> bm!45421 m!993349))

(assert (=> b!1074473 d!129531))

(declare-fun b!1074674 () Bool)

(declare-fun e!614097 () Bool)

(declare-fun e!614098 () Bool)

(assert (=> b!1074674 (= e!614097 e!614098)))

(declare-fun c!107947 () Bool)

(assert (=> b!1074674 (= c!107947 (validKeyInArray!0 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129533 () Bool)

(declare-fun res!716547 () Bool)

(assert (=> d!129533 (=> res!716547 e!614097)))

(assert (=> d!129533 (= res!716547 (bvsge #b00000000000000000000000000000000 (size!33699 _keys!1163)))))

(assert (=> d!129533 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!614097)))

(declare-fun bm!45429 () Bool)

(declare-fun call!45432 () Bool)

(assert (=> bm!45429 (= call!45432 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1074675 () Bool)

(assert (=> b!1074675 (= e!614098 call!45432)))

(declare-fun b!1074676 () Bool)

(declare-fun e!614096 () Bool)

(assert (=> b!1074676 (= e!614098 e!614096)))

(declare-fun lt!476816 () (_ BitVec 64))

(assert (=> b!1074676 (= lt!476816 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476817 () Unit!35381)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68947 (_ BitVec 64) (_ BitVec 32)) Unit!35381)

(assert (=> b!1074676 (= lt!476817 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!476816 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1074676 (arrayContainsKey!0 _keys!1163 lt!476816 #b00000000000000000000000000000000)))

(declare-fun lt!476815 () Unit!35381)

(assert (=> b!1074676 (= lt!476815 lt!476817)))

(declare-fun res!716546 () Bool)

(declare-datatypes ((SeekEntryResult!9889 0))(
  ( (MissingZero!9889 (index!41927 (_ BitVec 32))) (Found!9889 (index!41928 (_ BitVec 32))) (Intermediate!9889 (undefined!10701 Bool) (index!41929 (_ BitVec 32)) (x!96306 (_ BitVec 32))) (Undefined!9889) (MissingVacant!9889 (index!41930 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68947 (_ BitVec 32)) SeekEntryResult!9889)

(assert (=> b!1074676 (= res!716546 (= (seekEntryOrOpen!0 (select (arr!33163 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9889 #b00000000000000000000000000000000)))))

(assert (=> b!1074676 (=> (not res!716546) (not e!614096))))

(declare-fun b!1074677 () Bool)

(assert (=> b!1074677 (= e!614096 call!45432)))

(assert (= (and d!129533 (not res!716547)) b!1074674))

(assert (= (and b!1074674 c!107947) b!1074676))

(assert (= (and b!1074674 (not c!107947)) b!1074675))

(assert (= (and b!1074676 res!716546) b!1074677))

(assert (= (or b!1074677 b!1074675) bm!45429))

(assert (=> b!1074674 m!993379))

(assert (=> b!1074674 m!993379))

(assert (=> b!1074674 m!993381))

(declare-fun m!993539 () Bool)

(assert (=> bm!45429 m!993539))

(assert (=> b!1074676 m!993379))

(declare-fun m!993541 () Bool)

(assert (=> b!1074676 m!993541))

(declare-fun m!993543 () Bool)

(assert (=> b!1074676 m!993543))

(assert (=> b!1074676 m!993379))

(declare-fun m!993545 () Bool)

(assert (=> b!1074676 m!993545))

(assert (=> b!1074474 d!129533))

(declare-fun mapIsEmpty!40714 () Bool)

(declare-fun mapRes!40714 () Bool)

(assert (=> mapIsEmpty!40714 mapRes!40714))

(declare-fun b!1074684 () Bool)

(declare-fun e!614104 () Bool)

(assert (=> b!1074684 (= e!614104 tp_is_empty!25989)))

(declare-fun b!1074685 () Bool)

(declare-fun e!614103 () Bool)

(assert (=> b!1074685 (= e!614103 tp_is_empty!25989)))

(declare-fun mapNonEmpty!40714 () Bool)

(declare-fun tp!78023 () Bool)

(assert (=> mapNonEmpty!40714 (= mapRes!40714 (and tp!78023 e!614104))))

(declare-fun mapKey!40714 () (_ BitVec 32))

(declare-fun mapValue!40714 () ValueCell!12291)

(declare-fun mapRest!40714 () (Array (_ BitVec 32) ValueCell!12291))

(assert (=> mapNonEmpty!40714 (= mapRest!40708 (store mapRest!40714 mapKey!40714 mapValue!40714))))

(declare-fun condMapEmpty!40714 () Bool)

(declare-fun mapDefault!40714 () ValueCell!12291)

(assert (=> mapNonEmpty!40708 (= condMapEmpty!40714 (= mapRest!40708 ((as const (Array (_ BitVec 32) ValueCell!12291)) mapDefault!40714)))))

(assert (=> mapNonEmpty!40708 (= tp!78014 (and e!614103 mapRes!40714))))

(assert (= (and mapNonEmpty!40708 condMapEmpty!40714) mapIsEmpty!40714))

(assert (= (and mapNonEmpty!40708 (not condMapEmpty!40714)) mapNonEmpty!40714))

(assert (= (and mapNonEmpty!40714 ((_ is ValueCellFull!12291) mapValue!40714)) b!1074684))

(assert (= (and mapNonEmpty!40708 ((_ is ValueCellFull!12291) mapDefault!40714)) b!1074685))

(declare-fun m!993547 () Bool)

(assert (=> mapNonEmpty!40714 m!993547))

(declare-fun b_lambda!16821 () Bool)

(assert (= b_lambda!16819 (or (and start!95044 b_free!22179) b_lambda!16821)))

(declare-fun b_lambda!16823 () Bool)

(assert (= b_lambda!16817 (or (and start!95044 b_free!22179) b_lambda!16823)))

(declare-fun b_lambda!16825 () Bool)

(assert (= b_lambda!16809 (or (and start!95044 b_free!22179) b_lambda!16825)))

(declare-fun b_lambda!16827 () Bool)

(assert (= b_lambda!16811 (or (and start!95044 b_free!22179) b_lambda!16827)))

(declare-fun b_lambda!16829 () Bool)

(assert (= b_lambda!16813 (or (and start!95044 b_free!22179) b_lambda!16829)))

(declare-fun b_lambda!16831 () Bool)

(assert (= b_lambda!16815 (or (and start!95044 b_free!22179) b_lambda!16831)))

(check-sat (not b!1074644) (not b!1074625) (not b!1074643) (not bm!45423) (not d!129531) (not b!1074593) (not bm!45429) (not d!129519) tp_is_empty!25989 (not b!1074553) (not b!1074560) (not b!1074645) b_and!35089 (not b!1074622) (not b_lambda!16821) (not b!1074640) (not b!1074631) (not b!1074652) (not b!1074632) (not b_lambda!16825) (not b!1074654) (not b!1074664) (not d!129521) (not b!1074637) (not b!1074676) (not b!1074656) (not b_lambda!16827) (not b!1074572) (not b_lambda!16831) (not bm!45420) (not b!1074658) (not b!1074580) (not b!1074596) (not d!129513) (not b!1074650) (not b!1074674) (not b!1074641) (not bm!45415) (not b!1074636) (not b!1074581) (not bm!45409) (not b!1074629) (not b!1074626) (not b!1074592) (not b_next!22179) (not b!1074624) (not b!1074564) (not b!1074562) (not bm!45421) (not b!1074648) (not bm!45419) (not b!1074634) (not bm!45406) (not bm!45407) (not d!129515) (not mapNonEmpty!40714) (not b!1074558) (not b!1074638) (not bm!45425) (not b_lambda!16823) (not b!1074566) (not bm!45411) (not bm!45418) (not b!1074556) (not d!129523) (not b!1074628) (not b_lambda!16829))
(check-sat b_and!35089 (not b_next!22179))
