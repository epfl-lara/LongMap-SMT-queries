; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69948 () Bool)

(assert start!69948)

(declare-fun b_free!12381 () Bool)

(declare-fun b_next!12381 () Bool)

(assert (=> start!69948 (= b_free!12381 (not b_next!12381))))

(declare-fun tp!43855 () Bool)

(declare-fun b_and!21149 () Bool)

(assert (=> start!69948 (= tp!43855 b_and!21149)))

(declare-fun b!813082 () Bool)

(declare-fun res!555517 () Bool)

(declare-fun e!450491 () Bool)

(assert (=> b!813082 (=> (not res!555517) (not e!450491))))

(declare-datatypes ((array!44394 0))(
  ( (array!44395 (arr!21258 (Array (_ BitVec 32) (_ BitVec 64))) (size!21679 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44394)

(declare-datatypes ((List!15120 0))(
  ( (Nil!15117) (Cons!15116 (h!16245 (_ BitVec 64)) (t!21435 List!15120)) )
))
(declare-fun arrayNoDuplicates!0 (array!44394 (_ BitVec 32) List!15120) Bool)

(assert (=> b!813082 (= res!555517 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15117))))

(declare-fun b!813083 () Bool)

(declare-fun e!450494 () Bool)

(declare-fun tp_is_empty!14091 () Bool)

(assert (=> b!813083 (= e!450494 tp_is_empty!14091)))

(declare-fun res!555519 () Bool)

(assert (=> start!69948 (=> (not res!555519) (not e!450491))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69948 (= res!555519 (validMask!0 mask!1312))))

(assert (=> start!69948 e!450491))

(assert (=> start!69948 tp_is_empty!14091))

(declare-fun array_inv!17025 (array!44394) Bool)

(assert (=> start!69948 (array_inv!17025 _keys!976)))

(assert (=> start!69948 true))

(declare-datatypes ((V!23789 0))(
  ( (V!23790 (val!7093 Int)) )
))
(declare-datatypes ((ValueCell!6630 0))(
  ( (ValueCellFull!6630 (v!9520 V!23789)) (EmptyCell!6630) )
))
(declare-datatypes ((array!44396 0))(
  ( (array!44397 (arr!21259 (Array (_ BitVec 32) ValueCell!6630)) (size!21680 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44396)

(declare-fun e!450493 () Bool)

(declare-fun array_inv!17026 (array!44396) Bool)

(assert (=> start!69948 (and (array_inv!17026 _values!788) e!450493)))

(assert (=> start!69948 tp!43855))

(declare-fun b!813084 () Bool)

(assert (=> b!813084 (= e!450491 false)))

(declare-fun zeroValueBefore!34 () V!23789)

(declare-datatypes ((tuple2!9290 0))(
  ( (tuple2!9291 (_1!4656 (_ BitVec 64)) (_2!4656 V!23789)) )
))
(declare-datatypes ((List!15121 0))(
  ( (Nil!15118) (Cons!15117 (h!16246 tuple2!9290) (t!21436 List!15121)) )
))
(declare-datatypes ((ListLongMap!8113 0))(
  ( (ListLongMap!8114 (toList!4072 List!15121)) )
))
(declare-fun lt!364233 () ListLongMap!8113)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!23789)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2122 (array!44394 array!44396 (_ BitVec 32) (_ BitVec 32) V!23789 V!23789 (_ BitVec 32) Int) ListLongMap!8113)

(assert (=> b!813084 (= lt!364233 (getCurrentListMapNoExtraKeys!2122 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!22714 () Bool)

(declare-fun mapRes!22714 () Bool)

(declare-fun tp!43854 () Bool)

(assert (=> mapNonEmpty!22714 (= mapRes!22714 (and tp!43854 e!450494))))

(declare-fun mapRest!22714 () (Array (_ BitVec 32) ValueCell!6630))

(declare-fun mapKey!22714 () (_ BitVec 32))

(declare-fun mapValue!22714 () ValueCell!6630)

(assert (=> mapNonEmpty!22714 (= (arr!21259 _values!788) (store mapRest!22714 mapKey!22714 mapValue!22714))))

(declare-fun b!813085 () Bool)

(declare-fun e!450492 () Bool)

(assert (=> b!813085 (= e!450493 (and e!450492 mapRes!22714))))

(declare-fun condMapEmpty!22714 () Bool)

(declare-fun mapDefault!22714 () ValueCell!6630)

(assert (=> b!813085 (= condMapEmpty!22714 (= (arr!21259 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6630)) mapDefault!22714)))))

(declare-fun b!813086 () Bool)

(assert (=> b!813086 (= e!450492 tp_is_empty!14091)))

(declare-fun mapIsEmpty!22714 () Bool)

(assert (=> mapIsEmpty!22714 mapRes!22714))

(declare-fun b!813087 () Bool)

(declare-fun res!555518 () Bool)

(assert (=> b!813087 (=> (not res!555518) (not e!450491))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813087 (= res!555518 (and (= (size!21680 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21679 _keys!976) (size!21680 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813088 () Bool)

(declare-fun res!555516 () Bool)

(assert (=> b!813088 (=> (not res!555516) (not e!450491))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44394 (_ BitVec 32)) Bool)

(assert (=> b!813088 (= res!555516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!69948 res!555519) b!813087))

(assert (= (and b!813087 res!555518) b!813088))

(assert (= (and b!813088 res!555516) b!813082))

(assert (= (and b!813082 res!555517) b!813084))

(assert (= (and b!813085 condMapEmpty!22714) mapIsEmpty!22714))

(assert (= (and b!813085 (not condMapEmpty!22714)) mapNonEmpty!22714))

(get-info :version)

(assert (= (and mapNonEmpty!22714 ((_ is ValueCellFull!6630) mapValue!22714)) b!813083))

(assert (= (and b!813085 ((_ is ValueCellFull!6630) mapDefault!22714)) b!813086))

(assert (= start!69948 b!813085))

(declare-fun m!755243 () Bool)

(assert (=> mapNonEmpty!22714 m!755243))

(declare-fun m!755245 () Bool)

(assert (=> b!813082 m!755245))

(declare-fun m!755247 () Bool)

(assert (=> b!813084 m!755247))

(declare-fun m!755249 () Bool)

(assert (=> start!69948 m!755249))

(declare-fun m!755251 () Bool)

(assert (=> start!69948 m!755251))

(declare-fun m!755253 () Bool)

(assert (=> start!69948 m!755253))

(declare-fun m!755255 () Bool)

(assert (=> b!813088 m!755255))

(check-sat b_and!21149 (not b!813088) (not start!69948) tp_is_empty!14091 (not mapNonEmpty!22714) (not b_next!12381) (not b!813084) (not b!813082))
(check-sat b_and!21149 (not b_next!12381))
