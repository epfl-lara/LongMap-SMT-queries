; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95060 () Bool)

(assert start!95060)

(declare-fun b_free!22183 () Bool)

(declare-fun b_next!22183 () Bool)

(assert (=> start!95060 (= b_free!22183 (not b_next!22183))))

(declare-fun tp!78029 () Bool)

(declare-fun b_and!35065 () Bool)

(assert (=> start!95060 (= tp!78029 b_and!35065)))

(declare-fun b!1074551 () Bool)

(declare-fun e!614027 () Bool)

(declare-fun tp_is_empty!25993 () Bool)

(assert (=> b!1074551 (= e!614027 tp_is_empty!25993)))

(declare-fun b!1074552 () Bool)

(declare-fun e!614029 () Bool)

(assert (=> b!1074552 (= e!614029 tp_is_empty!25993)))

(declare-fun b!1074553 () Bool)

(declare-fun e!614030 () Bool)

(declare-fun mapRes!40717 () Bool)

(assert (=> b!1074553 (= e!614030 (and e!614027 mapRes!40717))))

(declare-fun condMapEmpty!40717 () Bool)

(declare-datatypes ((V!39793 0))(
  ( (V!39794 (val!13047 Int)) )
))
(declare-datatypes ((ValueCell!12293 0))(
  ( (ValueCellFull!12293 (v!15668 V!39793)) (EmptyCell!12293) )
))
(declare-datatypes ((array!68884 0))(
  ( (array!68885 (arr!33131 (Array (_ BitVec 32) ValueCell!12293)) (size!33669 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68884)

(declare-fun mapDefault!40717 () ValueCell!12293)

(assert (=> b!1074553 (= condMapEmpty!40717 (= (arr!33131 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12293)) mapDefault!40717)))))

(declare-fun b!1074554 () Bool)

(declare-fun e!614028 () Bool)

(declare-datatypes ((tuple2!16680 0))(
  ( (tuple2!16681 (_1!8351 (_ BitVec 64)) (_2!8351 V!39793)) )
))
(declare-datatypes ((List!23203 0))(
  ( (Nil!23200) (Cons!23199 (h!24408 tuple2!16680) (t!32541 List!23203)) )
))
(declare-datatypes ((ListLongMap!14649 0))(
  ( (ListLongMap!14650 (toList!7340 List!23203)) )
))
(declare-fun lt!476629 () ListLongMap!14649)

(declare-fun lt!476628 () ListLongMap!14649)

(assert (=> b!1074554 (= e!614028 (= lt!476629 lt!476628))))

(declare-fun res!716493 () Bool)

(declare-fun e!614031 () Bool)

(assert (=> start!95060 (=> (not res!716493) (not e!614031))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95060 (= res!716493 (validMask!0 mask!1515))))

(assert (=> start!95060 e!614031))

(assert (=> start!95060 true))

(assert (=> start!95060 tp_is_empty!25993))

(declare-fun array_inv!25632 (array!68884) Bool)

(assert (=> start!95060 (and (array_inv!25632 _values!955) e!614030)))

(assert (=> start!95060 tp!78029))

(declare-datatypes ((array!68886 0))(
  ( (array!68887 (arr!33132 (Array (_ BitVec 32) (_ BitVec 64))) (size!33670 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68886)

(declare-fun array_inv!25633 (array!68886) Bool)

(assert (=> start!95060 (array_inv!25633 _keys!1163)))

(declare-fun mapNonEmpty!40717 () Bool)

(declare-fun tp!78028 () Bool)

(assert (=> mapNonEmpty!40717 (= mapRes!40717 (and tp!78028 e!614029))))

(declare-fun mapKey!40717 () (_ BitVec 32))

(declare-fun mapValue!40717 () ValueCell!12293)

(declare-fun mapRest!40717 () (Array (_ BitVec 32) ValueCell!12293))

(assert (=> mapNonEmpty!40717 (= (arr!33131 _values!955) (store mapRest!40717 mapKey!40717 mapValue!40717))))

(declare-fun b!1074555 () Bool)

(declare-fun res!716491 () Bool)

(assert (=> b!1074555 (=> (not res!716491) (not e!614031))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1074555 (= res!716491 (and (= (size!33669 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33670 _keys!1163) (size!33669 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1074556 () Bool)

(declare-fun res!716492 () Bool)

(assert (=> b!1074556 (=> (not res!716492) (not e!614031))))

(declare-datatypes ((List!23204 0))(
  ( (Nil!23201) (Cons!23200 (h!24409 (_ BitVec 64)) (t!32542 List!23204)) )
))
(declare-fun arrayNoDuplicates!0 (array!68886 (_ BitVec 32) List!23204) Bool)

(assert (=> b!1074556 (= res!716492 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23201))))

(declare-fun mapIsEmpty!40717 () Bool)

(assert (=> mapIsEmpty!40717 mapRes!40717))

(declare-fun b!1074557 () Bool)

(declare-fun e!614032 () Bool)

(assert (=> b!1074557 (= e!614031 (not e!614032))))

(declare-fun res!716495 () Bool)

(assert (=> b!1074557 (=> res!716495 e!614032)))

(assert (=> b!1074557 (= res!716495 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!476632 () ListLongMap!14649)

(assert (=> b!1074557 (= lt!476632 lt!476628)))

(declare-fun zeroValueBefore!47 () V!39793)

(declare-fun minValue!907 () V!39793)

(declare-datatypes ((Unit!35222 0))(
  ( (Unit!35223) )
))
(declare-fun lt!476631 () Unit!35222)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39793)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!891 (array!68886 array!68884 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39793 V!39793 V!39793 V!39793 (_ BitVec 32) Int) Unit!35222)

(assert (=> b!1074557 (= lt!476631 (lemmaNoChangeToArrayThenSameMapNoExtras!891 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3919 (array!68886 array!68884 (_ BitVec 32) (_ BitVec 32) V!39793 V!39793 (_ BitVec 32) Int) ListLongMap!14649)

(assert (=> b!1074557 (= lt!476628 (getCurrentListMapNoExtraKeys!3919 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1074557 (= lt!476632 (getCurrentListMapNoExtraKeys!3919 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074558 () Bool)

(declare-fun res!716494 () Bool)

(assert (=> b!1074558 (=> (not res!716494) (not e!614031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68886 (_ BitVec 32)) Bool)

(assert (=> b!1074558 (= res!716494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1074559 () Bool)

(declare-fun contains!6309 (ListLongMap!14649 (_ BitVec 64)) Bool)

(assert (=> b!1074559 (= e!614032 (not (contains!6309 lt!476632 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1074559 e!614028))

(declare-fun res!716496 () Bool)

(assert (=> b!1074559 (=> (not res!716496) (not e!614028))))

(declare-fun lt!476630 () ListLongMap!14649)

(declare-fun +!3245 (ListLongMap!14649 tuple2!16680) ListLongMap!14649)

(assert (=> b!1074559 (= res!716496 (= lt!476630 (+!3245 lt!476632 (tuple2!16681 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun getCurrentListMap!4112 (array!68886 array!68884 (_ BitVec 32) (_ BitVec 32) V!39793 V!39793 (_ BitVec 32) Int) ListLongMap!14649)

(assert (=> b!1074559 (= lt!476629 (getCurrentListMap!4112 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1074559 (= lt!476630 (getCurrentListMap!4112 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!95060 res!716493) b!1074555))

(assert (= (and b!1074555 res!716491) b!1074558))

(assert (= (and b!1074558 res!716494) b!1074556))

(assert (= (and b!1074556 res!716492) b!1074557))

(assert (= (and b!1074557 (not res!716495)) b!1074559))

(assert (= (and b!1074559 res!716496) b!1074554))

(assert (= (and b!1074553 condMapEmpty!40717) mapIsEmpty!40717))

(assert (= (and b!1074553 (not condMapEmpty!40717)) mapNonEmpty!40717))

(get-info :version)

(assert (= (and mapNonEmpty!40717 ((_ is ValueCellFull!12293) mapValue!40717)) b!1074552))

(assert (= (and b!1074553 ((_ is ValueCellFull!12293) mapDefault!40717)) b!1074551))

(assert (= start!95060 b!1074553))

(declare-fun m!992923 () Bool)

(assert (=> b!1074557 m!992923))

(declare-fun m!992925 () Bool)

(assert (=> b!1074557 m!992925))

(declare-fun m!992927 () Bool)

(assert (=> b!1074557 m!992927))

(declare-fun m!992929 () Bool)

(assert (=> start!95060 m!992929))

(declare-fun m!992931 () Bool)

(assert (=> start!95060 m!992931))

(declare-fun m!992933 () Bool)

(assert (=> start!95060 m!992933))

(declare-fun m!992935 () Bool)

(assert (=> mapNonEmpty!40717 m!992935))

(declare-fun m!992937 () Bool)

(assert (=> b!1074556 m!992937))

(declare-fun m!992939 () Bool)

(assert (=> b!1074558 m!992939))

(declare-fun m!992941 () Bool)

(assert (=> b!1074559 m!992941))

(declare-fun m!992943 () Bool)

(assert (=> b!1074559 m!992943))

(declare-fun m!992945 () Bool)

(assert (=> b!1074559 m!992945))

(declare-fun m!992947 () Bool)

(assert (=> b!1074559 m!992947))

(check-sat (not b!1074556) (not b_next!22183) (not b!1074557) (not b!1074559) (not mapNonEmpty!40717) b_and!35065 (not start!95060) tp_is_empty!25993 (not b!1074558))
(check-sat b_and!35065 (not b_next!22183))
(get-model)

(declare-fun bm!45409 () Bool)

(declare-fun call!45412 () Bool)

(declare-fun c!107911 () Bool)

(assert (=> bm!45409 (= call!45412 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107911 (Cons!23200 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000) Nil!23201) Nil!23201)))))

(declare-fun b!1074624 () Bool)

(declare-fun e!614085 () Bool)

(assert (=> b!1074624 (= e!614085 call!45412)))

(declare-fun b!1074625 () Bool)

(declare-fun e!614083 () Bool)

(assert (=> b!1074625 (= e!614083 e!614085)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1074625 (= c!107911 (validKeyInArray!0 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129381 () Bool)

(declare-fun res!716539 () Bool)

(declare-fun e!614084 () Bool)

(assert (=> d!129381 (=> res!716539 e!614084)))

(assert (=> d!129381 (= res!716539 (bvsge #b00000000000000000000000000000000 (size!33670 _keys!1163)))))

(assert (=> d!129381 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23201) e!614084)))

(declare-fun b!1074626 () Bool)

(assert (=> b!1074626 (= e!614084 e!614083)))

(declare-fun res!716540 () Bool)

(assert (=> b!1074626 (=> (not res!716540) (not e!614083))))

(declare-fun e!614086 () Bool)

(assert (=> b!1074626 (= res!716540 (not e!614086))))

(declare-fun res!716541 () Bool)

(assert (=> b!1074626 (=> (not res!716541) (not e!614086))))

(assert (=> b!1074626 (= res!716541 (validKeyInArray!0 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074627 () Bool)

(declare-fun contains!6311 (List!23204 (_ BitVec 64)) Bool)

(assert (=> b!1074627 (= e!614086 (contains!6311 Nil!23201 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074628 () Bool)

(assert (=> b!1074628 (= e!614085 call!45412)))

(assert (= (and d!129381 (not res!716539)) b!1074626))

(assert (= (and b!1074626 res!716541) b!1074627))

(assert (= (and b!1074626 res!716540) b!1074625))

(assert (= (and b!1074625 c!107911) b!1074624))

(assert (= (and b!1074625 (not c!107911)) b!1074628))

(assert (= (or b!1074624 b!1074628) bm!45409))

(declare-fun m!993001 () Bool)

(assert (=> bm!45409 m!993001))

(declare-fun m!993003 () Bool)

(assert (=> bm!45409 m!993003))

(assert (=> b!1074625 m!993001))

(assert (=> b!1074625 m!993001))

(declare-fun m!993005 () Bool)

(assert (=> b!1074625 m!993005))

(assert (=> b!1074626 m!993001))

(assert (=> b!1074626 m!993001))

(assert (=> b!1074626 m!993005))

(assert (=> b!1074627 m!993001))

(assert (=> b!1074627 m!993001))

(declare-fun m!993007 () Bool)

(assert (=> b!1074627 m!993007))

(assert (=> b!1074556 d!129381))

(declare-fun d!129383 () Bool)

(assert (=> d!129383 (= (getCurrentListMapNoExtraKeys!3919 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3919 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476665 () Unit!35222)

(declare-fun choose!1759 (array!68886 array!68884 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39793 V!39793 V!39793 V!39793 (_ BitVec 32) Int) Unit!35222)

(assert (=> d!129383 (= lt!476665 (choose!1759 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129383 (validMask!0 mask!1515)))

(assert (=> d!129383 (= (lemmaNoChangeToArrayThenSameMapNoExtras!891 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476665)))

(declare-fun bs!31640 () Bool)

(assert (= bs!31640 d!129383))

(assert (=> bs!31640 m!992927))

(assert (=> bs!31640 m!992925))

(declare-fun m!993009 () Bool)

(assert (=> bs!31640 m!993009))

(assert (=> bs!31640 m!992929))

(assert (=> b!1074557 d!129383))

(declare-fun b!1074653 () Bool)

(assert (=> b!1074653 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33670 _keys!1163)))))

(assert (=> b!1074653 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33669 _values!955)))))

(declare-fun e!614105 () Bool)

(declare-fun lt!476680 () ListLongMap!14649)

(declare-fun apply!930 (ListLongMap!14649 (_ BitVec 64)) V!39793)

(declare-fun get!17222 (ValueCell!12293 V!39793) V!39793)

(declare-fun dynLambda!2029 (Int (_ BitVec 64)) V!39793)

(assert (=> b!1074653 (= e!614105 (= (apply!930 lt!476680 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000)) (get!17222 (select (arr!33131 _values!955) #b00000000000000000000000000000000) (dynLambda!2029 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun call!45415 () ListLongMap!14649)

(declare-fun bm!45412 () Bool)

(assert (=> bm!45412 (= call!45415 (getCurrentListMapNoExtraKeys!3919 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1074654 () Bool)

(declare-fun e!614102 () ListLongMap!14649)

(assert (=> b!1074654 (= e!614102 (ListLongMap!14650 Nil!23200))))

(declare-fun b!1074655 () Bool)

(declare-fun e!614104 () Bool)

(assert (=> b!1074655 (= e!614104 (validKeyInArray!0 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074655 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1074656 () Bool)

(declare-fun e!614101 () Bool)

(declare-fun isEmpty!960 (ListLongMap!14649) Bool)

(assert (=> b!1074656 (= e!614101 (isEmpty!960 lt!476680))))

(declare-fun b!1074657 () Bool)

(declare-fun e!614106 () Bool)

(assert (=> b!1074657 (= e!614106 e!614101)))

(declare-fun c!107922 () Bool)

(assert (=> b!1074657 (= c!107922 (bvslt #b00000000000000000000000000000000 (size!33670 _keys!1163)))))

(declare-fun b!1074658 () Bool)

(declare-fun e!614103 () Bool)

(assert (=> b!1074658 (= e!614103 e!614106)))

(declare-fun c!107921 () Bool)

(assert (=> b!1074658 (= c!107921 e!614104)))

(declare-fun res!716553 () Bool)

(assert (=> b!1074658 (=> (not res!716553) (not e!614104))))

(assert (=> b!1074658 (= res!716553 (bvslt #b00000000000000000000000000000000 (size!33670 _keys!1163)))))

(declare-fun b!1074660 () Bool)

(assert (=> b!1074660 (= e!614101 (= lt!476680 (getCurrentListMapNoExtraKeys!3919 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1074661 () Bool)

(assert (=> b!1074661 (= e!614106 e!614105)))

(assert (=> b!1074661 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33670 _keys!1163)))))

(declare-fun res!716552 () Bool)

(assert (=> b!1074661 (= res!716552 (contains!6309 lt!476680 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074661 (=> (not res!716552) (not e!614105))))

(declare-fun b!1074662 () Bool)

(declare-fun e!614107 () ListLongMap!14649)

(assert (=> b!1074662 (= e!614107 call!45415)))

(declare-fun b!1074663 () Bool)

(declare-fun lt!476685 () Unit!35222)

(declare-fun lt!476682 () Unit!35222)

(assert (=> b!1074663 (= lt!476685 lt!476682)))

(declare-fun lt!476686 () V!39793)

(declare-fun lt!476681 () (_ BitVec 64))

(declare-fun lt!476683 () (_ BitVec 64))

(declare-fun lt!476684 () ListLongMap!14649)

(assert (=> b!1074663 (not (contains!6309 (+!3245 lt!476684 (tuple2!16681 lt!476683 lt!476686)) lt!476681))))

(declare-fun addStillNotContains!266 (ListLongMap!14649 (_ BitVec 64) V!39793 (_ BitVec 64)) Unit!35222)

(assert (=> b!1074663 (= lt!476682 (addStillNotContains!266 lt!476684 lt!476683 lt!476686 lt!476681))))

(assert (=> b!1074663 (= lt!476681 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1074663 (= lt!476686 (get!17222 (select (arr!33131 _values!955) #b00000000000000000000000000000000) (dynLambda!2029 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1074663 (= lt!476683 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074663 (= lt!476684 call!45415)))

(assert (=> b!1074663 (= e!614107 (+!3245 call!45415 (tuple2!16681 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000) (get!17222 (select (arr!33131 _values!955) #b00000000000000000000000000000000) (dynLambda!2029 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1074664 () Bool)

(declare-fun res!716550 () Bool)

(assert (=> b!1074664 (=> (not res!716550) (not e!614103))))

(assert (=> b!1074664 (= res!716550 (not (contains!6309 lt!476680 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!129385 () Bool)

(assert (=> d!129385 e!614103))

(declare-fun res!716551 () Bool)

(assert (=> d!129385 (=> (not res!716551) (not e!614103))))

(assert (=> d!129385 (= res!716551 (not (contains!6309 lt!476680 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129385 (= lt!476680 e!614102)))

(declare-fun c!107920 () Bool)

(assert (=> d!129385 (= c!107920 (bvsge #b00000000000000000000000000000000 (size!33670 _keys!1163)))))

(assert (=> d!129385 (validMask!0 mask!1515)))

(assert (=> d!129385 (= (getCurrentListMapNoExtraKeys!3919 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476680)))

(declare-fun b!1074659 () Bool)

(assert (=> b!1074659 (= e!614102 e!614107)))

(declare-fun c!107923 () Bool)

(assert (=> b!1074659 (= c!107923 (validKeyInArray!0 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129385 c!107920) b!1074654))

(assert (= (and d!129385 (not c!107920)) b!1074659))

(assert (= (and b!1074659 c!107923) b!1074663))

(assert (= (and b!1074659 (not c!107923)) b!1074662))

(assert (= (or b!1074663 b!1074662) bm!45412))

(assert (= (and d!129385 res!716551) b!1074664))

(assert (= (and b!1074664 res!716550) b!1074658))

(assert (= (and b!1074658 res!716553) b!1074655))

(assert (= (and b!1074658 c!107921) b!1074661))

(assert (= (and b!1074658 (not c!107921)) b!1074657))

(assert (= (and b!1074661 res!716552) b!1074653))

(assert (= (and b!1074657 c!107922) b!1074660))

(assert (= (and b!1074657 (not c!107922)) b!1074656))

(declare-fun b_lambda!16811 () Bool)

(assert (=> (not b_lambda!16811) (not b!1074653)))

(declare-fun t!32547 () Bool)

(declare-fun tb!7161 () Bool)

(assert (=> (and start!95060 (= defaultEntry!963 defaultEntry!963) t!32547) tb!7161))

(declare-fun result!14807 () Bool)

(assert (=> tb!7161 (= result!14807 tp_is_empty!25993)))

(assert (=> b!1074653 t!32547))

(declare-fun b_and!35071 () Bool)

(assert (= b_and!35065 (and (=> t!32547 result!14807) b_and!35071)))

(declare-fun b_lambda!16813 () Bool)

(assert (=> (not b_lambda!16813) (not b!1074663)))

(assert (=> b!1074663 t!32547))

(declare-fun b_and!35073 () Bool)

(assert (= b_and!35071 (and (=> t!32547 result!14807) b_and!35073)))

(declare-fun m!993011 () Bool)

(assert (=> d!129385 m!993011))

(assert (=> d!129385 m!992929))

(assert (=> b!1074659 m!993001))

(assert (=> b!1074659 m!993001))

(assert (=> b!1074659 m!993005))

(assert (=> b!1074661 m!993001))

(assert (=> b!1074661 m!993001))

(declare-fun m!993013 () Bool)

(assert (=> b!1074661 m!993013))

(assert (=> b!1074655 m!993001))

(assert (=> b!1074655 m!993001))

(assert (=> b!1074655 m!993005))

(declare-fun m!993015 () Bool)

(assert (=> b!1074660 m!993015))

(declare-fun m!993017 () Bool)

(assert (=> b!1074653 m!993017))

(declare-fun m!993019 () Bool)

(assert (=> b!1074653 m!993019))

(assert (=> b!1074653 m!993001))

(declare-fun m!993021 () Bool)

(assert (=> b!1074653 m!993021))

(assert (=> b!1074653 m!993017))

(assert (=> b!1074653 m!993019))

(declare-fun m!993023 () Bool)

(assert (=> b!1074653 m!993023))

(assert (=> b!1074653 m!993001))

(declare-fun m!993025 () Bool)

(assert (=> b!1074656 m!993025))

(declare-fun m!993027 () Bool)

(assert (=> b!1074663 m!993027))

(declare-fun m!993029 () Bool)

(assert (=> b!1074663 m!993029))

(declare-fun m!993031 () Bool)

(assert (=> b!1074663 m!993031))

(assert (=> b!1074663 m!993017))

(assert (=> b!1074663 m!993019))

(assert (=> b!1074663 m!993017))

(assert (=> b!1074663 m!993019))

(assert (=> b!1074663 m!993023))

(assert (=> b!1074663 m!993027))

(assert (=> b!1074663 m!993001))

(declare-fun m!993033 () Bool)

(assert (=> b!1074663 m!993033))

(declare-fun m!993035 () Bool)

(assert (=> b!1074664 m!993035))

(assert (=> bm!45412 m!993015))

(assert (=> b!1074557 d!129385))

(declare-fun b!1074667 () Bool)

(assert (=> b!1074667 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33670 _keys!1163)))))

(assert (=> b!1074667 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33669 _values!955)))))

(declare-fun lt!476687 () ListLongMap!14649)

(declare-fun e!614112 () Bool)

(assert (=> b!1074667 (= e!614112 (= (apply!930 lt!476687 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000)) (get!17222 (select (arr!33131 _values!955) #b00000000000000000000000000000000) (dynLambda!2029 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!45413 () Bool)

(declare-fun call!45416 () ListLongMap!14649)

(assert (=> bm!45413 (= call!45416 (getCurrentListMapNoExtraKeys!3919 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1074668 () Bool)

(declare-fun e!614109 () ListLongMap!14649)

(assert (=> b!1074668 (= e!614109 (ListLongMap!14650 Nil!23200))))

(declare-fun b!1074669 () Bool)

(declare-fun e!614111 () Bool)

(assert (=> b!1074669 (= e!614111 (validKeyInArray!0 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074669 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1074670 () Bool)

(declare-fun e!614108 () Bool)

(assert (=> b!1074670 (= e!614108 (isEmpty!960 lt!476687))))

(declare-fun b!1074671 () Bool)

(declare-fun e!614113 () Bool)

(assert (=> b!1074671 (= e!614113 e!614108)))

(declare-fun c!107926 () Bool)

(assert (=> b!1074671 (= c!107926 (bvslt #b00000000000000000000000000000000 (size!33670 _keys!1163)))))

(declare-fun b!1074672 () Bool)

(declare-fun e!614110 () Bool)

(assert (=> b!1074672 (= e!614110 e!614113)))

(declare-fun c!107925 () Bool)

(assert (=> b!1074672 (= c!107925 e!614111)))

(declare-fun res!716557 () Bool)

(assert (=> b!1074672 (=> (not res!716557) (not e!614111))))

(assert (=> b!1074672 (= res!716557 (bvslt #b00000000000000000000000000000000 (size!33670 _keys!1163)))))

(declare-fun b!1074674 () Bool)

(assert (=> b!1074674 (= e!614108 (= lt!476687 (getCurrentListMapNoExtraKeys!3919 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1074675 () Bool)

(assert (=> b!1074675 (= e!614113 e!614112)))

(assert (=> b!1074675 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33670 _keys!1163)))))

(declare-fun res!716556 () Bool)

(assert (=> b!1074675 (= res!716556 (contains!6309 lt!476687 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074675 (=> (not res!716556) (not e!614112))))

(declare-fun b!1074676 () Bool)

(declare-fun e!614114 () ListLongMap!14649)

(assert (=> b!1074676 (= e!614114 call!45416)))

(declare-fun b!1074677 () Bool)

(declare-fun lt!476692 () Unit!35222)

(declare-fun lt!476689 () Unit!35222)

(assert (=> b!1074677 (= lt!476692 lt!476689)))

(declare-fun lt!476688 () (_ BitVec 64))

(declare-fun lt!476691 () ListLongMap!14649)

(declare-fun lt!476693 () V!39793)

(declare-fun lt!476690 () (_ BitVec 64))

(assert (=> b!1074677 (not (contains!6309 (+!3245 lt!476691 (tuple2!16681 lt!476690 lt!476693)) lt!476688))))

(assert (=> b!1074677 (= lt!476689 (addStillNotContains!266 lt!476691 lt!476690 lt!476693 lt!476688))))

(assert (=> b!1074677 (= lt!476688 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1074677 (= lt!476693 (get!17222 (select (arr!33131 _values!955) #b00000000000000000000000000000000) (dynLambda!2029 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1074677 (= lt!476690 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074677 (= lt!476691 call!45416)))

(assert (=> b!1074677 (= e!614114 (+!3245 call!45416 (tuple2!16681 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000) (get!17222 (select (arr!33131 _values!955) #b00000000000000000000000000000000) (dynLambda!2029 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1074678 () Bool)

(declare-fun res!716554 () Bool)

(assert (=> b!1074678 (=> (not res!716554) (not e!614110))))

(assert (=> b!1074678 (= res!716554 (not (contains!6309 lt!476687 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!129387 () Bool)

(assert (=> d!129387 e!614110))

(declare-fun res!716555 () Bool)

(assert (=> d!129387 (=> (not res!716555) (not e!614110))))

(assert (=> d!129387 (= res!716555 (not (contains!6309 lt!476687 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129387 (= lt!476687 e!614109)))

(declare-fun c!107924 () Bool)

(assert (=> d!129387 (= c!107924 (bvsge #b00000000000000000000000000000000 (size!33670 _keys!1163)))))

(assert (=> d!129387 (validMask!0 mask!1515)))

(assert (=> d!129387 (= (getCurrentListMapNoExtraKeys!3919 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476687)))

(declare-fun b!1074673 () Bool)

(assert (=> b!1074673 (= e!614109 e!614114)))

(declare-fun c!107927 () Bool)

(assert (=> b!1074673 (= c!107927 (validKeyInArray!0 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129387 c!107924) b!1074668))

(assert (= (and d!129387 (not c!107924)) b!1074673))

(assert (= (and b!1074673 c!107927) b!1074677))

(assert (= (and b!1074673 (not c!107927)) b!1074676))

(assert (= (or b!1074677 b!1074676) bm!45413))

(assert (= (and d!129387 res!716555) b!1074678))

(assert (= (and b!1074678 res!716554) b!1074672))

(assert (= (and b!1074672 res!716557) b!1074669))

(assert (= (and b!1074672 c!107925) b!1074675))

(assert (= (and b!1074672 (not c!107925)) b!1074671))

(assert (= (and b!1074675 res!716556) b!1074667))

(assert (= (and b!1074671 c!107926) b!1074674))

(assert (= (and b!1074671 (not c!107926)) b!1074670))

(declare-fun b_lambda!16815 () Bool)

(assert (=> (not b_lambda!16815) (not b!1074667)))

(assert (=> b!1074667 t!32547))

(declare-fun b_and!35075 () Bool)

(assert (= b_and!35073 (and (=> t!32547 result!14807) b_and!35075)))

(declare-fun b_lambda!16817 () Bool)

(assert (=> (not b_lambda!16817) (not b!1074677)))

(assert (=> b!1074677 t!32547))

(declare-fun b_and!35077 () Bool)

(assert (= b_and!35075 (and (=> t!32547 result!14807) b_and!35077)))

(declare-fun m!993037 () Bool)

(assert (=> d!129387 m!993037))

(assert (=> d!129387 m!992929))

(assert (=> b!1074673 m!993001))

(assert (=> b!1074673 m!993001))

(assert (=> b!1074673 m!993005))

(assert (=> b!1074675 m!993001))

(assert (=> b!1074675 m!993001))

(declare-fun m!993039 () Bool)

(assert (=> b!1074675 m!993039))

(assert (=> b!1074669 m!993001))

(assert (=> b!1074669 m!993001))

(assert (=> b!1074669 m!993005))

(declare-fun m!993041 () Bool)

(assert (=> b!1074674 m!993041))

(assert (=> b!1074667 m!993017))

(assert (=> b!1074667 m!993019))

(assert (=> b!1074667 m!993001))

(declare-fun m!993043 () Bool)

(assert (=> b!1074667 m!993043))

(assert (=> b!1074667 m!993017))

(assert (=> b!1074667 m!993019))

(assert (=> b!1074667 m!993023))

(assert (=> b!1074667 m!993001))

(declare-fun m!993045 () Bool)

(assert (=> b!1074670 m!993045))

(declare-fun m!993047 () Bool)

(assert (=> b!1074677 m!993047))

(declare-fun m!993049 () Bool)

(assert (=> b!1074677 m!993049))

(declare-fun m!993051 () Bool)

(assert (=> b!1074677 m!993051))

(assert (=> b!1074677 m!993017))

(assert (=> b!1074677 m!993019))

(assert (=> b!1074677 m!993017))

(assert (=> b!1074677 m!993019))

(assert (=> b!1074677 m!993023))

(assert (=> b!1074677 m!993047))

(assert (=> b!1074677 m!993001))

(declare-fun m!993053 () Bool)

(assert (=> b!1074677 m!993053))

(declare-fun m!993055 () Bool)

(assert (=> b!1074678 m!993055))

(assert (=> bm!45413 m!993041))

(assert (=> b!1074557 d!129387))

(declare-fun d!129389 () Bool)

(assert (=> d!129389 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95060 d!129389))

(declare-fun d!129391 () Bool)

(assert (=> d!129391 (= (array_inv!25632 _values!955) (bvsge (size!33669 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95060 d!129391))

(declare-fun d!129393 () Bool)

(assert (=> d!129393 (= (array_inv!25633 _keys!1163) (bvsge (size!33670 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95060 d!129393))

(declare-fun b!1074687 () Bool)

(declare-fun e!614121 () Bool)

(declare-fun call!45419 () Bool)

(assert (=> b!1074687 (= e!614121 call!45419)))

(declare-fun d!129395 () Bool)

(declare-fun res!716563 () Bool)

(declare-fun e!614122 () Bool)

(assert (=> d!129395 (=> res!716563 e!614122)))

(assert (=> d!129395 (= res!716563 (bvsge #b00000000000000000000000000000000 (size!33670 _keys!1163)))))

(assert (=> d!129395 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!614122)))

(declare-fun b!1074688 () Bool)

(declare-fun e!614123 () Bool)

(assert (=> b!1074688 (= e!614123 e!614121)))

(declare-fun lt!476702 () (_ BitVec 64))

(assert (=> b!1074688 (= lt!476702 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476701 () Unit!35222)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68886 (_ BitVec 64) (_ BitVec 32)) Unit!35222)

(assert (=> b!1074688 (= lt!476701 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!476702 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68886 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1074688 (arrayContainsKey!0 _keys!1163 lt!476702 #b00000000000000000000000000000000)))

(declare-fun lt!476700 () Unit!35222)

(assert (=> b!1074688 (= lt!476700 lt!476701)))

(declare-fun res!716562 () Bool)

(declare-datatypes ((SeekEntryResult!9889 0))(
  ( (MissingZero!9889 (index!41927 (_ BitVec 32))) (Found!9889 (index!41928 (_ BitVec 32))) (Intermediate!9889 (undefined!10701 Bool) (index!41929 (_ BitVec 32)) (x!96322 (_ BitVec 32))) (Undefined!9889) (MissingVacant!9889 (index!41930 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68886 (_ BitVec 32)) SeekEntryResult!9889)

(assert (=> b!1074688 (= res!716562 (= (seekEntryOrOpen!0 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9889 #b00000000000000000000000000000000)))))

(assert (=> b!1074688 (=> (not res!716562) (not e!614121))))

(declare-fun b!1074689 () Bool)

(assert (=> b!1074689 (= e!614123 call!45419)))

(declare-fun b!1074690 () Bool)

(assert (=> b!1074690 (= e!614122 e!614123)))

(declare-fun c!107930 () Bool)

(assert (=> b!1074690 (= c!107930 (validKeyInArray!0 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45416 () Bool)

(assert (=> bm!45416 (= call!45419 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(assert (= (and d!129395 (not res!716563)) b!1074690))

(assert (= (and b!1074690 c!107930) b!1074688))

(assert (= (and b!1074690 (not c!107930)) b!1074689))

(assert (= (and b!1074688 res!716562) b!1074687))

(assert (= (or b!1074687 b!1074689) bm!45416))

(assert (=> b!1074688 m!993001))

(declare-fun m!993057 () Bool)

(assert (=> b!1074688 m!993057))

(declare-fun m!993059 () Bool)

(assert (=> b!1074688 m!993059))

(assert (=> b!1074688 m!993001))

(declare-fun m!993061 () Bool)

(assert (=> b!1074688 m!993061))

(assert (=> b!1074690 m!993001))

(assert (=> b!1074690 m!993001))

(assert (=> b!1074690 m!993005))

(declare-fun m!993063 () Bool)

(assert (=> bm!45416 m!993063))

(assert (=> b!1074558 d!129395))

(declare-fun d!129397 () Bool)

(declare-fun e!614129 () Bool)

(assert (=> d!129397 e!614129))

(declare-fun res!716566 () Bool)

(assert (=> d!129397 (=> res!716566 e!614129)))

(declare-fun lt!476711 () Bool)

(assert (=> d!129397 (= res!716566 (not lt!476711))))

(declare-fun lt!476712 () Bool)

(assert (=> d!129397 (= lt!476711 lt!476712)))

(declare-fun lt!476714 () Unit!35222)

(declare-fun e!614128 () Unit!35222)

(assert (=> d!129397 (= lt!476714 e!614128)))

(declare-fun c!107933 () Bool)

(assert (=> d!129397 (= c!107933 lt!476712)))

(declare-fun containsKey!578 (List!23203 (_ BitVec 64)) Bool)

(assert (=> d!129397 (= lt!476712 (containsKey!578 (toList!7340 lt!476632) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129397 (= (contains!6309 lt!476632 #b0000000000000000000000000000000000000000000000000000000000000000) lt!476711)))

(declare-fun b!1074697 () Bool)

(declare-fun lt!476713 () Unit!35222)

(assert (=> b!1074697 (= e!614128 lt!476713)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!410 (List!23203 (_ BitVec 64)) Unit!35222)

(assert (=> b!1074697 (= lt!476713 (lemmaContainsKeyImpliesGetValueByKeyDefined!410 (toList!7340 lt!476632) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!662 0))(
  ( (Some!661 (v!15671 V!39793)) (None!660) )
))
(declare-fun isDefined!453 (Option!662) Bool)

(declare-fun getValueByKey!611 (List!23203 (_ BitVec 64)) Option!662)

(assert (=> b!1074697 (isDefined!453 (getValueByKey!611 (toList!7340 lt!476632) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1074698 () Bool)

(declare-fun Unit!35228 () Unit!35222)

(assert (=> b!1074698 (= e!614128 Unit!35228)))

(declare-fun b!1074699 () Bool)

(assert (=> b!1074699 (= e!614129 (isDefined!453 (getValueByKey!611 (toList!7340 lt!476632) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129397 c!107933) b!1074697))

(assert (= (and d!129397 (not c!107933)) b!1074698))

(assert (= (and d!129397 (not res!716566)) b!1074699))

(declare-fun m!993065 () Bool)

(assert (=> d!129397 m!993065))

(declare-fun m!993067 () Bool)

(assert (=> b!1074697 m!993067))

(declare-fun m!993069 () Bool)

(assert (=> b!1074697 m!993069))

(assert (=> b!1074697 m!993069))

(declare-fun m!993071 () Bool)

(assert (=> b!1074697 m!993071))

(assert (=> b!1074699 m!993069))

(assert (=> b!1074699 m!993069))

(assert (=> b!1074699 m!993071))

(assert (=> b!1074559 d!129397))

(declare-fun d!129399 () Bool)

(declare-fun e!614132 () Bool)

(assert (=> d!129399 e!614132))

(declare-fun res!716571 () Bool)

(assert (=> d!129399 (=> (not res!716571) (not e!614132))))

(declare-fun lt!476723 () ListLongMap!14649)

(assert (=> d!129399 (= res!716571 (contains!6309 lt!476723 (_1!8351 (tuple2!16681 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!476726 () List!23203)

(assert (=> d!129399 (= lt!476723 (ListLongMap!14650 lt!476726))))

(declare-fun lt!476725 () Unit!35222)

(declare-fun lt!476724 () Unit!35222)

(assert (=> d!129399 (= lt!476725 lt!476724)))

(assert (=> d!129399 (= (getValueByKey!611 lt!476726 (_1!8351 (tuple2!16681 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!661 (_2!8351 (tuple2!16681 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lemmaContainsTupThenGetReturnValue!289 (List!23203 (_ BitVec 64) V!39793) Unit!35222)

(assert (=> d!129399 (= lt!476724 (lemmaContainsTupThenGetReturnValue!289 lt!476726 (_1!8351 (tuple2!16681 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8351 (tuple2!16681 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun insertStrictlySorted!382 (List!23203 (_ BitVec 64) V!39793) List!23203)

(assert (=> d!129399 (= lt!476726 (insertStrictlySorted!382 (toList!7340 lt!476632) (_1!8351 (tuple2!16681 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8351 (tuple2!16681 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!129399 (= (+!3245 lt!476632 (tuple2!16681 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!476723)))

(declare-fun b!1074704 () Bool)

(declare-fun res!716572 () Bool)

(assert (=> b!1074704 (=> (not res!716572) (not e!614132))))

(assert (=> b!1074704 (= res!716572 (= (getValueByKey!611 (toList!7340 lt!476723) (_1!8351 (tuple2!16681 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!661 (_2!8351 (tuple2!16681 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))))

(declare-fun b!1074705 () Bool)

(declare-fun contains!6312 (List!23203 tuple2!16680) Bool)

(assert (=> b!1074705 (= e!614132 (contains!6312 (toList!7340 lt!476723) (tuple2!16681 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(assert (= (and d!129399 res!716571) b!1074704))

(assert (= (and b!1074704 res!716572) b!1074705))

(declare-fun m!993073 () Bool)

(assert (=> d!129399 m!993073))

(declare-fun m!993075 () Bool)

(assert (=> d!129399 m!993075))

(declare-fun m!993077 () Bool)

(assert (=> d!129399 m!993077))

(declare-fun m!993079 () Bool)

(assert (=> d!129399 m!993079))

(declare-fun m!993081 () Bool)

(assert (=> b!1074704 m!993081))

(declare-fun m!993083 () Bool)

(assert (=> b!1074705 m!993083))

(assert (=> b!1074559 d!129399))

(declare-fun b!1074748 () Bool)

(declare-fun e!614159 () ListLongMap!14649)

(declare-fun call!45440 () ListLongMap!14649)

(assert (=> b!1074748 (= e!614159 (+!3245 call!45440 (tuple2!16681 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun d!129401 () Bool)

(declare-fun e!614164 () Bool)

(assert (=> d!129401 e!614164))

(declare-fun res!716591 () Bool)

(assert (=> d!129401 (=> (not res!716591) (not e!614164))))

(assert (=> d!129401 (= res!716591 (or (bvsge #b00000000000000000000000000000000 (size!33670 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33670 _keys!1163)))))))

(declare-fun lt!476779 () ListLongMap!14649)

(declare-fun lt!476775 () ListLongMap!14649)

(assert (=> d!129401 (= lt!476779 lt!476775)))

(declare-fun lt!476789 () Unit!35222)

(declare-fun e!614166 () Unit!35222)

(assert (=> d!129401 (= lt!476789 e!614166)))

(declare-fun c!107947 () Bool)

(declare-fun e!614171 () Bool)

(assert (=> d!129401 (= c!107947 e!614171)))

(declare-fun res!716596 () Bool)

(assert (=> d!129401 (=> (not res!716596) (not e!614171))))

(assert (=> d!129401 (= res!716596 (bvslt #b00000000000000000000000000000000 (size!33670 _keys!1163)))))

(assert (=> d!129401 (= lt!476775 e!614159)))

(declare-fun c!107950 () Bool)

(assert (=> d!129401 (= c!107950 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129401 (validMask!0 mask!1515)))

(assert (=> d!129401 (= (getCurrentListMap!4112 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476779)))

(declare-fun b!1074749 () Bool)

(declare-fun res!716595 () Bool)

(assert (=> b!1074749 (=> (not res!716595) (not e!614164))))

(declare-fun e!614165 () Bool)

(assert (=> b!1074749 (= res!716595 e!614165)))

(declare-fun c!107946 () Bool)

(assert (=> b!1074749 (= c!107946 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45431 () Bool)

(declare-fun call!45436 () ListLongMap!14649)

(assert (=> bm!45431 (= call!45436 call!45440)))

(declare-fun b!1074750 () Bool)

(declare-fun e!614167 () Bool)

(assert (=> b!1074750 (= e!614165 e!614167)))

(declare-fun res!716594 () Bool)

(declare-fun call!45434 () Bool)

(assert (=> b!1074750 (= res!716594 call!45434)))

(assert (=> b!1074750 (=> (not res!716594) (not e!614167))))

(declare-fun b!1074751 () Bool)

(assert (=> b!1074751 (= e!614167 (= (apply!930 lt!476779 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun b!1074752 () Bool)

(declare-fun e!614163 () Bool)

(assert (=> b!1074752 (= e!614164 e!614163)))

(declare-fun c!107951 () Bool)

(assert (=> b!1074752 (= c!107951 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1074753 () Bool)

(declare-fun e!614170 () Bool)

(assert (=> b!1074753 (= e!614170 (validKeyInArray!0 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074754 () Bool)

(declare-fun e!614161 () Bool)

(assert (=> b!1074754 (= e!614161 (= (apply!930 lt!476779 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1074755 () Bool)

(declare-fun e!614168 () ListLongMap!14649)

(assert (=> b!1074755 (= e!614168 call!45436)))

(declare-fun b!1074756 () Bool)

(declare-fun lt!476774 () Unit!35222)

(assert (=> b!1074756 (= e!614166 lt!476774)))

(declare-fun lt!476776 () ListLongMap!14649)

(assert (=> b!1074756 (= lt!476776 (getCurrentListMapNoExtraKeys!3919 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476787 () (_ BitVec 64))

(assert (=> b!1074756 (= lt!476787 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476780 () (_ BitVec 64))

(assert (=> b!1074756 (= lt!476780 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476773 () Unit!35222)

(declare-fun addStillContains!643 (ListLongMap!14649 (_ BitVec 64) V!39793 (_ BitVec 64)) Unit!35222)

(assert (=> b!1074756 (= lt!476773 (addStillContains!643 lt!476776 lt!476787 zeroValueAfter!47 lt!476780))))

(assert (=> b!1074756 (contains!6309 (+!3245 lt!476776 (tuple2!16681 lt!476787 zeroValueAfter!47)) lt!476780)))

(declare-fun lt!476782 () Unit!35222)

(assert (=> b!1074756 (= lt!476782 lt!476773)))

(declare-fun lt!476777 () ListLongMap!14649)

(assert (=> b!1074756 (= lt!476777 (getCurrentListMapNoExtraKeys!3919 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476792 () (_ BitVec 64))

(assert (=> b!1074756 (= lt!476792 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476790 () (_ BitVec 64))

(assert (=> b!1074756 (= lt!476790 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476781 () Unit!35222)

(declare-fun addApplyDifferent!499 (ListLongMap!14649 (_ BitVec 64) V!39793 (_ BitVec 64)) Unit!35222)

(assert (=> b!1074756 (= lt!476781 (addApplyDifferent!499 lt!476777 lt!476792 minValue!907 lt!476790))))

(assert (=> b!1074756 (= (apply!930 (+!3245 lt!476777 (tuple2!16681 lt!476792 minValue!907)) lt!476790) (apply!930 lt!476777 lt!476790))))

(declare-fun lt!476778 () Unit!35222)

(assert (=> b!1074756 (= lt!476778 lt!476781)))

(declare-fun lt!476783 () ListLongMap!14649)

(assert (=> b!1074756 (= lt!476783 (getCurrentListMapNoExtraKeys!3919 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476784 () (_ BitVec 64))

(assert (=> b!1074756 (= lt!476784 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476772 () (_ BitVec 64))

(assert (=> b!1074756 (= lt!476772 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476788 () Unit!35222)

(assert (=> b!1074756 (= lt!476788 (addApplyDifferent!499 lt!476783 lt!476784 zeroValueAfter!47 lt!476772))))

(assert (=> b!1074756 (= (apply!930 (+!3245 lt!476783 (tuple2!16681 lt!476784 zeroValueAfter!47)) lt!476772) (apply!930 lt!476783 lt!476772))))

(declare-fun lt!476771 () Unit!35222)

(assert (=> b!1074756 (= lt!476771 lt!476788)))

(declare-fun lt!476791 () ListLongMap!14649)

(assert (=> b!1074756 (= lt!476791 (getCurrentListMapNoExtraKeys!3919 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476785 () (_ BitVec 64))

(assert (=> b!1074756 (= lt!476785 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476786 () (_ BitVec 64))

(assert (=> b!1074756 (= lt!476786 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074756 (= lt!476774 (addApplyDifferent!499 lt!476791 lt!476785 minValue!907 lt!476786))))

(assert (=> b!1074756 (= (apply!930 (+!3245 lt!476791 (tuple2!16681 lt!476785 minValue!907)) lt!476786) (apply!930 lt!476791 lt!476786))))

(declare-fun bm!45432 () Bool)

(declare-fun call!45438 () ListLongMap!14649)

(declare-fun call!45435 () ListLongMap!14649)

(assert (=> bm!45432 (= call!45438 call!45435)))

(declare-fun b!1074757 () Bool)

(assert (=> b!1074757 (= e!614163 e!614161)))

(declare-fun res!716597 () Bool)

(declare-fun call!45439 () Bool)

(assert (=> b!1074757 (= res!716597 call!45439)))

(assert (=> b!1074757 (=> (not res!716597) (not e!614161))))

(declare-fun bm!45433 () Bool)

(declare-fun call!45437 () ListLongMap!14649)

(declare-fun c!107949 () Bool)

(assert (=> bm!45433 (= call!45440 (+!3245 (ite c!107950 call!45437 (ite c!107949 call!45435 call!45438)) (ite (or c!107950 c!107949) (tuple2!16681 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16681 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun bm!45434 () Bool)

(assert (=> bm!45434 (= call!45434 (contains!6309 lt!476779 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1074758 () Bool)

(declare-fun Unit!35229 () Unit!35222)

(assert (=> b!1074758 (= e!614166 Unit!35229)))

(declare-fun b!1074759 () Bool)

(assert (=> b!1074759 (= e!614171 (validKeyInArray!0 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074760 () Bool)

(assert (=> b!1074760 (= e!614163 (not call!45439))))

(declare-fun b!1074761 () Bool)

(declare-fun e!614169 () Bool)

(declare-fun e!614162 () Bool)

(assert (=> b!1074761 (= e!614169 e!614162)))

(declare-fun res!716593 () Bool)

(assert (=> b!1074761 (=> (not res!716593) (not e!614162))))

(assert (=> b!1074761 (= res!716593 (contains!6309 lt!476779 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074761 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33670 _keys!1163)))))

(declare-fun b!1074762 () Bool)

(assert (=> b!1074762 (= e!614165 (not call!45434))))

(declare-fun bm!45435 () Bool)

(assert (=> bm!45435 (= call!45439 (contains!6309 lt!476779 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1074763 () Bool)

(declare-fun res!716599 () Bool)

(assert (=> b!1074763 (=> (not res!716599) (not e!614164))))

(assert (=> b!1074763 (= res!716599 e!614169)))

(declare-fun res!716598 () Bool)

(assert (=> b!1074763 (=> res!716598 e!614169)))

(assert (=> b!1074763 (= res!716598 (not e!614170))))

(declare-fun res!716592 () Bool)

(assert (=> b!1074763 (=> (not res!716592) (not e!614170))))

(assert (=> b!1074763 (= res!716592 (bvslt #b00000000000000000000000000000000 (size!33670 _keys!1163)))))

(declare-fun bm!45436 () Bool)

(assert (=> bm!45436 (= call!45435 call!45437)))

(declare-fun b!1074764 () Bool)

(assert (=> b!1074764 (= e!614159 e!614168)))

(assert (=> b!1074764 (= c!107949 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1074765 () Bool)

(assert (=> b!1074765 (= e!614162 (= (apply!930 lt!476779 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000)) (get!17222 (select (arr!33131 _values!955) #b00000000000000000000000000000000) (dynLambda!2029 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1074765 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33669 _values!955)))))

(assert (=> b!1074765 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33670 _keys!1163)))))

(declare-fun bm!45437 () Bool)

(assert (=> bm!45437 (= call!45437 (getCurrentListMapNoExtraKeys!3919 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074766 () Bool)

(declare-fun e!614160 () ListLongMap!14649)

(assert (=> b!1074766 (= e!614160 call!45438)))

(declare-fun b!1074767 () Bool)

(declare-fun c!107948 () Bool)

(assert (=> b!1074767 (= c!107948 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1074767 (= e!614168 e!614160)))

(declare-fun b!1074768 () Bool)

(assert (=> b!1074768 (= e!614160 call!45436)))

(assert (= (and d!129401 c!107950) b!1074748))

(assert (= (and d!129401 (not c!107950)) b!1074764))

(assert (= (and b!1074764 c!107949) b!1074755))

(assert (= (and b!1074764 (not c!107949)) b!1074767))

(assert (= (and b!1074767 c!107948) b!1074768))

(assert (= (and b!1074767 (not c!107948)) b!1074766))

(assert (= (or b!1074768 b!1074766) bm!45432))

(assert (= (or b!1074755 bm!45432) bm!45436))

(assert (= (or b!1074755 b!1074768) bm!45431))

(assert (= (or b!1074748 bm!45436) bm!45437))

(assert (= (or b!1074748 bm!45431) bm!45433))

(assert (= (and d!129401 res!716596) b!1074759))

(assert (= (and d!129401 c!107947) b!1074756))

(assert (= (and d!129401 (not c!107947)) b!1074758))

(assert (= (and d!129401 res!716591) b!1074763))

(assert (= (and b!1074763 res!716592) b!1074753))

(assert (= (and b!1074763 (not res!716598)) b!1074761))

(assert (= (and b!1074761 res!716593) b!1074765))

(assert (= (and b!1074763 res!716599) b!1074749))

(assert (= (and b!1074749 c!107946) b!1074750))

(assert (= (and b!1074749 (not c!107946)) b!1074762))

(assert (= (and b!1074750 res!716594) b!1074751))

(assert (= (or b!1074750 b!1074762) bm!45434))

(assert (= (and b!1074749 res!716595) b!1074752))

(assert (= (and b!1074752 c!107951) b!1074757))

(assert (= (and b!1074752 (not c!107951)) b!1074760))

(assert (= (and b!1074757 res!716597) b!1074754))

(assert (= (or b!1074757 b!1074760) bm!45435))

(declare-fun b_lambda!16819 () Bool)

(assert (=> (not b_lambda!16819) (not b!1074765)))

(assert (=> b!1074765 t!32547))

(declare-fun b_and!35079 () Bool)

(assert (= b_and!35077 (and (=> t!32547 result!14807) b_and!35079)))

(assert (=> b!1074761 m!993001))

(assert (=> b!1074761 m!993001))

(declare-fun m!993085 () Bool)

(assert (=> b!1074761 m!993085))

(declare-fun m!993087 () Bool)

(assert (=> b!1074756 m!993087))

(declare-fun m!993089 () Bool)

(assert (=> b!1074756 m!993089))

(declare-fun m!993091 () Bool)

(assert (=> b!1074756 m!993091))

(declare-fun m!993093 () Bool)

(assert (=> b!1074756 m!993093))

(declare-fun m!993095 () Bool)

(assert (=> b!1074756 m!993095))

(declare-fun m!993097 () Bool)

(assert (=> b!1074756 m!993097))

(declare-fun m!993099 () Bool)

(assert (=> b!1074756 m!993099))

(declare-fun m!993101 () Bool)

(assert (=> b!1074756 m!993101))

(declare-fun m!993103 () Bool)

(assert (=> b!1074756 m!993103))

(declare-fun m!993105 () Bool)

(assert (=> b!1074756 m!993105))

(declare-fun m!993107 () Bool)

(assert (=> b!1074756 m!993107))

(declare-fun m!993109 () Bool)

(assert (=> b!1074756 m!993109))

(assert (=> b!1074756 m!992925))

(assert (=> b!1074756 m!993001))

(assert (=> b!1074756 m!993093))

(declare-fun m!993111 () Bool)

(assert (=> b!1074756 m!993111))

(assert (=> b!1074756 m!993107))

(declare-fun m!993113 () Bool)

(assert (=> b!1074756 m!993113))

(declare-fun m!993115 () Bool)

(assert (=> b!1074756 m!993115))

(assert (=> b!1074756 m!993087))

(assert (=> b!1074756 m!993103))

(declare-fun m!993117 () Bool)

(assert (=> bm!45434 m!993117))

(declare-fun m!993119 () Bool)

(assert (=> b!1074748 m!993119))

(assert (=> d!129401 m!992929))

(assert (=> b!1074753 m!993001))

(assert (=> b!1074753 m!993001))

(assert (=> b!1074753 m!993005))

(declare-fun m!993121 () Bool)

(assert (=> b!1074751 m!993121))

(assert (=> b!1074759 m!993001))

(assert (=> b!1074759 m!993001))

(assert (=> b!1074759 m!993005))

(declare-fun m!993123 () Bool)

(assert (=> bm!45433 m!993123))

(declare-fun m!993125 () Bool)

(assert (=> bm!45435 m!993125))

(declare-fun m!993127 () Bool)

(assert (=> b!1074754 m!993127))

(assert (=> bm!45437 m!992925))

(assert (=> b!1074765 m!993001))

(assert (=> b!1074765 m!993019))

(assert (=> b!1074765 m!993017))

(assert (=> b!1074765 m!993019))

(assert (=> b!1074765 m!993023))

(assert (=> b!1074765 m!993017))

(assert (=> b!1074765 m!993001))

(declare-fun m!993129 () Bool)

(assert (=> b!1074765 m!993129))

(assert (=> b!1074559 d!129401))

(declare-fun b!1074769 () Bool)

(declare-fun e!614172 () ListLongMap!14649)

(declare-fun call!45447 () ListLongMap!14649)

(assert (=> b!1074769 (= e!614172 (+!3245 call!45447 (tuple2!16681 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun d!129403 () Bool)

(declare-fun e!614177 () Bool)

(assert (=> d!129403 e!614177))

(declare-fun res!716600 () Bool)

(assert (=> d!129403 (=> (not res!716600) (not e!614177))))

(assert (=> d!129403 (= res!716600 (or (bvsge #b00000000000000000000000000000000 (size!33670 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33670 _keys!1163)))))))

(declare-fun lt!476801 () ListLongMap!14649)

(declare-fun lt!476797 () ListLongMap!14649)

(assert (=> d!129403 (= lt!476801 lt!476797)))

(declare-fun lt!476811 () Unit!35222)

(declare-fun e!614179 () Unit!35222)

(assert (=> d!129403 (= lt!476811 e!614179)))

(declare-fun c!107953 () Bool)

(declare-fun e!614184 () Bool)

(assert (=> d!129403 (= c!107953 e!614184)))

(declare-fun res!716605 () Bool)

(assert (=> d!129403 (=> (not res!716605) (not e!614184))))

(assert (=> d!129403 (= res!716605 (bvslt #b00000000000000000000000000000000 (size!33670 _keys!1163)))))

(assert (=> d!129403 (= lt!476797 e!614172)))

(declare-fun c!107956 () Bool)

(assert (=> d!129403 (= c!107956 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129403 (validMask!0 mask!1515)))

(assert (=> d!129403 (= (getCurrentListMap!4112 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476801)))

(declare-fun b!1074770 () Bool)

(declare-fun res!716604 () Bool)

(assert (=> b!1074770 (=> (not res!716604) (not e!614177))))

(declare-fun e!614178 () Bool)

(assert (=> b!1074770 (= res!716604 e!614178)))

(declare-fun c!107952 () Bool)

(assert (=> b!1074770 (= c!107952 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45438 () Bool)

(declare-fun call!45443 () ListLongMap!14649)

(assert (=> bm!45438 (= call!45443 call!45447)))

(declare-fun b!1074771 () Bool)

(declare-fun e!614180 () Bool)

(assert (=> b!1074771 (= e!614178 e!614180)))

(declare-fun res!716603 () Bool)

(declare-fun call!45441 () Bool)

(assert (=> b!1074771 (= res!716603 call!45441)))

(assert (=> b!1074771 (=> (not res!716603) (not e!614180))))

(declare-fun b!1074772 () Bool)

(assert (=> b!1074772 (= e!614180 (= (apply!930 lt!476801 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1074773 () Bool)

(declare-fun e!614176 () Bool)

(assert (=> b!1074773 (= e!614177 e!614176)))

(declare-fun c!107957 () Bool)

(assert (=> b!1074773 (= c!107957 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1074774 () Bool)

(declare-fun e!614183 () Bool)

(assert (=> b!1074774 (= e!614183 (validKeyInArray!0 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074775 () Bool)

(declare-fun e!614174 () Bool)

(assert (=> b!1074775 (= e!614174 (= (apply!930 lt!476801 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1074776 () Bool)

(declare-fun e!614181 () ListLongMap!14649)

(assert (=> b!1074776 (= e!614181 call!45443)))

(declare-fun b!1074777 () Bool)

(declare-fun lt!476796 () Unit!35222)

(assert (=> b!1074777 (= e!614179 lt!476796)))

(declare-fun lt!476798 () ListLongMap!14649)

(assert (=> b!1074777 (= lt!476798 (getCurrentListMapNoExtraKeys!3919 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476809 () (_ BitVec 64))

(assert (=> b!1074777 (= lt!476809 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476802 () (_ BitVec 64))

(assert (=> b!1074777 (= lt!476802 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476795 () Unit!35222)

(assert (=> b!1074777 (= lt!476795 (addStillContains!643 lt!476798 lt!476809 zeroValueBefore!47 lt!476802))))

(assert (=> b!1074777 (contains!6309 (+!3245 lt!476798 (tuple2!16681 lt!476809 zeroValueBefore!47)) lt!476802)))

(declare-fun lt!476804 () Unit!35222)

(assert (=> b!1074777 (= lt!476804 lt!476795)))

(declare-fun lt!476799 () ListLongMap!14649)

(assert (=> b!1074777 (= lt!476799 (getCurrentListMapNoExtraKeys!3919 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476814 () (_ BitVec 64))

(assert (=> b!1074777 (= lt!476814 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476812 () (_ BitVec 64))

(assert (=> b!1074777 (= lt!476812 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476803 () Unit!35222)

(assert (=> b!1074777 (= lt!476803 (addApplyDifferent!499 lt!476799 lt!476814 minValue!907 lt!476812))))

(assert (=> b!1074777 (= (apply!930 (+!3245 lt!476799 (tuple2!16681 lt!476814 minValue!907)) lt!476812) (apply!930 lt!476799 lt!476812))))

(declare-fun lt!476800 () Unit!35222)

(assert (=> b!1074777 (= lt!476800 lt!476803)))

(declare-fun lt!476805 () ListLongMap!14649)

(assert (=> b!1074777 (= lt!476805 (getCurrentListMapNoExtraKeys!3919 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476806 () (_ BitVec 64))

(assert (=> b!1074777 (= lt!476806 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476794 () (_ BitVec 64))

(assert (=> b!1074777 (= lt!476794 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476810 () Unit!35222)

(assert (=> b!1074777 (= lt!476810 (addApplyDifferent!499 lt!476805 lt!476806 zeroValueBefore!47 lt!476794))))

(assert (=> b!1074777 (= (apply!930 (+!3245 lt!476805 (tuple2!16681 lt!476806 zeroValueBefore!47)) lt!476794) (apply!930 lt!476805 lt!476794))))

(declare-fun lt!476793 () Unit!35222)

(assert (=> b!1074777 (= lt!476793 lt!476810)))

(declare-fun lt!476813 () ListLongMap!14649)

(assert (=> b!1074777 (= lt!476813 (getCurrentListMapNoExtraKeys!3919 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476807 () (_ BitVec 64))

(assert (=> b!1074777 (= lt!476807 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476808 () (_ BitVec 64))

(assert (=> b!1074777 (= lt!476808 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074777 (= lt!476796 (addApplyDifferent!499 lt!476813 lt!476807 minValue!907 lt!476808))))

(assert (=> b!1074777 (= (apply!930 (+!3245 lt!476813 (tuple2!16681 lt!476807 minValue!907)) lt!476808) (apply!930 lt!476813 lt!476808))))

(declare-fun bm!45439 () Bool)

(declare-fun call!45445 () ListLongMap!14649)

(declare-fun call!45442 () ListLongMap!14649)

(assert (=> bm!45439 (= call!45445 call!45442)))

(declare-fun b!1074778 () Bool)

(assert (=> b!1074778 (= e!614176 e!614174)))

(declare-fun res!716606 () Bool)

(declare-fun call!45446 () Bool)

(assert (=> b!1074778 (= res!716606 call!45446)))

(assert (=> b!1074778 (=> (not res!716606) (not e!614174))))

(declare-fun bm!45440 () Bool)

(declare-fun call!45444 () ListLongMap!14649)

(declare-fun c!107955 () Bool)

(assert (=> bm!45440 (= call!45447 (+!3245 (ite c!107956 call!45444 (ite c!107955 call!45442 call!45445)) (ite (or c!107956 c!107955) (tuple2!16681 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16681 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun bm!45441 () Bool)

(assert (=> bm!45441 (= call!45441 (contains!6309 lt!476801 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1074779 () Bool)

(declare-fun Unit!35230 () Unit!35222)

(assert (=> b!1074779 (= e!614179 Unit!35230)))

(declare-fun b!1074780 () Bool)

(assert (=> b!1074780 (= e!614184 (validKeyInArray!0 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074781 () Bool)

(assert (=> b!1074781 (= e!614176 (not call!45446))))

(declare-fun b!1074782 () Bool)

(declare-fun e!614182 () Bool)

(declare-fun e!614175 () Bool)

(assert (=> b!1074782 (= e!614182 e!614175)))

(declare-fun res!716602 () Bool)

(assert (=> b!1074782 (=> (not res!716602) (not e!614175))))

(assert (=> b!1074782 (= res!716602 (contains!6309 lt!476801 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074782 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33670 _keys!1163)))))

(declare-fun b!1074783 () Bool)

(assert (=> b!1074783 (= e!614178 (not call!45441))))

(declare-fun bm!45442 () Bool)

(assert (=> bm!45442 (= call!45446 (contains!6309 lt!476801 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1074784 () Bool)

(declare-fun res!716608 () Bool)

(assert (=> b!1074784 (=> (not res!716608) (not e!614177))))

(assert (=> b!1074784 (= res!716608 e!614182)))

(declare-fun res!716607 () Bool)

(assert (=> b!1074784 (=> res!716607 e!614182)))

(assert (=> b!1074784 (= res!716607 (not e!614183))))

(declare-fun res!716601 () Bool)

(assert (=> b!1074784 (=> (not res!716601) (not e!614183))))

(assert (=> b!1074784 (= res!716601 (bvslt #b00000000000000000000000000000000 (size!33670 _keys!1163)))))

(declare-fun bm!45443 () Bool)

(assert (=> bm!45443 (= call!45442 call!45444)))

(declare-fun b!1074785 () Bool)

(assert (=> b!1074785 (= e!614172 e!614181)))

(assert (=> b!1074785 (= c!107955 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1074786 () Bool)

(assert (=> b!1074786 (= e!614175 (= (apply!930 lt!476801 (select (arr!33132 _keys!1163) #b00000000000000000000000000000000)) (get!17222 (select (arr!33131 _values!955) #b00000000000000000000000000000000) (dynLambda!2029 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1074786 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33669 _values!955)))))

(assert (=> b!1074786 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33670 _keys!1163)))))

(declare-fun bm!45444 () Bool)

(assert (=> bm!45444 (= call!45444 (getCurrentListMapNoExtraKeys!3919 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074787 () Bool)

(declare-fun e!614173 () ListLongMap!14649)

(assert (=> b!1074787 (= e!614173 call!45445)))

(declare-fun b!1074788 () Bool)

(declare-fun c!107954 () Bool)

(assert (=> b!1074788 (= c!107954 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1074788 (= e!614181 e!614173)))

(declare-fun b!1074789 () Bool)

(assert (=> b!1074789 (= e!614173 call!45443)))

(assert (= (and d!129403 c!107956) b!1074769))

(assert (= (and d!129403 (not c!107956)) b!1074785))

(assert (= (and b!1074785 c!107955) b!1074776))

(assert (= (and b!1074785 (not c!107955)) b!1074788))

(assert (= (and b!1074788 c!107954) b!1074789))

(assert (= (and b!1074788 (not c!107954)) b!1074787))

(assert (= (or b!1074789 b!1074787) bm!45439))

(assert (= (or b!1074776 bm!45439) bm!45443))

(assert (= (or b!1074776 b!1074789) bm!45438))

(assert (= (or b!1074769 bm!45443) bm!45444))

(assert (= (or b!1074769 bm!45438) bm!45440))

(assert (= (and d!129403 res!716605) b!1074780))

(assert (= (and d!129403 c!107953) b!1074777))

(assert (= (and d!129403 (not c!107953)) b!1074779))

(assert (= (and d!129403 res!716600) b!1074784))

(assert (= (and b!1074784 res!716601) b!1074774))

(assert (= (and b!1074784 (not res!716607)) b!1074782))

(assert (= (and b!1074782 res!716602) b!1074786))

(assert (= (and b!1074784 res!716608) b!1074770))

(assert (= (and b!1074770 c!107952) b!1074771))

(assert (= (and b!1074770 (not c!107952)) b!1074783))

(assert (= (and b!1074771 res!716603) b!1074772))

(assert (= (or b!1074771 b!1074783) bm!45441))

(assert (= (and b!1074770 res!716604) b!1074773))

(assert (= (and b!1074773 c!107957) b!1074778))

(assert (= (and b!1074773 (not c!107957)) b!1074781))

(assert (= (and b!1074778 res!716606) b!1074775))

(assert (= (or b!1074778 b!1074781) bm!45442))

(declare-fun b_lambda!16821 () Bool)

(assert (=> (not b_lambda!16821) (not b!1074786)))

(assert (=> b!1074786 t!32547))

(declare-fun b_and!35081 () Bool)

(assert (= b_and!35079 (and (=> t!32547 result!14807) b_and!35081)))

(assert (=> b!1074782 m!993001))

(assert (=> b!1074782 m!993001))

(declare-fun m!993131 () Bool)

(assert (=> b!1074782 m!993131))

(declare-fun m!993133 () Bool)

(assert (=> b!1074777 m!993133))

(declare-fun m!993135 () Bool)

(assert (=> b!1074777 m!993135))

(declare-fun m!993137 () Bool)

(assert (=> b!1074777 m!993137))

(declare-fun m!993139 () Bool)

(assert (=> b!1074777 m!993139))

(declare-fun m!993141 () Bool)

(assert (=> b!1074777 m!993141))

(declare-fun m!993143 () Bool)

(assert (=> b!1074777 m!993143))

(declare-fun m!993145 () Bool)

(assert (=> b!1074777 m!993145))

(declare-fun m!993147 () Bool)

(assert (=> b!1074777 m!993147))

(declare-fun m!993149 () Bool)

(assert (=> b!1074777 m!993149))

(declare-fun m!993151 () Bool)

(assert (=> b!1074777 m!993151))

(declare-fun m!993153 () Bool)

(assert (=> b!1074777 m!993153))

(declare-fun m!993155 () Bool)

(assert (=> b!1074777 m!993155))

(assert (=> b!1074777 m!992927))

(assert (=> b!1074777 m!993001))

(assert (=> b!1074777 m!993139))

(declare-fun m!993157 () Bool)

(assert (=> b!1074777 m!993157))

(assert (=> b!1074777 m!993153))

(declare-fun m!993159 () Bool)

(assert (=> b!1074777 m!993159))

(declare-fun m!993161 () Bool)

(assert (=> b!1074777 m!993161))

(assert (=> b!1074777 m!993133))

(assert (=> b!1074777 m!993149))

(declare-fun m!993163 () Bool)

(assert (=> bm!45441 m!993163))

(declare-fun m!993165 () Bool)

(assert (=> b!1074769 m!993165))

(assert (=> d!129403 m!992929))

(assert (=> b!1074774 m!993001))

(assert (=> b!1074774 m!993001))

(assert (=> b!1074774 m!993005))

(declare-fun m!993167 () Bool)

(assert (=> b!1074772 m!993167))

(assert (=> b!1074780 m!993001))

(assert (=> b!1074780 m!993001))

(assert (=> b!1074780 m!993005))

(declare-fun m!993169 () Bool)

(assert (=> bm!45440 m!993169))

(declare-fun m!993171 () Bool)

(assert (=> bm!45442 m!993171))

(declare-fun m!993173 () Bool)

(assert (=> b!1074775 m!993173))

(assert (=> bm!45444 m!992927))

(assert (=> b!1074786 m!993001))

(assert (=> b!1074786 m!993019))

(assert (=> b!1074786 m!993017))

(assert (=> b!1074786 m!993019))

(assert (=> b!1074786 m!993023))

(assert (=> b!1074786 m!993017))

(assert (=> b!1074786 m!993001))

(declare-fun m!993175 () Bool)

(assert (=> b!1074786 m!993175))

(assert (=> b!1074559 d!129403))

(declare-fun b!1074797 () Bool)

(declare-fun e!614189 () Bool)

(assert (=> b!1074797 (= e!614189 tp_is_empty!25993)))

(declare-fun mapNonEmpty!40726 () Bool)

(declare-fun mapRes!40726 () Bool)

(declare-fun tp!78044 () Bool)

(declare-fun e!614190 () Bool)

(assert (=> mapNonEmpty!40726 (= mapRes!40726 (and tp!78044 e!614190))))

(declare-fun mapValue!40726 () ValueCell!12293)

(declare-fun mapKey!40726 () (_ BitVec 32))

(declare-fun mapRest!40726 () (Array (_ BitVec 32) ValueCell!12293))

(assert (=> mapNonEmpty!40726 (= mapRest!40717 (store mapRest!40726 mapKey!40726 mapValue!40726))))

(declare-fun condMapEmpty!40726 () Bool)

(declare-fun mapDefault!40726 () ValueCell!12293)

(assert (=> mapNonEmpty!40717 (= condMapEmpty!40726 (= mapRest!40717 ((as const (Array (_ BitVec 32) ValueCell!12293)) mapDefault!40726)))))

(assert (=> mapNonEmpty!40717 (= tp!78028 (and e!614189 mapRes!40726))))

(declare-fun b!1074796 () Bool)

(assert (=> b!1074796 (= e!614190 tp_is_empty!25993)))

(declare-fun mapIsEmpty!40726 () Bool)

(assert (=> mapIsEmpty!40726 mapRes!40726))

(assert (= (and mapNonEmpty!40717 condMapEmpty!40726) mapIsEmpty!40726))

(assert (= (and mapNonEmpty!40717 (not condMapEmpty!40726)) mapNonEmpty!40726))

(assert (= (and mapNonEmpty!40726 ((_ is ValueCellFull!12293) mapValue!40726)) b!1074796))

(assert (= (and mapNonEmpty!40717 ((_ is ValueCellFull!12293) mapDefault!40726)) b!1074797))

(declare-fun m!993177 () Bool)

(assert (=> mapNonEmpty!40726 m!993177))

(declare-fun b_lambda!16823 () Bool)

(assert (= b_lambda!16815 (or (and start!95060 b_free!22183) b_lambda!16823)))

(declare-fun b_lambda!16825 () Bool)

(assert (= b_lambda!16821 (or (and start!95060 b_free!22183) b_lambda!16825)))

(declare-fun b_lambda!16827 () Bool)

(assert (= b_lambda!16817 (or (and start!95060 b_free!22183) b_lambda!16827)))

(declare-fun b_lambda!16829 () Bool)

(assert (= b_lambda!16813 (or (and start!95060 b_free!22183) b_lambda!16829)))

(declare-fun b_lambda!16831 () Bool)

(assert (= b_lambda!16811 (or (and start!95060 b_free!22183) b_lambda!16831)))

(declare-fun b_lambda!16833 () Bool)

(assert (= b_lambda!16819 (or (and start!95060 b_free!22183) b_lambda!16833)))

(check-sat (not d!129387) (not b!1074625) (not b!1074627) (not bm!45413) (not b!1074659) (not b!1074699) (not b!1074688) (not bm!45434) (not bm!45412) (not b!1074772) (not bm!45441) (not d!129403) (not b_lambda!16831) (not b_next!22183) (not b!1074777) (not b_lambda!16833) (not b!1074704) (not b!1074775) tp_is_empty!25993 (not bm!45440) (not d!129385) b_and!35081 (not bm!45437) (not b!1074673) (not b!1074660) (not b!1074782) (not bm!45444) (not b!1074748) (not b!1074667) (not b!1074675) (not d!129383) (not bm!45409) (not b!1074653) (not b_lambda!16825) (not b!1074780) (not b!1074664) (not b!1074626) (not d!129397) (not b_lambda!16827) (not b_lambda!16823) (not d!129399) (not b!1074751) (not b!1074754) (not b!1074670) (not b!1074756) (not b!1074655) (not b!1074769) (not b!1074786) (not b!1074765) (not b_lambda!16829) (not b!1074690) (not b!1074663) (not b!1074697) (not d!129401) (not b!1074761) (not b!1074669) (not b!1074774) (not b!1074656) (not b!1074674) (not mapNonEmpty!40726) (not b!1074678) (not bm!45433) (not b!1074753) (not b!1074661) (not bm!45442) (not b!1074759) (not bm!45416) (not bm!45435) (not b!1074705) (not b!1074677))
(check-sat b_and!35081 (not b_next!22183))
