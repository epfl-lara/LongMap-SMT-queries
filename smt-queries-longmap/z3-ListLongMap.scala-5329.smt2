; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71400 () Bool)

(assert start!71400)

(declare-fun b_free!13381 () Bool)

(declare-fun b_next!13381 () Bool)

(assert (=> start!71400 (= b_free!13381 (not b_next!13381))))

(declare-fun tp!46905 () Bool)

(declare-fun b_and!22329 () Bool)

(assert (=> start!71400 (= tp!46905 b_and!22329)))

(declare-fun b!828343 () Bool)

(declare-fun e!461525 () Bool)

(declare-fun e!461524 () Bool)

(declare-fun mapRes!24265 () Bool)

(assert (=> b!828343 (= e!461525 (and e!461524 mapRes!24265))))

(declare-fun condMapEmpty!24265 () Bool)

(declare-datatypes ((V!25123 0))(
  ( (V!25124 (val!7593 Int)) )
))
(declare-datatypes ((ValueCell!7130 0))(
  ( (ValueCellFull!7130 (v!10028 V!25123)) (EmptyCell!7130) )
))
(declare-datatypes ((array!46361 0))(
  ( (array!46362 (arr!22220 (Array (_ BitVec 32) ValueCell!7130)) (size!22640 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46361)

(declare-fun mapDefault!24265 () ValueCell!7130)

(assert (=> b!828343 (= condMapEmpty!24265 (= (arr!22220 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7130)) mapDefault!24265)))))

(declare-fun b!828344 () Bool)

(declare-fun res!564327 () Bool)

(declare-fun e!461526 () Bool)

(assert (=> b!828344 (=> (not res!564327) (not e!461526))))

(declare-datatypes ((array!46363 0))(
  ( (array!46364 (arr!22221 (Array (_ BitVec 32) (_ BitVec 64))) (size!22641 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46363)

(declare-datatypes ((List!15767 0))(
  ( (Nil!15764) (Cons!15763 (h!16898 (_ BitVec 64)) (t!22108 List!15767)) )
))
(declare-fun arrayNoDuplicates!0 (array!46363 (_ BitVec 32) List!15767) Bool)

(assert (=> b!828344 (= res!564327 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15764))))

(declare-fun mapNonEmpty!24265 () Bool)

(declare-fun tp!46906 () Bool)

(declare-fun e!461523 () Bool)

(assert (=> mapNonEmpty!24265 (= mapRes!24265 (and tp!46906 e!461523))))

(declare-fun mapValue!24265 () ValueCell!7130)

(declare-fun mapRest!24265 () (Array (_ BitVec 32) ValueCell!7130))

(declare-fun mapKey!24265 () (_ BitVec 32))

(assert (=> mapNonEmpty!24265 (= (arr!22220 _values!788) (store mapRest!24265 mapKey!24265 mapValue!24265))))

(declare-fun b!828345 () Bool)

(declare-fun res!564329 () Bool)

(assert (=> b!828345 (=> (not res!564329) (not e!461526))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46363 (_ BitVec 32)) Bool)

(assert (=> b!828345 (= res!564329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!828346 () Bool)

(declare-fun tp_is_empty!15091 () Bool)

(assert (=> b!828346 (= e!461523 tp_is_empty!15091)))

(declare-fun b!828347 () Bool)

(assert (=> b!828347 (= e!461524 tp_is_empty!15091)))

(declare-fun mapIsEmpty!24265 () Bool)

(assert (=> mapIsEmpty!24265 mapRes!24265))

(declare-fun res!564328 () Bool)

(assert (=> start!71400 (=> (not res!564328) (not e!461526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71400 (= res!564328 (validMask!0 mask!1312))))

(assert (=> start!71400 e!461526))

(assert (=> start!71400 tp_is_empty!15091))

(declare-fun array_inv!17751 (array!46363) Bool)

(assert (=> start!71400 (array_inv!17751 _keys!976)))

(assert (=> start!71400 true))

(declare-fun array_inv!17752 (array!46361) Bool)

(assert (=> start!71400 (and (array_inv!17752 _values!788) e!461525)))

(assert (=> start!71400 tp!46905))

(declare-fun b!828348 () Bool)

(declare-fun res!564330 () Bool)

(assert (=> b!828348 (=> (not res!564330) (not e!461526))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!828348 (= res!564330 (and (= (size!22640 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22641 _keys!976) (size!22640 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!828349 () Bool)

(assert (=> b!828349 (= e!461526 false)))

(declare-datatypes ((tuple2!9992 0))(
  ( (tuple2!9993 (_1!5007 (_ BitVec 64)) (_2!5007 V!25123)) )
))
(declare-datatypes ((List!15768 0))(
  ( (Nil!15765) (Cons!15764 (h!16899 tuple2!9992) (t!22109 List!15768)) )
))
(declare-datatypes ((ListLongMap!8817 0))(
  ( (ListLongMap!8818 (toList!4424 List!15768)) )
))
(declare-fun lt!375263 () ListLongMap!8817)

(declare-fun zeroValueAfter!34 () V!25123)

(declare-fun minValue!754 () V!25123)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2501 (array!46363 array!46361 (_ BitVec 32) (_ BitVec 32) V!25123 V!25123 (_ BitVec 32) Int) ListLongMap!8817)

(assert (=> b!828349 (= lt!375263 (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25123)

(declare-fun lt!375262 () ListLongMap!8817)

(assert (=> b!828349 (= lt!375262 (getCurrentListMapNoExtraKeys!2501 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!71400 res!564328) b!828348))

(assert (= (and b!828348 res!564330) b!828345))

(assert (= (and b!828345 res!564329) b!828344))

(assert (= (and b!828344 res!564327) b!828349))

(assert (= (and b!828343 condMapEmpty!24265) mapIsEmpty!24265))

(assert (= (and b!828343 (not condMapEmpty!24265)) mapNonEmpty!24265))

(get-info :version)

(assert (= (and mapNonEmpty!24265 ((_ is ValueCellFull!7130) mapValue!24265)) b!828346))

(assert (= (and b!828343 ((_ is ValueCellFull!7130) mapDefault!24265)) b!828347))

(assert (= start!71400 b!828343))

(declare-fun m!771809 () Bool)

(assert (=> mapNonEmpty!24265 m!771809))

(declare-fun m!771811 () Bool)

(assert (=> b!828344 m!771811))

(declare-fun m!771813 () Bool)

(assert (=> b!828345 m!771813))

(declare-fun m!771815 () Bool)

(assert (=> start!71400 m!771815))

(declare-fun m!771817 () Bool)

(assert (=> start!71400 m!771817))

(declare-fun m!771819 () Bool)

(assert (=> start!71400 m!771819))

(declare-fun m!771821 () Bool)

(assert (=> b!828349 m!771821))

(declare-fun m!771823 () Bool)

(assert (=> b!828349 m!771823))

(check-sat (not b!828349) b_and!22329 (not mapNonEmpty!24265) tp_is_empty!15091 (not b!828345) (not b_next!13381) (not b!828344) (not start!71400))
(check-sat b_and!22329 (not b_next!13381))
