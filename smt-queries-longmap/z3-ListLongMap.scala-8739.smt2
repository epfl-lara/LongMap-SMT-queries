; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105982 () Bool)

(assert start!105982)

(declare-fun b_free!27471 () Bool)

(declare-fun b_next!27471 () Bool)

(assert (=> start!105982 (= b_free!27471 (not b_next!27471))))

(declare-fun tp!95953 () Bool)

(declare-fun b_and!45409 () Bool)

(assert (=> start!105982 (= tp!95953 b_and!45409)))

(declare-fun mapIsEmpty!50371 () Bool)

(declare-fun mapRes!50371 () Bool)

(assert (=> mapIsEmpty!50371 mapRes!50371))

(declare-fun mapNonEmpty!50371 () Bool)

(declare-fun tp!95954 () Bool)

(declare-fun e!718429 () Bool)

(assert (=> mapNonEmpty!50371 (= mapRes!50371 (and tp!95954 e!718429))))

(declare-datatypes ((V!48529 0))(
  ( (V!48530 (val!16249 Int)) )
))
(declare-datatypes ((ValueCell!15423 0))(
  ( (ValueCellFull!15423 (v!18955 V!48529)) (EmptyCell!15423) )
))
(declare-fun mapRest!50371 () (Array (_ BitVec 32) ValueCell!15423))

(declare-fun mapKey!50371 () (_ BitVec 32))

(declare-datatypes ((array!82362 0))(
  ( (array!82363 (arr!39731 (Array (_ BitVec 32) ValueCell!15423)) (size!40267 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82362)

(declare-fun mapValue!50371 () ValueCell!15423)

(assert (=> mapNonEmpty!50371 (= (arr!39731 _values!914) (store mapRest!50371 mapKey!50371 mapValue!50371))))

(declare-fun res!840913 () Bool)

(declare-fun e!718430 () Bool)

(assert (=> start!105982 (=> (not res!840913) (not e!718430))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105982 (= res!840913 (validMask!0 mask!1466))))

(assert (=> start!105982 e!718430))

(assert (=> start!105982 true))

(assert (=> start!105982 tp!95953))

(declare-fun tp_is_empty!32373 () Bool)

(assert (=> start!105982 tp_is_empty!32373))

(declare-datatypes ((array!82364 0))(
  ( (array!82365 (arr!39732 (Array (_ BitVec 32) (_ BitVec 64))) (size!40268 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82364)

(declare-fun array_inv!30245 (array!82364) Bool)

(assert (=> start!105982 (array_inv!30245 _keys!1118)))

(declare-fun e!718431 () Bool)

(declare-fun array_inv!30246 (array!82362) Bool)

(assert (=> start!105982 (and (array_inv!30246 _values!914) e!718431)))

(declare-fun b!1262145 () Bool)

(declare-fun e!718426 () Bool)

(assert (=> b!1262145 (= e!718430 (not e!718426))))

(declare-fun res!840916 () Bool)

(assert (=> b!1262145 (=> res!840916 e!718426)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1262145 (= res!840916 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!21028 0))(
  ( (tuple2!21029 (_1!10525 (_ BitVec 64)) (_2!10525 V!48529)) )
))
(declare-datatypes ((List!28223 0))(
  ( (Nil!28220) (Cons!28219 (h!29428 tuple2!21028) (t!41728 List!28223)) )
))
(declare-datatypes ((ListLongMap!18901 0))(
  ( (ListLongMap!18902 (toList!9466 List!28223)) )
))
(declare-fun lt!572059 () ListLongMap!18901)

(declare-fun lt!572056 () ListLongMap!18901)

(assert (=> b!1262145 (= lt!572059 lt!572056)))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48529)

(declare-fun minValueBefore!43 () V!48529)

(declare-datatypes ((Unit!42074 0))(
  ( (Unit!42075) )
))
(declare-fun lt!572058 () Unit!42074)

(declare-fun minValueAfter!43 () V!48529)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1174 (array!82364 array!82362 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48529 V!48529 V!48529 V!48529 (_ BitVec 32) Int) Unit!42074)

(assert (=> b!1262145 (= lt!572058 (lemmaNoChangeToArrayThenSameMapNoExtras!1174 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5832 (array!82364 array!82362 (_ BitVec 32) (_ BitVec 32) V!48529 V!48529 (_ BitVec 32) Int) ListLongMap!18901)

(assert (=> b!1262145 (= lt!572056 (getCurrentListMapNoExtraKeys!5832 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1262145 (= lt!572059 (getCurrentListMapNoExtraKeys!5832 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262146 () Bool)

(declare-fun res!840915 () Bool)

(assert (=> b!1262146 (=> (not res!840915) (not e!718430))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82364 (_ BitVec 32)) Bool)

(assert (=> b!1262146 (= res!840915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1262147 () Bool)

(declare-fun e!718427 () Bool)

(assert (=> b!1262147 (= e!718431 (and e!718427 mapRes!50371))))

(declare-fun condMapEmpty!50371 () Bool)

(declare-fun mapDefault!50371 () ValueCell!15423)

(assert (=> b!1262147 (= condMapEmpty!50371 (= (arr!39731 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15423)) mapDefault!50371)))))

(declare-fun b!1262148 () Bool)

(declare-fun res!840914 () Bool)

(assert (=> b!1262148 (=> (not res!840914) (not e!718430))))

(declare-datatypes ((List!28224 0))(
  ( (Nil!28221) (Cons!28220 (h!29429 (_ BitVec 64)) (t!41729 List!28224)) )
))
(declare-fun arrayNoDuplicates!0 (array!82364 (_ BitVec 32) List!28224) Bool)

(assert (=> b!1262148 (= res!840914 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28221))))

(declare-fun b!1262149 () Bool)

(assert (=> b!1262149 (= e!718429 tp_is_empty!32373)))

(declare-fun b!1262150 () Bool)

(declare-fun getCurrentListMap!4636 (array!82364 array!82362 (_ BitVec 32) (_ BitVec 32) V!48529 V!48529 (_ BitVec 32) Int) ListLongMap!18901)

(declare-fun +!4243 (ListLongMap!18901 tuple2!21028) ListLongMap!18901)

(assert (=> b!1262150 (= e!718426 (= (getCurrentListMap!4636 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (+!4243 lt!572059 (tuple2!21029 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!572057 () ListLongMap!18901)

(assert (=> b!1262150 (= lt!572057 (getCurrentListMap!4636 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262151 () Bool)

(assert (=> b!1262151 (= e!718427 tp_is_empty!32373)))

(declare-fun b!1262152 () Bool)

(declare-fun res!840912 () Bool)

(assert (=> b!1262152 (=> (not res!840912) (not e!718430))))

(assert (=> b!1262152 (= res!840912 (and (= (size!40267 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40268 _keys!1118) (size!40267 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105982 res!840913) b!1262152))

(assert (= (and b!1262152 res!840912) b!1262146))

(assert (= (and b!1262146 res!840915) b!1262148))

(assert (= (and b!1262148 res!840914) b!1262145))

(assert (= (and b!1262145 (not res!840916)) b!1262150))

(assert (= (and b!1262147 condMapEmpty!50371) mapIsEmpty!50371))

(assert (= (and b!1262147 (not condMapEmpty!50371)) mapNonEmpty!50371))

(get-info :version)

(assert (= (and mapNonEmpty!50371 ((_ is ValueCellFull!15423) mapValue!50371)) b!1262149))

(assert (= (and b!1262147 ((_ is ValueCellFull!15423) mapDefault!50371)) b!1262151))

(assert (= start!105982 b!1262147))

(declare-fun m!1162675 () Bool)

(assert (=> start!105982 m!1162675))

(declare-fun m!1162677 () Bool)

(assert (=> start!105982 m!1162677))

(declare-fun m!1162679 () Bool)

(assert (=> start!105982 m!1162679))

(declare-fun m!1162681 () Bool)

(assert (=> b!1262146 m!1162681))

(declare-fun m!1162683 () Bool)

(assert (=> b!1262148 m!1162683))

(declare-fun m!1162685 () Bool)

(assert (=> b!1262145 m!1162685))

(declare-fun m!1162687 () Bool)

(assert (=> b!1262145 m!1162687))

(declare-fun m!1162689 () Bool)

(assert (=> b!1262145 m!1162689))

(declare-fun m!1162691 () Bool)

(assert (=> mapNonEmpty!50371 m!1162691))

(declare-fun m!1162693 () Bool)

(assert (=> b!1262150 m!1162693))

(declare-fun m!1162695 () Bool)

(assert (=> b!1262150 m!1162695))

(declare-fun m!1162697 () Bool)

(assert (=> b!1262150 m!1162697))

(check-sat tp_is_empty!32373 (not start!105982) (not b_next!27471) (not b!1262145) (not mapNonEmpty!50371) (not b!1262148) (not b!1262146) b_and!45409 (not b!1262150))
(check-sat b_and!45409 (not b_next!27471))
(get-model)

(declare-fun b!1262187 () Bool)

(declare-fun e!718459 () Bool)

(declare-fun contains!7588 (List!28224 (_ BitVec 64)) Bool)

(assert (=> b!1262187 (= e!718459 (contains!7588 Nil!28221 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262188 () Bool)

(declare-fun e!718458 () Bool)

(declare-fun e!718460 () Bool)

(assert (=> b!1262188 (= e!718458 e!718460)))

(declare-fun res!840938 () Bool)

(assert (=> b!1262188 (=> (not res!840938) (not e!718460))))

(assert (=> b!1262188 (= res!840938 (not e!718459))))

(declare-fun res!840939 () Bool)

(assert (=> b!1262188 (=> (not res!840939) (not e!718459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1262188 (= res!840939 (validKeyInArray!0 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62035 () Bool)

(declare-fun call!62038 () Bool)

(declare-fun c!122765 () Bool)

(assert (=> bm!62035 (= call!62038 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122765 (Cons!28220 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000) Nil!28221) Nil!28221)))))

(declare-fun d!138513 () Bool)

(declare-fun res!840940 () Bool)

(assert (=> d!138513 (=> res!840940 e!718458)))

(assert (=> d!138513 (= res!840940 (bvsge #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(assert (=> d!138513 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28221) e!718458)))

(declare-fun b!1262189 () Bool)

(declare-fun e!718461 () Bool)

(assert (=> b!1262189 (= e!718461 call!62038)))

(declare-fun b!1262190 () Bool)

(assert (=> b!1262190 (= e!718460 e!718461)))

(assert (=> b!1262190 (= c!122765 (validKeyInArray!0 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262191 () Bool)

(assert (=> b!1262191 (= e!718461 call!62038)))

(assert (= (and d!138513 (not res!840940)) b!1262188))

(assert (= (and b!1262188 res!840939) b!1262187))

(assert (= (and b!1262188 res!840938) b!1262190))

(assert (= (and b!1262190 c!122765) b!1262189))

(assert (= (and b!1262190 (not c!122765)) b!1262191))

(assert (= (or b!1262189 b!1262191) bm!62035))

(declare-fun m!1162723 () Bool)

(assert (=> b!1262187 m!1162723))

(assert (=> b!1262187 m!1162723))

(declare-fun m!1162725 () Bool)

(assert (=> b!1262187 m!1162725))

(assert (=> b!1262188 m!1162723))

(assert (=> b!1262188 m!1162723))

(declare-fun m!1162727 () Bool)

(assert (=> b!1262188 m!1162727))

(assert (=> bm!62035 m!1162723))

(declare-fun m!1162729 () Bool)

(assert (=> bm!62035 m!1162729))

(assert (=> b!1262190 m!1162723))

(assert (=> b!1262190 m!1162723))

(assert (=> b!1262190 m!1162727))

(assert (=> b!1262148 d!138513))

(declare-fun bm!62038 () Bool)

(declare-fun call!62041 () Bool)

(assert (=> bm!62038 (= call!62041 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun d!138515 () Bool)

(declare-fun res!840946 () Bool)

(declare-fun e!718470 () Bool)

(assert (=> d!138515 (=> res!840946 e!718470)))

(assert (=> d!138515 (= res!840946 (bvsge #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(assert (=> d!138515 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!718470)))

(declare-fun b!1262200 () Bool)

(declare-fun e!718468 () Bool)

(assert (=> b!1262200 (= e!718470 e!718468)))

(declare-fun c!122768 () Bool)

(assert (=> b!1262200 (= c!122768 (validKeyInArray!0 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262201 () Bool)

(declare-fun e!718469 () Bool)

(assert (=> b!1262201 (= e!718469 call!62041)))

(declare-fun b!1262202 () Bool)

(assert (=> b!1262202 (= e!718468 call!62041)))

(declare-fun b!1262203 () Bool)

(assert (=> b!1262203 (= e!718468 e!718469)))

(declare-fun lt!572078 () (_ BitVec 64))

(assert (=> b!1262203 (= lt!572078 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572080 () Unit!42074)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82364 (_ BitVec 64) (_ BitVec 32)) Unit!42074)

(assert (=> b!1262203 (= lt!572080 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!572078 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82364 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1262203 (arrayContainsKey!0 _keys!1118 lt!572078 #b00000000000000000000000000000000)))

(declare-fun lt!572079 () Unit!42074)

(assert (=> b!1262203 (= lt!572079 lt!572080)))

(declare-fun res!840945 () Bool)

(declare-datatypes ((SeekEntryResult!9975 0))(
  ( (MissingZero!9975 (index!42271 (_ BitVec 32))) (Found!9975 (index!42272 (_ BitVec 32))) (Intermediate!9975 (undefined!10787 Bool) (index!42273 (_ BitVec 32)) (x!111229 (_ BitVec 32))) (Undefined!9975) (MissingVacant!9975 (index!42274 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82364 (_ BitVec 32)) SeekEntryResult!9975)

(assert (=> b!1262203 (= res!840945 (= (seekEntryOrOpen!0 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9975 #b00000000000000000000000000000000)))))

(assert (=> b!1262203 (=> (not res!840945) (not e!718469))))

(assert (= (and d!138515 (not res!840946)) b!1262200))

(assert (= (and b!1262200 c!122768) b!1262203))

(assert (= (and b!1262200 (not c!122768)) b!1262202))

(assert (= (and b!1262203 res!840945) b!1262201))

(assert (= (or b!1262201 b!1262202) bm!62038))

(declare-fun m!1162731 () Bool)

(assert (=> bm!62038 m!1162731))

(assert (=> b!1262200 m!1162723))

(assert (=> b!1262200 m!1162723))

(assert (=> b!1262200 m!1162727))

(assert (=> b!1262203 m!1162723))

(declare-fun m!1162733 () Bool)

(assert (=> b!1262203 m!1162733))

(declare-fun m!1162735 () Bool)

(assert (=> b!1262203 m!1162735))

(assert (=> b!1262203 m!1162723))

(declare-fun m!1162737 () Bool)

(assert (=> b!1262203 m!1162737))

(assert (=> b!1262146 d!138515))

(declare-fun d!138517 () Bool)

(assert (=> d!138517 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105982 d!138517))

(declare-fun d!138519 () Bool)

(assert (=> d!138519 (= (array_inv!30245 _keys!1118) (bvsge (size!40268 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105982 d!138519))

(declare-fun d!138521 () Bool)

(assert (=> d!138521 (= (array_inv!30246 _values!914) (bvsge (size!40267 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105982 d!138521))

(declare-fun d!138523 () Bool)

(assert (=> d!138523 (= (getCurrentListMapNoExtraKeys!5832 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5832 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572083 () Unit!42074)

(declare-fun choose!1871 (array!82364 array!82362 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48529 V!48529 V!48529 V!48529 (_ BitVec 32) Int) Unit!42074)

(assert (=> d!138523 (= lt!572083 (choose!1871 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138523 (validMask!0 mask!1466)))

(assert (=> d!138523 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1174 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572083)))

(declare-fun bs!35722 () Bool)

(assert (= bs!35722 d!138523))

(assert (=> bs!35722 m!1162689))

(assert (=> bs!35722 m!1162687))

(declare-fun m!1162739 () Bool)

(assert (=> bs!35722 m!1162739))

(assert (=> bs!35722 m!1162675))

(assert (=> b!1262145 d!138523))

(declare-fun call!62044 () ListLongMap!18901)

(declare-fun bm!62041 () Bool)

(assert (=> bm!62041 (= call!62044 (getCurrentListMapNoExtraKeys!5832 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1262228 () Bool)

(declare-fun e!718489 () Bool)

(declare-fun e!718487 () Bool)

(assert (=> b!1262228 (= e!718489 e!718487)))

(declare-fun c!122778 () Bool)

(declare-fun e!718488 () Bool)

(assert (=> b!1262228 (= c!122778 e!718488)))

(declare-fun res!840958 () Bool)

(assert (=> b!1262228 (=> (not res!840958) (not e!718488))))

(assert (=> b!1262228 (= res!840958 (bvslt #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(declare-fun e!718490 () Bool)

(declare-fun lt!572101 () ListLongMap!18901)

(declare-fun b!1262229 () Bool)

(assert (=> b!1262229 (= e!718490 (= lt!572101 (getCurrentListMapNoExtraKeys!5832 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun d!138525 () Bool)

(assert (=> d!138525 e!718489))

(declare-fun res!840957 () Bool)

(assert (=> d!138525 (=> (not res!840957) (not e!718489))))

(declare-fun contains!7589 (ListLongMap!18901 (_ BitVec 64)) Bool)

(assert (=> d!138525 (= res!840957 (not (contains!7589 lt!572101 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!718491 () ListLongMap!18901)

(assert (=> d!138525 (= lt!572101 e!718491)))

(declare-fun c!122780 () Bool)

(assert (=> d!138525 (= c!122780 (bvsge #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(assert (=> d!138525 (validMask!0 mask!1466)))

(assert (=> d!138525 (= (getCurrentListMapNoExtraKeys!5832 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572101)))

(declare-fun b!1262230 () Bool)

(assert (=> b!1262230 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(assert (=> b!1262230 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40267 _values!914)))))

(declare-fun e!718485 () Bool)

(declare-fun apply!997 (ListLongMap!18901 (_ BitVec 64)) V!48529)

(declare-fun get!20272 (ValueCell!15423 V!48529) V!48529)

(declare-fun dynLambda!3395 (Int (_ BitVec 64)) V!48529)

(assert (=> b!1262230 (= e!718485 (= (apply!997 lt!572101 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000)) (get!20272 (select (arr!39731 _values!914) #b00000000000000000000000000000000) (dynLambda!3395 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1262231 () Bool)

(declare-fun lt!572104 () Unit!42074)

(declare-fun lt!572102 () Unit!42074)

(assert (=> b!1262231 (= lt!572104 lt!572102)))

(declare-fun lt!572100 () (_ BitVec 64))

(declare-fun lt!572103 () V!48529)

(declare-fun lt!572099 () ListLongMap!18901)

(declare-fun lt!572098 () (_ BitVec 64))

(assert (=> b!1262231 (not (contains!7589 (+!4243 lt!572099 (tuple2!21029 lt!572100 lt!572103)) lt!572098))))

(declare-fun addStillNotContains!325 (ListLongMap!18901 (_ BitVec 64) V!48529 (_ BitVec 64)) Unit!42074)

(assert (=> b!1262231 (= lt!572102 (addStillNotContains!325 lt!572099 lt!572100 lt!572103 lt!572098))))

(assert (=> b!1262231 (= lt!572098 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1262231 (= lt!572103 (get!20272 (select (arr!39731 _values!914) #b00000000000000000000000000000000) (dynLambda!3395 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1262231 (= lt!572100 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1262231 (= lt!572099 call!62044)))

(declare-fun e!718486 () ListLongMap!18901)

(assert (=> b!1262231 (= e!718486 (+!4243 call!62044 (tuple2!21029 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000) (get!20272 (select (arr!39731 _values!914) #b00000000000000000000000000000000) (dynLambda!3395 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1262232 () Bool)

(assert (=> b!1262232 (= e!718491 (ListLongMap!18902 Nil!28220))))

(declare-fun b!1262233 () Bool)

(declare-fun res!840955 () Bool)

(assert (=> b!1262233 (=> (not res!840955) (not e!718489))))

(assert (=> b!1262233 (= res!840955 (not (contains!7589 lt!572101 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1262234 () Bool)

(assert (=> b!1262234 (= e!718487 e!718485)))

(assert (=> b!1262234 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(declare-fun res!840956 () Bool)

(assert (=> b!1262234 (= res!840956 (contains!7589 lt!572101 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262234 (=> (not res!840956) (not e!718485))))

(declare-fun b!1262235 () Bool)

(assert (=> b!1262235 (= e!718488 (validKeyInArray!0 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262235 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1262236 () Bool)

(assert (=> b!1262236 (= e!718491 e!718486)))

(declare-fun c!122779 () Bool)

(assert (=> b!1262236 (= c!122779 (validKeyInArray!0 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262237 () Bool)

(declare-fun isEmpty!1039 (ListLongMap!18901) Bool)

(assert (=> b!1262237 (= e!718490 (isEmpty!1039 lt!572101))))

(declare-fun b!1262238 () Bool)

(assert (=> b!1262238 (= e!718487 e!718490)))

(declare-fun c!122777 () Bool)

(assert (=> b!1262238 (= c!122777 (bvslt #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(declare-fun b!1262239 () Bool)

(assert (=> b!1262239 (= e!718486 call!62044)))

(assert (= (and d!138525 c!122780) b!1262232))

(assert (= (and d!138525 (not c!122780)) b!1262236))

(assert (= (and b!1262236 c!122779) b!1262231))

(assert (= (and b!1262236 (not c!122779)) b!1262239))

(assert (= (or b!1262231 b!1262239) bm!62041))

(assert (= (and d!138525 res!840957) b!1262233))

(assert (= (and b!1262233 res!840955) b!1262228))

(assert (= (and b!1262228 res!840958) b!1262235))

(assert (= (and b!1262228 c!122778) b!1262234))

(assert (= (and b!1262228 (not c!122778)) b!1262238))

(assert (= (and b!1262234 res!840956) b!1262230))

(assert (= (and b!1262238 c!122777) b!1262229))

(assert (= (and b!1262238 (not c!122777)) b!1262237))

(declare-fun b_lambda!22851 () Bool)

(assert (=> (not b_lambda!22851) (not b!1262230)))

(declare-fun t!41732 () Bool)

(declare-fun tb!11321 () Bool)

(assert (=> (and start!105982 (= defaultEntry!922 defaultEntry!922) t!41732) tb!11321))

(declare-fun result!23371 () Bool)

(assert (=> tb!11321 (= result!23371 tp_is_empty!32373)))

(assert (=> b!1262230 t!41732))

(declare-fun b_and!45413 () Bool)

(assert (= b_and!45409 (and (=> t!41732 result!23371) b_and!45413)))

(declare-fun b_lambda!22853 () Bool)

(assert (=> (not b_lambda!22853) (not b!1262231)))

(assert (=> b!1262231 t!41732))

(declare-fun b_and!45415 () Bool)

(assert (= b_and!45413 (and (=> t!41732 result!23371) b_and!45415)))

(declare-fun m!1162741 () Bool)

(assert (=> b!1262230 m!1162741))

(declare-fun m!1162743 () Bool)

(assert (=> b!1262230 m!1162743))

(assert (=> b!1262230 m!1162723))

(assert (=> b!1262230 m!1162741))

(assert (=> b!1262230 m!1162743))

(declare-fun m!1162745 () Bool)

(assert (=> b!1262230 m!1162745))

(assert (=> b!1262230 m!1162723))

(declare-fun m!1162747 () Bool)

(assert (=> b!1262230 m!1162747))

(declare-fun m!1162749 () Bool)

(assert (=> d!138525 m!1162749))

(assert (=> d!138525 m!1162675))

(declare-fun m!1162751 () Bool)

(assert (=> b!1262233 m!1162751))

(declare-fun m!1162753 () Bool)

(assert (=> b!1262237 m!1162753))

(assert (=> b!1262234 m!1162723))

(assert (=> b!1262234 m!1162723))

(declare-fun m!1162755 () Bool)

(assert (=> b!1262234 m!1162755))

(declare-fun m!1162757 () Bool)

(assert (=> bm!62041 m!1162757))

(assert (=> b!1262229 m!1162757))

(assert (=> b!1262236 m!1162723))

(assert (=> b!1262236 m!1162723))

(assert (=> b!1262236 m!1162727))

(assert (=> b!1262235 m!1162723))

(assert (=> b!1262235 m!1162723))

(assert (=> b!1262235 m!1162727))

(assert (=> b!1262231 m!1162741))

(declare-fun m!1162759 () Bool)

(assert (=> b!1262231 m!1162759))

(declare-fun m!1162761 () Bool)

(assert (=> b!1262231 m!1162761))

(assert (=> b!1262231 m!1162741))

(assert (=> b!1262231 m!1162743))

(assert (=> b!1262231 m!1162745))

(assert (=> b!1262231 m!1162759))

(declare-fun m!1162763 () Bool)

(assert (=> b!1262231 m!1162763))

(assert (=> b!1262231 m!1162743))

(declare-fun m!1162765 () Bool)

(assert (=> b!1262231 m!1162765))

(assert (=> b!1262231 m!1162723))

(assert (=> b!1262145 d!138525))

(declare-fun call!62045 () ListLongMap!18901)

(declare-fun bm!62042 () Bool)

(assert (=> bm!62042 (= call!62045 (getCurrentListMapNoExtraKeys!5832 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1262242 () Bool)

(declare-fun e!718496 () Bool)

(declare-fun e!718494 () Bool)

(assert (=> b!1262242 (= e!718496 e!718494)))

(declare-fun c!122782 () Bool)

(declare-fun e!718495 () Bool)

(assert (=> b!1262242 (= c!122782 e!718495)))

(declare-fun res!840962 () Bool)

(assert (=> b!1262242 (=> (not res!840962) (not e!718495))))

(assert (=> b!1262242 (= res!840962 (bvslt #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(declare-fun e!718497 () Bool)

(declare-fun lt!572108 () ListLongMap!18901)

(declare-fun b!1262243 () Bool)

(assert (=> b!1262243 (= e!718497 (= lt!572108 (getCurrentListMapNoExtraKeys!5832 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun d!138527 () Bool)

(assert (=> d!138527 e!718496))

(declare-fun res!840961 () Bool)

(assert (=> d!138527 (=> (not res!840961) (not e!718496))))

(assert (=> d!138527 (= res!840961 (not (contains!7589 lt!572108 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!718498 () ListLongMap!18901)

(assert (=> d!138527 (= lt!572108 e!718498)))

(declare-fun c!122784 () Bool)

(assert (=> d!138527 (= c!122784 (bvsge #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(assert (=> d!138527 (validMask!0 mask!1466)))

(assert (=> d!138527 (= (getCurrentListMapNoExtraKeys!5832 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572108)))

(declare-fun b!1262244 () Bool)

(assert (=> b!1262244 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(assert (=> b!1262244 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40267 _values!914)))))

(declare-fun e!718492 () Bool)

(assert (=> b!1262244 (= e!718492 (= (apply!997 lt!572108 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000)) (get!20272 (select (arr!39731 _values!914) #b00000000000000000000000000000000) (dynLambda!3395 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1262245 () Bool)

(declare-fun lt!572111 () Unit!42074)

(declare-fun lt!572109 () Unit!42074)

(assert (=> b!1262245 (= lt!572111 lt!572109)))

(declare-fun lt!572110 () V!48529)

(declare-fun lt!572105 () (_ BitVec 64))

(declare-fun lt!572107 () (_ BitVec 64))

(declare-fun lt!572106 () ListLongMap!18901)

(assert (=> b!1262245 (not (contains!7589 (+!4243 lt!572106 (tuple2!21029 lt!572107 lt!572110)) lt!572105))))

(assert (=> b!1262245 (= lt!572109 (addStillNotContains!325 lt!572106 lt!572107 lt!572110 lt!572105))))

(assert (=> b!1262245 (= lt!572105 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1262245 (= lt!572110 (get!20272 (select (arr!39731 _values!914) #b00000000000000000000000000000000) (dynLambda!3395 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1262245 (= lt!572107 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1262245 (= lt!572106 call!62045)))

(declare-fun e!718493 () ListLongMap!18901)

(assert (=> b!1262245 (= e!718493 (+!4243 call!62045 (tuple2!21029 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000) (get!20272 (select (arr!39731 _values!914) #b00000000000000000000000000000000) (dynLambda!3395 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1262246 () Bool)

(assert (=> b!1262246 (= e!718498 (ListLongMap!18902 Nil!28220))))

(declare-fun b!1262247 () Bool)

(declare-fun res!840959 () Bool)

(assert (=> b!1262247 (=> (not res!840959) (not e!718496))))

(assert (=> b!1262247 (= res!840959 (not (contains!7589 lt!572108 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1262248 () Bool)

(assert (=> b!1262248 (= e!718494 e!718492)))

(assert (=> b!1262248 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(declare-fun res!840960 () Bool)

(assert (=> b!1262248 (= res!840960 (contains!7589 lt!572108 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262248 (=> (not res!840960) (not e!718492))))

(declare-fun b!1262249 () Bool)

(assert (=> b!1262249 (= e!718495 (validKeyInArray!0 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262249 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1262250 () Bool)

(assert (=> b!1262250 (= e!718498 e!718493)))

(declare-fun c!122783 () Bool)

(assert (=> b!1262250 (= c!122783 (validKeyInArray!0 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262251 () Bool)

(assert (=> b!1262251 (= e!718497 (isEmpty!1039 lt!572108))))

(declare-fun b!1262252 () Bool)

(assert (=> b!1262252 (= e!718494 e!718497)))

(declare-fun c!122781 () Bool)

(assert (=> b!1262252 (= c!122781 (bvslt #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(declare-fun b!1262253 () Bool)

(assert (=> b!1262253 (= e!718493 call!62045)))

(assert (= (and d!138527 c!122784) b!1262246))

(assert (= (and d!138527 (not c!122784)) b!1262250))

(assert (= (and b!1262250 c!122783) b!1262245))

(assert (= (and b!1262250 (not c!122783)) b!1262253))

(assert (= (or b!1262245 b!1262253) bm!62042))

(assert (= (and d!138527 res!840961) b!1262247))

(assert (= (and b!1262247 res!840959) b!1262242))

(assert (= (and b!1262242 res!840962) b!1262249))

(assert (= (and b!1262242 c!122782) b!1262248))

(assert (= (and b!1262242 (not c!122782)) b!1262252))

(assert (= (and b!1262248 res!840960) b!1262244))

(assert (= (and b!1262252 c!122781) b!1262243))

(assert (= (and b!1262252 (not c!122781)) b!1262251))

(declare-fun b_lambda!22855 () Bool)

(assert (=> (not b_lambda!22855) (not b!1262244)))

(assert (=> b!1262244 t!41732))

(declare-fun b_and!45417 () Bool)

(assert (= b_and!45415 (and (=> t!41732 result!23371) b_and!45417)))

(declare-fun b_lambda!22857 () Bool)

(assert (=> (not b_lambda!22857) (not b!1262245)))

(assert (=> b!1262245 t!41732))

(declare-fun b_and!45419 () Bool)

(assert (= b_and!45417 (and (=> t!41732 result!23371) b_and!45419)))

(assert (=> b!1262244 m!1162741))

(assert (=> b!1262244 m!1162743))

(assert (=> b!1262244 m!1162723))

(assert (=> b!1262244 m!1162741))

(assert (=> b!1262244 m!1162743))

(assert (=> b!1262244 m!1162745))

(assert (=> b!1262244 m!1162723))

(declare-fun m!1162767 () Bool)

(assert (=> b!1262244 m!1162767))

(declare-fun m!1162769 () Bool)

(assert (=> d!138527 m!1162769))

(assert (=> d!138527 m!1162675))

(declare-fun m!1162771 () Bool)

(assert (=> b!1262247 m!1162771))

(declare-fun m!1162773 () Bool)

(assert (=> b!1262251 m!1162773))

(assert (=> b!1262248 m!1162723))

(assert (=> b!1262248 m!1162723))

(declare-fun m!1162775 () Bool)

(assert (=> b!1262248 m!1162775))

(declare-fun m!1162777 () Bool)

(assert (=> bm!62042 m!1162777))

(assert (=> b!1262243 m!1162777))

(assert (=> b!1262250 m!1162723))

(assert (=> b!1262250 m!1162723))

(assert (=> b!1262250 m!1162727))

(assert (=> b!1262249 m!1162723))

(assert (=> b!1262249 m!1162723))

(assert (=> b!1262249 m!1162727))

(assert (=> b!1262245 m!1162741))

(declare-fun m!1162779 () Bool)

(assert (=> b!1262245 m!1162779))

(declare-fun m!1162781 () Bool)

(assert (=> b!1262245 m!1162781))

(assert (=> b!1262245 m!1162741))

(assert (=> b!1262245 m!1162743))

(assert (=> b!1262245 m!1162745))

(assert (=> b!1262245 m!1162779))

(declare-fun m!1162783 () Bool)

(assert (=> b!1262245 m!1162783))

(assert (=> b!1262245 m!1162743))

(declare-fun m!1162785 () Bool)

(assert (=> b!1262245 m!1162785))

(assert (=> b!1262245 m!1162723))

(assert (=> b!1262145 d!138527))

(declare-fun b!1262296 () Bool)

(declare-fun e!718528 () Bool)

(declare-fun call!62060 () Bool)

(assert (=> b!1262296 (= e!718528 (not call!62060))))

(declare-fun b!1262297 () Bool)

(declare-fun e!718537 () Bool)

(assert (=> b!1262297 (= e!718528 e!718537)))

(declare-fun res!840987 () Bool)

(assert (=> b!1262297 (= res!840987 call!62060)))

(assert (=> b!1262297 (=> (not res!840987) (not e!718537))))

(declare-fun b!1262298 () Bool)

(declare-fun e!718530 () Bool)

(declare-fun lt!572176 () ListLongMap!18901)

(assert (=> b!1262298 (= e!718530 (= (apply!997 lt!572176 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1262299 () Bool)

(declare-fun c!122797 () Bool)

(assert (=> b!1262299 (= c!122797 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!718533 () ListLongMap!18901)

(declare-fun e!718536 () ListLongMap!18901)

(assert (=> b!1262299 (= e!718533 e!718536)))

(declare-fun b!1262300 () Bool)

(declare-fun e!718531 () Bool)

(declare-fun e!718526 () Bool)

(assert (=> b!1262300 (= e!718531 e!718526)))

(declare-fun res!840981 () Bool)

(assert (=> b!1262300 (=> (not res!840981) (not e!718526))))

(assert (=> b!1262300 (= res!840981 (contains!7589 lt!572176 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262300 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(declare-fun d!138529 () Bool)

(declare-fun e!718532 () Bool)

(assert (=> d!138529 e!718532))

(declare-fun res!840984 () Bool)

(assert (=> d!138529 (=> (not res!840984) (not e!718532))))

(assert (=> d!138529 (= res!840984 (or (bvsge #b00000000000000000000000000000000 (size!40268 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40268 _keys!1118)))))))

(declare-fun lt!572170 () ListLongMap!18901)

(assert (=> d!138529 (= lt!572176 lt!572170)))

(declare-fun lt!572164 () Unit!42074)

(declare-fun e!718527 () Unit!42074)

(assert (=> d!138529 (= lt!572164 e!718527)))

(declare-fun c!122800 () Bool)

(declare-fun e!718529 () Bool)

(assert (=> d!138529 (= c!122800 e!718529)))

(declare-fun res!840985 () Bool)

(assert (=> d!138529 (=> (not res!840985) (not e!718529))))

(assert (=> d!138529 (= res!840985 (bvslt #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(declare-fun e!718534 () ListLongMap!18901)

(assert (=> d!138529 (= lt!572170 e!718534)))

(declare-fun c!122802 () Bool)

(assert (=> d!138529 (= c!122802 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138529 (validMask!0 mask!1466)))

(assert (=> d!138529 (= (getCurrentListMap!4636 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572176)))

(declare-fun bm!62057 () Bool)

(assert (=> bm!62057 (= call!62060 (contains!7589 lt!572176 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1262301 () Bool)

(declare-fun lt!572168 () Unit!42074)

(assert (=> b!1262301 (= e!718527 lt!572168)))

(declare-fun lt!572161 () ListLongMap!18901)

(assert (=> b!1262301 (= lt!572161 (getCurrentListMapNoExtraKeys!5832 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572159 () (_ BitVec 64))

(assert (=> b!1262301 (= lt!572159 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572173 () (_ BitVec 64))

(assert (=> b!1262301 (= lt!572173 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572169 () Unit!42074)

(declare-fun addStillContains!1087 (ListLongMap!18901 (_ BitVec 64) V!48529 (_ BitVec 64)) Unit!42074)

(assert (=> b!1262301 (= lt!572169 (addStillContains!1087 lt!572161 lt!572159 zeroValue!871 lt!572173))))

(assert (=> b!1262301 (contains!7589 (+!4243 lt!572161 (tuple2!21029 lt!572159 zeroValue!871)) lt!572173)))

(declare-fun lt!572166 () Unit!42074)

(assert (=> b!1262301 (= lt!572166 lt!572169)))

(declare-fun lt!572172 () ListLongMap!18901)

(assert (=> b!1262301 (= lt!572172 (getCurrentListMapNoExtraKeys!5832 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572160 () (_ BitVec 64))

(assert (=> b!1262301 (= lt!572160 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572158 () (_ BitVec 64))

(assert (=> b!1262301 (= lt!572158 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572163 () Unit!42074)

(declare-fun addApplyDifferent!541 (ListLongMap!18901 (_ BitVec 64) V!48529 (_ BitVec 64)) Unit!42074)

(assert (=> b!1262301 (= lt!572163 (addApplyDifferent!541 lt!572172 lt!572160 minValueBefore!43 lt!572158))))

(assert (=> b!1262301 (= (apply!997 (+!4243 lt!572172 (tuple2!21029 lt!572160 minValueBefore!43)) lt!572158) (apply!997 lt!572172 lt!572158))))

(declare-fun lt!572157 () Unit!42074)

(assert (=> b!1262301 (= lt!572157 lt!572163)))

(declare-fun lt!572162 () ListLongMap!18901)

(assert (=> b!1262301 (= lt!572162 (getCurrentListMapNoExtraKeys!5832 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572167 () (_ BitVec 64))

(assert (=> b!1262301 (= lt!572167 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572171 () (_ BitVec 64))

(assert (=> b!1262301 (= lt!572171 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572174 () Unit!42074)

(assert (=> b!1262301 (= lt!572174 (addApplyDifferent!541 lt!572162 lt!572167 zeroValue!871 lt!572171))))

(assert (=> b!1262301 (= (apply!997 (+!4243 lt!572162 (tuple2!21029 lt!572167 zeroValue!871)) lt!572171) (apply!997 lt!572162 lt!572171))))

(declare-fun lt!572156 () Unit!42074)

(assert (=> b!1262301 (= lt!572156 lt!572174)))

(declare-fun lt!572165 () ListLongMap!18901)

(assert (=> b!1262301 (= lt!572165 (getCurrentListMapNoExtraKeys!5832 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572175 () (_ BitVec 64))

(assert (=> b!1262301 (= lt!572175 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572177 () (_ BitVec 64))

(assert (=> b!1262301 (= lt!572177 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1262301 (= lt!572168 (addApplyDifferent!541 lt!572165 lt!572175 minValueBefore!43 lt!572177))))

(assert (=> b!1262301 (= (apply!997 (+!4243 lt!572165 (tuple2!21029 lt!572175 minValueBefore!43)) lt!572177) (apply!997 lt!572165 lt!572177))))

(declare-fun b!1262302 () Bool)

(assert (=> b!1262302 (= e!718537 (= (apply!997 lt!572176 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1262303 () Bool)

(assert (=> b!1262303 (= e!718534 e!718533)))

(declare-fun c!122799 () Bool)

(assert (=> b!1262303 (= c!122799 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!62066 () ListLongMap!18901)

(declare-fun call!62063 () ListLongMap!18901)

(declare-fun bm!62058 () Bool)

(declare-fun call!62065 () ListLongMap!18901)

(declare-fun call!62064 () ListLongMap!18901)

(assert (=> bm!62058 (= call!62065 (+!4243 (ite c!122802 call!62064 (ite c!122799 call!62066 call!62063)) (ite (or c!122802 c!122799) (tuple2!21029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21029 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun bm!62059 () Bool)

(assert (=> bm!62059 (= call!62066 call!62064)))

(declare-fun bm!62060 () Bool)

(declare-fun call!62062 () Bool)

(assert (=> bm!62060 (= call!62062 (contains!7589 lt!572176 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62061 () Bool)

(assert (=> bm!62061 (= call!62064 (getCurrentListMapNoExtraKeys!5832 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262304 () Bool)

(assert (=> b!1262304 (= e!718532 e!718528)))

(declare-fun c!122798 () Bool)

(assert (=> b!1262304 (= c!122798 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262305 () Bool)

(assert (=> b!1262305 (= e!718529 (validKeyInArray!0 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262306 () Bool)

(assert (=> b!1262306 (= e!718526 (= (apply!997 lt!572176 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000)) (get!20272 (select (arr!39731 _values!914) #b00000000000000000000000000000000) (dynLambda!3395 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1262306 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40267 _values!914)))))

(assert (=> b!1262306 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(declare-fun b!1262307 () Bool)

(declare-fun call!62061 () ListLongMap!18901)

(assert (=> b!1262307 (= e!718536 call!62061)))

(declare-fun b!1262308 () Bool)

(declare-fun e!718535 () Bool)

(assert (=> b!1262308 (= e!718535 (not call!62062))))

(declare-fun b!1262309 () Bool)

(assert (=> b!1262309 (= e!718536 call!62063)))

(declare-fun b!1262310 () Bool)

(assert (=> b!1262310 (= e!718533 call!62061)))

(declare-fun b!1262311 () Bool)

(assert (=> b!1262311 (= e!718534 (+!4243 call!62065 (tuple2!21029 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun bm!62062 () Bool)

(assert (=> bm!62062 (= call!62061 call!62065)))

(declare-fun b!1262312 () Bool)

(declare-fun res!840982 () Bool)

(assert (=> b!1262312 (=> (not res!840982) (not e!718532))))

(assert (=> b!1262312 (= res!840982 e!718535)))

(declare-fun c!122801 () Bool)

(assert (=> b!1262312 (= c!122801 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1262313 () Bool)

(declare-fun res!840989 () Bool)

(assert (=> b!1262313 (=> (not res!840989) (not e!718532))))

(assert (=> b!1262313 (= res!840989 e!718531)))

(declare-fun res!840986 () Bool)

(assert (=> b!1262313 (=> res!840986 e!718531)))

(declare-fun e!718525 () Bool)

(assert (=> b!1262313 (= res!840986 (not e!718525))))

(declare-fun res!840983 () Bool)

(assert (=> b!1262313 (=> (not res!840983) (not e!718525))))

(assert (=> b!1262313 (= res!840983 (bvslt #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(declare-fun b!1262314 () Bool)

(declare-fun Unit!42078 () Unit!42074)

(assert (=> b!1262314 (= e!718527 Unit!42078)))

(declare-fun bm!62063 () Bool)

(assert (=> bm!62063 (= call!62063 call!62066)))

(declare-fun b!1262315 () Bool)

(assert (=> b!1262315 (= e!718535 e!718530)))

(declare-fun res!840988 () Bool)

(assert (=> b!1262315 (= res!840988 call!62062)))

(assert (=> b!1262315 (=> (not res!840988) (not e!718530))))

(declare-fun b!1262316 () Bool)

(assert (=> b!1262316 (= e!718525 (validKeyInArray!0 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138529 c!122802) b!1262311))

(assert (= (and d!138529 (not c!122802)) b!1262303))

(assert (= (and b!1262303 c!122799) b!1262310))

(assert (= (and b!1262303 (not c!122799)) b!1262299))

(assert (= (and b!1262299 c!122797) b!1262307))

(assert (= (and b!1262299 (not c!122797)) b!1262309))

(assert (= (or b!1262307 b!1262309) bm!62063))

(assert (= (or b!1262310 bm!62063) bm!62059))

(assert (= (or b!1262310 b!1262307) bm!62062))

(assert (= (or b!1262311 bm!62059) bm!62061))

(assert (= (or b!1262311 bm!62062) bm!62058))

(assert (= (and d!138529 res!840985) b!1262305))

(assert (= (and d!138529 c!122800) b!1262301))

(assert (= (and d!138529 (not c!122800)) b!1262314))

(assert (= (and d!138529 res!840984) b!1262313))

(assert (= (and b!1262313 res!840983) b!1262316))

(assert (= (and b!1262313 (not res!840986)) b!1262300))

(assert (= (and b!1262300 res!840981) b!1262306))

(assert (= (and b!1262313 res!840989) b!1262312))

(assert (= (and b!1262312 c!122801) b!1262315))

(assert (= (and b!1262312 (not c!122801)) b!1262308))

(assert (= (and b!1262315 res!840988) b!1262298))

(assert (= (or b!1262315 b!1262308) bm!62060))

(assert (= (and b!1262312 res!840982) b!1262304))

(assert (= (and b!1262304 c!122798) b!1262297))

(assert (= (and b!1262304 (not c!122798)) b!1262296))

(assert (= (and b!1262297 res!840987) b!1262302))

(assert (= (or b!1262297 b!1262296) bm!62057))

(declare-fun b_lambda!22859 () Bool)

(assert (=> (not b_lambda!22859) (not b!1262306)))

(assert (=> b!1262306 t!41732))

(declare-fun b_and!45421 () Bool)

(assert (= b_and!45419 (and (=> t!41732 result!23371) b_and!45421)))

(assert (=> b!1262305 m!1162723))

(assert (=> b!1262305 m!1162723))

(assert (=> b!1262305 m!1162727))

(declare-fun m!1162787 () Bool)

(assert (=> b!1262298 m!1162787))

(declare-fun m!1162789 () Bool)

(assert (=> bm!62058 m!1162789))

(assert (=> d!138529 m!1162675))

(declare-fun m!1162791 () Bool)

(assert (=> b!1262311 m!1162791))

(declare-fun m!1162793 () Bool)

(assert (=> bm!62060 m!1162793))

(assert (=> b!1262306 m!1162741))

(assert (=> b!1262306 m!1162743))

(assert (=> b!1262306 m!1162723))

(declare-fun m!1162795 () Bool)

(assert (=> b!1262306 m!1162795))

(assert (=> b!1262306 m!1162741))

(assert (=> b!1262306 m!1162743))

(assert (=> b!1262306 m!1162745))

(assert (=> b!1262306 m!1162723))

(declare-fun m!1162797 () Bool)

(assert (=> b!1262301 m!1162797))

(declare-fun m!1162799 () Bool)

(assert (=> b!1262301 m!1162799))

(declare-fun m!1162801 () Bool)

(assert (=> b!1262301 m!1162801))

(assert (=> b!1262301 m!1162689))

(declare-fun m!1162803 () Bool)

(assert (=> b!1262301 m!1162803))

(declare-fun m!1162805 () Bool)

(assert (=> b!1262301 m!1162805))

(declare-fun m!1162807 () Bool)

(assert (=> b!1262301 m!1162807))

(declare-fun m!1162809 () Bool)

(assert (=> b!1262301 m!1162809))

(declare-fun m!1162811 () Bool)

(assert (=> b!1262301 m!1162811))

(declare-fun m!1162813 () Bool)

(assert (=> b!1262301 m!1162813))

(assert (=> b!1262301 m!1162723))

(assert (=> b!1262301 m!1162799))

(declare-fun m!1162815 () Bool)

(assert (=> b!1262301 m!1162815))

(declare-fun m!1162817 () Bool)

(assert (=> b!1262301 m!1162817))

(declare-fun m!1162819 () Bool)

(assert (=> b!1262301 m!1162819))

(assert (=> b!1262301 m!1162807))

(declare-fun m!1162821 () Bool)

(assert (=> b!1262301 m!1162821))

(assert (=> b!1262301 m!1162817))

(declare-fun m!1162823 () Bool)

(assert (=> b!1262301 m!1162823))

(assert (=> b!1262301 m!1162801))

(declare-fun m!1162825 () Bool)

(assert (=> b!1262301 m!1162825))

(declare-fun m!1162827 () Bool)

(assert (=> bm!62057 m!1162827))

(assert (=> bm!62061 m!1162689))

(declare-fun m!1162829 () Bool)

(assert (=> b!1262302 m!1162829))

(assert (=> b!1262316 m!1162723))

(assert (=> b!1262316 m!1162723))

(assert (=> b!1262316 m!1162727))

(assert (=> b!1262300 m!1162723))

(assert (=> b!1262300 m!1162723))

(declare-fun m!1162831 () Bool)

(assert (=> b!1262300 m!1162831))

(assert (=> b!1262150 d!138529))

(declare-fun d!138531 () Bool)

(declare-fun e!718540 () Bool)

(assert (=> d!138531 e!718540))

(declare-fun res!840994 () Bool)

(assert (=> d!138531 (=> (not res!840994) (not e!718540))))

(declare-fun lt!572188 () ListLongMap!18901)

(assert (=> d!138531 (= res!840994 (contains!7589 lt!572188 (_1!10525 (tuple2!21029 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!572189 () List!28223)

(assert (=> d!138531 (= lt!572188 (ListLongMap!18902 lt!572189))))

(declare-fun lt!572186 () Unit!42074)

(declare-fun lt!572187 () Unit!42074)

(assert (=> d!138531 (= lt!572186 lt!572187)))

(declare-datatypes ((Option!713 0))(
  ( (Some!712 (v!18957 V!48529)) (None!711) )
))
(declare-fun getValueByKey!662 (List!28223 (_ BitVec 64)) Option!713)

(assert (=> d!138531 (= (getValueByKey!662 lt!572189 (_1!10525 (tuple2!21029 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!712 (_2!10525 (tuple2!21029 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lemmaContainsTupThenGetReturnValue!333 (List!28223 (_ BitVec 64) V!48529) Unit!42074)

(assert (=> d!138531 (= lt!572187 (lemmaContainsTupThenGetReturnValue!333 lt!572189 (_1!10525 (tuple2!21029 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10525 (tuple2!21029 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun insertStrictlySorted!447 (List!28223 (_ BitVec 64) V!48529) List!28223)

(assert (=> d!138531 (= lt!572189 (insertStrictlySorted!447 (toList!9466 lt!572059) (_1!10525 (tuple2!21029 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10525 (tuple2!21029 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138531 (= (+!4243 lt!572059 (tuple2!21029 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!572188)))

(declare-fun b!1262321 () Bool)

(declare-fun res!840995 () Bool)

(assert (=> b!1262321 (=> (not res!840995) (not e!718540))))

(assert (=> b!1262321 (= res!840995 (= (getValueByKey!662 (toList!9466 lt!572188) (_1!10525 (tuple2!21029 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!712 (_2!10525 (tuple2!21029 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1262322 () Bool)

(declare-fun contains!7590 (List!28223 tuple2!21028) Bool)

(assert (=> b!1262322 (= e!718540 (contains!7590 (toList!9466 lt!572188) (tuple2!21029 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!138531 res!840994) b!1262321))

(assert (= (and b!1262321 res!840995) b!1262322))

(declare-fun m!1162833 () Bool)

(assert (=> d!138531 m!1162833))

(declare-fun m!1162835 () Bool)

(assert (=> d!138531 m!1162835))

(declare-fun m!1162837 () Bool)

(assert (=> d!138531 m!1162837))

(declare-fun m!1162839 () Bool)

(assert (=> d!138531 m!1162839))

(declare-fun m!1162841 () Bool)

(assert (=> b!1262321 m!1162841))

(declare-fun m!1162843 () Bool)

(assert (=> b!1262322 m!1162843))

(assert (=> b!1262150 d!138531))

(declare-fun b!1262323 () Bool)

(declare-fun e!718544 () Bool)

(declare-fun call!62067 () Bool)

(assert (=> b!1262323 (= e!718544 (not call!62067))))

(declare-fun b!1262324 () Bool)

(declare-fun e!718553 () Bool)

(assert (=> b!1262324 (= e!718544 e!718553)))

(declare-fun res!841002 () Bool)

(assert (=> b!1262324 (= res!841002 call!62067)))

(assert (=> b!1262324 (=> (not res!841002) (not e!718553))))

(declare-fun b!1262325 () Bool)

(declare-fun e!718546 () Bool)

(declare-fun lt!572210 () ListLongMap!18901)

(assert (=> b!1262325 (= e!718546 (= (apply!997 lt!572210 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1262326 () Bool)

(declare-fun c!122803 () Bool)

(assert (=> b!1262326 (= c!122803 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!718549 () ListLongMap!18901)

(declare-fun e!718552 () ListLongMap!18901)

(assert (=> b!1262326 (= e!718549 e!718552)))

(declare-fun b!1262327 () Bool)

(declare-fun e!718547 () Bool)

(declare-fun e!718542 () Bool)

(assert (=> b!1262327 (= e!718547 e!718542)))

(declare-fun res!840996 () Bool)

(assert (=> b!1262327 (=> (not res!840996) (not e!718542))))

(assert (=> b!1262327 (= res!840996 (contains!7589 lt!572210 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262327 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(declare-fun d!138533 () Bool)

(declare-fun e!718548 () Bool)

(assert (=> d!138533 e!718548))

(declare-fun res!840999 () Bool)

(assert (=> d!138533 (=> (not res!840999) (not e!718548))))

(assert (=> d!138533 (= res!840999 (or (bvsge #b00000000000000000000000000000000 (size!40268 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40268 _keys!1118)))))))

(declare-fun lt!572204 () ListLongMap!18901)

(assert (=> d!138533 (= lt!572210 lt!572204)))

(declare-fun lt!572198 () Unit!42074)

(declare-fun e!718543 () Unit!42074)

(assert (=> d!138533 (= lt!572198 e!718543)))

(declare-fun c!122806 () Bool)

(declare-fun e!718545 () Bool)

(assert (=> d!138533 (= c!122806 e!718545)))

(declare-fun res!841000 () Bool)

(assert (=> d!138533 (=> (not res!841000) (not e!718545))))

(assert (=> d!138533 (= res!841000 (bvslt #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(declare-fun e!718550 () ListLongMap!18901)

(assert (=> d!138533 (= lt!572204 e!718550)))

(declare-fun c!122808 () Bool)

(assert (=> d!138533 (= c!122808 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138533 (validMask!0 mask!1466)))

(assert (=> d!138533 (= (getCurrentListMap!4636 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572210)))

(declare-fun bm!62064 () Bool)

(assert (=> bm!62064 (= call!62067 (contains!7589 lt!572210 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1262328 () Bool)

(declare-fun lt!572202 () Unit!42074)

(assert (=> b!1262328 (= e!718543 lt!572202)))

(declare-fun lt!572195 () ListLongMap!18901)

(assert (=> b!1262328 (= lt!572195 (getCurrentListMapNoExtraKeys!5832 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572193 () (_ BitVec 64))

(assert (=> b!1262328 (= lt!572193 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572207 () (_ BitVec 64))

(assert (=> b!1262328 (= lt!572207 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572203 () Unit!42074)

(assert (=> b!1262328 (= lt!572203 (addStillContains!1087 lt!572195 lt!572193 zeroValue!871 lt!572207))))

(assert (=> b!1262328 (contains!7589 (+!4243 lt!572195 (tuple2!21029 lt!572193 zeroValue!871)) lt!572207)))

(declare-fun lt!572200 () Unit!42074)

(assert (=> b!1262328 (= lt!572200 lt!572203)))

(declare-fun lt!572206 () ListLongMap!18901)

(assert (=> b!1262328 (= lt!572206 (getCurrentListMapNoExtraKeys!5832 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572194 () (_ BitVec 64))

(assert (=> b!1262328 (= lt!572194 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572192 () (_ BitVec 64))

(assert (=> b!1262328 (= lt!572192 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572197 () Unit!42074)

(assert (=> b!1262328 (= lt!572197 (addApplyDifferent!541 lt!572206 lt!572194 minValueAfter!43 lt!572192))))

(assert (=> b!1262328 (= (apply!997 (+!4243 lt!572206 (tuple2!21029 lt!572194 minValueAfter!43)) lt!572192) (apply!997 lt!572206 lt!572192))))

(declare-fun lt!572191 () Unit!42074)

(assert (=> b!1262328 (= lt!572191 lt!572197)))

(declare-fun lt!572196 () ListLongMap!18901)

(assert (=> b!1262328 (= lt!572196 (getCurrentListMapNoExtraKeys!5832 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572201 () (_ BitVec 64))

(assert (=> b!1262328 (= lt!572201 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572205 () (_ BitVec 64))

(assert (=> b!1262328 (= lt!572205 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572208 () Unit!42074)

(assert (=> b!1262328 (= lt!572208 (addApplyDifferent!541 lt!572196 lt!572201 zeroValue!871 lt!572205))))

(assert (=> b!1262328 (= (apply!997 (+!4243 lt!572196 (tuple2!21029 lt!572201 zeroValue!871)) lt!572205) (apply!997 lt!572196 lt!572205))))

(declare-fun lt!572190 () Unit!42074)

(assert (=> b!1262328 (= lt!572190 lt!572208)))

(declare-fun lt!572199 () ListLongMap!18901)

(assert (=> b!1262328 (= lt!572199 (getCurrentListMapNoExtraKeys!5832 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572209 () (_ BitVec 64))

(assert (=> b!1262328 (= lt!572209 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572211 () (_ BitVec 64))

(assert (=> b!1262328 (= lt!572211 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1262328 (= lt!572202 (addApplyDifferent!541 lt!572199 lt!572209 minValueAfter!43 lt!572211))))

(assert (=> b!1262328 (= (apply!997 (+!4243 lt!572199 (tuple2!21029 lt!572209 minValueAfter!43)) lt!572211) (apply!997 lt!572199 lt!572211))))

(declare-fun b!1262329 () Bool)

(assert (=> b!1262329 (= e!718553 (= (apply!997 lt!572210 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun b!1262330 () Bool)

(assert (=> b!1262330 (= e!718550 e!718549)))

(declare-fun c!122805 () Bool)

(assert (=> b!1262330 (= c!122805 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!62072 () ListLongMap!18901)

(declare-fun call!62071 () ListLongMap!18901)

(declare-fun call!62070 () ListLongMap!18901)

(declare-fun bm!62065 () Bool)

(declare-fun call!62073 () ListLongMap!18901)

(assert (=> bm!62065 (= call!62072 (+!4243 (ite c!122808 call!62071 (ite c!122805 call!62073 call!62070)) (ite (or c!122808 c!122805) (tuple2!21029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21029 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun bm!62066 () Bool)

(assert (=> bm!62066 (= call!62073 call!62071)))

(declare-fun bm!62067 () Bool)

(declare-fun call!62069 () Bool)

(assert (=> bm!62067 (= call!62069 (contains!7589 lt!572210 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62068 () Bool)

(assert (=> bm!62068 (= call!62071 (getCurrentListMapNoExtraKeys!5832 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262331 () Bool)

(assert (=> b!1262331 (= e!718548 e!718544)))

(declare-fun c!122804 () Bool)

(assert (=> b!1262331 (= c!122804 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262332 () Bool)

(assert (=> b!1262332 (= e!718545 (validKeyInArray!0 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262333 () Bool)

(assert (=> b!1262333 (= e!718542 (= (apply!997 lt!572210 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000)) (get!20272 (select (arr!39731 _values!914) #b00000000000000000000000000000000) (dynLambda!3395 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1262333 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40267 _values!914)))))

(assert (=> b!1262333 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(declare-fun b!1262334 () Bool)

(declare-fun call!62068 () ListLongMap!18901)

(assert (=> b!1262334 (= e!718552 call!62068)))

(declare-fun b!1262335 () Bool)

(declare-fun e!718551 () Bool)

(assert (=> b!1262335 (= e!718551 (not call!62069))))

(declare-fun b!1262336 () Bool)

(assert (=> b!1262336 (= e!718552 call!62070)))

(declare-fun b!1262337 () Bool)

(assert (=> b!1262337 (= e!718549 call!62068)))

(declare-fun b!1262338 () Bool)

(assert (=> b!1262338 (= e!718550 (+!4243 call!62072 (tuple2!21029 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun bm!62069 () Bool)

(assert (=> bm!62069 (= call!62068 call!62072)))

(declare-fun b!1262339 () Bool)

(declare-fun res!840997 () Bool)

(assert (=> b!1262339 (=> (not res!840997) (not e!718548))))

(assert (=> b!1262339 (= res!840997 e!718551)))

(declare-fun c!122807 () Bool)

(assert (=> b!1262339 (= c!122807 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1262340 () Bool)

(declare-fun res!841004 () Bool)

(assert (=> b!1262340 (=> (not res!841004) (not e!718548))))

(assert (=> b!1262340 (= res!841004 e!718547)))

(declare-fun res!841001 () Bool)

(assert (=> b!1262340 (=> res!841001 e!718547)))

(declare-fun e!718541 () Bool)

(assert (=> b!1262340 (= res!841001 (not e!718541))))

(declare-fun res!840998 () Bool)

(assert (=> b!1262340 (=> (not res!840998) (not e!718541))))

(assert (=> b!1262340 (= res!840998 (bvslt #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(declare-fun b!1262341 () Bool)

(declare-fun Unit!42079 () Unit!42074)

(assert (=> b!1262341 (= e!718543 Unit!42079)))

(declare-fun bm!62070 () Bool)

(assert (=> bm!62070 (= call!62070 call!62073)))

(declare-fun b!1262342 () Bool)

(assert (=> b!1262342 (= e!718551 e!718546)))

(declare-fun res!841003 () Bool)

(assert (=> b!1262342 (= res!841003 call!62069)))

(assert (=> b!1262342 (=> (not res!841003) (not e!718546))))

(declare-fun b!1262343 () Bool)

(assert (=> b!1262343 (= e!718541 (validKeyInArray!0 (select (arr!39732 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138533 c!122808) b!1262338))

(assert (= (and d!138533 (not c!122808)) b!1262330))

(assert (= (and b!1262330 c!122805) b!1262337))

(assert (= (and b!1262330 (not c!122805)) b!1262326))

(assert (= (and b!1262326 c!122803) b!1262334))

(assert (= (and b!1262326 (not c!122803)) b!1262336))

(assert (= (or b!1262334 b!1262336) bm!62070))

(assert (= (or b!1262337 bm!62070) bm!62066))

(assert (= (or b!1262337 b!1262334) bm!62069))

(assert (= (or b!1262338 bm!62066) bm!62068))

(assert (= (or b!1262338 bm!62069) bm!62065))

(assert (= (and d!138533 res!841000) b!1262332))

(assert (= (and d!138533 c!122806) b!1262328))

(assert (= (and d!138533 (not c!122806)) b!1262341))

(assert (= (and d!138533 res!840999) b!1262340))

(assert (= (and b!1262340 res!840998) b!1262343))

(assert (= (and b!1262340 (not res!841001)) b!1262327))

(assert (= (and b!1262327 res!840996) b!1262333))

(assert (= (and b!1262340 res!841004) b!1262339))

(assert (= (and b!1262339 c!122807) b!1262342))

(assert (= (and b!1262339 (not c!122807)) b!1262335))

(assert (= (and b!1262342 res!841003) b!1262325))

(assert (= (or b!1262342 b!1262335) bm!62067))

(assert (= (and b!1262339 res!840997) b!1262331))

(assert (= (and b!1262331 c!122804) b!1262324))

(assert (= (and b!1262331 (not c!122804)) b!1262323))

(assert (= (and b!1262324 res!841002) b!1262329))

(assert (= (or b!1262324 b!1262323) bm!62064))

(declare-fun b_lambda!22861 () Bool)

(assert (=> (not b_lambda!22861) (not b!1262333)))

(assert (=> b!1262333 t!41732))

(declare-fun b_and!45423 () Bool)

(assert (= b_and!45421 (and (=> t!41732 result!23371) b_and!45423)))

(assert (=> b!1262332 m!1162723))

(assert (=> b!1262332 m!1162723))

(assert (=> b!1262332 m!1162727))

(declare-fun m!1162845 () Bool)

(assert (=> b!1262325 m!1162845))

(declare-fun m!1162847 () Bool)

(assert (=> bm!62065 m!1162847))

(assert (=> d!138533 m!1162675))

(declare-fun m!1162849 () Bool)

(assert (=> b!1262338 m!1162849))

(declare-fun m!1162851 () Bool)

(assert (=> bm!62067 m!1162851))

(assert (=> b!1262333 m!1162741))

(assert (=> b!1262333 m!1162743))

(assert (=> b!1262333 m!1162723))

(declare-fun m!1162853 () Bool)

(assert (=> b!1262333 m!1162853))

(assert (=> b!1262333 m!1162741))

(assert (=> b!1262333 m!1162743))

(assert (=> b!1262333 m!1162745))

(assert (=> b!1262333 m!1162723))

(declare-fun m!1162855 () Bool)

(assert (=> b!1262328 m!1162855))

(declare-fun m!1162857 () Bool)

(assert (=> b!1262328 m!1162857))

(declare-fun m!1162859 () Bool)

(assert (=> b!1262328 m!1162859))

(assert (=> b!1262328 m!1162687))

(declare-fun m!1162861 () Bool)

(assert (=> b!1262328 m!1162861))

(declare-fun m!1162863 () Bool)

(assert (=> b!1262328 m!1162863))

(declare-fun m!1162865 () Bool)

(assert (=> b!1262328 m!1162865))

(declare-fun m!1162867 () Bool)

(assert (=> b!1262328 m!1162867))

(declare-fun m!1162869 () Bool)

(assert (=> b!1262328 m!1162869))

(declare-fun m!1162871 () Bool)

(assert (=> b!1262328 m!1162871))

(assert (=> b!1262328 m!1162723))

(assert (=> b!1262328 m!1162857))

(declare-fun m!1162873 () Bool)

(assert (=> b!1262328 m!1162873))

(declare-fun m!1162875 () Bool)

(assert (=> b!1262328 m!1162875))

(declare-fun m!1162877 () Bool)

(assert (=> b!1262328 m!1162877))

(assert (=> b!1262328 m!1162865))

(declare-fun m!1162879 () Bool)

(assert (=> b!1262328 m!1162879))

(assert (=> b!1262328 m!1162875))

(declare-fun m!1162881 () Bool)

(assert (=> b!1262328 m!1162881))

(assert (=> b!1262328 m!1162859))

(declare-fun m!1162883 () Bool)

(assert (=> b!1262328 m!1162883))

(declare-fun m!1162885 () Bool)

(assert (=> bm!62064 m!1162885))

(assert (=> bm!62068 m!1162687))

(declare-fun m!1162887 () Bool)

(assert (=> b!1262329 m!1162887))

(assert (=> b!1262343 m!1162723))

(assert (=> b!1262343 m!1162723))

(assert (=> b!1262343 m!1162727))

(assert (=> b!1262327 m!1162723))

(assert (=> b!1262327 m!1162723))

(declare-fun m!1162889 () Bool)

(assert (=> b!1262327 m!1162889))

(assert (=> b!1262150 d!138533))

(declare-fun b!1262351 () Bool)

(declare-fun e!718558 () Bool)

(assert (=> b!1262351 (= e!718558 tp_is_empty!32373)))

(declare-fun b!1262350 () Bool)

(declare-fun e!718559 () Bool)

(assert (=> b!1262350 (= e!718559 tp_is_empty!32373)))

(declare-fun mapNonEmpty!50377 () Bool)

(declare-fun mapRes!50377 () Bool)

(declare-fun tp!95963 () Bool)

(assert (=> mapNonEmpty!50377 (= mapRes!50377 (and tp!95963 e!718559))))

(declare-fun mapRest!50377 () (Array (_ BitVec 32) ValueCell!15423))

(declare-fun mapKey!50377 () (_ BitVec 32))

(declare-fun mapValue!50377 () ValueCell!15423)

(assert (=> mapNonEmpty!50377 (= mapRest!50371 (store mapRest!50377 mapKey!50377 mapValue!50377))))

(declare-fun condMapEmpty!50377 () Bool)

(declare-fun mapDefault!50377 () ValueCell!15423)

(assert (=> mapNonEmpty!50371 (= condMapEmpty!50377 (= mapRest!50371 ((as const (Array (_ BitVec 32) ValueCell!15423)) mapDefault!50377)))))

(assert (=> mapNonEmpty!50371 (= tp!95954 (and e!718558 mapRes!50377))))

(declare-fun mapIsEmpty!50377 () Bool)

(assert (=> mapIsEmpty!50377 mapRes!50377))

(assert (= (and mapNonEmpty!50371 condMapEmpty!50377) mapIsEmpty!50377))

(assert (= (and mapNonEmpty!50371 (not condMapEmpty!50377)) mapNonEmpty!50377))

(assert (= (and mapNonEmpty!50377 ((_ is ValueCellFull!15423) mapValue!50377)) b!1262350))

(assert (= (and mapNonEmpty!50371 ((_ is ValueCellFull!15423) mapDefault!50377)) b!1262351))

(declare-fun m!1162891 () Bool)

(assert (=> mapNonEmpty!50377 m!1162891))

(declare-fun b_lambda!22863 () Bool)

(assert (= b_lambda!22861 (or (and start!105982 b_free!27471) b_lambda!22863)))

(declare-fun b_lambda!22865 () Bool)

(assert (= b_lambda!22853 (or (and start!105982 b_free!27471) b_lambda!22865)))

(declare-fun b_lambda!22867 () Bool)

(assert (= b_lambda!22855 (or (and start!105982 b_free!27471) b_lambda!22867)))

(declare-fun b_lambda!22869 () Bool)

(assert (= b_lambda!22857 (or (and start!105982 b_free!27471) b_lambda!22869)))

(declare-fun b_lambda!22871 () Bool)

(assert (= b_lambda!22859 (or (and start!105982 b_free!27471) b_lambda!22871)))

(declare-fun b_lambda!22873 () Bool)

(assert (= b_lambda!22851 (or (and start!105982 b_free!27471) b_lambda!22873)))

(check-sat (not b!1262301) (not d!138529) (not b!1262311) (not b!1262316) (not d!138533) (not b!1262234) (not d!138531) (not b_lambda!22863) (not b!1262329) (not bm!62035) (not b_lambda!22871) (not bm!62057) (not b!1262187) (not bm!62042) (not bm!62065) (not b!1262230) tp_is_empty!32373 (not bm!62061) (not b_lambda!22869) (not b!1262247) (not b!1262231) (not bm!62060) (not b!1262245) (not b!1262325) (not b!1262248) (not d!138525) (not b!1262229) (not b!1262203) (not bm!62058) (not mapNonEmpty!50377) (not b!1262302) (not b!1262237) (not b!1262233) (not b!1262190) (not d!138523) (not bm!62067) (not b!1262332) (not b!1262328) (not b!1262200) (not b!1262343) b_and!45423 (not b!1262305) (not b!1262327) (not b!1262333) (not b_next!27471) (not b!1262298) (not b_lambda!22867) (not b!1262235) (not b!1262338) (not b!1262321) (not b!1262322) (not b!1262236) (not b!1262249) (not b!1262300) (not d!138527) (not bm!62041) (not bm!62038) (not b_lambda!22873) (not b!1262188) (not b!1262250) (not bm!62068) (not b_lambda!22865) (not bm!62064) (not b!1262244) (not b!1262243) (not b!1262251) (not b!1262306))
(check-sat b_and!45423 (not b_next!27471))
