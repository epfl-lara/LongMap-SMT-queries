; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105876 () Bool)

(assert start!105876)

(declare-fun b_free!27253 () Bool)

(declare-fun b_next!27253 () Bool)

(assert (=> start!105876 (= b_free!27253 (not b_next!27253))))

(declare-fun tp!95281 () Bool)

(declare-fun b_and!45129 () Bool)

(assert (=> start!105876 (= tp!95281 b_and!45129)))

(declare-fun b!1259818 () Bool)

(declare-fun res!839337 () Bool)

(declare-fun e!716640 () Bool)

(assert (=> b!1259818 (=> (not res!839337) (not e!716640))))

(declare-datatypes ((array!81983 0))(
  ( (array!81984 (arr!39543 (Array (_ BitVec 32) (_ BitVec 64))) (size!40080 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81983)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81983 (_ BitVec 32)) Bool)

(assert (=> b!1259818 (= res!839337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1259819 () Bool)

(declare-fun e!716638 () Bool)

(assert (=> b!1259819 (= e!716640 (not e!716638))))

(declare-fun res!839334 () Bool)

(assert (=> b!1259819 (=> res!839334 e!716638)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259819 (= res!839334 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48239 0))(
  ( (V!48240 (val!16140 Int)) )
))
(declare-datatypes ((tuple2!20872 0))(
  ( (tuple2!20873 (_1!10447 (_ BitVec 64)) (_2!10447 V!48239)) )
))
(declare-datatypes ((List!28101 0))(
  ( (Nil!28098) (Cons!28097 (h!29315 tuple2!20872) (t!41586 List!28101)) )
))
(declare-datatypes ((ListLongMap!18753 0))(
  ( (ListLongMap!18754 (toList!9392 List!28101)) )
))
(declare-fun lt!569726 () ListLongMap!18753)

(declare-fun lt!569724 () ListLongMap!18753)

(assert (=> b!1259819 (= lt!569726 lt!569724)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48239)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48239)

(declare-fun minValueBefore!43 () V!48239)

(declare-datatypes ((ValueCell!15314 0))(
  ( (ValueCellFull!15314 (v!18838 V!48239)) (EmptyCell!15314) )
))
(declare-datatypes ((array!81985 0))(
  ( (array!81986 (arr!39544 (Array (_ BitVec 32) ValueCell!15314)) (size!40081 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81985)

(declare-datatypes ((Unit!41927 0))(
  ( (Unit!41928) )
))
(declare-fun lt!569725 () Unit!41927)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1122 (array!81983 array!81985 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48239 V!48239 V!48239 V!48239 (_ BitVec 32) Int) Unit!41927)

(assert (=> b!1259819 (= lt!569725 (lemmaNoChangeToArrayThenSameMapNoExtras!1122 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5808 (array!81983 array!81985 (_ BitVec 32) (_ BitVec 32) V!48239 V!48239 (_ BitVec 32) Int) ListLongMap!18753)

(assert (=> b!1259819 (= lt!569724 (getCurrentListMapNoExtraKeys!5808 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259819 (= lt!569726 (getCurrentListMapNoExtraKeys!5808 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!839333 () Bool)

(assert (=> start!105876 (=> (not res!839333) (not e!716640))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105876 (= res!839333 (validMask!0 mask!1466))))

(assert (=> start!105876 e!716640))

(assert (=> start!105876 true))

(assert (=> start!105876 tp!95281))

(declare-fun tp_is_empty!32155 () Bool)

(assert (=> start!105876 tp_is_empty!32155))

(declare-fun array_inv!30255 (array!81983) Bool)

(assert (=> start!105876 (array_inv!30255 _keys!1118)))

(declare-fun e!716639 () Bool)

(declare-fun array_inv!30256 (array!81985) Bool)

(assert (=> start!105876 (and (array_inv!30256 _values!914) e!716639)))

(declare-fun b!1259820 () Bool)

(assert (=> b!1259820 (= e!716638 true)))

(declare-fun lt!569723 () ListLongMap!18753)

(declare-fun getCurrentListMap!4579 (array!81983 array!81985 (_ BitVec 32) (_ BitVec 32) V!48239 V!48239 (_ BitVec 32) Int) ListLongMap!18753)

(assert (=> b!1259820 (= lt!569723 (getCurrentListMap!4579 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259821 () Bool)

(declare-fun res!839335 () Bool)

(assert (=> b!1259821 (=> (not res!839335) (not e!716640))))

(declare-datatypes ((List!28102 0))(
  ( (Nil!28099) (Cons!28098 (h!29316 (_ BitVec 64)) (t!41587 List!28102)) )
))
(declare-fun arrayNoDuplicates!0 (array!81983 (_ BitVec 32) List!28102) Bool)

(assert (=> b!1259821 (= res!839335 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28099))))

(declare-fun b!1259822 () Bool)

(declare-fun e!716636 () Bool)

(assert (=> b!1259822 (= e!716636 tp_is_empty!32155)))

(declare-fun mapIsEmpty!50026 () Bool)

(declare-fun mapRes!50026 () Bool)

(assert (=> mapIsEmpty!50026 mapRes!50026))

(declare-fun mapNonEmpty!50026 () Bool)

(declare-fun tp!95282 () Bool)

(declare-fun e!716637 () Bool)

(assert (=> mapNonEmpty!50026 (= mapRes!50026 (and tp!95282 e!716637))))

(declare-fun mapValue!50026 () ValueCell!15314)

(declare-fun mapKey!50026 () (_ BitVec 32))

(declare-fun mapRest!50026 () (Array (_ BitVec 32) ValueCell!15314))

(assert (=> mapNonEmpty!50026 (= (arr!39544 _values!914) (store mapRest!50026 mapKey!50026 mapValue!50026))))

(declare-fun b!1259823 () Bool)

(assert (=> b!1259823 (= e!716639 (and e!716636 mapRes!50026))))

(declare-fun condMapEmpty!50026 () Bool)

(declare-fun mapDefault!50026 () ValueCell!15314)

(assert (=> b!1259823 (= condMapEmpty!50026 (= (arr!39544 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15314)) mapDefault!50026)))))

(declare-fun b!1259824 () Bool)

(declare-fun res!839336 () Bool)

(assert (=> b!1259824 (=> (not res!839336) (not e!716640))))

(assert (=> b!1259824 (= res!839336 (and (= (size!40081 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40080 _keys!1118) (size!40081 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259825 () Bool)

(assert (=> b!1259825 (= e!716637 tp_is_empty!32155)))

(assert (= (and start!105876 res!839333) b!1259824))

(assert (= (and b!1259824 res!839336) b!1259818))

(assert (= (and b!1259818 res!839337) b!1259821))

(assert (= (and b!1259821 res!839335) b!1259819))

(assert (= (and b!1259819 (not res!839334)) b!1259820))

(assert (= (and b!1259823 condMapEmpty!50026) mapIsEmpty!50026))

(assert (= (and b!1259823 (not condMapEmpty!50026)) mapNonEmpty!50026))

(get-info :version)

(assert (= (and mapNonEmpty!50026 ((_ is ValueCellFull!15314) mapValue!50026)) b!1259825))

(assert (= (and b!1259823 ((_ is ValueCellFull!15314) mapDefault!50026)) b!1259822))

(assert (= start!105876 b!1259823))

(declare-fun m!1160541 () Bool)

(assert (=> b!1259821 m!1160541))

(declare-fun m!1160543 () Bool)

(assert (=> b!1259819 m!1160543))

(declare-fun m!1160545 () Bool)

(assert (=> b!1259819 m!1160545))

(declare-fun m!1160547 () Bool)

(assert (=> b!1259819 m!1160547))

(declare-fun m!1160549 () Bool)

(assert (=> b!1259820 m!1160549))

(declare-fun m!1160551 () Bool)

(assert (=> start!105876 m!1160551))

(declare-fun m!1160553 () Bool)

(assert (=> start!105876 m!1160553))

(declare-fun m!1160555 () Bool)

(assert (=> start!105876 m!1160555))

(declare-fun m!1160557 () Bool)

(assert (=> mapNonEmpty!50026 m!1160557))

(declare-fun m!1160559 () Bool)

(assert (=> b!1259818 m!1160559))

(check-sat (not b!1259820) b_and!45129 (not b!1259818) (not b!1259821) (not b_next!27253) (not mapNonEmpty!50026) (not b!1259819) tp_is_empty!32155 (not start!105876))
(check-sat b_and!45129 (not b_next!27253))
