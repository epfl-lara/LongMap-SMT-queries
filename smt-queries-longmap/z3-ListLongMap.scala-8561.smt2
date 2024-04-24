; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104754 () Bool)

(assert start!104754)

(declare-fun b!1248282 () Bool)

(declare-fun e!708142 () Bool)

(declare-fun e!708143 () Bool)

(declare-fun mapRes!48694 () Bool)

(assert (=> b!1248282 (= e!708142 (and e!708143 mapRes!48694))))

(declare-fun condMapEmpty!48694 () Bool)

(declare-datatypes ((V!47103 0))(
  ( (V!47104 (val!15714 Int)) )
))
(declare-datatypes ((ValueCell!14888 0))(
  ( (ValueCellFull!14888 (v!18405 V!47103)) (EmptyCell!14888) )
))
(declare-datatypes ((array!80331 0))(
  ( (array!80332 (arr!38735 (Array (_ BitVec 32) ValueCell!14888)) (size!39272 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80331)

(declare-fun mapDefault!48694 () ValueCell!14888)

(assert (=> b!1248282 (= condMapEmpty!48694 (= (arr!38735 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14888)) mapDefault!48694)))))

(declare-fun res!832655 () Bool)

(declare-fun e!708140 () Bool)

(assert (=> start!104754 (=> (not res!832655) (not e!708140))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104754 (= res!832655 (validMask!0 mask!1466))))

(assert (=> start!104754 e!708140))

(assert (=> start!104754 true))

(declare-datatypes ((array!80333 0))(
  ( (array!80334 (arr!38736 (Array (_ BitVec 32) (_ BitVec 64))) (size!39273 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80333)

(declare-fun array_inv!29671 (array!80333) Bool)

(assert (=> start!104754 (array_inv!29671 _keys!1118)))

(declare-fun array_inv!29672 (array!80331) Bool)

(assert (=> start!104754 (and (array_inv!29672 _values!914) e!708142)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun b!1248283 () Bool)

(assert (=> b!1248283 (= e!708140 (and (= (size!39272 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39273 _keys!1118) (size!39272 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (size!39273 _keys!1118) (bvadd #b00000000000000000000000000000001 mask!1466)) (bvsgt #b00000000000000000000000000000000 (size!39273 _keys!1118))))))

(declare-fun mapNonEmpty!48694 () Bool)

(declare-fun tp!92795 () Bool)

(declare-fun e!708141 () Bool)

(assert (=> mapNonEmpty!48694 (= mapRes!48694 (and tp!92795 e!708141))))

(declare-fun mapRest!48694 () (Array (_ BitVec 32) ValueCell!14888))

(declare-fun mapKey!48694 () (_ BitVec 32))

(declare-fun mapValue!48694 () ValueCell!14888)

(assert (=> mapNonEmpty!48694 (= (arr!38735 _values!914) (store mapRest!48694 mapKey!48694 mapValue!48694))))

(declare-fun mapIsEmpty!48694 () Bool)

(assert (=> mapIsEmpty!48694 mapRes!48694))

(declare-fun b!1248284 () Bool)

(declare-fun tp_is_empty!31303 () Bool)

(assert (=> b!1248284 (= e!708143 tp_is_empty!31303)))

(declare-fun b!1248285 () Bool)

(assert (=> b!1248285 (= e!708141 tp_is_empty!31303)))

(assert (= (and start!104754 res!832655) b!1248283))

(assert (= (and b!1248282 condMapEmpty!48694) mapIsEmpty!48694))

(assert (= (and b!1248282 (not condMapEmpty!48694)) mapNonEmpty!48694))

(get-info :version)

(assert (= (and mapNonEmpty!48694 ((_ is ValueCellFull!14888) mapValue!48694)) b!1248285))

(assert (= (and b!1248282 ((_ is ValueCellFull!14888) mapDefault!48694)) b!1248284))

(assert (= start!104754 b!1248282))

(declare-fun m!1150275 () Bool)

(assert (=> start!104754 m!1150275))

(declare-fun m!1150277 () Bool)

(assert (=> start!104754 m!1150277))

(declare-fun m!1150279 () Bool)

(assert (=> start!104754 m!1150279))

(declare-fun m!1150281 () Bool)

(assert (=> mapNonEmpty!48694 m!1150281))

(check-sat (not start!104754) (not mapNonEmpty!48694) tp_is_empty!31303)
(check-sat)
(get-model)

(declare-fun d!138161 () Bool)

(assert (=> d!138161 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!104754 d!138161))

(declare-fun d!138163 () Bool)

(assert (=> d!138163 (= (array_inv!29671 _keys!1118) (bvsge (size!39273 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!104754 d!138163))

(declare-fun d!138165 () Bool)

(assert (=> d!138165 (= (array_inv!29672 _values!914) (bvsge (size!39272 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!104754 d!138165))

(declare-fun mapIsEmpty!48703 () Bool)

(declare-fun mapRes!48703 () Bool)

(assert (=> mapIsEmpty!48703 mapRes!48703))

(declare-fun condMapEmpty!48703 () Bool)

(declare-fun mapDefault!48703 () ValueCell!14888)

(assert (=> mapNonEmpty!48694 (= condMapEmpty!48703 (= mapRest!48694 ((as const (Array (_ BitVec 32) ValueCell!14888)) mapDefault!48703)))))

(declare-fun e!708180 () Bool)

(assert (=> mapNonEmpty!48694 (= tp!92795 (and e!708180 mapRes!48703))))

(declare-fun b!1248317 () Bool)

(assert (=> b!1248317 (= e!708180 tp_is_empty!31303)))

(declare-fun b!1248316 () Bool)

(declare-fun e!708179 () Bool)

(assert (=> b!1248316 (= e!708179 tp_is_empty!31303)))

(declare-fun mapNonEmpty!48703 () Bool)

(declare-fun tp!92804 () Bool)

(assert (=> mapNonEmpty!48703 (= mapRes!48703 (and tp!92804 e!708179))))

(declare-fun mapKey!48703 () (_ BitVec 32))

(declare-fun mapRest!48703 () (Array (_ BitVec 32) ValueCell!14888))

(declare-fun mapValue!48703 () ValueCell!14888)

(assert (=> mapNonEmpty!48703 (= mapRest!48694 (store mapRest!48703 mapKey!48703 mapValue!48703))))

(assert (= (and mapNonEmpty!48694 condMapEmpty!48703) mapIsEmpty!48703))

(assert (= (and mapNonEmpty!48694 (not condMapEmpty!48703)) mapNonEmpty!48703))

(assert (= (and mapNonEmpty!48703 ((_ is ValueCellFull!14888) mapValue!48703)) b!1248316))

(assert (= (and mapNonEmpty!48694 ((_ is ValueCellFull!14888) mapDefault!48703)) b!1248317))

(declare-fun m!1150299 () Bool)

(assert (=> mapNonEmpty!48703 m!1150299))

(check-sat (not mapNonEmpty!48703) tp_is_empty!31303)
(check-sat)
