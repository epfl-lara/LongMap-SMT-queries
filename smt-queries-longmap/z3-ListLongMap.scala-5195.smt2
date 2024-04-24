; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70336 () Bool)

(assert start!70336)

(declare-fun b_free!12577 () Bool)

(declare-fun b_next!12577 () Bool)

(assert (=> start!70336 (= b_free!12577 (not b_next!12577))))

(declare-fun tp!44449 () Bool)

(declare-fun b_and!21367 () Bool)

(assert (=> start!70336 (= tp!44449 b_and!21367)))

(declare-fun b!816192 () Bool)

(declare-fun res!557097 () Bool)

(declare-fun e!452642 () Bool)

(assert (=> b!816192 (=> (not res!557097) (not e!452642))))

(declare-datatypes ((array!44773 0))(
  ( (array!44774 (arr!21441 (Array (_ BitVec 32) (_ BitVec 64))) (size!21861 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44773)

(declare-datatypes ((List!15166 0))(
  ( (Nil!15163) (Cons!15162 (h!16297 (_ BitVec 64)) (t!21477 List!15166)) )
))
(declare-fun arrayNoDuplicates!0 (array!44773 (_ BitVec 32) List!15166) Bool)

(assert (=> b!816192 (= res!557097 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15163))))

(declare-fun b!816193 () Bool)

(declare-fun e!452643 () Bool)

(declare-fun tp_is_empty!14287 () Bool)

(assert (=> b!816193 (= e!452643 tp_is_empty!14287)))

(declare-fun mapIsEmpty!23014 () Bool)

(declare-fun mapRes!23014 () Bool)

(assert (=> mapIsEmpty!23014 mapRes!23014))

(declare-fun res!557099 () Bool)

(assert (=> start!70336 (=> (not res!557099) (not e!452642))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70336 (= res!557099 (validMask!0 mask!1312))))

(assert (=> start!70336 e!452642))

(assert (=> start!70336 tp_is_empty!14287))

(declare-fun array_inv!17197 (array!44773) Bool)

(assert (=> start!70336 (array_inv!17197 _keys!976)))

(assert (=> start!70336 true))

(declare-datatypes ((V!24051 0))(
  ( (V!24052 (val!7191 Int)) )
))
(declare-datatypes ((ValueCell!6728 0))(
  ( (ValueCellFull!6728 (v!9618 V!24051)) (EmptyCell!6728) )
))
(declare-datatypes ((array!44775 0))(
  ( (array!44776 (arr!21442 (Array (_ BitVec 32) ValueCell!6728)) (size!21862 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44775)

(declare-fun e!452644 () Bool)

(declare-fun array_inv!17198 (array!44775) Bool)

(assert (=> start!70336 (and (array_inv!17198 _values!788) e!452644)))

(assert (=> start!70336 tp!44449))

(declare-fun b!816194 () Bool)

(declare-fun e!452646 () Bool)

(assert (=> b!816194 (= e!452646 tp_is_empty!14287)))

(declare-fun mapNonEmpty!23014 () Bool)

(declare-fun tp!44448 () Bool)

(assert (=> mapNonEmpty!23014 (= mapRes!23014 (and tp!44448 e!452646))))

(declare-fun mapRest!23014 () (Array (_ BitVec 32) ValueCell!6728))

(declare-fun mapValue!23014 () ValueCell!6728)

(declare-fun mapKey!23014 () (_ BitVec 32))

(assert (=> mapNonEmpty!23014 (= (arr!21442 _values!788) (store mapRest!23014 mapKey!23014 mapValue!23014))))

(declare-fun b!816195 () Bool)

(declare-fun res!557096 () Bool)

(assert (=> b!816195 (=> (not res!557096) (not e!452642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44773 (_ BitVec 32)) Bool)

(assert (=> b!816195 (= res!557096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816196 () Bool)

(assert (=> b!816196 (= e!452642 (not true))))

(declare-datatypes ((tuple2!9352 0))(
  ( (tuple2!9353 (_1!4687 (_ BitVec 64)) (_2!4687 V!24051)) )
))
(declare-datatypes ((List!15167 0))(
  ( (Nil!15164) (Cons!15163 (h!16298 tuple2!9352) (t!21478 List!15167)) )
))
(declare-datatypes ((ListLongMap!8177 0))(
  ( (ListLongMap!8178 (toList!4104 List!15167)) )
))
(declare-fun lt!365342 () ListLongMap!8177)

(declare-fun lt!365344 () ListLongMap!8177)

(assert (=> b!816196 (= lt!365342 lt!365344)))

(declare-fun zeroValueBefore!34 () V!24051)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24051)

(declare-fun minValue!754 () V!24051)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27775 0))(
  ( (Unit!27776) )
))
(declare-fun lt!365343 () Unit!27775)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!299 (array!44773 array!44775 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24051 V!24051 V!24051 V!24051 (_ BitVec 32) Int) Unit!27775)

(assert (=> b!816196 (= lt!365343 (lemmaNoChangeToArrayThenSameMapNoExtras!299 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2211 (array!44773 array!44775 (_ BitVec 32) (_ BitVec 32) V!24051 V!24051 (_ BitVec 32) Int) ListLongMap!8177)

(assert (=> b!816196 (= lt!365344 (getCurrentListMapNoExtraKeys!2211 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816196 (= lt!365342 (getCurrentListMapNoExtraKeys!2211 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816197 () Bool)

(declare-fun res!557098 () Bool)

(assert (=> b!816197 (=> (not res!557098) (not e!452642))))

(assert (=> b!816197 (= res!557098 (and (= (size!21862 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21861 _keys!976) (size!21862 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816198 () Bool)

(assert (=> b!816198 (= e!452644 (and e!452643 mapRes!23014))))

(declare-fun condMapEmpty!23014 () Bool)

(declare-fun mapDefault!23014 () ValueCell!6728)

(assert (=> b!816198 (= condMapEmpty!23014 (= (arr!21442 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6728)) mapDefault!23014)))))

(assert (= (and start!70336 res!557099) b!816197))

(assert (= (and b!816197 res!557098) b!816195))

(assert (= (and b!816195 res!557096) b!816192))

(assert (= (and b!816192 res!557097) b!816196))

(assert (= (and b!816198 condMapEmpty!23014) mapIsEmpty!23014))

(assert (= (and b!816198 (not condMapEmpty!23014)) mapNonEmpty!23014))

(get-info :version)

(assert (= (and mapNonEmpty!23014 ((_ is ValueCellFull!6728) mapValue!23014)) b!816194))

(assert (= (and b!816198 ((_ is ValueCellFull!6728) mapDefault!23014)) b!816193))

(assert (= start!70336 b!816198))

(declare-fun m!758265 () Bool)

(assert (=> mapNonEmpty!23014 m!758265))

(declare-fun m!758267 () Bool)

(assert (=> b!816196 m!758267))

(declare-fun m!758269 () Bool)

(assert (=> b!816196 m!758269))

(declare-fun m!758271 () Bool)

(assert (=> b!816196 m!758271))

(declare-fun m!758273 () Bool)

(assert (=> b!816195 m!758273))

(declare-fun m!758275 () Bool)

(assert (=> b!816192 m!758275))

(declare-fun m!758277 () Bool)

(assert (=> start!70336 m!758277))

(declare-fun m!758279 () Bool)

(assert (=> start!70336 m!758279))

(declare-fun m!758281 () Bool)

(assert (=> start!70336 m!758281))

(check-sat (not b!816192) (not mapNonEmpty!23014) (not b!816195) (not b_next!12577) tp_is_empty!14287 (not start!70336) b_and!21367 (not b!816196))
(check-sat b_and!21367 (not b_next!12577))
