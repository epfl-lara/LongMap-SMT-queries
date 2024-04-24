; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70330 () Bool)

(assert start!70330)

(declare-fun b_free!12571 () Bool)

(declare-fun b_next!12571 () Bool)

(assert (=> start!70330 (= b_free!12571 (not b_next!12571))))

(declare-fun tp!44431 () Bool)

(declare-fun b_and!21361 () Bool)

(assert (=> start!70330 (= tp!44431 b_and!21361)))

(declare-fun res!557060 () Bool)

(declare-fun e!452597 () Bool)

(assert (=> start!70330 (=> (not res!557060) (not e!452597))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70330 (= res!557060 (validMask!0 mask!1312))))

(assert (=> start!70330 e!452597))

(declare-fun tp_is_empty!14281 () Bool)

(assert (=> start!70330 tp_is_empty!14281))

(declare-datatypes ((array!44761 0))(
  ( (array!44762 (arr!21435 (Array (_ BitVec 32) (_ BitVec 64))) (size!21855 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44761)

(declare-fun array_inv!17191 (array!44761) Bool)

(assert (=> start!70330 (array_inv!17191 _keys!976)))

(assert (=> start!70330 true))

(declare-datatypes ((V!24043 0))(
  ( (V!24044 (val!7188 Int)) )
))
(declare-datatypes ((ValueCell!6725 0))(
  ( (ValueCellFull!6725 (v!9615 V!24043)) (EmptyCell!6725) )
))
(declare-datatypes ((array!44763 0))(
  ( (array!44764 (arr!21436 (Array (_ BitVec 32) ValueCell!6725)) (size!21856 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44763)

(declare-fun e!452599 () Bool)

(declare-fun array_inv!17192 (array!44763) Bool)

(assert (=> start!70330 (and (array_inv!17192 _values!788) e!452599)))

(assert (=> start!70330 tp!44431))

(declare-fun b!816129 () Bool)

(assert (=> b!816129 (= e!452597 (not true))))

(declare-datatypes ((tuple2!9346 0))(
  ( (tuple2!9347 (_1!4684 (_ BitVec 64)) (_2!4684 V!24043)) )
))
(declare-datatypes ((List!15160 0))(
  ( (Nil!15157) (Cons!15156 (h!16291 tuple2!9346) (t!21471 List!15160)) )
))
(declare-datatypes ((ListLongMap!8171 0))(
  ( (ListLongMap!8172 (toList!4101 List!15160)) )
))
(declare-fun lt!365315 () ListLongMap!8171)

(declare-fun lt!365317 () ListLongMap!8171)

(assert (=> b!816129 (= lt!365315 lt!365317)))

(declare-fun zeroValueBefore!34 () V!24043)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24043)

(declare-fun minValue!754 () V!24043)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27769 0))(
  ( (Unit!27770) )
))
(declare-fun lt!365316 () Unit!27769)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!296 (array!44761 array!44763 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24043 V!24043 V!24043 V!24043 (_ BitVec 32) Int) Unit!27769)

(assert (=> b!816129 (= lt!365316 (lemmaNoChangeToArrayThenSameMapNoExtras!296 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2208 (array!44761 array!44763 (_ BitVec 32) (_ BitVec 32) V!24043 V!24043 (_ BitVec 32) Int) ListLongMap!8171)

(assert (=> b!816129 (= lt!365317 (getCurrentListMapNoExtraKeys!2208 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816129 (= lt!365315 (getCurrentListMapNoExtraKeys!2208 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816130 () Bool)

(declare-fun res!557062 () Bool)

(assert (=> b!816130 (=> (not res!557062) (not e!452597))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44761 (_ BitVec 32)) Bool)

(assert (=> b!816130 (= res!557062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816131 () Bool)

(declare-fun e!452601 () Bool)

(assert (=> b!816131 (= e!452601 tp_is_empty!14281)))

(declare-fun b!816132 () Bool)

(declare-fun res!557063 () Bool)

(assert (=> b!816132 (=> (not res!557063) (not e!452597))))

(assert (=> b!816132 (= res!557063 (and (= (size!21856 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21855 _keys!976) (size!21856 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816133 () Bool)

(declare-fun e!452600 () Bool)

(declare-fun mapRes!23005 () Bool)

(assert (=> b!816133 (= e!452599 (and e!452600 mapRes!23005))))

(declare-fun condMapEmpty!23005 () Bool)

(declare-fun mapDefault!23005 () ValueCell!6725)

(assert (=> b!816133 (= condMapEmpty!23005 (= (arr!21436 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6725)) mapDefault!23005)))))

(declare-fun b!816134 () Bool)

(assert (=> b!816134 (= e!452600 tp_is_empty!14281)))

(declare-fun b!816135 () Bool)

(declare-fun res!557061 () Bool)

(assert (=> b!816135 (=> (not res!557061) (not e!452597))))

(declare-datatypes ((List!15161 0))(
  ( (Nil!15158) (Cons!15157 (h!16292 (_ BitVec 64)) (t!21472 List!15161)) )
))
(declare-fun arrayNoDuplicates!0 (array!44761 (_ BitVec 32) List!15161) Bool)

(assert (=> b!816135 (= res!557061 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15158))))

(declare-fun mapIsEmpty!23005 () Bool)

(assert (=> mapIsEmpty!23005 mapRes!23005))

(declare-fun mapNonEmpty!23005 () Bool)

(declare-fun tp!44430 () Bool)

(assert (=> mapNonEmpty!23005 (= mapRes!23005 (and tp!44430 e!452601))))

(declare-fun mapKey!23005 () (_ BitVec 32))

(declare-fun mapRest!23005 () (Array (_ BitVec 32) ValueCell!6725))

(declare-fun mapValue!23005 () ValueCell!6725)

(assert (=> mapNonEmpty!23005 (= (arr!21436 _values!788) (store mapRest!23005 mapKey!23005 mapValue!23005))))

(assert (= (and start!70330 res!557060) b!816132))

(assert (= (and b!816132 res!557063) b!816130))

(assert (= (and b!816130 res!557062) b!816135))

(assert (= (and b!816135 res!557061) b!816129))

(assert (= (and b!816133 condMapEmpty!23005) mapIsEmpty!23005))

(assert (= (and b!816133 (not condMapEmpty!23005)) mapNonEmpty!23005))

(get-info :version)

(assert (= (and mapNonEmpty!23005 ((_ is ValueCellFull!6725) mapValue!23005)) b!816131))

(assert (= (and b!816133 ((_ is ValueCellFull!6725) mapDefault!23005)) b!816134))

(assert (= start!70330 b!816133))

(declare-fun m!758211 () Bool)

(assert (=> b!816135 m!758211))

(declare-fun m!758213 () Bool)

(assert (=> b!816129 m!758213))

(declare-fun m!758215 () Bool)

(assert (=> b!816129 m!758215))

(declare-fun m!758217 () Bool)

(assert (=> b!816129 m!758217))

(declare-fun m!758219 () Bool)

(assert (=> mapNonEmpty!23005 m!758219))

(declare-fun m!758221 () Bool)

(assert (=> start!70330 m!758221))

(declare-fun m!758223 () Bool)

(assert (=> start!70330 m!758223))

(declare-fun m!758225 () Bool)

(assert (=> start!70330 m!758225))

(declare-fun m!758227 () Bool)

(assert (=> b!816130 m!758227))

(check-sat b_and!21361 (not b!816135) tp_is_empty!14281 (not b_next!12571) (not start!70330) (not mapNonEmpty!23005) (not b!816129) (not b!816130))
(check-sat b_and!21361 (not b_next!12571))
