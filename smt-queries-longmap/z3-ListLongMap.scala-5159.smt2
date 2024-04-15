; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69908 () Bool)

(assert start!69908)

(declare-fun b_free!12361 () Bool)

(declare-fun b_next!12361 () Bool)

(assert (=> start!69908 (= b_free!12361 (not b_next!12361))))

(declare-fun tp!43795 () Bool)

(declare-fun b_and!21103 () Bool)

(assert (=> start!69908 (= tp!43795 b_and!21103)))

(declare-fun b!812626 () Bool)

(declare-fun e!450191 () Bool)

(declare-fun tp_is_empty!14071 () Bool)

(assert (=> b!812626 (= e!450191 tp_is_empty!14071)))

(declare-fun b!812628 () Bool)

(declare-fun res!555291 () Bool)

(declare-fun e!450194 () Bool)

(assert (=> b!812628 (=> (not res!555291) (not e!450194))))

(declare-datatypes ((array!44363 0))(
  ( (array!44364 (arr!21243 (Array (_ BitVec 32) (_ BitVec 64))) (size!21664 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44363)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23763 0))(
  ( (V!23764 (val!7083 Int)) )
))
(declare-datatypes ((ValueCell!6620 0))(
  ( (ValueCellFull!6620 (v!9504 V!23763)) (EmptyCell!6620) )
))
(declare-datatypes ((array!44365 0))(
  ( (array!44366 (arr!21244 (Array (_ BitVec 32) ValueCell!6620)) (size!21665 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44365)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812628 (= res!555291 (and (= (size!21665 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21664 _keys!976) (size!21665 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!812629 () Bool)

(declare-fun e!450192 () Bool)

(declare-fun e!450195 () Bool)

(declare-fun mapRes!22684 () Bool)

(assert (=> b!812629 (= e!450192 (and e!450195 mapRes!22684))))

(declare-fun condMapEmpty!22684 () Bool)

(declare-fun mapDefault!22684 () ValueCell!6620)

(assert (=> b!812629 (= condMapEmpty!22684 (= (arr!21244 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6620)) mapDefault!22684)))))

(declare-fun b!812630 () Bool)

(declare-fun res!555290 () Bool)

(assert (=> b!812630 (=> (not res!555290) (not e!450194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44363 (_ BitVec 32)) Bool)

(assert (=> b!812630 (= res!555290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812631 () Bool)

(declare-fun res!555293 () Bool)

(assert (=> b!812631 (=> (not res!555293) (not e!450194))))

(declare-datatypes ((List!15150 0))(
  ( (Nil!15147) (Cons!15146 (h!16275 (_ BitVec 64)) (t!21456 List!15150)) )
))
(declare-fun arrayNoDuplicates!0 (array!44363 (_ BitVec 32) List!15150) Bool)

(assert (=> b!812631 (= res!555293 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15147))))

(declare-fun mapNonEmpty!22684 () Bool)

(declare-fun tp!43794 () Bool)

(assert (=> mapNonEmpty!22684 (= mapRes!22684 (and tp!43794 e!450191))))

(declare-fun mapRest!22684 () (Array (_ BitVec 32) ValueCell!6620))

(declare-fun mapValue!22684 () ValueCell!6620)

(declare-fun mapKey!22684 () (_ BitVec 32))

(assert (=> mapNonEmpty!22684 (= (arr!21244 _values!788) (store mapRest!22684 mapKey!22684 mapValue!22684))))

(declare-fun res!555292 () Bool)

(assert (=> start!69908 (=> (not res!555292) (not e!450194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69908 (= res!555292 (validMask!0 mask!1312))))

(assert (=> start!69908 e!450194))

(assert (=> start!69908 tp_is_empty!14071))

(declare-fun array_inv!17097 (array!44363) Bool)

(assert (=> start!69908 (array_inv!17097 _keys!976)))

(assert (=> start!69908 true))

(declare-fun array_inv!17098 (array!44365) Bool)

(assert (=> start!69908 (and (array_inv!17098 _values!788) e!450192)))

(assert (=> start!69908 tp!43795))

(declare-fun b!812627 () Bool)

(assert (=> b!812627 (= e!450194 false)))

(declare-fun zeroValueBefore!34 () V!23763)

(declare-datatypes ((tuple2!9328 0))(
  ( (tuple2!9329 (_1!4675 (_ BitVec 64)) (_2!4675 V!23763)) )
))
(declare-datatypes ((List!15151 0))(
  ( (Nil!15148) (Cons!15147 (h!16276 tuple2!9328) (t!21457 List!15151)) )
))
(declare-datatypes ((ListLongMap!8141 0))(
  ( (ListLongMap!8142 (toList!4086 List!15151)) )
))
(declare-fun lt!363960 () ListLongMap!8141)

(declare-fun defaultEntry!796 () Int)

(declare-fun minValue!754 () V!23763)

(declare-fun getCurrentListMapNoExtraKeys!2151 (array!44363 array!44365 (_ BitVec 32) (_ BitVec 32) V!23763 V!23763 (_ BitVec 32) Int) ListLongMap!8141)

(assert (=> b!812627 (= lt!363960 (getCurrentListMapNoExtraKeys!2151 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!812632 () Bool)

(assert (=> b!812632 (= e!450195 tp_is_empty!14071)))

(declare-fun mapIsEmpty!22684 () Bool)

(assert (=> mapIsEmpty!22684 mapRes!22684))

(assert (= (and start!69908 res!555292) b!812628))

(assert (= (and b!812628 res!555291) b!812630))

(assert (= (and b!812630 res!555290) b!812631))

(assert (= (and b!812631 res!555293) b!812627))

(assert (= (and b!812629 condMapEmpty!22684) mapIsEmpty!22684))

(assert (= (and b!812629 (not condMapEmpty!22684)) mapNonEmpty!22684))

(get-info :version)

(assert (= (and mapNonEmpty!22684 ((_ is ValueCellFull!6620) mapValue!22684)) b!812626))

(assert (= (and b!812629 ((_ is ValueCellFull!6620) mapDefault!22684)) b!812632))

(assert (= start!69908 b!812629))

(declare-fun m!754351 () Bool)

(assert (=> b!812627 m!754351))

(declare-fun m!754353 () Bool)

(assert (=> b!812631 m!754353))

(declare-fun m!754355 () Bool)

(assert (=> start!69908 m!754355))

(declare-fun m!754357 () Bool)

(assert (=> start!69908 m!754357))

(declare-fun m!754359 () Bool)

(assert (=> start!69908 m!754359))

(declare-fun m!754361 () Bool)

(assert (=> mapNonEmpty!22684 m!754361))

(declare-fun m!754363 () Bool)

(assert (=> b!812630 m!754363))

(check-sat (not b!812630) b_and!21103 (not b!812627) (not mapNonEmpty!22684) (not b_next!12361) (not start!69908) (not b!812631) tp_is_empty!14071)
(check-sat b_and!21103 (not b_next!12361))
