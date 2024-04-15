; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105736 () Bool)

(assert start!105736)

(declare-fun b_free!27325 () Bool)

(declare-fun b_next!27325 () Bool)

(assert (=> start!105736 (= b_free!27325 (not b_next!27325))))

(declare-fun tp!95500 () Bool)

(declare-fun b_and!45191 () Bool)

(assert (=> start!105736 (= tp!95500 b_and!45191)))

(declare-datatypes ((V!48335 0))(
  ( (V!48336 (val!16176 Int)) )
))
(declare-datatypes ((tuple2!20994 0))(
  ( (tuple2!20995 (_1!10508 (_ BitVec 64)) (_2!10508 V!48335)) )
))
(declare-fun lt!570077 () tuple2!20994)

(declare-datatypes ((List!28197 0))(
  ( (Nil!28194) (Cons!28193 (h!29402 tuple2!20994) (t!41683 List!28197)) )
))
(declare-datatypes ((ListLongMap!18867 0))(
  ( (ListLongMap!18868 (toList!9449 List!28197)) )
))
(declare-fun lt!570081 () ListLongMap!18867)

(declare-fun e!716576 () Bool)

(declare-fun b!1259528 () Bool)

(declare-fun lt!570084 () ListLongMap!18867)

(declare-fun +!4250 (ListLongMap!18867 tuple2!20994) ListLongMap!18867)

(assert (=> b!1259528 (= e!716576 (= lt!570081 (+!4250 lt!570084 lt!570077)))))

(declare-fun b!1259529 () Bool)

(declare-fun res!839457 () Bool)

(declare-fun e!716575 () Bool)

(assert (=> b!1259529 (=> (not res!839457) (not e!716575))))

(declare-datatypes ((array!81997 0))(
  ( (array!81998 (arr!39554 (Array (_ BitVec 32) (_ BitVec 64))) (size!40092 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81997)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81997 (_ BitVec 32)) Bool)

(assert (=> b!1259529 (= res!839457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1259530 () Bool)

(declare-fun e!716571 () Bool)

(assert (=> b!1259530 (= e!716571 (bvsle #b00000000000000000000000000000000 (size!40092 _keys!1118)))))

(declare-fun b!1259531 () Bool)

(declare-fun e!716577 () Bool)

(assert (=> b!1259531 (= e!716577 e!716571)))

(declare-fun res!839462 () Bool)

(assert (=> b!1259531 (=> res!839462 e!716571)))

(declare-fun lt!570078 () ListLongMap!18867)

(declare-fun -!2069 (ListLongMap!18867 (_ BitVec 64)) ListLongMap!18867)

(assert (=> b!1259531 (= res!839462 (not (= (-!2069 lt!570078 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570081)))))

(declare-fun lt!570080 () ListLongMap!18867)

(declare-fun lt!570079 () ListLongMap!18867)

(assert (=> b!1259531 (= (-!2069 lt!570080 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570079)))

(declare-datatypes ((Unit!41842 0))(
  ( (Unit!41843) )
))
(declare-fun lt!570082 () Unit!41842)

(declare-fun minValueBefore!43 () V!48335)

(declare-fun addThenRemoveForNewKeyIsSame!326 (ListLongMap!18867 (_ BitVec 64) V!48335) Unit!41842)

(assert (=> b!1259531 (= lt!570082 (addThenRemoveForNewKeyIsSame!326 lt!570079 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1259531 e!716576))

(declare-fun res!839456 () Bool)

(assert (=> b!1259531 (=> (not res!839456) (not e!716576))))

(assert (=> b!1259531 (= res!839456 (= lt!570078 lt!570080))))

(assert (=> b!1259531 (= lt!570080 (+!4250 lt!570079 (tuple2!20995 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570083 () ListLongMap!18867)

(assert (=> b!1259531 (= lt!570079 (+!4250 lt!570083 lt!570077))))

(declare-fun zeroValue!871 () V!48335)

(assert (=> b!1259531 (= lt!570077 (tuple2!20995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48335)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15350 0))(
  ( (ValueCellFull!15350 (v!18877 V!48335)) (EmptyCell!15350) )
))
(declare-datatypes ((array!81999 0))(
  ( (array!82000 (arr!39555 (Array (_ BitVec 32) ValueCell!15350)) (size!40093 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81999)

(declare-fun getCurrentListMap!4535 (array!81997 array!81999 (_ BitVec 32) (_ BitVec 32) V!48335 V!48335 (_ BitVec 32) Int) ListLongMap!18867)

(assert (=> b!1259531 (= lt!570081 (getCurrentListMap!4535 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259531 (= lt!570078 (getCurrentListMap!4535 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259532 () Bool)

(declare-fun e!716570 () Bool)

(declare-fun tp_is_empty!32227 () Bool)

(assert (=> b!1259532 (= e!716570 tp_is_empty!32227)))

(declare-fun b!1259533 () Bool)

(declare-fun res!839460 () Bool)

(assert (=> b!1259533 (=> (not res!839460) (not e!716575))))

(assert (=> b!1259533 (= res!839460 (and (= (size!40093 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40092 _keys!1118) (size!40093 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!50137 () Bool)

(declare-fun mapRes!50137 () Bool)

(declare-fun tp!95501 () Bool)

(declare-fun e!716572 () Bool)

(assert (=> mapNonEmpty!50137 (= mapRes!50137 (and tp!95501 e!716572))))

(declare-fun mapValue!50137 () ValueCell!15350)

(declare-fun mapKey!50137 () (_ BitVec 32))

(declare-fun mapRest!50137 () (Array (_ BitVec 32) ValueCell!15350))

(assert (=> mapNonEmpty!50137 (= (arr!39555 _values!914) (store mapRest!50137 mapKey!50137 mapValue!50137))))

(declare-fun b!1259535 () Bool)

(declare-fun e!716574 () Bool)

(assert (=> b!1259535 (= e!716574 (and e!716570 mapRes!50137))))

(declare-fun condMapEmpty!50137 () Bool)

(declare-fun mapDefault!50137 () ValueCell!15350)

(assert (=> b!1259535 (= condMapEmpty!50137 (= (arr!39555 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15350)) mapDefault!50137)))))

(declare-fun b!1259536 () Bool)

(assert (=> b!1259536 (= e!716575 (not e!716577))))

(declare-fun res!839459 () Bool)

(assert (=> b!1259536 (=> res!839459 e!716577)))

(assert (=> b!1259536 (= res!839459 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1259536 (= lt!570083 lt!570084)))

(declare-fun lt!570076 () Unit!41842)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1142 (array!81997 array!81999 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48335 V!48335 V!48335 V!48335 (_ BitVec 32) Int) Unit!41842)

(assert (=> b!1259536 (= lt!570076 (lemmaNoChangeToArrayThenSameMapNoExtras!1142 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5820 (array!81997 array!81999 (_ BitVec 32) (_ BitVec 32) V!48335 V!48335 (_ BitVec 32) Int) ListLongMap!18867)

(assert (=> b!1259536 (= lt!570084 (getCurrentListMapNoExtraKeys!5820 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259536 (= lt!570083 (getCurrentListMapNoExtraKeys!5820 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50137 () Bool)

(assert (=> mapIsEmpty!50137 mapRes!50137))

(declare-fun b!1259537 () Bool)

(declare-fun res!839461 () Bool)

(assert (=> b!1259537 (=> (not res!839461) (not e!716575))))

(declare-datatypes ((List!28198 0))(
  ( (Nil!28195) (Cons!28194 (h!29403 (_ BitVec 64)) (t!41684 List!28198)) )
))
(declare-fun arrayNoDuplicates!0 (array!81997 (_ BitVec 32) List!28198) Bool)

(assert (=> b!1259537 (= res!839461 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28195))))

(declare-fun res!839458 () Bool)

(assert (=> start!105736 (=> (not res!839458) (not e!716575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105736 (= res!839458 (validMask!0 mask!1466))))

(assert (=> start!105736 e!716575))

(assert (=> start!105736 true))

(assert (=> start!105736 tp!95500))

(assert (=> start!105736 tp_is_empty!32227))

(declare-fun array_inv!30259 (array!81997) Bool)

(assert (=> start!105736 (array_inv!30259 _keys!1118)))

(declare-fun array_inv!30260 (array!81999) Bool)

(assert (=> start!105736 (and (array_inv!30260 _values!914) e!716574)))

(declare-fun b!1259534 () Bool)

(assert (=> b!1259534 (= e!716572 tp_is_empty!32227)))

(assert (= (and start!105736 res!839458) b!1259533))

(assert (= (and b!1259533 res!839460) b!1259529))

(assert (= (and b!1259529 res!839457) b!1259537))

(assert (= (and b!1259537 res!839461) b!1259536))

(assert (= (and b!1259536 (not res!839459)) b!1259531))

(assert (= (and b!1259531 res!839456) b!1259528))

(assert (= (and b!1259531 (not res!839462)) b!1259530))

(assert (= (and b!1259535 condMapEmpty!50137) mapIsEmpty!50137))

(assert (= (and b!1259535 (not condMapEmpty!50137)) mapNonEmpty!50137))

(get-info :version)

(assert (= (and mapNonEmpty!50137 ((_ is ValueCellFull!15350) mapValue!50137)) b!1259534))

(assert (= (and b!1259535 ((_ is ValueCellFull!15350) mapDefault!50137)) b!1259532))

(assert (= start!105736 b!1259535))

(declare-fun m!1159607 () Bool)

(assert (=> b!1259529 m!1159607))

(declare-fun m!1159609 () Bool)

(assert (=> b!1259537 m!1159609))

(declare-fun m!1159611 () Bool)

(assert (=> b!1259531 m!1159611))

(declare-fun m!1159613 () Bool)

(assert (=> b!1259531 m!1159613))

(declare-fun m!1159615 () Bool)

(assert (=> b!1259531 m!1159615))

(declare-fun m!1159617 () Bool)

(assert (=> b!1259531 m!1159617))

(declare-fun m!1159619 () Bool)

(assert (=> b!1259531 m!1159619))

(declare-fun m!1159621 () Bool)

(assert (=> b!1259531 m!1159621))

(declare-fun m!1159623 () Bool)

(assert (=> b!1259531 m!1159623))

(declare-fun m!1159625 () Bool)

(assert (=> start!105736 m!1159625))

(declare-fun m!1159627 () Bool)

(assert (=> start!105736 m!1159627))

(declare-fun m!1159629 () Bool)

(assert (=> start!105736 m!1159629))

(declare-fun m!1159631 () Bool)

(assert (=> b!1259536 m!1159631))

(declare-fun m!1159633 () Bool)

(assert (=> b!1259536 m!1159633))

(declare-fun m!1159635 () Bool)

(assert (=> b!1259536 m!1159635))

(declare-fun m!1159637 () Bool)

(assert (=> mapNonEmpty!50137 m!1159637))

(declare-fun m!1159639 () Bool)

(assert (=> b!1259528 m!1159639))

(check-sat (not start!105736) (not b!1259528) (not b_next!27325) (not b!1259529) (not b!1259537) (not b!1259531) b_and!45191 (not b!1259536) tp_is_empty!32227 (not mapNonEmpty!50137))
(check-sat b_and!45191 (not b_next!27325))
(get-model)

(declare-fun d!138209 () Bool)

(assert (=> d!138209 (= (getCurrentListMapNoExtraKeys!5820 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5820 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!570141 () Unit!41842)

(declare-fun choose!1873 (array!81997 array!81999 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48335 V!48335 V!48335 V!48335 (_ BitVec 32) Int) Unit!41842)

(assert (=> d!138209 (= lt!570141 (choose!1873 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138209 (validMask!0 mask!1466)))

(assert (=> d!138209 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1142 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!570141)))

(declare-fun bs!35610 () Bool)

(assert (= bs!35610 d!138209))

(assert (=> bs!35610 m!1159635))

(assert (=> bs!35610 m!1159633))

(declare-fun m!1159709 () Bool)

(assert (=> bs!35610 m!1159709))

(assert (=> bs!35610 m!1159625))

(assert (=> b!1259536 d!138209))

(declare-fun lt!570161 () ListLongMap!18867)

(declare-fun b!1259622 () Bool)

(declare-fun e!716643 () Bool)

(assert (=> b!1259622 (= e!716643 (= lt!570161 (getCurrentListMapNoExtraKeys!5820 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1259623 () Bool)

(declare-fun e!716646 () ListLongMap!18867)

(declare-fun call!61864 () ListLongMap!18867)

(assert (=> b!1259623 (= e!716646 call!61864)))

(declare-fun b!1259624 () Bool)

(assert (=> b!1259624 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40092 _keys!1118)))))

(assert (=> b!1259624 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40093 _values!914)))))

(declare-fun e!716645 () Bool)

(declare-fun apply!985 (ListLongMap!18867 (_ BitVec 64)) V!48335)

(declare-fun get!20220 (ValueCell!15350 V!48335) V!48335)

(declare-fun dynLambda!3415 (Int (_ BitVec 64)) V!48335)

(assert (=> b!1259624 (= e!716645 (= (apply!985 lt!570161 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000)) (get!20220 (select (arr!39555 _values!914) #b00000000000000000000000000000000) (dynLambda!3415 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1259625 () Bool)

(declare-fun lt!570159 () Unit!41842)

(declare-fun lt!570160 () Unit!41842)

(assert (=> b!1259625 (= lt!570159 lt!570160)))

(declare-fun lt!570162 () (_ BitVec 64))

(declare-fun lt!570156 () V!48335)

(declare-fun lt!570158 () (_ BitVec 64))

(declare-fun lt!570157 () ListLongMap!18867)

(declare-fun contains!7546 (ListLongMap!18867 (_ BitVec 64)) Bool)

(assert (=> b!1259625 (not (contains!7546 (+!4250 lt!570157 (tuple2!20995 lt!570158 lt!570156)) lt!570162))))

(declare-fun addStillNotContains!321 (ListLongMap!18867 (_ BitVec 64) V!48335 (_ BitVec 64)) Unit!41842)

(assert (=> b!1259625 (= lt!570160 (addStillNotContains!321 lt!570157 lt!570158 lt!570156 lt!570162))))

(assert (=> b!1259625 (= lt!570162 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1259625 (= lt!570156 (get!20220 (select (arr!39555 _values!914) #b00000000000000000000000000000000) (dynLambda!3415 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1259625 (= lt!570158 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1259625 (= lt!570157 call!61864)))

(assert (=> b!1259625 (= e!716646 (+!4250 call!61864 (tuple2!20995 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000) (get!20220 (select (arr!39555 _values!914) #b00000000000000000000000000000000) (dynLambda!3415 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1259626 () Bool)

(declare-fun e!716642 () ListLongMap!18867)

(assert (=> b!1259626 (= e!716642 (ListLongMap!18868 Nil!28194))))

(declare-fun d!138211 () Bool)

(declare-fun e!716641 () Bool)

(assert (=> d!138211 e!716641))

(declare-fun res!839516 () Bool)

(assert (=> d!138211 (=> (not res!839516) (not e!716641))))

(assert (=> d!138211 (= res!839516 (not (contains!7546 lt!570161 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138211 (= lt!570161 e!716642)))

(declare-fun c!122547 () Bool)

(assert (=> d!138211 (= c!122547 (bvsge #b00000000000000000000000000000000 (size!40092 _keys!1118)))))

(assert (=> d!138211 (validMask!0 mask!1466)))

(assert (=> d!138211 (= (getCurrentListMapNoExtraKeys!5820 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!570161)))

(declare-fun b!1259627 () Bool)

(declare-fun res!839514 () Bool)

(assert (=> b!1259627 (=> (not res!839514) (not e!716641))))

(assert (=> b!1259627 (= res!839514 (not (contains!7546 lt!570161 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1259628 () Bool)

(declare-fun e!716644 () Bool)

(assert (=> b!1259628 (= e!716644 e!716645)))

(assert (=> b!1259628 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40092 _keys!1118)))))

(declare-fun res!839513 () Bool)

(assert (=> b!1259628 (= res!839513 (contains!7546 lt!570161 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1259628 (=> (not res!839513) (not e!716645))))

(declare-fun bm!61861 () Bool)

(assert (=> bm!61861 (= call!61864 (getCurrentListMapNoExtraKeys!5820 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1259629 () Bool)

(declare-fun e!716640 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1259629 (= e!716640 (validKeyInArray!0 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1259629 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1259630 () Bool)

(assert (=> b!1259630 (= e!716641 e!716644)))

(declare-fun c!122550 () Bool)

(assert (=> b!1259630 (= c!122550 e!716640)))

(declare-fun res!839515 () Bool)

(assert (=> b!1259630 (=> (not res!839515) (not e!716640))))

(assert (=> b!1259630 (= res!839515 (bvslt #b00000000000000000000000000000000 (size!40092 _keys!1118)))))

(declare-fun b!1259631 () Bool)

(assert (=> b!1259631 (= e!716644 e!716643)))

(declare-fun c!122548 () Bool)

(assert (=> b!1259631 (= c!122548 (bvslt #b00000000000000000000000000000000 (size!40092 _keys!1118)))))

(declare-fun b!1259632 () Bool)

(declare-fun isEmpty!1040 (ListLongMap!18867) Bool)

(assert (=> b!1259632 (= e!716643 (isEmpty!1040 lt!570161))))

(declare-fun b!1259633 () Bool)

(assert (=> b!1259633 (= e!716642 e!716646)))

(declare-fun c!122549 () Bool)

(assert (=> b!1259633 (= c!122549 (validKeyInArray!0 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138211 c!122547) b!1259626))

(assert (= (and d!138211 (not c!122547)) b!1259633))

(assert (= (and b!1259633 c!122549) b!1259625))

(assert (= (and b!1259633 (not c!122549)) b!1259623))

(assert (= (or b!1259625 b!1259623) bm!61861))

(assert (= (and d!138211 res!839516) b!1259627))

(assert (= (and b!1259627 res!839514) b!1259630))

(assert (= (and b!1259630 res!839515) b!1259629))

(assert (= (and b!1259630 c!122550) b!1259628))

(assert (= (and b!1259630 (not c!122550)) b!1259631))

(assert (= (and b!1259628 res!839513) b!1259624))

(assert (= (and b!1259631 c!122548) b!1259622))

(assert (= (and b!1259631 (not c!122548)) b!1259632))

(declare-fun b_lambda!22733 () Bool)

(assert (=> (not b_lambda!22733) (not b!1259624)))

(declare-fun t!41686 () Bool)

(declare-fun tb!11303 () Bool)

(assert (=> (and start!105736 (= defaultEntry!922 defaultEntry!922) t!41686) tb!11303))

(declare-fun result!23333 () Bool)

(assert (=> tb!11303 (= result!23333 tp_is_empty!32227)))

(assert (=> b!1259624 t!41686))

(declare-fun b_and!45197 () Bool)

(assert (= b_and!45191 (and (=> t!41686 result!23333) b_and!45197)))

(declare-fun b_lambda!22735 () Bool)

(assert (=> (not b_lambda!22735) (not b!1259625)))

(assert (=> b!1259625 t!41686))

(declare-fun b_and!45199 () Bool)

(assert (= b_and!45197 (and (=> t!41686 result!23333) b_and!45199)))

(declare-fun m!1159711 () Bool)

(assert (=> b!1259632 m!1159711))

(declare-fun m!1159713 () Bool)

(assert (=> b!1259628 m!1159713))

(assert (=> b!1259628 m!1159713))

(declare-fun m!1159715 () Bool)

(assert (=> b!1259628 m!1159715))

(declare-fun m!1159717 () Bool)

(assert (=> b!1259627 m!1159717))

(declare-fun m!1159719 () Bool)

(assert (=> d!138211 m!1159719))

(assert (=> d!138211 m!1159625))

(declare-fun m!1159721 () Bool)

(assert (=> b!1259622 m!1159721))

(assert (=> b!1259633 m!1159713))

(assert (=> b!1259633 m!1159713))

(declare-fun m!1159723 () Bool)

(assert (=> b!1259633 m!1159723))

(assert (=> b!1259624 m!1159713))

(declare-fun m!1159725 () Bool)

(assert (=> b!1259624 m!1159725))

(declare-fun m!1159727 () Bool)

(assert (=> b!1259624 m!1159727))

(declare-fun m!1159729 () Bool)

(assert (=> b!1259624 m!1159729))

(assert (=> b!1259624 m!1159725))

(assert (=> b!1259624 m!1159727))

(assert (=> b!1259624 m!1159713))

(declare-fun m!1159731 () Bool)

(assert (=> b!1259624 m!1159731))

(assert (=> bm!61861 m!1159721))

(assert (=> b!1259629 m!1159713))

(assert (=> b!1259629 m!1159713))

(assert (=> b!1259629 m!1159723))

(assert (=> b!1259625 m!1159713))

(assert (=> b!1259625 m!1159725))

(assert (=> b!1259625 m!1159727))

(assert (=> b!1259625 m!1159729))

(declare-fun m!1159733 () Bool)

(assert (=> b!1259625 m!1159733))

(assert (=> b!1259625 m!1159725))

(assert (=> b!1259625 m!1159727))

(declare-fun m!1159735 () Bool)

(assert (=> b!1259625 m!1159735))

(declare-fun m!1159737 () Bool)

(assert (=> b!1259625 m!1159737))

(assert (=> b!1259625 m!1159733))

(declare-fun m!1159739 () Bool)

(assert (=> b!1259625 m!1159739))

(assert (=> b!1259536 d!138211))

(declare-fun e!716650 () Bool)

(declare-fun b!1259636 () Bool)

(declare-fun lt!570168 () ListLongMap!18867)

(assert (=> b!1259636 (= e!716650 (= lt!570168 (getCurrentListMapNoExtraKeys!5820 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1259637 () Bool)

(declare-fun e!716653 () ListLongMap!18867)

(declare-fun call!61865 () ListLongMap!18867)

(assert (=> b!1259637 (= e!716653 call!61865)))

(declare-fun b!1259638 () Bool)

(assert (=> b!1259638 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40092 _keys!1118)))))

(assert (=> b!1259638 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40093 _values!914)))))

(declare-fun e!716652 () Bool)

(assert (=> b!1259638 (= e!716652 (= (apply!985 lt!570168 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000)) (get!20220 (select (arr!39555 _values!914) #b00000000000000000000000000000000) (dynLambda!3415 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1259639 () Bool)

(declare-fun lt!570166 () Unit!41842)

(declare-fun lt!570167 () Unit!41842)

(assert (=> b!1259639 (= lt!570166 lt!570167)))

(declare-fun lt!570164 () ListLongMap!18867)

(declare-fun lt!570163 () V!48335)

(declare-fun lt!570169 () (_ BitVec 64))

(declare-fun lt!570165 () (_ BitVec 64))

(assert (=> b!1259639 (not (contains!7546 (+!4250 lt!570164 (tuple2!20995 lt!570165 lt!570163)) lt!570169))))

(assert (=> b!1259639 (= lt!570167 (addStillNotContains!321 lt!570164 lt!570165 lt!570163 lt!570169))))

(assert (=> b!1259639 (= lt!570169 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1259639 (= lt!570163 (get!20220 (select (arr!39555 _values!914) #b00000000000000000000000000000000) (dynLambda!3415 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1259639 (= lt!570165 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1259639 (= lt!570164 call!61865)))

(assert (=> b!1259639 (= e!716653 (+!4250 call!61865 (tuple2!20995 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000) (get!20220 (select (arr!39555 _values!914) #b00000000000000000000000000000000) (dynLambda!3415 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1259640 () Bool)

(declare-fun e!716649 () ListLongMap!18867)

(assert (=> b!1259640 (= e!716649 (ListLongMap!18868 Nil!28194))))

(declare-fun d!138213 () Bool)

(declare-fun e!716648 () Bool)

(assert (=> d!138213 e!716648))

(declare-fun res!839520 () Bool)

(assert (=> d!138213 (=> (not res!839520) (not e!716648))))

(assert (=> d!138213 (= res!839520 (not (contains!7546 lt!570168 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138213 (= lt!570168 e!716649)))

(declare-fun c!122551 () Bool)

(assert (=> d!138213 (= c!122551 (bvsge #b00000000000000000000000000000000 (size!40092 _keys!1118)))))

(assert (=> d!138213 (validMask!0 mask!1466)))

(assert (=> d!138213 (= (getCurrentListMapNoExtraKeys!5820 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!570168)))

(declare-fun b!1259641 () Bool)

(declare-fun res!839518 () Bool)

(assert (=> b!1259641 (=> (not res!839518) (not e!716648))))

(assert (=> b!1259641 (= res!839518 (not (contains!7546 lt!570168 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1259642 () Bool)

(declare-fun e!716651 () Bool)

(assert (=> b!1259642 (= e!716651 e!716652)))

(assert (=> b!1259642 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40092 _keys!1118)))))

(declare-fun res!839517 () Bool)

(assert (=> b!1259642 (= res!839517 (contains!7546 lt!570168 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1259642 (=> (not res!839517) (not e!716652))))

(declare-fun bm!61862 () Bool)

(assert (=> bm!61862 (= call!61865 (getCurrentListMapNoExtraKeys!5820 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1259643 () Bool)

(declare-fun e!716647 () Bool)

(assert (=> b!1259643 (= e!716647 (validKeyInArray!0 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1259643 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1259644 () Bool)

(assert (=> b!1259644 (= e!716648 e!716651)))

(declare-fun c!122554 () Bool)

(assert (=> b!1259644 (= c!122554 e!716647)))

(declare-fun res!839519 () Bool)

(assert (=> b!1259644 (=> (not res!839519) (not e!716647))))

(assert (=> b!1259644 (= res!839519 (bvslt #b00000000000000000000000000000000 (size!40092 _keys!1118)))))

(declare-fun b!1259645 () Bool)

(assert (=> b!1259645 (= e!716651 e!716650)))

(declare-fun c!122552 () Bool)

(assert (=> b!1259645 (= c!122552 (bvslt #b00000000000000000000000000000000 (size!40092 _keys!1118)))))

(declare-fun b!1259646 () Bool)

(assert (=> b!1259646 (= e!716650 (isEmpty!1040 lt!570168))))

(declare-fun b!1259647 () Bool)

(assert (=> b!1259647 (= e!716649 e!716653)))

(declare-fun c!122553 () Bool)

(assert (=> b!1259647 (= c!122553 (validKeyInArray!0 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138213 c!122551) b!1259640))

(assert (= (and d!138213 (not c!122551)) b!1259647))

(assert (= (and b!1259647 c!122553) b!1259639))

(assert (= (and b!1259647 (not c!122553)) b!1259637))

(assert (= (or b!1259639 b!1259637) bm!61862))

(assert (= (and d!138213 res!839520) b!1259641))

(assert (= (and b!1259641 res!839518) b!1259644))

(assert (= (and b!1259644 res!839519) b!1259643))

(assert (= (and b!1259644 c!122554) b!1259642))

(assert (= (and b!1259644 (not c!122554)) b!1259645))

(assert (= (and b!1259642 res!839517) b!1259638))

(assert (= (and b!1259645 c!122552) b!1259636))

(assert (= (and b!1259645 (not c!122552)) b!1259646))

(declare-fun b_lambda!22737 () Bool)

(assert (=> (not b_lambda!22737) (not b!1259638)))

(assert (=> b!1259638 t!41686))

(declare-fun b_and!45201 () Bool)

(assert (= b_and!45199 (and (=> t!41686 result!23333) b_and!45201)))

(declare-fun b_lambda!22739 () Bool)

(assert (=> (not b_lambda!22739) (not b!1259639)))

(assert (=> b!1259639 t!41686))

(declare-fun b_and!45203 () Bool)

(assert (= b_and!45201 (and (=> t!41686 result!23333) b_and!45203)))

(declare-fun m!1159741 () Bool)

(assert (=> b!1259646 m!1159741))

(assert (=> b!1259642 m!1159713))

(assert (=> b!1259642 m!1159713))

(declare-fun m!1159743 () Bool)

(assert (=> b!1259642 m!1159743))

(declare-fun m!1159745 () Bool)

(assert (=> b!1259641 m!1159745))

(declare-fun m!1159747 () Bool)

(assert (=> d!138213 m!1159747))

(assert (=> d!138213 m!1159625))

(declare-fun m!1159749 () Bool)

(assert (=> b!1259636 m!1159749))

(assert (=> b!1259647 m!1159713))

(assert (=> b!1259647 m!1159713))

(assert (=> b!1259647 m!1159723))

(assert (=> b!1259638 m!1159713))

(assert (=> b!1259638 m!1159725))

(assert (=> b!1259638 m!1159727))

(assert (=> b!1259638 m!1159729))

(assert (=> b!1259638 m!1159725))

(assert (=> b!1259638 m!1159727))

(assert (=> b!1259638 m!1159713))

(declare-fun m!1159751 () Bool)

(assert (=> b!1259638 m!1159751))

(assert (=> bm!61862 m!1159749))

(assert (=> b!1259643 m!1159713))

(assert (=> b!1259643 m!1159713))

(assert (=> b!1259643 m!1159723))

(assert (=> b!1259639 m!1159713))

(assert (=> b!1259639 m!1159725))

(assert (=> b!1259639 m!1159727))

(assert (=> b!1259639 m!1159729))

(declare-fun m!1159753 () Bool)

(assert (=> b!1259639 m!1159753))

(assert (=> b!1259639 m!1159725))

(assert (=> b!1259639 m!1159727))

(declare-fun m!1159755 () Bool)

(assert (=> b!1259639 m!1159755))

(declare-fun m!1159757 () Bool)

(assert (=> b!1259639 m!1159757))

(assert (=> b!1259639 m!1159753))

(declare-fun m!1159759 () Bool)

(assert (=> b!1259639 m!1159759))

(assert (=> b!1259536 d!138213))

(declare-fun d!138215 () Bool)

(assert (=> d!138215 (= (-!2069 (+!4250 lt!570079 (tuple2!20995 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) #b1000000000000000000000000000000000000000000000000000000000000000) lt!570079)))

(declare-fun lt!570172 () Unit!41842)

(declare-fun choose!1874 (ListLongMap!18867 (_ BitVec 64) V!48335) Unit!41842)

(assert (=> d!138215 (= lt!570172 (choose!1874 lt!570079 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> d!138215 (not (contains!7546 lt!570079 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138215 (= (addThenRemoveForNewKeyIsSame!326 lt!570079 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43) lt!570172)))

(declare-fun bs!35611 () Bool)

(assert (= bs!35611 d!138215))

(assert (=> bs!35611 m!1159621))

(assert (=> bs!35611 m!1159621))

(declare-fun m!1159761 () Bool)

(assert (=> bs!35611 m!1159761))

(declare-fun m!1159763 () Bool)

(assert (=> bs!35611 m!1159763))

(declare-fun m!1159765 () Bool)

(assert (=> bs!35611 m!1159765))

(assert (=> b!1259531 d!138215))

(declare-fun d!138217 () Bool)

(declare-fun lt!570175 () ListLongMap!18867)

(assert (=> d!138217 (not (contains!7546 lt!570175 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!142 (List!28197 (_ BitVec 64)) List!28197)

(assert (=> d!138217 (= lt!570175 (ListLongMap!18868 (removeStrictlySorted!142 (toList!9449 lt!570078) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138217 (= (-!2069 lt!570078 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570175)))

(declare-fun bs!35612 () Bool)

(assert (= bs!35612 d!138217))

(declare-fun m!1159767 () Bool)

(assert (=> bs!35612 m!1159767))

(declare-fun m!1159769 () Bool)

(assert (=> bs!35612 m!1159769))

(assert (=> b!1259531 d!138217))

(declare-fun d!138219 () Bool)

(declare-fun lt!570176 () ListLongMap!18867)

(assert (=> d!138219 (not (contains!7546 lt!570176 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138219 (= lt!570176 (ListLongMap!18868 (removeStrictlySorted!142 (toList!9449 lt!570080) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138219 (= (-!2069 lt!570080 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570176)))

(declare-fun bs!35613 () Bool)

(assert (= bs!35613 d!138219))

(declare-fun m!1159771 () Bool)

(assert (=> bs!35613 m!1159771))

(declare-fun m!1159773 () Bool)

(assert (=> bs!35613 m!1159773))

(assert (=> b!1259531 d!138219))

(declare-fun d!138221 () Bool)

(declare-fun e!716656 () Bool)

(assert (=> d!138221 e!716656))

(declare-fun res!839525 () Bool)

(assert (=> d!138221 (=> (not res!839525) (not e!716656))))

(declare-fun lt!570185 () ListLongMap!18867)

(assert (=> d!138221 (= res!839525 (contains!7546 lt!570185 (_1!10508 (tuple2!20995 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!570188 () List!28197)

(assert (=> d!138221 (= lt!570185 (ListLongMap!18868 lt!570188))))

(declare-fun lt!570187 () Unit!41842)

(declare-fun lt!570186 () Unit!41842)

(assert (=> d!138221 (= lt!570187 lt!570186)))

(declare-datatypes ((Option!711 0))(
  ( (Some!710 (v!18880 V!48335)) (None!709) )
))
(declare-fun getValueByKey!660 (List!28197 (_ BitVec 64)) Option!711)

(assert (=> d!138221 (= (getValueByKey!660 lt!570188 (_1!10508 (tuple2!20995 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!710 (_2!10508 (tuple2!20995 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lemmaContainsTupThenGetReturnValue!332 (List!28197 (_ BitVec 64) V!48335) Unit!41842)

(assert (=> d!138221 (= lt!570186 (lemmaContainsTupThenGetReturnValue!332 lt!570188 (_1!10508 (tuple2!20995 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10508 (tuple2!20995 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun insertStrictlySorted!446 (List!28197 (_ BitVec 64) V!48335) List!28197)

(assert (=> d!138221 (= lt!570188 (insertStrictlySorted!446 (toList!9449 lt!570079) (_1!10508 (tuple2!20995 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10508 (tuple2!20995 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138221 (= (+!4250 lt!570079 (tuple2!20995 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!570185)))

(declare-fun b!1259652 () Bool)

(declare-fun res!839526 () Bool)

(assert (=> b!1259652 (=> (not res!839526) (not e!716656))))

(assert (=> b!1259652 (= res!839526 (= (getValueByKey!660 (toList!9449 lt!570185) (_1!10508 (tuple2!20995 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!710 (_2!10508 (tuple2!20995 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1259653 () Bool)

(declare-fun contains!7547 (List!28197 tuple2!20994) Bool)

(assert (=> b!1259653 (= e!716656 (contains!7547 (toList!9449 lt!570185) (tuple2!20995 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!138221 res!839525) b!1259652))

(assert (= (and b!1259652 res!839526) b!1259653))

(declare-fun m!1159775 () Bool)

(assert (=> d!138221 m!1159775))

(declare-fun m!1159777 () Bool)

(assert (=> d!138221 m!1159777))

(declare-fun m!1159779 () Bool)

(assert (=> d!138221 m!1159779))

(declare-fun m!1159781 () Bool)

(assert (=> d!138221 m!1159781))

(declare-fun m!1159783 () Bool)

(assert (=> b!1259652 m!1159783))

(declare-fun m!1159785 () Bool)

(assert (=> b!1259653 m!1159785))

(assert (=> b!1259531 d!138221))

(declare-fun bm!61877 () Bool)

(declare-fun call!61880 () Bool)

(declare-fun lt!570252 () ListLongMap!18867)

(assert (=> bm!61877 (= call!61880 (contains!7546 lt!570252 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1259696 () Bool)

(declare-fun e!716695 () Unit!41842)

(declare-fun Unit!41844 () Unit!41842)

(assert (=> b!1259696 (= e!716695 Unit!41844)))

(declare-fun bm!61878 () Bool)

(declare-fun call!61881 () ListLongMap!18867)

(declare-fun call!61885 () ListLongMap!18867)

(assert (=> bm!61878 (= call!61881 call!61885)))

(declare-fun b!1259697 () Bool)

(declare-fun e!716683 () ListLongMap!18867)

(declare-fun call!61884 () ListLongMap!18867)

(assert (=> b!1259697 (= e!716683 call!61884)))

(declare-fun b!1259698 () Bool)

(declare-fun lt!570240 () Unit!41842)

(assert (=> b!1259698 (= e!716695 lt!570240)))

(declare-fun lt!570235 () ListLongMap!18867)

(assert (=> b!1259698 (= lt!570235 (getCurrentListMapNoExtraKeys!5820 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!570236 () (_ BitVec 64))

(assert (=> b!1259698 (= lt!570236 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!570247 () (_ BitVec 64))

(assert (=> b!1259698 (= lt!570247 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!570239 () Unit!41842)

(declare-fun addStillContains!1083 (ListLongMap!18867 (_ BitVec 64) V!48335 (_ BitVec 64)) Unit!41842)

(assert (=> b!1259698 (= lt!570239 (addStillContains!1083 lt!570235 lt!570236 zeroValue!871 lt!570247))))

(assert (=> b!1259698 (contains!7546 (+!4250 lt!570235 (tuple2!20995 lt!570236 zeroValue!871)) lt!570247)))

(declare-fun lt!570243 () Unit!41842)

(assert (=> b!1259698 (= lt!570243 lt!570239)))

(declare-fun lt!570237 () ListLongMap!18867)

(assert (=> b!1259698 (= lt!570237 (getCurrentListMapNoExtraKeys!5820 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!570246 () (_ BitVec 64))

(assert (=> b!1259698 (= lt!570246 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!570253 () (_ BitVec 64))

(assert (=> b!1259698 (= lt!570253 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!570234 () Unit!41842)

(declare-fun addApplyDifferent!526 (ListLongMap!18867 (_ BitVec 64) V!48335 (_ BitVec 64)) Unit!41842)

(assert (=> b!1259698 (= lt!570234 (addApplyDifferent!526 lt!570237 lt!570246 minValueAfter!43 lt!570253))))

(assert (=> b!1259698 (= (apply!985 (+!4250 lt!570237 (tuple2!20995 lt!570246 minValueAfter!43)) lt!570253) (apply!985 lt!570237 lt!570253))))

(declare-fun lt!570250 () Unit!41842)

(assert (=> b!1259698 (= lt!570250 lt!570234)))

(declare-fun lt!570245 () ListLongMap!18867)

(assert (=> b!1259698 (= lt!570245 (getCurrentListMapNoExtraKeys!5820 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!570241 () (_ BitVec 64))

(assert (=> b!1259698 (= lt!570241 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!570244 () (_ BitVec 64))

(assert (=> b!1259698 (= lt!570244 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!570249 () Unit!41842)

(assert (=> b!1259698 (= lt!570249 (addApplyDifferent!526 lt!570245 lt!570241 zeroValue!871 lt!570244))))

(assert (=> b!1259698 (= (apply!985 (+!4250 lt!570245 (tuple2!20995 lt!570241 zeroValue!871)) lt!570244) (apply!985 lt!570245 lt!570244))))

(declare-fun lt!570254 () Unit!41842)

(assert (=> b!1259698 (= lt!570254 lt!570249)))

(declare-fun lt!570248 () ListLongMap!18867)

(assert (=> b!1259698 (= lt!570248 (getCurrentListMapNoExtraKeys!5820 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!570251 () (_ BitVec 64))

(assert (=> b!1259698 (= lt!570251 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!570233 () (_ BitVec 64))

(assert (=> b!1259698 (= lt!570233 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1259698 (= lt!570240 (addApplyDifferent!526 lt!570248 lt!570251 minValueAfter!43 lt!570233))))

(assert (=> b!1259698 (= (apply!985 (+!4250 lt!570248 (tuple2!20995 lt!570251 minValueAfter!43)) lt!570233) (apply!985 lt!570248 lt!570233))))

(declare-fun bm!61879 () Bool)

(declare-fun call!61883 () Bool)

(assert (=> bm!61879 (= call!61883 (contains!7546 lt!570252 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1259699 () Bool)

(declare-fun e!716694 () Bool)

(assert (=> b!1259699 (= e!716694 (not call!61883))))

(declare-fun b!1259700 () Bool)

(declare-fun res!839551 () Bool)

(declare-fun e!716692 () Bool)

(assert (=> b!1259700 (=> (not res!839551) (not e!716692))))

(declare-fun e!716693 () Bool)

(assert (=> b!1259700 (= res!839551 e!716693)))

(declare-fun c!122567 () Bool)

(assert (=> b!1259700 (= c!122567 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1259701 () Bool)

(declare-fun e!716690 () Bool)

(assert (=> b!1259701 (= e!716690 (= (apply!985 lt!570252 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun d!138223 () Bool)

(assert (=> d!138223 e!716692))

(declare-fun res!839550 () Bool)

(assert (=> d!138223 (=> (not res!839550) (not e!716692))))

(assert (=> d!138223 (= res!839550 (or (bvsge #b00000000000000000000000000000000 (size!40092 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40092 _keys!1118)))))))

(declare-fun lt!570238 () ListLongMap!18867)

(assert (=> d!138223 (= lt!570252 lt!570238)))

(declare-fun lt!570242 () Unit!41842)

(assert (=> d!138223 (= lt!570242 e!716695)))

(declare-fun c!122571 () Bool)

(declare-fun e!716688 () Bool)

(assert (=> d!138223 (= c!122571 e!716688)))

(declare-fun res!839548 () Bool)

(assert (=> d!138223 (=> (not res!839548) (not e!716688))))

(assert (=> d!138223 (= res!839548 (bvslt #b00000000000000000000000000000000 (size!40092 _keys!1118)))))

(declare-fun e!716686 () ListLongMap!18867)

(assert (=> d!138223 (= lt!570238 e!716686)))

(declare-fun c!122569 () Bool)

(assert (=> d!138223 (= c!122569 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138223 (validMask!0 mask!1466)))

(assert (=> d!138223 (= (getCurrentListMap!4535 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!570252)))

(declare-fun b!1259702 () Bool)

(declare-fun res!839546 () Bool)

(assert (=> b!1259702 (=> (not res!839546) (not e!716692))))

(declare-fun e!716689 () Bool)

(assert (=> b!1259702 (= res!839546 e!716689)))

(declare-fun res!839547 () Bool)

(assert (=> b!1259702 (=> res!839547 e!716689)))

(declare-fun e!716691 () Bool)

(assert (=> b!1259702 (= res!839547 (not e!716691))))

(declare-fun res!839545 () Bool)

(assert (=> b!1259702 (=> (not res!839545) (not e!716691))))

(assert (=> b!1259702 (= res!839545 (bvslt #b00000000000000000000000000000000 (size!40092 _keys!1118)))))

(declare-fun b!1259703 () Bool)

(assert (=> b!1259703 (= e!716686 e!716683)))

(declare-fun c!122572 () Bool)

(assert (=> b!1259703 (= c!122572 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!716684 () Bool)

(declare-fun b!1259704 () Bool)

(assert (=> b!1259704 (= e!716684 (= (apply!985 lt!570252 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000)) (get!20220 (select (arr!39555 _values!914) #b00000000000000000000000000000000) (dynLambda!3415 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1259704 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40093 _values!914)))))

(assert (=> b!1259704 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40092 _keys!1118)))))

(declare-fun b!1259705 () Bool)

(declare-fun c!122568 () Bool)

(assert (=> b!1259705 (= c!122568 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!716687 () ListLongMap!18867)

(assert (=> b!1259705 (= e!716683 e!716687)))

(declare-fun bm!61880 () Bool)

(declare-fun call!61886 () ListLongMap!18867)

(declare-fun call!61882 () ListLongMap!18867)

(assert (=> bm!61880 (= call!61882 (+!4250 (ite c!122569 call!61886 (ite c!122572 call!61885 call!61881)) (ite (or c!122569 c!122572) (tuple2!20995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20995 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1259706 () Bool)

(assert (=> b!1259706 (= e!716686 (+!4250 call!61882 (tuple2!20995 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun b!1259707 () Bool)

(assert (=> b!1259707 (= e!716689 e!716684)))

(declare-fun res!839553 () Bool)

(assert (=> b!1259707 (=> (not res!839553) (not e!716684))))

(assert (=> b!1259707 (= res!839553 (contains!7546 lt!570252 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1259707 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40092 _keys!1118)))))

(declare-fun b!1259708 () Bool)

(declare-fun e!716685 () Bool)

(assert (=> b!1259708 (= e!716693 e!716685)))

(declare-fun res!839549 () Bool)

(assert (=> b!1259708 (= res!839549 call!61880)))

(assert (=> b!1259708 (=> (not res!839549) (not e!716685))))

(declare-fun b!1259709 () Bool)

(assert (=> b!1259709 (= e!716693 (not call!61880))))

(declare-fun bm!61881 () Bool)

(assert (=> bm!61881 (= call!61884 call!61882)))

(declare-fun b!1259710 () Bool)

(assert (=> b!1259710 (= e!716694 e!716690)))

(declare-fun res!839552 () Bool)

(assert (=> b!1259710 (= res!839552 call!61883)))

(assert (=> b!1259710 (=> (not res!839552) (not e!716690))))

(declare-fun b!1259711 () Bool)

(assert (=> b!1259711 (= e!716685 (= (apply!985 lt!570252 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1259712 () Bool)

(assert (=> b!1259712 (= e!716692 e!716694)))

(declare-fun c!122570 () Bool)

(assert (=> b!1259712 (= c!122570 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259713 () Bool)

(assert (=> b!1259713 (= e!716688 (validKeyInArray!0 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61882 () Bool)

(assert (=> bm!61882 (= call!61885 call!61886)))

(declare-fun b!1259714 () Bool)

(assert (=> b!1259714 (= e!716691 (validKeyInArray!0 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1259715 () Bool)

(assert (=> b!1259715 (= e!716687 call!61884)))

(declare-fun b!1259716 () Bool)

(assert (=> b!1259716 (= e!716687 call!61881)))

(declare-fun bm!61883 () Bool)

(assert (=> bm!61883 (= call!61886 (getCurrentListMapNoExtraKeys!5820 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and d!138223 c!122569) b!1259706))

(assert (= (and d!138223 (not c!122569)) b!1259703))

(assert (= (and b!1259703 c!122572) b!1259697))

(assert (= (and b!1259703 (not c!122572)) b!1259705))

(assert (= (and b!1259705 c!122568) b!1259715))

(assert (= (and b!1259705 (not c!122568)) b!1259716))

(assert (= (or b!1259715 b!1259716) bm!61878))

(assert (= (or b!1259697 bm!61878) bm!61882))

(assert (= (or b!1259697 b!1259715) bm!61881))

(assert (= (or b!1259706 bm!61882) bm!61883))

(assert (= (or b!1259706 bm!61881) bm!61880))

(assert (= (and d!138223 res!839548) b!1259713))

(assert (= (and d!138223 c!122571) b!1259698))

(assert (= (and d!138223 (not c!122571)) b!1259696))

(assert (= (and d!138223 res!839550) b!1259702))

(assert (= (and b!1259702 res!839545) b!1259714))

(assert (= (and b!1259702 (not res!839547)) b!1259707))

(assert (= (and b!1259707 res!839553) b!1259704))

(assert (= (and b!1259702 res!839546) b!1259700))

(assert (= (and b!1259700 c!122567) b!1259708))

(assert (= (and b!1259700 (not c!122567)) b!1259709))

(assert (= (and b!1259708 res!839549) b!1259711))

(assert (= (or b!1259708 b!1259709) bm!61877))

(assert (= (and b!1259700 res!839551) b!1259712))

(assert (= (and b!1259712 c!122570) b!1259710))

(assert (= (and b!1259712 (not c!122570)) b!1259699))

(assert (= (and b!1259710 res!839552) b!1259701))

(assert (= (or b!1259710 b!1259699) bm!61879))

(declare-fun b_lambda!22741 () Bool)

(assert (=> (not b_lambda!22741) (not b!1259704)))

(assert (=> b!1259704 t!41686))

(declare-fun b_and!45205 () Bool)

(assert (= b_and!45203 (and (=> t!41686 result!23333) b_and!45205)))

(assert (=> bm!61883 m!1159633))

(assert (=> b!1259704 m!1159713))

(assert (=> b!1259704 m!1159727))

(assert (=> b!1259704 m!1159713))

(declare-fun m!1159787 () Bool)

(assert (=> b!1259704 m!1159787))

(assert (=> b!1259704 m!1159725))

(assert (=> b!1259704 m!1159727))

(assert (=> b!1259704 m!1159729))

(assert (=> b!1259704 m!1159725))

(assert (=> b!1259714 m!1159713))

(assert (=> b!1259714 m!1159713))

(assert (=> b!1259714 m!1159723))

(declare-fun m!1159789 () Bool)

(assert (=> bm!61880 m!1159789))

(declare-fun m!1159791 () Bool)

(assert (=> b!1259711 m!1159791))

(assert (=> b!1259713 m!1159713))

(assert (=> b!1259713 m!1159713))

(assert (=> b!1259713 m!1159723))

(assert (=> d!138223 m!1159625))

(assert (=> b!1259698 m!1159633))

(declare-fun m!1159793 () Bool)

(assert (=> b!1259698 m!1159793))

(declare-fun m!1159795 () Bool)

(assert (=> b!1259698 m!1159795))

(declare-fun m!1159797 () Bool)

(assert (=> b!1259698 m!1159797))

(assert (=> b!1259698 m!1159795))

(declare-fun m!1159799 () Bool)

(assert (=> b!1259698 m!1159799))

(declare-fun m!1159801 () Bool)

(assert (=> b!1259698 m!1159801))

(declare-fun m!1159803 () Bool)

(assert (=> b!1259698 m!1159803))

(declare-fun m!1159805 () Bool)

(assert (=> b!1259698 m!1159805))

(assert (=> b!1259698 m!1159803))

(declare-fun m!1159807 () Bool)

(assert (=> b!1259698 m!1159807))

(declare-fun m!1159809 () Bool)

(assert (=> b!1259698 m!1159809))

(assert (=> b!1259698 m!1159799))

(declare-fun m!1159811 () Bool)

(assert (=> b!1259698 m!1159811))

(declare-fun m!1159813 () Bool)

(assert (=> b!1259698 m!1159813))

(declare-fun m!1159815 () Bool)

(assert (=> b!1259698 m!1159815))

(assert (=> b!1259698 m!1159811))

(declare-fun m!1159817 () Bool)

(assert (=> b!1259698 m!1159817))

(declare-fun m!1159819 () Bool)

(assert (=> b!1259698 m!1159819))

(declare-fun m!1159821 () Bool)

(assert (=> b!1259698 m!1159821))

(assert (=> b!1259698 m!1159713))

(declare-fun m!1159823 () Bool)

(assert (=> b!1259706 m!1159823))

(declare-fun m!1159825 () Bool)

(assert (=> b!1259701 m!1159825))

(declare-fun m!1159827 () Bool)

(assert (=> bm!61877 m!1159827))

(assert (=> b!1259707 m!1159713))

(assert (=> b!1259707 m!1159713))

(declare-fun m!1159829 () Bool)

(assert (=> b!1259707 m!1159829))

(declare-fun m!1159831 () Bool)

(assert (=> bm!61879 m!1159831))

(assert (=> b!1259531 d!138223))

(declare-fun d!138225 () Bool)

(declare-fun e!716696 () Bool)

(assert (=> d!138225 e!716696))

(declare-fun res!839554 () Bool)

(assert (=> d!138225 (=> (not res!839554) (not e!716696))))

(declare-fun lt!570255 () ListLongMap!18867)

(assert (=> d!138225 (= res!839554 (contains!7546 lt!570255 (_1!10508 lt!570077)))))

(declare-fun lt!570258 () List!28197)

(assert (=> d!138225 (= lt!570255 (ListLongMap!18868 lt!570258))))

(declare-fun lt!570257 () Unit!41842)

(declare-fun lt!570256 () Unit!41842)

(assert (=> d!138225 (= lt!570257 lt!570256)))

(assert (=> d!138225 (= (getValueByKey!660 lt!570258 (_1!10508 lt!570077)) (Some!710 (_2!10508 lt!570077)))))

(assert (=> d!138225 (= lt!570256 (lemmaContainsTupThenGetReturnValue!332 lt!570258 (_1!10508 lt!570077) (_2!10508 lt!570077)))))

(assert (=> d!138225 (= lt!570258 (insertStrictlySorted!446 (toList!9449 lt!570083) (_1!10508 lt!570077) (_2!10508 lt!570077)))))

(assert (=> d!138225 (= (+!4250 lt!570083 lt!570077) lt!570255)))

(declare-fun b!1259717 () Bool)

(declare-fun res!839555 () Bool)

(assert (=> b!1259717 (=> (not res!839555) (not e!716696))))

(assert (=> b!1259717 (= res!839555 (= (getValueByKey!660 (toList!9449 lt!570255) (_1!10508 lt!570077)) (Some!710 (_2!10508 lt!570077))))))

(declare-fun b!1259718 () Bool)

(assert (=> b!1259718 (= e!716696 (contains!7547 (toList!9449 lt!570255) lt!570077))))

(assert (= (and d!138225 res!839554) b!1259717))

(assert (= (and b!1259717 res!839555) b!1259718))

(declare-fun m!1159833 () Bool)

(assert (=> d!138225 m!1159833))

(declare-fun m!1159835 () Bool)

(assert (=> d!138225 m!1159835))

(declare-fun m!1159837 () Bool)

(assert (=> d!138225 m!1159837))

(declare-fun m!1159839 () Bool)

(assert (=> d!138225 m!1159839))

(declare-fun m!1159841 () Bool)

(assert (=> b!1259717 m!1159841))

(declare-fun m!1159843 () Bool)

(assert (=> b!1259718 m!1159843))

(assert (=> b!1259531 d!138225))

(declare-fun bm!61884 () Bool)

(declare-fun call!61887 () Bool)

(declare-fun lt!570278 () ListLongMap!18867)

(assert (=> bm!61884 (= call!61887 (contains!7546 lt!570278 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1259719 () Bool)

(declare-fun e!716709 () Unit!41842)

(declare-fun Unit!41845 () Unit!41842)

(assert (=> b!1259719 (= e!716709 Unit!41845)))

(declare-fun bm!61885 () Bool)

(declare-fun call!61888 () ListLongMap!18867)

(declare-fun call!61892 () ListLongMap!18867)

(assert (=> bm!61885 (= call!61888 call!61892)))

(declare-fun b!1259720 () Bool)

(declare-fun e!716697 () ListLongMap!18867)

(declare-fun call!61891 () ListLongMap!18867)

(assert (=> b!1259720 (= e!716697 call!61891)))

(declare-fun b!1259721 () Bool)

(declare-fun lt!570266 () Unit!41842)

(assert (=> b!1259721 (= e!716709 lt!570266)))

(declare-fun lt!570261 () ListLongMap!18867)

(assert (=> b!1259721 (= lt!570261 (getCurrentListMapNoExtraKeys!5820 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!570262 () (_ BitVec 64))

(assert (=> b!1259721 (= lt!570262 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!570273 () (_ BitVec 64))

(assert (=> b!1259721 (= lt!570273 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!570265 () Unit!41842)

(assert (=> b!1259721 (= lt!570265 (addStillContains!1083 lt!570261 lt!570262 zeroValue!871 lt!570273))))

(assert (=> b!1259721 (contains!7546 (+!4250 lt!570261 (tuple2!20995 lt!570262 zeroValue!871)) lt!570273)))

(declare-fun lt!570269 () Unit!41842)

(assert (=> b!1259721 (= lt!570269 lt!570265)))

(declare-fun lt!570263 () ListLongMap!18867)

(assert (=> b!1259721 (= lt!570263 (getCurrentListMapNoExtraKeys!5820 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!570272 () (_ BitVec 64))

(assert (=> b!1259721 (= lt!570272 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!570279 () (_ BitVec 64))

(assert (=> b!1259721 (= lt!570279 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!570260 () Unit!41842)

(assert (=> b!1259721 (= lt!570260 (addApplyDifferent!526 lt!570263 lt!570272 minValueBefore!43 lt!570279))))

(assert (=> b!1259721 (= (apply!985 (+!4250 lt!570263 (tuple2!20995 lt!570272 minValueBefore!43)) lt!570279) (apply!985 lt!570263 lt!570279))))

(declare-fun lt!570276 () Unit!41842)

(assert (=> b!1259721 (= lt!570276 lt!570260)))

(declare-fun lt!570271 () ListLongMap!18867)

(assert (=> b!1259721 (= lt!570271 (getCurrentListMapNoExtraKeys!5820 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!570267 () (_ BitVec 64))

(assert (=> b!1259721 (= lt!570267 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!570270 () (_ BitVec 64))

(assert (=> b!1259721 (= lt!570270 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!570275 () Unit!41842)

(assert (=> b!1259721 (= lt!570275 (addApplyDifferent!526 lt!570271 lt!570267 zeroValue!871 lt!570270))))

(assert (=> b!1259721 (= (apply!985 (+!4250 lt!570271 (tuple2!20995 lt!570267 zeroValue!871)) lt!570270) (apply!985 lt!570271 lt!570270))))

(declare-fun lt!570280 () Unit!41842)

(assert (=> b!1259721 (= lt!570280 lt!570275)))

(declare-fun lt!570274 () ListLongMap!18867)

(assert (=> b!1259721 (= lt!570274 (getCurrentListMapNoExtraKeys!5820 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!570277 () (_ BitVec 64))

(assert (=> b!1259721 (= lt!570277 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!570259 () (_ BitVec 64))

(assert (=> b!1259721 (= lt!570259 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1259721 (= lt!570266 (addApplyDifferent!526 lt!570274 lt!570277 minValueBefore!43 lt!570259))))

(assert (=> b!1259721 (= (apply!985 (+!4250 lt!570274 (tuple2!20995 lt!570277 minValueBefore!43)) lt!570259) (apply!985 lt!570274 lt!570259))))

(declare-fun bm!61886 () Bool)

(declare-fun call!61890 () Bool)

(assert (=> bm!61886 (= call!61890 (contains!7546 lt!570278 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1259722 () Bool)

(declare-fun e!716708 () Bool)

(assert (=> b!1259722 (= e!716708 (not call!61890))))

(declare-fun b!1259723 () Bool)

(declare-fun res!839562 () Bool)

(declare-fun e!716706 () Bool)

(assert (=> b!1259723 (=> (not res!839562) (not e!716706))))

(declare-fun e!716707 () Bool)

(assert (=> b!1259723 (= res!839562 e!716707)))

(declare-fun c!122573 () Bool)

(assert (=> b!1259723 (= c!122573 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1259724 () Bool)

(declare-fun e!716704 () Bool)

(assert (=> b!1259724 (= e!716704 (= (apply!985 lt!570278 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun d!138227 () Bool)

(assert (=> d!138227 e!716706))

(declare-fun res!839561 () Bool)

(assert (=> d!138227 (=> (not res!839561) (not e!716706))))

(assert (=> d!138227 (= res!839561 (or (bvsge #b00000000000000000000000000000000 (size!40092 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40092 _keys!1118)))))))

(declare-fun lt!570264 () ListLongMap!18867)

(assert (=> d!138227 (= lt!570278 lt!570264)))

(declare-fun lt!570268 () Unit!41842)

(assert (=> d!138227 (= lt!570268 e!716709)))

(declare-fun c!122577 () Bool)

(declare-fun e!716702 () Bool)

(assert (=> d!138227 (= c!122577 e!716702)))

(declare-fun res!839559 () Bool)

(assert (=> d!138227 (=> (not res!839559) (not e!716702))))

(assert (=> d!138227 (= res!839559 (bvslt #b00000000000000000000000000000000 (size!40092 _keys!1118)))))

(declare-fun e!716700 () ListLongMap!18867)

(assert (=> d!138227 (= lt!570264 e!716700)))

(declare-fun c!122575 () Bool)

(assert (=> d!138227 (= c!122575 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138227 (validMask!0 mask!1466)))

(assert (=> d!138227 (= (getCurrentListMap!4535 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!570278)))

(declare-fun b!1259725 () Bool)

(declare-fun res!839557 () Bool)

(assert (=> b!1259725 (=> (not res!839557) (not e!716706))))

(declare-fun e!716703 () Bool)

(assert (=> b!1259725 (= res!839557 e!716703)))

(declare-fun res!839558 () Bool)

(assert (=> b!1259725 (=> res!839558 e!716703)))

(declare-fun e!716705 () Bool)

(assert (=> b!1259725 (= res!839558 (not e!716705))))

(declare-fun res!839556 () Bool)

(assert (=> b!1259725 (=> (not res!839556) (not e!716705))))

(assert (=> b!1259725 (= res!839556 (bvslt #b00000000000000000000000000000000 (size!40092 _keys!1118)))))

(declare-fun b!1259726 () Bool)

(assert (=> b!1259726 (= e!716700 e!716697)))

(declare-fun c!122578 () Bool)

(assert (=> b!1259726 (= c!122578 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!716698 () Bool)

(declare-fun b!1259727 () Bool)

(assert (=> b!1259727 (= e!716698 (= (apply!985 lt!570278 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000)) (get!20220 (select (arr!39555 _values!914) #b00000000000000000000000000000000) (dynLambda!3415 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1259727 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40093 _values!914)))))

(assert (=> b!1259727 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40092 _keys!1118)))))

(declare-fun b!1259728 () Bool)

(declare-fun c!122574 () Bool)

(assert (=> b!1259728 (= c!122574 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!716701 () ListLongMap!18867)

(assert (=> b!1259728 (= e!716697 e!716701)))

(declare-fun bm!61887 () Bool)

(declare-fun call!61893 () ListLongMap!18867)

(declare-fun call!61889 () ListLongMap!18867)

(assert (=> bm!61887 (= call!61889 (+!4250 (ite c!122575 call!61893 (ite c!122578 call!61892 call!61888)) (ite (or c!122575 c!122578) (tuple2!20995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20995 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1259729 () Bool)

(assert (=> b!1259729 (= e!716700 (+!4250 call!61889 (tuple2!20995 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1259730 () Bool)

(assert (=> b!1259730 (= e!716703 e!716698)))

(declare-fun res!839564 () Bool)

(assert (=> b!1259730 (=> (not res!839564) (not e!716698))))

(assert (=> b!1259730 (= res!839564 (contains!7546 lt!570278 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1259730 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40092 _keys!1118)))))

(declare-fun b!1259731 () Bool)

(declare-fun e!716699 () Bool)

(assert (=> b!1259731 (= e!716707 e!716699)))

(declare-fun res!839560 () Bool)

(assert (=> b!1259731 (= res!839560 call!61887)))

(assert (=> b!1259731 (=> (not res!839560) (not e!716699))))

(declare-fun b!1259732 () Bool)

(assert (=> b!1259732 (= e!716707 (not call!61887))))

(declare-fun bm!61888 () Bool)

(assert (=> bm!61888 (= call!61891 call!61889)))

(declare-fun b!1259733 () Bool)

(assert (=> b!1259733 (= e!716708 e!716704)))

(declare-fun res!839563 () Bool)

(assert (=> b!1259733 (= res!839563 call!61890)))

(assert (=> b!1259733 (=> (not res!839563) (not e!716704))))

(declare-fun b!1259734 () Bool)

(assert (=> b!1259734 (= e!716699 (= (apply!985 lt!570278 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1259735 () Bool)

(assert (=> b!1259735 (= e!716706 e!716708)))

(declare-fun c!122576 () Bool)

(assert (=> b!1259735 (= c!122576 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259736 () Bool)

(assert (=> b!1259736 (= e!716702 (validKeyInArray!0 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61889 () Bool)

(assert (=> bm!61889 (= call!61892 call!61893)))

(declare-fun b!1259737 () Bool)

(assert (=> b!1259737 (= e!716705 (validKeyInArray!0 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1259738 () Bool)

(assert (=> b!1259738 (= e!716701 call!61891)))

(declare-fun b!1259739 () Bool)

(assert (=> b!1259739 (= e!716701 call!61888)))

(declare-fun bm!61890 () Bool)

(assert (=> bm!61890 (= call!61893 (getCurrentListMapNoExtraKeys!5820 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and d!138227 c!122575) b!1259729))

(assert (= (and d!138227 (not c!122575)) b!1259726))

(assert (= (and b!1259726 c!122578) b!1259720))

(assert (= (and b!1259726 (not c!122578)) b!1259728))

(assert (= (and b!1259728 c!122574) b!1259738))

(assert (= (and b!1259728 (not c!122574)) b!1259739))

(assert (= (or b!1259738 b!1259739) bm!61885))

(assert (= (or b!1259720 bm!61885) bm!61889))

(assert (= (or b!1259720 b!1259738) bm!61888))

(assert (= (or b!1259729 bm!61889) bm!61890))

(assert (= (or b!1259729 bm!61888) bm!61887))

(assert (= (and d!138227 res!839559) b!1259736))

(assert (= (and d!138227 c!122577) b!1259721))

(assert (= (and d!138227 (not c!122577)) b!1259719))

(assert (= (and d!138227 res!839561) b!1259725))

(assert (= (and b!1259725 res!839556) b!1259737))

(assert (= (and b!1259725 (not res!839558)) b!1259730))

(assert (= (and b!1259730 res!839564) b!1259727))

(assert (= (and b!1259725 res!839557) b!1259723))

(assert (= (and b!1259723 c!122573) b!1259731))

(assert (= (and b!1259723 (not c!122573)) b!1259732))

(assert (= (and b!1259731 res!839560) b!1259734))

(assert (= (or b!1259731 b!1259732) bm!61884))

(assert (= (and b!1259723 res!839562) b!1259735))

(assert (= (and b!1259735 c!122576) b!1259733))

(assert (= (and b!1259735 (not c!122576)) b!1259722))

(assert (= (and b!1259733 res!839563) b!1259724))

(assert (= (or b!1259733 b!1259722) bm!61886))

(declare-fun b_lambda!22743 () Bool)

(assert (=> (not b_lambda!22743) (not b!1259727)))

(assert (=> b!1259727 t!41686))

(declare-fun b_and!45207 () Bool)

(assert (= b_and!45205 (and (=> t!41686 result!23333) b_and!45207)))

(assert (=> bm!61890 m!1159635))

(assert (=> b!1259727 m!1159713))

(assert (=> b!1259727 m!1159727))

(assert (=> b!1259727 m!1159713))

(declare-fun m!1159845 () Bool)

(assert (=> b!1259727 m!1159845))

(assert (=> b!1259727 m!1159725))

(assert (=> b!1259727 m!1159727))

(assert (=> b!1259727 m!1159729))

(assert (=> b!1259727 m!1159725))

(assert (=> b!1259737 m!1159713))

(assert (=> b!1259737 m!1159713))

(assert (=> b!1259737 m!1159723))

(declare-fun m!1159847 () Bool)

(assert (=> bm!61887 m!1159847))

(declare-fun m!1159849 () Bool)

(assert (=> b!1259734 m!1159849))

(assert (=> b!1259736 m!1159713))

(assert (=> b!1259736 m!1159713))

(assert (=> b!1259736 m!1159723))

(assert (=> d!138227 m!1159625))

(assert (=> b!1259721 m!1159635))

(declare-fun m!1159851 () Bool)

(assert (=> b!1259721 m!1159851))

(declare-fun m!1159853 () Bool)

(assert (=> b!1259721 m!1159853))

(declare-fun m!1159855 () Bool)

(assert (=> b!1259721 m!1159855))

(assert (=> b!1259721 m!1159853))

(declare-fun m!1159857 () Bool)

(assert (=> b!1259721 m!1159857))

(declare-fun m!1159859 () Bool)

(assert (=> b!1259721 m!1159859))

(declare-fun m!1159861 () Bool)

(assert (=> b!1259721 m!1159861))

(declare-fun m!1159863 () Bool)

(assert (=> b!1259721 m!1159863))

(assert (=> b!1259721 m!1159861))

(declare-fun m!1159865 () Bool)

(assert (=> b!1259721 m!1159865))

(declare-fun m!1159867 () Bool)

(assert (=> b!1259721 m!1159867))

(assert (=> b!1259721 m!1159857))

(declare-fun m!1159869 () Bool)

(assert (=> b!1259721 m!1159869))

(declare-fun m!1159871 () Bool)

(assert (=> b!1259721 m!1159871))

(declare-fun m!1159873 () Bool)

(assert (=> b!1259721 m!1159873))

(assert (=> b!1259721 m!1159869))

(declare-fun m!1159875 () Bool)

(assert (=> b!1259721 m!1159875))

(declare-fun m!1159877 () Bool)

(assert (=> b!1259721 m!1159877))

(declare-fun m!1159879 () Bool)

(assert (=> b!1259721 m!1159879))

(assert (=> b!1259721 m!1159713))

(declare-fun m!1159881 () Bool)

(assert (=> b!1259729 m!1159881))

(declare-fun m!1159883 () Bool)

(assert (=> b!1259724 m!1159883))

(declare-fun m!1159885 () Bool)

(assert (=> bm!61884 m!1159885))

(assert (=> b!1259730 m!1159713))

(assert (=> b!1259730 m!1159713))

(declare-fun m!1159887 () Bool)

(assert (=> b!1259730 m!1159887))

(declare-fun m!1159889 () Bool)

(assert (=> bm!61886 m!1159889))

(assert (=> b!1259531 d!138227))

(declare-fun d!138229 () Bool)

(assert (=> d!138229 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105736 d!138229))

(declare-fun d!138231 () Bool)

(assert (=> d!138231 (= (array_inv!30259 _keys!1118) (bvsge (size!40092 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105736 d!138231))

(declare-fun d!138233 () Bool)

(assert (=> d!138233 (= (array_inv!30260 _values!914) (bvsge (size!40093 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105736 d!138233))

(declare-fun b!1259748 () Bool)

(declare-fun e!716716 () Bool)

(declare-fun call!61896 () Bool)

(assert (=> b!1259748 (= e!716716 call!61896)))

(declare-fun b!1259749 () Bool)

(declare-fun e!716718 () Bool)

(assert (=> b!1259749 (= e!716716 e!716718)))

(declare-fun lt!570287 () (_ BitVec 64))

(assert (=> b!1259749 (= lt!570287 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!570288 () Unit!41842)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81997 (_ BitVec 64) (_ BitVec 32)) Unit!41842)

(assert (=> b!1259749 (= lt!570288 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!570287 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81997 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1259749 (arrayContainsKey!0 _keys!1118 lt!570287 #b00000000000000000000000000000000)))

(declare-fun lt!570289 () Unit!41842)

(assert (=> b!1259749 (= lt!570289 lt!570288)))

(declare-fun res!839570 () Bool)

(declare-datatypes ((SeekEntryResult!9969 0))(
  ( (MissingZero!9969 (index!42247 (_ BitVec 32))) (Found!9969 (index!42248 (_ BitVec 32))) (Intermediate!9969 (undefined!10781 Bool) (index!42249 (_ BitVec 32)) (x!110973 (_ BitVec 32))) (Undefined!9969) (MissingVacant!9969 (index!42250 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81997 (_ BitVec 32)) SeekEntryResult!9969)

(assert (=> b!1259749 (= res!839570 (= (seekEntryOrOpen!0 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9969 #b00000000000000000000000000000000)))))

(assert (=> b!1259749 (=> (not res!839570) (not e!716718))))

(declare-fun b!1259750 () Bool)

(declare-fun e!716717 () Bool)

(assert (=> b!1259750 (= e!716717 e!716716)))

(declare-fun c!122581 () Bool)

(assert (=> b!1259750 (= c!122581 (validKeyInArray!0 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1259751 () Bool)

(assert (=> b!1259751 (= e!716718 call!61896)))

(declare-fun d!138235 () Bool)

(declare-fun res!839569 () Bool)

(assert (=> d!138235 (=> res!839569 e!716717)))

(assert (=> d!138235 (= res!839569 (bvsge #b00000000000000000000000000000000 (size!40092 _keys!1118)))))

(assert (=> d!138235 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!716717)))

(declare-fun bm!61893 () Bool)

(assert (=> bm!61893 (= call!61896 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(assert (= (and d!138235 (not res!839569)) b!1259750))

(assert (= (and b!1259750 c!122581) b!1259749))

(assert (= (and b!1259750 (not c!122581)) b!1259748))

(assert (= (and b!1259749 res!839570) b!1259751))

(assert (= (or b!1259751 b!1259748) bm!61893))

(assert (=> b!1259749 m!1159713))

(declare-fun m!1159891 () Bool)

(assert (=> b!1259749 m!1159891))

(declare-fun m!1159893 () Bool)

(assert (=> b!1259749 m!1159893))

(assert (=> b!1259749 m!1159713))

(declare-fun m!1159895 () Bool)

(assert (=> b!1259749 m!1159895))

(assert (=> b!1259750 m!1159713))

(assert (=> b!1259750 m!1159713))

(assert (=> b!1259750 m!1159723))

(declare-fun m!1159897 () Bool)

(assert (=> bm!61893 m!1159897))

(assert (=> b!1259529 d!138235))

(declare-fun b!1259762 () Bool)

(declare-fun e!716727 () Bool)

(declare-fun call!61899 () Bool)

(assert (=> b!1259762 (= e!716727 call!61899)))

(declare-fun bm!61896 () Bool)

(declare-fun c!122584 () Bool)

(assert (=> bm!61896 (= call!61899 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122584 (Cons!28194 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000) Nil!28195) Nil!28195)))))

(declare-fun b!1259763 () Bool)

(declare-fun e!716730 () Bool)

(declare-fun contains!7548 (List!28198 (_ BitVec 64)) Bool)

(assert (=> b!1259763 (= e!716730 (contains!7548 Nil!28195 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1259764 () Bool)

(assert (=> b!1259764 (= e!716727 call!61899)))

(declare-fun b!1259765 () Bool)

(declare-fun e!716729 () Bool)

(declare-fun e!716728 () Bool)

(assert (=> b!1259765 (= e!716729 e!716728)))

(declare-fun res!839578 () Bool)

(assert (=> b!1259765 (=> (not res!839578) (not e!716728))))

(assert (=> b!1259765 (= res!839578 (not e!716730))))

(declare-fun res!839577 () Bool)

(assert (=> b!1259765 (=> (not res!839577) (not e!716730))))

(assert (=> b!1259765 (= res!839577 (validKeyInArray!0 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138237 () Bool)

(declare-fun res!839579 () Bool)

(assert (=> d!138237 (=> res!839579 e!716729)))

(assert (=> d!138237 (= res!839579 (bvsge #b00000000000000000000000000000000 (size!40092 _keys!1118)))))

(assert (=> d!138237 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28195) e!716729)))

(declare-fun b!1259766 () Bool)

(assert (=> b!1259766 (= e!716728 e!716727)))

(assert (=> b!1259766 (= c!122584 (validKeyInArray!0 (select (arr!39554 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138237 (not res!839579)) b!1259765))

(assert (= (and b!1259765 res!839577) b!1259763))

(assert (= (and b!1259765 res!839578) b!1259766))

(assert (= (and b!1259766 c!122584) b!1259764))

(assert (= (and b!1259766 (not c!122584)) b!1259762))

(assert (= (or b!1259764 b!1259762) bm!61896))

(assert (=> bm!61896 m!1159713))

(declare-fun m!1159899 () Bool)

(assert (=> bm!61896 m!1159899))

(assert (=> b!1259763 m!1159713))

(assert (=> b!1259763 m!1159713))

(declare-fun m!1159901 () Bool)

(assert (=> b!1259763 m!1159901))

(assert (=> b!1259765 m!1159713))

(assert (=> b!1259765 m!1159713))

(assert (=> b!1259765 m!1159723))

(assert (=> b!1259766 m!1159713))

(assert (=> b!1259766 m!1159713))

(assert (=> b!1259766 m!1159723))

(assert (=> b!1259537 d!138237))

(declare-fun d!138239 () Bool)

(declare-fun e!716731 () Bool)

(assert (=> d!138239 e!716731))

(declare-fun res!839580 () Bool)

(assert (=> d!138239 (=> (not res!839580) (not e!716731))))

(declare-fun lt!570290 () ListLongMap!18867)

(assert (=> d!138239 (= res!839580 (contains!7546 lt!570290 (_1!10508 lt!570077)))))

(declare-fun lt!570293 () List!28197)

(assert (=> d!138239 (= lt!570290 (ListLongMap!18868 lt!570293))))

(declare-fun lt!570292 () Unit!41842)

(declare-fun lt!570291 () Unit!41842)

(assert (=> d!138239 (= lt!570292 lt!570291)))

(assert (=> d!138239 (= (getValueByKey!660 lt!570293 (_1!10508 lt!570077)) (Some!710 (_2!10508 lt!570077)))))

(assert (=> d!138239 (= lt!570291 (lemmaContainsTupThenGetReturnValue!332 lt!570293 (_1!10508 lt!570077) (_2!10508 lt!570077)))))

(assert (=> d!138239 (= lt!570293 (insertStrictlySorted!446 (toList!9449 lt!570084) (_1!10508 lt!570077) (_2!10508 lt!570077)))))

(assert (=> d!138239 (= (+!4250 lt!570084 lt!570077) lt!570290)))

(declare-fun b!1259767 () Bool)

(declare-fun res!839581 () Bool)

(assert (=> b!1259767 (=> (not res!839581) (not e!716731))))

(assert (=> b!1259767 (= res!839581 (= (getValueByKey!660 (toList!9449 lt!570290) (_1!10508 lt!570077)) (Some!710 (_2!10508 lt!570077))))))

(declare-fun b!1259768 () Bool)

(assert (=> b!1259768 (= e!716731 (contains!7547 (toList!9449 lt!570290) lt!570077))))

(assert (= (and d!138239 res!839580) b!1259767))

(assert (= (and b!1259767 res!839581) b!1259768))

(declare-fun m!1159903 () Bool)

(assert (=> d!138239 m!1159903))

(declare-fun m!1159905 () Bool)

(assert (=> d!138239 m!1159905))

(declare-fun m!1159907 () Bool)

(assert (=> d!138239 m!1159907))

(declare-fun m!1159909 () Bool)

(assert (=> d!138239 m!1159909))

(declare-fun m!1159911 () Bool)

(assert (=> b!1259767 m!1159911))

(declare-fun m!1159913 () Bool)

(assert (=> b!1259768 m!1159913))

(assert (=> b!1259528 d!138239))

(declare-fun b!1259776 () Bool)

(declare-fun e!716737 () Bool)

(assert (=> b!1259776 (= e!716737 tp_is_empty!32227)))

(declare-fun b!1259775 () Bool)

(declare-fun e!716736 () Bool)

(assert (=> b!1259775 (= e!716736 tp_is_empty!32227)))

(declare-fun mapIsEmpty!50146 () Bool)

(declare-fun mapRes!50146 () Bool)

(assert (=> mapIsEmpty!50146 mapRes!50146))

(declare-fun condMapEmpty!50146 () Bool)

(declare-fun mapDefault!50146 () ValueCell!15350)

(assert (=> mapNonEmpty!50137 (= condMapEmpty!50146 (= mapRest!50137 ((as const (Array (_ BitVec 32) ValueCell!15350)) mapDefault!50146)))))

(assert (=> mapNonEmpty!50137 (= tp!95501 (and e!716737 mapRes!50146))))

(declare-fun mapNonEmpty!50146 () Bool)

(declare-fun tp!95516 () Bool)

(assert (=> mapNonEmpty!50146 (= mapRes!50146 (and tp!95516 e!716736))))

(declare-fun mapValue!50146 () ValueCell!15350)

(declare-fun mapKey!50146 () (_ BitVec 32))

(declare-fun mapRest!50146 () (Array (_ BitVec 32) ValueCell!15350))

(assert (=> mapNonEmpty!50146 (= mapRest!50137 (store mapRest!50146 mapKey!50146 mapValue!50146))))

(assert (= (and mapNonEmpty!50137 condMapEmpty!50146) mapIsEmpty!50146))

(assert (= (and mapNonEmpty!50137 (not condMapEmpty!50146)) mapNonEmpty!50146))

(assert (= (and mapNonEmpty!50146 ((_ is ValueCellFull!15350) mapValue!50146)) b!1259775))

(assert (= (and mapNonEmpty!50137 ((_ is ValueCellFull!15350) mapDefault!50146)) b!1259776))

(declare-fun m!1159915 () Bool)

(assert (=> mapNonEmpty!50146 m!1159915))

(declare-fun b_lambda!22745 () Bool)

(assert (= b_lambda!22743 (or (and start!105736 b_free!27325) b_lambda!22745)))

(declare-fun b_lambda!22747 () Bool)

(assert (= b_lambda!22739 (or (and start!105736 b_free!27325) b_lambda!22747)))

(declare-fun b_lambda!22749 () Bool)

(assert (= b_lambda!22733 (or (and start!105736 b_free!27325) b_lambda!22749)))

(declare-fun b_lambda!22751 () Bool)

(assert (= b_lambda!22737 (or (and start!105736 b_free!27325) b_lambda!22751)))

(declare-fun b_lambda!22753 () Bool)

(assert (= b_lambda!22735 (or (and start!105736 b_free!27325) b_lambda!22753)))

(declare-fun b_lambda!22755 () Bool)

(assert (= b_lambda!22741 (or (and start!105736 b_free!27325) b_lambda!22755)))

(check-sat (not b_lambda!22745) (not b!1259727) (not b!1259628) (not b!1259633) (not b!1259750) (not b!1259721) (not d!138239) (not b!1259730) (not b!1259647) (not b_lambda!22753) (not d!138223) (not b!1259632) (not b!1259627) (not b!1259766) (not b!1259704) (not b!1259698) (not bm!61890) (not bm!61896) (not b!1259653) (not d!138219) (not b!1259749) (not b!1259638) (not b!1259734) (not bm!61884) (not b!1259701) (not b!1259643) (not d!138213) (not b!1259642) (not bm!61886) (not b!1259652) (not b_lambda!22755) (not b!1259622) (not b!1259641) (not b_next!27325) (not d!138215) (not mapNonEmpty!50146) (not d!138209) (not b!1259646) (not bm!61879) (not bm!61877) (not b!1259713) (not bm!61880) (not b!1259767) (not b!1259729) (not b!1259625) (not bm!61893) (not b!1259639) (not b!1259763) b_and!45207 (not bm!61862) (not b!1259736) (not b_lambda!22751) (not b!1259714) (not b_lambda!22747) (not bm!61887) (not bm!61861) (not d!138217) (not b!1259706) (not b!1259636) (not b!1259711) (not d!138225) tp_is_empty!32227 (not b!1259717) (not bm!61883) (not d!138211) (not b!1259707) (not d!138227) (not b!1259768) (not d!138221) (not b!1259737) (not b!1259629) (not b!1259718) (not b!1259765) (not b!1259624) (not b!1259724) (not b_lambda!22749))
(check-sat b_and!45207 (not b_next!27325))
