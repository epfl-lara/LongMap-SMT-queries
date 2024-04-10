; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95130 () Bool)

(assert start!95130)

(declare-fun b_free!22209 () Bool)

(declare-fun b_next!22209 () Bool)

(assert (=> start!95130 (= b_free!22209 (not b_next!22209))))

(declare-fun tp!78113 () Bool)

(declare-fun b_and!35139 () Bool)

(assert (=> start!95130 (= tp!78113 b_and!35139)))

(declare-fun b!1075369 () Bool)

(declare-fun e!614583 () Bool)

(declare-fun tp_is_empty!26019 () Bool)

(assert (=> b!1075369 (= e!614583 tp_is_empty!26019)))

(declare-fun res!716909 () Bool)

(declare-fun e!614582 () Bool)

(assert (=> start!95130 (=> (not res!716909) (not e!614582))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95130 (= res!716909 (validMask!0 mask!1515))))

(assert (=> start!95130 e!614582))

(assert (=> start!95130 true))

(assert (=> start!95130 tp_is_empty!26019))

(declare-datatypes ((V!39827 0))(
  ( (V!39828 (val!13060 Int)) )
))
(declare-datatypes ((ValueCell!12306 0))(
  ( (ValueCellFull!12306 (v!15684 V!39827)) (EmptyCell!12306) )
))
(declare-datatypes ((array!69007 0))(
  ( (array!69008 (arr!33190 (Array (_ BitVec 32) ValueCell!12306)) (size!33726 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69007)

(declare-fun e!614587 () Bool)

(declare-fun array_inv!25648 (array!69007) Bool)

(assert (=> start!95130 (and (array_inv!25648 _values!955) e!614587)))

(assert (=> start!95130 tp!78113))

(declare-datatypes ((array!69009 0))(
  ( (array!69010 (arr!33191 (Array (_ BitVec 32) (_ BitVec 64))) (size!33727 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69009)

(declare-fun array_inv!25649 (array!69009) Bool)

(assert (=> start!95130 (array_inv!25649 _keys!1163)))

(declare-fun b!1075370 () Bool)

(declare-fun res!716908 () Bool)

(assert (=> b!1075370 (=> (not res!716908) (not e!614582))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69009 (_ BitVec 32)) Bool)

(assert (=> b!1075370 (= res!716908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40762 () Bool)

(declare-fun mapRes!40762 () Bool)

(declare-fun tp!78112 () Bool)

(declare-fun e!614586 () Bool)

(assert (=> mapNonEmpty!40762 (= mapRes!40762 (and tp!78112 e!614586))))

(declare-fun mapValue!40762 () ValueCell!12306)

(declare-fun mapRest!40762 () (Array (_ BitVec 32) ValueCell!12306))

(declare-fun mapKey!40762 () (_ BitVec 32))

(assert (=> mapNonEmpty!40762 (= (arr!33190 _values!955) (store mapRest!40762 mapKey!40762 mapValue!40762))))

(declare-fun b!1075371 () Bool)

(assert (=> b!1075371 (= e!614586 tp_is_empty!26019)))

(declare-datatypes ((tuple2!16640 0))(
  ( (tuple2!16641 (_1!8331 (_ BitVec 64)) (_2!8331 V!39827)) )
))
(declare-datatypes ((List!23175 0))(
  ( (Nil!23172) (Cons!23171 (h!24380 tuple2!16640) (t!32526 List!23175)) )
))
(declare-datatypes ((ListLongMap!14609 0))(
  ( (ListLongMap!14610 (toList!7320 List!23175)) )
))
(declare-fun lt!477325 () ListLongMap!14609)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun e!614585 () Bool)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39827)

(declare-fun minValue!907 () V!39827)

(declare-fun b!1075372 () Bool)

(declare-fun getCurrentListMap!4189 (array!69009 array!69007 (_ BitVec 32) (_ BitVec 32) V!39827 V!39827 (_ BitVec 32) Int) ListLongMap!14609)

(assert (=> b!1075372 (= e!614585 (= lt!477325 (getCurrentListMap!4189 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)))))

(declare-fun lt!477328 () ListLongMap!14609)

(assert (=> b!1075372 (= lt!477325 lt!477328)))

(declare-fun -!714 (ListLongMap!14609 (_ BitVec 64)) ListLongMap!14609)

(assert (=> b!1075372 (= lt!477325 (-!714 lt!477328 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!35408 0))(
  ( (Unit!35409) )
))
(declare-fun lt!477327 () Unit!35408)

(declare-fun removeNotPresentStillSame!82 (ListLongMap!14609 (_ BitVec 64)) Unit!35408)

(assert (=> b!1075372 (= lt!477327 (removeNotPresentStillSame!82 lt!477328 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075373 () Bool)

(declare-fun e!614584 () Bool)

(assert (=> b!1075373 (= e!614584 e!614585)))

(declare-fun res!716907 () Bool)

(assert (=> b!1075373 (=> res!716907 e!614585)))

(declare-fun contains!6348 (ListLongMap!14609 (_ BitVec 64)) Bool)

(assert (=> b!1075373 (= res!716907 (contains!6348 lt!477328 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!39827)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1075373 (= lt!477328 (getCurrentListMap!4189 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1075374 () Bool)

(declare-fun res!716905 () Bool)

(assert (=> b!1075374 (=> (not res!716905) (not e!614582))))

(declare-datatypes ((List!23176 0))(
  ( (Nil!23173) (Cons!23172 (h!24381 (_ BitVec 64)) (t!32527 List!23176)) )
))
(declare-fun arrayNoDuplicates!0 (array!69009 (_ BitVec 32) List!23176) Bool)

(assert (=> b!1075374 (= res!716905 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23173))))

(declare-fun b!1075375 () Bool)

(declare-fun res!716906 () Bool)

(assert (=> b!1075375 (=> (not res!716906) (not e!614582))))

(assert (=> b!1075375 (= res!716906 (and (= (size!33726 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33727 _keys!1163) (size!33726 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40762 () Bool)

(assert (=> mapIsEmpty!40762 mapRes!40762))

(declare-fun b!1075376 () Bool)

(assert (=> b!1075376 (= e!614587 (and e!614583 mapRes!40762))))

(declare-fun condMapEmpty!40762 () Bool)

(declare-fun mapDefault!40762 () ValueCell!12306)

(assert (=> b!1075376 (= condMapEmpty!40762 (= (arr!33190 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12306)) mapDefault!40762)))))

(declare-fun b!1075377 () Bool)

(assert (=> b!1075377 (= e!614582 (not e!614584))))

(declare-fun res!716904 () Bool)

(assert (=> b!1075377 (=> res!716904 e!614584)))

(assert (=> b!1075377 (= res!716904 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!477326 () ListLongMap!14609)

(declare-fun lt!477329 () ListLongMap!14609)

(assert (=> b!1075377 (= lt!477326 lt!477329)))

(declare-fun lt!477330 () Unit!35408)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!898 (array!69009 array!69007 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39827 V!39827 V!39827 V!39827 (_ BitVec 32) Int) Unit!35408)

(assert (=> b!1075377 (= lt!477330 (lemmaNoChangeToArrayThenSameMapNoExtras!898 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3882 (array!69009 array!69007 (_ BitVec 32) (_ BitVec 32) V!39827 V!39827 (_ BitVec 32) Int) ListLongMap!14609)

(assert (=> b!1075377 (= lt!477329 (getCurrentListMapNoExtraKeys!3882 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1075377 (= lt!477326 (getCurrentListMapNoExtraKeys!3882 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!95130 res!716909) b!1075375))

(assert (= (and b!1075375 res!716906) b!1075370))

(assert (= (and b!1075370 res!716908) b!1075374))

(assert (= (and b!1075374 res!716905) b!1075377))

(assert (= (and b!1075377 (not res!716904)) b!1075373))

(assert (= (and b!1075373 (not res!716907)) b!1075372))

(assert (= (and b!1075376 condMapEmpty!40762) mapIsEmpty!40762))

(assert (= (and b!1075376 (not condMapEmpty!40762)) mapNonEmpty!40762))

(get-info :version)

(assert (= (and mapNonEmpty!40762 ((_ is ValueCellFull!12306) mapValue!40762)) b!1075371))

(assert (= (and b!1075376 ((_ is ValueCellFull!12306) mapDefault!40762)) b!1075369))

(assert (= start!95130 b!1075376))

(declare-fun m!994199 () Bool)

(assert (=> mapNonEmpty!40762 m!994199))

(declare-fun m!994201 () Bool)

(assert (=> b!1075373 m!994201))

(declare-fun m!994203 () Bool)

(assert (=> b!1075373 m!994203))

(declare-fun m!994205 () Bool)

(assert (=> b!1075372 m!994205))

(declare-fun m!994207 () Bool)

(assert (=> b!1075372 m!994207))

(declare-fun m!994209 () Bool)

(assert (=> b!1075372 m!994209))

(declare-fun m!994211 () Bool)

(assert (=> b!1075374 m!994211))

(declare-fun m!994213 () Bool)

(assert (=> b!1075370 m!994213))

(declare-fun m!994215 () Bool)

(assert (=> start!95130 m!994215))

(declare-fun m!994217 () Bool)

(assert (=> start!95130 m!994217))

(declare-fun m!994219 () Bool)

(assert (=> start!95130 m!994219))

(declare-fun m!994221 () Bool)

(assert (=> b!1075377 m!994221))

(declare-fun m!994223 () Bool)

(assert (=> b!1075377 m!994223))

(declare-fun m!994225 () Bool)

(assert (=> b!1075377 m!994225))

(check-sat tp_is_empty!26019 (not mapNonEmpty!40762) (not b!1075373) b_and!35139 (not start!95130) (not b!1075370) (not b!1075372) (not b_next!22209) (not b!1075377) (not b!1075374))
(check-sat b_and!35139 (not b_next!22209))
(get-model)

(declare-fun b!1075413 () Bool)

(declare-fun e!614616 () Bool)

(declare-fun call!45504 () Bool)

(assert (=> b!1075413 (= e!614616 call!45504)))

(declare-fun d!129589 () Bool)

(declare-fun res!716933 () Bool)

(declare-fun e!614617 () Bool)

(assert (=> d!129589 (=> res!716933 e!614617)))

(assert (=> d!129589 (= res!716933 (bvsge #b00000000000000000000000000000000 (size!33727 _keys!1163)))))

(assert (=> d!129589 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!614617)))

(declare-fun bm!45501 () Bool)

(assert (=> bm!45501 (= call!45504 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1075414 () Bool)

(declare-fun e!614615 () Bool)

(assert (=> b!1075414 (= e!614616 e!614615)))

(declare-fun lt!477357 () (_ BitVec 64))

(assert (=> b!1075414 (= lt!477357 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477356 () Unit!35408)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69009 (_ BitVec 64) (_ BitVec 32)) Unit!35408)

(assert (=> b!1075414 (= lt!477356 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!477357 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69009 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1075414 (arrayContainsKey!0 _keys!1163 lt!477357 #b00000000000000000000000000000000)))

(declare-fun lt!477355 () Unit!35408)

(assert (=> b!1075414 (= lt!477355 lt!477356)))

(declare-fun res!716932 () Bool)

(declare-datatypes ((SeekEntryResult!9892 0))(
  ( (MissingZero!9892 (index!41939 (_ BitVec 32))) (Found!9892 (index!41940 (_ BitVec 32))) (Intermediate!9892 (undefined!10704 Bool) (index!41941 (_ BitVec 32)) (x!96382 (_ BitVec 32))) (Undefined!9892) (MissingVacant!9892 (index!41942 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69009 (_ BitVec 32)) SeekEntryResult!9892)

(assert (=> b!1075414 (= res!716932 (= (seekEntryOrOpen!0 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9892 #b00000000000000000000000000000000)))))

(assert (=> b!1075414 (=> (not res!716932) (not e!614615))))

(declare-fun b!1075415 () Bool)

(assert (=> b!1075415 (= e!614617 e!614616)))

(declare-fun c!108042 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1075415 (= c!108042 (validKeyInArray!0 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075416 () Bool)

(assert (=> b!1075416 (= e!614615 call!45504)))

(assert (= (and d!129589 (not res!716933)) b!1075415))

(assert (= (and b!1075415 c!108042) b!1075414))

(assert (= (and b!1075415 (not c!108042)) b!1075413))

(assert (= (and b!1075414 res!716932) b!1075416))

(assert (= (or b!1075416 b!1075413) bm!45501))

(declare-fun m!994255 () Bool)

(assert (=> bm!45501 m!994255))

(declare-fun m!994257 () Bool)

(assert (=> b!1075414 m!994257))

(declare-fun m!994259 () Bool)

(assert (=> b!1075414 m!994259))

(declare-fun m!994261 () Bool)

(assert (=> b!1075414 m!994261))

(assert (=> b!1075414 m!994257))

(declare-fun m!994263 () Bool)

(assert (=> b!1075414 m!994263))

(assert (=> b!1075415 m!994257))

(assert (=> b!1075415 m!994257))

(declare-fun m!994265 () Bool)

(assert (=> b!1075415 m!994265))

(assert (=> b!1075370 d!129589))

(declare-fun d!129591 () Bool)

(declare-fun e!614623 () Bool)

(assert (=> d!129591 e!614623))

(declare-fun res!716936 () Bool)

(assert (=> d!129591 (=> res!716936 e!614623)))

(declare-fun lt!477368 () Bool)

(assert (=> d!129591 (= res!716936 (not lt!477368))))

(declare-fun lt!477367 () Bool)

(assert (=> d!129591 (= lt!477368 lt!477367)))

(declare-fun lt!477369 () Unit!35408)

(declare-fun e!614622 () Unit!35408)

(assert (=> d!129591 (= lt!477369 e!614622)))

(declare-fun c!108045 () Bool)

(assert (=> d!129591 (= c!108045 lt!477367)))

(declare-fun containsKey!580 (List!23175 (_ BitVec 64)) Bool)

(assert (=> d!129591 (= lt!477367 (containsKey!580 (toList!7320 lt!477328) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129591 (= (contains!6348 lt!477328 #b0000000000000000000000000000000000000000000000000000000000000000) lt!477368)))

(declare-fun b!1075423 () Bool)

(declare-fun lt!477366 () Unit!35408)

(assert (=> b!1075423 (= e!614622 lt!477366)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!413 (List!23175 (_ BitVec 64)) Unit!35408)

(assert (=> b!1075423 (= lt!477366 (lemmaContainsKeyImpliesGetValueByKeyDefined!413 (toList!7320 lt!477328) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!662 0))(
  ( (Some!661 (v!15686 V!39827)) (None!660) )
))
(declare-fun isDefined!452 (Option!662) Bool)

(declare-fun getValueByKey!611 (List!23175 (_ BitVec 64)) Option!662)

(assert (=> b!1075423 (isDefined!452 (getValueByKey!611 (toList!7320 lt!477328) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075424 () Bool)

(declare-fun Unit!35410 () Unit!35408)

(assert (=> b!1075424 (= e!614622 Unit!35410)))

(declare-fun b!1075425 () Bool)

(assert (=> b!1075425 (= e!614623 (isDefined!452 (getValueByKey!611 (toList!7320 lt!477328) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129591 c!108045) b!1075423))

(assert (= (and d!129591 (not c!108045)) b!1075424))

(assert (= (and d!129591 (not res!716936)) b!1075425))

(declare-fun m!994267 () Bool)

(assert (=> d!129591 m!994267))

(declare-fun m!994269 () Bool)

(assert (=> b!1075423 m!994269))

(declare-fun m!994271 () Bool)

(assert (=> b!1075423 m!994271))

(assert (=> b!1075423 m!994271))

(declare-fun m!994273 () Bool)

(assert (=> b!1075423 m!994273))

(assert (=> b!1075425 m!994271))

(assert (=> b!1075425 m!994271))

(assert (=> b!1075425 m!994273))

(assert (=> b!1075373 d!129591))

(declare-fun b!1075468 () Bool)

(declare-fun e!614659 () Bool)

(declare-fun lt!477435 () ListLongMap!14609)

(declare-fun apply!939 (ListLongMap!14609 (_ BitVec 64)) V!39827)

(assert (=> b!1075468 (= e!614659 (= (apply!939 lt!477435 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun bm!45516 () Bool)

(declare-fun call!45522 () ListLongMap!14609)

(declare-fun call!45519 () ListLongMap!14609)

(assert (=> bm!45516 (= call!45522 call!45519)))

(declare-fun b!1075469 () Bool)

(declare-fun c!108062 () Bool)

(assert (=> b!1075469 (= c!108062 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!614660 () ListLongMap!14609)

(declare-fun e!614662 () ListLongMap!14609)

(assert (=> b!1075469 (= e!614660 e!614662)))

(declare-fun b!1075470 () Bool)

(declare-fun e!614650 () Bool)

(assert (=> b!1075470 (= e!614650 (validKeyInArray!0 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075471 () Bool)

(declare-fun call!45521 () ListLongMap!14609)

(assert (=> b!1075471 (= e!614662 call!45521)))

(declare-fun b!1075472 () Bool)

(declare-fun e!614655 () Bool)

(assert (=> b!1075472 (= e!614655 (= (apply!939 lt!477435 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1075473 () Bool)

(declare-fun res!716957 () Bool)

(declare-fun e!614653 () Bool)

(assert (=> b!1075473 (=> (not res!716957) (not e!614653))))

(declare-fun e!614658 () Bool)

(assert (=> b!1075473 (= res!716957 e!614658)))

(declare-fun res!716960 () Bool)

(assert (=> b!1075473 (=> res!716960 e!614658)))

(assert (=> b!1075473 (= res!716960 (not e!614650))))

(declare-fun res!716959 () Bool)

(assert (=> b!1075473 (=> (not res!716959) (not e!614650))))

(assert (=> b!1075473 (= res!716959 (bvslt #b00000000000000000000000000000000 (size!33727 _keys!1163)))))

(declare-fun bm!45517 () Bool)

(declare-fun call!45525 () Bool)

(assert (=> bm!45517 (= call!45525 (contains!6348 lt!477435 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075474 () Bool)

(declare-fun e!614654 () Bool)

(assert (=> b!1075474 (= e!614658 e!614654)))

(declare-fun res!716958 () Bool)

(assert (=> b!1075474 (=> (not res!716958) (not e!614654))))

(assert (=> b!1075474 (= res!716958 (contains!6348 lt!477435 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075474 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33727 _keys!1163)))))

(declare-fun bm!45518 () Bool)

(declare-fun c!108059 () Bool)

(declare-fun call!45524 () ListLongMap!14609)

(declare-fun c!108060 () Bool)

(declare-fun +!3226 (ListLongMap!14609 tuple2!16640) ListLongMap!14609)

(assert (=> bm!45518 (= call!45524 (+!3226 (ite c!108060 call!45519 (ite c!108059 call!45522 call!45521)) (ite (or c!108060 c!108059) (tuple2!16641 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16641 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1075475 () Bool)

(declare-fun e!614651 () Unit!35408)

(declare-fun Unit!35411 () Unit!35408)

(assert (=> b!1075475 (= e!614651 Unit!35411)))

(declare-fun b!1075476 () Bool)

(declare-fun e!614661 () Bool)

(assert (=> b!1075476 (= e!614661 e!614655)))

(declare-fun res!716962 () Bool)

(declare-fun call!45520 () Bool)

(assert (=> b!1075476 (= res!716962 call!45520)))

(assert (=> b!1075476 (=> (not res!716962) (not e!614655))))

(declare-fun b!1075477 () Bool)

(declare-fun call!45523 () ListLongMap!14609)

(assert (=> b!1075477 (= e!614662 call!45523)))

(declare-fun b!1075478 () Bool)

(declare-fun lt!477425 () Unit!35408)

(assert (=> b!1075478 (= e!614651 lt!477425)))

(declare-fun lt!477415 () ListLongMap!14609)

(assert (=> b!1075478 (= lt!477415 (getCurrentListMapNoExtraKeys!3882 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477420 () (_ BitVec 64))

(assert (=> b!1075478 (= lt!477420 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477430 () (_ BitVec 64))

(assert (=> b!1075478 (= lt!477430 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477418 () Unit!35408)

(declare-fun addStillContains!652 (ListLongMap!14609 (_ BitVec 64) V!39827 (_ BitVec 64)) Unit!35408)

(assert (=> b!1075478 (= lt!477418 (addStillContains!652 lt!477415 lt!477420 zeroValueBefore!47 lt!477430))))

(assert (=> b!1075478 (contains!6348 (+!3226 lt!477415 (tuple2!16641 lt!477420 zeroValueBefore!47)) lt!477430)))

(declare-fun lt!477432 () Unit!35408)

(assert (=> b!1075478 (= lt!477432 lt!477418)))

(declare-fun lt!477417 () ListLongMap!14609)

(assert (=> b!1075478 (= lt!477417 (getCurrentListMapNoExtraKeys!3882 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477414 () (_ BitVec 64))

(assert (=> b!1075478 (= lt!477414 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477421 () (_ BitVec 64))

(assert (=> b!1075478 (= lt!477421 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477428 () Unit!35408)

(declare-fun addApplyDifferent!512 (ListLongMap!14609 (_ BitVec 64) V!39827 (_ BitVec 64)) Unit!35408)

(assert (=> b!1075478 (= lt!477428 (addApplyDifferent!512 lt!477417 lt!477414 minValue!907 lt!477421))))

(assert (=> b!1075478 (= (apply!939 (+!3226 lt!477417 (tuple2!16641 lt!477414 minValue!907)) lt!477421) (apply!939 lt!477417 lt!477421))))

(declare-fun lt!477424 () Unit!35408)

(assert (=> b!1075478 (= lt!477424 lt!477428)))

(declare-fun lt!477423 () ListLongMap!14609)

(assert (=> b!1075478 (= lt!477423 (getCurrentListMapNoExtraKeys!3882 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477429 () (_ BitVec 64))

(assert (=> b!1075478 (= lt!477429 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477434 () (_ BitVec 64))

(assert (=> b!1075478 (= lt!477434 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477427 () Unit!35408)

(assert (=> b!1075478 (= lt!477427 (addApplyDifferent!512 lt!477423 lt!477429 zeroValueBefore!47 lt!477434))))

(assert (=> b!1075478 (= (apply!939 (+!3226 lt!477423 (tuple2!16641 lt!477429 zeroValueBefore!47)) lt!477434) (apply!939 lt!477423 lt!477434))))

(declare-fun lt!477419 () Unit!35408)

(assert (=> b!1075478 (= lt!477419 lt!477427)))

(declare-fun lt!477416 () ListLongMap!14609)

(assert (=> b!1075478 (= lt!477416 (getCurrentListMapNoExtraKeys!3882 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477422 () (_ BitVec 64))

(assert (=> b!1075478 (= lt!477422 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477426 () (_ BitVec 64))

(assert (=> b!1075478 (= lt!477426 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075478 (= lt!477425 (addApplyDifferent!512 lt!477416 lt!477422 minValue!907 lt!477426))))

(assert (=> b!1075478 (= (apply!939 (+!3226 lt!477416 (tuple2!16641 lt!477422 minValue!907)) lt!477426) (apply!939 lt!477416 lt!477426))))

(declare-fun bm!45519 () Bool)

(assert (=> bm!45519 (= call!45521 call!45522)))

(declare-fun b!1075479 () Bool)

(declare-fun res!716963 () Bool)

(assert (=> b!1075479 (=> (not res!716963) (not e!614653))))

(assert (=> b!1075479 (= res!716963 e!614661)))

(declare-fun c!108058 () Bool)

(assert (=> b!1075479 (= c!108058 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1075480 () Bool)

(declare-fun e!614652 () Bool)

(assert (=> b!1075480 (= e!614653 e!614652)))

(declare-fun c!108063 () Bool)

(assert (=> b!1075480 (= c!108063 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45520 () Bool)

(assert (=> bm!45520 (= call!45519 (getCurrentListMapNoExtraKeys!3882 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1075481 () Bool)

(declare-fun get!17237 (ValueCell!12306 V!39827) V!39827)

(declare-fun dynLambda!2046 (Int (_ BitVec 64)) V!39827)

(assert (=> b!1075481 (= e!614654 (= (apply!939 lt!477435 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000)) (get!17237 (select (arr!33190 _values!955) #b00000000000000000000000000000000) (dynLambda!2046 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1075481 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33726 _values!955)))))

(assert (=> b!1075481 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33727 _keys!1163)))))

(declare-fun b!1075482 () Bool)

(declare-fun e!614656 () Bool)

(assert (=> b!1075482 (= e!614656 (validKeyInArray!0 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075483 () Bool)

(assert (=> b!1075483 (= e!614652 e!614659)))

(declare-fun res!716961 () Bool)

(assert (=> b!1075483 (= res!716961 call!45525)))

(assert (=> b!1075483 (=> (not res!716961) (not e!614659))))

(declare-fun b!1075484 () Bool)

(declare-fun e!614657 () ListLongMap!14609)

(assert (=> b!1075484 (= e!614657 e!614660)))

(assert (=> b!1075484 (= c!108059 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45521 () Bool)

(assert (=> bm!45521 (= call!45523 call!45524)))

(declare-fun bm!45522 () Bool)

(assert (=> bm!45522 (= call!45520 (contains!6348 lt!477435 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075486 () Bool)

(assert (=> b!1075486 (= e!614660 call!45523)))

(declare-fun d!129593 () Bool)

(assert (=> d!129593 e!614653))

(declare-fun res!716956 () Bool)

(assert (=> d!129593 (=> (not res!716956) (not e!614653))))

(assert (=> d!129593 (= res!716956 (or (bvsge #b00000000000000000000000000000000 (size!33727 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33727 _keys!1163)))))))

(declare-fun lt!477433 () ListLongMap!14609)

(assert (=> d!129593 (= lt!477435 lt!477433)))

(declare-fun lt!477431 () Unit!35408)

(assert (=> d!129593 (= lt!477431 e!614651)))

(declare-fun c!108061 () Bool)

(assert (=> d!129593 (= c!108061 e!614656)))

(declare-fun res!716955 () Bool)

(assert (=> d!129593 (=> (not res!716955) (not e!614656))))

(assert (=> d!129593 (= res!716955 (bvslt #b00000000000000000000000000000000 (size!33727 _keys!1163)))))

(assert (=> d!129593 (= lt!477433 e!614657)))

(assert (=> d!129593 (= c!108060 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129593 (validMask!0 mask!1515)))

(assert (=> d!129593 (= (getCurrentListMap!4189 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477435)))

(declare-fun b!1075485 () Bool)

(assert (=> b!1075485 (= e!614661 (not call!45520))))

(declare-fun b!1075487 () Bool)

(assert (=> b!1075487 (= e!614652 (not call!45525))))

(declare-fun b!1075488 () Bool)

(assert (=> b!1075488 (= e!614657 (+!3226 call!45524 (tuple2!16641 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(assert (= (and d!129593 c!108060) b!1075488))

(assert (= (and d!129593 (not c!108060)) b!1075484))

(assert (= (and b!1075484 c!108059) b!1075486))

(assert (= (and b!1075484 (not c!108059)) b!1075469))

(assert (= (and b!1075469 c!108062) b!1075477))

(assert (= (and b!1075469 (not c!108062)) b!1075471))

(assert (= (or b!1075477 b!1075471) bm!45519))

(assert (= (or b!1075486 bm!45519) bm!45516))

(assert (= (or b!1075486 b!1075477) bm!45521))

(assert (= (or b!1075488 bm!45516) bm!45520))

(assert (= (or b!1075488 bm!45521) bm!45518))

(assert (= (and d!129593 res!716955) b!1075482))

(assert (= (and d!129593 c!108061) b!1075478))

(assert (= (and d!129593 (not c!108061)) b!1075475))

(assert (= (and d!129593 res!716956) b!1075473))

(assert (= (and b!1075473 res!716959) b!1075470))

(assert (= (and b!1075473 (not res!716960)) b!1075474))

(assert (= (and b!1075474 res!716958) b!1075481))

(assert (= (and b!1075473 res!716957) b!1075479))

(assert (= (and b!1075479 c!108058) b!1075476))

(assert (= (and b!1075479 (not c!108058)) b!1075485))

(assert (= (and b!1075476 res!716962) b!1075472))

(assert (= (or b!1075476 b!1075485) bm!45522))

(assert (= (and b!1075479 res!716963) b!1075480))

(assert (= (and b!1075480 c!108063) b!1075483))

(assert (= (and b!1075480 (not c!108063)) b!1075487))

(assert (= (and b!1075483 res!716961) b!1075468))

(assert (= (or b!1075483 b!1075487) bm!45517))

(declare-fun b_lambda!16877 () Bool)

(assert (=> (not b_lambda!16877) (not b!1075481)))

(declare-fun t!32529 () Bool)

(declare-fun tb!7173 () Bool)

(assert (=> (and start!95130 (= defaultEntry!963 defaultEntry!963) t!32529) tb!7173))

(declare-fun result!14827 () Bool)

(assert (=> tb!7173 (= result!14827 tp_is_empty!26019)))

(assert (=> b!1075481 t!32529))

(declare-fun b_and!35143 () Bool)

(assert (= b_and!35139 (and (=> t!32529 result!14827) b_and!35143)))

(assert (=> b!1075482 m!994257))

(assert (=> b!1075482 m!994257))

(assert (=> b!1075482 m!994265))

(declare-fun m!994275 () Bool)

(assert (=> bm!45518 m!994275))

(declare-fun m!994277 () Bool)

(assert (=> b!1075478 m!994277))

(declare-fun m!994279 () Bool)

(assert (=> b!1075478 m!994279))

(declare-fun m!994281 () Bool)

(assert (=> b!1075478 m!994281))

(declare-fun m!994283 () Bool)

(assert (=> b!1075478 m!994283))

(assert (=> b!1075478 m!994225))

(declare-fun m!994285 () Bool)

(assert (=> b!1075478 m!994285))

(assert (=> b!1075478 m!994279))

(declare-fun m!994287 () Bool)

(assert (=> b!1075478 m!994287))

(declare-fun m!994289 () Bool)

(assert (=> b!1075478 m!994289))

(assert (=> b!1075478 m!994257))

(declare-fun m!994291 () Bool)

(assert (=> b!1075478 m!994291))

(declare-fun m!994293 () Bool)

(assert (=> b!1075478 m!994293))

(declare-fun m!994295 () Bool)

(assert (=> b!1075478 m!994295))

(declare-fun m!994297 () Bool)

(assert (=> b!1075478 m!994297))

(assert (=> b!1075478 m!994291))

(declare-fun m!994299 () Bool)

(assert (=> b!1075478 m!994299))

(declare-fun m!994301 () Bool)

(assert (=> b!1075478 m!994301))

(declare-fun m!994303 () Bool)

(assert (=> b!1075478 m!994303))

(declare-fun m!994305 () Bool)

(assert (=> b!1075478 m!994305))

(assert (=> b!1075478 m!994301))

(assert (=> b!1075478 m!994287))

(declare-fun m!994307 () Bool)

(assert (=> b!1075468 m!994307))

(declare-fun m!994309 () Bool)

(assert (=> b!1075472 m!994309))

(assert (=> bm!45520 m!994225))

(declare-fun m!994311 () Bool)

(assert (=> bm!45517 m!994311))

(declare-fun m!994313 () Bool)

(assert (=> bm!45522 m!994313))

(declare-fun m!994315 () Bool)

(assert (=> b!1075488 m!994315))

(assert (=> b!1075474 m!994257))

(assert (=> b!1075474 m!994257))

(declare-fun m!994317 () Bool)

(assert (=> b!1075474 m!994317))

(assert (=> d!129593 m!994215))

(declare-fun m!994319 () Bool)

(assert (=> b!1075481 m!994319))

(declare-fun m!994321 () Bool)

(assert (=> b!1075481 m!994321))

(declare-fun m!994323 () Bool)

(assert (=> b!1075481 m!994323))

(assert (=> b!1075481 m!994257))

(declare-fun m!994325 () Bool)

(assert (=> b!1075481 m!994325))

(assert (=> b!1075481 m!994321))

(assert (=> b!1075481 m!994319))

(assert (=> b!1075481 m!994257))

(assert (=> b!1075470 m!994257))

(assert (=> b!1075470 m!994257))

(assert (=> b!1075470 m!994265))

(assert (=> b!1075373 d!129593))

(declare-fun d!129595 () Bool)

(assert (=> d!129595 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95130 d!129595))

(declare-fun d!129597 () Bool)

(assert (=> d!129597 (= (array_inv!25648 _values!955) (bvsge (size!33726 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95130 d!129597))

(declare-fun d!129599 () Bool)

(assert (=> d!129599 (= (array_inv!25649 _keys!1163) (bvsge (size!33727 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95130 d!129599))

(declare-fun b!1075501 () Bool)

(declare-fun e!614674 () Bool)

(declare-fun call!45528 () Bool)

(assert (=> b!1075501 (= e!614674 call!45528)))

(declare-fun b!1075502 () Bool)

(assert (=> b!1075502 (= e!614674 call!45528)))

(declare-fun bm!45525 () Bool)

(declare-fun c!108066 () Bool)

(assert (=> bm!45525 (= call!45528 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108066 (Cons!23172 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000) Nil!23173) Nil!23173)))))

(declare-fun b!1075504 () Bool)

(declare-fun e!614671 () Bool)

(declare-fun contains!6349 (List!23176 (_ BitVec 64)) Bool)

(assert (=> b!1075504 (= e!614671 (contains!6349 Nil!23173 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075505 () Bool)

(declare-fun e!614673 () Bool)

(assert (=> b!1075505 (= e!614673 e!614674)))

(assert (=> b!1075505 (= c!108066 (validKeyInArray!0 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075503 () Bool)

(declare-fun e!614672 () Bool)

(assert (=> b!1075503 (= e!614672 e!614673)))

(declare-fun res!716971 () Bool)

(assert (=> b!1075503 (=> (not res!716971) (not e!614673))))

(assert (=> b!1075503 (= res!716971 (not e!614671))))

(declare-fun res!716970 () Bool)

(assert (=> b!1075503 (=> (not res!716970) (not e!614671))))

(assert (=> b!1075503 (= res!716970 (validKeyInArray!0 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129601 () Bool)

(declare-fun res!716972 () Bool)

(assert (=> d!129601 (=> res!716972 e!614672)))

(assert (=> d!129601 (= res!716972 (bvsge #b00000000000000000000000000000000 (size!33727 _keys!1163)))))

(assert (=> d!129601 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23173) e!614672)))

(assert (= (and d!129601 (not res!716972)) b!1075503))

(assert (= (and b!1075503 res!716970) b!1075504))

(assert (= (and b!1075503 res!716971) b!1075505))

(assert (= (and b!1075505 c!108066) b!1075501))

(assert (= (and b!1075505 (not c!108066)) b!1075502))

(assert (= (or b!1075501 b!1075502) bm!45525))

(assert (=> bm!45525 m!994257))

(declare-fun m!994327 () Bool)

(assert (=> bm!45525 m!994327))

(assert (=> b!1075504 m!994257))

(assert (=> b!1075504 m!994257))

(declare-fun m!994329 () Bool)

(assert (=> b!1075504 m!994329))

(assert (=> b!1075505 m!994257))

(assert (=> b!1075505 m!994257))

(assert (=> b!1075505 m!994265))

(assert (=> b!1075503 m!994257))

(assert (=> b!1075503 m!994257))

(assert (=> b!1075503 m!994265))

(assert (=> b!1075374 d!129601))

(declare-fun b!1075506 () Bool)

(declare-fun e!614684 () Bool)

(declare-fun lt!477457 () ListLongMap!14609)

(assert (=> b!1075506 (= e!614684 (= (apply!939 lt!477457 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun bm!45526 () Bool)

(declare-fun call!45532 () ListLongMap!14609)

(declare-fun call!45529 () ListLongMap!14609)

(assert (=> bm!45526 (= call!45532 call!45529)))

(declare-fun b!1075507 () Bool)

(declare-fun c!108071 () Bool)

(assert (=> b!1075507 (= c!108071 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!614685 () ListLongMap!14609)

(declare-fun e!614687 () ListLongMap!14609)

(assert (=> b!1075507 (= e!614685 e!614687)))

(declare-fun b!1075508 () Bool)

(declare-fun e!614675 () Bool)

(assert (=> b!1075508 (= e!614675 (validKeyInArray!0 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075509 () Bool)

(declare-fun call!45531 () ListLongMap!14609)

(assert (=> b!1075509 (= e!614687 call!45531)))

(declare-fun b!1075510 () Bool)

(declare-fun e!614680 () Bool)

(assert (=> b!1075510 (= e!614680 (= (apply!939 lt!477457 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun b!1075511 () Bool)

(declare-fun res!716975 () Bool)

(declare-fun e!614678 () Bool)

(assert (=> b!1075511 (=> (not res!716975) (not e!614678))))

(declare-fun e!614683 () Bool)

(assert (=> b!1075511 (= res!716975 e!614683)))

(declare-fun res!716978 () Bool)

(assert (=> b!1075511 (=> res!716978 e!614683)))

(assert (=> b!1075511 (= res!716978 (not e!614675))))

(declare-fun res!716977 () Bool)

(assert (=> b!1075511 (=> (not res!716977) (not e!614675))))

(assert (=> b!1075511 (= res!716977 (bvslt #b00000000000000000000000000000000 (size!33727 _keys!1163)))))

(declare-fun bm!45527 () Bool)

(declare-fun call!45535 () Bool)

(assert (=> bm!45527 (= call!45535 (contains!6348 lt!477457 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075512 () Bool)

(declare-fun e!614679 () Bool)

(assert (=> b!1075512 (= e!614683 e!614679)))

(declare-fun res!716976 () Bool)

(assert (=> b!1075512 (=> (not res!716976) (not e!614679))))

(assert (=> b!1075512 (= res!716976 (contains!6348 lt!477457 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075512 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33727 _keys!1163)))))

(declare-fun c!108068 () Bool)

(declare-fun c!108069 () Bool)

(declare-fun bm!45528 () Bool)

(declare-fun call!45534 () ListLongMap!14609)

(assert (=> bm!45528 (= call!45534 (+!3226 (ite c!108069 call!45529 (ite c!108068 call!45532 call!45531)) (ite (or c!108069 c!108068) (tuple2!16641 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16641 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1075513 () Bool)

(declare-fun e!614676 () Unit!35408)

(declare-fun Unit!35412 () Unit!35408)

(assert (=> b!1075513 (= e!614676 Unit!35412)))

(declare-fun b!1075514 () Bool)

(declare-fun e!614686 () Bool)

(assert (=> b!1075514 (= e!614686 e!614680)))

(declare-fun res!716980 () Bool)

(declare-fun call!45530 () Bool)

(assert (=> b!1075514 (= res!716980 call!45530)))

(assert (=> b!1075514 (=> (not res!716980) (not e!614680))))

(declare-fun b!1075515 () Bool)

(declare-fun call!45533 () ListLongMap!14609)

(assert (=> b!1075515 (= e!614687 call!45533)))

(declare-fun b!1075516 () Bool)

(declare-fun lt!477447 () Unit!35408)

(assert (=> b!1075516 (= e!614676 lt!477447)))

(declare-fun lt!477437 () ListLongMap!14609)

(assert (=> b!1075516 (= lt!477437 (getCurrentListMapNoExtraKeys!3882 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477442 () (_ BitVec 64))

(assert (=> b!1075516 (= lt!477442 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477452 () (_ BitVec 64))

(assert (=> b!1075516 (= lt!477452 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477440 () Unit!35408)

(assert (=> b!1075516 (= lt!477440 (addStillContains!652 lt!477437 lt!477442 zeroValueAfter!47 lt!477452))))

(assert (=> b!1075516 (contains!6348 (+!3226 lt!477437 (tuple2!16641 lt!477442 zeroValueAfter!47)) lt!477452)))

(declare-fun lt!477454 () Unit!35408)

(assert (=> b!1075516 (= lt!477454 lt!477440)))

(declare-fun lt!477439 () ListLongMap!14609)

(assert (=> b!1075516 (= lt!477439 (getCurrentListMapNoExtraKeys!3882 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477436 () (_ BitVec 64))

(assert (=> b!1075516 (= lt!477436 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477443 () (_ BitVec 64))

(assert (=> b!1075516 (= lt!477443 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477450 () Unit!35408)

(assert (=> b!1075516 (= lt!477450 (addApplyDifferent!512 lt!477439 lt!477436 minValue!907 lt!477443))))

(assert (=> b!1075516 (= (apply!939 (+!3226 lt!477439 (tuple2!16641 lt!477436 minValue!907)) lt!477443) (apply!939 lt!477439 lt!477443))))

(declare-fun lt!477446 () Unit!35408)

(assert (=> b!1075516 (= lt!477446 lt!477450)))

(declare-fun lt!477445 () ListLongMap!14609)

(assert (=> b!1075516 (= lt!477445 (getCurrentListMapNoExtraKeys!3882 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477451 () (_ BitVec 64))

(assert (=> b!1075516 (= lt!477451 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477456 () (_ BitVec 64))

(assert (=> b!1075516 (= lt!477456 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477449 () Unit!35408)

(assert (=> b!1075516 (= lt!477449 (addApplyDifferent!512 lt!477445 lt!477451 zeroValueAfter!47 lt!477456))))

(assert (=> b!1075516 (= (apply!939 (+!3226 lt!477445 (tuple2!16641 lt!477451 zeroValueAfter!47)) lt!477456) (apply!939 lt!477445 lt!477456))))

(declare-fun lt!477441 () Unit!35408)

(assert (=> b!1075516 (= lt!477441 lt!477449)))

(declare-fun lt!477438 () ListLongMap!14609)

(assert (=> b!1075516 (= lt!477438 (getCurrentListMapNoExtraKeys!3882 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477444 () (_ BitVec 64))

(assert (=> b!1075516 (= lt!477444 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477448 () (_ BitVec 64))

(assert (=> b!1075516 (= lt!477448 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075516 (= lt!477447 (addApplyDifferent!512 lt!477438 lt!477444 minValue!907 lt!477448))))

(assert (=> b!1075516 (= (apply!939 (+!3226 lt!477438 (tuple2!16641 lt!477444 minValue!907)) lt!477448) (apply!939 lt!477438 lt!477448))))

(declare-fun bm!45529 () Bool)

(assert (=> bm!45529 (= call!45531 call!45532)))

(declare-fun b!1075517 () Bool)

(declare-fun res!716981 () Bool)

(assert (=> b!1075517 (=> (not res!716981) (not e!614678))))

(assert (=> b!1075517 (= res!716981 e!614686)))

(declare-fun c!108067 () Bool)

(assert (=> b!1075517 (= c!108067 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1075518 () Bool)

(declare-fun e!614677 () Bool)

(assert (=> b!1075518 (= e!614678 e!614677)))

(declare-fun c!108072 () Bool)

(assert (=> b!1075518 (= c!108072 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45530 () Bool)

(assert (=> bm!45530 (= call!45529 (getCurrentListMapNoExtraKeys!3882 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1075519 () Bool)

(assert (=> b!1075519 (= e!614679 (= (apply!939 lt!477457 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000)) (get!17237 (select (arr!33190 _values!955) #b00000000000000000000000000000000) (dynLambda!2046 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1075519 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33726 _values!955)))))

(assert (=> b!1075519 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33727 _keys!1163)))))

(declare-fun b!1075520 () Bool)

(declare-fun e!614681 () Bool)

(assert (=> b!1075520 (= e!614681 (validKeyInArray!0 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075521 () Bool)

(assert (=> b!1075521 (= e!614677 e!614684)))

(declare-fun res!716979 () Bool)

(assert (=> b!1075521 (= res!716979 call!45535)))

(assert (=> b!1075521 (=> (not res!716979) (not e!614684))))

(declare-fun b!1075522 () Bool)

(declare-fun e!614682 () ListLongMap!14609)

(assert (=> b!1075522 (= e!614682 e!614685)))

(assert (=> b!1075522 (= c!108068 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45531 () Bool)

(assert (=> bm!45531 (= call!45533 call!45534)))

(declare-fun bm!45532 () Bool)

(assert (=> bm!45532 (= call!45530 (contains!6348 lt!477457 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075524 () Bool)

(assert (=> b!1075524 (= e!614685 call!45533)))

(declare-fun d!129603 () Bool)

(assert (=> d!129603 e!614678))

(declare-fun res!716974 () Bool)

(assert (=> d!129603 (=> (not res!716974) (not e!614678))))

(assert (=> d!129603 (= res!716974 (or (bvsge #b00000000000000000000000000000000 (size!33727 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33727 _keys!1163)))))))

(declare-fun lt!477455 () ListLongMap!14609)

(assert (=> d!129603 (= lt!477457 lt!477455)))

(declare-fun lt!477453 () Unit!35408)

(assert (=> d!129603 (= lt!477453 e!614676)))

(declare-fun c!108070 () Bool)

(assert (=> d!129603 (= c!108070 e!614681)))

(declare-fun res!716973 () Bool)

(assert (=> d!129603 (=> (not res!716973) (not e!614681))))

(assert (=> d!129603 (= res!716973 (bvslt #b00000000000000000000000000000000 (size!33727 _keys!1163)))))

(assert (=> d!129603 (= lt!477455 e!614682)))

(assert (=> d!129603 (= c!108069 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129603 (validMask!0 mask!1515)))

(assert (=> d!129603 (= (getCurrentListMap!4189 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477457)))

(declare-fun b!1075523 () Bool)

(assert (=> b!1075523 (= e!614686 (not call!45530))))

(declare-fun b!1075525 () Bool)

(assert (=> b!1075525 (= e!614677 (not call!45535))))

(declare-fun b!1075526 () Bool)

(assert (=> b!1075526 (= e!614682 (+!3226 call!45534 (tuple2!16641 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(assert (= (and d!129603 c!108069) b!1075526))

(assert (= (and d!129603 (not c!108069)) b!1075522))

(assert (= (and b!1075522 c!108068) b!1075524))

(assert (= (and b!1075522 (not c!108068)) b!1075507))

(assert (= (and b!1075507 c!108071) b!1075515))

(assert (= (and b!1075507 (not c!108071)) b!1075509))

(assert (= (or b!1075515 b!1075509) bm!45529))

(assert (= (or b!1075524 bm!45529) bm!45526))

(assert (= (or b!1075524 b!1075515) bm!45531))

(assert (= (or b!1075526 bm!45526) bm!45530))

(assert (= (or b!1075526 bm!45531) bm!45528))

(assert (= (and d!129603 res!716973) b!1075520))

(assert (= (and d!129603 c!108070) b!1075516))

(assert (= (and d!129603 (not c!108070)) b!1075513))

(assert (= (and d!129603 res!716974) b!1075511))

(assert (= (and b!1075511 res!716977) b!1075508))

(assert (= (and b!1075511 (not res!716978)) b!1075512))

(assert (= (and b!1075512 res!716976) b!1075519))

(assert (= (and b!1075511 res!716975) b!1075517))

(assert (= (and b!1075517 c!108067) b!1075514))

(assert (= (and b!1075517 (not c!108067)) b!1075523))

(assert (= (and b!1075514 res!716980) b!1075510))

(assert (= (or b!1075514 b!1075523) bm!45532))

(assert (= (and b!1075517 res!716981) b!1075518))

(assert (= (and b!1075518 c!108072) b!1075521))

(assert (= (and b!1075518 (not c!108072)) b!1075525))

(assert (= (and b!1075521 res!716979) b!1075506))

(assert (= (or b!1075521 b!1075525) bm!45527))

(declare-fun b_lambda!16879 () Bool)

(assert (=> (not b_lambda!16879) (not b!1075519)))

(assert (=> b!1075519 t!32529))

(declare-fun b_and!35145 () Bool)

(assert (= b_and!35143 (and (=> t!32529 result!14827) b_and!35145)))

(assert (=> b!1075520 m!994257))

(assert (=> b!1075520 m!994257))

(assert (=> b!1075520 m!994265))

(declare-fun m!994331 () Bool)

(assert (=> bm!45528 m!994331))

(declare-fun m!994333 () Bool)

(assert (=> b!1075516 m!994333))

(declare-fun m!994335 () Bool)

(assert (=> b!1075516 m!994335))

(declare-fun m!994337 () Bool)

(assert (=> b!1075516 m!994337))

(declare-fun m!994339 () Bool)

(assert (=> b!1075516 m!994339))

(assert (=> b!1075516 m!994223))

(declare-fun m!994341 () Bool)

(assert (=> b!1075516 m!994341))

(assert (=> b!1075516 m!994335))

(declare-fun m!994343 () Bool)

(assert (=> b!1075516 m!994343))

(declare-fun m!994345 () Bool)

(assert (=> b!1075516 m!994345))

(assert (=> b!1075516 m!994257))

(declare-fun m!994347 () Bool)

(assert (=> b!1075516 m!994347))

(declare-fun m!994349 () Bool)

(assert (=> b!1075516 m!994349))

(declare-fun m!994351 () Bool)

(assert (=> b!1075516 m!994351))

(declare-fun m!994353 () Bool)

(assert (=> b!1075516 m!994353))

(assert (=> b!1075516 m!994347))

(declare-fun m!994355 () Bool)

(assert (=> b!1075516 m!994355))

(declare-fun m!994357 () Bool)

(assert (=> b!1075516 m!994357))

(declare-fun m!994359 () Bool)

(assert (=> b!1075516 m!994359))

(declare-fun m!994361 () Bool)

(assert (=> b!1075516 m!994361))

(assert (=> b!1075516 m!994357))

(assert (=> b!1075516 m!994343))

(declare-fun m!994363 () Bool)

(assert (=> b!1075506 m!994363))

(declare-fun m!994365 () Bool)

(assert (=> b!1075510 m!994365))

(assert (=> bm!45530 m!994223))

(declare-fun m!994367 () Bool)

(assert (=> bm!45527 m!994367))

(declare-fun m!994369 () Bool)

(assert (=> bm!45532 m!994369))

(declare-fun m!994371 () Bool)

(assert (=> b!1075526 m!994371))

(assert (=> b!1075512 m!994257))

(assert (=> b!1075512 m!994257))

(declare-fun m!994373 () Bool)

(assert (=> b!1075512 m!994373))

(assert (=> d!129603 m!994215))

(assert (=> b!1075519 m!994319))

(assert (=> b!1075519 m!994321))

(assert (=> b!1075519 m!994323))

(assert (=> b!1075519 m!994257))

(declare-fun m!994375 () Bool)

(assert (=> b!1075519 m!994375))

(assert (=> b!1075519 m!994321))

(assert (=> b!1075519 m!994319))

(assert (=> b!1075519 m!994257))

(assert (=> b!1075508 m!994257))

(assert (=> b!1075508 m!994257))

(assert (=> b!1075508 m!994265))

(assert (=> b!1075372 d!129603))

(declare-fun d!129605 () Bool)

(declare-fun lt!477460 () ListLongMap!14609)

(assert (=> d!129605 (not (contains!6348 lt!477460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!76 (List!23175 (_ BitVec 64)) List!23175)

(assert (=> d!129605 (= lt!477460 (ListLongMap!14610 (removeStrictlySorted!76 (toList!7320 lt!477328) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129605 (= (-!714 lt!477328 #b0000000000000000000000000000000000000000000000000000000000000000) lt!477460)))

(declare-fun bs!31683 () Bool)

(assert (= bs!31683 d!129605))

(declare-fun m!994377 () Bool)

(assert (=> bs!31683 m!994377))

(declare-fun m!994379 () Bool)

(assert (=> bs!31683 m!994379))

(assert (=> b!1075372 d!129605))

(declare-fun d!129607 () Bool)

(assert (=> d!129607 (= (-!714 lt!477328 #b0000000000000000000000000000000000000000000000000000000000000000) lt!477328)))

(declare-fun lt!477463 () Unit!35408)

(declare-fun choose!1754 (ListLongMap!14609 (_ BitVec 64)) Unit!35408)

(assert (=> d!129607 (= lt!477463 (choose!1754 lt!477328 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129607 (not (contains!6348 lt!477328 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129607 (= (removeNotPresentStillSame!82 lt!477328 #b0000000000000000000000000000000000000000000000000000000000000000) lt!477463)))

(declare-fun bs!31684 () Bool)

(assert (= bs!31684 d!129607))

(assert (=> bs!31684 m!994207))

(declare-fun m!994381 () Bool)

(assert (=> bs!31684 m!994381))

(assert (=> bs!31684 m!994201))

(assert (=> b!1075372 d!129607))

(declare-fun d!129609 () Bool)

(assert (=> d!129609 (= (getCurrentListMapNoExtraKeys!3882 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3882 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477466 () Unit!35408)

(declare-fun choose!1755 (array!69009 array!69007 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39827 V!39827 V!39827 V!39827 (_ BitVec 32) Int) Unit!35408)

(assert (=> d!129609 (= lt!477466 (choose!1755 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129609 (validMask!0 mask!1515)))

(assert (=> d!129609 (= (lemmaNoChangeToArrayThenSameMapNoExtras!898 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477466)))

(declare-fun bs!31685 () Bool)

(assert (= bs!31685 d!129609))

(assert (=> bs!31685 m!994225))

(assert (=> bs!31685 m!994223))

(declare-fun m!994383 () Bool)

(assert (=> bs!31685 m!994383))

(assert (=> bs!31685 m!994215))

(assert (=> b!1075377 d!129609))

(declare-fun b!1075551 () Bool)

(declare-fun e!614705 () ListLongMap!14609)

(declare-fun e!614707 () ListLongMap!14609)

(assert (=> b!1075551 (= e!614705 e!614707)))

(declare-fun c!108081 () Bool)

(assert (=> b!1075551 (= c!108081 (validKeyInArray!0 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075552 () Bool)

(declare-fun e!614702 () Bool)

(declare-fun e!614703 () Bool)

(assert (=> b!1075552 (= e!614702 e!614703)))

(assert (=> b!1075552 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33727 _keys!1163)))))

(declare-fun res!716992 () Bool)

(declare-fun lt!477485 () ListLongMap!14609)

(assert (=> b!1075552 (= res!716992 (contains!6348 lt!477485 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075552 (=> (not res!716992) (not e!614703))))

(declare-fun b!1075553 () Bool)

(declare-fun res!716993 () Bool)

(declare-fun e!614706 () Bool)

(assert (=> b!1075553 (=> (not res!716993) (not e!614706))))

(assert (=> b!1075553 (= res!716993 (not (contains!6348 lt!477485 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1075554 () Bool)

(declare-fun e!614704 () Bool)

(assert (=> b!1075554 (= e!614704 (validKeyInArray!0 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075554 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1075555 () Bool)

(assert (=> b!1075555 (= e!614705 (ListLongMap!14610 Nil!23172))))

(declare-fun b!1075556 () Bool)

(declare-fun call!45538 () ListLongMap!14609)

(assert (=> b!1075556 (= e!614707 call!45538)))

(declare-fun d!129611 () Bool)

(assert (=> d!129611 e!614706))

(declare-fun res!716991 () Bool)

(assert (=> d!129611 (=> (not res!716991) (not e!614706))))

(assert (=> d!129611 (= res!716991 (not (contains!6348 lt!477485 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129611 (= lt!477485 e!614705)))

(declare-fun c!108084 () Bool)

(assert (=> d!129611 (= c!108084 (bvsge #b00000000000000000000000000000000 (size!33727 _keys!1163)))))

(assert (=> d!129611 (validMask!0 mask!1515)))

(assert (=> d!129611 (= (getCurrentListMapNoExtraKeys!3882 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477485)))

(declare-fun bm!45535 () Bool)

(assert (=> bm!45535 (= call!45538 (getCurrentListMapNoExtraKeys!3882 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1075557 () Bool)

(declare-fun e!614708 () Bool)

(assert (=> b!1075557 (= e!614702 e!614708)))

(declare-fun c!108082 () Bool)

(assert (=> b!1075557 (= c!108082 (bvslt #b00000000000000000000000000000000 (size!33727 _keys!1163)))))

(declare-fun b!1075558 () Bool)

(assert (=> b!1075558 (= e!614706 e!614702)))

(declare-fun c!108083 () Bool)

(assert (=> b!1075558 (= c!108083 e!614704)))

(declare-fun res!716990 () Bool)

(assert (=> b!1075558 (=> (not res!716990) (not e!614704))))

(assert (=> b!1075558 (= res!716990 (bvslt #b00000000000000000000000000000000 (size!33727 _keys!1163)))))

(declare-fun b!1075559 () Bool)

(assert (=> b!1075559 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33727 _keys!1163)))))

(assert (=> b!1075559 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33726 _values!955)))))

(assert (=> b!1075559 (= e!614703 (= (apply!939 lt!477485 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000)) (get!17237 (select (arr!33190 _values!955) #b00000000000000000000000000000000) (dynLambda!2046 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1075560 () Bool)

(declare-fun lt!477483 () Unit!35408)

(declare-fun lt!477484 () Unit!35408)

(assert (=> b!1075560 (= lt!477483 lt!477484)))

(declare-fun lt!477486 () (_ BitVec 64))

(declare-fun lt!477487 () ListLongMap!14609)

(declare-fun lt!477481 () V!39827)

(declare-fun lt!477482 () (_ BitVec 64))

(assert (=> b!1075560 (not (contains!6348 (+!3226 lt!477487 (tuple2!16641 lt!477486 lt!477481)) lt!477482))))

(declare-fun addStillNotContains!267 (ListLongMap!14609 (_ BitVec 64) V!39827 (_ BitVec 64)) Unit!35408)

(assert (=> b!1075560 (= lt!477484 (addStillNotContains!267 lt!477487 lt!477486 lt!477481 lt!477482))))

(assert (=> b!1075560 (= lt!477482 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1075560 (= lt!477481 (get!17237 (select (arr!33190 _values!955) #b00000000000000000000000000000000) (dynLambda!2046 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1075560 (= lt!477486 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075560 (= lt!477487 call!45538)))

(assert (=> b!1075560 (= e!614707 (+!3226 call!45538 (tuple2!16641 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000) (get!17237 (select (arr!33190 _values!955) #b00000000000000000000000000000000) (dynLambda!2046 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1075561 () Bool)

(declare-fun isEmpty!957 (ListLongMap!14609) Bool)

(assert (=> b!1075561 (= e!614708 (isEmpty!957 lt!477485))))

(declare-fun b!1075562 () Bool)

(assert (=> b!1075562 (= e!614708 (= lt!477485 (getCurrentListMapNoExtraKeys!3882 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(assert (= (and d!129611 c!108084) b!1075555))

(assert (= (and d!129611 (not c!108084)) b!1075551))

(assert (= (and b!1075551 c!108081) b!1075560))

(assert (= (and b!1075551 (not c!108081)) b!1075556))

(assert (= (or b!1075560 b!1075556) bm!45535))

(assert (= (and d!129611 res!716991) b!1075553))

(assert (= (and b!1075553 res!716993) b!1075558))

(assert (= (and b!1075558 res!716990) b!1075554))

(assert (= (and b!1075558 c!108083) b!1075552))

(assert (= (and b!1075558 (not c!108083)) b!1075557))

(assert (= (and b!1075552 res!716992) b!1075559))

(assert (= (and b!1075557 c!108082) b!1075562))

(assert (= (and b!1075557 (not c!108082)) b!1075561))

(declare-fun b_lambda!16881 () Bool)

(assert (=> (not b_lambda!16881) (not b!1075559)))

(assert (=> b!1075559 t!32529))

(declare-fun b_and!35147 () Bool)

(assert (= b_and!35145 (and (=> t!32529 result!14827) b_and!35147)))

(declare-fun b_lambda!16883 () Bool)

(assert (=> (not b_lambda!16883) (not b!1075560)))

(assert (=> b!1075560 t!32529))

(declare-fun b_and!35149 () Bool)

(assert (= b_and!35147 (and (=> t!32529 result!14827) b_and!35149)))

(declare-fun m!994385 () Bool)

(assert (=> b!1075553 m!994385))

(assert (=> b!1075559 m!994319))

(assert (=> b!1075559 m!994321))

(assert (=> b!1075559 m!994323))

(assert (=> b!1075559 m!994257))

(declare-fun m!994387 () Bool)

(assert (=> b!1075559 m!994387))

(assert (=> b!1075559 m!994319))

(assert (=> b!1075559 m!994257))

(assert (=> b!1075559 m!994321))

(assert (=> b!1075554 m!994257))

(assert (=> b!1075554 m!994257))

(assert (=> b!1075554 m!994265))

(declare-fun m!994389 () Bool)

(assert (=> b!1075561 m!994389))

(declare-fun m!994391 () Bool)

(assert (=> bm!45535 m!994391))

(declare-fun m!994393 () Bool)

(assert (=> d!129611 m!994393))

(assert (=> d!129611 m!994215))

(declare-fun m!994395 () Bool)

(assert (=> b!1075560 m!994395))

(assert (=> b!1075560 m!994319))

(assert (=> b!1075560 m!994321))

(assert (=> b!1075560 m!994323))

(declare-fun m!994397 () Bool)

(assert (=> b!1075560 m!994397))

(declare-fun m!994399 () Bool)

(assert (=> b!1075560 m!994399))

(assert (=> b!1075560 m!994319))

(assert (=> b!1075560 m!994399))

(declare-fun m!994401 () Bool)

(assert (=> b!1075560 m!994401))

(assert (=> b!1075560 m!994257))

(assert (=> b!1075560 m!994321))

(assert (=> b!1075551 m!994257))

(assert (=> b!1075551 m!994257))

(assert (=> b!1075551 m!994265))

(assert (=> b!1075552 m!994257))

(assert (=> b!1075552 m!994257))

(declare-fun m!994403 () Bool)

(assert (=> b!1075552 m!994403))

(assert (=> b!1075562 m!994391))

(assert (=> b!1075377 d!129611))

(declare-fun b!1075563 () Bool)

(declare-fun e!614712 () ListLongMap!14609)

(declare-fun e!614714 () ListLongMap!14609)

(assert (=> b!1075563 (= e!614712 e!614714)))

(declare-fun c!108085 () Bool)

(assert (=> b!1075563 (= c!108085 (validKeyInArray!0 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075564 () Bool)

(declare-fun e!614709 () Bool)

(declare-fun e!614710 () Bool)

(assert (=> b!1075564 (= e!614709 e!614710)))

(assert (=> b!1075564 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33727 _keys!1163)))))

(declare-fun res!716996 () Bool)

(declare-fun lt!477492 () ListLongMap!14609)

(assert (=> b!1075564 (= res!716996 (contains!6348 lt!477492 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075564 (=> (not res!716996) (not e!614710))))

(declare-fun b!1075565 () Bool)

(declare-fun res!716997 () Bool)

(declare-fun e!614713 () Bool)

(assert (=> b!1075565 (=> (not res!716997) (not e!614713))))

(assert (=> b!1075565 (= res!716997 (not (contains!6348 lt!477492 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1075566 () Bool)

(declare-fun e!614711 () Bool)

(assert (=> b!1075566 (= e!614711 (validKeyInArray!0 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075566 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1075567 () Bool)

(assert (=> b!1075567 (= e!614712 (ListLongMap!14610 Nil!23172))))

(declare-fun b!1075568 () Bool)

(declare-fun call!45539 () ListLongMap!14609)

(assert (=> b!1075568 (= e!614714 call!45539)))

(declare-fun d!129613 () Bool)

(assert (=> d!129613 e!614713))

(declare-fun res!716995 () Bool)

(assert (=> d!129613 (=> (not res!716995) (not e!614713))))

(assert (=> d!129613 (= res!716995 (not (contains!6348 lt!477492 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129613 (= lt!477492 e!614712)))

(declare-fun c!108088 () Bool)

(assert (=> d!129613 (= c!108088 (bvsge #b00000000000000000000000000000000 (size!33727 _keys!1163)))))

(assert (=> d!129613 (validMask!0 mask!1515)))

(assert (=> d!129613 (= (getCurrentListMapNoExtraKeys!3882 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477492)))

(declare-fun bm!45536 () Bool)

(assert (=> bm!45536 (= call!45539 (getCurrentListMapNoExtraKeys!3882 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1075569 () Bool)

(declare-fun e!614715 () Bool)

(assert (=> b!1075569 (= e!614709 e!614715)))

(declare-fun c!108086 () Bool)

(assert (=> b!1075569 (= c!108086 (bvslt #b00000000000000000000000000000000 (size!33727 _keys!1163)))))

(declare-fun b!1075570 () Bool)

(assert (=> b!1075570 (= e!614713 e!614709)))

(declare-fun c!108087 () Bool)

(assert (=> b!1075570 (= c!108087 e!614711)))

(declare-fun res!716994 () Bool)

(assert (=> b!1075570 (=> (not res!716994) (not e!614711))))

(assert (=> b!1075570 (= res!716994 (bvslt #b00000000000000000000000000000000 (size!33727 _keys!1163)))))

(declare-fun b!1075571 () Bool)

(assert (=> b!1075571 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33727 _keys!1163)))))

(assert (=> b!1075571 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33726 _values!955)))))

(assert (=> b!1075571 (= e!614710 (= (apply!939 lt!477492 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000)) (get!17237 (select (arr!33190 _values!955) #b00000000000000000000000000000000) (dynLambda!2046 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1075572 () Bool)

(declare-fun lt!477490 () Unit!35408)

(declare-fun lt!477491 () Unit!35408)

(assert (=> b!1075572 (= lt!477490 lt!477491)))

(declare-fun lt!477493 () (_ BitVec 64))

(declare-fun lt!477489 () (_ BitVec 64))

(declare-fun lt!477494 () ListLongMap!14609)

(declare-fun lt!477488 () V!39827)

(assert (=> b!1075572 (not (contains!6348 (+!3226 lt!477494 (tuple2!16641 lt!477493 lt!477488)) lt!477489))))

(assert (=> b!1075572 (= lt!477491 (addStillNotContains!267 lt!477494 lt!477493 lt!477488 lt!477489))))

(assert (=> b!1075572 (= lt!477489 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1075572 (= lt!477488 (get!17237 (select (arr!33190 _values!955) #b00000000000000000000000000000000) (dynLambda!2046 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1075572 (= lt!477493 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075572 (= lt!477494 call!45539)))

(assert (=> b!1075572 (= e!614714 (+!3226 call!45539 (tuple2!16641 (select (arr!33191 _keys!1163) #b00000000000000000000000000000000) (get!17237 (select (arr!33190 _values!955) #b00000000000000000000000000000000) (dynLambda!2046 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1075573 () Bool)

(assert (=> b!1075573 (= e!614715 (isEmpty!957 lt!477492))))

(declare-fun b!1075574 () Bool)

(assert (=> b!1075574 (= e!614715 (= lt!477492 (getCurrentListMapNoExtraKeys!3882 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(assert (= (and d!129613 c!108088) b!1075567))

(assert (= (and d!129613 (not c!108088)) b!1075563))

(assert (= (and b!1075563 c!108085) b!1075572))

(assert (= (and b!1075563 (not c!108085)) b!1075568))

(assert (= (or b!1075572 b!1075568) bm!45536))

(assert (= (and d!129613 res!716995) b!1075565))

(assert (= (and b!1075565 res!716997) b!1075570))

(assert (= (and b!1075570 res!716994) b!1075566))

(assert (= (and b!1075570 c!108087) b!1075564))

(assert (= (and b!1075570 (not c!108087)) b!1075569))

(assert (= (and b!1075564 res!716996) b!1075571))

(assert (= (and b!1075569 c!108086) b!1075574))

(assert (= (and b!1075569 (not c!108086)) b!1075573))

(declare-fun b_lambda!16885 () Bool)

(assert (=> (not b_lambda!16885) (not b!1075571)))

(assert (=> b!1075571 t!32529))

(declare-fun b_and!35151 () Bool)

(assert (= b_and!35149 (and (=> t!32529 result!14827) b_and!35151)))

(declare-fun b_lambda!16887 () Bool)

(assert (=> (not b_lambda!16887) (not b!1075572)))

(assert (=> b!1075572 t!32529))

(declare-fun b_and!35153 () Bool)

(assert (= b_and!35151 (and (=> t!32529 result!14827) b_and!35153)))

(declare-fun m!994405 () Bool)

(assert (=> b!1075565 m!994405))

(assert (=> b!1075571 m!994319))

(assert (=> b!1075571 m!994321))

(assert (=> b!1075571 m!994323))

(assert (=> b!1075571 m!994257))

(declare-fun m!994407 () Bool)

(assert (=> b!1075571 m!994407))

(assert (=> b!1075571 m!994319))

(assert (=> b!1075571 m!994257))

(assert (=> b!1075571 m!994321))

(assert (=> b!1075566 m!994257))

(assert (=> b!1075566 m!994257))

(assert (=> b!1075566 m!994265))

(declare-fun m!994409 () Bool)

(assert (=> b!1075573 m!994409))

(declare-fun m!994411 () Bool)

(assert (=> bm!45536 m!994411))

(declare-fun m!994413 () Bool)

(assert (=> d!129613 m!994413))

(assert (=> d!129613 m!994215))

(declare-fun m!994415 () Bool)

(assert (=> b!1075572 m!994415))

(assert (=> b!1075572 m!994319))

(assert (=> b!1075572 m!994321))

(assert (=> b!1075572 m!994323))

(declare-fun m!994417 () Bool)

(assert (=> b!1075572 m!994417))

(declare-fun m!994419 () Bool)

(assert (=> b!1075572 m!994419))

(assert (=> b!1075572 m!994319))

(assert (=> b!1075572 m!994419))

(declare-fun m!994421 () Bool)

(assert (=> b!1075572 m!994421))

(assert (=> b!1075572 m!994257))

(assert (=> b!1075572 m!994321))

(assert (=> b!1075563 m!994257))

(assert (=> b!1075563 m!994257))

(assert (=> b!1075563 m!994265))

(assert (=> b!1075564 m!994257))

(assert (=> b!1075564 m!994257))

(declare-fun m!994423 () Bool)

(assert (=> b!1075564 m!994423))

(assert (=> b!1075574 m!994411))

(assert (=> b!1075377 d!129613))

(declare-fun condMapEmpty!40768 () Bool)

(declare-fun mapDefault!40768 () ValueCell!12306)

(assert (=> mapNonEmpty!40762 (= condMapEmpty!40768 (= mapRest!40762 ((as const (Array (_ BitVec 32) ValueCell!12306)) mapDefault!40768)))))

(declare-fun e!614720 () Bool)

(declare-fun mapRes!40768 () Bool)

(assert (=> mapNonEmpty!40762 (= tp!78112 (and e!614720 mapRes!40768))))

(declare-fun mapIsEmpty!40768 () Bool)

(assert (=> mapIsEmpty!40768 mapRes!40768))

(declare-fun mapNonEmpty!40768 () Bool)

(declare-fun tp!78122 () Bool)

(declare-fun e!614721 () Bool)

(assert (=> mapNonEmpty!40768 (= mapRes!40768 (and tp!78122 e!614721))))

(declare-fun mapKey!40768 () (_ BitVec 32))

(declare-fun mapValue!40768 () ValueCell!12306)

(declare-fun mapRest!40768 () (Array (_ BitVec 32) ValueCell!12306))

(assert (=> mapNonEmpty!40768 (= mapRest!40762 (store mapRest!40768 mapKey!40768 mapValue!40768))))

(declare-fun b!1075582 () Bool)

(assert (=> b!1075582 (= e!614720 tp_is_empty!26019)))

(declare-fun b!1075581 () Bool)

(assert (=> b!1075581 (= e!614721 tp_is_empty!26019)))

(assert (= (and mapNonEmpty!40762 condMapEmpty!40768) mapIsEmpty!40768))

(assert (= (and mapNonEmpty!40762 (not condMapEmpty!40768)) mapNonEmpty!40768))

(assert (= (and mapNonEmpty!40768 ((_ is ValueCellFull!12306) mapValue!40768)) b!1075581))

(assert (= (and mapNonEmpty!40762 ((_ is ValueCellFull!12306) mapDefault!40768)) b!1075582))

(declare-fun m!994425 () Bool)

(assert (=> mapNonEmpty!40768 m!994425))

(declare-fun b_lambda!16889 () Bool)

(assert (= b_lambda!16883 (or (and start!95130 b_free!22209) b_lambda!16889)))

(declare-fun b_lambda!16891 () Bool)

(assert (= b_lambda!16877 (or (and start!95130 b_free!22209) b_lambda!16891)))

(declare-fun b_lambda!16893 () Bool)

(assert (= b_lambda!16885 (or (and start!95130 b_free!22209) b_lambda!16893)))

(declare-fun b_lambda!16895 () Bool)

(assert (= b_lambda!16879 (or (and start!95130 b_free!22209) b_lambda!16895)))

(declare-fun b_lambda!16897 () Bool)

(assert (= b_lambda!16887 (or (and start!95130 b_free!22209) b_lambda!16897)))

(declare-fun b_lambda!16899 () Bool)

(assert (= b_lambda!16881 (or (and start!95130 b_free!22209) b_lambda!16899)))

(check-sat (not b!1075561) (not bm!45527) (not b!1075552) (not b!1075510) (not b_lambda!16893) (not bm!45535) (not bm!45525) (not b!1075559) (not b_next!22209) (not bm!45517) (not b!1075503) (not b!1075505) (not b!1075414) (not bm!45532) (not bm!45520) (not bm!45501) (not d!129613) (not b!1075423) (not b!1075573) (not b!1075415) (not bm!45522) (not b!1075512) (not b!1075482) (not b!1075574) (not d!129605) (not d!129591) (not b!1075516) (not b_lambda!16895) (not b!1075565) (not d!129603) (not b!1075566) (not b!1075504) tp_is_empty!26019 (not b!1075472) (not b!1075563) (not b_lambda!16891) (not b!1075520) (not b_lambda!16897) (not d!129607) (not bm!45518) (not b!1075572) (not b_lambda!16889) (not b!1075560) (not b!1075474) (not b!1075526) (not b!1075478) (not b!1075554) (not b!1075564) (not b!1075508) (not b!1075551) (not d!129609) (not b!1075506) (not bm!45528) (not bm!45536) (not b!1075571) (not b!1075562) (not b!1075519) (not b_lambda!16899) (not b!1075553) (not b!1075488) b_and!35153 (not mapNonEmpty!40768) (not b!1075470) (not b!1075425) (not bm!45530) (not d!129593) (not b!1075468) (not d!129611) (not b!1075481))
(check-sat b_and!35153 (not b_next!22209))
