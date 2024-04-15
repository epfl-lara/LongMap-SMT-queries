; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95150 () Bool)

(assert start!95150)

(declare-fun b_free!22213 () Bool)

(declare-fun b_next!22213 () Bool)

(assert (=> start!95150 (= b_free!22213 (not b_next!22213))))

(declare-fun tp!78127 () Bool)

(declare-fun b_and!35129 () Bool)

(assert (=> start!95150 (= tp!78127 b_and!35129)))

(declare-fun mapNonEmpty!40771 () Bool)

(declare-fun mapRes!40771 () Bool)

(declare-fun tp!78128 () Bool)

(declare-fun e!614644 () Bool)

(assert (=> mapNonEmpty!40771 (= mapRes!40771 (and tp!78128 e!614644))))

(declare-datatypes ((V!39833 0))(
  ( (V!39834 (val!13062 Int)) )
))
(declare-datatypes ((ValueCell!12308 0))(
  ( (ValueCellFull!12308 (v!15686 V!39833)) (EmptyCell!12308) )
))
(declare-datatypes ((array!68950 0))(
  ( (array!68951 (arr!33161 (Array (_ BitVec 32) ValueCell!12308)) (size!33699 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68950)

(declare-fun mapValue!40771 () ValueCell!12308)

(declare-fun mapKey!40771 () (_ BitVec 32))

(declare-fun mapRest!40771 () (Array (_ BitVec 32) ValueCell!12308))

(assert (=> mapNonEmpty!40771 (= (arr!33161 _values!955) (store mapRest!40771 mapKey!40771 mapValue!40771))))

(declare-fun b!1075446 () Bool)

(declare-fun res!716942 () Bool)

(declare-fun e!614643 () Bool)

(assert (=> b!1075446 (=> (not res!716942) (not e!614643))))

(declare-datatypes ((array!68952 0))(
  ( (array!68953 (arr!33162 (Array (_ BitVec 32) (_ BitVec 64))) (size!33700 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68952)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68952 (_ BitVec 32)) Bool)

(assert (=> b!1075446 (= res!716942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!40771 () Bool)

(assert (=> mapIsEmpty!40771 mapRes!40771))

(declare-fun b!1075448 () Bool)

(declare-fun res!716940 () Bool)

(assert (=> b!1075448 (=> (not res!716940) (not e!614643))))

(declare-datatypes ((List!23226 0))(
  ( (Nil!23223) (Cons!23222 (h!24431 (_ BitVec 64)) (t!32570 List!23226)) )
))
(declare-fun arrayNoDuplicates!0 (array!68952 (_ BitVec 32) List!23226) Bool)

(assert (=> b!1075448 (= res!716940 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23223))))

(declare-fun b!1075449 () Bool)

(declare-fun res!716939 () Bool)

(assert (=> b!1075449 (=> (not res!716939) (not e!614643))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1075449 (= res!716939 (and (= (size!33699 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33700 _keys!1163) (size!33699 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1075450 () Bool)

(declare-fun tp_is_empty!26023 () Bool)

(assert (=> b!1075450 (= e!614644 tp_is_empty!26023)))

(declare-fun b!1075451 () Bool)

(declare-fun e!614642 () Bool)

(assert (=> b!1075451 (= e!614642 tp_is_empty!26023)))

(declare-fun b!1075447 () Bool)

(declare-fun e!614641 () Bool)

(assert (=> b!1075447 (= e!614643 (not e!614641))))

(declare-fun res!716943 () Bool)

(assert (=> b!1075447 (=> res!716943 e!614641)))

(assert (=> b!1075447 (= res!716943 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16706 0))(
  ( (tuple2!16707 (_1!8364 (_ BitVec 64)) (_2!8364 V!39833)) )
))
(declare-datatypes ((List!23227 0))(
  ( (Nil!23224) (Cons!23223 (h!24432 tuple2!16706) (t!32571 List!23227)) )
))
(declare-datatypes ((ListLongMap!14675 0))(
  ( (ListLongMap!14676 (toList!7353 List!23227)) )
))
(declare-fun lt!477305 () ListLongMap!14675)

(declare-fun lt!477304 () ListLongMap!14675)

(assert (=> b!1075447 (= lt!477305 lt!477304)))

(declare-fun zeroValueBefore!47 () V!39833)

(declare-fun minValue!907 () V!39833)

(declare-datatypes ((Unit!35254 0))(
  ( (Unit!35255) )
))
(declare-fun lt!477306 () Unit!35254)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39833)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!902 (array!68952 array!68950 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39833 V!39833 V!39833 V!39833 (_ BitVec 32) Int) Unit!35254)

(assert (=> b!1075447 (= lt!477306 (lemmaNoChangeToArrayThenSameMapNoExtras!902 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3930 (array!68952 array!68950 (_ BitVec 32) (_ BitVec 32) V!39833 V!39833 (_ BitVec 32) Int) ListLongMap!14675)

(assert (=> b!1075447 (= lt!477304 (getCurrentListMapNoExtraKeys!3930 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1075447 (= lt!477305 (getCurrentListMapNoExtraKeys!3930 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!716941 () Bool)

(assert (=> start!95150 (=> (not res!716941) (not e!614643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95150 (= res!716941 (validMask!0 mask!1515))))

(assert (=> start!95150 e!614643))

(assert (=> start!95150 true))

(assert (=> start!95150 tp_is_empty!26023))

(declare-fun e!614645 () Bool)

(declare-fun array_inv!25652 (array!68950) Bool)

(assert (=> start!95150 (and (array_inv!25652 _values!955) e!614645)))

(assert (=> start!95150 tp!78127))

(declare-fun array_inv!25653 (array!68952) Bool)

(assert (=> start!95150 (array_inv!25653 _keys!1163)))

(declare-fun b!1075452 () Bool)

(assert (=> b!1075452 (= e!614645 (and e!614642 mapRes!40771))))

(declare-fun condMapEmpty!40771 () Bool)

(declare-fun mapDefault!40771 () ValueCell!12308)

(assert (=> b!1075452 (= condMapEmpty!40771 (= (arr!33161 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12308)) mapDefault!40771)))))

(declare-fun b!1075453 () Bool)

(declare-fun getCurrentListMap!4121 (array!68952 array!68950 (_ BitVec 32) (_ BitVec 32) V!39833 V!39833 (_ BitVec 32) Int) ListLongMap!14675)

(declare-fun +!3252 (ListLongMap!14675 tuple2!16706) ListLongMap!14675)

(assert (=> b!1075453 (= e!614641 (= (getCurrentListMap!4121 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (+!3252 (+!3252 lt!477305 (tuple2!16707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (tuple2!16707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun lt!477303 () ListLongMap!14675)

(assert (=> b!1075453 (= lt!477303 (getCurrentListMap!4121 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!95150 res!716941) b!1075449))

(assert (= (and b!1075449 res!716939) b!1075446))

(assert (= (and b!1075446 res!716942) b!1075448))

(assert (= (and b!1075448 res!716940) b!1075447))

(assert (= (and b!1075447 (not res!716943)) b!1075453))

(assert (= (and b!1075452 condMapEmpty!40771) mapIsEmpty!40771))

(assert (= (and b!1075452 (not condMapEmpty!40771)) mapNonEmpty!40771))

(get-info :version)

(assert (= (and mapNonEmpty!40771 ((_ is ValueCellFull!12308) mapValue!40771)) b!1075450))

(assert (= (and b!1075452 ((_ is ValueCellFull!12308) mapDefault!40771)) b!1075451))

(assert (= start!95150 b!1075452))

(declare-fun m!993801 () Bool)

(assert (=> b!1075447 m!993801))

(declare-fun m!993803 () Bool)

(assert (=> b!1075447 m!993803))

(declare-fun m!993805 () Bool)

(assert (=> b!1075447 m!993805))

(declare-fun m!993807 () Bool)

(assert (=> b!1075448 m!993807))

(declare-fun m!993809 () Bool)

(assert (=> start!95150 m!993809))

(declare-fun m!993811 () Bool)

(assert (=> start!95150 m!993811))

(declare-fun m!993813 () Bool)

(assert (=> start!95150 m!993813))

(declare-fun m!993815 () Bool)

(assert (=> b!1075446 m!993815))

(declare-fun m!993817 () Bool)

(assert (=> b!1075453 m!993817))

(declare-fun m!993819 () Bool)

(assert (=> b!1075453 m!993819))

(assert (=> b!1075453 m!993819))

(declare-fun m!993821 () Bool)

(assert (=> b!1075453 m!993821))

(declare-fun m!993823 () Bool)

(assert (=> b!1075453 m!993823))

(declare-fun m!993825 () Bool)

(assert (=> mapNonEmpty!40771 m!993825))

(check-sat (not mapNonEmpty!40771) (not start!95150) (not b_next!22213) (not b!1075453) (not b!1075448) (not b!1075446) b_and!35129 tp_is_empty!26023 (not b!1075447))
(check-sat b_and!35129 (not b_next!22213))
(get-model)

(declare-fun b!1075544 () Bool)

(declare-fun e!614710 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1075544 (= e!614710 (validKeyInArray!0 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075545 () Bool)

(declare-fun e!614712 () Bool)

(declare-fun e!614717 () Bool)

(assert (=> b!1075545 (= e!614712 e!614717)))

(declare-fun c!108065 () Bool)

(assert (=> b!1075545 (= c!108065 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1075546 () Bool)

(declare-fun e!614718 () ListLongMap!14675)

(declare-fun call!45536 () ListLongMap!14675)

(assert (=> b!1075546 (= e!614718 call!45536)))

(declare-fun b!1075547 () Bool)

(declare-fun c!108067 () Bool)

(assert (=> b!1075547 (= c!108067 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!614713 () ListLongMap!14675)

(assert (=> b!1075547 (= e!614713 e!614718)))

(declare-fun b!1075548 () Bool)

(declare-fun call!45532 () ListLongMap!14675)

(assert (=> b!1075548 (= e!614713 call!45532)))

(declare-fun bm!45528 () Bool)

(declare-fun call!45533 () ListLongMap!14675)

(assert (=> bm!45528 (= call!45536 call!45533)))

(declare-fun b!1075549 () Bool)

(declare-fun res!716995 () Bool)

(assert (=> b!1075549 (=> (not res!716995) (not e!614712))))

(declare-fun e!614721 () Bool)

(assert (=> b!1075549 (= res!716995 e!614721)))

(declare-fun res!716992 () Bool)

(assert (=> b!1075549 (=> res!716992 e!614721)))

(assert (=> b!1075549 (= res!716992 (not e!614710))))

(declare-fun res!716994 () Bool)

(assert (=> b!1075549 (=> (not res!716994) (not e!614710))))

(assert (=> b!1075549 (= res!716994 (bvslt #b00000000000000000000000000000000 (size!33700 _keys!1163)))))

(declare-fun lt!477389 () ListLongMap!14675)

(declare-fun b!1075550 () Bool)

(declare-fun e!614716 () Bool)

(declare-fun apply!933 (ListLongMap!14675 (_ BitVec 64)) V!39833)

(declare-fun get!17235 (ValueCell!12308 V!39833) V!39833)

(declare-fun dynLambda!2032 (Int (_ BitVec 64)) V!39833)

(assert (=> b!1075550 (= e!614716 (= (apply!933 lt!477389 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000)) (get!17235 (select (arr!33161 _values!955) #b00000000000000000000000000000000) (dynLambda!2032 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1075550 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33699 _values!955)))))

(assert (=> b!1075550 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33700 _keys!1163)))))

(declare-fun b!1075551 () Bool)

(declare-fun e!614709 () Unit!35254)

(declare-fun lt!477395 () Unit!35254)

(assert (=> b!1075551 (= e!614709 lt!477395)))

(declare-fun lt!477391 () ListLongMap!14675)

(assert (=> b!1075551 (= lt!477391 (getCurrentListMapNoExtraKeys!3930 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477376 () (_ BitVec 64))

(assert (=> b!1075551 (= lt!477376 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477375 () (_ BitVec 64))

(assert (=> b!1075551 (= lt!477375 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477394 () Unit!35254)

(declare-fun addStillContains!646 (ListLongMap!14675 (_ BitVec 64) V!39833 (_ BitVec 64)) Unit!35254)

(assert (=> b!1075551 (= lt!477394 (addStillContains!646 lt!477391 lt!477376 zeroValueBefore!47 lt!477375))))

(declare-fun contains!6318 (ListLongMap!14675 (_ BitVec 64)) Bool)

(assert (=> b!1075551 (contains!6318 (+!3252 lt!477391 (tuple2!16707 lt!477376 zeroValueBefore!47)) lt!477375)))

(declare-fun lt!477387 () Unit!35254)

(assert (=> b!1075551 (= lt!477387 lt!477394)))

(declare-fun lt!477388 () ListLongMap!14675)

(assert (=> b!1075551 (= lt!477388 (getCurrentListMapNoExtraKeys!3930 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477385 () (_ BitVec 64))

(assert (=> b!1075551 (= lt!477385 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477396 () (_ BitVec 64))

(assert (=> b!1075551 (= lt!477396 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477381 () Unit!35254)

(declare-fun addApplyDifferent!502 (ListLongMap!14675 (_ BitVec 64) V!39833 (_ BitVec 64)) Unit!35254)

(assert (=> b!1075551 (= lt!477381 (addApplyDifferent!502 lt!477388 lt!477385 minValue!907 lt!477396))))

(assert (=> b!1075551 (= (apply!933 (+!3252 lt!477388 (tuple2!16707 lt!477385 minValue!907)) lt!477396) (apply!933 lt!477388 lt!477396))))

(declare-fun lt!477392 () Unit!35254)

(assert (=> b!1075551 (= lt!477392 lt!477381)))

(declare-fun lt!477384 () ListLongMap!14675)

(assert (=> b!1075551 (= lt!477384 (getCurrentListMapNoExtraKeys!3930 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477390 () (_ BitVec 64))

(assert (=> b!1075551 (= lt!477390 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477379 () (_ BitVec 64))

(assert (=> b!1075551 (= lt!477379 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477386 () Unit!35254)

(assert (=> b!1075551 (= lt!477386 (addApplyDifferent!502 lt!477384 lt!477390 zeroValueBefore!47 lt!477379))))

(assert (=> b!1075551 (= (apply!933 (+!3252 lt!477384 (tuple2!16707 lt!477390 zeroValueBefore!47)) lt!477379) (apply!933 lt!477384 lt!477379))))

(declare-fun lt!477383 () Unit!35254)

(assert (=> b!1075551 (= lt!477383 lt!477386)))

(declare-fun lt!477378 () ListLongMap!14675)

(assert (=> b!1075551 (= lt!477378 (getCurrentListMapNoExtraKeys!3930 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477377 () (_ BitVec 64))

(assert (=> b!1075551 (= lt!477377 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477393 () (_ BitVec 64))

(assert (=> b!1075551 (= lt!477393 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075551 (= lt!477395 (addApplyDifferent!502 lt!477378 lt!477377 minValue!907 lt!477393))))

(assert (=> b!1075551 (= (apply!933 (+!3252 lt!477378 (tuple2!16707 lt!477377 minValue!907)) lt!477393) (apply!933 lt!477378 lt!477393))))

(declare-fun bm!45529 () Bool)

(declare-fun call!45531 () ListLongMap!14675)

(assert (=> bm!45529 (= call!45531 (getCurrentListMapNoExtraKeys!3930 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1075552 () Bool)

(declare-fun e!614711 () Bool)

(assert (=> b!1075552 (= e!614711 (validKeyInArray!0 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45530 () Bool)

(declare-fun call!45537 () ListLongMap!14675)

(assert (=> bm!45530 (= call!45532 call!45537)))

(declare-fun bm!45531 () Bool)

(assert (=> bm!45531 (= call!45533 call!45531)))

(declare-fun d!129461 () Bool)

(assert (=> d!129461 e!614712))

(declare-fun res!716996 () Bool)

(assert (=> d!129461 (=> (not res!716996) (not e!614712))))

(assert (=> d!129461 (= res!716996 (or (bvsge #b00000000000000000000000000000000 (size!33700 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33700 _keys!1163)))))))

(declare-fun lt!477382 () ListLongMap!14675)

(assert (=> d!129461 (= lt!477389 lt!477382)))

(declare-fun lt!477380 () Unit!35254)

(assert (=> d!129461 (= lt!477380 e!614709)))

(declare-fun c!108062 () Bool)

(assert (=> d!129461 (= c!108062 e!614711)))

(declare-fun res!716993 () Bool)

(assert (=> d!129461 (=> (not res!716993) (not e!614711))))

(assert (=> d!129461 (= res!716993 (bvslt #b00000000000000000000000000000000 (size!33700 _keys!1163)))))

(declare-fun e!614719 () ListLongMap!14675)

(assert (=> d!129461 (= lt!477382 e!614719)))

(declare-fun c!108066 () Bool)

(assert (=> d!129461 (= c!108066 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129461 (validMask!0 mask!1515)))

(assert (=> d!129461 (= (getCurrentListMap!4121 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477389)))

(declare-fun b!1075553 () Bool)

(declare-fun e!614715 () Bool)

(declare-fun e!614720 () Bool)

(assert (=> b!1075553 (= e!614715 e!614720)))

(declare-fun res!716999 () Bool)

(declare-fun call!45535 () Bool)

(assert (=> b!1075553 (= res!716999 call!45535)))

(assert (=> b!1075553 (=> (not res!716999) (not e!614720))))

(declare-fun b!1075554 () Bool)

(assert (=> b!1075554 (= e!614720 (= (apply!933 lt!477389 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun bm!45532 () Bool)

(declare-fun call!45534 () Bool)

(assert (=> bm!45532 (= call!45534 (contains!6318 lt!477389 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075555 () Bool)

(assert (=> b!1075555 (= e!614718 call!45532)))

(declare-fun b!1075556 () Bool)

(assert (=> b!1075556 (= e!614715 (not call!45535))))

(declare-fun b!1075557 () Bool)

(assert (=> b!1075557 (= e!614717 (not call!45534))))

(declare-fun c!108064 () Bool)

(declare-fun bm!45533 () Bool)

(assert (=> bm!45533 (= call!45537 (+!3252 (ite c!108066 call!45531 (ite c!108064 call!45533 call!45536)) (ite (or c!108066 c!108064) (tuple2!16707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1075558 () Bool)

(declare-fun Unit!35258 () Unit!35254)

(assert (=> b!1075558 (= e!614709 Unit!35258)))

(declare-fun b!1075559 () Bool)

(assert (=> b!1075559 (= e!614719 e!614713)))

(assert (=> b!1075559 (= c!108064 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45534 () Bool)

(assert (=> bm!45534 (= call!45535 (contains!6318 lt!477389 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075560 () Bool)

(declare-fun e!614714 () Bool)

(assert (=> b!1075560 (= e!614714 (= (apply!933 lt!477389 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1075561 () Bool)

(declare-fun res!716998 () Bool)

(assert (=> b!1075561 (=> (not res!716998) (not e!614712))))

(assert (=> b!1075561 (= res!716998 e!614715)))

(declare-fun c!108063 () Bool)

(assert (=> b!1075561 (= c!108063 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1075562 () Bool)

(assert (=> b!1075562 (= e!614721 e!614716)))

(declare-fun res!717000 () Bool)

(assert (=> b!1075562 (=> (not res!717000) (not e!614716))))

(assert (=> b!1075562 (= res!717000 (contains!6318 lt!477389 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075562 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33700 _keys!1163)))))

(declare-fun b!1075563 () Bool)

(assert (=> b!1075563 (= e!614719 (+!3252 call!45537 (tuple2!16707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1075564 () Bool)

(assert (=> b!1075564 (= e!614717 e!614714)))

(declare-fun res!716997 () Bool)

(assert (=> b!1075564 (= res!716997 call!45534)))

(assert (=> b!1075564 (=> (not res!716997) (not e!614714))))

(assert (= (and d!129461 c!108066) b!1075563))

(assert (= (and d!129461 (not c!108066)) b!1075559))

(assert (= (and b!1075559 c!108064) b!1075548))

(assert (= (and b!1075559 (not c!108064)) b!1075547))

(assert (= (and b!1075547 c!108067) b!1075555))

(assert (= (and b!1075547 (not c!108067)) b!1075546))

(assert (= (or b!1075555 b!1075546) bm!45528))

(assert (= (or b!1075548 bm!45528) bm!45531))

(assert (= (or b!1075548 b!1075555) bm!45530))

(assert (= (or b!1075563 bm!45531) bm!45529))

(assert (= (or b!1075563 bm!45530) bm!45533))

(assert (= (and d!129461 res!716993) b!1075552))

(assert (= (and d!129461 c!108062) b!1075551))

(assert (= (and d!129461 (not c!108062)) b!1075558))

(assert (= (and d!129461 res!716996) b!1075549))

(assert (= (and b!1075549 res!716994) b!1075544))

(assert (= (and b!1075549 (not res!716992)) b!1075562))

(assert (= (and b!1075562 res!717000) b!1075550))

(assert (= (and b!1075549 res!716995) b!1075561))

(assert (= (and b!1075561 c!108063) b!1075553))

(assert (= (and b!1075561 (not c!108063)) b!1075556))

(assert (= (and b!1075553 res!716999) b!1075554))

(assert (= (or b!1075553 b!1075556) bm!45534))

(assert (= (and b!1075561 res!716998) b!1075545))

(assert (= (and b!1075545 c!108065) b!1075564))

(assert (= (and b!1075545 (not c!108065)) b!1075557))

(assert (= (and b!1075564 res!716997) b!1075560))

(assert (= (or b!1075564 b!1075557) bm!45532))

(declare-fun b_lambda!16879 () Bool)

(assert (=> (not b_lambda!16879) (not b!1075550)))

(declare-fun t!32575 () Bool)

(declare-fun tb!7167 () Bool)

(assert (=> (and start!95150 (= defaultEntry!963 defaultEntry!963) t!32575) tb!7167))

(declare-fun result!14825 () Bool)

(assert (=> tb!7167 (= result!14825 tp_is_empty!26023)))

(assert (=> b!1075550 t!32575))

(declare-fun b_and!35135 () Bool)

(assert (= b_and!35129 (and (=> t!32575 result!14825) b_and!35135)))

(declare-fun m!993879 () Bool)

(assert (=> b!1075552 m!993879))

(assert (=> b!1075552 m!993879))

(declare-fun m!993881 () Bool)

(assert (=> b!1075552 m!993881))

(declare-fun m!993883 () Bool)

(assert (=> b!1075563 m!993883))

(declare-fun m!993885 () Bool)

(assert (=> b!1075554 m!993885))

(assert (=> bm!45529 m!993805))

(assert (=> b!1075562 m!993879))

(assert (=> b!1075562 m!993879))

(declare-fun m!993887 () Bool)

(assert (=> b!1075562 m!993887))

(declare-fun m!993889 () Bool)

(assert (=> b!1075550 m!993889))

(assert (=> b!1075550 m!993889))

(declare-fun m!993891 () Bool)

(assert (=> b!1075550 m!993891))

(declare-fun m!993893 () Bool)

(assert (=> b!1075550 m!993893))

(assert (=> b!1075550 m!993879))

(declare-fun m!993895 () Bool)

(assert (=> b!1075550 m!993895))

(assert (=> b!1075550 m!993891))

(assert (=> b!1075550 m!993879))

(assert (=> d!129461 m!993809))

(declare-fun m!993897 () Bool)

(assert (=> bm!45534 m!993897))

(declare-fun m!993899 () Bool)

(assert (=> b!1075551 m!993899))

(declare-fun m!993901 () Bool)

(assert (=> b!1075551 m!993901))

(declare-fun m!993903 () Bool)

(assert (=> b!1075551 m!993903))

(declare-fun m!993905 () Bool)

(assert (=> b!1075551 m!993905))

(declare-fun m!993907 () Bool)

(assert (=> b!1075551 m!993907))

(declare-fun m!993909 () Bool)

(assert (=> b!1075551 m!993909))

(declare-fun m!993911 () Bool)

(assert (=> b!1075551 m!993911))

(declare-fun m!993913 () Bool)

(assert (=> b!1075551 m!993913))

(declare-fun m!993915 () Bool)

(assert (=> b!1075551 m!993915))

(assert (=> b!1075551 m!993879))

(assert (=> b!1075551 m!993909))

(assert (=> b!1075551 m!993805))

(declare-fun m!993917 () Bool)

(assert (=> b!1075551 m!993917))

(declare-fun m!993919 () Bool)

(assert (=> b!1075551 m!993919))

(declare-fun m!993921 () Bool)

(assert (=> b!1075551 m!993921))

(declare-fun m!993923 () Bool)

(assert (=> b!1075551 m!993923))

(assert (=> b!1075551 m!993901))

(declare-fun m!993925 () Bool)

(assert (=> b!1075551 m!993925))

(assert (=> b!1075551 m!993903))

(declare-fun m!993927 () Bool)

(assert (=> b!1075551 m!993927))

(assert (=> b!1075551 m!993917))

(declare-fun m!993929 () Bool)

(assert (=> b!1075560 m!993929))

(declare-fun m!993931 () Bool)

(assert (=> bm!45532 m!993931))

(declare-fun m!993933 () Bool)

(assert (=> bm!45533 m!993933))

(assert (=> b!1075544 m!993879))

(assert (=> b!1075544 m!993879))

(assert (=> b!1075544 m!993881))

(assert (=> b!1075453 d!129461))

(declare-fun d!129463 () Bool)

(declare-fun e!614724 () Bool)

(assert (=> d!129463 e!614724))

(declare-fun res!717006 () Bool)

(assert (=> d!129463 (=> (not res!717006) (not e!614724))))

(declare-fun lt!477405 () ListLongMap!14675)

(assert (=> d!129463 (= res!717006 (contains!6318 lt!477405 (_1!8364 (tuple2!16707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun lt!477408 () List!23227)

(assert (=> d!129463 (= lt!477405 (ListLongMap!14676 lt!477408))))

(declare-fun lt!477407 () Unit!35254)

(declare-fun lt!477406 () Unit!35254)

(assert (=> d!129463 (= lt!477407 lt!477406)))

(declare-datatypes ((Option!665 0))(
  ( (Some!664 (v!15689 V!39833)) (None!663) )
))
(declare-fun getValueByKey!614 (List!23227 (_ BitVec 64)) Option!665)

(assert (=> d!129463 (= (getValueByKey!614 lt!477408 (_1!8364 (tuple2!16707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))) (Some!664 (_2!8364 (tuple2!16707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun lemmaContainsTupThenGetReturnValue!290 (List!23227 (_ BitVec 64) V!39833) Unit!35254)

(assert (=> d!129463 (= lt!477406 (lemmaContainsTupThenGetReturnValue!290 lt!477408 (_1!8364 (tuple2!16707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (_2!8364 (tuple2!16707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun insertStrictlySorted!383 (List!23227 (_ BitVec 64) V!39833) List!23227)

(assert (=> d!129463 (= lt!477408 (insertStrictlySorted!383 (toList!7353 (+!3252 lt!477305 (tuple2!16707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (_1!8364 (tuple2!16707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (_2!8364 (tuple2!16707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(assert (=> d!129463 (= (+!3252 (+!3252 lt!477305 (tuple2!16707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (tuple2!16707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) lt!477405)))

(declare-fun b!1075571 () Bool)

(declare-fun res!717005 () Bool)

(assert (=> b!1075571 (=> (not res!717005) (not e!614724))))

(assert (=> b!1075571 (= res!717005 (= (getValueByKey!614 (toList!7353 lt!477405) (_1!8364 (tuple2!16707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))) (Some!664 (_2!8364 (tuple2!16707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))))

(declare-fun b!1075572 () Bool)

(declare-fun contains!6319 (List!23227 tuple2!16706) Bool)

(assert (=> b!1075572 (= e!614724 (contains!6319 (toList!7353 lt!477405) (tuple2!16707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(assert (= (and d!129463 res!717006) b!1075571))

(assert (= (and b!1075571 res!717005) b!1075572))

(declare-fun m!993935 () Bool)

(assert (=> d!129463 m!993935))

(declare-fun m!993937 () Bool)

(assert (=> d!129463 m!993937))

(declare-fun m!993939 () Bool)

(assert (=> d!129463 m!993939))

(declare-fun m!993941 () Bool)

(assert (=> d!129463 m!993941))

(declare-fun m!993943 () Bool)

(assert (=> b!1075571 m!993943))

(declare-fun m!993945 () Bool)

(assert (=> b!1075572 m!993945))

(assert (=> b!1075453 d!129463))

(declare-fun d!129465 () Bool)

(declare-fun e!614725 () Bool)

(assert (=> d!129465 e!614725))

(declare-fun res!717008 () Bool)

(assert (=> d!129465 (=> (not res!717008) (not e!614725))))

(declare-fun lt!477409 () ListLongMap!14675)

(assert (=> d!129465 (= res!717008 (contains!6318 lt!477409 (_1!8364 (tuple2!16707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!477412 () List!23227)

(assert (=> d!129465 (= lt!477409 (ListLongMap!14676 lt!477412))))

(declare-fun lt!477411 () Unit!35254)

(declare-fun lt!477410 () Unit!35254)

(assert (=> d!129465 (= lt!477411 lt!477410)))

(assert (=> d!129465 (= (getValueByKey!614 lt!477412 (_1!8364 (tuple2!16707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!664 (_2!8364 (tuple2!16707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!129465 (= lt!477410 (lemmaContainsTupThenGetReturnValue!290 lt!477412 (_1!8364 (tuple2!16707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8364 (tuple2!16707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!129465 (= lt!477412 (insertStrictlySorted!383 (toList!7353 lt!477305) (_1!8364 (tuple2!16707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8364 (tuple2!16707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!129465 (= (+!3252 lt!477305 (tuple2!16707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!477409)))

(declare-fun b!1075573 () Bool)

(declare-fun res!717007 () Bool)

(assert (=> b!1075573 (=> (not res!717007) (not e!614725))))

(assert (=> b!1075573 (= res!717007 (= (getValueByKey!614 (toList!7353 lt!477409) (_1!8364 (tuple2!16707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!664 (_2!8364 (tuple2!16707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))))

(declare-fun b!1075574 () Bool)

(assert (=> b!1075574 (= e!614725 (contains!6319 (toList!7353 lt!477409) (tuple2!16707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(assert (= (and d!129465 res!717008) b!1075573))

(assert (= (and b!1075573 res!717007) b!1075574))

(declare-fun m!993947 () Bool)

(assert (=> d!129465 m!993947))

(declare-fun m!993949 () Bool)

(assert (=> d!129465 m!993949))

(declare-fun m!993951 () Bool)

(assert (=> d!129465 m!993951))

(declare-fun m!993953 () Bool)

(assert (=> d!129465 m!993953))

(declare-fun m!993955 () Bool)

(assert (=> b!1075573 m!993955))

(declare-fun m!993957 () Bool)

(assert (=> b!1075574 m!993957))

(assert (=> b!1075453 d!129465))

(declare-fun b!1075575 () Bool)

(declare-fun e!614727 () Bool)

(assert (=> b!1075575 (= e!614727 (validKeyInArray!0 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075576 () Bool)

(declare-fun e!614729 () Bool)

(declare-fun e!614734 () Bool)

(assert (=> b!1075576 (= e!614729 e!614734)))

(declare-fun c!108071 () Bool)

(assert (=> b!1075576 (= c!108071 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1075577 () Bool)

(declare-fun e!614735 () ListLongMap!14675)

(declare-fun call!45543 () ListLongMap!14675)

(assert (=> b!1075577 (= e!614735 call!45543)))

(declare-fun b!1075578 () Bool)

(declare-fun c!108073 () Bool)

(assert (=> b!1075578 (= c!108073 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!614730 () ListLongMap!14675)

(assert (=> b!1075578 (= e!614730 e!614735)))

(declare-fun b!1075579 () Bool)

(declare-fun call!45539 () ListLongMap!14675)

(assert (=> b!1075579 (= e!614730 call!45539)))

(declare-fun bm!45535 () Bool)

(declare-fun call!45540 () ListLongMap!14675)

(assert (=> bm!45535 (= call!45543 call!45540)))

(declare-fun b!1075580 () Bool)

(declare-fun res!717012 () Bool)

(assert (=> b!1075580 (=> (not res!717012) (not e!614729))))

(declare-fun e!614738 () Bool)

(assert (=> b!1075580 (= res!717012 e!614738)))

(declare-fun res!717009 () Bool)

(assert (=> b!1075580 (=> res!717009 e!614738)))

(assert (=> b!1075580 (= res!717009 (not e!614727))))

(declare-fun res!717011 () Bool)

(assert (=> b!1075580 (=> (not res!717011) (not e!614727))))

(assert (=> b!1075580 (= res!717011 (bvslt #b00000000000000000000000000000000 (size!33700 _keys!1163)))))

(declare-fun e!614733 () Bool)

(declare-fun lt!477427 () ListLongMap!14675)

(declare-fun b!1075581 () Bool)

(assert (=> b!1075581 (= e!614733 (= (apply!933 lt!477427 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000)) (get!17235 (select (arr!33161 _values!955) #b00000000000000000000000000000000) (dynLambda!2032 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1075581 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33699 _values!955)))))

(assert (=> b!1075581 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33700 _keys!1163)))))

(declare-fun b!1075582 () Bool)

(declare-fun e!614726 () Unit!35254)

(declare-fun lt!477433 () Unit!35254)

(assert (=> b!1075582 (= e!614726 lt!477433)))

(declare-fun lt!477429 () ListLongMap!14675)

(assert (=> b!1075582 (= lt!477429 (getCurrentListMapNoExtraKeys!3930 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477414 () (_ BitVec 64))

(assert (=> b!1075582 (= lt!477414 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477413 () (_ BitVec 64))

(assert (=> b!1075582 (= lt!477413 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477432 () Unit!35254)

(assert (=> b!1075582 (= lt!477432 (addStillContains!646 lt!477429 lt!477414 zeroValueAfter!47 lt!477413))))

(assert (=> b!1075582 (contains!6318 (+!3252 lt!477429 (tuple2!16707 lt!477414 zeroValueAfter!47)) lt!477413)))

(declare-fun lt!477425 () Unit!35254)

(assert (=> b!1075582 (= lt!477425 lt!477432)))

(declare-fun lt!477426 () ListLongMap!14675)

(assert (=> b!1075582 (= lt!477426 (getCurrentListMapNoExtraKeys!3930 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477423 () (_ BitVec 64))

(assert (=> b!1075582 (= lt!477423 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477434 () (_ BitVec 64))

(assert (=> b!1075582 (= lt!477434 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477419 () Unit!35254)

(assert (=> b!1075582 (= lt!477419 (addApplyDifferent!502 lt!477426 lt!477423 minValue!907 lt!477434))))

(assert (=> b!1075582 (= (apply!933 (+!3252 lt!477426 (tuple2!16707 lt!477423 minValue!907)) lt!477434) (apply!933 lt!477426 lt!477434))))

(declare-fun lt!477430 () Unit!35254)

(assert (=> b!1075582 (= lt!477430 lt!477419)))

(declare-fun lt!477422 () ListLongMap!14675)

(assert (=> b!1075582 (= lt!477422 (getCurrentListMapNoExtraKeys!3930 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477428 () (_ BitVec 64))

(assert (=> b!1075582 (= lt!477428 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477417 () (_ BitVec 64))

(assert (=> b!1075582 (= lt!477417 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477424 () Unit!35254)

(assert (=> b!1075582 (= lt!477424 (addApplyDifferent!502 lt!477422 lt!477428 zeroValueAfter!47 lt!477417))))

(assert (=> b!1075582 (= (apply!933 (+!3252 lt!477422 (tuple2!16707 lt!477428 zeroValueAfter!47)) lt!477417) (apply!933 lt!477422 lt!477417))))

(declare-fun lt!477421 () Unit!35254)

(assert (=> b!1075582 (= lt!477421 lt!477424)))

(declare-fun lt!477416 () ListLongMap!14675)

(assert (=> b!1075582 (= lt!477416 (getCurrentListMapNoExtraKeys!3930 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477415 () (_ BitVec 64))

(assert (=> b!1075582 (= lt!477415 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477431 () (_ BitVec 64))

(assert (=> b!1075582 (= lt!477431 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075582 (= lt!477433 (addApplyDifferent!502 lt!477416 lt!477415 minValue!907 lt!477431))))

(assert (=> b!1075582 (= (apply!933 (+!3252 lt!477416 (tuple2!16707 lt!477415 minValue!907)) lt!477431) (apply!933 lt!477416 lt!477431))))

(declare-fun bm!45536 () Bool)

(declare-fun call!45538 () ListLongMap!14675)

(assert (=> bm!45536 (= call!45538 (getCurrentListMapNoExtraKeys!3930 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1075583 () Bool)

(declare-fun e!614728 () Bool)

(assert (=> b!1075583 (= e!614728 (validKeyInArray!0 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45537 () Bool)

(declare-fun call!45544 () ListLongMap!14675)

(assert (=> bm!45537 (= call!45539 call!45544)))

(declare-fun bm!45538 () Bool)

(assert (=> bm!45538 (= call!45540 call!45538)))

(declare-fun d!129467 () Bool)

(assert (=> d!129467 e!614729))

(declare-fun res!717013 () Bool)

(assert (=> d!129467 (=> (not res!717013) (not e!614729))))

(assert (=> d!129467 (= res!717013 (or (bvsge #b00000000000000000000000000000000 (size!33700 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33700 _keys!1163)))))))

(declare-fun lt!477420 () ListLongMap!14675)

(assert (=> d!129467 (= lt!477427 lt!477420)))

(declare-fun lt!477418 () Unit!35254)

(assert (=> d!129467 (= lt!477418 e!614726)))

(declare-fun c!108068 () Bool)

(assert (=> d!129467 (= c!108068 e!614728)))

(declare-fun res!717010 () Bool)

(assert (=> d!129467 (=> (not res!717010) (not e!614728))))

(assert (=> d!129467 (= res!717010 (bvslt #b00000000000000000000000000000000 (size!33700 _keys!1163)))))

(declare-fun e!614736 () ListLongMap!14675)

(assert (=> d!129467 (= lt!477420 e!614736)))

(declare-fun c!108072 () Bool)

(assert (=> d!129467 (= c!108072 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129467 (validMask!0 mask!1515)))

(assert (=> d!129467 (= (getCurrentListMap!4121 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477427)))

(declare-fun b!1075584 () Bool)

(declare-fun e!614732 () Bool)

(declare-fun e!614737 () Bool)

(assert (=> b!1075584 (= e!614732 e!614737)))

(declare-fun res!717016 () Bool)

(declare-fun call!45542 () Bool)

(assert (=> b!1075584 (= res!717016 call!45542)))

(assert (=> b!1075584 (=> (not res!717016) (not e!614737))))

(declare-fun b!1075585 () Bool)

(assert (=> b!1075585 (= e!614737 (= (apply!933 lt!477427 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun bm!45539 () Bool)

(declare-fun call!45541 () Bool)

(assert (=> bm!45539 (= call!45541 (contains!6318 lt!477427 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075586 () Bool)

(assert (=> b!1075586 (= e!614735 call!45539)))

(declare-fun b!1075587 () Bool)

(assert (=> b!1075587 (= e!614732 (not call!45542))))

(declare-fun b!1075588 () Bool)

(assert (=> b!1075588 (= e!614734 (not call!45541))))

(declare-fun bm!45540 () Bool)

(declare-fun c!108070 () Bool)

(assert (=> bm!45540 (= call!45544 (+!3252 (ite c!108072 call!45538 (ite c!108070 call!45540 call!45543)) (ite (or c!108072 c!108070) (tuple2!16707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1075589 () Bool)

(declare-fun Unit!35259 () Unit!35254)

(assert (=> b!1075589 (= e!614726 Unit!35259)))

(declare-fun b!1075590 () Bool)

(assert (=> b!1075590 (= e!614736 e!614730)))

(assert (=> b!1075590 (= c!108070 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45541 () Bool)

(assert (=> bm!45541 (= call!45542 (contains!6318 lt!477427 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075591 () Bool)

(declare-fun e!614731 () Bool)

(assert (=> b!1075591 (= e!614731 (= (apply!933 lt!477427 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1075592 () Bool)

(declare-fun res!717015 () Bool)

(assert (=> b!1075592 (=> (not res!717015) (not e!614729))))

(assert (=> b!1075592 (= res!717015 e!614732)))

(declare-fun c!108069 () Bool)

(assert (=> b!1075592 (= c!108069 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1075593 () Bool)

(assert (=> b!1075593 (= e!614738 e!614733)))

(declare-fun res!717017 () Bool)

(assert (=> b!1075593 (=> (not res!717017) (not e!614733))))

(assert (=> b!1075593 (= res!717017 (contains!6318 lt!477427 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075593 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33700 _keys!1163)))))

(declare-fun b!1075594 () Bool)

(assert (=> b!1075594 (= e!614736 (+!3252 call!45544 (tuple2!16707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1075595 () Bool)

(assert (=> b!1075595 (= e!614734 e!614731)))

(declare-fun res!717014 () Bool)

(assert (=> b!1075595 (= res!717014 call!45541)))

(assert (=> b!1075595 (=> (not res!717014) (not e!614731))))

(assert (= (and d!129467 c!108072) b!1075594))

(assert (= (and d!129467 (not c!108072)) b!1075590))

(assert (= (and b!1075590 c!108070) b!1075579))

(assert (= (and b!1075590 (not c!108070)) b!1075578))

(assert (= (and b!1075578 c!108073) b!1075586))

(assert (= (and b!1075578 (not c!108073)) b!1075577))

(assert (= (or b!1075586 b!1075577) bm!45535))

(assert (= (or b!1075579 bm!45535) bm!45538))

(assert (= (or b!1075579 b!1075586) bm!45537))

(assert (= (or b!1075594 bm!45538) bm!45536))

(assert (= (or b!1075594 bm!45537) bm!45540))

(assert (= (and d!129467 res!717010) b!1075583))

(assert (= (and d!129467 c!108068) b!1075582))

(assert (= (and d!129467 (not c!108068)) b!1075589))

(assert (= (and d!129467 res!717013) b!1075580))

(assert (= (and b!1075580 res!717011) b!1075575))

(assert (= (and b!1075580 (not res!717009)) b!1075593))

(assert (= (and b!1075593 res!717017) b!1075581))

(assert (= (and b!1075580 res!717012) b!1075592))

(assert (= (and b!1075592 c!108069) b!1075584))

(assert (= (and b!1075592 (not c!108069)) b!1075587))

(assert (= (and b!1075584 res!717016) b!1075585))

(assert (= (or b!1075584 b!1075587) bm!45541))

(assert (= (and b!1075592 res!717015) b!1075576))

(assert (= (and b!1075576 c!108071) b!1075595))

(assert (= (and b!1075576 (not c!108071)) b!1075588))

(assert (= (and b!1075595 res!717014) b!1075591))

(assert (= (or b!1075595 b!1075588) bm!45539))

(declare-fun b_lambda!16881 () Bool)

(assert (=> (not b_lambda!16881) (not b!1075581)))

(assert (=> b!1075581 t!32575))

(declare-fun b_and!35137 () Bool)

(assert (= b_and!35135 (and (=> t!32575 result!14825) b_and!35137)))

(assert (=> b!1075583 m!993879))

(assert (=> b!1075583 m!993879))

(assert (=> b!1075583 m!993881))

(declare-fun m!993959 () Bool)

(assert (=> b!1075594 m!993959))

(declare-fun m!993961 () Bool)

(assert (=> b!1075585 m!993961))

(assert (=> bm!45536 m!993803))

(assert (=> b!1075593 m!993879))

(assert (=> b!1075593 m!993879))

(declare-fun m!993963 () Bool)

(assert (=> b!1075593 m!993963))

(assert (=> b!1075581 m!993889))

(assert (=> b!1075581 m!993889))

(assert (=> b!1075581 m!993891))

(assert (=> b!1075581 m!993893))

(assert (=> b!1075581 m!993879))

(declare-fun m!993965 () Bool)

(assert (=> b!1075581 m!993965))

(assert (=> b!1075581 m!993891))

(assert (=> b!1075581 m!993879))

(assert (=> d!129467 m!993809))

(declare-fun m!993967 () Bool)

(assert (=> bm!45541 m!993967))

(declare-fun m!993969 () Bool)

(assert (=> b!1075582 m!993969))

(declare-fun m!993971 () Bool)

(assert (=> b!1075582 m!993971))

(declare-fun m!993973 () Bool)

(assert (=> b!1075582 m!993973))

(declare-fun m!993975 () Bool)

(assert (=> b!1075582 m!993975))

(declare-fun m!993977 () Bool)

(assert (=> b!1075582 m!993977))

(declare-fun m!993979 () Bool)

(assert (=> b!1075582 m!993979))

(declare-fun m!993981 () Bool)

(assert (=> b!1075582 m!993981))

(declare-fun m!993983 () Bool)

(assert (=> b!1075582 m!993983))

(declare-fun m!993985 () Bool)

(assert (=> b!1075582 m!993985))

(assert (=> b!1075582 m!993879))

(assert (=> b!1075582 m!993979))

(assert (=> b!1075582 m!993803))

(declare-fun m!993987 () Bool)

(assert (=> b!1075582 m!993987))

(declare-fun m!993989 () Bool)

(assert (=> b!1075582 m!993989))

(declare-fun m!993991 () Bool)

(assert (=> b!1075582 m!993991))

(declare-fun m!993993 () Bool)

(assert (=> b!1075582 m!993993))

(assert (=> b!1075582 m!993971))

(declare-fun m!993995 () Bool)

(assert (=> b!1075582 m!993995))

(assert (=> b!1075582 m!993973))

(declare-fun m!993997 () Bool)

(assert (=> b!1075582 m!993997))

(assert (=> b!1075582 m!993987))

(declare-fun m!993999 () Bool)

(assert (=> b!1075591 m!993999))

(declare-fun m!994001 () Bool)

(assert (=> bm!45539 m!994001))

(declare-fun m!994003 () Bool)

(assert (=> bm!45540 m!994003))

(assert (=> b!1075575 m!993879))

(assert (=> b!1075575 m!993879))

(assert (=> b!1075575 m!993881))

(assert (=> b!1075453 d!129467))

(declare-fun d!129469 () Bool)

(assert (=> d!129469 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95150 d!129469))

(declare-fun d!129471 () Bool)

(assert (=> d!129471 (= (array_inv!25652 _values!955) (bvsge (size!33699 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95150 d!129471))

(declare-fun d!129473 () Bool)

(assert (=> d!129473 (= (array_inv!25653 _keys!1163) (bvsge (size!33700 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95150 d!129473))

(declare-fun bm!45544 () Bool)

(declare-fun call!45547 () Bool)

(declare-fun c!108076 () Bool)

(assert (=> bm!45544 (= call!45547 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108076 (Cons!23222 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000) Nil!23223) Nil!23223)))))

(declare-fun b!1075606 () Bool)

(declare-fun e!614748 () Bool)

(declare-fun e!614747 () Bool)

(assert (=> b!1075606 (= e!614748 e!614747)))

(assert (=> b!1075606 (= c!108076 (validKeyInArray!0 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129475 () Bool)

(declare-fun res!717025 () Bool)

(declare-fun e!614750 () Bool)

(assert (=> d!129475 (=> res!717025 e!614750)))

(assert (=> d!129475 (= res!717025 (bvsge #b00000000000000000000000000000000 (size!33700 _keys!1163)))))

(assert (=> d!129475 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23223) e!614750)))

(declare-fun b!1075607 () Bool)

(assert (=> b!1075607 (= e!614747 call!45547)))

(declare-fun b!1075608 () Bool)

(declare-fun e!614749 () Bool)

(declare-fun contains!6320 (List!23226 (_ BitVec 64)) Bool)

(assert (=> b!1075608 (= e!614749 (contains!6320 Nil!23223 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075609 () Bool)

(assert (=> b!1075609 (= e!614747 call!45547)))

(declare-fun b!1075610 () Bool)

(assert (=> b!1075610 (= e!614750 e!614748)))

(declare-fun res!717024 () Bool)

(assert (=> b!1075610 (=> (not res!717024) (not e!614748))))

(assert (=> b!1075610 (= res!717024 (not e!614749))))

(declare-fun res!717026 () Bool)

(assert (=> b!1075610 (=> (not res!717026) (not e!614749))))

(assert (=> b!1075610 (= res!717026 (validKeyInArray!0 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129475 (not res!717025)) b!1075610))

(assert (= (and b!1075610 res!717026) b!1075608))

(assert (= (and b!1075610 res!717024) b!1075606))

(assert (= (and b!1075606 c!108076) b!1075607))

(assert (= (and b!1075606 (not c!108076)) b!1075609))

(assert (= (or b!1075607 b!1075609) bm!45544))

(assert (=> bm!45544 m!993879))

(declare-fun m!994005 () Bool)

(assert (=> bm!45544 m!994005))

(assert (=> b!1075606 m!993879))

(assert (=> b!1075606 m!993879))

(assert (=> b!1075606 m!993881))

(assert (=> b!1075608 m!993879))

(assert (=> b!1075608 m!993879))

(declare-fun m!994007 () Bool)

(assert (=> b!1075608 m!994007))

(assert (=> b!1075610 m!993879))

(assert (=> b!1075610 m!993879))

(assert (=> b!1075610 m!993881))

(assert (=> b!1075448 d!129475))

(declare-fun d!129477 () Bool)

(assert (=> d!129477 (= (getCurrentListMapNoExtraKeys!3930 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3930 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477437 () Unit!35254)

(declare-fun choose!1763 (array!68952 array!68950 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39833 V!39833 V!39833 V!39833 (_ BitVec 32) Int) Unit!35254)

(assert (=> d!129477 (= lt!477437 (choose!1763 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129477 (validMask!0 mask!1515)))

(assert (=> d!129477 (= (lemmaNoChangeToArrayThenSameMapNoExtras!902 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477437)))

(declare-fun bs!31660 () Bool)

(assert (= bs!31660 d!129477))

(assert (=> bs!31660 m!993805))

(assert (=> bs!31660 m!993803))

(declare-fun m!994009 () Bool)

(assert (=> bs!31660 m!994009))

(assert (=> bs!31660 m!993809))

(assert (=> b!1075447 d!129477))

(declare-fun b!1075635 () Bool)

(declare-fun lt!477453 () ListLongMap!14675)

(declare-fun e!614767 () Bool)

(assert (=> b!1075635 (= e!614767 (= lt!477453 (getCurrentListMapNoExtraKeys!3930 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1075636 () Bool)

(declare-fun e!614770 () ListLongMap!14675)

(declare-fun call!45550 () ListLongMap!14675)

(assert (=> b!1075636 (= e!614770 call!45550)))

(declare-fun b!1075637 () Bool)

(assert (=> b!1075637 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33700 _keys!1163)))))

(assert (=> b!1075637 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33699 _values!955)))))

(declare-fun e!614766 () Bool)

(assert (=> b!1075637 (= e!614766 (= (apply!933 lt!477453 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000)) (get!17235 (select (arr!33161 _values!955) #b00000000000000000000000000000000) (dynLambda!2032 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1075639 () Bool)

(declare-fun e!614771 () ListLongMap!14675)

(assert (=> b!1075639 (= e!614771 (ListLongMap!14676 Nil!23224))))

(declare-fun b!1075640 () Bool)

(declare-fun e!614768 () Bool)

(declare-fun e!614769 () Bool)

(assert (=> b!1075640 (= e!614768 e!614769)))

(declare-fun c!108085 () Bool)

(declare-fun e!614765 () Bool)

(assert (=> b!1075640 (= c!108085 e!614765)))

(declare-fun res!717035 () Bool)

(assert (=> b!1075640 (=> (not res!717035) (not e!614765))))

(assert (=> b!1075640 (= res!717035 (bvslt #b00000000000000000000000000000000 (size!33700 _keys!1163)))))

(declare-fun b!1075641 () Bool)

(declare-fun lt!477457 () Unit!35254)

(declare-fun lt!477454 () Unit!35254)

(assert (=> b!1075641 (= lt!477457 lt!477454)))

(declare-fun lt!477452 () (_ BitVec 64))

(declare-fun lt!477456 () V!39833)

(declare-fun lt!477458 () (_ BitVec 64))

(declare-fun lt!477455 () ListLongMap!14675)

(assert (=> b!1075641 (not (contains!6318 (+!3252 lt!477455 (tuple2!16707 lt!477458 lt!477456)) lt!477452))))

(declare-fun addStillNotContains!269 (ListLongMap!14675 (_ BitVec 64) V!39833 (_ BitVec 64)) Unit!35254)

(assert (=> b!1075641 (= lt!477454 (addStillNotContains!269 lt!477455 lt!477458 lt!477456 lt!477452))))

(assert (=> b!1075641 (= lt!477452 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1075641 (= lt!477456 (get!17235 (select (arr!33161 _values!955) #b00000000000000000000000000000000) (dynLambda!2032 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1075641 (= lt!477458 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075641 (= lt!477455 call!45550)))

(assert (=> b!1075641 (= e!614770 (+!3252 call!45550 (tuple2!16707 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000) (get!17235 (select (arr!33161 _values!955) #b00000000000000000000000000000000) (dynLambda!2032 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1075642 () Bool)

(assert (=> b!1075642 (= e!614769 e!614766)))

(assert (=> b!1075642 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33700 _keys!1163)))))

(declare-fun res!717037 () Bool)

(assert (=> b!1075642 (= res!717037 (contains!6318 lt!477453 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075642 (=> (not res!717037) (not e!614766))))

(declare-fun b!1075643 () Bool)

(declare-fun res!717036 () Bool)

(assert (=> b!1075643 (=> (not res!717036) (not e!614768))))

(assert (=> b!1075643 (= res!717036 (not (contains!6318 lt!477453 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1075644 () Bool)

(declare-fun isEmpty!963 (ListLongMap!14675) Bool)

(assert (=> b!1075644 (= e!614767 (isEmpty!963 lt!477453))))

(declare-fun b!1075645 () Bool)

(assert (=> b!1075645 (= e!614765 (validKeyInArray!0 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075645 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!45547 () Bool)

(assert (=> bm!45547 (= call!45550 (getCurrentListMapNoExtraKeys!3930 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1075646 () Bool)

(assert (=> b!1075646 (= e!614769 e!614767)))

(declare-fun c!108087 () Bool)

(assert (=> b!1075646 (= c!108087 (bvslt #b00000000000000000000000000000000 (size!33700 _keys!1163)))))

(declare-fun b!1075638 () Bool)

(assert (=> b!1075638 (= e!614771 e!614770)))

(declare-fun c!108086 () Bool)

(assert (=> b!1075638 (= c!108086 (validKeyInArray!0 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129479 () Bool)

(assert (=> d!129479 e!614768))

(declare-fun res!717038 () Bool)

(assert (=> d!129479 (=> (not res!717038) (not e!614768))))

(assert (=> d!129479 (= res!717038 (not (contains!6318 lt!477453 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129479 (= lt!477453 e!614771)))

(declare-fun c!108088 () Bool)

(assert (=> d!129479 (= c!108088 (bvsge #b00000000000000000000000000000000 (size!33700 _keys!1163)))))

(assert (=> d!129479 (validMask!0 mask!1515)))

(assert (=> d!129479 (= (getCurrentListMapNoExtraKeys!3930 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477453)))

(assert (= (and d!129479 c!108088) b!1075639))

(assert (= (and d!129479 (not c!108088)) b!1075638))

(assert (= (and b!1075638 c!108086) b!1075641))

(assert (= (and b!1075638 (not c!108086)) b!1075636))

(assert (= (or b!1075641 b!1075636) bm!45547))

(assert (= (and d!129479 res!717038) b!1075643))

(assert (= (and b!1075643 res!717036) b!1075640))

(assert (= (and b!1075640 res!717035) b!1075645))

(assert (= (and b!1075640 c!108085) b!1075642))

(assert (= (and b!1075640 (not c!108085)) b!1075646))

(assert (= (and b!1075642 res!717037) b!1075637))

(assert (= (and b!1075646 c!108087) b!1075635))

(assert (= (and b!1075646 (not c!108087)) b!1075644))

(declare-fun b_lambda!16883 () Bool)

(assert (=> (not b_lambda!16883) (not b!1075637)))

(assert (=> b!1075637 t!32575))

(declare-fun b_and!35139 () Bool)

(assert (= b_and!35137 (and (=> t!32575 result!14825) b_and!35139)))

(declare-fun b_lambda!16885 () Bool)

(assert (=> (not b_lambda!16885) (not b!1075641)))

(assert (=> b!1075641 t!32575))

(declare-fun b_and!35141 () Bool)

(assert (= b_and!35139 (and (=> t!32575 result!14825) b_and!35141)))

(assert (=> b!1075637 m!993879))

(assert (=> b!1075637 m!993889))

(assert (=> b!1075637 m!993889))

(assert (=> b!1075637 m!993891))

(assert (=> b!1075637 m!993893))

(assert (=> b!1075637 m!993891))

(assert (=> b!1075637 m!993879))

(declare-fun m!994011 () Bool)

(assert (=> b!1075637 m!994011))

(assert (=> b!1075642 m!993879))

(assert (=> b!1075642 m!993879))

(declare-fun m!994013 () Bool)

(assert (=> b!1075642 m!994013))

(declare-fun m!994015 () Bool)

(assert (=> b!1075644 m!994015))

(declare-fun m!994017 () Bool)

(assert (=> bm!45547 m!994017))

(declare-fun m!994019 () Bool)

(assert (=> b!1075643 m!994019))

(assert (=> b!1075635 m!994017))

(assert (=> b!1075645 m!993879))

(assert (=> b!1075645 m!993879))

(assert (=> b!1075645 m!993881))

(declare-fun m!994021 () Bool)

(assert (=> d!129479 m!994021))

(assert (=> d!129479 m!993809))

(declare-fun m!994023 () Bool)

(assert (=> b!1075641 m!994023))

(assert (=> b!1075641 m!993889))

(assert (=> b!1075641 m!993889))

(assert (=> b!1075641 m!993891))

(assert (=> b!1075641 m!993893))

(assert (=> b!1075641 m!993891))

(declare-fun m!994025 () Bool)

(assert (=> b!1075641 m!994025))

(assert (=> b!1075641 m!993879))

(declare-fun m!994027 () Bool)

(assert (=> b!1075641 m!994027))

(assert (=> b!1075641 m!994027))

(declare-fun m!994029 () Bool)

(assert (=> b!1075641 m!994029))

(assert (=> b!1075638 m!993879))

(assert (=> b!1075638 m!993879))

(assert (=> b!1075638 m!993881))

(assert (=> b!1075447 d!129479))

(declare-fun lt!477460 () ListLongMap!14675)

(declare-fun e!614774 () Bool)

(declare-fun b!1075647 () Bool)

(assert (=> b!1075647 (= e!614774 (= lt!477460 (getCurrentListMapNoExtraKeys!3930 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1075648 () Bool)

(declare-fun e!614777 () ListLongMap!14675)

(declare-fun call!45551 () ListLongMap!14675)

(assert (=> b!1075648 (= e!614777 call!45551)))

(declare-fun b!1075649 () Bool)

(assert (=> b!1075649 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33700 _keys!1163)))))

(assert (=> b!1075649 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33699 _values!955)))))

(declare-fun e!614773 () Bool)

(assert (=> b!1075649 (= e!614773 (= (apply!933 lt!477460 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000)) (get!17235 (select (arr!33161 _values!955) #b00000000000000000000000000000000) (dynLambda!2032 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1075651 () Bool)

(declare-fun e!614778 () ListLongMap!14675)

(assert (=> b!1075651 (= e!614778 (ListLongMap!14676 Nil!23224))))

(declare-fun b!1075652 () Bool)

(declare-fun e!614775 () Bool)

(declare-fun e!614776 () Bool)

(assert (=> b!1075652 (= e!614775 e!614776)))

(declare-fun c!108089 () Bool)

(declare-fun e!614772 () Bool)

(assert (=> b!1075652 (= c!108089 e!614772)))

(declare-fun res!717039 () Bool)

(assert (=> b!1075652 (=> (not res!717039) (not e!614772))))

(assert (=> b!1075652 (= res!717039 (bvslt #b00000000000000000000000000000000 (size!33700 _keys!1163)))))

(declare-fun b!1075653 () Bool)

(declare-fun lt!477464 () Unit!35254)

(declare-fun lt!477461 () Unit!35254)

(assert (=> b!1075653 (= lt!477464 lt!477461)))

(declare-fun lt!477463 () V!39833)

(declare-fun lt!477465 () (_ BitVec 64))

(declare-fun lt!477459 () (_ BitVec 64))

(declare-fun lt!477462 () ListLongMap!14675)

(assert (=> b!1075653 (not (contains!6318 (+!3252 lt!477462 (tuple2!16707 lt!477465 lt!477463)) lt!477459))))

(assert (=> b!1075653 (= lt!477461 (addStillNotContains!269 lt!477462 lt!477465 lt!477463 lt!477459))))

(assert (=> b!1075653 (= lt!477459 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1075653 (= lt!477463 (get!17235 (select (arr!33161 _values!955) #b00000000000000000000000000000000) (dynLambda!2032 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1075653 (= lt!477465 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075653 (= lt!477462 call!45551)))

(assert (=> b!1075653 (= e!614777 (+!3252 call!45551 (tuple2!16707 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000) (get!17235 (select (arr!33161 _values!955) #b00000000000000000000000000000000) (dynLambda!2032 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1075654 () Bool)

(assert (=> b!1075654 (= e!614776 e!614773)))

(assert (=> b!1075654 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33700 _keys!1163)))))

(declare-fun res!717041 () Bool)

(assert (=> b!1075654 (= res!717041 (contains!6318 lt!477460 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075654 (=> (not res!717041) (not e!614773))))

(declare-fun b!1075655 () Bool)

(declare-fun res!717040 () Bool)

(assert (=> b!1075655 (=> (not res!717040) (not e!614775))))

(assert (=> b!1075655 (= res!717040 (not (contains!6318 lt!477460 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1075656 () Bool)

(assert (=> b!1075656 (= e!614774 (isEmpty!963 lt!477460))))

(declare-fun b!1075657 () Bool)

(assert (=> b!1075657 (= e!614772 (validKeyInArray!0 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075657 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!45548 () Bool)

(assert (=> bm!45548 (= call!45551 (getCurrentListMapNoExtraKeys!3930 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1075658 () Bool)

(assert (=> b!1075658 (= e!614776 e!614774)))

(declare-fun c!108091 () Bool)

(assert (=> b!1075658 (= c!108091 (bvslt #b00000000000000000000000000000000 (size!33700 _keys!1163)))))

(declare-fun b!1075650 () Bool)

(assert (=> b!1075650 (= e!614778 e!614777)))

(declare-fun c!108090 () Bool)

(assert (=> b!1075650 (= c!108090 (validKeyInArray!0 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129481 () Bool)

(assert (=> d!129481 e!614775))

(declare-fun res!717042 () Bool)

(assert (=> d!129481 (=> (not res!717042) (not e!614775))))

(assert (=> d!129481 (= res!717042 (not (contains!6318 lt!477460 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129481 (= lt!477460 e!614778)))

(declare-fun c!108092 () Bool)

(assert (=> d!129481 (= c!108092 (bvsge #b00000000000000000000000000000000 (size!33700 _keys!1163)))))

(assert (=> d!129481 (validMask!0 mask!1515)))

(assert (=> d!129481 (= (getCurrentListMapNoExtraKeys!3930 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477460)))

(assert (= (and d!129481 c!108092) b!1075651))

(assert (= (and d!129481 (not c!108092)) b!1075650))

(assert (= (and b!1075650 c!108090) b!1075653))

(assert (= (and b!1075650 (not c!108090)) b!1075648))

(assert (= (or b!1075653 b!1075648) bm!45548))

(assert (= (and d!129481 res!717042) b!1075655))

(assert (= (and b!1075655 res!717040) b!1075652))

(assert (= (and b!1075652 res!717039) b!1075657))

(assert (= (and b!1075652 c!108089) b!1075654))

(assert (= (and b!1075652 (not c!108089)) b!1075658))

(assert (= (and b!1075654 res!717041) b!1075649))

(assert (= (and b!1075658 c!108091) b!1075647))

(assert (= (and b!1075658 (not c!108091)) b!1075656))

(declare-fun b_lambda!16887 () Bool)

(assert (=> (not b_lambda!16887) (not b!1075649)))

(assert (=> b!1075649 t!32575))

(declare-fun b_and!35143 () Bool)

(assert (= b_and!35141 (and (=> t!32575 result!14825) b_and!35143)))

(declare-fun b_lambda!16889 () Bool)

(assert (=> (not b_lambda!16889) (not b!1075653)))

(assert (=> b!1075653 t!32575))

(declare-fun b_and!35145 () Bool)

(assert (= b_and!35143 (and (=> t!32575 result!14825) b_and!35145)))

(assert (=> b!1075649 m!993879))

(assert (=> b!1075649 m!993889))

(assert (=> b!1075649 m!993889))

(assert (=> b!1075649 m!993891))

(assert (=> b!1075649 m!993893))

(assert (=> b!1075649 m!993891))

(assert (=> b!1075649 m!993879))

(declare-fun m!994031 () Bool)

(assert (=> b!1075649 m!994031))

(assert (=> b!1075654 m!993879))

(assert (=> b!1075654 m!993879))

(declare-fun m!994033 () Bool)

(assert (=> b!1075654 m!994033))

(declare-fun m!994035 () Bool)

(assert (=> b!1075656 m!994035))

(declare-fun m!994037 () Bool)

(assert (=> bm!45548 m!994037))

(declare-fun m!994039 () Bool)

(assert (=> b!1075655 m!994039))

(assert (=> b!1075647 m!994037))

(assert (=> b!1075657 m!993879))

(assert (=> b!1075657 m!993879))

(assert (=> b!1075657 m!993881))

(declare-fun m!994041 () Bool)

(assert (=> d!129481 m!994041))

(assert (=> d!129481 m!993809))

(declare-fun m!994043 () Bool)

(assert (=> b!1075653 m!994043))

(assert (=> b!1075653 m!993889))

(assert (=> b!1075653 m!993889))

(assert (=> b!1075653 m!993891))

(assert (=> b!1075653 m!993893))

(assert (=> b!1075653 m!993891))

(declare-fun m!994045 () Bool)

(assert (=> b!1075653 m!994045))

(assert (=> b!1075653 m!993879))

(declare-fun m!994047 () Bool)

(assert (=> b!1075653 m!994047))

(assert (=> b!1075653 m!994047))

(declare-fun m!994049 () Bool)

(assert (=> b!1075653 m!994049))

(assert (=> b!1075650 m!993879))

(assert (=> b!1075650 m!993879))

(assert (=> b!1075650 m!993881))

(assert (=> b!1075447 d!129481))

(declare-fun b!1075667 () Bool)

(declare-fun e!614785 () Bool)

(declare-fun e!614786 () Bool)

(assert (=> b!1075667 (= e!614785 e!614786)))

(declare-fun lt!477474 () (_ BitVec 64))

(assert (=> b!1075667 (= lt!477474 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477473 () Unit!35254)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68952 (_ BitVec 64) (_ BitVec 32)) Unit!35254)

(assert (=> b!1075667 (= lt!477473 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!477474 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68952 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1075667 (arrayContainsKey!0 _keys!1163 lt!477474 #b00000000000000000000000000000000)))

(declare-fun lt!477472 () Unit!35254)

(assert (=> b!1075667 (= lt!477472 lt!477473)))

(declare-fun res!717048 () Bool)

(declare-datatypes ((SeekEntryResult!9892 0))(
  ( (MissingZero!9892 (index!41939 (_ BitVec 32))) (Found!9892 (index!41940 (_ BitVec 32))) (Intermediate!9892 (undefined!10704 Bool) (index!41941 (_ BitVec 32)) (x!96398 (_ BitVec 32))) (Undefined!9892) (MissingVacant!9892 (index!41942 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68952 (_ BitVec 32)) SeekEntryResult!9892)

(assert (=> b!1075667 (= res!717048 (= (seekEntryOrOpen!0 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9892 #b00000000000000000000000000000000)))))

(assert (=> b!1075667 (=> (not res!717048) (not e!614786))))

(declare-fun b!1075668 () Bool)

(declare-fun call!45554 () Bool)

(assert (=> b!1075668 (= e!614785 call!45554)))

(declare-fun bm!45551 () Bool)

(assert (=> bm!45551 (= call!45554 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1075669 () Bool)

(declare-fun e!614787 () Bool)

(assert (=> b!1075669 (= e!614787 e!614785)))

(declare-fun c!108095 () Bool)

(assert (=> b!1075669 (= c!108095 (validKeyInArray!0 (select (arr!33162 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075670 () Bool)

(assert (=> b!1075670 (= e!614786 call!45554)))

(declare-fun d!129483 () Bool)

(declare-fun res!717047 () Bool)

(assert (=> d!129483 (=> res!717047 e!614787)))

(assert (=> d!129483 (= res!717047 (bvsge #b00000000000000000000000000000000 (size!33700 _keys!1163)))))

(assert (=> d!129483 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!614787)))

(assert (= (and d!129483 (not res!717047)) b!1075669))

(assert (= (and b!1075669 c!108095) b!1075667))

(assert (= (and b!1075669 (not c!108095)) b!1075668))

(assert (= (and b!1075667 res!717048) b!1075670))

(assert (= (or b!1075670 b!1075668) bm!45551))

(assert (=> b!1075667 m!993879))

(declare-fun m!994051 () Bool)

(assert (=> b!1075667 m!994051))

(declare-fun m!994053 () Bool)

(assert (=> b!1075667 m!994053))

(assert (=> b!1075667 m!993879))

(declare-fun m!994055 () Bool)

(assert (=> b!1075667 m!994055))

(declare-fun m!994057 () Bool)

(assert (=> bm!45551 m!994057))

(assert (=> b!1075669 m!993879))

(assert (=> b!1075669 m!993879))

(assert (=> b!1075669 m!993881))

(assert (=> b!1075446 d!129483))

(declare-fun b!1075677 () Bool)

(declare-fun e!614793 () Bool)

(assert (=> b!1075677 (= e!614793 tp_is_empty!26023)))

(declare-fun mapIsEmpty!40780 () Bool)

(declare-fun mapRes!40780 () Bool)

(assert (=> mapIsEmpty!40780 mapRes!40780))

(declare-fun condMapEmpty!40780 () Bool)

(declare-fun mapDefault!40780 () ValueCell!12308)

(assert (=> mapNonEmpty!40771 (= condMapEmpty!40780 (= mapRest!40771 ((as const (Array (_ BitVec 32) ValueCell!12308)) mapDefault!40780)))))

(declare-fun e!614792 () Bool)

(assert (=> mapNonEmpty!40771 (= tp!78128 (and e!614792 mapRes!40780))))

(declare-fun mapNonEmpty!40780 () Bool)

(declare-fun tp!78143 () Bool)

(assert (=> mapNonEmpty!40780 (= mapRes!40780 (and tp!78143 e!614793))))

(declare-fun mapValue!40780 () ValueCell!12308)

(declare-fun mapKey!40780 () (_ BitVec 32))

(declare-fun mapRest!40780 () (Array (_ BitVec 32) ValueCell!12308))

(assert (=> mapNonEmpty!40780 (= mapRest!40771 (store mapRest!40780 mapKey!40780 mapValue!40780))))

(declare-fun b!1075678 () Bool)

(assert (=> b!1075678 (= e!614792 tp_is_empty!26023)))

(assert (= (and mapNonEmpty!40771 condMapEmpty!40780) mapIsEmpty!40780))

(assert (= (and mapNonEmpty!40771 (not condMapEmpty!40780)) mapNonEmpty!40780))

(assert (= (and mapNonEmpty!40780 ((_ is ValueCellFull!12308) mapValue!40780)) b!1075677))

(assert (= (and mapNonEmpty!40771 ((_ is ValueCellFull!12308) mapDefault!40780)) b!1075678))

(declare-fun m!994059 () Bool)

(assert (=> mapNonEmpty!40780 m!994059))

(declare-fun b_lambda!16891 () Bool)

(assert (= b_lambda!16881 (or (and start!95150 b_free!22213) b_lambda!16891)))

(declare-fun b_lambda!16893 () Bool)

(assert (= b_lambda!16879 (or (and start!95150 b_free!22213) b_lambda!16893)))

(declare-fun b_lambda!16895 () Bool)

(assert (= b_lambda!16883 (or (and start!95150 b_free!22213) b_lambda!16895)))

(declare-fun b_lambda!16897 () Bool)

(assert (= b_lambda!16887 (or (and start!95150 b_free!22213) b_lambda!16897)))

(declare-fun b_lambda!16899 () Bool)

(assert (= b_lambda!16889 (or (and start!95150 b_free!22213) b_lambda!16899)))

(declare-fun b_lambda!16901 () Bool)

(assert (= b_lambda!16885 (or (and start!95150 b_free!22213) b_lambda!16901)))

(check-sat (not b!1075550) (not b_lambda!16895) (not b!1075653) (not b!1075645) (not bm!45532) (not bm!45541) (not bm!45547) (not b!1075656) (not b!1075571) (not b!1075574) (not b!1075608) (not bm!45533) (not b_lambda!16901) (not b!1075560) (not b!1075544) (not b!1075669) (not bm!45544) (not b!1075594) (not d!129463) (not b!1075591) (not b!1075593) (not bm!45539) (not d!129461) (not b_lambda!16897) (not bm!45551) (not b!1075647) (not b_next!22213) (not b!1075667) (not b!1075650) (not b_lambda!16893) (not b!1075562) (not b!1075649) (not b!1075637) (not d!129477) (not b_lambda!16891) (not d!129481) (not b!1075610) (not b!1075575) (not d!129479) (not bm!45548) (not d!129465) (not b!1075643) (not b!1075572) (not bm!45540) b_and!35145 (not bm!45529) (not b!1075573) (not b!1075583) (not b!1075582) (not b!1075554) (not b_lambda!16899) tp_is_empty!26023 (not b!1075642) (not b!1075563) (not b!1075657) (not bm!45534) (not b!1075655) (not b!1075644) (not b!1075638) (not mapNonEmpty!40780) (not bm!45536) (not b!1075654) (not b!1075606) (not b!1075635) (not b!1075585) (not b!1075641) (not b!1075551) (not b!1075552) (not d!129467) (not b!1075581))
(check-sat b_and!35145 (not b_next!22213))
