; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105912 () Bool)

(assert start!105912)

(declare-fun b_free!27453 () Bool)

(declare-fun b_next!27453 () Bool)

(assert (=> start!105912 (= b_free!27453 (not b_next!27453))))

(declare-fun tp!95891 () Bool)

(declare-fun b_and!45361 () Bool)

(assert (=> start!105912 (= tp!95891 b_and!45361)))

(declare-fun b!1261504 () Bool)

(declare-fun res!840611 () Bool)

(declare-fun e!717994 () Bool)

(assert (=> b!1261504 (=> (not res!840611) (not e!717994))))

(declare-datatypes ((array!82324 0))(
  ( (array!82325 (arr!39715 (Array (_ BitVec 32) (_ BitVec 64))) (size!40251 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82324)

(declare-datatypes ((List!28212 0))(
  ( (Nil!28209) (Cons!28208 (h!29417 (_ BitVec 64)) (t!41711 List!28212)) )
))
(declare-fun arrayNoDuplicates!0 (array!82324 (_ BitVec 32) List!28212) Bool)

(assert (=> b!1261504 (= res!840611 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28209))))

(declare-fun b!1261505 () Bool)

(declare-fun res!840610 () Bool)

(assert (=> b!1261505 (=> (not res!840610) (not e!717994))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((V!48505 0))(
  ( (V!48506 (val!16240 Int)) )
))
(declare-datatypes ((ValueCell!15414 0))(
  ( (ValueCellFull!15414 (v!18944 V!48505)) (EmptyCell!15414) )
))
(declare-datatypes ((array!82326 0))(
  ( (array!82327 (arr!39716 (Array (_ BitVec 32) ValueCell!15414)) (size!40252 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82326)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1261505 (= res!840610 (and (= (size!40252 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40251 _keys!1118) (size!40252 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!840613 () Bool)

(assert (=> start!105912 (=> (not res!840613) (not e!717994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105912 (= res!840613 (validMask!0 mask!1466))))

(assert (=> start!105912 e!717994))

(assert (=> start!105912 true))

(assert (=> start!105912 tp!95891))

(declare-fun tp_is_empty!32355 () Bool)

(assert (=> start!105912 tp_is_empty!32355))

(declare-fun array_inv!30235 (array!82324) Bool)

(assert (=> start!105912 (array_inv!30235 _keys!1118)))

(declare-fun e!717993 () Bool)

(declare-fun array_inv!30236 (array!82326) Bool)

(assert (=> start!105912 (and (array_inv!30236 _values!914) e!717993)))

(declare-fun b!1261506 () Bool)

(declare-fun e!717995 () Bool)

(assert (=> b!1261506 (= e!717995 tp_is_empty!32355)))

(declare-fun b!1261507 () Bool)

(assert (=> b!1261507 (= e!717994 (bvsgt #b00000000000000000000000000000000 (size!40251 _keys!1118)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48505)

(declare-fun zeroValue!871 () V!48505)

(declare-datatypes ((tuple2!21016 0))(
  ( (tuple2!21017 (_1!10519 (_ BitVec 64)) (_2!10519 V!48505)) )
))
(declare-datatypes ((List!28213 0))(
  ( (Nil!28210) (Cons!28209 (h!29418 tuple2!21016) (t!41712 List!28213)) )
))
(declare-datatypes ((ListLongMap!18889 0))(
  ( (ListLongMap!18890 (toList!9460 List!28213)) )
))
(declare-fun lt!571647 () ListLongMap!18889)

(declare-fun getCurrentListMapNoExtraKeys!5828 (array!82324 array!82326 (_ BitVec 32) (_ BitVec 32) V!48505 V!48505 (_ BitVec 32) Int) ListLongMap!18889)

(assert (=> b!1261507 (= lt!571647 (getCurrentListMapNoExtraKeys!5828 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571646 () ListLongMap!18889)

(declare-fun minValueBefore!43 () V!48505)

(assert (=> b!1261507 (= lt!571646 (getCurrentListMapNoExtraKeys!5828 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261508 () Bool)

(declare-fun res!840612 () Bool)

(assert (=> b!1261508 (=> (not res!840612) (not e!717994))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82324 (_ BitVec 32)) Bool)

(assert (=> b!1261508 (= res!840612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!50335 () Bool)

(declare-fun mapRes!50335 () Bool)

(assert (=> mapIsEmpty!50335 mapRes!50335))

(declare-fun b!1261509 () Bool)

(declare-fun e!717991 () Bool)

(assert (=> b!1261509 (= e!717993 (and e!717991 mapRes!50335))))

(declare-fun condMapEmpty!50335 () Bool)

(declare-fun mapDefault!50335 () ValueCell!15414)

(assert (=> b!1261509 (= condMapEmpty!50335 (= (arr!39716 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15414)) mapDefault!50335)))))

(declare-fun b!1261510 () Bool)

(assert (=> b!1261510 (= e!717991 tp_is_empty!32355)))

(declare-fun mapNonEmpty!50335 () Bool)

(declare-fun tp!95890 () Bool)

(assert (=> mapNonEmpty!50335 (= mapRes!50335 (and tp!95890 e!717995))))

(declare-fun mapKey!50335 () (_ BitVec 32))

(declare-fun mapValue!50335 () ValueCell!15414)

(declare-fun mapRest!50335 () (Array (_ BitVec 32) ValueCell!15414))

(assert (=> mapNonEmpty!50335 (= (arr!39716 _values!914) (store mapRest!50335 mapKey!50335 mapValue!50335))))

(assert (= (and start!105912 res!840613) b!1261505))

(assert (= (and b!1261505 res!840610) b!1261508))

(assert (= (and b!1261508 res!840612) b!1261504))

(assert (= (and b!1261504 res!840611) b!1261507))

(assert (= (and b!1261509 condMapEmpty!50335) mapIsEmpty!50335))

(assert (= (and b!1261509 (not condMapEmpty!50335)) mapNonEmpty!50335))

(get-info :version)

(assert (= (and mapNonEmpty!50335 ((_ is ValueCellFull!15414) mapValue!50335)) b!1261506))

(assert (= (and b!1261509 ((_ is ValueCellFull!15414) mapDefault!50335)) b!1261510))

(assert (= start!105912 b!1261509))

(declare-fun m!1162113 () Bool)

(assert (=> mapNonEmpty!50335 m!1162113))

(declare-fun m!1162115 () Bool)

(assert (=> b!1261507 m!1162115))

(declare-fun m!1162117 () Bool)

(assert (=> b!1261507 m!1162117))

(declare-fun m!1162119 () Bool)

(assert (=> b!1261504 m!1162119))

(declare-fun m!1162121 () Bool)

(assert (=> start!105912 m!1162121))

(declare-fun m!1162123 () Bool)

(assert (=> start!105912 m!1162123))

(declare-fun m!1162125 () Bool)

(assert (=> start!105912 m!1162125))

(declare-fun m!1162127 () Bool)

(assert (=> b!1261508 m!1162127))

(check-sat b_and!45361 (not start!105912) (not b!1261504) (not b_next!27453) (not b!1261507) (not b!1261508) tp_is_empty!32355 (not mapNonEmpty!50335))
(check-sat b_and!45361 (not b_next!27453))
(get-model)

(declare-fun b!1261540 () Bool)

(declare-fun e!718019 () Bool)

(declare-fun call!61959 () Bool)

(assert (=> b!1261540 (= e!718019 call!61959)))

(declare-fun bm!61956 () Bool)

(assert (=> bm!61956 (= call!61959 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1261541 () Bool)

(declare-fun e!718017 () Bool)

(assert (=> b!1261541 (= e!718017 e!718019)))

(declare-fun lt!571662 () (_ BitVec 64))

(assert (=> b!1261541 (= lt!571662 (select (arr!39715 _keys!1118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42061 0))(
  ( (Unit!42062) )
))
(declare-fun lt!571660 () Unit!42061)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82324 (_ BitVec 64) (_ BitVec 32)) Unit!42061)

(assert (=> b!1261541 (= lt!571660 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!571662 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82324 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1261541 (arrayContainsKey!0 _keys!1118 lt!571662 #b00000000000000000000000000000000)))

(declare-fun lt!571661 () Unit!42061)

(assert (=> b!1261541 (= lt!571661 lt!571660)))

(declare-fun res!840631 () Bool)

(declare-datatypes ((SeekEntryResult!9972 0))(
  ( (MissingZero!9972 (index!42259 (_ BitVec 32))) (Found!9972 (index!42260 (_ BitVec 32))) (Intermediate!9972 (undefined!10784 Bool) (index!42261 (_ BitVec 32)) (x!111169 (_ BitVec 32))) (Undefined!9972) (MissingVacant!9972 (index!42262 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82324 (_ BitVec 32)) SeekEntryResult!9972)

(assert (=> b!1261541 (= res!840631 (= (seekEntryOrOpen!0 (select (arr!39715 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9972 #b00000000000000000000000000000000)))))

(assert (=> b!1261541 (=> (not res!840631) (not e!718019))))

(declare-fun b!1261542 () Bool)

(declare-fun e!718018 () Bool)

(assert (=> b!1261542 (= e!718018 e!718017)))

(declare-fun c!122651 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1261542 (= c!122651 (validKeyInArray!0 (select (arr!39715 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138447 () Bool)

(declare-fun res!840630 () Bool)

(assert (=> d!138447 (=> res!840630 e!718018)))

(assert (=> d!138447 (= res!840630 (bvsge #b00000000000000000000000000000000 (size!40251 _keys!1118)))))

(assert (=> d!138447 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!718018)))

(declare-fun b!1261543 () Bool)

(assert (=> b!1261543 (= e!718017 call!61959)))

(assert (= (and d!138447 (not res!840630)) b!1261542))

(assert (= (and b!1261542 c!122651) b!1261541))

(assert (= (and b!1261542 (not c!122651)) b!1261543))

(assert (= (and b!1261541 res!840631) b!1261540))

(assert (= (or b!1261540 b!1261543) bm!61956))

(declare-fun m!1162145 () Bool)

(assert (=> bm!61956 m!1162145))

(declare-fun m!1162147 () Bool)

(assert (=> b!1261541 m!1162147))

(declare-fun m!1162149 () Bool)

(assert (=> b!1261541 m!1162149))

(declare-fun m!1162151 () Bool)

(assert (=> b!1261541 m!1162151))

(assert (=> b!1261541 m!1162147))

(declare-fun m!1162153 () Bool)

(assert (=> b!1261541 m!1162153))

(assert (=> b!1261542 m!1162147))

(assert (=> b!1261542 m!1162147))

(declare-fun m!1162155 () Bool)

(assert (=> b!1261542 m!1162155))

(assert (=> b!1261508 d!138447))

(declare-fun b!1261554 () Bool)

(declare-fun e!718031 () Bool)

(declare-fun call!61962 () Bool)

(assert (=> b!1261554 (= e!718031 call!61962)))

(declare-fun b!1261555 () Bool)

(assert (=> b!1261555 (= e!718031 call!61962)))

(declare-fun b!1261556 () Bool)

(declare-fun e!718029 () Bool)

(declare-fun e!718028 () Bool)

(assert (=> b!1261556 (= e!718029 e!718028)))

(declare-fun res!840640 () Bool)

(assert (=> b!1261556 (=> (not res!840640) (not e!718028))))

(declare-fun e!718030 () Bool)

(assert (=> b!1261556 (= res!840640 (not e!718030))))

(declare-fun res!840638 () Bool)

(assert (=> b!1261556 (=> (not res!840638) (not e!718030))))

(assert (=> b!1261556 (= res!840638 (validKeyInArray!0 (select (arr!39715 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61959 () Bool)

(declare-fun c!122654 () Bool)

(assert (=> bm!61959 (= call!61962 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122654 (Cons!28208 (select (arr!39715 _keys!1118) #b00000000000000000000000000000000) Nil!28209) Nil!28209)))))

(declare-fun d!138449 () Bool)

(declare-fun res!840639 () Bool)

(assert (=> d!138449 (=> res!840639 e!718029)))

(assert (=> d!138449 (= res!840639 (bvsge #b00000000000000000000000000000000 (size!40251 _keys!1118)))))

(assert (=> d!138449 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28209) e!718029)))

(declare-fun b!1261557 () Bool)

(declare-fun contains!7579 (List!28212 (_ BitVec 64)) Bool)

(assert (=> b!1261557 (= e!718030 (contains!7579 Nil!28209 (select (arr!39715 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261558 () Bool)

(assert (=> b!1261558 (= e!718028 e!718031)))

(assert (=> b!1261558 (= c!122654 (validKeyInArray!0 (select (arr!39715 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138449 (not res!840639)) b!1261556))

(assert (= (and b!1261556 res!840638) b!1261557))

(assert (= (and b!1261556 res!840640) b!1261558))

(assert (= (and b!1261558 c!122654) b!1261554))

(assert (= (and b!1261558 (not c!122654)) b!1261555))

(assert (= (or b!1261554 b!1261555) bm!61959))

(assert (=> b!1261556 m!1162147))

(assert (=> b!1261556 m!1162147))

(assert (=> b!1261556 m!1162155))

(assert (=> bm!61959 m!1162147))

(declare-fun m!1162157 () Bool)

(assert (=> bm!61959 m!1162157))

(assert (=> b!1261557 m!1162147))

(assert (=> b!1261557 m!1162147))

(declare-fun m!1162159 () Bool)

(assert (=> b!1261557 m!1162159))

(assert (=> b!1261558 m!1162147))

(assert (=> b!1261558 m!1162147))

(assert (=> b!1261558 m!1162155))

(assert (=> b!1261504 d!138449))

(declare-fun b!1261583 () Bool)

(declare-fun lt!571682 () ListLongMap!18889)

(declare-fun e!718047 () Bool)

(assert (=> b!1261583 (= e!718047 (= lt!571682 (getCurrentListMapNoExtraKeys!5828 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1261584 () Bool)

(declare-fun lt!571677 () Unit!42061)

(declare-fun lt!571679 () Unit!42061)

(assert (=> b!1261584 (= lt!571677 lt!571679)))

(declare-fun lt!571680 () V!48505)

(declare-fun lt!571683 () ListLongMap!18889)

(declare-fun lt!571678 () (_ BitVec 64))

(declare-fun lt!571681 () (_ BitVec 64))

(declare-fun contains!7580 (ListLongMap!18889 (_ BitVec 64)) Bool)

(declare-fun +!4240 (ListLongMap!18889 tuple2!21016) ListLongMap!18889)

(assert (=> b!1261584 (not (contains!7580 (+!4240 lt!571683 (tuple2!21017 lt!571678 lt!571680)) lt!571681))))

(declare-fun addStillNotContains!322 (ListLongMap!18889 (_ BitVec 64) V!48505 (_ BitVec 64)) Unit!42061)

(assert (=> b!1261584 (= lt!571679 (addStillNotContains!322 lt!571683 lt!571678 lt!571680 lt!571681))))

(assert (=> b!1261584 (= lt!571681 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!20263 (ValueCell!15414 V!48505) V!48505)

(declare-fun dynLambda!3392 (Int (_ BitVec 64)) V!48505)

(assert (=> b!1261584 (= lt!571680 (get!20263 (select (arr!39716 _values!914) #b00000000000000000000000000000000) (dynLambda!3392 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1261584 (= lt!571678 (select (arr!39715 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61965 () ListLongMap!18889)

(assert (=> b!1261584 (= lt!571683 call!61965)))

(declare-fun e!718049 () ListLongMap!18889)

(assert (=> b!1261584 (= e!718049 (+!4240 call!61965 (tuple2!21017 (select (arr!39715 _keys!1118) #b00000000000000000000000000000000) (get!20263 (select (arr!39716 _values!914) #b00000000000000000000000000000000) (dynLambda!3392 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1261585 () Bool)

(declare-fun e!718050 () Bool)

(declare-fun e!718051 () Bool)

(assert (=> b!1261585 (= e!718050 e!718051)))

(assert (=> b!1261585 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40251 _keys!1118)))))

(declare-fun res!840652 () Bool)

(assert (=> b!1261585 (= res!840652 (contains!7580 lt!571682 (select (arr!39715 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261585 (=> (not res!840652) (not e!718051))))

(declare-fun d!138451 () Bool)

(declare-fun e!718048 () Bool)

(assert (=> d!138451 e!718048))

(declare-fun res!840649 () Bool)

(assert (=> d!138451 (=> (not res!840649) (not e!718048))))

(assert (=> d!138451 (= res!840649 (not (contains!7580 lt!571682 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!718046 () ListLongMap!18889)

(assert (=> d!138451 (= lt!571682 e!718046)))

(declare-fun c!122666 () Bool)

(assert (=> d!138451 (= c!122666 (bvsge #b00000000000000000000000000000000 (size!40251 _keys!1118)))))

(assert (=> d!138451 (validMask!0 mask!1466)))

(assert (=> d!138451 (= (getCurrentListMapNoExtraKeys!5828 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571682)))

(declare-fun b!1261586 () Bool)

(declare-fun res!840651 () Bool)

(assert (=> b!1261586 (=> (not res!840651) (not e!718048))))

(assert (=> b!1261586 (= res!840651 (not (contains!7580 lt!571682 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1261587 () Bool)

(assert (=> b!1261587 (= e!718049 call!61965)))

(declare-fun b!1261588 () Bool)

(assert (=> b!1261588 (= e!718050 e!718047)))

(declare-fun c!122663 () Bool)

(assert (=> b!1261588 (= c!122663 (bvslt #b00000000000000000000000000000000 (size!40251 _keys!1118)))))

(declare-fun b!1261589 () Bool)

(declare-fun isEmpty!1036 (ListLongMap!18889) Bool)

(assert (=> b!1261589 (= e!718047 (isEmpty!1036 lt!571682))))

(declare-fun b!1261590 () Bool)

(assert (=> b!1261590 (= e!718048 e!718050)))

(declare-fun c!122664 () Bool)

(declare-fun e!718052 () Bool)

(assert (=> b!1261590 (= c!122664 e!718052)))

(declare-fun res!840650 () Bool)

(assert (=> b!1261590 (=> (not res!840650) (not e!718052))))

(assert (=> b!1261590 (= res!840650 (bvslt #b00000000000000000000000000000000 (size!40251 _keys!1118)))))

(declare-fun b!1261591 () Bool)

(assert (=> b!1261591 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40251 _keys!1118)))))

(assert (=> b!1261591 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40252 _values!914)))))

(declare-fun apply!994 (ListLongMap!18889 (_ BitVec 64)) V!48505)

(assert (=> b!1261591 (= e!718051 (= (apply!994 lt!571682 (select (arr!39715 _keys!1118) #b00000000000000000000000000000000)) (get!20263 (select (arr!39716 _values!914) #b00000000000000000000000000000000) (dynLambda!3392 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1261592 () Bool)

(assert (=> b!1261592 (= e!718046 (ListLongMap!18890 Nil!28210))))

(declare-fun bm!61962 () Bool)

(assert (=> bm!61962 (= call!61965 (getCurrentListMapNoExtraKeys!5828 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1261593 () Bool)

(assert (=> b!1261593 (= e!718052 (validKeyInArray!0 (select (arr!39715 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261593 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1261594 () Bool)

(assert (=> b!1261594 (= e!718046 e!718049)))

(declare-fun c!122665 () Bool)

(assert (=> b!1261594 (= c!122665 (validKeyInArray!0 (select (arr!39715 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138451 c!122666) b!1261592))

(assert (= (and d!138451 (not c!122666)) b!1261594))

(assert (= (and b!1261594 c!122665) b!1261584))

(assert (= (and b!1261594 (not c!122665)) b!1261587))

(assert (= (or b!1261584 b!1261587) bm!61962))

(assert (= (and d!138451 res!840649) b!1261586))

(assert (= (and b!1261586 res!840651) b!1261590))

(assert (= (and b!1261590 res!840650) b!1261593))

(assert (= (and b!1261590 c!122664) b!1261585))

(assert (= (and b!1261590 (not c!122664)) b!1261588))

(assert (= (and b!1261585 res!840652) b!1261591))

(assert (= (and b!1261588 c!122663) b!1261583))

(assert (= (and b!1261588 (not c!122663)) b!1261589))

(declare-fun b_lambda!22791 () Bool)

(assert (=> (not b_lambda!22791) (not b!1261584)))

(declare-fun t!41714 () Bool)

(declare-fun tb!11315 () Bool)

(assert (=> (and start!105912 (= defaultEntry!922 defaultEntry!922) t!41714) tb!11315))

(declare-fun result!23353 () Bool)

(assert (=> tb!11315 (= result!23353 tp_is_empty!32355)))

(assert (=> b!1261584 t!41714))

(declare-fun b_and!45365 () Bool)

(assert (= b_and!45361 (and (=> t!41714 result!23353) b_and!45365)))

(declare-fun b_lambda!22793 () Bool)

(assert (=> (not b_lambda!22793) (not b!1261591)))

(assert (=> b!1261591 t!41714))

(declare-fun b_and!45367 () Bool)

(assert (= b_and!45365 (and (=> t!41714 result!23353) b_and!45367)))

(declare-fun m!1162161 () Bool)

(assert (=> b!1261589 m!1162161))

(assert (=> b!1261594 m!1162147))

(assert (=> b!1261594 m!1162147))

(assert (=> b!1261594 m!1162155))

(declare-fun m!1162163 () Bool)

(assert (=> b!1261586 m!1162163))

(declare-fun m!1162165 () Bool)

(assert (=> d!138451 m!1162165))

(assert (=> d!138451 m!1162121))

(declare-fun m!1162167 () Bool)

(assert (=> b!1261583 m!1162167))

(assert (=> b!1261585 m!1162147))

(assert (=> b!1261585 m!1162147))

(declare-fun m!1162169 () Bool)

(assert (=> b!1261585 m!1162169))

(assert (=> b!1261593 m!1162147))

(assert (=> b!1261593 m!1162147))

(assert (=> b!1261593 m!1162155))

(assert (=> b!1261591 m!1162147))

(declare-fun m!1162171 () Bool)

(assert (=> b!1261591 m!1162171))

(declare-fun m!1162173 () Bool)

(assert (=> b!1261591 m!1162173))

(declare-fun m!1162175 () Bool)

(assert (=> b!1261591 m!1162175))

(declare-fun m!1162177 () Bool)

(assert (=> b!1261591 m!1162177))

(assert (=> b!1261591 m!1162147))

(assert (=> b!1261591 m!1162175))

(assert (=> b!1261591 m!1162173))

(assert (=> bm!61962 m!1162167))

(declare-fun m!1162179 () Bool)

(assert (=> b!1261584 m!1162179))

(declare-fun m!1162181 () Bool)

(assert (=> b!1261584 m!1162181))

(declare-fun m!1162183 () Bool)

(assert (=> b!1261584 m!1162183))

(assert (=> b!1261584 m!1162173))

(assert (=> b!1261584 m!1162175))

(assert (=> b!1261584 m!1162177))

(assert (=> b!1261584 m!1162147))

(declare-fun m!1162185 () Bool)

(assert (=> b!1261584 m!1162185))

(assert (=> b!1261584 m!1162181))

(assert (=> b!1261584 m!1162175))

(assert (=> b!1261584 m!1162173))

(assert (=> b!1261507 d!138451))

(declare-fun e!718054 () Bool)

(declare-fun lt!571689 () ListLongMap!18889)

(declare-fun b!1261597 () Bool)

(assert (=> b!1261597 (= e!718054 (= lt!571689 (getCurrentListMapNoExtraKeys!5828 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1261598 () Bool)

(declare-fun lt!571684 () Unit!42061)

(declare-fun lt!571686 () Unit!42061)

(assert (=> b!1261598 (= lt!571684 lt!571686)))

(declare-fun lt!571685 () (_ BitVec 64))

(declare-fun lt!571687 () V!48505)

(declare-fun lt!571688 () (_ BitVec 64))

(declare-fun lt!571690 () ListLongMap!18889)

(assert (=> b!1261598 (not (contains!7580 (+!4240 lt!571690 (tuple2!21017 lt!571685 lt!571687)) lt!571688))))

(assert (=> b!1261598 (= lt!571686 (addStillNotContains!322 lt!571690 lt!571685 lt!571687 lt!571688))))

(assert (=> b!1261598 (= lt!571688 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1261598 (= lt!571687 (get!20263 (select (arr!39716 _values!914) #b00000000000000000000000000000000) (dynLambda!3392 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1261598 (= lt!571685 (select (arr!39715 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61966 () ListLongMap!18889)

(assert (=> b!1261598 (= lt!571690 call!61966)))

(declare-fun e!718056 () ListLongMap!18889)

(assert (=> b!1261598 (= e!718056 (+!4240 call!61966 (tuple2!21017 (select (arr!39715 _keys!1118) #b00000000000000000000000000000000) (get!20263 (select (arr!39716 _values!914) #b00000000000000000000000000000000) (dynLambda!3392 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1261599 () Bool)

(declare-fun e!718057 () Bool)

(declare-fun e!718058 () Bool)

(assert (=> b!1261599 (= e!718057 e!718058)))

(assert (=> b!1261599 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40251 _keys!1118)))))

(declare-fun res!840656 () Bool)

(assert (=> b!1261599 (= res!840656 (contains!7580 lt!571689 (select (arr!39715 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261599 (=> (not res!840656) (not e!718058))))

(declare-fun d!138453 () Bool)

(declare-fun e!718055 () Bool)

(assert (=> d!138453 e!718055))

(declare-fun res!840653 () Bool)

(assert (=> d!138453 (=> (not res!840653) (not e!718055))))

(assert (=> d!138453 (= res!840653 (not (contains!7580 lt!571689 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!718053 () ListLongMap!18889)

(assert (=> d!138453 (= lt!571689 e!718053)))

(declare-fun c!122670 () Bool)

(assert (=> d!138453 (= c!122670 (bvsge #b00000000000000000000000000000000 (size!40251 _keys!1118)))))

(assert (=> d!138453 (validMask!0 mask!1466)))

(assert (=> d!138453 (= (getCurrentListMapNoExtraKeys!5828 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571689)))

(declare-fun b!1261600 () Bool)

(declare-fun res!840655 () Bool)

(assert (=> b!1261600 (=> (not res!840655) (not e!718055))))

(assert (=> b!1261600 (= res!840655 (not (contains!7580 lt!571689 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1261601 () Bool)

(assert (=> b!1261601 (= e!718056 call!61966)))

(declare-fun b!1261602 () Bool)

(assert (=> b!1261602 (= e!718057 e!718054)))

(declare-fun c!122667 () Bool)

(assert (=> b!1261602 (= c!122667 (bvslt #b00000000000000000000000000000000 (size!40251 _keys!1118)))))

(declare-fun b!1261603 () Bool)

(assert (=> b!1261603 (= e!718054 (isEmpty!1036 lt!571689))))

(declare-fun b!1261604 () Bool)

(assert (=> b!1261604 (= e!718055 e!718057)))

(declare-fun c!122668 () Bool)

(declare-fun e!718059 () Bool)

(assert (=> b!1261604 (= c!122668 e!718059)))

(declare-fun res!840654 () Bool)

(assert (=> b!1261604 (=> (not res!840654) (not e!718059))))

(assert (=> b!1261604 (= res!840654 (bvslt #b00000000000000000000000000000000 (size!40251 _keys!1118)))))

(declare-fun b!1261605 () Bool)

(assert (=> b!1261605 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40251 _keys!1118)))))

(assert (=> b!1261605 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40252 _values!914)))))

(assert (=> b!1261605 (= e!718058 (= (apply!994 lt!571689 (select (arr!39715 _keys!1118) #b00000000000000000000000000000000)) (get!20263 (select (arr!39716 _values!914) #b00000000000000000000000000000000) (dynLambda!3392 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1261606 () Bool)

(assert (=> b!1261606 (= e!718053 (ListLongMap!18890 Nil!28210))))

(declare-fun bm!61963 () Bool)

(assert (=> bm!61963 (= call!61966 (getCurrentListMapNoExtraKeys!5828 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1261607 () Bool)

(assert (=> b!1261607 (= e!718059 (validKeyInArray!0 (select (arr!39715 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261607 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1261608 () Bool)

(assert (=> b!1261608 (= e!718053 e!718056)))

(declare-fun c!122669 () Bool)

(assert (=> b!1261608 (= c!122669 (validKeyInArray!0 (select (arr!39715 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138453 c!122670) b!1261606))

(assert (= (and d!138453 (not c!122670)) b!1261608))

(assert (= (and b!1261608 c!122669) b!1261598))

(assert (= (and b!1261608 (not c!122669)) b!1261601))

(assert (= (or b!1261598 b!1261601) bm!61963))

(assert (= (and d!138453 res!840653) b!1261600))

(assert (= (and b!1261600 res!840655) b!1261604))

(assert (= (and b!1261604 res!840654) b!1261607))

(assert (= (and b!1261604 c!122668) b!1261599))

(assert (= (and b!1261604 (not c!122668)) b!1261602))

(assert (= (and b!1261599 res!840656) b!1261605))

(assert (= (and b!1261602 c!122667) b!1261597))

(assert (= (and b!1261602 (not c!122667)) b!1261603))

(declare-fun b_lambda!22795 () Bool)

(assert (=> (not b_lambda!22795) (not b!1261598)))

(assert (=> b!1261598 t!41714))

(declare-fun b_and!45369 () Bool)

(assert (= b_and!45367 (and (=> t!41714 result!23353) b_and!45369)))

(declare-fun b_lambda!22797 () Bool)

(assert (=> (not b_lambda!22797) (not b!1261605)))

(assert (=> b!1261605 t!41714))

(declare-fun b_and!45371 () Bool)

(assert (= b_and!45369 (and (=> t!41714 result!23353) b_and!45371)))

(declare-fun m!1162187 () Bool)

(assert (=> b!1261603 m!1162187))

(assert (=> b!1261608 m!1162147))

(assert (=> b!1261608 m!1162147))

(assert (=> b!1261608 m!1162155))

(declare-fun m!1162189 () Bool)

(assert (=> b!1261600 m!1162189))

(declare-fun m!1162191 () Bool)

(assert (=> d!138453 m!1162191))

(assert (=> d!138453 m!1162121))

(declare-fun m!1162193 () Bool)

(assert (=> b!1261597 m!1162193))

(assert (=> b!1261599 m!1162147))

(assert (=> b!1261599 m!1162147))

(declare-fun m!1162195 () Bool)

(assert (=> b!1261599 m!1162195))

(assert (=> b!1261607 m!1162147))

(assert (=> b!1261607 m!1162147))

(assert (=> b!1261607 m!1162155))

(assert (=> b!1261605 m!1162147))

(declare-fun m!1162197 () Bool)

(assert (=> b!1261605 m!1162197))

(assert (=> b!1261605 m!1162173))

(assert (=> b!1261605 m!1162175))

(assert (=> b!1261605 m!1162177))

(assert (=> b!1261605 m!1162147))

(assert (=> b!1261605 m!1162175))

(assert (=> b!1261605 m!1162173))

(assert (=> bm!61963 m!1162193))

(declare-fun m!1162199 () Bool)

(assert (=> b!1261598 m!1162199))

(declare-fun m!1162201 () Bool)

(assert (=> b!1261598 m!1162201))

(declare-fun m!1162203 () Bool)

(assert (=> b!1261598 m!1162203))

(assert (=> b!1261598 m!1162173))

(assert (=> b!1261598 m!1162175))

(assert (=> b!1261598 m!1162177))

(assert (=> b!1261598 m!1162147))

(declare-fun m!1162205 () Bool)

(assert (=> b!1261598 m!1162205))

(assert (=> b!1261598 m!1162201))

(assert (=> b!1261598 m!1162175))

(assert (=> b!1261598 m!1162173))

(assert (=> b!1261507 d!138453))

(declare-fun d!138455 () Bool)

(assert (=> d!138455 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105912 d!138455))

(declare-fun d!138457 () Bool)

(assert (=> d!138457 (= (array_inv!30235 _keys!1118) (bvsge (size!40251 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105912 d!138457))

(declare-fun d!138459 () Bool)

(assert (=> d!138459 (= (array_inv!30236 _values!914) (bvsge (size!40252 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105912 d!138459))

(declare-fun mapNonEmpty!50341 () Bool)

(declare-fun mapRes!50341 () Bool)

(declare-fun tp!95900 () Bool)

(declare-fun e!718065 () Bool)

(assert (=> mapNonEmpty!50341 (= mapRes!50341 (and tp!95900 e!718065))))

(declare-fun mapRest!50341 () (Array (_ BitVec 32) ValueCell!15414))

(declare-fun mapKey!50341 () (_ BitVec 32))

(declare-fun mapValue!50341 () ValueCell!15414)

(assert (=> mapNonEmpty!50341 (= mapRest!50335 (store mapRest!50341 mapKey!50341 mapValue!50341))))

(declare-fun b!1261616 () Bool)

(declare-fun e!718064 () Bool)

(assert (=> b!1261616 (= e!718064 tp_is_empty!32355)))

(declare-fun condMapEmpty!50341 () Bool)

(declare-fun mapDefault!50341 () ValueCell!15414)

(assert (=> mapNonEmpty!50335 (= condMapEmpty!50341 (= mapRest!50335 ((as const (Array (_ BitVec 32) ValueCell!15414)) mapDefault!50341)))))

(assert (=> mapNonEmpty!50335 (= tp!95890 (and e!718064 mapRes!50341))))

(declare-fun b!1261615 () Bool)

(assert (=> b!1261615 (= e!718065 tp_is_empty!32355)))

(declare-fun mapIsEmpty!50341 () Bool)

(assert (=> mapIsEmpty!50341 mapRes!50341))

(assert (= (and mapNonEmpty!50335 condMapEmpty!50341) mapIsEmpty!50341))

(assert (= (and mapNonEmpty!50335 (not condMapEmpty!50341)) mapNonEmpty!50341))

(assert (= (and mapNonEmpty!50341 ((_ is ValueCellFull!15414) mapValue!50341)) b!1261615))

(assert (= (and mapNonEmpty!50335 ((_ is ValueCellFull!15414) mapDefault!50341)) b!1261616))

(declare-fun m!1162207 () Bool)

(assert (=> mapNonEmpty!50341 m!1162207))

(declare-fun b_lambda!22799 () Bool)

(assert (= b_lambda!22795 (or (and start!105912 b_free!27453) b_lambda!22799)))

(declare-fun b_lambda!22801 () Bool)

(assert (= b_lambda!22793 (or (and start!105912 b_free!27453) b_lambda!22801)))

(declare-fun b_lambda!22803 () Bool)

(assert (= b_lambda!22791 (or (and start!105912 b_free!27453) b_lambda!22803)))

(declare-fun b_lambda!22805 () Bool)

(assert (= b_lambda!22797 (or (and start!105912 b_free!27453) b_lambda!22805)))

(check-sat (not b!1261585) (not bm!61956) (not b_lambda!22801) (not bm!61959) (not bm!61963) (not b_lambda!22799) b_and!45371 (not b!1261583) (not mapNonEmpty!50341) (not b!1261584) (not b!1261600) (not b!1261597) (not b!1261542) (not d!138453) (not b!1261599) (not d!138451) (not b_lambda!22805) (not b!1261603) (not b!1261591) (not b!1261593) (not b!1261605) (not b!1261594) tp_is_empty!32355 (not bm!61962) (not b!1261558) (not b!1261541) (not b!1261608) (not b!1261586) (not b!1261589) (not b!1261556) (not b!1261607) (not b_next!27453) (not b!1261598) (not b!1261557) (not b_lambda!22803))
(check-sat b_and!45371 (not b_next!27453))
