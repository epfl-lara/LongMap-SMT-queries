; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41930 () Bool)

(assert start!41930)

(declare-fun b_free!11533 () Bool)

(declare-fun b_next!11533 () Bool)

(assert (=> start!41930 (= b_free!11533 (not b_next!11533))))

(declare-fun tp!40612 () Bool)

(declare-fun b_and!19895 () Bool)

(assert (=> start!41930 (= tp!40612 b_and!19895)))

(declare-fun b!468031 () Bool)

(declare-fun e!273892 () Bool)

(declare-fun tp_is_empty!12961 () Bool)

(assert (=> b!468031 (= e!273892 tp_is_empty!12961)))

(declare-fun mapNonEmpty!21133 () Bool)

(declare-fun mapRes!21133 () Bool)

(declare-fun tp!40611 () Bool)

(declare-fun e!273895 () Bool)

(assert (=> mapNonEmpty!21133 (= mapRes!21133 (and tp!40611 e!273895))))

(declare-datatypes ((V!18387 0))(
  ( (V!18388 (val!6525 Int)) )
))
(declare-datatypes ((ValueCell!6137 0))(
  ( (ValueCellFull!6137 (v!8808 V!18387)) (EmptyCell!6137) )
))
(declare-datatypes ((array!29683 0))(
  ( (array!29684 (arr!14268 (Array (_ BitVec 32) ValueCell!6137)) (size!14621 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29683)

(declare-fun mapValue!21133 () ValueCell!6137)

(declare-fun mapRest!21133 () (Array (_ BitVec 32) ValueCell!6137))

(declare-fun mapKey!21133 () (_ BitVec 32))

(assert (=> mapNonEmpty!21133 (= (arr!14268 _values!833) (store mapRest!21133 mapKey!21133 mapValue!21133))))

(declare-fun b!468032 () Bool)

(declare-fun res!279756 () Bool)

(declare-fun e!273893 () Bool)

(assert (=> b!468032 (=> (not res!279756) (not e!273893))))

(declare-datatypes ((array!29685 0))(
  ( (array!29686 (arr!14269 (Array (_ BitVec 32) (_ BitVec 64))) (size!14622 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29685)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29685 (_ BitVec 32)) Bool)

(assert (=> b!468032 (= res!279756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468033 () Bool)

(declare-fun res!279755 () Bool)

(assert (=> b!468033 (=> (not res!279755) (not e!273893))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!468033 (= res!279755 (and (= (size!14621 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14622 _keys!1025) (size!14621 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!279754 () Bool)

(assert (=> start!41930 (=> (not res!279754) (not e!273893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41930 (= res!279754 (validMask!0 mask!1365))))

(assert (=> start!41930 e!273893))

(assert (=> start!41930 tp_is_empty!12961))

(assert (=> start!41930 tp!40612))

(assert (=> start!41930 true))

(declare-fun array_inv!10384 (array!29685) Bool)

(assert (=> start!41930 (array_inv!10384 _keys!1025)))

(declare-fun e!273894 () Bool)

(declare-fun array_inv!10385 (array!29683) Bool)

(assert (=> start!41930 (and (array_inv!10385 _values!833) e!273894)))

(declare-fun b!468034 () Bool)

(declare-fun e!273890 () Bool)

(assert (=> b!468034 (= e!273890 (bvsle #b00000000000000000000000000000000 (size!14622 _keys!1025)))))

(declare-fun zeroValue!794 () V!18387)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueBefore!38 () V!18387)

(declare-datatypes ((tuple2!8612 0))(
  ( (tuple2!8613 (_1!4317 (_ BitVec 64)) (_2!4317 V!18387)) )
))
(declare-datatypes ((List!8687 0))(
  ( (Nil!8684) (Cons!8683 (h!9539 tuple2!8612) (t!14634 List!8687)) )
))
(declare-datatypes ((ListLongMap!7515 0))(
  ( (ListLongMap!7516 (toList!3773 List!8687)) )
))
(declare-fun lt!211532 () ListLongMap!7515)

(declare-fun getCurrentListMap!2142 (array!29685 array!29683 (_ BitVec 32) (_ BitVec 32) V!18387 V!18387 (_ BitVec 32) Int) ListLongMap!7515)

(assert (=> b!468034 (= lt!211532 (getCurrentListMap!2142 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468035 () Bool)

(assert (=> b!468035 (= e!273893 (not e!273890))))

(declare-fun res!279753 () Bool)

(assert (=> b!468035 (=> res!279753 e!273890)))

(assert (=> b!468035 (= res!279753 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!211531 () ListLongMap!7515)

(declare-fun lt!211530 () ListLongMap!7515)

(assert (=> b!468035 (= lt!211531 lt!211530)))

(declare-datatypes ((Unit!13646 0))(
  ( (Unit!13647) )
))
(declare-fun lt!211533 () Unit!13646)

(declare-fun minValueAfter!38 () V!18387)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!112 (array!29685 array!29683 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18387 V!18387 V!18387 V!18387 (_ BitVec 32) Int) Unit!13646)

(assert (=> b!468035 (= lt!211533 (lemmaNoChangeToArrayThenSameMapNoExtras!112 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1955 (array!29685 array!29683 (_ BitVec 32) (_ BitVec 32) V!18387 V!18387 (_ BitVec 32) Int) ListLongMap!7515)

(assert (=> b!468035 (= lt!211530 (getCurrentListMapNoExtraKeys!1955 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468035 (= lt!211531 (getCurrentListMapNoExtraKeys!1955 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21133 () Bool)

(assert (=> mapIsEmpty!21133 mapRes!21133))

(declare-fun b!468036 () Bool)

(declare-fun res!279757 () Bool)

(assert (=> b!468036 (=> (not res!279757) (not e!273893))))

(declare-datatypes ((List!8688 0))(
  ( (Nil!8685) (Cons!8684 (h!9540 (_ BitVec 64)) (t!14635 List!8688)) )
))
(declare-fun arrayNoDuplicates!0 (array!29685 (_ BitVec 32) List!8688) Bool)

(assert (=> b!468036 (= res!279757 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8685))))

(declare-fun b!468037 () Bool)

(assert (=> b!468037 (= e!273894 (and e!273892 mapRes!21133))))

(declare-fun condMapEmpty!21133 () Bool)

(declare-fun mapDefault!21133 () ValueCell!6137)

(assert (=> b!468037 (= condMapEmpty!21133 (= (arr!14268 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6137)) mapDefault!21133)))))

(declare-fun b!468038 () Bool)

(assert (=> b!468038 (= e!273895 tp_is_empty!12961)))

(assert (= (and start!41930 res!279754) b!468033))

(assert (= (and b!468033 res!279755) b!468032))

(assert (= (and b!468032 res!279756) b!468036))

(assert (= (and b!468036 res!279757) b!468035))

(assert (= (and b!468035 (not res!279753)) b!468034))

(assert (= (and b!468037 condMapEmpty!21133) mapIsEmpty!21133))

(assert (= (and b!468037 (not condMapEmpty!21133)) mapNonEmpty!21133))

(get-info :version)

(assert (= (and mapNonEmpty!21133 ((_ is ValueCellFull!6137) mapValue!21133)) b!468038))

(assert (= (and b!468037 ((_ is ValueCellFull!6137) mapDefault!21133)) b!468031))

(assert (= start!41930 b!468037))

(declare-fun m!449575 () Bool)

(assert (=> b!468034 m!449575))

(declare-fun m!449577 () Bool)

(assert (=> b!468036 m!449577))

(declare-fun m!449579 () Bool)

(assert (=> start!41930 m!449579))

(declare-fun m!449581 () Bool)

(assert (=> start!41930 m!449581))

(declare-fun m!449583 () Bool)

(assert (=> start!41930 m!449583))

(declare-fun m!449585 () Bool)

(assert (=> mapNonEmpty!21133 m!449585))

(declare-fun m!449587 () Bool)

(assert (=> b!468032 m!449587))

(declare-fun m!449589 () Bool)

(assert (=> b!468035 m!449589))

(declare-fun m!449591 () Bool)

(assert (=> b!468035 m!449591))

(declare-fun m!449593 () Bool)

(assert (=> b!468035 m!449593))

(check-sat (not b!468032) (not b!468036) (not start!41930) (not mapNonEmpty!21133) (not b_next!11533) (not b!468034) (not b!468035) tp_is_empty!12961 b_and!19895)
(check-sat b_and!19895 (not b_next!11533))
(get-model)

(declare-fun b!468129 () Bool)

(declare-fun res!279812 () Bool)

(declare-fun e!273967 () Bool)

(assert (=> b!468129 (=> (not res!279812) (not e!273967))))

(declare-fun e!273969 () Bool)

(assert (=> b!468129 (= res!279812 e!273969)))

(declare-fun res!279807 () Bool)

(assert (=> b!468129 (=> res!279807 e!273969)))

(declare-fun e!273960 () Bool)

(assert (=> b!468129 (= res!279807 (not e!273960))))

(declare-fun res!279811 () Bool)

(assert (=> b!468129 (=> (not res!279811) (not e!273960))))

(assert (=> b!468129 (= res!279811 (bvslt #b00000000000000000000000000000000 (size!14622 _keys!1025)))))

(declare-fun c!56752 () Bool)

(declare-fun c!56753 () Bool)

(declare-fun call!30318 () ListLongMap!7515)

(declare-fun bm!30311 () Bool)

(declare-fun call!30315 () ListLongMap!7515)

(declare-fun call!30319 () ListLongMap!7515)

(declare-fun call!30314 () ListLongMap!7515)

(declare-fun +!1708 (ListLongMap!7515 tuple2!8612) ListLongMap!7515)

(assert (=> bm!30311 (= call!30314 (+!1708 (ite c!56752 call!30315 (ite c!56753 call!30318 call!30319)) (ite (or c!56752 c!56753) (tuple2!8613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8613 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun b!468130 () Bool)

(declare-fun e!273959 () Bool)

(declare-fun call!30316 () Bool)

(assert (=> b!468130 (= e!273959 (not call!30316))))

(declare-fun lt!211613 () ListLongMap!7515)

(declare-fun e!273968 () Bool)

(declare-fun b!468131 () Bool)

(declare-fun apply!325 (ListLongMap!7515 (_ BitVec 64)) V!18387)

(declare-fun get!6988 (ValueCell!6137 V!18387) V!18387)

(declare-fun dynLambda!921 (Int (_ BitVec 64)) V!18387)

(assert (=> b!468131 (= e!273968 (= (apply!325 lt!211613 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)) (get!6988 (select (arr!14268 _values!833) #b00000000000000000000000000000000) (dynLambda!921 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!468131 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14621 _values!833)))))

(assert (=> b!468131 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14622 _keys!1025)))))

(declare-fun d!75033 () Bool)

(assert (=> d!75033 e!273967))

(declare-fun res!279810 () Bool)

(assert (=> d!75033 (=> (not res!279810) (not e!273967))))

(assert (=> d!75033 (= res!279810 (or (bvsge #b00000000000000000000000000000000 (size!14622 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14622 _keys!1025)))))))

(declare-fun lt!211618 () ListLongMap!7515)

(assert (=> d!75033 (= lt!211613 lt!211618)))

(declare-fun lt!211606 () Unit!13646)

(declare-fun e!273961 () Unit!13646)

(assert (=> d!75033 (= lt!211606 e!273961)))

(declare-fun c!56757 () Bool)

(declare-fun e!273966 () Bool)

(assert (=> d!75033 (= c!56757 e!273966)))

(declare-fun res!279808 () Bool)

(assert (=> d!75033 (=> (not res!279808) (not e!273966))))

(assert (=> d!75033 (= res!279808 (bvslt #b00000000000000000000000000000000 (size!14622 _keys!1025)))))

(declare-fun e!273958 () ListLongMap!7515)

(assert (=> d!75033 (= lt!211618 e!273958)))

(assert (=> d!75033 (= c!56752 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75033 (validMask!0 mask!1365)))

(assert (=> d!75033 (= (getCurrentListMap!2142 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211613)))

(declare-fun b!468132 () Bool)

(declare-fun e!273965 () Bool)

(declare-fun e!273964 () Bool)

(assert (=> b!468132 (= e!273965 e!273964)))

(declare-fun res!279813 () Bool)

(declare-fun call!30317 () Bool)

(assert (=> b!468132 (= res!279813 call!30317)))

(assert (=> b!468132 (=> (not res!279813) (not e!273964))))

(declare-fun b!468133 () Bool)

(assert (=> b!468133 (= e!273969 e!273968)))

(declare-fun res!279809 () Bool)

(assert (=> b!468133 (=> (not res!279809) (not e!273968))))

(declare-fun contains!2523 (ListLongMap!7515 (_ BitVec 64)) Bool)

(assert (=> b!468133 (= res!279809 (contains!2523 lt!211613 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!468133 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14622 _keys!1025)))))

(declare-fun b!468134 () Bool)

(assert (=> b!468134 (= e!273967 e!273959)))

(declare-fun c!56756 () Bool)

(assert (=> b!468134 (= c!56756 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!468135 () Bool)

(declare-fun e!273970 () ListLongMap!7515)

(assert (=> b!468135 (= e!273970 call!30319)))

(declare-fun bm!30312 () Bool)

(assert (=> bm!30312 (= call!30316 (contains!2523 lt!211613 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!468136 () Bool)

(declare-fun call!30320 () ListLongMap!7515)

(assert (=> b!468136 (= e!273970 call!30320)))

(declare-fun b!468137 () Bool)

(declare-fun c!56755 () Bool)

(assert (=> b!468137 (= c!56755 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!273962 () ListLongMap!7515)

(assert (=> b!468137 (= e!273962 e!273970)))

(declare-fun b!468138 () Bool)

(declare-fun Unit!13648 () Unit!13646)

(assert (=> b!468138 (= e!273961 Unit!13648)))

(declare-fun b!468139 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!468139 (= e!273960 (validKeyInArray!0 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30313 () Bool)

(assert (=> bm!30313 (= call!30320 call!30314)))

(declare-fun b!468140 () Bool)

(declare-fun e!273963 () Bool)

(assert (=> b!468140 (= e!273963 (= (apply!325 lt!211613 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun b!468141 () Bool)

(assert (=> b!468141 (= e!273966 (validKeyInArray!0 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!468142 () Bool)

(declare-fun res!279814 () Bool)

(assert (=> b!468142 (=> (not res!279814) (not e!273967))))

(assert (=> b!468142 (= res!279814 e!273965)))

(declare-fun c!56754 () Bool)

(assert (=> b!468142 (= c!56754 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!30314 () Bool)

(assert (=> bm!30314 (= call!30319 call!30318)))

(declare-fun b!468143 () Bool)

(declare-fun lt!211615 () Unit!13646)

(assert (=> b!468143 (= e!273961 lt!211615)))

(declare-fun lt!211616 () ListLongMap!7515)

(assert (=> b!468143 (= lt!211616 (getCurrentListMapNoExtraKeys!1955 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211602 () (_ BitVec 64))

(assert (=> b!468143 (= lt!211602 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211604 () (_ BitVec 64))

(assert (=> b!468143 (= lt!211604 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211605 () Unit!13646)

(declare-fun addStillContains!287 (ListLongMap!7515 (_ BitVec 64) V!18387 (_ BitVec 64)) Unit!13646)

(assert (=> b!468143 (= lt!211605 (addStillContains!287 lt!211616 lt!211602 zeroValue!794 lt!211604))))

(assert (=> b!468143 (contains!2523 (+!1708 lt!211616 (tuple2!8613 lt!211602 zeroValue!794)) lt!211604)))

(declare-fun lt!211623 () Unit!13646)

(assert (=> b!468143 (= lt!211623 lt!211605)))

(declare-fun lt!211607 () ListLongMap!7515)

(assert (=> b!468143 (= lt!211607 (getCurrentListMapNoExtraKeys!1955 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211608 () (_ BitVec 64))

(assert (=> b!468143 (= lt!211608 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211621 () (_ BitVec 64))

(assert (=> b!468143 (= lt!211621 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211610 () Unit!13646)

(declare-fun addApplyDifferent!287 (ListLongMap!7515 (_ BitVec 64) V!18387 (_ BitVec 64)) Unit!13646)

(assert (=> b!468143 (= lt!211610 (addApplyDifferent!287 lt!211607 lt!211608 minValueBefore!38 lt!211621))))

(assert (=> b!468143 (= (apply!325 (+!1708 lt!211607 (tuple2!8613 lt!211608 minValueBefore!38)) lt!211621) (apply!325 lt!211607 lt!211621))))

(declare-fun lt!211611 () Unit!13646)

(assert (=> b!468143 (= lt!211611 lt!211610)))

(declare-fun lt!211620 () ListLongMap!7515)

(assert (=> b!468143 (= lt!211620 (getCurrentListMapNoExtraKeys!1955 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211622 () (_ BitVec 64))

(assert (=> b!468143 (= lt!211622 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211619 () (_ BitVec 64))

(assert (=> b!468143 (= lt!211619 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211614 () Unit!13646)

(assert (=> b!468143 (= lt!211614 (addApplyDifferent!287 lt!211620 lt!211622 zeroValue!794 lt!211619))))

(assert (=> b!468143 (= (apply!325 (+!1708 lt!211620 (tuple2!8613 lt!211622 zeroValue!794)) lt!211619) (apply!325 lt!211620 lt!211619))))

(declare-fun lt!211612 () Unit!13646)

(assert (=> b!468143 (= lt!211612 lt!211614)))

(declare-fun lt!211609 () ListLongMap!7515)

(assert (=> b!468143 (= lt!211609 (getCurrentListMapNoExtraKeys!1955 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211603 () (_ BitVec 64))

(assert (=> b!468143 (= lt!211603 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211617 () (_ BitVec 64))

(assert (=> b!468143 (= lt!211617 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!468143 (= lt!211615 (addApplyDifferent!287 lt!211609 lt!211603 minValueBefore!38 lt!211617))))

(assert (=> b!468143 (= (apply!325 (+!1708 lt!211609 (tuple2!8613 lt!211603 minValueBefore!38)) lt!211617) (apply!325 lt!211609 lt!211617))))

(declare-fun b!468144 () Bool)

(assert (=> b!468144 (= e!273965 (not call!30317))))

(declare-fun b!468145 () Bool)

(assert (=> b!468145 (= e!273964 (= (apply!325 lt!211613 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun bm!30315 () Bool)

(assert (=> bm!30315 (= call!30317 (contains!2523 lt!211613 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!468146 () Bool)

(assert (=> b!468146 (= e!273962 call!30320)))

(declare-fun b!468147 () Bool)

(assert (=> b!468147 (= e!273959 e!273963)))

(declare-fun res!279806 () Bool)

(assert (=> b!468147 (= res!279806 call!30316)))

(assert (=> b!468147 (=> (not res!279806) (not e!273963))))

(declare-fun b!468148 () Bool)

(assert (=> b!468148 (= e!273958 (+!1708 call!30314 (tuple2!8613 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun bm!30316 () Bool)

(assert (=> bm!30316 (= call!30315 (getCurrentListMapNoExtraKeys!1955 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468149 () Bool)

(assert (=> b!468149 (= e!273958 e!273962)))

(assert (=> b!468149 (= c!56753 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30317 () Bool)

(assert (=> bm!30317 (= call!30318 call!30315)))

(assert (= (and d!75033 c!56752) b!468148))

(assert (= (and d!75033 (not c!56752)) b!468149))

(assert (= (and b!468149 c!56753) b!468146))

(assert (= (and b!468149 (not c!56753)) b!468137))

(assert (= (and b!468137 c!56755) b!468136))

(assert (= (and b!468137 (not c!56755)) b!468135))

(assert (= (or b!468136 b!468135) bm!30314))

(assert (= (or b!468146 bm!30314) bm!30317))

(assert (= (or b!468146 b!468136) bm!30313))

(assert (= (or b!468148 bm!30317) bm!30316))

(assert (= (or b!468148 bm!30313) bm!30311))

(assert (= (and d!75033 res!279808) b!468141))

(assert (= (and d!75033 c!56757) b!468143))

(assert (= (and d!75033 (not c!56757)) b!468138))

(assert (= (and d!75033 res!279810) b!468129))

(assert (= (and b!468129 res!279811) b!468139))

(assert (= (and b!468129 (not res!279807)) b!468133))

(assert (= (and b!468133 res!279809) b!468131))

(assert (= (and b!468129 res!279812) b!468142))

(assert (= (and b!468142 c!56754) b!468132))

(assert (= (and b!468142 (not c!56754)) b!468144))

(assert (= (and b!468132 res!279813) b!468145))

(assert (= (or b!468132 b!468144) bm!30315))

(assert (= (and b!468142 res!279814) b!468134))

(assert (= (and b!468134 c!56756) b!468147))

(assert (= (and b!468134 (not c!56756)) b!468130))

(assert (= (and b!468147 res!279806) b!468140))

(assert (= (or b!468147 b!468130) bm!30312))

(declare-fun b_lambda!10051 () Bool)

(assert (=> (not b_lambda!10051) (not b!468131)))

(declare-fun t!14640 () Bool)

(declare-fun tb!3907 () Bool)

(assert (=> (and start!41930 (= defaultEntry!841 defaultEntry!841) t!14640) tb!3907))

(declare-fun result!7395 () Bool)

(assert (=> tb!3907 (= result!7395 tp_is_empty!12961)))

(assert (=> b!468131 t!14640))

(declare-fun b_and!19901 () Bool)

(assert (= b_and!19895 (and (=> t!14640 result!7395) b_and!19901)))

(declare-fun m!449635 () Bool)

(assert (=> b!468133 m!449635))

(assert (=> b!468133 m!449635))

(declare-fun m!449637 () Bool)

(assert (=> b!468133 m!449637))

(declare-fun m!449639 () Bool)

(assert (=> b!468143 m!449639))

(assert (=> b!468143 m!449593))

(declare-fun m!449641 () Bool)

(assert (=> b!468143 m!449641))

(declare-fun m!449643 () Bool)

(assert (=> b!468143 m!449643))

(assert (=> b!468143 m!449641))

(declare-fun m!449645 () Bool)

(assert (=> b!468143 m!449645))

(declare-fun m!449647 () Bool)

(assert (=> b!468143 m!449647))

(assert (=> b!468143 m!449635))

(declare-fun m!449649 () Bool)

(assert (=> b!468143 m!449649))

(declare-fun m!449651 () Bool)

(assert (=> b!468143 m!449651))

(declare-fun m!449653 () Bool)

(assert (=> b!468143 m!449653))

(declare-fun m!449655 () Bool)

(assert (=> b!468143 m!449655))

(declare-fun m!449657 () Bool)

(assert (=> b!468143 m!449657))

(declare-fun m!449659 () Bool)

(assert (=> b!468143 m!449659))

(assert (=> b!468143 m!449651))

(declare-fun m!449661 () Bool)

(assert (=> b!468143 m!449661))

(declare-fun m!449663 () Bool)

(assert (=> b!468143 m!449663))

(assert (=> b!468143 m!449657))

(declare-fun m!449665 () Bool)

(assert (=> b!468143 m!449665))

(assert (=> b!468143 m!449645))

(declare-fun m!449667 () Bool)

(assert (=> b!468143 m!449667))

(declare-fun m!449669 () Bool)

(assert (=> bm!30312 m!449669))

(declare-fun m!449671 () Bool)

(assert (=> bm!30311 m!449671))

(declare-fun m!449673 () Bool)

(assert (=> b!468148 m!449673))

(declare-fun m!449675 () Bool)

(assert (=> b!468145 m!449675))

(assert (=> b!468139 m!449635))

(assert (=> b!468139 m!449635))

(declare-fun m!449677 () Bool)

(assert (=> b!468139 m!449677))

(assert (=> bm!30316 m!449593))

(declare-fun m!449679 () Bool)

(assert (=> b!468140 m!449679))

(assert (=> d!75033 m!449579))

(declare-fun m!449681 () Bool)

(assert (=> b!468131 m!449681))

(assert (=> b!468131 m!449635))

(declare-fun m!449683 () Bool)

(assert (=> b!468131 m!449683))

(declare-fun m!449685 () Bool)

(assert (=> b!468131 m!449685))

(assert (=> b!468131 m!449681))

(assert (=> b!468131 m!449685))

(declare-fun m!449687 () Bool)

(assert (=> b!468131 m!449687))

(assert (=> b!468131 m!449635))

(assert (=> b!468141 m!449635))

(assert (=> b!468141 m!449635))

(assert (=> b!468141 m!449677))

(declare-fun m!449689 () Bool)

(assert (=> bm!30315 m!449689))

(assert (=> b!468034 d!75033))

(declare-fun d!75035 () Bool)

(assert (=> d!75035 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41930 d!75035))

(declare-fun d!75037 () Bool)

(assert (=> d!75037 (= (array_inv!10384 _keys!1025) (bvsge (size!14622 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41930 d!75037))

(declare-fun d!75039 () Bool)

(assert (=> d!75039 (= (array_inv!10385 _values!833) (bvsge (size!14621 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41930 d!75039))

(declare-fun d!75041 () Bool)

(assert (=> d!75041 (= (getCurrentListMapNoExtraKeys!1955 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!1955 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211626 () Unit!13646)

(declare-fun choose!1349 (array!29685 array!29683 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18387 V!18387 V!18387 V!18387 (_ BitVec 32) Int) Unit!13646)

(assert (=> d!75041 (= lt!211626 (choose!1349 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75041 (validMask!0 mask!1365)))

(assert (=> d!75041 (= (lemmaNoChangeToArrayThenSameMapNoExtras!112 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211626)))

(declare-fun bs!14804 () Bool)

(assert (= bs!14804 d!75041))

(assert (=> bs!14804 m!449593))

(assert (=> bs!14804 m!449591))

(declare-fun m!449691 () Bool)

(assert (=> bs!14804 m!449691))

(assert (=> bs!14804 m!449579))

(assert (=> b!468035 d!75041))

(declare-fun d!75043 () Bool)

(declare-fun e!273985 () Bool)

(assert (=> d!75043 e!273985))

(declare-fun res!279826 () Bool)

(assert (=> d!75043 (=> (not res!279826) (not e!273985))))

(declare-fun lt!211643 () ListLongMap!7515)

(assert (=> d!75043 (= res!279826 (not (contains!2523 lt!211643 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!273990 () ListLongMap!7515)

(assert (=> d!75043 (= lt!211643 e!273990)))

(declare-fun c!56767 () Bool)

(assert (=> d!75043 (= c!56767 (bvsge #b00000000000000000000000000000000 (size!14622 _keys!1025)))))

(assert (=> d!75043 (validMask!0 mask!1365)))

(assert (=> d!75043 (= (getCurrentListMapNoExtraKeys!1955 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211643)))

(declare-fun b!468176 () Bool)

(declare-fun res!279825 () Bool)

(assert (=> b!468176 (=> (not res!279825) (not e!273985))))

(assert (=> b!468176 (= res!279825 (not (contains!2523 lt!211643 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!468177 () Bool)

(declare-fun e!273987 () ListLongMap!7515)

(declare-fun call!30323 () ListLongMap!7515)

(assert (=> b!468177 (= e!273987 call!30323)))

(declare-fun b!468178 () Bool)

(assert (=> b!468178 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14622 _keys!1025)))))

(assert (=> b!468178 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14621 _values!833)))))

(declare-fun e!273989 () Bool)

(assert (=> b!468178 (= e!273989 (= (apply!325 lt!211643 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)) (get!6988 (select (arr!14268 _values!833) #b00000000000000000000000000000000) (dynLambda!921 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!468179 () Bool)

(declare-fun e!273986 () Bool)

(assert (=> b!468179 (= e!273986 (validKeyInArray!0 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!468179 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun e!273988 () Bool)

(declare-fun b!468180 () Bool)

(assert (=> b!468180 (= e!273988 (= lt!211643 (getCurrentListMapNoExtraKeys!1955 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!468181 () Bool)

(declare-fun e!273991 () Bool)

(assert (=> b!468181 (= e!273991 e!273988)))

(declare-fun c!56768 () Bool)

(assert (=> b!468181 (= c!56768 (bvslt #b00000000000000000000000000000000 (size!14622 _keys!1025)))))

(declare-fun b!468182 () Bool)

(assert (=> b!468182 (= e!273990 e!273987)))

(declare-fun c!56769 () Bool)

(assert (=> b!468182 (= c!56769 (validKeyInArray!0 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!468183 () Bool)

(assert (=> b!468183 (= e!273991 e!273989)))

(assert (=> b!468183 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14622 _keys!1025)))))

(declare-fun res!279823 () Bool)

(assert (=> b!468183 (= res!279823 (contains!2523 lt!211643 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!468183 (=> (not res!279823) (not e!273989))))

(declare-fun b!468184 () Bool)

(declare-fun isEmpty!576 (ListLongMap!7515) Bool)

(assert (=> b!468184 (= e!273988 (isEmpty!576 lt!211643))))

(declare-fun b!468185 () Bool)

(assert (=> b!468185 (= e!273990 (ListLongMap!7516 Nil!8684))))

(declare-fun bm!30320 () Bool)

(assert (=> bm!30320 (= call!30323 (getCurrentListMapNoExtraKeys!1955 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!468186 () Bool)

(declare-fun lt!211641 () Unit!13646)

(declare-fun lt!211645 () Unit!13646)

(assert (=> b!468186 (= lt!211641 lt!211645)))

(declare-fun lt!211647 () V!18387)

(declare-fun lt!211644 () ListLongMap!7515)

(declare-fun lt!211642 () (_ BitVec 64))

(declare-fun lt!211646 () (_ BitVec 64))

(assert (=> b!468186 (not (contains!2523 (+!1708 lt!211644 (tuple2!8613 lt!211646 lt!211647)) lt!211642))))

(declare-fun addStillNotContains!159 (ListLongMap!7515 (_ BitVec 64) V!18387 (_ BitVec 64)) Unit!13646)

(assert (=> b!468186 (= lt!211645 (addStillNotContains!159 lt!211644 lt!211646 lt!211647 lt!211642))))

(assert (=> b!468186 (= lt!211642 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!468186 (= lt!211647 (get!6988 (select (arr!14268 _values!833) #b00000000000000000000000000000000) (dynLambda!921 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!468186 (= lt!211646 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!468186 (= lt!211644 call!30323)))

(assert (=> b!468186 (= e!273987 (+!1708 call!30323 (tuple2!8613 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000) (get!6988 (select (arr!14268 _values!833) #b00000000000000000000000000000000) (dynLambda!921 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!468187 () Bool)

(assert (=> b!468187 (= e!273985 e!273991)))

(declare-fun c!56766 () Bool)

(assert (=> b!468187 (= c!56766 e!273986)))

(declare-fun res!279824 () Bool)

(assert (=> b!468187 (=> (not res!279824) (not e!273986))))

(assert (=> b!468187 (= res!279824 (bvslt #b00000000000000000000000000000000 (size!14622 _keys!1025)))))

(assert (= (and d!75043 c!56767) b!468185))

(assert (= (and d!75043 (not c!56767)) b!468182))

(assert (= (and b!468182 c!56769) b!468186))

(assert (= (and b!468182 (not c!56769)) b!468177))

(assert (= (or b!468186 b!468177) bm!30320))

(assert (= (and d!75043 res!279826) b!468176))

(assert (= (and b!468176 res!279825) b!468187))

(assert (= (and b!468187 res!279824) b!468179))

(assert (= (and b!468187 c!56766) b!468183))

(assert (= (and b!468187 (not c!56766)) b!468181))

(assert (= (and b!468183 res!279823) b!468178))

(assert (= (and b!468181 c!56768) b!468180))

(assert (= (and b!468181 (not c!56768)) b!468184))

(declare-fun b_lambda!10053 () Bool)

(assert (=> (not b_lambda!10053) (not b!468178)))

(assert (=> b!468178 t!14640))

(declare-fun b_and!19903 () Bool)

(assert (= b_and!19901 (and (=> t!14640 result!7395) b_and!19903)))

(declare-fun b_lambda!10055 () Bool)

(assert (=> (not b_lambda!10055) (not b!468186)))

(assert (=> b!468186 t!14640))

(declare-fun b_and!19905 () Bool)

(assert (= b_and!19903 (and (=> t!14640 result!7395) b_and!19905)))

(assert (=> b!468183 m!449635))

(assert (=> b!468183 m!449635))

(declare-fun m!449693 () Bool)

(assert (=> b!468183 m!449693))

(assert (=> b!468178 m!449635))

(assert (=> b!468178 m!449681))

(assert (=> b!468178 m!449685))

(assert (=> b!468178 m!449687))

(assert (=> b!468178 m!449635))

(declare-fun m!449695 () Bool)

(assert (=> b!468178 m!449695))

(assert (=> b!468178 m!449681))

(assert (=> b!468178 m!449685))

(declare-fun m!449697 () Bool)

(assert (=> b!468186 m!449697))

(assert (=> b!468186 m!449635))

(assert (=> b!468186 m!449697))

(declare-fun m!449699 () Bool)

(assert (=> b!468186 m!449699))

(declare-fun m!449701 () Bool)

(assert (=> b!468186 m!449701))

(declare-fun m!449703 () Bool)

(assert (=> b!468186 m!449703))

(assert (=> b!468186 m!449681))

(assert (=> b!468186 m!449685))

(assert (=> b!468186 m!449687))

(assert (=> b!468186 m!449681))

(assert (=> b!468186 m!449685))

(declare-fun m!449705 () Bool)

(assert (=> b!468180 m!449705))

(assert (=> bm!30320 m!449705))

(declare-fun m!449707 () Bool)

(assert (=> d!75043 m!449707))

(assert (=> d!75043 m!449579))

(declare-fun m!449709 () Bool)

(assert (=> b!468184 m!449709))

(assert (=> b!468179 m!449635))

(assert (=> b!468179 m!449635))

(assert (=> b!468179 m!449677))

(assert (=> b!468182 m!449635))

(assert (=> b!468182 m!449635))

(assert (=> b!468182 m!449677))

(declare-fun m!449711 () Bool)

(assert (=> b!468176 m!449711))

(assert (=> b!468035 d!75043))

(declare-fun d!75045 () Bool)

(declare-fun e!273992 () Bool)

(assert (=> d!75045 e!273992))

(declare-fun res!279830 () Bool)

(assert (=> d!75045 (=> (not res!279830) (not e!273992))))

(declare-fun lt!211650 () ListLongMap!7515)

(assert (=> d!75045 (= res!279830 (not (contains!2523 lt!211650 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!273997 () ListLongMap!7515)

(assert (=> d!75045 (= lt!211650 e!273997)))

(declare-fun c!56771 () Bool)

(assert (=> d!75045 (= c!56771 (bvsge #b00000000000000000000000000000000 (size!14622 _keys!1025)))))

(assert (=> d!75045 (validMask!0 mask!1365)))

(assert (=> d!75045 (= (getCurrentListMapNoExtraKeys!1955 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211650)))

(declare-fun b!468188 () Bool)

(declare-fun res!279829 () Bool)

(assert (=> b!468188 (=> (not res!279829) (not e!273992))))

(assert (=> b!468188 (= res!279829 (not (contains!2523 lt!211650 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!468189 () Bool)

(declare-fun e!273994 () ListLongMap!7515)

(declare-fun call!30324 () ListLongMap!7515)

(assert (=> b!468189 (= e!273994 call!30324)))

(declare-fun b!468190 () Bool)

(assert (=> b!468190 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14622 _keys!1025)))))

(assert (=> b!468190 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14621 _values!833)))))

(declare-fun e!273996 () Bool)

(assert (=> b!468190 (= e!273996 (= (apply!325 lt!211650 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)) (get!6988 (select (arr!14268 _values!833) #b00000000000000000000000000000000) (dynLambda!921 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!468191 () Bool)

(declare-fun e!273993 () Bool)

(assert (=> b!468191 (= e!273993 (validKeyInArray!0 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!468191 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!468192 () Bool)

(declare-fun e!273995 () Bool)

(assert (=> b!468192 (= e!273995 (= lt!211650 (getCurrentListMapNoExtraKeys!1955 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!468193 () Bool)

(declare-fun e!273998 () Bool)

(assert (=> b!468193 (= e!273998 e!273995)))

(declare-fun c!56772 () Bool)

(assert (=> b!468193 (= c!56772 (bvslt #b00000000000000000000000000000000 (size!14622 _keys!1025)))))

(declare-fun b!468194 () Bool)

(assert (=> b!468194 (= e!273997 e!273994)))

(declare-fun c!56773 () Bool)

(assert (=> b!468194 (= c!56773 (validKeyInArray!0 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!468195 () Bool)

(assert (=> b!468195 (= e!273998 e!273996)))

(assert (=> b!468195 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14622 _keys!1025)))))

(declare-fun res!279827 () Bool)

(assert (=> b!468195 (= res!279827 (contains!2523 lt!211650 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!468195 (=> (not res!279827) (not e!273996))))

(declare-fun b!468196 () Bool)

(assert (=> b!468196 (= e!273995 (isEmpty!576 lt!211650))))

(declare-fun b!468197 () Bool)

(assert (=> b!468197 (= e!273997 (ListLongMap!7516 Nil!8684))))

(declare-fun bm!30321 () Bool)

(assert (=> bm!30321 (= call!30324 (getCurrentListMapNoExtraKeys!1955 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!468198 () Bool)

(declare-fun lt!211648 () Unit!13646)

(declare-fun lt!211652 () Unit!13646)

(assert (=> b!468198 (= lt!211648 lt!211652)))

(declare-fun lt!211654 () V!18387)

(declare-fun lt!211653 () (_ BitVec 64))

(declare-fun lt!211649 () (_ BitVec 64))

(declare-fun lt!211651 () ListLongMap!7515)

(assert (=> b!468198 (not (contains!2523 (+!1708 lt!211651 (tuple2!8613 lt!211653 lt!211654)) lt!211649))))

(assert (=> b!468198 (= lt!211652 (addStillNotContains!159 lt!211651 lt!211653 lt!211654 lt!211649))))

(assert (=> b!468198 (= lt!211649 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!468198 (= lt!211654 (get!6988 (select (arr!14268 _values!833) #b00000000000000000000000000000000) (dynLambda!921 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!468198 (= lt!211653 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!468198 (= lt!211651 call!30324)))

(assert (=> b!468198 (= e!273994 (+!1708 call!30324 (tuple2!8613 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000) (get!6988 (select (arr!14268 _values!833) #b00000000000000000000000000000000) (dynLambda!921 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!468199 () Bool)

(assert (=> b!468199 (= e!273992 e!273998)))

(declare-fun c!56770 () Bool)

(assert (=> b!468199 (= c!56770 e!273993)))

(declare-fun res!279828 () Bool)

(assert (=> b!468199 (=> (not res!279828) (not e!273993))))

(assert (=> b!468199 (= res!279828 (bvslt #b00000000000000000000000000000000 (size!14622 _keys!1025)))))

(assert (= (and d!75045 c!56771) b!468197))

(assert (= (and d!75045 (not c!56771)) b!468194))

(assert (= (and b!468194 c!56773) b!468198))

(assert (= (and b!468194 (not c!56773)) b!468189))

(assert (= (or b!468198 b!468189) bm!30321))

(assert (= (and d!75045 res!279830) b!468188))

(assert (= (and b!468188 res!279829) b!468199))

(assert (= (and b!468199 res!279828) b!468191))

(assert (= (and b!468199 c!56770) b!468195))

(assert (= (and b!468199 (not c!56770)) b!468193))

(assert (= (and b!468195 res!279827) b!468190))

(assert (= (and b!468193 c!56772) b!468192))

(assert (= (and b!468193 (not c!56772)) b!468196))

(declare-fun b_lambda!10057 () Bool)

(assert (=> (not b_lambda!10057) (not b!468190)))

(assert (=> b!468190 t!14640))

(declare-fun b_and!19907 () Bool)

(assert (= b_and!19905 (and (=> t!14640 result!7395) b_and!19907)))

(declare-fun b_lambda!10059 () Bool)

(assert (=> (not b_lambda!10059) (not b!468198)))

(assert (=> b!468198 t!14640))

(declare-fun b_and!19909 () Bool)

(assert (= b_and!19907 (and (=> t!14640 result!7395) b_and!19909)))

(assert (=> b!468195 m!449635))

(assert (=> b!468195 m!449635))

(declare-fun m!449713 () Bool)

(assert (=> b!468195 m!449713))

(assert (=> b!468190 m!449635))

(assert (=> b!468190 m!449681))

(assert (=> b!468190 m!449685))

(assert (=> b!468190 m!449687))

(assert (=> b!468190 m!449635))

(declare-fun m!449715 () Bool)

(assert (=> b!468190 m!449715))

(assert (=> b!468190 m!449681))

(assert (=> b!468190 m!449685))

(declare-fun m!449717 () Bool)

(assert (=> b!468198 m!449717))

(assert (=> b!468198 m!449635))

(assert (=> b!468198 m!449717))

(declare-fun m!449719 () Bool)

(assert (=> b!468198 m!449719))

(declare-fun m!449721 () Bool)

(assert (=> b!468198 m!449721))

(declare-fun m!449723 () Bool)

(assert (=> b!468198 m!449723))

(assert (=> b!468198 m!449681))

(assert (=> b!468198 m!449685))

(assert (=> b!468198 m!449687))

(assert (=> b!468198 m!449681))

(assert (=> b!468198 m!449685))

(declare-fun m!449725 () Bool)

(assert (=> b!468192 m!449725))

(assert (=> bm!30321 m!449725))

(declare-fun m!449727 () Bool)

(assert (=> d!75045 m!449727))

(assert (=> d!75045 m!449579))

(declare-fun m!449729 () Bool)

(assert (=> b!468196 m!449729))

(assert (=> b!468191 m!449635))

(assert (=> b!468191 m!449635))

(assert (=> b!468191 m!449677))

(assert (=> b!468194 m!449635))

(assert (=> b!468194 m!449635))

(assert (=> b!468194 m!449677))

(declare-fun m!449731 () Bool)

(assert (=> b!468188 m!449731))

(assert (=> b!468035 d!75045))

(declare-fun b!468208 () Bool)

(declare-fun e!274006 () Bool)

(declare-fun e!274007 () Bool)

(assert (=> b!468208 (= e!274006 e!274007)))

(declare-fun lt!211662 () (_ BitVec 64))

(assert (=> b!468208 (= lt!211662 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211663 () Unit!13646)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!29685 (_ BitVec 64) (_ BitVec 32)) Unit!13646)

(assert (=> b!468208 (= lt!211663 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!211662 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!29685 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!468208 (arrayContainsKey!0 _keys!1025 lt!211662 #b00000000000000000000000000000000)))

(declare-fun lt!211661 () Unit!13646)

(assert (=> b!468208 (= lt!211661 lt!211663)))

(declare-fun res!279836 () Bool)

(declare-datatypes ((SeekEntryResult!3544 0))(
  ( (MissingZero!3544 (index!16355 (_ BitVec 32))) (Found!3544 (index!16356 (_ BitVec 32))) (Intermediate!3544 (undefined!4356 Bool) (index!16357 (_ BitVec 32)) (x!43826 (_ BitVec 32))) (Undefined!3544) (MissingVacant!3544 (index!16358 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!29685 (_ BitVec 32)) SeekEntryResult!3544)

(assert (=> b!468208 (= res!279836 (= (seekEntryOrOpen!0 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3544 #b00000000000000000000000000000000)))))

(assert (=> b!468208 (=> (not res!279836) (not e!274007))))

(declare-fun b!468209 () Bool)

(declare-fun call!30327 () Bool)

(assert (=> b!468209 (= e!274006 call!30327)))

(declare-fun bm!30324 () Bool)

(assert (=> bm!30324 (= call!30327 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun d!75047 () Bool)

(declare-fun res!279835 () Bool)

(declare-fun e!274005 () Bool)

(assert (=> d!75047 (=> res!279835 e!274005)))

(assert (=> d!75047 (= res!279835 (bvsge #b00000000000000000000000000000000 (size!14622 _keys!1025)))))

(assert (=> d!75047 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!274005)))

(declare-fun b!468210 () Bool)

(assert (=> b!468210 (= e!274005 e!274006)))

(declare-fun c!56776 () Bool)

(assert (=> b!468210 (= c!56776 (validKeyInArray!0 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!468211 () Bool)

(assert (=> b!468211 (= e!274007 call!30327)))

(assert (= (and d!75047 (not res!279835)) b!468210))

(assert (= (and b!468210 c!56776) b!468208))

(assert (= (and b!468210 (not c!56776)) b!468209))

(assert (= (and b!468208 res!279836) b!468211))

(assert (= (or b!468211 b!468209) bm!30324))

(assert (=> b!468208 m!449635))

(declare-fun m!449733 () Bool)

(assert (=> b!468208 m!449733))

(declare-fun m!449735 () Bool)

(assert (=> b!468208 m!449735))

(assert (=> b!468208 m!449635))

(declare-fun m!449737 () Bool)

(assert (=> b!468208 m!449737))

(declare-fun m!449739 () Bool)

(assert (=> bm!30324 m!449739))

(assert (=> b!468210 m!449635))

(assert (=> b!468210 m!449635))

(assert (=> b!468210 m!449677))

(assert (=> b!468032 d!75047))

(declare-fun b!468222 () Bool)

(declare-fun e!274016 () Bool)

(declare-fun e!274017 () Bool)

(assert (=> b!468222 (= e!274016 e!274017)))

(declare-fun res!279844 () Bool)

(assert (=> b!468222 (=> (not res!279844) (not e!274017))))

(declare-fun e!274019 () Bool)

(assert (=> b!468222 (= res!279844 (not e!274019))))

(declare-fun res!279845 () Bool)

(assert (=> b!468222 (=> (not res!279845) (not e!274019))))

(assert (=> b!468222 (= res!279845 (validKeyInArray!0 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!468223 () Bool)

(declare-fun contains!2524 (List!8688 (_ BitVec 64)) Bool)

(assert (=> b!468223 (= e!274019 (contains!2524 Nil!8685 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!468224 () Bool)

(declare-fun e!274018 () Bool)

(assert (=> b!468224 (= e!274017 e!274018)))

(declare-fun c!56779 () Bool)

(assert (=> b!468224 (= c!56779 (validKeyInArray!0 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!468225 () Bool)

(declare-fun call!30330 () Bool)

(assert (=> b!468225 (= e!274018 call!30330)))

(declare-fun bm!30327 () Bool)

(assert (=> bm!30327 (= call!30330 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56779 (Cons!8684 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000) Nil!8685) Nil!8685)))))

(declare-fun d!75049 () Bool)

(declare-fun res!279843 () Bool)

(assert (=> d!75049 (=> res!279843 e!274016)))

(assert (=> d!75049 (= res!279843 (bvsge #b00000000000000000000000000000000 (size!14622 _keys!1025)))))

(assert (=> d!75049 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8685) e!274016)))

(declare-fun b!468226 () Bool)

(assert (=> b!468226 (= e!274018 call!30330)))

(assert (= (and d!75049 (not res!279843)) b!468222))

(assert (= (and b!468222 res!279845) b!468223))

(assert (= (and b!468222 res!279844) b!468224))

(assert (= (and b!468224 c!56779) b!468226))

(assert (= (and b!468224 (not c!56779)) b!468225))

(assert (= (or b!468226 b!468225) bm!30327))

(assert (=> b!468222 m!449635))

(assert (=> b!468222 m!449635))

(assert (=> b!468222 m!449677))

(assert (=> b!468223 m!449635))

(assert (=> b!468223 m!449635))

(declare-fun m!449741 () Bool)

(assert (=> b!468223 m!449741))

(assert (=> b!468224 m!449635))

(assert (=> b!468224 m!449635))

(assert (=> b!468224 m!449677))

(assert (=> bm!30327 m!449635))

(declare-fun m!449743 () Bool)

(assert (=> bm!30327 m!449743))

(assert (=> b!468036 d!75049))

(declare-fun b!468234 () Bool)

(declare-fun e!274025 () Bool)

(assert (=> b!468234 (= e!274025 tp_is_empty!12961)))

(declare-fun condMapEmpty!21142 () Bool)

(declare-fun mapDefault!21142 () ValueCell!6137)

(assert (=> mapNonEmpty!21133 (= condMapEmpty!21142 (= mapRest!21133 ((as const (Array (_ BitVec 32) ValueCell!6137)) mapDefault!21142)))))

(declare-fun mapRes!21142 () Bool)

(assert (=> mapNonEmpty!21133 (= tp!40611 (and e!274025 mapRes!21142))))

(declare-fun mapNonEmpty!21142 () Bool)

(declare-fun tp!40627 () Bool)

(declare-fun e!274024 () Bool)

(assert (=> mapNonEmpty!21142 (= mapRes!21142 (and tp!40627 e!274024))))

(declare-fun mapValue!21142 () ValueCell!6137)

(declare-fun mapKey!21142 () (_ BitVec 32))

(declare-fun mapRest!21142 () (Array (_ BitVec 32) ValueCell!6137))

(assert (=> mapNonEmpty!21142 (= mapRest!21133 (store mapRest!21142 mapKey!21142 mapValue!21142))))

(declare-fun b!468233 () Bool)

(assert (=> b!468233 (= e!274024 tp_is_empty!12961)))

(declare-fun mapIsEmpty!21142 () Bool)

(assert (=> mapIsEmpty!21142 mapRes!21142))

(assert (= (and mapNonEmpty!21133 condMapEmpty!21142) mapIsEmpty!21142))

(assert (= (and mapNonEmpty!21133 (not condMapEmpty!21142)) mapNonEmpty!21142))

(assert (= (and mapNonEmpty!21142 ((_ is ValueCellFull!6137) mapValue!21142)) b!468233))

(assert (= (and mapNonEmpty!21133 ((_ is ValueCellFull!6137) mapDefault!21142)) b!468234))

(declare-fun m!449745 () Bool)

(assert (=> mapNonEmpty!21142 m!449745))

(declare-fun b_lambda!10061 () Bool)

(assert (= b_lambda!10057 (or (and start!41930 b_free!11533) b_lambda!10061)))

(declare-fun b_lambda!10063 () Bool)

(assert (= b_lambda!10053 (or (and start!41930 b_free!11533) b_lambda!10063)))

(declare-fun b_lambda!10065 () Bool)

(assert (= b_lambda!10051 (or (and start!41930 b_free!11533) b_lambda!10065)))

(declare-fun b_lambda!10067 () Bool)

(assert (= b_lambda!10059 (or (and start!41930 b_free!11533) b_lambda!10067)))

(declare-fun b_lambda!10069 () Bool)

(assert (= b_lambda!10055 (or (and start!41930 b_free!11533) b_lambda!10069)))

(check-sat (not b!468223) (not b!468192) (not b!468176) (not b!468196) (not d!75033) (not b_lambda!10065) (not b!468180) (not b!468195) (not bm!30321) (not b_next!11533) (not b!468179) (not d!75045) (not b!468184) b_and!19909 (not b!468190) (not b!468222) (not b!468194) (not mapNonEmpty!21142) (not b!468141) (not bm!30327) (not bm!30324) (not b!468198) (not b!468191) (not b_lambda!10067) (not d!75043) (not b!468140) tp_is_empty!12961 (not b!468139) (not b!468208) (not b!468183) (not b_lambda!10063) (not b!468178) (not b!468143) (not b!468210) (not bm!30316) (not b!468148) (not b!468182) (not b!468188) (not bm!30315) (not b!468133) (not bm!30312) (not bm!30320) (not b_lambda!10069) (not b!468224) (not b!468131) (not b!468145) (not b!468186) (not bm!30311) (not b_lambda!10061) (not d!75041))
(check-sat b_and!19909 (not b_next!11533))
