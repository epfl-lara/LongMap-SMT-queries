; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70208 () Bool)

(assert start!70208)

(declare-fun b_free!12463 () Bool)

(declare-fun b_next!12463 () Bool)

(assert (=> start!70208 (= b_free!12463 (not b_next!12463))))

(declare-fun tp!44104 () Bool)

(declare-fun b_and!21245 () Bool)

(assert (=> start!70208 (= tp!44104 b_and!21245)))

(declare-fun b!814910 () Bool)

(declare-fun e!451733 () Bool)

(assert (=> b!814910 (= e!451733 false)))

(declare-datatypes ((array!44551 0))(
  ( (array!44552 (arr!21331 (Array (_ BitVec 32) (_ BitVec 64))) (size!21751 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44551)

(declare-datatypes ((V!23899 0))(
  ( (V!23900 (val!7134 Int)) )
))
(declare-fun zeroValueAfter!34 () V!23899)

(declare-fun minValue!754 () V!23899)

(declare-datatypes ((ValueCell!6671 0))(
  ( (ValueCellFull!6671 (v!9561 V!23899)) (EmptyCell!6671) )
))
(declare-datatypes ((array!44553 0))(
  ( (array!44554 (arr!21332 (Array (_ BitVec 32) ValueCell!6671)) (size!21752 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44553)

(declare-datatypes ((tuple2!9262 0))(
  ( (tuple2!9263 (_1!4642 (_ BitVec 64)) (_2!4642 V!23899)) )
))
(declare-datatypes ((List!15081 0))(
  ( (Nil!15078) (Cons!15077 (h!16212 tuple2!9262) (t!21390 List!15081)) )
))
(declare-datatypes ((ListLongMap!8087 0))(
  ( (ListLongMap!8088 (toList!4059 List!15081)) )
))
(declare-fun lt!364815 () ListLongMap!8087)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2166 (array!44551 array!44553 (_ BitVec 32) (_ BitVec 32) V!23899 V!23899 (_ BitVec 32) Int) ListLongMap!8087)

(assert (=> b!814910 (= lt!364815 (getCurrentListMapNoExtraKeys!2166 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23899)

(declare-fun lt!364814 () ListLongMap!8087)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!814910 (= lt!364814 (getCurrentListMapNoExtraKeys!2166 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814911 () Bool)

(declare-fun e!451734 () Bool)

(declare-fun tp_is_empty!14173 () Bool)

(assert (=> b!814911 (= e!451734 tp_is_empty!14173)))

(declare-fun b!814913 () Bool)

(declare-fun res!556384 () Bool)

(assert (=> b!814913 (=> (not res!556384) (not e!451733))))

(declare-datatypes ((List!15082 0))(
  ( (Nil!15079) (Cons!15078 (h!16213 (_ BitVec 64)) (t!21391 List!15082)) )
))
(declare-fun arrayNoDuplicates!0 (array!44551 (_ BitVec 32) List!15082) Bool)

(assert (=> b!814913 (= res!556384 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15079))))

(declare-fun b!814914 () Bool)

(declare-fun res!556383 () Bool)

(assert (=> b!814914 (=> (not res!556383) (not e!451733))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44551 (_ BitVec 32)) Bool)

(assert (=> b!814914 (= res!556383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814915 () Bool)

(declare-fun e!451736 () Bool)

(assert (=> b!814915 (= e!451736 tp_is_empty!14173)))

(declare-fun b!814916 () Bool)

(declare-fun e!451732 () Bool)

(declare-fun mapRes!22840 () Bool)

(assert (=> b!814916 (= e!451732 (and e!451736 mapRes!22840))))

(declare-fun condMapEmpty!22840 () Bool)

(declare-fun mapDefault!22840 () ValueCell!6671)

(assert (=> b!814916 (= condMapEmpty!22840 (= (arr!21332 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6671)) mapDefault!22840)))))

(declare-fun mapIsEmpty!22840 () Bool)

(assert (=> mapIsEmpty!22840 mapRes!22840))

(declare-fun mapNonEmpty!22840 () Bool)

(declare-fun tp!44103 () Bool)

(assert (=> mapNonEmpty!22840 (= mapRes!22840 (and tp!44103 e!451734))))

(declare-fun mapValue!22840 () ValueCell!6671)

(declare-fun mapKey!22840 () (_ BitVec 32))

(declare-fun mapRest!22840 () (Array (_ BitVec 32) ValueCell!6671))

(assert (=> mapNonEmpty!22840 (= (arr!21332 _values!788) (store mapRest!22840 mapKey!22840 mapValue!22840))))

(declare-fun res!556381 () Bool)

(assert (=> start!70208 (=> (not res!556381) (not e!451733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70208 (= res!556381 (validMask!0 mask!1312))))

(assert (=> start!70208 e!451733))

(assert (=> start!70208 tp_is_empty!14173))

(declare-fun array_inv!17129 (array!44551) Bool)

(assert (=> start!70208 (array_inv!17129 _keys!976)))

(assert (=> start!70208 true))

(declare-fun array_inv!17130 (array!44553) Bool)

(assert (=> start!70208 (and (array_inv!17130 _values!788) e!451732)))

(assert (=> start!70208 tp!44104))

(declare-fun b!814912 () Bool)

(declare-fun res!556382 () Bool)

(assert (=> b!814912 (=> (not res!556382) (not e!451733))))

(assert (=> b!814912 (= res!556382 (and (= (size!21752 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21751 _keys!976) (size!21752 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70208 res!556381) b!814912))

(assert (= (and b!814912 res!556382) b!814914))

(assert (= (and b!814914 res!556383) b!814913))

(assert (= (and b!814913 res!556384) b!814910))

(assert (= (and b!814916 condMapEmpty!22840) mapIsEmpty!22840))

(assert (= (and b!814916 (not condMapEmpty!22840)) mapNonEmpty!22840))

(get-info :version)

(assert (= (and mapNonEmpty!22840 ((_ is ValueCellFull!6671) mapValue!22840)) b!814911))

(assert (= (and b!814916 ((_ is ValueCellFull!6671) mapDefault!22840)) b!814915))

(assert (= start!70208 b!814916))

(declare-fun m!757191 () Bool)

(assert (=> b!814913 m!757191))

(declare-fun m!757193 () Bool)

(assert (=> b!814910 m!757193))

(declare-fun m!757195 () Bool)

(assert (=> b!814910 m!757195))

(declare-fun m!757197 () Bool)

(assert (=> mapNonEmpty!22840 m!757197))

(declare-fun m!757199 () Bool)

(assert (=> b!814914 m!757199))

(declare-fun m!757201 () Bool)

(assert (=> start!70208 m!757201))

(declare-fun m!757203 () Bool)

(assert (=> start!70208 m!757203))

(declare-fun m!757205 () Bool)

(assert (=> start!70208 m!757205))

(check-sat (not start!70208) tp_is_empty!14173 (not mapNonEmpty!22840) (not b_next!12463) (not b!814913) b_and!21245 (not b!814910) (not b!814914))
(check-sat b_and!21245 (not b_next!12463))
