; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95158 () Bool)

(assert start!95158)

(declare-fun b_free!22215 () Bool)

(declare-fun b_next!22215 () Bool)

(assert (=> start!95158 (= b_free!22215 (not b_next!22215))))

(declare-fun tp!78133 () Bool)

(declare-fun b_and!35157 () Bool)

(assert (=> start!95158 (= tp!78133 b_and!35157)))

(declare-fun b!1075623 () Bool)

(declare-fun res!717026 () Bool)

(declare-fun e!614756 () Bool)

(assert (=> b!1075623 (=> (not res!717026) (not e!614756))))

(declare-datatypes ((array!69019 0))(
  ( (array!69020 (arr!33195 (Array (_ BitVec 32) (_ BitVec 64))) (size!33731 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69019)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69019 (_ BitVec 32)) Bool)

(assert (=> b!1075623 (= res!717026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1075624 () Bool)

(declare-fun res!717024 () Bool)

(assert (=> b!1075624 (=> (not res!717024) (not e!614756))))

(declare-datatypes ((V!39835 0))(
  ( (V!39836 (val!13063 Int)) )
))
(declare-datatypes ((ValueCell!12309 0))(
  ( (ValueCellFull!12309 (v!15688 V!39835)) (EmptyCell!12309) )
))
(declare-datatypes ((array!69021 0))(
  ( (array!69022 (arr!33196 (Array (_ BitVec 32) ValueCell!12309)) (size!33732 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69021)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1075624 (= res!717024 (and (= (size!33732 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33731 _keys!1163) (size!33732 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1075625 () Bool)

(declare-fun e!614755 () Bool)

(declare-fun tp_is_empty!26025 () Bool)

(assert (=> b!1075625 (= e!614755 tp_is_empty!26025)))

(declare-fun res!717023 () Bool)

(assert (=> start!95158 (=> (not res!717023) (not e!614756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95158 (= res!717023 (validMask!0 mask!1515))))

(assert (=> start!95158 e!614756))

(assert (=> start!95158 true))

(assert (=> start!95158 tp_is_empty!26025))

(declare-fun e!614754 () Bool)

(declare-fun array_inv!25650 (array!69021) Bool)

(assert (=> start!95158 (and (array_inv!25650 _values!955) e!614754)))

(assert (=> start!95158 tp!78133))

(declare-fun array_inv!25651 (array!69019) Bool)

(assert (=> start!95158 (array_inv!25651 _keys!1163)))

(declare-fun zeroValueBefore!47 () V!39835)

(declare-datatypes ((tuple2!16642 0))(
  ( (tuple2!16643 (_1!8332 (_ BitVec 64)) (_2!8332 V!39835)) )
))
(declare-datatypes ((List!23177 0))(
  ( (Nil!23174) (Cons!23173 (h!24382 tuple2!16642) (t!32530 List!23177)) )
))
(declare-datatypes ((ListLongMap!14611 0))(
  ( (ListLongMap!14612 (toList!7321 List!23177)) )
))
(declare-fun lt!477518 () ListLongMap!14611)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39835)

(declare-fun b!1075626 () Bool)

(declare-fun e!614752 () Bool)

(declare-fun getCurrentListMap!4190 (array!69019 array!69021 (_ BitVec 32) (_ BitVec 32) V!39835 V!39835 (_ BitVec 32) Int) ListLongMap!14611)

(declare-fun +!3227 (ListLongMap!14611 tuple2!16642) ListLongMap!14611)

(assert (=> b!1075626 (= e!614752 (= (getCurrentListMap!4190 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (+!3227 (+!3227 lt!477518 (tuple2!16643 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (tuple2!16643 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun zeroValueAfter!47 () V!39835)

(declare-fun lt!477515 () ListLongMap!14611)

(assert (=> b!1075626 (= lt!477515 (getCurrentListMap!4190 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40774 () Bool)

(declare-fun mapRes!40774 () Bool)

(assert (=> mapIsEmpty!40774 mapRes!40774))

(declare-fun b!1075627 () Bool)

(assert (=> b!1075627 (= e!614754 (and e!614755 mapRes!40774))))

(declare-fun condMapEmpty!40774 () Bool)

(declare-fun mapDefault!40774 () ValueCell!12309)

(assert (=> b!1075627 (= condMapEmpty!40774 (= (arr!33196 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12309)) mapDefault!40774)))))

(declare-fun b!1075628 () Bool)

(declare-fun res!717025 () Bool)

(assert (=> b!1075628 (=> (not res!717025) (not e!614756))))

(declare-datatypes ((List!23178 0))(
  ( (Nil!23175) (Cons!23174 (h!24383 (_ BitVec 64)) (t!32531 List!23178)) )
))
(declare-fun arrayNoDuplicates!0 (array!69019 (_ BitVec 32) List!23178) Bool)

(assert (=> b!1075628 (= res!717025 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23175))))

(declare-fun mapNonEmpty!40774 () Bool)

(declare-fun tp!78134 () Bool)

(declare-fun e!614753 () Bool)

(assert (=> mapNonEmpty!40774 (= mapRes!40774 (and tp!78134 e!614753))))

(declare-fun mapValue!40774 () ValueCell!12309)

(declare-fun mapRest!40774 () (Array (_ BitVec 32) ValueCell!12309))

(declare-fun mapKey!40774 () (_ BitVec 32))

(assert (=> mapNonEmpty!40774 (= (arr!33196 _values!955) (store mapRest!40774 mapKey!40774 mapValue!40774))))

(declare-fun b!1075629 () Bool)

(assert (=> b!1075629 (= e!614753 tp_is_empty!26025)))

(declare-fun b!1075630 () Bool)

(assert (=> b!1075630 (= e!614756 (not e!614752))))

(declare-fun res!717027 () Bool)

(assert (=> b!1075630 (=> res!717027 e!614752)))

(assert (=> b!1075630 (= res!717027 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!477517 () ListLongMap!14611)

(assert (=> b!1075630 (= lt!477518 lt!477517)))

(declare-datatypes ((Unit!35413 0))(
  ( (Unit!35414) )
))
(declare-fun lt!477516 () Unit!35413)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!899 (array!69019 array!69021 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39835 V!39835 V!39835 V!39835 (_ BitVec 32) Int) Unit!35413)

(assert (=> b!1075630 (= lt!477516 (lemmaNoChangeToArrayThenSameMapNoExtras!899 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3883 (array!69019 array!69021 (_ BitVec 32) (_ BitVec 32) V!39835 V!39835 (_ BitVec 32) Int) ListLongMap!14611)

(assert (=> b!1075630 (= lt!477517 (getCurrentListMapNoExtraKeys!3883 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1075630 (= lt!477518 (getCurrentListMapNoExtraKeys!3883 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!95158 res!717023) b!1075624))

(assert (= (and b!1075624 res!717024) b!1075623))

(assert (= (and b!1075623 res!717026) b!1075628))

(assert (= (and b!1075628 res!717025) b!1075630))

(assert (= (and b!1075630 (not res!717027)) b!1075626))

(assert (= (and b!1075627 condMapEmpty!40774) mapIsEmpty!40774))

(assert (= (and b!1075627 (not condMapEmpty!40774)) mapNonEmpty!40774))

(get-info :version)

(assert (= (and mapNonEmpty!40774 ((_ is ValueCellFull!12309) mapValue!40774)) b!1075629))

(assert (= (and b!1075627 ((_ is ValueCellFull!12309) mapDefault!40774)) b!1075625))

(assert (= start!95158 b!1075627))

(declare-fun m!994453 () Bool)

(assert (=> mapNonEmpty!40774 m!994453))

(declare-fun m!994455 () Bool)

(assert (=> start!95158 m!994455))

(declare-fun m!994457 () Bool)

(assert (=> start!95158 m!994457))

(declare-fun m!994459 () Bool)

(assert (=> start!95158 m!994459))

(declare-fun m!994461 () Bool)

(assert (=> b!1075630 m!994461))

(declare-fun m!994463 () Bool)

(assert (=> b!1075630 m!994463))

(declare-fun m!994465 () Bool)

(assert (=> b!1075630 m!994465))

(declare-fun m!994467 () Bool)

(assert (=> b!1075626 m!994467))

(declare-fun m!994469 () Bool)

(assert (=> b!1075626 m!994469))

(assert (=> b!1075626 m!994469))

(declare-fun m!994471 () Bool)

(assert (=> b!1075626 m!994471))

(declare-fun m!994473 () Bool)

(assert (=> b!1075626 m!994473))

(declare-fun m!994475 () Bool)

(assert (=> b!1075628 m!994475))

(declare-fun m!994477 () Bool)

(assert (=> b!1075623 m!994477))

(check-sat (not b_next!22215) (not start!95158) (not b!1075628) (not b!1075626) b_and!35157 (not b!1075630) tp_is_empty!26025 (not mapNonEmpty!40774) (not b!1075623))
(check-sat b_and!35157 (not b_next!22215))
(get-model)

(declare-fun b!1075665 () Bool)

(declare-fun e!614785 () Bool)

(declare-fun contains!6350 (List!23178 (_ BitVec 64)) Bool)

(assert (=> b!1075665 (= e!614785 (contains!6350 Nil!23175 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075666 () Bool)

(declare-fun e!614786 () Bool)

(declare-fun e!614787 () Bool)

(assert (=> b!1075666 (= e!614786 e!614787)))

(declare-fun c!108091 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1075666 (= c!108091 (validKeyInArray!0 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129617 () Bool)

(declare-fun res!717051 () Bool)

(declare-fun e!614784 () Bool)

(assert (=> d!129617 (=> res!717051 e!614784)))

(assert (=> d!129617 (= res!717051 (bvsge #b00000000000000000000000000000000 (size!33731 _keys!1163)))))

(assert (=> d!129617 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23175) e!614784)))

(declare-fun b!1075667 () Bool)

(declare-fun call!45542 () Bool)

(assert (=> b!1075667 (= e!614787 call!45542)))

(declare-fun bm!45539 () Bool)

(assert (=> bm!45539 (= call!45542 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108091 (Cons!23174 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000) Nil!23175) Nil!23175)))))

(declare-fun b!1075668 () Bool)

(assert (=> b!1075668 (= e!614787 call!45542)))

(declare-fun b!1075669 () Bool)

(assert (=> b!1075669 (= e!614784 e!614786)))

(declare-fun res!717050 () Bool)

(assert (=> b!1075669 (=> (not res!717050) (not e!614786))))

(assert (=> b!1075669 (= res!717050 (not e!614785))))

(declare-fun res!717049 () Bool)

(assert (=> b!1075669 (=> (not res!717049) (not e!614785))))

(assert (=> b!1075669 (= res!717049 (validKeyInArray!0 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129617 (not res!717051)) b!1075669))

(assert (= (and b!1075669 res!717049) b!1075665))

(assert (= (and b!1075669 res!717050) b!1075666))

(assert (= (and b!1075666 c!108091) b!1075667))

(assert (= (and b!1075666 (not c!108091)) b!1075668))

(assert (= (or b!1075667 b!1075668) bm!45539))

(declare-fun m!994505 () Bool)

(assert (=> b!1075665 m!994505))

(assert (=> b!1075665 m!994505))

(declare-fun m!994507 () Bool)

(assert (=> b!1075665 m!994507))

(assert (=> b!1075666 m!994505))

(assert (=> b!1075666 m!994505))

(declare-fun m!994509 () Bool)

(assert (=> b!1075666 m!994509))

(assert (=> bm!45539 m!994505))

(declare-fun m!994511 () Bool)

(assert (=> bm!45539 m!994511))

(assert (=> b!1075669 m!994505))

(assert (=> b!1075669 m!994505))

(assert (=> b!1075669 m!994509))

(assert (=> b!1075628 d!129617))

(declare-fun b!1075678 () Bool)

(declare-fun e!614794 () Bool)

(declare-fun call!45545 () Bool)

(assert (=> b!1075678 (= e!614794 call!45545)))

(declare-fun b!1075679 () Bool)

(declare-fun e!614795 () Bool)

(assert (=> b!1075679 (= e!614795 call!45545)))

(declare-fun bm!45542 () Bool)

(assert (=> bm!45542 (= call!45545 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1075680 () Bool)

(declare-fun e!614796 () Bool)

(assert (=> b!1075680 (= e!614796 e!614795)))

(declare-fun c!108094 () Bool)

(assert (=> b!1075680 (= c!108094 (validKeyInArray!0 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129619 () Bool)

(declare-fun res!717056 () Bool)

(assert (=> d!129619 (=> res!717056 e!614796)))

(assert (=> d!129619 (= res!717056 (bvsge #b00000000000000000000000000000000 (size!33731 _keys!1163)))))

(assert (=> d!129619 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!614796)))

(declare-fun b!1075681 () Bool)

(assert (=> b!1075681 (= e!614795 e!614794)))

(declare-fun lt!477538 () (_ BitVec 64))

(assert (=> b!1075681 (= lt!477538 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477537 () Unit!35413)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69019 (_ BitVec 64) (_ BitVec 32)) Unit!35413)

(assert (=> b!1075681 (= lt!477537 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!477538 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69019 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1075681 (arrayContainsKey!0 _keys!1163 lt!477538 #b00000000000000000000000000000000)))

(declare-fun lt!477539 () Unit!35413)

(assert (=> b!1075681 (= lt!477539 lt!477537)))

(declare-fun res!717057 () Bool)

(declare-datatypes ((SeekEntryResult!9893 0))(
  ( (MissingZero!9893 (index!41943 (_ BitVec 32))) (Found!9893 (index!41944 (_ BitVec 32))) (Intermediate!9893 (undefined!10705 Bool) (index!41945 (_ BitVec 32)) (x!96402 (_ BitVec 32))) (Undefined!9893) (MissingVacant!9893 (index!41946 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69019 (_ BitVec 32)) SeekEntryResult!9893)

(assert (=> b!1075681 (= res!717057 (= (seekEntryOrOpen!0 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9893 #b00000000000000000000000000000000)))))

(assert (=> b!1075681 (=> (not res!717057) (not e!614794))))

(assert (= (and d!129619 (not res!717056)) b!1075680))

(assert (= (and b!1075680 c!108094) b!1075681))

(assert (= (and b!1075680 (not c!108094)) b!1075679))

(assert (= (and b!1075681 res!717057) b!1075678))

(assert (= (or b!1075678 b!1075679) bm!45542))

(declare-fun m!994513 () Bool)

(assert (=> bm!45542 m!994513))

(assert (=> b!1075680 m!994505))

(assert (=> b!1075680 m!994505))

(assert (=> b!1075680 m!994509))

(assert (=> b!1075681 m!994505))

(declare-fun m!994515 () Bool)

(assert (=> b!1075681 m!994515))

(declare-fun m!994517 () Bool)

(assert (=> b!1075681 m!994517))

(assert (=> b!1075681 m!994505))

(declare-fun m!994519 () Bool)

(assert (=> b!1075681 m!994519))

(assert (=> b!1075623 d!129619))

(declare-fun d!129621 () Bool)

(assert (=> d!129621 (= (getCurrentListMapNoExtraKeys!3883 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3883 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477542 () Unit!35413)

(declare-fun choose!1756 (array!69019 array!69021 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39835 V!39835 V!39835 V!39835 (_ BitVec 32) Int) Unit!35413)

(assert (=> d!129621 (= lt!477542 (choose!1756 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129621 (validMask!0 mask!1515)))

(assert (=> d!129621 (= (lemmaNoChangeToArrayThenSameMapNoExtras!899 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477542)))

(declare-fun bs!31689 () Bool)

(assert (= bs!31689 d!129621))

(assert (=> bs!31689 m!994465))

(assert (=> bs!31689 m!994463))

(declare-fun m!994521 () Bool)

(assert (=> bs!31689 m!994521))

(assert (=> bs!31689 m!994455))

(assert (=> b!1075630 d!129621))

(declare-fun b!1075706 () Bool)

(declare-fun e!614816 () Bool)

(declare-fun e!614814 () Bool)

(assert (=> b!1075706 (= e!614816 e!614814)))

(assert (=> b!1075706 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33731 _keys!1163)))))

(declare-fun res!717067 () Bool)

(declare-fun lt!477560 () ListLongMap!14611)

(declare-fun contains!6351 (ListLongMap!14611 (_ BitVec 64)) Bool)

(assert (=> b!1075706 (= res!717067 (contains!6351 lt!477560 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075706 (=> (not res!717067) (not e!614814))))

(declare-fun b!1075707 () Bool)

(declare-fun e!614817 () Bool)

(assert (=> b!1075707 (= e!614817 (= lt!477560 (getCurrentListMapNoExtraKeys!3883 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1075708 () Bool)

(declare-fun e!614812 () Bool)

(assert (=> b!1075708 (= e!614812 e!614816)))

(declare-fun c!108105 () Bool)

(declare-fun e!614813 () Bool)

(assert (=> b!1075708 (= c!108105 e!614813)))

(declare-fun res!717069 () Bool)

(assert (=> b!1075708 (=> (not res!717069) (not e!614813))))

(assert (=> b!1075708 (= res!717069 (bvslt #b00000000000000000000000000000000 (size!33731 _keys!1163)))))

(declare-fun b!1075709 () Bool)

(declare-fun isEmpty!958 (ListLongMap!14611) Bool)

(assert (=> b!1075709 (= e!614817 (isEmpty!958 lt!477560))))

(declare-fun b!1075710 () Bool)

(declare-fun e!614811 () ListLongMap!14611)

(declare-fun e!614815 () ListLongMap!14611)

(assert (=> b!1075710 (= e!614811 e!614815)))

(declare-fun c!108106 () Bool)

(assert (=> b!1075710 (= c!108106 (validKeyInArray!0 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075711 () Bool)

(declare-fun lt!477563 () Unit!35413)

(declare-fun lt!477561 () Unit!35413)

(assert (=> b!1075711 (= lt!477563 lt!477561)))

(declare-fun lt!477557 () V!39835)

(declare-fun lt!477558 () (_ BitVec 64))

(declare-fun lt!477562 () (_ BitVec 64))

(declare-fun lt!477559 () ListLongMap!14611)

(assert (=> b!1075711 (not (contains!6351 (+!3227 lt!477559 (tuple2!16643 lt!477558 lt!477557)) lt!477562))))

(declare-fun addStillNotContains!268 (ListLongMap!14611 (_ BitVec 64) V!39835 (_ BitVec 64)) Unit!35413)

(assert (=> b!1075711 (= lt!477561 (addStillNotContains!268 lt!477559 lt!477558 lt!477557 lt!477562))))

(assert (=> b!1075711 (= lt!477562 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!17240 (ValueCell!12309 V!39835) V!39835)

(declare-fun dynLambda!2047 (Int (_ BitVec 64)) V!39835)

(assert (=> b!1075711 (= lt!477557 (get!17240 (select (arr!33196 _values!955) #b00000000000000000000000000000000) (dynLambda!2047 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1075711 (= lt!477558 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45548 () ListLongMap!14611)

(assert (=> b!1075711 (= lt!477559 call!45548)))

(assert (=> b!1075711 (= e!614815 (+!3227 call!45548 (tuple2!16643 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000) (get!17240 (select (arr!33196 _values!955) #b00000000000000000000000000000000) (dynLambda!2047 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1075712 () Bool)

(assert (=> b!1075712 (= e!614813 (validKeyInArray!0 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075712 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1075713 () Bool)

(declare-fun res!717066 () Bool)

(assert (=> b!1075713 (=> (not res!717066) (not e!614812))))

(assert (=> b!1075713 (= res!717066 (not (contains!6351 lt!477560 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!129623 () Bool)

(assert (=> d!129623 e!614812))

(declare-fun res!717068 () Bool)

(assert (=> d!129623 (=> (not res!717068) (not e!614812))))

(assert (=> d!129623 (= res!717068 (not (contains!6351 lt!477560 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129623 (= lt!477560 e!614811)))

(declare-fun c!108104 () Bool)

(assert (=> d!129623 (= c!108104 (bvsge #b00000000000000000000000000000000 (size!33731 _keys!1163)))))

(assert (=> d!129623 (validMask!0 mask!1515)))

(assert (=> d!129623 (= (getCurrentListMapNoExtraKeys!3883 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477560)))

(declare-fun b!1075714 () Bool)

(assert (=> b!1075714 (= e!614815 call!45548)))

(declare-fun b!1075715 () Bool)

(assert (=> b!1075715 (= e!614816 e!614817)))

(declare-fun c!108103 () Bool)

(assert (=> b!1075715 (= c!108103 (bvslt #b00000000000000000000000000000000 (size!33731 _keys!1163)))))

(declare-fun b!1075716 () Bool)

(assert (=> b!1075716 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33731 _keys!1163)))))

(assert (=> b!1075716 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33732 _values!955)))))

(declare-fun apply!940 (ListLongMap!14611 (_ BitVec 64)) V!39835)

(assert (=> b!1075716 (= e!614814 (= (apply!940 lt!477560 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000)) (get!17240 (select (arr!33196 _values!955) #b00000000000000000000000000000000) (dynLambda!2047 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!45545 () Bool)

(assert (=> bm!45545 (= call!45548 (getCurrentListMapNoExtraKeys!3883 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1075717 () Bool)

(assert (=> b!1075717 (= e!614811 (ListLongMap!14612 Nil!23174))))

(assert (= (and d!129623 c!108104) b!1075717))

(assert (= (and d!129623 (not c!108104)) b!1075710))

(assert (= (and b!1075710 c!108106) b!1075711))

(assert (= (and b!1075710 (not c!108106)) b!1075714))

(assert (= (or b!1075711 b!1075714) bm!45545))

(assert (= (and d!129623 res!717068) b!1075713))

(assert (= (and b!1075713 res!717066) b!1075708))

(assert (= (and b!1075708 res!717069) b!1075712))

(assert (= (and b!1075708 c!108105) b!1075706))

(assert (= (and b!1075708 (not c!108105)) b!1075715))

(assert (= (and b!1075706 res!717067) b!1075716))

(assert (= (and b!1075715 c!108103) b!1075707))

(assert (= (and b!1075715 (not c!108103)) b!1075709))

(declare-fun b_lambda!16901 () Bool)

(assert (=> (not b_lambda!16901) (not b!1075711)))

(declare-fun t!32533 () Bool)

(declare-fun tb!7175 () Bool)

(assert (=> (and start!95158 (= defaultEntry!963 defaultEntry!963) t!32533) tb!7175))

(declare-fun result!14833 () Bool)

(assert (=> tb!7175 (= result!14833 tp_is_empty!26025)))

(assert (=> b!1075711 t!32533))

(declare-fun b_and!35161 () Bool)

(assert (= b_and!35157 (and (=> t!32533 result!14833) b_and!35161)))

(declare-fun b_lambda!16903 () Bool)

(assert (=> (not b_lambda!16903) (not b!1075716)))

(assert (=> b!1075716 t!32533))

(declare-fun b_and!35163 () Bool)

(assert (= b_and!35161 (and (=> t!32533 result!14833) b_and!35163)))

(assert (=> b!1075716 m!994505))

(declare-fun m!994523 () Bool)

(assert (=> b!1075716 m!994523))

(declare-fun m!994525 () Bool)

(assert (=> b!1075716 m!994525))

(assert (=> b!1075716 m!994525))

(assert (=> b!1075716 m!994523))

(declare-fun m!994527 () Bool)

(assert (=> b!1075716 m!994527))

(assert (=> b!1075716 m!994505))

(declare-fun m!994529 () Bool)

(assert (=> b!1075716 m!994529))

(assert (=> b!1075712 m!994505))

(assert (=> b!1075712 m!994505))

(assert (=> b!1075712 m!994509))

(assert (=> b!1075710 m!994505))

(assert (=> b!1075710 m!994505))

(assert (=> b!1075710 m!994509))

(declare-fun m!994531 () Bool)

(assert (=> bm!45545 m!994531))

(declare-fun m!994533 () Bool)

(assert (=> b!1075709 m!994533))

(declare-fun m!994535 () Bool)

(assert (=> d!129623 m!994535))

(assert (=> d!129623 m!994455))

(assert (=> b!1075711 m!994505))

(declare-fun m!994537 () Bool)

(assert (=> b!1075711 m!994537))

(assert (=> b!1075711 m!994523))

(declare-fun m!994539 () Bool)

(assert (=> b!1075711 m!994539))

(assert (=> b!1075711 m!994525))

(assert (=> b!1075711 m!994525))

(assert (=> b!1075711 m!994523))

(assert (=> b!1075711 m!994527))

(assert (=> b!1075711 m!994539))

(declare-fun m!994541 () Bool)

(assert (=> b!1075711 m!994541))

(declare-fun m!994543 () Bool)

(assert (=> b!1075711 m!994543))

(assert (=> b!1075706 m!994505))

(assert (=> b!1075706 m!994505))

(declare-fun m!994545 () Bool)

(assert (=> b!1075706 m!994545))

(declare-fun m!994547 () Bool)

(assert (=> b!1075713 m!994547))

(assert (=> b!1075707 m!994531))

(assert (=> b!1075630 d!129623))

(declare-fun b!1075720 () Bool)

(declare-fun e!614823 () Bool)

(declare-fun e!614821 () Bool)

(assert (=> b!1075720 (= e!614823 e!614821)))

(assert (=> b!1075720 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33731 _keys!1163)))))

(declare-fun res!717071 () Bool)

(declare-fun lt!477567 () ListLongMap!14611)

(assert (=> b!1075720 (= res!717071 (contains!6351 lt!477567 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075720 (=> (not res!717071) (not e!614821))))

(declare-fun e!614824 () Bool)

(declare-fun b!1075721 () Bool)

(assert (=> b!1075721 (= e!614824 (= lt!477567 (getCurrentListMapNoExtraKeys!3883 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1075722 () Bool)

(declare-fun e!614819 () Bool)

(assert (=> b!1075722 (= e!614819 e!614823)))

(declare-fun c!108109 () Bool)

(declare-fun e!614820 () Bool)

(assert (=> b!1075722 (= c!108109 e!614820)))

(declare-fun res!717073 () Bool)

(assert (=> b!1075722 (=> (not res!717073) (not e!614820))))

(assert (=> b!1075722 (= res!717073 (bvslt #b00000000000000000000000000000000 (size!33731 _keys!1163)))))

(declare-fun b!1075723 () Bool)

(assert (=> b!1075723 (= e!614824 (isEmpty!958 lt!477567))))

(declare-fun b!1075724 () Bool)

(declare-fun e!614818 () ListLongMap!14611)

(declare-fun e!614822 () ListLongMap!14611)

(assert (=> b!1075724 (= e!614818 e!614822)))

(declare-fun c!108110 () Bool)

(assert (=> b!1075724 (= c!108110 (validKeyInArray!0 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075725 () Bool)

(declare-fun lt!477570 () Unit!35413)

(declare-fun lt!477568 () Unit!35413)

(assert (=> b!1075725 (= lt!477570 lt!477568)))

(declare-fun lt!477564 () V!39835)

(declare-fun lt!477569 () (_ BitVec 64))

(declare-fun lt!477565 () (_ BitVec 64))

(declare-fun lt!477566 () ListLongMap!14611)

(assert (=> b!1075725 (not (contains!6351 (+!3227 lt!477566 (tuple2!16643 lt!477565 lt!477564)) lt!477569))))

(assert (=> b!1075725 (= lt!477568 (addStillNotContains!268 lt!477566 lt!477565 lt!477564 lt!477569))))

(assert (=> b!1075725 (= lt!477569 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1075725 (= lt!477564 (get!17240 (select (arr!33196 _values!955) #b00000000000000000000000000000000) (dynLambda!2047 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1075725 (= lt!477565 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45549 () ListLongMap!14611)

(assert (=> b!1075725 (= lt!477566 call!45549)))

(assert (=> b!1075725 (= e!614822 (+!3227 call!45549 (tuple2!16643 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000) (get!17240 (select (arr!33196 _values!955) #b00000000000000000000000000000000) (dynLambda!2047 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1075726 () Bool)

(assert (=> b!1075726 (= e!614820 (validKeyInArray!0 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075726 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1075727 () Bool)

(declare-fun res!717070 () Bool)

(assert (=> b!1075727 (=> (not res!717070) (not e!614819))))

(assert (=> b!1075727 (= res!717070 (not (contains!6351 lt!477567 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!129625 () Bool)

(assert (=> d!129625 e!614819))

(declare-fun res!717072 () Bool)

(assert (=> d!129625 (=> (not res!717072) (not e!614819))))

(assert (=> d!129625 (= res!717072 (not (contains!6351 lt!477567 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129625 (= lt!477567 e!614818)))

(declare-fun c!108108 () Bool)

(assert (=> d!129625 (= c!108108 (bvsge #b00000000000000000000000000000000 (size!33731 _keys!1163)))))

(assert (=> d!129625 (validMask!0 mask!1515)))

(assert (=> d!129625 (= (getCurrentListMapNoExtraKeys!3883 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477567)))

(declare-fun b!1075728 () Bool)

(assert (=> b!1075728 (= e!614822 call!45549)))

(declare-fun b!1075729 () Bool)

(assert (=> b!1075729 (= e!614823 e!614824)))

(declare-fun c!108107 () Bool)

(assert (=> b!1075729 (= c!108107 (bvslt #b00000000000000000000000000000000 (size!33731 _keys!1163)))))

(declare-fun b!1075730 () Bool)

(assert (=> b!1075730 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33731 _keys!1163)))))

(assert (=> b!1075730 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33732 _values!955)))))

(assert (=> b!1075730 (= e!614821 (= (apply!940 lt!477567 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000)) (get!17240 (select (arr!33196 _values!955) #b00000000000000000000000000000000) (dynLambda!2047 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!45546 () Bool)

(assert (=> bm!45546 (= call!45549 (getCurrentListMapNoExtraKeys!3883 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1075731 () Bool)

(assert (=> b!1075731 (= e!614818 (ListLongMap!14612 Nil!23174))))

(assert (= (and d!129625 c!108108) b!1075731))

(assert (= (and d!129625 (not c!108108)) b!1075724))

(assert (= (and b!1075724 c!108110) b!1075725))

(assert (= (and b!1075724 (not c!108110)) b!1075728))

(assert (= (or b!1075725 b!1075728) bm!45546))

(assert (= (and d!129625 res!717072) b!1075727))

(assert (= (and b!1075727 res!717070) b!1075722))

(assert (= (and b!1075722 res!717073) b!1075726))

(assert (= (and b!1075722 c!108109) b!1075720))

(assert (= (and b!1075722 (not c!108109)) b!1075729))

(assert (= (and b!1075720 res!717071) b!1075730))

(assert (= (and b!1075729 c!108107) b!1075721))

(assert (= (and b!1075729 (not c!108107)) b!1075723))

(declare-fun b_lambda!16905 () Bool)

(assert (=> (not b_lambda!16905) (not b!1075725)))

(assert (=> b!1075725 t!32533))

(declare-fun b_and!35165 () Bool)

(assert (= b_and!35163 (and (=> t!32533 result!14833) b_and!35165)))

(declare-fun b_lambda!16907 () Bool)

(assert (=> (not b_lambda!16907) (not b!1075730)))

(assert (=> b!1075730 t!32533))

(declare-fun b_and!35167 () Bool)

(assert (= b_and!35165 (and (=> t!32533 result!14833) b_and!35167)))

(assert (=> b!1075730 m!994505))

(assert (=> b!1075730 m!994523))

(assert (=> b!1075730 m!994525))

(assert (=> b!1075730 m!994525))

(assert (=> b!1075730 m!994523))

(assert (=> b!1075730 m!994527))

(assert (=> b!1075730 m!994505))

(declare-fun m!994549 () Bool)

(assert (=> b!1075730 m!994549))

(assert (=> b!1075726 m!994505))

(assert (=> b!1075726 m!994505))

(assert (=> b!1075726 m!994509))

(assert (=> b!1075724 m!994505))

(assert (=> b!1075724 m!994505))

(assert (=> b!1075724 m!994509))

(declare-fun m!994551 () Bool)

(assert (=> bm!45546 m!994551))

(declare-fun m!994553 () Bool)

(assert (=> b!1075723 m!994553))

(declare-fun m!994555 () Bool)

(assert (=> d!129625 m!994555))

(assert (=> d!129625 m!994455))

(assert (=> b!1075725 m!994505))

(declare-fun m!994557 () Bool)

(assert (=> b!1075725 m!994557))

(assert (=> b!1075725 m!994523))

(declare-fun m!994559 () Bool)

(assert (=> b!1075725 m!994559))

(assert (=> b!1075725 m!994525))

(assert (=> b!1075725 m!994525))

(assert (=> b!1075725 m!994523))

(assert (=> b!1075725 m!994527))

(assert (=> b!1075725 m!994559))

(declare-fun m!994561 () Bool)

(assert (=> b!1075725 m!994561))

(declare-fun m!994563 () Bool)

(assert (=> b!1075725 m!994563))

(assert (=> b!1075720 m!994505))

(assert (=> b!1075720 m!994505))

(declare-fun m!994565 () Bool)

(assert (=> b!1075720 m!994565))

(declare-fun m!994567 () Bool)

(assert (=> b!1075727 m!994567))

(assert (=> b!1075721 m!994551))

(assert (=> b!1075630 d!129625))

(declare-fun b!1075774 () Bool)

(declare-fun e!614856 () Bool)

(declare-fun lt!477631 () ListLongMap!14611)

(assert (=> b!1075774 (= e!614856 (= (apply!940 lt!477631 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1075775 () Bool)

(declare-fun e!614859 () Bool)

(declare-fun e!614852 () Bool)

(assert (=> b!1075775 (= e!614859 e!614852)))

(declare-fun res!717098 () Bool)

(assert (=> b!1075775 (=> (not res!717098) (not e!614852))))

(assert (=> b!1075775 (= res!717098 (contains!6351 lt!477631 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075775 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33731 _keys!1163)))))

(declare-fun b!1075776 () Bool)

(declare-fun e!614860 () ListLongMap!14611)

(declare-fun call!45567 () ListLongMap!14611)

(assert (=> b!1075776 (= e!614860 (+!3227 call!45567 (tuple2!16643 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1075777 () Bool)

(declare-fun e!614855 () Unit!35413)

(declare-fun lt!477636 () Unit!35413)

(assert (=> b!1075777 (= e!614855 lt!477636)))

(declare-fun lt!477634 () ListLongMap!14611)

(assert (=> b!1075777 (= lt!477634 (getCurrentListMapNoExtraKeys!3883 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477622 () (_ BitVec 64))

(assert (=> b!1075777 (= lt!477622 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477621 () (_ BitVec 64))

(assert (=> b!1075777 (= lt!477621 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477625 () Unit!35413)

(declare-fun addStillContains!653 (ListLongMap!14611 (_ BitVec 64) V!39835 (_ BitVec 64)) Unit!35413)

(assert (=> b!1075777 (= lt!477625 (addStillContains!653 lt!477634 lt!477622 zeroValueBefore!47 lt!477621))))

(assert (=> b!1075777 (contains!6351 (+!3227 lt!477634 (tuple2!16643 lt!477622 zeroValueBefore!47)) lt!477621)))

(declare-fun lt!477616 () Unit!35413)

(assert (=> b!1075777 (= lt!477616 lt!477625)))

(declare-fun lt!477633 () ListLongMap!14611)

(assert (=> b!1075777 (= lt!477633 (getCurrentListMapNoExtraKeys!3883 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477615 () (_ BitVec 64))

(assert (=> b!1075777 (= lt!477615 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477624 () (_ BitVec 64))

(assert (=> b!1075777 (= lt!477624 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477630 () Unit!35413)

(declare-fun addApplyDifferent!513 (ListLongMap!14611 (_ BitVec 64) V!39835 (_ BitVec 64)) Unit!35413)

(assert (=> b!1075777 (= lt!477630 (addApplyDifferent!513 lt!477633 lt!477615 minValue!907 lt!477624))))

(assert (=> b!1075777 (= (apply!940 (+!3227 lt!477633 (tuple2!16643 lt!477615 minValue!907)) lt!477624) (apply!940 lt!477633 lt!477624))))

(declare-fun lt!477626 () Unit!35413)

(assert (=> b!1075777 (= lt!477626 lt!477630)))

(declare-fun lt!477632 () ListLongMap!14611)

(assert (=> b!1075777 (= lt!477632 (getCurrentListMapNoExtraKeys!3883 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477623 () (_ BitVec 64))

(assert (=> b!1075777 (= lt!477623 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477627 () (_ BitVec 64))

(assert (=> b!1075777 (= lt!477627 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477618 () Unit!35413)

(assert (=> b!1075777 (= lt!477618 (addApplyDifferent!513 lt!477632 lt!477623 zeroValueBefore!47 lt!477627))))

(assert (=> b!1075777 (= (apply!940 (+!3227 lt!477632 (tuple2!16643 lt!477623 zeroValueBefore!47)) lt!477627) (apply!940 lt!477632 lt!477627))))

(declare-fun lt!477629 () Unit!35413)

(assert (=> b!1075777 (= lt!477629 lt!477618)))

(declare-fun lt!477628 () ListLongMap!14611)

(assert (=> b!1075777 (= lt!477628 (getCurrentListMapNoExtraKeys!3883 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477620 () (_ BitVec 64))

(assert (=> b!1075777 (= lt!477620 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477635 () (_ BitVec 64))

(assert (=> b!1075777 (= lt!477635 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075777 (= lt!477636 (addApplyDifferent!513 lt!477628 lt!477620 minValue!907 lt!477635))))

(assert (=> b!1075777 (= (apply!940 (+!3227 lt!477628 (tuple2!16643 lt!477620 minValue!907)) lt!477635) (apply!940 lt!477628 lt!477635))))

(declare-fun b!1075778 () Bool)

(declare-fun e!614863 () Bool)

(declare-fun call!45564 () Bool)

(assert (=> b!1075778 (= e!614863 (not call!45564))))

(declare-fun b!1075779 () Bool)

(declare-fun e!614853 () ListLongMap!14611)

(assert (=> b!1075779 (= e!614860 e!614853)))

(declare-fun c!108126 () Bool)

(assert (=> b!1075779 (= c!108126 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1075780 () Bool)

(assert (=> b!1075780 (= e!614863 e!614856)))

(declare-fun res!717096 () Bool)

(assert (=> b!1075780 (= res!717096 call!45564)))

(assert (=> b!1075780 (=> (not res!717096) (not e!614856))))

(declare-fun d!129627 () Bool)

(declare-fun e!614851 () Bool)

(assert (=> d!129627 e!614851))

(declare-fun res!717094 () Bool)

(assert (=> d!129627 (=> (not res!717094) (not e!614851))))

(assert (=> d!129627 (= res!717094 (or (bvsge #b00000000000000000000000000000000 (size!33731 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33731 _keys!1163)))))))

(declare-fun lt!477619 () ListLongMap!14611)

(assert (=> d!129627 (= lt!477631 lt!477619)))

(declare-fun lt!477617 () Unit!35413)

(assert (=> d!129627 (= lt!477617 e!614855)))

(declare-fun c!108127 () Bool)

(declare-fun e!614861 () Bool)

(assert (=> d!129627 (= c!108127 e!614861)))

(declare-fun res!717099 () Bool)

(assert (=> d!129627 (=> (not res!717099) (not e!614861))))

(assert (=> d!129627 (= res!717099 (bvslt #b00000000000000000000000000000000 (size!33731 _keys!1163)))))

(assert (=> d!129627 (= lt!477619 e!614860)))

(declare-fun c!108124 () Bool)

(assert (=> d!129627 (= c!108124 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129627 (validMask!0 mask!1515)))

(assert (=> d!129627 (= (getCurrentListMap!4190 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477631)))

(declare-fun bm!45561 () Bool)

(declare-fun call!45570 () ListLongMap!14611)

(declare-fun call!45565 () ListLongMap!14611)

(assert (=> bm!45561 (= call!45570 call!45565)))

(declare-fun call!45566 () ListLongMap!14611)

(declare-fun bm!45562 () Bool)

(assert (=> bm!45562 (= call!45567 (+!3227 (ite c!108124 call!45565 (ite c!108126 call!45570 call!45566)) (ite (or c!108124 c!108126) (tuple2!16643 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16643 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1075781 () Bool)

(declare-fun e!614857 () Bool)

(assert (=> b!1075781 (= e!614857 (validKeyInArray!0 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45563 () Bool)

(assert (=> bm!45563 (= call!45565 (getCurrentListMapNoExtraKeys!3883 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1075782 () Bool)

(declare-fun Unit!35415 () Unit!35413)

(assert (=> b!1075782 (= e!614855 Unit!35415)))

(declare-fun b!1075783 () Bool)

(declare-fun res!717092 () Bool)

(assert (=> b!1075783 (=> (not res!717092) (not e!614851))))

(assert (=> b!1075783 (= res!717092 e!614863)))

(declare-fun c!108128 () Bool)

(assert (=> b!1075783 (= c!108128 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45564 () Bool)

(declare-fun call!45569 () Bool)

(assert (=> bm!45564 (= call!45569 (contains!6351 lt!477631 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075784 () Bool)

(assert (=> b!1075784 (= e!614852 (= (apply!940 lt!477631 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000)) (get!17240 (select (arr!33196 _values!955) #b00000000000000000000000000000000) (dynLambda!2047 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1075784 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33732 _values!955)))))

(assert (=> b!1075784 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33731 _keys!1163)))))

(declare-fun b!1075785 () Bool)

(declare-fun e!614854 () Bool)

(declare-fun e!614858 () Bool)

(assert (=> b!1075785 (= e!614854 e!614858)))

(declare-fun res!717093 () Bool)

(assert (=> b!1075785 (= res!717093 call!45569)))

(assert (=> b!1075785 (=> (not res!717093) (not e!614858))))

(declare-fun b!1075786 () Bool)

(assert (=> b!1075786 (= e!614854 (not call!45569))))

(declare-fun b!1075787 () Bool)

(assert (=> b!1075787 (= e!614861 (validKeyInArray!0 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45565 () Bool)

(assert (=> bm!45565 (= call!45566 call!45570)))

(declare-fun bm!45566 () Bool)

(declare-fun call!45568 () ListLongMap!14611)

(assert (=> bm!45566 (= call!45568 call!45567)))

(declare-fun b!1075788 () Bool)

(declare-fun e!614862 () ListLongMap!14611)

(assert (=> b!1075788 (= e!614862 call!45566)))

(declare-fun bm!45567 () Bool)

(assert (=> bm!45567 (= call!45564 (contains!6351 lt!477631 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075789 () Bool)

(assert (=> b!1075789 (= e!614858 (= (apply!940 lt!477631 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1075790 () Bool)

(assert (=> b!1075790 (= e!614851 e!614854)))

(declare-fun c!108123 () Bool)

(assert (=> b!1075790 (= c!108123 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1075791 () Bool)

(assert (=> b!1075791 (= e!614862 call!45568)))

(declare-fun b!1075792 () Bool)

(declare-fun res!717100 () Bool)

(assert (=> b!1075792 (=> (not res!717100) (not e!614851))))

(assert (=> b!1075792 (= res!717100 e!614859)))

(declare-fun res!717097 () Bool)

(assert (=> b!1075792 (=> res!717097 e!614859)))

(assert (=> b!1075792 (= res!717097 (not e!614857))))

(declare-fun res!717095 () Bool)

(assert (=> b!1075792 (=> (not res!717095) (not e!614857))))

(assert (=> b!1075792 (= res!717095 (bvslt #b00000000000000000000000000000000 (size!33731 _keys!1163)))))

(declare-fun b!1075793 () Bool)

(assert (=> b!1075793 (= e!614853 call!45568)))

(declare-fun b!1075794 () Bool)

(declare-fun c!108125 () Bool)

(assert (=> b!1075794 (= c!108125 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1075794 (= e!614853 e!614862)))

(assert (= (and d!129627 c!108124) b!1075776))

(assert (= (and d!129627 (not c!108124)) b!1075779))

(assert (= (and b!1075779 c!108126) b!1075793))

(assert (= (and b!1075779 (not c!108126)) b!1075794))

(assert (= (and b!1075794 c!108125) b!1075791))

(assert (= (and b!1075794 (not c!108125)) b!1075788))

(assert (= (or b!1075791 b!1075788) bm!45565))

(assert (= (or b!1075793 bm!45565) bm!45561))

(assert (= (or b!1075793 b!1075791) bm!45566))

(assert (= (or b!1075776 bm!45561) bm!45563))

(assert (= (or b!1075776 bm!45566) bm!45562))

(assert (= (and d!129627 res!717099) b!1075787))

(assert (= (and d!129627 c!108127) b!1075777))

(assert (= (and d!129627 (not c!108127)) b!1075782))

(assert (= (and d!129627 res!717094) b!1075792))

(assert (= (and b!1075792 res!717095) b!1075781))

(assert (= (and b!1075792 (not res!717097)) b!1075775))

(assert (= (and b!1075775 res!717098) b!1075784))

(assert (= (and b!1075792 res!717100) b!1075783))

(assert (= (and b!1075783 c!108128) b!1075780))

(assert (= (and b!1075783 (not c!108128)) b!1075778))

(assert (= (and b!1075780 res!717096) b!1075774))

(assert (= (or b!1075780 b!1075778) bm!45567))

(assert (= (and b!1075783 res!717092) b!1075790))

(assert (= (and b!1075790 c!108123) b!1075785))

(assert (= (and b!1075790 (not c!108123)) b!1075786))

(assert (= (and b!1075785 res!717093) b!1075789))

(assert (= (or b!1075785 b!1075786) bm!45564))

(declare-fun b_lambda!16909 () Bool)

(assert (=> (not b_lambda!16909) (not b!1075784)))

(assert (=> b!1075784 t!32533))

(declare-fun b_and!35169 () Bool)

(assert (= b_and!35167 (and (=> t!32533 result!14833) b_and!35169)))

(assert (=> bm!45563 m!994465))

(declare-fun m!994569 () Bool)

(assert (=> bm!45564 m!994569))

(assert (=> b!1075784 m!994505))

(assert (=> b!1075784 m!994505))

(declare-fun m!994571 () Bool)

(assert (=> b!1075784 m!994571))

(assert (=> b!1075784 m!994525))

(assert (=> b!1075784 m!994523))

(assert (=> b!1075784 m!994525))

(assert (=> b!1075784 m!994523))

(assert (=> b!1075784 m!994527))

(assert (=> b!1075787 m!994505))

(assert (=> b!1075787 m!994505))

(assert (=> b!1075787 m!994509))

(declare-fun m!994573 () Bool)

(assert (=> b!1075789 m!994573))

(assert (=> b!1075781 m!994505))

(assert (=> b!1075781 m!994505))

(assert (=> b!1075781 m!994509))

(declare-fun m!994575 () Bool)

(assert (=> bm!45562 m!994575))

(declare-fun m!994577 () Bool)

(assert (=> bm!45567 m!994577))

(assert (=> b!1075775 m!994505))

(assert (=> b!1075775 m!994505))

(declare-fun m!994579 () Bool)

(assert (=> b!1075775 m!994579))

(declare-fun m!994581 () Bool)

(assert (=> b!1075777 m!994581))

(assert (=> b!1075777 m!994505))

(declare-fun m!994583 () Bool)

(assert (=> b!1075777 m!994583))

(declare-fun m!994585 () Bool)

(assert (=> b!1075777 m!994585))

(declare-fun m!994587 () Bool)

(assert (=> b!1075777 m!994587))

(declare-fun m!994589 () Bool)

(assert (=> b!1075777 m!994589))

(assert (=> b!1075777 m!994589))

(declare-fun m!994591 () Bool)

(assert (=> b!1075777 m!994591))

(declare-fun m!994593 () Bool)

(assert (=> b!1075777 m!994593))

(assert (=> b!1075777 m!994585))

(declare-fun m!994595 () Bool)

(assert (=> b!1075777 m!994595))

(assert (=> b!1075777 m!994593))

(declare-fun m!994597 () Bool)

(assert (=> b!1075777 m!994597))

(declare-fun m!994599 () Bool)

(assert (=> b!1075777 m!994599))

(declare-fun m!994601 () Bool)

(assert (=> b!1075777 m!994601))

(declare-fun m!994603 () Bool)

(assert (=> b!1075777 m!994603))

(declare-fun m!994605 () Bool)

(assert (=> b!1075777 m!994605))

(assert (=> b!1075777 m!994599))

(declare-fun m!994607 () Bool)

(assert (=> b!1075777 m!994607))

(assert (=> b!1075777 m!994465))

(declare-fun m!994609 () Bool)

(assert (=> b!1075777 m!994609))

(declare-fun m!994611 () Bool)

(assert (=> b!1075776 m!994611))

(assert (=> d!129627 m!994455))

(declare-fun m!994613 () Bool)

(assert (=> b!1075774 m!994613))

(assert (=> b!1075626 d!129627))

(declare-fun d!129629 () Bool)

(declare-fun e!614866 () Bool)

(assert (=> d!129629 e!614866))

(declare-fun res!717105 () Bool)

(assert (=> d!129629 (=> (not res!717105) (not e!614866))))

(declare-fun lt!477646 () ListLongMap!14611)

(assert (=> d!129629 (= res!717105 (contains!6351 lt!477646 (_1!8332 (tuple2!16643 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun lt!477647 () List!23177)

(assert (=> d!129629 (= lt!477646 (ListLongMap!14612 lt!477647))))

(declare-fun lt!477645 () Unit!35413)

(declare-fun lt!477648 () Unit!35413)

(assert (=> d!129629 (= lt!477645 lt!477648)))

(declare-datatypes ((Option!663 0))(
  ( (Some!662 (v!15690 V!39835)) (None!661) )
))
(declare-fun getValueByKey!612 (List!23177 (_ BitVec 64)) Option!663)

(assert (=> d!129629 (= (getValueByKey!612 lt!477647 (_1!8332 (tuple2!16643 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))) (Some!662 (_2!8332 (tuple2!16643 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun lemmaContainsTupThenGetReturnValue!289 (List!23177 (_ BitVec 64) V!39835) Unit!35413)

(assert (=> d!129629 (= lt!477648 (lemmaContainsTupThenGetReturnValue!289 lt!477647 (_1!8332 (tuple2!16643 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (_2!8332 (tuple2!16643 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun insertStrictlySorted!382 (List!23177 (_ BitVec 64) V!39835) List!23177)

(assert (=> d!129629 (= lt!477647 (insertStrictlySorted!382 (toList!7321 (+!3227 lt!477518 (tuple2!16643 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (_1!8332 (tuple2!16643 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (_2!8332 (tuple2!16643 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(assert (=> d!129629 (= (+!3227 (+!3227 lt!477518 (tuple2!16643 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (tuple2!16643 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) lt!477646)))

(declare-fun b!1075799 () Bool)

(declare-fun res!717106 () Bool)

(assert (=> b!1075799 (=> (not res!717106) (not e!614866))))

(assert (=> b!1075799 (= res!717106 (= (getValueByKey!612 (toList!7321 lt!477646) (_1!8332 (tuple2!16643 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))) (Some!662 (_2!8332 (tuple2!16643 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))))

(declare-fun b!1075800 () Bool)

(declare-fun contains!6352 (List!23177 tuple2!16642) Bool)

(assert (=> b!1075800 (= e!614866 (contains!6352 (toList!7321 lt!477646) (tuple2!16643 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(assert (= (and d!129629 res!717105) b!1075799))

(assert (= (and b!1075799 res!717106) b!1075800))

(declare-fun m!994615 () Bool)

(assert (=> d!129629 m!994615))

(declare-fun m!994617 () Bool)

(assert (=> d!129629 m!994617))

(declare-fun m!994619 () Bool)

(assert (=> d!129629 m!994619))

(declare-fun m!994621 () Bool)

(assert (=> d!129629 m!994621))

(declare-fun m!994623 () Bool)

(assert (=> b!1075799 m!994623))

(declare-fun m!994625 () Bool)

(assert (=> b!1075800 m!994625))

(assert (=> b!1075626 d!129629))

(declare-fun d!129631 () Bool)

(declare-fun e!614867 () Bool)

(assert (=> d!129631 e!614867))

(declare-fun res!717107 () Bool)

(assert (=> d!129631 (=> (not res!717107) (not e!614867))))

(declare-fun lt!477650 () ListLongMap!14611)

(assert (=> d!129631 (= res!717107 (contains!6351 lt!477650 (_1!8332 (tuple2!16643 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!477651 () List!23177)

(assert (=> d!129631 (= lt!477650 (ListLongMap!14612 lt!477651))))

(declare-fun lt!477649 () Unit!35413)

(declare-fun lt!477652 () Unit!35413)

(assert (=> d!129631 (= lt!477649 lt!477652)))

(assert (=> d!129631 (= (getValueByKey!612 lt!477651 (_1!8332 (tuple2!16643 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!662 (_2!8332 (tuple2!16643 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!129631 (= lt!477652 (lemmaContainsTupThenGetReturnValue!289 lt!477651 (_1!8332 (tuple2!16643 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8332 (tuple2!16643 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!129631 (= lt!477651 (insertStrictlySorted!382 (toList!7321 lt!477518) (_1!8332 (tuple2!16643 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8332 (tuple2!16643 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!129631 (= (+!3227 lt!477518 (tuple2!16643 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!477650)))

(declare-fun b!1075801 () Bool)

(declare-fun res!717108 () Bool)

(assert (=> b!1075801 (=> (not res!717108) (not e!614867))))

(assert (=> b!1075801 (= res!717108 (= (getValueByKey!612 (toList!7321 lt!477650) (_1!8332 (tuple2!16643 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!662 (_2!8332 (tuple2!16643 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))))

(declare-fun b!1075802 () Bool)

(assert (=> b!1075802 (= e!614867 (contains!6352 (toList!7321 lt!477650) (tuple2!16643 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(assert (= (and d!129631 res!717107) b!1075801))

(assert (= (and b!1075801 res!717108) b!1075802))

(declare-fun m!994627 () Bool)

(assert (=> d!129631 m!994627))

(declare-fun m!994629 () Bool)

(assert (=> d!129631 m!994629))

(declare-fun m!994631 () Bool)

(assert (=> d!129631 m!994631))

(declare-fun m!994633 () Bool)

(assert (=> d!129631 m!994633))

(declare-fun m!994635 () Bool)

(assert (=> b!1075801 m!994635))

(declare-fun m!994637 () Bool)

(assert (=> b!1075802 m!994637))

(assert (=> b!1075626 d!129631))

(declare-fun b!1075803 () Bool)

(declare-fun e!614873 () Bool)

(declare-fun lt!477669 () ListLongMap!14611)

(assert (=> b!1075803 (= e!614873 (= (apply!940 lt!477669 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun b!1075804 () Bool)

(declare-fun e!614876 () Bool)

(declare-fun e!614869 () Bool)

(assert (=> b!1075804 (= e!614876 e!614869)))

(declare-fun res!717115 () Bool)

(assert (=> b!1075804 (=> (not res!717115) (not e!614869))))

(assert (=> b!1075804 (= res!717115 (contains!6351 lt!477669 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075804 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33731 _keys!1163)))))

(declare-fun b!1075805 () Bool)

(declare-fun e!614877 () ListLongMap!14611)

(declare-fun call!45574 () ListLongMap!14611)

(assert (=> b!1075805 (= e!614877 (+!3227 call!45574 (tuple2!16643 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1075806 () Bool)

(declare-fun e!614872 () Unit!35413)

(declare-fun lt!477674 () Unit!35413)

(assert (=> b!1075806 (= e!614872 lt!477674)))

(declare-fun lt!477672 () ListLongMap!14611)

(assert (=> b!1075806 (= lt!477672 (getCurrentListMapNoExtraKeys!3883 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477660 () (_ BitVec 64))

(assert (=> b!1075806 (= lt!477660 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477659 () (_ BitVec 64))

(assert (=> b!1075806 (= lt!477659 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477663 () Unit!35413)

(assert (=> b!1075806 (= lt!477663 (addStillContains!653 lt!477672 lt!477660 zeroValueAfter!47 lt!477659))))

(assert (=> b!1075806 (contains!6351 (+!3227 lt!477672 (tuple2!16643 lt!477660 zeroValueAfter!47)) lt!477659)))

(declare-fun lt!477654 () Unit!35413)

(assert (=> b!1075806 (= lt!477654 lt!477663)))

(declare-fun lt!477671 () ListLongMap!14611)

(assert (=> b!1075806 (= lt!477671 (getCurrentListMapNoExtraKeys!3883 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477653 () (_ BitVec 64))

(assert (=> b!1075806 (= lt!477653 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477662 () (_ BitVec 64))

(assert (=> b!1075806 (= lt!477662 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477668 () Unit!35413)

(assert (=> b!1075806 (= lt!477668 (addApplyDifferent!513 lt!477671 lt!477653 minValue!907 lt!477662))))

(assert (=> b!1075806 (= (apply!940 (+!3227 lt!477671 (tuple2!16643 lt!477653 minValue!907)) lt!477662) (apply!940 lt!477671 lt!477662))))

(declare-fun lt!477664 () Unit!35413)

(assert (=> b!1075806 (= lt!477664 lt!477668)))

(declare-fun lt!477670 () ListLongMap!14611)

(assert (=> b!1075806 (= lt!477670 (getCurrentListMapNoExtraKeys!3883 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477661 () (_ BitVec 64))

(assert (=> b!1075806 (= lt!477661 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477665 () (_ BitVec 64))

(assert (=> b!1075806 (= lt!477665 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477656 () Unit!35413)

(assert (=> b!1075806 (= lt!477656 (addApplyDifferent!513 lt!477670 lt!477661 zeroValueAfter!47 lt!477665))))

(assert (=> b!1075806 (= (apply!940 (+!3227 lt!477670 (tuple2!16643 lt!477661 zeroValueAfter!47)) lt!477665) (apply!940 lt!477670 lt!477665))))

(declare-fun lt!477667 () Unit!35413)

(assert (=> b!1075806 (= lt!477667 lt!477656)))

(declare-fun lt!477666 () ListLongMap!14611)

(assert (=> b!1075806 (= lt!477666 (getCurrentListMapNoExtraKeys!3883 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477658 () (_ BitVec 64))

(assert (=> b!1075806 (= lt!477658 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477673 () (_ BitVec 64))

(assert (=> b!1075806 (= lt!477673 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075806 (= lt!477674 (addApplyDifferent!513 lt!477666 lt!477658 minValue!907 lt!477673))))

(assert (=> b!1075806 (= (apply!940 (+!3227 lt!477666 (tuple2!16643 lt!477658 minValue!907)) lt!477673) (apply!940 lt!477666 lt!477673))))

(declare-fun b!1075807 () Bool)

(declare-fun e!614880 () Bool)

(declare-fun call!45571 () Bool)

(assert (=> b!1075807 (= e!614880 (not call!45571))))

(declare-fun b!1075808 () Bool)

(declare-fun e!614870 () ListLongMap!14611)

(assert (=> b!1075808 (= e!614877 e!614870)))

(declare-fun c!108132 () Bool)

(assert (=> b!1075808 (= c!108132 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1075809 () Bool)

(assert (=> b!1075809 (= e!614880 e!614873)))

(declare-fun res!717113 () Bool)

(assert (=> b!1075809 (= res!717113 call!45571)))

(assert (=> b!1075809 (=> (not res!717113) (not e!614873))))

(declare-fun d!129633 () Bool)

(declare-fun e!614868 () Bool)

(assert (=> d!129633 e!614868))

(declare-fun res!717111 () Bool)

(assert (=> d!129633 (=> (not res!717111) (not e!614868))))

(assert (=> d!129633 (= res!717111 (or (bvsge #b00000000000000000000000000000000 (size!33731 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33731 _keys!1163)))))))

(declare-fun lt!477657 () ListLongMap!14611)

(assert (=> d!129633 (= lt!477669 lt!477657)))

(declare-fun lt!477655 () Unit!35413)

(assert (=> d!129633 (= lt!477655 e!614872)))

(declare-fun c!108133 () Bool)

(declare-fun e!614878 () Bool)

(assert (=> d!129633 (= c!108133 e!614878)))

(declare-fun res!717116 () Bool)

(assert (=> d!129633 (=> (not res!717116) (not e!614878))))

(assert (=> d!129633 (= res!717116 (bvslt #b00000000000000000000000000000000 (size!33731 _keys!1163)))))

(assert (=> d!129633 (= lt!477657 e!614877)))

(declare-fun c!108130 () Bool)

(assert (=> d!129633 (= c!108130 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129633 (validMask!0 mask!1515)))

(assert (=> d!129633 (= (getCurrentListMap!4190 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477669)))

(declare-fun bm!45568 () Bool)

(declare-fun call!45577 () ListLongMap!14611)

(declare-fun call!45572 () ListLongMap!14611)

(assert (=> bm!45568 (= call!45577 call!45572)))

(declare-fun call!45573 () ListLongMap!14611)

(declare-fun bm!45569 () Bool)

(assert (=> bm!45569 (= call!45574 (+!3227 (ite c!108130 call!45572 (ite c!108132 call!45577 call!45573)) (ite (or c!108130 c!108132) (tuple2!16643 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16643 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1075810 () Bool)

(declare-fun e!614874 () Bool)

(assert (=> b!1075810 (= e!614874 (validKeyInArray!0 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45570 () Bool)

(assert (=> bm!45570 (= call!45572 (getCurrentListMapNoExtraKeys!3883 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1075811 () Bool)

(declare-fun Unit!35416 () Unit!35413)

(assert (=> b!1075811 (= e!614872 Unit!35416)))

(declare-fun b!1075812 () Bool)

(declare-fun res!717109 () Bool)

(assert (=> b!1075812 (=> (not res!717109) (not e!614868))))

(assert (=> b!1075812 (= res!717109 e!614880)))

(declare-fun c!108134 () Bool)

(assert (=> b!1075812 (= c!108134 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45571 () Bool)

(declare-fun call!45576 () Bool)

(assert (=> bm!45571 (= call!45576 (contains!6351 lt!477669 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075813 () Bool)

(assert (=> b!1075813 (= e!614869 (= (apply!940 lt!477669 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000)) (get!17240 (select (arr!33196 _values!955) #b00000000000000000000000000000000) (dynLambda!2047 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1075813 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33732 _values!955)))))

(assert (=> b!1075813 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33731 _keys!1163)))))

(declare-fun b!1075814 () Bool)

(declare-fun e!614871 () Bool)

(declare-fun e!614875 () Bool)

(assert (=> b!1075814 (= e!614871 e!614875)))

(declare-fun res!717110 () Bool)

(assert (=> b!1075814 (= res!717110 call!45576)))

(assert (=> b!1075814 (=> (not res!717110) (not e!614875))))

(declare-fun b!1075815 () Bool)

(assert (=> b!1075815 (= e!614871 (not call!45576))))

(declare-fun b!1075816 () Bool)

(assert (=> b!1075816 (= e!614878 (validKeyInArray!0 (select (arr!33195 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45572 () Bool)

(assert (=> bm!45572 (= call!45573 call!45577)))

(declare-fun bm!45573 () Bool)

(declare-fun call!45575 () ListLongMap!14611)

(assert (=> bm!45573 (= call!45575 call!45574)))

(declare-fun b!1075817 () Bool)

(declare-fun e!614879 () ListLongMap!14611)

(assert (=> b!1075817 (= e!614879 call!45573)))

(declare-fun bm!45574 () Bool)

(assert (=> bm!45574 (= call!45571 (contains!6351 lt!477669 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075818 () Bool)

(assert (=> b!1075818 (= e!614875 (= (apply!940 lt!477669 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1075819 () Bool)

(assert (=> b!1075819 (= e!614868 e!614871)))

(declare-fun c!108129 () Bool)

(assert (=> b!1075819 (= c!108129 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1075820 () Bool)

(assert (=> b!1075820 (= e!614879 call!45575)))

(declare-fun b!1075821 () Bool)

(declare-fun res!717117 () Bool)

(assert (=> b!1075821 (=> (not res!717117) (not e!614868))))

(assert (=> b!1075821 (= res!717117 e!614876)))

(declare-fun res!717114 () Bool)

(assert (=> b!1075821 (=> res!717114 e!614876)))

(assert (=> b!1075821 (= res!717114 (not e!614874))))

(declare-fun res!717112 () Bool)

(assert (=> b!1075821 (=> (not res!717112) (not e!614874))))

(assert (=> b!1075821 (= res!717112 (bvslt #b00000000000000000000000000000000 (size!33731 _keys!1163)))))

(declare-fun b!1075822 () Bool)

(assert (=> b!1075822 (= e!614870 call!45575)))

(declare-fun b!1075823 () Bool)

(declare-fun c!108131 () Bool)

(assert (=> b!1075823 (= c!108131 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1075823 (= e!614870 e!614879)))

(assert (= (and d!129633 c!108130) b!1075805))

(assert (= (and d!129633 (not c!108130)) b!1075808))

(assert (= (and b!1075808 c!108132) b!1075822))

(assert (= (and b!1075808 (not c!108132)) b!1075823))

(assert (= (and b!1075823 c!108131) b!1075820))

(assert (= (and b!1075823 (not c!108131)) b!1075817))

(assert (= (or b!1075820 b!1075817) bm!45572))

(assert (= (or b!1075822 bm!45572) bm!45568))

(assert (= (or b!1075822 b!1075820) bm!45573))

(assert (= (or b!1075805 bm!45568) bm!45570))

(assert (= (or b!1075805 bm!45573) bm!45569))

(assert (= (and d!129633 res!717116) b!1075816))

(assert (= (and d!129633 c!108133) b!1075806))

(assert (= (and d!129633 (not c!108133)) b!1075811))

(assert (= (and d!129633 res!717111) b!1075821))

(assert (= (and b!1075821 res!717112) b!1075810))

(assert (= (and b!1075821 (not res!717114)) b!1075804))

(assert (= (and b!1075804 res!717115) b!1075813))

(assert (= (and b!1075821 res!717117) b!1075812))

(assert (= (and b!1075812 c!108134) b!1075809))

(assert (= (and b!1075812 (not c!108134)) b!1075807))

(assert (= (and b!1075809 res!717113) b!1075803))

(assert (= (or b!1075809 b!1075807) bm!45574))

(assert (= (and b!1075812 res!717109) b!1075819))

(assert (= (and b!1075819 c!108129) b!1075814))

(assert (= (and b!1075819 (not c!108129)) b!1075815))

(assert (= (and b!1075814 res!717110) b!1075818))

(assert (= (or b!1075814 b!1075815) bm!45571))

(declare-fun b_lambda!16911 () Bool)

(assert (=> (not b_lambda!16911) (not b!1075813)))

(assert (=> b!1075813 t!32533))

(declare-fun b_and!35171 () Bool)

(assert (= b_and!35169 (and (=> t!32533 result!14833) b_and!35171)))

(assert (=> bm!45570 m!994463))

(declare-fun m!994639 () Bool)

(assert (=> bm!45571 m!994639))

(assert (=> b!1075813 m!994505))

(assert (=> b!1075813 m!994505))

(declare-fun m!994641 () Bool)

(assert (=> b!1075813 m!994641))

(assert (=> b!1075813 m!994525))

(assert (=> b!1075813 m!994523))

(assert (=> b!1075813 m!994525))

(assert (=> b!1075813 m!994523))

(assert (=> b!1075813 m!994527))

(assert (=> b!1075816 m!994505))

(assert (=> b!1075816 m!994505))

(assert (=> b!1075816 m!994509))

(declare-fun m!994643 () Bool)

(assert (=> b!1075818 m!994643))

(assert (=> b!1075810 m!994505))

(assert (=> b!1075810 m!994505))

(assert (=> b!1075810 m!994509))

(declare-fun m!994645 () Bool)

(assert (=> bm!45569 m!994645))

(declare-fun m!994647 () Bool)

(assert (=> bm!45574 m!994647))

(assert (=> b!1075804 m!994505))

(assert (=> b!1075804 m!994505))

(declare-fun m!994649 () Bool)

(assert (=> b!1075804 m!994649))

(declare-fun m!994651 () Bool)

(assert (=> b!1075806 m!994651))

(assert (=> b!1075806 m!994505))

(declare-fun m!994653 () Bool)

(assert (=> b!1075806 m!994653))

(declare-fun m!994655 () Bool)

(assert (=> b!1075806 m!994655))

(declare-fun m!994657 () Bool)

(assert (=> b!1075806 m!994657))

(declare-fun m!994659 () Bool)

(assert (=> b!1075806 m!994659))

(assert (=> b!1075806 m!994659))

(declare-fun m!994661 () Bool)

(assert (=> b!1075806 m!994661))

(declare-fun m!994663 () Bool)

(assert (=> b!1075806 m!994663))

(assert (=> b!1075806 m!994655))

(declare-fun m!994665 () Bool)

(assert (=> b!1075806 m!994665))

(assert (=> b!1075806 m!994663))

(declare-fun m!994667 () Bool)

(assert (=> b!1075806 m!994667))

(declare-fun m!994669 () Bool)

(assert (=> b!1075806 m!994669))

(declare-fun m!994671 () Bool)

(assert (=> b!1075806 m!994671))

(declare-fun m!994673 () Bool)

(assert (=> b!1075806 m!994673))

(declare-fun m!994675 () Bool)

(assert (=> b!1075806 m!994675))

(assert (=> b!1075806 m!994669))

(declare-fun m!994677 () Bool)

(assert (=> b!1075806 m!994677))

(assert (=> b!1075806 m!994463))

(declare-fun m!994679 () Bool)

(assert (=> b!1075806 m!994679))

(declare-fun m!994681 () Bool)

(assert (=> b!1075805 m!994681))

(assert (=> d!129633 m!994455))

(declare-fun m!994683 () Bool)

(assert (=> b!1075803 m!994683))

(assert (=> b!1075626 d!129633))

(declare-fun d!129635 () Bool)

(assert (=> d!129635 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95158 d!129635))

(declare-fun d!129637 () Bool)

(assert (=> d!129637 (= (array_inv!25650 _values!955) (bvsge (size!33732 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95158 d!129637))

(declare-fun d!129639 () Bool)

(assert (=> d!129639 (= (array_inv!25651 _keys!1163) (bvsge (size!33731 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95158 d!129639))

(declare-fun condMapEmpty!40780 () Bool)

(declare-fun mapDefault!40780 () ValueCell!12309)

(assert (=> mapNonEmpty!40774 (= condMapEmpty!40780 (= mapRest!40774 ((as const (Array (_ BitVec 32) ValueCell!12309)) mapDefault!40780)))))

(declare-fun e!614886 () Bool)

(declare-fun mapRes!40780 () Bool)

(assert (=> mapNonEmpty!40774 (= tp!78134 (and e!614886 mapRes!40780))))

(declare-fun b!1075830 () Bool)

(declare-fun e!614885 () Bool)

(assert (=> b!1075830 (= e!614885 tp_is_empty!26025)))

(declare-fun mapIsEmpty!40780 () Bool)

(assert (=> mapIsEmpty!40780 mapRes!40780))

(declare-fun mapNonEmpty!40780 () Bool)

(declare-fun tp!78143 () Bool)

(assert (=> mapNonEmpty!40780 (= mapRes!40780 (and tp!78143 e!614885))))

(declare-fun mapKey!40780 () (_ BitVec 32))

(declare-fun mapValue!40780 () ValueCell!12309)

(declare-fun mapRest!40780 () (Array (_ BitVec 32) ValueCell!12309))

(assert (=> mapNonEmpty!40780 (= mapRest!40774 (store mapRest!40780 mapKey!40780 mapValue!40780))))

(declare-fun b!1075831 () Bool)

(assert (=> b!1075831 (= e!614886 tp_is_empty!26025)))

(assert (= (and mapNonEmpty!40774 condMapEmpty!40780) mapIsEmpty!40780))

(assert (= (and mapNonEmpty!40774 (not condMapEmpty!40780)) mapNonEmpty!40780))

(assert (= (and mapNonEmpty!40780 ((_ is ValueCellFull!12309) mapValue!40780)) b!1075830))

(assert (= (and mapNonEmpty!40774 ((_ is ValueCellFull!12309) mapDefault!40780)) b!1075831))

(declare-fun m!994685 () Bool)

(assert (=> mapNonEmpty!40780 m!994685))

(declare-fun b_lambda!16913 () Bool)

(assert (= b_lambda!16911 (or (and start!95158 b_free!22215) b_lambda!16913)))

(declare-fun b_lambda!16915 () Bool)

(assert (= b_lambda!16903 (or (and start!95158 b_free!22215) b_lambda!16915)))

(declare-fun b_lambda!16917 () Bool)

(assert (= b_lambda!16901 (or (and start!95158 b_free!22215) b_lambda!16917)))

(declare-fun b_lambda!16919 () Bool)

(assert (= b_lambda!16909 (or (and start!95158 b_free!22215) b_lambda!16919)))

(declare-fun b_lambda!16921 () Bool)

(assert (= b_lambda!16907 (or (and start!95158 b_free!22215) b_lambda!16921)))

(declare-fun b_lambda!16923 () Bool)

(assert (= b_lambda!16905 (or (and start!95158 b_free!22215) b_lambda!16923)))

(check-sat (not b!1075799) (not b!1075711) (not b!1075774) (not b!1075713) (not b!1075724) (not d!129623) (not b_lambda!16913) (not bm!45545) (not b!1075776) (not b!1075801) (not d!129631) (not bm!45564) (not b!1075720) (not d!129625) (not b_next!22215) (not d!129621) (not b_lambda!16917) (not b!1075775) (not bm!45571) (not b!1075818) (not b!1075669) (not b!1075800) (not b!1075777) (not b!1075806) (not bm!45570) (not b!1075707) (not d!129629) (not d!129627) (not bm!45546) (not b!1075803) (not b!1075813) (not mapNonEmpty!40780) (not b_lambda!16921) (not b!1075787) (not bm!45562) (not b!1075810) (not bm!45563) b_and!35171 (not b!1075706) (not b!1075716) (not b!1075789) (not bm!45539) (not b!1075681) (not b_lambda!16919) (not b!1075726) (not b!1075730) (not b_lambda!16923) (not b!1075666) (not b_lambda!16915) (not b!1075712) (not b!1075804) (not b!1075781) (not b!1075816) (not b!1075802) (not b!1075784) (not b!1075710) (not b!1075725) (not bm!45569) (not b!1075727) (not b!1075721) (not b!1075709) (not bm!45567) (not b!1075723) (not b!1075665) tp_is_empty!26025 (not b!1075805) (not d!129633) (not bm!45574) (not bm!45542) (not b!1075680))
(check-sat b_and!35171 (not b_next!22215))
