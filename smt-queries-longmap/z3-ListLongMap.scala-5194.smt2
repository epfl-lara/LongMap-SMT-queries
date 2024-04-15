; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70144 () Bool)

(assert start!70144)

(declare-fun b_free!12571 () Bool)

(declare-fun b_next!12571 () Bool)

(assert (=> start!70144 (= b_free!12571 (not b_next!12571))))

(declare-fun tp!44431 () Bool)

(declare-fun b_and!21325 () Bool)

(assert (=> start!70144 (= tp!44431 b_and!21325)))

(declare-fun b!814989 () Bool)

(declare-fun e!451870 () Bool)

(declare-fun e!451873 () Bool)

(declare-fun mapRes!23005 () Bool)

(assert (=> b!814989 (= e!451870 (and e!451873 mapRes!23005))))

(declare-fun condMapEmpty!23005 () Bool)

(declare-datatypes ((V!24043 0))(
  ( (V!24044 (val!7188 Int)) )
))
(declare-datatypes ((ValueCell!6725 0))(
  ( (ValueCellFull!6725 (v!9609 V!24043)) (EmptyCell!6725) )
))
(declare-datatypes ((array!44753 0))(
  ( (array!44754 (arr!21436 (Array (_ BitVec 32) ValueCell!6725)) (size!21857 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44753)

(declare-fun mapDefault!23005 () ValueCell!6725)

(assert (=> b!814989 (= condMapEmpty!23005 (= (arr!21436 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6725)) mapDefault!23005)))))

(declare-fun b!814990 () Bool)

(declare-fun res!556609 () Bool)

(declare-fun e!451871 () Bool)

(assert (=> b!814990 (=> (not res!556609) (not e!451871))))

(declare-datatypes ((array!44755 0))(
  ( (array!44756 (arr!21437 (Array (_ BitVec 32) (_ BitVec 64))) (size!21858 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44755)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!814990 (= res!556609 (and (= (size!21857 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21858 _keys!976) (size!21857 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814991 () Bool)

(declare-fun tp_is_empty!14281 () Bool)

(assert (=> b!814991 (= e!451873 tp_is_empty!14281)))

(declare-fun mapIsEmpty!23005 () Bool)

(assert (=> mapIsEmpty!23005 mapRes!23005))

(declare-fun b!814992 () Bool)

(declare-fun res!556611 () Bool)

(assert (=> b!814992 (=> (not res!556611) (not e!451871))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44755 (_ BitVec 32)) Bool)

(assert (=> b!814992 (= res!556611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!556608 () Bool)

(assert (=> start!70144 (=> (not res!556608) (not e!451871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70144 (= res!556608 (validMask!0 mask!1312))))

(assert (=> start!70144 e!451871))

(assert (=> start!70144 tp_is_empty!14281))

(declare-fun array_inv!17233 (array!44755) Bool)

(assert (=> start!70144 (array_inv!17233 _keys!976)))

(assert (=> start!70144 true))

(declare-fun array_inv!17234 (array!44753) Bool)

(assert (=> start!70144 (and (array_inv!17234 _values!788) e!451870)))

(assert (=> start!70144 tp!44431))

(declare-fun b!814993 () Bool)

(declare-fun res!556610 () Bool)

(assert (=> b!814993 (=> (not res!556610) (not e!451871))))

(declare-datatypes ((List!15277 0))(
  ( (Nil!15274) (Cons!15273 (h!16402 (_ BitVec 64)) (t!21587 List!15277)) )
))
(declare-fun arrayNoDuplicates!0 (array!44755 (_ BitVec 32) List!15277) Bool)

(assert (=> b!814993 (= res!556610 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15274))))

(declare-fun b!814994 () Bool)

(assert (=> b!814994 (= e!451871 (not true))))

(declare-datatypes ((tuple2!9448 0))(
  ( (tuple2!9449 (_1!4735 (_ BitVec 64)) (_2!4735 V!24043)) )
))
(declare-datatypes ((List!15278 0))(
  ( (Nil!15275) (Cons!15274 (h!16403 tuple2!9448) (t!21588 List!15278)) )
))
(declare-datatypes ((ListLongMap!8261 0))(
  ( (ListLongMap!8262 (toList!4146 List!15278)) )
))
(declare-fun lt!364719 () ListLongMap!8261)

(declare-fun lt!364720 () ListLongMap!8261)

(assert (=> b!814994 (= lt!364719 lt!364720)))

(declare-fun zeroValueBefore!34 () V!24043)

(declare-fun zeroValueAfter!34 () V!24043)

(declare-fun minValue!754 () V!24043)

(declare-datatypes ((Unit!27726 0))(
  ( (Unit!27727) )
))
(declare-fun lt!364718 () Unit!27726)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!304 (array!44755 array!44753 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24043 V!24043 V!24043 V!24043 (_ BitVec 32) Int) Unit!27726)

(assert (=> b!814994 (= lt!364718 (lemmaNoChangeToArrayThenSameMapNoExtras!304 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2211 (array!44755 array!44753 (_ BitVec 32) (_ BitVec 32) V!24043 V!24043 (_ BitVec 32) Int) ListLongMap!8261)

(assert (=> b!814994 (= lt!364720 (getCurrentListMapNoExtraKeys!2211 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814994 (= lt!364719 (getCurrentListMapNoExtraKeys!2211 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23005 () Bool)

(declare-fun tp!44430 () Bool)

(declare-fun e!451872 () Bool)

(assert (=> mapNonEmpty!23005 (= mapRes!23005 (and tp!44430 e!451872))))

(declare-fun mapRest!23005 () (Array (_ BitVec 32) ValueCell!6725))

(declare-fun mapKey!23005 () (_ BitVec 32))

(declare-fun mapValue!23005 () ValueCell!6725)

(assert (=> mapNonEmpty!23005 (= (arr!21436 _values!788) (store mapRest!23005 mapKey!23005 mapValue!23005))))

(declare-fun b!814995 () Bool)

(assert (=> b!814995 (= e!451872 tp_is_empty!14281)))

(assert (= (and start!70144 res!556608) b!814990))

(assert (= (and b!814990 res!556609) b!814992))

(assert (= (and b!814992 res!556611) b!814993))

(assert (= (and b!814993 res!556610) b!814994))

(assert (= (and b!814989 condMapEmpty!23005) mapIsEmpty!23005))

(assert (= (and b!814989 (not condMapEmpty!23005)) mapNonEmpty!23005))

(get-info :version)

(assert (= (and mapNonEmpty!23005 ((_ is ValueCellFull!6725) mapValue!23005)) b!814995))

(assert (= (and b!814989 ((_ is ValueCellFull!6725) mapDefault!23005)) b!814991))

(assert (= start!70144 b!814989))

(declare-fun m!756177 () Bool)

(assert (=> b!814993 m!756177))

(declare-fun m!756179 () Bool)

(assert (=> b!814992 m!756179))

(declare-fun m!756181 () Bool)

(assert (=> start!70144 m!756181))

(declare-fun m!756183 () Bool)

(assert (=> start!70144 m!756183))

(declare-fun m!756185 () Bool)

(assert (=> start!70144 m!756185))

(declare-fun m!756187 () Bool)

(assert (=> mapNonEmpty!23005 m!756187))

(declare-fun m!756189 () Bool)

(assert (=> b!814994 m!756189))

(declare-fun m!756191 () Bool)

(assert (=> b!814994 m!756191))

(declare-fun m!756193 () Bool)

(assert (=> b!814994 m!756193))

(check-sat (not start!70144) b_and!21325 (not mapNonEmpty!23005) (not b!814992) (not b!814994) (not b!814993) tp_is_empty!14281 (not b_next!12571))
(check-sat b_and!21325 (not b_next!12571))
