; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70210 () Bool)

(assert start!70210)

(declare-fun b_free!12603 () Bool)

(declare-fun b_next!12603 () Bool)

(assert (=> start!70210 (= b_free!12603 (not b_next!12603))))

(declare-fun tp!44530 () Bool)

(declare-fun b_and!21391 () Bool)

(assert (=> start!70210 (= tp!44530 b_and!21391)))

(declare-fun b!815679 () Bool)

(declare-fun res!556964 () Bool)

(declare-fun e!452337 () Bool)

(assert (=> b!815679 (=> (not res!556964) (not e!452337))))

(declare-datatypes ((array!44826 0))(
  ( (array!44827 (arr!21471 (Array (_ BitVec 32) (_ BitVec 64))) (size!21892 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44826)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44826 (_ BitVec 32)) Bool)

(assert (=> b!815679 (= res!556964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815680 () Bool)

(declare-fun e!452341 () Bool)

(declare-fun tp_is_empty!14313 () Bool)

(assert (=> b!815680 (= e!452341 tp_is_empty!14313)))

(declare-fun mapIsEmpty!23056 () Bool)

(declare-fun mapRes!23056 () Bool)

(assert (=> mapIsEmpty!23056 mapRes!23056))

(declare-fun res!556960 () Bool)

(assert (=> start!70210 (=> (not res!556960) (not e!452337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70210 (= res!556960 (validMask!0 mask!1312))))

(assert (=> start!70210 e!452337))

(assert (=> start!70210 tp_is_empty!14313))

(declare-fun array_inv!17181 (array!44826) Bool)

(assert (=> start!70210 (array_inv!17181 _keys!976)))

(assert (=> start!70210 true))

(declare-datatypes ((V!24085 0))(
  ( (V!24086 (val!7204 Int)) )
))
(declare-datatypes ((ValueCell!6741 0))(
  ( (ValueCellFull!6741 (v!9631 V!24085)) (EmptyCell!6741) )
))
(declare-datatypes ((array!44828 0))(
  ( (array!44829 (arr!21472 (Array (_ BitVec 32) ValueCell!6741)) (size!21893 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44828)

(declare-fun e!452338 () Bool)

(declare-fun array_inv!17182 (array!44828) Bool)

(assert (=> start!70210 (and (array_inv!17182 _values!788) e!452338)))

(assert (=> start!70210 tp!44530))

(declare-fun b!815681 () Bool)

(declare-fun res!556963 () Bool)

(assert (=> b!815681 (=> (not res!556963) (not e!452337))))

(declare-datatypes ((List!15281 0))(
  ( (Nil!15278) (Cons!15277 (h!16406 (_ BitVec 64)) (t!21602 List!15281)) )
))
(declare-fun arrayNoDuplicates!0 (array!44826 (_ BitVec 32) List!15281) Bool)

(assert (=> b!815681 (= res!556963 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15278))))

(declare-fun b!815682 () Bool)

(declare-fun e!452339 () Bool)

(assert (=> b!815682 (= e!452339 true)))

(declare-datatypes ((tuple2!9450 0))(
  ( (tuple2!9451 (_1!4736 (_ BitVec 64)) (_2!4736 V!24085)) )
))
(declare-datatypes ((List!15282 0))(
  ( (Nil!15279) (Cons!15278 (h!16407 tuple2!9450) (t!21603 List!15282)) )
))
(declare-datatypes ((ListLongMap!8273 0))(
  ( (ListLongMap!8274 (toList!4152 List!15282)) )
))
(declare-fun lt!365191 () ListLongMap!8273)

(declare-fun zeroValueAfter!34 () V!24085)

(declare-fun minValue!754 () V!24085)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2381 (array!44826 array!44828 (_ BitVec 32) (_ BitVec 32) V!24085 V!24085 (_ BitVec 32) Int) ListLongMap!8273)

(assert (=> b!815682 (= lt!365191 (getCurrentListMap!2381 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24085)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!365193 () ListLongMap!8273)

(declare-fun +!1787 (ListLongMap!8273 tuple2!9450) ListLongMap!8273)

(assert (=> b!815682 (= lt!365193 (+!1787 (getCurrentListMap!2381 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9451 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun mapNonEmpty!23056 () Bool)

(declare-fun tp!44529 () Bool)

(assert (=> mapNonEmpty!23056 (= mapRes!23056 (and tp!44529 e!452341))))

(declare-fun mapValue!23056 () ValueCell!6741)

(declare-fun mapRest!23056 () (Array (_ BitVec 32) ValueCell!6741))

(declare-fun mapKey!23056 () (_ BitVec 32))

(assert (=> mapNonEmpty!23056 (= (arr!21472 _values!788) (store mapRest!23056 mapKey!23056 mapValue!23056))))

(declare-fun b!815683 () Bool)

(assert (=> b!815683 (= e!452337 (not e!452339))))

(declare-fun res!556962 () Bool)

(assert (=> b!815683 (=> res!556962 e!452339)))

(assert (=> b!815683 (= res!556962 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!365192 () ListLongMap!8273)

(declare-fun lt!365194 () ListLongMap!8273)

(assert (=> b!815683 (= lt!365192 lt!365194)))

(declare-datatypes ((Unit!27800 0))(
  ( (Unit!27801) )
))
(declare-fun lt!365195 () Unit!27800)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!311 (array!44826 array!44828 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24085 V!24085 V!24085 V!24085 (_ BitVec 32) Int) Unit!27800)

(assert (=> b!815683 (= lt!365195 (lemmaNoChangeToArrayThenSameMapNoExtras!311 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2201 (array!44826 array!44828 (_ BitVec 32) (_ BitVec 32) V!24085 V!24085 (_ BitVec 32) Int) ListLongMap!8273)

(assert (=> b!815683 (= lt!365194 (getCurrentListMapNoExtraKeys!2201 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815683 (= lt!365192 (getCurrentListMapNoExtraKeys!2201 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815684 () Bool)

(declare-fun e!452340 () Bool)

(assert (=> b!815684 (= e!452338 (and e!452340 mapRes!23056))))

(declare-fun condMapEmpty!23056 () Bool)

(declare-fun mapDefault!23056 () ValueCell!6741)

(assert (=> b!815684 (= condMapEmpty!23056 (= (arr!21472 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6741)) mapDefault!23056)))))

(declare-fun b!815685 () Bool)

(assert (=> b!815685 (= e!452340 tp_is_empty!14313)))

(declare-fun b!815686 () Bool)

(declare-fun res!556961 () Bool)

(assert (=> b!815686 (=> (not res!556961) (not e!452337))))

(assert (=> b!815686 (= res!556961 (and (= (size!21893 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21892 _keys!976) (size!21893 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70210 res!556960) b!815686))

(assert (= (and b!815686 res!556961) b!815679))

(assert (= (and b!815679 res!556964) b!815681))

(assert (= (and b!815681 res!556963) b!815683))

(assert (= (and b!815683 (not res!556962)) b!815682))

(assert (= (and b!815684 condMapEmpty!23056) mapIsEmpty!23056))

(assert (= (and b!815684 (not condMapEmpty!23056)) mapNonEmpty!23056))

(get-info :version)

(assert (= (and mapNonEmpty!23056 ((_ is ValueCellFull!6741) mapValue!23056)) b!815680))

(assert (= (and b!815684 ((_ is ValueCellFull!6741) mapDefault!23056)) b!815685))

(assert (= start!70210 b!815684))

(declare-fun m!757325 () Bool)

(assert (=> b!815682 m!757325))

(declare-fun m!757327 () Bool)

(assert (=> b!815682 m!757327))

(assert (=> b!815682 m!757327))

(declare-fun m!757329 () Bool)

(assert (=> b!815682 m!757329))

(declare-fun m!757331 () Bool)

(assert (=> start!70210 m!757331))

(declare-fun m!757333 () Bool)

(assert (=> start!70210 m!757333))

(declare-fun m!757335 () Bool)

(assert (=> start!70210 m!757335))

(declare-fun m!757337 () Bool)

(assert (=> b!815679 m!757337))

(declare-fun m!757339 () Bool)

(assert (=> mapNonEmpty!23056 m!757339))

(declare-fun m!757341 () Bool)

(assert (=> b!815683 m!757341))

(declare-fun m!757343 () Bool)

(assert (=> b!815683 m!757343))

(declare-fun m!757345 () Bool)

(assert (=> b!815683 m!757345))

(declare-fun m!757347 () Bool)

(assert (=> b!815681 m!757347))

(check-sat (not b!815681) (not b!815679) (not b_next!12603) (not b!815683) (not start!70210) (not mapNonEmpty!23056) tp_is_empty!14313 (not b!815682) b_and!21391)
(check-sat b_and!21391 (not b_next!12603))
