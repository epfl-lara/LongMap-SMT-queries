; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105636 () Bool)

(assert start!105636)

(declare-fun b_free!27237 () Bool)

(declare-fun b_next!27237 () Bool)

(assert (=> start!105636 (= b_free!27237 (not b_next!27237))))

(declare-fun tp!95233 () Bool)

(declare-fun b_and!45111 () Bool)

(assert (=> start!105636 (= tp!95233 b_and!45111)))

(declare-fun b!1258321 () Bool)

(declare-fun e!715647 () Bool)

(declare-fun e!715649 () Bool)

(assert (=> b!1258321 (= e!715647 (not e!715649))))

(declare-fun res!838694 () Bool)

(assert (=> b!1258321 (=> res!838694 e!715649)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1258321 (= res!838694 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48217 0))(
  ( (V!48218 (val!16132 Int)) )
))
(declare-datatypes ((tuple2!20838 0))(
  ( (tuple2!20839 (_1!10430 (_ BitVec 64)) (_2!10430 V!48217)) )
))
(declare-datatypes ((List!28054 0))(
  ( (Nil!28051) (Cons!28050 (h!29259 tuple2!20838) (t!41547 List!28054)) )
))
(declare-datatypes ((ListLongMap!18711 0))(
  ( (ListLongMap!18712 (toList!9371 List!28054)) )
))
(declare-fun lt!569144 () ListLongMap!18711)

(declare-fun lt!569145 () ListLongMap!18711)

(assert (=> b!1258321 (= lt!569144 lt!569145)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48217)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48217)

(declare-datatypes ((array!81902 0))(
  ( (array!81903 (arr!39507 (Array (_ BitVec 32) (_ BitVec 64))) (size!40043 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81902)

(declare-datatypes ((ValueCell!15306 0))(
  ( (ValueCellFull!15306 (v!18834 V!48217)) (EmptyCell!15306) )
))
(declare-datatypes ((array!81904 0))(
  ( (array!81905 (arr!39508 (Array (_ BitVec 32) ValueCell!15306)) (size!40044 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81904)

(declare-fun minValueBefore!43 () V!48217)

(declare-datatypes ((Unit!41926 0))(
  ( (Unit!41927) )
))
(declare-fun lt!569143 () Unit!41926)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1113 (array!81902 array!81904 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48217 V!48217 V!48217 V!48217 (_ BitVec 32) Int) Unit!41926)

(assert (=> b!1258321 (= lt!569143 (lemmaNoChangeToArrayThenSameMapNoExtras!1113 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5749 (array!81902 array!81904 (_ BitVec 32) (_ BitVec 32) V!48217 V!48217 (_ BitVec 32) Int) ListLongMap!18711)

(assert (=> b!1258321 (= lt!569145 (getCurrentListMapNoExtraKeys!5749 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258321 (= lt!569144 (getCurrentListMapNoExtraKeys!5749 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258322 () Bool)

(declare-fun res!838697 () Bool)

(assert (=> b!1258322 (=> (not res!838697) (not e!715647))))

(declare-datatypes ((List!28055 0))(
  ( (Nil!28052) (Cons!28051 (h!29260 (_ BitVec 64)) (t!41548 List!28055)) )
))
(declare-fun arrayNoDuplicates!0 (array!81902 (_ BitVec 32) List!28055) Bool)

(assert (=> b!1258322 (= res!838697 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28052))))

(declare-fun b!1258323 () Bool)

(declare-fun res!838693 () Bool)

(assert (=> b!1258323 (=> (not res!838693) (not e!715647))))

(assert (=> b!1258323 (= res!838693 (and (= (size!40044 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40043 _keys!1118) (size!40044 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258324 () Bool)

(declare-fun e!715644 () Bool)

(declare-fun tp_is_empty!32139 () Bool)

(assert (=> b!1258324 (= e!715644 tp_is_empty!32139)))

(declare-fun mapNonEmpty!50002 () Bool)

(declare-fun mapRes!50002 () Bool)

(declare-fun tp!95234 () Bool)

(declare-fun e!715646 () Bool)

(assert (=> mapNonEmpty!50002 (= mapRes!50002 (and tp!95234 e!715646))))

(declare-fun mapValue!50002 () ValueCell!15306)

(declare-fun mapKey!50002 () (_ BitVec 32))

(declare-fun mapRest!50002 () (Array (_ BitVec 32) ValueCell!15306))

(assert (=> mapNonEmpty!50002 (= (arr!39508 _values!914) (store mapRest!50002 mapKey!50002 mapValue!50002))))

(declare-fun b!1258325 () Bool)

(declare-fun res!838695 () Bool)

(assert (=> b!1258325 (=> (not res!838695) (not e!715647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81902 (_ BitVec 32)) Bool)

(assert (=> b!1258325 (= res!838695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!838696 () Bool)

(assert (=> start!105636 (=> (not res!838696) (not e!715647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105636 (= res!838696 (validMask!0 mask!1466))))

(assert (=> start!105636 e!715647))

(assert (=> start!105636 true))

(assert (=> start!105636 tp!95233))

(assert (=> start!105636 tp_is_empty!32139))

(declare-fun array_inv!30091 (array!81902) Bool)

(assert (=> start!105636 (array_inv!30091 _keys!1118)))

(declare-fun e!715648 () Bool)

(declare-fun array_inv!30092 (array!81904) Bool)

(assert (=> start!105636 (and (array_inv!30092 _values!914) e!715648)))

(declare-fun mapIsEmpty!50002 () Bool)

(assert (=> mapIsEmpty!50002 mapRes!50002))

(declare-fun b!1258326 () Bool)

(assert (=> b!1258326 (= e!715646 tp_is_empty!32139)))

(declare-fun b!1258327 () Bool)

(assert (=> b!1258327 (= e!715648 (and e!715644 mapRes!50002))))

(declare-fun condMapEmpty!50002 () Bool)

(declare-fun mapDefault!50002 () ValueCell!15306)

(assert (=> b!1258327 (= condMapEmpty!50002 (= (arr!39508 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15306)) mapDefault!50002)))))

(declare-fun b!1258328 () Bool)

(assert (=> b!1258328 (= e!715649 true)))

(declare-fun lt!569146 () ListLongMap!18711)

(declare-fun getCurrentListMap!4576 (array!81902 array!81904 (_ BitVec 32) (_ BitVec 32) V!48217 V!48217 (_ BitVec 32) Int) ListLongMap!18711)

(assert (=> b!1258328 (= lt!569146 (getCurrentListMap!4576 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105636 res!838696) b!1258323))

(assert (= (and b!1258323 res!838693) b!1258325))

(assert (= (and b!1258325 res!838695) b!1258322))

(assert (= (and b!1258322 res!838697) b!1258321))

(assert (= (and b!1258321 (not res!838694)) b!1258328))

(assert (= (and b!1258327 condMapEmpty!50002) mapIsEmpty!50002))

(assert (= (and b!1258327 (not condMapEmpty!50002)) mapNonEmpty!50002))

(get-info :version)

(assert (= (and mapNonEmpty!50002 ((_ is ValueCellFull!15306) mapValue!50002)) b!1258326))

(assert (= (and b!1258327 ((_ is ValueCellFull!15306) mapDefault!50002)) b!1258324))

(assert (= start!105636 b!1258327))

(declare-fun m!1158769 () Bool)

(assert (=> mapNonEmpty!50002 m!1158769))

(declare-fun m!1158771 () Bool)

(assert (=> b!1258325 m!1158771))

(declare-fun m!1158773 () Bool)

(assert (=> b!1258321 m!1158773))

(declare-fun m!1158775 () Bool)

(assert (=> b!1258321 m!1158775))

(declare-fun m!1158777 () Bool)

(assert (=> b!1258321 m!1158777))

(declare-fun m!1158779 () Bool)

(assert (=> start!105636 m!1158779))

(declare-fun m!1158781 () Bool)

(assert (=> start!105636 m!1158781))

(declare-fun m!1158783 () Bool)

(assert (=> start!105636 m!1158783))

(declare-fun m!1158785 () Bool)

(assert (=> b!1258328 m!1158785))

(declare-fun m!1158787 () Bool)

(assert (=> b!1258322 m!1158787))

(check-sat (not b!1258328) (not b!1258322) tp_is_empty!32139 (not start!105636) (not b_next!27237) b_and!45111 (not b!1258325) (not b!1258321) (not mapNonEmpty!50002))
(check-sat b_and!45111 (not b_next!27237))
