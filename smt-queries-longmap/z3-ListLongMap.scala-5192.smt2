; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70154 () Bool)

(assert start!70154)

(declare-fun b_free!12561 () Bool)

(declare-fun b_next!12561 () Bool)

(assert (=> start!70154 (= b_free!12561 (not b_next!12561))))

(declare-fun tp!44400 () Bool)

(declare-fun b_and!21341 () Bool)

(assert (=> start!70154 (= tp!44400 b_and!21341)))

(declare-fun mapNonEmpty!22990 () Bool)

(declare-fun mapRes!22990 () Bool)

(declare-fun tp!44401 () Bool)

(declare-fun e!451945 () Bool)

(assert (=> mapNonEmpty!22990 (= mapRes!22990 (and tp!44401 e!451945))))

(declare-datatypes ((V!24029 0))(
  ( (V!24030 (val!7183 Int)) )
))
(declare-datatypes ((ValueCell!6720 0))(
  ( (ValueCellFull!6720 (v!9610 V!24029)) (EmptyCell!6720) )
))
(declare-fun mapValue!22990 () ValueCell!6720)

(declare-datatypes ((array!44746 0))(
  ( (array!44747 (arr!21432 (Array (_ BitVec 32) ValueCell!6720)) (size!21853 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44746)

(declare-fun mapKey!22990 () (_ BitVec 32))

(declare-fun mapRest!22990 () (Array (_ BitVec 32) ValueCell!6720))

(assert (=> mapNonEmpty!22990 (= (arr!21432 _values!788) (store mapRest!22990 mapKey!22990 mapValue!22990))))

(declare-fun mapIsEmpty!22990 () Bool)

(assert (=> mapIsEmpty!22990 mapRes!22990))

(declare-fun b!815131 () Bool)

(declare-fun e!451947 () Bool)

(declare-fun tp_is_empty!14271 () Bool)

(assert (=> b!815131 (= e!451947 tp_is_empty!14271)))

(declare-fun b!815132 () Bool)

(assert (=> b!815132 (= e!451945 tp_is_empty!14271)))

(declare-fun b!815133 () Bool)

(declare-fun res!556657 () Bool)

(declare-fun e!451948 () Bool)

(assert (=> b!815133 (=> (not res!556657) (not e!451948))))

(declare-datatypes ((array!44748 0))(
  ( (array!44749 (arr!21433 (Array (_ BitVec 32) (_ BitVec 64))) (size!21854 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44748)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!815133 (= res!556657 (and (= (size!21853 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21854 _keys!976) (size!21853 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815134 () Bool)

(assert (=> b!815134 (= e!451948 (not true))))

(declare-datatypes ((tuple2!9420 0))(
  ( (tuple2!9421 (_1!4721 (_ BitVec 64)) (_2!4721 V!24029)) )
))
(declare-datatypes ((List!15251 0))(
  ( (Nil!15248) (Cons!15247 (h!16376 tuple2!9420) (t!21570 List!15251)) )
))
(declare-datatypes ((ListLongMap!8243 0))(
  ( (ListLongMap!8244 (toList!4137 List!15251)) )
))
(declare-fun lt!364918 () ListLongMap!8243)

(declare-fun lt!364917 () ListLongMap!8243)

(assert (=> b!815134 (= lt!364918 lt!364917)))

(declare-fun zeroValueBefore!34 () V!24029)

(declare-fun zeroValueAfter!34 () V!24029)

(declare-fun minValue!754 () V!24029)

(declare-datatypes ((Unit!27772 0))(
  ( (Unit!27773) )
))
(declare-fun lt!364916 () Unit!27772)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!297 (array!44748 array!44746 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24029 V!24029 V!24029 V!24029 (_ BitVec 32) Int) Unit!27772)

(assert (=> b!815134 (= lt!364916 (lemmaNoChangeToArrayThenSameMapNoExtras!297 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2187 (array!44748 array!44746 (_ BitVec 32) (_ BitVec 32) V!24029 V!24029 (_ BitVec 32) Int) ListLongMap!8243)

(assert (=> b!815134 (= lt!364917 (getCurrentListMapNoExtraKeys!2187 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815134 (= lt!364918 (getCurrentListMapNoExtraKeys!2187 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815135 () Bool)

(declare-fun res!556656 () Bool)

(assert (=> b!815135 (=> (not res!556656) (not e!451948))))

(declare-datatypes ((List!15252 0))(
  ( (Nil!15249) (Cons!15248 (h!16377 (_ BitVec 64)) (t!21571 List!15252)) )
))
(declare-fun arrayNoDuplicates!0 (array!44748 (_ BitVec 32) List!15252) Bool)

(assert (=> b!815135 (= res!556656 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15249))))

(declare-fun b!815136 () Bool)

(declare-fun res!556655 () Bool)

(assert (=> b!815136 (=> (not res!556655) (not e!451948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44748 (_ BitVec 32)) Bool)

(assert (=> b!815136 (= res!556655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!556654 () Bool)

(assert (=> start!70154 (=> (not res!556654) (not e!451948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70154 (= res!556654 (validMask!0 mask!1312))))

(assert (=> start!70154 e!451948))

(assert (=> start!70154 tp_is_empty!14271))

(declare-fun array_inv!17149 (array!44748) Bool)

(assert (=> start!70154 (array_inv!17149 _keys!976)))

(assert (=> start!70154 true))

(declare-fun e!451946 () Bool)

(declare-fun array_inv!17150 (array!44746) Bool)

(assert (=> start!70154 (and (array_inv!17150 _values!788) e!451946)))

(assert (=> start!70154 tp!44400))

(declare-fun b!815130 () Bool)

(assert (=> b!815130 (= e!451946 (and e!451947 mapRes!22990))))

(declare-fun condMapEmpty!22990 () Bool)

(declare-fun mapDefault!22990 () ValueCell!6720)

(assert (=> b!815130 (= condMapEmpty!22990 (= (arr!21432 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6720)) mapDefault!22990)))))

(assert (= (and start!70154 res!556654) b!815133))

(assert (= (and b!815133 res!556657) b!815136))

(assert (= (and b!815136 res!556655) b!815135))

(assert (= (and b!815135 res!556656) b!815134))

(assert (= (and b!815130 condMapEmpty!22990) mapIsEmpty!22990))

(assert (= (and b!815130 (not condMapEmpty!22990)) mapNonEmpty!22990))

(get-info :version)

(assert (= (and mapNonEmpty!22990 ((_ is ValueCellFull!6720) mapValue!22990)) b!815132))

(assert (= (and b!815130 ((_ is ValueCellFull!6720) mapDefault!22990)) b!815131))

(assert (= start!70154 b!815130))

(declare-fun m!756839 () Bool)

(assert (=> b!815134 m!756839))

(declare-fun m!756841 () Bool)

(assert (=> b!815134 m!756841))

(declare-fun m!756843 () Bool)

(assert (=> b!815134 m!756843))

(declare-fun m!756845 () Bool)

(assert (=> b!815135 m!756845))

(declare-fun m!756847 () Bool)

(assert (=> start!70154 m!756847))

(declare-fun m!756849 () Bool)

(assert (=> start!70154 m!756849))

(declare-fun m!756851 () Bool)

(assert (=> start!70154 m!756851))

(declare-fun m!756853 () Bool)

(assert (=> b!815136 m!756853))

(declare-fun m!756855 () Bool)

(assert (=> mapNonEmpty!22990 m!756855))

(check-sat (not mapNonEmpty!22990) tp_is_empty!14271 (not start!70154) (not b!815136) (not b!815134) b_and!21341 (not b!815135) (not b_next!12561))
(check-sat b_and!21341 (not b_next!12561))
