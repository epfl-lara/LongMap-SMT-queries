; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104526 () Bool)

(assert start!104526)

(declare-fun mapIsEmpty!48694 () Bool)

(declare-fun mapRes!48694 () Bool)

(assert (=> mapIsEmpty!48694 mapRes!48694))

(declare-fun mapNonEmpty!48694 () Bool)

(declare-fun tp!92795 () Bool)

(declare-fun e!707249 () Bool)

(assert (=> mapNonEmpty!48694 (= mapRes!48694 (and tp!92795 e!707249))))

(declare-fun mapKey!48694 () (_ BitVec 32))

(declare-datatypes ((V!47103 0))(
  ( (V!47104 (val!15714 Int)) )
))
(declare-datatypes ((ValueCell!14888 0))(
  ( (ValueCellFull!14888 (v!18408 V!47103)) (EmptyCell!14888) )
))
(declare-datatypes ((array!80219 0))(
  ( (array!80220 (arr!38684 (Array (_ BitVec 32) ValueCell!14888)) (size!39222 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80219)

(declare-fun mapRest!48694 () (Array (_ BitVec 32) ValueCell!14888))

(declare-fun mapValue!48694 () ValueCell!14888)

(assert (=> mapNonEmpty!48694 (= (arr!38684 _values!914) (store mapRest!48694 mapKey!48694 mapValue!48694))))

(declare-fun b!1246895 () Bool)

(declare-fun tp_is_empty!31303 () Bool)

(assert (=> b!1246895 (= e!707249 tp_is_empty!31303)))

(declare-fun res!832095 () Bool)

(declare-fun e!707250 () Bool)

(assert (=> start!104526 (=> (not res!832095) (not e!707250))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104526 (= res!832095 (validMask!0 mask!1466))))

(assert (=> start!104526 e!707250))

(assert (=> start!104526 true))

(declare-datatypes ((array!80221 0))(
  ( (array!80222 (arr!38685 (Array (_ BitVec 32) (_ BitVec 64))) (size!39223 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80221)

(declare-fun array_inv!29665 (array!80221) Bool)

(assert (=> start!104526 (array_inv!29665 _keys!1118)))

(declare-fun e!707251 () Bool)

(declare-fun array_inv!29666 (array!80219) Bool)

(assert (=> start!104526 (and (array_inv!29666 _values!914) e!707251)))

(declare-fun b!1246896 () Bool)

(declare-fun e!707252 () Bool)

(assert (=> b!1246896 (= e!707251 (and e!707252 mapRes!48694))))

(declare-fun condMapEmpty!48694 () Bool)

(declare-fun mapDefault!48694 () ValueCell!14888)

(assert (=> b!1246896 (= condMapEmpty!48694 (= (arr!38684 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14888)) mapDefault!48694)))))

(declare-fun b!1246897 () Bool)

(assert (=> b!1246897 (= e!707252 tp_is_empty!31303)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun b!1246898 () Bool)

(assert (=> b!1246898 (= e!707250 (and (= (size!39222 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39223 _keys!1118) (size!39222 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (size!39223 _keys!1118) (bvadd #b00000000000000000000000000000001 mask!1466)) (bvsgt #b00000000000000000000000000000000 (size!39223 _keys!1118))))))

(assert (= (and start!104526 res!832095) b!1246898))

(assert (= (and b!1246896 condMapEmpty!48694) mapIsEmpty!48694))

(assert (= (and b!1246896 (not condMapEmpty!48694)) mapNonEmpty!48694))

(get-info :version)

(assert (= (and mapNonEmpty!48694 ((_ is ValueCellFull!14888) mapValue!48694)) b!1246895))

(assert (= (and b!1246896 ((_ is ValueCellFull!14888) mapDefault!48694)) b!1246897))

(assert (= start!104526 b!1246896))

(declare-fun m!1148143 () Bool)

(assert (=> mapNonEmpty!48694 m!1148143))

(declare-fun m!1148145 () Bool)

(assert (=> start!104526 m!1148145))

(declare-fun m!1148147 () Bool)

(assert (=> start!104526 m!1148147))

(declare-fun m!1148149 () Bool)

(assert (=> start!104526 m!1148149))

(check-sat (not start!104526) (not mapNonEmpty!48694) tp_is_empty!31303)
(check-sat)
(get-model)

(declare-fun d!137581 () Bool)

(assert (=> d!137581 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!104526 d!137581))

(declare-fun d!137583 () Bool)

(assert (=> d!137583 (= (array_inv!29665 _keys!1118) (bvsge (size!39223 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!104526 d!137583))

(declare-fun d!137585 () Bool)

(assert (=> d!137585 (= (array_inv!29666 _values!914) (bvsge (size!39222 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!104526 d!137585))

(declare-fun condMapEmpty!48703 () Bool)

(declare-fun mapDefault!48703 () ValueCell!14888)

(assert (=> mapNonEmpty!48694 (= condMapEmpty!48703 (= mapRest!48694 ((as const (Array (_ BitVec 32) ValueCell!14888)) mapDefault!48703)))))

(declare-fun e!707287 () Bool)

(declare-fun mapRes!48703 () Bool)

(assert (=> mapNonEmpty!48694 (= tp!92795 (and e!707287 mapRes!48703))))

(declare-fun b!1246930 () Bool)

(assert (=> b!1246930 (= e!707287 tp_is_empty!31303)))

(declare-fun mapNonEmpty!48703 () Bool)

(declare-fun tp!92804 () Bool)

(declare-fun e!707288 () Bool)

(assert (=> mapNonEmpty!48703 (= mapRes!48703 (and tp!92804 e!707288))))

(declare-fun mapKey!48703 () (_ BitVec 32))

(declare-fun mapRest!48703 () (Array (_ BitVec 32) ValueCell!14888))

(declare-fun mapValue!48703 () ValueCell!14888)

(assert (=> mapNonEmpty!48703 (= mapRest!48694 (store mapRest!48703 mapKey!48703 mapValue!48703))))

(declare-fun mapIsEmpty!48703 () Bool)

(assert (=> mapIsEmpty!48703 mapRes!48703))

(declare-fun b!1246929 () Bool)

(assert (=> b!1246929 (= e!707288 tp_is_empty!31303)))

(assert (= (and mapNonEmpty!48694 condMapEmpty!48703) mapIsEmpty!48703))

(assert (= (and mapNonEmpty!48694 (not condMapEmpty!48703)) mapNonEmpty!48703))

(assert (= (and mapNonEmpty!48703 ((_ is ValueCellFull!14888) mapValue!48703)) b!1246929))

(assert (= (and mapNonEmpty!48694 ((_ is ValueCellFull!14888) mapDefault!48703)) b!1246930))

(declare-fun m!1148167 () Bool)

(assert (=> mapNonEmpty!48703 m!1148167))

(check-sat (not mapNonEmpty!48703) tp_is_empty!31303)
(check-sat)
