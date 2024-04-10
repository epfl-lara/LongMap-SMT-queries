; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70160 () Bool)

(assert start!70160)

(declare-fun b_free!12567 () Bool)

(declare-fun b_next!12567 () Bool)

(assert (=> start!70160 (= b_free!12567 (not b_next!12567))))

(declare-fun tp!44419 () Bool)

(declare-fun b_and!21347 () Bool)

(assert (=> start!70160 (= tp!44419 b_and!21347)))

(declare-fun mapIsEmpty!22999 () Bool)

(declare-fun mapRes!22999 () Bool)

(assert (=> mapIsEmpty!22999 mapRes!22999))

(declare-fun b!815193 () Bool)

(declare-fun e!451992 () Bool)

(declare-fun e!451991 () Bool)

(assert (=> b!815193 (= e!451992 (and e!451991 mapRes!22999))))

(declare-fun condMapEmpty!22999 () Bool)

(declare-datatypes ((V!24037 0))(
  ( (V!24038 (val!7186 Int)) )
))
(declare-datatypes ((ValueCell!6723 0))(
  ( (ValueCellFull!6723 (v!9613 V!24037)) (EmptyCell!6723) )
))
(declare-datatypes ((array!44758 0))(
  ( (array!44759 (arr!21438 (Array (_ BitVec 32) ValueCell!6723)) (size!21859 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44758)

(declare-fun mapDefault!22999 () ValueCell!6723)

(assert (=> b!815193 (= condMapEmpty!22999 (= (arr!21438 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6723)) mapDefault!22999)))))

(declare-fun b!815194 () Bool)

(declare-fun e!451993 () Bool)

(declare-fun tp_is_empty!14277 () Bool)

(assert (=> b!815194 (= e!451993 tp_is_empty!14277)))

(declare-fun res!556692 () Bool)

(declare-fun e!451989 () Bool)

(assert (=> start!70160 (=> (not res!556692) (not e!451989))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70160 (= res!556692 (validMask!0 mask!1312))))

(assert (=> start!70160 e!451989))

(assert (=> start!70160 tp_is_empty!14277))

(declare-datatypes ((array!44760 0))(
  ( (array!44761 (arr!21439 (Array (_ BitVec 32) (_ BitVec 64))) (size!21860 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44760)

(declare-fun array_inv!17153 (array!44760) Bool)

(assert (=> start!70160 (array_inv!17153 _keys!976)))

(assert (=> start!70160 true))

(declare-fun array_inv!17154 (array!44758) Bool)

(assert (=> start!70160 (and (array_inv!17154 _values!788) e!451992)))

(assert (=> start!70160 tp!44419))

(declare-fun b!815195 () Bool)

(declare-fun res!556690 () Bool)

(assert (=> b!815195 (=> (not res!556690) (not e!451989))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!815195 (= res!556690 (and (= (size!21859 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21860 _keys!976) (size!21859 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815196 () Bool)

(declare-fun res!556693 () Bool)

(assert (=> b!815196 (=> (not res!556693) (not e!451989))))

(declare-datatypes ((List!15255 0))(
  ( (Nil!15252) (Cons!15251 (h!16380 (_ BitVec 64)) (t!21574 List!15255)) )
))
(declare-fun arrayNoDuplicates!0 (array!44760 (_ BitVec 32) List!15255) Bool)

(assert (=> b!815196 (= res!556693 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15252))))

(declare-fun mapNonEmpty!22999 () Bool)

(declare-fun tp!44418 () Bool)

(assert (=> mapNonEmpty!22999 (= mapRes!22999 (and tp!44418 e!451993))))

(declare-fun mapRest!22999 () (Array (_ BitVec 32) ValueCell!6723))

(declare-fun mapKey!22999 () (_ BitVec 32))

(declare-fun mapValue!22999 () ValueCell!6723)

(assert (=> mapNonEmpty!22999 (= (arr!21438 _values!788) (store mapRest!22999 mapKey!22999 mapValue!22999))))

(declare-fun b!815197 () Bool)

(declare-fun res!556691 () Bool)

(assert (=> b!815197 (=> (not res!556691) (not e!451989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44760 (_ BitVec 32)) Bool)

(assert (=> b!815197 (= res!556691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815198 () Bool)

(assert (=> b!815198 (= e!451991 tp_is_empty!14277)))

(declare-fun b!815199 () Bool)

(assert (=> b!815199 (= e!451989 (not true))))

(declare-datatypes ((tuple2!9424 0))(
  ( (tuple2!9425 (_1!4723 (_ BitVec 64)) (_2!4723 V!24037)) )
))
(declare-datatypes ((List!15256 0))(
  ( (Nil!15253) (Cons!15252 (h!16381 tuple2!9424) (t!21575 List!15256)) )
))
(declare-datatypes ((ListLongMap!8247 0))(
  ( (ListLongMap!8248 (toList!4139 List!15256)) )
))
(declare-fun lt!364943 () ListLongMap!8247)

(declare-fun lt!364945 () ListLongMap!8247)

(assert (=> b!815199 (= lt!364943 lt!364945)))

(declare-fun zeroValueBefore!34 () V!24037)

(declare-datatypes ((Unit!27776 0))(
  ( (Unit!27777) )
))
(declare-fun lt!364944 () Unit!27776)

(declare-fun zeroValueAfter!34 () V!24037)

(declare-fun minValue!754 () V!24037)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!299 (array!44760 array!44758 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24037 V!24037 V!24037 V!24037 (_ BitVec 32) Int) Unit!27776)

(assert (=> b!815199 (= lt!364944 (lemmaNoChangeToArrayThenSameMapNoExtras!299 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2189 (array!44760 array!44758 (_ BitVec 32) (_ BitVec 32) V!24037 V!24037 (_ BitVec 32) Int) ListLongMap!8247)

(assert (=> b!815199 (= lt!364945 (getCurrentListMapNoExtraKeys!2189 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815199 (= lt!364943 (getCurrentListMapNoExtraKeys!2189 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70160 res!556692) b!815195))

(assert (= (and b!815195 res!556690) b!815197))

(assert (= (and b!815197 res!556691) b!815196))

(assert (= (and b!815196 res!556693) b!815199))

(assert (= (and b!815193 condMapEmpty!22999) mapIsEmpty!22999))

(assert (= (and b!815193 (not condMapEmpty!22999)) mapNonEmpty!22999))

(get-info :version)

(assert (= (and mapNonEmpty!22999 ((_ is ValueCellFull!6723) mapValue!22999)) b!815194))

(assert (= (and b!815193 ((_ is ValueCellFull!6723) mapDefault!22999)) b!815198))

(assert (= start!70160 b!815193))

(declare-fun m!756893 () Bool)

(assert (=> b!815196 m!756893))

(declare-fun m!756895 () Bool)

(assert (=> mapNonEmpty!22999 m!756895))

(declare-fun m!756897 () Bool)

(assert (=> b!815199 m!756897))

(declare-fun m!756899 () Bool)

(assert (=> b!815199 m!756899))

(declare-fun m!756901 () Bool)

(assert (=> b!815199 m!756901))

(declare-fun m!756903 () Bool)

(assert (=> start!70160 m!756903))

(declare-fun m!756905 () Bool)

(assert (=> start!70160 m!756905))

(declare-fun m!756907 () Bool)

(assert (=> start!70160 m!756907))

(declare-fun m!756909 () Bool)

(assert (=> b!815197 m!756909))

(check-sat (not b!815196) (not start!70160) (not b!815197) (not mapNonEmpty!22999) b_and!21347 tp_is_empty!14277 (not b_next!12567) (not b!815199))
(check-sat b_and!21347 (not b_next!12567))
