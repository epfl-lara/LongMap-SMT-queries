; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70404 () Bool)

(assert start!70404)

(declare-fun b_free!12631 () Bool)

(declare-fun b_next!12631 () Bool)

(assert (=> start!70404 (= b_free!12631 (not b_next!12631))))

(declare-fun tp!44614 () Bool)

(declare-fun b_and!21429 () Bool)

(assert (=> start!70404 (= tp!44614 b_and!21429)))

(declare-fun b!816909 () Bool)

(declare-fun e!453167 () Bool)

(declare-fun tp_is_empty!14341 () Bool)

(assert (=> b!816909 (= e!453167 tp_is_empty!14341)))

(declare-fun mapIsEmpty!23098 () Bool)

(declare-fun mapRes!23098 () Bool)

(assert (=> mapIsEmpty!23098 mapRes!23098))

(declare-fun b!816911 () Bool)

(declare-fun e!453169 () Bool)

(declare-fun e!453168 () Bool)

(assert (=> b!816911 (= e!453169 (and e!453168 mapRes!23098))))

(declare-fun condMapEmpty!23098 () Bool)

(declare-datatypes ((V!24123 0))(
  ( (V!24124 (val!7218 Int)) )
))
(declare-datatypes ((ValueCell!6755 0))(
  ( (ValueCellFull!6755 (v!9645 V!24123)) (EmptyCell!6755) )
))
(declare-datatypes ((array!44883 0))(
  ( (array!44884 (arr!21495 (Array (_ BitVec 32) ValueCell!6755)) (size!21915 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44883)

(declare-fun mapDefault!23098 () ValueCell!6755)

(assert (=> b!816911 (= condMapEmpty!23098 (= (arr!21495 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6755)) mapDefault!23098)))))

(declare-fun mapNonEmpty!23098 () Bool)

(declare-fun tp!44613 () Bool)

(assert (=> mapNonEmpty!23098 (= mapRes!23098 (and tp!44613 e!453167))))

(declare-fun mapKey!23098 () (_ BitVec 32))

(declare-fun mapValue!23098 () ValueCell!6755)

(declare-fun mapRest!23098 () (Array (_ BitVec 32) ValueCell!6755))

(assert (=> mapNonEmpty!23098 (= (arr!21495 _values!788) (store mapRest!23098 mapKey!23098 mapValue!23098))))

(declare-fun b!816912 () Bool)

(assert (=> b!816912 (= e!453168 tp_is_empty!14341)))

(declare-fun b!816913 () Bool)

(declare-fun e!453170 () Bool)

(assert (=> b!816913 (= e!453170 true)))

(declare-datatypes ((array!44885 0))(
  ( (array!44886 (arr!21496 (Array (_ BitVec 32) (_ BitVec 64))) (size!21916 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44885)

(declare-datatypes ((tuple2!9392 0))(
  ( (tuple2!9393 (_1!4707 (_ BitVec 64)) (_2!4707 V!24123)) )
))
(declare-datatypes ((List!15204 0))(
  ( (Nil!15201) (Cons!15200 (h!16335 tuple2!9392) (t!21517 List!15204)) )
))
(declare-datatypes ((ListLongMap!8217 0))(
  ( (ListLongMap!8218 (toList!4124 List!15204)) )
))
(declare-fun lt!365755 () ListLongMap!8217)

(declare-fun zeroValueAfter!34 () V!24123)

(declare-fun minValue!754 () V!24123)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun getCurrentListMap!2343 (array!44885 array!44883 (_ BitVec 32) (_ BitVec 32) V!24123 V!24123 (_ BitVec 32) Int) ListLongMap!8217)

(assert (=> b!816913 (= lt!365755 (getCurrentListMap!2343 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24123)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!365759 () ListLongMap!8217)

(declare-fun +!1803 (ListLongMap!8217 tuple2!9392) ListLongMap!8217)

(assert (=> b!816913 (= lt!365759 (+!1803 (getCurrentListMap!2343 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!816914 () Bool)

(declare-fun e!453172 () Bool)

(assert (=> b!816914 (= e!453172 (not e!453170))))

(declare-fun res!557519 () Bool)

(assert (=> b!816914 (=> res!557519 e!453170)))

(assert (=> b!816914 (= res!557519 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!365757 () ListLongMap!8217)

(declare-fun lt!365758 () ListLongMap!8217)

(assert (=> b!816914 (= lt!365757 lt!365758)))

(declare-datatypes ((Unit!27809 0))(
  ( (Unit!27810) )
))
(declare-fun lt!365756 () Unit!27809)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!316 (array!44885 array!44883 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24123 V!24123 V!24123 V!24123 (_ BitVec 32) Int) Unit!27809)

(assert (=> b!816914 (= lt!365756 (lemmaNoChangeToArrayThenSameMapNoExtras!316 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2228 (array!44885 array!44883 (_ BitVec 32) (_ BitVec 32) V!24123 V!24123 (_ BitVec 32) Int) ListLongMap!8217)

(assert (=> b!816914 (= lt!365758 (getCurrentListMapNoExtraKeys!2228 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816914 (= lt!365757 (getCurrentListMapNoExtraKeys!2228 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!557518 () Bool)

(assert (=> start!70404 (=> (not res!557518) (not e!453172))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70404 (= res!557518 (validMask!0 mask!1312))))

(assert (=> start!70404 e!453172))

(assert (=> start!70404 tp_is_empty!14341))

(declare-fun array_inv!17239 (array!44885) Bool)

(assert (=> start!70404 (array_inv!17239 _keys!976)))

(assert (=> start!70404 true))

(declare-fun array_inv!17240 (array!44883) Bool)

(assert (=> start!70404 (and (array_inv!17240 _values!788) e!453169)))

(assert (=> start!70404 tp!44614))

(declare-fun b!816910 () Bool)

(declare-fun res!557516 () Bool)

(assert (=> b!816910 (=> (not res!557516) (not e!453172))))

(declare-datatypes ((List!15205 0))(
  ( (Nil!15202) (Cons!15201 (h!16336 (_ BitVec 64)) (t!21518 List!15205)) )
))
(declare-fun arrayNoDuplicates!0 (array!44885 (_ BitVec 32) List!15205) Bool)

(assert (=> b!816910 (= res!557516 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15202))))

(declare-fun b!816915 () Bool)

(declare-fun res!557517 () Bool)

(assert (=> b!816915 (=> (not res!557517) (not e!453172))))

(assert (=> b!816915 (= res!557517 (and (= (size!21915 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21916 _keys!976) (size!21915 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816916 () Bool)

(declare-fun res!557520 () Bool)

(assert (=> b!816916 (=> (not res!557520) (not e!453172))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44885 (_ BitVec 32)) Bool)

(assert (=> b!816916 (= res!557520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70404 res!557518) b!816915))

(assert (= (and b!816915 res!557517) b!816916))

(assert (= (and b!816916 res!557520) b!816910))

(assert (= (and b!816910 res!557516) b!816914))

(assert (= (and b!816914 (not res!557519)) b!816913))

(assert (= (and b!816911 condMapEmpty!23098) mapIsEmpty!23098))

(assert (= (and b!816911 (not condMapEmpty!23098)) mapNonEmpty!23098))

(get-info :version)

(assert (= (and mapNonEmpty!23098 ((_ is ValueCellFull!6755) mapValue!23098)) b!816909))

(assert (= (and b!816911 ((_ is ValueCellFull!6755) mapDefault!23098)) b!816912))

(assert (= start!70404 b!816911))

(declare-fun m!758943 () Bool)

(assert (=> b!816913 m!758943))

(declare-fun m!758945 () Bool)

(assert (=> b!816913 m!758945))

(assert (=> b!816913 m!758945))

(declare-fun m!758947 () Bool)

(assert (=> b!816913 m!758947))

(declare-fun m!758949 () Bool)

(assert (=> b!816910 m!758949))

(declare-fun m!758951 () Bool)

(assert (=> start!70404 m!758951))

(declare-fun m!758953 () Bool)

(assert (=> start!70404 m!758953))

(declare-fun m!758955 () Bool)

(assert (=> start!70404 m!758955))

(declare-fun m!758957 () Bool)

(assert (=> b!816916 m!758957))

(declare-fun m!758959 () Bool)

(assert (=> mapNonEmpty!23098 m!758959))

(declare-fun m!758961 () Bool)

(assert (=> b!816914 m!758961))

(declare-fun m!758963 () Bool)

(assert (=> b!816914 m!758963))

(declare-fun m!758965 () Bool)

(assert (=> b!816914 m!758965))

(check-sat tp_is_empty!14341 (not start!70404) b_and!21429 (not b!816913) (not b!816916) (not b_next!12631) (not b!816914) (not b!816910) (not mapNonEmpty!23098))
(check-sat b_and!21429 (not b_next!12631))
