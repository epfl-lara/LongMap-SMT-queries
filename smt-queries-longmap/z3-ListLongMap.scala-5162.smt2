; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69926 () Bool)

(assert start!69926)

(declare-fun b_free!12379 () Bool)

(declare-fun b_next!12379 () Bool)

(assert (=> start!69926 (= b_free!12379 (not b_next!12379))))

(declare-fun tp!43848 () Bool)

(declare-fun b_and!21121 () Bool)

(assert (=> start!69926 (= tp!43848 b_and!21121)))

(declare-fun res!555398 () Bool)

(declare-fun e!450329 () Bool)

(assert (=> start!69926 (=> (not res!555398) (not e!450329))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69926 (= res!555398 (validMask!0 mask!1312))))

(assert (=> start!69926 e!450329))

(declare-fun tp_is_empty!14089 () Bool)

(assert (=> start!69926 tp_is_empty!14089))

(declare-datatypes ((array!44395 0))(
  ( (array!44396 (arr!21259 (Array (_ BitVec 32) (_ BitVec 64))) (size!21680 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44395)

(declare-fun array_inv!17109 (array!44395) Bool)

(assert (=> start!69926 (array_inv!17109 _keys!976)))

(assert (=> start!69926 true))

(declare-datatypes ((V!23787 0))(
  ( (V!23788 (val!7092 Int)) )
))
(declare-datatypes ((ValueCell!6629 0))(
  ( (ValueCellFull!6629 (v!9513 V!23787)) (EmptyCell!6629) )
))
(declare-datatypes ((array!44397 0))(
  ( (array!44398 (arr!21260 (Array (_ BitVec 32) ValueCell!6629)) (size!21681 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44397)

(declare-fun e!450330 () Bool)

(declare-fun array_inv!17110 (array!44397) Bool)

(assert (=> start!69926 (and (array_inv!17110 _values!788) e!450330)))

(assert (=> start!69926 tp!43848))

(declare-fun b!812815 () Bool)

(declare-fun e!450328 () Bool)

(assert (=> b!812815 (= e!450328 tp_is_empty!14089)))

(declare-fun b!812816 () Bool)

(assert (=> b!812816 (= e!450329 false)))

(declare-datatypes ((tuple2!9338 0))(
  ( (tuple2!9339 (_1!4680 (_ BitVec 64)) (_2!4680 V!23787)) )
))
(declare-datatypes ((List!15160 0))(
  ( (Nil!15157) (Cons!15156 (h!16285 tuple2!9338) (t!21466 List!15160)) )
))
(declare-datatypes ((ListLongMap!8151 0))(
  ( (ListLongMap!8152 (toList!4091 List!15160)) )
))
(declare-fun lt!363987 () ListLongMap!8151)

(declare-fun zeroValueBefore!34 () V!23787)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!23787)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2156 (array!44395 array!44397 (_ BitVec 32) (_ BitVec 32) V!23787 V!23787 (_ BitVec 32) Int) ListLongMap!8151)

(assert (=> b!812816 (= lt!363987 (getCurrentListMapNoExtraKeys!2156 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!812817 () Bool)

(declare-fun res!555400 () Bool)

(assert (=> b!812817 (=> (not res!555400) (not e!450329))))

(declare-datatypes ((List!15161 0))(
  ( (Nil!15158) (Cons!15157 (h!16286 (_ BitVec 64)) (t!21467 List!15161)) )
))
(declare-fun arrayNoDuplicates!0 (array!44395 (_ BitVec 32) List!15161) Bool)

(assert (=> b!812817 (= res!555400 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15158))))

(declare-fun mapIsEmpty!22711 () Bool)

(declare-fun mapRes!22711 () Bool)

(assert (=> mapIsEmpty!22711 mapRes!22711))

(declare-fun b!812818 () Bool)

(declare-fun e!450326 () Bool)

(assert (=> b!812818 (= e!450330 (and e!450326 mapRes!22711))))

(declare-fun condMapEmpty!22711 () Bool)

(declare-fun mapDefault!22711 () ValueCell!6629)

(assert (=> b!812818 (= condMapEmpty!22711 (= (arr!21260 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6629)) mapDefault!22711)))))

(declare-fun mapNonEmpty!22711 () Bool)

(declare-fun tp!43849 () Bool)

(assert (=> mapNonEmpty!22711 (= mapRes!22711 (and tp!43849 e!450328))))

(declare-fun mapValue!22711 () ValueCell!6629)

(declare-fun mapRest!22711 () (Array (_ BitVec 32) ValueCell!6629))

(declare-fun mapKey!22711 () (_ BitVec 32))

(assert (=> mapNonEmpty!22711 (= (arr!21260 _values!788) (store mapRest!22711 mapKey!22711 mapValue!22711))))

(declare-fun b!812819 () Bool)

(assert (=> b!812819 (= e!450326 tp_is_empty!14089)))

(declare-fun b!812820 () Bool)

(declare-fun res!555401 () Bool)

(assert (=> b!812820 (=> (not res!555401) (not e!450329))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44395 (_ BitVec 32)) Bool)

(assert (=> b!812820 (= res!555401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812821 () Bool)

(declare-fun res!555399 () Bool)

(assert (=> b!812821 (=> (not res!555399) (not e!450329))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812821 (= res!555399 (and (= (size!21681 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21680 _keys!976) (size!21681 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!69926 res!555398) b!812821))

(assert (= (and b!812821 res!555399) b!812820))

(assert (= (and b!812820 res!555401) b!812817))

(assert (= (and b!812817 res!555400) b!812816))

(assert (= (and b!812818 condMapEmpty!22711) mapIsEmpty!22711))

(assert (= (and b!812818 (not condMapEmpty!22711)) mapNonEmpty!22711))

(get-info :version)

(assert (= (and mapNonEmpty!22711 ((_ is ValueCellFull!6629) mapValue!22711)) b!812815))

(assert (= (and b!812818 ((_ is ValueCellFull!6629) mapDefault!22711)) b!812819))

(assert (= start!69926 b!812818))

(declare-fun m!754477 () Bool)

(assert (=> start!69926 m!754477))

(declare-fun m!754479 () Bool)

(assert (=> start!69926 m!754479))

(declare-fun m!754481 () Bool)

(assert (=> start!69926 m!754481))

(declare-fun m!754483 () Bool)

(assert (=> mapNonEmpty!22711 m!754483))

(declare-fun m!754485 () Bool)

(assert (=> b!812816 m!754485))

(declare-fun m!754487 () Bool)

(assert (=> b!812820 m!754487))

(declare-fun m!754489 () Bool)

(assert (=> b!812817 m!754489))

(check-sat b_and!21121 (not mapNonEmpty!22711) (not b!812817) (not start!69926) tp_is_empty!14089 (not b!812816) (not b_next!12379) (not b!812820))
(check-sat b_and!21121 (not b_next!12379))
