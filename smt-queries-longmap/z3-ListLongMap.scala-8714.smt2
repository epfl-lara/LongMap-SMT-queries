; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105730 () Bool)

(assert start!105730)

(declare-fun b_free!27319 () Bool)

(declare-fun b_next!27319 () Bool)

(assert (=> start!105730 (= b_free!27319 (not b_next!27319))))

(declare-fun tp!95482 () Bool)

(declare-fun b_and!45185 () Bool)

(assert (=> start!105730 (= tp!95482 b_and!45185)))

(declare-fun b!1259445 () Bool)

(declare-fun e!716510 () Bool)

(assert (=> b!1259445 (= e!716510 true)))

(declare-datatypes ((V!48327 0))(
  ( (V!48328 (val!16173 Int)) )
))
(declare-datatypes ((tuple2!20988 0))(
  ( (tuple2!20989 (_1!10505 (_ BitVec 64)) (_2!10505 V!48327)) )
))
(declare-datatypes ((List!28192 0))(
  ( (Nil!28189) (Cons!28188 (h!29397 tuple2!20988) (t!41678 List!28192)) )
))
(declare-datatypes ((ListLongMap!18861 0))(
  ( (ListLongMap!18862 (toList!9446 List!28192)) )
))
(declare-fun lt!569989 () ListLongMap!18861)

(declare-fun lt!569993 () ListLongMap!18861)

(declare-fun -!2067 (ListLongMap!18861 (_ BitVec 64)) ListLongMap!18861)

(assert (=> b!1259445 (= lt!569989 (-!2067 lt!569993 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!569988 () ListLongMap!18861)

(declare-fun lt!569991 () ListLongMap!18861)

(assert (=> b!1259445 (= (-!2067 lt!569988 #b1000000000000000000000000000000000000000000000000000000000000000) lt!569991)))

(declare-datatypes ((Unit!41836 0))(
  ( (Unit!41837) )
))
(declare-fun lt!569995 () Unit!41836)

(declare-fun minValueBefore!43 () V!48327)

(declare-fun addThenRemoveForNewKeyIsSame!324 (ListLongMap!18861 (_ BitVec 64) V!48327) Unit!41836)

(assert (=> b!1259445 (= lt!569995 (addThenRemoveForNewKeyIsSame!324 lt!569991 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716511 () Bool)

(assert (=> b!1259445 e!716511))

(declare-fun res!839405 () Bool)

(assert (=> b!1259445 (=> (not res!839405) (not e!716511))))

(assert (=> b!1259445 (= res!839405 (= lt!569993 lt!569988))))

(declare-fun +!4247 (ListLongMap!18861 tuple2!20988) ListLongMap!18861)

(assert (=> b!1259445 (= lt!569988 (+!4247 lt!569991 (tuple2!20989 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!569992 () ListLongMap!18861)

(declare-fun lt!569994 () tuple2!20988)

(assert (=> b!1259445 (= lt!569991 (+!4247 lt!569992 lt!569994))))

(declare-fun zeroValue!871 () V!48327)

(assert (=> b!1259445 (= lt!569994 (tuple2!20989 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun lt!569997 () ListLongMap!18861)

(declare-fun minValueAfter!43 () V!48327)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81985 0))(
  ( (array!81986 (arr!39548 (Array (_ BitVec 32) (_ BitVec 64))) (size!40086 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81985)

(declare-datatypes ((ValueCell!15347 0))(
  ( (ValueCellFull!15347 (v!18874 V!48327)) (EmptyCell!15347) )
))
(declare-datatypes ((array!81987 0))(
  ( (array!81988 (arr!39549 (Array (_ BitVec 32) ValueCell!15347)) (size!40087 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81987)

(declare-fun getCurrentListMap!4533 (array!81985 array!81987 (_ BitVec 32) (_ BitVec 32) V!48327 V!48327 (_ BitVec 32) Int) ListLongMap!18861)

(assert (=> b!1259445 (= lt!569997 (getCurrentListMap!4533 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259445 (= lt!569993 (getCurrentListMap!4533 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259446 () Bool)

(declare-fun e!716508 () Bool)

(declare-fun e!716509 () Bool)

(declare-fun mapRes!50128 () Bool)

(assert (=> b!1259446 (= e!716508 (and e!716509 mapRes!50128))))

(declare-fun condMapEmpty!50128 () Bool)

(declare-fun mapDefault!50128 () ValueCell!15347)

(assert (=> b!1259446 (= condMapEmpty!50128 (= (arr!39549 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15347)) mapDefault!50128)))))

(declare-fun b!1259447 () Bool)

(declare-fun res!839404 () Bool)

(declare-fun e!716507 () Bool)

(assert (=> b!1259447 (=> (not res!839404) (not e!716507))))

(assert (=> b!1259447 (= res!839404 (and (= (size!40087 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40086 _keys!1118) (size!40087 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!50128 () Bool)

(declare-fun tp!95483 () Bool)

(declare-fun e!716505 () Bool)

(assert (=> mapNonEmpty!50128 (= mapRes!50128 (and tp!95483 e!716505))))

(declare-fun mapValue!50128 () ValueCell!15347)

(declare-fun mapKey!50128 () (_ BitVec 32))

(declare-fun mapRest!50128 () (Array (_ BitVec 32) ValueCell!15347))

(assert (=> mapNonEmpty!50128 (= (arr!39549 _values!914) (store mapRest!50128 mapKey!50128 mapValue!50128))))

(declare-fun b!1259449 () Bool)

(assert (=> b!1259449 (= e!716507 (not e!716510))))

(declare-fun res!839401 () Bool)

(assert (=> b!1259449 (=> res!839401 e!716510)))

(assert (=> b!1259449 (= res!839401 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!569990 () ListLongMap!18861)

(assert (=> b!1259449 (= lt!569992 lt!569990)))

(declare-fun lt!569996 () Unit!41836)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1140 (array!81985 array!81987 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48327 V!48327 V!48327 V!48327 (_ BitVec 32) Int) Unit!41836)

(assert (=> b!1259449 (= lt!569996 (lemmaNoChangeToArrayThenSameMapNoExtras!1140 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5818 (array!81985 array!81987 (_ BitVec 32) (_ BitVec 32) V!48327 V!48327 (_ BitVec 32) Int) ListLongMap!18861)

(assert (=> b!1259449 (= lt!569990 (getCurrentListMapNoExtraKeys!5818 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259449 (= lt!569992 (getCurrentListMapNoExtraKeys!5818 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259450 () Bool)

(declare-fun res!839400 () Bool)

(assert (=> b!1259450 (=> (not res!839400) (not e!716507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81985 (_ BitVec 32)) Bool)

(assert (=> b!1259450 (= res!839400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1259451 () Bool)

(declare-fun tp_is_empty!32221 () Bool)

(assert (=> b!1259451 (= e!716505 tp_is_empty!32221)))

(declare-fun mapIsEmpty!50128 () Bool)

(assert (=> mapIsEmpty!50128 mapRes!50128))

(declare-fun res!839403 () Bool)

(assert (=> start!105730 (=> (not res!839403) (not e!716507))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105730 (= res!839403 (validMask!0 mask!1466))))

(assert (=> start!105730 e!716507))

(assert (=> start!105730 true))

(assert (=> start!105730 tp!95482))

(assert (=> start!105730 tp_is_empty!32221))

(declare-fun array_inv!30257 (array!81985) Bool)

(assert (=> start!105730 (array_inv!30257 _keys!1118)))

(declare-fun array_inv!30258 (array!81987) Bool)

(assert (=> start!105730 (and (array_inv!30258 _values!914) e!716508)))

(declare-fun b!1259448 () Bool)

(assert (=> b!1259448 (= e!716511 (= lt!569997 (+!4247 lt!569990 lt!569994)))))

(declare-fun b!1259452 () Bool)

(declare-fun res!839402 () Bool)

(assert (=> b!1259452 (=> (not res!839402) (not e!716507))))

(declare-datatypes ((List!28193 0))(
  ( (Nil!28190) (Cons!28189 (h!29398 (_ BitVec 64)) (t!41679 List!28193)) )
))
(declare-fun arrayNoDuplicates!0 (array!81985 (_ BitVec 32) List!28193) Bool)

(assert (=> b!1259452 (= res!839402 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28190))))

(declare-fun b!1259453 () Bool)

(assert (=> b!1259453 (= e!716509 tp_is_empty!32221)))

(assert (= (and start!105730 res!839403) b!1259447))

(assert (= (and b!1259447 res!839404) b!1259450))

(assert (= (and b!1259450 res!839400) b!1259452))

(assert (= (and b!1259452 res!839402) b!1259449))

(assert (= (and b!1259449 (not res!839401)) b!1259445))

(assert (= (and b!1259445 res!839405) b!1259448))

(assert (= (and b!1259446 condMapEmpty!50128) mapIsEmpty!50128))

(assert (= (and b!1259446 (not condMapEmpty!50128)) mapNonEmpty!50128))

(get-info :version)

(assert (= (and mapNonEmpty!50128 ((_ is ValueCellFull!15347) mapValue!50128)) b!1259451))

(assert (= (and b!1259446 ((_ is ValueCellFull!15347) mapDefault!50128)) b!1259453))

(assert (= start!105730 b!1259446))

(declare-fun m!1159505 () Bool)

(assert (=> start!105730 m!1159505))

(declare-fun m!1159507 () Bool)

(assert (=> start!105730 m!1159507))

(declare-fun m!1159509 () Bool)

(assert (=> start!105730 m!1159509))

(declare-fun m!1159511 () Bool)

(assert (=> b!1259445 m!1159511))

(declare-fun m!1159513 () Bool)

(assert (=> b!1259445 m!1159513))

(declare-fun m!1159515 () Bool)

(assert (=> b!1259445 m!1159515))

(declare-fun m!1159517 () Bool)

(assert (=> b!1259445 m!1159517))

(declare-fun m!1159519 () Bool)

(assert (=> b!1259445 m!1159519))

(declare-fun m!1159521 () Bool)

(assert (=> b!1259445 m!1159521))

(declare-fun m!1159523 () Bool)

(assert (=> b!1259445 m!1159523))

(declare-fun m!1159525 () Bool)

(assert (=> b!1259452 m!1159525))

(declare-fun m!1159527 () Bool)

(assert (=> b!1259448 m!1159527))

(declare-fun m!1159529 () Bool)

(assert (=> mapNonEmpty!50128 m!1159529))

(declare-fun m!1159531 () Bool)

(assert (=> b!1259449 m!1159531))

(declare-fun m!1159533 () Bool)

(assert (=> b!1259449 m!1159533))

(declare-fun m!1159535 () Bool)

(assert (=> b!1259449 m!1159535))

(declare-fun m!1159537 () Bool)

(assert (=> b!1259450 m!1159537))

(check-sat (not mapNonEmpty!50128) (not b!1259452) (not b!1259449) b_and!45185 (not b!1259445) tp_is_empty!32221 (not b_next!27319) (not b!1259450) (not start!105730) (not b!1259448))
(check-sat b_and!45185 (not b_next!27319))
