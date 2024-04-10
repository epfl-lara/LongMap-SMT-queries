; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106062 () Bool)

(assert start!106062)

(declare-fun b_free!27495 () Bool)

(declare-fun b_next!27495 () Bool)

(assert (=> start!106062 (= b_free!27495 (not b_next!27495))))

(declare-fun tp!96035 () Bool)

(declare-fun b_and!45469 () Bool)

(assert (=> start!106062 (= tp!96035 b_and!45469)))

(declare-fun mapIsEmpty!50416 () Bool)

(declare-fun mapRes!50416 () Bool)

(assert (=> mapIsEmpty!50416 mapRes!50416))

(declare-fun b!1262994 () Bool)

(declare-fun e!719008 () Bool)

(declare-fun tp_is_empty!32397 () Bool)

(assert (=> b!1262994 (= e!719008 tp_is_empty!32397)))

(declare-fun b!1262995 () Bool)

(declare-fun e!719007 () Bool)

(assert (=> b!1262995 (= e!719007 true)))

(declare-datatypes ((V!48561 0))(
  ( (V!48562 (val!16261 Int)) )
))
(declare-datatypes ((tuple2!21048 0))(
  ( (tuple2!21049 (_1!10535 (_ BitVec 64)) (_2!10535 V!48561)) )
))
(declare-datatypes ((List!28241 0))(
  ( (Nil!28238) (Cons!28237 (h!29446 tuple2!21048) (t!41752 List!28241)) )
))
(declare-datatypes ((ListLongMap!18921 0))(
  ( (ListLongMap!18922 (toList!9476 List!28241)) )
))
(declare-fun lt!572681 () ListLongMap!18921)

(declare-fun lt!572686 () ListLongMap!18921)

(declare-fun -!2144 (ListLongMap!18921 (_ BitVec 64)) ListLongMap!18921)

(assert (=> b!1262995 (= lt!572681 (-!2144 lt!572686 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!572680 () ListLongMap!18921)

(declare-fun lt!572679 () ListLongMap!18921)

(assert (=> b!1262995 (= (-!2144 lt!572680 #b1000000000000000000000000000000000000000000000000000000000000000) lt!572679)))

(declare-datatypes ((Unit!42101 0))(
  ( (Unit!42102) )
))
(declare-fun lt!572684 () Unit!42101)

(declare-fun minValueBefore!43 () V!48561)

(declare-fun addThenRemoveForNewKeyIsSame!379 (ListLongMap!18921 (_ BitVec 64) V!48561) Unit!42101)

(assert (=> b!1262995 (= lt!572684 (addThenRemoveForNewKeyIsSame!379 lt!572679 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!572682 () ListLongMap!18921)

(declare-fun lt!572683 () ListLongMap!18921)

(assert (=> b!1262995 (and (= lt!572686 lt!572680) (= lt!572682 lt!572683))))

(declare-fun +!4250 (ListLongMap!18921 tuple2!21048) ListLongMap!18921)

(assert (=> b!1262995 (= lt!572680 (+!4250 lt!572679 (tuple2!21049 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48561)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82414 0))(
  ( (array!82415 (arr!39754 (Array (_ BitVec 32) (_ BitVec 64))) (size!40290 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82414)

(declare-datatypes ((ValueCell!15435 0))(
  ( (ValueCellFull!15435 (v!18970 V!48561)) (EmptyCell!15435) )
))
(declare-datatypes ((array!82416 0))(
  ( (array!82417 (arr!39755 (Array (_ BitVec 32) ValueCell!15435)) (size!40291 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82416)

(declare-fun zeroValue!871 () V!48561)

(declare-fun getCurrentListMap!4643 (array!82414 array!82416 (_ BitVec 32) (_ BitVec 32) V!48561 V!48561 (_ BitVec 32) Int) ListLongMap!18921)

(assert (=> b!1262995 (= lt!572682 (getCurrentListMap!4643 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1262995 (= lt!572686 (getCurrentListMap!4643 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262997 () Bool)

(declare-fun res!841343 () Bool)

(declare-fun e!719005 () Bool)

(assert (=> b!1262997 (=> (not res!841343) (not e!719005))))

(assert (=> b!1262997 (= res!841343 (and (= (size!40291 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40290 _keys!1118) (size!40291 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262998 () Bool)

(declare-fun res!841341 () Bool)

(assert (=> b!1262998 (=> (not res!841341) (not e!719005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82414 (_ BitVec 32)) Bool)

(assert (=> b!1262998 (= res!841341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1262996 () Bool)

(assert (=> b!1262996 (= e!719005 (not e!719007))))

(declare-fun res!841342 () Bool)

(assert (=> b!1262996 (=> res!841342 e!719007)))

(assert (=> b!1262996 (= res!841342 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1262996 (= lt!572679 lt!572683)))

(declare-fun lt!572685 () Unit!42101)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1183 (array!82414 array!82416 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48561 V!48561 V!48561 V!48561 (_ BitVec 32) Int) Unit!42101)

(assert (=> b!1262996 (= lt!572685 (lemmaNoChangeToArrayThenSameMapNoExtras!1183 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5841 (array!82414 array!82416 (_ BitVec 32) (_ BitVec 32) V!48561 V!48561 (_ BitVec 32) Int) ListLongMap!18921)

(assert (=> b!1262996 (= lt!572683 (getCurrentListMapNoExtraKeys!5841 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1262996 (= lt!572679 (getCurrentListMapNoExtraKeys!5841 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!841344 () Bool)

(assert (=> start!106062 (=> (not res!841344) (not e!719005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106062 (= res!841344 (validMask!0 mask!1466))))

(assert (=> start!106062 e!719005))

(assert (=> start!106062 true))

(assert (=> start!106062 tp!96035))

(assert (=> start!106062 tp_is_empty!32397))

(declare-fun array_inv!30257 (array!82414) Bool)

(assert (=> start!106062 (array_inv!30257 _keys!1118)))

(declare-fun e!719009 () Bool)

(declare-fun array_inv!30258 (array!82416) Bool)

(assert (=> start!106062 (and (array_inv!30258 _values!914) e!719009)))

(declare-fun b!1262999 () Bool)

(declare-fun e!719010 () Bool)

(assert (=> b!1262999 (= e!719009 (and e!719010 mapRes!50416))))

(declare-fun condMapEmpty!50416 () Bool)

(declare-fun mapDefault!50416 () ValueCell!15435)

(assert (=> b!1262999 (= condMapEmpty!50416 (= (arr!39755 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15435)) mapDefault!50416)))))

(declare-fun b!1263000 () Bool)

(assert (=> b!1263000 (= e!719010 tp_is_empty!32397)))

(declare-fun b!1263001 () Bool)

(declare-fun res!841345 () Bool)

(assert (=> b!1263001 (=> (not res!841345) (not e!719005))))

(declare-datatypes ((List!28242 0))(
  ( (Nil!28239) (Cons!28238 (h!29447 (_ BitVec 64)) (t!41753 List!28242)) )
))
(declare-fun arrayNoDuplicates!0 (array!82414 (_ BitVec 32) List!28242) Bool)

(assert (=> b!1263001 (= res!841345 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28239))))

(declare-fun mapNonEmpty!50416 () Bool)

(declare-fun tp!96034 () Bool)

(assert (=> mapNonEmpty!50416 (= mapRes!50416 (and tp!96034 e!719008))))

(declare-fun mapRest!50416 () (Array (_ BitVec 32) ValueCell!15435))

(declare-fun mapValue!50416 () ValueCell!15435)

(declare-fun mapKey!50416 () (_ BitVec 32))

(assert (=> mapNonEmpty!50416 (= (arr!39755 _values!914) (store mapRest!50416 mapKey!50416 mapValue!50416))))

(assert (= (and start!106062 res!841344) b!1262997))

(assert (= (and b!1262997 res!841343) b!1262998))

(assert (= (and b!1262998 res!841341) b!1263001))

(assert (= (and b!1263001 res!841345) b!1262996))

(assert (= (and b!1262996 (not res!841342)) b!1262995))

(assert (= (and b!1262999 condMapEmpty!50416) mapIsEmpty!50416))

(assert (= (and b!1262999 (not condMapEmpty!50416)) mapNonEmpty!50416))

(get-info :version)

(assert (= (and mapNonEmpty!50416 ((_ is ValueCellFull!15435) mapValue!50416)) b!1262994))

(assert (= (and b!1262999 ((_ is ValueCellFull!15435) mapDefault!50416)) b!1263000))

(assert (= start!106062 b!1262999))

(declare-fun m!1163511 () Bool)

(assert (=> mapNonEmpty!50416 m!1163511))

(declare-fun m!1163513 () Bool)

(assert (=> b!1262998 m!1163513))

(declare-fun m!1163515 () Bool)

(assert (=> b!1262995 m!1163515))

(declare-fun m!1163517 () Bool)

(assert (=> b!1262995 m!1163517))

(declare-fun m!1163519 () Bool)

(assert (=> b!1262995 m!1163519))

(declare-fun m!1163521 () Bool)

(assert (=> b!1262995 m!1163521))

(declare-fun m!1163523 () Bool)

(assert (=> b!1262995 m!1163523))

(declare-fun m!1163525 () Bool)

(assert (=> b!1262995 m!1163525))

(declare-fun m!1163527 () Bool)

(assert (=> b!1262996 m!1163527))

(declare-fun m!1163529 () Bool)

(assert (=> b!1262996 m!1163529))

(declare-fun m!1163531 () Bool)

(assert (=> b!1262996 m!1163531))

(declare-fun m!1163533 () Bool)

(assert (=> start!106062 m!1163533))

(declare-fun m!1163535 () Bool)

(assert (=> start!106062 m!1163535))

(declare-fun m!1163537 () Bool)

(assert (=> start!106062 m!1163537))

(declare-fun m!1163539 () Bool)

(assert (=> b!1263001 m!1163539))

(check-sat (not b_next!27495) (not b!1262995) b_and!45469 (not b!1262996) (not b!1263001) (not start!106062) (not mapNonEmpty!50416) tp_is_empty!32397 (not b!1262998))
(check-sat b_and!45469 (not b_next!27495))
