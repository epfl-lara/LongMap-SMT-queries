; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95036 () Bool)

(assert start!95036)

(declare-fun b_free!22177 () Bool)

(declare-fun b_next!22177 () Bool)

(assert (=> start!95036 (= b_free!22177 (not b_next!22177))))

(declare-fun tp!78007 () Bool)

(declare-fun b_and!35047 () Bool)

(assert (=> start!95036 (= tp!78007 b_and!35047)))

(declare-fun res!716357 () Bool)

(declare-fun e!613846 () Bool)

(assert (=> start!95036 (=> (not res!716357) (not e!613846))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95036 (= res!716357 (validMask!0 mask!1515))))

(assert (=> start!95036 e!613846))

(assert (=> start!95036 true))

(declare-fun tp_is_empty!25987 () Bool)

(assert (=> start!95036 tp_is_empty!25987))

(declare-datatypes ((V!39785 0))(
  ( (V!39786 (val!13044 Int)) )
))
(declare-datatypes ((ValueCell!12290 0))(
  ( (ValueCellFull!12290 (v!15664 V!39785)) (EmptyCell!12290) )
))
(declare-datatypes ((array!68870 0))(
  ( (array!68871 (arr!33125 (Array (_ BitVec 32) ValueCell!12290)) (size!33663 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68870)

(declare-fun e!613852 () Bool)

(declare-fun array_inv!25628 (array!68870) Bool)

(assert (=> start!95036 (and (array_inv!25628 _values!955) e!613852)))

(assert (=> start!95036 tp!78007))

(declare-datatypes ((array!68872 0))(
  ( (array!68873 (arr!33126 (Array (_ BitVec 32) (_ BitVec 64))) (size!33664 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68872)

(declare-fun array_inv!25629 (array!68872) Bool)

(assert (=> start!95036 (array_inv!25629 _keys!1163)))

(declare-fun mapNonEmpty!40705 () Bool)

(declare-fun mapRes!40705 () Bool)

(declare-fun tp!78008 () Bool)

(declare-fun e!613851 () Bool)

(assert (=> mapNonEmpty!40705 (= mapRes!40705 (and tp!78008 e!613851))))

(declare-fun mapKey!40705 () (_ BitVec 32))

(declare-fun mapRest!40705 () (Array (_ BitVec 32) ValueCell!12290))

(declare-fun mapValue!40705 () ValueCell!12290)

(assert (=> mapNonEmpty!40705 (= (arr!33125 _values!955) (store mapRest!40705 mapKey!40705 mapValue!40705))))

(declare-fun mapIsEmpty!40705 () Bool)

(assert (=> mapIsEmpty!40705 mapRes!40705))

(declare-fun b!1074288 () Bool)

(declare-fun e!613849 () Bool)

(assert (=> b!1074288 (= e!613849 tp_is_empty!25987)))

(declare-fun zeroValueBefore!47 () V!39785)

(declare-datatypes ((tuple2!16674 0))(
  ( (tuple2!16675 (_1!8348 (_ BitVec 64)) (_2!8348 V!39785)) )
))
(declare-datatypes ((List!23198 0))(
  ( (Nil!23195) (Cons!23194 (h!24403 tuple2!16674) (t!32534 List!23198)) )
))
(declare-datatypes ((ListLongMap!14643 0))(
  ( (ListLongMap!14644 (toList!7337 List!23198)) )
))
(declare-fun lt!476457 () ListLongMap!14643)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39785)

(declare-fun e!613853 () Bool)

(declare-fun b!1074289 () Bool)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4110 (array!68872 array!68870 (_ BitVec 32) (_ BitVec 32) V!39785 V!39785 (_ BitVec 32) Int) ListLongMap!14643)

(declare-fun +!3243 (ListLongMap!14643 tuple2!16674) ListLongMap!14643)

(assert (=> b!1074289 (= e!613853 (= (getCurrentListMap!4110 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (+!3243 lt!476457 (tuple2!16675 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun b!1074290 () Bool)

(declare-fun e!613850 () Bool)

(assert (=> b!1074290 (= e!613850 e!613853)))

(declare-fun res!716358 () Bool)

(assert (=> b!1074290 (=> res!716358 e!613853)))

(assert (=> b!1074290 (= res!716358 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1074291 () Bool)

(assert (=> b!1074291 (= e!613851 tp_is_empty!25987)))

(declare-fun b!1074292 () Bool)

(assert (=> b!1074292 (= e!613852 (and e!613849 mapRes!40705))))

(declare-fun condMapEmpty!40705 () Bool)

(declare-fun mapDefault!40705 () ValueCell!12290)

(assert (=> b!1074292 (= condMapEmpty!40705 (= (arr!33125 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12290)) mapDefault!40705)))))

(declare-fun b!1074293 () Bool)

(declare-fun lt!476458 () ListLongMap!14643)

(declare-fun e!613848 () Bool)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!39785)

(assert (=> b!1074293 (= e!613848 (= (getCurrentListMap!4110 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476458))))

(declare-fun b!1074294 () Bool)

(assert (=> b!1074294 (= e!613846 (not e!613848))))

(declare-fun res!716359 () Bool)

(assert (=> b!1074294 (=> res!716359 e!613848)))

(assert (=> b!1074294 (= res!716359 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1074294 e!613850))

(declare-fun res!716363 () Bool)

(assert (=> b!1074294 (=> (not res!716363) (not e!613850))))

(assert (=> b!1074294 (= res!716363 (= lt!476457 lt!476458))))

(declare-datatypes ((Unit!35216 0))(
  ( (Unit!35217) )
))
(declare-fun lt!476459 () Unit!35216)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!889 (array!68872 array!68870 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39785 V!39785 V!39785 V!39785 (_ BitVec 32) Int) Unit!35216)

(assert (=> b!1074294 (= lt!476459 (lemmaNoChangeToArrayThenSameMapNoExtras!889 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3917 (array!68872 array!68870 (_ BitVec 32) (_ BitVec 32) V!39785 V!39785 (_ BitVec 32) Int) ListLongMap!14643)

(assert (=> b!1074294 (= lt!476458 (getCurrentListMapNoExtraKeys!3917 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1074294 (= lt!476457 (getCurrentListMapNoExtraKeys!3917 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074295 () Bool)

(declare-fun res!716360 () Bool)

(assert (=> b!1074295 (=> (not res!716360) (not e!613846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68872 (_ BitVec 32)) Bool)

(assert (=> b!1074295 (= res!716360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1074296 () Bool)

(declare-fun res!716361 () Bool)

(assert (=> b!1074296 (=> (not res!716361) (not e!613846))))

(assert (=> b!1074296 (= res!716361 (and (= (size!33663 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33664 _keys!1163) (size!33663 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1074297 () Bool)

(declare-fun res!716362 () Bool)

(assert (=> b!1074297 (=> (not res!716362) (not e!613846))))

(declare-datatypes ((List!23199 0))(
  ( (Nil!23196) (Cons!23195 (h!24404 (_ BitVec 64)) (t!32535 List!23199)) )
))
(declare-fun arrayNoDuplicates!0 (array!68872 (_ BitVec 32) List!23199) Bool)

(assert (=> b!1074297 (= res!716362 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23196))))

(assert (= (and start!95036 res!716357) b!1074296))

(assert (= (and b!1074296 res!716361) b!1074295))

(assert (= (and b!1074295 res!716360) b!1074297))

(assert (= (and b!1074297 res!716362) b!1074294))

(assert (= (and b!1074294 res!716363) b!1074290))

(assert (= (and b!1074290 (not res!716358)) b!1074289))

(assert (= (and b!1074294 (not res!716359)) b!1074293))

(assert (= (and b!1074292 condMapEmpty!40705) mapIsEmpty!40705))

(assert (= (and b!1074292 (not condMapEmpty!40705)) mapNonEmpty!40705))

(get-info :version)

(assert (= (and mapNonEmpty!40705 ((_ is ValueCellFull!12290) mapValue!40705)) b!1074291))

(assert (= (and b!1074292 ((_ is ValueCellFull!12290) mapDefault!40705)) b!1074288))

(assert (= start!95036 b!1074292))

(declare-fun m!992681 () Bool)

(assert (=> b!1074289 m!992681))

(declare-fun m!992683 () Bool)

(assert (=> b!1074289 m!992683))

(declare-fun m!992685 () Bool)

(assert (=> b!1074294 m!992685))

(declare-fun m!992687 () Bool)

(assert (=> b!1074294 m!992687))

(declare-fun m!992689 () Bool)

(assert (=> b!1074294 m!992689))

(declare-fun m!992691 () Bool)

(assert (=> start!95036 m!992691))

(declare-fun m!992693 () Bool)

(assert (=> start!95036 m!992693))

(declare-fun m!992695 () Bool)

(assert (=> start!95036 m!992695))

(declare-fun m!992697 () Bool)

(assert (=> mapNonEmpty!40705 m!992697))

(declare-fun m!992699 () Bool)

(assert (=> b!1074297 m!992699))

(declare-fun m!992701 () Bool)

(assert (=> b!1074293 m!992701))

(declare-fun m!992703 () Bool)

(assert (=> b!1074295 m!992703))

(check-sat (not b!1074289) (not b!1074295) (not b!1074293) (not mapNonEmpty!40705) b_and!35047 (not b_next!22177) (not start!95036) (not b!1074294) tp_is_empty!25987 (not b!1074297))
(check-sat b_and!35047 (not b_next!22177))
(get-model)

(declare-fun d!129357 () Bool)

(assert (=> d!129357 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95036 d!129357))

(declare-fun d!129359 () Bool)

(assert (=> d!129359 (= (array_inv!25628 _values!955) (bvsge (size!33663 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95036 d!129359))

(declare-fun d!129361 () Bool)

(assert (=> d!129361 (= (array_inv!25629 _keys!1163) (bvsge (size!33664 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95036 d!129361))

(declare-fun b!1074400 () Bool)

(declare-fun e!613936 () Bool)

(declare-fun e!613930 () Bool)

(assert (=> b!1074400 (= e!613936 e!613930)))

(declare-fun res!716425 () Bool)

(declare-fun call!45391 () Bool)

(assert (=> b!1074400 (= res!716425 call!45391)))

(assert (=> b!1074400 (=> (not res!716425) (not e!613930))))

(declare-fun bm!45383 () Bool)

(declare-fun call!45388 () Bool)

(declare-fun lt!476538 () ListLongMap!14643)

(declare-fun contains!6306 (ListLongMap!14643 (_ BitVec 64)) Bool)

(assert (=> bm!45383 (= call!45388 (contains!6306 lt!476538 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1074401 () Bool)

(assert (=> b!1074401 (= e!613936 (not call!45391))))

(declare-fun e!613934 () Bool)

(declare-fun b!1074402 () Bool)

(declare-fun apply!929 (ListLongMap!14643 (_ BitVec 64)) V!39785)

(declare-fun get!17219 (ValueCell!12290 V!39785) V!39785)

(declare-fun dynLambda!2028 (Int (_ BitVec 64)) V!39785)

(assert (=> b!1074402 (= e!613934 (= (apply!929 lt!476538 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000)) (get!17219 (select (arr!33125 _values!955) #b00000000000000000000000000000000) (dynLambda!2028 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1074402 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33663 _values!955)))))

(assert (=> b!1074402 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33664 _keys!1163)))))

(declare-fun b!1074403 () Bool)

(declare-fun e!613932 () ListLongMap!14643)

(declare-fun e!613939 () ListLongMap!14643)

(assert (=> b!1074403 (= e!613932 e!613939)))

(declare-fun c!107877 () Bool)

(assert (=> b!1074403 (= c!107877 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!45390 () ListLongMap!14643)

(declare-fun bm!45384 () Bool)

(assert (=> bm!45384 (= call!45390 (getCurrentListMapNoExtraKeys!3917 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074404 () Bool)

(declare-fun e!613940 () ListLongMap!14643)

(declare-fun call!45392 () ListLongMap!14643)

(assert (=> b!1074404 (= e!613940 call!45392)))

(declare-fun b!1074405 () Bool)

(declare-fun call!45386 () ListLongMap!14643)

(assert (=> b!1074405 (= e!613932 (+!3243 call!45386 (tuple2!16675 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1074406 () Bool)

(declare-fun e!613928 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1074406 (= e!613928 (validKeyInArray!0 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074407 () Bool)

(declare-fun res!716430 () Bool)

(declare-fun e!613929 () Bool)

(assert (=> b!1074407 (=> (not res!716430) (not e!613929))))

(assert (=> b!1074407 (= res!716430 e!613936)))

(declare-fun c!107880 () Bool)

(assert (=> b!1074407 (= c!107880 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1074409 () Bool)

(declare-fun res!716427 () Bool)

(assert (=> b!1074409 (=> (not res!716427) (not e!613929))))

(declare-fun e!613935 () Bool)

(assert (=> b!1074409 (= res!716427 e!613935)))

(declare-fun res!716429 () Bool)

(assert (=> b!1074409 (=> res!716429 e!613935)))

(assert (=> b!1074409 (= res!716429 (not e!613928))))

(declare-fun res!716432 () Bool)

(assert (=> b!1074409 (=> (not res!716432) (not e!613928))))

(assert (=> b!1074409 (= res!716432 (bvslt #b00000000000000000000000000000000 (size!33664 _keys!1163)))))

(declare-fun b!1074410 () Bool)

(declare-fun e!613933 () Unit!35216)

(declare-fun Unit!35220 () Unit!35216)

(assert (=> b!1074410 (= e!613933 Unit!35220)))

(declare-fun b!1074411 () Bool)

(declare-fun call!45387 () ListLongMap!14643)

(assert (=> b!1074411 (= e!613939 call!45387)))

(declare-fun b!1074412 () Bool)

(assert (=> b!1074412 (= e!613930 (= (apply!929 lt!476538 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun call!45389 () ListLongMap!14643)

(declare-fun bm!45385 () Bool)

(declare-fun c!107879 () Bool)

(assert (=> bm!45385 (= call!45386 (+!3243 (ite c!107879 call!45390 (ite c!107877 call!45389 call!45392)) (ite (or c!107879 c!107877) (tuple2!16675 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16675 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun bm!45386 () Bool)

(assert (=> bm!45386 (= call!45389 call!45390)))

(declare-fun b!1074413 () Bool)

(assert (=> b!1074413 (= e!613940 call!45387)))

(declare-fun b!1074414 () Bool)

(declare-fun e!613931 () Bool)

(assert (=> b!1074414 (= e!613931 (not call!45388))))

(declare-fun b!1074415 () Bool)

(declare-fun e!613937 () Bool)

(assert (=> b!1074415 (= e!613931 e!613937)))

(declare-fun res!716424 () Bool)

(assert (=> b!1074415 (= res!716424 call!45388)))

(assert (=> b!1074415 (=> (not res!716424) (not e!613937))))

(declare-fun bm!45387 () Bool)

(assert (=> bm!45387 (= call!45392 call!45389)))

(declare-fun b!1074416 () Bool)

(declare-fun c!107875 () Bool)

(assert (=> b!1074416 (= c!107875 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1074416 (= e!613939 e!613940)))

(declare-fun b!1074417 () Bool)

(declare-fun lt!476531 () Unit!35216)

(assert (=> b!1074417 (= e!613933 lt!476531)))

(declare-fun lt!476529 () ListLongMap!14643)

(assert (=> b!1074417 (= lt!476529 (getCurrentListMapNoExtraKeys!3917 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476542 () (_ BitVec 64))

(assert (=> b!1074417 (= lt!476542 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476543 () (_ BitVec 64))

(assert (=> b!1074417 (= lt!476543 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476523 () Unit!35216)

(declare-fun addStillContains!642 (ListLongMap!14643 (_ BitVec 64) V!39785 (_ BitVec 64)) Unit!35216)

(assert (=> b!1074417 (= lt!476523 (addStillContains!642 lt!476529 lt!476542 zeroValueAfter!47 lt!476543))))

(assert (=> b!1074417 (contains!6306 (+!3243 lt!476529 (tuple2!16675 lt!476542 zeroValueAfter!47)) lt!476543)))

(declare-fun lt!476530 () Unit!35216)

(assert (=> b!1074417 (= lt!476530 lt!476523)))

(declare-fun lt!476533 () ListLongMap!14643)

(assert (=> b!1074417 (= lt!476533 (getCurrentListMapNoExtraKeys!3917 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476532 () (_ BitVec 64))

(assert (=> b!1074417 (= lt!476532 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476527 () (_ BitVec 64))

(assert (=> b!1074417 (= lt!476527 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476540 () Unit!35216)

(declare-fun addApplyDifferent!498 (ListLongMap!14643 (_ BitVec 64) V!39785 (_ BitVec 64)) Unit!35216)

(assert (=> b!1074417 (= lt!476540 (addApplyDifferent!498 lt!476533 lt!476532 minValue!907 lt!476527))))

(assert (=> b!1074417 (= (apply!929 (+!3243 lt!476533 (tuple2!16675 lt!476532 minValue!907)) lt!476527) (apply!929 lt!476533 lt!476527))))

(declare-fun lt!476528 () Unit!35216)

(assert (=> b!1074417 (= lt!476528 lt!476540)))

(declare-fun lt!476537 () ListLongMap!14643)

(assert (=> b!1074417 (= lt!476537 (getCurrentListMapNoExtraKeys!3917 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476536 () (_ BitVec 64))

(assert (=> b!1074417 (= lt!476536 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476539 () (_ BitVec 64))

(assert (=> b!1074417 (= lt!476539 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476534 () Unit!35216)

(assert (=> b!1074417 (= lt!476534 (addApplyDifferent!498 lt!476537 lt!476536 zeroValueAfter!47 lt!476539))))

(assert (=> b!1074417 (= (apply!929 (+!3243 lt!476537 (tuple2!16675 lt!476536 zeroValueAfter!47)) lt!476539) (apply!929 lt!476537 lt!476539))))

(declare-fun lt!476524 () Unit!35216)

(assert (=> b!1074417 (= lt!476524 lt!476534)))

(declare-fun lt!476541 () ListLongMap!14643)

(assert (=> b!1074417 (= lt!476541 (getCurrentListMapNoExtraKeys!3917 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476522 () (_ BitVec 64))

(assert (=> b!1074417 (= lt!476522 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476525 () (_ BitVec 64))

(assert (=> b!1074417 (= lt!476525 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074417 (= lt!476531 (addApplyDifferent!498 lt!476541 lt!476522 minValue!907 lt!476525))))

(assert (=> b!1074417 (= (apply!929 (+!3243 lt!476541 (tuple2!16675 lt!476522 minValue!907)) lt!476525) (apply!929 lt!476541 lt!476525))))

(declare-fun bm!45388 () Bool)

(assert (=> bm!45388 (= call!45387 call!45386)))

(declare-fun d!129363 () Bool)

(assert (=> d!129363 e!613929))

(declare-fun res!716426 () Bool)

(assert (=> d!129363 (=> (not res!716426) (not e!613929))))

(assert (=> d!129363 (= res!716426 (or (bvsge #b00000000000000000000000000000000 (size!33664 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33664 _keys!1163)))))))

(declare-fun lt!476535 () ListLongMap!14643)

(assert (=> d!129363 (= lt!476538 lt!476535)))

(declare-fun lt!476526 () Unit!35216)

(assert (=> d!129363 (= lt!476526 e!613933)))

(declare-fun c!107876 () Bool)

(declare-fun e!613938 () Bool)

(assert (=> d!129363 (= c!107876 e!613938)))

(declare-fun res!716431 () Bool)

(assert (=> d!129363 (=> (not res!716431) (not e!613938))))

(assert (=> d!129363 (= res!716431 (bvslt #b00000000000000000000000000000000 (size!33664 _keys!1163)))))

(assert (=> d!129363 (= lt!476535 e!613932)))

(assert (=> d!129363 (= c!107879 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129363 (validMask!0 mask!1515)))

(assert (=> d!129363 (= (getCurrentListMap!4110 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476538)))

(declare-fun b!1074408 () Bool)

(assert (=> b!1074408 (= e!613929 e!613931)))

(declare-fun c!107878 () Bool)

(assert (=> b!1074408 (= c!107878 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1074418 () Bool)

(assert (=> b!1074418 (= e!613938 (validKeyInArray!0 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45389 () Bool)

(assert (=> bm!45389 (= call!45391 (contains!6306 lt!476538 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1074419 () Bool)

(assert (=> b!1074419 (= e!613937 (= (apply!929 lt!476538 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1074420 () Bool)

(assert (=> b!1074420 (= e!613935 e!613934)))

(declare-fun res!716428 () Bool)

(assert (=> b!1074420 (=> (not res!716428) (not e!613934))))

(assert (=> b!1074420 (= res!716428 (contains!6306 lt!476538 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074420 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33664 _keys!1163)))))

(assert (= (and d!129363 c!107879) b!1074405))

(assert (= (and d!129363 (not c!107879)) b!1074403))

(assert (= (and b!1074403 c!107877) b!1074411))

(assert (= (and b!1074403 (not c!107877)) b!1074416))

(assert (= (and b!1074416 c!107875) b!1074413))

(assert (= (and b!1074416 (not c!107875)) b!1074404))

(assert (= (or b!1074413 b!1074404) bm!45387))

(assert (= (or b!1074411 bm!45387) bm!45386))

(assert (= (or b!1074411 b!1074413) bm!45388))

(assert (= (or b!1074405 bm!45386) bm!45384))

(assert (= (or b!1074405 bm!45388) bm!45385))

(assert (= (and d!129363 res!716431) b!1074418))

(assert (= (and d!129363 c!107876) b!1074417))

(assert (= (and d!129363 (not c!107876)) b!1074410))

(assert (= (and d!129363 res!716426) b!1074409))

(assert (= (and b!1074409 res!716432) b!1074406))

(assert (= (and b!1074409 (not res!716429)) b!1074420))

(assert (= (and b!1074420 res!716428) b!1074402))

(assert (= (and b!1074409 res!716427) b!1074407))

(assert (= (and b!1074407 c!107880) b!1074400))

(assert (= (and b!1074407 (not c!107880)) b!1074401))

(assert (= (and b!1074400 res!716425) b!1074412))

(assert (= (or b!1074400 b!1074401) bm!45389))

(assert (= (and b!1074407 res!716430) b!1074408))

(assert (= (and b!1074408 c!107878) b!1074415))

(assert (= (and b!1074408 (not c!107878)) b!1074414))

(assert (= (and b!1074415 res!716424) b!1074419))

(assert (= (or b!1074415 b!1074414) bm!45383))

(declare-fun b_lambda!16787 () Bool)

(assert (=> (not b_lambda!16787) (not b!1074402)))

(declare-fun t!32540 () Bool)

(declare-fun tb!7159 () Bool)

(assert (=> (and start!95036 (= defaultEntry!963 defaultEntry!963) t!32540) tb!7159))

(declare-fun result!14801 () Bool)

(assert (=> tb!7159 (= result!14801 tp_is_empty!25987)))

(assert (=> b!1074402 t!32540))

(declare-fun b_and!35053 () Bool)

(assert (= b_and!35047 (and (=> t!32540 result!14801) b_and!35053)))

(declare-fun m!992753 () Bool)

(assert (=> b!1074419 m!992753))

(declare-fun m!992755 () Bool)

(assert (=> b!1074402 m!992755))

(declare-fun m!992757 () Bool)

(assert (=> b!1074402 m!992757))

(assert (=> b!1074402 m!992757))

(declare-fun m!992759 () Bool)

(assert (=> b!1074402 m!992759))

(declare-fun m!992761 () Bool)

(assert (=> b!1074402 m!992761))

(assert (=> b!1074402 m!992761))

(assert (=> b!1074402 m!992755))

(declare-fun m!992763 () Bool)

(assert (=> b!1074402 m!992763))

(assert (=> b!1074418 m!992757))

(assert (=> b!1074418 m!992757))

(declare-fun m!992765 () Bool)

(assert (=> b!1074418 m!992765))

(declare-fun m!992767 () Bool)

(assert (=> bm!45385 m!992767))

(declare-fun m!992769 () Bool)

(assert (=> b!1074412 m!992769))

(assert (=> b!1074420 m!992757))

(assert (=> b!1074420 m!992757))

(declare-fun m!992771 () Bool)

(assert (=> b!1074420 m!992771))

(assert (=> bm!45384 m!992687))

(assert (=> d!129363 m!992691))

(declare-fun m!992773 () Bool)

(assert (=> bm!45389 m!992773))

(declare-fun m!992775 () Bool)

(assert (=> b!1074405 m!992775))

(declare-fun m!992777 () Bool)

(assert (=> bm!45383 m!992777))

(declare-fun m!992779 () Bool)

(assert (=> b!1074417 m!992779))

(declare-fun m!992781 () Bool)

(assert (=> b!1074417 m!992781))

(assert (=> b!1074417 m!992779))

(declare-fun m!992783 () Bool)

(assert (=> b!1074417 m!992783))

(declare-fun m!992785 () Bool)

(assert (=> b!1074417 m!992785))

(declare-fun m!992787 () Bool)

(assert (=> b!1074417 m!992787))

(declare-fun m!992789 () Bool)

(assert (=> b!1074417 m!992789))

(declare-fun m!992791 () Bool)

(assert (=> b!1074417 m!992791))

(assert (=> b!1074417 m!992757))

(declare-fun m!992793 () Bool)

(assert (=> b!1074417 m!992793))

(declare-fun m!992795 () Bool)

(assert (=> b!1074417 m!992795))

(declare-fun m!992797 () Bool)

(assert (=> b!1074417 m!992797))

(assert (=> b!1074417 m!992791))

(declare-fun m!992799 () Bool)

(assert (=> b!1074417 m!992799))

(declare-fun m!992801 () Bool)

(assert (=> b!1074417 m!992801))

(declare-fun m!992803 () Bool)

(assert (=> b!1074417 m!992803))

(assert (=> b!1074417 m!992797))

(declare-fun m!992805 () Bool)

(assert (=> b!1074417 m!992805))

(assert (=> b!1074417 m!992785))

(assert (=> b!1074417 m!992687))

(declare-fun m!992807 () Bool)

(assert (=> b!1074417 m!992807))

(assert (=> b!1074406 m!992757))

(assert (=> b!1074406 m!992757))

(assert (=> b!1074406 m!992765))

(assert (=> b!1074293 d!129363))

(declare-fun b!1074433 () Bool)

(declare-fun e!613950 () Bool)

(declare-fun call!45395 () Bool)

(assert (=> b!1074433 (= e!613950 call!45395)))

(declare-fun b!1074434 () Bool)

(assert (=> b!1074434 (= e!613950 call!45395)))

(declare-fun d!129365 () Bool)

(declare-fun res!716440 () Bool)

(declare-fun e!613952 () Bool)

(assert (=> d!129365 (=> res!716440 e!613952)))

(assert (=> d!129365 (= res!716440 (bvsge #b00000000000000000000000000000000 (size!33664 _keys!1163)))))

(assert (=> d!129365 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23196) e!613952)))

(declare-fun b!1074435 () Bool)

(declare-fun e!613949 () Bool)

(declare-fun contains!6307 (List!23199 (_ BitVec 64)) Bool)

(assert (=> b!1074435 (= e!613949 (contains!6307 Nil!23196 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074436 () Bool)

(declare-fun e!613951 () Bool)

(assert (=> b!1074436 (= e!613951 e!613950)))

(declare-fun c!107883 () Bool)

(assert (=> b!1074436 (= c!107883 (validKeyInArray!0 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45392 () Bool)

(assert (=> bm!45392 (= call!45395 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107883 (Cons!23195 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000) Nil!23196) Nil!23196)))))

(declare-fun b!1074437 () Bool)

(assert (=> b!1074437 (= e!613952 e!613951)))

(declare-fun res!716441 () Bool)

(assert (=> b!1074437 (=> (not res!716441) (not e!613951))))

(assert (=> b!1074437 (= res!716441 (not e!613949))))

(declare-fun res!716439 () Bool)

(assert (=> b!1074437 (=> (not res!716439) (not e!613949))))

(assert (=> b!1074437 (= res!716439 (validKeyInArray!0 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129365 (not res!716440)) b!1074437))

(assert (= (and b!1074437 res!716439) b!1074435))

(assert (= (and b!1074437 res!716441) b!1074436))

(assert (= (and b!1074436 c!107883) b!1074433))

(assert (= (and b!1074436 (not c!107883)) b!1074434))

(assert (= (or b!1074433 b!1074434) bm!45392))

(assert (=> b!1074435 m!992757))

(assert (=> b!1074435 m!992757))

(declare-fun m!992809 () Bool)

(assert (=> b!1074435 m!992809))

(assert (=> b!1074436 m!992757))

(assert (=> b!1074436 m!992757))

(assert (=> b!1074436 m!992765))

(assert (=> bm!45392 m!992757))

(declare-fun m!992811 () Bool)

(assert (=> bm!45392 m!992811))

(assert (=> b!1074437 m!992757))

(assert (=> b!1074437 m!992757))

(assert (=> b!1074437 m!992765))

(assert (=> b!1074297 d!129365))

(declare-fun bm!45395 () Bool)

(declare-fun call!45398 () Bool)

(assert (=> bm!45395 (= call!45398 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1074446 () Bool)

(declare-fun e!613961 () Bool)

(declare-fun e!613960 () Bool)

(assert (=> b!1074446 (= e!613961 e!613960)))

(declare-fun c!107886 () Bool)

(assert (=> b!1074446 (= c!107886 (validKeyInArray!0 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129367 () Bool)

(declare-fun res!716446 () Bool)

(assert (=> d!129367 (=> res!716446 e!613961)))

(assert (=> d!129367 (= res!716446 (bvsge #b00000000000000000000000000000000 (size!33664 _keys!1163)))))

(assert (=> d!129367 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!613961)))

(declare-fun b!1074447 () Bool)

(declare-fun e!613959 () Bool)

(assert (=> b!1074447 (= e!613960 e!613959)))

(declare-fun lt!476552 () (_ BitVec 64))

(assert (=> b!1074447 (= lt!476552 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476551 () Unit!35216)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68872 (_ BitVec 64) (_ BitVec 32)) Unit!35216)

(assert (=> b!1074447 (= lt!476551 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!476552 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68872 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1074447 (arrayContainsKey!0 _keys!1163 lt!476552 #b00000000000000000000000000000000)))

(declare-fun lt!476550 () Unit!35216)

(assert (=> b!1074447 (= lt!476550 lt!476551)))

(declare-fun res!716447 () Bool)

(declare-datatypes ((SeekEntryResult!9888 0))(
  ( (MissingZero!9888 (index!41923 (_ BitVec 32))) (Found!9888 (index!41924 (_ BitVec 32))) (Intermediate!9888 (undefined!10700 Bool) (index!41925 (_ BitVec 32)) (x!96302 (_ BitVec 32))) (Undefined!9888) (MissingVacant!9888 (index!41926 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68872 (_ BitVec 32)) SeekEntryResult!9888)

(assert (=> b!1074447 (= res!716447 (= (seekEntryOrOpen!0 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9888 #b00000000000000000000000000000000)))))

(assert (=> b!1074447 (=> (not res!716447) (not e!613959))))

(declare-fun b!1074448 () Bool)

(assert (=> b!1074448 (= e!613960 call!45398)))

(declare-fun b!1074449 () Bool)

(assert (=> b!1074449 (= e!613959 call!45398)))

(assert (= (and d!129367 (not res!716446)) b!1074446))

(assert (= (and b!1074446 c!107886) b!1074447))

(assert (= (and b!1074446 (not c!107886)) b!1074448))

(assert (= (and b!1074447 res!716447) b!1074449))

(assert (= (or b!1074449 b!1074448) bm!45395))

(declare-fun m!992813 () Bool)

(assert (=> bm!45395 m!992813))

(assert (=> b!1074446 m!992757))

(assert (=> b!1074446 m!992757))

(assert (=> b!1074446 m!992765))

(assert (=> b!1074447 m!992757))

(declare-fun m!992815 () Bool)

(assert (=> b!1074447 m!992815))

(declare-fun m!992817 () Bool)

(assert (=> b!1074447 m!992817))

(assert (=> b!1074447 m!992757))

(declare-fun m!992819 () Bool)

(assert (=> b!1074447 m!992819))

(assert (=> b!1074295 d!129367))

(declare-fun d!129369 () Bool)

(assert (=> d!129369 (= (getCurrentListMapNoExtraKeys!3917 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3917 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476555 () Unit!35216)

(declare-fun choose!1758 (array!68872 array!68870 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39785 V!39785 V!39785 V!39785 (_ BitVec 32) Int) Unit!35216)

(assert (=> d!129369 (= lt!476555 (choose!1758 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129369 (validMask!0 mask!1515)))

(assert (=> d!129369 (= (lemmaNoChangeToArrayThenSameMapNoExtras!889 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476555)))

(declare-fun bs!31636 () Bool)

(assert (= bs!31636 d!129369))

(assert (=> bs!31636 m!992689))

(assert (=> bs!31636 m!992687))

(declare-fun m!992821 () Bool)

(assert (=> bs!31636 m!992821))

(assert (=> bs!31636 m!992691))

(assert (=> b!1074294 d!129369))

(declare-fun lt!476575 () ListLongMap!14643)

(declare-fun e!613978 () Bool)

(declare-fun b!1074474 () Bool)

(assert (=> b!1074474 (= e!613978 (= lt!476575 (getCurrentListMapNoExtraKeys!3917 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1074475 () Bool)

(declare-fun res!716457 () Bool)

(declare-fun e!613982 () Bool)

(assert (=> b!1074475 (=> (not res!716457) (not e!613982))))

(assert (=> b!1074475 (= res!716457 (not (contains!6306 lt!476575 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1074476 () Bool)

(assert (=> b!1074476 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33664 _keys!1163)))))

(assert (=> b!1074476 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33663 _values!955)))))

(declare-fun e!613979 () Bool)

(assert (=> b!1074476 (= e!613979 (= (apply!929 lt!476575 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000)) (get!17219 (select (arr!33125 _values!955) #b00000000000000000000000000000000) (dynLambda!2028 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1074477 () Bool)

(declare-fun lt!476576 () Unit!35216)

(declare-fun lt!476573 () Unit!35216)

(assert (=> b!1074477 (= lt!476576 lt!476573)))

(declare-fun lt!476571 () ListLongMap!14643)

(declare-fun lt!476572 () (_ BitVec 64))

(declare-fun lt!476570 () V!39785)

(declare-fun lt!476574 () (_ BitVec 64))

(assert (=> b!1074477 (not (contains!6306 (+!3243 lt!476571 (tuple2!16675 lt!476574 lt!476570)) lt!476572))))

(declare-fun addStillNotContains!265 (ListLongMap!14643 (_ BitVec 64) V!39785 (_ BitVec 64)) Unit!35216)

(assert (=> b!1074477 (= lt!476573 (addStillNotContains!265 lt!476571 lt!476574 lt!476570 lt!476572))))

(assert (=> b!1074477 (= lt!476572 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1074477 (= lt!476570 (get!17219 (select (arr!33125 _values!955) #b00000000000000000000000000000000) (dynLambda!2028 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1074477 (= lt!476574 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45401 () ListLongMap!14643)

(assert (=> b!1074477 (= lt!476571 call!45401)))

(declare-fun e!613977 () ListLongMap!14643)

(assert (=> b!1074477 (= e!613977 (+!3243 call!45401 (tuple2!16675 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000) (get!17219 (select (arr!33125 _values!955) #b00000000000000000000000000000000) (dynLambda!2028 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1074478 () Bool)

(declare-fun e!613976 () Bool)

(assert (=> b!1074478 (= e!613976 (validKeyInArray!0 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074478 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1074479 () Bool)

(assert (=> b!1074479 (= e!613977 call!45401)))

(declare-fun b!1074480 () Bool)

(declare-fun e!613980 () ListLongMap!14643)

(assert (=> b!1074480 (= e!613980 e!613977)))

(declare-fun c!107897 () Bool)

(assert (=> b!1074480 (= c!107897 (validKeyInArray!0 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074481 () Bool)

(declare-fun e!613981 () Bool)

(assert (=> b!1074481 (= e!613981 e!613979)))

(assert (=> b!1074481 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33664 _keys!1163)))))

(declare-fun res!716456 () Bool)

(assert (=> b!1074481 (= res!716456 (contains!6306 lt!476575 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074481 (=> (not res!716456) (not e!613979))))

(declare-fun bm!45398 () Bool)

(assert (=> bm!45398 (= call!45401 (getCurrentListMapNoExtraKeys!3917 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun d!129371 () Bool)

(assert (=> d!129371 e!613982))

(declare-fun res!716459 () Bool)

(assert (=> d!129371 (=> (not res!716459) (not e!613982))))

(assert (=> d!129371 (= res!716459 (not (contains!6306 lt!476575 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129371 (= lt!476575 e!613980)))

(declare-fun c!107896 () Bool)

(assert (=> d!129371 (= c!107896 (bvsge #b00000000000000000000000000000000 (size!33664 _keys!1163)))))

(assert (=> d!129371 (validMask!0 mask!1515)))

(assert (=> d!129371 (= (getCurrentListMapNoExtraKeys!3917 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476575)))

(declare-fun b!1074482 () Bool)

(assert (=> b!1074482 (= e!613980 (ListLongMap!14644 Nil!23195))))

(declare-fun b!1074483 () Bool)

(declare-fun isEmpty!959 (ListLongMap!14643) Bool)

(assert (=> b!1074483 (= e!613978 (isEmpty!959 lt!476575))))

(declare-fun b!1074484 () Bool)

(assert (=> b!1074484 (= e!613981 e!613978)))

(declare-fun c!107895 () Bool)

(assert (=> b!1074484 (= c!107895 (bvslt #b00000000000000000000000000000000 (size!33664 _keys!1163)))))

(declare-fun b!1074485 () Bool)

(assert (=> b!1074485 (= e!613982 e!613981)))

(declare-fun c!107898 () Bool)

(assert (=> b!1074485 (= c!107898 e!613976)))

(declare-fun res!716458 () Bool)

(assert (=> b!1074485 (=> (not res!716458) (not e!613976))))

(assert (=> b!1074485 (= res!716458 (bvslt #b00000000000000000000000000000000 (size!33664 _keys!1163)))))

(assert (= (and d!129371 c!107896) b!1074482))

(assert (= (and d!129371 (not c!107896)) b!1074480))

(assert (= (and b!1074480 c!107897) b!1074477))

(assert (= (and b!1074480 (not c!107897)) b!1074479))

(assert (= (or b!1074477 b!1074479) bm!45398))

(assert (= (and d!129371 res!716459) b!1074475))

(assert (= (and b!1074475 res!716457) b!1074485))

(assert (= (and b!1074485 res!716458) b!1074478))

(assert (= (and b!1074485 c!107898) b!1074481))

(assert (= (and b!1074485 (not c!107898)) b!1074484))

(assert (= (and b!1074481 res!716456) b!1074476))

(assert (= (and b!1074484 c!107895) b!1074474))

(assert (= (and b!1074484 (not c!107895)) b!1074483))

(declare-fun b_lambda!16789 () Bool)

(assert (=> (not b_lambda!16789) (not b!1074476)))

(assert (=> b!1074476 t!32540))

(declare-fun b_and!35055 () Bool)

(assert (= b_and!35053 (and (=> t!32540 result!14801) b_and!35055)))

(declare-fun b_lambda!16791 () Bool)

(assert (=> (not b_lambda!16791) (not b!1074477)))

(assert (=> b!1074477 t!32540))

(declare-fun b_and!35057 () Bool)

(assert (= b_and!35055 (and (=> t!32540 result!14801) b_and!35057)))

(declare-fun m!992823 () Bool)

(assert (=> bm!45398 m!992823))

(assert (=> b!1074478 m!992757))

(assert (=> b!1074478 m!992757))

(assert (=> b!1074478 m!992765))

(declare-fun m!992825 () Bool)

(assert (=> b!1074475 m!992825))

(assert (=> b!1074474 m!992823))

(declare-fun m!992827 () Bool)

(assert (=> d!129371 m!992827))

(assert (=> d!129371 m!992691))

(declare-fun m!992829 () Bool)

(assert (=> b!1074477 m!992829))

(declare-fun m!992831 () Bool)

(assert (=> b!1074477 m!992831))

(declare-fun m!992833 () Bool)

(assert (=> b!1074477 m!992833))

(assert (=> b!1074477 m!992761))

(assert (=> b!1074477 m!992829))

(declare-fun m!992835 () Bool)

(assert (=> b!1074477 m!992835))

(assert (=> b!1074477 m!992757))

(assert (=> b!1074477 m!992755))

(assert (=> b!1074477 m!992761))

(assert (=> b!1074477 m!992755))

(assert (=> b!1074477 m!992763))

(assert (=> b!1074476 m!992761))

(assert (=> b!1074476 m!992757))

(assert (=> b!1074476 m!992755))

(assert (=> b!1074476 m!992757))

(declare-fun m!992837 () Bool)

(assert (=> b!1074476 m!992837))

(assert (=> b!1074476 m!992761))

(assert (=> b!1074476 m!992755))

(assert (=> b!1074476 m!992763))

(assert (=> b!1074481 m!992757))

(assert (=> b!1074481 m!992757))

(declare-fun m!992839 () Bool)

(assert (=> b!1074481 m!992839))

(declare-fun m!992841 () Bool)

(assert (=> b!1074483 m!992841))

(assert (=> b!1074480 m!992757))

(assert (=> b!1074480 m!992757))

(assert (=> b!1074480 m!992765))

(assert (=> b!1074294 d!129371))

(declare-fun e!613985 () Bool)

(declare-fun b!1074486 () Bool)

(declare-fun lt!476582 () ListLongMap!14643)

(assert (=> b!1074486 (= e!613985 (= lt!476582 (getCurrentListMapNoExtraKeys!3917 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1074487 () Bool)

(declare-fun res!716461 () Bool)

(declare-fun e!613989 () Bool)

(assert (=> b!1074487 (=> (not res!716461) (not e!613989))))

(assert (=> b!1074487 (= res!716461 (not (contains!6306 lt!476582 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1074488 () Bool)

(assert (=> b!1074488 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33664 _keys!1163)))))

(assert (=> b!1074488 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33663 _values!955)))))

(declare-fun e!613986 () Bool)

(assert (=> b!1074488 (= e!613986 (= (apply!929 lt!476582 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000)) (get!17219 (select (arr!33125 _values!955) #b00000000000000000000000000000000) (dynLambda!2028 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1074489 () Bool)

(declare-fun lt!476583 () Unit!35216)

(declare-fun lt!476580 () Unit!35216)

(assert (=> b!1074489 (= lt!476583 lt!476580)))

(declare-fun lt!476581 () (_ BitVec 64))

(declare-fun lt!476578 () ListLongMap!14643)

(declare-fun lt!476577 () V!39785)

(declare-fun lt!476579 () (_ BitVec 64))

(assert (=> b!1074489 (not (contains!6306 (+!3243 lt!476578 (tuple2!16675 lt!476581 lt!476577)) lt!476579))))

(assert (=> b!1074489 (= lt!476580 (addStillNotContains!265 lt!476578 lt!476581 lt!476577 lt!476579))))

(assert (=> b!1074489 (= lt!476579 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1074489 (= lt!476577 (get!17219 (select (arr!33125 _values!955) #b00000000000000000000000000000000) (dynLambda!2028 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1074489 (= lt!476581 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45402 () ListLongMap!14643)

(assert (=> b!1074489 (= lt!476578 call!45402)))

(declare-fun e!613984 () ListLongMap!14643)

(assert (=> b!1074489 (= e!613984 (+!3243 call!45402 (tuple2!16675 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000) (get!17219 (select (arr!33125 _values!955) #b00000000000000000000000000000000) (dynLambda!2028 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1074490 () Bool)

(declare-fun e!613983 () Bool)

(assert (=> b!1074490 (= e!613983 (validKeyInArray!0 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074490 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1074491 () Bool)

(assert (=> b!1074491 (= e!613984 call!45402)))

(declare-fun b!1074492 () Bool)

(declare-fun e!613987 () ListLongMap!14643)

(assert (=> b!1074492 (= e!613987 e!613984)))

(declare-fun c!107901 () Bool)

(assert (=> b!1074492 (= c!107901 (validKeyInArray!0 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074493 () Bool)

(declare-fun e!613988 () Bool)

(assert (=> b!1074493 (= e!613988 e!613986)))

(assert (=> b!1074493 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33664 _keys!1163)))))

(declare-fun res!716460 () Bool)

(assert (=> b!1074493 (= res!716460 (contains!6306 lt!476582 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074493 (=> (not res!716460) (not e!613986))))

(declare-fun bm!45399 () Bool)

(assert (=> bm!45399 (= call!45402 (getCurrentListMapNoExtraKeys!3917 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun d!129373 () Bool)

(assert (=> d!129373 e!613989))

(declare-fun res!716463 () Bool)

(assert (=> d!129373 (=> (not res!716463) (not e!613989))))

(assert (=> d!129373 (= res!716463 (not (contains!6306 lt!476582 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129373 (= lt!476582 e!613987)))

(declare-fun c!107900 () Bool)

(assert (=> d!129373 (= c!107900 (bvsge #b00000000000000000000000000000000 (size!33664 _keys!1163)))))

(assert (=> d!129373 (validMask!0 mask!1515)))

(assert (=> d!129373 (= (getCurrentListMapNoExtraKeys!3917 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476582)))

(declare-fun b!1074494 () Bool)

(assert (=> b!1074494 (= e!613987 (ListLongMap!14644 Nil!23195))))

(declare-fun b!1074495 () Bool)

(assert (=> b!1074495 (= e!613985 (isEmpty!959 lt!476582))))

(declare-fun b!1074496 () Bool)

(assert (=> b!1074496 (= e!613988 e!613985)))

(declare-fun c!107899 () Bool)

(assert (=> b!1074496 (= c!107899 (bvslt #b00000000000000000000000000000000 (size!33664 _keys!1163)))))

(declare-fun b!1074497 () Bool)

(assert (=> b!1074497 (= e!613989 e!613988)))

(declare-fun c!107902 () Bool)

(assert (=> b!1074497 (= c!107902 e!613983)))

(declare-fun res!716462 () Bool)

(assert (=> b!1074497 (=> (not res!716462) (not e!613983))))

(assert (=> b!1074497 (= res!716462 (bvslt #b00000000000000000000000000000000 (size!33664 _keys!1163)))))

(assert (= (and d!129373 c!107900) b!1074494))

(assert (= (and d!129373 (not c!107900)) b!1074492))

(assert (= (and b!1074492 c!107901) b!1074489))

(assert (= (and b!1074492 (not c!107901)) b!1074491))

(assert (= (or b!1074489 b!1074491) bm!45399))

(assert (= (and d!129373 res!716463) b!1074487))

(assert (= (and b!1074487 res!716461) b!1074497))

(assert (= (and b!1074497 res!716462) b!1074490))

(assert (= (and b!1074497 c!107902) b!1074493))

(assert (= (and b!1074497 (not c!107902)) b!1074496))

(assert (= (and b!1074493 res!716460) b!1074488))

(assert (= (and b!1074496 c!107899) b!1074486))

(assert (= (and b!1074496 (not c!107899)) b!1074495))

(declare-fun b_lambda!16793 () Bool)

(assert (=> (not b_lambda!16793) (not b!1074488)))

(assert (=> b!1074488 t!32540))

(declare-fun b_and!35059 () Bool)

(assert (= b_and!35057 (and (=> t!32540 result!14801) b_and!35059)))

(declare-fun b_lambda!16795 () Bool)

(assert (=> (not b_lambda!16795) (not b!1074489)))

(assert (=> b!1074489 t!32540))

(declare-fun b_and!35061 () Bool)

(assert (= b_and!35059 (and (=> t!32540 result!14801) b_and!35061)))

(declare-fun m!992843 () Bool)

(assert (=> bm!45399 m!992843))

(assert (=> b!1074490 m!992757))

(assert (=> b!1074490 m!992757))

(assert (=> b!1074490 m!992765))

(declare-fun m!992845 () Bool)

(assert (=> b!1074487 m!992845))

(assert (=> b!1074486 m!992843))

(declare-fun m!992847 () Bool)

(assert (=> d!129373 m!992847))

(assert (=> d!129373 m!992691))

(declare-fun m!992849 () Bool)

(assert (=> b!1074489 m!992849))

(declare-fun m!992851 () Bool)

(assert (=> b!1074489 m!992851))

(declare-fun m!992853 () Bool)

(assert (=> b!1074489 m!992853))

(assert (=> b!1074489 m!992761))

(assert (=> b!1074489 m!992849))

(declare-fun m!992855 () Bool)

(assert (=> b!1074489 m!992855))

(assert (=> b!1074489 m!992757))

(assert (=> b!1074489 m!992755))

(assert (=> b!1074489 m!992761))

(assert (=> b!1074489 m!992755))

(assert (=> b!1074489 m!992763))

(assert (=> b!1074488 m!992761))

(assert (=> b!1074488 m!992757))

(assert (=> b!1074488 m!992755))

(assert (=> b!1074488 m!992757))

(declare-fun m!992857 () Bool)

(assert (=> b!1074488 m!992857))

(assert (=> b!1074488 m!992761))

(assert (=> b!1074488 m!992755))

(assert (=> b!1074488 m!992763))

(assert (=> b!1074493 m!992757))

(assert (=> b!1074493 m!992757))

(declare-fun m!992859 () Bool)

(assert (=> b!1074493 m!992859))

(declare-fun m!992861 () Bool)

(assert (=> b!1074495 m!992861))

(assert (=> b!1074492 m!992757))

(assert (=> b!1074492 m!992757))

(assert (=> b!1074492 m!992765))

(assert (=> b!1074294 d!129373))

(declare-fun b!1074498 () Bool)

(declare-fun e!613998 () Bool)

(declare-fun e!613992 () Bool)

(assert (=> b!1074498 (= e!613998 e!613992)))

(declare-fun res!716465 () Bool)

(declare-fun call!45408 () Bool)

(assert (=> b!1074498 (= res!716465 call!45408)))

(assert (=> b!1074498 (=> (not res!716465) (not e!613992))))

(declare-fun bm!45400 () Bool)

(declare-fun call!45405 () Bool)

(declare-fun lt!476600 () ListLongMap!14643)

(assert (=> bm!45400 (= call!45405 (contains!6306 lt!476600 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1074499 () Bool)

(assert (=> b!1074499 (= e!613998 (not call!45408))))

(declare-fun e!613996 () Bool)

(declare-fun b!1074500 () Bool)

(assert (=> b!1074500 (= e!613996 (= (apply!929 lt!476600 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000)) (get!17219 (select (arr!33125 _values!955) #b00000000000000000000000000000000) (dynLambda!2028 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1074500 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33663 _values!955)))))

(assert (=> b!1074500 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33664 _keys!1163)))))

(declare-fun b!1074501 () Bool)

(declare-fun e!613994 () ListLongMap!14643)

(declare-fun e!614001 () ListLongMap!14643)

(assert (=> b!1074501 (= e!613994 e!614001)))

(declare-fun c!107905 () Bool)

(assert (=> b!1074501 (= c!107905 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!45407 () ListLongMap!14643)

(declare-fun bm!45401 () Bool)

(assert (=> bm!45401 (= call!45407 (getCurrentListMapNoExtraKeys!3917 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074502 () Bool)

(declare-fun e!614002 () ListLongMap!14643)

(declare-fun call!45409 () ListLongMap!14643)

(assert (=> b!1074502 (= e!614002 call!45409)))

(declare-fun b!1074503 () Bool)

(declare-fun call!45403 () ListLongMap!14643)

(assert (=> b!1074503 (= e!613994 (+!3243 call!45403 (tuple2!16675 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1074504 () Bool)

(declare-fun e!613990 () Bool)

(assert (=> b!1074504 (= e!613990 (validKeyInArray!0 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074505 () Bool)

(declare-fun res!716470 () Bool)

(declare-fun e!613991 () Bool)

(assert (=> b!1074505 (=> (not res!716470) (not e!613991))))

(assert (=> b!1074505 (= res!716470 e!613998)))

(declare-fun c!107908 () Bool)

(assert (=> b!1074505 (= c!107908 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1074507 () Bool)

(declare-fun res!716467 () Bool)

(assert (=> b!1074507 (=> (not res!716467) (not e!613991))))

(declare-fun e!613997 () Bool)

(assert (=> b!1074507 (= res!716467 e!613997)))

(declare-fun res!716469 () Bool)

(assert (=> b!1074507 (=> res!716469 e!613997)))

(assert (=> b!1074507 (= res!716469 (not e!613990))))

(declare-fun res!716472 () Bool)

(assert (=> b!1074507 (=> (not res!716472) (not e!613990))))

(assert (=> b!1074507 (= res!716472 (bvslt #b00000000000000000000000000000000 (size!33664 _keys!1163)))))

(declare-fun b!1074508 () Bool)

(declare-fun e!613995 () Unit!35216)

(declare-fun Unit!35221 () Unit!35216)

(assert (=> b!1074508 (= e!613995 Unit!35221)))

(declare-fun b!1074509 () Bool)

(declare-fun call!45404 () ListLongMap!14643)

(assert (=> b!1074509 (= e!614001 call!45404)))

(declare-fun b!1074510 () Bool)

(assert (=> b!1074510 (= e!613992 (= (apply!929 lt!476600 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun c!107907 () Bool)

(declare-fun call!45406 () ListLongMap!14643)

(declare-fun bm!45402 () Bool)

(assert (=> bm!45402 (= call!45403 (+!3243 (ite c!107907 call!45407 (ite c!107905 call!45406 call!45409)) (ite (or c!107907 c!107905) (tuple2!16675 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16675 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun bm!45403 () Bool)

(assert (=> bm!45403 (= call!45406 call!45407)))

(declare-fun b!1074511 () Bool)

(assert (=> b!1074511 (= e!614002 call!45404)))

(declare-fun b!1074512 () Bool)

(declare-fun e!613993 () Bool)

(assert (=> b!1074512 (= e!613993 (not call!45405))))

(declare-fun b!1074513 () Bool)

(declare-fun e!613999 () Bool)

(assert (=> b!1074513 (= e!613993 e!613999)))

(declare-fun res!716464 () Bool)

(assert (=> b!1074513 (= res!716464 call!45405)))

(assert (=> b!1074513 (=> (not res!716464) (not e!613999))))

(declare-fun bm!45404 () Bool)

(assert (=> bm!45404 (= call!45409 call!45406)))

(declare-fun b!1074514 () Bool)

(declare-fun c!107903 () Bool)

(assert (=> b!1074514 (= c!107903 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1074514 (= e!614001 e!614002)))

(declare-fun b!1074515 () Bool)

(declare-fun lt!476593 () Unit!35216)

(assert (=> b!1074515 (= e!613995 lt!476593)))

(declare-fun lt!476591 () ListLongMap!14643)

(assert (=> b!1074515 (= lt!476591 (getCurrentListMapNoExtraKeys!3917 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476604 () (_ BitVec 64))

(assert (=> b!1074515 (= lt!476604 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476605 () (_ BitVec 64))

(assert (=> b!1074515 (= lt!476605 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476585 () Unit!35216)

(assert (=> b!1074515 (= lt!476585 (addStillContains!642 lt!476591 lt!476604 zeroValueBefore!47 lt!476605))))

(assert (=> b!1074515 (contains!6306 (+!3243 lt!476591 (tuple2!16675 lt!476604 zeroValueBefore!47)) lt!476605)))

(declare-fun lt!476592 () Unit!35216)

(assert (=> b!1074515 (= lt!476592 lt!476585)))

(declare-fun lt!476595 () ListLongMap!14643)

(assert (=> b!1074515 (= lt!476595 (getCurrentListMapNoExtraKeys!3917 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476594 () (_ BitVec 64))

(assert (=> b!1074515 (= lt!476594 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476589 () (_ BitVec 64))

(assert (=> b!1074515 (= lt!476589 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476602 () Unit!35216)

(assert (=> b!1074515 (= lt!476602 (addApplyDifferent!498 lt!476595 lt!476594 minValue!907 lt!476589))))

(assert (=> b!1074515 (= (apply!929 (+!3243 lt!476595 (tuple2!16675 lt!476594 minValue!907)) lt!476589) (apply!929 lt!476595 lt!476589))))

(declare-fun lt!476590 () Unit!35216)

(assert (=> b!1074515 (= lt!476590 lt!476602)))

(declare-fun lt!476599 () ListLongMap!14643)

(assert (=> b!1074515 (= lt!476599 (getCurrentListMapNoExtraKeys!3917 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476598 () (_ BitVec 64))

(assert (=> b!1074515 (= lt!476598 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476601 () (_ BitVec 64))

(assert (=> b!1074515 (= lt!476601 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476596 () Unit!35216)

(assert (=> b!1074515 (= lt!476596 (addApplyDifferent!498 lt!476599 lt!476598 zeroValueBefore!47 lt!476601))))

(assert (=> b!1074515 (= (apply!929 (+!3243 lt!476599 (tuple2!16675 lt!476598 zeroValueBefore!47)) lt!476601) (apply!929 lt!476599 lt!476601))))

(declare-fun lt!476586 () Unit!35216)

(assert (=> b!1074515 (= lt!476586 lt!476596)))

(declare-fun lt!476603 () ListLongMap!14643)

(assert (=> b!1074515 (= lt!476603 (getCurrentListMapNoExtraKeys!3917 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476584 () (_ BitVec 64))

(assert (=> b!1074515 (= lt!476584 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476587 () (_ BitVec 64))

(assert (=> b!1074515 (= lt!476587 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074515 (= lt!476593 (addApplyDifferent!498 lt!476603 lt!476584 minValue!907 lt!476587))))

(assert (=> b!1074515 (= (apply!929 (+!3243 lt!476603 (tuple2!16675 lt!476584 minValue!907)) lt!476587) (apply!929 lt!476603 lt!476587))))

(declare-fun bm!45405 () Bool)

(assert (=> bm!45405 (= call!45404 call!45403)))

(declare-fun d!129375 () Bool)

(assert (=> d!129375 e!613991))

(declare-fun res!716466 () Bool)

(assert (=> d!129375 (=> (not res!716466) (not e!613991))))

(assert (=> d!129375 (= res!716466 (or (bvsge #b00000000000000000000000000000000 (size!33664 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33664 _keys!1163)))))))

(declare-fun lt!476597 () ListLongMap!14643)

(assert (=> d!129375 (= lt!476600 lt!476597)))

(declare-fun lt!476588 () Unit!35216)

(assert (=> d!129375 (= lt!476588 e!613995)))

(declare-fun c!107904 () Bool)

(declare-fun e!614000 () Bool)

(assert (=> d!129375 (= c!107904 e!614000)))

(declare-fun res!716471 () Bool)

(assert (=> d!129375 (=> (not res!716471) (not e!614000))))

(assert (=> d!129375 (= res!716471 (bvslt #b00000000000000000000000000000000 (size!33664 _keys!1163)))))

(assert (=> d!129375 (= lt!476597 e!613994)))

(assert (=> d!129375 (= c!107907 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129375 (validMask!0 mask!1515)))

(assert (=> d!129375 (= (getCurrentListMap!4110 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476600)))

(declare-fun b!1074506 () Bool)

(assert (=> b!1074506 (= e!613991 e!613993)))

(declare-fun c!107906 () Bool)

(assert (=> b!1074506 (= c!107906 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1074516 () Bool)

(assert (=> b!1074516 (= e!614000 (validKeyInArray!0 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45406 () Bool)

(assert (=> bm!45406 (= call!45408 (contains!6306 lt!476600 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1074517 () Bool)

(assert (=> b!1074517 (= e!613999 (= (apply!929 lt!476600 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1074518 () Bool)

(assert (=> b!1074518 (= e!613997 e!613996)))

(declare-fun res!716468 () Bool)

(assert (=> b!1074518 (=> (not res!716468) (not e!613996))))

(assert (=> b!1074518 (= res!716468 (contains!6306 lt!476600 (select (arr!33126 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074518 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33664 _keys!1163)))))

(assert (= (and d!129375 c!107907) b!1074503))

(assert (= (and d!129375 (not c!107907)) b!1074501))

(assert (= (and b!1074501 c!107905) b!1074509))

(assert (= (and b!1074501 (not c!107905)) b!1074514))

(assert (= (and b!1074514 c!107903) b!1074511))

(assert (= (and b!1074514 (not c!107903)) b!1074502))

(assert (= (or b!1074511 b!1074502) bm!45404))

(assert (= (or b!1074509 bm!45404) bm!45403))

(assert (= (or b!1074509 b!1074511) bm!45405))

(assert (= (or b!1074503 bm!45403) bm!45401))

(assert (= (or b!1074503 bm!45405) bm!45402))

(assert (= (and d!129375 res!716471) b!1074516))

(assert (= (and d!129375 c!107904) b!1074515))

(assert (= (and d!129375 (not c!107904)) b!1074508))

(assert (= (and d!129375 res!716466) b!1074507))

(assert (= (and b!1074507 res!716472) b!1074504))

(assert (= (and b!1074507 (not res!716469)) b!1074518))

(assert (= (and b!1074518 res!716468) b!1074500))

(assert (= (and b!1074507 res!716467) b!1074505))

(assert (= (and b!1074505 c!107908) b!1074498))

(assert (= (and b!1074505 (not c!107908)) b!1074499))

(assert (= (and b!1074498 res!716465) b!1074510))

(assert (= (or b!1074498 b!1074499) bm!45406))

(assert (= (and b!1074505 res!716470) b!1074506))

(assert (= (and b!1074506 c!107906) b!1074513))

(assert (= (and b!1074506 (not c!107906)) b!1074512))

(assert (= (and b!1074513 res!716464) b!1074517))

(assert (= (or b!1074513 b!1074512) bm!45400))

(declare-fun b_lambda!16797 () Bool)

(assert (=> (not b_lambda!16797) (not b!1074500)))

(assert (=> b!1074500 t!32540))

(declare-fun b_and!35063 () Bool)

(assert (= b_and!35061 (and (=> t!32540 result!14801) b_and!35063)))

(declare-fun m!992863 () Bool)

(assert (=> b!1074517 m!992863))

(assert (=> b!1074500 m!992755))

(assert (=> b!1074500 m!992757))

(assert (=> b!1074500 m!992757))

(declare-fun m!992865 () Bool)

(assert (=> b!1074500 m!992865))

(assert (=> b!1074500 m!992761))

(assert (=> b!1074500 m!992761))

(assert (=> b!1074500 m!992755))

(assert (=> b!1074500 m!992763))

(assert (=> b!1074516 m!992757))

(assert (=> b!1074516 m!992757))

(assert (=> b!1074516 m!992765))

(declare-fun m!992867 () Bool)

(assert (=> bm!45402 m!992867))

(declare-fun m!992869 () Bool)

(assert (=> b!1074510 m!992869))

(assert (=> b!1074518 m!992757))

(assert (=> b!1074518 m!992757))

(declare-fun m!992871 () Bool)

(assert (=> b!1074518 m!992871))

(assert (=> bm!45401 m!992689))

(assert (=> d!129375 m!992691))

(declare-fun m!992873 () Bool)

(assert (=> bm!45406 m!992873))

(declare-fun m!992875 () Bool)

(assert (=> b!1074503 m!992875))

(declare-fun m!992877 () Bool)

(assert (=> bm!45400 m!992877))

(declare-fun m!992879 () Bool)

(assert (=> b!1074515 m!992879))

(declare-fun m!992881 () Bool)

(assert (=> b!1074515 m!992881))

(assert (=> b!1074515 m!992879))

(declare-fun m!992883 () Bool)

(assert (=> b!1074515 m!992883))

(declare-fun m!992885 () Bool)

(assert (=> b!1074515 m!992885))

(declare-fun m!992887 () Bool)

(assert (=> b!1074515 m!992887))

(declare-fun m!992889 () Bool)

(assert (=> b!1074515 m!992889))

(declare-fun m!992891 () Bool)

(assert (=> b!1074515 m!992891))

(assert (=> b!1074515 m!992757))

(declare-fun m!992893 () Bool)

(assert (=> b!1074515 m!992893))

(declare-fun m!992895 () Bool)

(assert (=> b!1074515 m!992895))

(declare-fun m!992897 () Bool)

(assert (=> b!1074515 m!992897))

(assert (=> b!1074515 m!992891))

(declare-fun m!992899 () Bool)

(assert (=> b!1074515 m!992899))

(declare-fun m!992901 () Bool)

(assert (=> b!1074515 m!992901))

(declare-fun m!992903 () Bool)

(assert (=> b!1074515 m!992903))

(assert (=> b!1074515 m!992897))

(declare-fun m!992905 () Bool)

(assert (=> b!1074515 m!992905))

(assert (=> b!1074515 m!992885))

(assert (=> b!1074515 m!992689))

(declare-fun m!992907 () Bool)

(assert (=> b!1074515 m!992907))

(assert (=> b!1074504 m!992757))

(assert (=> b!1074504 m!992757))

(assert (=> b!1074504 m!992765))

(assert (=> b!1074289 d!129375))

(declare-fun d!129377 () Bool)

(declare-fun e!614005 () Bool)

(assert (=> d!129377 e!614005))

(declare-fun res!716478 () Bool)

(assert (=> d!129377 (=> (not res!716478) (not e!614005))))

(declare-fun lt!476615 () ListLongMap!14643)

(assert (=> d!129377 (= res!716478 (contains!6306 lt!476615 (_1!8348 (tuple2!16675 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!476616 () List!23198)

(assert (=> d!129377 (= lt!476615 (ListLongMap!14644 lt!476616))))

(declare-fun lt!476617 () Unit!35216)

(declare-fun lt!476614 () Unit!35216)

(assert (=> d!129377 (= lt!476617 lt!476614)))

(declare-datatypes ((Option!661 0))(
  ( (Some!660 (v!15667 V!39785)) (None!659) )
))
(declare-fun getValueByKey!610 (List!23198 (_ BitVec 64)) Option!661)

(assert (=> d!129377 (= (getValueByKey!610 lt!476616 (_1!8348 (tuple2!16675 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!660 (_2!8348 (tuple2!16675 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lemmaContainsTupThenGetReturnValue!288 (List!23198 (_ BitVec 64) V!39785) Unit!35216)

(assert (=> d!129377 (= lt!476614 (lemmaContainsTupThenGetReturnValue!288 lt!476616 (_1!8348 (tuple2!16675 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8348 (tuple2!16675 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun insertStrictlySorted!381 (List!23198 (_ BitVec 64) V!39785) List!23198)

(assert (=> d!129377 (= lt!476616 (insertStrictlySorted!381 (toList!7337 lt!476457) (_1!8348 (tuple2!16675 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8348 (tuple2!16675 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!129377 (= (+!3243 lt!476457 (tuple2!16675 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!476615)))

(declare-fun b!1074523 () Bool)

(declare-fun res!716477 () Bool)

(assert (=> b!1074523 (=> (not res!716477) (not e!614005))))

(assert (=> b!1074523 (= res!716477 (= (getValueByKey!610 (toList!7337 lt!476615) (_1!8348 (tuple2!16675 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!660 (_2!8348 (tuple2!16675 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))))

(declare-fun b!1074524 () Bool)

(declare-fun contains!6308 (List!23198 tuple2!16674) Bool)

(assert (=> b!1074524 (= e!614005 (contains!6308 (toList!7337 lt!476615) (tuple2!16675 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(assert (= (and d!129377 res!716478) b!1074523))

(assert (= (and b!1074523 res!716477) b!1074524))

(declare-fun m!992909 () Bool)

(assert (=> d!129377 m!992909))

(declare-fun m!992911 () Bool)

(assert (=> d!129377 m!992911))

(declare-fun m!992913 () Bool)

(assert (=> d!129377 m!992913))

(declare-fun m!992915 () Bool)

(assert (=> d!129377 m!992915))

(declare-fun m!992917 () Bool)

(assert (=> b!1074523 m!992917))

(declare-fun m!992919 () Bool)

(assert (=> b!1074524 m!992919))

(assert (=> b!1074289 d!129377))

(declare-fun mapIsEmpty!40714 () Bool)

(declare-fun mapRes!40714 () Bool)

(assert (=> mapIsEmpty!40714 mapRes!40714))

(declare-fun condMapEmpty!40714 () Bool)

(declare-fun mapDefault!40714 () ValueCell!12290)

(assert (=> mapNonEmpty!40705 (= condMapEmpty!40714 (= mapRest!40705 ((as const (Array (_ BitVec 32) ValueCell!12290)) mapDefault!40714)))))

(declare-fun e!614011 () Bool)

(assert (=> mapNonEmpty!40705 (= tp!78008 (and e!614011 mapRes!40714))))

(declare-fun b!1074531 () Bool)

(declare-fun e!614010 () Bool)

(assert (=> b!1074531 (= e!614010 tp_is_empty!25987)))

(declare-fun b!1074532 () Bool)

(assert (=> b!1074532 (= e!614011 tp_is_empty!25987)))

(declare-fun mapNonEmpty!40714 () Bool)

(declare-fun tp!78023 () Bool)

(assert (=> mapNonEmpty!40714 (= mapRes!40714 (and tp!78023 e!614010))))

(declare-fun mapKey!40714 () (_ BitVec 32))

(declare-fun mapRest!40714 () (Array (_ BitVec 32) ValueCell!12290))

(declare-fun mapValue!40714 () ValueCell!12290)

(assert (=> mapNonEmpty!40714 (= mapRest!40705 (store mapRest!40714 mapKey!40714 mapValue!40714))))

(assert (= (and mapNonEmpty!40705 condMapEmpty!40714) mapIsEmpty!40714))

(assert (= (and mapNonEmpty!40705 (not condMapEmpty!40714)) mapNonEmpty!40714))

(assert (= (and mapNonEmpty!40714 ((_ is ValueCellFull!12290) mapValue!40714)) b!1074531))

(assert (= (and mapNonEmpty!40705 ((_ is ValueCellFull!12290) mapDefault!40714)) b!1074532))

(declare-fun m!992921 () Bool)

(assert (=> mapNonEmpty!40714 m!992921))

(declare-fun b_lambda!16799 () Bool)

(assert (= b_lambda!16797 (or (and start!95036 b_free!22177) b_lambda!16799)))

(declare-fun b_lambda!16801 () Bool)

(assert (= b_lambda!16795 (or (and start!95036 b_free!22177) b_lambda!16801)))

(declare-fun b_lambda!16803 () Bool)

(assert (= b_lambda!16791 (or (and start!95036 b_free!22177) b_lambda!16803)))

(declare-fun b_lambda!16805 () Bool)

(assert (= b_lambda!16789 (or (and start!95036 b_free!22177) b_lambda!16805)))

(declare-fun b_lambda!16807 () Bool)

(assert (= b_lambda!16793 (or (and start!95036 b_free!22177) b_lambda!16807)))

(declare-fun b_lambda!16809 () Bool)

(assert (= b_lambda!16787 (or (and start!95036 b_free!22177) b_lambda!16809)))

(check-sat (not bm!45389) (not b!1074500) (not bm!45399) (not b!1074504) (not b!1074481) (not d!129363) (not b_lambda!16799) (not b!1074488) (not b_lambda!16801) (not b!1074446) (not bm!45395) (not b!1074503) (not b!1074417) (not b!1074478) (not bm!45384) (not b!1074516) (not b!1074495) (not mapNonEmpty!40714) (not b!1074476) (not bm!45385) (not b!1074436) (not d!129371) (not bm!45406) (not bm!45401) (not b!1074492) (not b!1074477) (not b!1074515) (not b!1074418) (not b!1074447) (not b_lambda!16803) (not b!1074523) (not b!1074510) (not b!1074474) (not b!1074419) (not b!1074435) (not d!129375) b_and!35063 (not b!1074475) (not b_lambda!16807) (not bm!45392) (not b!1074483) (not d!129369) (not b!1074517) (not b!1074406) (not b!1074480) (not d!129373) (not bm!45383) (not bm!45398) (not b!1074493) tp_is_empty!25987 (not b_lambda!16809) (not b!1074524) (not b!1074487) (not b!1074412) (not bm!45400) (not b_next!22177) (not b!1074402) (not d!129377) (not b_lambda!16805) (not b!1074489) (not b!1074405) (not b!1074518) (not b!1074490) (not b!1074420) (not b!1074437) (not bm!45402) (not b!1074486))
(check-sat b_and!35063 (not b_next!22177))
