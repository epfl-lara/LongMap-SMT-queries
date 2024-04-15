; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70218 () Bool)

(assert start!70218)

(declare-fun b_free!12631 () Bool)

(declare-fun b_next!12631 () Bool)

(assert (=> start!70218 (= b_free!12631 (not b_next!12631))))

(declare-fun tp!44613 () Bool)

(declare-fun b_and!21393 () Bool)

(assert (=> start!70218 (= tp!44613 b_and!21393)))

(declare-fun res!557066 () Bool)

(declare-fun e!452444 () Bool)

(assert (=> start!70218 (=> (not res!557066) (not e!452444))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70218 (= res!557066 (validMask!0 mask!1312))))

(assert (=> start!70218 e!452444))

(declare-fun tp_is_empty!14341 () Bool)

(assert (=> start!70218 tp_is_empty!14341))

(declare-datatypes ((array!44867 0))(
  ( (array!44868 (arr!21492 (Array (_ BitVec 32) (_ BitVec 64))) (size!21913 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44867)

(declare-fun array_inv!17275 (array!44867) Bool)

(assert (=> start!70218 (array_inv!17275 _keys!976)))

(assert (=> start!70218 true))

(declare-datatypes ((V!24123 0))(
  ( (V!24124 (val!7218 Int)) )
))
(declare-datatypes ((ValueCell!6755 0))(
  ( (ValueCellFull!6755 (v!9639 V!24123)) (EmptyCell!6755) )
))
(declare-datatypes ((array!44869 0))(
  ( (array!44870 (arr!21493 (Array (_ BitVec 32) ValueCell!6755)) (size!21914 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44869)

(declare-fun e!452440 () Bool)

(declare-fun array_inv!17276 (array!44869) Bool)

(assert (=> start!70218 (and (array_inv!17276 _values!788) e!452440)))

(assert (=> start!70218 tp!44613))

(declare-fun b!815769 () Bool)

(declare-fun e!452441 () Bool)

(assert (=> b!815769 (= e!452441 true)))

(declare-fun zeroValueAfter!34 () V!24123)

(declare-fun minValue!754 () V!24123)

(declare-datatypes ((tuple2!9496 0))(
  ( (tuple2!9497 (_1!4759 (_ BitVec 64)) (_2!4759 V!24123)) )
))
(declare-datatypes ((List!15322 0))(
  ( (Nil!15319) (Cons!15318 (h!16447 tuple2!9496) (t!21634 List!15322)) )
))
(declare-datatypes ((ListLongMap!8309 0))(
  ( (ListLongMap!8310 (toList!4170 List!15322)) )
))
(declare-fun lt!365161 () ListLongMap!8309)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2345 (array!44867 array!44869 (_ BitVec 32) (_ BitVec 32) V!24123 V!24123 (_ BitVec 32) Int) ListLongMap!8309)

(assert (=> b!815769 (= lt!365161 (getCurrentListMap!2345 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24123)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!365159 () ListLongMap!8309)

(declare-fun +!1833 (ListLongMap!8309 tuple2!9496) ListLongMap!8309)

(assert (=> b!815769 (= lt!365159 (+!1833 (getCurrentListMap!2345 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9497 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun mapIsEmpty!23098 () Bool)

(declare-fun mapRes!23098 () Bool)

(assert (=> mapIsEmpty!23098 mapRes!23098))

(declare-fun b!815770 () Bool)

(declare-fun res!557068 () Bool)

(assert (=> b!815770 (=> (not res!557068) (not e!452444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44867 (_ BitVec 32)) Bool)

(assert (=> b!815770 (= res!557068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815771 () Bool)

(declare-fun res!557067 () Bool)

(assert (=> b!815771 (=> (not res!557067) (not e!452444))))

(assert (=> b!815771 (= res!557067 (and (= (size!21914 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21913 _keys!976) (size!21914 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815772 () Bool)

(declare-fun res!557064 () Bool)

(assert (=> b!815772 (=> (not res!557064) (not e!452444))))

(declare-datatypes ((List!15323 0))(
  ( (Nil!15320) (Cons!15319 (h!16448 (_ BitVec 64)) (t!21635 List!15323)) )
))
(declare-fun arrayNoDuplicates!0 (array!44867 (_ BitVec 32) List!15323) Bool)

(assert (=> b!815772 (= res!557064 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15320))))

(declare-fun b!815773 () Bool)

(declare-fun e!452442 () Bool)

(assert (=> b!815773 (= e!452440 (and e!452442 mapRes!23098))))

(declare-fun condMapEmpty!23098 () Bool)

(declare-fun mapDefault!23098 () ValueCell!6755)

(assert (=> b!815773 (= condMapEmpty!23098 (= (arr!21493 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6755)) mapDefault!23098)))))

(declare-fun b!815774 () Bool)

(assert (=> b!815774 (= e!452444 (not e!452441))))

(declare-fun res!557065 () Bool)

(assert (=> b!815774 (=> res!557065 e!452441)))

(assert (=> b!815774 (= res!557065 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!365162 () ListLongMap!8309)

(declare-fun lt!365158 () ListLongMap!8309)

(assert (=> b!815774 (= lt!365162 lt!365158)))

(declare-datatypes ((Unit!27768 0))(
  ( (Unit!27769) )
))
(declare-fun lt!365160 () Unit!27768)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!325 (array!44867 array!44869 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24123 V!24123 V!24123 V!24123 (_ BitVec 32) Int) Unit!27768)

(assert (=> b!815774 (= lt!365160 (lemmaNoChangeToArrayThenSameMapNoExtras!325 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2232 (array!44867 array!44869 (_ BitVec 32) (_ BitVec 32) V!24123 V!24123 (_ BitVec 32) Int) ListLongMap!8309)

(assert (=> b!815774 (= lt!365158 (getCurrentListMapNoExtraKeys!2232 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815774 (= lt!365162 (getCurrentListMapNoExtraKeys!2232 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815775 () Bool)

(declare-fun e!452439 () Bool)

(assert (=> b!815775 (= e!452439 tp_is_empty!14341)))

(declare-fun b!815776 () Bool)

(assert (=> b!815776 (= e!452442 tp_is_empty!14341)))

(declare-fun mapNonEmpty!23098 () Bool)

(declare-fun tp!44614 () Bool)

(assert (=> mapNonEmpty!23098 (= mapRes!23098 (and tp!44614 e!452439))))

(declare-fun mapKey!23098 () (_ BitVec 32))

(declare-fun mapRest!23098 () (Array (_ BitVec 32) ValueCell!6755))

(declare-fun mapValue!23098 () ValueCell!6755)

(assert (=> mapNonEmpty!23098 (= (arr!21493 _values!788) (store mapRest!23098 mapKey!23098 mapValue!23098))))

(assert (= (and start!70218 res!557066) b!815771))

(assert (= (and b!815771 res!557067) b!815770))

(assert (= (and b!815770 res!557068) b!815772))

(assert (= (and b!815772 res!557064) b!815774))

(assert (= (and b!815774 (not res!557065)) b!815769))

(assert (= (and b!815773 condMapEmpty!23098) mapIsEmpty!23098))

(assert (= (and b!815773 (not condMapEmpty!23098)) mapNonEmpty!23098))

(get-info :version)

(assert (= (and mapNonEmpty!23098 ((_ is ValueCellFull!6755) mapValue!23098)) b!815775))

(assert (= (and b!815773 ((_ is ValueCellFull!6755) mapDefault!23098)) b!815776))

(assert (= start!70218 b!815773))

(declare-fun m!756909 () Bool)

(assert (=> start!70218 m!756909))

(declare-fun m!756911 () Bool)

(assert (=> start!70218 m!756911))

(declare-fun m!756913 () Bool)

(assert (=> start!70218 m!756913))

(declare-fun m!756915 () Bool)

(assert (=> b!815774 m!756915))

(declare-fun m!756917 () Bool)

(assert (=> b!815774 m!756917))

(declare-fun m!756919 () Bool)

(assert (=> b!815774 m!756919))

(declare-fun m!756921 () Bool)

(assert (=> b!815772 m!756921))

(declare-fun m!756923 () Bool)

(assert (=> mapNonEmpty!23098 m!756923))

(declare-fun m!756925 () Bool)

(assert (=> b!815769 m!756925))

(declare-fun m!756927 () Bool)

(assert (=> b!815769 m!756927))

(assert (=> b!815769 m!756927))

(declare-fun m!756929 () Bool)

(assert (=> b!815769 m!756929))

(declare-fun m!756931 () Bool)

(assert (=> b!815770 m!756931))

(check-sat (not b!815770) (not b_next!12631) (not start!70218) (not b!815769) (not b!815772) (not b!815774) b_and!21393 (not mapNonEmpty!23098) tp_is_empty!14341)
(check-sat b_and!21393 (not b_next!12631))
