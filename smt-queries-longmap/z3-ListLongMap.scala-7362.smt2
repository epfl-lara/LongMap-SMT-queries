; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93878 () Bool)

(assert start!93878)

(declare-fun b_free!21351 () Bool)

(declare-fun b_next!21351 () Bool)

(assert (=> start!93878 (= b_free!21351 (not b_next!21351))))

(declare-fun tp!75475 () Bool)

(declare-fun b_and!34065 () Bool)

(assert (=> start!93878 (= tp!75475 b_and!34065)))

(declare-fun b!1061747 () Bool)

(declare-fun e!604665 () Bool)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67325 0))(
  ( (array!67326 (arr!32370 (Array (_ BitVec 32) (_ BitVec 64))) (size!32906 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67325)

(assert (=> b!1061747 (= e!604665 (not (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!32906 _keys!1163)))))))

(declare-datatypes ((V!38683 0))(
  ( (V!38684 (val!12631 Int)) )
))
(declare-datatypes ((tuple2!15968 0))(
  ( (tuple2!15969 (_1!7995 (_ BitVec 64)) (_2!7995 V!38683)) )
))
(declare-datatypes ((List!22552 0))(
  ( (Nil!22549) (Cons!22548 (h!23757 tuple2!15968) (t!31861 List!22552)) )
))
(declare-datatypes ((ListLongMap!13937 0))(
  ( (ListLongMap!13938 (toList!6984 List!22552)) )
))
(declare-fun lt!467730 () ListLongMap!13937)

(declare-fun lt!467729 () ListLongMap!13937)

(assert (=> b!1061747 (= lt!467730 lt!467729)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38683)

(declare-datatypes ((Unit!34770 0))(
  ( (Unit!34771) )
))
(declare-fun lt!467731 () Unit!34770)

(declare-datatypes ((ValueCell!11877 0))(
  ( (ValueCellFull!11877 (v!15241 V!38683)) (EmptyCell!11877) )
))
(declare-datatypes ((array!67327 0))(
  ( (array!67328 (arr!32371 (Array (_ BitVec 32) ValueCell!11877)) (size!32907 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67327)

(declare-fun minValue!907 () V!38683)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38683)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!623 (array!67325 array!67327 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38683 V!38683 V!38683 V!38683 (_ BitVec 32) Int) Unit!34770)

(assert (=> b!1061747 (= lt!467731 (lemmaNoChangeToArrayThenSameMapNoExtras!623 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3586 (array!67325 array!67327 (_ BitVec 32) (_ BitVec 32) V!38683 V!38683 (_ BitVec 32) Int) ListLongMap!13937)

(assert (=> b!1061747 (= lt!467729 (getCurrentListMapNoExtraKeys!3586 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061747 (= lt!467730 (getCurrentListMapNoExtraKeys!3586 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061748 () Bool)

(declare-fun res!708998 () Bool)

(assert (=> b!1061748 (=> (not res!708998) (not e!604665))))

(assert (=> b!1061748 (= res!708998 (and (= (size!32907 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32906 _keys!1163) (size!32907 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061749 () Bool)

(declare-fun res!708999 () Bool)

(assert (=> b!1061749 (=> (not res!708999) (not e!604665))))

(declare-datatypes ((List!22553 0))(
  ( (Nil!22550) (Cons!22549 (h!23758 (_ BitVec 64)) (t!31862 List!22553)) )
))
(declare-fun arrayNoDuplicates!0 (array!67325 (_ BitVec 32) List!22553) Bool)

(assert (=> b!1061749 (= res!708999 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22550))))

(declare-fun b!1061750 () Bool)

(declare-fun e!604668 () Bool)

(declare-fun e!604666 () Bool)

(declare-fun mapRes!39412 () Bool)

(assert (=> b!1061750 (= e!604668 (and e!604666 mapRes!39412))))

(declare-fun condMapEmpty!39412 () Bool)

(declare-fun mapDefault!39412 () ValueCell!11877)

(assert (=> b!1061750 (= condMapEmpty!39412 (= (arr!32371 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11877)) mapDefault!39412)))))

(declare-fun b!1061751 () Bool)

(declare-fun tp_is_empty!25161 () Bool)

(assert (=> b!1061751 (= e!604666 tp_is_empty!25161)))

(declare-fun b!1061752 () Bool)

(declare-fun res!709000 () Bool)

(assert (=> b!1061752 (=> (not res!709000) (not e!604665))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67325 (_ BitVec 32)) Bool)

(assert (=> b!1061752 (= res!709000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061753 () Bool)

(declare-fun e!604667 () Bool)

(assert (=> b!1061753 (= e!604667 tp_is_empty!25161)))

(declare-fun mapIsEmpty!39412 () Bool)

(assert (=> mapIsEmpty!39412 mapRes!39412))

(declare-fun res!708997 () Bool)

(assert (=> start!93878 (=> (not res!708997) (not e!604665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93878 (= res!708997 (validMask!0 mask!1515))))

(assert (=> start!93878 e!604665))

(assert (=> start!93878 true))

(assert (=> start!93878 tp_is_empty!25161))

(declare-fun array_inv!25080 (array!67327) Bool)

(assert (=> start!93878 (and (array_inv!25080 _values!955) e!604668)))

(assert (=> start!93878 tp!75475))

(declare-fun array_inv!25081 (array!67325) Bool)

(assert (=> start!93878 (array_inv!25081 _keys!1163)))

(declare-fun mapNonEmpty!39412 () Bool)

(declare-fun tp!75476 () Bool)

(assert (=> mapNonEmpty!39412 (= mapRes!39412 (and tp!75476 e!604667))))

(declare-fun mapKey!39412 () (_ BitVec 32))

(declare-fun mapValue!39412 () ValueCell!11877)

(declare-fun mapRest!39412 () (Array (_ BitVec 32) ValueCell!11877))

(assert (=> mapNonEmpty!39412 (= (arr!32371 _values!955) (store mapRest!39412 mapKey!39412 mapValue!39412))))

(assert (= (and start!93878 res!708997) b!1061748))

(assert (= (and b!1061748 res!708998) b!1061752))

(assert (= (and b!1061752 res!709000) b!1061749))

(assert (= (and b!1061749 res!708999) b!1061747))

(assert (= (and b!1061750 condMapEmpty!39412) mapIsEmpty!39412))

(assert (= (and b!1061750 (not condMapEmpty!39412)) mapNonEmpty!39412))

(get-info :version)

(assert (= (and mapNonEmpty!39412 ((_ is ValueCellFull!11877) mapValue!39412)) b!1061753))

(assert (= (and b!1061750 ((_ is ValueCellFull!11877) mapDefault!39412)) b!1061751))

(assert (= start!93878 b!1061750))

(declare-fun m!980553 () Bool)

(assert (=> b!1061747 m!980553))

(declare-fun m!980555 () Bool)

(assert (=> b!1061747 m!980555))

(declare-fun m!980557 () Bool)

(assert (=> b!1061747 m!980557))

(declare-fun m!980559 () Bool)

(assert (=> b!1061749 m!980559))

(declare-fun m!980561 () Bool)

(assert (=> start!93878 m!980561))

(declare-fun m!980563 () Bool)

(assert (=> start!93878 m!980563))

(declare-fun m!980565 () Bool)

(assert (=> start!93878 m!980565))

(declare-fun m!980567 () Bool)

(assert (=> b!1061752 m!980567))

(declare-fun m!980569 () Bool)

(assert (=> mapNonEmpty!39412 m!980569))

(check-sat (not b!1061747) (not b!1061749) tp_is_empty!25161 (not mapNonEmpty!39412) b_and!34065 (not start!93878) (not b_next!21351) (not b!1061752))
(check-sat b_and!34065 (not b_next!21351))
(get-model)

(declare-fun d!128827 () Bool)

(assert (=> d!128827 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!93878 d!128827))

(declare-fun d!128829 () Bool)

(assert (=> d!128829 (= (array_inv!25080 _values!955) (bvsge (size!32907 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!93878 d!128829))

(declare-fun d!128831 () Bool)

(assert (=> d!128831 (= (array_inv!25081 _keys!1163) (bvsge (size!32906 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!93878 d!128831))

(declare-fun d!128833 () Bool)

(assert (=> d!128833 (= (getCurrentListMapNoExtraKeys!3586 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3586 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!467743 () Unit!34770)

(declare-fun choose!1723 (array!67325 array!67327 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38683 V!38683 V!38683 V!38683 (_ BitVec 32) Int) Unit!34770)

(assert (=> d!128833 (= lt!467743 (choose!1723 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!128833 (validMask!0 mask!1515)))

(assert (=> d!128833 (= (lemmaNoChangeToArrayThenSameMapNoExtras!623 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!467743)))

(declare-fun bs!31210 () Bool)

(assert (= bs!31210 d!128833))

(assert (=> bs!31210 m!980557))

(assert (=> bs!31210 m!980555))

(declare-fun m!980589 () Bool)

(assert (=> bs!31210 m!980589))

(assert (=> bs!31210 m!980561))

(assert (=> b!1061747 d!128833))

(declare-fun b!1061799 () Bool)

(declare-fun e!604699 () Bool)

(declare-fun e!604701 () Bool)

(assert (=> b!1061799 (= e!604699 e!604701)))

(declare-fun c!107229 () Bool)

(assert (=> b!1061799 (= c!107229 (bvslt #b00000000000000000000000000000000 (size!32906 _keys!1163)))))

(declare-fun b!1061800 () Bool)

(declare-fun res!709021 () Bool)

(declare-fun e!604698 () Bool)

(assert (=> b!1061800 (=> (not res!709021) (not e!604698))))

(declare-fun lt!467758 () ListLongMap!13937)

(declare-fun contains!6220 (ListLongMap!13937 (_ BitVec 64)) Bool)

(assert (=> b!1061800 (= res!709021 (not (contains!6220 lt!467758 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!128835 () Bool)

(assert (=> d!128835 e!604698))

(declare-fun res!709023 () Bool)

(assert (=> d!128835 (=> (not res!709023) (not e!604698))))

(assert (=> d!128835 (= res!709023 (not (contains!6220 lt!467758 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!604703 () ListLongMap!13937)

(assert (=> d!128835 (= lt!467758 e!604703)))

(declare-fun c!107227 () Bool)

(assert (=> d!128835 (= c!107227 (bvsge #b00000000000000000000000000000000 (size!32906 _keys!1163)))))

(assert (=> d!128835 (validMask!0 mask!1515)))

(assert (=> d!128835 (= (getCurrentListMapNoExtraKeys!3586 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!467758)))

(declare-fun call!44902 () ListLongMap!13937)

(declare-fun bm!44899 () Bool)

(assert (=> bm!44899 (= call!44902 (getCurrentListMapNoExtraKeys!3586 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1061801 () Bool)

(declare-fun e!604702 () ListLongMap!13937)

(assert (=> b!1061801 (= e!604703 e!604702)))

(declare-fun c!107228 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1061801 (= c!107228 (validKeyInArray!0 (select (arr!32370 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1061802 () Bool)

(assert (=> b!1061802 (= e!604703 (ListLongMap!13938 Nil!22549))))

(declare-fun b!1061803 () Bool)

(assert (=> b!1061803 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32906 _keys!1163)))))

(assert (=> b!1061803 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32907 _values!955)))))

(declare-fun e!604704 () Bool)

(declare-fun apply!918 (ListLongMap!13937 (_ BitVec 64)) V!38683)

(declare-fun get!16930 (ValueCell!11877 V!38683) V!38683)

(declare-fun dynLambda!2025 (Int (_ BitVec 64)) V!38683)

(assert (=> b!1061803 (= e!604704 (= (apply!918 lt!467758 (select (arr!32370 _keys!1163) #b00000000000000000000000000000000)) (get!16930 (select (arr!32371 _values!955) #b00000000000000000000000000000000) (dynLambda!2025 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1061804 () Bool)

(assert (=> b!1061804 (= e!604701 (= lt!467758 (getCurrentListMapNoExtraKeys!3586 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1061805 () Bool)

(assert (=> b!1061805 (= e!604702 call!44902)))

(declare-fun b!1061806 () Bool)

(declare-fun isEmpty!936 (ListLongMap!13937) Bool)

(assert (=> b!1061806 (= e!604701 (isEmpty!936 lt!467758))))

(declare-fun b!1061807 () Bool)

(assert (=> b!1061807 (= e!604699 e!604704)))

(assert (=> b!1061807 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32906 _keys!1163)))))

(declare-fun res!709022 () Bool)

(assert (=> b!1061807 (= res!709022 (contains!6220 lt!467758 (select (arr!32370 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1061807 (=> (not res!709022) (not e!604704))))

(declare-fun b!1061808 () Bool)

(declare-fun e!604700 () Bool)

(assert (=> b!1061808 (= e!604700 (validKeyInArray!0 (select (arr!32370 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1061808 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1061809 () Bool)

(assert (=> b!1061809 (= e!604698 e!604699)))

(declare-fun c!107226 () Bool)

(assert (=> b!1061809 (= c!107226 e!604700)))

(declare-fun res!709024 () Bool)

(assert (=> b!1061809 (=> (not res!709024) (not e!604700))))

(assert (=> b!1061809 (= res!709024 (bvslt #b00000000000000000000000000000000 (size!32906 _keys!1163)))))

(declare-fun b!1061810 () Bool)

(declare-fun lt!467760 () Unit!34770)

(declare-fun lt!467764 () Unit!34770)

(assert (=> b!1061810 (= lt!467760 lt!467764)))

(declare-fun lt!467761 () (_ BitVec 64))

(declare-fun lt!467762 () V!38683)

(declare-fun lt!467759 () ListLongMap!13937)

(declare-fun lt!467763 () (_ BitVec 64))

(declare-fun +!3116 (ListLongMap!13937 tuple2!15968) ListLongMap!13937)

(assert (=> b!1061810 (not (contains!6220 (+!3116 lt!467759 (tuple2!15969 lt!467761 lt!467762)) lt!467763))))

(declare-fun addStillNotContains!246 (ListLongMap!13937 (_ BitVec 64) V!38683 (_ BitVec 64)) Unit!34770)

(assert (=> b!1061810 (= lt!467764 (addStillNotContains!246 lt!467759 lt!467761 lt!467762 lt!467763))))

(assert (=> b!1061810 (= lt!467763 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1061810 (= lt!467762 (get!16930 (select (arr!32371 _values!955) #b00000000000000000000000000000000) (dynLambda!2025 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1061810 (= lt!467761 (select (arr!32370 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1061810 (= lt!467759 call!44902)))

(assert (=> b!1061810 (= e!604702 (+!3116 call!44902 (tuple2!15969 (select (arr!32370 _keys!1163) #b00000000000000000000000000000000) (get!16930 (select (arr!32371 _values!955) #b00000000000000000000000000000000) (dynLambda!2025 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!128835 c!107227) b!1061802))

(assert (= (and d!128835 (not c!107227)) b!1061801))

(assert (= (and b!1061801 c!107228) b!1061810))

(assert (= (and b!1061801 (not c!107228)) b!1061805))

(assert (= (or b!1061810 b!1061805) bm!44899))

(assert (= (and d!128835 res!709023) b!1061800))

(assert (= (and b!1061800 res!709021) b!1061809))

(assert (= (and b!1061809 res!709024) b!1061808))

(assert (= (and b!1061809 c!107226) b!1061807))

(assert (= (and b!1061809 (not c!107226)) b!1061799))

(assert (= (and b!1061807 res!709022) b!1061803))

(assert (= (and b!1061799 c!107229) b!1061804))

(assert (= (and b!1061799 (not c!107229)) b!1061806))

(declare-fun b_lambda!16445 () Bool)

(assert (=> (not b_lambda!16445) (not b!1061803)))

(declare-fun t!31864 () Bool)

(declare-fun tb!7131 () Bool)

(assert (=> (and start!93878 (= defaultEntry!963 defaultEntry!963) t!31864) tb!7131))

(declare-fun result!14701 () Bool)

(assert (=> tb!7131 (= result!14701 tp_is_empty!25161)))

(assert (=> b!1061803 t!31864))

(declare-fun b_and!34069 () Bool)

(assert (= b_and!34065 (and (=> t!31864 result!14701) b_and!34069)))

(declare-fun b_lambda!16447 () Bool)

(assert (=> (not b_lambda!16447) (not b!1061810)))

(assert (=> b!1061810 t!31864))

(declare-fun b_and!34071 () Bool)

(assert (= b_and!34069 (and (=> t!31864 result!14701) b_and!34071)))

(declare-fun m!980591 () Bool)

(assert (=> b!1061808 m!980591))

(assert (=> b!1061808 m!980591))

(declare-fun m!980593 () Bool)

(assert (=> b!1061808 m!980593))

(assert (=> b!1061801 m!980591))

(assert (=> b!1061801 m!980591))

(assert (=> b!1061801 m!980593))

(assert (=> b!1061807 m!980591))

(assert (=> b!1061807 m!980591))

(declare-fun m!980595 () Bool)

(assert (=> b!1061807 m!980595))

(declare-fun m!980597 () Bool)

(assert (=> b!1061806 m!980597))

(declare-fun m!980599 () Bool)

(assert (=> b!1061800 m!980599))

(assert (=> b!1061803 m!980591))

(declare-fun m!980601 () Bool)

(assert (=> b!1061803 m!980601))

(declare-fun m!980603 () Bool)

(assert (=> b!1061803 m!980603))

(declare-fun m!980605 () Bool)

(assert (=> b!1061803 m!980605))

(assert (=> b!1061803 m!980603))

(declare-fun m!980607 () Bool)

(assert (=> b!1061803 m!980607))

(assert (=> b!1061803 m!980605))

(assert (=> b!1061803 m!980591))

(declare-fun m!980609 () Bool)

(assert (=> d!128835 m!980609))

(assert (=> d!128835 m!980561))

(declare-fun m!980611 () Bool)

(assert (=> b!1061804 m!980611))

(assert (=> b!1061810 m!980603))

(assert (=> b!1061810 m!980605))

(assert (=> b!1061810 m!980603))

(assert (=> b!1061810 m!980607))

(assert (=> b!1061810 m!980605))

(declare-fun m!980613 () Bool)

(assert (=> b!1061810 m!980613))

(assert (=> b!1061810 m!980591))

(assert (=> b!1061810 m!980613))

(declare-fun m!980615 () Bool)

(assert (=> b!1061810 m!980615))

(declare-fun m!980617 () Bool)

(assert (=> b!1061810 m!980617))

(declare-fun m!980619 () Bool)

(assert (=> b!1061810 m!980619))

(assert (=> bm!44899 m!980611))

(assert (=> b!1061747 d!128835))

(declare-fun b!1061813 () Bool)

(declare-fun e!604706 () Bool)

(declare-fun e!604708 () Bool)

(assert (=> b!1061813 (= e!604706 e!604708)))

(declare-fun c!107233 () Bool)

(assert (=> b!1061813 (= c!107233 (bvslt #b00000000000000000000000000000000 (size!32906 _keys!1163)))))

(declare-fun b!1061814 () Bool)

(declare-fun res!709025 () Bool)

(declare-fun e!604705 () Bool)

(assert (=> b!1061814 (=> (not res!709025) (not e!604705))))

(declare-fun lt!467765 () ListLongMap!13937)

(assert (=> b!1061814 (= res!709025 (not (contains!6220 lt!467765 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!128837 () Bool)

(assert (=> d!128837 e!604705))

(declare-fun res!709027 () Bool)

(assert (=> d!128837 (=> (not res!709027) (not e!604705))))

(assert (=> d!128837 (= res!709027 (not (contains!6220 lt!467765 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!604710 () ListLongMap!13937)

(assert (=> d!128837 (= lt!467765 e!604710)))

(declare-fun c!107231 () Bool)

(assert (=> d!128837 (= c!107231 (bvsge #b00000000000000000000000000000000 (size!32906 _keys!1163)))))

(assert (=> d!128837 (validMask!0 mask!1515)))

(assert (=> d!128837 (= (getCurrentListMapNoExtraKeys!3586 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!467765)))

(declare-fun call!44903 () ListLongMap!13937)

(declare-fun bm!44900 () Bool)

(assert (=> bm!44900 (= call!44903 (getCurrentListMapNoExtraKeys!3586 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1061815 () Bool)

(declare-fun e!604709 () ListLongMap!13937)

(assert (=> b!1061815 (= e!604710 e!604709)))

(declare-fun c!107232 () Bool)

(assert (=> b!1061815 (= c!107232 (validKeyInArray!0 (select (arr!32370 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1061816 () Bool)

(assert (=> b!1061816 (= e!604710 (ListLongMap!13938 Nil!22549))))

(declare-fun b!1061817 () Bool)

(assert (=> b!1061817 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32906 _keys!1163)))))

(assert (=> b!1061817 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32907 _values!955)))))

(declare-fun e!604711 () Bool)

(assert (=> b!1061817 (= e!604711 (= (apply!918 lt!467765 (select (arr!32370 _keys!1163) #b00000000000000000000000000000000)) (get!16930 (select (arr!32371 _values!955) #b00000000000000000000000000000000) (dynLambda!2025 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1061818 () Bool)

(assert (=> b!1061818 (= e!604708 (= lt!467765 (getCurrentListMapNoExtraKeys!3586 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1061819 () Bool)

(assert (=> b!1061819 (= e!604709 call!44903)))

(declare-fun b!1061820 () Bool)

(assert (=> b!1061820 (= e!604708 (isEmpty!936 lt!467765))))

(declare-fun b!1061821 () Bool)

(assert (=> b!1061821 (= e!604706 e!604711)))

(assert (=> b!1061821 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32906 _keys!1163)))))

(declare-fun res!709026 () Bool)

(assert (=> b!1061821 (= res!709026 (contains!6220 lt!467765 (select (arr!32370 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1061821 (=> (not res!709026) (not e!604711))))

(declare-fun b!1061822 () Bool)

(declare-fun e!604707 () Bool)

(assert (=> b!1061822 (= e!604707 (validKeyInArray!0 (select (arr!32370 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1061822 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1061823 () Bool)

(assert (=> b!1061823 (= e!604705 e!604706)))

(declare-fun c!107230 () Bool)

(assert (=> b!1061823 (= c!107230 e!604707)))

(declare-fun res!709028 () Bool)

(assert (=> b!1061823 (=> (not res!709028) (not e!604707))))

(assert (=> b!1061823 (= res!709028 (bvslt #b00000000000000000000000000000000 (size!32906 _keys!1163)))))

(declare-fun b!1061824 () Bool)

(declare-fun lt!467767 () Unit!34770)

(declare-fun lt!467771 () Unit!34770)

(assert (=> b!1061824 (= lt!467767 lt!467771)))

(declare-fun lt!467766 () ListLongMap!13937)

(declare-fun lt!467768 () (_ BitVec 64))

(declare-fun lt!467770 () (_ BitVec 64))

(declare-fun lt!467769 () V!38683)

(assert (=> b!1061824 (not (contains!6220 (+!3116 lt!467766 (tuple2!15969 lt!467768 lt!467769)) lt!467770))))

(assert (=> b!1061824 (= lt!467771 (addStillNotContains!246 lt!467766 lt!467768 lt!467769 lt!467770))))

(assert (=> b!1061824 (= lt!467770 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1061824 (= lt!467769 (get!16930 (select (arr!32371 _values!955) #b00000000000000000000000000000000) (dynLambda!2025 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1061824 (= lt!467768 (select (arr!32370 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1061824 (= lt!467766 call!44903)))

(assert (=> b!1061824 (= e!604709 (+!3116 call!44903 (tuple2!15969 (select (arr!32370 _keys!1163) #b00000000000000000000000000000000) (get!16930 (select (arr!32371 _values!955) #b00000000000000000000000000000000) (dynLambda!2025 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!128837 c!107231) b!1061816))

(assert (= (and d!128837 (not c!107231)) b!1061815))

(assert (= (and b!1061815 c!107232) b!1061824))

(assert (= (and b!1061815 (not c!107232)) b!1061819))

(assert (= (or b!1061824 b!1061819) bm!44900))

(assert (= (and d!128837 res!709027) b!1061814))

(assert (= (and b!1061814 res!709025) b!1061823))

(assert (= (and b!1061823 res!709028) b!1061822))

(assert (= (and b!1061823 c!107230) b!1061821))

(assert (= (and b!1061823 (not c!107230)) b!1061813))

(assert (= (and b!1061821 res!709026) b!1061817))

(assert (= (and b!1061813 c!107233) b!1061818))

(assert (= (and b!1061813 (not c!107233)) b!1061820))

(declare-fun b_lambda!16449 () Bool)

(assert (=> (not b_lambda!16449) (not b!1061817)))

(assert (=> b!1061817 t!31864))

(declare-fun b_and!34073 () Bool)

(assert (= b_and!34071 (and (=> t!31864 result!14701) b_and!34073)))

(declare-fun b_lambda!16451 () Bool)

(assert (=> (not b_lambda!16451) (not b!1061824)))

(assert (=> b!1061824 t!31864))

(declare-fun b_and!34075 () Bool)

(assert (= b_and!34073 (and (=> t!31864 result!14701) b_and!34075)))

(assert (=> b!1061822 m!980591))

(assert (=> b!1061822 m!980591))

(assert (=> b!1061822 m!980593))

(assert (=> b!1061815 m!980591))

(assert (=> b!1061815 m!980591))

(assert (=> b!1061815 m!980593))

(assert (=> b!1061821 m!980591))

(assert (=> b!1061821 m!980591))

(declare-fun m!980621 () Bool)

(assert (=> b!1061821 m!980621))

(declare-fun m!980623 () Bool)

(assert (=> b!1061820 m!980623))

(declare-fun m!980625 () Bool)

(assert (=> b!1061814 m!980625))

(assert (=> b!1061817 m!980591))

(declare-fun m!980627 () Bool)

(assert (=> b!1061817 m!980627))

(assert (=> b!1061817 m!980603))

(assert (=> b!1061817 m!980605))

(assert (=> b!1061817 m!980603))

(assert (=> b!1061817 m!980607))

(assert (=> b!1061817 m!980605))

(assert (=> b!1061817 m!980591))

(declare-fun m!980629 () Bool)

(assert (=> d!128837 m!980629))

(assert (=> d!128837 m!980561))

(declare-fun m!980631 () Bool)

(assert (=> b!1061818 m!980631))

(assert (=> b!1061824 m!980603))

(assert (=> b!1061824 m!980605))

(assert (=> b!1061824 m!980603))

(assert (=> b!1061824 m!980607))

(assert (=> b!1061824 m!980605))

(declare-fun m!980633 () Bool)

(assert (=> b!1061824 m!980633))

(assert (=> b!1061824 m!980591))

(assert (=> b!1061824 m!980633))

(declare-fun m!980635 () Bool)

(assert (=> b!1061824 m!980635))

(declare-fun m!980637 () Bool)

(assert (=> b!1061824 m!980637))

(declare-fun m!980639 () Bool)

(assert (=> b!1061824 m!980639))

(assert (=> bm!44900 m!980631))

(assert (=> b!1061747 d!128837))

(declare-fun b!1061833 () Bool)

(declare-fun e!604719 () Bool)

(declare-fun call!44906 () Bool)

(assert (=> b!1061833 (= e!604719 call!44906)))

(declare-fun d!128839 () Bool)

(declare-fun res!709034 () Bool)

(declare-fun e!604718 () Bool)

(assert (=> d!128839 (=> res!709034 e!604718)))

(assert (=> d!128839 (= res!709034 (bvsge #b00000000000000000000000000000000 (size!32906 _keys!1163)))))

(assert (=> d!128839 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!604718)))

(declare-fun b!1061834 () Bool)

(declare-fun e!604720 () Bool)

(assert (=> b!1061834 (= e!604718 e!604720)))

(declare-fun c!107236 () Bool)

(assert (=> b!1061834 (= c!107236 (validKeyInArray!0 (select (arr!32370 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1061835 () Bool)

(assert (=> b!1061835 (= e!604720 e!604719)))

(declare-fun lt!467778 () (_ BitVec 64))

(assert (=> b!1061835 (= lt!467778 (select (arr!32370 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!467780 () Unit!34770)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!67325 (_ BitVec 64) (_ BitVec 32)) Unit!34770)

(assert (=> b!1061835 (= lt!467780 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!467778 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!67325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1061835 (arrayContainsKey!0 _keys!1163 lt!467778 #b00000000000000000000000000000000)))

(declare-fun lt!467779 () Unit!34770)

(assert (=> b!1061835 (= lt!467779 lt!467780)))

(declare-fun res!709033 () Bool)

(declare-datatypes ((SeekEntryResult!9871 0))(
  ( (MissingZero!9871 (index!41855 (_ BitVec 32))) (Found!9871 (index!41856 (_ BitVec 32))) (Intermediate!9871 (undefined!10683 Bool) (index!41857 (_ BitVec 32)) (x!94986 (_ BitVec 32))) (Undefined!9871) (MissingVacant!9871 (index!41858 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!67325 (_ BitVec 32)) SeekEntryResult!9871)

(assert (=> b!1061835 (= res!709033 (= (seekEntryOrOpen!0 (select (arr!32370 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9871 #b00000000000000000000000000000000)))))

(assert (=> b!1061835 (=> (not res!709033) (not e!604719))))

(declare-fun b!1061836 () Bool)

(assert (=> b!1061836 (= e!604720 call!44906)))

(declare-fun bm!44903 () Bool)

(assert (=> bm!44903 (= call!44906 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(assert (= (and d!128839 (not res!709034)) b!1061834))

(assert (= (and b!1061834 c!107236) b!1061835))

(assert (= (and b!1061834 (not c!107236)) b!1061836))

(assert (= (and b!1061835 res!709033) b!1061833))

(assert (= (or b!1061833 b!1061836) bm!44903))

(assert (=> b!1061834 m!980591))

(assert (=> b!1061834 m!980591))

(assert (=> b!1061834 m!980593))

(assert (=> b!1061835 m!980591))

(declare-fun m!980641 () Bool)

(assert (=> b!1061835 m!980641))

(declare-fun m!980643 () Bool)

(assert (=> b!1061835 m!980643))

(assert (=> b!1061835 m!980591))

(declare-fun m!980645 () Bool)

(assert (=> b!1061835 m!980645))

(declare-fun m!980647 () Bool)

(assert (=> bm!44903 m!980647))

(assert (=> b!1061752 d!128839))

(declare-fun b!1061847 () Bool)

(declare-fun e!604731 () Bool)

(declare-fun e!604730 () Bool)

(assert (=> b!1061847 (= e!604731 e!604730)))

(declare-fun c!107239 () Bool)

(assert (=> b!1061847 (= c!107239 (validKeyInArray!0 (select (arr!32370 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!44906 () Bool)

(declare-fun call!44909 () Bool)

(assert (=> bm!44906 (= call!44909 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107239 (Cons!22549 (select (arr!32370 _keys!1163) #b00000000000000000000000000000000) Nil!22550) Nil!22550)))))

(declare-fun d!128841 () Bool)

(declare-fun res!709042 () Bool)

(declare-fun e!604732 () Bool)

(assert (=> d!128841 (=> res!709042 e!604732)))

(assert (=> d!128841 (= res!709042 (bvsge #b00000000000000000000000000000000 (size!32906 _keys!1163)))))

(assert (=> d!128841 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22550) e!604732)))

(declare-fun b!1061848 () Bool)

(assert (=> b!1061848 (= e!604732 e!604731)))

(declare-fun res!709043 () Bool)

(assert (=> b!1061848 (=> (not res!709043) (not e!604731))))

(declare-fun e!604729 () Bool)

(assert (=> b!1061848 (= res!709043 (not e!604729))))

(declare-fun res!709041 () Bool)

(assert (=> b!1061848 (=> (not res!709041) (not e!604729))))

(assert (=> b!1061848 (= res!709041 (validKeyInArray!0 (select (arr!32370 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1061849 () Bool)

(assert (=> b!1061849 (= e!604730 call!44909)))

(declare-fun b!1061850 () Bool)

(declare-fun contains!6221 (List!22553 (_ BitVec 64)) Bool)

(assert (=> b!1061850 (= e!604729 (contains!6221 Nil!22550 (select (arr!32370 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1061851 () Bool)

(assert (=> b!1061851 (= e!604730 call!44909)))

(assert (= (and d!128841 (not res!709042)) b!1061848))

(assert (= (and b!1061848 res!709041) b!1061850))

(assert (= (and b!1061848 res!709043) b!1061847))

(assert (= (and b!1061847 c!107239) b!1061849))

(assert (= (and b!1061847 (not c!107239)) b!1061851))

(assert (= (or b!1061849 b!1061851) bm!44906))

(assert (=> b!1061847 m!980591))

(assert (=> b!1061847 m!980591))

(assert (=> b!1061847 m!980593))

(assert (=> bm!44906 m!980591))

(declare-fun m!980649 () Bool)

(assert (=> bm!44906 m!980649))

(assert (=> b!1061848 m!980591))

(assert (=> b!1061848 m!980591))

(assert (=> b!1061848 m!980593))

(assert (=> b!1061850 m!980591))

(assert (=> b!1061850 m!980591))

(declare-fun m!980651 () Bool)

(assert (=> b!1061850 m!980651))

(assert (=> b!1061749 d!128841))

(declare-fun mapNonEmpty!39418 () Bool)

(declare-fun mapRes!39418 () Bool)

(declare-fun tp!75485 () Bool)

(declare-fun e!604738 () Bool)

(assert (=> mapNonEmpty!39418 (= mapRes!39418 (and tp!75485 e!604738))))

(declare-fun mapKey!39418 () (_ BitVec 32))

(declare-fun mapValue!39418 () ValueCell!11877)

(declare-fun mapRest!39418 () (Array (_ BitVec 32) ValueCell!11877))

(assert (=> mapNonEmpty!39418 (= mapRest!39412 (store mapRest!39418 mapKey!39418 mapValue!39418))))

(declare-fun condMapEmpty!39418 () Bool)

(declare-fun mapDefault!39418 () ValueCell!11877)

(assert (=> mapNonEmpty!39412 (= condMapEmpty!39418 (= mapRest!39412 ((as const (Array (_ BitVec 32) ValueCell!11877)) mapDefault!39418)))))

(declare-fun e!604737 () Bool)

(assert (=> mapNonEmpty!39412 (= tp!75476 (and e!604737 mapRes!39418))))

(declare-fun mapIsEmpty!39418 () Bool)

(assert (=> mapIsEmpty!39418 mapRes!39418))

(declare-fun b!1061858 () Bool)

(assert (=> b!1061858 (= e!604738 tp_is_empty!25161)))

(declare-fun b!1061859 () Bool)

(assert (=> b!1061859 (= e!604737 tp_is_empty!25161)))

(assert (= (and mapNonEmpty!39412 condMapEmpty!39418) mapIsEmpty!39418))

(assert (= (and mapNonEmpty!39412 (not condMapEmpty!39418)) mapNonEmpty!39418))

(assert (= (and mapNonEmpty!39418 ((_ is ValueCellFull!11877) mapValue!39418)) b!1061858))

(assert (= (and mapNonEmpty!39412 ((_ is ValueCellFull!11877) mapDefault!39418)) b!1061859))

(declare-fun m!980653 () Bool)

(assert (=> mapNonEmpty!39418 m!980653))

(declare-fun b_lambda!16453 () Bool)

(assert (= b_lambda!16449 (or (and start!93878 b_free!21351) b_lambda!16453)))

(declare-fun b_lambda!16455 () Bool)

(assert (= b_lambda!16451 (or (and start!93878 b_free!21351) b_lambda!16455)))

(declare-fun b_lambda!16457 () Bool)

(assert (= b_lambda!16445 (or (and start!93878 b_free!21351) b_lambda!16457)))

(declare-fun b_lambda!16459 () Bool)

(assert (= b_lambda!16447 (or (and start!93878 b_free!21351) b_lambda!16459)))

(check-sat (not d!128835) (not b_lambda!16457) (not bm!44903) (not b_next!21351) (not b!1061820) (not b_lambda!16453) (not bm!44906) (not b!1061818) (not b!1061824) (not b!1061821) (not b!1061808) (not b!1061850) (not b!1061817) (not b!1061815) (not b!1061810) (not bm!44899) (not b!1061806) (not b!1061804) (not b!1061800) (not b_lambda!16459) (not b!1061847) (not d!128833) tp_is_empty!25161 (not b!1061835) (not bm!44900) (not b!1061803) (not mapNonEmpty!39418) b_and!34075 (not b!1061814) (not b!1061822) (not b_lambda!16455) (not d!128837) (not b!1061801) (not b!1061807) (not b!1061834) (not b!1061848))
(check-sat b_and!34075 (not b_next!21351))
