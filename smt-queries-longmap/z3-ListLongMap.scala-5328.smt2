; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71394 () Bool)

(assert start!71394)

(declare-fun b_free!13375 () Bool)

(declare-fun b_next!13375 () Bool)

(assert (=> start!71394 (= b_free!13375 (not b_next!13375))))

(declare-fun tp!46888 () Bool)

(declare-fun b_and!22323 () Bool)

(assert (=> start!71394 (= tp!46888 b_and!22323)))

(declare-fun b!828280 () Bool)

(declare-fun res!564291 () Bool)

(declare-fun e!461482 () Bool)

(assert (=> b!828280 (=> (not res!564291) (not e!461482))))

(declare-datatypes ((array!46349 0))(
  ( (array!46350 (arr!22214 (Array (_ BitVec 32) (_ BitVec 64))) (size!22634 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46349)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!25115 0))(
  ( (V!25116 (val!7590 Int)) )
))
(declare-datatypes ((ValueCell!7127 0))(
  ( (ValueCellFull!7127 (v!10025 V!25115)) (EmptyCell!7127) )
))
(declare-datatypes ((array!46351 0))(
  ( (array!46352 (arr!22215 (Array (_ BitVec 32) ValueCell!7127)) (size!22635 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46351)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!828280 (= res!564291 (and (= (size!22635 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22634 _keys!976) (size!22635 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!828281 () Bool)

(declare-fun e!461480 () Bool)

(declare-fun tp_is_empty!15085 () Bool)

(assert (=> b!828281 (= e!461480 tp_is_empty!15085)))

(declare-fun b!828282 () Bool)

(declare-fun res!564294 () Bool)

(assert (=> b!828282 (=> (not res!564294) (not e!461482))))

(declare-datatypes ((List!15762 0))(
  ( (Nil!15759) (Cons!15758 (h!16893 (_ BitVec 64)) (t!22103 List!15762)) )
))
(declare-fun arrayNoDuplicates!0 (array!46349 (_ BitVec 32) List!15762) Bool)

(assert (=> b!828282 (= res!564294 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15759))))

(declare-fun mapIsEmpty!24256 () Bool)

(declare-fun mapRes!24256 () Bool)

(assert (=> mapIsEmpty!24256 mapRes!24256))

(declare-fun mapNonEmpty!24256 () Bool)

(declare-fun tp!46887 () Bool)

(assert (=> mapNonEmpty!24256 (= mapRes!24256 (and tp!46887 e!461480))))

(declare-fun mapRest!24256 () (Array (_ BitVec 32) ValueCell!7127))

(declare-fun mapKey!24256 () (_ BitVec 32))

(declare-fun mapValue!24256 () ValueCell!7127)

(assert (=> mapNonEmpty!24256 (= (arr!22215 _values!788) (store mapRest!24256 mapKey!24256 mapValue!24256))))

(declare-fun b!828283 () Bool)

(declare-fun e!461481 () Bool)

(assert (=> b!828283 (= e!461481 tp_is_empty!15085)))

(declare-fun b!828285 () Bool)

(declare-fun e!461478 () Bool)

(assert (=> b!828285 (= e!461478 (and e!461481 mapRes!24256))))

(declare-fun condMapEmpty!24256 () Bool)

(declare-fun mapDefault!24256 () ValueCell!7127)

(assert (=> b!828285 (= condMapEmpty!24256 (= (arr!22215 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7127)) mapDefault!24256)))))

(declare-fun b!828286 () Bool)

(assert (=> b!828286 (= e!461482 false)))

(declare-datatypes ((tuple2!9988 0))(
  ( (tuple2!9989 (_1!5005 (_ BitVec 64)) (_2!5005 V!25115)) )
))
(declare-datatypes ((List!15763 0))(
  ( (Nil!15760) (Cons!15759 (h!16894 tuple2!9988) (t!22104 List!15763)) )
))
(declare-datatypes ((ListLongMap!8813 0))(
  ( (ListLongMap!8814 (toList!4422 List!15763)) )
))
(declare-fun lt!375244 () ListLongMap!8813)

(declare-fun zeroValueAfter!34 () V!25115)

(declare-fun minValue!754 () V!25115)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2499 (array!46349 array!46351 (_ BitVec 32) (_ BitVec 32) V!25115 V!25115 (_ BitVec 32) Int) ListLongMap!8813)

(assert (=> b!828286 (= lt!375244 (getCurrentListMapNoExtraKeys!2499 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25115)

(declare-fun lt!375245 () ListLongMap!8813)

(assert (=> b!828286 (= lt!375245 (getCurrentListMapNoExtraKeys!2499 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828284 () Bool)

(declare-fun res!564293 () Bool)

(assert (=> b!828284 (=> (not res!564293) (not e!461482))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46349 (_ BitVec 32)) Bool)

(assert (=> b!828284 (= res!564293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!564292 () Bool)

(assert (=> start!71394 (=> (not res!564292) (not e!461482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71394 (= res!564292 (validMask!0 mask!1312))))

(assert (=> start!71394 e!461482))

(assert (=> start!71394 tp_is_empty!15085))

(declare-fun array_inv!17745 (array!46349) Bool)

(assert (=> start!71394 (array_inv!17745 _keys!976)))

(assert (=> start!71394 true))

(declare-fun array_inv!17746 (array!46351) Bool)

(assert (=> start!71394 (and (array_inv!17746 _values!788) e!461478)))

(assert (=> start!71394 tp!46888))

(assert (= (and start!71394 res!564292) b!828280))

(assert (= (and b!828280 res!564291) b!828284))

(assert (= (and b!828284 res!564293) b!828282))

(assert (= (and b!828282 res!564294) b!828286))

(assert (= (and b!828285 condMapEmpty!24256) mapIsEmpty!24256))

(assert (= (and b!828285 (not condMapEmpty!24256)) mapNonEmpty!24256))

(get-info :version)

(assert (= (and mapNonEmpty!24256 ((_ is ValueCellFull!7127) mapValue!24256)) b!828281))

(assert (= (and b!828285 ((_ is ValueCellFull!7127) mapDefault!24256)) b!828283))

(assert (= start!71394 b!828285))

(declare-fun m!771761 () Bool)

(assert (=> b!828286 m!771761))

(declare-fun m!771763 () Bool)

(assert (=> b!828286 m!771763))

(declare-fun m!771765 () Bool)

(assert (=> b!828282 m!771765))

(declare-fun m!771767 () Bool)

(assert (=> b!828284 m!771767))

(declare-fun m!771769 () Bool)

(assert (=> mapNonEmpty!24256 m!771769))

(declare-fun m!771771 () Bool)

(assert (=> start!71394 m!771771))

(declare-fun m!771773 () Bool)

(assert (=> start!71394 m!771773))

(declare-fun m!771775 () Bool)

(assert (=> start!71394 m!771775))

(check-sat (not b!828282) b_and!22323 (not b_next!13375) tp_is_empty!15085 (not start!71394) (not b!828284) (not mapNonEmpty!24256) (not b!828286))
(check-sat b_and!22323 (not b_next!13375))
